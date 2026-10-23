# Chamber Heater: Requirements and Verification

Decision record: [ADR-0003](adr/0003-active-chamber-heater.md). Parts are not chosen yet; this doc defines what the build must do and how each requirement gets proven before the heater runs unattended.

> Voron Design does not recommend additional chamber heating because of the increased fire risk. Everything below exists to manage that risk. Do not skip a verification step.

## Requirements

| ID | Requirement | Rationale |
| --- | --- | --- |
| CH-01 | The heater has its own fuse, sized for the heater's rated current, and does not share the printer's main inlet fuse. | The stock Voron 120V inlet fuse is sized for the bed and PSU, not an extra few hundred watts. |
| CH-02 | Total mains draw (bed heater + chamber heater + PSUs) is calculated and stays within the rating of the power inlet, switch and wall circuit. Record the math here. | Prevent nuisance trips and overheated connectors. |
| CH-03 | An inline thermal fuse sits against the heater core, in series with the heater supply. Crimped, not soldered. | Last-resort cutoff if everything else fails. |
| CH-04 | A normally closed bimetal thermal cutoff switch is in series with the heater and opens below the temperature that damages printed parts or panels. | Hardware protection that resets and works with Klipper dead. |
| CH-05 | The heater is switched by an SSR driven by a Klipper heater output. Mains never passes through the controller board. | Isolation between mains and logic. |
| CH-06 | Klipper defines the heater as `heater_generic` with `verify_heater` enabled and a hard `max_temp`. | Klipper shuts down on thermal runaway or a dead thermistor. |
| CH-07 | Heater core temperature and chamber air temperature are measured by separate thermistors. | Core sensing catches stalled airflow; chamber sensing drives the target. |
| CH-08 | The heater cannot be on unless its fan is running. | A PTC with no airflow overheats its housing. |
| CH-09 | Default chamber target is 65°C or lower. Higher targets need a documented review of printed part materials. | ABS and ASA printed parts soften as the chamber approaches their glass transition. |
| CH-10 | The heater turns off at the end of every print, on cancel, and on any Klipper error. | No heat left running on an idle printer. |
| CH-11 | Smoke detection (and ideally an automatic extinguisher) covers the printer. | Detect a fire the electronics cannot prevent. |
| CH-12 | No unattended heated prints until CH-01 to CH-11 pass and 10 attended hours at target show no faults. | Burn-in before trust. |

## Verification

| Test | Covers | Method | Pass criteria | Result |
| --- | --- | --- | --- | --- |
| T-01 | CH-01, CH-02 | Inspect fuse ratings and wiring; record the current math. | Every fuse matches its circuit; total draw is within all ratings. | Not run |
| T-02 | CH-03, CH-04 | With heater unplugged from mains, confirm both devices are in series with continuity checks; confirm cutoff opens with a heat gun and a thermocouple. | Circuit opens at the rated temperature. | Not run |
| T-03 | CH-05 | Inspect wiring. | Mains goes only through the SSR load side. | Not run |
| T-04 | CH-06 | Temporarily set `max_temp` below the target and heat. | Klipper shuts down when the limit is crossed. | Not run |
| T-05 | CH-06, CH-07 | Unplug each thermistor during a heat cycle. | Klipper shuts down within the `verify_heater` window. | Not run |
| T-06 | CH-08 | Disconnect the heater fan and request heat. | Heater does not energize. | Not run |
| T-07 | CH-10 | Cancel a print mid-soak; trigger an error with `M112`. | Heater output goes to 0 in both cases. | Not run |
| T-08 | CH-09 | Run a 2-hour soak at target and log chamber, core and A/B motor temperatures. | Chamber holds target with no overshoot past the cutoff; no printed parts deform. | Not run |
| T-09 | CH-11 | Test the smoke detector. | Alarm sounds. | Not run |
| T-10 | CH-12 | Log 10 attended hours at target. | No faults. | Not run |
