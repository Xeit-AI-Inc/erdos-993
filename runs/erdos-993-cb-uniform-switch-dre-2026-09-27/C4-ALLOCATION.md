# Cycle 4 Allocation — r31 (a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank)

Controller: Claude Opus 5.5, 2026-09-28. Topology 9/18/3/1 (`AUTHORIZATION.md` §3). Routes chartered Claude Sonnet 5, **high** effort
(session effort `high`, read from the host). Binding with `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C4-STAGE1-GATE.md`
(rulings 23–32 — read 23 and 25 BEFORE any Lean work; ruling 16, the favorability index, before any computation),
`control/C4-FROZEN-STATEMENTS.lean` / `.md` and `control/C4-WORKER-COMMON-BRIEF.md`. Source: the admitted Cycle 3 synthesis `## Next-cycle
portfolio`, amended by the Cycle 3 checkpoint (`control/CHECKPOINT-ANALYSIS-C3.md` §Conjunct 4 items 1–6; controller note R31-N-23).

**Where the target stands entering Cycle 4.** Tier 1 on the class is `proved_informal` (Darroch/Newton-free). Formally verified: C1-LA1
((L-S)_top template), C1-LA2 (CB layer; terminal reduced to conjuncts 2 and 4), C1-LA3 (block descent), C2-LA1 ((E) on the literal
tree), C2-LA2/C2-LA3 (every leaf favorable), C3-LA1 (clone-level E1 transport, every `q`). **Conjunct 4 is the one open formal node**,
decomposed into the frozen leaves N1–N8 (gate ruling 23). Every route below engineers or attacks FROZEN TEXT; it does not invent
statements. A route closes a node when the frozen declaration compiles sorry-free on the Cycle 4 base (`sources/c4-base/`, ruling 25)
with axioms `propext`, `Classical.choice`, `Quot.sound` only, and reports it on the `FROZEN_NODES_CLOSED` gate line (ruling 32).

## Routes (route ID — mechanism fingerprint token; each return must contain both verbatim)

| Seat | Route ID | Mechanism token | Orientation | Frozen nodes owned |
|---|---|---|---|---|
| T1 | `C4-T-01` | `E1-UPCOVER-COUNTS-VIA-CLONE-CORRESPONDENCE` | T (prove) | N1 (all four) |
| T2 | `C4-T-02` | `SECTOR-GSEC-IMAGES-LEGCOUNT-OUT-BRIDGE` | T (prove) | N3 (all five) |
| T3 | `C4-T-03` | `SECTOR-IN-BRIDGE-ZERO-CLASSES-AND-A2` | T (prove) | N4 (all three), N5 (both) |
| F1 | `C4-F-01` | `FROZEN-STATEMENT-AND-DEFINITION-FIDELITY-SIGNOFF` | F (falsify) | audits N1–N8 and C3-LA1 |
| F2 | `C4-F-02` | `COMPOSED-FLOW-PER-TARGET-AT-FRESH-ROWS` | F (falsify) | the owed end-to-end check |
| F3 | `C4-F-03` | `FROZEN-TEXT-LEAN-SEMANTICS-FALSIFIER` | F (falsify) | attacks N1, N5, N6, N7 |
| U1 | `C4-U-01` | `E1-UPCOVER-COUNTS-VIA-ADJACENCY-AND-SPEC-DISCHARGE` | U (formal / structural) | N1 (dual, ruling 30), N2 |
| U2 | `C4-U-02` | `WEIGHT-FORMULA-AND-PER-CLASS-COMPOSITION` | U (formal / structural) | N6, N7 |
| U3 | `C4-U-03` | `HALL-TO-FLOW-INTERFACE-AND-TERMINAL-STITCH` | U (formal / structural) | N8; the stitching project |

## Route objects

**Orientation T (prove).**
1. **T1 — `E1-UPCOVER-COUNTS-VIA-CLONE-CORRESPONDENCE`.** Object: the four N1 declarations exactly as frozen —
   `cbOpenChokeCount_le`, `cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses`, `cb8_nonChokeInsert_weight` — proved through the
   clone correspondence (an `r`-free independent set as a choice per choke block; the Boolean private-leaf slots and ternary leg/arm
   slots of the Cycle 3 clone product), using C1-LA2's labels and C3-LA1's guarded vocabulary. Every ℕ subtraction guarded. Could
   close: N1 sorry-free — the literal half of the E1 graph lift, the run's critical-path node.
