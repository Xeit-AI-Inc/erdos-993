# INFORMAL-PROOF — C2-LA2 (r31): Darroch/Newton-free favorability at the closed-form level, both leaf classes

Canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`; Lean run `lean-2026-09-28-c2-la2-cb8-leaf-deletion-closed-forms-descent`;
award C2-LA2 (governing text: Cycle 2 synthesis `### C2-LA2`, `SOURCE/cycle-2-SYNTHESIS.md`). Written by the formalizer
`c2-la2-formalizer-opus-20260928`: chartered Claude Opus 5.5 (effort high, session-applied) on dispatch-record authority; runtime-reported
model id `claude-opus-5-5`. This is the formalizer's statement-level proof that the Lean text follows; it is not an independent audit.

## Statement (frozen)

For every natural number `m` with `107 ≤ m` and `m % 3 = 2`, writing `p* = (16m+4)/3`,
`G = (1+2X)^8 + X(1+X)^8`, `G_c = (1+2X)^7(1+X) + X(1+X)^7`, over `ℤ[X]`:

1. (arm leaf `v`) `[X^{p*+1}] P_v < [X^{p*}] P_v` for `P_v = (1+X)·G^m + X·(1+2X)^{8m}`;
2. (private leaf `c`) `[X^{p*+1}] P_c < [X^{p*}] P_c` for `P_c = (1+2X)·G_c·G^{m−1} + X(1+X)^2·(1+2X)^{8m−1}`.

These are the forward differences of record `Δ_p = i_{p+1} − i_p` at `p = p*` (synthesis R-1), applied to the closed forms of record of
`I(CB(8,m) − v)` and `I(CB(8,m) − c)` (r30 closed-form node; not proved here). The hypothesis `107 ≤ m` is unused (fence 1).

Lean terminal: `E993Transport.cb8_leafDeletion_closedForms_descent_topRank` (statement text byte-equal to the synthesis block apart
from the namespace-relative spelling of the name inside `namespace E993Transport`, and dedenting of the Markdown list indentation).

## Tool (carried, kernel-checked companion; no grade of its own)

(G) = C1-LA3 entry 17 `E993Transport.twoBinom_coeff_strictAnti_of_gap` (`b39cd787…589c`): for `a b t : ℕ` with `1 ≤ t`, `t ≤ a + b`,
`3a + 4b + 2 ≤ 6t`, `[X^{t+1}]((1+X)^a(1+2X)^b) < [X^t]((1+X)^a(1+2X)^b)`. Its proof (entries 2–16: recurrence, positivity,
log-concavity by factor induction, closing step) uses no Newton inequality and no Darroch mode theorem. Write
`margin := 6t − (3a + 4b + 2) ≥ 0` for the hypothesis slack.

## Arithmetic facts used throughout (ℕ-subtraction and division audit)

- A1. `m % 3 = 2` ⇒ `16m + 4 ≡ 36 ≡ 0 (mod 3)`, so the floor division `(16m+4)/3` is exact: `3p* = 16m + 4`, `6p* = 32m + 8`.
- A2. `m % 3 = 2` ⇒ `m ≥ 2`, so `m − 1` is a true value; write `m = n + 1` (`n ≥ 1`). `8m − 1 = 8n + 7` is a true value (`m ≥ 1`).
- A3. `p* = (16m+4)/3 > m`, indeed `p* − m = (13m+4)/3 ≥ 10`. Hence for every `j ≤ m`: `p* − j` is a true value, `p* − j ≥ 1`,
  and `p* + 1 − j = (p* − j) + 1`; the same for `p* − (k+1)` with `k ≤ n` (as `k + 1 ≤ m`), and for `p* − 1`.
- A4. In the binomial sums the indices satisfy `j ≤ m` (resp. `k ≤ n`), so `m − j` and `n − k` are true values.
- A5. `coeff (X^j · Q) d = if j ≤ d then coeff Q (d − j) else 0` (Mathlib `coeff_X_pow_mul'`); every use has `j ≤ d` by A3.
  `coeff (X · Q) (q+1) = coeff Q q` (`coeff_X_mul`).
- A6. Casts: the weights are `C((m.choose j : ℕ) : ℤ)`; `C` of a natural cast is the natural cast (`C_eq_natCast`); the arm weights
  are `> 0` (`Nat.choose_pos`, `j ≤ m`) and the private weights are `≥ 0` (cast of a natural number). No integer subtraction appears
  in any statement; all comparisons are between integers.
- A7. All `omega` side goals are linear arithmetic over ℕ with the literal divisor 3 and the hypothesis `m % 3 = 2`; `m, n, j, k, t,
  a, b, q` are variables throughout (no enumeration).

