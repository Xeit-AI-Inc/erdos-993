# C2-AU neutral adjudication — U-origin routes

**Authority:** proposed worker findings only. Cycle 2, adjudication, orientation N. This report covers every claim in C2-U1 through C2-U6 and reconciles their C2-CT-U1..U6 and C2-CF-U1..U6 critiques. The nine distinct source claim IDs are disposed below. All 49 case-listed and 27 common-listed files matched their packet SHA-256 hashes. The mathematical arguments below are self-contained for synthesis; citations to sealed sources identify provenance, not missing proof premises. No Lean build, formal award, exhaustive census, or public-literature theorem is claimed.

## Definitions and target boundary

For a finite simple graph G, let `i_j(G)` count independent j-sets, with zero extension outside `0<=j<=alpha(G)`, and let `Delta_j(G)=i_(j+1)(G)-i_j(G)`. For a finite ordinary tree T, `x(T)` is the first nonnegative j with `Delta_j(T)<0`, including the terminal difference `Delta_alpha(T)=-i_alpha(T)`. An original leaf v has original support `s_v`. Given `p` with `x(T)+2<=p` and **strict** `3p<2alpha(T)+1`, fix once and for all

`F(T,p)={v original leaf of T: Delta_p(T-v)<0}`.

For every original leaf put `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\{v}`, and `R_v=T-N_T[s_v]=H_v-W_v`, with all adjacencies and deletions from the original T. Set `q_v(j)=i_j(H_v)-i_j(R_v)`, the number of independent j-sets of H_v meeting W_v. Its summand is `q_v(p)-q_v(p-1)`. The target is the **complete** selected sum `S(T,p)=sum_(v in F)[q_v(p)-q_v(p-1)]<=0`, counting different leaf tags even if they share a support. The first-order shell adds `|T|=2p+2`. Since a nontrivial tree has `Delta_0(T)=|T|-1>0`, eligibility gives `p>=3` and `k=p-1>=2`. The one-vertex tree has no degree-one leaf and poses no selected term.

The results here prove the order band `|T|<=2p+1` pointwise and give reductions and an example beyond it. They do **not** prove or refute the eligible first shell or the unrestricted lower-region complete sum.

## 1. `E993-MARKED-ISOLATE-ORDER-BAND` — retained, proposed informal proof

**Exact statement.** For every finite simple graph G of order m, every vertex set W containing *every isolate* of G, and every natural `k>=2` with `m<=2k+1`, let `q_j` count independent j-sets meeting W. Then `q_(k+1)<=q_k`. This has no tree, bipartite, selector, first-descent, or alpha premise.

**Proof.** For each marked independent k-set A let `b(A)=|N_G(A)|`, the size of the union of its open neighborhoods. Independence gives `A∩N_G(A)=empty`, so the actual number of vertices addable to A is `e(A)=m-k-b(A)`. Put `B=sum_A b(A)`. Let C count each independent (k+1)-set with at least two marks once. Count `(A,y)` with y actually addable. An upper set with exactly one mark has **k** deletions preserving a mark, namely deletion of any of its k unmarked vertices; an upper set with at least two marks has `k+1`. Thus

`k*q_(k+1)+C=(m-k)*q_k-B`, or `k*(q_(k+1)-q_k)=(m-2k)*q_k-B-C`.

For `m<=2k`, the right side is nonpositive. At `m=2k+1`, split marked lower sets into good ones with `b(A)>=1` and bad ones with `b(A)=0`. The latter consist entirely of isolates, all in W. B pays at least one per good set. If G has a nonisolated vertex y, each bad A maps injectively to `A∪{y}`, an independent upper set with at least `k>=2` marks, counted by C; deleting fixed y recovers A. Hence `B+C>=q_k`. If G is edgeless, W is the full vertex set, and complementation on `2k+1` vertices bijects the k and k+1 layers. Empty marked families are covered. The exact `k>=2` and order guards are substantive; this argument claims nothing at `m=2k+2`.

**Dispute resolved.** The route and both critics support the equation. Some prose in C2-U2 and C2-CF-U2 reverses which single deletion preserves a mark: deleting the unique marked vertex *loses* the mark. The equation above uses the correct k deletions, so the theorem survives. Provenance: C2-U2, C2-CT-U2, C2-CF-U2 and the common `control/C2-ORDER-BAND-CANDIDATE.md`. This is an informal mathematical proof, with no kernel receipt.

