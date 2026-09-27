# Orientation Adjudication

Orientation **T** (prove), Cycle 2 Stage 5, r30 (Erdős #993: weighted mixed-boundary transport for the remaining
ordinary-tree favorable-leaf aggregate). Portfolio: returns `T1` (`C2-T-01 CB-FAMILY-FULL-NETWORK-HALL`) and `T2`
(`C2-T-02 WEIGHTED-SECTOR-LYM-BEYOND-PAIRS`), with their critiques `C-T1-F`, `C-T1-U`, `C-T2-F` and `C-T2-U`.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The tool display truncated about 5,000 characters in the middle
of `verity.md`, and I did not re-read them. I loaded no other VerityOS subsystem.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Dispatch.** `control/dispatch/c2-stage5/DISPATCH-ADJ-T.md` has SHA-256
  `62644dbb12d97f78ecc96b78faa486aa16641a1b942c304d961c7d998bb26db6`. I checked this before reading the file, and it matches.
- **Capsule seal.** For `control/c2-adjudicator-capsules/T-PACKET-MANIFEST.json`, I took the SHA-256 of the canonical JSON
  without `seal_sha256` (sort_keys, separators `(",",":")`, no trailing newline). It recomputes to
  **`868df614e629121bf3bd71590863ec4d0eb16ea3a9737a7d2592bd67938567eb`**, which matches. All 20 listed members match on both
  SHA-256 and byte count. They include the protocol, both contracts, the allocation, the gate, `SOURCE-DIGESTS.json`, the Stage
  2/3/4 manifests, both admissions, the Stage 3 read-boundary disclosures, `C2-STAGE5-CONTROLLER-FACTS-T.json`, `PATH-CHECK-T.json`,
  the two returns and the four critiques.
- **Stage seals, recomputed canonically.**
  - Stage 2: `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`, which matches.
  - Stage 3: `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`, which matches.
  - Stage 4: `025bf11c94064441d2792f39513d96fc16dc12f39f6e1aac8df5c5e4d8fe45ff`, which matches.

  Every member of the Stage 3 and Stage 4 packets re-hashes to its listed digest. Both admissions carry the same digests for T1
  (`8c73a6da…ccdaad`), T2 (`64dec148…f544cf`), C-T1-F (`4d8f2522…`), C-T1-U (`077586c7…`), C-T2-F (`57355f5a…`) and C-T2-U
  (`4d84a085…`).
- **T1 scratch.** I copied T1's ten inventoried files out to `scratchpad/c2-adj-T/copy-T1/`, and all ten digests equal the return's
  table. Both T1 critics independently replayed all five T1 scripts byte-identically. I did not replay them a third time. I
  inspected the shipped `out_spectral_node.txt` and `spectral_node.py` to settle two certification disputes (see Route T1, item 9).
- **Model disclosures.**
  - Routes: "chartered sonnet/xhigh … `claude-sonnet-5`", consistent with the allocation.
  - Critics: "chartered opus/medium … `claude-opus-5-5[1m]`", consistent with the allocation and CF-3.
- **Controller facts (CF-0 to CF-T4).** I weighed these as one more instrument, not as authority. The replay JSONs that CF-0
  names are not capsule members, so I did not read them.
