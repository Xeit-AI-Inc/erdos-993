# C5-AU neutral adjudication

## Integrity and scope

I inspected precisely the three C5-U1/U2/U3 routes and their six CT/CF critics, including each REPORT.md and RETURN.json. The independent [audit](cycles/cycle-5/C5-AU/C5-AU-audit.py) checks SHA-256 against every actual byte named by the common dispatch (237 members) and this packet (49 files): no missing or mismatched member. It uses exact integer monomial coefficients, computes actual first strict descents with terminal zero extension, and keeps the original multiplicities. No producer script was executed. Replay from the eventual admitted directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 C5-AU-audit.py /Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27
```

The resulting [data](cycles/cycle-5/C5-AU/C5-AU-audit.json) records coefficients, guards, current-`p` selector differences, exact signed margins, and boundary/interior checks. I used the contract's `L=1+z`, `G=1+2z`, `B_r=L^r+z`, `C=G∏B_r`, `P=C+zL^(N+1)`, and `A_i=GB_(r_i-1)H_i+zL^N`. A basis cross-check expands `F_4=1+L+L²` to `(3,3,1)` and `GF_4` to `(3,9,7,2)` in powers of `z`; the local activity calculations also use the `z` basis. The registered exact-ratio payment is VERIFIED at computer-assisted/nonformal grade but has no governed formal award; the individual and original-weighted guarded shifted comparisons remain OPEN. None of the four adjudicated claims changes those identities.

## Claim dispositions and dependencies

| Claim ID | Disposition and grade | Dependencies and scope |
|---|---|---|
| `C5-U1-ELIGIBLE-ROOT-MIXTURE-MONOTONICITY` | **Retained**, universal informal proof | Actual first strict descent of `P`; binomial rise; log-concavity of `C`. The result concerns root mixture at each eligible `p`, with all three guards retained. No deletion or selected-payment implication. Both CT-U1 and CF-U1 restate this same claim; neither introduces a new claim ID. |
| `C5-U1-UNRESTRICTED-ROOT-MIXTURE-COUNTEREXAMPLE` | **Retained**, exact finite counterexample to an unrestricted shortcut | The `a₂=10` profile has `x=11`, while its negative minor is at `p=6`; first-descent eligibility fails. Both U1 critics correctly restrict the witness. |
| `C5-U2-ACTIVITY-LAYER-COEFFICIENTWISE-OBSTRUCTION` | **Retained**, universal exact algebra, nonformal | The negative `t` coefficient occurs for every homogeneous arity-4 `m≥3` at guarded `k=m+4`. This rejects coefficientwise positivity in that chosen activity basis only. CT-U2 and CF-U2 supply no distinct mathematical claim. U2's RETURN uses `proposed_rejected` to mean rejection of the positivity *method*; that status cannot be read as rejecting its true displayed obstruction. |
| `C5-U3-BRANCH-RECURRENCE-COEFFICIENT-OBSTRUCTION` | **Retained**, exact finite mechanism counterexample | Direct deck construction confirms the branch recurrence and negative correction at guarded `k=4`, with positive full weighted minor. CT-U3 and CF-U3 only restate this claim; they offer no universal invariant. |

### Root mixture: exact direction and extension

Write `d=zL^(N+1)` and `Δ_k f=f[k+1]−f[k]`. For `0≤k≤⌊(N+1)/2⌋`,

`Δ_k d=binom(N+1,k)−binom(N+1,k−1)>0`,

because the ratio of the first binomial to the second is `(N+2−k)/k>1` for `k>0`; at `k=0` the difference is `1`. If `x≤j≤⌊(N+1)/2⌋`, then `Δ_x C=Δ_x P−Δ_x d<0`: subtracting a positive quantity from the strict negative descent preserves strict negativity. In the `z` basis, `G=(1,2)`, `B₂=(1,3,1)`, `B₃=(1,4,3,1)`, and `B₄=(1,5,6,4,1)` are positive-interval log-concave sequences. Their convolution is log-concave with positive interval support (equivalently, convolution of their order-two Toeplitz minors is nonnegative). Thus `C[k+1]/C[k]` is nonincreasing, so `Δ_j C<0`. Substitution, with directions explicit, yields

`d[j+1]C[j]−d[j]C[j+1]=C[j]Δ_j d−d[j]Δ_j C>0`.

Here `C[j]>0` preserves the strict sign of `Δ_j d`; multiplication of `Δ_j C<0` by `−d[j]≤0` reverses its sign to a nonnegative contribution. Dividing by `C[j]C[j+1]>0` preserves order and gives increasing odds `d/C`; applying `u↦u/(1+u)` preserves order because its difference has positive denominator. The original eligible guards imply `x≤j=p−2≤(N−2)/2`, hence the source claim. The same proof gives the strictly broader **C5-AU-ROOT-MIXTURE-EXTENDED-BAND** lemma for every natural `j` with `x≤j≤⌊(N+1)/2⌋`, without requiring the two `p` rank guards. It remains a root-mixture lemma only. In the `(0,12,10)` profile, `N=76,x=37,j=38,p=40`, it gives minor `226392114664217074296074723522548726747489840>0`; `2p≤α` fails there. At the eligible boundary `p=39,j=37`, all guards hold and the minor is `213545270520198687231356881755419118232819740>0`. These replays check the boundary and adjacent interior; the algebra supplies universality.

The unrestricted negative control uses `(a₂,a₃,a₄)=(10,0,0)`, `n=33,N=20,α=22,x=11,p=6,j=4`. Its coefficients are `(d[4],d[5],C[4],C[5])=(1330,5985,27315,125586)` and the signed minor is `−3549105`. The current-`p` strict flags are `e₀=e_i=0`, since `Δ₆A₀=577440` and every represented `Δ₆A_i=567414`. The numerical guards hold, but `x+2=13>6`; it is not an eligible payment witness. The exact minor identity here has `Δ₄d=4655>0` and `Δ₄C=98271>0`, showing why the negative second term can dominate before actual descent.

### Activity basis: a negative layer with a positive sum

For `m≥3`, let `A_(i,t)=GB₃(L⁴+tz)^(m−1)+E`, `C_t=GB₄(L⁴+tz)^(m−1)`, `E=zL^(4m)`, and `k=m+4`. The `E` term has activity degree zero, so its product with `C_t` has degree at most `m−1<2m−3`. At degree `2m−3`, only layer pairs `(m−2,m−1)` and `(m−1,m−2)` remain. Their common positive binomial factor is `m−1`. Direct `z`-coefficient expansion gives the eight local values `(51,2,0,142,15,9,0,205)` in the displayed source order. The signed combination is `51·2+0·142−15·9−0·205=−33`; multiplication by `m−1>0` preserves the negative sign. The guard `2k≤N+2` becomes `2m+8≤4m+2`, equivalent after division by positive `2` to `m≥3`; equality occurs at `m=3`. Direct activity-layer expansion independently reproduces `−66` at `m=3` and `−99` at `m=4`.

At `m=3`, the full `t=1` minor is `+2076267`, so a negative layer does not give a negative aggregate. This profile has `n=18,N=12,α=14,x=7`; taking `p=k=7,j=5`, both numeric rank guards hold and current strict flags are `e₀=e_i=1` (`Δ₇A₀=−708`, `Δ₇A_i=−709`), but `x+2=9>7`. Thus neither the full guarded comparison nor actual selected payment is refuted.

### Branch recurrence: a negative summand with a positive full minor

With `U=∑_i r_i GB_(r_i−1)H_i`, `E=zL^N`, and `W=U+NE`, direct multiplication after appending arity `r` gives `C′=B_rC`, `U′=B_rU+rB_(r−1)C`, `E′=L^rE`, and `N′=N+r`. Substituting `U=W−NE` gives exactly

`W′=B_rW+rB_(r−1)C+(rL^r−Nz)E`.

The `−NzE` is required to retain all old original tip tags. For 150 old arity-2 branches, `N=300`; append `r=2`, giving 151 branches, `N′=302`, `n′=456`, `α′=304`. At guarded `k=4`, the correction coefficient is

`[z⁴](2L²−300z)zL³⁰⁰=2·binom(302,3)−300·binom(300,2)=9090200−13455000=−4364800`.

Both binomial terms are positive; subtracting the larger second term gives the negative sign. The new guard is `1≤4` and `8≤304`. Direct construction of the full original-weighted deck agrees coefficientwise with the recurrence, while its shifted minor is `+185586251584170562390`. At the lower guarded boundary `k=1`, correction `+2`; at interior `k=2`, `+304`; at upper guarded endpoint `k=152`, correction is negative and the full minor remains positive (exact values in data). For comparison only, taking `p=k=4,j=2` gives actual first descent `x=152`, current `Δ₄A₀=151254712840`, `Δ₄A_i=151254612565`, and hence all strict flags zero; `x+2≤p` fails. The example refutes the sign premise for the correction, not the registered weighted shifted comparison or primary payment.

## Limits

The root-mixture theorem and its extension are informal universal arguments, not Lean awards. The activity obstruction is an exact all-`m≥3` algebraic statement in one activity basis. The unrestricted root and recurrence examples are exact finite counterexamples to narrow proof premises. Finite positive full minors do not prove a universal shifted comparison; negative components do not establish a negative full minor. Neither a census-free structural payment proof nor a governed formal award is supplied here.
