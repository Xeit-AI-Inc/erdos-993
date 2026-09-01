# r8 Extension-Profile And Same-Leaf Experiment

Completed: 2026-09-01

## Terminal State

The twelve-cycle r8 experiment ended at `PLATEAU`. It made auxiliary progress
but did not prove or refute the headline problem.

| Target | Status |
|---|---|
| TREE | Open |
| FOREST | Open |
| TRANSFER | Open |
| Literal counterexample | Open |

No proof, counterexample, or independence result for Erdos #993 is claimed.

## Published Formal Results

Eight governed auxiliary declarations are included in seven standalone Lean
packages:

| Candidate | Declaration | Public package | Scope boundary |
|---|---|---|---|
| `E1` | `E1ExtensionSplit.extension_set_sum_bridge` | `r8-extension-set-bridge` | Exact disjoint-union extension-set bridge |
| `C1F1-REP-01` | `C1F1Rep01.extensionProfile_specialize_one` | `r8-extension-profile-specialization` | Exact extension-profile specialization |
| `C2-F1` | `C2F1.no_universal_endpoint_decoder_exact_rBag` | `r8-rbag-decoder-obstruction` | Fixed five-label `R_bag` obstruction only |
| `C2U2-03` | `C2U203.scp_convolution_closed` | `r8-scp-convolution` | Abstract `SCP` closure only |
| `C4-F3-05` | `C4F305.two_leaf_deletion_iso_coeff_delta` | `r8-two-leaf-deletion` | Exact two-leaf deletion symmetry |
| `C5-T2-POSITIVE-RANK-REPAIR` | `C6PositiveRank.C5_T2_POSITIVE_RANK_REPAIR` | `r8-positive-rank-boundary` | Positive-rank legality boundary |
| `C8-U1-03` | `Erdos993C8U1.trs2_iff_adjacentLogConcave` | `r8-trs2` | Abstract sequence characterization |
| `C8-U1-04` | `Erdos993C8U1.trs2_convolutionClosure` | `r8-trs2` | Abstract sequence convolution closure |

The results do not establish that a tree independence polynomial belongs to
the abstract sequence classes above. They provide no TREE, FOREST, TRANSFER,
or counterexample conclusion.

## Research Boundary

The terminal record narrows the load-bearing work to representation fidelity,
noncircular endpoint signs, and a strict common-leaf overlap. Replayed finite
exclusions remain bounded evidence only and do not prove a universal claim.

Two Cycle 12 nominees remain blocked future work. They are not included as
verified theorems or proof artifacts in this repository.

## Reproduction

Run the repository-wide public Lean verification from the repository root:

```bash
./scripts/verify-lean.sh
```

See [the r8 verification record](../evidence/verification-2026-09-01-r8.md)
for terminal binding, package hashes, and verification scope.
