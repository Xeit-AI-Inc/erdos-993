# Critique

Critic `C-U2-F` (orientation F, falsify) on route `U2` (`C4-U-02 SWITCH-SHARE-ALLOCATION-LEMMA`), r30 Cycle 4 Stage 4.
Date 2026-09-27.

**Boot acknowledgment.** I am operating within VerityOS. Boot: I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The harness truncated the middle of
`verity.md` on first display, so I re-read that span (lines 95–175) of the same file. Per the dispatch I did not follow the
protocol's task-type map into `memory/`, `conversations/`, `logs/` and the rest. The host-injected `CLAUDE.md` and memory index
were in context at the start. I did not open or act on either.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Plateau test (gate ruling 30):** the return supplies none of items (a)–(d). Every row it works on is non-eligible, it has
no (CUT) candidate, and it has no Lean. My own advances below do not supply any of (a)–(d) either.

## Identity and seal audit

- Dispatch `control/dispatch/c4-stage4/DISPATCH-C-U2-F.md`: SHA-256 `60af4d06…f93d3d`, which matches.
- **Capsule seal** `control/c4-critic-capsules/U2-PACKET-MANIFEST.json`: I recomputed it canonically (sort_keys, `(",", ":")`,
  no trailing newline, `seal_sha256` removed) and got `4d32baafa8b7ef9225633c3a834572185f38430b2d0d689fc1bde7ff740803d2`.
  **MATCH.** I also checked all 14 members by byte count and SHA-256: 14/14 match.
- Stage 4 dispatch manifest seal: recomputed `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`. MATCH.
- Stage 3 packet manifest seal: recomputed `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`. MATCH. Its
  entry for `cycles/cycle-4/stage3/returns/U2/RETURN.md` (`e54d4805…`, 40395 B) equals the capsule's entry and the file.
- Stage 2 packet manifest seal: recomputed `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`. It equals the
  charter value and the value the return quotes.
- The only source digest the return lists is `sources/lower-region/inputs/ordinary_tree_checked.py`. My recomputation gives
  `a012bb78…f533d`, 16710 B, which equals `control/SOURCE-DIGESTS.json`.
- **Replay of the six generators.** I copied them out first into `scratchpad/c4-crit-U2-F/replay/` and ran each with
  `python3 -B`. All six `RESULT_SHA256` values came out byte-identical to the return: `8382dbe8…`, `4056e0bf…`, `9ded05e3…`,
  `9d672d8e…`, `6fb8a589…`, `20a7d6f5…`. A reproduced digest shows only that the printed output is reproducible. The content
  audit is below, and several of the return's prose literals are not what these replayed outputs say.
- Scratch-inventory check. `scratchpad/c4-U2/` also contains `out_b9.txt` and `out_cb42.txt`, which the return does not
  inventory (low severity). The return also says it wrote a second directory, `scratchpad/c4-U2-replay/`. That directory is
  outside my grant. I did not list or read it.
- **Read-boundary disclosure (mine).** Beyond the capsule and the two boot files I made these accesses:
  - one non-recursive `ls` of `scratchpad/c4-U2/`, the granted artifact directory;
  - single-file greps on capsule members (`C4-CRITIC-ATTACK-BRIEFS.md` headings) and on my own replay copies;
  - a JSON walk of `control/SOURCE-DIGESTS.json`, a capsule member;
  - one `find . -name __pycache__` rooted at my own scratch (none found);
  - one read of `sources/lower-region/inputs/ordinary_tree_checked.py`, for its digest only (its content was not displayed).

  I read no sibling return, critique, adjudication, other root, live root or network resource. I made no installs. I ran no
  background jobs, and none are left running.

## Independent re-derivation

**Instrument.** My instrument is `crit_lib.py`, written only from SEMANTIC-CONTRACT §1.1–1.2. Its parts:

