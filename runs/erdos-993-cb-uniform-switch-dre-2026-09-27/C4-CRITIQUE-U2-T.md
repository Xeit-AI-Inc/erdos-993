# Critique

**Critic:** `C-U2-T`, orientation T (prove), assigned to the route return of seat `U2` (route `C4-U-02`, mechanism
`WEIGHT-FORMULA-AND-PER-CLASS-COMPOSITION`, orientation U). r31 Cycle 4 Stage 4, 2026-09-29.

**Boot.** I am operating within VerityOS. This was a restricted boot. I read exactly `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch
`control/dispatch/c4-stage4/DISPATCH-C-U2-T.md`, whose SHA-256 `2ea4dbca6d5a9066a0e569fa8a20b6f1d55daeb63ced266c059a6d13f39880b6` I
verified before reading it. I loaded no other VerityOS subsystem: no memory, logs, decisions, modules, skills or conversations.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Capsule seal** (`control/c4-critic-capsules/U2-PACKET-MANIFEST.json`), recomputed as SHA-256 of compact key-sorted JSON without
  `seal_sha256`: `646889139627d1201d0a851deff778b2aacf70a9f4a154ac9231c3298c33e3cd`. **Matched.** All 16 listed files matched on
  SHA-256 and byte count. That includes the assigned return, `cycles/cycle-4/stage3/returns/U2/RETURN.md`
  (`9fa4815d9a0eb261378c60039737e28e55e08ad14a34c5778bb6efd2702c74cb`, 43,316 bytes).
- **Stage 4 dispatch seal** (`control/C4-STAGE4-DISPATCH-MANIFEST.json`): `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`. Matched.
- **Stage 3 seal** (`control/C4-STAGE3-PACKET-MANIFEST.json`): `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`. Matched.
  The manifest lists the U2 return with the same digest as above, and U2's dispatch as `ac296057…`, which agrees with the return's own claim.
- **Stage 2 seal** (`control/C4-STAGE2-PACKET-MANIFEST.json`): `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`. Matched.
  The Stage 2 member digests of `control/C4-FROZEN-STATEMENTS.lean` (`0fc723d7…`) and `control/C4-WORKER-COMMON-BRIEF.md`
  (`42f655cf…`) also matched.
- **Every digest literal in the return, recomputed from its artifact:**
  - The base files. `Main.lean` `385af1bf…`, `ChokeState.lean` `64a101ef…`, `E1FlowConstruction.lean` `d26e702b…`, `C3LA1.lean` `49b227d3…`,
    the shell files and the frozen `Statements.lean` `0fc723d7…` all equal `sources/c4-base/SOURCE-DIGESTS.json`. `diff` shows the frozen
    file and the base `Statements.lean` are identical.
  - U2's build and axiom logs. `build-kernelcheck.log` `8067cd67…` (162 lines; it records 5 `omega` errors at the stated lines 357, 388,
    389, 408 and 409). `build-kernelcheck2.log` `02dfe124…` (86 lines). `build-main4.log` `c1f08f9f…`. The empty logs hash to `e3b0c442…`.
    `work/axioms.log` `7c6b671f…`, `work/AxiomCheck.lean` `ba74f041…`.
  - U2's final scratch `Statements.lean`: `2c1ee236…` (568 lines).
  - U2's generator and outputs. Generator `aa3adc83…`; `run2.out.json` and the U2 replay `replay1.out.json` both `774857c8…`. The embedded
    `sha256_of_results` `13dc6e21…` recomputes exactly as the canonical JSON of the result object without that field.
  - **Every literal matched.** No unmatched digest remains. Final scratch, logs and RETURN.md agree on the final state across the three
    host interruptions: file mtimes show `Statements.lean` at 23:02 and `build-kernelcheck2.log` at 23:03.
- **Admission defect for U2** (`control/C4-STAGE3-ADMISSION.json`): `FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`. I read all nine
  occurrences (return lines 111, 124, 210, 219, 247, 248, 516, 518, 526).
  - Each one either cites a governed award (C3-LA1's entries 33/37 and C1-LA1's terminal, both formally verified at their own scopes) or
    explicitly denies the label to U2's own scratch.
  - **Adjudication: no strike.** No self-label on scratch.
  - The applied exception `BAD_HEADLINE_FLAG` at line 515 is format only, and the value is `no`. I concur.

## Independent re-derivation

**Instrument A: a Lean rebuild, copy-out-first, in my own scratch.**
- **Setup.** Project `scratchpad/c4-crit-U2-T/LeanProject/`:
  - The four unmodified base `.lean` files and the shell were copied from `sources/c4-base/` and are byte-identical to it.
  - The controller base cache (CF-C4-S3-1) was copied from `scratchpad/c4-base/LeanProject/.lake/build`. I did not use the seat's cache.
  - `.lake/packages` is a manual symlink to the pinned shared project. The toolchain is `v4.32.2` and the Mathlib rev is `905b9581…`, both
    equal to `sources/mathlib-binding/PIN.json`.
  - I never used `--no-cache`, `lake update` or `lake clean`.
- **Replay of U2's scratch.** I copied U2's `Statements.lean` (`2c1ee236…`) in and ran `lake build LeanProof`. Result: exit 0,
  `Build completed successfully (8661 jobs)`, 0 errors (`work/build-replay-U2.log`, `472e86c3…`). The `sorry` warnings are at
  Statements lines 31–244 (N1–N5), 456 (N7 main) and 553 (N8). There is none at N6 (line 256) or at the companion (line 438).
- **Statement fidelity (gate ruling 23).** `diff control/C4-FROZEN-STATEMENTS.lean <U2 Statements.lean>` gives exactly four hunks:
  - `3a4,9` adds the `import LeanProof.C3LA1` line and a comment;
  - `256c…`, `266c…` and `337c…` each replace one `sorry` line.
  - **Every frozen declaration header, including N6 and N7, is byte-identical to the frozen text.** The added import is proof
    infrastructure and does not change any statement. C3LA1 is part of the gate-25 base.
- **Axioms.** I ran my own `#print axioms` (`LeanProject/work/AxiomCheckCritic.lean`, log `work/axioms-critic.log`, `cf228c66…`):
  - `cb8_activeWeight_leafSet_eq` (N6): `[propext, Classical.choice, Quot.sound]`.
  - `cb8Rho_one_eq_cb8R1_ratio` (N7 companion): `[propext, Classical.choice, Quot.sound]`.
  - The same check on N8 reports `sorryAx`, which shows the check does detect `sorry`.
  - A grep of the proof bodies finds no `native_decide`, `decide`, `admit`, `axiom` or `set_option`.

