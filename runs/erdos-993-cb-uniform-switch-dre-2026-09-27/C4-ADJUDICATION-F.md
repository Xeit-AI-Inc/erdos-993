# Orientation Adjudication

Isolated Stage 5 adjudicator, orientation F (falsify), Cycle 4 of r31 (Erdős #993: a parameter-uniform switch-using Hall
certificate on CB(8,m) at the top sector-deficient rank). Portfolio: the returns of seats `F1` (`C4-F-01`), `F2` (`C4-F-02`) and
`F3` (`C4-F-03`), and their six cross-orientation critiques (`C-F1-T`, `C-F1-U`, `C-F2-T`, `C-F2-U`, `C-F3-T`, `C-F3-U`).
Clock at write: Tue Sep 29 2026, about 00:50 EDT.

**Boot.** I am operating within VerityOS. This was a restricted boot: I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch
`control/dispatch/c4-stage5/DISPATCH-ADJ-F.md`. Its SHA-256 `ac91638d05aad0188551e37dda8c96be80aee9a423826922e95778994fca6e04` was
recomputed with `shasum -a 256` and matched before I followed it. I did not follow the startup protocol's task-type map into memory,
conversations, modules, skills, logs or decisions. I wrote no conversation log, because the dispatch's single-deliverable rule
governs this seat.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Read-boundary disclosures.**
1. *Harness context.* Before my first tool call, the host placed the project `CLAUDE.md`, the user auto-memory index (which names
   this run and earlier r31 cycles) and the user's e-mail into my context. I did not open them with a tool, and I relied on none of
   them.
2. *Hash-only reads.* To verify "every listed digest" (protocol check 1), I recomputed the SHA-256 of every file listed by the
   Stage 2 (6,084), Stage 3 (42) and Stage 4 (66) packet manifests. Those lists include other orientations' returns, critiques and
   dispatches. Their bytes were hashed and compared. Nothing was displayed, and I read no content of any file outside my capsule.
3. *Reads under `sources/` (authorized).* I read `sources/c4-base/LeanProject/LeanProof/Statements.lean` in full (byte-identical to
   `control/C4-FROZEN-STATEMENTS.lean`, `0fc723d7…9ede1`) and `sources/c4-base/LeanProject/LeanProof/Main.lean` entries 80–92
   (lines 1719–1950). I ran two `grep` calls, each on one of those named files.
4. *Scratch.* I made non-recursive `ls` listings of `scratchpad/c4-F1`, `c4-F1-replay`, `c4-F2`, `c4-F2-replay`, `c4-F3`,
   `c4-F3-replay`, the six `c4-crit-F*-*` directories and my own `c4-adj-F`, and one non-recursive `ls` of
   `cycles/cycle-4/stage5/adjudicators/` (it did not exist; I created only `F/`). Every replay was copied out first into
   `scratchpad/c4-adj-F/`. The one `find` I ran was on my own scratch directory.
5. *Not run.* I did not run F1's `verify_seals_and_digests.py`, because it hashes four out-of-grant files. Both F1 critics replayed it
   byte-identically. I built no Lean (see `## Lean readiness`), used no network, installed nothing, started no background job and ran
   no process listing.

## Identity and seal audit

| Object | Recorded | Recomputed here | Result |
|---|---|---|---|
| Dispatch `DISPATCH-ADJ-F.md` | `ac91638d…ca6e04` | `shasum -a 256` | MATCH |
| Capsule `control/c4-adjudicator-capsules/F-PACKET-MANIFEST.json`, inner seal | `91e9b5b3a807eeb3e67fdca2c4476f1679a95e359db9b73200933c2d6dbc8d1e` | canonical JSON minus `seal_sha256` (sort_keys, `(",", ":")`, no trailing newline) | **MATCH** |
| 22 capsule members (SHA-256 and bytes) | capsule entries | recomputed | 22/22 MATCH |
| Stage 2 packet seal | `226555ee…7f7387` | recomputed | MATCH; 6,083 of 6,084 members match (see below) |
| Stage 3 packet seal | `2948d6cb…3ea3773e` | recomputed | MATCH; 42/42 members |
| Stage 4 packet seal | `6f34313f…88eda0ee` | recomputed | MATCH; 66/66 members |
| `PATH-CHECK-F.json` | 0 findings over 21 files | read | recorded |
| F returns and critiques in the admission records | `8ed53ba1…`, `61c3a158…`, `2fe57c3f…`; critiques `7f272a1e…`, `57bf293c…`, `cc01b9ba…`, `0a5d1ab3…`, `a61b3ba1…`, `3c789c34…` | against the capsule | all equal |
| 76 inventoried scratch artifacts of the six F-portfolio items | inventories | `inventory_check.py` | 76/76 MATCH, 0 missing |

**Capsule seal (reported): `91e9b5b3a807eeb3e67fdca2c4476f1679a95e359db9b73200933c2d6dbc8d1e`.**

**Record fact (not a defect of my portfolio).** The Stage 2 manifest records `control/r31_tool_c4.py` at `0f98f5c4…6b70`
(58,894 bytes). The live file is `7ee7cb5d…ea3e` (59,025 bytes, mtime 2026-09-29 00:05). The Stage 3 and Stage 4 manifests both
record `7ee7cb5d…`. The admission tool was therefore revised after the Stage 2 seal and before the Stage 3 seal, and the revision is
sealed from Stage 3 on. No F-portfolio claim depends on it. The controller should confirm that the revision is recorded.

**Admission defects in my portfolio.**
- `FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN` at F1 and F2. Each occurrence is a citation of a governed award's grade or a negation.
  Four critics say so independently, and I confirm it on the text. **Allowed; nothing struck.**
