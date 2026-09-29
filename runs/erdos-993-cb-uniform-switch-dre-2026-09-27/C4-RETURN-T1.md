# RETURN — Cycle 4, Stage 3, Route T1

**Route ID:** `C4-T-01`
**Mechanism token:** `E1-UPCOVER-COUNTS-VIA-CLONE-CORRESPONDENCE`
**Orientation:** T (prove)
**Load-bearing obligation (`control/C4-ALLOCATION.md`):** the four N1 declarations exactly as
frozen — `cbOpenChokeCount_le`, `cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses`,
`cb8_nonChokeInsert_weight` — proved through the clone correspondence (r-free independent set
as a choice per choke block).

**Model disclosure (two parts):** chartered sonnet/high; transport-resolved model sonnet
(explicit parameter); runtime-reported model id: `claude-sonnet-5`.

## Boot acknowledgment

Operating within VerityOS. RESTRICTED BOOT: read exactly `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file
outside the run root (the controller booted for the run; the startup protocol's own task-type
map, memory, conversations, modules, skills, logs and decisions were not loaded by this seat).

## Process disclosures — TWO HOST INTERRUPTIONS (resumed twice)

1. **Interruption 1.** Controller session interrupted at approx. 08:55 EDT, before this route's
   first `RETURN.md` draft. On resumption: `scratchpad/c4-T1/LeanProject` and
   `scratchpad/c4-T1-replay/n1_verify.py` (partially fixed) survived; `scratchpad/c4-T1/build-sanity.log`
   was 0 bytes and PID 42935 (a `nohup lake build LeanProof &` this route started) no longer
   existed — confirmed via `ps -p 42935` (literal PID only; no full process listing run).
   Restarted the sanity build as PID 14918 (`nohup … & disown`) and re-ran the Python instrument
   (foreground, after fixing a genuine modeling bug the two-instrument check itself had caught —
   see `## Step-by-step derivation`).
