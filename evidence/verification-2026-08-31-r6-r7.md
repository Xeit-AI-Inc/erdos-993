# Verification Record: r6 and r7 Public Update

Date: 2026-08-31

This record binds the public r6/r7 update to immutable experiment artifacts
without reproducing operational returns, private paths, or internal prompts.
TREE, FOREST, TRANSFER, and Erdős #993 remain open.

## r6 Classification

Run `erdos-993-math-dre-20260829-r6-nr-foundation` completed nine cycles. Its
terminal state records all headline targets as `still_open`. Its terminal
controller records a 18-object Lean corpus across seven passing gate stages,
but caps that corpus at computation grade and explicitly says that nothing is
`formally_verified` under the r6 rubric. No r6 theorem package is published.

| Run-relative source artifact | SHA-256 |
|---|---|
| `README.md` | `7b2910e103fc596b3f619614db6cf17ab0f17604f498dda986fda53198f48676` |
| `RUN-STATE.json` | `94b0347eabeb40126f48c8df3bd9488005d6f7cbe83835b72d62ff6480c5ceb3` |
| `cycles/cycle-9/CONTROLLER-CLOSEOUT.md` | `f46360bc2f9010257daab7907bf4db8ce597cfde84eae0bce2defff512d4e231` |
| `cycles/cycle-9/stage6/SYNTHESIS.md` | `70d1129aff69bdb6d92e4834dbfd6bf3807699914f7c208d253d2530afecce25` |

## r7 Terminal Binding

Run `erdos-993-math-dre-20260831-r7-joint-shadow-incidence` completed nine
cycles at its authorized ceiling. Its terminal verdict is
`VERIFIED_PARTIAL_PROGRESS_WITH_OPEN_HEADLINE`; the mathematical headline
states remain open. Twelve candidates passed independent informal audit,
pinned Lean build, kernel check, axiom check, forbidden-token scan, and
statement-fidelity review. The listed declarations are auxiliary or
conditional only.

| Run-relative source artifact | SHA-256 |
|---|---|
| `FINAL-RECONCILIATION.md` | `6d1c0628d5ab98383527fa1fc09d2dee8dd47600f4cc8cd719b465aac74d9a40` |
| `TERMINAL-CHECKPOINT.md` | `2c3288dcb5e4cd45f08cadc930179afd7bcc33ee86d1d6ed3657241abfb56c6c` |
| `SYSTEM-EVALUATION.md` | `fcd1e05c14681d3b0144a28b5c7a0a1c53fca1d70d7a3866bd12d2613548495c` |
| `OBLIGATIONS.csv` | `e2689e65ce148a3d289fa9655578dd0a0aae17e8454f51d5f7fbb882830f993b` |
| `RUN-STATE.json` | `ff2eaf43274e28586d1d71c5b47daea64634eff4ad9861a9914c93cd237e9b44` |

## Published r7 Sources

