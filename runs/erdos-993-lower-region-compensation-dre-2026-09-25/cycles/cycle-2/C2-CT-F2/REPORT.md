# C2-CT-F2 critique report

## Coverage and disposition

Covered source claim: `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` from C2-F2. **Disposition: retained**, restricted to the source return's stated bounded conclusion: the two exact eligible examples have negative complete selected sums, and this route does not resolve the universal claim. The return's proposed status remains `proposed_open`.

## Independent audit

I verified the listed source pins and read the primary contract, cycle-2 protocol and handoff, execution policy, critique brief, and only the common controls and C2-F2 files authorized by the packet. The claim uses the proper primary scope. Its selector is the fixed strict test `Delta_p(T-v)<0`; its summands use the original leaf support and original closed neighborhood; equal-support leaves retain separate tags. The route makes no inference from a positive local term to a full-sum counterexample and no global proof claim.

The tree-DP evaluator was copied into this scratch directory. Both source replay scripts were copied and adapted only to import that local evaluator copy and write their JSON beside the scratch scripts; no sealed file was changed. I inspected the coefficient recurrence: each rooted tree has excluded state equal to the product of child total states and included state equal to the product of child excluded states; component polynomials multiply. The coefficient function zero-extends ranks, and `first_strict_descent` tests through rank `alpha`, including the terminal difference. The replay outputs were additionally checked for the complete coefficient-vector degree, no negative difference before `x`, a negative difference at `x` and at terminal rank `alpha`, strict negativity of every selected leaf's `Delta_p(T-v)`, equality of the expanded row count and favorable count, and exact summation of all row terms.

For the deleted-arm example, the construction has 239 vertices and 238 edges, is connected by its root construction, and has `alpha=179`, `x=86`, `p=90`; thus `x+2=88<=90` and `3p=270<359=2alpha+1`. The distinguished leaf is selected and contributes zero; all 177 leaves on the 59 remaining three-leaf arms are selected, each contributing `-967598047698738457682281452059074396558996699664118837`. The complete sum is `-171264854442676707009763817014456168190942415840549034149`.

For the fresh mixed-arm example, the construction has 262 vertices and 261 edges, is connected by its root construction, and has `alpha=196`, `x=94`, `p=96`; thus `x+2=96<=96` and `3p=288<393=2alpha+1`. The distinguished leaf and all other original leaves are selected: one distinguished leaf, two leaves on the two-leaf arm, and 192 leaves on the 64 three-leaf arms. Their respective per-leaf summands are `68936685941554851752273316418217317715692442678170969440`, `-67150687626637070873560705941144119543366469364879833171712`, and `-120267598545376401819906434809614564165711622909828362611506`. The complete sum is `-23225611359279601736317404622011866341585648844974127116783136`.

The class expansion is justified by permutations of equal root-adjacent arms and of leaves within each arm, which preserve the whole tree and map any leaf in a class to its representative. In both examples, the source replay evaluates `H=T-{v,s_v}` and `R=T-N_T[s_v]`; the recorded `g` is `(i_p(H)-i_p(R))-(i_(p-1)(H)-i_(p-1)(R))`, exactly the contracted summand. There is no selector, support, neighborhood, multiplicity, guard, or arithmetic defect in these two rows.

## Scope limit

The two replays are exact checks of two constructed trees, not a census of a perturbation family and not an inequality over all family parameters. In particular, they do not establish the route assignment's alternative of a family-wide inequality, prove the universal aggregate, or refute it. No imported theorem or formal award is used. The primary remains open on this evidence.
