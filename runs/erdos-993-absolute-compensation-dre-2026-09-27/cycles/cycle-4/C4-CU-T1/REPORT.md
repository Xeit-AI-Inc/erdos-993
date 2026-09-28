# C4-CU-T1 critique

## Scope and integrity

I reviewed only the C4 common-dispatch inputs and the four producer files allowed by my packet. Independent SHA-256 verification matched all 174 common members, all four worker-dispatch members, and all four packet source hashes (182 checks; see `input_integrity.json`). I copied the producer replay to `shifted_lr_replay_independent.py` before running it. No Lean build or source edit was made.

The two registered shifted-comparison predicates remain distinct OPEN claims: individual deletion versus the original-multiplicity weighted tip deck. The six producer profiles are bounded diagnostics. I independently reconstructed coefficients from subset choices of powers of `L=1+z`, expanding each term with binomial coefficients; this avoids treating a list in powers of `L` as monomial coefficients in `z`. The full guarded individual comparisons and weighted comparisons had no failures in those profiles. Exact least strict descents and eligible ranks reproduced. This is bounded evidence only.

## Individual and weighted shifted comparisons

I find no guarded counterexample and no universal proof. Retain both source identities as OPEN, with the original scopes: for nonempty profiles `r_i in {2,3,4}`, `N=sum r_i`, `C=G product_i B_(r_i)`, `A0=LQ+zL^N`, `Ai=G B_(r_i-1)H_i+zL^N`, and zero-extended coefficients, the claims are respectively

- `A_v[k+1] C[k-1] <= A_v[k] C[k]` for every original endpoint or tip deletion `A_v`, and
- `W[k+1] C[k-1] <= W[k] C[k]`, where `W=sum_i r_i Ai` retains every original tip multiplicity,

for `1<=k` and `2k<=N+2`. These are all-profile guarded claims, not just claims at eligible ranks. They do not assume that `P` has no recovery after its actual least strict descent.

The binomial-summand obstruction is valid, but only against a term-by-term proof of the full comparison. For `(a2,a3,a4)=(0,22,0)`, `N=66`, `alpha=68`, actual first strict descent `x=32`, the common summand `E=zL^N` fails at guarded `k=27`:

```
E[27] = 1654284096099796392
E[28] = 2450791253481179840
C[27] = 116461439672085416832
C[26] = 78823085262292775712
E[27]C[27] - E[28]C[26]
  = -518620474811633289768751398606375936
```

The sign convention is margin `E[k]C[k]-E[k+1]C[k-1]`; a negative value violates the proposed `<=` comparison. The full deletion margin is positive at this interior rank (minimum over endpoint and tip types: `745097444696166793706461153834912453824`) and at the boundary `k=34` (minimum `3415643385409841308648469925255391780928`). Here actual eligibility is at `p=34`: `x+2=p`, `3p=102<137=2alpha+1`, and `2p=68=alpha`. The exact current-`p` selectors select the endpoint and all 66 original tip copies. Thus this component failure is not a failure of the full comparison or selector. It shows cancellation with the other summand is part of any proof; it does not preclude another decomposition or proof route.

The retained all-rank literal witness is also not a counterexample to either guarded identity: its `N=80`, `alpha=82`, `k=77` has `2k=154>82`. Its negative margin must not be used to reject the guarded claims.

## Conditional selector bridge

The `C4-T1-STRICT-SELECTOR-BRIDGE` is valid as a conditional informal proof. Let `rho_k=C[k]/C[k-1]`. Positive interval log-concavity of `C` makes `rho_k` nonincreasing. If `x` is the actual least strict descent of `P` and `Delta_x C<0`, then `rho_(x+1)<1`. At an actual eligible `p`, the guard `x+2<=p` gives `rho_p<=rho_(x+1)<1`; `2p<=N+2` places `k=p` in the shifted-comparison band. From

```
A_v[p+1] C[p-1] <= A_v[p] C[p]
```
we divide by positive `C[p-1]` and obtain `A_v[p+1]<=A_v[p]rho_p`. Since `A_v[p]>0`, multiplication by the positive `A_v[p]` preserves the strict inequality `A_v[p]rho_p<A_v[p]`, so `Delta_p A_v<0` and the strict selector at this current `p` equals 1. The `zL^N` summand makes every deletion coefficient positive for `1<=p<=N+1`; the eligibility guard implies this range since `N>=2`. No plateau is treated as descent, and no no-recovery premise is used.

The weighted version has the same bridge: `W[p]>0`, so its shifted comparison implies `Delta_p W<0`; because `W=sum_i r_i Ai` with `r_i>0`, at least one branch has `Delta_p Ai<0`. This does not select the endpoint or every tip. All multiplicities stay original. The relevant order divisions use positive coefficients; no inequality direction is reversed. Exact interior/boundary substitutions above check the comparison direction, and the six-profile replay checks actual eligible current-`p` selectors.

This conditional implication does not prove either all-profile shifted comparison. The extra reduction `Delta_x P<0 => Delta_x C<0` is valid in the actual lower-half setting where `p>=x+2` and `2p<=N+2`: the binomial summand `zL^(N+1)` is strictly rising at such `x`, so subtracting its positive forward difference from `Delta_x P<0` gives `Delta_x C<0`. The bridge may instead retain `Delta_x C<0` as an explicit hypothesis.

## Replay and limits

Run from this directory:

```
PYTHONDONTWRITEBYTECODE=1 python3 input_integrity.py > input_integrity.json
PYTHONDONTWRITEBYTECODE=1 python3 shifted_lr_replay_independent.py > shifted_lr_replay_independent.json
PYTHONDONTWRITEBYTECODE=1 python3 shifted_lr_independent_audit.py > shifted_lr_independent_audit.json
```

The producer copy independently replays its six profiles and literal-tree formula cross-check; my binomial-basis audit separately checks all guarded individual and weighted margins on those profiles, including the boundary ranks. These finite computations are not universal proof. No new actual eligible counterexample was found. No status beyond the proposed critique dispositions is asserted.
