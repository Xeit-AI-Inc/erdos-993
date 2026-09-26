# C4-CF-U3 critique (orientation F)

## Scope and disposition

This review covers exactly the two claims in the C4-U3 case: `C4-U3.LOW-COVER-SKELETON` and `C4-U3.LOW-COVER-SIGN`. Source hashes for all three case files and all 179 common listed files matched their packet pins. The permitted common protocol, scope controls, critic brief, and exact case files were read.

### `C4-U3.LOW-COVER-SKELETON` — retained_narrowed

The structural representation is valid. Let `C` be a designated six-vertex cover, `O=V\C`, `D` the vertices of `O` with degree at least two, and `L=|O\D|`. The outside `O` is independent. Each vertex of `O\D` is therefore a degree-one vertex adjacent to `C`; every vertex of `D` has all its neighbors in `C`. Deleting the outside degree-one vertices leaves a connected subtree containing all of `C`: a degree-one vertex cannot be an internal vertex of a path between vertices of `C`. Thus `K=T[C union D]` is a tree.

With `t=|D|`, the exact counts are `n=6+t+L` and `n-1=e_C+sum_D deg(u)+L`, so `e_C+sum_D(deg(u)-1)=5`. Each connector contributes at least one, giving `t<=5-e_C`. Conversely, a connected proposed core satisfying this budget has `5+t` edges on `6+t` vertices, so it is a tree; attaching the prescribed pendant leaves produces a tree with the designated cover. A cover smaller than six can be padded because each target order exceeds six. This proves the stated low-cover representation, including the case of covers of size less than six.

The core-state formula is also correct: for an independent core state `I`, leaves attached to a cover vertex `c` are independently selectable precisely if `c` is outside `N_K[I]`, contributing `(1+z)^m_c`; otherwise they contribute 1. The core intersection is unique, so summing these contributions counts every independent set once. The source correctly flags that cover vertices of degree one in the full tree are original leaves and must be treated as separate tags.

There is an off-by-one arithmetic error in the source's composition count. Weak compositions of `n-6-t` into six parts number `binom(n-t-1,5)`, by stars and bars. At `(n,t)=(30,0)` this is `binom(29,5)=118755`. The expression printed in the recipe, `binom(n-t-2,5)`, instead gives `binom(28,5)=98280`. The reported maximum `118755` is consistent with the corrected formula. Because the recipe says to enumerate **all** weak compositions, this count typo does not omit representations or invalidate the finite recipe. I narrow the disposition to preserve the structural and exhaustive-recipe claim with the corrected count.

### `C4-U3.LOW-COVER-SIGN` — retained

This is an evidence-status statement: the route has not resolved the selector-weighted sign over the four low-cover cells. Its report provides no executed census, exact complete selected sums, or sign inequality. Retain the statement as scoped to this route's evidence; it neither refutes nor proves the mathematical sign assertion.

## Independent work and limitations

I independently derived the edge budget and converse, checked the composition count with stars and bars, and verified the core-state polynomial by partitioning independent sets according to their core intersection. I did not execute a census or source replay, enumerate a tree's independence counts and selectors, or infer a sign for any cell. High-cover trees and the full primary aggregate remain outside this critique. Detailed checks are in `EVIDENCE.json`.

All dispositions and statuses are proposed worker conclusions only.
