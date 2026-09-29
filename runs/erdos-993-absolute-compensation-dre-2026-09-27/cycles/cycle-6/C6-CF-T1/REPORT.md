# C6-CF-T1 independent critique

## Disposition and scope

I retain `C6-T1-M100-ULC-EXACT-RATIO-TIP-SURPLUS` as an **informal universal proof** on exactly its stated tail: for every ordinary arity-2,3,4 path-star with `m>=100`, each represented tip branch `i`, and every integer `1<=k<=floor((N+2)/2)`,

`(h+1) U_i[k] C[k] + (k+1)(h-k+1) M_k(E) > 0`,

where `N=Σ_i r_i`, `h=1+2a2+4a3+7a4`, `C=G∏B_(r_i)`, `E=zL^N`, and `U_i=G B_(r_i-1)∏_(ell!=i)B_(r_ell)`, with integer monomial-z coefficients zero-extended. I found no invalid proof step or in-scope counterexample. The strict tail proof is narrower in profiles than the canonical all-`m` registered surplus and does not close its `m<100` cases.

This result has no actual-first-descent, eligibility, or selector premise. It therefore does not by itself establish any selected deletion, payment, MASS, endpoint, weighted deck, or individual comparison. In particular, it cannot remove the primary payment's least strict descent `x`, guards `x+2<=p`, `3p<2alpha+1`, `2p<=alpha`, same-current-`p` strict selectors, positive ratio guards, or original tip multiplicities. The separate endpoint bridge needs its main-product LR argument; coefficient dominance alone is insufficient. No family aggregate or Erdős993 consequence follows here.

## Independent proof audit

The proof covers all guarded ranks with the disjoint cases `4k<=N+1` and `4k>N+1`.

* **Low band.** For `Q=∏B_(r_i)=Σ_S z^sL^(N-R)`, the positive-support cross-product for the change of a term's coefficient normalized by `binom(N,k)` is `s(N+1)-kR`. Since `R<=4s`, it is nonnegative when `4k<=N+1`. A newly appearing term contributes nonnegatively. A disappearing positive term would require `N-R=k-1-s` and `s<=k-1`, hence `N<=3s+k-1<=4k-4`, contradicting `4k<=N+1`. Thus `Q[k]/binom(N,k)` is nondecreasing on this band. For `C=Q+2zQ`, the first curvature bracket follows from that rise. In the second bracket, writing `Q[t]=binom(N,t)R_t`, both `R_(k-1)>=R_(k-2)` and binomial log-concavity are needed; together they give `binom(N,k-1)^2 R_(k-1)-binom(N,k)binom(N,k-2)R_(k-2)>=0`. The source report supplies this needed comparison explicitly. At `k=1`, zero extension gives the second bracket directly. Hence `M_k(E)>=0`; `U_i[k]C[k]>0` on the relevant support, so the surplus is strictly positive.

* **Complementary band and Jensen specialization.** Here `N>=200` and `k>N/4`. All binomial denominators in `g_r=(2r/(2r+1)) binom(N-r,k-1)/binom(N,k)` are positive. The displayed ratios reduce to `N+13<=15k` and `N+25<=28k`, which follow from `k>N/4`, `N>=200`; thus `g2>=g3>=g4`. The quotient `g4(k+1)/g4(k)<=1` is equivalent to `4k>=N-3`, true in this band, so the minimum occurs at `K=floor((N+2)/2)`. Substitution at even `N=2s` gives the cleared difference `4s^2(s-22)+13s+240>0`; at odd `N=2s+1` it gives `4s^2-40s-71>0`. Both establish `g4(N,K)>=1/20` for `s>=100`.

  The full finite-block Jensen theorem applies to the factors of `U_i` at the same rank `k`: block sizes are `1`, `r_i-1`, and the unmarked `r_ell`, all positive and summing to `N`. The size-one marked block when `r_i=2` is valid; each monomial-z coefficient of `B_a=L^a+z` dominates `binom(a,t)`. The sole positive local surplus is at `t=1`, giving the stated `g_a` contribution; the root and marked contributions are nonnegative. There is no coefficient shift or independence assumption. The exact Taylor step is valid: for `a=99/20`, `t=(m-100)/20>=0`, `E_8(a+t)>=E_8(a)+tE_7(a)>102+20t=m+2`, while `exp(a+t)>E_8(a+t)`. The rational values match the source.

