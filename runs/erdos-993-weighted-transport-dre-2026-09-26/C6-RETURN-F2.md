# RETURN — Route F2, Cycle 6, r30 (erdos-993-weighted-transport-dre-2026-09-26)

Route ID: `C6-F-02`. Orientation: F (falsify). Mechanism fingerprint: `FIRST-POSITIVE-SUMMAND-ELIGIBLE-ROW`.
Route text of record: `control/C6-ALLOCATION.md`, seat `F2`, "Object": *a counts-only exhaustive census of EVERY free
tree of orders 20, 21, 22 ... every eligible `p`, `F_p` derived, summands by DP; at the first such row (or the first
few), literal (HALL) by exact max-flow AND by an (INV)-quotient flow, recording whether switch arcs are load-bearing."
Load-bearing obligation (numbered item 4 of `## Mechanism fingerprints and load-bearing obligations`): the same object,
restated with the horizon-reporting requirement of ruling 42.

## Boot acknowledgment

VerityOS booted per `DISPATCH-F2.md`'s narrowed boot: read **exactly** `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and nothing else under VerityOS root (no task-type map,
memory, conversations, modules, skills, logs, or decisions directories were loaded — the controller has booted for the
run). This is the full VerityOS boot for this seat.

## Stage 2 seal verification

Recomputed SHA-256 over the canonical JSON (`sort_keys=True`, `separators=(",",":")`, no trailing newline) of
`control/C6-STAGE2-PACKET-MANIFEST.json` with its `seal_sha256` field removed:

```
29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611
```

This equals the manifest's recorded `seal_sha256` exactly (`match: True`, verified by direct recomputation, not by
reading the value out of the manifest and calling it done). Cited seal value: **`29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`**.

## Source digest verified

`sources/lower-region/inputs/ordinary_tree_checked.py` — SHA-256 `a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d`,
matches `control/SOURCE-DIGESTS.json` exactly (recomputed via `shasum -a 256`, not read off the manifest). This is the
only `sources/` file this route's own instruments depend on; it was read for its exact prose definitions (leaf, support,
`H_v`, `R_v`, `q_v`, `first_strict_descent`) and for the brief's warning about its `first_strict_descent` implementation
(see `## Derivation`, step 3) — no code from it is imported or executed by this route's scripts, which are freshly
written, self-contained, and independently self-tested (below).

## Read-boundary disclosures

1. While locating two Common-Brief-authorized files whose exact paths were not given verbatim in `DISPATCH-F2.md`
   (`AUTHORIZATION.md` and `control/R30-CHARTER-PROMPT.md`, both explicitly named as packet members in
   `C6-WORKER-COMMON-BRIEF.md`), this route ran `find "$RUN/control" -maxdepth 1 -iname "AUTHORIZATION.md" -o -maxdepth 1
   -iname "R30-CHARTER-PROMPT.md"` and `ls "$RUN/control"`, `ls "$RUN"`. Both files exist at the run root / `control/`
   (within the grant), and no directory above the grant was touched; `find`/`ls` are nonetheless named in the shared
   rules as tools bounded by the grant, so this is disclosed as a read-boundary item rather than treated as a silent
   non-event. No new file path outside the authorized reading list was discovered or read by this search.
2. `C6-ALLOCATION.md` erratum found and corrected as a record (not a re-proof of anything settled): the F2 route text
   states "a counts-only exhaustive census of EVERY free tree of orders 20, 21, 22 (317,955 / 823,065 / 2,144,505
   trees — state the horizon reached; ruling 42)". Independent generation (self-tested against `SEMANTIC-CONTRACT.md`'s
   own literal order-1..18 sequence, exact match at every order) gives: order 19 → 317,955; order 20 → 823,065; order
   21 → 2,144,505; order 22 → 5,623,756. The three literal counts in the allocation text are the A000055 values for
   orders **19/20/21**, not 20/21/22 — an off-by-one in the prose. This is independently corroborated by
   `cycles/cycle-6/stage2/ROUTE-STATE.md`'s statement that F2 inherits "the all-trees censuses of orders 13–19
   (C-F2-U to 19, ...)" — i.e. the predecessor's horizon already reached order 19, so this route's horizon correctly
   *starts* at order 20 (true count 823,065), not the literal 317,955 the allocation text attaches to that label. This
   route's census below uses the corrected order/count pairing throughout.

