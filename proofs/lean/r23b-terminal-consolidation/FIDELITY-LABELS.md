# C6-T3 — honest fidelity label table (SOLUTION-CONTRACT §9 item 4)

Scope: the terminal consolidation of the SEALED C4 grand merge
(`cycles/cycle-4/stage3/routes/T1/evidence2/`) + the sealed C5-T2
`RelationTransport` state (`cycles/cycle-5/stage3/routes/T2/evidence/`,
module `R23Groundwork`) + the sealed C5-T3 witness fixture package
(`cycles/cycle-5/stage3/routes/T3/evidence/`, copied out here as
`C5T3Fixture` — renamed namespace only, `R23` → `R23C5T3Fixture`, to
avoid the `R23.Graph` structure-name collision between the two sealed
C5 packages; disclosed, not a mathematical change). Per the C6 charter
this table does NOT include the C6-T1/T2 in-flight siblings (unread by
this seat, per isolation); the stage-6 registrar appends their
outcomes to this table's rows at the gate.

Labels (exactly the five named in the charge): **proved sorry-free**,
**stated-not-proved**, **encoding-level-only**, **hypothesis-only**,
**decide-checked instance**. Grounded in this seat's own
per-declaration axioms report (`terminal-axioms-report-content.txt`,
370 non-internal constants, `sorryAx` on exactly 2, extra axioms on
exactly 2) plus the sealed C4/C5 gate records and ledger rows cited.
Computation is evidence, never proof; no bounded zero is evidence of
anything; nothing here is `formally_verified` in the VerityOS sense.

