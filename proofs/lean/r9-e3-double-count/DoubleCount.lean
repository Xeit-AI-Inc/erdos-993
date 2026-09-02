import Mathlib

/-!
# OB-E3-LEAN — the bridged extension-set double count (route R9C3-C)

Redo of route R9C2-C under the C2 adjudication's C2C-G1 re-entry condition
(sealed C2-ADJUDICATION.md ruling (b); frozen at `control/E3-CONTRACT-C3.yaml`,
`cbca056d…`-lineage synthesis, contract_id `e3-contract-c3-v1-frozen`).
Formalizes `OB-E3` (`CLOSED_INFORMAL_AFTER_REPAIR`) and `OB-E3-LEAN` (`OPEN`,
sealed r8 `OBLIGATIONS.csv`): "Prove `[x^k] partial_y F_G(x,1)=(k+1)i_(k+1)(G)`
with explicit boundaries."

**What C2-C shipped and what C3-C adds.** C2-C's package defined `genFun`
(the transposition element, `C1F1Rep01.extensionProfile`'s orientation) and,
separately, `genFunDerivAtOne`, and proved every boundary theorem about the
LATTER alone. No theorem related the two, so mutant M1 — reverting `genFun`
to the refused C1 orientation — compiled at exit 0: the `∂_y F_G` claim lived
only in a docstring, never in the kernel. **THE BRIDGE (E3-09,
`genFunDerivAtOne_coeff`)** proves `genFunDerivAtOne`'s coefficients ARE the
termwise `∂_y` of `genFun`'s coefficients at `y := 1`; **E3-10
(`coeff_deriv_eval_one`) restates the main theorem directly on `genFun`**,
so `genFun` becomes a proof dependency of the obligation's own statement and
the orientation is kernel-checkable (registered falsifier `E3-F1`: the M1
substitution must now fail to compile, because the bridge's proof depends on
the term structure the substitution destroys).

This route re-derives the bridge independently rather than importing either
C2 critic's probe file (both are cited by path as the difficulty benchmark,
under the D1-OPPOSITIONAL precedent: critic material requiring route
re-derivation, not transportable into route evidence). The derivation here
first establishes `genFun`'s own coefficient as an indicator sum
(`genFun_coeff`, unregistered/internal), then differentiates and evaluates
that sum termwise — a different proof shape from either critic's file (which
unfold both sides together without first isolating `genFun`'s coefficient).

