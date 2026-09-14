import Mathlib

/-
Generated deterministically by the VerityOS Lean Formalization skill.
Register source fragments through the helper; do not hand-edit this file.
-/
-- VERITYOS ENTRY 1 BEGIN definition R23.Graph.Graph a79d8f2b72b501aef4dc9062a1f0afd27c7b694f4155ce1f26a5fbc55ee8b893

/-!
# R23 Lean groundwork — finite-graph encoding (C1-T6)

Groundwork only: this file stands up an explicit finite-graph encoding on
`Fin n` per the C1-T6 charge (`control/CYCLE1-ALLOCATION.md`). It is a
DIFFERENT concrete model from the registered `RTree` interface; C1-U2 owns
the `RTree` reconciliation. Any divergence between this encoding and the
registered interface is a fidelity limitation recorded in `RETURN.md`, not
silently normalized (per `SOLUTION-CONTRACT.md` §2 / `SEMANTIC-CONTRACT.md`
§2's reconciliation duty).

Nothing in this file is `formally_verified` in the VerityOS sense: no
theorem here has passed the full `lean-proof-workflow` closeout (reviewer
assignment, informal audit, kernel verification, fidelity audit). It is
Lean-kernel-checked *groundwork*, not a certified proof artifact.
-/

namespace R23

/-- A finite simple graph on vertex set `Fin n`, given by an explicit
    symmetric, irreflexive edge relation stored as a `Finset (Fin n × Fin n)`
    (both orientations of every edge present). This is the "explicit vertex
    list" encoding option named in the C1-T6 charge, chosen over
    `SimpleGraph (Fin n)` to keep every later definition computable and
    `decide`-able without extra `DecidablePred` plumbing. -/
structure Graph (n : ℕ) where
  edges  : Finset (Fin n × Fin n)
  symm   : ∀ u v, (u, v) ∈ edges → (v, u) ∈ edges
  irrefl : ∀ u, (u, u) ∉ edges

namespace Graph

variable {n : ℕ} (G : Graph n)

/-- Adjacency, as a `Prop` decidable by membership in the edge `Finset`. -/
def Adj (u v : Fin n) : Prop := (u, v) ∈ G.edges

instance instDecidableAdj (u v : Fin n) : Decidable (G.Adj u v) := by
  unfold Adj; infer_instance

/-- `S` is independent in `G`: no edge of `G` has both endpoints in `S`.
    This is exactly `SEMANTIC-CONTRACT.md` §2's "independent `k`-subset"
    notion, stated without reference to any ambient vertex-subset — the
    induced-subgraph forms (`H_v`, `T - N[s_v]`, …) are obtained below by
    restricting the *carrier* `Finset`, not by rebuilding a `Graph` value. -/
def IsIndependent (S : Finset (Fin n)) : Prop :=
  ∀ u ∈ S, ∀ v ∈ S, ¬ G.Adj u v

instance instDecidableIsIndependent (S : Finset (Fin n)) :
    Decidable (G.IsIndependent S) := by
  unfold IsIndependent; infer_instance

/-- Independent `r`-subsets of `G` *induced on* an ambient vertex subset
    `U : Finset (Fin n)`. Taking `U = Finset.univ` recovers plain `Ind_r(G)`;
    taking `U = Finset.univ \ {v, s_v}` recovers `Ind_r(H_v)` from
    `SEMANTIC-CONTRACT.md` §3, and `U = Finset.univ \ N[s_v]` recovers
    `Ind_r(T - N[s_v])`, all WITHOUT constructing a fresh `Graph` value —
    independence of `S ⊆ U` only ever depends on `G`'s edges restricted to
    `S`, so induced-subgraph independence is literal `IsIndependent`
    restricted to subsets of `U`. -/
def IndOn (U : Finset (Fin n)) (r : ℕ) : Finset (Finset (Fin n)) :=
  (U.powersetCard r).filter (fun S => G.IsIndependent S)

/-- `Ind_r(G)`, `SEMANTIC-CONTRACT.md` §2 / §3's `Ind_r`. -/
def Ind (r : ℕ) : Finset (Finset (Fin n)) := G.IndOn Finset.univ r

/-- `i_r(G) = |Ind_r(G)|`. Computable: `decide`/`#eval` on SMALL fixtures
    only (charge: "`i_k` by decide/count for SMALL fixtures only") — the
    powerset-card search is combinatorially explosive and is NOT how any
    later cycle should compute `i_k` at scale (that is C1-T2/T3's exact
    evaluator work, built independently and validated against this
    definition only at small orders where both are tractable). -/
def i (r : ℕ) : ℕ := (G.Ind r).card

/-- `i_r` induced on an ambient subset `U`, e.g. `i_r(T - v)`,
    `i_r(H_v)`, `i_r(T - N[s_v])`. -/
def iOn (U : Finset (Fin n)) (r : ℕ) : ℕ := (G.IndOn U r).card

/-- `Delta_k(G) = i_{k+1}(G) - i_k(G)`, `SEMANTIC-CONTRACT.md` §2. Signed:
    the codomain is `ℤ`, never `ℕ` — `Delta_k` is frequently negative and a
    `ℕ`-subtraction would silently truncate at `0`, which is exactly the
    kind of silent misdefinition `SOLUTION-CONTRACT.md` §2 forbids. -/
def Delta (k : ℕ) : ℤ := (G.i (k + 1) : ℤ) - (G.i k : ℤ)

def DeltaOn (U : Finset (Fin n)) (k : ℕ) : ℤ :=
  (G.iOn U (k + 1) : ℤ) - (G.iOn U k : ℤ)

end Graph
end R23
-- VERITYOS ENTRY 1 END

-- VERITYOS ENTRY 2 BEGIN definition R23.Graph.degree e5f630f058a9c4468eb6912107fb2a5f0429b3d606af68feb31a42fe0483a65c

/-!
# Tree-level definitions: leaves, supports, `x(T)`, `a_v`, `F_p(T)`

Groundwork (C1-T6). All definitions here are TOTAL and computable so that
`decide`/`#eval` can exercise them on small fixtures, per the charge. Several
are deliberately loose "working" definitions (documented per-definition) that
are NOT yet proved equal to their intended mathematical meaning outside the
governing hypotheses — that equality is exactly THM-R23-A "well-definedness"
territory, stated with `sorry` in `Theorems.lean`, never assumed here.
-/

namespace R23
namespace Graph

variable {n : ℕ} (G : Graph n)

/-- Degree of `v` in `G`. -/
def degree (v : Fin n) : ℕ := (Finset.univ.filter (fun u => G.Adj v u)).card

/-- `v` is a (degree-one) leaf of `G`. Decidable. -/
def IsLeaf (v : Fin n) : Prop := G.degree v = 1

instance instDecidableIsLeaf (v : Fin n) : Decidable (G.IsLeaf v) := by
  unfold IsLeaf; infer_instance

/-- The neighbor-`Finset` of `v`. For a leaf this is a singleton. -/
def nbrs (v : Fin n) : Finset (Fin n) := Finset.univ.filter (fun u => G.Adj v u)

/-- `support v`: the WORKING total, computable stand-in for `s_v`, the
    unique neighbor of a leaf `v`. Defined as the least element of `nbrs v`
    under `Fin n`'s linear order when `nbrs v` is nonempty, else `v` itself
    (a sentinel; only ever consumed under an `IsLeaf` hypothesis in the
    statements below). Under `IsLeaf v`, `nbrs v` is a singleton `{s_v}` and
    `support v = s_v` exactly — this equality is recorded as
    `support_eq_of_isLeaf` and left `sorry` (THM-R23-A territory: it is
    provable directly from `Finset.card_eq_one`, but proving it is not this
    charge's obligation). -/
def support (v : Fin n) : Fin n :=
  if h : (G.nbrs v).Nonempty then (G.nbrs v).min' h else v

/-- Closed neighborhood `N[s_v] = {s_v} ∪ N(s_v)`. -/
def closedNbhd (v : Fin n) : Finset (Fin n) := insert v (G.nbrs v)

/-- `W_v = N_T(s_v) \ {v}`, `SEMANTIC-CONTRACT.md` §3. -/
def W (v : Fin n) : Finset (Fin n) := (G.nbrs (G.support v)).erase v

/-- `H_v = T - {v, s_v}`, realized as the ambient carrier
    `Finset.univ \ {v, s_v}` fed to `IndOn` (no fresh `Graph` value needed —
    see `Graph.lean`'s module doc). -/
def Hcarrier (v : Fin n) : Finset (Fin n) :=
  Finset.univ \ {v, G.support v}

/-- `T - N[s_v]` carrier. -/
def removedClosedNbhdCarrier (v : Fin n) : Finset (Fin n) :=
  Finset.univ \ G.closedNbhd (G.support v)

/-- `a_v = Delta_p(T - v)`, `SEMANTIC-CONTRACT.md` §2. -/
def a (v : Fin n) (p : ℕ) : ℤ := G.DeltaOn (Finset.univ.erase v) p

/-- `b_v = Delta_{p-1}(H_v)`. -/
def b (v : Fin n) (p : ℕ) : ℤ := G.DeltaOn (G.Hcarrier v) (p - 1)

/-- `B_{s_v} = Delta_{p-1}(T - N[s_v])`. -/
def B (v : Fin n) (p : ℕ) : ℤ := G.DeltaOn (G.removedClosedNbhdCarrier v) (p - 1)

/-- `g_v = b_v - B_{s_v}`. -/
def g (v : Fin n) (p : ℕ) : ℤ := G.b v p - G.B v p

/-- `F_p(T) = {original leaves v : a_v < 0}`, `SEMANTIC-CONTRACT.md` §2.
    "Original" leaves means: leaves OF `G` itself, evaluated once (this
    definition does not re-derive leafhood inside any deleted subgraph),
    matching the contract's "ORIGINAL degree-one leaf" language. -/
def Favorable (p : ℕ) : Finset (Fin n) :=
  Finset.univ.filter (fun v => G.IsLeaf v ∧ G.a v p < 0)

instance instDecidableFavorableMem (p : ℕ) (v : Fin n) :
    Decidable (v ∈ G.Favorable p) := by
  unfold Favorable; infer_instance

/-- `S(T,p) = sum_{v in F_p(T)} g_v`, `SEMANTIC-CONTRACT.md` §2. Contract:
    "Leaves counted separately even when supports coincide" — automatic
    here since the sum ranges over the leaf `v`, never over `s_v`, and
    "empty favorable set ⇒ S = 0" — automatic since `Finset.sum` over `∅`
    is `0`. -/
def S (p : ℕ) : ℤ := ∑ v ∈ G.Favorable p, G.g v p

/-- `x(T)`: WORKING computable stand-in for "first `k ≥ 0` with
    `Delta_k(T) < 0`", searching only `k ∈ [0, n]` (since `Ind_r(G) = ∅` for
    `r > n`, so `Delta_n(G) = 0 - i_n(G) ≤ 0`, hence a strict descent within
    `[0,n]` exists whenever `i_n(G) ≥ 1`; the general existence/uniqueness
    argument — needed for full well-definedness on EVERY tree, including
    the `i_n(G) = 0` edge case — is THM-R23-A territory and is NOT proved
    here). Falls back to `n` if the bounded search finds nothing. -/
def xOf : ℕ :=
  ((List.range (n + 1)).find? (fun k => decide (G.Delta k < 0))).getD n

end Graph
end R23
-- VERITYOS ENTRY 2 END

-- VERITYOS ENTRY 3 BEGIN definition R23.Graph.C 98c9a9a72bc6f47469754775ddcbfa4bb97291f77a36374f6312251b13a23846

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
    C1-F2's charge probes whether this domain ALSO requires `s_w ∉ A`
    (an r19-text reading question); this groundwork encodes only the
    text's stated conjuncts and takes no position on that open reading —
    recorded as a fidelity limitation, not resolved here. -/
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
-- VERITYOS ENTRY 3 END

-- VERITYOS ENTRY 4 BEGIN theorem T22NoCenterHallFailureCertificate bb4d217af9948304e3e702799bfedbdb52b901a2292f6a6940218b715d2ef9dc

/-!
# Stage 7 bounded certificate package

This file proves only the literal carrier monotonicity, a generic finite
Hall-cut contradiction, and the three stated closed-form arithmetic facts.
It does not construct `T_22` or identify concrete cuts with the values of `Z`.
-/

namespace Stage7Erdos993

private theorem erase_preserves_disjoint {alpha : Type*} [DecidableEq alpha]
    {A D : Finset alpha} {q : alpha} (h : Disjoint A D) :
    Disjoint (A.erase q) D := by
  refine Finset.disjoint_left.mpr ?_
  intro a ha hD
  exact Finset.disjoint_left.mp h (Finset.mem_of_mem_erase ha) hD

/-- Literal `DeleteEdge` targets preserve avoidance of every finite center set. -/
theorem deleteEdge_carrier_avoidance {n : Nat} (G : R23.Graph n) (p : Nat)
    (x y : Prod (Fin n) (Finset (Fin n))) (D : Finset (Fin n))
    (hEdge : G.DeleteEdge p x y) (hAvoid : Disjoint x.2 D) :
    Disjoint y.2 D := by
  rcases hEdge with ⟨_, q, _, hCarrier, _⟩
  rw [hCarrier]
  exact erase_preserves_disjoint hAvoid

/-- Literal `RetagEdge` targets preserve avoidance of every finite center set. -/
theorem retagEdge_carrier_avoidance {n : Nat} (G : R23.Graph n) (p : Nat)
    (x y : Prod (Fin n) (Finset (Fin n))) (D : Finset (Fin n))
    (hEdge : G.RetagEdge p x y) (hAvoid : Disjoint x.2 D) :
    Disjoint y.2 D := by
  rcases hEdge with ⟨_, _, hCarrier, _⟩
  rw [hCarrier]
  exact erase_preserves_disjoint hAvoid

/-- Every target of either frozen literal move avoids each center avoided by
the source carrier. -/
theorem deleteOrRetag_carrier_avoidance {n : Nat} (G : R23.Graph n) (p : Nat)
    (x y : Prod (Fin n) (Finset (Fin n))) (D : Finset (Fin n))
    (hEdge : G.DeleteEdge p x y ∨ G.RetagEdge p x y)
    (hAvoid : Disjoint x.2 D) : Disjoint y.2 D := by
  rcases hEdge with hDelete | hRetag
  · exact deleteEdge_carrier_avoidance G p x y D hDelete hAvoid
  · exact retagEdge_carrier_avoidance G p x y D hRetag hAvoid

section FiniteHall

variable {S T : Type*} [Fintype S] [Fintype T]
variable [DecidableEq S]

/-- The full relation-neighborhood of a finite source cut. -/
def relationNeighborhood (R : S -> T -> Prop) [DecidableRel R]
    (X : Finset S) : Finset T :=
  Finset.univ.filter (fun t => ∃ s ∈ X, R s t)

/-- Hall's cardinality inequality for every finite source cut. -/
def AllCutHall (R : S -> T -> Prop) [DecidableRel R] : Prop :=
  ∀ X ∈ (Finset.univ : Finset S).powerset,
    X.card <= (relationNeighborhood R X).card

omit [DecidableEq S] in
/-- A source cut whose whole neighborhood fits into a strictly smaller target
container contradicts the all-cut Hall condition. -/
theorem finiteHallCutContradiction (R : S -> T -> Prop) [DecidableRel R]
    (X : Finset S) (Y : Finset T)
    (hContained : relationNeighborhood R X ⊆ Y)
    (hSmall : Y.card < X.card) :
    Not (AllCutHall R) := by
  intro hHall
  have hCut := hHall X (by simp)
  have hCard := Finset.card_le_card hContained
  omega

end FiniteHall

/-- The independently derived, zero-extended binomial certificate formula. -/
def Z (m r : Nat) : Nat :=
  Nat.choose (3 * m) (r - 1) +
    3 * m *
      (3 * Nat.choose (3 * m - 3) (r - 1) +
       8 * Nat.choose (3 * m - 3) (r - 2) +
       5 * Nat.choose (3 * m - 3) (r - 3) +
       Nat.choose (3 * m - 3) (r - 4))

theorem Z_22_34 : Z 22 34 = 1020660578375268831042 := by
  norm_num [Z, Nat.choose]

theorem Z_22_33 : Z 22 33 = 1006434057637648542672 := by
  norm_num [Z, Nat.choose]

theorem Z_22_strict : Z 22 33 < Z 22 34 := by
  rw [Z_22_33, Z_22_34]
  norm_num

end Stage7Erdos993

/-- The exact bounded Stage 7 certificate. No graph/counting bridge is claimed. -/
theorem T22NoCenterHallFailureCertificate :
    Stage7Erdos993.Z 22 34 = 1020660578375268831042 ∧
    Stage7Erdos993.Z 22 33 = 1006434057637648542672 ∧
    Stage7Erdos993.Z 22 33 < Stage7Erdos993.Z 22 34 := by
  exact ⟨Stage7Erdos993.Z_22_34,
    Stage7Erdos993.Z_22_33, Stage7Erdos993.Z_22_strict⟩

#print axioms Stage7Erdos993.deleteOrRetag_carrier_avoidance
#print axioms Stage7Erdos993.finiteHallCutContradiction
#print axioms T22NoCenterHallFailureCertificate
-- VERITYOS ENTRY 4 END

