# Orientation Adjudication

**Adjudicator:** isolated Stage 5 adjudicator, orientation T (prove), r31 Cycle 4. The portfolio is seats `T1` (`C4-T-01`,
`E1-UPCOVER-COUNTS-VIA-CLONE-CORRESPONDENCE`), `T2` (`C4-T-02`, `SECTOR-GSEC-IMAGES-LEGCOUNT-OUT-BRIDGE`) and `T3` (`C4-T-03`,
`SECTOR-IN-BRIDGE-ZERO-CLASSES-AND-A2`), plus their six cross-orientation critiques (C-T1-F, C-T1-U, C-T2-F, C-T2-U, C-T3-F, C-T3-U).
Written 2026-09-29, clock read 00:54 EDT before drafting.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS under the restricted boot. I read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch
`control/dispatch/c4-stage5/DISPATCH-ADJ-T.md`. Before reading it I recomputed its SHA-256 with `shasum -a 256`:
`3d8c900352b5d066cfbabb2b00eb51b022972fcea4cdc00653244ad7310910a7`, which matches. I loaded no other VerityOS subsystem. No
conversation log was written, because the dispatch allows exactly one deliverable.

## Identity and seal audit

**Capsule.** `control/c4-adjudicator-capsules/T-PACKET-MANIFEST.json`. I recomputed the inner seal as SHA-256 over the canonical
JSON without `seal_sha256` (sort_keys, separators `(",",":")`, no trailing newline). It is
`a4cff6e6b374e03350d94d423fedfab4fb41af3bd8b44f36ed76817d3e9a82d9` and **matches**. All 22 listed members match their SHA-256 and byte
counts, including the three returns (`12b0a818…`, `c9cb4259…`, `3619904b…`), the six critiques (`010d65f8…`, `30619ec5…`,
`e2f063fa…`, `0c114e7d…`, `8c8a4e6c…`, `34379dbb…`) and the controller facts record `C4-STAGE5-CONTROLLER-FACTS-T.json`
(`fbba210f…`). `PATH-CHECK-T.json` reports 0 findings over 20 files.

**Stage manifests.** Each was recomputed and matches its stored seal:

| Manifest | Seal | Members | Mismatches |
|---|---|---|---|
| Stage 2 | `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387` | 6,084 | **1** (see below) |
| Stage 3 | `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e` | 42 | 0 |
| Stage 4 | `6f34313fe49b2a1de2d9739ac165ec90f40db4d35861ef49e8119b2488eda0ee` | 66 | 0 |

- **Record correction (Stage 2 drift).** `control/r31_tool_c4.py` is listed in the Stage 2 manifest at
  `0f98f5c48ad177acde35c032019bb8a073abfcd641abce43c98ed023b4046b70`. On disk it is now
  `7ee7cb5d37f0e6500654a8fc8b43f35b2ddf20c012966af8a934048be65cea3e`, which is the value in the Stage 3 and Stage 4 manifests. The admission
  tool is a living file that was updated after the Stage 2 seal. Nothing in my portfolio rests on it. I record it; I do not strike anything
  for it.

**Other checks.**
- The frozen text `sources/c4-base/LeanProject/LeanProof/Statements.lean` is `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1`
  (gate ruling 23).
- Both admission reports have verdict `admit`, with 9/9 returns and 18/18 critiques. My portfolio's admission items are:
  - `FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN` for T1, T2 and T3. All six critics adjudicated it as nothing to strike. I agree: every
    occurrence is a negation, a lint report or a governed-award citation.
  - `BAD_HEADLINE_FLAG` for T1, T2 and T3, and `MISSING_INSTRUMENT_SIDES_SECTION` for T3. These are format only. The value is `no`
    throughout.
- **Registry.** No return or critique proposes an `E993-R31-` key, so there is nothing to alias-check. The N-nodes are frozen
  statements internal to conjunct 4, not registered keys.

## Route-by-route decisions

