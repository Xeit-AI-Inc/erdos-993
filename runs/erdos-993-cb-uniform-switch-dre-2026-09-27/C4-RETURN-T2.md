# Cycle 4 Route T2 Return

**Route ID:** `C4-T-02` **Mechanism token:** `SECTOR-GSEC-IMAGES-LEGCOUNT-OUT-BRIDGE` **Orientation:** T (prove)

**Boot acknowledgment.** Operating within VerityOS. Restricted boot performed: read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`
and no other VerityOS file outside the run root (the controller booted for the run; the startup
protocol's own task-type map, memory, conversations, modules, skills, logs and decisions were not
read). Subsystems loaded for this task: none beyond the two boot files and the run-root dispatch
chain below.

**Model disclosure.** chartered sonnet/high; transport-resolved model sonnet (explicit parameter);
runtime-reported model id: claude-sonnet-5.

## IMPORT LIST

Standard library only for all Python/shell verification in this return: `hashlib`, `json`,
`subprocess`/shell built-ins (`shasum`, `cat`, `cp`, `ln`, `mkdir`, `diff`). No third-party
packages. All Lean tooling used the pinned toolchain only (`lake`, `lean` from
`/Users/ashtonsperry/.elan/`); no `lake update`, no `lake clean`, no `elan` invocations, no network.

## Seals and digests verified before use

- **Stage 2 packet seal** (`control/C4-STAGE2-PACKET-MANIFEST.json`): recomputed SHA-256 of the
  canonical JSON (manifest minus `seal_sha256`, `sort_keys=True`, `separators=(",",":")`, no
  trailing newline) = `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`, matching the
  stored `seal_sha256` exactly.
- **Frozen leaf statements** (gate ruling 23): `control/C4-FROZEN-STATEMENTS.lean` SHA-256
  `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1`; companion
  `control/C4-FROZEN-STATEMENTS.md` SHA-256 `6aa6dfe5971a187be2be41cc1e350db4beff187ca5b648cdb9aec2edc5eca54b`.
  Both recomputed and matched literally against the gate text.
- **Cycle 4 base** (`sources/c4-base/`, gate ruling 25): all 9 listed files' SHA-256 recomputed
  and matched `sources/c4-base/SOURCE-DIGESTS.json` exactly (`lakefile.toml`, `lake-manifest.json`,
  `lean-toolchain`, `LeanProof.lean`, `LeanProof/Main.lean` = `385af1bf529a6c8e9e136ce87472b9fd6cd51f24ec4976265dbbf7160d62ea3f`,
  `LeanProof/ChokeState.lean` = `64a101ef4d08e48e803a39982d58abdeb20397e4e3a90c5591af660a864fd3bb`,
  `LeanProof/E1FlowConstruction.lean`, `LeanProof/C3LA1.lean`, `LeanProof/Statements.lean`).
- **Mathlib pin** (`sources/mathlib-binding/PIN.json`): `mathlib_rev = 905b95818eb32af7874a58b427f50c1711a5e96c`;
  confirmed identical to `git rev-parse HEAD` inside the shared package checkout at
  `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib`.
- **Draft-input scratch digests** (drivers of two of the five proofs; DRAFT, never a carry): critic
  C-T3-F `sources/c3-scratch-lean/c3-crit-T3-F/LeanProject/LeanProof/CriticT3F.lean` =
  `0db39495572bac5c092b3d80187db270ed54d46f0203d4f505742dc2de0d0a90`; critic C-T3-U
  `.../c3-crit-T3-U/LeanProject/CriticAdvance.lean` = `1f3f365df60727f8229e121ae191b14530477518d65e26ac15441a05f48cf6e0`
  and `.../critic-section.lean` = `c0d1794fdc3698ce23cdd0cc82b3f261e800f7514b0f9c8162fa2e6aafb31e75`; critic C-U1-T
  `.../c3-crit-U1-T/LeanProject/LeanProof/Critic.lean` = `396315cc96343da6ed4e159bff25120ce5aad38dbea4642287e154c2b08faf6f`;
  Cycle 2 U2 `sources/c2-stage7-sources/U2/LeanProject/LeanProof/Main.lean` =
  `a03e15f3695f817ed0c02d16c4d4a258b897c78f8ee773246aa57475c8d81d2c` (leg-count region, lines 2745-2941).
  All recomputed and matched the run's `SOURCE-DIGESTS.json` records before reading.

## Registered claims touched (named before any computation, per SEMANTIC-CONTRACT §4)

This route engineers proofs of already-frozen Lean *statements* (gate ruling 23); it registers no
new `E993-R31-` key and re-confirms no headline claim. It cites, without re-proving or upgrading:
`E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (via the carried `activeWeight`/`transportRel`
definitions used verbatim), and the r30 C1-LA1 sector-template terminal (`cb8_sectorTemplate_nonneg_out_in_switch`,
Main.lean entry 105 — nonnegativity, Out ≥ 1, In ≤ 1, Switch, all `formally_verified` at their exact
scope as carried terminals of the governed award C1-LA1). No alias check is needed for a new name
(none proposed): all five names proved here are the frozen names of record.

