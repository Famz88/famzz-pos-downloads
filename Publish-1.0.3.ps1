# Publishes only the verified installer and checksum; never uploads source or keys.
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
if (!(Get-Command gh -ErrorAction SilentlyContinue)) { throw 'Install GitHub CLI, reopen PowerShell, and run gh auth login first.' }
function Run-Gh {
  param([string[]]$Arguments)
  $output = & gh @Arguments
  if ($LASTEXITCODE -ne 0) { throw "GitHub command failed: $($Arguments[0])" }
  return $output
}
$sourceRepo = 'Famz88/famzz-pos'
$publicRepo = 'Famz88/famzz-pos-downloads'
$tag = 'v1.0.3'
$runId = '34756138167'
$expectedSha = 'd202fe672eceaca180b0f034a1ad65bcaa3c371b'
$notes = Join-Path $PSScriptRoot 'RELEASE-1.0.3.md'
if (!(Test-Path $notes)) { throw 'Keep RELEASE-1.0.3.md next to this script.' }
$run = (Run-Gh -Arguments @('api', "repos/$sourceRepo/actions/runs/$runId")) | ConvertFrom-Json
if ($run.conclusion -ne 'success' -or $run.head_sha -ne $expectedSha) { throw 'Expected successful build was not found.' }
$folder = Join-Path ([IO.Path]::GetTempPath()) ('FamZz-release-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $folder | Out-Null
try {
  Run-Gh -Arguments @('run','download',$runId,'--repo',$sourceRepo,'--name','FamZz-POS-Windows-x64','--dir',$folder) | Out-Null
  $exe = Join-Path $folder 'FamZz-POS-Setup-1.0.3-x64.exe'
  $sums = Join-Path $folder 'SHA256SUMS.txt'
  $line = (Get-Content $sums -Raw).Trim()
  if ($line -notmatch '^([a-fA-F0-9]{64})\s+\*?FamZz-POS-Setup-1\.0\.3-x64\.exe$') { throw 'Unexpected checksum file.' }
  $expectedHash = $Matches[1]
  if ((Get-FileHash $exe -Algorithm SHA256).Hash -ne $expectedHash) { throw 'Installer checksum mismatch.' }
  # Paginate rather than mistaking an old release for a missing release.
  $releases = ((Run-Gh -Arguments @('api',"repos/$publicRepo/releases",'--paginate','--slurp')) | ConvertFrom-Json)
  $existing = @($releases | ForEach-Object { $_ } | Where-Object { $_.tag_name -eq $tag })
  if ($existing.Count -gt 0) {
    if (!$existing[0].draft) { throw 'v1.0.3 is already published. It was not changed.' }
    if ($existing[0].body -notlike "*$expectedSha*") { throw 'Existing draft has different provenance. Review it manually.' }
  } else {
    Run-Gh -Arguments @('release','create',$tag,'--repo',$publicRepo,'--target','main','--title','FamZz POS 1.0.3 - Windows x64 preview (unsigned)','--notes-file',$notes,'--draft','--prerelease') | Out-Null
  }
  Run-Gh -Arguments @('release','upload',$tag,$exe,$sums,'--repo',$publicRepo,'--clobber') | Out-Null
  $release = (Run-Gh -Arguments @('api',"repos/$publicRepo/releases/tags/$tag")) | ConvertFrom-Json
  $asset = @($release.assets | Where-Object { $_.name -eq 'FamZz-POS-Setup-1.0.3-x64.exe' })
  $checksumAsset = @($release.assets | Where-Object { $_.name -eq 'SHA256SUMS.txt' })
  if ($asset.Count -ne 1 -or $checksumAsset.Count -ne 1 -or $asset[0].size -ne (Get-Item $exe).Length) { throw 'Uploaded release assets failed verification. Draft remains unpublished.' }
  Run-Gh -Arguments @('release','edit',$tag,'--repo',$publicRepo,'--draft=false','--prerelease') | Out-Null
  Write-Host "Published: https://github.com/$publicRepo/releases/tag/$tag"
} finally {
  Remove-Item -LiteralPath $folder -Recurse -Force
}
