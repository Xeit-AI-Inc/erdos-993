# Critique

Critic `C-U3-T` (cross-orientation, orientation T: prove) of seat `U3`, route `C4-U-03`, mechanism token
`HALL-TO-FLOW-INTERFACE-AND-TERMINAL-STITCH` (orientation U). r31 Cycle 4 Stage 4. Date 2026-09-29.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. Restricted boot: I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then my dispatch `control/dispatch/c4-stage4/DISPATCH-C-U3-T.md`
(SHA-256 `c50fd2c18dad4f7fe21036ad0d0d1bf172840e7f61f22f4d77913d28db0a7954`, verified with `shasum -a 256` before anything else).
No other VerityOS file outside the run root was read. The host injected the repository `CLAUDE.md` and an auto-memory index into
my context unasked; I did not open either, and nothing here relies on them.

**Read-boundary disclosures.** (1) I listed and read `scratchpad/c4-U3-replay/verify_digests.py`. It is an artifact the return
inventories (lines 100 and 244), but it sits outside the literal `scratchpad/c4-U3/` path the dispatch names. I copied it out and
replayed it from my copy. (2) Following the attack brief and controller fact CF-C4-S3-1, I read and copied the controller base
cache `scratchpad/c4-base/LeanProject/{LeanProof/*.lean,.lake/build}`. (3) I ran `find` once, rooted in `sources/`, which is within
my grant, to locate r30's Snippets 0030 and 0031. There were no other searches, no network use and no installs.

## Identity and seal audit

- **Capsule seal** (`control/c4-critic-capsules/U3-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`, `sort_keys`,
  separators `(",", ":")`, no trailing newline): recomputed `1447c41d26801bd73b97ac065aaf5cb4aacf7e069e3be75c30d89b3be7c89ebf`.
  This equals the recorded value and the dispatch's value. All 16 member files match their recorded SHA-256 and byte counts.
- **Stage 4 dispatch seal** (`control/C4-STAGE4-DISPATCH-MANIFEST.json`): recomputed
  `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`, equal to the recorded value.
- **Stage 3 seal** (`control/C4-STAGE3-PACKET-MANIFEST.json`): recomputed
  `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`, equal to the recorded value.
- **Stage 2 seal** (`control/C4-STAGE2-PACKET-MANIFEST.json`): recomputed
  `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`, equal to the recorded value and the protocol's value.
  `file_count` is 6084 and `len(files)` is 6084, as the return says.
- **Return** `cycles/cycle-4/stage3/returns/U3/RETURN.md`: `9c8e8e47…d0f5828c`, 26,956 bytes, equal to the capsule and admission
  entries. Route ID `C4-U-03` and the mechanism token both appear verbatim.
- **Digests the return lists, each recomputed on disk:**
  - `control/C4-FROZEN-STATEMENTS.lean` is `0fc723d7…39ede1`, equal to ruling 23 and to `sources/c4-base/…/Statements.lean`.
  - `control/C4-FROZEN-STATEMENTS.md` is `6aa6dfe5…ca54b`.
  - r30 Snippet 0030 is `e8c6b0d1…91be83fe` and Snippet 0031 is `ec521065…0d31a2ac2`. Both equal their
    `sources/SOURCE-DIGESTS.json` entries.
  - Cycle 2 U2 `Main.lean` is `a03e15f3…c8d81d2c`, equal to `sources/c2-stage7-sources/SOURCE-DIGESTS.json` and the Stage 2 manifest.
  - The four carried base files in the seat project and in `scratchpad/c4-base` are identical to `sources/c4-base`: `Main.lean`
    `385af1bf…`, `ChokeState.lean` `64a101ef…`, `E1FlowConstruction.lean` `d26e702b…`, `C3LA1.lean` `49b227d3…`. The same holds
    for `lakefile.toml`, `lean-toolchain` and `lake-manifest.json`.
  - `build-u3-stitch.log` is `c12d4382…1c1248` and `axioms-u3-stitch.log` is `f21a0f56…928b`. Both match the return.
  - `verify_digests.py` is `df0aa732…31b68`. It matches, and my copy-out replay exits 0 with "all digests match (0 mismatches)".
- **Admission defect for U3** (`control/C4-STAGE3-ADMISSION.json`): `FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`. **Adjudicated as
  dismissed, with nothing to strike.** Every occurrence (lines 135, 189–190, 196, 212, 215, 313) either cites r30's governed award
  `lean-2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate` or disclaims the grade for the seat's own scratch. No
  scratch declaration of U3 is labelled `formally_verified`.
