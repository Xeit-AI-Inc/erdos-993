# C3-LA1 — the E1 clone-level transport at the class and its ρ-links (informal proof of record)

Canonical run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`; Lean run `lean-2026-09-28-c3-la1-cb8-e1-clone-transport`;
producer `c3-la1-formalizer-opus-20260928`. Model disclosure (two parts): chartered Claude Opus 5.5, effort high, session-applied
(dispatch-record authority); runtime-reported model id `claude-opus-5-5`.

Governing text: `cycles/cycle-3/stage6/SYNTHESIS.md`, `## Lean awards` → `### C3-LA1` (copied byte-identically to
`SOURCE/cycle-3-SYNTHESIS.md`). This file follows that section's informal DAG (steps 1–9) at statement-level granularity. It
asserts no grade for any companion.

## Scope, fences and excluded conclusions (on the face)

- Clone level only. This is NOT a statement about `cbGraph m`, NOT the E1 flow on the literal network, NOT conjunct 4, NOT (HALL) at
  any scope, and NOT `S(T_m, p*) ≤ 0`.
- NOT progress on (L-S)_top or (ELIG-top)(a). Not a new identity: a new key would be an alias (SR-C2-2 finding 5). On closure the
  controller registers a formal scope-note clause (G-1) on the homogeneous criterion key at restricted scope. No key.
- One rank `p* = (16m+4)/3`, `d = 8`, the class `107 ≤ m`, `m ≡ 2 (mod 3)` only. No θ\* law. No Newton inequality, no Darroch mode
  theorem.
- Excluded conclusions: the E1 flow on `cbGraph m`, the graph lift, conjunct 4, (HALL), favorability; any rank other than `p*`,
  `m < 107`, `m ≢ 2 (mod 3)`, `d ≠ 8`; any optimality of the template.
- Repairs carried in: T1's truncated `N` is replaced by the guarded objects `e1S`/`e1T`; T2's "of record" label is narrowed (T2's
  text is DRAFT, re-authored); C1-LA3 entry 21 is not carried; U2's `cb8Rho_lt_one_topRank` is deduplicated (one ρ < 1 lemma,
  `cb8Rho_lt_one`).

## Attribution (on the face, verbatim from the synthesis section)

- T1 (Sonnet 5, seat `C3-T-01`): double counts, in-balance.
- T2 (seat `C3-T-02`): coefficient bridge, node (d), TP-g, zero-extended vocabulary.
- C-T1-F, C-T1-U (Opus 5.5 critics): node-(a) repair; rows, columns, `g_zero`.
- C-T2-F, C-T2-U: TP-h, nonnegativity, ρ₁ link.
- C-F3-T, C-F3-U: E-1 exact domain, boundary closures, per-target load.
- U2 (seat `C3-U-02`): the duplicate `ρ_q < 1`.
- The T adjudicator: T-A draft, degenerate-case instrument.
- The F adjudicator: G-F-A/G-F-B guard discipline.
- This synthesis: statement freeze, merged form, degenerate-case paragraph.
- r31 C2 T3 and critics (X-8/X-9).
- r30 (criterion key, CD-2, network; named seats as registered).
- Codex GPT-6's lower-region run (mechanism, weight, relation, (HALL)).
- Codex's heterogeneous-closure run (coefficient mechanisms, as C1-LA3's face cites them).
- The C1-LA1 and C1-LA3 formalizers.
- Lean text of this award: the formalizer `c3-la1-formalizer-opus-20260928` (Claude Opus 5.5).

## Objects

For natural numbers `a, b, j, α` (all coefficients over ℤ, all transport quantities over ℚ):

- `S_α := e1S a b j α = [α ≤ j]·C(a,α)·C(b,j−α)·2^(j−α)`, and `T_α := e1T a b j α = [α+1 ≤ j]·C(a,α)·C(b,j−1−α)·2^(j−1−α)`.
  Inside each guard the ℕ-subtraction is a true difference: `α ≤ j` gives `j − α`, and `α + 1 ≤ j` gives `j − 1 − α`. Outside the
  guard the value is `0`. This is the integer convention `C(b, negative) = 0` that T1's unguarded `N` lacked (C-T1-U's refutation
  at `(1,0,0,1)`).