- **Read-boundary disclosures (this seat).**
  1. The harness injected the project `CLAUDE.md` and the user auto-memory index into my context at session start. I did not
     open them, and nothing here relies on them.
  2. The harness saved two long capsule members to session tool-result files (T1's return and `C-T1-U`), and I read them through
     those copies. I also copied T2's return, once, to the session scratchpad outside the run root so I could page through it. It
     is the same digest-verified member, and I deleted the copy before closing.
  3. In `sources/`, which is granted, I ran non-recursive `ls` of `sources/` and `sources/authority/` and parsed
     `sources/authority/CLAIM-IDENTITY.json`. The parse checked the registered status of (LB)
     `E993-R27-FOREST-DESCENT-LINEAR-BOUND`, which is VERIFIED `formally_verified`. It printed a few neighbouring entries that
     contain that string. I used none of them.
  4. I made one non-recursive `ls` of my own scratch directory.
  5. I read no other orientation's portfolio or adjudication, no prior synthesis, no controller replay file, no other
     experiment root and no external source.
  6. No network, no installs, no Lean. I started no background jobs.
- **Seat disclosures carried.** The controller's Stage 3 disclosures file records these for my seats. Nothing in any claim adjudicated below depends
  on them.
  - T1: boot-order deviation, a read of `skills/optimization-loop/skill.md`, `ls experiments/`, and a pre-grant `find -maxdepth 3`.
  - T2: one forbidden `ps aux` and four name listings above its grant.
  - Critics: `C-T1-U` stopped an over-long job through the harness by id. `C-T2-U` ran one `ls -la scratchpad/` above its grant.

## Route-by-route decisions

Every critic in this portfolio returned `retained_narrowed`. I rule claim by claim. Replays outweigh self-reports. A
result that a critic derived is graded as critic-attributed, and if it was first stated at Stage 4 it is **STATED** and needs an
isolated second read before registration. My replays are in `scratchpad/c2-adj-T/own/` (see `## Artifact inventory`).

### Route T1 — `C2-T-01 CB-FAMILY-FULL-NETWORK-HALL`

**Typed verdict: retained_narrowed.** T1's main theorem-level claim (the mixed case of obligation (a)) is not proved, and neither is
obligation (b). The spectral node is proved, but by the critics. T1 supplied the eigenvector family that attains the bound.

1. **Orbit and branch-type reduction (Step 1).**
   - *Both critics:* retained at `proved_informal`. The automorphism group is `Aut(CB(d,m)) = S_d ≀ S_m` (order `(d!)^m m!`), not
     T1's `S_m ≀ S_d`.
   - *C-T1-U only:* `CB(1,1) = P_6` has an extra reflection.
   - *Decision:* retained with the corrected notation. The reflection is harmless at `m ≥ 86`. The count of 54 branch types is backed
     by both critics.
   - F is `Aut`-invariant whether or not it is the whole leaf set (C-T1-U F11). So T1's appeal to "F = all leaves" is not needed
     for the (INV) step.

2. **Flip-character eigenvectors (Step 2, item 2).** `χ_J`, `|J| = r ≤ k−1`, is an eigenvector of `BBᵀ` with eigenvalue
   `2(k−r)(N−k+1)`.
   - Both critics re-derived it and retain it at `proved_informal`. I re-derived it as well: the case analysis over `i ∈ J`,
     `i ∉ J` and `J ⊄ supp g` is correct and exhaustive.
   - **T1's contribution, `proved_informal`.** T1's "`formally_verified`-grade" wording is struck: nothing was kernel-checked.

3. **Node (n1): `λ₂(BBᵀ|𝟙^⊥) = 2(k−1)(N−k+1)` for `N ≥ k ≥ 2`.** T1 left it `proved_conditional`, citing an unproved
   "completeness of the flip-character eigenbasis".
   - **C-T1-F F1:** T1's completeness statement is *false* as posed. The `χ_J` span `Σ_{r<k} C(N,r)` dimensions, against a layer
     dimension of `2^{k−1}C(N,k−1)`; for example, 11 against 24 at (4,3). C-T1-F then proves the bound through the complete
     decomposition `⊕_J V_J`, `V_J = {χ_J·h(supp)}`, with `M|V_J ≅ 2Z'I + 2A(J(N−r, k−1−r))`.
   - **C-T1-U R4:** the same decomposition on both layers, with the full Johnson spectrum. It says that "completeness" needs no
     wreath-product theory.
   - *These do not disagree.* The flip characters alone are not an eigenbasis (C-T1-F is right about T1's framing). The isotypic
     components are complete (C-T1-U is right about the proof). Both give the same `λ₂`. C-T1-F adds that the multiplicity is exactly
     `N`, attained only by singleton characters.
   - I re-derived the block form. The bound follows from two facts:
     - For `r ≥ 1`, the Johnson row-sum bound gives `≤ 2(k−r)Z' ≤ 2(k−1)Z'`.
     - For `r = 0`, the second Johnson eigenvalue gives `2Z' + 2[(k−2)(N−k) − 1] = 2(k−1)(Z'−1) < 2(k−1)Z'`.
   - **My replay** (`spec_n1.py`, exact Fractions) covers 12 `(N,k)` pairs up to (7,3) and (6,5), on both layers: 24 operators.
     On every one, `λ₂I − M + ((λ₁−λ₂)/dim)·J` is PSD with nullity exactly `N+1`, and every row sum equals `λ₁ = 2kZ'`. This
     confirms both the bound and its attainment with multiplicity `N`. It is a third instrument, after C-T1-F's LDLᵀ and C-T1-U's
     annihilating polynomial.
   - **Decision:** (n1) is proved at **`proved_informal`, critic-attributed jointly to C-T1-F and C-T1-U** (STATED at Stage 4; needs
     an isolated second read). T1 is credited with the attaining eigenvector family.
   - The candidate key name `…FLIP-CHARACTER-SPECTRUM` does not describe T1's statement as a predicate. I adopt C-T1-F's suggested
     predicate name, `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE`. The statement is in `## Lean readiness`, group G-SPEC.

4. **Sector Hall on `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492` (Lemma C (ii)).**
   - T1 graded it `proved_conditional` on (n1).
   - C-T1-F re-derived Facts A, B and D and the composition.
   - C-T1-U reproduced the arithmetic but could not inspect SR-SECTOR's Facts A–D.
   - **I re-derived all four inputs on this face:**
     - *Fact A:* choke-switch images have `r ∉ A`, while in-sector deletion images contain `r` and `v`.
     - *Fact B:* a choke-switch image `A = B − {r, b_ij} + u_i` has weight `b`, the number of branch-`i` leaves. It has at most
       `d − b` sector preimages. Every source outside `X''` has an exit with `1 ≤ b ≤ d−1`. So the switch capacity is at least
       `|X∖X''|/(d−1)`.
     - *Fact D:* `(k|X|)² ≤ |∂X|·1_XᵀBᵀB1_X ≤ |∂X|(λ₂|X| + 2Z'|X|²/R_k)`, which gives `|∂X| ≥ |X|` for `|X|/R_k ≤ x₀ = (k²−λ₂)/(2Z')`.
     - *NM:* `|∂X| ≥ δ|X|`, `δ = k/(2Z')`.
   - Composition: every `X ⊆ X_sec` is covered when `x₀R_k(1−c) ≥ |X''|`, with `c = (d−1)(1−δ)`.
   - **My replay** (`cb_rows_adj.py`) gives margins **6863.256, 11209.544, 18328.277**, equal to T1's, C-T1-F's and C-T1-U's.
     There, `x₀ = 1/460, 1/476, 1/492` and `c = 7/460, 1/68, 7/492`.
   - Every other eligible rank of the three windows ([460,516], [476,534], [492,552]) has `3p ≥ 2dm+5`, so NM alone
     (`δ ≥ 1`, P9) gives deletion-only Hall on every sector subfamily there.
   - **Decision:** (HALL-COND) holds for **every `X ⊆ X_sec` at every eligible `p`** of the three rows. The composition is
     critic-attributed to C-T1-F, T1 supplies the numerics, and (n1) is critic-attributed. The grade is **`computer_assisted`**,
     because the three margin inequalities are exact finite arithmetic. The claim is STATED: it needs a second read of (n1) and of
     this composition.
   - "Modulo (n1)" is discharged by (n1)'s proof. T1's prose "sector Hall holds at all three rows" (Step 2 item 5) was premature on
     its own evidence (C-T1-U F4). It is now true on the critics' evidence.

5. **Non-sector piece (Step 3, first paragraph).**
   - Both critics strike T1's `proved_conditional`. NM and P9 are statements about a single constant-weight induced-matching sector.
     They say nothing about `I_{p+1} ∖ X_sec`, whose weights vary. Per-sector Hall does not compose either (C-T1-F F3, C-T1-U F8).
   - **Decision: open.** The critics' class-level records agree in substance, though they partition differently:
     - C-T1-F's `q`-class supply/capacity ratios reach at most 0.9902 to 0.9955.
     - C-T1-U's whole-class deficits: O-class −1.66%, −1.63%, −1.60%, −1.29%, −1.03% of `W'_p`; sec ∪ V ∪ O −2.68%, −2.64%, −2.60%,
       −2.08%, −1.62%.
   - My replay (`class_deficits_adj.py`) reproduces C-T1-U's ten percentages to the digit. These are `bounded_computation`
     priors (about 1% slack), not proof.

6. **Mixed case (Step 3, the core of obligation (a)).**
   - Both critics agree that T1's paragraph is internally inconsistent: it says "THE ARGUMENT ACTUALLY GOES THROUGH", then says the
     gap is open. They also agree that its displayed inequality is inclusion–exclusion (always an equality) and that the gap is a
     set inequality `cap(N(X₁) ∪ N(X₂)) ≥ w(X₁) + w(X₂)`, not "two flows composed".
   - Both then give a structural competition map, using arm-state classes sec (`r,v∈B`), R0 (`r∈B, v∉B`), S (`s∈B`),
     V (`v∈B`, `r,s∉B`) and O (none of `r, s, v`).
   - They differ only in granularity:
     - **C-T1-U R7(a):** if `X ∩ V = ∅`, then `Hall(X) ⇐ Hall(X∩sec) ∧ Hall(X∖sec)`. It says the open mixed case is "exactly
       `X ∩ V ≠ ∅`".
     - **C-T1-F F4(i):** a strictly finer statement. If `X ⊆ sec ∪ V ∪ {weight-0 sources}`, Hall(X) follows from sector Hall alone.
       The injection `B ↦ B − v` preserves weight and is injective into `v`-free targets. Every positive-weight target of a sector
       source contains `v`.
   - I checked the proof of (i). V sources have `r ∉ B`, so the arm tag is inactive, and the private tags' witnesses are chokes,
     so `w(B−v) = w(B)`. The targets `B − v` are `v`-free and pairwise distinct. So
     `cap(N(X)) ≥ w(X∩sec) + w(X∩V)`. This is correct.
   - **My brute force** (`cb_competition.py`, eight small `CB(d,m)`, every rank, literal (D)∪(S)) confirms the three facts both
     reductions rest on:
     - (a) every positive-weight target of a sector source contains `v`. The targets lie in classes {sec, V}.
     - (b) every target of an R0, S or O source is `v`-free.
     - (c) a V source has exactly one `v`-free target, `B − v`, of equal weight.
   - The same run confirms the V→sector `r`-switch channel. It has 4, 16, 64, 432, 256 and 5184 arcs on the configurations that
     have one.
   - **Decision:** both reductions are retained at `proved_informal`, critic-attributed to C-T1-F and C-T1-U (STATED; second read).
     C-T1-F's (i) refines C-T1-U's localisation, and nothing in C-T1-U contradicts (i). C-T1-U's R7(b) is also retained: the natural
     split "sector by Lemma C, V ∪ O by their own targets" fails for supply reasons, so V-type capacity must be allocated
     explicitly. The exact remaining obligation (a) is given under `## Next-route allocation`.

7. **Margins mislabelled (F5 / F10).** Both critics strike "switch-capacity margins … 6,863×–18,328× the raw deficit". These
   numbers are the internal overlap ratio of the Lemma C (ii) composition. They measure nothing about competition from outside
   the sector, so they cannot support "close to mechanical". **Struck.**

8. **Obligation (b): `CB(8,108)/577` and `CB(7,144)/673`.**
   - Both critics correct T1's diagnosis:
     - only the Fact D half is vacuous (`x₀ = −287/289`, `−335/337`);
     - NM plus Fact B still cover every `X ⊆ X_sec` with `|X| ≥ |X''|/(1−c)`;
     - the uncovered range is `|X|/R_k < θ`, with θ = 6.643e−9 and 2.606e−15.
   - Both critics also find `X''` itself far from deficient. Its shadow ratio is 20.51 and 36.01 (C-T1-F closed form; C-T1-U
     generating function; the two agree). C-T1-F adds that `k² < λ₂` at both rows (331,776 < 332,350 at 577, by my arithmetic), so
     no spectral sharpening can activate Fact D.
   - T1's "`δ` within 7/289 ≈ 2.4% and 6/337 ≈ 1.8% of 1" is **struck**. The true gaps are `1−δ = 1/289` and `1/337`. The values
     7/289 and 6/337 are `c`, and my replay prints `c = 7/289` and `6/337`.
   - **Decision:** obligation (b) is **open**. It is a small-set expansion statement (see Next-route allocation).

9. **Certification literals.**
   - *Non-falsifiable WID on the five large rows* (ruling 17). Both critics strike it. My replay also computes WID from
     independent sides: supply and capacity come from the arm-state closed form `W = t²(1+2t)^N + (1+2t)·md·t²(1+t)^{d−1}β^{m−1}`,
     validated against literal brute force on six small CBs at every rank, while `S` comes from `H_v`/`R_v` by a generic tree DP.
     `supply − capacity = S` holds on all five rows at their first eligible `p`. So the WID claim is restored on critic and
     adjudicator evidence, not T1's.
     - *Critic slip.* C-T1-U's displayed formula contains a slip ("`(1+2t)·t·W'(t) + W'(t)`"). The correct term is
       `(1+2t)·W'(t)`. Its numbers are right, and my replay reproduces them.
   - *"Six `(N,k)` pairs up to (6,4)."* **Struck.** The script's list is (3,2), (4,2), (4,3), (5,2), (5,3), (5,4), as C-T1-F said;
     I checked T1's `spectral_node.py`, line 246.
   - *"Every `J`, all sizes."* **Struck.** `check_phi_eigenvector` loops `for t in range(N)`, which covers singletons only, as C-T1-U
     said.
   - *Jacobi "converged" on five pairs.* **Struck.** T1's own output gives 11.9937 for an exact 12 and 17.9068 for an exact 18, with
     `jacobi_second_matches_predicted: false` at (4,3) and (5,3).
   - *Step 5 digit column.*
     - C-T1-F calls it wrong; C-T1-U calls it unverified. **My replay settles it for C-T1-F.** The digit counts of `Δ_x` are
       **326, 337, 349, 408, 479**, not T1's 330, 340, 352, 415, 485. For `Δ_{x−1}` they are 327, 338, 350, **411**, 482; T1 wrote
       412 at `CB(8,108)`. The signs are correct, and `Δ_j ≥ 0` holds for every `j < x`.
   - *Grade names.* "`formally_verified`-grade" (three times), `proved_conditional` and `bounded_evidence` are **struck** as
     non-contract grades. The route verdict maps to `retained_narrowed`.

### Route T2 — `C2-T-02 WEIGHTED-SECTOR-LYM-BEYOND-PAIRS`

**Typed verdict: retained_narrowed.** T2's own lemmas survive with narrowed scope. Its deficiency criterion T-B and its §7 evidence
are struck. The obligation it left open (a weighted NM for arbitrary sector `X`) is answered for `CBstar` by the critics. The answer
works through a self-covering reduction, not a mixed-regime NM.

1. **T-A (generating functions `f_t`, `w_t`, `𝒲 = f^{M−1}(f + Mw_t)`).** Both critics re-derived it and matched it against brute
   force. It is retained at **`proved_informal`**, but only with the hypothesis that T2 left unstated:
   `F_p(T) ⊇ {v} ∪ P`, uniform `t`, in the root-plus-arm sector of `CBstar` (C-T2-F Finding 3, C-T2-U Attack 6).
2. **T-B (whole-sector deficiency iff `𝒲_k > 𝒲_{k−1}`).** Both critics **strike** it. For `t ≥ 2` its reachability step fails in
   two ways:
   - maximal star-forest states are unreachable;
   - the out-of-sector deletion targets `B∖v` and `B∖r` carry weight `starweight(B)`.

   The controller's CF-T3 reproduces the false positive at `CBstar(2,2,2)`, `p = 6` (504 against a literal shadow of 1154).
   My replay (`cbstar_adj.py`) confirms C-T2-F's corrected whole-sector balance L1 exactly on 11 `CBstar` configurations, for all three
   nontrivial `Aut`-invariant selectors. **Struck.** At `t = 1` it is P8 and not new.
3. **T-C (single-star unweighted NM failure).** Both retain it as a correct, elementary fact. C-T2-U narrows its significance: it is
   a fact about the count poset, not where "the weight breaks the symmetry". **Retained, narrowed.**
4. **T-D-R1 (q-ary cube NM, `k|X| ≤ q(M−k+1)|∂X|`).**
   - Both retain it at `proved_informal` for uniform `t`.
   - C-T2-F Finding 4: biregularity fails for heterogeneous `t_i`, so the "strictly more general" scope is struck. C-T2-U does not
     dispute this.
   - At `q = 2` it is the registered NM, so it is not a contribution there.
   - **Retained at uniform `t`.** It is the input that step 4 of C-T2-U's theorem consumes.
5. **T-D-R2.** This is the classical Boolean LYM, re-derived and unweighted. Retained, but not a contribution.
6. **T-E (choke-switch image weight `starweight(B) + #{l≠l₀ : leafcount = 1}`).**
   - Both critics retain it. C-T2-F replayed all 181,669 instances; C-T2-U replayed 1,338.
   - Both narrow the count to "*arcs*, not distinct targets". C-T2-F reports 132,300 arcs to 123,984 distinct targets at (3,3,2)/13.
   - Both **strike** §1's "(S) insertable exactly at a choke". Every sector source also has an `s`-switch (image weight
     `starweight(B)`), and for `t ≥ 2` there are support switches (image weight `w(B)−2`, which stay in the sector).
   - My replay counts all three families. For example, at `CBstar(2,2,2)/7` there are 32 choke, 58 `s` and 120 support switch arcs,
     equal to C-T2-F's census.
   - **Retained for choke switches.**
7. **Sector-weight range.** Retained as trivial under the selector hypothesis, with the garbled "never `1+2=2`" sentence
   corrected to `{1} ∪ [3,∞)` (odd at `t = 2`).
8. **(SW) template (§6).** C-T2-F: incomplete (it omits the `s` and support switches). C-T2-U: states no inequality, and by the
   corollary below it has no object on the `CBstar` sector. **Recorded as a remark, not a claim.** No grade.
9. **§7 bounded search.**
   - **The critics disagree on standing, not on the conclusion.**
     - *C-T2-F:* "rescued", because its own sweep reproduces T2's conclusion under the corrected criterion with the literal
       selector computed: 204,265 rows, `F_p` = all leaves, `S < 0`, only the three `t = 1` rows deficient.
     - *C-T2-U:* "struck as evidence", but the conclusion is *proved* by its corollary.
   - **Ruling.** T2's §7 as shipped is **struck as evidence**, for three reasons: it applied the refuted criterion T-B; it never
     computed `F_p`; and it asserted no `supply − capacity = S` on any row (fence §3.3; SEMANTIC-CONTRACT §3; ruling 17). T2 gets
     no credit for it.
   - The conclusion stands on critic evidence. Two items carry it:
     - C-T2-U's corollary (`proved_informal`, STATED) covers every sector subfamily for `t ≥ 2`.
     - C-T2-F's re-sweep is a critic-attributed `bounded_computation` record, of partial fidelity: `S` is computed, but
       supply and capacity are not computed from independent sides at those orders.
10. **Critic-derived results on T2's object, reconciled.**
    - **C-T2-U theorem.** Take `CBstar(d,m,t)` with `F ⊇ {v} ∪ P`, `k = p−1`. Then
      `max_{X⊆S^Q_{p+1}} [w(X) − w(N_D(X))] = max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1})`.
      - The proof is a self-covering reduction. The `Q`-deletions `B∖r` and `B∖v` are private targets of weight `w(B)−1`, so a
        member of weight 2 or more covers itself and only the weight-1 family `R1` can carry a deficit. T-D-R1 then applies on `R1`,
        and attainment is at `R1_k`.
      - I checked every step. **My replay** compares the formula with the exact deletion-only max-flow deficit on 11 configurations
        (`t ∈ {1,2,3}`, every rank that has sector sources): they agree on every row.
    - **C-T2-U corollary.** For `t ≥ 2` and `p ≥ x + 2`, (LB) gives `x ≥ n/4`, hence
      `4[(t+2)(p−1) − (t+1)(M+1)] ≥ (t+1)(t−2)M + tm + 2m + 3t + 10 > 0`. I re-did the arithmetic, and it is correct.
      - (LB) is registered VERIFIED `formally_verified` (checked in `sources/authority/CLAIM-IDENTITY.json`).
      - Conclusion: **no sector subfamily is deletion-deficient**, so (HALL-COND) holds on every sector subfamily under (D)∪(S).
    - **C-T2-F L1** (exact whole-sector balance for `F = a{v} ∪ bP`) and **P1** (`t = 2`: `x ≥ M+1`; whole sector non-deficient
      unless `F = {v}`; T-B never fires):
      - I checked L1's derivation and P1's proofs. P1(i) rests on real-rootedness and palindromy of `P_j` and of `x(1+x)f^M`.
        P1(ii) uses `G_k ≥ 2(M−φ)3^{M−1−φ}C(M,φ)`.
      - My grid replay confirms P1(i), `n ≤ 4x` and the corollary inequality on 120 `CBstar(d,m,2)` trees (`d ≤ 8`, `m ≤ 15`) with
        zero failures.
    - **Relation between the two.**
      - For `F ⊇ {v} ∪ P`, C-T2-U's corollary *subsumes* P1(ii): it covers all subfamilies, not only the whole sector, and every
        `t ≥ 2`, not only `t = 2`.
      - For `v ∉ F`, the case is trivially non-deficient: `B∖r` carries the full weight. My replay shows maximum deficit 0 with
        `F = P` on every row.
      - P1(i) is independent information.
      - **Both leave `F = {v}` open.** My replay shows the `F = {v}` sector *is* deletion-deficient at some non-eligible ranks, for
        example 51 at `CBstar(2,2,2)`, `p = 5`. So this case is genuinely different. It matters only if the fixed selector ever
        equals `{v}`, and on every computed eligible `CBstar` row it is the whole leaf set.
    - **Decision:** C-T2-U's theorem and corollary, `proved_informal`, critic-attributed to C-T2-U (STATED; second read). They are
      the orientation's cleanest parameter-uniform new lemmas. C-T2-F's L1 and P1 are retained at `proved_informal`,
      critic-attributed (STATED).

## Cross-route reconciliation

- **One mechanism, two families.** Both routes attack sector-level Hall in the root-plus-arm sector `Q = {r, v}`.
  - T1 is on `CB = CBstar(·,·,1)`. There the sector is switch-necessary at the three rows, and it is now Hall-complete at
    `computer_assisted`.
  - T2 is on `CBstar(·,·,t≥2)`. There the critics prove that the sector is never deletion-deficient.
- **Why the two families behave differently.** C-T2-U's self-covering reduction explains it. A sector deficit can live only on
  the weight-1 residual family `R1`, the `(t+2)`-ary cube. That family is deletion-deficient iff `(t+2)(p−1) < (t+1)(dm+1)`. At
  `t = 1` this is P8's `3p < 2dm+5`, and (LB) excludes it for every `t ≥ 2` at eligible ranks. So switch-necessity inside a sector
  of this shape is a `t = 1` (pendant-pair) phenomenon.
- **No contradictions between the routes.** T1's sector facts (weight 1, Fact A, P6) are the `t = 1` specialisations of T2's T-A and
  T-E. C-T2-U's theorem at `t = 1` gives max deficit `R_k − R_{k−1}` for the `CB` sector, which is exactly the P8/P9 record. My max-flow
  replay agrees at `CBstar(2,2,1)` and `CBstar(3,2,1)`.
- **Shared corrections.** Four apply to both routes:
  - the relation (S) has more families than the route prose admits (T2: `s` and support switches; T1: the V→sector `r`-switch);
  - both routes' large-row checks lacked independent sides;
  - both used non-contract grade words;
  - neither route computed the selector on its large rows. Critics and this adjudication supply it: `F_p` is the whole leaf set on
    every row cited.
- **What neither route touches.** Hall for source families outside the root-plus-arm sector, which is the whole difficulty of
  (HALL) on these trees. It is localized for `CB` (see Next-route allocation) and untouched for `CBstar`, `t ≥ 2`.

## Established results

Every statement below uses the literal `w_F` (active tags, `B ∩ W_v ≠ ∅`), the literal (D) ∪ (S), and `F` fixed at rank `p`, with
`x` computed through rank `α`. Every numbered row has `supply − capacity = S` asserted from independent sides on at least one
instrument.

**Exact theorems (informal).**
- **E1. (n1), ternary-cover second eigenvalue.** `proved_informal`. Critic-attributed jointly to C-T1-F (F1) and C-T1-U (R4); T1
  supplies the attaining eigenvectors. STATED; second read required.
  - *Statement:* for `N ≥ k ≥ 2`, the cover operator between ranks `k` and `k−1` of `{0,1,2}^N` has `λ₁ = 2k(N−k+1)` (simple,
    eigenvector `𝟙`) and `λ₂ = 2(k−1)(N−k+1)` on `𝟙^⊥`, on both layers. The multiplicity is exactly `N` (singleton characters).
  - *Hypotheses:* abstract poset only; no tree, weight or eligibility.
  - *Replay:* exact PSD/nullity on 24 operators.
- **E2. Flip-character eigenvectors.** `proved_informal`, T1.
- **E3. `CB` competition map and reductions (R-i) and (R-ii).** `proved_informal`. Critic-attributed to C-T1-F (F4) and C-T1-U
  (R7). STATED.
  - *Scope:* `CB(d,m)`, `F` = all leaves, every `p`.
  - *(R-i):* if `X ∩ (S∪O)` has no positive-weight member, then `Hall(X ∩ sec) ⇒ Hall(X)`.
  - *(R-ii):* if `X ∩ V` has no positive-weight member, then `Hall(X ∩ sec) ∧ Hall(X ∖ sec) ⇒ Hall(X)`.
  - It consumes `IsTree` only through the explicit structure of `CB`.
- **E4. `CBstar` sector deletion-deficit theorem and its `t ≥ 2` corollary.** `proved_informal`. Critic-attributed to C-T2-U.
  STATED.
  - *Hypotheses:* `F ⊇ {v} ∪ P`; `p ≥ 2` for the theorem; `p ≥ x(T)+2` and `t ≥ 2` for the corollary.
  - *Formal input:* (LB) at `formally_verified`.
- **E5. Whole-sector balance L1 and Proposition P1.** `proved_informal`. Critic-attributed to C-T2-F. STATED.
  - *Scope:* `CBstar`. P1 is for `t = 2`, with `F ≠ {v}` in (ii).
- **E6. T2's own lemmas.** `proved_informal`, T2, each with its narrowed scope:
  - T-A (with the selector hypothesis, uniform `t`, `CBstar` sector);
  - T-D-R1 (uniform `t`);
  - T-E (choke switches);
  - T-C (unweighted count poset).

**Computer-assisted.**
- **E7. Sector Hall under (D) ∪ (S) for every `X ⊆ X_sec` at every eligible `p` of `CB(8,86)`, `CB(8,89)`, `CB(8,92)`.**
  `computer_assisted`.
  - *Rows:* `n` = 1465, 1516, 1567; `α` = 775, 802, 829; `x` = 458, 474, 490; windows [460,516], [476,534], [492,552];
    `|F|` = 689, 713, 737 (all leaves).
  - *Proof:* the first rank by the Lemma C (ii) composition with E1, with exact margins 6863.256, 11209.544 and 18328.277; every
    other rank by NM/P9.
  - *Attribution:* composition critic-attributed to C-T1-F; numerics T1, reproduced by three instruments.
  - STATED; second read required. **A finite result on three instances.**

**Bounded records** (`bounded_computation`; never proof).
- The `Δ_x` and `Δ_{x−1}` digit counts, as corrected above.
- WID from independent sides on the five `CB` rows (C-T1-F, C-T1-U and this adjudication).
- The whole-class balances (C-T1-F `q`-classes; C-T1-U arm classes, replayed).
- The `X''` shadow ratios 20.51 and 36.01.
- C-T2-F's `CBstar` re-sweep: 204,265 rows, `F_p` = all leaves, `S < 0`, only the three `t = 1` rows deficient.
- The switch-family censuses.
- My small-`CB` competition brute force.

**Imported at their grades.**
- WID `formally_verified` (C1-LA1) and the Hall-implies-nonpositive-aggregate key `formally_verified` (C1-LA2); both are used, not
  re-proved.
- INV and NM at `proved_informal`.
- (LB) at `formally_verified` (r27).

**Refuted steps and record corrections.**
- T-B (struck).
- T2 §7 as evidence (struck).
- T1's non-sector `proved_conditional` (struck to open).
- T1's "completeness of flip characters" (mis-posed; false as stated).
- The certification literals listed under Route T1, item 9.
- `Aut(CB) = S_d ≀ S_m`.

**Compiled scratch declarations.** None. No Lean was run in this orientation.

## Rejected and narrowed mechanisms

- **Not revived.** No refuted key is revived. The weight is the literal active `w_F` in every route script inspected by critics,
  and in mine. The relation is (D)∪(S) literally.
  - T2's deletion-only statements and C-T2-U's theorem concern a single sector family under `w_F`. They are not
    `E993-R23-LITERAL-DELETE-ONLY-HALL`, which is universal Delete-only Hall over the r23 tagged top side with `|F∩B|`-era
    weights (different weight, relation and object).
  - Lemma C uses switch arcs.
  - The injection in (R-i) is a weight-preserving deletion on a whole class with no per-leaf map. It is not
    `…PER-LEAF-DOWN-MAP-INJECTIVITY` and not the own-support unit-capacity rule.
- **Narrowed.**
  - T2's star-forest scope is narrowed from "stars of any sizes in any tree" to uniform `t` in `CBstar`.
  - The (SW) template is narrowed to a remark.
  - T-C is narrowed to an unweighted fact.
  - T-E is narrowed to choke switches.
  - T1's mixed-case paragraph is replaced by E3.
  - T1's obligation (b) diagnosis is replaced by the exact small-set range `|X|/R_k < θ`.
- **Mechanism ≠ aggregate.** Nothing here bounds `S(T,p)` or moves the primary aggregate.
- **Finite ≠ universal.** E7 is a three-instance result.
- No closed region is re-proved: T-D-R1 at `t = 1` is NM and is credited to NM. There is no census value in any proof and no
  RTree wording.

## Lean readiness

**(WID)** at SOLUTION-CONTRACT §2's exact statement is already `formally_verified` (C1-LA1,
`E993Transport.activeWeightAggregateIdentity`). Nothing in this orientation re-awards it. The T routes used WID only as an
asserted identity.

