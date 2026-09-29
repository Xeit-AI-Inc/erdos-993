# RETURN — r31 Cycle 4, seat U3

Route ID: `C4-U-03`. Mechanism token: `HALL-TO-FLOW-INTERFACE-AND-TERMINAL-STITCH`. Orientation: U (formal / structural).
Frozen nodes owned: N8; the stitching project.

Model disclosure: chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5.

## Boot acknowledgment

Restricted boot performed exactly as required: read `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file outside this
run root. No other VerityOS file was read this session (no memory, conversations, modules, skills,
logs or decisions files outside `verity.md` / `identity/startup-protocol.md`).

DISPATCH-U3.md verified: SHA-256 `dde416dd80e1313a7beb84fc84faab140d05c96f5a0b6febe1b84d54d3b2163e`, matched the digest
supplied by the coordinator before any other action.

## Interruption and resumption disclosure

The controller session was interrupted at approximately 08:55 EDT, 2026-09-28, mid-route (after this
route's scratch project was assembled and Statements.lean's N8 body had already been written, and
after a first `lake build LeanProof` had been launched via `nohup ... & disown` — a manual
shell-level backgrounding that did **not** survive the interruption cleanly).

On resumption (coordinator message, ~09:50 EDT): checked the literal PID of that first attempt,
`44463` — `ps -p 44463` returned no process (it no longer existed; consistent with the coordinator's
warning that a pre-interruption PID may not exist any more). Its log file,
`scratchpad/c4-U3/build-u3-stitch.log`, was 0 bytes; `.lake/build/` contained only a `config/`
directory and a single `Main.setup.json` stub — i.e. the first attempt had barely started before the
interruption and produced no usable output. No stray process was found or killed (none existed to
kill); this is recorded as a disclosure, not a violation (no full process listing was run — only
`ps -p 44463` on the one literal PID this route itself had started).

Before resuming, this route re-verified that its scratch files
(`scratchpad/c4-U3/LeanProject/LeanProof/{Statements.lean,U3Interface.lean,U3Stitch.lean}`) were
intact and unchanged from what it had written pre-interruption (byte counts and a `grep -c sorry`
check against the expected 19-of-20 pattern below). Finding them intact, it restarted the build —
this time through the harness's own tracked background-command mechanism (`run_in_background`)
rather than a detached shell `nohup`/`disown`, specifically so a second interruption would leave a
recoverable, harness-tracked job instead of an orphaned one. Read-boundary: no VerityOS file outside
the two authorized boot files was read at any point, before or after the interruption.

**Second interruption.** That harness-tracked build's log (`scratchpad/c4-U3/build-u3-stitch.log`)
was still 0 bytes when the controller session ended at approximately 10:02 EDT, 2026-09-28, and the
session did not resume until approximately 22:46 EDT. On resumption the coordinator flagged this
directly. Checked: the scratch project files were still intact (unchanged byte sizes; the same
19-of-20 `sorry` count; the `#print axioms` lines still present at the end of `U3Stitch.lean`); the
`.lake/build/` directory still contained only the `ir/LeanProof/Main.setup.json` stub from the very
first (08:55) attempt, i.e. the second, harness-tracked build had also not produced or flushed any
compiled output or log content across the ~12.7-hour gap — consistent with a long-running,
single-threaded elaboration of an ~2.4 MB / ~12,700-line carried file whose `stdout`/`stderr` were
redirected to a file and only flush in full at completion or on error, compounded by two host
interruptions before that completion could occur. No literal PID from either the first (`44463`,
already confirmed gone) or second (harness task id, not an OS PID this route can `ps -p`) attempt was
queried or killed; no full process listing was run at any point. Per the coordinator's explicit
instruction, this route reran `lake build LeanProof` a THIRD time, synchronously, in the foreground
(`time lake build LeanProof > .../build-u3-stitch.log 2>&1`, no `&`, no `nohup`, no `disown`) so the
log is this route's own deliverable evidence rather than an unconfirmed background claim. That
foreground invocation exceeded the tool's 600s per-call timeout and was itself moved to a
harness-tracked background job (id `bmh6f5ubu`) by the harness, not by this route's own choice.

