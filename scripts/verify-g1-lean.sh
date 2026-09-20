#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if ! command -v lake >/dev/null 2>&1; then
  echo "lake is required; use the Lean version pinned in each project." >&2
  exit 1
fi
for package in g1-c1-low-rank g1-c2-first-wide g1-c3-third-wide; do
  cd "$ROOT/proofs/lean/$package"
  lake build LeanProof
  lake env lean check/Kernel.lean
  lake env lean check/Axioms.lean
done
echo "All three G1 package builds, kernel checks and axiom probes passed."
