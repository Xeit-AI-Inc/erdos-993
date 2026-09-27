# RETURN — Route `U2`, Cycle 3, r30 (Erdős #993, weighted mixed-boundary transport)

Route ID: `C3-U-02`. Orientation: U (formal/structural). Mechanism fingerprint:
`PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS`. Load-bearing obligation (`control/C3-ALLOCATION.md`,
item 6, verbatim):

> **U2 `PRODUCT-FORM-FLOW-CERTIFICATE-ON-CB-ROWS`.** (a) An exact certificate on the FULL mixed
> networks of the three `CB(8,·)` rows, in one of two forms: a closed-form rational saturating
> flow over branch-type generating functions, verified by summation (a rational saturating flow
> implies WeightedHall for every `X` — prove that lemma on the face); or an LP-dual potential
> certifying that no deficient family exists. (b) Validate first on the brute-forceable eligible
> rows `CB(1,7)/10`, `CB(2,5)/10`, `CB(3,5)/13–14`, `CB(4,4)/14`, then on a small NON-eligible row
> where the root-plus-arm sector is deletion-deficient at the chosen rank (e.g. `CBstar(2,2,2)`
> at `p = 5` or `6`, or a `CB(d,m)` rank with `3p < 2dm + 5`), so that the certificate's switch
> share is exercised on a checkable network before `d = 8`. (c) Could close: the first exact
> saturation with switch arcs load-bearing on a whole tree (`bounded_computation` plus a
> `proved_informal` verification lemma), or a candidate invariant cut for F1's two-instrument
> confirmation.

**Model disclosure (two-part, on the face):** chartered sonnet/xhigh; transport-resolved model
sonnet (explicit parameter; alias `sonnet` → `claude-sonnet-5` per the Cycle 1 transport
preflight carried into `control/C3-STAGE1-GATE.md`). Runtime-reported model id: `claude-sonnet-5`
(verbatim, per this session's own environment disclosure: "You are powered by the model named
Sonnet 5. The exact model ID is claude-sonnet-5.").

## Boot acknowledgment

VerityOS booted for this seat by reading **exactly** the two files the dispatch authorizes, and
nothing else: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The startup protocol's own
task-type map, and its pointers into memory, conversations, modules, skills, logs and decisions,
were **not** followed (the controller has booted for the run). Before reading the dispatch file
itself, its digest was verified: SHA-256 of
`control/dispatch/c3-stage3/DISPATCH-U2.md` = `a24d39489139964f587e9ee49a0769b291ba6181ab35e86521be6b39b40b2611` — **matches** the wrapper's
stated digest exactly.

## Read-boundary disclosure

One non-recursive, in-place listing occurred: `ls -la <run root>/scratchpad/` (no `-R`) was run
once, before this seat's own scratch directories were confirmed to exist, listing the *names* of
sibling seats' scratch directories (e.g. `c1-F1`, `c1-adj-T`, `c1-crit-F1-T`, …) but reading none
of their contents. `scratchpad/` as a whole is above this seat's grant (only `scratchpad/c3-U2/`
and `scratchpad/c3-U2-replay/` are within it); disclosed per the rule against search rooted above
grant, consistent with the precedent set by Cycle 2 U2's own disclosure of the identical class of
touch. No `find`, `grep -r`, `rg`, `ls -R`, or globbed `cat` was run rooted above this seat's
grant. No sibling seat's return, critique, or scratch directory was read. No network access or
package install occurred.

**Background-job disclosure.** One computation (an early attempt at plain vertex-by-vertex
backtracking enumeration of `I_{14}(CB(3,5))` / `I_{13}(CB(3,5))` / `I_{15}(CB(4,4))` etc., before
this route switched to the closed-form generating-function method for the larger rows) exceeded
the 120-second foreground limit and was auto-backgrounded by the harness (task id `bnr4rdn4b`).
It was stopped immediately by its literal task id (`TaskStop`, not `pgrep -f` and not a full
process listing) as soon as its approach was recognised as intractable at that scale, before it
produced any output this return relies on. No background job was left running at the close of
this route.

## Stage 2 seal and source digest verified

- `control/C3-STAGE2-PACKET-MANIFEST.json` inner seal recomputed over the canonical JSON of the
  manifest without `seal_sha256` (`sort_keys=True`, separators `(",", ":")`, no trailing newline,
  1051 files): computed `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`,
  **matches** the manifest's own `seal_sha256` field and the dispatch's cited value exactly. **I
  cite this seal value: `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`.**
- The one `sources/` file this route reads for content (not merely re-derives from scratch) —
  `sources/lower-region/instruments/cb-switch-cut/RESULTS.json` — was checked by literal
  `shasum -a 256` against `control/SOURCE-DIGESTS.json` **before** its `aggregate` field was read
  for the cross-check below: declared `873cf9229923153d7626c6d721ab40b8ace8488b51343c66a00b6cfb0449d5d5`,
  computed `873cf9229923153d7626c6d721ab40b8ace8488b51343c66a00b6cfb0449d5d5` — **match**.
