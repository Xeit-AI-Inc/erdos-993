import Erdos993GapBridge.TreeE3Large
import Erdos993GapBridge.TreePLC4Large

namespace Erdos993GapBridge

variable {V : Type*} [Fintype V] [Nonempty V] [DecidableEq V]

theorem tree_plc4_of_card_ge_27
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hT : T.IsTree) (hn : 27 ≤ Fintype.card V) :
    Erdos993R2C3.ind T 4 * Erdos993R2C3.ind T 4 >
      Erdos993R2C3.ind T 3 * Erdos993R2C3.ind T 5 := by
  have he3 := tree_e3_large_order T hT hn
  have he5 := five_ind_five_le T hT hn
  have hi4 : 0 < Erdos993R2C3.ind T 4 := by omega
  nlinarith

end Erdos993GapBridge
