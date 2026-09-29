# Critique

Critic `C-U3-F`, Cycle 3 Stage 4 of r31 (Erdős #993, CB(8,m) at `p* = (16m+4)/3`): orientation F (falsify), assigned to seat U3,
route `C3-U-03`, mechanism token `FORMAL-CB8-TERMINAL-INTEGRATION`, orientation U (formal / structural).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch `control/dispatch/c3-stage4/DISPATCH-C-U3-F.md`
(SHA-256 `ba59417a5b82a666bfed5bad1ca91874dd6a2dd563d1af186f35de15293c2cab`, recomputed: match). The host also injected the project
`CLAUDE.md` and the user memory index into my context before the first tool call. I did not open or act on either, and I loaded no other
VerityOS subsystem, skill, memory or log file.

## Identity and seal audit

- **Capsule seal** (`control/c3-critic-capsules/U3-PACKET-MANIFEST.json`), recomputed over the canonical JSON without `seal_sha256`
  (sort_keys, `(",",":")`, no trailing newline): `416beba2d380b52df2c8ec4d349daeacd3467fc82c33962ebd061409d220c5c7`. Matches the
  dispatch. All 14 listed files match their recorded bytes and SHA-256.
- **Stage 4 dispatch manifest** seal `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05`: recomputed, match.
- **Stage 3 packet manifest** seal `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`: recomputed, match. The manifest binds
  `cycles/cycle-3/stage3/returns/U3/RETURN.md` at `726ed6f856d8659a57cb861f55d632f0a66b6c7cd0d806842c5103501360fbd3`, which equals the file on
  disk.
- **Stage 2 seal** `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`: recomputed, match.
- **The return's digests.** Merged `Main.lean` `88ccaaa4…6a25`: reproduced three times (my copy-out; my rebuild input; my generator replay).
  I did not re-hash the return's other control-file digests (`AUTHORIZATION.md`, `OBLIGATIONS.csv`, the run-local registry and others).
  They lie outside my capsule, so I leave them unaudited and do not certify them.
- **Origin binding (gate ruling 19).** Each of the six origin runs' `LeanProject/LeanProof/Main.lean` SHA-256 appears in that run's
  `RECEIPTS/kernel-verification.json`, `formalization.json` and `fidelity-audit.json`. Each run's `VERIFICATION-REPORT.json` reads
  `status: formally_verified`. The group digests `sources/c1-results/SOURCE-DIGESTS.json` (138/138) and `sources/c2-results/SOURCE-DIGESTS.json`
  (677/677) match the frozen `runs/` files.
- **Stage 3 disclosures record** for U3: one pre-dispatch read of `skills/optimization-loop/skill.md`, one script written and deleted under
  the host scratchpad, and one `ps aux | grep`. These match the return's own disclosure section.
- **Claim identity.** Registry keys touched are the ones the return names. It proposes two `E993-R31-` candidates. Neither appears lexically
  in `sources/authority/CLAIM-IDENTITY.json` or `sources/concurrent/master-510-2026-09-28/CLAIM-IDENTITY.json`: neither holds any `E993-R31-`
  key. The run-local registry is outside my capsule and I did not read it. For the mathematical alias check, see Attacks F1 and F2.

## Independent re-derivation

I built three independent instruments. None of them uses the seat's scripts or `merged_blocks.json`.

1. **Carry audit** (`instr/carry_audit.py`).
   - Side A: the six origin `Main.lean` files (receipt-bound), split on their own `VERITYOS ENTRY` markers, which carry per-entry SHA-256.
   - Side B: each run's `Snippets/` directory, listed directly rather than through the `FORMALIZATION-STATE.json` paths.
   - Side C: the merged file under audit.
   - Result: 799 fragments equal 799 marker occurrences. Every marker SHA equals SHA(fragment), and every `Main.lean` block equals its
     fragment. There are 606 distinct names, and exactly 3 names have byte-different origin copies:
     - `cb8_topRank_of_descent_and_flow`: C1-LA2 #78 vs C2-LA1 #105.
     - `cb8_block_descent_topRank`: C1-LA3 #21 vs C2-LA1 #57.
     - `cb8_leafDeletion_closedForms_descent_topRank`: C2-LA2 #28 vs C2-LA3 #60.
   - Each pair is equal modulo the single `theorem` → `lemma` keyword.
   - The merged file has 608 entries. Of these, 603 carried entries are byte-identical to an origin fragment. The 3 remaining carries
     (`cb8_topRank_sectorTemplate_feasible`, `cb8_topRank_parentDescent_and_conjuncts_1_2_3`, `cb8_favorableLeaves_eq_leafSet_topRank`)
     differ only by one `theorem` → `lemma` edit on an origin terminal.
   - No origin name is missing, no name is duplicated, no carried entry keeps a line-initial `theorem`, and there are 2 new entries (607, 608).
   - Token scan: the 2 `sorry` hits are in doc comments (lines 3011, 3060). `admit`, `native_decide`, `axiom`, `decide`, `implemented_by`,
     `extern` and `opaque` do not occur.
   - **Carries: 0 mismatches, confirmed on the full set, not a sample.**
2. **Rebuild, copy-out-first.** I rebuilt in `scratchpad/c3-crit-U3-F/rebuild/`.
   - The shell files are byte-equal to C1-LA2's.
   - Packages are bound by manual symlink to the shared project, and I confirmed the Mathlib revision
     `905b95818eb32af7874a58b427f50c1711a5e96c`.
   - I ran `cd` into the project and then `lake build LeanProof`, with no `lake update` or `lake clean` (PID 99656).
   - Result: `Build completed successfully (8657 jobs)`, with the same 8 linter warnings at the same lines (2991, 5372, 5415, 5443×5, 12572).
     All are in carried content, not in entries 607/608 (lines 13202–13303).
3. **Axioms and critic file** (`rebuild/LeanProof/Critic.lean`, via `lake env lean`, PID 10788, exit 0). `#print axioms` returns
   `[propext, Classical.choice, Quot.sound]` for:
   - U3's entries 607 and 608;
   - the carried `AdjU.cb8_topRank_of_flow`, `cb8_topRank_parentDescent_and_conjuncts_1_2_3`, `cb8_topRank_of_descent_and_flow`,
     `cb8_favorableLeaves_eq_leafSet_topRank` and `cb8_topRank_sectorTemplate_feasible`;
   - the r30 carry `exists_saturatingFlow_of_weightedHall`;
   - my four critic theorems.

   The seat's `axioms.log` is backed by this replay. Its `CheckAxioms.lean` is not in the inventoried scratch directory, so without my replay
   that log would be self-report only.
4. **Semantic check of entry 608** (`instr/zero_weight_check.py`, standard library).
   - I built CB(8,m) from the SEMANTIC-CONTRACT §2 prose for m ∈ {1,2,3,5}.
   - Checked: the Lean `cbEdge` labelling of record is exactly that adjacency; `leafSet` equals `{v} ∪ C`.
   - I computed `w_F(B)` from §1 (original support; witness set `N(s_v)∖{v}`) for 160,000 random finsets `B`, with independence not required.
   - Result: 0 mismatches against 608's right-hand side. There were also 0 mismatches against the full weight formula
     `w(B) = [v,r ∈ B] + Σ_i [u_i ∈ B]·#{j : c_ij ∈ B}` (see Remaining obligation).
5. **Generator replay, copy-out-first** (`genreplay/`). The seat's scripts, with only their hard-coded output paths repointed to my scratch,
   reproduce `merged_blocks.json` byte-for-byte and `Main.lean` at `88ccaaa4…6a25`.

## Attacks and findings

**F1 (principal): the NEW terminal-integration theorem is an alias of a declaration already carried in the seat's own project.**
- C2-LA1's governed run already contains, as entry 547, the lemma `E993Transport.AdjU.cb8_topRank_of_flow`. It sits in U3's merged file as
  entry 580, lines 12244–12264.
- Its origin comment reads: "face companion (ungraded): the SOLUTION-CONTRACT §2 terminal from conjunct 4 alone, via carried C1-LA2 entry 78".
  Its docstring reads: "The terminal of SOLUTION-CONTRACT §2 reduced to conjunct 4 alone."
- Its type is the type of U3's entry 607. The only differences are the binder name (`hres` vs `hmod`) and the lemma it uses to discharge
  conjunct 2: `AdjU.cb8_crossingIndex_add_two_le`, versus `.2.2.1` of the C2-LA1 terminal.
- I checked this in the kernel: `example : @cb8_topRank_eligible_and_weightedHall = @AdjU.cb8_topRank_of_flow := rfl` compiles. `#check`
  prints identical types.
- So these return statements are false and are struck:
  - "down from two (`hE ∧ hH`) in C1-LA2's own terminal". The reduction to conjunct 4 alone was already done in C2-LA1.
  - "not previously stated or carried anywhere in the registry", as applied to the terminal integration.
  - the mathematical alias check "(a) … not `cb8_topRank_of_descent_and_flow` restated". It compared against the wrong prior object and
    missed entry 580.

**F2: the conditional terminal has no content beyond conjuncts 1–3.**
- Its hypothesis `hH` is literally its fourth conjunct. My `CritU3F.terminal_iff_conjunct4` (kernel-checked) shows that on the class the
  §2 terminal is equivalent to conjunct 4.
- So the predicate of proposed key 1, `E993-R31-CB8-TOPRANK-SOLUTION-CONTRACT-TERMINAL-CONDITIONAL-ON-CONJUNCT-4-ALONE`, is a one-line
  consequence of the formally verified C2-LA1 terminal (conjuncts 1–3). It is also a mathematical alias of C2-LA1's face companion.
- Under SOLUTION-CONTRACT §2 ("an award that proves only a registered identity again is not funded as progress") and §4 (a companion lemma
  on an award's face carries no certificate of its own), key 1 should not be registered as a new claim.
- I recommend treating it as an alias of the C2-LA1 face companion, or dropping it.

**F3: name and statement fidelity against SOLUTION-CONTRACT §2, verbatim.**
- The contract's `cb8_topRank_eligible_and_weightedHall` has binders `(m) (hm : 107 ≤ m) (hres : m % 3 = 2)` and NO flow hypothesis. Its
  four conjuncts match 607's conclusion exactly: I checked `IsTree`, `crossingIndex + 2 ≤ (16*m+4)/3`, `3*((16*m+4)/3) < 2*indepNum + 1`,
  and `∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) p*) p* f`. There is no ℕ-subtraction, and `107 ≤ m` is present.
- But 607 adds `hH` and occupies the contract's reserved terminal name with a conditional type.
- That is a freeze hazard. If Stage 7 or a successor keys the headline award to that name, a declaration of that name exists and compiles,
  but it is "terminal ⇐ conjunct 4", not the terminal.
- The name must stay reserved for the unconditional statement. Rename 607, for example to `cb8_topRank_of_conjunct4`, or use the existing
  `AdjU.cb8_topRank_of_flow`.

**F4: the allocated object is not met.**
- `control/C3-ALLOCATION.md` gives U3's object as "the terminal … stated with conjunct 4 reduced to the E1 hypothesis alone".
- The return reduces the terminal to conjunct 4 itself, which is vacuous (F2), not to the E1 hypothesis.
- "Could close: the terminal conditional on exactly one named hypothesis" is met only in that trivial sense.

**F5: entry 608 (zero-weight classification) survives.**
- Its statement quantifies over an arbitrary `B`, with tag set `leafSet`, `hm : 0 < m`, and the labels of record: `v = 2`, `r = 0`,
  `u_i = 3+17i`, `c_ij = 3+17i+2+2j`.
- It follows from carried C1-LA2 entries 60 (`mem_leafSet_cbGraph_iff`), 69 and 70 (`W_v = {r}`, `W_{c_ij} = {u_i}`). It compiles and is
  axiom-clean, and my semantic check agrees with it (0/160,000 mismatches).
- I found no equivalent declaration among the 606 carried names, so it is new at scratch level.
- Limitations:
  - It is stated at `leafSet`, not at the selector of record. My `CritU3F.activeWeight_favorable_zero_iff` transports it to
    `favorableLeaves (cbGraph m) p*` on the class.
  - It classifies only zero versus positive weight. The flow routes need the exact weight (in-sector weight 1; switch image weight γ).
- No hypothesis encodes its conclusion.

**F6: the replay-isolation claim is not backed by the shipped generators.**
- `merge_lean.py` hard-codes `OUT = …/scratchpad/c3-U3`. `assemble.py` hard-codes both `OUT` and `sys.path` to `…/scratchpad/c3-U3`.
- Run as the return prescribes (`cd …/c3-U3-replay; python3 -B merge_lean.py; python3 -B assemble.py`), they would read and write the seat's
  own directory, not the replay directory, unless they were edited first.
- I did not read `c3-U3-replay/` (outside my grant), so I cannot say what was actually run there. The claim of a bit-for-bit independent
  replay is unverified by me.
- My own replay, with repointed paths, does reproduce the digest.

**F7: minor literals.**
- The merged file's header comment says "six name-collisions". The true count, per the return's step 2 and my audit, is three.
- `merge_lean.py` prints a non-empty `conflicts` list (the three name collisions). "Zero digest mismatches" is still accurate, because the
  collisions are not digest mismatches.
- The step-4 "2,419,823 bytes" is the file size. The script prints a character count (2,349,553). Both are consistent.

**Other attacks, all negative:**
- Where hypotheses enter: `hm`/`hmod` enter the C1-LA2 and C2-LA1 calls, and `hH` passes through unchanged.
- No hypothesis encodes a conclusion other than the tautological `hH` (F2).
- No `sorry`, `admit` or `native_decide`, and no enumeration stands in for a universal step.
- Gate ruling 19: 3 keyword edits, each on an origin terminal, each checked by the seat's script (`n == 1` assertion) and by my audit.
- Newton/Darroch, asymptotics, `M_0`, fresh rows (ruling 17) and the favorability index (ruling 16) are not applicable, because U3 computes
  no coefficients. C2-LA3's rank of record is carried unchanged.
- No cut is claimed and none is implied.

## Mechanism-equivalence and fence check

- One rank (`p*`), one class (`107 ≤ m`, `m % 3 = 2`, `d = 8`) in every new statement. Entry 608 and my (E) are rank-free weight facts, or
  are restricted to the class. Nothing is stated at other ranks, residues or `d`.
- No refuted mechanism is used or revived: not (G′) (ruling 20), not CHAR, not forest real-rootedness. No `θ*` law is used as a hypothesis.
  The r30 bounded record is not used as proof.
- No status transfers to `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, the primary aggregate, or any TREE/FOREST/TRANSFER key. The return
  says so itself.
- Mechanism-wise, U3's integration is the same composition as C2-LA1's face companion (F1). The token `FORMAL-CB8-TERMINAL-INTEGRATION`
  names no new mechanism.
- Carries come from frozen governed runs only (`sources/c1-results/runs/`, `sources/c2-results/runs/`). My critic file also carries r30
  C1-LA2 entries 30 and 31 byte-identically from `sources/r30/lean/…/Snippets/`, which ruling 19 and the critic protocol allow. Their digests:
  `e8c6b0d12256a6e44f3550cdd7c1eccf10d32930c3f5ccb3b4b5def291be83fe` and
  `ec521065a45bda39199f86d965ea609fb472adb341061ca5d6bb44b0d31a2ac2`.

## Certification audit

| Literal in the return | Status |
|---|---|
| "Build completed successfully (8657 jobs)", 0 errors, 8 warnings all in carried content | BACKED (rebuilt, identical warnings and lines) |
| `#print axioms` on 607, 608 = `[propext, Classical.choice, Quot.sound]` | BACKED by my replay (seat's `CheckAxioms.lean` not inventoried) |
| "sorry-free" (both new declarations) | BACKED |
| Main.lean SHA-256 `88ccaaa4…6a25`; deterministic | BACKED (three reproductions) |
| 799 occurrences / 606 distinct / 193 duplicates; zero digest mismatches; 3 benign collisions | BACKED (independent audit) |
| Mathlib pin `905b9581…` | BACKED |
| Terminal "down from two (`hE ∧ hH`)"; "not previously stated or carried anywhere in the registry" (terminal integration) | STRUCK (F1: identical to carried C2-LA1 entry 547 / merged entry 580) |
| Mathematical alias check (a)/(b)/(c) | (a) STRUCK (wrong comparison object); (b) correct; (c) correct |
| Proposed key 1 "genuinely new composition" | STRUCK (F1, F2: alias of the C2-LA1 face companion; logically a corollary of C2-LA1's formally verified conjuncts 1–3) |
| Proposed key 2 (zero-weight) new | RETAINED at scratch level (no equivalent among the 606 carried names; registry beyond the frozen masters unread by me) |
| "if funded … would be `formally_verified`" | Formally correct as to inputs. Key 1 is not fundable as progress (§2 fence). Key 2 is fundable at its exact scope |
| `TERMINAL_integration: advanced` (as the seat's own product via 607) | STRUCK for 607. See my gate line: advanced only by the critic-derived (C)/(D) below and the new entry 608 |
| Replay "reproduced bit-for-bit" in `c3-U3-replay` | UNVERIFIED (F6); my replay reproduces it |
| Header comment "six name-collisions" | STRUCK (three) |

## Verdict

verdict: retained_narrowed
headline_resolved: no

- COND4_formal: not_advanced
- E1_formal: not_advanced
- TERMINAL_integration: advanced
- cut_candidate: none

**What is retained:**
- The merged project: 606 carries byte-faithful, the build reproduced, and axiom-clean.
- Entry 608, the zero-weight classification: compiled, correct, and new at scratch level.
- Entry 607 as a correct, kernel-checked composition.

**What is narrowed:**
- Entry 607 is an alias of carried C2-LA1 entry 547 (`AdjU.cb8_topRank_of_flow`). By itself it is not an advance on terminal integration.
- Proposed key 1 is an alias or corollary and should not be registered as new.
- Entry 607 must not keep the contract's reserved terminal name for a conditional type.
- The allocated "reduced to the E1 hypothesis" object is not met.

The `TERMINAL_integration: advanced` line rests on the critic-derived advance and on entry 608, not on 607.

**Critic-derived advance (attributed to C-U3-F; scratch, compiled, no grade).** All of the following are in `rebuild/LeanProof/Critic.lean`
(SHA-256 `59423e3c…80b9`), importing U3's merged project unchanged, with axioms `[propext, Classical.choice, Quot.sound]`:
- (C) `E993Transport.CritU3F.terminal_of_leafSet_weightedHall`: for `107 ≤ m`, `m % 3 = 2`,
  `WeightedHall (cbGraph m) (C5LA1.leafSet (cbGraph m)) ((16*m+4)/3)` implies the full four-conjunct §2 terminal. It composes three pieces:
  - C2-LA3's `favorableLeaves = leafSet`;
  - r30 C1-LA2's kernel-checked (HALL⇒FLOW) `exists_saturatingFlow_of_weightedHall`, carried byte-identically;
  - entry 607.

  This terminal's single hypothesis is (HALL-COND) on the literal network at the selector-free tag set. That is exactly what summing any
  nonnegative rational flow over `X` yields, so no integrality step and no selector bridge is left to a flow route.
- (D) `…terminal_of_leafSet_flow`: the same from an integral saturating flow at tag set `leafSet`.
- (B) `…terminal_iff_conjunct4`: the §2 terminal is equivalent to conjunct 4 on the class.
- (E) `…activeWeight_favorable_zero_iff`: entry 608 at the selector of record.
- (A) The `rfl` alias witness for F1.

In prose: the mathematics of (C) is complete and formal at scratch level. The headline is untouched, because (HALL-COND) on `cbGraph m` at
`p*` remains unproved in Lean.

## Remaining obligation

1. **Conjunct 4, in any of three equivalent forms.** Any one of these closes Tier 1 formally at full scope. The applications are compiled
   and waiting: `AdjU.cb8_topRank_of_flow`, `CritU3F.terminal_of_leafSet_flow` and `CritU3F.terminal_of_leafSet_weightedHall`.
   - A term `∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) p*) p* f`;
   - or the same at `C5LA1.leafSet (cbGraph m)`;
   - or `WeightedHall (cbGraph m) (C5LA1.leafSet (cbGraph m)) p*`, each for every `m ≥ 107` with `m % 3 = 2`.
2. **The E1 reduction U3 was allocated.** The terminal stated from the E1 flow hypothesis alone, in the adapter shape, together with the
   sector certificate (C1-LA1) and the in-sector and switch-image accounting. This is still open. The composition point is (C): a rational
   flow's Hall sums suffice.
3. **Exact weight formula** (a natural strengthening of 608 that the flow routes need). The formula is
   `activeWeight (cbGraph m) (leafSet) B = [v ∈ B ∧ r ∈ B] + Σ_{i<m} [u_i ∈ B]·#{j<8 : c_ij ∈ B}`. My brute force agrees with it (0/160,000),
   but it is unproved in Lean.
4. **Governance.**
   - Rename 607 away from the reserved terminal name.
   - Do not register key 1 as new: it is an alias of the C2-LA1 face companion.
   - Register key 2 only at its exact scope (`leafSet`, arbitrary `B`, `0 < m`) after an isolated second read.
   - The critic-derived (B)–(E) are STATED here and need an isolated second read before any registration.

## Artifact inventory

All paths below are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-U3-F/`.

**Seat artifacts, copied out.** `seatcopy/`: the seat's scripts, logs, `merged_blocks.json`, the project shell and `Main.lean` (`88ccaaa4…`).
The `.lake` symlink was not copied.

**Instruments and logs:**

| File | SHA-256 |
|---|---|
| `instr/carry_audit.py` | `04dcb442a2e7059f9b8c6856a45ed6fff99de877cb1ca9c6347c4f2e2d4db164` |
| `instr/carry_audit.log` | `44b6d5d6c3f34a932161a71e91552193548df6fc3253c6ea7c568ecdbb66cc05` |
| `instr/zero_weight_check.py` | `7ec9db89ee28afed4ee756fb1838b2dee1d37335e745d40beb90d6048c173523` |
| `instr/zero_weight_check.log` | `e8cb02990896704e4a35a6f5360b28d52244cbed0763886efb239baf8242aeb0` |
| `instr/make_critic.py` | `fcf9bb49c77ed0b0b6b5edf48a2e55c9f673b30c7e2573d82be247d614aa2a9b` |
| `instr/critic_body.lean` | `adba97e83909a155068055ea91d08b9086f4ce00a0b4f91f8022cdc56f019137` |

**Rebuild project** (`rebuild/`: shell from C1-LA2, `.lake/packages` symlink to the shared pinned project):

| File | SHA-256 |
|---|---|
| `rebuild/LeanProof/Main.lean` | `88ccaaa4db42ee8fc87b4b30b0b18e78f46c63530eab24339bd59ade9b186a25` |
| `rebuild/LeanProof/Critic.lean` | `59423e3c8347af4b16f19aa5b0f9e6af4caa37b1059cec81ea928b7c8db480b9` |
| `build.log` (PID 99656) | `0e39fce374b50d79aec4729a9868107703d9933388a5fe4f2f81698fb98057bd` |
| `critic.log` (axioms and `#check`, PID 10788) | `0a71494699d264902732c56dc880a2f6a6128557aa66cd9a122455d06e658f61` |

**Generator replay** (`genreplay/`, the seat's generators with their output paths repointed): the regenerated `Main.lean` has SHA-256
`88ccaaa4…6a25`, and `merged_blocks.json` is byte-identical to the seat's.

**Processes.** Both background jobs (PIDs 99656 and 10788) ran to completion. `kill -0` confirmed both were gone before this write, and I
killed nothing.

**Read-boundary disclosures:**
- The host injected `CLAUDE.md`, the memory index and the user e-mail into context. I did not use them.
- I read the whole `C3-CRITIC-ATTACK-BRIEFS.md` heading index (`grep -n '^#'`) to locate the U3 section, and read only the preamble and the
  U3 section.
- Parsing `C3-STAGE3-READ-BOUNDARY-DISCLOSURES.json` (a capsule file) printed other seats' controller summaries to my console. I did not
  use them.
- I ran single-level `ls` on `scratchpad/c3-U3/` and its `LeanProject/`, and on `sources/` subdirectories. I ran `grep` only on named single
  files within the grant: the merged `Main.lean`, the r30 C1-LA2 `Main.lean`, and the two frozen `CLAIM-IDENTITY.json` files.
- I did not read `scratchpad/c3-U3-replay/`, any sibling return or critique, any adjudication, any other experiment root, or the network.
  I installed nothing.