Each group below gets the three readiness checks: (a) complete informal proof with a closed DAG, (b) compiled fragments, and
(c) named open nodes.

**G-SPEC: ternary-cover second eigenvalue (E1).**
- Suggested key `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE`. Attribution: C-T1-F and C-T1-U; T1 for the attaining family.
- *Exact statement of record (quadratic form; avoids eigen-machinery).* For `N ≥ k ≥ 2`, let `L_j ⊆ (Fin N → Fin 3)` be the maps
  with support size `j`, and let `h ⋗ g` mean that `h` extends `g` at exactly one coordinate. Then for every `f : L_k → ℚ` with
  `Σ f = 0`:
  `Σ_{g ∈ L_{k−1}} (Σ_{h ⋗ g} f h)² ≤ 2(k−1)(N−k+1)·Σ_{h ∈ L_k} (f h)²`.
  - *Companion (the form Fact D consumes):* for `X ⊆ L_k`,
    `Σ_g d_X(g)² ≤ 2(k−1)(N−k+1)|X| + 2(N−k+1)|X|²/|L_k|`.
  - *Hypotheses:* `k ≥ 2`, `k ≤ N`. There is no tree, weight or eligibility hypothesis.
- *Fences:* abstract poset only; not a Hall statement; its only use in (HALL) is Fact D at three `CB` rows.
- (a) **Complete.** The DAG is:
  - n1.1 `BBᵀ = 2Z'I + C` (support-swap graph; T1);
  - n1.2 the colour-flip isotypic decomposition `⊕_J V_J` is orthogonal and complete (critics);
  - n1.3 `M|V_J ≅ 2Z'I + 2A(J(N−r, k−1−r))` (critics);
  - n1.4 the Johnson bound, by row sums for `r ≥ 1` and the second eigenvalue for `r = 0` via the commutation identity
    `D_{j+1}U_j − U_{j−1}D_j = (N−2j)I` (T1 and C-T1-U re-derived it);
  - n1.5 assembly.
