# Orientation Adjudication

Isolated Stage 5 adjudicator, orientation F (falsify), Cycle 1 of r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`):
a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank. Portfolio: returns `F1`, `F2`,
`F3` and their six cross-orientation critiques (`C-F1-T`, `C-F1-U`, `C-F2-T`, `C-F2-U`, `C-F3-T`, `C-F3-U`). Date 2026-09-27.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the dispatch requires. The first display of `verity.md` was cut
in the middle (about 5 KB), so I read the missing lines 95–215 of the same file. I loaded no other VerityOS subsystem.

**Model disclosure.**
chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Dispatch.** `control/dispatch/c1-stage5/DISPATCH-ADJ-F.md`: SHA-256
  `94ac726ee7085780d5dd126f645f978654555bae543e1b0a515c18d529c7f607`. I recomputed it before reading, and it matches.
- **Capsule seal.** `control/c1-adjudicator-capsules/F-PACKET-MANIFEST.json` recomputes to
  **`b03f4a6365ed7b4fd81dd32c3dc050a83caf21341ec884109514032b7ff301d4`**. The recipe is canonical JSON without `seal_sha256`,
  with sort_keys, `(",", ":")` and no trailing newline. It **matches**. All **24/24** listed files match their byte counts
  and SHA-256 (`scratchpad/c1-adj-F/seal_check.py`).
- **Upstream manifest seals.** I recomputed each one, and all match:
  - Stage 2: `e747e52e…3dbc`
  - Stage 3: `e6cb6647…2a37`
  - Stage 4 packet: `40f2e216…fec`
  The F returns and critiques match their Stage 3 and Stage 4 manifest entries.
- **Artifact digests.** Every digest in the portfolio that I re-hashed from a copy-out matches its stated value. This covers
  `row_check_out.json`, `RESULTS.json`, `elig_top_sweep_output.json`, `favorability_output.json` (2396) and the critics'
  `closed_forms.json`, `uniform_proof_out_M0_107.json`, `RESIDUAL.json`, `certificate_output.json`, `symbolic_J10_U35.json`,
  `symbolic_report.json`, `hull_symbolic.out`, `sweep_107_2600.json`, `fidelity_output.json`, `crit_lab_out.json` and
  `literal_reduction_lab_out.json`. I also re-ran C-F2-U's `symbolic.py` and `hull_symbolic.py` copy-out-first, and both
  outputs reproduced byte-identically.
- **Route identity.** All three route IDs and mechanism tokens appear verbatim: `C1-F-01`
  `LITERAL-NETWORK-FIDELITY-AND-SHARED-CAPACITY-AT-FRESH-ROWS`, `C1-F-02` `LS-TOP-ASYMPTOTIC-AND-ENDPOINT-STRESS` and `C1-F-03`
  `ELIG-TOP-DESCENT-ADVERSARY`. Each seat gives a two-part disclosure (`claude-sonnet-5`), and each critic gives
  "chartered opus/medium … claude-opus-5-5".
- **Controller facts** (`C1-STAGE5-CONTROLLER-FACTS-F.json`) are read as facts only, never as authority. CF-F-1 and CF-F-2
  concern other orientations and are STATED there. I did not use them as evidence. CF-F-3 is a prior and agrees with my replays.
- **Process findings carried from the record.** I rule on these; none of them strikes a number.
  - F2's `pgrep -fl` exposed sibling command lines. Both F2 critics flagged it, and the controller has since recorded it in the
    Stage 4 `stage3_addendum`. Nothing from it was used.
  - F3 imported `numpy`, which breaches worker rule 7. It was used only as an object container for exact ints, and the results
    were replayed by stdlib instruments.
  - C-F1-U had one stray `grep -c` above its grant. It showed names and zero counts only.
- **My own read-boundary disclosures.**
  1. The harness injected the project `CLAUDE.md` and the user memory index into my context. I did not fetch or use them, and I
     wrote no conversation log, because the dispatch confines my writes.
  2. I made one `cat` of `F2/RETURN.md` into the session scratchpad outside my granted scratch directory. I deleted it at once,
     and it held only that capsule member.
  3. The harness saved the display of `F1/RETURN.md` to a tool-results file, and I read it there. It is the same content.
  4. I made non-recursive listings of the inventoried scratch directories `scratchpad/c1-F1/`, `c1-F2/` and `c1-F3/`, and of
     `c1-crit-<seat>-<o>/` and their `own/` subdirectories.
  5. I read `favorability_check.py` and `core.py` from the copy-out of F3's inventoried scratch.

  I read no other orientation's portfolio, no adjudication, no other experiment root, and nothing from the network. I ran no
  install and no Lean. I **started no background job**, so none needed killing. Every computation ran in the foreground.

## Route-by-route decisions

### F1 — `C1-F-01`: verdict `retained_narrowed` (grade `computer_assisted` / `bounded_computation`)

**Retained (replayed by both critics and by independent instruments):**
- n, α, x, eligibility, `p*−x = 2`, `F_{p*} = leafSet` and `S < 0` at m = 95, 107, 110, 113. At 110 and 113 the critic checked
  all 881 and all 905 leaves literally.
- ρ₁ at 107, 110 and 113, with the m = 95 fixed point.
- Template feasibility at the fresh rows 110 and 113 with θ* = 288/(200m²+82m+5). This meets the precondition of gate ruling 2.
  Both critics dual-certified the θ* optimality; the return did not.
- The candidate key `E993-R31-CB-8-M-110-AND-113-CHOKE-LOCAL-SECTOR-CERTIFICATE-EXACT-FEASIBILITY-AT-RANK-16M-PLUS-4-OVER-3` at
  `computer_assisted`. It would be subsumed by the uniform statement below. Any registration should cite the shipped tables
  (C-F1-U `F1_replayed_certs.json`, `crit_lp_out_107_110_113_116.json`), because the return saved none.

**Struck or narrowed (both critics agree):**
- "(WID) from independent sides" is **struck**: it checks Σq(p) − Σq(p−1) against Σ(q(p) − q(p−1)), which is a tautology. The
  fact itself stands on the critics' independent weight-side counts and brute force.
- The laboratory is **narrowed** to "spot-checks of weights and switch mechanics". It used K = dm − 1 only, d ≠ 8, and computed
  no loads.
- The digit range of `S` is **corrected** from 365–434 to 363–432 (C-F1-U).
- The `256m/20451 ≈ 1.3` gloss is **struck** as incoherent.

**Paired disagreement, claim A2 (the entrywise reproduction of the frozen m = 107 table).**
- C-F1-T strikes the framing because the LP optimum is not unique. C-F1-U retains the literal because the replay prints True.
- **Ruling: the literal is true, and its evidential weight is narrowed to θ and feasibility.** My own evidence settles the
  non-uniqueness: the two critic-derived closed-form allocations are different optimal points with the same θ = 288/L. They
  differ at pc(0,2), pc(0,3), pc(0,4), pc(0,5) and pc(0,8), and both pass every constraint (`adj_template_out_F1T.json`,
  `adj_template_out_F2U.json`). So an entrywise match with the frozen vertex shows a shared vertex-selection path, not an
  independent confirmation beyond θ.

**No cut search was shown (C-F1-T A6).** The point is moot: see the adversarial ruling under Cross-route reconciliation.

**Gate line.** `LS_top: advanced` is read as "the fresh-row precondition was met". It is a bounded summary only.

### F2 — `C1-F-02`: verdict `retained_narrowed` (grade `bounded_computation`)

**Retained (byte-identical replays by both critics; independent dual-certified LPs):**
- The five recorded θ* values and the fresh rows 110 and 113.
- θ* equal to the law at 200, 500, 1001 and 10001. C-F2-U extends the certified LP to 100001 and 1000001.
- ρ₁ and the margins at those rows.
- n, α and x at 95–113.
- The residue note, which is record-only.

**Struck (both critics):**
- **Candidate 1**, `…BOUNDED-BELOW-M107`, lies outside the class. Its inference about the m ≥ 107 cutoff is also struck: C-F2-U
  shows p* is **not eligible** at any sampled m ≤ 83. I confirm this at m = 80 and 83 (`p*−x = 1`), and the first eligible
  residue-2 row is m = 86 (`p*−x = 2`) (`adj_rows_out.json`).
- **Candidate 2**, "tight set invariant in m at the LP optimum", describes a vertex, not a property of the LP. C-F2-T, C-F2-U
  (face maximisation and an explicit witness) and my own check all show this. My two verified optimal closed-form allocations
  have different tight sets: Out 39 and In 36, against Out 44 and In 31.

**Corrected:**
- "13 in-class rows" becomes 7.
- `margin/m` at 10001 becomes 0.325528.
- "≈0.3256" is replaced by the exact limit 125/384. C-F2-T and C-F2-U derive it independently, and I confirm
  `lim m(1−ρ₁) = 15/32` (`adj_rho_out.json`).
- The grade label "`proved`" for the θ = 0 deficit is not a contract grade. That fact is an alias of the registered
  `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`.
- "p*−x = 3, 7 at 200, 500" was unbacked in the digest. Both critics now back it.

**Paired disagreements:**
- **The `LS_top: advanced` gate line.** C-F2-T retains it; C-F2-U says the return's own content does not support it. **Ruling
  for C-F2-U on the return's content.** F2's own content is bounded evidence. The orientation's (L-S)_top advance is
  critic-derived and is graded that way below. Gate lines are never evidence.
- **"Does the affine separation ever fail while the exact system is feasible?"** C-F2-T says yes at m = 2: the exact
  all-splittings template is feasible with θ = 681376/2399605 while the affine LP is infeasible. C-F2-U (F-9) says the affine
  and exact optima coincide on the class. **Ruling: the two are compatible.** C-F2-T's result is at m = 2, outside the class and
  at a non-eligible rank. It is critic-attributed, and I did not replay it. C-F2-U's result is stated only for m ≥ 107. Neither
  bears on feasibility, because any θ ≤ 1 − ρ₁ suffices.

### F3 — `C1-F-03`: verdict `retained_narrowed` (grade `bounded_computation`)

**Retained:**
- Parent descent at all 69 rows 2396 ≤ m ≤ 2600, with `x < p* − 2` there. Both critics replayed it byte-identically, and C-F3-U
  swept all 832 class rows 107–2600 with an independent Miller-recurrence engine.
- E1(i) at every q at 107, 110, 113, 116 and 500. The critics extend this to 95 and to 1001 and 2000.

**Paired disagreement on favorability.** C-F3-T lists "favorability at 107…2396" as standing, on the strength of byte-identical
replays. C-F3-U strikes it for a fidelity failure: the shipped loop evaluates `G^{m−1}` and `G^{m−2}` in place of `G^m` and
`G^{m−1}`.
- **Ruling for C-F3-U; the evidence is struck.** I read `favorability_check.run`. `gvec` is advanced only after the sample block,
  so at iteration m it holds `G^{m−1}`. A byte-identical replay reproduces the defect and does not validate the content.
- The conclusion is re-established independently. The critics use literal trees at 107/110/113/116 and closed forms at
  116/500/2396/2600. My own check with the correct polynomials finds both leaf classes favorable at 80, 83, 86, 89, 107, 110,
  113, 158, 161 and 164, and confirms that F3's polynomial differs from `I(T−v)` at every one of those rows
  (`adj_rows_out.json`).
- This remains a bounded confirmation. The favorability key keeps its registered grade.

**Struck or corrected (both critics):**
- The "descending mass (j ≥ 3)" label and the 3.917 ratio: the tail was netted in, and the tail *ascends*. The corrected ratio
  at m = 107 is 3.4655 (both critics).
- "Only 3 blocks need hand control" is false, because the tail must be controlled too.
- n and α were set by formula, not reproduced independently, which is a tautology.
- "Four orders of magnitude" is wrong.
- The `256m/20451` law is narrowed to the 69 rows. Both critics find it failing at m = 479, and C-F3-U also at 1358 and 1997.
- The "m = 1000 horizon" is not a class row.
- The "bit-for-bit independent" cross-check compares two evaluations of one closed form, so it is narrowed.

**F3's open items, closed by critics.**
- The crossover is proved by both critics. My own certificates confirm it independently: the tail and j = 0, 1, 2 ascend, and
  j = 3…10 descend, for every u ≥ 35 (see below).
- The parent-descent/first-descent transition is at **m = 161** (C-F3-T and C-F3-U). I confirm `p*−x = 2` at 158 and 3 at 161
  and 164.

## Cross-route reconciliation

**Fidelity first.** The weight, relation, selector and x are r30's of record, and the fidelity chain holds.
- (WID) is asserted from genuinely independent sides only by the critics (C-F1-T and C-F1-U, at 95–113 plus brute force). F1's
  own assertion is struck.
- `F_{p*}` is derived literally at 107/110/113 (C-F1-U all leaves; C-F3-U; C-F3-T).
- x is computed through α on literal trees (C-F1-T, C-F3-T, C-F3-U). I independently checked that the literal tree DP equals
  the closed forms of `I`, `I(T−v)` and `I(T−c)` at m = 110 (n = 1873).
- No Newton or Darroch is applied anywhere to I, G, Gᵐ or a forest polynomial. The only uses are on real-rooted blocks
  `P_j = (1+x)^{8j}(1+2x)^{8(m−j)+1}`.

**Adversarial record (check 7).**
- **No candidate cut exists in the portfolio.** No seat or critic proposed one, and every gate line reads `cut_candidate: none`.
- Horizons attained:
  - Template feasibility with the exact DP: seats to m = 1001 (F2), critics to 200 and at 116–125 and 170. I add 137 and 263
    with my own DP.
  - Dual-certified θ*: to m = 1000001 (C-F2-U).
  - Parent descent: every class row 107–2600 (C-F3-U), with F3's 69 rows beyond 2395.
  - E1(i) at every q: at 107–122, 500, 1001 and 2000.
- A necessary global switch-capacity bound θ ≥ θ_LB sits within a factor of about 1.188 of θ* at 107–116 (C-F1-U, bounded).
  It leaves no room for a deficient cut there.
- **Once the composition below holds, it excludes every deficient cut at every m in the class** (a saturating flow gives
  (HALL-COND) for every X). The adversarial search is therefore closed at `proved_informal` modulo the carried keys.
- **Template failures, all outside the class:**
  - At m = 2 the affine separation is infeasible while the exact system is feasible (C-F2-T). At m = 2, p* is not eligible.
  - The closed-form vertex family needs real m > 1069/40 = 26.725, where pb(1,7) ≥ 0. It fails at m = 5 (C-F1-T), and my
    checker finds the same threshold.

  **No in-class template failure exists.**

**Critic convergence (weighed against the self-reports).**
- Two critics of different orientations, C-F1-T (T) and C-F2-U (U), each independently found a closed-form allocation proving
  (L-S)_top in template form for every m ≥ 107. Their allocations share θ, σ, a, λ, a₂ and λ₂, and differ in five pc(0,·)
  entries.
- Three critics (C-F1-T, C-F2-T, C-F2-U) each derived an exact rational form of ρ₁ and a Residual certificate.
- Both F3 critics independently proved (ELIG-top)(a):
  - C-F3-T uses an S₅ certificate, a δ₆ certificate, and Darroch for j ≥ 7.
  - C-F3-U uses a J = 10 certificate and Darroch for j ≥ 11, and notes that J = 5 also works.
- I re-derived each of these with my own instruments; see below.

## Established results

All the advances below are **critic-attributed**. They were STATED at a review stage (Stage 4), and I verified them
independently as the isolated adjudicator. Registration still needs whatever isolated second read of record the controller
requires. My re-derivations are offered as that read's input, and I do not rule that they are the read.

**E1. (L-S)_top in template form for every m ≥ 107, m ≡ 2 (mod 3).**
- **Attribution:** C-F2-U F-8 and C-F1-T item 6, found independently.
- **Allocation**, with L = 200m² + 82m + 5 and K = p* − 1 = (16m+1)/3:
  - θ = 288/L;
  - σ(γ) = 288γ/((8−γ)L);
  - a = −21/(2L), λ = (75m+30)/(2L), a₂ = (600m+72)/L, λ₂ = −(150m+15)/(2L);
  - pb(β,γ) = (75m/2 + c^b_{βγ})/L and pc(β,γ) = (75m/2 + c^c_{βγ})/L, with the intercept table of
    `c1-crit-F2-U/own/closed_forms.json` (`0335f7e0…c44`). C-F1-T's alternative table is `uniform_proof_out_M0_107.json`.
- **Adjudicator verification** (`own/adj_template.py`; outputs `16d6547b…` for F2U and `cedf5c5c…` for F1T). For *both* tables,
  exactly:
  - every pb and pc numerator is ≥ 0 for real m ≥ 1069/40;
  - all 45 Out rows `Out − (a+λn) ≥ 0` and all 45 In rows `a₂+λ₂n − In ≥ 0` hold as polynomial certificates from m = 107.
    They are in fact m-free, with 39 and 36 rows tight in F2U;
  - `m·a + λK = 1` and `m·a₂ + λ₂(K−1) = 1` hold identically;
  - every Switch row `(8−γ)σ(γ) = θγ` holds with equality.
- Out ≥ 1 and In ≤ 1 over **every** splitting follow by summing the affine rows over the m chokes. Empty and full chokes are
  included, since Out(0,0) = 0 ≥ a and In = 0 at n = 8.
- **Residual** (`own/adj_rho.py`, output `1b54d628…`). My own Pascal term-ratio derivation gives ρ₁ = A(m)/B(m) with degree
  15/15. It is checked against direct binomials at m = 95, 107, 110, 113, 116, 131, 200, 1001 and 10001, and against the m = 95
  fixed point. From it:
  - `(B−A)L − 288B`, of degree 16, has all Taylor coefficients ≥ 0 from m = 3, and B > 0. So **288/L ≤ 1 − ρ₁(m) for every
    real m ≥ 3**, in particular for the whole class.
  - `lim m(1−ρ₁) = 15/32`, and C-F2-T's bounds `15/32 − 1/(8m) ≤ m(1−ρ₁) ≤ 15/32` (m ≥ 107) certify.
  - The margin slope (1−ρ₁)/θ is asymptotic to (125/384)m.
- **Out-of-sample checks:**
  - My own exact min-plus/max-plus DP gives min Out = 1 and max In = 1, with Switch and Residual holding, at fresh rows
    m = 137 and 263 (`own/adj_lab.py`, output `9f921dc1…`). The margins are 44.67 and 85.68.
  - C-F2-U evaluated the closed forms at 22 residue-2 values of m from 50 to 10⁷+1.
- **Grade:** `proved_informal` at template level, Darroch- and Newton-free, and critic-attributed.

**E2. The per-state reduction and the composition (the bridge from template to network).**
- **Attribution:** C-F1-T A5, C-F1-U re-derivation 5, and C-F2-T attack 1, which agree. **Owner of record: U2**, per gate
  ruling 4. I verified the argument on its face:
  - **Out-arcs of a sector source** B = {r, v} ∪ legs. The only u ∉ B with |N(u) ∩ B| = 2 are s, and u_i with β_i = 1. Supports
    and leaves have at most one neighbour in B.
    - Deleting r or v, the s-switch, and the u_i-switch at γ = 0 all land on weight-0 targets at rate 0.
    - Deleting a leg lands in-sector.
    - The u_i-switch at (1, γ ≥ 1) gives an r-free one-choke image of weight γ. Its active tags are exactly the γ leaves
      c_ij, through u_i, and v is inactive because r has gone.
  - **In-arcs of an in-sector target:** exactly the 2(8 − n_i) additions of b or c at empty legs, and each such preimage is a
    sector member. Switch preimages of an in-sector target are r-free non-sector sets. E1 is deletion-only, so they carry 0.
    Hence the inflow is `Σ_i (8−n_i)(pb(β_i+1,γ_i) + pc(β_i,γ_i+1))`.
  - **Switch image:** it has exactly 8 − γ sector preimages, each in state (1, γ). Its E1 load is ρ₁γ, because q = 1 and
    w_F = γ. So its total load is ≤ θγ + ρ₁γ ≤ γ.
  - **Other targets:**
    - one-choke targets not reached by a switch get ρ₁w ≤ w;
    - targets with ≥ 2 chokes get ρ_q w ≤ w by E1(i);
    - in-sector targets get 0 from E1 and ≤ 1 = w from the sector.
  - **Scaling:** scaling each source to outflow exactly 1 only lowers loads.
  - **Conclusion:** summing over any X gives (HALL-COND), and an integral saturating flow follows from the kernel-checked
    companion or from max-flow integrality.
- **Adjudicator laboratory** (`own/adj_lab.py`). I enumerated every sector source of CB(8,1), CB(3,2), CB(4,2), CB(2,3) and
  CB(3,3) at all K, with random positive rational rates. Over **330,775 literal arcs** there are **0 mismatches**:
  - literal outflow equals ΣOut;
  - in-sector inflow equals ΣIn;
  - each switch image has load (d−γ)σ(γ) with d−γ preimages;
  - every zero-rate arc lands on weight 0.

  C-F1-U and C-F1-T ran d = 8 laboratories with extremal profiles on the actual trees at 107–113.
- **Grade:** at my evidence grade it is verified. For registration it stays STATED until U2's lemma is read (ruling 4).

**E3. (ELIG-top)(a) for every m ≥ 107, m ≡ 2 (mod 3).** Attribution: C-F3-T A8 and C-F3-U, found independently.
- **Setup.** Let m = 3u + 2 with u ≥ 35, k = p* − 2 = 16u + 10 and N = 8m + 1. Then
  `Δ = i_k − i_{k+1} = Σ_j C(m,j)([x^{k−j}]P_j − [x^{k+1−j}]P_j) + tail`.
- **Adjudicator certificate** (`own/adj_elig.py`, output `ede83d1e…`). My method is independent of both critics.
  - I evaluate S_J(u)·Den_J(u)/(C(N,k)2^k) exactly at 100–110 consecutive u.
  - Den_J is the product of the 9J + 1 distinct linear forms clearing every binomial ratio, so each term is a polynomial of
    degree ≤ 10J + 1. The polynomial is recovered by exact Newton interpolation.
  - Higher differences vanish, and three out-of-sample identities hold.
  - Taylor coefficients are then taken at u = 35.
- **Results:**
  - For J = 5, 6 and 10, every coefficient is strictly positive, of degree 50, 60 and 100. So **S_J(u) > 0 for all real
    u ≥ 35**.
  - J = 3 is uniformly negative, and J = 4 has mixed signs. This matches C-F3-U.
  - The per-piece certificates give: the **tail and j = 0, 1, 2 ascend, and j = 3, …, 10 descend, for every u ≥ 35**.
- **Blocks j ≥ J + 1 = 6.** Each P_j is a product of the linear factors 1 + x and 1 + 2x with positive coefficients, so it is
  real-rooted. The block mean is μ_j = k + (4 − j)/3 ≤ k − 2/3. Darroch places every mode strictly within 1 of μ_j, so every
  mode is ≤ k. Newton gives strict log-concavity, so the coefficients strictly decrease after the last mode, and that block's
  contribution to Δ is > 0. This use is legitimate under ruling 3.
- **Conclusion:** Δ > 0 for every m in the class, with **M₀ = 107 explicit and no finite residual range**. The bounded
  confirmations are F3's rows and C-F3-U's 832-row sweep, plus my rows 107–164.
- **(E) follows:**
  - x ≤ p* − 2, because x is the least descent;
  - 3p* = 16m + 4 < 18m + 3 = 2α + 1, with α = 9m + 1;
  - α is the block degree: the maximum of 8m + 1 + j at j = m, and the tail has degree 8m + 2 ≤ 9m + 1. It is also
    literal-checked at 95–113 and 110.
- **Grade:** `proved_informal` **modulo Darroch and Newton on real-rooted blocks**. This is the same dependency class as the
  carried keys. It is critic-attributed.

**E4. Record facts (critic-attributed, adjudicator-confirmed, `bounded_computation`).**
- The first eligible residue-2 row is m = 86.
- The first-descent transition is at m = 161.
- F3's favorability evidence is defective, and its conclusion holds at the rows above.
- The template LP optimum is not unique at the closed-form level: two verified optimal allocations exist for every m ≥ 107.

**E5. The θ*-law is the optimum of the affine and exact template on the class (C-F2-U F-9).**
- It is replayed byte-identically (`symbolic_report.json`, `hull_symbolic.out`).
- I did **not** re-derive the integer-hull step, so it rests on a single critic. It stays critic-attributed and STATED.
- It is **not load-bearing**: feasibility needs no optimality, and the law is never a hypothesis.

## Rejected and narrowed mechanisms

- **Struck evidence:**
  - F1's (WID)-independence assertion;
  - F3's favorability check (it evaluates the wrong polynomials);
  - F3's and F1's tautological n/α and R_K "reproductions";
  - F2 candidate 2 (a vertex artifact);
  - F2 candidate 1 (outside the class, at non-eligible ranks);
  - F2's m = 2 "structural" reading (C-F2-T; record only).
- **Narrowed:**
  - F1's laboratory;
  - the entrywise m = 107 reproduction (θ and feasibility only);
  - the `256m/20451` fit (the 69 rows only);
  - F3's block crossover, from "empirical" to proved (critics, adjudicator);
  - "only j ≤ 2 need control" (the tail too).
- **Refuted mechanisms stay refuted.** None is revived:
  - the allocations depend on m, so they are not the refuted m-independent per-choke certificate;
  - nothing is deletion-only;
  - there is no compression lemma;
  - there is no real-rootedness of I, G or Gᵐ.
- **Fences.** One rank per tree and the class only. Nothing is claimed at m < 107, other residues, d ≠ 8, or other ranks. Any
  thresholds below 107 in the certificates (26.725, m ≥ 3, u ≥ 33) are properties of the proofs, not claims. No status
  transfers:
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, the primary aggregate and Erdős #993 stay OPEN;
  - FLOW ⇒ SIGN gives S(T_m, p*) ≤ 0 on the class rows only.

## Lean readiness

My orientation shipped **no Lean**: no compiled scratch, no `#print axioms` and no build log. So there is nothing to confirm
or strike on that axis. My rulings on the award groups:

**G-F1 — the (L-S)_top template arithmetic.**
- **Status: CONTRACT-READY** as an arithmetic award, subject to the controller's second-read ruling.
- **(a)** The informal proof is complete, with a closed DAG:
  - 84 explicit rational shares;
  - 90 m-free rational inequalities;
  - two polynomial identities;
  - a linear nonnegativity bound;
  - the finite-sum Out/In lemma;
  - the ρ₁ Pascal term-ratio identity;
  - one degree-16 shifted-coefficient certificate.
- **(b)** There are no compiled fragments.
- **(c)** The open *formal* nodes are the Pascal ratio lemma `C(b,s+t)·Π(s+l) = C(b,s)·Π(b−s−l+1)` over ℕ with guards, and the
  degree-16 positivity certificate (explicit shift plus `norm_num`, never `native_decide` in the universal step).
- **Draft statement** (the synthesis freezes it):

  ```lean
  theorem cb8_topRank_sectorTemplate_feasible (m : ℕ) (hm : 107 ≤ m) (hres : m % 3 = 2) :
      (∀ s ∈ states8, 0 ≤ pb m s ∧ 0 ≤ pc m s) ∧ (∀ γ ∈ Finset.Icc 1 7, (8 - γ) * σ m γ ≤ θ m * γ) ∧
      (∀ c : Fin m → State8, (∑ i, legs (c i)) = (16*m+1)/3 → 1 ≤ ∑ i, Out m (c i)) ∧
      (∀ c : Fin m → State8, (∑ i, legs (c i)) = (16*m+1)/3 - 1 → ∑ i, In m (c i) ≤ 1) ∧
      θ m ≤ 1 - (r1 m ((16*m+4)/3 - 1) : ℚ) / r1 m ((16*m+4)/3 - 2)
  ```

  Here `r1 m k := ∑ i ∈ range 8, choose 7 i * choose (8*m-7) (k-i) * 2^(k-i)`, with the guard i ≤ k.