2. **Interruption 2.** Controller session ended at approx. 10:02 EDT, resumed 22:46 EDT (per the
   coordinator's resumption message; ~12 h wall-clock gap, not attributable to this route's own
   compute). On resumption: PID 14918 no longer existed (`ps -p 14918`, literal PID only);
   `build-sanity.log` still 0 bytes; `scratchpad/c4-T1-replay/n1_verify.py` held the
   performance-fixed version (sha256 `fe41c70c…`) but `n1_verify_results.json` did not exist yet
   (the run had not completed before interruption 1's own recovery attempt was itself cut off).
   Re-ran the Python instrument to completion (2.0 s; see `## Instrument sides`). Re-attempted the
   Lean sanity build in the foreground per the coordinator's explicit instruction; it did not
   finish inside a 590 s foreground window and was auto-backgrounded by the tool harness as task
   `bjmrno5am` with **no literal PID exposed** (this is a harness-level background task, not a
   shell `&` job — the "kill by literal PID only" rule's shell-level PIDs from this route,
   42935 and 14918, were both already confirmed dead by `ps -p`; task `bjmrno5am` was stopped
   through the harness's own task-control tool, not a shell kill, since no PID was ever available
   for it). Three earlier Python-instrument background tasks (`boeia987p`, `buw5niydy`,
   `bwnkjz1ii`) were also targeted for a stop at cleanup; the tool reported them already gone
   (not found) — consistent with the foreground reruns having superseded them.
3. **Mid-course controller fact CF-C4-S3-1 (R31-N-26).** The controller supplied, in-band, the
   exact path of a pre-built cache: `scratchpad/c4-base/LeanProject/.lake/build`, and the
   condition for reusing it (this route's `LeanProof/{Main,ChokeState,E1FlowConstruction,C3LA1}.lean`
   byte-identical to `sources/c4-base`). Verified the four files' SHA-256 against
   `sources/c4-base/LeanProject/LeanProof/*.lean` — all four matched — then copied the cache
   (`cp -R`) into `scratchpad/c4-T1/LeanProject/.lake/build`, keeping the pre-existing packages
   symlink. `lake build LeanProof` then replayed the base in ~6–12 s per rebuild (matching the
   controller's ~10 s estimate) instead of a cold multi-file elaboration that two interruptions
   had already prevented from ever finishing. This is the reason a real build log exists at all
   in this return; disclosed per the controller's instruction.
4. Finished and confirmed no background job remains: `ps -p 42935`, `ps -p 14918` both empty;
   `jobs` empty; the harness task `bjmrno5am` stopped (confirmed `[killed]` in its output); no
   full process listing (`ps aux`/`pgrep`) was ever run.

## Read-boundary disclosures

1. During interruption-1 recovery, ran `ls -la scratchpad/` (one level, top of the run root) to
   locate this route's own surviving scratch directories. `scratchpad/` is named in
   `C4-WORKER-COMMON-BRIEF.md` as above this route's grant for *search* tools. The command was
   non-recursive (`ls`, not `find`/`ls -R`) and its full output was piped through `grep -i
   c4-T1` for display, but the underlying `ls` did enumerate all top-level `scratchpad/` entry
   names (sibling seats' directory names would have been visible to the command even though only
   `c4-T1*` lines were shown). No sibling file *contents* were read. Disclosed as a read-boundary
   item per the brief's rule ("a search that does occur is a read-boundary disclosure").
2. `scratchpad/c4-base/LeanProject/.lake/build` (also under `scratchpad/`) was read and copied
   only after the controller named that exact path in-band (CF-C4-S3-1); this is treated as an
   authorized exception carried by that message, not a self-initiated search, and is recorded
   here for completeness rather than as a violation.
3. No sibling return, critic, or adjudicator work was read. No file outside
   `control/`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `cycles/cycle-4/stage2/`,
   `sources/`, the two disclosed `scratchpad/` reads above, and this route's own
   `scratchpad/c4-T1/`, `scratchpad/c4-T1-replay/` was read.

## Seals and digests verified (copied from tool output; cite before use)

- **Stage 2 packet manifest seal** (`control/C4-STAGE2-PACKET-MANIFEST.json`): recomputed
  SHA-256 of the canonical JSON (the object with `seal_sha256` removed, `sort_keys=True`,
  separators `(",", ":")`, no trailing newline) =
  `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`, **matches** the file's own
  `seal_sha256` field exactly.
- **`control/C4-FROZEN-STATEMENTS.lean`**: SHA-256 `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1`
  — matches gate ruling 23's cited digest exactly (`shasum -a 256`, verified independently of the
  ruling text).
- **`control/C4-FROZEN-STATEMENTS.md`**: SHA-256 `6aa6dfe5971a187be2be41cc1e350db4beff187ca5b648cdb9aec2edc5eca54b`
  — matches gate ruling 23's cited companion digest exactly.
- **`sources/c4-base/SOURCE-DIGESTS.json`**: all 12 listed files (`lakefile.toml`,
  `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean`, `LeanProof/Main.lean`,
  `LeanProof/ChokeState.lean`, `LeanProof/E1FlowConstruction.lean`, `LeanProof/C3LA1.lean`,
  `LeanProof/Statements.lean`, `build-c3la1.log`, `build-root.log`, `axioms-base.log`)
  recomputed and matched — key ones: `LeanProof/Main.lean`
  `385af1bf529a6c8e9e136ce87472b9fd6cd51f24ec4976265dbbf7160d62ea3f` (2,418,051 bytes),
  `LeanProof/Statements.lean` `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1`
  (identical to the frozen `.lean` digest above, as expected — same file).
- **Mathlib pin** (`sources/mathlib-binding/PIN.json`): toolchain `leanprover/lean4:v4.32.2`,
  Mathlib rev `905b95818eb32af7874a58b427f50c1711a5e96c`; this route's
  `scratchpad/c4-T1/LeanProject/lean-toolchain` matches, and `.lake/packages` was bound by
  `mkdir -p LeanProject/.lake && ln -s /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages LeanProject/.lake/packages`
  (manual symlink; never copied; never `lake update`/`lake clean`).
- **This route's own edited `Statements.lean`**: SHA-256
  `9904581db188763ddfdbdb2d1fa20ccaa0bba960f8709cec8d43cda23aaa29e5`.
- **Build log** `scratchpad/c4-T1/build-t1-final.log`: SHA-256
  `33c6c8ac7292c9027b7761a533dc0e25cf1dfa8a4dd34769ef8f58d52d707113` — "Build completed
  successfully (8661 jobs)", 0 errors.
- **Axioms log** `scratchpad/c4-T1/axioms-t1-final.log`: SHA-256
  `68197ff8ff758bcb875e5c7ac1e847ab74dbd3143293d12a83e03356b1bd4f62`.
- **Python instrument** `scratchpad/c4-T1-replay/n1_verify.py`: SHA-256
  `fe41c70c4ef83828b0e26f2bb5f70ec08a5f7d8c3d1e519f930b1739b7659b56`. Result table (61,263 rows):
  SHA-256 `7f1945aac6e019a1ad2828964b0e13bdfdd0aaae0ca34ebb7ec9f428a534f6d8`.

## Registered claims touched (named before any computation, per SEMANTIC-CONTRACT §4)

None. The four N1 declarations are frozen Lean texts **internal to conjunct 4** (gate ruling
23) — they are not themselves entries of `sources/authority/CLAIM-IDENTITY.json`, and this route
neither confirms nor touches any registered `E993-*` key. Background registered keys this
route's *context* depends on without re-deriving them (cited, not re-proved): the criterion key
`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`
(`proved_informal`) and the favorability key of SEMANTIC-CONTRACT §2 (`proved_informal` modulo
Darroch/Newton) — neither is invoked by N1's proofs below (N1 is graph-generic, rank-free, and
uses no Darroch/Newton input at all).

