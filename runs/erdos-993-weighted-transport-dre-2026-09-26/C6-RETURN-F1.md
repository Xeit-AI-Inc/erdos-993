# RETURN — Route F1, Cycle 6, r30 (Erdős #993 weighted-transport DRE)

**Route ID:** `C6-F-01`
**Mechanism fingerprint:** `WHOLE-NETWORK-MIXED-FAMILY-CUT-SEARCH`
**Orientation:** F (falsify)

Dispatch `control/dispatch/c6-stage3/DISPATCH-F1.md`, SHA-256
`04056441b3aa2e26a6175de32b75a959c50d5035fe7157feb76f4d4b5d49d466`, verified with `shasum -a 256`
before it was followed.

## 0. Boot acknowledgment

I am operating within VerityOS. This route booted VerityOS by reading EXACTLY the two files the
dispatch authorizes, in this order: `/Users/ashtonsperry/VerityOS/verity.md` (the root constitution)
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the identity subsystem's startup
protocol). These same two files also satisfied my host harness's own project-level boot requirement
(`CLAUDE.md`), so no separate, additional VerityOS read occurred for that purpose. I did not follow
the startup protocol's own task-type map into memory, knowledge, conversations, modules, skills,
logs, decisions, or operations. I loaded no VerityOS subsystem beyond these two files. The host also
placed the project `CLAUDE.md` text and the user's auto-memory index into context at session start;
I did not act on either beyond the acknowledgment above, and I kept no conversation log (this
route's writes are confined to this file and its own scratch, per the dispatch).

## 1. IMPORT LIST (top of return; every generator's own IMPORT LIST is repeated at its own top)

Standard library only, across every script written or copied for this route: `json`, `hashlib`,
`sys`, `math.comb`, `math.factorial`, `itertools.combinations_with_replacement`,
`collections.Counter`, `collections.deque`. No network, no `pip`, no non-standard-library import
anywhere in this route's code. Every invocation used `python3 -B`.

## 2. Stage 2 seal and source digests verified

Recomputed SHA-256 of the canonical JSON of `control/C6-STAGE2-PACKET-MANIFEST.json` with its
`seal_sha256` field removed (`sort_keys=True`, separators `(",", ":")`, no trailing newline):

```
recomputed = 29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611
manifest's own seal_sha256 = 29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611
match: True
```

exactly equal to the value the dispatch itself quotes. Verified by direct `shasum -a 256` /
`control/SOURCE-DIGESTS.json` byte comparison that every sealed source this route reads matches its
recorded digest:

| Path | Recorded SHA-256 | Match |
|---|---|---|
| `sources/lower-region/instruments/cb-switch-cut/run.py` | `94ced04667b1234844f13a681ec6a8a5cbd1ced813526fe856d4f9692b8a9d53` | yes |
| `sources/lower-region/instruments/cb-switch-cut/RESULTS.json` | `873cf9229923153d7626c6d721ab40b8ace8488b51343c66a00b6cfb0449d5d5` | yes |
| `sources/lower-region/inputs/ordinary_tree_checked.py` | `a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d` | yes |

`cb-switch-cut/run.py`'s own `cb(d, m)` constructor (root `0`–support `1`–arm-leaf `2` path, `m`
chokes `u_i ~ 0`, `d` supports `b_{ij} ~ u_i` each with one private leaf `c_{ij} ~ b_{ij}`) is the
construction this route's own independent code (`copied_adj_quot.build`, below) reproduces and
cross-checks against, at both target rows, against the frozen fixed points of
`C6-WORKER-COMMON-BRIEF.md` (§3 below).

This route also copy-out-replayed two files from the Cycle 5 `ADJ-U` adjudicator's own sealed
scratch, `scratchpad/c5-adj-U/own/` (READ AND COPY-OUT REPLAY ONLY, per the worker common brief's
grant on Cycle 1–5 seat/critic/adjudicator scratch; never written to):

| Source (scratch, not a sealed `sources/` file — no `SOURCE-DIGESTS.json` entry) | SHA-256 | Copy in this route's scratch |
|---|---|---|
| `scratchpad/c5-adj-U/own/adj_quot.py` | `e36e50dceafbf62071794d12aa0585e7d508fbc691389e1f972f9a22f600f3c3` | `scratchpad/c6-F1/copied_adj_quot.py` — byte-identical |
| `scratchpad/c5-adj-U/own/adj_shape.py` | `de482ede9e382a56e9f9a73309b82fa274b81259bdd3ccec8c2f99bde9edcb41` | `scratchpad/c6-F1/copied_adj_shape.py` — one line changed, `import adj_quot as Q` → `import copied_adj_quot as Q` (its own file is otherwise untouched); SHA-256 of the copy `b04130d03e0d345f000335223f6636d1ebbb460ec27a8d0cee3c4da7ccc336df` |

