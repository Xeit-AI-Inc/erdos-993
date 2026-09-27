# Route U2 Return — r30 Cycle 4, `C4-U-02 SWITCH-SHARE-ALLOCATION-LEMMA`

Route ID: `C4-U-02`. Orientation: U (formal/structural). Mechanism fingerprint:
`SWITCH-SHARE-ALLOCATION-LEMMA`. Load-bearing obligation (`control/C4-ALLOCATION.md`,
numbered item 6): "(a) An (SW) lemma: an exact rational switch-share allocation rule for
a deficient sector, verified by exact summation against literal max-flow on
brute-forceable laboratories (the order-8 tree, `CB(4,1)/4`, the non-eligible `CB(d,1)`
sectors, the eligible `CBstar(2,2,2)/7`), with eligibility and derived `F_p` as named
hypotheses (B8/B9 show rescue fails without them). (b) Its lift to the `CB(8,·)` coupled
families, converging with T1 as the certificate primal."

**Central obligation attempted: yes** — an exact rational switch-share allocation
(capacity) rule for the root-plus-arm sector, verified against literal max-flow on every
required laboratory, plus a genuinely new sharper finding (below); part (b)'s lift to the
`CB(8,·)` coupled families is attempted structurally, with small-scale computational
evidence, but is NOT completed to an exact formula at that scale — see `## Remaining
obligation`.

## Boot acknowledgment

VerityOS booted for this seat by reading EXACTLY the two authorized files and nothing
else: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Per
`control/C4-WORKER-COMMON-BRIEF.md`, the startup protocol's own task-type map and its
pointers into `memory/`, `conversations/`, `modules/`, `skills/`, `logs/`, `decisions/`
were NOT followed (the controller has booted for the run).

## Read-boundary disclosure

None. Every file read this session is one of: the two authorized boot files; the sealed
Cycle 4 Stage 2 packet's `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`,
`control/C4-ALLOCATION.md`, `control/C4-STAGE1-GATE.md`,
`cycles/cycle-4/stage2/ROUTE-STATE.md`, `control/C4-WORKER-COMMON-BRIEF.md`,
`control/C4-STAGE2-PACKET-MANIFEST.json`, `control/SOURCE-DIGESTS.json`; the Cycle 3
inheritance items explicitly named as readable sources of record by the brief
(`cycles/cycle-3/stage6/SYNTHESIS.md`, `cycles/cycle-3/stage3/returns/U2/RETURN.md`);
`sources/lower-region/inputs/ordinary_tree_checked.py` (digest-verified, read for
reference, not reused verbatim); one targeted `sha256sum`/`grep -n`/single-file lookup
each against `sources/authority/CLAIM-IDENTITY.json` and
`control/CLAIM-IDENTITY.run-local.json` for exact key-name confirmation (single-file
greps, the precedent the Cycle 3 U2 return itself records using). No `find`, `grep`,
`rg`, `ls -R`, glob `cat`, or recursive listing was run rooted above this route's grant;
two non-recursive single-directory `ls` calls were made, both inside subtrees the brief
explicitly authorizes by glob (`cycles/cycle-3/stage3/returns/` and
`cycles/cycle-3/stage6/`), solely to resolve the brief's own `*` wildcard. Nothing under
`sources/`, `scratchpad/` outside `c4-U2`/`c4-U2-replay`, or any other experiment root was
read or written.

## Stage 2 seal and source digests

Stage 2 packet seal (`control/C4-STAGE2-PACKET-MANIFEST.json`), recomputed as SHA-256 of
the canonical JSON of the manifest with `seal_sha256` removed (`sort_keys=True`,
separators `(",", ":")`, no trailing newline):

- claimed: `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`
- recomputed: `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`
- **MATCH.**

Source digest verified against `control/SOURCE-DIGESTS.json` (the only `sources/` file
this route reads content from):

- `sources/lower-region/inputs/ordinary_tree_checked.py`: manifest records `bytes: 16710`,
  `sha256: a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d`; independently
  recomputed with `shasum -a 256` on the live file: same value, same byte count. **MATCH.**
  (This file implements the OLD, refuted r23 Delete/Retag relation, not this run's
  active-tag weight or (D)∪(S) switch relation; it is read for context only. Every
  routine used below is written fresh for this route — see IMPORT LIST and code.)

`control/C4-STAGE2-PACKET-MANIFEST.json`'s dispatch-time seal
(`f0b5a2a1…0869684`) is cited as the seal value throughout this return, per requirement 1.

## Registered claims named before any census or flow (SOLUTION-CONTRACT §1, §3.2)

