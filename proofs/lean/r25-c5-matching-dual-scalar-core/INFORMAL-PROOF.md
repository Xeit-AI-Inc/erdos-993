# Informal proof — `ErdosR25.E1ArithmeticCore.matchingDual_scalarCore_award`

Award group `C5-LA1` (`E993-R25-MATCHING-DUAL-SCALAR-CORE`), Cycle 5 Stage 7,
run `erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`. Formalizer
seat: Claude Sonnet 5 (chartered effort `xhigh`; the Agent transport exposes
no effort parameter and this seat cannot self-inspect its runtime model/effort
— stated on dispatch-record authority). Governed run root
`runs/lean-2026-09-22-c5-matching-dual-scalar-core`.

This is a **faithful governed transcription** of already kernel-checked
material. The unformalised mathematical work is nil: every fragment below was
proved, built, and axiom-checked before this session, in the digest-bound
seat file `scratchpad/c5-U1/LeanProject/LeanProof/Main.lean` and the two
digest-bound critic files `scratchpad/c5-crit-U1-F-replay/LeanProject/CriticStep.lean`
and `scratchpad/c5-crit-U1-T/CriticAll.lean`. This session re-registered,
re-proved (by literal re-elaboration through the governed `register`/`lake
build` pipeline against the pinned shared Mathlib), and re-verified them in
one governed project; no proof step, hypothesis, or conclusion was weakened,
strengthened, or altered from its source.

## 1. Definitions

`PStatement`, exactly as the seat's file states it (`s = 2n-K-1`,
`q = m+n-K-1`, `d = 2m-K`):

```lean
def PStatement (m K n : ℕ) : Prop :=
  Nat.descFactorial n (2 * n - K - 1) ≥ 2 ^ (2 * n - K - 1) * Nat.descFactorial (m + n - K - 1) (2 * n - K - 1)
```

`PStatement m K n` is the falling-factorial form of `(P)`: `C(n,s) ≥
2^s·C(q,s)`, i.e. `n!/p! ≥ 2^{n-p}·(m-p)(m-p-1)⋯(m-n+1)` with `p = K+1-n`,
`s = n-p`, `q = m-p`. `m` is the matching size, `d = 2m-K` the excess, both
numerals in the sense of `SOLUTION-CONTRACT.md`'s Tier language (arbitrary
naturals/integers, not fixed constants) — no graph, no `SimpleGraph`, no
`Δ_k`, no `indepCount` occurs anywhere in this project.

## 2. The region and why `m ≤ K+1` is redundant given `K ≤ 2m` and `3d ≤ 2m+2`

The chartered region is `3d ≤ 2m+2` with `d = 2m-K ≥ 0` (equivalently
`K ≤ 2m`). Over these two hypotheses, `m ≤ K+1` follows arithmetically:
`3d ≤ 2m+2` gives `3(2m-K) ≤ 2m+2`, i.e. `6m - 3K ≤ 2m+2`, i.e.
`4m ≤ 3K+2`; combined with `K ≤ 2m` this forces `K ≥ (4m-2)/3`, and a short
integer argument (`omega`-checked at the point of use, `P_holds_critic_general`'s
proof) shows `m ≤ K+1` in every case satisfying both. Concretely: from
`hd0 : (K:ℤ) ≤ 2*(m:ℤ)` and `hregion : 3*(2*(m:ℤ)-(K:ℤ)) ≤ 2*(m:ℤ)+2`,
`by omega` closes `m ≤ K+1` directly (see `P_holds_critic_general`'s call
`P_holds_critic m K (by omega) hd0 hregion n hhard hnm`). This is exactly
critic C-U1-T's observation (`P_holds_critic'` in the source), transcribed
here as `P_holds_critic_general` (renamed only because the formalization
registrar's source-declaration regular expression requires a Lean word
boundary immediately after a registered identifier, which the source name's
trailing `'` does not supply when followed by whitespace — see the Lean
source's docstring on `P_holds_critic_general`).