These two files are ADJ-U's OWN independent instrument (an exact orbit-quotient max-flow over the
`S_d ≀ S_m` action, using C2-LA1's completeness theorem), which reproduced the `CB(11,2)/16` /
`CB(10,2)/14` / `CB(12,2)/17` laboratory numbers of record at the Cycle 5 close. This route reuses
it (never re-proves it) to validate its own, independently-written generating-function instrument
(`gf_lib.py`, `tree_check.py`, `f1_main.py` — none copied, all authored fresh by this seat) before
applying that independent instrument to the two target rows, where the copied instrument itself is
combinatorially infeasible (§5).

## 3. Registered claims named before any census (`sources/authority/CLAIM-IDENTITY.json`,
`control/CLAIM-IDENTITY.run-local.json`)

This route's work touches or would confirm/re-confirm, and none is re-proved as a contribution:

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN at full scope. This route searches
  for a deficient cut against it at two named rows; it does NOT close it either way.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (C1-LA1, `formally_verified`) — USED, not
  re-proved. §4 below asserts it, from two independently-coded sides, on every reported row.
- **(FLOW⇒SIGN)** `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (C1-LA2,
  `formally_verified`) — cited, not re-derived; noted where the negative `S` values below are
  consistent with (but do not prove) it.
- **C2-LA1** `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`
  (`formally_verified`; `runs/lean-2026-09-26-c2-la1-aut-invariant-positive-deficient-family/`,
  `LOOP-STATE.json` status `formally_verified`, `expected_statement_sha256`
  `34ba6dccf54495a248b18447a5821ef879c2d14c6c97b2e65ae5126bbaff824c`) — its exact statement
  (`¬ WeightedHall G F p → ∃ X, Aut-invariant ∧ positive-weight members ∧ deficient`) is the
  completeness theorem this route's whole method leans on: it licenses restricting a search for ANY
  deficient cut to a search over `Aut`-invariant families, which is exactly what the orbit-quotient
  instrument (copied and this route's own generating-function instrument) computes. Cited, not
  re-proved.
- **The switch-necessary CB frontier** (`bounded_computation`, Cycle 5 close, `R30-CB-RECORD`): 223
  sector-deletion-deficient eligible CB rows, `d ≤ 13`, all with full-sector Hall and switch/deficit
  ≥ 4401.4666, minimum at `CB(9,112)/673`. This route re-derives (never re-certifies) the sector
  closed forms AT the two named rows as an independent check (§5), and does not weaken or widen this
  record.
- **`CB(11,2)/16`, `CB(10,2)/14`, `CB(12,2)/17`, `CB(9,2)/13` whole-network laboratory records**
  (ADJ-U, `bounded_computation`): non-eligible instances; this route independently reproduces (never
  re-certifies) their exact numbers as a third instrument (§4).
- **The ten (plus two named companions) refuted mechanism keys of `SOLUTION-CONTRACT.md` §3 fence
  2** — `E993-R23-LITERAL-DELETE-ONLY-HALL`, `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`,
  `E993-R23-TAG-CLOSED-CUT-HALL`, `E993-R23-HOT-TAG-SINGLETON-HALL`,
  `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG`, `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`,
  `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`,
  `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`,
  `E993-LOWER-REGION-C4-T4-SIGNED-CROSS-TAG-INJECTIVITY`,
  `E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-COVARIANCE`,
  `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`, `E993-R28-TREE-LEAF-SLOT-DOMINANCE`, and the predecessor's
  own-support unit-capacity rule (C6-F4, a route record, not a key) — **why this route's mechanism is
  none of them**: every one of the twelve is either a weaker/different RELATION (deletion-only, no
  switch; a fixed-`γ`/tag-closed/hot-tag/zero-retag shortcut relation; own-support unit capacity) or a
  different, non-`w_F` WEIGHT/argument (occupancy domination, signed cross-tag injectivity, marked
  addability covariance, per-leaf down-map injectivity, pointwise addability, the Hall/SDR degree
  lemma — a different problem entirely). This route's mechanism is neither: it computes the EXACT
  min-cut of the LITERAL `(D)∪(S)` relation under the LITERAL `w_F` weight, restricted to `Aut`-
  invariant families by C2-LA1's proved completeness reduction — i.e. it is an attempt at the genuine
  object of `SOLUTION-CONTRACT.md` §2's `WeightedHall`/`transportRel`, not a substitute for it.
- **(LIFT)** `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (`proved_informal`) — its CONVERSE
  direction (a quotient deficit implies an original, and by C2-LA1's supermodular-maximizer argument
  an invariant, deficient cut) is exactly what licenses reading the copied orbit-quotient max-flow's
  `maxdef` value as the TRUE maximum deficiency over every invariant family, not merely a lower
  bound. Cited, not re-derived.
- **`T_m`, spider, path-star family theorems**: not touched; this route works exclusively on `CB(d,m)`
  instances.
