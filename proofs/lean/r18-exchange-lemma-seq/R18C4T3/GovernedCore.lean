import R14C4T.ShadowBand

/-!
# R18C4-T3 — GATE-2 scoped Lean: the governed deletion identity `(★)`

**Route `R18C4-T3`, r18 Cycle 4, stage-3, isolated. AMD-9 role/effort line:
model `Sonnet 5`, effort `xhigh`; exact resolved model identifier
`claude-sonnet-5` (Anthropic's naming for this session; disclosed on the
face, not silently accepted). Orientation: T (toward `HG2`) — protected;
this route builds toward the object at exact scope and adopts no sibling
conclusion.**

Charge: `CYCLE4-ALLOCATION.md` seat T-3, `GATE-2` scoped Lean
(`cycles/cycle-3/C3-GATE-RECORD.md` §2): "the premise-free durable core
only — the deletion identity `(★)`, the two closed forms
(`|Rem_j| = n−2−j−deg_T(z_j)`; band-eligibility ⟺
`deg_T(z_j) ≥ k_shell+t+2−j`), and `E993-EXCHANGE-LEMMA` — objects that
survive regardless of S-1's ultimate fate." NOT in scope: any
`(★★)`/`Σ_{J0}`-discharge statement, and nothing that touches the fence.

## Why `(★)` is a `def`, never a `theorem`, and why this route does not
attempt to re-derive it

`(★)` is `FC-R14-10` BF-3's formula, instantiated at rank `(p−1,p−2)`:

- General-rank form, verbatim (`cycles/cycle-1/stage3/R18C1-T1.md:131-136`,
  sealed, CONSUMED not re-derived): `Δ_k(W∖g) = Δ_k(U) + Σ_j Δ_{k−1}(Q_j)`,
  branch remnants `Q_j := V_{j−1}∖N[z_j]` (peeling `g`'s neighbors
  `z_1,...,z_t` inside `W∖g` one at a time). The same file records BF-3's
  own disclosure: "Two continuations refused in advance: sequence-shape ⟹
  F1/F2; **root-state recursion ⟹ reserved I/A/B**." Deriving `(★)` from
  `RTree`'s single-vertex deletion recursion
  (`R12C6T.Deg2Reduction.DeltaOn_eq_add_Bgen_on`) applied across a whole
  branch (`N[z_j]`, not a single vertex) requires walking `z_j`'s own
  rooted subtree — exactly the reserved `Ipoly_node`/`Apoly_node`/
  `Bpoly_node` recursion this run bars every seat, T or F, from touching
  without a controller release. **This route does not attempt that
  derivation.**
- Instantiated form at `k = p−1` (`cycles/cycle-2/stage3/R18C2-T1.md:
  118-122`, sealed, CONSUMED, renaming `Q_j ↦ Rem_j` per RUL-C1-3):
  `Δ_{p−1}(W∖g) = Δ_{p−1}(U) + Σ_{j=1}^{t} Δ_{p−2}(Rem_j)` — the exact
  form this file transcribes.

**Consume, cite, do not re-derive** (`CYCLE4-ALLOCATION.md` seat T-3's own
language). `GovernedDeletionIdentity` below is therefore a **structure-
carrying `def : Prop`**, the RUL-T3-c gold standard GATE-1 already
established for exactly this situation (`R18C3-T3.md` §4): every quantity
is bound to a REAL governed object — `t : RTree` the real inductive tree,
`W U : Finset (List ℕ)` and `Rem : ℕ → Finset (List ℕ)` real vertex-address
Finsets, `t.DeltaOnZ` the real governed operator
(`R12C6T.CorridorIngredients.DeltaOnZ`) applied to real Finsets at real
integer ranks — never a severed numeric field standing in for an
unevaluated `Δ`, the exact defect that struck `HG2SurvivingRegion` /
`SurvivingRegionD2Faithful` at C1/C2. The partition linking `W`, `g`, `U`,
and the `Rem_j`'s is stated as an explicit hypothesis (`hdisj`/`hcover`)
rather than left an unconstrained relationship between the parameters.

**Ceiling on this object, stated on its own face:** `GovernedDeletionIdentity`
is a `def`, never a `theorem`. It proves nothing about `HG2`, `(★★)`,
`AmbientTargetDeg2`, or any target; it asserts nothing about which real
`(t, p, W, U, g, Rem)` tuples satisfy it. It is a name for the sealed
identity's SHAPE, citing the sealed record as its source of truth.
-/

