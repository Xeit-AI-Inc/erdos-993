# Orientation Adjudication

Adjudicator of orientation U (formal / structural), r31 Cycle 2 Stage 5 (Erdős #993: a parameter-uniform switch-using Hall
certificate on CB(8,m) at the top sector-deficient rank). Portfolio: returns `U1`, `U2`, `U3` and their six cross-orientation
critiques (`C-U1-T`, `C-U1-F`, `C-U2-T`, `C-U2-F`, `C-U3-T`, `C-U3-F`). Date 2026-09-28 (by the clock, ~03:05 EDT).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded those two files and no other VerityOS subsystem. The dispatch
restricts the boot to them, and the controller owns conversation logging for this run, so I wrote no conversation log.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Dispatch** `control/dispatch/c2-stage5/DISPATCH-ADJ-U.md`: SHA-256 `449edc9ffa3a82289528f057ac94a9bed62a31b7a05309a6ae7d80b1d59f80db`.
  I checked it before reading the file, and it **matches**.
- **Capsule seal** `control/c2-adjudicator-capsules/U-PACKET-MANIFEST.json`. I recomputed it over canonical JSON without
  `seal_sha256` (sort_keys, `(",",":")`, no trailing newline) and got **`06a397c6efce79278ef7b6ca6f9bc97e715b3eac29bdf61fcc309f79b57864c5`**.
  This matches. All **24 of 24** listed files match on SHA-256 and byte count, including the three returns, the six critiques, the
  controller facts record and `sources/SOURCE-DIGESTS.json`.
- **Stage seals.** I recomputed each one:
  - Stage 2 `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4` (2,799 files) matches.
  - Stage 3 `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5` (40 files) matches.
  - Stage 4 packet `297f51b20cda73b5e0289e322e7bc7b30aba7a03a9a9911de86e91b93a09b8ec` (66 files) matches. The critics cite
    `af5d1351…`, which is the Stage 4 *dispatch* manifest, a different file that is not in my capsule.
- **Admission reports.**
  - Stage 3 is `admit`, 9/9, with no finding touching U.
  - Stage 4 is `admit`, 18/18. The recorded verdicts are C-U1-T `retained`, and C-U1-F, C-U2-T, C-U2-F, C-U3-T and C-U3-F all
    `retained_narrowed`.
  - The digests in the admissions equal the capsule's.
- **Carried sources, verified against `sources/c1-results/SOURCE-DIGESTS.json`.**
  - The C1-LA3 `lakefile.toml`, `lake-manifest.json` and `lean-toolchain` all match.
  - The C1-LA2 `lakefile.toml`, `lake-manifest.json` and `LeanProof/Main.lean` (`a906ec17…`) all match.
  - The C1-LA3 `Main.lean` (`c0605e12b913…3f011`, 18,989 bytes) is the **exact byte prefix** of U1's `Main.lean`.
- **Seat and critic scratch digests (recomputed; each equals its inventory):**

  | File | SHA-256 |
  |---|---|
  | U1 `Main.lean` | `40789438…dcbe` |
  | U2 `Main.lean` | `a03e15f3…81d2c` |
  | U3 `U3.lean` | `bacc4808…9e9e0` |
  | C-U1-T `CriticS5.lean` | `300b6bd8…8745` |
  | C-U3-T `CriticU3T.lean` | `b2f134b8…daae` |
  | C-U3-T `CriticU3T2.lean` | `74a1c05c…f3c` |
  | C-U2-T `Critic.lean` | `0837cc7a…39f2` |
  | C-U2-F `Critic.lean` | `7d174e18…fdb3` |
  | C-U1-T `lean_s5_log.txt` | `fecb63b0…1e0` |
- **Controller facts** CF2-U-1..4 were read as facts, never as authority.
  - For CF-C2-G I confirm that every U artifact uses the contract's `G = (1+2x)^8 + x(1+x)^8`. My literal instrument, below,
    reproduces `I(CB)` with it.
  - For CF2-U-3 I did **not** run U3's `replay-U3.sh`, which contains `rm -rf`, and I ran no seat's replay script.
- **Read-boundary disclosures (this adjudicator).**
  1. The harness injected the project `CLAUDE.md`, the user memory index and the user's email into my context. I did not fetch them
     and did not use them.
  2. My first shell call printed a zsh `=====` separator error, which had no effect.
  3. I ran non-recursive `ls` of the granted scratch directories `c2-U1/…`, `c2-crit-U1-T/…` and `c2-crit-U3-T/…`, and of the two
     C1 award `LeanProject/` directories under `sources/`.
  4. To create my output directory I ran one `ls` of `cycles/cycle-2/stage5/adjudicators/`. It displayed a sibling directory named
     `T`, which I did not open.
  5. `pgrep` was scoped to the literal path `scratchpad/c2-adj-U` only.
  6. I read no other orientation's returns, critiques or adjudications, and no `C2-WORKER-COMMON-BRIEF.md`.
  7. I used no network and installed no packages. I never ran `lake update` or `lake clean`, and I ran `cd` into each pinned project
     before every `lake`/`lean` call.