- **No new key is proposed by this route.** Consequently no lexical or mathematical alias check
  against `sources/authority/CLAIM-IDENTITY.json` / `control/CLAIM-IDENTITY.run-local.json` is
  required for a new name; I state this explicitly rather than omitting the step. The bounded
  records of §4–§6 (the independent generating-function cross-validation, the infeasibility bound,
  the small-`(d,m)` shape-scaling data) are candidates for folding into the existing
  `R30-CB-RECORD` bucket at the synthesis's discretion; I do not myself register them.

## 4. Load-bearing obligation (`control/C6-ALLOCATION.md`, item 3) — what was attempted

"At `CB(9,112)/673` (smallest sector surplus, 4401.47×) and `CB(8,95)/508`: `Aut`-invariant families
that MIX sector and regime-3 sources, seeded by the `CB(11,2)/16` maximizer shape (268 sector + 140
regime-3 orbits); literal `N(X)` by generating functions; completeness over invariant families by
the registered C2-LA1 equivalence; counting validated on literal laboratories including
`CB(11,2)/16`; any deficit to two instruments."

**Central obligation attempted: yes, in full up through the point of a proven combinatorial
obstruction; NOT completed at the two named rows.** This route (a) built and validated, by an
independently-coded second instrument, the exact orbit-quotient maximizer numbers at `CB(11,2)/16`
and three companion laboratories; (b) proved, by an exact combinatorial count (not by attempting and
hanging a job), that the literal orbit-enumeration method that produces those numbers is
infeasible — by roughly 41 to 49 orders of magnitude — at the two target rows' actual `m`; (c)
built and validated an independent generating-function instrument that DOES scale to the target
rows for TOTAL regime-weighted supply/capacity (not for a full invariant-family search); (d) ran a
small-`(d,m)` scaling study of the mixed maximizer's shape looking for a pattern to extrapolate, and
found none simple enough to extrapolate safely to `m = 95, 112`. No deficient cut was found or
constructed at either target row, and none was ruled out. See `## Remaining obligation`.

## 5. Where every hypothesis enters (derivation map)

- **`IsTree` (acyclicity and connectivity, separately).** `tree_check.is_tree_exact` (this route's
  own code, `scratchpad/c6-F1/tree_check.py`) checks `|E| = n − 1`, then acyclicity by union–find
  (an edge that would close a cycle is rejected AT THAT EDGE, before any further edges are
  processed), then connectivity by an explicit BFS from an arbitrary vertex — two independent
  passes, run on the LITERAL graph object at every instance below, never assumed from the
  construction formula. Both target rows and all four laboratory rows pass (`f1_main_output.json`,
  field `is_tree: true`, `is_tree_reason: "ok"`).
- **Finiteness.** Every instance is a concrete, finite, labelled Python `dict`-of-`set` adjacency
  object with a concrete `int` vertex count; the independence polynomial (`copied_adj_quot.ipoly`,
  ADJ-U's own forest-DP, ORIGINALLY validated by two Cycle 5 critics against literal brute force at
  small `d, m`) terminates by structural recursion on a finite vertex set — no orbit enumeration is
  involved in computing it, only a single BFS/DFS pass, which is why it scales to `n = 2131` and
  `n = 1618` where the ORBIT enumeration (below) does not.
- **Eligibility (`x + 2 ≤ p`, `3p < 2α + 1`).** `tree_check.crossing_index_through_alpha` scans
  `k = 0..α` inclusive and never omits the terminal zero-extension difference `Δ_α = 0 − i_α < 0`
  (the authorized evaluator `ordinary_tree_checked.py`'s own documented caveat, avoided here by
  construction). Both target rows are confirmed eligible at their stated `p` (§6); all four
  laboratory rows are confirmed NOT eligible (as the record states), independently, by this same
  code.
