# Terminal Checkpoint Analysis — r31

Independent terminal checkpoint analysis for r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`; Erdős #993: a
parameter-uniform switch-using Hall certificate on CB(8,m) at `p* = (16m+4)/3`, class `m ≥ 107`, `m ≡ 2 (mod 3)`). Written
2026-09-29 by the clock, in place of the end-of-Cycle-6 analysis (the run ended at the Cycle 4 Stage 7 close by decisive event (a),
R31-N-32). Analyst: Claude Fable 5.1, chartered high (AUTHORIZATION.md §3; SOLUTION-CONTRACT §5; the terminal brief). This analysis
is an input to the terminal controller review and the publication. It registers, seals, rules and edits nothing.

chartered fable/high; transport-resolved model fable (explicit parameter); runtime-reported model id: claude-fable-5-1

**Boot.** I am operating within VerityOS. I booted by reading exactly `verity.md` and `identity/startup-protocol.md` of the VerityOS
root (absolute paths withheld under the brief's path rule). Subsystems loaded: those two files only. I did not follow the task-type
map into memory, logs, skills, decisions, operations or conversations. The brief's single-output-file rule supersedes the
repository's conversation-logging instruction for this seat; I wrote no conversation log.

## Identity and seal audit

**Verified before reading anything else.**

| Object | Recomputed | Result |
|---|---|---|
| Brief `control/CHECKPOINT-ANALYSIS-TERMINAL-BRIEF.md` (file SHA-256) | `d505873468e19111df42760bab03071fd3b964a5b2fd575b568de993d788fada` | MATCH (the value given at dispatch) |
| **Capsule seal** `control/CHECKPOINT-TERMINAL-PACKET-MANIFEST.json` (SHA-256 of compact key-sorted JSON minus `seal_sha256`, no trailing newline) | **`aed8e02c5bafdbe5c4e64fe25555f23371c4c4ee3f327d88052a53e5dd173f0d`** | MATCH |
| Members: 307 listed (`file_count` 307; run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`; stage `terminal-checkpoint`; schema `verityos.math-dre.packet-manifest.v1`) | every byte count and SHA-256 recomputed | **307/307 MATCH**, 0 missing, 0 mismatched (`scratchpad/terminal-checkpoint/seal-and-members.txt`) |

**Independent re-verification of the record's own identity claims** (my instruments, Python standard library, `python3 -B`,
foreground, exact integers; no Lean build).

