# C5-CT-F1 independent critique

## Scope and integrity

I read the Cycle 5 common neutral materials and the exact C5-F1 packet sources, and checked SHA-256 for all 237 common-manifest members and all 6 packet-listed members. Every digest matched. No sibling case or unlisted source was used. I copied the producer script into this scratch directory before replaying it. Replays used exact Python integers and zero extension; no Lean build or source change was made.

Commands:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 F1_adversarial_replay.py
PYTHONDONTWRITEBYTECODE=1 python3 critique_check.py
```

The independent audit script `critique_check.py` constructs monomial coefficient arrays directly. In particular it confirms `G=(1,2)`, `B2=(1,3,1)`, `B3=(1,4,3,1)`, and `B4=(1,5,6,4,1)` in powers of `z`. It does not treat a coefficient list in powers of `L` as a monomial list. Exact output is retained in `critique_check.json`.

## Required-claim dispositions

- **C5-F1-MIXED-MINOR-SHORTCUT-CONTROLS — proposed_bounded_evidence.** All three controls reproduce exactly. At counts `(0,22,0)`, `N=66`, `n=91`, `alpha=68`, first strict descent `x=32`, and actual eligible `p=34`, the current-p strict selectors are `e0=e3=1`. The original tag multiplicities are 1 endpoint and 66 arity-3 tips. At guarded `k=27`, the E-only minor is `-518620474811633289768751398606375936`, while the full endpoint and tip minors are `745097444696166793706461153834912453824` and `777419068009671422357461955841645743808`. Thus the negative E-only term cannot be separately required nonnegative; it does not refute either full deletion comparison.

  At counts `(0,0,3)`, `N=12`, `n=18`, guarded `k=7`, the activity-layer margins are `(1898616,171542,6175,-66,0)` and sum to the direct full-tip margin `2076267`. The negative layer coefficient does not imply a negative value at activity one. At counts `(38,0,1)`, `N=80`, `n=122`, `x=41`, `k=77`, the full tip minor is `-49239834336`, but `2k=154>N+2=82`; it is not a guarded counterexample. These controls are finite mechanism evidence only.

- **C5-F1-WEIGHTED-GUARDED-SHIFTED-BOUNDED-CHECK — proposed_bounded_evidence.** My separately written polynomial construction reproduces the full claimed scan: 1,770 profiles, all `1<=k<=floor((N+2)/2)`, 41,205 guarded profile-rank tests, no negative margins, and minimum margin `38` at counts `(1,0,0)`, `N=2`, `k=1`. For each arity class the script forms `n_r*r*A_r`, so it preserves each original tip's multiplicity. There is no first-descent or selector premise in this shifted-comparison claim, and none is inferred from the scan. This is bounded evidence, not a universal result.

- **E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS — proposed_open.** The exact sufficient condition and its stated scope are correctly distinguished from the registered full tip comparison: it covers represented tips on the entire guard without eligibility, but not endpoint `A0`. I found no guarded failure and no proof of the all-profile surplus. The conclusion stays OPEN.

## Algebraic audit and valid implication

Write

```text
M_k(V) = V[k] C[k] - V[k+1] C[k-1]
g        = (k+1)(h-k+1)
lambda   = (h+1)/g.
```

On the guarded band, `h=1+2a2+4a3+7a4 >= N+1`, `k<=floor((N+2)/2)`, and `k>=1`; hence `g>0`. Also `C[k]>0` on this support. The main-product argument gives `U_i[k+1]/C[k+1] <= U_i[k]/C[k]`; enlarged-order ULC gives `C[k+1]C[k-1]/C[k]^2 <= k(h-k)/g`. Multiplying these inequalities by positive denominators preserves their directions, and

```text
M_k(U_i) >= (1 - k(h-k)/g) U_i[k]C[k]
          = (h+1)/g * U_i[k]C[k].
```

Since `A_i=U_i+E`, `M_k(A_i)=M_k(U_i)+M_k(E)`. Thus the proposed surplus is exactly `g` times the lower bound for `M_k(A_i)`. The factor `g` is positive, so nonnegative surplus implies the full tip minor is nonnegative. No negative factor is divided out and no direction reverses. The implication is sound, conditional on the cited main-product LR and enlarged-order ULC premises. Those premises do not establish the unproved surplus itself.

The first-descent implication is separate: strict `Delta_x P<0` and a rising binomial parent term imply `Delta_x C<0`; log-concavity of `C` then makes its adjacent coefficient ratios decrease, giving the stated `0<C[j+1]/C[j]<1` at the relevant ranks. This is not needed for the guarded shifted comparison or the surplus condition and must not be used to add an eligibility restriction to either. No parent log-concavity or no-recovery premise is used here.

Exact boundary/interior spot checks in `critique_check.json` include one arity-2 branch at `N=2`, both `k=1` and the boundary `k=2`: `(h,g,M_U,M_E,surplus,M(A_i))` are `(3,6,16,3,98,19)` and `(3,6,28,9,166,37)`. For one arity-4 branch at boundary `N=4,k=3`, the corresponding values are `(8,24,80,32,1776,112)`. These check the displayed formula and signs at the guard edge; they are not general proof.

## Conclusion and limits

The producer's proposed exact-ratio reduction is a valid sufficient route, and the reported bounded controls survive independent exact replay. The isolated-E and activity-layer failures reject those shortcut premises only. The weighted scan and spot checks establish no universal theorem. I found no new exact guarded counterexample, no repair that closes the universal surplus, and no consequence that removes the existing `217(j+1)epsilon<1` tail condition. The open surplus remains a tip-only condition and cannot certify the endpoint or the selected aggregate without additional arguments.
