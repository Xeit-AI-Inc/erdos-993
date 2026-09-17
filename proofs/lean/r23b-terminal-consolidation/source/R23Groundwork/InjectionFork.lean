import R23Groundwork.Theorems

/-!
# C3-T6 (LC-G) — the explicit-injection fork of `THM-R23-C`

Charge (`control/CYCLE3-ALLOCATION.md` §C3-T6): `THM-R23-C` via a
constructed injection `P → N` — the injection hypothesis carries NO
subset-quantified condition, so it is untouched by the A2.2 refutation of
the literal all-cut Hall mechanism — preferring
`Finset.all_card_le_biUnion_card_iff_existsInjective'` where a Hall form
is needed.

Mode convention: `xOf` encodes `x(T)` = FIRST STRICT DESCENT (first
`k ≥ 0` with `Δ_k(T) < 0`), per `SEMANTIC-CONTRACT.md` §2; first and last
global modes are different objects and are not used here.

Scope [A1.1]: every theorem below is stated on the C1-T6 `Graph (n)`
encoding (`Graph.lean`/`Tree.lean`/`Relation.lean`, byte-identical copies
of the sealed C2-T2 evidence). Identification with `SEMANTIC-CONTRACT.md`
§2–§4 on ordinary trees additionally needs `support v = s_v`,
`xOf = x(T)`, and the A1.1 RTree-transfer premise — exactly the C3-T1
(LC-A) charge, not consumed and not assumed here.

A2.2 fence compliance: nothing below asserts, searches for, or re-opens
the universal all-cut Hall statement. `THM_R23_C_hall_discharged` proves
the CONDITIONAL retained live by A2.2 ("THM-R23-C as a conditional"): its
antecedent `HallCondition p` is REFUTED as a universal at literal
ordinary-tree scope (order-91 T22, p = 34, no-branch-center cut — the
dead branch), so the theorem is cited only per-row, on rows where the
antecedent is separately established; a deficient cut refutes the
mechanism, never `O14`. Both the mechanism-side and target-side values
are always reported on the same row by the run's evaluators, not here.

Dependency note (R23-C2-09; docstring currency C4-T1): none of these
proofs uses `THM_R23_A` or any `sorry`-carrying declaration — the only
load-bearing prior result is `bridge2_proof` (BRIDGE-2, sorry-free,
`Bridge.lean`). (The sealed C3-T6 copy of this note said `THM_R23_A` was
"still `sorry` in `Theorems.lean` at this pin's copy" — TRUE of the
C2-era copy that project sat on, and NO LONGER TRUE here: in this GRAND
MERGE `Theorems.lean` carries the completed thirteen-conjunct
`THM_R23_A`, proved, and no `sorry` exists anywhere in the project.)
Per-declaration `#print axioms` receipts: this merged project's single
axioms report (`GrandAxioms.lean` output in the C4-T1 evidence).

**C4-T1 GRAND-MERGE note.** This file is C3-T6's sealed
`InjectionFork.lean` (sha256
`81177d16938fdd1fdf490fb177a5e3674e8f99c257ac3544192641a94449468c`)
with two delta classes, disclosed: (i) the docstring-currency repairs
marked `(C4-T1)`; (ii) ONE new declaration of merge glue at the end —
the contract-facing name `THM_R23_C`, now PROVED by citing
`THM_R23_C_hall_discharged` (statement identical to the C1/C2/C3
statement-only `sorry` form that C3-T2's merge removed; C3-T6's own
evidence mechanically confirmed the statement identity). Everything
else is the sealed C3-T6 text.

Nothing here is `formally_verified` in the VerityOS sense (no
`lean-proof-workflow` closeout ran): Lean-kernel-checked groundwork.
-/

namespace R23
namespace Graph

variable {n : ℕ} (G : Graph n)

