# Controller candidate: marked-isolate order band

Registered OPEN for Cycle2 intake under the generic marked-isolate and ordinary-leaf order-band keys. The proof has not yet received independent or formal review. This is not an input to Cycle1 searches, critics, adjudication, or synthesis.

Let G be a finite simple graph on m vertices, W a vertex set containing every isolated vertex of G, and k>=2 an integer. Let q_j count independent j-sets meeting W. Candidate theorem: if m<=2k+1, then q_(k+1)<=q_k.

For an independent marked k-set A, write b(A)=|N_G(A)|, where N_G(A) is the union of the open neighborhoods of vertices of A. Independence makes N_G(A) disjoint from A. Consequently the number e(A) of actual addable vertices is m-k-b(A). Write B=sum_A b(A). Let C count independent (k+1)-sets having at least two vertices in W, each once.

Count incidences (A,y) with A marked independent of size k and y addable. An upper set with exactly one mark has k marked-preserving deletions, whereas one with two or more marks has k+1. Therefore

    k*q_(k+1)+C = (m-k)*q_k-B,
    k*(q_(k+1)-q_k) = (m-2k)*q_k-B-C.

For m<=2k, all terms make the last expression nonpositive, without even needing the isolate hypothesis.

It remains to handle m=2k+1. Partition marked k-sets into good sets with b(A)>=1 and bad sets with b(A)=0. The latter consist entirely of isolated vertices. Because W contains every isolate, every k-subset of the isolate set is indeed a bad marked set. Thus B is at least the number of good sets.

If G has a non-isolated vertex y, fix one. Send each bad A to A union {y}. This is an independent (k+1)-set, contains at least k>=2 marked vertices, and determines A by deleting y, since y is non-isolated and cannot belong to A. Hence it is an injection from bad sets into the family counted by C. Therefore C is at least the number of bad sets, and B+C>=q_k. The incidence equation yields q_(k+1)<=q_k because k>0.

If G has no non-isolated vertices, W=V(G), and complement is a bijection between its k-subsets and its (k+1)-subsets because m=2k+1. Thus q_(k+1)=q_k. This completes the candidate proof. Empty marked families and absent bad sets are included in the argument.

## Ordinary leaf corollary

Let T be a finite ordinary tree, v an original leaf, s its original support, H=T-{v,s}, and W=N_T(s) minus {v}. Every isolate u of H lies in W: connectivity gives u an original neighbor; that neighbor lies among {v,s}; u cannot be adjacent to v because v's unique neighbor is s, so u is adjacent to s. Therefore H satisfies the marked-isolate hypothesis.

If p>=3 and |V(T)|<=2p+1, set k=p-1. Then |V(H)|=|V(T)|-2<=2k+1, and the marked counts q_j=i_j(H)-i_j(T-N_T[s]) obey q_p<=q_(p-1). Equivalently, every original leaf term Delta_(p-1)(H)-Delta_(p-1)(T-N_T[s]) is nonpositive. This uses neither favorability, alpha, first-descent assumptions nor a residual premise.

For a nonempty tree, Delta_0(T)=|V(T)|-1>=0, so x(T)>=1. Eligibility p>=x(T)+2 implies p>=3. Thus any positive complete favorable-leaf aggregate must have |V(T)|>=2p+2. This would also apply to the all-rank ordinary formulation, but is only an order-region result and cannot award that universal target.

## Evidence and limits

A controller sanity calculation checked the generic lemma at k=2 on every labeled graph of order5 (1024 graphs) and every W containing its isolates: 28217 marked-graph cases, zero failures. This is a bounded check of the proof, not its universal justification. The known positive local controls lie outside the proposed order band: order91 at p34 has 91>69, and order243 at p90 has 243>181. No informal or formal status is claimed before independent review and registration.

## Sharpness without the first-descent guard (additional candidate observation)

The generic graph order cutoff cannot be increased by one while retaining only its stated hypotheses. Let G=K_(1,2k+1) and let W consist of one pendant leaf. G has no isolates, so the marked-isolate condition is satisfied. For j>=2, q_j=binom(2k,j-1), hence q_(k+1)=binom(2k,k)>binom(2k,k-1)=q_k. This has m=2k+2.

Embed G as H by attaching a new support s to the marked leaf w and a new leaf v to s. The parent T has n=2k+4=2p+2 at p=k+1, and alpha=2k+2. Its polynomial is (1+z)^(2k)*(1+3z+z^2)+z+2z^2. The first strict descent is x=k+1=p, so this local positive example is ineligible for the primary. For the first-descent claim: the base product is symmetric and strictly increases through rank k+1; at j=k its adjacent difference is twice the positive central binomial difference plus the preceding positive difference. All j<k have nonnegative binomial differences, with strict positivity. The low-degree addition changes Delta0 by +1, Delta1 by +1 and Delta2 by -2; the base Delta2 equals n0*(n0-1)*(n0+4)/6-2*n0-1 for n0=2k>=4 and is at least7. Thus no earlier descent is introduced. Symmetry of the base gives descent at k+1. This needs independent checking before use as a universal parameterized diagnostic.

The example therefore refutes only an unconditional extension of the generic marked-isolate order band. It does not decide the next eligible ordinary-tree shell n=2p+2. That shell may be a useful next investigation because the first-descent hypothesis excludes this extremal local obstruction.
