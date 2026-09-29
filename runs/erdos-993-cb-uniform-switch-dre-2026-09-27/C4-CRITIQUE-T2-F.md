# Critique

**Critic:** `C-T2-F`, a cross-orientation critic (orientation F, falsify) of seat T2, route `C4-T-02`, mechanism token
`SECTOR-GSEC-IMAGES-LEGCOUNT-OUT-BRIDGE`, orientation T (prove). r31 Cycle 4 Stage 4, 2026-09-29 (clock read 00:23 EDT).

**Boot acknowledgment.** I am operating within VerityOS. I did a restricted boot and read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no other VerityOS file outside the run root. The only subsystem loaded
is `experiments/`, through this run root's dispatch chain.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Dispatch.** I verified `control/dispatch/c4-stage4/DISPATCH-C-T2-F.md` by `shasum -a 256` before use: its digest is
`7999b55a53d00747b56d4b3ca165af348c282bf51436284b4ee5ac7504e9080c`, which matches the value given.

## Identity and seal audit

All seals were recomputed with my own script (`scratchpad/c4-crit-T2-F/seal.py`). The method is the SHA-256 of compact key-sorted JSON of
the manifest without `seal_sha256`, with no trailing newline.

| Object | Stored seal | Recomputed | Match |
|---|---|---|---|
| Capsule `control/c4-critic-capsules/T2-PACKET-MANIFEST.json` | `361196547fa1ca35e14a7bff166caf8a586dd876fc2e7f1dd135065c6ec2b248` | same | yes |
| Stage 4 dispatch manifest | `040448e1cdf94fa8a669364b4cdcbcc01bbd8f65a02eba056eb0f9856200e023` | same | yes |
| Stage 3 packet manifest | `2948d6cb8896b424363cac14a3b463493010fd65b61e3b7f6d02335c1ea3773e` | same | yes |
| Stage 2 packet manifest | `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387` | same | yes |

- **Capsule members.** All 16 files match the capsule's SHA-256 and byte counts. That includes the return
  (`c9cb4259312ff2fcc7e46be5a3f35857ecaf290372c7cbaeaa62ebe09d44dfb4`, 23,304 bytes).
- **Frozen texts and base.**
  - `control/C4-FROZEN-STATEMENTS.lean` = `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1`, and it is byte-identical to
    `sources/c4-base/LeanProject/LeanProof/Statements.lean`.
  - `.md` = `6aa6dfe5971a187be2be41cc1e350db4beff187ca5b648cdb9aec2edc5eca54b`.
  - All five base `.lean` files match their Stage 2 records.
  - The controller cache source `scratchpad/c4-base/LeanProject/LeanProof/*.lean` is byte-identical to `sources/c4-base` (CF-C4-S3-1).
- **Mathlib pin.** `git rev-parse HEAD` in the shared package gives `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals `PIN.json`.
- **Every 64-hex literal in the return is backed.** None is unmatched.

| Literal(s) | Backed by |
|---|---|
| `226555ee…` | Stage 2 seal |
| `0fc723d7…`, `6aa6dfe5…` | Gate ruling 23 |
| `385af1bf…`, `64a101ef…` | `sources/c4-base/SOURCE-DIGESTS.json` |
| `a2eeaf65…` | Recomputed on `scratchpad/c4-T2/LeanProject/LeanProof/T2.lean` (658 lines, as claimed) |
| The five draft-input digests (`0db39495…`, `1f3f365d…`, `c0d1794f…`, `396315cc…`, `a03e15f3…`) | Recomputed on the named files; each is present in the Stage 2 manifest |

- **Claim identity.** T2 proposes no `E993-R31-` key, so no alias check is owed. It cites
  `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (through the carried definitions) and the governed C1-LA1 terminal. Every name T2
  declares for the five nodes is the frozen name of record. The reserved name `cb8_topRank_eligible_and_weightedHall` does not occur in
  `T2.lean`.
- **Consistency after the host interruptions (attack-brief preamble).**
  - The final scratch agrees with the return: `T2.lean` digest, the build log (`Build completed successfully (8657 jobs)`, one
    unused-variable warning at `T2.lean:445:5`) and `axioms.log` (five lines, standard axioms only) all match what the return quotes.
  - `LeanProof.lean` is back to the base's five-import form (`61099148e1f46b48ce3eca0b723f29900739942d8405399a5946d7249adff5f4` = base).
  - `build-root.log` is empty, as disclosed for the first interruption.
  - The replay script `scratchpad/c4-T2-replay/replay.sh` exists and does what the return says: copy-out, the controller cache, the build,
    the axioms, the digest.