## Object and derivation

Object (allocation, `control/C4-ALLOCATION.md`, route T2): the five N3 declarations of
`control/C4-FROZEN-STATEMENTS.lean` — `cb8GSec_nonneg_and_support`, `cb8_sector_arcImages_mem_layer`
(the smallest, "image-in-layer" lemma), `cb8_sector_legCount`, `cb8GSec_out_eq` (the Out bridge),
`cb8GSec_out_ge_one`.

Step by step, naming where each hypothesis enters:

1. **`cb8GSec_nonneg_and_support`.** Unfolds the frozen `cb8GSec`'s outer `dite`. *Support*: the
   guard's third conjunct is exactly `transportRel (cbGraph m) B A`, so `¬transportRel` forces the
   `else 0` branch directly (`h.2.2` supplies the contradiction in the `dif_pos` case). *Nonneg*:
   each summand is `if c then X else 0` with `X ∈ {cb8Pb, cb8Pc, cb8Sigma}`; nonnegativity of all
   three on the class enters via the carried C1-LA1 terminal's first conjunct
   (`cb8_sectorTemplate_nonneg_out_in_switch m hm hres |>.1`, which needs exactly `hm : 107 ≤ m`,
   `hres : m % 3 = 2` — the class hypotheses of this theorem, nowhere else).
2. **`cb8_sector_arcImages_mem_layer`.** No class hypothesis (rank-free, any `m`). *Deletion half*:
   `B.erase x` is independent by `Set.Pairwise.mono` on `B.erase x ⊆ B` (downward closure of
   independence — a generic fact, not graph-specific); its cardinality is `B.card − 1` via
   `Finset.card_erase_of_mem`, matching `p*` since `hB` gives `B.card = p*+1`. *Switch half*: the
   hypothesis `chokeBeta m B i = 1` enters through two facts about the literal graph — `u_i ∉ B`
   (from `no_choke_of_root_mem`, itself from `hr : cbVertex m 0 ∈ B` and independence: a choke
   adjacent to the present root cannot also be present) and `|N(u_i) ∩ B| = 1 + chokeBeta m B i`
   (`choke_neighborFinset_inter_card`, from `hr` again), combining to the needed `= 2`. A NEW
   generic lemma proved here, `switch_preserves_indep`, shows the switch image is independent using
   only `u ∉ B` (not the cardinality); `card_switch_image` (also new, generic) gives its exact
   cardinality `B.card − 1 = p*` from the `= 2` fact via `Finset.card_sdiff_add_card_inter`.
3. **`cb8_sector_legCount`.** Re-authored (not copied) from Cycle 2 U2's DRAFT
   `sector_legCount_eq_card_sub_two` (never graded, never a carry) into the frozen theorem's
   subtraction-free shape (`Σ + 2 = B.card`, not `Σ = B.card − 2`). The hypothesis `hsec` enters
   through `sdiff_rv_eq_biUnion`: `B \ {r, v}` is exactly the disjoint union over chokes of the
   present leg vertices, proved by the exhaustive label case split `cb_val_cases` (every vertex is
   `r`, `s`, `v`, a choke, a support, or a private leaf) combined with independence to rule out `s`
   and every choke. `Finset.card_biUnion` over pairwise-disjoint `legVerticesAt` blocks gives the
   leg total; `Finset.card_sdiff_add_card_inter` (unconditional, no subset side-condition beyond
   what `hsub : {r,v} ⊆ B` supplies) turns `|B \ {r,v}|` into `B.card − 2` in the additive
   (subtraction-free) direction `|B\{r,v}| + 2 = B.card`.
