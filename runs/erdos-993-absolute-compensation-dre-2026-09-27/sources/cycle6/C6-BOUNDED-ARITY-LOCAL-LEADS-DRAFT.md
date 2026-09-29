# Unreviewed algebraic leads beyond arity4

Controller preparation only, not an accepted theorem, new experiment or registry identity. The actual primary and C6 finite base remain exactly arity2/3/4. These optional calculations motivate an explicit future applicability test instead of assuming transfer to arbitrary rooted trees.

Let r>=2, L=1+z, B_r=L^r+z. Its positive coefficient sequence is log-concave. A plausible enlarged ULC order is H_r=binom(r,2)+1, which specializes to2,4,7. To verify: at index2 the sole increased-neighbor comparison for r>=3 is

 a2^2/(a1*a3) =3r(r-1)/(2(r+1)(r-2)),

whereas order-H ULC requires at this index at least3(H-1)/(2(H-2)). H=H_r gives equality. At index1 check (r+1)^2/binom(r,2)>=2H/(H-1); indices>=3 retain binomial coefficients and increasing normalization order from r to H weakens the required curvature. Check r2 separately and all endpoints. This is only a derivation to audit, not a newly sourced ULC theorem; product closure remains the already used theorem with its exact hypotheses.

The coefficientwise ratio-floor operator has a simple universal expression:

 (3+2z)B_r'-2rB_r = rL^(r-1)+3+(2-2r)z.

Its constant coefficient is r+3, its z coefficient is (r-1)(r-2)>=0, and all higher coefficients are nonnegative. Root G still gives4. Product rule therefore supplies the same3/2 ratio-floor bound for C over arbitrary finite arities>=2, not just2..4.

The local coefficient ratios B_(r-1)/B_r are1 at0, r/(r+1) at1, (r-k)/r for2<=k<=r-1, and0 at k=r. They decrease. The endpoint identity U0-Ui=z^2(L^(r-1)-1)H_i is algebraic for everyr>=2. These ingredients suggest a transferable coefficient framework, but they do not prove the E-deficit surplus or actual selectors in a new family.

For fixed maximal arity R, the center-subset low-band sign is s(N+1)-k*sum_(i in S)r_i>=0 when R*k<=N+1. Outside that band and below the half-rank guard, each singleton Jensen contribution has the form

 g_r = (2r/(2r+1))*(k/N)*product_(a=0..r-2)((N-k-a)/(N-1-a)).

For fixedR and sufficiently largeN, these factors admit a positive constant lower bound depending onR (for example use k/N>1/R and a separately justified lower factor bound below1/2). Exponential growth in m could then pay an O(m) deficit for sufficiently largem depending onR. The exact threshold, every boundary and a remaining finite base have NOT been proved or checked. No global all-arity conclusion follows, since constants deteriorate withR and an unbounded-arity argument needs additional control.

An extra branching depth generally changes these branch polynomials and the parent/deletion mixture. None of the formulas above supplies that realization automatically. A future useful experiment should test exact realizable branch pairs against the three conditions: coefficient floors for Jensen, suitable finite ULC curvature, and main-product deletion LR, then separately verify the shared binomial deficit model. Do not assume arbitrary forest independence polynomials are real-rooted or log-concave.

Additional index1 check: after positive denominator clearing, the H_r-normalized ULC comparison reduces to
 (r+1)^2(H_r-1)-r(r-1)H_r=r(r-1)(3r-1)/2>=0.

The restriction r>=2 is substantive for the proposed direct marked Jensen specialization. At arity1 the marked B0=1+z has a zero nominal block size but a nonzero z coefficient; it is not the positive-size truncated block required by the full generic theorem. Do not extend the argument to arity1 by a silent substitution. Such branches require a separate realization/factorization treatment even though some standalone algebraic identities survive.
