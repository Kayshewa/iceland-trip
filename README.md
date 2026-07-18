# tripiandkayshewa.com

The landing hub for our apps, served by GitHub Pages at **tripiandkayshewa.com**.

## Layout

| Path | What |
| --- | --- |
| `index.html` | The **hub** landing page. Tiles are configured in the `TILES` array near the top of the file — edit there to add/rename/relink apps or flip a tile from `"soon"` → `"live"`. |
| `vacations/iceland/` | The **Iceland — South Coast** trip companion (self-contained `index.html` at `vacations/iceland/index.html`). Build sources (`index_tmpl.html`, `data.json`, `*.css`, `geo.json`/`map.json`, `imgs/`, `raw/`) live alongside it. |
| `CNAME` | Custom domain: `tripiandkayshewa.com`. |

## Deploy

Push to `main` — GitHub Pages auto-deploys. The hub is at `/`, Iceland at `/vacations/iceland/`.

The other apps (Quado, C3.ai dashboard, SwingBot) are server apps hosted separately
and linked from the hub tiles by URL; they are not part of this repo.
