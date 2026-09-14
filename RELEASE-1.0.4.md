# FamZz POS 1.0.4 — Windows x64 preview (unsigned)

This release is intentionally **unsigned**. No code-signing certificate is required to publish this edition. Windows may show an unknown-publisher warning.

## Security changes
- Removed the vulnerable image-parser dependency by upgrading the hosted framework.
- Updated the database tooling's affected esbuild dependency.
- Non-admin responses no longer include the staff directory or role configuration.
- Staff saves preserve hidden administrator records and reject injected user/role changes.
- Added dependency-audit gates to Windows CI.

Both npm dependency audits reported **zero known vulnerabilities** at build time. This is not a guarantee that all application or infrastructure vulnerabilities have been eliminated.

## Validation
- Windows installer build, both dependency-audit gates, TypeScript and 38 regression tests passed.
- Hosted and desktop production builds passed locally.
- Hosted rendering and temporary database-schema generation checks passed.

## Compatibility and limitations
Windows 10/11 x64. Windows 7/8/8.1 are unsupported. ARM64 and Windows Server have not been validated.
Back up before upgrading. Clean-PC installation/upgrade, printers and live SAP interoperability still need testing.
The hosted framework upgrade is a prerelease migration; live hosted integration testing remains pending.
Further production hardening includes device authentication, broader data-access boundaries and local data protection.
The Windows installer does not update the online POS and does not add mobile support.

## Download
Download the installer and SHA256SUMS.txt from Assets. Compare the SHA-256 checksum before installation. The automatic source-code archives contain documentation, not the installer.
Company license activation remains separate and is still required after the trial.

Build source: bf495b6bb9dd06dea7f0b64b203ff354abd5f3b6
Build run: 34838074676
