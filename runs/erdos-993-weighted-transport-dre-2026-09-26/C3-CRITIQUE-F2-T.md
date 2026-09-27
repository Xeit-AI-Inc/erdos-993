# Critique

Critic `C-F2-T` (cross-orientation, orientation T) on route `C3-F-02 UNREACHABLE-CAPACITY-FAMILY-CLOSURE` (seat F2, orientation F),
Cycle 3 Stage 4, r30. Date 2026-09-26.

**Boot acknowledgment.** Operating within VerityOS. Booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The first combined read was display-truncated in the middle, so I
re-read the startup protocol, which is itself an authorized boot file. No other VerityOS subsystem was loaded: no memory,
conversations, modules, skills, logs or decisions.

**Read boundary.** I read the dispatch file (digest verified first), the capsule manifest and its 14 members, the assigned
return, and the F2 artifacts under `scratchpad/c3-F2/`. The artifacts were copied out into my scratch before any use. I ran one
non-recursive `ls` of `scratchpad/c3-F2/` (inside the grant) and one `grep` over my own copied-out replay files (inside my
scratch). I ran no `find`, `rg`, `ls -R` or glob `cat` above the grant. I read no other return, critique, adjudication, sealed
Cycle 1/2 record, registry file, `sources/` member or external source. I used no network and installed nothing. I started no
background jobs: every command ran in the foreground.

## Identity and seal audit

- Dispatch `DISPATCH-C-F2-T.md`: SHA-256 `9193def5087083dbc4ebec68009d3b561bedd37c42f936c1dbf0250b2e9ee04e`. Recomputed before reading; matches.
- **Capsule seal** `F2-PACKET-MANIFEST.json`: recomputed as canonical JSON without `seal_sha256` (sort_keys, `(",", ":")`, no
  trailing newline) = `c6ec438745b6a7a9c598f74294ffe409deae5a4469ebac9e9f6446a335459ad8`. Matches. All 14 members match
  their listed SHA-256 and byte counts.
- Stage 2 seal recomputed `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416` (matches). Stage 3 seal recomputed
  `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797` (matches its embedded field). Stage 4 dispatch seal
  recomputed `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7` (matches). `PATH-CHECK-F2.json`: 0 findings.
- The return's digests:
  - The evidence digest `4305ffb5d639f52a68fa2bdcc7f1dc31e8366b03a88822ca8530c62da1b632c8` reproduces from the shipped `F2-EVIDENCE.json` (canonical form).
  - My full copy-out replay of the seven-script chain (`python3 -B`, about 155 s, foreground) printed the same digest. All
    seven JSON outputs are **byte-identical** to the shipped files (`cmp`).
  - I could not verify the claim "byte-identical in scratch and replay". F2's own `scratchpad/c3-F2-replay/` is outside my
    grant and was not read. My replay replaces it.
  - I did not re-verify the return's `sources/lower-region/inputs/ordinary_tree_checked.py` and
    `CLAIM-IDENTITY.run-local.json` digests. Neither file is in my capsule.
- Model disclosure on the return is "Sonnet/xhigh, runtime `claude-sonnet-5`". This is consistent with the allocation's route
  seating.
- Read-boundary disclosures:
  - The Stage 3 disclosures record lists only F2's two backgrounding incidents. The return's own item 1 (a non-recursive
    `ls scratchpad/`, names only) is missing from the F2 entry. The T2 entry carries an identically worded item. This is a
    record-completeness note for the controller, with no effect on the mathematics.
  - The backgrounding incidents cannot be checked from the evidence. No shipped number depends on them: my replay
    reproduces every output.

## Independent re-derivation

**Instrument.** `scratchpad/c3-crit-F2-T/crit_lib.py`, written from SEMANTIC-CONTRACT §1 only. No F2 code is imported. It has:

- bitmask layer enumeration;
- a rooted-tree DP for every independence polynomial;
- a literal `w_F`: `v ∈ F ∩ B` with `B ∩ (N(s_v) ∖ {v}) ≠ ∅`;
- literal (D) ∪ (S): switches only for `u ∉ B` with `|N(u) ∩ B| = 2`;
- `F_p` derived from `Δ_p(T − v)` on the original tree;
- `x` scanned through rank `α`, including the terminal difference;
- `S` computed independently on the deletion side, as `Σ_{v∈F} [Δ_{p−1}(H_v) − Δ_{p−1}(R_v)]`;
- `supply − capacity = S` asserted on every row;
- an IsTree test (connectivity and acyclicity checked separately);
- my own Dinic max-flow.