## IMPORT LIST (both scripts; standard library only)

`census_f2.py`: `__future__`, `sys`, `json`, `hashlib`, `time`, `argparse`, `itertools.combinations_with_replacement`.
`hall_check.py`: `__future__`, `json`, `hashlib`, `itertools.combinations`, `collections.deque`, `collections.defaultdict`.
No network, no third-party packages, no `pip`/`brew`/`npm`/`elan`. Exact Python integers throughout (no floats in any
counted or compared quantity; `time.time()` is used only for a human-readable timing field that is explicitly excluded
from every hashed digest).

## Derivation (step by step, naming where each hypothesis enters)

**Object.** For a finite ordinary tree `T` (`SEMANTIC-CONTRACT.md` §1.1: `G.IsTree`, connected and acyclic, `V`
nonempty — **IsTree enters at step 1 below, checked explicitly and separately for acyclicity and connectivity, not
assumed from the generator**), eligible `p` (`x(T)+2 ≤ p`, `3p < 2α(T)+1`, i.e. `p ≤ ⌊2α/3⌋` — **eligibility enters at
step 4**), the fixed original selector `F_p(T) = {v ∈ leafSet(T) : Δ_p(T-v) < 0}` (**the fixed selector enters at step
5**, evaluated once at rank `p` and never recomputed), and for each `v ∈ F_p(T)` the per-leaf term
`q_v(p) − q_v(p−1)` where `q_v(j) = i_j(H_v) − i_j(R_v)`, `H_v = T − {v, s_v}`, `R_v = T − N_T[s_v]` (**step 6**): this
route's object is to find the smallest order at which some `(T, p, v)` gives a STRICTLY POSITIVE term, or to report the
horizon at which none is found. This per-leaf term is the summand of the aggregate identity
`Σ_{v∈F}[q_v(p)-q_v(p-1)] = S(T,p)` (`SOLUTION-CONTRACT.md` §2 `layerWeight_sub_eq_sum`'s RHS); it does **not** involve
the active-tag weight `w_F`, the transport relation (D)∪(S), or any matching/Hall claim (**no active-tag witness enters
this route's census at all** — that is a deliberate scope boundary: this route computes a scalar per-leaf number, not a
mechanism, so none of the ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2 are engaged, revived, or at risk of
being revived by this work; see `## Registered claims named before this census`).

1. **Free-tree generation (finiteness + IsTree).** `census_f2.py`'s `generate_free_trees(n)` yields every free tree of
   order `n` exactly once, up to isomorphism, via canonical centroid construction: rooted trees are canonical nested
   tuples (`t = tuple(sorted(child canonical tuples))`); `get_rooted_trees(size)` builds ALL rooted trees of a small
   size (`size ≤ ⌊n/2⌋`) via `gen_forests`, a memoized recursive multiset-partition generator; the order-`n` free trees
   are exactly the results of `gen_forests(n-1, ⌊n/2⌋)` (i.e. rooted at a centroid — every direct branch ≤ `⌊n/2⌋`),
   de-duplicated by `reroot_if_bicentric`, which resolves the `n`-even two-centroid double-count by re-rooting at the
   sibling centroid and taking the lexicographic min of the two canonical signatures. `materialize(sig)` turns a
   canonical signature into an explicit 0-indexed adjacency list. **`is_tree(n, adj)` then checks acyclicity
   (`edge_count == n-1`) and connectivity (single BFS/DFS component covering all `n` vertices) SEPARATELY and
   EXPLICITLY, in code, on every materialized tree before any polynomial is computed** (`analyze_tree` raises if this
   fails; it never did, across every tree of every order below).
   *Self-test (correctness of the generator, not a claim in a proof):* `count_free_trees(n)` for `n=1..18` reproduces
   `SEMANTIC-CONTRACT.md`'s literal sequence `1,1,1,2,3,6,11,23,47,106,235,551,1301,3159,7741,19320,48629,123867`
   EXACTLY at every order (re-run from the copy-out replay directory, digest `e21e70e43f084a2aac601da5bb5abf5bdbe8c3d7c6b43d7431fdc2feaa3da0aa`,
   `selftest-result.json`), and further gives order 19 → 317,955, order 20 → 823,065, order 21 → 2,144,505, order 22 →
   5,623,756 (the erratum correction above).
2. **Independence polynomial (exact integers).** `tree_poly_rooted` computes `i_k(T)` for `k=0..α` by the standard
   tree DP (excluded/included polynomials per vertex, combined by exact-integer polynomial convolution, post-order over
   an explicit BFS spanning order — no recursion-depth risk at these orders). `forest_poly` computes the same for an
   arbitrary induced vertex subset by splitting into connected components (BFS) and multiplying each component's
   polynomial — this is how `H_v` and `R_v` (each possibly disconnected once `v`/`s_v`/`N[s_v]` are removed) are handled,
   uniformly and without hand-derived case splitting.
3. **`x(T)` through rank `α`, independently.** `delta_array(poly)` computes `Δ_k = i_{k+1}-i_k` for **every** `k =
   0..α` using zero-extension (`coeff` returns 0 out of range), so `Δ_α = -i_α < 0` is always included.
   `first_strict_descent_through_alpha` scans this full array. This is deliberately NOT a reuse of
   `ordinary_tree_checked.py`'s `first_strict_descent` (which the worker-common-brief flags as omitting the terminal
   zero-extension difference under some trims) — `x` is computed fresh, through rank `α`, by this route's own code, per
   the brief's explicit instruction.
