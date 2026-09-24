# Cycle 1 Route Allocation — r26 (validate and formalize the r24 top-rank residual sign)

Controller: Claude Fable 5.1, 2026-09-23. Topology (Ashton, 2026-09-23): 9 routes (3 per orientation),
18 cross-orientation critics (2 per route), 3 isolated adjudicators, 1 neutral synthesis, governed Lean
Stage 7 when the synthesis names an award group. Models: routes Claude Sonnet 5 xhigh; critics Claude
Opus 5 medium; adjudicators, synthesis, Stage 7 formalizer and reviewers Claude Opus 5 high
(`AUTHORIZATION.md`). Every route attacks or builds ONE object of the candidate argument
(`sources/literature-packet/agents/05-RC-CANDIDATE-PROOF.md`) at the EXACT scope of the C5-LA1
hypotheses (`SEMANTIC-CONTRACT.md` §2); the candidate is an argument under attack, not a theorem.

| Seat | Route | Object |
|---|---|---|
| `T1` | `C1-T-01 RC-FULL-PROOF-LEAN-READY` | the whole (RC) argument, statement-level, Lean-ready |
| `T2` | `C1-T-02 RC-ALTERNATIVE-DERIVATION-AND-STRICTNESS` | an independent second derivation of the shell sum; the exact slack; strictness |
| `T3` | `C1-T-03 RC-TREE-STRUCTURE-LEMMAS` | the tree-structural inputs, proved in Mathlib terms |
| `F1` | `C1-F-01 RC-EXACT-PREDICATE-CENSUS-AND-ADVERSARIAL-FAMILIES` | falsification of every step under the exact predicates |
| `F2` | `C1-F-02 C6-B3-DISCREPANCY-REPLAY` | the 1,420 statement: provenance, replay, correction record |
| `F3` | `C1-F-03 RC-HYPOTHESIS-LOAD-BEARING-MAP` | what each hypothesis carries; what fails without it |
| `U1` | `C1-U-01 RC-LEAN-ARCHITECTURE-AND-CONTRACT` | the draft theorem contract, statement, DAG, skeleton |
| `U2` | `C1-U-02 RC-LEAN-COUNTING-CORE` | compiled counting lemmas on the C5-LA1 definitions |
| `U3` | `C1-U-03 RC-LEAN-TREE-STRUCTURE` | compiled tree-structural lemmas in Mathlib |

## Standing state entering Cycle 1

Exactly the r24 terminal state as carried into the master ledger (`sources/authority/LEDGER.md`, r24
section from line 780; `sources/r24/records/C6-TERMINAL-SYNTHESIS.md` `## Terminal debt` TD-6, TD-19;
`sources/r24/records/TERMINAL-EVALUATION.md`), unchanged by r25 and its addendum (which worked on the
G1 forest program, not on the aggregate): `(RI)` formally verified (`C5LA1.topRankResidualIdentity`,
`sources/r24/c5-la1/`); `(RC)` OPEN on the non-flat class, proved informally on the flat subclass and on
the `T_m` family; no positive complete eligible aggregate anywhere in the evidence (orders ≤ 16
exhaustive; the eligible top-rank residual class censused to order 17); r24 registered no new claim.
The master registry has 363 identities (`sources/authority/CLAIM-IDENTITY.json`); the run-local copy
`control/CLAIM-IDENTITY.run-local.json` is identical at Stage 2. The literature packet's candidate
proof, its independent review and its order-≤12 check (`sources/literature-packet/`) are INPUTS under
attack, not evidence of record.

## Mechanism fingerprints and load-bearing obligations

