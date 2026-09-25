# C2-AT neutral adjudication — first-interior aggregate

**Proposed worker disposition:** retain all six incoming claims at their exact stated scopes as complete **informal** proofs. In particular, `C2-T3-04` composes to the unchanged primary expression. This is an adjudication proposal, not a canonical registry change or a governed Lean award. `SOLUTION-CONTRACT.md` requires the formal gate for primary success; no Lean build or formal review occurred in this seat. The primary therefore remains **OPEN in the governed sense** pending that gate. No new mathematical claim ID is introduced here.

I used only the three pinned T search reports/returns/evidence, their six pinned F/U critiques/evidence, the contracts and protocols, and the permitted common historical scope packet. All 44 files in `packets/C2-AT.json` matched their listed SHA-256 digests. My own `scratchpad/C2-AT/evidence_audit.py` checks those digests, incoming and critique claim coverage, and selected arithmetic in the sealed finite certificates; its JSON output is `scratchpad/C2-AT/evidence_audit.json`. It does not run any origin evidence script. The proof below is independent of the finite calculations and of the historical r27 order bound.

## Exact definitions and the admitted shadow proof

For a finite simple graph `G`, `i_j(G)` is the number of independent `j`-vertex sets, zero for integer ranks outside `0..alpha(G)`, and `Delta_j(G)=i_(j+1)(G)-i_j(G)` in integers. For a tree `T`, `x(T)` is the least natural `j` with `Delta_j(T)<0`; it exists because `Delta_{alpha(T)}(T)=-i_{alpha(T)}(T)<0`. A flat difference is not negative descent. We use `p=alpha(T)-2` as an **integer** and only pass to natural ranks after eligibility proves `p>=2`.

The two identical shadow statements are `C2-T1-EXACTID-E993-BIPARTITE-TAGGED-SHADOW-BOUND` and `C2-T3-01`; their registered auxiliary identity is `E993-BIPARTITE-TAGGED-SHADOW-BOUND`. Let `H` be any finite bipartite simple graph, including a disconnected or empty graph, let `W` be any vertex subset, put `a=alpha(H)`, and let `q_j` count independent `j`-sets meeting `W`, with zero extension. Fix an integer `1<=k<=a`. Count incidences `(X,u)` such that `X` is an independent `(k+1)`-set meeting `W`, `u∈X`, and `J=X\{u}` still meets `W`. If `X` has one tagged vertex, exactly its other `k` vertices may be deleted; if it has at least two, all `k+1` may be deleted. Thus the incidence count is at least `k q_(k+1)`.

For a fixed tagged independent `k`-set `J`, each admissible extension is one of the addable vertices

`A(J)={z∈V(H)\J: z is adjacent to no vertex of J}`.

Because `J` already meets `W`, **every** such addition retains a tag, so its incidence degree is exactly `|A(J)|`. Every independent set in the induced bipartite graph `H[A(J)]` joins `J` to form an independent set in `H`. Hence `k+alpha(H[A(J)])<=a`. A bipartition of `H[A(J)]` has a color class of size at least `|A(J)|/2`, also when the induced graph has isolates or multiple components. Therefore `|A(J)|<=2alpha(H[A(J)])<=2(a-k)`. Summing over all `q_k` choices of `J` gives the upper bound `2(a-k)q_k`. Double counting proves

`k q_(k+1) <= 2(a-k) q_k`.

There is no division by `q_k`, no nonempty-tag premise, and no connectedness premise. At `k=a`, both sides are zero; when `W` is empty, all tagged counts including `q_0` vanish. If `a=0`, the permitted rank interval is empty. The factor and non-strict inequality are sharp: `C2-T1/REPORT.md` gives a connected `P4` with `W={1}`, `a=2`, `q_1=1`, `q_2=2`, equality at `k=1`. The F/U critiques supply larger exact equality families (`122K2 ⊔ K1` with the isolate tagged and `122K2` with one endpoint tagged), but equality is already transparent from the incidence argument. Sources: `cycles/cycle-2/C2-T1/REPORT.md`, `cycles/cycle-2/C2-T3/REPORT.md`, `cycles/cycle-2/C2-CF-T1/REPORT.md`, and `cycles/cycle-2/C2-CU-T1/REPORT.md`.

## High-tail original-leaf sign, with all endpoint cases