**Instrument B: an independent Python model built from the definitions** (`work/crit_n6_n7.py`, `50e65ecf…`; standard library,
exact integers and `Fraction`, fixed seed).
- **How it differs from U2's script.** It is written from `cbEdge` (entry 23), `IsGraphLeaf`, `support` and `tagWitnesses`, not copied
  from U2. It derives the leaf set from degree 1 and the witnesses as `N(support) ∖ {leaf}` from adjacency. U2 instead typed the witness
  sets from lemmas 69/70.
- **Fixed point of record first** (SEMANTIC-CONTRACT §5, `CB(8,95)/508`). It reproduces `p* = 508`,
  `ρ_1 = 1354839571516225/1361543988640524`, `θ = 96/604265`, `σ(1..3) = 96/4229855, 32/604265, 288/3021325` and the ratio `508/507`,
  all exact. At `m = 107` the margin `(1−ρ_1)/θ = 34.90…` matches the row key's `≈ 34.90`.
- **N6 results.**
  - `m = 1`: all `2^20 = 1,048,576` subsets checked, 0 failures.
  - Sampled over four shapes (arbitrary, choke-heavy, greedy independent, and switch-image shape) at:
    - `m = 2` (20,000 checks);
    - rows `107` and the fresh rows `158` and `164`, plus the structural row `161` (2,000 each).
  - **0 failures overall.**
  - The mutation control (`[v]` in place of `[v ∧ r]`) is caught 512 times out of 2,000.