- **C4-LA1 run files.** `LeanProject/LeanProof/Main.lean` hashes to `c1ef9d638a18077cbccfdfa80064309343d8cd3b98262c645dea18cb569e699b`,
  equal to the kernel receipt's `source_sha256_before` and `_after`; `RECEIPTS/kernel-verification.json` hashes to `c5765c15…a883`
  (the value the fidelity receipt binds); `VERIFICATION-REPORT.md` hashes to `dff86aa2371378ff9e9b0cf6805a00d499cc73c0f13d1d47a6a83440b4b53901`
  (the value in `RUN-STATE`, `CYCLE-CLOSE` and R31-N-32); `RECEIPTS/fidelity-audit.json` to `c8f3ca18…`; `THEOREM-CONTRACT.yaml` to
  `6a950375…b410` (the fidelity receipt's `contract_source_sha256`); `control/C4-FROZEN-STATEMENTS.lean` to `0fc723d7…ede1`
  (gate ruling 23). All 6/6 as recorded.
- **The terminal statement.** The source text of `theorem cb8_topRank_eligible_and_weightedHall` from `theorem` up to ` :=`
  hashes to `c17cc9cf5bcc01c53709dd764f02fe37cc481f85794fd5f65affd6efc4174952`, the value the fidelity reviewer, the informal
  auditor and the closeout record; it is the SOLUTION-CONTRACT §2 code block character for character (compared by eye against the
  contract text I read). `Main.lean` has exactly one `theorem` keyword line (19,784 lines, 2,813,803 bytes, 758 registrar entries:
  65 definitions, 692 lemmas, 1 theorem). Eight `sorry` tokens occur, every one inside a `/-- … -/` docstring that says "sorry-free"
  (`scratchpad/terminal-checkpoint/lean-checks.txt`); the kernel receipt's `incomplete_proof_scan` passed.
- **Kernel receipt.** Verdict `verified`; 11/11 checks passed (`project_build`, `single_file`, `axiom_probe`, `axiom_policy`,
  `incomplete_proof_scan`, `unsafe_execution_scan`, `source_immutable`, `pinned_project`, `toolchain`, `path_containment`,
  `execution_sandbox`); allowed axioms exactly `propext`, `Classical.choice`, `Quot.sound`; Lean `v4.32.2`, Mathlib
  `905b95818eb32af7874a58b427f50c1711a5e96c`; the shared packages tree bound read-only. `VERIFICATION-REPORT.md`: informal audit
  `passed`, fidelity audit `passed`, no blocking findings, verdict `formally_verified`.
- **The eight awards' receipts** (all in the capsule): every `Main.lean` hashes to its receipt's `source_sha256_before` = `_after`;
  every receipt `verified` with the three standard axioms; every `VERIFICATION-REPORT.md` `formally_verified`; every fidelity audit
  `passed` (C1-LA1 32/0/0, C1-LA2 47/0/0, C1-LA3 19/0/0, C2-LA1 54/0/0, C2-LA2 17/0/0, C2-LA3 29/0/0, C3-LA1 33/0/2 warnings,
  C4-LA1 80/0/0); same toolchain and Mathlib pin throughout.
- **The carried chain (my check, independent of `CAPSULE-VERIFICATION.json`).** The origin terminal statements of C1-LA1
  (`cb8_topRank_sectorTemplate_feasible`), C1-LA2 (`cb8_topRank_of_descent_and_flow`), C1-LA3 (`cb8_block_descent_topRank`), C2-LA2
  (`cb8_leafDeletion_closedForms_descent_topRank`) and C2-LA3 (`cb8_favorableLeaves_eq_leafSet_topRank`) each occur in the C4-LA1
  `Main.lean` exactly once, as `lemma` with the statement text byte-identical after the keyword — the five rekeyed terminals of
  R31-N-15, reversible. The C2-LA1 and C3-LA1 terminals are not carried (C2-LA1's face companions 0546/0547 and C3-LA1's cone
  entries are), which matches the fidelity finding `996b9e6acd0c0793`. `CAPSULE-VERIFICATION.json`: `carry.all_ok`, 627 rows,
  622 byte-identical, 5 keyword-rekeyed; 8 origin awards, each `main_matches_receipt` true, 0 fragment failures; verdict `passed`.
- **The frozen leaves.** All 20 frozen theorem headers of `control/C4-FROZEN-STATEMENTS.lean` occur exactly once in `Main.lean` as
  `lemma` and zero times as `theorem`; the frozen `cb8GSec` definition block (708 bytes) occurs exactly once, byte-identical
  (`scratchpad/terminal-checkpoint/lean-checks.txt`). The frozen file has 21 `sorry` bodies, as gate ruling 23 says.
- **Second reads.** The six `R31-SR-C4-*/SECOND-READ.md` files hash to the values in `control/C4-SECOND-READ-AGENTS.json` (6/6).
  Verdicts: SR-C4-1 a–d `confirmed`; SR-C4-2 a `confirmed`, b `confirmed_with_repairs`; SR-C4-3 a–b `confirmed`, c–d
  `confirmed_with_repairs`; SR-C4-4 a–b `confirmed`; SR-C4-5 a `confirmed_with_repairs`, b `confirmed`; SR-C4-6 a `confirmed`, b
  `confirmed_with_repairs`. No rejection. Every repair is wording, gloss or attribution; none touches a statement or a step.
- **Registry snapshot at the Cycle 4 close.** 497 claims (VERIFIED 315, REFUTED 98, OPEN 58, CONDITIONAL 26; the same census as at
  the Cycle 3 close — no status changed, one grade changed); six `E993-R31-` keys; ledger 63 rows; lint 0 findings, 2 accepted
  warnings (the two `UNREGISTERED_REFUTATION` rows on ledger-only refutations that were never registered claims — correct).
- **Model disclosures.** All 36 route returns carry runtime id `claude-sonnet-5` (Sonnet 5.5 unavailable, R31-N-27); every critique,
  adjudication, synthesis, Stage 7 seat and second read that carries the two-part line reports `claude-opus-5-5`; the `*-AGENTS.json`
  records report `claude-opus-5-5` for every Opus seat and `agent_model_param: sonnet` for the routes. Session effort `high` is
  recorded from the Cycle 4 gate on (C4 agents records); Cycles 1–3 remain unrecorded, as disclosed.
- **A small explanation for the controller.** The `FORMALIZER-REPORT.md` capsule-manifest digest `2a70da3ac6c4…2dea4` (corrected by
  record R31-C4-FORMALIZER-REPORT-CAPSULE-DIGEST-CORRECTION to `768128a3…`) is exactly the kernel receipt's `receipt_id`. The
  transcription error is a pasted receipt id, not a mis-hashed file. Nothing changes.

**Read-boundary disclosures (this analyst).**
1. Capsule members read: the three contracts and `AUTHORIZATION.md`; `control/R31-CHARTER-PROMPT.md`; all four `CYCLE-CLOSE.md`,
   `*-CLOSE-REGISTRATION-LOG.txt`, `C4-STAGE1-GATE.md`, the lint file, the five snapshots (registry, distinctions, obligations,
   controller notes, run state — the registry and distinctions by script); `control/CHECKPOINT-ANALYSIS-C3.md` in full; the Cycle 4
   synthesis in full; the Cycle 4 F adjudication by `grep`; the C4-LA1 run (verification report, kernel receipt, fidelity receipt and
   review, informal proof and audit in full; formalizer report head and by `grep`; capsule verification and theorem contract by script);
   the C4-LA1 `Main.lean` by script and `grep` (the terminal, its proof term, every definition of record and the frozen blocks — not
   the 19,000 lines of proof bodies); the other seven runs' receipts, reports and fidelity receipts by script; `Main.lean` of each by
   hash and terminal extraction; `C4-FROZEN-STATEMENTS.lean` by script; the six Cycle 4 second reads (heads, verdicts, findings and
   registration text by `sed`/`grep`); every `*-AGENTS.json` by script (model-id census); the 36 route returns, 72 critiques, 12
   adjudications and 22 second reads by `grep` for runtime-id tokens only. I did not read the Cycle 1–3 returns, critiques,
   adjudications or syntheses beyond that census (the C3 checkpoint already covers them; the cycle closes and controller notes
   record their outcomes).
2. Frozen `sources/` reads: `sources/concurrent/master-515-2026-09-29/CLAIM-IDENTITY.json` (by script: key lists, statuses, one
   changed record's field names). Nothing else under `sources/`.
3. The harness injected the project `CLAUDE.md`, the user auto-memory index (which mentions this run) and the user's e-mail into my
   context before my first tool call. I did not open or use them; nothing here rests on them.
4. Two oversized tool displays were saved by the harness to its own cache outside the run root: the first `cat` of the manifest (I did
   not open the cached copy; I re-ran the check by script) and my own `sed`/`grep` skim of the six second reads (I read that cached
   copy; its content is capsule-member text produced by my own command). No other file outside the run root was read.
5. No `lake`/`lean`, no network, no installs, no child agents, no background jobs, no process listings. Scratch only under
   `scratchpad/terminal-checkpoint/` (one `mkdir -p`). This file is my only output. No sealed member was edited.

## The decisive-event claim

**Verdict: Tier 1 is formally verified at FULL scope as SOLUTION-CONTRACT §1/§2 define it. Nothing in the statement or its
definitions falls short of the contract.** Clause by clause, read in the Lean source of record (`Main.lean`), not in a summary.

| Contract clause (SOLUTION-CONTRACT §1 Tier 1; SEMANTIC-CONTRACT §1–2) | Lean object in `Main.lean` | Reading | Verdict |
|---|---|---|---|
| The class: every integer `m ≥ 107`, `m ≡ 2 (mod 3)`; no cutoff `M_0`, no omitted range | binders `(m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2)`; nothing else | The whole class; the hypotheses are satisfiable (`m = 107`) and the class is infinite; no `hfav`, no asymptotic step | full scope |
| `T = CB(8, m)`: path `r – s – v`, `m` chokes at `r`, 8 supports per choke, one private leaf per support, `n = 17m + 3` | `cbEdge m` on `Fin (17*m+3)`: edges `0–1`, `1–2`, `0–(3+17i)`, `(3+17i)–(3+17i+1+2j)`, `(3+17i+1+2j)–(3+17i+2+2j)` for `i < m`, `j < 8`; `cbGraph m = SimpleGraph.fromRel (cbEdge m)` | Labels cover all `17m+3` vertices (max `17m+2`); `fromRel` symmetrises and drops loops; conjunct 1 proves `IsTree` | matches |
| `p* = (16m + 4)/3`, one rank per tree | the literal `(16 * m + 4) / 3` in ℕ, in every conjunct; no other rank appears | exact on the class (`16m + 4 ≡ 0 (mod 3)` from `hres`) | matches; fence 1 kept |
| (E) `x(T) + 2 ≤ p*` with `x` the first strict descent computed in ℤ through rank `α` (counts zero above `α`) | `C5LA1.crossingIndex G = Nat.find (fun k => forwardDifferenceDel G ∅ k < 0)`; `forwardDifferenceDel G D k = (indepSetCount G D (k+1) : ℤ) − indepSetCount G D k`; `indepSetCount` = card of the independent `k`-subsets avoiding `D` (a `powersetCard` filter, hence 0 above `α`); the `Nat.find` witness is `k = α` (`Δ_α = −i_α`) | the actual first descent, in ℤ, through `α`; conjunct 2 is `crossingIndex (cbGraph m) + 2 ≤ p*` | matches |
| (E) `3p* < 2α(T) + 1` | conjunct 3: `3 * ((16*m+4)/3) < 2 * (cbGraph m).indepNum + 1`, Mathlib's `indepNum` | the low window, with `α` Mathlib's independence number | matches |
| `F = F_{p*}(T)`, the original strict favorable-leaf selector, DERIVED: original leaves `v` with `Δ_{p*}(T − v) = i_{p*+1}(T − v) − i_{p*}(T − v) < 0` | `favorableLeaves G p = (C5LA1.leafSet G).filter (C4LA1.IsFavorableAt G · p)`; `IsFavorableAt G v p ↔ vertexDeletionForwardDifference G v p < 0`; that difference is `(vertexDeletionIndepSetCount G v (p+1) : ℤ) − vertexDeletionIndepSetCount G v p`, the counts taken over `Finset.univ.erase v` (the graph with `v` deleted); `leafSet G = univ.filter (IsGraphLeaf G)`, `IsGraphLeaf G v ↔ ∃! u, G.Adj v u` | the strict selector, at rank `p*`, on the original tree, computed inside the statement (no hypothesis assumes it) | matches; fence 2 kept |
| Active-tag weight `w_F(B) = #{v ∈ F ∩ B : B ∩ (N(s_v) ∖ {v}) ≠ ∅}`, `s_v` the original support, distinct leaf tags | `activeWeight G F B = ((F ∩ B).filter (fun v => ¬ Disjoint (B.erase v) (tagWitnesses G v))).card`; `tagWitnesses G v = (G.neighborFinset (C5LA1.support G v)).erase v`; `support G v` = the unique neighbour of a leaf (a `Classical.choose` on the leaf predicate; only ever evaluated on `v ∈ F ⊆ leafSet`) | `B.erase v` versus `B` is immaterial since `v ∉ N(s_v) ∖ {v}`; every leaf is its own tag | matches |
| Relation (D) ∪ (S): `A = B ∖ {q}`, or `A = (B ∖ N(u)) ∪ {u}` with `u ∉ B`, `|N(u) ∩ B| = 2` | `transportRel G B A ↔ (∃ q ∈ B, A = B.erase q) ∨ (∃ u, u ∉ B ∧ (G.neighborFinset u ∩ B).card = 2 ∧ A = insert u (B \ G.neighborFinset u))` | word for word | matches |
| (HALL) at `(T, p*)`: a saturating integral flow; equivalently `Σ_X w_F ≤ Σ_{N(X)} w_F` for every `X ⊆ I_{p*+1}` | conjunct 4: `∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) p*) p* f`; `IsSaturatingFlow`: `f : Finset V → Finset V → ℕ`, positive only on `B ∈ indepFamily G (p+1)`, `A ∈ indepFamily G p` with `transportRel G B A`; every source row `= activeWeight G F B`; every target column `≤ activeWeight G F A` | the integral saturating-flow form — the stronger of the two equivalent forms (flow ⇒ inequality by summation over `X`; inequality ⇒ flow is r30's formally verified `exists_saturatingFlow_of_weightedHall`, carried byte-identically as entries 0030/0031) | matches; nothing weaker than (HALL) is claimed |
| Fidelity fence 2: the weight, relation, selector and first descent are r30's of record | the network definitions are byte-identical to r30 C1-LA1 Snippets 0014–0021 and `crossingIndex` to first-interior entry 14 (fidelity finding `996b9e6acd0c0793`; C-F1-U's compiled `rfl` equalities in Cycle 4) | I confirmed the definitions denote the contract's objects; I did not re-hash the r30 Snippets (not in this capsule) | matches |

**Non-vacuity.** The class is infinite; the sources `I_{p*+1}(T)` are non-empty (a sector member `{r, v}` plus `p* − 1` legs exists
because `p* − 1 ≤ 8m`); the weight of any sector member is exactly 1 (tag `v` with witness `r`), so `f = 0` does not satisfy the row
equations. The flow conjunct has content on every class row.

**Receipts and independent reviews.** Kernel `verified` (11/11), axioms exactly the standard three; informal audit `passed` with the
auditor's own exact instruments (exhaustive at `m = 1`; the literal composed flow arc by arc at `m = 107, 110, 161` with every image
and preimage enumerated; the template, `ρ_q < 1` and the switch-image load at every class row `2..302` and `500`; the graph layer,
closed forms, `α`, `x` and favorability at every class row `2..500`); fidelity `passed` (80/0/0) with an independent semantic review
that read `cbEdge`, `favorableLeaves`, `activeWeight`, `transportRel`, `IsSaturatingFlow`, `crossingIndex` in Lean and recomputed the
two projection fingerprints. My reading above agrees with the fidelity reviewer's on every clause.

**Carried-chain integrity.** 627 carries: 622 byte-identical governed fragments and 5 origin terminals rekeyed `theorem → lemma`
(I confirmed all five and their reversibility); every one of the eight origin `Main.lean` files equals its own verified receipt's
source hash; the r30 (HALL ⇒ FLOW) entries 0030/0031 are byte-identical to r30 C1-LA2's Snippets (fidelity finding; not re-hashed by
me). Every carried fragment is re-elaborated and re-kernel-checked inside C4-LA1's single file, so the carry record is provenance,
not the proof's soundness. The 442 `set_option` lines (heartbeats, recursion depth, exponentiation threshold) all lie in carried
fragments and cannot affect kernel soundness; the new text has none.

