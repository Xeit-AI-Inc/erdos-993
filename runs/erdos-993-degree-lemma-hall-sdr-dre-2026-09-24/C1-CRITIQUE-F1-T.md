# Critique

Critic `C-F1-T` (cross-orientation T critic of seat `F1`, route `C1-F-01 DOMINANCE-FALSIFICATION-CENSUS`), r28 Cycle 1 Stage 4.

**Boot acknowledgment.** Operating within VerityOS. Boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the constitution and the startup protocol; the identity subsystem's entry point). I made no other VerityOS read outside the run root.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

**Headline finding (critic-derived, attributed to `C-F1-T`): (HS) is FALSE.** A tree of order 22 violates the threshold form and the matching form. `T22` is the root `0` with three children `b_1, b_2, b_3`, each carrying two pendant paths `b − x − y − ℓ`. At `k = 12` I get `i_12 = 19`, `c_0(12) = 18` and `c_ℓ(12) = 17` for all six leaves. At `t = 18`, `slots_{≥18}(12) = 1` (the root has degree 3) and `leaves_{≥18}(12) = 0`. I derived this by hand, then confirmed it with three instruments. It is one member of an infinite family, proved below. (DL) holds on `T22`, as it must. My exhaustive check of order 21 (2,144,505 classes) finds no failure. Together with the order-≤20 census, this makes 22 the minimum order of a counterexample, on my single instrument at order 21.

## Identity and seal audit

- **Capsule seal.** For `control/c1-critic-capsules/F1-PACKET-MANIFEST.json` I recomputed SHA-256 over the canonical JSON without `seal_sha256` (sort_keys, separators `(",",":")`, no trailing newline). The result is **`58419b49364ce44b9d8ccda14655b2420292df6e4587665f7ae2dd429bc06ba6`**, which matches. All 14 listed members match their SHA-256 and byte counts, including the return: `cycles/cycle-1/stage3/returns/F1/RETURN.md` has digest `ddae1c71…92b21` and 34,310 bytes.
- **Stage 2 seal.** Recomputed as `2eff91efcc2889ffcbbdc7e046adeb69e9a74e162d68a454afe94068e7af710b`; it matches the manifest and the common brief.
- **Stage 3 seal.** Recomputed as `56fa3b76ba633b21aa40e58b554560bd59239322edf35375a3bdc668318b2be5`; it matches. Its F1 `RETURN.md` entry (`ddae1c71…`, 34,310 B) is consistent with the capsule.
- **Stage 4 dispatch seal.** Recomputed as `7ead45432169e189c210cd2f81486dfb9f6fbd9b46af0c1c81eb902e8a76812e`; it matches. Two of its members are not in my capsule (`CLAIM-STATUS-LINT-c1-stage3.json` and `PATH-CHECK-c1-stage4-dispatch.json`). I did not read or hash them.
- **Digests the return lists** (canonical-JSON digests of its reports; I recomputed each from the shipped JSON and by replay):
  - fixed points `04f3bc52…22936`: recomputed from the file and replayed; byte-identical.
  - families `29d0c2fe…21626`: recomputed and replayed. The full 25-configuration run in my copy reproduced it exactly.
  - Prüfer `e6e66d19…fbf216`: recomputed and replayed; exact.
  - master `6144e7c4…ffeba`: recomputed from the shipped JSON and matches. For what it certifies, see `## Certification audit`.
- The return does not list digests for its generator scripts. I record them from my copy under `## Artifact inventory`.
- **Read-boundary.** The seat's Stage 3 disclosures (host restart; own-PID kills 56850/7556/7558) are in the capsule. Nothing I found depends on them. Every census number I re-derived reproduces with the shipped scripts and with my own instrument, so the question of pre- versus post-restart provenance does not affect any retained number. I read only capsule members, the seat's inventoried scratch (copied out first), and `sources/authority/CLAIM-IDENTITY.json` for the alias check. I ran no search above my grant, used no network, and installed nothing.

