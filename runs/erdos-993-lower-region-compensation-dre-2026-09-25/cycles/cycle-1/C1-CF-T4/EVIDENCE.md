# C1-T4-1 audit evidence

## Identity checks

For `G=T-v`, independent sets containing `s` correspond to independent sets of `R=H-W` after deleting `s`; those omitting `s` are independent sets of `H`. This proves `i_j(G)=i_j(H)+i_(j-1)(R)` at every integer rank under zero extension. Taking consecutive differences proves the selector decomposition without a rank shift error.

For each independent `p`-set `J` in `G`, count its addable vertices. Every independent `(p+1)`-set has exactly `p+1` deletions, each producing such a pair, so `sum_J e_G(J)=(p+1)i_(p+1)(G)`. A selected leaf has `i_(p+1)(G)<i_p(G)`, hence `i_p(G)>0` and the uniform distribution is defined. The strict expectation comparison follows by division.

For `q_j=i_j(H)-i_j(R)`, subtraction gives the target summand `q_p-q_(p-1)`. In the marked incidence count, an extension with one mark has `k` deletions leaving a marked set; one with at least two marks has `k+1`. Therefore `sum_A e_H(A)=kq_(k+1)+C`. Combining with the definition of `D` yields `kq_(k+1)+C=2(h-k)q_k-D`. Summing the resulting `k(q_p-q_k)` identity over the original fixed selector, with `h=a-1`, `k=p-1`, gives coefficient `2(h-k)-k=2a+1-3p` exactly.

## Scope and limitations

These identities are exact for the ordinary graph operations and ranks stated. The two expectation measures are on different graphs and ranks; the marked measure additionally conditions on meeting `W`. The favorable-selector expectation bound does not by itself give the needed aggregate deficit lower bound. The strict lower-region coefficient is positive, so `D,C>=0` is insufficient. No coupling, conditional expectation comparison, or cross-leaf transport has been supplied.

The common handoff's mandatory controls include eligible examples with complete negative sums despite positive individual marked terms (`T22` and `T60`). They do not refute this target and do not provide the missing proof. This review made no replay or new computation; its evidence is a direct exact-arithmetic audit of the route's combinatorial identities and scope.
