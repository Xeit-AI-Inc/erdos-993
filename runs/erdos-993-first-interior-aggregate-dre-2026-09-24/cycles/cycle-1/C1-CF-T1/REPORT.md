# C1-CF-T1 — F critique of C1-T1

**Proposed disposition:** retain `C1-T1-LEAF-BRANCH-IDENTITY` at its stated exact-identity scope. It does not settle the primary sign claim. `novelty_claimed: false`.

## Independent proof audit

Let `v` be an original degree-one vertex with unique original neighbor `s`. In `T-v`, independent sets avoiding `s` are precisely independent sets of `H_v=T-{v,s}`. Those containing `s` have the form `{s}∪I`, where `I` is independent in `(T-v)-N_{T-v}[s] = T-N_T[s]=R_v`; the equality uses `v∈N_T[s]`. Hence `P_{T-v}=P_{H_v}+zP_{R_v}` coefficientwise. If `h_j=i_j(H_v)` and `r_j=i_j(R_v)`, with zero extension, then

`i_j(T-v)=h_j+r_{j-1}` and
`Delta_k(T-v)=(h_{k+1}-h_k)+(r_k-r_{k-1})=Delta_k(H_v)+Delta_{k-1}(R_v)`.

This is valid for every integer `k`, including negative and terminal ranks. The exact selector is therefore `A_v+B_v<0`, where `A_v=Delta_p(H_v)` and `B_v=Delta_{p-1}(R_v)`; the exact summand is `C_v-B_v`, where `C_v=Delta_{p-1}(H_v)`. Summing separately over each original leaf tag preserves the multiplicity at shared supports. No `p` shift, weak inequality, residual condition, or top-rank substitution is hidden in the derivation. The proof actually works for any finite simple graph with a pendant vertex, but I propose retaining only the incoming tree scope rather than creating a separate extension claim. This verifies the proof in C1-T1/REPORT.md (`cycles/cycle-1/C1-T1/REPORT.md`) directly, independently of its code.

## Falsification checks of the numerical support

I copied C1-T1/evidence.py (`cycles/cycle-1/C1-T1/evidence.py`), C1-T1/replay.py (`cycles/cycle-1/C1-T1/replay.py`), and C1-T1/ordinary_tree.py (`cycles/cycle-1/C1-T1/ordinary_tree.py`) into my assigned scratch directory before execution. The copied `evidence.py` reproduces C1-T1/EXACT-REPLAYS.json (`cycles/cycle-1/C1-T1/EXACT-REPLAYS.json`) byte for byte; copied `replay.py` checks the selector equality and total with the same DP. This is a **copied-code replay**, not independent verification: both paths reuse the same `ordinary_tree.py` evaluator. Its `first_strict_descent` omits the terminal zero-extended difference. Both tested examples have earlier descents, so the omission does not change their recorded `x`.

I separately derived closed-form independence polynomials from the graph descriptions and evaluated them with integer arithmetic in `independent_formula_check.py` (output `INDEPENDENT-FORMULA-RESULTS.json`). For `P_n`, `i_j(P_n)=binom(n-j+1,j)`. Thus `P60` has `alpha=30`, `x=17`, `p=28`; each end leaf has selector `Delta_28(P59)=-35495`, while `H=P58`, `R=P57` give `Delta_27(H)-Delta_27(R)=-165851`. Both original leaves are favorable and the complete sum is `-331702`.

For the described `T_m`, put `B=1+4z+3z²+z³`, `Q=1+3z+z²`. Conditioning on the root gives `P_T=(1+2z)B^m+z(1+z)^(3m+1)`. For the marked leaf, `P_{T-v}=(1+z)B^m+z(1+z)^(3m)`, `P_H=B^m+z(1+z)^(3m)`, and `P_R=B^m`. For any star-arm leaf, `P_{T-v}=(1+2z)QB^(m-1)+z(1+z)^(3m)`, `P_H=(1+z)^2(1+2z)B^(m-1)+z(1+z)^(3m)`, and `P_R=(1+2z)B^(m-1)`. These formulas preserve three separate tags at each of the `m` star supports. At `m=60`, they give `alpha=182`, `x=87`, `p=180`, selector `-359` and summand `-15930` for the marked leaf, selector `-181` and summand `-16287` for each of the 180 star-arm leaves. The complete sum is `-15930+180(-16287)=-2947590`. Both examples satisfy `x+2<=p`. The independent formulas agree with the reported integers and with the inherited construction at r24 direct favorable-leaf aggregate (`sources/public/experiments/r24-direct-favorable-leaf-aggregate.md`), whose historical `T60` row was at a different rank (`p=90`).

The branch identity itself supplies no inequality between the selector form `A_v+B_v` and contribution form `C_v-B_v`. Calling the identity a sign proof, transferring the historical positive `T60` summand at `p=90` to `p=180`, or treating the two negative complete sums as a universal result would be invalid. No such inference appears in the incoming claim. The inherited obstructions summarized in C1-COMMON-NEUTRAL.md (`packets/C1-COMMON-NEUTRAL.md`) concern additional sign or matching mechanisms; the identity does not assume them. The primary `S(T,alpha-2)<=0` remains OPEN.

Replay from the run root: `python3 scratchpad/C1-CF-T1/independent_formula_check.py`; for the copied source replay, `cd scratchpad/C1-CF-T1 && python3 evidence.py && python3 replay.py`. Checked numerical scope is exactly `P60` and `T60` at `alpha-2`; no exhaustive range or Lean run is claimed. All owned jobs have finished; no background jobs remain.
