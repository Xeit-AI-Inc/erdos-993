# Cycle 4 Neutral Synthesis

Neutral Stage 6 synthesis, Cycle 4 of r31 (Erdős #993: a parameter-uniform switch-using Hall certificate on CB(8,m) at the top
sector-deficient rank). Run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. Written 2026-09-29; clock read 01:03 EDT
before drafting.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS under the restricted boot. I read exactly two VerityOS files, `verity.md` and
`identity/startup-protocol.md` (both at the VerityOS root), and then my dispatch, `control/dispatch/c4-stage6/DISPATCH-SYNTHESIS.md`.
Before reading the dispatch I verified it with `shasum -a 256`: `fb9785db9da3f9510ccbdad49e809f805f83ff112951b0925b701511ac9f7388`,
which matches. I loaded no other subsystem: no memory, knowledge, conversations, operations, modules, skills, logs or decisions. I
wrote no conversation log, because the dispatch allows one deliverable.

**Read-boundary disclosures.**
1. *Harness context.* Before my first tool call, the host placed the project `CLAUDE.md`, the user auto-memory index and the user's
   e-mail into my context. I did not open them with a tool, and no ruling below rests on them.
2. *Reads under `sources/` (authorized).* I read these files in the Cycle 4 base: `sources/c4-base/LeanProject/LeanProof/Statements.lean`
   in full, `E1FlowConstruction.lean` in full, `ChokeState.lean` in full, and the `Main.lean` blocks of entries 78, 111, 131 and 579–582
   and 606. I also used the seven governed r31 award runs under `sources/c{1,2,3}-results/runs/`, as follows:
   - non-recursive listings;
   - the `kernel-verification.json` receipts (hashed and parsed);
   - the first 600 bytes of each `THEOREM-CONTRACT.yaml`;
   - the digests of named `Snippets/` fragments, computed by a Python glob over the seven `Snippets/` directories;
   - one `grep -l` over the seven governed `Main.lean` files.

   For r30's C1-LA2 award (`sources/r30/lean/…c1-la2…`), I hashed Snippets 0030/0031 and the receipt, and listed the other r30 award
   `Snippets/` names for entries 0030/0031. Every search was rooted inside `sources/` or inside my own scratch.
3. *Hash-only checks.* I hashed the Stage 5 packet manifest's members only where they lie in my grant (see the audit). I hashed or
   read nothing else it lists.
4. *A stray write.* One shell redirection wrote a 20-line copy of base `Main.lean` lines 12245–12264 into the host session scratch
   directory, which is outside the run root. I deleted it at once. The retained copy of that check was made under
   `scratchpad/c4-S/` and then deleted; the result is recorded under `## Lean awards`.
5. *Not read.* I read no raw returns, no critiques, no scratch of any other seat or adjudicator (including the two adjudicator merge
   files, which I cite only by their recorded digests), no other experiment root, and no external source. I used no network, made
   no installs, started no background jobs and made no process listings. I ran no Lean or `lake`.

## Identity and seal audit

| Object | Recorded | Recomputed here | Result |
|---|---|---|---|
| Dispatch `DISPATCH-SYNTHESIS.md` | `fb9785db…7ac9f7388` | `shasum -a 256` | MATCH |
| Capsule `control/C4-STAGE6-DISPATCH-MANIFEST.json`, inner seal | `ede8fe85c6261795022c78c21b7fb28f17139aec022a4c4b8a97899bb5233d30` | SHA-256 over canonical JSON without `seal_sha256` (sort_keys, `(",",":")`, no trailing newline) | **MATCH** |
| 12 capsule members (SHA-256 and bytes) | capsule | recomputed | **12/12 MATCH** |
| Stage 5 packet manifest `control/C4-STAGE5-PACKET-MANIFEST.json`, inner seal | `087a615e4d5e4f142b30739b144c9631fdf482eec5213ff2f68a880db5164d1e` | same canonicalization | **MATCH** (43 members listed) |
| Stage 5 members inside my grant (the two contracts, allocation, gate, three adjudications, `sources/SOURCE-DIGESTS.json` and six `sources/` members) | Stage 5 manifest | recomputed | 15/15 MATCH |
| Adjudications T / F / U | `544b7a50…` / `e8efac2b…` / `100720013a…` | recomputed | MATCH |
| `control/PATH-CHECK-c4-stage6-dispatch.json` | — | read | 0 findings over 11 files |
| Cycle 4 base `Statements.lean` (gate ruling 23) | `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1` | recomputed | MATCH |
| Base `Main` / `ChokeState` / `E1FlowConstruction` / `C3LA1` | `385af1bf…` / `64a101ef…` / `d26e702b…` / `49b227d3…` (U adjudication) | recomputed | MATCH |

- The **adjudicator capsule seals** reported by the adjudicators are T `a4cff6e6…82d9`, F `91e9b5b3…8d1e` and U `699b9c0b…2157`. Each
  adjudicator recomputed its own capsule seal and found it matching. I did not re-open those capsules, which are outside my grant.
- The **Stage 2/3/4 packet seals** (`226555ee…`, `2948d6cb…`, `6f34313f…`) were recomputed by all three adjudicators and match.
  The one member drift is `control/r31_tool_c4.py`, `0f98f5c4…` → `7ee7cb5d…`, recorded under `## Progress and stop-gate ruling`
  (process).
