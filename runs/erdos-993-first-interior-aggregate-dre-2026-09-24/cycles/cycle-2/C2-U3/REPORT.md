# C2-U3 independent proof and scope audit

**Proposed worker-only finding.** I find a complete elementary informal proof candidate for the primary first-interior ordinary-tree aggregate at exactly its frozen scope. Eligibility forces alpha(T) >= 7, and a bipartite tagged-set count then makes every original-leaf summand nonpositive. The argument retains every original leaf tag, assumes no residuality, uses integer ranks and zero extension, and needs no Hall relation. This is not a registry award or governed/formal verification. All three auxiliary keys and the primary remain OPEN until adjudication and their required gates. No Lean build was run.

## Definitions and proof

Let T be a finite connected acyclic simple graph, a=alpha(T), with integer p=a-2 and first strict negative index x as in the semantic contract. Eligibility x+2<=p gives x+4<=a. In particular a>=4 and p>=2.

First eligibility forces a>=7, without importing the proposed r27 order-bound bridge. Write n=|V(T)|. A tree with a>=4 has n>=a+1 and is nontrivial. Its first two differences satisfy

- Delta_0(T)=n-1>0;
- Delta_1(T)=binom(n-1,2)-n, because i_2=binom(n,2)-(n-1).

Suppose a<=6. Since x+4<=a, only a=4,5,6 are possible. If a=4, x=0, contradicting Delta_0>0. If a=5, x<=1 and n>=6; then Delta_0>0 and Delta_1>=binom(5,2)-6=4>0, so neither possible index is a strict descent.

For a=6, x<=2 and n>=7. An exact tree triple count gives

i_3(T)=binom(n,3)-(n-1)(n-2)+sum_u binom(deg(u),2),

and hence

Delta_2(T)=(n-1)(n-2)(n-9)/6+sum_u binom(deg(u),2).

The triple formula follows by inclusion-exclusion over edge events in 3-vertex sets: two distinct edges jointly occur only when they share a vertex, and three tree edges cannot lie on three vertices. The displayed expression is an exact integer identity, equivalently its six-times form. For n>=9 its terms are nonnegative. For n=7, the complement of a maximum independent 6-set is a one-vertex cover of all six edges, so T=K_{1,6} and Delta_2=-10+binom(6,2)=5. For n=8, the complement of a maximum independent 6-set is a two-vertex cover {u,w}, so deg(u)+deg(w)>=7. For nonnegative integer degrees with this sum, binom(deg(u),2)+binom(deg(w),2)>=9 (the minimum at total 7 is split 3+4). Thus Delta_2>=-7+9=2. In every case Delta_0, Delta_1, Delta_2 are nonnegative, contradicting a strict descent at x<=2. This proves a>=7 using only the ordinary-tree definitions.

Now fix any original leaf tag v with support s, and put H=T-{v,s}, W=N_T(s)\{v} as a subset of V(H), and R=T-N_T[s]. Then R=H-W. For each integer j, let q_j count independent j-sets of H meeting W, with zero extension. Thus q_j=i_j(H)-i_j(R), and the summand is

g_v=Delta_(p-1)(H)-Delta_(p-1)(R)=q_p-q_(p-1).

Also alpha(H)<=a-1, because every independent set in H extends by the deleted leaf v to an independent set of T.

For completeness, the needed tagged-set double count is this. If k>=1 and k<=alpha(H), count pairs (A,B) with A subset B, both independent in H and meeting W, and |A|=k, |B|=k+1. For a fixed A, an extension vertex must lie in K=H-N_H[A]. The graph K is bipartite. Its two color classes are independent, so |V(K)|<=2alpha(K); also alpha(K)<=alpha(H)-k, since an independent set of K can be united with A. Thus A has at most 2(alpha(H)-k) extensions. Conversely, each B has at least k deletions that continue to meet W: only its sole W-vertex can be a failing deletion, and only when B meets W in exactly one vertex. Therefore

k*q_(k+1) <= 2(alpha(H)-k)*q_k.

Take k=a-3=p-1, so k>=4. If k>alpha(H), both q_k and q_(k+1) are zero. Otherwise the count applies and 2(alpha(H)-k)<=2(a-1-k)=4<=k. Hence q_p<=q_(p-1) and g_v<=0. This holds for every original leaf, without checking the favorable selector and without residuality. The favorable set is a subset of those leaves, so summing its nonpositive terms, retaining repeated leaves at a shared support, gives the required complete S(T,p)<=0; the empty sum is zero.

