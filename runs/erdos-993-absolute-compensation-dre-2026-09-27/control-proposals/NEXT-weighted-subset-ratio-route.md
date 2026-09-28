# Private weighted-subset ratio observation, not current C4 authority

Potential auxiliary tool for conditional local-state bounds; no registry or formal award yet.

For C=G product B_r, represent each B_r as the generating polynomial of weighted subsets of an r-element tip block: a subset has weight1 except singletons, which have weight1+1/r. The block coefficients are exactly choose(r,t)+1[t=1]. Represent G=1+2z by a one-element block with singleton weight2. Then C is the rank-generating polynomial of positive weighted subsets of N+1 elements.

For any cover S->S union{v}, the weight ratio is at least2/3 when r in{2,3,4}: entering a singleton multiplies by1+1/r, leaving singleton rank divides by1+1/r>=2/3, other transitions have ratio1; the G transition has ratio2. Double count all weighted covers from rankk to rankk+1. Each lower subset has N+1-k outgoing covers, each with upper weight at least(2/3) its lower weight, while each upper subset is countedk+1times. Therefore (k+1)C[k+1]>=(2/3)(N+1-k)C[k]. The same reasoning applies to D=G H_i with ambientsizeN-r_i+1.

This is a simple controller-derived informal lower ratio bound, not the upper ratio/strict-selection comparison needed by the experiment. Near the lower-half band it can bound ratios between a few shifted cofactor coefficients. It must not be confused with ultra-log-concavity, a normalized-matching assertion about graph-independent-set inclusion, or a parent-P inequality: the extra root-state summand is not part of this weighted product law. The artificial weighted-subset model encodes coefficients only; the local singleton weight spreads the center contribution over tip singletons.

A future review should check index endpoints, the G ambient element, zero extension and all cover multiplicities. This bound alone has not been shown to remove any finite certificate or prove guarded deletion/deck LR. It is not current-cycle worker input.

Identity comparison: this cover bound is the coefficient face of (3+2z)Cprime-2(N+1)C>=0. The Cycle2 formal package already uses exactly the operator e993D=(3+2X)*p.derivative-2*d*p, with nonnegative factor certificates and a generic coefficient lemma. Thus this should be treated as a combinatorial interpretation/reuse of that existing machinery, not a newly discovered bound or new registry key. For a cofactor G H_i, reuse the same formal product certificate with the remaining branch list and weightN-r_i+1. Any stronger conditional-probability or selector consequence would still need a distinct proof.