4. **Eligibility.** `p_lo = x+2`, `p_hi = ⌊2α/3⌋` (from `3p < 2α+1 ⟺ 3p ≤ 2α ⟺ p ≤ ⌊2α/3⌋`, a ℕ inequality with no
   subtraction). A tree with `p_lo > p_hi` has empty eligibility and is recorded as ineligible (0 eligible rows), never
   silently dropped — `eligible_trees` in the census counts trees with `p_lo ≤ p_hi`.
5. **`F_p(T)`, derived per row, never hard-coded.** For every leaf `v` (`len(adj[v])==1`, and — since `n ≥ 3` in
   every tree considered here — the root vertex used for materialization is never itself degree-1, so leaves are
   exactly the empty-tuple bottom nodes; this is verified structurally, not assumed, since `is_tree` and explicit
   degree counts are used throughout, not the generator's internal root choice), `forest_poly` on `T` minus `{v}` gives
   `i_k(T-v)` for every `k` in ONE pass; `leaf_delta[v]` is `Δ_k(T-v)` for every `k`, computed once and reused for
   EVERY eligible `p` (no recomputation per `p`, but no shortcut on the definition either — `Δ_p(T-v) < 0` is checked
   at each specific eligible `p` from this array). `F_p(T) = {v : Δ_p(T-v) < 0}`, recomputed (from the same cached
   array) at each `p` — the selector is fixed at each individual `p`, never carried over from a neighboring rank.
6. **Per-leaf summand.** For `v ∈ F_p(T)`: `s = adj[v][0]` (the leaf's unique original neighbour, i.e. its support in
   the UNDELETED tree `T`); `H_v` = all vertices except `{v, s}`; `R_v` = all vertices except the closed neighbourhood
   `N[s] = {s} ∪ adj[s]` (which includes `v` automatically since `v ∈ adj[s]`); `h_poly = forest_poly(T, H_v)`,
   `r_poly = forest_poly(T, R_v)`; `q_v(p) = h_poly[p] - r_poly[p]`, `q_v(p-1) = h_poly[p-1] - r_poly[p-1]`; summand =
   `q_v(p) - q_v(p-1)`. Both `H_v` and `R_v` are evaluated on the ORIGINAL undeleted tree's adjacency (never a
   recomputed/deleted-graph neighbourhood), matching `SEMANTIC-CONTRACT.md` §3's "Original always refers to the
   undeleted tree `T`" convention.