- **Hypotheses:** m ≥ 107 and m ≡ 2 (mod 3).
- **Fences:**
  - it is a template-level statement, not (H);
  - it carries no network definitions;
  - it makes no optimality claim.
- **Carried entries:** none needed. The composition with the network needs C1-LA1/C4-LA1 entries per SOLUTION-CONTRACT §2.
  I did not inspect those `Snippets/` and cite no entry numbers or digests for them.
- **New declarations:** `states8`, `State8`, `pb`, `pc`, `σ`, `θ`, `Out`, `In`, `r1`.

**G-F2 — (ELIG-top)(a).**
- **Status: NOT contract-ready** as a full award.
- **(a)** The informal proof is complete *modulo Darroch*, an external classical theorem that I do not know to be in the pinned
  Mathlib and did not check.
- **(b)** There are none.
- **(c)** The J = 5 certificate is a closed, Lean-checkable node: S₅(u) > 0 for u ≥ 35, of degree 50, via a product-of-linear-
  forms identity for binomial ratios.
- **The smallest unproved lemma** is a Darroch-free block descent: for m = 3u + 2, u ≥ 35 and 6 ≤ j ≤ m,
  `[x^{k−j}]P_j ≥ [x^{k+1−j}]P_j` with k = 16u + 10 and P_j = (1+x)^{8j}(1+2x)^{8(m−j)+1}. Formal Darroch would also discharge
  it.
