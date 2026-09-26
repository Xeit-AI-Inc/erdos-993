# Critique of C1-F5-1 (opposing orientation T)

## Disposition: retained_narrowed

The scalar calculation is correct: at (h,k,q_k,q_(k+1),D,C)=(5,2,1,3,0,0), both sides of the stated incidence equation equal 6, and the relaxed local equation gives k*g=4, hence g=2. This establishes only that the scalar equation plus D,C>=0 does not force a nonpositive local value. The tuple is not certified by a bipartite graph or a rooted tree profile, and it cannot be used as an eligible selected leaf: the strict selector and x(T) conditions have no tree instance attached to it.

The structural constraints are valid for an actual tree and original leaf. Deleting the support s splits T into branches rooted at the neighbors of s; after deleting v, H has one rooted component for each W-neighbor. Independence polynomials multiply over these components, with A_i=B_i+zI(H_i-N[w_i]). Also I(T-v)=I(H)+zI(R), which gives the source's selector formula by coefficient subtraction. Leaves sharing s have equal selector values and equal local profiles up to labels, so their tags enter together with multiplicity. These are exact constraints, but they do not prove the missing aggregate deficit budget.

The T22 and T60 checks confirm the standing warning: each eligible complete selected sum contains a positive local term while its total is negative. The row arithmetic and strict selectors were checked from scratch copies of the pinned JSON controls. The K_(1,12) handoff check is also an eligible negative aggregate; see AUDIT-EVIDENCE.md for its exact recomputation and correction of an initially misstated intermediate rank difference.

Therefore the carried claim is narrowed to: the equation-only scalar relaxation admits the displayed positive integer value, while actual tree-derived profiles obey the listed rooted-factor and selector constraints; none of this decides the complete selected-sum assertion. The target remains unresolved by this route. No source computation is presented as exhaustive, and no outside theorem or new counterexample is used.

## Limitations

- The scalar tuple is not shown realizable by any graph, rooted forest, or tree.
- No proof is given that rooted-product constraints imply the global budget.
- The supplied controls are exact finite checks, not a universal proof.
- The source route provides no full selected-sum proof or refutation.