- `IsTree`: an edge count check, then union-find acyclicity, then BFS connectivity.
- A rooted forest DP for independence polynomials, with `x` scanned through rank `α` inclusive.
- `F_p` derived from `Δ_p(T − v)` on the original tree.
- The literal active weight `w_F`, and literal (REL) = (D) ∪ (S) taken from adjacency.
- Recursive independent-set enumeration and a Dinic max-flow with exact integers. The infinity is Σ supply + 1.
- (WID) asserted on every full-network row, with `S` computed from a separate forest DP over `H_v` and `R_v`.

**Fidelity of the return.** I read the return's code (`network.py`, `wid.py`, `families.py`, `run_*.py`):

- `w_F` counts active tags, `(B∖{v}) ∩ W_v ≠ ∅`, and nothing else.
- (S) requires `u ∉ B` and `|N(u) ∩ B| = 2`.
- `F` is derived at rank `p` on the original tree.
- `x` is computed through `α`.
- `CB(d,m)` is built as the contract says: path `r–s–v`, chokes on `r`, supports on chokes, one private leaf per support.

**Fidelity passes.** The one exception: (WID) is asserted only in `run_labs.py`, on three rows (see the certification audit).

**Fixed points.** My instrument reproduces every one:

| Row | Result |
|---|---|
| `K_{1,12}/8` | `n` 13, `α` 12, `x` 6, 12/12 favorable; 1980 / 3960, `S = −1980`; mixed flow = deletion-only flow = 1980 |
| path-star `(2,3,4)/7` | 1483 / 2701, `S = −1218`, flow 1483, 2025 arcs |
| path-star `(2,2,4,3)/8` | 8033 / 13467, `S = −5434`, 11691 arcs |
| order-8 tree `/3` | 29 / 32 / −3, mixed 29, deletion-only 27 |
| `CB(4,1)/4` | 60 / 60 / 0, mixed 60, deletion-only 52 |

`CBstar(2,2,2)/7` I take from the replay only (2194 / 3888 / −1694). My instrument has no `CBstar` constructor.

**Laboratory `CB(d,1)`, `d = 2..9`, every rank `2 ≤ p < α`.** These runs are full network, not sector-restricted
(`c1_full.py`, 46 rows, `RESULT_SHA256 2c005ad8…`). Every row passes (WID). `CB(7,1)` has order **18** (`3 + 1 + 2·7`), not
17 as the attack brief says; the return itself states no order. Every row is non-eligible.

| row | `n/α/x` | window | `\|F\|` | supply / cap / `S` | mixed flow | del flow | sector def. |
|---|---|---|---|---|---|---|---|
| `CB(7,1)/5` | 18/9/6 | [8,6] ∅ | 1 (only `v`) | 560 / 280 / +280 | 280 | 280 | 280 |
| `CB(7,1)/6` | 18/9/6 | [8,6] ∅ | 8 (all) | 924 / 945 / **−21** | **903** | 812 | 21 |
| `CB(8,1)/6` | 20/10/6 | [8,6] ∅ | 9 (all) | 2520 / 1960 / +560 | 1960 | 1848 | 406 |
| `CB(9,1)/7` | 22/11/7 | [9,7] ∅ | 10 (all) | 6636 / 5796 / +840 | 5670 | 5292 | 882 |

**Candidate key 1 (the three-term capacity identity).** I re-derived it by hand from the contract and confirmed every step.

1. `r ∈ B` forces `s, u_0 ∉ B`. Every sector member has `k = p − 1` occupied columns.
2. The tag `v` is active through `r`. Every private tag is inactive, because its witness set is `{u_0}`.
3. Only three kinds of arc leave the sector with positive weight:
   - in-sector deletions, of weight `1_v`;
   - the `u_0`-switch, fired exactly when `j(B) = 1`, which gives `C(d,k−1)` distinct targets of weight `(k−1)·1_c`;
   - nothing else. Deleting `r` or `v` gives weight 0, the `s`-switch gives weight 0, and a pivot at `b` or `c` has at most
     one neighbour in `B`.

The formulas match brute force on the replay's 35 pairs (`d = 2..8`) and on my literal flows for `d ≤ 9`. They also match on
two more instruments, below, that were validated against literal flows.