**Controller fact CF-C4-S3-1 (R31-N-26) and cache reuse.** The coordinator supplied a fact (never
evidence, per the DRE convention): the slowness is cold elaboration of the 2.4 MB carried
`Main.lean`, and a controller-built cache exists at
`scratchpad/c4-base/LeanProject/.lake/build`, built from bytes identical to `sources/c4-base`. Before
touching anything this route verified that precondition itself rather than taking the fact on trust:
`scratchpad/c4-base/LeanProject/LeanProof/{Main,ChokeState,E1FlowConstruction,C3LA1}.lean` were
hashed and found byte-identical (same four sha256 values already cited in `## Fidelity note` and the
replay script: `385af1bf…`, `64a101ef…`, `d26e702b…`, `49b227d3…`) to `sources/c4-base`'s own copies —
and this route's own four carried files in `scratchpad/c4-U3/LeanProject/LeanProof/` were already
confirmed byte-identical to those same `sources/c4-base` files earlier in this RETURN (`## Instrument
sides`, replay script output). The precondition for safe reuse therefore held on both sides before
any copy was made. Sequence: (1) stopped the still-running background job by its harness-issued
job id, `TaskStop(task_id="bmh6f5ubu")` — no OS-level PID was available for that job (it was created
by the harness, not by a raw shell backgrounding this route issued), so no `ps -p`/`kill` on a literal
PID was needed or attempted, and no full process listing was run; (2) `rm -rf
scratchpad/c4-U3/LeanProject/.lake/build` (only the `build/` subdirectory; the `.lake/packages`
manual symlink to the shared Mathlib project was untouched) then `cp -R
scratchpad/c4-base/LeanProject/.lake/build scratchpad/c4-U3/LeanProject/.lake/build` (this route's own
cache only, never `--no-cache`, never another SEAT's cache — `c4-base` is the controller-built shared
base, not another route's scratch); (3) reran `lake build LeanProof` a fourth time, synchronously, in
the foreground, with no backgrounding.

That foreground build completed in 35.47s (`time`: 14.32s user, 12.98s system, 76% cpu), exit code 0.
It replayed `Main`, `ChokeState`, `E1FlowConstruction` and `C3LA1` from the copied cache (only linter
warnings, no errors) and freshly elaborated the three files this route changed or added
(`U3Interface.lean` 18s, `Statements.lean` 4.9s, `U3Stitch.lean` 3.9s) plus the root `LeanProof` link
step (4.6s) — 8663 jobs total, `Build completed successfully (8663 jobs)`. Full log:
`scratchpad/c4-U3/build-u3-stitch.log` (sha256 `c12d43828cf8bb1ed30c5cb20461f615f2a0623442c9dadc315d3d2f749c1248`).
Axiom trace extracted to `scratchpad/c4-U3/axioms-u3-stitch.log` (sha256
`f21a0f566193e10e9d60dfb35234e97a653483f9ef35d2b79fdfea0738cb928b`) — see
`## Lean build and axiom report` for the literal two lines and their reading.

## Stage 2 seal

`control/C4-STAGE2-PACKET-MANIFEST.json`: recomputed SHA-256 over the canonical JSON of the
manifest with `seal_sha256` removed (`sort_keys=True`, `separators=(",", ":")`, no trailing
newline) = `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`, matching both the
manifest's own `seal_sha256` field and the value cited in DISPATCH-U3.md. `file_count` 6084,
`files` list length 6084 (consistent). Replay: `scratchpad/c4-U3-replay/verify_digests.py`, function
`recompute_manifest_seal`.

Every source digest this route cites was independently reverified against its owning
`SOURCE-DIGESTS.json` (top-level `sources/SOURCE-DIGESTS.json` for r30/c2 sources,
`sources/c4-base/SOURCE-DIGESTS.json` for the Cycle 4 base) and against gate ruling 23's two
cited digests for `control/C4-FROZEN-STATEMENTS.{lean,md}`; see `## Instrument sides` and the
replay script. All matched; 0 mismatches.

## Route object and where each hypothesis enters

**Object (allocation, C4-ALLOCATION.md route U3):** close N8 (`E993Transport.cb8_conjunct4_of_flowBundle`)
sorry-free on the Cycle 4 base, then build a stitching project — the SOLUTION-CONTRACT §2 terminal
body under a non-reserved name — from C1-LA2's `cb8_topRank_of_descent_and_flow`, C2-LA1's terminal,
and N8 ∘ N7, with every still-open frozen N-node it uses imported as a `sorry`-bodied frozen
statement, so its residual `sorry` set is exactly the open frozen nodes.

**Step 1 (N8).** N8's frozen statement (`control/C4-FROZEN-STATEMENTS.lean` lines 339-357;
`control/C4-FROZEN-STATEMENTS.md` §N8) takes one hypothesis `hbundle`: after zeta-reducing its
`let p := (16*m+4)/3; let F := favorableLeaves (cbGraph m) p; let g := fun B A => cb8E1Arc m p F B A
+ cb8GSec m B A`, `hbundle` is exactly the conjunction (0 ≤ g) ∧ (¬transportRel → g = 0) ∧
(Out ≥ activeWeight on layer p+1) ∧ (In ≤ activeWeight on layer p). This is byte-for-byte the
hypothesis tuple of the GENERIC (non-CB-specific) lemma `exists_saturatingFlow_of_ratFlow_bound`
carried into `LeanProof/U3Interface.lean` (see Step 2). The hypothesis enters exactly once, by
`obtain ⟨h1,h2,h3,h4⟩ := hbundle` then applying the generic lemma at
`G := cbGraph m`, `F := favorableLeaves (cbGraph m) p`, `p := (16*m+4)/3`,
`g := fun B A => cb8E1Arc m p F B A + cb8GSec m B A`. No ℕ subtraction, no cast, and no
Darroch/Newton input occurs in this step (it is pure Finset/order algebra over ℚ and a Hall's-theorem
application already proved generically). File: `scratchpad/c4-U3/LeanProject/LeanProof/Statements.lean`
(one theorem body filled; every other declaration, and the surrounding text, unchanged from the
frozen file except one added `import LeanProof.U3Interface` line — disclosed below, fidelity note).