- **Admission.** All 9 returns and all 18 critiques were admitted. The admission defects (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`,
  `BAD_HEADLINE_FLAG`, `MISSING_INSTRUMENT_SIDES_SECTION`, `DIGEST_LITERAL_UNMATCHED`) were adjudicated as format only, or as cured
  by replay, in every orientation. I adopt those rulings.
- **Registry.** No return, critique or adjudication proposes an `E993-R31-` key. The N-nodes are frozen statements internal to
  conjunct 4, not keys.

## Reconciliation

I reconcile the three adjudications claim by claim, with no majority vote. Each adjudicator read only its own capsule, so each is
authoritative on its own portfolio and silent on the others. The controller facts (`control/C4-STAGE6-CONTROLLER-FACTS.json`) are
facts, never authority.

### (i) The frozen leaves N1–N8, node by node

| Node | Frozen declarations (`Statements.lean` `0fc723d7…`) | T ruling | U ruling | F ruling | Reconciled status | Seat or critic |
|---|---|---|---|---|---|---|
| **N1** | `cbOpenChokeCount_le`, `cb8_rFree_deletionClasses` (B1), `cb8_rFree_insertionClasses` (B2), `cb8_nonChokeInsert_weight` (B3) | **closed** (all 4). Kernel-replayed from two independent critic drafts (C-T1-F `ddfbc61d…`, C-T1-U `46cbca47…`), co-compiled in `AdjMerged.lean` | companion and B3 closed; **B1, B2 open in U's portfolio** | informal proofs exist (C-F3-T, C-F3-U); none compiled in F | **Closed on the record** (compiled scratch, ungraded). U's "B1/B2 open" is a statement about U's portfolio only and does not conflict with T's replay. | Companion: T1 (U1 has an independent proof). B1, B2: **critic-derived** (C-T1-F, C-T1-U). B3: **critic-derived** (C-T1-F, C-T1-U, and independently C-U1-F). |
| **N2** | `cb8N_sum_eq_cb8R`, `cb8E1Arc_spec_topRank` | outside T; open in `AdjMerged` | companion closed; **main closed modulo exactly {B1, B2}** (sorry leaves exactly those two, transplanted into the frozen body) | outside F | **Closed on the record by composition**: U's proof of N2 depends only on the frozen B1/B2 statements, which T closes. It is not yet co-compiled in one file. | Companion: U1. Main: **critic-derived** (C-U1-F), with clauses (2) and (5) from U1 and base scratch. |
| **N3** | `cb8GSec_nonneg_and_support`, `cb8_sector_arcImages_mem_layer`, `cb8_sector_legCount`, `cb8GSec_out_eq`, `cb8GSec_out_ge_one` | **closed** (all 5) | outside U (a residual of U's stitch) | outside F | **Closed on the record.** | **Seat T2's proofs.** The binding to the frozen constant is critic-attributed (C-T2-F, C-T2-U). T2's standalone file used a local copy of `cb8GSec` and does not by itself discharge the frozen text (gate ruling 23). |
| **N4** | `cb8GSec_in_eq`, `cb8GSec_in_le_one`, `cb8GSec_zero_classes` | **closed** (all 3) | outside U (residual) | outside F | **Closed on the record.** | `zero_classes`: seat T3, bound to the frozen constant by critics. `in_eq`, `in_le_one`: **critic-derived** (C-T3-U). |
| **N5** | `cb8_sector_switchPreimages`, `cb8GSec_switchImage_inflow` | **closed** (both) | outside U (residual) | informal proofs (C-F3-T, C-F3-U) | **Closed on the record.** | **Critic-derived** (C-T3-F and C-T3-U independently). |
| **N6** | `cb8_activeWeight_leafSet_eq` | outside T (a residual of `AdjMerged`) | **closed** | informal proofs (C-F3-T, C-F3-U) | **Closed on the record.** | **Seat U2.** |
| **N7** | `cb8Rho_one_eq_cb8R1_ratio`, `cb8_flowBundle_of_arcSpecs` | outside T (residual) | **closed** (both) | informal proofs (C-F3-T, C-F3-U, C-F1-T, C-F1-U) | **Closed on the record** (main is conditional by design, gate ruling 26). | Companion: **seat U2**. Main: **critic-derived** (C-U2-F and C-U2-T independently). |
| **N8** | `cb8_conjunct4_of_flowBundle` | outside T (residual) | **closed** | informal chain (C-F1-T) | **Closed on the record.** | **Seat U3** (an independent second proof by C-U3-T, which does not use Part A). |

**Agreement check.** The two rulings interlock exactly, with no overlap in conflict:
- T's merge leaves 6 `sorry`: N2 ×2, N6, N7 ×2, N8. U closes every one of them (N2 main modulo B1/B2).
- U's merge leaves 7 `sorry` leaves under the stitch: B1, B2, `cb8GSec_nonneg_and_support`, `cb8GSec_out_ge_one`, `cb8GSec_in_le_one`,
  `cb8GSec_zero_classes`, `cb8GSec_switchImage_inflow`. T closes every one of them.
- Across the two orientations, **all 20 frozen declarations** (and the frozen definition `cb8GSec`) have kernel-replayed sorry-free
  proofs against the same frozen text on the same base, with axioms `[propext, Classical.choice, Quot.sound]`.
- **No single build yet contains all 20** (controller fact; both adjudicators say so). The union has no dependency cycle: U's N2 cites
  only the frozen *statements* of B1/B2, and T's N1–N5 cite nothing that U owns.

**Seat work versus critic-derived work.** On the frozen text, the seats closed:
- T1: `cbOpenChokeCount_le`, plus the B3 helpers;
- T2: N3, through the critics' binding;
- T3: `cb8GSec_zero_classes`, through binding;
- U1: `cbOpenChokeCount_le`, `cb8N_sum_eq_cb8R` and U1's bridge;
- U2: N6 and the N7 companion;
- U3: N8.

Critic-derived, and graded as critic-attributed: N1 B1, B2, B3; N2 main; N4 `in_eq` and `in_le_one`; N5 (both declarations); N7 main.
Every critic-derived proof was first stated at a review stage. It needs an isolated second read (below, and under `## Registrations`).
**A kernel check does not replace the second read for the record's attribution and informal grade, but it is sufficient for the
formal certificate once a governed award closes.**

### (ii) Disagreements surfaced (none resolved by consulting a lower tier)

1. **N1 B1/B2, "closed" (T) versus "open" (U).** These are not in conflict. U's ruling is scoped to U's capsule, and U itself
   records that the controller facts report T-side closures it did not see. T's replay is primary evidence for these declarations.
   Ruling: **closed on the record**.
2. **T1's B3 blocker cause** (C-T1-F versus C-T1-U). This is unresolved on the shipped evidence and immaterial, since B3 compiles.
   It is recorded, not resolved.
3. **N4/N5 gate line** (C-T3-F `none` versus C-T3-U `N4, N5`). T resolved it for C-T3-U by replay. I adopt that.
4. **The route to `in_le_one`** (through N3's leg count, or through C1-LA1's `cb8_sum_in`). Both routes are sound. The compiled proof
   uses `cb8_sum_in`, so `in_le_one` does not depend on N3.
5. **N2 clause (1) and N1** (C-U1-T versus C-U1-F). Both proofs are correct. C-U1-F's proof needs no N1 input, and U adopts it.
6. **C3-LA1 entries 33/37 labelled "formally verified"** (C-U2-F versus C-U2-T). U ruled: "in the cone of the C3-LA1 award's terminal
   (entry 53); no certificate of its own". I adopt this. It is SOLUTION-CONTRACT §4 on its face.
7. **The `U3Stitch.lean` write time** (C-U3-F versus C-U3-T). U ruled by `stat` that the file was written at 09:53, after the
   resumption. The return's wording is inaccurate. This is immaterial to the mathematics.
8. **F2 and gate ruling 29** (C-F2-T versus C-F2-U). F ruled that the mandatory rejection is not triggered, because the index was
   written textually and the selector enters only through the governed C2-LA3. F also ruled the "none" wording inexact. I adopt this.
   Nothing of substance turns on it: every network-level F2 conclusion is struck on fidelity grounds, and both critics agree on that.
9. **N5 at `γ = 0`.** C-U2-F and C-U2-T agree that the junk value `cb8CGamma 0 = 0` is load-bearing in **N5's** frozen text, not in N7's.
   F's critics state the same: `γ = 0` goes through `cb8CGamma`'s wildcard, kernel-checked in `cb8Sigma_zero_and_eight`. This is not
   a defect: the frozen statement is true and compiles. It is a fidelity flag for the Stage 7 panel and for the second read. On the
   literal network, a target with `γ = 0` and one choke has weight `0 + [v,r]`, and receives `8·σ(0)`; the frozen `cb8Sigma` returns
   0 there. The informal meaning ("no switch preimage carries flow at `γ = 0`") must be read on the face.

### (iii) F2's mandatory composed-flow check: grade ruling

- **The seat failed the mandatory object.** It delivered none of the following: the orbit quotient, every target class and every
  source row, (WID) from independent sides, the derived selector, `x`, row 161 treated structurally, or the small-CB check at every
  selector-nonempty rank. Its "HALL HOLDS" sums are circular: the neighbourhood capacity is written in, not computed. F struck them,
  and I uphold every strike. This is a route failure. **It is not a template failure and not a cut.**
- **What survives is C-F2-T's arc-by-arc bounded check at 158/161/164** (F's E-5). C-F2-U's independent per-class DP agrees at every
  class inequality, and F replayed `crit_f2t.py` byte-identically.
  - **Grade:** `bounded_computation`. It is **STATED** (first made at a review stage) and **critic-attributed** to C-F2-T.
  - **It is conditional** on two inputs:
    - (a) C-F2-T's informal E1 class-count reduction. This is a critic's reduction, and it is **not identified on the record with the
      frozen N1/N2**, so I do not treat it as discharged by their compilation.
    - (b) The N3/N4 bridges. These are now compiled scratch on the record (above). That discharges (b) at the compiled-scratch level
      only; nothing is graded until an award closes.
  - **It is not** an evaluation through r30's proved orbit quotient. It is not a `computer_assisted` row certificate. It confers no
    status on any key.
  - It needs an isolated replay and read (R31-SR-C4-5) that runs **concurrently** with Stage 7. Its role there is as an independent
    adversarial instrument, never as evidence for the universal statement (fence 7).

