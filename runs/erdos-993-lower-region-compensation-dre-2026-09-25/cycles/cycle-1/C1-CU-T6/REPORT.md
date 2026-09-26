# C1-CU-T6 critique report

## Scope and disposition

This review covers exactly the sealed route claim `C1-T6-1`. I retain it at its stated information-loss scope: the homotopy type of an independence complex alone does not determine a fixed-rank coefficient difference, as shown by the edgeless forests on 10 and 11 vertices. It is not a result on the primary aggregate.

## Audit

The independent binomial replay gives `Delta_7(H_10)=45-120=-75` and `Delta_7(H_11)=165-330=-165`. Both independence complexes are full simplices and are contractible. These graphs can occur as `H_v` after deleting a leaf and its center support from `K_(1,11)` and `K_(1,12)`. Therefore the concrete diagnostic is valid within the local induced-forest setting.

The cited Ehrenborg–Hetyei Corollary 6.1 applies to forests and gives a point-or-sphere simple-homotopy type. Its hypothesis bridge to trees and induced forests is sound. It gives no prescribed-rank face-count inequality and says nothing about `Delta_p(T-v)<0`; the route explicitly leaves those bridges open. The relative chain group dimension identity for `q_v(j)` is also correct but is an equality of dimensions, not a sign argument.

The common `K_(1,12)` eligible check is consistent with the target guards and full-sum arithmetic: `(a,x,p)=(12,6,8)`, all 12 leaves are selected, each term is `-165`, and `S=-1980`. The supplied `T_22` and `T_60` controls likewise have positive individual marked terms but negative complete sums. These controls are consistent with the route’s warning that local graded data do not settle the aggregate; they do not test a transport mechanism because the route proposes none. None strengthens the reviewed claim into a general proof.

## Conclusion

Disposition: `retained`. Evidence supports only the topology-versus-rank-data diagnostic. The lower-region aggregate remains unresolved by this route, and no target status is proposed from it. Full arithmetic and citation notes are in `critique-audit.md`.

## Limitations

- No general selected-leaf sum or deficit-budget inequality is proved.
- The homotopy-type comparison is not an eligible positive aggregate counterexample.
- The cited theorem is used only for the point-or-sphere type statement and cannot bridge to fixed-rank signs.
