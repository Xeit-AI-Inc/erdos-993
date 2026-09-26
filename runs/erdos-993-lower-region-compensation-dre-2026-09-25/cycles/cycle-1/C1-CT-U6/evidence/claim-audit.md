# Claim audit: C1-U6-1

Disposition: `retained`.

1. Order bound: tree bipartiteness partitions vertices into two independent color classes. Each has size at most `a=alpha(T)`, so the order is at most `2a`. There are finitely many simple graphs, and therefore finitely many ordinary trees, up to isomorphism on at most `2a` vertices.
2. Selector preservation: the transposition of any two leaves at the same support is an automorphism. Restricting it to the vertex-deleted graphs proves equality of the full independence-count sequences, hence equality of `Delta_p(T-v)` and of strict selection.
3. Summand preservation: that automorphism induces an isomorphism between the respective two-vertex-deleted graphs. The closed-neighborhood deletion is the same original graph for each leaf at that support. The summand is therefore common, and multiplication by the number of leaves retains every original tag.
4. Boundary: this only establishes finiteness separately for each fixed `a` (and `p`). It gives neither a uniform finite kernel nor a bound on the aggregate sign across supports. No computation or primary-target verdict follows.