- A funded intermediate award could be the S₅ lemma alone. It is not progress on (ELIG-top)(a) until the block lemma lands.

**G-F3 — composition and reduction (the terminal's (H) side).** This is **not in my portfolio**; it belongs to U2 and U1.
Its informal content is verified on the face in E2, but its formal readiness is ruled by the U adjudicator.

**The θ*-optimality (E5)** is not funded as an award, because it is not load-bearing.

**Bounded results** (F1/F2/F3 rows and sweeps) never qualify.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Material progress on Tier 2** comes from both missing lemmas, with every advance critic-attributed and adjudicator-verified:
- **(L-S)_top** is proved at template level for every m in the class. It is Darroch-free, and the explicit M₀ = 107 leaves no
  finite residue.
- **(ELIG-top)(a)** is proved for every m in the class modulo Darroch and Newton on real-rooted blocks.

The F seats' own contributions are bounded:
- the fresh-row precondition (ruling 2) is met at 110 and 113;
- the parent-descent census is extended to 2600;
- the θ*-law is checked to 10001;
- no cut or template failure was found in the class.

**Stop gate** (unarmed in Cycle 1):
- **Decisive event (b)** does not bear: there is no cut, and the composition excludes any cut at `proved_informal` modulo the
  carried keys.
- **Decisive event (a)** does not bear: nothing is `formally_verified`. A Tier 1 at `proved_informal`, even when confirmed by a
  second read, is explicitly not decisive.
- **Plateau** is not met, because new `proved_informal` lemmas and new adversarial findings were made this cycle.

## Headline assessment

headline_resolved: no
status: proved

The status is at my orientation's evidence grade: **`proved_informal` modulo the carried keys**. Per statement:

- **(L-S)_top:** proved for every m ≥ 107, m ≡ 2 (mod 3), at template level (E1). It is critic-attributed (C-F1-T, C-F2-U;
  Residual also C-F2-T) and adjudicator-verified. Its bridge to the literal network (E2) is verified on the face here, and is
  STATED for registration until U2's lemma is read.
- **(ELIG-top)(a):** proved for every m in the class, modulo Darroch and Newton on real-rooted blocks j ≥ 6 (E3). It is
  critic-attributed (C-F3-T, C-F3-U) and adjudicator-verified. It is no longer `bounded_computation`-only once the second read
  of record registers it.
- **(E):** proved, as (a) together with 3p* < 2α + 1 and α = 9m + 1.
- **(H):** proved by E1 + E2 + the carried keys:
  - the E1 criterion key (`proved_informal`);
  - E1(i) at p* for every q (threshold key, `proved_informal` modulo Darroch on the r_q; ⌈μ₁⌉ + 2 = p* checked);
  - the favorability key (`proved_informal` modulo Darroch/Newton).

  Its grade is the weakest input's.
- **Tier 1** is therefore complete at `proved_informal` modulo Darroch/Newton. That is the ceiling the contract anticipates,
  before a second read and formalization.
- This is **not** decisive, **not** registered, and **not** `formally_verified`. Every aggregate key stays OPEN.

`LS_top: advanced`
`ELIG_top: advanced`
`cut_candidate: none`

## Next-route allocation

**The exact remaining obligation for Tier 1 on the F side** has four parts:
1. the isolated second read of record of E1 and E3, and of the ρ₁ identity;
2. the read of U2's reduction lemma (E2);
3. the Darroch/Newton dependencies, which lie on E3 for blocks j ≥ 6 and on the carried favorability and E1(i) keys;
4. formalization (Stage 7), where G-F1 is ready and G-F2 needs the block lemma.

**Next-cycle F routes** (at most three):

1. **`C2-F-01` — an adversarial second read of the uniform statements.** Re-derive E1, E3 and the ρ₁ form by a third method,
   for example direct symbolic expansion instead of interpolation. Attack E2 on the literal network at d = 8 with extremal
   compositions at new rows, including the switch-image E1 load ρ₁γ and the scaling step. Attack every shipped certificate's
   range conditions. **One cycle could close** the registration-grade second read of (L-S)_top and (ELIG-top)(a).
2. **`C2-F-02` — Darroch-free certificates for the carried keys.** Extend the polynomial-in-u certificate method to
   favorability at p* for both leaf classes (the same block structure), and to E1(i) at every q.
   - E1(i) is uniform in q ≤ m, so it needs a block-tail argument. Test candidate sufficient inequalities adversarially at sharp
     points first.
   - **One cycle could close:** favorability, Darroch-free, for the class. For E1(i) it could produce either the q ≤ Q₀
     certificate plus a tail lemma, or the exact obstruction.
3. **`C2-F-03` — a Darroch-free block-descent lemma for j ≥ 6.** This is the smallest unproved lemma of G-F2. Try
   log-concavity of convolutions of log-concave sequences plus an explicit mean-to-mode bound. Stress each candidate
   inequality at u = 35 and at large j. **One cycle could close:** (E) Darroch-free, which makes G-F2 contract-ready for Lean.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-adj-F/`.
Everything uses the standard library only (`fractions`, `math`, `json`, `hashlib`, `itertools`, `random` with fixed seeds,
`ast`, `sys`). Every run is `python3 -B` in the foreground from `own/`. No background jobs were started or left running.

**Adjudicator scripts and outputs:**

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `f8d8fdf47c4f8ae67b202f24a9256002770b79964bc8bba1fec924705c9f693f` | capsule seal and 24 member digests |
| `own/adj_poly.py` | `728a6d129c7e1cf383a4b989e7f283666d1fe04fce9360ad29f5973a486817dd` | exact polynomials, Taylor shift (self-tested) |
| `own/adj_template.py` | `4f4f49b8dc7834a54ce9a4bcfae242686414b0bd67207cb94066df62097a4e68` | E1 symbolic verification (`F2U` / `F1T` argument) |
| `own/adj_template_out_F2U.json` | `16d6547b310543b22a1718ca204559b42a2c9120f2e0520d341feb7559e3dbc3` | |
| `own/adj_template_out_F1T.json` | `cedf5c5ca8c24f2aa4fe4ea708501e49c4be01c196859e192c1b445cbfa09257` | |
| `own/adj_rho.py` | `4ae3548c0b17ddd86b4adc4f5badd1aedc284f391ae2bafa7aa24d2eeb1ee68d` | ρ₁ rational form, Residual certificate |
| `own/adj_rho_out.json` | `1b54d628eef0748e9e70c2e709fd4935c1f77d486464e692e4a0e77c56cf3801` | |
| `own/adj_lab.py` | `0239196c084e2daae65c97208b8e58b0343baf48b1b6ac53abada988f78e4cbb` | literal arc laboratory; DP at m = 137, 263 |
| `own/adj_lab_out.json` | `9f921dc17db889c12ba7edabf6e9b79a068fe58b21da27003de6394193e55f7f` | |
| `own/adj_elig.py` | `d3e739e067458359f1b2b9e159745582f3e1db6d64cb24d3fa21f7625267439a` | E3 interpolation certificates (`3,4,5,6,10` and pieces `tail,0..10`) |
| `own/adj_elig_out.json` | `ede83d1e4855a27bdaa5cf6f30443d5b1555e1966c158fb1d6d981688277c74f` | |
| `own/adj_rows.py` | `274ff0e29be46f2b7e0d32873cd7926489d1ee06cca1e0a45f99235cc857a961` | literal DP at 110; x, eligibility, favorability, F3 defect |
| `own/adj_rows_out.json` | `3435637c2882a32ac88e2881ae321cdaf03cf33a86d20cdfc3b0534fdb2d94d0` | |

**Copy-outs.** `copyout/{F1,F2,F3,F1T,F1U,F2T,F2U,F3T,F3U}/` hold byte copies of the inventoried scratch. `copyout/orig_F2U/`
holds the pre-replay copies of `symbolic_report.json` and `hull_symbolic.out`, and the replays reproduced them. No source,
return or critique was modified. The only file written outside `scratchpad/c1-adj-F/` is this `ADJUDICATION.md`.