## Route-by-route decisions

### U1 — `C2-U-01 FORMAL-ELIG-TOP-PARENT-DESCENT`: **retained_narrowed**

My replay: P1, copy-out-first. The project files come from `sources/` (C1-LA3), and U1's `Main.lean` and C-U1-T's `CriticS5.lean`
are unmodified. `lake build LeanProof` gives `Build completed successfully (8658 jobs)` with **0 errors**. `LeanProof.Main` built in
28 s. `#print axioms` returns `[propext, Classical.choice, Quot.sound]` on `cb8_block_identity`, `cb8_coeff_diff`,
`cb8_tail_blocks_nonneg` and `cb8_elig_top_a_conditional`.

The paired critics disagree on one point, which I resolve claim by claim below.

- **Nodes (1), (3), (4) and the carry.** Both critics confirm them and my replay confirms them. `hS5 : 0 < cb8S5 m` is a proper,
  non-circular sub-statement: blocks `j ≤ 5` plus the tail, with `j ≥ 6` taken from the carried C1-LA3 entry 21 within its scope
  `5 ≤ j ≤ m`. **Retained.**
- **"(E)" in the route verdict.** C-U1-T calls the verdict `retained` and says the return "correctly does not claim otherwise in its
  verdict". C-U1-F strikes it.
  - The verdict line reads "a genuine conditional proof of (ELIG-top)(a)/(E) about the closed-form polynomial".
  - The Lean contains no `α`, `crossingIndex` or eligibility statement.
  - **C-U1-F is right on the text.** The retained statement is narrowed to: (ELIG-top)(a) for `cb8I`, conditional on `hS5`.
- **"The 51 shifted-coefficient signs are independently confirmed … this return's replay."** Both critics strike this, and they
  agree. Neither U1 script computes `N_5` or a shift. **Struck.** The fact is true, on critic evidence (see below).
- **Other literals.**
  - "56-digit coefficients" is struck (C-U1-T).
  - "reproduces … `n`" is struck (C-U1-F). U1 never computes `n`.
  - "a second, independent code path" is narrowed (C-U1-F).
  - "179 new lines" should read 180. This is immaterial.
- **The node-(2) remaining obligation is superseded by a critic-derived advance (C-U1-T), which I replayed.**
  - `E993Transport.CriticU1T.cb8S5_pos (m) (hm : 107 ≤ m) (hmod : m % 3 = 2) : 0 < cb8S5 m` and
    `CriticU1T.cb8_elig_top_a : (cb8I m).coeff ((16*m+4)/3 − 1) < (cb8I m).coeff ((16*m+4)/3 − 2)` both compile. The
    `CriticS5` module took **395 s** (433 s wall under contention), and `#print axioms` gives the standard three for both.
  - There is no `sorry`, `admit`, `native_decide` or `decide` in the file.
  - The file sets these options: `exponentiation.threshold 2000`; `maxHeartbeats 0` on 21 declarations; and
    `maxRecDepth 20000` on the final step.
  - I parsed the statement of `cb8Poly_pos` from the file text. It has **51 literal coefficients, all positive, on exponents 0..50**,
    and is closed by `positivity` over `u : ℕ`. There is no enumeration.
  - The mathematics is a denominator-free factorial normalization: `C(n,k)·L1!·K1! = N0!·(46 linear factors in u)` for all 254
    binomials of `S_5`.
- **C-U1-F's partial advance.** It proved steps 1, 2 and 4 in Lean and estimated step 3 at 25–35 min by a Horner chain. There is no
  disagreement of substance. Its measurement that a monolithic or per-block `ring` is infeasible agrees with C-U1-T's report that
  per-block scaling was super-linear. C-U1-T's per-binomial split is the design that closes. C-U1-F's Lean is superseded as a route,
  but it stands as a **second, independent symbolic derivation**: its primitive `N_5` digest `893a21b6…51f7` equals the one produced
  by C-U1-T's symbolic script, which I replayed copy-out (outputs byte-identical: `0237d0b3…`, `1e4e58d7…`; `Poly(u)` = `f75d2f19…`).
- **The sign change.** Both critics agree, and my replay shows it: `N(t) < 0` for `t = 1..32` and `N(t) > 0` from `t = 33`
  (`m = 101`). The class starts at `t = 35`.
- **Gate lines.** `ELIG_formal: advanced` (both agree), `HALL_formal: not_advanced`, `FAV_darroch_free: not_advanced`,
  `cut_candidate: none`.

### U2 — `C2-U-02 FORMAL-CB-SECTOR-COMPOSITION-INSTANTIATION`: **retained_narrowed**

