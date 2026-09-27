# Orientation Adjudication

Adjudicator: orientation **U** (formal / structural), r30 Cycle 5 Stage 5 (`erdos-993-math-dre-20260926-r30-weighted-transport`),
2026-09-27. Portfolio: returns `U1` (`C5-U-01 LEAN-CLAW-NM-AND-GK-TREE-LAYER`) and `U2` (`C5-U-02 CB-PATTERN-THRESHOLD-REDUCTION`),
critiques `C-U1-T`, `C-U1-F`, `C-U2-T`, `C-U2-F`.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** Operating within VerityOS. Boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS file was opened. The host injected the project
`CLAUDE.md` and the user memory index into context at session start. I did not open or act on either. That includes the
`CLAUDE.md` conversation-logging instruction, because the dispatch confines writes to this file and my scratch.

## Identity and seal audit

- **Dispatch.** `control/dispatch/c5-stage5/DISPATCH-ADJ-U.md` has SHA-256 `e70ef40ea402555065299f6d690b6e3d44a4e619f4b4ff8bcd798aa605e64f5f`,
  which matches the pointer. I verified it before following the dispatch.
- **Capsule seal.** `control/c5-adjudicator-capsules/U-PACKET-MANIFEST.json` recomputes to
  **`784f4eef236ea1a6586254b7419b6ec80d18d36db53a5d687ffe1623d882071b`** (canonical JSON without `seal_sha256`, `sort_keys`,
  separators `(",", ":")`, no trailing newline). This equals the recorded seal and the dispatch literal.
- **Capsule members.** All 21 members match on bytes and SHA-256 (`scratchpad/c5-adj-U/verify_seal.py`; 0 bad).
- **Other seals, recomputed:**
  - Stage 2 packet manifest: `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289`.
  - Stage 3 packet manifest: `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58`.
  - Stage 4 packet manifest: `b7b0bcedfb6117021fe99bdf065b24d5a45509f10bdf5dbe1bd48cd0feb47169`.

  All three match their own fields. The critics quote the Stage 4 **dispatch** manifest seal `8987ae61…`. That file is not in my
  capsule, and I did not open it.
- **Returns and critiques.** Each file matches the digest recorded in both the capsule and the admission records:

  | File | SHA-256 prefix |
  |---|---|
  | U1 return | `a8b79b4e…` |
  | U2 return | `f2e0700b…` |
  | C-U1-T | `791abfb8…` |
  | C-U1-F | `52b9b2b2…` |
  | C-U2-T | `154bf633…` |
  | C-U2-F | `11da9db0…` |

  All four critiques are `retained_narrowed`, with `headline_resolved: no`.
- **Model disclosures.**
  - U1 and U2 declare "chartered sonnet/xhigh", runtime `claude-sonnet-5`. This is consistent with the allocation.
  - All four critics declare "chartered opus/medium", runtime `claude-opus-5-5[1m]`.
- **Scratch digests.** I re-verified U1's seven inventoried digests on my copy-out:
  - `Main.lean` `05c24dda…`, 3229 lines; its first 2956 lines hash to `66db6c73ad8f0dbe58dfdf31bf6a5d0b50e3f33459ca08f89ba372cc9ca979bf`;
  - the seed files `45d0ca58…`, `52a4d73c…`, `2bdc48ad…`, `f4dfdef8…`;
  - `gk_tree_layer.py` `d5dc3200…`.

  I also re-verified C-U1-F's `Corollary.lean` `32ac25a1…`, `Check.lean` `0a824518…`, `gk_crit.py` `c87725c8…` and
  `gk_monotone_check.py` `4ce6d706…`, and C-U1-T's `crit_gk.py` `c9edefd4…`.
- **Carried-text binding.** The 2956-line prefix binds to C4-LA1's text of record only through the `66db6c73…` prefix in gate
  ruling 40 and CF-1. The C4-LA1 award file and its kernel receipt (`dd9c21f7…`, CF-1) are outside my capsule. The byte-for-byte
  binding against the award file is owed by the Stage 7 registrar.
- **Entry 14.** `C5LA1.crossingIndex`, as carried in C-U1-F's `Corollary.lean` (lines 3–40), is byte-identical to lines 210–247 of
  the frozen first-interior source (`8d864da2…`, verified). Its header digest `378868ab2e660af8…` equals SHA-256 of the entry body
  plus a trailing newline, which I recomputed.
- **Clone residue (ruling 44).**
  - The sealed `C5-ADJUDICATOR-PROTOCOL.md` names the capsule path as `control/c3-adjudicator-capsules/…`. I resolved this by the
    dispatch's `c5` path.
  - R30-E-j (the stale `f0b5a2a1…` Stage 2 literal in the critic protocol) was reported and resolved by all four U critics. It is
    not a seat defect.
- **Disclosures weighed.** None of these items has a mathematical consequence:
  - U1: two names-only `ls` above grant, and one `find` inside Mathlib.
  - U2:
    - a pre-dispatch read of `skills/optimization-loop/skill.md`;
    - two `ls` calls, one `find -maxdepth 3`, and a transient temp write that was deleted;
    - `ps` used for harness jobs;
    - per the Stage 3 addendum embedded in the Stage 4 disclosures record, a final `ps aux | grep python3`. That is a full
      process listing, the same class as F1's.
  - C-U1-F: reads under `sources/first-interior/` and `PIN.json`, which are authorized.
  - C-U2-F: harness jobs killed by literal PID after `lsof`.

  The standalone addendum file `control/C5-STAGE3-READ-BOUNDARY-DISCLOSURES.addendum.json` is not a capsule member. I did not open
  it; its content reached me only through the capsule's Stage 4 record.
