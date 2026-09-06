import C4LForestBridge

noncomputable section

namespace RTree

/-- Along an address edge, a neighbor no deeper than its endpoint is that
endpoint's unique parent. -/
private theorem addrAdjacent_eq_dropLast_of_length_le {u w : List Nat}
    (h : addrAdjacent u w) (hw : w.length <= u.length) :
    w = u.dropLast := by
  unfold addrAdjacent at h
  rcases h with h | h
  · obtain ⟨hwne, rfl⟩ := h
    cases w with
    | nil => simp at hwne
    | cons a ws =>
      exfalso
      apply Nat.not_succ_le_self ws.length
      simpa only [List.length_cons, List.length_dropLast, Nat.succ_sub_one] using hw
  · exact h.2

/-- The assigned vertex-scoped deletion-acyclicity statement. The proof is
directly about `addrAdjacent` cycles and does not invoke forest formulas. -/
theorem c5_vertex_scoped_deletion_acyclicity (t : RTree) (v : List Nat)
    (_hv : v ∈ t.vertices) :
    (t.c13DeletionGraph v).IsAcyclic := by
  classical
  intro x c hc
  let S : Finset (t.C13DeletedCarrier v) := c.support.toFinset
  have hS : S.Nonempty := by
    refine ⟨x, ?_⟩
    simp [S]
  let L : Finset Nat := S.image (fun z => z.1.length)
  have hL : L.Nonempty := hS.image _
  obtain ⟨m, hmS, hmLen⟩ := Finset.mem_image.mp (Finset.max'_mem L hL)
  have hmax : ∀ z ∈ S, z.1.length ≤ m.1.length := by
    intro z hz
    have hzL : z.1.length ∈ L := Finset.mem_image.mpr ⟨z, hz, rfl⟩
    calc
      z.1.length <= L.max' hL := Finset.le_max' L _ hzL
      _ = m.1.length := hmLen.symm
  have hm : m ∈ c.support := by
    simpa [S] using hmS
  let c' := c.rotate m hm
  have hc' : c'.IsCycle := hc.rotate hm
  have hnil : ¬ c'.Nil := hc'.not_nil
  have hsnd_mem' : c'.snd ∈ c'.support := by
    exact List.mem_of_mem_tail (c'.snd_mem_tail_support hnil)
  have hpen_mem' : c'.penultimate ∈ c'.support := by
    exact List.mem_of_mem_dropLast (c'.penultimate_mem_dropLast_support hnil)
  have hsnd_mem : c'.snd ∈ c.support :=
    (c.mem_support_rotate_iff m hm).mp hsnd_mem'
  have hpen_mem : c'.penultimate ∈ c.support :=
    (c.mem_support_rotate_iff m hm).mp hpen_mem'
  have hsnd_le : c'.snd.1.length <= m.1.length := hmax _ (by simpa [S] using hsnd_mem)
  have hpen_le : c'.penultimate.1.length <= m.1.length := hmax _ (by simpa [S] using hpen_mem)
  have hsnd_adj : addrAdjacent m.1 c'.snd.1 := by
    exact c'.adj_snd hnil
  have hpen_adj : addrAdjacent m.1 c'.penultimate.1 := by
    exact (addrAdjacent_comm _ _).mp (c'.adj_penultimate hnil)
  have hsnd_parent : c'.snd.1 = m.1.dropLast :=
    addrAdjacent_eq_dropLast_of_length_le hsnd_adj hsnd_le
  have hpen_parent : c'.penultimate.1 = m.1.dropLast :=
    addrAdjacent_eq_dropLast_of_length_le hpen_adj hpen_le
  apply hc'.snd_ne_penultimate
  apply Subtype.ext
  exact hsnd_parent.trans hpen_parent.symm

end RTree

#print axioms RTree.c5_vertex_scoped_deletion_acyclicity
