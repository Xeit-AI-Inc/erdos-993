# Critique

Critic `C-T3-F` (orientation F, falsify) of seat `T3`, route `C4-T-03`, mechanism token `SECTOR-IN-BRIDGE-ZERO-CLASSES-AND-A2`
(orientation T), r31 Cycle 4 Stage 4. Written 2026-09-29 (clock read: 00:33 EDT at the start of the write).

**Boot.** Operating within VerityOS, restricted boot: I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch
`control/dispatch/c4-stage4/DISPATCH-C-T3-F.md` (SHA-256 `5ec71cc6b8024685bd6ea7bb1ce0b5b2588df5f30b12e804a34e9b43e28398bb`,
recomputed with `shasum -a 256`; it matches). I read no other VerityOS file outside the run root. The read-boundary items are
listed under `## Artifact inventory` (disclosures).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Capsule seal** (`control/c4-critic-capsules/T3-PACKET-MANIFEST.json`). I recomputed SHA-256 over the canonical JSON without
  `seal_sha256` (sort_keys, separators `(",",":")`, no trailing newline): `2af65c40b949cddfe71325e2a2ca755a79b9febadf5edd1fa4acf7f4e1af4751`.
  It **matches**. All 16 listed members match their recorded SHA-256 and byte counts.
- **Stage 4 dispatch seal** (`control/C4-STAGE4-DISPATCH-MANIFEST.json`): recomputed `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023`. It **matches**.
- **Stage 3 seal** (`control/C4-STAGE3-PACKET-MANIFEST.json`): recomputed `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e`. It **matches**. The
  assigned return is listed there as `3619904b0369f4baab7c3ff4e9ea4b990b2dfb3517e8ef3d33bf36ff37b0edb6` (29740 bytes), and the file matches.
- **Stage 2 seal** (`control/C4-STAGE2-PACKET-MANIFEST.json`): recomputed `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`. It **matches** the value in the protocol.
- **Digests the return lists** (all recomputed by me with `shasum -a 256`, all matching):
  - frozen statements `.lean` `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1` and `.md` `6aa6dfe5971a187be2be41cc1e350db4beff187ca5b648cdb9aec2edc5eca54b`;
  - the base: `Main.lean` `385af1bf…62ea3f`, `ChokeState.lean` `64a101ef…fd3bb`, `E1FlowConstruction.lean` `d26e702b…aab8`, `C3LA1.lean` `49b227d3…455c91d`,
    `Statements.lean` `0fc723d7…39ede1`, `lakefile.toml` `45d0ca58…94ff49`, `lake-manifest.json` `52a4d73c…46c7c`, `lean-toolchain` `2bdc48ad…037273`;
  - `preimage_check.py` `f7c9fe84d7d4f1df34d582563a3a051035e1a6b90b64f6e26b9107086ed0f2c9` and `preimage_check.out.txt` `036a704be3b3cbff18a88f253a5fe0bcacc038434c8e90ffb8ca8f4675ccdfe6`;
  - `T3.lean` `3359e810667923da3d80eb5296a97538e2f7c76cf8520fa3227d584de70b036b`, `build-t3-12.log` `9db37b0e269526eb6b579a251910227a987a314724f2678a420b092155d26b1c`,
    `axioms2.log` `0af71ed1a7fecf948ec2d22c4e7df305bd4dcdf652f9c85ded56694a2151fc1c`, `verify_n4_n5.py` `6cbbcdfb5652ba035e14dabb11c485020c6794ab7a0dbe6f2dfd3a39e1bae708`,
    `verify_n4_n5.out.txt` `e64d8f10b0e8ead57fdf8fdf6eef8540d5912d1eedd871d4244b9bfa766cec57`.
- The Mathlib pin in the critic project is `905b95818eb32af7874a58b427f50c1711a5e96c`. It matches `sources/mathlib-binding/PIN.json`.
- **Unmatched digest literal, not caught at admission.** It sits in the header of T3's Lean scratch, not in the return:
  `T3.lean` line 18 attributes its adapted chain to `sources/c3-scratch-lean/c3-crit-T3-U/LeanProject/critic-section.lean` with
  "verified SHA-256 c1e6b8f2...". The actual digest of that file is
  `c0d1794fdc3698ce23cdd0cc82b3f261e800f7514b0f9c8162fa2e6aafb31e75`, and the return's digest table does not list it. **Struck** (see
  `## Certification audit`).