## 2. `E993-ORDINARY-LEAF-ORDER-BAND` — retained, proposed informal proof

**Exact statement.** For every finite ordinary tree T, original degree-one leaf v with original support s, and natural `p>=3` with `|V(T)|<=2p+1`, using original neighborhoods and zero-extended counts,

`Delta_(p-1)(T-{v,s})-Delta_(p-1)(T-N_T[s])<=0`.

**Proof.** Let `H=T-{v,s}`, `W=N_T(s)\{v}`, `R=H-W`, and `k=p-1>=2`. Then the left side is `q_(k+1)-q_k` for independent sets of H meeting W, and `|H|=|T|-2<=2k+1`. Every component of H has exactly one root in W: deleting s separates its neighbor branches, the v-branch is the singleton v, and two neighbors of s in any other branch would form a cycle. Hence every isolate of H belongs to W. Applying section 1 to H proves the claim, including empty H. This implication does not change original supports or merge same-support leaves.

There is also a direct tree-specific proof supplied by C2-U1. Order W with a root w1 of a nontrivial H component first if H has an edge. Set `J_i=H-(N_H[w_i]∪{w_1,...,w_(i-1)})`. Partitioning a marked independent j-set by its first mark gives `q_j=sum_i i_(j-1)(J_i)` for `j>=1`; later marks remain available. Because w1 is nonisolated, `|J_1|<=|H|-2`; for `i>1`, w1 and wi are distinct deleted marks, so `|J_i|<=|H|-2<=2k-1`. For any graph J of order N, double counting deletion/extension incidences gives `k*i_k(J)<=(N-k+1)*i_(k-1)(J)` when `N>=k-1`; if `N<k-1`, both counts are zero. Thus `N<=2k-1` implies `i_k(J)<=i_(k-1)(J)`, term by term. If H has no edge, W=V(H) and `q_j=binom(|H|,j)`; adjacent binomial layers descend for `|H|<=2k+1`. Empty H gives zero. This independently establishes the registered p>=3 scope.

Summing the pointwise result over any fixed selected F proves `S<=0` when an eligible T additionally satisfies `|T|<=2p+1`. It gives no sign on `|T|=2p+2` or larger. Provenance: C2-U1, C2-CT-U1, C2-CF-U1, with the generic route C2-U2 as a separate proof. All reviews agree at the registered scope. The possible p=2 direct-argument extension is outside this adjudicated claim.

## 3. `C2-U3-ORDERED-SHELL-BOUND` — retained_narrowed

**Corrected exact statement.** Fix an original leaf v of an eligible ordinary shell tree `|T|=2p+2`, put `k=p-1`, `H=H_v`, `W=W_v`, and `R=R_v`. H has `2k+2` vertices and is not edgeless. Order its one-per-component marks with a nonisolated root w1 first, then any remaining marks. For `J_i=H-(N_H[w_i]∪{w_1,...,w_(i-1)})`,

`q_v(k+1)-q_v(k)=sum_i [i_k(J_i)-i_(k-1)(J_i)]`.

Every `i>=2` term is nonpositive. The only possible order-`2k` residual is `J_1` when `deg_H(w1)=1`; otherwise `|J_1|<=2k-1`. Define `L_root=i_(k-1)(J_1)` in that degree-one case and zero otherwise. Then

`sum_i [i_k(J_i)-i_(k-1)(J_i)]_+ <= L_root/k`.

The statement applies per original leaf tag (selected or not) and therefore preserves repeated supports when summed.

**Proof and correction.** Tree branch geometry gives exactly one mark per H component. The first-mark partition above is bijective. For any graph J of N vertices, `k*i_k(J)<=(N-k+1)*i_(k-1)(J)` in range, with both counts zero when `N<k-1`. Thus `i_k-i_(k-1)<=0` for `N<=2k-1`, while at `N=2k` its positive part is at most `i_(k-1)/k`. Since `|H|=2k+2`, w1's closed neighborhood removes at least two vertices, exactly two when its degree is one. For `i>=2`, if wi is nonisolated, its mark and a neighbor in its own component plus earlier w1 are three distinct removed vertices. If wi is isolated, `N_H[w1]` already removes w1 and a neighbor, and wi is a third. Thus every later J has at most `2k-1` vertices.

