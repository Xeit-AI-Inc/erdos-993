# C3 synthesis: complete candidate proofs

These are checked and adopted informal proofs from the admitted public adjudications. No vote, unseen dependency, external theorem, finite search, forest unimodality, or formal status is a proof premise. The exact public source spans are identified in CANDIDATE-PROOF-LINEAGE.json. The proof text is included here in full so the candidate package is self-contained. The three candidates are actual graph statements, not arithmetic substitutes. Source subsection labels I.*, III.* and 5.* are retained for exact correspondence. In the adopted P3 text, section2 refers to the definitions and graph-count foundations reproduced in P0 and at the start of P3; references to5.1/5.3/5.4 refer to the corresponding reproduced P3 subsections. The common-connector construction is reproduced in P2. These labels do not require an external proof file.

## P0. Basic definitions and conventions

A finite ordinary simple graph is a finite vertex set V with a symmetric irreflexive adjacency relation. A tree is a connected acyclic nonempty such graph; a forest is acyclic, with empty and disconnected graphs allowed. A path, clique, edge K2 and isolate K1 have their usual explicit adjacency: successive vertices, every distinct pair, one pair, and no pair respectively. A disjoint union has no edges between distinct components. For X subset V, G-X is the induced graph on V\X. N_G(v) is the set of neighbors, N_G[v]=N_G(v) union {v}, and N_G(S) is the union of neighbors of members of S. All neighborhoods carry their actual graph subscript. A matching is a set of pairwise vertex-disjoint edges, and a vertex cover meets every edge; maximum and minimum cardinalities exist by finiteness. Empty sums/products are 0/1. Tail onset tau(G) is the least natural q for which every integer k>=q has Delta_k(G)<=0; finite support proves existence and no equality tau=x is assumed. A supported coefficient is a positive coefficient; the polynomial degree is its largest supported index.

Binomial C(n,k), for natural n and integer k, counts k-subsets when 0<=k<=n and is 0 otherwise. Every shifted coefficient uses integer zero extension. Polynomial differences mean coefficient differences, including for sums of graph polynomials. Fractions below are real/rational equalities with explicitly positive denominators, not truncated natural division.

## Definitions and exact G1 model

A finite ordinary simple graph has independent sets consisting of actual vertex subsets containing no edge. Let i_k(X) count independent k-subsets, i_0(X)=1 even for the empty graph, and i_k=0 for all negative integers and all k above the independence number alpha(X). Put I(X;z)=sum i_k z^k and Delta_k=i_(k+1)-i_k for every integer k. In particular Delta_-1=1 and Delta_j=0 for j<=-2. A maximum independent set supplies positive coefficients at all natural ranks 0..alpha, and Delta_alpha=-i_alpha<0. Thus x(X)=min{k>=0:Delta_k<0} exists. It is the first STRICT descent; a plateau is not a descent and x is not a chosen global maximizer. Recovery at r means x(X)<r and Delta_r(X)>0.

In the ordinary G1 model, T is a finite tree, v a leaf, s its unique neighbor with degree two, and g the other neighbor of s. Let A=T-N_T[v], H=A-g, and U=T-(N_T[v] union N_T[g]); both neighborhoods are evaluated in the ORIGINAL T. Let p=x(T)+1 and r=p-2. Full guards are Gamma=Delta_p(A)+Delta_(p-1)(H)<0, 2p-3<|U|, and x(U)<p-2. Strict crossing forces p>=3 and r>=1, so integer and natural subtraction agree. Width becomes |U|>2r+1, hence |U|>=2r+2. The target is Delta_r(U)<=0. No representation, deletion, neighborhood, independent-set, or first-descent transport to RTree is supplied by an ordinary graph theorem.

## P1. Third-wide forest theorem and ordinary G1 slice

Exact candidate: for every finite ordinary forest F and natural r>=1, |V(F)|=2r+4 and x(F)<r imply Delta_r(F)<=0. Consequently, for every finite ordinary tree T, leaf v, its unique neighbor s of degree two and other neighbor g, with A=T-N_T[v], H=A-g, U=T-(N_T[v] union N_T[g]), p=x(T)+1, Gamma=Delta_p(A)+Delta_(p-1)(H)<0, 2p-3<|U|, x(U)<p-2, and |U|=2p, one has Delta_(p-2)(U)<=0. Every count is an actual independent-set cardinality of that same U. This is an ordinary graph theorem, with no RTree transport.

