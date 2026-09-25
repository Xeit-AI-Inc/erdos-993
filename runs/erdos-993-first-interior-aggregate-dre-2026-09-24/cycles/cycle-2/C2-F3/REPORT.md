# C2-F3 — independent falsification and composition assessment

**Worker result: proposed worker-only.** I found no counterexample or semantic gap in the tagged-shadow composition. The counting inequality has a short direct double-count proof, and the first-interior eligibility condition supplies precisely its high-tail guard. Together they give an informal proof of the unchanged primary aggregate. This is a proof candidate for controller review, not a registry award: this search seat did not run the governed Lean gate, and no formal status is changed here.

## Frozen definitions and exact composition

Let `T` be an ordinary finite connected tree, `a=alpha(T)`, `p=a-2` as an integer, and `x` the first index `j>=0` with strict `Delta_j(T)<0`, including the terminal zero-extension rank. Eligibility is `x+2<=p`. For each **original degree-one vertex** `v`, let `s` be its original support, `H=T-{v,s}`, `W=N_T(s)\{v}` as a subset of `H`, and `R=T-N_T[s]`. Then `R=H-W`. Every leaf tag remains a separate summand, including tags with the same support. The favorable selector remains exactly `Delta_p(T-v)<0`.

For every integer `j`, put `q_j=i_j(H)-i_j(R)`. Since `R=H-W`, this is the number of independent `j`-sets of `H` meeting `W`. Direct subtraction of the definitions gives the literal original summand

`Delta_(p-1)(H)-Delta_(p-1)(R)=q_p-q_(p-1)`.

No rank shift is made in the selector, no new leaves are introduced, and the local comparison below is proved for **every** original leaf without requiring that it be selected. Thus shared supports do not collapse tags: if `lambda` leaves share a support, each separately has a nonpositive term and selected leaves retain their `lambda`-weighted multiplicity.

## Tagged-shadow count, independently derived

For finite bipartite `H`, any `W subseteq V(H)`, and integer `k>=1`, count pairs `(A,B)` with `A subset B`, `|A|=k`, `|B|=k+1`, both independent in `H` and both meeting `W`.

* Given a tagged `A`, every extension vertex lies in the induced bipartite graph `K=H-N_H[A]`. Any independent set in `K`, united with `A`, is independent in `H`; hence `alpha(K)<=alpha(H)-k`. In a bipartite graph one color class contains at least half the vertices and is independent, so `|V(K)|<=2 alpha(K)<=2(alpha(H)-k)`. This bounds the number of extensions of `A`.
* Given a tagged `B`, at most one of its `k+1` deletions destroys the tag: that can happen only if `B` has exactly one member in `W` and that member is deleted. Thus at least `k` deletions give tagged `A`.

Writing `q_j` for the tagged counts, double-counting yields

`k q_(k+1) <= 2(alpha(H)-k) q_k`.

For a leaf `v` of `G` (bipartite suffices), adjoining `v` to every independent set of `H=G-{v,s}` gives `alpha(H)<=alpha(G)-1`. Therefore the sharper bound

`k q_(k+1) <= 2(alpha(G)-1-k) q_k`

holds for `1<=k<=alpha(H)`. If `k>alpha(H)`, both tagged counts are zero, so the desired conclusion is automatic. This handles the rank boundary `k=alpha(H)` as well: the extension count is zero.

If `3p>=2alpha(G)+1` and `p>=2`, set `k=p-1`. Then `3k>=2(alpha(G)-1)`, so `2(alpha(G)-1-k)<=k`. With `q_k>=0`, the inequality gives `q_(k+1)<=q_k`; hence the original leaf term is nonpositive. The separate `p=1` case in the registered pointwise auxiliary is also harmless: its guard implies `alpha(G)<=1`; an existing leaf forces `alpha(G)=1` and `alpha(H)=0`, so both tagged counts vanish. At the primary target `p=a-2`, the guard becomes

`3(a-2)>=2a+1` iff `a>=7`.

Thus the only missing leg in the composition is to show that an eligible tree at this rank has `a>=7`.

## Eligibility excludes `alpha<=6`

Eligibility gives `x<=a-4`; since `x>=0`, `a>=4`. Write `n=|V(T)|`. For trees, `i_1=n` and `i_2=binom(n-1,2)`, so `Delta_0=n-1>0` and `Delta_1=binom(n-1,2)-n`. If `a=4`, eligibility would require `x<=0`, contradicted by `Delta_0>0`. If `a=5`, it requires `x<=1`; here `n>=6` (a nontrivial tree has `a<n`) and `Delta_1>=binom(5,2)-6=4>0`, also impossible.