My replay: P3. U2's `Main.lean` is a byte prefix of both critics' `Critic.lean` files. I compiled both with `lake env lean`: each took
about 24 s with exit 0, and `#print axioms` is standard on all 5 of U2's theorems plus `sdiff_rv_eq_biUnion` and all 9 critic lemmas.

- **Part A** (`weightedHall_of_ratFlow_bound`, `exists_saturatingFlow_of_ratFlow_bound`). Both critics hold it generic,
  non-duplicative and correctly hypothesised, and both searched the frozen Lean. **Retained.**
- **Parts B and C** (choke-state extraction, and the leg count `Σ(β+γ) = |B| − 2` at any cardinality). Both critics confirm them.
  **Retained.**
- **Part D.** Both critics narrow it. `sector_out_ge_one` is C1-LA1's template `Out` evaluated at the literal state vector. It is
  not the outflow of any literal flow. **Narrowed.**
- **"m ≥ 107 enters via `cb8_sum_out`."** Both critics strike this. `cb8_sum_out` takes only `m % 3 = 2`. **Struck.**
- **Grade literals "formally verified as stated."** C-U2-T strikes them, and C-U2-F rules the declarations scratch with no grade.
  **Struck:** compiled scratch has no grade.
- **Carry literals (partial divergence, resolved).**
  - C-U2-T narrows "C1-LA1's full `Main.lean` byte-identically" to "entries 1–33 byte-identical", because the 166-byte header is
    absent. C-U2-F calls the same fact "backed". The literal says *full*, so **narrowed** as C-U2-T says.
  - C-U2-F strikes "r30 0001–0021 … the *same* carried layer". The digests of 0014–0021 differ, at wrapper level. C-U2-T notes only
    that those entries are absent under ruling 12. Both are true. **The literal is struck.**
  - Consequence: in this file the carried companion 0030/0031 is re-kernel-checked against r31 C1-LA2's definitions. It is not
    covered by r30's receipt.
- **(WID) analogy** (C-U2-F F-4): **struck**.
- **Replay log** (C-U2-F F-3): the log shows the axioms block twice, so it is not a single-run transcript. The evidence rests on the
  critics' rebuilds and mine.
- **The remaining obligation is not exact** (C-U2-F F-5). It omits the zero-flow target classes, including the literal non-sector
  `u = r` two-for-one arcs into in-sector targets, the weight identifications, the arc-sum identities and the E1 hypothesis shape.
  C-U2-T's list is compatible with this. **Their union is adopted** under `## Next-route allocation`.
- **Critic-derived advances (critic-attributed; compiled scratch; no grade).**
  - `sector_in_le_one` was proved **independently by both critics**. It closes U2's obligation 1.
  - C-U2-T proved `choke_nbr_inter_card` and `sector_switch_iff`: a sector `u_i`-insertion is a literal switch arc iff `β_i = 1`.
    It also proved `sector_switch_transportRel`.
  - C-U2-F proved `critic_sector_activeWeight_eq_one` (`w = 1` on sector sets under `F = leafSet`),
    `critic_switch_image_activeWeight` (`w = γ_i` on `u_i`-switch images), `critic_switch_mem_transportRel` and
    `critic_isSectorSource_pair`.
  - C-U2-T's literal-versus-template `Out`/`In` equality on 450 sampled objects at `m = 107..119`, and its two-sided (WID), are
    **bounded, critic self-reported**. I did not replay them, and they carry no weight beyond `bounded_computation`.
- **Gate lines.** `HALL_formal: advanced`, as infrastructure (both critics agree). `ELIG_formal: not_advanced`.
  `FAV_darroch_free: not_advanced`. `cut_candidate: none`.

### U3 — `C2-U-03 FORMAL-CB-INDEPENDENCE-POLYNOMIAL-CLOSED-FORMS`: **retained_narrowed**

My replay: P2, copy-out-first, with the C1-LA2 project from `sources/`, U3's file and C-U3-T's two files. `lake build` succeeds
(8,660 jobs, 44 s wall). I ran my own `#print axioms` audit (`AdjAuditP2.lean`) on **all 31** theorems of `U3.lean`,
`CriticU3T.lean` and `CriticU3T2.lean`: every one is `[propext, Classical.choice, Quot.sound]`. There is no `sorry`, `decide` or
`native_decide`. `CriticU3T2.lean` carries five `maxHeartbeats 4000000` settings.

- **Node 0** (`indepSetCount_succ_split`). Both critics confirm it, one with a brute-force check. **Retained.**
- **Theorems 2–4** (leaf corollaries). C-U3-F says they are off the closed-form path, and C-U3-T concurs (A2). **Narrowed:** only
  Node 0 is load-bearing.
