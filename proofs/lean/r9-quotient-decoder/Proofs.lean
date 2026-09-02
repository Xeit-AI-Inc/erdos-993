/-
R9C3-A — Proofs.lean
The C3 nomination: every contract of `Contracts.C3Bundle` PROVED against the
repaired definitional package, at the frozen contract.

PROPERTY CLAIMS ABOUT THIS FILE (machine-checked at seal):
  * no `sorry`, no `admit`, no `native_decide`, no `axiom` anywhere in it;
  * every declaration is a `theorem` with a complete proof.

Pin: Lean 4.32.2, Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c.
-/
import Contracts

namespace Erdos993
namespace QDecoder

noncomputable section

/-! ### Representative independence -/

--@@BEGIN PS-01
theorem repIndependence : Contracts.RepIndependence := by
  intro q q' hqq
  obtain ⟨σ, _hc, _hs, hd, _hsu, _hrs, hrm, hrd⟩ := hqq
  exact ⟨σ, fun a => decodeM_congr hd hrm hrd a⟩
--@@END PS-01

/-! ### Descent of the decoder -/

--@@BEGIN PS-03
theorem decoderDescends : Contracts.DecoderDescends := by
  refine ⟨Quotient.lift (fun q : RawState => Quotient.mk markedSetoid q.marked)
    (fun a b hab => Quotient.sound (repIndependence a b hab)), ?_⟩
  intro q
  rfl
--@@END PS-03

/-! ### `Rec_I` congruence -/

section AttachCongr

