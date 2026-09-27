# Critique

Critic `C-F1-T` (orientation T, prove) of route `C6-F-01 WHOLE-NETWORK-MIXED-FAMILY-CUT-SEARCH` (seat F1, orientation F), Cycle 6 of r30.
Dispatch `control/dispatch/c6-stage4/DISPATCH-C-F1-T.md`, SHA-256 `29bf39b7035691110ffa2611fe2a086451bbe12e92e76e678a646853844b658f`, checked with
`shasum -a 256` before I followed it.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem. The host put the project `CLAUDE.md`
and the user's auto-memory index into context. I acted on neither beyond this acknowledgment. I kept no conversation log, because the
dispatch confines my writes to this file and my scratch directory.

## Identity and seal audit

- **Capsule seal** (`control/c6-critic-capsules/F1-PACKET-MANIFEST.json`): recomputed as SHA-256 over compact, key-sorted JSON without `seal_sha256` and with
  no trailing newline. Result: `1fab8090e38aa38593c68ebea2868eb08b78535e43e515a9f31556196a2efa14`, which matches. All 14 members match their recorded SHA-256 and byte counts.
- **Stage 4 dispatch seal**: recomputed `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50`, equal to its own `seal_sha256`. **Stage 3 seal**:
  recomputed `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd`, which matches. **Stage 2 seal**: recomputed
  `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`, which matches both the protocol and the dispatch.
- **Digests the return lists.** `RETURN.md` itself hashes to `9c0b4c89…af96`, the capsule value. Three sealed sources were checked live against
  `control/SOURCE-DIGESTS.json`, and all three match: `cb-switch-cut/run.py` (`94ced046…`), `cb-switch-cut/RESULTS.json` (`873cf922…`) and
  `inputs/ordinary_tree_checked.py` (`a012bb78…`). All six scratch artifacts under `scratchpad/c6-F1/` match the return's inventory:
  `copied_adj_quot.py` e36e50dc…, `copied_adj_shape.py` b04130d0…, `tree_check.py` b874c8ad…, `gf_lib.py` 640f8201…, `f1_main.py`
  0510341d… and `f1_main_output.json` b15d3069…. The Cycle 5 originals under `scratchpad/c5-adj-U/own/` are outside my grant, so I did not read them.
  The return's claim that its copy is byte-identical to them therefore rests on the return alone.
- **Replay (copy-out-first).** I copied the six files to `scratchpad/c6-crit-F1-T/replay/` and ran `python3 -B f1_main.py` there (6.9 s).
  It reproduced `RESULT_SHA256 e2c9e99f…55bb`, and the output file hash `b15d3069…0f42` is identical to the shipped one.
