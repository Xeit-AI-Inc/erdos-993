# Critique

Critic `C-F1-U` — Cycle 4 Stage 4 of r31 (Erdős #993, CB(8,m) top sector-deficient rank). Cross-orientation critic, orientation U
(formal / structural), of seat `F1`'s return: route `C4-F-01`, mechanism token `FROZEN-STATEMENT-AND-DEFINITION-FIDELITY-SIGNOFF`,
orientation F (falsify). Return: `cycles/cycle-4/stage3/returns/F1/RETURN.md` (SHA-256
`8ed53ba1683b1a4b5e34fa59cc9dfd4099b9a76c70ba9652bfe5c28c5c201fcd`, 28,248 bytes). F1's claimed verdict: `bounded_evidence`.

**Boot.** I am operating within VerityOS. RESTRICTED BOOT: I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file outside the run root. I did not follow the startup
protocol's task-type map into memory, conversations, modules, skills, logs or decisions. No conversation log was written. The
dispatch's single-deliverable rule governs this seat. Subsystems loaded: the two boot files, then the capsule (below).

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Read-boundary disclosures.**
1. *Capsule plus protocol-named Stage 2 members.* I read the 16 capsule files. I also read three Stage 2 members that the binding
   protocol or common brief names as readable: `control/C4-FROZEN-STATEMENTS.lean`, `control/C4-FROZEN-STATEMENTS.md` and
   `control/C4-WORKER-COMMON-BRIEF.md`. Under `sources/`, which is authorized, I read `sources/c4-base/`, the carried-definition sources
   (`sources/r30/lean/*/…/Snippets/`, `sources/first-interior/c2-primary-v2/…/Snippets/`, the r31 C1-LA2 and C3-LA1 run files) and the
   specific line ranges of two frozen Cycle 3 records cited by the frozen companion. Those two records are
   `sources/c3-results/cycles/cycle-3/stage6/SYNTHESIS.md` and `sources/c3-results/cycles/cycle-3/stage5/adjudicators/U/ADJUDICATION.md`.
   I read them by script, one cited line range at a time. I took the dispatch's "do not read … adjudications" to mean this cycle's paired
   adjudications. A Cycle 3 adjudication frozen under `sources/` is a Stage 2 member, and the attack brief asks for exactly this
   re-verification. I disclose the reading so the controller can overrule it.
2. *Hash-only reads by the replayed generator.* F1's `verify_seals_and_digests.py`, replayed copy-out-first, hashes four files outside my
   capsule: `control/CHECKPOINT-ANALYSIS-C3.md`, `cycles/cycle-4/stage2/ROUTE-STATE.md`, `OBLIGATIONS.csv` and
   `control/CLAIM-IDENTITY.run-local.json`. It computes digests only. I did not open, display or use their contents. I did not open
   `control/CHECKPOINT-ANALYSIS-C3.md` myself, so its seven citations are not checked here (see `## Remaining obligation`).
3. *Mathlib API lookup.* I ran a `grep` inside the pinned Mathlib package directory (`Mathlib/Data/Finset/`, `Mathlib/Order/`) for lemma
   names. The worker brief authorizes this. I ran no search rooted above a granted directory.
4. *Tool-hygiene incident (disclosed, no effect).* One file generator was passed to the shell as an UNQUOTED heredoc. The shell then ran
   backtick spans of Lean docstrings as commands. Among them was macOS `open scoped Classical`, which reported "files … do not exist".
   The others failed with "command not found". Nothing was created, modified or opened. I deleted the corrupted output file
   (`LeanProject/LeanProof/CriticF1U.lean`) and regenerated it from files written directly (`CriticF1U.tail.lean`,
   `assemble_critic_lean.py`).
5. *Harness context.* Before my first tool call, the session context already held the project `CLAUDE.md`, a memory index and the user's
   e-mail, injected by the host. I relied on none of them.
6. *Processes.* I ran one background job: a cold `lake build LeanProof` of my copy of the base, PID `10205`. I polled it only with
   `kill -0 10205`. It exited ("Build completed successfully (8661 jobs)") before this file was written. I ran no process listing,
   used no network, installed nothing, and ran no `lake update`, `lake clean` or `--no-cache`. I always `cd`'d into the project first.

## Identity and seal audit

| Object | Recorded | Recomputed (this critic) | Result |
|---|---|---|---|
| Dispatch `control/dispatch/c4-stage4/DISPATCH-C-F1-U.md` | `efe91173c100f6e9ff388c84e70d2242c49f5eaaffe5b2e64c350d5f8de5735b` | `shasum -a 256` | MATCH |
| Capsule `F1-PACKET-MANIFEST.json` inner seal | `647ec046ad46f139cb6e4d083914348ec7cf12c5157872e637d0a7850cd2778f` | canonical JSON minus `seal_sha256` | MATCH |
| 16 capsule members (sha256 + bytes) | capsule entries | recomputed | 16/16 MATCH |
| Stage 2 seal | `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387` | recomputed | MATCH |
| Stage 3 packet seal | `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e` | recomputed | MATCH |
| Stage 4 dispatch seal | `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023` | recomputed | MATCH |
| F1 return | admission record `8ed53ba1…201fcd` | recomputed | MATCH |
| F1's Stage 3 dispatch digest (return line 14) | Stage 3 manifest `d03f9aaf5bb9d0159312ea8977a75034009972096759192a44de571125afa84a` | literal in return | MATCH |
| F1's six inventory digests (`bcc9a73a…`, `84fe8f10…`, `343e4afb…`, `bfbacf86…`, `0050219f…`, `9c783041…`) | inventory | recomputed on `scratchpad/c4-F1/` | 6/6 MATCH |
| F1's other literals (`1388fa52…`, `b3f358ab…`, the C1-LA2 `Main.lean` `a906ec17…` (by registry), the SR-C3-2/3 digests) | registries/receipt | recomputed | MATCH |
| `control/C4-FROZEN-STATEMENTS.lean` = `sources/c4-base/…/Statements.lean` | `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1` | both files recomputed | byte-identical |

The capsule seal is `647ec046ad46f139cb6e4d083914348ec7cf12c5157872e637d0a7850cd2778f` (verified).

**Replay (copy-out-first, `scratchpad/c4-crit-F1-U/replay/`).** All three F1 generators exited 0. Each wrote output byte-identical to
the shipped `*.out.txt` (`cmp` clean): `ALL_CHECKS_PASS: True`, `R11_TOTAL_DEFECTS: 0`, `ACYCLIC_AND_LAYERED: True`. A replay confirms
reproducibility, not correctness. Its weight is judged below.

**Admission defect for F1** (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`). There are three occurrences:
- Line 269 cites the governed award C3-LA1 as `formally_verified` at its exact scope. That is allowed.
- Lines 272 and 283 are negations ("No `formally_verified` label is applied…", "never labels its work `formally_verified`").

No scratch is labelled `formally_verified`. Adjudication: allowed; nothing struck.

**Claim identity.** The claims touched are those F1 names: the Tier 1 object; the criterion key
`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`; `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`;
`E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`; `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`;
`E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN) and `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN), both untouched;
and `E993-TREE-REAL-ROOTED` (REFUTED), cited only as a fence. Neither F1 nor this critic proposes an `E993-R31-` key, so the alias check
is vacuous. F1 changes no grade, and neither do I.

## Independent re-derivation

Every item below uses my own instrument, built from the contracts and the frozen sources. None re-runs F1's scripts as evidence.

**D1. Which definitions do the frozen texts actually elaborate against?** (`defs_byte_compare.py`)

F1 read the carried definitions in r31 C1-LA2's `Main.lean`. The frozen texts, however, elaborate on `sources/c4-base/`, and
SEMANTIC-CONTRACT names r30's awards as the Lean sources of record. I extracted entries 1–22 by their `VERITYOS ENTRY` markers and found:
- Base entries 1–22 are byte-identical to r31 C1-LA2's entries 1–22 (22/22), so F1's reading transfers to the base.
- Base entries 1–21 are byte-identical to the `Snippets/` 0001–0021 of four r30 awards: C1-LA1, C4-LA1, C5-LA1 and C6-LA2.
- Base entry 22 (`C5LA1.crossingIndex`) is byte-identical to first-interior `0014-definition-C5LA1-crossingIndex`.
- r30 **C1-LA2**'s snapshot of entries 14–21 is the one textual variant. It wraps the declarations in `open scoped Classical`, has no
  docstrings, and lacks the base's `open Classical in` on `favorableLeaves` and `WeightedHall`. Its declaration text is otherwise
  identical after stripping comments, docstrings and `open` lines.

This matters because N8's proof must carry r30 C1-LA2's entries 30–31. I therefore kernel-checked that the variant is the same object
(D6).

**D2. The six definitions against SEMANTIC-CONTRACT §1, read clause by clause from the base text.**

| Contract object | Base text | Reading |
|---|---|---|
| Relation (D) ∪ (S) | `transportRel` (entry 19) | Textual match, `|N(u) ∩ B| = 2` and `u ∉ B` included. |
| `IsSaturatingFlow` (entry 20) | ℕ-valued `f` | Positive only on `I_{p+1} × I_p` arcs of `transportRel`. Row sums are *equal to* `activeWeight G F B` on every `B ∈ I_{p+1}`. Column sums are *at most* `activeWeight G F A` on every `A ∈ I_p`. Direction correct: saturate supply, respect capacity. |
| (HALL) | `WeightedHall` (entry 21) | Sums over `X ⊆ I_{p+1}` against `(I_p).filter (∃ B ∈ X, transportRel B A)`, which is exactly `N(X) ∩ I_p`. |
| Selector `F_p` | `favorableLeaves` (entries 18, 3, 2) | `i_{p+1}(T − v) − i_p(T − v) < 0` on `leafSet`: the index of record (gate ruling 16), not one rank low. |
| Witness set | `tagWitnesses` (entry 15) | `N(support v) \ {v}`. `support` is `Classical.choose` of the unique neighbour on `IsGraphLeaf`. |
| First descent `x` | `crossingIndex` (entry 22) | `Nat.find` of `i_{k+1} − i_k < 0` in ℤ. `indepSetCount` is a `Finset.card`, so counts are zero above `α` and `Δ_α = −i_α` counts. |

My reading agrees with F1's items 1 and 3–7.

- **`activeWeight`.** F1 needed the step `v ∉ W_v` to reconcile the `B.erase v` form with the contract. It is right. I proved the
  equivalence as a lemma (D6, `activeWeight_eq_contract`).
- **F1 item 2 (imprecise, not wrong).** `3p* < 2α + 1` is not "independent of the graph". `2α + 1 = 18m + 3` uses
  `α(CB(8,m)) = 9m + 1`. On the literal tree that is C2-LA1's formally verified (E), which supplies this conjunct against
  `(cbGraph m).indepNum`.

**D3. The frozen N-chain, text against text.** (`frozen_chain_textcheck.py`, whitespace-normalized)
- N7's seven hypotheses `hE1, hSec, hOut, hIn, hZero, hSw, hW` equal the conclusions of `cb8E1Arc_spec_topRank`,
  `cb8GSec_nonneg_and_support`, `cb8GSec_out_ge_one`, `cb8GSec_in_le_one`, `cb8GSec_zero_classes`, `cb8GSec_switchImage_inflow` and
  `cb8_activeWeight_leafSet_eq`: 7/7.
- N7's conclusion equals N8's `hbundle`.
- N8's conclusion equals the fourth conjunct of the SOLUTION-CONTRACT §2 terminal body:
  `∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f`.

Result: `CHAIN_TEXT_OK: True`. F1 asserted none of this.

**D4. The row-`≥` / row-`=` reconciliation (F1 item 8 and its remaining obligation 2(b)), completed on both sides.**

The move from exact rows to `≥` rows happens in N8. There, the bundle gives `WeightedHall` by summing over `X`, which uses `g ≥ 0`, its
support in `transportRel`, and Out-`≥` and In-`≤`. r30's `exists_saturatingFlow_of_weightedHall` then gives an integral flow with rows
exactly equal. No class split is needed in N8.

The class split is N7's job. Its hypotheses cover every class:
- **Sources `B ∈ I_{p*+1}`:**
  - `r ∉ B`: `hE1` clause (3) gives rows equal to `w`.
  - `r, v ∈ B`: `hW` and independence give `w = 1`, and `hOut` gives at least 1.
  - `r ∈ B`, `v ∉ B`: `w = 0`, and `g ≥ 0`.
- **Targets `A ∈ I_{p*}`:**
  - `r, v ∈ A`: E1 contributes 0 (clause (5)), `hIn` gives at most 1, and `w = 1`.
  - `r ∈ A`, `v ∉ A`: `w = 0`, so `hZero`(2) makes `g_sec` 0 and clause (5) makes E1 0.
  - `r ∉ A`, `q = 0`: `w = 0`, clause (5) and `hZero`(2) apply.
  - `q ≥ 2`, or `q = 1` with `v ∉ A`: E1 contributes `ρ_q w ≤ w` (`cb8Rho_lt_one_topRank`, with `q ≤ m` by `Finset.card_filter_le`), and
    `hSw`(2) makes `g_sec` 0.
  - `q = 1` with `v ∈ A`: `w = γ` and the load is `ρ_1 γ + (8 − γ) σ(γ)`. For `γ ∈ 1..7`, C1-LA1's Switch and Residual (via the ρ₁
    companion) bound it by `γ`. At `γ ∈ {0, 8}` the boundary values are zero; see D6(E) below.

I found no class left uncovered. F1 stated only the source side. This informal derivation is attributed to me. The node is U2's, and
this is not a proof of N7.

**D5. An independent literal instrument on the definitions** (`literal_definition_lab.py`; exhaustive; exact integers).
- *Trees.* CB(8,1) (`n = 20`, `α = 10`, `x = 6`, `|I| = 33573`), CB(2,3), CB(3,2), CB(4,2), CB(2,4) and CB(1,6), built from the contract
  prose.
- *Ranks.* At every rank `p ∈ [1, α − 1]`, `F_p` is DERIVED as the leaves `v` with `i_{p+1}(T − v) − i_p(T − v) < 0` at rank `p`.
- *Checks, with 0 defects everywhere* (`ALL_DEFECTS_ZERO: True`, `result_sha256` `d3f618b269d43888d13fdd6853eb1cf6445d95b862b596d5cfd370c4aa6f605b`):
  - contract-form weight equals Lean-form weight;
  - N6's formula holds on every independent set;
  - `r ∈ B` implies there is no choke in `B`;
  - the source classes (`r ∈ B`, `v ∉ B` gives weight 0; sector gives weight 1);
  - all target classes of D4;
  - every literal arc lands in the independent layer `p`;
  - a sector source's only switches are at `s` or at a choke with `β = 1` (the N4 zero-class enumeration);
  - **(WID)**.

**(WID) from independent sides, with difference indices written textually.**
- *Side A:* `Σ_{B ∈ I_{p+1}} w_F(B) − Σ_{A ∈ I_p} w_F(A)`, from the literal weights.
- *Side B:* `S(T, p) = Σ_{v ∈ F_p} [Δ_{p−1}(T − {v, s_v}) − Δ_{p−1}(T − N[s_v])]`, with `Δ_{p−1}(T − D) = i_p(T − D) − i_{p−1}(T − D)`.
  Side B re-enumerates the independent sets of the deleted forests and never uses a weight (entry 12's formula).
- At CB(8,1): `p = 6, 7, 8, 9` give `560 = 560`, `−336 = −336`, `−1040 = −1040`, `−872 = −872`. `F_p = ∅` for `p ≤ 5`, where both sides
  are 0.
- Five further trees agree at every rank. CB(8,1)'s `|I| = 33573 = 3·(3⁸ + 2⁸) + 2·3⁸` also matches the closed form of record at `x = 1`.

This is `bounded_computation` on small trees. It is not evidence at class rows, which is F2's remit.

**D6. Kernel-checked scratch** (my copy of the base, cold-built; `LeanProof/CriticF1U.lean`, SHA-256
`3992352f1bfe9a5e32d20b3e77820220f64b2eeec2ac681be6a29b32bb685fab`). The file compiles with 0 errors and no `sorry`. Every declaration
depends only on `[propext, Classical.choice, Quot.sound]` (`build-critic-axioms.log`).
- **(A)** Eight theorems, proved by `rfl` / `Iff.rfl`: r30 C1-LA2's `indepFamily`, `tagWitnesses`, `activeWeight`, `layerWeight`,
  `favorableLeaves`, `transportRel`, `IsSaturatingFlow` and `WeightedHall` (snippets 0014–0021 verbatim, nested under
  `namespace R30LA2`) are *definitionally equal* to the base's. The textual variant of D1 is the same object, instance terms included.
- **(B)** `not_mem_tagWitnesses_self` and `activeWeight_eq_contract`:
  `activeWeight G F B = ((F ∩ B).filter fun v => (B ∩ tagWitnesses G v).Nonempty).card` for every finite graph. This closes F1's
  remaining obligation 2(a).
- **(C)** `transportRel_card`: `transportRel G B A → A.card + 1 = B.card` for every finite graph. The network is therefore layered and
  acyclic. This is a proof, replacing F1's 30-random-universe test.
- **(D)** On `cbGraph m`:
  - `cbOpenChokeCount_eq_zero_of_root_mem`: an independent `B` with `r ∈ B` has `q = 0`.
  - `activeWeight_leafSet_eq_zero_of_root_not_v` (`0 < m`): if `r ∈ B` and `v ∉ B`, the `leafSet` weight is 0. This uses Cycle 3 U3's
    compiled scratch `cb8_activeWeight_leafSet_zero_iff` from the base, which is ungraded.
- **(E)** `cb8Sigma_zero_and_eight`: `cb8Sigma m 0 = 0 ∧ cb8Sigma m 8 = 0`, from `cb8CGamma`'s `_ => 0` branch. So N5's
  `(8 − γ) σ(γ)` at `γ = 0` agrees with N4's zero class (2) and with the definition's `1 ≤ γ` switch guard. The boundary is not an
  artefact that could make N4 and N5 inconsistent.

The same build re-prints C3-LA1's terminal `E993Transport.cb8_E1_cloneTransport_topRank` with axioms
`[propext, Classical.choice, Quot.sound]`, reproducing `sources/c4-base/axioms-base.log` from my own rebuild.

**D7. The four citations F1 left unverified, and all others checkable.** (`citation_check.py`)

Every quotation in `control/C4-FROZEN-STATEMENTS.md` whose source is a Cycle 3 synthesis, adjudication or second read was compared
against the frozen copies under `sources/c3-results/`. Those copies are registry-matched (`ca5d99c6…0354`, `11a6a850…e721`, origin
`cycles/cycle-3/…`).
- **31 of 31 match:** full quotations line for line, excerpts as substrings.
- The count includes F1's four gaps:
  - N2 companion: ADJUDICATION lines 341 and 342;
  - N2: ADJUDICATION lines 337–338;
  - N3's definition: SYNTHESIS lines 765–768;
  - N3 image lemma, leg count, Out: SYNTHESIS lines 187 and 792–796;
  - N7: SYNTHESIS lines 153–154, 161–162 and 838–843;
  - N8: SYNTHESIS lines 220–222.
- Seven `control/CHECKPOINT-ANALYSIS-C3.md` citations are outside my capsule and were not checked.

**D8. C3-LA1 closure** (`c3la1_closure_check.py`).
- The run's `Main.lean` is `1388fa52…eb15`, equal to both `source_sha256_before` and `source_sha256_after`.
- The receipt has 11 checks, all `passed`; `verdict.code = verified`; the allowed axioms are exactly `Classical.choice`, `Quot.sound`
  and `propext`.
- The registry matches for `Main.lean`, the report and the receipt.
- The base's `C3LA1.lean` carries 33 entries, all byte-identical to C3-LA1's (33/33). The other 20 C3-LA1 entries sit in base `Main.lean`,
  also byte-identical (20/20). The terminal entry is byte-identical.

This replaces F1's garbled sentence ("equal to the base copy … `C3LA1.lean`'s parent") with an exact statement.

**D9. The R-11 exemptions** (`byte_range_digests.py`). I recomputed three of the 23 literals that F1's scanner exempts, and all three
reproduce from the frozen sources.
- `d1fc50df…2dcf41`: the ChokeState copy, lines 2673–2734 of `sources/c2-stage7-sources/U2/…/Main.lean`, newline-terminated. MATCH, and
  the segment sits byte-identically in base `ChokeState.lean`.
- `c8f56fa8…2726779` and `13aca55c…99923d`: the E1 copy before and after the `cb8G → cb8E1G` rekey (2 occurrences). Both MATCH, but only
  for lines **21–230** plus line 326. Line 230 is a blank line. The frozen companion and the base header both say "lines 21-229", which is
  a description slip, not a byte defect. The rekeyed segment is exactly the tail of base `E1FlowConstruction.lean`.

The other 20 exempted literals name `scratchpad/c4-gate-statements/` files, which lie outside my grant.

## Attacks and findings

1. **Definition fidelity: holds.** F1's readings are correct, and each is now anchored in the base the frozen texts use (D1, D2). The
   one textual variant among the r30 sources of record is kernel-checked definitionally equal (D6(A)).
   - **Finding F-1 (scope, narrows F1):** F1 audited C1-LA2's copy and did not compare the base against r30's `Snippets/`. The gap is
     closed here with no defect.
2. **Clause-by-clause audit of N1–N8: partial in the return.**
   - **Finding F-2 (scope, narrows F1):** Allocation item (i) asked for each frozen statement to be audited clause by clause against
     its informal source and SEMANTIC-CONTRACT. The return delivers verbatim *transcription* checks on part of the citations plus an
     ℕ-subtraction guard audit. It does not read the statements' clauses against the contract.
   - I supplied the structural half: the N2–N8 chain identity (D3), the class coverage of N7 (D4), N5's boundary (D6(E)), and N4's
     switch enumeration on the literal instrument (D5). All 31 checkable quotations are now verified (D7).
   - Not covered, by F1 or here: a semantic reading of N1's three count identities and N3's Out bridge against the contract. Those
     belong to T1/U1/F3 and T2.
3. **ℕ subtraction, integer division and casts: F1's guard audit confirmed.**
   - N2 and N7: `8 * cbOpenChokeCount m A - 1` is guarded by `1 ≤ q` on the face. `m - q` and `(16m+4)/3 - q` are safe by
     `cbOpenChokeCount_le`, which is trivially `Finset.card_filter_le`.
   - The ρ₁ companion's `8*1-1`, `m-1` and `(16m+1)/3 - 1` are safe under `107 ≤ m`.
   - N5's `8 - γ` is in ℚ.
   - `cb8R1`'s `8*m - 7` and `k - i` are safe for `m ≥ 1` and `i ≤ min 7 k`.
   - The statements that carry no class hypothesis (N3's Out bridge, N4's In bridge and zero classes, N5) use `⌊(16m+4)/3⌋` at every `m`.
     Each is a genuine for-all-`m` claim, and at `m = 0` the hypotheses are vacuous. I found no statement whose truth depends silently on
     `m ≡ 2 (mod 3)`.
4. **Direction of inequalities.** `IsSaturatingFlow`: rows `=`, columns `≤`. N7/N8 bundle: rows `≥`, columns `≤`. `WeightedHall`: supply
   `≤` neighbourhood capacity. All directions are correct, and the reconciliation is sound (D4).
5. **Acyclicity.**
   - **Finding F-3 (evidence weight, narrows F1):** `ACYCLIC_AND_LAYERED: True` rests on 30 random symmetric universes with `n ≤ 6`,
     plus an unwritten potential-function remark. The DFS is not a second *instrument* for a universal statement; it is bounded evidence.
     The universal fact is now proved (D6(C)).
6. **C3-LA1 closed: confirmed** (D8, D6).
   - **Finding F-4 (certification wording, strike):** "its base copy's axiom footprint matches its own award's receipt from a second,
     independent rebuild (the base project)". F1 ran no Lean. The base log is a controller record. The words "independent rebuild" as
     F1's evidence are struck. The fact itself is reproduced by my cold rebuild.
7. **R-10: confirmed** (0 occurrences in the frozen texts and base, per F1's replayed scan). R-11 has two problems:
   - **Finding F-5 (accounting error):** The return says "36 literals total; 11 … MATCH exactly; 23 … self-declared". 11 + 23 = 34. The
     replayed output shows 34 literals in the companion (11 matched, 23 exempt) and 2 in the gate (both matched): 13 matched, 23 exempt.
   - **Finding F-6 (certification, narrow):** The scanner exempts a literal whenever its *line* contains the marker
     `scratchpad/c4-gate-statements/` or "Copied bytes SHA-256". The exemption never checks the literal. `R11_TOTAL_DEFECTS: 0` therefore
     means "0 defects among the 13 registry-checkable literals, 23 unverified exemptions", not a verification of all 36. Three of the 23
     now verify (D9), leaving 20 unverified.
8. **Read boundary.** F1's two out-of-grant non-recursive listings are disclosed and minor. The files they sought exist as frozen copies
   under `sources/c3-results/`, which F1 was authorized to read. The gap was avoidable, and it is now closed (D7).
9. **Numeric rows.** F1 reports no row value, so gate ruling 29 does not bite. My own rows (D5) are small-tree values with every
   difference index written textually.

## Mechanism-equivalence and fence check

- The mechanism token `FROZEN-STATEMENT-AND-DEFINITION-FIDELITY-SIGNOFF` is an audit. It revives no refuted mechanism (fence 6) and
  applies Newton or Darroch to nothing (fence 3). The frozen N1–N8 texts contain no `Δ` of `I`, `G`, `G^m` or any forest polynomial.
- **Fence 1:** nothing is claimed off `p*`, off the class, or for any aggregate. The small-tree instrument (D5) is explicitly off-class,
  a check of generic definitions only. Nothing transfers status to the OPEN keys.
- **Fence 7:** no census or bounded check is offered as proof of a universal. F1's DFS is reclassified as bounded evidence; the one
  universal fact it gestured at is now proved.
- Fence 2 (fidelity) is strengthened:
  - the selector is DERIVED at every rank of D5 at the index of record;
  - `x` is computed through `α`;
  - (WID) is asserted from independent sides;
  - the weight, relation and flow definitions are kernel-identical across every r30 source of record (D6(A)).
- The `θ*` law and the r30 bounded record are used nowhere, by F1 or by me.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| Definitions "MATCH" (items 1, 3–7) | the text of C1-LA2; this critic's base comparison (D1) and reading (D2) | backed; now anchored in the base |
| `activeWeight` "MATCH (derived …)" | the `v ∉ W_v` argument | backed; now kernel-checked (D6(B)) |
| item 2 "independent of the graph" | — | imprecise: `2α + 1 = 18m + 3` is C2-LA1's (E) on the tree; wording narrowed |
| item 8 "genuine derivation … found no gap" | source side only | backed on the source side; target side supplied by the critic (D4) |
| SR-C3-2 / SR-C3-3 "exact match, no paraphrase drift" | replay; D7 | backed (all 10 SR-C3-2 and 6 SR-C3-3 citations match) |
| four citations "not independently re-verified" | honest disclosure | gap closed by the critic (D7, 31/31) |
| "no ℕ subtraction … silently unguarded" | the frozen texts | backed (Attack 3) |
| C3-LA1 closed, receipt 11/11, axioms | receipt; D8; D6 rebuild | backed |
| "…from a second, independent rebuild (the base project)" | none by F1 | **struck** as F1's evidence (F-4); fact reproduced by the critic |
| "equal to the base copy at … `C3LA1.lean`'s parent" | — | garbled; replaced by D8's exact 33/33 + 20/20 |
| R-10 "0 occurrences" | replay | backed |
| "36 literals … 11 … MATCH … 23 …" | replay output | **corrected**: 13 matched + 23 exempt (F-5) |
| `R11_TOTAL_DEFECTS: 0` | marker-based exemption | **narrowed**: 0 among 13 checked; 23 exempt unverified, 3 now verified (F-6, D9) |
| `ACYCLIC_AND_LAYERED: True` | 30 random universes, `n ≤ 6` | **narrowed** to bounded evidence (F-3); the universal is proved by the critic (D6(C)) |
| Every cited digest "independently recomputed" | replay; this critic's table | backed |
| Grades unchanged; no `formally_verified` label on scratch | text | backed; admission defect adjudicated (allowed) |

Per SOLUTION-CONTRACT §4, this critic's own declarations (D6) are compiled scratch with **no grade**. The build log is
`build-base.log` (cold build of the copy, 8661 jobs, exit 0, 20 `sorry` warnings, all in the frozen `Statements.lean`). The axioms log is
`build-critic-axioms.log`.

## Verdict

verdict: retained_narrowed
headline_resolved: no

The headline is Tier 1 formally verified, or refuted by a confirmed cut. Neither this seat nor this critic produces either. F1's
substantive conclusions stand, each re-derived here:
- the carried definitions denote SEMANTIC-CONTRACT §1's objects;
- C3-LA1 is closed;
- the reserved name is absent;
- no frozen statement is found false.

The return is narrowed on four points:
- **Scope:** item (i) is transcription plus a guard audit, not a clause-by-clause semantic audit (F-2); the definitions were audited in
  C1-LA2, not in the base (F-1).
- **R-11:** the accounting (F-5) and the exemption-as-verification (F-6).
- **Acyclicity evidence:** random-universe testing of a universal (F-3).
- **Strike:** the "independent rebuild" attribution (F-4).

Grade of the signoff: `bounded_evidence`, unchanged. The critic-derived advances (D3, D4, D6, D7, D9) are compiled scratch or bounded
checks. They are ungraded and attributed to critic C-F1-U.

COND4_formal: unchanged (no frozen node compiled by F1 or by this critic)
E1_formal: unchanged
TERMINAL_integration: not attempted
cut_candidate: none
FROZEN_NODES_CLOSED: none

## Remaining obligation

What a successor, a Stage 7 panel or the controller inherits, exactly:

1. **Seven checkpoint citations.** These are the `control/CHECKPOINT-ANALYSIS-C3.md` quotations in `control/C4-FROZEN-STATEMENTS.md`:
   - line 186, three times, for the N1 group;
   - line 187 for N2;
   - line 192 and lines 218–221 for N7;
   - line 193 for N8.

   No one has checked them word for word. F1 read the file but reports no check. They are outside my capsule. A controller-authorized
   reader should run `citation_check.py` with that path mapped.
2. **Twenty R-11 literals.** These are the `scratchpad/c4-gate-statements/…` inventory digests, companion lines 897–920. They are
   unverified. The controller, who can read that directory, should confirm them or record them as unverifiable.
3. **Description correction (record, not a defect).** The E1 copy is lines 21–230 plus line 326 of the Cycle 3 U2 source, not "21–229".
   This affects the companion line 11 and the header of `sources/c4-base/…/E1FlowConstruction.lean`. The digests `c8f56fa8…`/`13aca55c…`
   are correct for 21–230 (D9).
4. **Semantic audit not done by anyone in this chain.** No one has read N1's three count identities (the `16m+2` total, `8q` Boolean
   total, and weight increment) or N3's Out bridge clause by clause against SEMANTIC-CONTRACT §2. This is owned by T1/U1/F3 and T2.
   Every other frozen node's statement-level fidelity is covered by D2–D7.
5. **N7 remains U2's node.** D4 is an informal case map showing that N7's hypotheses cover every source and target class. It is not a
   proof and carries no grade. A formal N7 must discharge exactly those classes, including the `γ = 0` and `γ = 8` boundary through
   `cb8Sigma_zero_and_eight`.
6. **The critic's scratch lemmas (D6) are ungraded.** A Stage 7 award that wants the contract form of `activeWeight` or the layering of
   `transportRel` should re-author them under the governed workflow. It should not cite this critique as a certificate.
7. **Everything here is bounded or scratch.** None of it is evidence for or against Tier 1 at unbounded `m`. The composed-flow check at
   rows 158, 161 and 164 (F2) is untouched by this critique.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-F1-U/`.
Python is `python3 -B`, standard library only. The per-script import lists are in each file's header comment:
- `defs_byte_compare.py`: `re`, `os`, `hashlib`, `difflib`
- `citation_check.py`: `re`, `hashlib`
- `literal_definition_lab.py`: `sys`, `hashlib`, `json`
- `byte_range_digests.py`: `hashlib`, `re`
- `c3la1_closure_check.py`: `json`, `hashlib`, `re`
- `frozen_chain_textcheck.py`: `re`
- `assemble_critic_lean.py`: `os`, `hashlib`

| Path | SHA-256 | Role |
|---|---|---|
| `defs_byte_compare.py` / `.out.txt` | `df5062395a65e738dfe6e3988320bf49d845c5b4966d2453f2ef1c87b9ee5b9e` / `da2b412e5f08573cc0f9d4723cc6ac31652e1e4c457befa11e2db1510143f8e3` | D1 |
| `citation_check.py` / `.out.txt` | `ee8ce44c7357332d21ec1d8d837f04427d8dcb2e47b3a3cd848bd4e41f8d6565` / `ddcaf5e5d2d56169cdc81bb68f1ade7d2209c8984b0c6e8a56e1b377a6b56279` | D7 |
| `literal_definition_lab.py` / `.out.txt` | `fc2e9272c6b89f4c6b6f3f6187df44cda448d2dc92974a4408330d64d067a116` / `bd7ed3fcaff261fc63d10f2a40f17d05a2b460c39dba5a38238b6252e5f75b8d` | D5 |
| `byte_range_digests.py` / `.out.txt` | `7b1d4cc86930423f70c52ddb43a535c50b1f2079cc65f707a2655efae6dfee23` / `3e6ae226fec2b63702d283da74aa9829a11e4b8ebba4f520eb37de541b10b6b6` | D9 |
| `c3la1_closure_check.py` / `.out.txt` | `99e07aeb731fe3868007a7c5b7b9ad369a3485966e504a1f87f795e1d6208f53` / `c9c19ed287191110a1c3a686c16bafe4d234b225f9fbd0dd641b9eb7fd0b61f3` | D8 |
| `frozen_chain_textcheck.py` / `.out.txt` | `43f74be6dc6cf2a8970a680cfbd90a579e0ebb4310d5c8cb813fdecd18a6e4fc` / `504975f912f9368bcb59f25e7f3f34ef3a0db132820510a75e48da8d9b49c369` | D3 |
| `assemble_critic_lean.py` / `.out.txt` | `7b49e48114cdf257c2f49b21d96b071d31f671808f9de88d626ea4f53811c784` / `1e2222a61f97fe230c470755368e32130067b28e3785cba6a102d8e447da187e` | builds `CriticF1U.lean` |
| `CriticF1U.tail.lean` | `bf3ce569382d0dafb29cd5533f3e6bea034c3ad6a860d70e8a3da04e459cee4e` | D6 source (critic's own part) |
| `LeanProject/LeanProof/CriticF1U.lean` | `3992352f1bfe9a5e32d20b3e77820220f64b2eeec2ac681be6a29b32bb685fab` | D6 (compiled scratch, ungraded) |
| `LeanProject/` | base files byte-identical to `sources/c4-base/` (9 digests re-verified); `.lake/packages` symlinked to the pinned shared project (Mathlib `905b9581…` per PIN) | cold rebuild |
| `build-base.log` | `c33c979ef8ac4a4485b1ba00d4b243de274645f8167e305037e603507c82be50` | build log (8661 jobs, success, 0 errors) |
| `build-critic-axioms.log` | `c7d7ae18ed55dad7c956449b029e199d7e1b7bc605b4dd7cb259e0226bdb52da` | `lake env lean` + `#print axioms` log |
| `replay/*.py`, `replay/*.out.txt` | byte-equal copies of F1's six inventoried files | copy-out-first replay inputs |
| `replay/*.replay.out.txt` | `84fe8f10…`, `bfbacf86…`, `9c783041…` (identical to F1's shipped outputs) | replay outputs |

Replay (copy-out-first; run from the scratch directory):

```sh
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-F1-U
for f in defs_byte_compare citation_check literal_definition_lab byte_range_digests c3la1_closure_check frozen_chain_textcheck; do python3 -B $f.py; done
python3 -B assemble_critic_lean.py && cd LeanProject && lake build LeanProof && lake env lean LeanProof/CriticF1U.lean
```

Background jobs: one, PID `10205` (`lake build`). It had exited before this file was written, as verified by `kill -0`. None remain.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
