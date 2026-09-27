# Critique

Critic `C-U2-T` (orientation T, prove) of route `C5-U-02 CB-PATTERN-THRESHOLD-REDUCTION` (seat U2, orientation U), r30 Cycle 5 Stage 4.

Boot: operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, then the dispatch (`control/dispatch/c5-stage4/DISPATCH-C-U2-T.md`, SHA-256 `bef4757c…c115ae`, verified), the capsule and its listed members, and the U2 scratch artifacts, which I copied out before replaying them. Host-injected context (the project `CLAUDE.md` and the memory index) arrived with the session. I did not open or act on it. I wrote no conversation log, because writes are confined to this file and my scratch.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Capsule** `control/c5-critic-capsules/U2-PACKET-MANIFEST.json`: I recomputed the canonical seal (compact, key-sorted JSON without `seal_sha256`, no trailing newline) and got `cdeb272e1539661e22a61d8e8f0b7cb3b448fc7a2c5540267f2d92d9a2c11d5d`. It matches. All 14 members match their recorded `bytes` and `sha256`, including the return (`f2e0700b…f835cf017`).
- **Stage 4 dispatch manifest** seal: `8987ae61…3c5028d` recomputed, match. **Stage 3 packet manifest** seal: `01bf6099…21b58` recomputed, match. **Stage 2 packet manifest** seal: `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` recomputed, match. This agrees with the common brief and with the return's own citation. **Protocol residue:** `C5-CRITIC-PROTOCOL.md` duty 1 quotes a Stage 2 seal of `f0b5a2a1…9684`, which is not the seal of the Stage 2 manifest in this capsule. It is a stale literal in the protocol (clone residue class R30-E-h). I resolved it by recomputation, and I disclose it here. Nothing in the return depends on it.
- **Digests the return lists:** `SEMANTIC-CONTRACT.md` `ee7ca2e2…` and `SOLUTION-CONTRACT.md` `3168e7a1…` match the capsule. All nine `RESULT_SHA256` values reproduce exactly on my copy-out-first replay (`python3 -B`, run in `scratchpad/c5-crit-U2-T/replay/`, no `__pycache__`): 5275c684…, 357c6f68…, a3b197aa…, 80bd5b67…, f8c75f6f…, d6123fc2…, 01c1cd0e…, ae10b85b…, 22735596…. The longest run was `run_heterogeneous.py` at 60 s. Every run was in the foreground.
- **Unverifiable literal:** the return says the run-local registry has "453 claims, matching the count `C5-STAGE1-GATE.md` states". The Stage 1 gate states no count; it defers to the Cycle 4 close. The registry is not in my capsule, so I cannot verify 453.
- **Process notes (non-mathematical):** U2 filed its read-boundary items itself (the skill read, two `ls` calls, a `find -maxdepth 3`, the temp write, jobs backgrounded by the harness, and the non-determinism, which was resolved). One further item is not in the Stage 3 transcription as a rule issue: the return says it checked for leftover jobs with `ps aux | grep python3`. That is a full process listing, which the run's rules prohibit. It is the same class as F1's self-disclosed `ps aux`. I note it and apply no mathematical consequence. The return also says "four library modules", but three are shipped (`tree_lib.py`, `families.py`, `network.py`).

## Independent re-derivation

**Instrument.** I wrote my own instrument, `own/crit_lib.py`, from SEMANTIC-CONTRACT §1 only, using the standard library and exact integers. It imports nothing from U2. It has four parts:

- **(A)** a generic rooted tree DP for `i_k(T − D)`;
- **(B)** closed-form products for `CB_het`, cross-checked against (A) on every large tree used below;
- **(C)** a dual-number tree DP that computes the layer weights `Σ_{B∈I_j} w_F(B)` directly from the active-tag rule (a tag is active iff its support has at least two neighbours in `B`, with the weight attributed at the support). This path does not go through `q_v`, so the (WID) check `supply − capacity = S` compares two independently computed sides;
- **(D)** a brute-force literal network (`I_j` by enumeration, literal `w_F`, literal (D) ∪ (S), exact Dinic).