1. **T1 `RC-FULL-PROOF-LEAN-READY`.** Derive (RC) from scratch at the exact scope — never by citing
   the packet — as a statement-level lemma DAG: (a) under `(★)` every maximum independent set is
   `L ∪ J` with `J ⊆ D` maximum in the induced graph on `D`, `α = ℓ + a`, `M = i_α(G)` counts them;
   (b) forced neighbour; (c) the budget identity with every term in `ℕ`, and the exhaustive
   three-family classification (state and prove that nothing else occurs, including at `a = 0`);
   (d) the exact family sums `W_I = ℓ(ℓ−1)M`, `W_II = (ℓ−4)N_2`, `W_III = Σ_J Σ_{A ∈ I(U(J))}(ℓ−2|A|)`;
   (e) the deletion injection and the fibre bound `W_III(J) ≥ (ℓ−|U(J)|)|I(U(J))| ≥ 0`; (f) the
   bound `S ≤ −ℓ(ℓ−2)M − (ℓ−4)N_2` and the finish for `ℓ ≥ 4`, `ℓ = 3` (`N_2 ≤ M`), `ℓ = 2` (`N_2 = 0`
   unless `G = P_3`, which `hyp-eligible` excludes via `α ≥ 3`), and why `ℓ ≤ 1` cannot occur. Audit
   every `ℕ`-subtraction; state exactly where `hyp-tree`, `hyp-alpha`, `hyp-eligible`, `(★)` enter;
   name every step that uses connectivity. Deliver `INFORMAL-PROOF.draft.md` in the granularity the
   governed workflow's informal audit expects (claim ledger per step). Debt: any step you cannot
   close, as the smallest unproved lemma.
2. **T2 `RC-ALTERNATIVE-DERIVATION-AND-STRICTNESS`.** Re-derive the weighted shell sum by a DIFFERENT
   mechanism from T1's case analysis — the choose-core-then-leaves coefficient extraction
   `I(G; z) = Σ_{A ⊆ C ∪ D independent} z^{|A|} (1+z)^{ℓ − Q(A)}` (Levit–Mandrescu corona style,
   derived in-run), extracting the `z^{α−1}` coefficient and the leaf-weighted sum — and show the two
   derivations agree symbol by symbol; derive the exact identity
   `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III` (every term named in `SEMANTIC-CONTRACT.md` §4) and
   characterize equality `S = 0`:
   prove or refute that `S = 0` never occurs on the ELIGIBLE class (the only `S = 0` residual tree
   with `α ≥ 2` being `P_5`, which is ineligible) and that `S ≤ −? ` for `ℓ ≥ 3` (the strict
   secondary candidate Tier 1′). Fixed points to reproduce before any table: `P_3` (`S = +2`, not
   eligible), `P_5` (`S = 0`, not eligible), `P_7` (`S = −4`, eligible), the flat law
   `S = −ℓ(ℓ−2) − k₂(ℓ−4)` at `D = ∅`, `T_m` at `m = 1, 2` (`−14`, `−47`) from the frozen
   `t_family` construction (`sources/r24/r23-evaluator/ordinary_tree.py`).
3. **T3 `RC-TREE-STRUCTURE-LEMMAS`.** Prove, with exact statements over `Finset V` and the Mathlib
   lemma names you would use (Mathlib sources readable): (i) a tree with `2 ≤ α` has `≥ 3` vertices
   and `ℓ ≥ 2` (degree sum `Σ deg = 2(n−1)`, `IsTree.card_edgeFinset`,
   `IsTree.exists_vert_degree_one_of_nontrivial`); (ii) at `2 ≤ α` no leaf is adjacent to a leaf, so
   `L ∩ C = ∅` and `λ(v) = 0` for `v ∈ L ∪ D`; (iii) distinct supports have disjoint leaf sets,
   `Σ_s λ(s) = ℓ`, `|C_1| ≤ ℓ`, `k_2 ≤ ⌊ℓ/2⌋`; (iv) `ℓ = 2` and some `λ(s) = 2` force
   `V = {v_1, s, v_2}` hence `α = 2` (all degrees ≤ 2 by the degree sum with exactly two leaves;
   then adjacency-closure of `{v_1, s, v_2}` under connectivity); (v) the deletion injection for an
   arbitrary finite graph and its corollary; (vi) `α = ℓ + a` and the bijection of maximum independent
   sets with maximum independent subsets of `D`. Each lemma: hypotheses, proof, Mathlib anchors,
   and whether it is used by T1's DAG.