| # | Family (representative declarations) | Label | Scope / note |
|---|---|---|---|
| 1 | `THM_R23_A` (`Theorems.lean:666`) — the 13-conjunct row-construction totality theorem | proved sorry-free | Every finite `Graph n`, `IsTree` hypothesis genuinely used |
| 2 | `THM_R23_B_bridge1`/`bridge2` (`Theorems.lean:746,762`) — abstract/graph-general bridge identities | proved sorry-free | No tree hypothesis; unconditional at this scope |
| 3 | `THM_R23_C` + both discharge routes (`InjectionFork.lean`: `_of_injOn`, `_of_embedding`, `_hall_discharged`, `THM_R23_C`) | proved sorry-free | Both forms proved (C4-GATE §2); `IsTree` genuinely used |
| 4 | `bridge1_proof`/`bridge2_proof` (`Bridge.lean:154,197`) — BRIDGE-1/2 cardinality identities | proved sorry-free | Graph-general; the identity SEMANTIC-CONTRACT.md §4 states as computation-verified is here a Lean proof |
| 5 | `THM_R23_B_bridge1_actual`/`bridge2_actual`/`THM_R23_B_actual` (`ActualTree.lean:271,298,313`) | proved sorry-free; **hypothesis-only** | `_hT : G.IsTree` is UNUSED (underscore-bound) — these compile sorry-free but are mechanically the graph-general bridge results restated, not yet citing any tree-specific transport; C6-T1's named residual (R-1/R-2) is exactly repairing this. [A1.1] (RTree→ordinary-tree transfer) additionally undischarged on every "actual" reading |
| 6 | `RelationTransport.lean`'s six transport lemmas (`C_eq_image_induce_C`, `indOn_ofSimpleGraph_image`, `W_ofSimpleGraph`, `C_ofSimpleGraph`, `P_ofSimpleGraph`, `N_ofSimpleGraph`) | proved sorry-free | Graph-general, no `IsTree` hypothesis; **leaf module** as consolidated here — not yet cited by row 5's `_actual` theorems (C6-T1's R-2 charge); duty-18 digest correction applied in-file (was falsely "byte-identical carry") |
| 7 | `Adequacy.lean`'s induce/realization transport family (`indOn_eq_image_induce_ind`, `iOn_eq_induce_i`, `deltaOn_eq_induce_delta`, `bridge1_actual_deletion`, `deletion_adequacy_actual`, `isTree_ofSimpleGraph`, `realization_adequacy*`) | proved sorry-free | Carried from sealed C4-T3 `dbe4b15b…`, this copy `2eda1bb4…` after two disclosed deltas (duty-18 correction applied in-file); `deletion_adequacy_actual`'s hypothesis position is a citation hazard disclosed at `R23B-C5-T2-03` (names two different propositions across C4/C5 — hypothesis unused here, inert) |
| 8 | `LC4567.lean`/`LCEF.lean` canonical domain/compensation lemmas (`lc4_retag_domain`, `lc5_*`, `lc6_simple`, `lc7_*`) | proved sorry-free | Graph-general abstract Delete/Retag domain facts, two independent lineages (C2-T3, C3-T4) carried verbatim |
| 9 | `Controls.lean`/`ActualTree.lean`/`RelationTransport.lean` small-fixture non-vacuity checks (`k13_*`, `k16_*`, `modeTrap_*`, `sgK2`/`sgK13` realization controls) | decide-checked instance | Concrete named small graphs; sanity/non-vacuity witnesses, never a governed-hot or deficiency-sign claim |
| 10 | `Graph.lean`/`Tree.lean`/`Relation.lean` definitional scaffolding (`Adj`, `IsIndependent`, `IndOn`, `Ind`, `i`, `iOn`, `Delta`, `DeltaOn`, `degree`, `IsLeaf`, `nbrs`, `support`, `W`, `Hcarrier`, `a`,`b`,`B`,`g`,`Favorable`,`S`,`xOf`, `C`,`P`,`N`,`DeleteEdge`,`RetagEdge`,`outEdges`) | encoding-level-only | The explicit `Fin n`/`Finset`-based C1-T6 encoding; a DIFFERENT concrete model from the registered `RTree` interface (A1.1); no propositional content to prove |
| 11 | `ActualAggregate.lean`'s de-routed aggregate family (`WAct`,`CAct`,`bAct`,`BAct`,`gAct`,`SAct`,`PAct`,`NAct` + the `*_eq_*` equivalence lemmas to the `support`-routed forms) | proved sorry-free | C4-T2's residual-item-1 discharge; equivalence lemmas genuinely proved, `IsLeaf`/`Adj` hypotheses used |
| 12 | `indepOn_empty`, `indepOn_zero` (`CBWitness.lean`, this consolidation's `C5T3Fixture`) | proved sorry-free | For every `κ : Finset β`; the `r=0` case handled correctly (no truncation bug) |
| 13 | `indepOn_card`, `indepOn_insert_card` (`CBWitness.lean`) | **stated-not-proved** | Carries `sorryAx` (confirmed independently by this seat's own axioms report: the only 2 `sorryAx` hits in the whole 370-constant union); duty-18 correction applied in-file — the sealed doc's "sorry-free" was FALSE (adjudicated `R23B-C5-T3-05`), corrected of record here to "STATED; the general proof is open at `indepOn_insert_card`" |
| 14 | `ratio_gives_choose_lt`, `g_arm_pos_of_ratio`, `witness_g_arm_pos` (`CBWitness.lean`) | proved sorry-free | Pure `Nat.choose` arithmetic; the corrected ratio form `2(jk−p+2)>p−1`, re-verified at the `(736,492)` witness, not merely accepted on authority |
| 15 | `retag_empty_of_singleton_hub_choke`, `retag_empty_of_singleton_hub_choke'` (`CBWitness.lean`) | proved sorry-free | Conditional on the singleton hub/choke `W`-pattern; genuinely used, not vacuous; receipt scope corrected of record (no fixture instantiation shipped at C5-T3 — vacuous at decide rank `p=2`, non-vacuous from `p=3`, per `R23B-C5-T3-03`) |
| 16 | `cb12`, `cb12_C2_eq_closed`, `cb12_C1_eq_closed` + the `IsLeaf`/`W` facts (`CBWitness.lean`, unmutated sealed statements) | decide-checked instance | Original `native_decide` form, carries `ax_1_1` (confirmed in this seat's axioms report as the run's only 2 extra-axiom hits); `CB(1,2)`/`CB(2,3)` are GOVERNED-COLD, disclosed, never cited as governed-hot |
| 17 | `cb12_isLeaf_two/five/eight_decide`, `cb12_W_two_decide`, `cb12_C1_eq_closed_decide`, `cb12_C2_eq_closed_decide`, `cb12_g_arm_pos_decide` (`C5T3Fixture/KernelDecide.lean`, **new in this consolidation**) | decide-checked instance | This seat's kernel-`decide` restatement of row 16, feasible as ADJ-T's C5 critics found (9-vertex search space): axioms report confirms `[propext, Classical.choice, Quot.sound]` ONLY on every one of these — no `native_decide`/`ax_1_1`. This is the §"kernel-decide restatement of the CB(1,2) fixture" deliverable |
| 18 | `C5T3Fixture` `Graph`/`Tree`/`Relation` encoding (renamed-namespace copy of row 10's C1-T6 encoding; the two `Graph.lean` files are byte-identical, `f46c246c…`, confirmed by this seat) | encoding-level-only | Duplicated verbatim under the C5-T3 lineage; the rename is mechanical (namespace token), disclosed, not a mathematical change |

## Summary counts (from this seat's own build; both values always given)

- Total non-internal project constants (the union): **370**.
- `sorryAx` occurrences: **2** — exactly row 13 (`indepOn_card`,
  `indepOn_insert_card`); zero elsewhere in the 370-constant union.
- Axioms outside `[propext, Classical.choice, Quot.sound]`: **2** —
  exactly row 16's two `native_decide` declarations; zero elsewhere,
  including zero on row 17's kernel-`decide` restatements.
- Module cross-check (named list vs. environment-derived, C4-F2 F-7.1
  pattern): **PASS**, 20/20 modules.