- **Interruption consistency.** The seat was interrupted by the host several times; its final scratch, logs and RETURN agree:
  - The file mtimes fit the narrative: `Statements.lean` 08:50, `U3Stitch.lean` 09:53, logs 23:01–23:02, script 23:03.
  - The build log is a cache replay ("Replayed LeanProof.Main", `Build completed successfully (8663 jobs)`).
  - The axiom lines in the log equal the axiom file byte for byte.

## Independent re-derivation

I used my own instrument in my own scratch (`scratchpad/c4-crit-U3-T/`), built copy-out-first. I copied the seat's source files
and bound `.lake/packages` by manual symlink to the pinned shared Mathlib project (`905b9581…`, Lean v4.32.2). I copied the
controller base cache `.lake/build`, never the seat's cache, after checking the CF-C4-S3-1 precondition on both sides. I `cd`'d
into the project before every `lake` or `lean` call, and never ran `lake update`, `lake clean` or `--no-cache`.

1. **Seat replay.** `lake build LeanProof` exits 0 in 31.3 s with `Build completed successfully (8663 jobs)`
   (`replay/crit-build-seat-replay.log`). It prints the same two axiom lines as the seat: N8 depends on
   `[propext, Classical.choice, Quot.sound]`, and the stitch on `[propext, sorryAx, Classical.choice, Quot.sound]`.
   `Statements.lean` reports `sorry` at exactly the 19 lines 26…278 and none at N8.
2. **Critic instrument** (`LeanProject/LeanProof/CritU3T.lean`, `c2c9344e…`, run by `lake env lean`, exit 0; log
   `replay/crit-instrument.log`). It checks five things:
   - **My own proof of the Hall step.** `CritU3T.weightedHall_of_ratFlow_crit` proves the same step as the seat's re-authored
     Part A by a different route: it sums over the full target layer and uses `Finset.sum_filter` with an if-split per target,
     where Part A restricts to `N` by `sum_subset`. Axioms: `[propext, Classical.choice, Quot.sound]`.
   - **N8 re-proved from my own step.** `CritU3T.crit_conjunct4_of_flowBundle` states N8's frozen text, hypothesis block copied
     from `control/C4-FROZEN-STATEMENTS.lean`. It is proved from my Hall step plus r30 entry 31, without U3's Part A. Axioms are
     the three base axioms. `example : @crit_conjunct4_of_flowBundle = @cb8_conjunct4_of_flowBundle := rfl` is accepted, so the
     two N8 statements have the same type in the kernel.
   - **Stitch statement identity.** An `example` typed from the SOLUTION-CONTRACT §2 terminal body is closed by
     `cb8_topRank_stitch_scratch_c4u3`, so the stitch's statement is the §2 body. As text, the two differ only in whitespace;
     the name is not reserved.
   - **Residual `sorry` set, enumerated exactly.** My own environment walker `#crit_sorry_leaves` follows
     `getUsedConstantsAsSet` over each constant's type and value. It lists every declaration in the dependency cone that mentions
     `sorryAx` directly:
     - The stitch has a cone of 16,533 constants and **exactly 8** such declarations: `cb8E1Arc_spec_topRank` (N2),
       `cb8GSec_nonneg_and_support` and `cb8GSec_out_ge_one` (N3, 2 of 5), `cb8GSec_in_le_one` and `cb8GSec_zero_classes`
       (N4, 2 of 3), `cb8GSec_switchImage_inflow` (N5, 1 of 2), `cb8_activeWeight_leafSet_eq` (N6) and
       `cb8_flowBundle_of_arcSpecs` (N7).
     - N8 (`cb8_conjunct4_of_flowBundle`) has a cone of 9,841 constants and none.
     - These two results act as a positive and a negative control on the walker.
     - The frozen definition `cb8GSec` is not a hit, so it is sorry-free.
   - **Axioms on the carries.** `#print axioms` on `exists_saturatingFlow_of_weightedHall`, `weightedHall_of_ratFlow_bound`,
     `exists_saturatingFlow_of_ratFlow_bound` and `AdjU.cb8_topRank_of_flow` gives the three base axioms only.
