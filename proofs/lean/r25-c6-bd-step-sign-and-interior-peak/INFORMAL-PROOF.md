# Informal proof: `U-AWARD-BD-STEP-SIGN-AND-INTERIOR-PEAK` (award group C6-LA4)

Run `erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`, Cycle 6 Stage 7,
Dispatch 4. Run root `runs/lean-2026-09-22-c6-bd-step-sign-interior-peak`.

Boot acknowledgment (VerityOS, Stage 7 formalizer seat): `verity.md`,
`identity/startup-protocol.md`, and `skills/lean-proof-workflow/skill.md` were read
in full before any substantive work; no other VerityOS file was read outside the
brief's read boundary. Model disclosure: this seat is Claude Sonnet 5, chartered
effort xhigh; the Agent transport exposes no effort parameter, and the seat cannot
self-inspect its own runtime model or effort setting — this disclosure rests on
dispatch-record authority (the brief), not on introspection.

## 0. Governing text and registry effect

Governing text: `cycles/cycle-6/stage6/SYNTHESIS.md`, `## Lean awards`, Dispatch 4
(`U-AWARD-BD-STEP-SIGN-AND-INTERIOR-PEAK`), cross-confirmed against
`cycles/cycle-6/stage5/adjudicators/U/ADJUDICATION.md`, `## Lean readiness`,
Contract-ready group 5. Registry effect: `D_step_sign` together with
`peak_bracket_integral` **is** the registered VERIFIED `E993-R25-D-ROW-STEP-SIGN-LAW`
verbatim (both conjuncts) — a **grade change** `proved_informal → formally_verified`,
Cycle 5 critic attribution (C-U2-T, C-U2-F) preserved. `interior_peak_le_cat` is
**new content with no registered predecessor** and takes the controller-assigned key
`E993-R25-BD-INTERIOR-PEAK-CATALAN-BOUND`. This award raises **nothing else**: not
`E993-R25-BD-TAIL-NEGATIVE` (the top-level `Bd(r,r) < 0`), not
`E993-R25-FOURTH-BAND-CLOSE-ALL-R`. Name it *the step-sign law and interior peak
bound*, never "the band's tail". `D_unimodal_peak` (struck FALSE) does not appear
anywhere in this project, not even as a struck name in a docstring, other than this
sentence recording the fence.

## 1. Definitions, exactly as the compiled sources state them

All definitions are seat U2's, taken verbatim (mechanically re-derived, not
re-designed) from the compiled, digest-verified
`scratchpad/c6-crit-U2-F/LeanProject/LeanProof/Main.lean`
(SHA-256 `be6dd935fa5a7f72655b0afbfc714acb4f9af0493da69445013a11b5cdfb8472`).

- `Cz (n k : ℤ) : ℤ := if 0 ≤ n ∧ 0 ≤ k then (Nat.choose n.toNat k.toNat : ℤ) else 0`
  — the zero-extended integer binomial coefficient (`SEMANTIC-CONTRACT.md`'s
  zero-extension convention applied to `C`): `Cz n k = C(n,k)` for `0 ≤ k ≤ n`, `0`
  for negative `n` or `k`.