- (b) **No compiled fragments.**
- (c) Every node is open formally. **Smallest unproved formal node: n1.4 at `r = 0`**, the Boolean up-down second eigenvalue in
  quadratic-form form. Mathlib has no Johnson-scheme spectrum.
- **Ruling:** contract-ready at the informal level *after* its isolated second read. It is **not** ready for a Cycle 2 Stage 7 award
  (STATED at review stage; zero fragments). Its leverage on (HALL) is low (three rows), so I recommend deferring it behind any Lean
  work that bears on (HALL).

**G-CBSTAR: `CBstar` sector deletion-deficit theorem and corollary (E4).**
- Suggested key `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (C-T2-U).
- *Exact statement.* For `d, m, t ≥ 1`, `T = CBstar(d,m,t)`, `M = dm`, `Q = {r,v}`, `p ≥ 2`, `k = p−1`, and every
  `F ⊆ leaves` with `v ∈ F` and `P ⊆ F`:
  `max_{X ⊆ S^Q_{p+1}} (Σ_X w_F − Σ_{N_D(X)} w_F) = max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1})`.
  Here `N_D` is the deletion neighbourhood in all of `I_p`.
  - *Corollary (terminal):* if `t ≥ 2` and `crossingIndex T + 2 ≤ p`, every `X ⊆ S^Q_{p+1}` satisfies
    `Σ_X w_F ≤ Σ_{A ∈ I_p, ∃B∈X, transportRel T B A} w_F(A)`.
- *Fences:*
  - one sector family of one tree family;
  - not (HALL), not a (CUT), not the aggregate;
  - the selector hypothesis `F ⊇ {v} ∪ P` stays on the face. `F_p = P ∪ {v}` is proved for no eligible window (F2's question).
    The case `F = {v}` is excluded.
- (a) **Complete.** The DAG is:
  - c.1 the `CBstar` construction and `IsTree`;
  - c.2 the sector ↔ star-forest-state bijection;
  - c.3 the private `Q`-deletion targets and their weight `w−1`;
  - c.4 self-covering: `deficit(X) ≤ deficit(X ∩ R1)`;
  - c.5 deletion inside `R1` has weight 1, and `Q`-deletions have weight 0;
  - c.6 T-D-R1 double counting on the `(t+2)`-symbol cube;
  - c.7 attainment;
  - c.8 (LB) transfer, plus `n = 3 + m + (t+1)dm` and the integer inequality.
- (b) **None compiled.** (LB) is available as the r27 award C1-LA4 (`Erdos993G1.forest_descent_linear_bound`). It would need a
  bridge from `C5LA1.crossingIndex` to `Erdos993G1.delta`, and that bridge is not on any face I can read.
- (c) **Smallest unproved formal node: c.1 plus c.2**, a Lean `CBstar` graph with its sector bijection. No such declaration exists.
- **Ruling:** contract-ready at the informal level after its isolated second read. **Not** ready for a Cycle 2 Stage 7 award. Nodes
  c.3–c.6 are graph-generic, and I recommend formalizing them as a general sector lemma (see Route T-B) rather than for `CBstar`
  alone.

**Not ready (with reasons).**
- **E7 (sector Hall at three `CB` rows).** It is a finite, `computer_assisted` result, and a bounded result never qualifies.
- **E3 (`CB` reductions).** These are intermediate nodes of an unproved restricted-scope theorem, not an award.
- **E5 (L1, P1).** Superseded in scope by E4, except P1(i). P1(i) is a coefficient-sign fact of little leverage.
- **E6 (T2's lemmas).**
  - T-D-R1 is the q-ary generalisation of the registered NM. It should be a companion of G-CBSTAR, not its own award.
  - T-A and T-E are records.
- **A restricted-scope (HALL) theorem on `CB(8,86)`, `CB(8,89)`, `CB(8,92)`.** NOT ready. The smallest unproved lemma is
  **(CF-HALL):** (HALL-COND) for every `X ⊆ O ≅ I_{p+1}(T')`, where `T' = T − {r,s,v}` is the choke forest (`m` disjoint spiders,
  each a choke with `d` pendant paths of length 2), at the first eligible `p`.
  - This is a necessary case, because O sources reach positive weight only on O-targets, and it is open.
  - The full obligation is listed below.
- **(HALL) at SOLUTION-CONTRACT §2 scope.** Not ready. No informal proof exists.

**Contract-ready award groups in this orientation for Cycle 2 Stage 7: none.** G-SPEC and G-CBSTAR become contract-ready once their
isolated second reads confirm them.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

Cycle 2 produced new lemmas at `proved_informal` or better in this orientation:
- E1, which closes the Cycle 1 node (n1) that Lemma C cited;
- E4, the first parameter-uniform statement on which sectors can be switch-necessary;
- E3, which localizes obligation (a);
- E2 and E6.

It also produced the first **complete** sector Hall under the mixed relation on the three switch-necessary rows (E7,
`computer_assisted`), where Cycle 1 had only a conditional statement at 492. This is material progress on a clearly identified
part of (HALL), though critic-attributed for the most part. The routes' own contributions are E2 and E6. The plateau condition
(no material progress, no new lemma at `proved_informal` or better, no new adversarial finding) is not met.

The stop gate's decisive events are not triggered by this orientation: no (HALL) award, and no deficient cut. This orientation
found no (CUT) candidate. My small-`CB` max-flows show deficits only at non-eligible low ranks, where supply exceeds capacity
outright, so they carry no signal.

## Headline assessment

headline_resolved: no
status: still_open

Statement by statement, at this orientation's evidence grade:
- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: **still_open**. No full-network Hall theorem is proved on any row of this
  portfolio. Sector subfamilies are settled on the three `CB` rows (E7) and on `CBstar`, `t ≥ 2` (E4). Families outside the sector
  are open.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: VERIFIED `formally_verified` (C1-LA1), not re-adjudicated. Re-confirmed
  numerically from independent sides on the five `CB` rows and the small `CBstar` rows (`bounded_computation`).
- **Outcome-B candidates.** None is registered here, and each needs an isolated second read:
  - E1: proved, `proved_informal`;
  - E4: proved, `proved_informal`, under `F ⊇ {v} ∪ P`;
  - E3: proved reductions;
  - E5: proved;
  - T-D-R1 and T-E: proved.
- **(SW) template:** not a statement.
- **Primary aggregate:** untouched.

## Next-route allocation

**Exact remaining obligation for this orientation** (at `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`; every other eligible rank is
already sector-complete). (HALL) at these three rows now needs exactly:
- **(O1) Hall on the non-sector world:** `Σ_X w ≤ Σ_{N(X)} w` for every `X ⊆ R0 ∪ S ∪ V ∪ O`.
  - Its core, **(CF-HALL)**, is the choke-forest network `T'` at rank `p+1` (O sources). Positive-weight O-exits are O-targets only.
  - S sources and V sources are each copies of `T'` at rank `p`, and they are coupled through the `v`-free O-targets. The coupling
    is via `B ↦ B − v`, the V sources' only `v`-free exit.
- **(O2) The coupled allocation:** Hall for every `X` meeting `sec`, a positive-weight V source and a positive-weight S or O source
  together. The V-targets must be shared between the sector's choke-switch exits and the V sources' deletions, and the sector
  targets between sector deletions and the V sources' `r`-switch (E3).
  - Scale, from the class records (bounded priors): the sector's worst-case switch residual is at most
    `R_k − R_{k−1}`, between 4.4×10⁻⁶ and 6.4×10⁻⁶ of `W'_p` on the three rows (C-T2-U's theorem at `t = 1`), against about 1.6% class-level slack.
- **(O3) Sector Hall at `CB(8,108)/577` and `CB(7,144)/673`** (allocation obligation (b)): every `X ⊆ X_sec` with `|X|/R_k < θ`
  (θ = 6.643e−9 and 2.606e−15). No spectral route exists (`k² < λ₂`).
- **Second reads.** Isolated second reads of E1, E3, E4, E5 and the E7 composition.

**Route T-A (Cycle 3): `CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION`.** Prove (CF-HALL) and (O1) on `T'`.
- *Method:*
  - Use INV to restrict to `S_d ≀ S_m`-invariant families.
  - Classify sources by `q`, the number of included chokes. Each `q`-class is a product of `q` "choke-in" blocks (leaves free,
    weight = leaf count) and `m−q` ternary blocks.
  - Prove per-class Hall with slack. The `q = 1` class is the thinnest, at ratio 0.9902 (C-T1-F), and E4's self-covering idea
    applies: deleting a choke-in block's choke is a private exit.
  - Then close (O2) by an explicit flow: route the sector's residual (the E7 composition's switch share) into the V-target slack
    left after the V sources are served inside their `T'` copy.
- *Could close in one cycle:* a restricted-scope (HALL) theorem at the three `CB` rows (`computer_assisted`, as a separate key). That
  would be the first full-network saturation with switch arcs load-bearing on a whole tree. Failing that, it would yield an
  explicit coupled family whose deficit sign becomes a sharp (CUT) candidate for F.

**Route T-B (Cycle 3): `GENERAL-SECTOR-SELF-COVERING`.** Generalize C-T2-U's reduction to an arbitrary tree `T` and an independent
`Q` with `T − N[Q]` a star forest.
- *Method:*
  - The `Q`-deletions are always private exits.
  - Bound the weight lost when `q ∈ Q` is a witness.
  - Reduce any sector deficit to the residual family on which every present star is "weight-inert".
  - Characterize exactly when that residual is deletion-deficient, using T-D-R1 at non-uniform `q_i`. This is where C-T2-F
    showed that biregularity fails, so a weighted LYM is needed.
- Include (O3) as the `t = 1` small-set test case: a Kruskal–Katona-type shadow bound for the product of `N` copies of the
  three-element V-poset.
- *Could close in one cycle:* a parameter-uniform outcome-B (NMP) lemma at `proved_informal` identifying every switch-necessary
  sector shape on trees. It would also yield a Lean-friendly generic statement that absorbs G-CBSTAR's nodes c.3–c.6.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-adj-T/`.
Everything uses the standard library only, with exact integers and Fractions; floats appear only in displayed ratios. Everything ran
in the foreground. No background job was started, so none was left to kill. No `__pycache__` was written (`python3 -B`).

`copy-T1/` holds byte-identical copies of T1's ten inventoried files (digests as in T1's table), used for inspection.