In every case, `F_p` is derived from `Δ_p(T − v)` on the original tree, and `x` is scanned through rank `α` inclusive.

**Fixed points reproduced:**

- `K_{1,12}/8`: n 13, α 12, x 6, 12 favourable leaves, supply 1980, capacity 3960, `S = −1980`, flow 1980, 1980 arcs.
- Path-star (2,3,4)/7: 15, 11, 5, 10 favourable, 1483 / 2701 / `S = −1218`, flow 1483, 2025 arcs.
- Path-star (2,2,4,3)/8: 18, 13, 6, 12 favourable, 8033 / 13467 / `S = −5434`.
- `CB(8,92)`: n 1567, α 829, x 490, `|R_491|/|R_490| = 492/491`.
- `G(8^82,7^2)`: n 1427, α 755, x 446.

**Re-derived and confirmed:**

1. **New Lemma 1 (weight regimes).** I re-proved it by hand. With `r ∈ B`, every `u_i ∉ B`, so every private tag is inactive; `v` is active iff `r ∈ B` because `W_v = {r}`; and when `r ∉ B`, `c_ij` is active iff `u_i ∈ B`. My brute force checked every `B ∈ I_{p+1}` at every `p` on 8 homogeneous and heterogeneous trees, with 63 instance rows and 0 failures (`own/regimes.py`). The lemma is correct and elementary.

2. **Closed-form sector identities (`supply`, `cap_D`, `SW`), heterogeneous included.** I re-derived them independently. A switch at `u_i` fires iff `j_i = 1`. Its target contains `u_i` plus the `k−1` leaves of that choke, has weight `1_c^{(d_i)}(k−1)`, and names its firing choke uniquely. Switch targets are disjoint from deletion targets, because a deletion target contains no `u`. The `s`-switch always fires, but only to weight-0 targets. My literal brute force agreed on 44 closed-form rows with 1 ≤ K ≤ D, 0 mismatches.
   - Boundary caveat: at `K = D + 1` the sector is empty. There the formula `cap_D = 1_v·C(D,K−1)2^{K−1}` is the size of the whole lower level, not `w(N_D(sec))`. That is harmless because supply is 0, but the identity should be stated for `1 ≤ K ≤ D`.
   - My orbit-quotient evaluation of `δ(sec)` also equals the closed form on every row of the scan below.
   - At `G/448`, the return's three long integers (`supply`, `cap_D`, `SW`) equal my closed-form values exactly (`own/g448.py`).

3. **Regular-bipartite lemma.** It is correct. In-degree `2(D−K+1)` and out-degree `K` hold on every sector-to-sector deletion arc in my brute force.

4. **True sector maximum deficiency (the step U2 could not compute beyond `m = 1` or small `d`).**
   - Method: the full-Aut orbit quotient of the sector network, solved exactly by max-flow. By (INV) / C2-LA1, a maximum-deficit family can be taken invariant, so `max_X δ(X) = supply − quotient max-flow`.
   - Validation: on 49 literal rows (`CB(2..7,1)`, `CB(2..5,2)`, `CB(2,3)`, every tractable `p`; `own/sector.py`, digest `8f158503…`), the literal max-flow and the quotient agree exactly. They reproduce SR-C4-9's `CB(d,1)` values (1, 3, 3, 20, 25, 280, 21, 406) and `CB(5,2)/7 = 5376`.
   - Result: the quotient reproduces C-U2-F's recorded `CB(10,2)/14` true maximum, **34893540**, independently.

## Attacks and findings

**F1. The shipped exhaustive orbit-lattice run contains no `CB(d,1)` rows.** The return says `run_sector_exhaustive.py` was run on `CB(d,1)`, `d = 1..9`, every `k`, and that it agreed with the max-flow "on every overlap" as "a SECOND independent method". The shipped `main()` runs only `CB(2,2)`, `CB(2,3)` and `CB(3,2)`, and its 19 result rows are exactly those. The two-instrument claim for the `CB(d,1)` table is therefore struck (ruling 42). What remains backed is U2's max-flow plus my own two instruments, the literal network and the quotient. Those agree with SR-C4-9 on all 8 rows, so the values stand.

