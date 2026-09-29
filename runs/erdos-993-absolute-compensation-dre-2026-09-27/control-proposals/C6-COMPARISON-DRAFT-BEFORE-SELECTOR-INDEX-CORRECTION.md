# Candidate complete guarded comparison proof

Controller consolidation for independent C6 review. This document proposes a proof; it supplies no authoritative verdict or new formal award. All source cases, errors and repairs remain preserved. The target is the ordinary arity-2/3/4 path-star family only.

## Exact objects and scope

Let m>=1, let r_i belong to {2,3,4}, and set N=sum r_i, a_r=#{i:r_i=r}, h=1+2a_2+4a_3+7a_4. In the monomial variable z put

L=1+z, G=1+2z, B_r=L^r+z, Q=product_i B_(r_i), H_i=product_(j!=i) B_(r_j),
C=GQ, E=zL^N, U_i=G B_(r_i-1)H_i, U_0=LQ, A_i=U_i+E, A_0=U_0+E.

All coefficients are zero extended, including negative subscripts in informal identities. For every natural k>=1 with 2k<=N+2 define

M_k(F)=F[k]C[k]-F[k+1]C[k-1],
S_i(k)=(h+1)U_i[k]C[k]+(k+1)(h-k+1)M_k(E).

The proposed conclusions are S_i(k)>0, M_k(A_v)>0 for every original leaf v (endpoint or tip), and M_k(sum_i r_i A_i)>0. These strict conclusions imply the registered nonnegative inequalities. The original predicates need not be rewritten or duplicated to record stronger certificates. No first-descent, eligibility or selection hypothesis occurs in these three statements.

We have 2m<=N<=4m, h>=N+1, and k<=N. C and U_i have positive coefficients throughout their supports of degrees N+1 and N, respectively. Every denominator used below is positive on the stated domain.

## Complete finite range: 1<=m<=99

The frozen protocol covers every count triple (a_2,a_3,a_4) of sum m, each represented arity, and every k=1,...,floor((N+2)/2), with no eligibility filter. Products commute and marked branches of the same arity have the same cofactor polynomial. Thus these count profiles and represented arities exhaust labeled profiles and marked indices up to exact polynomial equality; no unlabeled-tree inference is needed.

Two separately authored exact methods cover 171699 profiles and 56245000 represented-tip/rank rows each. Both report no negative row and strict global minimum98 at (a_2,a_3,a_4)=(1,0,0), marked arity2, k1. All99 per-m counts, minima, parameters and shared witness coefficients agree. The minimum being positive also rules out zeros.

* Corrected A: explicit integer coefficient arrays and exact constant-one cofactor division. Frozen source c6ef6fe9f2a97ca4225482d1b0ef35f9e5a81cdead1cf9322771ed200f987d69; result 2ecbb7423531e718241d831ef08078b0f3ccdc8ce2d05645b62b0325316c7dcb. Evidence is control-proposals/C6-A-PROTOCOL-REPAIR1/run-full/ and its source/verification files.
* B: direct integer Kronecker evaluation with radix2^(N+m+4), coefficient extraction, and one decremented marked exponent. The coefficient-sum bound prevents carries. Frozen source d29ebed0281db22daaa6c1780c69bb962f67b45cb61cc64102e44d5714094166; result 251b74de0d21cd20e3d7cdb78c148f44ca99fd8c6d3bd3ffc331644d3b0e6730. Evidence is cycles/cycle-6/C6-U2/final-run-1-99/ and its source/validator files.

The original A invocation omitted embedded controls. Its entire corrected invocation reran the same mathematical loop with controls; no differently hashed shards are combined. Original+repair time1398.761seconds is below the cumulative3600second cap; each invocation is below1800. B took1101.478seconds. A's corrected replay is not a third method. Actual hashes, checkpoints, unique m-indices and controls were compared in C6-TWO-INSTRUMENT-COMPARISON.py/.json. Independent final review must inspect these sources and receipts; finite agreement is not itself an infinite proof or a Lean award.

## Analytic tail: m>=100

Write c_t=choose(N,t), with zero extension. Expand Q=sum_S z^s L^(N-R), where s=|S| and R=sum_(i in S)r_i<=4s.

### Low ranks: 4k<=N+1

On positive adjacent support, the normalized coefficient cross-product of a summand at k and k-1 has sign s(N+1)-kR>=0. A newly appearing term is nonnegative. A positive term disappearing at k forces N-R=k-1-s with s<=k-1, hence N<=4k-4, contradicting 4k<=N+1. Summing gives Q[k]/c_k>=Q[k-1]/c_(k-1), and the analogous inequality at k-1 when k>=2.

The exact decomposition is

M_k(E)=(c_(k-1)Q[k]-c_kQ[k-1])+2(c_(k-1)Q[k-1]-c_kQ[k-2]).

For the second bracket one needs BOTH normalized rise and binomial log-concavity. Set Q[t]=c_t R_t. Then c_(k-1)^2 R_(k-1)>=c_k c_(k-2)R_(k-2), since R_(k-1)>=R_(k-2)>=0 and c_(k-1)^2>=c_k c_(k-2). At k1, Q[-1]=0 handles this bracket directly. Thus M_k(E)>=0, and positive U_i[k]C[k] yields S_i(k)>0. Normalized rise alone is not the complete second-bracket justification.

### Complementary ranks: 4k>N+1

