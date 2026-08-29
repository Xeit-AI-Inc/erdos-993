#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT="$ROOT/proofs/lean/gap-bridge"

if ! command -v lake >/dev/null 2>&1; then
  echo "lake was not found. Install elan: https://github.com/leanprover/elan" >&2
  exit 1
fi

cd "$PROJECT"
lake build Erdos993GapBridge
lake env lean check/Kernel.lean
lake env lean check/Axioms.lean

echo "Lean build, kernel checks, and axiom checks passed."
