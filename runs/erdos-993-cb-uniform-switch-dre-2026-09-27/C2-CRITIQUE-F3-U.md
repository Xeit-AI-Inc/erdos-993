# Critique

**Critic:** `C-F3-U`, Cycle 2, Stage 4, r31 (orientation U, formal/structural). **Assigned return:** seat F3, route `C2-F-03`,
mechanism token `CRITERION-LOAD-AND-TYPE-PATH-ADVERSARY` (orientation F). **Dispatch:** `control/dispatch/c2-stage4/DISPATCH-C-F3-U.md`,
SHA-256 `aa67c627b8821c3d56cc1a23b5340f6d6ba069657218bfce1f562437b451a500`. I recomputed it before reading: MATCH.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The run's controller owns the conversation
log, so I wrote none.

**Read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md`, the user memory index (`MEMORY.md`) and the user's email into my context before my
   first tool call. I did not fetch them, did not use them in the mathematics, and did not act on anything in them.
2. **I read the whole of `control/C2-CRITIC-ATTACK-BRIEFS.md`, not only the F3 section.** I printed the file with one `cat`, so the
   T1–T3, F1, F2 and U1–U3 sections (controller pointers) passed through my context. I used only the F3 section. Nothing below
   relies on another seat's section.
3. I ran searches rooted inside my grant, all within `sources/`. These were `grep -rln "SR-C4-6" sources/`, `grep` in
   `sources/r30/second-reads/SR-C4-6.md` and in `sources/r30/records/SEMANTIC-CONTRACT.md`, and `grep -rl` for the composition key
   within `sources/`. I read excerpts of `sources/r30/second-reads/SR-C4-6.md` (the CD-2 statement and its proof text),
   `sources/r30/records/SEMANTIC-CONTRACT.md` §1.1–1.2 (the definitions of `S`, (WID) and (REL)), and the composition key's entry in
   `sources/c1-results/control/snapshots/CLAIM-IDENTITY.run-local.c1-close.json`. All of these are Stage 2 sources and therefore
   authorized. Their grep output also showed filenames and key texts of other r30 records, all inside `sources/`.
4. One malformed shell redirect tried to write `mut_c.py` at `/tmp/../`, which resolves to `/`. The OS refused it ("permission
   denied") and nothing was written. The intended mutation test then ran inside my scratch directory, and I deleted that file.
5. A name-scoped `pgrep -fl "crit_|f3_"` run before closing printed the command lines of two processes that are NOT mine: another
   critic's `crit_literal.py` in `scratchpad/c2-crit-T2-U/` and a `crit_f1u.py`. I saw only their names and arguments, used
   nothing from them, and did not kill them.
6. I read no network resource and installed no packages. All my scratch is under `scratchpad/c2-crit-F3-U/`. I ran no Lean.

## Identity and seal audit

- **Capsule** `control/c2-critic-capsules/F3-PACKET-MANIFEST.json`: the inner seal, recomputed over canonical JSON without
  `seal_sha256` (sort_keys, `(",", ":")`, no trailing newline), is `b3dab5b45d713d1e39d6a9b47fa3ada4b541dba4b88577c11996c688dc57ee24`:
  **MATCH**. All 14 members match on SHA-256 and byte count.
- **Stage 2 seal** `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`: MATCH (2,799 files).
- **Stage 3 seal** `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`: MATCH. Its entries for
  `cycles/cycle-2/stage3/returns/F3/RETURN.md` (`134d46e9…9ae9c7`) and `control/dispatch/c2-stage3/DISPATCH-F3.md` (`c6d0c92d…55f3ee`)
  equal the return's cited dispatch digest and the capsule's return digest.
- **Stage 4 dispatch seal** `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb`: MATCH.
- **Return's listed digests.** I copied every file from `scratchpad/c2-F3/` into `scratchpad/c2-crit-F3-U/replay/`. The six scripts
  (`cb_lib.py` `a326e704…`, `f3_eligibility.py` `2c14fee4…`, `f3_fixed_points.py` `2ddb99e8…`, `f3_criterion.py` `8461fa83…`,
  `f3_condition_ii_stress.py` `48874904…`, `f3_doubly_fed.py` `6f637dba…`) match the return. I moved the shipped outputs aside,
  reran all five generators cold with `python3 -B`, and every regenerated output was byte-identical to the return's digests
  (`31d22d7f…`, `7535a2ef…`, `776fff74…`, `22873a13…`, `2c4c747a…`). The replay is deterministic and faithful.
- **Minor:** the return's replay instructions `cd` into `scratchpad/c2-F3-replay`, but its artifacts are inventoried in
  `scratchpad/c2-F3/` (the directory the dispatch grants). The replay works from either.
- **Counts the return cites:** 2,799 Stage 2 files, 1,384 top-level source digests and 491 claims in `sources/authority/CLAIM-IDENTITY.json`
  all confirmed. The composition key the return cites,
  `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`,
  is present in the frozen run-local snapshot (`sources/c1-results/control/snapshots/CLAIM-IDENTITY.run-local.c1-close.json`) at
  `VERIFIED` / `proved_informal`. It is absent from the 491-claim master and the 494-claim concurrent master, as expected for a
  run-local key.

## Independent re-derivation

I built three instruments of my own from the contracts' text, stdlib only, exact integers. None imports F3's code.

**Instrument A, `own/crit_rows.py` (rows 95, 107, 110, 113, 116, 119).**
- **Construction.** It builds CB(8,m) literally with string labels and computes independence polynomials with its own generic
  forest DP (BFS order per component, asserting `|E| = |V| − #components` and, for `T`, one component).