7. **Correctness self-test against a registered fixed point (not evidence for a new claim; a check of the instrument).**
   `K_{1,12}` (`n=13`, star, center 0): this route's pipeline gives `α=12`, `x=6`, eligible `p∈{8}` only, all 12 leaves
   favorable, EVERY per-leaf summand `= -165`, sum `= -1980` — exactly the fixed point recorded in
   `SEMANTIC-CONTRACT.md` §1.2 (`supply 9·C(12,9)=1980, capacity 8·C(12,8)=3960, S=-1980`, `1980/12=165`). The
   companion `hall_check.py` (literal max-flow over the actual bipartite network of independent sets, active-tag
   weight, and the (D)∪(S) relation — used ONLY for this self-test and would be used again if a positive-summand row
   were found) independently reproduces `total_supply=1980`, `total_capacity=3960`, deletion-only max flow `=1980
   = total_supply` (Hall holds by deletion alone, matching the recorded fixed point's "no switch exists; deletion-only
   Hall holds"). Re-run from the copy-out replay directory; digest `e21e70e43f084a2aac601da5bb5abf5bdbe8c3d7c6b43d7431fdc2feaa3da0aa`
   (`selftest-result.json`, same file as the generator self-test above).

## Registered claims named before this census (`sources/authority/CLAIM-IDENTITY.json`, `claim_key` field checked
directly, not from memory)

- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — status `OPEN` in the master registry snapshot; this census neither
  proves nor refutes it (it computes no matching, no flow, no Hall statement on any of the censused trees — see the
  scope note in `## Derivation` above). Untouched.
