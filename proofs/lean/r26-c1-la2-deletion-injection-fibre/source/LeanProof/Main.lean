import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition R26LA2.indepPowerset 16f62186a8ff95ee3f2688ce4fc3473511013583285672e7edcc48bd49feed79
namespace R26LA2

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- `I(U)`: the independent subsets of a Finset `U` of vertices, as a filter of `U.powerset`. -/
def indepPowerset (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) : Finset (Finset V) :=
  U.powerset.filter fun A => G.IsIndepSet (A : Set V)

end R26LA2
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN lemma C5LA1.sum_card_filter_comm d46b2e45dbdc672c60d2cdb3cc0fee99969af8f296a0c8d73fc88a2cebf3eaf9
namespace C5LA1

open SimpleGraph

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma sum_card_filter_comm {α β : Type*} [DecidableEq α] [DecidableEq β]
    (s : Finset α) (t : Finset β) (r : α → β → Prop) [∀ a b, Decidable (r a b)] :
    ∑ a ∈ s, (t.filter fun b => r a b).card = ∑ b ∈ t, (s.filter fun a => r a b).card := by
  simp_rw [Finset.card_filter]
  rw [Finset.sum_comm]

end C5LA1
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN lemma R26LA2.deletionInjectionBound 181215acccb1d36090fdf7f8aaa6b65da869f039b2673418434b6ee7e6a58d93
namespace R26LA2

open SimpleGraph C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (a) The deletion injection: `2 * Σ_{A ∈ I(U)} |A| ≤ |U| * |I(U)|`, via the injection
`A ↦ A.erase u` from the independent subsets of `U` containing a fixed `u` into those omitting
it (well-defined and injective for every fixed `u`, no graph hypothesis beyond independence
being downward closed is used). -/
lemma deletionInjectionBound (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) :
    2 * ∑ A ∈ indepPowerset G U, A.card ≤ U.card * (indepPowerset G U).card := by
  classical
  set I := indepPowerset G U with hI_def
  have hstep : ∀ u ∈ U, 2 * (I.filter fun A => u ∈ A).card ≤ I.card := by
    intro u _hu
    have hsplit : (I.filter fun A => u ∈ A).card + (I.filter fun A => ¬ u ∈ A).card = I.card :=
      Finset.card_filter_add_card_filter_not (fun A => u ∈ A)
    have hinj : (I.filter fun A => u ∈ A).card ≤ (I.filter fun A => ¬ u ∈ A).card := by
      apply Finset.card_le_card_of_injOn (fun A => A.erase u)
      · intro A hA
        simp only [Finset.mem_coe, Finset.mem_filter] at hA
        obtain ⟨hAI, huA⟩ := hA
        have hAI' : A ⊆ U ∧ G.IsIndepSet (A : Set V) := by
          simpa only [hI_def, indepPowerset, Finset.mem_filter, Finset.mem_powerset] using hAI
        simp only [Finset.mem_coe, Finset.mem_filter]
        refine ⟨?_, Finset.notMem_erase u A⟩
        simp only [hI_def, indepPowerset, Finset.mem_filter, Finset.mem_powerset]
        exact ⟨fun x hx => hAI'.1 (Finset.mem_of_mem_erase hx),
          Set.Pairwise.mono (fun x hx => Finset.mem_of_mem_erase hx) hAI'.2⟩
      · intro A hA B hB hAB
        simp only [Finset.mem_coe, Finset.mem_filter] at hA hB
        have hAB' : A.erase u = B.erase u := hAB
        have huA : u ∈ A := hA.2
        have huB : u ∈ B := hB.2
        calc A = insert u (A.erase u) := (Finset.insert_erase huA).symm
          _ = insert u (B.erase u) := by rw [hAB']
          _ = B := Finset.insert_erase huB
    omega
  have hdbl : ∑ u ∈ U, (I.filter fun A => u ∈ A).card = ∑ A ∈ I, A.card := by
    rw [C5LA1.sum_card_filter_comm U I (fun u A => u ∈ A)]
    apply Finset.sum_congr rfl
    intro A hA
    have hAsub : A ⊆ U := by
      simp only [hI_def, indepPowerset, Finset.mem_filter, Finset.mem_powerset] at hA
      exact hA.1
    congr 1
    apply Finset.ext
    intro x
    simp only [Finset.mem_filter]
    constructor
    · rintro ⟨_, hxA⟩; exact hxA
    · intro hxA; exact ⟨hAsub hxA, hxA⟩
  calc 2 * ∑ A ∈ I, A.card
      = 2 * ∑ u ∈ U, (I.filter fun A => u ∈ A).card := by rw [hdbl]
    _ = ∑ u ∈ U, 2 * (I.filter fun A => u ∈ A).card := by rw [Finset.mul_sum]
    _ ≤ ∑ _u ∈ U, I.card := Finset.sum_le_sum hstep
    _ = U.card * I.card := by rw [Finset.sum_const, smul_eq_mul, mul_comm]

end R26LA2
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN theorem R26LA2.fibreInequalitySharp c8fddaacb8d3ba8c6cf7c7f94a8135f76bfd23bacb9a75264ac2e4a00ed961f2
namespace R26LA2

open SimpleGraph C5LA1

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- (1) Critic-derived sharpening of U2's (b): the fibre sum dominates
`(ℓ − |U|)·|I(U)|` for EVERY `ℓ : ℕ`, no hypothesis. -/
theorem fibreInequalitySharp (G : SimpleGraph V) [DecidableRel G.Adj] (U : Finset V) (ℓ : ℕ) :
    ((ℓ : ℤ) - (U.card : ℤ)) * ((indepPowerset G U).card : ℤ)
      ≤ ∑ A ∈ indepPowerset G U, ((ℓ : ℤ) - 2 * (A.card : ℤ)) := by
  classical
  have hbound := deletionInjectionBound G U
  have hboundZ : 2 * ∑ A ∈ indepPowerset G U, (A.card : ℤ)
      ≤ (U.card : ℤ) * ((indepPowerset G U).card : ℤ) := by
    have hc : ((2 * ∑ A ∈ indepPowerset G U, A.card : ℕ) : ℤ)
        ≤ ((U.card * (indepPowerset G U).card : ℕ) : ℤ) := by exact_mod_cast hbound
    push_cast at hc
    linarith [hc]
  have hsum_eq : ∑ A ∈ indepPowerset G U, ((ℓ : ℤ) - 2 * (A.card : ℤ))
      = (ℓ : ℤ) * ((indepPowerset G U).card : ℤ)
        - 2 * ∑ A ∈ indepPowerset G U, (A.card : ℤ) := by
    rw [Finset.sum_sub_distrib, Finset.sum_const, Finset.mul_sum]
    push_cast
    ring
  rw [hsum_eq]
  nlinarith [hboundZ]

end R26LA2
-- VERITYOS ENTRY 4 END