The same count supplies the proposed high-tail implication for p>=2: with k=p-1, 3p>=2a+1 is exactly 3k>=2(a-1), which implies k>=2(alpha(H)-k). The proposed broader pointwise statement's p=1 endpoint is separate because the count assumes k>=1: its guard forces a=1 (a degree-one vertex gives a>=1), alpha(H)<=0 makes H empty, and both q_0 (the empty set does not meet W) and q_1 are zero. For p>alpha(G), zero-extended ranks also give a zero summand. The primary interior slice uses neither endpoint: eligibility gives a>=7, p=a-2>=5, and k=a-3>=4. At a=7 the high-tail rank guard is equality, 3p=15=2a+1, and the double-count factor is exactly 4=k.

## Scope fences and tempting extensions

- The high-tail claim is rank-restricted. The standing order-91 and order-243 rows have positive marked ordinary terms at (alpha,p)=(68,34) and (182,90): respectively 212336130412243110 and 2935177632783649903488454322226807645411570590073000. In both cases 3p<2alpha+1 (102<137 and 270<365), so they do not falsify the high-tail claim. Their complete sums at those off-target ranks are -498754180547001418536 and -1058142362147652597702654588268394677176033202323316960380; at the primary alpha-minus-two ranks 66 and 180 the pinned Cycle 1 synthesis gives complete sums -147807 and -2947590. A positive local term at an off-target rank is not a positive complete-sum counterexample.
- The primary proper-subclaim E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE is itself OPEN at all eligible ranks. Refuted literal-Hall rows associated with r23, including the order-91 actual-tree fixed-Gamma relation, refute those Hall mechanisms, not this coefficient inequality; this proof does not assert or require Hall. The governed E993-BETA-TARGET refutation is pointwise on the governed RTree model, and E993-BETA-AGG-SUPPORT is its governed per-support aggregate; neither transports to the ordinary deletion model here. Support fibres and the complete global aggregate are distinct objects.
- Verified E993-R26-TOP-RANK-RESIDUAL-SIGN concerns rank alpha-1 and trees where every original leaf is in every maximum independent set. Neither its rank nor its residual hypothesis applies here.
- The alpha>=7 lemma is needed for this high-tail route. The pinned boundary note describes alpha-6/p-4 local positive terms outside eligibility; this warns against extending the pointwise conclusion to every p=alpha-2 tree. It is not a primary counterexample because eligibility fails and the complete sum is a separate condition.
- No claim about all ranks, a forest primary aggregate, governed-RTree transport, TREE, FOREST, TRANSFER, or Erdős #993 follows. The proof needs bipartiteness for the |V(K)|<=2alpha(K) step and the ordinary leaf deletion binding; it establishes no corresponding theorem in an arbitrary non-bipartite model.

## Fresh larger exact check

I built the T_m family directly at m=300 (order 1203, beyond the standing order-243 examples) and evaluated the complete target with exact integer polynomials. The script constructs the graph explicitly and checks every formula polynomial against a generic induced-forest independent-set DP for the whole graph, marked/star H and R, and the two leaf-deleted selector graphs. It reports alpha=902, p=900, first strict descent x=434, Delta_898=-27397539525, all 901 original leaf tags favorable, marked selector -1799, star selector -901, marked term -403650, each of 900 star-leaf terms -405447, and complete sum -365305950. Reproduce from the run root with:

    python3 scratchpad/C2-U3/fresh_large_target.py > scratchpad/C2-U3/fresh_large_target.json

This single exact family instance is corroboration, not a universal proof. Its graph construction and result are preserved in fresh_large_target.py and fresh_large_target.json.

## Provenance and limitations

I used the assigned packet/common-neutral packet, worker protocol, both contracts, and only relevant packet-authorized pinned material: the Cycle 1 synthesis, C2 scope/capsule notes and identity data, the small-case addendum, tagged-count and boundary proposals, and standing controls used to scope inherited examples. I did not read current sibling/critic scratch or returns, run a Lean build, or edit remote/master files. No background job was started. The only writes are this worker's report, return, and exact-check script/data under scratchpad/C2-U3.

The remaining limitation is process-level: this is an independent search-seat informal proof candidate. It has not passed governed Lean fidelity/kernel review or adjudication, so this report changes no OPEN registry status.
