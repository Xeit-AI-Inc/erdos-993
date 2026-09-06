import R12C4T.CorridorReduction

/-!
# R12C4-T — the (α)/(β) proof targets, their falsifiable signatures, and the
conditional composition to (A) at leaf-witnessed favorable supports

**Route: R12C4-T, stage-3, Sonnet 5, xhigh, isolated (AMD-9 role/effort line).**
Allocation: `control/STUDY-INTERLUDE-1.md` §4, `R12C4-T` — the theorem attempt
(LOAD-BEARING).

This file does **three** things, in the order C1-AMD-11 requires (signature
before measurement, measurement before proof search):

1. States `K_A` (`p − x(T)`, the ALIAS-REGISTRY `K-COORD-A` object) as a real
   Lean definition — restated, not newly invented; `FC-R12-2` correction 5
   already names this coordinate.
2. States the two PROOF TARGETS, `AlphaTarget` and `BetaTarget`, as bare
   `Prop`s — exactly the `TheoremA`/`TheoremB` convention already governed at
   `CorridorIngredients.lean:2344,2398` (a `def ... : Prop`, no accompanying
   `theorem`, is the correct way to record a target without asserting it).
   Alongside each, states its falsifiable signature `AlphaCounterexample` /
   `BetaCounterexample` — a single instance satisfying the counterexample
   predicate is a DECISIVE EVENT per `SOLUTION-CONTRACT.md` §1 — and PROVES
   (not merely asserts) that the signature is the exact negation of the
   target's per-instance conclusion, via the governed `T1` identity
   (`a_support_eq_a_add_b_sub_Bgen`). This is genuine mechanized content: it
   does not touch whether either target is true.
3. PROVES the conditional composition the interlude's own rationale states in
   prose (`STUDY-INTERLUDE-1.md` §4: "Together they discharge (A) at every
   leaf-witnessed favorable support") as an actual Lean theorem, taking
   `AlphaTarget` and `BetaTarget` as HYPOTHESES (never asserted, never
   discharged) and concluding the leaf-witnessed form of (A) at every
   `k_A ≥ 1`. This makes the allocation's own logical claim itself
   sorry-free and machine-checked, independent of whether the two inputs are
   ever proved.

**Fence check (per-object, C1-AMD-11).** `K_A`, `AlphaTarget`, `BetaTarget`,
`AlphaCounterexample`, `BetaCounterexample` are pure ingredient-level
definitions: each is a direct restatement of already-normalized objects
(`ALIAS-REGISTRY.md` `K-COORD-A`; `STUDY-INTERLUDE-1.md` §4's own (α)/(β)
statements) or their literal logical negation. None introduces tree-recursive
structure, branch decomposition, or a `Bpoly_node`-shaped recursion. F1/F2 not
approached (no log-concavity/unimodality invoked). F10 not approached (no
recursion through the I/A/B state split; no inequality carried across a
subtraction — the three proved theorems below are pure propositional/linear
rearrangements of already-governed `T1`/`T2`, via `omega`). **Nothing below
asserts `AlphaTarget`, `BetaTarget`, (A), (B), `CMP-A`, `CMP-B`, or `O3`.**
-/

noncomputable section
namespace RTree

/-- **`K_A`, the `k_A` coordinate (`ALIAS-REGISTRY.md` `K-COORD-A`,
`FC-R12-2` correction 5): `k_A := p − x(T)`.** Restated as a Lean `def`
for the first time in this run's Lean corpus (grep of the full run tree
before this file found no prior Lean declaration of it); not a new
mathematical object, a direct transcription of the frozen informal
definition into the notation already governing `crossingIndex`.
Invariance: a function of `(t, p)` only, through `t.crossingIndex` (itself
documented `:2269` as a function of the isomorphism class of `t` alone). -/
def K_A (t : RTree) (p : ℕ) : ℤ := (p : ℤ) - (t.crossingIndex : ℤ)

/-! ## The `k_A = 1` slack theorem, (α) -/

/-- **PROOF TARGET (α), `STUDY-INTERLUDE-1.md` §4 verbatim.** For a leaf `v`
with `s := t.support v`, `p` with `k_A = 1`, and `t.a v p < 0`: the slack
`t.a v p + (t.b v p − t.Bgen s (p−1))` is negative.

