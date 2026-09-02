/-
R9C5-B — Proofs.lean.  OB-M3 at its NARROWED scope, against the frozen ten-row
control/M3-CONTRACT-C5.yaml.

WHAT IS PROVED, AND WHAT IS NOT, STATED BEFORE ANY OF IT.

  * M3-03 `supportSharing_invariant`        -- PROVED at its registered signature.
  * M3-04a `supportSharing_attach_transport` -- PROVED at its registered SCOPED
    signature.  The C4 row was FALSE as a unit; C5 SPLIT it, and the conditional
    half is true under the scoped hypothesis and false without it.
  * M3-04b `attach_rootSupportFibre`        -- PROVED OUTRIGHT AND
    UNCONDITIONALLY.  At C4 this content could only be reported at the coarser
    truth of the bundled row.
  * M3-07 `rootFibreIsClass_of_attach`      -- PROVED.  THE GENUINE NECESSITY
    THEOREM: when the fresh marker exists, `RootFibreIsClass` is implied by
    M3-04's own conclusion on inherited markers.
  * M3-08 `attach_RootFibreIsClass`         -- PROVED, UNCONDITIONALLY.  The
    repair is closed under attachment, which is what makes it usable for the
    recursion OB-M3 is about.
  * M3-09 `supportSharing_attach_no_fresh`  -- PROVED.  `|I| != 1` needs no
    repair hypothesis at all: the entire branching case.

WHAT THE WITNESS FAMILY RECEIPTS, AT ITS OWN TRUTH AND NO MORE.  `cexFam` is a
one-branch family with total support-sharing whose root-support fibre is a
proper non-empty subset of a single sharing class.  It receipts NON-VACUITY:
`cex_scoped_hypothesis_fails` shows the SCOPED hypothesis of M3-04a is not idle,
and `cex_attach_not_sharing` shows the conclusion genuinely fails on that input.
IT DOES NOT RECEIPT NECESSITY, and this route does not say that it does.  A
counterexample to the unguarded statement receipts that SOME hypothesis is
needed on SOME input; STRUCTURAL's `cexFam2` proved this one is not the weakest.

LIFT PROVENANCE, DECLARED.  The proof scripts for M3-04a (through
`supportSharing_attach_transport_guarded`) are lifted from
cycles/cycle-4/evidence/critiques/R9C4-B-OPPOSITIONAL/lean/CritCheck.lean, and
those for M3-07, M3-08 and M3-09 from
cycles/cycle-4/evidence/critiques/R9C4-B-STRUCTURAL/PROBE-1-Probe.lean, with
section variables made explicit exactly as the frozen contract's `lift_source`
fields direct.  M3-03, M3-04b and the helper lemmas are lifted from
cycles/cycle-4/evidence/R9C4-B/lean/Proofs.lean.  THE CRITICS FOUND THIS
MATHEMATICS; THIS ROUTE ASSEMBLED IT AGAINST THE FROZEN CONTRACT AND SAYS SO.

Every object read here is GATED (DECODER-CONTRACT-C3, 1f0664b5...a452) or
contracted (M3-CONTRACT-C5, c9f57f82...a3be).  This file adds no state field, no
index and no relation primitive.  Every registered span body was lifted from the
frozen contract's bytes; every proof script lies OUTSIDE every span.

Pin: Lean 4.32.2, Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c.
-/
import M3Contracts

namespace Erdos993
namespace QDecoder
namespace M3

/-! ### A transport lemma for `Equivalence` along a bijection.  Unregistered. -/