## 3. Discriminant factorisation and the two-sided characterisation (award
parts 1-2)

`(S)` (`(n+1)(K+1-n) ≥ 4(m+n-K)(m-n)`) rearranges to
`3n² - 3Kn + (K+1+4Km-4m²) ≥ 0`, a quadratic in `n` with discriminant
`Δ = 9K² - 12(K+1+4Km-4m²)`. Substituting `K = 2m-d`:

```
Δ = 9d² + 12(m+1)d - 12(m+1)²
```

**`discriminant_factorization`** (seat U1, pure `ring` identity, no
hypothesis): `9d² + 12(m+1)d - 12(m+1)² = 3·(3d - 2(m+1))·(d + 2(m+1))`.
This is award part 1.

**`discriminant_nonpos_iff`** (seat U1): for `d ≥ 0`, `m ≥ 0`, the second
factor `d + 2(m+1) > 0` always, so `Δ ≤ 0 ⟺ 3d - 2(m+1) ≤ 0 ⟺ 3d ≤ 2m+2` —
**both directions**, i.e. the two-sided region characterisation. This is
award part 2. Proved by splitting on the sign of `3d - 2(m+1)` against the
always-positive second factor, using `nonpos_of_mul_nonpos_right` and
`mul_nonpos_of_nonneg_of_nonpos`.

**`discriminant_in_K_matches_in_d`** (seat U1, pure `ring` identity): the
discriminant as it literally arises from substituting `K = 2m-d` into
`9K² - 12(K+1+4Km-4m²)` equals the `(m,d)`-form above; used to transport the
`(m,d)` sign fact back to the `(K,m)` form `(S)` is stated in.

## 4. Step `(S)` on the region (award part 3)

**`S_quadratic_nonneg_of_discriminant_nonpos`** (seat U1): the standard
"discriminant `≤ 0` implies the quadratic form is a sum of squares"
certificate — `12·(3n²-3Kn+C) = (6n-3K)² - Δ`, so `Δ ≤ 0` forces
`3n²-3Kn+C ≥ 0` for every real (here integer) `n`; closed by `nlinarith` with
the explicit square `(6n-3K)²` as a hint.

**`S_holds_of_discriminant_nonpos`** (seat U1): `(S)` itself,
`(n+1)(K+1-n) ≥ 4(m+n-K)(m-n)`, in its original multiplicative form, from the
same discriminant hypothesis.

**`S_holds_on_region`** (seat U1): chaining the two region facts — on
`3d ≤ 2m+2` (with `K = 2m-d`), `(S)` holds at **every** integer `n`,
uniformly; no horizon, no fixed band. This is exactly award part 3, stated
in the `(m,d,n)` parametrisation the terminal theorem uses.

## 5. Both base cases, where `3d ≤ 2m+2` enters literally at `s = 1`

**`P_base_s1`** (seat U1; `s = 1`, `K` even, `K = 2c`, `n = c+1`): unfolds
`PStatement` via `Nat.descFactorial_one` to `n ≥ 2(m-p)` with `p = n-1`,
i.e. `n ≥ 2(m-n+1)`, i.e. **`3n ≥ 2m+2`** — and at `n = c+1` this is
**literally** `3(c+1) ≥ 2m+2`, the hypothesis `hregion` of `P_base_s1`,
which is the chartered region `3d ≤ 2m+2` after substituting `K = 2c`,
`n = c+1` (so `d = 2m-K = 2m-2c`, and `3d ≤ 2m+2 ⟺ 2m ≤ 3c+1 ⟺
3(c+1) ≥ 2m+2`). This is the sense in which "the base case `s=1` is
literally the chartered hypothesis" (per the T-adjudicator's characterisation
of the identical mechanism at Cycle 4, reconfirmed for this route). Proved by
one `descFactorial` unfold plus `omega`.