**NOT ASSERTED. A bare `Prop`, exactly the `TheoremA`/`TheoremB` recording
convention (`:2344`, `:2398`).** No proof of this declaration is attempted
in this file or anywhere in this route's deliverable; see the accompanying
`.md` report for the honest account of what was and was not attempted, and
why the natural branch-decomposition attack is fence-blocked (F10/Q3
scope, not yet ruled for this quantity's ambient set). -/
def AlphaTarget : Prop :=
  ∀ (t : RTree) (v : List ℕ) (p : ℕ),
    v ∈ t.leaves → K_A t p = 1 → t.a v p < 0 →
      t.a v p + (t.b v p - t.Bgen (t.support v) ((p : ℤ) - 1)) < 0

/-- **The falsifiable signature for (α), declared before any measurement or
proof search on it (`C1-AMD-11`).** A single `(t, v, p)` triple satisfying
this predicate — leaf `v`, `k_A = 1`, `a_v(p) < 0`, and the slack
NON-negative — falsifies `AlphaTarget` outright (one instance suffices,
since `AlphaTarget` is a bare universal statement) and is a DECISIVE EVENT
per `SOLUTION-CONTRACT.md` §1: halt, report, reconcile. Horizon
(`SOLUTION-CONTRACT.md` §3 rule 5): the exceptional predicate
`EXCEPTIONAL(T,v,p)` of `FC-R12-8` (`a_v(p)<0 ∧ k_A=1 ∧ b_v(p) >
Bgen_s(p-1)`) is a STRICT SUPERSET of the search space this signature
needs — `EXCEPTIONAL` finds where the naive sufficient condition fails,
`AlphaCounterexample` additionally requires the slack itself to fail — so
the smallest-known-witness order for `EXCEPTIONAL` (`n = 11`) is the
correct horizon floor; `AlphaCounterexample` has never fired at any order
tested by any prior cycle (0 / 26,082 `EXCEPTIONAL` instances through
order 20, plus the five K–L fixtures — all bounded zeros, evidence of
nothing beyond themselves, per `FC-R12-8`'s own FROZEN BOUNDED-ZERO
LABEL). -/
def AlphaCounterexample (t : RTree) (v : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ K_A t p = 1 ∧ t.a v p < 0 ∧
    ¬ (t.a v p + (t.b v p - t.Bgen (t.support v) ((p : ℤ) - 1)) < 0)

/-- **PROVED (not a target): the falsifiable signature is the exact
negation of (α)'s per-instance conclusion in `t.a s p < 0` terms, via the
governed `T1` identity.** Genuine mechanized content — a real theorem,
`omega`-closed from `a_support_eq_a_add_b_sub_Bgen` — that touches nothing
about whether (α) or its negation ever holds on any tree. This is what
makes `AlphaCounterexample` a checkable predicate rather than a restated
wish: on any witnessing leaf `v`, "the slack fails" and "`a_s(p) ≥ 0`" are
the SAME event. -/
theorem alphaCounterexample_iff (t : RTree) {v : List ℕ} (hv : v ∈ t.leaves)
    {p : ℕ} (hk : K_A t p = 1) (ha : t.a v p < 0) :
    AlphaCounterexample t v p ↔ ¬ (t.a (t.support v) p < 0) := by
  have hid := t.a_support_eq_a_add_b_sub_Bgen hv p
  unfold AlphaCounterexample
  constructor
  · rintro ⟨-, -, -, hslack⟩; omega
  · intro hnot; exact ⟨hv, hk, ha, by omega⟩

/-- **PROVED: `AlphaTarget` is equivalent to its `T1`-transported form,
`t.a (t.support v) p < 0`** — exactly the "equivalently `t.a s p < 0` via
T1" clause of `STUDY-INTERLUDE-1.md` §4's own statement of (α), now
mechanized. Both directions are pure linear rearrangements of
`a_support_eq_a_add_b_sub_Bgen`, closed by `omega`; no new mathematical
content beyond the restatement. -/
theorem alphaTarget_iff_stmtA_leafWitnessed_kA_eq_one :
    AlphaTarget ↔
      ∀ (t : RTree) (v : List ℕ) (p : ℕ),
        v ∈ t.leaves → K_A t p = 1 → t.a v p < 0 → t.a (t.support v) p < 0 := by
  unfold AlphaTarget
  constructor
  · intro h t v p hv hk ha
    have hid := t.a_support_eq_a_add_b_sub_Bgen hv p
    have hslack := h t v p hv hk ha
    omega
  · intro h t v p hv hk ha
    have hid := t.a_support_eq_a_add_b_sub_Bgen hv p
    have hconcl := h t v p hv hk ha
    omega

/-! ## The `k_A ≥ 2` condition theorem, (β) -/

/-- **PROOF TARGET (β), `STUDY-INTERLUDE-1.md` §4 verbatim.** For a leaf
`v` with `s := t.support v`, `p` with `k_A ≥ 2`, and `t.a v p < 0`: the
naive sufficient condition itself holds, `t.b v p ≤ t.Bgen s (p−1)`.

**NOT ASSERTED. A bare `Prop`**, matching (α)'s recording convention. No
proof attempted; see the `.md` report. -/
def BetaTarget : Prop :=
  ∀ (t : RTree) (v : List ℕ) (p : ℕ),
    v ∈ t.leaves → 2 ≤ K_A t p → t.a v p < 0 →
      t.b v p ≤ t.Bgen (t.support v) ((p : ℤ) - 1)

/-- **The falsifiable signature for (β), declared before any measurement.**
A single `(t,v,p)` with `k_A ≥ 2`, `a_v(p) < 0`, and the naive condition
failing, falsifies `BetaTarget` — a DECISIVE EVENT. Horizon: `FC-R12-8`'s
own per-`k_A` table records `fails_fav = 0` for every `k_A ∈ {2,…,9}`
pooled over the full order-1–20 census plus the five K–L fixtures — a
bounded zero, evidence of nothing beyond itself (the table's own
aggregation caveat, `C2-AMD-3`, applies: this is an aggregate, not a
per-cell figure of record). -/
def BetaCounterexample (t : RTree) (v : List ℕ) (p : ℕ) : Prop :=
  v ∈ t.leaves ∧ 2 ≤ K_A t p ∧ t.a v p < 0 ∧
    ¬ (t.b v p ≤ t.Bgen (t.support v) ((p : ℤ) - 1))

/-- **PROVED: `BetaCounterexample` is exactly `BetaTarget`'s pointwise
negation** — immediate from `BetaTarget`'s own shape (no `T1` transport
needed here, unlike (α), since (β)'s conclusion already IS the bound). -/
theorem betaCounterexample_iff_not (t : RTree) (v : List ℕ) (p : ℕ) :
    BetaCounterexample t v p ↔
      (v ∈ t.leaves ∧ 2 ≤ K_A t p ∧ t.a v p < 0) ∧
        ¬ (t.b v p ≤ t.Bgen (t.support v) ((p : ℤ) - 1)) := by
  unfold BetaCounterexample; tauto

/-! ## The conditional composition to (A) at leaf-witnessed favorable
supports, `k_A ≥ 1` — `STUDY-INTERLUDE-1.md` §4's own rationale, mechanized -/

/-- **PROVED, conditionally: `BetaTarget` (if it held) plus the governed
`T2` would discharge the leaf-witnessed form of (A) at every `k_A ≥ 2`.**
`hB` is a HYPOTHESIS here, never established; this theorem asserts nothing
about whether `BetaTarget` is true. Pure composition of `hB` with the
already-governed `a_support_neg_of_favorable_and_bBound` (`T2`). -/
theorem stmtA_leafWitnessed_of_beta_kA_ge_two (hB : BetaTarget) :
    ∀ (t : RTree) (v : List ℕ) (p : ℕ),
      v ∈ t.leaves → 2 ≤ K_A t p → t.a v p < 0 → t.a (t.support v) p < 0 := by
  intro t v p hv hk ha
  exact t.a_support_neg_of_favorable_and_bBound hv ha (hB t v p hv hk ha)

/-- **PROVED, conditionally: `AlphaTarget ∧ BetaTarget` (if both held)
would discharge the leaf-witnessed form of (A) at EVERY `k_A ≥ 1`** — the
exact mechanized form of `STUDY-INTERLUDE-1.md` §4's closing rationale,
"Together they discharge (A) at every leaf-witnessed favorable support —
the sharpest available route to (A) that never touches the reserved
zone." Both `hA` and `hB` are HYPOTHESES; this theorem does not assert,
prove, or make progress toward either one, and it does not assert (A),
`CMP-A`, `CMP-B`, or `O3` — it packages the interlude's own stated logical
structure as a checked fact, so that a future cycle discharging
`AlphaTarget` and `BetaTarget` gets this composition for free rather than
re-deriving it. -/
theorem stmtA_leafWitnessed_of_alpha_beta (hA : AlphaTarget) (hB : BetaTarget) :
    ∀ (t : RTree) (v : List ℕ) (p : ℕ),
      v ∈ t.leaves → 1 ≤ K_A t p → t.a v p < 0 → t.a (t.support v) p < 0 := by
  intro t v p hv hk ha
  by_cases h2 : 2 ≤ K_A t p
  · exact stmtA_leafWitnessed_of_beta_kA_ge_two hB t v p hv h2 ha
  · have hk1 : K_A t p = 1 := by omega
    exact (alphaTarget_iff_stmtA_leafWitnessed_kA_eq_one.mp hA) t v p hv hk1 ha

end RTree
end