## DAG (statement-level; each node is a Lean declaration)

### Arm leaf (X-4)

- **N-A1 `cb8_armLeaf_blockExpansion` (block expansion, weights `C(m, j)`).** By the binomial theorem applied to
  `G = X(1+X)^8 + (1+2X)^8`,
  `(1+X)·G^m = Σ_{j=0}^{m} C(m,j) · X^j (1+X)^{8j+1} (1+2X)^{8(m−j)}`,
  using `(X(1+X)^8)^j = X^j (1+X)^{8j}` and `((1+2X)^8)^{m−j} = (1+2X)^{8(m−j)}`. Proved by `add_pow`, `pow_mul`, `ring`.
- **N-A2 `cb8_armLeaf_block_descent` ((G) on `V_j`).** For `j ≤ m`: `V_j = (1+X)^{8j+1}(1+2X)^{8(m−j)}` satisfies
  `[X^{p*−j+1}]V_j < [X^{p*−j}]V_j`. (G) with `a = 8j+1`, `b = 8(m−j)`, `t = p* − j`: `t ≥ 1` (A3); `t ≤ a + b = 8m + 1`;
  `3a + 4b + 2 = 32m − 8j + 5 ≤ 32m + 8 − 6j = 6t` (A1), margin `2j + 3`.
- **N-A3 `cb8_armLeaf_remainder_descent` ((G) on `R`).** `R = X(1+2X)^{8m}`: `[X^{p*+1}]R = [X^{p*}](1+2X)^{8m}` and
  `[X^{p*}]R = [X^{p*−1}](1+2X)^{8m}` (A5); (G) with `a = 0`, `b = 8m`, `t = p* − 1 ≥ 1`: `32m + 2 ≤ 6p* − 6 = 32m + 2`, margin 0.
- **N-A4 `cb8_armLeaf_closedForm_descent_topRank`.** `[X^{p*+1}]P_v − [X^{p*}]P_v = Σ_j C(m,j)·([X^{p*−j+1}]V_j − [X^{p*−j}]V_j)
  + ([X^{p*+1}]R − [X^{p*}]R)` by N-A1 and A5 (shift by `X^j`, `j ≤ p*`). Each summand is (positive weight) × (negative, N-A2); the
  sum is over the nonempty range `0..m`, so it is negative (`Finset.sum_lt_sum_of_nonempty`); the remainder is negative (N-A3).
  No exceptional block, no `M_0`.

### Private leaf (X-5), with `m = n + 1`

- **N-P1 `cb8_privateLeaf_blockExpansion` (block expansion, weights `C(m−1, k)`).** `(1+2X)·G_c = (1+X)(1+2X)^8 + X(1+X)^7(1+2X)`,
  so by the binomial theorem on `G^n`,
  `(1+2X)·G_c·G^n = Σ_{k=0}^{n} C(n,k)·(E0_k + E1_k)`, with
  `E0_k = X^k (1+X)^{8k+1}(1+2X)^{8(n−k)+8}` and `E1_k = X^{k+1}(1+X)^{8k+7}(1+2X)^{8(n−k)+1}`. Proved by `add_pow`, `pow_mul`, `ring`.
- **N-P2 `cb8_privateLeaf_regroup` (the regrouping `1+3X+X² = (1+X)² + X`).**
  `E0_0 + tail = (1+X)(1+2X)^{8n+8} + X(1+X)^2(1+2X)^{8n+7} = (1+X)(1+2X)^{8n+7}(1+3X+X²)
  = (1+X)^3(1+2X)^{8n+7} + X·(1+X)(1+2X)^{8n+7}`. A ring identity (`ring`).
- **N-P3 `cb8_privateLeaf_E0_block_descent` ((G) on `E0_k`).** For `k ≤ n`: `(1+X)^{8k+1}(1+2X)^{8(n−k)+8}` descends from
  `p* − k` to `p* − k + 1`. (G) with `a = 8k+1`, `b = 8(n−k)+8 = 8(m−k)`, `t = p* − k`: identical arithmetic to N-A2, margin `2k+3`.
  Used for `k ≥ 1` only (`k = 0` is absorbed by the regrouping).
- **N-P4 `cb8_privateLeaf_E1_block_descent` ((G) on `E1_k`).** For `k ≤ n`: `(1+X)^{8k+7}(1+2X)^{8(n−k)+1}` descends from
  `p* − (k+1)` to `p* − (k+1) + 1`. (G) with `a = 8k+7`, `b = 8(n−k)+1 = 8m − 8k − 7`, `t = p* − k − 1`: `t ≥ 1`, `t ≤ a + b = 8m`;
  `3a + 4b + 2 = 32m − 8k − 5 ≤ 32m + 2 − 6k = 6t`, margin `2k + 7`.