**F2. The max-flow coverage claim is false as written.** The return says `run_sector_maxflow.py` "confirms zero deficiency at `CB(d,2)`, d ≤ 4, 6, 7, 9 and `CB(d,3)`, d ≤ 8". The shipped sweep has `max_d = 6` at `m = 2` and `max_d = 4` at `m = 3`, and it skips sectors larger than 4000:
- skipped: `CB(5,2)` at k = 5–9 (this includes the deficient `k = 6`), `CB(6,2)` at k ≥ 4, `CB(3,3)` at k = 5–7, `CB(4,3)` at k ≥ 4, and `CB(9,1)` at k = 5–7;
- never run: `d = 7, 9` at `m = 2`, and `d ≥ 5` at `m = 3`.

The "d = 1..9" claim for `CB(d,1)` is also unbacked at `d = 9`. My quotient finds a genuine deficiency there that U2 never reports: `CB(9,1)/7`, true maximum **882**, against a whole-sector value of 714.

**F3. Every one of U2's "new deficient instances" is a positive-aggregate row on a tree with no eligible rank at all.** I computed `S` two ways, via `q_v` and via the dual DP (instrument C):

| Row | x | α | Eligible window | \|F\| | S |
|---|---|---|---|---|---|
| `CB(8,2)/11` (n 37) | 12 | 19 | [14, 12], empty | 1 | +2342912 |
| `CB(11,2)/15` (n 49) | 16 | 25 | [18, 16], empty | 1 | +1164247040 |

The same holds for `CB(5,2)/7`, `CB(10,2)/14`, `CB(12,2)/17`, `CB(13,2)/18`, `CB(14,2)/19` and `/20`, `CB(15,2)/21` and `CB(16,2)/22`: every one has `S > 0` and an empty eligible window (`own/srows_RESULT.json`, digest `5a9c9915…`).

When `1_c = 0` (d = 5, 8, 11, and 14 at K = 18), `F = {v}` and the sector deficiency **equals `S`** exactly. That is the aggregate's own sign, not a transport phenomenon.

These rows fail Hall already at `X = I_{p+1}`, so no mechanism could pass there. They carry no information about whether switch rescue suffices. The return's suggestion that this is "a natural place a genuinely new (CUT) candidate could hide" does not survive this: a (CUT) needs eligibility, and these trees have none. The only informative laboratory of this type on record remains `CB(7,1)/6`, where `S = −21` (I reproduced it).

**F4. True maxima for the `CB(d,2)` table (critic-derived; `own/scan_RESULT.json`, digest `736c79a7…`).**

| Row | `1_c` | U2 whole-sector | True maximum (this critic) |
|---|---|---|---|
| d=5, K=6 | 0 | 5376 | 5376 |
| d=8, K=10 | 0 | 2342912 | 2342912 |
| d=10, K=13 | 1 | 7130880 | 34893540 |
| d=11, K=14 | 0 | 1164247040 | 1164247040 |
| d=12, K=16 | 1 | 990898304 | 2159869129 |
| d=13, K=17 | 1 | 33917458432 | 40258315955 |
| d=14, K=18 | 0 | 625480826880 | 625480826880 |
| d=14, K=19 | 1 | 23842827008 | 69974931026 |
| d=15, K=20 | 1 | 1858598676480 | 2118997358205 |
| d=16, K=21 | 1 | 27455074549760 | 28910371714640 |