4. **F1 `RC-EXACT-PREDICATE-CENSUS-AND-ADVERSARIAL-FAMILIES`.** Build your own instrument implementing
   the EXACT Lean predicates — `IsGraphLeaf` (exactly one neighbour), `indepNum`, `crossingIndex`
   (first STRICT descent), `(★)` by enumerating every maximum independent set, `aggregate` through the
   deletion sets `H_v`, `R_v` and the favorable filter (NOT through (RI)) — and run it on every tree
   up to order 17 (isomorphism classes by canonical form; expected class counts 1, 1, 1, 2, 3, 6, 11,
   23, 47, 106, 235, 551, 1301, 3159, 7741, 19320, 48629). On every eligible residual tree verify (RI)
   numerically, the forced-neighbour lemma, the budget identity for every `B ∈ I_{α−1}`, the family
   partition (every `B` in exactly one family; `|Fam I| = ℓM`; every family-(I) `B` has `A_C = ∅`),
   `N_2 ≤ k_2 M`, every fibre sum `W_III(J) ≥ 0`, the bound and the sign; record every failure as an
   edge list. Then attack with constructed families to order ≥ 40 (spiders with many `λ = 1`
   supports; caterpillars with ADJACENT `λ = 1` supports; brooms; double stars with pendant paths;
   `ℓ = 2` odd paths to `P_41`; `ℓ = 3` spiders; flat trees; trees with `|D|` and `M` large), each
   passing your acyclicity and `(★)` tests before it is counted. Fixed points first: `P_3`, `P_5`,
   `P_7`, the flat law, `T_1`, `T_2`. Ship generators, digests, replay commands. A null result is
   bounded evidence; say so.
5. **F2 `C6-B3-DISCREPANCY-REPLAY`.** The r24 record says (C6 synthesis B3/TD-6; C6 T adjudication
   Ruling 2 and its `## Artifact inventory` item 6; critic `C-T1-U`): family-(I) weights
   `ℓ−1−2|A_S|` "flip … realized by 1,420 eligible residual trees of orders 7–16, first at order 9
   (`ℓ = 4`, two independent multiplicity-1 supports)"; the critic cited "an order-16 member with
   `ℓ = 8` and six multiplicity-1 supports". Trace provenance in the frozen originals
   (`sources/r24/records/`, `sources/r24/adjudicator-scratch/` — determine whether `scan.py` or
   `adj_engine.py` computes any such count); replay on orders 7–16 the candidate predicates
   (P_a: `|C_1| > (ℓ−1)/2`; P_b: the induced graph on `C_1` has an independent set of size
   `> (ℓ−1)/2`; P_c: some REALIZED family-(I) set has `A_C ≠ ∅`; P_d: some realized family-(I) set has
   negative weight) and report which reproduces 1,420 and the order-9 first occurrence; print the
   order-9 witness in full (edges, `L`, `C` with `λ`, `D`, `a`, `M`, EVERY maximum independent set,
   every family-(I) set `B` with its `A_D`, `A_C`, weight) and the critic's order-16 shape if you can
   identify it; classify the error (predicate / labelling / counting / prose); draft the Tier 2
   correction record (`SOLUTION-CONTRACT.md` §3.5) stating what remains TRUE of B3 (the identity) and
   what was FALSE (realization). Also verify B3's identity on all 312 trees of orders 7–12 with your
   own instrument. Never edit a sealed r24 file.
6. **F3 `RC-HYPOTHESIS-LOAD-BEARING-MAP`.** For each of `hyp-tree`, `hyp-alpha`, `hyp-eligible`, `(★)`:
   exhibit by exact computation what fails when it is dropped and whether the CONCLUSION `S ≤ 0`
   survives. In particular: (a) without `hyp-eligible`: is `P_3` the ONLY residual tree with `α ≥ 2`
   and `S > 0` (census to order 17, and an argument from the bound)? (b) without `hyp-tree`: forests
   with `(★)` — where does the argument break (K_2 components; the `ℓ = 2` closure; the leaf/support
   disjointness) and are there forest counterexamples to the sign? (c) without `(★)`: does the sign
   survive at the top rank on non-residual trees (r24 found no positive complete eligible aggregate
   anywhere) even though (RI) fails? (d) `α = 1`: `K_1`, `K_2`. Output the load-bearing map the Lean
   statement must respect (which hypothesis each lemma consumes) and the minimal hypothesis set for
   the sign as an informational statement — the statement of record keeps all four.
