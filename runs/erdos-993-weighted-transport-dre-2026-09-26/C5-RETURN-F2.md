# RETURN — Route F2, Cycle 5, r30

**Route ID:** `C5-F-02 PER-TAG-INJECTION-FRONTIER`. **Mechanism fingerprint:** `PER-TAG-INJECTION-FRONTIER`.
**Orientation:** F (falsify). **Load-bearing obligation** (`control/C5-ALLOCATION.md` item 4): (a) map where CT-1's
per-tag symmetric-chain method reaches on named families — `G_k` variants with 1 or 3 cherry leaves, mixed arm
lengths, and `T(m,2)` (absorbing Cycle 4 F2's untouched obligation (c)); the (HALL) mechanism is studied on these
families, their closed aggregate theorems are NOT re-proved; (b) the smallest eligible `(T,p)` at which every per-leaf
summand is `≤ 0` but some tag's deletion injection fails, by an exhaustive census over a STATED order range; literal
(HALL) there with two instruments.

**central obligation attempted: yes**

## Boot

I am operating within VerityOS. Per `DISPATCH-F2.md`'s instruction, the authorized boot reads were EXACTLY two files
and nothing else: `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`.
I read both in full before writing anything else. I did **not** follow the startup protocol's own task-type map into
memory, conversations, modules, skills, logs or decisions — the controller has booted for this run, per the dispatch's
instruction. (The host injected the project `CLAUDE.md` and the user's auto-memory index into context at session
start, outside my control and before the dispatch was read; I did not open, follow, or act on either as a source of
task instructions — see `## Read-boundary disclosure` below.)

## Dispatch and seal verification

- Dispatch file `control/dispatch/c5-stage3/DISPATCH-F2.md` hashed BEFORE reading, per the outer instruction: SHA-256
  `0a8699d6ac1a06039a9fd8afe054d54d69be2c4ef211c095b7e8699a96760168` — **match** (`shasum -a 256` on the file, run
  before any content was read).
- Stage 2 packet manifest `control/C5-STAGE2-PACKET-MANIFEST.json`, inner seal (canonical JSON without `seal_sha256`:
  `sort_keys=True`, separators `(",", ":")`, no trailing newline, computed via a small `python3 -B` script reading the
  file directly, since the file is too large for a single non-scripted read): declared
  `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289`, recomputed
  `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` — **match**.

I did not verify any individual `sources/` member digest against `control/SOURCE-DIGESTS.json`: this route's entire
mathematical content is built from the prose definitions of `SEMANTIC-CONTRACT.md` §1.1–1.2, `SOLUTION-CONTRACT.md`
§1–2, `control/C5-ALLOCATION.md`, `control/C5-STAGE1-GATE.md`, `cycles/cycle-5/stage2/ROUTE-STATE.md`, and — for the
`G_k` and `T(m,k)` definitions of record and Cycle 4's own CT-1 instruments — `cycles/cycle-3/stage6/SYNTHESIS.md`,
`cycles/cycle-3/stage3/returns/F2/RETURN.md`, `cycles/cycle-3/CYCLE-CLOSE.md`, `cycles/cycle-4/stage3/returns/F2/RETURN.md`,
`sources/c4-stage7-sources/C-F2-T/scd_flow.py` and `sources/c4-stage7-sources/ADJ-F/ct1_own.py` (read for orientation
on CT-1's own construction; not executed, not modified, not copied into this route's own code, and not relied upon as
evidence for this route's own findings — this route's implementation is independent, see `## IMPORT LIST` and the
fidelity check of `## Step 2` below). All of these are explicitly authorized reads named in `DISPATCH-F2.md` and
`C5-WORKER-COMMON-BRIEF.md` (the "Cycles 1–4 inheritance" clause: every Cycle 1–4 stage3 return is a sealed source of
record). No file under `sources/` was written; no file under `sources/` supplies a digested numeric claim of this
route's own. One single-file `grep` on `control/CLAIM-IDENTITY.run-local.json` (explicitly authorized) for the strings
`PER-TAG`, `SYMMETRIC-CHAIN`, `DELETION-INJECTION`, `INJECTION-FRONTIER`, `CT-1`, `CT1` — 0 matches — to check this
route's own working vocabulary against the registry before using it in prose (§ Registered claims), never a recursive
or directory-wide search.

**Model disclosure:** chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported
model id: `claude-sonnet-5` (the host's system context states this verbatim; no separate self-identification API call
is exposed to this seat).

## Registered claims this route touches (named before any table or census result, per obligation 3)

- **(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`** — OPEN. This route does not close it, narrow it, or refute
  it. Every joint-Hall check below (both deletion-only and deletion+switch) HOLDS on every tested instance, which is
  weak positive corroboration at finite, small instances only (`bounded_computation`) — not evidence that changes
  (HALL)'s status, and not cited as such.
- **`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`** (the primary aggregate) — OPEN, untouched (fence:
  mechanism ≠ aggregate; nothing below reasons about the aggregate directly).
- **`E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE`** (GK-SIGN; `proved_informal`) — cited and REUSED
  only as a fidelity check (§ Step 2: my own independent model reproduces its frozen `k=3..7` rows exactly); not
  re-proved, not extended as a new contribution.
- **The ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2** — none is revived. This route proposes no new
  transport MECHANISM at all: CT-1 (the per-tag symmetric-chain deletion injection) is an EXISTING critic-derived
  construction from Cycle 4 (`sources/c4-stage7-sources/C-F2-T/scd_flow.py`, `ADJ-F/ct1_own.py`), already exercised
  (not registered as a key) in this run; this route only asks how far an OPERATIONAL reformulation of it (§ Step 1)
  reaches on new families, and reports where it does or does not find a failure. None of the ten refuted keys concerns
  a per-tag deletion-injection existence test specifically (they concern: literal delete-only Hall on the original
  unweighted definitions layer; a fixed-`Γ` literal-tree Hall; a tag-closed-cut Hall; a hot-tag-singleton Hall; a
  zero-retag-export criterion; a support-preserving unit transport (R19); a per-leaf down-map injectivity claim; a
  same-rank weighted-occupancy domination claim; a signed cross-tag injectivity claim (C4-T4); a local
  marked-addability nonpositive-covariance claim; a pointwise addability bound (C3-G1); and R28's tree-leaf-slot
  dominance, which the fence itself notes is "a different problem" — Hall/SDR for a degree lemma, unrelated to the
  active-tag weighted transport network here).
- **(LIFT) `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`, (DCB) `E993-BIPARTITE-TAGGED-INCIDENCE-DEFICIT-IDENTITY`** —
  not used anywhere in this route (no automorphism-orbit quotient and no bipartite tagged-incidence identity appears
  in the code or the derivation below); untouched.
- **The `T_m`/spider/path-star family keys** (the `T_m` deletion+two-for-one orbit-flow instrument of
  `sources/lower-region/instruments/orbit-flow-twoforone/`; the "path-star arities 2–4/2–12" keys of
  `SEMANTIC-CONTRACT.md` §1.2's fixed points) — settled; NOT re-proved; and explicitly NOT identified with this
  route's `T(m,k)` family, which is a DIFFERENT, distinctly-named construction (`cycles/cycle-3/stage3/returns/F2/RETURN.md`'s
  path `c_1–d_1–c_2–…–d_{m-1}–c_m–f–s` with a pendant `e_i` on each `c_i`, `i<m`, and `k` leaves on `s`) carried over
  by this route as Cycle 4 F2's own explicitly-named untouched obligation (c). The similar names (`T_m` vs. `T(m,k)`)
  are noted here precisely so no reader conflates the two; no identity between them is asserted or used.
- **Alias check (obligation 5).** Lexical: 0 matches for `PER-TAG`, `SYMMETRIC-CHAIN`, `DELETION-INJECTION`,
  `INJECTION-FRONTIER`, `CT-1`, `CT1` in `control/CLAIM-IDENTITY.run-local.json` (single-file grep, above).
  Mathematical: this route's finding (§ Step 3–4) is a NEGATIVE/exploratory bounded-computation record ("no per-tag
  deletion-injection failure found in the stated range, across a wider family of deformations than the naive
  branch-poset argument predicted"), not a theorem with a subject-predicate statement to register; per the Cycle 4 F2
  precedent, this route proposes no key text of its own and defers naming to the synthesis.

## Derivation

### Step 0 — Definitions of record used, and where each hypothesis enters

Everything below is implemented independently in this route's own code (`model.py`, `families.py`, `weight.py`), from
`SEMANTIC-CONTRACT.md` §1.1–1.2 directly, not copied from any file under `sources/`:

- `IsTree` = connectivity (BFS reachability) AND acyclicity (`|E| = |V| - 1`, cross-checked by a SEPARATE
  parent-tracking BFS that would detect a back edge), asserted in code for every tree built (`model.Graph.is_tree`,
  `families.py`'s own smoke tests, and every `assert g.is_tree()` at each instance below — never assumed).
- Independent-set counts: a component-wise rooted-tree DP (`model.Graph.indep_poly_on`, `A_v`/`B_v` per SEMANTIC-CONTRACT's
  own description of the standard construction), used for `α`, `x` (`crossingIndex`, computed through rank `α`
  inclusive, not omitting the terminal zero-extension difference), `F_p` (`IsFavorableAt`, `Δ_p(G-v) < 0` strict, on
  the graph with only `v` removed), and the per-leaf summand (`Δ_{p-1}(H_v) - Δ_{p-1}(R_v)`, literal `H_v = G-{v,s_v}`,
  `R_v = G - N_G[s_v]`).
- Literal independent SETS (not just counts), `model.Graph.indep_sets_of_size`, used for `w_F`, the transport relation,
  and all matching/flow instruments — exact enumeration, no sampling, tractable at the tree sizes this route reaches
  (`n` up to 30).
- `w_F(B) = #{v ∈ F ∩ B : (B∖{v}) ∩ W_v ≠ ∅}`, `W_v = N(s_v)∖{v}` — `weight.w_F`, literal, never the `|F∩B|` shortcut.
- (D)∪(S) literal (`weight.deletion_targets`, `weight.switch_targets`).
- `F_p` DERIVED on every row (`model.favorable_leaves`), never hard-coded as "all leaves", even though it turns out to
  equal the whole leaf set on every eligible row tested below (checked, not assumed — matching the baseline's own
  B6 finding, extended here to the variant families).

### Step 1 — Operational reformulation of "CT-1's per-tag injection reaches `(T,p)`"

CT-1 (`sources/c4-stage7-sources/C-F2-T/scd_flow.py`, `ADJ-F/ct1_own.py`) builds, for each active tag `τ`, an
EXPLICIT injective map from `{B ∈ I_{p+1} : τ active in B}` to `{A ∈ I_p : τ active in A}` via a deletion arc, using a
symmetric chain decomposition (de Bruijn–Tengbergen–Kruyswijk) of the product of the OTHER branches' independent-set
posets (each branch a `K_1` or a `P_3`, both of which happen to have a symmetric — rank-palindromic — independent-set
poset). Rather than hand-build a chain decomposition for every branch shape this route's obligation asks about (a
1-leaf or 3-leaf cherry, or an arm of length other than 3), I use the following EQUIVALENT operational criterion,
which is what actually determines whether "some tag's deletion injection fails":

> Tag `τ`'s deletion injection EXISTS iff a bipartite matching saturating `{B : τ active in B}` exists in the graph
> `B — A` for `A` a deletion image of `B` (`A = B∖{q}`) with `τ` still active in `A`. By König/Hall this is checked
> exactly by maximum bipartite matching (`matching.kuhn_max_matching`), never by sampling.

**One-line sufficiency argument (stated, used only as an interpretive note; every reported row below is ALSO checked
directly by literal joint max-flow, so no claim here rests on this argument alone):** if every tag's own map is
injective and lands only on targets where it remains active, the combined per-tag flow automatically respects every
target's capacity `w_F(A)`, because at most one unit can arrive at `A` via each of the (at most `w_F(A)`) tags active
at `A`. This is why a per-tag FAILURE is the operative frontier question obligation (b) asks for, distinct from
whether (HALL) itself holds (a jointly-optimised, non-per-tag flow could still exist even if some tag's own injection
fails) — kept as two distinct, separately-reported checks on every row (`tag_results` vs. `joint_hall_*`).

**Why the naive "branch poset must be rank-symmetric" argument does not by itself predict a failure.** A `1`-leaf
cherry or a length-`2`/length-`4` arm induces a `K_2` or `P_4` branch poset with a NON-symmetric rank profile (e.g.
`P_4`: ranks `1,4,3`; `K_{1,3}`, the `3`-leaf cherry: ranks `1,4,3,1`) — neither admits a classical symmetric chain
decomposition (`N_i ≠ N_{R-i}` for some `i`). I checked by hand (not shipped as a claim, since it is not needed for
anything below — recorded here only to explain why an OPERATIONAL test, not a hand-built chain decomposition, is the
right instrument) that `K_{1,3}`'s poset still admits a valid (non-symmetric) saturated CHAIN PARTITION with only
`3` of its `4` rank-`1` elements forced to be chain-bottoms (a hard pigeonhole floor, `N_1 - N_0 = 3`, not avoidable
by any partition), so a per-tag injection through this factor CAN still exist provided the specific rank the
construction needs never lands on one of those forced bottoms. Whether it does is a property of the WHOLE product
poset at the specific `(T,p,τ)` in question, not of the one factor in isolation — hence the census below, not a
hand proof, is the right instrument for obligation (a)/(b).

### Step 2 — Fidelity check (own instrument, before trusting the model for any new finding)

`validate_baseline.py` reproduces the frozen `G_k` baseline rows on record (`SEMANTIC-CONTRACT.md` §1.2 / cycle-3
`stage6/SYNTHESIS.md` row B6 / cycle-4 F2 `RETURN.md` §2 table — cited here only as a consistency check, never as
evidence for this route's own claims): full literal supply/capacity/`S` at `k=3,4,5` (`253/527/-274`,
`1542/2735/-1193`, `8875/14196/-5321`), and `S` alone (via the scalable aggregate route) at `k=6,7`
(`-24151`, `-111045`) — **all match exactly**, `F_p` = whole leaf set confirmed by derivation (not assumed) on every
row, and `supply - capacity = S` confirmed from two INDEPENDENTLY computed sides (the literal `w_F` sums vs. the
`H_v`/`R_v` aggregate) on every row (ruling 17/24 compliance).

`validate_matching.py` cross-checks `matching.kuhn_max_matching` against an independent instrument
(`matching.Dinic`, unit-capacity max-flow on the same bipartite graph) on 200 random bipartite instances (fixed seed
`510300993`, exact reproducibility): **0 mismatches**.

`per_tag_frontier.py`, run on baseline `G_3` at `p=6`: every one of the `6` tags' per-tag injections saturates
(matching size = number of active sources, for every tag), matching CT-1's own Cycle-4 finding of zero capacity
violations at `k=3`; the joint max-flow (deletion-only and full) both equal supply (`253`). This is the sanity check
that the operational reformulation of Step 1 agrees with CT-1's own explicit construction before it is used on new
families.

### Step 3 — Census (obligation (a) and (b)): `G_k` variants and `T(m,2)`

**Stated order range** (every tree in the stated range is covered; within each tree, the eligible-`p` values checked
are capped at the `3` SMALLEST eligible `p` per tree — `MAX_ELIGIBLE_P_PER_TREE = 3` in `census.py`/`census_push.py`
— disclosed explicitly here and on every row, not a silent skip):

| Pass | Family | Parameter range |
|---|---|---|
| `census.py` | `G_k`, cherry ∈ {1} | `k = 1..7` |
| `census.py` | `G_k`, cherry ∈ {3} | `k = 1..6` |
| `census.py` | `G_k`, cherry = 2 (control/baseline) | `k = 1..6` |
| `census.py` | `G_k`, ONE arm length ∈ {1,2}, rest length 3 | `k = 2..7` |
| `census.py` | `G_k`, ONE arm length ∈ {4}, rest length 3 | `k = 2..6` |
| `census.py` | `G_k`, ONE arm length ∈ {5}, rest length 3 | `k = 2..5` |
| `census.py` | `T(m,2)` | `m = 1..8` |
| `census.py` | `T(m,1)` (control) | `m = 1..8` |
| `census_push.py` | `G_k`, cherry ∈ {4,5,6} | `k = 1..4` |
| `census_push.py` | `G_k`, ONE arm length ∈ {6,7,8}, rest length 3 | `k = 2..5` |
| `census_push.py` | `G_k`, cherry ∈ {1,3} AND one arm length ∈ {1,2,4,5} together | `k = 2..5` |
| `census_push.py` | `G_k`, ALL `k` arms at one non-baseline length ∈ {1,2,4,5} | `k = 2..4` (`k=5` at length `5` excluded: `n=30` exceeds this route's literal-enumeration tractability inside a bounded foreground run — disclosed, not silently skipped) |

For every `(T,p)` reached (`56` eligible instances in total, `30` from `census.py` + `26` from `census_push.py`; every
one of them ELIGIBLE, `x+2 ≤ p`, `3p < 2α+1`, checked from `x` computed through rank `α`): `F_p(T)` DERIVED (turns out
to equal the whole leaf set on every tested row — checked, not assumed), the per-leaf summand computed for every leaf
in `F`, WID (`supply - capacity = S`) asserted from two independently computed sides, EVERY tag's per-tag deletion
injection tested by exact maximum bipartite matching (Step 1), and the joint weighted-Hall condition checked by
literal exact max-flow, BOTH deletion-only and deletion+switch.

**Result.**

- `every_per_leaf_summand_le_0`: **true on all 56 rows** (every per-leaf summand strictly negative on every tested
  row, in fact — extending the baseline's B6-style finding to every cherry/arm deformation tested).
- `wid_consistent` (`supply - capacity = S` from independent sides): **true on all 56 rows** — the required per-row
  check, never omitted.
- `any_tag_deletion_injection_fails`: **false on all 56 rows.** No tag's per-tag deletion injection failed anywhere
  in the stated range — i.e., **obligation (b)'s target instance was NOT found** in this range (see
  `## Remaining obligation`).
- `joint_hall_deletion_only` and `joint_hall_full`: **true on all 56 rows** (a literal, exact max-flow confirmation
  that a saturating flow exists at every tested instance — consistent with, but not evidence for or against, (HALL)
  at large, per the fence "finite ≠ universal").

**What this maps (obligation (a)).** The naive expectation — that departing from the baseline's `2`-leaf cherry
(`P_3`, rank-symmetric) or length-`3` arm (`P_3`) to a `1`-leaf cherry, `3`-to-`6`-leaf cherry, or an arm of length
`1,2,4,5,6,7,8` would break CT-1's per-tag construction, because the resulting local branch poset (`K_2`, `K_{1,3}`,
`P_4`, or larger stars/paths) is not rank-symmetric and so has no classical symmetric chain decomposition (Step 1) —
is NOT confirmed at any instance in the tested range, including instances with the irregularity compounded (a
non-baseline cherry TOGETHER with a non-baseline arm in the same tree, or every arm simultaneously non-baseline).
CT-1's OPERATIONAL reach, in the sense of Step 1's matching-existence criterion, extends at least this far. `T(m,2)`
(and its `T(m,1)` control) show the same pattern.

### Step 4 — What this is NOT

This is `bounded_computation`, exact but finite (`56` instances, a stated and disclosed range), never a proof that
the per-tag injection exists for every `k`/`m` or every deformation — the census does not touch, let alone re-prove,
`E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET` (the registered
`G_k` flow key) or any closed aggregate theorem on these families (per the obligation's own "closed aggregate
theorems are NOT re-proved"). It is not a census value used in a proof (fence, `SOLUTION-CONTRACT.md` §3.4) — it is
reported exactly as what it is, a bounded map of where a specific method's OWN reach was tested and not found to
fail. Obligation (b)'s target ("the smallest eligible row where every per-leaf summand is ≤0 but some tag's deletion
injection fails") is **not resolved**: no such instance exists in the `56` rows checked; whether one exists at all,
anywhere in the lower region, is left open (§ Remaining obligation).

## IMPORT LIST (all files, standard library only; `python3 -B` throughout)

`model.py`: `collections.deque`, `itertools` (unused directly, kept for possible extension — not exercised by any
code path in this route; noted so no reader assumes it hides an undisclosed dependency). `families.py`: `model`.
`weight.py`: none beyond builtins. `matching.py`: `collections.deque`, `sys`, `threading` (a worker thread with a
raised stack size, used ONLY to give the augmenting-path search enough native stack depth on large instances — the
algorithm itself is the same deterministic recursive Kuhn's algorithm, unchanged; `threading.Thread.join()` is called
before the function returns, so this is not a background job in the sense of the shared rules — nothing is left
running). `per_tag_frontier.py`: `json`, `model`, `weight`, `matching`. `validate_baseline.py`: `json`, `model`,
`families`, `weight`. `validate_matching.py`: `random`, `json`, `matching`. `census.py`: `json`, `time`, `families`,
`model`, `per_tag_frontier`, `collections.defaultdict`. `census_push.py`: `json`, `time`, `families`, `model`,
`per_tag_frontier`. `make_manifest.py`: `hashlib`, `json`, `os`. No network, no third-party package, no
`pip`/`brew`/`npm`/`elan` use anywhere in this route.

## Replay

Copy-out-first, from `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-F2/`
to the in-root replay directory (never `/tmp`):

```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-F2/*.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-F2-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-F2-replay/
python3 -B families.py
python3 -B validate_matching.py
python3 -B validate_baseline.py
python3 -B census.py        # ~140s
python3 -B census_push.py   # ~30s
python3 -B make_manifest.py
```

This exact sequence was run from a clean copy of the replay directory during this route (all prior files removed
first) and its `MANIFEST.json` is byte-identical to the one produced in the working scratch directory (diffed,
`0` differences) — confirming full determinism (no wall-clock, PID, or host field anywhere in a hashed output).

## Artifact inventory (SHA-256, `MANIFEST.json` in `scratchpad/c5-F2/` and `scratchpad/c5-F2-replay/`, identical)

| File | SHA-256 |
|---|---|
| `model.py` | `169e655365dbae31f1b0605f2c3d7d5aef68ec68720e67a1889dcc662c1cdeb4` |
| `families.py` | `b04be675af8db9e3da844fda03f70e4c3c4018e75a109b2858d8023bbf271b5d` |
| `weight.py` | `7dc7c97d047086910f6c0de49b0cd76e3fb5544d1e95950c07415b14c741cced` |
| `matching.py` | `cdba291a0cce4d0181f89ea2a072919394d5148c504334bf7135607d45b3daa1` |
| `per_tag_frontier.py` | `192814cc0132dfc8410a52f92574ecbd654c0794d06455e16de0dd31fb153531` |
| `validate_baseline.py` | `2ead773bd8dfc85715460b2e4ecd9ab9e5db6477e42a7cf8c64d675d7e5a108c` |
| `validate_baseline_out.json` | `443bc9876cc7acb93734bd0d6edf62c7ea08d45c4f27ddbe9bd25faca72c8033` |
| `validate_matching.py` | `fecffd0f49b81c4ebcefe283a729be6e5e7b0e8fe1aae14132513b54faee429a` |
| `validate_matching_out.json` | `0bcaca0340c5a5fb64e3b646237d2abd1fb31220385a208c9e8062c9c0a4133e` |
| `census.py` | `93870a8c907c8c57db48ac23c63d8010e1ddd1300683f243507786f320efd971` |
| `census_out.json` | `43252b9f7108a1794cd2647debf8ab52e3abe7227a165d765ec26d34990fc80a` |
| `census_summary.json` | `d5b5cec23e9767baccb02735846cdddf92679108a3b18fab66fcab56b7ab023d` |
| `census_push.py` | `6b371ddce084680c94ea0519341f0d5ea9582880a68c46de42c7167e477a6497` |
| `census_push_out.json` | `7c193b608fa3a515583538f4f18af876af25c41cd28599a6f1fa517ef15f7698` |
| `census_push_summary.json` | `f784241c84e008f85c789deacaf2cfe0d0040317542404f826a2912330cbf2c4` |

All scratch under `scratchpad/c5-F2/`; replay copies under `scratchpad/c5-F2-replay/`; nothing written under
`sources/` or any other experiment root; no background job left running.

## Grades (`SOLUTION-CONTRACT.md` §4)

- Step 2 fidelity check: no new grade (reconfirms the already-`proved_informal` GK-SIGN key's own frozen numbers;
  not a new contribution).
- Step 3 census (the frontier map, `56` instances, `0` per-tag-injection failures, `0` joint-Hall failures):
  **`bounded_computation`** — exact, not sampled, but finite in `k`/`m` and in the deformations tried; not a theorem;
  a record for the synthesis to consider, not registered by this route (per obligation 5/ruling 33, naming and
  alias-registration is the synthesis's role).
- The operational reformulation of Step 1 (per-tag injection existence ⟺ bipartite matching saturation, with the
  stated sufficiency argument for combined-capacity compliance): a derivation, not a new registered claim (it
  reformulates, and is checked to agree with, CT-1's own already-exercised construction; it is not itself a new
  transport mechanism).

## `headline_resolved: no`

The headline (HALL) is `formally_verified` or REFUTED-by-confirmed-cut; neither occurred here (Stage 7 events only),
and this route found no cut and no per-tag-injection failure. Unchanged.

## Route verdict

**`bounded_evidence`.** Not `proved` (no closed-form/inductive proof that the per-tag injection exists for every
`k`/`m`/deformation, nor of (HALL) itself); not `proved_conditional` (no single named external lemma conditioned on);
not `refuted` (no cut found, and no per-tag-injection failure found, anywhere in the tested range); not `compiled`
(no Lean text — out of this route's scope, U1's); not `blocked` (substantial, load-bearing progress: an operational,
matching-based reformulation of "does CT-1 reach this instance" that needed no hand-built chain decomposition per
branch shape, validated against CT-1's own construction, and a genuine — if bounded — extension of the tested range
well past the `P_3`/`K_1`-only branch shapes the classical symmetric-chain argument covers, finding the method's
OPERATIONAL reach further than the naive rank-symmetry heuristic predicted).

## Remaining obligation (successor inheritance)

1. **Obligation (b) is still open.** No instance was found, in the `56`-row range stated above, where every per-leaf
   summand is `≤ 0` but some tag's deletion injection fails. A successor should either (i) push `k`/`m` and the
   deformation space further — this route's `matching.py`/`per_tag_frontier.py` are reusable as-is and scale
   correctly (validated against an independent max-flow instrument); the binding cost is literal independent-set
   ENUMERATION, which becomes the bottleneck around `n ≈ 25–30` for these branching factors (this route's own
   `G_k-all-arms-varied, length=5, k=5` attempt, `n=30`, did not finish inside a bounded foreground run and was
   excluded, disclosed above) — a successor wanting larger instances should replace literal enumeration with a
   polynomial/recurrence-based approach for the COUNTS (as Cycle 3's F2 did for `T(m,k)`'s `x`/`Δ` values) and restrict
   literal enumeration to only the specific layers a matching check needs; or (ii) attempt a general PROOF that the
   per-tag matching-existence criterion of Step 1 holds on this whole family of branch shapes (a possible new
   direction this route surfaces: since a valid, if non-symmetric, saturated chain PARTITION was shown to exist even
   for `K_{1,3}` — Step 1 — a Hall-deficiency argument for WHEN a chain partition's forced bottoms avoid the specific
   ranks these constructions need might generalize; not attempted here beyond the one hand-worked `K_{1,3}` example).
2. **`T(m,2)` beyond `m=8`:** not pushed further for the same tractability reason; Cycle 3's own fast block-recurrence
   for `T(m,k)`'s independence polynomial (`cycles/cycle-3/stage3/returns/F2/RETURN.md` §A1–A4) would let a successor
   reach `x`, `α`, eligibility and the per-leaf summand sign at `m` in the thousands cheaply, but does NOT by itself
   give the literal independent SETS this route's per-tag matching test needs — a successor combining the two (fast
   counts to find candidate eligible rows, literal enumeration only at those specific rows) could reach much further.
3. **Deformations not tried:** two or more arms at DIFFERENT non-baseline lengths simultaneously (this route only
   varied one arm, or all arms uniformly, never a genuinely mixed composition like `[2,4,5,...]`); cherries combined
   with `T(m,k)`-style blocks; `k+1`-cherry `T(m,k)` variants for `k > 2`.
4. **The Step 1 sufficiency argument is stated but not formally verified** (no Lean text was produced; out of this
   route's scope). A successor pursuing a Lean award for CT-1's reach should start from this argument's one-line
   proof, which is short and elementary.

## Process-discipline disclosure

Two `timeout`-wrapped foreground runs of an earlier, larger `census_push.py` scope (before the `G_k-all-arms-varied`
section was trimmed to `k=2..4`) were killed by their own `timeout N` wrapper (`170s`, then `580s`) because the
untrimmed scope's largest instance (`length=5, arm-count=5`, `n=30`) did not finish in time; both were ordinary
foreground commands terminated by `timeout` itself, not a background job I had to find and kill, and no partial file
was left in an inconsistent state (the script only writes its output JSON at the very end, after all rows are
computed) — the already-printed stdout rows from the first attempt were recovered from the log and cross-checked
against the final, completed, trimmed run's output. Separately, while sanity-checking `per_tag_frontier.py` as a
standalone script I referenced a throwaway redirect target `/tmp_unused_ignore` by mistake (an absolute `/tmp` path,
against the "never `/tmp`" rule); the write failed immediately (read-only filesystem in this environment) and no file
was created there or anywhere outside the authorized scratch directories — disclosed here as a mistake, not a
completed violation. No `__pycache__` anywhere (`python3 -B` throughout, checked with `find` restricted to this
route's own scratch directory, which is within the grant). No `pgrep -f`/full process listing was used; no background
job was left running (the one worker thread inside `matching.kuhn_max_matching` is joined before the function
returns, on every call).

## Read-boundary disclosure

The host injected the project `CLAUDE.md` (a VerityOS bootstrap file) and the user's auto-memory index into context
at session start, outside this seat's control and before the dispatch was read. Neither was opened or acted on as a
source of task instructions by this seat (this return's task, scope, and every reading decision come from
`DISPATCH-F2.md`, `C5-WORKER-COMMON-BRIEF.md`, and the files they name). Before beginning the boot-and-dispatch
sequence, this seat independently read and reasoned about the dispatch file's own content (as the dispatch instructs:
"verify its SHA-256 ... and then follow it exactly and in full") to confirm it described a bounded, non-harmful
computational/mathematical task before proceeding — this is ordinary judgment applied to any instruction, not a
deviation from the dispatch, and it changed nothing about how the task was executed. No VerityOS file outside the two
authorized boot reads (`verity.md`, `identity/startup-protocol.md`) and the explicitly authorized
`control/`/`cycles/`/`sources/`-under-this-route's-grant files listed in `## Dispatch and seal verification` above was
read; no file under `sources/` was written; no recursive or glob search was run above this route's grant (this
route's own scratch directories, plus the single named files above, plus the single single-file `grep` on
`control/CLAIM-IDENTITY.run-local.json`, explicitly authorized).