- **My own read boundary.**
  - I read the boot pair, the capsule members, and the inventoried scratch of `c5-U1`, `c5-U2`, `c5-crit-U1-{T,F}` and
    `c5-crit-U2-{T,F}`, listed non-recursively and copied out before any run.
  - Under `sources/` I read `mathlib-binding/PIN.json` and `first-interior/c2-primary-v2/…/Main.lean`.
  - I ran a names-only `ls` of `/Users/ashtonsperry/.local/share/verityos/lean/`, a PATH-CHECK-allowed root, to locate the pinned
    shared project.
  - I made one `grep` over the `*.py` files inside `scratchpad/c5-U2/`, which is within grant.
  - I made no search rooted above grant and no network access or installs.
  - `lake` ran only after `cd` into my copied pinned project. `.lake/packages` is a manual symlink to the shared Mathlib at
    `905b9581…`. I never ran `lake update` or `lake clean`.
  - Every Python run used `python3 -B` in the foreground. I started no background job.

## Route-by-route decisions

### U1 — `C5-U-01 LEAN-CLAW-NM-AND-GK-TREE-LAYER` (seat verdict `compiled`; adjudicated **retained_narrowed**, grade `compiled`, no key)

Both critics are concordant on the substance. Where they differ, the difference is resolved below.

1. **`gkGraph_isTree (k : ℕ) : (gkGraph k).IsTree` (∀ k): RETAINED, compiled scratch, no grade.**
   - My replay:
     - cold `lake build` of the copied project gives `Build completed successfully (8657 jobs)`, 20.6 s wall;
     - the only diagnostic is the carried line-758 `Try this` hint;
     - `#check gkGraph_isTree : ∀ (k : ℕ), (gkGraph k).IsTree`;
     - `SimpleGraph.IsTree.mk (connected) (isAcyclic)` is Mathlib's structure, so connectivity and acyclicity are separately
       carried.
   - Lines 2957–3229 contain no `sorry`, `admit`, `native_decide`, `decide`, `axiom`, `unsafe`, `implemented_by`, `extern` or
     `set_option`.
   - The proof is uniform in `k` and uses no enumeration. Every ℕ subtraction sits under an `omega`-discharged branch guard.
2. **Axiom literal. "Every declaration … same axiom list" is CORRECTED.**
   - The critics disagree only in sample size: C-U1-T found seven helpers on `[propext, Quot.sound]`, C-U1-F found nine.
   - My `#print axioms` over **all 26** new declarations (`u1/allaxioms.out`):

     | Axioms | Count | Declarations |
     |---|---|---|
     | `[propext, Classical.choice, Quot.sound]` | 3 | `gkChildEdge_range`, `gkGraph_card_nonroot`, `gkGraph_isTree` |
     | `[propext, Quot.sound]` | 18 | — |
     | `[propext]` | 4 | the four `gkParentVal_at_one…four` |
     | none | 1 | `gkParentVal` |

   - All are within the permitted three, so there is no soundness consequence. The literal is false for 23 of 26 declarations.
3. **"CD-1 statement type-checks (`clawRank`/`clawLayer`/`clawShadow` elaborate)": STRUCK.** The critics are concordant. The
   only occurrence of "claw" in the shipped `Main.lean` is the route name in the comment at line 2959. No statement, definition
   layer or log was shipped. `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` stays `proved_informal` and gains nothing.
4. **"`crossingIndex = k+1` is supplied informally": STRUCK as a proof claim.** The critics are concordant. The return offers a
   closed form plus a scan to `k = 400`, which is `bounded_computation`. The critics supersede it (see *Critic-derived advance*).
5. **Numeric-table literals: CORRECTED.**
   - C-U1-T called the tabulated values correct. C-U1-F found the index labels wrong. Both are right.
   - My instrument (`own/adj_gk.py`) gives `I(G_1) = 1 + 8y + 21y² + 22y³ + 9y⁴ + y⁵`. So "`i_2 − i_1 = 22 − 21`" is really
     `i_3 − i_2 = Δ_2(G_1) = Δ_{k+1}`.
   - The entries "`87−88`, `367−377`, `7391−7519`, `17508787−17524403`" are `Δ_{k+1}` at `k = 2, 3, 5, 10`, with the labels shifted.
   - "`Δ_1(G_1) = +1`, rank 1 is an ascent" is STRUCK: `Δ_1(G_1) = 13`.
   - `x(G_1) = 3` and `x(G_0) = 2` stand.
6. **"My script's `8·Δ_{k+1}` column matches `−2^k(k²+3k−8)`": attribution STRUCK, values backed.**
   - The critics disagree only in scope. C-U1-T strikes the attribution; C-U1-F marks the values "backed".
   - I read `gk_tree_layer.py`. It computes neither `Δ_{k+1}` nor the formula and prints no coefficients, so the attribution
     fails.
   - The values are correct by three instruments: C-U1-T's, C-U1-F's, and mine for `k = 0..400`.
   - "Two instruments for every numeric claim" is NARROWED. On `k = 41..400`, U1 had one instrument (the closed form). The
     bounded record `x(G_k) = k+1` for `2 ≤ k ≤ 400` now has three independent instruments.
7. **Alias literal "14 hits, listed and read in full above": "listed" STRUCK** (C-U1-F). The return shows four keys. The registry
   is outside my capsule, so the search is not replayable here.
