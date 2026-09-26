# Controller candidate: first eligible order shell, pointwise

Pending independent review; no award. Intended consequence is the registered E993-LOWER-REGION-FIRST-ORDER-SHELL. Proposed stronger intermediate: for every ordinary tree T, natural p>=3 with n=2p+2 and x(T)+2<=p, every original-leaf term is nonpositive. The lower-region alpha guard and favorable selector are unnecessary for this proposed pointwise shell theorem. Do not silently broaden any registered statement or treat this as already verified.

## 1. A marked shadow bound using vertex cover

Let G have m=2k+2 vertices, k>=2, and let W contain at least one non-isolated vertex. If its minimum vertex-cover number tau(G)>=3, then q_(k+1)<=q_k for independent sets meeting W.

Order a non-isolated mark first. Partition marked independent j-sets by their first mark w_i; after including w_i, the remaining graph is J_i=G-(N_G[w_i] union all earlier marks), so q_j=sum_i i_(j-1)(J_i). All deletion unions have at least2 vertices: the first has a neighbor, and each later one contains a distinct earlier mark. Hence |J_i|<=2k.

If |J_i|<=2k-1, the elementary unmarked shadow count implies i_k(J_i)<=i_(k-1)(J_i).

If |J_i|=2k, its deletion union is exactly {w_i,z} for some z. Every neighbor of w_i is z (or w_i is isolated); consequently every edge of G outside J_i is incident to z. If J_i had at most one edge, z plus one endpoint of that edge would be a vertex cover of G of size at most2, contradiction. Thus J_i has at least2 edges. Apply the already formally verified E993-GRAPH-FIRST-WIDE-SHARP-CLASSIFICATION with r=k-1: |J_i|=2r+2 and r>=1, so Delta_r(J_i)<=0. This is exactly i_k(J_i)<=i_(k-1)(J_i). Sum over first marks.

This proof uses the exact graph cardinality and exact edge classification, not the refuted edge-addition monotonicity statement.

## 2. Every eligible first-shell tree has tau(T)>=4

Suppose a graph T on n=2p+2 vertices has a vertex cover of size at most3. For p>=3 extend one to a cover C of size exactly3; the outside set has N=n-3=2p-1 vertices and is independent. Decompose independent sets according to X contained in C. For an independent X, the available outside vertices number b_X=N-|N(X) intersect (V minus C)|, giving

    I(T,z) = sum_(X independent subset C) z^|X| (1+z)^b_X.

For every 0<=r<=p-2, the empty-X term contributes E(N,r)=binom(N,r+1)-binom(N,r). Every size-a nonempty X term is at least -Cat_(r-a), with zero extension Cat_j=0 for j<0 (for j=-1 the binomial difference is1, and for j<=-2 it is0, so the lower bound0 remains valid), by the registered E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR (or its proved-informal uniqueness refinement). Since there are at most binom(3,a) such X,

    Delta_r(T) >= E(2p-1,r) - 3 Cat_(r-1) - 3 Cat_(r-2) - Cat_(r-3).

Here 2p-1>=2r+3. E(N,r) is increasing in N on N>=2r+2 by Pascal and positive binomial differences. The right side is at least Gamma_3(r,2r+3), which is strictly positive for every r>=0. This follows directly from the registered E993-R25-GAMMA-RESIDUE-SLACK-THRESHOLD at tau3, slack1 (proved_informal composite; not a formal award).

For an independent elementary proof of this positivity: r0 gives E(3,0)=2 and no negative Catalan terms; r1 gives E(5,1)-3Cat0=5-3=2. For r>=2, E(2r+3,r)=2(2r+3)/(r+3) Cat_(r+1)>=2Cat_(r+1). The Catalan ratio Cat_(j+1)/Cat_j=2(2j+1)/(j+2) is at least2 for j>=1; hence Cat_(r+1)>=4Cat_(r-1). Monotonicity and zero extension bound the subtraction by7Cat_(r-1). Therefore the margin is at least Cat_(r-1)>0. Each use of division is over positive denominators and can be cleared for integer formalization.

Thus Delta_r(T)>0 for all0<=r<=p-2, so x(T)>=p-1. This contradicts x(T)+2<=p. Therefore eligible first-shell trees have tau(T)>=4. This argument needs no forest-specific assumption; its first-descent conclusion is not inferred merely from a single positive difference.

## 3. Leaf specialization

For an original leaf v and support s, let H=T-{v,s}, W=N_T(s) minus {v}. The leaf exchange gives alpha(H)=alpha(T)-1. Since tau(G)=|V(G)|-alpha(G) for every finite simple graph, tau(H)=tau(T)-1>=3. Equivalently a minimum cover of T can contain s and omit v; removing s gives a cover of H, and adding s to any cover of H gives a cover of T.

Each component of H contains a mark from W (connectivity of T; acyclicity gives uniqueness). Since tau(H)>=3, H has an edge, so a nontrivial component exists and its marked root is non-isolated. Thus Step1 applies with |H|=2p=2k+2 and k=p-1>=2. It yields q_p<=q_(p-1), or Delta_(p-1)(H)-Delta_(p-1)(T-N_T[s])<=0.

This holds for every original leaf, so summing over the exact favorable selector proves the registered first-shell complete aggregate. Same-support leaves remain separate terms. The exact lower-region alpha guard is retained in the registered consequence even though this proof does not need it.

## Boundaries and review duties

This is a controller candidate outside active C2 worker source packets. It needs an independent proof audit and hostile falsification, including the edge-classification source and Catalan-floor source, the cover extension/decomposition, all-ranks positivity (not just the last rank), out-of-range coefficients and leaf-cover identity. No claim about n>=2p+3 is made. The generic marked-isolate cutoff is still sharp: its local-positive parent examples have tiny cover and x=p, exactly excluded here. No universal no-recovery theorem, aggregate at other orders, or proof of Erdos993 is asserted.