- **Claim identity.** Keys touched:
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN, untouched.
  - (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: used as a fidelity assertion only.
  - `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`: cited.
  - `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`: cited as the completeness reduction.
  - `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`: its converse is cited.
  - The `R30-CB-RECORD` bucket is a record, not a key.

  The return proposes no key, so no alias check is owed. The one name I float below is a proposal only (see Mechanism check).
- **Process.** The return discloses two non-recursive `ls` calls of the bare `scratchpad/`. These listed the names of sibling Cycle 6 directories, and no contents were opened.
  The disclosure is consistent with the Stage 3 record. The return reports no background jobs. Its model disclosure is two-part:
  chartered sonnet/xhigh, runtime `claude-sonnet-5`.
- **Gate-31 lines.** Present: "Central obligation attempted: yes … NOT completed at the two named rows".

## Independent re-derivation

I built my own instruments from SEMANTIC-CONTRACT §1.2. All code is standard library with exact integers and runs under `python3 -B`, in `scratchpad/c6-crit-F1-T/own/`.

1. **`lit.py`: a generic literal instrument.**
   - Trees are tested for acyclicity and connectivity.
   - Independent sets are enumerated by brute force.
   - `F_p` is derived from `Δ_p(T − v) < 0` on the original tree, using my own rooted DP.
   - The active weight `w_F` is computed literally, and the relation (D) ∪ (S) is enumerated literally.
   - Max-flow is my own Dinic implementation; max deficiency = supply − max-flow.
   - (WID) is asserted as `supply − capacity = S`, where `S` comes from `q_v = i(H_v) − i(R_v)` DPs.

   **Fixed points reproduced exactly:**

   | Instance | n | α | x | \|F\| | supply / capacity / flow | S | arcs |
   |---|---|---|---|---|---|---|---|
   | `K_{1,12}/8` | 13 | 12 | 6 | 12 | 1980 / 3960 / 1980 | −1980 | — |
   | path-star `(2,3,4)/7` | 15 | 11 | 5 | 10 | 1483 / 2701 / 1483 | −1218 | 2025 |
   | path-star `(2,2,4,3)/8` | 18 | 13 | 6 | 12 | 8033 / 13467 / 8033 | −5434 | 11691 |

2. **`cbgf.py` and `cb_rows.py`: a closed-form `CB(d,m)` instrument (my derivation, split on whether the root is in the set).** Let `N = (1+2x)^d` and `PC = N + x(1+x)^d`. Then

   `I(T) = x(1+x)(1+2x)^{dm} + (1+2x)·PC^m`.

   I derived `I(T−v)`, `I(T−c)`, `H_v`, `R_v`, `H_c` and `R_c` the same way, and asserted each one equal to the literal DP on the 1618-, 2131- and 1567-vertex trees.
   For favorability of private leaves I used two things. First, `Aut(CB(d,m))` acts transitively on private leaves. Second, three representative private
   leaves at different chokes give identical DPs.

   **Side A of (WID):** the literal-DP `q`'s times the derived multiplicities. **Side B:** the `y`-derivative of the bivariate GF, which marks active tags as follows:
   - `r` in the set: `x(1+y₁x)(1+2x)^{dm}`
   - `r` out of the set: `(1+2x)[N + x(1+y₂x)^d]^m`

   The two sides agree at every row. The two sides are genuinely different computations, so this is not ruling 17's regrouping.

   | Row | n | α | x | eligible | \|F\| | S | Δ_x | SW / sector deficit |
   |---|---|---|---|---|---|---|---|---|
   | `CB(9,112)/673` | 2131 | 1121 | 671 | yes, window `[673, 747]` | 1009 (all leaves) | < 0, 481 digits | < 0, **477 digits** | **4401.466603449…** |
   | `CB(8,95)/508` | 1618 | 856 | 506 | yes, window `[508, 570]` | 761 (all leaves) | < 0, 363 digits | < 0, **361 digits** | **7476.316339193…** |
   | `CB(8,92)/492` (fixed point) | 1567 | 829 | 490 | yes | 737 | < 0 | — | — |

   - `x` is scanned through rank `α`.
   - Exact sector deficit: `C(D,K−1)·2^{K−1}·(2D−3K+2)/K` with `D = dm`, `K = p−1`. Here `2D−3K+2 = 1` at `CB(8,95)/508` and `= 2` at `CB(9,112)/673`.
   - The asymptotic `(dm)²(2/3)^d / (3(2D−3K+2))` gives 7512.35 and 4405.03. So the Cycle 5 form `(dm)²(2/3)^d/(3(1+j))`, with `1+j := 2D−3K+2`,
     is consistent with the exact ratios to within 0.5%. **Both ratios are whole-sector statements only**: they compare the switch image of the entire sector with its deletion deficit.
     They bound no subfamily and no mixed family.
   - F1's regime-3 total supply over SW reproduces: 51.1412 and 107.9330.
   - Laboratory values reproduce: `S = −111,739,804` at `CB(11,2)/16`, `+2,424,264` at `CB(9,2)/13`, `+80,747,320` at `CB(10,2)/14`
     and `+2,900,105,120` at `CB(12,2)/17`.
   - Side check: the rank-673 certificate of record (`ρ₁ = 361507351101341/362046708578535`) is **not** on `CB(9,112)`. My `ρ₁` formula reproduces the
     worker-brief value at `CB(8,92)/492` but gives `8341369055250737/8366249951314132` at `CB(9,112)/673`. F1's first target is therefore an uncertified site, as the allocation says.

3. **Literal check of F1's §10 table.** My literal max-flow gives `maxdef` = 9, 236, 0, 1712 and 7734 at `CB(3,1)/3`, `CB(3,2)/5`,
   `CB(4,1)/4`, `CB(4,2)/6` and `CB(3,3)/7`. This matches F1, and it is an instrument independent of the orbit quotient.

4. **Fidelity verdict on the return.**
   - The weight counts active tags only. `copied_adj_quot.weight` checks `(adj[sup[v]] − {v}) ∩ B`.
   - The relation is exactly (D) ∪ (S). The switch condition is `|N(u) ∩ B| = 2`.
   - `F` is fixed at rank `p` from `T − v`, and `x` is computed through `α`.
   - `supply − capacity = S` is asserted from two independent sides at both target rows.
   - One latent hazard: `f1_main.py`'s side 1 omits the `one_v` and `one_c` factors. This is harmless here because both equal 1 at both rows.

   **Fidelity: pass.**

## Attacks and findings

**A1. The §9 "proven combinatorial obstruction" is a limit of one method, not of the obligation (brief (i) and (iii)).**
I counted size-filtered orbit types exactly with my own multiset DP (`orbit_counts.py`).
- At `CB(9,112)/673` there are `2.130 × 10^47` source orbit types, against F1's raw space of `7.90 × 10^48`.
- At `CB(8,95)/508` there are `1.880 × 10^39`, against `5.79 × 10^40`.

Filtering by size removes only about 1.5 orders of magnitude, so literal orbit enumeration remains infeasible and that conclusion stands. But the obligation asked for families seeded by the
`CB(11,2)/16` shape, with `N(X)` computed literally by generating functions. F1 had built a GF instrument and used it only for totals. As A3 shows, the seeded family and a structured class containing it
can be evaluated exactly at both rows in seconds. "Blocked" is therefore not the right verdict. The right reading is: not completed, and the orbit-enumeration method is infeasible.

**A2. The §8 description of the `CB(11,2)/16` maximizer is wrong.** The return says "the 268 sector orbits are NOT the whole sector level … the
min-cut selects a specific subset", and that no simple predicate separates included from excluded orbits. My DP finds exactly **268** sector source-orbit types at
`CB(11,2)` for independent 17-sets. A replay of the copied instrument (`maximizer_arms.py`) confirms that `X_min` contains every one of them.

At all four `m = 2` laboratories, `X_min` is **exactly the set of positive-weight sources that avoid `s`**: the whole sector, all positive arm-`{v}`
sources and all positive arm-`∅` sources. Every positive arm-`{s}` source is excluded. The splits are:

| Laboratory | Sector | Arm-`{v}` | Arm-`∅` | Arm-`{s}` excluded |
|---|---|---|---|---|
| `CB(11,2)/16` | 268 | 73 | 67 | 73 |
| `CB(10,2)/14` | 204 | 65 | 60 | 65 |
| `CB(12,2)/17` | 339 | 86 | 81 | 86 |
| `CB(9,2)/13` | 161 | 53 | 49 | 53 |

F1's 73/67 split is correct, but no shipped F1 script computes it.

**A3. Critic-derived results.** Statements 1–3 are proved on the face and are STATED; each needs an isolated second read. Statement 4 is `bounded_computation`.
Throughout, `CB(d,m)` has root `r`, arm support `s`, arm leaf `v`, chokes `u_i ~ r`, supports `b_ij ~ u_i` and private leaves `c_ij ~ b_ij`. Since `W_v = {r}` and `W_{c_ij} = {u_i}`,
`w_F(B) = [v∈F][r,v∈B] + Σ_{u_i∈B} #{j : c_ij ∈ F ∩ B}`.

- **Move enumeration.** This is every arc of (D) ∪ (S) sorted by arm state. Here `t` is the number of chokes with `u_i` in the set, and "config" means the choke part of a set with `r ∉ B`.
  - From a sector source (`r, v ∈ B`):
    - Deleting a column vertex gives a sector target.
    - Deleting `r` or `v` gives weight 0.
    - Switching in `s` gives weight 0.
    - Switching in `u_i` when choke `i` has exactly one `b` gives an arm-`{v}` target with `t = 1`, where `u_i` carries the `l ≤ d−1` `c`'s of choke `i`. This is the switch image SI.
    - No other switch exists.
  - From a source with `r ∉ B`:
    - Deleting `s` or `v` gives an arm-`∅` target with the same config.
    - Deleting `u_i` goes to class `t−1`, and the freed choke has no `b`.
    - Deleting any other vertex stays in class `t`.
    - Switching in `u_j` at an N-choke with exactly two `b`'s goes to class `t+1`.
    - Switching in `b_ij` at a U-choke containing `c_ij` goes to class `t−1`, and the freed choke has exactly one `b`.
    - Switching in `r` needs exactly two of `{s, u_i}` in the set. This gives a sector target only from arm `{v}` with `t = 2`; every other case has weight 0.
- **Lemma 1 (s-isolation; any `F`).** A positive-weight target containing `s` is joined only to sources containing `s`.
  *Proof.* (D) cannot create `s`. (S) with `u = s` needs `{r, v} ⊆ B`, and then `A = B ∖ {r, v} ∪ {s}` contains neither `r` nor `v` and no `u_i`, because `r ∈ B` excludes every `u_i`. So `w_F(A) = 0`. ∎
- **Lemma 2 (v-strip; any `F`).** If every member of `X` contains `v`, that is, `X` lies in the sector together with arm-`{v}` sources, then `def(X) ≤ def(X ∩ sector)`.
  *Proof.* Arm-`∅` targets are reached from `X` only by the injection `B ↦ B ∖ {v}` on arm-`{v}` members. This map preserves `w_F`: `v` is inactive when `r ∉ B`, and `v` lies in no `W_c`.
  Its image is disjoint from `N(X ∩ sector)`, which contains no arm-`∅` target. Hence `w(N(X)) ≥ w(N(X ∩ sector)) + w(X ∖ sector)`. ∎

  So any deficient family that is not already sector-deficient must contain positive sources with neither `r` nor `v`. The lab maximizers do: arm `∅`.
- **Identity 3 (the s-free family).** Assume every leaf is favorable and `p ≤ dm`. Let `X* := {B ∈ I_{p+1} : w_F(B) > 0, s ∉ B}` and `W_C(x) := m d x²(1+x)^{d−1} PC^{m−1}`, the weighted
  config GF. Then

  `def(X*) = S(T,p) + W_C[p−1] − W_C[p] = (sector deletion deficit) + W_C[p+1] − W_C[p−1]`.

  *Proof.* By Lemma 1, the positive arm-`{s}` targets, of total weight `W_C[p−1]`, are outside `N(X*)`. Every other positive target is in `N(X*)`:
  - sector targets, by adding a column vertex;
  - arm-`{v}` targets, by adding an addable vertex, which exists because the config size is below `dm`;
  - arm-`∅` targets, by adding `v`.

  The excluded sources have total weight `W_C[p]`. ∎

  The formula reproduces the four laboratory max-deficiencies **exactly**: 22,458,436 / 86,940,920 / 3,573,432,896 / 4,204,932.
  At the eligible rows it is **negative**:

  | Row | `def(X*)` at the first eligible rank |
  |---|---|
  | `CB(8,95)/508` | `−0.72027·|S|` |
  | `CB(9,112)/673` | `−0.71888·|S|` |
  | `CB(8,92)/492` | `−0.72129·|S|` |

  Across the whole eligible windows (63 and 75 ranks), `def(X*)/|S| ≤ −0.627`. All leaves are favorable and `S < 0` at every rank. The lab-maximizer shape is therefore **not** a cut at either site.
- **4. Structured class, evaluated exactly (`famclass.py`).** The class is `X(σ, arms, [t₀,t₁])`: the whole sector (included or not), together with the positive sources
  having `r ∉ B`, arm state in any of the 7 nonempty subsets of `{∅, {s}, {v}}`, and U-choke count in `[t₀, t₁]`. `N(X)` is computed literally through per-choke GFs from the move enumeration.
  - **Validation:** 696 family evaluations against brute-force literal `N(X)` on 11 literal rows (`d ≤ 6`, `m ≤ 4`), with **0 mismatches**. At all four `m = 2` labs, the best class member equals the
    orbit max-flow `maxdef`, so the class contains every lab maximizer.
  - **Result:** **0 deficient families out of 63,841** at `CB(8,95)/508`, **0 of 88,593** at `CB(9,112)/673` and 0 of 59,893 at `CB(8,92)/492`.
    The same holds at ranks 509, 510 and 570 of `CB(8,95)`, and at ranks 674, 675 and 747 of `CB(9,112)`.
  - **Tightest Hall ratio `w(X)/w(N(X))` in the class:** 0.98823 at `CB(8,95)/508` and 0.99085 at `CB(9,112)/673`. In both cases the tightest member is the whole positive layer.
    The best sector-including family has `def/w(X)` of −1.29% and −1.00%.

  This is a bounded negative result for a structured class, not a proof of (HALL) at these rows. Families that select individual per-choke states inside an (arm, `t`) class are not covered.

**A4. §10 carries no information about mixed families.** At all ten §10 rows, `maxdef = max(0, S(T, x))`. I checked this with a closed-form `S` at every row and a literal max-flow at five of them.
These rows are at `p = x`, which is not eligible, and the aggregate there is positive at eight of them. At `CB(3,3)/7` the maximizer is the whole positive layer: 44 + 172 orbits, which is every positive orbit.
The "other/sector ratio grows in `m`" finding is therefore the growth of positive orbit-type counts. The two zero rows are `S = 0` (`CB(4,1)/4`) and `S < 0` (`CB(4,4)/12`), which contradicts F1's explanation
that they are "unrelated in general to the sign". Nothing in §10 bears on eligible rows.

**A5. Other attacks, all of which cleared.**
- **Circularity:** none. The return makes no universal claim.
- **ℕ subtraction:** not applicable, because Python integers are used throughout.
- **Quantifiers:** the return claims no (HALL) and no cut, so there is no quantifier gap.
- **(LIFT) or C2-LA1 misuse:** none. They are used only to interpret orbit max-flow as the global maximum deficiency, and that interpretation is correct.
- **F uniformity:** the claim that it is "verified, not assumed, by the WID two-sided check" overstates. Both sides use the same uniform multiplicity, so the check cannot test uniformity.
  The transitivity argument is sound and suffices.

**Letters line (ruling 30 / terminal charter).** The return reaches no `proved_informal`-or-better restricted (HALL), no (CUT) candidate and no Lean-ready
statement. A successor inherits the following:
- validated fidelity at both sites;
- the corrected ratios;
- the orbit-enumeration infeasibility, corrected in the certification audit below;
- from this critique, Lemmas 1–2, Identity 3, and the structured-class negative result together with its validated instrument.

## Mechanism-equivalence and fence check

- F1 computes the exact min-cut of the literal network, which is the object of `WeightedHall` itself. It does not revive any of the ten refuted mechanisms.
- It re-proves no closed region, and it uses no census value, RTree wording or controller prior as evidence.
- It does not treat (LIFT) as supplying feasibility.

My Lemmas 1–2 and Identity 3 are exact statements about the literal network on `CB(d,m)`, not a relaxed model. Lemma 2 is a deletion injection used inside a Hall bound for one family; it is not per-leaf injectivity used as a mechanism.
If the synthesis registers Identity 3, a predicate-name proposal is
`E993-R30-CB-EVERY-LEAF-FAVORABLE-S-FREE-POSITIVE-SOURCE-FAMILY-DEFICIENCY-IDENTITY`. It avoids every working label. I could not run the alias check against
`control/CLAIM-IDENTITY.run-local.json` because that file is not in my capsule, so the check is owed by the synthesis.

**Capsule discrepancy.** The attack brief calls CF-REPLAY-c6a "a capsule member", but it is not in `F1-PACKET-MANIFEST.json`. I did not read it, and I recomputed both integers myself.

## Certification audit

Struck or corrected:
1. **§9 table.** "`≈ 7.90 × 10^{49}`" → **`7.90 × 10^48`**. The integer `7899090259979698372561215825523359349306510532250` has 49 digits.
2. **Verdict prose.** "`~10^{41}` to `~10^{49}`" → **`5.79 × 10^40` to `7.90 × 10^48`**. "by 41 to 49 orders of magnitude" is struck.
   The source of the error is `f1_main.py`, which prints `len(str(n))` as the exponent. The size-filtered counts are `1.88 × 10^39` and `2.13 × 10^47`.
3. **§6 table.** "`Δ_x` negative (481-digit magnitude)" and "(363-digit)" → **477 and 361 digits**. The 481 and 363 are the digit counts of `S`, not of `Δ_x`, and no shipped field holds `Δ_x`.
4. **§8.** "the 268 sector orbits are NOT the whole sector level" is **false** and struck. "no simple per-choke threshold predicate …" is superseded:
   the predicate is `s ∉ B` with `w_F(B) > 0`.
5. **§8 "73 … {v} and 67 … ∅".** True on my replay, but unbacked in the return because no shipped script computes it. It is now backed by `own/maximizer_arms.py`.
6. **§7 "cross-checked against `gf_lib`'s independent `sector_supply_gf`".** Unbacked: `f1_main.py` never calls it. The closed forms themselves are confirmed by my instrument.
7. **§5 "verified, not assumed, by the WID two-sided check".** Struck as an overstatement; see A5.
8. **§9/§12 "proven combinatorial obstruction" and the verdict "blocked".** Narrowed to: literal orbit enumeration is infeasible. The exact count stands; the obligation was not blocked (A1, A3).
9. **§10 "finding".** Narrowed: every row records `max(0, S(T, x))` at a non-eligible rank (A4).
10. **§8 "unique maximizer", "126/128", "227/229".** Cited from Cycle 5 records. No shipped F1 script recomputes them, so they stand as citations only.

Backed by my replay and my own instruments:
- `RESULT_SHA256 e2c9e99f…` and output hash `b15d3069…`;
- `n`, `α`, `x` and eligibility at both rows;
- `wid_match: true`;
- `4401.466603449473` and `7476.316339192683`;
- 51.14× and 107.93×;
- all four laboratory `maxdef` and `S` values;
- the §10 numbers (with the reading narrowed per item 9).

## Verdict

verdict: retained_narrowed
headline_resolved: no

The return's fidelity, its (WID) two-sided checks, its laboratory reproductions and its whole-sector ratios are correct. My own instruments re-derive all of them.

The return is narrowed on five points:
- its obstruction claim is really a method limit;
- its maximizer inspection is wrong, since the maximizer is the whole s-free positive layer;
- its §10 reading carries no mixed-family information;
- two digit literals and two exponent literals were wrong;
- two cross-check claims are unbacked.

No part of the mathematics here is complete enough for (HALL). My Lemmas 1–2 and Identity 3 are, in my judgment, complete at their stated scope. They would be `proved_informal` after an isolated second read.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

(HALL) remains open at `CB(8,95)/508` and `CB(9,112)/673`. What is still owed, exactly:
- **(a)** A cut search, or a Hall proof, over `Aut`-invariant families that select individual per-choke states **within** an (arm, `t`) class. This is the class F1's per-choke-state
  ("transfer-matrix") proposal targets. It is feasible by the same per-choke-GF method as `famclass.py`, using marked state polynomials in place of whole classes.
- **(b)** Otherwise, a whole-row certificate by T2's LP + DP method with a literal laboratory, which composes with Lemmas 1–2.

For a successor, the most economical object is a reduction lemma: on `CB(d,m)`, `def(X) ≤ def(X ∩ sector) + def_C(X ∖ sector)`, up to the two coupling channels named in the move enumeration
(SI, and the `r`-switch from arm-`{v}`, `t = 2` sources). Here `def_C` is the deficiency in the config network. This lemma, together with Hall of the config network at levels `p+1 → p` and `p → p−1`,
would give (HALL) at these rows.

Every number of mine above is `bounded_computation`, except Lemmas 1–2 and Identity 3, which are STATED and proved on the face.

## Artifact inventory

Deliverable: this file. Scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-F1-T/`:

| Path | SHA-256 | Role |
|---|---|---|
| `seal.py` | 07bf6bd0…94fe | capsule, dispatch, Stage 3 and Stage 2 seal and member digest checks |
| `replay/*` (six F1 files, copied) | as listed by F1 | copy-out replay; `replay_stdout.txt` 5e002dce…893a; output b15d3069…0f42 (F1's original kept as `f1_main_output.F1orig.json`) |
| `own/lit.py` | dd455c7b…8ecd | generic literal network, own DP, own Dinic |
| `own/fixed_points.py` / `_out.json` | 5151e656…1953 / 3d69a3d9…af4c | K₁,₁₂ and path-star fixed points (RESULT 77c9544e…) |
| `own/lit_small_cb.py` | 1ff2c705…49cc | literal maxdef at §10 rows (RESULT e4634d06…) |
| `own/cbgf.py`, `own/cb_rows.py` / `cb_rows_out.json` | 2cf6d869…d65e, 0039e550…2c1e / 84d025f9…eda1 | closed-form CB instrument; target rows and labs (RESULT 46151f57…) |
| `own/orbit_counts.py` | a9a1e511…6a77 | size-filtered orbit-type counts (RESULT cb23af9f…) |
| `own/maximizer_arms.py` | 8a26cb7a…8500 | X_min arm and `t` split via the copied instrument (RESULT ea65609f…) |
| `own/sfree.py` / `sfree_out.json` | 0648d207…8530 / 7a535c36…669c | Identity 3 at labs and eligible rows (RESULT 6ab8346b…) |
| `own/famclass.py`, `famclass_validate.py`, `famclass_run.py`, `famclass_ratio.py`, `famclass_out.json` | c47260e7…414b, 56a724e0…8530, efbc0c69…748b, 8a046e19…5848, ab906892…068a | structured class: evaluator, 696-case literal validation (RESULT a6800d5e…), runs (RESULT 7cd13f28…, 522b8251…) |
| `own/window_sweep.py` / `_out.json` | bdfba37b…ab2e / b30da27f…cf55 | X* over both eligible windows plus class at edge ranks (RESULT 47db8659…) |
| `own/s10_check_out.json` | 9d698877…adb5 | §10 `maxdef = max(0, S)` check (RESULT 2d168bf0…) |

**Read boundary.**
- I read the capsule members; for the attack briefs, only lines 1–51, the preamble and the F1 section. A heading-only `grep -n '^#'` showed other seats' section titles, but no content.
- I read `control/C6-WORKER-COMMON-BRIEF.md` only through targeted string searches for fixed points and certificate ranks. The critic common brief authorizes it as a Stage 2 member, but the capsule does not list it, so I disclose it.
- I used `grep -F` inside `control/SOURCE-DIGESTS.json`, and I read the three `sources/` files only to hash them.
- I ran `ls -la` on the granted `scratchpad/c6-F1/`.
- I ran no search above my grant, used no network, installed nothing, and started no background jobs. Every computation ran in the foreground, so nothing needed killing.
