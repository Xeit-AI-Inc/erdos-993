/-
R9C3-B — FidelityProofs.lean  (NEW at C3)

The proofs route C3-B landed against FidelityContracts.lean.  What is NOT here
is as much of the record as what is: `encoderAttachCommutes` is absent, and its
absence is reported in the route's return and in DEVIATIONS.md rather than
covered by a weakened statement.

Pin: Lean 4.32.2, Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c.
No `sorry`, no `admit`, no `native_decide`.
-/
import FidelityContracts

namespace Erdos993
namespace QDecoder
namespace Fidelity

/-- **The encoder's output is realized, by the tree that produced it.**  S2 §2's
realization clause list, discharged clause by clause. -/
--@@BEGIN EL-N06
theorem encodeQ_realizable (R : FinRootedTree) : Realizable (encodeQ R.tree)
--@@END EL-N06
    :=
  ⟨R, (Fintype.equivFin (RootedTree.leafIndex R.tree)).symm, rfl, rfl,
    fun _ _ => rfl, fun _ _ => rfl, fun _ => rfl, rfl, fun _ => rfl⟩

/-- **S2 §7, PROVED**: the decoder recovers the marked deletion profile at every
leaf, in BOTH branches of eq. (4). -/
--@@BEGIN EL-N10
theorem decoderRecoversMarkedProfiles : DecoderRecoversMarkedProfiles
--@@END EL-N10
    := by
  intro R a
  have hgd : (R.tree.encodeGen).rootDel = R.tree.encRootDel := rfl
  unfold GenState.decodeM
  by_cases h : (R.tree.encodeGen).rootMk = some a
  · rw [if_pos h, hgd]
    have h' : R.tree.encRootMk = some a := h
    unfold RootedTree.encRootMk at h'
    by_cases hd : R.tree.degree R.tree.root = 1
    · rw [dif_pos hd] at h'
      have ha : (⟨R.tree.root, hd⟩ : RootedTree.leafIndex R.tree) = a :=
        Option.some.inj h'
      unfold RootedTree.encRootDel
      rw [dif_pos hd, Option.getD_some, ← ha]
    · rw [dif_neg hd] at h'
      exact absurd h' (by simp)
  · rw [if_neg h]
    exact RootedTree.sectors_F _

/-- **The C2A-G3 dividend, PROVED**: S2's `Carrier(Q)` embeds in the built
`Carrier` as exactly the realizable classes. -/
theorem carrier_eq_realizedCarrier : Carrier_eq_realizedCarrier := by
  constructor
  · intro c c'
    refine Quotient.inductionOn₂ c c' ?_
    intro x y h
    have h2 : Quotient.mk stateSetoid x.1 = Quotient.mk stateSetoid y.1 := h
    have h3 : RawEquiv x.1 y.1 := Quotient.exact h2
    exact Quotient.sound h3
  · intro q hq
    exact ⟨Quotient.mk realizedSetoid ⟨q, hq⟩, rfl⟩

/-! ### The one-vertex base state, from the independent-set sums (limb L-BASE) -/

theorem oneVertex_indepSets : oneVertex.indepSets = {∅, {()}} := by decide

theorem oneVertex_extSet_singleton : oneVertex.extSet {()} = ∅ := by decide

theorem oneVertex_extSet_empty : oneVertex.extSet ∅ = {()} := by decide

/-- **S2 §3's "correct one-vertex base state", PROVED SEMANTICALLY**: the
sectors computed from the independent sets of the one-vertex tree are exactly
`(x, 1, 0)` — the value `attachSec` produces algebraically on the empty family
(DC-T5).  The two routes to the base state agree. -/
theorem oneVertex_sectors :
    oneVertex.sectorU = PX ∧ oneVertex.sectorV = 1 ∧ oneVertex.sectorW = 0 := by
  refine ⟨?_, ?_, ?_⟩
  · unfold RootedTree.sectorU
    rw [show oneVertex.indepSets.filter (fun S => oneVertex.root ∈ S) = {{()}} from by decide]
    rw [Finset.sum_singleton]
    unfold RootedTree.wt RootedTree.extCountR
    rw [oneVertex_extSet_singleton]
    simp
  · unfold RootedTree.sectorV
    rw [show oneVertex.indepSets.filter
          (fun S => oneVertex.root ∉ S ∧ oneVertex.root ∈ oneVertex.extSet S)
          = {∅} from by decide]
    rw [Finset.sum_singleton]
    unfold RootedTree.wt RootedTree.extCountR
    rw [oneVertex_extSet_empty]
    simp
  · unfold RootedTree.sectorW
    rw [show oneVertex.indepSets.filter
          (fun S => oneVertex.root ∉ S ∧ oneVertex.root ∉ oneVertex.extSet S)
          = ∅ from by decide]
    simp