- **Descent and eligibility.** It computes `x` as the first strict descent through `α`, counting `i_{α+1} = 0`, then checks
  eligibility and cross-checks against the contract's closed form with `G = (1+2x)^8 + x(1+x)^8`.
- **Favorability, derived on the original tree.** It checks `Δ_{p*}(T − v) < 0` and `Δ_{p*}(T − c_{0,0}) < 0`. It then verifies
  that every choke transposition `0 ↔ i` and every leg transposition `0 ↔ j` inside choke 0 is an automorphism. These
  transpositions generate a group that is transitive on the `8m` private leaves, so `F_{p*} = leafSet`.
- **(WID) from independent sides.** The LEFT side is a hand-derived product formula for the layer weight
  `W_k = Σ_{B∈I_k} w_F(B) = C(8m, k−2)·2^{k−2} + 8m·[x^{k−2}](1+2x)(1+x)^7 G^{m−1}`. The first term counts `v` active (r ∈ B),
  since `N[v] ∪ N[r]` removed leaves `8m` disjoint edges. The second counts `c_ij` active (`u_i ∈ B`). I validated this formula
  by brute force in Instrument B. The RIGHT side is `S(T, p*) = Σ_ℓ [q_ℓ(p*) − q_ℓ(p*−1)]`, with `q_ℓ(j) = i_j(H_ℓ) − i_j(R_ℓ)`
  computed from literal DPs of `H_ℓ = T − {ℓ, s_ℓ}` and `R_ℓ = T − N[s_ℓ]`.
- **Condition (i) at every `q`.** This uses a DIFFERENT expansion from F3's:
  `r(k) = Σ_t C(b,t)·C(a+b−t, k−t)`, from `1+2y = (1+y)+y`, asserted equal to the `α`-sum at `q = 1` and `q = m`.
- **Condition (ii) at every actual `(a_q, b_q, j)`,** in cumulative form.