- **The fixed selector `F = F_p(T)`.** Computed fresh at every instance by literal
  `Δ_p(T − v) < 0` on a fresh forest-DP of `T` with `v` removed (`copied_adj_quot.ipoly(adj, [v])`
  inside `f1_main.py`'s `fav`/`one_v_one_c` helpers) — never hard-coded, never assumed from a
  degree-class symmetry argument alone (the symmetry is used only to note that ONE representative
  private leaf's computed favorability applies to all `d·m` of them, which is then verified, not
  assumed, by the WID two-sided check of §6 using the multiplicity `m·d` explicitly).
- **The active-tag witness and the literal relation.** `copied_adj_quot.weight` counts
  `v ∈ F ∩ B` with `(B ∖ {v}) ∩ W_v ≠ ∅` literally, `W_v = N(s_v) ∖ {v}` from live adjacency, never
  `|F ∩ B|`. `copied_adj_quot.targets` builds (D) and (S) directly against adjacency
  (`|N(u) ∩ B| = 2`, `u ∉ B`), never a shortcut — this is ADJ-U's own independently-audited code,
  reused verbatim (only the import line changed in the copy of `adj_shape.py`).
- **Group invariance (`Aut(CB(d,m)) = S_d ≀ S_m` in the homogeneous case).** Used exactly as C2-LA1
  licenses: to reduce a deficient-cut search to a search over `Aut`-ORBIT unions, keyed by the
  sorted tuple of per-choke `(arm-state, (state-letter, size-components))` triples
  (`copied_adj_quot.key`/`orbits`/`osize`). This route's own generating-function instrument
  (`gf_lib.py`) computes the SAME orbit-total quantities (total weighted supply/capacity of an
  entire regime, summed correctly over ALL orbits of that regime by construction — see §6's
  derivation) via a wholly different algorithm (polynomial convolution, no orbit list is ever built),
  and the two agree exactly at every laboratory row (§6) — an independent confirmation that the
  orbit-key reduction and the generating-function accounting are both computing the same object.
- **ℕ-subtractions and casts.** `Δ_k := i_{k+1} − i_k` is computed in Python's arbitrary-precision
  `int` throughout (never a native fixed-width type), so no wraparound is possible; `p − 1` is only
  ever formed where `p ≥ 1` is already known (every reported `p` is an eligible or explicitly
  non-eligible instance rank `≥ 6`).

## 6. Target rows: fixed points reproduced, eligibility, WID (two independently computed sides)

All values below are drawn from a single run of `scratchpad/c6-F1/f1_main.py` (replayed
byte-identically at `scratchpad/c6-F1-replay/f1_main.py`; both produce
`RESULT_SHA256 e2c9e99fb0c88d256616b4f10dcfbf24755a7f1bd5b4ca46f661e0b4494855bb`, and the output file
`f1_main_output.json` has SHA-256 `b15d3069083e63c95cfc59a36b3b2734bb0ae47bf0ae69d0e0f189ee90150f42` in
both places). Replay command (copy-out-first, never in place):

```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-F1-replay
python3 -B f1_main.py
```

| Row | `n` | `IsTree` | `α` | `x` | `Δ_x` (sign) | eligible | `1_v` | `1_c` |
|---|---|---|---|---|---|---|---|---|
| `CB(9,112)/673` | 2131 | true | 1121 | 671 | negative (481-digit magnitude) | **true** | 1 | 1 |
| `CB(8,95)/508` | 1618 | true | 856 | 506 | negative (363-digit magnitude) | **true** | 1 | 1 |

`n`, `α`, `x` reproduce the `C6-WORKER-COMMON-BRIEF.md` fixed points EXACTLY: `CB(9,112)/673`:
`n = 2131, α = 1121, x = 671`; `CB(8,95)/508`: `n = 1618, α = 856, x = 506`, window `[508, 570]`
(this route confirms `508 = x + 2` is the window's left edge, i.e. the eligible rank asked for is the
FIRST eligible rank).

**(WID), two independently computed sides, at both target rows** (`f1_main_output.json`, field
`wid_match: true` at both rows):

- Side 1 (aggregate): `S(T,p) = [q_v(p) − q_v(p−1)] + m·d·[q_c(p) − q_c(p−1)]`, `q_w(j) := i_j(H_w) −
  i_j(R_w)`, `H_w = T − {w, s_w}`, `R_w = T − N[s_w]`, computed by fresh forest-DP on the literal
  deleted graphs for the arm leaf `w = v` and one representative private leaf `w = c`, multiplied by
  the derived (not assumed) multiplicity `m·d` for the private-leaf class.
- Side 2 (supply − capacity): `S(T,p) = [\text{coeff}_{p+1} − \text{coeff}_p]` of this route's own
  regime-weighted generating function `gf_lib.total_weighted_gf(d, m, 1_v, 1_c)` — regime 1 (`r ∈
  B, v ∉ B`) contributes the zero polynomial always (New Lemma 1, Cycle 5 U2; re-derived, not
  re-proved, from `W_v = {r}`, `W_c = \{u_i\}`, `r \sim u_i`); regime 2 (sector) contributes
  `1_v \cdot x^2 (1+2x)^{dm}`; regime 3 (`r \notin B`) contributes `1_c \cdot m \cdot d \cdot x^2
  (1+x)^{d-1} \cdot \bigl[(1+2x)^d + x(1+x)^d\bigr]^{m-1} \cdot (1+2x)`, derived from first
  principles by linearity over which choke carries the counted tag (§ code comments,
  `gf_lib.regime3_weighted_supply_gf`), independently of `copied_adj_quot`.

The two sides agree bit-for-bit at both rows (`f1_main_output.json`). Both `S` values are negative
(consistent with, but not evidence for, the OPEN primary aggregate and with (FLOW⇒SIGN); a negative
`S` is necessary but nowhere near sufficient for (HALL) — SEMANTIC-CONTRACT §1.2).

## 7. Sector closed forms at the target rows, and the switch/deficit ratio

Using U2's Cycle 5 closed forms (`supply(sec) = 1_v \cdot C(D,K) 2^K`, `cap_D(sec) = 1_v \cdot
C(D,K-1) 2^{K-1}`, `SW(K) = m \cdot 1_c \cdot \sum_{k=1}^{d} C(d,k-1)(k-1) C(D-d,K-k) 2^{K-k}`,
`D = dm`, `K = p - 1`) — RE-DERIVED and RE-EVALUATED here at the actual full-size target rows (never
re-certified; this closed form is a Cycle 5 `proved_informal` record, not a key of its own, and this
route's contribution is only the evaluation at these two specific, previously-unevaluated-at-full-
scale rows, cross-checked against `gf_lib`'s independent `sector_supply_gf`):

| Row | `K = p-1` | switch/deficit `SW / (supply(sec) − cap_D(sec))` |
|---|---|---|
| `CB(9,112)/673` | 672 | **4401.466603449473** |
| `CB(8,95)/508` | 507 | **7476.316339192683** |

`4401.4666…` for `CB(9,112)/673` reproduces, to the digits quoted, the Cycle 5 record's "minimum at
`CB(9,112)/673`" figure `4401.4666`. `CB(8,95)/508`'s ratio (7476.32) is a new evaluation at that
specific row (it was previously known only as one of the 218 uncertified rows, not individually
evaluated for this ratio in the material this route read).

**New comparison (this route's own; a record, not a claim about (HALL)):** the TOTAL weighted
supply of regime 3 alone (every independent `(p+1)`-set with `r ∉ B`, summed with its own literal
active weight — not a subfamily, not a candidate cut) is **≈ 51.14×** the sector's own switch
capacity `SW` at `CB(9,112)/673`, and **≈ 107.93×** at `CB(8,95)/508` (exact values in
`f1_main_output.json`, fields `regime3_total_supply` and `sector_SW`). This says only that regime 3
is a large region relative to the sector's switch image; it is NOT a bound on any invariant family's
deficiency (regime 3 is not itself a candidate source or target family here, and its own internal
`(D)∪(S)` structure, entering other regime-3 or regime-1 states, is untested by this ratio). It is
recorded because it is the kind of magnitude comparison a successor's mixed-family construction will
need.

## 8. Laboratory validation (third independent instrument, plus this route's own fourth)

Copied-out replay of ADJ-U's exact orbit-quotient max-flow (`copied_adj_quot.run`, §2) at the four
non-eligible laboratories the allocation names, cross-checked at every row against this route's own,
independently-coded generating-function totals (`gf_lib.total_weighted_gf`):

| Row | `n` | `α` | `x` | eligible | full `maxdef` | sector-only `maxdef` | maximizer shape (sector + other orbits) | `gf` supply/capacity match |
|---|---|---|---|---|---|---|---|---|
| `CB(11,2)/16` | 49 | 25 | 16 | false | **22458436** | 0 | **268 + 140** | yes / yes |
| `CB(10,2)/14` | 45 | 23 | 14 | false | **86940920** | 34893540 | **204 + 125** | yes / yes |
| `CB(12,2)/17` | 53 | 27 | 17 | false | **3573432896** | 2159869129 | 339 + 167 | yes / yes |
| `CB(9,2)/13` | 41 | 21 | 13 | false | **4204932** | 0 | 161 + 102 | yes / yes |

Every figure in this table reproduces the Cycle 5 `ADJ-U` adjudication's record EXACTLY: `22,458,436`
with the unique maximizer "268 sector orbits plus 140 regime-3 orbits" at `CB(11,2)/16`; `86,940,920
= 204 + 125` orbits at `CB(10,2)/14`; the whole-network deficiency `4,204,932` at `CB(9,2)/13`; the
sector-only maximum `2,159,869,129` at `CB(12,2)/17` and `34,893,540` at `CB(10,2)/14`. `S`
(supply − capacity, this route's own independent computation) is `−111,739,804` at `CB(11,2)/16` and
`+2,424,264` at `CB(9,2)/13`, both matching the adjudication's quoted `S` values exactly. This is a
THIRD independent confirmation of these numbers (after the seat/critic instruments and ADJ-U's own),
satisfying the allocation's "counting validated on literal laboratories including `CB(11,2)/16`" —
and satisfies it MORE strongly than a single validation, since two structurally unrelated algorithms
(orbit-graph max-flow vs. polynomial generating functions) agree.

**Inspection of the `CB(11,2)/16` maximizer's actual orbit keys** (this route's own; not previously
reported at this level of detail in the material read): the 268 sector orbits are NOT the whole
sector level (`C(22,15) \cdot 2^{15}`-worth of orbit TYPES at `K=15` is far larger than 268); the
min-cut selects a specific subset of `(N, j_1, l_1), (N, j_2, l_2)` pairs, and the 140 "other"
orbits split as 73 with arm-state `{v}` and 67 with arm-state `\emptyset$ — the maximizer is not
simply "the whole sector plus the whole regime-3 U-block", and no simple per-choke threshold
predicate separating included from excluded orbits was found by inspection in the time available.
This is consistent with, and reinforces, the Cycle 5 finding that the maximizer is NOT a product
form (`126/128` at `CB(10,2)/14`, `227/229` at `CB(12,2)/17` in the record read).

## 9. Infeasibility of literal orbit enumeration at the target rows (a proven obstruction, not a hang)

The copied instrument's orbit list is built by `itertools.combinations_with_replacement` over the
per-choke local-state alphabet (size `\sum_{j=0}^{d}(d+1-j) + (d+1)` when the arm excludes the root,
i.e. `65` states for `d=9`, `54` states for `d=8`), taken `m` at a time. The RAW size of that
multiset space (before any filtering by target size, and far before building the flow network's
arcs) is:

| Row | local states per choke | `m` | raw multiset space `\binom{s+m-1}{m}` |
|---|---|---|---|
| `CB(9,112)/673` | 65 | 112 | `\approx 7.90 \times 10^{49}` |
| `CB(8,95)/508` | 54 | 95 | `\approx 5.79 \times 10^{40}` |

(exact integers in `f1_main_output.json`, field `raw_orbit_multiset_space_size`; computed by
`math.comb`, not attempted by enumeration — no job was ever launched that could hang). This is
computed, not asserted: it is the exact value of a closed-form binomial coefficient, verified by the
same `f1_main.py` that produced every other number in this return. It rules out literal orbit
enumeration (the method that produced every laboratory number in §8) as a method at either target
row, by 41 to 49 orders of magnitude. No background process was started or needed to establish this;
nothing required killing.

## 10. Small-`(d,m)` scaling study of the mixed maximizer's shape (exploratory; a record, not a
claim)