3. **Byte-level checks (Python).**
   - **Frozen-file diff.** `diff control/C4-FROZEN-STATEMENTS.lean Statements.lean` shows exactly two changes: one added line
     `import LeanProof.U3Interface`, and N8's `sorry` body replaced by a comment plus
     `obtain ⟨h1,h2,h3,h4⟩ := hbundle; exact exists_saturatingFlow_of_ratFlow_bound … h1 h2 h3 h4`. Every other statement,
     including N8's signature, is byte-identical (ruling 23).
   - **The r30 carries.** Snippets 0030 and 0031 have the standard `namespace`/`open scoped Classical`/`variable` header and a
     trailing `end`. With those stripped, each body is a byte substring of `U3Interface.lean` (702 and 6,518 bytes), and the
     header occurs once. Both carries keep the keyword `lemma` (ruling 19).
   - **The r30 definitions are the base's.** Snippets 0014–0021 (`indepFamily`, `tagWitnesses`, `activeWeight`, `layerWeight`,
     `favorableLeaves`, `transportRel`, `IsSaturatingFlow`, `WeightedHall`) each occur exactly once, byte-identical, in the base
     `Main.lean`. The carried lemmas therefore speak about the base's definitions.
   - **Receipt binding.** Entry 31 is used inside the r30 award's terminal `aggregate_nonpos_of_weightedHall` (r30 `Main.lean`
     entry 35: `obtain ⟨f, hf⟩ := exists_saturatingFlow_of_weightedHall G _ p h`). It is therefore in the cone the award's
     kernel receipt checked: `RECEIPTS/kernel-verification.json` verdict `verified`, and `EVIDENCE/axioms.txt` gives the terminal
     the three base axioms. The carry is receipt-bound through that cone, not only as a face companion.
   - **Part A fidelity.** Lines 184–259 of `U3Interface.lean` against Cycle 2 U2 `Main.lean` 2598–2669: with docstrings removed,
     the code is identical. Only the two docstrings were reworded.
   - **N8 hypothesis equals N7 conclusion.** Token for token they are identical: the only difference is one trailing space
     before N7's `:= by`. The frozen docstring's "byte-for-byte" means byte-for-byte up to that trailing space.

## Attacks and findings

- **A1: is N8's statement true and closed?** Yes. Its mathematics is generic:
  1. Nonnegativity, support on `transportRel`, Out ≥ weight and In ≤ weight give (HALL-COND). Summing over `X`, the column sums
     for targets outside `N(X)` vanish by support and nonnegativity.
  2. Clone-expansion Hall then gives an integral saturating flow with source equality, which `IsSaturatingFlow` requires.

  The inequality directions are right (Out uses `≤` into the row sum, In uses `≤` from the column sum), and the final cast
  ℚ → ℕ is sound. There is no ℕ subtraction, no Darroch/Newton, and no class hypothesis (ruling 24(7)). I closed the node a
  second time by a different proof, and both closures typecheck against the same type (`rfl`). **N8 is compiled sorry-free on
  the frozen text, confirmed independently.**
- **A2: hypotheses that encode the conclusion.** None. `hbundle` is a property of one named function
  `cb8E1Arc + cb8GSec`, not the existence of a flow or (HALL) (ruling 26). Neither file contains `sorry`, `admit`,
  `native_decide` or a `set_option` command; `set_option` appears only in comments. My count gives 0 in `U3Interface.lean`,
  `U3Stitch.lean` and the edited `Statements.lean`.
- **A3: the residual set is overstated as "exactly the open frozen nodes" (narrowing).**
  - Grades bullet 3 and gate line `TERMINAL_integration` say the stitch leaves a residual `sorry` set of "exactly the still-open
    frozen nodes" or "N2–N7". The kernel-enumerated set is **8 of the 19 open declarations**: the ones listed in
    Independent re-derivation 2.
  - These are not in the stitch's cone: N1 (all four), N2's companion `cb8N_sum_eq_cb8R`, N3's `cb8_sector_arcImages_mem_layer`,
    `cb8_sector_legCount` and `cb8GSec_out_eq`, N4's `cb8GSec_in_eq`, N5's `cb8_sector_switchPreimages`, and N7's companion
    `cb8Rho_one_eq_cb8R1_ratio`. They enter only through proofs of the eight.
  - The return's own detailed trace (lines 283–287) names the right eight. Only the summary phrasing overreaches.
  - The stitch file's header comment ("N1, N2, … as applicable") is also imprecise: N1 is not in the cone.
