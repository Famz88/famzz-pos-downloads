# FamZz POS browser demo

The homepage is an interactive demonstration using sample restaurant data.
Demo changes stay in the current browser session and do not write to a company
database. Reloading or exiting starts a new demonstration. Reports exported from
the demo contain sample data. No real payments are processed.

Company registration and licensed online operation are not open to customers yet.
The standalone Windows downloads and release instructions remain available in
this repository.

## Enable the GitHub Pages homepage (repository owner)

1. Open this repository's Settings → Pages.
2. Under Build and deployment, select Deploy from a branch.
3. Select main and /(root), then Save.
4. Wait for GitHub's Pages deployment to finish. Use the Visit site link shown
   on that page.

The site files are already compiled; no Node.js installation is needed to view
the demo. GitHub Pages must be enabled by the repository owner. The authoring
source, database policies and licensing administration remain in the private
Famz88/famzz-pos repository.

Validation: the client build and TypeScript check passed; 10 online API/policy
tests and the tenant-isolation SQL checks passed. Visual browser QA remains
pending because the development browser could not reach the local preview.