Here N>=200 and k>N/4. Apply the previously formalized full finite-block coefficient/Jensen theorem DIRECTLY to U_i. Its block sizes are1, r_i-1, and the m-1 unmarked r_j; all are positive and sum N. The actual B_a coefficient exceeds choose(a,t) only at t1, by1. Combining the scalar excess2/(2a+1) with the actual hypergeometric marginal factor a gives the singleton exponent

g_a(N,k)=(2a/(2a+1)) choose(N-a,k-1)/choose(N,k).

Root and marked exponent contributions are nonnegative. For unmarked arities,

g_3/g_2=(15/14)(N-k-1)/(N-2)<=1,
g_4/g_3=(28/27)(N-k-2)/(N-3)<=1.

These comparisons reduce to15k>=N+13 and28k>=N+25, consequences of k>N/4 and N>=200. Also g_4(k+1)/g_4(k)=(k+1)(N-k-3)/(k(N-k))<=1. Thus the minimum is at K=floor((N+2)/2). For even N=2s,

g_4(N,K)=(2/9)(s+1)(s-2)(s-3)/(s(2s-1)(2s-3));

for odd N=2s+1 it is (2/9)(s+1)(s-2)/((2s+1)(2s-1)). The cleared numerators for comparison with1/20 are respectively4s^2(s-22)+13s+240 and4s^2-40s-71, positive for s>=100. Consequently

U_i[k]>=c_k exp((m-1)/20).

This uses the joint uniform labeled-subset theorem, not an independence assumption. Its family-specific factorization and exponent specialization require proof even though the abstract ingredient already has a formal award.

Let a=99/20 and t=(m-100)/20>=0. Exact Taylor values are E8(a)=2162945642595007/16384000000000>102 and E7(a)=88220922596671/716800000000>20. Nonnegative Taylor coefficients give exp(a+t)>=E8(a+t)>=E8(a)+tE7(a)>102+20t=m+2.

The monomial coefficient lists of (3+2z)B_a'-2aB_a for a1,2,3,4 are respectively(4),(5),(6,2,3),(7,6,12,4). The product rule yields (3+2z)C'-2(N+1)C>=0 coefficientwise. At k-1 this gives

C[k]/C[k-1]>=2(N+2-k)/(3k).

Put e=c_(k-1)>0, b=c_k/e=(N+1-k)/k and lambda=(h+1)/((k+1)(h-k+1)). Inversion reverses the positive ratio inequality; multiplication by -b reverses it again. Therefore

M_k(E)/(e C[k])>=1-(3/2)(N+1-k)/(N+2-k)>-1/2.

Meanwhile lambda>1/(k+1)>=2/(N+4), b>=N/(N+2), and

lambda U_i[k]/e>2N(m+2)/((N+4)(N+2))>=1/2.

The last inequality follows from 4N(m+2)-(N+4)(N+2)>=2N-8>0, using N<=4m. Adding and clearing positive denominators proves S_i(k)>0. This tail uses no ULC or main-product LR premise.

## From surplus to complete deletion minors

This is a separate argument. Use the existing enlarged-order ULC convolution result: G,B2,B3,B4 have ULC orders1,2,4,7 respectively, hence C has order h. These local orders and the convolution machinery were already in the accepted predecessor proof; they are not new discoveries. On the guarded positive support,

C[k]^2-C[k-1]C[k+1]>=lambda C[k]^2.

For a tip, the correct local ratio pair is (B_(r-1),B_r), NOT (F_r,B_r). Its coefficient ratios, including the supported terminal zero, are:

r2: (1,2/3,0); r3: (1,3/4,1/3,0); r4: (1,4/5,1/2,1/4,0).

They decrease. Convolution with the common positive-interval log-concave kernel G H_i preserves this LR order by the standard TP2/Cauchy–Binet argument, yielding U_i[k+1]C[k]<=U_i[k]C[k+1], with zero boundaries handled by cross-products. Hence

M_k(U_i)>=U_i[k]/C[k] * (C[k]^2-C[k-1]C[k+1])>=lambda U_i[k]C[k].

Thus M_k(A_i)>=S_i(k)/((k+1)(h-k+1))>0.

For the endpoint, the exact separate main-product determinant is

U_0[k]C[k+1]-U_0[k+1]C[k]=Q[k]^2-Q[k-1]Q[k+1]>=0.

The final sign follows from Q log-concavity. Also

U_0-U_i=z^2(L^(r_i-1)-1)H_i>=0

coefficientwise. This dominance transfers the surplus to U_0, while the SEPARATE determinant supplies its LR premise. Dominance by itself would not prove an LR comparison. Applying the same curvature argument yields M_k(A_0)>0.

Finally, because all comparisons have the SAME C and original r_i>0,

M_k(sum_i r_i A_i)=sum_i r_i M_k(A_i)>0.

No branchwise conclusion is inferred from a weighted sum; the individual statement was proved first.

## Downstream scope and remaining global problem

For selector applications the minor at k=p-1 concerns A[p]/A[p-1] against C[p-1]/C[p-2]. Actual eligibility supplies p-2>=x and the rank guard; the accepted first-descent ratio fact and C log-concavity supply the strict C ratio. These must be stated separately. First descent of P alone does not establish that every later P rank descends.

Full selection, selected MASS and selected exact-ratio payment already have accepted computer-assisted proofs at their own scopes. A new proof mechanism can support them without inventing duplicate keys or claiming they were previously open. A tail-only Lean theorem would not remove the finite prefix or formalize the downstream ULC/LR/selector composition. The arbitrary-tree lower-region aggregate, governed representation/transfer and Erdős993 remain separate open obligations.
