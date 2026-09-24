# Cycle 1 close — r27 (finite forest degree/extension inequality), 2026-09-24

Controller: Claude Fable 5.1. Run id `erdos-993-math-dre-20260924-r27-forest-degree-extension`. Topology
9 routes / 18 cross-orientation critics / 3 isolated adjudicators / 1 synthesis / governed Stage 7 (four
awards) / four isolated second reads. Models as chartered: Sonnet 5 xhigh routes; Opus 5 medium critics;
Opus 5 high adjudicators, synthesis, formalizers, reviewers and second readers (Opus 5.5 not selectable).

## Stage record

| Stage | Seal | Outcome |
|---|---|---|
| 2 (packet) | `64d142ed1a3beb3dec7eaaa941d5c862c0bd3381ee678f6aa27c5c43850828e7` | 110 members; lint 0/0 |
| 3 (routes) | dispatch `192bc4b3…`; packet `8e78cf1f…` | 9/9 admitted (F3 import-list exception recorded; U1/U3 `find /` self-terminated, disclosed) |
| 4 (critics) | dispatch `dc9daaa2…`; packet `d93b9700…` | 18/18 (17 retained_narrowed, 1 retained) |
| 5 (adjudicators) | `4732eb49…` | T proved / F proved / U still_open |
| 6 (synthesis) | dispatch `478243b7…`; packet `aa17f389e03a2fc25bded45b176fa0d75102691ad3f5b55d812eca19c471f33a` | flags no/yes/no/yes; §5(c) met; four awards funded |
| 7 (awards) | capsules LA1 `330ce250…`, LA2 `3cfd2f64…`, LA3 `81ddfb72…`, LA4 `08d725c8…` | 4/4 `formally_verified` (LA3 after one repair round) |
| second reads | SR-RC `caf34d6c…`, SR-JOIN `d9fb5b35…`, SR-EXX `d4a5ab21…`, SR-REC `e89e7953…` | 17/17 items confirmed (1 confirmed, 16 confirmed_with_repairs, 0 rejected) |

## Mathematical state at the close

**Formally verified (kernel, three axioms, two independent reviews each), all on the G1 definitions of
record with every declaration authored in-run:**

- (DL) `Σ_{J∈I_k} Σ_{v∈J} deg(v) ≤ 2k·i_k(G)` for every finite forest and every `k`
  (`E993-R27-FOREST-DEGREE-LEMMA`, C1-LA1). Proof of record the injection route for the root-corrected
  lemma; the two-potential chain is the second, informal derivation.
- (EX) `n·i_k ≤ (k+1)·i_{k+1} + 3k·i_k` (`E993-R27-FOREST-EXTENSION-INEQUALITY`, C1-LA1).
- The graph-general counting core: the double count and `e(J) ≥ n − k − Σ deg`, no acyclicity
  (`E993-R27-INDEP-EXTENSION-DOUBLE-COUNT`, `E993-R27-EXTENSION-LOWER-BOUND`, C1-LA2).
- The implication chain `DlHyp → ExHyp ∧ LbHyp ∧ R5Hyp ∧ XrHyp` (`E993-R27-DEGREE-LEMMA-IMPLIES-EXTENSION-CHAIN`, C1-LA3).
- (LB) `Δ_k < 0 ⇒ n ≤ 4k`; (R5) `n ≥ 21 ⇒ Δ_5 ≥ 0`; (XR) `x < r ⇒ n ≤ 4r − 4`
  (`E993-R27-FOREST-DESCENT-LINEAR-BOUND`, `E993-R27-RANK5-CEILING-20`,
  `E993-R27-DESCENT-RESTRICTION-4R-MINUS-4`, C1-LA4). (LB) strengthens the r25 `(k+1)²` award as a
  separate key; the r25 award is unchanged.

**Proved informally after isolated second reads:** the root-corrected degree lemma with its exact
correction term `M_k` (one canonical key for (RC)/(SH)/(DL+)/root-deficit); the equality classification
((DL) tight iff `k = 0` or `i_k = 0`; slack exactly `2c` at `k = 1`; (EX) likewise); the `k = 1`
root-corrected acyclicity criterion (`|E| + c ≤ n ⟺ forest`; plain (DL) does not certify acyclicity);
the exact extension identity with the co-degree excess `exc(J)`; the rooted two-potential edge-split
recurrences (acyclicity NOT a hypothesis of the identities); the separated-union convolution and the
single-root reduction; the leaf/branch reformulation at `n ≥ 2`; ℤ-index completeness of `firstDescent`;
the K1-addition closure `x ≤ 5` (proved_informal-with-census).