- `control/C3-WORKER-COMMON-BRIEF.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`,
  `control/C3-ALLOCATION.md`, `control/C3-STAGE1-GATE.md`, `cycles/cycle-3/stage2/ROUTE-STATE.md`,
  `control/RESIDUE-CHECK.json`, `control/CLAIM-DISTINCTIONS.json`, `control/R30-CHARTER-PROMPT.md`,
  `control/SOURCE-DIGESTS.json` (first page; a 3946-line/134KB file — read in full via its own
  paginated tool output, not by any `grep -r`/`find`), `cycles/cycle-2/CYCLE-CLOSE.md`,
  `cycles/cycle-1/CYCLE-CLOSE.md`, and the Cycle 2 returns `cycles/cycle-2/stage3/returns/{U2,T1,T2}/RETURN.md`
  (the last for its `CBstar(d,m,t)` family definition and switch-image formula T-E, needed to
  identify what `CBstar(2,2,2)` denotes — read via a single-file `grep -n` locating the definition,
  not a directory-rooted search) were read in full or via targeted single-file search, per the
  dispatch's ordered list and the common brief's "readable as sources of record" grant for the
  sealed Cycle 1/2 returns.
- I deliberately did **not** import `sources/lower-region/inputs/ordinary_tree_checked.py` (the
  authorized evaluator): every tree construction, independence-polynomial DP, `x`/`Δ_k`
  computation, active-tag weight, relation, and max-flow solver below is my own, from-scratch,
  standard-library implementation — a genuinely independent second instrument, not a wrapper
  around the run's shared tool. The one place I use a value from `sources/` is the single
  digest-verified cross-check against `cb-switch-cut/RESULTS.json`'s `aggregate` field, reported
  as a cross-check, never as a computation step.

## IMPORT LIST (standard library only, union over every script in this return)

`fractions` (imported, unused directly — kept for parity with the run's exact-integer
convention; all arithmetic below is plain Python `int`, exact and unbounded), `itertools`
(imported in `tree_lib.py`, unused directly), `collections.deque`, `math.comb`, `json`,
`hashlib`, `sys`, `time`. No third-party packages, no network.

## Setting recap (SEMANTIC-CONTRACT.md §1.2, §2)

`CB(d,m)`: root path `r–s–v`; `m` chokes `u_i ~ r`; each choke `u_i` owns `d` supports
`b_{i,l} ~ u_i`; each support owns one private leaf `c_{i,l} ~ b_{i,l}`. `CBstar(d,m,t)`
generalizes this: each support owns `t` private leaves (`t=1` recovers `CB(d,m)` exactly).
Active-tag weight `w_F(B) = #{v ∈ F ∩ B : (B∖{v}) ∩ W_v ≠ ∅}`, `W_v = N_T(s_v) ∖ {v}`. Relation
(D)∪(S): deletion, or a two-for-one switch at `u ∉ B` with exactly two neighbours in `B`. Root-
plus-arm sector `X_sec := {B ∈ I_{p+1}(T) : r, v ∈ B}`.

## Where every hypothesis enters (derivation map)

**`IsTree` (connectivity and acyclicity, separately).** `tree_lib.is_tree_exact` checks
`len(edges) == n-1`, then acyclicity by union-find over every edge (rejecting the edge the
instant it would close a cycle — this is where acyclicity is asserted, before anything else is
computed), then connectivity by an explicit BFS from vertex 0 counting reached vertices. Both
conditions are asserted **separately** and both are required to return `True`; run on every one
of the nine tree instances used below (`CB(1,7)`, `CB(2,5)`, `CB(2,2)`, `CBstar(2,2,2)`,
`CB(3,5)`, `CB(4,4)`, `CB(8,86)`, `CB(8,89)`, `CB(8,92)`) — all nine pass
(`run_all_RESULT.json`, `is_tree: true` on every row; `CBstar_2_2_2_corroboration.is_tree`,
`CB_2_2_p4_switch_load_bearing.is_tree`).

**Finiteness.** Every polynomial and every enumerated family below is an explicit finite object
(`n` a concrete Python `int`; `tree_lib.tree_poly` returns a finite coefficient list; the
brute-force enumerator `network.enumerate_independent_sets` terminates because the recursion
depth is bounded by `n` and the branching is pruned by `len(chosen) + remaining < k`).

