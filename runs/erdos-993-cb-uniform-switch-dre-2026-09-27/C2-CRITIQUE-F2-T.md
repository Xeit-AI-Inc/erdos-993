# Critique

Critic `C-F2-T` (orientation T, prove), Cycle 2 Stage 4 of r31. Assigned return: `cycles/cycle-2/stage3/returns/F2/RETURN.md`
(route `C2-F-02`, mechanism token `ELIG-AND-CERTIFICATE-RANGE-ADVERSARY`, orientation F).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem (no memory, conversations, modules,
skills, logs or decisions), and I did no conversation logging. The harness put the project `CLAUDE.md` and the user auto-memory index
into my context without my fetching them. I did not use either one.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Imports:** Python standard library only (`json`, `hashlib`, `sys`, `fractions`, `math`, `itertools`). No network, no package installs, no Lean.

## Identity and seal audit

- **Dispatch** `control/dispatch/c2-stage4/DISPATCH-C-F2-T.md`: `shasum -a 256` gives
  `5a34122cc0cf194a103dc11244b3fdcae2c561f1296d76696b38f929ac65ac11`, which matches the dispatch. I checked it before reading the file.
- **Capsule seal** `control/c2-critic-capsules/F2-PACKET-MANIFEST.json`: I recomputed it as SHA-256 over the canonical JSON without
  `seal_sha256` (sort_keys, `(",", ":")`, no trailing newline). Result: **`0ff00fe93e0d8566b8f3108d241454242c2907b18b4d234bf345b887890b3873`**. MATCH.
  All 14 members match on bytes and SHA-256. That includes the return (`ce9954e4…a562`, 34565 bytes).
- **Stage 2 seal**: `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`. MATCH.
- **Stage 3 seal**: `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`. MATCH. The Stage 3 manifest lists the F2 return at
  `ce9954e4…a562` and F2's dispatch at `f8d363a4…13b0`. Both equal what the return reports.
- **Stage 4 dispatch seal**: `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb`. MATCH. Its 11 overlapping members carry the same
  digests as the capsule.
- **The return's digests:** all 9 inventoried artifacts under `scratchpad/c2-F2/` match their listed SHA-256. SR-4's
  `SECOND-READ.md` (`112164b8…9bf1`) matches `sources/c1-results/SOURCE-DIGESTS.json` and the Stage 2 manifest.
- **Sources I read** (all under `sources/`, which is authorized; each checked against the Stage 2 manifest, all MATCH):
  - `c1-results/second-reads/SR-4/SECOND-READ.md` (excerpts);
  - `c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/LeanProof/Main.lean` (entries 1 and 17–21);
  - `authority/CLAIM-IDENTITY.json` (491);
  - `concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json` (494).
- **Identity of the return:** the route ID and mechanism token are verbatim. The return's two-part disclosure says "chartered
  sonnet/high … claude-sonnet-5", which agrees with the allocation (Sonnet 5, high).

## Independent re-derivation

I built my own instruments from the contracts. The return's scripts were used only in a separate copy-out-first replay.

**(A) Literal trees at control and fresh rows** (`crit_rows.py`, `crit_brute.py`).
- Construction: `CB(8,m)`, `CB(8,m) − v` and `CB(8,m) − c_11` are built from the SEMANTIC-CONTRACT §2 labelling. The instrument
  asserts tree-ness (it reaches every vertex and there are n − 1 edges). A rooted DP computes the independence polynomials, using
  exact Kronecker-packed big-integer products. A brute-force subset enumeration on tiny `CB(d,m)` and their deletions agrees
  (`brute_guard_ok: true`).
- Results at `m = 107, 110, 113` (control rows), **`116, 119` (the ruling-9 fresh rows)** and `137`, from the literal tree through `α`:

| m | n | α (=9m+1) | x | p* | Δ_{p*−2} < 0 | eligible | S_4 | S_5 > 0 | ascending parent blocks | fav(v) | fav(c) |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 107 | 1822 | 964 | 570 | 572 | yes | yes | − | yes | {0,1,2} | yes | yes |
| 110 | 1873 | 991 | 586 | 588 | yes | yes | − | yes | {0,1,2} | yes | yes |
| 113 | 1924 | 1018 | 602 | 604 | yes | yes | − | yes | {0,1,2} | yes | yes |
| 116 | 1975 | 1045 | 618 | 620 | yes | yes | − | yes | {0,1,2} | yes | yes |
| 119 | 2026 | 1072 | 634 | 636 | yes | yes | − | yes | {0,1,2} | yes | yes |
| 137 | 2332 | 1234 | 730 | 732 | yes | yes | + | yes | {0,1,2} | yes | yes |

- The fixed point `CB(8,107)/572` (`n = 1822`, `α = 964`, `x = 570`) is reproduced.
- On every row the literal difference `i_{p*−2} − i_{p*−1}` equals `Σ_{j=0}^{m} C(m,j) g_j + τ` exactly (the block identity).
- `Δ_{p*}(T−v)` and `Δ_{p*}(T−c)` equal their block sums exactly: T−v uses `Q_j`, `j = 0..m`, plus its tail; T−c uses `E0_j`, `E1_j`
  with weights `C(m−1,j)` and `C(m−1,j−1)`, plus its tail.
- The per-block signs were checked at every `j = 0..m`, not only at small `j`.
- This is bounded evidence only.

**(B) The pooled certificates by a single-step construction** (`crit_cert.py`).
- Setup: `m = 3t+2`, `B = 24t+17`, `L = 16t+10`, `M = 8t+7`, `R = C(B,L)2^L`. Each term `C(B−a, L−c)2^{L−c}/R` is written as
  `2^{−c}·ff(L,c)·M!/(M−a+c)!/ff(B,a)` over the denominator `D_J = Π_{q<8J}(B−q)·(L+1)·Π_{q=1}^{J}(M+q)`. The code asserts that
  every term denominator divides `D_J`.
- Guard: `N_J/D_J = κ_J · S_J/R` with a constant `κ_J > 0`, checked exactly at 70 integer points `t = 4..73` (`κ_5 = 160`, `κ_4 = 32`).
- **`S_5`:** `N_5` has degree 50 (`D_5` has degree 46). Its primitive integer coefficient list has SHA-256
  **`893a21b6fdd0f7c2ac7e151db10873351c164c949ee12582812fc3452db651f7`**, which agrees with SR-4's recorded truncation `893a21b6…51f7`.
  - `N_5 < 0` at every integer `t = 20..32` and `> 0` from 33 on.
  - Sturm (my own code): 0 roots in `(28,32]`, exactly 1 in `(32,33]` (bisection gives `t* ≈ 32.148492986193666`), 0 in `(33,10^6]`.
  - **All 51 coefficients of `N_5(s+u)` are positive for `s = 33`.** At `s = 32` the only non-positive coefficient is the constant
    term (`= N_5(32) < 0`).
- **`S_4`:** `N_4` has degree 40 over `D_4` (degree 37). Under SR-4's `D_5` normalization it becomes `N_4·Π_{q=32}^{39}(B−q)·(M+5)`, of
  degree 49, which reconciles with SR-4's table.
  - Sturm: exactly 1 real root in `(44,45]` (`≈ 44.0316`) and 0 in `(45,10^6]`.
  - **All 41 coefficients of `N_4(45+u)` are positive, and at every shift `s = 20..44` the constant term `N_4(s)` is negative.**
- **Degree-90 reconciliation:** F2's `D_master = D_5·Π_{q=6}^{45}(8t+7+q)` (86 = 46 + 40). F2's `N_total = (1/32)·N_5·Π_{q=6}^{45}(8t+7+q)`,
  with ratio exactly 1/32 on all ten coefficients F2's output records (five top, five bottom). The degree is 50 + 40 = 90. Both
  normalizations first become all-positive at shift 33.

