# r24 Direct Favorable-Leaf Aggregate: Six-Cycle DRE, Terminal Close

The mathematics agent's lane after [r23](r23-delete-retag-actual-tree.md) and
[r23b](r23b-delete-retag-construction-verification.md): attack the literal
complete favorable-original-leaf aggregate directly. For a finite ordinary
tree `T` and rank `p`, with `x(T)` the first strict descent of the
independence sequence, `F` the original leaves `v` with `a_v = Δ_p(T−v) < 0`,
`H_v = T − {v, s_v}`, `R_v = T − N[s_v]`, `b_v = Δ_{p−1}(H_v)`, `B_v =
Δ_{p−1}(R_v)`, the target is

```text
S(T,p) = Σ_{v ∈ F} (b_v − B_v) ≤ 0   for every eligible  x(T)+2 ≤ p < α(T).
```

Governed `E993-BETA-AGG` (the same statement on `RTree`) and literal-to-
governed transport were kept as separate faces throughout; no status moved
between them. Internal run `erdos-993-direct-favorable-leaf-aggregate-dre-2026-09-14`:
Cycles 1–4 under Codex (36 routes / 72 critics / 3 adjudicators / 1 synthesis
per cycle, paused 2026-09-15), Cycles 5–6 under Claude Fable 5.1 by Ashton's
handover of 2026-09-17 (9/18/3/1; Cycle 6 terminal by the authorized ceiling),
every stage sealed by canonical-JSON SHA-256 manifests, closed 2026-09-18 with
the controller's independent evaluation
([`runs/…/TERMINAL-EVALUATION.md`](../runs/r24-direct-favorable-leaf-aggregate-dre-2026-09-14/TERMINAL-EVALUATION.md)).

## Outcome

**Every headline face is unchanged.** The literal aggregate is open; its
top-rank residual case `(RC)` is exactly as open as Cycle 4 left it; transport
was never attempted; `E993-BETA-AGG` and Erdős #993 are untouched. The stop
gate found no decisive event and no plateau; the run stopped on its cycle
boundary.

**No positive complete eligible aggregate exists anywhere in the evidence:**
all trees of orders ≤ 16 exhaustively (71,075 eligible rows at orders 15–16,
verified by set equality of isomorphism classes on two independent
enumerators); the eligible top-rank residual class to order 17 (16,424
trees); every designed family; ~4.9 million stratum rows. Every positive
object found in six cycles is a positive *summand* inside a negative
aggregate (T22 at `p = 34` carries `+212336130412243110` inside
`−498754180547001418536`; T60 at `p = 90` carries `+2.935…×10⁵¹`), a
zero-valued summand, or a row outside the live window. A qualitatively new
datum: the mechanism inequality `g_v ≤ 0` is **tight, not strict** — equality
is attained on about 10% of eligible rows at every order from 8 upward.

## Verified

Two Lean packages at Lean 4.32.2 / Mathlib `905b9581…`, axioms exactly
`[propext, Classical.choice, Quot.sound]`, no `sorry`/`admit`/`native_decide`,
each through the governed workflow (frozen theorem contract, independent
informal proof-integrity audit, kernel/axiom receipt, independent statement-
fidelity attestation). Internal grade `formally_verified`; published here as
`verified` per the program's projection convention.

- [`C4LA1.topRankSelectorCollapse`](../proofs/lean/r24-c4-top-rank-selector-collapse/README.md)
  (Cycle 4): every leaf of a finite tree with `α ≥ 2` is strictly favorable
  at `p = α−1`.
- [`C5LA1.topRankResidualIdentity`](../proofs/lean/r24-c5-top-rank-residual-identity/README.md)
  (Cycle 5): on the residual class (every leaf in every maximum independent
  set), with `2 ≤ α` and `x(G)+2 ≤ α−1`,
  `S(G, α−1) = ℓ·M − Σ_{B ∈ I_{α−1}(G)} (|B∩L| − Σ_{s∈B} λ(s))`, where `L`
  is the leaf set, `M = i_α(G)`, and `λ(s)` counts leaf neighbours. Equality
  only. Independently re-verified end to end in Cycle 6 (rebuild on the
  unchanged source, axiom probe, all 31 fragment digests); a Cycle 6 critic's
  kernel-checked scratch probe shows the tree and eligibility hypotheses are
  removable — recorded as debt, not re-awarded.

Two Cycle 4 award groups (`C4-LA2` exact `T_m` sign bundle; `C4-LA3`
PSC-terminal classification) stay `blocked` on missing semantic bridges;
Cycle 6 attempted no award.

## Exact results at literal ordinary-tree scope (informal)

Route-attributed:

- **Flat residual sign law.** On the "flat" subclass of the eligible
  top-rank residual class (every non-leaf vertex supports a leaf),
  `S(T, α−1) = −ℓ(ℓ−2) − k₂(ℓ−4) ≤ −16` (eligibility forces `ℓ ≥ 5`; the
  bound is attained at the order-7 double star). The subclass is 290 of
  16,424 residual trees to order 17, a share that declines with order.
