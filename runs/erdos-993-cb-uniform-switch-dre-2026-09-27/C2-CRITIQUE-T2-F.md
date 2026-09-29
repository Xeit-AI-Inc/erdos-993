# Critique

Critic `C-T2-F` (orientation F, falsify), Cycle 2 Stage 4, run `erdos-993-math-dre-20260927-r31-cb-uniform-switch` (r31). Assigned
return: seat T2, route `C2-T-02`, mechanism token `FAVORABILITY-PRIVATE-LEAF-INTEGER-ROUTE` (orientation T).

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the critic protocol and the capsule members. I loaded no other
VerityOS subsystem.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- Dispatch `control/dispatch/c2-stage4/DISPATCH-C-T2-F.md`: SHA-256 `43f3d33e47e807bf99a7c6d811191354d3d2169d0b205e5e1950ed929534643b`. It matches.
- **Capsule** `control/c2-critic-capsules/T2-PACKET-MANIFEST.json`: I recomputed the inner seal (compact key-sorted JSON without
  `seal_sha256`, no trailing newline) as **`51fb7be2429e4adcb0f8297e0df382cde66a617f37abb412a7ee61c379851523`**. It matches. All 14 members
  match their listed SHA-256 and byte counts, including the return `cycles/cycle-2/stage3/returns/T2/RETURN.md`
  (`88b5eaec…96afd7`, 33,760 bytes).
- Stage 4 dispatch manifest seal `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb`: recomputed, matches. Stage 3 packet
  manifest seal `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`: recomputed, matches. Stage 2 seal
  `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`: recomputed, matches.
- Digests the return lists, re-checked:
  - `DISPATCH-T2.md` `fbe3dae0…4b9` equals the Stage 3 manifest's entry. I compared the hash only and did not open the file, which is outside my capsule.
  - The concurrent master (494) `d917fd1d…0c08` matches `sources/concurrent/SOURCE-DIGESTS.json`.
  - C1-LA3 `Main.lean` `c0605e12…3f011` and `INFORMAL-PROOF.md` `a8bbf4f5…1166` match `sources/c1-results/SOURCE-DIGESTS.json`.
  - C1-LA3 `VERIFICATION-REPORT.json`: `status = formally_verified`, `checks.kernel-verification = verified`.
  - The entry hashes `b39cd787…` (entry 17, (G)) and `d60b2141…` (entry 4, (R)) are present in that `Main.lean`.
  - The seven inventoried artifacts under `scratchpad/c2-T2/` all match the return's table.
- Route ID and mechanism token appear verbatim in the return. Its two-part model disclosure is present (Sonnet 5 / sonnet / `claude-sonnet-5`).
- **Read-boundary disclosures (mine).**
  - The harness injected the project `CLAUDE.md` and the user memory index into my context. I did not open either file and did not use it.
  - I did not open `control/C2-WORKER-COMMON-BRIEF.md`, because the dispatch restricts me to the capsule list.
  - Every `grep`/`ls` I ran was on a named file or a directory inside `sources/` or my own scratch. I ran no recursive search above my grant.
  - I did **not** replay the return's `alias_check.py`, because it opens `control/CLAIM-IDENTITY.run-local.json`, which is not in my capsule. Its digest `5816bd5c…` is therefore unreplayed by me.
  - No network access, no installs, no Lean or lake invocation.
- **The return's own disclosure.** It read `skills/optimization-loop/skill.md` outside its grant and says it did not use it. Nothing in the mathematics depends on that file.

## Independent re-derivation

My instrument, built from the contracts, uses the Python standard library only, with exact integers and `fractions`.

1. **Literal tree.** I built `CB(8,m) − c_11` from an edge list, tested it as a tree (`|E| = |V| − 1` plus BFS connectivity), and ran a generic independence-polynomial DP that does not use the closed form (`own/literal_rows.py`).
   - For `m = 1..6` the DP equals r30's closed form `I(T−c) = (1+2x)G_cG^{m−1} + x(1+x)^2(1+2x)^{8m−1}` and equals the `E0_j/E1_j/leftover` block sum.
   - At `m = 107, 110, 113, 116, 119` the literal DP equals the block sum.
   - Fixed points reproduced: `CB(8,107)` has `n = 1822`, `α = 964`, `x = 570`, `p* = 572`, and is eligible. The eligible rows 110/113/116/119 give `x = p* − 2` and `(n, α) = (1873, 991)`, `(1924, 1018)`, `(1975, 1045)`, `(2026, 1072)`.