8. **Remaining-obligation ordering: CORRECTED.**
   - Both critics note that `indepNum = 2k+3` is off the critical path. I confirmed this by compiling C-U1-F's `Corollary.lean`:
     the eligibility upper-half hypothesis `_hLow` is unused.
   - It is needed only to show that the eligible set is nonempty exactly for `k ≥ 3`.
   - Also, `crossingIndex` (entry 14) is not in C4-LA1's text. It must be **carried** from the first-interior award, never
     "ported" (ruling 40).
9. **Process note.** The return says "no member under `sources/` was read" while also verifying `PIN.json`. This is a record
   inconsistency with no mathematical effect.

**Critic-derived advance (attributed jointly to `C-U1-T` and `C-U1-F`; STATED at a review stage; `proved_informal`, pending an
isolated second read).**

*Lemma (GK-MONO).* For every `k ≥ 0` and every `0 ≤ j ≤ k`, `Δ_j(G_k) = i_{j+1}(G_k) − i_j(G_k) ≥ 0`. For every `k ≥ 0`,
`8·Δ_{k+1}(G_k) = −2^k(k² + 3k − 8)`. Hence:
- `x(G_k) ≥ k+1` for every `k`;
- `x(G_k) = k+1` for every `k ≥ 2`.

**Paired proofs, compared step by step.** The two proofs take different routes and agree on every shared step. I found no
disagreement on any step.

| Step | C-U1-T | C-U1-F | Adjudicator |
|---|---|---|---|
| Root split `I = (1+y)[Q^{k+1} + y(1+y)(1+2y)^k]`, `Q = 1+3y+y²` | yes (root excluded: `K_1`, cherry, `k` arms `P_3`; included: `{3,4}`, `k·K_2`) | yes, identical | Verified against the literal `gkEdge` (entry 22) and by DP for `k ≤ 30` |
| Monotone through index `k+1` of the bracket | Domination `C ≥ (k+1)R` (binomial expansion of `Q = (1+2y) + y(1+y)`), plus a ratio margin `c_{j+1} − c_j ≥ c_j/(k+1)` from **Newton's inequalities** at the centre of the palindromic real-rooted `Q^{k+1}` | Binomial rows symmetric about `k+1`; pairs row `l+1` of `Q^{k+1}` with row `l` of the second term; `h(M,t) = E(2M,t) + E(M+1,t) ≥ 0` by an elementary chain (`(3/2)^{M/2} ≥ (M+2)/3`) | Both chains are valid. I checked each link by hand. In exact integers or `Fraction`, domination and the margin hold for every `k ≤ 400` and `h ≥ 0` for every `M ≤ 300` (`own/adj_gk.py`, `fails []`) |
| Multiplying by `(1+y)` preserves monotonicity | yes | `Δ_{m−1} = u_m − u_{m−2}` | Equivalent |
| `Δ_{k+1}` by palindromy `c_{k+2} = c_k` | yes | yes | Same argument. The formula holds at `k = 0` as well (value `+1`), so C-U1-T's scope `k ≥ 0` is correct and C-U1-F's `k ≥ 1` is merely conservative |
| Classical dependency | Newton's inequalities, named on the face; not under `sources/` | none (self-contained) | For the proof of record and for Lean, prefer C-U1-F's |

- **Minor looseness.** C-U1-F's third case "forces `M ≥ 3`" in fact forces `M ≥ 4`. This is harmless.
- **Distinctness.** The two proofs are genuinely distinct constructions. They are not "one construction" in the SR-C4-5 sense.
- **Grade.** The lemma is `proved_informal` as a critic-attributed statement at a review stage. It needs an isolated second read
  before registration (SOLUTION-CONTRACT §4).

### U2 — `C5-U-02 CB-PATTERN-THRESHOLD-REDUCTION` (seat verdict `bounded_evidence`; adjudicated **retained_narrowed**)

1. **New Lemma 1 (three-regime weight decomposition of `CB(d,m)` and heterogeneous patterns): RETAINED, `proved_informal`.**
   - Both critics re-proved it: C-U2-T on 63 rows, C-U2-F literally on every source of 108 rows.
   - The proof is a direct reading of `W_v = {r}`, `W_{c_ij} = {u_i}` and `r ~ u_i`.
2. **Sector closed forms (`supply`, `cap_D`, `SW`), homogeneous and heterogeneous: RETAINED, `proved_informal` as a record refining
   B9X, at `1 ≤ K ≤ D`.** Both critics flag the empty-sector boundary `K = D + 1`.
   - At `G/448` the three long integers are backed (C-U2-T).
   - My closed-form evaluation with DERIVED indicators reproduces the six rows' `whole_sector_delta` (below).
   - **Alias risk for the synthesis.** At `d = 1` the sector-deficit criterion `3K < 2m + 2` is exactly the registered CBstar
     criterion `3p < 2dm + 5` at `t = 1` (CF-0). The record must be alias-checked against the CBstar sector-deficit key.
3. **Regular-bipartite deletion lemma: NOT NEW (critics concordant); it must not register.**
   - The sector's level-`K` deletion poset is the claw product `Π_D K(2)` of the `D` columns, and it is blind to the choke pattern.
   - Its inequality is `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` at `q_i ≡ 2`, with `e_K = C(D,K)2^K`.
   - The candidate name `R30-CB-RECORD-C5-REGULAR-BIPARTITE-DELETION-SHADOW-EXTREMALITY` is struck. At most it is a scope note on
     that key.
