# Solution Contract — r27 (finite forest degree/extension inequality)

## 1. Targets and tiers (run-local candidate namespace `E993-R27-…`)

| Tier | Key | Statement | Status entering r27 |
|---|---|---|---|
| 1 | `E993-R27-FOREST-DEGREE-LEMMA` (DL) | Every finite forest `G`, every `k`: `Σ_{J ∈ I_k} Σ_{v∈J} deg(v) ≤ 2k·i_k(G)`. | External (FLNYZ 2026 Lemma 8.1); absent from the registry; candidate. |
| 1 | `E993-R27-FOREST-EXTENSION-INEQUALITY` (EX) | Every finite forest, every `k`: `(k+1)·i_{k+1} + 3k·i_k ≥ n·i_k` (i.e. `(k+1)i_{k+1} ≥ (n−3k)i_k` in `ℤ`). | External (Prop. 8.2 step); candidate. |
| 1 | `E993-R27-FOREST-DESCENT-LINEAR-BOUND` (LB) | Every finite forest, every `k`: `Δ_k(G) < 0 ⇒ n ≤ 4k`. | Candidate (FRESH-LEAD's conditional deduction); strengthens the formal `(k+1)²` award. |
| 2 | `E993-R27-RANK5-CEILING-20` (R5) | Every finite forest: `n ≥ 21 ⇒ Δ_5 ≥ 0`, i.e. `Δ_5 < 0 ⇒ n ≤ 20`. | Candidate; supersedes the informal ceiling 25. |
| 2 | `E993-R27-DESCENT-RESTRICTION-4R-MINUS-4` (XR) | Every finite forest, every `r ≥ 1`: `x(G) < r ⇒ n ≤ 4r − 4` (`d ≤ 2r − 4` at `n = 2r + d`). | Candidate. |
| 3 | `E993-R27-KADDITION-CLOSURE-X-LE-5` (K1) | `x(G ⊔ K₁) ≤ x(G) + 1` for every finite forest `G` with `x(G) ≤ 5`. | Composition: (R5) + the r25 `x ≤ 4` closure + the r25 order-≤21 census; grade bounded by its weakest input. |
| 3 | Record: the rank-5 residue closeout | The residue of `E993-R25-RANK5-CEILING-SHARPENED-TO-25` (orders 22–25, ≥ 3 branch vertices) is EMPTY under (R5); scope notes on the r25 keys; the r25 `(k+1)²` award unchanged. | Record; needs an isolated second read if first stated at a review stage. |
| 3 | External-source audit record | Statement fidelity of `sum_degOn_le`, `prefix_ratio`, `sum_numExtensions`, `numExtensions_ge` to §8 and to the run's definitions; the finite slice's dependency graph; static scan; toolchain difference; license status. | Record. |

## 2. The exact Lean targets (Stage 7 statements of record unless the synthesis narrows them)

In the G1 definitions of record (`Erdos993G1.indepCount`, `coeff`, `delta` carried byte-identically from the
r25 award source), with run-local definitions `indepDegreeSum` (the incident degree sum `D_k`) and
`firstDescent` (`x`) stated in the contract:

```lean
theorem forest_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k

theorem forest_extension_inequality {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X)
    [DecidableRel G.Adj] (hG : G.IsAcyclic) (k : ℕ) :
    (Fintype.card X : ℤ) * Erdos993G1.indepCount G k
      ≤ (k + 1) * Erdos993G1.indepCount G (k + 1) + 3 * k * Erdos993G1.indepCount G k

theorem forest_descent_linear_bound {X : Type u} [Finite X] (G : SimpleGraph X) (hG : G.IsAcyclic)
    (k : ℕ) (hneg : Erdos993G1.delta G (k : ℤ) < 0) : Nat.card X ≤ 4 * k

theorem forest_rank5_ceiling_20 {X : Type u} [Finite X] (G : SimpleGraph X) (hG : G.IsAcyclic)
    (hn : 21 ≤ Nat.card X) : 0 ≤ Erdos993G1.delta G 5

theorem forest_descent_restriction {X : Type u} [Finite X] (G : SimpleGraph X) (hG : G.IsAcyclic)
    (r : ℕ) (hx : firstDescent G < r) : Nat.card X ≤ 4 * r - 4
```

(The `Finite`/`Fintype` carrier choice follows the r25 award; a formalizer may state the first two on
`[Finite X]` with `Nat.card` if the sums are defined through `Fintype.ofFinite` — the contract records the
choice.) Permitted axioms `propext`, `Classical.choice`, `Quot.sound`; no `sorry`, `admit`, `native_decide`,
`axiom`, no `decide` over an enumeration for a universal step. **No external Lean text is carried** (§3.6);
the proof of (DL) is written in-run (the paper's two-potential induction, or any other correct proof).

## 3. Fences

1. (LB)/(R5)/(XR) are ORDER BOUNDS whose contrapositives have sign `Δ_k ≥ 0`; none is a no-recovery
   statement, none transfers status to `E993-R25-UNR-FOREST-WIDE` (Tier 1 of r25), `E993-G1WIDE-NO-SIZE-CAP`,
   NR1, FOREST, TREE, TRANSFER or Erdős #993.
2. The asymptotic `N₀`, the CLT and the analytic development are out of scope; nothing about "sufficiently
   large forests are unimodal" is asserted or registered.
3. (DL) is an average over independent `k`-sets; no pointwise degree statement may be registered.
4. A composition that uses the r25 order-≤21 census or an informal r25 result carries the grade of that
   input on its face; the formal grade of (LB)/(R5) never promotes it.
5. Sealed r25/r26 records are never edited; corrections are records and scope notes.
6. External Lean text (`sources/external/lean-source/`) has no license in the audit copy: it is READ for
   audit and proof structure and NEVER copied into the run's project, quoted at length, or published. Every
   Lean declaration of this run is authored in-run and carries the FLNYZ attribution for the mathematics.
7. Attribution travels on every face: Fang–Lu–Nevo–Yao–Zheng 2026 (§8) for (DL), (EX) and the polynomial
   induction; the literature map (FRESH-LEAD, lane 11) for the conditional deductions (LB)/(XR)/(R5); r25
   seats/critics for the K1-addition lineage; r27 seats and critics for their derivations.
8. Refuted mechanisms of the program stay refuted; `E993-R25-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER`
   (REFUTED) is not a premise anywhere.

## 4. Evidence grades

As r26: `formally_verified` > `proved_informal` > `conditional` > `bounded_computation` > `conjecture`;
`REFUTED` never regresses; a statement first made at a review stage is STATED and needs an isolated second
read before registration; a composition's grade is its weakest input's.

## 5. Stop gate (armed every cycle)

Decisive events: (a) (DL) and (EX) formally verified at §2 with (LB) and (R5) checked formally and the
rank-5 residue closed out dependency by dependency — the run ENDS; (b) an in-scope counterexample to (DL)
or (EX) (a finite forest with exact counts) — the run ENDS (and the external claim is refuted at that
statement); (c) the mathematics proved informally with a closed DAG and Stage 7 blocked on a bounded,
named Lean obligation — CONTINUE. Plateau: a cycle with no material progress on the proof, the
formalization or the closeout. Six cycles is the ceiling.