**Model.** `G` is a finite simple graph (`Graph V`, self-contained, not
Mathlib's `SimpleGraph` — the same widening disclosure as the C1/C2 routes,
declared verbatim: E3-01's note). For an independent set `S : Finset V`
(`Indep G S`), its EXTENSION SET is `ext G S := {v ∉ S : insert v S
independent}`.

`indepCount` is `ℤ`-indexed and `ℤ`-valued (L3-G4/BT-8; E3-05's note): both
capacity boundaries (`indepCount_eq_zero_of_lt`, `indepCount_eq_zero_of_gt`)
are theorems, not enumerated residues, with no case split in the main proof.
`derivCoeff` (E3-08, NEW this cycle) is the explicit zero-extension of the
main identity to every `k : ℤ` (`coeff_deriv_eval_one_int`, E3-11), which
`OB-C10-T1-ZERO-EXTENSION` and `OB-U1-TRS-DEFINITION`'s integer-rank clause
require of a downstream consumer.
-/

namespace R9C3C

open Polynomial Finset

variable {V : Type*} [Fintype V] [DecidableEq V]

structure Graph (V : Type*) where
  Adj : V → V → Prop
  symm : ∀ {u v}, Adj u v → Adj v u
  irrefl : ∀ v, ¬ Adj v v

variable (G : Graph V) [DecidableRel G.Adj]

def Indep (S : Finset V) : Prop := ∀ ⦃u⦄, u ∈ S → ∀ ⦃v⦄, v ∈ S → ¬ G.Adj u v

instance : DecidablePred (Indep G) := fun S => by unfold Indep; infer_instance

omit [Fintype V] [DecidableEq V] [DecidableRel G.Adj] in
theorem indep_mono {S T : Finset V} (h : S ⊆ T) (hT : Indep G T) : Indep G S :=
  fun _u hu _v hv => hT (h hu) (h hv)

def indepSets : Finset (Finset V) := Finset.univ.filter (Indep G)

theorem mem_indepSets {S : Finset V} : S ∈ indepSets G ↔ Indep G S := by
  simp [indepSets]

def ext (S : Finset V) : Finset V := (Finset.univ \ S).filter (fun v => Indep G (insert v S))

theorem mem_ext {S : Finset V} {v : V} :
    v ∈ ext G S ↔ v ∉ S ∧ Indep G (insert v S) := by
  simp [ext]

/-- `i_j(G)`, `ℤ`-indexed and `ℤ`-valued (L3-G4/BT-8, carried unchanged). -/
def indepCount (j : ℤ) : ℤ := (((indepSets G).filter (fun S => (S.card : ℤ) = j)).card : ℤ)

theorem indepCount_natCast (j : ℕ) :
    indepCount G (j : ℤ) = (((indepSets G).filter (fun S => S.card = j)).card : ℤ) := by
  have hset : (indepSets G).filter (fun S => (S.card : ℤ) = (j : ℤ))
      = (indepSets G).filter (fun S => S.card = j) := by
    apply Finset.filter_congr
    intro S _
    exact ⟨fun h => by exact_mod_cast h, fun h => by exact_mod_cast h⟩
  unfold indepCount
  rw [hset]

theorem indepCount_eq_zero_of_lt {j : ℤ} (hj : j < 0) : indepCount G j = 0 := by
  have hEmpty : ((indepSets G).filter (fun S => (S.card : ℤ) = j)) = ∅ := by
    apply Finset.filter_eq_empty_iff.mpr
    intro S _
    have hnn : (0:ℤ) ≤ (S.card : ℤ) := Int.natCast_nonneg _
    omega
  simp [indepCount, hEmpty]

theorem indepCount_eq_zero_of_gt {j : ℤ} (hj : (Fintype.card V : ℤ) < j) :
    indepCount G j = 0 := by
  have hEmpty : ((indepSets G).filter (fun S => (S.card : ℤ) = j)) = ∅ := by
    apply Finset.filter_eq_empty_iff.mpr
    intro S _
    have hle := Finset.card_le_univ S
    have hc : (S.card : ℤ) ≤ (Fintype.card V : ℤ) := by exact_mod_cast hle
    omega
  simp [indepCount, hEmpty]

/-- `F_G(x,y) := ∑_{S indep} x^{|S|} y^{|ext S|}`, outer = `x` = rank, inner
= `y` = extension count — the ruled TRANSPOSED (C1F1-REP-01) orientation
(R9C1-E2). THE TRANSPOSITION ELEMENT (E3-06), genuinely open at seal
(BT-2 item 3, carried from the frozen contract's own `a20_screen`). -/
noncomputable def genFun : Polynomial (Polynomial ℤ) :=
  ∑ S ∈ indepSets G, Polynomial.C ((Polynomial.X : Polynomial ℤ) ^ (ext G S).card) *
    Polynomial.X ^ S.card

/-- Internal/unregistered: `genFun`'s own `x^k` coefficient is the indicator
sum over independent sets of the matching size, valued in the inner ring —
isolated FIRST, before differentiating, so the bridge proof below does not
have to unfold both `genFun` and `genFunDerivAtOne` in lock-step (a
different derivation shape from either C2 critic's probe). -/
theorem genFun_coeff (k : ℕ) :
    (genFun G).coeff k
      = ∑ S ∈ indepSets G, if S.card = k then (Polynomial.X : Polynomial ℤ) ^ (ext G S).card else 0 := by
  unfold genFun
  rw [Polynomial.finsetSum_coeff]
  refine Finset.sum_congr rfl (fun S _ => ?_)
  rw [Polynomial.coeff_C_mul, Polynomial.coeff_X_pow]
  by_cases h : k = S.card
  · simp [h]
  · simp [h, Ne.symm h]

theorem deriv_X_pow_eval_one (e : ℕ) :
    (Polynomial.derivative ((Polynomial.X : Polynomial ℤ) ^ e)).eval (1 : ℤ) = (e : ℤ) := by
  rw [Polynomial.derivative_X_pow]
  simp

/-- `∂_y F_G(x,y)`, evaluated at `y := 1` — built termwise at the correct
(inner) nesting level. -/
noncomputable def genFunDerivAtOne : Polynomial ℤ :=
  ∑ S ∈ indepSets G,
    Polynomial.C ((Polynomial.derivative ((Polynomial.X : Polynomial ℤ) ^ (ext G S).card)).eval
        (1 : ℤ)) *
      Polynomial.X ^ S.card

theorem coeff_genFunDerivAtOne_term (S : Finset V) (k : ℕ) :
    (Polynomial.C
          ((Polynomial.derivative ((Polynomial.X : Polynomial ℤ) ^ (ext G S).card)).eval
              (1 : ℤ)) *
        Polynomial.X ^ S.card : Polynomial ℤ).coeff k
      = if S.card = k then ((ext G S).card : ℤ) else 0 := by
  rw [Polynomial.coeff_C_mul, Polynomial.coeff_X_pow]
  by_cases h : k = S.card
  · simp [h, deriv_X_pow_eval_one]
  · simp [h, Ne.symm h]

/-- **E3-09, THE BRIDGE (C2C-G1, blocking).** `genFunDerivAtOne`'s
coefficients ARE the termwise `∂_y` of `genFun`'s coefficients at `y := 1`.
This is the only element that makes the TRANSPOSED orientation
kernel-checkable: it MUST fail to compile against the M1 orientation
revert (registered falsifier `E3-F1`), because its proof depends on
`genFun_coeff`'s indicator-sum structure, which the M1 substitution
destroys at exactly the case-split step below. -/
theorem genFunDerivAtOne_coeff (k : ℕ) :
    (genFunDerivAtOne G).coeff k
      = (Polynomial.derivative ((genFun G).coeff k)).eval (1 : ℤ) := by
  rw [genFun_coeff]
  unfold genFunDerivAtOne
  rw [Polynomial.finsetSum_coeff, Polynomial.derivative_sum, Polynomial.eval_finsetSum]
  refine Finset.sum_congr rfl (fun S _ => ?_)
  by_cases h : S.card = k
  · simp [h, deriv_X_pow_eval_one]
  · simp [h, Ne.symm h]

-- Reusable: sum of |t S| over S ∈ A = card of the biUnion of {S} × t S.
theorem card_biUnion_prod {α β : Type*} [DecidableEq α] [DecidableEq β]
    (A : Finset α) (t : α → Finset β) :
    (A.biUnion (fun S => (t S).image (Prod.mk S))).card = ∑ S ∈ A, (t S).card := by
  rw [Finset.card_biUnion]
  · exact Finset.sum_congr rfl fun S _ =>
      Finset.card_image_of_injective _ fun _ _ h => congrArg Prod.snd h
  · intro S1 _ S2 _ hne
    apply Finset.disjoint_left.mpr
    rintro ⟨a, b⟩ ha hb
    simp only [Finset.mem_image] at ha hb
    obtain ⟨v1, _, hv1⟩ := ha
    obtain ⟨v2, _, hv2⟩ := hb
    have e1 : S1 = a := ((Prod.mk.injEq _ _ _ _).mp hv1).1
    have e2 : S2 = a := ((Prod.mk.injEq _ _ _ _).mp hv2).1
    exact hne (e1.trans e2.symm)

def pairsBelow (k : ℕ) : Finset (Finset V × V) :=
  ((indepSets G).filter (fun S => S.card = k)).biUnion
    (fun S => (ext G S).image (Prod.mk S))

def pairsAt (k : ℕ) : Finset (Finset V × V) :=
  ((indepSets G).filter (fun S => S.card = k + 1)).biUnion
    (fun S => S.image (Prod.mk S))

theorem card_pairsBelow (k : ℕ) :
    (pairsBelow G k).card = ∑ S ∈ (indepSets G).filter (fun S => S.card = k), (ext G S).card :=
  card_biUnion_prod _ _

theorem card_pairsAt (k : ℕ) :
    (pairsAt G k).card = (k + 1) * ((indepSets G).filter (fun S => S.card = k + 1)).card := by
  rw [pairsAt, card_biUnion_prod]
  rw [Finset.sum_congr rfl (fun S hS => (Finset.mem_filter.mp hS).2), Finset.sum_const, smul_eq_mul,
    mul_comm]

theorem pairsBelow_bij (k : ℕ) : (pairsBelow G k).card = (pairsAt G k).card := by
  apply Finset.card_nbij' (fun p => (insert p.2 p.1, p.2)) (fun p => (p.1.erase p.2, p.2))
  · rintro ⟨S, v⟩ hp
    simp only [pairsBelow, Finset.mem_coe, Finset.mem_biUnion, Finset.mem_filter,
      Finset.mem_image] at hp
    obtain ⟨S', ⟨hS'i, hS'c⟩, v', hv', heq⟩ := hp
    obtain rfl : S = S' := (congrArg Prod.fst heq).symm
    obtain rfl : v = v' := (congrArg Prod.snd heq).symm
    obtain ⟨hvS, hindep⟩ := mem_ext G |>.mp hv'
    have hcard : (insert v S).card = k + 1 := by rw [Finset.card_insert_of_notMem hvS, hS'c]
    simp only [pairsAt, Finset.mem_coe, Finset.mem_biUnion, Finset.mem_filter, Finset.mem_image]
    exact ⟨insert v S, ⟨mem_indepSets G |>.mpr hindep, hcard⟩, v, Finset.mem_insert_self _ _, rfl⟩
  · rintro ⟨S, v⟩ hp
    simp only [pairsAt, Finset.mem_coe, Finset.mem_biUnion, Finset.mem_filter,
      Finset.mem_image] at hp
    obtain ⟨S', ⟨hS'i, hS'c⟩, v', hv', heq⟩ := hp
    obtain rfl : S = S' := (congrArg Prod.fst heq).symm
    obtain rfl : v = v' := (congrArg Prod.snd heq).symm
    have hindepS : Indep G S := mem_indepSets G |>.mp hS'i
    have hSerase : (S.erase v).card = k := by
      rw [Finset.card_erase_of_mem hv', hS'c]; omega
    have hSindep : Indep G (S.erase v) := indep_mono G (Finset.erase_subset _ _) hindepS
    have hinsIndep : Indep G (insert v (S.erase v)) := by rwa [Finset.insert_erase hv']
    simp only [pairsBelow, Finset.mem_coe, Finset.mem_biUnion, Finset.mem_filter, Finset.mem_image]
    refine ⟨S.erase v, ⟨mem_indepSets G |>.mpr hSindep, hSerase⟩, v, mem_ext G |>.mpr ⟨Finset.notMem_erase _ _, hinsIndep⟩, ?_⟩
    simp
  · rintro ⟨S, v⟩ hp
    simp only [pairsBelow, Finset.mem_coe, Finset.mem_biUnion, Finset.mem_filter, Finset.mem_image] at hp
    obtain ⟨S', ⟨_, _⟩, v', hv', heq⟩ := hp
    obtain rfl : S = S' := (congrArg Prod.fst heq).symm
    obtain rfl : v = v' := (congrArg Prod.snd heq).symm
    obtain ⟨hvS, _⟩ := mem_ext G |>.mp hv'
    simp [Finset.erase_insert hvS]
  · rintro ⟨S, v⟩ hp
    simp only [pairsAt, Finset.mem_coe, Finset.mem_biUnion, Finset.mem_filter, Finset.mem_image] at hp
    obtain ⟨S', ⟨_, _⟩, v', hv', heq⟩ := hp
    obtain rfl : S = S' := (congrArg Prod.fst heq).symm
    obtain rfl : v = v' := (congrArg Prod.snd heq).symm
    simp [Finset.insert_erase hv']

theorem double_count_nat (k : ℕ) :
    ∑ S ∈ (indepSets G).filter (fun S => S.card = k), (ext G S).card
      = (k + 1) * ((indepSets G).filter (fun S => S.card = k + 1)).card := by
  rw [← card_pairsBelow, ← card_pairsAt, pairsBelow_bij]

/-- Internal/unregistered: the double count, stated about `genFunDerivAtOne`
directly (C2-C's main theorem, kept as the load-bearing combinatorial fact;
E3-09/E3-10 route the registered obligation through it via the bridge). -/
theorem genFunDerivAtOne_coeff_eval (k : ℕ) :
    (genFunDerivAtOne G).coeff k = ((k + 1 : ℕ) : ℤ) * indepCount G ((k : ℤ) + 1) := by
  unfold genFunDerivAtOne
  rw [Polynomial.finsetSum_coeff, Finset.sum_congr rfl (fun S _ => coeff_genFunDerivAtOne_term G S k),
    ← Finset.sum_filter]
  have hcast := congrArg (fun n : ℕ => (n : ℤ)) (double_count_nat G k)
  simp only [Nat.cast_sum, Nat.cast_mul] at hcast
  rw [hcast]
  have hidx : ((k : ℤ) + 1) = ((k + 1 : ℕ) : ℤ) := by push_cast; ring
  rw [hidx, indepCount_natCast]

/-- **E3-10, `OB_E3_LEAN_MAIN`, STATED ON `genFun`.** `[x^k] (∂_y F_G)(x,1)
= (k+1)·i_{k+1}(G)`, routed through the bridge so `genFun` is a proof
dependency of the obligation's own statement. -/
theorem coeff_deriv_eval_one (k : ℕ) :
    (Polynomial.derivative ((genFun G).coeff k)).eval (1 : ℤ)
      = ((k + 1 : ℕ) : ℤ) * indepCount G ((k : ℤ) + 1) := by
  rw [← genFunDerivAtOne_coeff, genFunDerivAtOne_coeff_eval]

/-- **E3-08, ZERO_EXTENSION_CARRIER (NEW).** `Polynomial.coeff` is
`ℕ`-indexed and forced; `derivCoeff` is the explicit zero extension to every
integer rank `OB-C10-T1-ZERO-EXTENSION` and `OB-U1-TRS-DEFINITION`'s
integer-rank clause require of a downstream consumer. -/
noncomputable def derivCoeff (k : ℤ) : ℤ := if 0 ≤ k then (genFunDerivAtOne G).coeff k.toNat else 0

/-- **E3-11, INTEGER_RANK_MASTER_STATEMENT.** Holds at every integer rank
with no side condition. -/
theorem coeff_deriv_eval_one_int (k : ℤ) :
    derivCoeff G k = (k + 1) * indepCount G (k + 1) := by
  unfold derivCoeff
  by_cases hk : 0 ≤ k
  · simp only [hk, if_true]
    obtain ⟨n, rfl⟩ := Int.eq_ofNat_of_zero_le hk
    have htoNat : ((n : ℤ)).toNat = n := by simp
    rw [htoNat, genFunDerivAtOne_coeff_eval]
    push_cast
    ring
  · simp only [hk, if_false]
    have h1 : k + 1 ≤ 0 := by omega
    rcases lt_or_eq_of_le h1 with hlt | heq
    · rw [indepCount_eq_zero_of_lt G hlt]; ring
    · rw [heq]; ring

theorem boundary_neg_rank_aux : True := trivial

omit [Fintype V] [DecidableEq V] [DecidableRel G.Adj] in
theorem singleton_indep (v : V) : Indep G {v} := by
  intro u hu w hw
  simp only [Finset.mem_singleton] at hu hw
  rw [hu, hw]
  exact G.irrefl v

theorem indepCount_one : indepCount G (1 : ℤ) = (Fintype.card V : ℤ) := by
  unfold indepCount
  have hset : ((indepSets G).filter (fun S => (S.card : ℤ) = (1 : ℤ)))
      = Finset.univ.image (fun v : V => ({v} : Finset V)) := by
    ext S
    simp only [Finset.mem_filter, mem_indepSets, Finset.mem_image, Finset.mem_univ, true_and]
    constructor
    · rintro ⟨_, hc⟩
      have hc' : S.card = 1 := by exact_mod_cast hc
      obtain ⟨a, ha⟩ := Finset.card_eq_one.mp hc'
      exact ⟨a, ha.symm⟩
    · rintro ⟨a, rfl⟩
      refine ⟨singleton_indep G a, ?_⟩
      simp
  rw [hset, Finset.card_image_of_injective _ (fun a b h => by simpa using h)]
  simp

/-- **E3-15, restated on `genFun`.** `i_1(G) = |V|`. -/
theorem boundary_k0 :
    (Polynomial.derivative ((genFun G).coeff 0)).eval (1 : ℤ) = (Fintype.card V : ℤ) := by
  rw [coeff_deriv_eval_one]
  norm_num [indepCount_one]

/-- **E3-16, via `derivCoeff`.** Vacuous by cardinality, true of every graph. -/
theorem boundary_top_rank : derivCoeff G (Fintype.card V : ℤ) = 0 := by
  unfold derivCoeff
  have hnn : (0:ℤ) ≤ (Fintype.card V : ℤ) := Int.natCast_nonneg _
  simp only [hnn, if_true]
  rw [show ((Fintype.card V : ℤ)).toNat = Fintype.card V from by simp]
  rw [genFunDerivAtOne_coeff_eval, indepCount_eq_zero_of_gt G (by omega)]
  ring

/-- **E3-17.** The capacity boundary unstatable on the coefficient side at
C1/C2; statable here because `derivCoeff` exists. -/
theorem boundary_neg_rank {k : ℤ} (hk : k < 0) : derivCoeff G k = 0 := by
  unfold derivCoeff
  simp [not_le.mpr hk]

/-- **E3-19, restated on `genFun`.** -/
theorem coeff_ne_zero_of_indepCount_ne_zero {k : ℕ} (h : indepCount G ((k : ℤ) + 1) ≠ 0) :
    (Polynomial.derivative ((genFun G).coeff k)).eval (1 : ℤ) ≠ 0 := by
  rw [coeff_deriv_eval_one]
  exact mul_ne_zero (by exact_mod_cast (Nat.succ_ne_zero k)) h

/-! ### Executed check: P₃ (path on 3 vertices, edges 0-1, 1-2) -/
section Example

def P3Adj : Fin 3 → Fin 3 → Prop :=
  fun a b => (a = 0 ∧ b = 1) ∨ (a = 1 ∧ b = 0) ∨ (a = 1 ∧ b = 2) ∨ (a = 2 ∧ b = 1)

instance : DecidableRel P3Adj := fun a b => by unfold P3Adj; infer_instance

def P3 : Graph (Fin 3) where
  Adj := P3Adj
  symm := by intro u v h; unfold P3Adj at *; tauto
  irrefl := by decide

instance : DecidableRel P3.Adj := inferInstanceAs (DecidableRel P3Adj)

example : indepCount P3 0 = 1 := by decide
example : indepCount P3 1 = 3 := by decide
example : indepCount P3 2 = 1 := by decide
example : indepCount P3 3 = 0 := by decide
example : indepCount P3 (-1) = 0 := indepCount_eq_zero_of_lt P3 (by norm_num)

/-- **E3-18, restated on `genFun`.** `α(P₃) = 2`, last nonzero rank `k = 1`,
value `2·i_2(P3) = 2`. -/
theorem boundary_last_nonzero_rank_P3 :
    (Polynomial.derivative ((genFun P3).coeff 1)).eval (1 : ℤ) = 2 := by
  rw [coeff_deriv_eval_one]
  norm_num [show indepCount P3 2 = 1 from by decide]

example : (Polynomial.derivative ((genFun P3).coeff 1)).eval (1 : ℤ) ≠ 0 :=
  coeff_ne_zero_of_indepCount_ne_zero P3 (by decide)

end Example

end R9C3C
