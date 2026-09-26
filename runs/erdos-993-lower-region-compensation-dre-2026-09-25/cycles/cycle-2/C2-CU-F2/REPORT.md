# C2-CU-F2 critique report

## Coverage and disposition

Reviewed the sole source claim `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` from orientation U. **Disposition: retained.** Its exact computational assertions and OPEN conclusion are supported at the two stated tree/rank instances. The conclusion is properly bounded: neither example proves the universal inequality, and neither refutes it.

All 33 SHA-256 pins in the two assigned packets (27 common-source entries and 6 case entries) matched. I read the four required read-first common files, the exact six case files, and the additionally authorized `control/C2-CRITIC-BRIEF.md`. Both replay scripts and the pinned evaluator were copied into this scratch root; the evaluator path was changed only in the local script copies. Each regenerated JSON evidence file is structurally identical to its sealed case counterpart.

## Independent checks

The one-arm deletion recipe reconstructs the ordinary tree with path edges 0-1-2 and 59 root-adjacent 3-leaf arms: order 239, edges 238, rank p=90. The mixed-arm recipe has path 0-1-2, one root-adjacent 2-leaf arm, and 64 root-adjacent 3-leaf arms: order 262, edges 261, rank p=96. Both are connected acyclic simple graphs by their explicit construction (a path with pendant stars attached at the root).

For the first tree, the recomputed independence polynomial has degree a=179 and first negative zero-extended difference x=86; its terminal difference at rank a is -1. Thus x+2=88<=90 and 3p=270<359=2a+1. For the mixed tree, a=196, x=94, terminal difference -1, x+2=96, and 3p=288<393=2a+1. In each instance the full coefficient vector and all differences from rank zero through x are retained in its evidence JSON.

The selector is the strict condition Delta_p(T-v)<0 on T-v. It was recomputed on one representative from each leaf automorphism class. Since each deletion tree is invariant under permutations of equal arms and of leaves within an arm, this representative check applies to every leaf in that class; the expanded evidence records each distinct original leaf tag. All representatives are strictly selected:

- Order 239, p=90: distinguished path leaf -2178124967967682829042035883690541869682809749706937126; each of 177 3-leaf-arm leaves -1872676793231559205287962538462127953659514442943309521. Total |F|=178.
- Order 262, p=96: distinguished path leaf -376191569581708189414030936608987003323018075937006832899806; the two leaves on the 2-leaf arm each -358569995408420433739593229101958018190260157738854903740798; each of 192 3-leaf-arm leaves -343964960108065286044245922257330898236808251985733665630557. Total |F|=195.

For each representative, the evaluator takes the support in the original tree, forms H=T-{v,s_v} and R=T-N_T[s_v], and calculates
`g = (i_p(H)-i_p(R))-(i_(p-1)(H)-i_(p-1)(R))`, exactly the contracted summand. The recorded H/R orders and witness neighbors are consistent with each recipe. Re-summing the expanded distinct tags gives:

- Order 239: distinguished contribution 0 and 177*(-967598047698738457682281452059074396558996699664118837), so S=-171264854442676707009763817014456168190942415840549034149.
- Order 262: 68936685941554851752273316418217317715692442678170969440 + 2*(-67150687626637070873560705941144119543366469364879833171712) + 192*(-120267598545376401819906434809614564165711622909828362611506), so S=-23225611359279601736317404622011866341585648844974127116783136. The positive selected term is real, but the complete sum is negative.

The dynamic program rejects cycles and performs exact integer polynomial arithmetic. Its degree is the independence number; its descent scan includes rank a and therefore applies the required zero extension at the terminal rank. The formulas for the selector, H, R, and g were checked against the contract. No favorable leaf or support multiplicity is omitted or counted twice.

## Scope and limitations

These are two explicitly generated trees, not an exhaustive family search. The first is an arm deletion from the stated T_family shape; the second is a 262-vertex mixed-arm perturbation. Their exact eligibility and negative full sums are valid bounded evidence. They do not establish a compensation theorem, constrain arbitrary perturbations, or imply the universal primary claim. No positive full-sum counterexample or proof is supplied. No independent formal proof of the primary assertion is claimed.

## Scratch evidence and replay

The scratch-local `removed_arm.py` and `replay.py` import only the scratch copy `ordinary_tree_checked.py`, regenerate `EVIDENCE-REMOVED-ARM.json` and `EVIDENCE.json`, and produce results equal to the sealed source JSONs. Final admission paths are listed in RETURN.json.