- **Whole-sector equals true maximum when `1_c = 0`, as a theorem.** With `1_c = 0`, every switch target has weight 0, so the network is deletion-only with uniform weight. The regular-bipartite / normalized-matching lemma then makes the whole level the maximizer. U2 applied this argument only at `d = 1`.
- **The return's "(if only lower-bound, for d ≥ 8)" is wrong** for d = 8, 11, and 14 at K = 18. Those values are exact.
- **Why `d = 9` is missing (brief question).** It is a genuine non-deficiency, not a gap in the census: the quotient true maximum for `CB(9,2)` is 0 at every K. The pattern follows from three onsets. The deletion threshold is `K* = ⌊(4d+1)/3⌋`. The `1_v` onsets are K = 10, 12, 13 for d = 8, 9, 10, and the `1_c` onsets are 11, 12, 13.
  - d = 8: the only `1_v`-on rank inside the deletion window has `1_c = 0`, giving a pure deletion deficit (d ≡ 2 mod 3 gives the `1_c = 0` rows).
  - d = 9: that rank has `1_c = 1`, and switch rescue covers it.
  - d = 10: switch rescue is short.

  The "non-monotonicity" the return reports is this onset arithmetic.

**F5. The central object: the maximum-deficit family is NOT of per-choke threshold (product) form at `m = 2` (critic-derived; `own/shape3.py`, digest `0d096f99…`).**
- I computed both the smallest maximizer (sources reachable in the residual) and the largest (sources that cannot reach the sink).
- At every switch-bearing deficient `m = 2` row (d = 10, 12, 13, 14, 15, 16), the maximizer is **unique**. It is **not** a product `{B : (k_i, j_i) ∈ Z for all i}`: at `CB(10,2)/14` it has 126 orbits, while the product closure of its states has 128.
- It **contains switch-firing states** (`j_i = 1`; e.g. (3,1), (4,1), (5,1) at d = 10). So it is neither switch-free nor a per-choke `j`-threshold.
- It **is** coordinatewise up-closed in `j` within each k-split: replacing a leaf column by a support column preserves membership. Checked at d = 10, where the thresholds are joint. For example, at k = (5,8), `j_1 = 1` is admitted only when `j_2 ≥ 3`.
- At `m = 1`, by contrast (d = 6, 8, 9, 10, 11, 12), the maximizer is unique and equals `{j ≥ 2}` at `k = K`, which is SR-C4-9's suffix form.

So the allocation's target, "a maximum-deficit `Aut`-invariant family has per-choke threshold form", is refuted in its product reading on these laboratories, one level up from `m = 1`. A lift of SR-C4-9 must use a joint `j`-up-set, not independent per-choke thresholds. That makes the remaining obligation an unbounded structural claim, not "finitely many closed-form inequalities per rank".

**F6. `CB(1,m)`: "never eligible for ANY m" was bounded as submitted; I close it (critic-derived; `proved_informal` as my statement).**

U2's algebra `(m+5)/3 > 0` uses `x(CB(1,m)) = m+1`, which the return itself grades as DP-computed for `m ≤ 80`. The universal claim is therefore conditional on a bounded input.

*My proof, for every m.*
- **Polynomial.** `I = (1+2y)(1+3y+y²)^m + y(1+y)(1+2y)^m`. The first term comes from `T − r = P_2 ∪ mP_3`, and the second from `T − N[r] = K_1 ∪ mP_2`.
- **First term.** `1+3y+y²` is real-rooted and palindromic, so `(1+3y+y²)^m` has log-concave, symmetric coefficients `c_k` that are nondecreasing up to `m`. Hence the coefficients `c_k + 2c_{k−1}` are nondecreasing for `k ≤ m`.
- **Second term.** With `e_j = C(m,j)2^j`, we have `e_{j+1} ≥ e_j` iff `3j ≤ 2m − 1`. So `e_{k−1} + e_{k−2}` is nondecreasing while `k ≤ (2m+2)/3`.
- **Bound on x.** Therefore `Δ_k ≥ 0` for `k ≤ min(m−1, ⌊(2m+2)/3⌋)`. For `m ≥ 5` this gives `x ≥ ⌊(2m+2)/3⌋ + 1`.
- **Sector deficiency.** `SW ≡ 0`, so the sector maximum equals the deletion-level deficit, which is positive iff `3K < 2m + 2`, i.e. `K ≤ ⌊(2m+1)/3⌋`.
- **Eligibility.** Eligibility forces `K = p − 1 ≥ x + 1 ≥ ⌊(2m+2)/3⌋ + 2 > ⌊(2m+1)/3⌋`. So there is no eligible deficient rank for `m ≥ 5`.
- **Small m.** `m ≤ 4` is checked directly, where the eligible windows are empty.