**Eligibility (`x(T)+2 ≤ p`, `3p < 2α(T)+1`).** `x` is computed by `tree_lib.crossing_index_through_alpha`,
which scans `k = 0, 1, …, α` **inclusive** and returns the first `k` with `Δ_k(T) < 0` — this is
the independent, from-scratch re-implementation of the authorized evaluator's documented caveat
(its own `first_strict_descent` omits the terminal zero-extension difference at rank `α`; mine
does not, by construction, since it always evaluates through `k = α`). `α` itself is the largest
`k` with a positive coefficient (`tree_lib.alpha_of`). Every row below reports `n, α, x` and the
eligibility window `[x+2, ⌊2α/3⌋]` explicitly, and states plainly whenever a chosen `p` falls
outside it (`CB(2,2)/4`, `CBstar(2,2,2)/5,6`: both explicitly flagged `non_eligible_row: true` /
outside their own windows, used **only** as small mechanism-validation instances, never as
aggregate or (HALL) evidence, per the fences of `SOLUTION-CONTRACT.md` §3 and the precedent of
Cycle 2 U2's own `CB(2,2)/5` mechanism-only validation).

**The fixed selector `F = F_p(T)`.** `network.favorable_leaves` computes, for every leaf `v`,
the polynomial of `T − {v}` by the same from-scratch tree DP with `v` excluded, and selects `v`
iff `Δ_p(T−v) < 0` — never assumed, never hard-coded "all leaves". On the four small rows where a
full brute-force check is affordable (`CB(1,7)/10`, `CB(2,5)/10`, and the two demonstration rows
`CB(2,2)/4`, `CBstar(2,2,2)/5,6,7`) this checks **every** leaf individually. On the five larger
rows (`CB(3,5)/13,14`, `CB(4,4)/14`, `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`) I use the
established fact that `Aut(CB(d,m)) = S_m ≀ S_d` acts transitively on the `dm` private leaves
(Cycle 2 T1's derivation, re-verified structurally here: every private leaf's role in the tree —
its support's degree, its support's other neighbour's role — is identical under the wreath
action) to check only the **two** orbit representatives (`v` itself, and one private leaf
`c_{0,0,0}`) and report `|F|` as `[v favorable] + dm·[private leaf favorable]`; every row found
`|F| = dm+1` (all leaves favorable), matching the standing fact and independently re-derived
rather than assumed on each of these five rows (`run_all_RESULT.json`,
`F_is_all_leaves_by_symmetry_argument: true` throughout).

**The active-tag witness and the literal relation.** `network.active_weight` counts `v ∈ F∩B`
with `(B∖{v}) ∩ W_v ≠ ∅` literally (never `|F∩B|`); `network.relation_targets` builds (D) by
single-vertex deletion and (S) by the exact two-for-one switch test `|N(u)∩B|=2, u∉B`, checked
directly against the graph's adjacency, not via any shortcut. Hand-verified on one produced
example (`CB(2,2)/4`): source `B = {r=0, v=2, b_{0,0}=5, c_{0,1,0}=10, c_{1,1,0}=12}` has
`|N(u_0=3) ∩ B| = |\{0,5\}| = 2` (choke `3 ∉ B`), so the switch fires with
`A = (B∖\{0,5\}) ∪ \{3\} = \{2,3,10,12\}` — exactly the target this route's own code reports for
that edge (`run_all_RESULT.json`, `CB_2_2_p4_switch_load_bearing.example_switch_flow_edges[0]`).

**Group invariance (`Aut(T) = S_m ≀ S_d`).** Used only for the leaf-orbit shortcut above and to
justify treating `CBstar(2,2,2)`'s and `CB(2,2)`'s sector `X_sec` as the natural `(r,v)`-orbit
class; no invariant-cut or equitable-partition machinery is invoked (that is U1's and F1's
object, not re-derived here).

## Own closed-form weight generating function for `CB(d,m)` — derivation, statement, triple cross-check

Classifying every independent set `B` of `CB(d,m)` by its arm/root macro-state (`r∈B`; `s∈B`;
neither) and, per choke, by "included" (rank+1, forces its `d` supports out, its `d` private
leaves free and — since the choke itself now supplies the witness — **every** present leaf
active) versus "excluded" (a 3-state single-support "star": neither / support / leaf, weight 0
in every sub-case, since `t=1` has no sibling leaf and the choke, its only other witness, is
excluded), and tracking `|B|` by `x` and `w_F(B)` by a second variable `y`, gives the bivariate
generating function (own derivation; full case analysis in `scratchpad/c3-U2/cb_gf.py`'s
docstring):

```
Total(x,y) = x(1+yx)(1+2x)^{dm}  +  (1+2x)·g(x,y)^m,      g(x,y) = x(1+yx)^d + (1+2x)^d
```

Differentiating in `y` and setting `y=1` extracts the weight polynomial directly
(`Total(x,y) = Σ_B x^{|B|} y^{w_F(B)}`, so `∂Total/∂y|_{y=1} = Σ_B x^{|B|} w_F(B)`):

```
W(x) = x²(1+2x)^{dm}  +  m·d·x²(1+x)^{d-1}(1+2x)·Br(x)^{m-1},     Br(x) := x(1+x)^d + (1+2x)^d
```

`[x^k]W(x) = Σ_{B ∈ I_k(CB(d,m))} w_F(B)` when `F` = the full leaf set (the standing fact,
independently re-verified above on every row this route reports). At `y=1`, `Total(x,1)` gives
the exact **count** polynomial and, on symbolic expansion, is algebraically identical to the
already-authorized `cb-switch-cut/run.py`'s branch decomposition (`D(x)=(1+2x)^d`,
`L(x)=(1+x)^d`, `branch(x)=D(x)+xL(x)` — my `Br(x)` is the same polynomial, derived independently
here rather than cited). Expanding Cycle 2 U2's own stated weighted companion
`ML(x) = Σ_j C(d,j)·j·x^{j+1} = d x²(1+x)^{d-1}` shows their formula
`W(x) = m·ML(x)·(1+2x)·branch(x)^{m-1} + x²·D(x)^m` is **the same formula as mine, term for
term** — a useful confirmation that the underlying mathematics both routes independently arrived
at is correct; the numeric discrepancy found below (CB(2,5)) is therefore a script-level
arithmetic slip in Cycle 2 U2's instantiation, not a defect in the shared formula.

