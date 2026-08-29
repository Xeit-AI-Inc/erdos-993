#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v lake >/dev/null 2>&1; then
  echo "lake was not found. Install elan: https://github.com/leanprover/elan" >&2
  exit 1
fi

verify_project() {
  local project="$1"
  local target="$2"

  cd "$project"
  lake build "$target"
  lake env lean check/Kernel.lean
  lake env lean check/Axioms.lean
}

verify_project "$ROOT/proofs/lean/gap-bridge" "Erdos993GapBridge"
verify_project "$ROOT/proofs/lean/rooted-residual-profile" \
  "Erdos993RootedResidualProfile"

echo "All Lean builds, kernel checks, and axiom checks passed."