/-- **S3's "this also covers the empty family, where `𝓕 = x + y`", PROVED
SEMANTICALLY.** -/
theorem oneVertex_FTot : oneVertex.FTot = PX + PY := by
  have h := RootedTree.sectors_F oneVertex
  obtain ⟨hU, hV, hW⟩ := oneVertex_sectors
  rw [← h]
  unfold RootedTree.sectors Sectors.F
  simp [hU, hV, hW]

/-! ### Endpoint recovery — S2 §7's zero-extended `a_k(v)` -/

section Endpoint

variable {V : Type} [Fintype V] [DecidableEq V]

theorem specY1_FTot (T : RootedTree V) :
    specY1 T.FTot = ∑ S ∈ T.indepSets, (Polynomial.X : Polynomial ℤ) ^ S.card := by
  unfold specY1 RootedTree.FTot
  rw [map_sum]
  refine Finset.sum_congr rfl ?_
  intro S _
  rw [map_mul, map_pow, map_pow]
  unfold PX PY
  rw [MvPolynomial.aeval_X, MvPolynomial.aeval_X]
  simp

theorem coeff_sum_X_pow (T : RootedTree V) (k : ℕ) :
    (∑ S ∈ T.indepSets, (Polynomial.X : Polynomial ℤ) ^ S.card).coeff k
      = ((T.indepSets.filter (fun S => S.card = k)).card : ℤ) := by
  classical
  rw [Polynomial.finsetSum_coeff]
  have hterm : ∀ S ∈ T.indepSets,
      ((Polynomial.X : Polynomial ℤ) ^ S.card).coeff k
        = if S.card = k then (1 : ℤ) else 0 := by
    intro S _
    rw [Polynomial.coeff_X_pow]
    by_cases h : S.card = k
    · rw [if_pos h.symm, if_pos h]
    · rw [if_neg (fun hc => h hc.symm), if_neg h]
  rw [Finset.sum_congr rfl hterm, Finset.sum_boole]

theorem coeffZ_specY1_FTot (T : RootedTree V) (k : ℤ) :
    coeffZ (specY1 T.FTot) k = T.indepCountZ k := by
  unfold coeffZ RootedTree.indepCountZ
  by_cases h : 0 ≤ k
  · rw [if_pos h, if_pos h, specY1_FTot, coeff_sum_X_pow]
  · rw [if_neg h, if_neg h]

end Endpoint

/-- **S2 §7's endpoint recovery, PROVED**, with both sides ℤ-valued and
zero-extended to negative rank. -/
theorem endpointRecovery : EndpointRecovery := by
  intro R a k
  rw [decoderRecoversMarkedProfiles R a]
  unfold RootedTree.endpointA
  rw [coeffZ_specY1_FTot, coeffZ_specY1_FTot]

/-! ### The marker half of encoder attachment commutation -/

section AttachMarkers

open RootedTree

variable {I : Type} [Fintype I] [DecidableEq I] (B : I → FinRootedTree)

theorem attach_children_none :
    (attachTree I B).children none
      = Finset.image (fun i => (some ⟨i, (B i).tree.root⟩ : Option (Σ i : I, (B i).V)))
          Finset.univ := by
  ext x
  simp only [mem_children, Finset.mem_image, Finset.mem_univ, true_and]
  constructor
  · rintro ⟨hx, hp⟩
    match x with
    | none => exact absurd rfl hx
    | some ⟨i, w⟩ =>
        refine ⟨i, ?_⟩
        by_cases h : w = (B i).tree.root
        · rw [h]
        · exact absurd hp (by simp [attachTree, h])
  · rintro ⟨i, rfl⟩
    exact ⟨by simp [attachTree], by simp [attachTree]⟩

