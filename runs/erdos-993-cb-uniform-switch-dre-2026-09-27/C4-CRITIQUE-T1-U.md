# Critique

**Critic:** `C-T1-U`, Cycle 4 Stage 4 of r31. This is the cross-orientation critic of orientation U (formal / structural) on the seat `T1` return. Route `C4-T-01`, mechanism token `E1-UPCOVER-COUNTS-VIA-CLONE-CORRESPONDENCE`, orientation T (prove).

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. I did a restricted boot: I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch `control/dispatch/c4-stage4/DISPATCH-C-T1-U.md`. Its SHA-256 `a2c5b464b083e69a2e3ca3109b93b214ad12b2b15dd3dccada6781edf4b1aed5` matched before I read it. I made no other tool read of any VerityOS file outside the run root. The host harness injected the root `CLAUDE.md` and the user auto-memory index into this session's context without any tool call. I disclose that here and did not act on either. No subsystem beyond the two boot files was loaded.

**Read-boundary disclosures.**
1. I copied T1's generator out of `scratchpad/c4-T1-replay/n1_verify.py` and replayed it. That file is the return's inventoried instrument, at the replay path the worker brief mandates. It is not under `scratchpad/c4-T1/`, which the dispatch names, so I disclose it. No other file under `c4-T1-replay/` was read.
2. The attack brief (a capsule member, citing CF-C4-S3-1) directs a copy of the controller-built base cache. I copied `scratchpad/c4-base/LeanProject/.lake/build` into my own project and did not read or copy any seat's cache. I did no directory listing of `scratchpad/`. `ls -la` of `scratchpad/c4-T1/` printed only the parent's `..` metadata line.
3. I also read these, all within the grant: the Stage 2 members `control/C4-WORKER-COMMON-BRIEF.md`, `control/C4-FROZEN-STATEMENTS.lean` and `control/C4-FROZEN-STATEMENTS.md`. I read `sources/c4-base/` and grepped inside it. I grepped Mathlib sources under the shared Mathlib directory for API names. I ran `git rev-parse HEAD` on the bound Mathlib checkout.
4. The protocol lists a "Stage 3 read-boundary disclosures record" as a capsule member. It is not in my capsule manifest, so I did not read it.
5. I did not read any sibling return, sibling critique (the `critics/T1/F/` directory exists and was not opened), adjudication or other experiment root. I made no network access and installed no packages.

## Identity and seal audit

All digests below were recomputed by me with `shasum -a 256` or `hashlib`. Seals use SHA-256 of compact key-sorted JSON without `seal_sha256`, with no trailing newline.

- **Capsule seal** `control/c4-critic-capsules/T1-PACKET-MANIFEST.json`: recomputed `d028a27b88871caedd2f11194da7ee85242580689968676423d42d10262ff6e4`, which matches the dispatch and the file. All 16 member files match their listed SHA-256 and byte counts.
- **Stage 2 seal**: recomputed `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`, which matches.
- **Stage 3 seal**: recomputed `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`, which matches.
- **Stage 4 dispatch seal**: recomputed `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`, which matches.
- **Assigned return** `cycles/cycle-4/stage3/returns/T1/RETURN.md`: `12b0a8187632bddc3b0bd6519301a170a57fc6966cdb478c7cc5712a4b2e108f` (26,537 B), which matches the capsule and admission.
- **Every digest literal in the return was checked:**
  - Frozen `.lean` `0fc723d7…` and frozen `.md` `6aa6dfe5…` both match. `sources/c4-base/SOURCE-DIGESTS.json` holds 12 files and all 12 match. That includes `Main.lean` `385af1bf…` and `Statements.lean` = the frozen `.lean`.
  - T1's edited `Statements.lean` `9904581d…` matches. `build-t1-final.log` `33c6c8ac…` matches. `axioms-t1-final.log` `68197ff8…` matches. `n1_verify.py` `fe41c70c…` matches.
  - The result-table digest `7f1945aa…` was reproduced by my replay (below).
  - The Mathlib pin `905b95818eb32af7874a58b427f50c1711a5e96c` matches both `lake-manifest.json` and the bound checkout's `HEAD`.
  - I found no unmatched literal.