This is incoming `C2-T3-02`, the registered auxiliary `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`, and also the conditional bridge audited by the T1 critics. Let `G` be **any finite bipartite simple graph**, `v` a vertex of degree one in `G`, `s` its unique neighbor, `a=alpha(G)`, and `p>=1` an integer with `3p>=2a+1`. Put `H=G-{v,s}`, `W=N_G(s)\{v}` as a subset of `H`, and `R=G-N_G[s]`. These are induced graphs and `R=H-W`. For every integer `j`, the independent `j`-sets of `R` are exactly those of `H` avoiding `W`, so

`q_j=i_j(H)-i_j(R)`, and `Delta_(p-1)(H)-Delta_(p-1)(R)=q_p-q_(p-1)`.

The original leaf `v` is nonadjacent to every vertex of `H`. It can therefore be adjoined to any independent set of `H`, proving `alpha(H)<=a-1`. If `p>=2`, set `k=p-1>=1`. The guard yields `3k>=2a-2>=2alpha(H)`, or `2(alpha(H)-k)<=k`. When `k<=alpha(H)`, the shadow inequality gives

`kq_p <= 2(alpha(H)-k)q_k <= kq_k`;

because `k>0`, this implies `q_p<=q_(p-1)`. If `k>alpha(H)`, both tagged counts vanish by zero extension, including the case `H=empty`. This also covers `k=alpha(H)`, where `q_p=0`.

At `p=1` the shadow lemma's `k>=1` premise cannot be used. The guard says `3>=2a+1`, so `a<=1`, while the leaf edge makes `a>=1`. From `alpha(H)<=a-1=0`, `H` has no vertices and `q_0=q_1=0`; equivalently, any extra vertex beside `v,s` would be independent of `v`, so `G=K2`. Thus the summand is zero. No selector, residuality, connectivity, or first-descent condition is needed for this high-tail statement. Sources: `cycles/cycle-2/C2-T3/REPORT.md`, `cycles/cycle-2/C2-CF-T3/REPORT.md`, `cycles/cycle-2/C2-CU-T3/REPORT.md`, and both T1 critiques.

## Exact small-alpha exclusion, without an imported order theorem

The two identical eligibility statements are `C2-T2-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` and `C2-T3-03`; their registered auxiliary identity is `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN`. Let `T` be a finite connected tree, `a=alpha(T)`, `n=|V(T)|`, `p=a-2` in integers, and assume `x(T)+2<=p`. This rearranges to `x+4<=a`, so `a>=4`, `p>=2`, and the tree has an edge. Every maximum independent set omits at least one vertex, hence `n>=a+1`.

Every `n`-vertex tree has `n-1` edges, so `i_0=1`, `i_1=n`, and `i_2=C(n,2)-(n-1)=C(n-1,2)`. Consequently `Delta_0=n-1>0`. If `a=4`, eligibility requires `x<=0`, impossible. If `a=5`, then `x<=1` and `n>=6`. Here `Delta_1=C(n-1,2)-n` is `4` at `n=6` and increases by `n-2>0` on passing from `n` to `n+1`; together with `Delta_0>0`, this excludes `a=5`.

Suppose `a=6`. Eligibility demands `x<=2` and `n>=7`. Write `D=Σ_u C(deg_T(u),2)`. There are `(n-1)(n-2)` incidences of a tree edge with a vertex triple. A triple containing two edges is a unique two-edge path, counted twice; a triangle is impossible. There are exactly `D` two-edge paths. Thus inclusion-exclusion gives

`i_3=C(n,3)-(n-1)(n-2)+D`,

and exact integer subtraction yields

`Delta_2=((n-1)(n-2)(n-9))/6+D`.

The fraction is integral as part of this coefficient identity. If `n>=9`, both terms are nonnegative. If `n=7`, the complement of an independent six-set is a single vertex covering all six edges. That vertex has degree six, so `D>=C(6,2)=15` and `Delta_2>=-10+15=5`. If `n=8`, the two-vertex complement `{u,w}` of an independent six-set covers all seven edges. Put `d=deg u`, `e=deg w`, `t=d+e>=7`; an edge `uw`, if present, only raises `t`. By `d²+e²>=t²/2`,

`C(d,2)+C(e,2)>=(t²-2t)/4>=35/4`.