theorem attach_children_some (i : I) (w : (B i).V) :
    (attachTree I B).children (some ⟨i, w⟩)
      = Finset.image (fun z => (some ⟨i, z⟩ : Option (Σ i : I, (B i).V)))
          ((B i).tree.children w) := by
  ext x
  simp only [mem_children, Finset.mem_image]
  constructor
  · rintro ⟨hx, hp⟩
    match x with
    | none => exact absurd rfl hx
    | some ⟨j, z⟩ =>
        by_cases h : z = (B j).tree.root
        · exact absurd hp (by simp [attachTree, h])
        · have hp' : (some ⟨j, (B j).tree.parent z⟩ : Option (Σ i : I, (B i).V))
              = some ⟨i, w⟩ := by
            simpa [attachTree, h] using hp
          have hji : j = i := by
            simpa using congrArg (fun o => Option.map Sigma.fst o) hp'
          subst hji
          have hw : (B j).tree.parent z = w := by
            have hs := Option.some.inj hp'
            simpa using hs
          exact ⟨z, ⟨h, hw⟩, rfl⟩
  · rintro ⟨z, hz, rfl⟩
    exact ⟨by simp [attachTree], by simp [attachTree, hz.1, hz.2]⟩


theorem attach_degree_none : (attachTree I B).degree none = Fintype.card I := by
  unfold RootedTree.degree
  have hinj : Function.Injective
      (fun i => (some ⟨i, (B i).tree.root⟩ : Option (Σ i : I, (B i).V))) := by
    intro a b hab
    simpa using congrArg (fun o => Option.map Sigma.fst o) hab
  rw [attach_children_none, Finset.card_image_of_injective _ hinj, Finset.card_univ]
  simp [attachTree]

theorem attach_degree_some (i : I) (w : (B i).V) :
    (attachTree I B).degree (some ⟨i, w⟩) = ((B i).tree.children w).card + 1 := by
  unfold RootedTree.degree
  have hinj : Function.Injective
      (fun z : (B i).V => (some ⟨i, z⟩ : Option (Σ i : I, (B i).V))) := by
    intro a b hab
    simpa using hab
  rw [attach_children_some, Finset.card_image_of_injective _ hinj,
    if_neg (by simp [attachTree])]

/-- S2 §4: "the fresh root is a leaf exactly for one branch". -/
theorem attach_leaf_none_iff : (attachTree I B).degree none = 1 ↔ Fintype.card I = 1 := by
  rw [attach_degree_none]

/-- S2 §4: "a child root of degree one ceases to be a leaf, a degree-zero child
is a singleton whose root becomes a leaf" — and every other branch vertex keeps
its leaf status.  This is S3's first two marker summands. -/
theorem attach_leaf_some_iff (i : I) (w : (B i).V) :
    (attachTree I B).degree (some ⟨i, w⟩) = 1
      ↔ ((w ≠ (B i).tree.root ∧ (B i).tree.degree w = 1)
          ∨ (w = (B i).tree.root ∧ (B i).tree.degree w = 0)) := by
  rw [attach_degree_some]
  unfold RootedTree.degree
  by_cases h : w = (B i).tree.root
  · rw [if_pos h]
    constructor
    · intro hc; exact Or.inr ⟨h, by omega⟩
    · rintro (⟨hne, _⟩ | ⟨_, hz⟩)
      · exact absurd h hne
      · omega
  · rw [if_neg h]
    constructor
    · intro hc; exact Or.inl ⟨h, by omega⟩
    · rintro (⟨_, ho⟩ | ⟨he, _⟩)
      · omega
      · exact absurd he h

end AttachMarkers

/-- **S2 §4 and S3's marker summands, PROVED.**  The leaves of the attached tree
are exactly: the fresh root when there is one branch; the inherited non-root
leaves of each branch; and the root of each degree-0 branch. -/
--@@BEGIN EL-R02
theorem attachedLeafClassification : AttachedLeafClassification
--@@END EL-R02
    := by
  intro I _ _ B
  exact ⟨attach_leaf_none_iff B, fun i w => attach_leaf_some_iff B i w⟩

/-! ### EL-N13 — the `encodeQ` bridge -/

theorem pullback_decodeM {A B : Type} [DecidableEq A] [DecidableEq B]
    (g : GenState A) (σ : B ≃ A) (b : B) :
    (g.pullback σ).decodeM b = g.decodeM (σ b) := by
  refine decodeM_congr (σ := σ) (fun a _ => rfl) ?_ (fun _ => rfl) b
  show (g.rootMk.map (fun a => σ.symm a)).map (fun b => σ b) = g.rootMk
  cases g.rootMk with
  | none => rfl
  | some a => simp

theorem encodeQDecodeTransport : EncodeQDecodeTransport := by
  intro R
  refine ⟨(Fintype.equivFin (RootedTree.leafIndex R.tree)).symm, ?_⟩
  intro b
  have h := pullback_decodeM R.tree.encodeGen
    (Fintype.equivFin (RootedTree.leafIndex R.tree)).symm b
  show (R.tree.encodeGen.pullback
      (Fintype.equivFin (RootedTree.leafIndex R.tree)).symm).decodeM b = _
  rw [h]
  exact decoderRecoversMarkedProfiles R _

