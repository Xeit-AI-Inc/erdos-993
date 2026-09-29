# Critique

Critic `C-U3-F` (orientation F, falsify) of seat U3, route `C4-U-03`, mechanism `HALL-TO-FLOW-INTERFACE-AND-TERMINAL-STITCH`,
r31 Cycle 4 Stage 4. Clock at write: 2026-09-29T00:14 EDT.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** Operating within VerityOS. Restricted boot: I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch `control/dispatch/c4-stage4/DISPATCH-C-U3-F.md`
(SHA-256 `8d90a1753fe15a7a8d43a5275b5e0af72d1dbb4d6c6410731b03bf7239545599`, matched before any other action). No other VerityOS file
outside the run root was read.

**Read-boundary disclosures.**
1. The Lean toolchain source `~/.elan/toolchains/leanprover--lean4---v4.32.2/src/lean/Lean/Util/CollectAxioms.lean` was read to
   debug my own sorry-trace instrument. It is toolchain API source, read for API meaning in the same sense as the Mathlib sources
   the protocol allows. It is not a VerityOS file and not another experiment.
2. When I created my output directory, a non-recursive `ls` of `cycles/cycle-4/stage4/critics/U3/` showed that a sibling
   directory `T` exists. I opened nothing inside it.
3. I did not read `scratchpad/c4-U3-replay/`, which the return cites (`verify_digests.py`, `print_axioms.sh`), because it lies
   outside the `scratchpad/c4-U3/` grant. See the Certification audit.
4. Everything else I read is on the capsule, is a Stage 2 member, or is under `sources/`: the frozen statements; the r30 C1-LA2
   award's Snippets, Main.lean, receipt and verification report; Cycle 2 U2's Main.lean Part A; `sources/c4-base/`; and the
   controller base cache named by CF-C4-S3-1. I made no network access, no installs, no `lake update` and no `lake clean`.

## Identity and seal audit

- **Capsule seal** `control/c4-critic-capsules/U3-PACKET-MANIFEST.json`: recomputed = stored =
  `1447c41d26801bd73b97ac065aaf5cb4aacf7e069e3be75c30d89b3be7c89ebf`. All 16 listed files match on byte count and SHA-256
  (`scratchpad/c4-crit-U3-F/seal.py`).
- **Stage 2 seal** `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`: recomputed and matched. `file_count` 6084 =
  `len(files)` 6084, which matches the return's literal.
- **Stage 3 seal** `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`: recomputed and matched.
- **Stage 4 dispatch seal** `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`: recomputed and matched.
- **Return** `cycles/cycle-4/stage3/returns/U3/RETURN.md`: SHA-256 `9c8e8e47…d0f5828c`, 26956 bytes. This agrees with the capsule
  and with `C4-STAGE3-ADMISSION.json`. The route ID and mechanism token are both present verbatim.
- **Digests the return cites, re-verified independently:**
  - r30 Snippets 0030 `e8c6b0d1…291be83fe` and 0031 `ec521065…d31a2ac2` equal the `sources/SOURCE-DIGESTS.json` records and the
    bytes on disk.
  - Cycle 2 U2 `Main.lean` `a03e15f3…c8d81d2c` equals the `sources/c2-stage7-sources/SOURCE-DIGESTS.json` record and the bytes
    on disk.
  - All 12 entries of `sources/c4-base/SOURCE-DIGESTS.json` match the bytes on disk.
  - The frozen statements `0fc723d7…cae39ede1` (.lean) and `6aa6dfe5…edc5eca54b` (.md) match gate ruling 23.
  - U3's four carried Lean files (`385af1bf…`, `64a101ef…`, `d26e702b…`, `49b227d3…`) and its `lakefile.toml`,
    `lean-toolchain` and `lake-manifest.json` are byte-identical to `sources/c4-base`.
  - U3's two edited files, `Statements.lean` (`1c059d5a…`) and the root `LeanProof.lean`, differ from the base as disclosed.
  - U3's logs: `build-u3-stitch.log` `c12d4382…f749c1248` and `axioms-u3-stitch.log` `f21a0f56…a0738cb928b` match the return.
