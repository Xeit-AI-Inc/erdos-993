# C1-LA1 (r31) — (L-S)_top template arithmetic: informal proof at statement level

Canonical run id: `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. Award group C1-LA1 (Cycle 1, Stage 7). Lean run root
`runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible`. Producer `c1-la1-formalizer-opus-20260928`.

**Model disclosure (two-part):** chartered Claude Opus 5.5 (effort high) on dispatch-record authority; runtime-reported model id
`claude-opus-5-5`.

**Governing text:** `cycles/cycle-1/stage6/SYNTHESIS.md`, `## Lean awards` → "### C1-LA1 (r31) — (L-S)_top template arithmetic"
(copied byte-identically to `SOURCE/C1-STAGE6-SYNTHESIS.md`).

## Attribution (on the face)

- allocation: r31 T1 (seat of origin), independently C-F2-U and C-F1-T;
- Residual: C-T1-F and C-T1-U, with C-F1-T, C-F2-T and C-F2-U;
- table shipped by C-T1-U and the T adjudicator;
- template method and certificate: r30, the Cycle 6 certificate method of record and its named seats as registered;
- mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run;
- Lean: the Stage 7 seat — formalizer `c1-la1-formalizer-opus-20260928` (Claude Opus 5.5).

## Fences and excluded conclusions (on the face)

- **Template level only.** This is NOT a flow on the literal network and makes NO (HALL) claim. The network bridge is S3, which is
  informal and not formalized here.
- One rank `p*`, the class only (`m ≥ 107`, `m ≡ 2 (mod 3)`). No optimality. The `θ*` law is never a hypothesis.
- **Excluded:** (H), (HALL), eligibility, any statement at other `m`, residues, ranks or `d`, and uniqueness or optimality of the
  allocation. No grade is asserted for any companion lemma.

## Statement

For `m : ℕ` with `107 ≤ m` and `m % 3 = 2`, put `K := (16m+1)/3` (exact, see N0), `L := 200m²+82m+5`, `D := L/3` (over ℚ).
`State8 := {(β,γ) : ℕ×ℕ // β+γ ≤ 8}`.

