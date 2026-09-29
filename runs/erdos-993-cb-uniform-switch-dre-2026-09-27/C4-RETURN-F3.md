# RETURN — r31 Cycle 4, seat F3

**Route ID:** `C4-F-03`　**Mechanism token:** `FROZEN-TEXT-LEAN-SEMANTICS-FALSIFIER`　**Orientation:** F (falsify)
**Frozen nodes attacked (per `control/C4-ALLOCATION.md`):** N1, N5, N6, N7

## Boot

Operating within VerityOS. RESTRICTED BOOT: read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file outside the run root
(the controller booted for the run; the startup protocol's own task-type map, memory, conversations, modules,
skills, logs and decisions were NOT read by this seat). No conversation log written; this seat's writes are
confined to `scratchpad/c4-F3/`, `scratchpad/c4-F3-replay/`, and this file.

## Interruption and resumption

The controller session was interrupted at approximately 08:55 EDT on 2026-09-28, before this RETURN.md was
written. On resumption, this seat's scratch directory (`scratchpad/c4-F3/`) was inspected (`ls -la`, a single
non-recursive listing) and found intact and unmodified: eight files (`falsify_cb8.py`, `enum_m1.py`,
`exact_transport.py`, `gsec_literal.py`, `test_n1.py`, `test_n6.py`, `test_n5_full.py`, and `tree_check.py`,
the last written after resumption — see below), all with timestamps at or before the interruption except
`tree_check.py`. This route never invoked `lake`/`lean` (its mechanism is a Python transcription, not a Lean
build), so there was no Lean build to check. A check for background jobs (`jobs -l`) after resumption returned
nothing; no literal PID from before the interruption was polled because none had been started (every command
in this route ran in the foreground). Work resumed and completed: the class-row falsification tests (N5 at
m=107/158, the N7 companion and switch-capacity check, the N7 case-split probe), the tree
(acyclicity/connectivity) check, the copy-out-first replay, and this RETURN.md were all written after
resumption.

## Stage 2 seal

`control/C4-STAGE2-PACKET-MANIFEST.json` (6,084 files): recomputed SHA-256 of the canonical JSON of the
manifest with `seal_sha256` removed (`sort_keys=True`, separators `(",", ":")`, no trailing newline) =
`226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387`, matching the manifest's own
`seal_sha256` field exactly. `file_count` (6084) matches `len(files)` (6084).

## What was read (read-boundary confirmation; no disclosure needed — every read below is inside the granted set)

In order: `control/C4-WORKER-COMMON-BRIEF.md`; `control/C4-STAGE2-PACKET-MANIFEST.json` (seal verified above);
`SEMANTIC-CONTRACT.md`; `SOLUTION-CONTRACT.md`; `control/C4-ALLOCATION.md`; `control/C4-STAGE1-GATE.md`;
`cycles/cycle-4/stage2/ROUTE-STATE.md`; `control/C4-FROZEN-STATEMENTS.lean` and `control/C4-FROZEN-STATEMENTS.md`
in full (both digest-matched by the Stage 2 seal check above and by ruling 23's stated digests). The frozen
statements' companion document quotes its own informal sources (`second-reads/SR-C3-2`, `SR-C3-3`, the Cycle 3
synthesis, the checkpoint, the U adjudication) inline at every node I attack, so I did not separately open
those files — the quoted excerpts were the informal source used for fidelity comparison, exactly as the
companion presents them.

Beyond the control-directory set, this route additionally read, under `sources/` (in-grant; every digest
verified before use, non-recursive `ls` only):
- `sources/c1-results/SOURCE-DIGESTS.json` and `sources/c1-results/runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible/LeanProject/LeanProof/Main.lean`
  (lines 1–270 read in full; digest `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e`,
  matching the record in `sources/c1-results/SOURCE-DIGESTS.json` and independently recomputed — match confirmed)
  for the exact closed forms of `cb8Pb`, `cb8Pc`, `cb8CGamma`, `cb8Theta`, `cb8Sigma`, `cb8Out`, `cb8In`, `cb8R1`
  (entries 2–11), needed to evaluate N5's and N7's numeric claims exactly rather than symbolically;