## Independent re-derivation

**Instrument.** My instrument is `scratchpad/c1-crit-F1-T/crit_inst.py`, standard library only, built from `SEMANTIC-CONTRACT.md`. It does not use F1's code.

- **Tree generation.** Leaf augmentation, deduplicated by a centre-rooted AHU parentheses string (minimum over the two rootings when the tree is bicentral). F1 instead interns integer ids.
- **Counting `c_v(k)`.** For each target `v` I root the tree at `v`. Then `T − N[v]` is the disjoint union of the subtrees at `v`'s grandchildren, so `I(T − N[v]) = Π_g (A_g + B_g)`. The polynomials are packed into big integers (Kronecker substitution). This is not F1's prefix/suffix rerooting.
- **Threshold form.** `slotsAtLeast`/`leavesAtLeast` are evaluated literally at every `t` in a set containing every breakpoint of both step functions.
- **Matching form.** Kuhn augmenting paths on the literal `H_k(T)`. This is a general matcher, not F1's greedy.
- **Range of `k`.** Every `k` from 0 to `α + 1`, so `k = 0`, `k = 1` and `k > α` are all covered.
- **Tree test.** Every tree passes `is_tree`: a union-find acyclicity test, then a separate DFS connectivity test, plus `|E| = n − 1`.

**Validation of my instrument** (`crit_validate.py`):
- Generated counts match A000055 at orders 1–16: 1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741, 19320.
- Against a `2^n` brute force, the DP agrees exactly on all 435 trees of orders 2–11. On the same trees these identities hold: `Σ_v c_v(k) = k·i_k`, `c_v(0) = 0`, `c_v(1) = 1`, and the leaf/support identity `c_ℓ(k) = i_{k−1}(T − ℓ − s)` (checked against brute force on `T − ℓ − s`).
- Spider `S(2,1,1)` at `k = 3`: `c_0 = 0, c_2 = c_3 = 2, c_4 = 1`, and brute force gives `c_1 = 1`. (HS) holds there in both forms.
- Stars `K_{1,m}` for `m = 3..8`: centre `c = 0` for `k ≥ 2`, and each leaf has `c = C(m−1, k−1)`.
- Paths `P_2..P_11`: the `c` values are symmetric.

**Census replication, orders 2–20** (`crit_census.py`; result `census20.json`, canonical digest `0ab364fd27271a5cc8239c7f470226cb7f670dac97e90851f0788240cfbf9170`):

| Order | Classes | Match A000055 | Threshold failures | Kuhn failures | Mismatches | Tight events | Tight at `t = min c_v` |
|---|---|---|---|---|---|---|---|
| 2–18 | as A000055 | yes | 0 | 0 | 0 | 0 | 0 |
| 19 | 317,955 | yes | 0 | 0 | 0 | 3 | 0 |
| 20 | 823,065 | yes | 0 | 0 | 0 | 2 | 0 |
| Total | 1,346,023 | | 0 | 0 | 0 | 5 | 0 |

- The totals cover 18,811,562 `(T, k)` instances, with `k` from 0 to `α + 1`.
- My five tight witnesses are the same five isomorphism classes, with the same `(k, t)`, as F1's `tight_witnesses_19_20.json` (compared by my canonical form).
- **So F1's exhaustive census to order 20 is independently confirmed in both forms.** My general Kuhn matcher now reconciles the matching form to order 20.

**Replay of F1's own generators** (copied out first into `scratchpad/c1-crit-F1-T/f1copy/`):
- `f1_validate.py` passes all checks. Greedy against Hopcroft–Karp agrees on **22,019** `(T, k)` instances to order 13, and the brute-force comparison covers 201 classes to order 10.
- `f1_bigcensus.py 14` matches every row at orders 2–14.
- `f1_fixedpoints.py`, `f1_prufer.py` and `f1_families.py` reproduce their digests exactly. Prüfer: `|Br|` 7–22, `|L|` 13–32, 1,018 Hopcroft–Karp cross-checked instances, 0 mismatches. Families: 25 configurations, 0 failures.