- `DIGEST_LITERAL_UNMATCHED` ×2 at F3 (`3527a38b…44bd`, `4ad0c6f4…76fe`). These are stdout digests, not file digests. My own
  copy-out replay (`scratchpad/c4-adj-F/replay-F3/`) prints both exactly, and `run_all.out` is byte-identical to C-F3-U's replay
  (`aa23967e…2fba`). **Cured.**
- The F2 stdout literals (`ee183557…`, `eb30e121…`) are digests of emitted text without a trailing newline. Both F2 critics
  reproduced them. The convention is unstated on the return's face: this is a label correction only.

**Controller facts record** (`C4-STAGE5-CONTROLLER-FACTS-F.json`). It reports N1–N8 closures observed in T- and U-portfolio scratch.
These are facts, never authority, and they concern scratch outside my grant. I did not open any of it and I give it no evidential
weight. None of those closures is in my portfolio.

## Route-by-route decisions

### F1 — `C4-F-01`, `FROZEN-STATEMENT-AND-DEFINITION-FIDELITY-SIGNOFF`

Critics: C-F1-T `retained_narrowed`; C-F1-U `retained_narrowed`. **Adjudicated: retained_narrowed.** Grade: `bounded_evidence` (a
signed fidelity audit; no theorem).

Claim-by-claim resolution:

| Claim | C-F1-T | C-F1-U | Ruling |
|---|---|---|---|
| Six carried definitions, `crossingIndex` and the selector denote SEMANTIC-CONTRACT §1's objects | stands (two independent transcriptions; (WID) and Hall ⇔ max-flow on 285 random-tree rows and small CB) | stands (clause-by-clause reading from the **base**; kernel-checked `rfl` equality of r30 C1-LA2 snapshots 0014–0021 with the base, `CriticF1U.r30la2_*`) | **Stands.** The kernel-checked definitional equality (C-F1-U) outweighs any reading. It is compiled scratch, ungraded. |
| The `B.erase v` versus `B` step in `activeWeight` | stands (informal) | proved: `CriticF1U.activeWeight_eq_contract`, sorry-free, axioms `[propext, Classical.choice, Quot.sound]` per `build-critic-axioms.log` | **Stands.** Critic-attributed lemma (C-F1-U), ungraded. |
| F1 audited the definitions in C1-LA2's copy, not in the base | closed: entries 1–22 byte-identical (22/22) | closed: the same, plus r30 `Snippets/` 0001–0021 and first-interior 0014 | **Narrowing upheld; gap closed by both critics.** |
| "C3-LA1 … not yet in the U3-derived base per open question 2"; "the 20 non-`Main.lean` entries" | **struck** (ruling 24(2)/25; 33 entries in `C3LA1.lean` + 20 in `Main.lean` = 53/53) | "garbled"; replaced by 33/33 + 20/20 | **Struck.** Both critics' byte counts agree. |
| "Open question 4 … unresolved by the gate" | **struck** (ruling 24(4) ruled) | not raised | **Struck.** Ruling 24(4) is on the face of the gate I read. |
| "matches … from a second, independent rebuild (the base project)" | struck; replaced by "the controller's base axiom log records the same three axioms" | struck as F1's evidence; the fact is reproduced by the critic's cold rebuild | **Struck.** The fact stands on C-F1-U's shipped `build-critic-axioms.log`, which I read. |
| "36 literals total; 11 … MATCH; 23 …" | wrong count: 13 matched (11 + 2 in the gate), 23 exempt | the same | **Corrected** to 13 matched + 23 exempt. |
| `R11_TOTAL_DEFECTS: 0` | stands (16/16 checkable after 3 recomputed partial digests) | narrowed: the exemption is by line marker and never checks the literal; 3 of 23 now verify; 20 unverified | **Narrowed:** 0 defects among the 16 checkable literals (13 by F1, 3 recomputed by both critics); 20 drafter-scratch literals remain unverified. The two critics do not disagree on the facts. |
| `ACYCLIC_AND_LAYERED: True` | a triviality; not load-bearing | bounded evidence for a universal; the universal is proved as `CriticF1U.transportRel_card` | **Narrowed** to bounded evidence. The universal fact stands on C-F1-U's compiled scratch (ungraded). |
| Item (i), clause-by-clause audit of N1–N8 against sources and contract | not raised | narrowed (F-2): transcription checks plus a guard audit, not a semantic reading | **Narrowing upheld.** The semantic gap for N1 and N5–N8 is now covered by the F3 critics' informal proofs (below). N3's Out bridge remains outside this portfolio. |
| Quotations F1 left unverified (N2, N3 definition, N7, N8) | 31/31 in-grant quotations match (25 exact, 6 excerpts) | 31/31 match | **Closed by both critics.** 7 citations to `control/CHECKPOINT-ANALYSIS-C3.md` remain unverified by anyone in this chain. |
| Item 2, "`3p* < 2α+1` independent of the graph" | not raised | imprecise: `α = 9m+1` is C2-LA1's (E) on the literal tree | **Wording narrowed.** |
| Item 8, the row-`≥` / row-`=` reconciliation | conflates two steps: N7's split proves the rows, N8 reconciles through `WeightedHall` and r30 entries 30–31 | the same, with the target side supplied (D4) | **Upheld.** The critics' informal N7 (1)–(3) and N8 chain are critic-attributed (see `## Established results`). |

Record correction carried from C-F1-U (D9): the E1 copy in the base is lines **21–230** plus line 326 of the Cycle 3 U2 source, not
"21–229". The digests `c8f56fa8…` and `13aca55c…` are correct for 21–230. This touches line 11 of the companion and the header of
`sources/c4-base/…/E1FlowConstruction.lean`. It is a description slip, not a byte defect.

F1's read-boundary disclosure (two out-of-grant `cycles/` listings, no contents opened) is minor and honestly filed. The files it
sought were sealed Stage 2 members under `sources/c3-results/`, inside its grant.

