$ErrorActionPreference = 'Stop'
function Invoke-Gh {
  param([string[]]$Arguments)
  & gh @Arguments
  if ($LASTEXITCODE -ne 0) { throw "GitHub command failed: $($Arguments -join ' ')" }
}
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
  throw 'Install GitHub CLI from https://cli.github.com/ then run: gh auth login'
}
Invoke-Gh -Arguments @('auth','status')
$sourceRepo = 'Famz88/famzz-pos'
$targetRepo = 'Famz88/famzz-pos-downloads'
$runId = '35064933126'
$tag = 'v1.0.5'
$work = Join-Path ([IO.Path]::GetTempPath()) ('famzz-publish-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $work | Out-Null
Invoke-Gh -Arguments @('api',"repos/$targetRepo",'--jq','.full_name')
$run = (Invoke-Gh -Arguments @('api',"repos/$sourceRepo/actions/runs/$runId")) | ConvertFrom-Json
if ($run.conclusion -ne 'success' -or $run.head_sha -ne '783c8a962e3ac374385ead21eae3408da95b8454') {
  throw 'Unexpected build identity or unsuccessful build.'
}
Invoke-Gh -Arguments @('run','download',$runId,'--repo',$sourceRepo,'--name','FamZz-POS-Windows-x64','--dir',$work)
$exe = Join-Path $work 'FamZz-POS-Setup-1.0.5-x64.exe'
$sums = Join-Path $work 'SHA256SUMS.txt'
$expected = $null
foreach ($line in (Get-Content $sums)) {
  if ($line -match '^([a-fA-F0-9]{64})\s+\*?FamZz-POS-Setup-1\.0\.5-x64\.exe$') { $expected = $Matches[1] }
}
if (-not $expected -or (Get-FileHash $exe -Algorithm SHA256).Hash -ne $expected) { throw 'Installer checksum verification failed.' }
$notes = Join-Path $work 'release-notes.md'
@'
## FamZz POS v1.0.5
- KOT-first checkout: print, confirm the printout, select payment, and settle.
- Order Summary shows the current date in the restaurant timezone.
- Manual day close and automatic catch-up in an online manager session.
- Unfinished orders and open shifts require reconciliation before closing.
- Fix repeated day-close validation.
Windows x64 installer, unsigned. SHA256SUMS.txt verifies the download.
'@ | Set-Content -Encoding UTF8 $notes
$releases = (Invoke-Gh -Arguments @('release','list','--repo',$targetRepo,'--limit','100','--json','tagName')) | ConvertFrom-Json
if ($releases.tagName -contains $tag) { throw 'v1.0.5 already exists. Inspect it before replacing any assets.' }
Invoke-Gh -Arguments @('release','create',$tag,$exe,$sums,'--repo',$targetRepo,'--title','FamZz POS v1.0.5','--notes-file',$notes,'--draft')
Invoke-Gh -Arguments @('release','edit',$tag,'--repo',$targetRepo,'--draft=false','--latest')
Write-Host "Published: https://github.com/$targetRepo/releases/tag/$tag"
