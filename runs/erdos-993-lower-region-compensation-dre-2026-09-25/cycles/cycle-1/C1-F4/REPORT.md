# C1-F4: parameterized symmetric hub trees

## Exact target

The registered target is the complete fixed-selector aggregate

`S(T,p) = sum_{v in F(T,p)} (Delta_{p-1}(T-{v,s_v}) - Delta_{p-1}(T-N_T[s_v]))`,

where `F(T,p)` contains the original leaves satisfying `Delta_p(T-v)<0`, under `x(T)+2<=p` and `3p<2 alpha(T)+1`. The search below tests the complete sum, counting every favorable original leaf separately.

## Parameter family and exact formula

For integers `m>=2`, `d>=1`, and `L>=2`, take a central root adjacent to `m` hubs, with each hub carrying `d` internally disjoint pendant paths of `L` edges. This is a finite ordinary tree of order `1+m(1+dL)`. Let `A_L(z)` be the independence polynomial of a path on `L` vertices, with `A_0(z)=1`, `A_1(z)=1+z`, and `A_L=A_{L-1}+zA_{L-2}`. One hub branch has polynomial `Q_{d,L}(z)=A_L(z)^d+zA_{L-1}(z)^d`: the two terms condition on excluding or including that hub. Conditioning on the central root gives the whole-tree identity

`I_T(z)=Q_{d,L}(z)^m + z A_L(z)^(dm)`.

The computation forms the exact integer coefficient vector by tree dynamic programming. It finds `x` by checking every rank `j=0,...,alpha(T)` with zero extension, then for each `p` in that vector's eligible lower-region window it evaluates the strict selector on every original leaf and sums the corresponding exact summands. No asymptotic sign is inferred from this experiment.

## Bounded exact result

The replayable census uses the box `2<=m<=6`, `1<=d<=4`, `2<=L<=5`. It contains 80 parameter triples and 151 eligible `(tree,p)` rows. Every row has a negative complete aggregate: 151 negative, zero zero, zero positive. Thus this family and box yielded no counterexample. The experiment is a finite observation, not evidence that the whole family or the registered target is nonpositive.

Selected exact rows `(m,d,L; order, alpha, x, p; |F|, S)` are:

- `(2,3,3; 21,13,6,8; 6,-3894)`
- `(3,2,4; 28,15,8,10; 6,-81156)`
- `(3,3,3; 31,19,9,11; 9,-504855)`
- `(3,3,3; 31,19,9,12; 9,-597924)`
- `(4,2,3; 29,17,9,11; 8,-183072)`
- `(4,2,4; 37,20,11,13; 8,-6643688)`

The count, selected rows, and complete positive-row list are in `evidence/census.json`. Run `python3 evidence/symmetric_hub_census.py` from this worker directory to regenerate it; the script imports the pinned `inputs/ordinary_tree_checked.py` helper from the run root. The helper implements exact forest independence-polynomial dynamic programming and computes each original-leaf summand from the original tree operations.

## Status and gaps

This supplies only a bounded exact negative census for the stated symmetric family. It does not establish a sign outside the finite box, does not cover mixed branch degrees or mixed path lengths, and does not prove the lower-region aggregate. No positive eligible complete aggregate was found, so there is no refutation witness. The registered target remains unresolved by this route.
