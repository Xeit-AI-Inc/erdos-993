# Critique

Critic `C-F1-U` (orientation U, formal/structural), r30 Cycle 5 Stage 4. Assigned return: `cycles/cycle-5/stage3/returns/F1/RETURN.md`
(route `C5-F-01 CB-SMALL-SWITCH-CAPACITY-SECTOR-CUT-SEARCH`, orientation F).

**Boot acknowledgment.** I am operating within VerityOS. Boot files read: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS file was opened. Ordering deviation, disclosed: a zsh
error in a combined shell command stopped the command list after `verity.md` was printed, so I read `startup-protocol.md` after I had
read the critic protocol and the capsule. The host injected the project CLAUDE.md and the memory index into context automatically. I
did not act on them, and I kept no conversation log because writes are restricted to the critique path and my scratch directory.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- Dispatch `control/dispatch/c5-stage4/DISPATCH-C-F1-U.md`: SHA-256 `28b39de8d1a153fbc119d3a3905da12711f2d35b3aa7553384ea5bb3d2d163db`. It matches the value in the dispatch message.
- **Capsule seal** `control/c5-critic-capsules/F1-PACKET-MANIFEST.json`: I recomputed it canonically (sort_keys, `(",", ":")`, `seal_sha256`
  removed, no trailing newline) and got `9fb580a53285a2551f4fa54b88e0a2adc11cb55b7478fdc13addca635ee99205`, which equals the stored value. The 14 members all
  match on byte count and SHA-256.
- Stage 4 dispatch manifest seal: `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d`, recomputed equal. Stage 3 manifest seal:
  `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58`, recomputed equal.
- **Stage 2 seal: a literal defect in the protocol.** `C5-CRITIC-PROTOCOL.md` Duty 1 gives the Stage 2 seal as `f0b5a2a1…0869684`. The manifest's
  stored seal and my canonical recomputation are both `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289`. That value is the one the common
  brief states and the one F1 reports. I found no file in the capsule that carries `f0b5a2a1…`, so I judge it a stale literal in the protocol text
  (possible clone residue, ruling 44). The manifest is sound.
- The return's inventoried artifacts under `scratchpad/c5-F1/` all match their listed digests: `tools.py 77e53d0c…`, `sector.py 8887f5b8…`,
  `favorable.py afd2b4e4…`, `brute_validate.py 05e84c10…`, `wid_check.py 6c431387…`, `F1_GENERATOR.py 19217981…`, `row_table.py 9283271d…`,
  `F1-GENERATOR-OUTPUT.json 2f5a009f…` and `ROW-TABLE.json 1e4e807d…`. The three sources F1 cites match `SOURCE-DIGESTS.json`: I checked
  `ordinary_tree_checked.py a012bb78…` and `cb-switch-cut/RESULTS.json 873cf922…` and `run.py 94ced046…` directly.
- **Copy-out replay** into `scratchpad/c5-crit-F1-U/replay/`, run with `python3 -B`: `F1_GENERATOR.py` took about 51 s in the foreground and wrote an output
  byte-identical to the shipped file. The internal digest `a1dd26fd…ea73` reproduced. `row_table.py` produced a `ROW-TABLE.json` byte-identical to the shipped one.
- Process disclosure by the seat, noted: F1 ran one `ps aux` (a forbidden full process listing) that showed T1's process. It self-disclosed this and it is
  recorded in `C5-STAGE3-READ-BOUNDARY-DISCLOSURES.json`. Nothing F1 used came from it.

## Independent re-derivation

My instrument is written from `SEMANTIC-CONTRACT.md` only and imports no F1 code. It lives in `scratchpad/c5-crit-F1-U/`:

- `crit_core.py` is a generic tree DP with forced-in and forced-out sets on the original carrier. It computes `x` through rank `α`, the terminal difference
  included. `F_p` comes from `Δ_p(T − v)` per leaf. `S` has two differently forced sides: side 1 is `Σ_F[q_v(p) − q_v(p−1)]` from the deletion sets
  `H_v, R_v`. Side 2 is the layer weight `Σ_{I_j} w_F`, obtained as `#{B ∋ v} − #{B ∋ v, B ∩ W_v = ∅}`. The two sides are compared by assertion.
- `crit_net.py` enumerates independent sets directly, applies (D) ∪ (S) literally and `w_F` literally, and runs a Dinic max flow.

