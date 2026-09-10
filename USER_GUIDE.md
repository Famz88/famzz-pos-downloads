# Using FamZz POS

## Orders and closing

Start a shift before taking orders. Use the front-office navigation for dine-in, takeaway, delivery, order summary, shifts, vouchers and day close. Finish and save transactions before signing out or closing the application. Close open shifts and resolve running orders before day close.

## Offline work

Orders and configuration are saved on the current PC. This standalone edition does not use the hosted app's 72-hour offline authorization. A valid license and correct PC date/time are still required. SAP delivery waits in its durable queue during a connection outage and retries while the app is open. Internet-dependent provider actions cannot complete offline.

Each installation is independent. Do not place the database on a shared drive or use copied databases as coordinated tills. Central multi-PC synchronization is not included.

## Staff and administrators

Create users with their email, active role and outlet assignment under **Back Office → System → User**. Set local passwords under **PC settings → Passwords**. Users change their own password using the current password. Five failed attempts lock the account for 15 minutes.

The installation owner adds or removes administrators under **System → Administrators**. Removing an administrator deactivates their account while retaining history. Other administrators can manage ordinary staff, but cannot promote administrators or reset administrator passwords.

## Backup and restoration

Open **PC settings → Backup & restore**. Choose a passphrase of at least 12 characters, export the encrypted backup and keep it on a separate drive. Backups include orders, settings, local accounts, licenses and configured integration secrets. Do not upload them to this public repository.

To restore, finish saving, select the backup, enter its passphrase and the current owner password, and confirm database replacement. Sign in using the credentials saved in the restored backup. The app keeps a local safety copy before replacement. Restore requires matching database migration versions and currently supports encrypted backups up to 100 MB. The backup passphrase cannot be recovered if forgotten.

The database folder is shown in PC settings, normally `%APPDATA%\FamZz POS`. The live database and automatic safety copies are not encrypted by the app; protect the Windows account and use appropriate drive encryption. Uninstalling keeps application data.

## SAP

Ask your SAP integration administrator for a compatible HTTPS receiver, credentials and material/outlet mappings. Enter them privately under **System → SAP Integration**. Do not post credentials or company mappings in public issues.

The connector exports new paid sales and vouchers. It does not import SAP inventory or customers. The receiver must deduplicate by event ID. **Accepted** means the endpoint received a request; **Synced** requires a confirmed SAP document reference. Validate postings in your SAP test environment before production delivery.

## Appearance and printing

Use the theme button to choose Dark, Light or System. Receipt printing uses the Windows print dialog and an installed printer driver. Test receipt width and paper layout on your printer.