* **Deficit payment and signs.** In monomial powers of `z`, `(3+2z)B_a'-2aB_a` has coefficient lists `(4)`, `(5)`, `(6,2,3)`, `(7,6,12,4)` for `a=1,2,3,4` (trailing zeros omitted). The product rule therefore gives `(3+2z)C'-2(N+1)C>=0`; coefficient `k-1` yields `C[k]/C[k-1]>=2(N+2-k)/(3k)`. With `e=binom(N,k-1)>0` and `b=binom(N,k)/e>0`, this implies `M_k(E)/(eC[k])>=1-(3/2)(N+1-k)/(N+2-k)>-1/2`. Also `h>=N+1`, so all factors of `lambda=(h+1)/((k+1)(h-k+1))` are positive and `lambda>1/(k+1)>=2/(N+4)`. The guard gives `b>=(N)/(N+2)`. Since `U_i[k]>=binom(N,k)exp((m-1)/20)>binom(N,k)(m+2)`,

  `lambda U_i[k]/e > 2N(m+2)/((N+4)(N+2)) >= 1/2`.

  The last inequality is equivalent to `4N(m+2)>=(N+4)(N+2)`; its difference is `4Nm-N^2+2N-8>=2N-8>0` from `N<=4m`, `N>=200`. Adding the two strict half-bounds gives `lambda U_i[k]C[k]+M_k(E)>0`. Clearing by `(k+1)(h-k+1)>0` preserves order and gives the claimed integer surplus. No negative factor is used to preserve an inequality.

The common `runs/lean-2026-09-28-c4-jensen/SOURCE/EXPECTED-STATEMENT.txt` and `VERIFICATION-REPORT.md` match the needed contract and record `formally_verified` with the fidelity audit passed. Its scope is finite (possibly empty) block index, positive block sizes, truncated block polynomials, coefficient floors, and a same-rank `H[k]>=binom(M,k)exp(y)` conclusion for `k<=M`, including size-one blocks. Here the product has positive sizes summing to `N`, and all ranks used satisfy `k<=N`; the tail composition after that theorem remains an informal proof, not a Lean award.

## Independent finite checks and integrity

I wrote `independent_audit.py` and replayed it with `PYTHONDONTWRITEBYTECODE=1 python3 independent_audit.py`. Exact rational/monomial checks cover the `B_a` coefficient basis and operator arrays, low-band cross-products (19,411 cases), first complementary/interior/midpoint exponent values for `N=200,201`, both parity midpoint formulas, the Taylor constants, and final positive scalar clearing. These are diagnostics, not the universal proof. The copied authorized producer checks also replay with `PYTHONDONTWRITEBYTECODE=1 python3 producer_independent_tail_audit.py` and `PYTHONDONTWRITEBYTECODE=1 python3 producer_check_copy.py`; both report bounded arithmetic only.

`verify_hashes.py` checked all 275 members of `manifests/C6-COMMON-DISPATCH.json` and every one of this packet's six `allowed_source_files`; there were no mismatches. The packet SHA-256 is `0d6c49368d38e2882abf3f801b5e6f3ba21895452ab9b7b2a2849a761c816ed6`. Evidence and scripts are `cycles/cycle-6/C6-CF-T1/independent_audit.py`, `independent_evidence.json`, `verify_hashes.py`, `integrity_evidence.json`, `producer_independent_tail_audit.py`, `producer_independent_evidence.json`, `producer_check_copy.py`, `producer_check_source.json`, and `producer_dispatch_evidence.json`.

## Claim dispositions

* `C6-T1-M100-ULC-EXACT-RATIO-TIP-SURPLUS`: retain at the exact `m>=100` tail scope as `proposed_informal_proof`; no universal claim beyond the displayed domain.
* `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`: retain narrowed to this proved `m>=100` subcase. The canonical all-`m` claim remains OPEN because this report does not cover `m<100`; the mathematical grade is informal and no formal award is made.

No background process was started. No source was edited, no Lean build was run, and no external theorem beyond the admitted formal Jensen theorem was imported.