4. **`CB(1,m)` characterization: NARROWED, then closed by the critics.**
   - U2's "for every `m`" argument used `x(CB(1,m)) = m+1`, which U2 had checked only for `m ≤ 80`.
   - Both critics supply the same construction (one construction, two critics), and I verified it step by step:
     - `(1+2y)(1+3y+y²)^m` is nondecreasing to index `m−1` (log-concave and symmetric about `m`);
     - `y(1+y)(1+2y)^m` is nondecreasing while `3k ≤ 2m+2`;
     - so `x ≥ ⌊(2m+2)/3⌋ + 1` for `m ≥ 5`;
     - eligibility then forces `K ≥ x + 1 > ⌊(2m+1)/3⌋`, so there is no eligible sector deficiency;
     - `m ≤ 4` has empty windows.
   - My check for `m ≤ 120` (`own/adj_cb.py`): 0 violations, and `x = m+1` throughout.
   - Grade: `proved_informal` for the **sector** statement only. It is critic-attributed for the eligibility bound and U2's for
     `SW ≡ 0`.
   - Named classical dependency: unimodality of the log-concave symmetric sequence of `(1+3y+y²)^m`.
   - The exact deficient list `{(1,1), (3,2), (4,3)}` stays `bounded_computation`, because the `1_v` onset is unproved.
   - This is not (HALL) on `CB(1,m)`: E1 fails at `CB(1,7)/10`.
5. **`CB(d,2)` whole-sector table: NARROWED to non-eligible `S > 0` laboratory records.**
   - Every row has an empty eligible window and `S > 0` (C-U2-T F3, C-U2-F F5).
   - At the `1_c = 0` rows (`d = 5, 8, 11`, and `14` at `K = 18`), `F = {v}` and the value equals `S`.
   - "(If only lower-bound, for `d ≥ 8`)" is STRUCK: those rows are exact at `1_c = 0`, by the (NM)/CD-1 extremum.
   - True maxima at the `1_c = 1` rows are C-U2-T's table. I reproduced two of them independently: `CB(10,2)/14` gives 34,893,540
     and `CB(12,2)/17` gives 2,159,869,129.
   - Critic paired disagreement: C-U2-F's prose gives `n(CB(8,2)) = 35`; C-U2-T gives 37. **37 is right**: `3 + m + 2dm`, my
     build, and C-U2-F's own log.
   - "`d = 9` non-monotonicity": the critics are concordant. It is onset arithmetic, with switch rescue covering the only
     `1_v = 1_c = 1` surplus rank for `d ≤ 9`. The sector maximum is 0 at every rank of `CB(9,2)`.
   - The whole network at `CB(9,2)/13` is deficient: 4,204,932 (C-U2-F, confirmed by my instrument). That row has `S = +2,424,264`
     and is not eligible, so it is uninformative.
6. **Five first ranks and `G/448`.**
   - **The hard-coded selector `1_v = 1_c = 1` is STRUCK as U2's evidence** (SOLUTION-CONTRACT §3.3). The numbers are restored by
     derivation. I derived `1_v = 1_c = 1` at all six rows by literal `Δ_p(T − v) < 0`, the third derivation after C-U2-T and
     C-U2-F, with eligibility confirmed at every row.
   - The exponents are STRUCK. My values agree with C-U2-T's:

     | Row | `whole_sector_delta` |
     |---|---|
     | `CB(8,86)/460` | `−7.80e327` |
     | `CB(8,89)/476` | `−2.24e339` |
     | `CB(8,92)/492` | `−6.44e350` |
     | `CB(8,108)/577` | `−8.22e411` |
     | `CB(7,144)/673` | `−6.71e480` |
     | `G/448` | `−2.00e319` |

   - "`cap_D` dwarfs supply" is FALSE. `supply/cap_D` is `460/459`, `476/475`, `492/491`, `289/288`, `337/336` and `448/447`.
     `SW` exceeds the deletion surplus by factors of 4,834 to 9,785.
   - "Worst case" is backwards: `1_c = 0` would make all six sectors deficient.
   - This is **not** a second proof of the five-row key or of T2's certificate. The whole-sector test is necessary, not sufficient.
7. **"(WID) asserted on every literal instance": STRUCK.** The critics are concordant. `tree_lib.aggregate_S` is defined at line
   199 and never called; I checked with a grep over the scratch scripts.
8. **Coverage literals: STRUCK** (critics concordant; I confirmed each by reading the scripts):
   - `run_sector_exhaustive.py` runs only `CB(2,2)`, `CB(2,3)` and `CB(3,2)`, so the "two instruments" claim for the `CB(d,1)`
     table fails;
   - `brute_force_check=True` is never passed;
   - the claimed max-flow `d`-ranges are not what the sweep covers.

   The `CB(d,1)` values stand on the critics' instruments. I independently confirmed `CB(7,1)/6` (21) and the unreported
   `CB(9,1)/7` sector maximum of 882 (C-U2-T).
9. **Count inflation: CORRECTED.** "190 + 40 / 230 instances" are row-checks on overlapping `(d, m, p)`, not distinct trees. Each
   `CB(d,m)` is one isomorphism class; rows are (tree, rank) pairs.
10. **Verdict phrase "the DELETION-ONLY part of the network is always reduced to one closed-form inequality": NARROWED** to the
    sector's deletion sub-network. The non-sector deletion part is E1/E1-R territory.
11. **Sector restriction "without loss of generality": REFUTED on a laboratory** (C-U2-F F1).
    - Row: `CB(11,2)/16`, `n = 49`, `α = 25`, `x = 16`, NOT eligible, `|F| = 23`.
    - `S = −111,739,804`. My instrument asserts WID against `S` computed independently from `C5LA1.aggregate`.
    - The sector-only maximum deficiency is 0. The whole-network maximum is **22,458,436**.
    - The maximizer is **unique** (my minimal and maximal maximizers coincide): 268 sector orbits plus 140 regime-3 orbits.
    - The same coupled shape appears at `CB(10,2)/14` (full maximum 86,940,920 = 204 + 125 orbits) and at `CB(9,2)/13`.
    - This is a new non-eligible record of the refuted Cycle 3 conjecture. It is not a cut.