- **Admission defect for T2 (`FORMALLY_VERIFIED_TOKEN_IN_ROUTE_RETURN`), adjudicated as nothing to strike.** The token appears three
  times:
  - line 56 cites the governed C1-LA1 terminal, which is allowed;
  - line 185 is a negation ("None is labeled `formally_verified` by this route");
  - line 207 describes the headline.
  
  No scratch declaration of T2 is labelled `formally_verified`.

## Independent re-derivation

I used three instruments of my own. None of them depends on T2's scripts. All scratch is under `scratchpad/c4-crit-T2-F/`.

**1. Copy-out-first Lean rebuild (the kernel, in my environment).**
- **Setup.** I copied `sources/c4-base/LeanProject` into my scratch, added T2's `T2.lean` unchanged, bound `.lake/packages` by manual
  symlink, and copied the controller cache CF-C4-S3-1. I did not use T2's cache and did not pass `--no-cache`.
- **Build.** `lake build LeanProof` replayed the base with 0 errors and 20 `sorry` warnings, all in `Statements.lean`, as frozen. Then
  `lake build LeanProof.T2` **built T2.lean fresh** (`Built LeanProof.T2 (7.3s)`) with 0 errors and 0 `sorry`.
- **Axioms.** `#print axioms` gives `[propext, Classical.choice, Quot.sound]` for all five N3 declarations and for the two generic
  uniqueness lemmas.
- **Token scan.** `T2.lean` contains no `sorry` tactic, `admit`, `native_decide`, `set_option` or `axiom`. The word "sorry" occurs once,
  in the header comment.

**2. Byte check of the frozen text (gate ruling 23)** (`stmt_diff.py`). The comparison covers `theorem` through `:= by` for each
declaration, and the full `cb8GSec` definition.
- T2's `cb8GSec` definition is byte-identical to the frozen text (`6888f500…`), and so is the `open Classical in` that precedes it.
- All five N3 signatures are byte-identical to the frozen text:
  - `409cebbc…` `cb8GSec_nonneg_and_support`
  - `33ede4f8…` `cb8_sector_arcImages_mem_layer`
  - `3f4cff40…` `cb8_sector_legCount`
  - `1253ebae…` `cb8GSec_out_eq`
  - `bafb30fd…` `cb8GSec_out_ge_one`
- **Carried terminal.** The C1-LA1 terminal that T2 consumes (`cb8_sectorTemplate_nonneg_out_in_switch`, base `Main.lean` entry 105) is
  byte-identical to the governed snippet
  `sources/c1-results/runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible/LeanProject/LeanProof/Snippets/0027-lemma-E993Transport-cb8_sectorTemplate_nonneg_out_in_switch.lean.fragment`.
  The `lemma … end` body is 1,140 characters on both sides and equal.

**3. An independent Python evaluator of the frozen definition** (`crit_n3.py`, standard library, exact `Fraction`s, fixed seeds).
- **What it evaluates.**
  - The graph `CB(8,m)` is built from SEMANTIC-CONTRACT §2 with the frozen label convention.
  - `cb8GSec` is evaluated literally from the frozen text: sector guard, layer guard, literal `transportRel` (a full scan over every
    witness `u` at `m = 1`), and the per-choke indicators.
  - Weights come in two kinds. GENERIC weights are random positive rationals per state; the Out bridge is an identity in the weights, so
    this tests the combinatorics alone. ACTUAL weights use C1-LA1's values: tables `cb8Bpb`/`cb8Bpc` (36 entries each) and `cb8CGamma` (7)
    parsed from base `Main.lean`, with the formulas of entries 83–87 re-typed.
- **Exhaustive at `CB(8,1)`** (`p* = 6`). The scan covers all 8,332 sets of `I_7`, all 8,484 of `I_6`, and all 1,792 sector sources.
  - `cb8GSec_out_eq`: `Σ_{A ∈ I_6} g_sec(B, A) = Σ_i Out(state_i B)` holds at every sector source, for both weight sets. **0 failures.**
    Every `A ∈ I_6` was scanned. An `A` for which neither `B∖A` nor `A∖B` is a singleton is skipped, because every indicator of the frozen
    definition tests a singleton difference, so its value there is 0 by definition.
  - `cb8_sector_legCount`: 0 failures. At `m = 1` the sets come from the layer, not built from legs.
  - `cb8_sector_arcImages_mem_layer`: 0 failures, covering every deletion and every `β_i = 1` switch.
  - The two uniqueness lemmas: on all 70,688,688 pairs `(B, A) ∈ I_7 × I_6`, including non-sector `B`, a singleton `B∖A = {x}` forces
    `A = B − x`, and a singleton `A∖B = {u}` with `|N(u) ∩ B| = 2` forces `A` to be the switch image. **0 failures.**