## New claims proposed

None. This route proposes no `E993-R31-` key. Two route-internal (non-frozen, ungraded) helper
lemmas were added to discharge part of N1 (B3) — `cb_tagWitnesses_subset_root_or_choke` and
`cb8_activeWitness_unaffected_by_insert` — named as ordinary Lean declarations, not registered
claims; alias-check against the run-local registry is therefore not applicable (nothing is being
registered).

## IMPORT LIST (Python instrument; standard library only)

`itertools, random, hashlib, json` (see file header of `scratchpad/c4-T1-replay/n1_verify.py` for
the exact docstring statement of this list).

## Step-by-step derivation

All four objects concern an **r-free** (root-absent) subset `B`/`A` of `CB(8,m)`
(`cbRootFree`: `cbVertex m 0 ∉ X`), independent in `cbGraph m`. Every vertex of `CB(8,m)` is,
by exhaustive case split (carried entry 57 `cb_val_cases`), one of: `r` (label 0), `s` (1),
`v` (2), a choke `u_i` (`3+17i`), a support `b_ij` (`u_i+1+2j`), or a private leaf `c_ij`
(`u_i+2+2j`). `leafSet(CB(8,m)) = {v} ∪ {c_ij}` (carried entry 60,
`mem_leafSet_cbGraph_iff`, needs `hm : 0 < m`). `tagWitnesses` is carried entry 15
(`W_v := N(support(v)) ∖ {v}`); `activeWeight G F B := #{v ∈ F∩B : B∖{v} meets W_v}` is carried
entry 16 — **active means the witness is PRESENT in `B`**, not absent (this is where a wrong
reading costs the whole argument — see the "sides disagree" finding below). Carried entries 69/70
give `W_v = {r}` and `W_{c_ij} = {u_i}` exactly; entry 75 gives `N(u_i) = {r}∪{b_ij : j<8}`.

