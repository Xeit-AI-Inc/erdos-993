# C6-CF-U1 critique of C6-U1

## Disposition

**C6-U1-TM-LEAN-DECOMPOSITION — retained_narrowed.** The proposed dependency decomposition is useful and stays within the specified homogeneous `T_m` theorem. Narrow the ULC item in the declaration graph to the actual normalization used by the candidate proof: Poisson-normalized ULC (`j a_j^2 ≥ (j+1)a_(j-1)a_(j+1)`) and its convolution closure, with nonnegative coefficients and interval support. “Finite-order ULC” by itself is underspecified and could be mistaken for binomial-normalized ULC; the pinned central-LC candidate explicitly notes that `B` fails binomial-normalized ULC of order 3 but satisfies Poisson ULC. This is a Lean interface precision issue, not a counterexample to the family theorem.

## Independent checks

- The case packet names only `C6-U1` and requires this one claim. All three case source hashes and all 237 common-manifest source hashes match their listed SHA-256 values.
- The proposed target is correctly limited to `T_m`, `m ≥ 1`, all eligible `p`, and the complete original-leaf selector sum. It does not claim the arbitrary-tree aggregate or a Lean award. The family status/grade it quotes agrees with the neutral handoff: computer-assisted proof, no family Lean certificate.
- The stated graph counts are internally consistent with the construction: order `4m+3`, independence number `3m+2`, one terminal path leaf and `3m` private leaves, hence `3m+1` distinct original-leaf tags. The formulas preserve the multiplier `3m` on the private-leaf orbit; no same-support tags are collapsed in the proposed final theorem.
- The direct first-descent alternative is arithmetically sound as stated. For `M=(1+2z)B^m`, `D=3m+1`, the coefficientwise factor inequalities imply `(j+1)M_(j+1) ≥ (2/3)(D-j)M_j`. For `m≥2` and `j≤m`, the ratio lower bound is minimized at `j=m` and is `(4m+2)/(3m+3)>1`. The perturbation `z(1+z)^(3m+1)` is increasing through those indices, so `Δ_j(P)>0` there and `x≥m+1`; it removes the need to depend on R27 for this family step. The stated `m=1,2` empty-eligibility checks also follow from the supplied `(x,α)` pairs `(2,5)` and `(4,8)`.
- From `α=3m+2`, the strict guard gives `p≤2m+1`. Eligibility gives `x≤p-2`; combined with the direct bound, the required propagation indices lie in the declared central interval. The proposed final graph-to-polynomial identity and strict selector propagation are correctly identified as necessary: central curvature or finite coefficient margins alone do not prove favorability or the complete tagged sum.
- The finite-base arithmetic count is consistent: `3 Σ_(m=3)^999 (m+3)=1,507,464` checks per margin type. It remains a Python base, not a kernel certificate. The route appropriately lists recurrence correctness and kernel checking as additional obligations rather than treating its digest as a proof.

## Precise correction and limits

The central-LC candidate uses **Poisson ULC**, including the quantitative implication `a_j²-a_(j-1)a_(j+1) ≥ a_j²/(j+1)`. The Lean plan should specify that normalization, zero extension, interval-support hypotheses, and convolution interface. It should not label this only “finite-order ULC,” especially since the source explicitly distinguishes Poisson ULC from binomial-normalized ULC. The plan's remaining graph/count fidelity, mixed-minor algebra and boundaries, large-parameter inequalities, exact finite-base checker, selector propagation, and final tagged-sum obligations are material and correctly prevent an award.

This review did not run Lean, replay the finite base, or independently prove the full `T_m` aggregate. Those are limitations of the review, not mathematical defects. I found no evidence here that the underlying family claim is false; the proposed decomposition is retained only as a formalization plan, with the ULC interface narrowed as above.