- `D (b m : ℤ) : ℤ := Cz b (m + 1) - 2 * Cz b m + Cz b (m - 1)` — the ranged object,
  `D(b,m) = C(b,m+1) − 2C(b,m) + C(b,m−1)`, over ℤ throughout (per the U
  adjudication's findings [T4]/[F2]).
- `N (m g : ℤ) : ℤ := g ^ 2 + g - 2 * m - 2` — the sign-governing numerator of
  `D(2m−g,m)`.
- `L (m g : ℤ) : ℤ := (m + 1 - g) * (g ^ 2 + 3 * g - 2 * m)` — `L(g) = (m+1−g)·N(g+1)`.
- `R (m g : ℤ) : ℤ := (2 * m - g) * (g ^ 2 + g - 2 * m - 2)` — `R(g) = (2m−g)·N(g)`.

No graph object occurs anywhere in this project. No `SimpleGraph`, `indepCount`,
`delta`, `firstDescent`, `Erdos993G1`, `MaR`, `BdRR`, or `[6,14]`-layer identifier
occurs. `D`, `N`, `L`, `R` are the seat's integer functions over ℤ with zero
extension, per the award's fence.

## 2. Hypotheses and where they enter

- `1 ≤ m` (both conjuncts): enters the closed-form node 1 (`D_closed_form`) so that
  the Pascal ratio identities `choose_ratio_up`/`choose_ratio_down` are available at
  `k = m` and `k = m − 1`; needed again directly in `D_step_sign`.
- `g < m` (the step-sign conjunct): the load-bearing cancellation hypothesis. At
  `g = m` the factor `(m−g)` in the row-shift identity vanishes and the derivation of
  `D_step_sign` from `D_closed_form` at `g` and `g+1` plus the row-shift and
  ratio-down identities is unavailable; the step-sign law is not claimed at `g = m`.
  (It also holds there as a proof artifact of the cancellation, per the Cycle 6
  synthesis, but that case is not part of this award's registered statement.)
- `7 ≤ m` and `g ≤ m` (the interior-peak conjunct): `7 ≤ m` is needed for
  `gc_ge_five` (any transition witness `g` with `g² − g ≥ 2m` must have `g ≥ 5`,
  checked by `interval_cases` on `g < 5` and `omega`/`norm_num`) and for
  `three_gc_le` (the `m² − 7m + 1 ≥ 0`-type `nlinarith` chain). `g ≤ m` keeps the
  binomial coefficient `C(2m−g,m)` in Pascal's-triangle range for `row_ratio` and for
  `D_closed_form`.
- `2 * m ≤ g ^ 2 - g` (`hpass`) and `(g - 1) ^ 2 - (g - 1) < 2 * m` (`hfail`): the two
  bracket inequalities that characterise `g` as the exact transition point of the
  step-sign law (`g` passes the transition test, `g − 1` does not). **These two
  inequalities are supplied as hypotheses on a witness `g` — `g` is never produced by
  an existence proof, a `Nat.find`, or any other existential construction.** This is
  exactly the distinction the award's fence names: it is what makes `D_unimodal_peak`
  (which asserted a maximiser existed with additional unproved shape properties)
  false while `interior_peak_le_cat` (which only ever consumes a witness already
  known to satisfy the two inequalities) is true and provable.

## 3. Proof, node by node

The DAG below is the one stated in the Cycle 6 synthesis Dispatch 4 and the U
adjudication's Contract-ready group 5, re-derived and re-proved fragment by fragment
in this run's own project (`LeanProject/LeanProof/Main.lean`, registered via 30
ordered entries in `FORMALIZATION-STATE.json`; ENTRY indices below in brackets).

1. **Apparatus** `Cz`, `D`, `N`, `L`, `R` [ENTRY 1–5, seat U2] and their cast lemmas
   `Cz_natCast`, `Cz_cast_add_one`, `Cz_cast_sub_one` [ENTRY 6–8, seat U2] and the two
   Pascal ratio identities `choose_ratio_up`, `choose_ratio_down` [ENTRY 9–10, seat
   U2], both sourced from Mathlib's `Nat.choose_succ_right_eq`.
2. **Node 1**, `D_closed_form` [ENTRY 11, seat U2]: for natural `g ≤ m`, `1 ≤ m`,
   `D(2m−g,m)·(m+1)·(m−g+1) = C(2m−g,m)·N(g)`. Proved by combining
   `choose_ratio_up`/`choose_ratio_down` at `b = 2m−g` via `linear_combination`.
3. **Node 2a**, `L_eq`, `R_eq`, `L_sub_R` [ENTRY 12–14, seat U2]: the abstract
   polynomial ratio-test identity `L(g) − R(g) = (m+1)(2m−g²+g)`, unconditional (no
   `N(g) > 0` hypothesis anywhere, unlike the struck Lemma A of the Cycle 5 return),
   proved by `ring` alone.
4. **Node 4**, `peak_bracket_integral` [ENTRY 15, seat U2]: if `(g−1)² − (g−1) < 2m`
   then `N(g) ≤ 4g−5`, the INTEGRAL sharpening (critic C-U2-F) of the return's
   real-valued `< 4g − 4` bound, exploiting that both sides of the defining
   inequality are integers (`omega` promotes `<` to `≤ … − 1`, then `nlinarith`).
5. **Node 7 apparatus**, `gc_ge_five`, `three_gc_le` [ENTRY 16–17, seat U2] and
   **node 7**, `gc_star_bound` [ENTRY 18, seat U2 — **renamed from the chartered name
   `star_star`**, see §5(iii) below]: for `m ≥ 7` and the exact transition point,
   `8(2m−1)(g_c−1) ≤ 2^{g_c}(m+1)(m+1−g_c)`, via `g_c ≥ 5` (so `2^{g_c} ≥ 32`) and
   `3g_c ≤ 2m+2` (so `2(m+1−g_c) ≥ g_c`).
6. **Node 5**, `choose_double_step`, `row_ratio` [ENTRY 19–20, seat U2]: the
   row-ratio telescope `2^g · C(2m−g,m) ≤ C(2m,m)` for `g ≤ m`, by induction on `g`
   from the per-step doubling identity (`Nat.choose_mul_succ_eq`).
7. **Node 6**, `catalan_centralBinom_gap` [ENTRY 21, seat U2]: `C(2m,m) =
   2(2m−1)·catalan(m−1)` for `m ≥ 1`, from Mathlib's
   `Nat.succ_mul_centralBinom_succ` and `succ_mul_catalan_eq_centralBinom`.
8. `choose_row_shift`, `choose_ratio_down_at` [ENTRY 22–23, **critic C-U2-F**]: the
   extra Pascal row-shift `C(2m−g−1,m)·(2m−g) = C(2m−g,m)·(m−g)`
   (`Nat.choose_mul_succ_eq` at `n = 2m−g−1`) and the `choose_ratio_down` instance at
   `b = 2m−g`, the one ingredient node 2b needs beyond node 1.
9. **Node 2b**, `D_step_sign` [ENTRY 24, **critic C-U2-F, PRIMARY**]: the `D`-level
   UNCONDITIONAL step-sign law, `m·(2m−g)·(h(g+1) − h(g)) = C(2m−g,m−1)·(2m−g²+g)`
   with `h(g) := D(2m−g,m)`, for `g < m`, `1 ≤ m`. Proved by combining node 1 at `g`
   and `g+1` with the row-shift and ratio-down-at identities via one
   `linear_combination`, then cancelling the nonzero factor `(m+1)(m−g+1)(m−g)`
   (`mul_right_cancel₀`) — exactly where `g < m` is load-bearing. **Independently
   compiled by critic C-U2-T** on the same statement, in
   `scratchpad/c6-crit-U2-T/LeanCritic/CriticProof/Main.lean`
   (SHA-256 `ca41c4a035691258981b0f101e23bf5513d8a222315745238e854fbe233ccab5`,
   theorem `D_step_sign` at line 121 there, parameter order `(hm) (hg)` rather than
   C-U2-F's `(hg) (hm)`, a different proof, same statement) — read as authority for
   attribution only; its `MaR0`/`BdRR` ℕ-truncated frame is **not carried** into
   this project, per the read boundary.
10. `choose_pred_pos`, `D_step_up`, `D_step_down` [ENTRY 25–27, **critic C-U2-F**]:
    `C(2m−g,m−1) > 0` on `g < m`, and the two monotone-step corollaries of
    `D_step_sign` (strict increase while the transition test fails, non-increase once
    it passes) — the "node 3, the argmax, now unblocked by node 2b" facts named in
    the Cycle 6 synthesis DAG. Registered here as further lemmas (every component of
    the synthesis's DAG is registered, per the award's §2 instruction); neither is a
    dependency of the terminal theorem's two conjuncts, which state the step-sign law
    and the interior peak bound directly.
11. `Cz_nonneg` [ENTRY 28, **critic C-U2-F**]: `Cz` is nonnegative everywhere, a
    one-line case split on the definition.
12. **Node 8 core**, `interior_peak_le_cat` [ENTRY 29, **critic C-U2-F**]: for `m ≥
    7` and `g ≤ m` the exact transition point (`hpass`, `hfail` as in §2), `D(2m−g,m)
    ≤ catalan(m−1)`. The assembly of nodes 1, 4, 5, 6, 7: chain
    `h·(m+1)(m−g+1) ≤ A·(4g−5)` (node 1 + node 4) `≤` (multiply by `2^g`, node 5)
    `≤ (8(2m−1)(g−1))·K` (node 6 + arithmetic) `≤ (2^g(m+1)(m+1−g))·K` (node 7),
    then cancel the positive factor `2^g(m+1)(m−g+1)` (`le_of_mul_le_mul_left`).
13. **Terminal declaration**, `bdStepSign_interiorPeak_award` [ENTRY 30]: the
    explicit conjunction `⟨D_step_sign, interior_peak_le_cat⟩`, restated as the two
    `∀`-quantified statements in exactly the parameter and hypothesis order the
    compiled declarations use (see §4).

## 4. Terminal statement

Fully-qualified declaration name: `ErdosR25C6U2.bdStepSign_interiorPeak_award`.
Exact namespace-relative source text, as it appears in
`LeanProject/LeanProof/Main.lean` (the compiled statement governs over the brief's
transcription in `control/C6-STAGE7-FORMALIZER-BRIEF-LA4.md` §2, per that section's
own instruction; the difference is cast placement and hypothesis order, matching
`D_step_sign`'s compiled `(hg : g < m) (hm : 1 ≤ m)` order rather than the brief's
transcribed `1 ≤ m → g < m`):

```lean
theorem bdStepSign_interiorPeak_award :
    (∀ m g : ℕ, g < m → 1 ≤ m →
        (m : ℤ) * (2 * (m : ℤ) - (g : ℤ))
            * (D (2 * (m : ℤ) - ((g : ℤ) + 1)) (m : ℤ) - D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ))
          = Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1)
              * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ))) ∧
    (∀ m g : ℕ, 7 ≤ m → g ≤ m →
        2 * (m : ℤ) ≤ (g : ℤ) ^ 2 - (g : ℤ) →
        ((g : ℤ) - 1) ^ 2 - ((g : ℤ) - 1) < 2 * (m : ℤ) →
        D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ (catalan (m - 1) : ℤ)) :=
  ⟨fun m g hg hm => D_step_sign m g hg hm,
   fun m g hm hgm hpass hfail => interior_peak_le_cat m g hm hgm hpass hfail⟩
```

## 5. Conditions of `control/C6-STAGE7-FORMALIZER-BRIEF-LA4.md` §3

(i) **Attribution, on the award's face.** Seat U2: nodes 1, 2a, 4, 5, 6, 7 (`Cz`,
`D`, `N`, `L`, `R`, the cast/ratio apparatus, `D_closed_form`, `L_eq`/`R_eq`/
`L_sub_R`, `peak_bracket_integral`, `gc_ge_five`/`three_gc_le`/`gc_star_bound`,
`choose_double_step`/`row_ratio`, `catalan_centralBinom_gap`). Critic C-U2-F: node 2b
(`D_step_sign`, PRIMARY) and the interior peak bound (`choose_row_shift`,
`choose_ratio_down_at`, `choose_pred_pos`, `D_step_up`, `D_step_down`, `Cz_nonneg`,
`interior_peak_le_cat`). Node 2b independently compiled by critic C-U2-T (joint
attribution on that node only; C-U2-T's fragment is read-only authority for
attribution, not carried into this project's proof term).

(ii) **Scope exclusions, in `SEMANTIC-CONTRACT.md`/award terms.** No graph object
occurs. `D`, `N`, `L`, `R` are the seat's integer functions over ℤ with zero
extension. This award does **not** raise `E993-R25-BD-TAIL-NEGATIVE` (the top-level
`Bd(r,r) < 0`) or `E993-R25-FOURTH-BAND-CLOSE-ALL-R`; `MaR`, `BdRR`, `BdTailTarget`,
and the `[6,14]`-layer construction from
`scratchpad/c6-crit-U2-F/LeanProject/LeanProof/CriticF2.lean` part (B) are **not
carried** into this project — only part (A) of that file (`Cz_nonneg`,
`interior_peak_le_cat`) is registered here. `D_unimodal_peak` does not appear.
Fixed-band `d = 5` arithmetic; "unimodality" is of the integer function
`g ↦ D(2m−g,m)`, derived from the sign identity `D_step_sign`, importing no shape
premise on any `i_k`.

(iii) **Repair (1 of 2 used, mandatory before dispatch).** The chartered name
`ErdosR25C6U2.star_star` collides with Mathlib's root `star_star`
(`star (star a) = a`, from the `Star`/involutive-star API); any file that later
`open`s the `ErdosR25C6U2` namespace alongside a Mathlib file using `star_star` would
hit an ambiguous-identifier error, and the seat's own axiom-print receipt exposed the
collision (an 18-line receipt for 17 declarations). **Renamed to `gc_star_bound`**
throughout this project (ENTRY 18; consumed by `interior_peak_le_cat`, ENTRY 29, as
`E7`). No other repair was needed or used; this project entered the run at 0 of 2
repairs used and closes at 0 of 2 (the rename was applied directly in the first
draft, before any failed `lake build`, so it does not count against the bounded
repair budget in the sense of a post-failure repair cycle — recorded here for
completeness regardless).

(iv) **Evidence envelope.** `EVIDENCE/step-sign-and-interior-peak-check.py`, a
Python-standard-library-only exact-integer generator, checks `D_step_sign`'s
identity on every `0 ≤ g < m ≤ 120` and `interior_peak_le_cat`'s bound on every
`7 ≤ m ≤ 120` at each `g` satisfying `hpass`/`hfail` for that `m`. Zero failures
recorded in `EVIDENCE/step-sign-and-interior-peak-check.json` (no wall-clock, PID, or
host field; explicit import list at the top of the generator).

(v) **Axioms.** `#print axioms` was run on every one of the 30 registered
declarations (RECEIPTS/kernel-verification.json, `axiom_report`); every declaration
depends on axioms within the three standard axioms `propext`, `Classical.choice`,
`Quot.sound`, and no declaration prints `sorryAx` or any unapproved axiom.

## 6. What this award does not claim

This project does not claim, and its terminal theorem does not entail: the top-level
flagship `∀ r ≥ 6, Bd(r,r) < 0`; any statement about `MaR`, `BdRR`, or the `[6,14]`
layer; any statement about a `SimpleGraph`, a forest, a tree, `indepCount`, `delta`,
or `firstDescent`; `D_unimodal_peak` in any form; or the existence of a maximiser of
`g ↦ D(2m−g,m)` — `interior_peak_le_cat` consumes a witness already known to satisfy
the two bracket inequalities and proves nothing about how such a witness is produced.
"`formally_verified`" in this document refers only to the exact declarations
registered in `THEOREM-CONTRACT.yaml` and kernel-checked in
`RECEIPTS/kernel-verification.json`, per `SOLUTION-CONTRACT.md` §4's Lean gate.
