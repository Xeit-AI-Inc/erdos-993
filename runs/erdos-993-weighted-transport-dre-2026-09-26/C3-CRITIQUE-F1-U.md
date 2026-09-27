# Critique

Critic `C-F1-U` (orientation U, formal/structural). Cycle 3 Stage 4 of r30. Assigned return: seat `F1`, route
`C3-F-01 INVARIANT-CLASS-UNION-CUT-SEARCH-ON-SWITCH-NECESSARY-ROWS` (orientation F). Object: (HALL)
`E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The first read's terminal output was truncated in the
middle, so I re-read the missing lines of the same file (`sed -n 95,140p verity.md`). I read no other VerityOS file
outside this run root. Subsystems loaded: the constitution and the startup protocol only.

**Read-boundary disclosures (critic).**
1. I ran a non-recursive `ls` of `scratchpad/c3-F1-replay/` and computed SHA-256 digests of its four files. My
   attack brief asks for a check of replay parity between `c3-F1/` and `c3-F1-replay/`, but the dispatch names only
   `c3-F1/`. I read no file contents there beyond the digests.
2. One harness auto-backgrounding incident: my first mixture scan went past the 600 s foreground window, and the
   harness moved it to the background. I stopped it with TaskStop (task `bf4xyad9o`) before it produced any output. I
   used none of its output, fixed the scan's inefficiency (it recomputed `(1+2x)^M` every time), and reran the scan in
   the foreground. No background job is running now.
3. The capsule member `control/C3-STAGE3-PACKET-MANIFEST.json` lists the other returns' paths and digests. I read the
   manifest in full but opened no other return.
4. Replaying F1's `run_rows.py` executes the frozen `sources/.../cb-switch-cut/run.py:calculate` through `importlib`, as
   the return describes. Separately, I imported the frozen `sources/lower-region/inputs/ordinary_tree_checked.py` as a
   second instrument. Both ran under `python3 -B`. A non-recursive `find sources -maxdepth 4 -name __pycache__`, which
   is inside my grant, returned nothing, so nothing was written under `sources/`.
5. Before replaying, I changed one line in my copy of `run_rows.py`: its hard-coded absolute output path pointed into
   F1's scratch directory, and I redirected it to my own scratch. Replaying the copy unchanged would have written into
   `scratchpad/c3-F1/`.

## Identity and seal audit

- **Dispatch file.** `control/dispatch/c3-stage4/DISPATCH-C-F1-U.md` has SHA-256
  `1082b87cf1b2c8c3549e4eaaf4b67665b1779984083a0a9534f21726c646b80e`, which matches the wrapper.
- **Capsule seal.** `control/c3-critic-capsules/F1-PACKET-MANIFEST.json` has a recomputed canonical seal (sort_keys,
  `(",",":")`, no trailing newline, `seal_sha256` removed) of
  **`40af56b29e42002f828d7b40cab770d47e17d65d49dd3abcf215693c2c72b15f`**, which matches. All 14 members match by byte
  count and SHA-256.
- **Stage seals, all recomputed and matching:**
  - Stage 2: `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`.
  - Stage 3 packet: `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797`.
  - Stage 4 dispatch: `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7`.
- **Return.** `cycles/cycle-3/stage3/returns/F1/RETURN.md` has digest
  `3f4bc4c2adf3bb9358050d3e3a59c453d27e0e89f651aeb13958fb9f36c2c39a`, matching both the capsule and the Stage 3
  manifest.
- **Digests listed in the return:**
  - Frozen `ordinary_tree_checked.py` (`a012bb78…`), `cb-switch-cut/run.py` (`94ced046…`), `RESULTS.json` (`873cf922…`)
    and `PROTOCOL.md` (`5b09a7f3…`) all match the file bytes.
  - `scratchpad/c3-F1/rows_output.json` is `ba0e5848…`, which matches. Its internal `PAYLOAD_SHA256` `6a1ae339…`
    recomputes from the file's own payload, which matches.
  - `run_classes.py` is `354b4a1a…` and `class_output.json` is `eb94a8d4…`; both match.
- **Replay parity.** The four scripts in `c3-F1/` and `c3-F1-replay/` are byte-identical (`lib_transport.py 59d1b114…`,
  `run_validate.py 64beae95…`, `run_rows.py 1e04c6f5…`, `run_classes.py 354b4a1a…`).
  - `run_classes.py`: the replay output is **byte-identical** (`eb94a8d4…`).
  - `run_rows.py`: the replay payload digest is `c0d940b0…`, not `6a1ae339…`. The payload embeds wall-clock
    `timing_seconds`, so this digest can never be reproduced. With the timings removed, the replay payload equals the
    recorded payload exactly. The `PAYLOAD_SHA256` literal is therefore genuine but cannot be replayed by construction.
- **Seat disclosures on record.** The Stage 3 read-boundary record logs one background job for F1, PID 72145, killed by
  literal PID, plus two instrument bugs that F1 caught itself. The kill is self-reported and cannot be re-observed.
- **Model disclosure.** The return says "chartered sonnet/xhigh", which matches the allocation (routes run Claude Sonnet 5
  xhigh). Its runtime id `claude-sonnet-5` agrees with the Stage 1 gate's alias record.

## Independent re-derivation

**My instrument** is `scratchpad/c3-crit-F1-U/own/inst.py`. It shares no code with F1's `lib_transport.py` and is built
only from `SEMANTIC-CONTRACT.md` §1:

- a generic tree check, with connectivity, acyclicity and `|E| = n−1` tested separately;
- a generic forest independence-polynomial DP that takes the product over components, cached by an AHU canonical form
  so isomorphic deleted forests are evaluated once;
- `x` scanned through rank `α`, including `Δ_α`;
- `F_p` derived **leaf by leaf**, computing `Δ_p(T − v)` on each of the 689, 713 or 737 leaves (not two orbit
  representatives);
- the layer weight `Σ_B x^{|B|} w_F(B)` from a **direct active-tag DP**. The DP tracks each support's count of
  neighbours in `B` (0, 1 or at least 2) and a pending-tag moment that becomes active only when the parent enters `B`.
  It never touches `H_v` or `R_v`, so it is independent of the WID side;
- `S` from the aggregate definition, `Σ_{v∈F}[Δ_{p−1}(T−H_v) − Δ_{p−1}(T−R_v)]`, on literal deleted forests;
- a literal brute force for small trees.

**Validation.** `validate.py` covered 400 random labelled trees of order 3 to 18, with `F` equal to all leaves or a random
subset of leaves. On every tree, P and W from the DP equal brute force, and `W[p+1] − W[p]` equals the aggregate at every
`p ≥ 1`. Failures: 0. The instrument then reproduced every common-brief fixed point I could build:

| Row | Result |
|---|---|
| `K_{1,12}@8` | 1980 / 3960 / −1980 |
| path-star `(2,3,4)@7` | 1483 / 2701 / −1218, with `x = 5` and `α = 11` |
| path-star `(2,2,4,3)@8` | 8033 / 13467 / −5434 |
| `CB(1,7)@10` | 29190 / 58002 / −28812, with per-leaf terms `0` (arm) and `−4116` (each private leaf) |
| `CB(2,5)@10` | 259980 / 396460 / −136480, with `(n, α, x) = (28, 16, 8)` |

Brute-force P and W agree on `CB(1,3)`, `CB(2,2)`, `CB(1,7)` (n = 24), `CB(2,3)` and `CB(3,2)`.

**The three record rows, own instrument** (`rows.py` → `rows_own.json`, about 6 s per row). On every row
`supply − capacity = S` is asserted with the two sides computed independently, and `F_p` equals all leaves by
per-leaf derivation.

| Row | `n` | `α` | `x` | window | `|F|` | `(cap − sup)/sup` |
|---|---|---|---|---|---|---|
| `CB(8,86)@460` | 1465 | 775 | 458 | [460, 516] | 689 | 0.0124212 |
| `CB(8,89)@476` | 1516 | 802 | 474 | [476, 534] | 713 | 0.0122405 |
| `CB(8,92)@492` | 1567 | 829 | 490 | [492, 552] | 737 | 0.0120714 |

**Every digit of F1's printed `supply`, `capacity` and `S` agrees with mine on all three rows.** They are 330-, 342-
and 353-digit supplies. For `CB(8,92)@492` there is a third route: rebuilding supply and capacity as
`Σ_v mult·q_v(p)` and `Σ_v mult·q_v(p−1)` from the frozen `RESULTS.json` orbit `H` and `R` vectors (by the WID
bijection, C1-LA1) reproduces both exactly. The frozen `alpha`, `x`, `favorable_count` and `aggregate` also match.

**Closed form.** I re-derived F1's `T(x,y)` and `W(x) = ∂_y T|_{y=1}` independently:

- With the root `r` in `B`: `s` and all chokes are out. Each pair is weight-blind `(1+2x)`, and the arm tip `v` is free
  and active: `(1+xy)`.
- With `r` out of `B`: the arm contributes a weight-blind `(1+2x)`. Each choke contributes `(1+2x)^d + x(1+xy)^d`.

Both expressions agree with F1's. The record rows use the *symbolic* derivative `layer_weight_poly_closed`. It is correct
because my direct DP gives the same supply and capacity separately, but F1's shipped code never validates it (see the
certification audit).

**`q`-class decomposition.** I checked F1's `W_q(x) = C(m,q)·dq·x^{q+1}(1+2x)^{1+d(m−q)}(1+x)^{dq−1}`, the weight-1
sector `x²(1+2x)^{dm}`, and the weight-0 classes (`r ∈ B`, `v ∉ B`; `r ∉ B` with `q = 0`). `classes_check.py` enumerated
every independent set of `CB(1,2)`, `CB(2,2)`, `CB(1,4)`, `CB(2,3)`, `CB(3,2)`, `CB(3,3)` and `CB(4,2)` and classified
each literally. Every class polynomial, the sector's uniform weight 1, and the zero classes all match. **The partition is
exact.**

At the record rows, the class supplies sum to my independently computed supply on all three rows. F1's script computes
`total_supply_from_classes` but never compares it with anything; I did the comparison. The shares are:

| Row | `q = 4` share | sector share |
|---|---|---|
| `m = 86` | 0.226972 | 0.00098 |
| `m = 89` | 0.224985 | 0.00084 |
| `m = 92` | 0.222209 | 0.00073 |

`q = 4` is the argmax on all three rows, so F1's 0.2270 / 0.2250 / 0.2222 are confirmed. The forest-truncation bug
cannot reach `run_classes.py`, which uses only closed forms and never builds `H_v` or `R_v`. The fixed
`tree_dp_independence_poly` does loop over every component. No surviving bug touches the `q = 4` finding.

## Attacks and findings

1. **Fidelity passes.** The checks were run on F1's code and my replay:
   - `w_F` counts active tags only. In brute force the test is `(sset − {v}) ∩ W_v`; in the closed form the `y` marks
     sit only on `v` when `r ∈ B` and on `c_{ij}` when `u_i ∈ B`.
   - `F` is fixed at rank `p` from `Δ_p(T − v)` on the original tree.
   - `x` is computed through rank `α`, and eligibility is checked literally.
   - `supply − capacity = S` is checked from independent sides (closed-form `W` against the `H`/`R` tree-DP aggregate),
     so ruling 17 is satisfied.

   F1 needs no relation (D) ∪ (S), because it computes no neighbourhood at all (item 5). One partial weakness: F1's
   `F_p` comes from **two orbit representatives** plus an unstated symmetry. The claim "|F| was derived, not assumed"
   holds only up to that symmetry. My per-leaf derivation confirms `|F| = 1 + dm` on all three rows.
2. **The WLOG lemma (§7) is correct, and it is not new.** Deleting weight-0 members leaves `Σ_X w` unchanged and can only
   shrink `N(X)`, so the deficit cannot decrease. Direction and statement are right, and the lemma is consistent with the
   Cycle 2 (R-ii) record: that failure came from splitting `X`, not from dropping weight-0 members. But the run already
   holds **C2-LA1, `formally_verified`**: if weighted Hall fails, an `Aut(G)`-invariant, **all-positive-weight**, strictly
   deficient family exists. For a search, that is exactly "restrict to positive-weight sources", with invariance
   included. F1 calls its lemma "distinct from (INV)" but never mentions C2-LA1.
   - The lemma is therefore **subsumed** by an award of this run and must not be registered as a new `E993-R30-…` key.
   - F1's grade `proved` is not on the `SOLUTION-CONTRACT.md` §4 scale; at most it is `proved_informal`, and it is not a
     contribution.
3. **The "new exact global supply/capacity" is a replay of the aggregate row with the two sides separated.** By WID and
   the bijection behind it, supply is `Σ_v q_v(p)`, which can be read directly from the frozen `RESULTS.json` orbit
   polynomials at the 92 row (I did so). The full-layer margin `(cap − sup)/sup = −S/sup` is (HALL-COND) at
   `X = I_{p+1}` only. Every size-`p` independent set of these trees extends to size `p + 1`: a maximal independent set
   there has at least `dm` elements, which is larger than `p`. So this margin is just the known sign of `S`. It carries
   no information about (HALL) on subfamilies. I retain the numbers as `bounded_computation`; the "materially tighter,
   first-time" framing adds nothing toward the headline.
4. **§5 misstates the record: struck.** F1 writes that the margin is "consistent with … the Cycle 2 `computer_assisted`
   finding that the whole network saturates with room to spare". The Cycle 2 `computer_assisted` record is **sector**
   Hall on `X ⊆ X_sec` only (`C3-ALLOCATION.md` standing state). The full network at the three rows is exactly the
   OPEN part (mixed sec / V / S-O families). No record says the whole network saturates.
5. **The chartered search was not executed.** Allocation item 3(a) asks for exact `Σ_X w_F` **and** `Σ_{N(X)} w_F` on
   class unions. The return computes only source-side weights. Not one family `X` has its neighbourhood evaluated under
   (D), (S) or both, so the return contains no cut search in any sense. The `q = 4` concentration is a statement about
   supply mass, not about Hall slack. F1's own boundary section says as much, correctly.
6. **The part (c) miss is avoidable.** F1 says the `t`/`M` notation was unavailable. But `C3-ALLOCATION.md`, which F1
   read, gives the registered `CBstar` deficit formula `max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1})` in its standing
   state, and item 3(c) states the target inequality `3(p−1) < 2(M+1)`. Together these define the object: a residual
   `T − N[Q]` consisting of `M` blocks with `t + 1 = 2` single-element states each. I attempted it (item 8).
7. **"No cut found" is not presented as evidence for (HALL).** The return says it is unresolved. Its verdict
   `bounded_evidence` and `headline_resolved: no` are correct.
8. **Critic-derived advance (C-F1-U, attributed to me, not to F1): a non-CB switch-necessary tree of order 1427 < 1465.**
   - *Class.* `G(d_1,…,d_m)`: the path `r–s–v`; `m` chokes `u_i ~ r`; choke `i` carries `d_i ≥ 0` pendant paths
     `u_i – b – c` (`d_i = 0` makes `u_i` a leaf of `r`). This is exactly the class of trees whose root-plus-arm sector
     `Q = {r, v}` has a residual `T − N[Q]` of `M = Σ d_i` disjoint edges (a `t = 1` sector), given that `s` has degree
     2. `CB(d,m)` is the homogeneous case.
   - *Closed forms.* `I(G) = x(1+x)(1+2x)^M + (1+2x)Π f_{d_i}` and `I(G−v) = x(1+2x)^M + (1+x)Π f_{d_i}`, where
     `f_d = (1+2x)^d + x(1+x)^d`. Both were validated against the generic DP on 60 random members (`gcb_closed.py`).
   - *Sector facts, proved on the face.* Suppose `v ∈ F_p`. Every sector source (`r, v ∈ B`) has weight exactly 1: `v`
     is active through `r`, and each `c` is inactive because its witness `u_i ∈ N(r)` is out. Deleting `r` or `v` gives
     weight 0; deleting a pair element gives weight 1. So
     `Σ_{X_sec} w − Σ_{N_D(X_sec)} w = 2^{p−2}[2C(M,p−1) − C(M,p−2)]`, which is positive **iff** `3p < 2M + 5`. This is
     the `t = 1` instance of the registered `CBstar` formula, re-derived for this class; I do not claim it as new.
   - *Switch image.* The switch image of the whole sector is the set of targets `(B ∖ {r, b}) ∪ {u_i}`, with exactly one
     `b` under `u_i` in `B`. Its total weight is `Σ_i Σ_{j<d_i} C(d_i,j)·j·2^{p−2−j}C(M−d_i, p−2−j)`.
   - *Brute-force check.* `sector_brute.py` enumerated sources with the literal relation (D) ∪ (S) and literal weights
     on `G([2,3])`, `G([3,1,2])`, `G([2,2,2])`, `G([4,1])` and `G([3,3])` at every `p`. The source weight, the deletion
     image weight, the switch image weight and the uniform weight 1 all match.
   - *Scan.* The search was bounded and exact (integer closed forms, `scan_homog.py`, `scan_mix.py`, `scan_tri.py`). It
     looked for eligible `p` with `x+2 ≤ p`, `3p < 2α+1`, `3p < 2M+5` and `Δ_p(G−v) < 0`.
     - Homogeneous `CB(d,m)` with `d ≤ 16` and `n ≤ 1600` hits only at `d = 8`, `m ∈ {86, 89, 92}`. This reproduces the
       record that the first CB hit is `CB(8,86)`.
     - **Two-type mixtures `{8^a, 7^b}` hit at order 1427**: 82 chokes with `d = 8` and 2 chokes with `d = 7`.
   - *Verification of the order-1427 row with the generic instrument* (`verify1427.py` → `verify1427.json`):
     - Tree check passed. `n = 1427`, `M = 670`, `α = 755`, `x = 446` (`Δ_446 < 0 ≤ Δ_445`).
     - The eligible window is [448, 503]. `p = 448` is the only rank with `3p < 2M+5 = 1345`.
     - `F_448` is all 671 leaves, derived per leaf.
     - Supply is a 322-digit number, capacity is larger, and `S < 0` (320 digits). `supply − capacity = S` holds with
       the two sides computed independently.
     - Sector source weight is `153295923…` (319 digits) and its deletion image weight is `152953744…` (319 digits).
       Their ratio is **exactly 448/447**, and the **deletion deficit is `3421784…` (316 digits), which is positive**.
     - A second instrument, the frozen `ordinary_tree_checked.py`, gives the same `α = 755` and `x = 446`, and
       `Δ_448(T − v) < 0` for the arm tip, a `d = 8` private leaf and a `d = 7` private leaf.
     - The row lies in the unresolved band `2p+3 ≤ n ≤ 4p−8`.
   - *What it means.* Deletion-only transport fails at an eligible rank on a tree of order 1427. This answers the
     Stage 1 gate's open question "whether any tree of order 20–1464 is switch-necessary": yes, order 1427.
   - *What it does not mean.* It is **not a cut**. With switch arcs, the whole-sector family `X_sec` has large mixed
     slack: the switch image weight is about 13.1 times the sector supply. I have not checked subfamilies of the sector,
     or the coupled sec / V / S-O families, on this tree.
   - *Why 1427 beats 1465.* The mechanism is heterogeneity. The sector condition depends on `M` modulo 3; `M ≡ 1 (mod 3)`
     is the favourable residue. Heterogeneous chokes set that residue without requiring `m ≡ 2 (mod 3)` (all three CB
     rows have `m ≡ 2`), so fewer chokes suffice.
   - *Search scope, stated exactly.* 1427 is the **smallest found**, not a proved minimum.
     - All two-type mixtures `{d1^a, d2^b}` with `5 ≤ d1 < d2 ≤ 16`, below 1427: none.
     - Pairs with `d2 ∈ 0..4` and `d1 ∈ 6..12`, below 1427: none.
     - `{8,7}` and `{8,9}`, below 1466: minimum 1427. The next are 1433 (`8^83 9^1`) and 1434 (`8^78 7^7`).
     - Three-type mixtures `{8,7,9}`, `{8,7,10}`, `{8,9,10}`, `{8,7,6}`, `{8,9,6}` and `{8,7,11}`, minor counts below
       40, below 1427: none. The remaining triples in the list hit the time limit and were not run.
     - Grade: `bounded_computation`, apart from the sector-deficit counting identity (`proved_informal`, re-derived).
       Nothing here is universal.

## Mechanism-equivalence and fence check

- F1 proposes no transport mechanism, so it revives none of the ten refuted keys. It computes source-side weights under
  the charter's `w_F` and makes no deletion-only or per-leaf claim.
- It does not re-prove a closed region. The `CB(8,92)` aggregate replay and the fixed points are used as instrument
  checks, correctly.
- It uses no census value and no RTree wording, and it does not use the controller's prior as evidence.
- (LIFT) and `D, C ≥ 0` are not invoked.
- One fence issue: the §7 lemma is offered as a contribution while C2-LA1, formally verified in this run, already
  certifies it (finding 2). This touches ruling 21 ("nothing … re-proved as a contribution") and claim identity.
- Claim identity:
  - F1 correctly uses WID (`E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, C1-LA1) without re-proving it.
  - It registers no key, which is correct.
  - Its alias search over "all 443 run-local claims" and its distinction from
    `E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE` are self-reports. The run-local registry is not in my capsule, so
    I cannot verify them.
  - My order-1427 row is a `bounded_computation` record with the scope note above. If the synthesis registers it, it
    should be recorded as a scope note on (HALL) about switch-necessity (it is not a (CUT)), with the sector-deficit
    arithmetic attributed to the registered `CBstar` key at `t = 1`.