2. **Index convention of record.** The r30 contract (§1.1, `forwardDifferenceDel`) defines `Δ_k(G − D) := i_{k+1}(G − D) − i_k(G − D)`, with fixed point `Δ_8(K_{1,11}) = i_9 − i_8 = 55 − 165`.
   - My DP reproduces this fixed point: `−110`.
   - The r31 contract agrees: `x` is the least `k` with `i_{k+1} < i_k`, and the terminal `Δ_α = −i_α`.
   - The registered favorability key uses the same convention verbatim (`Δ_k(T − w) := i_{k+1}(T − w) − i_k(T − w)`), and its proof of (ii) descends `Π_{p*+1} < Π_{p*}`.
   - So favorability of `c` at `p*` means **`i_{p*+1}(T−c) < i_{p*}(T−c)`**.
3. **What the return computes.** The return defines "`Δ_{p*}(T−c) < 0`, i.e. `[x^{p*}]I(T−c) < [x^{p*−1}]I(T−c)`" (§"The obligation"). Its instrument computes `Delta = total_ITc_coeff(pst) − total_ITc_coeff(pst − 1)` (`main_verify.py`, lines 249–251). That quantity is **`Δ_{p*−1}(T−c)`**, one rank below the object.
   - My literal DP confirms the identification. At `m = 107` the return's `−6983307…` (407 digits) equals my backward value, head `−69833073525`.
   - The contract quantity `Δ_{p*}(T−c)` at `m = 107` is a different integer: head `−11548817847`, 408 digits.
4. **Replays, copy-out-first into `scratchpad/c2-crit-T2-F/replay/`.**
   - `tree_dp.py` reproduced `RESULT_DIGEST_SHA256 af0177fa…709a` byte-identically: 72 closed-form checks with 0 mismatches, and 1728 two-binomial checks with 0 mismatches.
   - `main_verify.py` (PID 22300, run to completion) reproduced `2888f81f…22a8` byte-identically.
   - These replays confirm that the computations ran as described. They do not change which quantity was computed.

## Attacks and findings

**F1 — FIDELITY FAILURE: wrong rank. This finding is decisive.**

The return's target inequality, its block gap table, its exceptional-block analysis, its reduction `Θ`, its domination ratios and its 52 "negative" rows all concern `i_{p*} − i_{p*−1} = Δ_{p*−1}(T−c)`. That is favorability at rank `p* − 1`. SOLUTION-CONTRACT §3.1 allows one rank per tree, so rank `p* − 1` is outside the fence. Under protocol duty 2, every number downstream of this failure is struck as evidence for the obligation.

The shift also invents the return's structure:

| Block | Gap at the return's index | Gap at the contract index `p*` (my derivation, checked exhaustively in `j` at six rows) |
|---|---|---|
| `E0_j` | `−2j + 3` (`E0_0` deficit 3, `E0_1` deficit 1) | `3a+4b+2 − 6t = −2j − 3` with `t = p* − j`: (G) applies for **every** `j ≥ 0` |
| `E1_j` | not recorded here | `−2j − 7` with `t = p* − j − 1`: (G) applies for every `j` |
| leftover `x(1+x)^2(1+2x)^{8m−1}` | not recorded here | `+2` (deficit 2, with `a = 2`, `b = 8m − 1`, `t = p* − 1`): the only block (G) misses |

So at the contract index the "exceptional blocks `E0_0`, `E0_1`" and the unproved domination step do not arise.

