# Critique

**Critic:** `C-T3-U`, the Cycle 4 Stage 4 cross-orientation critic (orientation U, formal/structural) of the seat `T3` return. Route `C4-T-03`, mechanism `SECTOR-IN-BRIDGE-ZERO-CLASSES-AND-A2`, orientation T (prove).
**Run:** r31 `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. Date 2026-09-29 (host clock, 00:33 EDT at close).

**Boot acknowledgment.** I am operating within VerityOS. This was a restricted boot. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I then read the dispatch `control/dispatch/c4-stage4/DISPATCH-C-T3-U.md`; its SHA-256 `f64c7f149392591dee6190c1c7b1b9f4923bbf26b6d4845c028fceea43b073f9` matched. I loaded no other VerityOS subsystem (memory, decisions, conversations, modules, skills or logs). Every other read was inside the run root or the pinned Lean toolchain/Mathlib; they are listed under "Read boundary" below.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

---

## Identity and seal audit

Each seal was recomputed with my own script as the SHA-256 of the compact, key-sorted JSON of the manifest minus `seal_sha256`, with no trailing newline.

| Object | Recorded seal | Recomputed | Result |
|---|---|---|---|
| Capsule `control/c4-critic-capsules/T3-PACKET-MANIFEST.json` | `2af65c40b949cddfe71325e2a2ca755a79b9febadf5edd1fa4acf7f4e1af4751` | same | **match** |
| Stage 4 dispatch `control/C4-STAGE4-DISPATCH-MANIFEST.json` | `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023` | same | match |
| Stage 3 packet `control/C4-STAGE3-PACKET-MANIFEST.json` | `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e` | same | match |
| Stage 2 packet `control/C4-STAGE2-PACKET-MANIFEST.json` | `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387` | same | match |

- All 16 capsule members match their recorded bytes and SHA-256. That includes the return `cycles/cycle-4/stage3/returns/T3/RETURN.md`, `3619904b0369f4baab7c3ff4e9ea4b990b2dfb3517e8ef3d33bf36ff37b0edb6`, 29,740 bytes.
- `control/C4-FROZEN-STATEMENTS.lean` is `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1`. It is byte-identical to `sources/c4-base/LeanProject/LeanProof/Statements.lean`.
- `control/C4-FROZEN-STATEMENTS.md` is `6aa6dfe5971a187be2be41cc1e350db4beff187ca5b648cdb9aec2edc5eca54b`.
- **Base and seat-scratch digests.** I recomputed every digest the return lists:
  - `Main.lean` `385af1bf…62ea3f`, `ChokeState.lean` `64a101ef…864fd3bb`, `C3LA1.lean` `49b227d3…f455c91d`, `lakefile.toml` `45d0ca58…94ff49`, `lake-manifest.json` `52a4d73c…f46c7c`, `lean-toolchain` `2bdc48ad…c8037273`: all match.
  - T3 scratch: `T3.lean` `3359e810…70b036b`, `build-t3-12.log` `9db37b0e…5d26b1c`, `axioms2.log` `0af71ed1…151fc1c`, `verify_n4_n5.py` `6cbbcdfb…1bae708`, `verify_n4_n5.out.txt` `e64d8f10…766cec57`: all match.
  - `preimage_check.py` `f7c9fe84…6ed0f2c9` and `.out.txt` `036a704b…75ccdfe6`: match.
  - **One literal does not match: see C-1.** The return writes `E1FlowConstruction.lean` as `d26e702b…99923d`. The file is `d26e702bfd0aa3ba9447130475d17591a9ed06db587420270a9730f99d32aab8`, whose tail is `…d32aab8`. The tail `…99923d` belongs to a different digest: the "copied bytes after the rekey" digest `13aca55c…0899923d` in `C4-FROZEN-STATEMENTS.md` line 11.
- **Registry keys touched.** The route registers nothing and proposes no `E993-R31-` key. N4 and N5 are composition-internal frozen nodes. They feed the keys the return names:
  - `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN)
  - `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN)
  - `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`
  - `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`

  None of their statuses changes. The alias check is not applicable: no new claim exists, and the reserved name `cb8_topRank_eligible_and_weightedHall` occurs 0 times in T3's file and in mine.
- **Admission defect for T3: `FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`. Adjudicated as no strike.** The token occurs 4 times (return lines 186, 213, 261, 274). Every occurrence is a negation or a grep report: "0 occurrences", "this is NOT `formally_verified`", "no `formally_verified` label on this route's own work", and "neither Tier 1 `formally_verified`". No scratch declaration is labelled `formally_verified`, so the defect is a matcher false positive.
- **Admission exceptions for T3 (format only, accepted).** `BAD_HEADLINE_FLAG`: the return's headline flag line carries the value no, followed by prose on the same line. `MISSING_INSTRUMENT_SIDES_SECTION`: the heading is typed as "## `## Instrument sides`". I agree both are format-only.
- **Transcript/scratch agreement.** The seat was interrupted three times. Its final `T3.lean`, its logs and RETURN.md agree:
  - `build-t3-12.log` ends "Build completed successfully (8659 jobs)".
  - `axioms2.log` lists the 6 declarations the return names with `[propext, Classical.choice, Quot.sound]`.
  - The file SHA-256 equals the return's.
  - My copy-out-first rebuild reproduced the build: exit 0, 8659 jobs, 0 errors (`build-replay-T3.log`).

