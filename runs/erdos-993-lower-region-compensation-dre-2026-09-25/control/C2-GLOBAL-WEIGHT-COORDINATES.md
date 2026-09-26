# Proposed global fixed-selector coordinates

Controller algebra, pending route/critic audit; no new claim award. Fix the original selected leaf set F=F(T,p), and retain it unchanged while varying the independent-set rank below. For an independent set B of T, define

    w_F(B) = number of v in F intersect B such that
             N_T(s_v) intersect (B minus {v}) is nonempty.

For each original selected leaf v, A -> A union {v} is a bijection between independent j-sets A in H_v meeting W_v and independent (j+1)-sets B in T counted by the v term of w_F. Independence holds because s_v is excluded from H_v and v has no other neighbor. Conversely B containing v omits s_v and deleting v recovers the marked A. Thus

    sum_(v in F) q_v(j) = sum_(B independent, |B|=j+1) w_F(B),
    S(T,p) = sum_(|B|=p+1) w_F(B) - sum_(|B|=p) w_F(B).

This is a reformulation, not a sign proof. It represents all leaf tags on the same tree, which may permit genuinely cross-tag maps. For a fixed selected support fibre, its contribution to w_F(B) is the number of its selected leaf neighbors in B, multiplied by the indicator that its total number of neighbors in B is at least two. Do not change the selector to F(T,p+1).

A structural bound that may be relevant, but does not control the rank difference: form the bipartite incidence forest on vertex parts B and N_T(B), keeping only edges between the parts. Let c(B) be its number of components, including isolated vertices in B; its vertex set is B union N_T(B). Since T is a tree and B independent, this is a forest. Writing d_B(s)=|N_T(s) intersect B|,

    sum_(s in N(B)) (d_B(s)-1) = |B|-c(B).

Every counted selected leaf contributes at one s with d_B(s)>=2. At each s, the number of counted selected leaves is at most d_B(s)<=2(d_B(s)-1). Hence

    0 <= w_F(B) <= 2(|B|-c(B)).

The inequality is pointwise on the global independent set B, not a pointwise assertion about the leaf summand and not a marked restriction of r27's optimized-root inequality. It supplies no monotonicity in rank. An assignment to a route should demand an actual weighted rank comparison or a precise counterexample to a proposed sufficient weighted inequality, rather than merely repeat this identity.