**Large instances.** The brief asks whether `c_v(k)` at `n = 4,800` could have come from enumeration. It could not. F1's `compute_i_and_c` is a polynomial rerooting DP. Its rerooting identity is *tested* (against brute force to order 10, and selective against full computation to order 11), not proved. I spot-checked two instances with my instrument (`crit_large.py`):
- `spider(333,333,334)` (`n = 1001`, all `k`): my full `c` vectors equal F1's.
- `caterpillar(100, 3)` (`n = 400`, all 400 vertices, all `k`): my full `c` vectors equal F1's.
- Both also match closed forms I derived independently at small `k`: `c_v(2) = n − 1 − deg v`, and `c_v(3) = C(m, 2) − |E(T − N[v])|` with `m = n − 1 − deg v`.

**The five tight instances, recomputed** (`crit_tight.py` → `tight_recompute.txt`). Each is a single-slot versus single-leaf tie at the top of the ladder: the branch vertex with the largest `c` has one slot, and exactly one leaf reaches that value. The ties occur at `k = α − 1` or `α − 2`. The tied branch vertex does not always equal the top leaf in value:

| Order, `k` | Tied `(c_v, top leaf)` | Value equality? |
|---|---|---|
| 19a, `k = 9` | `(128, 159)` | no |
| 19b, `k = 9` | `(128, 173)` | no |
| 19c, `k = 10` | `(27, 27)` | yes |
| 20, `k = 10` | `(110, 118)` | no |
| 20, `k = 11` | `(16, 16)` | yes |

- In 19c and both order-20 rows, the tied branch vertex is a **root all of whose neighbours are branch vertices**. The one saving leaf is the leaf on the shortest pendant path, attached at one of those branch neighbours.
- The other five leaves are strictly below the root. For example, at order 20, `k = 11`, those leaves have `15 < 16`.
- Two of these witnesses are the shapes `(1,2),(3,3),(3,3)` and `(1,3),(3,3),(3,3)` in the family below. Replace the short pendant by a third length-3 path and the saving leaf is gone.

**Critic-derived advance 1 — refutation of (HS) (`C-F1-T`).** Let `R(d, m)` be the tree with root `r` and children `b_1..b_d`. Each `b_i` carries `m` pendant paths `b_i − x − y − ℓ`. Then `n = 1 + d(1 + 3m)`.

*Claim.* For `d ≥ 3` and `m ≥ 2`, at `k = α − 1 = 2dm`:
- `i_k = 3dm + 1`;
- `c_r(k) = 3dm`;
- `c_ℓ(k) = 3dm − 1` for every leaf;
- `c_{b_i}(k) = 0`.

Hence at `t = 3dm`: `slots_{≥t}(k) = d − 2 ≥ 1 > 0 = leaves_{≥t}(k)`.

*Proof.*
1. **Arm bound.** Call `b_i` together with its `m` paths an arm. If `b_i` is excluded, the arm's independence number is `2m`, attained uniquely by `{x, ℓ}` on every path. If `b_i` is included, each `x` is excluded and each path adds one of `y, ℓ`, giving `1 + m`. For `m ≥ 2`, `1 + m < 2m`.
2. **α.** A set without `r` has size at most `2dm`. The set `{r} ∪ {all x, ℓ}` is independent and has size `2dm + 1`. So `α = 2dm + 1`.
3. **Size-`2dm` sets without `r`.** By step 1, exactly one: all `x` and all `ℓ`. It contains every leaf and no `b_i`.
4. **Size-`2dm` sets with `r`.** Every `b_i` is excluded. The rest is `dm` disjoint 3-vertex paths `x − y − ℓ`, each contributing at most 2 (uniquely `{x, ℓ}`). So exactly one path contributes a single vertex, which is one of `x, y, ℓ`: `3dm` sets.
5. **Counts.** `i_{2dm} = 3dm + 1` and `c_r = 3dm`. A fixed leaf misses exactly the 2 sets in which its own path contributes `x` or `y`, so `c_ℓ = 3dm − 2 + 1 = 3dm − 1`.
6. **The `b_i`.** A set containing `b_i` excludes `r` and has size at most `(d−1)·2m + 1 + m < 2dm`, so `c_{b_i} = 0`.
7. **Slots.** `r` has degree `d`, so it carries `d − 2` slots. ∎