- **N7 arithmetic at rows 107, 158, 161 and 164** (gate ruling 27):
  - `ρ_1 = cb8R1(m,K)/cb8R1(m,K−1)` holds exactly. The index-shift mutant (index `p*` in place of `p* − 1`) is caught.
  - `ρ_q < 1` for every `q = 1..m`, and `ρ_1 = max_q ρ_q`.
  - `θ(m) ≤ 1 − ρ_1`.
  - `ρ_1 γ + (8−γ) c_γ θ ≤ γ` for every `γ = 0..8`.
  - Output `work/crit_run1.out.json`, `a43ad5ba…` (embedded results digest `03f001b4…`).
  - The copy-out replay `replay/crit_replay.out.json` is byte-identical (`a43ad5ba…`).
- **Replay of U2's generator,** copy-out-first to `scratchpad/c4-crit-U2-T/replay/`: its output `replay.out.json` is byte-identical to
  U2's `774857c8…`.
- **Is `0 < m` load-bearing?** I checked independently. At `m = 0`, `leafSet = {r, v}` (`r` has degree 1), and
  `w({r, v}) = 2 ≠ 1 = RHS`. N6 is false at `m = 0`, which confirms SR-C3-3's note.

**Instrument sides / difference index.** None of these numbers is a layer-difference quantity:
- N6 is a `Finset.card` identity.
- `ρ_q` is the coefficient ratio `r_q(p*−q)/r_q(p*−q−1)`. For `ρ_1` that is index `p*−1` over `p*−2`.

No `i_{p+1} − i_p` at any `p` is claimed. (WID) is not applicable: no network supply/capacity is computed here.

## Attacks and findings

1. **N6 is sound and closed in scratch; retained.** The frozen text compiles sorry-free on the Cycle 4 base with the three standard
   axioms. Three independent sides agree:
   - my rebuild and axiom run;
   - U2's own logs;
   - my graph-derived Python model, including exhaustive `m = 1` and the rows 158, 161 and 164.

   The first-build `omega` failures (five genuine errors, one class: a dropped `i < m` / `j < 8` bound) are absent from the final proof.
   The attack brief's concern is discharged against the final text, not the log history.
2. **The N7 companion is sound and closed in scratch; retained.** It is a four-line bridge through the carried
   `cb8R_natCast_eq_coeff` and C3-LA1's entries 33 and 37. Every ℕ subtraction is safe: `(16m+4)/3 − 1 ≥ 1` follows from `107 ≤ m`,
   discharged by `omega`. My exact value check at the four gate rows agrees.
3. **Gap in U2's informal derivation of N7 clause (4), in the "every other A" branch (return lines 188–194).** The return says the E1
   column is 0 "whenever `r∈A ∨ q(A)=0`" and then treats only the sub-case `r∉A ∧ q(A)=0`. For an `r`-free target with `q(A) ≥ 2`, or
   with `q(A) = 1 ∧ v ∉ A`, the E1 column is **not** 0. By `hE1.4` it is `ρ_q · w_F(A)`, and that is positive whenever `w_F(A) > 0`.
   - **The missing step:** `ρ_q ≤ 1` for `1 ≤ q ≤ m`. It comes from `cb8Rho_lt_one_topRank`, with `q ≤ m` taken from `cbOpenChokeCount ≤ m`.
   - The in-file comment ("both sides 0 or the trivial bound") repeats the omission.
   - The allocation names exactly this input ("C3-LA1's `ρ_q < 1` … and `q ≤ m`"), but the derivation never uses it.
4. **A missing bridge in the same derivation: `F = favorableLeaves` vs `leafSet`.**
   - N7's conclusion weighs by `activeWeight … (favorableLeaves (cbGraph m) p*)`.
   - `hW` (N6) and `hZero.2` are stated at `C5LA1.leafSet`.
   - Every weight evaluation in clauses (3)/(4) therefore needs C2-LA3's `cb8_favorableLeaves_eq_leafSet_topRank`. The frozen docstring
     lists it as a permitted input, but the derivation never cites it.
   - The `r ∈ A ∧ v ∉ A` target (weight 0, so `hZero.2` gives a 0 column) is also not treated explicitly.

   None of this makes the statement false. It does make the informal derivation incomplete as written.