## Independent re-derivation

**Instrument 1: my own Python transcription, written from the contracts and the Lean definitions of record.** File `crit_n4n5.py`.
- It uses the standard library and exact `Fraction` arithmetic only.
- It never imports or reads T3's `verify_n4_n5.py`, the drafter's `check_statements.py`, or `preimage_check.py`.
- The tables `cb8Bpb`, `cb8Bpc` and `cb8CGamma` are parsed from the frozen `Main.lean` text (36/36/7 cells).
- The graph is `cbEdge` literally. `transportRel` is literal (D) ∪ (S).
- `activeWeight` uses `F = leafSet` through `tagWitnesses = N(s_v) \ {v}`.
- `cb8GSec` is the literal indicator sum times the full guard: `IsIndepSet B ∧ r,v ∈ B ∧ |B| = p*+1 ∧ transportRel B A`. The guard is evaluated only when an indicator fires, which gives the identical value.
- `cb8In` is literal, including its `β+γ = 8 ⇒ 0` branch.
- Column sums use a complete backward preimage generator. It takes deletion preimages `A ∪ {x}` and switch preimages `(A \ {u}) ∪ T`, with `u ∈ A`, `T` a 2-subset of `N(u)`, and `(A\{u}) ∩ N(u) = ∅`. The generator is complete directly from the relation's definition.
- **Validation at m = 1.** The forward column sums (every `B ∈ I_7`, every literal image) agree with the backward generator on **every** target of `I_6(CB(8,1))`: 0 mismatches out of 8,484 targets, with `|I_7| = 8,332`.
- **Mutants.** `crit_mutants.py` runs five mutants; each must be caught at m = 1, 2:
  - In factor `7−β−γ`: 1,359 failures.
  - `pb` read at the target's state: 1,359.
  - Switch arity 1: 534.
  - Guard without independence: 2,107.
  - A shared σ-shift applied to both sides: 0, as expected. This is the limitation of a common-mode mutation.

Results (`crit_n4n5.out.txt`; pairs are *(checks, failures)*):

| Row (difference index written: `m`, `p*`, `K−1 = p*−2`) | in_eq | in_le_one | N5 set eq. | N5 card | N5 β/γ | inflow (i) | inflow (ii) |
|---|---|---|---|---|---|---|---|
| m=1, p*=6, K−1=4. **Exhaustive, every target of I_6** | (1120,0) | n/a (off class) | (70,0) | (70,0) | (70,0) | (70,0) | (126,0) |
| m=2, p*=12, K−1=10. Every in-sector state pair; every one-choke-with-v γ/state | (239,0) | n/a | (119,0) | (119,0) | (119,0) | (119,0) | (15,0) |
| m=107 (endpoint), p*=572, K−1=570. 160 structured targets | (30,0) | (30,0) | (90,0) | (90,0) | (90,0) | (90,0) | (40,0) |
| m=110 (fresh of record), p*=588, K−1=586 | (30,0) | (30,0) | (90,0) | (90,0) | (90,0) | (90,0) | (40,0) |
| m=113 (fresh of record), p*=604, K−1=602 | (30,0) | (30,0) | (90,0) | (90,0) | (90,0) | (90,0) | (40,0) |
| **m=158 (fresh), p*=844, K−1=842** | (30,0) | (30,0) | (90,0) | (90,0) | (90,0) | (90,0) | (40,0) |
| **m=161 (structural), p*=860, K−1=858** | (30,0) | (30,0) | (90,0) | (90,0) | (90,0) | (90,0) | (40,0) |
| **m=164 (fresh), p*=876, K−1=874** | (30,0) | (30,0) | (90,0) | (90,0) | (90,0) | (90,0) | (40,0) |

