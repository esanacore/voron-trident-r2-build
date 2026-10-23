# ADR: Printer Platform, LDO Voron Trident R2 300

Status: Proposed

Date: 2026-10-23

## Relationships

- Extends: none
- Supersedes: none
- Related: [docs/COST_BREAKDOWN.md](../COST_BREAKDOWN.md)

## Promotion Criteria

- Prices and stock re-checked within a week of ordering, with COST_BREAKDOWN.md updated.
- Kit ordered. Eric gates the move to Accepted.

## Context

I need a printer that is fast, prints engineering materials (ABS, ASA, PA-CF, PC where possible) with good quality, and stays open, repairable and cloud-free. My FlashForge Adventurer 5M Pro is dead and my Sovol SV03 is open-frame, so it can't handle enclosure-dependent filaments well.

As of October 2026, the newest official Voron is Trident R2, a motion system refresh released mid 2026. The Voron 2.4 is still on its 2022 R2 design, though LDO's Rev D+ kits for both share the same electronics upgrades.

## Decision

Build an LDO Voron Trident R2 300 (Rev D+) kit, with a hardened nozzle and an eddy current probe added, running Klipper.

## Consequences

Positive:

- Newest official Voron mechanics, with easier belting and better Z adjustment.
- The 300mm chamber heats faster and more evenly than a 350mm or 500mm machine, which matters most for warp-prone engineering filaments.
- Kit price is lower than a V2.4 300 ($1,274.99 vs $1,299.99), and the fixed gantry is simpler to build and maintain.
- Fully open hardware and firmware.

Negative:

- 25 to 30 hours of build time plus Klipper tuning.
- Moving bed on Z, so a slightly smaller usable volume than a V2.4 of the same nominal size.
- Hotend and passive chamber still rule out PEEK and PEI/Ultem.

## Alternatives Considered

- **Voron 2.4 R2 350:** Bigger bed and stationary bed, but larger chamber to heat, more complex gantry, $125 more. Kept as the fallback if a bigger bed becomes a hard requirement.
- **Rat Rig V-Core 4.1:** Now 500mm only with panels sold separately. Great platform for large parts or IDEX, poor fit for engineering filaments.
- **Prusa CORE One+ kit:** $1,149, active chamber control and far less tuning, but a 250×220×270mm volume and a 290°C hotend limit.
