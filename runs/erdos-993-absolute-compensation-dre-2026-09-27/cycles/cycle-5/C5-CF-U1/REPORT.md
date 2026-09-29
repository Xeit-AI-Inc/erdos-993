# C5-CF-U1 critique report

## Scope and source integrity

I reviewed the two packet claims from C5-U1 and the exact definitions in the solution contract. All 237 members of `manifests/C5-COMMON-DISPATCH.json` and all five packet-specific files matched their listed SHA-256 hashes. The claim registry has no entry under either worker-local root-mixture ID. Its relevant neighboring identities remain distinct and OPEN: `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR` and `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR`. The root-mixture result below does not settle either one.

## Claim dispositions

### C5-U1-ELIGIBLE-ROOT-MIXTURE-MONOTONICITY — proposed retained (informal proof)

The argument is valid at its stated scope. Write `d[k]=binom(N+1,k-1)` with zero extension. The guards give `j=p-2 <= (N-2)/2` and `x<=j`. For every integer `0<=k<=j`,

`Delta_k d = binom(N+1,k)-binom(N+1,k-1) > 0`,

because the binomial coefficients are strictly rising below their midpoint; in particular this holds at `x` and `j`. Since `Delta_x P<0`, substitution of `P=C+d` gives `Delta_x C=Delta_x P-Delta_x d<0`. The coefficients of `G,B2,B3,B4` are respectively `[1,2]`, `[1,3,1]`, `[1,4,3,1]`, `[1,5,6,4,1]`: each has positive interval support and is log-concave. Convolution preserves these properties, so `C` has positive interval support and nonincreasing adjacent ratios. Thus `C[x+1]/C[x]<1` forces `Delta_j C<0` for every `j>=x` in support.

The decisive minor identity, with its direction checked after substitution, is

`d[j+1]C[j]-d[j]C[j+1] = (Delta_j d)C[j] - d[j](Delta_j C) > 0`.

Here `C[j]>0`, `Delta_j d>0`, `d[j]>=0`, and `Delta_j C<0`; the first product is strictly positive and the subtracted term is nonnegative after sign reversal. Also `C[j+1]>0`, so the odds `d[j]/C[j]` are defined. The mixture map is strictly increasing: for `0<=u<v`, `v/(1+v)-u/(1+u)=(v-u)/((1+u)(1+v))>0`. Therefore the stated mixture probability strictly increases. The first strict descent and both strict/nonstrict guards are preserved in this proof; the guard `3p<2alpha+1` is present in scope though unused in this lemma. This proves only the root-mixture statement, not a deletion comparison, current-p selector consequence, MASS, or payment.

Exact spot checks from independent integer arithmetic include profile `(a2,a3,a4)=(0,12,10)`, `N=76`, `n=101`, `alpha=78`, `x=37`. Its only eligible rank is the boundary `p=39`, `j=37`, with minor `213545270520198687231356881755419118232819740 > 0`. This is bounded corroboration, not the universal proof. No eligible interior rank arose in the checked profiles.

### C5-U1-UNRESTRICTED-ROOT-MIXTURE-COUNTEREXAMPLE — proposed retained (bounded evidence)

The exact unrestricted counterexample replays. For `(a2,a3,a4)=(10,0,0)`, `N=20`, `n=33`, `alpha=22`, the actual first strict descent is `x=11`. At `k=4`,

`(d[4],d[5],C[4],C[5])=(1330,5985,27315,125586)`,

and direct substitution gives `5985*27315 - 1330*125586 = -3549105`. With `p=k+2=6`, the current-p selector differences are `Delta_p A0=577440` and `Delta_p Ai=567414` for every represented arity-2 branch, so all corresponding strict flags are zero. The guards `3p<2alpha+1` and `2p<=alpha` hold, but `x+2<=p` fails (`13<=6` is false). This refutes all-rank/unrestricted root-mixture monotonicity only; it is not a guarded counterexample and does not dispose of the eligible-rank lemma.

## Independent replay and evidence grade

`producer_copy.py` is a byte-for-byte local copy of the allowed producer script, made before execution. It was run with `PYTHONDONTWRITEBYTECODE=1`; its output is retained in `replay_r2m10.json` and `replay_actual.json`. `independent_check.py` separately rebuilds `C` by exact convolution and `d` from binomial coefficients, computes the first strict descent, checks the signed-minor identity and sign hypotheses at every eligible rank in seven fixed profiles, and asserts the exact negative control and its strict selectors. Its output is `independent_check.out`.

Replay commands from this scratch directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 producer_copy.py 10 0 0
PYTHONDONTWRITEBYTECODE=1 python3 producer_copy.py 0 12 10
PYTHONDONTWRITEBYTECODE=1 python3 independent_check.py
```

The universal lemma has an informal proof as written above; neither independent finite replay nor the producer's sampled profile upgrades that grade. The unrestricted witness is exact bounded evidence. No source claim here changes the sealed status of the primary, selected MASS, or the OPEN shifted deletion comparisons.