**Fixed points reproduced** (`fixed_points.out`; independent-set enumeration, relation and flow on the explicit graph):

| instance | n | α | x | p | \|F\| | supply | capacity | S | max flow | arcs |
|---|---|---|---|---|---|---|---|---|---|---|
| K(1,12) | 13 | 12 | 6 | 8 | 12 | 1980 | 3960 | −1980 | 1980 | 1980 |
| path-star (2,3,4) | 15 | 11 | 5 | 7 | 10 | 1483 | 2701 | −1218 | 1483 | 2025 |
| path-star (2,2,4,3) | 18 | 13 | 6 | 8 | 12 | 8033 | 13467 | −5434 | 8033 | 11691 |

CB(8,92)/492 by the generic DP on the explicit 1567-vertex tree: n = 1567, α = 829, x = 490, eligible window [492, 552], and all 737 leaves favorable. I
derived F per orbit: the dm private leaves form one orbit and the arm leaf `v` its own. Separately, `cb_closed.py` checked every private leaf's deletion
polynomial by the generic DP on 25 trees with d, m ≤ 5. P equals the frozen `RESULTS.json` polynomial. S is two-sided (side 1 = side 2), negative, and
exactly equal to the frozen `aggregate`. S has **351 digits** (352 characters with the sign). Sector supply over deletion shadow is exactly `492/491`.
T_m and the A000055 counts do not apply: no census or T_m computation is in scope.

**The sector closed form, re-derived.** Let `B` be in the root+arm sector, so r and v are in B. Then s and every choke are absent, and each branch holds
nothing, `b_ij` or `c_ij`. Every member has weight 1: v is active through r, and each private tag is inactive because its witness `u_i` is absent. Every
switch vertex `u` with `|N(u) ∩ B| = 2` is one of two kinds:

- `s`, giving an image of weight 0; or
- `u_i` with exactly one support `b_ij` in B. Its image is `B − {r, b_ij} + u_i`. That image contains v, which is now inactive because r is gone, and ℓ
  leaves under `u_i`, all active. Here ℓ ≤ d−1 because branch j is emptied, and the image determines the leaf set but not j. So the distinct images for
  choke i number `C(d, ℓ)` at weight ℓ.

No support or leaf can be a switch vertex. Deleting r or v gives weight 0. Deleting a branch element gives a sector configuration of size p−2, and every
such configuration is reachable when p−2 < dm. Hence

`Σ_X w = [x^{p−1}](1+2x)^{dm}`, and
`Σ_{N(X)} w = [x^{p−2}](1+2x)^{dm} + m·Σ_{ℓ=0}^{d−1} ℓ·C(d,ℓ)·[x^{p−2−ℓ}](1+2x)^{d(m−1)}`.

This agrees with F1's `d·x(1+x)^{d−1} − d·x^d` form. I summed it state by state, not through the identity. The ratios agree with SR-C3-6: whole-sector
N-weight over supply is 14.3213, 14.7859 and 15.2506 at CB(8,86)/460, CB(8,89)/476 and CB(8,92)/492. The switch image alone gives 14.2526 at 492.
F1's formula agrees with SR-C3-6.

**Beyond the two families F1 tested.** `families.py` evaluates Hall exactly for any per-choke product family
`X_A = {sector members whose every choke state (a, b) lies in A}`. It counts N(X_A) by literal arc type: all-in-A deletion targets with a growable choke,
one-choke-out-of-A predecessors, and switch images of weight b from states (1, b). I validated it against the literal network on 72 families (random A
included) on 8 laboratories: 0 mismatches. It also reproduces F1's restricted `(4,2,4)` values `136 / 96` literally. F1's own shipped code does not run
that check (see Certification audit).

## Attacks and findings

**A1 — Fidelity.** The weight counts active tags only. The relation is exactly (D) ∪ (S), coded by literal neighbourhood intersection. `F` is taken at
the original rank p. `x` runs through rank α. **But `supply − capacity = S` is not asserted on any eligible instance.** The two-sided WID check
(`wid_check.py`) runs on five laboratories, and I computed all five as non-eligible:

| instance | x | α | \|F_p\| |
|---|---|---|---|
| (2,2,3) | 4 | 7 | 0 |
| (2,2,4) | 4 | 7 | 5 |
| (3,2,4) | 5 | 9 | 0 |
| (2,3,5) | 5 | 10 | 7 |
| (4,2,4) | 6 | 11 | 0 |

