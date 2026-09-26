# C2-CF-U5 replay evidence

## Method and bounded scope

I copied the packet-listed inputs/ordinary_tree_checked.py to this scratch directory without modifying its evaluator. replay.py reconstructs the two trees from the route's explicit edge recipe, uses the copied forest dynamic program and zero-extended coefficient lookup, independently recomputes every leaf selector and every selected summand, and checks the pendant-extension polynomial identities for the base tree, all surviving old leaf selectors, every old-leaf H/R deletion, and the new leaf's H/R deletions. The permitted source's packet SHA-256 is a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d; its source copy is supplied alongside this evidence. This is a replay of the single encoded pair, not a tree census.

## Graph recipe and eligibility

The 18-vertex tree has path edges (0,1),(1,2),(2,3),(3,4),(4,5) and pendant edges (i,6+2i),(i,7+2i) for i=0,...,5. The extension adds vertex 18 and edge (10,18), where 10 was an original leaf attached to support 2. These are connected acyclic graphs. At p=8, both have x=6, alpha=12, so x+2<=p is 8<=8 and 3p<2alpha+1 is 24<25.

## Replayed exact values

Base tree:

- P_T=[1,18,136,574,1519,2672,3216,2672,1519,574,136,18,1].
- Delta_0,...,Delta_12=[17,118,438,945,1153,544,-544,-1153,-945,-438,-118,-17,-1], hence x=6 (including the zero-extended terminal difference).
- For leaves 6,...,17, Delta_8(T-v)=[-452,-452,-430,-430,-434,-434,-434,-434,-430,-430,-452,-452]; all 12 are in F(T,8).
- In leaf order 6,...,17, summands are [-323,-323,-375,-375,-366,-366,-366,-366,-375,-375,-323,-323]; full sum is -4256.

Extended tree:

- P_Tplus=[1,19,153,694,1986,3795,4981,4531,2834,1186,314,47,3].
- Delta_0,...,Delta_12=[18,134,541,1292,1809,1186,-450,-1697,-1648,-872,-267,-44,-3], hence x=6.
- The current leaves are 6,7,8,9,11,12,13,14,15,16,17,18; leaf 10 is now internal. Their Delta_8(Tplus-v) values in that order are [-844,-844,-798,-798,-838,-805,-805,-805,-805,-842,-842,-945], so all 12 current leaves are selected.
- Their summands in the same order are [-494,-494,-616,-616,-473,-600,-600,-590,-590,-501,-501,-192]; full sum is -6267.

Thus this eligible example changes both the selected tagged family (tag 10 is removed, tag 18 added) and the full selected sum. Both sums remain negative, so this is not a counterexample to the primary inequality.

## Recurrence audit and correction

For any graph G containing the graft vertex u, adding a new pendant vertex w at u gives I(G+;z)=I(G;z)+zI(G-u;z) and alpha(G+)=max(alpha(G),1+alpha(G-u)). If u is deleted but w remains in a deletion, then w is isolated and the polynomial is (1+z)I(G;z); if both are deleted it is I(G;z).

For surviving old leaves v != u, the selector polynomial is I(T-v)+zI(T-{v,u}). With H=T-{v,s} and R=T-N_T[s], H+ follows the pendant recurrence if u in H, and gains an isolated w if u was deleted. For R+, the exact cases are: if u=s, w is deleted too and the polynomial stays I(R); if u in R, use I(R)+zI(R-u); if u is a neighbor of s and therefore deleted from R while w survives, use (1+z)I(R). The route's phrase “if u survives outside R” is internally inconsistent with R=T-N_T[s]; it should be the last case above (“if u is deleted from R but w survives”). The replay checks these cases on every surviving old leaf in the example.

For the new leaf w, Tplus-w=T, and its H/R graphs are T-u and T-N_T[u], respectively. Its selector is therefore exactly Delta_p(T)<0. The route's formulas for the new leaf and old selectors are correct.