Every Lean claim below was replayed by me copy-out-first in `scratchpad/c4-adj-T/LeanProject/`. That project is a byte copy of
`sources/c4-base/LeanProject`, with the controller base cache (CF-C4-S3-1; the four base `.lean` files confirmed byte-identical first)
and the pinned Mathlib bound by manual symlink. I never used `--no-cache`, `lake update` or `lake clean`. Every build ran in the
foreground and was a fresh elaboration (`Built`, not `Replayed`).

For every splice I also ran two independent structural checks:
- `splice_check.py` (difflib) confirms that every frozen line removed is exactly `  sorry`, that no top-level context command
  (`open`/`set_option`/`attribute`/`instance`/`variable`/`notation`…) is inserted outside a closed `section`, and that no forbidden
  token (`sorry`/`admit`/`native_decide`/`axiom`/`set_option`) is inserted.
- `block_check.py` confirms that each of the 21 frozen declaration blocks (`open Classical in` if present, docstring and statement
  through `:= by`, plus the `cb8GSec` definition) occurs **verbatim and contiguously exactly once**. This rules out a helper being
  wedged between a frozen `open Classical in` and its declaration.

### T1 — `C4-T-01`: **retained_narrowed**

**What the seat shipped.**
- `cbOpenChokeCount_le` (the N1 companion) and two helper lemmas are compiled sorry-free.
- B1, B2 and B3 remain `sorry`.
- The seat's own gate line is `FROZEN_NODES_CLOSED: none`. That is correct for the return.

**Replay.** Both critics' N1 closures build in my project with 16 `sorry` warnings each (20 − 4). `#print axioms` gives
`[propext, Classical.choice, Quot.sound]` for all four N1 declarations in both files. The N2–N8 controls print `sorryAx`.

| Critic file | SHA-256 |
|---|---|
| C-T1-F | `ddfbc61d2a0b5e022a72966dd1678e9b576fe6a7705e30f56249b9f27e688a98` |
| C-T1-U | `46cbca4746e2c1a7a57efb1b907741e58f4d597f0db7046c96f30e348a71e5ca` |

I also replayed C-T1-U's Python instrument `crit_n1.py` (`e8495028…`). My output file is byte-identical to the critic's
(`d2adc785…`; JSON digest `1c2a2172…`): m = 1 exhaustive (20,451 `r`-free independent sets; B3 on all 9,437,184 frozen-domain pairs),
sampled at 2, 3, 107, 158, 161 and 164, with 0 failures.

**Struck or narrowed, and my rulings:**
- **B3 blocker diagnosis: struck.** The seat blamed "`open Classical in` at the declaration site". The frozen B3 carries no
  `open Classical in`: frozen lines 72–83 have none, and I confirmed this. Both critics compiled B3 with no instance trouble.
- **The two critics disagree on the true cause.** C-T1-F calls the seat's inserted `classical` line irrelevant; C-T1-U calls it the
  plausible cause. **Unresolved on the shipped evidence**, because no compiler log of the mismatch ships. It is immaterial: B3 compiles.
- **"Two independent sides per row": narrowed** to one instrument with an internal cross-check of B1's `(q, w, ℓ)`. Both critics agree.
- **The 4 literal `q_le_m: True` rows: struck as evidence.** Both critics agree.
- **The seat's B3 check: narrowed** to `r`-free independent `A` with one sampled `z`. C-T1-U showed that B3's frozen domain is strictly
  larger, and both critics covered it exhaustively at m = 1.

### T2 — `C4-T-02`: **retained**

**What the seat shipped.** All five N3 declarations are compiled sorry-free, but in `LeanProof/T2.lean` against a **local
byte-identical copy** of `cb8GSec`.

**Replay.**
- `T2.lean` (`a2eeaf65…`) builds fresh with 0 `sorry`. Axioms are standard for the five N3 declarations and for both uniqueness lemmas.
  My axiom log is byte-identical to C-T2-F's (`f3ee4e43…`).
- Both critics' bindings of T2's bodies into the FROZEN file build with 15 `sorry` each (20 − 5). Axioms are standard for all five
  frozen N3 declarations, and the N1/N4 controls print `sorryAx`:

| Critic binding | SHA-256 |
|---|---|
| C-T2-F `StatementsN3.lean` | `b11d41c7…` |
| C-T2-U `StatementsBound.lean` | `8c9828eb…` |