### I.1 Actual vertex-cover partition and binomial bounds

Let C be any designated vertex cover of a finite simple graph F and B=V(F) minus C. B is independent. For each independent S subset C, independent sets whose intersection with C is exactly S are uniquely S union J with J any subset of B minus N_F(S). Write m_S=|B|-|N_F(S) intersect B|. This proves

I(F;z)=sum_(S independent subset C) z^|S|(1+z)^m_S,
Delta_k(F)=sum_S D_(k-|S|)(m_S),
D_j(m)=C(m,j+1)-C(m,j).

Here C(m,t)=0 unless 0<=t<=m. The bijection and subtraction hold at every integer rank. In particular D_-1(m)=1 and D_j(m)=0 at j<=-2. Full neighborhood unions, overlap, and the independence of S are retained.

For every natural j,m, D_j(m)>=-Cat_j, where Cat_j=C(2j,j)/(j+1)>0. At j=0, D_0(m)=m-1>=-1. For j>=1, m<j gives zero and m>=2j+1 gives a nonnegative difference by C(m,j+1)/C(m,j)=(m-j)/(j+1). In the remaining range put m=j+t, 0<=t<=j. Then

-D_j(j+t)=C(j+t,j)(j+1-t)/(j+1)=h_t>0.

For 0<=t<j, clearing the positive denominator in h_(t+1)>=h_t reduces to

(j+t+1)(j-t)-(t+1)(j+1-t)=(j-t-1)(j+1)>=0.

Therefore h_t<=h_j=Cat_j, with equality also at t=j-1. The j=0 case was handled separately, so no nonexistent negative position is used.

Pascal's identity also gives D_k(m+1)-D_k(m)=D_(k-1)(m)>0 for m>=2k+2, including k=0 by D_-1=1. Direct factorial cancellation gives D_k(2k+2)=Cat_(k+1).

For k>=4,

Cat_(k+1)-4Cat_(k-1)-6Cat_(k-2)-4Cat_(k-3)-Cat_(k-4)>0.                 (C)

To prove this for all k, set j=k-4>=0, divide by Cat_j>0 and multiply by P(j)=(j+2)(j+3)(j+4)(j+5)(j+6)>0. From Cat_(t+1)/Cat_t=(4t+2)/(t+2), the resulting polynomial is exactly

product_(a=0..4)(4j+4a+2)
-4(4j+2)(4j+6)(4j+10)(j+5)(j+6)
-6(4j+2)(4j+6)(j+4)(j+5)(j+6)
-4(4j+2)(j+3)(j+4)(j+5)(j+6)-P(j)
=3600+20748j+36556j^2+24797j^3+6884j^4+655j^5.

Every coefficient is positive. This is an identity derived from recurrence products, not interpolation of finite checks.

### I.2 Cover at most four: complete small-rank proof

Suppose F is a forest of order 2r+4, r>=1, with a vertex cover of size at most four. Enlarge to a four-vertex cover C, possible because |F|>=6; then |B|=2r. There are at most C(4,t) independent cover subsets of size t. Each potentially negative term is bounded below by a nonpositive Catalan floor, so replacing actual subset counts by these upper bounds is legitimate. Terms with |S|=k+1 equal +1, and larger terms vanish, so dropping them does not worsen the lower bound.

For r>=5 the partition gives

Delta_0=2r+3>0,
Delta_1>=D_1(2r)-4>=D_1(10)-4=31,
Delta_2>=D_2(2r)-4Cat_1-6Cat_0>=75-10=65,
Delta_3>=D_3(2r)-4Cat_2-6Cat_1-4Cat_0>=90-18=72.

For 4<=k<r, 2r>=2k+2; the empty-cover term is at least Cat_(k+1), and all other floors give precisely the positive expression (C). Thus every pre-r difference is strictly positive in this range.

Small r are as follows. Every nonempty forest on n vertices has e<=n-1: remove a leaf from a nontrivial component, or an isolate, and induct; a longest-path endpoint supplies the required leaf. A forest is triangle-free.

