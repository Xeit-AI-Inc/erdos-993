import R12C4T.Targets

noncomputable section

namespace RTree

theorem beta_gap_eq_of_guard
    (t : RTree) (v : List Nat) (p : Nat)
    (hv : v ∈ t.leaves) (hk : 2 ≤ K_A t p) :
    t.b v p - t.Bgen (t.support v) ((p : Int) - 1) =
      ((t.indepCountOn (t.doubleDeleteVertices v) p : Int) -
          (t.indepCountOn (t.vertices \ t.closedNbhd (t.support v)) p : Int)) -
        ((t.indepCountOn (t.doubleDeleteVertices v) (p - 1) : Int) -
          (t.indepCountOn (t.vertices \ t.closedNbhd (t.support v)) (p - 1) : Int)) := by
  have hp : 1 ≤ p := by
    unfold K_A at hk
    omega
  have hpred : (p : Int) - 1 = ((p - 1 : Nat) : Int) := by
    omega
  unfold b bZ Bgen
  rw [hpred, DeltaOnZ_natCast, DeltaOnZ_natCast]
  unfold DeltaOn
  rw [Nat.sub_add_cancel hp]
  ring

theorem beta_bound_iff_gap_le_of_guard
    (t : RTree) (v : List Nat) (p : Nat)
    (hv : v ∈ t.leaves) (hk : 2 ≤ K_A t p) :
    t.b v p ≤ t.Bgen (t.support v) ((p : Int) - 1) ↔
      ((t.indepCountOn (t.doubleDeleteVertices v) p : Int) -
          (t.indepCountOn (t.vertices \ t.closedNbhd (t.support v)) p : Int)) ≤
        ((t.indepCountOn (t.doubleDeleteVertices v) (p - 1) : Int) -
          (t.indepCountOn (t.vertices \ t.closedNbhd (t.support v)) (p - 1) : Int)) := by
  have hgap := t.beta_gap_eq_of_guard v p hv hk
  constructor
  · intro hbound
    have hnonpos : t.b v p - t.Bgen (t.support v) ((p : Int) - 1) ≤ 0 :=
      sub_nonpos.mpr hbound
    rw [hgap] at hnonpos
    exact sub_nonpos.mp hnonpos
  · intro hgaple
    have hnonpos :
        ((t.indepCountOn (t.doubleDeleteVertices v) p : Int) -
            (t.indepCountOn (t.vertices \ t.closedNbhd (t.support v)) p : Int)) -
          ((t.indepCountOn (t.doubleDeleteVertices v) (p - 1) : Int) -
            (t.indepCountOn (t.vertices \ t.closedNbhd (t.support v)) (p - 1) : Int)) ≤ 0 :=
      sub_nonpos.mpr hgaple
    rw [← hgap] at hnonpos
    exact sub_nonpos.mp hnonpos

end RTree

#print RTree.beta_gap_eq_of_guard
#print axioms RTree.beta_gap_eq_of_guard
#print RTree.beta_bound_iff_gap_le_of_guard
#print axioms RTree.beta_bound_iff_gap_le_of_guard