**One correction.** The return writes the switch term as `(k−1)·C(d,k−1)·1_v·1_c`. Read literally with
`X_sec = {B : r, v ∈ B}`, this is wrong when `1_v = 0` and `1_c = 1`: `N(X_sec)` then carries `(k−1)·C(d,k−1)` although the
supply is 0. The derivation actually supports `cap(N_D ∪ N_S) = 2^{k−1}·C(d,k−1)·1_v + (k−1)·C(d,k−1)·1_c`. That case never
arises for `d ≤ 60` (see the split scan in the attacks), but the stated formula needs either the hypothesis `1_v = 1` or this
restatement.

**Candidate key 2 (the `j`-threshold family).** For each `(d,k)` I computed the maximum Hall deficiency over all
`2^{k+1}` unions of `j`-classes and compared it with the maximum over thresholds (`c3_windows.py`):

- 653 rows (`d ≤ 60`, `k ≤ 12`): **0 mismatches**.
- Literal flows for `d ≤ 9`: `(8,5)` gives 406 and `(9,6)` gives 882, equal to the threshold formula.

## Attacks and findings

**F-1. Critic-derived: the Cycle 3 conjecture is refuted at `CB(7,1)`, `p = 6` (non-eligible).** The allocation records a
conjecture from the previous `C-U2-F` (grade `conjecture`): "on trees, `S(T,p) ≤ 0` implies a saturating flow at every rank
(no counterexample through order 15)". It is false.

At `CB(7,1)`, `p = 6`:
- `n = 18`, `α = 9`, `x = 6`, window `[8, 6]` is empty.
- `F_6` = all 8 leaves, derived.
- supply 924, capacity 945, `S = −21` from the forest DP, and (WID) holds.
- Yet the full (D) ∪ (S) network has maximum flow **903 < 924**.

Explicit cut, checked by enumeration with no max-flow (`c2_cut_cert.py`, `RESULT_SHA256 9983078f…`):
- `X = {B ∈ I_7 : r, v ∈ B, at least 2 supports in B}`, which has 546 members, all of weight 1, so `Σ_X w = 546`.
- `N(X)` has 2163 targets, of which 525 have positive weight, so `Σ_{N(X)} w = 525`.
- Deficiency **21**.

Second instrument: the return's own `network.py` (Edmonds–Karp on the full network, copied out) gives the same supply,
capacity and flow 903. Its min-cut source side equals `X` as a set.

What this does and does not show:
- It refutes only the conjecture. The rank is non-eligible (`p < x + 2`), so it is **not** (CUT) and touches neither (HALL)
  nor the primary aggregate.
- The return had the sector instance (sector flow 651 of 672) but never computed `S` there, never ran the full network, and
  never drew this consequence. The attribution is the critic's.
- The scan of `CB(d,1)`, `d ≤ 60` (`c6_conj.py`) finds 76 sector-deficient ranks. Only this one has `S ≤ 0`.
- Minimality is not claimed.

**F-2. Critic-derived: proof that thresholds are extremal (candidate key 2), `proved_informal` STATED here, pending an isolated
second read.**

*Setting.* `CB(d,1)`, rank `p = k + 1`, `1 ≤ k ≤ d`, `F = F_p` derived. Take `sec = {B : r, v ∈ B}` and
`δ(X) = w(X) − w(N(X))` for `X ⊆ sec`.

*Claim.* `max_{X ⊆ sec} δ(X) = max(0, max_{0 ≤ j0 ≤ k} δ(X'_{j0}))`, using the return's class formulas. If `1_v = 0` the
right side is 0.

*Proof.*

1. `δ` is supermodular: `w` is modular, and `X ↦ w(N(X))` is a weighted coverage function. So the union `M*` of all
   maximizers is itself a maximizer. The column group `S_d` preserves `r`, `v`, `F`, `w_F`, (REL) and `sec`, so `M*` is
   `S_d`-invariant, that is, a union `J` of `j`-classes.