- I replayed C-T2-U's `out_bridge_check.py` (`629e2513…`). The coefficients are free symbols. It is exhaustive at m = 1 (1,792 sector
  sources) and sampled at 2, 5, 107, 158, 161 and 164. Output: "ALL CHECKS PASSED". It is byte-identical to the critic's log except for
  the one wall-clock timing line.

**Rulings.**
- **The critics agree** that the "mechanical" binding the return left open is in fact mechanical.
- **N3 closes on the frozen constant.** This is the seat's proof, and the binding is critic-attributed.
- **Struck (both critics):**
  - the "5,547+ checks" census figure (the actual N3 rows sum to 16,528);
  - the `T2.lean` header line citations;
  - "reproduced here byte-identically" for `choke_neighborFinset_inter_card`.
- **Narrowed (both critics):** "two independent instruments" becomes one toolchain.

These are provenance items only.

### T3 — `C4-T-03`: **retained_narrowed**

**What the seat shipped.** `cb8GSec_zero_classes` is compiled sorry-free, on a local copy of `cb8GSec`. `in_eq`, `in_le_one` and both N5
declarations are derivations only. The seat's gate line is `FROZEN_NODES_CLOSED: none`, which is correct for the return.

**Replay.**
- `T3.lean` (`3359e810…`) builds with 0 `sorry`, and `cb8GSec_zero_classes` has standard axioms. My log is byte-identical to C-T3-F's
  (`a78dc083…`).
- C-T3-F `SpliceN45.lean` (`262d102e…`) builds with 17 `sorry` (20 − 3). `cb8GSec_zero_classes`, `cb8_sector_switchPreimages` and
  `cb8GSec_switchImage_inflow` have standard axioms.
- C-T3-U `SpliceN4N5.lean` (`e65cc7c9…`) builds with 15 `sorry` (20 − 5). All five N4/N5 declarations have standard axioms, and the N3
  control prints `sorryAx`.
- I replayed C-T3-U's `crit_n4n5.py` (`c6f3d736…`) at twice its target count (20): 0 failures. It covered:
  - m = 1: exhaustive, with 8,484 targets and forward and backward sums agreeing;
  - m = 2: every state type;
  - m = 107, 158, 161, 164: 320 structured targets each.
  
  At each class row, the exact DP maximum of the in-sector column over ALL state vectors with `K − 1` legs is exactly **1**.

**Paired-critic disagreement on the gate line.** C-T3-F writes `none`, with N5 given in prose as critic-derived. C-T3-U writes `N4, N5`.
**Resolved for C-T3-U.** C-T3-F did not attempt `in_eq`/`in_le_one`, and C-T3-U compiled them. My replay confirms C-T3-U's file.
There is no mathematical conflict.

**Second disagreement: the route to `in_le_one`.** C-T3-F routes it through N3's leg count and C1-LA1 (iii). C-T3-U uses its own
`crit_legCount` and C1-LA1's `cb8_sum_in` (entry 102). The compiled proof (merged file, line 2839) uses `cb8_sum_in` with
C-T3-U's leg count, so the compiled `in_le_one` **does not depend on N3**. Both routes are sound.

**Struck and narrowed (critic agreement, with my checks):**
- The digest literal `d26e702b…99923d` for `E1FlowConstruction.lean` is struck. The file is
  `d26e702bfd0aa3ba9447130475d17591a9ed06db587420270a9730f99d32aab8`, which I confirmed. The return's R-11 "no unmatched literal"
  sentence is struck with it.
- The `T3.lean` header literal `c1e6b8f2…` is struck. The file is `c0d1794f…`.
- "`preimage_check.py` checks the exact generalized version" is struck. It checks the switch-arc census only.
- "Two instruments in the formal sense" is struck.
- "Axioms on every declaration" is narrowed to 6 of 25 declarations. C-T3-U extended it to all 26.
- The seat's diagnosis of its own abandoned `verify_n4_n5.py` is **replaced**. Both critics independently found that the script's guard
  dropped `IsIndepSet B` and `B ∈ I_(p*+1)`, and C-T3-F's two-conjunct patch clears every failure. It is not evidence against any frozen text.

