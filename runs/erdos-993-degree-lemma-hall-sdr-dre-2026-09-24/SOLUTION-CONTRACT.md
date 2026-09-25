# Solution Contract — r28 (the Hall/SDR route to the forest degree lemma)

## 1. Targets and tiers (run-local candidate namespace `E993-R28-…`)

| Tier | Key | Statement | Status entering r28 |
|---|---|---|---|
| 1 | `E993-R28-TREE-LEAF-SLOT-DOMINANCE` (HS) | Every finite tree `T`, every `k`, every `t ≥ 1`: `Σ_{v∈Br : c_v(k) ≥ t} (deg v − 2) ≤ #{ℓ ∈ L : c_ℓ(k) ≥ t}`. Equivalently (HS-SDR): an injection from the `|L| − 2` branch slots to `L` with `c_ℓ(k) ≥ c_v(k)` on every assigned pair. | OPEN (r27 `C-T2-U` Step C; STATED at r27's Stage 4; census support to order 12 matching form / order 18 threshold form). |
| 1′ | `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA` (LC) | For every finite tree and `k`: (HS at every `t`) ⇒ `D_k(T) ≤ 2k·i_k(T)` — the layer-cake reduction composed with the r27 leaf/branch reformulation. | New; elementary; a Lean target independent of (HS)'s truth. |
| 2 | `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES` (FC) | (DL) on every component ⇒ (DL) on the forest, via the separated-union convolution `i_k(A⊔B) = Σ_{a+b=k} i_a(A) i_b(B)`, `D_k(A⊔B) = Σ_{a+b=k}[D_a(A) i_b(B) + i_a(A) D_b(B)]`. | r27 `proved_informal` (SR-JOIN JN-2); a Lean target here. |
| 2 | `E993-R28-SDR-THRESHOLD-EQUIVALENCE` | For each `(T, k)`: (HS-SDR) ⟺ (HS) — Hall on the nested-neighbourhood bipartite graph `H_k(T)`. | New; classical; a Lean target (Mathlib Hall). |
| 3 | `E993-R28-DOMINANCE-CENSUS` | (HS) verified on every free tree to a stated order by two independent instruments (threshold and matching forms), with the tight instances (equality at some `t ≥ 1`) characterized as far as the census allows. | Census record; `bounded_computation`. |
| 3 | `E993-R28-DOMINANCE-REFUTATION` (only if (HS) is false) | A finite tree with exact `c_v(k)` values violating the threshold form at a named `(k, t)`, confirmed by two instruments and a second read; the weakest surviving matching-type strengthening of (DL). | Conditional record. |
| 3 | Structural lemmas the routes prove on the way (e.g. monotonicity of `c_v(k)` along paths to leaves; `c_ℓ(k) ≥ c_{s(ℓ)}(k)` for a leaf and its support; the per-branch local inequality `Σ_{children} …`) | Each a separate `E993-R28-…` key at its grade, second-read before registration if first stated at a review stage. | New. |

## 2. The exact Lean targets (Stage 7 statements of record unless the synthesis narrows them)

In the G1 definitions of record (`Erdos993G1.indepCount` carried byte-identically from the r25 award source
`736eb9df…`; `Erdos993G1.indepDegreeSum` and `Erdos993G1.forest_degree_lemma` available byte-identically from the
r27 C1-LA1 source `b49ea82a…` where a composition needs them), with run-local definitions
`occ G v k := ((G.indepSetFinset k).filter (fun J => v ∈ J)).card`,
`slotsAtLeast G k t := ∑ v ∈ Finset.univ.filter (fun v => 3 ≤ G.degree v ∧ t ≤ occ G v k), (G.degree v - 2)`,
`leavesAtLeast G k t := (Finset.univ.filter (fun ℓ => G.degree ℓ = 1 ∧ t ≤ occ G ℓ k)).card`:

```lean
theorem tree_leaf_slot_dominance {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (k t : ℕ) :
    slotsAtLeast G k t ≤ leavesAtLeast G k t

theorem dominance_implies_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ)
    (h : ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k

theorem forest_degree_lemma_of_components {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ)
    (hcomp : ∀ C : G.ConnectedComponent, (Erdos993G1.indepDegreeSum (G.induce C.supp) k : ℤ)
        ≤ 2 * k * Erdos993G1.indepCount (G.induce C.supp) k) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k
```

(The exact form of the component hypothesis in the third target — `ConnectedComponent.supp` induced subgraphs,
or a two-piece separated-union statement iterated — is the formalizer's, recorded in the contract; the
statement must quantify over every component and consume acyclicity only for the componentwise-tree step if it
composes with `tree_leaf_slot_dominance`.) Optional formal targets: the Hall equivalence
`sdr_iff_threshold`, and the composed second proof `forest_degree_lemma'` (byte-different route from r27's
`forest_degree_lemma`, same statement — registered as an alias distinction, never as a second key for (DL)).
Permitted axioms `propext`, `Classical.choice`, `Quot.sound`; no `sorry`, `admit`, `native_decide`, `axiom`; no
`decide` over an enumeration for a universal step. Every declaration authored in-run; carried bodies from the
r25/r27 award sources byte-identically through the registrar.

## 3. Fences

1. (HS), (LC), (FC) are statements about independent-set counts on finite trees/forests. None is a
   no-recovery statement; none transfers status to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1,
   FOREST, TREE, TRANSFER, `E993-BETA-AGG`, the aggregate `S(T,p)` at any rank, `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`
   (Codex's active target) or Erdős #993.
2. (DL) is already `formally_verified` (`E993-R27-FOREST-DEGREE-LEMMA`); this run never re-registers (DL) and
   never edits its face. A second formal proof is registered as a scope note on that key plus the new keys for
   (HS)/(LC)/(FC); the r27 award is the (DL) of record.
3. (PW) is REFUTED and is not a premise anywhere; a route that "proves" (HS) via a pointwise comparison of a
   branch vertex with an arbitrary leaf is wrong by construction.
4. A census horizon is a `bounded_computation` record, never a grade for (HS); the controller's order-18 replay is
   a prior, never evidence.
5. Sealed r25/r26/r27 records are never edited; corrections are records and scope notes.
6. Attribution travels on every face: r27 `C-T2-U` (mechanism), the r27 T adjudicator (`2 ≤ n`), SR-JOIN (second
   read of the reformulation), Fang–Lu–Nevo–Yao–Zheng 2026 §8 (the degree lemma), Hall (classical, Mathlib),
   r28 seats and critics for their derivations.
7. Codex's first-interior run is out of scope: no seat reads its root; no r28 registration mentions its target
   beyond fence 1.

## 4. Evidence grades

As r27: `formally_verified` > `proved_informal` > `conditional` > `bounded_computation` > `conjecture`; `REFUTED`
never regresses; a statement first made at a review stage is STATED and needs an isolated second read before
registration; a composition's grade is its weakest input's.

## 5. Stop gate (armed every cycle)

Decisive events: (a) (HS) `formally_verified` at §2 with (LC) checked formally — the run ENDS (FC is completed if
within the cycle's Stage 7 budget, else recorded as the open formal residue); (b) an in-scope counterexample to
(HS) — a finite tree with exact counts violating the threshold form — confirmed by two independent instruments
and an isolated second read: the run ENDS with the refutation registered and the weakest surviving strengthening
recorded; (c) the mathematics of (HS) proved informally with a closed DAG and Stage 7 blocked on a bounded, named
Lean obligation — CONTINUE. Plateau: a cycle with no material progress on a proof, a refutation, or the census
horizon. Six cycles is the ceiling; controller checkpoint after Cycle 3.