### F2 — `C4-F-02`, `COMPOSED-FLOW-PER-TARGET-AT-FRESH-ROWS`

Critics: C-F2-T `retained_narrowed`; C-F2-U **`rejected`**. The paired critics disagree on the verdict. I resolve it claim by claim
and weigh replays over self-reports.

**Adjudicated: retained_narrowed, to peripheral content only. The allocation's mandatory pass/fail object was NOT delivered by the
seat.** It is delivered at three rows only as a critic-attributed, conditional, bounded result (see `## Established results`).
Grade of what survives: `bounded_computation`.

| Claim | C-F2-T | C-F2-U | My replay / reading | Ruling |
|---|---|---|---|---|
| Part 2 class (a), in-sector inflow `23719/1668587`, `24169/1732469`, `3517/256793`, "ok (≤ 1)" | struck: idle chokes omitted | struck: the same | `adj_template_replay.py` (Lean-parsed tables): true inflows `1668167/1668587`, `1732041/1732469`, `1797115/1797551`; printed = `In(2,0)` only; idle counts 52, 53, 54 | **Struck.** The true values are ≤ 1, so no violation is hidden, but the test missed the binding side by a factor of about 70. |
| The composed flow's E1 half was evaluated | struck: `ρ_q·w` and `out_B2 = w_B2` are the N2 **spec**, not `cb8E1Arc` | struck: the same | Code inspection: `out_B2 = w_B2  # by N2 clause 3` (line 457) | **Struck as evaluations.** The numbers themselves are correct spec arithmetic. |
| "HALL HOLDS for this X" and the three Hall sums | struck: no column of `N(X)` computed | struck: vacuous; `B2` not an explicit set | Code: `capacity_NB2 = out_B2` (line 468); the neighbourhood capacity is written in, not computed | **Struck.** |
| (WID), derived selector, `x` at the rows | absent; network-level conclusions struck under fidelity-first | absent; everything downstream struck | agreed | **Upheld.** The network-level "no violation of any Out/In/Hall bound" is struck. |
| Ruling 29 | not triggered: the index is written textually ("none") | **mandatory rejection** of every numeric row claim: "none" is false, since every weight rests on `F = leafSet` | see ruling below | **Not triggered as a mandatory rejection; the "none" wording is inexact.** |
| "1512/1792 sector sources mismatched by `−σ(γ)`" (pre-fix guard) | not addressed | struck: impossible; only 280 sources carry a switch term | `adj_template_replay.py`: sector sources of `I_7(CB(8,1))` = `C(8,5)·2^5 = 1792`; in state `(1, γ≥1)` = `C(8,5)·5 = 280`; complement 1512 | **Struck.** Corrected to 280 mismatched and 1512 matched. The diagnosis and the fix stand. |
| "every `ρ_q` at m = 158/161/164" | not addressed | overclaim: `q = 1, 2` only | — | **Narrowed** to `q ∈ {1, 2}`. The full range `q ∈ [1, m]` is now established by C-F2-T (P2), C-F2-U and C-F3-T. |
| N1 (B2) "tested" at CB(8,1) | not addressed | struck: no (B2) check in the code | — | **Struck.** (B2) is covered exhaustively by C-F2-U (19,920/19,920), C-F3-T and C-F3-U. |
| Remaining obligation 1 ("universal per-state LP certificate … unverified … T2/T3's object") | struck: C1-LA1 is the governed template certificate | inexact | agreed | **Struck as stated.** |
| "transcribed byte-for-byte" | downgraded to "transcribed" | — | — | **Downgraded.** |
| Fixed points, two-path `ρ` agreement, switch-class arithmetic `γ = 0..8`, `Out(B1) ≥ 1` (one source), CB(8,1) class-free bridges 1792/1792 and 1120/1120, tree check | backed; re-derived | backed as re-derived facts | F2's shipped outputs were replayed byte-identically by both critics | **Stand**, as bounded facts. |

**Ruling on gate ruling 29** (the one real disagreement). Ruling 29 requires critics to reject a numeric row claim whose difference
index is not written textually. F2 wrote its index textually ("none"). Its surviving row numbers are template and spec arithmetic:
`cb8Out`, `cb8In`, `σ`, and `ρ_q` as coefficient ratios. Their indices (`K`, `K−1`, `p*−q`) are fixed in the frozen text. They
consume the selector only through `favorableLeaves (cbGraph m) p* = leafSet`, which is a **governed** fact (C2-LA3, carried in the
base, line 13189 per both F3 critics). Citing a governed award is legitimate; C-F2-T says the same. The risk ruling 29 guards
against, a favorability or descent claim at an unstated or wrong index (ruling 16), is absent: F2 computes no `Δ`. I therefore do
not apply the mandatory rejection. I do record that "none" is inexact, because the weights `w(A) = γ` presuppose that selector. The
decision does not rescue anything of substance: every network-level F2 conclusion is already struck on fidelity grounds (no (WID)),
on which both critics agree. The F3 critics applied the same reading of ruling 29 to F3.