- **Identity.** The route ID, the mechanism token and the owned nodes (N4 ×3, N5 ×2) are verbatim from `control/C4-ALLOCATION.md`. The
  return proposes no new `E993-R31-` key, so there is nothing to alias-check. Its registry list (the (HALL) key and the primary
  aggregate, both OPEN, and the CBSTAR / criterion / threshold / favorability keys and the r30 m=95–107 row key) is correctly described
  as untouched by this route.

## Independent re-derivation

**R1 — the compiled claim, replayed copy-out-first.** I copied `sources/c4-base/LeanProject` into
`scratchpad/c4-crit-T3-F/LeanProject`. I copied in the controller-built base cache `scratchpad/c4-base/LeanProject/.lake/build`
(CF-C4-S3-1; never `--no-cache`, never the seat's cache) and bound Mathlib by manual symlink. I copied in T3's `T3.lean` (digest verified). Then
`lake build LeanProof.T3` exited 0 with 0 errors (`build-replay-T3.log`). `#print axioms E993Transport.cb8GSec_zero_classes` gave
`[propext, Classical.choice, Quot.sound]` (`axioms-replay-T3.log`). `T3.lean` contains no `sorry`, `admit`, `native_decide`,
`set_option` or `decide` (the word `sorry` appears only in comments).

**R2 — byte fidelity, and the stronger test: the frozen declaration itself.** T3 proves its theorem in a file that does NOT
import `Statements.lean`. That file carries a byte copy of `cb8GSec` and has a different file-level `open` line (`open SimpleGraph Classical`, where the frozen
file has `open SimpleGraph Polynomial`). Byte-identical text in a different elaboration context does not by itself show that the
frozen node closes. I checked three things (`byte_and_splice.py`):
- the `cb8GSec` definition text in `T3.lean` is byte-identical to the frozen one (709 bytes);
- the `cb8GSec_zero_classes` statement through `:= by` is byte-identical (724 bytes);
- **splice test.** I took the frozen `Statements.lean` verbatim, inserted T3's helper lemmas in a `section … open Classical … end` block
  before the frozen N4 docstring, and replaced ONLY the `sorry` body of `cb8GSec_zero_classes` with T3's proof
  (`SpliceN4Z.lean`, `8495d95e…c5ff`). The `diff` against `control/C4-FROZEN-STATEMENTS.lean` removes exactly one line (`  sorry`) and
  adds nothing else outside the helper block and the body (`splice-vs-frozen.diff`). `lake build LeanProof.SpliceN4Z` exited 0.
  `#print axioms E993Transport.cb8GSec_zero_classes` on the frozen declaration in its own file gave `[propext, Classical.choice, Quot.sound]`.
  The control `cb8GSec_in_eq` in the same file still shows `sorryAx`, so the detector is live (`axioms-splice-N4Z.log`).
  **T3's proof closes the frozen `cb8GSec_zero_classes` byte for byte, in the frozen context (ruling 23).** This confirms the return's
  central claim more strongly than the return itself showed.

**R3 — my own instrument for N4 and N5** (`crit_n4n5.py`, SHA-256 `201e3de4…8e53`; output `crit_n4n5.out.txt` `0dd656d2…d108`; report
hash `96ea96d750a93372c61ac24f9db4b08cf8c8383d3ae6d8abb6612446ce39fa30`). I built it from the contracts, not from T3's or the drafter's code:
- the graph comes from SEMANTIC-CONTRACT §2;
- the literal carried `transportRel` is scanned generically;
- the **active-tag weight is computed from its definition** (degree-1 leaves, `W_x = N(s_x) ∖ {x}`), not from the N6 formula;
- the C1-LA1 tables are **parsed from `Main.lean`** (36/36/7 cells);
- `cb8GSec` follows the frozen guard exactly: `IsSectorSource` = independent ∧ `r, v ∈ B`, `B ∈ I_(p*+1)`, `transportRel`.

The layers are written textually: sources in `I_(p*+1)`, targets in `I_(p*)`, difference index `i_(p*+1) → i_(p*)` at `p* = (16m+4)/3`.

- **CB(8,1), exhaustive (p* = 6).** Two sides: column sums accumulated FORWARD from all 8332 sources of `I_7` over every literal image,
  against the closed forms read from the TARGET (`Σ_i cb8In(state_i A)`, `(8−γ)σ(γ)`, `0`) on all 8484 targets of `I_6`.
  Results:
  - `in_eq`: 1120/1120 in-sector targets, 0 failures;
  - N5 inflow (i): 70/70, 0 failures;
  - N5 inflow (ii) no-preimage class: 126/126, 0 failures;
  - N5 census (set equality, count `+ γ = 8`, states `(1, γ)`): 70/70, 0 failures;
  - zero classes (i) 47740, (ii) 51100, (iii) r/v/s 1792 each: 0 failures;
  - the backward preimage enumerator (used at larger `m`) reproduces the forward sector-preimage set on 8484/8484 targets.
- **Sampled rows** (backward complete enumeration, then literal `transportRel`, independence and size re-checked):
  - `m = 2` (p* 12), `3` (17), `107` (572), `158` (844): every class, 0 failures on `in_eq`, inflow (i), (ii) and the census (for example
    `m = 107`: 8 in-sector, 9 one-choke-with-`v`, 8 no-preimage targets, census 9/9).
  - `in_le_one` sampled: 0/8 exceed 1 at `m = 107`, 0/6 at `m = 158`, 0/23 at `m = 2`. At `m = 3` it is **24/24 > 1**. This is expected (the
    frozen `in_le_one` carries `107 ≤ m`), and it shows the instrument can detect a violation.
  - Zero-class (iii), fourth sub-fact, at a **non-vacuous** instance: a sector source in `I_(p*+1)` with a choke in state `(1,0)`, where the
    guard of `cb8GSec` holds and the value is 0. Found 3/3 at `m = 3, 107, 158`. At `m = 1, 2` this state is **impossible in the layer**
    (5 legs on one choke; 10 legs on two chokes of capacity 8 with one of them at 1 leg).
- Observation, no frozen claim: at `m = 1` there are 1400 arcs with NEGATIVE `g_sec` values, because the intercepts are negative and `m`
  is outside the class. The N4/N5 identities do not depend on sign, and nonnegativity is N3's class-only companion. At `m = 1` the
  7168 "other" targets (`r ∉ A`, no choke) all receive 0.
- These are bounded checks (`bounded_computation`). They are never evidence of the universal statements. For N5 the universal
  statement is now formal (see `## Attacks and findings`, F6).

**R4 — the prior instrument the return leans on, replayed copy-out-first.** `sources/c3-stage7-sources/crit-U1-F/preimage_check.py` was copied to
`scratchpad/c4-crit-T3-F/replay-c3-preimage/` and rerun. Its output is **byte-identical** to the recorded one (`036a704b…ccdfe6`):
- CB(8,1): 255 images, 0 failures;
- CB(3,2): 378, 0 failures;
- CB(3,3): 15309, 0 failures;
- CB(4,2): 2430, 0 failures.

## Attacks and findings

**F1 — the zero classes are real, not vacuous (attack-brief question 1).** I read each conjunct against T3's proof and my instrument.
- (i) Non-sector sources: the proof is `dif_neg` on the guard. It is correct, and correctly needs no independence.
- (ii) Weight-zero targets: universal over all `B, A`. The proof shows that every summand that could be nonzero forces a positive-weight
  witness in `A`: `v` via `r`, or `c_kj` via `u_k`. The witnesses are the carried `tagWitnesses` (entry 32), not N6. My instrument shows
  5376 arcs at `m = 1` where the guard HOLDS and `w(A) = 0` (switch at `s`, deletions of `r`/`v`), so (ii) does work beyond the guard.
- (iii) The four sub-facts are universal over `B ∋ r, v` (no layer hypothesis). T3 proves them by set algebra without deciding
  `s ∈ B`. The guard-holding instances are:
  - `erase r`, `erase v`, switch at `s`: 1792 each at `m = 1`, all with value 0;
  - the `(1,0)` switch: 3/3 at `m = 3, 107, 158`, value 0 because `1 ≤ γ` fails.

  The `(1,0)` class is empty in the layer only at `m ≤ 2`, never at class rows. **None of the frozen zero classes is vacuous at the
  class rows.** T3's own script reported `checks=0` for `(iii-d)` at EVERY row including 107/158. That was a sampling artifact of
  greedy saturation, and the return did not notice it; the Lean proof does not depend on it.

**F2 — T3's abandoned instrument: the bug is diagnosed, and the return's diagnosis is wrong.** The return attributes the 100% failures of
`verify_n4_n5.py` on `in_eq`/`in_le_one`/N5 to "most likely … `make_open_leg_alloc`/`det_in_targets`'s leg bookkeeping, or a
sign/direction slip in `transport_rel_holds`". That is **incorrect**. The defect is a **fidelity failure**:
- its `is_sector_source` returns `0 in B and 2 in B`, dropping the independence conjunct of the frozen `IsSectorSource`
  (`IsIndepSet ∧ r ∈ B ∧ v ∈ B`, ChokeState.lean);
- its `g_sec` omits the guard's layer conjunct `B ∈ indepFamily (p*+1)`.

So non-independent candidates were admitted:
- `A ∪ {b_ij}` with `c_ij ∈ A` (charged `Pb`);
- `A ∪ {r}` next to an open choke (a spurious N5 "preimage");
- `(A ∖ {u_i}) ∪ {r, b_ij}` with `c_ij ∈ A`.

Copy-out-first replay: I patched only these two conjuncts (`replay-T3-verify/patch.diff`, `b1bd8b0a…98f2`). On T3's own deterministic
targets at `m = 1, 2, 107`, every `in_eq`, N5 census and inflow (i)/(ii) check then passes: 0 failures (`patched.out.txt`,
`bda8d64e…ffe`). The only residual "failure" is `in_le_one` at `m = 1`, a scope error of the script: the frozen statement requires
`107 ≤ m`. The same script also measured weight through the N6 formula rather than `activeWeight`, a second fidelity weakness. The
discrepancy that item 3 of the return's remaining obligation leaves open is **resolved**. It is neither evidence against the frozen texts
nor a cut.

**F3 — the informal N4 `in_eq` derivation.** I re-derived it independently, and it is correct in substance. Two points are imprecise:
- (a) The deletion-preimage case says "`y` a leg vertex at an empty leg". Every other `y` is excluded only because `B` then fails
  independence (the guard): `y = s` or `u_k` is adjacent to `r`, and `y` at an occupied leg is adjacent to the present support or leaf.
  The derivation needs that step, but it is not written.
- (b) The `in_le_one` sentence ("using `1 ≤ cb8_sector_legCount`-style bookkeeping") is garbled. The actual step is: the leg count of
  the in-sector TARGET `A ∈ I_(p*)` is `p* − 2 = K − 1`, with `K = (16m+1)/3 = p* − 1` on the class. With that and C1-LA1 terminal (iii)
  (In ≤ 1 at leg total `K − 1`), `in_eq` gives `in_le_one`. Also, N3's `cb8_sector_legCount` is stated for any `IsSectorSource`,
  so it applies at `A`.

Grade: informal derivation, stated at this review stage. It is numerically corroborated (R3: `in_eq` exhaustive at `m = 1`, sampled at
2/3/107/158). It is **not** compiled.

**F4 — the informal N5 derivation and its cited support.** The derivation is correct. Two points:
- Its (⊆) wording ("deletion cannot CREATE `u_i`") is muddled. The right step is: a deletion arc gives `A ⊆ B`, so `u_i, r ∈ B`,
  which contradicts independence.
- Its clause-(ii) sketch omits the deletion images (they contain no choke, by the same step).

The return says `preimage_check.py` "checks the exact generalized-to-`CB(d,m)` version of this claim". That is **overstated**. That
instrument only collects SWITCH-arc sector preimages at choke images (at every rank). It does not check that deletion-type sector
preimages are absent (the full ⊆ of the frozen filter), the layer restriction to `I_(p*+1)`, or any inflow value. It supports the
switch census only. Struck to that scope.

**F5 — "two instruments in the formal sense".** The return's `## Instrument sides` calls the elaborator plus a separate `#print axioms`
pass "two instruments". That is one instrument (the Lean kernel) run twice. Since no numeric claim rests on it, this is a mislabel,
not a defect in the claim. The build record also says "`#print axioms` on every T3.lean declaration", but `axioms2.lean` covers 6 of
the 25 declarations. The terminal is covered, which is what matters. Narrowed.

**F6 — critic-derived advance (attributed to C-T3-F): both N5 frozen declarations compiled sorry-free, in the frozen context.** This
is the step the return leaves open (its remaining obligation item 2). I wrote `LeanProject/LeanProof/CritN5.lean` (510 lines, SHA-256
`97e0c568…558a`; imports T3's scratch for `cb8GSec` and three helpers). It contains the frozen `cb8_sector_switchPreimages` and
`cb8GSec_switchImage_inflow` with statements **byte-identical** to the frozen text (1024 and 567 bytes, `splice_n5.py`). The proof
route:
- (⊆) `crit_preimage_form`: a related independent `B ∋ r` of a target `A ∋ u_i` must arise from the `u_i`-switch. Deletion puts
  `u_i, r ∈ B`, which is impossible. The switch vertex is forced to be `u_i`, and `|N(u_i) ∩ B| = 2` with T3's
  `choke_neighborFinset_inter_card` gives a unique `b_ij ∈ B`. Then `B = (A ∖ {u_i}) ∪ {r, b_ij}` and `c_ij ∉ A`.
- (⊇) `crit_Bj_props`: each such set is independent (uses `cbOpenChokeCount A = 1` for `r`, `v ∈ A` to exclude `s`, and `c_ij ∉ A`),
  has size `p*+1` (guarded ℕ subtraction through `0 < A.card`), and is related by the `u_i`-switch.
- Injectivity, states `(1, γ)`, and count `+ γ = 8` via the filter complement.
- Inflow (i): the sum restricted to the guard's support, reindexed through the census, with each arc value
  `σ(γ)`. At `γ = 0` the switch is not charged and `σ(0) = c_0·θ = 0`.
- Inflow (ii): every choke of the target equals the switch vertex (else it sits in `B` next to `r`), so at most one choke. In the
  one-choke case `v ∉ N(u)` forces `v ∈ A`.

`CritN5` builds: exit 0 (`build-critN5.log`). Axioms for both are `[propext, Classical.choice, Quot.sound]` (`axioms-critN5.log`).
**Frozen-context node test.** `SpliceN45.lean` (`262d102e…8573`) is the frozen `Statements.lean` with helper blocks inserted and ONLY
the three `sorry` bodies of `cb8GSec_zero_classes`, `cb8_sector_switchPreimages` and `cb8GSec_switchImage_inflow` replaced. The `diff`
removes exactly three `  sorry` lines (`splice45-vs-frozen.diff`), and every statement is byte-identical. The build exits 0, and
`#print axioms` on the three frozen declarations gives `[propext, Classical.choice, Quot.sound]`. The controls `cb8GSec_in_eq` and
`cb8GSec_in_le_one` still show `sorryAx` (`axioms-splice-N45.log`).

One engineering note for Stage 7: in the frozen file the inflow theorem is NOT under `open Classical in`, so its proof body begins with
the `classical` tactic. That affects only the proof term; the statement is unchanged. The frozen node **N5 is therefore closed
(both declarations) in critic scratch**. It is ungraded until a governed award closes (SOLUTION-CONTRACT §4) and needs an isolated second
read. N4 now has 1 of 3 declarations compiled (`zero_classes`, T3). `in_eq` and `in_le_one` remain open.

**F7 — the ℕ-subtraction and endpoint audit.** No ℕ subtraction appears in T3's statement. In mine:
- `(8 − γ : ℚ)` is a rational cast. The card identity is proved additively (`card + γ = 8`) and only then cast.
- `(A.erase u).card = A.card − 1` is guarded by `u ∈ A`.
- `p* = (16m+4)/3` enters only as a layer index. No asymptotics, no `M_0`, no Newton/Darroch, no residue hypothesis: every compiled
  statement here holds for all `m` exactly as frozen. The endpoint `m = 107` and the rows 158/161/164 are not load-bearing for
  unconditional statements. My sampled rows 107 and 158 were checked anyway (0 failures). Row 164 was not run and row 161 not
  reached: bounded checks are not required for an unconditional formal statement, and I name the omission.

**F8 — no cut, no template failure.** Nothing in this seat's object touches Hall sums. `cut_candidate: no`.

## Mechanism-equivalence and fence check

- One rank (`p*`), `d = 8`. The compiled N4/N5 statements are unconditional in `m` because their frozen signatures are. They assert no
  (HALL), transfer no status to any aggregate key (fence 1), use no `θ*` law, no Darroch/Newton, and no census as proof (fences 3, 5, 7).
- Fidelity (fence 2): `cb8GSec`'s guard is the frozen one. The weight in N4 (ii) is the carried `activeWeight` on
  `C5LA1.leafSet` (bridged to `favorableLeaves` only by C2-LA3, which this node does not need). The relation is the carried
  `transportRel`. (WID) `supply − capacity = S` is **not applicable**: neither the return nor this critique states any network total or
  Hall sum. The selector `F_{p*}` is not derived here because the frozen N4/N5 texts are stated at `leafSet`. That is ruling 24(5)'s
  tag-set split, not a fidelity lapse.
- No refuted mechanism is revived (fence 6). The reserved name `cb8_topRank_eligible_and_weightedHall` occurs 0 times in `T3.lean` and
  in `CritN5.lean`. There are no new registrable claims and no `E993-R31-` candidates, so there is nothing to alias.
- Gate ruling 23: T3's terminal and my two terminals are the frozen texts byte for byte, **and** are proved as the frozen declarations
  in the frozen file (splices), not only as look-alikes in a sibling namespace.

## Certification audit

- "`cb8GSec_zero_classes` compiled — sorry-free, `lake build` exit 0, `#print axioms` = [propext, Classical.choice, Quot.sound]":
  **backed** by replay and by the frozen-context splice.
- "STATEMENT TEXT … byte-identical to the frozen source (machine-checked)": **backed**, and I extended it to the definition text.
- Typed route verdict `compiled` (one declaration): **backed**, with build and axioms logs present (`build-t3-12.log`, `axioms2.log`)
  and matching their digests.
- `FROZEN_NODES_CLOSED: none` on the return: **correct** under the strict node reading. N4 needs all three declarations.
- "machine-diffed … every declaration … whose name matches a frozen N4/N5 name has the IDENTICAL signature": true, but there is only
  one such declaration.
- `#print axioms` "on every T3.lean declaration": **struck** to "on 6 declarations, including the terminal".
- "two instruments in the formal sense" (Instrument sides): **struck** (one instrument, the kernel).
- `preimage_check.py` "checks the exact generalized-to-`CB(d,m)` version of this claim": **struck** to "checks the switch-arc sector
  census at choke images only, every rank, four small instances".
- `T3.lean` header literal "verified SHA-256 c1e6b8f2..." for `critic-section.lean`: **struck**. It does not match
  (`c0d1794f…1e75`) and it is not shipped in the return's digest table.
- The diagnosis of `verify_n4_n5.py` (leg bookkeeping or a `transport_rel_holds` slip): **struck and replaced** by F2. The cause is the
  dropped `IsSectorSource` independence conjunct and the dropped layer conjunct of the guard.
- Quoted prior check counts (`in_eq` 1146 / `in_le_one` 6 / N5 100, 143, 100; 0 failures): **match** `C4-FROZEN-STATEMENTS.md` §Check
  summary (lines 833–843). They carry that record's grade (bounded; "never evidence of a universal statement"). They are citations, not
  the route's numeric claims, so ruling 29 does not reject them; the return itself writes `none: no numeric claim`.
- **Admission defect for T3** (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`): **adjudicated, nothing to strike.** Every occurrence is a
  negation or a lint report ("`formally_verified` — 0 occurrences"; "this is NOT `formally_verified`"; "no `formally_verified` label
  on this route's own work"). No own-scratch label exists.
- **Admission exceptions for T3** (`BAD_HEADLINE_FLAG`, `MISSING_INSTRUMENT_SIDES_SECTION`): these are format issues. I confirm the
  value `headline_resolved: no` and that the doubled-marker `## Instrument sides` section exists and has content.
- The return's process disclosures record a `ps aux` / `pkill -f` / `pgrep -f` use (a rule 13 violation). This is noted as disclosed.
  It does not affect the mathematics.

## Verdict

verdict: retained_narrowed
headline_resolved: no

- `COND4_formal: no`
- `E1_formal: no`
- `TERMINAL_integration: no`
- `cut_candidate: no`
- `FROZEN_NODES_CLOSED: none`

Critic-derived: N5 (`cb8_sector_switchPreimages`, `cb8GSec_switchImage_inflow`) compiled sorry-free as the frozen declarations in the
frozen file context (C-T3-F scratch, ungraded).

The return's one load-bearing claim, that the frozen `cb8GSec_zero_classes` compiles sorry-free with standard axioms, survives
replay. It is strengthened: the proof closes the frozen declaration inside the frozen `Statements.lean`. The narrowing strikes:
- the "two instruments" label;
- the "every declaration" axioms phrase;
- the overstated scope of `preimage_check.py`;
- the unmatched header digest `c1e6b8f2...`;
- the wrong diagnosis of its own instrument (F2 supplies the correct one).

I believe the mathematics of all five owned declarations is complete. `in_eq` is `proved_informal` in my reading (F3, with the two
precision repairs), and `in_le_one` follows from it with C1-LA1 (iii). That is a critic statement at a review stage and needs an
isolated second read. N5 is compiled (ungraded) in critic scratch; N4's `zero_classes` is compiled (ungraded) in T3 scratch.

## Remaining obligation

What a successor inherits, exactly:
1. **`cb8GSec_in_eq`** (frozen N4, byte-exact). Prove `Σ_{B ∈ I_(p*+1)} cb8GSec m B A = Σ_{i : Fin m} cb8In m (chokeState m A hsec i)`
   for `A ∈ I_(p*)`, `IsSectorSource m A`:
   - (a) restrict the sum to the guard's support (the `crit_gsec_support` pattern);
   - (b) show every supported `B` is `insert y A` with `y ∈ {b_ij, c_ij}` at an EMPTY leg `(i, j)` of `A`. A switch preimage fails the
     guard: at `r` it lacks `r`; at `b_ij` it holds `r, u_i`; at `v`/`c_ij` there is no 2-subset. A deletion `y` of any other kind breaks
     independence: `s`, `u_k`, occupied legs;
   - (c) reindex over the disjoint union over `i` of the empty legs of `i` times `{b, c}` (`Finset.sum_sigma`/`sum_bij`);
   - (d) evaluate each arc with the `Finset.sum_eq_single` pattern of C-T3-F's `crit_gsec_Bj`, giving `cb8Pb m (β_i+1, γ_i)` or
     `cb8Pc m (β_i, γ_i+1)`. The states read at `B`: `chokeBeta (insert b_ij A) i = β_i + 1`, other chokes unchanged;
   - (e) the empty-leg count at choke `i` is `8 − β_i − γ_i` (from `chokeBeta_add_chokeGamma_le` and the leg partition). This matches
     `cb8In`'s `(8 − β − γ)` as a ℚ cast, and its `β+γ = 8` branch contributes 0 on both sides.
2. **`cb8GSec_in_le_one`** (frozen N4, class-only): from 1, plus the leg count `Σ_i (β_i+γ_i) + 2 = |A| = p*` (N3's
   `cb8_sector_legCount` applies at `A`), plus C1-LA1 terminal (iii) at leg total `K − 1`, `K = (16m+1)/3`, with `p* − 2 = K − 1` on
   `m % 3 = 2`.
3. **N5 at Stage 7**: carry C-T3-F's `CritN5.lean` helpers and proofs (or re-author under attribution). Name the `classical` tactic
   line in `cb8GSec_switchImage_inflow`'s proof body. Get an isolated second read. The award needs `cb8GSec` from `Statements.lean`, not T3's
   copy, and the splice shows no change is needed.
4. Discard `scratchpad/c4-T3/verify_n4_n5.py` or apply F2's two-conjunct patch. Do not cite its unpatched output.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-T3-F/`:

| Artifact | SHA-256 |
|---|---|
| `LeanProject/` (copy of `sources/c4-base/LeanProject` + controller cache + packages symlink) | (directory) |
| `LeanProject/LeanProof/T3.lean` | `3359e810667923da3d80eb5296a97538e2f7c76cf8520fa3227d584de70b036b` |
| `LeanProject/LeanProof/CritN5.lean` | `97e0c5686473a950026c14bea526e88b25bd46f03b04ceec0fa611dad488558a` |
| `LeanProject/LeanProof/SpliceN4Z.lean` | `8495d95e230a025586578b24fae54c87cf18d0cb98ae0f67537b8433326bc5ff` |
| `LeanProject/LeanProof/SpliceN45.lean` | `262d102ed35b38b2c18149fb4ad4308a77a92a3e08375da1b657f3ed74168573` |
| `build-replay-T3.log` | `ba4e373d071a5b99aecc42f6b611965b5299437627800e092aca2e4b79c8103f` |
| `axioms-replay-T3.log` | `a78dc083a1792552ba775f88119b8d41060a79ec8482574dd33e06a9aeadad75` |
| `build-splice-N4Z.log` | `33cf1fa8e6e61c80850771643e6b4d393fc33e8800e63fae745ec0eff491b72e` |
| `axioms-splice-N4Z.log` | `d874f3221c31462d31b13748bd0320b2059b147e21ec5ad39b706f8df97b0e28` |
| `build-critN5.log` | `e91a968c8f3178e32cc46afa057b8ef4e4ee12c7e2cebe68a7bb45bbd253a19c` |
| `build-splice-N45.log` | `4b228d5035617c1808d2578ba39144d4f0e5465f46d69990494234f98c7658e5` |
| `axioms-splice-N45.log` | `906b7d7df99d1b9bf54f2c0fc5f4fb2587be08a9dfb5abfbd6c81b54f39efb9d` |
| `axioms-critN5.log` | `d02083dd785c6b8484d28002faa17e254b966fbaa7b75ae9c85cf0d378837332` |
| `splice-vs-frozen.diff` | `13779c77c5b75fdf9e2fbddb5c2b4d2ede9ce3326b93eb9fcd4c39b793b6d89d` |
| `splice45-vs-frozen.diff` | `1387f413abb9bf62593d966542fff08873e77d069b4e8f12907cdc1b665ff3fc` |
| `byte_and_splice.py` | `46a246499d5fc711d02dd8c2fa5dcbb78a0881e86e781399571061a672ca6dd9` |
| `splice_n5.py` | `5d88157976252abc4a23adc5e3e80fa44a70df0cbdfecff4522f87a2783b01b4` |
| `critN5_add.txt` | `341cb35696b700a65029aaedeaf72a86058dc209500824a288ef2de208c05249` |
| `crit_n4n5.py` | `201e3de40fd141fec77571d752e4f2798a31ba2fcf335f529264b04ed8218e53` |
| `crit_n4n5.out.txt` | `0dd656d281efd825b44223ad363f37f1b9178106aee1018c4ae20c261c30d108` |
| `replay-c3-preimage/preimage_check.replay.out.txt` | `036a704be3b3cbff18a88f253a5fe0bcacc038434c8e90ffb8ca8f4675ccdfe6` |
| `replay-T3-verify/verify_n4_n5.patched.py` | `3982b56fb8823295fdc40be80f62a4eee86c1594b0b540e677d97cd743d4b085` |
| `replay-T3-verify/patch.diff` | `b1bd8b0aaaa32fb4c6f56ad4dc8993599b8600c6d8f506a584621159316198f2` |
| `replay-T3-verify/patched.out.txt` | `bda8d64ee7ad10e91bed4fe479a1b5d16388fd037b7a5258c08180e8a345dffe` |

`build-critN5.log` predates the one-line `classical` insertion in `CritN5.lean`'s inflow proof; the final `CritN5.lean` (digest above) was rebuilt in `build-splice-N45.log` (target list `LeanProof.CritN5 LeanProof.SpliceN45`, exit 0) and its axioms re-printed in `axioms-critN5.log`.

IMPORT LIST for my Python: `fractions`, `itertools`, `random`, `re`, `json`, `hashlib`, `sys` (standard library
only; every invocation `python3 -B`, deterministic seeds, no wall-clock in hashed output).

Replay commands (copy-out-first; run from the critic scratch):
- `cd LeanProject && lake build LeanProof.T3 LeanProof.SpliceN4Z LeanProof.CritN5 LeanProof.SpliceN45`
- `lake env lean ../axioms-splice45.lean`
- `python3 -B crit_n4n5.py`
- `python3 -B byte_and_splice.py`
- `python3 -B splice_n5.py`

**Disclosures.**
1. **Read boundary.**
   - In the attack-brief file I read the controller preamble (lines 1–9) and my own T3 section. A `grep -n "^#"` over that one file
     printed the one-line HEADINGS of the other seats' sections (their claim summaries). I read no body text of those sections.
   - I read the following, which are Stage 2 members or authorized by the protocol or the attack brief:
     - `control/C4-FROZEN-STATEMENTS.lean` / `.md` (Check summary lines);
     - `control/C4-WORKER-COMMON-BRIEF.md`;
     - `sources/c4-base/…`;
     - `sources/mathlib-binding/PIN.json`;
     - `sources/c3-stage7-sources/crit-U1-F/preimage_check.*`;
     - the SHA-256 only of `sources/c3-scratch-lean/c3-crit-T3-U/LeanProject/critic-section.lean`;
     - non-recursive listings of `scratchpad/c4-base/LeanProject` and `scratchpad/c4-T3/`, and the copied controller cache.
   - No other return, critique or adjudication, and no other experiment root. No network, no installs.
2. **Write outside scratch (self-reported violation).** A mistyped command created an empty file `/tmp/null` (a stray `cat > /tmp/null`
   waiting on stdin). I removed it after confirming it was empty. Nothing was read from or written to it.
3. **Background jobs.** That stuck shell was auto-backgrounded by the harness. I stopped it through the harness task-stop by task id
   (no process listing). Every later `lake build` ran as `cmd & wait $!` with its literal PID printed (27599, 27758, 28147, 28320,
   28587). All five were confirmed gone with `kill -0` before this write. **No background job is running.**
4. No `lake update`, `lake clean` or `--no-cache`. `lake`/`lean` ran only after `cd` into the critic's pinned project.