7. **U1 `RC-LEAN-ARCHITECTURE-AND-CONTRACT`.** Draft the Stage 7 theorem contract
   (`THEOREM-CONTRACT.draft.yaml` in the schema of `sources/r24/c5-la1/THEOREM-CONTRACT.yaml`) for the
   exact statement of `SOLUTION-CONTRACT.md` §2: definitions reused by Lean name, hypotheses verbatim,
   dependency DAG with every node's status; and build a scratch Lean project
   (`scratchpad/c1-U1/LeanProject`, files `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`,
   `LeanProof.lean` byte-copied from `sources/r24/c5-la1/LeanProject/`; bind the shared Mathlib with
   `python3 /Users/ashtonsperry/VerityOS/skills/lean-proof-workflow/scripts/run_workflow.py bind-shared-packages --run-root <root>/scratchpad/c1-U1 --shared-project /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project`;
   then `lake build` inside `LeanProject`; NEVER `lake update`/`lake clean`) containing the C5-LA1
   source byte-identical as module `LeanProof/C5LA1.lean` (digest cited) and a module
   `LeanProof/Main.lean` importing it, with the target declaration and the lemma DAG as declarations
   — prove what you can (start from the C5-LA1 lemmas `support_spec`, `adj_iff_support_eq`,
   `support_ne_self`, `H_count_eq_M`, `R_count_eq_zero`; the `α = ℓ + a` bijection; maximum sets
   contain `L`), leave the rest as `sorry` with an explicit SORRY LEDGER (name, statement, why open).
   Report `lake build` output and `#print axioms` on every sorry-free declaration. Compiled fragments
   with digests are the deliverable; the governed award is Stage 7's.
8. **U2 `RC-LEAN-COUNTING-CORE`.** In a scratch project set up exactly as U1's (`scratchpad/c1-U2`),
   compile SORRY-FREE, on the C5-LA1 definitions: (a) the deletion injection — for a `Finset U` of
   vertices and `I(U) := {A ⊆ U : G.IsIndepSet A}` (as a filter of `U.powerset`),
   `2 · Σ_{A ∈ I(U)} |A| ≤ |U| · |I(U)|`, via the injection `A ↦ A.erase u` from the sets containing
   `u` into those omitting `u`; (b) the fibre inequality `(Σ_{A ∈ I(U)} (ℓ − 2|A| : ℤ)) ≥ 0` when
   `|U| ≤ ℓ`; (c) the family-(I) injection `(J, v) ↦ J ∪ (L.erase v)` on `(maximum independent
   subsets of D) × L` into `I_{α−1}(G)` with `ℓ · M ≤ |image|`; (d) the budget INEQUALITY for
   `B ∈ I_{α−1}(G)`: `|B ∩ L| ≤ ℓ − Σ_{s ∈ B ∩ C} λ(s)` and hence
   `Σ_{s ∈ B ∩ C}(λ(s) − 1) + (a − |B ∩ D|) ≤ 1` in `ℤ`. Each as a named lemma with `#print axioms`.
9. **U3 `RC-LEAN-TREE-STRUCTURE`.** In a scratch project set up exactly as U1's (`scratchpad/c1-U3`),
   compile SORRY-FREE in Mathlib terms: (a) `G.IsTree → 2 ≤ G.indepNum → 2 ≤ (leafSet G).card`;
   (b) `G.IsTree → 2 ≤ G.indepNum → ∀ v w, IsGraphLeaf G v → IsGraphLeaf G w → ¬ G.Adj v w`; (c) an
   interior vertex (neither leaf nor support) has no leaf neighbour, i.e. `leafDegree G d = 0`;
   (d) `Σ_{s} leafDegree G s = (leafSet G).card` and `(C_1).card ≤ (leafSet G).card` where
   `C_1 := univ.filter (leafDegree G · = 1)`; (e) the `P_3` lemma: `G.IsTree → (leafSet G).card = 2 →
   leafDegree G s = 2 → G.indepNum = 2` (or the equivalent `Fintype.card V = 3`); (f)
   `crossingIndex G + 2 ≤ G.indepNum - 1 → 3 ≤ G.indepNum`. Each with `#print axioms`.

## Read grants

Every route reads the sealed Stage 2 packet (`control/C1-STAGE2-PACKET-MANIFEST.json`) and nothing
outside it except Mathlib sources under the shared project (for API meaning) and the two VerityOS
boot files. There are no external digest-bound grants this cycle: every r24 and literature-packet
input a route needs is a frozen copy under `sources/` with its digest in `control/SOURCE-DIGESTS.json`.
Lean-building seats (U1–U3; T3 may compile checks) bind the shared packages by symlink as in item 7.

## Stage 3 admission rule

Route ID and mechanism token; the boot acknowledgment naming exactly the two boot reads; the Stage 2
seal; one typed route verdict; exactly one `headline_resolved: yes|no` line (the run's headline is
(RC) formally verified — a route says `yes` only if (RC) is formally verified, which no route can do);
a `## Remaining obligation` written as successor inheritance; an import list for every generator; the
model disclosure ("chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); the
seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority").
