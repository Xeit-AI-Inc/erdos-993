# Controller candidate: second shell via normal product posets

Proposed mathematical derivation, no award. Keep out of frozen C3 packets. Intended for fresh independent review and C4 preparation. No claim of novelty or completed formalization.

## Literature premise

West, Harper, Daykin, Some Remarks on Normalized Matching, JCTA 35 (1983), 301–308, p303 recalls Harper's product theorem: products of normal (LYM) ranked posets with log-concave rank sizes retain both properties. The equivalence with uniform normalized flows is recalled on p304. Author-hosted primary text: https://dwest.web.illinois.edu/pubs/normatch.pdf ; DOI https://doi.org/10.1016/0097-3165(83)90015-8 . Earlier primary source: Hsieh and Kleitman, Normalized Matching in Direct Products of Partial Orders, Stud. Appl. Math.52 (1973),285–289, https://doi.org/10.1002/sapm1973523285 . Read 2026-09-25. Only this general product premise is imported; everything below is a proposed application requiring review.

## Matching-four odd residual lemma

Let G have n=2k+1 vertices, k>=4, and a matching of four edges. Let P be the inclusion poset of independent sets of JUST those four edges plus all remaining isolated vertices. It is a product of four rank-one posets with rank sizes (1,2) and 2k-7 rank-one posets (1,1). Each factor is normal and log-concave, hence P is normal. Its rank polynomial is A(z)=(1+2z)^4(1+z)^(2k-7).

The independent sets of G are a downset of P. Normalized downward shadow implies i_k(G)/A_k <= i_(k-1)(G)/A_(k-1); extra edges cannot invalidate downset closure. Thus A_k<=A_(k-1) implies the desired ordinary unmarked sign.

Put a=k-4>=0 and C=binom(2a+1,a). Direct expansion gives
(A_k-A_(k-1))/C = -6a(a-1)/((a+2)(a+3)(a+4)) -32a/((a+2)(a+3)) -16/(a+2) <0.
At a=0 the first numerator vanishes, so the expression remains valid. For a>=1 all summands are nonpositive and last strictly negative. Three matching edges are insufficient: the previously saved 3K2+isolates examples have positive sign. This lemma is for unmarked graph coefficients; it is not a general claim that graph independence posets are normal.

## Early descent excludes cover five at parent order 2p+3, p>=8

Suppose T has n=2p+3, p>=8, and a vertex cover C of size at most five. Enlarge to exactly five (allowed because n>=19), leaving N=2p-2 independent vertices. Partition independent sets by A subset C that is itself independent. Each fiber contributes z^|A| (1+z)^(N-|N(A) outside C|). Write E(M,t)=binom(M,t+1)-binom(M,t), using zero extension. For t>=0 the existing Catalan floor gives E(M,t)>=-Cat_t. For t=-1 E=1, and for t<-1 E=0; OMIT these nonnegative contributions rather than replacing their multiplicity by an upper bound.

For every 0<=r<=p-2:
Delta_r(T) >= E(N,r) - sum_{a=1..min(5,r)} binom(5,a) Cat_(r-a).
The empty fiber is exact. This corrects the positive-shift flaw in C3-T1's draft generic budget.
For r>=6, N>=2r+2, and E(N,r)>=E(2r+2,r)=Cat_(r+1). At r=6, Cat7 -5Cat5-10Cat4-10Cat3-5Cat2-Cat1 =429-210-140-50-10-1=18 >0. (Recompute independently; do not use the earlier mental arithmetic.) For each fixed a, Cat_(r-a)/Cat_(r+1) decreases as r grows because consecutive Catalan ratios increase. Thus strict positivity persists for r>=6.
For 0<=r<=5, N>=14, and the six exact finite inequalities E(14,r)>sum_{a=1..min(5,r)} binom(5,a) Cat_(r-a) are straightforward. Hence all Delta_r>0 through p-2. The eligibility x+2<=p contradicts cover<=5, giving tau(T)>=6.

