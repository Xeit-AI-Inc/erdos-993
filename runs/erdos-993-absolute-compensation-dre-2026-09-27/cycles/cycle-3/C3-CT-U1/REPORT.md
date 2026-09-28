# C3-CT-U1 critique report

## Scope and source integrity

I reviewed all three packet claims for C3-U1. The packet’s four source files match their pinned SHA-256 values. All 86 members of `manifests/C3-COMMON-DISPATCH.json`, all three members each of `C3-TRANSPORT-CLARIFICATION.json` and `C3-CRITIQUE-TRANSPORT.json`, and the packet files match their manifests. I used the targeted registered identity entry for `E993-PATH-STAR-ARITY-2-4-PROFILE-SENSITIVE-STRICT-DESCENT-RANK` and the shared `sources/cycle3/C3-profile-sensitive-rank-candidate.md`, as authorized by the source clarifications. Producer scripts were copied into this scratch before execution.

## Universal rank candidate: proof found in the shared candidate

The returned U1 report leaves the registered inequality open because its proposed operator
`E=(1+z)P'-(N+2)P` has no usable nonnegative-coefficient cone. The separately shared profile-sensitive candidate uses a different operator and supplies a valid all-profile proof. Thus the weaker-cone failure does not leave the rank candidate open.

For clarity, write `D_d(f)=(5+4z)f'-4df`, with additive weight `d`. The product rule gives `D_{d+e}(fg)=D_d(f)g+fD_e(g)`. With `L=1+z` and `B_r=L^r+z`, direct expansion gives

* `D_1(G)=6` for `G=1+2z`;
* `D_2(B_2)=7-2z`, `D_3(B_3)=8-2z+3z^2`, and `D_4(B_4)=9+12z^2+4z^3`.

Let `h=(2/3)a2+(1/2)a3`. In `C=G product_i B_(r_i)`, the total additive weight is `q=N+1`. The negative `-2z` term from either arity 2 or 3 is compensated by its share of `hC`: `(2/3)B_2 >= 2z` and `(1/2)B_3 >= 2z` coefficientwise. Arity 4 has no negative coefficient. Consequently `D_q(C)+hC` is coefficientwise nonnegative. For the remaining parent term, direct differentiation gives

`D_q(zL^q)=(5+4z)L^q+qzL^(q-1)`,

also coefficientwise nonnegative. Hence `D_q(P)+hP >= 0` coefficientwise for every profile.

At a strict descent `k`, nonnegative coefficients of `P` imply `P[k]>0` and `P[k+1]<P[k]`. The coefficient at `k` of this last differential inequality is

`0 <= 5(k+1)P[k+1] - 4(q-k)P[k] + hP[k]`

and is strictly less than `(9k+5-4q+h)P[k]`. Therefore `9k+1-4N+h>0`. Since this is an integer after multiplication by 6, it yields exactly `54k >= 24N-4a2-3a3-5`. Maximizing `h` at fixed `(m,N)` minimizes `a2` subject to `2a2+a3=4m-N`; this gives `a2>=max(0,3m-N)`, hence `h<=2m-N/2` for `N>=3m` and `h<=m-N/6` for `N<=3m`. This proves the stated count-relaxed corollary too.

The proof applies to every strict descent of the actual integer-zero-extended parent, including its terminal descent and therefore the actual least strict descent `x`. It does not establish any deletion selector, selected mass, or payment. No `p`-rank guards or selector flags occur in this parent-only claim; no consequence for the primary payment claim is inferred.

## Differential identity and its limitation

The returned identity for `E=(1+z)P'-(N+2)P` is correct by product differentiation and coefficient extraction. Its proposed sign-cone strengthening is false. At `(a2,a3,a4)=(0,0,2)`, `N=8`, `k=3`, `P[3]=178`, `P[4]=298`, so `Delta_3 P=120>0` while `[z^3]E=-54`; the rank inequality’s slack is `54*3-(24*8-5)=-25`. This is a non-descent rank where the target lower bound fails, not a counterexample to the theorem. The alternate `D_q` proof above has a distinct coefficient inequality and is unaffected.

## Bounded computation

I independently rebuilt the factors from binomial rows and exact integer convolution in `independent_review.py`; it scans every count triple through `m=45`, every zero-extended rank, and the coefficient of `D_q(P)+hP`. Replay:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_review.py 45
```

It finds 17,295 profiles, 938,431 strict descents, no rank violation, and minimum slack 44 at `(a2,a3,a4,N,k,Delta_kP)=(0,1,0,3,2,-2)`. The copied producer scripts also replay as follows:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 profile_rank_audit.py 45
PYTHONDONTWRITEBYTECODE=1 python3 differential_cone_audit.py 25
```

They report the same profile scan and the weaker-cone obstruction. The finite scan is corroboration only; the universal result rests on the coefficientwise argument above, not extrapolation from the scan.

## Proposed dispositions

* `E993-PATH-STAR-ARITY-2-4-PROFILE-SENSITIVE-STRICT-DESCENT-RANK`: retain at the exact all-profile scope by the informal universal proof above; no Lean award is claimed.
* `C3-U1-DIFFERENTIAL-IDENTITY`: retain the identity; reject only its stronger coefficientwise nonnegativity test, at the exact counterexample stated above.
* `C3-U1-BOUNDED-RANK-SCAN`: retain as exact bounded evidence through 45 branches.

The all-profile proof remains informal, not formal verification. Its conclusion is only the parent-rank inequality and its count-relaxed corollary.
