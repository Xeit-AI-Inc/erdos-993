import R16C2T
import R16C3N

/-!
# R16C3T — the general block-family side: W1-general extraction, the general
# block-evaluation lemma (σ4+), and the general lawful pack (r16 Cycle 3,
# route R16C3-T)

PROTOTYPE (grade `RG` AT BEST after critics and a gate act; nothing here is
`governed`; nothing is ever `formally_verified`).

## Ceiling honesty (undetachable)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE open before and after.
`AmbientTargetDeg2`, (α), (β), (A), (B) are targets never asserted; nothing
below proves, or claims to prove, any of them, and nothing below closes G1:
the payoff wrapper `G1_closure_general` keeps PREMISE K (`hKL`), K-SCOPE
(`hKSCOPE`) and the crossing bound (`hx`) live on the face —
`hKL`/`hKSCOPE`/`hx` are NEVER discharged (F-b of record). PREMISE K is
never kernel-imported. No bounded zero is cited; no measurement is run. No
claim on G2; the open `HG2` region is not mentioned.

## NO SHIMS (restated and honored)

The r14 Interlude-1 ruling-3 prohibition stands; the criterion of record is
FC-R16-2 (five heads). Nothing here assumes or axiomatizes a cross-world
correspondence. This module imports the T-lineage (through the sealed
`R16C2T`, consumed READ-ONLY at GATE-R16-KEYSTONE standing) plus the
world-neutral `R16C3N` — NEVER the P-world. The bridge
`addrAdjacent u w ↔ R16C3.nbAdjacent u w` below is an `Iff.rfl`-level
kernel theorem proved INSIDE this world's import closure (the head-2
meeting-on-neutral-data pattern; see the R16C3N header disclosure).

## What this module contributes (the C2-AMD-1 remainder (i))

1. **W1-general**: the block family is `R16C3.nbComponents U` — the
   connected components of `U = t.ResidualAmbient v g` under restricted
   adjacency, extracted definitionally (classes of the `ReflTransGen`
   closure, the C2-AMD-3 elected compiled form) — with the four s-laws L1,
   L2, L3, L3′ PROVED for the extraction at any `(t, v, g)`, at any size
   (L3′ by the neutral edge-count structure theorem: the acyclicity is the
   address forest's own, inherited from `t`'s address discipline).
2. **σ4+ closed by a general block-evaluation lemma**: `seqOn t V =
   nbSeqOn V` for ANY `V ⊆ t.vertices` — per-block evaluation at EVERY
   block order at once (superseding shape-by-shape enumeration).
3. **The general lawful pack**: `packGeneral t v g` :=
   `⟨nbComponents U, nbSeqOn, ordCard⟩`, with `packGeneral_lawful : ∀ t v
   g, LawfulT t v g (packGeneral t v g)` — L1–L7 discharged
   UNCONDITIONALLY at any size through the consumed keystone `lawfulT_mk`
   (cited strictly per its C2-AMD-1 scope of record).
4. The σ4 concrete non-vacuity witness (C1-AMD-4): `tPath5` with an
   order-3 path block, its computed residual, the pack-data identity, and
   three kernel anchor equalities (ranks 1–3) through the compiled L5.

LAW IV′ for the same neutral data triple is the P-world module `R16C3P`'s
duty — this module cannot see it (the clash of record), and no sentence
below asserts the composed constructor; the composition statement of record
lives in the route deliverable with the five-head check.

## Fence check (per-object)

No computation, `#eval`, `decide`, `native_decide`, search, or sampling.
F1/F2: unimodality/log-concavity appear ONLY as the live hypothesis slots
of the consumed payoff (`hKL`); no statement concludes either of any
object. F3–F12, the r12/r13 transitive kills, the r13 one-move charge:
none invoked. Reserved zone: no proof mentions, unfolds, or invokes
`Ipoly`/`Apoly`/`Bpoly`/`Fpoly`, the availability recursion, any
blocked-root state, or any subtraction across the I/A/B split; the r12
Q1–Q6 boundary travels verbatim and is not approached.

## Consumed vs fresh