Every positive flow is re-extracted from the residual graph (`crit_verify.py`). Each flow-carrying arc is re-checked against
(D)/(S) from the definition. Source equalities, target capacities and total flow are all asserted. Dinic was sanity-tested on
a deficient toy network.

**Fixed points reproduced (own instrument).**

- `K_{1,12}/8`: `n` 13, `α` 12, `x` 6, 12 favorable; 1980 / 3960 / `S = −1980`; saturates with deletion arcs alone.
- Path-star `(2,3,4)/7`: 1483 / 2701, flow 1483, `S = −1218`, 2025 arcs.
- Path-star `(2,2,4,3)/8`: 8033 / 13467 / 8033, `S = −5434`, 11691 arcs.

**Rows.** Each row below is eligible, has `F = all leaves`, and passes `supply − capacity = S` with both sides computed
independently. "Gap" is capacity minus reachable positive capacity. Every flow listed is a verified certificate.

| Row | n | α | x | p | \|F\| | S | supply / capacity | mixed flow | deletion-only flow | gap mixed / del-only |
|---|---:|---:|---:|---:|---:|---:|---|---|---|---|
| G_3 | 14 | 9 | 4 | 6 | 6 | −274 | 253 / 527 | 253 | 253 | 2 / 24 |
| G_4 | 17 | 11 | 5 | 7 | 7 | −1193 | 1542 / 2735 | 1542 | 1542 | 2 / 42 |
| G_5 | 20 | 13 | 6 | 8 | 8 | −5321 | 8875 / 14196 | 8875 | 8875 | 2 / 76 |
| **G_6** | 23 | 15 | 7 | 9 | 9 | −24151 | 49422 / 73573 | **49422** | **49422** | 2 / 142 |
| **G_7** | 26 | 17 | 8 | 10 | 10 | −111045 | 269507 / 380552 | **269507** | **269507** | 2 / 272 |
| T(4,2) | 14 | 9 | 4 | 6 | 5 | −252 | 202 / 454 | 202 | 202 | 2 / 22 |
| T(5,2) | 17 | 11 | 5 | 7 | 6 | −1094 | 1173 / 2267 | 1173 | 1173 | 2 / 43 |
| T(6,2) | 20 | 13 | 6 | 8 | 7 | −4805 | 6350 / 11155 | 6350 | 6350 | 2 / 74 |
| T(7,2) | 23 | 15 | 7 | 9 | 8 | −21276 | 33026 / 54302 | 33026 | 33026 | 2 / 133 |
| **T(8,2)** | 26 | 17 | 8 | 10 | 9 | −94772 | 167410 / 262182 | **167410** | **167410** | 2 / 232 |

- On every mixed row, the targets of positive weight with no in-arc form exactly one target of weight 2:
  - on `G_k`: `{0, 3, 4} ∪ {b_i}` (the `A_k` of the key);
  - on `T(m,2)`: `{c_1..c_m, ℓ_1, ℓ_2}`.
- All of F2's scalar values match mine digit for digit, including T(7,2)'s deletion-only reachable capacity 54169 (gap 133).
- The bold cells for G_6, G_7 and T(8,2) are new: F2 left those max-flows "not attempted (too large)". I attribute them to
  myself: **all three saturate under the full mixed network AND under deletion arcs alone.** Grade `bounded_computation`.

**Block recurrence.**

- I re-derived it by a different method: a path-state DP along `c_1, d_1, …, c_m, f, s`. The state is whether the last
  path vertex is in the set. Pendant counts are `c_i`: 1 (`i < m`), `d_i`, `c_m`, `f`: 0, and `s`: `k`.
- The block prefixes `T_j` from this DP satisfy `T_{j+1} = (1+3y+y²)T_j − y²(1+y)T_{j−1}` exactly for `j < 200`, with
  `T_0 = 1` and `T_1 = 1+3y+y²`.