**`P_base_s2`** (seat U1; `s = 2`, `K` odd, `K = 2c+1`, `n = c+2`): unfolds
to the two-factor comparison `n(n-1) ≥ 4(m-p)(m-p-1)`. The region `3d ≤ 2m+2`
at `K = 2c+1` (so `d = 2m-2c-1`) rearranges — over `ℕ`, with `m ≥ c+2` so no
subtraction truncates — to `4m ≤ 6c+5`, which is `P_base_s2`'s hypothesis
`hregion`. C-U1-F's critique (Finding 3) established, and this transcription
retains, that this base is **equivalent** to the region (not merely implied
by it, as an earlier draft comment in the seat's file mistakenly said); the
Lean hypothesis itself is unaffected either way, since only the implication
direction (region ⟹ base) is used in the proof. Proved by substituting
`m = c+2+e` (`e := m-c-2 ≥ 0`, from `hn`) so every truncated subtraction
becomes ordinary addition, unfolding `descFactorial 2` on both sides, and
closing with `nlinarith`.

## 6. The induction step: primary and fallback (award's mandatory fence)

The award's fence (`SEMANTIC-CONTRACT.md`/synthesis, `AWARD GROUP A`,
Pricing paragraph) is explicit: *"hand C-U1-F's toolkit-free proof as
primary and C-U1-T's as fallback; the seat's `descProd` toolkit is correct,
self-contained and not load-bearing, so it must not be a dependency."* This
project follows that instruction exactly: **the `descProd` toolkit
(`descProd`, `descProd_shift`, `descProd_bot`, `descFactorial_cast_eq_descProd`,
`descProd_nonneg`) is not registered anywhere in this project** and is not a
dependency of any registered declaration, let alone the terminal theorem.

**`P_induction_step_critic`** (**CRITIC-ATTRIBUTED, C-U1-F**, primary,
toolkit-free): `(P)` at a hard index `n` implies `(P)` at `n+1`, given `(S)`.
The mechanism uses only `Nat.succ_descFactorial_succ` (peels a factor off
the *top* of the range: `descFactorial (n+1) (s+2) = (n+1)·descFactorial n
(s+1)`) and `Nat.descFactorial_succ` (peels off the bottom:
`descFactorial n (s+1) = (n-s)·descFactorial n s`) on both sides, casts the
three natural-number subtractions to `ℤ` via `Nat.cast_sub` under the
hypotheses already present, invokes the already-proved
`S_holds_of_discriminant_nonpos` to get `(S)` over `ℕ`, and closes with
`Nat.mul_le_mul` (`ℕ`-multiplication is monotone, so no nonnegativity side
conditions are needed — this is exactly what makes the step toolkit-free).
This is a byte-for-byte transcription of `CriticStep.lean`'s
`CriticU1F.P_induction_step_critic`, registered directly under the award's
namespace (`ErdosR25.E1ArithmeticCore`) rather than under `CriticU1F`, per the
brief's §4 architecture instruction.

**Fallback (not used in this project, recorded for completeness):** C-U1-T's
`P_induction_step_critic` in `CriticAll.lean` proves the identical statement
via the `descProd` toolkit (`descFactorial_cast_eq_descProd`, `descProd_shift`,
and the additionally-required `descProd_nonneg`, per C-U1-T's own Finding F2
against the seat's return). Since the primary (toolkit-free) step compiles
cleanly in this project (see `EVIDENCE`/build log below), the fallback was
not needed and is not registered.

## 7. The induction principle over hard indices, both parities (leading to
award part 4)

**`P_holds_critic`** (induction-principle **scaffold attributed C-U1-T**:
`Nat.le_induction` over `(K+3)/2 ≤ j ≤ m` with the parity split at the base):
derives the discriminant hypothesis `hΔ` from the region hypotheses via
`discriminant_nonpos_iff` and `discriminant_in_K_matches_in_d`, then runs
`Nat.le_induction` from the smallest hard index `(K+3)/2`: the `base` case
splits on the parity of `K` (`Nat.even_or_odd`) and discharges via
`P_base_s1`/`P_base_s2`; the `succ` case invokes the step. **This project's
`P_holds_critic` calls this project's own `P_induction_step_critic` (C-U1-F's
toolkit-free step) in the `succ` case**, in place of C-U1-T's own
`descProd`-based step lemma of the same name in `CriticAll.lean` — a direct,
same-signature substitution within an otherwise identical, faithfully
transcribed tactic script, so that the toolkit-free step remains primary
throughout the whole induction principle, not just at one call site.