**(C) The balance at the sign changes** (`crit_pieces.py`). These are per-piece values normalized by `R`.

| t (m) | j0 | j1 | j2 | τ | j3 | j4 | j5 | S_4/R | S_5/R |
|---|---|---|---|---|---|---|---|---|---|
| 32 (98) | −0.0057 | −0.0146 | −0.0137 | −0.0070 | +0.0003 | +0.0163 | +0.0237 | −0.0243 | −0.0007 |
| 33 (101) | −0.0056 | −0.0146 | −0.0141 | −0.0068 | +0.0003 | +0.0179 | +0.0268 | −0.0228 | +0.0040 |
| 35 (107) | −0.0053 | −0.0146 | −0.0150 | −0.0064 | +0.0003 | +0.0213 | +0.0339 | −0.0195 | +0.0144 |
| 44 (134) | −0.0042 | −0.0146 | −0.0188 | −0.0051 | +0.0004 | +0.0422 | +0.0849 | −0.0001 | +0.0849 |
| 45 (137) | −0.0041 | −0.0146 | −0.0192 | −0.0050 | +0.0004 | +0.0451 | +0.0930 | +0.0026 | +0.0956 |

This explains the sign change the brief asked about, which the return located but did not explain:
- The ascending mass (`j = 0,1,2` and `τ`) stays near −0.04 over this window. `j1` is flat, `j2` grows about linearly, and `j0` and `τ`
  decay.
- The descending mass grows much faster (`j4` like `t^3`, `j5` like `t^4`). `j3` sits at gap −2 and is negligible.
- `S_5` crosses where `j4 + j5` overtakes the ascending mass, at `t* ≈ 32.15`. Without `j5`, `S_4` crosses only at `t ≈ 44.03`.
- `S_5/R = 0.014383` at `t = 35`, which agrees with SR-4's `≈ 0.01438`.

**(D) Replay of the return, copy-out-first** into `scratchpad/c2-crit-F2-T/replay/`.
- All four scripts exit 0 in the foreground.
- All four `*_out.json` files are **byte-identical** to the recorded digests (`3944a537…`, `63fd7f3d…`, `a0a6189d…`, `06e412a6…`).

## Attacks and findings

1. **Side conditions: confirmed.** For `0 ≤ j ≤ m`, `L − j ≥ (13m−2)/3 ≥ 1` and `L − j + 1 ≤ 8m + 1`. This is exact algebra, and (G)'s
   hypotheses `1 ≤ t ≤ a + b` hold. No off-by-one.

2. **The `S_5` range: confirmed. The return's "SR-4 ships it at 33" was unbacked on its face and is now backed by the critic.**
   - The return found shift 33 for **its own** degree-90 `N_total`. It then asserted that "the actual form of proof SR-4 ships already
     holds at shift t = 33".
   - That transfer does not follow. `N_total = (1/32)·N_5·Π(8t+7+q)`, and a product can have all-positive shifted coefficients when a
     factor does not. Positivity passes from `N_5` to `N_total`, not back.
   - My (B) settles it directly on SR-4's own `N_5` (digest-identified): minimal all-positive shift **33**, failing at 32 only in the
     constant term. The literal is **true, on the critic's evidence**.
   - Note that SR-4 already recorded "`S_5` positive at t = 33, 34". What is new is only the all-positive shift at 33. Any remark
     about `m = 101, 104` lies outside the class (fence 1) and asserts nothing.

3. **"Leading-coefficient sign guarantees positivity for every larger t, since a degree-90 polynomial has only finitely many real roots
   and none are found beyond 32.1485 in a search six orders of magnitude past the class endpoint" (§4): struck.**
   - Having finitely many roots does not exclude a root above `10^12`.
   - The universal positivity rests on the shift-33 certificate instead, which the return does carry. The conclusion survives; this
     inference does not.