* r=1,n=6: only Delta_0=5 is required.
* r=2,n=8: Delta_0=7 and Delta_1=C(8,2)-e-8>=13.
* r=3,n=10: Delta_0=9 and Delta_1>=26. Inclusion-exclusion on triples in a triangle-free graph gives i_3=C(n,3)-(n-2)e+W with W=sum_v C(deg(v),2): each edge forbids n-2 triples, each incident edge pair supplies one correction, and there is no triangle term. Since C(d,2)>=d-1 even at d=0, W>=2e-n. Thus Delta_2=75-7e+W>=65-5e>=20.
* r=4,n=12: Delta_0=11; partition bounds give Delta_1>=D_1(8)-4=16 and Delta_2>=D_2(8)-10=18. There are at most eleven C-to-B edges, so one of the four cover vertices has at most two B-neighbors. Its singleton contribution to Delta_3 has m>=6 and D_2(m)>=D_2(6)=5. The other three singleton terms are >=-Cat_2=-2, the at most six pair terms >=-Cat_1=-1, and the at most four triple terms >=-Cat_0=-1. An independent quadruple contributes +1 and can be omitted. Therefore Delta_3>=D_3(8)+5-6-6-4=14+5-16=3>0.

All natural k<r have been covered, so x(F)>=r. Forest sparsity is essential in these small-rank arguments; this is not an all-graph low-cover theorem.

### I.3 Normalized clique comparison, with complete graph/count proof

Let H be a spanning union of nonempty cliques of sizes w_1,...,w_d, with E(H) subset E(G) on the SAME finite vertex set. Its independence polynomial q=product(1+w_i z) counts actual H-independent sets, with q_k>0 exactly for 0<=k<=d. We prove for 0<=k<d

q_k i_(k+1)(G)<=q_(k+1)i_k(G).                                (N)

First product coefficients are log-concave and positive on their interval support. Starting from [1], multiply an LC interval-supported sequence a by 1+wz. For b_k=a_k+w a_(k-1), expansion gives

b_k^2-b_(k-1)b_(k+1)
=(a_k^2-a_(k-1)a_(k+1))
+w(a_k a_(k-1)-a_(k-2)a_(k+1))
+w^2(a_(k-1)^2-a_(k-2)a_k)>=0.

The outer margins are LC. If a_(k-2)a_(k+1)>0, all intervening terms are positive and LC ratios a_j/a_(j-1) are nonincreasing, giving the mixed term nonnegative; if that product is zero the conclusion is immediate. Thus this induction proves LC for q, without asserting LC of I(G).

A rank-k subset J of block indices is given probability product_(i in J)w_i/q_k. We construct nested couplings at adjacent ranks by induction on d. For the first d-1 weights let a denote the product coefficients. At rank k the probability of choosing the last block is theta_k=w_d a_(k-1)/(a_k+w_d a_(k-1)), with theta_0=0 and theta_d=1. For 0<=k<d, positive denominators and LC give theta_(k+1)>=theta_k; the cross-multiplied numerator difference is w_d(a_k^2-a_(k-1)a_(k+1)).

Couple the last-coordinate indicators at ranks k,k+1 using masses 1-theta_(k+1) for (0,0), theta_(k+1)-theta_k for (0,1), and theta_k for (1,1). All masses are nonnegative and sum to one. In (0,0) use the inductive nested coupling of remaining ranks k,k+1; in (1,1) use remaining ranks k-1,k; in (0,1) use the same remaining rank-k set. Each conditional remaining-rank law is exactly the appropriate weighted subset law, so each mixture has the correct marginal. At k=0 the impossible negative-rank branch has mass zero; at k=d-1 the impossible remaining rank-d branch has mass zero. The d=1 case is the deterministic empty-to-singleton coupling. Thus the induction closes all support endpoints.

Choose a uniform vertex from each selected block, sharing that vertex in common blocks. The nested vertex sets have uniform H-independent-set marginals: product(w_i)/q_k times product(1/w_i)=1/q_k. Since every G-independent set is H-independent and its subsets remain G-independent, the probability that the larger set is G-independent is at most the probability for the smaller one. This is i_(k+1)(G)/q_(k+1)<=i_k(G)/q_k, equivalent to (N). No division by a graph coefficient is used, so zero i_k causes no exception. This proves the inherited exact normalized comparison locally at informal grade; it is not raw Delta monotonicity under edge addition.

### I.4 Exact five-edge formula and forest matching/cover split