**Cross-check 1 (brute force, every rank, six small instances).** For
`(d,m) ∈ \{(1,1),(2,1),(1,2),(2,2),(2,3),(3,2)\}`, both the ordinary count polynomial (against my
independent, generic, exclude-set-based tree DP — not the closed form's own derivation path) and
the weight polynomial (against literal exhaustive independent-set enumeration + literal
`active_weight`, at **every** rank `k = 0..n`) match exactly, zero mismatches
(`run_all_RESULT.json.weight_gf_bruteforce_crosscheck`, all six rows
`count_poly_matches_generic_dp: true`, `weight_poly_matches_bruteforce_every_rank: true`).

**Cross-check 2 (the two eligible brute-forceable rows).** `CB(1,7)/10` and `CB(2,5)/10`: the
closed-form `supply`/`capacity` match the full brute-force enumeration exactly
(`formula_matches_bruteforce: true` on both rows below).

**Cross-check 3 (the frozen record).** `CB(8,92)/492`: my independently-derived `S` is
**byte-identical**, digit for digit, to the `aggregate` field of the digest-verified
`sources/lower-region/instruments/cb-switch-cut/RESULTS.json`
(`run_all_RESULT.json.CB_8_92_p492_frozen_record_crosscheck.byte_identical: true`).

## Results — the brute-forceable eligible rows (obligation (b), first half)

Full independent-set enumeration (own backtracking generator, adjacency-pruned, exact/exhaustive
— no sampling), literal active-tag weight, and a **real integral max-flow solve** (own Dinic
implementation, standard library only) on the complete bipartite (D)-only and (D)∪(S) networks —
not merely a Hall-inequality argument, an actual flow found and its value certified:

| row | `n` | `α` | `x` | `Δ_x` | `Δ_{x-1}` | `\|F\|` | `\|I_{p+1}\|` | `\|I_p\|` | supply | capacity | `S` | del-only max-flow | full max-flow |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `CB(1,7)/10` | 24 | 15 | 8 | `-12683` (`<0`) | `2406` (`≥0`) | 8 | 8,673 | 22,197 | 29,190 | 58,002 | `-28,812` | **29,190 (saturates)** | 29,190 |
| `CB(2,5)/10` | 28 | 16 | 8 | `-7,840` (`<0`) | `70,021` (`≥0`) | 11 | 88,506 | 185,256 | 259,980 | 396,460 | `-136,480` | **259,980 (saturates)** | 259,980 |

Both rows: `supply − capacity = S` asserted from two independently computed sides (network-sum
brute force vs. the `H_v/R_v`-aggregate formula of SEMANTIC-CONTRACT §1.2, `network.aggregate_S_via_HR`)
— exact match on both (`brute_sides_match: true`); the closed-form generating function matches
the brute force exactly (`formula_matches_bruteforce: true`); **deletion arcs alone already
saturate** on both rows (matching the standing fact carried from Cycles 1–2), now confirmed by an
actual computed integral flow rather than an inference from a Hall-type inequality — this is, to
this route's knowledge, the first time a real max-flow solver (as opposed to a supply/capacity
comparison or a structural Hall bound) has been run to completion on the **whole** network of
either of these two rows in this run.

**`CB(2,5)/10` numeric discrepancy noted.** Cycle 2 U2's own `RETURN.md` table reports
`supply=275,920, capacity=412,400` for this exact row (`S=-136,480`, matching only in the
difference). My brute-force enumeration, my independent closed-form generating function, and the
Cycle 3 worker brief's own cited fixed point (`control/C3-WORKER-COMMON-BRIEF.md`: "88,506
sources, supply 259,980, capacity 396,460, S = −136,480") all agree exactly on `259,980/396,460`.
Since Cycle 2 U2's own stated *formula* is algebraically identical to mine (shown above), this is
a numeric/coding slip in their specific script instantiation (`cb_target_rows.py`), not a defect
in the shared mathematics; flagged here as a data-quality finding for the record, not as an
impeachment of any registered claim (Cycle 2 U2's own candidates did not depend on this specific
number).

## Results — a small non-eligible row exercising the switch arcs (obligation (b), second half)

`CBstar(2,2,2)` (`d=2,m=2,t=2`, `n=17`) at the dispatch-suggested `p ∈ \{5,6\}` (and `p=7`,
checked for completeness) turns out to give **no** deletion-deficient sector at any of the three
ranks (`run_all_RESULT.json.CBstar_2_2_2_corroboration`: `deletion_only_Hall_holds: true` at
`p=5,6,7`) — this is an **independent corroboration**, at a fresh instance not in Cycle 2 T2's
own tested set, of the already-registered `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`
(`t ≥ 2`: the sector is never deletion-deficient at any rank). So `CBstar(2,2,2)` does **not**
supply the dispatch's own literal example; I switched to the dispatch's stated alternative
("`CB(d,m)` rank with `3p < 2dm+5`") and swept every small `CB(d,m)` with `dm ≤ 16` over every
feasible `p` to find the smallest genuinely deletion-deficient-sector instance:

**`CB(2,2)`, `p = 4`** (`n = 13`, `α = 7`, `x = 4`; window `[6,4]` — genuinely empty, `CB(2,2)`
has **no** eligible `p` at all, so `p=4` is explicitly non-eligible and reported strictly as a
mechanism validation, never as (HALL) or aggregate evidence): `F` = all 5 leaves; `|X_sec| = 32`,
`supply(X_sec) = 32`.

