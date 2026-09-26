# Root candidate: elementary coefficient proof for every length3 spider

New root-origin alternative derived after the frozen Cycle6 search intake. Not yet independently adjudicated, not a worker result, and not a formal award. It removes even the symmetric-chain-decomposition lemma from the earlier root candidate. Scope and graph identities are those of C6-NONSTAR-SPIDER-SCD-CANDIDATE.md and C6-NONSTAR-SPIDER-GRAPH-BRIDGE.md: S_m, m>=2, P=Q^m+zV^m, Q=1+3z+z^2, V=1+2z, alpha=2m, leaf deletion A=VQ^(m-1)+z(1+z)V^(m-1), and each original marked difference q=zQ^(m-1). All coefficients are integer zero-extended at negative and excessive ranks; Delta_j f=f_(j+1)-f_j.

## 1. Weak unimodality of symmetric trinomial powers

Put C=1+z+z^2. For every d>=0, C^d is symmetric about rank d and Delta_t(C^d)>=0 for every integer t<d. Symmetry follows from reciprocal polynomials. For d0, the only coefficient is1; at t=-1 the difference is1 and at smaller t it is0. Induct from d to d+1. At t<=d-1, the identity
Delta_t(C^(d+1))=Delta_t(C^d)+Delta_(t-1)(C^d)+Delta_(t-2)(C^d)
has only nonnegative terms by induction. At t=d, symmetry gives Delta_d(C^d)=-Delta_(d-1)(C^d), so the first two terms cancel and the result is Delta_(d-2)(C^d)>=0. This also works at d0 using zero extension. Therefore the entire left half is weakly increasing, with no external theorem or finite census.

## 2. A quantitative early-rank bound

Since Q=C+2z, the binomial expansion gives
Q^m=sum_(s=0)^m binom(m,s) 2^s z^s C^(m-s).
For 0<=j<m every shifted difference Delta_(j-s)(C^(m-s)) is nonnegative by Step1, because j-s<m-s even when the rank is negative. If1<=j<=m-1, retain the single term s=j-1. Put d=m-j+1>=2. The first two positive-rank coefficients of C^d are d and d+binom(d,2), so Delta_1(C^d)=binom(d,2)>=1. Consequently
Delta_j(Q^m) >= binom(m,j-1)2^(j-1) binom(m-j+1,2) >= binom(m,j-1)2^(j-1).
Let b_j=[z^j](zV^m). For1<=j<=m-1 this last bound is exactly b_j. Therefore
Delta_j(P)=Delta_j(Q^m)+b_(j+1)-b_j >= b_(j+1)>0.
At j0, Delta_0(P)=3m>0. Hence x(S_m)>=m. This recovers the rank-injection conclusion by a completely elementary finite-sum inequality.

## 3. Strict unimodality of Q^e

The same expansion for e>=1 shows Delta_j(Q^e)>0 for0<=j<e: all shifted differences are nonnegative, and the term s=j+1 contributes binom(e,j+1)2^(j+1)Delta_(-1)(C^(e-j-1))>0. Q^e is symmetric about e, hence strictly decreasing from rank e through its terminal nonzero coefficient. This proof uses only Step1 and the expansion; no ULC convolution, real-rootedness, SCD or imported theorem is needed.

## 4. Eligible selectors and complete original sum

From x>=m and eligibility, m+2<=p<=floor(4m/3); thus any eligible m is at least6. Write e=m-1. Then e<p-2<=2e-1, so [z^(p-1)]Q^e-[z^(p-2)]Q^e<0. This is each original leaf term q_p-q_(p-1). The leaf-deletion perturbation z(1+z)V^e has degree m+1<p and contributes zero to Delta_p A. The main part satisfies Delta_p(VQ^e)=Delta_p Q^e+2Delta_(p-1)Q^e<0. Indeed p<=2m-1=2e+1: if p<=2e both differences are strictly negative; at p=2e+1 the first is0 and the second is-1. Thus every one of the m original leaves is strictly favorable, retaining each tag, and
S(S_m,p)=m([z^(p-1)]Q^e-[z^(p-2)]Q^e)<0.
For m2..5 there is no eligible rank by the same guards. No claim about m1's different leaf inventory is needed.

All steps are intended as universal algebraic/graph arguments; the separate literal replay through m6 corroborates them but is not their proof. Before any award, obtain independent opposing critiques and full origin adjudication/synthesis of this explicitly attributed root-origin candidate, with exact-identity registration distinct from T_m and from arbitrary-tree aggregation. The formulas and negative-rank conventions are key audit points. No additional DRE cycle is authorized.

## Additional exact-mode consequence to audit

For m>=2, Step3 gives Delta_j Q^m<0 for m<=j<=2m. At j=m the perturbation zV^m has difference 2^(m-1)(2-m)<=0; at j=m+1 its difference is-2^m<0, and afterward it is0. Thus Delta_j P<0 for m<=j<=2m. Together with Step2, P has a unique peak at rank m and x(S_m)=m exactly; the sequence is strictly increasing to m and strictly decreasing until its terminal zero. This is only a theorem about the equal length3-spider family. No novelty is asserted. It sharpens the eligible window to exactly m+2<=p<=floor(4m/3), nonempty iff m>=6. The already claimed aggregate conclusion uses only the weaker x>=m, so this stronger consequence is separable during review.