Consumed (READ-ONLY, at ruled standings): the sealed `R16C2T` module —
`lawfulT_mk` (FC-R16-3, scope per C2-AMD-1), the frozen type and laws,
`seqOn`/`indepFamilyOn`, `mem_vertices_of_mem_residual`,
`closedNbhd_root_eq`, `tPath4`/`vertices_p4`, `G1_closure_of_lawful`; the
T-lineage beneath it. Fresh: the definitional extraction transports
(`lawL1_components` … `lawL3'_components`), the general evaluation lemma
`seqOn_eq_nbSeqOn`, the general pack and its lawfulness, the σ4 concrete
layer. The neutral engine (components, structure theorem, edge count,
`nbSeqOn`) is consumed from `R16C3N` (this route's own neutral module).

## Invariance

`packGeneral` is a function of `(t, v, g)` only, through the residual's own
components — no vertex ordering, no representative indexing, no address
convention beyond the inherited labels. Every existential witness is
exhibited; no concluded property depends on the exhibition (A16).
-/

open scoped Classical
open Erdos993C8U1
noncomputable section

namespace R16C3

open R16C2

/-! ## §1 — The definitional bridge (T-world half; `Iff.rfl`-level) -/

/-- The T-lineage's inherited `addrAdjacent` IS the neutral `nbAdjacent`,
formula for formula — a definitional-unfolding kernel theorem inside the
T-world closure (never a stipulation). -/
theorem addr_iff_nb (u w : List ℕ) : addrAdjacent u w ↔ nbAdjacent u w :=
  Iff.rfl

/-! ## §2 — The general block-evaluation lemma (σ4+ closed at all orders) -/

/-- **`seqOn` evaluates to the neutral `nbSeqOn` on any vertex subset.**
For `V ⊆ t.vertices` the membership constraint in `IndepSet` is absorbed,
and what remains is the neutral adjacency-freeness — so the canonical
per-block sequence is a WORLD-NEUTRAL closed term. This is the general
block-evaluation lemma the C2 record named as the σ4+ requirement: it
covers order-≥3 blocks (and every other order) at once. -/
theorem seqOn_eq_nbSeqOn (t : RTree) (V : Finset (List ℕ)) (hV : V ⊆ t.vertices) :
    seqOn t V = nbSeqOn V := by
  unfold R16C2.seqOn nbSeqOn
  congr 1
  unfold R16C2.indepFamilyOn nbIndepFamily
  apply Finset.filter_congr
  intro S hS
  rw [Finset.mem_powerset] at hS
  constructor
  · intro h
    exact h.2
  · intro h
    exact ⟨hS.trans hV, h⟩

/-! ## §3 — W1-general: the four s-laws for the definitional extraction -/

/-- **L1 for the extraction, at any `(t, v, g)`, any size.** -/
theorem lawL1_components (t : RTree) (v g : List ℕ) :
    LawL1 t v g (nbComponents (t.ResidualAmbient v g)) := by
  refine ⟨?_, ?_, ?_⟩
  · exact nbComponents_sup _
  · exact nbComponents_disjoint _
  · exact empty_notMem_nbComponents _

/-- **L2 for the extraction, at any `U`, any size.** -/
theorem lawL2_components (U : Finset (List ℕ)) : LawL2 (nbComponents U) := by
  intro C hC C' hC' hne u hu w hw hadj
  exact nbComponents_no_cross U C hC C' hC' hne u hu w hw ((addr_iff_nb u w).mp hadj)

/-- **L3 for the extraction, at any `U`, any size** (the C2-AMD-3 elected
compiled form: `ReflTransGen` of block-restricted adjacency). -/
theorem lawL3_components (U : Finset (List ℕ)) : LawL3 (nbComponents U) := by
  intro C hC u hu w hw
  exact nbComponents_connected U C hC u hu w hw

/-- **L3′ for the extraction, at any `U`, any size** — the frozen edge-count
form, from the neutral structure theorem. The acyclicity here is the address
forest's own (every non-root block member contributes exactly its inherited
parent edge): the transport from `t` is through the inherited labels, per
gate note G-3. -/
theorem lawL3'_components (U : Finset (List ℕ)) : LawL3' (nbComponents U) := by
  intro C hC
  have h := treeBlock_edge_count (nbComponents_isTreeBlock U C hC)
  have hfeq : ((C ×ˢ C).filter (fun p => addrAdjacent p.1 p.2))
      = ((C ×ˢ C).filter (fun p => nbAdjacent p.1 p.2)) := by
    apply Finset.filter_congr
    intro p _
    exact addr_iff_nb p.1 p.2
  rw [hfeq]
  exact h

/-- The per-block evaluation hypothesis of the keystone, discharged for the
extraction at any `(t, v, g)` by the general block-evaluation lemma. -/
theorem hf_components (t : RTree) (v g : List ℕ) :
    ∀ C ∈ nbComponents (t.ResidualAmbient v g), nbSeqOn C = seqOn t C := by
  intro C hC
  have hsub : C ⊆ t.vertices := by
    intro z hz
    exact mem_vertices_of_mem_residual t v g z (mem_of_mem_nbComponents hC hz)
  exact (seqOn_eq_nbSeqOn t C hsub).symm