**`P_holds_critic_general`** (source name `P_holds_critic'`, **attributed
C-U1-T**): drops the `m ≤ K+1` hypothesis, which §2 above shows follows from
`d = 2m-K ≥ 0` and the region alone (`by omega` from `hd0`, `hregion`). This
is exactly award part 4, `(P)` at every hard index `n` (`K+1 < 2n`, `n ≤ m`)
for both parities of `K`, on the region `3(2m-K) ≤ 2m+2`.

## 8. The terminal conjunction

```lean
theorem matchingDual_scalarCore_award :
    (∀ m d : ℤ, 9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 = 3 * (3 * d - 2 * (m + 1)) * (d + 2 * (m + 1))) ∧
    (∀ m d : ℤ, 0 ≤ m → 0 ≤ d → (9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 ≤ 0 ↔ 3 * d ≤ 2 * m + 2)) ∧
    (∀ m d n : ℤ, 0 ≤ m → 0 ≤ d → 3 * d ≤ 2 * m + 2 →
        (n + 1) * ((2 * m - d) + 1 - n) ≥ 4 * (m + n - (2 * m - d)) * (m - n)) ∧
    (∀ m K : ℕ, (K : ℤ) ≤ 2 * (m : ℤ) → 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2 →
        ∀ n : ℕ, K + 1 < 2 * n → n ≤ m → PStatement m K n) :=
  ⟨discriminant_factorization, discriminant_nonpos_iff, S_holds_on_region, P_holds_critic_general⟩
```

Parts 1-3 are stated in the seat's exact arrangement (per the brief's §2
governance rule: "if the seat's statement differs in arrangement, the seat's
statement governs"); the controller's transcription in the brief's §2 display
drops the parentheses around `2 * m - d` in part 3's first factor, which is
immaterial under `+`/`-` left-associativity but is written here exactly as
`S_holds_on_region` states it, i.e. with the seat's own explicit
parenthesisation. Part 4 is exactly `P_holds_critic_general`'s (source
`P_holds_critic'`'s) curried type. Each of the four proof components is
supplied by direct reference to the already-proved lemma of the matching
type; the conjunction closes by the anonymous constructor with no further
tactics.

## 9. Attributions (condition (i))

- **Seat U1's**: the definitions (`PStatement`), the discriminant lemmas
  (`discriminant_factorization`, `discriminant_in_K_matches_in_d`,
  `discriminant_nonpos_iff`), step `(S)`
  (`S_quadratic_nonneg_of_discriminant_nonpos`, `S_holds_of_discriminant_nonpos`,
  `S_holds_on_region`), and both base cases (`P_base_s1`, `P_base_s2`).
