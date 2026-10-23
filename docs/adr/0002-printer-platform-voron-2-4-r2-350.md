# ADR: Printer Platform, LDO Voron 2.4 R2 350

Status: Proposed

Date: 2026-10-23

## Relationships

- Extends: none
- Supersedes: ADR-0001 (LDO Voron Trident R2 300)
- Related: ADR-0003 (active chamber heater), [docs/COST_BREAKDOWN.md](../COST_BREAKDOWN.md)

## Promotion Criteria

- Prices and stock re-checked within a week of ordering, with COST_BREAKDOWN.md updated.
- Kit ordered. Eric gates the move to Accepted.

## Context

ADR-0001 picked a Trident R2 300 because a small chamber heats well for engineering filaments. Two things changed:

- I want the larger build volume. If I'm building one, I'm going big.
- I'm planning an active chamber heater (ADR-0003), which removes most of the reason to keep the chamber small.

LDO does not sell a Trident R2 350 kit as of 2026-10-23. West3D and Fabreeko only list 250 and 300. A Trident 350 would mean an LDO frame kit plus a self-sourced build, which costs more and loses the kit's electronics upgrades. The LDO Voron 2.4 R2 350 (Rev D+) is a complete kit with the same Leviathan, Nitehawk SB, Revo High Flow and IGDA package.

## Decision

Build an LDO Voron 2.4 R2 350 (Rev D+) kit, with a hardened nozzle, an eddy current probe and an active chamber heater (ADR-0003), running Klipper.

## Consequences

Positive:

- 350mm bed and roughly 330mm of Z, versus 250mm of Z on a stock Trident.
- Stationary bed, which suits large and heavy parts.
- A complete kit with no self-sourcing.

Negative:

- $125 more than the Trident R2 300 kit ($1,399.99 vs $1,274.99), before the heater.
- More complex flying gantry with quad gantry leveling, and more printed parts.
- A larger chamber to heat. ADR-0003 addresses this, but it adds cost, mains wiring and fire risk.
- The repo is still named `voron-trident-r2-build` until it is renamed on GitHub.

## Alternatives Considered

- **Voron Trident R2 300 (ADR-0001):** Cheaper and simpler, but smaller than I want.
- **Self-sourced Trident R2 350:** Possible with an LDO 350 frame kit, but it costs more and the generated BOM defaults to older parts (V6 hotend, inductive probe, separate drivers).
- **Rat Rig V-Core 4.1 500:** Bigger again, but panels are sold separately and a 500mm cube is much harder to heat.
