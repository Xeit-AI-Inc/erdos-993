# C5-CF-T3 critique — exact-ratio tip surplus

## Disposition

**E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS: proposed_open.** I found no universal proof or guarded counterexample. The exact-ratio inequality remains an unproved sufficient condition. The case report's reduction from this condition to the full individual tip minor is valid; the tested crude ratio replacement is not a valid route to a universal proof because it is too weak. No status for the primary payment, selected MASS, or any aggregate follows.

The scope checked is the registered one: every nonempty ordinary arity-2/3/4 path-star, every represented original tip branch (i), and every integer (1\le k\) with (2k\le N+2). Here (h=1+2a_2+4a_3+7a_4), (C=G\prod B_{r_i}), (U_i=GB_{r_i-1}H_i), (E=z(1+z)^N), and (M_k(V)=V[k]C[k]-V[k+1]C[k-1]), with monomial coefficients zero-extended. There is no actual-eligibility premise in this claim.

## Proof audit

The sufficient-condition algebra is sound. Write (d=(k+1)(h-k+1)). Every local order contribution to (h) is at least its corresponding arity, so (h\ge N+1). On the guard, (k+1>0) and (h-k+1\ge N+2-k>0); thus (d>0). Also (C[k]>0) throughout this band.

Assuming the separately sourced ULC and main-product LR inequalities, the directions give
\[
U_i[k+1]\le U_i[k]\,C[k+1]/C[k],\qquad
C[k-1]C[k+1]/C[k]^2\le 1-\frac{h+1}{d}.
\]
All divisors are positive here. Multiplying the first bound by (C[k-1]\ge0), then applying the second, yields
\[
M_k(U_i)\ge \frac{h+1}{d}U_i[k]C[k].
\]
Since (A_i=U_i+E), (M_k(A_i)=M_k(U_i)+M_k(E)). Multiplying by positive (d) shows that the registered surplus inequality implies (M_k(A_i)\ge0). This is a valid conditional reduction; it does not establish the registered surplus premise for all profiles. At support boundaries, the same statements must be read by zero extension/cross multiplication rather than division by a zero coefficient; all ranks in the registered band have (C[k]>0).

The claim's coefficient convention is monomial in (z). I independently expanded (B_r=(1+z)^r+z): (B_2=(1,3,1)), (B_3=(1,4,3,1)), and (B_4=(1,5,6,4,1)). These match the scripts' basis. The (L=1+z) coefficient vector must not be treated as this monomial list.

The C2 floor (C[k]/C[k-1]\ge 2(N+2-k)/(3k)) has the right direction to give a lower bound on (M_k(E)): in (M_k(E)=E[k]C[k]-E[k+1]C[k-1]), increasing that ratio increases the normalized bracket. But this lower bound can be too negative to pay the ULC term. For ((a_2,a_3,a_4)=(0,0,4),N=16,h=29,k=8), the coarse signed margin is (-87{,}840), whereas the exact registered surplus is (45{,}380{,}234{,}160>0). This refutes the coarse sufficient substitute at that point, not the registered claim or the full tip minor. Here (x=9), so (x+2\le k) fails; this is a claim-band check only, not an actually eligible payment rank.

## Independent exact checks

The copied producer scripts replayed exactly: 1,770 profiles / 109,175 tip-rank instances through (m=20), plus 49 specified larger profiles / 15,024 instances, with no exact-surplus failures. The crude condition fails in the expected cases, including six actual-eligible instances in the specified larger set. These are bounded computations only.

My separate monomial-convolution checker and data are `independent_check.py` and `independent_check.json`. Exact checks include both ends of the guarded band for a one-branch arity-4 profile and the supplied negative-(E) control. In the latter, ((a_2,a_3,a_4)=(0,22,0),N=66,h=89,k=27), (M_k(E)=-518620474811633289768751398606375936), while the exact surplus is (783047390962129386096766512578362723639296>0). The rank is in this claim's guard but (x=32), so (x+2\le k) fails. This confirms that (M_k(E)\ge0) cannot be assumed, while leaving the proposed compensation inequality intact.

A larger check at ((0,0,24)) has (N=96,h=169,n=123,x=47,p=k=49,\alpha=98). It satisfies all actual rank guards: (x+2=49\le p), (3p=147<197=2\alpha+1), and (2p=98=\alpha). Direct strict selectors give (e_0=1) and (e_i=1) for each arity-4 branch (original tip multiplicity (24\cdot4=96)); their computed deletion forward differences are negative. This is still only one successful instance: the surplus is (416966184785614418980331915462512401919889476953795417377960>0), and the full tip minor is positive. No selector inference or multiplicity change is used in the all-guard surplus claim.

## Evidence integrity and limits

All 237 common-dispatch members and all eight packet-listed members matched their declared SHA-256 hashes. The packet's case inputs were used only after copying the two producer scripts into this scratch. The predecessor ULC convolution machinery and the main-product LR argument are source-dependent informal premises, not a new formal award here. The older (217(j+1)\epsilon<1) tail estimate has no established implication to this exact all-guard surplus. The endpoint (A_0), weighted deck, actual strict-selector payment, parent first descent theorem, and universal primary aggregate remain outside this claim's proof.

Replay from this directory:

- `PYTHONDONTWRITEBYTECODE=1 python3 copied/producer_surplus.py`
- `PYTHONDONTWRITEBYTECODE=1 python3 copied/producer_controls.py`
- `PYTHONDONTWRITEBYTECODE=1 python3 independent_check.py > independent_check.json`

All artifacts are bounded evidence; there is no Lean build or universal theorem claim in this critique.