`F_p` is empty on **three** of them; the return says two. At the five certificate rows and on every grid row, `S` is computed one-sided
(`row_table.py` uses side B only) or not at all. `row_table.py` hard-codes `Fsize = d*m + 1`. The generator does derive favorability per orbit on the grid
and the five rows, so the |F| values are right, but the table's |F| literal is hard-coded. `brute_validate.validate` fixes F as all leaves, including at
labs where `F_p = ∅`, so it validates the formula for F = all leaves, not the literal network at those rows. I supply two-sided S at CB(8,86)/460,
CB(8,89)/476, CB(8,92)/492, CB(8,108)/577, CB(7,144)/673 and CB(25,14)/236, and at the new rows in A3. All of them have F = all leaves and S < 0.

**A2 — The grid search tests nothing about switch rescue (main finding).** I recomputed F1's grid, d ∈ [2,25] and m ∈ [2,15]. It has 1278 eligible rows,
F = all leaves on every one, and first+25 covers the whole window. **None is sector-deletion-deficient.** The deficiency condition is `3p < 2dm + 5` with a
nonempty sector, and at every grid row `[x^{p−2}](1+2x)^{dm} ≥ [x^{p−1}](1+2x)^{dm}`. So on every row F1 searched, the deletion shadow alone covers both
the full sector and, as F1's own numbers show, X′. The switch arcs are never needed, and "no deficient row found" could not fail.

F1's "minimising row" CB(25,14)/236 has supply/deletion-shadow `232/235`. Its 1.92 % margin is 1.29 % deletion slack plus 0.63 % switch weight. F1's
metric, (N − supply)/supply over all rows, is not the allocation's metric, "switch capacity relative to the sector deletion deficit", which is defined
only on deletion-deficient rows. Obligation (b) was not answered, and obligation (a)'s closed-form enumeration of the sector-deletion-deficient eligible
ranks was not produced. The trend F1 reports, "ratio shrinking with d", is the deletion slack shrinking near the mode of `(1+2x)^{dm}`. It says nothing
about the mechanism.

**A3 — Critic-derived: the enumeration F1 did not produce, and it contradicts "five rows".** `scan.py` runs over every eligible p (full window), with F
derived per orbit, for d ≤ 11 with m ≤ 160 and for d = 12, 13 with m ≤ 260. It finds **223 sector-deletion-deficient eligible CB rows**:

| d | rows |
|---|---|
| 7 | 24 |
| 8 | 52 |
| 9 | 49 |
| 10 | 30 |
| 11 | 9 |
| 12 | 49 |
| 13 | 10 |

d ≤ 6 gives none in range. Every one of these rows has `p = x + 2` and F = all leaves. Every one is switch-necessary: X = sector is a deletion-only Hall
failure, since its deletion neighbourhood is the p−2 layer plus weight-0 targets. Examples: CB(8,m) for m = 86, 89, 92, **95, 98, 101, 104, 107**, 108, 110,
…; **CB(7,109)/510** (n = 1638, smaller than CB(7,144)); and **CB(9,112)/673**.

A second instrument, the frozen authorized evaluator `ordinary_tree_checked.py` (copied out), re-derived two of these rows with every leaf's
favorability computed by its own deletion DP:

| row | n | α | x | eligible | favorable leaves | S | supply / deletion shadow |
|---|---|---|---|---|---|---|---|
| CB(8,95)/508 | 1618 | 856 | 506 | yes | 761/761 | < 0 | 508/507 |
| CB(7,109)/510 | 1638 | 873 | 508 | yes | 764/764 | < 0 | 510/509 |

My DP instrument agrees on both, with two-sided S. The standing statements "the five sector-deficient CB first ranks" and "the open switch-necessary
eligible row on record is `G(8^82,7^2)/448` alone" therefore describe a bounded list, not the CB pattern. There are many more switch-necessary eligible
CB rows, and the five-row key does not cover them (for example CB(8,95)/508 and CB(7,109)/510). Grade: `bounded_computation`. This record is for the
synthesis and for T1: an infinite switch-necessary CB class really exists at eligible ranks, which is what T1's (a′) object needs.

