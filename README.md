![FamZz POS](brand/famzz-pos.svg)

# FamZz POS for Windows

Standalone restaurant point of sale with front office, back office, local staff sign-in, company licensing and an offline database.

## Download

**Windows v1.0.5 is published.** Open the [v1.0.5 release](https://github.com/Famz88/famzz-pos-downloads/releases/tag/v1.0.5) for the installer and SHA-256 checksum. Run the `.exe`, then open **FamZz POS** from the desktop shortcut. GitHub's automatically generated “Source code” downloads contain the public documentation, not the application installer.

The installer targets 64-bit Windows 10/11 and includes the runtime. End users do not need Node.js, a browser server or ChatGPT. The app uses generic demo company and menu names. A new installation starts with sample menu items and no transaction history; configure them for your business before use.

See [Installation and first setup](INSTALLATION.md) and [Using the application](USER_GUIDE.md).

## Features

- Dine-in, takeaway, delivery and order management.
- Menu, item, rate, table and staff configuration.
- Local passwords and administrator controls.
- Offline local database and encrypted exported backups.
- Signed annual license-file activation, following a 14-day evaluation.
- SAP outbound queue for a separately configured compatible integration endpoint.
- Dark, Light and System appearance choices; Dark is the default.

Each PC has an independent database. This edition does not synchronize multiple tills or import an existing hosted database automatically. SAP, webhooks and messaging need configured services and internet connectivity. Card settlement records externally collected payment; a physical card terminal or cash drawer requires a separate integration.

## Release status

**Published download: v1.0.5 (Windows x64).** The [release page](https://github.com/Famz88/famzz-pos-downloads/releases/tag/v1.0.5) contains `FamZz-POS-Setup-1.0.5-x64.exe` and `SHA256SUMS.txt`. Downloads are published in this repository; the private source repository is not the download destination.

Newer bill-after-KOT, explicit print-preview and Windows default-printer changes have passed candidate builds but are not included in the public v1.0.5 asset. Android remains in testing, and public online company registration is not open yet.

[Try the sample-data demo](https://famz88.github.io/famzz-pos-downloads/) · [Product website](https://famz88.github.io/famzz-pos-downloads/website/)

The Windows installer and automated business/database tests are built in the private development process. Validate installation, receipts and any connected hardware on your own till before production use. The current installer is unsigned and may show an unknown-publisher notice. Compare the supplied SHA-256 checksum before installing.

This repository distributes installers and user documentation. Public availability does not remove the application's license activation requirement. It contains no customer database, passwords or vendor license-signing key. Keep private information out of public issue reports.
