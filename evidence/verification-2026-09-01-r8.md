# Verification Record: r8 Public Update

Date: 2026-09-01

This record binds the public r8 curation to terminal source evidence without
reproducing internal prompts, raw returns, private paths, manifests, logs, or
failed workflow artifacts. TREE, FOREST, TRANSFER, the literal counterexample
target, and Erdos #993 remain open.

## Terminal Binding

The source terminal verifier completed with `status: PASS`, 12 verified
cycles, zero failures, 30 of 30 matched source artifacts, and 67 terminal
obligation rows.

| Run-relative terminal artifact | SHA-256 |
|---|---|
| `FINAL-RECONCILIATION.md` | `148e670097686aaea422e7155b23abac898edc808145c00fc05212bbfe402ea4` |
| `TERMINAL-CHECKPOINT.md` | `d7f4dc3e87adc4ba3f682578506b10639a365e517bed47ae44771f21af181e5e` |
| `OBLIGATIONS.csv` | `7e08482d766645bee8bd13b33c9e91c5a342a970ca89aa5c3a81dbd524bfed9a` |

## Published Lean Packages

Every package below was rebuilt independently with Lean `v4.32.2` and
Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`. Its `lake build`, kernel
probe, and axiom probe passed. The reported transitive axioms are exactly
`propext`, `Classical.choice`, and `Quot.sound`.

| Candidate | Principal declaration(s) | Public package | Curated principal-source SHA-256 | Scope boundary |
|---|---|---|---|---|
| `E1` | `E1ExtensionSplit.extension_set_sum_bridge` | `r8-extension-set-bridge` | `8319d3cad5f73edb35425e75800762a7c3f366a4926e6e9717bca8c3c520bb04` | Extension-set bridge only |
| `C1F1-REP-01` | `C1F1Rep01.extensionProfile_specialize_one` | `r8-extension-profile-specialization` | `513f5c8c18574a0f45ed59535c2d0394616a12aec90d38f430aad23b62035076` | Specialization identity only |
| `C2-F1` | `C2F1.no_universal_endpoint_decoder_exact_rBag` | `r8-rbag-decoder-obstruction` | `a8631d2ebdcc7c5a46c800cd3a3761e5e6e9db486861c9767b02dcc0a8963a75` | Exact `R_bag` state only |
| `C2U2-03` | `C2U203.scp_convolution_closed` | `r8-scp-convolution` | `4d1d1398a746354d68d3ad304e61f05bccba6a66022b95fb1bff43acddac3ce6` | Abstract `SCP` closure only |
| `C4-F3-05` | `C4F305.two_leaf_deletion_iso_coeff_delta` | `r8-two-leaf-deletion` | `e54f5aa70e42e5aac90ab8c2558a0e6174ec3d57a1522a44ac58afb77322db52` | Exact two-leaf symmetry only |
| `C5-T2-POSITIVE-RANK-REPAIR` | `C6PositiveRank.C5_T2_POSITIVE_RANK_REPAIR` | `r8-positive-rank-boundary` | `cfd79f2cd3150d18b5b26d292473acaf724e0d840c48598a5b7360a8517ee178` | Positive-rank boundary only |
| `C8-U1-03` | `Erdos993C8U1.trs2_iff_adjacentLogConcave` | `r8-trs2` | `f9e4366bc764bbbd48e46f95a611b51484ae90495ad55dd4de5a74a648e3b833` | Abstract sequence characterization only |
| `C8-U1-04` | `Erdos993C8U1.trs2_convolutionClosure` | `r8-trs2` | `f9e4366bc764bbbd48e46f95a611b51484ae90495ad55dd4de5a74a648e3b833` | Abstract sequence closure only |

The two Cycle 12 nominees remain blocked future work. They received no public
Lean package and are not counted among these verified declarations.

The complete public file-hash record is
[`source-hashes.sha256`](source-hashes.sha256).