12. **Central obligation (per-choke threshold form of a maximum-deficit invariant family): NOT MET, and refuted in its product
    reading on laboratories** (C-U2-T F5).
    - The unique sector maximizer is not a product:
      - `CB(10,2)/14`: 126 orbits against a product closure of 128;
      - `CB(12,2)/17`: 227 against 229.
    - It contains switch-firing states `j_i = 1`.
    - At `m = 1` (`CB(7,1)/6`) it is a product.
    - I confirmed all of this with an independent instrument. The grade is `bounded_computation` on non-eligible rows.
    - U2's goal "finitely many closed-form inequalities per rank" is therefore unsupported. The obligation is an unbounded
      structural claim that couples regimes 2 and 3.

## Cross-route reconciliation

- **Objects.** U1 and U2 have disjoint objects. U1's line is the `G_k` family: a tree layer, and a Lean path toward (HALL) at every
  eligible rank of one infinite family. U2's line is the CB-pattern reduction. They meet only through CD-1: U2's regular-bipartite
  lemma is CD-1 at `q ≡ 2`, so a Lean CD-1 (U1's struck item b) would carry it as an instance.
- **Controller facts, weighed as one more instrument.**
  - CF-U1, CF-U2 and CF-U3 agree with my replays on every checkable item.
  - **Discrepancy flagged:** CF-5 says the `G_k` eligibility key's face states `crossingIndex(G_k) = k+1` at `proved_informal`
    "by the r30 Cycle 2–3 record". Three sources point the other way:
    - the allocation's standing state records `x(G_k) = k+1` for `k = 2..400` as **bounded**;
    - the allocation text asks U1 to supply the informal proof;
    - U1 quotes the key's face as carrying only `x(G_k) ≤ k+1`.

    Weighing these sources over the controller prior, I rule the `≥` half (GK-MONO) **new relative to the standing state**. The
    registry is outside my capsule, so the synthesis must confirm this against the key's face.
  - **Consequence of that ruling.** If the face carries only `≤`, then the registered scope "`{(G_k, p) : k ≥ 3, p ≥ k+3
    eligible}`" does not cover eligible ranks `p ∈ [x+2, k+2]`. GK-MONO shows that no such rank exists, so the widening to
    "every eligible rank of `G_k`" is exactly GK-MONO. C4-LA1's own face fences "not 'every eligible rank of `G_k`'" (I read it
    at entry 113).
- **CF-6 (instance frontier).** This is outside my portfolio. U2's suggestion of a "cheap whole-sector grid" as a cut search or
  certificate is rejected. The whole-sector test undercounts:
  - C-U2-F's heterogeneous examples: `[2,3]/4` (15 against 10), `[1,2,3]/5` (3 against −40);
  - `CB(10,2)/14`: ×4.9 in the sector, ×12.2 in the full network.
- **Heterogeneous orbit key.** U2's `network.orbit_key` merges orbits across degree classes (C-U2-F F6). No shipped number is
  affected, but the key must not be reused on heterogeneous patterns.

## Established results

Grades follow SOLUTION-CONTRACT §4. Attributions are on each item.

1. **GK-MONO** (critic-attributed: C-U1-T, C-U1-F; STATED; `proved_informal` pending an isolated second read). For every `k ≥ 0`,
   `i_0(G_k) ≤ i_1(G_k) ≤ … ≤ i_{k+1}(G_k)`, and `8·Δ_{k+1}(G_k) = −2^k(k² + 3k − 8)`. So `x(G_k) = k+1` for `k ≥ 2`, and
   `x(G_0) = 2`, `x(G_1) = 3`.
   - Hypotheses: `G_k = gkGraph k` (C4-LA1 entries 22–23), finite by construction. No `IsTree`, eligibility or selector hypothesis
     is used.
   - Three independent instruments cover `k ≤ 400`: C-U1-T, C-U1-F and mine (`2af4f8c8…`).
2. **(HALL) at every eligible rank of every `G_k`, deletion arcs sufficing** (a composition, STATED; `proved_informal`, which is its
   weakest input).
   - Statement: for every `k` and every `p` with `x(G_k) + 2 ≤ p` and `3p < 2α(G_k) + 1`, the network with `F = F_p(G_k)`, literal
     `w_F` and (D) ∪ (S) has a saturating integral flow, supported on deletion arcs.
   - Inputs:
     - C4-LA1 (`formally_verified`; every `F ⊆ leafSet`, every `p ≥ k+3`);
     - GK-MONO, which gives `p ≥ x + 2 ≥ k + 3`;
     - `favorableLeaves ⊆ leafSet` (by the filter).
   - The eligible set is nonempty iff `k ≥ 3`, via `α(G_k) = 2k+3` (SR-C4-8). That is needed only for non-vacuity.
   - The Lean reduction to GK-MONO is compiled (item 4).
   - Fences:
     - `G_k` only;
     - not (HALL) at full scope;
     - nothing about the primary aggregate beyond `G_k` (whose sign on `G_k` already follows from FLOW⇒SIGN);
     - no RTree wording;
     - not `E993-R23-LITERAL-DELETE-ONLY-HALL`, which is a different network refuted at its own scope;
     - not per-leaf injectivity (a flow is not linear injectivity);
     - not GK-SIGN's strict form.
3. **`gkGraph_isTree`** (U1, Claude Sonnet 5): compiled scratch, sorry-free, within the permitted axioms. No grade until a governed
   award closes over it.
4. **`gk_crossing_lower_iff` and `gk_weightedHall_flow_of_crossing_lower`** (C-U1-F): compiled scratch, no grade. I rebuilt both
   against U1's file with entry 14 carried; each uses `[propext, Classical.choice, Quot.sound]`. The flow theorem takes
   `hx : k+1 ≤ crossingIndex (gkGraph k)` as an explicit, named, open hypothesis. It is not circular.
5. **New Lemma 1** (U2; re-proved by both critics): `proved_informal`.
6. **Sector `supply`/`cap_D`/`SW` closed forms** (U2; re-derived by both critics): a `proved_informal` record at `1 ≤ K ≤ D`, as a
   refinement of B9X. Alias checks are owed against B9X and CBstar.
7. **`CB(1,m)` sector non-eligibility** (U2 structure plus the critics' proof): `proved_informal`, sector statement only.
8. **Bounded records** (`bounded_computation`; every row states `x` through `α`, derived `F_p`, literal `w_F`, literal (D) ∪ (S),
   and WID from two sides):
   - true sector maxima at the `CB(d,2)` laboratories (C-U2-T; two rows by me);
   - the coupled deficiency at `CB(11,2)/16` (C-U2-F; mine);
   - `CB(9,1)/7` sector maximum 882;
   - the non-product unique maximizers (C-U2-T; mine);
   - full (HALL) holding at 169 eligible `CB(d,m)` rows with `d ≤ 5` (C-U2-F). This includes `CB(1,7)/10`, where E1 fails. I
     confirmed a 28-row subset with my own quotient instrument, with 0 deficient rows (`cf0140e8…`).

## Rejected and narrowed mechanisms

- **"A maximum-deficit `Aut`-invariant family has per-choke threshold (product) form" on `CB(d,m)`, `m ≥ 2`:** refuted in its
  product reading at `CB(10,2)/14` and `CB(12,2)/17` (non-eligible; bounded). The surviving conjecture is a joint `j`-up-set, closed
  under replacing a leaf column by a support column. It is STATED only (C-U2-T) and is not established.
- **"Restricting to the root-plus-arm sector is without loss":** refuted at `CB(11,2)/16`. Any CB-class reduction must carry regime-3
  sources that share switch-image capacity.
- **"The whole-sector test certifies" (or searches for cuts):** rejected. It is necessary, not sufficient.
- **The regular-bipartite lemma as a new key:** rejected. It is an alias of CD-1 at `q ≡ 2` and of the homogeneous (NM).
- **The `CB(d,2)` table as a place a (CUT) could hide:** rejected. Every row there has `S > 0` and no eligible rank.
- **U1's "informal proof" of `crossingIndex = k+1`:** rejected as bounded. It is replaced by GK-MONO.
- **Refuted mechanisms.** None of the ten refuted mechanism keys, C6-F4, or R19 is revived by any retained item.
  - The `G_k` corollary routes a deletion-supported flow at the literal active weight on one family.
  - U2's objects are sector counting identities.

## Lean readiness

**(WID)** (`E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`) is already `formally_verified` (C1-LA1). Nothing in this portfolio bears
on it beyond the struck U2 literal. No action.

**Group G-U-A — (HALL) at every eligible rank of `G_k`: CONTRACT-READY as a Stage 7 target** (the statement can be frozen now).
The award cannot close at Stage 5: one Lean node is open, and its informal input awaits the isolated second read.

- **Draft statement.** The §2 (HALL) signature, instantiated at `T = gkGraph k` with the tree face certified:

```lean
theorem gk_lowerRegionWeightedHall_everyEligibleRank (k : ℕ) :
    (gkGraph k).IsTree ∧
    ∀ p : ℕ, C5LA1.crossingIndex (gkGraph k) + 2 ≤ p → 3 * p < 2 * (gkGraph k).indepNum + 1 →
      ∃ f, IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f