4. **Tail sign (§3): every step checks, but three corrections are needed.**
   - Algebra checked: `8m − L = (8m+2)/3`; `4(8m+8)(8m+5) − (16m−2)(16m−5) = 528m + 150`.
   - (i) "For every integer `m ≥ 1`" is ill-posed. `L = (16m−2)/3` is an integer only for `m ≡ 2 (mod 3)`. Narrow to `m ≥ 2`,
     `m ≡ 2 (mod 3)`.
   - (ii) `τ < 0` is the **adverse** sign (the tail ascends). "Strictly stronger than needed" is a misframing: the certificate carries
     `τ`'s exact value, and no step needs its sign.
   - (iii) `τ < 0` was already a companion fact on SR-4's face (mirror step, gap −13). This is a second proof, not a new result.

5. **`S_4` window (F2-R2): exact on the class and does not affect the proof.** The prose "j ≤ 4 alone would already certify the tail of
   the class" is **struck as unbacked** on the return's evidence: sign checks at `t = 45..54` and three spot rows prove nothing universal.
   The critic's certificate (B) now backs it: **`S_4 > 0` for every real `t ≥ 45`, i.e. every class `m ≥ 137`**, a fixed degree-40
   shifted certificate at `computer_assisted` grade. `S_4 < 0` holds exactly at class rows `m = 107..134`. So `J = 5` is the smallest
   uniform pool from `m = 107`. The proof of record is unaffected.

6. **Favorability block census (§6, F2-R3): mis-stated in two places and under-graded in one.**
   - (a) "The `j = 0` term of `E0` and the tail are **not** independently two-binomial" is **false** for `E0_0`. `E0_0 = (1+x)(1+2x)^{8m}`
     at `t = p*` has gap 5 and descends by (G). Only the T−c tail `x(1+x)^2(1+2x)^{8m−1}` sits at gap 0, outside (G)'s hypothesis.
   - (b) "Only this one paired block needs a separate argument" is **superseded**: the tail descends on its own by an exact three-ratio
     identity (critic-derived advance, below). The pairing into `(1+x)(1+2x)^{8m−1}(1+3x+x²)` is unnecessary.
   - (c) The paired-block identity was "checked … for `m` up to 107". The script checks `m ∈ {1,2,3,5,8,107}` only. Narrowed. The
     identity is a one-line factorization, `(1+x)(1+2x)^{8m−1}[(1+2x) + x(1+x)]`, valid for every `m`.
   - (d) Grade: for T−v the gap values `2j+5` and the tail gap 2 are exact identities for every class `m`, not row samples. With (G)
     they already form a proof, so "computer_assisted, confirmed only at tested rows" under-grades the T−v content. There is no fixed
     certificate anywhere in it.
   - The return's real-rootedness remark on `1+3x+x²` (discriminant 5) is correct and revives nothing.

7. **Degree 90 vs 50: reconciled.** See (B). Different normalization, same zero set on `t ≥ 1`.

8. **Independence of the third method: genuine.**
   - The return uses a different decomposition (two-step falling-factorial anchors, a denominator of degree 86), its own Sturm code,
     and exact guards against direct big-integer sums.
   - It self-reports and fixed an anchor error, which its guards caught.
   - My single-step build agrees with it and with SR-4's digest.

9. **Fresh rows (gate ruling 9).**
   - The return's row table uses `m = 95, 107, 110, 113`. Under ruling 9, `110` and `113` are **control** rows, and the return never ran
     the Cycle 2 fresh rows `116, 119`.
   - The return makes no new universal claim that depends on rows, so this is procedural. I supplied `116, 119` (and `137`) from the
     literal tree in (A).
   - The return's `x` values at class rows come from the closed form, which it validated against a literal DP only at `m ≤ 11`. My (A)
     is literal at the class rows.

