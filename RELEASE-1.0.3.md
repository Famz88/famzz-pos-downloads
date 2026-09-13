# FamZz POS 1.0.3 — Windows x64 preview

This installer is **unsigned**. Windows may display an unknown-publisher warning. Trusted certificate signing and clean-PC installation/upgrade testing remain pending.

## Changes
- Added bounded API request and integration response handling.
- Hardened desktop integration DNS/address checks.
- Cleared the previous desktop session when an account-switch login fails.
- Updated dependencies and prepared certificate-based Windows signing.

## Validation and known issues
Hosted and desktop production builds and 37 regression tests passed. Windows installer packaging passed.
The shared dependency audit decreased from 24 entries to 6: **2 high and 4 moderate remain**. No critical entries remain in that audit. This is not a vulnerability-free certification.
Remaining findings concern the framework image-parser and legacy development-tool dependency chains.

Target: Windows 10/11 x64. Windows 7/8/8.1 are unsupported; ARM64 and Windows Server are not validated.
Back up your current installation before upgrading and test on your intended till.

Download the EXE and SHA256SUMS.txt under Assets. The automatic source-code ZIP contains public documentation, not the POS application.
Annual license activation is still required after the trial. License-file signing is separate from Windows installer signing.

Build source: d202fe672eceaca180b0f034a1ad65bcaa3c371b
Build run: 34756138167