## Cross-route reconciliation

**The integration test the record lacked.** The controller facts note that no single file holds these proofs together. I merged three
splices into ONE frozen `Statements.lean` with `merge.py`: C-T1-F's N1, C-T2-U's N3 binding and C-T3-U's N4/N5. The merge:
- places helper blocks at their frozen anchors;
- replaces 14 `sorry` bodies;
- detects helper-name clashes.

**Result:** `AdjMerged.lean` (`b25201ca8a1d5b0b34f8ba353f57b46eaaba9bfa067b48b1d20eac84de0c6f95`).
- `block_check`: all 21 frozen blocks occur verbatim once. `splice_check`: only `  sorry` lines were removed, and no stray context command
  was inserted.
- It builds on the first attempt, with exactly **6** `sorry` warnings: N2 ×2, N6, N7 ×2 and N8.
- Co-imported with `LeanProof.C3LA1`, `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for all **14** frozen N1, N3, N4 and
  N5 declarations, with no clash against the base. `sorryAx` appears exactly on the six open ones, and C3-LA1's terminal keeps its
  standard axioms.
- A second merge from the *other* critics' files builds identically, with 6 `sorry` (`AdjMerged2.lean`, `44fa295c…`). It uses C-T1-U's
  N1, C-T2-F's N3 and C-T3-U's N4/N5.

**Helper clash (predicted by C-T2-F finding 10; now observed):**
- `no_choke_of_root_mem` appears in both the N3 and N4/N5 helper blocks. The two copies are **identical**, so one is kept.
- `choke_neighborFinset_inter_card` appears in both blocks with **different** text. T2 restated it through `chokeBeta`. The N4/N5 copy
  must be renamed (`…_n45` in my merge).

A joint award must carry one copy of the first and rename or unify the second.

**Tightness (critic-attributed, bounded, not a defect):**
- C-T2-F found sampled sector sources with `Σ Out = 1` exactly, with states `(1,1)`, `(1,4)` and `(1,7)`, at 107 and 161.
- C-T3-U's exact DP, which I replayed, gives a maximum in-sector column of exactly 1 at 107, 158, 161 and 164.

So C1-LA1's allocation has zero slack on both Out and In at the class rows. Any later change to `cb8GSec` or to N7's scaling has no
margin to absorb it.

## Established results

The grade is compiled scratch with **no formal grade until a governed award closes** (SOLUTION-CONTRACT §4). "Kernel-replayed" means I
rebuilt it fresh and printed its axioms. The critic-derived parts were first stated at the review stage. The Stage 7 panel still owes
the isolated second read.

| Frozen node | Declarations (frozen text, `0fc723d7…`) | Proof attribution | Hypotheses on the face | Status |
|---|---|---|---|---|
| **N1** | `cbOpenChokeCount_le`, `cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses`, `cb8_nonChokeInsert_weight` | T1 (companion; B3 helpers `cb_tagWitnesses_subset_root_or_choke`, `cb8_activeWitness_unaffected_by_insert`); **critic-attributed** B1, B2, B3 assembly: C-T1-F and C-T1-U independently | `0 < m`; B1/B2: independence and `r ∉ ·`; B3: none beyond `z ∉ A`, `z ≠ r`, `z` not a choke; any rank | kernel-replayed, both drafts |
| **N3** | `cb8GSec_nonneg_and_support`, `cb8_sector_arcImages_mem_layer`, `cb8_sector_legCount`, `cb8GSec_out_eq`, `cb8GSec_out_ge_one` | **seat T2**; binding to frozen constant: C-T2-F and C-T2-U (critic-attributed) | class `107 ≤ m`, `m % 3 = 2` only in `nonneg_and_support` and `out_ge_one` (through C1-LA1 entry 105); others rank-pinned at `p*`, `m` free | kernel-replayed |
| **N4** | `cb8GSec_in_eq`, `cb8GSec_in_le_one`, `cb8GSec_zero_classes` | `zero_classes`: **seat T3**; `in_eq`, `in_le_one`: **critic-attributed** C-T3-U | `in_le_one` uses `m % 3 = 2` (via `cb8_sum_in`, entry 102); `107 ≤ m` carried unused; the others are unconditional in `m` | kernel-replayed |
| **N5** | `cb8_sector_switchPreimages`, `cb8GSec_switchImage_inflow` | **critic-attributed**, C-T3-F and C-T3-U independently | unconditional in `m` | kernel-replayed, both drafts |

**Mathematical reading.** Each node is a literal-network identity or bound about the frozen `g_sec` and the carried `transportRel`
(entry 19, the literal (D) ∪ (S)). N3 and N4 are the **proved reduction that fence 4 requires**: the certificate's Out and In functions
equal the literal network's row and column sums of `g_sec` at sector sources and in-sector targets, and N5 does the same for the
switch-image inflow `(8 − γ)σ(γ)`.

**Fidelity.**
- None of these nodes states a network aggregate, so (WID) is not applicable to them.
- The weight in N1 and N4 (ii) is the carried `activeWeight` on `C5LA1.leafSet` (ruling 24(5)); it is bridged to `favorableLeaves` at
  `p*` only by C2-LA3.
- There is no Darroch or Newton step, no asymptotics and no `θ*` hypothesis.

**Bounded corroboration.** The three Python instruments I replayed are listed above. They are bounded and are never evidence of the
universal statements.

**Imported at their grades, unchanged:**
- C1-LA1 (entries 102, 105);
- C1-LA2 graph layer entries;
- C2-LA3;
- C3-LA1.

These are `formally_verified` at their exact scopes according to the allocation record; I did not re-verify their governance.

## Rejected and narrowed mechanisms

- **No refuted mechanism is revived** (SOLUTION-CONTRACT §3.6). None of the proofs uses truncated `clone_fiber_card`-style counts: the
  frozen N1 texts are subtraction-free, and the `m − q` count is obtained additively. None uses a compression lemma, CHAR at `m = 1`, an
  `m`-independent per-choke certificate, or forest real-rootedness.
- **Template failures:** none. **Cuts:** none; this is a prove orientation, and no Hall sum is computed.
- **Narrowed instruments (the strikes above):**
  - T1's 61,263-row table: one instrument, 4 rows struck;
  - T2's and T3's "two instruments" gloss;
  - T3's citation of `preimage_check.py` scope.
- **Refuted instrument:** T3's `verify_n4_n5.py` as shipped. It dropped two guard conjuncts, which is a fidelity failure. It is to be
  discarded or patched.
- **Local-copy closures:** T2's and T3's standalone files prove statements about a duplicate constant `cb8GSec`. Under ruling 23 they do
  not by themselves discharge the frozen declarations. They do so only through the critic bindings, which I replayed.

## Lean readiness

The orientation's frozen line (ruling 32):

FROZEN_NODES_CLOSED: N1, N3, N4, N5

Attribution:
- N1 is critic-derived;
- N3 is the seat's proof, bound by the critics;
- N4 is split between the seat (`zero_classes`) and a critic;
- N5 is critic-derived.

The seats' returns by themselves close only N3 in substance, and only on a local copy.

The other gate lines:
- `COND4_formal`: no;
- `E1_formal`: no;
- `TERMINAL_integration`: no (partial: 14 of 20 frozen declarations co-compile in one file);
- `cut_candidate`: none.

The three readiness criteria hold for both award groups: (a) a complete informal proof at statement granularity with a closed dependency
DAG; (b) compiled fragments covering the named nodes sorry-free; (c) no open node inside the group.

**Award group S — the sector half (N3 ∪ N4 ∪ N5): CONTRACT-READY.** Ruling 31 names this as the expected candidate.
- **Terminal `expected_statement`.** The conjunction of the 10 frozen texts, byte for byte from `control/C4-FROZEN-STATEMENTS.lean`
  (`0fc723d7…`), against the single frozen `cb8GSec`. The texts are frozen lines 139–246: `cb8GSec_nonneg_and_support`,
  `cb8_sector_arcImages_mem_layer`, `cb8_sector_legCount`, `cb8GSec_out_eq`, `cb8GSec_out_ge_one`, `cb8GSec_in_eq`, `cb8GSec_in_le_one`,
  `cb8GSec_zero_classes`, `cb8_sector_switchPreimages` and `cb8GSec_switchImage_inflow`.
- **Fences.**
  - One rank `p*` and `d = 8`. The class enters only through C1-LA1, in `nonneg_and_support`, `out_ge_one` and `in_le_one`.
  - No (HALL), no flow existence, no aggregate or status transfer, no `θ*` law, no census as proof.
  - Tag set `leafSet` (ruling 24(5)).
- **Carries.** These must be receipt-bound from the governed runs (ruling 19), not from base copies:
  - C1-LA1 entry 105 `cb8_sectorTemplate_nonneg_out_in_switch`, from governed snippet `0027-…`. C-T2-F and C-T2-U report it
    byte-identical to the base, with digest `0a376ba5…2f6a`; that is critic-reported, and I did not re-hash it.
  - C1-LA1 entry 102 `cb8_sum_in`.
  - The C1-LA2 graph layer and adjacency entries used: `cbGraph`, `cbVertex`, `cb_val_cases`, 58–60, 69/70, 75.
  - Entries 6, 15, 16 and 19 (`indepFamily`, `tagWitnesses`, `activeWeight`, `transportRel`) and entry 32 (`mem_tagWitnesses_iff_of_adj`).
- **Open provenance item (smallest unresolved point for Stage 7).** The frozen statements themselves use the choke-state layer:
  `IsSectorSource`, `chokeState`, `chokeBeta`, `chokeGamma`, `chokeBeta_add_chokeGamma_le`. That layer lives in `ChokeState.lean`, whose
  header says "COPY (not a carry; ungraded scratch)" of Cycle 2 U2 Part B. The award must author it in-run as a definition layer (or
  carry it if a governed receipt exists; none is in my capsule).
- **New declarations to author, with attribution:**
  - T2's helper block: the two uniqueness lemmas, the two single-point sums, `switch_preserves_indep`, `card_switch_image`, and others.
    These are T2's, with C-T3-U and Cycle 2 U2 drafts credited.
  - T3's Sections 0–3 (T3).
  - C-T3-U's `crit_*` (`crit_gsec_support`, `crit_gsec_insert`, `crit_emptyLegs_card`, `crit_legCount`, `crit_Bj_props`, `crit_SP_sub`,
    `crit_gsec_Bj`, and others).
  - De-duplicate `no_choke_of_root_mem` (identical copies) and resolve the two different `choke_neighborFinset_inter_card`.
  - The `classical` tactic line in the inflow body is a proof-term detail, not a statement change.
- **Ready drafts:** C-T2-U `StatementsBound.lean` (`8c9828eb…`), C-T3-U `SpliceN4N5.lean` (`e65cc7c9…`), and my integration file
  `AdjMerged.lean` (`b25201ca…`), which already contains the whole group in one frozen file.

**Award group E-part — N1 alone: CONTRACT-READY as a conjunction of frozen statements.** Ruling 31 names "N1 + N2 if compiled"; N2 is
outside my portfolio.
- **Terminal.** The conjunction of the four frozen N1 texts (frozen lines 23–83).
- **Hypotheses:** as in the table.
- **Fences.** Graph-generic on `CB(8, m)`, `m ≥ 1`; rank-free; no class hypothesis; no flow claim.
- **Carries.** The C1-LA2 entries C-T1-F lists (6, 15, 16, 23–26, 33–42, 57, 60, 69, 70).
- **Provenance item.** `cbOpenChokeCount` and `cbOpenChokeCount_insert_of_not_choke` come from `E1FlowConstruction.lean`, the rekeyed
  Cycle 3 U2 layer, which is base scratch. The award must author or receipt-bind them.
- **Drafts:** C-T1-F (`ddfbc61d…`) and C-T1-U (`46cbca47…`), both kernel-replayed.

Whether N1 + N2 together is ready depends on the U orientation's N2 record, which I did not read. The controller facts record says U1's
critics assembled N2 modulo N1's B1/B2. I treat that as a fact, not evidence. My N1 closure is exactly the missing input.

**Not ready (outside this orientation):** N2 (2 declarations), N6, N7 (2) and N8. These are the six `sorry` in `AdjMerged.lean`. Within
the T portfolio, no unproved lemma remains.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Why progress is material.** On the formal path to Tier 1 (conjunct 4, the one open formal node entering Cycle 4), the orientation's
portfolio now compiles 14 of the 20 frozen conjunct-4 declarations sorry-free on the frozen text. That is four whole nodes: N1, N3, N4,
N5. They co-compile in a single frozen file with standard axioms. At Cycle 4 entry the count was zero. This includes the critical-path
node N1, which the checkpoint named, and the fence-4 Out/In/A2 reductions.

The plateau test (SOLUTION-CONTRACT §5) requires no material progress; that condition fails, so this is not a plateau cycle for T. The
stop gate is otherwise untouched:
- decisive event (a) is not reached, because nothing is governed yet and six declarations are open;
- decisive event (b) is not applicable (no cut);
- the ceiling is six cycles.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at this orientation's evidence grade:
- **Tier 1** (E) ∧ (H) on the class: **still_open**. I have not verified a complete informal proof of the full statement in this cycle.
  The allocation's record says Tier 1 is `proved_informal` entering Cycle 4, which is a prior record and not re-verified here. My
  portfolio's formal contribution leaves N2 and N6–N8 open.
- **(L-S)_top:** the template is C1-LA1 (governed, as recorded). The literal-network reduction that makes it a statement about the actual
  network (Out bridge, In bridge, zero classes, A2) is now **compiled in scratch, ungraded**. The residual-capacity composition with E1
  (N6/N7) is outside this portfolio. **still_open** as a literal-network statement at this grade.
- **(ELIG-top)(a):** nothing in the T portfolio bears on it. The record lists C1-LA3 and C2-LA1 as governed; I did not re-verify them.
  **No change.**

No refutation: there is no eligible deficient cut in this portfolio.

## Next-route allocation

**Exact remaining obligation for orientation T.** Nothing mathematical remains inside N1, N3, N4 or N5. What remains is:
1. governed re-authoring of the two award groups, with receipt-bound carries, the choke-state and `cbOpenChokeCount` layers authored
   in-run, one `cb8GSec`, helper de-duplication, and an isolated second read;
2. the conjunct-4 integration with the U orientation's N2 and N6–N8.

**Routes for Cycle 5, at most three:**
1. **T-INTEGRATE** (terminal stitch). Start from `AdjMerged.lean` (`b25201ca…`). Splice in the compiled N2, N6, N7 and N8 bodies from the
   U record by the same anchor-merge method (`merge.py`), then build the §2 terminal under a non-reserved name. **Could close in one
   cycle:** conjunct 4 sorry-free in a single scratch file, with the full options census, which sets up the Tier 1 formal award.
2. **T-SECTOR-AWARD** (Stage 7, or first route of Cycle 5). Governed re-authoring of group S, with the choke-state layer authored in-run,
   carries receipt-bound, and the `choke_neighborFinset_inter_card` duplicate resolved. **Could close:** a `formally_verified` sector
   half (10 frozen terminals).
3. **T-E1-HALF.** Governed N1, jointly with N2 if the U adjudication confirms N2. **Could close:** the E1 half of the literal flow as an
   award.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-adj-T/` (SHA-256):