- `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (the primary aggregate) — status `OPEN`; untouched (this
  census reports per-leaf SIGN data, never asserts or needs `S(T,p) ≤ 0` as an input, and no census value from this
  route is used as a step of any proof, per `SOLUTION-CONTRACT.md` §3.4).
- The ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2 (`E993-R23-LITERAL-DELETE-ONLY-HALL`,
  `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, `E993-R23-TAG-CLOSED-CUT-HALL`, `E993-R23-HOT-TAG-SINGLETON-HALL`,
  `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG`, `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`,
  `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`, `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`,
  `E993-LOWER-REGION-C4-T4-SIGNED-CROSS-TAG-INJECTIVITY`, `E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-COVARIANCE`,
  `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`, `E993-R28-TREE-LEAF-SLOT-DOMINANCE`, the predecessor's own-support
  unit-capacity rule (C6-F4)) — none is proposed, used, or revived here: this route asserts no matching, no per-tag
  injection, and no Hall-type inequality of any kind on any censused tree; it is a pure numeric census of one already
  well-defined quantity (the aggregate identity's per-leaf term). Distinct from all ten by construction, not by
  argument.
- `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID) — `formally_verified` this run (C1-LA1, per `C6-ALLOCATION.md`
  standing state); cited, not re-derived; this route's `q_v` computation is consistent with, but does not depend on
  or re-establish, the Lean-checked identity.
- `(LIFT)`, `(DCB)`, `(TSB)` — not used by this route.

## Alias check (lexical AND mathematical)

No new claim key is proposed by this route (see verdict below): the census is a numeric record extending the
inherited "no positive per-leaf summand" finding of orders 13–19 (`cycles/cycle-6/stage2/ROUTE-STATE.md`'s inheritance
line for F2) to orders 20, 21, and 22 (below) — the SAME predicate at a larger stated order range, not a new
statement. Lexically, no candidate key text was drafted (none of CD-1, CD-2, E1-R, R3, CT-1, R2′, L2, C1, A7, A5, F-3,
GK-MONO, E-1, E-2, N1–N7, `(L-S)_top`, `(ELIG-top)`, `𝒞_8`, `favorable-leaf aggregate`, `4k`, or `deletion injection`
appears anywhere in this return). Mathematically, the finding "no eligible row of order ≤ 22 has a positive per-leaf
summand" is not itself registered as a key (it is exactly the predecessor's `bounded_computation` record, extended by
order, per `SOLUTION-CONTRACT.md` §1 Tier-3 "bounded records" and §3.4 census discipline — a bounded fact never enters
a proof and is not itself a Tier-1/1′/2 key candidate).

## Census results

All runs: `python3 -B census_f2.py <order> --no-stop-early --out order<order>-result.json`, standard library only,
foreground/PID-polled (this route started each order as a background process and polled its literal PID in a bounded
loop — `kill -0 <PID>` — never a pattern kill, never a full process listing; every job was confirmed finished and its
PID reaped before the next order was launched and before this return was finalized).

| Order (corrected) | Trees generated (= A000055, self-verified) | Eligible trees | Eligible `(T,p)` rows | Leaf-summand rows checked | Global max summand | Global min summand | First positive found | Wall time (local) | Result digest (excl. timing field) |
|---|---|---|---|---|---|---|---|---|---|
| 20 | 823,065 | 394,693 | 406,262 | 3,992,600 | 0 | −13,260 | no | 471.351 s | `0661a79e6dfbe104072c9606ad5d025c99a84069dfeec8fcd6baa165999ca47f` |
| 21 | 2,144,505 | 808,972 | 880,489 | 9,557,583 | 0 | −25,194 | no | 1185.723 s | `77117ba57ece20b34b07b508606fc6b80f17d53574df1682150e59131e4d4d6f` |
| 22 | 5,623,756 | 2,659,885 | 2,959,314 | 34,332,403 | 0 | −48,450 | no | 4474.303 s | `aa1aaa352f0be75b856c6ac64c8de2c35b26efeb3fb2b758eae9a64e9316fb02` |

Every row above carries `x`, `Δ_k` (via the full `delta_array` computed through rank `α` for every tree and every
leaf-deletion, per `## Derivation` steps 3 and 5), `α`, `p` (the full eligible range `p_lo..p_hi` per tree, not a
single value), `|F_p|` (recorded per tree internally; aggregated here as the row/summand counts), and the graph
(every tree is available by exact edge list via `edges_of`, and the full witness below gives one explicitly) — the
per-tree, per-row breakdown is not printed in full in this table (3,992,600 + 9,557,583 + more rows would not fit any
document) but is exactly what `census_f2.py`'s deterministic pass computes and digests; **every claim above is
reproducible bit-for-bit by the copy-out replay command below**, which is the ledger of record for these counts (not
this table).

**Horizon reached:** orders 20, 21, AND 22 are all FULLY covered (every one of 823,065 / 2,144,505 / 5,623,756 trees
respectively was scanned to completion, `--no-stop-early` in force throughout; ruling 42). This route's full stated
object (orders 20, 21, 22, corrected per the erratum above) is completed.

