# Solution Contract — r30 (correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate)

## 1. Targets and tiers

| Tier | Key | Statement | Status entering r30 |
|---|---|---|---|
| 1 | `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL) | Every finite ordinary tree `T`, every eligible `p` (`x(T) + 2 ≤ p`, `3p < 2α(T) + 1`), `F = F_p(T)`, active-tag weight `w_F`, relation (D)∪(S): an integral flow saturating every source supply exists (equivalently (HALL-COND) for every `X ⊆ I_{p+1}`). | OPEN (lower-region Cycle 3 intake; `open_successor_proposal`). Outcome A closes it VERIFIED (`formally_verified` at its exact scope, or a proved restricted scope as a SEPARATE key); outcome C closes it REFUTED at `(T, p, X)`. |
| 1′ | `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID) | Every finite simple graph `G`, finite set `F` of degree-one vertices, `p ≥ 1`: `Σ_{I_{p+1}} w_F − Σ_{I_p} w_F = Σ_{v ∈ F} [q_v(p) − q_v(p−1)]`; with `F = F_p(G)`: `supply − capacity = S(G, p)`. | New run-local key, OPEN at Stage 1 (`control/CLAIM-IDENTITY.run-local.json`, 435 claims). The prerequisite Lean target. |
| 2 | Outcome-B lemmas `E993-R30-…` (NMP / SW / INV / REC / BUD templates, SEMANTIC-CONTRACT §2) | A parameter-uniform structural lemma closing a clearly identified part of (HALL) or of the budget `D + C ≥ (2α + 1 − 3p)Q`, at an exact stated scope. | New; named by the synthesis; registered only after an isolated second read when first stated at a review stage. |
| 2 | (CUT) record | An exact deficient cut per SEMANTIC-CONTRACT §1.2, if one exists: two instruments, isolated second read; then Tier 1 closes REFUTED. | Object of outcome C. No candidate is known at intake (Stage 1 gate). |
| 3 | `CB(8, 92)` sector record (`R30-CB-RECORD`) and other bounded records | The corrected sector facts (weight one; `492/491`; `|R_490|/491`); switch-capacity counts; small-tree exhaustive flow results with attained horizons. | `bounded_computation`; a record, never a proof; registered as a key only if the synthesis judges it worth a scope note on (HALL). |
| context | `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (the primary aggregate) | `S(T, p) ≤ 0` on every eligible `(T, p)`. | OPEN. Changes status ONLY by its own certificate (a uniform theorem proved and awarded); (HALL) REFUTED leaves it untouched; (HALL) VERIFIED implies it (via WID and FLOW⇒SIGN) and the implication is then registered as a scope note with a separate certificate. |

## 2. The exact Lean targets (drafts; the synthesis freezes each award's `expected_statement` at Stage 7)

Definitions of record carried BYTE-IDENTICALLY through the registrar from the first-interior award source
(`sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean`; fragments under `…/Snippets/`): entries 1–14 (`C4LA1.*`,
`C5LA1.*`), 15–17 (`Erdos993G1.indepCount/coeff/delta`) where used, 18 (`E993Interior.taggedFamily`), and — where an award's
proof uses them — the carried lemma fragments (e.g. 42's `Leaf.tagged_count_split`, `leaf_insert_indep`). Every NEW
declaration is authored in-run in namespace `E993Transport`. One terminal `theorem` per award; companions are `lemma`s and
carry no certificate of their own (ruling R29-N-12). Permitted axioms `propext`, `Classical.choice`, `Quot.sound`; no
`sorry`, `admit`, `native_decide`, `axiom`; no `decide` over an enumeration for a universal step.

```lean
namespace E993Transport
variable {V : Type*} [Fintype V] [DecidableEq V]

/-- the independent `j`-subsets of `V` (the layer `I_j(G)`); `= C5LA1.indepSetsAvoiding G ∅ j` -/
def indepFamily (G : SimpleGraph V) [DecidableRel G.Adj] (j : ℕ) : Finset (Finset V) :=
  (Finset.univ.powersetCard j).filter fun s => G.IsIndepSet (s : Set V)