Numerically, `x = m+1` for every `m ≤ 200`, the bound holds, and there are 0 eligible deficient rows (`own/cb1m.py`).

The exact list `(m,K) ∈ {(1,1),(3,2),(4,3)}` still depends on the `1_v` onset `K = m−1`, which is proved nowhere, so it stays `bounded_computation` (`m ≤ 80` in U2; I confirmed the non-eligibility part to `m ≤ 200`).

**F7. Five-row and `G/448` evaluation: fidelity and literals.**
- **Hard-coded indicators.** `run_wholesector_scan.py` hard-codes `1_v = 1_c = 1` at the five rows and calls this "the worst case". It is the opposite: `1_c = 0` removes all switch capacity and maximizes whole-sector δ, as the return concedes elsewhere. Under SOLUTION-CONTRACT §3.3, a hard-coded selector is a fidelity violation. I derived the indicators on both instrument A and instrument B: `1_v = 1_c = 1` at all five rows, and `1_v = 1_c^{(8)} = 1_c^{(7)} = 1` at `G/448`. The signs are therefore right, but only on my derivation.
- **Wrong exponents.** The exponents in the return's table are wrong. The return's own JSON and my computation give:

  | Row | Return's table | Correct |
  |---|---|---|
  | `CB(8,86)/460` | −7.8×10^144 | −7.80×10^327 |
  | `CB(8,89)/476` | −2.2×10^150 | −2.24×10^339 |
  | `CB(8,92)/492` | −6.4×10^155 | −6.44×10^350 |
  | `CB(8,108)/577` | −8.2×10^182 | −8.22×10^411 |
  | `CB(7,144)/673` | −6.7×10^213 | −6.71×10^480 |
  | `G/448` | −2.0×10^376 | −2.00×10^319 |

- **Wrong explanation.** "`cap_D` alone already dwarfs `supply`" is false. At all five rows `supply > cap_D`: the deletion-only sector deficit is positive, which is exactly why these rows are switch-necessary (492/491). `SW` makes the whole-sector δ negative.
- **Consequence.** As the return says, the whole-sector test is necessary, not sufficient. F4 and F5 show the true maximum can exceed it greatly (by ×4.9 at `CB(10,2)/14`). So this material is **not** an independent second proof of the five-row certificates or of T2's certificate.

**F8. Overclaim in the verdict text.** The verdict says "the DELETION-ONLY part of the network is always reduced to one closed-form inequality per rank". The lemma covers only the **sector** deletion sub-network. The non-sector deletion part (regime 3, with non-uniform weights) is not biregular and is the object of E1/E1-R. Narrowed to "the sector's deletion sub-network".

**Quantifiers, circularity and inequality direction.** No step assumes `S ≤ 0` or uses the budget. The regular-bipartite bound has the right direction and ranges over every `X` in the sector. Regime-1 exclusion is sound (zero-supply sources never raise δ). Regime-3 sources are excluded without proof, and U2 says so (Remaining obligation 3). The sector statements therefore bound only `X ⊆ sec`, which is a necessary condition for (HALL), not (HALL-COND).

## Mechanism-equivalence and fence check

