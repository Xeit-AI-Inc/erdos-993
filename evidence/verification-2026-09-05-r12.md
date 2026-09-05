# Verification Record — r12 Export (2026-09-05)

Binds the four `proofs/lean/r12-*` packages and
`experiments/r12-delta-comparison.md` to the sealed r12 run
`erdos-993-math-dre-20260904-r12-delta-comparison` (internal archive,
closed and sealed 2026-09-04).

## Source bindings (sha256, sealed artifacts of record)

| Artifact | Digest |
|---|---|
| CLOSING-RECORD.md | `1c41a75af2970c9cad8cbb4e7c8562312cc19e172e2631d8d911b31f8fe8691b` |
| SOLUTION-CONTRACT.md | `32073203c9df7d0706d4085e0a6af26f1229acf69fc7072f8264f2120dcdc52c` |
| STUDY-INTERLUDE-1.md | `0bbc3ec67f11a11fdb7d233d930cc439e3029b86b2f34f516c349a98ef5523f2` |
| STUDY-INTERLUDE-2.md | `a8851e5e6fc5f22ab5571ea7e1b7635d9a4ceab96f115503fbd373545277f53e` |
| C2-GATES.md (P1 award) | `f389646ada2e41653fd9b3841d4428ee1838760b9ebebf9287a9f758111220f9` |
| C3-GATES.md (identity awards) | `31383f5632bab6d68dfe149433272d68e3e72bc1c981c062591b93cc71942f5e` |
| C5-GATES.md (composition awards) | `7727fea6ad4efb935be28b69a16de8bae9f7272c6218925fcbdb49451e1af71d` |
| C6-GATES.md (deg-2 reduction award) | `4c20e7663fe83726159859fe24be3d5a578d549550345567807959925f7f37cd` |
| C1..C6 seal manifests | `47fd73974193a8ce… / `8608138c5fc96e95… / `18f3d8f03ac739f9… / `98993d8e3ff993f9… / `23d84cdd3bca5b94… |

## Package verification (this export)

All four packages assembled from gated sources byte-identically (one
disclosed import-line repoint in `r12-composition`, diff in
`proofs/lean/R12-ASSEMBLY-RECEIPTS.md`), built at the pin (Lean 4.32.2
f3b06c70, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`, sole build
input the program's read-only cache, manifest
`52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
verified before and after every build), exit 0, zero repairs, 52/52
checked declarations at exactly `[propext, Classical.choice, Quot.sound]`,
zero live `sorry`. Awarded modules carried two-to-six independent kernel
elaborations inside the run (the composition slate: six, three by
non-authors including the controller).

## Claim boundary

Nothing in this export proves or refutes TREE, FOREST, or TRANSFER;
exhibits a counterexample; or establishes independence. `AlphaTarget` and
`BetaTarget` are unproved hypotheses everywhere they appear;
`AmbientTargetDeg2` is an open residue; every zero-hit search cited in the
lineage is bounded evidence and never universal evidence. Grades named
`governed` are the source run's rubric grades and are not
`formally_verified`.
