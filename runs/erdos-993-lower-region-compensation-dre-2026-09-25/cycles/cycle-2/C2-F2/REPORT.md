# C2-F2 search report

## Route and scope

The assigned F2 route asks whether perturbing the eligible order-91 and order-243 positive-local examples can weaken their compensating supports, and requires a fresh larger eligible full-sum test. I used the primary key `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` exactly as contracted. All common-source SHA-256 pins matched. The case packet lists no additional worker files. I used the common contract, worker protocol, execution policy, C2 handoff and F2 allocation, plus only the common listed controls and approved evaluator named below.

## Method

All coefficient arithmetic is exact integer tree dynamic programming using the pinned `inputs/ordinary_tree_checked.py`. The replay scripts in this worker directory construct the trees, calculate independence polynomials, compute the first strict descent through its first negative difference, test the selector separately for each leaf automorphism class, and expand each selected class to its distinct original leaf tags. For each selected representative, they also compute `H=T-{v,s_v}`, `R=T-N_T[s_v]`, and the summand `i_p(H)-i_p(R)-i_(p-1)(H)+i_(p-1)(R)`. Class expansion is exact because branches of a fixed size and leaves within a branch are related by automorphisms fixing the root and distinguished arm. The evidence JSONs retain the complete tree coefficient vector, all differences from rank 0 through x, representative `T-v`, `H`, and `R` vectors, and every selected leaf/support/summand record.

## Removing a compensating arm from the order-243 control

The permitted order-243 control is `T_family(60)` at `p=90`, with `a=182`, `x=87`, 181 favorable leaves, full sum `-1058142362147652597702654588268394677176033202323316960380`, and distinguished-leaf local summand `2935177632783649903488454322226807645411570590073000`.

I deleted one entire root-adjacent `K_1,3` arm, giving `T_family(59)` of order 239, and retained `p=90`. The exact checks give `a=179`, `x=86`, so `x+2=88<=90` and `3p=270<359=2a+1`. Every leaf remains in the original favorable selector: one distinguished leaf and 177 arm leaves, for `|F|=178`. The distinguished local summand drops to zero; each arm leaf contributes `-967598047698738457682281452059074396558996699664118837`. Thus

`S = 0 + 177*(-967598047698738457682281452059074396558996699664118837) = -171264854442676707009763817014456168190942415840549034149`.

The removed-arm perturbation weakens the positive local term but does not remove enough negative compensation to threaten the full sum. Exact reconstruction and all tags are in `EVIDENCE-REMOVED-ARM.json`; run `python3 removed_arm.py` to regenerate it.

## Fresh larger mixed-arm test

For a fresh test beyond the supplied order-252 row, I used a connected 262-vertex tree with root 0, distinguished path `0-1-2`, one root-adjacent center with two leaves, and 64 root-adjacent centers each with three leaves. This is a mixed-arm perturbation of the same positive-local/compensating-arm shape. At `p=96`, exact dynamic programming gives `a=196` and `x=94`, hence `x+2=96` and `3p=288<393=2a+1`.

All 195 original leaves are selected. The distinguished leaf has positive local term `68936685941554851752273316418217317715692442678170969440`. The two leaves on the two-leaf arm each contribute `-67150687626637070873560705941144119543366469364879833171712`; the 192 leaves on the three-leaf arms each contribute `-120267598545376401819906434809614564165711622909828362611506`. Therefore the complete sum, with multiplicity for every original tag, is

`S = 68936685941554851752273316418217317715692442678170969440 + 2*(-67150687626637070873560705941144119543366469364879833171712) + 192*(-120267598545376401819906434809614564165711622909828362611506)`

`  = -23225611359279601736317404622011866341585648844974127116783136`.

The positive selected term is more than offset in this test. The full polynomial vectors, the three selector checks, all representative deletion vectors, and the expanded 195-leaf list are in `EVIDENCE.json`; run `python3 replay.py` to regenerate it.

## Finding and limits

These exact tests do not prove the universal aggregate. Removing one arm from the order-243 shape erased its positive distinguished summand while preserving a negative full sum; the fresh larger mixed-arm tree retained a positive distinguished summand and also had a negative full sum. They give no sign theorem for other perturbations and no counterexample. The primary claim remains OPEN; no formal award or status change is proposed.