2. Set `a_j = C(d,k)·C(k,j)` (source class `j`, weight 1 each) and `b_{j'} = C(d,k−1)·C(k−1,j')` (target class `j'`).
   - The class `j` reaches exactly the target classes `{j − 1, j} ∩ [0, k−1]`. Each such target class is reached in full,
     because `k − 1 < d` leaves a free column.
   - Only class 1 reaches the switch orbit. That orbit carries `π = (k−1)·C(d,k−1)·1_c`.
3. Split `J` into maximal runs of consecutive classes. Consecutive runs have disjoint neighbourhoods: if a run ends at
   `g − 1` and the next starts at `g + 1` or later, the first run's targets stop at `g − 1` and the second's start at `g` or
   later. So `δ(J)` is the sum of the run values, with `π` charged to the run that contains 1.
4. The ratio `a_j / b_j = (d − k + 1)/(k − j)` increases in `j`, so `a_j ≥ b_j` exactly when `j ≥ j* := 2k − d − 1`.
5. Take a run of `M*` with top `t`, `1 ≤ t ≤ k − 1`. Adding `t + 1` adds `a_{t+1} − b_{t+1}`, or `a_k > 0` if `t + 1 = k`.
   The class `t` is already covered, and `π` does not change because `t + 1 ≥ 2`. By maximality of `M*` this gain is
   negative, so `t + 1 < j*`. Then every element of the run lies below `j*`, so the run's value is negative. Removing it
   would raise `δ`, which contradicts optimality.
6. Hence every run of `M*` ends at `k`, except possibly the run `{0}`. So `J` is one of `∅`, `[a..k]`, `{0}` or
   `{0} ∪ [a..k]` with `a ≥ 2`.
7. When `a_0 ≤ b_0`, the run `{0}` has value `≤ 0` and can be dropped.
8. When `a_0 > b_0`, that is `2k < d + 1`, the threshold `[0..k]` dominates both `{0}` and `{0} ∪ [a..k]`. The difference
   is at least `a_1 − π + Σ_{j=2}^{a−1} (a_j − b_{j−1})`. Here `a_1 − π = C(d,k−1)·((d−k+1) − (k−1)·1_c) > 0`, and each
   `a_j ≥ b_{j−1}` because `a_j / b_{j−1} = (d−k+1)/j ≥ 1` for `j ≤ k − 1`. ∎

*Grade and support.* `proved_informal` STATED by the critic. Its inputs are the structural lemma of candidate key 1 and
elementary supermodularity; no census enters. It is corroborated by the 653-row comparison and by literal flows.

*Naming.* The return's name `E993-R30-CB-D1-J-THRESHOLD-EXTREMAL-DEFICIENT-CUT` fails ruling 33. It says "DEFICIENT-CUT",
but the contract's (CUT) exists only at eligible ranks, and the window of `CB(d,1)` is empty for every `d ≤ 120` (F-5). The
key also asserts nothing about extremality in general, only on the sector of `CB(d,1)`. Proposed name:
`E993-R30-CB-D1-ROOT-ARM-SECTOR-HALL-DEFICIENCY-ATTAINED-BY-SUPPORT-COUNT-THRESHOLD-FAMILY`.

**F-3. The "m = 1 boundary phenomenon" framing of part (b) is contradicted.** I built my own orbit-quotient sector
instrument (`c4_quotient.py`, quotient by `S_d ≀ S_m`, exact deficiency by the supermodular-invariant argument of F-2).
Checked against literal sector flows on 55 rows (`d ≤ 8`, `m ≤ 3`) it agrees **55/55** on supply and deficiency
(`c4_validate.out`, `96cb9c1e…`).

With it, sector deficiencies under (D) ∪ (S) exist at `m = 2` (`c5_scan.py`, `542366ec…`). All are non-eligible, and all
have `S > 0`:

| row | `1_v` | `1_c` | sector deficiency |
|---|---|---|---|
| `CB(5,2)/7` | 1 | 0 (split) | 5376 |
| `CB(8,2)/11` | 1 | 0 (split) | 2342912 |
| `CB(10,2)/14` | 1 | 1 | 34893540 |
| `CB(12,2)/17` | 1 | 1 | deficient |
| `CB(13,2)/18` | 1 | 1 | deficient |
| `CB(14,2)/19` | 1 | 0 | deficient |
| `CB(14,2)/20` | 1 | 1 | deficient |
| `CB(15,2)/21` | 1 | 1 | deficient |
| `CB(16,2)/22` | 1 | 1 | deficient |