2. **T2 — `SECTOR-GSEC-IMAGES-LEGCOUNT-OUT-BRIDGE`.** Object: the five N3 declarations — `cb8GSec_nonneg_and_support`,
   `cb8_sector_arcImages_mem_layer` (the image-in-layer lemma, smallest), `cb8_sector_legCount`, `cb8GSec_out_eq` (by
   `Finset.sum_image` over label uniqueness), `cb8GSec_out_ge_one` (from C1-LA1's Out). Draft inputs: C-T3-U's label uniqueness and
   `sector_switch_classify_full`, C-T3-F's `sector_transportRel_classify`, C-U1-T's `cb8_switch_transportRel`, the choke-state layer
   (all in `sources/c3-scratch-lean/`, `sources/c2-stage7-sources/`). Could close: the sector Out half — a Stage 7 candidate (ruling 31).
3. **T3 — `SECTOR-IN-BRIDGE-ZERO-CLASSES-AND-A2`.** Object: the N4 declarations `cb8GSec_in_eq`, `cb8GSec_in_le_one`,
   `cb8GSec_zero_classes` and the N5 declarations `cb8_sector_switchPreimages`, `cb8GSec_switchImage_inflow`; consume SR-C3-2's proof
   (items (1)–(5)) and C-U1-F's A2 argument. Could close: the sector In half and A2 — with T2, the whole `g_sec` spec.

**Orientation F (falsify).**
1. **F1 — `FROZEN-STATEMENT-AND-DEFINITION-FIDELITY-SIGNOFF`.** Object: a signed, clause-by-clause audit of (i) every frozen N1–N8
   statement against its informal source (the synthesis, SR-C3-2, SR-C3-3, the checkpoint DAG) and SEMANTIC-CONTRACT §1–§2; (ii) the
   carried definitions `transportRel`, `activeWeight`, `IsSaturatingFlow`, `WeightedHall`, `favorableLeaves`, `tagWitnesses` read
   against SEMANTIC-CONTRACT §1 (checkpoint risk R-2 — r31 has not yet re-read them itself); (iii) C3-LA1 as closed; (iv) the R-10/R-11
   greps (reserved name; digest literals) over the base. Could close: a signed fidelity record every Cycle 4 Stage 7 panel cites.
2. **F2 — `COMPOSED-FLOW-PER-TARGET-AT-FRESH-ROWS`.** Object (MANDATORY, pass/fail; checkpoint recommendation 3): the actual composed
   flow `cb8E1Arc + cb8GSec` (the frozen definitions, with C1-LA1's UNSCALED allocation inside `cb8GSec`) evaluated per target at rows
   `158`, `164` and the structural row `161`, through r30's PROVED orbit-quotient equivalence, with every target class and every source
   row sum checked, (WID) from INDEPENDENT sides (ruling 18), and Hall sums at structured `X` mixing `Sec` with `q ≥ 2` sources; plus
   the exhaustive literal check on small `CB(8, m′)` at every rank where the derived selector is nonempty. Could close: the first
   genuine end-to-end bounded confirmation of the composition, or an exact failure/cut (decisive event (b) candidate).
3. **F3 — `FROZEN-TEXT-LEAN-SEMANTICS-FALSIFIER`.** Object: try to REFUTE the frozen statements, in the style of the kernel refutation
   of `clone_fiber_card`: execute the frozen definitions under Lean conventions (ℕ truncation, `x/0 = 0`, guards) on the literal small
   `CB(8, m′)` and at class rows; attack N1's counts (the `16m + 2` total, the `8q` Boolean total, the weight increment), N5's `8 − γ`
   and the `v`-free/multi-choke zeros, N6's formula on sets containing `r` or `s`, and N7's per-class arithmetic (switch images
   `ρ_1γ + (8−γ)σ(γ) ≤ γ`). Any counterexample must be exact and, where the statement is decidable at the instance, kernel-checked.
   Could close: vetted frozen texts, or a mis-statement found before Stage 7.

**Orientation U (formal / structural).**
1. **U1 — `E1-UPCOVER-COUNTS-VIA-ADJACENCY-AND-SPEC-DISCHARGE`.** Object: (a) the four N1 declarations through C1-LA2's per-vertex
   adjacency lemmas and `cbEdge` label arithmetic (a decomposition DIFFERENT from T1's; ruling 30); (b) N2 — `cb8N_sum_eq_cb8R` and the
   unconditional `cb8E1Arc_spec_topRank` (U2's five clauses, `hfav` supplied by C2-LA3), transporting C3-LA1's `e1*` algebra to the
   `cb8E1G`/`cb8H` vocabulary (`omega`/definitional), consuming N1 as the frozen statements (compiled or not). Could close: the E1 half
   of the literal flow sorry-free modulo N1, or outright.
2. **U2 — `WEIGHT-FORMULA-AND-PER-CLASS-COMPOSITION`.** Object: N6 `cb8_activeWeight_leafSet_eq` (a `Finset.card` partition over carried
   C1-LA2 entries 60, 69, 70 and `eq_cbVertex_iff`; draft 608 and `hZeroChoke`) and N7 — `cb8Rho_one_eq_cb8R1_ratio` and
   `cb8_flowBundle_of_arcSpecs`: the target case split by N6 (in-sector; one-choke with `v`; other `r`-free `q ≥ 1`; weight 0), with
   C1-LA1's Switch and Residual, C3-LA1's `ρ_q < 1` and ρ₁ link, and `q ≤ m`. Could close: N6 (Stage 7 candidate) and the composition
   (ruling 26) sorry-free.
3. **U3 — `HALL-TO-FLOW-INTERFACE-AND-TERMINAL-STITCH`.** Object: N8 `cb8_conjunct4_of_flowBundle` sorry-free (carrying r30 entries 30–31
   receipt-bound; re-authoring Cycle 2 U2's Part A `weightedHall_of_ratFlow_bound` as the single interface copy); then the stitching
   project — the §2 terminal body under a NON-reserved scratch name, proved from C1-LA2's `cb8_topRank_of_descent_and_flow`, C2-LA1's
   terminal and N8 ∘ N7 with every frozen N-node it uses as an imported `sorry`-bodied frozen statement, so that the terminal's residual
   `sorry` set is exactly the open frozen nodes; an options census (`set_option` on the face, counted; checkpoint Process 10). Could
   close: N8 sorry-free and a stitching project whose only open nodes are frozen statements — Cycle 5/6's terminal award then needs no
   new statement.
