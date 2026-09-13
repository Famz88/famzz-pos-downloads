# Publish v1.0.3 from your Windows PC

The build exists in GitHub Actions, but a workflow artifact is not a public GitHub Release. The repository previously had only an empty, untagged draft.

## Automated publishing

1. Install [GitHub CLI](https://cli.github.com/) if needed. In PowerShell: `winget install --id GitHub.cli --exact`. Close and reopen PowerShell afterward.
2. Run `gh auth login`, select GitHub.com and browser authentication, and sign in as the account that can read the private source repository and write the public downloads repository.
3. Run:

```powershell
gh repo clone Famz88/famzz-pos-downloads famzz-release-publish
cd famzz-release-publish
powershell -NoProfile -ExecutionPolicy Bypass -File .\Publish-1.0.3.ps1
```

Read the script before running it. The execution-policy option applies to that process only. No signing certificate or GitHub token should be pasted into chat or committed.

The script fetches the specific successful Windows build, checks its installer checksum, creates a draft v1.0.3 preview release, uploads only the installer and checksum, verifies the assets, then publishes it. It can resume its own draft after an interrupted upload. It refuses to overwrite a published v1.0.3 or an unrelated draft. The older empty draft remains untouched.

The installer is unsigned, and six dependency advisory entries remain. The release is marked as a preview. See [release notes](RELEASE-1.0.3.md).

## Manual alternative

Download the artifact from [Windows build](https://github.com/Famz88/famzz-pos/actions/runs/34756138167) while signed in, and extract it. Open [New release](https://github.com/Famz88/famzz-pos-downloads/releases/new), use tag `v1.0.3`, copy the release notes, and attach both `FamZz-POS-Setup-1.0.3-x64.exe` and `SHA256SUMS.txt` in the binary attachment area. Select pre-release and publish after both uploads complete. Do not use the repository file uploader or put the binary in the description editor.

The automatic source-code ZIP contains documentation only. Never upload private source, customer data or the license issuer key.