If F on 2r+4 vertices contains five disjoint edges, these actual edges plus every other vertex as a singleton give H=5K2 disjoint (2r-6)K1, with r>=3. Put s=r-3>=0. Then I(H)=(1+2z)^5(1+z)^(2s). By collecting coefficients and binomial symmetry, with R_j=C(2s,s+j)/C(2s,s),

Delta_r(H)/C(2s,s)=R_4+9R_3-2R_2-8R_1.

For s>=1 extract R_1=s/(s+1). After clearing (s+2)(s+3)(s+4)>0, the numerator is

(s-1)(s-2)(s-3)+9(s-1)(s-2)(s+4)
-2(s-1)(s+3)(s+4)-8(s+2)(s+3)(s+4)
=-3(27s^2+99s+34).

For small positive s, each shifted binomial beyond support has a zero in the corresponding falling product; no unsupported signed factorial is used. At s=0 all R_j,j>=1 vanish separately. Therefore for all s>=0,

Delta_r(H)=-3 C(2s,s)s(27s^2+99s+34)/((s+1)(s+2)(s+3)(s+4))<=0,

with equality exactly r=3. At s=0,1,2,3 its values are 0,-8,-34,-123. There are d=5+(2r-6)=2r-1 blocks, so 0<=r<d and q_r>0. Using (N), q_(r+1)<=q_r and i_r(F)>=0,

q_r i_(r+1)(F)<=q_(r+1)i_r(F)<=q_r i_r(F).

Dividing only by positive q_r gives Delta_r(F)<=0.

Matching number equals minimum cover size for forests by elementary induction. Isolates contribute zero to both. In a nontrivial component choose a leaf l with neighbor u. A maximum matching can contain lu: if u is matched elsewhere replace that edge; if u is unmatched and lu absent, l is also unmatched and adding lu contradicts maximal size. Hence nu(F)=1+nu(F-{l,u}). A minimum cover can contain u and omit l: if u absent, l must be included, and replacing l by u preserves coverage; if both present, l is redundant. Conversely u together with a cover of F-{l,u} covers F. Hence its minimum cover size obeys the same recurrence. Induction proves equality without an external theorem dependency.

If nu(F)<=4, I.2 contradicts x(F)<r. Otherwise choose five matching edges and apply the preceding comparison. This proves the exact third-wide crossing theorem.

Finally U in a full ordinary G1 tuple is an induced subgraph of an actual tree, hence a forest. Strict crossing gives r=p-2>=1, and |U|=2p becomes |U|=2r+4. The theorem yields Delta_(p-2)(U)<=0. Original neighborhoods, p=x(T)+1, Gamma and width remain full-tuple hypotheses even where not needed by the residual theorem. This closes the actual ordinary G1 graph/count bridge.

Proof-endpoint clarification: the falling-product identity R_t=product_(h=0..t-1)(s-h)/product_(h=1..t)(s+h), t=1..4, holds also for 0<=s<t because a numerator factor is exactly zero. Hence the five-edge numerator identity can be multiplied out at s=0 directly, with no division by R_1. The graph-count comparison uses only positive comparator coefficients. The matching-cover proof replaces only leaf l by u, never every neighbor of u.

## P2. Explicit root-uniform eventual padding obstruction

Exact candidate: for every nonempty finite ordinary forest F, every natural r>=1, every choice R of exactly one vertex in each component, and every natural h, construct T_(h,R) by joining a new b to the chosen roots, appending the new path b-g-s-v, and adding h new leaves at g. Put c=Delta_r(F)+Delta_(r-1)(F), M0=max(0,-c), and h0=2r+3+(r+1)M0. For every h>=h0, Delta_(r+1)(T_(h,R))>0, uniformly in R, and thus x(T_(h,R)) is not r+1. The original-neighborhood residual is exactly F. No recovery existence, optimal threshold, moving-rank claim or different attachment family is asserted.

### III.1 Construction and every guard

Let F be a nonempty ordinary forest with components F_1,...,F_c; choose exactly one root a_i in each, R={a_i}, B=I(F), C_R=I(F-R). Add new b,g,s,v, all edges b-a_i and b-g,g-s,s-v, and h>=0 new leaves y_1,...,y_h adjacent to g. The graph T_(h,R) has n+h+4 vertices and (n-c)+c+3+h=n+h+3 edges. Joining different components at b creates no cycle, and the remaining edges attach a path and leaves; it is an actual tree. v is a leaf and s has precisely neighbors v,g.

