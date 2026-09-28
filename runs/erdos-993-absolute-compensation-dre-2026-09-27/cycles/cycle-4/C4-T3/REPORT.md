# C4-T3 — coefficient bridge review

## Scope and source integrity

The packet is a Cycle 4 search seat, orientation T, with no additional case files. I verified the SHA-256 of all 174 members of `manifests/C4-COMMON-DISPATCH.json`; there were no mismatches. The packet hash list is empty. Inputs were restricted to the dispatch/control files and common-manifest members.

Relevant registry records: `E993-FINITE-BLOCK-CENTER-SUBSET-COEFFICIENT-EXPANSION` is formally verified, with exact scope limited to a finite polynomial coefficient identity. `E993-FINITE-BLOCK-COEFFICIENT-JENSEN-DOMINATION` and `E993-PATH-STAR-ARITY-2-4-OCCUPANCY-JENSEN-COFACTOR` are informally verified, without a formal award. The formal center-subset theorem does not itself prove either Jensen claim.

## General finite-block bridge

Let block sizes be positive integers \(s_i\), \(M=\sum_i s_i\), and let \(F_i(z)=\sum_{t=0}^{s_i} f_i(t)z^t\), with \(f_i(t)\ge {s_i\choose t}\). For \(0\le k\le M\), choose a uniform \(k\)-subset of the disjoint union of labeled blocks and let \(K_i\) be its count in block \(i\). Then the count-vector law is

\[
\Pr((K_i)=(t_i))=\frac{\prod_i {s_i\choose t_i}}{{M\choose k}}
\quad (\sum_i t_i=k),
\]

and ordinary polynomial convolution gives the exact identity

\[
\frac{[z^k]\prod_iF_i(z)}{{M\choose k}}
=\mathbb E\prod_i w_i(K_i),\qquad
w_i(t)=\frac{f_i(t)}{{s_i\choose t}}\ge1.
\]

This is a finite sum identity: it follows by expanding the coefficient as a sum over bounded count vectors, and Vandermonde normalization says those weights sum to one. It does not assume independent block counts. Empty families are handled separately by \(M=k=0\), where both sides equal one.

For the registered Jensen lower bound, apply finite Jensen to \(\exp\) and the pointwise inequality \(\log w\ge2(w-1)/(w+1)\) for \(w\ge1\). The result is

\[
[z^k]\prod_iF_i(z)\ge {M\choose k}\exp(y_k),\quad
 y_k=\sum_i\sum_{t=0}^{s_i}\frac{{s_i\choose t}{M-s_i\choose k-t}}{{M\choose k}}
 \frac{2(f_i(t)-{s_i\choose t})}{f_i(t)+{s_i\choose t}}\ge0.
\]

Then \(\exp(y_k)\ge E_d(y_k)=\sum_{a=0}^d y_k^a/a!\) gives every registered finite Taylor floor. Binomial terms are zero-extended; all denominators in the displayed in-range formula are positive. To formalize this bridge, expose the count-vector convolution identity as a separate rational finite-sum lemma first, then isolate the real Jensen/log inequality and the nonnegative Taylor remainder. The center-subset expansion is a useful alternate coefficient representation, but alone it proves neither this expectation identity nor the Jensen step.

For \(F_i=(1+z)^{s_i}+z\), the only surplus is at \(t=1\): \(f_i(1)-{s_i\choose1}=1\). Thus its contribution to \(y_k\) is exactly
\[
\frac{2s_i}{2s_i+1}\frac{{M-s_i\choose k-1}}{{M\choose k}},
\]
which recovers the registered singleton-occupancy exponent. Convolution with \(G F_{r_i}\), using the stated nonnegative arity-2/3/4 coefficient vectors, transfers any zero-extended cofactor floor to \(T_i[j]\). This is a coefficient lower bound only.

## Graph transfer boundary

A useful specialization to rooted components needs explicit hypotheses. After deleting the hub, the components must be disjoint so their independence polynomial factors. For each component \(H_i\), specify its independence number \(s_i\), and fix a maximum independent set. Its subsets give \(I(H_i)[t]\ge {s_i\choose t}\). If there is a vertex outside that fixed maximum set, its singleton supplies one additional independent set at size one, yielding \(I(H_i)[1]\ge s_i+1\), hence \(I(H_i)\ge(1+z)^{s_i}+z\) coefficientwise. This justifies a cofactor coefficient floor.

It does not establish that the whole parent polynomial is \(G\prod_i I(H_i)+z(1+z)^q\), that a marked deletion has factor \(F_{r_i}\) (or an appropriate general replacement), or that the original leaf tags/multiplicities are preserved. Those must be proved from the rooted graph construction. Any use in the payment route additionally needs the actual least strict parent descent (including terminal differences), every eligibility guard, and strict current-\(p\) deletion selectors on that same graph. Coefficient domination alone supplies none of these rank or marked-deletion bridges.

## Claim and evidence grade

The independently restated count-vector identity and its Jensen consequence support the already registered informal general coefficient/Jensen claim at exactly its finite-block scope; they are not a new proof of the primary selected payment. No finite computation or graph-wide census was needed. There is no counterexample to the stated block identity or Jensen route in this review. The universal payment remains outside this claim and this evidence.

No scripts or numerical artifacts were needed. No Lean build was run.
