# Critique

Critic `C-T1-U` (cross-orientation critic, orientation U: formal / structural) of seat `T1`, route
`C1-T-01 WEIGHTED-SHADOW-NORMALIZED-MATCHING`, Cycle 1 Stage 4, run r30 (Erdős #993, weighted mixed-boundary transport).

Boot acknowledgment: operating within VerityOS. Boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Those are the only VerityOS files read outside the run root. I read the
dispatch file `control/dispatch/c1-stage4/DISPATCH-C-T1-U.md` because it was handed to me, and then exactly the 14 capsule
members. In addition I read the T1 scratch artifacts (`scratchpad/c1-T1/`: `t1_instrument.py`, `t1_instrument_output.json`,
`run_output.txt`, `run_output2.txt`; one non-recursive `ls` of that granted directory) and the frozen sources under `sources/`:
the 13 files T1 lists were hashed, and `sources/lower-region/instruments/cb-switch-cut/RESULTS.json` was read for one
cross-check. **Read-boundary disclosure: none.** I read no other return, critique, adjudication, experiment root or external
source. I ran no `find`/`grep`/`rg`/recursive listing above the grant, used no network and installed nothing. Nothing ran
in the background. All computation used the Python standard library and exact integers. I made no Lean invocation, because T1
is not a Lean seat.

Model disclosure: see `## Verdict`.

## Identity and seal audit

- **Capsule seal** (`control/c1-critic-capsules/T1-PACKET-MANIFEST.json`). I recomputed it as SHA-256 of the canonical JSON
  without `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline). Result:
  `e5b3f750c5fddcd9b84d8127323654d8275fe058f4ae1197af5145c4d64aa856`, which matches both the dispatch value and the stored
  value. All 14 members match their listed sha256 and byte counts.
- **Stage 4 dispatch seal** `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc` recomputed and matching. Its
  members that are also capsule members carry identical digests.
- **Stage 3 seal** `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac` recomputed and matching. It lists
  `cycles/cycle-1/stage3/returns/T1/RETURN.md` at `99856702…9013` (27,885 bytes), which matches the file.
- **Stage 2 seal** `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92` recomputed and matching. It is also the value
  T1 cites.
- **Digests the return lists.**
  - The 13 source files T1 names were hashed and all 13 match `control/SOURCE-DIGESTS.json` (981 entries).
  - Script `scratchpad/c1-T1/t1_instrument.py`: sha256 `5bae3eed…497de1` matches.
  - Output body digest `385a1c7b…2eb693` was **reproduced by my copy-out-first replay** in `scratchpad/c1-crit-T1-U/replay/`.
    The replayed `t1_instrument_output.json` is byte-identical to T1's (`ad293ed2…c39d`).
  - `run_output.txt` is the earlier run (digest `b78c6e91…`, without the WID fields). `run_output2.txt` is the reported run. The
    stray `__pycache__/` in T1's scratch is inert.
- **Read-boundary disclosures** (`C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json`): T1 files none. It reports one stray diagnostic
  process killed by PID with its output discarded. Nothing in the return depends on that process.
- **Model disclosure of the seat**: "Chartered Sonnet/xhigh; … `claude-sonnet-5`". This is consistent with `C1-ALLOCATION.md`
  and the Stage 1 transport preflight.
- **Registry keys touched.**
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, untouched).
  - The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN, untouched).
  - (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (OPEN; numeric reconfirmation only).
  - `E993-R23-LITERAL-DELETE-ONLY-HALL` (REFUTED; distinguished correctly).
  - The candidate `E993-R30-CB-SECTOR-DELETION-NORMALIZED-MATCHING` (unregistered; see Mechanism-equivalence).
  - (LIFT), (DCB) and (TSB) are not invoked.

## Independent re-derivation

**Own instrument** (`scratchpad/c1-crit-T1-U/`, stdlib only, exact integers). It is built from the semantic contract, not from
T1's code:

- `cu_tree.py`: rooted-DP independence polynomials of forests; `x` through rank `α`; `F_p` from `Δ_p(T − v)` on the ORIGINAL
  tree; `S` via the tag route `q_v = i(H_v) − i(R_v)`, cross-asserted against `Δ_{p−1}(H_v) − Δ_{p−1}(R_v)`.
- `cu_net.py`: brute-force bitmask layers, literal `w_F` (tags `v ∈ F ∩ B` with `B ∩ W_v ≠ ∅`), literal (D) ∪ (S), and Dinic
  max-flow. It asserts `supply − capacity = S` against the independent tag route before any output.
- `cu_sector.py`, `cu_quot.py`, `cu_quot2.py`: literal and abstract sector networks, and the orbit quotient under `S_d ≀ S_m`.
- `cu_prod.py`, `cu_prod_search2.py`: product-family generating functions.
- `cu_lemma_check.py`, `cu_scan*.py`.

**Fidelity.**

- T1's `active_weight` counts ACTIVE tags only (the witness set `N(s_v) ∖ {v}` meeting `B ∖ {v}`), not `|F ∩ B|`. **Pass.**
- `transport_targets` is (D) ∪ (S) literally: `|N(u) ∩ B| = 2`, `u ∉ B`, with `A` independent of size `p`. **Pass.**
- On the small instances `F` is selected from `Δ_p(T − w)` on the original tree at the original rank. **Pass.**
- `x` is taken through rank `α` for `K_{1,12}`. **Pass.**
- The "`supply − capacity = S` asserted" rule **fails at `K_{1,12}`**. The script sets `S_value = supply − capacity` and then
  asserts `supply − capacity == S_value`, which is a tautology.
- The rule holds genuinely only on T1's two small CB instances (tag route against layer sums). Even there it is reported as a
  Boolean, not asserted.
- No aggregate, supply or capacity is computed for the reported `CB(8, 92)` row.
- The failure strikes the WID certification literal for `K_{1,12}` and nothing else. The `K_{1,12}` supply and capacity are
  literal counts, and the sector numbers do not depend on WID.

**Fixed points reproduced by my instrument before any other output (WID asserted independently):**

| row | n | α | x | p | \|F\| | supply | capacity | S | flow | arcs |
|---|---|---|---|---|---|---|---|---|---|---|
| `K_{1,12}` | 13 | 12 | 6 | 8 | 12 | 1980 | 3960 | −1980 (tag route: 12·(−165)) | 1980 (saturates; no switch exists) | 1980 |
| path-star `(2,3,4)` | 15 | 11 | 5 | 7 | 10 | 1483 | 2701 | −1218 | 1483 (saturates) | 2025 |
| `CB(8, 92)` | 1567 | 829 | 490 | 492 | 737 | — | — | 352-char negative integer | — | — |

Notes on the `CB(8, 92)` row:

- The eligible window is `[492, 552]`.
- `v` is favorable: `Δ_492(T − v) < 0`. All 736 private leaves are favorable. The two leaf orbits come from `S_8 ≀ S_92`, and a
  second private leaf was computed literally as a spot check.
- `S` is **byte-equal** to the frozen `cb-switch-cut/RESULTS.json` `aggregate`. That match is a cross-check only.

This backs the `α`, `x` and `|F|` values that T1 **cited without computing**. T1's claim that recomputing `|F|` "would mean
re-running the full favorable-leaf census on a 1567-vertex tree" is wrong: two DP evaluations take under a second.

A structural by-product ties the pieces together. The arm tag's own summand `q_v(492) − q_v(491)` equals `R_491 − R_490` exactly,
which is the whole-sector deletion deficit. The reason is that `q_v(j)` counts the `j`-sets of `T − {v, s}` containing `r`,
which is the sector with `v` removed.

**T1's claims re-derived.**

1. **Lemma 1 is correct, and its proof is complete.** Biregularity follows from transitivity on both levels. Double counting
   gives `d_k|P_k| = d_{k−1}|P_{k−1}|` and `d_k|X| ≤ d_{k−1}|∂X|`.
   - The abstract wreath product `S_N ≀ (ℤ/2)^N` acts transitively on every rank level of `{0,1,2}^N`. Given two rank-`k`
     elements, move the occupied set by `S_N` and then fix colours coordinatewise.
   - The group preserves the one-coordinate-deletion cover relation.
   - `d_k = k`, `d_{k−1} = 2(N − k + 1)`, and `R_{k−1}/R_k = k/(2(N−k+1)) = 491/492` at `N = 736`, `k = 491`. Exact equality
     `R_491·491 = R_490·492` was re-verified.
   - The sector bijection is correct: `r ∈ B` excludes `s` and every choke, and each branch is one of `{∅, b, c}`. Deletion
     within the sector is exactly the covering relation.
   - Deleting `r`, deleting `v`, and the `s`-switch (`s` has exactly the two neighbours `r, v` in EVERY sector source, so it is
     always insertable) land on weight-0 targets.
   - T1 never mentions deletion of `r`/`v` or the `s`-switch. The omission is harmless because those targets have weight 0,
     but it should be stated.
2. **§2 switch-image weight is verified.** The target is `A = B ∖ {r, b_{ij0}} ∪ {u_i}`. It is independent exactly when group
   `i` has one support: the other positions are leaf-or-empty, and `u_i`'s other neighbour `r` is removed. In `A`:
   - `v` is inactive, because its only witness `r` is gone;
   - group-`i` leaves are active through `u_i`;
   - other groups' leaves are inactive, because their chokes are absent;
   - so `w_F(A) = ℓ_i(B)`, given that all private leaves are in `F`, which holds at `p = 492`.

   My literal-versus-abstract sector networks agree on 5 small `CB` members (`cu_sector.py`).
3. **§3 whole-sector switch total: the formula is right and the reported integer is wrong.** The distinct targets are
   `(i, L, other-state)` with `|L| = ℓ ≤ d − 1` (a `j0 ∉ L` must exist). The weight is `ℓ`. Each target is reached from the
   `d − ℓ` sources indexed by `j0`, so there is no double count, and `ℓ = 0` targets contribute 0. My generating function
   gives the same total as T1's written formula `m·Σ ℓ·C(d, ℓ)·R^{(m−1)}_{490−ℓ}`: **6.4423…×10^350** (351 digits).
   - **T1's code omits the factor `m`.** The loop `total_switch += l*comb(d,l)*R_dm(d, m-1, rest_rank)` never multiplies by
     `m`.
   - The reported `7.0025…×10^348` is exactly `1/92` of the true value (verified: `92 × T1's integer = mine`).
   - Brute force on T1's own small instance confirms the `m` factor: `d = 2, m = 3` gives a switch weight of 192 `= 3 × 64`.

   Corrected whole-sector values: switch weight `6.4423…×10^350`, combined `R_490 + switch = 6.8934…×10^350`, and
   `⌊switch/deficit⌋ = 7012` (T1: 76). The per-member switch weight is about `14.25·|X|`. The inequality `R_491 ≤ combined`
   still holds, now with a much larger margin.

## Attacks and findings

**F1 — the whole-sector margin is not evidence for sector Hall (major).** I built the abstract sector network `Σ(d, m, k)`:
sector sources of weight 1, in-sector deletion targets of weight 1, and switch targets of weight `ℓ`. It is the literal sector
sub-network whenever `v` and all private leaves are in `F`, and it was validated against literal trees. Exact quotient
max-flow was validated against brute force on 9 members.

In the balanced regime `3k = 2N + 1`, which is where `CB(8, 92)` sits at `p = 492` (up-degree = down-degree + 1):

- **Sector Hall FAILS for `(d, m) = (7, 1), (10, 1), (14, 2), (17, 2), (20, 2)`.** The exact deficiencies are 21, 1170,
  69974931026, 75160436230672 and 52285551204125400.
- For `(7, 1)` the WHOLE sector passes (672 ≤ 560 + 140), yet a sub-family fails (max-flow 651 < 672).
- In the `m = 1` failures the maximal deficient family is exactly `{B : every group has ≥ 2 supports}`. I found this by
  exhaustive product-family maximisation, and it equals the flow deficiency exactly.
- **None of these is a cut of (HALL).** None of these trees is eligible at that rank: for example `CB(7, 1)` has `x + 2 = 8 > 6`
  and `CB(14, 2)` has `x + 2 = 22 > 20`.

What F1 proves is that "switch capacity beats the deficit for `X` = whole sector" says nothing about arbitrary `X`. It also
shows that any sector-Hall lemma must use the number of chokes `m`, and through `m` eligibility. No argument local to one
choke can close it. T1's §3 and its Remaining obligation 2 lean on the whole-sector margin, so that reliance is struck.

**F2 — §4's hypothesis is unsatisfiable, and CB does not satisfy it (major, for the candidate key).** §4 asks for
`H ≤ Aut(T)` "independently swapping `b_i ↔ c_i` while fixing the rest of `T` pointwise", and calls the swap "a literal graph
automorphism". In a tree with `b_i ~ z ∈ Z`, `deg b_i ≥ 2 > 1 = deg c_i`, so no automorphism swaps them. The hypothesis is
vacuous for every tree in scope, and `CB(8, 92)` does NOT satisfy it, contrary to §4.

The "transitive within each choke-class" clause is also insufficient: with several classes, `H` is not transitive on rank
levels. §1 is unaffected, because it correctly uses the ABSTRACT wreath product on the abstract poset. The symmetry Lemma 1
needs is of the poset, not of `T`.

Corrected statement (C-T1-U):

> Let `G` be a finite simple graph, `Q ⊆ V` independent, and `(b_i, c_i)` for `i ≤ N` disjoint edges. Suppose no pair is
> adjacent to `Q` or to another pair, and `V = Q ∪ N(Q) ∪ ⋃_i {b_i, c_i}`. Then `{X ∈ I_{|Q|+k}(G) : Q ⊆ X}` is the rank-`k`
> layer of `{0,1,2}^N`, and for every `X` in it, `|∂X|·R_k ≥ |X|·R_{k−1}`, where `R_k = C(N, k)·2^k`.

This needs no leaf condition and no `Aut(T)`. The weighted reading `w_F ≡ [v ∈ F]` is specific to CB's sector.

**F3 — the literals behind §3's "76×" and "combined" are wrong by the factor `m = 92`** (see re-derivation 3).

**F4 — the overlap exhibit.** In `CB(2, 3)` all 48 "overlap" targets have weight **0** (`ℓ = 0`; checked literally). Only
`CB(3, 2)`'s 48 have weight 1. The overlap phenomenon is real, but only one of the two instances shows it for positive
capacity. In addition, both small instances are outside the relevant regime: the whole-sector deletion has a surplus there
(`R_4 = 240 > R_5 = 192`), and neither tree has an eligible rank. The "independent DP scan" that selected them is not an
inventoried artifact.

**F5 — Remaining obligation 2 points the wrong way.** It says the sector ratio is "tightest near the `3p = 2α + 1` boundary". It
is the reverse: `R_{k−1}/R_k = k/(2(N−k+1))` increases with `k`. The deficit exists only at the BOTTOM of the window (see A1).

**F6 — the WID literal at `K_{1,12}`** is tautological (see Fidelity). The claim "three literal instances by two independent
routes each time" should read two.

**Attempt at the open step (critic-derived; attributed to C-T1-U):**

- **A1 — window closure** (`proved_informal`, STATED, needs an isolated second read). For `CB(8, 92)`, sector Hall
  (`Σ_X w ≤ Σ_{N(X)} w` for every `X ⊆ S_{p+1}`) holds at EVERY eligible `p ∈ [493, 552]` by Lemma 1 and deletion alone.
  - For `k = p − 1 ≥ 492`, `R_{k−1}/R_k ≥ 492/490 > 1`, so `|∂X| ≥ |X|`.
  - Sector sources and in-sector deletion targets all carry the same weight `[v ∈ F_p]`, whatever `F_p` is.
  - In general, for `CB(d, m)` with `3p ≥ 2dm + 5`, sector Hall holds without switches.
  - The sector is open only at `p = 492`.
  - A scan of `d ≤ 12, m ≤ 120` finds 35 `CB(d, m)` with an eligible sector-deficit rank. Each has exactly one such rank,
    `p = x + 2`, and all have `m ≥ 86`. `CB(8, 92)` is one of them.
- **A2 — exact deficit identity and live-charging reduction at the balanced rank** (`proved_informal`, STATED, needs an
  isolated second read). Setting:
  - sector `S_{p+1}` of `CB(d, m)`, branch rank `k` with `3k = 2dm + 1` and `d ≤ k`;
  - `v` and all private leaves in `F`;
  - `U(X)` = the in-sector `(k−1)`-states whose `k + 1` up-neighbours all lie in `X`;
  - a state is **dead** if every group is `(0 supports, 0 leaves)`, `(0, d)`, or has `≥ 2` supports.

  Then for every `X ⊆ S_{p+1}`:
  `k·(Σ_X w − Σ_{N(X)} w) ≤ |U_dead(X)| − Σ_{A ∈ ∂X ∖ U(X)} (k − e(X, A))`.

  Proof:
  1. Double counting gives `k(|X| − |∂X|) = |U(X)| − Σ_{∂X∖U}(k − e(X, A))`, which is exact because up-degree is `k + 1`.
  2. Each live `A ∈ U(X)` is charged to one positive-weight switch target reached from one of its up-neighbours:
     - a `(0, l)` group with `1 ≤ l ≤ d−1`: add a support. At most 1 preimage per target.
     - a `(1, l)` group with `l ≤ d−2`: add a leaf in the group. At most `ℓ'(d − ℓ')` preimages.
     - a full `(1, d−1)` group: add an element elsewhere. At most `k − d` preimages.
  3. So a target of weight `ℓ'` receives at most `1 + ℓ'(d−ℓ') + [ℓ' = d−1](k−d) ≤ k·ℓ'` charges. Hence
     `w(N_S^+(X)) ≥ |U_live(X)|/k`. ∎

  At `CB(8, 92)`, `p = 492`: `k = 491`, `d = 8`. **Sector Hall there reduces exactly to the dead core:**
  `|U_dead(X)| ≤ Σ_{A ∈ ∂X∖U(X)} (491 − e(X, A))`.

  Bounded check: no violation in up to 9,600 randomized families over 5 balanced models (`cu_lemma_check.py`). In the `m = 1`
  failures of F1, the deficient family is exactly the dead family, so A2 isolates precisely where the mechanism can fail.
- **A3 — `bounded_computation` only; no proof.**
  - The balanced sector saturates for `(d, m) ∈ {(2,2), (4,1), (5,2), (8,2), (11,2), (4,4), (7,4), (10,4), (2,5), (5,5), (8,5),
    (2,8), (2,11), (4,7)}`.
  - The minimum switch multiplier that still saturates falls with `m` (on a `1/64` grid, from `43/64` at `(4,1)` to `3/64` at
    `(8,5)`).
  - At `(8, 92, 491)`, the exact product-family values of `φ/|X|` are:
    - `{no group with exactly 1 support}`: −16.816 (its shadow ratio 17.8155 reconciles with the controller prior's "about
      17.8");
    - `{no positive-weight switch}`: −16.612;
    - `{all groups ≥ 2 supports}`: −17.809;
    - whole sector: −14.251;
    - best of a 20-start local search over product families: −7.297.
  - Calibration: the product-family search recovers 99.8% of the true deficiency at `(14, 2)` and 100% at `m = 1`.
  - No deficient sector family was found at `CB(8, 92)`, and no cut is claimed.

## Mechanism-equivalence and fence check

- **Not a revival.** Lemma 1 is a deletion-only normalized-matching bound on one sector. It asserts a DEFICIT bound, not
  deletion-only Hall, so it is not `E993-R23-LITERAL-DELETE-ONLY-HALL`. T1's two-ground distinction is correct.
  - It is not the Delete/Retag relations, own-support unit capacity, per-leaf injectivity, occupancy domination, signed
    cross-tag or covariance.
  - My A2 charges switch targets globally through the active weight, not per leaf or per own support. It is not C6-F4's
    own-support rule, because targets absorb charges from different sources and groups.
- **No closed region re-proved; no census value in a proof; no RTree wording.** Lemma 1's proof is group-theoretic. §3's numbers
  are reported as bounded. The controller prior `X'` is cited only as a prior; I recomputed it (17.8155) for reconciliation
  only. (LIFT) is not used for a positive claim in the return. My quotient success runs use (LIFT)-type averaging only for
  `bounded_computation` rows, and the failure rows use only the elementary converse (a flow sums to a quotient flow).
- **Alias check for the candidate `E993-R30-CB-SECTOR-DELETION-NORMALIZED-MATCHING`.**
  - Lexically, nothing in my capsule collides. I did not read the claim-identity file; it is not a capsule member.
  - Mathematically, the corrected statement (F2) is the classical normalized-matching property of the product of `N` copies of
    the rank-`(1, 2)` "V" poset, transported through the sector bijection. It is a textbook lemma in new clothing, not a
    mechanism.
  - Recommendation: register it, if at all, as a scope lemma under the corrected hypothesis of F2, never with §4's `Aut(T)`
    phrasing.
  - A1 and A2 are candidate `E993-R30-…` lemmas (outcome-B templates NMP/SW at exact scope). Each needs an isolated second read
    and its own alias check.

## Certification audit

Backed:

- the Stage 2 seal;
- the 13 source digests;
- the script sha;
- the output digest (replayed);
- `K_{1,12}` `n, α, x, |F|`, supply 1980, capacity 3960, `S = −1980` and no switch (my instrument);
- `ratio_492_491_exact`, `deficit = R_490/491` and `R_491 ≤ combined`;
- the NM brute force on all 15/63/4095 subsets (the assertion passes on replay);
- `is_tree` checks;
- the switch-weight formula as written;
- "48 targets × 2 sources" as a literal count;
- `CB(8, 92)` `n = 1567` (constructed).

Now backed by my instrument (T1 had cited them): `α = 829`, `x = 490` through rank `α`, and `|F| = 737`.

**Struck or corrected:**

1. "distinct switch capacity, whole sector `7.003…×10^348`": wrong by the factor `m = 92`. Correct value `6.4423…×10^350`.
2. "combined capacity `5.211…×10^349`": correct value `6.8934…×10^350`.
3. "`⌊switch/deficit⌋ = 76`" and "margin ≈ 76×": correct value 7012. The margin is in any case irrelevant to arbitrary `X`
   (F1).
4. "`supply − capacity = S` asserted true (WID confirmed on this instance)" for `K_{1,12}`: tautological in code, so struck. My
   instrument confirms WID there independently.
5. "numerically reconfirms WID on three literal instances … two independent routes each time": should read two instances,
   both non-eligible.
6. "a literal graph automorphism (swap `b_i, c_i`)" and "the hypotheses … are exactly what `CB(d, m)`'s root-plus-arm sector
   satisfies": false (F2).
7. "an independent DP scan": no artifact, so unbacked.
8. "re-deriving `|F|` would mean re-running the full census": false.
9. Remaining obligation 2's "tightest near `3p = 2α + 1`": reversed (F5).

The grade "Lemma 1 `proved_informal`" is **backed**: the proof is complete. The CB instantiation at `proved_informal` is
**backed at sector-deletion scope**, provided the abstract poset symmetry is named, not `Aut(T)`.

## Verdict

verdict: retained_narrowed

headline_resolved: no

Retained at `proved_informal`:

- Lemma 1 and its instantiation on the `CB(d, m)` root-plus-arm sector: `|∂X| ≥ |X|·491/492` for every `X ⊆ S_{493}`, as a
  deletion-within-sector bound under the abstract `S_N ≀ (ℤ/2)^N` symmetry;
- the §2 switch-image weight `w_F(A) = ℓ_i(B)`;
- the §3 formula.

Narrowed:

- §3's integers corrected by the factor `m`;
- the whole-sector margin demoted to a single-`X` record with no bearing on (HALL-COND);
- §4 replaced by the corrected hypothesis of F2;
- the `K_{1,12}` WID literal struck.

The route verdict `bounded_evidence` is appropriate. Neither the return nor this critique proves (HALL), sector Hall at
`CB(8, 92)`, `p = 492`, or anything about the aggregate. My advances A1 and A2 are critic-derived. They are STATED at
`proved_informal` and need an isolated second read.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

Exact statement to prove, or refute by an exhibited family:

> **Dead-core inequality** at `CB(8, 92)`, `p = 492`, `F = F_492` (all 737 leaves), branch rank `k = 491`. For every
> `X ⊆ S_493 = {B ∈ I_493 : r, v ∈ B}`:
> `|U_dead(X)| ≤ Σ_{A ∈ ∂X ∖ U(X)} (491 − e(X, A))`.
>
> Here `U(X)` is the set of in-sector `490`-states whose 492 up-neighbours all lie in `X`, "dead" means every group is `(0,0)`,
> `(0,8)` or has `≥ 2` supports, and `e(X, A)` is the number of `X`-up-neighbours of `A`.

- By A2 the inequality implies sector Hall at `p = 492`. With A1, that closes sector Hall for `CB(8, 92)` on the whole
  eligible window.
- F1 shows the analogous inequality is FALSE for `m ∈ {1, 2}` at balanced ranks, so any proof must use `m`, the number of
  chokes. The eligible sector-deficit rows (A1 scan) all have `m ≥ 86`.
- This is still sector-only. (HALL-COND) for `X` meeting several sectors, and for trees without a CB-type pendant-pair block
  (T1's obligation 3), remains fully open.
- Outcome A is untouched. No cut is known.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-crit-T1-U/`
(sha256):

| file | sha256 |
|---|---|
| `seals.py` | `d8f47b3624fc0d324501bda48fdf726f2835d68e5646902e30a6c7f851fccaf1` |
| `cu_tree.py` | `2d5c5b6dceb322e0ca0be60cf88eb279403eabc2de751f61b47571feba287a1c` |
| `cu_tree_out.txt` | `e91da43ee5765a610eef4ac097c7d740952816619ce9cbb2e248290d10b5724f` (body digest `dc133512…69ba8`) |
| `cu_net.py` | `c9d64f1c8417693e22e304dcea30a0c8cec1146e03837d7d30e06f2442490c76` |
| `cu_net_out.txt` | `cdd26e2918949ac33d4995ae1ff5356fd0c6c93f877928047aa8a333c60582d4` (body `84c23698…ef0d8`) |
| `cu_sector.py` | `90f856a12f272d7de98e9f9ab445592434c8f046fefcf66d6f683d4b5003f07f` |
| `cu_sector_out.txt` | `4baaa44b0db8db70e3d19f44a4f7f14519e7f6f3df9cb98feea22855ea3f8db1` (body `8c99e71b…7a59`) |
| `cu_quot.py` | `45b197de4d8be10527f676032408b8650696086df57ae5d237386ec3f265226d` |
| `cu_quot_out.txt` | `a330c109f82faf7dac4ad4a8cbd929c4ccdcbf9e1354672693f67dddc655add0` (body `8be63616…42e`) |
| `cu_quot2.py` | `dc9e888179bedb1fb84406ebca6e9360db3d91bb51895f97565290486f9025fb` |
| `cu_quot2_out.txt` | `0b48dda516c27128dea65df5334120436354b379d536fdc9389db5867e45339b` (body includes wall-clock `secs`, so it is not replay-stable; the mathematical fields matched an earlier identical run) |
| `cu_prod.py` | `6f6beff6442edc9a4b8a2fab3e3c2c1ace3e01bfe367d7f01f2ef67b1914b126` (float-mode scaling bug fixed before the reported runs; exact mode unaffected) |
| `cu_prod_out.txt` | `12fd90c71484a6edb5794849a08c839a3b15204c735d4e5ef690bc19b2c31e13` |
| `cu_prod_search.py`, `prod_8_92.json` | `ee1bdda1…`, `449df7df…` — SUPERSEDED: pre-fix absolute-φ search, reports only the empty family; not used |
| `cu_prod_search2.py` | `f89746f44232f182d525241b55fed88d4215bf623ea76ab55ff82e6b69c1e7e4` |
| `cu_prod_search2_out.txt` | `e7e2e8b3f9370197a13febf9e3ec6a05befdacdaf8681fae468d1937e894b808` |
| `cu_lemma_check.py` | `693d1e97445f192cf43850e4023f332162f61a382356da5eeae2d06f82029464` |
| `cu_lemma_check_out.txt` | `4d354ed915e73def82c8add23daf237ab9b22d0ced0c7efc092642785338e41c` (body `0fb521ad…e26e`) |
| `cu_scan.py` | `434d4cd47aaac97668bd6df83a8b36c4943fac9be950b90b3a497281c2c5a22c` |
| `cu_scan_out.txt` | `b51524a194ad8fbb3dba86f224f783162dae8abf62c818675d0d3ef2f226bb49` |
| `cu_scan2.py` | `5c602b8a3b1fc8bf0a67c7823fbf3df29b03fab9eb77b32854003fef43eb5de8` |
| `cu_scan2_out.txt` | `4e6bbc0adfbc7993c798e8e6c51494c04a7c8224aa769c2392d30203bf7dfc99` |
| `replay/t1_instrument.py` | `5bae3eed7d104d2bc20d995bc8e31179784cc4c8d05b7898fffcb6b081497de1` (copy-out of T1) |
| `replay/t1_instrument_output.json` | `ad293ed2a95ee09c711aff9c6ba3f52f340cb97dc057276f45d2050846f2c39d` (byte-identical to T1's) |
| `replay/replay_stdout.txt` | `6643c72c89cbf413c0e64fb5674743ffeaf840f3f15ff26eab41137b2674b21f` (equal to T1's `run_output2.txt`) |

Replay any row by running `python3 -B <script>` in that directory. No background job was started, so none needed killing.