Original N_T[v]={v,s} and N_T[g]={g,b,s,y_1,...,y_h}; their union removes exactly all added vertices, so U=F. In H=(T-N_T[v])-g, the y_j are isolated, and include/exclude at b gives

H_(h,R)=I(H)=(1+z)^h(B+zC_R).

Include/exclude at g in A gives I(A)=H_(h,R)+zB. Include/exclude at s in T-v and then at v gives

I(T_(h,R))=(1+2z)H_(h,R)+z(1+z)B.

Consequently J_(h,k)(R)=Delta_k(H)+2Delta_(k-1)(H)+Delta_(k-1)(B)+Delta_(k-2)(B) equals Delta_k(T) at every integer k, and Gamma_(h,r)(R)=Delta_(r+2)(H)+Delta_(r+1)(H)+Delta_(r+1)(B) is exactly the G1 Gamma at p=r+2.

If F recovers at r, all J_(h,k)>=0 for 0<=k<=r, J_(h,r+1)<0, and Gamma_(h,r)<0 hold for the SAME R, then x(T)=r+1 and p=x(T)+1=r+2. Crossing is x(F)<r, and target is Delta_r(F)>0. Actual extension incidence gives (r+1)i_(r+1)(F)<=(n-r)i_r(F). Since positive Delta implies i_(r+1)>i_r>0, it forces n>2r+1=2p-3. Thus every original guard holds, conditionally yielding a full ordinary G1 counterexample. This is a sufficient theorem, not existence of a successful root or recovering forest.
### III.3 Root-uniform eventual obstruction and quantifiers

Let D_t(h)=C(h,t+1)-C(h,t), with zero extension. For h>=2r+3 and -1<=t<=r+1, D_t(h)>=0: at natural t it equals C(h,t)(h-2t-1)/(t+1), and D_-1=1, earlier differences zero. Write W_R=B+zC_R=sum_j w_jz^j, w_j>=0, w_0=1. Convolution gives Delta_k((1+z)^h W_R)=sum_j w_jD_(k-j)(h). At k=r,r+1 all terms are nonnegative, giving

Delta_(r+1)(T_(h,R))=J_(h,r+1)(R)
>=D_(r+1)(h)+2D_r(h)+Delta_r(F)+Delta_(r-1)(F)=LB_(F,r)(h).       (P)

The bound has no R. Set c=Delta_r(F)+Delta_(r-1)(F), M0=max(0,-c), and h0=2r+3+(r+1)M0. For every h>=h0, C(h,r)>=1 and

D_r(h)=C(h,r)(h-2r-1)/(r+1)>=M0+2/(r+1),
D_(r+1)(h)>=0, c>=-M0.

Thus J_(h,r+1)>=M0+4/(r+1)>0 for EVERY root and EVERY h>=h0. In particular x(T_(h,R)) cannot equal r+1. All denominators are positive because r>=1. This explicit root-uniform threshold is a proved informal graph theorem; it is not an optimal cutoff. It allows smaller successful h, moving ranks, and other attachment families.

Let URES be the original positive universal: for every recovering F,r and each root tuple R, for every N there exists h>=N with x(T_(h,R))=r+1. If no recovering forest exists, URES is vacuous. Conversely, if URES held and a recovering F,r existed, each finite nonempty component would have a selectable root, and (P) at N=h0 would contradict URES. Hence URES is equivalent to absence of any recovering finite forest/rank pair. Neither direction supplies existence or absence. The original unconditional refuted_mechanism label and its boolean were therefore unjustified; the mathematical universal remains unresolved. The actual all-forest threshold and its conditional incompatibility remain proved under separate exact identities.

## P3. Cluster graph every-vertex SR2 and matching-residual G1

Exact candidate: if C is any finite ordinary disjoint union of complete graphs and r is natural with x(C)<r, every vertex a satisfies Delta_r(C-a)<=0 and Delta_(r-1)(C-N_C[a])<=0. In every full ordinary G1 tuple from P0 with the additional premise maxdegree(U)<=1, both signs hold at every residual vertex and Delta_(p-2)(U)<=0. All original T-neighborhood, leaf, degree-two support, p=x(T)+1, Gamma, width and crossing guards remain literal. No unrestricted applicability or existence of an eligible matching wrapper is claimed.