- At every class row above, an exact DP over **all** state vectors with leg total `K−1` gives a maximum in-sector column of exactly `1`. The In bound is therefore tight at every row.
- The exact DP minimum is:
  - `765909/766193` at m=107 (p*=572)
  - `1668167/1668587` at m=158 (p*=844)
  - `1732041/1732469` at m=161 (p*=860)
  - `1797115/1797551` at m=164 (p*=876)
- Zero-class numeric check (`crit_zero10.py`). The class `(1,0)` switch is **empty** at m = 1, 2, where T3's own instrument logged 0 checks. I therefore tested at class rows on sector sources of `I_(p*+1)` built to contain a `(1,0)` choke. Pairs are *(images, of which (1,0)-switch)*:
  - m=107 (p*=572): 205 images, 85 of them `(1,0)`-switch.
  - m=158 (p*=844): 237 / 117.
  - m=161 (p*=860): 236 / 116.
  - m=164 (p*=876): 241 / 121.
  - 0 failures in total. At m=1 exhaustive: 8,960 zero-class checks, 0 failures.
- Scope: the rows 107–164 are **sampled** (structured) and are not proof. The universal statements rest on the Lean results below.
- The fresh/structural rows 158, 161 and 164 were run **before** the Lean attempts (ruling 27 order).

**Instrument 2: the Lean kernel, on the frozen text in the frozen file.** Details are under Attacks (A-1) and the advance (A-6). My informal re-derivation, which the Lean proofs formalise:
- **(In bridge.)** Let `A` be in-sector with `r ∈ A`. A literal switch arc `B → A` from a sector source `B` is impossible: `r ∈ B` forces `u ≠ r`, so `r ∈ B \ N(u)`. But `u ∉ B` with `|N(u) ∩ B| = 2` forces `u ∈ {s, u_i}`, which is adjacent to `r`. Hence every nonzero column term comes from a deletion `B = A ∪ {x}`.
- The value is `pb(β_i+1, γ_i)` when `x = b_ij`, and `pc(β_i, γ_i+1)` when `x = c_ij`. It is paid exactly when the leg `(i,j)` of `A` is empty, which is the independence guard.
- Summing over the `8−β_i−γ_i` empty legs gives `Σ_i cb8In(state_i A)`, including the `β+γ = 8` branch.
- In ≤ 1 then follows from the leg count `Σ(β_i+γ_i) = |A| − 2 = p*−2 = (16m+1)/3 − 1` (valid when `m ≡ 2 (mod 3)`) and C1-LA1's carried `cb8_sum_in` (entry 102). That lemma needs only `m % 3 = 2`.
- **(A2.)** Let `A` contain `v` and exactly one choke `u_i`. A sector preimage cannot come from a deletion, since `u_i ∈ A ⊆ B` would be adjacent to `r ∈ B`. The switch vertex is forced to be `u_i`, so `B = (A\{u_i}) ∪ {r, b_ij}` with `c_ij ∉ A`.
- The result is `8−γ` preimages, each in state `(1, γ)`, and each receiving exactly `σ(γ)`. At `γ = 0` the term is 0 because `cb8CGamma 0 = 0`.
- Targets with ≥ 2 chokes, or one choke and no `v`, have no nonzero sector preimage. A switch image of a sector source carries at most the one choke it inserts, and it loses `v` only when the switch vertex is `s`, which adds no choke.

T3's informal derivations of `in_eq` and N5 agree with this, case for case.

## Attacks and findings

