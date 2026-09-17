import R23Groundwork.Relation

/-!
# BRIDGE-1 / BRIDGE-2 (`SEMANTIC-CONTRACT.md` §4), C2-T2 charge (LC-1/LC-2)

Sorry-free proofs of `THM_R23_B_bridge1` and `THM_R23_B_bridge2`
(`Theorems.lean`), at the BROADENED scope of C1-LEDGER rows
`R23-C1-BRIDGE1`/`R23-C1-BRIDGE2` (every finite simple graph on this file's
`Graph`/`Tree`/`Relation` encoding, every `v : Fin n`, every `r : ℕ` for
BRIDGE-1; every `IsTree` `G` and `p ≥ xOf + 2` for BRIDGE-2 — the tree/rank
hypotheses are carried on BRIDGE-2's signature per the contract but are NOT
needed by this proof, exactly the "broadened beyond the contract" finding
already registered at C1 for the informal proof, T5 F1/F2).

Every lemma here is a real, no-`sorry`, no-extra-axiom Lean declaration on
THIS file's encoding (`Graph.lean`/`Tree.lean`/`Relation.lean`, unmodified
from C1-T6's sealed evidence). Nothing here is `formally_verified` in the
VerityOS sense (no `lean-proof-workflow` closeout ran — see `RETURN.md`).
-/

namespace R23
namespace Graph

variable {n : ℕ}

/-! ## Two small Fin-n combinatorial facts, independent of `Graph`/`Tree` -/

/-- Tagging by a fixed first coordinate is injective. -/
private theorem tag_injective (v : Fin n) :
    Function.Injective (fun A : Finset (Fin n) => (v, A)) :=
  fun _ _ h => congrArg Prod.snd h

/-- Cardinality of a tagged disjoint union: `|⊔_{v∈s} {v} × f(v)| = Σ_{v∈s} |f(v)|`.
    Pure `Finset`/`Fin n` combinatorics — no `Graph` structure involved. -/
private theorem card_biUnion_tagged (f : Fin n → Finset (Finset (Fin n))) (s : Finset (Fin n)) :
    (s.biUnion (fun v => (f v).image (fun A => (v, A)))).card = ∑ v ∈ s, (f v).card := by
  have hdisj : (↑s : Set (Fin n)).PairwiseDisjoint
      (fun v => (f v).image (fun A => (v, A))) := by
    intro v _ w _ hvw
    apply Finset.disjoint_left.mpr
    intro x hx1 hx2
    obtain ⟨A, _, hA⟩ := Finset.mem_image.mp hx1
    obtain ⟨B, _, hB⟩ := Finset.mem_image.mp hx2
    have hxeq : (v, A) = (w, B) := hA.trans hB.symm
    exact hvw (congrArg Prod.fst hxeq)
  rw [Finset.card_biUnion hdisj]
  exact Finset.sum_congr rfl (fun v _ => Finset.card_image_of_injective _ (tag_injective v))

variable (G : Graph n)

/-! ## BRIDGE-1 groundwork: `Ind_r` restricted below a removed set -/

