# Security Policy

This repo holds build docs and, later, Klipper and Moonraker configuration.

## Reporting

If you find a secret committed here (API key, password, token) or config that would expose a printer to the internet, open a private security advisory on this repo or email the maintainer listed on the GitHub profile. Please don't open a public issue for it.

## Practices

- Config files reference secrets through Moonraker's `secrets` file or environment, never inline.
- Printers stay on the LAN; remote access goes through a VPN such as Tailscale, not port forwarding.
- Physical safety issues (mains wiring, thermal runaway settings) are treated like security issues: fix first, then document.
