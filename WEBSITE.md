# Public FamZz POS website

The `website/` directory is the public marketing site at https://famzzpos.com and https://www.famzzpos.com. The online POS remains at https://app.famzzpos.com.

Cloudflare Worker: `famzz-pos-website`. Configuration: `wrangler.website.json`. Only static files from `website/` are deployed; this Worker has no D1 or authentication bindings.

Validate changes with `git diff --check`, desktop/mobile browser previews, anchor and asset checks, and `wrangler deploy --config wrangler.website.json --dry-run`. Publish using Wrangler 4 with `wrangler deploy --config wrangler.website.json` from this repository. Verify HTTPS, page content, CSS, logo, headers, robots.txt, sitemap.xml and the app link after deployment.

Pricing is contact-based. Sales/support enquiries use the existing published address fahmyghazal@outlook.com. The site has no enquiry backend, analytics scripts or payment collection. Keep marketing claims aligned with the online app; legacy desktop downloads elsewhere in this repository are not the current online product.