5. **Critic-derived advance: N7 `cb8_flowBundle_of_arcSpecs` compiled sorry-free.** This is the step the return leaves open. I wrote
   clauses (3)–(4) in Lean in my own scratch copy and kept U2's clauses (1)–(2) verbatim
   (`LeanProject/LeanProof/Statements.lean`, `476c192f…`, 726 lines; fragments `work/n7_helpers.lean` `2ce034e8…` and
   `work/n7_clauses34.lean` `baa6c4e2…`).
   - **Build.** `lake build LeanProof` exits 0 with 0 errors (`work/build-critic-n7-try1.log`, `18fc927a…`). The `sorry` warning at line
     456 (N7) is gone. What remains is lines 31–244 (N1–N5) and 711 (N8).
   - **Axioms.** `#print axioms E993Transport.cb8_flowBundle_of_arcSpecs` gives `[propext, Classical.choice, Quot.sound]`.
   - **Fidelity.** `diff` against the frozen file shows only the import hunk and three replaced `sorry` lines. The N7 declaration header is
     byte-identical to the frozen text.
   - **Inputs used:**
     - C2-LA3 (`favorableLeaves = leafSet`);
     - C1-LA1's terminal, clauses (iv) Switch and (v) Residual;
     - `cb8Rho_lt_one_topRank` at `q = 1` and at `q = cbOpenChokeCount m A`;
     - the companion;
     - `cbGraph_adj_r_choke`, with `IsIndepSet` taken from `indepFamily` membership.

     These are exactly the inputs the frozen docstring permits.
   - **Proof shape, clause (3) Out.**
     - `r ∉ B`: the E1 row equals `w_F(B)` and the sector row is 0 (`hZero.1`).
     - `r ∈ B`: the E1 row is 0 by the contrapositive of `hE1.2`; independence forces no choke in `B`, so `w = [v ∈ B]`; then `hOut`
       applies, or sector nonnegativity.
   - **Proof shape, clause (4) In, split by target class:**
     - in-sector (`hIn`, `w = 1`);
     - `r ∈ A`, `v ∉ A` (`w = 0`, `hZero.2`);
     - `r ∉ A`, `q = 0` (`w = 0`, `hZero.2`);
     - switch image `q = 1`, `v ∈ A`, with `γ = 0` (`w = 0`, `hZero.2`), `γ = 8` (factor `8 − 8 = 0`, and `8ρ_1 ≤ 8`), or `1 ≤ γ ≤ 7`
       (`(8−γ)σ ≤ θγ ≤ (1 − ρ_1)γ`);
     - `q ≥ 2` or (`q = 1`, `v ∉ A`) (the sector column is 0 by `hSw.2`, and `ρ_q w ≤ w`).

     Every target class the protocol names is covered, and weight-zero targets are closed by `hZero.2`. Shared capacity is not an issue
     because the hypotheses are exact column sums.
   - **Status.** This is compiled scratch with no grade. It needs an isolated second read and a governed Stage 7 award.
6. **The `γ ∈ {0, 8}` boundary (attack brief): sound, not an artefact at the N7 level, and removable.**
   - U2's `γ = 0` step uses the junk value `cb8CGamma 0 = 0`, so `σ(0) = 0`. My proof avoids it: `γ = 0` gives `w(A) = 0` by N6, and
     then `hZero.2` zeroes the sector column.
   - At `γ = 8`, U2's remark that `σ(8) = 0` is true (`| _ => 0`) but idle. The factor `(8 − 8) = 0` in ℚ kills the term whatever
     `σ(8)` is.
   - **Where the junk value is load-bearing: N5's text, not N7's.** `cb8GSec_switchImage_inflow` at `γ = 0` asserts the column equals
     `8·cb8Sigma m 0`. The literal column is 0, because `cb8GSec` pays a `u_i`-switch only when `1 ≤ γ`. The two agree only because
     `cb8CGamma 0 = 0`. This belongs to N5's owners and critics, and I flag it for them.