- Only finiteness and the tree structure are used. `IsTree` enters through the construction, which is checked in code for acyclicity and for connectivity separately.
- The smallest member is `R(3, 2) = T22`.
- The claim is mechanically confirmed for `d = 3..5` and `m = 2..4` (`family_R.txt`). For `m = 1`, `R(d, 1)` is a spider with no failure, as the proof requires.
- The failure is not confined to one `k`: `R(3,4)` fails at every `k = 12..24`.

**Three-instrument confirmation on `T22`:**

| Instrument | Method | Result on `T22` |
|---|---|---|
| 1. My Kronecker DP | as above | fails at `k = 11` and `k = 12` |
| 2. `crit_cx_brute.py` | backtracking enumeration of all 54,929 independent sets; no DP, no polynomials; own tree builder; literal `slots`/`leaves` at every `t = 1..max c` | reproduced |
| 3. F1's own `compute_i_and_c` (copied out first) | F1's rerooting DP | `c_0(11) = 141` versus leaves `136`; F1's `greedy_nested_matching` returns `(False, 3)` |

Exact values from instrument 2:
- `i = [1, 22, 210, 1144, 3933, 8907, 13470, 13529, 8856, 3691, 975, 171, 19, 1]`.
- At `k = 11`: `c_0 = 141`, `c_b = 4`, `c_ℓ = 136`. Violated for `t ∈ [137, 141]`, where slots, leaves = `1, 0`.
- At `k = 12`: `c_0 = 18`, `c_b = 0`, `c_ℓ = 17`. Violated at `t = 18`.
- `Σ_v c_v(k) = k·i_k` holds for every `k`.
- (DL) holds at the failing `k`: at `k = 11`, `D_11 = 3099 ≤ 3762`; at `k = 12`, `D_12 = 372 ≤ 456`. Equivalently, `Σ_Br (deg − 2)c = 153 ≤ 816` and `18 ≤ 102`. So the failure is in the strengthening (HS), not in (DL), and the r27 formal (DL) is untouched.

**Minimal order.** F1's census and mine both show no failure through order 20. `crit_order21.py` checks every free tree of order 21 exhaustively. It finds **2,144,505 classes** (A000055(21) = 2,144,505) and 32,100,522 `(T, k)` instances, with **0 threshold-form failures** and 24 tight events. The Kuhn matching form was run on a deterministic 1-in-50 sample of trees, 642,036 instances, with 0 mismatches. Canonical result digest: `5decec9c3972406bc3f6896a602e31e8199ba8a1a2c2056076d0a41b6704edec`. **The minimum counterexample order is therefore 22.** Orders ≤ 20 rest on two instruments (F1's and mine); order 21 rests on my instrument alone. Among root-with-arms shapes up to order 23 (`crit_family2.py`: 149,419 shapes; each arm is a bare path, or a vertex carrying at least 2 pendant paths of lengths 1–4), the only failures are `T22` at order 22 and two shapes at order 23. They are `(3,3),(3,3),(2,2,3)` and `(3,3),(3,3),(3,4)`, both failing at `k = 12`.