`own/` (SHA-256):

| file | sha256 | content |
|---|---|---|
| `adj_lib.py` | `90929469a50eff06c422f53ef7a4d7293f77ac2277782c64b8e49dc533a683d8` | polynomials, tree test (connectivity and acyclicity separately), forest DP, `x` through `α`, literal `w_F`, literal (D)∪(S), Dinic |
| `spec_n1.py` | `f8b064b6b1ead957fea817a72e18fd3f470bd44d15ce5e21eb7c50b8797a8a80` | (n1): exact PSD and nullity, 24 operators |
| `out_spec_n1.txt` | `429ae1b4a50f58f60a5e8673d1939550e7ac95d881ad2307acb70570aa027480` | `ALL_OK True`; internal DIGEST `def4b006…` |
| `cb_rows_adj.py` | `82f4dad2ca6759349daee834d46027212db12195c60678b2579356b8e9709f4c` | five `CB` rows: tree, `n/α/x`, window, selector, WID from independent sides, Lemma C margins, rank coverage |
| `out_cb_rows_adj.txt` | `699ddb174d29a9840f221efe3e162f5a6b37921a0a484dd6687c2c931492d0e4` | internal DIGEST `a4e03649…` |
| `cb_competition.py` | `677ad1b317668721d0992897ee44341c7daaf352fad92b3afcbbe6a42a5b33eb` | small-`CB` competition-map facts; mixed and deletion max-flows at every rank |
| `out_cb_competition.txt` | `790917c6633cf0361a9bf6fc7ab0ffdd48e436e0be483d518f959c3bf550f07c` | internal DIGEST `efae5bba…` |
| `cbstar_adj.py` | `0ef115619d961defc7c943d82fa2ea0d2469ccd03e53f75e9fe0068e761aca91` | C-T2-U formula against max-flow; L1 for three selectors; switch families; WID; P1 grid |
| `out_cbstar_adj.txt` | `036b4734f22da8bb0a59cc7235722095f693ea16b6c44ee3245734c980a32fb4` | internal DIGEST `0ae0e30c…` |
| `class_deficits_adj.py` | `359bafa14c31caa8fd869290ab65ec8104f01ecfa7479c47ab79a88204b02828` | replay of C-T1-U's class balances |
| `out_class_deficits_adj.txt` | `61de24f3c369154935fd7459c279ba87128bbc0b029fb0e9605392242b44b883` | internal DIGEST `d5252cec…` |

Replay, from `own/`: `python3 -B spec_n1.py; python3 -B cb_rows_adj.py; python3 -B cb_competition.py; python3 -B cbstar_adj.py;
python3 -B class_deficits_adj.py`. Each run takes under 40 seconds.

Deliverable: this file only, `cycles/cycle-2/stage5/adjudicators/T/ADJUDICATION.md`. Reread before close: done.