10. **No cut, no template issue.** This route touches no network. `cut_candidate: none`.

## Mechanism-equivalence and fence check

- **Fence 1:** one rank `p*`, the class only. The remarks outside the class (`m = 101, 104`; the tail algebra for small `m`) are
  hypotheticals and assert nothing there.
- **Fence 2:** no network instrument here. `x` is computed through `α` (literal in my (A)). The selector is derived: `F_{p*} = leafSet`
  at every row in (A).
- **Fence 3:** there is no Darroch/Newton use anywhere in the return or in this critique. (G) is the kernel-checked elementary tool from
  C1-LA3 (entry 17), a companion lemma with no certificate of its own.
- **Fence 5:** no asymptotics are used. The `t^3`/`t^4` growth in (C) is explanatory only.
- **Fences 6 and 7:** `E993-TREE-REAL-ROOTED` stays REFUTED. Sweeps are guards, not proofs.
- **Mechanism:** the return introduces no new transport mechanism and revives no refuted one.

**Claim identity.**
- Keys touched:
  - `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
    (`computer_assisted`; unchanged, its certificate is confirmed);
  - `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (`proved_informal` modulo
    Darroch/Newton);
  - `E993-TREE-REAL-ROOTED` (REFUTED);
  - the headline keys `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` and `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN,
    untouched).
- The return proposes no new key, which is correct.
- **The critic-derived favorability statement below is a sub-scope alias of the r30 favorability key.** It is `d = 8` with
  `dm = 8m ≡ 1 (mod 3)`, at `p*`, with the same statement and a different proof. Scans of the 491-key authority, the frozen master-494
  and the r31 keys in the Cycle 1 record find only that r30 key stating favorability. So I **propose no new `E993-R31-` key**.
- I recommend recording it as a dependency-removal proof route on the r30 key's `d = 8`, `m ≡ 2 (mod 3)` sub-scope, after an isolated
  second read. The run-local registry (497) is not in my capsule, so it was not scanned directly.

## Certification audit

| Literal in the return | Status |
|---|---|
| Seal / dispatch / SR-4 digests "MATCH" | backed (recomputed) |
| 9 artifact SHA-256 values | backed (recomputed; replay outputs byte-identical) |
| "`{"all_ok": true, "n_checks": 17}`" | backed (replayed) |
| Side condition "for every m ≥ 1, 0 ≤ j ≤ m" | backed (exact algebra) |
| Gap `2j − 8`; ascending exactly `j ∈ {0,1,2}` at the tested rows | backed (critic: every `j = 0..m` at six class rows) |
| "`τ < 0` for every integer `m ≥ 1`" | **narrowed** to `m ≥ 2`, `m ≡ 2 (mod 3)`; "stronger than needed" struck (misframing); re-proof of an SR-4 companion fact |
| `N_total` degree 90, `D_master` 86; Sturm 0/0/1; root `≈ 32.148492986193666`, bracket width `< 2^{−97}` | backed (replayed; actual width `2^{−100}`) |
| "smallest all-positive shift 33" for `N_total` | backed (replayed; critic reproduces it on `N_5·Π`) |
| "the actual form of proof SR-4 ships already holds at shift t = 33" | **unbacked on the return's face; now backed by the critic** on SR-4's `N_5` (digest `893a21b6…51f7`) |
| "leading-coefficient sign guarantees positivity for every larger t … finitely many real roots" | **struck** (invalid inference; the shift certificate carries the claim) |
| F2-R2: `S_4 < 0` at `t = 35..44`, `> 0` at `t = 45..54` and three spot rows | backed (bounded) |
| "j ≤ 4 alone would already certify the tail of the class" | **struck** on the return's evidence; backed by the critic's degree-40 shift-45 certificate (`computer_assisted`) |
| "E0_0 … not independently two-binomial" | **struck** (false: gap 5) |
| "only this one paired block needs a separate argument" | **superseded** (the tail alone descends; see the advance) |
| Paired-block identity "checked for m up to 107" | **narrowed** to `m ∈ {1,2,3,5,8,107}`; a trivial identity for all `m` |
| F2-R3 grade `computer_assisted` | T−v part **under-graded** (exact gap identities + (G) = proof); T−c part left open by the return |
| Row table `m = 95..113` | backed (the critic's literal tree agrees at 107/110/113) |
| Gate lines `ELIG not_advanced`, `HALL not_advanced`, `FAV advanced`, `cut none` | consistent (FAV now carried by the critic's completion) |

**Critic-derived advance (attributed to critic C-F2-T, Claude Opus 5.5; STATED at a review stage, so it needs an isolated second read).**

**Statement.** For every `m ≥ 2` with `m ≡ 2 (mod 3)`, and in particular on the r31 class, every leaf of `CB(8,m)` is favorable at
`p* = (16m+4)/3`, that is, `F_{p*}(CB(8,m)) = leafSet`. The proof uses no Darroch and no Newton.
- **Inputs:**
  - the closed forms `I(T−v) = (1+x)G^m + x(1+2x)^{8m}` and `I(T−c) = (1+2x)G_cG^{m−1} + x(1+x)^2(1+2x)^{8m−1}` (the `proved_informal`
    node of the r30 key; they match my literal tree exactly at 11 rows);
  - (G) = `E993Transport.twoBinom_coeff_strictAnti_of_gap` (C1-LA3, kernel-checked companion): for `1 ≤ t ≤ a+b` and
    `3a + 4b + 2 ≤ 6t`, `[x^{t+1}] < [x^t]` of `(1+x)^a(1+2x)^b`;
  - exact ratio algebra.
- **(v)** `Δ_{p*}(T−v) = Σ_{j=0}^{m} C(m,j)(Q_j[p*−j+1] − Q_j[p*−j]) + (e_{p*} − e_{p*−1})`, where `Q_j = (1+x)^{8j+1}(1+2x)^{8(m−j)}`
  and `e_k = 2^kC(8m,k)`.
  - For each `j`: `t = p*−j ∈ [1, 8m+1]` (since `p* − m = (13m+4)/3`) and `6t − (3a+4b) = (32m+8−6j) − (32m−8j+3) = 2j+5 ≥ 2`, so (G)
    gives a negative summand.
  - Tail: (G) with `a = 0`, `b = 8m`, `t = p*−1`. Here `6t = 32m+2 = 4b+2`, so the hypothesis holds with equality. Negative.
  - All weights are positive, so `Δ_{p*}(T−v) < 0`.
- **(c)** For `c = c_11`, `(1+2x)G_cG^{m−1} = Σ_{j=0}^{m−1} C(m−1,j) x^j E0_j + Σ_{j=1}^{m} C(m−1,j−1) x^j E1_j`, where
  `E0_j = Q_j` and `E1_j = (1+x)^{8j−1}(1+2x)^{8(m−j)+1}`.
  - The `E0_j` summands at `t = p*−j` have gap `2j+5`, as in (v).
  - The `E1_j` summands at `t = p*−j ≤ 8m` have gap `(32m+8−6j) − (32m−8j+1) = 2j+7 ≥ 9`.
  - All are negative by (G).
- **The T−c tail at gap 0, without (G).** Put `N = 8m−1`, `f_k = 2^kC(N,k)` and `u = 16m`. The contribution is
  `f_{p*} + f_{p*−1} − f_{p*−2} − f_{p*−3}`. Using `f_k/f_{k−1} = 2(N−k+1)/k`:
  - `f_{p*−3} = f_{p*−2}(u−2)/(u+4)`;
  - `f_{p*−1} = f_{p*−2}(u−2)/(u+1)`;
  - `f_{p*} = f_{p*−2}(u−2)(u−8)/((u+1)(u+4))`.

  Hence the contribution equals `f_{p*−2}·[(u−2)(u+4) + (u−2)(u−8) − (u+1)(u+4) − (u−2)(u+1)]/((u+1)(u+4)) = −6(32m−1)·f_{p*−2}/((16m+1)(16m+4)) < 0`.
  My instrument checks this closed value as an exact integer identity at every row of (A).
- So `Δ_{p*}(T−c_11) < 0`. Automorphisms of `CB(8,m)` permute the chokes, and the support/leaf pairs within a choke, transitively on the
  private leaves, so every `c_ij` is favorable.
- The leaf set is exactly `{v} ∪ C`, since `r`, `s`, `u_i` and `b_ij` all have degree at least 2.
- **ℕ-subtractions:** `p* − j` for `j ≤ m < p*`; `p* − 3 ≥ 0`; `8j − 1` only for `j ≥ 1`.
- **Hypotheses used:** `m ≡ 2 (mod 3)` (so `6p* = 32m + 8`) and `m ≥ 2`. `m ≥ 107` is not used.
- **Consequence:** at `d = 8`, `m ≡ 2 (mod 3)`, the favorability input of Tier 1 no longer depends on Darroch/Newton. It rests on (G),
  the closed forms and exact algebra, and it reduces to (G)-instances plus one integer ratio inequality, both formalizable.
- **Grade:** `proved_informal` pending an isolated second read.
- **Guards (not evidence):** (A) checks every `j` at six class rows. `crit_pieces.py` sweeps all 36 rows `m ≡ 2 (mod 3)`, `2 ≤ m ≤ 107`,
  over every `j`, and asserts (G)'s hypotheses exactly: 0 failures.
- I did not read sibling returns (T1/T2). This may duplicate their content, and the attribution is to this critic for this derivation.

**Also critic-derived (computer_assisted, fixed certificates):**
- the minimal all-positive shift of SR-4's degree-50 `N_5` is 33;
- `S_4 > 0` for every class `m ≥ 137` (degree-40 `N_4`, shift 45, digest `ed0101b2…c68d`).

## Verdict

The return's computations are correct. Its artifacts replay byte-identically, and it genuinely re-derived the `S_5` certificate by an
independent third method. Its narrow conclusions stand, subject to these corrections:
- one struck inference (the root-finiteness argument);
- one transfer that was unbacked on its face and is now backed by the critic (SR-4's `N_5` at shift 33);
- one unbacked universal remark, struck on F2's evidence (`S_4` for the class tail), now backed by a critic certificate;
- one ill-posed scope (`τ < 0` "for every integer `m ≥ 1`");
- a mis-statement plus an unnecessary pairing in the T−c census;
- an under-grade of the T−v census;
- the ruling-9 fresh rows, which the return did not run.

No finding threatens the Tier 1 chain. The critic-derived Darroch/Newton-free favorability proof completes what F2-R3 left open.

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: not_advanced
HALL_formal: not_advanced
FAV_darroch_free: advanced
cut_candidate: none

## Remaining obligation

1. An **isolated second read** of the critic-derived statement (every leaf of `CB(8,m)` favorable at `p*`, `m ≡ 2 (mod 3)`, with no
   Darroch/Newton). It must check the E0/E1 expansion of `(1+2x)G_cG^{m−1}` and its weights `C(m−1,j)`, `C(m−1,j−1)`, the three gap
   identities, (G)'s hypotheses including the equality case `a = 0` and `6t = 4b + 2`, the tail ratio identity, and the leaf-transitivity
   claim.
2. **Formal route to favorability** over C1-LA2's `cbGraph`. This needs:
   - (G)-instances for `Q_j`, `E0_j`, `E1_j` and the T−v tail (pure `omega` gap lemmas, in the pattern of C1-LA3 entries 18–21);
   - one integer inequality for the T−c tail: `2^pC(N,p) + 2^{p−1}C(N,p−1) < 2^{p−2}C(N,p−2) + 2^{p−3}C(N,p−3)`, with `N = 8m−1`,
     `p = p*`;
   - U3's link from `cbGraph m − v` and `cbGraph m − c_ij` to the closed forms;
   - the symmetry transfer to every `c_ij`.
3. **(ELIG-top)(a) formal:** the `S_5` positivity node is unchanged and open (U1's). The certificate can be the degree-50 `N_5` at shift
   33 or at 35; both are all-positive.
4. **(HALL):** untouched by this route. E1 and the composition stay as registered.
5. **Headline:** open. Nothing here is a cut or a template failure.

## Artifact inventory

Critic scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-F2-T/`

