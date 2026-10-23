# Agent Instructions

This repo follows [Eric's Engineering Constitution](https://github.com/esanacore/engineering-constitution).

- This is a hardware build repo: docs, decisions, costs, and later Klipper config. There is no application code.
- Every price needs a source link and the check date in docs/COST_BREAKDOWN.md. Never state a price from memory.
- Record platform or major part decisions as ADRs in docs/adr/ using the constitution's ADR template.
- After editing docs/infographic/voron-build-cost-2026.html, run `scripts/render_infographic.py` and commit the new PNG with it.
- Run `bash scripts/check_docs.sh` before committing.
- No em dashes in prose. Keep writing plain and casual.
- Never commit secrets (Moonraker API keys, Wi-Fi passwords, printer IPs exposed to the internet).