**Structural fact used by all four (not itself one of the four, but their common hinge):** for
an r-free independent `B` and a choke index `i`, exactly one of two regimes holds, by
independence alone:
- `u_i ∈ B` (contributes 1 to `q = cbOpenChokeCount m B`): then no `b_ij` can be in `B`
  (`u_i ~ b_ij`, carried entry `cbGraph_adj_choke_support`), but `c_ij` **can** be in `B`
  (`u_i` and `c_ij` are not adjacent — distance 2 through `b_ij`) and, if present, its witness
  `u_i` **is** in `B`, so `c_ij` **is active** (contributes to `w`). Each of the 8 legs at this
  choke independently contributes 0 or 1 to `w`.
- `u_i ∉ B`: each leg has `b_ij`, `c_ij`, or neither (never both — `b_ij ~ c_ij`, entry
  `cbGraph_adj_support_leaf`); if `c_ij` is present here its witness `u_i` is absent, so it is
  **not** active — it falls in the residual bucket `ℓ` together with any present `b_ij`. Each
  leg contributes 0 or 1 to `ℓ`.
- The arm: `s`/`v` are adjacent (`cbGraph_adj_s_v`), so at most one is present; `v`'s only
  witness is `r` (`W_v={r}`), which is **never** in `B` (r-freeness), so `v` is **never active**
  in the r-free network (activity through `v` is a sector-only phenomenon, SEMANTIC-CONTRACT §2 —
  it does not apply here). Both `s` and `v` fall in `ℓ`.

This is exactly SR-C3-3's (B1)/(B2) text, and it is where `hr : cbVertex m 0 ∉ B` enters (it is
what makes `v` permanently non-active) and where `hm : 0 < m` enters (there must be at least one
choke for `cbOpenChokeCount`/`leafSet` to have their stated shape).

- **`cbOpenChokeCount_le`.** `cbOpenChokeCount m X := ((range m).filter (u_i ∈ X)).card`
  (`E1FlowConstruction.lean`). Pure `Finset` bookkeeping, no graph fact needed:
  `(s.filter p).card ≤ s.card = m`. No ℕ subtraction. — **compiled sorry-free** (below).
- **`cb8_rFree_deletionClasses` (B1).** The partition identity (third conjunct,
  `q+w+ℓ=|B|`) is pure filter algebra (`choke`, `¬choke∧active`, `¬choke∧¬active` partition `B`
  three ways, mutually exclusive because chokes are never leaves). The bound `w ≤ 8q` needs the
  injection {active leaves in `B`} ↪ {(i,j) : `u_i`-present, `j<8`} (an active `c_ij` forces its
  choke present, by the regime above, and distinct `c_ij` have distinct `(i,j)`), giving
  `card ≤ 8q`. The bound `ℓ+8q ≤ 8m+1` needs the complementary injection {`ℓ`-vertices} ↪
  {(arm-slot: 1) ∪ (absent-choke, leg) : `(m-q)` absent chokes × 8 legs}, of size `1+8(m-q)`,
  rewritten subtraction-free as stated (`ℓ + 8q ≤ 8m+1`). Every subtraction in the *frozen
  statement text* is already written subtraction-free (per the drafter's own guards) — none is
  introduced by this derivation.
- **`cb8_rFree_insertionClasses` (B2).** For an r-free independent `A` with `q,w,ℓ` as above,
  admissible non-root insertions `z` split into: Boolean (an absent `c_ij` at a **present**
  choke — becomes active immediately, since its witness `u_i` is already present) — there are
  exactly `8q − w` of these (8 legs per present choke, `w` already active), written
  subtraction-free as `(\text{Boolean count}) + w = 8q`; ternary (an empty leg at an **absent**
  choke, 2 choices `b_ij`/`c_ij`, or the empty arm, 2 choices `s`/`v`) — `2(8(m-q)+1-ℓ)` of
  these, written subtraction-free as the frozen text states; and choke insertions (`u_i` at an
  absent choke with **no** `b_ij` present there — `b_ij` would forbid it) — the residual class,
  value 0 under `cb8E1Val`, not counted by either filter. `hr` again enters through `v`/`s`
  never being "active insertions".
- **`cb8_nonChokeInsert_weight` (B3).** `z` non-choke, `z ≠ r`, `z ∉ A`. `q` is unchanged
  by the carried, compiled lemma `cbOpenChokeCount_insert_of_not_choke` (its hypothesis is
  exactly `hz`). For `w`: **every** leaf's witness set is `{r}` or a singleton choke (entries
  69/70, exhaustively — `cb_tagWitnesses_subset_root_or_choke` below); `z` is neither (`hzr`,
  `hz`), so `z` is never a witness of any *other* leaf `v'` — inserting `z` cannot flip `v'`'s
  activity for `v' ≠ z` (`cb8_activeWitness_unaffected_by_insert` below, compiled). Only `z`'s
  own activity (if `z ∈ leafSet`) can change the count, by exactly the stated indicator.

