# ADR: Active Chamber Heater

Status: Proposed

Date: 2026-10-23

## Relationships

- Extends: ADR-0002 (LDO Voron 2.4 R2 350)
- Supersedes: none
- Related: [docs/CHAMBER_HEATER.md](../CHAMBER_HEATER.md) (requirements and verification)

## Promotion Criteria

- Heater, SSR, thermal cutoff, thermal fuse and wiring selected, with part numbers and prices recorded in COST_BREAKDOWN.md.
- Every requirement in docs/CHAMBER_HEATER.md has a passing verification result recorded.
- Eric gates the move to Accepted.

## Context

A 350mm Voron chamber heated only by the bed takes a long time to heat soak and tops out lower than a smaller chamber. I want to print ABS, ASA, PA-CF and PC with less warping and splitting, and I want shorter heat soak times.

Voron Design's stated position is that it does not recommend additional chamber heating because of the increased fire risk. There is no turnkey chamber heater kit for the V2.4. Community designs (for example TARTARUS, and several Team FDM mods) use a PTC heater switched by an SSR and controlled in Klipper as a `heater_generic`, with an inline thermal fuse.

## Decision

Add an active chamber heater to the V2.4 350, built as a DIY module:

- A mains PTC heater with its own recirculating fan, switched by an SSR from a spare heater output on the Leviathan.
- Klipper `heater_generic` with `verify_heater`, a hard `max_temp`, and a chamber target of 65°C or lower by default.
- Independent hardware protection that works with Klipper dead: an inline thermal fuse at the heater core and a normally closed thermal cutoff switch in series with the heater.
- Its own fuse sized for the heater, so the heater does not ride on the printer's main inlet fuse.

The full requirement set and the tests that prove each one live in docs/CHAMBER_HEATER.md.

## Consequences

Positive:

- Faster heat soak and a hotter, more even chamber for engineering filaments.
- Heater is controlled and logged by Klipper like any other heater.

Negative:

- Real fire and electrical risk. Voron Design advises against it.
- More mains wiring, a second fused circuit, and more current through the printer.
- Chamber temperature is capped by the printed parts. ABS and ASA parts soften well before PC print temperatures, so the chamber stays at or below about 65 to 70°C unless critical parts are reprinted in a higher temperature material.
- The A/B stepper motors sit in the heated chamber and will run hotter.

## Alternatives Considered

- **Passive heat soak only:** No extra risk or cost, but long soak times on a 350 and a lower ceiling.
- **Insulated panels:** Cheap and safe, and worth doing anyway, but not enough on their own for PC.
- **Bed fans:** Speed up heat soak using the bed heater; safe, but the bed remains the only heat source.
- **Commercial enclosed printer with active chamber (Prusa CORE One+):** Turnkey, but too small and capped at a 290°C hotend.
