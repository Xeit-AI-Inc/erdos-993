# C2-CU-T1: U critique of C2-T1 tagged-shadow bound

## Disposition and exact scope

**Proposed retained** for the sole incoming claim `C2-T1-EXACTID-E993-BIPARTITE-TAGGED-SHADOW-BOUND`, at the exact registered auxiliary scope. The finite-set proof in `cycles/cycle-2/C2-T1/REPORT.md` is complete: it works for any finite simple bipartite graph (including disconnected graphs), any tag set, and each integer `1 <= k <= alpha(H)`. The incoming result remains an informal proof with proposed-worker authority. It does not by itself settle `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` or the primary aggregate in `SOLUTION-CONTRACT.md`. The registered identity and its distinctions are stated in `control/C2-SCOPE-AUDIT.md` and `packets/C2-COMMON-NEUTRAL.md`.

## Independent finite-set audit

Let `a=alpha(H)` and `q_j=|{I subseteq V(H): I independent, |I|=j, I intersects W}|`, zero extended. Fix `1<=k<=a`. Define the finite incidence set

`P={(X,u): X independent, |X|=k+1, X intersects W, u in X, (X\{u}) intersects W}`.

For each tagged `X`, put `t=|X intersect W|`. If `t=1`, precisely `k` deletions preserve a tag; if `t>=2`, all `k+1` do. Thus `|P|>=k q_(k+1)`. The map `(X,u) -> (J=X\{u},z=u)` is a bijection from `P` to pairs with `J` a tagged independent `k`-set and `z` an addable vertex outside `J`. For each such `J`, `A(J)={z outside J: z has no neighbor in J}`. The induced graph on `J union A(J)` contains no edge touching `J`, so `k+alpha(H[A(J)])<=a`. Since `H[A(J)]` is bipartite, its larger color class has at least `|A(J)|/2` vertices; consequently `|A(J)|<=2 alpha(H[A(J)])<=2(a-k)`. Summing over tagged `J` yields `|P|<=2(a-k)q_k` and the claimed inequality. No nonempty-tag, connectedness, tree, selector, residual, or first-descent premise is used.

At `k=a`, `q_(a+1)=0` and the inequality is `0<=0`; the incidence proof still applies. For empty `W`, all `q_j=0`, including `q_0`. If `a=0`, there is no permitted `k`, so the quantified statement is vacuous. Isolated vertices and empty induced `A(J)` cause no exception. The inequality is about tagged *set counts*, not a pointwise bound on every addable vertex set independent of its rank and ambient `alpha`.

The origin's connected `P4` example is exact: with edges `{0-2,0-3,1-2}`, tag `{1}`, `a=2`, `q_1=1`, and the two tagged independent pairs are `{1,0}` and `{1,3}`. At `k=1`, both sides are `2`. This shows that the factor `2` and the non-strict sign cannot be uniformly improved at this rank, even for connected trees.

## Fresh larger falsification/sharpness target

Take `H` to be 122 disjoint edges, vertices `(i,0),(i,1)` and edge `(i,0)(i,1)` for `0<=i<122`, and `W={(0,0)}`. This is a 244-vertex bipartite graph within the exact auxiliary scope, with `a=122`. A tagged independent `j`-set contains `(0,0)`, chooses `j-1` of the remaining 121 edges, and picks one endpoint of each. Hence

`q_j=binom(121,j-1) 2^(j-1)` for `1<=j<=122`, with `q_j=0` outside this range. For every `1<=k<=121`, the binomial identity `k binom(121,k)=(122-k)binom(121,k-1)` makes `k q_(k+1)=2(122-k)q_k`. At `k=122`, both sides vanish. In particular the first-rank equality is `242=242`, and the terminal-rank equality is `0=0`. This is a fresh above-243 falsification target and a stronger sharpness check; it is not a tree or a primary-target test. The self-written bounded exact check in `check_matching_244.py` verifies all 122 permitted ranks and records sample exact integers in `matching_244.json`. The algebra, rather than the computation, certifies the entire displayed family and all its ranks.

## Leaf bridge and missing dependency

For a degree-one vertex `v` in bipartite `G`, let its neighbor be `s`, `H=G-{v,s}`, `W=N_G(s)\{v}` viewed within `H`, and `R=G-N_G[s]`. Then `R=H-W` as induced graphs, so `q_j=i_j(H)-i_j(R)` for every integer `j`; adjoining `v` to a maximum independent set of `H` shows `alpha(H)<=alpha(G)-1`. These are exact finite-set identities, including multiple leaves at one support when each leaf is treated separately.

For `p>=2` and `k=p-1`, the guard `3p>=2alpha(G)+1` implies `3k>=2alpha(G)-2>=2alpha(H)`, hence `2(alpha(H)-k)<=k`. If `k<=alpha(H)`, the retained bound and `k>0` imply `q_p<=q_(p-1)`. If `k>alpha(H)`, both counts are zero. Thus the individual unselected summand `Delta_(p-1)(H)-Delta_(p-1)(R)=q_p-q_(p-1)` is nonpositive. At `p=1`, the count lemma cannot be invoked with `k=0`; the guard forces `alpha(G)<=1`. A bipartite graph with an edge and independence number one is `K2`, so `H=R=empty` and the summand is zero. This separately closes the base-case ambiguity in the conditional bridge.

At the primary rank `p=alpha(T)-2`, the high-tail guard is equivalent to `alpha(T)>=7`. The primary eligibility premise `x(T)+2<=p` implies only `alpha(T)>=4` directly; the distinct alpha-at-least-seven implication remains unproved by this incoming claim. If that implication is established, the bridge signs every original-leaf term and hence the complete favorable tagged sum, regardless of repeated supports. Until then the primary remains OPEN. This proof uses integer ranks, strict descent only where eligibility is stated, and the original unshifted selector in `SEMANTIC-CONTRACT.md`.

The known order-91 and order-243 beta witnesses cited in `control/C2-SCOPE-AUDIT.md` are below the high-tail rank guard and concern different scoped statements. The `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` fence addresses a full-G1 residual pointwise assertion, whereas this proof bounds an addable set by `alpha(H)-k` and counts tagged incidences. The Hall/Delete-Retag fences mentioned in the origin report concern a different relation. None of these obstructions negates the retained count lemma, and none is evidence for its application to the remaining eligibility question. No inherited status is altered.

## Replay and limits

The four origin files listed in `packets/C2-CU-T1.json` matched their pinned SHA-256 values. I copied the origin script to my own scratch as `replay_origin_check.py`, ran `python3 scratchpad/C2-CU-T1/replay_origin_check.py > scratchpad/C2-CU-T1/replay_origin_checks.json`, and byte-compared the result to the pinned `cycles/cycle-2/C2-T1/checks.json`; they match. The replay covers 682 graph/partition instances with left and right sizes 1 through 3, 6,568 specified graph-tag instances (empty/full/part sides/singletons with duplicates removed), and their permitted ranks. It does not range over every tag set or any graph above six vertices. The separate 244-vertex target is one explicit graph with one tag set and all ranks. Both checks are bounded corroboration; the universal conclusion rests on the incidence proof.

No Lean build, unbounded sweep, sibling source, source-place script execution, or background job was used. All owned jobs have stopped. Output artifacts reside only in `scratchpad/C2-CU-T1` pending controller admission.