| File | SHA-256 | Role |
|---|---|---|
| `crit_rows.py` | `77c336527484747015f840ac72838f5ff8842b5eddd791c53199d59d587f265a` | literal-tree DP (Kronecker products), x through α, block identity, favorability block census at every j |
| `crit_brute.py` | `37189d4af84af5ba9bf31cd639ab03a2a63d7dacfc4236ee3c3c74db56cc95fe` | brute-force guard of the DP on tiny CB(d,m) and deletions |
| `rows_out.jsonl` | `433456e9991c3cbfba337b93b6b48948891f41c41746ca6d8eead478f7cc4400` | rows 107, 110, 113, 116, 119, 137 |
| `crit_cert.py` | `60a7a36a4a80ae105f0f698489e9b7a878b83161dc49aa17f58a38ed6fbda844` | single-step N_4, N_5; 70-point exact guard; Taylor shifts; Sturm; degree-90 reconciliation |
| `crit_cert_out.json` | `784626cdbc41a4e8f33df9f98c4514c5fafdaeb32f6fb502246b3989c28045d8` | its output |
| `N5_primitive.json` | `893a21b6fdd0f7c2ac7e151db10873351c164c949ee12582812fc3452db651f7` | N_5, degree 50, primitive, low degree first |
| `N4_primitive.json` | `ed0101b2c3175fa820d1e600042fd7331867c604972393ee8f4cc2b880fcc68d` | N_4, degree 40 |
| `crit_pieces.py` | `00e67bfc7e0b8265c119a2130100c151848359a9303d6c57a38ee87ba391daf3` | per-piece balance; favorability guard sweep, m ≤ 107 |
| `crit_pieces_out.json` | `446291ee67675f55d3a67959b0b9fc69232f332c801d27a0b152219e0f5041e8` | its output |
| `replay/` | outputs byte-identical to F2's recorded digests | copy-out-first replay of the four F2 scripts |