**A genuine finding, corrected in-route (documented so it is not silently absorbed):** the
first version of the Python instrument's *structural* generator encoded `v`-present as "active"
(mirroring the *sector* semantics of SEMANTIC-CONTRACT §2 by mistake) and was refuted immediately
by its own graph-generic side (`sides_agree: False` at the very first non-trivial exhaustive
`m=1` trial) — a direct instance of this run's own R-11/two-instrument discipline doing its job.
The fix (arm vertices are never active in the r-free/non-sector network, since `v`'s only
witness `r` is always absent by r-freeness) is the same fact used above to justify `s`/`v` both
falling in `ℓ`.

## Lean: what actually compiles (this route's real deliverable)

Base: `scratchpad/c4-T1/LeanProject`, byte-identical to `sources/c4-base/` (digests above),
Mathlib bound by manual symlink (never copied), built from the controller-supplied cache
(disclosed above) with `lake build LeanProof` — **0 errors, "Build completed successfully (8661
jobs)"** (`scratchpad/c4-T1/build-t1-final.log`).

1. **`E993Transport.cbOpenChokeCount_le`** — the frozen N1 companion, **compiled sorry-free**,
   exactly as frozen (byte-for-byte statement, only the body was written):
   ```lean
   theorem cbOpenChokeCount_le (m : ℕ) (X : Finset (Fin (17 * m + 3))) :
       cbOpenChokeCount m X ≤ m := by
     unfold cbOpenChokeCount
     calc ((Finset.range m).filter (fun i => cbVertex m (3 + 17 * i) ∈ X)).card
         ≤ (Finset.range m).card := Finset.card_filter_le _ _
       _ = m := Finset.card_range m
   ```
   `#print axioms E993Transport.cbOpenChokeCount_le` → `[propext, Classical.choice, Quot.sound]`
   only (matches gate ruling 25's required axiom set exactly).
2. **`E993Transport.cb_tagWitnesses_subset_root_or_choke`** (route-internal, NOT frozen text,
   compiled sorry-free) and **`E993Transport.cb8_activeWitness_unaffected_by_insert`**
   (route-internal, NOT frozen text, compiled sorry-free) — the two lemmas that carry the entire
   mathematical weight of B3's second conjunct (see derivation above); both on the same axiom
   set. Full text is in `scratchpad/c4-T1/LeanProject/LeanProof/Statements.lean` (lines 79–116 of
   the edited file).
3. **`cb8_nonChokeInsert_weight` (B3) itself — NOT closed.** The first conjunct (`q` unchanged)
   is immediate from the carried lemma. The second conjunct's *assembly* (turning the two
   compiled helper facts into the exact `Finset.filter`/`Finset.card_insert` calculation the
   frozen statement's `+ (if … then 1 else 0)` shape demands) hit a genuine, identified
   decidable-instance mismatch: the frozen statement's `if` was elaborated under this file's
   `open Classical in` at the *declaration* site, while a fresh `by_cases`/`if_pos`/`if_neg` step
   inside a `classical`-tactic block synthesizes its own instance for a syntactically identical
   but not obviously *defeq-transparent-to-`omega`* proposition; three iterations narrowed this
   down (documented via the actual compiler errors, not guessed) but did not close it inside this
   route's remaining time. Left as `sorry`, with the two load-bearing sub-lemmas compiled and
   ready for a `split_ifs`-based (rather than manual `if_pos`/`have`-based) assembly — see
   `## Remaining obligation`.
4. **`cb8_rFree_deletionClasses` (B1) and `cb8_rFree_insertionClasses` (B2) — NOT attempted in
   Lean this route** (both remain the frozen `sorry`). The derivation above is complete and
   precise enough to transcribe, but the transcription itself (the two injection arguments as
   `Finset.card_le_card_of_injOn` applications, plus the partition identity as two applications
   of a filter/card-splitting lemma) is comparable in size to carried entries 57–76 and was not
   reached before this route's return had to close, given the two interruptions above.

## Independent Python instrument (bounded computational evidence, not a proof)

`scratchpad/c4-T1-replay/n1_verify.py` (IMPORT LIST above), replay command (copy-out-first,
never `/tmp`):
```
cp <run root>/scratchpad/c4-T1-replay/n1_verify.py <run root>/scratchpad/c4-T1-replay/n1_verify.py
cd <run root>/scratchpad/c4-T1-replay && python3 -B n1_verify.py
```
Two independent sides per row: **Side A** ("structural") builds an r-free independent set by
the per-choke/per-leg/arm local construction in the derivation above (present-choke legs ∈
{empty, c}; absent-choke legs ∈ {empty, b, c}; arm ∈ {empty, s, v}), tracking `q, w, ℓ` from its
own construction choices; **Side B** ("graph-generic") recomputes `q, w, ℓ` from the raw vertex
set alone using only the edge relation and `tagWitnesses`, with no reference to how the set was
built. Every Side-A set is also independently confirmed independent by an all-pairs adjacency
scan (never assumed). `m=1`: **exhaustive** — every present/absent × leg-state × arm-state
combination (20,451 sets total, matching the frozen-statement drafter's own mutation-control M2
count of 20,451 exactly, an independent cross-check of the combinatorial model against theirs).
`m=2,107,158`: 40–60 deterministically seeded (`random.Random(20260928)`, no wall-clock) random
structural draws each. B2 is checked by **brute-force enumeration of every admissible insertion**
against the raw graph (not sampled). B3 is checked on one random admissible non-choke insertion
per trial. **61,263 rows, 0 failures**, result table SHA-256
`7f1945aac6e019a1ad2828964b0e13bdfdd0aaae0ca34ebb7ec9f428a534f6d8` (`n1_verify_results.json`,
scratch, not a claim of its own). Runtime 2.0 s (`python3 -B`, foreground).

## Instrument sides

Every numeric claim in this return is one of: (a) the Python two-instrument table above (sides
named in the paragraph immediately above; no rank-indexed flow quantity, hence **no `Δ_p`
difference index applies** — these are graph-generic combinatorial-identity checks, not (WID)/
(HALL) network aggregates); (b) the Lean build/axiom logs (single deterministic tool output,
digest-verified, not a "two independent sides" numeric claim in the (WID) sense — `none: no
numeric flow claim`); (c) the digest-verification table above (each digest recomputed by this
route's own `shasum`/`hashlib.sha256`, compared against the cited record's own printed digest —
two sides are "this route's recomputation" vs. "the record's own stored value").

## Grades

- `cbOpenChokeCount_le`: **compiled** (sorry-free, axiom-clean; ungraded pending a governed
  award per SOLUTION-CONTRACT §4 — "a compiled scratch declaration has no grade until its
  governed award closes").
- `cb_tagWitnesses_subset_root_or_choke`, `cb8_activeWitness_unaffected_by_insert`: **compiled**
  scratch, route-internal, ungraded (not frozen text; support B3 only).
- `cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses`, `cb8_nonChokeInsert_weight`: the
  underlying mathematical content is a complete, precise **informal proof** (see derivation),
  corroborated by **bounded computation** (61,263-row exhaustive+random check, 0 failures); the
  Lean texts remain `sorry`. Per SOLUTION-CONTRACT §4, a composition's grade is its weakest
  input's — these three declarations are NOT `formally_verified`, NOT `proved_informal` as a
  registered claim (none is registered), and are reported here as informally-derived +
  computationally-bounded, nothing stronger.
- Attained horizon: N1 as a gate node (all four declarations) is **not** closed; 1 of 4 frozen
  declarations is closed; the mathematical case for the remaining 3 is complete on paper and in
  an independent computational instrument, not yet in Lean.

## Fresh-row / class-row use

No `(HALL)`/`(WID)` numeric row claim is made by this route (N1 is rank-free and graph-generic,
per its own doc comments — "Any rank"). The Python instrument spot-checks `m = 107, 158` (both
named fresh/class rows by gate ruling 27) alongside `m=1` (exhaustive) and `m=2`; it does not
touch `m=110,113,161,164` (those belong to other routes' sector/composition obligations).

## Gate lines (ruling 32)

- `COND4_formal`: not discharged (conjunct 4 remains open on this route's evidence).
- `E1_formal`: not established (N2, which N1 feeds, was not attempted this route).
- `TERMINAL_integration`: not reached.
- `cut_candidate`: none found; no counterexample to any N1 statement was found (all 61,263
  instrument rows passed after the one construction-side bug above was found and fixed *before*
  being reported as a result, not after).
- `FROZEN_NODES_CLOSED`: **none** — N1 as the gate's unit requires all four declarations; only
  1 of 4 (`cbOpenChokeCount_le`) is compiled sorry-free. (Recorded here in prose, not on the
  gate line, since the line's contract is node-level: a controller/synthesis call on whether
  the companion alone ever counts as a partial credit is outside this route's authority.)

**`headline_resolved: no`** (this route does not, and could not on its own, resolve the Tier 1
headline; consistent with common-brief item 6 — "neither is a route's product").

**Route verdict: `compiled`** — real compiled Lean artifacts exist (build log + axioms log,
digests above), backing exactly the "compiled" verdict's evidentiary requirement (ruling 11);
this is not "bounded_evidence" (which would undersell the compiled Lean content) and it is
certainly not `proved`/`proved_conditional` (three of the four frozen declarations remain
`sorry`) or `refuted` (nothing was refuted) or `blocked` (real progress was made despite the two
interruptions).

## Remaining obligation (successor inheritance)

1. **Finish B3.** The two load-bearing lemmas (`cb_tagWitnesses_subset_root_or_choke`,
   `cb8_activeWitness_unaffected_by_insert`) are compiled and ready to consume. The remaining
   work is a `Finset.filter`/`Finset.card_insert` assembly matching the frozen statement's
   `if … then 1 else 0` shape; use `split_ifs` against the goal's *own* `if`-term (not a
   separately-elaborated `have : (if P then 1 else 0) = k`) to avoid the decidable-instance
   mismatch this route hit three times (documented via real compiler errors in this route's
   scratch history, not guessed at). Estimate: well within one more route's Stage 3 window,
   given the hinge lemmas already compile.
2. **B1 and B2 in Lean.** The informal derivation above is complete and names the exact two
   injection arguments needed (`Finset.card_le_card_of_injOn`-shaped) plus the three-way
   partition identity (a filter/card-splitting fact). Comparable in size to carried entries
   57–76; not attempted this route.
3. **Environment note for whoever picks this up.** A cold `lake build LeanProof` of this base
   (2.4 MB `Main.lean`, no cache) does not reliably finish inside a single tool-call foreground
   window in this environment and was the proximate cause of most of this route's lost time
   across two interruptions — always check for a controller-supplied `.lake/build` cache
   (verify the four `LeanProof/*.lean` digests against `sources/c4-base` first) before attempting
   a cold build.
4. Ruling 30 dual ownership: U1 owns the same four N1 declarations via a different
   (per-vertex-adjacency) decomposition; this route's compiled companion and its two internal
   helper lemmas are available for consumption or comparison but are not claimed to be U1's
   decomposition.