- **A4: "C2-LA1's terminal" is misattributed (narrowing).** The route object (return line 113) and the file header say the
  stitch uses C2-LA1's terminal. It does not.
  - It uses `AdjU.cb8_topRank_of_flow` (base entry 580). The base itself marks this "face companion (ungraded)" of C2-LA1.
  - C2-LA1's terminal is `cb8_topRank_parentDescent_and_conjuncts_1_2_3` (entry 582). Entry 579
    (`cb8_crossingIndex_add_two_le`) is in that terminal's cone, but entry 580 is not.
  - My build checks entry 580 in the kernel (base axioms only). Under SOLUTION-CONTRACT §4 it carries no certificate of its own,
    so a Stage 7 award must carry it from C2-LA1's governed Snippets (ruling 19) or re-author it, which is trivial.
- **A5: Part A has no governed source.** `weightedHall_of_ratFlow_bound` and `exists_saturatingFlow_of_ratFlow_bound` are
  re-authored from ungoverned Cycle 2 scratch, the single interface copy ruling 24(3) allows. The return labels this correctly
  and does not grade it. Any Stage 7 award over N8 must include this text on its own face. My independent proof shows the step
  does not depend on this particular text.
- **A6: minor defects of record, none of them mathematical.**
  - The comment in N8's body says the interface is "re-authored … `LeanProof/U3Stitch.lean`"; it lives in `U3Interface.lean`.
  - The `U3Stitch.lean` comment cites `scratchpad/c4-U3-replay/print_axioms.sh`, which does not exist. The replay directory
    holds only `verify_digests.py`.
  - The reserved name `cb8_topRank_eligible_and_weightedHall` occurs once, lexically, in a `U3Stitch.lean` comment (0
    declarations). An R-10 grep over this scratch will hit it; it is not a declaration.
  - The allocation's options census ("`set_option` on the face, counted") is not on the RETURN face. It exists only as a comment
    in `U3Stitch.lean`; my count confirms 0.
- **A7: numeric and fidelity duties.** Not applicable. The route asserts no network number, no (WID), no `supply − capacity = S`
  and no row value, and says so (return lines 237–239). Fresh rows 158/164/161, favorability at the index of record, and the
  per-target flow classes belong to other seats. Nothing here depends on them. No cut is claimed, and no template failure is
  presented as a cut.

## Mechanism-equivalence and fence check

- Fence 1 (one rank, the class only): the stitch is stated at `p* = (16m+4)/3`, `m ≥ 107`, `m % 3 = 2`. N8 is generic in `m`
  with no class claim, as ruling 24(7) intends. No aggregate status is transferred.
- No refuted mechanism is revived. Nothing uses a `θ*` law, a census, or r30's bounded record as a hypothesis or proof.
- There is no Darroch/Newton use anywhere in the route's text.
- Claim identity:
  - The return proposes no key. Its alias check is sound both lexically and mathematically: the stitch is `sorry`-dependent, and
    my conditional terminal has an extra hypothesis. Neither is the Tier 1 key or an alias of it.
  - Registry keys touched: the Tier 1 key (`proved_informal`, unchanged), `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`
    and `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` (cited at their governed grade, receipt-bound).
  - No grade is changed.
- Mechanism: `HALL-TO-FLOW-INTERFACE-AND-TERMINAL-STITCH` is exactly what was built: a Hall-to-flow interface plus the
  composition. It is not an alias of a struck reduction (R-9/R-10), because the hypothesis is a per-arc spec, not a flow.

## Certification audit

- "N8 closed sorry-free; axioms `propext, Classical.choice, Quot.sound`": **backed** by the seat's log and by my own rebuild and
  independent re-proof.
- "compiled" (for N8, the interface and the stitch): **backed** by a build log. No `formally_verified` label is placed on scratch.
- "Build completed successfully (8663 jobs)" and "`grep -ci error` = 0": **backed** (log and my replay).
- "35.47s (`time`: 14.32s user, 12.98s system, 76% cpu)": **STRUCK as unbacked**. The shipped `build-u3-stitch.log` contains no
  `time` output, so the timing literal is a self-report. It carries no mathematical weight.
- "residual `sorry` set of exactly the still-open frozen nodes" and "traced completely to N2–N7": **narrowed** to the eight
  kernel-enumerated declarations (A3).
- "C2-LA1's terminal": **corrected** to C2-LA1's face companion, entry 580, which is ungraded (A4).
- "`TERMINAL_integration`: CONFIRMED": **narrowed**. What is confirmed is a conditional terminal, whose one remaining open input
  is N7's conclusion (see Verdict).
- "copied byte-identically" (entries 30–31): **backed**. "re-authored" (Part A): **backed**; the code is identical modulo
  docstrings.
- Digest literals: all 14 recomputed values match (Identity and seal audit). No unmatched literal.
- Instrument-sides rows: every row writes its difference index textually (0, or "none: set-membership"). There are no numeric
  row claims, so ruling 29's REJECT clause is not triggered.