**What F2 did not deliver** (C-F2-T F-4 and C-F2-U 5 agree). The mandatory object was: the orbit quotient; every target class and
every source row; (WID); the derived selector; `x`; row 161 treated structurally; and the small-CB check at every selector-nonempty
rank. None of these was delivered. The small-CB check is also moot for Hall: CB(8,1) and CB(8,2) have **no eligible rank**
(C-F2-T F-4: `x = 6 = ⌊2α/3⌋` and `x = 12 = ⌊2α/3⌋`), a fact the return did not state. F2 honestly self-disclosed and fixed its
switch-guard instrument bug, and no reported Part 0–3 number predates the fix (C-F2-T's timeline check). I record that in its
favour.

### F3 — `C4-F-03`, `FROZEN-TEXT-LEAN-SEMANTICS-FALSIFIER`

Critics: C-F3-T `retained_narrowed`; C-F3-U `retained_narrowed`. **Adjudicated: retained_narrowed.** Grade: `bounded_evidence` (exact
falsification sweeps; 0 counterexamples on N1, N5, N6 and the N7 companion).

| Claim | C-F3-T | C-F3-U | My replay / reading | Ruling |
|---|---|---|---|---|
| 0 counterexamples to N1 (4), N5 (2), N6, N7 companion | confirmed; extended (B3 exhaustive 9,437,184 pairs at `m = 1`; companion at all 298 class rows `107 ≤ m ≤ 1000`) | confirmed; extended (inverse vs forward preimages 33,315/33,315; N5 random at 107/158/161/164; switch capacity `γ = 0..8`) | `run_all.py` replayed: `MASTER_DIGEST_SHA256 4ad0c6f4…76fe`; C-F3-U `classrows.py` replayed byte-identically (`bad3cd61…`) | **Stands**, strengthened by both critics. |
| `exact_transport.py` "cross-validated against … `transport_targets` … on ALL 33,573 … 0 mismatches" | struck: `transport_targets` is never called | struck: the same | `grep`: `transport_targets` appears only at its definition (`falsify_cb8.py:113`) | **Struck.** The substance is restored critic-side: F3's `exact_preimages` agrees with C-F3-U's forward definitional images on all 33,315 targets. |
| N7 probe: "no sector source's literal arc ever lands on an r-free, v-free target" | **false**: the switch at `s` | **false**: the same, exhibited at 107 and 158 | By hand: `N(s) = {r, v}` and a sector source contains both, so `(B∖{r,v}) ∪ {s}` is an (S) image with `q = 0` and weight 0. C-F3-U's `sswitch.py` replayed byte-identically (`96698ee9…`). | **Struck; replaced** by the five-class sector-image classification (C-F3-U advance item 1; C-F3-T's list agrees). No consequence for the frozen texts: N4 `cb8GSec_zero_classes` names the switch at `s`, and the target class has weight 0. |
| "0 mismatches / 46,754 checks" (N1) | struck: the replay prints 20,451 / 20,451 / 126,418 | struck: the same | — | **Struck** (the count). The zero-failure result stands. |
| Mutation M5 "has teeth" | struck: bare arithmetic, never enters the checker | struck: the same | `run_all.py:138` computes `(7 - g) * cb8_sigma(m7, g)` only | **Struck** for M5. M1 stands (262,144 = 2^18). |
| Companion "two syntaxes / independent sides" | — | struck: the same convolution evaluated twice | — | **Label struck.** Equality stands on C-F3-U's independent polynomial expansion and on both critics' informal proofs. |
| Fixed points "reproduced independently and exactly" | struck: no generator; `θ*` is `cb8Theta` evaluated (circular) | narrowed: `x` absent; `θ*` is a formula evaluation | — | **Narrowed** to "the template formula of record evaluates to the recorded values". `x`, `α` and `n` are reproduced by C-F3-T and C-F3-U. |
| "13 class-row cases" | narrowed: 13 per row, 26 total | narrowed: the same | — | **Narrowed.** |
| (WID), selector, `x` not asserted | not needed (no aggregate is evaluated) | recorded, nothing struck (no F3 number depends on them) | — | **Recorded, nothing struck.** F3's claims are definitional identities of frozen texts that do not depend on `S`, `x` or the selector. |
| `hm : 0 < m` load-bearing | also for N1 B3 at `m = 0` (`A = {r}`, `z = v`) | — | — | **Upheld** (critic-derived). The frozen B3 carries `hm`, so the text is correct. |
| Timeline ("written after resumption"; `test_n5_full.py` mtime 08:54) | recorded | recorded | — | **Recorded**: read "run", not "written". No numeric consequence. |

## Cross-route reconciliation

1. **The template is exactly tight at both ends at every class row checked (new adversarial fact).** C-F2-T (P3) and C-F2-U
   (exact DP plus a Lagrangian dual) independently found min `Σ_i Out = 1` over all sector sources and max `Σ_i In = 1` over all
   in-sector targets at 158, 161 and 164 (C-F2-U also at 95 and 107). My own instrument (`adj_template_replay.py`: tables parsed
   from the base text, min-plus and max-plus DP over all leg splittings) reproduces **exactly 1 and exactly 1** at 107, 158, 161 and
   164. C-F2-T's `adv_literal.py` (replayed byte-identically) evaluates the frozen `cb8GSec` literally at the extremal sets:
   row = 1 and column = 1.

   The tightness is structural. Out `= (25m/2·ℓ + OutConst)/D`, and C1-LA1's per-state lemma (base entry 92,
   `OutConst ≥ 5ℓ − 7/2`) sums over `m` chokes with `K = (16m+1)/3` legs to exactly
   `(25m/2 + 5)K − 7m/2 = (200m² + 82m + 5)/3 = D`. That is a polynomial identity; `affine_identity.py` checks it exactly at 1,632
   class rows as a sanity check. The affine separation therefore gives Out `≥ 1` with no slack, and the bound is attained whenever a
   lemma-tight splitting exists, as it does at the four rows. **Consequence (C-F2-T F-7, upheld):** N3's `Out ≥ 1` and N4's `In ≤ 1`
   have zero slack. Any upward rescaling of `cb8GSec`, any nonzero E1 load into targets containing `r`, or any change in the state
   reading breaks conjunct 4 at these rows. N7's proof must carry `≤` and `≥` exactly.
2. **The switch-image class has slack.** `ρ_1γ + (8−γ)σ(γ) ≤ γ` holds for `γ = 0..8`, with minimum slack ≈ `4.25e−3` (107),
   `2.91e−3` (158), `2.85e−3` (161) and `2.80e−3` (164). My values agree with C-F2-T. The margin `(1−ρ_1)/θ` is 34.90, 51.50,
   52.48 and 53.46 (my values agree with C-F2-U). The binding constraints of the composed flow are the sector ends, not the switch
   images.