For any tree of order `n`, count triples by inclusion-exclusion over its `n-1` edges. No triple contains three tree edges, and a pair of edges has a common triple exactly when the edges meet. Hence

`i_3=binom(n,3)-(n-1)(n-2)+sum_u binom(deg(u),2)`,

`Delta_2=((n-1)(n-2)(n-9))/6 + sum_u binom(deg(u),2)`.

If `a=6`, eligibility requires `x<=2`. A nontrivial tree with `a=6` has `n>=7`. For `n>=9`, the displayed formula gives `Delta_2>=0`. For `n=7`, the complement of a maximum independent six-set is a one-vertex cover, so the tree is a star; the formula gives `Delta_2=5`. For `n=8`, that complement is a two-vertex cover `{u,w}` of the seven edges, so `deg(u)+deg(w)>=7`. For nonnegative integers with sum at least seven, `binom(deg(u),2)+binom(deg(w),2)>=9`; the formula gives `Delta_2>=-7+9=2`. In every case `Delta_0,Delta_1,Delta_2` are nonnegative, so `x>=3`, contradicting `x<=2`. This proves the in-scope eligibility size restriction `a>=7` by elementary counting.

Combining this with the preceding tagged-shadow comparison, each original-leaf summand is nonpositive at `p=a-2`; summing over the exact favorable original leaf tags gives `S(T,p)<=0`. The proof does not assume residuality, controller truth, log-concavity, or a shifted selector. The double-count lemma works for disconnected bipartite `H` too; connectedness is needed only for the tree eligibility argument. The `a>=7` boundary is sharp for this guard algebraically: at `a=6`, `3(a-3)=9<10=2(a-1)`, so the coefficient comparison alone would not force the sign.

## Fresh exact larger-tree audit

I built and evaluated `P_1001`, the path on vertices `0,...,1000` with edges `{i,i+1}`. The copied-to-scratch script uses the exact formula `i_j(P_n)=binom(n-j+1,j)` and integer arithmetic. It scans strict differences through `j=alpha`, including the terminal rank. The exact output is in `cycles/cycle-2/C2-F3/path1001_exact.json`; replay with:

`python3 scratchpad/C2-F3/path1001_exact.py > scratchpad/C2-F3/path1001_exact.json`

The tree has `(n,alpha,p,x)=(1001,501,499,277)` and is eligible. Its only original leaves are tags `0` and `1000`, supported by `1` and `999`. For each, the exact binding is `T-v=P_1000`, `H=P_999`, and `R=P_998`; both satisfy the strict, unshifted selector with `Delta_499(T-v)=-20,957,999`. Each term is `-2,593,614,875`, and the complete two-tag sum is `-5,187,229,750`. The script checks the tagged-shadow inequality for all `k=1,...,500` and its monotone consequence at each high-tail rank `k=334,...,500`; at the target rank `k=498`, it records `q_498=2,593,739,625`, `q_499=124,750`. At the terminal tagged rank `k=500`, it records `q_500=1`, `q_501=0`, and both sides of the bound are zero. It also confirms `Delta_(x-1)>=0`, `Delta_x<0`, and `Delta_alpha=-1`.

This is a fresh exact instance beyond the standing order-243 control, not universal evidence. Its role is to check the path coefficient arithmetic, exact selector, both original leaf tags, complete sum, and rank-boundary handling against the proposed composition.

## Inherited fences and limits

The mandatory order-91 `T22` positive marked term is at rank `p=34` with `alpha=68`; it fails the proposed high-tail guard (`102<137`) and is not the primary rank (`alpha-2=66`). The order-243 `T60` positive marked term is at `p=90`, `alpha=182`; it likewise fails the guard (`270<365`) and is not its primary rank (`180`). Their established parent scopes therefore remain fenced, while neither is a counterexample to the restricted composition. Cycle 1's eligible non-residual examples and mixed residual/non-residual tags are also inapplicable as obstructions: the argument above is leafwise and nowhere uses residuality. The known KL non-log-concavity fixtures do not affect the proof; no log-concavity property is assumed. The r26 top-rank theorem is not imported: it concerns `alpha-1` and residual trees.

Exact finite tests cannot prove the all-tree statement. The mathematical argument above is a proposed informal proof chain; this worker performed no Lean build and makes no governed award or registry change. Controller review should independently validate and, if accepted, send the entire fixed-rank composition and small-`alpha` lemma through the governed formalization/fidelity gate.

No owned background jobs were started.