| m | n | α | x | p* | eligible | closed form | F = leafSet (derived) | (WID) L = R | sign S(T,p*) | cond (i) fails | cond (ii) fails | min rel. margin (at q) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 95 | 1618 | 856 | 506 | 508 | yes | match | yes | yes | −1 | 0 | 0 | 0.0049241 (q=1) |
| 107 | 1822 | 964 | 570 | 572 | yes | match | yes | yes | −1 | 0 | 0 | 0.0043729 (q=1) |
| 110 | 1873 | 991 | 586 | 588 | yes | match | yes | yes | −1 | 0 | 0 | 0.0042538 (q=1) |
| 113 | 1924 | 1018 | 602 | 604 | yes | match | yes | yes | −1 | 0 | 0 | 0.0041411 (q=1) |
| 116 | 1975 | 1045 | 618 | 620 | yes | match | yes | yes | −1 | 0 | 0 | 0.0040342 (q=1) |
| 119 | 2026 | 1072 | 634 | 636 | yes | match | yes | yes | −1 | 0 | 0 | 0.0039327 (q=1) |

- **Fixed points (SEMANTIC-CONTRACT §5).** Rows 95 and 107 reproduce `n`, `α` and `x`. At m = 95, `ρ_1` is exactly
  `1354839571516225/1361543988640524`, and `R_K/R_{K−1} = 508/507` follows from `p* = 508`.
- **Agreement with F3.** F3's values at 113 and 116 (`n`, `α`, `x`, eligibility, favorability, the `q = 1` and `q = m` relative
  margins 0.0041411/0.1562179 and 0.0040342/0.1561568) agree with mine digit for digit.
- **Fresh row 119.** m = 119 is a fresh row under gate ruling 9 that F3 did not run. It behaves like the others.
- **Observation, not proof.** Over these rows `(1 − ρ_1)·m` ranges from 0.46779 to 0.46799 (bounded observation only).
- Output `own/crit_rows_95_107_110_113_116_119.out.json`, SHA-256 `19f917b8…8c56`; 22.7 s foreground.

**Instrument B, `own/crit_small_network.py` (exhaustive literal network, uniform-in-(d, m, p) structure).**
- **Scope.** The trees are CB(2,2), CB(3,2), CB(2,3), CB(4,2), CB(8,1), CB(3,3), CB(2,4) and CB(5,2), orders 13 to 25, with up to
  344,973 independent sets. At every rank `p ≥ 1` with `I_{p+1} ≠ ∅` (78 (tree, rank) instances), the instrument enumerates all
  independent sets and computes `w_F` literally, with `W_ℓ = N(s_ℓ) ∖ {ℓ}` taken from adjacency. It traverses every literal
  (D) and (S) arc out of every sector source (99,954 sector sources in total, summed over ranks).
- **Assertions.** (a) Every positive-weight target reached from a sector source is either in-sector, or r-free with exactly one
  choke `u_i`. In the second case it is reached only by (S) arcs inserting that `u_i`, from sources whose state at `u_i` is
  `(β, γ) = (1, w(A))`. (b) Each such target has exactly `d − w(A)` sector preimages. (c) No r-free target with two or more
  chokes is reached from any sector source by any arc. (d) No non-sector source has a (D) arc into an in-sector target, and
  in-sector targets receive no sector (S) arc. Non-sector (S) arcs that insert `r` are not tested, because no flow uses them. (e) (WID) holds for `F = F_p` (derived) and for `F = leafSet`, with `S` from
  brute-force `H_ℓ`/`R_ℓ` counts. (f) The product formula of Instrument A holds at every `k`.
- **Result: 0 failures** across 36,902 positive-weight switch images (summed over ranks). A mutation test (preimage count `d − γ + 1`, (WID) off by
  one, a wrong power of 2 in (f)) is caught (347 failures on CB(3,2)).
- Output `own/crit_small_network.out.json`, SHA-256 `6edccc28…36ec`; 6.5 s.

**Instrument C, `own/crit_cd2_pairwise.py`.** It checks the pairwise likelihood-ratio inequalities on which the proof of condition
(ii) rests (below), not only their cumulative sums. The range is every `a, b ≤ 25`, every `j ∈ [−2, a+b+2]` and every pair
`α < α'`: 7,463,040 checks with 0 failures. A mutation (P1 direction flipped) produces 651,105 failures. Output
`own/crit_cd2_pairwise.out.json`, SHA-256 `5317895f…3eb2`.