The left side is an integer, hence at least `9`; so `D>=9` and `Delta_2>=-7+9=2`. Thus `Delta_2>=0` in every `a=6` case, and `Delta_0,Delta_1>0` there. Since `x<=2` must be a **strict** negative difference, this is impossible. All `a<=6` possibilities have been excluded and `a>=7` follows.

The T2 origin instead imports the historical r27 forest-descent bound `n<=4x` at the exact negative natural rank. The F/U T2 critiques check that source's finite-carrier, acyclic and integer-difference face, then reduce the contradiction to `a=6,x=2,n=7 or 8`. That route is consistent, but the direct proof above covers all orders, including `n>=9`, and removes r27 from the dependency chain. Its order-seven/eight cover bounds agree with the imported route; the observed order-eight minimum `3` is stronger than the needed analytic floor `2`. Sources: `cycles/cycle-2/C2-T2/REPORT.md`, `cycles/cycle-2/C2-T3/REPORT.md`, `cycles/cycle-2/C2-CF-T2/REPORT.md`, `cycles/cycle-2/C2-CU-T2/REPORT.md`, and both T3 critiques.

## Primary composition and dependency DAG

Incoming `C2-T3-04` is the exact `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` proposition, at the informal-proof level. On an eligible tree, the eligibility lemma gives `a>=7`; with `p=a-2`,

`3p-(2a+1)=a-7>=0`.

A tree is bipartite, and `p>=2`. For **each original** degree-one vertex `v∈L(T)`, apply the high-tail sign to `G=T`, its original support `s_v`, `H_v=T-{v,s_v}`, and `R_v=T-N_T[s_v]`. It gives `Delta_(p-1)(H_v)-Delta_(p-1)(R_v)<=0`. The exact favorable selector is `F_p(T)={v∈L(T):Delta_p(T-v)<0}` at the original, unshifted integer rank. It merely selects some of these already nonpositive terms. Summing over every selected **vertex tag** yields `S(T,p)<=0`; an empty selector yields zero, and two leaves with one support contribute separately. There is no residual hypothesis or selector simplification. The proof signs all original leaves on eligible trees, but the high-tail lemma has its explicit rank guard and makes no all-window pointwise claim.

Dependency DAG (all arrows denote informal mathematical implication, not formalized imports):

```text
C2-T1 tagged shadow = C2-T3-01
              |
              v
         C2-T3-02 high-tail leaf sign
              |                         C2-T2 eligibility = C2-T3-03
              +--------------------------+
                             |
                             v
                   C2-T3-04 exact primary sum
```

The only mathematical facts outside these incoming claims are elementary finite graph definitions, bipartition of trees, and the explicitly proved pair/triple tree counts. Neither r27, r26 top-rank residuality, any all-rank beta assertion, nor a finite computation is a load-bearing dependency. A governed Lean candidate should formalize the four nodes in this order, preserving integer zero extension, the `p=1` base case, the `k>alpha(H)` branch, strict `x`, original leaves, and multiplicity. The informal DAG is closed; the Lean gate has not begun here.

## Objections, inherited fences, and computation provenance

The F/U critiques of T1 and T3 probe empty tags, disconnected bipartite graphs, isolates, multiple tags, `k=a`, `k>alpha(H)`, `p=1`, and the original-neighborhood binding. The count and leaf proofs above resolve each of these explicitly. The F/U critiques of T2 probe integer versus natural rank, strict versus flat descent, maximum versus merely maximal independent sets, and the cover-degree arithmetic; the direct proof resolves them at all orders. Their agreement is **not** the reason for retention: the finite-set double count, exact coefficient count, and rank arithmetic are the evidence. No critique supplied a counterexample at a stated scope.

The inherited order-91 `T_22` and order-243 `T_60` marked positive local margins occur at `(a,p)=(68,34)` and `(182,90)`. They fail the high-tail guard: `3p=102<137=2a+1` and `270<365`, respectively. Their first-interior ranks would be `66` and `180`; the marked lower-rank signs cannot refute the guarded leaf claim or the complete first-interior aggregate. The registered refuted governed beta target/support-fibre and pointwise G1 addability claims concern different all-window or per-residual scopes; the tagged incidence inequality is a count comparison at a bipartite rank. Delete/Retag Hall fences concern a different relation. The candidate `a=5,p=3` and `a=6,p=4` positive-local boundary examples fail eligibility, and the latter also fails `3p>=2a+1`. These scope checks preserve all inherited refutations and do not use an ordinary-to-governed transport. The separate r26 result is at top rank `alpha-1` with residuality, so it supplies no step here. Sources: `control/C2-SCOPE-AUDIT.md`, `cycles/cycle-2/C2-T1/REPORT.md`, all six C2 critique reports, and the original finite controls cited therein.