**Critic lemma (rank form; used above for the margin statistic).** Fix `(T, k)`. Let `s_1 ≥ s_2 ≥ …` be the slot values (each branch `c_v` repeated `deg v − 2` times) and `l_1 ≥ l_2 ≥ …` the leaf values. Then (HS) at `(T, k)` holds if and only if `s_j ≤ l_j` for every `j ≤ |L| − 2`.
- (⇒) At `t = s_j` there are at least `j` slots with value `≥ t`, so at least `j` leaves have `c ≥ s_j`, so `l_j ≥ s_j`.
- (⇐) Given `t`, let `j = slots_{≥t}`. Then `s_j ≥ t`, so `l_j ≥ t`, so `leaves_{≥t} ≥ j`. ∎

F1's greedy matcher computes exactly this test. `T22` fails it at `j = 1`: `18 > 17`.

## Attacks and findings

1. **(Decisive; critic-derived.) (HS) is refuted at order 22 by `T22 = R(3,2)`, and by the infinite family `R(d, m)` with `d ≥ 3, m ≥ 2`.**
   - F1's route verdict `bounded_evidence` for (HS), and its sentence "strengthening the evidential case for (HS)", are superseded. The census facts themselves (no failure to order 20) stand, and I reproduced them.
   - F1's `## Remaining obligation` item 4 pointed at exactly this shape: "a branch vertex two 'levels' removed from a leaf via one intermediate branch vertex". F1 did not run it. That pointer is credited to F1; the counterexample is credited to `C-F1-T`.
   - Under `SOLUTION-CONTRACT.md` §5(b) this is a candidate decisive event. It is confirmed here by three instruments plus a hand proof, and it still needs the isolated second read the contract requires.
2. **Adversarial-family coverage gap.**
   - F1's 25 families all pass, and the digest replays exactly. But none of them is a two-level spider with pendant 3-vertex paths. The "branch-heavy comb" and complete `d`-ary families put leaves adjacent to branch vertices, never at the end of odd paths that force a unique maximum independent set.
   - The mechanism of `R(d, m)` is that the unique `α`-set contains the root and every leaf. At `k = α − 1`, the root gains the `3dm` "swap" sets, while each leaf loses 2 of them and gets back only the single root-free set.
   - F1's observation that "extremal-looking trees are not where (HS) comes closest to failing" is true only of the families F1 tested.
3. **Hall-reduction argument (derivation step 5) is incorrect as written; the conclusion is right.**
   - F1 writes that replacing `S` by "the threshold-closure of its largest member's `c`-value only shrinks `S`'s neighbourhood while not increasing `|S|`".
   - With nested neighbourhoods, `N(S)` is the neighbourhood of the member of `S` with the *smallest* `c`. The correct replacement is `S' = {slots : c ≥ min_S c}`. Then `S ⊆ S'` and `N(S') = N(S)`: `|S|` grows and the neighbourhood stays the same.
   - The equivalence (HS) ⟺ (HS-SDR) is U2's target in any case; the rank lemma above is an independent proof. After the refutation, both forms fail together on `T22`.
4. **The "tight at `t = min c_v`" statistic is scoped narrower than stated.** Both F1's code and mine count it only at `k` where every branch vertex has `c ≥ 1`. At `k` where some branch `c_v = 0`, the minimum is 0, which is not a legal `t`. The number 0 through order 20 is right under that definition (my census agrees). The prose "never at `t = min c_v`" should carry the qualifier.
5. **Layer-cake remark (lines 72–76) is correct.**
   - `2k·i_k − D_k = Σ_{t≥1}(leaves_{≥t} − slots_{≥t})`, a finite sum starting at `t = 1`, for `n ≥ 2`.
   - A zero term does not make the sum zero. (DL) tightness would need every term to be zero, and `E993-R27-FOREST-DEGREE-LEMMA-EQUALITY-CLASSIFICATION` rules that out for `k ≥ 1` with `i_k > 0`.
   - `T22` adds a sharper point: individual terms can be **negative** (at `k = 12`, `t = 18` the term is `−1`) while the sum stays positive (`84` at `k = 12`). So (DL) is strictly weaker than (HS) on actual trees, not merely in logical form.