**Condition (ii), re-derived on paper (identical to the CD-2 proof of record, reached independently).** Write
`N(α,k) = C(a,α)C(b,k−α)2^{k−α}`, `S_α = N(α,j)` and `T_α = N(α,j−1)`, with `r(j) = Σ S` and `r(j−1) = Σ T`.
- **First inequality.** For `α < α'`, `S_{α'}T_α ≥ S_α T_{α'}`. The powers of 2 cancel (both sides carry `2^{2j−1−α−α'}`), and
  so do the `C(a, ·)` factors. What remains is `C(b,u)C(b,w) ≥ C(b,u−1)C(b,w+1)` with `u = j−α' ≤ w = j−1−α`. If the right side
  is nonzero then `1 ≤ u` and `w+1 ≤ b`, so the left side is positive and the inequality is `(b−u+1)/u ≥ (b−w)/(w+1)`, which is
  true because `u ≤ w+1`.
- **Summation.** In `r(j)Σ_{≤α}T − r(j−1)Σ_{≤α}S = Σ_{x≤α} Σ_y (T_x S_y − S_x T_y)`, the `y ≤ α` terms cancel in antisymmetric
  pairs. Each remaining `x ≤ α < y` term is ≥ 0 by the pairwise inequality.
- **Second inequality.** It is the same argument with `T'_β := T_{β−1}`. The pairwise step becomes
  `C(a,u)C(a,w) ≥ C(a,u−1)C(a,w+1)` for `u ≤ w`: here the `C(b, ·)` factors and the powers of 2 cancel exactly.
- **Degenerate cases.** Zero cases (`j ≤ 0`, `j > a+b+1`) make every term vanish.

No Newton, no Darroch and no real-rootedness claim enters. The same likelihood-ratio proof is already on the face of the
criterion key's scope note `[r30 C4; SR-C4-6]`, CD-2, at `proved_informal`.

## Attacks and findings

1. **The doubly-fed structural argument (F3 §4): TRUE in substance; Fact 3 is misstated as a statement about the literal network.**
   F3's Fact 3 says a sector deletion arc "removes exactly one leg vertex (never r, never v)". Under the literal relation (D), every
   sector source `B` has the arcs `B → B∖{r}` and `B → B∖{v}`. The script's own docstring concedes the point: "no r- or v-deletion
   carrying positive flow".
   - Both targets have weight 0. `B∖{r}` is r-free with no choke, so `v` is inactive and no `c` is active. `B∖{v}` contains `r`,
     so it has no choke and weight 0.
   - The same holds for the `s`-switch image and the `(1, 0)` `u_i`-switch image.
   - So the conclusion stands: capacity is 0, the certificate assigns 0, and E1 loads only r-free targets with `q ≥ 1`.
   - The full, correct arc table is my Lemma DF (critic-derived advance, below). Instrument B verifies it exhaustively on eight
     small trees at every rank.
   - F3's conclusion coincides with text already in the registered composition key ("a u_i-switch image of weight γ ∈ [1, 7] …
     has exactly 8 − γ sector preimages … every other target receives no sector flow"). F3 is right that it offers a reason and
     makes no new claim.
2. **F3's "literal, exhaustive" confirmation at the q = 2 and q = 3 targets is vacuous as evidence.**
   `check_no_sector_deletion_preimage` tests only `r ∈ A∪{x} and v ∈ A∪{x}`. The targets `A2` and `A3` contain NEITHER `r` NOR `v`
   by construction, so no single added vertex can pass, whatever the graph. Three further defects:
   - The check does not test independence.
   - It ignores (S) preimages.
   - Its targets are not at rank `p*` (sizes 14 and 17, against `p* = 604`).
   The structural conclusion is still true, by Facts 1, 2 and 4 and by my Instrument B assertion (c).