- **Gate line `ELIG_formal: advanced` (the disagreement).** C-U3-F strikes it to `not_advanced`. C-U3-T keeps `advanced` but states
  that "judged on the return's own theorems alone, the line would be `not_advanced`." Resolved:
  - **for the return: `not_advanced`**;
  - **for the orientation: `advanced`**, attributed to C-U3-T's critic-derived closed-form link, which I replayed.

  The two critics do not disagree on any fact.
- **"198 lines after the import."** Both critics strike it, and I agree: the file has 198 lines in total. **Struck.**
- **Remaining obligation item 3, `G_c` versus `G'`** (C-U3-T A3). **Correction stands.** The damaged branch of the `H`-residual
  `I(CB − {c_ij, b_ij})` has factor `G' = (1+2x)^7 + x(1+x)^7`. `G_c` belongs to `I(CB − c_ij)`, and `G − G_c = x·G'`, which I
  checked by hand.
- **Critic-derived advance (C-U3-T; replayed).** These all compile:
  - the generic binary convolution, and `critU3T_indepPoly` with `coeff = indepSetCount`;
  - the `m`-ary product;
  - `critU3T_cb_indepPoly_closedForm`: `I(cbGraph m) = (1+2X)·G^m + X·(1+X)(1+2X)^{8m}` over `ℕ`, for **every** `m`;
  - `critU3T_cb_indepSetCount_eq_coeff`: the literal count equals the closed-form coefficient;
  - `critU3T_cb_minus_v_closedForm` and `critU3T_cb_vertexDeletion_v_eq_coeff`;
  - `critU3T_cb_conjunct2_of_coeff`: for `m ≥ 107`, closed-form `coeff_{p*−1} < coeff_{p*−2}` implies
    `crossingIndex (cbGraph m) + 2 ≤ p*`, through `Nat.find_le` on the carried entry-22 definition.
- **C-U3-F's advance** (generic convolution `crit_indepSetCount_eq_sum_antidiagonal_of_noCross`, `crit_cb_root_split`,
  `crit_cb_peel_gadget`). It is correct by the critic's own build, but I did not replay it, because C-U3-T's complete product
  supersedes it. It stands as an independent second formalization of the convolution step.
- **Hygiene.** The replay script contains `rm -rf` (CF2-U-3) and does not assert digests (C-U3-F finding 7). The seat's disclosures
  are as indexed: an out-of-grant skill read, a transient `/tmp` write, and a `/tmp` glob listing (C-U3-F finding 6). None touches
  the evidence.
- **Gate lines.** For the return: `ELIG_formal: not_advanced`, `HALL_formal: not_advanced`, `FAV_darroch_free: not_advanced`,
  `cut_candidate: none`.

## Cross-route reconciliation

**The U1/C-U1-T chain and the U3/C-U3-T chain compose.** I built the composition myself, which C-U3-T's remaining item 1 anticipated.
Project P4 contains:
- U1's `Main.lean` (C1-LA3 carry) and `CriticS5.lean`, both unmodified;
- C1-LA2's `Main.lean`, unmodified bytes, as module `LeanProof.LA2Main`;
- `U3.lean`, with its first line changed to `import LeanProof.LA2Main` (the only edit; its digest in P4 is `ebdeca10…`, and the
  unmodified file was built in P2);
- `CriticU3T.lean` and `CriticU3T2.lean`, unmodified;
- my `AdjCompose.lean` (`fc8d40bc…`).

`lake build` succeeds with 8,663 jobs and 0 errors. The `CriticS5` object was reused from P1 by copying `.lake/build`, and it was
elaborated there from byte-identical sources. `AdjCompose` adds the following, each with `#print axioms` =
`[propext, Classical.choice, Quot.sound]`:

- `AdjU.cb8I_eq_map`: `cb8I m = map (Nat.castRingHom ℤ) (C-U3-T's ℕ closed form)`, proved by `simp` and `ring`. This is the only new
  mathematics, a cast bridge. There is also the helper `AdjU.cb8I_coeff_cast`.
- **`AdjU.cb8_crossingIndex_add_two_le (m) (hm : 107 ≤ m) (hmod : m % 3 = 2) : C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16*m+4)/3`**.
- **`AdjU.cb8_topRank_conjuncts_1_2_3`**: `(cbGraph m).IsTree ∧ crossingIndex + 2 ≤ p* ∧ 3p* < 2·indepNum + 1` on the class.
- **`AdjU.cb8_topRank_of_flow`**: the SOLUTION-CONTRACT §2 terminal, verbatim, from **conjunct 4 alone**, via the carried
  `cb8_topRank_of_descent_and_flow`.

Attribution: the parent descent is U1's (nodes 1, 3, 4) and C-U1-T's (node 2). The closed-form link is C-U3-T's, with U3's Node 0.
The tree, `indepNum` and terminal reduction are C1-LA2's. The block-descent tool is C1-LA3's. The composition and cast bridge are
this adjudicator's. **In compiled scratch, (E) of Tier 1 now holds on the literal `cbGraph m` for every class `m`, and the terminal
is reduced to conjunct 4.**