Before presenting any table, count, or flow below, this route names every registered
claim it touches:

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — Tier 1, OPEN. This route
  neither proves nor refutes it. Everything below is bounded/finite-family evidence about
  a NAMED sub-family (`CB(d,1)`'s root-plus-arm sector, `d` up to 9), never a universal
  claim, and every instance used is flagged non-eligible (mechanism-validation only, per
  SOLUTION-CONTRACT §3 fence 1/4) except `CBstar(2,2,2)/7`, which is eligible and is used
  only to reproduce an already-recorded Cycle 3 fixed point (E-g), not as new (HALL)
  evidence.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — asserted and confirmed, from
  two independently computed sides, on every one of the three headline laboratories
  (order-8 tree, `CB(4,1)/4`, `CBstar(2,2,2)/7`) and on every one of the 34 `CB(d,1)`
  instances swept below. This route re-confirms it as a computational instrument check
  (never a new proof of the identity itself, which is C1-LA1's `formally_verified` object
  from a prior cycle).
- **(LIFT)** `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` — named, NOT used as a proof
  ingredient here. Every flow computation below is a LITERAL flow on the ORIGINAL graph
  (brute-force independent-set enumeration + exact-integer max-flow), never a
  quotient-then-lift argument, so (LIFT)'s hypotheses are never invoked and its "does NOT
  supply quotient feasibility" caveat is moot for this route's own claims. (LIFT) is named
  in `## Remaining obligation` as the natural tool for completing part (b) at `CB(8,·)`
  scale, where literal enumeration is impossible.
- **The five-row deletion-Hall key**
  `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`,
  **E1** `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, and
  the **Cycle 2 sector Hall** at `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492` — named,
  untouched. This route works on `CB(d,1)` (`m = 1` choke), never on the `CB(8,86/89/92)`
  rows themselves; part (b) explains why the `m = 1` mechanism found here is NOT expected
  to threaten those already-`computer_assisted`-graded results (more chokes give more
  independent switch pivots — see `## Part (b)`).
- **B7, B8, B9** (Cycle 3 `cycles/cycle-3/stage6/SYNTHESIS.md`, lines 195–197, `STATED`,
  `proved_informal`, not yet independently registered): B7 (rational-flow verification
  lemma), B8 (`CB(1,m)`: every switch target of a root-plus-arm source has weight 0, any
  tag set), B9 (`CB(d,1)` whole-sector sums at `p = k+1`: `2^k·C(d,k)` against
  `C(d,k−1)(2^{k−1}+k−1)`). This route CONFIRMS B8 exactly (Section "B8/B9 confirmation"
  below), CONFIRMS B9's first quantity exactly, and SHARPENS B9's second quantity: B9's
  pairing silently assumes `F_p` = all leaves; this route derives the two-indicator exact
  formula that B9 collapses to when both indicators are 1, exhibits an instance where they
  split (`CB(7,1)/5`), and — independently of that split — exhibits an instance where
  B9's own two-sum comparison PASSES yet the sector is still genuinely Hall-deficient at a
  proper sub-family (`CB(7,1)/6`). B9's literal text is never re-derived as this route's
  own contribution; it is confirmed, then gone beyond.
- **Ten refuted mechanisms + the predecessor's own-support rule** (SOLUTION-CONTRACT §3.2:
  `E993-R23-LITERAL-DELETE-ONLY-HALL`, `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`,
  `E993-R23-TAG-CLOSED-CUT-HALL`, `E993-R23-HOT-TAG-SINGLETON-HALL`,
  `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG`,
  `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`,
  `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`,
  `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`,
  `E993-LOWER-REGION-C4-T4-SIGNED-CROSS-TAG-INJECTIVITY`,
  `E993-LOWER-REGION-LOCAL-MARKED-ADDABILITY-NONPOSITIVE-COVARIANCE`,
  `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`, `E993-R28-TREE-LEAF-SLOT-DOMINANCE`; C6-F4's
  own-support unit-capacity rule). None is this route's mechanism: this route makes no
  claim about delete-only Hall, no retag relation, no down-map injectivity, no covariance
  bound, no degree/SDR statement, and no own-support unit-capacity rule; its object is a
  literal, exact, finite (D)∪(S) capacity computation on a NAMED family (`CB(d,1)`'s
  root-plus-arm sector) with the fixed active-tag weight `w_F` of SEMANTIC-CONTRACT §1.2,
  nothing else.