- **CRITIC-ATTRIBUTED**: the induction step and the induction principle.
  `P_induction_step_critic` is **C-U1-F's** toolkit-free proof, used as
  **PRIMARY** per the award's mandatory fence. The induction-principle
  scaffold (`Nat.le_induction` over `(K+3)/2 ≤ j ≤ m`, the parity split at
  the base, and dropping the redundant `m ≤ K+1` hypothesis) is
  **C-U1-T's** (`P_holds_critic`/`P_holds_critic'` in `CriticAll.lean`),
  re-derived here calling C-U1-F's step lemma at its one call site.
  This attribution travels on the award's face: it appears in the docstring
  of every critic-attributed declaration in `LeanProject/LeanProof/Main.lean`
  and in the terminal theorem's own docstring.

## 10. Scope exclusions (condition (ii); mandatory fences, restated verbatim
from the award statement)

This is the **SCALAR core**: it does **not** raise
`E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY` (whose object is the
coefficientwise-in-`t` nonnegativity of `N_j`); it is not the large-rank
theorem and not the Tier 3a schema; no statement about any graph, forest, G1
tuple, tier, FOREST, TREE, TRANSFER or Erdős #993; no `SimpleGraph`, `Δ_k`,
`indepCount` occurs **as Lean code** anywhere in this project — no typed
variable, import, or application of any of the three. `grep` inside the run
root's own `LeanProject/LeanProof/Main.lean` in fact finds exactly one
textual match of each (`SimpleGraph`, `Δ_k`, `indepCount`), and `descProd`
exactly two; every one of these four matches is inside a `/-- ... -/`
doc-comment stating this very fence in prose (the terminal theorem's
docstring, and the two critic-attributed step/scaffold docstrings for
`descProd`), never a code reference. No sharpness claim; no claim that a
certificate exists for any particular graph. `m` and `d` are numerals
(arbitrary naturals/integers as quantified, not fixed constants). The
seat's `descProd` toolkit is correct but is not registered in this project
and is not a dependency of the terminal theorem (§6 above).

## 11. Condition (iii): the shipped-file literal and the axiom sentence

Per the synthesis's Pricing paragraph, the correct literal for the
**originating seat file** (`scratchpad/c5-U1/LeanProject/LeanProof/Main.lean`,
NOT this project's own assembled file) is **12 of 13** theorems sorry-free
(the one `sorry` at `P_induction_step`, closed by both critics), and the
axiom sentence for that file reads "**within** the three standard axioms"
(three declarations — `discriminant_factorization`,
`discriminant_in_K_matches_in_d`, `P_base_s1` — use only
`[propext, Quot.sound]`, not all three standard axioms). This project's own
assembled `LeanProject/LeanProof/Main.lean` registers 13 declarations total
(1 definition, 11 lemmas, 1 terminal theorem), all of them newly re-proved
and kernel-checked in this governed run; see `RECEIPTS/kernel-verification.json`
for this project's own axiom evidence.

## 12. Condition (iv): exact-integer generator and instance check

`EVIDENCE/verify_matching_dual_scalar_core.py` (Python standard library only,
deterministic, no wall-clock/PID/host field) checks, over the small grid
`m ≤ 40`: for every `(m, K)` with `0 ≤ K ≤ 2m` and `3*(2m-K) ≤ 2m+2`, and
every hard index `n` with `K+1 < 2n ≤ 2m` — `(a)` the discriminant identity
`9K² - 12(K+1+4Km-4m²) = 9(2m-K)² + 12(m+1)(2m-K) - 12(m+1)²` (a pure
algebraic identity, checked for a sanity bound outside the region too);
`(b)` the discriminant factorisation `9d²+12(m+1)d-12(m+1)² =
3(3d-2(m+1))(d+2(m+1))` for `d = 2m-K`; `(c)` the two-sided region
equivalence `Δ ≤ 0 ⟺ 3d ≤ 2m+2`; `(d)` step `(S)`,
`(n+1)(K+1-n) ≥ 4(m+n-K)(m-n)`, on the region; and `(e)` `(P)` itself,
`C(n,s) ≥ 2^s·C(q,s)` via `math.comb`, at every hard index on the region.
Output `EVIDENCE/matching-dual-scalar-core-instance-check.out.json` records
`all_checks_passed: true` and the exact row count; this reproduces (at a
smaller, sufficient horizon, per condition (iv)'s "one instance check ...
is enough") the same properties the seat's and both critics' independent
Python instruments established exhaustively at `m ≤ 300` (1,010,000+ cases,
zero failures) before any Lean code was written.

(Exact SHA-256 values of this file, `THEOREM-CONTRACT.yaml`,
`LeanProject/LeanProof/Main.lean`, and `RECEIPTS/kernel-verification.json`
are reported in `FORMALIZER-REPORT.md` and the final message.)