All projects pin Lean `v4.32.2` and Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`. Each project is run by
`./scripts/verify-lean.sh`, which performs its `lake build`, kernel probe, and
axiom probe. Candidate source paths below are relative to the r7 experiment
root. The source hashes also appear in `evidence/source-hashes.sha256`.

| Candidate | Published project | Principal declaration(s) | Candidate source | SHA-256 | Scope boundary |
|---|---|---|---|---|---|
| `C2-T1-05` | `r7-first-recovery-rank-one` | `C2T105.no_first_recovery_at_one` | `cycles/cycle-2/stage7/candidates/C2-T1-05/formalization/LeanProject/Erdos993MarkedExtensionCharge/C2T105.lean` | `fa7ce3e76fc523d82242c28ee82bf0b6040ea8f803bc4c257ea096eed79f53dc` | Rank-one exclusion only |
| `C3-F3-04` | `r7-double-broom-d1` | `C3F304.C3_F3_04` | `cycles/cycle-3/stage7/candidates/C3-F3-04/formalization/C3F304.lean` | `7ec88d6c3b5bf4645ff91f680a230f2ae961e92ec8f44d663b84fa0fbd26fc7a` | `D_(1,m)` only |
| `C4-F3-06` | `r7-double-broom-d2` | `C4F306.C4_F3_06` | `cycles/cycle-4/stage7/candidates/C4-F3-06/formalization/C4F306.lean` | `dc137080cc614d167a30a5d5a38dd9baa468671df68063f3de936289e46e8d0e` | `D_(2,m)` only |
| `C4-U1-01-C4-U1-02` | `r7-rooted-attachment` | `rootedTree_attachment_transition`, `rootedTree_attachment_coefficients` | `cycles/cycle-4/stage7/candidates/C4-U1-01-C4-U1-02/formalization/C4U1Attachment/Main.lean` | `37f77dbcf22e752449dc91a0471850c684e3da73bb04ea3aaeec2eca36256fca` | Degree-five attachment infrastructure |
| `C5-T1-03` | `r7-endpoint-sign` | `C5T103.C5_T1_03` | `cycles/cycle-5/stage7/candidates/C5-T1-03/formalization/C5T103.lean` | `c4f7faf8656815d3ef907c2ac7d2d0af452520497a54791cf190262282bb4342` | Displayed endpoint antecedents remain assumptions |
| `C5-T3-04-C5-T3-05` | `r7-finite-coupling` | `C5T304C5T305.C5_T3_04_C5_T3_05` | `cycles/cycle-5/stage7/candidates/C5-T3-04-C5-T3-05/formalization/C5T304C5T305.lean` | `7412f12af3957ae199d6595cdac6b0e0108b990f93f6ceff82d0986fc762f7fc` | Coupling and cost antecedents remain assumptions |
| `C6-U1-01-C6-U1-03` | `r7-contextual-attachment` | `C6U101C6U103.C6_U1_01_C6_U1_03` | `cycles/cycle-6/stage7/candidates/C6-U1-01-C6-U1-03/formalization/C6U101C6U103.lean` | `33ca9115b41a67865d0a9497c5259c4d5b3c8c3144b716337f698979dd305f46` | Conditional context-interface theorem |
| `C6-U1-04` | `r7-rooted-signature-countercertificate` | `C6U104.C6_U1_04` | `cycles/cycle-6/stage7/candidates/C6-U1-04/formalization/C6U104.lean` | `c20d79e9083dcba010f4db710d81e75bec70070341adc5fc61f1b0a4fddc2df0` | Finite mechanism countercertificate only |
| `C8-F2-02` | `r7-two-leaf-four-class` | `C8F202.two_leaf_four_class`, `coefficient_identity` | `cycles/cycle-8/stage7/candidates/C8-F2-02/formalization/C8F202.lean` | `f8278ceb74dfbbd601df06b8fdcb24c2f4ffc4cc8283589f0eb8456f2a492a79` | No strict same-leaf conclusion |
| `C8-T3-AUX-CONTAINMENT-STUB` | `r7-containment-stub` | `C8T3ContainmentStub.containment_stub_theorem` | `cycles/cycle-8/stage7/candidates/C8-T3-AUX-CONTAINMENT-STUB/formalization/C8T3ContainmentStub.lean` | `1124a5de3d6e73a5f4323c04c294aa46fab03d6aed22b11e9e6cf167701aa5e6` | Exact marginals, no sign or selector claim |
| `C8-U2-AUX-BOUNDARY-FACTORIZATION` | `r7-boundary-factorization` | `C8U2BoundaryFactorization.componentwise_boundary_factorization` | `cycles/cycle-8/stage7/candidates/C8-U2-AUX-BOUNDARY-FACTORIZATION/formalization/C8U2BoundaryFactorization.lean` | `7d51adf6e5df33dee60768ebe46b1d694b2c4e8f341e08f9a428607c7b8f2b44` | Structural factorization only |
| `C8-U3-AUX-SELECTOR` | `r7-component-selector` | `C8U3Selector.fixedComponentIdentity`, `componentSelectorCharacterization` | `cycles/cycle-8/stage7/candidates/C8-U3-AUX-SELECTOR/formalization/C8U3Selector.lean` | `3f06e76d0ae699920f4de4ee10105d1547ba552a04105ebd58919e41eaf7f161` | Fixed-component characterization, no selector existence |

The original C8-F2 and C8-U3 formalizer executions had disclosed
dependency-setup incidents. Their source hashes remained unchanged and clean
local supervisor replays passed. This record preserves that distinction and
does not describe those original executions as clean no-network runs.