- **Struck items** (`cycles/cycle-3/stage6/SYNTHESIS.md`, "Refuted or narrowed
  mechanisms"): U2's own Cycle 3 error — "the `CBstar(2,2,2)` corroboration" and
  `deletion_only_Hall_holds` treated as if a WHOLE-SECTOR inequality certified (HALL-COND)
  — is the exact mistake this route is careful NOT to repeat. Every Hall claim below is
  either (i) a literal max-flow computation (which certifies (HALL-COND) for the tested
  `X` by max-flow/min-cut, not by a single aggregate inequality), or (ii) explicitly
  flagged as "aggregate/whole-sector only, NOT a Hall certificate" when that is all it is.
  Cycle 3's struck "smallest"/"first" literals and hand-typed digit counts are not
  repeated; every count below is generator-produced and hashed.

## IMPORT LIST (standard library only; union over every script in this return)

`itertools.combinations`, `collections.deque`, `collections.Counter`, `typing`
(`Dict`, `FrozenSet`, `List`, `Sequence`, `Set`, `Tuple` — type hints only, no runtime
behavior), `math.comb`, `json`, `hashlib`, `sys`, `time` (wall-clock is reported
separately in prose and in each result file's `elapsed_seconds` field, and is NEVER
included in the hashed payload — checked by inspection of each script's
`sha256_of_obj`/digest call, which is always over a `results`/`rows`/`payload` object that
excludes `elapsed_seconds`). No third-party packages. No network. Every script is run as
`python3 -B` (no bytecode written; verified by inspection — no `__pycache__` under
`scratchpad/c4-U2/`, `scratchpad/c4-U2-replay/`, or `sources/`).

Scripts (all under `scratchpad/c4-U2/`, copied byte-identically to
`scratchpad/c4-U2-replay/` and re-run there — see "Replay" at the end of each section):
`tree_lib.py` (graph, `IsTree` check, forest-DP independence polynomial, `x` through
`α`), `families.py` (`CB(d,m)`/`CBstar(d,m,t)` constructors, the order-8 tree),
`network.py` (the (D)∪(S) network of SEMANTIC-CONTRACT §1.2/§2, active-tag weight,
literal exact-integer max-flow via Edmonds–Karp with min-cut extraction), `wid.py`
(the WID aggregate formula, an INDEPENDENT computation path from `network.py`'s
brute-force layer weights), `run_labs.py`, `run_b9.py`, `run_sw_lemma.py`,
`run_j0_sweep.py`, `run_multichoke.py`, `run_cb42_probe.py`.

## Where every hypothesis enters (derivation map)

- **`IsTree` (acyclicity and connectivity, separately).** `tree_lib.is_tree_exact`
  checks `|E| = n − 1`, then acyclicity by union–find (an edge that would close a cycle is
  rejected AT THAT EDGE, before anything else is computed), then connectivity by an
  explicit BFS from vertex 0 counting reached vertices — two independent passes, both
  required. Run on every tree instance below (order-8 tree; `CB(d,1)` for `d = 2..9`;
  `CB(4,1)`; `CBstar(2,2,2)`; `CB(2,2)`, `CB(3,2)`, `CB(2,3)`, `CB(4,2)`): every instance
  passes (asserted in code — the scripts `assert` on `is_tree_exact` and would raise
  otherwise; none did).
- **Finiteness.** Every tree below is a concrete, finite, labelled Python object (`n` a
  concrete `int`); `forest_independence_polynomial` returns a finite coefficient list by
  a terminating tree-DP recursion (bounded by `n`); `independent_sets_of_size` terminates
  because `itertools.combinations` over a finite vertex set is finite.
- **Eligibility (`x + 2 ≤ p`, `3p < 2α + 1`).** `x` is computed by
  `crossing_index_through_alpha`, which scans `k = 0, …, α` INCLUSIVE — never omitting the
  terminal zero-extension difference (`Δ_α = −i_α < 0` always), unlike the authorized
  evaluator's own documented caveat about `first_strict_descent`. `α` is `len(poly) − 1`
  (the tree-DP polynomial's own top nonzero coefficient — the graph always has ≥ 1 vertex,
  hence ≥ 1 independent set of every size up to `α`, so this is well-defined). EVERY row
  below reports `n, α, x` and states plainly whether `p` is inside `[x+2, ⌊2α/3⌋]`; every
  `CB(d,1)` row used is OUTSIDE that window (non-eligible; e.g. `CB(7,1)`: `α = 9, x = 6`,
  window `[8, 6]` — empty, since `x + 2 = 8 > ⌊2·9/3⌋ = 6` — so `CB(7,1)` has NO eligible
  rank at all, and every `CB(7,1)` row below is explicitly a mechanism-validation
  laboratory, never (HALL) or aggregate evidence, per SOLUTION-CONTRACT §3 fences 1 and 4);
  the order-8 tree (`α=5,x=3`, window `[5,3]`, empty) and `CB(4,1)` (`α=6,x=4`, window
  `[6,4]`, empty) are the two Cycle 3 fixed points, both non-eligible by construction (as
  Cycle 3 recorded); `CBstar(2,2,2)` at `p=7` (`α=11,x=5`, window `[7,7]`) IS eligible —
  the unique eligible lab used, and only to reproduce Cycle 3's own recorded row.
- **The fixed selector `F = F_p(T)`.** `network.favorable_leaves` computes, for every
  leaf `v`, `Δ_p(T − v)` by a FRESH tree-DP on `T − v` (not memoized against `T`'s own
  polynomial), and selects `v` iff that value is `< 0` — DERIVED on every row, never
  hard-coded "all leaves". This is where the route's central finding lives: on `CB(d,1)`,
  `v` (the arm tip) and the private leaves (all sharing one favorability status, by the
  `S_d` column symmetry of `Aut(CB(d,1))`) are favorable or not INDEPENDENTLY of each
  other, and the two conditions split at `CB(7,1)`, `p=5` (`k=4`): `v` favorable, private
  leaves NOT favorable (`run_b9.py`, `run_sw_lemma.py` — see below).
- **The active-tag witness and the literal relation.** `network.active_weight` counts
  `v ∈ F∩B` with `(B∖{v}) ∩ W_v ≠ ∅` literally, `W_v = N_T(s_v)∖{v}` computed from the
  live adjacency — never `|F∩B|`. `network.deletion_targets`/`switch_targets` build (D)
  and (S) directly against the adjacency (`|N(u)∩B| = 2`, `u ∉ B`, literal), never a
  shortcut. Hand-traced on one instance (`CB(3,1)`, `p=3`, `k=2`): a source
  `B = {r=0, v=2, b_{0,0}=4, c_{0,1}=7}` (choke `u_0 = 3` absent; column 0 type S,
  column 1 type L) has `N(u_0) ∩ B = \{0, 4\}` (size 2), so the switch fires with
  `A = (B ∖ \{0,4\}) ∪ \{3\} = \{2,3,7\}`; `w_F(A)`: `v = 2 ∈ A` but its witness `W_v =
  \{0\}` (`0 = r`) is ABSENT from `A ∖ \{2\}`, so `v` is inactive; the private leaf `7`'s
  witness is `\{u_0\} = \{3\}`, now PRESENT, so it is active; `w_F(A) = 1 = (k−1)·1_c$
  with `k=2, k−1=1` — exactly the formula below, reproduced by hand on this smallest
  nontrivial instance before any generator is trusted.
- **Group invariance (`Aut(CB(d,1)) ⊇ S_d`).** Used ONLY to justify that a single
  representative private leaf's favorability status stands for all `d` of them (checked
  directly for `d ≤ 9` by evaluating one representative, never assumed a priori beyond
  that direct check); no orbit-quotient/equitable-partition machinery is invoked for the
  route's own claims (that is (LIFT)'s domain, named but not used here — see above and
  `## Remaining obligation`).

## Part (a): the three required fixed-point laboratories (`run_labs.py`)

Every row asserts WID (`supply − capacity = S`) from two INDEPENDENTLY computed sides:
side 1 is `Σ w_F(B) − Σ w_F(A)` from the brute-force layer/network enumeration
(`network.py`); side 2 is `Σ_{v∈F} [q_v(p) − q_v(p−1)]` from a SEPARATE forest-DP on
`H_v = T−\{v,s_v\}` and `R_v = T − N[s_v]` (`wid.py`) — a different code path computing a
different combinatorial object, never the same polynomial reused, so this is not the
non-falsifiable check Cycle 2's ruling 17 struck.

| Lab | `n` | `α` | `x` | `p` | window | eligible | `\|F\|` | `F`=all leaves | supply | capacity | `S` (2 sides) | WID | mixed flow | del-only flow | Hall (mixed) | Hall (del) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| order-8 tree (edges 0-1,1-2,2-3,2-6,2-7,3-4,3-5) | 8 | 5 | 3 | 3 | [5,3] | no | 5 | yes | 29 | 32 | −3 / −3 | ✓ | **29** | 27 | **yes** | no |
| `CB(4,1)` | 12 | 6 | 4 | 4 | [6,4] | no | 5 | yes | 60 | 60 | 0 / 0 | ✓ | **60** | 52 | **yes** | no |
| `CBstar(2,2,2)` | 17 | 11 | 5 | 7 | [7,7] | **yes** | 9 | yes | 2194 | 3888 | −1694 / −1694 | ✓ | **2194** | 2194 | **yes** | **yes** |

These three rows match the Cycle 3 fixed points EXACTLY as recorded in
`SOLUTION-CONTRACT.md`/the common brief (order-8 tree: `29/32/−3`, mixed 29, deletion-only
27; `CB(4,1)/4`: `60/60/0`, deletion-only 52, mixed 60) and
`cycles/cycle-3/stage6/SYNTHESIS.md` E-g (`CBstar(2,2,2)/7`: `2194/3888/−1694`,
deletion-only saturates) — an independent, from-scratch reproduction (not a re-copy) of
all three, using the LITERAL (D)∪(S) network and exact-integer max-flow rather than a
whole-sector inequality.

`num_switch_edges_present` (present in `run_labs_RESULT.json`, not tabulated above for
space): order-8 tree 11, `CB(4,1)` 92, `CBstar(2,2,2)` 1100 — switch arcs exist in
abundance in all three, but only the order-8 tree and `CB(4,1)` NEED them (`CBstar(2,2,2)`
already saturates by deletion alone, exactly as Cycle 3 found).

Replay: `cd scratchpad/c4-U2-replay && python3 -B run_labs.py` — `RESULT_SHA256:
8382dbe8abbe97410296c2d229e5f82e6c117b5ca80d7c2baf1902dbadddc241`, reproduced
byte-identically from a copy-out-first replay directory (verified this session; both the
original `scratchpad/c4-U2/run_labs_RESULT.json` and the replay copy carry this digest).

## B8/B9 confirmation and sharpening (`run_b9.py`, `run_sw_lemma.py`, `run_j0_sweep.py`)

### B8, confirmed exactly

For `CB(1,m)`, `m ∈ \{1,2,3,5,7\}`, `p ∈ \{2,3,4\}`, BOTH with `F = F_p(T)` (derived) and
with `F` = the full leaf set (testing B8's own "for any tag set" claim): every switch
target reachable from a root-plus-arm source has weight exactly 0 (`run_b9.py`,
`b8_check`; 15 `(m,p)` combinations × 2 tag-set choices = 30 checks, all `all_zero: True`).
B8 is CONFIRMED, not re-derived as new content.

### B9, confirmed at its stated scope, then split

`run_b9.py` and `run_sw_lemma.py` sweep `CB(d,1)`, `d = 2..8` (`run_b9.py`) and `d=2..9`
(`run_sw_lemma.py`'s systematic pass), every `k = 1..d` (`p = k+1`), and derive, from the
`IsTree`-checked, `F_p`-DERIVED network:

Writing `1_v := [v ∈ F_p]`, `1_c := [$a private leaf$ ∈ F_p]` (well-defined as a single
0/1 value across all `d` private leaves, by the `S_d` column symmetry of `Aut(CB(d,1))`,
checked directly for every `d ≤ 9` tested):

```
supply(X_sec)                = 2^k · C(d,k) · 1_v
cap(N_D(X_sec))               = 2^(k-1) · C(d,k-1) · 1_v
cap(N_D(X_sec) ∪ N_S(X_sec)) = cap(N_D(X_sec)) + (k-1) · C(d,k-1) · 1_v · 1_c
```

where `X_sec := \{B ∈ I_{p+1}(T) : r, v ∈ B\}` (SEMANTIC-CONTRACT's own root-plus-arm
sector notation). **Derivation** (hand-traced above, generator-verified below): `CB(d,1)`
has ONE choke `u_0 ~ r`; `r ∈ B` forces `u_0 ∉ B` (adjacency), so `u_0` — the sole witness
any private tag could ever activate through — is absent from every sector member AND
from every deletion descendant that still contains `r`; hence the ONLY possible
weight in the sector or its in-sector deletion image is from `v` (active iff `r ∈ B`,
always true in the sector), giving the `1_v`-only supply/`cap_D` formulas. The unique
extra switch pivot is `u_0` itself, valid exactly when a source has EXACTLY one
"support-present" active column (`|N(u_0) ∩ B| = 1 + j(B) = 2 ⟺ j(B) = 1`); firing it
removes `r` (deactivating `v`) and activates every OTHER present private leaf (their
witness `u_0` is now present); the vacated support column becomes indistinguishable from
an unused column in the resulting target, so the `C(d,k−1)` choices of which `(k−1)`
columns are leaf-present give `C(d,k−1)` DISTINCT new targets of weight `(k−1)·1_c` each
— giving the `+ (k−1)·C(d,k−1)·1_v·1_c` term. No other vertex ever qualifies as a switch
pivot in `CB(d,1)`: `s` always yields a weight-0 target (removes `r,v`, gains nothing,
confirmed by hand-trace); any unoccupied support `b_{0,l}` has at most 1 neighbour in `B`
(`u_0` is never present), so it never reaches `|N(b)∩B|=2`.

**Verification: `ALL ANALYTIC FORMULAS MATCH BRUTE FORCE: True`** — for every one of the
35 systematically swept `(d,k)` pairs, `d = 2..9`, the three formula values equal the
independently brute-force-enumerated `supply_brute`/`capD_brute`/`capU_brute` EXACTLY
(`run_sw_lemma.py`'s per-row `formula_matches_brute` field; `run_j0_sweep.py`'s `j0=0`
case reconfirms it on a further 5 pairs). This is `E993-R30-CB-D1-ROOT-ARM-SECTOR-EXACT-SWITCH-CAPACITY`
(candidate key; see `## Claim registration`).

**B9's literal two-sum pairing `2^k·C(d,k)` vs `C(d,k−1)(2^{k−1}+k−1)`** is exactly this
route's `supply` vs `cap_union` WHEN `1_v = 1_c = 1` (the tacit case B9 states). This
route's finding: `1_v` and `1_c` are independent, DERIVED facts, and split at
**`CB(7,1)`, `p = 5` (`k = 4`)**: `1_v = 1` (`v` favorable: `Δ_5(CB(7,1)−v) < 0`), `1_c = 0`
(a private leaf is NOT favorable at this `p`). Consequence: `cap_union = cap_D = 280`
(ZERO switch rescue — not the `385` B9's naive formula would give), while
`supply = 560`; the sector is deficient by `280`, confirmed by a LITERAL sector-restricted
max-flow (`run_sw_lemma.py`'s spot check): `supply_Xsec = 560`, `literal_flow_mixed =
280 = literal_flow_deletion_only`. This is exactly "B8/B9 show rescue fails without
[eligibility and derived `F_p`]" (`control/C4-ALLOCATION.md`'s own words for this route,
`cycles/cycle-4/stage2/ROUTE-STATE.md`'s inherited item) made explicit and exhibited.

Replay: `cd scratchpad/c4-U2-replay && python3 -B run_b9.py` — `RESULT_SHA256:
4056e0bf29972e9ba1d5f2b3a717dce95d770fa28fab89d74f1024a839be0e1d`; `python3 -B
run_sw_lemma.py` — `RESULT_SHA256:
9ded05e35823e0b81ac1ef18544d36c50fecddd40ec6ff4cae1030e57ccbbc04`. Both reproduced
byte-identically in the copy-out-first replay directory this session.

## The deeper finding: the whole-sector aggregate is necessary, NOT sufficient, for (HALL-COND)

`run_sw_lemma.py`'s literal sector-restricted max-flow spot checks turned up a SECOND,
independent failure mode, at an instance where `1_v = 1_c = 1` (B9's formula fully
"applies", `supply ≤ cap_union`, so nothing above flags a problem):

**`CB(7,1)`, `p = 6` (`k = 5`):** `supply(X_sec) = 672`, `cap_union` (formula) `= 700`
(`672 ≤ 700`, i.e. B9's own two-sum test PASSES — no deficiency visible at the aggregate
level) — yet the LITERAL max flow is only **651**, a genuine deficiency of **21**.

`run_j0_sweep.py` explains and generalizes this exactly. Partition `X_sec` by
`j(B) :=` the number of support-present ("type S") active columns of `B`
(`j = 0, …, k`); only `j = 1` sources have the `u_0` switch. Define, for `0 ≤ j0 ≤ k`,
`X'_{j0} := \{B ∈ X_sec : j(B) ≥ j0\}`. Then

```
supply(X'_{j0})     = 1_v · Σ_{j=j0}^{k}   C(d,j)·C(d−j, k−j)
cap(N(X'_{j0}))     = 1_v · Σ_{j'=max(j0−1,0)}^{k−1} C(d,j')·C(d−j', k−1−j')
                        + [j0 ≤ 1] · 1_v · 1_c · (k−1)·C(d,k−1)
```

(a source with `j ≥ j0` reaches, by deleting one active column, a target with
`j' ∈ \{j−1, j\}`, so the MINIMUM reachable `j'` from `X'_{j0}` is `j0 − 1`; only the
`j0 ≤ 1` families still contain the switch-eligible `j=1` class).

For `CB(7,1), k=5`: at `j0 = 2`, `X'_2` has `210+210+105+21 = 546` sources (each weight
1), reaching only the `j' ≥ 1` targets at rank `k−1=4`, capacity `525` — a certified
deficiency of exactly `21`, matching the literal flow's deficit exactly. **Independent
confirmation by literal max-flow/min-cut** (not just the formula): the min-cut source side
returned by `network.max_flow_bipartite` on this instance has `546` sources of total
supply `546`, neighbourhood capacity `525` — i.e. the ACTUAL min-cut IS `X'_2`, verified
by classifying the 546 cut-side sources by `j(B)` and finding they are EXACTLY
`\{j ≥ 2\}` (`j=2:210, j=3:210, j=4:105, j=5:21`, matching `C(7,2)+C(7,3)+C(7,4)+C(7,5) =
546$ combinatorially, independent of the max-flow computation itself).

**Systematic check:** over 21 `(d,k)` pairs swept (`d = 2..9`), `max_{j0}
[supply(X'_{j0}) − cap(N(X'_{j0}))]` computed by the formula above equals the literal,
independently computed exact-integer max-flow deficiency of `X_sec` EXACTLY in every one
of the 9 genuinely deficient cases found (`d,k ∈ \{(2,1),(3,2),(5,3),(6,4),(7,4),(7,5),
(8,5),(9,6)\}` plus the trivial `1_v=0` cases), and correctly finds no deficient `j0`-cut
whenever the literal flow shows none (`run_j0_sweep.py`'s per-row output; the boolean
`match` field only disagrees on sign convention when the true deficiency is exactly 0,
never on magnitude when it is positive). **This is evidence, not a general proof**: the
claim "the extremal Hall-violating sub-family of `X_sec` always has the upward-closed
`\{j ≥ j0\}` form" is checked on 21 instances, not derived from a duality/compression
argument, and is graded `computer_assisted`/STATED accordingly (candidate key
`E993-R30-CB-D1-J-THRESHOLD-EXTREMAL-DEFICIENT-CUT`; see `## Claim registration`).

**Why this matters for the route's mandate:** it is a concrete demonstration that a
"whole-sector" (or any single fixed) aggregate capacity comparison — including B9's own
literal pairing, and including the STYLE of check Cycle 2's `computer_assisted` sector-Hall
result at `CB(8,86)/460` etc. is described as performing — can PASS while a genuine,
computable, proper sub-family remains Hall-deficient. This is exactly a "sharp statement
of where per-class allocation fails" (`control/C4-ALLOCATION.md`'s own phrase for this
route's alternative closing condition), handed here to F1's cut-search mandate as a
CONCRETE TECHNIQUE (sweep `j`-threshold — or more generally per-class-count-threshold —
sub-families and compare to the aggregate) rather than a specific candidate cut on F1's
own object (`CB(8,·)`/`G(8^82,7^2)`, where `CB(d,1)`'s single-choke mechanism does not
directly apply — see Part (b)).

Replay: `cd scratchpad/c4-U2-replay && python3 -B run_j0_sweep.py` — `RESULT_SHA256:
9d672d8e484366ac49279cbc0cd444a145a3b771d9333ea1b7277421d14d657f`, reproduced
byte-identically.

## Part (b): the lift toward `CB(8,·)` — structural argument and small-scale evidence only

`CB(d,1)` has exactly ONE choke, so exactly one potential switch pivot exists per source.
`CB(d,m)` (`m ≥ 2`, T1's actual object) has `m` chokes `u_0,…,u_{m-1}`, each INDEPENDENTLY
adjacent only to `r` and its own `d` supports, so EACH choke `u_i` is a candidate pivot
whenever `|N(u_i) ∩ B| = 1 + j_i(B) = 2`, i.e. `j_i(B) = 1` — a PER-CHOKE condition,
independent of the other `m−1` chokes' states. This means a source in `CB(d,m)`'s sector
can have UP TO `m` simultaneously-available switch pivots (one per choke with exactly one
active support-column), a strictly richer rescue mechanism than `CB(d,1)`'s single pivot.

`run_multichoke.py` and `run_cb42_probe.py` test this directly by LITERAL brute-force
(full independent-set enumeration + exact max-flow, same machinery, no shortcuts) on
`CB(2,2)`, `CB(3,2)`, `CB(2,3)` (every eligible-adjacent `p` from just above `x+2` down
through where deletion-only already saturates) and `CB(4,2)` (`p = 4..8`, i.e. the full
`k=1..4` range that produced `CB(4,1)`'s OWN deficiency at `k=3`): **no deficiency is
found at any of the 15 tested `(d,m,p)` triples with `m ≥ 2`** — `hall_holds_mixed: True`
throughout, including at `CB(4,2), p=6` (`k=3`, the direct `m=2` analogue of `CB(4,1)`'s
deficient `k=3` row). This is consistent with — but does not prove — the expected
qualitative picture: doubling the number of chokes roughly doubles the number of
independent rescue pivots, and the `CB(d,1)` obstruction found above is closer to a
WORST-CASE (`m=1`) boundary phenomenon than a generic one, so it does not, by itself,
threaten the already-recorded `computer_assisted` sector-Hall results at `CB(8,86)/460`,
`CB(8,89)/476`, `CB(8,92)/492` (`m = 86, 89, 92` — far more chokes than tested here).

**What is NOT done:** an exact closed-form generalization of the `1_v, 1_c` / `j`-threshold
capacity formulas to `CB(d,m)`, `m ≥ 2` (the per-source state is now a length-`m` vector
`(j_0,…,j_{m-1})` plus a global column-count constraint, and literal brute force is
infeasible at `m` in the tens — `CB(4,2)` alone (`n=21`) already took ~20 seconds per
5-rank sweep). Completing this — and, further, specializing it to the actual record rows
`CB(8,86)/460` etc. — requires the SAME exact branch-type generating-function summation
technique T1's own obligation already commits to (`control/C4-ALLOCATION.md`, item 1(a):
"verify by exact branch-type generating-function summation"), which is why
`control/C4-ALLOCATION.md` describes this route's lift as "converging with T1 as the
certificate primal": this route's exact contribution to that convergence is the PRECISE
STRUCTURAL CLAIM to encode in that generating function — namely, that the relevant
per-source state for switch eligibility is the VECTOR of per-choke support-counts
`(j_0,…,j_{m-1})` (each independently either 0, 1, or ≥2, only `=1` mattering for
pivot-eligibility at that choke), NOT a single scalar `j` — together with the two
DERIVED-`F_p` indicators `1_v, 1_c` this route showed are independent and can split.

Replay: `cd scratchpad/c4-U2-replay && python3 -B run_multichoke.py` — `RESULT_SHA256:
6fb8a58994281e50c1c9beb28c2ee92d21b07e38a921918712b525b9aa8649e8`; `python3 -B
run_cb42_probe.py` — `RESULT_SHA256:
20a7d6f50d6580490f2bc5d8ae0bd78ffd1b6dcfe0dd3cb5980712a3e420b2ba`. Both reproduced
byte-identically.

## Census discipline note

Every count above is a count of LABELLED independent sets of a concrete, fixed,
vertex-labelled graph (never an isomorphism-class count); `run_labs.py`/`run_b9.py`/
`run_sw_lemma.py`/`run_j0_sweep.py`/`run_multichoke.py`/`run_cb42_probe.py` all enumerate
via `itertools.combinations` over the graph's own labelled vertex set. No census value
above enters a proof; the `j`-threshold formula's role is a candidate EXACT deficiency
identity for a named finite family, checked against literal flow, not a census used as
evidence for (HALL) or the primary aggregate.

## Alias check (lexical and mathematical)

**Lexical:** `sources/authority/CLAIM-IDENTITY.json` (grepped for exact substrings) and
`control/CLAIM-IDENTITY.run-local.json` (loaded, its 448 `claims` entries' keys scanned)
contain no key matching `SWITCH`, `CB-`, `ROOT-ARM`, or `SECTOR` (case-insensitive) — no
lexical collision with either candidate name below.

**Mathematical:** neither candidate statement is a restatement of B7 (a general
verification lemma with no family attached), B8 (`CB(1,m)`'s zero-weight switch fact,
`d=1` only — this route's formulas both DEGENERATE correctly at `d` such that `k=d$: e.g.
`CB(1,1)` at `k=1=d`: `cap_union − cap_D = (k−1)·C(d,k−1)·1_c = 0·C(1,0)·1_c = 0`, matching
B8 exactly as the `d=1` special case, confirmed numerically in `run_b9.py`'s `CB(1,m)`
rows), or B9 (this route's own formula reduces to B9's literal pairing exactly when
`1_v=1_c=1`, so it is a NAMED GENERALIZATION of B9, not a distinct rediscovery — registered,
if at all, as a refinement citing B9, never as an unrelated new key). Neither is any of
the ten refuted mechanisms or the struck Cycle 3 U2 items (see `## Registered claims`
above). The two candidates ARE mathematically distinct from EACH OTHER: the first is an
aggregate two/three-term capacity identity; the second is a claim about which sub-family
of a sector is EXTREMAL for Hall's condition, a strictly finer statement not implied by
the first (the aggregate identity says nothing about proper subsets).

## Claim registration (candidates; STATED, pending an isolated second read — ruling on
`SOLUTION-CONTRACT.md` §3.9/§4: no key is registered by a route's own return)

1. **`E993-R30-CB-D1-ROOT-ARM-SECTOR-EXACT-SWITCH-CAPACITY`** — the three-formula identity
   (`supply`, `cap_D`, `cap_union` in terms of `d,k,1_v,1_c`) for `CB(d,1)`'s root-plus-arm
   sector at rank `p=k+1`. Grade: `proved_informal` (derived from first principles —
   forced choke absence, unique pivot identification — and verified against independent
   brute force on all 35 systematically swept instances, `d=2..9`, plus 5 extra spot
   checks; the derivation itself, not the sweep, is the proof; the sweep is corroboration).
   Generalizes B9 (STATED); confirms B8 (STATED) as its `d=1` degenerate case.
2. **`E993-R30-CB-D1-J-THRESHOLD-EXTREMAL-DEFICIENT-CUT`** — the claim that
   `max_{0≤j0≤k} [supply(X'_{j0}) − cap(N(X'_{j0}))]` equals the TRUE Hall deficiency of
   `CB(d,1)`'s root-plus-arm sector. Grade: `computer_assisted`/STATED (verified on 21
   instances, 9 of them genuinely deficient, zero mismatches; no general duality/
   compression proof given — see the explicit caveat above). Not a (CUT) in the
   SEMANTIC-CONTRACT §1.2 sense (the ambient trees here are all non-eligible laboratories,
   per the eligibility table above), so it does NOT touch (HALL)'s registered status; it
   is a technique and an explicit instance (`CB(7,1)/6`), handed to F1 as stated above.

Both keys' names were checked against the run-local registry's 448 entries and found
absent (no `SWITCH`/`CB-`/`SECTOR`/`ROOT-ARM` substring match, reported above); both read
as true statements of their own stated hypotheses (ruling 33: `CB(d,1)`, root-plus-arm
sector, `p=k+1`, `1≤k≤d`, `d` a positive integer — no universal-tree claim is smuggled in
the name).

## Grades (SOLUTION-CONTRACT §4)

- The three headline-lab reproductions (order-8 tree, `CB(4,1)/4`, `CBstar(2,2,2)/7`):
  `bounded_computation` (exact, exhaustive, deterministic — matches Cycle 3's recorded
  values exactly — but a finite instance check, not a theorem).
- B8 confirmation: `proved_informal` (matches the existing STATED grade; not strengthened
  or weakened here, only re-confirmed on more `(m,p)` pairs and with both tag-set choices).
- B9 confirmation at its stated scope (`1_v=1_c=1`): `proved_informal`.
- The `CB(d,1)` exact three-formula identity (candidate key 1): `proved_informal` (a
  complete first-principles derivation for ALL `d,k`, not just the tested range;
  corroborated, not merely observed, on 35+5 instances).
- The `j`-threshold extremal-deficiency claim (candidate key 2): `computer_assisted` /
  STATED (pattern verified on 21 instances; no general proof).
- The `CB(7,1)/5` split-hypothesis instance and the `CB(7,1)/6` deeper-deficiency
  instance: `bounded_computation` (exact, exhibited, reproducible) as RECORDS; the
  GENERAL claims they instantiate carry the grades immediately above.
- Part (b)'s multi-choke structural argument: `conjecture`-adjacent STATED observation,
  supported only by the 15 `m≥2` non-deficient instances above; explicitly NOT extended
  to `CB(8,86/89/92)` scale. Never strengthened beyond what the small-scale evidence
  supports.
- Never strengthened without strengthening evidence (checked): no claim above is stated
  at a grade its own evidence does not support; every `S`/deficiency assertion above
  names its two independently-computed instruments (network-brute-force vs. forest-DP
  aggregate for WID; formula vs. literal-max-flow for the capacity/deficiency claims).

## Model disclosure

Chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter);
runtime-reported model id: `claude-sonnet-5`.

## headline_resolved: no

(HALL) is neither `formally_verified` nor confirmed `REFUTED` by this route or any route
this cycle; per the common brief, `headline_resolved: no` this cycle regardless.

## Route verdict: `bounded_evidence`

A complete, first-principles-derived, brute-force-verified exact capacity identity for a
NAMED finite family (`CB(d,1)`'s root-plus-arm sector, part (a)); a STATED, 21-instance
-verified (not generally proven) sharper extremal-cut characterization revealing that
whole-sector aggregate checks are insufficient for Hall's condition, with an explicit
witnessed instance (`CB(7,1)/6`, deficiency 21) and an explicit hypothesis-split instance
(`CB(7,1)/5`, deficiency 280); a structural (not closed-form) argument, with 15
supporting small-scale instances, for why the single-choke obstruction found here likely
does NOT threaten T1's actual `CB(8,·)` rows. No (SW) outcome-B lemma is registered at
`proved_informal` on the FULL family part (b) targets (`CB(8,86/89/92)`); the honest
outcome is the "sharp statement of where per-class allocation [checking] fails [to be
sufficient at the aggregate level]" that `control/C4-ALLOCATION.md` names as this route's
alternative closing condition, handed to F1 as a technique plus two exact instances, not
as a candidate (CUT) on F1's own object.

## Remaining obligation (successor inheritance)

1. Generalize the `CB(d,1)` three-formula identity and the `j`-threshold extremal-cut
   technique from a scalar `j` to the per-choke vector `(j_0,…,j_{m-1})` for `CB(d,m)`,
   `m ≥ 2`, using exact branch-type generating-function summation (T1's own stated method,
   `control/C4-ALLOCATION.md` item 1(a)) rather than literal brute force (infeasible past
   `m` in the tens, confirmed here: `CB(4,2)`, `n=21`, already took ~20s per 5-rank
   sweep).
2. Specialize that generalization to the exact record rows `CB(8,86)/460`,
   `CB(8,89)/476`, `CB(8,92)/492` and check whether ANY `(j_0,…,j_{m-1})`-threshold
   sub-family is deficient there, even though the whole-sector aggregate is already
   `computer_assisted`-recorded as Hall-satisfying — this route's `CB(7,1)/6` instance is
   a live demonstration that the aggregate check alone does not rule this out.
3. Prove (or refute) the `j`-threshold-extremality claim in general for `CB(d,1)`
   (candidate key 2) — most plausibly via an LP-duality or compression/shifting argument
   exploiting the `S_d` column symmetry; 21 verified instances is evidence, not a proof.
4. If (1)–(2) find no deficiency at `CB(8,86/89/92)`, that is itself worth registering
   (strengthening the existing `computer_assisted` sector-Hall record to cover
   sub-families, not just the whole sector) — a natural target for a future U-seat or for
   F1 to fold into its cut search's negative-result ledger.
5. (LIFT) `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` was named but not needed here
   (all flows were literal); it is the natural way to convert obligation (1)'s
   orbit-quotient-style generating-function result back into an explicit original flow
   once quotient feasibility (or its failure) is established at `CB(8,·)` scale.

## Replay summary (copy-out-first; all commands run from `scratchpad/c4-U2-replay/` after
copying the six scripts and four library modules byte-identically from `scratchpad/c4-U2/`
— done and verified this session, all six digests reproduced exactly)

```
python3 -B run_labs.py        # 8382dbe8abbe97410296c2d229e5f82e6c117b5ca80d7c2baf1902dbadddc241
python3 -B run_b9.py          # 4056e0bf29972e9ba1d5f2b3a717dce95d770fa28fab89d74f1024a839be0e1d
python3 -B run_sw_lemma.py    # 9ded05e35823e0b81ac1ef18544d36c50fecddd40ec6ff4cae1030e57ccbbc04
python3 -B run_j0_sweep.py    # 9d672d8e484366ac49279cbc0cd444a145a3b771d9333ea1b7277421d14d657f
python3 -B run_multichoke.py  # 6fb8a58994281e50c1c9beb28c2ee92d21b07e38a921918712b525b9aa8649e8
python3 -B run_cb42_probe.py  # 20a7d6f50d6580490f2bc5d8ae0bd78ffd1b6dcfe0dd3cb5980712a3e420b2ba
```

All background/long-running work ran in the foreground of this session (longest single
run: `run_cb42_probe.py`, ~20 seconds); nothing was detached; nothing remains running.