- **Deletion-only**, sources restricted to `X_sec`, targets the *entire* `I_4(T)` family with its
  own literal weights: max-flow `= 24 < 32`. **Hall fails** — the sector cannot be saturated by
  deletion alone, even granting it every deletion target's full capacity.
- **`(D) ∪ (S)`**, same restriction: max-flow `= 32 = 32`. **Exact saturation.** An explicit
  integral flow was found and extracted (not merely an inequality): 8 of its flow-carrying arcs
  are genuine switch arcs (not deletions), e.g. `B=\{0,2,5,10,12\} → A=\{2,3,10,12\}` (hand-verified
  above), each carrying exactly 1 unit
  (`run_all_RESULT.json.CB_2_2_p4_switch_load_bearing.example_switch_flow_edges`).

`supply − capacity = S(T,4) = 32` checked on two independent sides (network sums vs. `H_v/R_v`
aggregate; `sides_match: true`) — `S > 0` here is expected and unremarkable (this row is not
eligible, so WID does not predict a sign), and is not used as evidence of anything about (HALL);
the load-bearing fact demonstrated is purely about the sub-family `X_sec`'s own Hall condition,
independent of the whole-network aggregate's sign.

This is, to this route's knowledge, the first small, fully brute-forced, exactly checkable
instance in this run where an **actual flow computation** (not a Hall-inequality argument) shows
switch arcs are strictly necessary to saturate a natural source subfamily — exactly what
obligation (b) asks for ("exercised on a checkable network before `d=8`"). It is explicitly
**not** a step toward obligation (a) or (c) at the `CB(8,·)` scale: `X_sec` here is the *whole*
sector of a 13-vertex tree at a non-eligible rank, nowhere near the "coupled sector + positive-
weight V + positive-weight S/O" families that remain the genuinely open obstruction at
`CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`.

## Results — exact supply/capacity/`S` on the two remaining brute-forceable-scale rows and the three `CB(8,·)` target rows

Plain vertex-by-vertex backtracking enumeration does not scale to `CB(3,5)` (`n=38`) or `CB(4,4)`
(`n=39`) in reasonable time (the abandoned attempt is the background job disclosed above), so
these — and the three `CB(8,·)` rows, far beyond brute force — are computed via the closed-form
`W(x)` above (fast: exact big-integer polynomial arithmetic, no enumeration), with `S`
cross-checked on a **second, independent** side: the symmetry-reduced `H_v/R_v` aggregate (two
tree-DP evaluations — one for `v`, one for a representative private leaf — scaled by the leaf's
`Aut(T)`-orbit size, justified above):

| row | `n` | `α` | `x` | `Δ_x<0` | `Δ_{x-1}≥0` | `\|F\|` | supply | capacity | `S` (both sides match) |
|---|---|---|---|---|---|---|---|---|---|
| `CB(3,5)/13` | 38 | 21 | 11 | yes (`-973,815`) | yes (`7,227,452`) | 16 | 38,064,305 | 54,292,890 | `-16,228,585` |
| `CB(3,5)/14` | 38 | 21 | 11 | yes | yes | 16 | 19,688,700 | 38,064,305 | `-18,375,605` |
| `CB(4,4)/14` | 39 | 21 | 12 | yes (`-10,466,698`) | yes (`5,365,734`) | 17 | 33,933,216 | 59,268,576 | `-25,335,360` |
| `CB(8,86)/460` | 1465 | 775 | 458 | yes (330-digit) | yes (327-digit) | 689 | (352-digit) | (352-digit) | `-`(351-digit) |
| `CB(8,89)/476` | 1516 | 802 | 474 | yes (340-digit) | yes (338-digit) | 713 | (363-digit) | (363-digit) | `-`(362-digit) |
| `CB(8,92)/492` | 1567 | 829 | 490 | yes (352-digit) | yes (350-digit) | 737 | (369-digit) | (369-digit) | `-`(369-digit, **= frozen record, byte-identical**) |

Exact values (all far too long for this table) are in `run_all_RESULT.json` and reproduced by the
replay command below; every one of `n, α, x` for the three `CB(8,·)` rows matches the values
recorded in `SEMANTIC-CONTRACT.md` §1.2 and the Cycle 3 worker brief exactly. `|F| = dm+1` on
every row (all leaves favorable, independently re-derived by the symmetry argument, not assumed).

