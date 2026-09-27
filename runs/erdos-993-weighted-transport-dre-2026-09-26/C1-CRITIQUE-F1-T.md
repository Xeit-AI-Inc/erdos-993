# Critique

Critic `C-F1-T` (orientation T, prove), Cycle 1 Stage 4 of r30. Assigned return: seat `F1`, route `C1-F-01
ADVERSARIAL-CUT-SEARCH` (orientation F), `cycles/cycle-1/stage3/returns/F1/RETURN.md`.

**Boot acknowledgment.** I am operating within VerityOS. Boot files read: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. Ordering disclosure: my first combined
shell read printed `verity.md` and then stopped on a zsh `=`-expansion error, so `startup-protocol.md` was not actually
displayed. I noticed this and read it in full before drafting this critique, but after the seal audit and the computations
below. No other VerityOS subsystem was loaded.

Model disclosure: the two-part line is given under `## Verdict`.

## Identity and seal audit

All seals were recomputed canonically: SHA-256 of `json.dumps(manifest minus seal_sha256, sort_keys=True, separators=(",",":"))`,
with no trailing newline. The `ensure_ascii` True and False variants agree. Script: `scratchpad/c1-crit-F1-T/seal_audit.py`.

| manifest | recomputed seal | matches own field |
|---|---|---|
| capsule `control/c1-critic-capsules/F1-PACKET-MANIFEST.json` | `971b070bcf29f9c1597f11ac354228bcc90edba51aebaf5cc668523d63b31803` | yes (= dispatch value) |
| Stage 4 dispatch `control/C1-STAGE4-DISPATCH-MANIFEST.json` | `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc` | yes |
| Stage 3 `control/C1-STAGE3-PACKET-MANIFEST.json` | `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac` | yes |
| Stage 2 `control/C1-STAGE2-PACKET-MANIFEST.json` | `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92` | yes (= protocol value) |

- **Capsule members:** all 14 match their SHA-256 and byte counts, including `RETURN.md`
  (`095952db…157a`). **Stage 4 dispatch members:** all 13 match. **Stage 3 members:** all 36 match.
  - For members outside my capsule I hashed the bytes only and did not read the content. This covers the other seats'
    returns, the Stage 3 dispatch files, `r30_tool.py` and the Stage 3 control JSONs. See the disclosures in `## Artifact inventory`.
- **Digests the return lists:** all four match the files in `scratchpad/c1-F1/`.
  - `census_13_13.json`: `7059b144…ce92`
  - `census_14_14.json`: `03ee099d…ee76`
  - `census_15_18.json`: `1c5ae3b0…eea`
  - `adversarial_results.json`: `c72af73e…758d`
- **Row-payload digest:** `af53171f8bdc45553d362d5959a1f3dd7fcbc3d837dd9ddbf8536eb9e4a760df` recomputes from `census_15_18.json`
  (canonical JSON of the file minus its digest field).
- **Adversarial internal digest:** `a4ce9a85…6221` recomputes from `adversarial_results.json`. The return does not cite it.
- **Evaluator digest:** the return cites `a012bb78…533d` for `sources/lower-region/inputs/ordinary_tree_checked.py`. That value
  matches `SOURCE-DIGESTS.json` (16,710 bytes) and the frozen file's bytes.
