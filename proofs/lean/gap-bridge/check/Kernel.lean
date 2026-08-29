import Erdos993GapBridge.ConnectedTripleBridge
import Erdos993GapBridge.TreePLC4Recovered

#check Erdos993GapBridge.three_twoSets_union_four_has_two_intersections
#check Erdos993GapBridge.tree_plc4_of_card_ge_27

namespace StatementFidelity

variable {V : Type*} [Fintype V] [Nonempty V] [DecidableEq V]

example
    (T : SimpleGraph V) [DecidableRel T.Adj]
    (hT : T.IsTree) (hn : 27 <= Fintype.card V) :
    Erdos993R2C3.ind T 4 * Erdos993R2C3.ind T 4 >
      Erdos993R2C3.ind T 3 * Erdos993R2C3.ind T 5 :=
  Erdos993GapBridge.tree_plc4_of_card_ge_27 T hT hn

end StatementFidelity
