# C1-U2 — necessary local extension capacity for a positive aggregate

## Result

Let `T,p` satisfy the exact primary eligibility conditions, let `a=alpha(T)`, `F=F(T,p)` be the original favorable-leaf tag set, and put

`k=p-1`, `c=2a+1-3p`.

Then `k>=1` and `c>=1`. For a leaf tag `v`, let `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, and let `e_v(A)` be the number of vertices of `H_v` that can be added to the independent set `A`. A necessary condition for `S(T,p)>0` is that there exist an original favorable leaf tag `v in F` and an independent `k`-set `A` of `H_v` meeting `W_v` such that

`e_v(A) >= p`.

Equivalently, if every pair `(v,A)` with `v in F` and `A` an independent `k`-set of `H_v` meeting `W_v` has `e_v(A)<=p-1`, then `S(T,p)<=0`. The sets are counted once per original leaf tag, so leaves sharing a support retain their multiplicity. This is a proved conditional obstruction for positive witnesses, not a resolution of the primary claim.

## Proof

For each `v`, `H_v` is a forest and `alpha(H_v)=a-1`: a maximum independent set of `T` can be chosen to contain the original leaf `v` and omit its support `s_v`, since replacing `s_v` by `v` preserves independence and size whenever a maximum set contains `s_v`. Removing `v,s_v` from such a set leaves a maximum independent set in `H_v`.

Write `q_v(j)=i_j(H_v)-i_j(H_v-W_v)`. Thus `q_v(j)` counts independent `j`-sets meeting `W_v`. For each marked independent `k`-set `A`, define its deficit `d_v(A)=2(a-p)-e_v(A)`. It is nonnegative: the addable vertices split between the two bipartition classes of `H_v`; either color class together with `A` is independent, so each class has size at most `alpha(H_v)-k=(a-1)-(p-1)=a-p`.

Let `D_v=sum_A d_v(A)`, over these `q_v(k)` marked sets, and let `C_v` count independent `(k+1)`-sets meeting `W_v` at least twice, each set once. Count incidences `(A,z)` where `A` is a marked independent `k`-set and `z` is addable to `A`. The total is `2(a-p)q_v(k)-D_v`. A resulting `(k+1)`-set meeting `W_v` once is counted `k` times, by deleting one of its unmarked vertices; one meeting it at least twice is counted `k+1` times. Therefore

`k*q_v(k+1)+C_v=2(a-p)q_v(k)-D_v`.

Also the selected summand for tag `v` is `q_v(k+1)-q_v(k)`, directly from `Delta_(p-1)(H_v)-Delta_(p-1)(H_v-W_v)`. Rearranging the incidence identity gives

`k*[q_v(k+1)-q_v(k)] = c*q_v(k)-D_v-C_v`,

because `2(a-p)-k=2a+1-3p=c`. Sum over the exact fixed tag set `F`, putting `Q=sum_F q_v(k)` and `E=sum_F(D_v+C_v)`. Then `k*S=c*Q-E`.

If `S>0`, then `E<cQ`. Since `E>=D>=0` and `c>=1`, there must be at least one marked-set incidence `(v,A)` with `d_v(A)<c`; otherwise `D>=cQ` (and if `Q=0`, the formula already gives `S<=0`). Substituting `d_v(A)=2(a-p)-e_v(A)` and `c=2a+1-3p` yields `e_v(A)>p-1`, hence `e_v(A)>=p` because it is an integer. This proves the necessary condition. Conversely, if all such incidences have `e_v(A)<=p-1`, then every deficit is at least `c`, so `D>=cQ`, `E>=D`, and `kS=cQ-E<=0`.

## Scope and limitations

This uses only the original selected leaves and their original supports and neighborhoods. It keeps `x(T)` and `p` fixed because it is a condition on an already eligible pair `(T,p)`; it does not assert that any pruning, grafting, support merge, or path compression preserves the first strict descent or selector. It is useful as a necessary filter in multi-support searches: a positive complete sum requires at least one selected support-fiber tag with a marked rank-`p-1` set having at least `p` actual addable vertices. It gives no evidence that such an incidence is sufficient for a positive total, since other tags and the full `D+C` budget can compensate. No counterexample or proof of the primary inequality is claimed. The argument is exact and non-computational; its graph inputs are finite trees, so the relevant `H_v` are bipartite forests.