/-! ### Obstruction items (2) and (3) — attachment adjacency, and what it gives

`COVERAGE-COMPLEMENT.md` (db4e8bf8…d5a1) items (2) and (3), registered at
`EL-N18` and `EL-N19` of the frozen C5 contract.  Everything below runs off ONE
adjacency computation for `attachTree`, stated in three cases. -/

section AttachAdj

open RootedTree

variable {I : Type} [Fintype I] [DecidableEq I] (B : I → FinRootedTree)

theorem mem_indepSets {V : Type} [Fintype V] [DecidableEq V] {T : RootedTree V}
    {S : Finset V} : S ∈ T.indepSets ↔ ∀ u ∈ S, ∀ v ∈ S, T.adjB u v = false := by
  unfold RootedTree.indepSets RootedTree.indepB
  simp

theorem attach_root_eq : (attachTree I B).root = none := rfl

theorem attach_adjB_none_none : (attachTree I B).adjB none none = false := by
  unfold RootedTree.adjB
  simp [attach_root_eq]

theorem attach_adjB_none_some (i : I) (w : (B i).V) :
    (attachTree I B).adjB none (some ⟨i, w⟩) = decide (w = (B i).tree.root) := by
  unfold RootedTree.adjB
  by_cases h : w = (B i).tree.root
  · simp [attach_root_eq, attachTree, h]
  · simp [attach_root_eq, attachTree, h]

theorem attach_adjB_some_none (i : I) (w : (B i).V) :
    (attachTree I B).adjB (some ⟨i, w⟩) none = decide (w = (B i).tree.root) := by
  rw [RootedTree.adjB_symm, attach_adjB_none_some]

theorem attach_adjB_some_some_same (i : I) (v w : (B i).V) :
    (attachTree I B).adjB (some ⟨i, v⟩) (some ⟨i, w⟩) = (B i).tree.adjB v w := by
  unfold RootedTree.adjB
  simp only [attach_root_eq, decide_eq_decide, ne_eq, reduceCtorEq,
    not_false_eq_true, true_and]
  constructor
  · rintro (h | h)
    · refine Or.inl ⟨?_, ?_⟩
      · intro hc
        rw [hc] at h
        simp [attachTree] at h
      · by_cases hr : v = (B i).tree.root
        · rw [hr] at h; simp [attachTree] at h
        · simpa [attachTree, hr] using h
    · refine Or.inr ⟨?_, ?_⟩
      · intro hc
        rw [hc] at h
        simp [attachTree] at h
      · by_cases hr : w = (B i).tree.root
        · rw [hr] at h; simp [attachTree] at h
        · simpa [attachTree, hr] using h
  · rintro (⟨h1, h2⟩ | ⟨h1, h2⟩)
    · exact Or.inl (by simp [attachTree, h1, h2])
    · exact Or.inr (by simp [attachTree, h1, h2])

theorem attach_adjB_some_some_diff (i j : I) (v : (B i).V) (w : (B j).V)
    (hij : i ≠ j) :
    (attachTree I B).adjB (some ⟨i, v⟩) (some ⟨j, w⟩) = false := by
  unfold RootedTree.adjB
  simp only [attach_root_eq, decide_eq_false_iff_not, not_or, ne_eq,
    reduceCtorEq, not_false_eq_true, true_and]
  constructor
  · intro h
    by_cases hr : v = (B i).tree.root
    · rw [hr] at h; simp [attachTree] at h
    · have := congrArg (fun o => Option.map Sigma.fst o) h
      simp [attachTree, hr] at this
      exact hij this
  · intro h
    by_cases hr : w = (B j).tree.root
    · rw [hr] at h; simp [attachTree] at h
    · have := congrArg (fun o => Option.map Sigma.fst o) h
      simp [attachTree, hr] at this
      exact hij this.symm

end AttachAdj

