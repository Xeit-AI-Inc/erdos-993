# Semantic Contract (r25): definitions and conventions of record

All definitions are those of the completed G1 contracts, registered in the
verified Lean source `sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean`
(SHA-256 `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`),
entries 1–12. Quoted verbatim; nothing is weakened or replaced.

```lean
noncomputable def Erdos993G1.indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)
noncomputable def Erdos993G1.coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0
noncomputable def Erdos993G1.delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k
noncomputable def Erdos993G1.firstDescent {V : Type u} (F : SimpleGraph V) : ℕ :=
  sInf {k : ℕ | Erdos993G1.delta F (k : ℤ) < 0}
noncomputable def Erdos993G1.vertexDegree {V : Type u} (F : SimpleGraph V) (v : V) : ℕ :=
  Nat.card (F.neighborSet v)
def Erdos993G1.closedNeighborhood {V : Type u} (T : SimpleGraph V) (v : V) : Set V :=
  {w | w = v ∨ T.Adj v w}
def Erdos993G1.deleteVerts {V : Type u} (F : SimpleGraph V) (S : Set V) : SimpleGraph {w : V // w ∉ S} :=
  F.induce Sᶜ
def Erdos993G1.ambientA {V : Type u} (T : SimpleGraph V) (v : V) :=
  Erdos993G1.deleteVerts T (Erdos993G1.closedNeighborhood T v)
def Erdos993G1.ambientH {V : Type u} (T : SimpleGraph V) (v g : V) :=
  Erdos993G1.deleteVerts T (Erdos993G1.closedNeighborhood T v ∪ {g})
def Erdos993G1.residual {V : Type u} (T : SimpleGraph V) (v g : V) :=
  Erdos993G1.deleteVerts T
    (Erdos993G1.closedNeighborhood T v ∪ Erdos993G1.closedNeighborhood T g)
noncomputable def Erdos993G1.residualOrder {V : Type u} (T : SimpleGraph V) (v g : V) : ℕ :=
  Nat.card {w : V // w ∉ Erdos993G1.closedNeighborhood T v ∪ Erdos993G1.closedNeighborhood T g}
def Erdos993G1.ordinaryG1Guards {V : Type u} (T : SimpleGraph V) (v s g : V) (p : ℕ) : Prop :=
  T.IsTree ∧
  Erdos993G1.vertexDegree T v = 1 ∧ T.Adj v s ∧
  Erdos993G1.vertexDegree T s = 2 ∧ T.Adj s g ∧ g ≠ v ∧
  p = Erdos993G1.firstDescent T + 1 ∧
  Erdos993G1.delta (Erdos993G1.ambientA T v) (p : ℤ) +
    Erdos993G1.delta (Erdos993G1.ambientH T v g) ((p : ℤ) - 1) < 0 ∧
  2 * p - 3 < Erdos993G1.residualOrder T v g ∧
  Erdos993G1.firstDescent (Erdos993G1.residual T v g) < p - 2
```

## Conventions (binding)

- `i_k(F)` counts actual independent `k`-subsets once; `i_0 = 1` for every
  finite graph including the empty graph; zero beyond the independence
  number; `coeff` is zero at negative integer indices (integer zero
  extension). `Δ_k(F) = i_{k+1} − i_k` for integer `k`; `Δ_{−1}(F) = 1`.
- `x(F)` = the least natural `k` with `Δ_k(F) < 0` — the **first strict
  descent**; a plateau is not a descent; never replaced by a first or last
  maximizer without a proof.
- Excess: `d(F, r) = |V(F)| − 2r`. Bands: `d = 2` (C2), `3` (informal), `4`
  (C3), `5` (diagnostic, open). Matching number `ν(F)`; vertex-cover number
  `τ(F)`; for forests (bipartite) `τ = ν` (König) and `α = |V| − ν`. A
  "recovery" at rank `r` means `x(F) < r` and `Δ_r(F) > 0`; a "recovering
  forest" is a forest with a recovery at some rank.
- G1 tuple objects: `A = T − N_T[v]`, `H = A − g`, `U = T − (N_T[v] ∪ N_T[g])`;
  all neighbourhoods in the original `T`; `p = x(T) + 1`; the guards imply
  `p ≥ 3`; natural subtraction in the guards and integer subtraction in
  conclusions are reconciled explicitly (as in the G1 contracts).
- Exact identities available to every seat (elementary, to be re-proved
  when used): for a leaf `v` with support `s`, `I(F; z) = I(F − v; z) +
  z·I(F − N[v]; z)`; for the G1 tuple, `I(A) = I(H) + z·I(U)` and
  `I(T) = (1 + z)·I(A) + z·I(H)`; cover-fiber partition for a vertex cover
  `C` with `B = V ∖ C`: `I(F; z) = Σ_{S ⊆ C independent} z^{|S|} (1 + z)^{|B ∖ N(S)|}`.
- Evidence envelope: deterministic scripts, exact-integer arithmetic, SHA-256
  per artifact, replay commands, no wall-clock fields in hashed outputs,
  distinct-row counts up to isomorphism named as such, scratch only under
  `<run root>/scratchpad/<seat>/`.