/-- `IndOn` on a smaller carrier `U \ W` is exactly the `A ∩ W = ∅` slice of
    `IndOn U r`: both sides say "A is an independent r-subset of U that
    avoids W". Pure `Finset` reasoning; `C_r(v)`'s own carrier restriction
    (`Graph.IndOn`'s doc comment) is exactly this fact specialized. -/
theorem indOn_sdiff (U W : Finset (Fin n)) (r : ℕ) :
    G.IndOn (U \ W) r = (G.IndOn U r).filter (fun A => ¬ (A ∩ W).Nonempty) := by
  apply Finset.ext
  intro A
  constructor
  · intro hA
    have hsub : A ⊆ U \ W := (Finset.mem_powersetCard.mp (Finset.mem_filter.mp hA).1).1
    have hcard : A.card = r := (Finset.mem_powersetCard.mp (Finset.mem_filter.mp hA).1).2
    have hindep : G.IsIndependent A := (Finset.mem_filter.mp hA).2
    have hsubU : A ⊆ U := fun x hx => (Finset.mem_sdiff.mp (hsub hx)).1
    have hnW : ∀ x ∈ A, x ∉ W := fun x hx => (Finset.mem_sdiff.mp (hsub hx)).2
    refine Finset.mem_filter.mpr
      ⟨Finset.mem_filter.mpr ⟨Finset.mem_powersetCard.mpr ⟨hsubU, hcard⟩, hindep⟩, ?_⟩
    rintro ⟨x, hx⟩
    obtain ⟨hxA, hxW⟩ := Finset.mem_inter.mp hx
    exact hnW x hxA hxW
  · intro hA
    obtain ⟨hA', hne⟩ := Finset.mem_filter.mp hA
    obtain ⟨hpc, hindep⟩ := Finset.mem_filter.mp hA'
    obtain ⟨hsubU, hcard⟩ := Finset.mem_powersetCard.mp hpc
    have hnW : ∀ x ∈ A, x ∉ W := by
      intro x hx hxW
      exact hne ⟨x, Finset.mem_inter.mpr ⟨hx, hxW⟩⟩
    have hsub : A ⊆ U \ W := fun x hx => Finset.mem_sdiff.mpr ⟨hsubU hx, hnW x hx⟩
    exact Finset.mem_filter.mpr ⟨Finset.mem_powersetCard.mpr ⟨hsub, hcard⟩, hindep⟩

/-! ## `v ∈ N[s_v]` unconditionally, hence `H_v \ W_v = T - N[s_v]` -/

/-- `v` always lies in the closed neighborhood of its own `support`: if `v`
    has a neighbor, `support v` IS one of them (by construction), so by
    symmetry `v` is a neighbor of `support v`; if `v` is isolated,
    `support v` defaults to `v` itself (the sentinel branch), so `v` is the
    center of its own closed neighborhood. Needs no `IsLeaf`/`IsTree`
    hypothesis — this is the fact underlying BRIDGE-1's BROADENED scope
    (every `v`, not just leaves). -/
theorem support_mem_closedNbhd (v : Fin n) :
    v ∈ G.closedNbhd (G.support v) := by
  unfold closedNbhd
  by_cases h : (G.nbrs v).Nonempty
  · have hmem : G.support v ∈ G.nbrs v := by
      unfold support
      rw [dif_pos h]
      exact (G.nbrs v).min'_mem h
    unfold nbrs at hmem
    have hadj : G.Adj v (G.support v) := (Finset.mem_filter.mp hmem).2
    have hadj' : G.Adj (G.support v) v := G.symm v (G.support v) hadj
    have hvnbrs : v ∈ G.nbrs (G.support v) := by
      unfold nbrs
      exact Finset.mem_filter.mpr ⟨Finset.mem_univ v, hadj'⟩
    exact Finset.mem_insert_of_mem hvnbrs
  · have heq : G.support v = v := by
      unfold support
      rw [dif_neg h]
    rw [heq]
    exact Finset.mem_insert_self v _

/-- `H_v \ W_v = T - N[s_v]` (`Hcarrier v \ W v = removedClosedNbhdCarrier v`),
    unconditionally. Since `N_T(s_v) = {v} ∪ W_v` and `v ∈ N[s_v]`
    (`support_mem_closedNbhd`), `{v, s_v} ∪ W_v = N[s_v]` exactly, so
    removing `{v,s_v}` then `W_v` from `univ` is the same as removing
    `N[s_v]` once. -/
theorem hcarrier_sdiff_w_eq_removedClosedNbhd (v : Fin n) :
    G.Hcarrier v \ G.W v = G.removedClosedNbhdCarrier v := by
  have hvN : v ∈ G.closedNbhd (G.support v) := G.support_mem_closedNbhd v
  have hkey : ({v, G.support v} : Finset (Fin n)) ∪ (G.nbrs (G.support v)).erase v
      = G.closedNbhd (G.support v) := by
    unfold closedNbhd at hvN ⊢
    apply Finset.Subset.antisymm
    · intro x hx
      rcases Finset.mem_union.mp hx with hx1 | hx2
      · rcases Finset.mem_insert.mp hx1 with rfl | hx1'
        · exact hvN
        · rw [Finset.mem_singleton] at hx1'
          rw [hx1']
          exact Finset.mem_insert_self _ _
      · exact Finset.mem_insert_of_mem (Finset.mem_erase.mp hx2).2
    · intro x hx
      rcases Finset.mem_insert.mp hx with rfl | hx2
      · exact Finset.mem_union_left _ (Finset.mem_insert.mpr (Or.inr (Finset.mem_singleton.mpr rfl)))
      · by_cases hxv : x = v
        · rw [hxv]
          exact Finset.mem_union_left _ (Finset.mem_insert.mpr (Or.inl rfl))
        · exact Finset.mem_union_right _ (Finset.mem_erase.mpr ⟨hxv, hx2⟩)
  have hSdiff : G.Hcarrier v \ G.W v
      = Finset.univ \ (({v, G.support v} : Finset (Fin n)) ∪ (G.nbrs (G.support v)).erase v) := by
    unfold Hcarrier W
    ext x
    simp only [Finset.mem_sdiff, Finset.mem_univ, true_and, Finset.mem_union]
    tauto
  unfold removedClosedNbhdCarrier
  rw [hSdiff, hkey]

/-! ## `THM_R23_B_bridge1` -/

/-- `LC-1`: `|C_r(v)| = i_r(H_v) - i_r(T - N[s_v])` for every `v : Fin n` and
    `r : ℕ`, on this file's encoding — the exact statement of
    `THM_R23_B_bridge1` (`Theorems.lean`), proved sorry-free. -/
theorem bridge1_proof (v : Fin n) (r : ℕ) :
    ((G.C v r).card : ℤ)
      = (G.iOn (G.Hcarrier v) r : ℤ) - (G.iOn (G.removedClosedNbhdCarrier v) r : ℤ) := by
  have hEq : G.Hcarrier v \ G.W v = G.removedClosedNbhdCarrier v :=
    G.hcarrier_sdiff_w_eq_removedClosedNbhd v
  have hFilterEq : G.IndOn (G.Hcarrier v \ G.W v) r
      = (G.IndOn (G.Hcarrier v) r).filter (fun A => ¬ (A ∩ G.W v).Nonempty) :=
    G.indOn_sdiff (G.Hcarrier v) (G.W v) r
  have hadd : (G.C v r).card + (G.IndOn (G.Hcarrier v \ G.W v) r).card
      = (G.IndOn (G.Hcarrier v) r).card := by
    rw [hFilterEq]
    exact Finset.card_filter_add_card_filter_not (s := G.IndOn (G.Hcarrier v) r)
      (fun A => (A ∩ G.W v).Nonempty)
  rw [hEq] at hadd
  unfold iOn
  omega

/-! ## `THM_R23_B_bridge2` -/

/-- `|P p| = Σ_{v∈Favorable p} |C_p(v)|`, from the tagged-disjoint-union
    structure of `P` (`card_biUnion_tagged`). -/
theorem card_P_eq_sum (p : ℕ) :
    (G.P p).card = ∑ v ∈ G.Favorable p, (G.C v p).card := by
  unfold P
  exact card_biUnion_tagged (fun v => G.C v p) (G.Favorable p)

/-- `|N p| = Σ_{v∈Favorable p} |C_{p-1}(v)|`, same structure. -/
theorem card_N_eq_sum (p : ℕ) :
    (G.N p).card = ∑ v ∈ G.Favorable p, (G.C v (p - 1)).card := by
  unfold N
  exact card_biUnion_tagged (fun v => G.C v (p - 1)) (G.Favorable p)

/-- `LC-2`: `|P p| - |N p| = S(T,p)`, the exact statement of
    `THM_R23_B_bridge2` (`Theorems.lean`), proved sorry-free (stated here
    without the `IsTree` hypothesis, which `Theorems.lean`'s `IsTree` def
    cannot be referenced from this lower file — `Theorems.lean` supplies it
    unused when calling this lemma). Uses `bridge1_proof` at `r = p` and
    `r = p - 1` termwise. `hp : p ≥ xOf + 2` IS needed (not vestigial): it
    gives `p ≥ 1`, so `(p - 1) + 1 = p` in `ℕ`, which is what lets
    `DeltaOn _ (p-1)`'s `i _ ((p-1)+1)` term line up with `bridge1_proof`'s
    `r = p` instance. This still matches C1-LEDGER `R23-C1-BRIDGE2`'s
    "BROADENED beyond the contract" scope: `IsTree` itself is dropped, only
    the rank floor survives, and only for this reason. -/
theorem bridge2_proof (p : ℕ) (hp : p ≥ G.xOf + 2) :
    ((G.P p).card : ℤ) - ((G.N p).card : ℤ) = G.S p := by
  have hpc : p - 1 + 1 = p := by omega
  have hP := G.card_P_eq_sum p
  have hN := G.card_N_eq_sum p
  unfold Graph.S
  rw [hP, hN]
  push_cast
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro v _
  have h1 := G.bridge1_proof v p
  have h2 := G.bridge1_proof v (p - 1)
  unfold Graph.g Graph.b Graph.B Graph.DeltaOn
  rw [hpc]
  linarith [h1, h2]

end Graph
end R23