**Where I looked for a shortfall and found none.** (i) A hidden hypothesis on the selector (`hfav`): absent — C2-LA3 discharges it
inside the proof. (ii) A weaker flow notion (rational, unsaturated, or on a quotient): the statement is the ℕ-valued saturating
flow on the literal network; the rational bundle and the orbit quotient are proof internals. (iii) A rank other than `p*`, a
narrower class, or a cutoff: none. (iv) `x` computed to a bounded rank rather than through `α`: `Nat.find` with the witness at `α`.
(v) Definitional drift from r30: byte-identical carries with an independent `rfl` check. (vi) A trivialising convention: the `x / 0 = 0`
convention lives in the in-file `cb8E1Val` and never reaches the statement. (vii) Newton, Darroch, the `θ*` law, LP optimality, a
census: none can enter — the terminal has no hypotheses beyond `hm`, `hres`, and the axiom set is standard.

**Decisive event (a) is correctly called.** SOLUTION-CONTRACT §5: Tier 1 `formally_verified` at its full scope ends the run at that
cycle's Stage 7 close. The award closed at 03:04 EDT on 2026-09-29 (Cycle 4 of 6); the Cycle 5 portfolio lapsed correctly.

## Registry fidelity

**Faithful.** The Cycle 4 registration (`control/C4-CLOSE-REGISTRATION-LOG.txt`, 30 lines) does exactly what R31-N-31 ruled and
SR-C4-4 recommended, and no status crosses a fence.