- `ΣS := Σ_{α ≤ a} S_α`, `ΣT := Σ_{α ≤ a} T_α` (sums over `Finset.range (a+1)`), and `ρ := e1Rho a b j = ΣS / ΣT` (Lean's `x/0 = 0`
  is never used: `ΣT > 0` on the domain, step 2).
- Strict prefix sums `Sc(α) := Σ_{i<α} S_i` and `Tc(α) := Σ_{i<α} T_i`. `G_α := e1G = ρ·Tc(α) − Sc(α)` and `H_α := e1H = S_α − G_α`.
- `P_{a,b}(X) := (1+X)^a (1+2X)^b ∈ ℤ[X]` and `r(k) := [X^k] P_{a,b}`. `f(t) := [X^t](1+2X)^b = C(b,t)·2^t` for `t ≥ 0` and `0` for
  `t < 0`; in Lean this is `polyCoeffZ ((1+X)^0 (1+2X)^b)` (carried entry 1).
- Class instance: `a = 8q − 1`, `b = 8(m − q) + 1`, `j = p* − q` with `p* = (16m+4)/3`, `1 ≤ q ≤ m`.

## The statement (terminal `E993Transport.cb8_E1_cloneTransport_topRank`)

For `107 ≤ m` and `m % 3 = 2`:

1. `e1Rho 7 (8m−7) (p*−1) = cb8R1 m ((16m+1)/3) / cb8R1 m ((16m+1)/3 − 1)`, written in Lean as `e1Rho (8*1−1) (8*(m−1)+1) (p*−1)`;
2. for every `1 ≤ q ≤ m`, with the class instance `(a, b, j)`:
   - (2a) `ρ = r(j)/r(j−1)` (coefficients of `P_{a,b}` cast ℤ → ℚ);
   - (2b) `ρ < 1`;
   - (2c) the companion conjuncts at `(a, b, j)`: nonnegativity of every `G_α, H_α` (`α ≤ a`); in-balance `G_{α+1} + H_α = ρT_α`
     (`α < a`); top `H_a = ρT_a`; `G_0 = 0`; saturation `j ≤ a ⇒ G_j = S_j ∧ H_j = 0`; and the column identity for every `α ≤ a`
     with `T_α > 0`.

## ℕ-subtraction and cast audit (every occurrence in the terminal statement)

- `8 * 1 − 1 = 7` (true). `8 * (m − 1) + 1`: `m ≥ 107`, so `m − 1` is true and the value is `8m − 7`.
- `(16m + 4)/3`: `m ≡ 2 (mod 3)` gives `16m + 4 ≡ 0 (mod 3)`, so the floor is exact: `p*`, with `p* ≥ 572`. `(16m+1)/3`:
  `16m + 1 ≡ 0 (mod 3)`, exact, `= p* − 1`. Then `p* − 1`, `(16m+1)/3 − 1 = p* − 2` and `p* − q − 1` (`q ≤ m < p* − 1`) are all true.
- `8q − 1` (`q ≥ 1`) and `m − q` (`q ≤ m`) are true. `j = p* − q ≥ p* − m ≥ 2`, and `j ≤ a + b + 1 = 8m + 1`.
- Companion conjuncts: `a − α` occurs only in the branch `α < a`. `j − 1 − α`, `b − (j − 1 − α)` and `j − α` occur only under
  `0 < T_α`, which forces `α + 1 ≤ j` and `j − 1 − α ≤ b` (step 8). So `j − 1 − α` and `j − α ≥ 1` are true, and
  `b − (j − 1 − α)` is used only in the branch `j − 1 − α < b`, where it is true and positive.
- Casts: `ℕ → ℚ` (`Nat.cast`) for `cb8R1`, the clone counts and the column weights; `ℤ → ℚ` (`Int.cast`) for the coefficients.
  Every nonzero denominator actually divided by is proved positive (steps 2 and 8). No `x/0 = 0` junk value enters a used branch.

## The DAG (steps as in the synthesis)