- `sources/c4-base/SOURCE-DIGESTS.json`, `sources/c4-base/LeanProject/LeanProof/E1FlowConstruction.lean`
  (digest `d26e702bfd0aa3ba9447130475d17591a9ed06db587420270a9730f99d32aab8`, verified) in full, for `cbOpenChokeCount`,
  `cb8R`, `cb8Rho`, `cb8N`, `cb8E1G`, `cb8H`, `cb8E1Val`, `cb8E1Arc`;
- `sources/c4-base/LeanProject/LeanProof/ChokeState.lean` (digest `64a101ef4d08e48e803a39982d58abdeb20397e4e3a90c5591af660a864fd3bb`,
  verified) in full, for `chokeBeta`, `chokeGamma`, `IsSectorSource`, `chokeState`;
- `sources/c4-base/LeanProject/LeanProof/Main.lean` (digest `385af1bf529a6c8e9e136ce87472b9fd6cd51f24ec4976265dbbf7160d62ea3f`,
  verified): entries 1–30 only (grepped for entry-marker lines first, then read lines 1–530), for `C5LA1.support`,
  `C5LA1.leafSet`, `E993Transport.indepFamily`, `tagWitnesses`, `activeWeight`, `favorableLeaves`, `transportRel`,
  `IsSaturatingFlow`, `cbEdge`, `cbGraph`, `cbVertex`. The remaining 12,746 lines of this 13,276-line file were not
  read (not needed for N1/N5/N6/N7's attack surface).

No file outside this list and outside the two boot files was opened. Every `grep` used above targeted one
already-open, already-granted file (never a directory glob, never recursive). `ls` calls were single-directory,
non-recursive, and stayed under `sources/` (in-grant) or this run's own `control/`/`cycles/` paths named in the
dispatch.

## Registered claims touched (named before any census, per common brief item 3)

This route's computations reproduce or exercise: the sector-certificate template of
`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (C1-LA1's `cb8Pb`/`cb8Pc`/`cb8Sigma`/`cb8Theta`/`cb8R1` tables,
`proved_informal`/`computer_assisted` per SEMANTIC-CONTRACT §3); the E1 criterion key
`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (via `cb8Rho`/`cb8R`/`cb8N`,
`proved_informal`); the threshold key `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`
and the favorability key (both `proved_informal` modulo Darroch/Newton — NOT re-derived here, only their closed
forms are evaluated numerically); the fixed-point row `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`
(its `m=95` and `m=107` rows are the SEMANTIC-CONTRACT §5 fixed points reproduced below). No claim in the
`E993-R31-` namespace is proposed by this route (see Alias check).

## Method: what was attacked and how each hypothesis enters

This route's mechanism is direct, independent execution of the frozen definitions — a second Python
transcription, authored without reading or reusing `control/C4-FROZEN-STATEMENTS.md`'s own checker
(`work/check_statements.py`) or its numeric outputs, so that agreement between the two is genuine
cross-instrument evidence rather than the same code checked twice (r30 lesson, binding here).

1. **The graph** (`scratchpad/c4-F3/falsify_cb8.py:cb_adjacency`): `cbGraph(m)` built directly from the frozen
   `cbEdge` disjunction (root–s–v path; `m` chokes on `r`; 8 supports per choke; one private leaf per support).
   `leafSet` is computed as the actual degree-1 vertices (not assumed): this recovers `{v} ∪ {c_ij}` for `m ≥ 1`
   and additionally `{r}` at `m = 0`, which is exactly why N6's `hm : 0 < m` is load-bearing (confirmed below).
2. **`support`/`tagWitnesses`/`activeWeight`** (same file): `support(leaf)` is the leaf's unique graph-neighbour
   (computed, not assumed equal to the semantic contract's stated witness); `tagWitnesses(x) = N(support(x)) \ {x}`.
   Hand-derivation, confirmed by every computational test below: `tagWitnesses(v) = {r}` (since `support(v)=s`,
   `N(s)={r,v}`) and `tagWitnesses(c_ij) = {u_i}` (since `support(c_ij)=b_ij`, `N(b_ij)={u_i,c_ij}`) — this is
   where the semantic contract's stated `W_v = {r}`, `W_{c_ij} = {u_i}` (§2) actually enters: as a two-hop
   consequence of the literal `support` function, not a separate assumption.
3. **`cb8Pb`,`cb8Pc`,`cb8Sigma`,`cb8Theta`,`cb8R1`** (`falsify_cb8.py`): transcribed with `Fraction` exactly from
   C1-LA1's `Main.lean` entries 2–11 (digest-verified above); this is where the sector-certificate's actual
   numeric table enters N5's and N7's tested inequalities.
4. **`cb8R`,`cb8Rho`,`cb8N`** (`falsify_cb8.py`): transcribed from `E1FlowConstruction.lean`; this is where the
   E1 (clone-poset) arc values and the N7 companion identity's two syntaxes enter.
5. **`exact_transport.py`**: computes the COMPLETE, EXACT preimage/image set of any finset under `transportRel`
   without brute-force enumeration of vertex subsets — the (D) direction scans candidate insertions in `O(n)`,
   the (S) direction scans 2-subsets of each source vertex's neighbourhood in `O(deg²)` — so it is tractable at
   the actual class rows (`m = 107, 158`; `n = 1822, 2689`), not just at `m = 1, 2`. Cross-validated against an
   independently-written direct definitional evaluator (`transport_targets` in `falsify_cb8.py`) on ALL 33,573
   independent sets of `CB(8,1)`: 0 mismatches (`falsify_cb8.py`/`exact_transport.py`, replay row "preimage/image
   cross-validation" below).
6. **`gsec_literal.py`**: a literal, independent re-transcription of the frozen `cb8GSec` definition (guard,
   the `i,j` double sum, the `pb`/`pc`/`sigma` indicator branches) — this is where N3/N4/N5's definitional text
   enters exactly as frozen, evaluated on the exact preimage sets from (5).
7. Every class-row test (N5, the N7 companion, the switch-capacity inequality, the N7 case-split probe) uses
   `hm : 107 ≤ m` and `hres : m % 3 = 2` exactly as the frozen statements require; every rank-free test (N1, N6,
   the tree check) is run at `m = 1` (and `m = 0` for the N6 boundary), matching the frozen statements' own
   "any rank"/generic-`m` scope, exactly as the drafter's own checker did.

## Alias check (lexical and mathematical)

No new claim is proposed by this route (no `E993-R31-…` key). Lexical: none of this route's identifiers,
findings or artifact names coincide with any registered key name or with the reserved terminal name
`cb8_topRank_eligible_and_weightedHall` (0 occurrences in this route's files — confirmed by inspection of the
route's own 9 scratch files, all authored in this session). Mathematical: this route does not restate, under a
different name, any of the fences 6 list's refuted mechanisms (forest/tree real-rootedness, the all-families
compression lemma, CHAR at `m=1`, the `m`-independent per-choke certificate) — every claim tested here is a
finite exact identity or a closed-form rational (in)equality, never a real-rootedness or asymptotic argument.

## Instrument sides

For every number reported below, the two independent instruments and the side each computes from:

| Row / claim | Instrument A (side) | Instrument B (side) | Result |
|---|---|---|---|
| N1 B1/B2/B3 (CB(8,1), exhaustive/sampled) | direct definitional filter-cards on the literal `cbGraph(1)` independent-set enumeration (`enum_m1.py`, backtracking, cross-checked against the drafter's reported total 33,573 — independently reproduced) | the frozen statement's own closed-form RHS (`8q`, `16m+2`, etc.), evaluated from the same `B`/`A` | 0 mismatches / 46,754 checks |
| N6 (CB(8,1), exhaustive) | `activeWeight` computed from `tagWitnesses`/`support` (graph side) | the frozen formula `[v,r∈B] + Σ[u_i∈B]·γ_i(B)` (choke-bookkeeping side) | 0 mismatches / 1,048,576 checks |
| N6 at `m=0` | same graph-side `activeWeight` | same formula-side RHS | formula FAILS (2 ≠ 1) at `B={r,v}` — confirms `hm:0<m` is load-bearing, not vacuous |
| N5 census + inflow (`m=107,158`) | exact preimage set of `A` under `transportRel`, filtered to sector sources (`exact_transport.py`, graph/combinatorial side) | `gsec_literal.py`'s literal summation over that exact set, AND separately the closed form `(8-γ)·cb8Sigma(m,γ)` (table side) | set equality + exact value equality, 0 mismatches / 13 class-row cases |
| N7 companion `cb8Rho_one_eq_cb8R1_ratio` | E1 clause-4 syntax: `cb8R`/`cb8Rho` (polynomial-coefficient side, `(1+X)^a(1+2X)^b`) | C1-LA1 syntax: `cb8R1` (direct combinatorial sum side) | exact equality, 15/15 class rows (fresh 158, 164; structural 161; every named control 107,110,113,125,128,131,134,137,140,143,146,152) |
| Switch-capacity `ρ₁γ+(8-γ)σ(γ)≤γ` | `ρ₁` from the C1-LA1/`cb8R1` side | `σ` from the `cb8Sigma`/`cb8Theta` table side | holds, 0 violations / 105 checks (15 rows × γ=1..7) |
| N7 case-split probe (no sector source maps to an r-free,v-free target) | exact preimage set of a constructed r-free target (graph side) | filter for `r,v ∈ B` (definitional side) | 0 sector-source preimages found / 7 (m,q) cases |
| Tree check (`cbGraph(m)` acyclic+connected) | edge count `= Σdeg/2` vs `n-1` (counting side) | BFS spanning-tree reachability + back-edge scan (traversal side) | `is_tree = True` at m=0,1,2,107,158 |

Difference index: not applicable — no `i_{p+1}(T-w) − i_p(T-w)` aggregate or `Δ_k` table is reported by this
route; every row above is a finite exact identity/(in)equality check, not a forward-difference computation.
`x` (the crossing index) is not computed or cited by this route.

## Census / results (0 counterexamples found on every attacked node)

- **N1** (`cbOpenChokeCount_le`, `cb8_rFree_deletionClasses`, `cb8_rFree_insertionClasses`, `cb8_nonChokeInsert_weight`):
  0 failures on CB(8,1) — B1/B2 exhaustive over every r-free independent set (20,451 sets each), B3 (no
  independence hypothesis in the frozen text) over 126,418 sampled + exhaustively-small `(A,z)` pairs.
- **N6** (`cb8_activeWeight_leafSet_eq`): 0 failures over ALL 1,048,576 finsets of CB(8,1) (the frozen statement
  has no independence hypothesis — tested accordingly, including sets containing `s`, adjacent pairs, and other
  non-independent configurations). At `m=0` the formula genuinely fails, confirming `hm:0<m` is necessary.
- **N5** (`cb8_sector_switchPreimages`, `cb8GSec_switchImage_inflow`): 0 failures at the true class rows
  `m=107,158`, using EXACT (not sampled) preimage sets: every `γ=0..8` one-choke-`v` case (set equality AND
  exact rational inflow value), the one-choke-no-`v` case, and the two-choke case (both correctly zero).
- **N7** companion `cb8Rho_one_eq_cb8R1_ratio`: exact equality at all 15 rows named by gate ruling 27 (fresh,
  structural, controls). The synthesis-cited switch-capacity composition `ρ₁γ+(8-γ)σ(γ)≤γ` (which N7's proof
  must establish by chaining C1-LA1's already-formally-verified Switch/Residual with this companion) holds at
  every tested row and `γ`.
- **N7 case-split structural probe**: confirms, at `m=107,158` and several `q`, that no sector source's literal
  arc ever lands on an r-free, v-free target — i.e. `g_sec` and `cb8E1Arc`'s domains do not silently overlap or
  leave a target class uncovered in the way this route could detect with exact (not sampled) preimages. This is
  evidence toward N7's case-split being complete, not a proof of completeness (only 7 `(m,q)` instances tested,
  not all `q ≤ m`).
- **Fixed points** (SEMANTIC-CONTRACT §5), reproduced independently and exactly before any table above was
  reported: `CB(8,107)/572`: `n=1822, α=964, θ*=96/766193`. `CB(8,95)/508`: `n=1618, α=856, θ*=96/604265,
  ρ₁=1354839571516225/1361543988640524, σ(1,2,3)=96/4229855, 32/604265, 288/3021325`. All match exactly.
- **Tree check**: `cbGraph(m)` is connected, acyclic, with exactly `n-1` edges at `m=0,1,2,107,158`.
- **Mutation controls** (confirming the checkers are not vacuous): dropping N6's `[v,r]` term causes 262,144/
  1,048,576 failures; replacing N5's `8-γ` with `7-γ` causes 7/7 failures. Both checkers have "teeth".

No counterexample to any frozen N1/N5/N6/N7 statement was found. No `sorry` was discharged (this route ran no
`lake`/`lean` build).

## Grades

Every grade below is this route's own assessment of what it did — it does not, and cannot, change the grade of
any frozen statement (still `sorry`, ungraded until a governed award closes) or any carried key (SEMANTIC-CONTRACT
§3, unchanged by this route). This route's contribution is `bounded_computation`: exact, deterministic,
finite/constructed-instance checks that neither prove nor refute a universal statement (SOLUTION-CONTRACT §4,
fence 7 — "census discipline"). The carried C1-LA1 tables used here remain at their recorded grade
(`computer_assisted`/`proved_informal` per SEMANTIC-CONTRACT §3), cited, not re-proved.

## headline_resolved

`headline_resolved: no`

## Route verdict

`bounded_evidence`

## Gate lines (ruling 32)

`COND4_formal: no` (this route compiled nothing; conjunct 4 remains open)
`E1_formal: no`
`TERMINAL_integration: no`
`cut_candidate: no` (no deficient cut found; only confirmatory evidence on N1/N5/N6/N7 and the N7-adjacent
switch-capacity/case-split checks)
`FROZEN_NODES_CLOSED: none`

## Remaining obligation

For a successor: N1, N5, N6 and N7 (companion + composition) survived independent, exact, class-row Python
falsification with 0 counterexamples across every instance this route constructed — this is evidence the
frozen texts are faithful to their informal sources, but it is NOT a substitute for the actual Lean proofs
(still `sorry`), which remain T1/U1 (N1), T3 (N4/N5), U2 (N6/N7) obligations per `cycles/cycle-4/stage2/ROUTE-STATE.md`.
Two concrete items a successor should pick up:
1. This route's `exact_transport.py` (exact, non-brute-force preimage/image computation at full class scale,
   validated against an independent definitional evaluator) is reusable by F2's mandatory composed-flow check
   at fresh rows 158/164 and structural row 161, and by any T/U seat wanting an exact (not sampled) ground truth
   at class rows without paying for full independent-set enumeration.
2. The N7 case-split completeness probe here covered only 7 `(m,q)` instances at `q ∈ {1,2,5,50}`; a successor
   with more budget could sweep `q = 1..m` exhaustively at one or two rows (the padding-construction helper in
   `test_n5_full.py`/`run_all.py` runs out of capacity above roughly `q ≈ m − 8`, a construction artifact fixable
   by drawing padding from BOTH open and to-be-closed chokes rather than only the latter) to strengthen this
   evidence, or — more valuably — to look specifically for a target class this route's structural argument
   (§ Method item 7 reasoning: a sector source changes exactly one vertex per step, so it can only reach
   in-sector, one-choke-switch, or explicit-zero targets) might have mis-stated.

## Process disclosures

1. **Tools.** Every computation ran as foreground `python3 -B` (no `lake`/`lean`; this mechanism needed none).
   No background job was started by this route (nothing to poll or kill, before or after the interruption). No
   process listing was run at any point (only `ls`, `jobs -l`, and `python3` invocations). No network, no
   package installs.
2. **Injected context.** The harness placed this project's `CLAUDE.md`, the user auto-memory index/content and
   the user's e-mail into context before the first tool call, and again (re-read, per a system notice) partway
   through this session. This route did not open, cite, or act on any of that content; the dispatch's restricted
   boot and single-write-location instructions supersede it, exactly as the frozen-statement drafter noted for
   the analogous situation in its own return.
3. **Writes.** Only `scratchpad/c4-F3/` (8 files), `scratchpad/c4-F3-replay/` (9 files, copy-out-first plus this
   route's consolidated replay driver `run_all.py`), and this `RETURN.md` were written. No source file, sealed
   member, or file outside those three locations was modified.
4. **Interruption.** Recorded above under "Interruption and resumption".

## IMPORT LIST (every script; standard library only)

`itertools`, `hashlib`, `json`, `sys`, `fractions.Fraction`, `math.comb`, `collections.deque`, `random`.

## Replay (copy-out-first; run from the replay directory, never `/tmp`)

```sh
cd "/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c4-F3-replay"
python3 -B run_all.py     # -> MASTER_DIGEST_SHA256: 4ad0c6f428c8371eb4ba3088216083f8ed95201b927878b47e9437129e7476fe
python3 -B tree_check.py  # -> digest: 3527a38bda398c1d62f7b775d55b05dfcbd7d06fda6ddede804fc76e67de44bd
```

## Artifact inventory (SHA-256; every literal below copied from this session's own `hashlib`/hash tool output)

| Path (run-root relative) | SHA-256 | Bytes | Role |
|---|---|---|---|
| `scratchpad/c4-F3/falsify_cb8.py` | `620ef19340b72b85717c1bb07aece09bea7979c6306184c625f09642eba50fe8` | 9571 | graph, `activeWeight`, C1-LA1 tables, `cb8R`/`cb8Rho`/`cb8N` |
| `scratchpad/c4-F3/enum_m1.py` | `77902a1b9b4c0da489894b3a6d1ce91c9c37f351cfec8975bde3214c93a1c838` | 1126 | exhaustive independent-set enumeration (CB(8,1), backtracking) |
| `scratchpad/c4-F3/exact_transport.py` | `4fb65fb770e893e1a46f2d6351fcb57e43d808d0ab32e0ca42dcf9dc752fce41` | 4320 | exact preimage/image computation at full class scale |
| `scratchpad/c4-F3/gsec_literal.py` | `2e437fd99405b1d4829383f223fd11f4350e26cf5db21420b0b543cfc5925aad` | 1913 | literal re-transcription of the frozen `cb8GSec` |
| `scratchpad/c4-F3/test_n1.py` | `1c49a7c7b33202aeb1c1b30e6354d031d7255ac023bf54505e28fde92eae4c72` | 5627 | N1 falsification (B1/B2/B3) |
| `scratchpad/c4-F3/test_n6.py` | `bcba05c223c862ff6b33e8382b8d092411da0ae68ff2dbea5df405de49ba4541` | 1465 | N6 exhaustive falsification (all finsets) |
| `scratchpad/c4-F3/test_n5_full.py` | `4a3eb9ee471c3aab8b708b815ad6d543e889fc454b15753013dcb7eb48d2b308` | 5822 | N5 exact class-row falsification |
| `scratchpad/c4-F3/tree_check.py` | `49b132a487fad8fc55b0b708ed72087feaa48b01c1e619123d6c455b898fb6f1` | 1316 | acyclicity/connectivity check |
| `scratchpad/c4-F3-replay/run_all.py` | `7521f1a323e024b176bde92817b79d09962b49a81e4cfc64cb5e565759b42c41` | 6125 | consolidated replay driver (all of the above + N7 companion/switch/probe + mutation controls) |
| `scratchpad/c4-F3-replay/*` (other 8 files) | identical to the `scratchpad/c4-F3/` copies above | — | copy-out-first replay set |

Background jobs: none started, none to finish or kill, before or after the interruption.

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5
