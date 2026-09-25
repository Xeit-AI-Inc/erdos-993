# r27 follow-up review: live-record corrections

25 September 2026. This record corrects the living master registry and documentation; sealed r27 source, second reads and Lean packages remain byte-identical. No mathematical status or formal award is changed.

## Corollary B equality endpoints

The informal key `E993-R27-FOREST-ROOT-CORRECTED-DEGREE-LEMMA` includes the valid inequality

\[
nD_k+2k i_k\le 2k i_k n.
\]

Its appended phrase “equality exactly for trees at k = 1” was unqualified and false at the endpoints. At `k=0`, `D_0=0`, so every forest gives equality. If `i_k=0`, then `D_k=0`, and equality again holds, including all out-of-support ranks. For `k=1` and `n>0`, writing `c` for the component count gives `i_1=n` and `D_1=2(n-c)`; equality holds precisely when `c=1`, that is, when the forest is a tree.

The corrected face therefore states: **equality holds at k=0 and whenever i_k=0; for k=1 and n>0, equality holds exactly when the forest is a tree. No complete equality classification for positive supported k>=2 is asserted by this corrected face.** The correct root inequality, its optimized correction, and its `proved_informal` grade are retained. None of the four compiled package awards depends on the erroneous endpoint wording.

Evidence: the independent [review](review/REVIEW.md), its [follow-up check](review/EQUALITY-CORRECTION-CHECK.md), and the controller's exact witness replay. The historical second read remains available under `sources/verity/experiments/erdos-993-forest-degree-extension-dre-2026-09-24/second-reads/SR-RC/SECOND-READ.md`.

## K1 certificate interpolation

The certificate of `E993-R27-KADDITION-CLOSURE-X-LE-5` contained the literal unexpanded template `RE-1 {V.get('RE-1')}`. Remote source readback confirms `verdict[RE-1]: confirmed_with_repairs` in the original SR-REC second read (SHA-256 `74393fc4b83aace731015febc6dabfb9597c3f290b800655b77771458ab19167`). The live certificate substitutes that exact verdict. Its statement, status, evidence grade and prior scope are unchanged.

## First-interior status in the r28 ledger narrative

The r28 historical narrative inadvertently called `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` an active all-rank target. That key is the VERIFIED first-interior slice. The remaining OPEN ordinary all-rank key is `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`. The current ledger distinguishes them; no registry status changes follow.