## Certification audit

Literals **struck** (not backed by shipped evidence):
1. "`run_validate.py` checked … on **eight** small `(d,m)` pairs". The shipped file has **six** cases: (1,1), (2,1),
   (1,2), (2,2), (3,2), (2,3). I replayed it: `ALL_OK: True`, six lines.
2. "`W(x)` … verified equivalent to the slow bivariate-then-differentiate route on 8 small cases before being trusted at
   scale". `run_validate.py` validates `cb_bivariate`/`layer_weight_poly`, **not** `layer_weight_poly_closed` or
   `base_poly_closed`, which are the functions behind every record number. No shipped code compares them on small cases.
   At the record rows only `S` (the difference `W[p+1] − W[p]`) is cross-checked, so supply and capacity *separately*
   had no shipped validation. The numbers are nevertheless correct (my direct DP; the frozen `H`/`R` route).
3. "`run_classes.py`'s embedded validation, all `match: True`" on 7 small cases, and the sector check "via `sector_poly`
   matching `layer_weight_poly_closed` after subtracting all `q≥1` classes, all 7 small-case checks". `run_classes.py`
   has **no** validation code, and its output has no `match` field. The claims are true (my brute force and total-sum
   check) but unbacked as F1's evidence.
4. "**Every** reported row below carries three independent confirmations". Confirmation 3 (frozen instrument) exists for
   the `m = 92` row only. Confirmation 2 is on different rows (`CB(1,7)@10`, `CB(2,5)@10`) whose values no shipped
   script computes. The values are right (I reproduced them), but they are not shipped evidence.
