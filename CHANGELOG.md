# Release notes

## 1.0.4

- Resolved six remaining dependency advisory entries; both build-time npm audits report zero known vulnerabilities.
- Restricted staff-directory and role configuration reads to administrators.
- Preserved hidden configuration during staff saves and rejected injected user/role edits.
- Added dependency audit gates to Windows CI.
- Unsigned Windows x64 preview; see [validation and limitations](RELEASE-1.0.4.md).

## 1.0.3

- Bounded request/response handling, desktop integration network hardening and failed-login session clearing.
- Dependency updates and optional Windows signing scripts.
- [Release notes](RELEASE-1.0.3.md).

## 1.0.2

- New FamZz monogram throughout sign-in, front office, back office and browser icons.
- Custom Windows executable, installer, uninstaller and shortcut icons.
- Existing database and installation identity are preserved.

## 1.0.1

- Generic company and menu names for new demo workspaces.
- Existing customer data is preserved during updates.
- Public installation and user instructions separated from private development and vendor documentation.

## 1.0.0

- Initial standalone Windows edition with local SQLite, local password sign-in, staff administration, signed annual license activation and encrypted backup/restore.
- Existing front-office and back-office workflows, theme selection and durable SAP outbound queue.