6. **Quantifier edge cases, checked in my census.** `k = 0` (every `c = 0`); `k = 1` (every `c = 1`, slack `2`); `k = α + 1` (every `c = 0`); paths (`Br = ∅`); stars. None of these fails, and none is tight.
7. **Process disclosures.** Every retained number is reproduced by my own post-dispatch execution, so pre- versus post-restart provenance does not matter for the record. The seat's PID kills are its own disclosed facts and none of my evidence depends on them. Note that the shipped `f1_census.py` (mtime 20:00) is newer than the checkpoint `ckpt.pkl` (19:34), so orders 18–20 were produced by an earlier revision of the file. My independent census makes this moot for the numbers, but the shipped script is not byte-for-byte the one that produced the order 18–20 rows.

## Mechanism-equivalence and fence check

- **No no-recovery wording.** Nothing transfers to `E993-R25-UNR-FOREST-WIDE`, NR1/FOREST/TREE/TRANSFER, the aggregate, `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` or Erdős #993. The Codex target is untouched.
- **(DL) is not re-proved and not affected.** It holds on `T22` at every `k`, consistent with `E993-R27-FOREST-DEGREE-LEMMA`. The refutation is of the strictly stronger (HS), which was OPEN.
- **(PW) is not used as a premise.** On `T22` every leaf has the same `c`, so on this tree (HS) coincides with (PW) at the failing `(k, t)`. The refutation does not rely on (PW); it evaluates the threshold form literally.
- **No formal grade on a census.**
  - F1's census stays `bounded_computation`: horizon order 20, independently replicated.
  - The refutation is a finite exact computation plus a hand proof for the family. Its grade is set in `## Verdict`.
- **Attribution.**
  - The mechanism (HS) and the (PW) refutation: r27 `C-T2-U`.
  - The census to order 20 and the tight-shape pointer: F1.
  - The counterexample `T22`, the family `R(d, m)`, its proof and the rank lemma: `C-F1-T`.