**A4 — Critic-derived: switch rescue over deficit is large, with its asymptotics.** Full-sector Hall holds on all 223 rows. The ratio (switch weight)
÷ (supply − deletion shadow) is **at least 4401.47**, with the minimum at CB(9,112)/673 in range. Other values: CB(8,86)/460 = 6128.8, CB(10,158)/1054 = 4814.0,
and d = 12, 13 give at least 8318. From the closed form, with `3p = 2dm + 4 − j`:

- deletion deficit / supply `= 3(1+j)/(2dm+4+2j)`;
- switch / supply `≈ m·3^{−d}·d(2^{d−1} − 1)`;
- so switch / deficit `≈ (dm)²(2/3)^d / (3(1+j))`.

This matches exact values within 0.1–1.3 %: 6156 vs 6129; 4405 vs 4401; 4810 vs 4814. At fixed d the ratio grows like m². Deficient rows appear only
above a threshold `m_0(d)` that grows roughly like `((d/6 − 1)(2/3)^d)^{−1}`: observed thresholds are 109, 86, 112, 106, 134 and 212 for d = 7 to 12. At
the threshold the ratio therefore grows in d. **Answer to F1's open item 2 at full-sector level:** the switch rescue does not shrink toward the deletion
deficit on the homogeneous CB pattern. It stays thousands of times larger and is smallest near d = 9. No full-sector "CB(7,1)/6-type" eligible row
exists in range, and heuristically none exists anywhere. Grade: `bounded_computation`; the asymptotic is a heuristic, `conjecture`.

**A5 — Suffix and other invariant families (attack brief item 2).** I tested 40 named product families at CB(8,86)/460 and 45 at CB(9,112)/673:

- full, `a ≠ 1` (F1's X′), switch-dead (`no (1, b≥1)`);
- every suffix and prefix by per-choke support count `a ≥ j`, `a ≤ j`;
- every suffix and prefix by leaf count `b ≥ j`, `b ≤ j`;
- the switch-weak families `a ≠ 1 or (1, b ≤ j)`.

None is deficient. The smallest relative margin is 0.765, for `b ≤ 1` at 673. The families that are deletion-deficient (full, `a ≤ 7/8`, `b ≤ 7/8`,
`a ≠ 1 or (1, b ≤ 6)`) all have switch/deficit at least 4401; the switch-weak family reaches 34467 at 460. A steepest-descent search over single-state flips at
CB(8,86)/460 from two seeds reached a local minimum of relative margin 9.24 (non-deficient). This covers product families only. Invariant families
defined by multiset conditions across chokes, such as "exactly k chokes in state s", are not covered, and **F1's obligation (c), for every Aut-invariant
`X ⊆ sec` at a switch-necessary row, stays open.** Deciding it at CB(8,86)/460 needs either the registered five-row certificate (already
`computer_assisted` there) or T1's uniform certificate. At the new rows in A3 it is not decided at all.

**A6 — Minor mathematical errors in the return.**

- §5 step 10 and §10 item 5 claim `Aut` may enlarge at `d = m`. That is false for `d = m ≥ 2`. `r` has exactly one degree-2 neighbour (`s`), while every
  choke has d ≥ 2 degree-2 neighbours, so r is fixed and `Aut = S_d ≀ S_m` for every d, m (not "S_m times S_d"). Only CB(1,1), which is `P_6`, has an extra
  reflection.
- §6: "(4,2,4) … non-deficient in both" is **false**. Supply 448 > neighbour 200, so the instance is deficient in both.
- "a genuine small deficient instance" for X′ at (4,2,4) holds only for F = all leaves. There `F_p = ∅` (x = 6, p = 4, not eligible), so under the
  literal `F_p` every weight is 0.
- §10 item 3 contains an unsupported heuristic ("k = 1 families … could be even MORE deficient"). A5 tests those product families; none is deficient.

**A7 — Scope.** F1 excluded d = 1 and m = 1 without saying so. I checked both. For d = 1 the sector is empty at eligible p (x ≳ m, so p − 1 > m), and in
any case every switch image from the sector then has weight ℓ = 0. The record gives m = 1 no eligible rank for d ≤ 300. Neither exclusion hides a cut.
F1 did not attempt the heterogeneous half of obligation (a), and says so.

## Mechanism-equivalence and fence check

F1 proposes no transport mechanism. It computes literal Hall counts for the charter's (HALL) network on sector families, so none of the ten refuted keys
is revived: deletion-only Hall appears only as a comparison, and the relation used is (D) ∪ (S) with the active weight. No closed region is re-proved, and
T_m, spiders and path-stars are not touched. There is no RTree wording. The five-row key and the controller prior are not used as evidence; F1 re-checks
the five rows as a coarser consistency check and says so. (LIFT) and (DCB) are not used. My own work relies on CD-1
(`E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`, `proved_informal`) only as motivation in A5, never as a step in any stated result. Registry keys
touched:

- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, unchanged);
- `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (used as a fidelity check only);
- `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (cited);
- `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` and `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`
  (unchanged at their exact scopes; A3 shows their scope is five rows of a larger switch-necessary set);