C2-U3 and C2-CF-U3 incorrectly list a second isolated mark as another possible `2k` boundary: their `J_2=H-{w1,w2}` omits the neighbor(s) deleted by `N_H[w1]`. C2-CT-U3 detected the error. The route's looser numerical allowance `L_root+L_iso` remains an upper bound because its extra term is nonnegative, but its claimed boundary classification is false and is not carried. The corrected first-root-only statement is stronger and correctly scoped.

If H were edgeless, T would be the star centered at s with polynomial `(1+z)^(2p+1)+z`; for `p>=3`, its first strict descent is `p+1` (the binomial differences have zero at p and first negative at p+1), contradicting `x+2<=p`. This justifies the nonisolated first root for an eligible shell. Provenance: C2-U3 and the two U3 critics, with the CT correction preferred by the set-deletion calculation.

## 4. `E993-LOWER-REGION-FIRST-ORDER-SHELL` — retained as open

**Exact registered assertion.** For every ordinary T with `|T|=2p+2`, `x(T)+2<=p` and `3p<2alpha(T)+1`, the complete sum over the one original strict favorable set F(T,p) is nonpositive. Both routes `C2-U3` and `C2-U6` report this assertion unresolved; neither supplies a positive full-sum witness.

The corrected section 3 decomposition gives a precise **sufficient but unproved** global premise. For each selected v, choose its first root and let `d_(v,i)=i_(k-1)(J_(v,i))-i_k(J_(v,i))>=0` for `i>=2`. If

`k * sum_(v in F) sum_(i>=2) d_(v,i) >= sum_(v in F) L_root(v)`,  (Comp-root)

then the first-root excess is at most `L_root(v)/k`, all later terms contribute `-d_(v,i)`, and summation gives `S(T,p)<=0`. The premise keeps the fixed F and distinct original tags. Neither eligibility nor `Delta_p(T-v)<0` has been shown to imply Comp-root. The route's original Comp with `L_iso` is also sufficient, but unnecessarily stronger and based on a false possible-boundary description. This conditional reduction is all that is carried; it is not a proof of the shell assertion. C2-CF-U3 correctly identified the missing global bridge but missed the boundary error; C2-CT-U3 identified both. No finite example in the common handoff resolves the universal shell.

## 5. `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — retained_narrowed as instancewise identity and conditional certificate; universal target open

**Exact retained content.** For every eligible `(T,p)` with its *one fixed* F(T,p), define on each independent set B of T

`w_F(B)=#{v∈F∩B : (B\{v})∩W_v != empty}`.

Then

`S(T,p)=sum_(B∈I_(p+1)(T)) w_F(B)-sum_(A∈I_p(T)) w_F(A)`.

For this same finite instance, form the one-vertex-deletion bipartite graph from upper `I_(p+1)(T)` to lower `I_p(T)`. Give upper B supply `w_F(B)` and lower A capacity `w_F(A)`. An integral flow saturating all upper supplies exists **if and only if** for every `X⊆I_(p+1)(T)`,

`sum_(B∈X) w_F(B) <= sum_(A∈N_-(X)) w_F(A)`, where `N_-(X)={A∈I_p(T): A⊂B for some B∈X}`.

Such a flow certifies `S<=0` for this instance. No universal validity of the cuts or scalar sign has been proved.

**Proof.** The identity `R_v=H_v-W_v` makes `q_v(j)` count independent j-sets of H_v meeting W_v. Adjoining the original leaf v gives a bijection, separately for each tag, to independent (j+1)-sets B counted by v in `w_F(B)`; deleting v is the inverse because v's only neighbor s_v is absent. Thus `sum_F q_v(j)=sum_(B∈I_(j+1)(T))w_F(B)`. Use j=p and p-1, with F unchanged, and subtract. For the flow, take source-to-upper capacities w, lower-to-sink capacities w, and deletion arcs with capacity greater than total supply plus total lower capacity. A cut with upper source-side X must include all lower deletion neighbors; its least capacity is `sum_(B∉X)w_F(B)+sum_(A∈N_-(X))w_F(A)`. Max-flow/min-cut yields the displayed equivalence and integral capacities yield an integral flow. Zero supply gives the zero flow. Saturation implies total upper weight at most total lower weight, hence S<=0.