7. **Clauses (1)–(2) "kernel-checkable in isolation" (return line 225).** At U2's build these conjuncts sat inside a declaration that
   still depended on `sorryAx`, and no separate declaration or axiom log isolates them.
   - The claim that they elaborated without error is backed.
   - The claim "genuinely sorry-free proof terms, kernel-checkable in isolation" is **not backed by U2's shipped evidence**. In my build
     they are now kernel-checked as part of the sorry-free N7 (finding 5).
8. **Literal and consistency defects.**
   - "N7 companion an exact rational identity at **20 rows**, `m=107..2393`" (line 214). The shipped output has **25** rows
     (`107..164` step 3, then `200, 299, 401, 2000, 2393`). All are equal, so the count is understated; I correct it to 25.
   - `run2.out.json` is not valid JSON: two plain-text lines follow the object. The digest is unaffected.
   - Line 139 ("not independently build-confirmed") is stale next to line 221 ("BUILD-CONFIRMED"). This is left over from the resumption.
   - "`bounded_evidence` at the informal-derivation level" (line 227) misuses a grade: an informal derivation is not a bounded
     computation. It was, moreover, incomplete (findings 3–4).
9. **Fresh-row discipline.** U2's N6 sampling covered rows 107, 110, 113 and 158, not 161 or 164. Because N6 is proved universally in
   Lean, that is not disqualifying. My instrument adds rows 158, 161 and 164 before any universal reading.

## Mechanism-equivalence and fence check

- **Fence 1, one rank and the class only.** N6 is generic in `m > 0`: it is a graph identity with no rank. The companion and N7 are pinned
  at `p* = (16m+4)/3`, `m ≥ 107`, `m % 3 = 2`. Nothing is claimed at other ranks, residues or `d`.
- **Status transfer.** N7 is a conditional composition (gate ruling 26: per-arc specs in, bundle out). It asserts no (HALL), no flow
  existence and no aggregate status. (HALL), the primary aggregate, TREE, FOREST, TRANSFER and #993 stay OPEN.
- **No Newton or Darroch anywhere.**
- **`θ` is the C1-LA1 closed form `288/L`**, used through C1-LA1's proved feasibility. The `θ*` optimality law is never a hypothesis.
- **No refuted mechanism is revived.** N7 is not the struck R-9/R-10 reduction: its hypotheses are the conclusions of N2–N6, not
  conjunct 4.
- **Reserved name.** `cb8_topRank_eligible_and_weightedHall` occurs 0 times in my scratch `Statements.lean` and 0 times in the frozen
  file (`grep -c`). I declared nothing under it.
- **Claim identity.** No `E993-R31-` key is proposed by U2 or by me. The objects are gate-23 frozen declarations: N6
  `E993Transport.cb8_activeWeight_leafSet_eq`, and N7 `E993Transport.cb8Rho_one_eq_cb8R1_ratio` and
  `E993Transport.cb8_flowBundle_of_arcSpecs`. The governed inputs cited are C1-LA1, C2-LA3 and C3-LA1, at their own scopes.
- **Registered keys.** None is re-confirmed or touched beyond citation. The E1 criterion and favorability keys enter only through
  C3-LA1 and C2-LA3.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| N6 `compiled`, sorry-free, axioms `[propext, Classical.choice, Quot.sound]` | U2 logs; my rebuild and axiom run | **Backed.** Retained. |
