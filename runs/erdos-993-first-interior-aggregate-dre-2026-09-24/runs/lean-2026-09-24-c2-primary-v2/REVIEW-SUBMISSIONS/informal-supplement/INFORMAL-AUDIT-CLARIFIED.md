---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: interior-c2-formalization-team
critic_id: interior-c2-informal-reviewer
attestation_id: interior-c2-primary-informal-v2
claim_sha256: 3b0daafb87a54a73c5d994daf52827458faa38ee98088eebd8b99b28f885f89a
run_id: lean-2026-09-24-c2-primary-v2
---

# Informal Proof Integrity Audit

## Intended Claim

The sole audited theorem is the ordinary finite-tree first-interior primary in `runs/lean-2026-09-24-c2-primary-v2/SOURCE/CANDIDATE-PROOF.md`, with the conventions in its pinned `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`. For a tree `T`, write `a=alpha(T)`, integer `p=a-2`, and `x(T)=min{j>=0: i_(j+1)(T)-i_j(T)<0}`. If `x(T)+2<=p`, the complete leaf-indexed sum

`S(T,p)=sum_{v original leaf, Delta_p(T-v)<0} [Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N_T[s_v])]`

is at most zero. Negativity in the selector is strict, and the selector uses the original unshifted rank `p`. Leaves with one support remain distinct terms. There is no residual-tree premise. The planned declaration in the v2 `THEOREM-CONTRACT.yaml` has precisely `G.IsTree` and `C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2` as mathematical premises, and conclusion `C5LA1.aggregate G (G.indepNum - 2) ≤ 0`. In particular, `alpha(G)>=7` must be derived inside the proof.

The v2 packet's 12 SHA-256 pins all matched the files inspected. I compared the v1 and v2 candidate proof, semantic and solution contracts, imported Lean source files, and other mathematical source files byte for byte: they are unchanged. The planned Lean statement text and conclusion are unchanged. The v2 supersession alters intake metadata and reviewer assignment, as recorded in `control/C2-LEAN-INTAKE-V2-SUPERSESSION.json`. The v2 reviewer profile supplies the claim hash in this frontmatter.

## Reproduced Mathematical Evidence

**Eligibility and low independence number.** The natural-number premise cannot hold for `a<=3`, since its left side is at least two and `a-2` is at most one. For `a>=4` the natural subtraction equals integer `a-2`, so it forces `x<=a-4` and `p>=2`. A tree with `a>=4` has an edge and `n>=a+1`. Its pair count is `i_2=C(n,2)-(n-1)=C(n-1,2)`, while `i_0=1` and `i_1=n`. Thus `Delta_0=n-1>0`, excluding `a=4`, where eligibility would force `x=0`. For `a=5`, `n>=6` and `Delta_1=C(n-1,2)-n>=4>0`, excluding the only possible first-descent ranks zero and one.

For `a=6`, eligibility would force `x<=2` and `n>=7`. Let `D=sum_u C(deg(u),2)`. Counting triples with one edge, correcting for each meeting pair of edges, and observing that a tree has no triangle gives `i_3=C(n,3)-(n-1)(n-2)+D`. Therefore `Delta_2=((n-1)(n-2)(n-9))/6+D`. For `n>=9` this is nonnegative. For `n=7`, a six-vertex independent set leaves a vertex cover of size one; its vertex has degree six, so `D>=15` and `Delta_2>=-10+15=5`. For `n=8`, the complement of a six-vertex independent set is a vertex cover of size two `{u,w}`. Since all seven edges touch this cover, `deg(u)+deg(w)>=7`; the minimum of `C(d,2)+C(e,2)` over nonnegative integers with `d+e>=7` is nine, at degrees three and four. Hence `D>=9` and `Delta_2>=-7+9=2`. The first three differences are nonnegative throughout the `a=6` case. Strict first descent at or before two is impossible, proving `a>=7` from the original premises alone. This uses neither a prior order-bound theorem nor finite enumeration.

**Tagged bipartite shadow.** For any finite bipartite graph `H`, including disconnected or empty graphs, any vertex set `W`, and `h=alpha(H)`, let `q_j` count independent `j`-sets meeting `W`. For `1<=k<=h`, count pairs `(A,B)` where `A` and `B` are tagged independent sets, `A` has size `k`, `B` has size `k+1`, and `A⊂B`. A tagged `B` has at least `k` tag-preserving deletions: at most one deletion can remove its only tag. Thus the number of pairs is at least `k q_(k+1)`. For fixed tagged `A`, each addable vertex lies in `K=H-N_H[A]`. Every independent set of `K` extends `A`, so `alpha(K)<=h-k`. A two-coloring of the whole bipartite `K`, including isolates and all components, gives an independent color class of size at least `|V(K)|/2`. Consequently `|V(K)|<=2(h-k)`, bounding the number of additions. The independently recovered inequality is `k q_(k+1)<=2(h-k)q_k`, with no division by `q_k`. At `k=h`, the upper layer is zero; at `k>h`, both layers are zero by extension; `k=0` is never invoked. Empty `W` causes both tagged counts to vanish.