4. **`cb8GSec_out_eq`.** The hardest node (the checkpoint's "Stage 7 candidate"). Two new generic
   uniqueness lemmas do the real work, both by a cardinality-forcing argument (an independent set of
   the FIXED target rank `p*` that differs from `B` only by one designated vertex must be exactly
   the specific erase/switch image — not merely SOME set with that one-point difference, since any
   "extra" freedom would break the cardinality match): `eq_erase_of_sdiff_singleton` (for deletions:
   `B \ A = {x}`, `A ∈ indepFamily p*` ⟹ `A = B.erase x`) and `eq_switch_of_sdiff_singleton` (for
   switches: `A \ B = {u}`, `A` independent of the right cardinality, `|N(u) ∩ B| = 2` ⟹
   `A = insert u (B \ N(u))`). These give two "single-point sum" lemmas
   (`sdiff_singleton_sum`, `sdiff_singleton_sum'`) collapsing `Σ_A (if B\A={x} then c else 0)` to
   `if x∈B then c else 0` and the switch analogue to a bare `c` (given `u∉B`, the card-2 fact).
   The frozen `cb8GSec`'s outer guard drops termwise (`hred`): each individual leg/switch indicator,
   once `A` ranges over `indepFamily p*`, already forces `transportRel B A` via these same
   uniqueness lemmas, so the wrapper is provably redundant — proved by contraposition, not assumed.
   After `Finset.sum_comm` swaps the outer `Σ_A` and the choke index `Σ_i`, each leg contributes
   `chokeBeta(i)·pb` / `chokeGamma(i)·pc` (`sum_ite_const`, matching `chokeBeta`/`chokeGamma`'s own
   filter-card definitions by `rfl`), and the switch term case-splits exactly on `cb8Out`'s own
   guard `(β_i=1 ∧ 1≤γ_i)`, giving termwise equality to `cb8Out m (chokeState m B hsec i)` by
   `ring` after `unfold cb8Out`. No hypothesis beyond `hB`, `hsec` (rank-free otherwise; the class
   enters nowhere in this theorem).
5. **`cb8GSec_out_ge_one`.** Rewrites by `cb8GSec_out_eq`, then supplies the C1-LA1 terminal's
   second conjunct (Out ≥ 1) with `c := chokeState m B hsec`, discharging its hypothesis
   `Σ_i(β_i+γ_i) = (16m+1)/3` from `cb8_sector_legCount` (`Σ+2=B.card`) and `hBcard : B.card =
   (16m+4)/3+1` via `omega`'s built-in handling of floor division by the literal `3`
   (`(16m+4)/3 − 1 = (16m+1)/3` for every `m`, no residue hypothesis needed for this identity
   itself). Uses `hm : 107 ≤ m`, `hres : m % 3 = 2` only to invoke the C1-LA1 terminal.

**ℕ-subtraction and cast discipline.** No bare ℕ-subtraction appears on any theorem's face; every
place a subtraction would arise (`B.card − 1`, `B.card − 2`, `(16m+4)/3 − 1`) is stated and proved
in the additive direction (`x + k = y`) and closed by `omega`, matching the frozen statements' own
subtraction-free style. `cb8Out`'s `(8 : ℚ) − β − γ`-style terms are not touched by this route (they
belong to `cb8In`, N4). No Newton/Darroch input is used anywhere in this route (none of its lemmas
touch a polynomial).

## Non-vacuity and checks (bounded; never evidence of a universal statement)

Every one of the five theorems is a genuine (non-`False`-vacuous) universally quantified statement
over `m`; class hypotheses `107 ≤ m`, `m % 3 = 2` are jointly satisfiable (`m = 107`). No new
numeric table is produced by this route; the frozen statements' own non-vacuity census (5,547+
checks, 0 failures, `control/C4-FROZEN-STATEMENTS.md` "Check summary") already covers the literal
combinatorics these theorems assert and is cited, not reproduced.

