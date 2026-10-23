#!/usr/bin/env bash
# Docs quality gate for this repo. Exits non-zero on the first category of failure found.
set -uo pipefail

cd "$(dirname "$0")/.." || exit 1
fail=0

# 1. Required files from the engineering constitution's DOCUMENTATION.md.
required=(
  README.md CHANGELOG.md TODO.md AGENTS.md LICENSE
  .github/SECURITY.md docs/HELP.md wiki/Home.md
  docs/COST_BREAKDOWN.md docs/CHAMBER_HEATER.md
  docs/infographic/voron-build-cost-2026.html
  docs/infographic/voron-build-cost-2026.png
)
for f in "${required[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "MISSING: $f"
    fail=1
  fi
done

# 2. Every relative link or image in the README must point at a real file.
while IFS= read -r link; do
  target="${link%%#*}"
  [[ -z "$target" ]] && continue
  if [[ ! -e "$target" ]]; then
    echo "BROKEN README LINK: $link"
    fail=1
  fi
done < <(grep -oE '\]\([^)]+\)' README.md | sed -E 's/^\]\((.*)\)$/\1/' | grep -vE '^(https?:|mailto:|#)')

# 3. The PNG must not be older than its HTML source (forgot to re-render).
html=docs/infographic/voron-build-cost-2026.html
png=docs/infographic/voron-build-cost-2026.png
if [[ -f "$html" && -f "$png" && "$html" -nt "$png" ]]; then
  # Git checkouts reset mtimes, so only enforce when the HTML has uncommitted changes.
  if ! git diff --quiet -- "$html" 2>/dev/null; then
    echo "STALE: $png is older than $html. Run scripts/render_infographic.py"
    fail=1
  fi
fi

# 4. House style: no em dashes in Markdown prose.
if grep -rnI --include='*.md' $'—' . --exclude-dir=.git; then
  echo "STYLE: em dash found in the lines above"
  fail=1
fi

if [[ $fail -eq 0 ]]; then
  echo "Docs check passed."
fi
exit $fail