- `R30-CB-RECORD` (Tier-3 record; A3/A4 are candidate additions).

F1 registers no key, and correctly so: nothing it states is a predicate-named theorem. I propose none either. A3/A4 are bounded records, not keys.

**Ruling 39 letters:** F1 supplies none of (a′)–(d′). No (CUT) candidate exists, so there is nothing for (c′). My critique supplies none of them either.
It supplies a bounded record (A3) that an infinite switch-necessary eligible CB class exists, which bears on (a′)'s object.

## Certification audit

- "17 small instances" / "all 17 cross-check instances": **struck to 11.** The shipped generator runs 11 full-sector brute-force points; the replay gives
  all 11 matching. The "6 restricted points" are not run by any shipped script. I confirmed one of them, (4,2,4) at 136/96, with my own literal network;
  the other five are unidentified and unbacked.
- "(4,2,4) … non-deficient in both": **struck (false)**; it is deficient, 448 > 200.
- "two cases where `F_p` is empty": **corrected to three.**
- "reproduces … 352-digit `aggregate` value EXACTLY / bit-for-bit": no shipped script performs this comparison. **The fact is true, and I confirmed it
  independently**: equal to `RESULTS.json`, 351 digits (352 characters with the sign). The literal "352-digit" is inexact, and the claim is not backed by F1's
  code.
- §7 table: the "supply" and "neighbour" magnitude columns are **struck**. The exponents are wrong on all five rows. For example, CB(8,86)/460 is
  5.860×10^326 and 8.393×10^327, not ×10^332. CB(8,92)/492 is 4.520×10^349 and 6.893×10^350, not 4.520×10^355 and 6.943×10^355, so a mantissa is wrong
  too. The "margin/supply" column (13.32 … 29.03) is correct and consistent with SR-C3-6. The claim "the graph … in `ROW-TABLE.json`" is false; only
  (d, m) are there.
- "|F|" in `ROW-TABLE.json`: the values are correct but the literal is hard-coded (`d*m + 1`), not derived. The derivation is in the generator's grid and
  five-row sections.
- Gate-31 line, "Two instruments by which every `supply − capacity = S` assertion in this return was computed": **struck as overbroad.** Two sides were
  computed only on five non-eligible labs, and no eligible row carries a two-sided S in F1's shipped code.
- "1278 rows checked per family": backed; the replay and my recomputation agree. "no deficient row": backed but **vacuous** (A2).
- "margin ≈ 1.9 %", "tightest row", "minimising switch-capacity-relative-to-deficit": the numbers are backed, **but the interpretation is struck** (A2).
- 11 brute points, 16/16 DP-vs-closed-form, generator digest `a1dd26fd…` and byte-identical replay: backed.

`## Remaining obligation` in the return: items 1 and 2 are misdirected, because extending F1's grid in d does not reach switch-necessary rows, and I
answer item 2 at the full-sector level (A4). Item 3 is exact: every Aut-invariant family remains open. Item 5 is wrong (A6). Item 4 is exact.

## Verdict

verdict: retained_narrowed
headline_resolved: no

Retained at `bounded_computation`:

- F1's literal closed forms for the full root+arm sector and for X′ of homogeneous CB(d,m), with their literal-network validation (11 shipped points);
- the replay of the five certificate rows' sector numbers, whose margin column is correct.

Narrowed:

- the grid result reads only "no sector-deletion-deficient eligible row exists in d ∈ [2,25], m ∈ [2,15]; the search therefore did not test switch rescue";
- the "minimising row" claim and its trend are withdrawn;
- the literals listed in the Certification audit are struck.

No (CUT) candidate: F1 found none, and I found none among the product families at two switch-necessary rows. The statement's mathematics is not complete
at any grade above `bounded_computation`.

## Remaining obligation