- **Upper-guard failure.** On the residual class, deleting a leaf (with or
  without its support, or by pendant-edge contraction) always drops `α`, so
  the reduced upper guard `p < α(T')` of the minimum-positive-row reducer can
  never hold for a leaf-deleting reduction — the exact reason Cycle 5's
  reducer "failed only through the upper guard". Support-only deletion
  preserves `α` and passes the guard; whether it is a reducer is open.

Critic-attributed (written in Stage 4, replayed by the adjudicators, not yet
independently re-proved — the attribution is part of the record):

- **`S(T_m, α−1) = −9m² − 6m + 1 < 0` for every `m ≥ 1`** — the top-rank
  `(RC)` on the entire `T_m` family, obtained by two independent routes and
  verified by the controller against the frozen evaluator (`−4487` at T22,
  `−32759` at T60). Not awarded: under the program's semantic contract a
  family-only formula is a supporting result unless it removes a named
  central obstruction, and this removes no quantifier from `(RC)`.
- **Non-strict per-support sign on PSC-terminal strata.** For `K₂`-core and
  exceptional-`P₃`-core terminal trees (stated through the core-incidence
  characterization), `x(T) ≥ ⌈(α−3)/2⌉`, hence `2p ≥ α+1` on every eligible
  row, and a binomial-ratio argument gives `g_s(p) ≤ 0` at every support.
  Strictness is computational only; the decorated `P₄` (the only
  condition-(A) core of order 4) is provably out of the proof's reach. Named
  the run's highest-value Lean target after an independent re-proof.
- **The whole-class expansion.** The residual-class aggregate `S(T, α−1)`
  admits an exact three-family expansion over near-maximum independent sets,
  of which the flat law is the degenerate branch; its family-(I) weights
  `ℓ − 1 − 2|A_S|` change sign in a regime realized from order 9 — the crux
  of `(RC)`.
- **`T_m` band domination, localized.** `S(T_m, q+2) = w_{q+1} − w_q` for the
  explicit polynomial `W(x) = (3m+1)(1+x)^{3m} + 3m(x+2)(2x+1)·branch(x)^{m−1}`,
  so in-band nonpositivity is exactly coefficient monotonicity of `W`;
  verified to `m = 400` with margins growing to ~10¹⁸, unproved at three
  named lemmas; width law `x_m = ⌊13m/9⌋ + 1` for `m ≥ 30` (asymptotic width
  ratio `1/18`).

## Record corrections (replace the r24 Cycle 5 literals wherever cited)

- The `T_m` lower band `[x_m, ⌊3m/2⌋)` is empty exactly for `m ≤ 21` and
  `m ∈ {23, 25, 27, 29}` and non-empty for **every** `m ≥ 30` of either parity
  (Cycle 5 had "even `m ≥ 22` only"); width 2 at `m = 38`.
- Distinct-row counts that were evaluation counts: F1's 126,649 → 93,753–93,755;
  F2's 1,350 trees / 5,858 rows → 900 / 4,435 (558 condition-(A) isomorphism
  classes); U2's 69,724 → 64,257 up to isomorphism; T1's 84,875 → 81,134.
- "No positive summand anywhere" is false (both sealed controls carry one);
  wall-clock fields make eight result-file digests unbindable; a
  singleton-witness "payment" lemma is r23's registered left-totality with an
  inert hypothesis and a non-injective map.

## What remains

The 35-item terminal debt register is in
[`C6-TERMINAL-SYNTHESIS.md`](../runs/r24-direct-favorable-leaf-aggregate-dre-2026-09-14/C6-TERMINAL-SYNTHESIS.md).
Permanent debt: the frozen guarded PSC move relation and the canonical
literal-tree representation (no source authority in scope), eligibility-
qualified `(RC)` (target-equivalent), and transport. Earliest honest resume,
if ever authorized: the **lower interior window** — the only region where
positive mechanism values are known to occur, searched by no route in either
cycle; the signing of the three-family expansion on the residual class; and
an independent re-proof, then formalization, of the `K₂`/`P₃` stratum theorem.
A further near-`α` null census would be a plateau, not work.

## Process record

Isolation by sealed capsules held: every critic and adjudicator verified its
capsule at open, and all three controller-caused post-seal edits of sealed
members were caught by seats, reconstructed byte-exactly, and preserved.
Every computation any seat reported was reproduced by at least one
independent instrument. The Stage 4 critic tier produced most of the terminal
cycle's new mathematics; the route tier was strongest at computation and
weakest at certification language — a dozen literals were struck at
adjudication with their corrections carried here. Verification record:
[`evidence/verification-2026-09-18-r24.md`](../evidence/verification-2026-09-18-r24.md).
