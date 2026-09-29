# Critique

Critic `C-F1-T` (orientation T, prove) of route return `F1` — `C1-F-01 LITERAL-NETWORK-FIDELITY-AND-SHARED-CAPACITY-AT-FRESH-ROWS`
(orientation F). r31 Cycle 1, Stage 4. Date 2026-09-27.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the constitution was read in two passes because the first display
was truncated). I loaded no other VerityOS subsystem (memory, logs, decisions, conversations, modules and skills were not read).

**Model disclosure (two-part).** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- Dispatch `control/dispatch/c1-stage4/DISPATCH-C-F1-T.md`: SHA-256 `b74ec5cc39c4cdd2ba0e15591654449da31439e9d030e9a48f42297e24dd24e7`.
  I recomputed it before doing anything else, and it matches.
- **Capsule seal** (`control/c1-critic-capsules/F1-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`): recomputed
  `20d4a1f0d0c1208b7e4cd380a705b575055ecd6599c12eaa8471a0d9e9a33016`. Matches. All 14 member files match their listed bytes and SHA-256.
- Stage 2 seal `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`: recomputed, matches.
- Stage 3 seal `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`: recomputed, matches. It lists
  `cycles/cycle-1/stage3/returns/F1/RETURN.md` at `628a9d97…0490a` (matches the file) and `DISPATCH-F1.md` at `0315ada9…4987` (the
  digest the return cites).
- Stage 4 dispatch seal `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`: recomputed, matches.
- The return's own digests reproduce under a copy-out-first replay (`scratchpad/c1-crit-F1-T/replay/`, byte-identical to
  `scratchpad/c1-F1/` and to `c1-F1-replay/`). The three digests are `row_check_out.json` `062addaf…be82a`, `literal_lab_out.json`
  `885a5e87…0f90142` and `shared_capacity_out.json` `4f9da57a…7ad995`. `cross_check_small`, `e1_flow`, `dp_certify` and
  `compare_control_row` also replay and print what the return reports. The frozen `crit_extend_b.json` matches `a22aa73b…0cdaa`,
  as `SOURCE-DIGESTS.json` records. `sources/authority/CLAIM-IDENTITY.json` = `b4a339ef…d56e470b` (matches `SOURCE-DIGESTS.json`).
- Route identity: the route ID `C1-F-01`, the token `LITERAL-NETWORK-FIDELITY-AND-SHARED-CAPACITY-AT-FRESH-ROWS` and orientation
  F all appear verbatim. The return's model disclosure is two-part (`claude-sonnet-5`).
- **Read-boundary disclosures (this critic).**
  1. I ran a non-recursive `ls -la` of the two inventoried directories `scratchpad/c1-F1/` and `scratchpad/c1-F1-replay/`.
  2. I ran a non-recursive `ls` of `sources/r30/records/` and a single-file `grep -n` in `sources/r30/records/SEMANTIC-CONTRACT.md`.
     Both are within `sources/`, which is granted.
  3. I read `control/C1-WORKER-COMMON-BRIEF.md`, a Stage 2 member that the common brief authorizes.
  4. I made a programmatic key scan of `sources/authority/CLAIM-IDENTITY.json` for the alias check.
  5. I ran an `ls` of my own deliverable parent `cycles/cycle-1/stage4/critics/F1/`, which did not yet exist.
  6. The harness wrote the long `RETURN.md` display to a tool-results file under `~/.claude/projects/…`, and I read that file. It
     holds only the return's content.
  7. The harness injected the project `CLAUDE.md` and the user's memory index into context. I did not fetch them and did not use them.
  8. One foreground Bash call ran a subshell job (`… &` then `wait`) that finished inside the same call. No job was detached.

  No sibling return, critique, adjudication, other experiment root or network resource was read.

## Independent re-derivation

All of the following use my own instruments, built only from the contracts. Nothing from F1's code is imported. Every script
is stdlib-only and uses exact integers or `Fraction`.

1. **Rows (`own/rows_audit.py`).** The script builds CB(8,m) with my own labelling and runs a tree test. It computes I(T) with a
   generic forest DP and checks it against a third form, the block decomposition of record, built from binomial rows. It
   computes `x` through `α` and checks eligibility, the parent descent and `F_{p*}` (derived from `Δ_{p*}(T−v)` for `v` and for
   three `c`s at different chokes and legs). Results at m = 95, 107, 110, 113:
   - n = 1618/1822/1873/1924; α = 856/964/991/1018; x = 506/570/586/602; `p*−x = 2` at every row.
   - Every row is eligible, the parent descent holds, and `F = leafSet` (761/857/881/905 tags).
   - S < 0, and S, x and α equal F1's `row_check_out.json` exactly.
   - The fixed points of SEMANTIC-CONTRACT §5 are reproduced.
   - The symmetry over the `c` leaves holds by Aut(CB), which permutes chokes and legs. The spot-checks are confirmation, not the
     argument.