### (iv) The exact two-sided tightness of the sector template (F adjudication, E-6)

**The finding.** C-F2-T, C-F2-U and the F adjudicator's own instrument found exactly min `Σ_i Out = 1` over all sector sources and
max `Σ_i In = 1` over all in-sector targets at 107, 158, 161 and 164 (C-F2-U also at 95). C-F2-T's literal evaluation of the frozen
`cb8GSec` at the extremal sets gives row = 1 and column = 1. The structural reason F gives is that C1-LA1's per-state bound
(`OutConst ≥ 5ℓ − 7/2`, base entry 92), summed over `m` chokes with `K = (16m+1)/3` legs, gives exactly
`(25m/2 + 5)K − 7m/2 = (200m² + 82m + 5)/3 = D`. This is the denominator of the recorded `θ*_8(m)`.

**My check of the identity (scratch, not evidence).** I checked the identity as a polynomial identity in `m` over ℚ by exact
three-point interpolation, and also at every class row from 107 to 19997 (`scratchpad/c4-S/identity_check.py`). By hand:
`(25m+10)(16m+1)/6 − 21m/6 = (400m² + 164m + 10)/6`. I did not re-read entry 92's per-state bound.

**What any proof must respect:**
1. N3's `Out ≥ 1` and N4's `In ≤ 1` must be carried as exact non-strict inequalities in exact rational arithmetic. An argument
   that states `Out > 1` or `In < 1` strictly is false at these rows.
2. No ε-margin, perturbation, floating-point or asymptotic step can serve the sector ends of this template. Fence 5's "explicit
   `M_0`" is moot here because there is no slack to spend.
3. `cb8GSec` may not be rescaled upward. The Out-≥ interface (N8) consumes rows `≥ w`, not rows `= w`, so no scaling is ever
   needed, and none may be introduced.
4. In-sector targets must receive exactly 0 from E1. This is N2 clause (5) (`r ∈ A` ⇒ column 0). Any E1 leakage into targets
   containing `r` breaks conjunct 4 at these rows.
5. The state reading must be exactly the frozen `chokeState`.
6. The slack of the composed flow lives only at the switch images: `ρ_1γ + (8−γ)σ(γ) ≤ γ`, with minimum slack about `4.25e−3` (107)
   down to `2.80e−3` (164). The margins `(1−ρ_1)/θ` are 34.90, 51.50, 52.48 and 53.46.

**Grading.** The kernel-checked proofs honour all six requirements by construction: they compile exact `≤`/`≥` over ℚ. The finding
is a genuine **new adversarial fact**. It bears on any future generalisation (other ranks, other residues, `d ≠ 8`), and it confirms
that LP optimality is not needed and must not be assumed: tightness of the affine separation is not LP optimality of `θ*`, and the
`θ*` law stays a conjecture. It also explains why small-`m` literal work cannot test the composition. At CB(8,1), `p = 6`, the
off-class composition fails (1,400 negative `g_sec` values). That is not a cut: it is off-class and not eligible.

### (v) Process items (recorded, not relitigated)

- **Host interruptions.** The dispatch records three. The record I read attests one directly: an interruption at about 08:55 with
  resumption at about 09:50 on 2026-09-28. It is fixed by U's `stat` of `U3Stitch.lean` (09:53:22) and by F3's timeline note (a
  script run, not written, after resumption). No mathematical consequence was found in any orientation.
- **Build cache.** Both Lean-building adjudicators copied the controller base cache (`scratchpad/c4-base/LeanProject/.lake/`, per
  CF-C4-S3-1) after checking byte identity of its `.lean` files against `sources/c4-base`. T reports every build as a fresh
  elaboration (`Built`, not `Replayed`). This is a controller cache, not another seat's `.lake/build` (gate ruling 25).
- **Controller erratum R31-E-i.** F cites it about local-copy definitions. The T record shows the case: T2/T3 proved against a local
  copy of `cb8GSec`, and the critics bound the proofs to the frozen constant. The erratum's text is not in my capsule. It is recorded
  as cited.
- **Tool revision R31-N-29.** `control/r31_tool_c4.py` moved from `0f98f5c4…` (Stage 2 manifest) to `7ee7cb5d…` (Stage 3 and 4
  manifests, and my Stage 5 manifest). This was after the Stage 2 seal. T and F flagged it independently. No claim in any portfolio
  depends on it.