5. "each independently a ~340–~450-digit exact integer". The actual lengths are 329–353 digits.
6. "consistent with … the Cycle 2 `computer_assisted` finding that the whole network saturates" (finding 4).
7. The §7 grade "`proved`": not a contract grade, and the lemma is subsumed by C2-LA1.

Literals **backed**:
- The three-row `n`, `α`, `x`, `p`, eligibility, `|F|`, and every digit of supply, capacity and `S`.
- `P_closed_eq_P_dp`, `WID_matches_aggregate` and the frozen cross-check (replayed; true).
- The `q = 4` shares, and `CB(1,7)` `g_arm = 0`, `g_priv = −4116`.
- The file digests; the internal `PAYLOAD_SHA256` is backed but not replayable because of the timings.
- The script byte-parity between `c3-F1/` and `c3-F1-replay/`.
- The PID-72145 kill is self-reported and could not be checked.

## Verdict

verdict: retained_narrowed
headline_resolved: no

What is retained, all as `bounded_computation`:
- The three rows' exact `α`, `x`, `|F|`, supply, capacity and `S`. My independent instrument confirms them digit for
  digit, and the frozen polynomials confirm them at the 92 row.
- The closed forms `T(x,y)` and `W(x)`, re-derived.
- The exact `q`-class partition and the `q = 4` weight concentration, confirmed by brute force and by the total-sum
  check.