**Step 1 — coefficient bridge** (`e1S_sum_eq_coeff`, `e1T_sum_eq_coeff`, `e1Rho_eq_coeff_ratio`; from T2's `rr_eq_coeff`,
`sum_Tterm`, `coeff_one_add_two_mul_X_pow`).
- `[X^k](1+2X)^b = C(b,k)·2^k`, by the binomial theorem.
- `r(j) = Σ_{i ≤ j} C(a,i)·C(b,j−i)·2^(j−i)`, by `coeff_mul` over the antidiagonal. Summing over `i ≤ j` and summing over `α ≤ a`
  of the guarded `S_α` agree, since the extra terms vanish: `C(a,i) = 0` for `i > a`, and the guard gives `0` for `α > j`. Hence
  `ΣS = r(j)`.
- For `1 ≤ j`, `T_α = e1S a b (j−1) α` (guard `α + 1 ≤ j ⇔ α ≤ j − 1`; `e1T_eq_e1S_pred`), so `ΣT = r(j−1)`.
- Hence `ρ = r(j)/r(j−1)` for `1 ≤ j` (the generic bridge, a companion). Conjunct (2a) is this bridge at the class instance.

**Step 2 — domain** (`e1T_sum_pos`). For `1 ≤ j ≤ a + b + 1`, `ΣT = r(j−1) > 0` by carried C1-LA3 entry 14 (`twoBinomCoeff_pos`,
positivity on `[0, a+b]`) at index `j − 1 ≤ a + b`. At the class instance, `1 ≤ j` and `j ≤ 8m + 1 = a + b + 1`.

**Step 3 — `ρ < 1`** (`cb8Rho_lt_one`; from T2's node (d), U2's duplicate deduplicated). Carried entry 20 (`cb8_E1_conditionI_topRank`)
gives `r(p*−q) < r(p*−q−1)` over ℤ. Entry 14 gives `r(p*−q−1) > 0`. So the ratio is `< 1` over ℚ, and by (2a) `ρ < 1`. `ρ < 1` is
reached through the explicit bridge to entry 20. It is never assumed.

**Step 4 — the `q = 1` link** (`cb8R1_eq_coeffQ`, `e1Rho_one_eq_cb8R1_ratio`; from T2's R-4 bridge and C-T2-F/C-T2-U's ρ₁ link).
- `cb8R1 m k = Σ_{i ≤ min(7,k)} C(7,i)·C(8m−7,k−i)·2^(k−i) = [X^k](1+X)^7(1+2X)^(8m−7)`, since `C(7,i) = 0` for `i > 7`.
- With `8·1 − 1 = 7`, `8(m−1)+1 = 8m−7` (`omega`, `1 ≤ m`), `p* − 1 = (16m+1)/3` and `p* − 1 − 1 = (16m+1)/3 − 1`, step 1 turns
  conjunct 1 into this bridge at `k = (16m+1)/3` and at `k − 1`.