**Checkers and merge tooling**

| File | SHA-256 |
|---|---|
| `splice_check.py` / `splice_check.out` | `85f7cebc…74d2` / `5ac3d70c…f63f` |
| `block_check.py` / `block_check.out` | `81970d27…47ef` / `4be943a8…3734` |
| `merge.py` / `merge.out` / `merge2.out` | `2bca4178…332c` / `0d0e4fe3…59b0` / `e9ac817a…4f1e` |

**Merged frozen files**

| File | SHA-256 |
|---|---|
| `LeanProject/LeanProof/AdjMerged.lean` | `b25201ca8a1d5b0b34f8ba353f57b46eaaba9bfa067b48b1d20eac84de0c6f95` |
| `LeanProject/LeanProof/AdjMerged2.lean` | `44fa295c197de6a82759020a541ef543449aedc10b2706aebbfa7dbd1eaa1bcf` |

**Copy-out Lean replays of the seat and critic files** (digests as in `## Route-by-route decisions`):
`LeanProject/LeanProof/{AdjN1F, AdjN1U, AdjN3F, AdjN3U, AdjN45F, AdjN45U, T2, T3}.lean`

**Build logs**

| File | SHA-256 |
|---|---|
| `build-base.log` | `da7bbe06…9e21` |
| `build-adj-splices.log` | `ea82d4cf…1083` |
| `build-merged.log` | `855c9400…cfc8` |
| `build-merged2.log` | `00290108…dce3` |

