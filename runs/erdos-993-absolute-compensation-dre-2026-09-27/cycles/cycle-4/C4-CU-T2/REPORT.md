# C4-CU-T2 independent critique

## Scope and integrity

The packet requires disposition of `C4-T2-WEIGHTED-SHIFT-IMPLIES-ACTUAL-TIP-SELECTION` and `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR`. I read the common neutral dispatch members and those four additional packet members only. SHA-256 matched all 174 common-manifest files and all four packet files (178/178); details are in `input_hash_audit.json`. I copied the producer checker into this scratch before running it. Its exact output reproduced `weighted_deck_evidence.json` byte-semantically.

## Dispositions

**Weighted shifted deck inequality: proposed open.** For each profile, let `W=Σ_i r_i A_i` with original private-tip multiplicities. The claim is

`W[k+1] C[k-1] ≤ W[k] C[k]` for every integer-zero-extended coefficient rank `1≤k`, `2k≤N+2`.

The producer's eight exact profile checks replayed; my separate polynomial implementation checked guarded boundary and interior ranks and the conditional selector implication where eligible ranks exist. No guarded negative margin was found. The known individual-deletion failure `(a₂,a₃,a₄)=(38,0,1), k=77` is outside the guard (`154>82`), and its weighted margin is positive; this neither proves nor refutes the weighted guarded claim. There is no universal proof or guarded counterexample here. Pairwise individual comparisons would not suffice to prove a comparison for their weighted sum.

**Weighted shift implies strict tip selection: proposed retained, conditional on the weighted claim.** At an actual eligible `p`, `2p≤N+2` puts `k=p` in the proposed guard. The registered first-descent ratio result and log-concavity of `C` give

`0 < C[p]/C[p−1] ≤ C[x+1]/C[x] < 1`,

because `p≥x+2`, so the adjacent-ratio index `p` is at least `x+1`. Also `C[p−1]>0`; since the family is nonempty and each `A_i` contains `zL^N`, `W[p]>0` throughout the guarded eligible range. The signed margin is

`M_p = W[p]C[p] − W[p+1]C[p−1] ≥ 0`.

Dividing by the positive product `W[p]C[p−1]` preserves direction and yields

`W[p+1]/W[p] ≤ C[p]/C[p−1] < 1`,

hence `Δ_p W<0`. Since `Δ_p W=Σ_i r_i Δ_p A_i` and every `r_i>0`, at least one `Δ_p A_i<0`: the strict selector is evaluated at this same `p`. No endpoint selection follows or is needed. No inequality here is multiplied or divided by a negative factor; such an operation would reverse direction.

A useful further conditional consequence follows from the registered all-m actual-eligible branchwise bound `2T_i[j]≥3δD_j`. If `S=Σ_i r_i e_i`, strict selection gives `S≥2`; thus `A≥(3/2)SδD_j≥(S+e₀)δD_j=bδD_j`, since `e₀≤1`. This recovers selected MASS without proving endpoint selection or full selector saturation. It relies on the registered branchwise theorem, original multiplicities, actual rank and guards; it is not independent evidence for the weighted comparison.

The producer's short selector argument should cite the registered first-descent ratio-band result for the strict `C` ratio step. With that dependency made explicit, I find its inequality directions sound.

## Exact bounded checks

Run from this directory with `PYTHONDONTWRITEBYTECODE=1`:

- `python3 producer_weighted_deck_check.py` replays the producer diagnostic, including the literal 122-vertex tree DP cross-check.
- `python3 independent_selector_audit.py` checks the weighted integer margin at ranks `1`, an interior rank and `⌊(N+2)/2⌋` for eight fixed profiles, then checks actual eligible rows and strict tip selection when present.

For `(0,12,10)`, `N=76`, the eligible upper-boundary rank is `p=39` and actual first descent is `x=37`. Exact `M₃₉` is positive (`62778468357996969627082624456309850574508861696`); exact `Δ₃₉W` is negative (`−778404837947930362432344`), with 22 selected branches. The exact `C` ratios are `C[39]/C[38]=18363547454331897540797/19524879129101078194890 < C[38]/C[37]=26033172172134770926520/26246340325222555216909 < 1`. This is a boundary example, not a universal proof. The interior `k=19` margin on the same profile is `415536132856955714573021673042988819120 > 0`. All conclusions from these checks are bounded evidence only.

## Limitations

No coefficient-cone closure, injection, recurrence proof, covariance proof, or guarded counterexample was obtained for the universal weighted inequality. The implication to a selected tip is an all-parameter conditional lemma only if the universal weighted inequality is established. Neither finite success nor the existing computer-assisted primary settlement supplies that missing proof. No Lean build or formal award was attempted.
