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
  local kernel_probe="$3"
  local axiom_probe="$4"

  cd "$project"
  lake build "$target"
  lake env lean "$kernel_probe"
  lake env lean "$axiom_probe"
}

verify_project "$ROOT/proofs/lean/gap-bridge" "Erdos993GapBridge" \
  "check/Kernel.lean" "check/Axioms.lean"
verify_project "$ROOT/proofs/lean/rooted-residual-profile" \
  "Erdos993RootedResidualProfile" "check/Kernel.lean" "check/Axioms.lean"
verify_project "$ROOT/proofs/lean/marked-extension-charge" \
  "Erdos993MarkedExtensionCharge" "check/Kernel.lean" "check/Axioms.lean"
verify_project "$ROOT/proofs/lean/r7-first-recovery-rank-one" \
  "Erdos993MarkedExtensionCharge" "check/C2T105Kernel.lean" \
  "check/C2T105Axioms.lean"
verify_project "$ROOT/proofs/lean/r7-double-broom-d1" "C3F304" \
  "KernelCheck.lean" "AxiomCheck.lean"
verify_project "$ROOT/proofs/lean/r7-double-broom-d2" "C4F306" \
  "KernelCheck.lean" "AxiomCheck.lean"
verify_project "$ROOT/proofs/lean/r7-rooted-attachment" "C4U1Attachment" \
  "C4U1Attachment/KernelCheck.lean" "C4U1Attachment/AxiomCheck.lean"
verify_project "$ROOT/proofs/lean/r7-endpoint-sign" "C5T103" \
  "KernelCheck.lean" "AxiomCheck.lean"
verify_project "$ROOT/proofs/lean/r7-finite-coupling" "C5T304C5T305" \
  "KernelCheck.lean" "AxiomCheck.lean"
verify_project "$ROOT/proofs/lean/r7-contextual-attachment" "C6U101C6U103" \
  "KernelCheck.lean" "AxiomCheck.lean"
verify_project "$ROOT/proofs/lean/r7-rooted-signature-countercertificate" \
  "C6U104" "KernelCheck.lean" "AxiomCheck.lean"
verify_project "$ROOT/proofs/lean/r7-two-leaf-four-class" "C8F202" \
  "KernelCheck.lean" "AxiomCheck.lean"
verify_project "$ROOT/proofs/lean/r7-containment-stub" "C8T3ContainmentStub" \
  "KernelCheck.lean" "AxiomCheck.lean"
verify_project "$ROOT/proofs/lean/r7-boundary-factorization" \
  "C8U2BoundaryFactorization" "KernelCheck.lean" "AxiomCheck.lean"
verify_project "$ROOT/proofs/lean/r7-component-selector" "C8U3Selector" \
  "KernelCheck.lean" "AxiomCheck.lean"

echo "All Lean builds, kernel checks, and axiom checks passed."