So a second choke does not remove sector deficiency. U2's `m = 2` probes (`d ≤ 4`) never reached the range where `m = 2`
sector deficiencies appear (the first is at `d = 5`). `CB(4,1)/4` is not (D) ∪ (S)-deficient at all: mixed 32/32, and only deletion-only fails. At `m = 3` there is none for
`d ≤ 10`. These are all laboratory facts and say nothing about the `CB(8,·)` first ranks.

**F-4. The Cycle 2 record is mischaracterized.**
- Line 373: the return says "the STYLE of check Cycle 2's `computer_assisted` sector-Hall result at `CB(8,86)/460` etc. is
  described as performing".
- Remaining obligation 2 speaks of "the whole-sector aggregate … already … recorded".
- Remaining obligation 4 speaks of "strengthening the existing sector-Hall record to cover sub-families".

Each of these implies that SR-C2-2 is aggregate-only. The capsule's attack brief and allocation record it as holding for
**every** `X ⊆ sec` (Lemma C(ii) with the second-eigenvalue key). The return offers no evidence of an aggregate-only
method. It never examined the record. **Struck.**

A consequence: remaining obligation 2 (threshold sub-families at `CB(8,86/89/92)`) asks about sub-families of the sector,
and the record already covers those. It is moot as stated. The open part at those rows is the coupled families that meet the
sector, a V⁺ source and a positive S/O source (SR-C3-4). The return does not touch them.

**F-5. Eligibility (bounded).**
- The window of `CB(d,1)` is empty for every `d ≤ 120`. Example: `d = 120` has `α = 122`, `x = 81`, window `[83, 81]`.
  Since `α = d + 2` (by König: the matching `(v,s)`, `(r,u_0)`, `(b_j,c_j)` is perfect), the window is empty exactly when
  `x ≥ ⌊(2d+4)/3⌋ − 1`. I have this only as `bounded_computation`, not proved for all `d`.
- `CB(d,2)` and `CB(d,3)` have empty windows for `d ≤ 40`.
- `CB(d,4)` has a single eligible rank for `d = 3..40`. Those rows are in the open band (`n > 2p + 2`). On
  `CB(3..8, 4)` at that rank, sector Hall holds for every `X ⊆ sec` under (D) ∪ (S), with deficiency 0 (`c4_run1.out`,
  `6703b260…`). This is `bounded_computation`, and sector-only: it is not the open coupled part.

**F-6. The indicator split is a periodic family, not one instance.** `(1_v, 1_c) = (1, 0)` occurs exactly at
`(d, k) = (3t + 1, 2t)`, `t = 2..19`, over the `d ≤ 60` scan. `CB(7,1)/5` is the case `t = 2`.

**F-7. The "deeper finding" is not new as a principle.** That a whole-sector inequality does not certify (HALL-COND) is the
contract's own text (SEMANTIC-CONTRACT §1.2; common brief). What the return adds is an explicit lab instance. With F-1 and
F-2 that instance is now useful, but as a mechanism statement it is a restatement.

## Mechanism-equivalence and fence check

- **Refuted mechanisms.** No refuted mechanism is revived. The object is a literal (D) ∪ (S) capacity computation with
  active weight. Deletion-only numbers appear only as comparisons.
- **Status transfer.** No status crosses a fence.
  - All `CB(d,1)` rows, the `CB(d,2)`/`CB(d,3)` rows and F-1 are at non-eligible ranks, so they are neither (HALL) evidence
    nor (CUT).
  - The return grades part (b) `conjecture`-adjacent and never uses it. That is correct, and F-3 now contradicts it anyway.
- **Imported results.** (LIFT) is not used. My quotient instrument does not use (LIFT) either. It uses only the elementary
  converse direction (the invariant maximizer) and is validated against literal flows.