3. **The composition fails off-class, as expected.** C-F2-U's `cb81_bundle.py`, replayed byte-identically (`a112ca84…`), finds at
   CB(8,1), `p = 6`: 1,400 negative `g_sec` values, 1,736 under-served sources and 1,190 overloaded targets. This is not a cut and
   not a class statement: `m = 1` is off-class and `p = 6 = x` is not eligible. It is consistent with the frozen texts, because
   `cb8GSec_nonneg_and_support`, `cb8GSec_out_ge_one` and `cb8GSec_in_le_one` all carry `107 ≤ m ∧ m % 3 = 2` on their face, which I
   read in `Statements.lean`. It confirms that small-`m` literal work tests only the class-free identities (N1, N3/N4 bridges, N5,
   N6), never the composition.
4. **The three F routes are mutually consistent.** F1's definitional signoff underwrites the literal instruments of F2 and F3.
   Every critic instrument that evaluates `x`, `α`, `n` and (WID) at the rows agrees: C-F1-T, C-F2-T, C-F2-U and C-F3-U (four
   independent codes). The values are `x` = 842/857/873 at 158/161/164, so `x = p* − 2` at 158 and `x = p* − 3` at both 161 and
   164, and `S < 0` at every row.
5. **Two independent informal proof sets agree.** The F3 critics (C-F3-T P-leaves…P-N7; C-F3-U items 1–6) wrote informal proofs of
   the same nine frozen declarations with different decompositions, and they agree on every case. C-F1-T (A4) and C-F1-U (D4) give
   the N7 source and target case maps and the N8 chain, consistent with them. The one dependency both F3 critics flag is also the
   same: N7 main needs `q ≤ m`. That is the frozen N1 companion or `Finset.card_filter_le`, and it is not listed among N7's carried
   facts. U2 must record the dependency; it is a Mathlib lemma, so no new carry is needed.

## Established results

Grades follow SOLUTION-CONTRACT §4. Nothing here is registered. Every critic-derived item is **critic-attributed**, was stated at a
review stage, and needs an isolated second read before registration.

**E-1. Definitional fidelity (F1, narrowed; C-F1-T and C-F1-U).** `transportRel`, `activeWeight`, `IsSaturatingFlow`,
`WeightedHall`, `favorableLeaves`, `tagWitnesses`, `crossingIndex` and `leafSet` in the Cycle 4 base denote SEMANTIC-CONTRACT §1's
objects. C-F1-U's compiled scratch shows every r30 source-of-record variant definitionally equal to the base. Grade:
`bounded_evidence` (audit), with compiled scratch lemmas that are ungraded: `CriticF1U.activeWeight_eq_contract`,
`transportRel_card`, `cbOpenChokeCount_eq_zero_of_root_mem`, `activeWeight_leafSet_eq_zero_of_root_not_v` (which consumes the base's
ungraded scratch `cb8_activeWeight_leafSet_zero_iff`), `cb8Sigma_zero_and_eight` and the eight `r30la2_*` equalities. File
`scratchpad/c4-crit-F1-U/LeanProject/LeanProof/CriticF1U.lean`, `3992352f…5fab`. It contains 0 `sorry`, and the shipped
`build-critic-axioms.log` (`c7d7ae18…2da`), which I read, lists `[propext, Classical.choice, Quot.sound]` for all 14. I did not
rebuild it.

**E-2. C3-LA1 closed and wholly in the base** (both F1 critics): 53/53 entries byte-identical, receipt 11/11 passed, axioms clean.
This confirms a governed award; it is not a new result.

**E-3. Frozen-text falsification: no counterexample** (F3, narrowed; strengthened by C-F3-T and C-F3-U). This covers N1 (all four),
N5 (both), N6 and the N7 companion, under Lean conventions, exhaustively at `m = 1` and by exact sampling at 107/158/161/164. The
companion holds at every class row `107 ≤ m ≤ 1000` (C-F3-T). Grade: `bounded_computation`.

**E-4. Informal proofs of frozen nodes** (critic-attributed; `proved_informal` candidates pending an isolated second read; nothing
compiled in this portfolio).
- **Sector-image classification lemma** (C-F3-U item 1; C-F3-T agrees). Every `transportRel` image of a sector source is one of:
  a leg deletion (in-sector, weight 1); the deletion of `r` or of `v`; the switch at `s`; or the switch at `u_i` with
  `β_i(B) = 1`. The last gives `q = 1`, `v ∈ A`, weight `γ_i(B)`. No sector source reaches `q ≥ 2`, or `q = 1` without `v`. Load
  point: N5 clause 2 and the completeness of N7's case split.
- **N6** `cb8_activeWeight_leafSet_eq` for every `m ≥ 1` and every finset (C-F3-T P-N6; C-F3-U item 3). It fails at `m = 0`, so
  `hm` is load-bearing.
- **N1** `cbOpenChokeCount_le`, B1, B2, B3 for `m ≥ 1` (C-F3-T P-N1c/P-B1/P-B2/P-B3; C-F3-U item 4). B3 needs no independence
  hypothesis.
- **N5** `cb8_sector_switchPreimages` and `cb8GSec_switchImage_inflow` for every `m` (C-F3-T P-N5; C-F3-U item 2). `γ = 0` goes
  through `cb8CGamma`'s wildcard (kernel-checked in `cb8Sigma_zero_and_eight`), and `γ = 8` has an empty preimage set.
- **N7 companion** `cb8Rho_one_eq_cb8R1_ratio` (C-F3-T P-N7c; C-F3-U item 5). `3 | 16m+4` gives `(16m+1)/3 = p* − 1`, and
  `8(m−1)+1 = 8m ∸ 7`. The coefficients agree term by term.