3. **F3's "concrete sector source" is not a sector source of the network at `p*`.** It has `K = 99` legs (`|B| = 101`), but the
   sector at `m = 113` is `I_{605}`, with `K = p* − 1 = 603`. The switch-rule check is rank-independent, so the observation is
   valid as a structure check. As a statement about the network at `p*` it is not.
4. **(WID) was not asserted (shared rule 2 / SOLUTION-CONTRACT §3.2), and the substitute the return claims does not exist in its
   code.** The return says that "§2 below asserts and checks, from two independent computations, that the criterion flow's
   per-class supply and capacity are equal (`ρ_q` … from `r_q` computed two ways — direct binomial-sum and, in
   `f3_condition_ii_stress.py`, via the same N/cumulative machinery)".
   - `f3_criterion.py` computes `r_q` once, with `cb_lib.r_poly_coeff`, which is itself the `α`-sum of the same `N` terms.
   - No supply-versus-capacity equality is asserted anywhere in the shipped code. The claim is unbacked and struck (see
     Certification audit).
   - **This fidelity gap is repaired by the critic, not by the return.** Instrument A asserts (WID) from independent sides at 95,
     107, 110, 113, 116 and 119, and reproduces F3's network-level numbers (`x`, `α`, `F_{p*}`) exactly. Those numbers stand, on
     the critic's replay.
5. **Condition (ii), F3 §3: the return misstates the record.** It frames CD-2 as a claim it can only confirm in bounded fashion
   ("bounded confirmation, not a proof that CD-2 holds for every a, b, j"). In fact CD-2 is `proved_informal` by an elementary
   likelihood-ratio proof. That proof sits in the scope-note text of the criterion key, which F3 quotes from
   `sources/authority/CLAIM-IDENTITY.json`, and I re-derived it independently above.
   - The allocation asked F3 to "try to break that claim exactly". An adversarial route should have attacked the proof, not only
     sampled the inequality. I attacked the proof's one load-bearing step (the pairwise ratio inequality with zero extension) and
     it holds.
   - The 571,768-triple sweep is correct: replayed byte-identically, with Part A's 570,807 triples and 0 failures. It is
     corroboration of a proved statement.
   - The inequality F3 tested is exactly CD-2's TP-g/TP-h as quoted from the key: both inequalities, `α ∈ [0, a]`, strict prefix
     in the second. It is the right statement.
   - The claim "an order of magnitude past anything SR-C4-6 tested" is too strong. The r30 record already reports literal
     condition-(ii) checks at all 248 pairs `(q, D_Q)` of `G(8^82, 7^2)` (D = 670), where `a_Q` reaches the hundreds.
6. **Condition (i) (Lemma A) at `q = 1` and `q = m`: confirmed exactly with a different `r_q` expansion.** There are 0 failures
   over all `q` at 95 through 119. The minimum relative margin is at `q = 1` on every row. At `q = m` (`b_q = 1`) the margin is
   about 0.156, far from tight. F3's numbers are correct.
7. **Fixed points.** `θ* = 96/766193` and `96/604265` are not reproduced by the instrument: `f3_fixed_points.py` evaluates the
   conjectural law `288/(200m² + 82m + 5)` and compares the result with the contract's value. That is a tautology, not a
   reproduction of an LP optimum (see Certification audit). `n`, `α`, `x` and `ρ_1` at m = 95 are genuinely reproduced, and I
   reproduce them independently.
8. **Favorability symmetry.** F3 verifies ONE automorphism (choke 1 ↔ choke m together with leg 1 ↔ leg d). One involution does
   not show that "every `c_ij` plays an identical structural role". The conclusion `F_{p*} = leafSet` at 113 and 116 is true: my
   generator set is verified at every row and is transitive on the private leaves. As written, F3's evidence is insufficient.
9. **Fresh-row labelling.** Gate ruling 9 makes 116 and 119 the fresh rows and 107, 110 and 113 control rows. The allocation's F3
   paragraph names 113 and 116, and the return calls both "fresh". Only 116 is fresh under ruling 9. I ran 119.