**Other reconciliations.**
- **U2 and the T3 interface (CF2-U-2).** The two U2 critics independently give the same consumable shape for the E1 flow:
  - a `ℚ`-valued function on literal pairs, `≥ 0`;
  - supported on deletions and zero on sector rows;
  - rows at least `activeWeight` on non-sector sources;
  - columns zero on in-sector targets and at most `activeWeight` elsewhere;
  - at most `ρ_1·γ` on `u_i`-switch images, **with `ρ_1` stated as `cb8R1 m K / cb8R1 m (K−1)`**, `K = (16m+1)/3`, or else with a
    bridge lemma.

  I cannot read T3's statement. The controller fact that T3's repaired statement compiles with one `sorry` for the transport
  construction is a fact, never authority. The synthesis should check it against this shape.
- **Favorability (CF2-U-1).** C-U3-T's `critU3T_cb_vertexDeletion_v_eq_coeff` is the formal link for the arm leaf `v`. The link
  `I(cbGraph m − c_ij)` is open in my portfolio. The Darroch/Newton-free Lean descents that CF2-U-1 attributes to T- and F-critics
  are outside my portfolio and ungraded here.
- **Darroch/Newton.** Neither is used anywhere in the U portfolio: not in the three returns, the six critiques or my composition.

## Established results

Grades follow SOLUTION-CONTRACT §4. A compiled scratch declaration has **no grade** until its governed award closes. Critic-derived
results are **critic-attributed**.

**Exact theorems, compiled sorry-free in scratch, replayed by me (standard axioms):**
1. `cb8_block_identity` (every `m : ℕ`) and `cb8_coeff_diff` (hypothesis `m ≤ L`). **U1.**
2. `cb8_elig_top_a_conditional`: hypotheses `107 ≤ m`, `m % 3 = 2`, `0 < cb8S5 m`. **U1.**
3. `CriticU1T.cb8S5_pos` and `CriticU1T.cb8_elig_top_a`: **(ELIG-top)(a) for the closed form, for every `m ≥ 107`, `m ≡ 2 (mod 3)`,
   unconditionally.** The explicit `M_0` is the class endpoint `107`, and the certificate holds from `t = 33`. It is Darroch/Newton-free.
   **Critic-attributed (C-U1-T).**
4. `indepSetCount_succ_split` (generic vertex split). **U3.**
5. `critU3T_cb_indepSetCount_eq_coeff`, `critU3T_cb_vertexDeletion_v_eq_coeff` and `critU3T_cb_conjunct2_of_coeff`. The closed forms
   are graph identities for every `m`, and the bridge holds for `m ≥ 107`. **Critic-attributed (C-U3-T).**
6. `AdjU.cb8_crossingIndex_add_two_le`, `AdjU.cb8_topRank_conjuncts_1_2_3` and `AdjU.cb8_topRank_of_flow` on the class.
   **Adjudicator composition** of items 2, 3 and 5 with carried C1-LA2. **Attribution:** U1, C-U1-T, U3 and C-U3-T, with the
   adjudicator's cast bridge.
7. U2 Part A (generic rational flow ⇒ (HALL) ⇒ integral saturating flow) and Parts B–D. Also the U2 critics' lemmas: in-sector
   template `In ≤ 1`, the switch arc iff `β_i = 1`, `w = 1` on sector sets, and `w = γ_i` on switch images. These are
   **infrastructure for conjunct 4**, partly critic-attributed.

**Informal grades (unchanged by this stage).** The ELIG key
`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
stays `computer_assisted` (a fixed positivity certificate, ruling 10) until the governed award closes. The certificate now sits inside
a kernel-checked proof. The composition to (HALL) stays `proved_informal` (R-2). Tier 1 stays `computer_assisted` as registered.

**Bounded computations (never proof).** My instrument `adj_literal.py` uses a literal edge list and a generic tree DP, with no closed
form:
- at `m = 95, 107, 110, 113, 116, 119`: literal `I`, `I(T−v)` and `I(T−c_{00})` equal the contract closed forms;
- at the class rows: `α = 9m+1`, `x = p* − 2` exactly, both eligibility inequalities hold, and `i_{p*−1} < i_{p*−2}`;
- the fixed points `CB(8,107)` (`n = 1822, α = 964, x = 570`) and `CB(8,95)` (`n = 1618, α = 856, x = 506`) are reproduced;
- output digest `09a609b6…`.

The critics' rows extend this to `m = 137`. Zero slack at `x = p* − 2` (C-U3-T A7) means the formal statement proves exactly the
needed descent.

**Imported, at their grades.** C1-LA1, C1-LA2 and C1-LA3 are `formally_verified` at their scopes. The r30 0031 companion is carried,
and in U2's file it is re-kernel-checked against r31 definitions.

**Record corrections.** These are the struck and narrowed literals under `## Route-by-route decisions`, together with the `G_c → G'`
correction for U3 item 3.