2. **(WID) from genuinely independent sides.**
   - Aggregate side: `S = Σ_{v∈F}[Δ_{p−1}(T−H_v) − Δ_{p−1}(T−R_v)]`, computed from DP of the deleted forests.
   - Network side: supply and capacity counted as `#{B ∈ I_j : tag ∈ B, B ∩ W_tag ≠ ∅}`. Here `|W|=1`, which the script checks,
     so each count is `i_{j−2}(T − N[tag] − N[w])`. These are counts of sets containing a tag and its witness, not the q
     inclusion–exclusion.
   - The two sides agree at all four rows. The v-tag supply and capacity equal `R_K = 2^K C(8m,K)` and `R_{K−1}` exactly.
   - Brute-force enumeration of every independent set of CB(2,2), CB(3,2) and CB(2,3), with the literal weight and `F_p` derived,
     confirms (WID) at every rank p ≥ 1 (7, 9 and 10 ranks).
3. **Template LP with an optimality certificate (`own/lpsolve.py`, `own/sector_cert.py`).**
   - The script solves the LP of record (affine separation, minimize θ) with my own two-phase simplex. It then solves the DUAL
     separately and checks primal feasibility, dual feasibility and equal objectives in exact arithmetic. A solver bug therefore
     cannot produce a false certificate.
   - Out and In are re-checked by an exact min-plus/max-plus DP over all splittings. Switch and Residual are also re-checked, with
     ρ_1 taken from direct coefficients.
   - Results: θ* = 96/604265, 96/766193, 96/809675 and 96/854357 at m = 95, 107, 110, 113. Each equals 288/(200m²+82m+5) and each
     is optimality-certified by a dual.
   - ρ_1 at 95/107/110/113 equals F1's values. At 95 it equals the recorded fixed point, as does σ(1..3) = 96/4229855, 32/604265,
     288/3021325.
   - Beyond the return: the same holds at the fresh rows m = 116, 119, 122. There θ* = 96/900239, 96/947321 and 96/995603
     (= the law), every certificate passes, and the margins are 37.83, 38.81 and 39.78.
4. **E1 condition (i) at every q ∈ [1,m] (`own/validate_forms.py`).** Checked Darroch-free from direct coefficients of `r_q` at
   m = 107, 110, 113, 116, 119, 122. There are no failures. The maximum ρ_q is always at q = 1 (0.99563, …, 0.99616). This
   closes F1's remaining item 1 at those rows, as `bounded_computation`.
5. **Literal per-state reduction laboratory (`own/literal_reduction_lab.py`).**
   - **Part A (exhaustive).** Covers CB(2,2), CB(3,2), CB(2,3), CB(4,2) and CB(3,3) at every K from 1 to dm, with arbitrary
     positive random per-state rates. The script builds EVERY literal (D) ∪ (S) arc out of EVERY sector source (29,778 sources).
     - Each source's literal outflow equals `Σ_i Out(β_i,γ_i)`.
     - Each literal in-sector target load equals `Σ_i In(β_i,γ_i)` (26,871 targets).
     - Each switch image is r-free with one choke and weight γ, and its load equals `(d−γ)σ(γ)` (16,236 images).
     - Every positive-rate arc lands in one of those two classes.
   - **Part B (sampled).** Run on the actual CB(8,110) and CB(8,113) with the certificate of item 6.
     - 25 random sector sources per row: literal outflow equals the formula and is ≥ 1.
     - 12 in-sector targets per row, with ALL their literal preimages recovered by reversing (D) and (S): literal inflow equals
       the formula and is ≤ 1.
     - 12 switch images per row: exactly 8−γ sector preimages, and load `(8−γ)σ(γ) ≤ θγ`.