- **Sampled at `m = 2` and at the class rows `m = 107` (endpoint), `158`, `164` (fresh) and `161` (structural).**
  - **Sources.** 60 random sector sources at `m = 2`. At each class row, 6 random sector sources, 7 structured ones (a sequence of
    `(1, γ)` chokes for `γ = 1..7`, then filled) and one all-`b` source.
  - **Candidate targets.** All deletions, plus, for each choke `u_i ∉ B`, every independent `A = B − {x, y} + u_i` with
    `N(u_i) ∩ B ⊆ {x, y}`. This set contains every `A` of size `p*` on which some indicator can be nonzero, because the indicators need
    `|A∖B| ≤ 1`. The fast `transportRel` uses the fact that a switch witness must lie in `A∖B`.
  - **Result.** `out_eq` holds with **0 failures** at every row, for both weight sets. The number of candidates (sources) per row is
    83,172 (14) at 107, 170,799 (14) at 158, 185,225 (14) at 161, 195,675 (14) at 164, and 973 (68) at `m = 2`.
  - With the actual weights, the minimum sampled `Σ_i Out` is **exactly 1** at every class row (and at `m = 2`). This is consistent with
    `cb8GSec_out_ge_one`; see finding F9.
  - The actual weights are nonnegative on every `State8` at 107, 158, 161 and 164, which replays C1-LA1 conclusion (i).
- **Grade of this instrument.** It is bounded and never evidence of the universal statements. The Lean kernel carries those.
- **Output and replay.** The JSON output digest is `d199a5602abe5bab580c62a0b8cf32d9c28e1acae3fd8f8d4bbb02d4aea75c27`, identical on two
  runs (`run1.out` and inside `replay.sh`).

**Difference index.** `none: no numeric claim` about a coefficient row. The only numbers in this critique are set counts and the
`g_sec` row sums above. No `i_{p+1} − i_p` difference is involved.

**Critic-derived advance: binding N3 to the frozen declarations (the return's Remaining obligation item 1, attempted and done at scratch
level).**
- **What I built.** `make_bound.py` produces `LeanProof/StatementsN3.lean`
  (`b11d41c7cfd17a9f09dd77e2032f1c701bbf51729285116f32de2e23385b586d`). It is the FROZEN `Statements.lean` with two changes and nothing
  else:
  - exactly the five N3 `sorry` bodies are replaced by T2's proof bodies;
  - T2's proof-internal helper block is inserted after the frozen `cb8GSec` definition.
- **Diff against the frozen file.** `diff control/C4-FROZEN-STATEMENTS.lean StatementsN3.lean` deletes exactly five lines, all `  sorry`,
  and deletes nothing else. `stmt_diff.py` run on the bound file confirms the definition and all five signatures are byte-identical.
- **Build.** `lake build LeanProof.StatementsN3` builds in the frozen file's own context (`open SimpleGraph Polynomial`, imports `Main`,
  `E1FlowConstruction`, `ChokeState`) with 0 errors. It leaves exactly 15 `sorry` warnings, which is 20 − 5.
- **Axioms.** `#print axioms` on the frozen-file declarations gives `[propext, Classical.choice, Quot.sound]` for all five N3 nodes. The
  control, `cb8GSec_in_eq` (N4, still `sorry`), shows `sorryAx`, so the axiom check can tell the two apart.
- **What this establishes.**
  - The frozen constant `E993Transport.cb8GSec` (not a copy) satisfies the five frozen N3 statements.
  - The binding the return called "mechanical" is in fact mechanical.
  - The helper names do not collide with anything in the base (each of the 13 helper names occurs 0 times in the five base files).
  
  I attribute this binding to myself as a critic-derived advance. It is compiled scratch with no grade.

## Attacks and findings