- **N7 main** `cb8_flowBundle_of_arcSpecs` from its seven hypotheses (C-F3-T P-N7 cases (a)–(f); C-F3-U item 6; C-F1-T A4 (1)–(3);
  C-F1-U D4). Carried facts consumed: C1-LA1 entry 111 (Switch, Residual), C2-LA3 (`favorableLeaves = leafSet`),
  `cb8Rho_lt_one_topRank`, and `q ≤ m`.
- **N8** `cb8_conjunct4_of_flowBundle` (C-F1-T A4(ii)): bundle ⇒ `WeightedHall` by the three-line sum chain, then r30 entries 30–31
  ⇒ an integral flow with exact rows. No source-class split is needed.

**E-5. Three-row composed-flow confirmation** (critic-attributed to C-F2-T; C-F2-U's independent per-class DP agrees at every class
inequality). At `m = 158, 161, 164` and `p*`, `f = cb8E1Arc + cb8GSec`, with the frozen definitions and C1-LA1's unscaled
allocation, satisfies:
- rows `≥ w` on every source: sector `≥ 1 = w`; `r`-free `= w`; all others weight 0;
- columns `≤ w` on every target: in-sector `≤ 1`; switch images `≤ γ`; other `r`-free `q ≥ 1` targets `= ρ_q w`; weight-zero
  targets 0.

Hence (HALL-COND) holds for every `X` at these three rows. The `cb8E1Arc` half is evaluated **from its definition** over every
`r`-free class `(q, w)` (P2: 47,844 / 49,675 / 51,541 source classes and 47,937 / 49,770 / 51,638 target classes, 0 exceptions).
The sector half is exact over all leg distributions, **through** the N3/N4/N5 bridges. I replayed `crit_f2t.py` copy-out-first; it
exited 0 with `stdout.log` and `crit_summary.json` byte-identical (`72010eb7…`, `d2d0a291…`).

Grade: `bounded_computation`, STATED. It is **conditional** on two things:
- the E1 class-count reduction (informal, C-F2-T; validated literally, exhaustively at CB(8,1) ranks 1–9 and CB(8,2) ranks 2–4,
  and by sampling at the rows);
- the N3/N4 bridges (validated literally, exhaustively at CB(8,1) and by sampling at the rows; not proved in this portfolio).

It is not an evaluation through r30's PROVED orbit quotient. It is not a `computer_assisted` row certificate. It gives no status
to any key.

**E-6. Adversarial facts** (bounded, several instruments; see `## Cross-route reconciliation`): the template is exactly tight at
both ends; the off-class composition fails at CB(8,1); CB(8,1) and CB(8,2) have no eligible rank; the switch at `s` lands on a
weight-0 `r`-free, `v`-free target.

## Rejected and narrowed mechanisms

- **No cut candidate, no template failure.** No instrument in the portfolio exhibits an eligible deficient `(T, p*, X)` at a class
  row, and every Out/In/Switch/Residual constraint holds exactly at every class row tested. Protocol check 7: no candidate meets
  any of the cut conditions, so there is nothing to second-read. The CB(8,1) composition failure is off-class and non-eligible, so
  it is neither a cut nor a template failure of the class.
- **F2's structured Hall test is rejected as a mechanism.** Writing the neighbourhood capacity in as the row sum
  (`capacity_NB2 = out_B2`) is circular. A structured-`X` test must compute `N(X)` from (REL) and `Σ_{N(X)} w` exactly.
- **F2's representative-instance method is narrowed.** A handful of leg distributions cannot test a template that is tight only
  at specific splittings (E-6). The exact DP over all splittings is the instrument of record.
- **F3's single-direction preimage smoke test is narrowed.** One target and one source against the same module is not a
  cross-validation. The full forward/inverse check (C-F3-U, 33,315 targets) is the instrument of record.
- **Small-`m` literal checks** (CB(8,1), CB(8,2)) are narrowed to class-free identities. They cannot test (HALL) or the
  composition (no eligible rank; off-class template).
- **Fence audit** (all six items): no Newton or Darroch step anywhere; no rank other than `p*` claimed; no class other than
  `m ≥ 107`, `m ≡ 2 (mod 3)` claimed; the `θ*` law is used only as the definition `cb8Theta`, never as optimality; no status
  transfer to (HALL), the primary aggregate or any OPEN key; no refuted mechanism revived. The per-state template is the
  `m`-dependent affine certificate, not the refuted `m`-independent per-choke certificate. `E993-TREE-REAL-ROOTED` stays REFUTED.

## Lean readiness

**No award group originating in orientation F is contract-ready for Stage 7 funding.** The F seats built no Lean. The only compiled
scratch in the portfolio is C-F1-U's `CriticF1U.lean`, which proves fidelity lemmas, not frozen nodes. Condition (b), "compiled
fragments covering named DAG nodes sorry-free", therefore fails for every frozen node within this portfolio. A bounded result never
qualifies.

The F portfolio still supplies the informal route map and the adversarial clearance for these T/U-owned groups:

| Group (frozen text, byte for byte, `Statements.lean` `0fc723d7…`) | (a) complete informal proof, closed DAG | (b) compiled sorry-free here | (c) open nodes | Fences and hypotheses on the face |
|---|---|---|---|---|
| **N6** `cb8_activeWeight_leafSet_eq` | yes (two independent critic proofs; E-4) | no | isolated second read; compilation (U2) | `0 < m`; every finset; `leafSet` tag set |
| **N1** `cbOpenChokeCount_le`, `cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses`, `cb8_nonChokeInsert_weight` | yes (E-4) | no | second read; compilation (T1/U1, ruling 30) | `0 < m` (companion generic); any rank |
| **N5** `cb8_sector_switchPreimages`, `cb8GSec_switchImage_inflow` | yes, via the sector-image classification (E-4) | no | second read of the classification lemma; compilation (T3) | no class hypothesis (true for every `m`) |
| **N7** companion `cb8Rho_one_eq_cb8R1_ratio` + main `cb8_flowBundle_of_arcSpecs` | yes, as an implication (E-4) | no | second read; compilation (U2); record the `q ≤ m` dependency | `107 ≤ m`, `m % 3 = 2`; exact `≤`/`≥` required (zero slack, E-6) |
| **N8** `cb8_conjunct4_of_flowBundle` | yes (C-F1-T A4(ii)) | no | second read; carry r30 entries 30–31 and re-author Cycle 2 U2 Part A (ruling 24(3)) | no class hypothesis |