**F2 — The new tool (G') is FALSE.**

(G') claims: for `1 ≤ k ≤ a+b` and `6k ≤ 3a+4b`, `r(k) < r(k+1)`, where `r(k) = [x^k](1+x)^a(1+2x)^b`.

- Counterexample `(a,b,k) = (2,0,1)`: `(1+x)^2 = 1, 2, 1`, and `r(1) = 2 ≮ 1 = r(2)`.
- Counterexample `(a,b,k) = (0,3,2)`: `(1+2x)^3 = 1, 6, 12, 8`, and `12 ≮ 8`.
- On the grid `a, b ∈ [0, 40]` it fails in 865 of 38,533 instances. With margin `6k ≤ 3a+4b − c` it still fails for `c = 1, 2, 3` (572, 292 and 19 failures). It is clean on the grid only for `c ≥ 4`, which is data, not a proof (`own/gprime_test.py`).

The error in the proof is an inequality direction. Log-concavity `r(k−1)r(k+1) ≤ r(k)^2` gives an **upper** bound `r(k−1) ≤ r(k)^2/r(k+1)`. The return writes `r(k−1) ≥ r(k)^2/r(k+1)`. C1-LA3's descent lemma uses the correct direction, so (G') is not "the same proof run in reverse".

The return's "`E0_1` descends, proved universally" is therefore unbacked. Two correct replacements exist for the fact at the return's own index:

- a degree-10 polynomial with all coefficients positive, below (F4);
- a critic sketch: the deficit-1 identity is exact, `(k+1)(r(k+1) − r(k)) = L(r(k−1) − r(k))` with `L = (16m+16)/3 > 0`. Strict log-concavity of two-binomial coefficients (strictness propagates through the same factor induction as C1-LA3 entries 9 and 15) then excludes both a local minimum and a three-term plateau.

**F3 — Exact pieces that hold, but for the wrong object.**

- The deficit-1 equivalence is exact algebra.
- Identities (i) and (ii) and `p*Θ = 6C − (p*+4)(C − D)` hold, re-derived by hand and verified at 8 rows.
- The ratio `(m−1)|Δ(E0_1)|/|Θ|` is 7.49686 at `m = 107`, reproduced exactly.
- The symmetry transfer is valid. `S_8 ≀ S_m` acts transitively on the `8m` private leaves, and `p*` depends on `m` only. Literally, all 16 private-leaf deletions of `CB(8,2)` give one polynomial, and so do all 40 of `CB(8,5)`.

**F4 — The return's stated open inequality, closed by me (outside the fence, no key proposed).**

The inequality is `Θ + (m−1)Δ(E0_1) < 0`.

- Setup: put `m = 3t + 2`, `p* = 16t + 12`. Normalise by `U = 2^{p*−11}C(8m−8, p*−11)` and clear the least common denominator `∏_{h=2}^{12}(16t + h)`.
- `Φ = −Θ − (m−1)Δ(E0_1)` then becomes an integer polynomial `Φ̂(t)` of degree 11. It matches direct big-integer evaluation on every `t ∈ [1, 300]`.
- Shifting to `t = 5 + u` makes every coefficient positive. For `t ≥ 17` a hand-checkable bound suffices: `c_11 t^2 ≥ Σ_{i≤9}|c_i|` and `c_10 > 0`, where `Σ_{i≤9}|c_i| = 667127597681455104` and `c_11 = 2533274790395904`.
- `−Δ(E0_1)` and `Θ` reduce to degree-10 polynomials with all coefficients positive, so `Θ > 0` holds universally at the return's index.
- This is a fixed polynomial certificate, so it grades `computer_assisted` under gate ruling 10.
- It concerns rank `p* − 1`. It closes the return's stated remaining lemma #1 as mathematics but advances nothing in the target.

**F5 — Labelling.**

- Under gate ruling 9, `m = 107, 110, 113` are control rows and the fresh rows are `116, 119`. The return calls 110 and 113 "fresh". Its sweep does include 116 and 119, but at the wrong index.
- The candidate key embeds a method and a proof structure (`…VIA-TWO-BINOMIAL-DESCENT-EXCEPT-ONE-CERTIFIED-BLOCK`), which breaks the rule that key names are predicates.
- Its predicate ("every private leaf favorable at `16M-PLUS-4-OVER-3`") is part (ii) of the registered key `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`, restricted to the class. That makes it a **mathematical alias** of the registered key, which differs only in method.
- In any case, the return did not show that predicate.

**Critic-derived advance: private-leaf favorability at the contract index, Darroch/Newton-free, with no certificate and no cutoff.**

This was STATED at a review stage. Grade `proved_informal`; it needs an isolated second read.

*Statement.* For every `m ≥ 107` with `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`, and every private leaf `c` of `CB(8,m)`: `i_{p*+1}(T−c) < i_{p*}(T−c)`.

*Proof.*

1. **Closed form and blocks.** By r30's closed form (a node graded `proved_informal`) and the binomial theorem,
   `Δ_{p*}(T−c) = Σ_{j=1}^{m−1} C(m−1,j) Δ_{p*}(E0_j) + Σ_{j=0}^{m−1} C(m−1,j) Δ_{p*}(E1_j) + Δ_{p*}(Π)`,
   where `Π = E0_0 + leftover = (1+x)(1+2x)^{8m−1}(1+3x+x^2)` is r30's pairing.
2. **`E0_j` and `E1_j`.** Apply (G) (`twoBinom_coeff_strictAnti_of_gap`, C1-LA3, formally verified).
   - `E0_j`: `(a, b, t) = (8j+1, 8(m−j), p*−j)`. The gap hypothesis reduces to `2j + 3 ≥ 0`.
   - `E1_j`: `(a, b, t) = (8j+7, 8(m−1−j)+1, p*−j−1)`. The gap hypothesis reduces to `2j + 7 ≥ 0`.
   - The side conditions hold: `1 ≤ t`, because `t ≥ p* − m ≥ 1` and the ℕ-subtractions are exact since `p* > m`; and `t ≤ a + b`, which is `8m + 1` for `E0_j` and `8m` for `E1_j`.
   - So every one of these blocks is `< 0`.
3. **The paired block `Π`.** Let `q = r_{1,8m−1}`. Then `Δ_{p*}(Π) = q(p*+1) + 2q(p*) − 2q(p*−1) − q(p*−2)`.
   - Recurrence (R) (`twoBinomCoeff_recurrence`, formally verified) at `k = p* − 1` has coefficients `−2` and `p*/2`, giving `p*q(p*) = −2q(p*−1) + p*q(p*−2)`.
   - (R) at `k = p*` has coefficients `−5` and `(p*−2)/2`, giving `(p*+1)q(p*+1) = −5q(p*) + (p*−2)q(p*−1)`.
   - Both coefficient pairs are exact integers because `3p* = 16m + 4`. This is where the class enters.
   - Eliminating `q(p*−2)` and `q(p*+1)` gives
     **`p*(p*+1) Δ_{p*}(Π) = p*(p*−4) q(p*) − (p*^2 + 6p* + 2) q(p*−1)`**.
   - (G) at `(1, 8m−1, p*−1)`: `32m + 1 ≤ 32m + 2`, so `q(p*) < q(p*−1)`.
   - Since `p* − 4 > 0` and `q(p*−1) > 0` (`twoBinomCoeff_pos`), `p*(p*+1)Δ_{p*}(Π) < −(10p* + 2)q(p*−1) < 0`.
4. **Conclusion.** All weights are positive, so `Δ_{p*}(T−c) < 0`. The symmetry transfer then covers every private leaf.

*What the proof uses.* No Newton, no Darroch, no real-rootedness of any polynomial: `1+3x+x^2` enters only by exact convolution. No finite certificate. The hypothesis `m ≥ 107` enters nowhere; the statement is made on the class per the fence.

*Checks.*

- Exact at `m = 107, 110, 113, 116, 119, 137`: literal DP, the block sum, the `Π` identity, and every gap exhaustively in `j` (`own/correct_index.py`).
- The `Π` identity, its sign and (G) at `q` hold on 1001 class rows `m ∈ [2, 3002]`.
- The full forward difference is negative on all 67 class rows `m ∈ [2, 200]` (`own/sweep_fwd2.py`). The return's backward quantity, by contrast, fails at `m = 2, 5, 8`.
- These are checks only. The proof is the argument above.

*Attribution.* The closed forms and the pairing `Π` are r30's. (G), (R) and positivity are C1-LA3's (r31 Cycle 1). The block decomposition comes from the r30 T1-F critique. The contract-index gap table and the `Π` identity are this critic's.

## Mechanism-equivalence and fence check

- **One rank, class only.** The return's content sits at rank `p* − 1`, which is outside the fence (F1). My advance is at `p*` on the class only.
- **Darroch/Newton hygiene.** Neither the return nor my repair uses them. No forest or `I(CB)` real-rootedness is invoked.
- **No refuted mechanism is revived.** (G') is newly REFUTED here by explicit instance and must not be carried or registered.
- **No status transfer to any aggregate key.** Census values are used only as checks, and no universal claim rests on a sweep.
- **No network.** The route builds none, so (WID), `F_{p*}` derivation, the relation and (HALL) are not exercised. (WID) and the other fidelity items are therefore not applicable, except the index fidelity, which fails.
- **Relation to the registered favorability key.** The advance does not re-prove that key's grade. It removes the key's Darroch/Newton premise for part (ii) at `d = 8` on the class. It is mathematically the same predicate, so it belongs as a surviving-premise record on the existing key, after a second read, and not as a new key.

## Certification audit

| Return literal | Audit |
|---|---|
| tree_dp 72/0 and 1728/0, `af0177fa…` | **Backed** (replayed, byte-identical) |
| main_verify `2888f81f…` | **Backed as a computation** (replayed, byte-identical). Its field `Delta_pstar_T_minus_c` is `Δ_{p*−1}`: the **label is struck**. |
| "`Δ_{p*}(T−c)` negative at 52 rows; 107/110/113 have 407/419/430 digits" | **Struck** as `Δ_{p*}` (true only as `i_{p*} − i_{p*−1}`) |
| "`E1_j` and `E0_j` (j ≥ 2) descent **proved**" | **Struck** as progress: the algebra is correct, but at the wrong index |
| "`E0_1` descent **proved** via (G')"; "(G') … ∎"; "exactly C1-LA3's proof run in reverse" | **Struck / REFUTED** (F2) |
| Deficit-1 equivalence; identities (i) and (ii); the reduction | **Backed**, wrong object |
| Ratio "7.4969 … 18.2429, monotonically increasing" | Reproduced, wrong object. Monotonicity is data only. |
| "Darroch/Newton-free end to end, carried almost entirely by an elementary universal mechanism" | **Struck** |
| The return's Darroch/Newton-free gate line (marked advanced) | **Struck** for the return |
| alias_check `5816bd5c…` | Unreplayed by me (read boundary). The lexical result is superseded by the mathematical alias finding (F5). |
| Source digests and the C1-LA3 verdict | **Backed** |

The return's `## Remaining obligation` is **not exact**: its lemma #1 is at the wrong rank. It is closed anyway by F4, at `computer_assisted` and outside the fence.

## Verdict

verdict: rejected
headline_resolved: no

`ELIG_formal: not_advanced`
`HALL_formal: not_advanced`
`FAV_darroch_free: advanced`
`cut_candidate: none`

The `FAV_darroch_free` line records the critic-derived private-leaf proof above (`proved_informal`, stated at review, second read required). The return as shipped does not advance it.

Reasons for rejection:

- The return's object is `Δ_{p*−1}(T−c)`, not `Δ_{p*}(T−c)`. This is an index-fidelity failure, and narrowing to rank `p* − 1` would breach the one-rank fence.
- Its sole new tool (G') is false.

What survives is the closed-form validation, the symmetry transfer, and exact identities about a quantity that is not the target.

## Remaining obligation

For the private-leaf half of Darroch/Newton-free favorability at `p*`:

1. **Isolated second read** of the critic-derived proof above (F-section, steps 1–4), in particular the identity `p*(p*+1)Δ_{p*}(Π) = p*(p*−4)q(p*) − (p*^2+6p*+2)q(p*−1)` and the gap table `−2j − 3` / `−2j − 7` / `+2`.
2. **Formal target**, a natural companion to C1-LA3 that needs only (G), (R), `twoBinomCoeff_pos` and `ring`/`omega`: for `m % 3 = 2`, `2 ≤ m`, the coefficient at `p*+1` of the `I(T−c)` closed form is below the coefficient at `p*`.
3. **U3's link** `I(cbGraph m − c_ij) =` closed form, plus the automorphism transfer.
4. **Flag for the controller.** Any sibling route that writes `Δ_{p*}` as `i_{p*} − i_{p*−1}` shares defect F1. I did not read any sibling route; this is a check to run, not a finding about a sibling.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-T2-F/`.

| File | SHA-256 | Role |
|---|---|---|
| `own/gprime_test.py` | `476415db…f4dc4ef` | (G') and (G) grid test |
| `own/gprime_test_out.json` | `75c0b838…c346` | output of `gprime_test.py` |
| `own/literal_rows.py` | `db39a119…ffe27` | literal-tree DP, closed form, blocks, fixed points |
| `own/literal_rows_out.json` | `110de404…6260` | output of `literal_rows.py` |
| `own/correct_index.py` | `b3c05d80…c81741` | contract-index proof checks, `K_{1,11}` fixed point, literal symmetry |
| `own/correct_index_out.json` | `a27a2327…f1ca` | output of `correct_index.py` |
| `own/domination_cert.py` | `177fbf6f…412efb` | F4 rational form (unreduced) |
| `own/domination_cert_out.json` | `864ff419…b192` | output of `domination_cert.py` |
| `own/compact_cert.py` | `d0e4cae6…56442` | F4 degree-11 certificate, identity on `t ∈ [1, 300]` |
| `own/compact_cert_out.json` | `d9dc11bf…1dfe` | output of `compact_cert.py` |
| `own/sweep_fwd2.py` | `57bb4a64…3c5` | contract-index sweep |
| `own/sweep_fwd2_out.json` | `d455b736…34ba` | output of `sweep_fwd2.py` |
| `own/sweep_fwd.py` | `3963b980…5a62` | abandoned slow variant: killed by literal PID 29726, no output |
| `replay/*.py` | the return's four scripts, byte-identical copies | copy-out-first replay inputs |
| `replay/tree_dp_out.json` | `af0177fa…709a` | replay output |
| `replay/main_verify_out.json` | `2888f81f…22a8` | replay output |

Background jobs: PIDs 22300, 24238, 28378 and 38870 completed; 29726 was killed by literal PID. None was alive at the final write. Nothing was written outside my scratch and this file.