- The WLOG lemma, as a correct elementary remark subsumed by C2-LA1, with no key and no contribution credit.

What the narrowing removes:
- The seven struck certification literals.
- The misstatement of the Cycle 2 record.
- The "new/first-time" weight of the supply/capacity finding.

The route's chartered object (a class-union cut search with `N(X)` under (D) ∪ (S)) and part (c) were not executed.
The route verdict `bounded_evidence` stands.

The critic-derived advance is recorded separately above and attributed to C-F1-U: a non-CB tree of order 1427 at
`p = 448` whose `t = 1` root-plus-arm sector is deletion-deficient at an eligible rank (ratio exactly 448/447). It is
checked by two instruments plus brute-force validation of the sector formulas. It has not had a second read, and it is
not a cut.

## Remaining obligation

1. **The class-union cut search itself.** At `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, compute exact
   `Σ_{N(X)} w_F` under (D) ∪ (S) for `Aut`-invariant unions that mix sec, positive-weight V and positive-weight S/O
   classes, indexed at least by (arm state, `q`, per-choke support-occupancy marginals). The (S) image depends on
   per-choke "exactly one support present" counts, so the index must carry them, as the frozen `test_cut` envelope
   already does. Any deficit must be exhibited as an original class-union cut and confirmed by two instruments and an
   isolated second read.
2. **The order-1427 row** (`G(8^82, 7^2)`, `p = 448`):
   - an isolated second read of the switch-necessity claim;
   - sector Hall under (D) ∪ (S) for **every** `X ⊆ X_sec`, not only `X = X_sec`;
   - the coupled families on this tree;
   - a check of whether it, not `CB(8,86)`, should become the smallest witness row for the portfolio.
3. **Minimality.** Decide whether any tree of order below 1427 is switch-necessary. Within the generalized-CB class this
   means the unscanned mixtures (the remaining triples, and general multisets with `d_i ≤ 4` alongside large `d`). Beyond
   it, it means sectors with `s` carrying pendant pairs (`d_0 > 0`, which changes the deletion image because `v` stays
   active through `s`'s pairs), larger `Q`, and `t ≥ 2` star-forest residuals (T2's route).
4. **Housekeeping for F1's instrument, if reused.** Add shipped small-case validation of `layer_weight_poly_closed` and
   of the class partition. Remove wall-clock timings from hashed payloads. Derive `F_p` per leaf.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-F1-U/`.