namespace R18C4T3

open RTree

/-- **Governed deletion identity `(★)`**, instantiated at rank `(p−1,p−2)`
(`GATE-2` §2 item 1). Sealed source: `cycles/cycle-1/stage3/R18C1-T1.md`
:131-136 (general-rank `FC-R14-10` BF-3) and `cycles/cycle-2/stage3/
R18C2-T1.md`:118-122 (the `k=p−1` instantiation, `Q_j ↦ Rem_j` renaming
per RUL-C1-3) — CONSUMED verbatim, cited, not re-derived (see the module
docstring above for exactly why: the derivation walks the reserved
rooted-recursion zone).

Parameters, each bound to a real governed object:
- `t : RTree` — the real tree.
- `p tCount : ℕ` — the target-family index `p`, and `t` the number of
  `g`'s other neighbors (named `tCount` here to avoid colliding with the
  bound variable `t : RTree`; the sealed record's own `t := deg_T(g)−1`,
  `R18C2-T1.md:173`).
- `W U : Finset (List ℕ)` — the sealed `W`, `U` vertex sets.
- `g : List ℕ` — the sealed `g`, the neighbor of `s := support(v)` other
  than the deleted leaf's support edge.
- `Rem : ℕ → Finset (List ℕ)` — the branch remnants, indexed `1,...,tCount`
  exactly as the sealed record indexes them (`Σ_{j=1}^{t}`).
- `hdisj` — the `Rem_j`'s are pairwise disjoint (the sealed record's own
  "no two `z_i` are adjacent in a tree" fact, `R18C2-T1.md:280-282`,
  consumed as the STRUCTURAL hypothesis it licenses — this route does not
  reprove non-adjacency, only states the disjointness it is used for).
- `hUdisj` — `U` is disjoint from every `Rem_j` (the peeling's terminal
  residual is disjoint from every branch it produced).
- `hcover` — `W` with `g` removed is exactly `U` together with all the
  `Rem_j`'s (the peeling accounts for every vertex of `W∖g` exactly once).

Under these hypotheses, `(★)` states the real `DeltaOnZ` additivity:
`Δ_{p−1}(W∖g) = Δ_{p−1}(U) + Σ_{j=1}^{tCount} Δ_{p−2}(Rem_j)`. -/
def GovernedDeletionIdentity
    (t : RTree) (p tCount : ℕ) (W U : Finset (List ℕ)) (g : List ℕ)
    (Rem : ℕ → Finset (List ℕ))
    (hdisj : ∀ i ∈ Finset.Icc 1 tCount, ∀ j ∈ Finset.Icc 1 tCount, i ≠ j →
      Disjoint (Rem i) (Rem j))
    (hUdisj : Disjoint U ((Finset.Icc 1 tCount).biUnion Rem))
    (hcover : W.erase g = U ∪ (Finset.Icc 1 tCount).biUnion Rem) : Prop :=
  t.DeltaOnZ (W.erase g) ((p : ℤ) - 1) =
    t.DeltaOnZ U ((p : ℤ) - 1) +
      ∑ j ∈ Finset.Icc 1 tCount, t.DeltaOnZ (Rem j) ((p : ℤ) - 2)

/-- **Internal consistency sanity check, this route's own addition (new
relative to the sealed record; not requested by the charge, offered as a
cheap kernel-checked well-formedness witness in RUL-T3-c's spirit).** At
`tCount = 0` (no branch remnants — `g` has no other neighbors) the
partition hypothesis collapses to `W.erase g = U`, the sum is empty, and
`(★)` reduces to `Δ_{p−1}(W∖g) = Δ_{p−1}(U)`, which is then IMMEDIATE from
`hcover` by `congrArg`. This is a real `theorem`, kernel-checked: it shows
`GovernedDeletionIdentity` is not vacuously false or ill-typed at its
degenerate boundary case. It proves nothing about `HG2`, `(★)` at
`tCount ≥ 1`, or any target — a structural sanity check on the
TRANSCRIPTION only. -/
theorem governedDeletionIdentity_holds_at_tCount_zero
    (t : RTree) (p : ℕ) (W U : Finset (List ℕ)) (g : List ℕ)
    (Rem : ℕ → Finset (List ℕ)) (hcover0 : W.erase g = U) :
    GovernedDeletionIdentity t p 0 W U g Rem
      (by simp)
      (by simp)
      (by simpa using hcover0) := by
  unfold GovernedDeletionIdentity
  simp [hcover0]

end R18C4T3
