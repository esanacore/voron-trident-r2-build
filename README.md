# Voron 2.4 R2 350 Build

<!-- CONSTITUTION_START -->
[![Eric's Engineering Constitution](https://img.shields.io/badge/Eric's%20Engineering%20Constitution-Adopted-blue)](https://github.com/esanacore/engineering-constitution)
<!-- CONSTITUTION_END -->

Build log, decisions, costs and printer config for an LDO Voron 2.4 R2 350 with an active chamber heater, aimed at fast, large-format printing in engineering materials (ABS, ASA, PA-CF, PC). This repo is for me and anyone else planning a similar build in late 2026.

[![The 2026 Voron build, priced out](docs/infographic/voron-build-cost-2026.png)](docs/infographic/voron-build-cost-2026.png)

<sub>Prices as of Oct 23, 2026. Full numbers and sources in [docs/COST_BREAKDOWN.md](docs/COST_BREAKDOWN.md). Editable source: [docs/infographic/voron-build-cost-2026.html](docs/infographic/voron-build-cost-2026.html).</sub>

## Current Capabilities

- Platform decision recorded: [ADR-0002](docs/adr/0002-printer-platform-voron-2-4-r2-350.md) (Proposed), superseding [ADR-0001](docs/adr/0001-printer-platform-voron-trident-r2-300.md)
- Chamber heater decision with traceable safety requirements and verification tests: [ADR-0003](docs/adr/0003-active-chamber-heater.md), [docs/CHAMBER_HEATER.md](docs/CHAMBER_HEATER.md)
- Dated cost breakdown with sources for the kit, printed parts, upgrades and alternatives
- Infographic summarizing the cost and the platform comparison, rendered from HTML by a script
- Docs gate (`scripts/check_docs.sh`) that runs in CI on every push

Not yet: purchased parts, chosen heater parts, build log, Klipper config. Those land as the build progresses (see [TODO.md](TODO.md)).

## Quick Start

There is no software to install. To read the plan, start with the infographic above, then the ADRs, the cost breakdown and the chamber heater requirements.

```bash
git clone https://github.com/esanacore/voron-trident-r2-build.git
cd voron-trident-r2-build
```

<details>
<summary>Re-render the infographic (Windows, PowerShell)</summary>

```powershell
py -m pip install playwright
py -m playwright install chromium
py scripts\render_infographic.py
```

</details>

<details>
<summary>Re-render the infographic (Linux / WSL2)</summary>

```bash
python3 -m pip install playwright
python3 -m playwright install chromium
python3 scripts/render_infographic.py
```

</details>

<details>
<summary>Run the docs check</summary>

```bash
bash scripts/check_docs.sh
```

On Windows, run it from Git Bash or WSL2.

</details>

## The Build at a Glance

| Item | Choice | Why |
| --- | --- | --- |
| Printer | LDO Voron 2.4 R2 350 (Rev D+) | Biggest complete LDO Voron kit; stationary bed for large parts |
| Kit price | $1,399.99 (West3D, Oct 2026) | In stock at time of writing |
| Chamber | Active PTC heater, 65°C default target | Shorter heat soak and a hotter chamber on a big printer |
| Estimate | $1,715 to $2,005 before tax | Kit, printed parts, hardened nozzle, eddy probe, heater module |
| Firmware | Klipper | Stock for Voron |

## Documentation

| Doc | What it covers |
| --- | --- |
| [docs/COST_BREAKDOWN.md](docs/COST_BREAKDOWN.md) | Every price, where it came from, and the date |
| [docs/CHAMBER_HEATER.md](docs/CHAMBER_HEATER.md) | Chamber heater safety requirements and verification |
| [docs/adr/](docs/adr/) | Architecture decision records for the build |
| [docs/HELP.md](docs/HELP.md) | How this repo is organized and how to update it |
| [TODO.md](TODO.md) | Build phases and what is next |
| [CHANGELOG.md](CHANGELOG.md) | What changed and when |

<details>
<summary>Project tree</summary>

```text
.
├── README.md
├── CHANGELOG.md
├── TODO.md
├── AGENTS.md
├── LICENSE
├── .github/
│   ├── SECURITY.md
│   └── workflows/docs.yml
├── docs/
│   ├── HELP.md
│   ├── COST_BREAKDOWN.md
│   ├── CHAMBER_HEATER.md
│   ├── adr/
│   │   ├── 0001-printer-platform-voron-trident-r2-300.md
│   │   ├── 0002-printer-platform-voron-2-4-r2-350.md
│   │   └── 0003-active-chamber-heater.md
│   └── infographic/
│       ├── voron-build-cost-2026.html
│       └── voron-build-cost-2026.png
├── scripts/
│   ├── check_docs.sh
│   └── render_infographic.py
└── wiki/Home.md
```

</details>

## Safety Notes

This printer runs a mains-powered bed heater, a mains-powered chamber heater and a PSU inside an enclosure. **Voron Design does not recommend additional chamber heating because of the increased fire risk.** This build accepts that risk only with the hardware protections and verification in [docs/CHAMBER_HEATER.md](docs/CHAMBER_HEATER.md): a separate fuse, an inline thermal fuse, a thermal cutoff switch, an SSR, Klipper thermal protection and smoke detection. Follow the Voron manual's wiring and grounding steps, run a carbon filter for ABS and ASA fumes, and never leave heated prints unattended until the burn-in in requirement CH-12 passes.

## License

GPL-3.0, matching Voron Design and Klipper so configs and derived parts can be shared back. See [LICENSE](LICENSE).