**No positive per-leaf summand was found in orders 20–22** (max summand observed: 0, attained). Full reported witness
row (graph, `α`, `x`, `p`, `|F_p|`, `Δ_p`, `S(T,p)`, per the gate-31 reporting convention): tree `T` on `n=20` vertices,
edges `{(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(0,9),(0,10),(0,11),(0,12),(0,13),(0,14),(0,15),(0,16),(0,17),
(0,18),(18,19)}` — a center `0` of degree 18 (17 pendant leaves `1..17` plus one length-2 pendant path `0–18–19`) — has
`α=18`, `x=9`, eligible range `p∈{11,12}`. At `p=11`: `|F_11|=18` (every leaf favorable), `S(T,11)=−178,568`; the
private leaf `19`'s own `Δ_11(T−19) = −13,260` (this is why `19 ∈ F_11`) and its summand `q_19(11)−q_19(10) = 0`. At
`p=12`: `|F_12|=18`, `S(T,12)=−167,076`; leaf `19`'s `Δ_12(T−19) = −9,996` and its summand `q_19(12)−q_19(11) = 0`.
Leaf `19` is the row with summand exactly `0` at both eligible ranks — the closest any row in orders 20–22 comes to
positive; every other favorable leaf at both ranks (the 17 pendant leaves `1..17`, by the tree's symmetry all equal)
has summand `−10,504` at `p=11` and `−9,828` at `p=12` — well short of the order-20 global minimum summand
(`−13,260`, attained by some other tree in the full census, not this one; this witness is reported for its
zero-summand row only, not as any kind of extremal-negative example). Active-tag weight `w_F`, supply, and capacity are N/A for
this row: this route did not run a literal max-flow / (INV)-quotient-flow check on this or any other row, because the
route's flow-check obligation is conditional on finding a STRICTLY POSITIVE summand row, and none was found; running
the (otherwise ready) `hall_check.py` machinery on a zero-summand row would demonstrate nothing beyond what the
K_{1,12} self-test already demonstrates (the machinery works) and was left undone to protect the time budget for
completing the stated order range instead.

## Copy-out-first replay

Scripts copied verbatim into `scratchpad/c6-F2-replay/` before any of the confirmatory runs below were executed there
(never in place, never onto an inventoried artifact):

- `scratchpad/c6-F2-replay/census_f2.py` — SHA-256 `ed81931011af7771b5fee18dbf3ada7fb6b3930f38fa071287e62f843bd37d55`
  (byte-identical to the working copy at `scratchpad/c6-F2/census_f2.py`).
- `scratchpad/c6-F2-replay/hall_check.py` — SHA-256 `83f178482f148f0c214cbac07bc5c61bc6ae798cea40a904b96a5e0a26b44be5`
  (byte-identical to `scratchpad/c6-F2/hall_check.py`).

Confirmatory runs actually executed FROM the replay directory (cheap ones, re-run in full there as the reproducibility
proof): the order 1–18 generator self-test and the K_{1,12} fixed-point + deletion-only-Hall self-test, plus the
order-19 and order-20 tree COUNTS (generation only, not full per-tree analysis) — all four reproduced exactly, digest
`e21e70e43f084a2aac601da5bb5abf5bdbe8c3d7c6b43d7431fdc2feaa3da0aa` (`scratchpad/c6-F2-replay/selftest-result.json`).

The full per-order census digests in the results table (`0661a79e...`, `77117ba5...`, `aa1aaa35...`) were produced
once each, deterministically, from `scratchpad/c6-F2/census_f2.py` (byte-identical to the replay copy above);
re-running them a second time from the replay directory would reproduce the identical digest (the algorithm depends
on nothing but the standard library, exact integers, and the order argument — no cwd, wall-clock, PID, or host
dependence anywhere in the hashed fields) but was not repeated a second time given the 471.351 s / 1185.723 s /
4474.303 s runtimes already spent once each (order 22 alone ran 74.6 minutes as a foreground-equivalent, PID-polled
background job — PID 64096, launched, polled by literal PID in a bounded loop, confirmed exited, never detached and
forgotten); the exact replay command for anyone who wants to reproduce them a second time, from a clean copy, is:

```
cd <run root>/scratchpad/c6-F2-replay
python3 -B census_f2.py 20 --no-stop-early --out order20-result.json
python3 -B census_f2.py 21 --no-stop-early --out order21-result.json
python3 -B census_f2.py 22 --no-stop-early --out order22-result.json
```

## Grades

- Generator correctness (orders 1–18 vs. `SEMANTIC-CONTRACT.md`'s literal sequence): `bounded_computation`,
  exhaustive and exact (self-test, not a claim in the run's proof structure).
- Order-20 and order-21 "no positive per-leaf summand" census: `bounded_computation`, exhaustive over the full stated
  order (every tree scanned; ruling 42), exact integer arithmetic throughout, independently digested and replayable.
  Never evidence in a proof (`SOLUTION-CONTRACT.md` §3.4); a record only.
- Order-22 "no positive per-leaf summand" census: `bounded_computation`, exhaustive over the full order (all
  5,623,756 trees scanned), exact integer arithmetic, independently digested and replayable. Never evidence in a
  proof; a record only.
- The `C6-ALLOCATION.md` order/count erratum: a record correction, not a proof step.

## headline_resolved: no

(HALL) is neither `formally_verified` nor refuted by this route, and per `C6-WORKER-COMMON-BRIEF.md` item 6 the
headline stays `no` this cycle regardless of any route's individual product.

## Route verdict: bounded_evidence

This route neither proves nor refutes (HALL), produces no compiled Lean declaration, and is not blocked — it produces
an exhaustive, exact, replayable numeric record over the FULL stated (corrected) order range 20–22, extending the
predecessor's "no positive per-leaf summand" finding from orders 13–19 to orders 20, 21, AND 22 (823,065 + 2,144,505
+ 5,623,756 = 8,591,326 trees scanned in full; zero positive-summand rows among 3,992,600 + 9,557,583 + 34,332,403
= 47,882,586 total leaf-summand rows checked across the three orders), with one exact zero-summand witness recorded.
`bounded_evidence` per
`SOLUTION-CONTRACT.md` §4's grade ordering (this is squarely `bounded_computation`-grade data, offered as evidence
toward — never a substitute for — a uniform theorem or a cut).

## Remaining obligation

A successor inherits: (1) the corrected order/count table (order 19→317,955 already covered by the predecessor;
orders 20→823,065, 21→2,144,505, AND 22→5,623,756 now ALL fully covered by this route with zero positive summands
found anywhere in the three orders — this route's full stated object, as corrected, is complete; a successor's
horizon starts at order 23); (2) the zero-summand witness tree (center-plus-one-extra-pendant-path shape,
`n=20`) as a structural hint — the mechanism that drives a summand to exactly 0 (a private leaf on a length-2 pendant
path off a high-degree hub) is a natural place to look for a PUSH past zero at a slightly larger or differently
shaped tree (e.g. two or more such pendant paths, or a longer pendant path, off the same hub) — this route did not
pursue that structural search (it ran the flat exhaustive census the route text specifies, order by order, not a
targeted search) and flags it as a promising direction rather than asserting anything about it; (3) brute-force
exhaustive census cost grows too fast to continue this route's method past order ~22–23 (`A000055(23) = 14,828,074`,
roughly 2.6× order 22, and per-tree cost also grows with `n`) — a successor should prefer a TARGETED search (e.g.
seeded by the structural hint in (2), or restricted to trees containing a high-degree hub with several short pendant
paths, rather than every free tree of a given order) over continuing the flat exhaustive enumeration; (4) the ready,
self-tested `hall_check.py` literal max-flow / (INV)-quotient-flow instrument, untouched by this route beyond its
K_{1,12} self-test, for immediate use the moment any successor's census (targeted or exhaustive) produces a positive
per-leaf summand row.

## Model disclosure

Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); runtime-reported model id:
`claude-sonnet-5` (as stated by this session's own system context; this route did not independently query a
runtime-introspection endpoint beyond what the harness discloses).
