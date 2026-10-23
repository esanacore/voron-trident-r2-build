# TODO

## Phase 0: Plan (current)

- [x] Price the kits and alternatives (see docs/COST_BREAKDOWN.md)
- [x] Platform decision: LDO Voron 2.4 R2 350 (ADR-0002, Proposed)
- [x] Chamber heater decision and requirements (ADR-0003, docs/CHAMBER_HEATER.md)
- [ ] Rename the GitHub repo to match the V2.4 350 build
- [ ] Pick the eddy current probe and hardened nozzle, add part numbers and prices
- [ ] Pick chamber heater parts (PTC heater, SSR, thermistors, thermal fuse, thermal cutoff, fuse holder) and replace the estimate in COST_BREAKDOWN.md
- [ ] Do the mains current math for bed + chamber heater + PSUs (CH-02)
- [ ] Decide on printed parts: buy a V2.4 PIF set or print them elsewhere in ABS/ASA
- [ ] Re-check prices and stock, then order the kit

## Phase 1: Build

- [ ] Frame and gantry
- [ ] Z drives, quad gantry leveling and bed
- [ ] Toolhead and Nitehawk wiring
- [ ] Electronics bay, mains wiring and grounding check
- [ ] Panels, filter, first power-on

## Phase 2: Commission

- [ ] Klipper config committed to `config/`
- [ ] QGL, bed mesh, Z offset, input shaper, pressure advance
- [ ] Voron cube, then serial request

## Phase 3: Chamber Heater

- [ ] Build and wire the heater module per docs/CHAMBER_HEATER.md
- [ ] Run verification T-01 to T-09 and record results
- [ ] 10 attended hours at target (T-10) before any unattended heated print

## Phase 4: Materials

- [ ] ABS and ASA profiles
- [ ] PA-CF profile with hardened nozzle
- [ ] PC trials, record chamber temps reached and part warping