Replay with `python3 -B` from `own/`.

Own instrument (`own/`):

| File | SHA-256 |
|---|---|
| `inst.py` | `c72add8b7c18ae82abc8eed24d7f32a967ad777b82c55a53b2ce376025bff1b2` |
| `validate.py` | `fc8b89526afac129f6924481e6020beb7934fd8a26edf0ad63ea6ac7ee83c92d` |
| `rows.py` | `e1be383b084823235f9ec3f34067ea189a0eadcb297146e025033411c66aaa11` |
| `rows_own.json` | `875a3279bd9d37c23d5ebe910410bba49b8711336335af58ca69896fd65b802c` |
| `classes_check.py` | `08732329e7462f105435dfd09dc9f5b3e372e081a386fef053ee935afb07e9a7` |
| `gcb_closed.py` | `a6c5f259cedf07f3391bf7c7d2eee55e1969dffcf80eb616967e0fb39c21d826` |
| `scan_homog.py` | `8b69a0aa9c4d2eecfbffe1d02c52b01d2de5b9ce2039da51d4ab89a083ac3f4c` |
| `scan_mix.py` | `c2e4473aa636af5f63acc5ccdd379d7e9cdb5b1336a30e014cb3c2c3ddbbf9da` |
| `scan_tri.py` | `feb5cbc12a83944de886cbcb718f18cf8801a627417742b583c4bf52dd82eea9` |
| `sector_brute.py` | `f7158219ffaad358c53122141bde07e07083906d0c05ce01423afc9a932b16d7` |
| `verify1427.py` | `bbf9f88962aae11cdc047bad40433d16d1c13631f86bedf00aa573af25d1cf5c` |
| `verify1427.json` | `39044abe8d49d9e0781c6ccbb36c20712cc5363f066406360f8c4ef0c55c6fac` |