| N7 companion `compiled`, same axioms | same | **Backed.** Retained. |
| `FROZEN_NODES_CLOSED: N6, N7-companion` | same, plus byte-identical headers | **Backed.** Retained. |
| N7 clauses (1)–(2) "BUILD-CONFIRMED … kernel-checkable in isolation" | elaborated inside a `sorryAx`-dependent declaration; no isolating log | **Narrowed** to "elaborated without error". The isolation claim is struck. |
| N7 clauses (3)–(4) "complete, hypothesis-by-hypothesis informal derivation" | text, lines 148–199 | **Struck as "complete"**: it misses the `ρ_q ≤ 1` step for `q ≥ 2` / (`q = 1 ∧ v ∉ A`), the C2-LA3 bridge, and the `r∈A∧v∉A` case. Superseded by the critic's compiled proof. |
| "`bounded_evidence` at the informal-derivation level" | — | **Struck** (grade misuse). |
| "exact rational identity at 20 rows" | the shipped output has 25 rows | **Corrected** to 25. |
| N6 Python "1,058,596 checks, 0 failures"; mutation controls | byte-identical replay | **Backed.** |
| every 64-hex digest literal | recomputed | **All match.** |
| "not `formally_verified`" wording; `headline_resolved: no` | — | Correct. The admission defect is adjudicated as no strike. |

## Verdict

verdict: retained_narrowed
headline_resolved: no

U2's two compiled closures are **retained in full**: N6 `cb8_activeWeight_leafSet_eq` and the N7 companion `cb8Rho_one_eq_cb8R1_ratio`.
Each frozen text compiles sorry-free on the Cycle 4 base with the standard axioms and is independently confirmed. The narrowing covers:
- the incomplete informal derivation of N7 clauses (3)–(4);
- the unbacked "in isolation" claim for clauses (1)–(2);
- the grade misuse;
- the row count.

**Critic-derived advance (attributed to C-U2-T).** N7 `cb8_flowBundle_of_arcSpecs` now compiles sorry-free on the scratch base. With
this, N7 (companion and main) and N6 are closed as compiled scratch. The mathematics of N7 is complete as a conditional composition,
grade `proved_informal` for the implication. It is not registered. It carries no status until an isolated second read and a governed
Stage 7 award.

- COND4_formal: no — conjunct 4 not closed; N6 and N7 compile sorry-free in scratch, N1–N5 and N8 remain `sorry`
- E1_formal: no — N1/N2 are not this seat's objects and remain open here
- TERMINAL_integration: no — N8 and the stitch untouched
- cut_candidate: none
- FROZEN_NODES_CLOSED: N6, N7

Attribution for `FROZEN_NODES_CLOSED`: N6 and the N7 companion were closed by U2 (route `C4-U-02`, Claude Sonnet 5). N7 main
(`cb8_flowBundle_of_arcSpecs`) was closed by this critic (`C-U2-T`, Claude Opus 5.5) in `scratchpad/c4-crit-U2-T/`.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

A successor inherits the following, stated exactly:
1. **An isolated second read of the critic-derived N7 proof.**
   - What to read: `scratchpad/c4-crit-U2-T/LeanProject/LeanProof/Statements.lean` (`476c192f…`), declaration
     `E993Transport.cb8_flowBundle_of_arcSpecs`.
   - How: rebuild copy-out-first from the controller cache, `#print axioms`, and `diff` the header against
     `control/C4-FROZEN-STATEMENTS.lean`.
   - Scope: this read covers only the implication "N2–N6 conclusions ⇒ bundle".
2. **A Stage 7 governed award whose terminal is N6.** It may be conjoined with the N7 companion and N7 main (gate ruling 31).
   - Carries: C1-LA1 entry 111, C2-LA3's terminal and C3-LA1's entries 33 and 37, from their governed runs (ruling 19). The proof also
     cites `cb8Rho_lt_one_topRank`, `cb8R_natCast_eq_coeff` and `cbGraph_adj_r_choke`, with provenance recorded.
   - Cleanup: the unused `have h4 … := rfl` in the critic's clause-(4) proof is cosmetic and should be dropped at Stage 7.
3. **Conjunct 4 still needs N1–N5 (the other seats) and N8 (U3).** N7 is a conditional: it transfers nothing until those hypotheses are
   discharged.