The bounded calculations are corroboration only, with exact provenance and limits:

* `C2-T1/check_tagged_shadow.py` enumerates all 682 labeled bipartite graphs for left/right partition sizes separately `1..3`, at most six vertices, with the stated empty/full/side/singleton tag families (6,568 graph-tag instances), and all permitted ranks; `checks.json` reports no violation. It also checks all ranks on the single `K_(11,13)` target. `C2-CU-T1` copied and replayed this script in its own scratch and reported byte-identical output. `C2-CF-T1` independently checked an order-245 matching-plus-isolate equality family and `P245` for five tag sets; `C2-CU-T1` checked all ranks of one tagged order-244 matching. These do not cover all tag sets or all bipartite graphs.
* `C2-T2/checks.py` enumerates all `7^5=16,807` and `8^6=262,144` labeled Prüfer-code trees at orders seven and eight, computes exact coefficients and checks the pair/triple formula. It reports minimum `Delta_2` for `a=6` of `5` and `3`. `C2-CF-T2` replayed a copy and checked one order-12 star; `C2-CU-T2` wrote an independent enumerator for those same two orders and tested one order-13 double star. None of these finite runs excludes arbitrary order by itself; the direct coefficient argument does.
* `C2-T3/check_m200.py` builds exactly one order-404 tree (core path `0-1-2-3` and 200 arms `3-(4+2j)-(5+2j)`, `0<=j<200`), compares its polynomial formula coefficient by coefficient with exact tree DP, recomputes all 201 original-leaf deletions and the full selector sum, and reports `(a,x,p)=(202,134,200)` with complete `S=-7833822965762577593267065200163167687295739594691115072102048400`. Both T3 critics copied and replayed this origin script in their own scratch with byte-identical output. `C2-CU-T3` separately checked one order-246 tree with shared-support leaves and complete `S=-7674962447662104250146581966058709582060`. `C2-CF-T3` separately checked one order-407 shared-support tree by two justified leaf orbits, with complete `S=-32932588279043746706956971120439786376090028154584556366670519440`. These are single constructed trees, not exhaustive ranges.

My read-only audit independently checked the source digests, six incoming IDs and all critique coverages, elementary finite-certificate arithmetic, the order-404 per-leaf term identities and full sum, the order-407 orbit-weighted sum, and the order-246 support-row sum. It did **not** rerun Prüfer enumerations or tree DP, and neither its checks nor the source computations establish the universal theorem. No Lean build, subagent, remote/master edit, or source-place script execution was performed. No background jobs were started; all owned commands have exited.

## Per-claim dispositions

| Incoming ID | Proposed disposition | Independent reason and scope |
|---|---|---|
| `C2-T1-EXACTID-E993-BIPARTITE-TAGGED-SHADOW-BOUND` | `proposed_retained` | Complete incidence proof for arbitrary finite bipartite `H`, every `W`, `1<=k<=alpha(H)`; exact registered auxiliary, informal only. |
| `C2-T2-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` | `proposed_retained` | Exact direct `Delta_0/1/2` proof excludes eligible `a<=6` at every tree order; no r27 dependency is needed. |
| `C2-T3-01` | `proposed_retained` | Same exact tagged-shadow statement and proof as T1's ID, with no scope change. |
| `C2-T3-02` | `proposed_retained` | Tagged-set binding and high-tail arithmetic prove the unselected leaf sign for finite bipartite `G`, including `p=1` and zero-extended high ranks. |
| `C2-T3-03` | `proposed_retained` | Same exact eligible-tree threshold as T2's ID, with the all-order direct proof above. |
| `C2-T3-04` | `proposed_retained` | The exact primary complete favorable original-leaf sum follows by summing the guarded signs over its strict selector, with multiplicity and no residual premise; informal proof pending governed Lean gate. |

The six dispositions retain **statements and informal arguments**, not registry statuses. In particular, the historical OPEN identities and the primary OPEN status are not changed by this report. A formal implementation must faithfully encode the contract and pass its own kernel/fidelity review before any primary award.