**A-1 (the compiled declaration is about a LOCAL COPY of `cb8GSec`). Integration defect; resolved by the critic.**
- `T3.lean` does not import `LeanProof.Statements`. It re-declares `noncomputable def cb8GSec` in namespace `E993Transport`. I confirmed the body is byte-identical to the frozen definition.
- Its theorem `E993Transport.cb8GSec_zero_classes` is therefore about T3's own constant. That file cannot be co-imported with `Statements.lean` (duplicate declaration), so as shipped the proof does not discharge the frozen declaration in the base.
- Byte identity of the statement *text* (T3's check, replayed: `MATCH`) is necessary but not sufficient.
- **Critic resolution.** `SpliceN4.lean` is a byte-copy of the frozen `Statements.lean`. T3's helper lemmas (lines 47–641) are inserted in one block before the N4 docstring, and T3's proof body replaces only the `sorry` of `cb8GSec_zero_classes`. The statement is byte-identical and elaborates in its frozen context.
- It builds (`build-splice-N4.log`). `#print axioms E993Transport.cb8GSec_zero_classes` gives `[propext, Classical.choice, Quot.sound]` (`axioms-splice.log`).
- **The seat's proof closes the frozen text, frozen constant.**

**A-2 (the zero classes: is any case vacuous under the guard?).** No case is vacuous. I read every branch of `T3.lean` against the frozen text:
- (i) is closed by the guard itself, since `IsSectorSource` contains `r, v ∈ B`. That is the statement's content, not a vacuity.
- (ii) is real: for example, `B.erase v` from any sector source is a weight-zero literal arc. The deletion indicators are killed by weight positivity (witness `v`, or `c_kj` via `u_k`). The switch indicator is killed through the raw `transportRel` split.
- (iii)(a)–(c) are closed by exact set differences: `B\A` = `{r}`, `{v}` or `{r,v}`, and `A\B ⊆ {s}`.
- (iii)(d), the `(1,0)` switch, is a genuine arc: `|N(u_i) ∩ B| = |{r, b_ij0}| = 2`. It is killed at choke `i` by `1 ≤ γ` failing, and at other chokes by label mismatch.
- The numeric side of (iii)(d) is empty at m = 1, 2. T3's instrument logged 0 checks there, which is a vacuous numeric side. Mine exercised 439 `(1,0)`-switch images at rows 107–164, with 0 failures.
- All 26 declarations of `T3.lean` depend only on `propext`, `Classical.choice` and `Quot.sound`, or subsets of them (`axioms-T3-all.log`). The file contains no `sorry`, `admit`, `native_decide` or `set_option`.

**A-3 (T3's abandoned instrument: bug identified).** T3 attributed its 100% failure rate to "most likely `make_open_leg_alloc`/`det_in_targets` … or `transport_rel_holds`". The actual cause is elsewhere:
- Its `g_sec` transcription drops two conjuncts of the frozen guard, **`IsIndepSet B`** and **`B ∈ I_(p*+1)`**. Its `is_sector_source` checks only `0 ∈ B ∧ 2 ∈ B`.
- Non-independent candidates, for example `A ∪ {b_ij}` with `c_ij ∈ A`, are then paid `pb`. That inflates the `in_eq` column and gives spurious `> 1` values, and it adds false N5 preimages.
- My mutant M5 (guard without independence) reproduces the failure pattern (2,107 failures).
- The zero-class checks passed only because dropping a guard can only add nonzero values where the statement demands zero, and none arose.
- **Conclusion:** the failures are an instrument bug. They are not evidence against the frozen texts. T3 was right to exclude the script, but its diagnosis is struck and replaced by this one.

**A-4 (`preimage_check.py`: what it covers).** I replayed it copy-out-first; its output is byte-identical to the sealed `preimage_check.out.txt`.
- It checks, on `CB(8,1)`, `CB(3,2)`, `CB(3,3)` and `CB(4,2)` at every rank, that the switch preimages at a choke keyed by `(A, u)` number `d − γ` and equal the expected family.
- It does **not** test the frozen N5 text:
  - It never considers deletion-type preimages in the `transportRel` filter.
  - It does not check the `chokeBeta = 1` / `chokeGamma` conjunct.
  - It does not check the inflow value `(8−γ)σ(γ)`, or inflow clause (ii) at all.
  - It works at no fixed rank `p*` and on no class row.
- The return's phrase "checks the exact generalized-to-`CB(d,m)` version of this claim" is **struck** (see C-3).

**A-5 (the `in_le_one` route as stated by T3).** "using `1 ≤ cb8_sector_legCount`-style bookkeeping, C1-LA1's terminal (iii)" is imprecise. The exact route is: `in_eq` + the leg count `Σ(β+γ) + 2 = |A|` + `cb8_sum_in m hres` (entry 102, hypothesis `m % 3 = 2` only). It does not depend on T2's N3 node, because I proved the leg count independently (A-6).

**A-6 (critic-derived advance: N4 and N5 closed in Lean, attributed to critic C-T3-U).** New critic Lean text sits on the copy-out-first Cycle 4 base, with the controller cache CF-C4-S3-1 and packages bound by symlink.
- `LeanProof/CritIn.lean` (SHA-256 `769bb423…385f490`) imports `LeanProof.Statements` and uses the **frozen** `cb8GSec`. It proves:
  - `crit_gsec_support`: a nonzero `cb8GSec` into a target containing `r` comes from a deletion.
  - `crit_gsec_insert`: the exact value on `insert x A → A`.
  - `crit_emptyLegs_card`.
  - `crit_legCount`: `Σ_i(β_i+γ_i) + 2 = |B|` for any sector set. This is the content of N3's `cb8_sector_legCount`, with no `0 < m` needed.
  - `crit_cb8GSec_in_eq` and `crit_cb8GSec_in_le_one`.
- `LeanProof/CritN5.lean` (SHA-256 `db44cafc…bd6203c44`) proves `crit_Bj_props`, `crit_SP_sub`, `crit_gsec_Bj`, `crit_cb8_sector_switchPreimages` and `crit_cb8GSec_switchImage_inflow`.
- The Section 0–1 helpers of `T3.lean` (lines 47–176) are copied with attribution.
- **Decisive check.** `splice_all.py` builds `LeanProof/SpliceN4N5.lean` (SHA-256 `e65cc7c9…177c9277`). It is a byte-copy of the frozen `Statements.lean` with:
  - one inserted helper block before the N4 docstring;
  - the five N4/N5 `sorry` bodies replaced: T3's proof for `cb8GSec_zero_classes`, and the critic's proofs for the other four, with a single added `classical` tactic line in the inflow body because that frozen statement has no `open Classical in`.
  - The script's undo check deletes the block and restores `  sorry`. It reproduces **`0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1` byte-for-byte**, so every frozen statement is untouched.
- `lake build LeanProof.SpliceN4N5` exits 0 (`build-splice-N4N5.log`). The `sorry` warnings are exactly the 15 other frozen nodes. `#print axioms` (`axioms-splice-N4N5.log`) gives:
  - `cb8GSec_in_eq`, `cb8GSec_in_le_one`, `cb8GSec_zero_classes`, `cb8_sector_switchPreimages`, `cb8GSec_switchImage_inflow`: **`[propext, Classical.choice, Quot.sound]`**.
  - Control: `cb8GSec_out_eq` (N3, not touched) still shows `sorryAx`.
- Carried facts used: only base entries, namely the `cbGraph` adjacency lemmas, `mem_neighborFinset_choke_iff`, `chokeBeta_add_chokeGamma_le` and C1-LA1's `cb8_sum_in`.
- **Frozen nodes N4 (all three declarations) and N5 (both) are therefore compiled sorry-free on the frozen text.** This is ungraded critic scratch (SOLUTION-CONTRACT §4: no grade until a governed award closes). The mathematics of all five is complete; I would put it at `proved_informal` if one were asked for, since the Lean text is the informal proof made precise.

**A-7 (ℕ subtraction, casts, endpoints).**
- The only ℕ subtraction in my text is the empty-leg count `8 − β − γ`. It is guarded by `chokeBeta_add_chokeGamma_le` and cast with `Nat.cast_sub` under explicit `≤`.
- `(16m+1)/3 − 1 = (16m+4)/3 − 2` is used only under `m % 3 = 2` (by `omega`).
- The inflow `(8 − γ : ℚ)` is exact with `γ ≤ 8` from the census cardinality.
- `m = 107` is covered: the theorems hold for every `m`, and the class hypothesis enters only in `in_le_one`.
- There are no asymptotic steps, Newton/Darroch steps or census-as-proof steps.

## Mechanism-equivalence and fence check

- Mechanism: the frozen `g_sec` (C1-LA1's unscaled per-state allocation read through `chokeState`) on the literal (D) ∪ (S) network. No refuted mechanism is revived (the SOLUTION-CONTRACT §3.6 list). No template/network conflation: the In/A2 identities are proved **on the literal network** against the frozen definition. That is exactly the "PROVED reduction" fence 4 demands for the In side and the switch-image side.
- One rank `p*` and `d = 8`. N4 zero classes, `in_eq` and N5 hold for every `m` as their frozen signatures state; only `in_le_one` uses the class (`m % 3 = 2`; `107 ≤ m` is carried unused). Nothing is claimed at any other rank.
- No (HALL), no aggregate status transfer, no `θ*` law as hypothesis, no r30 bounded record as proof. Census rows are reported as sampled evidence only. `IsSaturatingFlow`, (WID) and supply−capacity are **not** objects of this seat: N4/N5 are column-sum identities of one named function, so no (WID)-dependent number is claimed, by T3 or by me.
- The tag set: N4 (ii) uses `activeWeight … (C5LA1.leafSet …)` as frozen. At `p*` on the class, `F_{p*} = leafSet` is C2-LA3's carried award and is not re-proved here.

## Certification audit

- **C-1 (STRUCK, one literal):** "`d26e702b…99923d`" for `E1FlowConstruction.lean`. The correct value is `d26e702bfd0aa3ba9447130475d17591a9ed06db587420270a9730f99d32aab8`. It follows that the return's R-11 statement "no unmatched literal was produced" is **false** for this literal, and it is struck.
- **C-2 (STRUCK, in the shipped Lean file):** the `T3.lean` header claims "verified SHA-256 c1e6b8f2…" for `sources/c3-scratch-lean/c3-crit-T3-U/LeanProject/critic-section.lean`. The file hashes to `c0d1794fdc3698ce23cdd0cc82b3f261e800f7514b0f9c8162fa2e6aafb31e75`, which is the value in the Stage 2 manifest. The return lists no such digest, and `c1e6b8f2` occurs in no record. The attribution sentence in the return ("author critic C-U1-F… — text reads 'critic C-T3-U'") is muddled. The file header says critic C-T3-U, and that is the attribution.
- **C-3 (STRUCK):** "checks the exact generalized-to-`CB(d,m)` version of this claim" (preimage_check; see A-4). What stands in its place: an A2 census check of switch-keyed preimages on four small families at all ranks, 0 failures, replayed byte-identically.
- **C-4 (STRUCK):** "this is the 'two instruments' in the formal sense (the elaborator … and `#print axioms` …)". `#print axioms` queries the same kernel-checked environment; it is one instrument. The two-instrument requirement for this seat is met by my Python transcription plus the kernel (see Independent re-derivation).
- **C-5 (REPLACED):** T3's diagnosis of its own buggy script (A-3).
- **C-6 (NARROWED):** "`cb8GSec_zero_classes` … compiled, sorry-free". It stands as stated for T3's file, but on a local copy of `cb8GSec` (A-1). The frozen-constant closure is critic-verified by `SpliceN4.lean` and `SpliceN4N5.lean`.
- **Backed as stated:**
  - The build record (8659 jobs, exit 0; replayed).
  - `axioms2.log` (six declarations; extended by me to all 26).
  - The frozen-signature byte `MATCH` (replayed) and the `cb8GSec` body identity (checked).
  - The citation of the drafter's check-table rows (1146/6 and 100/143/100; confirmed against `C4-FROZEN-STATEMENTS.md` §Check summary; prior bounded instrument, not T3's).
  - The self-reported rule violation: one `ps aux | grep`, one `pkill -9 -f` / `pgrep -f`. It is recorded as disclosed and stands as a process defect.
- **The route verdict `compiled`** and **`FROZEN_NODES_CLOSED: none`** in the return are correct on the return's own record: strictly, no node closed there, because N4 needs all three declarations and N5 both.
- **No numeric claim of the return is made at a class row.** Nothing is rejected under ruling 29.

## Verdict

The return's one compiled declaration is genuine. Its statement is the frozen text byte for byte. Its proof uses only the standard axioms, and it is not vacuous in any case the frozen text lists. With T3's helper block, the same proof closes the frozen constant in the frozen file (critic splice).

The return's informal derivations of `in_eq` and A2 are correct. It is narrowed in these respects:
- The compiled theorem targets a local copy of `cb8GSec` (A-1).
- Two digest literals are struck (C-1, C-2).
- The coverage claimed for `preimage_check.py` and the "two instruments" gloss are struck (C-3, C-4).
- Its diagnosis of its own abandoned script is replaced (A-3).

The critic-derived advance (A-6) compiles the four remaining owned declarations sorry-free. It splices all five into a byte-copy of the frozen file (undo check gives `0fc723d7…39ede1`), so **N4 and N5 close as frozen nodes**. This is ungraded scratch, attributed to critic C-T3-U, with T3 credited for `cb8GSec_zero_classes` and the adapted helpers.

verdict: retained_narrowed
headline_resolved: no
COND4_formal: no
E1_formal: no
TERMINAL_integration: no
cut_candidate: no
FROZEN_NODES_CLOSED: N4, N5

Attribution of the last line: N4 is `cb8GSec_zero_classes` (seat T3) plus `cb8GSec_in_eq` and `cb8GSec_in_le_one` (critic C-T3-U). N5 is `cb8_sector_switchPreimages` and `cb8GSec_switchImage_inflow` (critic C-T3-U). All are compiled sorry-free in `scratchpad/c4-crit-T3-U/LeanProject/LeanProof/SpliceN4N5.lean`. The T3 return by itself closes none.

The headline stays unresolved: Tier 1 formally verified, or a confirmed cut, is not produced by any seat.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **For N4/N5 (this seat's nodes): no open mathematics.** Stage 7, if it funds the sector half (ruling 31), must re-author the five proofs into the governed award project under ruling 19:
   - The carried entries come from the governed runs, not from the base's copies.
   - There must be exactly one definition of `cb8GSec`. T3's local copy must not be carried.
   - The helper lemmas are new text: T3's Sections 0–3 and the critic's `crit_*` lemmas.
   - The panel then performs the isolated second read the contract requires before any grade. The funded terminal's `expected_statement` is the conjunction of the five frozen texts, possibly with N3.
2. **N3 (T2's node) is not a dependency of this closure.** The critic's `crit_legCount` proves N3's `cb8_sector_legCount` content independently (without `0 < m`). Stage 7 may use either, but must not cite T2's compiled text as the critic's.
3. **Conjunct 4 as a whole remains open.** N1, N2, N3 (per T2's critique), N6, N7 and N8 are outside this seat. The terminal stitch still requires every frozen node sorry-free in one project.
4. **Process correction for the successor:** discard `scratchpad/c4-T3/verify_n4_n5.py`. Its guard transcription omits independence and layer membership (A-3).

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-T3-U/`.

**Lean project.** `LeanProject/` is a copy-out-first copy of `sources/c4-base/LeanProject`, with byte-identical base files (digests above), the controller cache from `scratchpad/c4-base/LeanProject/.lake/{build,config}` (CF-C4-S3-1), and `.lake/packages` bound as a symlink to the pinned shared Mathlib (`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages`). `lake`/`lean` were run only after `cd` into it. I never ran `lake update`, `lake clean` or `--no-cache`.

| File | SHA-256 |
|---|---|
| `LeanProject/LeanProof/T3.lean` (seat copy, replay) | `3359e810667923da3d80eb5296a97538e2f7c76cf8520fa3227d584de70b036b` |
| `LeanProject/LeanProof/SpliceN4.lean` (T3 proof in frozen file) | `aefdd1759d39cea4d4722e52b5cbe9fe28834ed2592b41544aafd76bd6203c44` |
| `LeanProject/LeanProof/CritIn.lean` (critic N4 in_eq / in_le_one; 610 lines) | `769bb423050f1a04eab1d3ea715debf0e85c1a64cb228b4f31824c0c6385f490` |
| `LeanProject/LeanProof/CritN5.lean` (critic N5; 509 lines) | `db44cafcc8264b48f4c6c10cc75622b5756dc55fc57db2dc620bb86b3b9fc884` |
| `LeanProject/LeanProof/SpliceN4N5.lean` (all five in frozen file; 1,899 lines) | `e65cc7c928b1b718506a0388208b04c716b173c810ed70edd938df19177c9277` |
| `splice_all.py` (splice builder + undo byte check) | `0f573c5b25820060d32cae12f772312ba515e08ed73d0915224eb91476d9dd47` |
| `build-replay-T3.log` | `a530e2ff2294bc2f9718e8d734daa92f2e094ee3e5b4fe6ce3ecfb5b0ee76611` |
| `build-splice-N4.log` | `1a0d08392777a08ade2ab1ee26b45a9af918b9fca15bf336750f748aee551925` |
| `build-critin-4.log` (final CritIn build) | `41498c01251dc567e582db1d5b44a00c3666fb43775e0311de5c46d27c210705` |
| `build-critn5-5.log` (final CritN5 build) | `09487e2e0ca0379d730d6b6eac509274574edffa49abb69188575f17b43917a6` |
| `build-splice-N4N5.log` | `39a83529d9574c563ed67afccacf9fdedaf7705e661386e5ddf27d6817a5ac66` |
| `axioms-T3-all.log` (all 26 T3 declarations) | `bdd37cfc1b293f5765cd60b3ceca26759f22dd9d63d21758b0e09be8c4288be8` |
| `axioms-splice.log` (zero_classes in frozen file) | `50baaed86a2679b1187e43947cb169defbe6cb43e00211754f43c7f39064dcf8` |
| `axioms-critin2.log` | `c189fd3d77ff2a774c56b0db7aae85cf7c2bac5f106ad46c459557234ea92b2a` |
| `axioms-critn5.log` | `3efc075de4af1f945bf86b6caa753370cbac769368a35a046cfdf19619e71f6b` |
| `axioms-splice-N4N5.log` (the five frozen names + N3 control) | `34ee5bcc77324f6085305146a46f75f817a8ce375119941ce5a626130a64ad8f` |
| `crit_n4n5.py` / `crit_n4n5.out.txt` | `c6f3d73642e612dba9f9e948d3177921ce1f4e8767ce25657af2595f1221c213` / `7199fc243739a608b90990e63f0e40c8d3170d8a1676eb4a0188b667e00e3b40` |
| `crit_mutants.py` / `crit_mutants.out.txt` | `bb8ee19660d3c7bb0764f6568d30fa4a49135cfbb69261f219f5ca74455a7651` / `792eb74d36413af2512a318f0657a7ed4054b0f8bc17b5f9111abd2ef4c80125` |
| `crit_zero10.py` / `crit_zero10.out.txt` | `c7415fedb77661cc8a77687e4d07ffe4c1976f0026c6c19d3362f51388e85163` / `28d5a07e7538d96d19da564608596098eba1f578d481c30404d3fd0aa2b1987a` |
| `replay-preimage/preimage_check.py` (copy) / `preimage_check.replay.out.txt` | `f7c9fe84d7d4f1df34d582563a3a051035e1a6b90b64f6e26b9107086ed0f2c9` / `036a704be3b3cbff18a88f253a5fe0bcacc038434c8e90ffb8ca8f4675ccdfe6` (= sealed output) |

**Superseded intermediates, retained.** Intermediate build logs `build-critin-1..3.log` and `build-critn5-1..4.log` record fixed compile errors: argument order in `adj` symmetry, an `Iff.rfl`, a beta-reduction, a dependent `rw`, and `absurd`. `axioms-critin.log` predates the removal of one no-op `push_cast` line; `axioms-critin2.log` supersedes it.

**Imports.** Python uses `fractions`, `itertools`, `random`, `re`, `sys`, `hashlib` and `importlib`-style module import of my own `crit_n4n5.py`, all standard library. I made no installs and used no network.

**Background jobs.** None were started; every command ran in the foreground. There is nothing to kill.

**Read boundary.** Outside the dispatch's list, I read or searched the following:
- The frozen `control/C4-FROZEN-STATEMENTS.lean` and a grep of `.md` §Check summary (both Stage 2 members, authorized by the protocol).
- `sources/c4-base/**` Lean files and `SOURCE-DIGESTS.json`.
- `sources/c3-stage7-sources/crit-U1-F/preimage_check.py`, plus a non-recursive `ls` of that directory.
- A `shasum`/`head` of `sources/c3-scratch-lean/c3-crit-T3-U/LeanProject/critic-section.lean` (for C-2).
- The seat's inventoried scratch `scratchpad/c4-T3/` (`T3.lean`, logs, `verify_n4_n5.py`/`.out.txt`; non-recursive `ls`).
- The controller cache `scratchpad/c4-base/LeanProject/.lake` (copied, non-recursive `ls`).
- Mathlib sources under the pinned shared project, read for API names only, with `grep` rooted at `Mathlib/Combinatorics/SimpleGraph`, `Mathlib/Algebra/BigOperators`, `Mathlib/Data/Finset` and `Mathlib/Data/Set/Pairwise`.

**Disclosures.**
- One `grep -rn … $P --include=*.lean` rooted at the Mathlib package root failed with a shell glob error and **did not execute**.
- `which lake lean` and `ls ~/.elan/bin` were run as a toolchain check (`~/.elan` is an allowed external root).
- The protocol's "Stage 3 read-boundary disclosures record" is not a member of my capsule and was not read.
- I read no sibling return, critique, adjudication, other experiment root or external source.