- `pb m (β,γ) := (25m/2 + B_pb(β,γ))/D`, `pc m (β,γ) := (25m/2 + B_pc(β,γ))/D`, where `B_pb`, `B_pc` are the 72 intercepts of the
  table of record (T adjudicator's `adj_alloc_out.json`, sha256 `7d635805…4b13`), entered literally.
  - The 36 `B_pb` cells are those with `β ≥ 1`, and the 36 `B_pc` cells those with `γ ≥ 1`. Every other cell is given intercept `0`.
  - Such a cell never enters `Out` or `In` with a nonzero weight: `Out` multiplies `pb` by `β` and `pc` by `γ`, and `In` reads
    `pb(β+1,·)` and `pc(·,γ+1)` only.
- `θ m := 288/L`, `σ m γ := c_γ·θ m`, with `c = (1/7,1/3,3/5,1,5/3,3,7/2)` for `γ = 1..7` and `c_γ := 0` otherwise.
- `Out m (β,γ) := β·pb + γ·pc + [β = 1 ∧ 1 ≤ γ]·σ(γ)`.
- `In m (β,γ) := (8−β−γ)·(pb(β+1,γ) + pc(β,γ+1))` for `β+γ ≤ 7`, and `0` at `β+γ = 8`. The factor `8−β−γ` is rational subtraction.
- `r1 m k := Σ_{i=0}^{min(7,k)} C(7,i)·C(8m−7, k−i)·2^{k−i}`, which is `[y^k](1+y)^7(1+2y)^{8m−7}`.

Conclusions:

- (i) `0 ≤ pb`, `0 ≤ pc` and `0 ≤ σ` on every state.
- (ii) For every `c : Fin m → State8`, `Σ_i (β_i+γ_i) = K` implies `1 ≤ Σ_i Out m (c i)`.
- (iii) For every `c`, `Σ_i (β_i+γ_i) = K − 1` implies `Σ_i In m (c i) ≤ 1`.
- (iv) `(8−γ)·σ m γ ≤ θ m·γ` for `γ = 1..7`.
- (v) `θ m ≤ 1 − r1 m K / r1 m (K − 1)`.

Here `K = p*−1` and `K−1 = p*−2`, so the right side of (v) is `1 − ρ_1`.

## DAG (the synthesis's informal DAG, closed; Lean names in brackets)

**N0. Class arithmetic.**
- `m % 3 = 2` gives `3 ∣ 16m+1`, so `3·K = 16m+1` in ℕ and `(K:ℚ) = (16m+1)/3` [`cb8_K_cast`].
- For (v), write `m = 3p+107` with `p : ℕ`. The witness is `p = (m−107)/3`, exact by `omega` from `107 ≤ m` and `m % 3 = 2`.
- Then `K = a+8` with `a := 16p+563`, `n := 8m−7 = 24p+849` and `n − a = 8p+286`.

**N1. The 45 `m`-free state inequalities.** Split `D·Out` and `D·In` into an `m`-part and an `m`-free constant.
- `D·Out(β,γ) = (25m/2)(β+γ) + C(β,γ)`, with `C := β·B_pb + γ·B_pc + [β=1 ∧ γ≥1]·96·c_γ` [`cb8Out_eq`, `cb8OutConst`].
  - This uses `θ = 288/L = 96/D`.
- `D·In(β,γ) = 25m(8−β−γ) + E(β,γ)`, with `E := (8−β−γ)(B_pb(β+1,γ)+B_pc(β,γ+1))` for `β+γ ≤ 7` and `0` at `β+γ = 8`
  [`cb8In_eq`, `cb8InConst`].
  - At `β+γ = 8`, both sides vanish because `(β:ℚ)+γ = 8`.
- On each of the 45 states, `C(s) ≥ 5n − 7/2` and `E(s) ≤ 24 − (5/2)n`, where `n = β+γ` [`cb8_state_out_const`,
  `cb8_state_in_const`].
  - These are 45 + 45 exact rational checks, each case proved by `norm_num`.
  - This is a finite case split over the fixed table, not an enumeration over assignments.
  - The slacks equal the table of record's `out_slack`/`in_slack`, which are the adjudicator's certificate (`adj_alloc.py`).
- Hence, for every state, with `D > 0` [`cb8Out_lb`, `cb8In_ub`]:
  - `Out ≥ ((25m/2+5)n − 7/2)/D`;
  - `In ≤ (25m(8−n) + 24 − (5/2)n)/D`.

**N2. Two aggregate polynomial identities.** These are identities in `m` once `K = (16m+1)/3` (by `field_simp`; `ring`):
- `(25m/2 + 5)·K − (7/2)·m = D`;
- `25m·(8m − (K−1)) + 24m − (5/2)(K−1) = D`.

**N3. Summation over any assignment** [`cb8_sum_out`, `cb8_sum_in`].
- Sum the affine per-state bounds of N1 over the `m` chokes with `Finset.sum_le_sum`.
- `Σ_i ((25m/2+5)n_i − 7/2) = (25m/2+5)·Σ n_i − (7/2)m = (25m/2+5)K − (7/2)m`, using `Finset.sum_sub_distrib`,
  `Finset.mul_sum`, `Finset.sum_const` and `card (Fin m) = m`.
- This holds for an arbitrary `c : Fin m → State8`. There is no enumeration over assignments.
- By N2, `Σ Out ≥ D/D = 1` and `Σ In ≤ D/D = 1`, which are (ii) and (iii).

**N4. Linear nonnegativity** [`cb8_state_intercept_lb`, `cb8CGamma_nonneg`, `cb8Theta_nonneg`].
- On every state, `B_pb, B_pc ≥ −50` (45-case check, minimum `−689/16`).
- So `25m/2 + B ≥ 25·107/2 − 50 > 0`, and `D > 0` [`cb8_L_pos`].
- `c_γ ≥ 0` and `θ ≥ 0`, so `σ ≥ 0`. This is (i).

**N5. Finite Switch.**
- For `γ = 1..7`, `(8−γ)c_γ ∈ {1, 2, 3, 4, 5, 6, 7/2} ≤ γ`.
- Multiply by `θ ≥ 0`. This is (iv); each of the 7 cases is proved.

**N6. The `Nat.choose` ratio lemma** [`cb8_choose_step`].
- `C(n,k+1)·(k+1) = C(n,k)·(n−k)` for `k < n` (Mathlib `Nat.choose_succ_right_eq`), cast to ℚ.
- The cast of `n − k` is audited by `Nat.cast_sub` under `k ≤ n`.
- Instantiated at `n = 24p+849` and `k = a+j`, `j = 0..7`, it gives `X_{j+1}(16p+564+j) = X_j(8p+286−j)`, where
  `X_j := C(n, a+j)`.
  - The side condition is `a+j < n`, by `omega`.

**N7. Normalizing `ρ_1`** [`cb8R1_expand_top`, `cb8R1_expand_sub`].
- Since `min 7 (a+8) = min 7 (a+7) = 7`, the sums have 8 terms.
- `a+8−i = a+(8−i)` and `a+7−i = a+(7−i)` for `i ≤ 8` (`omega`), so `2^{a+j} = 2^a·2^j`.
- `r1 m (a+8) = 2^a·S1` with `S1 = 2X_1+28X_2+168X_3+560X_4+1120X_5+1344X_6+896X_7+256X_8`.
- `r1 m (a+7) = 2^a·S0` with `S0 = X_0+14X_1+84X_2+280X_3+560X_4+672X_5+448X_6+128X_7`.
- The coefficients are `C(7,i)·2^{8−i}` and `C(7,i)·2^{7−i}`.
- Therefore `ρ_1 = S1/S0`, since `2^a ≠ 0`.

**N8. One shifted positivity certificate** [`cb8_residual_core`]. This is T's normalization, degree 9, shifted to `m = 107`,
i.e. `p = 0`.
- **Telescoping.** From N6, `X_j·Π_{s<j}(16p+564+s) = X_0·Π_{s<j}(8p+286−s)` for `j = 1..8` (`linear_combination`).
- **Clearing denominators.** Multiply by `Pd := Π_{s=0}^{7}(16p+564+s) > 0`:
  `((L−288)·S0 − L·S1)·Pd = X_0·Q(p)`, with `L = 1800p²+128646p+2298579` (this is `200m²+82m+5` at `m = 3p+107`).
- **The polynomial.** `Q(p) = Σ_{k=0}^{9} q_k p^k` has ALL coefficients positive:
  - `q_0 = 13736854315533908060107804800`
  - `q_1 = 3485757943832316875116853760`
  - `q_2 = 393116201147170279914011136`
  - `q_3 = 25861741787599751845613568`
  - `q_4 = 1093718124274605922197504`
  - `q_5 = 30836007270585567805440`
  - `q_6 = 579583454459211546624`
  - `q_7 = 7003008881186045952`
  - `q_8 = 49359024738533376`
  - `q_9 = 154618822656000`
- The identity is checked by Lean's `ring` inside `linear_combination`. The generator `DRAFTS/gen_residual.py` only produced the
  text and is not trusted.
- `X_0 = C(24p+849, 16p+563) > 0`, `p ≥ 0`, and `X_j ≥ 0`, so `S0 > 0` and `X_0·Q ≥ 0` (`positivity`).
- Hence `(L−288)·S0 − L·S1 ≥ 0`, i.e. `S1/S0 ≤ 1 − 288/L`, i.e. `θ ≤ 1 − ρ_1`. This is (v) [`cb8_sectorTemplate_residual`].
- The certificate agrees with C-T1-F's frozen instrument (`crit_t1f_residual.py`). Its recorded output
  (`crit_t1f_residual_out.json`) reports `deg_Q = 9` and all ten coefficients of `Q(107+t)` positive, where `t = m−107 = 3p`.
  Here the shift is `m = 3p+107`, which rescales the coefficients by the positive powers `3^k`.

**Composition** [`cb8_sectorTemplate_nonneg_out_in_switch` = (i)–(iv); terminal `cb8_topRank_sectorTemplate_feasible` =
(i)–(v)].

## ℕ-subtraction and cast audit

| Site | Expression | Why it is the true value |
|---|---|---|
| statement, (ii)/(v) | `(16*m+1)/3` (ℕ division) | `m % 3 = 2` ⇒ `3·((16m+1)/3) = 16m+1` (`omega`); cast to `(16m+1)/3 : ℚ` in `cb8_K_cast` |
| statement, (iii)/(v) | `(16*m+1)/3 - 1` (ℕ) | `K ≥ 571 ≥ 1`; cast via `Nat.cast_sub` in `cb8_sum_in`; in (v) rewritten to `a+7` by `omega` |
| `cb8R1` | `8 * m - 7` (ℕ) | `m ≥ 107`; rewritten to `24p+849` by `omega` |
| `cb8R1` | `k - i`, `i ∈ range (min 7 k + 1)` | `i ≤ min 7 k ≤ k`; at the two call sites `a+8−i`, `a+7−i` are rewritten by `omega` |
| N6 | `n - k` inside `Nat.choose_succ_right_eq` | `k < n` (`omega`); cast by `Nat.cast_sub` |
| `cb8In` | `8 - β - γ` | rational subtraction (no ℕ subtraction) |
| (iv) | `8 - γ` | rational subtraction |
| sums | `Σ_i (β_i+γ_i)` (ℕ) cast to ℚ | `Nat.cast_sum`/`push_cast` |
| (v) | `(r1 : ℚ) / (r1 : ℚ)` | the denominator `2^a·S0 > 0` (N8), so ℚ's `x/0 = 0` convention is never used |
| `pb`, `pc`, `θ` | division by `D`, `L` | `L = 200m²+82m+5 > 0` for every `m` |

## Tooling facts

- No `sorry`, `admit`, `native_decide`, `decide` or `axiom` appears in the source.
- The finite case splits (`interval_cases`) are over the 45 states and the 7 switch values of the fixed table, and each case is
  proved.
- No step over `m`, `p`, the assignment `c`, or the indices `a`, `j` is replaced by an enumeration.
