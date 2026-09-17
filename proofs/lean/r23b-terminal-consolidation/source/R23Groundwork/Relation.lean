import R23Groundwork.Tree

/-!
# The literal fixed Delete/Retag relation (`SEMANTIC-CONTRACT.md` §3)

Groundwork (C1-T6). `C`, `P`, `N` are concrete, computable `Finset`s;
`DeleteEdge`/`RetagEdge` are concrete, decidable relations on `P ×ˢ N`. This
is deliberately built on top of `Graph`/`Tree` (not axiomatized abstractly)
so that small instances are `decide`-checkable end to end, giving a THIRD
independent instrument for `|P| - |N| = S(T,p)` (BRIDGE-2) beyond the Python
Stage-0 check and C1-T5's informal proof — a Lean-kernel-checked witness, not
a general proof (see `Theorems.lean`).

`C1-T4` independently instantiates this same relation as JSON/Markdown row
data (its own charge, its own code) — this file is NOT read from T4 and does
not read T4 (isolation), it is an independent Lean encoding of the same
`SEMANTIC-CONTRACT.md` §3 text.
-/

namespace R23
namespace Graph

variable {n : ℕ} (G : Graph n)

/-- `C_r(v) = {A ∈ Ind_r(H_v) : A ∩ W_v ≠ ∅}`, `SEMANTIC-CONTRACT.md` §3. -/
def C (v : Fin n) (r : ℕ) : Finset (Finset (Fin n)) :=
  (G.IndOn (G.Hcarrier v) r).filter (fun A => (A ∩ G.W v).Nonempty)

/-- `P = ⊔_{v ∈ F} {v} × C_p(v)`. Encoded as a `Finset` of tagged pairs
    `(v, A)`; leaves are counted separately even when `C_p(v)` sets
    coincide across different `v`, because the pairs differ in their first
    coordinate. -/
def P (p : ℕ) : Finset (Fin n × Finset (Fin n)) :=
  (G.Favorable p).biUnion (fun v => (G.C v p).image (fun A => (v, A)))

/-- `N = ⊔_{v ∈ F} {v} × C_{p-1}(v)}`. -/
def N (p : ℕ) : Finset (Fin n × Finset (Fin n)) :=
  (G.Favorable p).biUnion (fun v => (G.C v (p - 1)).image (fun A => (v, A)))

/-- `Delete(q) : (v,A) -> (v, A \ {q})` when `q ∈ A` and `A \ {q} ∈ C_{p-1}(v)`.
    `SEMANTIC-CONTRACT.md` §3, verbatim domain. -/
def DeleteEdge (p : ℕ) (x y : Fin n × Finset (Fin n)) : Prop :=
  y.1 = x.1 ∧ ∃ q ∈ x.2, y.2 = x.2.erase q ∧ y.2 ∈ G.C x.1 (p - 1)

instance instDecidableDeleteEdge (p : ℕ) (x y : Fin n × Finset (Fin n)) :
    Decidable (G.DeleteEdge p x y) := by
  unfold DeleteEdge; infer_instance

/-- `Retag(w) : (v,A) -> (w, A \ {w})` when `w ∈ F ∩ A` and
    `A \ {w} ∈ C_{p-1}(w)`. `SEMANTIC-CONTRACT.md` §3, verbatim domain.
    The r19-text reading question — whether this domain ALSO requires
    `s_w ∉ A` — is CLOSED (`SEMANTIC-CONTRACT.md` AMENDMENT A1.3, Lemma L1:
    `s_w ∈ A` is impossible for an independent `A` containing the leaf `w`,
    so the two readings are extensionally identical — proved, not sampled;
    the canonical Lean form is `ErdosR23C2T3.lc4_retag_domain` in
    `LC4567.lean`). This encoding of the text's stated conjuncts therefore
    loses nothing. (Docstring repaired C3-T2: the inherited C1 text called
    this reading "open", which A1.3 closed at the C1 gate; no C2+ seat
    re-opens it.) -/
def RetagEdge (p : ℕ) (x y : Fin n × Finset (Fin n)) : Prop :=
  y.1 ∈ G.Favorable p ∧ y.1 ∈ x.2 ∧ y.2 = x.2.erase y.1 ∧
    y.2 ∈ G.C y.1 (p - 1)

instance instDecidableRetagEdge (p : ℕ) (x y : Fin n × Finset (Fin n)) :
    Decidable (G.RetagEdge p x y) := by
  unfold RetagEdge; infer_instance

/-- Every Delete or Retag edge out of `x`, landing set. -/
def outEdges (p : ℕ) (x : Fin n × Finset (Fin n)) :
    Finset (Fin n × Finset (Fin n)) :=
  (G.N p).filter (fun y => G.DeleteEdge p x y ∨ G.RetagEdge p x y)

end Graph
end R23
