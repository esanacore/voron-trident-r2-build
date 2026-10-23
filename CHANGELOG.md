# Changelog

All notable changes to this repo are documented here. Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Changed

- Build plan switched to an LDO Voron 2.4 R2 350 with an active chamber heater (ADR-0002 supersedes ADR-0001)
- Cost breakdown, README and infographic updated for the new plan

### Added

- ADR-0003: active chamber heater
- docs/CHAMBER_HEATER.md with safety requirements CH-01 to CH-12 and verification tests T-01 to T-10

### Added (initial)

- README featuring the 2026 Voron cost infographic
- docs/COST_BREAKDOWN.md with dated prices and sources
- ADR-0001: printer platform, LDO Voron Trident R2 300 (Proposed)
- Infographic source (HTML) and PNG, plus `scripts/render_infographic.py`
- `scripts/check_docs.sh` and a CI workflow that runs it
- Required governance files per the engineering constitution