- The assembled `I(T(m,k))` equals the generic tree DP at `m ∈ {1,…,5, 10, 18, 19, 40, 100, 400}`, `k ∈ {1, 2}`.
- F2's derivation (A1–A2) is correct as written, including `TailOut = y + (1+y)^{k+1}`, `TailIn = y(y + (1+y)^k)` and the
  `W_0(OUT) = 1` base case.
- Discriminant: `(1+3y+y²)² − 4y²(1+y) = y⁴ + 2y³ + 7y² + 6y + 1`. Confirmed. For `y > 0` the sum `1+3y+y²` and product
  `y²(1+y)` are both positive, so both eigenvalues are real and positive. At `y = 0` they are `{1, 0}`; F2 correctly says
  "for `y > 0`".

**Item (a) ranges (own instrument, `m ≤ 1500`).**

- `α(T(m,2)) = 2m+1`.
- `x(T(m,2)) ≤ m` for `m = 3..1500`, with `x = m` exactly on `3..18`.
- `Δ_m(T(m,2)) < 0` for `m = 3..1500` (exceptions only at `m = 1, 2`).
- `Δ_{m+2}(T(m,1)) < 0` for `m = 2..1500`.
- Slack `m − x` at `m` = 19 / 50 / 100 / 200 / 304 / 400 / 500 / 1000 / 1500 is 1 / 2 / 5 / 10 / 16 / 21 / 26 / 53 / 79. This
  reproduces F2's values.

**The three leaf-type summands of `S(G_k, k+3)`, confirmed.**

- `G_k` has these automorphisms: the arms permute freely and leaves 3 and 4 swap.
- My DP gives `σ_4 = σ_3` and `σ_{c_k} = σ_{c_1}` for `k ≤ 80`.
- `H_1 = (1+3y+y²)^{k+1}` and `R_1 = (1+y)²(1+2y)^k` are re-derived: `G − {1,0}` is `k+1` copies of `P_3`, and `G − N[0]`
  is `{3}`, `{4}` and `k` edges `b_i c_i`.
- Both of F2's proved lemmas are correct:
  - `Δ_{k+2}(R_1) = −2^k`, by degree `k+2` and leading coefficient `2^k`.
  - `Δ_{k+2}(H_1) < 0`: the polynomial is real-rooted, strictly log-concave and palindromic with centre `k+1`, and both
    indices `k+2, k+3` lie past the centre.

## Attacks and findings

1. **Fidelity: a non-falsifiable `S` on the four new rows (ruling 17/24). STRUCK as F2's certification.**
   - In `f2_partC.py`, `S = row['supply'] - row['capacity']` for G_6, G_7, T(7,2) and T(8,2). `aggregate_S` (the H_v/R_v side)
     is never called there.
   - The return's "Fixed points reproduced" section says every row asserts `supply − capacity = S` "from two INDEPENDENTLY
     computed sides". The table's `S` column is headed "own, `H_v/R_v` side". Both statements are false for those four rows.
   - `partC` also computes no `x` or `α` for G_6 and G_7. Their table cells come from the cited family facts, not from F2's
     instrument.
   - The numbers themselves survive: my instrument computes both sides independently and gets the same values. They are now
     critic-backed at `bounded_computation`. F2's claim to have certified them is struck.
   - F2's `f2_validate.py` rows (G_3–G_5, T(4..6,2)) are clean: two independent sides, each checked against sealed values.
2. **Unbacked certification literal in shipped output. STRUCK.** `f2_partC.py` prints that deletion-only saturation is
   "DIRECTLY verified" on G_3, G_4, G_5 (`f2_validate.py`) and on T(4,2), T(5,2), T(6,2).
   - It gives the reason "mixed==deletion trivially since flow==supply==capacity's reachable share". That is a non sequitur:
     mixed saturation does not imply deletion-only saturation.
   - `f2_validate.py` runs the MIXED network only (`deletion_only` defaults to False), and `partC` runs deletion-only on T(7,2)
     alone. F2's evidence therefore backs deletion-only saturation only on T(7,2).
   - My instrument now backs it on all ten rows (table above).