```

- **Hypotheses consumed.**
  - Only `crossingIndex + 2 ≤ p` in ℕ. It needs no guard.
  - `hLow` is carried as in the contract and is unused. This must be recorded on the face.
  - The eligible set is nonempty iff `k ≥ 3`. That is a companion fact, not part of the statement.
- **DAG.**
  - **N0 (carried).**
    - C4-LA1 entries 1–113, byte-identical: `Main.lean` prefix `66db6c73…`, kernel receipt `dd9c21f7…`, bound by the registrar.
    - First-interior entry 14 `C5LA1.crossingIndex` (`378868ab…`; source `8d864da2…`).
    - Ruling 40: the new terminal theorem must call C4-LA1's identically stated **lemma** entry 110
      (`gk_exists_deletionSupported_saturatingFlow`), not the carried terminal theorem 113. This follows the carry precedent of
      entry 52.
  - **N1 (compiled).** `gkGraph_isTree` and its 25 helpers: U1, lines 2957–3229 of `05c24dda…`. `theorem` becomes `lemma`
    (R29-N-12).
  - **N2 (compiled).** `gk_crossing_lower_iff` (C-U1-F): `k+1 ≤ crossingIndex ↔ ∀ j ≤ k, ¬ Δ_j < 0`.
  - **N3 (compiled, conditional on N4).** `gk_weightedHall_flow_of_crossing_lower` (C-U1-F).
  - **N4 (OPEN; the smallest unproved lemma).** `∀ j ≤ k, 0 ≤ C5LA1.forwardDifferenceDel (gkGraph k) ∅ j`. It splits into two
    parts:
    - **N4a, count bridge.** `indepSetCount (gkGraph k) ∅ j` equals the `j`-th coefficient of
      `(1+y)[(1+3y+y²)^{k+1} + y(1+y)(1+2y)^k]`. The recommended explicit form, with no `Polynomial`:
      - `i_j = u_j + u_{j−1}`;
      - `u_m = Σ_i C(k+1,i)·C(2(k+1−i), m−i) + Σ_l C(k,l)·C(k−l+1, m−l−1)`.

      The proof goes by the root split and a block-state bijection. C4-LA1's `gkLeafBlock`/`gkCherryBlock`/`gkArmBlock` layer
      (entries 39–41, 81–86) is available to reuse.
    - **N4b, inequality.** `u_m ≥ u_{m−2}` for `1 ≤ m ≤ k+1`, by C-U1-F's elementary chain. C-U1-T's Newton route needs Mathlib
      coverage that is unchecked. If `(3/2)^{M/2}` is awkward in Lean, an integer induction replaces that step.
- **Readiness.**
  - (a) Complete informal proof with a closed DAG: yes, pending the second read of GK-MONO.
  - (b) N0–N3 are covered sorry-free.
  - (c) N4a and N4b are open.
- **Fences for the face.** `G_k` only; deletion-supported; not full (HALL); not the primary aggregate beyond `G_k`; no RTree; not GK
  strict sign; not "every tree". It is a SEPARATE key from C4-LA1. Candidate names (predicates only):
  - `E993-R30-GK-TREE-SATURATING-FLOW-AT-EVERY-ELIGIBLE-RANK` for the composition;
  - `E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE` for GK-MONO, with `x = k+1` (`k ≥ 2`) and the
    `Δ_{k+1}` form as companion content.

  The lexical and mathematical alias check against the run-local registry is owed by the synthesis; the registry is not in my
  capsule. Attribution:
  - `gkGraph_isTree`: U1 (Claude Sonnet 5);
  - GK-MONO: C-U1-T and C-U1-F (Claude Opus 5.5);
  - the reduction: C-U1-F;
  - the flow: C4-LA1.

**Group G-U-B — `indepNum (gkGraph k) = 2k+3`: NOT required. It is an optional companion for non-vacuity.**
- The informal proof is complete (SR-C4-8). U1's plan is correct, and both critics confirmed the Mathlib names:
  - lower bound: witness `{1,3,4} ∪ {5+3i, 7+3i}` with `IsIndepSet.card_le_indepNum`;
  - upper bound: fiberwise, core `≤ 3`, arm `≤ 2`.
- No compiled fragment exists. The whole group is open.

**Group G-U-C — CD-1 (`clawProduct_normalizedMatching`) in Lean: NOT READY.**
- The informal proof is complete at the key's grade (SR-C4-5).
- There is no compiled fragment, no shipped statement and no definition layer.
- The smallest unproved item is the claw-product definition layer (`clawRank`/`clawLayer`/`clawShadow`) and the statement text,
  with SR-C4-5's guards (`N_{k−2} = 0` at `k = 1`; no truncated subtraction). The product-step induction comes after that.

**U2 material:** no Lean group is proposed. These are records. The bounded results (169 rows and the laboratories) never qualify.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Material progress.** It is real but modest, and the load-bearing advances are critic-attributed:
- GK-MONO, a new `proved_informal` lemma (pending a second read) with two independent proofs;
- the widening of the `G_k` restricted (HALL) scope to every eligible rank, which is a new restricted-scope (HALL) statement at
  `proved_informal`;
- a Lean DAG for it reduced to one named open node;
- `gkGraph_isTree` compiled;
- New Lemma 1 and the sector identities as records;
- `CB(1,m)` sector non-eligibility, proved;
- two new adversarial laboratory findings: sector not WLOG, and a non-product maximizer.

This is not a plateau under SOLUTION-CONTRACT §5: there are new `proved_informal` lemmas and new adversarial findings.

**Ruling 39, letter by letter, on this orientation's evidence.**
- **(a′) No.** The portfolio contains nothing with switch arcs load-bearing on an infinite class. Decisive instrument: none.
- **(b′) No.** `G_k` is the family already of record; GK-MONO widens its rank scope and is not a second family. `CB(1,m)` is a
  sector statement, not (HALL).
- **(c′) No.** There is no eligible deficient family anywhere in the portfolio. The deficiencies at `CB(11,2)/16`, `CB(9,2)/13` and
  the `CB(d,2)` rows are non-eligible. Decisive instruments: C-U2-F's quotient and mine.
- **(d′) Not at Stage 5.** No Lean award exists. G-U-A is the orientation's Lean-ready (d′) candidate. It could count only through
  a Stage 7 award **together with** one of (a′)–(c′) from another orientation.

## Headline assessment

headline_resolved: no
status: still_open

Status per statement, at this orientation's evidence grade:

| Statement | Status |
|---|---|
| (HALL) at full scope | `still_open`. No verified full-scope proof and no replayed deficient cut |
| (WID) | `proved`, `formally_verified` by C1-LA1 (not this cycle's material) |
| (HALL) at every eligible rank of `G_k` (outcome-B restricted scope) | `proved` at `proved_informal`, verified by me step by step and by exact checks; STATED pending an isolated second read |
| GK-MONO | `proved` (`proved_informal`, same caveat) |
| `CB(1,m)` sector non-eligibility | `proved` (sector only; not (HALL)) |
| Per-choke threshold form | `refuted` in the product reading on non-eligible laboratories (bounded; not a (HALL) statement) |
| Sector-WLOG reduction | `refuted` at `CB(11,2)/16` (laboratory) |
| The CB-class (HALL) reduction U2 targeted | `still_open` |

## Next-route allocation

**Exact remaining obligation for orientation U.** Two items:
1. Close N4, `∀ j ≤ k, 0 ≤ forwardDifferenceDel (gkGraph k) ∅ j`, in Lean, which makes G-U-A a governed award.
2. On the CB pattern, prove an extremal-family theorem over sector ∪ regime-3 sources, with shared switch-image capacity, at every
   eligible rank. The per-choke product form is refuted, and any finite-inequality reduction must pass `CB(11,2)/16`.

**Routes (at most two).**
1. **U-A: `G_k` every-eligible-rank award (Lean).**
   - Carry entry 14 and C4-LA1's entries.
   - Prove N4a (block count bridge, explicit binomial form) and N4b (C-U1-F's elementary chain, in integer form).
   - Compose with N1–N3. Optionally add G-U-B for non-vacuity.
   - Obtain the isolated second read of GK-MONO first.
   - Could close in one cycle: a `formally_verified` restricted-scope (HALL) award at every eligible rank of an infinite tree
     family, with the tree face certified. This is ruling 39's (d′) instrument, provided another orientation supplies one of
     (a′)–(c′).
2. **U-B: coupled CB-pattern extremal-family theorem.**
   - Restate U2's object over sector ∪ regime-3 with shared capacity.
   - Attempt the STATED compression lemma: "`c → b` column replacement does not decrease `δ`" for the coupled network on `CB(d,m)`.
   - Validate against the unique maximizers at `CB(11,2)/16`, `CB(10,2)/14` and `CB(12,2)/17` before any uniform claim.
   - Use `Aut`-orbit keys that include each choke's degree.
   - Could close in one cycle: a `proved_informal` compression/up-set lemma, an (INV)/(SW)-type outcome-B structural statement on
     the CB pattern feeding T1's uniform (HALL) proof, or its refutation on the laboratories.

   CD-1 in Lean (G-U-C) is lower priority this late. Its payoff is an input to sector deletion bounds that the registered key
   already supplies informally.

## Artifact inventory

All my files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-adj-U/`.
Every Python run used `python3 -B`, the standard library and exact integers or `Fraction`. No `__pycache__` was created.