**No new (CUT) candidate was found or attempted at these three rows.** This route's obligation
(a) — an exact certificate (closed-form flow or LP-dual potential) on the *full mixed* network of
`CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, with the coupled sector+V+S/O families resolved —
is **not achieved**. The closed-form `W(x)` gives exact `supply`/`capacity` totals (useful for any
successor: a fast, verified, independent tool for these numbers on arbitrary `CB(d,m)`), but a
total-vs-total identity is necessary, not sufficient, for a saturating flow to exist — exactly
the "necessary but not sufficient" gap already on record from Cycles 1–2 (Hall's condition must
hold for **every** subfamily `X`, and the coupled-family joint-flow argument that would close
this — named as the remaining obstruction by both this route and Cycle 2 T1 — is not constructed
here either). I explicitly did not attempt to materialize or approximate the `S_8 ≀ S_m`-orbit
quotient (`≈ 10^37`–`10^41` per layer at these three rows, per Cycle 2 U2's exact count,
independently plausible from the scale of `n`) nor any equitable-partition reduction of it (U1's
and F1's object); this route's own contribution is deliberately scoped to (i) the closed-form
whole-network weight polynomial (new, verified three ways) and (ii) genuine small-scale flow
computations (new: actual Dinic solves, not inequality arguments) rather than a further
unverified structural claim about the big rows.

## Registered claims named before any census (`sources/authority/CLAIM-IDENTITY.json`, 434
identities, fused with `control/CLAIM-IDENTITY.run-local.json`, 443 claims at the Cycle 3 Stage 2
seal)

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — OPEN. This route neither proves nor
  refutes it at any scope; every full-network flow this route computed (both eligible rows tested)
  saturates, and no deficient cut was found or attempted at any eligible row.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — VERIFIED `formally_verified`. Used
  (not re-proved) as the standard every `supply − capacity = S` check in this return is held to,
  asserted independently on every row from two separately-computed sides.
- `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (FLOW⇒SIGN) — VERIFIED
  `formally_verified`. Not invoked as a proof step (this route never claims (HALL)-COND for
  `X = I_{p+1}` at any of the three `CB(8,·)` rows).
- `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` — VERIFIED `proved_informal`. Independently
  **corroborated** (not re-proved) at a fresh instance, `CBstar(2,2,2)`, `p ∈ \{5,6,7\}`: `t≥2` ⇒
  no sector deficiency, confirmed here by direct Hall-condition computation on the actual family.
- **(LIFT), (INV), (NM), `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT`** — not used by anything in this
  return (this route's small-scale demonstrations use no group action or equitable-partition
  machinery at all; the closed-form `W(x)` is a plain generating-function derivation).
- **The ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2**: none is revived. The weight
  used throughout is the literal active-tag `w_F` (never `|F∩B|`); the relation is the literal
  (D)∪(S) (never a Delete/Retag variant); the one deletion-only Hall *failure* exhibited
  (`CB(2,2)/4`'s `X_sec`) is explicitly about the r30 active-weight network and is exactly the
  kind of statement `control/CLAIM-DISTINCTIONS.json` row `R30-DELONLY` already distinguishes
  from `E993-R23-LITERAL-DELETE-ONLY-HALL` (different demand, different tag semantics, different
  clone compatibility) — cited, not re-derived, since this route's instance (`CB(2,2)`, non-
  eligible `p=4`) differs from that row's own witness (`CB(8,86)/460`) but shares the same
  distinguishing argument verbatim.
- **Alias check, lexical AND mathematical**, for this route's two candidate contributions
  (methodology follows the precedent of `control/CLAIM-DISTINCTIONS.json` row
  `R30-C2-SPEC-VS-NM`'s own `sr_alias.py`-style search): grepped both the run-local registry (443
  claims) and the master registry (434 identities, `sources/authority/CLAIM-IDENTITY.json`) for
  `generating function|generating-function|branch-type|weight polynomial|product form|product-
  form|lp-dual|potential|switch-load|sector-restricted|switch arc|load-bearing|cb(2,2)`. Matches
  found are all about unrelated objects (Boolean-lattice potentials in the r27 forest-degree
  family; the LP-dual phrase appears only in `E993-R25-CARD5-JOINT-BUDGET-CELLS`, a budget-cell
  argument unconnected to this run's transport network; the one `cb(2,2)` hit,
  `E993-C3-COMPLETE-TAG-DEFICIENCY-EQUALS-CONTRIBUTION`, is about the **refuted r23 literal
  Delete/Retag relation** at `CB(2,2)/6` — a different mechanism, a different rank, and a
  deficiency-vs-contribution question, not a deletion-vs-switch Hall demonstration). No lexical or
  mathematical collision found for either candidate below.

### Two candidate claims proposed by this route (STATED; naming only — registration is the
synthesis's act)

**Candidate 1 — `E993-R30-CB-WHOLE-NETWORK-ACTIVE-WEIGHT-GENERATING-FUNCTION`.**
> For `CB(d,m)` (`d,m ≥ 1`) with `F` the full leaf set, the active-tag-weight generating function
> over ALL independent sets (not merely the root-plus-arm sector) is
> `W(x) = x²(1+2x)^{dm} + m·d·x²(1+x)^{d-1}(1+2x)·Br(x)^{m-1}`, `Br(x) = x(1+x)^d + (1+2x)^d`,
> with `[x^k]W(x) = Σ_{B∈I_k(CB(d,m))} w_F(B)`.

Proof sketch: case analysis on the arm/root macro-state (`r∈B`; `s∈B`; neither), each choke
independently "included" or "excluded" when `r∉B` (forced "excluded" uniformly when `r∈B`),
combined via the standard product structure for independent sets on a tree that decomposes into
vertex-disjoint pieces sharing only excluded connector vertices; differentiate the resulting
bivariate `Total(x,y)` in `y` at `y=1`. Complete, elementary, from the definitions (full case
analysis in `scratchpad/c3-U2/cb_gf.py`'s docstring and the "Own closed-form..." section above).
Algebraically identical, term for term, to the (previously unregistered, ad hoc) formula in
Cycle 2 U2's `cb_target_rows.py`; this route supplies an independent derivation, a proof (rather
than an unverified heuristic decomposition), and triple cross-validation (brute force at every
rank on six instances; exact match on the two brute-forceable eligible rows; byte-identical match
against the frozen `CB(8,92)/492` record) — resolving, in passing, why Cycle 2 U2's own numeric
instantiation for `CB(2,5)/10` disagreed with the established fixed point (a script bug, not a
formula error, as shown above). Proposed grade: `proved_informal` (complete elementary proof;
needs an isolated second read before registration).