/-- `outEdges p x ⊆ N p`, unconditionally: `outEdges` is literally a
    `filter` on `N p` (`Relation.lean`). This is why NO totality clause of
    `THM-R23-A` is needed anywhere below (R23-C2-09's "removable
    dependency", realized). -/
theorem outEdges_subset_N (p : ℕ) (x : Fin n × Finset (Fin n)) :
    G.outEdges p x ⊆ G.N p :=
  Finset.filter_subset _ _

/-- **LC-G core statement — the constructed-injection form of
    `THM-R23-C`.** [A1.1]

    If SOME function `f` maps `P p` into `N p` injectively-on-`P p`, then
    `S(T,p) ≤ 0`. The hypothesis quantifies over NO subsets of `P p`; it
    is strictly weaker than all-cut Hall (by
    `Finset.all_card_le_biUnion_card_iff_existsInjective'`'s reverse
    direction an all-cut-Hall relation yields such an `f`, but `f` here
    need not respect `Delete ∪ Retag` or any relation at all), and it is
    exactly as strong as the row demand `|P| ≤ |N|`
    (`injection_nonempty_iff_S_nonpos` below). `hT` is carried on the
    signature per the contract's `THM-R23-C` shape; the proof does not
    consume it (the same broadening already registered for BRIDGE-2,
    R23-C2-02). -/
theorem THM_R23_C_of_injOn (_hT : G.IsTree) (p : ℕ) (hp : p ≥ G.xOf + 2)
    (f : Fin n × Finset (Fin n) → Fin n × Finset (Fin n))
    (hmaps : ∀ x ∈ G.P p, f x ∈ G.N p)
    (hinj : Set.InjOn f (G.P p)) :
    G.S p ≤ 0 := by
  have hcard : (G.P p).card ≤ (G.N p).card :=
    Finset.card_le_card_of_injOn f hmaps hinj
  have hb2 : ((G.P p).card : ℤ) - ((G.N p).card : ℤ) = G.S p :=
    G.bridge2_proof p hp
  omega

/-- Embedding form: a mere `Nonempty` embedding of the coerced types
    suffices. [A1.1] -/
theorem THM_R23_C_of_embedding (_hT : G.IsTree) (p : ℕ) (hp : p ≥ G.xOf + 2)
    (h : Nonempty ({x // x ∈ G.P p} ↪ {y // y ∈ G.N p})) :
    G.S p ≤ 0 := by
  obtain ⟨e⟩ := h
  have hcard : (G.P p).card ≤ (G.N p).card := by
    have := Fintype.card_le_of_embedding e
    rwa [Fintype.card_coe, Fintype.card_coe] at this
  have hb2 : ((G.P p).card : ℤ) - ((G.N p).card : ℤ) = G.S p :=
    G.bridge2_proof p hp
  omega

/-- **The no-intermediate-lemma fact.** [A1.1] On a governed row the
    injection-existence hypothesis is EQUIVALENT to `S(T,p) ≤ 0`, i.e. to
    the `O14` row itself (via BRIDGE-2). So the explicit-injection fork
    admits no unconditional discharge short of the target: any
    construction of an injection `P ↪ N` on all governed rows IS a proof
    of the per-row `O14` demand, and conversely. The earliest unproved
    lemma of the unconditional fork is therefore exactly the row demand
    `|P| ≤ |N|` — there is no smaller one. -/
theorem injection_nonempty_iff_S_nonpos (_hT : G.IsTree) (p : ℕ)
    (hp : p ≥ G.xOf + 2) :
    Nonempty ({x // x ∈ G.P p} ↪ {y // y ∈ G.N p}) ↔ G.S p ≤ 0 := by
  have hb2 : ((G.P p).card : ℤ) - ((G.N p).card : ℤ) = G.S p :=
    G.bridge2_proof p hp
  constructor
  · intro h
    exact G.THM_R23_C_of_embedding _hT p hp h
  · intro hS
    have hcard : (G.P p).card ≤ (G.N p).card := by omega
    have : Fintype.card {x // x ∈ G.P p} ≤ Fintype.card {y // y ∈ G.N p} := by
      rwa [Fintype.card_coe, Fintype.card_coe]
    exact Function.Embedding.nonempty_of_card_le this

/-- Hall condition transported to the subtype indexing that
    `Finset.all_card_le_biUnion_card_iff_existsInjective'` wants:
    `ι := {x // x ∈ P p}`, `t x := outEdges p x.1`. Pure re-indexing —
    `Subtype.val` is injective and `image`/`biUnion` commute. -/
theorem hallCondition_subtype (p : ℕ) (hHall : G.HallCondition p) :
    ∀ s : Finset {x // x ∈ G.P p},
      s.card ≤ (s.biUnion (fun x => G.outEdges p x.1)).card := by
  intro s
  have himg : s.image Subtype.val ⊆ G.P p := by
    intro y hy
    obtain ⟨x, _, rfl⟩ := Finset.mem_image.mp hy
    exact x.2
  have hcards : (s.image Subtype.val).card = s.card :=
    Finset.card_image_of_injective s Subtype.val_injective
  have hbu : (s.image Subtype.val).biUnion (fun x => G.outEdges p x)
      = s.biUnion (fun x => G.outEdges p x.1) :=
    Finset.image_biUnion
  have h := hHall (s.image Subtype.val) himg
  rw [hcards, hbu] at h
  exact h

/-- **`THM-R23-C` discharged (the conditional retained by A2.2).** [A1.1]
    Statement identical to `Theorems.lean`'s `sorry`-carrying `THM_R23_C`.
    Route: `HallCondition p` → subtype re-indexing
    (`hallCondition_subtype`) → the PRIMED finite Hall theorem
    `Finset.all_card_le_biUnion_card_iff_existsInjective'` (R23-C2-39's
    preferred form: `[Finite ι]`, no Tychonoff import) → an injective
    system of distinct representatives landing in `outEdges ⊆ N p` →
    `THM_R23_C_of_injOn`. The all-cut hypothesis is used ONLY as a
    hypothesis; it is refuted as a universal at literal ordinary-tree
    scope (A2.2) and is never asserted. -/
theorem THM_R23_C_hall_discharged (hT : G.IsTree) (p : ℕ)
    (hp : p ≥ G.xOf + 2) :
    G.HallCondition p → G.S p ≤ 0 := by
  intro hHall
  obtain ⟨f, hfinj, hfmem⟩ :=
    (Finset.all_card_le_biUnion_card_iff_existsInjective'
      (fun x : {x // x ∈ G.P p} => G.outEdges p x.1)).mp
      (G.hallCondition_subtype p hHall)
  -- Repackage the subtype-indexed injective SDR as an `InjOn` function on
  -- `P p` via `Function.extend Subtype.val f id` (total, no choice on
  -- membership proofs needed beyond `Classical` already in scope).
  classical
  set g : Fin n × Finset (Fin n) → Fin n × Finset (Fin n) :=
    Function.extend Subtype.val f id with hg
  have hgeq : ∀ x : {x // x ∈ G.P p}, g x.1 = f x := by
    intro x
    have h := Function.Injective.extend_apply Subtype.val_injective f id x
    rw [hg]
    exact h
  have hmaps : ∀ y ∈ G.P p, g y ∈ G.N p := by
    intro y hy
    have h1 : g y = f ⟨y, hy⟩ := hgeq ⟨y, hy⟩
    rw [h1]
    exact G.outEdges_subset_N p y (hfmem ⟨y, hy⟩)
  have hinj : Set.InjOn g (G.P p) := by
    intro y1 hy1 y2 hy2 heq
    have h1 : g y1 = f ⟨y1, hy1⟩ := hgeq ⟨y1, hy1⟩
    have h2 : g y2 = f ⟨y2, hy2⟩ := hgeq ⟨y2, hy2⟩
    have : f ⟨y1, hy1⟩ = f ⟨y2, hy2⟩ := by rw [← h1, ← h2]; exact heq
    have := hfinj this
    exact congrArg Subtype.val this
  exact G.THM_R23_C_of_injOn hT p hp g hmaps hinj

/-- **`THM-R23-C` at the contract-facing name, PROVED (C4-T1 merge
    glue).** [A1.1] Statement byte-identical to the statement-only
    (`sorry`) `THM_R23_C` of the C1/C2 `Theorems.lean` (removed at the
    C3-T2 merge because that artifact was chartered sorry-free); the
    proof is a citation of `THM_R23_C_hall_discharged` above.

    Adjudicated reading, BINDING on every citation of this theorem
    (C3-LEDGER `R23B-C3-T6-03`, verbatim scope): "THM-R23-C discharged
    AS A CONDITIONAL (Hall-antecedent form, statement identical to the
    sealed `THM_R23_C`) and in an arbitrary-injection hypothesis form;
    no injection was constructed; the unconditional
    constructed-injection fork remains OPEN, with the earliest unproved
    lemma of the relation-respecting fork still unidentified." Its
    antecedent `HallCondition p` is REFUTED as a universal at literal
    ordinary-tree scope (A2.2, the dead branch) and is consumed here
    only as a hypothesis — this theorem is cited per-row, on rows where
    the antecedent is separately established; a deficient cut refutes
    the mechanism, never `O14`. Additionally binding (`R23B-C3-T6-02`):
    the relation-free equivalence `injection_nonempty_iff_S_nonpos` must
    not be cited as closing LC-G or as evidence the injection route is
    exhausted. -/
theorem THM_R23_C (hT : G.IsTree) (p : ℕ) (hp : p ≥ G.xOf + 2) :
    G.HallCondition p → G.S p ≤ 0 :=
  G.THM_R23_C_hall_discharged hT p hp

/-- Mechanical statement-identity confirmation WITHIN this merged project
    (required shape per the sealed C4-F2 return, F-2): the contract-facing
    `THM_R23_C` and `THM_R23_C_hall_discharged` are definitionally
    identical here. This does NOT re-certify R23B-C3-T6-01's identity to
    the sealed C2-T2 statement — that statement changed meaning under the
    merged three-conjunct `IsTree` (statement-delta table row 18); the
    sealed-scope citation carries the declared referent delta. -/
example : @THM_R23_C = @THM_R23_C_hall_discharged := rfl

end Graph
end R23