**Carried fragments these groups need** (entry numbers per the frozen docstrings and the critics):
- C1-LA1 entry 111 (Switch, Residual) and entries 80–92;
- C2-LA3 (base line 13189);
- r30 C1-LA2 entries 30–31 (not in the base);
- Cycle 2 U2 Part A `weightedHall_of_ratFlow_bound` (draft text);
- `cb8Rho_lt_one_topRank`. This is **ungraded base scratch** (`E1FlowConstruction.lean`, derived from C1-LA3 entry 131). Stage 7
  must carry it from a governed award or re-prove it. C-F3-T, C-F2-T and the controller facts all flag this.

**New declarations** these groups would need: none beyond the frozen texts. Optionally, C-F1-U's `activeWeight_eq_contract` and
`transportRel_card`, which must be re-authored under the governed workflow, not cited from this critique.

**Smallest unproved lemma** (formally, in this portfolio): `cbOpenChokeCount_le`, which is one line (`Finset.card_filter_le`).
**Smallest unproved lemma of substance:** the sector-image classification (E-4, first bullet). It carries N5 clause 2 and N7's
completeness, and it needs a second read before any compilation leans on it.

Gate lines for this adjudication (ruling 21 carries; ruling 32 added the last line and applies here):

COND4_formal: unchanged (no frozen node compiled in the F portfolio)
E1_formal: unchanged
TERMINAL_integration: not attempted in the F portfolio
cut_candidate: none
FROZEN_NODES_CLOSED: none

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

Basis. None of the three F seats advanced Tier 1 or Tier 2 by itself. F1 is a bounded audit, F2's object was not delivered, and
F3 is bounded. The orientation's portfolio nevertheless contains, critic-attributed and graded as such:
- informal proofs of every frozen node the F routes attacked (N1, N5, N6, the N7 companion, N7 main) and of N8;
- the fidelity signoff, which closes checkpoint risk R-2 with kernel-checked definitional equality;
- the first three-row composed-flow confirmation that evaluates the E1 half from its definition (E-5, conditional);
- a new adversarial finding: exact zero-slack tightness of the sector template at both ends, structural through C1-LA1's affine
  identity.

Under SOLUTION-CONTRACT §5 the cycle is not a plateau for F: there is a new adversarial finding, and new `proved_informal`
candidates pending second read. Stop-gate decisive events: (a) is not met (Tier 1 is not formally verified at full scope); (b) is
not met (no confirmed eligible deficient cut, and none proposed). Ceiling: this is Cycle 4 of 6. Tier 1 stays `proved_informal` on
the run's record, not re-verified by this adjudicator, and is NOT decisive.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at orientation F's evidence grade:
- **Tier 1** (the family theorem, `m ≥ 107`, `m ≡ 2 (mod 3)`, rank `p*`). Not refuted: no eligible deficient cut was found or
  replayed. It is not proved at this orientation's grade, because I have not verified a complete informal proof of the full
  statement from this portfolio. The run's record grade (`proved_informal`, Cycle 3) is neither upgraded nor downgraded here. Its
  formal closure rests on conjunct 4, whose frozen leaves are informally proved in this portfolio only in part (N1, N5–N8;
  N2–N4 are outside it) and are compiled here nowhere.
- **(L-S)_top.** The template is governed (C1-LA1). The template-to-network bridges are N3–N5. N5 is informally proved
  (critic-attributed); N3/N4 are outside this portfolio and survive literal falsification at CB(8,1) and sampled class rows. At
  158/161/164 the composition holds exactly, conditionally, and is tight (E-5, E-6). Status at F grade: not refuted, not proved in
  this portfolio.
- **(ELIG-top)(a).** Not refuted. `i_{p*−1} < i_{p*−2}` was recomputed at 107/158/161/164 by C-F1-T and C-F2-T (difference index
  written: `i_{p*−1}(T) − i_{p*−2}(T) < 0`). The universal statement is carried by governed awards on the run's record (the
  allocation lists C1-LA3 and C2-LA1); I cite that record and did not re-verify it.
- **Outcome C.** Not reached.

## Next-route allocation

**The exact remaining obligation for orientation F.** Adversarially clear the formal closure of conjunct 4 before and at Stage 7.
That means:
- (i) an isolated second read of the critic-derived proofs in E-4, above all the sector-image classification and P-N7;
- (ii) a literal, non-conditional composed-flow check at a class row, evaluated arc by arc from the definitions (`cb8E1Val` with
  Lean truncations; the `cb8GSec` guard with literal `transportRel`) on the literal network or through r30's PROVED orbit quotient
  (key `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`, whose scope must be checked to admit an
  arbitrary rational `g`, or with the symmetry argument written on the face);
- (iii) a fidelity audit of the eventual merged build: byte-identity of every frozen statement, no local-copy definitions (compare
  controller erratum R31-E-i), axioms, and governed provenance of `cb8Rho_lt_one_topRank` and of every carried entry;
- (iv) the residual record items: the seven `CHECKPOINT-ANALYSIS-C3.md` quotations; the 20 unverifiable R-11 scratch literals; the
  "21–229" → "21–230" description correction; and confirmation that the `r31_tool_c4.py` revision is recorded.