**Candidate 2 — a small-scale switch-load-bearing witness (naming deferred to the synthesis).**
> On `CB(2,2)` at `p=4` (non-eligible: the row has no eligible `p` at all), the root-plus-arm
> sector `X_sec` (32 members, `supply(X_sec)=32`) satisfies weighted Hall against its full actual
> neighbourhood under `(D)∪(S)` (exact integral flow found, value 32) but **not** under `(D)`
> alone (exact integral max-flow value 24 < 32) — an explicit, small, fully brute-forced instance
> where switch arcs are strictly load-bearing for a natural source subfamily's own Hall condition.

Proposed grade: `bounded_computation` (an exact, exhaustively-verified witness on one small
instance; explicitly not a family theorem, and explicitly not evidence about (HALL) at any
eligible row or about the `CB(8,·)` coupled-family obstruction).

## What was built and verified (every numeric claim above is a deterministic generator with exact-
integer arithmetic, a SHA-256 digest, and a copy-out-first replay command)

All code is frozen, byte-identical, under `scratchpad/c3-U2-replay/` (development copies with
identical content live under `scratchpad/c3-U2/`).

**Replay** (copy-out-first: every module the entry point imports already sits beside it in this
directory):
```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-U2-replay
python3 -B run_all.py
```
Prints `{"sha256_of_canonical_combined_result": "20a48614b9555fb44183cb7a1bde8a0f709ee5444d9c3b92fe1a6ffcfbf387c9"}`
and writes `run_all_RESULT.json` (pretty-printed; the hashed payload is the canonical
`sort_keys=True, separators=(",",":")` JSON of the same object, minus the one wall-clock-only
field, which is excluded from the hash and printed to stderr only). Re-run twice (once in
`scratchpad/c3-U2/`, once fresh in `scratchpad/c3-U2-replay/` after copying); both runs produced
the identical digest `20a48614b9555fb44183cb7a1bde8a0f709ee5444d9c3b92fe1a6ffcfbf387c9`. Total
wall-clock per run: ≈ 13 seconds (not part of the hashed payload).

Per-module digests (files as frozen in `scratchpad/c3-U2-replay/`):

