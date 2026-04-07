#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$ROOT_DIR"

if [[ ! -d .git ]]; then
  echo "Este directorio no es un repositorio git." >&2
  exit 1
fi

git config core.hooksPath .githooks

echo "✅ Auto-push activado con hook post-commit."
echo "Cada commit intentará hacer: git push origin <rama-actual>."