1. **Fidelity first.** N3 contains no active-tag weight, `F_{p*}` or `x`. The Out bridge is a statement about the frozen `g_sec` and C1-LA1's
   `cb8Out` only, so no (WID) assertion is owed for this route. The relation is the carried `transportRel`, entry 19: `A = B.erase q`, or
   `u ∉ B`, `|N(u) ∩ B| = 2`, `A = insert u (B \ N(u))`. That is the literal (D) ∪ (S) of SEMANTIC-CONTRACT §1. **No fidelity failure.**
2. **The generic lemmas are true as stated, in the right direction, and used.**
   - `eq_erase_of_sdiff_singleton`: `B∖A = {x}` gives `B∖{x} ⊆ A`, and `|A| = p = |B∖{x}|` forces equality. `hx` follows from `heq` and is
     redundant but harmless.
   - `eq_switch_of_sdiff_singleton`: `A = insert u (A ∩ B)`. Independence of `A` together with `u ∈ A` gives `A ∩ B ⊆ B ∖ N(u)`. Both
     sides have size `p − 1`: `|A ∩ B| + 1 = p`, and `|B ∖ N(u)| = p + 1 − 2`. `hu` also follows from `heq`, again redundant.
   - `hAindep` is load-bearing. I have an exact counterexample at `m = 1` when it is dropped: `B = {0,2,4,7,9,11,13}` (state `(1,4)`),
     `A = {3,4,7,9,11,13}` satisfies `A∖B = {u_0}`, `|A| = 6`, `|N(u_0) ∩ B| = 2`, yet `A` is not independent (`u_0 – b_00`) and is not the
     switch image `{2,3,7,9,11,13}`.
   - Both lemmas are used, in `sdiff_singleton_sum`/`sdiff_singleton_sum'` and in the guard-dropping step `hred`.
3. **The guard-drop `hred`** (the frozen `dite` guard includes `transportRel B A`). T2 proves that on `A ∈ I_{p*}` each nonzero indicator
   already implies `transportRel`: a `b`/`c` indicator through `eq_erase`, and a switch indicator through `eq_switch`, with `β_i = 1`
   giving the count of 2 by `choke_neighborFinset_inter_card`. It is proved by contraposition, not assumed. The indicators the definition
   leaves at 0 (the `r`/`v` deletions, the `s`-switch, switches at `β_i ≠ 1`) are exactly the template's "0 on every other sector arc".
   **Sound.**
4. **Out ≥ 1 (`cb8GSec_out_ge_one`).** It is taken from C1-LA1 clause (ii), `∀ c : Fin m → State8, Σ(β+γ) = (16m+1)/3 → 1 ≤ Σ cb8Out`,
   applied at `c = chokeState m B hsec`. There is **no hidden restriction on `β` or `γ`**: `State8` only asks `β + γ ≤ 8`, which the
   literal set supplies through `chokeBeta_add_chokeGamma_le`, using independence. The leg total comes from `cb8_sector_legCount`
   (`Σ + 2 = |B|`) and `|B| = (16m+4)/3 + 1`. The identity `(16m+4)/3 − 1 = (16m+1)/3` holds for every `m` in floor arithmetic, and T2's
   `omega` step contains no bare ℕ subtraction. The class hypotheses enter only through C1-LA1. **Sound.**
5. **The residue class and the endpoint.** `hm : 107 ≤ m` and `hres : m % 3 = 2` enter N3 only through C1-LA1 (nonnegativity, Out). The
   endpoint `m = 107` is inside the class (`107 % 3 = 2`), and my evaluator checks it. `out_eq`, `legCount` and `arcImages` carry no class
   hypothesis. That is correct: they are identities at the pinned index `(16m+4)/3` (ruling 24(6)).
6. **Asymptotics, Newton/Darroch, `θ*`.** There are none. `cb8Theta = 288/L` appears only as the value of C1-LA1's template, inside
   `cb8Sigma`, as C1-LA1 defines and proves it. The `θ*` law is not a hypothesis anywhere.
7. **Fresh rows and flow classes.** N3 is only the sector OUT half: sources in `sec` and their row sums. The In side (in-sector inflow ≤ 1),
   switch images with `ρ_1γ` added, one-choke and multi-choke targets, and weight-zero targets all belong to N4, N5 and N7, and T2 claims
   none of them. The fresh-row test (`158`, `164`) and the structural row `161` were run by me on the Out bridge before I accepted its
   universal form (item 3 of the re-derivation): 0 failures. No cut is claimed or found. This is a proof route, and a template failure
   cannot arise here because the Out values are C1-LA1's.
