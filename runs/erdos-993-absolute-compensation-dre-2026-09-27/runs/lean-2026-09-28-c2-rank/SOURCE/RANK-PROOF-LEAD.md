# Controller formal lead — coefficient rank barrier

Unreviewed formalization lead for next-cycle comparison; not a new C2 worker input or an award. C2-T3 was independently assigned to check the universal rank barrier.

For each local factor f of degree d in {G,B2,B3,B4}, the polynomial (3+2z)f'-2d f has nonnegative coefficients. This is a finite local coefficient check. Nonnegative-coefficient multiplication and the product rule then imply (3+2z)C'-2(N+1)C has nonnegative coefficients for C=G prod B_ri, all m and r_i in2..4. At coefficient k this is

    3(k+1)C[k+1] >= 2(N+1-k)C[k].

Thus C[k+1]>=C[k] whenever5k<=2N-1. The additional parent term z(1+z)^(N+1) is increasing throughout that range under integer zero extension. Hence P[k+1]>=P[k] there, and EVERY strict parent descent x, not just the first, satisfies5x>2N-1, equivalently5x>=2N for integer N,x. This is a potentially compact, useful formal coefficient theorem: four local checks plus product induction and exact binomial monotonicity. A literal-tree bridge is a separate scope. Handle k=0, terminal indices and natural/integer subtraction explicitly.

This is an existing informal structural tool from the predecessor, not novelty. Check whether C2-T3 or its critics nominate it before considering a new formal contract. It is central to the uniform occupancy coefficient band, unlike a pure restatement of payment.

## Direct parent certificate (controller-private, pending independent audit)

The binomial summand can share the same differential certificate as C. Put D_d(f)=(3+2z)f'-2d f. D_{a+b}(fg)=gD_a(f)+fD_b(g). D_0(z)=3+2z has nonnegative coefficients, and D_1(L)=1. Thus zL^q has nonnegative coefficients and D_q(zL^q)>=0 coefficientwise, explicitly D_q(zL^q)=(3+2z)L^q+qzL^(q-1). Since C satisfies D_q(C)>=0, so does P=C+zL^q. Taking coefficient k gives 3(k+1)P[k+1]>=2(q-k)P[k]. For 5k+1<=2N with q=N+1, the RHS multiplier is >=3(k+1), proving nondecrease directly. This avoids a separate formal Nat.choose monotonicity lemma and does not need any parent LC assumption. Formal d is an assigned weight parameter, not necessarily natDegree (P has degree q+1). Keep that distinction explicit in the contract.

A compact exact declaration could quantify a finite list of arities in{2,3,4}, define N as its sum and P=(1+2X)*product((1+X)^r+X)+X*(1+X)^(N+1), and assert `2*N <= 5*k` for ANY strict coefficient descent P[k+1]<P[k]. This is stronger than the least-descent consequence and removes minimality from the formal lemma's hypotheses. The actual first-descent application is then direct, retaining all original eligibility guards in the downstream theorem. The empty list can be included if proved, but the family's m>=1 domain remains unchanged downstream.

Proof architecture: coefficient nonnegativity closed under sum/product/power; D_d nonnegative closed under weighted products and same-weight sums; local explicit D_G and D_B2/3/4 identities; D_0(X) and D_1(1+X) nonnegative; list-product induction and parent addition. Finally extract coefficient k, use `3(k+1)P[k+1]+2kP[k]>=2(N+1)P[k]`, strict descent and nonnegative coefficients, and the integer contradiction if5k<2N. No log-concavity, binomial expansion, division, classical probability or external analytic inequality is needed for this formal target. Independent informal audit and exact statement fidelity remain mandatory.