- **Alias check** (`sources/authority/CLAIM-IDENTITY.json`, 392 entries; lower-cased substring search in each entry's JSON):
  - `dominance` (7 hits): Catalan and cover dominance, and PHI-STAR. All different objects.
  - `slot` (3): `E993-AMBIENT-TARGET-DEG2`, `E993-R25-COVER-DIAGONAL-D7-SIGN`, and the r27 reformulation, which is an input.
  - `sdr` (2): the r25 pendant cap and the r27 reformulation.
  - `spider` (6): spider closed forms/domination, `E993-R23-TAG-CLOSED-CUT-HALL` (a Hall statement about tag-closed cuts, a different object) and the r25 two-branch exactness.
  - `r28`: 0 hits.
  - No registered key states (HS). Candidate keys are `E993-R28-DOMINANCE-REFUTATION` (named conditionally in `SOLUTION-CONTRACT.md` §1) for `T22`, and a separate structural key for the family `R(d, m)` if the second read keeps them apart. Neither collides lexically or mathematically.

## Certification audit

Backed (replayed or independently re-derived): the Stage 2 seal; A000055 counts at orders 1–20; per-order classes; 0 threshold and 0 matching failures to order 20; 5 tight instances at orders 19–20 (3 + 2); 0 tight at `min c_v` under the scoped definition; total 1,346,023; the 22,019 greedy/Hopcroft–Karp instances; the 201-class brute-force comparison; the fixed-point, families and Prüfer digests; the (PW) witness values; the 25 families with 0 failures and 0 tight; the Prüfer `|Br|`/`|L|` ranges.

Struck or narrowed:

| Return location | Literal | Action | Reason |
|---|---|---|---|
| Line 168 | "Hopcroft-Karp alone was run to order 17 as an additional, slower cross-check" | **Struck** | No shipped artifact. `f1_validate.py` stops at order 13, `f1_bigcensus.py` uses only the greedy matcher, and no log or report records an order-17 Hopcroft–Karp run. |
| Lines 222–223, 242–243 | "recomputes the per-order summary … directly from the checkpoint's tree lists, not from cached counters"; "recomputes — not merely re-reads — every number below" | **Struck** | `f1_extract_census_summary.py` writes `state["results"]` (the run-time counters) verbatim into `census_results_summary.json`. Only the tight witnesses are recomputed from the tree lists. |
| Lines 369–371 | Master digest "deterministic end to end" | **Narrowed** | The master object embeds `census_results_summary.json`, which contains wall-clock fields (`gen_seconds`, `check_seconds`). The digest `6144e7c4…` reproduces only when re-assembled from the same checkpoint's counters. A fresh census cannot reproduce it. |
| Brief; lines 145–171 | "two independent instruments … reconciled" for the matching form at orders 14–20; "three independent components" | **Narrowed** | At orders 11–20 all `c` values come from one DP. At orders 14–20 the matching form is the greedy rank test, which is logically the threshold test (rank lemma) applied to the same `c` values. Hopcroft–Karp independence reaches order 13 plus the Prüfer sample. My Kuhn matcher on my own DP now supplies the independent reconciliation to order 20 (critic evidence). |
| Lines 351, 358 | "order ~60" versus "to order ~80" | Clarified | 25 trees at `n = 60` and 4 at `n ∈ {40, 50, 70, 80}`. Consistent, but the heading undersells the range. |
| Lines 383–389, 424–425 | Grade text "zero counterexamples … strengthening the evidential case for (HS)" | **Superseded** | Accurate as a horizon statement (none to order 20). As evidence for (HS) it is overturned by `T22`. |

## Verdict

verdict: retained_narrowed
headline_resolved: no

- **What is retained.** The census, replicated by my independent instrument in both forms: exhaustive to order 20, 1,346,023 classes, 0 failures, 5 top-of-ladder single-slot ties at orders 19–20. Also the families and Prüfer runs (digests reproduced) and the layer-cake remark. `E993-R28-DOMINANCE-CENSUS` stays `bounded_computation` at horizon 20, narrowed per `## Certification audit`.
- **What is withdrawn.** The route's evidential reading ("strengthens the case for (HS)").
- **The critic-derived finding.** (HS) is false (`T22`, order 22, `k = 12`, `t = 18`; family `R(d, m)`, `d ≥ 3`, `m ≥ 2`). It is confirmed by a hand proof and three computational instruments (my DP, brute-force enumeration, F1's DP). I grade the finite refutation of `T22` as an exact computation that I consider complete. The family statement I grade `proved_informal`. Both require the isolated second read of `SOLUTION-CONTRACT.md` §5(b) before registration; `REFUTED` is for the second reader and the controller to record.

## Remaining obligation

1. **Isolated second read of `T22`** (edges below) at `k = 12`, `t = 18`: `c_0 = 18`, all six leaves `17`, `i_12 = 19`. Also the proof of `R(d, m)`. The edges are
   `0–1, 1–2, 2–3, 3–4, 1–5, 5–6, 6–7, 0–8, 8–9, 9–10, 10–11, 8–12, 12–13, 13–14, 0–15, 15–16, 16–17, 17–18, 15–19, 19–20, 20–21`.
   If confirmed, stop gate §5(b) fires: register `E993-R28-DOMINANCE-REFUTATION` and record the weakest surviving matching-type strengthening of (DL).
2. **Minimal order.** No failure through order 20 (two instruments). Order 21: no failure among 2,144,505 classes on my instrument. This needs a second instrument (for example F1's `f1_bigcensus.py` extended to 21, about 20 minutes) before 22 is registered as the minimum order. Whether `T22` is the unique counterexample at order 22 is open; the smallest untested case is exhaustive order 22 (5,623,756 classes).
3. **Weakest surviving strengthening** (not attempted here). Candidates to test on `R(d, m)`:
   - (HS) restricted to `k ≤ α − c` for a fixed `c`: this fails, since `R(3,4)` fails at `k = 12..24` with `α = 25`;
   - (HS) with slots counted only at non-root, "extremal" branch vertices;
   - an SDR into leaves together with degree-2 vertices;
   - the fractional form, which is (DL) itself and survives, formally verified by r27.
4. **Route re-scoping.** Every T route's (HS) proof is now necessarily wrong at some step. The adjudicators should locate that step on `T22`. The U routes' (LC), (FC) and Hall equivalence are unaffected as lemmas; (LC) becomes a lemma whose hypothesis is false on `T22`.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/scratchpad/c1-crit-F1-T/` (file SHA-256):

| File | SHA-256 |
|---|---|
| `crit_inst.py` | `a74ee658829f407612a586079d5d68b41213a8845727fef663c7300dd4039d22` |
| `crit_validate.py` | `aa091b68e05e82fca6abeb429011b1f1a770e3967aaf7eb873502ce23c401bcb` |
| `crit_census.py` | `7d314f33f87a77f12cefb10014bd7e49cd05ac188a902a894172fdfbd22dea1a` |
| `census20.json` | canonical digest printed by the run: `0ab364fd27271a5cc8239c7f470226cb7f670dac97e90851f0788240cfbf9170`; log `census20.log` |
| `crit_order21.py` | `7a2d67a717c4567ab34dfe3f12e9fea41dec40c3d469b603256c3cda24a7455f` |
| `order21_result.json` | canonical digest printed by the run: `5decec9c3972406bc3f6896a602e31e8199ba8a1a2c2056076d0a41b6704edec`; log `order21.log` |
| `crit_cx_brute.py` | `f4190d0fb0ded3924f471377e1794eb4f6970522aff6230d89edbc81c6d86856` |
| `cx_T22_brute.txt` | `f50eb21479dff078d5d3838b24aabb39f95f303420dc857521beba8cc9c96235` |
| `crit_family_R.py` | `943d4e034398ce30a7f7b37e43cafefdc8ecdd2efe85049ae631b12add0c85c7` |
| `family_R.txt` | `270a8f9ed36fc804ef71d635327219f9936cb162b2822f5eba8f12690de95276` |
| `crit_family.py` | `a9a8b580e9bcddf8ef321807c391db681400c51ede08bd1e83c1b95173bf1020` |
| `family_d3m2.txt` | `0e4ec9cad87004e952b107fef4f84712a5e07d1638cb9d8710c43e5d81cd08d8` |
| `crit_family2.py` | `11eba04dbea27f376c60140c561ed3e3f44f95bd8e58ca12e0b96f3d9dd477d9` |
| `crit_tight.py` | `989545e15feca5baec1f7dd1d5c0c0a2e46ad19fc72057d03b151968de581916` |
| `tight_recompute.txt` | `27e3fa32344422882544d007344baad0191bb83ce8f06c5762dc1e9643b3c57f` |
| `crit_large.py` | `d4d4dbeaeed597008235545694d854c55ed145cd0ad2ce919037e58c2e1108d3` |

- `f1copy/` holds F1's scripts and reports, copied out first. The replay outputs overwrote only the copies. The F1 scripts' SHA-256 values: `f1_census.py 4260c951…bdb04`, `f1_bigcensus.py 39447526…72e35`, `f1_extract_census_summary.py 54af6a47…d3863`, `f1_families.py 25835d02…c36cc8`, `f1_fixedpoints.py fbfb1a9a…9f3`, `f1_master_report.py d52b409a…783`, `f1_prufer.py 5d6e5167…d36ed552`, `f1_validate.py 91f990ca…4d6e`. The copied checkpoint pickle is excluded.
- `ckpt_crit14.pkl`: F1's census replayed to order 14.
- Background jobs, killed or confirmed exited by literal PID before this write: 17740 (`census20`, exited), 22749 (families replay, exited), 21171 (`order21`), exited after printing its result.