**Step 5 — in-balance and top** (`e1_in_balance`, from T1's `in_balance`; `e1_top`).
- In-balance: `Sc(α+1) = Sc(α) + S_α` and `Tc(α+1) = Tc(α) + T_α`, so `G_{α+1} + H_α = ρTc(α+1) − Sc(α+1) + S_α − ρTc(α) + Sc(α)
  = ρT_α`, for every `α`. This is pure telescoping.
- Top: `H_a = S_a − ρTc(a) + Sc(a) = ΣS − ρ(ΣT − T_a) = ρT_a`, using `ρ·ΣT = ΣS` (`e1Rho_mul_sum_e1T`, valid since `ΣT ≠ 0`).
- Rows: `G_α + H_α = S_α` is definitional in the merged form (`e1_rows_identity`, from C-T1-U).

**Step 6 — `G_0 = 0` and saturation** (`e1_g_zero`, from C-T1-U; `e1_saturation`).
- `G_0 = ρ·0 − 0 = 0`.
- If `j ≤ a`: `T_i = 0` for `i ≥ j` and `S_i = 0` for `i > j`. So `Tc(j) = ΣT` and `Sc(j+1) = ΣS`, and
  `G_j = ρΣT − (ΣS − S_j) = S_j`, hence `H_j = S_j − G_j = 0`.

**Step 7 — absorption** (`e1_boolean_double_count`, `e1_ternary_double_count`; T1's double counts, re-proved over the guarded
objects, using only `α + 1 ≤ j`). Write `ℓ := j − 1 − α`, a true value.
- `(α+1)·S_{α+1} = (a−α)·T_α`, from `C(a,α+1)(α+1) = C(a,α)(a−α)` (`Nat.choose_succ_right_eq`), since `j − (α+1) = ℓ`.
- `(j−α)·S_α = 2(b−ℓ)·T_α`, from `C(b,ℓ+1)(ℓ+1) = C(b,ℓ)(b−ℓ)` and `2^(ℓ+1) = 2·2^ℓ`, since `j − α = ℓ + 1`.

Both identities hold in ℕ (both sides are `0` once `α ≥ a`, resp. `ℓ ≥ b`) and are cast to ℚ.

**Step 8 — columns** (`e1_column_inflow_clone`; from C-T1-U's `column_inflow_clone`, with the degenerate columns new).

Let `α ≤ a` with `T_α > 0`. Then the guard gives `α + 1 ≤ j`, and `C(b, ℓ) > 0` gives `ℓ ≤ b`.
- **Boolean term.** If `α < a`, the weight `(a−α)` is positive, and by step 7 `(α+1)S_{α+1} = (a−α)T_α`. So the term is
  `(a−α)G_{α+1}/((a−α)T_α) = G_{α+1}/T_α`. If `α = a`, the term is `0`.
- **Ternary term.** If `ℓ < b`, the weight `2(b−ℓ)` is positive, and by step 7 `(j−α)S_α = 2(b−ℓ)T_α`. So the term is
  `H_α/T_α`.
- **Degenerate column `ℓ = b`.** The term is `0`. Every `i < α` has `j − i > b + 1`, so `S_i = T_i = 0`, giving `Sc(α) = Tc(α) = 0`
  and `G_α = 0`. Also `j − α = b + 1 > b`, so `S_α = 0`, and `H_α = S_α − G_α = 0 = H_α/T_α`.
- **Sum.** In every case the two terms add to `(𝟙[α<a]·G_{α+1} + H_α)/T_α`. The numerator is `ρT_α`: by in-balance when `α < a`,
  and by the top when `α = a`. So the sum is `ρ`. At `α = a` with `ℓ = b` (which forces `j = a + b + 1`) this reads `0 + 0 = ρ`,
  consistent because `H_a = 0` and `H_a = ρT_a` with `T_a > 0` give `ρ = 0` (indeed `ΣS = r(a+b+1) = 0`). The proof never
  special-cases this: it goes through the same numerator identity.

The step-9 argument used here is the TP route (item (3) of the SR-C3-1 relay). LR-g and LR-h hold termwise at every index,
zero entries included, because entry 15 holds at every integer index of the zero-extended `f`. So the zero-case completion of
the pair-sum route (relay item (1)) and the product form for `H` (relay item (2)) are not needed; they are recorded as
concordant alternatives.

**Step 9 — nonnegativity** (`e1G_nonneg`, `e1H_nonneg`; the "alternatively, TP-g/TP-h from carried entry 15" route of the
synthesis, re-authored from T2's `likelihood_ratio`/`cb8_typePath_ii1` and C-T2-U/C-T2-F's `critic_likelihood_ratio_h`/
`critic_typePath_ii2`/`critF_cb8_typePath_ii2`). No Newton inequality and no Darroch.
- **Representation.** `S_α = C(a,α)·f(j−α)` and `T_α = C(a,α)·f(j−1−α)` at integer indices (`e1S_eq_polyCoeffZ`,
  `e1T_eq_polyCoeffZ`). The guard `α ≤ j` (resp. `α + 1 ≤ j`) is exactly nonnegativity of the integer index.
- **Minor inequalities from carried entry 15** (`twoBinomCoeffZ_strongLC`: `c(i−1)c(k+1) ≤ c(i)c(k)` for `i ≤ k`, at every integer
  index):
  - at `a = 0`, for `f`: with `i = j − y`, `k = j − 1 − x` and `x < y`, this gives `f(j−1−y)f(j−x) ≤ f(j−y)f(j−1−x)`. Multiplying
    by `C(a,x)C(a,y) ≥ 0` gives **LR-g**: `S_x T_y ≤ S_y T_x` (`e1_likelihood_ratio`).
  - at `b = 0`, for `C(a,·)`: with `i = x + 1`, `k = z` and `x + 1 ≤ z`, this gives `C(a,x)C(a,z+1) ≤ C(a,x+1)C(a,z)`. The
    `f`-factors of `S_{z+1}T_x` and `T_zS_{x+1}` coincide (`f(j−1−z)·f(j−1−x)`, both `≥ 0` by carried entry 13). So **LR-h**:
    `S_{z+1}T_x ≤ T_zS_{x+1}` (`e1_likelihood_ratio_h`).
- **`G_α ≥ 0`** (`α ≤ a`). Split `ΣS = Sc(α) + S_{[α,a]}` and `ΣT = Tc(α) + T_{[α,a]}`. Using `ρΣT = ΣS`,
  `ΣT·G_α = ΣS·Tc(α) − ΣT·Sc(α) = S_{[α,a]}·Tc(α) − T_{[α,a]}·Sc(α) = Σ_{y ∈ [α,a]} Σ_{x < α}(S_yT_x − T_yS_x) ≥ 0`, termwise by
  LR-g (`x < y`). Since `ΣT > 0`, `G_α ≥ 0`.
- **`H_α ≥ 0`** (`α ≤ a`). `ΣT·H_α = ΣT·Sc(α+1) − ΣS·Tc(α)`. Split `ΣS = Sc(α+1) + Σ_{k < a−α} S_{α+1+k}` and
  `ΣT = Tc(α) + Σ_{k < a+1−α} T_{α+k}`. Then `ΣT·H_α = (Σ_{k<a+1−α} T_{α+k})·Sc(α+1) − (Σ_{k<a−α} S_{α+1+k})·Tc(α)`, and:
  - `(Σ_{k<a−α} S_{α+1+k})·Tc(α) ≤ (Σ_{k<a−α} T_{α+k})·(Σ_{x<α} S_{x+1})`, termwise by LR-h with `z = α + k ≥ x + 1` (`x < α`);
  - this is `≤ (Σ_{k<a+1−α} T_{α+k})·Sc(α+1)`, by adding the nonnegative terms `T_a` and `S_0`.

  So `ΣT·H_α ≥ 0`, and since `ΣT > 0`, `H_α ≥ 0`.
- The zero-extension boundary (`α > j`, `α + 1 > j`, `j − α > b`) needs no case split: it lives in the integer index of `f`
  (`f(t) = 0` for `t < 0`, and `C(b,t) = 0` for `t > b`), and entry 15 holds at every integer index.

**Companion** (`e1_cloneTransport`, frozen text; registered as `lemma`). For `1 ≤ j ≤ a + b + 1`, steps 2, 5, 6, 8 and 9 give the six
conjuncts.

**Terminal assembly.** Conjunct 1 is step 4 (`1 ≤ m`). For `1 ≤ q ≤ m`: `j = p* − q ≥ 1`; (2a) is step 1; (2b) is step 3 through
(2a); (2c) substitutes `a, b, j` and applies the companion with `1 ≤ j` and `j ≤ 8m + 1 = a + b + 1` (`omega`).

## Hypotheses (exactly `107 ≤ m` and `m % 3 = 2`)

They are load-bearing through:
- entry 20, for `ρ < 1`;
- the domain `1 ≤ j = p* − q` (since `q ≤ m < p*`) and `j ≤ a + b + 1`, for `ΣT > 0`;
- `(16m+4)/3 − 1 = (16m+1)/3` in the first conjunct (quoted from the synthesis). Controller fact (SR-C3-1 relay, concordant; a fact,
  not evidence): this floor identity holds for EVERY `m`, and `8(m−1)+1 = 8m−7` needs only `1 ≤ m`. The Lean lemma
  `e1Rho_one_eq_cb8R1_ratio` accordingly assumes only `1 ≤ m`, and discharges both by `omega`.

No other hypothesis is introduced. The quantities `m`, `q`, `j`, `a`, `b`, `α` are variables: no step is replaced by an
enumeration, and no `decide`, `native_decide`, `sorry`, `admit` or `axiom` occurs.