6. **Critic-derived advance: (L-S)_top in the template form, for every m ≥ 107 (`own/uniform_proof.py`).** This is the step
   the return leaves open, and I attribute it to this critic.
   - **Discovery.** My LP vertices at m = 110, 113, 116 have every variable of the form (polynomial of degree ≤ 1 in m)/Q(m), with
     Q = 200m²+82m+5. The interpolated forms reproduce my LP vertices exactly at m = 95, 107, 119, 122, which were not used in the
     fit.
   - **Allocation.** With K = (16m+1)/3:
     - θ = 288/Q.
     - σ(γ) = 288γ/((8−γ)Q).
     - a = −21/(2Q), λ = (75m+30)/(2Q), a2 = (600m+72)/Q, λ2 = −(150m+15)/(2Q).
     - 72 explicit linear-over-Q forms pb(β,γ) and pc(β,γ). For example pb(1,0) = pc(0,1) = (75m+9)/(2Q). All 72 are shipped in
       `uniform_proof_out_M0_107.json`.
   - **Proof.** Every constraint of the SEMANTIC-CONTRACT §2 template is reduced to a univariate polynomial inequality in m. The
     constraints are: nonnegativity; Out ≥ a+λ(β+γ) and In ≤ a2+λ2(β+γ) at all 45 states; m·a + λK ≥ 1; m·a2 + λ2(K−1) ≤ 1;
     Switch; and Residual θ ≤ 1−ρ_1(m).
   - Each inequality is proved for every real m ≥ 107 by an exact certificate. Of the 182 polynomials, 84 are identically zero
     (tight). The other 98 have all Taylor coefficients ≥ 0 at m = 107 + t.
   - In particular m·a + λK = 1 and m·a2 + λ2(K−1) = 1 identically: this is where Q comes from.
   - Summing the affine bounds over all m chokes (with Out(0,0) = 0 ≥ a included) gives Out ≥ 1 for every sector source and
     In ≤ 1 for every in-sector target.
   - **Residual uses an EXACT rational form of ρ_1**, derived here and Darroch-free. Take k = p*−2 = (16m−2)/3 and N = 8m−7. Then
     `ρ_1(m) = Σ_{i=0}^{7} ω_i t_i / Σ_i ω_i`, with
     - `ω_i = C(7,i) Π_{j<i} (16m−2−3j)/(2(8m−16+3j))`, the ratios of the terms of r_1(k), and
     - `t_i = 2(8m−19+3i)/(16m+1−3i)`, the term-wise ratio from r_1(k) to r_1(k+1).

     This identity is checked against direct binomial coefficients at m = 95, 107, 110, 113, 116, 119, 122, 2003 and 30002. The
     Residual polynomial has degree 16, and its certificate at 107 passes. `1 − ρ_1(m) > 0` is also proved for every m ≥ 107;
     this is E1(i) at q = 1, Darroch-free.
   - **Out-of-sample checks.** The closed forms pass the exact DP (min Out = 1, max In = 1), Switch and Residual at m = 125, 170
     and 200. The scalar constraints pass at m = 1001 and 10001 (margins 325.9 and 3255.6).
   - **Cutoff.** The pb/pc numerators are all positive for m > 1069/40 = 26.7. The certificate fails at M0 = 5 (pb(1,7) < 0), so
     this vertex family does not reach small m.
   - **What it means.** Together with the per-state reduction (item 5 and §Attacks A5), the E1 criterion key, E1(i) at every q (the
     threshold key) and the favorability key, this gives (H) at p* for every m ≥ 107, m ≡ 2 (mod 3), at `proved_informal` modulo
     those carried keys.
   - **Status.** This is STATED at a review stage. It needs an isolated second read before registration. It does not touch (E).

## Attacks and findings

- **A1 — (WID) "from independent sides" is not independent in the return (fidelity literal; STRUCK).**
  - `row_check.py` computes `supply = Σ q(p)`, `capacity = Σ q(p−1)` and `S_direct = Σ(q(p) − q(p−1))` from the SAME q
    polynomials. The assertion `supply − capacity == S_direct` is an algebraic tautology.
  - This is exactly the r30 lesson ("checked from the same polynomials on both sides is non-falsifiable").
  - The two-instrument agreement on q (literal H/R DP vs closed forms) is genuine, but it is not (WID).
  - The numbers themselves are correct. My network-side count (item 2) agrees exactly at all four rows, and brute force confirms
    (WID) on small trees. The fidelity chain therefore survives, on my evidence, not on F1's.