Routes, up to three:

1. **F-merge — `MERGED-BUILD-FROZEN-TEXT-FIDELITY-AUDIT`.** When T/U closures are merged into one project (the controller facts:
   "no single file contains all N1–N8 proofs; no merged build"), audit the merge clause by clause:
   - frozen statements byte-identical to `0fc723d7…`;
   - `cb8GSec` is the single frozen copy (no local copy);
   - `#print axioms` for every N-node and the stitched terminal;
   - carried entries receipt-bound, including the governed source for `cb8Rho_lt_one_topRank`;
   - the options census;
   - the reserved name absent.

   It could close in one cycle a signed merge-fidelity record that every Stage 7 panel cites. This is the F-orientation analogue of
   F1, pointed at the artifact that will actually be awarded.
2. **F-quotient — `LITERAL-COMPOSED-FLOW-VIA-PROVED-QUOTIENT-AT-A-CLASS-ROW`.** At one row (158 or the structural 161), evaluate
   `cb8E1Arc + cb8GSec` arc by arc from the definitions on orbit-quotient classes, with (WID), the derived selector and `x` first.
   Output: for every source class, row minus `w`; for every target class, `w` minus column. Include an explicit structured `X`
   (sector sources plus the `r`-free sources competing for one-choke `v`-targets, the tight family of E-6), with `N(X)` computed
   from (REL). It could close in one cycle a non-conditional row certificate (a `computer_assisted` candidate after two instruments
   and a second read), or an exact cut (decisive-event (b) candidate).
3. **F-second-read — `ADVERSARIAL-SECOND-READ-OF-CRITIC-PROOFS`.** An isolated reader who has not seen the Stage 4 critiques works
   from the frozen texts and the base only. It re-derives or refutes the sector-image classification, P-N5, P-N6, P-N1, P-N7 (with
   the `q ≤ m` and `γ ∈ {0, 8}` boundaries and the zero-slack exactness) and the N8 chain, and it attempts kernel refutations where
   a statement is decidable at an instance. It could close in one cycle registration-grade `proved_informal` for these lemmas, or a
   mis-statement found before Stage 7 compiles against it.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-adj-F/`. Python
`python3 -B`, standard library only (`hashlib`, `os`, `re`, `fractions`, `math`), exact arithmetic; no wall-clock, PID or host field
in any hashed output.

| Path | SHA-256 | Role |
|---|---|---|
| `inventory_check.py` | `4a232ebc29093159177ff60238102ab44525712248741e4c904d91d9250ea46f` | recomputes 76 inventoried artifact digests of the F portfolio |
| `inventory_check.out.txt` | `2779121a62cba1e6ad82d970d1d910271eb205b66321436b7f8a905a90c1fea8` | `checked 76 defects 0` |
| `adj_template_replay.py` | `0fc4d9cab9da74481f02234dd5d4697cc1ef3d70102703de9d5dec02a59f11a5` | my own instrument: base-parsed tables; exact DP min `ΣOut` and max `ΣIn`; switch class; F2 class-(a) true inflows; the 280/1512 count |
| `adj_template_replay.out.txt` | `a1e00633fb1221b157ebe2e2876c4bb06ce2e2d5e0d3c4d946d19ad361a93eab` | output; in-text `DIGEST 37ec2e12a55067c659e7168192dd28d03ef51c8aa4eca5c7ce988c41d69360c8` |
| `affine_identity.py` / `.out.txt` | `03b41aea364c64cb1579c0a954e8f60c7c27741bdc4ea6a8d35230b3c2f40777` / `b942d1630b8f359c4c2ff16169d47222c8a1cb824a49917517d89a843eff7d07` | `(25m/2+5)K − 7m/2 = D` at 1,632 class rows (a polynomial identity) |
| `replay-F3/` (9 copied scripts) + `run_all.out` | scripts equal to F3's inventory; `run_all.out` `aa23967e4e1870f57e14e93c448f81ddc5bf80a9e15c12f47fca4b975ad82fba` | F3 replay: `MASTER_DIGEST_SHA256 4ad0c6f4…76fe`, tree `digest 3527a38b…44bd` |
| `replay-crit-F2-T/` | `crit_f2t.py` `6ba35369…`, `stdout.log` `72010eb75a66f6136aa4b4f35415f4b39750c889760bd4c65784dcd5c102820d`, `crit_summary.json` `d2d0a291017522745d4f9e25ed51db7da42bf45fdb93d6de14f4a0ade7842eb3`, `adv_stdout.log` `8f5ebc56c23e89be536ce61410afc1b51ae846c48f1899695f8a98ae37814202` | C-F2-T replay, byte-identical (about 4 min 50 s, foreground) |
| `replay-crit-F2-U/` | `bundle.stdout` `a112ca847e65a48a7805dc32e9d49c9b9f577b5fbae2172f0eb70dbd9524dd67` | C-F2-U off-class bundle replay, byte-identical |
| `replay-crit-F3-U/` | `classrows.out` `bad3cd6122ed7953a9ae3f7ff09cfbc7ecf15fba97deb99ef42fc2a71c141799`, `sswitch.out` `96698ee97de3c765ac917694ec2729a9f26fe891bae4ec531bdd4be2c35589eb` | C-F3-U replays, byte-identical |

**Replay** (from `scratchpad/c4-adj-F/`): `python3 -B inventory_check.py && python3 -B adj_template_replay.py && python3 -B
affine_identity.py`. The replays in the three `replay-*` directories run with the commands their critics give.

**Background jobs:** none started. Every command ran in the foreground, and `jobs -l` returned nothing before this write. There
was no Lean or `lake` invocation, no network use, no installs and no process listing. Writes: this file, and scratch under
`scratchpad/c4-adj-F/` only. The directory `cycles/cycle-4/stage5/adjudicators/F/` was created for this file.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