## Verdict

verdict: retained_narrowed
headline_resolved: no

- `COND4_formal`: not closed. N8 is compiled sorry-free, which I confirmed by rebuild and by an independent re-proof. Conjunct 4
  still needs N7's conclusion, which the stitch obtains only through the 8 `sorry`-bodied frozen declarations listed in A3.
- `E1_formal`: not this route's object; unchanged, open.
- `TERMINAL_integration`: conditional. The critic-derived `CritU3T.crit_terminal_of_flowBundle` is sorry-free (base axioms
  only): N7's conclusion ⇒ the §2 terminal body on the class. The seat's stitch builds, with `sorryAx` from exactly 8 frozen
  declarations (N2 main; N3 ×2; N4 ×2; N5 ×1; N6; N7 main).
- `cut_candidate`: none.
- `FROZEN_NODES_CLOSED`: N8

**Critic-derived advance (C-U3-T, scratch, ungraded):**

1. `CritU3T.crit_terminal_of_flowBundle`, a sorry-free conditional terminal. It removes the `sorryAx` noise from the seat's
   stitch and shows that the whole remaining gap to the §2 terminal is a single Prop: N7's conclusion.
2. An independent second proof of N8's frozen text that does not use U3's Part A. Its type equals U3's in the kernel (`rfl`).
3. A kernel-enumerated residual `sorry` set: 8 named declarations.

The route's mathematics is complete for its object (N8 and the composition). The grade is "compiled" pending a governed award,
per SOLUTION-CONTRACT §4. The narrowings are wording and attribution (A3, A4) plus one struck timing literal, not mathematics.

## Remaining obligation

Exactly: prove the frozen N7 conclusion (`cb8_flowBundle_of_arcSpecs`'s conclusion, which is N8's `hbundle` token for token) at
every `m ≥ 107`, `m % 3 = 2`. Via N7 as frozen, that means closing these eight declarations: `cb8E1Arc_spec_topRank`,
`cb8GSec_nonneg_and_support`, `cb8GSec_out_ge_one`, `cb8GSec_in_le_one`, `cb8GSec_zero_classes`, `cb8GSec_switchImage_inflow`,
`cb8_activeWeight_leafSet_eq` and `cb8_flowBundle_of_arcSpecs`, together with whatever frozen companions their proofs consume
(N1 through N2; `cb8GSec_out_eq`, `cb8GSec_in_eq`, `cb8_sector_switchPreimages` and others as used).

At Stage 7 the award also has to do three things:
- carry entries 30–31 from r30's Snippets and entries 78, 579 and 580 from the C1-LA2/C2-LA1 governed Snippets (ruling 19);
- put the re-authored Part A text on its own face (there is no governed source for it);
- restate the terminal under the reserved name with the frozen `Statements.lean` import line reconciled. The added
  `import LeanProof.U3Interface` is a necessary, disclosed divergence of the file, not of any statement.

No new mathematics is needed downstream of N7's conclusion.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-U3-T/`:

- `LeanProject/` — copy-out of the seat project: `LeanProof/{Main,ChokeState,E1FlowConstruction,C3LA1,Statements,U3Interface,U3Stitch}.lean`,
  `LeanProof.lean`, `lakefile.toml`, `lean-toolchain`, `lake-manifest.json`. `.lake/packages` is a symlink to the shared pinned
  project; `.lake/build` was copied from the controller base cache.
- `LeanProject/LeanProof/CritU3T.lean` (`c2c9344e4316eed57606ecf7af7724bc00d7bead5b535df162da8fc6f249c375`): the critic instrument.
- `replay/crit-build-seat-replay.log` (`5b75e59c…c7c4`): seat rebuild, exit 0.
- `replay/crit-instrument.log` (`b3101f5e…7121`): critic instrument output (sorry walk, axioms), exit 0.
- `replay/build-u3-stitch.log` (`c12d4382…1248`) and `replay/axioms-u3-stitch.log` (`f21a0f56…928b`): copies of the seat's logs.
- `replay/verify_digests.py` (`df0aa732…1b68`, the seat's script, copied) and `replay/verify_digests-replay.out`
  (`4408b5b4…3737`): replay, exit 0.
- `replay/partA_src.lean` (`4cf0bbac…0103`) and `replay/partA_u3.lean` (`86f94361…bab0`): Part A excerpts used for the fidelity
  diff.

No background job was started; there was nothing to kill. Every `lake`/`lean` call ran in the foreground.
