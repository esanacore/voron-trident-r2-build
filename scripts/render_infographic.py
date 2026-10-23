"""Render the infographic HTML to a PNG for the README.

Usage:
    python3 scripts/render_infographic.py

Requires Playwright with Chromium installed:
    pip install playwright
    playwright install chromium
"""

from pathlib import Path

from playwright.sync_api import sync_playwright

# Paths are relative to the repo root so the script works from any folder.
REPO_ROOT = Path(__file__).resolve().parent.parent
SOURCE_HTML = REPO_ROOT / "docs" / "infographic" / "voron-build-cost-2026.html"
OUTPUT_PNG = REPO_ROOT / "docs" / "infographic" / "voron-build-cost-2026.png"

# The poster is designed at a fixed 1200 px width.
WIDTH = 1200
HEIGHT = 2760
SCALE = 2  # Render at 2x so the PNG stays sharp on high-DPI screens.


def render() -> None:
    """Open the HTML in headless Chromium and save a full-page screenshot."""
    if not SOURCE_HTML.exists():
        raise FileNotFoundError(f"Missing source HTML: {SOURCE_HTML}")

    with sync_playwright() as playwright:
        browser = playwright.chromium.launch()
        page = browser.new_page(
            viewport={"width": WIDTH, "height": HEIGHT},
            device_scale_factor=SCALE,
        )
        page.goto(SOURCE_HTML.as_uri())
        # Wait for web fonts so the PNG doesn't fall back to system fonts.
        page.wait_for_load_state("networkidle")
        page.evaluate("document.fonts.ready")
        page.screenshot(path=str(OUTPUT_PNG), full_page=True)
        browser.close()

    print(f"Wrote {OUTPUT_PNG.relative_to(REPO_ROOT)}")


if __name__ == "__main__":
    render()