Independent sets restrict bijectively to independent choices in disjoint components, proving multiplication of component polynomials, including the empty product 1. At a vertex a, exclusion gives independent sets of G-a, while inclusion removes the CLOSED neighborhood and adjoins a, giving

    i_j(G)=i_j(G-a)+i_(j-1)(G-N_G[a])

at every integer j. At j=0 this is 1=1+0; at negative ranks all terms vanish; beyond support either right-hand set would construct a forbidden independent j-set, so both vanish. These elementary bijections are the graph/count bridges used throughout.

A rooted-forest dynamic program is independently justified by the same partition: off(u)=product_w(off(w)+on(w)), on(u)=z product_w off(w), over child subtrees; root sums multiply across components. Induction on vertices proves it counts actual independent sets. The focused replay explicitly constructs adjacency sets, checks acyclicity before using these recurrences, and counts each original induced deletion graph. It scans every predecessor difference to establish x, and uses exact integer/Fraction arithmetic with assertions enabled. Finite computation has no universal scope.
### 5.1 All-integer incidence, interval and marginal results

For any finite graph F and integer r, write D=Delta_r(F), A_a=Delta_r(F-a), B_a=Delta_(r-1)(F-N_F[a]), n=|F|. The include/exclude bijection in section2 gives A_a+B_a=D. Counting pairs of an independent j-set and an absent vertex or a marked present vertex proves

    sum_a i_j(F-a)=(n-j)i_j(F),
    sum_a i_(j-1)(F-N_F[a])=j i_j(F).

At negative or unsupported j both sides vanish even if the scalar factor is negative; at j0 the marked sum is0. Subtraction gives

    sum A_a=(n-r-1)D-i_r,
    sum B_a=(r+1)D+i_r.

These include the empty graph; for example r=-1 has D1 and i_-1=0, and r0 has D=-1,i0=1, giving empty sums0. The exact pointwise and existential equivalences are

    A_a<=0 and B_a<=0 iff D<=B_a<=0,
    exists joint a iff exists a with D<=B_a<=0.

They assert no existence; both existentials are false on an empty vertex set. Any joint a proves D<=0 by addition, at every integer rank. This is the graph sufficient step, distinct from its universal applicability in G1.

If r>=0,D<0,i_r>0,n>=r+1 and (r+1)(-D)>=i_r, then sum B<=0 and sum A<0, since n-r-1>=0 and -i_r<0. A joint vertex does not follow. CT's scalar pairs(1,-2),(-2,1) have common totalD=-1, marginal sums-1,-1 and no joint pair. CU's DISTINCT scalar list(-4,3),(1,-2),(1,-2) has commonD=-1 and sums-2,-1, again none. These are two positive scalar witnesses refuting the scalar universal, not graph witnesses: they need not obey the graph incidence totals.
### 5.3 Elementary positive-linear-product LC with support

For positive real t_i, let P(z)=product_(i=1)^d(1+t_i z), with empty product[1]. Its coefficients are positive exactly on0..d and zero elsewhere. Prove zero-extended log-concavity by induction. Suppose a has positive interval support0..d and is LC, and put b_k=a_k+t a_(k-1),t>0. Expansion gives

    b_k^2-b_(k-1)b_(k+1)
     =(a_k^2-a_(k-1)a_(k+1))
      +t(a_(k-1)a_k-a_(k-2)a_(k+1))
      +t^2(a_(k-1)^2-a_(k-2)a_k).

The first and third terms are nonnegative. On positive support, LC is equivalent to nonincreasing adjacent ratios a_j/a_(j-1). If a_(k-2)a_(k+1)>0, all four indices lie in support and the ratio inequality a_(k-1)/a_(k-2)>=a_(k+1)/a_k proves the middle term nonnegative. If that right product is0 the middle term is automatically nonnegative. This handles every endpoint without division by0. The new coefficients are positive precisely on0..d+1, since each such coefficient has a positive summand. The base[1] is LC, completing the induction and proving the same statement for every subproduct.

Consequently, once a difference is negative at a supported rank j<d, all later supported ratios remain strictly below1 and all differences through rankd are negative. At d the difference is -a_d<0 directly; beyond d all differences are0. This is a tail fact for these products only, not a forest-unimodality assumption. It discharges the original Newton dependency in full.

