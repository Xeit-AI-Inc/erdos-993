# C4-T1 independent critique (orientation F)

## Dispositions

Both assigned claims are **retained** at the exact conditional or finite-instance scopes stated below. Neither resolves the registered universal lower-region aggregate.

### C4-T1-CTx-SUFFICIENT-REDUCTION — retained

For each selected leaf tag, `q_v(j)=i_j(H_v)-i_j(R_v)` counts marked independent `j`-sets, hence is nonnegative. Let `Q=Σ_F q_v(k)`, `U=Σ_F q_v(k+1)`, and let `E` be the sum of actual addable vertices over marked independent `k`-sets, with `C` counting each marked `(k+1)`-set having at least two marks once per tag. Double counting pairs `(A,z)` where `A` is a marked independent `k`-set and `z` is addable gives `E=kU+C`: a singly marked upper set has `k` mark-preserving deletions, and a multiply marked one has `k+1`. The target sum is `S=U-Q`, so `kS=E-C-kQ`.

If `Q>0` and the proposed bridge `i_x(T)E≤(x+1)i_(x+1)(T)Q` holds, then `i_x(T)>i_(x+1)(T)` by the definition of first negative difference, and `k=p-1≥x+1`. Thus `E<(x+1)Q≤kQ`, giving `S≤0` since `C≥0`. If `Q=0`, all the nonnegative summands `q_v(k)` vanish. Any marked independent `(k+1)`-set has a mark-preserving `k`-subset (here `k≥1`), so `U=0` as well and `S=0`. This proves the stated conditional implication. The strict lower-region bound is not needed for this implication beyond the contract’s eligibility; the bridge itself remains an unproved universal premise.

### C4-T1-ORDER24-POSITIVE-MARKED-ADDABILITY-COVARIANCE — retained

The exact 23-edge graph was independently checked connected and acyclic. Its degree-one vertices are exactly `0,3,5,6,12,14,15,20,21,22,23`; the same-support tags remain separate. A rooted-forest independence-polynomial DP gives `alpha=15`, first negative difference `x=8`, and terminal zero-extended difference `Δ_15=-2`. At `p=10`, the guards hold (`x+2=p`, `30<31`), and every listed leaf has strictly negative `Δ_10(T-v)`, so the full favorable set is all 11 leaves. The independent DP reproduces every leaf selector value, every `q_v(9),q_v(10)`, every summand, and `S=-51095`.

For tag `v=0`, literal subset enumeration in `H` independently gives `i_9(H)=13677`, `i_10(H)=6026`, `q_0(9)=13232`, actual marked addability `E_0=58429`, and multiply marked rank-10 sets `C_0=4888`. The covariance numerator is

`E_0 i_9(H)-q_0(9)·10 i_10(H)=1,773,113>0`,

with denominator `13677²`. Therefore the submitted exact positive-covariance witness checks out. The source replay also reproduces its complete aggregate values (`Q=97144`, `U=46049`, `E=436389`, `C=21948`, `S=-51095`) and confirms `E=9U+C`. The example is not a counterexample to the target and does not disprove `CT_x`.

## Evidence and limitations

`replay_compute.py` is the allowed case computation copied into this scratch root and `replay_result.json` is its foreground replay output. `independent_audit.py` uses a separate rooted-tree polynomial recurrence and direct combinations for the `v=0` rank checks; its output is `independent_audit.json`. All deliverable evidence is inside this worker directory.

This audit establishes the conditional reduction and checks one exact finite witness. It does not establish `CT_x`, any universal covariance sign, a cross-tag compensation principle, or the primary aggregate for all eligible ordinary trees. No literature theorem or exhaustive tree census was used.