Copy-out-first replay of F1 (`replay/`):

| File | SHA-256 |
|---|---|
| `lib_transport.py` | `59d1b1146526d98ac429c2b19c6bac596ae4dec8a44732cd914208b3fada5b22` |
| `run_validate.py` | `64beae956db3f0cb01d6733d565d6cf3e2a6458f2e2839028a42a88fb33f7392` |
| `run_classes.py` | `354b4a1aa3e02de489a6fd33b278653f89dd252767db6fc729edf4d1f708f192` |
| `run_rows.py` (output path redirected; original `1e04c6f5…`) | `16d8d303033cd7be15206f2172508a097f08be2275e4f55f87b163b48c757e12` |
| `rows_output.json` (replay) | `07c008180281132f2805dd76a91aec272bfaa8ec061b9720a8e1b3abdb182928` |
| `class_output.json` (replay, byte-identical to F1's) | `eb94a8d41f0d3e799bbdd23e845f1dcc5a8f0c435394b5bfd668dd6fb1a20042` |
| `orig_outputs/rows_output.json` (F1's copy) | `ba0e5848d1682863d199535e67b05cfd0b2e4cfaac14500a31b43df71b820ced` |
| `orig_outputs/class_output.json` (F1's copy) | `eb94a8d41f0d3e799bbdd23e845f1dcc5a8f0c435394b5bfd668dd6fb1a20042` |

Exact order-1427 sector integers, from `verify1427.json`:

- Sector supply:
  `1532959232862557040604654280907553147558580322909477585483839395111889928501984683802036625588803229512192646124071987893966366914245105981847958831729305618110990997928314052561422413790082342393651912268322117365740716494902221448080429941320323888818071996608826552674182952171043862168848651929177737847195566080000`
- Deletion image weight:
  `1529537448860631690067590320459098787854208491831554644444812967890658031340149896561407079549542508017745787538973612920988763416668666013138476780765624132356278964450795494408383524473586622879380367821294612639477902395583243275205250410201305308709103085902110421976249508081376353547936043331121537539500933120000`
- Deficit:
  `3421784001925350537063960448454359704371831077922941039026427221231897161834787240629546039260721494446858585098374972977603497576439968709482050963681485754712033477518558153038889316495719514271544447027504726262814099318978172875179531119018580108968910706716130697933444089667508620912608598056200307694632960000`
- `S(G, 448)`:
  `-18490741345286020874266913330196026626870833184683348611596479054338004047856009278888710810224648716852435993416263482650254406162404137624103122603916434549160864805183572176687128083626874682734880894115783689990566804525665389271943671752576717702052546070739031115064828278666240732684849564709249083423618294187008`

No background job is running; the one auto-backgrounded scan was stopped via TaskStop before it produced output. Nothing
was written outside this scratch directory and this critique path.