3. **"Equivalent" target (A5, Grades, Remaining obligation 1). STRUCK as worded.**
   - `Δ_m(T(m,2)) < 0` implies `x(T(m,2)) ≤ m`. That makes it a *sufficient*, logically *stronger* condition, not an
     equivalent one and not a "strictly weaker" one (A5's wording).
   - The converse would need the coefficients to be non-increasing from `x` to `m`. Nothing proves that: `I(T(m,k))` is
     not real-rooted (next item), and unimodality of tree independence polynomials is not available as a theorem.
   - The two agree on the checked range only. The finding is still useful. My ratio data (item 5) shows `Δ_m < 0` has a
     uniform relative margin, while `x = m` is tight on `3..18`. So `Δ_m < 0` is the better-posed analytic target.
4. **C1 for `T(m,2)`: "EQUIVALENT target … not separately computed". STRUCK.** `S(T(m,2), m+2) ≤ −2` is neither item (a)
   nor equivalent to it. It is not proved, and F2 computes it only at `m ≤ 8`. For `G_k`, C1 is exact: given the key's unique
   no-in-arc target of weight 2, `Σ_{N(I_{p+1})} w = capacity − 2`, so (HALL-COND) at `X = I_{p+1}` holds iff `S ≤ −2`.
   - **(C1) adds no new content; it belongs in the scope note.** It follows in one line from WID and the registered `G_k` key.
   - For `T(m,2)` it inherits the grade of the unreachable-target statement in the CONDITIONAL `T(m,2)` record. I cannot read
     that record, and it is not a registered key per the Stage 1 gate. I confirmed uniqueness only at `m = 4..8`.
5. **Real-rootedness attack on item (a): negative, critic-derived.** My exact Sturm counts (`crit_sturm.py`, rationals) show
   `I(T(m,1))` and `I(T(m,2))` are real-rooted for `m ≤ 2` and NOT real-rooted from `m = 3` on. For example, `T(3,2)` has
   degree 7 but only 5 real roots, and `T(9,2)` has degree 19 but only 11.
   - So the Darroch mode–mean route (mode within 1 of the mean) is closed for this family.
   - Newton/real-rootedness cannot supply the "mode estimate" either. A saddle-point argument with explicit error bounds is
     needed.
6. **Heuristic limiting constants (critic lead, not a claim).**
   - The dominant eigenvalue `λ_+(y)` gives a mean index of `0.946830…` per block at `y = 1`. This predicts
     `slack/m → 0.053170…`.
   - The exact coefficient ratios `i_{m+1}/i_m` of `T(m,2)` stay at or below 0.9419 for `m = 3..1500` (maximum at `m = 3`).
     At `m = 1500` the ratio is 0.88322, against the saddle-point prediction `1/y* = 0.883204…`, where `y*` solves
     `yλ_+'(y)/λ_+(y) = 1`.
   - For `T(m,1)` at index `m+2`, the ratio rises to 0.88110 at `m = 1500`.
   - F2's "≈ 0.0528" is not the empirical value at any reported checkpoint. At `m = 1000` the slack ratio is 53/1000 = 0.053,
     not the stated 0.0528. The lead is correctly labelled as a lead, but that literal is corrected.
7. **"Slack strictly growing for `m ≥ 19`" (Grades table). STRUCK as worded.** Through `m = 1500` the slack is non-decreasing,
   with no decreases. From `m = 20` on it rises on 79 steps and stays level on 1403. The correct statement is "non-decreasing
   to `m ≤ 1500`, with linear growth".
8. **Index slip in B3/B4.** With `p = k+3`, the leaf-1 summand is `q_1(k+3) − q_1(k+2) = Δ_{k+2}(H_1) − Δ_{k+2}(R_1)`. F2
   writes `q_1(k+2) − q_1(k+1)` on the left while using the correct `Δ_{k+2}` on the right. It is a notational error only: the
   numbers use the correct index.
9. **B3 "individually negative on every checked `k = 3..30` (printed exactly below)" is unbacked.** Neither the return nor
   `F2-PARTB.json` prints those rows; the JSON keeps only `k ∈ {3, 4, 5, 10, 20, 50, …, 250}`. The claim is now superseded by
   the proof below, which covers every `k ≥ 1`.
10. **Automorphism use in `f2_partB.py`.** Its comment says the automorphisms were "verified structurally", but the code does
    not verify them. They are evident from the construction, and my DP confirms the equal summands (`k ≤ 80`), so the
    `k ≤ 250` scalar values stand.
11. **Internal inconsistency.** C2 says the `G_6` max-flow was "attempted and found infeasible". The Grades table says
    "not attempted". The first is the accurate one; the question is now moot because the flows are done.
12. **Claim identity.** "P10 `E993-R30-TRANSPORT-TARGET-NO-IN-ARC-IFF-…` (`proved_informal`, SR-REACH)" is not among the
    registered keys.
    - The Stage 1 gate count is 443 = 434 + WID + 3 Cycle 1 + 5 Cycle 2 keys, and the allocation lists every Cycle 2 key.
    - It must be cited as an unregistered second-read item, not at a key grade.
    - It is not load-bearing: `f2_lib.py` computes reachability directly and never uses P10.
    - I could not audit F2's alias check against the run-local registry, which is outside my capsule.
13. **Fence note.** Two rows lie inside the formally CLOSED order band `n ≤ 2p + 2`:
    - `G_3/6`: `n = 14 = 2p + 2`;
    - `T(4,2)/6`: `n = 14 = 2p + 2`.

    Their sign is settled. They remain legitimate (HALL) rows, since (HALL) concerns flows and not the sign. Any sign
    statement on these families contributes only for `k ≥ 4` and `m ≥ 5`.

**Critic-derived advance: item (b) closed for every `k`.** The return leaves the leaf-1 sign "open" and the leaf-3 and
arm-tip forms "not attempted". I attempted both and attribute the result to myself.

Notation: `P = 1+3y+y²`, `U = (1+y)P^k`, `h_j = [y^j] P^{k+1}`, `u_j = [y^j] U`, `p = k+3`.

- **Leaf `c_i` (support `b_i`, `W = {a_i}`).** `H − R` counts sets of `H = G − {c_i, b_i}` that contain `a_i`, so
  `H − R = y · I(G − {0, a_i, b_i, c_i}) = y(1+y)P^k = yU`. Hence `σ_c = u_{k+2} − u_{k+1}`.
  - `U` is real-rooted with positive coefficients (roots `−1` and `−φ^{±2}`) and palindromic of degree `2k+1`. So
    `u_{k+2} = u_{k−1}` and `u_{k+1} = u_k`, giving `σ_c = u_{k−1} − u_k`.
  - Newton at `j = k` with `u_{k+1} = u_k` gives `u_k ≥ u_{k−1}(k+2)/k`. So **`σ_c ≤ −2u_{k−1}/k < 0`**.
- **Leaves 3 and 4 (support 2, `W = {0, other twin}`).**
  - `H_3 = G − {3, 2} = {4} ⊔ Z`, where `Z` is the spider at 0 (leg 1, `k` legs of length 3). So
    `I(Z) = (1+y)P^k + y(1+2y)^k`.
  - `R_3 = G − {0, 2, 3, 4} = {1} ⊔ kP_3`, so `I(R_3) = (1+y)P^k`.
  - Then `H_3 − R_3 = y(1+y)[P^k + (1+2y)^k]`.
  - The polynomial `V = (1+y)(1+2y)^k` has degree `k+1` and leading coefficient `2^k`. So
    **`σ_3 = σ_4 = (u_{k−1} − u_k) − 2^k = σ_c − 2^k < 0`**.
- **Leaf 1.** Write `N = k+1`. Then `σ_1 = h_{N−2} − h_{N−1} + 2^k`, using the palindrome of degree `2N` and
  `Δ_{k+2}(R_1) = −2^k` (F2).
  - Newton at `j = N` gives `h_{N−1}/h_N ≤ N/(N+1)`. Newton at `j = N−1` gives
    `h_{N−2}/h_{N−1} ≤ (h_{N−1}/h_N)·(N−1)(N+1)/(N(N+2)) ≤ (N−1)/(N+2)`.
  - Therefore `h_{N−1} − h_{N−2} ≥ 3h_{N−1}/(N+2)`.
  - Coefficientwise `P^N ≥ (1+3y)^N`, so `h_{N−1} ≥ N·3^{N−1}`.
  - Hence **`σ_1 ≤ 2^{N−1} − N·3^N/(N+2) ≤ −(3^N − 2^N)/2 < 0`** for `N ≥ 2`, that is, for `k ≥ 1`.
  - This closes F2's open magnitude item `|Δ_{k+2}(H_1)| > 2^k`, with room to spare.
- **Favorability of 3 and 4, proved directly (no key needed).**
  - `I(G_k − 3) = A + B` with `A = (1+y)(1+2y)P^k` and `B = y(1+y)(1+2y)^k`.
  - `B` has degree `k+2`, so `Δ_{k+3}(B) = 0`.
  - `A` is real-rooted with mean `k + 7/6`. By Darroch every mode lies in `{k+1, k+2}`, and by strict log-concavity
    `a_{k+4} < a_{k+3}`.
  - So `Δ_{k+3}(G_k − 3) < 0` and `3, 4 ∈ F_{k+3}(G_k)` for every `k ≥ 1`.
  - (My first scripted check of this used the wrong `Δ_{k+3}(B)`. That was my own slip; the corrected check passes for
    `k = 1..60`, `Gk_minus3_check.txt`.)
- **Theorem (critic-derived, STATED).** For every `k ≥ 1`, with `F = F_{k+3}(G_k)`:
  - every leaf summand of `S(G_k, k+3)` is strictly negative;
  - `S(G_k, k+3) ≤ σ_3 + σ_4 ≤ −2 − 2^{k+1}`;
  - in particular `S(G_k, k+3) ≤ −2` for every `k ≥ 3`, which is allocation item (b).

  Grade: `proved_informal` at the statement level. It is stated at a review stage, so it needs an isolated second read before
  registration.

  Checks: the closed forms `σ_1, σ_3, σ_c`, both Newton bounds and `F = all leaves` agree with my deletion-side DP exactly for
  `k = 1..80` (`Gk_closed_forms.json`). They also agree with F2's shipped sample rows, for example `k = 10`:
  `−2352767 / −752260 / −751236`.

  Consequence: with the `G_k` key, (C1) gives (HALL-COND) at `X = I_{p+1}` on every `G_k`, `k ≥ 3`. This is the scalar
  necessary condition only. It is NOT (HALL) on `G_k`: every other source subfamily `X` stays open.

**Bounded lead on `T(m,2)` (critic).** For `m = 4..60`, `F_{m+2}(T(m,2))` is all leaves and every leaf summand is negative
(`Tm2_summands.txt`). The `ℓ_j` summand reduces to `Δ_{m+1}` of `(2y+y²)T_{m−1} + y²W_{m−1}(OUT)`, and the `e_i` summands
depend on position. Every one of them needs the same central-coefficient control of `T_{m−1}` as item (a). There is no
real-rootedness shortcut here, by item 5.

## Mechanism-equivalence and fence check

- F2 proposes no mechanism. It extends finite flow records and proves closed-form scalar lemmas.
- The deletion-only saturations (F2's T(7,2); my ten rows) are finite flows on specific networks. They are not a revival of
  `E993-R23-LITERAL-DELETE-ONLY-HALL`. A route that turns "deletion arcs suffice on `G_k` / `T(m,2)`" into a uniform theorem
  must state that distinction on its face, since (HALL) differs by the active-tag weight as well as by the switch arcs.
- No census value enters a proof. F2's proofs and mine use only closed forms, Newton and Darroch.
- There is no RTree wording, no live-root read and no use of (LIFT) or `D, C ≥ 0`.
- My theorem proves pointwise negativity of every leaf summand on one explicit family at one rank. That is a family
  statement about the aggregate's sign. It is not the per-leaf down-map or occupancy mechanisms (which concern injections and
  dominations, not signs), and it re-proves no closed region beyond the `k = 3` row noted in finding 13.
- A saturating flow on a family is not (HALL), and neither is (HALL-COND) at `X = I_{p+1}`. The return respects this, and
  so do I.

## Certification audit

- **Struck.**
  - "every row asserts `supply − capacity = S` from two INDEPENDENTLY computed sides" and "S (own, `H_v/R_v` side)" for
    G_6, G_7, T(7,2), T(8,2) (F2's code defines `S` as the difference there).
  - The `x`/`α` cells for G_6 and G_7 as F2-instrument output (they are cited family facts; my instrument matches them).
  - The `partC` printed line "deletion-only … DIRECTLY verified … on G_3, G_4, G_5 … T(4,2), T(5,2), T(6,2)".
  - "equivalent / equivalently" and "strictly weaker" for `Δ_m(T(m,2)) < 0`.
  - The `T(m,2)` "EQUIVALENT target" sentence in C1.
  - "slack strictly growing".
  - "0.0528 at `m = 1000`" (it is 0.053).
  - B3's "`k = 3..30` … printed exactly".
  - "verified structurally" for the automorphisms (partB).
  - P10 as a registered `proved_informal` key.
- **Upheld.**
  - Evidence digest `4305ffb5…`, reproduced by my replay, with all seven JSONs byte-identical.
  - The recurrence derivation and its 120-instance DP check (re-derived by me by a different method).
  - The `m ≤ 1500` ranges for both premises and `x = m` on `3..18` (reproduced).
  - `S(G_k, k+3) ≤ −2` for `k = 3..250` as `bounded_computation`, now superseded by my proof.
  - The closed forms for `H_1` and `R_1` and both lemmas (`proved_informal`, confirmed).
  - T(7,2) deletion-only saturation 33026 and reachable capacity 54169 (reproduced with a verified certificate).
  - `f2_validate.py` rows (two sides, reproduced).
- **Critic-backed at `bounded_computation`.** The `S`, supply and capacity values of the four new rows. Full mixed and
  deletion-only saturation on G_6, G_7 and T(8,2).
- **Remaining obligation.** F2's item 2 is now closed by the critic theorem, including the `q_1` sign, subject to its second
  read. Item 1 is correctly named, but the target should read "`Δ_m(T(m,2)) < 0` (sufficient)", and the real-rootedness and
  Darroch route should be recorded as unavailable. Item 4 is a scope-note sentence (finding 4).

## Verdict

verdict: retained_narrowed
headline_resolved: no

F2's proved content stands at `proved_informal`: the block recurrence and the `H_1`/`R_1` closed forms with both lemmas. Its
bounded extensions reproduce exactly.

The return is narrowed for two reasons:

- its WID fidelity assertion on the four new rows was non-falsifiable (ruling 17/24);
- several certification literals are struck (above).

The affected numbers survive only because my independent instrument backs them.

Critic-derived advances, attributed to C-F2-T:

- **Allocation item (b), proved for every `k`.** `S(G_k, k+3) ≤ −2 − 2^{k+1}` for all `k ≥ 1`, with every leaf summand
  strictly negative and `3, 4 ∈ F` proved directly. Grade `proved_informal`, pending an isolated second read. This closes
  F2's open `q_1` magnitude item and the unattempted leaf-3 and arm-tip forms.
- **G_6, G_7 and T(8,2) saturate with deletion arcs alone** (mixed networks too; `bounded_computation`, verified
  certificates).
- **`I(T(m,k))` is not real-rooted for `m ≥ 3`** (exact Sturm), which closes the Darroch route to item (a).

(HALL) is untouched and remains OPEN. There is no cut and no uniform flow theorem.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **Item (a), exactly.**
   - Prove, for every `m ≥ 4`, `Δ_m(T(m,2)) < 0` (sufficient for `x(T(m,2)) ≤ m`) and `Δ_{m+2}(T(m,1)) < 0`.
   - Neither polynomial is real-rooted, so the proof must control the central coefficients of `T_{m−1}` and
     `W_{m−1}(OUT)` directly.
   - The natural route is a saddle-point or local-limit argument on the bivariate rational generating function
     `Σ_m I(T(m,k)) z^m`, with explicit error terms, plus a finite check below the threshold where those errors are
     controlled. That check is available: both premises hold exactly to `m = 1500`.
   - The observed ratio margin is uniform: `i_{m+1}/i_m ≤ 0.942` on `m = 3..1500`, with limit near `0.8832`. The equality
     `x = m` on `4..18` is not the object to prove.
2. **Second read** of the critic theorem `S(G_k, k+3) ≤ −2 − 2^{k+1}` (`k ≥ 1`), with its Newton and Darroch steps and the
   three `H − R` decompositions, before any registration. It is a sign statement on one family at one rank. It is not (HALL)
   and not the primary aggregate.
3. **(HALL) on `G_k` and `T(m,2)`.** Deletion arcs alone saturate on every computed row (`k ≤ 7`, `m ≤ 8`).
   - A parameter-uniform flow must serve EVERY subfamily `X`, not just the scalar condition at `X = I_{p+1}`, which is now
     proved on `G_k`.
   - Any uniform deletion-only statement must state its distinction from `E993-R23-LITERAL-DELETE-ONLY-HALL` on its face.
   - Alternatively, find a cut on some smaller `X`, which F2 did not search for.
4. **`S(T(m,2), m+2) ≤ −2` for every `m`.** This is unproved: it needs item 1's analytic control. It is bounded here to
   `m ≤ 60`, with every summand negative.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-F2-T/`.
They are stdlib only, run with `python3 -B`, and use exact integers and `fractions`. SHA-256:

| File | Content | SHA-256 |
|---|---|---|
| `crit_lib.py` | Own instrument | `e4d67cd55522a1cea708f84f90c5491b65d19ecdb31fe4f0a7cabbee207491d2` |
| `crit_rows.py` | Rows and reachability | `7a830443df7109cbdafa1da862bfd97e151cf88bf2043f3204ed4439e360c582` |
| `crit_verify.py` | Flow certificates, arcs re-checked | `53ecf31b9b38aaed8e4fc6d3c10c143f3d7e0ecaa0f4310edcf498fdf8602798` |
| `crit_Tm.py` | Path-state DP, `m ≤ 1500`, recurrence check | `c3ebad842ef4ecdece57f35b55c8a9fdb2f0e809906f1a535891a830cf937468` |
| `crit_Gk_closed.py` | Leaf-summand closed forms and bounds, `k ≤ 80` | `86e72179c95e8f44e96c82e5277077d695f215f380baae928daedd9e62ff81aa` |
| `crit_sturm.py` | Exact Sturm root counts | `fe308df3409cd577d5f731c4d690e4637932081207fc9430b551db990bcf7ab2` |
| `rows_K1_12-8_PS234-7_G3-6_G4-7_G5-8_T42-6_T52-7_T62-8.json` | Row output | `f0d8da10738cce93ae8e4cb31558ad50ad8f8616011a0606982868a7ac7e2f23` |
| `rows_T72-9_G6-9.json` | Row output | `53c34670390088641a98db2fc2f87ab2e3a3e7d46dfbdbb5f04cba0fc78fe0d1` |
| `rows_T82-10_G7-10.json` | Row output | `7d92ba3f799c591efe9b7174609fb79d670bed151b3e3092d32e5b614040056c` |
| `verified_G3_G5_T62_T72_G6.json` | Verified flows | `85f579f018f1c8d32aee40bca06edd0d9c420c32030569f76f4adf8c8a7d7c33` |
| `verified_T82_G7.json` | Verified flows | `5c31dd0bef5237546aa8f49d9e2f127798be3b297bebcfb9979fb8f15319c1f0` |
| `Gk_closed_forms.json` | Closed-form check output | `e3b5cf4c28a60320666fd29ee15ef55ae2db1fb6d1d4b522f54940367b5c9e2b` |
| `Gk_minus3_check.txt` | Corrected favorability check | `6d8f12057011ae6cff0f7a23d84b81a62a309e6f3ff1e2f2e4c5d1309ba12825` |
| `Tm_check_400.json` | Item (a) range check | `fffe0e3e233989b168547e2f16f68ed6cb7c9e1f7401486fa3f427325f7f2361` |
| `Tm_check_1500.json` | Item (a) range check | `85e1cfbea093a51329bc9af9f90ae274c412776fed1cc69a09cb7f6b5253f3ce` |
| `Tm_relmargin.txt` | Coefficient ratio margins | `166d5e7d550b27f4ad4ff89e6a26a03a7747ee71b766ff44f7197e5e156a215d` |
| `Tm2_summands.txt` | `T(m,2)` summand signs, `m ≤ 60` | `3af2b93b47ed3580f4d7237091973e086320b43f99b3b86d62f8a8eaf19a51a7` |

Also in the same directory:

- `replay/`: the copy-out of F2's seven scripts and seven JSONs. The JSONs were regenerated there; `F2-EVIDENCE.json`
  canonical digest is `4305ffb5d639f52a68fa2bdcc7f1dc31e8366b03a88822ca8530c62da1b632c8`, and every file is byte-identical
  to the original.
- `orig_json/`: pristine copies of F2's JSONs, used for the `cmp`.

No background job was started; none is running at close.
