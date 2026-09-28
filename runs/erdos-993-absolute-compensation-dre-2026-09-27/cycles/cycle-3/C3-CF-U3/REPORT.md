# C3-CF-U3 critique

## Dispatch and source integrity

Packet `C3-CF-U3` covers `C3-U3-CENTER-LAYER-EXPANSION` and `C3-U3-HOMOGENEOUS-LAYER-BOUND-EVIDENCE`. All 86 actual members of `manifests/C3-COMMON-DISPATCH.json`, all 3 members of `manifests/C3-TRANSPORT-CLARIFICATION.json`, all 3 members of `manifests/C3-CRITIQUE-TRANSPORT.json`, and all four packet-file hashes matched. The v4 runner contains both required clarification prompts (lines 13–14); those runner bytes match the critique transport manifest. The registry identifies `E993-PATH-STAR-ARITY-2-4-ALL-M-ACTUAL-ELIGIBLE-BRANCHWISE-THREE-HALVES-MASS` as OPEN. This critique makes no status change.

I copied the permitted producer script to `cycles/cycle-3/C3-CF-U3/producer_layer_probe.py` before replaying it. Its replay is in `producer_replay_summary.json`. The independent evaluator is `independent_layer_check.py`, and its exact output is `independent_layer_evidence.json`; replay with `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-3/C3-CF-U3/independent_layer_check.py`.

## Center-layer identity

For fixed branch `i`, write each other factor as `B_(r_h)=L^(r_h)+z`. Choosing the `z` term on exactly a subset `J` contributes `z^|J| L^(N-r_i-sum_(h in J) r_h)` to `H_i`. Since `G F_(r_i)=sum_(epsilon=0,1) sum_(s=0)^(r_i-2) g_epsilon z^epsilon L^s`, coefficient extraction gives

`T_i[j] = sum_(J subset [m]\\{i}) sum_(epsilon=0,1) sum_(s=0)^(r_i-2) g_epsilon binom(N-r_i-sum_(h in J)r_h+s, j-|J|-epsilon)`,

with `g_0=1`, `g_1=2`, and zero-extended binomials. Every summand is nonnegative, so restricting to `|J|<=d` proves `U_i^(d)[j]<=T_i[j]` for any `d>=0`. This is a valid informal algebraic proof independent of spread, selectors, and the aggregate. However, the producer probe does not implement the stated `F_r`: it sets its coefficient vector to `[1,...,1]`, which represents `1+z+...`, whereas `F_4=1+(1+z)+(1+z)^2=3+3z+z^2` and `G F_4=(3,9,7,2)`. Thus the identity survives, but the producer's reported coefficient evaluations do not follow from that script.

## Independent bounded recomputation and defect

The independent script uses the contract coefficient vector `(3,9,7,2)`, computes `x` as the least strict forward difference of `P` with zero extension, applies all three guards to every candidate `p`, and evaluates current-`p` strict flags on `A0` and `Ai`. It evaluates the layer formula by binomial terms and `T_i[j]` by the full `GF_4 H_i` convolution. For both homogeneous arity-4 profiles the actual descent and eligible rows agree with the producer: `(m,n,N,alpha,x)=(40,203,160,162,78)`, `p=80,81`; and `(150,753,600,602,292)`, `p=294,...,301`. All listed endpoint and branch flags equal 1. Original tip multiplicity is 4 per branch; the branch-local test uses `3 delta D_j`, not a substituted aggregate.

The coefficient bug changes the claimed m=40 depth-2 outcome. At `m=40,p=80,j=78`, the corrected exact signed margin `2U^(2)-3 delta D_j` is `722724455446538076746556482596023354496120951540` (positive), not the producer's negative value. At `p=81`, depth 2 is also positive. Corrected `T_i[j]` at `p=80` is `1276384236266955407404589199530667958725386358334`, differing from the producer's value. At `m=150`, depth 1 still fails at `p=294` (corrected signed margin `-1992434459804493133683449280663090648375832641894929314836922665540110908756585400518927572217382126526146373493172425976608303662576973971665397244302736714052884548170155154176656`) and depth 2 passes all eight eligible rows. These are bounded coefficient computations only; they do not prove the all-m local inequality, selected MASS, or exact-ratio payment. The source's stated truncation obstruction at m=150 is reproduced; the alleged m=40 depth-2 failure is not.

The producer's code-level mistake is exactly localized to its `F` construction (`F=[1]*(r-1)`). Replace it by polynomial coefficients of `sum_{h=0}^{r-2}(1+z)^h`; for r=4 use `[3,3,1]`. The producer's output must then be regenerated. The selector and descent calculations are not implicated by this factor error, and the algebraic truncation lemma itself remains valid.

## Dispositions and limits

The center-layer expansion is retained as an informal proof, with an implementation caveat. The homogeneous bounded-evidence claim is rejected as stated because it includes a false m=40 depth-2 failure caused by the factor-vector error. A separate corrected evidence claim records the independently recomputed outcomes. No realizable failure of the full local inequality or payment is found. Universal proof, finite exact evidence, and formal verification remain distinct; no Lean build or source edit was made. No background process remains.