8. **Provenance literals in `T2.lean`'s header (not load-bearing; they concern DRAFT text, never a carry).**
   - The header says `cb8GSec` is a byte-identical copy of the frozen file's "lines 257-269". The definition actually sits at **lines
     125–137**; the bytes are identical, as I verified. **Line citation struck and corrected.**
   - The header attributes `no_choke_of_root_mem` and `choke_neighborFinset_inter_card` to `CriticAdvance.lean` "lines 36-42, 101-131".
     Those lines of that file hold `cbEdge`/`cbGraph` lemmas.
     - The helpers are at `critic-section.lean` lines 36–42 / 101–131, and at `CriticAdvance.lean` 230–236 / 295–325.
     - `no_choke_of_root_mem` is byte-identical to `critic-section.lean` 36–42.
     - `choke_neighborFinset_inter_card` is **not** byte-identical: the statement is restated through `chokeBeta`, `unfold chokeBeta` is
       added, and the binder `this` is renamed `hv`.
     
     **Struck:** the header's "reproduced here byte-identically" for the second lemma, and the file/line attribution. The attribution to
     critic C-T3-U itself stands.
9. **Tightness observation (bounded).** At every class row I sampled, some structured source has `Σ_i Out = 1` exactly, with states
   `(1,1)`, `(1,4)`, `(1,7)` at 107 and 161. So the Out constraint of C1-LA1's allocation has **zero slack** there. The scaling step
   "scaled down to exactly 1" is a no-op at those sources, and any perturbation of `pb`/`pc`/`σ` downward at those states breaks N3's
   Out ≥ 1. This is not a defect of N3. It tells Stage 7 and N7 that no Out margin exists to absorb a change in `cb8GSec`.
10. **Integration risk (Stage 7).** `T2.lean` redeclares `cb8GSec`, so it cannot be imported alongside `Statements.lean`. My binding
    (advance above) resolves this. There is a second risk: 13 helper names are added to `E993Transport`. If another seat's proof of
    N4/N5 carries the same C-T3-U drafts (`no_choke_of_root_mem`, `choke_neighborFinset_inter_card`), a joint N3+N4/N5 award will need one
    copy only. I have not read any sibling, so this is a risk, not an observed clash.
11. **Process.** The disclosed `pgrep -f` breaches worker-brief item 13, and I record it as a process defect. It has no effect on any
    claim. The PIDs it concerns are not mine to query, and I did not query them.

## Mechanism-equivalence and fence check

- **Mechanism.** The allocation suggested `cb8GSec_out_eq` "by `Finset.sum_image` over label uniqueness". T2 uses `Finset.sum_comm` and
  single-point sums (`Finset.sum_eq_single`), with the witness made unique by the two cardinality-forcing lemmas. That is the same
  mechanism: label uniqueness turns the Out row sum into per-choke counts. The token `SECTOR-GSEC-IMAGES-LEGCOUNT-OUT-BRIDGE` and the
  route ID `C4-T-02` are present verbatim. The route is not a refuted mechanism: it is no compression lemma, no CHAR at `m = 1`, no
  `m`-independent per-choke certificate, and no real-rootedness.