- **Regular-bipartite lemma.** It is correct but **not new**. Every column in the sector is independently empty, `b` or `c`, because all `u_i` are forced out. So the level-K sector poset is the claw product `Π_{D} K(2)`, which is independent of how the columns are grouped into chokes. That makes "for every choke pattern" vacuous generality. The lemma's inequality `|N_D(X)|·C(D,K)2^K ≥ |X|·C(D,K−1)2^{K−1}` is exactly the registered `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` at `q_i ≡ 2` (and the biregular (NM) bound), with maximality of the whole level as its standard corollary. The candidate `R30-CB-RECORD-C5-REGULAR-BIPARTITE-DELETION-SHADOW-EXTREMALITY` must not be registered as a new key. At most it is a scope note or corollary of the claw-product NM key. U2's lexical alias check missed this because it searched only its own tokens.
- **Closed-form identity.** A legitimate generalization of B9X (`R30-CB-RECORD-C4-B9X-CBD1-DERIVED-SELECTOR-SECTOR-SUMS`) to `m` chokes and heterogeneous degrees, with a correct derivation. Acceptable as a record-level refinement.
- **`CB(1,m)` characterization.** Not a refuted mechanism. The synthesis should alias-check it against the registered `CBstar` sector-deficit key, which I cannot read (it is not in my capsule).
- **Revived mechanisms.** None of the ten refuted mechanisms and no own-support rule. The deletion-only lemma is not deletion-only Hall: it bounds the sector's `δ_D`, and the return flags it as insufficient once switches are present.
- **Other fences.** No closed region is re-proved. No census value enters a proof. There is no RTree wording, and (LIFT) is not treated as supplying feasibility.
- **Controller prior.** The five-row and `G/448` evaluations re-evaluate closed rows and claim no credit; that is fine. They do lean on "all original leaves favorable per the common brief" instead of deriving `F` (F7), which uses the controller's prior as an input.

## Certification audit

**Struck or corrected:**
- (i) "run on `CB(d,1)`, `d = 1..9`, EVERY `k`" and the "SECOND independent method … agreeing on every overlap" for the exhaustive search: not in the shipped run (F1).
- (ii) "confirms zero deficiency at `CB(d,2)`, d ≤ 4, 6, 7, 9 and `CB(d,3)`, d ≤ 8": not what the shipped sweep covers (F2).
- (iii) The five exponents and the `G/448` exponent (F7).
- (iv) "(the worst case …)" for `1_v = 1_c = 1` (F7).
- (v) "`cap_D` alone already dwarfs `supply`" (F7).
- (vi) "(if only lower-bound, for d ≥ 8)": exact at d = 8, 11, and 14 at K = 18 (F4).
- (vii) "a complete algebraic proof … valid for every `m`" for `CB(1,m)` as submitted: conditional on bounded `x = m+1`, now closed by F6 (critic).
- (viii) "190 homogeneous + 40 heterogeneous instances" and "230 literal instances": these are 105 + 85 check-rows over overlapping `(d,m,p)` plus 40. They are not 230 distinct instances. The row counts 61, 105, 85, 40, 19 and 117 are correct as row counts.
- (ix) "453 claims, matching the count `C5-STAGE1-GATE.md` states": the gate states no count.
- (x) The verdict's "the DELETION-ONLY part of the network": restricted to the sector (F8).

**Backed:**
- All nine `RESULT_SHA256` values (replayed exactly).
- The three long integers at `G/448`.
- `n = 1427, α = 755, x = 446`.
- SR-C4-9's eight `CB(d,1)` values.
- `CB(5,2)/7 = 5376`.
- The seven new whole-sector values.
- "no `__pycache__`" (none in my replay either).

**Gate-31 line.** "central obligation attempted: yes" is present and honest. The return names its instruments.

## Verdict

verdict: retained_narrowed
headline_resolved: no

**What is retained, at its grades:**
- New Lemma 1: `proved_informal`, re-proved by me.
- The `CB(d,m)` and heterogeneous sector closed forms, for `1 ≤ K ≤ D`: `proved_informal` as a B9X refinement, re-derived and brute-force checked by me.
- The regular-bipartite lemma: correct, but an alias or corollary of the claw-product NM key, not a new key.
- The `CB(1,m)` "never eligible" statement: `proved_informal` only with the critic's lower bound on `x` (F6). The exact instance list stays `bounded_computation`.
- The `CB(d,2)` table: `bounded_computation` records of positive-`S` rows on trees with no eligible rank, now with exact true maxima (F4).

**What is narrowed or struck:** the items listed in the certification audit.

