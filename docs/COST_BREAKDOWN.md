# Cost Breakdown

Prices checked on **2026-10-23**. Retail prices and stock change constantly; re-check every number before ordering and update the date above when you do.

## LDO Kits (US retail)

| Kit | Price | Source | Stock on 2026-10-23 |
| --- | --- | --- | --- |
| Voron Trident R2 250 (Rev D+) | $1,199.00 | [West3D](https://west3d.com/products/ldo-trident-kit) | In stock |
| Voron Trident R2 300 (Rev D+) | $1,274.99 | [West3D](https://west3d.com/products/ldo-trident-kit) | In stock |
| Voron 2.4 R2 300 (Rev D+) | $1,299.99 | [West3D](https://west3d.com/products/ldo-v2-4-kit-in-stock) | In stock |
| Voron 2.4 R2 350 (Rev D+) | $1,399.99 | [West3D](https://west3d.com/products/ldo-v2-4-kit-in-stock) | In stock (sold out at [Fabreeko](https://www.fabreeko.com/products/ldo-voron-v2-4-kit)) |

What the LDO Rev D / D+ kits include, per the vendor listings: LDO Leviathan board (TMC5160 HV drivers on A/B, 48V ready), Nitehawk SB USB toolhead board, Bondtech IGDA extruder, E3D Revo High Flow hotend, Raspberry Pi 4B, touch screen, pre-applied bed magnet sheet. Printed parts are not included.

## All-in Estimate: Trident R2 300

| Line item | Estimate | Notes |
| --- | --- | --- |
| LDO kit | $1,275 | West3D |
| Functional printed parts | $140 to $180 | [Fabreeko PIF set](https://www.fabreeko.com/collections/v2-4) price range; printing ABS on an open-frame printer is not practical |
| Hardened nozzle + eddy current probe | $100 to $250 | Needed for CF/GF-filled filaments; Rev D+ toolboard has USB passthrough for eddy probes |
| CA sales tax | Varies | Not itemized here |
| **Total** | **$1,600 to $1,900** | |

A Voron 2.4 R2 350 lands around $1,700 to $2,100 with the same add-ons.

## Alternatives Considered

| Option | Price | Key limit | Source |
| --- | --- | --- | --- |
| Rat Rig V-Core 4.1 | from €971 (machine kit) | 500mm only now; panels not included; big cube is hard to keep hot | [Rat Rig](https://ratrig.com/products/rat-rig-v-core-4-1), [All3DP](https://all3dp.com/es/6/ratrig-deja-de-fabricar-los-modelos-300-y-400-de-la-impresora-3d-v-core/) |
| Prusa CORE One+ (Gen 2) kit | $1,149 | 250×220×270mm; hotend tops out at 290°C | [Printed Solid](https://www.printedsolid.com/products/original-prusa-core-one-gen-2), [123-3D](https://www.123-3d.co.uk/Prusa-Original-Prusa-CORE-One-3D-Printer-KIT-CORE-ONE-KIT-i12433-t43459.html) |

None of these handle PEEK or PEI/Ultem, which need roughly 400°C+ hotends and a much hotter chamber.

## Design Background

- Trident R2 release notes: [VoronDesign/Voron-Trident VTr2](https://github.com/VoronDesign/Voron-Trident/releases/tag/VTr2)
- Coverage: [Fabbaloo](https://www.fabbaloo.com/news/voron-trident-r2-updates-motion-and-assembly), [3Druck](https://3druck.com/en/printers-and-products/voron-trident-r2-revised-xy-and-z-drive-system-for-the-open-source-printer-10158579/)