/-- **Obstruction item (2), PROVED**: the independent-set decomposition of the
attached tree, in the CHARACTERISATION form `EL-N18` registers — not a
bijection object, which the contract's own face forbids reporting. -/
theorem attachIndepDecomposition : AttachIndepDecomposition := by
  intro I _ _ B S
  constructor
  · intro hS
    rw [mem_indepSets] at hS
    constructor
    · intro i
      rw [mem_indepSets]
      intro v hv w hw
      rw [Finset.mem_filter] at hv hw
      rw [← attach_adjB_some_some_same B i v w]
      exact hS _ hv.2 _ hw.2
    · intro hnone i hc
      have := hS _ hnone _ hc
      rw [attach_adjB_none_some] at this
      simp at this
  · rintro ⟨h1, h2⟩
    rw [mem_indepSets]
    rintro (_ | ⟨i, v⟩) hu (_ | ⟨j, w⟩) hv
    · exact attach_adjB_none_none B
    · rw [attach_adjB_none_some]
      have := h2 hu j
      simp only [decide_eq_false_iff_not]
      intro hc
      exact this (by rwa [hc] at hv)
    · rw [attach_adjB_some_none]
      have := h2 hv i
      simp only [decide_eq_false_iff_not]
      intro hc
      exact this (by rwa [hc] at hu)
    · by_cases hij : i = j
      · subst hij
        rw [attach_adjB_some_some_same]
        exact mem_indepSets.mp (h1 i) v
          (Finset.mem_filter.mpr ⟨Finset.mem_univ _, hu⟩)
          w (Finset.mem_filter.mpr ⟨Finset.mem_univ _, hv⟩)
      · exact attach_adjB_some_some_diff B i j v w hij

/-! ### EL-N19 — the frozen row's THIRD top-level conjunct is FALSE

`EL-N19`'s `clause_correspondence` classifies its third conjunct as
`clause_structure: BICONDITIONAL, quantifier: NONE` against the sizing clause
*"`o` is extendable exactly when no branch root is selected"*.  `extSet` carries
`v ∉ S` in its own definition, so the sizing clause's extendability of `o`
PRESUPPOSES `o ∉ S` and the registered conjunct drops that guard.  The witness
below is the smallest one there is. -/

def unitBranchFam : Unit → FinRootedTree :=
  fun _ => ⟨Unit, inferInstance, inferInstance, oneVertex⟩

def rootOnly : Finset (Option (Σ i : Unit, (unitBranchFam i).V)) := {none}

theorem rootOnly_indep :
    rootOnly ∈ (attachTree Unit unitBranchFam).indepSets := by
  rw [mem_indepSets]
  intro u hu v hv
  have hu' : u = none := by simpa [rootOnly] using hu
  have hv' : v = none := by simpa [rootOnly] using hv
  subst hu'; subst hv'
  exact attach_adjB_none_none unitBranchFam

theorem not_attachExtensionBookkeeping : ¬ AttachExtensionBookkeeping := by
  intro h
  obtain ⟨-, -, h3⟩ := h Unit unitBranchFam rootOnly rootOnly_indep
  have hr : ∀ i : Unit,
      (some ⟨i, (unitBranchFam i).tree.root⟩ :
        Option (Σ i : Unit, (unitBranchFam i).V)) ∉ rootOnly := by
    intro i hc
    simp [rootOnly] at hc
  have hin : (none : Option (Σ i : Unit, (unitBranchFam i).V))
      ∈ (attachTree Unit unitBranchFam).extSet rootOnly := h3.2 hr
  exact (RootedTree.mem_extSet.mp hin).1 (by simp [rootOnly])

