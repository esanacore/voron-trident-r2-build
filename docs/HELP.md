# Help

## Where things live

- **README.md**: overview and the featured infographic.
- **docs/COST_BREAKDOWN.md**: every price, its source and the check date.
- **docs/adr/**: decisions, one file per decision, numbered.
- **docs/CHAMBER_HEATER.md**: chamber heater safety requirements and the tests that prove them.
- **docs/infographic/**: the infographic as editable HTML plus the rendered PNG.
- **TODO.md**: build phases.
- **config/** (later): Klipper and Moonraker config from the finished printer.

## Common tasks

**Update prices.** Re-check each link in COST_BREAKDOWN.md, update the numbers and the date at the top, then update the matching numbers in the infographic HTML and re-render.

**Re-render the infographic.** Install Playwright once (`pip install playwright`, then `playwright install chromium`), then run `python3 scripts/render_infographic.py`. It writes `docs/infographic/voron-build-cost-2026.png`.

**Record a decision.** Copy the newest ADR, bump the number, fill in Context, Decision, Consequences and Alternatives Considered.

**Check the docs.** `bash scripts/check_docs.sh` confirms required files exist, every relative link in the README resolves, the infographic PNG is newer than its HTML, and no prose contains em dashes.