- **N-P5 `cb8_privateLeaf_regrouped_descent` ((G) on the two regrouped `Π` blocks).** `A = (1+X)^3(1+2X)^{8n+7}` at `t = p*`:
  `3·3 + 4(8m−1) + 2 = 32m + 7 ≤ 32m + 8` (`6t − (3a+4b) = 3`), `p* ≤ 8m + 2`. `B = X·(1+X)(1+2X)^{8n+7}`, shifted (A5) to
  `t = p* − 1`: `3 + 4(8m−1) + 2 = 32m + 1 ≤ 32m + 2` (`6t − (3a+4b) = 3`). Both strict, so the sum strictly descends.
- **N-P6 `cb8_privateLeaf_closedForm_descent_topRank`.** Rewrite `m − 1 = n`, `8m − 1 = 8n + 7` (A2). By N-P1 and
  `Σ_{k=0}^{n} = (k=0) + Σ_{k=0}^{n−1}(k+1)`,
  `P_c = Σ_{i<n} C(n,i+1)·E0_{i+1} + Σ_{k≤n} C(n,k)·E1_k + (E0_0 + tail)`.
  Differences at `p*`: the first two sums are `≤ 0` (nonnegative weights × negative block differences, N-P3 at `k = i+1 ≥ 1` and
  N-P4, shifted by A5); `E0_0 + tail` is strictly negative by N-P2 and N-P5. Hence `[X^{p*+1}]P_c < [X^{p*}]P_c` (`linarith`).

### Terminal

- **`cb8_leafDeletion_closedForms_descent_topRank`** = N-A4 ∧ N-P6, with `hm : 107 ≤ m` unused (fence 1).

## Fences

- A statement about closed-form polynomials over `ℤ[X]`, NOT about `cbGraph` (no `IsFavorableAt`, no `favorableLeaves`, no graph
  link); no status transfer to the favorability key's graph statement until C2-LA3 or U-C closes.
- One rank (`p*`, at the forward-difference index of record); `d = 8`; the class `m ≥ 107`, `m ≡ 2 (mod 3)`.
- Not Tier 2 progress: a dependency removal (the gate object `FAV_darroch_free`), not a new result.
- (G) and its entries 2–16 are kernel-checked companions with no grade of their own; no grade is asserted here for any companion.
- No Newton inequality, no Darroch mode theorem, no `M_0`, no finite certificate, no real-rootedness of any polynomial.

## Excluded conclusions

`IsFavorableAt (cbGraph m) w p*`; `favorableLeaves (cbGraph m) p* = leafSet`; (H); (HALL); conjunct 4; any rank other than `p*`; any
`d ≠ 8`; any residue class other than `m % 3 = 2`; any `m < 107`; any Tier 2 progress; any aggregate, TREE, FOREST, TRANSFER or
Erdős #993. The closed forms of record for `I(CB(8,m) − v)` and `I(CB(8,m) − c)` remain the r30 `proved_informal` node; this award
does not prove them.

## Repairs carried in (from the synthesis and adjudications)

- The index is `Δ_{p*}` (R-1); every `Δ_{p*−1}` claim (T2, F1, F3, C-F3-U) is struck and plays no role.
- T2's ascent tool (G′) is refuted and appears nowhere.
- The private-leaf route is C-F2-U's regrouping (synthesis R-2, divergence 2); the `Π` identities (C-T2-F, C-T2-U) and C-F2-T's
  tail ratio identity are independent informal routes for the second read, not used here.
- `107 ≤ m` added to the statement, unused (R-2; F adjudicator's recommendation).

## Attribution

Exactly the synthesis `### C2-LA2` list: T1 (seat, arm leaf); C-T1-F, C-T1-U (arm-leaf Lean); C-F2-U (both leaves, regrouping, Lean);
C-F2-T, C-T2-F, C-T2-U (independent private-leaf proofs); r30 (closed forms, pairing, favorability key); C1-LA3 (G). Plus the formalizer
`c2-la2-formalizer-opus-20260928` (Claude Opus 5.5). The Lean text re-authors C-F2-U's `CritFav.lean` (`1cf34606…65d0`, rebuilt by
the F adjudicator) and C-T1-U's `Crit.lean` (`9e400946…15f1`, rebuilt by the T adjudicator) as DRAFT specifications under attribution;
nothing from them is carried. The only carried text is C1-LA3 entries 1–17 (byte-identical).