**Replay:** `cd <scratch> && python3 -B crit_brute.py && python3 -B crit_rows.py 107 110 113 116 119 137 && python3 -B crit_cert.py && python3 -B crit_pieces.py`.
`crit_rows.py` at these six rows takes about 2 minutes; the other scripts each take under 10 seconds.

**Read-boundary and process disclosures.**
1. The harness injected `CLAUDE.md` and the memory index into my context. I did not use them.
2. Non-recursive `ls` of `sources/`, `sources/c1-results/` and its subdirectories, one `ls` glob under `sources/c1-results/runs/`, and one
   recursive `grep -r` rooted at `sources/c1-results/` (within the grant) to list the r31 key names. Grep excerpts of SR-4 and a partial
   read of C1-LA3's `Main.lean`.
3. An `ls` of `scratchpad/c2-F2/` (the return's inventoried directory).
4. My first `crit_pieces.py` (the sweep to `m = 302`) exceeded the foreground window and the harness backgrounded it. I found its PID
   with one `ps -U ashtonsperry | grep crit_pieces.py` and killed **literal PID 29597** (its wrapper shell 29594 exited with it). I then
   reran it with a smaller range in the foreground.
5. No background job is running at the final write.
6. I read no other return, critique, adjudication or experiment root, and used no network.