**Dispute resolved.** C2-U4 and C2-CT-U4 call the cut with X equal to the entire upper layer “precisely” the scalar S inequality. Its right side is actually the weight only on `N_-(I_(p+1))`; a rank-p independent set might have no rank-(p+1) extension. Without a proof that all omitted lower sets have zero weight, that cut is potentially stronger than `S<=0`. C2-CF-U4 correctly distinguishes them. A failed proper cut would obstruct this flow certificate only; it would not refute the scalar claim. This reduction permits transfers across leaf tags/supports and invokes no within-tag Hall premise. Provenance: C2-U4 and its two critics, plus the common global-weight coordinates. The original universal aggregate remains open on this case.

## 6. `U5-pendant-extension-tagged-sum-change` — retained_narrowed; exact bounded example

**Exact finite statement.** Let T have vertices `0,...,17`, center-path edges `(0,1),(1,2),(2,3),(3,4),(4,5)`, and pendant edges `(i,6+2i),(i,7+2i)` for `i=0,...,5`. Let `T+` add vertex 18 and edge `(10,18)`, extending the original leaf `u=10`. At `p=8`, both trees have `alpha=12`, terminal-checked `x=6`, and satisfy `x+2<=p` (`8<=8`) and strict `3p<2alpha+1` (`24<25`). Their fixed-rank favorable leaf-tag families and complete sums differ: `S(T,8)=-4256`, `S(T+,8)=-6267`. Both sums are negative; this is an extension-instability example, not a primary counterexample or a census.

**Exact arithmetic and replay.** The base independent-set polynomial coefficient vector from rank 0 through 12 is `[1,18,136,574,1519,2672,3216,2672,1519,574,136,18,1]`; its differences through the terminal rank are `[17,118,438,945,1153,544,-544,-1153,-945,-438,-118,-17,-1]`. Base leaves in order `6,...,17` have strict `Delta_8(T-v)` values `[-452,-452,-430,-430,-434,-434,-434,-434,-430,-430,-452,-452]`, so all are selected. Their original-support summands in the same order are `[-323,-323,-375,-375,-366,-366,-366,-366,-375,-375,-323,-323]`, summing to `-4256`. Supports are `0,0,1,1,2,2,3,3,4,4,5,5`.

The extended coefficient vector is `[1,19,153,694,1986,3795,4981,4531,2834,1186,314,47,3]`; terminal-checked differences are `[18,134,541,1292,1809,1186,-450,-1697,-1648,-872,-267,-44,-3]`. Current leaves in order `6,7,8,9,11,12,13,14,15,16,17,18` have strict selector differences `[-844,-844,-798,-798,-838,-805,-805,-805,-805,-842,-842,-945]`; all qualify. Their supports are `0,0,1,1,2,3,3,4,4,5,5,10`, and summands are `[-494,-494,-616,-616,-473,-600,-600,-590,-590,-501,-501,-192]`, summing to `-6267`. Old tag 10 ceases to be a leaf; new tag 18 is favorable. The new tag's support is 10. The center-path recipe is a tree, and adding a leaf preserves connected acyclicity. These exact values were independently recomputed in this adjudication with the packet-listed `inputs/ordinary_tree_checked.py`, using forest independence polynomials and original-graph deletions for every leaf; the route and both critics also supply consistent exact replays.

**Correct pendant recurrences.** For any graph G containing u, adding new leaf w at u gives `I(G+;z)=I(G;z)+zI(G-u;z)` and `alpha(G+)=max(alpha(G),1+alpha(G-u))`. A surviving old leaf v (`v!=u`) has selector polynomial `I(T-v)+zI(T-{v,u})`; the new leaf w is selected exactly when `Delta_p(T)<0`. For a surviving old v with original support s, let H and R be its old deletion graphs. In its new H deletion, if u remains, use `I(H)+zI(H-u)`; if u is deleted, w remains isolated, giving `(1+z)I(H)`. In its new R deletion: if `u∈R`, use `I(R)+zI(R-u)`; if `u∈N_T(s)\{s}` is deleted while w survives, use `(1+z)I(R)`; if `u=s`, w is also in the enlarged closed neighborhood and the polynomial stays `I(R)`. For new leaf w, its H and R graphs are `T-u` and `T-N_T[u]`. Recompute x to the terminal rank, every strict selector, and the full sum after extension; none is invariant by assumption. C2-U5's phrase “u survives outside R” is internally inconsistent; C2-CF-U5 supplies the corrected deleted-u/isolate case. C2-CT-U5 retained the example. The finite example and corrected cases are retained; no class-wide sign theorem follows.