- **Admission defect for T1** (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`): **dismissed.** The token's only occurrence is line 304: "these three declarations are NOT `formally_verified`". That is a negated grade statement, not a label on scratch, so nothing is struck.
- The `BAD_HEADLINE_FLAG` exception is format-only and was applied by the controller. The value `no` is correct.
- **Claim identity:** the return touches no registered key and proposes no `E993-R31-` key. That is correct: the four N1 declarations are frozen texts internal to conjunct 4 (ruling 23), not registry entries. The two cited background keys are cited at their grades and are not used by N1. This critique proposes no key either.

## Independent re-derivation

**Mathematics.** I re-derived all four N1 statements on paper from `cbEdge` and entries 60, 69, 70.

Let `B` be an `r`-free independent set:
- A choke `u_i ∈ B` forbids every `b_ij`. A present `c_ij` is then active (its witness is `u_i`).
- At a closed choke, each leg holds at most one of `b_ij`, `c_ij`, and neither is active.
- `v` is never active, because `W_v = {r}` and `r ∉ B`. `s` and `v` exclude each other.

From this:
- **B1.** The first three conjuncts are filter algebra. `w ≤ 8q` holds by injecting active leaves into the pairs (open choke, leg). `ℓ + 8q ≤ 8m+1` holds by sending residual vertices and open-choke legs injectively into disjoint slots of `range(8m+1)`. Slot `8m` is the arm and slot `8i+j` is leg `(i,j)`. Injectivity uses independence twice: `s ≁ v` fails and `b_ij ≁ c_ij` fails.
- **B2.** The Boolean insertions are exactly the absent `c_ij` at open chokes, so `#Bool + w = 8q`. For the ternary count, the 16m+2 non-root, non-choke vertices split into four parts: open-choke legs (16q), ternary insertions, residual members, and the slot-partners of residual members. Hence `#Ter + 2ℓ + 16q = 16m+2`.
- **B3.** Witness sets are `{r}` or `{u_i}`, so a non-root, non-choke `z` witnesses nothing. B3 has **no** independence or `r`-freeness hypothesis, and it holds for arbitrary `A`.

T1's informal derivation agrees with mine on every count.

**Own Lean instrument, copy-out-first.** The project is at `scratchpad/c4-crit-T1-U/LeanProject`. The four base files were copied from `sources/c4-base`. `Statements.lean` was copied from T1's scratch. The base cache came from the controller path. Packages were bound by manual symlink, the build ran after `cd` into the project, and I never ran `lake update` or `lake clean`.
- **Baseline rebuild of T1's exact project:** "Build completed successfully (8661 jobs)", 0 errors, 19 `sorry` warnings (20 frozen theorems minus 1). This reproduces T1's build log.

**Own Python instrument** (`py/crit_n1.py`; import list `itertools, random, hashlib, json, sys`, standard library only). It is independent of T1's in the following respects:
- It uses a bitmask graph.
- `leafSet` is derived from degree 1, not hard-coded. Supports and witness sets are derived from adjacency.
- Every frozen conjunct is evaluated literally as a filter over the vertex set.
- Sets are generated with no per-choke model: by full `2^n` enumeration at `m = 1`, and by random-order greedy insertion elsewhere.

Results (output digest `1c2a2172df61ea728ddec87d671b7e15ed3b39f201ab2ba0f9cd5906e4eaad6d`), 0 failures:
- **Fixed point at `m = 1`:** 33,573 independent sets. That equals `I(CB(8,1))(1) = 3·6817 + 2·6561` from SEMANTIC-CONTRACT §2's closed form. Of these, 20,451 are `r`-free.
- **B1 and B2 at `m = 1`:** exhaustive over all 20,451 `r`-free independent sets. B2 conjunct (i) independence was re-scanned from scratch.
- **B3 at `m = 1`:** exhaustive over **all 2^20 subsets** `A` (9,437,184 `(A, z)` pairs), matching the statement's actual scope.
- **Other rows:** sampled at `m = 2` (3,000), `3` (1,500), `107` (150), and the fresh and structural rows `158`, `161`, `164` (80 each).
  - B3 at these rows was also run on arbitrary sets that are not independent and that contain `r`.
  - Samples are graph-generic: 103, 147, 150, 80, 80 and 80 distinct `(q, w, ℓ, #Bool, #Ter)` profiles respectively.
- **Mutation controls** (`py/crit_mutants.py`, `m = 1`, digest `d39e4ef8…`): the number is the count of failing sets, and every mutant is caught.
  - B2 total `16m+1`: 20,451.
  - Boolean `8q+1`: 20,451.
  - Arm slot dropped from B1: 1,024.
  - B3 indicator dropped: 765.
  - T1's own first-version bug ("v present = active"): 6,562.

## Attacks and findings

1. **The 61,263-row check is one instrument with a model cross-check, not two instruments.** I replayed `n1_verify.py` copy-out-first: `TOTAL_ROWS=61263`, `RESULT_TABLE_SHA256=7f1945aa…`, reproduced exactly in 2.2 s.
   - "Side A versus Side B" is a genuine two-sided comparison only for B1's `(q, w, ℓ)`. B2's counts and B3's increment are computed on one side (Side B) and compared with the formula.
   - Side B shares the adjacency with Side A. It uses a **hard-coded** `leaf_set = {2} ∪ {c_ij}` and a label-arithmetic `support_of_leaf`, so it assumes entry 60 rather than deriving it.
   - The rows are rows, not sets: 20,451 `m = 1` sets appear as B1, B2 and B3 rows, plus 140 structural random draws at `m ∈ {2, 107, 158}`.
   - The 4 `cbOpenChokeCount_le` rows log a literal `"q_le_m": True` and derive nothing. **Struck as evidence.** The lemma itself is compiled.
   - Exhaustiveness at `m = 1` is genuine. My `2^20` enumeration confirms the structural family is all 20,451 `r`-free independent sets.
   - At class rows the check covers 40 random structural draws at 107 and 158 only. Rows 161 and 164 are untouched, as the return itself says.
2. **B3's bounded evidence did not cover B3's scope.** T1 tested B3 only on `r`-free independent `A` with one random admissible `z`. The frozen text quantifies over **every** `A` and every non-root, non-choke `z ∉ A`, with no admissibility condition. **Narrowed:** the return's B3 computation is evidence for that sub-case only. My exhaustive all-subsets run and the compiled proof below close the gap.
3. **T1's diagnosis of the B3 blocker is wrong.** The return says the frozen `if` "was elaborated under this file's `open Classical in` at the *declaration* site". In the frozen text, B3 is **not** preceded by `open Classical in`; only B1 and B2 are (`control/C4-FROZEN-STATEMENTS.lean`, lines 76–84). T1 itself inserted a `classical` tactic into B3's body (diff line `82a132`). That is the plausible source of the instance mismatch it met. **Struck.** My proof uses `if_pos`/`if_neg`, which are instance-generic, with no `classical`, and it compiles.
4. **Lean claims confirmed.**
   - `cbOpenChokeCount_le`, `cb_tagWitnesses_subset_root_or_choke` and `cb8_activeWitness_unaffected_by_insert` rebuild with 0 errors in my copy.
   - `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for each (`axioms-crit-N1.log`).
   - The helpers say what B3 needs:
     - helper 1: every witness of a leaf has label 0 or a choke label;
     - helper 2: activity of `v' ∈ A` is unchanged by inserting a non-witness `z ∉ A`.
   - Both are used verbatim in my B3 proof.
   - The helpers are stated at `leafSet` with `0 < m` (ruling 24(5)). There is no hypothesis encoding a conclusion, and no `sorry`, `admit`, `native_decide` or `set_option`.
5. **Statement fidelity.** I extracted all 20 frozen theorem headers (`open Classical in` + docstring + statement through `:= by`) and the `cb8GSec` definition.
   - In T1's file and in mine, each occurs exactly once, byte-identical (`stmt-bytecheck.log`, `ALL_HEADERS_PRESENT_ONCE True`).
   - The only lines removed from the frozen file in my copy are four `sorry` bodies (`statements-vs-frozen.diff`).
   - Helpers are inserted between declarations. They add no `open`, `variable`, `instance` or `attribute`, so the elaboration context of the frozen headers is unchanged.
6. **ℕ-subtraction.** The frozen N1 texts contain no subtraction. The proofs use subtraction only inside `/`, `%` label decoding, discharged by `omega` against explicit value equations. Nothing is truncated in a count.
7. **Hypothesis placement.**
   - `hr` enters through `crit_active_leaf_cases`: `v` is never active and `r ∉ insert z A`.
   - `hB`/`hA` (independence) enter through the `s–v` and `b–c` injectivity and through `u_i ≁ b_ij`.
   - `hm` enters through `mem_leafSet_cbGraph_iff`.
   - B3 needs neither independence nor `r`-freeness, and that matches its text.
8. **Fresh rows, favorability, row index.** N1 is rank-free and holds for every `m ≥ 1`, so favorability at the index of record (ruling 16) and the `m = 107` endpoint do not enter. My instrument ran rows 158, 161 and 164.
   - **Order disclosure:** my B3 Lean proof compiled *before* the fresh-row run; B1 and B2 compiled after it.
   - Ruling 29: T1's row numbers are pass/fail of rank-free identities, and it states textually that no `Δ_p` applies. That is written, so there is no rejection.

## Mechanism-equivalence and fence check

- **Mechanism.** T1 proves the frozen N1 texts, with the up-cover counts obtained via the per-choke clone correspondence. That is the allocated mechanism. It revives no refuted mechanism: no `clone_fiber_card` ℕ truncation, no CHAR at `m = 1`, no per-choke `m`-independent certificate, and no real-rootedness of any forest polynomial.
- **My proof's mechanism.** It is an injection and partition by slot and partner (arm slot; leg slot `8i + j`; the `s ↔ v` / `b ↔ c` partner involution). It is a third decomposition, distinct from T1's clone-product narrative and from U1's per-vertex adjacency route (ruling 30), which I did not read. It consumes T1's two compiled helpers in B3 only. It uses no other seat's work.
- **Fences.**
  - N1 claims no (HALL), no rank, no class-level or aggregate statement, no `θ*` law, and no Newton or Darroch input. It is graph-generic on `CB(8, m)`, `m ≥ 1`, exactly as frozen (ruling 23).
  - Census values are used only as bounded evidence, never as proof.
  - The r30 bounded record is not used.
  - FLOW ⇒ SIGN and status transfer are not touched.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| `cbOpenChokeCount_le` "compiled sorry-free", axioms `[propext, Classical.choice, Quot.sound]` | Rebuilt + `#print axioms` by me | **Backed** |
| Two helpers "compiled sorry-free" | Rebuilt + axioms by me | **Backed** |
| "Build completed successfully (8661 jobs)", 0 errors | Reproduced | **Backed** |
| Every digest literal (see the seal audit) | Recomputed | **Backed** |
| "61,263 rows, 0 failures", table `7f1945aa…` | Replayed | **Backed as a count of rows.** "Two independent sides" narrowed to B1's `(q, w, ℓ)`. The 4 literal `q_le_m: True` rows are **struck**. |
| B3 "checked" | Only on `r`-free independent `A` | **Narrowed** (finding 2) |
| Decidable-instance diagnosis ("`open Classical in` at the declaration site") | Contradicted by the frozen text | **Struck** |
| "exhaustive at m = 1 (20,451 sets)" | Confirmed by my `2^20` enumeration | **Backed** |
| "matches the drafter's M2 count of 20,451" | `C4-FROZEN-STATEMENTS.md` line 855 | **Backed** |
| Grades: companion and helpers "compiled, ungraded"; B1–B3 "informal + bounded"; route verdict `compiled`; `FROZEN_NODES_CLOSED: none` | SOLUTION-CONTRACT §4; ruling 32 | **Correct as returned** |

No `formally_verified` label on scratch exists (the admission defect is dismissed).

### Critic-derived advance (attributed to C-T1-U, Claude Opus 5.5)

**All four N1 declarations are now compiled sorry-free on the Cycle 4 base, in critic scratch, exactly as frozen.** The declarations are `cbOpenChokeCount_le` (T1's body), `cb8_rFree_deletionClasses` (B1), `cb8_rFree_insertionClasses` (B2) and `cb8_nonChokeInsert_weight` (B3).
- **Build:** `lake build LeanProof` gives "Build completed successfully (8661 jobs)" with 0 errors and 16 `sorry` warnings. Those 16 are the remaining frozen nodes N2–N8 (`build-crit-N1.log`).
- **Axioms:** `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for all four and for T1's two helpers, with no `sorryAx` (`axioms-crit-N1.log`).
- **Headers:** byte-identical to the frozen text.
- **B3** (the step the brief names): two case splits (`z ∈ leafSet`; `z` active) with `Finset.inter_insert_of_mem`/`notMem`, `Finset.filter_insert` and `if_pos`/`if_neg`, over a `filter_congr` from T1's helper 2 via helper 1. The mismatch never arises.
- **B1:** five new scratch helpers (`crit_card_filter_three`, `crit_leaf_not_choke`, `crit_chokeFilter_card`, `crit_active_leaf_cases`, `crit_residual_cases`) plus the slot injection.
- **B2:** the Boolean part is a union–image identity onto `open chokes × 8`. The ternary part is the four-way partition of the 16m+2 non-root, non-choke vertices with a partner involution `critPi`.

Grade: **compiled scratch, ungraded** (SOLUTION-CONTRACT §4). It is not `formally_verified`, because no governed award has run. It becomes eligible for Stage 7 under ruling 31 ("N1 + N2 if compiled"), subject to that ruling's two-award cap.

## Verdict

verdict: retained_narrowed
headline_resolved: no

- `COND4_formal`: not discharged. N2–N8 remain `sorry` on this record.
- `E1_formal`: not established. N1 now compiles in critic scratch, but N2 (`cb8N_sum_eq_cb8R`, `cb8E1Arc_spec_topRank`) was not touched by the return or by me.
- `TERMINAL_integration`: not reached.
- `cut_candidate`: none. No counterexample to any N1 text was found: exhaustive at `m = 1`, sampled at 2, 3, 107, 158, 161 and 164, and now proved.
- `FROZEN_NODES_CLOSED: none`

That gate line covers the assigned return only; it closes 1 of N1's 4 declarations. As a critic-derived advance outside the gate line, the whole of N1 is compiled sorry-free in `scratchpad/c4-crit-T1-U/`.

**Reasons for retained_narrowed.** The return's substantive claims are retained: the compiled companion and helpers, an informal derivation that is correct and complete, and an honest route verdict and gate line. Three things narrow it:
- the "two instruments" characterization is overstated (finding 1), and 4 literal rows are struck;
- the B3 bounded evidence covers a strict sub-case of the statement (finding 2);
- the stated cause of the B3 blocker is false (finding 3).

No mathematical claim of the return is refuted. In prose: the mathematics of all four N1 statements is complete. It is now also compiled, and I would grade the statements `proved_informal`, pending an isolated second read. The compiled form stays ungraded until a governed award.

## Remaining obligation

What a successor inherits, exactly:
1. **A governed award for N1.** A Stage 7 formalizer must re-author the four N1 bodies and the scratch helpers under attribution: T1 for the companion and B3 helpers; C-T1-U for B1, B2, B3 and their `crit_*` helpers. Carries must come from the governed C1-LA2 entries 23, 24, 34, 35, 57, 60, 69 and 70 (ruling 19), not from base copies. The frozen headers must be re-checked byte for byte against `control/C4-FROZEN-STATEMENTS.lean` (`0fc723d7…`) and `#print axioms` run on the award. An isolated second read is needed before any grade.
2. **N2 is the next critical-path node.** It is still open: `cb8N_sum_eq_cb8R` and the unconditional `cb8E1Arc_spec_topRank`. They consume N1 as frozen statements. N1 is now available as compiled scratch for a stitching project.
3. **Record corrections to carry:**
   - T1's decidability diagnosis is struck.
   - The "two-sided" characterization of `n1_verify.py` is narrowed to B1's `(q, w, ℓ)`.
   - Its 4 literal `q_le_m` rows are struck as evidence.
4. Nothing about conjunct 4, E1_formal, Tier 1 or any registered key changes on this critique. `headline_resolved` stays `no`.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-T1-U/`, with SHA-256 values.

| Artifact | SHA-256 |
|---|---|
| `LeanProject/LeanProof/Statements.lean` (frozen text + the four N1 bodies + scratch helpers) | `46cbca4746e2c1a7a57efb1b907741e58f4d597f0db7046c96f30e348a71e5ca` |
| `LeanProject/Crit/B3.lean` | `155b25481d558b307d413f16a5fe7a52979758aa3814ecf96daea24fefce962c` |
| `LeanProject/Crit/B1.lean` | `612bebfd985ec33f70b44152601ef6a610fdd5737ce110d2178fb9ba033ceab5` |
| `LeanProject/Crit/B2h.lean` | `2d626b916b8652e12f714c5a5828e73716bb6e699c62d1b805420fd56337a3e0` |
| `LeanProject/Crit/B2.lean` | `af1dd1322908565186fc52f006f2d7c769fea2917ad5e00e11a358b233e403f6` |
| `LeanProject/Crit/Ax.lean` | `5078c107e811807196d5812f6543386fc9fa5e5951b1dcb55733e9bd01f70c4b` |
| `build-crit-baseline.log` (T1's project, rebuilt) | `b36b871eca1111ced7be2fbacea852490ce1a48ebaf5d497b7f038ca535a7187` |
| `build-crit-B3.log` | `608c57387ec44adb658105b702b4880a5b66e35a5a5e35b0decccd0e73f552b3` |
| `axioms-crit-B3.log` | `2b5056a983e9c379965dad6f069f3dd39bb2ca8a3df5b91fc165e67b5007670d` |
| `build-crit-B1B3.log` | `d50203a8f66806e29316fade1fe505decd490330b19d76dd6c7ab63eccce73b7` |
| `axioms-crit-B1B3.log` | `cd13e19de4285797773f2cc7415f4f56f800a9249087e4d8eb1685b8767975b6` |
| `build-crit-N1.log` | `5516bd5e470eb5451be4c01a79fb264775fdd1c30c06b49185bc9520571d3706` |
| `axioms-crit-N1.log` | `21267320181710f5d09db00b1f837d3eccaf75f2ceaaf58c6f58511e4504a984` |
| `statements-vs-frozen.diff` | `398dbcc5fdc78ad9b6a939468aceec3814832d7415ba7b6cc10de129df783467` |
| `stmt-bytecheck.log` | `702d04c9dfd91537f540126c77ed7c4fe074db68c029dac268583adcf006cc41` |
| `py/stmt_bytecheck.py` | `80bc4e0cfb9779ff88d4dd6e4768254e6d06c08ba1a182bbd3add641c5c7f6e3` |
| `py/crit_n1.py` | `e8495028bc092cf014a83856fec8187df15942a481ad46454b8c3c04cff6b0ab` |
| `py/crit_n1.out` | `d2adc78505ae17a41516c075addb7831c047f9f77c8dc5483dc1ce2136a49fa4` (JSON digest `1c2a2172…`) |
| `py/crit_mutants.py` | `3b1c7489562086af0a6789d012476c6aef9b9d1eef8bd03e370dc3c2876b2064` |
| `py/crit_mutants.out` | `9f43d6be5d5e3d0ea56b1b61152cf0446d0541e88c94c2ffa5812ed1c16b7b14` |
| `replay/n1_verify.py` (T1's generator, copied out) | `fe41c70c4ef83828b0e26f2bb5f70ec08a5f7d8c3d1e519f930b1739b7659b56` |
| `replay/replay.out` | `bc07424ee681208ca7fb0ac415b63c8d3fd6e209ddb0cb24265e3312c4921edf` |
| `replay/n1_verify_results.json` | `e9f556a77015e82af70b8008c734aff527f887b219c60e48ab15b796f99c9bef` |

**Replay commands.** Run everything in the foreground.
- Lean: `cd <run root>/scratchpad/c4-crit-T1-U/LeanProject && lake build LeanProof && lake env lean Crit/Ax.lean`.
- Python: `cd <run root>/scratchpad/c4-crit-T1-U/py && python3 -B crit_n1.py && python3 -B crit_mutants.py`.

**Environment.** `.lake/packages` is a manual symlink to the shared Mathlib `v4.32.2` project (rev `905b9581…`). `.lake/build` is copied from the controller-built base cache.

**Background jobs.** None was started. Every build and Python run was in the foreground, and I ran no process listing.
