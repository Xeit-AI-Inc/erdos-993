# C2-F1 search report: tagged-shadow count and the high-tail sign

**Disposition.** The two proposed bipartite statements survive this search: the registered tagged-shadow inequality has a short proof at exactly its advertised quantifiers, and the proposed high-tail pointwise sign follows after a separate `p=1` case. The proof is informal worker evidence only. It changes no registry status, is not a Lean award, and does not by itself prove the primary target unless the separately proposed ordinary-tree eligibility lemma is also accepted.

## 1. Tagged-shadow inequality, exact scope

Let `H` be a finite bipartite simple graph, `W subset V(H)`, `a=alpha(H)`, and `1<=k<=a`. Let `q_j` count independent `j`-sets that meet `W` (so `q_0=0`). Count incidences `(A,B)` with `A subset B`, `|A|=k`, `|B|=k+1`, and both sets independent and meeting `W`.

For fixed tagged `A`, every possible added vertex lies in the induced graph `X=H-N_H[A]`. Any independent set `I` in `X` has `A union I` independent in `H`, hence `alpha(X)<=a-k`. As `X` is bipartite, its larger color class has size at least `|V(X)|/2` and is independent, so `|V(X)|<=2 alpha(X)<=2(a-k)`. The number of extensions that also leave `B` tagged is no larger than `|V(X)|`. Thus there are at most `2(a-k)q_k` incidences when counted from `A`.

For each tagged `B`, deleting a member of `B` preserves intersection with `W` in at least `k` ways: if `|B intersect W|=1`, only deleting that unique tagged vertex can fail; if it is at least two, every deletion succeeds. Counting from `B` therefore gives at least `kq_(k+1)` incidences. This proves `kq_(k+1) <= 2(a-k)q_k`, including `k=a` (then no extension exists). The proof does not require `W` nonempty, connectedness, a tree, a leaf selector, or residuality. Empty `W` gives both q-counts zero. The guard `k>=1` is used in the deletion count and must not be dropped.

A useful stronger application form follows when a leaf `v` of a bipartite `G` has support `s`, `H=G-{v,s}`, `W=N_G(s)\\{v}`, and `b=alpha(G)`. The set `W` is viewed inside `H`; `R=H-W=G-N_G[s]`; `q_j=i_j(H)-i_j(R)`. Every independent set of `H` can be extended by `v` in `G`, so `alpha(H)<=b-1`. Replacing `a` by this bound in the extension count gives

`k q_(k+1) <= 2(b-1-k)q_k`

whenever `1<=k<=alpha(H)`; the factor is nonnegative in that range. For `k>alpha(H)`, both q-counts vanish. This stronger formula is an application with the extra leaf binding; it is not a redefinition of the registered arbitrary-`H` auxiliary.

## 2. High-tail sign and quantifiers

For the leaf above, integer zero-extension gives

`Delta_(p-1)(H)-Delta_(p-1)(R) = q_p-q_(p-1)`.

If `p>=2`, put `k=p-1>=1`. The guard `3p>=2b+1` is exactly strong enough to give `3k>=2(b-1)`, hence `k>=2(b-1-k)`. If `k>alpha(H)`, both tagged counts are zero. Otherwise `0<=2(b-1-k)<=k`, so the application inequality yields `k q_(k+1)<=kq_k`; division by the positive integer `k` gives `q_p<=q_(p-1)`. This proves the proposed single-leaf pointwise sign, without a favorable-selector assumption.

At `p=1`, the guard says `3>=2b+1`, so `b<=1`. The existing degree-one edge forces `b>=1`, hence `b=1`. Any vertex left in `H` would be independent from `v`, giving an independent pair in `G`; therefore `H` is empty, as is `R`, and the displayed difference of `Delta_0`s is zero. This case is required because the tagged-shadow lemma has `k>=1`. A disconnected bipartite `G` causes no exception: any other component would contain a vertex of `H` and force `alpha(G)>=2`.

At the primary rank `p=alpha(T)-2`, the guard reduces to `3(alpha-2)>=2alpha+1`, equivalently `alpha>=7`. This does not by itself establish eligibility. I independently checked the proposed small-alpha exclusion: eligibility forces `alpha>=4`; a connected tree has `n>=alpha+1`; `Delta_0=n-1>0`; for `alpha=5`, `Delta_1=C(n-1,2)-n>0` for `n>=6`; and for `alpha=6`, eligibility would force `x<=2`, while `Delta_1>0` and

`Delta_2(T)=((n-1)(n-2)(n-9))/6 + sum_u C(deg(u),2)`.