### 5.4 Cluster graph every-vertex SR2, including zero tails

Let C be a finite disjoint union of complete graphs and r natural with x(C)<r. For a clique of positive order t_i, an independent set chooses no vertex or one of its t_i vertices. Thus P=I(C)=product_i(1+t_i z). If C is empty the every-vertex assertion is vacuous, and r0 never meets crossing. Fix vertex a in a t-clique; let Q be the product of other clique factors. Actual closed deletion removes the whole containing clique and vertex deletion leaves a(t-1)-clique (or none when t1), so

    I(C-N[a])=Q,
    I(C-a)=(1+(t-1)z)Q.

Put d=degreeP>=1,degreeQ=d-1. If r>d, then r>=d+1: Delta_r(C-a)=0 and Delta_(r-1)(Q)=0 by their exact support bounds, INCLUDING r=d+1. Do not infer an earlier sign from a zero tail.

For1<=r<=d, crossing and the established product tail imply Delta_(r-1)(P)<0. Let B=Delta_(r-1)(Q). At r=d it is the terminal difference -Q_(d-1)<0. Otherwise, if B>=0, decreasing supported ratios imply Delta_(r-2)(Q)>=0; at r1 use the separate boundary Delta_-1(Q)=1. But multiplication by(1+tz) gives

    Delta_(r-1)(P)=B+t Delta_(r-2)(Q)>=0,

a contradiction. Hence B<0. The bounded Q-tail result then gives Delta_r(Q)<=0, including its zero tail. Thus

    Delta_r(C-a)=Delta_r(Q)+(t-1)B<=0.

Every vertex satisfies both channels. The graph statement retains its exact source scope, with a corrected closed proof rather than an unsupported Newton citation or a new formal grade.

A cluster graph is a forest iff its clique orders are1 or2: any clique of order>=3 contains a triangle, and disjoint edges/isolates are acyclic. Equivalently a finite graph of maximum degree<=1 has only singleton or single-edge connected components (a path of length2 would force a degree2 vertex). Thus the two critics' matching-residual ordinary-G1 corollaries have equivalent displayed structural hypotheses; they remain separately traceable source identities. In an exact G1 tuple with this EXTRA premise on U, induced deletion gives a nonempty matching forest, crossing invokes the cluster theorem at r=p-2, and the all-integer deletion equality adds the two signs to the G1 target. Every original T-neighborhood and Gamma/width/p guard remains explicit. There is no assertion of universal applicability, a fresh matching ambient witness, or RTree transport.

## P4. Relations used in the final assessment

The three-band necessary condition p>=6 and |U|>=2p+1 uses inherited C1 p<=5 exclusion, the C2 first-wide formal consequence, the source-dependent informal second-wide consequence, and P1. Integer width gives |U|>=2p-2, and these three exact orders are excluded in turn. No proof of the inherited second-band external graph-extremal chain is included in this case, so this combined exclusion retains that explicit source dependency and is not a closed new formal candidate. The same residual in a target violation has Delta_(x(U))(U)<0 followed by Delta_r(U)>0, hence recovers; the admitted path-forest theorem forces maxdegree(U)>=3. These are necessary conditions only.

The root-average identity is an equality without recovery. Its full-G1-counterexample consequence requires actual recovery and a uniform complete first-descent history over the same root domain. The original recovery-free conjunction is false (K1,h1,r1 and P3,h0,r1). P2 proves that the recovery-restricted unbounded-padding universal is equivalent to absence of recovering forests: with none it is vacuous; with any recovering pair choose one root per component and take N=h0 to contradict arbitrarily large padding. This equivalence decides neither side.

For same-vertex deletion, A_a+B_a=D exactly. Thus SR2 implies the target. Full-tail ALIGN at the same a implies those two rank signs by the definition of tail onset tau, with integer endpoints retained. Neither converse nor a strict separation at full-G1 scope is established. The factor-one inequality with i_r>0 already forces D<0; at i_r=0, hereditary independent sets imply i_(r+1)=0 and D=0. Therefore factor one implies G1, whereas the conditional diameter selector assumes factor one and is not a weaker route to the G1 sign. Negative-target forest SR2 assumes D<0 and cannot establish the missing sign; its applicability and full-G1 SR2 are distinct open propositions. Terminal-average selection adds two separate premises whose derivation from G1 guards remains unproved.
