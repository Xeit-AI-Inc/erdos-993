# Solution Contract — r26 (top-rank residual sign)

## 1. Targets and tiers

| Tier | Key (run-local candidate namespace `E993-R26-…`) | Statement | Status entering r26 |
|---|---|---|---|
| 1 | `E993-R26-TOP-RANK-RESIDUAL-SIGN` (RC) | For every finite ordinary tree `G` with `2 ≤ α(G)`, `x(G)+2 ≤ α(G)−1` and every leaf in every maximum independent set: `S(G, α(G)−1) ≤ 0` (`SEMANTIC-CONTRACT.md` §3). | OPEN on the non-flat class; proved informally on the flat subclass (`S = −ℓ(ℓ−2) − k₂(ℓ−4) ≤ −16`, r24 route-attributed) and on the `T_m` family (`−9m²−6m+1`, r24 critic-attributed); r24 registered no claim for it (it is TD-6 of the r24 terminal synthesis and a sub-case of the OPEN registered `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`). |
| 1′ | `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` | Same hypotheses and `ℓ ≥ 3`: `S(G, α−1) < 0`; with `ℓ = 2`: `S ≤ 0`. | Candidate; secondary. |
| 2 | `E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION` | The r24 C6 statement "family-(I) weight `ℓ−1−2|A_S|` flips … realized by 1,420 eligible residual trees of orders 7–16, first at order 9" is a record about which PREDICATE, exactly, with which count, and what is true of realized family-(I) terms under `(★)`. | A record-correction target: to be decided by replay of the original artifacts (`sources/r24/records/`, `sources/r24/adjudicator-scratch/`), never by rewriting them. |
| 3 | Lemmas the proof needs at their own scope: forced-neighbour; budget identity and three-family classification; per-fibre nonnegativity of family (III); deletion injection `2Σ|A| ≤ |V(H)|·|I(H)|`; `ℓ ≥ 2` for trees with `α ≥ 2`; `ℓ = 2` with a `λ = 2` support forces `P_3` (equivalently `α = 2`); leaf/support disjointness at `α ≥ 2`. | Each is a candidate for a run-local key if it stands alone with material reuse; otherwise it lives inside the (RC) proof. |

## 2. The exact Lean target (Stage 7 statement of record unless the synthesis narrows it)

Composed with the verified (RI) in the SAME project and definitions (the C5-LA1 source carried
byte-identically as a module; its digest cited), the declaration

```lean
theorem topRankResidualSign (G : SimpleGraph V) [DecidableRel G.Adj] (hTree : G.IsTree)
    (hAlpha : 2 ≤ G.indepNum) (hEligible : crossingIndex G + 2 ≤ G.indepNum - 1)
    (hResidual : ∀ v, C4LA1.IsGraphLeaf G v → ∀ S : Finset V, G.IsIndepSet (S : Set V) →
      S.card = G.indepNum → v ∈ S) :
    aggregate G (G.indepNum - 1) ≤ 0
```

in the run's own namespace (proposed `R26LA1`), with `crossingIndex`, `aggregate` the C5-LA1
definitions. Every hypothesis of (RI) appears verbatim; the conclusion is the sign and nothing else.
Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`. No `sorry`, `admit`, `native_decide`,
`decide` over an enumeration standing in for a universal step, or `axiom`. The proof must go through
structural bijections and integer counting lemmas on the actual definitions — an abstract inequality
whose hypotheses encode the conclusion is not an award.

## 3. Fences (a claim crossing one is struck at adjudication)

1. (RC) is the literal ordinary-tree statement at the top rank on the residual class. No status
   transfer to: the all-rank literal aggregate `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`
   (OPEN; other ranks and the non-residual class are untouched), the governed `E993-BETA-AGG`
   (OPEN; needs the ordinary-to-RTree transport, never attempted), the common-leaf condition, TREE,
   FOREST, TRANSFER, Erdős #993.
2. `P_3 = K_{1,2}` has unqualified residual expression `S = +2` and is excluded by `hyp-eligible`
   (`α = 2` fails `x + 2 ≤ α − 1`), not by `(★)`. `P_5` has `S = 0` and is ineligible. No proof may
   drop `hyp-eligible` from the statement of record; a proof that uses it only through `α ≥ 3` says so.
3. A finite census is bounded evidence of nothing universal; a null search is not a proof; a larger
   no-counterexample census is not a deliverable of this run.
4. A proposed counterexample must exhibit every hypothesis by exact counts (tree test, `α`, `x`,
   `(★)` by listing every maximum independent set or a certified argument) and a positive `S`.
   A positive SUMMAND inside a nonpositive `S`, a positive `S` outside the window, or a failure of an
   auxiliary inequality (e.g. a negative individual family-(III) weight) is not a counterexample.
5. The r24 record is sealed. Tier 2 produces a CORRECTION RECORD (what the original artifacts
   computed, what they said, which predicate they instantiate, the replayed witness with edges,
   `L`, `C`, `D`, `a`, all maximum independent sets, family assignment and selected supports), never
   an edit of a sealed r24 file. If no artifact computing the 1,420 count survives, the record says
   "provenance gap" and states what predicate reproduces the number, if any.
6. Refuted mechanisms of the program stay refuted (pointwise β, support-fibre β, all-cut Hall,
   universal tree log-concavity, `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER`); none may be
   reopened as a lemma.
7. Attribution travels on every claim's face: the candidate proof is the research packet's lane 05
   (`sources/literature-packet/agents/05-RC-CANDIDATE-PROOF.md`, reviewed in
   `04-RC-INDEPENDENT-REVIEW.md`); the occupancy bound `avi(H) ≤ |V(H)|/2` is Andriantiana–
   Razanajatovo Misanantenaina–Wagner (2020) and is re-proved in-run by the deletion injection, not
   imported; the family expansion is r24 critic `C-T1-U` (B3); the flat law is r24 route A1; the
   forced-neighbour lemma is the packet's.

## 4. Evidence grades

`formally_verified` (governed workflow, all receipts) > `proved_informal` (route- or
critic-attributed proof, independently re-derived by a critic or adjudicator, with an isolated second
read before registration when first stated at Stage 5/6) > `conditional` (explicit surviving
premise) > `bounded_computation` (exact census at stated orders, instrument named) > `conjecture`.
`REFUTED` never regresses. A statement first made by an adjudicator or the synthesis is STATED and
not registered without an isolated second read.

## 5. Stop gate (armed every cycle)

Decisive events: (a) `(RC)` formally verified at the §2 statement — the run ENDS; (b) an in-scope
counterexample per §3.4 — the run ENDS; (c) `(RC)` proved informally with a closed dependency DAG
and Stage 7 blocked on a bounded, named formalization obligation — CONTINUE to the next cycle with
Stage 7 the only funded lane unless the synthesis funds more. Plateau: a cycle with no material
progress on the proof, the formalization or the correction record. The controller checkpoint after
Cycle 3 may redirect the portfolio; six cycles is the ceiling.