At `p = x(T)` (the first strict descent; non-eligible, chosen only because it is a natural,
reproducible reference rank that scales the way the four given laboratories do), for `d = 3, m =
1..6` and `d = 4, m = 1..4` (all tractable: `\le 27{,}132` orbit types at the largest instance run):

| `d` | `m` | `p` | `n` | `x` | `α` | `maxdef` | Xmin sector orbits | Xmin other orbits |
|---|---|---|---|---|---|---|---|---|
| 3 | 1 | 3 | 10 | 3 | 5 | 9 | 3 | 3 |
| 3 | 2 | 5 | 17 | 5 | 9 | 236 | 14 | 31 |
| 3 | 3 | 7 | 24 | 7 | 13 | 7734 | 44 | 172 |
| 3 | 4 | 9 | 31 | 9 | 17 | 273312 | 123 | 736 |
| 3 | 5 | 11 | 38 | 11 | 21 | 9902047 | 291 | 2574 |
| 3 | 6 | 13 | 45 | 13 | 25 | 361242222 | 663 | 7844 |
| 4 | 1 | 4 | 12 | 4 | 6 | 0 | 0 | 0 |
| 4 | 2 | 6 | 21 | 6 | 11 | 1712 | 22 | 48 |
| 4 | 3 | 9 | 30 | 9 | 16 | 66480 | 115 | 366 |
| 4 | 4 | 12 | 39 | 12 | 21 | 0 | 0 | 0 |