- **Walker fragility** (U's process finding). A sorry-walker that fails to resolve a name reports a false clean. Any walker cited at
  Stage 7 must fail loudly on an unresolved name or carry a positive control.

## Exact established results

"Compiled scratch" means kernel-replayed by an adjudicator, **ungraded** until a governed award closes (SOLUTION-CONTRACT §4).
Nothing below uses Newton, Darroch, an asymptotic step, a census as proof, or the `θ*` law.

1. **Every conjunct-4 leaf compiles on the frozen text.** All 20 frozen declarations (N1–N8), against the single frozen `cb8GSec` and
   base `0fc723d7…`, are compiled scratch with standard axioms, split across two adjudicator merges:
   - T: `AdjMerged.lean` `b25201ca8a1d5b0b34f8ba353f57b46eaaba9bfa067b48b1d20eac84de0c6f95` (14 closed; a second merge from the other
     critics' files, `44fa295c…`, builds identically);
   - U: `merged.lean` `ae2a38863f05067ab1e8c249a47ba01149e4b0f080619c80e02021f8592d2356` (N6, N7 ×2, N8, B3 and the two companions
     closed; N2 modulo {B1, B2}; the stitch modulo exactly 7 T-closed leaves).

   In both merges the frozen headers occur verbatim exactly once, and U's merge has structural type hashes identical to the untouched
   base.
2. **The §2 terminal body follows from N7's conclusion alone.** This is compiled scratch, two independent critic proofs (C-U3-F,
   C-U3-T), each `AdjU.cb8_topRank_of_flow ∘ N8` through C1-LA2 entry 78 and C2-LA1 entries 579/580.
3. **The weight formula N6** holds for every `m ≥ 1` and every finset (compiled scratch; seat U2). `0 < m` is load-bearing: the formula
   fails at `m = 0`.
4. **The sector literal-network reduction** (fence 4's "PROVED reduction") is compiled scratch. N3 and N4 show that the certificate's
   Out and In functions equal the literal row and column sums of `g_sec` at sector sources and in-sector targets, for any `m`. N5
   gives the switch-image inflow `(8 − γ)σ(γ)` and the zero classes. The class enters only through C1-LA1 (entries 102, 105).
5. **Informal proofs** (critic-attributed; `proved_informal` candidates pending isolated second reads) exist for:
   - N1, N5, N6, the N7 companion, N7 main and the N8 chain (F portfolio: C-F3-T, C-F3-U, C-F1-T, C-F1-U);
   - the **sector-image classification lemma** (C-F3-U item 1; C-F3-T agrees). Every `transportRel` image of a sector source is a leg
     deletion, the deletion of `r` or `v`, the switch at `s`, or the switch at a choke `u_i` with `β_i = 1`. No sector source reaches
     `q ≥ 2`, or `q = 1` without `v`.
6. **Definitional fidelity** (F1 narrowed; C-F1-T and C-F1-U). `transportRel`, `activeWeight`, `IsSaturatingFlow`, `WeightedHall`,
   `favorableLeaves`, `tagWitnesses`, `crossingIndex` and `leafSet` in the base denote SEMANTIC-CONTRACT §1's objects. C-F1-U's
   compiled `rfl` equalities with r30 C1-LA2 Snippets 0014–0021 back this. Grade: `bounded_evidence` (audit), with ungraded compiled
   lemmas. **Load point:** the §2 terminal statement uses only these carried definitions, plus `cbGraph`, `IsTree` and `indepNum`. None
   of the new Cycle 4 definitions (`cb8GSec`, `cbOpenChokeCount`, `cb8E1Arc`, `chokeState`) occurs in the terminal statement: they are
   proof internals. The terminal's fidelity therefore rests entirely on carried definitions of record, and this audit covers them.
7. **C3-LA1 closed and wholly in the base** (53/53 entries; receipt checks pass). This confirms a governed award; it is not new.
8. **Bounded results** (discovery and test only; fence 7):
   - frozen-text falsification with 0 counterexamples: N1, N5, N6 and the N7 companion, exhaustive at `m = 1`, sampled at the rows;
     the companion at all 298 class rows with `107 ≤ m ≤ 1000` (F3, C-F3-T, C-F3-U);
   - the fixed point CB(8,95)/508 reproduced exactly by C-U2-T's `crit_n6_n7.py`: `θ = 96/604265`, `σ(1..3)`, the ratio 508/507, the
     `ρ_1` of record. The margin at 107 is `5777869414876808819/165550964075383936` ≈ 34.90;
   - `x` = 842/857/873 at 158/161/164 (four independent codes), so `x = p* − 2` at 158 and `x = p* − 3` at 161 and 164, with `S < 0`
     at every row;
   - the three-row conditional composed-flow confirmation, (iii) above;
   - the two-sided tightness, (iv) above.

## Refuted or narrowed mechanisms

- **Refuted:** none in Cycle 4. No frozen statement was found false. No template failure was found. **No cut candidate:** no eligible
  deficient `(T, p*, X)` at any class row, in any orientation. Outcome C is not reached.
- **Refuted instrument:** T3's `verify_n4_n5.py` as shipped. Its guard dropped `IsIndepSet B` and `B ∈ I_(p*+1)`. This is a fidelity
  failure of the instrument, not evidence against any frozen text.
- **Rejected mechanism:** F2's structured Hall test. Writing the neighbourhood capacity in as the row sum is circular. A structured-`X`
  test must compute `N(X)` from (REL) and `Σ_{N(X)} w` exactly.
- **Narrowed:**
  - F2's representative-instance method, since the template is tight only at specific splittings; the exact DP over all splittings
    is the instrument of record;
  - F3's single-direction preimage smoke test; C-F3-U's full forward/inverse check over 33,315 targets is the instrument of record;
  - small-`m` literal checks, which test the class-free identities only (CB(8,1) and CB(8,2) have **no eligible rank**);
  - every "two independent instruments" gloss that was one toolchain (T1, T2, T3, F3's companion);
  - the claims struck under `## Reconciliation` and in the three adjudications. Examples: F3's "no sector arc lands on an `r`-free,
    `v`-free target" (false: the switch at `s`, weight 0, already named in the frozen `cb8GSec_zero_classes`); F2's "1512 mismatched"
    (280); U2's "20 rows" (25); T2's "5,547+ checks" (16,528).
- **Local-copy closures** (T2, T3) do not by themselves discharge frozen declarations (gate ruling 23). They do so only through the
  critic bindings, which were replayed.
- **Fence audit** (all orientations): no Newton or Darroch step; no rank other than `p*`; no class other than `m ≥ 107`,
  `m ≡ 2 (mod 3)`; `θ*` used only as the definition `cb8Theta`, never as optimality; no status transfer; no refuted mechanism revived.
  The per-state template is the `m`-dependent affine certificate, not the refuted `m`-independent per-choke certificate. No
  truncated `clone_fiber_card`-style count appears: the frozen N1 texts are subtraction-free. `E993-TREE-REAL-ROOTED` stays REFUTED.

## Headline verdicts

Exact evidence grades. There is no status transfer between items.

| Target | Verdict at this synthesis | Basis |
|---|---|---|
| **Tier 1** (for every `m ≥ 107`, `m ≡ 2 (mod 3)`: (E) ∧ (H) at `p*`) | **Proved at full scope at `proved_informal`**, carried unchanged from the Cycle 3 record (Darroch/Newton-free; no cutoff `M_0`; no omitted range). **Not `formally_verified`.** **Not refuted.** | No Cycle 4 adjudicator re-verified the informal proof, and none downgraded it. Formally, every node of the terminal's DAG is compiled scratch on the record. **The smallest open formal item is not a lemma**: it is the cross-orientation integration build (Lean engineering over compiled proofs), followed by the governed award. |
| **(L-S)_top** | **Template: `formally_verified`** (C1-LA1, carried). **Literal-network lift** (N3–N5 bridges; N7 residual-capacity composition): **compiled scratch, ungraded.** Its record grade is that of the Cycle 3 record, unchanged. | Closes formally only inside a governed award. |
| **(ELIG-top)(a)** | **`formally_verified`** at full scope (C1-LA3 block descent; C2-LA1 terminal `cb8_topRank_parentDescent_and_conjuncts_1_2_3`, which carries `i_(p*−1) < i_(p*−2)` on the literal tree). Unchanged. | Carried; not touched in Cycle 4. |
| E1 condition (i) at `p*`; favorability | `formally_verified` at `p*` on the class (C1-LA3 `cb8_E1_conditionI_topRank`; C2-LA2/C2-LA3), carried. The registered keys keep their own grades (Tier 3, cited). | Unchanged. |
| Clone-level E1 transport | `formally_verified` (C3-LA1), carried. | Unchanged. |
| Cycle 4 lemmas (N1–N8, the sector-image classification, the tightness identity) | Compiled scratch, ungraded (N1–N8); STATED informal (classification, identity) | Pending the Stage 7 award and second reads. |
| Template failures | **None.** | — |
| **(HALL)** at full scope `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` | **OPEN, unchanged.** | Fence 1. |
| **Primary aggregate** `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` | **OPEN, unchanged by construction.** No outcome of this run can change it, and none has. | Fence 1. |
| Governed beta, TREE, FOREST, TRANSFER, Erdős #993 | OPEN, unchanged. | Fence 1. |

**Scope notes for keys touched.** No key's scope changes at the Stage 6 close. The keys Cycle 4 touched only by citation are the
favorability key via C2-LA3, the E1 criterion and threshold keys via C3-LA1/C1-LA3, and the orbit-quotient key in U3's attribution.
They need no note. Conditional notes are listed under `## Registrations` for the case where C4-LA1 closes.

**Corrections to predecessor records** (records; sealed roots are never edited):
1. **E1 layer description** (C-F1-U D9, upheld by F). The base `E1FlowConstruction.lean` header and the frozen companion
   `control/C4-FROZEN-STATEMENTS.md` (its line 11) describe the copy as Cycle 3 U2 "lines 21–229 followed by line 326". It is
   **lines 21–230** plus line 326. The recorded digests `c8f56fa8…`/`13aca55c…` are correct for 21–230.
2. **Entry 580 has a governed carry source.** The controller facts and the protocol list C2-LA1 companion entry 580
   (`AdjU.cb8_topRank_of_flow`) among the items with no governed source. It is present, byte-identical, as C2-LA1 governed
   `Snippets/0547-lemma-E993Transport-AdjU-cb8_topRank_of_flow.lean.fragment` (SHA-256
   `d2c95cbd64913546dc9ac71f2f6b7c76e29ee0143f50d280dc66d5ffe3832787`). I diffed it against base `Main.lean` lines 12245–12264: identical.
   It was kernel-checked inside C2-LA1's receipted source (receipt file `adb80684…`, source `986b5257…`). It is **outside** that
   terminal's cone (entry 582 does not use it), so it carries **no certificate of its own** (SOLUTION-CONTRACT §4). It may be
   **carried byte-identically** under that receipt, as r30 entries 30–31 are, or re-authored on the face.
3. **The U3 return's attribution.** The orbit-quotient key's certificate is r30 **C3-LA1**
   (`runs/lean-2026-09-27-c3-la1-weighted-hall-iff-aut-orbit-quotient-hall/`), not r30 C1-LA2. "C2-LA1's terminal" in U3 is entry 580,
   the face companion.
4. **Citation form** for C3-LA1 entries 33/37, and for any non-terminal governed entry: "in the cone of the C3-LA1 terminal (entry 53);
   no certificate of its own."
5. **Numbering alias, recorded to prevent a false discrepancy.** `cb8Rho_lt_one_topRank`'s docstring cites "C1-LA3 entry 20", and the
   F adjudication cites "entry 131". Both denote `cb8_E1_conditionI_topRank`: C1-LA3 Snippet 0020 (`8da112b4…`) is base entry 131. The
   same fragment digest occurs in C2-LA1 (0056) and C3-LA1 (0025).

## Lean awards

I ruled per protocol duty 4. An award is made only for stable declarations with closed DAGs at their exact scope. Carried fragments
travel byte-identically only. Receipts and fragment digests below were computed by me from `sources/` unless marked otherwise.

### Readiness ruling for the terminal (duty 6b(ii))

**Every frozen node is closed on the record.** The §2 terminal under the RESERVED name `cb8_topRank_eligible_and_weightedHall`
(R31-N-22) is **contract-ready as ONE governed Stage 7 award**, with one qualification.

**The qualification.** Its first step is Lean engineering over compiled proofs: the cross-orientation integration of `AdjMerged.lean`
(T) and `merged.lean` (U) into the award's single file. No node is mathematically open. The protocol allows funding exactly this kind
of step ("every open node is Lean engineering over proved mathematics"). The known integration items are named and small:
- the `choke_neighborFinset_inter_card` clash (two different texts; rename one);
- the duplicate `no_choke_of_root_mem` (identical; keep one);
- possible helper-name clashes between T-side and U-side `crit_*` helpers (namespace or rename; proof bodies only);
- the `import LeanProof.C3LA1` and `LeanProof.U3Interface` layout, which dissolves in the governed single-file assembly.

I recommend that the controller rule this terminal award at Stage 7. Gate ruling 31 (up to two awards) was written before any node
closed, and the controller facts reserve the ruling. **Funding one award (C4-LA1) stays within ruling 31's cap.** A pre-declared
fallback to two awards, also within the cap, applies if C4-LA1 is abandoned.

### C4-LA1 — the Tier 1 family theorem (FUNDED; decisive-event (a) candidate)

**Terminal `expected_statement`**, SOLUTION-CONTRACT §2 verbatim, under the reserved name, namespace `E993Transport`:

```lean
theorem cb8_topRank_eligible_and_weightedHall (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) :
    (cbGraph m).IsTree ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1 ∧
    ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) ((16 * m + 4) / 3)) ((16 * m + 4) / 3) f
```

- **Hypotheses:** exactly `107 ≤ m` and `m % 3 = 2`. There are no others: `hfav` is discharged by C2-LA3, and N8 carries no class
  hypothesis.
- **Proof shape (the U3 stitch, re-pointed):** `AdjU.cb8_topRank_of_flow m hm hres (cb8_conjunct4_of_flowBundle m
  (cb8_flowBundle_of_arcSpecs m hm hres (cb8E1Arc_spec_topRank m hm hres) (cb8GSec_nonneg_and_support m hm hres)
  (cb8GSec_out_ge_one m hm hres) (cb8GSec_in_le_one m hm hres) (cb8GSec_zero_classes m) (cb8GSec_switchImage_inflow m)
  (cb8_activeWeight_leafSet_eq m (by omega))))`, with every N-node proved on its face and the frozen texts byte-identical.
- **Fences:**
  - one rank `p*` per tree; `d = 8`; the class `m ≥ 107`, `m ≡ 2 (mod 3)` only;
  - the selector derived (`favorableLeaves`), never assumed; `x` through rank `α` (the carried `crossingIndex`);
  - no Newton or Darroch; the `θ*` law never used; no optimality.

**Carried set** (byte-identical from the governed runs, receipt-bound; gate ruling 19). Entry lists per the adjudications' named
dependencies; the Stage 7 panel generates the full per-fragment list from `Snippets/`.

| Award | Governed run | Kernel receipt (file SHA-256) | Receipted source SHA-256 | Load-bearing entries / fragments |
|---|---|---|---|---|
| r31 C1-LA1 | `…c1-la1-cb8-sector-template-feasible` | `d77284a7…5397` | `f0578ed7…b78e` | terminal 0033 `cb8_topRank_sectorTemplate_feasible` `b1129847…b0f1` (base entry 111); 0027 `…nonneg_out_in_switch` `0a376ba5…2f6a` (base entry 105; digest confirmed by me); 0024 `cb8_sum_in` `c3c4af85…b57f` (base entry 102); definitions 0001 `State8`, 0004 `cb8CGamma`, 0007 `cb8Theta`, 0008 `cb8Sigma`, 0009 `cb8Out`, 0010 `cb8In`, 0011 `cb8R1` |
| r31 C1-LA2 | `…c1-la2-cb8-definition-layer` | `dde486d3…e6f6` | `a906ec17…5f3f` | 0078 `cb8_topRank_of_descent_and_flow` `df7623e2…fea9`; 0040 `cbGraph_adj_r_choke` `bf806398…a570`; `cbGraph`, `cbVertex`, `cb_val_cases`, entries 23–26, 33–42, 57–60, 69/70, 75; r30 network Snippets 0014–0021 and first-interior 0014 as carried there |
| r31 C1-LA3 | `…c1-la3-two-binomial-descent` | `717a0830…fb72` | `c0605e12…3011` | 0020 `cb8_E1_conditionI_topRank` `8da112b4…6a3a`; 0014 `twoBinomCoeff_pos` `768f4ab5…a9ac` |
| r31 C2-LA1 | `…c2-la1-cb8-parent-descent-and-eligibility-on-the-tree` | `adb80684…a3ee` | `986b5257…0c9d` | 0546 `AdjU.cb8_crossingIndex_add_two_le` `5e0fd021…9255` (base entry 579); 0547 `AdjU.cb8_topRank_of_flow` `d2c95cbd…2787` (base entry 580; no certificate of its own; see correction 2); terminal 0549 `f42705a9…0205` if cited |
| r31 C2-LA2 | `…c2-la2-cb8-leaf-deletion-closed-forms-descent` | `4dd32752…3de8` | `e75c66b2…faae` | through C2-LA3's cone |
| r31 C2-LA3 | `…c2-la3-cb8-favorable-leaves-eq-leaf-set` | `29a2f834…ff0e` | `7dab4388…582b8a` | terminal 0090 `cb8_favorableLeaves_eq_leafSet_topRank` `81a0e7bf…de36` (base entry 606) |
| r31 C3-LA1 | `…c3-la1-cb8-e1-clone-transport` | `92e47b55…69ed4` | `1388fa52…eb15` | terminal 0053 `cb8_E1_cloneTransport_topRank` `596b4d7f…199e`; entries 30–51 in its cone (33, 37 among them), cited as "in the cone; no certificate of its own" |
| r30 C1-LA2 | `…2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate` | `dc1371a0…6803` | `7c279f4b…49f8` | 0030 `card_sigma_fiber_filter` `e8c6b0d1…83fe`; 0031 `exists_saturatingFlow_of_weightedHall` `ec521065…2ac2` (digests confirmed by me) |

**Items with no governed source, to be authored in-file** (face text, kernel-checked by the award, no certificate of their own):
- the E1 layer of the base, `E1FlowConstruction.lean`, with the `cb8G → cb8E1G` rekey. This means `cbOpenChokeCount`,
  `cbRootFree`, `cbOpenChokeCount_insert_of_not_choke`, `cb8R`, `cb8Rho`, `cb8R_natCast_eq_coeff`, `cb8Rho_lt_one_topRank` (its
  inputs are governed: C1-LA3 0020 and 0014), `cb8N`, `cb8N_nonneg`, `cb8E1G`, `cb8H`, `cb8E1Val`, `cb8E1Arc`,
  `exists_erase_of_sdiff_card_one`, `cb8E1Arc_shape` and the two `cb8E1Arc_zero_*` lemmas;
- `ChokeState.lean` (`chokeBeta`, `chokeGamma`, `chokeBeta_add_chokeGamma_le`, `IsSectorSource`, `chokeState`);
- Part A (`weightedHall_of_ratFlow_bound`, `exists_saturatingFlow_of_ratFlow_bound`; ONE interface copy, gate ruling 24(3)). If the
  panel prefers C-U3-T's N8 proof, which does not use Part A, Part A may be omitted;
- C2-LA1 entry 580, unless carried as in correction 2.

**NEW declarations and their attribution.**
- The frozen definition `cb8GSec` and all 20 frozen theorems, byte for byte (drafter: controller staff, R31-N-23).
- Their proofs:
  - N1: companion T1 (independent: U1); B1/B2/B3 **C-T1-F / C-T1-U** (B3 also C-U1-F);
  - N2: companion U1, main **C-U1-F** (clauses 2 and 5: U1 on base scratch);
  - N3: **T2**, binding C-T2-F / C-T2-U;
  - N4: `zero_classes` **T3**; `in_eq` and `in_le_one` **C-T3-U**;
  - N5: **C-T3-F / C-T3-U**;
  - N6: **U2**;
  - N7: companion **U2**; main **C-U2-F / C-U2-T**;
  - N8: **U3** (alternative: C-U3-T).
- The helper blocks: T2's; T3's Sections 0–3; C-T3-U's `crit_*`; the N1 critics' helpers; C-U1-F's §1–5 helpers and `crit_*` for
  N2; U1's `cb8N_eq_e1S_natCast`.
- The integration renames (the Stage 7 formalizer).
- The terminal itself (the stitch: U3; its conditional form: C-U3-F, C-U3-T).
- The integration merges: the T and U adjudicators.

The panel picks one proof text per node and cites the other as its second instrument.

**Attribution on the face.**
- Codex GPT-6's lower-region run: mechanism, weight, relation, (HALL).
- r30, named seats as registered: the network definitions, the awards (C1-LA2 entries 30–31 above), the criterion, threshold,
  favorability and closed forms, and the certificate method.
- Codex's heterogeneous-closure run: the coefficient mechanisms, as C1-LA3's face cites them.
- r31: the Cycle 1–3 award attributions as carried; the Cycle 4 seats and critics above, on every face; the adjudicators T and U for
  the integration merges.

**Excluded conclusions** (to be stated on the face):
- (HALL) at any other rank, at `m < 107`, at `m ≡ 0, 1 (mod 3)`, for `d ≠ 8`, for heterogeneous CB patterns, and for arbitrary
  trees;
- any aggregate status: full (HALL), the primary aggregate, TREE, FOREST, TRANSFER and #993 stay OPEN;
- LP optimality or the `θ*` law;
- any Newton or Darroch input.

`S(T_m, p*) ≤ 0` on the class rows follows by composing with r30's FLOW ⇒ SIGN award. It is **not** claimed on the face unless it is
composed in Lean, and even then it transfers no status.

**Repairs and hygiene.**
- Remove the reserved-name comment in `U3Stitch.lean`, and fix its two wrong comments (the wrong Part A file; the non-existent
  `print_axioms.sh`).
- The reserved name occurs exactly once, as the terminal.
- The options census goes on the face (0 `set_option`, 0 `native_decide`, 0 `admit` in both merges).
- Byte-compare all 21 frozen headers, and check type-hash parity against the base.
- Walker audit: a sorry-walk that must return `[]` for the terminal, with a positive and a negative control (U's walker-fragility
  finding).

**Isolated second reads that run CONCURRENTLY with this Stage 7** (run-qualified names, since `SR-C4-*` already names r30 records under
`sources/r30/second-reads/`):
- **R31-SR-C4-1**: N1 B1/B2/B3, from the C-T1-F/C-T1-U texts; B3 also from C-U1-F.
- **R31-SR-C4-2**: N2 main (C-U1-F), including clause (1)'s guard argument and clause (4)'s `w_A = 0` case.
- **R31-SR-C4-3**: N4 `in_eq`/`in_le_one` (C-T3-U) and N5 (C-T3-F/C-T3-U), including the sector-image classification and the
  `γ = 0` junk-value reading.
- **R31-SR-C4-4**: N7 main (C-U2-F/C-U2-T), including `q ≤ m`, `γ ∈ {0, 8}` and exact `≤`/`≥` (zero slack).
- **R31-SR-C4-5**: the F2-T composed-flow computation (`crit_f2t.py`, replayed and read in isolation, with the E1 class-count reduction
  stated on its face).

These reads do not gate the kernel certificate. They gate the attribution, the informal grade of the critic-derived lemmas, and any
registration that cites them.

### Fallback groups (funded ONLY if C4-LA1 is abandoned at Stage 7; together within ruling 31's cap of two)

Each fallback lies wholly inside one orientation's already-built merge, so neither needs the cross-orientation integration.

- **C4-LA2 — the sector half (N3 ∪ N4 ∪ N5), from T's `AdjMerged.lean`.**
  - Terminal: the conjunction of the 10 frozen texts, frozen lines 139–246, against the single frozen `cb8GSec`.
  - Hypotheses as on each face: the class enters only in `nonneg_and_support`, `out_ge_one` and `in_le_one` (through C1-LA1 entries
    105 and 102); the rest is rank-pinned at `p*` with `m` free.
  - Fences: no (HALL), no flow existence, tag set `leafSet`.
  - Carries: C1-LA1 0027 and 0024 (and the definitions), and C1-LA2's graph layer.
  - In-file: `ChokeState.lean` and the helper de-duplication.
- **C4-LA3 — the composition tail (N6 ∧ N7 ∧ N8), from U's `merged.lean`.**
  - Terminal: the conjunction of the four frozen texts. N7 and N8 are conditional by design (gate ruling 26); N6 is unconditional
    for `m ≥ 1`.
  - Carries: C1-LA1 0033; C2-LA3 0090; C3-LA1's cone; C1-LA2 0040, 33, 34, 60, 69/70; r30 0030/0031.
  - In-file: `cb8Rho_lt_one_topRank`, `cb8R_natCast_eq_coeff` and Part A.
  - Excluded: no (HALL) by itself.

**Named but not funded at this Stage 7: the E1 half (N1 ∪ N2).** It is contract-ready on the union, but it needs the cross-merge, and
the cap is two. It goes to Cycle 5 if C4-LA1 fails.

**No award attempted: none.** No DAG in the record is open.

## Progress and stop-gate ruling

- **Decisive event at Stage 6: none.**
  - (a) is not met: Tier 1 is not yet `formally_verified`. It becomes met if and only if C4-LA1 closes at this cycle's Stage 7 at
    full scope; the run then ENDS at that Stage 7 close, and the terminal close follows.
  - (b) is not met: no eligible deficient cut, and none proposed.
- **Material progress: yes.** At Cycle 4 entry no conjunct-4 leaf was compiled. Now all 20 frozen declarations are compiled scratch on
  the frozen text, across two adjudicator merges, and the terminal DAG is closed on the record. This is material progress on Tier 1's
  formal closure, and on the literal-network form of (L-S)_top.
- **Adversarial finding: yes, a new one.** The exact two-sided tightness of the sector template (E-6).
- **Plateau: no**, under both readings:
  - SOLUTION-CONTRACT §5 verbatim (gate ruling 28): material progress and a new adversarial finding are both present.
  - The protocol's operational gloss: `COND4_formal`, `E1_formal` and `TERMINAL_integration` all advanced at the compiled-scratch
    level. There is no new registration above `bounded_computation` yet; one alone does not make a plateau.

  The consecutive-plateau count stays **0**: Cycle 3 closed C3-LA1 and was not a plateau.
- **Ceiling:** this is Cycle 4 of 6.

**Gate lines** (ruling 32, synthesized over the union of the record):

```text
COND4_formal: advanced (all conjunct-4 frozen declarations compiled scratch across two merges; no governed award yet)
E1_formal: advanced (N1 closed by T; N2 closed modulo {B1, B2} by U; union closed; no single build)
TERMINAL_integration: conditional (U stitch residual = 7 T-closed leaves; cross-orientation build owed)
cut_candidate: none
FROZEN_NODES_CLOSED: N1, N2, N3, N4, N5, N6, N7, N8
```

The `FROZEN_NODES_CLOSED` line reports the union of the rulings. N2's closure is by composition across the two merges, not in one
build.

headline_resolved: no
material_progress: yes
plateau: no

## Next-cycle portfolio

**Applies ONLY if C4-LA1 does not close at the Cycle 4 Stage 7.** If C4-LA1 closes, decisive event (a) ends the run, and this
portfolio lapses. The portfolio uses the standard 9-route topology, three routes per orientation. Nothing here is outside the charter.
Every route works on FROZEN text or on the award packet; none invents a statement.

**Orientation T (prove).**
1. **T1 — `C5-T-01` `CROSS-MERGE-FROM-T-SPINE`.**
   - Object: start from `AdjMerged.lean` (`b25201ca…`). Splice in the U-closed N2 (C-U1-F), N6, N7 and N8 bodies by anchor-merge, and
     resolve the helper clashes by rename (proof bodies only). Then build the §2 terminal under a NON-reserved name.
   - Could close: all 20 frozen declarations and the terminal sorry-free in ONE file, with walker `[]` under positive and negative
     controls.
2. **T2 — `C5-T-02` `UNGOVERNED-E1-INPUTS-ON-GOVERNED-CARRIES`.**
   - Object: re-author, in an award-ready block, `cbOpenChokeCount` (with `_insert_of_not_choke` and `_le`), `cb8R`, `cb8Rho`,
     `cb8R_natCast_eq_coeff`, `cb8Rho_lt_one_topRank` and the `cb8E1Arc` layer. They must rest only on the governed fragments C1-LA3
     0020/0014 and the C1-LA2 layer.
   - Could close: an E1 vocabulary with no ungoverned input; with it, the E1 half (N1 ∪ N2) as an award candidate.
3. **T3 — `C5-T-03` `SECTOR-VOCABULARY-AND-INTERFACE-AUTHORING`.**
   - Object: author `ChokeState` (Part B), Part A (or adopt C-U3-T's Part-A-free N8), the `choke_neighborFinset_inter_card`
     unification, and the `no_choke_of_root_mem` de-duplication, as one award-ready block. Carry entry 580 byte-identically from C2-LA1
     Snippet 0547.
   - Could close: the sector half and the interface with no ungoverned input.

**Orientation F (falsify).**
1. **F1 — `C5-F-01` `MERGED-BUILD-FROZEN-TEXT-FIDELITY-AUDIT`.**
   - Object: audit the T1 and U1 merged builds clause by clause:
     - byte identity of all 21 frozen blocks, and a single `cb8GSec` (no local copy; R31-E-i);
     - `#print axioms` for every N-node and the terminal;
     - receipt-binding of every carry against the table under `## Lean awards`;
     - the options census, and the reserved name absent;
     - a walker with name-resolution controls.
   - Could close: a signed merge-fidelity record that every Stage 7 panel cites.
2. **F2 — `C5-F-02` `LITERAL-COMPOSED-FLOW-VIA-PROVED-QUOTIENT-AT-161`.** This is the owed mandatory object, repaired.
   - Object: at the structural row 161, with (WID) from independent sides, the derived selector and `x` computed FIRST, evaluate
     `cb8E1Arc + cb8GSec` arc by arc from the definitions (Lean truncations included).
     - Either do so on orbit-quotient classes under r30's PROVED quotient key (its scope checked to admit an arbitrary rational `g`),
       or write the symmetry argument on the face.
     - Output every source row minus `w` and every target `w` minus column.
     - Include a structured `X` built from the E-6 tight family, with `N(X)` computed from (REL).
   - Could close: a non-conditional row certificate (a `computer_assisted` candidate after two instruments and a second read), or an
     exact cut (a decisive (b) candidate).
3. **F3 — `C5-F-03` `ZERO-SLACK-AND-BOUNDARY-FALSIFIER`.**
   - Object: execute, under Lean conventions, the ungoverned inputs and the boundary readings:
     - `cb8Rho_lt_one_topRank` at `q = m` and `q = 1`;
     - `cb8CGamma 0` in N5 at `γ = 0`;
     - `γ = 8`;
     - `q ≤ m` in N7;
     - Part A's rows-`≥` interface;
     - the exact-tightness splittings (E-6) against the frozen `cb8GSec` at 107/158/161/164, plus one fresh row.
   - Any counterexample must be exact and, where decidable, kernel-checked.
   - Could close: adversarial clearance of every zero-slack point, or a mis-statement found before Stage 7.

**Orientation U (formal / structural).**
1. **U1 — `C5-U-01` `CROSS-MERGE-FROM-U-SPINE`** (dual of T1; neither consumes the other's merge, as in gate ruling 30).
   - Object: start from `merged.lean` (`ae2a3886…`). Transplant T's B1/B2 (C-T1-F or C-T1-U) and the N3–N5 proofs (T2, T3, C-T3-U).
   - Could close: an independent single-file build with walker `[]` for the stitch; two independent integrations for the panel.
2. **U2 — `C5-U-02` `GOVERNED-SINGLE-FILE-AWARD-LAYOUT`.**
   - Object: fold `C3LA1`, `U3Interface`, `E1FlowConstruction` and `ChokeState` into the single-file award layout. The frozen text
     differs only in proof bodies; the elaborated types are hash-identical to the base; the options census is counted.
   - Could close: an award-ready C4-LA1 packet that a Cycle 5 Stage 7 can verify without new statements.
3. **U3 — `C5-U-03` `CARRY-MANIFEST-AND-RECEIPT-BINDING`.**
   - Object: generate the complete per-fragment carry manifest (origin award, entry number, fragment digest, receipt) for every
     carried declaration in the terminal's cone. Also produce the minimal cone: the carried entries the terminal actually uses.
   - Could close: the carry table that closes C4-LA1's provenance items outright.

## Registrations

Grades and attributions travel on every face. Anything first stated by an adjudicator or by me is **STATED**, and needs an isolated
second read before registration. The controller funds and seats those reads.

**At the Stage 6 close: no new key.** Nothing registers above `bounded_computation` at this close by itself.

**Conditional on C4-LA1 closing at Stage 7** (the controller registers after the award closes and its receipt passes):
- **R-C4-1 (Tier 1 key).** The name is the controller's, in the `E993-R31-` namespace. A candidate is
  `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-ELIGIBLE-AND-WEIGHTED-HALL`.
  - Alias-check it against `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`
    and the five-row keys. The r31 key is the family theorem, not a row certificate, and it overlaps that key at `m = 107` only.
  - Grade: `formally_verified` at the exact scope (`m ≥ 107`, `m ≡ 2 (mod 3)`, rank `p*` only, `d = 8`).
  - Attribution: as on C4-LA1's face.
  - **Scope note on its face:** FLOW ⇒ SIGN gives `S(T_m, p*) ≤ 0` on these rows only, and no status to any aggregate.
- **Scope notes:**
  - on `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` and `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: "r31 Tier 1 formally
    verified on CB(8,m), m ≥ 107, m ≡ 2 (mod 3), at p* only; no status transfer; key stays OPEN";
  - on the r30 row key above: "continued by the r31 family key on the class from m = 107".
- **Scope note on the C1-LA1 key** (Cycle 1 registration R-1): the affine separation is attained with **zero slack at both ends** at
  `p*` (the E-6 finding). It is a polynomial identity (STATED by the F adjudicator; hand-checked by me) with bounded attainment at
  95/107/158/161/164. This is not LP optimality, and the `θ*` law stays `conjecture`. It needs **R31-SR-C4-6** (below).

**Unconditional ledger records (no key; no status):**
- **The E-5 three-row conditional composed-flow confirmation.** `bounded_computation`, STATED, conditional, critic-attributed to C-F2-T
  (C-F2-U agreeing per class). Needs R31-SR-C4-5.
- **The sector-image classification lemma.** A `proved_informal` candidate, critic-attributed to C-F3-U (C-F3-T agreeing). It is
  subsumed as face content if C4-LA1 closes. Needs R31-SR-C4-3.
- **The off-class failure at CB(8,1), `p = 6`,** and the fact that CB(8,1) and CB(8,2) have **no eligible rank**. `bounded_computation`,
  critic-attributed (C-F2-U, C-F2-T). These are adversarial facts: not cuts, not class statements.
- **The record corrections** 1–5 under `## Headline verdicts`, as correction records.

**Isolated second reads to fund:**
- R31-SR-C4-1 through R31-SR-C4-5, as named under `## Lean awards`. They run CONCURRENTLY with the C4-LA1 Stage 7.
- **R31-SR-C4-6:** the tightness identity `(25m/2 + 5)K − 7m/2 = (200m² + 82m + 5)/3` at `K = (16m+1)/3`, and its consequence for C1-LA1
  base entry 92's per-state bound (Out attained at 1, In attained at 1). The reader works from C1-LA1's governed Snippets and the
  frozen texts only.
- The seven unverified `CHECKPOINT-ANALYSIS-C3.md` quotations, and the 20 unverifiable R-11 drafter-scratch literals (F's residual
  items): a controller-staff record check, not a mathematical read.

## Continuation ruling

continue: yes

The protocol's template glosses a yes on the continue flag as "Cycle 4 should run". Cycle 4 is the current cycle, so I read the flag as "the run
continues". No decisive event has occurred at Stage 6, and this is not a plateau cycle.

1. **Stage 7 of Cycle 4 funds C4-LA1** (the Tier 1 terminal under the reserved name). The integration build is its first step. The
   concurrent isolated second reads are R31-SR-C4-1 through R31-SR-C4-5 (and R31-SR-C4-6 for the scope note).
2. **If C4-LA1 closes** at full scope with a passing receipt, decisive event (a) occurs. The run ENDS at that Stage 7 close, the
   terminal close follows, and the Cycle 5 portfolio lapses. The Cycle 6 checkpoint is then moot; the controller decides whether the
   terminal review takes an independent analysis.
3. **If C4-LA1 is abandoned,** the panel falls back to C4-LA2 and C4-LA3 (both within ruling 31's cap), and Cycle 5 runs the portfolio
   above. The checkpoint's forecast ("reachable by Cycle 6 with about one cycle of slack") is unchanged or better: the remaining work
   is integration engineering, not mathematics.

## Artifact inventory

- **Deliverable:** `cycles/cycle-4/stage6/SYNTHESIS.md` (this file; the directory `stage6/` was created for it).
- **Scratch:** `scratchpad/c4-S/`.
  - `identity_check.py`, SHA-256 `bfe2fbf524032f4fc7a19ee9fb22e3c9bce5a0681a4846209c1c64f1e8af8fa4`: an exact check of the tightness
    identity, with the standard library and `fractions` only.
  - `identity_check.out`, SHA-256 `72f5b9bc06ba9b6045ac5a3264d0706187293ec18fc2c3de126dd3e13c12d7c9`.
  - A transient 20-line copy of base `Main.lean` lines 12245–12264, used for the entry-580 diff, was deleted after the check. The diff
    result is recorded under `## Headline verdicts`, correction 2.
- **Replay:**
  - `cd <run root>/scratchpad/c4-S && python3 -B identity_check.py`.
  - The seal checks are those described under `## Identity and seal audit`: canonical JSON without `seal_sha256`, sort_keys,
    separators `(",",":")`.
- **Background jobs:** none started. Every command ran in the foreground, so there was nothing to kill before this write. There was no
  Lean or `lake` invocation, no network, no installs and no process listing.
- **Writes:** this file, and scratch under `scratchpad/c4-S/`. The one stray write outside the run root is disclosed above, and it was
  deleted.