- **The Tier 1 key re-graded, not duplicated.** `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`:
  `status VERIFIED`, `evidence_grade formally_verified`, `formal_award true`, `terminal_evidence {grade formally_verified, award
  runs/lean-2026-09-29-c4-la1-…}`; `terminal_history` carries the full path `computer_assisted` (C1, SR-5) → `proved_informal` (C2,
  SR-C2-5) → two C3 notes → `formally_verified` (C4, award C4-LA1, decisive event (a)); the `certificate` field ends with
  "[r31 C4; C4-LA1] grade proved_informal -> formally_verified: governed award C4-LA1 closed formally_verified (decisive event (a))";
  the `scope` field ends with the C4 note (fences, excluded conclusions, `S(T_m, p*) ≤ 0` by composition only, the full attribution
  of the frozen leaves to seats and critics, the carried awards, Codex and r30). The synthesis's candidate name
  `…-RANK-16M-PLUS-4-OVER-3-ELIGIBLE-AND-WEIGHTED-HALL` is recorded as an alias, as is the Lean terminal name. No new key was minted.
  The registry stays at 497.
- **No-status-transfer notes present and correct.** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN) and
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN) each carry a `[r31 C4; C4-LA1]` scope note stating the class rows at
  `p*` only and "No status transfer; this key stays OPEN"; the aggregate's note names the `S(T_m, p*) ≤ 0` consequence as a composition
  with r30's FLOW ⇒ SIGN award. The r30 row key `E993-R30-CB-8-M-95-TO-107-…` (VERIFIED) carries "Continued by the r31 family key …
  on the class from m = 107; the two overlap at m = 107 only. This key's statement, grade and fences are unchanged." The C1-LA1 key
  carries the SR-C4-6 zero-slack note (template level; "this key's formally_verified grade covers (i)–(v) as stated, not this note").
- **The second-read records and critic-derived grades.** The N1–N7 companion records enter the ledger at `proved_informal`,
  critic- or seat-attributed exactly as the six reads confirmed (SR-C4-1 a–d, SR-C4-2 a–b, SR-C4-3 a–d, SR-C4-4 a–b); the composed-flow
  and off-class records at `bounded_computation` (SR-C4-5); five distinction rows (`R31-C4-N1-VS-R30-MARK-CLONE`, `R31-SR-C4-2-D1`,
  `R31-SR-C4-4-D1`, `R31-SR-C4-5-D1`, `R31-SR-C4-5-D2`) present in the distinctions snapshot; three correction/process records. The
  grade of a companion is never the award's: every record says "kernel-checked inside C4-LA1 with no certificate of its own".
- **Status census unchanged.** VERIFIED 315 / REFUTED 98 / OPEN 58 / CONDITIONAL 26 before and after the Cycle 4 close: one key changed
  grade within VERIFIED (the Tier 1 key was already `VERIFIED` at `computer_assisted` since Cycle 1). No OPEN key closed, no REFUTED
  key regressed. `E993-TREE-REAL-ROOTED` stays REFUTED.
- **Alias hazard against the frozen concurrent master `sources/concurrent/master-515-2026-09-29/`** (`scratchpad/terminal-checkpoint/registry-screen.txt`).
  515 = 491 + 24; the 24 keys added concurrently are all `E993-PATH-STAR-*` or `E993-FINITE-BLOCK-*` (the Astra/Codex
  absolute-compensation run). No `E993-R31-` key exists in the master. The six r31 keys are absent from the master, as expected
  before the rebase. The nearest lexical neighbour of the Tier 1 key in the master is the r30 row key (similarity 0.64), which is the
  intended predecessor and carries the distinction rows SR-4-DR3, R31-C1-SR-5-D1 and R31-SR-C4-5-D2. No new master statement concerns
  CB(8, m) or the rank `(16m+4)/3`. **0 collisions.**
- **One concurrent status change on a shared key, for the rebase.** `E993-PATH-STAR-ARITY-2-4-SELECTED-LOWER-MARK-MASS-COMPENSATION`
  is `OPEN` in the run-local registry (a copy of the 491 baseline) and `VERIFIED` in master-515 (fields `status`, `evidence_grade`,
  `certificate`, `terminal_history`, `dependencies` changed by the concurrent run). The additive rebase must take the master's
  current record for every one of the 491 baseline keys and add only the six r31 keys plus the r31 notes on the touched keys. A
  rebase that copied the run-local 497 records over the master would regress that key to OPEN. This is the one concrete
  reconciliation hazard I found; it is mechanical.
- **Two ledger-hygiene items** (records only; no grade involved). (a) `OBLIGATIONS.csv` rows `R31-OBL-TIER1` and `R31-OBL-LS-TOP` still
  read `status = open` in the Cycle 4 close snapshot; both are discharged (Tier 1 by C4-LA1; (L-S)_top at template level by C1-LA1 and
  on the literal network through the N3/N4 bridges inside C4-LA1) and should be closed at the terminal close with the award named.
  (b) The Tier 1 key's `certificate` field opens with the Cycle 1 sentence "No formal award." and its `scope` field still contains the
  Cycle 2 sentences "the graph-level link for the private leaves is not formally verified" and "Not decisive (SOLUTION-CONTRACT §5)".
  Under the never-edit rule these stay, superseded in place by the later notes; the public face and the master's rendered status map
  must lead with the current grade and cite the C4 note first, or a reader who stops early is misled (the same risk the C3 checkpoint
  named as R-10, now twice over).

## What the run established

**The strongest theorem** (`formally_verified`, award C4-LA1, terminal `E993Transport.cb8_topRank_eligible_and_weightedHall`):

> For every integer `m ≥ 107` with `m ≡ 2 (mod 3)`, with `T = CB(8, m)` on `17m + 3` vertices and `p* = (16m + 4)/3`: `T` is a tree;
> the actual first strict descent `x(T)` of its independence sequence satisfies `x(T) + 2 ≤ p*`; `3p* < 2α(T) + 1`; and the literal
> active-tag weighted deletion/two-for-one transport network at rank `p*`, with the favorable-leaf selector `F_{p*}(T)` derived on
> the tree, carries an integral flow saturating every source within every capacity — (HALL) holds at `(T, p*)`.

It is the first infinite family in the programme's record whose (HALL) certificate uses switch arcs, and they are load-bearing:
the root-plus-arm sector's supply/deletion-capacity ratio `R_K/R_{K−1} = p*/(p* − 1) > 1` (SEMANTIC-CONTRACT §2) means deletion arcs
alone cannot serve it. The proof is Darroch- and Newton-free, uses no asymptotic step, no `M_0`, no census, and neither the `θ*` law
nor LP optimality (the allocation is used as a table, not as an optimum).

**The eight formal awards and what each contributes** (all at their exact scopes, class `m ≥ 107`, `m ≡ 2 (mod 3)`, rank `p*`):