- **Registry keys touched:**
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN; tested, status unchanged).
  - (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (OPEN run-local; asserted per row, never proved by F1).
  - Context: the primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (untouched).
  - Fences: the refuted keys of SOLUTION-CONTRACT §3.2, in particular `E993-R23-LITERAL-DELETE-ONLY-HALL` (see the fence check).
  - F1 registers no claim. I register no key either. My advance (A3 below) is STATED at a review stage and needs an isolated
    second read. I recommend it as a scope note to the Tier-3 record `R30-CB-RECORD`, not as a new `E993-R30-…` key. I cannot
    do a lexical alias check because `CLAIM-IDENTITY.run-local.json` is not in my capsule. Mathematically, it generalises the
    C6-U5 sector shortfall (`|R_490|/491`) already quoted in SEMANTIC-CONTRACT §1.2.

## Independent re-derivation

**Own instrument.** Standard library only, exact integers. Every file is in `scratchpad/c1-crit-F1-T/`. The code is
`crit_instr.py`; no F1 code is imported.

- **Trees.** Free trees come from leaf-extension with de-duplication by a canonical form: the minimum over the tree's one or
  two centres of the rooted AHU string. This method differs from F1's centroid DP. Counts match A000055 exactly for orders
  1–18, and every generated tree passes `is_tree` (BFS connectivity and edge-count/multi-edge acyclicity, checked separately).
- **Polynomial for `α` and `x` only.** The leaf-pair recurrence `I(G) = (1+t)·I(G − {v,s}) + t·I(G − N[s])` on vertex bitmasks.
  `x` is found by scanning `k = 0..α` with the explicit `i_{α+1} = 0`.
- **Everything else comes from one explicit enumeration** of the independent `(p−1)`-, `p`- and `(p+1)`-sets of the ORIGINAL
  tree. Each layer count is asserted equal to the polynomial coefficient, which gives two count paths.
  - `F_p` uses `#{B ∈ I_{p+1}: v ∉ B} − #{A ∈ I_p: v ∉ A} < 0`, i.e. `Δ_p(T − v)` on the original carrier at rank `p`.
  - `S` is computed literally as `Σ_{v∈F} [Δ_{p−1}(T − {v,s_v}) − Δ_{p−1}(T − N[s_v])]`, from counts of sets that avoid the
    deletion masks. This is `C5LA1.aggregate`, not a weight sum.
  - `w_F` is literal: `v ∈ F ∩ B` with `(B ∖ {v}) ∩ W_v ≠ ∅`.
  - (D) is `B ∖ {q}`. (S) requires `u ∉ B` with `|N(u) ∩ B| = 2` exactly.
- **(WID)** `supply − capacity = S` is asserted on every row before anything else is recorded.
- **Flow.** An exact iterative Dinic is run on the deletion-only network first. The mixed network runs only if deletion-only
  fails. A flow on a sub-network with the same supplies and capacities is a flow on the mixed network, so deletion-only
  saturation implies mixed saturation.
- **Fixed points reproduced** (`fixed_points.json`), with both relations and arc counts:

| instance | n | p | α | x | \|F\| | supply | capacity | S | deletion-only | mixed | mixed arcs |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `K_{1,12}` | 13 | 8 | 12 | 6 | 12 | 1980 | 3960 | −1980 | saturates | saturates | 1980 |
| path-star (2,3,4) | 15 | 7 | 11 | 5 | 10 | 1483 | 2701 | −1218 | saturates (1744 arcs) | saturates | 2025 |
| path-star (2,2,4,3) | 18 | 8 | 13 | 6 | 12 | 8033 | 13467 | −5434 | saturates (9720 arcs) | saturates | 11691 |
| `CB(1,7)` | 24 | 10 | 15 | 8 | 8 | 29190 | 58002 | −28812 | saturates | saturates | 124593 |

**Fidelity of F1's instrument.** Read line by line in the copy-out `scratchpad/c1-crit-F1-T/replay/`.

- `active_weight` counts active tags only, not `|F ∩ B|`.
- `switch_targets` requires `u ∉ B` and `popcount(N(u) ∩ B) == 2`, then forms `A = (B ∖ N(u)) ∪ {u}`.
- `F` is computed once from `T − v` on the original vertex set at rank `p`.
- `x` is computed through `α` with explicit zero-extension.
- `S_direct` comes from `H_v`/`R_v` polynomials, independent of the weights, and `assert r["wid_holds"]` runs per row in
  `census.py`.
- The arc capacity `total_supply + 1` is never binding. The saturation test is `maxflow == total_supply`. The min-cut
  extraction (residual reach) is correct but was never triggered.
- **No fidelity failure.** Nothing is struck on fidelity grounds.

**Replays of F1's code.** Run copy-out-first under `python3 -B`, so no `__pycache__` was written.
- `validate_fixed_points.py` reproduces all three rows. The script does not assert arc counts, but `analyze()` yields
  1980/2025/11691.
- `census.py 13 15` gives 12,201 trees, 1 open row saturating and 1,003 closed-band rows skipped.
- `gen_trees.py 18` matches A000055.
- `analyze(CB(1,7), p = 10)` reproduces the return's line exactly (8673 sources, 22197 targets, 124593 arcs) and saturates.

**Row-level reconciliation.** F1's 3,296 open rows (`census_15_18.json`) equal my open rows at orders 15, 17 and 18 as a
multiset over `(n, p, α, x, |F|, supply, capacity, S)`: exact agreement. F1's rows carry no graph, so this reconciliation can
only be multiset-level.

**The complete census, all eligible rows and not only the open band.** This is a critic-derived completion, grade
`bounded_computation`. Files: `census_crit_1_16.json`, `census_crit_17_18.json`, `census_crit_19_19.json`.

| n | free trees | eligible rows | open (`n > 2p+2`) | closed band | deletion-only saturating | mixed saturating | (WID) asserted |
|---|---|---|---|---|---|---|---|
| ≤ 10 | 201 total | 0 | 0 | 0 | — | — | — |
| 11 | 235 | 5 | 0 | 5 | 5 | 5 | 5 |
| 12 | 551 | 34 | 0 | 34 | 34 | 34 | 34 |
| 13 | 1301 | 163 | 0 | 163 | 163 | 163 | 163 |
| 14 | 3159 | 313 | 0 | 313 | 313 | 313 | 313 |
| 15 | 7741 | 528 | 1 | 527 | 528 | 528 | 528 |
| 16 | 19320 | 2763 | 0 | 2763 | 2763 | 2763 | 2763 |
| 17 | 48629 | 10061 | 2955 | 7106 | 10061 | 10061 | 10061 |
| 18 | 123867 | 37295 | 340 | 36955 | 37295 | 37295 | 37295 |
| 19 | 317955 | 144521 | 127099 | 17422 | 144521 | 144521 | 144521 |

- **Total:** 195,683 eligible `(T, p)` rows, orders 11–19. Every row has a saturating flow using DELETION arcs alone, `S < 0`
  and `F ≠ ∅`.
- **Largest `S`:** −192 through order 18, −2040 at order 19.
- **Largest `supply/capacity`:** 2/3 through order 18 (e.g. 28028/42042 at n = 17, p = 9) and 0.7 at order 19.
- **Order 19** is not reconciled against an external sequence, because A000055 is quoted only to 18. Its tree count equals the
  free-tree number 317,955 that F1's return itself names.
- **Cumulative eligible rows** to orders 14/15/16 are 515/1043/3806, which confirms the controller's prior counts and the
  erratum R30-E-a counts 5, 34, 163, 313, 528, 2763.

**`CB(d, m)` by exact orbit quotient.** This is critic-derived; the tool is `cb_quotient.py`, my own builder.
- **Group.** `Aut ⊇ S_d ≀ S_m`, permuting branches and pairs inside a branch. It fixes `r, s, v` and preserves adjacency,
  hence (D), (S), leaves, supports, `W_v`, `F_p` and `w_F`.
- **State.** `(r, s, v ∈ B)` plus the multiset of branch types `(u ∈ B, #b, #c)`.
- **Orbit sizes.** A multinomial over branch types times `d!/(#b! #c! (d−#b−#c)!)` per branch. Orbit sizes are asserted to sum
  to `i_p` and `i_{p+1}`, and quotient totals assert (WID).
- **Orbit arcs** are taken from one representative per source orbit, which is valid by invariance.
- **Lift.** Quotient saturation lifts by (LIFT) `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (`proved_informal`, used at that
  grade). The converse is elementary: an original saturating flow sums over orbits to a saturating quotient flow.
- **Validation against my brute force** (`cb_brute_validate.json`). Agreement on `n, α, x, |F|`, supply, capacity, `S` and
  saturation of both relations for `CB(1,8)` p = 11, `CB(2,5)` p = 10, `CB(1,9)` p = 12 and `CB(3,4)` p = 11. The largest
  brute instance had 373,091 sources and 4,770,240 mixed arcs.

Quotient results for every eligible `p` (`cbq_d1.json`, `cbq_d1b.json`, `cbq_d2.json`, `cbq_d3.json`, `cbq_d4.json`):

| family | m range | rows | largest n | largest source-orbit count | deletion-only saturating |
|---|---|---|---|---|---|
| `CB(1,m)` | 7–30 | 108 | 93 | 6,195 | 108/108 |
| `CB(2,m)` | 5–14 | 27 | 73 | 74,578 | 27/27 |
| `CB(3,m)` | 4–10 | 17 | 73 | 281,226 | 17/17 |
| `CB(4,m)` | 4–8 | 10 | 75 | 536,771 | 10/10 |

Across all 162 `(d, m, p)` rows, deletion alone saturates. `CB(1,7)` (n = 24) is the smallest eligible `CB(d,m)` over ALL
`(d, m)` with `n ≤ 28`; the others there are `CB(1,8)` at 27 and `CB(2,5)` at 28. That confirms F1's claim, which F1 had
scanned only over `d ≤ 5, m ≤ 7`.

## Attacks and findings

**A1 — The closed-band skip narrows F1's horizon.**
- **What F1 did.** `census.py` skips every eligible row with `n ≤ 2p + 2`, citing the order-band theorems. Those theorems close
  the aggregate sign on that band. They say nothing about a saturating FLOW there.
- **What F1 actually covers.** Its mixed-relation evidence covers exactly 3,296 rows: 1 at order 15, 2,955 at order 17 and 340
  at order 18.
- **What F1 left untested:**
  - 47,351 closed-band rows at orders 13–18 (163 + 313 + 527 + 2,763 + 7,106 + 36,955);
  - all 39 rows at orders 11–12.
- **Verdict on the literal.** "Exhaustive to order 18" is struck. The exact F1 horizon is "all 3,296 open-band rows at orders
  15–18".
- **Closed by the critic.** The table above tests all 51,162 rows to order 18 and all 144,521 rows at order 19, with deletion
  arcs alone.

**A2 — Orders 11 and 12 were never examined.** F1 began at order 13, following the contract's erroneous minimum (controller
erratum R30-E-a). Its own `adversarial_results.json` records eligible order-11 double brooms, `(3,6)` and `(4,5)` at p = 6, both
saturating. Five eligible trees of order 11 and 34 of order 12 exist; the critic tested all of them.

**A3 — Critic-derived advance: deletion-only suffices everywhere tested, and the smallest `CB` where it cannot.**
The allocation (item 3(a)) asked for deletion-only and mixed flows separately. F1 ran only the mixed relation.

- **Switches are never needed on any row tested.** On every one of the 195,683 eligible rows to order 19 and on all 162 `CB`
  quotient rows, the deletion arcs alone saturate. No tested instance, whether exhaustive or adversarial, exercises a (S) arc.
- **Consequence for F1's evidence.** F1's "zero deficient cuts" (and mine) is evidence about active-weight deletion-only
  transport at small order. It is not a test of the two-for-one mechanism.

**Where deletion-only must fail** (STATED here; elementary, second read needed). Take `CB(d, m)` at an eligible `p` with the arm
tag `v ∈ F_p` and `p − 1 ≤ dm`. Let `X_sec = {B ∈ I_{p+1} : r, v ∈ B}`.

1. Every member of `X_sec` has weight exactly 1. The tag `v` is active through `W_v = {r}`. Every private tag is inactive,
   because no choke can accompany `r`.
2. Its positive-weight deletion targets are exactly the pair-element deletions, each of weight 1. Deleting `r` or `v` gives
   weight 0.
3. Therefore `Σ_{X_sec} w = 2^{p−1}·C(dm, p−1)` and `Σ_{N_D(X_sec)} w = 2^{p−2}·C(dm, p−2)`.
4. `X_sec` is a deletion-only deficient cut **iff `3p < 2dm + 5`**.
5. At `CB(8,92)`, `p = 492`, this reproduces the recorded `492/491` and the shortfall `|R_490|/491`.

**Checks.**
- The three sector sums (supply, deletion capacity and switch capacity, below) agree with brute force on `CB(3,4)` p = 11,
  `CB(2,6)` p = 12 and `CB(2,7)` p = 13. In all three, every sector weight is 1 and the (D)/(S) images are disjoint
  (`cb_sector_brute.json`).
- A closed form `I = t(1+t)(1+2t)^{dm} + (1+2t)(t(1+t)^d + (1+2t)^d)^m`, with its `T − v` and `T − c` variants, is
  cross-checked against the tree DP on small members.

**Smallest instance.** An exhaustive scan of ALL `(d, m)` with `n ≤ 1465` (`cb_sector_scan2.json`) finds exactly one
eligible `(d, m, p)` meeting the criterion: **`CB(8,86)`, `p = 460`, `n = 1465`, `α = 775`, `x = 458`**, with `v` and every private leaf
favorable. The next instances (`cb_sector_hits.json`, `d ≤ 12, m < 200`) are `CB(8,89)` p = 476, `CB(8,92)` p = 492 and
`CB(7,109)` p = 510.

**Why the sector is still not a mixed cut** (`cb_sector_check.json`). The sector's two-for-one exits insert a choke `u_i` when
branch `i` holds exactly one support. Each exit has weight equal to the number of branch-`i` private leaves present; `v` becomes
inactive. These exits carry about 6,129 times the deletion deficit at `CB(8,86)`, p = 460, and about 7,012 times at
`CB(8,92)`, p = 492. So `X_sec` itself is not a (HALL) cut, which is consistent with the Stage 1 prior.

**Consequence.** In the `CB` family, the regime where switches are necessary begins at `n = 1465`. The only instances that can
test the (S) arcs are therefore far beyond brute force and beyond my quotient, which has 54 branch types over 86 branches there.
No small-order search in this family can find a (HALL) cut.

**A4 — Reconciliation literal unbacked by F1's shipped evidence.**
- **F1's claim.** Its "cumulative total eligible row counts through orders 14, 15, 16 are 515, 1043, 3806 … matching …
  digit for digit … from a fully independent tree generator".
- **What the shipped files give.** `census_13_13.json`, `census_14_14.json` and `census_15_18.json` start at order 13 and give
  476/1004/3767. The missing 39 rows are orders 11–12, which F1 never ran (A2).
- **Status.** The numbers are true; I reproduced them. F1's claim to have derived them itself is not supported by any shipped
  artifact. Struck as F1's evidence and re-backed by the critic.

**A5 — The `CB(1,7)` line is not in F1's evidence file.** The return reports `CB(1,7)` at p = 10 (supply 29190, capacity 58002,
S = −28812, 8673/22197/124593, saturating). The shipped `adversarial_results.json` records that test as **skipped ("too many
sources")**, and all 24 `CB` flow tests in the file are skips (0 saturating). The line is reproducible (replay of F1's `analyze()`;
my brute force; my quotient), so it stands on critic evidence. F1's citation of `adversarial_results.json` for it is struck.
(The controller's F1/U1 cross-check fact in the attack brief is consistent with this.)

**A6 — The shipped `adversarial.py` did not produce the shipped `adversarial_results.json`.**
- **Timestamps.** The script is dated 12:53 and the JSON 12:43.
- **Double-broom grid.** The script's grid is `a ≤ b ≤ 11` (66 configurations). The JSON has 120 configurations up to 15.
- **Skip text.** The script's skip text is `"timeout>…s"`; the JSON's is `"too many sources"`.
- **Consequences:**
  - The adversarial evidence cannot be replayed from shipped code; its numbers are self-report checked only for internal
    consistency.
  - "confirmed directly: `CB(2,7)`, n=38, did not finish an 8s-budgeted single flow test" is contradicted by the JSON, which
    shows a size-estimate skip, not a timeout.
  - The return's text that the families used a `SIGALRM` budget describes the killed run (PID 63502), not the run it cites.
- **What the critic found instead.** `CB(2,7)` at p = 13 and p = 14 is decided by the quotient in under 0.4 s; both saturate
  with deletion arcs alone.

**A7 — Other literals.**
- **"Smallest eligible double broom (a=1, b=11), n=14" is false.** It is the first eligible configuration in scan order;
  `(3,6)` and `(4,5)` at n = 11 are eligible and saturating in the same file.
- **Caterpillars: "10 configurations completed a full flow test".** Actually 10 tests on 8 configurations.
- **"(WID) held on every one of the tens of thousands of instances".** The shipped evidence has 3,296 census rows, 106 completed
  adversarial tests and 3 fixed points. Overstated; struck.
- **Adversarial rank coverage.** Only the smallest and largest eligible `p` were tested per configuration, so "zero deficient
  cuts in any adversarial family" is narrowed to the tested `(configuration, p)` pairs.
- **Alias check.** "no collision with a key in the run-local registry" is unbacked, because F1 did not read
  `CLAIM-IDENTITY.run-local.json`. It is harmless, since F1 registers nothing.
- **Rows carry no graph.** F1's census rows lack the edge list, against SEMANTIC-CONTRACT §3. Minor; the rows are reproducible
  by multiset.

**A8 — Quantifiers, direction and circularity.**
- F1's flow test decides (HALL-COND) for EVERY `X` at each tested row. Max-flow equal to total supply is equivalent to
  weighted Hall on all subfamilies, so there is no whole-layer shortcut.
- The inequality direction is correct.
- There is no natural-number subtraction hazard: `p ≥ x + 2 ≥ 2`, and `p − 1` is used only then.
- There is no circularity: `S` is never assumed.

**A9 — Disclosures.**
- F1's three full process listings are a disclosed rule breach. I cannot audit them from evidence. No reported number traces to
  a killed job: every cited number either sits in a shipped file or is the reproducible `CB(1,7)` line (A5).
- The unread brief files do not affect any F1 number. Its definitions, fences and fixed points come from SEMANTIC-CONTRACT and
  SOLUTION-CONTRACT, which it did read; only the alias literal (A7) depends on an unread file.

## Mechanism-equivalence and fence check

- **No revival.** F1 proposes no mechanism and tests (HALL) at its literal statement. None of the ten refuted keys and not the
  C6-F4 unit-capacity rule is revived.
- **Fence §3.6 misapplied (A1).** The fence closes the aggregate on `n ≤ 2p + 2`. It does not close (HALL) there, so it cannot
  justify skipping flow tests.
- **Fence watch for successors (from A3).** "Deletion-only with the ACTIVE weight" is distinct from the refuted
  `E993-R23-LITERAL-DELETE-ONLY-HALL`, which has a different weight and no active-tag rule. It saturates on every tree to
  order 19. It nevertheless FAILS at `CB(8,86)`, p = 460 (exact sector cut; `bounded_computation`, with the counting argument
  STATED on this face). Any route that reads the census as support for dropping (S) is answered by that instance. The switch
  arcs are necessary for the mechanism's truth, not decorative.
- **Other fences.** No census value enters a proof. Mechanism is kept separate from the aggregate: no cut was found, and none
  is claimed as an aggregate counterexample. No RTree wording is used. The controller's prior is used only for reconciliation.
- **(LIFT) in my own work.** My quotient results use (LIFT) only in the direction it proves (quotient ⇒ original), at
  `proved_informal`. Their composed grade is `bounded_computation` resting on `proved_informal`. None of my quotient rows is
  deficient, so the converse is never needed for a cut.

## Certification audit

| literal in the return | status |
|---|---|
| three fixed points reproduced "exactly, including edge/arc counts" | backed (replay; the script does not assert arcs, but `analyze()` yields them) |
| free-tree counts match A000055 for 1..18 | backed (replay) |
| "exhaustive to order 18" | **struck**: narrowed to the 3,296 open-band rows at orders 15–18 (A1). The critic tested all 51,162 rows to order 18 |
| "All 3296 open rows across orders 15–18 saturate; zero deficient cuts" | backed (replay and independent reconciliation) |
| (WID) "never once failed" on the census rows | backed for the 3,296 rows |
| (WID) "on … tens of thousands of instances" | **struck** (A7) |
| row-payload digest `af53171f…`; the four file digests | backed |
| cumulative 515/1043/3806 "digit for digit" from its own instrument | **struck as F1 evidence**: shipped files give 476/1004/3767. The values are **re-backed by the critic** (A4) |
| `CB(1,7)` line and "saturating" | **struck as cited** (the evidence file records a skip). **Re-backed by the critic** (replay, brute force, quotient) (A5) |
| "`CB(2,7)` did not finish an 8s-budgeted single flow test" | **struck** (the JSON shows a size skip; the critic decided it) (A6) |
| smallest eligible double broom `(1,11)`, n = 14 | **struck**: the smallest is n = 11, `(3,6)`/`(4,5)` (A7) |
| caterpillars "10 configurations" | **corrected**: 10 tests on 8 configurations |
| "87 saturating, 0 deficient" of 153 double-broom tests; "9 saturating" of 12 many-tags tests | backed by the shipped JSON (not replayable from shipped code, A6) |
| alias check "no collision with the run-local registry" | **unbacked** (file not read); harmless |
| grades `bounded_computation`, headline flag unresolved, no proof claimed | backed |

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**What F1 got right.** Its instrument is faithful: active weight, literal (D) ∪ (S), `F` fixed at rank `p`, `x` through `α`, and
(WID) asserted with `S` computed independently. Its core census result is correct and independently reproduced row by row.

**What is narrowed.** The horizon becomes 3,296 open-band rows at orders 15–18, not "exhaustive to order 18". The adversarial
section is self-report that cannot be replayed from shipped code. Five literals are struck (A4–A7).

**Critic-derived results.** These are attributed to `C-F1-T` and graded `bounded_computation` unless stated otherwise.
1. Every eligible row, in and out of the order band, saturates at orders 11–19 (195,683 rows), with deletion arcs alone.
2. Exact orbit-quotient saturation holds for 162 `CB(d,m)` rows (`d ≤ 4`, up to `n = 93`), again with deletion arcs alone.
3. A deletion-only sector criterion `3p < 2dm + 5` for `CB(d, m)`. The counting argument is STATED on this face; my grade
   proposal is `proved_informal` after a second read.
4. `CB(8,86)`, p = 460, n = 1465 is the unique `CB` instance with `n ≤ 1465` where the sector is a deletion-only deficient cut,
   with sector switch capacity about 6,129 times the deficit.

No deficient cut of (HALL) is known.

## Remaining obligation

- **(HALL) status.** (HALL) stays OPEN at its registered statement. No candidate (CUT) exists anywhere searched.
- **Where no cut exists.** Not in any eligible tree of order ≤ 19 (every row saturates with deletion arcs alone). Not in any of
  the 162 quotient-tested `CB(d,m)` rows (`d = 1, m ≤ 30`; `d = 2, m ≤ 14`; `d = 3, m ≤ 10`; `d = 4, m ≤ 8`).
- **Why none of this tests the two-for-one mechanism.** No tested instance needs a switch. In the `CB` family the first
  instance that does is `CB(8,86)`, p = 460 (n = 1465).
- **Obligations for a successor:**
  1. Decide mixed (HALL-COND) for arbitrary `X ⊆ I_{p+1}` at `CB(8,86)`, p = 460 (and `CB(8,92)`, p = 492). This needs a
     coarser invariant quotient or T1's shadow theory; my branch-type quotient is too large there.
  2. Find the smallest tree of any shape where active-weight deletion-only Hall fails. It is larger than order 19, and at most
     1465 via `CB(8,86)`. Structured families with a small deletion-only failure are the only places a search can actually
     exercise the switch arcs.
  3. Give the sector criterion of A3 an isolated second read before any registration.
- **Adversarial families.** F1's caterpillar, double-broom and many-tags scans are partial and not replayable. The configurations
  it skipped are listed in its JSON: 24 `CB`, 25 caterpillar, 66 double-broom and 3 many-tags tests.

## Artifact inventory

Scratch root is `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-crit-F1-T/`.
All files are critic-authored except `replay/`, which holds byte copies of F1's `.py`/`.json` files, plus the output of my
replay, `replay/census_13_15.json`. SHA-256 by file:

| file | SHA-256 |
|---|---|
| `seal_audit.py` | `575ece259c53e44501ac12a1f1a0dc4cf6e05f64b1fbfc821df9fae90c29619b` |
| `crit_instr.py` | `ad2d2317797243714471aa56468e82b45c2de2a0882b8c605c082617ad059c93` |
| `fixed_points.py` | `bac123c9285fdae416f756589b4f1f4b34abee26d13d2e654b712fae55624184` |
| `fixed_points.json` | `04b21c4b1e00fa9d26cad8c7c7ca59e64508a48aa75e50239832944981ce32ea` |
| `census_crit.py` | `337faa07d9842530cedf55ed754e19762f1bb4ab27d04ffe04ca899728bdeb19` |
| `census_crit_1_16.json` | `e8917d202c2258c05cd35b49959e5e9a13210229b9b301fc0aac95b5dfb2ed7b` |
| `census_crit_17_18.json` | `6f8e0e70a3d6ae73be5b3e1c2736f3145c9ddb65e2386f2039cd74a00082451b` |
| `census_crit_19_19.json` | `1bc6943299fc6bdabefe7e274be01bbc24f6ee426d8f7578a64c1ce7ee75d73c` |
| `census19.log` | the run log (order 19, 830.4 s) |
| `cb_quotient.py` | `1ca4604ee71f2f1c5460c748c4abeeef1243cd988437b78b169532ffef0944a2` |
| `cbq_sweep.py` | `0b45724e53c739095d09543816ca069f6158fee7942baa7e0a25d772a4ce30f9` |
| `cbq_validate.json` | `b3ca0bdc43606f5f45d0e69b5c75ab68dbcddfa87a4398baf0a9c8c062e26b57` |
| `cb_brute_validate.py` | `8f1047562180278865af6df492c235038654c339ac6fa6172534fd155cd98bfe` |
| `cb_brute_validate.json` | `d07365e1d8f58c06a998107036056ab34c8bcc9718c3aeb08be53c3a2bedd9ec` |
| `cbq_d1.json` | `1eee4ed38aaf53488b77e4834d434ae14fb1cd5a9890ebeb566b269e568306d5` |
| `cbq_d1b.json` | `9ea18ab667d24852d054bf11be585dc503c9d172a7fa423ebba54444c5c17a4f` |
| `cbq_d2.json` | `10bd61e6b7c7e276b758778f9c094c643014dc8dff3fe6cd4c20635a15241139` |
| `cbq_d3.json` | `8a71b312a894021d88c3c584b120a99b849d605b6152264bce285c5bbd2c5604` |
| `cbq_d4.json` | `53cfb1b0f435a2b61832a36d3363393c1aede431ad9e58b9db995f5bab8dab1c` |
| `cb_sector_scan.py` | `f13c31715d48f094464ac774f71af671e5138a82e1ffa7eda5244eaa5b1a3de8` |
| `cb_sector_hits.json` | `4fe3e6a80c467c6f5f9ac52ae30b68307d2b6db9eb612bc91501b9ff5e06d338` |
| `cb_sector_scan2.py` | `54fe752a52388208432b4ac514753a13e5ee91b3ef549a28c8818a1b85dbfda9` |
| `cb_sector_scan2.json` | `6adb1b85c29af23ba54b7a525d1298d7c6c8483f149e0a1bf75dd81ca5f05de0` |
| `cb_sector_check.py` | `d3e3bf6d8133c5323e866f7eae2992faa704c92fc65628bc779dabdd6ef6bae5` |
| `cb_sector_check.json` | `2684cf927189d7692f9ec8652e08218194fba3f519e72e2438e7c69e4ff83f5e` |
| `cb_sector_brute.py` | `b3a5ccce511eea9a929a3b7526f818b947690afc91d7980012cd83b1755bfdd4` |
| `cb_sector_brute.json` | `49c942556197799aa41ae6d1aab25f4863a4de873c25a9544be189e6a277a856` |

**Critic disclosures:**
- **Boot ordering.** See the boot acknowledgment: the startup protocol was read in full, but after the computations.
- **Hash-only reads.** For the Stage 3 and Stage 4 seal duties I hashed the bytes of manifest members outside my capsule: the
  other seats' returns, the Stage 3 dispatch files, `control/r30_tool.py` and the Stage 3 control JSONs. I did not read their
  content.
- **Frozen-source hash.** I hashed `sources/lower-region/inputs/ordinary_tree_checked.py`, which is authorized, but did not read
  its code.
- **Worker brief not read.** I did not read `control/C1-WORKER-COMMON-BRIEF.md`, a Stage 2 member that the common brief
  incorporates by reference. I followed the dispatch's restatement of its rules.
- **Searches and listings.** One non-recursive `ls -la` of `scratchpad/c1-F1/` (the granted directory itself) and one `grep`
  inside `control/SOURCE-DIGESTS.json`, a capsule member. No search ran above my grant. No network access, no package installs,
  no Lean.
- **Background job.** One detached job was used: the order-19 census, PID 72374. It exited on its own after 830 s with its
  output written. Verified not running (`ps -p 72374`) before this write; no kill was needed and no process listing was used.