/-! ## §4 — THE GENERAL LAWFUL PACK (the T-side of the constructor, closed) -/

/-- **The general pack**: the residual's own components, the neutral
per-block sequence, the frozen `ord` binding — all three fields world-neutral
base data (`nbComponents U`, `nbSeqOn`, `ordCard`). -/
def packGeneral (t : RTree) (v g : List ℕ) : ResidualIdentification t v g :=
  ⟨nbComponents (t.ResidualAmbient v g), nbSeqOn, ordCard⟩

/-- **The T-side of the constructor at FULL GENERALITY: for EVERY
`(t, v, g)` — at any size, with no bound on residual cardinality, block
count, block order, or block shape — the general pack satisfies ALL of
L1–L7.** Through the consumed keystone `lawfulT_mk` (cited per its
C2-AMD-1 scope of record), from the four s-laws for the definitional
extraction (§3) plus the general block-evaluation lemma (§2). This
discharges remainder (i) of the C2-AMD-1 scope statement. It asserts
NOTHING about LAW IV′ (P-world; this module cannot see it) and NOTHING
about any target. -/
theorem packGeneral_lawful (t : RTree) (v g : List ℕ) :
    LawfulT t v g (packGeneral t v g) :=
  lawfulT_mk t v g (nbComponents (t.ResidualAmbient v g)) nbSeqOn ordCard
    (lawL1_components t v g) (lawL2_components _) (lawL3_components _)
    (lawL3'_components _) (hf_components t v g) (fun C _ => rfl)

/-! ## §5 — σ4 CONCRETE (C1-AMD-4): `P₅` rooted at an end, order-3 path
block -/

/-- `P₅` rooted at an end (one child chain of depth 4). -/
def tPath5 : RTree := RTree.node [tPath4]

theorem vertices_p5 :
    tPath5.vertices = {([] : List ℕ), [0], [0, 0], [0, 0, 0], [0, 0, 0, 0]} := by
  ext w
  rw [tPath5, RTree.mem_vertices_node]
  constructor
  · rintro (rfl | ⟨i, p, hp, rfl⟩)
    · simp
    · fin_cases i
      simp only [List.get] at hp ⊢
      rw [vertices_p4] at hp
      simp only [Finset.mem_insert, Finset.mem_singleton] at hp
      rcases hp with rfl | rfl | rfl | rfl <;> simp
  · intro hw
    simp only [Finset.mem_insert, Finset.mem_singleton] at hw
    rcases hw with rfl | rfl | rfl | rfl | rfl
    · exact Or.inl rfl
    · refine Or.inr ⟨⟨0, by simp⟩, [], ?_, rfl⟩
      simp only [List.get]
      rw [vertices_p4]
      simp
    · refine Or.inr ⟨⟨0, by simp⟩, [0], ?_, rfl⟩
      simp only [List.get]
      rw [vertices_p4]
      simp
    · refine Or.inr ⟨⟨0, by simp⟩, [0, 0], ?_, rfl⟩
      simp only [List.get]
      rw [vertices_p4]
      simp
    · refine Or.inr ⟨⟨0, by simp⟩, [0, 0, 0], ?_, rfl⟩
      simp only [List.get]
      rw [vertices_p4]
      simp

/-- The σ4 residual: an order-3 path block (non-degenerate; `v = g = []`,
the residual carries the semantic content). -/
theorem residual_tPath5 :
    tPath5.ResidualAmbient [] [] = sSigma4block := by
  unfold RTree.ResidualAmbient
  rw [closedNbhd_root_eq, vertices_p5]
  ext w
  simp only [sSigma4block, Finset.mem_sdiff, Finset.mem_filter, Finset.mem_insert,
    Finset.mem_singleton]
  constructor
  · rintro ⟨⟨hv, hn⟩, _⟩
    rcases hv with rfl | rfl | rfl | rfl | rfl
    · exact absurd ⟨Or.inl rfl, Or.inl rfl⟩ hn
    · exact absurd ⟨Or.inr (Or.inl rfl), Or.inr rfl⟩ hn
    · exact Or.inl rfl
    · exact Or.inr (Or.inl rfl)
    · exact Or.inr (Or.inr rfl)
  · rintro (rfl | rfl | rfl)
    · refine ⟨⟨Or.inr (Or.inr (Or.inl rfl)), ?_⟩, ?_⟩ <;>
      · rintro ⟨-, (h | h)⟩ <;> simp at h
    · refine ⟨⟨Or.inr (Or.inr (Or.inr (Or.inl rfl))), ?_⟩, ?_⟩ <;>
      · rintro ⟨-, (h | h)⟩ <;> simp at h
    · refine ⟨⟨Or.inr (Or.inr (Or.inr (Or.inr rfl))), ?_⟩, ?_⟩ <;>
      · rintro ⟨-, (h | h)⟩ <;> simp at h

/-- **σ4 pack-data identity**: the general pack at `(tPath5, [], [])`
carries LITERALLY the closed neutral triple `(sSigma4, nbSeqOn, ordCard)`
— the same terms the P-world module `R16C3P` speaks about. -/
theorem packG4_data : packGeneral tPath5 [] [] = ⟨sSigma4, nbSeqOn, ordCard⟩ := by
  unfold packGeneral
  rw [residual_tPath5, nbComponents_sigma4]

/-- σ4 lawfulness — an instance of the general theorem. -/
theorem packG4_lawful : LawfulT tPath5 [] [] (packGeneral tPath5 [] []) :=
  packGeneral_lawful tPath5 [] []

/-! ## §6 — W5-style σ4 kernel anchors (ranks 1–3, order-3 path block)

Extracted through the compiled L5 of the general pack at the σ4 witness —
the first anchor family produced by the GENERAL machinery rather than by a
per-shape enumeration. Rank 2 = 1 (the endpoint pair) and rank 3 = 0 are
the adjacency-sensitive values a numerical mirror must reproduce. -/

private theorem packG4_prod :
    (∏ C ∈ (packGeneral tPath5 [] []).s, (packGeneral tPath5 [] []).f C)
      = threePathSeq := by
  rw [packG4_data]
  show (∏ C ∈ sSigma4, nbSeqOn C) = threePathSeq
  unfold sSigma4
  rw [Finset.prod_singleton, nbSeqOn_sigma4]

/-- σ4 anchor, rank 1: three independent singletons. -/
theorem anchor_path5_rank1 :
    tPath5.indepCountOn (tPath5.ResidualAmbient [] []) 1 = 3 := by
  have h := packG4_lawful.l5 1
  rw [packG4_prod, threePathSeq_coeff] at h
  norm_num at h
  exact_mod_cast h.symm

/-- σ4 anchor, rank 2: exactly ONE independent pair (the endpoints). -/
theorem anchor_path5_rank2 :
    tPath5.indepCountOn (tPath5.ResidualAmbient [] []) 2 = 1 := by
  have h := packG4_lawful.l5 2
  rw [packG4_prod, threePathSeq_coeff] at h
  norm_num at h
  exact_mod_cast h.symm

/-- σ4 anchor, rank 3: NO independent triple (adjacency-sensitive zero). -/
theorem anchor_path5_rank3 :
    tPath5.indepCountOn (tPath5.ResidualAmbient [] []) 3 = 0 := by
  have h := packG4_lawful.l5 3
  rw [packG4_prod, threePathSeq_coeff] at h
  norm_num at h
  exact_mod_cast h.symm

/-! ## §7 — The payoff at the general pack (F-b wiring; premises LIVE) -/

/-- **The sealed r14 closure at the GENERAL pack, for every `(t, v, g)`.**
`hID`/`hadm` are discharged by construction (§4); **PREMISE K (`hKL`),
K-SCOPE (`hKSCOPE`) and the crossing bound (`hx`) stay on the face — NEVER
discharged.** With L3+L3′+L7 compiled, the instantiated `hKSCOPE` says
exactly: every connected component of `U` — a tree under inherited
adjacency — has order ≤ 25 (K-SCOPE of record, F-b as frozen). Closes
nothing beyond its stated scope; asserts no target. -/
theorem G1_closure_general (t : RTree) (v g : List ℕ) {p : ℕ} (hp : 2 ≤ p)
    (hKL : ∀ C ∈ nbComponents (t.ResidualAmbient v g),
      ordCard C ≤ 25 → AdjacentLogConcave (nbSeqOn C))
    (hKSCOPE : ∀ C ∈ nbComponents (t.ResidualAmbient v g), ordCard C ≤ 25)
    (hx : t.crossingIndexOn (t.ResidualAmbient v g) ≤ p - 2) :
    t.DeltaOnZ (t.ResidualAmbient v g) ((p : ℤ) - 2) ≤ 0 :=
  G1_closure_of_lawful t v g hp (packGeneral t v g) (packGeneral_lawful t v g)
    hKL hKSCOPE hx

end R16C3