/-- **Obstruction item (3) AT ITS CORRECTED STATEMENT, PROVED.**  The delta
against the frozen `EL-N19` is EXACTLY ONE GUARD — `none ∉ S →` prepended to the
third top-level conjunct — and nothing else moves.  ROUTE-ADDED and declared as
such: this is NOT `EL-N19`, it does not discharge `EL-N19`, and the repair of a
frozen row is a contract matter and not a route's. -/
theorem attachExtensionBookkeeping_guarded :
    ∀ (I : Type) [Fintype I] [DecidableEq I] (B : I → FinRootedTree)
      (S : Finset (Option (Σ i : I, (B i).V))),
      S ∈ (attachTree I B).indepSets
        → (none ∈ S → ∀ i : I,
            some ⟨i, (B i).tree.root⟩ ∉ (attachTree I B).extSet S)
          ∧ (none ∉ S → ∀ i : I,
              some ⟨i, (B i).tree.root⟩ ∈ (attachTree I B).extSet S
                ↔ (B i).tree.root ∈ (B i).tree.extSet
                    (Finset.univ.filter (fun v : (B i).V => some ⟨i, v⟩ ∈ S)))
          ∧ (none ∉ S → (none ∈ (attachTree I B).extSet S
              ↔ ∀ i : I, some ⟨i, (B i).tree.root⟩ ∉ S)) := by
  intro I _ _ B S _
  refine ⟨?_, ?_, ?_⟩
  · intro hnone i hc
    have h := (RootedTree.mem_extSet.mp hc).2 none hnone
    rw [attach_adjB_some_none] at h
    simp at h
  · intro hnone i
    constructor
    · intro hc
      obtain ⟨h1, h2⟩ := RootedTree.mem_extSet.mp hc
      refine RootedTree.mem_extSet.mpr ⟨?_, ?_⟩
      · intro hm
        exact h1 (Finset.mem_filter.mp hm).2
      · intro v hv
        have hvS := (Finset.mem_filter.mp hv).2
        have := h2 (some ⟨i, v⟩) hvS
        rwa [attach_adjB_some_some_same] at this
    · intro hc
      obtain ⟨h1, h2⟩ := RootedTree.mem_extSet.mp hc
      refine RootedTree.mem_extSet.mpr ⟨?_, ?_⟩
      · intro hm
        exact h1 (Finset.mem_filter.mpr ⟨Finset.mem_univ _, hm⟩)
      · rintro (_ | ⟨j, w⟩) hu
        · exact absurd hu hnone
        · by_cases hij : i = j
          · subst hij
            rw [attach_adjB_some_some_same]
            exact h2 w (Finset.mem_filter.mpr ⟨Finset.mem_univ _, hu⟩)
          · exact attach_adjB_some_some_diff B i j _ w hij
  · intro hnone
    constructor
    · intro hc i hm
      have := (RootedTree.mem_extSet.mp hc).2 _ hm
      rw [attach_adjB_none_some] at this
      simp at this
    · intro hno
      refine RootedTree.mem_extSet.mpr ⟨hnone, ?_⟩
      rintro (_ | ⟨j, w⟩) hu
      · exact absurd hu hnone
      · rw [attach_adjB_none_some]
        simp only [decide_eq_false_iff_not]
        intro hw
        exact hno j (by rwa [hw] at hu)

/-! ### EL-N14 — PROVED at the pin, under the R9C4-ADJ-1(a)-repaired `EL-N03` -/