theorem equiv_transport {A B : Type} (σ : A ≃ B) {r : A → A → Prop}
    {s : B → B → Prop} (hrs : ∀ a a', r a a' ↔ s (σ a) (σ a'))
    (h : Equivalence r) : Equivalence s := by
  constructor
  · intro b
    have h0 := h.refl (σ.symm b)
    rw [hrs] at h0
    simpa using h0
  · intro b b' hb
    have h1 : r (σ.symm b) (σ.symm b') := by rw [hrs]; simpa using hb
    have h2 := h.symm h1
    rw [hrs] at h2
    simpa using h2
  · intro b b' b'' hb hb'
    have h1 : r (σ.symm b) (σ.symm b') := by rw [hrs]; simpa using hb
    have h2 : r (σ.symm b') (σ.symm b'') := by rw [hrs]; simpa using hb'
    have h3 := h.trans h1 h2
    rw [hrs] at h3
    simpa using h3

/-! ### M3-03 -/

/-- M3-03.  Well-posedness for the type: support-sharing is invariant under the
GATED DC-11 equivalence, whose clause 4 is `∀ a a', g.supp a a' = h.supp (σ a)
(σ a')`.  DC-11 makes BOTH support conjuncts part of the equivalence, so the
observable is isomorphism-invariant and the labelled identity CERT-E refutes is
not what was built. -/
--@@BEGIN M3-03
theorem supportSharing_invariant {A B : Type} (g : GenState A) (h : GenState B) (hgh : GenState.Equiv g h) : SupportSharing g ↔ SupportSharing h
--@@END M3-03
    := by
  obtain ⟨σ, -, -, -, hsu, -, -, -⟩ := hgh
  constructor
  · intro hg
    exact equiv_transport σ (fun a a' => by rw [hsu a a']) hg
  · intro hh
    refine equiv_transport σ.symm (fun b b' => ?_) hh
    rw [hsu (σ.symm b) (σ.symm b')]
    simp

/-! ### Conjunct 2 of the M3-05 bundle (DC-09, reindexing covariance).
Unregistered: the C5 contract carries it inside M3-05 and on no row of its own. -/

theorem supportSharing_pullback {A B : Type} (g : GenState A) (σ : B ≃ A)
    (h : SupportSharing g) : SupportSharing (g.pullback σ) := by
  constructor
  · intro b; exact h.refl (σ b)
  · intro b b' hb; exact h.symm hb
  · intro b b' b'' hb hb'; exact h.trans hb hb'

/-! ### M3-04b -- THE PROVED UNCONDITIONAL -/

/-- M3-04b, and conjunct 4 of the M3-05 bundle: the root-support fibre after
attachment is EXACTLY the promoted singleton markers.  Stated against the gated
DC-31 `attachRootSupp`.  PROVED OUTRIGHT: no hypothesis, scoped or otherwise.

R-2.1(a) is what makes this row reportable.  At C4 it was the second conjunct of
a bundled row whose first conjunct is false, so its truth could only ever be
reported at the coarser truth of the bundle. -/
--@@BEGIN M3-04b
theorem attach_rootSupportFibre {I : Type} [Fintype I] [DecidableEq I] (q : I → RawState) (x : AMk q) : rootSupportFibre (attach q) x ↔ ∃ y : PromMk q, x = Sum.inr (Sum.inl y)
--@@END M3-04b
    := by
  cases x with
  | inl x => simp [rootSupportFibre, attach, attachRootSupp]
  | inr x =>
      cases x with
      | inl y => exact ⟨fun _ => ⟨y, rfl⟩, fun _ => rfl⟩
      | inr z => simp [rootSupportFibre, attach, attachRootSupp]

/-! ### Reduction lemmas for the GATED DC-30 arm enumeration.  Unregistered. -/

section Attached

variable {I : Type} [Fintype I] [DecidableEq I]

theorem attachSupp_inl_inl_same (q : I → RawState) (i : I) (a b : Fin (q i).n)
    (ha : (q i).core.rootMk ≠ some a) (hb : (q i).core.rootMk ≠ some b) :
    attachSupp q (Sum.inl ⟨⟨i, a⟩, ha⟩) (Sum.inl ⟨⟨i, b⟩, hb⟩)
      = (q i).core.supp a b := by
  simp [attachSupp]

theorem attachSupp_inl_inl_diff (q : I → RawState) (i j : I) (a : Fin (q i).n)
    (b : Fin (q j).n) (ha : (q i).core.rootMk ≠ some a)
    (hb : (q j).core.rootMk ≠ some b) (hij : i ≠ j) :
    attachSupp q (Sum.inl ⟨⟨i, a⟩, ha⟩) (Sum.inl ⟨⟨j, b⟩, hb⟩) = false := by
  simp [attachSupp, hij]

/-- When the fresh-root marker exists, `|I| = 1`, so every branch index is the
same index.  This is what makes S2 section 4 rule 3 a rule about ONE child. -/
theorem branch_of_fresh_unique (z : FreshMk I) (i j : I) : i = j := by
  obtain ⟨w, hw⟩ := Fintype.card_eq_one_iff.mp z.2
  rw [hw i, hw j]

/-- The SCOPED transport lemma in the conjunctive form both C4-B critics
compiled.  Unregistered: M3-04a and M3-04b are the two frozen rows, and this
lemma is the common proof they are read off.  Lifted from
R9C4-B-OPPOSITIONAL/lean/CritCheck.lean. -/
theorem supportSharing_attach_transport_guarded (q : I → RawState)
    (hq : ∀ i, SupportSharing (q i).core)
    (hf : Fintype.card I = 1 → ∀ i, RootFibreIsClass (q i).core) :
    SupportSharing (attach q) ∧
      ∀ x : AMk q, rootSupportFibre (attach q) x ↔ ∃ y : PromMk q, x = Sum.inr (Sum.inl y) := by
  refine ⟨?_, attach_rootSupportFibre q⟩
  have hsupp : (attach q).supp = attachSupp q := rfl
  rw [SupportSharing, hsupp]
  constructor
  · rintro (⟨⟨i, a⟩, ha⟩ | y | z)
    · rw [attachSupp_inl_inl_same]; exact (hq i).refl a
    · rfl
    · rfl
  · rintro (⟨⟨i, a⟩, ha⟩ | y | z) (⟨⟨j, b⟩, hb⟩ | y' | z') h
    · by_cases hij : i = j
      · subst hij
        rw [attachSupp_inl_inl_same] at h ⊢
        exact (hq i).symm h
      · rw [attachSupp_inl_inl_diff q i j a b ha hb hij] at h
        exact absurd h (by simp)
    · exact absurd h (by simp [attachSupp])
    · exact h
    · exact absurd h (by simp [attachSupp])
    · rfl
    · exact absurd h (by simp [attachSupp])
    · exact h
    · exact absurd h (by simp [attachSupp])
    · rfl
  · rintro (⟨⟨i, a⟩, ha⟩ | y | z) (⟨⟨j, b⟩, hb⟩ | y' | z') (⟨⟨k, c⟩, hc⟩ | y'' | z'') h1 h2
    · by_cases hij : i = j
      · subst hij
        by_cases hik : i = k
        · subst hik
          rw [attachSupp_inl_inl_same] at h1 h2 ⊢
          exact (hq i).trans h1 h2
        · rw [attachSupp_inl_inl_diff q i k b c hb hc hik] at h2
          exact absurd h2 (by simp)
      · rw [attachSupp_inl_inl_diff q i j a b ha hb hij] at h1
        exact absurd h1 (by simp)
    · exact absurd h2 (by simp [attachSupp])
    · by_cases hij : i = j
      · subst hij
        rw [attachSupp_inl_inl_same] at h1
        exact ((hf z''.2 i b a h2).1 ((hq i).symm h1))
      · rw [attachSupp_inl_inl_diff q i j a b ha hb hij] at h1
        exact absurd h1 (by simp)
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · have hik : i = k := branch_of_fresh_unique z' i k
      subst hik
      rw [attachSupp_inl_inl_same]
      exact ((hf z'.2 i a c h1).2 h2)
    · exact absurd h2 (by simp [attachSupp])
    · exact h1
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h2 (by simp [attachSupp])
    · rfl
    · exact absurd h2 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · by_cases hjk : j = k
      · subst hjk
        rw [attachSupp_inl_inl_same] at h2
        exact ((hf z.2 j b c h1).1 h2)
      · rw [attachSupp_inl_inl_diff q j k b c hb hc hjk] at h2
        exact absurd h2 (by simp)
    · exact absurd h2 (by simp [attachSupp])
    · rfl
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact h2
    · exact absurd h2 (by simp [attachSupp])
    · rfl

end Attached

/-! ### M3-04a -- THE CONDITIONAL, AT ITS FROZEN SCOPED SIGNATURE -/

/-- M3-04a.  The registered SCOPED statement, read off the guarded lemma's first
conjunct.  The scoped hypothesis is discharged only where the fresh-root marker
can exist; M3-09 below is the same conclusion where it cannot, with no
hypothesis at all. -/
--@@BEGIN M3-04a
theorem supportSharing_attach_transport {I : Type} [Fintype I] [DecidableEq I] (q : I → RawState) (hq : ∀ i, SupportSharing (q i).core) (hf : Fintype.card I = 1 → ∀ i, RootFibreIsClass (q i).core) : SupportSharing (attach q)
--@@END M3-04a
    := (supportSharing_attach_transport_guarded q hq hf).1

/-! ### M3-08 -- THE REPAIR IS CLOSED UNDER ATTACHMENT, UNCONDITIONALLY -/

/-- M3-08.  Lifted from R9C4-B-STRUCTURAL/PROBE-1-Probe.lean P1.  Without this
the scoped hypothesis would not survive one step of S2 section 3's own
recurrence, and M3-06 would be a hypothesis that happens to work on one input
rather than one the recursion can carry. -/
--@@BEGIN M3-08
theorem attach_RootFibreIsClass {I : Type} [Fintype I] [DecidableEq I] (q : I → RawState) : RootFibreIsClass (attach q)
--@@END M3-08
    := by
  rintro (⟨⟨i,a⟩,ha⟩ | y | z) (⟨⟨j,b⟩,hb⟩ | y' | z') h
  · exact absurd h (by simp [attach, attachRootSupp])
  · exact absurd h (by simp [attach, attachRootSupp])
  · exact absurd h (by simp [attach, attachRootSupp])
  · constructor
    · intro hh; exact absurd hh (by simp [attach, attachSupp])
    · intro hh; exact absurd hh (by simp [attach, attachRootSupp])
  · exact ⟨fun _ => rfl, fun _ => rfl⟩
  · constructor
    · intro hh; exact absurd hh (by simp [attach, attachSupp])
    · intro hh; exact absurd hh (by simp [attach, attachRootSupp])
  · exact absurd h (by simp [attach, attachRootSupp])
  · exact absurd h (by simp [attach, attachRootSupp])
  · exact absurd h (by simp [attach, attachRootSupp])

/-! ### M3-09 -- THE UNSCOPED TRUTH ON THE BRANCHING CASE -/

/-- M3-09.  Lifted from R9C4-B-STRUCTURAL/PROBE-1-Probe.lean P2.  `|I| != 1`
needs NO repair hypothesis: the entire branching case, which is what S2 section
3's recurrence is mostly about.  Frozen beside M3-04a per R-2.3 condition 4 so
that the scoped hypothesis is read against the exact case that requires it and
never against the case that does not. -/
--@@BEGIN M3-09
theorem supportSharing_attach_no_fresh {I : Type} [Fintype I] [DecidableEq I] (q : I → RawState) (hcard : Fintype.card I ≠ 1) (hq : ∀ i, SupportSharing (q i).core) : SupportSharing (attach q)
--@@END M3-09
    := by
  have hsupp : (attach q).supp = attachSupp q := rfl
  rw [SupportSharing, hsupp]
  constructor
  · rintro (⟨⟨i, a⟩, ha⟩ | y | z)
    · rw [attachSupp_inl_inl_same]; exact (hq i).refl a
    · rfl
    · exact absurd z.2 hcard
  · rintro (⟨⟨i, a⟩, ha⟩ | y | z) (⟨⟨j, b⟩, hb⟩ | y' | z') h
    · by_cases hij : i = j
      · subst hij; rw [attachSupp_inl_inl_same] at h ⊢; exact (hq i).symm h
      · rw [attachSupp_inl_inl_diff q i j a b ha hb hij] at h; exact absurd h (by simp)
    · exact absurd h (by simp [attachSupp])
    · exact absurd z'.2 hcard
    · exact absurd h (by simp [attachSupp])
    · rfl
    · exact absurd z'.2 hcard
    · exact absurd z.2 hcard
    · exact absurd z.2 hcard
    · exact absurd z.2 hcard
  · rintro (⟨⟨i, a⟩, ha⟩ | y | z) (⟨⟨j, b⟩, hb⟩ | y' | z') (⟨⟨k, c⟩, hc⟩ | y'' | z'') h1 h2
    · by_cases hij : i = j
      · subst hij
        by_cases hik : i = k
        · subst hik; rw [attachSupp_inl_inl_same] at h1 h2 ⊢; exact (hq i).trans h1 h2
        · rw [attachSupp_inl_inl_diff q i k b c hb hc hik] at h2; exact absurd h2 (by simp)
      · rw [attachSupp_inl_inl_diff q i j a b ha hb hij] at h1; exact absurd h1 (by simp)
    · exact absurd h2 (by simp [attachSupp])
    · exact absurd z''.2 hcard
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd z'.2 hcard
    · exact absurd z'.2 hcard
    · exact absurd z'.2 hcard
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h2 (by simp [attachSupp])
    · rfl
    · exact absurd z''.2 hcard
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd h1 (by simp [attachSupp])
    · exact absurd z.2 hcard
    · exact absurd z.2 hcard
    · exact absurd z.2 hcard
    · exact absurd z.2 hcard
    · exact absurd z.2 hcard
    · exact absurd z.2 hcard
    · exact absurd z.2 hcard
    · exact absurd z.2 hcard
    · exact absurd z.2 hcard

/-! ### M3-07 -- THE GENUINE NECESSITY THEOREM -/

/-- M3-07.  Lifted from R9C4-B-STRUCTURAL/PROBE-1-Probe.lean P3.  When the fresh
marker exists, the repair hypothesis is IMPLIED by M3-04's own conclusion on
inherited markers.  This is the difference between a hypothesis that happens to
work and the hypothesis that is FORCED, and it is the run's necessity content --
`cex_fibre_not_class` is not, and this route does not offer it as such. -/
--@@BEGIN M3-07
theorem rootFibreIsClass_of_attach {I : Type} [Fintype I] [DecidableEq I] (q : I → RawState) (z : FreshMk I) (h : SupportSharing (attach q)) (i : I) (a a' : Fin (q i).n) (ha : (q i).core.rootMk ≠ some a) (ha' : (q i).core.rootMk ≠ some a') (h0 : (q i).core.rootSupp a = true) : ((q i).core.supp a a' = true ↔ (q i).core.rootSupp a' = true)
--@@END M3-07
    := by
  have hza : (attach q).supp (Sum.inr (Sum.inr z)) (Sum.inl (⟨⟨i,a⟩,ha⟩ : InhMk q)) = true := h0
  have key : (attach q).supp (Sum.inl (⟨⟨i,a⟩,ha⟩ : InhMk q)) (Sum.inl (⟨⟨i,a'⟩,ha'⟩ : InhMk q))
      = (q i).core.supp a a' := attachSupp_inl_inl_same q i a a' ha ha'
  constructor
  · intro hs
    have hab : (attach q).supp (Sum.inl (⟨⟨i,a⟩,ha⟩ : InhMk q)) (Sum.inl (⟨⟨i,a'⟩,ha'⟩ : InhMk q)) = true := by
      rw [key]; exact hs
    exact h.trans hza hab
  · intro hs'
    have hza' : (attach q).supp (Sum.inr (Sum.inr z)) (Sum.inl (⟨⟨i,a'⟩,ha'⟩ : InhMk q)) = true := hs'
    have haz := h.symm hza
    have hfin := h.trans haz hza'
    rw [key] at hfin
    exact hfin

/-! ### THE NON-VACUITY WITNESS, AT ITS OWN TRUTH.  Unregistered. -/

/-- One branch, two markers, TOTAL support-sharing (an equivalence), and a
root-support fibre that is a proper non-empty subset of a single sharing class.
`Fintype.card Unit = 1`, so the fresh-root marker EXISTS on this family and S2
section 4 rule 3 is active. -/
noncomputable def cexCore : GenState (Fin 2) where
  cls      := RootClass.degGe2
  sec      := ⟨0, 0, 0⟩
  del      := fun _ => ⟨0, 0, 0⟩
  supp     := fun _ _ => true
  rootSupp := fun a => decide (a = 0)
  rootMk   := none
  rootDel  := none

noncomputable def cexRaw : RawState := ⟨2, cexCore⟩

noncomputable def cexFam : Unit → RawState := fun _ => cexRaw

theorem cex_branches_share : ∀ i : Unit, SupportSharing (cexFam i).core :=
  fun _ => ⟨fun _ => rfl, fun _ => rfl, fun _ _ => rfl⟩

noncomputable def cexX0 : InhMk cexFam := ⟨⟨(), (0 : Fin 2)⟩, by simp [cexFam, cexRaw, cexCore]⟩

noncomputable def cexX1 : InhMk cexFam := ⟨⟨(), (1 : Fin 2)⟩, by simp [cexFam, cexRaw, cexCore]⟩

def cexZ : FreshMk Unit := ⟨(), by simp⟩

/-- The conclusion of M3-04a FAILS on this family: `z ~ x0` because `x0` is in
the root-support fibre; `x0 ~ x1` because the branch shares support totally;
`z ~ x1` is FALSE because `x1` is not in the fibre. -/
theorem cex_attach_not_sharing : ¬ SupportSharing (attach cexFam) := by
  intro h
  have h1 : attachSupp cexFam (Sum.inr (Sum.inr cexZ)) (Sum.inl cexX0) = true := by
    simp [attachSupp, cexX0, cexFam, cexRaw, cexCore]
  have h2 : attachSupp cexFam (Sum.inl cexX0) (Sum.inl cexX1) = true := by
    simp [attachSupp, cexX0, cexX1, cexFam, cexRaw, cexCore]
  have h3 : attachSupp cexFam (Sum.inr (Sum.inr cexZ)) (Sum.inl cexX1) = false := by
    simp [attachSupp, cexX1, cexFam, cexRaw, cexCore]
  have hA : (attach cexFam).supp (Sum.inr (Sum.inr cexZ)) (Sum.inl cexX0) = true := h1
  have hB : (attach cexFam).supp (Sum.inl cexX0) (Sum.inl cexX1) = true := h2
  have hC := h.trans hA hB
  rw [show (attach cexFam).supp (Sum.inr (Sum.inr cexZ)) (Sum.inl cexX1) = false from h3] at hC
  exact Bool.noConfusion hC

/-- The family fails the UNSCOPED hypothesis. -/
theorem cex_fibre_not_class : ¬ (∀ i : Unit, RootFibreIsClass (cexFam i).core) := by
  intro h
  have := (h () (0 : Fin 2) (1 : Fin 2) (by simp [cexFam, cexRaw, cexCore])).1
    (by simp [cexFam, cexRaw, cexCore])
  simp [cexFam, cexRaw, cexCore] at this

/-- NON-VACUITY OF THE SCOPED HYPOTHESIS -- the statement C5 actually froze, and
the one the C4 package could not make because it registered the unscoped form.
`cexFam` satisfies every OTHER hypothesis of M3-04a (`cex_branches_share`) and
fails the conclusion (`cex_attach_not_sharing`), so the scoped hypothesis is not
idle on the frozen row.  IT IS NOT CLAIMED MINIMAL AND IT IS NOT CLAIMED
NECESSARY. -/
theorem cex_scoped_hypothesis_fails :
    ¬ (Fintype.card Unit = 1 → ∀ i : Unit, RootFibreIsClass (cexFam i).core) :=
  fun h => cex_fibre_not_class (h (by simp))

end M3
end QDecoder
end Erdos993