**Step 2 (the carried interface).** `LeanProof/U3Interface.lean` (NEW scratch file, not a frozen
node) carries, as DRAFT TEXT:
  - `card_sigma_fiber_filter` and `exists_saturatingFlow_of_weightedHall`, copied byte-identically
    from r30's FORMALLY VERIFIED award `lean-2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate`,
    Snippets 0030 (sha256 `e8c6b0d1…83fe`) and 0031 (sha256 `ec521065…a2c2`) — entries 30-31 named
    by N8's own docstring and by ruling 24(3). This half's grade is receipt-bound to that award; the
    carry itself proves nothing new.
  - `weightedHall_of_ratFlow_bound` and `exists_saturatingFlow_of_ratFlow_bound`, re-authored as
    DRAFT TEXT from r31 Cycle 2 U2's own (ungoverned) scratch, Part A of
    `sources/c2-stage7-sources/U2/LeanProject/LeanProof/Main.lean` lines 2593-2669 (sha256
    `a03e15f3…81d2c`) — ruling 24(3)'s single permitted interface copy. This half is a route-authored
    draft carry with no grade of its own (SOLUTION-CONTRACT §4: "a compiled scratch declaration has
    no grade until its governed award closes").

**Step 3 (the stitching project).** `LeanProof/U3Stitch.lean` (NEW scratch file; NOT the reserved
name `cb8_topRank_eligible_and_weightedHall`, never declared here): a new theorem
`cb8_topRank_stitch_scratch_c4u3 (m) (hm : 107 ≤ m) (hres : m % 3 = 2)` returning SOLUTION-CONTRACT
§2's four-conjunct terminal shape verbatim. Its hypotheses enter in this order:
  1. `h0m : 0 < m` — from `hm` by `omega` (ℕ order fact, no subtraction).
  2. N7's conclusion is obtained by applying `cb8_flowBundle_of_arcSpecs m hm hres` to six terms:
     N2's `cb8E1Arc_spec_topRank m hm hres`; N3's `cb8GSec_nonneg_and_support m hm hres` and
     `cb8GSec_out_ge_one m hm hres`; N4's `cb8GSec_in_le_one m hm hres` and `cb8GSec_zero_classes m`;
     N5's `cb8GSec_switchImage_inflow m`; N6's `cb8_activeWeight_leafSet_eq m h0m`. Every one of
     these six is cited AS THE FROZEN STATEMENT (still `sorry`-bodied in this scratch's
     `Statements.lean`, exactly as in the base) — this route does not prove N2-N7; it imports them
     by name, term-for-term matching their frozen signatures.
  3. N7's conclusion is fed to N8 (`cb8_conjunct4_of_flowBundle m hN7`, now sorry-free per Step 1),
     giving `hH : ∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) p*) p* f`.
  4. `hH` is fed to `AdjU.cb8_topRank_of_flow m hm hres hH` (already in the base, sorry-free,
     `sources/c4-base/LeanProject/LeanProof/Main.lean` lines 12244-12265), which composes it with
     `cb8_topRank_of_descent_and_flow` (C1-LA2, line 1690) and `AdjU.cb8_crossingIndex_add_two_le`
     (C2-LA1, line 12224) to close all four conjuncts. Consequence, by construction: the kernel's
     `#print axioms` on `cb8_topRank_stitch_scratch_c4u3` reports `sorryAx` justified exactly by the
     open frozen nodes N2-N7 it imports (this route closes none of those); N8 contributes no
     `sorryAx` of its own. See `## Lean build and axiom report` below for the literal trace.

No ℕ subtraction, cast, or Darroch/Newton application occurs anywhere in this route's own new
proof text (Steps 1 and 3 are pure term application and one `omega`; Step 2's carried lemmas are
Finset/order algebra over ℚ, already proved generically by r30 and by Cycle 2 U2's own scratch).

## Fidelity note (frozen-text divergence, disclosed)

Ruling 23: "a route engineers a proof of the frozen text, byte for byte" — read as: the ENGINEERED
DECLARATION's name, signature and statement text are unchanged; this route's diff against
`sources/c4-base/LeanProject/LeanProof/Statements.lean` (sha256 `0fc723d7…39ede1`, gate ruling 23) is
exactly: (a) one added line, `import LeanProof.U3Interface`, at the top; (b) N8's `:= by sorry` body
replaced by the six-line proof of Step 1. Every other theorem's signature, docstring and `sorry` body
in `Statements.lean` is untouched, byte-identical to the frozen file. This divergence is necessary
because Lean requires an explicit import for a name defined in a different module to be in scope;
it is disclosed here rather than left silent, per obligation 10 (unmatched/undisclosed diffs are an
admission defect).

## Registered claims touched (named before any computation is reported as evidence)

- `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`
  (status in `control/CLAIM-IDENTITY.run-local.json`: `VERIFIED`, i.e. registered at `proved_informal`
  grade per the Cycle 4 gate's current-state check — this registry's coarse `VERIFIED` status is NOT
  a `formally_verified` grade claim; the two are kept separate throughout, per the r30 lesson "`verified`
  never `formally_verified`"). This route's stitched scratch theorem has the SAME statement shape but
  remains an ungraded compiled scratch declaration (open `sorryAx` via N2-N7); it does not re-confirm,
  touch the grade of, or upgrade this registered claim. No computation or number is reported from it
  as evidence of anything beyond "these frozen texts compose to this shape."
- `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` and
  `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` (both `VERIFIED`,
  formally verified at r30's award `lean-2026-09-26-c1-la2-weighted-hall-implies-nonpositive-aggregate`):
  this route's Step 2 carries that award's entries 30-31 (`card_sigma_fiber_filter`,
  `exists_saturatingFlow_of_weightedHall`) byte-identically; the carry is receipt-bound to that
  award's own grade and does not re-derive or re-confirm it.
- No claim in the `E993-R31-` or any other namespace is PROPOSED by this route. Alias check
  (lexical and mathematical): `cb8_topRank_stitch_scratch_c4u3` is not, lexically, any registered
  key or its predicate form, and mathematically it is a weaker (hypothesis-laden, sorry-dependent)
  statement than the registered Tier-1 key above, not an equivalent or a new instance of it — so:
  **none: no new claim proposed.**

## Grades

- N8 (`cb8_conjunct4_of_flowBundle`): CONFIRMED closed sorry-free — foreground build exit 0, axioms
  exactly `[propext, Classical.choice, Quot.sound]`, no `sorryAx` (`## Lean build and axiom report`).
  Per SOLUTION-CONTRACT §4 this route's own compiled declaration "has no grade until its governed
  award closes" — this RETURN reports it as **compiled** (a Stage-7-ready frozen-node closure), not
  `formally_verified`, per common-brief obligation 12 and ruling 32's own vocabulary
  (`FROZEN_NODES_CLOSED` is a gate line, not a grade).
- The carried interface (`U3Interface.lean`): the r30-sourced half is receipt-bound to r30's
  `formally_verified` award and carries that grade by reference only (not re-earned here); the
  Cycle-2-U2-sourced half (`weightedHall_of_ratFlow_bound`, `exists_saturatingFlow_of_ratFlow_bound`)
  is **compiled** scratch, ungraded until an award closes over it.
- The stitching project (`cb8_topRank_stitch_scratch_c4u3`): **compiled** scratch only, explicitly
  NOT a claim about (HALL), Tier 1, or any registered key (its `sorryAx` dependency on N2-N7 is
  reported, not hidden); it demonstrates that N8, once closed, composes with the already-closed
  parts of the base to leave a residual `sorry` set of exactly the still-open frozen nodes — i.e.
  that the DAG the checkpoint drew (N1-N8 → conjunct 4 → terminal) is exactly right and has no
  missing edge at the N7→N8→terminal end.
- Tier 1 overall: unchanged by this route at `proved_informal` (registry `VERIFIED`) — this route
  neither claims nor is positioned to claim any upgrade; conjunct 4 remains open pending N1-N7.

## Instrument sides

| Row | Number reported | Instrument A (side 1) | Instrument B (side 2) | Difference index |
|---|---|---|---|---|
| Stage 2 manifest seal | `226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387` | manifest's own `seal_sha256` field (`json.load` read) | independent recomputation from the canonical-JSON rule (`hashlib.sha256` over `dict` with the field removed) | `i_{seal,recorded} - i_{seal,computed}` = 0 at this single row (no sequence; a single exact-string equality, not a numeric difference series) |
| r30 Snippets 0030/0031 digests | `e8c6b0d1…`, `ec521065…` | `sources/SOURCE-DIGESTS.json` recorded value | `hashlib.sha256` over the literal fragment bytes on disk | 0 (exact match; not a numeric series) |
| c2 U2 `Main.lean` digest | `a03e15f3…81d2c` | `sources/c2-stage7-sources/SOURCE-DIGESTS.json` recorded value | `hashlib.sha256` over the literal file bytes on disk | 0 |
| c4-base 9 file digests | (nine sha256 values, `## Fidelity note` and replay script output) | `sources/c4-base/SOURCE-DIGESTS.json` recorded values | `hashlib.sha256` over each byte-copy this route made into `scratchpad/c4-U3/LeanProject/` | 0 for the seven untouched carries; `LeanProof.lean` and `Statements.lean` are DISCLOSED as intentionally edited, not compared as an identity (see Fidelity note) |
| N8 / stitching axiom report | `sorryAx` justification list | `lake build` `info`/`#print axioms` trace (`build-u3-stitch.log`) | literal file (`axioms-u3-stitch.log`, copied from the same trace) | none: a set-membership report (which frozen nodes remain open), not a numeric difference series |

No `supply − capacity = S` instance is asserted by this route (no network capacity computation is
performed here; N8's proof is a term-level application of an already-proved generic Hall lemma, and
the stitching project asserts no new (WID)/(HALL) numeric fact of its own).

## Lean build and axiom report

IMPORT LIST for this route's own Python (standard library only): `hashlib`, `json`, `os`, `sys`
(`scratchpad/c4-U3-replay/verify_digests.py`, sha256 `df0aa732b3b76e0d6cc6920a7c1f51e59cd8072322cb17e0d4a8bcaff6531b68` —
updated after the cache-reuse disclosure to also check §`cache precondition`: the controller-supplied
`scratchpad/c4-base/.../{Main,ChokeState,E1FlowConstruction,C3LA1}.lean` against `sources/c4-base`
before that cache was copied; rerun: exit 0, "all digests match (0 mismatches)").

Lean/lake build: project at `scratchpad/c4-U3/LeanProject/` (toolchain `leanprover/lean4:v4.32.2`,
Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` per `sources/mathlib-binding/PIN.json`, bound by
manual symlink `LeanProject/.lake/packages -> …/mathlib-v4.32.2-project/.lake/packages`, verified
present and NOT a copy). Command (foreground, no detachment; run through the harness's own tracked
background-command channel, polled to completion, never a raw `nohup`/`disown`):

```
cd scratchpad/c4-U3/LeanProject && lake build LeanProof
```

Log: `scratchpad/c4-U3/build-u3-stitch.log`. Axiom trace: the `#print axioms
E993Transport.cb8_conjunct4_of_flowBundle` and `#print axioms E993Transport.cb8_topRank_stitch_scratch_c4u3`
commands at the end of `U3Stitch.lean` surface their `info` output in the same build log; mirrored to
`scratchpad/c4-U3/axioms-u3-stitch.log`.

**Literal outcome (foreground run, exit code 0, 35.47s, 8663 jobs, `grep -ci error` on the log = 0):**

```
info: LeanProof/U3Stitch.lean:73:0: 'E993Transport.cb8_conjunct4_of_flowBundle' depends on axioms: [propext, Classical.choice, Quot.sound]
info: LeanProof/U3Stitch.lean:74:0: 'E993Transport.cb8_topRank_stitch_scratch_c4u3' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
```

**Reading.** `cb8_conjunct4_of_flowBundle` (N8) depends on exactly `propext, Classical.choice,
Quot.sound` — the three base axioms ruling 25 requires and NO `sorryAx`. By the admission rule stated
in the dispatch ("N8 closed only if the build exits 0 with axioms propext/Classical.choice/Quot.sound
and no `sorryAx`"), **N8 is closed, sorry-free, on this route's build.** The 19 other `sorry`
declarations in `Statements.lean` (linter-reported at lines 26, 36, 59, 76, 89, 99, 142, 151, 165,
172, 180, 188, 196, 205, 221, 239, 252, 264, 278 — N1-N7's remaining leaves, none of which this route
attempted) are untouched, exactly as expected. `cb8_topRank_stitch_scratch_c4u3` (the stitching
project) depends additionally on `sorryAx`, precisely because it imports N2-N7 as frozen `sorry`-bodied
statements by design (`## Route object`, Step 3) — this is the intended, disclosed residue, not a
defect: the stitching project's job was to show the terminal DAG closes to *exactly* the open frozen
nodes once N8 is supplied, and the axiom trace confirms that is what happened (no *additional*,
unexplained `sorryAx` source; `#print axioms` does not enumerate which declarations contribute the
`sorryAx`, so this route additionally traced it structurally in `## Route object` Step 3 — every
non-N8 premise `cb8_topRank_stitch_scratch_c4u3` consumes is one of N2, N3(companion `cb8GSec_out_ge_one`),
N4 (`cb8GSec_in_le_one`, `cb8GSec_zero_classes`), N5 (`cb8GSec_switchImage_inflow`) or N6
(`cb8_activeWeight_leafSet_eq`), i.e. N7's own hypotheses, plus N7 itself
(`cb8_flowBundle_of_arcSpecs`) — so the `sorryAx` is accounted for completely by N2-N7 and nothing
else).

## Gate lines (ruling 32)

- `COND4_formal`: N8 CONFIRMED closed sorry-free on this route's build (exit 0, axioms
  `propext/Classical.choice/Quot.sound` only); conjunct 4 as a whole still NOT closed (N1-N7 remain
  open with their frozen `sorry` bodies unchanged; this route did not attempt them).
- `E1_formal`: not this route's object (N1/N2, owned by T1/U1); unchanged, open.
- `TERMINAL_integration`: CONFIRMED — this route's stitching project (`cb8_topRank_stitch_scratch_c4u3`)
  builds sorry-free-except-for-N2-N7 and its axiom trace (`sorryAx` present, traced completely to
  N2-N7 and to nothing else) confirms the terminal DAG's N7→N8→`AdjU.cb8_topRank_of_flow` edge is
  correct: once N2-N7 close, re-pointing this composition at the reserved name needs no new
  mathematics. The terminal itself is NOT integrated end-to-end yet (N2-N7 still open).
- `cut_candidate`: none found or claimed by this route.
- `FROZEN_NODES_CLOSED`: N8

## headline_resolved

`headline_resolved: no`

## Route verdict

`compiled` — N8 closed sorry-free (build exit 0; axioms `propext, Classical.choice, Quot.sound`; no
`sorryAx`), confirmed by a foreground `lake build` this route ran itself after two host interruptions;
the stitching project builds with `sorryAx` traced completely to the still-open N2-N7. Neither
declaration is graded `formally_verified` by this route (SOLUTION-CONTRACT §4, common-brief
obligation 12: "a compiled scratch declaration has no grade until its governed award closes"); no
registered claim is upgraded, touched, or refuted; Tier 1 remains `proved_informal` and conjunct 4
remains open pending N1-N7.

## Remaining obligation (successor inheritance)

1. **N8 and the stitching file are ready for Stage 7 packaging once N7 (and, transitively, N2-N6)
   close.** A successor closing N7 gets, for free, a sorry-free path from N7's conclusion to the full
   SOLUTION-CONTRACT §2 terminal shape (this route's `cb8_topRank_stitch_scratch_c4u3`) — it need only
   re-point that composition at the RESERVED name once every N2-N7 (and N1, N3-N5's remaining pieces)
   are closed by their owning routes, and re-verify under the reserved statement text.
2. **This route did not attempt N1-N7.** T1/U1 own N1 (dual ownership, ruling 30); U1 owns N2; T2 owns
   N3; T3 owns N4/N5; U2 owns N6/N7 (N7 specifically, per the route table). Until all of those close,
   `cb8_topRank_stitch_scratch_c4u3` carries `sorryAx` and is not a formal award.
3. **Two host interruptions (~08:55 EDT and ~10:02-22:46 EDT) cost real time** across three failed or
   incomplete build attempts (a detached `nohup`/`disown` process that did not survive; a
   harness-tracked background job whose log stayed empty across a ~12.7-hour session gap; a
   foreground invocation that itself exceeded the 600s per-call tool ceiling) before a controller-
   supplied build cache (`scratchpad/c4-base/LeanProject/.lake/build`, CF-C4-S3-1 / R31-N-26) let the
   fourth attempt finish in 35s. **Lesson for successors and the controller:** a Lean-building seat
   whose four carried files (`Main`, `ChokeState`, `E1FlowConstruction`, `C3LA1`) are byte-identical
   to `sources/c4-base` should request or check for a controller-built `.lake/build` cache at the
   start of its route, before its first `lake build`, rather than after multiple cold-build timeouts;
   this route did not know to look for one until the coordinator supplied CF-C4-S3-1.
4. **Build/axiom confirmation is COMPLETE, not pending**: foreground `lake build LeanProof` exit 0,
   35.47s, 8663 jobs, 0 errors; `cb8_conjunct4_of_flowBundle` axioms `[propext, Classical.choice,
   Quot.sound]`, no `sorryAx` — `FROZEN_NODES_CLOSED: N8` is final as stated in `## Gate lines`.