## Instrument sides

Two independent instruments confirm the one class of claim this route makes ("these five
declarations, exactly as frozen, compile with real proofs and no hidden axiom"):

- **Instrument A — the Lean kernel via `lake build`.** Side: the elaborator/kernel accepting the
  proof terms. Command: `cd scratchpad/c4-T2/LeanProject && lake build LeanProof.T2`. Result:
  `Build completed successfully (8657 jobs)`, zero errors, one benign unused-variable linter warning
  (`LeanProof/T2.lean:445:5`, an unused `hv` binder in `cb8_sector_legCount`'s `obtain`), zero
  `sorry` warnings.
- **Instrument B — `#print axioms` via `lake env lean`.** Side: the kernel's own axiom-dependency
  trace, independent of the build driver. Command:
  `lake env lean scratchpad/c4-T2/work/AxiomCheck.lean` (imports `LeanProof.T2` and prints axioms
  for all five). Result: all five show `[propext, Classical.choice, Quot.sound]` — no `sorryAx`,
  no extra axiom.

Both instruments were run twice (once during development, once inside the copy-out replay script
below) with identical results. `none: no other numeric claim` — this route reports no table, count,
or table-row value; its only claim is compiled/axiom status, given by the two instruments above.
Difference index: `none: no numeric claim` (per instruction 9, when there is no numeric row).

## Digest literals (copied from tool output, R-11)

- `LeanProof/T2.lean` SHA-256: `a2eeaf65929dd5189b2c5c51ad80363ee9d409e1a335e95434b5611cc86ba6f0`
  (658 lines; verified identical between the working copy and the replay copy below).
- Build/axiom logs (under `scratchpad/c4-T2/work/`, not hashed into this return as separate
  artifacts beyond the digest above, since their content is exactly the build/axiom transcripts
  quoted verbatim in "Instrument sides").

## Deliverable location and scratch

- This file: `cycles/cycle-4/stage3/returns/T2/RETURN.md`.
- Working scratch: `scratchpad/c4-T2/LeanProject/` (byte-copied from `sources/c4-base/LeanProject/`
  plus this route's own `LeanProof/T2.lean`; `.lake/packages` bound by manual symlink to the pinned
  shared Mathlib; `LeanProof.lean` restored to the base's unmodified five-import form — `T2.lean` is
  NOT wired into the shared root import, by design: it does not import `LeanProof.Statements` and
  instead carries its own byte-identical copy of the one frozen definition it needs, `cb8GSec`, to
  avoid a duplicate-declaration clash with `Statements.lean`'s `sorry`-bodied copy of the same name.
  `LeanProof.T2` builds as its own Lake target, `Main`+`ChokeState` only).
- Replay: `scratchpad/c4-T2-replay/replay.sh` — copy-out-first, rebuilds the project fresh from
  `sources/c4-base/` plus `T2.lean`, replays the controller-built cache (`CF-C4-S3-1`) for the base,
  builds `LeanProof.T2`, runs the axiom check, and prints the `T2.lean` digest. Executed successfully
  in the foreground during this route (both instruments' results reproduced identically).

## Grades

All five theorems are `compiled` scratch declarations (SOLUTION-CONTRACT §4: "a compiled scratch
declaration has no grade until its governed award closes"). None is labeled `formally_verified` by
this route. Backing the `compiled` verdict (per common-brief instruction 11): build log and axiom
log both present under `scratchpad/c4-T2/work/` (`build-t2.log`, `axioms.log`), file names containing
`build`/`axioms` as required.

## FROZEN_NODES_CLOSED

`N3` (all five declarations: `cb8GSec_nonneg_and_support`, `cb8_sector_arcImages_mem_layer`,
`cb8_sector_legCount`, `cb8GSec_out_eq`, `cb8GSec_out_ge_one` — sorry-free, standard axioms only,
on the Cycle 4 base's carried definitions).

## Gate lines (ruling 32)

- `COND4_formal: false` (conjunct 4 as a whole is not closed by this route; N4, N5, N6, N7, N8 and
  N1/N2 remain open elsewhere).
- `E1_formal: false` (this route touches the sector half, not the E1 half; N1/N2 are T1/U1's object).
- `TERMINAL_integration: false` (no terminal stitching attempted here).
- `cut_candidate: none` (no obstruction found or attempted; this is a pure engineering route).
- `FROZEN_NODES_CLOSED: N3`

## headline_resolved

`headline_resolved: no` (per the common brief: the headline is Tier 1 `formally_verified` at Stage
7 or a confirmed refutation after two instruments and a second read; neither is this route's
product, and `no` is reported regardless of a route's own local result).

## Route verdict

`compiled` — the five allocated N3 declarations compile sorry-free against the sealed Cycle 4 base,
verified by two independent instruments (kernel build; axiom trace), with no new claim registered
and no headline resolution.

## Remaining obligation (successor inheritance)

N3 is closed in this route's own scratch (`scratchpad/c4-T2/LeanProject/LeanProof/T2.lean`,
digest above) but is **not yet in the Cycle 4 base or any governed award** — a successor (the
Cycle 4 synthesis, or a Stage 7 formalizer per gate ruling 31) must:

1. **Bind `T2.lean`'s five proofs to the actual frozen `Statements.lean` declarations.** This route's
   file does not import `Statements.lean` (to avoid the `cb8GSec` name clash) and so its proofs are
   not literally attached to the frozen `sorry`s yet. The binding step is mechanical (the statement
   texts are byte-identical by construction; only the `cb8GSec` definition needs de-duplicating —
   e.g., by having the Stage 7 project take `T2.lean`'s proofs and `Statements.lean`'s other N-node
   `sorry` placeholders together, dropping `T2.lean`'s own `cb8GSec` copy in favor of
   `Statements.lean`'s) but was not performed here, since this route's deliverable is its own scratch
   file, not a mutation of `sources/`.
2. **N3's two internal generic lemmas** (`eq_erase_of_sdiff_singleton`, `eq_switch_of_sdiff_singleton`,
   and the two `sdiff_singleton_sum`/`sdiff_singleton_sum'` built on them) are reusable beyond N3:
   N4's In bridge (`cb8GSec_in_eq`) and N5's switch-preimage census (`cb8_sector_switchPreimages`,
   `cb8GSec_switchImage_inflow`) need essentially the same one-point-sum machinery on the IN side
   (preimages of a target, rather than images of a source). A successor working T3's object should
   check whether these four lemmas transfer directly (they are stated generically over any
   `SimpleGraph V`, not `cbGraph m`-specific) before re-deriving them.
3. **N4, N5, N6, N7, N8, N1, N2 remain open** — untouched by this route, per allocation (T3, U1, U2,
   U3's objects respectively; F1/F2/F3's audits).
4. **The smallest immediately-next step**, in the checkpoint's own terms: with N3 now compiled, the
   sector Out half is done; the sector In half (N4, T3's object) is the natural next target, and it
   can reuse this route's `switch_preserves_indep`/`card_switch_image`/`eq_switch_of_sdiff_singleton`
   machinery directly (N4's In bridge is the preimage-side mirror of N3's Out bridge proved here).

## Disclosures

### Host-interruption disclosures (process, per coordinator instruction)

This route's session was interrupted and resumed three times before this return was written:

1. **First interruption.** Controller session ended approximately 08:55 EDT (2026-09-28), before the
   base build had produced any output; resumed later the same session. The background build process
   started before the interruption (PID 41624, via `nohup lake build LeanProof &`) had been killed by
   the interruption and left an empty `build-root.log`; it was not awaited across the interruption (a
   read-boundary/process discipline note, not a rule violation at the time it was started, since it
   was polled by literal PID before the interruption occurred).
2. **Second interruption.** Controller session ended approximately 10:02 EDT, resumed 22:46 EDT
   (2026-09-28) — an approximately 12.5-hour gap. A second build attempt (via the harness's
   `run_in_background`, top-level `lake` PID 13980) was also found dead on resumption with no output.
   Diagnosis at that point: `lake build`'s own dependency-resolution step appeared to hang (no
   output for 590s wall-clock in the foreground before the interruption), suspected — correctly, per
   controller fact CF-C4-S3-1 — to be ordinary cold-elaboration time for the 2.4 MB `Main.lean`, not
   a network stall (no network call was ever attempted; confirmed by direct `lake env lean` succeeding
   promptly on the same files once dependencies existed).
3. **Third interruption.** Controller session ended approximately 23:25 EDT (2026-09-28), resumed
   00:01 EDT (2026-09-29) — a roughly 36-minute gap. At the moment of interruption, the copy-out-first
   replay script (`scratchpad/c4-T2-replay/replay.sh`) had already completed successfully in the
   foreground (both instruments' output, including the final `T2.lean` digest line, is visible in the
   transcript immediately before the interruption notice) — so no work was lost this time, only the
   writing of this RETURN.md was delayed. Per the resumption instruction, PIDs 13980 and 41624 were
   re-checked by `ps -p <PID>` (not a process listing) and confirmed gone before writing this return;
   no new background job is left running (`ps -p` on both, and no other job was started this session).
4. **Controller fact used.** CF-C4-S3-1 (a controller-supplied fact, treated as a fact, not evidence
   of this route's own claims): a prebuilt cache existed at `scratchpad/c4-base/LeanProject/.lake/build`,
   built from bytes identical to `sources/c4-base` (verified independently in this route before
   trusting it — see digest list above — all five of my own project's carried `.lean` files matched
   `sources/c4-base/SOURCE-DIGESTS.json` byte for byte before the cache was copied in). Copied via
   `cp -R scratchpad/c4-base/LeanProject/.lake/build scratchpad/c4-T2/LeanProject/.lake/build` (the
   prior, empty `.lake/build` was removed first); the `.lake/packages` symlink was preserved
   separately and verified intact afterward. This cut the base rebuild from approximately 9 minutes
   (measured directly: 8:54.59 wall-clock via `lake env lean` on `Main.lean` alone) to under 8 seconds
   for every subsequent `lake build` in this route.

### Read-boundary disclosures

None beyond the dispatch's own authorized list. All `sources/` reads were preceded by a digest
verification against the relevant `SOURCE-DIGESTS.json` (listed above). No `find`, `grep -r`, or
`ls -R` was run rooted above the granted directories; every `grep`/`ls` was targeted at a specific
file or a single named subdirectory already known from the manifests or the common brief's explicit
list. One `pgrep -f` was run early in this route to recover a background build's PID after starting
it with `nohup ... &` (a rule violation per common-brief instruction 13, which reserves PID discovery
to `ps -p`/`kill -0` on a PID the seat already started by other means) — disclosed here; it was not
repeated, and no subsequent PID query used anything but `ps -p <PID>` on PIDs already known from a
tool's own reported PID or from that one `pgrep` call.

### Other process disclosures

- Every Python invocation in this route used `python3 -B`, standard library only.
- The one long computation (the initial cold build of `Main.lean`) was run once in the true
  foreground (`lake env lean -R . -o ... -i ... LeanProof/Main.lean`, no backgrounding), completing
  in 8 minutes 54 seconds; two earlier attempts to background it (`nohup ... &`, then the harness's
  `run_in_background`) each died silently across a host interruption before producing output and are
  disclosed above rather than treated as evidence of anything.
- No `sorry` TACTIC, `sorryAx`, sorry-admitting tactic (`admit`; `native_decide` was not used
  either), or reserved terminal name (`cb8_topRank_eligible_and_weightedHall`) occurs anywhere in
  `scratchpad/c4-T2/LeanProject/LeanProof/T2.lean` (checked by direct `grep` on that single file;
  the literal word "sorry" occurs exactly once, in this file's own header comment, in the phrase
  "`sorry` bodies" describing why `Statements.lean` is not imported — not a proof-tactic use, and
  confirmed absent from the build's warning list, which would otherwise show
  `declaration uses 'sorry'` per declaration as it does for `Statements.lean`'s 20 real sorries).
- No sealed member under `sources/` was written to. The only writes this route made are under
  `scratchpad/c4-T2/`, `scratchpad/c4-T2-replay/`, and this `RETURN.md`.