- **A2 — "Exact entry-by-entry reproduction" of the r30 control table is weaker than claimed.**
  - The template LP optimum is NOT unique. My dual-certified optimal vertex at m = 107 has the same θ = 96/766193. It differs from
    the frozen table in σ(7) (672/766193 tight vs 336/766193 slack), pb(1,7) and four pc(0,·) entries.
  - F1's entrywise match therefore shows a shared vertex-selection path (the same pivot order as the frozen solver the return
    read). It does not independently confirm anything beyond θ.
  - "The strongest single fidelity check" is struck. What is confirmed is θ* and certificate feasibility.
- **A3 — θ* "= the law exactly" at 110/113 was an unbacked optimality literal.**
  - The return ships a primal solution and no dual certificate. Its "own simplex" is the only evidence that θ is minimal.
  - My dual certificates now back θ* = 288/(200m²+82m+5) at 110 and 113, and also at 95, 107, 116, 119 and 122. The literal is
    retained on my evidence.
  - The law remains a conjecture about the LP optimum at other m. My uniform allocation does not need it.
- **A4 — Shared-capacity check (iv).**
  - F1's 21 "positive-margin" cases are not independent evidence. At every row my certificate, and F1's, has Switch tight at every
    γ, so `(8−γ)σ(γ) + ρ_1γ = γ(θ + ρ_1)`. The 21 cases are one inequality, θ < 1 − ρ_1, multiplied by γ.
  - The target classes were otherwise argued structurally, and I confirm each:
    - in-sector targets: sector deletion only, since any (D) preimage of an r,v-containing set contains r and v;
    - switch images: 8−γ sector preimages plus E1's ρ_1γ;
    - one-choke r-free targets not reached by a switch (v ∉ A, or γ ∈ {0, 8}): E1 only, and ρ_1 < 1 is proved for all m;
    - two-or-more-choke targets: E1 only, needing ρ_q ≤ 1, exact at every q on 107–122 (item 4) and otherwise the carried key;
    - weight-zero targets: the r- and v-deletions, the s-switch and the (1,0)-switch all carry rate 0.
  - The Part A lab checks the complete arc classification exhaustively on small trees.
  - No shared-capacity violation exists.
- **A5 — The per-state reduction.**
  - F1's laboratory is weaker than its words.
    - Part 1 ran at a single K = dm−1, which is near-full and not representative of p*.
    - Its `R_K` "match" is tautological: it counts sets constructed to be that many.
    - `zero_ok` inspects only the first 200 sources.
    - Part 2 is one set per row and computes no loads.
  - So obligation (iii), "confirming the per-state reduction", was not met on the face.
  - The reduction is true. The written argument:
    - The out-arcs of a sector source are exactly: deletion of r or v (weight-0 image); deletion of a leg vertex (an in-sector
      target in the stated state); the s-switch (weight-0 image); and the u_i-switch at a choke with β = 1 (an r-free one-choke
      image of weight γ). There are no others, because |N(x) ∩ B| = 2 fails for every other x.
    - The in-arcs of an in-sector target in state (β,γ) at a choke are exactly the 2(8−β−γ) additions of b or c at its empty
      legs.
  - My exhaustive (every K) and sampled (actual trees) laboratories confirm this. It remains STATED until U2's lemma is read.
- **A6 — Cut search not performed.** The allocation asked F1 to search structured source families for a deficient cut. No search
  is shown. The claim "no deficient cut" rests only on the template's feasibility. This is moot, because a composed saturating
  flow (modulo the carried keys) excludes any cut. The return should have said that, not implied a search.
- **A7 — Minor.**
  - The return's gloss "p*−x grows like 256m/20451 (≈1.3 at m=107) … too small to move the floor past 2" is incoherent: the
    observed value is 2. The brief states a slope, not a value. Struck as unbacked.
  - The observation `p*−x = 2` itself is correct. I confirm it at 95–113, and it means that at these rows parent descent is
    equivalent to eligibility.
  - The remaining F1 checks were attacked and hold:
    - hypotheses and residue: p* integral iff m ≡ 2 (mod 3), and 3p* < 2α+1;
    - ℕ-subtractions: none underflow;
    - Newton/Darroch: none used.

## Mechanism-equivalence and fence check

- **One rank per tree; the class only.** The return and this critique claim nothing outside (CB(8,m), p*), m ≡ 2 (mod 3), m ≥ 107.
  Row 95 is a fixed-point replay only. My M0 = 5 and M0 = 3 probes are negative diagnostics, not claims.
- **No refuted mechanism revived.** The allocation is m-dependent, which is not the refuted m-independent per-choke certificate.
  No Newton or Darroch is applied to I, G or G^m, and ρ_1 is handled by an exact rational identity.