variable {I I' : Type} [Fintype I] [DecidableEq I] [Fintype I'] [DecidableEq I']

/-- The residue localized by the C1/C2 record: attachment is congruent at the
level of the OUTPUT MARKER TYPE.  Everything else in `RecCongruence` is
`pack_equiv` plus the `Equiv` laws.

The `rootDel` case is now a GUARDED goal.  Under `card I ≠ 1` the guard's
hypothesis is refuted by `attach`'s own `rootMk`, which is `none` there; under
`card I = 1` the obligation is the C2 obligation and is discharged by the same
argument.  This is the sense in which the guard "costs no mathematics". -/
--@@BEGIN PS-08
theorem attach_equiv (q : I → RawState) (q' : I' → RawState) (β : I ≃ I')
    (hq : ∀ i : I, RawEquiv (q i) (q' (β i))) :
    (attach q).Equiv (attach q') := by
  simp only [RawEquiv, GenState.Equiv] at hq
  choose σ hcls hsec hdel hsupp hrs hrm hrd using hq
  have hcard : Fintype.card I = Fintype.card I' := Fintype.card_congr β
  have hIn : ∀ (x : Σ i : I, Fin (q i).n),
      ((q x.1).core.rootMk ≠ some x.2) ↔
        ((q' (β x.1)).core.rootMk ≠ some (σ x.1 x.2)) :=
    fun x => not_congr (rootMk_transfer (hrm x.1) x.2)
  let SG : (Σ i : I, Fin (q i).n) ≃ (Σ i' : I', Fin (q' i').n) :=
    Equiv.sigmaCongr β σ
  let eInh : InhMk q ≃ InhMk q' := SG.subtypeEquiv hIn
  let eProm : PromMk q ≃ PromMk q' := β.subtypeEquiv (fun i => by rw [hcls i])
  let eFresh : FreshMk I ≃ FreshMk I' := Equiv.subtypeEquivRight (fun _ => by rw [hcard])
  let emk : AMk q ≃ AMk q' := eInh.sumCongr (eProm.sumCongr eFresh)
  refine ⟨emk, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  -- cls
  · show (if Fintype.card I = 0 then RootClass.deg0
          else if Fintype.card I = 1 then RootClass.deg1 else RootClass.degGe2)
        = (if Fintype.card I' = 0 then RootClass.deg0
          else if Fintype.card I' = 1 then RootClass.deg1 else RootClass.degGe2)
    rw [hcard]
  -- sec
  · exact attachSec_congr β _ _ (fun j => hsec j)
  -- del (guarded at the root marker)
  · show ∀ b : AMk q, (attach q).rootMk ≠ some b → attachDel q b = attachDel q' (emk b)
    rintro (⟨⟨i, a⟩, hx⟩ | ⟨i, hi⟩ | ⟨u, hu⟩) hb
    · show attachSec (fun j : I => if j = i then (q i).core.del a else (q j).core.sec)
          = attachSec (fun j' : I' =>
              if j' = β i then (q' (β i)).core.del (σ i a) else (q' j').core.sec)
      refine attachSec_congr β _ _ ?_
      intro j
      by_cases hj : j = i
      · subst hj
        rw [if_pos rfl, if_pos rfl]
        exact hdel j a hx
      · rw [if_neg hj, if_neg (fun hcon => hj (β.injective hcon))]
        exact hsec j
    · show attachSec (fun j : {j : I // j ≠ i} => (q j.1).core.sec)
          = attachSec (fun j' : {j' : I' // j' ≠ β i} => (q' j'.1).core.sec)
      exact attachSec_congr
        (β.subtypeEquiv (fun _ => by simp only [ne_eq, EmbeddingLike.apply_eq_iff_eq]))
        _ _ (fun j => hsec j.1)
    · exact absurd (dif_pos hu) hb
  -- supp
  · show ∀ b b' : AMk q, attachSupp q b b' = attachSupp q' (emk b) (emk b')
    rintro (⟨⟨i, a⟩, hx⟩ | ⟨i, hi⟩ | ⟨u, hu⟩) (⟨⟨i2, a2⟩, hy⟩ | ⟨i2, hi2⟩ | ⟨u2, hu2⟩)
    · by_cases hij : i = i2
      · subst hij
        show (if _h : i = i then (q i).core.supp a a2 else false)
            = (if _h : β i = β i then (q' (β i)).core.supp (σ i a) (σ i a2) else false)
        rw [dif_pos rfl, dif_pos rfl]
        exact hsupp i a a2
      · rw [show attachSupp q (Sum.inl ⟨⟨i, a⟩, hx⟩) (Sum.inl ⟨⟨i2, a2⟩, hy⟩) = false from
              dif_neg hij,
            show attachSupp q' (emk (Sum.inl ⟨⟨i, a⟩, hx⟩)) (emk (Sum.inl ⟨⟨i2, a2⟩, hy⟩))
                = false from dif_neg (fun hcon => hij (β.injective hcon))]
    · rfl
    · exact hrs i a
    · rfl
    · rfl
    · rfl
    · exact hrs i2 a2
    · rfl
    · rfl
  -- rootSupp
  · show ∀ b : AMk q, attachRootSupp q b = attachRootSupp q' (emk b)
    rintro (x | y | z) <;> rfl
  -- rootMk
  · by_cases h : Fintype.card I = 1
    · have h' : Fintype.card I' = 1 := hcard ▸ h
      show (Option.map (fun a => emk a)
              (if hh : Fintype.card I = 1 then some (Sum.inr (Sum.inr ⟨(), hh⟩)) else none))
          = (if hh : Fintype.card I' = 1 then some (Sum.inr (Sum.inr ⟨(), hh⟩)) else none)
      rw [dif_pos h, dif_pos h']
      rfl
    · have h' : ¬ Fintype.card I' = 1 := hcard ▸ h
      show (Option.map (fun a => emk a)
              (if hh : Fintype.card I = 1 then some (Sum.inr (Sum.inr ⟨(), hh⟩)) else none))
          = (if hh : Fintype.card I' = 1 then some (Sum.inr (Sum.inr ⟨(), hh⟩)) else none)
      rw [dif_neg h, dif_neg h']
      rfl
  -- rootDel, GUARDED
  · intro hne
    by_cases h : Fintype.card I = 1
    · have h' : Fintype.card I' = 1 := hcard ▸ h
      haveI : Subsingleton I' := Fintype.card_le_one_iff_subsingleton.mp (le_of_eq h')
      show (if hh : Fintype.card I = 1 then some ((q (theBranch hh)).core.sec.F) else none)
          = (if hh : Fintype.card I' = 1 then some ((q' (theBranch hh)).core.sec.F) else none)
      rw [dif_pos h, dif_pos h', Option.some.injEq, hsec (theBranch h),
        Subsingleton.elim (β (theBranch h)) (theBranch h')]
    · exact absurd (show (attach q).rootMk = none from dif_neg h) hne
--@@END PS-08

end AttachCongr

--@@BEGIN PS-02
theorem recCongruence : Contracts.RecCongruence := by
  intro I I' _ _ _ _ q q' β hq
  exact (pack_equiv (attach q)).trans
    ((attach_equiv q q' β hq).trans (pack_equiv (attach q')).symm)
--@@END PS-02

/-! ### Descent of `Rec_I` -/

--@@BEGIN PS-04
theorem attachDescends : Contracts.AttachDescends := by
  intro I _ _
  refine ⟨fun c => Quotient.mk stateSetoid (attachR (fun i => Quotient.out (c i))), ?_⟩
  intro q
  apply Quotient.sound
  refine recCongruence I I (fun i => Quotient.out (Quotient.mk stateSetoid (q i)))
    q (Equiv.refl I) ?_
  intro i
  exact Quotient.mk_out (q i)
--@@END PS-04

/-! ### Boundary -/

--@@BEGIN PS-05
theorem emptyFamilyBoundary : Contracts.EmptyFamilyBoundary := by
  intro q
  exact attachSec_empty (fun i : PEmpty => (q i).core.sec)
--@@END PS-05

/-! ### THE DELTA-S1 RECEIPT -/

/-- The kernel receipt that DELTA-S1 is EMPTY ON THE RELATION, not merely named.

Every conjunct is supplied by the hypotheses except two, and those two are
exactly where the guards do their work: the deletion-profile clause is
discharged by dropping its guard hypothesis (`fun a _ => hdel a`), and the
`rootDel` clause is discharged by REFUTING its guard hypothesis from
`q.core.rootMk = none`.  Against the C2 unguarded conjunct the last step is
unavailable and no proof exists — the two states may carry different
`rootDel`. -/
--@@BEGIN PS-06
theorem deltaS1Discharged : Contracts.DeltaS1Discharged := by
  intro q q' σ hrm hrm' hcls hsec hdel hsupp hrs
  exact ⟨σ, hcls, hsec, (fun a _ => hdel a), hsupp, hrs,
    by simp [hrm, hrm'], fun hne => absurd hrm hne⟩
--@@END PS-06

/-! ### The nominated bundle -/

--@@BEGIN PS-07
theorem c3Bundle : Contracts.C3Bundle :=
  ⟨repIndependence, recCongruence, decoderDescends, attachDescends,
    emptyFamilyBoundary, deltaS1Discharged⟩
--@@END PS-07

end

end QDecoder
end Erdos993