## Marked first-hit reduction at the second shell

Let H=T-{v,s}, W=N_T(s) minus {v}; put k=p-1. Then |H|=2k+3 and tau(H)>=tau(T)-1>=5: a cover of H plus s covers T. Order W with a nonisolated mark first; connectivity ensures such a mark for a tree of this order. The exact first-hit partition is
q_j(H,W)=sum_i i_(j-1)(J_i),
J_i=H - (N_H[w_i] union {w_1,...,w_(i-1)}).
Earlier mark VERTICES are removed, not their neighborhoods. Let D_i be this deletion set. Always |D_i|>=2: the first mark has a neighbor, and later marks have an earlier mark.

Because D_i contains the CLOSED neighborhood of w_i, the set D_i minus {w_i} covers every edge removed from H: every edge incident to w_i has its other endpoint in D_i, and all other removed edges have an endpoint in D_i minus {w_i}. Consequently tau(J_i)>=tau(H)-(|D_i|-1), with no overlap-case classification needed.
If |D_i|=2, tau(J_i)>=4; since J_i is a forest, Konig gives a matching of four, |J_i|=2k+1, and the normal-product lemma gives i_k<=i_(k-1).
If |D_i|=3, tau(J_i)>=3, so J_i has at least two edges; |J_i|=2k and the prior formal first-wide lemma applies at rank k-1.
If |D_i|>=4, |J_i|<=2k-1 and the ordinary downshadow bound gives i_k<=i_(k-1).
Sum exact fibers: q_(k+1)<=q_k. This would prove the pointwise original-leaf sign for all trees n=2p+3,p>=8,x+2<=p, without alpha/favorability assumptions. Small p are intentionally not covered. No inference to arbitrary larger orders, full aggregate, weighted-switch Hall, governed RTree, or Erdos993.

## Review needs

Check the normalized downset inequality orientation and whether product hypotheses really match. Verify the rational coefficient identity including a=0. Verify Catalan floor and monotonic E(N,r) in the stated range, all six finite r cases, and cover-five calculation. Audit every |D|=2/3 overlap case. Check the nonisolated-mark existence and tree support bridge. Reconstruct proof independently; report any failure rather than repairing silently.

## Alternative constructive lift, avoiding the general product theorem

A completely explicit finite deletion injection between ranks4 and3 of 4K2+K1 exists:48 upper states,56 lower states. MATCHING4-BOOLEAN-LIFT-CERTIFICATE.json lists all48 images; each is a subset of its source and all are distinct. No universal conclusion is awarded from this finite certificate alone.

For any k>=4, decompose the Boolean lattice on the 2k-7 unmatched vertices into symmetric saturated chains. A chain begins at rank a and ends at 2k-7-a, with odd length difference. If a<=k-5, every independent k-set over this outside chain has outside rank k-j>=k-4>a (its matching-core rank j<=4), so send it to its outside predecessor keeping the core. This is injective and deletes one vertex. The only other possible outside chains contributing rank k begin at a=k-4 and end a+1=k-3. (If a>=k-3 impossible since a<=floor((2k-7)/2)=k-4.) On such a two-element outside chain, its lower outside subset A is fixed and its upper is A union {b}. Strip A and identify b with the isolated vertex8 of the fixed 9-vertex certificate: rank k becomes rank4 and target rank k-1 becomes rank3. Apply the fixed48-row subset injection, then reattach A. All outputs stay in the same outside Boolean chain. Distinct chains remain disjoint, so combining maps gives a global deletion injection. Any extra graph edges preserve independence because images are subsets. Thus the matching-four lemma can be proved using the standard recursive Boolean SCD and a fixed finite certificate, instead of importing Harper's full normal-poset theorem. Audit all offsets and ensure reattachment never conflicts with core (it does not change the vertex set except deletion).

This alternate proof may be substantially easier to formalize: formal SCD plus one native finite injection. It does not require that general graph independent-set posets be normal or log-concave.
