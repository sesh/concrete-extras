#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

files=(concrete.css)
for f in *.css; do
  [ "$f" = "concrete.css" ] && continue
  [ "$f" = "concrete.extras.css" ] && continue
  files+=("$f")
done

cat "${files[@]}" | npx -p postcss-cli -p cssnano postcss --use cssnano --no-map -o concrete.extras.css

echo "Built concrete.extras.css"