**Axiom logs**

| File | SHA-256 |
|---|---|
| `ax/axioms-AdjN1F.log` = `ax/axioms-AdjN1U.log` | `b69f60a4…25d2` |
| `ax/axioms-AdjN3F.log` = `ax/axioms-AdjN3U.log` | `44ac8751…62b9` |
| `ax/axioms-AdjN45F.log` | `faf77f05…ba8` |
| `ax/axioms-AdjN45U.log` | `d983a0ad…aad5` |
| `ax/axioms-T2.log` | `f3ee4e43…159b` |
| `ax/axioms-T3.log` | `a78dc083…ad75` |
| `ax/axioms-merged.log` | `2f2c2f86…73e` |

**Python replays**

| File | SHA-256 |
|---|---|
| `py/n1/crit_n1.replay.out` | `d2adc785…9fa4` (= C-T1-U's) |
| `py/n3/out_bridge_check.replay.log` | `957e7f40…92f3c` (= C-T2-U's except the timing line) |
| `py/n45/crit_n4n5.replay.out` | `b1f82d2e…53d8` |

**Replay commands**
- Lean: `cd …/c4-adj-T/LeanProject && lake build LeanProof.AdjMerged && lake env lean ../ax/AxMerged.lean`.
- Checkers: `python3 -B block_check.py LeanProject/LeanProof/Statements.lean LeanProject/LeanProof/AdjMerged.lean`.

**Shipped logs confirmed against my replays** (`#print axioms` outputs agree):
- T1 `axioms-t1-final.log` `68197ff8…`, T2 `work/axioms.log`, T3 `axioms2.log` `0af71ed1…`;
- critic logs C-T1-F `147754f1…`, C-T1-U `21267320…`, C-T2-F `5f14ce3d…`, C-T2-U `9d2d25e6…`, C-T3-F `906b7d7d…`, C-T3-U `34ee5bcc…`.

**Background jobs.** None were started. Every build and script ran in the foreground, so there is nothing to kill.

**Disclosures (read boundary and process)**
1. **Controller facts read at the launching controller's direction.** I read `control/C4-STAGE3-CONTROLLER-FACTS.json` (CF-C4-S3-1,
   `f267c0e1…`), which is not a capsule member, and followed it to copy the base cache (`.lake/build`, and also `.lake/config`). I made one
   one-level `ls` of `scratchpad/c4-base/LeanProject/.lake`.
2. **Harness context injection.** The host harness injected the root `CLAUDE.md` and the user memory index into context without a tool
   call. I did not act on either. The harness also persisted two large critique outputs to a tool-results file under `~/.claude/projects/…`,
   which I read back. Its content is the capsule-listed critiques.
3. **Inventoried scratch read by exact path.** Seat and critic Lean files, three critic Python instruments, and their shipped logs and
   outputs: `c4-T1`, `c4-T2`, `c4-T3`, `c4-crit-T{1,2,3}-{F,U}`.
4. **Directory listing.** `ls` of `cycles/cycle-4/stage5/adjudicators/` showed sibling `F/` and `U/` directories. I did not open them.
5. **No overreach.** No recursive search was rooted above my grant; every `grep` targeted single files in my scratch or the base. No
   other orientation's portfolio, prior synthesis, other experiment root, network or install was used. There were no writes outside
   `scratchpad/c4-adj-T/` and this file.