| Award | Terminal | Contribution to the terminal |
|---|---|---|
| C1-LA1 | `cb8_topRank_sectorTemplate_feasible` | (L-S)_top at template level: the closed-form allocation `pb(β,γ)`, `pc(β,γ)` (72 intercepts), `σ(γ) = c_γ θ`, `θ = 288/(200m² + 82m + 5)`; (i) nonnegativity, (ii) `Σ_i Out ≥ 1` over every assignment of choke states with leg total `K = p* − 1`, (iii) `Σ_i In ≤ 1` at `K − 1`, (iv) Switch `(8 − γ)σ(γ) ≤ θγ`, (v) Residual `θ ≤ 1 − ρ_1`. The sector half's arithmetic. |
| C1-LA2 | `cb8_topRank_of_descent_and_flow` | The CB(8, m) definition layer under the frozen labelling; `cbGraph m` is a tree, `α = 9m + 1`, `leafSet` and its card, the witness sets `W_v = {r}`, `W_{c_ij} = {u_i}`, the low window; the reduction of the §2 terminal to conjuncts 2 and 4 (as hypotheses). Carries r30's network definitions and `crossingIndex`. |
| C1-LA3 | `cb8_block_descent_topRank` | The two-binomial block descent for `5 ≤ j ≤ m` (the (ELIG-top)(a) blocks) with the descent tool (G), coefficient positivity `twoBinomCoeff_pos`, and the companion `cb8_E1_conditionI_topRank` (E1 condition (i) at `p*`, Darroch-free). |
| C2-LA1 | `cb8_topRank_parentDescent_and_conjuncts_1_2_3` | (E) on the literal tree: `i_{p*−1}(T) < i_{p*−2}(T)` via the block decomposition and the kernel-checked degree-50 `S_5` positivity certificate, hence `crossingIndex + 2 ≤ p*`; conjuncts 1–3. Its face companion `AdjU.cb8_topRank_of_flow` derives the whole terminal from conjunct 4. |
| C2-LA2 | `cb8_leafDeletion_closedForms_descent_topRank` | The closed forms `I(T − v)`, `I(T − c)` over ℤ[X] descend from `p*` to `p* + 1` — favorability of both leaf classes at closed-form level, Darroch/Newton-free. |
| C2-LA3 | `cb8_favorableLeaves_eq_leafSet_topRank` | `favorableLeaves (cbGraph m) p* = leafSet (cbGraph m)`: every leaf favorable on the literal tree; the derived selector is the full leaf set. Discharges the selector inside the terminal. |
| C3-LA1 | `cb8_E1_cloneTransport_topRank` | The clone-level E1 transport at `p*` for every `q ∈ [1, m]`: the type sums `e1S`, `e1G`, `e1H`, rows and columns exact, nonnegativity, `ρ_q < 1`, and `ρ_1` in C1-LA1's residual syntax. The E1 half's algebra. |
| C4-LA1 | `cb8_topRank_eligible_and_weightedHall` | The terminal. New in-file: the literal E1 arc function `cb8E1Arc` with its unconditional spec on `cbGraph m` (N1 up-cover counts B1–B3, N2 five clauses); the frozen sector flow `cb8GSec` with its Out/In bridges, zero classes and switch-image inflow `(8 − γ)σ(γ)` (N3–N5); the exact weight formula `w(B) = [r, v ∈ B] + Σ_i [u_i ∈ B] γ_i(B)` (N6); the composition `g = cb8E1Arc + cb8GSec` into the Out-≥/In-≤ bundle (N7); bundle ⇒ `WeightedHall` ⇒ integral flow (N8, with r30's Hall ⇒ flow). |

**Dependency graph from the awards to the terminal** (as the informal proof §3 states it and the fidelity reviewer confirmed it; the
kernel term of the terminal is the stitch `AdjU.cb8_topRank_of_flow ∘ cb8_conjunct4_of_flowBundle ∘ cb8_flowBundle_of_arcSpecs`
applied to the seven N-node conclusions):

```
C1-LA2 (CB layer; r30 network defs; crossingIndex) ──┬──> C2-LA1 (E) ──> AdjU.cb8_topRank_of_flow ──┐
C1-LA3 (block descent; E1 (i) at p*; positivity) ────┤                                              │
C2-LA2 (closed-form favorability) ──> C2-LA3 (F = leafSet) ───────────────────┐                     │
C3-LA1 (clone E1 algebra) ──> in-file E1 layer ──> N1 (B1,B2,B3) ──> N2 (E1 spec) ─┤                     │
C1-LA1 (template (i)–(v)) ──> cb8GSec ──> N3 (Out ≥ 1), N4 (In ≤ 1, zero classes), N5 (switch images) ─┤    │
N6 (weight formula) ──────────────────────────────────────────────────────────┴──> N7 (bundle) ──> N8 ──┴──> TERMINAL
r30 C1-LA2 0030/0031 (HALL ⇒ FLOW) ──────────────────────────────────────────────────────────────> N8
```

Every arrow is a kernel-checked declaration inside the single C4-LA1 source; the award boundaries are provenance.

**Residual lemmas that stay OPEN in the programme, and which of them this run makes more tractable.**

- **Full (HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, **the primary aggregate**, governed beta, TREE, FOREST, TRANSFER and
  Erdős #993: OPEN, unchanged, by fence 1; nothing here bears on arbitrary trees. This run does not make them more tractable in any
  direct sense; it shows the switch mechanism can be carried uniformly on one family, which is the charter's stated purpose.
- **Other ranks of CB(8, m) on the class.** *Below `p*`* (the switch-necessary ranks from `x + 2` to `p* − 1`; the r30 record's 208
  uncertified switch-necessary rows live largely here): E1's condition (i) holds iff `p ≥ ⌈μ_1⌉ + 2 = p*` (the threshold key), so the
  mark-clone deletion flow for the non-sector sources FAILS below `p*` — a different non-sector mechanism is needed; this run does not
  make it easier except by supplying the literal-network infrastructure. *Above `p*`*: the sector is no longer deletion-deficient
  (`R_K/R_{K−1} < 1` for `p > p*`), so a deletion-only certificate is plausible; what is missing is favorability of every leaf at
  `p > p*` (C2-LA2's descent is at `p*` only) and E1 condition (i) at the new index (informally true for all `p ≥ p*` by the threshold
  key; formally only at `p*` via C1-LA3). Both are coefficient lemmas of the C1-LA3/C2-LA2 type — **the smallest open lemmas that
  this run makes directly tractable** (same closed forms, same descent tool (G), same Lean vocabulary).
- **The other residue classes at the floor rank `⌊(16m + 4)/3⌋`.** `m ≡ 0 (mod 3)`: the favorability key applies (`dm = 8m ≡ 0 ≢ 2`),
  (ELIG-top)(a) holds on the bounded record, but the C1-LA1 table is the wrong allocation there — the informal auditor exhibited both
  template ends failing at `m = 108, 111` (min `Σ Out < 1`, max `Σ In > 1`); a new closed-form table is the object. `m ≡ 1 (mod 3)`:
  `dm ≡ 2 (mod 3)`, the favorability key does not apply and (ELIG-top)(a) has exceptions in `{106, …, 133}`; the selector itself must be
  re-derived. This run makes the residue-0 sibling much more tractable (the whole formal chain except C1-LA1's table and the
  `S_5`-type certificate is reusable with the residue as a parameter); the residue-1 class is a different problem.
- **`d ≠ 8`, heterogeneous CB patterns.** The definition layer, E1 layer, choke-state layer and composition theorem are written for
  `d = 8` (`Fin 8` legs, `State8`); a `d`-parametric rewrite is engineering, not mathematics, but the per-state table is `d`-specific.
- **The `θ*` law and LP optimality**: `conjecture`, untouched; the zero-slack finding (SR-C4-6) says the C1-LA1 table is rigid at both
  ends (only `λ = 1` rescales it), which constrains but does not settle the law.
- **Sharpness of 107**: not claimed anywhere. The informal auditor found every recomputed ingredient true at every class row from
  `m = 86` on and `x + 2 ≤ p*` failing at every class row up to 83; the cutoff 107 is the charter's class boundary and the `S_5`
  certificate's design point. Rows 95–107 (residue 2) are r30's computer-assisted row key; rows 86, 89, 92 are uncertified.

## Process quality

**Errata R31-E-a..i** (nine, all controller-side text, tooling or checking; none touched a registered result or a sealed member):
a (cloned tool's message templates named r30's digest path), b (synthesis dispatch asked for "6 routes"), c (a second-read brief's
gap identity off by 2), d (the allocation swapped `G`'s factors — relayed mid-route), e (reviewer-brief carry text hard-coded to Cycle
1), f (a brief header inherited from another read's template), g (gate text misstated the plateau rule as one cycle), h (a mid-attempt
relay reopened the C3-LA1 formalizer after its first return), i (a node-closure check confirmed statement identity but not that the
proof lived in the frozen file — the critic C-T2-U found T2's proofs on a local copy and bound them). Each was caught inside the
run's own controls (residue check, critics, second reads, adjudicators) and corrected by record. Pattern: retyping and template
cloning (a–f) dominate, as the C3 checkpoint said; g–i are stage-discipline lapses whose lessons are written into the notes.

**Controller notes R31-N-1..32**: complete and current through the decisive event; the terminal-checkpoint snapshot ends at R31-N-32.
The controller facts (CF-REPLAY-c1a, the build-cache fact) are labelled "never evidence" and were used as such.

**Host interruptions.** Three in Cycle 4 Stage 3 (about 08:55; 10:02–22:46; 23:25–00:01), each resumed from saved transcripts with
identical resume notes; one seat (U3) had backgrounded its build and stopped with an unconfirmed claim, corrected by the resume rule
"rerun builds in the foreground"; the cold-rebuild stall was diagnosed (no `Main.olean`) and cured by a controller-built cache with
byte-identity checks (R31-N-26, amending ruling 25). No sealed member was affected; the returns were admitted under the unchanged
Stage 2 seal. The synthesis and the F adjudicator confirmed no mathematical consequence. The cost was roughly fifteen hours of wall
clock. Process record `R31-C4-PROCESS-HOST-INTERRUPTIONS` is on the ledger.

**The Cycle 4 method change: frozen leaf statements.** Adopted from the C3 checkpoint (R31-N-23): a controller-staff drafter froze the
Lean text of every conjunct-4 leaf (20 theorems + `cb8GSec`) on a built base before Stage 2, checked by an exact Python transcription
(five mutants caught); routes and critics engineered proofs of fixed texts; a proof of a different statement discharged nothing
(ruling 23). Effect, measured against the record: Cycle 3 closed one governed award (clone-level algebra, no literal arc); Cycle 4
closed all twenty frozen declarations in scratch across two adjudicator merges and the terminal as one award — the decisive event, two
cycles ahead of the C3 forecast's "by Cycle 6 with one cycle of slack". The frozen texts also made Stage 7 integration mechanical
(the formalizer's report and the fidelity review list only renames and de-duplications) and made the fidelity check of the terminal
almost trivially strong (statement hash equality across contract, synthesis, brief and source). This is the run's most valuable
process lesson: **give routes exact statements to engineer; reserve discovery for critics.**

**Seat-versus-critic yield.** On the frozen text, seats closed the N1 companion (T1, U1 independently), N3 (T2, via the critics'
binding), N4 `zero_classes` (T3, via binding), the N2 companion (U1), N6 and the N7 companion (U2), N8 (U3). Critics closed N1 B1/B2/B3
(C-T1-F, C-T1-U; B3 also C-U1-F), N2 main (C-U1-F), N4 `in_eq`/`in_le_one` (C-T3-U), N5 (C-T3-F, C-T3-U), N7 main (C-U2-F, C-U2-T) —
that is, every node on the critical path. The route F2 failed its mandatory object outright (circular Hall sums; the neighbourhood
capacity written in, not computed; struck by both critics and the F adjudicator), and the salvage — the arc-by-arc bounded check at
158/161/164 — is critic C-F2-T's. Across Cycles 2–4 the pattern is stable: Opus 5.5 critics at medium effort produced the decisive
compiled Lean; Sonnet 5 routes produced genuine nodes when handed exact statements and produced the run's alias results, refuted
statement and invented digest when asked to find the statement. The paired cross-orientation critics remain the load-bearing control
(every seat error in four cycles was caught by at least one critic, most by both).

**Controls that worked at the terminal.** The governed Stage 7 panel with three distinct seats; receipt-bound carries with the
keyword-rekey rule (R31-N-15/16) and an independent carry audit recomputed from origin Snippets; the reserved-name rule (R31-N-22) —
the name was never frozen on a conditional statement and occurs once, on the terminal; the statement-hash equality across four
records; the six concurrent isolated second reads (attribution and informal grades never rested on the kernel alone); the
weakest-input grade rule applied consistently (C1's `computer_assisted`, C2's `proved_informal`, C4's `formally_verified`); the
no-status-transfer notes written before publication; the concurrent-master freeze and re-screen at every close (494, 510, 515); the
admission controls adopted from the C3 checkpoint (five format-only exceptions, one rejected critique, digest literals checked). No
sealed member was edited in four cycles; every correction is a record.

**What did not work, or is still missing.** (1) Rule 7 ((WID) from independent sides) was again skipped by a route (F2) — enforcement
at admission worked only partly (the `## Instrument sides` section existed but its content was circular; the F adjudicator, not
admission, caught it). (2) A seat's "compiled" claim without the build in the frozen file (R31-E-i) — the check is now stated. (3) The
session effort is recorded from the Cycle 4 gate only; Cycles 1–3 remain unauditable on effort. (4) Nine process-listing breaches in
Cycles 1–3; Cycle 4 reports none in the Stage 7 and second-read records I read, so the `pid-check`/literal-PID rule took. (5) The
seven "unverified CHECKPOINT-ANALYSIS-C3.md quotations" and twenty drafter-scratch literals the F adjudicator listed as residual
items were assigned a controller-staff record check by the synthesis; I found no record of that check in the capsule (the
`R31-C4-RECORD-CORRECTIONS` row lists other corrections). Not blocking; a terminal-review item. (6) The frozen-text method depends
on a drafter seat outside the graded topology; its brief and mutation check are recorded, but a wrong frozen statement would have
cost a cycle. Ruling 23's "report a false frozen statement with a kernel-checked counterexample" is the right safeguard and was
never needed.

**What a successor should keep or change.** Keep: 9/18/3/1 with paired cross-orientation critics; frozen, tool-digested leaf
statements before Stage 2 for every formal node; dual ownership of the critical node; receipt-bound byte-identical carries with the
rekey rule; the reserved terminal name; concurrent isolated second reads at Stage 7; the concurrent-master freeze at every close;
the restricted boot as the first line of every dispatch; controller facts as priors never evidence. Change: record the session
effort at every gate from Cycle 1; generate allocations and briefs from one machine-readable gate file with a closed-form copy
check (the retyping errata); require a foreground build log for any "compiled" claim in the frozen file, not a copy; make the (WID)
field's two instruments and two sides a structured admission field with a mechanical check that the capacity side is computed from
the relation; consider seating Opus on the critical-path U routes if Ashton allows (the C3 question, still open); freeze result
sources before sealing close packets (R31-N-18).

## Risk register

| # | Risk | Evidence | Likelihood | Check that settles it |
|---|---|---|---|---|
| R-1 | **A definition-fidelity gap** between the Lean objects and SEMANTIC-CONTRACT §1–2 (weight, relation, selector, first descent, the CB labelling) | My clause-by-clause reading above; the fidelity review's independent semantic pass (80/0/0); C-F1-U's compiled `rfl` equalities with r30's Snippets; byte-identical carries | Very low | Done here and in two independent reviews; the public face should quote the four definitions and the terminal statement verbatim so a reader can check them against the contract |
| R-2 | **A carried fragment's provenance** (an r30 fragment differing from its origin; a rekeyed terminal not reversible) | 622 byte-identical + 5 rekeyed carries, each re-verified from origin Snippets by the fidelity reviewer and the informal auditor; my check of the five rekeyed terminals; every origin `Main.lean` equals its own verified receipt; r30 network definitions differ from r30 C1-LA2's only in the recorded classical-scope wrapper | Very low — and immaterial to soundness, since every fragment is re-kernel-checked inside C4-LA1 | The carry table (`CAPSULE-VERIFICATION.json`, `carry.rows`) published beside the award; the `pp.all` term-identity log for the scope-wrapper difference kept in the run's `DRAFTS/` |
| R-3 | **An overstated public sentence**: "Hall certificate for CB(8,m)" read as every eligible rank; "switch-using" read as a claim about necessity in general; the family theorem read as progress on the aggregate or on #993; "first" read beyond the programme's record | Fence 1 and the no-transfer notes exist; the CYCLE-CLOSE sentence "the first infinite switch-using (HALL) family theorem in the programme" is supported by the charter's own statement that existing infinite Hall awards use deletion flows | Low–medium (the one risk that is about words, and words travel) | Publish the headline sentence below with its fences in the same sentence; say "in this programme's record" for "first"; say "load-bearing at `p*`" for the switch arcs, not "necessary" |
| R-4 | **Concurrent-master collision** on rebase: a key-name collision, or an overwrite of a concurrently changed baseline record | 0 name collisions against master-515; 24 concurrent keys are all path-star/finite-block; ONE shared key changed status concurrently (`…SELECTED-LOWER-MARK-MASS-COMPENSATION` OPEN → VERIFIED in the master) | Name collision: very low. Overwrite regression: low–medium if the rebase copies run-local records over the master | Rebase by key: take the master's current record for all baseline keys; add the six r31 keys; append the `[r31 C4; …]` notes to the three touched keys; then diff every shared key's status before/after (expect 0 changes) and re-run lint on the merged master. Re-freeze the master immediately before the rebase and re-run the screen |
| R-5 | **Stale sentences in the Tier 1 key record** read in isolation ("No formal award."; "not formally verified"; "Not decisive") | Present in the `certificate` and `scope` fields as Cycle 1–2 text; superseded in place by the C4 sentences at the fields' ends | Low for the registry (append-only by design); medium for a public rendering that prints fields whole | The public status map and the master's rendered face lead with `formally_verified (C4-LA1)` and cite the C4 note first; the reconciliation adds a one-line "current status" sentence at the head of the public entry |
| R-6 | **Obligations ledger rows still open** (`R31-OBL-TIER1`, `R31-OBL-LS-TOP`) | The Cycle 4 close snapshot | Certain (a hygiene fact, not a mathematical risk) | Close both at the terminal close, naming the discharging award(s) |
| R-7 | **Elaboration budgets in carried fragments** (`maxHeartbeats 0` ×21 in C2-LA1's text, `maxRecDepth 20000`, 442 `set_option` lines in all) and cold-rebuild cost (minutes; the Cycle 4 stall) | Kernel soundness is unaffected (options bound elaboration, not the kernel); the fidelity reviewer counted them; reproducibility is a matter of build time | Very low for soundness; low for reproducibility | Publish the options census and a measured cold-build time with the pinned toolchain; keep the build cache out of the published artefact (only the source, receipts and toolchain pins travel) |
| R-8 | **Effort provenance**: chartered "high" seats ran at an unrecorded session effort in Cycles 1–3 | AUTHORIZATION §3 discloses the platform limit; RUN-STATE records `high` from the C4 gate | Medium for the audit trail; nil for any kernel-checked result | Disclose in the terminal review; decide with Ashton whether to record Cycles 1–3 retroactively from host logs |
| R-9 | **A record discrepancy propagating** (the formalizer report's pasted receipt id as a manifest digest; the base-entry numbers 579/580 for registrar entries 0546/0547) | Both are corrected by records and explained above | Nil | The public face cites registrar entries and the corrected digest |
| R-10 | **The sign consequence claimed on the award's face** (`S(T_m, p*) ≤ 0`) | It is not composed in Lean and not on the face; the aggregate key's note says it follows by composition with r30's FLOW ⇒ SIGN award and transfers no status | Nil if the public sentence keeps the "by composition" wording | Keep the wording; if a successor wants the sign in Lean, compose it as a companion under receipt |
| R-11 | **Non-vacuity or a trivialising convention** | `m = 107` satisfies both hypotheses; sector members have weight exactly 1; `x / 0 = 0` lives only in the in-file `cb8E1Val` and never in the statement | Nil | Checked here and by the fidelity reviewer (`f7c0a0cee1777a37`) |
| R-12 | **The threshold 107 read as sharp** | The record never claims it; the audit shows ingredients true from `m = 86` | Low (a reader's inference) | The public sentence says "for every `m ≥ 107`", nothing about smaller `m`; the successor note may name rows 86–104 as uncertified |

Nothing in the sealed record threatens the registered grade of any key. The risks that matter at publication are the words of the
headline (R-3), the mechanics of the rebase (R-4) and the rendering of an append-only record (R-5).

## Recommendation

**Publish.** Reasons: (i) decisive event (a) occurred as the contract defines it — the §2 terminal is kernel-verified at full scope
with the standard axioms, an independent informal audit and an independent fidelity review, and my own clause-by-clause reading finds
no shortfall; (ii) the registry is faithful — one key re-graded in place, no new key, no status transfer, every fence on the face; (iii)
the six isolated second reads are concordant with no rejection, and every critic-derived proof has its attribution on the face; (iv)
publication is pre-authorized (AUTHORIZATION §2, the charter's closing instruction) as an additive reconciliation onto the current
master with the global conjecture OPEN; (v) the only reconciliation hazard (R-4) is mechanical and is settled by rebasing per key onto
the master's current records. There is no reason to hold: no open second read, no unresolved finding, no cut candidate, no contested
grade.

**The public headline sentence I recommend** (its fences inside the sentence, not in a footnote):

> For every integer `m ≥ 107` with `m ≡ 2 (mod 3)`, the rank `p* = (16m + 4)/3` of the tree `CB(8, m)` is eligible under the actual
> first-descent definition, and the literal active-tag weighted deletion/two-for-one transport network at `p*`, with the favorable-leaf
> selector derived on the tree, satisfies the weighted Hall condition — a family theorem formally verified in Lean 4 (Mathlib pinned;
> axioms `propext`, `Classical.choice`, `Quot.sound`) as award C4-LA1 of run r31, at one rank per tree, on this one family only, and the
> first infinite Hall family in this programme's record whose certificate carries load-bearing switch arcs; full (HALL), the aggregate
> keys, TREE, FOREST, TRANSFER and Erdős #993 remain OPEN.

Optional second sentence, if the sign consequence is wanted: "By composition with r30's formally verified FLOW ⇒ SIGN award,
`S(CB(8, m), p*) ≤ 0` on these rows only; no status transfers to any aggregate."

**The successor programme.**

1. **The smallest open lemma this run makes tractable** — a coefficient pair at rank `p* + 1` on the class: (a) every leaf of
   `CB(8, m)` is favorable at `p* + 1` (the closed forms `I(T − v)`, `I(T − c)` descend from `p* + 1` to `p* + 2`; the C2-LA2 method
   with the descent tool (G) at the shifted index), and (b) E1 condition (i) at `p* + 1` for every `q` (informally true for all
   `p ≥ p*` by the threshold key; the C1-LA3 method at the shifted index). With those two, the sector at `p* + 1` is served by a
   uniform deletion spread (`R_K/R_{K−1} = (16m − 2)/(16m + 4) < 1`, so a `1/K`-per-leg allocation has in-sector inflow `< 1`) and the
   existing E1 layer and N6–N8 close a deletion-only (HALL) theorem at `p* + 1` on the class. Small, formal-ready, but it does not
   exercise the switch mechanism.
2. **The recommended successor object (switch-using, same mechanism, new table): the residue-0 sibling.** `CB(8, m)`, `m ≡ 0 (mod 3)`,
   at the floor rank `⌊(16m + 4)/3⌋ = (16m + 3)/3`. Everything except two pieces is reusable with the residue as a parameter: the CB
   layer, `crossingIndex`, the E1 layer and N1/N2 (rank-generic in their proofs), N6, N7's composition shape, N8 and the Hall ⇒ flow
   carry, favorability via the r30 key's `dm ≢ 2 (mod 3)` clause (a C2-LA2-type descent at the new rank), and eligibility via a new
   `S`-type certificate (C2-LA1's method). The two new pieces: (i) a closed-form per-state sector allocation `(pb, pc, σ, θ)` for the
   residue-0 leg totals — the exact analogue of C1-LA1 and the smallest genuinely new mathematical object (the C1-LA1 table fails
   both ends off-residue; r30's instruments can be run at the residue-0 rows first, fresh rows named at the gate); (ii) the frozen
   N3/N4/N5 bridges re-proved against the new table (engineering). Fences as here: one rank per tree; `d = 8`; the residue-0 class
   only; the residue-1 class is a different problem (favorability key inapplicable, (ELIG-top)(a) exceptions at small `m`).
3. **Harder, named for the record, not recommended next:** all switch-necessary ranks below `p*` (E1 condition (i) fails there; a
   new non-sector mechanism is required); `d`-uniform CB at the top sector-deficient rank (a `d`-parametric rewrite plus a
   `d`-indexed table); the arbitrary-tree aggregate (out of reach of this method).
4. **Do not** promote the family theorem to every eligible rank, to other residues, or to `d ≠ 8` in any public text; do not use the
   `θ*` law as a hypothesis anywhere (it stays a conjecture; SR-C4-6's rigidity note is the state of knowledge).

**What the controller should ask Ashton.**
- Confirmation of the headline sentence's wording (pre-authorized publication; the words are the one thing not fixed by a receipt).
- Which successor to charter: the residue-0 switch-using sibling (recommended), the `p* + 1` deletion-only lemma pair (smallest), or both
  in one run with the lemma pair as a warm-up cycle.
- The standing C3 question: whether Claude Opus 5.5 may be seated on the critical-path U routes in a successor, given that the decisive
  compiled Lean of Cycles 2–4 came from Opus critics.
- Whether to record the numeric session effort for Cycles 1–3 retroactively from the host's logs (R-8).
- Whether the public face should render the Tier 1 key with a leading "current status" sentence ahead of its append-only history (R-5).
- Whether the residue-2 rows `m = 86, 89, 92` (below the class, where the audit's ingredients hold) are worth three finite certificates
  at `computer_assisted` in the successor, or left named as uncertified (R-12).

## Artifact inventory

Scratch root `scratchpad/terminal-checkpoint/` (Python standard library only, `python3 -B`, exact integers, foreground; script text
was inline and is not preserved beyond these outputs):

| Path (run-root relative) | SHA-256 | Role |
|---|---|---|
| `scratchpad/terminal-checkpoint/manifest-paths.txt` | `7e5a9d7d2bd3eb395652d2364859c98803917d63f0d5e36821e87419c994df27` | the 307 capsule members with byte counts, as listed |
| `scratchpad/terminal-checkpoint/seal-and-members.txt` | `22db6cb1c3778f4e23b613d62f015c76b37c37c910ad0ef01db81949b6dca08e` | seal recomputation and the 307-member byte/SHA-256 check (0 missing, 0 mismatched) |
| `scratchpad/terminal-checkpoint/registry-screen.txt` | `91849d6d3e580dc5291f43fa4fa8b9f3a95038821cd8a40f74e2b9b354527385` | run-local 497 versus master-515: the six r31 keys and grades, the 24 concurrent keys, 0 collisions, the one shared-key status change |
| `scratchpad/terminal-checkpoint/lean-checks.txt` | `d065071d1aa5bd2f27075de4727e8f939d1fe077b84992eb6b19a73ddbca28a0` | `Main.lean` digest, the terminal statement and its digest, the single `theorem` line, the 20 frozen headers each once as `lemma` |
| `control/CHECKPOINT-ANALYSIS-TERMINAL.md` | this file (digest computed by tool after close and reported in the final message) | the deliverable |

Commands not preserved as files: the `shasum -a 256` of the brief, the manifest and the C4-LA1 run files; the receipt/report/fidelity
parse of the eight awards; the extraction of the definitions of record and the five rekeyed terminals from `Main.lean`; the
second-read hash cross-check against `C4-SECOND-READ-AGENTS.json`; the runtime-id census over agents records and seat outputs; the
`sorry`-context listing; the Tier 1 key field dump; the distinctions and obligations reads; the `grep` skims of the second reads,
the F adjudication and the formalizer report. Each is reproducible from the named capsule members with the standard tools.

No `lake`/`lean` was run. No background job was started. No child agent was used. I reread this file before close.

chartered fable/high; transport-resolved model fable (explicit parameter); runtime-reported model id: claude-fable-5-1