4. **For N5's owners and critics: the `γ = 0` instance of `cb8GSec_switchImage_inflow` holds only through `cb8CGamma 0 = 0`** (finding 6).
   A proof of N5 must use that definitional value, or the frozen text must be read as intended.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-U2-T/`.

- **The Lean project:** `LeanProject/`. Base files copied byte-identically from `sources/c4-base/`; `.lake/build` copied from the
  controller cache; `.lake/packages` is a symlink.
  - `LeanProject/LeanProof/Statements.lean` `476c192f7b7713cd751df0507748a33ed2fc1718a64a91f70a32a01c191c5cc9`. U2's scratch plus the
    critic's N7 clauses (3)–(4). `work/new.lean` is an identical staging copy.
  - `LeanProject/work/AxiomCheckCritic.lean` `71254dd030f8d1142a12f5ce69471287a2544ef4b3b86e1e89a0cefe7717f3f8`.
- **Build and axiom logs:**
  - `work/build-replay-U2.log` `472e86c39d5b525e8c3caccc24bf0aa4d8b7ea20e0c3565ea3ef4dd0e2ec33d6`: the replay of U2's file, exit 0.
  - `work/build-critic-n7-try1.log` `18fc927a117803b95ae34f1943501e12ee4f23cab051dd22962f1ce2b8a1a74f`: the critic's N7 proof, exit 0.
  - `work/axioms-critic.log` `cf228c66eb0b2ae3084e159d4106bd9a6a80cd966eea0a3ba43f2f23548ebbac`. `work/axioms-critic.err.log` is empty.
- **Proof fragments:** `work/n7_helpers.lean` `2ce034e846cb91828a0afe0fa40137b85235e79ad3212c6f6c935085af414ca2` and
  `work/n7_clauses34.lean` `baa6c4e204ffa359c01ab949e445c9a20e531f3dafa546089c7f26c70b94e3b6`.
- **The critic's Python instrument:**
  - Script `work/crit_n6_n7.py` `50e65ecfcb5127a6dc3488ed34c2c06f7dbefed8f9d0a3c60b648e347d501c32`. Imports: `hashlib`, `json`,
    `random`, `fractions.Fraction`, `math.comb`.
  - Output `work/crit_run1.out.json` `a43ad5baba1971dbe249a6377c80a60c18dd6abdcaa3527eba58888f25f328a0`.
  - Replay command:
    `cp work/crit_n6_n7.py replay/ && cd replay && python3 -B crit_n6_n7.py > crit_replay.out.json`. The result is byte-identical,
    `a43ad5ba…`.
- **Replay of U2's generator:** `replay/check_n6_n7companion.py` `aa3adc83…` produces `replay/replay.out.json` `774857c8…`, identical
  to U2's.

**Read-boundary disclosure.** My reads were:
- the two boot files, the dispatch and the capsule's 16 files;
- the Stage 2 members `control/C4-FROZEN-STATEMENTS.lean` and `control/C4-WORKER-COMMON-BRIEF.md`, which the common brief binds on
  critics;
- `sources/c4-base/**` and `sources/mathlib-binding/PIN.json`;
- U2's inventoried scratch, `scratchpad/c4-U2/` and `scratchpad/c4-U2-replay/`. I used non-recursive `ls` on named subdirectories and
  hashed or read the named files.
- the controller cache directory `scratchpad/c4-base/LeanProject/.lake/` (`ls`, `du`, and a copy of `build/`), as the attack brief
  directs;
- one Mathlib file, `Mathlib/Data/Finset/Empty.lean`, grepped for a lemma name to get its API meaning.

I ran no search rooted above my grant. I read no sibling return, critique or adjudication. In `cycles/cycle-4/stage4/critics/` I made
my own `U2/T` directory. I noticed the sibling seat directories there but did not open them.

The harness placed the project `CLAUDE.md`, the user's auto-memory index and the user's e-mail in context before the first tool call.
I did not open, cite or act on any of them.

**Background jobs:** none were started. Every build, axiom check and Python run went in the foreground, so there was nothing to kill.