**Open bridges.** Conjunct 4 in Lean, and the favorability link for `c_ij` (see `## Lean readiness`).

## Rejected and narrowed mechanisms

- U1's planned node-(2) route (falling-factorial ratios, a common denominator, then one `ring` per block) is **superseded**. The
  denominator-free factorial normalization closes the node. A monolithic 256-term `ring` did not finish in 15.5 min (C-U1-F). That is
  a failure of a tactic design, not of the mathematics.
- U1's "(E)" claim was narrowed to (a) on `cb8I`. My composition now supplies (E) on `cbGraph` separately.
- U2 Part D was narrowed to template `Out` at literal states. Three things were struck: "discharges conjunct 4 in one line", the
  (WID) analogy, and the `m ≥ 107` attribution.
- U3's leaf corollaries were narrowed as off the critical path. The `G_c` label on the `H`-residual was corrected to `G'`.
- No refuted mechanism is revived (SOLUTION-CONTRACT §3.6). There is no real-rootedness claim about `I`, `G` or `G^m`, and no
  `m`-independent per-choke certificate. The `θ*` law is never a hypothesis.
- No template failure and no cut were reported or found in the U portfolio.

## Lean readiness

**Award group U-A: "(E) on the class, conjuncts 1–3 of the terminal" (with the closed-form (ELIG-top)(a) as a sub-award). It is
CONTRACT-READY.**

- **Exact statement** (terminal statement, compiled in P4):
  ```lean
  theorem cb8_topRank_conjuncts_1_2_3 (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
      (cbGraph m).IsTree ∧
      C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
      3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1
  ```
  It has two companions on the face:
  - `cb8_topRank_of_flow`, the terminal from conjunct 4 alone;
  - `cb8_elig_top_a`, `(cb8I m).coeff (p*−1) < (cb8I m).coeff (p*−2)`.
- **(a) The informal DAG is closed at statement granularity.** Its nodes are:
  - the vertex split at `r`;
  - the component products, which give the closed form, and so literal counts equal closed-form coefficients;
  - the block identity, which gives the difference identity;
  - (BD) for `j ≥ 6` (C1-LA3 entry 21);
  - `S_5 > 0` by factorial normalization (254 binomials, a degree-50 `Poly(u)` with 51 positive coefficients);
  - first-descent minimality (`Nat.find_le`);
  - `indepNum = 9m+1` (C1-LA2 entries 64–66, 71).
- **(b) The compiled fragments cover every node sorry-free.**
  - Carried:
    - C1-LA3 entries 1–21 (`Main.lean` `c0605e12…3f011`);
    - C1-LA2 entries 1–78 (`Main.lean` `a906ec17…f5f3f`), including 22 `crossingIndex`, 66 `cbGraph_indepNum_eq`, 71
      `cb_lowWindow` and 78 `cb8_topRank_of_descent_and_flow`.
  - New:
    - U1: `cb8G`, `cb8I`, `cb8P`, `cb8S5`, `cb8_term_eq`, `cb8_block_identity`, `cb8_term_coeff`, `cb8_coeff_diff`,
      `cb8_tail_blocks_nonneg`, `cb8_elig_top_a_conditional`;
    - U3: `indepSetCount_succ_split`;
    - C-U1-T: `CriticS5.lean` (2,742 lines, generated by `gen_lean_s5.py` `53d4731b…`, which asserts its polynomial against
      `crit_u1t_Poly_u.json` `f75d2f19…`);
    - C-U3-T: `CriticU3T.lean` and `CriticU3T2.lean`;
    - adjudicator: `AdjU.cb8I_eq_map`, `cb8I_coeff_cast`, `cb8_crossingIndex_add_two_le`, `cb8_topRank_conjuncts_1_2_3`,
      `cb8_topRank_of_flow`.
- **(c) Open nodes: none.**
- **Fences.**
  - One rank `p*`, class `m ≥ 107`, `m ≡ 2 (mod 3)` only. Nothing at other ranks, residues or `d`.
  - (H) is not claimed. FLOW ⇒ SIGN is not invoked, and no aggregate or (HALL) status is transferred.
  - The award is the **formalization of the registered ELIG key** and of the r30 closed-form node. It must not be registered as a new
    `E993-R31-` identity, because it would alias them.
  - Decisive event (a) needs conjunct 4 as well.
- **Preconditions for the governed award.**
  - Freeze `expected_statement`.
  - Merge the two carried layers into one project with re-keyed entry markers, since both number from 1 (C-U2-F finding 8 applies).
  - Record every option: `maxHeartbeats 0` ×21, `exponentiation.threshold 2000`, `maxRecDepth 20000`, `maxHeartbeats 4000000` ×5 and
    `maxHeartbeats 1000000` ×2.
  - Ship the generator with its assertion.
  - Get an isolated second read of (i) the factorial normalization and (ii) the `Polynomial ℕ` closed-form encoding.
  - Build time: about 7 min wall.

**Award group U-B: "conjunct 4 on `cbGraph m`, conditional on the E1 flow and favorability." It is NOT READY.**
- Compiled nodes: Part A (`exists_saturatingFlow_of_ratFlow_bound`), Parts B–D, `sector_in_le_one`, `sector_switch_iff`,
  `sector_switch_transportRel`, `critic_sector_activeWeight_eq_one` and `critic_switch_image_activeWeight`.
- Open nodes:
  1. the literal `g_sec : Finset → Finset → ℚ` and its support;
  2. the Out arc-sum bridge;
  3. the In arc-sum bridge, with zero flow on the non-sector `u = r` arcs, the `u = s` and `(1,0)` switches, and the other classes;
  4. the `8 − γ` preimage count and the switch-image load `(8−γ)σ(γ) ≤ θγ`;
  5. the E1 hypothesis in the shape above, with `ρ_1` in `cb8R1` form;
  6. the rewrite `favorableLeaves = leafSet` through the carried `favorableLeaves_eq_leafSet_of_all`.
- **Smallest unproved lemma:** for a sector source `B` with `|B| = p*+1`,
  `Σ_{A ∈ I_{p*}} g_sec B A = Σ_i cb8Out m (chokeState m B _ i)`. This needs target distinctness across `(i, j, kind)`.

**Award group U-C: "favorability in Lean", which discharges U-B's favorability hypothesis. It is NOT READY.**
- The arm-leaf link is compiled (`critU3T_cb_vertexDeletion_v_eq_coeff`).
- **Smallest unproved lemma:** the closed form
  `I(cbGraph m − c_ij) = (1+2X)·G_c·G^{m−1} + X(1+X)^2(1+2X)^{8m−1}`, with `G_c = (1+2X)^7(1+X) + X(1+X)^7`, as a Lean identity.
  Then the descent inequalities, which are T/F-orientation objects outside this portfolio.

A bounded result qualifies for none of these groups.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

- (ELIG-top)(a), one of the two Tier 2 principal lemmas, entered Cycle 2 at `computer_assisted` with no formal proof of its
  certificate. It now has a complete, Darroch/Newton-free, kernel-checked proof in scratch for every class `m` (critic-attributed,
  C-U1-T).
- It is linked to the literal `cbGraph m` (C-U3-T), and the adjudicator's replayed composition gives (E) and conjuncts 1–3 of the
  terminal on the class.
- That is an advance on the gate object `ELIG_formal`, so the ruling-15 plateau condition is not met for this orientation.
- `HALL_formal` advanced as infrastructure only.
- Neither decisive event occurs. For (a), conjunct 4 is open in Lean. For (b), no eligible deficient cut exists in the U portfolio.

## Headline assessment

headline_resolved: no
status: still_open

At the U orientation's evidence grade, per statement:

- **Tier 1 (E): established.** Conjuncts 1–3 on the literal `cbGraph m`, for every `m ≥ 107`, `m ≡ 2 (mod 3)`, are compiled
  sorry-free in scratch and replayed by me. The registered grade is unchanged (`computer_assisted`) until a governed award.
- **Tier 1 (H): not established by this orientation.** Conjunct 4 is open in Lean. Informally it stands at the entering record
  (`proved_informal` composition, modulo Darroch/Newton through the favorability key), which I did not re-verify. So Tier 1 as a
  whole is `still_open`.
- **(ELIG-top)(a): proved at scratch-formal level.** The mathematics is complete and kernel-checked for every class `m`, and a
  governed award is needed for any grade.
- **(L-S)_top:** its template feasibility is `formally_verified` (C1-LA1, entering). Its literal-network composition is
  `proved_informal` (R-2). This cycle added only compiled scratch nodes (U-B), so it is still open at the formal level.
- **Refutation:** none. No eligible deficient cut was proposed or replayed.

## Next-route allocation

**The exact remaining obligation for the U orientation** is terminal conjunct 4 in Lean:
`∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves (cbGraph m) p*) p* f` for every class `m`. Via `AdjU.cb8_topRank_of_flow` this
yields the SOLUTION-CONTRACT §2 terminal. It needs three things:
- (i) the E1 deletion flow as a literal `ℚ` arc function with the eight clauses above;
- (ii) the sector `g_sec` and its Out, In and switch-image bridges;
- (iii) favorability in Lean.

The governed award for U-A is also owed.

**Next-cycle routes:**
1. **`FORMAL-AWARD-ELIG-TOP-AND-CONJUNCTS-1-3`** (the governed lean-proof workflow on U-A). It could close (ELIG-top)(a) and (E) at
   `formally_verified` in one cycle, which would upgrade the registered ELIG key. The artifacts already compile, in about 7 min.
2. **`FORMAL-CB-SECTOR-FLOW-LITERAL-BRIDGES`** (U-B). This defines `g_sec`, proves the Out/In arc-sum bridges, the `8 − γ` preimage
   count and the zero-flow case split, and states E1 as a named hypothesis in the agreed shape. It could close in one cycle the
   theorem "conjunct 4 from (E1 hypothesis ∧ favorability)", and with it the full terminal conditional on those two inputs.
3. **`FORMAL-CB-LEAF-DELETION-CLOSED-FORMS-AND-FAVORABILITY`** (U-C). This proves the `I(cbGraph m − c_ij)` closed form and composes
   it with a Darroch/Newton-free descent theorem after that theorem's second read, giving `favorableLeaves (cbGraph m) p* = leafSet`
   in Lean. It could close in one cycle and would remove the last Darroch/Newton dependency of Tier 1.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-adj-U/`. Every