10. **Stale docstring.** `cb_lib.closed_form_I_CB`'s docstring still states the transposed `G = (1+x)^d + x(1+2x)^d`, although the
    code computes the contract's `G`. This is harmless, but it is the same transposition as the allocation erratum CF-C2-G. A
    successor copying the docstring would reintroduce it.
11. **Other target classes (protocol duty 3).** I checked each class against the composition:
    - **In-sector targets:** flow only through sector (D) arcs (Instrument B, assertion d). Literal (S) arcs from non-sector sources that insert `r` exist but carry no flow.
    - **`u_i`-switch images with `γ ≥ 1`:** the only class fed by both flows; load `ρ_1 γ + (8−γ)σ(γ) ≤ (ρ_1 + θ)γ ≤ γ`.
    - **One-choke r-free targets not reached by a switch:** E1 only, `ρ_1 w ≤ w`.
    - **Two-or-more-choke targets:** E1 only (assertion c), `ρ_q w ≤ w` by condition (i).
    - **Weight-zero targets:** `B∖{r}`, `B∖{v}`, the `s`-image, the `(1,0)`-image, and r-containing non-sector targets; they
      receive 0 from both flows.

    Shared-capacity competition occurs only at the switch images. There, "binding" means binding for the template: the literal
    network's requirement is (HALL-COND), and the template's per-`γ` constraint `(8−γ)σ(γ) ≤ (1−ρ_1)γ` is sufficient. F3's phrase
    "the true, tight binding constraint" is right only in that template sense.
12. **No cut, no template failure.** No step of the return or of my replay produces an eligible deficient set. `S(T, p*) < 0` at
    every row I computed, consistent with FLOW⇒SIGN and carrying no weight as evidence of (HALL).

## Mechanism-equivalence and fence check

- **One rank per tree:** every computation is at `p* = (16m+4)/3` on class rows (m ≡ 2 mod 3). Instrument B is deliberately
  off-class (small `d`, `m`, all ranks). It tests only the structural lemma, which is uniform in `(d, m, p)`, and certifies no
  class row.
- **No refuted mechanism revived.** Condition (ii) is proved by binomial ratio monotonicity, not by Newton or Darroch. No census
  is used as proof. The `θ*` law appears only in F3's illustration, labelled `conjecture`, and never as a hypothesis. It does
  not appear in my instruments at all.
- **No status transfer.** Nothing here touches (HALL) at full scope, the primary aggregate, or Tier 1's grade.
- **Mechanism identity.** F3's "structural note" and my Lemma DF are the SAME mathematical content as part of the registered
  composition key's statement: the target case split and the `8 − γ` preimage count. They are neither a new mechanism nor a
  candidate key. At most they are face text for that key's proof, subject to a second read (gate ruling 13).

## Certification audit