**The central obligation is not met, and my F5 shows why.** The unique maximum-deficit family at `m = 2` is a joint `j`-up-set containing switch-firing states, not a per-choke threshold product. The mathematics of no statement in this return reaches (HALL) or any restricted (HALL).

**Ruling 39:** the return supplies none of (a′), (b′), (c′) or (d′). Its material bears only on the sector part of a CB-class argument, at non-eligible or already-closed rows.

## Remaining obligation

The step that stays open is exact and unbounded. For `CB(d,m)` (and the heterogeneous pattern) at every eligible `p`, with `F = F_p` derived, prove `max_{X ⊆ I_{p+1}} [w_F(X) − w_F(N(X))] ≤ 0`. That breaks into three parts:

- **(1) Sector part.** For `X ⊆ sec_{p−1}`, where both deletion and switch arcs matter (`1_v = 1_c = 1` at every recorded eligible row), prove a structural description of the maximizer. The critic's data suggests the right form is a coordinatewise `j`-up-set (closed under replacing a leaf column by a support column) within each k-split, not per-choke thresholds (F5; `bounded_computation` on 6 `m = 2` rows and 6 `m = 1` rows). A shifting lemma of that kind, "`c → b` compression does not decrease δ", is the natural next lemma. It is STATED here as a conjecture, not proved.
- **(2) Regime-3 part.** Handle `r ∉ B` sources and their interaction with sector sources in one mixed `X`. Regime-3 targets `u_i`-present are shared with the sector's switch images, so the sector bound alone is not (HALL-COND).
- **(3) Finiteness.** Only after (1) and (2) could (HALL) on the class reduce to finitely many closed-form inequalities per rank. On present evidence it does not: the orbit count grows without bound in `m`, and the maximizer is not product-form.

Five-row closure stays with the registered `computer_assisted` key. `G/448` stays with T2.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-U2-T/`.

**Replay and U2 artifacts:**
- `U2-ARTIFACT-DIGESTS.txt`: SHA-256 of every U2 artifact as copied.
- `replay/`: byte copies of U2's 13 scripts and libraries, plus the regenerated `*_RESULT.json` and `*.log` files (all nine digests match the return).

**Own instrument** (`own/`, `python3 -B`, stdlib only):

| File | SHA-256 (prefix) | Purpose |
|---|---|---|
| `crit_lib.py` | `ef382976…` | instruments A–D, plus a max-flow returning smallest and largest maximizers |
| `fixed_points.py` | `13b69289…` | fixed points |
| `regimes.py` | `97749d53…` | Lemma 1, closed forms, biregularity by brute force; 63 rows, 44 closed-form rows, 0 failures |
| `sector.py` | `7641aa46…` | quotient vs literal max-flow; 49 rows, digest `8f158503…` |
| `scan.py` | `62bbd6c6…` | writes `scan_RESULT.json` (`cc8df933…`; payload digest `736c79a7…`): true sector maxima for `CB(d,1)` d ≤ 12, `CB(d,2)` d ≤ 16, `CB(d,3)` d ≤ 8 |
| `shape.py` | `aea5eb07…` | maximizer shape |
| `shape2.py` | `75188021…` | maximizer shape |
| `shape3.py` | `e7f6d145…` | maximizer shape; unique, non-product; digest `0d096f99…` |
| `shape4.py` | `4999f05e…` | `j`-up-closure |
| `rows.py` | `ac0d8f11…` | writes `rows_RESULT.json` (`d54eaf7d…`): five rows and `G/448` indicators on two instruments, `CB(d,2)` row data |
| `srows.py` | `d8564621…` | writes `srows_RESULT.json` (`28cc134a…`): `S` at every U2 laboratory row via `q_v` and the dual DP |
| `g448.py` | `9ccccbcf…` | `G/448` literals |
| `cb1m.py` | `bf4b5e0d…` | `CB(1,m)` bound, m ≤ 200 |

**Process.** No background job was started; every run was in the foreground (longest 60 s), and none remained at the final write. No network, no installs, no `lake`/`lean`. Nothing was written outside this critique and the scratch directory above.