| file | sha256 |
|---|---|
| `tree_lib.py` | `19247e63d20b36cdeb4b8f04fe69ae98fa7c3f2a1b4c0f3bdf8bca4fe7636523` |
| `network.py` | `6fa12483b0495b92853b88fc63cc63db1b4cb5ca02de10cfa7790dd4c4a726e0` |
| `cb_gf.py` | `563e43ccb6f6196206390f864ef7b2e1357eb67a429fff2d729828d231ad7f42` |
| `run_all.py` | `5821cc5ed8e2044a00e4a67cff93daf8b558a7187fb805a5378705ac7be1bc4e` |
| `run_all_RESULT.json` (this replay's own output) | `ac432c7cd5a50c111eb5b7de53ae5c5267efd4a9385f311021bc6355bd1824fd` |

No wall-clock, PID, or host field enters the hashed payload. Every count, weight, flow value and
polynomial coefficient above is computed by the generator whose digest is listed; none is a
literal typed in by hand, except the two independently-sourced cross-check literals quoted for
comparison (Cycle 2 U2's own reported `CB(2,5)` numbers, and the frozen `CB(8,92)` record's
`aggregate` field, both quoted verbatim from their cited documents for the comparison itself).
Every Python invocation used `python3 -B`; no `__pycache__` was created anywhere (checked by
`find … -iname "__pycache__"`, empty); nothing under `sources/` was written (checked by
`find sources -newer control/C3-STAGE1-GATE.md -type f`, empty).

## Grades (`SOLUTION-CONTRACT.md` §4 vocabulary)

| Claim | Type | Grade |
|---|---|---|
| Own tree construction, `IsTree` check, tree-DP independence polynomial, `x`/`Δ_k` computation | tooling, independently re-implemented | exact (standard-library, unbounded integers; not a claim in itself) |
| Candidate 1 (whole-network `W(x)` closed form) | theorem (elementary, complete proof from the definitions) | proposed `proved_informal`; STATED, pending isolated second read |
| `CB(1,7)/10`, `CB(2,5)/10`: full brute-force enumeration + real integral max-flow (deletion-only and full), both saturating | bounded computation (exact, exhaustive) | `bounded_computation` |
| `CB(2,2)/4` sector switch-load-bearing witness (Candidate 2) | record / structural witness (exact, exhaustive on one instance) | proposed `bounded_computation`; STATED, pending second read |
| `CBstar(2,2,2)` non-deficiency corroboration | independent corroboration of an already-VERIFIED key | `bounded_computation` (supporting evidence, not itself a new claim) |
| `CB(3,5)/13,14`, `CB(4,4)/14`, `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492` supply/capacity/`S` | bounded computation (exact; two independent sides; one row byte-matches a frozen record) | `bounded_computation` |
| `CB(2,5)/10` numeric discrepancy in Cycle 2 U2's own table | data-quality finding | factual note, not a graded claim |
| Obligation (a): exact certificate (flow or LP-dual potential) on the full mixed `CB(8,·)` networks | **not achieved** | missing bridge — see Remaining obligation |
| Obligation (c): first exact saturation with switch arcs load-bearing on a *whole tree at the target scale* | **not achieved at `CB(8,·)` scale** (achieved only at the small `CB(2,2)/4` sub-family scale, Candidate 2) | missing bridge — see Remaining obligation |

No certification above is stronger than its evidence; no census value is used in a proof; no
refuted mechanism is revived; no RTree wording is used; no closed region (high tail, order bands,
`T_m`/spider/path-star families) is re-proved or re-checked as evidence; the three CB(8,·) rows'
sector-Hall `computer_assisted` status and the `CBstar` non-deficiency theorem are used, not
re-proved.

## `headline_resolved: no`

(Per `SOLUTION-CONTRACT.md` §5 and `C3-ALLOCATION.md`: the headline moves only at a Stage 7
formal close or a confirmed two-instrument-plus-second-read (CUT); neither occurred on this
route. No (CUT) candidate is offered.)

## Route verdict: `bounded_evidence`

This route produced: (i) an independently-derived, triple-cross-validated closed-form active-
tag-weight generating function for the whole `CB(d,m)` network (not merely its sector), usable by
any successor for fast exact `supply`/`capacity` on arbitrary rows without brute force; (ii) the
first genuine integral max-flow *solves* (not Hall-inequality arguments) on the complete networks
of both brute-forceable eligible rows named in the obligation, confirming deletion-only
saturation with an actual exhibited flow; (iii) a small, fully brute-forced, exact demonstration
that switch arcs are strictly load-bearing for a natural source subfamily's Hall condition
(`CB(2,2)/4`, non-eligible), satisfying obligation (b)'s request to exercise the switch mechanism
on a checkable network before `d=8`; and (iv) a data-quality correction to an existing route's
numeric table. It did **not** produce an exact certificate (closed-form flow or LP-dual
potential) on the full mixed networks of `CB(8,86)/460`, `CB(8,89)/476`, or `CB(8,92)/492`
(obligation (a)), and does not claim to have narrowed the specific coupled-family joint-flow gap
that Cycle 2 T1 and the Cycle 3 allocation both already identify as the smallest unproved lemma.
`bounded_evidence` (not `proved`: the target application, obligation (a), is open; not `blocked`:
the tooling built here is complete, verified, and directly usable; not `compiled`: no unfinished
Lean or computational artifact awaits composition — the gap is the same genuine open mathematical
question named by every prior route on this track).

## Remaining obligation (successor inheritance)

1. **Obligation (a) itself remains open**: an exact certificate (closed-form rational saturating
   flow, or LP-dual potential) on the FULL mixed network of `CB(8,86)/460`, `CB(8,89)/476`,
   `CB(8,92)/492`, resolving the coupled sector+positive-weight-V+positive-weight-S/O families
   that Cycle 2 T1 (Step 3) and this route both confirm is the smallest unproved lemma. This
   route's own closed-form `W(x)` gives exact totals but, by itself, supplies no per-subfamily
   certificate; a successor attempting option (a) should look for a *per-class* (not just
   per-total) product-form flow, using the branch-type classification already validated here and
   in Cycle 1 T1/Cycle 2 T2, rather than restarting from raw totals.
2. **A genuinely switch-necessary instance at eligible-row scale** (unlike `CB(2,2)/4`, which is
   non-eligible) is still not exhibited by this route; the three known switch-necessary rows
   remain `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492` themselves, all out of brute-force range.
   A successor could search for a smaller *eligible* switch-necessary tree (not necessarily
   `CB(d,m)`-shaped) using the same restricted-flow methodology demonstrated here (isolate a
   candidate subfamily `X`, compute its actual deletion-only vs. full max-flow against its true
   full neighbourhood) at trees up to `n≈40–60`, which this route's code supports directly.
3. **Cycle 2 U2's `CB(2,5)/10` table entry should be corrected** (or at minimum flagged) in a
   future controller pass: the correct values, confirmed three independent ways in this return,
   are `supply=259,980, capacity=396,460, S=-136,480` (matching the Cycle 3 worker brief's own
   cited fixed point), not `275,920 / 412,400` as printed in Cycle 2 U2's `RETURN.md`.
4. **Both candidate claims need an isolated second read before registration** (Ruling 18/26); the
   whole-network `W(x)` formula (Candidate 1) in particular should be checked against the
   pre-existing (unregistered) formula in Cycle 2 U2's `cb_target_rows.py` for exact algebraic
   equivalence, as asserted above, before any registration text is finalized.
5. **This route's own tooling** (`tree_lib.py`, `network.py`, `cb_gf.py`) is a general-purpose,
   independently-verified library for `CBstar(d,m,t)` construction, tree DP, brute-force
   independent-set enumeration, and exact Dinic max-flow; a successor working on any small-to-
   medium instance of this family (`n` up to roughly 30–40 for full brute force, arbitrary `n` for
   the closed-form supply/capacity totals when `F` = all leaves) can reuse it directly rather than
   re-deriving the branch decomposition from scratch.
