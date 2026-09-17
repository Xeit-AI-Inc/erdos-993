import Mathlib

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

namespace R23C5T3Fixture

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
end R23C5T3Fixture
