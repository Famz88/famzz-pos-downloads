# Publish v1.0.4

The Windows installer has passed GitHub Actions. Publish this unsigned preview using the script below. A code-signing certificate is not required.

## Existing publishing checkout

In your Windows PowerShell window:

```powershell
cd C:\Users\Fahmy\famzz-release-publish
git pull --ff-only
powershell -NoProfile -ExecutionPolicy Bypass -File .\Publish-1.0.4.ps1
```

If GitHub asks for authentication, run `gh auth login` and sign in as the account with access to the private build repository and the public downloads repository. The execution-policy option applies only to this PowerShell process.

## First-time setup

Install [GitHub CLI](https://cli.github.com/), reopen PowerShell, run `gh auth login`, then clone this repository with `gh repo clone Famz88/famzz-pos-downloads famzz-release-publish`. Enter that folder and run the publishing script.

## What the script does

It downloads the specific successful v1.0.4 build, checks the installer checksum, creates or resumes its own draft, uploads only the EXE and checksum, verifies the uploaded assets, and publishes the preview. Draft verification uses its numeric release ID to avoid the previous HTTP 404 from looking up an unpublished tag. Existing published releases are not overwritten.

After success, open [v1.0.4](https://github.com/Famz88/famzz-pos-downloads/releases/tag/v1.0.4) and check the installer and checksum under Assets. Until then, v1.0.4 is not publicly downloadable.

## Manual alternative

Download and extract the artifact from [the successful build](https://github.com/Famz88/famzz-pos/actions/runs/34838074676). Create a release tagged `v1.0.4`, copy [the release notes](RELEASE-1.0.4.md), select pre-release, and attach `FamZz-POS-Setup-1.0.4-x64.exe` and `SHA256SUMS.txt` in the separate binary attachment area. Publish only after both uploads finish. Do not use the repository file uploader.

Never attach private source, customer data or the license issuer key.