1. Decide sector Hall for every `Aut`-invariant `X ⊆ sec` at a switch-necessary eligible row: the multiset families across chokes, not only per-choke product
   families. Start at CB(9,112)/673, the smallest switch/deficit ratio in range, and at the new rows CB(8,95)/508 and CB(7,109)/510.
2. Whole-row (HALL) at the switch-necessary eligible rows outside the five-row key. A3 lists 223 in range; for example CB(8,95)/508, CB(8,98)/524 and
   CB(7,109)/510. This is best discharged by T1's uniform certificate on `CB(d,m)`, d ≥ 7, m ≥ m_0(d).
3. Prove the A4 asymptotic, switch/deficit ≈ (dm)²(2/3)^d / (3(1+j)), as a lower bound. Supply the existence threshold `m_0(d)` and the observation that
   deficient rows occur only at p = x + 2.
4. The heterogeneous CB half of obligation (a), which neither F1 nor I attempted.

## Artifact inventory

Critic scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-F1-U/`. Everything was run with
`python3 -B`, standard library only, with no network and no lake/lean.

Scripts:

| file | SHA-256 | role |
|---|---|---|
| `crit_core.py` | `cadfddd3…2373d5` | generic tree DP with forced sets, x through α, F, two-sided S |
| `crit_net.py` | `bdfbf9df…ab95a3` | literal network, Dinic flow |
| `cb_row.py` | `65e0956a…62e3` | CB rows, two-sided S, own sector sums |
| `cb_closed.py` | `1f2a256c…2ad6ebd32e3` | closed forms, validated against the DP on 25 trees and all leaves |
| `scan.py` | `2a254551…c040` | edited after `scan_12_160.json` only to add an optional DMIN argument (default 1, behaviour otherwise unchanged) |
| `families.py` | `65f920f1…a53` | |
| `fam_named.py` | `68c0db14…43ab` | |
| `fam_local.py` | `e5806f2c…3211` | |
| `fam_deldef.py` | `a7c00380…1a68` | |
| `fixed_points.py` | `1807b21d…a29a418` | |
| `new_rows.py` | `c4ed2ff9…20be2` | |
| `second_instrument.py` | `c6f26781…c1ea` | |
| `small_checks.py` | `3c022d5c…3468` | |
| `f1grid_check.py` | `7de5d9a9…66e` | |
| `ordinary_tree_checked.py` | `a012bb78…533d` | copy of the frozen evaluator, unmodified |
| `fam_search.py` | | an aborted, over-long local search killed by its own 590 s timeout; no output, not evidence |

Outputs:

| file | SHA-256 |
|---|---|
| `fixed_points.out` | `527aa78f…c898` |
| `new_rows.json` | `49c7f642…c2cc` |
| `second_7_109_510.out` | `382efe85…1a1` |
| `scan_12_160.json` | `aa65783f…a1e` |
| `scan_13_260.json` | `bfef8a8d…bf5` |
| `fam_named_8-86-460_9-112-673.json` | `f0a100fb…f15d` |
| `fam_local_8_86_460.json` | `f8973512…826` |
| `fam_deldef.json` | `e2196c6a…ca7` |
| `small_checks.json` | `d7e5355c…9b5` |
| `f1grid_check.out` | `33dea562…1d3` |

The CB(8,95)/508 second-instrument result went to stdout only; it is quoted in A3 and reproduced by `python3 -B second_instrument.py 8 95 508` in about 300 s.

Replay copy: `replay/`. It holds F1's nine files. The originals were renamed `ORIG-*.json`, and the regenerated `F1-GENERATOR-OUTPUT.json` and
`ROW-TABLE.json` are byte-identical to them.

Background jobs: two, PIDs 17927 and 24169. Both exited on completion before this write and were confirmed by `ps -p <PID>`. No pattern kill and no full
process listing were used.

**Read-boundary disclosure.** One `grep -rl` rooted at `sources/` (within grant) also scanned `sources/heterogeneous-closure/`, which the attack brief says
not to read. It printed two filenames from there. I did not open them, and nothing from them was used. I read frozen Cycle 4 seat-instrument outputs under
`sources/c4-stage7-sources/C-T1-F/`: the head of `out_step1.txt` and `out_cbrows.txt`, plus directory listings. Those are authorized sources, reference
only. One non-recursive `ls` of `scratchpad/c5-F1/` was made to verify the inventory. No other return, critique, adjudication or root was read.