- **Registry keys touched** (`control/CLAIM-IDENTITY.run-local.json`, a Stage 2 member):
  - The Tier 1 key `E993-R31-CB-8-M-AT-LEAST-107-…-SATISFIES-WEIGHTED-HALL` has status `VERIFIED` and grade `proved_informal`.
    This is as the return states.
  - `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` is `VERIFIED` / `formally_verified`, registered by r30 C1-LA2.
    Its record names `exists_saturatingFlow_of_weightedHall`. This is correct as cited.
  - `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` is `VERIFIED` / `formally_verified`, but its
    registration reason is **"r30 Cycle 3 award C3-LA1"**, not C1-LA2. Its record does not mention entries 30–31. The return's
    attribution is wrong (Finding F-4).
- **Alias check.** Neither `cb8_topRank_stitch_scratch_c4u3` nor my own `crit_u3f_terminal_of_bundle` occurs in the registry.
  Lexically, neither is a registered key or its predicate form. Mathematically, each is a conditional, sorry-dependent or
  hypothesis-laden form of the Tier 1 shape, not an equivalent of it. No `E993-R31-` candidate is proposed by the return or by me.
- **Admission defect for U3** (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`): adjudicated below under Certification audit.

## Independent re-derivation

All of this was done copy-out-first in `scratchpad/c4-crit-U3-F/`. I copied U3's project sources into
`scratchpad/c4-crit-U3-F/LeanProject/` and bound `.lake/packages` by manual symlink to the pinned shared Mathlib project. I copied
the controller-built base cache (`scratchpad/c4-base/LeanProject/.lake/build`, CF-C4-S3-1), never U3's own cache. Its precondition
held: the four carried files are byte-identical to `sources/c4-base`. Every `lake`/`lean` invocation ran after `cd` into the pinned
project and in the foreground.

1. **Rebuild of U3's project.**
   - Command: `lake build LeanProof`. Result: exit 0, `Build completed successfully (8663 jobs)`
     (`build-crit.log`, `cb42508e…`).
   - The same 19 `declaration uses 'sorry'` warnings appear at Statements.lean lines 26, 36, 59, 76, 89, 99, 142, 151, 165, 172,
     180, 188, 196, 205, 221, 239, 252, 264, 278.
   - The two axiom lines reproduce verbatim:
     `cb8_conjunct4_of_flowBundle` → `[propext, Classical.choice, Quot.sound]`;
     `cb8_topRank_stitch_scratch_c4u3` → `[propext, sorryAx, Classical.choice, Quot.sound]`.
2. **Frozen-text fidelity (gate ruling 23).**
   - `diff control/C4-FROZEN-STATEMENTS.lean <U3 Statements.lean>` shows exactly two changes:
     - `3a4 > import LeanProof.U3Interface`;
     - N8's `sorry` body at line 357 replaced by the 11-line body (6 comment lines plus `obtain`/`exact`).
   - N8's docstring, name, binders, hypothesis text and conclusion are byte-identical to the frozen text.
   - Instrument B is my own elaboration-level check. I built a second project copied from `sources/c4-base` unchanged, with the same
     base cache (`build-base-crit.log`, exit 0, 8661 jobs). In both environments I computed, for all 21 frozen declarations (20
     theorems plus the definition `cb8GSec`), the structural `Expr.hash` of the elaborated type and of `cb8GSec`'s value.
   - Result: `hash-base.txt` and `hash-u3.txt` are byte-identical (both `54b3b4ef…`, 21 lines each).
   - Conclusion: the added import changes the elaboration of no frozen statement. This is hash equality (strong evidence, not a
     proof of `Expr` equality). Together with the textual diff, it backs the claim that "statement bytes are unchanged".
3. **Carried r30 entries 30–31 are byte-identical and receipt-bound.**
   - Each fragment is the standard header (`namespace E993Transport` / `open scoped Classical` / `variable {V …}`), then the
     declaration, then `end E993Transport`.
   - The declaration bodies (700 and 6516 characters) are exact substrings of U3's `U3Interface.lean`, which supplies the
     identical header once (`carry_check2.py`).
   - Receipt binding, derived by me because the return did not state it:
     - Both bodies are also exact substrings of the award's own `LeanProject/LeanProof/Main.lean` (SHA-256 `7c279f4b…a32349f8`,
       recorded in `SOURCE-DIGESTS.json`).
     - That digest is exactly the `source_sha256_before/after` of the award's `RECEIPTS/kernel-verification.json` (`dc1371a0…`;
       every check passed, including axiom policy, incomplete-proof scan and project build).
     - `VERIFICATION-REPORT.json` has status `formally_verified`.
   - So the carry is receipt-bound through the award's source digest.
4. **Part A re-authoring is faithful.**
   - `weightedHall_of_ratFlow_bound` and `exists_saturatingFlow_of_ratFlow_bound` were extracted from
     `sources/c2-stage7-sources/U2/LeanProject/LeanProof/Main.lean`, lines 2593–2669 (the return's range is exact: the docstring
     starts at 2593 and the second theorem ends at 2669).
   - With docstrings stripped, both declarations (statement and proof) equal U3's copies byte for byte.
   - Only the docstrings were rewritten. There is exactly one interface copy, as ruling 24(3) requires.
5. **Kernel-level sorry trace: an exact instrument for the stitch's residual set.**
   - `#print axioms` only reports that `sorryAx` occurs. It does not say where.
   - I wrote a meta-command, `#crit_sorry_users` in `LeanProof/CritU3F.lean`. It walks the full transitive constant closure
     (types and values) and lists every constant whose type or value directly mentions `sorryAx`.
   - The first version walked too little. I debugged it by confirming that values are visible and that `cb8_flowBundle_of_arcSpecs`'s
     value contains `sorryAx`, then fixed the traversal (`crit-instrument.log`, `e36776cf…`).
   - **`cb8_topRank_stitch_scratch_c4u3`**: closure of 16519 constants. Exactly **8** direct `sorryAx` users:
     - N2: `cb8E1Arc_spec_topRank`;
     - N3: `cb8GSec_nonneg_and_support` (companion) and `cb8GSec_out_ge_one`;
     - N4: `cb8GSec_in_le_one` and `cb8GSec_zero_classes`;
     - N5: `cb8GSec_switchImage_inflow`;
     - N6: `cb8_activeWeight_leafSet_eq`;
     - N7: `cb8_flowBundle_of_arcSpecs`.
     No base, carried or interface constant uses `sorryAx`. The N-labels were read off the frozen file's docstrings.
   - **`cb8_conjunct4_of_flowBundle` (N8)**: closure of 9826 constants and **0** `sorryAx` users.
   - `#print axioms` on every non-frozen dependency gives `[propext, Classical.choice, Quot.sound]`:
     `exists_saturatingFlow_of_ratFlow_bound`, `weightedHall_of_ratFlow_bound`, `exists_saturatingFlow_of_weightedHall`,
     `card_sigma_fiber_filter`, `AdjU.cb8_topRank_of_flow`, `cb8_topRank_of_descent_and_flow`,
     `AdjU.cb8_crossingIndex_add_two_le`.
   - So the return's claim that the stitch's `sorryAx` "traces only to N2–N7" is **confirmed exactly**. My instrument is sharper:
     the residual set is 8 of the 20 frozen theorems. N1 and the other 11 frozen theorems do not appear at the top level; they
     enter only through future proofs of N2–N5.
6. **Terminal shape.**
   - The stitch's statement, whitespace-normalized, equals SOLUTION-CONTRACT §2's `cb8_topRank_eligible_and_weightedHall` body
     token for token. Only the name differs.
   - The reserved name is not declared anywhere in U3's files. It occurs lexically once, inside a comment in `U3Stitch.lean`
     (Finding F-5).
7. **Carried network definitions.**
   - The r30 C1-LA2 Snippets 0014, 0015, 0016, 0019, 0020 and 0021 (`indepFamily`, `tagWitnesses`, `activeWeight`,
     `transportRel`, `IsSaturatingFlow`, `WeightedHall`) each occur exactly once, byte-identically, in the base `Main.lean` that
     N8 and entries 30–31 are elaborated against.
   - So N8's `IsSaturatingFlow` and `WeightedHall` are the definitions of record, and SEMANTIC-CONTRACT §1 fidelity holds at this
     interface.
   - No `supply − capacity = S` instance is asserted by the return, and none is needed: it computes nothing on the network.

## Attacks and findings

- **A-1 (falsify N8): does N8 prove the frozen statement? Survives.**
  - The kernel accepted `obtain ⟨h1,h2,h3,h4⟩ := hbundle; exact exists_saturatingFlow_of_ratFlow_bound …` against a type whose
    elaboration hash equals the base's frozen N8.
  - N8 has no class hypotheses (ruling 24(7)). It is a conditional true for every `m` and asserts no (HALL) by itself.
  - No `sorry`, `admit`, `native_decide` or `decide`-over-enumeration occurs in U3's added text. The only matches for `sorry` and
    `set_option` are in comments.
- **A-2 (the added import).** A necessary divergence, and benign as shown above. Stage 7 packaging must place `U3Interface`
  (or its governed carries) so that the awarded `Statements.lean` is the frozen text plus the proof body. This is a packaging
  obligation, not a defect.
- **A-3 (ℕ subtraction / casts).**
  - N8's body and the stitch contain no ℕ subtraction. `h0m : 0 < m` comes from `omega` on `107 ≤ m`.
  - Part A contains a ℕ→ℚ monotone cast of sums (`push_cast` / `exact_mod_cast`). The return's line "No … cast … occurs anywhere
    in this route's own new proof text" is true of Steps 1 and 3 only. The cast is sound, so this is a precision note, not an
    error.
- **A-4 (vacuity / circularity).**
  - N8's hypothesis is a property of the one named function `cb8E1Arc + cb8GSec`, not the existence of a flow (ruling 26). N8 is
    not circular.
  - Whether the bundle is TRUE on the class is N7's burden (U2) and F2's end-to-end check. It is not within U3's claims. Nothing
    in U3 asserts it.
- **A-5 (fences).** One rank `p*`; the class only (`hm`, `hres` enter only through N2–N7 and `AdjU.cb8_topRank_of_flow`). No θ*
  law, no Darroch/Newton, no census used as proof, and no refuted mechanism revived. No status transfer: the return explicitly
  leaves Tier 1 at `proved_informal`.
- **A-6 (scratch/transcript consistency; the attack brief's interruption check).**
  - Final logs agree with RETURN.md: the digests match, `grep -ci error` = 0, and the build log's content agrees with the reported
    job counts and axiom lines.
  - One discrepancy: `U3Stitch.lean` has mtime **2026-09-28T09:53:22**, which is after the ~08:55 interruption and at the ~09:50
    resumption. The other route files date from 08:50. The return says that on resumption it found the three route files "intact
    and unchanged from what it had written pre-interruption". The mtime shows `U3Stitch.lean` was written or rewritten after
    resumption.
  - This is not mathematically material, since the file I built is the file the logs describe. It is a disclosure-accuracy
    finding (F-6).
- **A-7 (open step attempted: the terminal reduction as a sorry-free theorem).** Critic-derived; see Remaining obligation.
  - The step the return leaves open is closing N2–N7. Those belong to other seats, and I did not attempt them.
  - I proved, sorry-free, the reduction the stitch only exhibits modulo frozen `sorry`s:
    `E993Transport.crit_u3f_terminal_of_bundle (m) (hm : 107 ≤ m) (hres : m % 3 = 2) (hbundle : ⟨N8's hypothesis text,
    byte-copied⟩) : ⟨§2 terminal shape⟩`, proved as `AdjU.cb8_topRank_of_flow m hm hres (cb8_conjunct4_of_flowBundle m hbundle)`.
  - Axioms: `[propext, Classical.choice, Quot.sound]`. The `#crit_sorry_users` walk finds 0 direct `sorryAx` users in its
    16508-constant closure.
  - So, at the kernel level, **the Tier 1 terminal shape follows from the single N7 bundle at `m` with no other open input.**
  - Scope: this is a compiled critic scratch declaration with no grade (SOLUTION-CONTRACT §4). It is not a frozen node, not the
    reserved name, and not a claim of (HALL).

**Findings (numbered):**
- **F-1 (confirmed):** N8 compiles sorry-free on the Cycle 4 base against the frozen text. Axioms are exactly
  `propext, Classical.choice, Quot.sound`. Reproduced by rebuild.
- **F-2 (confirmed, sharpened):** the stitch's residual `sorryAx` set is exactly the 8 frozen declarations listed in item 5 above,
  traced at kernel level.
- **F-3 (confirmed):** entries 30–31 are byte-identical and receipt-bound (my derivation via `7c279f4b…` and `dc1371a0…`). Part A
  is byte-faithful apart from its docstrings.
- **F-4 (struck attribution):** `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` is r30's **C3-LA1**
  award, not C1-LA2's. The carry of entries 30–31 does not touch it. The return's claim that it carries that key's entries is
  struck.
- **F-5 (hygiene):** the reserved name `cb8_topRank_eligible_and_weightedHall` occurs once, in a comment in `U3Stitch.lean`. Any
  R-10 lexical grep over a package containing this file will flag it, so it should be removed before packaging. Separately,
  N8's in-body comment says Part A lives in "`LeanProof/U3Stitch.lean`"; it is in `U3Interface.lean`. The comment is inaccurate
  but harmless.
- **F-6 (disclosure accuracy):** the `U3Stitch.lean` mtime contradicts the "unchanged since pre-interruption" wording (A-6).

## Mechanism-equivalence and fence check

- **Mechanism.** Hall ⇒ flow via a rational capacity flow, followed by r30's clone-expansion Hall (`Fintype.all_card_le_filter_rel_iff_exists_injective`).
  This is the composition path SEMANTIC-CONTRACT §2 names ("summing it over any X gives (HALL-COND); an integral saturating flow
  follows (the kernel-checked companion `exists_saturatingFlow_of_weightedHall`)").
- It is not one of the refuted mechanisms (r30 §3.2 list, the compression lemma, CHAR at `m = 1`, the `m`-independent per-choke
  certificate, forest real-rootedness). It is distinct from the struck R-9/R-10 reductions: N8's hypothesis is per-arc
  properties of a named function (ruling 26).
- **Fences 1–9 hold.** One rank and the class only. No aggregate status transfer. No census used as proof. No θ* hypothesis. The
  r30 bounded record is not used. Sealed roots are unedited: I only copied out. Attribution is on the face: r30 C1-LA2 for entries
  30–31; Cycle 2 U2 for Part A; U3 for N8's body and the stitch.

## Certification audit

- **Admission defect `FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN` (U3), adjudicated.** Every occurrence is either a citation of a
  governed award or a negation:
  - lines 135 and 196: r30's award;
  - lines 189–190: "`verified` never `formally_verified`";
  - lines 212 and 313: "not `formally_verified`";
  - line 215: a receipt-bound citation.

  None labels U3's own scratch. **Defect dismissed; nothing struck under it.**
- **Backed literals:**
  - "exit 0", "8663 jobs", "`Build completed successfully`" (by my rebuild and U3's log);
  - both axiom lines;
  - "`grep -ci error` = 0";
  - the 19 `sorry` line numbers;
  - all SHA-256 literals listed in the Identity audit;
  - "`file_count` 6084";
  - "statement bytes unchanged" (diff plus elaboration hashes);
  - "zero `set_option` commands" (matches occur only in comments);
  - N8 "compiled" (not `formally_verified`), which is the correct grade.
- **Struck or narrowed literals:**
  1. "This is byte-for-byte the hypothesis tuple of the GENERIC … lemma" (Step 1) is **narrowed**. The generic lemma's hypotheses
     are stated over `G, F, p, g`. N8's `hbundle` equals them only after instantiation and ζ-reduction: they are definitionally
     equal (kernel-checked by the `exact`), not byte-equal.
  2. "35.47s (14.32s user, 12.98s system, 76% cpu)" is **struck**. It is not in the shipped `build-u3-stitch.log`, which has no
     `time` output, so it is an unbacked self-report. It is immaterial.
  3. The attribution of `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` to the C1-LA2 award is
     **struck** (F-4).
  4. The gate line `TERMINAL_integration: CONFIRMED` is **narrowed** to "stitch compiled; residual `sorryAx` exactly the 8 frozen
     N2–N7 declarations; terminal not integrated". The return's own prose says the same, but the token "CONFIRMED" overstates it.
  5. `verify_digests.py` sha256 `df0aa732…` and `print_axioms.sh` live in `scratchpad/c4-U3-replay/`, outside my grant, and are
     **not audited**. My own instruments replace them as evidence.
  6. "replayed … ChokeState … C3LA1 from the copied cache": the log names only `Main` and `E1FlowConstruction`, because silent
     replays are not printed. Consistent with the claim but not directly evidenced. Not material.
- No numeric claim on network rows is made, so gate ruling 29's difference-index rule has nothing to reject. The return's
  `## Instrument sides` rows are exact-string equalities, and it says so textually.

## Verdict

verdict: retained_narrowed
headline_resolved: no

N8 (`cb8_conjunct4_of_flowBundle`) compiles sorry-free against the frozen text byte for byte. The stitch is the §2 terminal shape
under a non-reserved name, and its residual `sorryAx` set is exactly the frozen N2–N7 declarations. Both claims are retained on my
independent rebuild and kernel-level trace. The narrowing covers only certification literals and one registry attribution: F-4,
struck items 1–4. N8's mathematics is complete, and the carried statements are formally checked by the kernel at compiled-scratch
grade (no grade until a governed award closes over it, SOLUTION-CONTRACT §4).

- `COND4_formal`: no — N8 compiled sorry-free; conjunct 4 remains open pending N1–N7.
- `E1_formal`: no — not this seat's object (N1/N2 open here).
- `TERMINAL_integration`: partial — stitch compiled; residual `sorryAx` exactly {N2 `cb8E1Arc_spec_topRank`, N3 `cb8GSec_nonneg_and_support`, `cb8GSec_out_ge_one`, N4 `cb8GSec_in_le_one`, `cb8GSec_zero_classes`, N5 `cb8GSec_switchImage_inflow`, N6 `cb8_activeWeight_leafSet_eq`, N7 `cb8_flowBundle_of_arcSpecs`}; critic-derived sorry-free `crit_u3f_terminal_of_bundle` (terminal ⇐ N7 bundle).
- `cut_candidate`: none
- `FROZEN_NODES_CLOSED`: N8

## Remaining obligation

1. **For conjunct 4 and the terminal (exact).**
   - The frozen declarations N2 `cb8E1Arc_spec_topRank`, N3 `cb8GSec_nonneg_and_support` and `cb8GSec_out_ge_one`, N4
     `cb8GSec_in_le_one` and `cb8GSec_zero_classes`, N5 `cb8GSec_switchImage_inflow`, N6 `cb8_activeWeight_leafSet_eq` and N7
     `cb8_flowBundle_of_arcSpecs` must compile sorry-free on the Cycle 4 base.
   - Their proofs will bring in N1 and the remaining N3–N5/N7 companions as those proofs require.
   - Once they close, the terminal follows with no new mathematics, as `cb8_topRank_stitch_scratch_c4u3` shows modulo them. It then
     needs only re-pointing at the reserved name inside a governed Stage 7 run.
   - Critic-derived advance (C-U3-F): `crit_u3f_terminal_of_bundle` shows, sorry-free at the kernel level, that the §2 terminal
     follows from N7's conclusion at `m` alone. Grade: compiled critic scratch, ungraded.
2. **Packaging (Stage 7).**
   - Place the interface: r30 entries 30–31 carried from the governed run under ruling 19, bound to receipt `dc1371a0…` / source
     `7c279f4b…`. Place Part A as the single draft copy. Do this so that the awarded `Statements.lean` differs from the frozen
     file only in N8's body, or disclose the import line as U3 did.
   - Remove the reserved-name comment from `U3Stitch.lean` (F-5).
   - Correct the in-body comment that names the wrong file for Part A (F-5).
3. **Record corrections (no re-run needed).**
   - F-4: the orbit-quotient key belongs to r30 C3-LA1.
   - F-6: `U3Stitch.lean` was written at 09:53 on resumption, not before the interruption.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-U3-F/`:

- `seal.py` (`ec91c4f4…`): capsule, Stage 2/3/4 seals and capsule file digests.
- `carry_check.py` (`ec37c675…`) and `carry_check2.py` (`29f3d10c…`): entries 30–31 byte-identity and SOURCE-DIGESTS records.
- `c2u2-partA.txt`: the extracted Cycle 2 U2 lines 2585–2675, used for the Part A comparison.
- `LeanProject/`: a copy-out of U3's project. Packages are symlinked; the build cache was copied from the controller base. It adds
  `LeanProof/CritU3F.lean` (`7a57cdcc…`: the `#crit_sorry_users` instrument, dependency `#print axioms`, and
  `crit_u3f_terminal_of_bundle`) and `LeanProof/CritHashProbe.lean`.
- `BaseProject/`: an unmodified copy of `sources/c4-base/LeanProject` with the same cache, plus `LeanProof/CritHashProbe.lean`.
- `build-crit.log` (`cb42508e…`): rebuild of U3's project, exit 0, 8663 jobs.
- `build-base-crit.log` (`da7bbe06…`): base rebuild, exit 0, 8661 jobs.
- `crit-instrument.log` (`e36776cf…`): the sorry trace and axioms.
- `hash-base.txt` and `hash-u3.txt` (both `54b3b4ef…`): elaboration hashes of the 21 frozen declarations.
- `u3-orig/`: verbatim copies of U3's `build-u3-stitch.log` and `axioms-u3-stitch.log`, with digests matching the return.

Background jobs: none were started. Every build and `lean` run was foreground and synchronous, so nothing needed killing.