## 7. `C2-U6.shell-state-framework` — retained, exact fixed-rank evaluation

**Exact statement and proof.** For a *fixed* p and a shell tree `|T|=2p+2`, the complete data consisting of `I_T(z)`, for every original leaf tag v the original support `s_v` and polynomials `P_v=I(T-v)`, `H_v=I(T-{v,s_v})`, `R_v=I(T-N_T[s_v])`, and a leaf-indexed list, suffice to evaluate `alpha(T)`, terminal-checked `x(T)`, every selector bit `1[Delta_p(T-v)<0]`, and the complete S. A rooted branch Q with child branches Qi has include/exclude messages `B_Q=z∏A_Qi`, `A_Q=∏(A_Qi+B_Qi)`, where A excludes the root and B includes it. Deleted induced forests factor over components; these recurrences compute their exact polynomials. The degree of `I_T` is alpha, its coefficient at alpha+1 is zero, and scanning all `Delta_j` through alpha gives x. Each P_v gives its strict selector value, each H_v/R_v pair gives its summand, and the list keeps equal-support leaves distinct. At fixed p, n is fixed and these integer data range over a finite set. This is an evaluation state only: it gives no compression uniform in p, generator, completed census, or sign theorem. All three source seats C2-U6, C2-CT-U6, C2-CF-U6 agree at this scope.

## 8. `C2-U6.shell-vertex-cover-bound` — retained, elementary necessary bound

**Exact statement and proof.** On a shell tree with `|T|=2p+2` and strict `3p<2alpha(T)+1`, write `a=alpha(T)` and `tau(T)=|T|-a`, the minimum vertex-cover number. Since p,a are integers, the strict guard is equivalent to `3p<=2a`, so `a>=ceil(3p/2)=floor((3p+1)/2)`. Hence `tau<=2p+2-ceil(3p/2)=floor(p/2)+2`, for both parities of p. The first-descent and selector guards are not used. This necessary bound grows with p; it proves no shell feasibility, bounded-order reduction, or aggregate sign. C2-U6 and both critics agree.

## 9. `C2-U6.primary-shell-open` — retained as route limitation

This claim states that C2-U6's exact state and vertex-cover inequality leave the registered first-order shell sum unresolved. Its precise mathematical scope is the same shell assertion in section 4, with terminal-checked x, fixed strict original selector, original supports/neighborhoods, and complete repeated tags. It is a report of what that route establishes, not a proof of the universal assertion or an authoritative OPEN award. Neither state sufficiency nor the necessary vertex-cover bound controls the selected sum. C2-U6 and both critics agree. The U3 conditional reduction does not close the same gap.

## Carry for neutral synthesis

The two order-band claims have independent, complete informal proofs at their exact scopes. Their selected-sum corollary covers eligible trees with `|T|<=2p+1`. At the next shell, the first-mark decomposition has only one possible positive boundary residual per leaf, and the explicit fixed-selector Comp-root budget remains unproved. The weighted global-layer identity and exact finite-instance flow/cut equivalence are valid, but neither universal cut inequalities nor the scalar rank comparison follows. The finite pendant pair proves tag/sum non-invariance under extension while retaining negative full sums. The fixed-p state and vertex-cover bound are exact but do not make a uniform kernel or sign proof. Consequently both the first-order shell and the unrestricted lower-region complete aggregate are unresolved by these six routes; no realizable eligible tree with positive full S was supplied.

**Limitations and dependencies.** All universal proofs here are informal counting arguments; no Lean or formal award is claimed. The U5 arithmetic is a single exactly encoded pair, replayed using the packet-listed checked evaluator; it is not an exhaustive generation result. The flow criterion relies on finite max-flow/min-cut, whose cut derivation is included above. No imported literature result, older worker output beyond the allowed common handoff, or unlisted source is a premise. The case-listed C2-U1..U6 reports/returns/evidence and their exact C2-CT/CF critics supply provenance; the report above carries the actual statements and arguments so synthesis need not reopen them.