project binds `.lake/packages` by manual symlink to the pinned shared project.

| Path | SHA-256 | Role |
|---|---|---|
| `P1/` (C1-LA3 project files; U1 `Main.lean` `40789438…`; C-U1-T `CriticS5.lean` `300b6bd8…`; `LeanProof.lean` mine) | — | unmodified replay of U1 and C-U1-T |
| `P1_build.log` | `91e64ecef8e9f1b55dc6a2066f1a35b19dcd4e87eeec13c5ed5a45670c83712b` | build: 0 errors, `CriticS5` 395 s, axioms standard, `real 433.22` |
| `P2/` (C1-LA2 project; `U3.lean` `bacc4808…`; `CriticU3T.lean` `b2f134b8…`; `CriticU3T2.lean` `74a1c05c…`) | — | unmodified replay of U3 and C-U3-T |
| `P2_build.log` | `39b091f6a7c72b0fd92dc674e89f7d8b17fab8a6a88c412a20ad6332544fcab5` | build success (8,660 jobs), `real 44.32` |
| `P2/LeanProof/AdjAuditP2.lean` | `21129d288e465e146284b6d18a3bc327c6c5d322da5704bbe21d2dd5eaf3833c` | axiom audit, 31 theorems |
| `P2_axioms.log` | `0040e76d5df77c7f70d9672e6ca09053694ccf65c70b569460754344083be7d4` | 31 × standard axioms |
| `P3/` (U2 `Main.lean` `a03e15f3…`; `CriticT.lean` = C-U2-T `0837cc7a…`; `CriticF.lean` = C-U2-F `7d174e18…`) | — | replay of U2 and its critics |
| `P3_CriticT.log` | `8e7a62618db65b17528bffdd33b597ff28d66589bca9eea3ffeded40e561031b` | exit 0, axioms standard |
| `P3_CriticF.log` | `9f00837b7e27ab9e5e233ab78866b6a37f5ed51d48316e0b94a8a2b88ad68354` | exit 0, axioms standard |
| `P4/LeanProof/AdjCompose.lean` | `fc8d40bc2e1cad0e40ddd68dfc5018a48280920f5420e21de58264b501f39fb8` | adjudicator composition (cast bridge, conjunct 2, conjuncts 1–3, terminal ⇐ conjunct 4) |
| `P4/LeanProof/U3.lean` | `ebdeca10fa1c37922124d3b9ced8e331b41f4e5db6446eaa81d90db2b243dd0e` | U3's file with one import line changed (disclosed) |
| `P4/LeanProof.lean` | `6a99b36564535fa5c9408b7963da5a705fb6c6b9b58adab5743ad5eacb227e89` | P4 root |
| `P4_build.log` | `02eb9a863a1fbb5788eabceecca80736f91947250d245a0c6394783761e16bea` | build success (8,663 jobs), 4 `AdjU` axiom lines standard, `real 45.04` |
| `adj_literal.py` | `5a5c99d9f90ee0b37c6d7cbe0c5d4492d88f18dfd8f4d3a4bfeea10812a1146f` | own instrument (stdlib, exact integers) |
| `adj_literal_out.txt` | `7fc48eac4e46b4338180f2f3607e2e1eb6bfaf90a0dedee27f5d128226c71530` | rows 95–119 (payload `09a609b6…`) |
| `replay-crit-U1-T/` | `sym_out.json` `0237d0b3…`, `fac_out.json` `1e4e58d7…`, `crit_u1t_N5_coeffs.json` `dc50469a…`, `crit_u1t_Poly_u.json` `f75d2f19…` | copy-out replay of C-U1-T's symbolic and factorial-form scripts (byte-identical to the originals) |

**Background jobs.** I ran three Lean builds in the background: P1 (PID 42373), P2 (PID 42375) and P4 (its PID recorded in
`P4.pid`). Each was polled by literal PID and had exited before this write. `pgrep -f scratchpad/c2-adj-U` finds no process. No job
of mine is running.
