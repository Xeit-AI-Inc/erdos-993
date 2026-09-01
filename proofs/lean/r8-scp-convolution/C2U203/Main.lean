import Mathlib
namespace C2U203

abbrev Seq := AddMonoidAlgebra Nat Int

def delta (a : Seq) (r : Int) : Int :=
  Int.ofNat (a.coeff (r + 1)) - Int.ofNat (a.coeff r)

def WeakUnimodal (a : Seq) : Prop :=
  forall p q : Int, p < q -> Not (And (delta a p < 0) (0 < delta a q))

def SCP (a : Seq) : Prop :=
  forall b : Seq, WeakUnimodal b -> WeakUnimodal (a * b)

end C2U203
namespace C2U203

theorem scp_convolution_closed (a c : Seq) (ha : SCP a) (hc : SCP c) :
    SCP (a * c) := by
  intro b hb
  rw [mul_assoc]
  exact ha (c * b) (hc b hb)

end C2U203