- **No census in a proof.** Neither candidate key 1 nor F-2 uses a census value.
- **Alias.** Candidate key 1 is B9 with the two derived indicators made explicit. The return itself says it "reduces to B9's
  literal pairing exactly when `1_v = 1_c = 1`". I recommend registering it as a **record extension of B9**
  (`R30-CB-RECORD` / C3-B9), not as a new key. If it is registered as a key anyway, the switch term must be the restated
  `(k−1)·C(d,k−1)·1_c` form.
- **Lexical alias check.** The return says the run-local registry contains no key matching `SWITCH`, `CB-`, `ROOT-ARM` or
  `SECTOR`. That is **false** by the gate and the allocation, which list the registered keys
  `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`,
  `E993-R30-FIVE-CB-ROWS-…` and `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-…`. Neither candidate collides mathematically
  with any of them. The return's check was nonetheless wrongly reported, and the synthesis must redo it.

## Certification audit

Struck or corrected against the shipped evidence:

1. "(WID) … confirmed … on every one of the 34 `CB(d,1)` instances". **Struck.** (WID) is asserted only in `run_labs.py`, on
   three labs. `run_b9.py` and `run_sw_lemma.py` never compute `S`. My instrument now backs (WID) on 46 `CB(d,1)` rows and 5
   fixed points.
2. "35 systematically swept `(d,k)` pairs, `d = 2..9`"; "`d` up to 9"; "checked directly for every `d ≤ 9`". **Corrected** to
   `d = 2..8`, 35 pairs; the shipped code never runs `d = 9`. The `S_d`-symmetry check evaluates one representative leaf.
   The symmetry itself follows from the automorphism.
3. "21 `(d,k)` pairs", "9 genuinely deficient cases", "zero mismatches". **Struck.**
   - `run_j0_sweep.py` runs **16** pairs and finds **6** deficient.
   - Its shipped verdict line is `ALL LITERAL DEFICIENCIES MATCH THE j0-SWEEP MAXIMUM: False`, with 10 rows flagged.
   - The true statement is agreement after clamping at 0 on 16/16.
   - `(8,5)` and `(9,6)` have no shipped literal flow. I now back them (406 and 882). The listed set also has 8 pairs, not 9.
4. "15 tested `(d,m,p)` triples with `m ≥ 2`, no deficiency". **Corrected.**
   - The runs print 16 rows. In 5 of them `v` is not favorable and the supply is 0, so only 11 are non-trivial.
   - "every eligible-adjacent `p` from just above `x + 2`" is false: every tested `p` is below `x + 2`, in empty windows.
   - "`CB(4,2)`, `p = 4..8`, i.e. the full `k = 1..4` range" is false: the range is `k = 3..7`.
   - "`p = 6` (`k = 3`), the direct `m = 2` analogue of `CB(4,1)`'s deficient `k = 3` row" is false twice over: `p = 6` means
     `k = 5`, and `CB(4,1)` at `k = 3` is not (D) ∪ (S)-deficient.
5. "B8 confirmed exactly, 30 checks". **Qualified.** The count is right, but 6 of the 30 are vacuous (no switch target
   exists).
6. The candidate key 1 grade, `proved_informal`, "for ALL `d,k`". **Retained, narrowed** to `1_v = 1`, or to the restated
   switch term (see the re-derivation).
7. The implication about the Cycle 2 record (F-4). **Struck.**
8. "`(d,k) ∈ …(2,1)…` … plus the trivial `1_v = 0` cases" as deficient. **Struck.** A row with `1_v = 0` has zero sector
   supply and cannot be deficient.

Confirmed:
- the six replay digests;
- the three lab rows;
- `CB(7,1)/5`: 560 / 280 / 280;
- `CB(7,1)/6`: 672 / 700 aggregate, literal flow 651, deficiency 21, min cut `X'_2` of 546 members with neighbourhood
  capacity 525;
- the source digest;
- the Stage 2 seal.

## Verdict

verdict: retained_narrowed

headline_resolved: no

What survives, and at what grade:

- **Candidate key 1**, `proved_informal`. This is a B9 record extension, not a new key, with the restated switch term.
- **Candidate key 2**, upgraded by the critic's proof (F-2) from `computer_assisted` to `proved_informal` STATED. It needs an
  isolated second read, and it is renamed per ruling 33.
- **The two `CB(7,1)` lab instances**, `bounded_computation`.

What is struck:

- part (b)'s "`m = 1` boundary" framing, which F-3 contradicts;
- every implication that the Cycle 2 sector-Hall record is aggregate-only;
- the eight literals listed in the certification audit;
- the false lexical alias report.

Critic-derived advances:

- F-1, the refutation of the Cycle 3 conjecture at a non-eligible rank. It is shown by two instruments plus an explicit cut
  enumeration, and needs a second read before it is recorded.
- F-2, the proof of candidate key 2.
- F-3, `m = 2` sector deficiencies from a quotient instrument validated against literal flows.
- F-5 and F-6, bounded eligibility and split facts.

None of these is (HALL) evidence or a (CUT), and none touches the primary aggregate.

## Remaining obligation

The return's remaining obligation is not exact. As written:

- its item 2 is moot, because the sector record already covers every `X ⊆ sec`;
- its item 3 is discharged here at `proved_informal` STATED (F-2);
- its item 4 rests on the struck mischaracterization.

The exact remaining obligation for this line of work:

1. Settle (HALL-COND) at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492` for families that meet the sector, a positive-weight
   V source, and a positive-weight S or O source (Cycle 2's (O2) as narrowed by SR-C3-4). The per-choke state vector
   `(j_0, …, j_{m−1})` with the derived indicators, and the run-additivity and threshold argument of F-2, are candidate tools.
   F-3 warns that `m ≥ 2` does not by itself exclude sector-type deficiency.
2. Obtain isolated second reads of F-1 (the conjecture refutation at `CB(7,1)/6`) and F-2 (threshold extremality). Then
   register F-2 under the renamed key, and candidate key 1 as a B9 record extension.
3. Optionally, prove that the window of `CB(d,1)` is empty for every `d`. It is `bounded_computation` for `d ≤ 120` here.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-U2-F/`. Every
script was run with `python3 -B`, in the foreground. No `__pycache__` was left, no background job was started, and none is
running.

| File | SHA-256 | Role |
|---|---|---|
| `crit_lib.py` | `e88773b2…0a3705` (full digest below) | the independent instrument |
| `c1_full.py` → `c1_full_d9.out`, `c1_full_d9.json` | script `603cc9fc…`; out `56a2e71b…`; result `2c005ad8…` | fixed points, labs, `CB(d,1)` `d ≤ 9` full networks |
| `c1_full_d7.out` | `cdd3fa9c…` | earlier `d ≤ 7` run (subset of the above) |
| `c2_cut_cert.py` → `c2_cut_cert.out` | `dc8fb31d…`; out `dcf43aa1…`; result `9983078f…` | F-1: explicit cut, plus the return's library as second instrument |
| `c3_windows.py` → `c3_windows.out`, `c3_windows_D120.json` | `e89479ae…`; out `65eb30ac…`; result `f50df624…` | windows; class-union vs threshold; splits |
| `c4_quotient.py`, `c4_quotient_lib.py` → `c4_validate.out`, `c4_run1.out` | `a2218edf…`, `0ff3f068…`; out `4e3744ab…`, `f1bfb581…` | quotient sector instrument; 55/55 validation; `m = 4` eligible rows |
| `c5_scan.py` → `c5_scan.out` | `dd039383…`; out `9cbf7fa6…`; result `542366ec…` | F-3: `m = 2, 3` scan |
| `c6_conj.py` → `c6_conj.out` | `6449108e…`; out `e272fb76…`; result `861d7faa…` | F-1 scan, `d ≤ 60` |
| `replay/` | the return's ten modules, copied out byte-for-byte, with `out_*.txt` and `err_*.txt` | replay; all six digests reproduced |

Full digest of `crit_lib.py`: `e88773b27374972cdc88bcc198167d98045c9b97d2b262bbbd59a2011e0a3705`.