Struck or narrowed (the return's text, then the ruling):
- "§2 asserts and checks, from two independent computations, that the criterion flow's per-class supply and capacity are equal" →
  **STRUCK** (no such computation exists in the shipped code; (WID) was not asserted by the return).
- "`r_q` computed two ways" → **STRUCK** (one way only).
- Fixed-point table, "`θ*` … matches SEMANTIC-CONTRACT §5 … reproduces, exactly" → **NARROWED:** the `θ*` column is an evaluation of
  the conjectural formula, not a reproduction. `n`, `α`, `x` and `ρ_1(95)` stand.
- §4 item 2, "a literal, exhaustive (over all of V∖A, not sampled) confirmation" → **STRUCK as evidence** (the test is vacuous by
  construction; see Attacks 2). The conclusion stands on the proof and on Instrument B.
- §4 item 1, "A concrete sector source B" → **NARROWED** to "an independent set containing `r`, `v` and 99 legs" (not in
  `I_{p*+1}`).
- Fact 3, "never r, never v" → **CORRECTED** (literal r- and v-deletions exist; they land on weight-0 targets).
- §3, "bounded confirmation, not a proof that CD-2 holds" → **CORRECTED:** CD-2 is `proved_informal` on the record, and the sweep is
  corroboration.
- "an order of magnitude past anything SR-C4-6 tested" → **NARROWED** (the r30 record has literal condition-(ii) checks at
  `D = 670`).
- "An explicit automorphism … confirms every `c_ij` plays an identical structural role" → **NARROWED:** one involution is
  insufficient. The conclusion is confirmed by the critic's generator check.
- "Fresh rows 113, 116" → **NARROWED** to one fresh row (116) under gate ruling 9.

Backed (replayed or independently re-derived):
- Tree, `n`, `α`, `x`, eligibility and favorability at 113 and 116; the closed-form match.
- Condition (i) strict at every `q` with the margins reported.
- The 571,768-triple sweep with 0 failures, labelled `bounded_computation` and "sampled" where sampled (Part B).
- The doubly-fed conclusion.
- All digests.
- `cut_candidate: none`.
- The return grades nothing above `bounded_computation`, which is correct.

## Verdict

F3's bounded evidence is correct and replays byte-identically. Its central conclusion is correct: the `u_i`-switch images with
`γ ≥ 1` are the only targets fed by both the sector certificate and the criterion flow, with shared capacity `(ρ_1 + θ)γ ≤ γ`.
Four defects narrow the return: the WID substitute it claims does not exist, one "exhaustive" check is vacuous, the `θ*`
"reproduction" is tautological, and the return misreports CD-2 as unproved. With those removed it is retained at
`bounded_computation`. The re-derived CD-2 proof and Lemma DF below are, in my reading, mathematically complete at
`proved_informal` (Lemma DF is STATED here and needs an isolated second read). Nothing here is formal, and nothing resolves
the headline.

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: not_advanced
HALL_formal: not_advanced
FAV_darroch_free: not_advanced
cut_candidate: none

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Critic-derived advance (C-F3-U; STATED, needs an isolated second read; not a key candidate).**

*Lemma DF (complete sector-arc table).* Let `T = CB(d, m)`, `p ≥ 1`, `F ⊇ leafSet`, and let `B ∈ I_{p+1}` with `r, v ∈ B`. `B`
contains no choke and no `s`. Its literal arcs are exactly the following:
- **(D1)** `B → B∖{x}` for a leg vertex `x`. The image is in-sector, weight 1.
- **(D2)** `B → B∖{r}` and `B → B∖{v}`. Weight 0.
- **(S1)** the `s`-switch `(B∖{r, v}) ∪ {s}`. Weight 0.
- **(S2)** for each choke `u_i` with `β_i = 1`, the image `(B∖{r, b_ij}) ∪ {u_i}`. It is r-free, contains `v`, and has exactly one
  choke. Its weight is `γ_i`, because `W_{c_ij} = {u_i}` and `v` is inactive once `r` is gone.

No other `(S)` exists:
- `|N(u_i) ∩ B| = 1 + β_i`, since `r ∈ B`.
- `|N(b_ij) ∩ B| ≤ 1`, since `u_i ∉ B`.
- `|N(c_ij)| = 1`.

Conversely, an r-free target `A` with `Q(A) = {u_i}`, `v ∈ A`, `s ∉ A`, no `b` at `u_i` and `γ ≥ 1` private leaves at `u_i` has
exactly `d − γ` sector preimages. These are `(A∖{u_i}) ∪ {r, b_ij}` for the `d − γ` legs `j` with `c_ij ∉ A`. Each is
independent: `r`'s neighbours `s` and the chokes are absent, and `b_ij`'s neighbours `u_i` and `c_ij` are absent. No preimage
of `A` arises from (D) or from another (S), because the inserted vertex must be `A`'s unique choke.

Every (D) preimage of an in-sector target is a sector source (`A ∪ {y} ∋ r, v`). An in-sector target DOES have literal (S)
preimages among the non-sector sources: when `m ≥ 2`, a source containing `v` and exactly two chokes has the switch that
inserts `r`. These arcs carry no flow, because E1 is deletion-only and the sector certificate uses only sector sources. So
in-sector targets receive only sector (D) flow.

Hence the targets fed by both flows are exactly the (S2) images with `γ ≥ 1`. Their load is at most `ρ_1γ + (d−γ)σ(γ)`, and no
target with two or more chokes, and no weight-zero target, receives sector flow.

This completes and corrects F3's Facts 1–4 (Fact 3) and gives the proof paragraph that the composition key's text states
without writing out. Evidence: the proof above, plus the exhaustive literal validation of every clause in Instrument B
(78 tree-rank instances, 0 failures; `bounded_computation`).

Also re-derived by the critic, not new: the CD-2 proof above coincides with the likelihood-ratio proof of record.

## Remaining obligation

- **None on this route's own object at the informal level.**
  - Condition (i) at `p*` is `proved_informal` (Lemma A / threshold key, as carried).
  - Condition (ii) is `proved_informal` identically (CD-2).
  - The unique doubly-fed class is proved (Lemma DF, pending a second read) and validated exhaustively on small trees.
  - The route's bounded record now covers 107–119 (critic replay, with (WID) asserted from independent sides).
- **Formal (the run's real gap).** To feed U2's conjunct-4 node, Lemma DF must be stated over C1-LA2's `cbGraph m`: the
  enumeration of (S)-arcs out of a sector source (`|N(u_i) ∩ B| = 1 + β_i`), the `d − γ` preimage bijection, and "every (D) preimage of an
  in-sector target is a sector source". CD-2 must be formalized as the pairwise binomial ratio lemma plus antisymmetric
  summation, with no Mathlib real-rootedness needed.
- **Adversarial.** Further sweeps of condition (ii) are pointless now that it is proved. Adversarial effort on this chain belongs
  on the formal statements (hypotheses that might encode the conclusion) and on the favorability dependency (T1/T2), not on
  more rows.
- **Not resolved:** Tier 1 remains `computer_assisted` modulo Darroch/Newton through favorability. (HALL) at full scope stays
  OPEN.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-F3-U/`:

| path | SHA-256 | role |
|---|---|---|
| `own/crit_rows.py` | `8ec312e110c9b6941d59afafecad114181b7432ce4caa3379f7fcd0d86ba4332` | Instrument A: rows 95–119: tree, α, x, eligibility, closed form, favorability + orbit generators, (WID) independent sides, conditions (i)/(ii) all q |
| `own/crit_rows_95_107_110_113_116_119.out.json` | `19f917b83057b4e7c780db3549972d6ffb60b21d19585244df31a479f57a8c56` | its output |
| `own/crit_small_network.py` | `3f0bccf2c60ae97d42801cf3a8941aae5169aa723b8990d17935f45969acfabe` | Instrument B: exhaustive literal network, 8 small CB(d,m), every rank; Lemma DF clauses, (WID), weight formula |
| `own/crit_small_network.out.json` | `6edccc2883e709b28a8fcaa6e9561c384556e3443c881bc53df46b778bd836ec` | its output |
| `own/crit_cd2_pairwise.py` | `043d9f17dcaf7736d501b68a744e4f2f15ffe4d0fb0db2ea5802801e4542003b` | Instrument C: pairwise likelihood-ratio inequalities under CD-2 |
| `own/crit_cd2_pairwise.out.json` | `5317895fcbdc3dfbb6b307de457ce96972be47437a2beea1fda2a251f8413eb2` | its output |
| `replay/*` | as in the return | copy-out-first replay of F3's six scripts; regenerated outputs byte-identical to the return's; originals kept in `replay/orig/` |

Replay (foreground, stdlib only):
```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-F3-U/own
python3 -B crit_rows.py 95 107 110 113 116 119    # ~23 s
python3 -B crit_small_network.py                  # ~7 s
python3 -B crit_cd2_pairwise.py                   # ~3 s
```
I started no background job. The only processes a name-scoped `pgrep` matched belong to other seats (disclosure 5), and none is
mine.