- **Census discipline.** The closed forms were DISCOVERED from LP rows. The universal claim rests on exact polynomial certificates,
  not on the fit or the sweeps. The θ* law is never a hypothesis; it happens to equal the chosen θ(m). LP optimality is never
  used.
- **No status transfer.** Nothing here moves (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, the primary aggregate,
  or any aggregate key. At best, FLOW⇒SIGN gives S(T_m, p*) ≤ 0 on the class's own rows.
- **Template vs network (fence 4).** The reduction is argued (A5) and tested literally, and it stays STATED until U2's lemma and a
  second read.
- **Claim identity.**
  - F1's candidate `E993-R31-CB-8-M-110-AND-113-CHOKE-LOCAL-SECTOR-CERTIFICATE-EXACT-FEASIBILITY-AT-RANK-16M-PLUS-4-OVER-3` is
    lexically clear in the frozen 1104-object registry and mathematically distinct from the finite key
    `E993-R30-CB-8-M-95-TO-107-…`. It is retained at `computer_assisted` as a two-row template statement. It would be SUBSUMED by
    the critic statement below if that is confirmed.
  - Critic candidate (a predicate; lexically clear; no registered key covers any uniform-in-m sector statement):
    `E993-R31-CB-8-TOP-RANK-CHOKE-LOCAL-SECTOR-TEMPLATE-FEASIBLE-WITH-THETA-EQUAL-288-OVER-200M2-PLUS-82M-PLUS-5-FOR-EVERY-M-AT-LEAST-107-CONGRUENT-2-MOD-3`
    — STATED; candidate grade `proved_informal` (exact computer-checked polynomial certificates), pending an isolated second
    read.
  - Subsidiary: `E993-R31-CB-8-RHO-1-AT-TOP-RANK-EXACT-RATIONAL-FORM-AND-RESIDUAL-EXCEEDS-288-OVER-200M2-PLUS-82M-PLUS-5` — STATED.

## Certification audit

| Literal in the return | Status |
|---|---|
| "(WID) asserted from independent sides" | **STRUCK** (A1); the equality is independently re-established by this critic |
| x, α, n, `p*−x = 2`, eligibility, `F_{p*} = leafSet`, S < 0 at 95/107/110/113 | backed (replayed; independently reproduced) |
| ρ_1 at 95/107/110/113 | backed (independently reproduced; the fixed point matches) |
| "θ*(m) = 288/(200m²+82m+5) exactly" at 110, 113 | unbacked on the return's face (no dual); **now backed** by this critic's dual certificates |
| "min_out = 1, max_in = 1, switch_ok, residual_ok" at 107/110/113 | backed (replayed; independently re-derived) |
| "full exact reproduction … strongest single fidelity check" | **STRUCK** as framing (A2); only θ and feasibility are confirmed |
| Part 1 lab "exhaustive" and "R_K match" | narrowed: exhaustive at K = dm−1 only; the R_K match is tautological |
| "confirmed on 200 sampled sector members" | narrowed: the first 200 sources of each small case |
| shared capacity "positive margin in 21 cases" | backed, but it is the Residual inequality times γ (A4) |
| `p*−x` "≈1.3 … too small to move the floor past 2" | **STRUCK** (A7) |
| candidate key, grade `computer_assisted` | retained as stated |
| `LS_top: advanced` ("unblocking") | narrowed: F1 tested the θ* law and the two-row template feasibility, not closed forms for pb/pc/σ |
| replay digests (three outputs) | backed (reproduced byte-identically) |

The return's `## Remaining obligation` is exact and honest on items 1 to 6. Item 1 (E1 at every q) is now discharged at
107–122 by this critic as a bounded computation.

## Verdict

F1 did what its fidelity route needed on the numbers: every row value, ρ_1 and the fresh-row template feasibility replays and is
independently reproduced. Its two strongest fidelity literals are struck: the (WID) independence and the entrywise-reproduction
framing. Its laboratory fell short of confirming the per-state reduction, and the θ*-optimality literal had no certificate on its
face. The retained content is: fidelity and template feasibility at m = 107, 110, 113 with θ* = the law (dual-certified by this
critic), and the candidate key at `computer_assisted`.

Separately, this critic STATES a uniform (L-S)_top in template form for every m ≥ 107 in the class. It is backed by 182 exact
polynomial certificates and an exact rational ρ_1. I believe its mathematics is complete and grade it `proved_informal`
pending an isolated second read. With the carried keys and the reduction it gives (H) at `proved_informal` modulo those keys.
(E) remains open beyond m = 2395.

verdict: retained_narrowed
headline_resolved: no
`LS_top: advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

What a successor inherits:

1. **Isolated second read of the critic-derived (L-S)_top statement.** Re-derive the 84 closed forms (or check the shipped ones
   directly), hand-verify the two affine identities, re-run the 182 certificates, and re-derive the ρ_1 rational identity
   (term-ratio algebra) independently. Until then it is STATED.
2. **The per-state reduction as a lemma (U2's).** The out-arc and in-arc classification of A5 is to be written against the carried
   network definitions and read. It covers the scaling step and every target class, including the switch image's E1 load
   ρ_1γ.
3. **E1 condition (i) at every q for every m in the class** stays on the carried threshold key (`proved_informal` modulo Darroch
   on the real-rooted r_q). It is exact here only at 107–122, and only q = 1 is now Darroch-free for every m. A Darroch-free
   all-q route (U3) is still open.
4. **(ELIG-top)(a)** `i_{p*−1} < i_{p*−2}` for every m is untouched. Note that `p*−x = 2` at 95–113, so at those rows parent
   descent is exactly eligibility.
5. **Formal route.** The (L-S)_top certificate is univariate polynomial identities and inequalities over ℚ. It is a natural Lean
   target (shifted-coefficient nonnegativity), together with the binomial term-ratio lemma behind ρ_1.
6. **Tier 1** then equals the (H) composition plus (E). Grade it by its weakest input, and transfer no aggregate status.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-F1-T/`.
Every script is stdlib-only and is run as `python3 -B <script>` from `own/`, in this order: `rows_audit.py`;
`sector_cert.py 95 107`; `sector_cert.py 110 113 116 119 122`; `uniform_proof.py 107`; `validate_forms.py`;
`literal_reduction_lab.py`.

| File | SHA-256 |
|---|---|
| `own/cbnet.py` | `80def91fdde7b1a9210ad3a949e772f55250ffe4895ff58b3850ff7b088ce53a` |
| `own/rows_audit.py` | `584df4774d94bb7f812d187dafa43a2dfb0a99ff92d312e0709abf052b126298` |
| `own/lpsolve.py` | `f52161a25bec2df1fa7d338ff7e77e0de45d5f218a043111b011ea35fb9ef5d5` |
| `own/sector_cert.py` | `9ba12daaaae59ba50d65137891d6d06ba2f37fabddced4365dd76f225b5f3da1` |
| `own/uniform_proof.py` | `c4e0a5d0652aecc408ee2a6b716fad834ea1a9d72cf0033ce649d372b00fa81f` |
| `own/validate_forms.py` | `e7ab8f280ec2fd0c0e444a835605f6ca93756a60eb7faad3fbe5a65c583b2069` |
| `own/literal_reduction_lab.py` | `120e00dbd0e6b0748730d73140fe28b6a8fe1c7b50b6e9a265382ef579701403` |
| `own/rows_audit_out.json` | `3c7f8c0b7731528470443a251ac21d54b4644f8b2fef0981b1717ae718b84ded` |
| `own/sector_cert_out_95_107.json` | `1d31de73e950cc565863492957a4ebf0bbc172f8ce8bff210d3f47d3c004c290` |
| `own/sector_cert_out_110_113_116_119_122.json` | `cfd17a6ec76c641b8e5b20128d91cb0295697b2c6a8f66024ae1e21c1e20f567` |
| `own/uniform_proof_out_M0_107.json` | `280561c64b85639a4b8a267490c5dfaf890a6e0470cc8099e159285fc6e41fe5` |
| `own/uniform_proof_out_M0_5.json` / `_M0_3.json` | `945430ed…8be618` / `ec7c95bf…74c29` (negative diagnostics) |
| `own/validate_forms_out.json` | `bd7688aafd411c859886befdecea5117abc1aade03d11cc802b6b146d8a1f42e` |
| `own/literal_reduction_lab_out.json` | `c13676da1663e31cabf6391a1dcc539e9548d36b62030739703ed362f624fbb5` |

- `replay/`: a byte-identical copy of F1's `scratchpad/c1-F1/` and its re-run outputs (digests as above). `replay/orig/` holds
  the pre-replay copies of the JSON outputs.
- No background job was left running. Every computation ran in the foreground or inside a waited subshell, so there is nothing
  to kill.
- No source was mutated, and nothing was written outside this scratch directory and this `CRITIQUE.md`.