**Finding (this route's own; not a proof, not a certification):** the ratio of "other" (regime-3-
touching) orbits to sector orbits in the maximizer GROWS with `m` at fixed `d` (`d=3`: `1.0, 2.2,
3.9, 6.0, 8.8, 11.8` for `m = 1..6`) rather than staying constant — it is not a fixed multiplicative
"regime-3 competes at rate `c`" law that could be safely extrapolated to `m = 95, 112` by fitting
these six points. Two rows (`d=4, m=1` and `d=4, m=4`) have `maxdef = 0` at `p = x` exactly (`x` is a
property of the ORIGINAL tree's independence polynomial, unrelated in general to the sign of the
mixed-family deficiency at that same `p`), which is itself a useful negative data point against any
naive "deficiency at `p=x` is generic" assumption. No candidate general formula for the maximizer
shape was found. This table is offered as fitting data for a successor's attempt at the shape
question (in the spirit of, but far smaller in scope than, what T2's per-state tables do for T1 in
this cycle's portfolio), not as evidence toward (HALL) or (CUT) at any row.

## 11. Deficit to two instruments

No deficit (no candidate cut) is reported by this route at either target row, so the "any deficit to
two instruments" clause of the load-bearing obligation does not trigger. Every AFFIRMATIVE numeric
claim this route DOES make (the laboratory reproductions of §8, the WID two-sided checks of §6, the
sector ratios of §7, the infeasibility bound of §9) is independently cross-checked by two of this
route's own instruments (the copied orbit-quotient code and this route's own generating-function
code) wherever both apply, and by a third (ADJ-U's own prior run, at the laboratories) where
available.

## 12. Grades

- WID two-sided match at both target rows: `bounded_computation` (a fidelity check of the
  `formally_verified` (WID) identity on two new instances, not a new result).
- Laboratory reproduction (§8), including the orbit-key inspection: `bounded_computation`; a third
  (fourth, counting the two Cycle 5 critics) independent confirmation of an existing `bounded_
  computation` record (`R30-CB-RECORD`), not a new claim.
- Sector closed-form evaluation at the target rows (§7), including the new `CB(8,95)/508` ratio and
  the regime-3/switch-capacity comparison: `bounded_computation`.
- The infeasibility bound (§9): a proved, exact combinatorial fact (`bounded_computation` as a
  record of this run's own instrument limits; the underlying binomial-coefficient computation itself
  is exact, not approximate — "approximately 49 orders of magnitude" describes the DIGIT COUNT of an
  exactly computed integer, not an estimate).
- The scaling study (§10): `bounded_computation`, exploratory, explicitly not extrapolated.
- No claim in this return is `proved`, `proved_conditional`, `conditional`, `conjecture`, or
  `compiled`. No claim strengthens any existing certification.

## 13. Read-boundary disclosure

One item, identified by this seat itself, not repeated after discovery:

- **Two non-recursive `ls` calls of the bare `scratchpad/` top-level directory**, made to locate (a)
  this run's own `c6-*` scratch directories at the start of this route and (b) the Cycle 5 `c5-adj-*`
  adjudicator scratch directories before reading inside `c5-adj-U/own/`. Both revealed directory
  NAMES ONLY, never file content: call (a) additionally listed the sibling Cycle 6 seats' scratch
  directory names (`c6-T1`, `c6-T1-replay`, `c6-T2`, `c6-T2-replay`, `c6-U1`, `c6-U1-replay`,
  `c6-U2`, `c6-U2-replay`, `c6-F2`, `c6-F2-replay`), which this route is not authorized to read the
  CONTENTS of and did not; call (b) listed every Cycle 1–5 seat/critic/adjudicator/second-read
  scratch directory name, all of which the worker common brief explicitly authorizes as content
  (`scratchpad/c1-*, c2-*, c3-*, c5-*, c4-*`, "READ AND COPY-OUT REPLAY ONLY"). No sibling Cycle 6
  file was opened at any point. This mirrors a disclosed, corrected Cycle 5 precedent (`U2`'s own
  return, item 2 of its own read-boundary disclosure) for the same class of non-recursive top-level
  `ls`.

No other VerityOS file outside the two authorized boot reads, this run's own control/source/scratch
files explicitly named above, and `runs/lean-2026-09-26-c2-la1-aut-invariant-positive-deficient-
family/` (`THEOREM-CONTRACT.yaml`, `LOOP-STATE.json` — explicitly authorized by the common brief as
one of "the governed awards under `runs/...c2-la1-*/`") was read. No `find`, `grep`, `rg`, or `ls -R`
was run rooted above any granted directory; every `grep`/`ls` this route ran was either non-recursive
on a specifically named, granted directory, or (for `grep -r`) rooted strictly under `sources/`,
itself within the grant.

## 14. Background jobs

None were started. Every computation in this route ran in the foreground and completed in well
under the default tool timeout (`f1_main.py`'s slowest step, the `n=2131` forest-DP, runs in a few
seconds). There is nothing to kill.

## 15. Model disclosure

Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model
id: `claude-sonnet-5`.

## headline_resolved: no

## Route verdict: `blocked`

The load-bearing obligation — an `Aut`-invariant mixed sector/regime-3 family search AT
`CB(9,112)/673` and `CB(8,95)/508`, seeded by the `CB(11,2)/16` shape — is blocked by a proven
combinatorial obstruction (§9): the only method on record that has ever produced a mixed-family
maximizer (literal orbit-quotient max-flow, ADJ-U's own instrument, validated again in §8) requires
enumerating a multiset space of size `~10^{41}` to `~10^{49}` at these rows' actual `m`, which is not
tractable by any refinement of that method alone. This route did not find a deficient cut, did not
rule one out, and did not complete the central search. What it DID establish (§§6–10) is new,
validated, `bounded_computation`-grade supporting material — most importantly the exact `IsTree`/
`(n,α,x)`/eligibility/WID fidelity at both target rows at full scale, the exact `4401.4666`/`7476.32`
sector switch/deficit ratios AT those rows (not merely cited from the census), and the quantified
infeasibility bound itself, which is a genuine, checkable reason no route can close this obligation
by the orbit-enumeration method without a new reduction.

## Remaining obligation (successor inheritance)

A successor inherits, unchanged from the Cycle 5/6 record plus this route's own findings:

1. **The obligation itself is untouched**: `Aut`-invariant mixed sector/regime-3 family search at
   `CB(9,112)/673`, `CB(8,95)/508`, and (per Cycle 6 portfolio) the other 216 uncertified
   switch-necessary rows — still open, now with a proven reason the direct method cannot reach it.
2. **What is needed to unblock it**: NOT a faster implementation of orbit enumeration (§9 shows the
   space itself, not the implementation, is the obstruction), but a genuinely new reduction — most
   plausibly a transfer-matrix / DP formulation over per-choke LOCAL states (tracking `(size,
   weight)` jointly per choke, convolved across `m` chokes, as `gf_lib.py` already does for TOTALS)
   combined with a min-cut or LP argument over MARGINAL per-choke transition rates (in the style of
   T1's `θ, ρ` parameters for the sector alone), so that the search space is `O(\text{poly}(d, m))`
   rather than `O(\binom{s+m-1}{m})`. This is coupled to Cycle 6 U2's own compression conjecture
   (`c \to b` column replacement does not decrease the deficit) — the two obligations are the same
   underlying open question from complementary directions, and a successor should read both routes'
   Cycle 6 returns together.
3. **`gf_lib.py`'s regime-weighted generating functions** (this route's own, validated in §6 and §8)
   are offered as a validated building block for that reduction: they already compute exact TOTAL
   supply/capacity by regime at any `(d, m, p)` including full-scale target rows; what is missing is
   the analogous machinery for a SPECIFIC invariant subfamily's neighborhood, not merely a regime
   total.
4. **The `CB(11,2)/16` maximizer's exact orbit-key structure** (§8) is now on record at the level of
   individual keys, not just counts; a successor attempting to guess the general shape should start
   there rather than re-deriving it.
5. **The scaling table of §10** is new fitting data (six `d=3` rows, four `d=4` rows) showing the
   "other"/"sector" orbit-count ratio is NOT constant in `m`; any future closed-form conjecture for
   the maximizer shape must reproduce this non-constant growth, not a fixed ratio.
6. **The 218 uncertified switch-necessary rows and the two unsearched (CUT) sites** remain exactly as
   named in `cycles/cycle-5/stage6/SYNTHESIS.md`'s successor inheritance and
   `cycles/cycle-6/stage2/ROUTE-STATE.md`'s `F1` inheritance row; this route neither closed nor
   narrowed that list.
7. **No new key is proposed.** The bounded records of this return (§§6–10) are available for the
   Cycle 6 synthesis to fold into `R30-CB-RECORD` if it judges them worth retaining; this route makes
   no registration claim of its own.

## Artifact inventory

**Deliverable:** this file only,
`cycles/cycle-6/stage3/returns/F1/RETURN.md`.

**Scratch** (`scratchpad/c6-F1/`, never written to except by this seat):

| File | SHA-256 | Role |
|---|---|---|
| `copied_adj_quot.py` | `e36e50dceafbf62071794d12aa0585e7d508fbc691389e1f972f9a22f600f3c3` | byte-identical copy of ADJ-U's own orbit-quotient max-flow instrument (Cycle 5 scratch) |
| `copied_adj_shape.py` | `b04130d03e0d345f000335223f6636d1ebbb460ec27a8d0cee3c4da7ccc336df` | ADJ-U's own maximizer-shape extractor, one import line rebound |
| `tree_check.py` | `b874c8adac83758b87da145ec64b84e2ad41b41b1a101722cebde01b9e505800` | this route's own `IsTree` (acyclicity + connectivity, two independent passes) and `x`-through-`α` |
| `gf_lib.py` | `640f8201f2f0b0cf1803f9402cbcccd05e31d064a7fd6351be32b8580506b0e7` | this route's own regime-weighted generating-function library (independent of `copied_adj_quot`) |
| `f1_main.py` | `0510341de0305376fe63965c1a45a9ecc3c6f9114ddfab237f61825167d39bda` | consolidated deterministic generator for every numeric claim in this return |
| `f1_main_output.json` | `b15d3069083e63c95cfc59a36b3b2734bb0ae47bf0ae69d0e0f189ee90150f42` | its full exact-integer output |

**Replay** (`scratchpad/c6-F1-replay/`, copy-out-first, confirmed byte-identical):

```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-F1-replay
python3 -B f1_main.py
```

reproduces `RESULT_SHA256 e2c9e99fb0c88d256616b4f10dcfbf24755a7f1bd5b4ca46f661e0b4494855bb` and an
`f1_main_output.json` with SHA-256 `b15d3069083e63c95cfc59a36b3b2734bb0ae47bf0ae69d0e0f189ee90150f42`,
identical to the scratch copy.