**Original-leaf transfer.** Fix an original leaf `v` with original unique support `s`. Set `H=T-{v,s}` and `W=N_T(s)\{v}`. As `v` is adjacent to `s` and no other vertex, `W` lies in `H` and `R=T-N_T[s]=H-W`. The independent `j`-sets of `R` are exactly independent `j`-sets of `H` avoiding `W`, hence `q_j=i_j(H)-i_j(R)`. Direct subtraction yields the exact summand `Delta_(p-1)(H)-Delta_(p-1)(R)=q_p-q_(p-1)`. Every independent set of `H` can be extended by `v`, giving `h=alpha(H)<=a-1`. The induced `H` is bipartite because it is an induced subgraph of a tree.

Now `a>=7`, `p=a-2`, and `k=p-1=a-3>=4`. If `k>h`, both `q_k` and `q_(k+1)` vanish. Otherwise the shadow inequality gives `k q_(k+1)<=2(h-k)q_k<=4q_k<=kq_k`, so `q_p-q_(p-1)<=0`. Thus **each** original leaf contributes a nonpositive integer, independent of its favorability. Filtering the original leaf set by the strict `Delta_p(T-v)<0` predicate cannot change that sign; summing over distinct leaf vertices preserves shared-support multiplicity and is nonpositive even for an empty selector.

## Independent Critic Pass

I checked possible failure points independently of the synthesis report. The three low-`a` exclusions respect strict first descent: flat coefficients cannot satisfy the selector or define an earlier `x`. The triple identity corrects edge-containing triples once for each adjacent edge pair; a triangle would add a three-edge correction, but the tree hypothesis excludes it. In the `n=8` cover case, an edge between the two cover vertices is counted twice by `deg(u)+deg(w)`, so the asserted lower bound `>=7` remains valid. The convex minimum nine does not assume the cover vertices are nonadjacent.

In the shadow count, removing the unique tagged vertex is the only destructive deletion, and each addable vertex is distinct, so the incidence orientations and factors are correct. The color-class argument remains valid for disconnected `H` and isolates. The candidate never divides by zero. At the primary rank, the required guard `k>=4` is a proved consequence, not an extra theorem premise. For original deletions, `R=H-W` uses the original closed neighborhood; replacing it by a neighborhood computed after deleting `v` or `s` would be a different claim. The pinned `r26-Main.lean` definitions at entries 3–6 and 8–14 use an original-leaf filter, original support, `{v,s}` and original closed-neighborhood deletion sets, strict favorability at `p`, integer differences, and a leaf-indexed aggregate. Its aggregate documentation calls it a historical top-rank residual aggregate, but the actual definition is generic in `p` and has no residual parameter or hypothesis. No top-rank selector-collapse or residual identity was used.

The natural-number declaration is equivalent on eligible inputs to the integer-rank claim: its premise implies `a>=4`, so `a-2` and then `p-1` are ordinary, unsaturated differences. The final declaration has no added `a>=7` hypothesis. The imported r25 source provides pair/triple counting context and a separately verified order-nine forest lemma; neither its verification report nor the r26 top-rank theorem is an award of this primary. I treated those as source context and derived every needed sign step above.

As corroboration only, I independently enumerated all labeled Prüfer trees of orders five through seven: none was eligible; the seven order-seven stars with `alpha=6` had minimum `Delta_2=5`. Among all 262,144 labeled order-eight Prüfer trees, the 6,784 admitting a vertex cover of size at most two had minimum `Delta_2=3`. I also checked all 512 bipartite graphs on fixed color classes of size three, all 64 tag sets, and every `1<=k<=alpha(H)`: 117,504 tagged-shadow instances satisfied the inequality. These bounded computations support the endpoint checks but are not used as a universal proof.

The phrase “edge cover” in the original audit was a terminology error: the complement of an independent set is a **vertex cover**, because every edge has an endpoint in that complement. The correction changes no inequality, proof step, or verdict. The finite corroboration reported above is reproducible with `REPLAY-BOUNDED-CHECKS.py`; its deterministic output is `REPLAY-BOUNDED-CHECKS.json`.

## Verdict

**Passed as an informal proof-integrity audit of the exact primary claim.** The reproduced arguments close the low-`alpha` threshold, tagged-shadow bound, original deletion identity, rank guards, strict selector, and complete leaf multiplicity without an added residual or `alpha>=7` premise. The claim ledger records ten verified inference groups and no open mathematical escalation. This verdict does not assert that the planned Lean declaration compiles, that its formal proof is kernel accepted, or that a future implementation passes formalization fidelity; those are separate governed gates. The v2 theorem contract's structural receipt and later formal artifacts must be evaluated on their own authority.