For `n>=9` this is nonnegative. If `n=7`, the complement of a maximum independent 6-set is one vertex, forcing `T=K_(1,6)` and `Delta_2=5`. If `n=8`, the complementary two-vertex cover meets all seven edges, so its endpoint degrees sum to at least 7 and their binomial-degree contribution is at least `C(3,2)+C(4,2)=9`; the base term is `-7`, hence `Delta_2>=2`. In all cases no strict descent occurs by index 2, contradicting eligibility. Thus the proposed eligibility lemma, if accepted, composes with the pointwise sign to make every original-leaf summand nonpositive on the primary eligible class. The final composition still depends on faithful adoption of that separate lemma; no claim is awarded here.

## 3. Exact constructed boundary and fresh larger checks

The family used for exact checks is the tree on vertices `v=0,s=1,u=2,w=3` and `a_j=4+2j,b_j=5+2j` (`0<=j<m`) with edges `0-1, 1-2, 2-3, 3-a_j, a_j-b_j`. It has order `4+2m`, original leaves `0,b_0,...,b_(m-1)`, and `alpha=m+2`: the set `{v,u} union {a_j}` attains this, and conditioning on whether `w` is selected gives the matching upper bound. For leaf `v`, `H` consists of `u-w` and the `m` attached `a_j-b_j` arms, while `W={u}`. Its tagged generating polynomial is `z(1+2z)^m`, so at `p=m`,

`q_p-q_(p-1)=m(5-m)2^(m-3)` (for the checked `m>=3`).

Consequently `m=4` is a real pointwise positive boundary example: `(n,alpha,p)=(12,6,4)`, marked summand `8`, but `3p=12<13=2alpha+1`. At `m=3`, the marked summand is `6` and the complete favorable-leaf sum is `9`, but `(alpha,p,x)=(5,3,3)` fails eligibility and the tail guard. At `m=5`, the tail guard is attained with equality, and the marked summand is `0`; however `x=4`, so this row is not primary-eligible. These examples locate the tail boundary but refute neither the scoped high-tail statement nor the primary target.

Fresh larger targets use the same fully specified constructor with `m=10` (order 24) and `m=20` (order 44). Exact forest-polynomial DP gives respectively `(alpha,p,x)=(12,10,8)` and `(22,20,14)`; both are primary-eligible and meet the high-tail guard. At `m=20`, all 21 original leaves satisfy the strict selector `Delta_p(T-v)<0`; the exact tagged-leaf term is `-39,321,600`, every other selected leaf term is `-322`, and the complete sum is `-39,328,040`. At `m=10`, all 11 leaves are selected; the tagged-leaf term is `-6,400`, each other selected term is `-62`, and the complete sum is `-7,020`. Exact selector/summand rows, including the `m=3,4,5` boundaries, are in `cycles/cycle-2/C2-F1/checks.json` (physical worker copy: `scratchpad/C2-F1/checks.json`). These are constructed finite checks, not universal proof evidence.

The deterministic checker uses exact integer forest recursion: at a root, `P_in=z*product(P_out(child))`, `P_out=product(P_in(child)+P_out(child))`, and component polynomials multiply. For each original leaf it computes the induced polynomials of `T-v`, `H_v`, and `R_v`, applies zero-extended signed `Delta`, records the unshifted selector at `p`, and sums selected terms with leaf multiplicity. Replay from the run root: `python3 scratchpad/C2-F1/checks.py`. It checks only `m in {3,4,5,10,20}`; it is not an exhaustive family proof.

## 4. Inherited fences and exact scope

The pinned order-91 `T_22,p=34` and order-243 `T_60,p=90` positive marked margins concern the inherited all-window governed beta scopes. They are below the proposed high-tail guard: their exact `(alpha,p)` pairs are `(68,34)` with `102<137` and `(182,90)` with `270<365`. They therefore do not falsify the new rank-restricted ordinary-bipartite pointwise sign. The refuted support-fibre beta claim likewise concerns a different governed all-window scope; no ordinary-tree to governed-`RTree` transport is used here. The registered pointwise addability refutation is about per-set addability, whereas this proof bounds the size of the whole induced candidate extension graph using bipartiteness and its independence number. No other one of the 89 inherited refutations is an exact refutation of the arbitrary tagged-count inequality or the rank-guarded ordinary bipartite summand. They remain untouched.

**Limitations.** This is a complete informal counting proof and a separate informal eligibility derivation, not a formal Lean proof or a controller adjudication. The finite checker covers exactly five family parameters and supplies no universal inference. No unbounded search, sibling scratchpad, Lean build, or background job was used; there are no owned jobs to stop.