**Census grade (order-20 in-run census, SR-EXX):** descent maxima `M(k) = 0, 4, 8, 11, 15, 18`
(`k = 0..5`), with the (XR) occupancy row; the sharp rank-5 ceiling `Δ_5 < 0 ⇒ n ≤ 18` (9,532 order-18
classes) — never on an award face.

**Records:** rank-5 residue closeout (orders 22–25 EMPTY under (R5); branch-vertex condition inert;
seven scope notes applied, one owed on an artifact's phrasing); external-source audit (no counts; per-location
`decide` warrants; Gate-ruling-3 disclosure of what a second reader can and cannot confirm); registry
comparison and alias check (zero matches; no registered key contains "R27").

**Refuted or narrowed in-cycle:** U2's leaf-by-leaf shortcut (K_{1,3}); (DL) on non-forests (K_{2,3},
K_4, K_4 − e; cycles tight); `N_2 ≤ M`-style naive forms (`D_{A∪B}(a) = D_A(a)·Z_B` false at K_1 ⊔ K_1);
T1's shipped §3 Step c; T2's forest-layer-debt diagnosis; the "registry scope carves out K_1" warrant
(false at the exact key — replaced by the logical warrant); the synthesis's "M(1..3) unconditional" gloss
and the controller's SR-EXX grade gloss (only the formal `(k+1)²` cap — and now the formal (LB) — makes a
maximum unconditional; every `M(k)` stays `bounded_computation`).

## Registry and ledger

Run-local registry 370 → 391 identities (235 V / 89 R / 26 C / 41 O): 21 `E993-R27-*` keys (8 on formal
awards: DL, EX, double count, e(J) bound, chain, LB, R5, XR; 10 proved_informal; 2 bounded_computation; 1
compiled-scratch record); scope notes on seven r25 claims and on the refuted disjoint-union additivity
claim (statuses unchanged). Lint 0 findings. Ledger `OBLIGATIONS.csv` 301 rows (14 `R27-*`). Nothing
registered for `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, the
aggregates or Erdős #993 (fence §3.1).

## Process record

- Seats 9 + 18 + 3 + 1 + 4 formalizers + 8 reviewer seats (+2 resumed for LA3 round 2) + 4 second readers.
- Controller facts conveyed mid-dispatch (never as evidence): CF-LA1-1 (the `p(p(u)) ≠ u` node, from
  SR-RC; already satisfied by the formalizer's `par_par_ne`), CF-LA4-1 (the LA1/LA3 name collision on
  `forest_extension_inequality`; already handled by the seat).
- Errata R27-E-a…g (`control/CONTROLLER-NOTES.json`); no sealed member edited; the LA3 repair preserved
  round-0 artifacts under `superseded/round-0/`.
- Read-boundary disclosures: U1/U3 `find /` self-terminated (Stage 3); SR-JOIN one grep above the capsule
  and one harness-backgrounded job killed by literal PID; LA4 reviewers' directed reads of sibling award
  sources.
- Second reads ran concurrently with Stage 7 (no dependency), which is why SR-RC's finding could reach the
  LA1 formalizer before its close.

## Successor inheritance (open decisions for Ashton)

1. The p = α − 2 interior-rank experiment named in the r26 review remains the next natural target; r27
   adds the formal (LB)/(XR) to its toolkit.
2. The Hall/SDR sufficient condition (C-T2-U Step C) behind the leaf/branch reformulation is OPEN with
   bounded-computation support; a route for a successor, not a debt of this run.
3. Extending the K1-addition closure to `x ≤ 6` needs (LB) at `k = 6` (`n ≤ 24`) and a census to order
   24 (~146M classes) — census-bound, not formal.
4. Gate ruling 3 stands: if a permissive license is established for the external Lean slice, a
   byte-identical port comparison becomes available to a successor; this run's awards do not depend on it.
5. Publication (master ledger + public repo mirror) follows the r24/r25/r26 pattern and is prepared at
   this close; the controller reports it at the gate rather than treating it as pre-authorized beyond
   the standing r25 scope.