theorem realizableRawEquivInvariant : RealizableRawEquivInvariant := by
  rintro q q' ⟨σ, hc, hs, hd, hsu, hrs, hrm, hrd⟩ ⟨R, η, rc, rs, rd, rsu, rrs, rrm, rrd⟩
  refine ⟨R, σ.symm.trans η, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rw [← hc]; exact rc
  · rw [← hs]; exact rs
  · intro b hb
    obtain ⟨a, rfl⟩ := σ.surjective b
    have ha : q.core.rootMk ≠ some a := fun hcon =>
      hb ((rootMk_transfer hrm a).1 hcon)
    rw [← hd a ha]
    refine (rd a ha).trans ?_
    exact congrArg (fun x : RootedTree.leafIndex R.tree =>
      (R.tree.delLeaf x.1 x.2).sectors) (congrArg η (σ.symm_apply_apply a).symm)
  · intro b b'
    obtain ⟨a, rfl⟩ := σ.surjective b
    obtain ⟨a', rfl⟩ := σ.surjective b'
    simp only [Equiv.trans_apply, Equiv.symm_apply_apply]
    rw [← hsu a a']
    exact rsu a a'
  · intro b
    obtain ⟨a, rfl⟩ := σ.surjective b
    simp only [Equiv.trans_apply, Equiv.symm_apply_apply]
    rw [← hrs a]
    exact rrs a
  · rw [← hrm, rrm]
    cases R.tree.encRootMk with
    | none => rfl
    | some a => rfl
  · intro hb
    have ha : q.core.rootMk ≠ none := fun hcon =>
      hb ((rootMk_none_transfer hrm).1 hcon)
    rw [← hrd ha]
    exact rrd ha

/-! ### L-SECISO — sector invariance under a root- and parent-preserving
bijection.  Piece (1) of `COVERAGE-COMPLEMENT.md`'s five-piece decomposition of
the `encoderAttachCommutes` obstruction, in the form the proof needs it (C-11). -/

section SectorIso

open RootedTree

variable {V V' : Type} [Fintype V] [DecidableEq V] [Fintype V'] [DecidableEq V']
variable (T : RootedTree V) (T' : RootedTree V') (e : V ≃ V')
variable (hroot : e T.root = T'.root) (hpar : ∀ v, e (T.parent v) = T'.parent (e v))

include hroot in
theorem ne_root_congr (w : V) : (e w ≠ T'.root) ↔ (w ≠ T.root) := by
  rw [← hroot]
  exact ⟨fun h hc => h (by rw [hc]), fun h hc => h (e.injective hc)⟩

include hpar in
theorem parent_congr (w z : V) : (T'.parent (e w) = e z) ↔ (T.parent w = z) := by
  rw [← hpar w]
  exact ⟨fun h => e.injective h, fun h => by rw [h]⟩

include hroot hpar in
theorem adjB_congr (u v : V) : T'.adjB (e u) (e v) = T.adjB u v := by
  unfold RootedTree.adjB
  simp only [decide_eq_decide]
  constructor
  · rintro (⟨h1, h2⟩ | ⟨h1, h2⟩)
    · exact Or.inl ⟨(ne_root_congr T T' e hroot u).1 h1,
        (parent_congr T T' e hpar u v).1 h2⟩
    · exact Or.inr ⟨(ne_root_congr T T' e hroot v).1 h1,
        (parent_congr T T' e hpar v u).1 h2⟩
  · rintro (⟨h1, h2⟩ | ⟨h1, h2⟩)
    · exact Or.inl ⟨(ne_root_congr T T' e hroot u).2 h1,
        (parent_congr T T' e hpar u v).2 h2⟩
    · exact Or.inr ⟨(ne_root_congr T T' e hroot v).2 h1,
        (parent_congr T T' e hpar v u).2 h2⟩

include hroot hpar in
theorem indepB_congr (S : Finset V) : T'.indepB (S.image e) = T.indepB S := by
  unfold RootedTree.indepB
  simp only [decide_eq_decide, Finset.mem_image]
  constructor
  · intro h u hu v hv
    rw [← adjB_congr T T' e hroot hpar u v]
    exact h (e u) ⟨u, hu, rfl⟩ (e v) ⟨v, hv, rfl⟩
  · rintro h u' ⟨u, hu, rfl⟩ v' ⟨v, hv, rfl⟩
    rw [adjB_congr T T' e hroot hpar u v]
    exact h u hu v hv

include hroot hpar in
theorem mem_indepSets_image (S : Finset V) :
    S.image e ∈ T'.indepSets ↔ S ∈ T.indepSets := by
  unfold RootedTree.indepSets
  simp only [Finset.mem_filter, Finset.mem_powerset, Finset.subset_univ, true_and]
  rw [indepB_congr T T' e hroot hpar]

include hroot hpar in
theorem extSet_image (S : Finset V) :
    T'.extSet (S.image e) = (T.extSet S).image e := by
  ext v'
  obtain ⟨v, rfl⟩ := e.surjective v'
  constructor
  · intro hv
    obtain ⟨h1, h2⟩ := mem_extSet.mp hv
    refine Finset.mem_image_of_mem e (mem_extSet.mpr ⟨?_, ?_⟩)
    · exact fun hc => h1 (Finset.mem_image_of_mem e hc)
    · intro u hu
      rw [← adjB_congr T T' e hroot hpar v u]
      exact h2 (e u) (Finset.mem_image_of_mem e hu)
  · intro hv
    obtain ⟨w, hw, hwe⟩ := Finset.mem_image.mp hv
    have hwv : w = v := e.injective hwe
    subst hwv
    obtain ⟨h1, h2⟩ := mem_extSet.mp hw
    refine mem_extSet.mpr ⟨?_, ?_⟩
    · intro hc
      obtain ⟨u, hu, hue⟩ := Finset.mem_image.mp hc
      exact h1 (by rwa [e.injective hue] at hu)
    · intro u' hu'
      obtain ⟨u, hu, rfl⟩ := Finset.mem_image.mp hu'
      rw [adjB_congr T T' e hroot hpar w u]
      exact h2 u hu

include hroot hpar in
theorem extCountR_congr (S : Finset V) :
    T'.extCountR (S.image e) = T.extCountR S := by
  unfold RootedTree.extCountR
  rw [extSet_image T T' e hroot hpar, ← hroot]
  have himg : ((T.extSet S).image e).erase (e T.root)
      = ((T.extSet S).erase T.root).image e := by
    ext x
    simp only [Finset.mem_erase, Finset.mem_image]
    constructor
    · rintro ⟨hx, w, hw, rfl⟩
      exact ⟨w, ⟨fun hc => hx (by rw [hc]), hw⟩, rfl⟩
    · rintro ⟨w, ⟨hw1, hw2⟩, rfl⟩
      exact ⟨fun hc => hw1 (e.injective hc), w, hw2, rfl⟩
  rw [himg]
  exact Finset.card_image_of_injective _ e.injective

include hroot hpar in
theorem wt_congr (S : Finset V) : T'.wt (S.image e) = T.wt S := by
  unfold RootedTree.wt
  rw [extCountR_congr T T' e hroot hpar,
    Finset.card_image_of_injective _ e.injective]

include hroot hpar in
theorem sector_sum_congr (P : Finset V → Prop) [DecidablePred P]
    (P' : Finset V' → Prop) [DecidablePred P']
    (hP : ∀ S : Finset V, P' (S.image e) ↔ P S) :
    ∑ S' ∈ T'.indepSets.filter P', T'.wt S'
      = ∑ S ∈ T.indepSets.filter P, T.wt S := by
  classical
  have hset : T'.indepSets.filter P'
      = (T.indepSets.filter P).image (fun S => S.image e) := by
    ext S'
    simp only [Finset.mem_filter, Finset.mem_image]
    constructor
    · rintro ⟨hi, hp⟩
      refine ⟨S'.image e.symm, ⟨?_, ?_⟩, ?_⟩
      · rw [← mem_indepSets_image T T' e hroot hpar]
        rwa [Finset.image_image, show (e ∘ e.symm) = id from funext (by simp),
          Finset.image_id]
      · rw [← hP]
        rwa [Finset.image_image, show (e ∘ e.symm) = id from funext (by simp),
          Finset.image_id]
      · rw [Finset.image_image, show (e ∘ e.symm) = id from funext (by simp),
          Finset.image_id]
    · rintro ⟨S, ⟨hi, hp⟩, rfl⟩
      exact ⟨(mem_indepSets_image T T' e hroot hpar S).2 hi, (hP S).2 hp⟩
  rw [hset, Finset.sum_image (fun x _ y _ h => Finset.image_injective e.injective h)]
  exact Finset.sum_congr rfl (fun S _ => wt_congr T T' e hroot hpar S)

include hroot hpar in
theorem sectorU_congr : T'.sectorU = T.sectorU := by
  unfold RootedTree.sectorU
  refine sector_sum_congr T T' e hroot hpar _ _ ?_
  intro S
  rw [← hroot]
  simp [Finset.mem_image, e.injective.eq_iff]

include hroot hpar in
theorem sectorV_congr : T'.sectorV = T.sectorV := by
  unfold RootedTree.sectorV
  refine sector_sum_congr T T' e hroot hpar _ _ ?_
  intro S
  rw [extSet_image T T' e hroot hpar, ← hroot]
  simp [Finset.mem_image, e.injective.eq_iff]

include hroot hpar in
theorem sectorW_congr : T'.sectorW = T.sectorW := by
  unfold RootedTree.sectorW
  refine sector_sum_congr T T' e hroot hpar _ _ ?_
  intro S
  rw [extSet_image T T' e hroot hpar, ← hroot]
  simp [Finset.mem_image, e.injective.eq_iff]

end SectorIso

/-- **Sector invariance under tree isomorphism, PROVED.**  Item (1) of the
five-piece decomposition of the `encoderAttachCommutes` obstruction.

The `include hroot hpar in` section-variable form C4-A built is written here
with its binders EXPLICIT, which is the form `FIDELITY-CONTRACT-C5.yaml`
registers at `EL-N16` (its `binder_cross_check`: two implicit type binders, four
instance-implicit, five explicit).  Declared in `DEVIATIONS.md`: no identifier,
no type and no proof changes; only the binder presentation. -/
--@@BEGIN EL-N16
theorem sectors_congr {V V' : Type} [Fintype V] [DecidableEq V] [Fintype V']
    [DecidableEq V'] (T : RootedTree V) (T' : RootedTree V') (e : V ≃ V')
    (hroot : e T.root = T'.root)
    (hpar : ∀ v, e (T.parent v) = T'.parent (e v)) : T'.sectors = T.sectors
--@@END EL-N16
    := by
  unfold RootedTree.sectors
  rw [sectorU_congr T T' e hroot hpar, sectorV_congr T T' e hroot hpar,
    sectorW_congr T T' e hroot hpar]

/-- The `F`-total is invariant too, through S2 eq. (1) rather than by a second
independent-set argument. -/
--@@BEGIN EL-N17
theorem FTot_congr {V V' : Type} [Fintype V] [DecidableEq V] [Fintype V']
    [DecidableEq V'] (T : RootedTree V) (T' : RootedTree V') (e : V ≃ V')
    (hroot : e T.root = T'.root)
    (hpar : ∀ v, e (T.parent v) = T'.parent (e v)) : T'.FTot = T.FTot
--@@END EL-N17
    := by
  rw [← RootedTree.sectors_F, ← RootedTree.sectors_F,
    sectors_congr T T' e hroot hpar]

end Fidelity
end QDecoder
end Erdos993