- **Fences (SOLUTION-CONTRACT §3):**
  - one rank, `p*`, and the class only (for the class-dependent statements);
  - no status transfer to any aggregate;
  - no census used as proof (the frozen companion's census is cited only for non-vacuity, and my census is bounded);
  - `θ*` is never a hypothesis;
  - the r30 bounded record is not used;
  - no sealed root was edited;
  - attribution is kept on the face (C1-LA1 for the template; C-T3-U and Cycle 2 U2 for the drafts).
- **Template vs network (fence 4).** The Out bridge is exactly the proved reduction fence 4 requires: the certificate's Out function equals
  the literal network's `g_sec` row sum at a sector source, with the equality written on the face.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| "compiled sorry-free", "standard axioms only" (all five N3) | My fresh rebuild and axiom print, in both T2's context and the bound frozen context | **backed** |
| "statement texts are byte-identical by construction" | `stmt_diff.py`: definition and five signatures equal | **backed** |
| `T2.lean` digest `a2eeaf65…`, 658 lines | Recomputed | **backed** |
| "Build completed successfully (8657 jobs)", one warning at `T2.lean:445:5` | T2's log and my rebuild agree | **backed** |
| "Two independent instruments" (`lake build`; `#print axioms`) | Both are the same Lean toolchain on the same elaborated environment. They are one instrument viewed twice (r30 lesson) | **narrowed**: "one toolchain, build and axiom trace". The `compiled` verdict stands, since item 11 needs exactly those two logs, and both are present. My Python evaluator is the independent second instrument, at bounded scope. |
| "the frozen statements' own non-vacuity census (5,547+ checks, 0 failures …)" | The figure 5,547 does not appear in `control/C4-FROZEN-STATEMENTS.md`. Its N3 rows sum to 16,528 checks (12 + 1,816 × 4 + 12 + 9,240) | **struck** (the figure only; it is bounded non-vacuity data in any case) |
| "matched the run's `SOURCE-DIGESTS.json`" for the five draft-input digests | Present in the Stage 2 manifest and the nested digest records | **backed** |
| Header of `T2.lean`: "lines 257-269"; "`CriticAdvance.lean` lines 36-42, 101-131"; "reproduced here byte-identically" | Findings 8 | **struck / corrected** |
| `formally_verified` (lines 56, 185, 207) | A governed-award citation, a negation, and the headline definition | **no strike** (admission defect adjudicated) |
| "The binding step is mechanical" | Demonstrated by my binding | **backed** (critic-derived) |

## Verdict

verdict: retained

headline_resolved: no

- COND4_formal: false
- E1_formal: false
- TERMINAL_integration: false
- cut_candidate: none
- FROZEN_NODES_CLOSED: N3

T2's claim stands without narrowing: the five N3 declarations, exactly as frozen, compile sorry-free on the Cycle 4 base with
`propext`, `Classical.choice` and `Quot.sound` only. I reproduced it independently. I also reproduced it on the frozen `cb8GSec` itself
through my binding of the proofs into the frozen file. Everything struck is a provenance or wording literal, not a mathematical claim.

In my view the mathematics of all five statements is complete. The class-dependent pair rests on the governed C1-LA1 terminal. As
mathematics the grade is `proved_informal`. As Lean it is compiled scratch with no formal grade until a governed Stage 7 award closes
(SOLUTION-CONTRACT §4). `FROZEN_NODES_CLOSED: N3` records scratch compilation, not an award. Conjunct 4, Tier 1 formal and the headline
all remain open.

## Remaining obligation

What a successor inherits, exactly:

1. **Stage 7 award for N3 (gate ruling 31).** A governed run whose terminals are the five frozen N3 statements, byte-for-byte, stated
   against the frozen `cb8GSec` of `Statements.lean` (not a copy).
   - C1-LA1 entry 105 is carried from its governed snippet `0027-…cb8_sectorTemplate_nonneg_out_in_switch` (ruling 19; I verified it is
     byte-identical to the base copy).
   - T2's 13 helper declarations become in-run authored entries, attributed to C-T3-U (`critic-section.lean`) and Cycle 2 U2.
   - The ready draft is my `scratchpad/c4-crit-T2-F/LeanProject/LeanProof/StatementsN3.lean` (`b11d41c7…`): the frozen file minus exactly
     five `sorry` lines. It builds, and its N3 axioms are standard.
   - If N4/N5 are funded jointly, the helpers must be de-duplicated against any N4/N5 proof that carries the same C-T3-U drafts.
2. **Open frozen nodes, not touched by N3.** The sector In half and A2 (N4: `cb8GSec_in_eq`, `cb8GSec_in_le_one`, `cb8GSec_zero_classes`;
   N5), the E1 lift (N1, N2), and N6, N7, N8. Conjunct 4 is open; so are the Tier 1 terminal and the headline.
   - N4's In bridge is the preimage-side mirror of the Out bridge. Every in-sector preimage is a leg insertion, because a switch image
     contains no `r`, and an insertion's value uses the SOURCE's state, `(β+1, γ)` or `(β, γ+1)`. It can reuse `eq_erase_of_sdiff_singleton`
     directly.
   - No Out margin is available to N7 (finding 9).

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-crit-T2-F/`
(SHA-256):

| File | SHA-256 | What it is |
|---|---|---|
| `seal.py` | `a64b5f26a3dd171445a5960e1088ba9898b071bae4665dcc5a000d6bcb074891` | Seal and capsule-member verification |
| `stmt_diff.py` | `c508ab06f8ef000180391b366f19c504c5c9bfa7758dd270d005927af2b597f0` | Frozen-text byte comparison |
| `make_bound.py` | `3709919f1531a9608a21a74b4e9539f72d150dca253c0b58f478dbd89c48120b` | Generates the bound frozen file |
| `crit_n3.py` | `e7ca631d30bcd0ff52a9f3552af850cf204ca16e761c8fc25fb87ba55d5159b6` | Independent evaluator |
| `run1.out` | `e60c54f6d888f85f7c1f6a67f40800a1bc8ab97c16d672e0c4cae3b5fa0de589` | Evaluator output (JSON digest `d199a560…`) |
| `AxiomCheckT2.lean` | `44edb7a406acad85029d7e7251fc3d285a1bbf0ba1cb57192b66725a6702a280` | Axiom check, T2 context |
| `AxiomCheckBound.lean` | `45f5cabdb1703d7355be29582dc56279ab0213147fb6a8ce73033aae0825f43a` | Axiom check, bound frozen context |
| `build-base.log` | `7b19c884a8fd257db80a9e50986da7f0c00999a598d77872eadab9763c4da18d` | Base build log |
| `build-t2.log` | `e5b663481c9897af85d29299984689753f0a86341c47d44e2d214a0242279a24` | T2 build log |
| `build-bound.log` | `6e743234ea05330d559f696b33956203f7f1293fa450149bee3fd56e4e84b604` | Bound-file build log |
| `axioms-t2.log` | `f3ee4e439bc9d21c646e1438a67cc0471dbf285644bf14a6bfe4fb8c6762159b` | Axiom log, T2 context |
| `axioms-bound.log` | `5f14ce3d60fabb0b17cd12da5370bc00a607f23841d52675b6c65cdffde5f274` | Axiom log, bound context |
| `replay.sh` | `a46378d57d004e8b25e0338a33d86ae5d402604570a1a647a014aee24d82901c` | Copy-out-first end-to-end replay |
| `replay.log` | `4b426efa15cec94b4b9a3025e9be21bcf7d9d663860390dcd45f82bcef3eb564` | Replay log; reproduces every result above |
| `LeanProject/LeanProof/T2.lean` | `a2eeaf65…` | Copied from T2 |
| `LeanProject/LeanProof/StatementsN3.lean` | `b11d41c7cfd17a9f09dd77e2032f1c701bbf51729285116f32de2e23385b586d` | Bound frozen file |
| `entry105.txt`, `cs_101_133.txt`, `t2_63_95.txt` | — | Comparison extracts |

- **Replay:** `sh <run root>/scratchpad/c4-crit-T2-F/replay.sh`. It runs in the foreground, about 4 minutes, most of that in the Python
  evaluator.
- **Import list:** Python standard library only (`itertools`, `json`, `random`, `re`, `sys`, `hashlib`, `fractions`); Lean from the pinned
  toolchain.

**Disclosures.**
- **Reads outside the capsule's literal list, each within the grant.**
  - `control/C4-WORKER-COMMON-BRIEF.md`: a Stage 2 member, required by the common brief.
  - `control/C4-FROZEN-STATEMENTS.lean` and `.md`: named by the protocol.
  - `sources/c4-base/` and its digests.
  - The C1-LA1 governed snippet 0027.
  - `sources/c3-scratch-lean/c3-crit-T3-U/LeanProject/{CriticAdvance.lean, critic-section.lean}` and the four other draft-input files T2
    cites (hashed; the two C-T3-U files were also grepped).
  - The controller cache source `scratchpad/c4-base/LeanProject/`: listed, its `.lean` files compared, and its `.lake/build` copied, as
    the attack brief and CF-C4-S3-1 direct.
  - `scratchpad/c4-T2-replay/replay.sh` and `AxiomCheck.lean`, which the return names as its replay, in a sibling directory of `c4-T2/`.
  - `git rev-parse HEAD` in the shared Mathlib package.
- **Searches.** `ls` of named `c4-T2` subdirectories (non-recursive); one `find` rooted at `sources/c1-results/runs`; `grep` on single
  named files inside `sources/`, the frozen files, the return and `T2.lean`.
- **Directory listing.** Listing `cycles/cycle-4/stage4/critics/T2/` before creating `F/` showed that a sibling directory `U` exists. I
  did not open it.
- **Not done.** No other return, critique or adjudication was read. No network, no package install, no `lake update`/`lake clean`, no
  process listing. No background job was started, so there is nothing to kill. There are no writes outside my scratch and this file.