/-- `W_v = N_G(s_v) \ {v}` -/
def tagWitnesses (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  (G.neighborFinset (C5LA1.support G v)).erase v

/-- the active-tag weight of `B` with respect to the tag set `F` -/
def activeWeight (G : SimpleGraph V) [DecidableRel G.Adj] (F B : Finset V) : ℕ :=
  ((F ∩ B).filter fun v => ¬ Disjoint (B.erase v) (tagWitnesses G v)).card

/-- total active weight of the layer `I_j(G)` -/
def layerWeight (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (j : ℕ) : ℕ :=
  ∑ B ∈ indepFamily G j, activeWeight G F B

/-- the fixed original strict selector `F_p(G)` -/
def favorableLeaves (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) : Finset V :=
  (C5LA1.leafSet G).filter fun v => C4LA1.IsFavorableAt G v p

/-- the deletion / two-for-one relation from `(p+1)`-sets to `p`-sets -/
def transportRel (G : SimpleGraph V) [DecidableRel G.Adj] (B A : Finset V) : Prop :=
  (∃ q ∈ B, A = B.erase q) ∨
  (∃ u, u ∉ B ∧ (G.neighborFinset u ∩ B).card = 2 ∧ A = insert u (B \ G.neighborFinset u))

/-- a saturating integral flow of the network at rank `p` with tag set `F` -/
def IsSaturatingFlow (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)
    (f : Finset V → Finset V → ℕ) : Prop :=
  (∀ B A, 0 < f B A → B ∈ indepFamily G (p + 1) ∧ A ∈ indepFamily G p ∧ transportRel G B A) ∧
  (∀ B ∈ indepFamily G (p + 1), ∑ A ∈ indepFamily G p, f B A = activeWeight G F B) ∧
  (∀ A ∈ indepFamily G p, ∑ B ∈ indepFamily G (p + 1), f B A ≤ activeWeight G F A)

/-- weighted Hall for every source subfamily -/
def WeightedHall (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ) : Prop :=
  ∀ X ⊆ indepFamily G (p + 1),
    ∑ B ∈ X, activeWeight G F B ≤
      ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A), activeWeight G F A

-- Target WID (Tier 1′; the general identity is a lemma on the face, the aggregate form is the terminal theorem):
lemma layerWeight_sub_eq_sum {G : SimpleGraph V} [DecidableRel G.Adj] (F : Finset V)
    (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v) (p : ℕ) (hp : 1 ≤ p) :
    (layerWeight G F (p + 1) : ℤ) - layerWeight G F p =
      ∑ v ∈ F, (C5LA1.forwardDifferenceDel G (C5LA1.H G v) (p - 1) -
                C5LA1.forwardDifferenceDel G (C5LA1.R G v) (p - 1))

theorem activeWeightAggregateIdentity (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) (hp : 1 ≤ p) :
    (layerWeight G (favorableLeaves G p) (p + 1) : ℤ) - layerWeight G (favorableLeaves G p) p =
      C5LA1.aggregate G p

-- Companion (FLOW⇒SIGN): any finite simple graph.
lemma aggregate_nonpos_of_saturatingFlow (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) (hp : 1 ≤ p)
    (f : Finset V → Finset V → ℕ) (hf : IsSaturatingFlow G (favorableLeaves G p) p f) :
    C5LA1.aggregate G p ≤ 0

-- Companion (HALL⇒FLOW): finite capacitated Hall.
lemma exists_saturatingFlow_of_weightedHall (G : SimpleGraph V) [DecidableRel G.Adj] (F : Finset V) (p : ℕ)
    (h : WeightedHall G F p) : ∃ f, IsSaturatingFlow G F p f

-- Target HALL (Tier 1; outcome A at full scope — or a restricted-scope theorem under a separate key):
theorem lowerRegionTwoForOneWeightedHall (T : SimpleGraph V) [DecidableRel T.Adj] (hT : T.IsTree) (p : ℕ)
    (hElig : C5LA1.crossingIndex T + 2 ≤ p) (hLow : 3 * p < 2 * T.indepNum + 1) :
    ∃ f, IsSaturatingFlow T (favorableLeaves T p) p f
end E993Transport
```

Binder and cast conventions: `p ≥ 1` makes `p − 1` the integer rank (every eligible `p` has `p ≥ 2`); the ℕ hypothesis
`crossingIndex T + 2 ≤ p` is the integer one; `3 * p < 2 * T.indepNum + 1` is a ℕ inequality without subtraction. In case (S) of
`transportRel`, `insert u (B \ N(u))` has cardinality `|B| − 2 + 1` exactly when `|N(u) ∩ B| = 2` and `u ∉ B` — the fidelity
review checks that the Lean relation is the charter's relation and nothing wider (no "two arbitrary deletions"). The
fidelity review also checks that `activeWeight` counts tags `v ∈ F ∩ B` whose witness lies in `B.erase v`, not `|F ∩ B|`.

## 3. Fences

1. **Mechanism ≠ aggregate.** A deficient cut refutes (HALL) at its exact `(T, p, X)`; it never touches
   `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, TREE, FOREST, TRANSFER,
   `E993-BETA-AGG` or Erdős #993. A finite saturating flow (any horizon, any family) is never a universal theorem. An
   ordinary-tree result is never a governed-model (RTree) result without the bridge key `E993-G1-ORDINARY-RTREE-TRANSPORT` (OPEN).
2. **Refuted mechanisms stay refuted at their exact scopes** and are not revived under new notation: `E993-R23-LITERAL-DELETE-ONLY-HALL`
   (deletion-only Hall — (HALL) differs by the switch arcs (S) and by the active-tag weight), `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`,
   `E993-R23-TAG-CLOSED-CUT-HALL`, `E993-R23-HOT-TAG-SINGLETON-HALL`, `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG` (the
   literal Delete/Retag relations), `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`, `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`,
   `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`, `E993-LOWER-REGION-C4-T4-SIGNED-CROSS-TAG-INJECTIVITY`,
   `E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-COVARIANCE`, `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`,
   `E993-R28-TREE-LEAF-SLOT-DOMINANCE` (Hall/SDR for the degree lemma — a different problem), the predecessor's own-support
   unit-capacity rule (C6-F4; a route record). A route that proposes a mechanism must say why it is not one of these
   (`control/CLAIM-DISTINCTIONS.json` carries the carried-row distinctions; new distinctions are recorded there).
3. **Weight and relation fidelity.** The weight is `w_F` of SEMANTIC-CONTRACT §1.2 and nothing else; the relation is (D) ∪ (S)
   literally; `F` is fixed at the original rank `p`; every instrument asserts `supply − capacity = S(T, p)` and nonempty
   eligibility before any other output; an instrument counting `|F ∩ B|` or `1 + #private leaves present`, or re-selecting `F`
   at `p ± 1`, or recomputing neighbourhoods in a deleted graph, is struck with every number it produced.
4. **Census discipline.** Bounded computation discovers and challenges structure; it is `bounded_computation`, never proof; no
   seat replaces the proof task with a huge census or with repeated checks of the settled `T_m` controls (charter); the
   census values `M(k)` never enter a proof; a census with zero eligible rows is evidence of nothing.
5. **Imported informal results at their exact grades.** (LIFT), (DCB) and the `T_m`/heterogeneous family theorems are used as
   `proved_informal`/`computer_assisted` inputs; a composition's grade is its weakest input's; (LIFT) never supplies quotient
   feasibility; `D, C ≥ 0` never supplies the budget.
6. **Closed regions are not re-proved:** the high tail (r29), the order bands `n ≤ 2p + 2`, the `T_m`, spider and path-star family
   theorems. A route may USE them (e.g. to restrict the unresolved domain to `2p + 3 ≤ n ≤ 4p − 8`, `p ≥ 6`) with attribution.
7. **Sealed roots are never edited:** the lower-region root, the first-interior root, the r24–r29 roots, the master ledger
   directory and the public repository are read-only during the run; frozen copies are under `sources/` with digests;
   corrections are records.
8. **Attribution travels on every face** (SEMANTIC-CONTRACT §3).
9. **Every award is a separate certificate.** (WID) changes OPEN → VERIFIED only by its own award; (HALL) only by its own award
   or its confirmed refutation; a kernel-checked companion registers `proved_informal` (R29-N-12).

## 4. Evidence grades

As r29: `formally_verified` > `proved_informal` > `conditional` > `computer_assisted`/`bounded_computation` > `conjecture`;
`REFUTED` never regresses; a statement first made at a review stage is STATED and needs an isolated second read before
registration; a composition's grade is its weakest input's; a compiled scratch declaration has no grade until its governed
award closes; a deficient cut is a refutation only after two instruments and a second read agree.

## 5. Stop gate (recorded now; ARMED from the Cycle 2 close per the unarmed-early rule; decisive events halt at any cycle)

Decisive events: (a) (HALL) `formally_verified` at §2's statement (or a uniform compensation theorem implying the primary
aggregate, at its own key) — the run ENDS at that cycle's Stage 7 close; (b) a confirmed (CUT) — (HALL) closes REFUTED; the
run continues into the next cycle only if the synthesis names a registered alternative candidate with a closed plan, else it
ENDS at the next controller checkpoint. Non-decisive progress: outcome-B awards; restricted-scope Hall theorems as separate
keys; adversarial findings short of (CUT). Plateau (evaluated at the Cycle 2 close and later): a cycle with no material
progress on (HALL), no new lemma at `proved_informal` or better, and no new adversarial finding — two consecutive plateau
cycles end the run after the serendipity review. Six cycles is the ceiling; controller checkpoint after Cycle 3.
