# Publish the Windows installer

The v1.0.2 installer is approximately 106 MiB. GitHub's repository browser uploader accepts up to 25 MiB per file, while each Release attachment can be under 2 GiB. This installer belongs in a Release and does not need to be split.

## Publish v1.0.2

1. Extract the prepared FamZz-POS-Public-Release-1.0.2.zip on your PC.
2. Open [Releases](https://github.com/Famz88/famzz-pos-downloads/releases). If v1.0.2 already exists as a draft or incomplete release, edit that entry. Otherwise open [New release](https://github.com/Famz88/famzz-pos-downloads/releases/new).
3. Select or create tag `v1.0.2`, targeting `main`. Use title `FamZz POS 1.0.2 for Windows`.
4. Copy the v1.0.2 notes from [CHANGELOG.md](CHANGELOG.md) into the release description. State that the installer is unsigned and should be tested on the intended till before production use.
5. Below the release description, locate the separate binary attachment area. Select BOTH files from the extracted `release-assets` folder: `FamZz-POS-Setup-1.0.2-x64.exe` and `SHA256SUMS.txt`. Do not drop the installer into the description editor or use the repository's Add file / Upload files page.
6. Wait until both uploads have completed, then click Publish release (or Update release for an existing editable release).
7. Open the published release and confirm that its Assets section lists the installer and checksum. GitHub's automatic Source code ZIP contains only this repository's documentation; it is not the installer.

If the existing release is immutable, GitHub prevents changing its assets after publication. Do not delete it to work around that protection; prepare a new version instead.

## Integrity

Verified v1.0.2 installer SHA-256:

```text
5fce71bbdab0ae92fc1c36ec656ad1be12adff166cc6c9ca28aa9488d7633c11
```

Run in the download folder:

```powershell
Get-FileHash .\FamZz-POS-Setup-1.0.2-x64.exe -Algorithm SHA256
```

Keep the private development project, signing-key kit, customer databases and credentials out of this public repository and its release attachments.

References: [Repository upload limits](https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository), [Release asset limits](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases), [Managing releases](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository).