**Seal check**

| File | SHA-256 | Content |
|---|---|---|
| `verify_seal.py` | `9347c60f…` | capsule seal, 21 member digests, and the Stage 2/3/4 seals |

**U1 replay** (`u1/`)

| File | SHA-256 | Content |
|---|---|---|
| `u1/LeanProject/` | seeds and `Main.lean` `05c24dda…`, copied out | `.lake/packages` is a symlink to the shared pinned Mathlib |
| `u1/build.log` | `dc0fdd2f…` | cold build, 8657 jobs |
| `u1/LeanProject/AllAxioms.lean` | `d3d84e18…` | probe file |
| `u1/allaxioms.out` | `d10c16b6…` | axioms of all 26 new declarations plus C4-LA1's terminal theorem |
| `u1/LeanProject/Corollary.lean` | `32ac25a1…` | C-U1-F's file, copied |
| `u1/corollary.out` | `fc26cebf…` | axioms of both corollary theorems |
| `u1/fi_entry14.txt`, `u1/cor_entry14.txt` | both `00b93a4c…` | entry-14 byte identity |
| `u1/critF/`, `u1/critT/` | digests as in the audit | the critics' copied instruments |

**Own instruments** (`own/`)

| File | SHA-256 | Content | Result digest |
|---|---|---|---|
| `adj_gk.py` / `.out` | `87d4ff0e…` / `68273257…` | `G_k` tree, DP against closed form (`k ≤ 30`), GK-MONO and both proof chains (`k ≤ 400`, `M ≤ 300`), table literals | `2af4f8c8…`, `fails []` |
| `adj_cb.py` / `.out` | `40f3088c…` / `0b0e1dc3…` | six eligible rows with derived indicators and closed forms; `CB(1,m)`, `m ≤ 120`; `n(CB(8,2)) = 37` | `014263e7…` |
| `adj_quot.py` / `.out` | `e36e50dc…` / `59622b92…` | own `S_d ≀ S_m` orbit quotient and Dinic max-flow; five laboratory rows | `c7e76968…` |
| `adj_S.py` / `.out` | `6bdec572…` / `80600288…` | `S` via `C5LA1.aggregate`; WID check against the quotient | — |
| `adj_shape.py` / `.out` | `de482ede…` / `0215a601…` | sector maximizer uniqueness and product test | — |
| `adj_shape_full.py` / `.out` | `3b936ed5…` / `19a3a5b5…` | full-network maximizer shape | — |
| `adj_elig.py` / `.out` | `2391dc79…` / `9a4cf849…` | 28 eligible rows (`d = 1` with `m ≤ 14`; `d = 2` with `m ≤ 8`; `d = 3` with `m ≤ 7`), WID asserted, 0 deficient | `cf0140e8…` |

**Other copies.** `u2/critF/` holds a copy of C-U2-F's `quot.py`, `clib.py`, `cbfam.py`, `smallcheck.py`, `elig_scan.py` and logs.
I read these and did not re-run them; my own instrument replaced them.

**Process.** No background job was started, so none needed killing. Every `lake`/`lean` call ran in the foreground after `cd` into
`u1/LeanProject`. I wrote nothing outside this file and my scratch. I reread this adjudication before closing.
