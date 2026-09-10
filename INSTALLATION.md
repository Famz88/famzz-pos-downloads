# Installation and first setup

## Install

1. Download `FamZz-POS-Setup-1.0.2-x64.exe` and `SHA256SUMS.txt` from the same release.
2. In PowerShell, check the downloaded file:

   ```powershell
   Get-FileHash .\FamZz-POS-Setup-1.0.2-x64.exe -Algorithm SHA256
   ```

   Compare the hash with `SHA256SUMS.txt`. If it differs, discard the download and obtain the correct file.
3. Run the installer from your Windows account. Choose the installation location and desktop shortcut.
4. Open **FamZz POS**. Enter your company name, an owner email and a unique password of at least 12 characters. This creates a local account and starts a 14-day evaluation. No email is sent.
5. Keep the owner password safely. The desktop edition has no email password recovery.

The application includes its runtime and SQLite database; internet is not needed for first setup or normal local POS operations. The current installer is unsigned; Windows may show an unknown publisher.

## Configure the till

Review the sample menu, QAR currency, timezone, outlet, payment methods and receipt layout. Create staff under **Back Office → System → User**, then set local passwords under **PC settings → Passwords**. Each staff member needs an active role. Only the installation owner can add or remove administrators.

Open **Shift Manager**, start a shift and settle a test cash order. Verify the receipt, expected cash and backup restoration on the intended PC before live operation. The application does not operate a card terminal or open a cash drawer automatically.

## Activate an annual license

Open **PC settings → License** and provide the Installation ID privately to your software provider with your company name and required user/outlet allowances. Import the supplied `.famzzlicense` file in that screen. Activation works offline. Keep company-specific license files private.

After expiry, historical information remains readable and renewed license files can be imported, but transaction posting stops. Buying or renewing a license is arranged separately with the provider; the app does not collect annual payments.

## Update

Create an encrypted backup and finish saving before closing the app. Install the newer version using the same Windows account. Keep the existing application-data folder. Reinstalling does not reset your database or evaluation period.

For installation failures, record the Windows version, app version and error message. Do not attach a customer database, credentials, license file or unredacted customer screenshot to a public issue.
