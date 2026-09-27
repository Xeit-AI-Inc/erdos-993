# Second Read

Isolated second read `SR-C6-1` for run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 6, the terminal cycle.
Date: 2026-09-28. The statements read are K-2 (the favorability lemma at rank `⌊(2dm+4)/3⌋` on `CB(d,m)`, `d ≥ 6`), its closed-form node, and
the citation fact S-3.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and then
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The only subsystem in use is `experiments/`, confined
to this run root and my sealed capsule.

**Model disclosure (two parts).** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Stated | Recomputed | Result |
|---|---|---|---|
| Brief `control/C6-SECOND-READ-BRIEF-SR-C6-1.md` | `554fdeac7b355a26bc0f6a484b17ae3fe4d84c63922e7cab5e517bd53e3fc845` | `shasum -a 256`, computed before I followed the brief | **match** |
| Capsule `control/c6-second-read/SR-C6-1-PACKET-MANIFEST.json`, inner seal | `3c66a7fa32860950f49d7d9a0264b0c037813073fd71369861e5541de55402ec` | SHA-256 of compact key-sorted JSON of the manifest minus `seal_sha256`, `(",",":")`, no trailing newline | **match** |
| Capsule members | 166 (`file_count` 166) | SHA-256 and byte count of every member | **166/166 match**, none missing |
| Protocol `control/C6-SECOND-READ-PROTOCOL.md` | capsule digest `c2e9d131…837f9` | SHA-256 | match |
| Frozen instruments under `sources/c6-stage7-sources/` | `SOURCE-DIGESTS.json` (723 entries) | SHA-256 of every listed file | **723/723 match**. All 127 capsule members under that directory are listed there and match. |
| Replay of C-T1-F `block_proof_check.py` (copy-out) | frozen log `a87fd67c…c2d2` | my replay log | **byte-identical** |

Run id `erdos-993-math-dre-20260926-r30-weighted-transport`; manifest stage `cycle-6-second-read-SR-C6-1`; schema
`verityos.math-dre.packet-manifest.v1`.

**Read-boundary and process disclosures.**
1. Beyond the two boot files, I opened only capsule members. I read the brief, the protocol, the manifest, `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md` §3–§5. I read the synthesis in the sections the brief names, plus the preamble and `## Refuted or narrowed mechanisms`. I read C-T1-F in full, C-T1-U's preamble and verdict, T1's return (header and Step 1–2, the closed forms), the T adjudication (preamble, `### T1`, `## Established results`), the Stage 5 T and Stage 6 controller facts (greps plus the facts naming T1, the re-read duty, hygiene and CF-REPLAY-c6d), `CF-REPLAY-c6d.json` and `.py`, and the alias pre-screen. From the three registries I read the entries named below, loading each file programmatically. From the frozen instruments I read the C-T1-F `block_proof_check.py` header and log.
2. **Deviation: hashing outside the capsule.** Verifying `sources/c6-stage7-sources/SOURCE-DIGESTS.json` meant hashing all 723 listed files. 596 of them are not capsule members: the other seats' directories under `sources/c6-stage7-sources/`. Their bytes were read only to compute SHA-256. No content was displayed or used, and I made no directory listing. The paths came from `SOURCE-DIGESTS.json`, which is a capsule member.
3. I made no directory listing outside the capsule. The only listings were of my own scratch directory. I ran no `find`, `grep`, `rg` or other search rooted above the capsule members; every grep named a capsule member. I used no network, made no installs and ran no `lake` or `lean`.
4. I ran no background job and killed nothing. Every Python run used `python3 -B`, with standard library, exact integers and `Fraction` only, and no bytecode is present. The longest foreground run took about 5 minutes.
5. Writes: `mkdir -p` of `second-reads/SR-C6-1/` and `scratchpad/c6-sr-SR-C6-1/`, then files only under the scratch directory and this file. I copied two capsule members (`C-T1-F/block_proof_check.py` and `own_poly.py`) into `scratchpad/c6-sr-SR-C6-1/replay-CT1F/` for the copy-out replay. No sealed member was edited.
6. The host placed the project `CLAUDE.md` and the user's auto-memory index in my context at session start. I did not open them or act on them, and I kept no conversation log, because the brief confines my writes to this file and my scratch directory. One long tool output (the text of C-T1-F) was spilled by the harness to its own tool-results file, which I read back. That is my own output of a capsule member, not a VerityOS read.
7. The controller facts, CF-REPLAY-c6d, the pre-screen and the other seats' instruments were used as facts or as a third instrument, never as evidence (protocol duty 4).

## Statements read

- **SR-C6-1a (K-2, the lemma).** For `d ≥ 6`, `m ≥ 1`, `T = CB(d,m)` and `p* = ⌊(2dm+4)/3⌋`: (i) `Δ_{p*}(T − v) < 0` for every `m`; (ii) if `dm ≢ 2 (mod 3)`, then
  `Δ_{p*}(T − c) < 0` for every private leaf `c`. The proof uses Tool (D), the blocks `V_j` and `R` of (i), the blocks `E0_j` and `E1_j` and the paired block of (ii), and the `S_d ≀ S_m`
  transfer. Sources: C-T1-F `## Attacks and findings` → "Critic-derived advance"; the T adjudication `### T1` → "The critic-derived lemma (C-T1-F), graded
  here" and `## Established results` item 3; synthesis `## Exact established results` item 2, `## Registrations` K-2, and the batch table row SR-C6-1.
- **SR-C6-1b (the closed forms; a node of K-2, not a key).** `I_T`, `I_{T−v}`, `I_{T−c}`, `G`, `G_c` and `α(CB(d,m)) = m(d+1)+1`. Sources: T1 return Step 2,
  C-T1-F `## Independent re-derivation`, adjudication T1 claim 1, synthesis item 3.
- **SR-C6-1c (S-3, the citation fact).** At `p*`, the threshold key's condition `p ≥ ⌈μ_1⌉ + 2` holds with equality for `d = 8`, `m ≢ 1 (mod 3)` and for `d = 7`,
  `m ≢ 2 (mod 3)`, and the threshold is `p* + 1` at the excluded residue. Sources: C-T1-F F4, adjudication T1 claim 7 and item 4, synthesis item 4 and scope note S-3.
- **SR-C6-1d (the key and its name).** `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`. I check that it is a predicate of 1a,
  that the arm clause is on the face, the lexical and mathematical alias checks against the 460 snapshot and the 434 and 457 masters, and the attribution.

## Independent re-derivation

**Definitions used.** These are from `SEMANTIC-CONTRACT.md` §1.1. A leaf `w` is favorable at `p` iff `Δ_p(T − w) = i_{p+1}(T − w) − i_p(T − w) < 0`, on the original
carrier and at the original rank. `F_p(T)` is the set of favorable leaves. The mean is `μ(P) = P′(1)/P(1)`, so for `x^s ∏(1 + a_i x)` it is `s + Σ a_i/(1 + a_i)`: `1/2` per factor
`(1+x)` and `2/3` per factor `(1+2x)`.

**1b: closed forms (re-derived by hand).** Split on `r`.
- `r ∉ B`: the edge `s–v` contributes `1+2x`. Each choke subtree contributes `G = (1+2x)^d + x(1+x)^d`: if `u_i ∉ B`, each leg `b–c` is a `P_2`; if `u_i ∈ B`, every `b` is excluded and every `c` is free.
- `r ∈ B`: `s` and every `u_i` are excluded, `v` is free, and every leg is a `P_2`.
- So `I_T = (1+2x)G^m + x(1+x)(1+2x)^{dm}`.
- In `T − v`, `s` is isolated when `r ∉ B` and excluded when `r ∈ B`: `I_{T−v} = (1+x)G^m + x(1+2x)^{dm}`.
- In `T − c_11`, choke 1 has `d − 1` full legs and one bare support `b_11`, so its factor is `G_c = (1+2x)^{d−1}(1+x) + x(1+x)^{d−1}`. When `r ∈ B`, `b_11` is isolated. So
  `I_{T−c} = (1+2x)G_cG^{m−1} + x(1+x)^2(1+2x)^{dm−1}`.
- `α`: `r ∉ B` gives `1 + m(d+1)`, and `r ∈ B` gives `dm + 2 ≤ 1 + m(d+1)`. So `α = m(d+1)+1`.
- The leaf set is `{v} ∪ {c_ij}`, since `deg r = m+1 ≥ 2`, `deg s = deg b_ij = 2` and `deg u_i = d+1 ≥ 2`.

Own instrument (check (1)): a literal `CB(d,m)` builder, a tree test (BFS connectivity plus union-find acyclicity plus the edge count; a triangle with an isolate, two
isolates and `C_4` are rejected, and `P_3` is accepted), and a generic rooted forest DP. On `d ∈ 1..9` and small `m` (including `d = 7, 8`) it makes **166 polynomial checks
(`T`, `T − v`, and `T − c` at three private leaves), with 0 mismatches**. `α = m(d+1)+1` and the leaf set hold on every row. Every leaf is favorable at `p*` on the **literal tree** at
14 rows with `d ∈ 6..9` (the private leaves only where `dm ≢ 2`), with 0 violations.

**1a: the descent tool, checked hypothesis by hypothesis.** Take `P = x^s ∏_{i=1}^n (1 + a_i x)` with `a_i > 0`.
- `P_k = e_{k−s}(a)` is positive exactly on `[s, s+n]`. This is the support hypothesis, and it is why `P_k > 0` is required: below the support, `P_{k+1} > 0 = P_k` is possible.
- Newton's inequalities give `e_j^2 ≥ e_{j−1}e_{j+1}·C(n,j)^2/(C(n,j−1)C(n,j+1))`. The binomial factor is `> 1`, so `P_j^2 > P_{j−1}P_{j+1}` holds strictly on the support, and trivially at the ends. The strictness comes from `a_i > 0`, not from anything subtle.
- The ratios `P_{j+1}/P_j` therefore strictly decrease, so there are at most two tied adjacent modes.
- `P/P(1)` is the law of `s + Σ Bernoulli(a_i/(1+a_i))`, with `a_i/(1+a_i) ∈ (0,1)`. The shift `x^s` moves the mean and the mode together. So Darroch applies and every mode lies in `{⌊μ⌋, ⌈μ⌉}`.
- For an integer `k ≥ μ`, `k ≥ ⌈μ⌉ ≥` the largest mode, and the ratio at `k` is `< 1`; at the top of the support, `P_{k+1} = 0`.
- **The tool is correct, modulo Darroch (1964) and Newton.**

Sanity check (not proof): on 1449 `(P, k)` instances with random positive rational `a_i`, the conclusion held. Negative control: for `10 + x + 2x^2`, which is not a product of real linear factors, the mean is `5/13` and `k = 1 ≥ μ`, but `P_2 > P_1`. The product hypothesis is load-bearing.

**1a: the blocks of (i).**
- `(1+x)G^m = Σ_j C(m,j) V_j` with `V_j = x^j(1+x)^{dj+1}(1+2x)^{d(m−j)}`, by the binomial expansion of `G^m`.
- `μ(V_j) = j + (dj+1)/2 + 2d(m−j)/3 = 2dm/3 + 1/2 − j(d−6)/6`. It is `≤ 2dm/3 + 1/2` because `d ≥ 6`; this is the only use of `d ≥ 6` in (i). And `2dm/3 + 1/2 < (2dm+2)/3 ≤ p*`.
- Support: `[j, dm+j+1]`. The claim that the support contains `p*` was asserted by the critic without proof; I supply it:
  - `p* ≥ (2dm+2)/3 ≥ 4m + 2/3 > m ≥ j`, using `d ≥ 6`;
  - `p* ≤ (2dm+4)/3 ≤ dm+1`, since `dm ≥ 1`.
- For `R = x(1+2x)^{dm}`: `R_k = C(dm,k−1)2^{k−1}` and `R_{k+1}/R_k = 2(dm−k+1)/k`, which is `≤ 1` iff `3k ≥ 2dm+2`. That holds at `p*` because `3p* = 2dm+4−ε ≥ 2dm+2`.
- Equality `ΔR(p*) = 0` occurs exactly when `ε = 2`. There, strictness comes from the `V_j`.
- `R` is never fed to Darroch. Its mean `(2dm+3)/3` can exceed `p*`, which is why the explicit ratio is used.
- **(i) holds for every `m ≥ 1`.**

**1a: the blocks of (ii).**
- `(1+2x)G_cG^{m−1} = Σ_{j<m} C(m−1,j)(E0_j + E1_j)`, with:
  - `E0_j = V_j`;
  - `E1_j = x^{j+1}(1+x)^{dj+d−1}(1+2x)^{d(m−1−j)+1}`.
- Means (all verified exactly):
  - `μ(E1_j) = (j+1) + (dj+d−1)/2 + 2(d(m−1−j)+1)/3 = 2dm/3 − j(d−6)/6 + (7−d)/6 ≤ 2dm/3 + 1/6`. Equality holds exactly at `d = 6`, for every `j`.
  - `μ(E0_j) ≤ 2dm/3 + 1/2` for `j ≥ 1`.
- The leftover `x(1+x)^2(1+2x)^{dm−1}` has mean `2dm/3 + 4/3`, which can exceed `p*`. That is why it must be paired.
- Pairing: `E0_0 + leftover = (1+x)(1+2x)^{dm−1}[(1+2x) + x(1+x)] = (1+x)(1+2x)^{dm−1}(1+3x+x^2)`, because `(1+2x) + x(1+x) = 1 + 3x + x^2` identically.
- `1+3x+x^2 = (1+ax)(1+bx)` with `a+b = 3` and `ab = 1`. The discriminant of `t^2 − 3t + 1` is 5, so `a, b` are real, and positive because their sum and product are positive: `(3 ± √5)/2`.
- The mean of the quadratic factor is `(3+2)/5 = 1`, so `μ(Π) = 1/2 + 2(dm−1)/3 + 1 = 2dm/3 + 5/6`.
- With `p* = (2dm+4−ε)/3`: `p* − μ(Π) = (4−ε)/3 − 5/6 = (3−2ε)/6`, which is `1/2`, `1/6` or `−1/6` for `ε = 0, 1, 2`.
- `ε = 2` iff `2dm + 4 ≡ 2` iff `dm ≡ 2 (mod 3)`.
- Supports: `E1_j = [j+1, dm+j+1]` and `Π = [0, dm+2]`, both containing `p*` by the same bounds.
- `m = 1` is covered: `G^0 = 1`, and the blocks are `Π` and `E1_0`.
- Transfer: `S_d ≀ S_m` is the group generated by permuting the chokes and permuting the legs within a choke. It acts by automorphisms and is transitive on the `dm` private leaves, so `T − c ≅ T − c_11`.
- **(ii) holds when `dm ≢ 2 (mod 3)`.** The restriction is the proof's: at `dm ≡ 2`, `μ(Π) = p* + 1/6`, and the tool gives nothing for `Π`.

**Polynomials fed to Newton and Darroch (the point after F1).** Only `V_j = E0_j`, `E1_j` and `Π` are fed. Each is a monomial times linear factors `1 + ax` with `a ∈ {1, 2, (3±√5)/2}`, all positive. `R` uses its ratio. `I_T`, `I_{T−v}`, `I_{T−c}` and `G` are never fed.

Check (6), by exact Sturm counts in `Fraction` arithmetic against distinct-root counts from `gcd(P, P′)`: for `m = 1..4`, `I(CB(8,m))` has 4/10, 5/19, 4/28 and 5/37 distinct real zeros, `I(T−v)` has 2, 3, 2 and 3, and `I(T−c)` has 4/10, 6/18, 5/27 and 6/36. `G_8` has 3/9 and `K_{1,3}` has 1/3. The controls `(1+x)^3(1+2x)^2`, `x(1+x)(1+2x)^{40}`, `Π` at `N = 20` and `I(P_5)` report all their zeros real. So these polynomials are not products of real linear factors, and the block route is the only admissible one.

**Numeric checks (2)–(4) (my instrument; exact integers).**
- (2) The grid `d ∈ 6..13`, `m ∈ 1..60`, from the expanded closed forms: (i) holds on 480/480 rows and (ii) on 380/380 rows with `dm ≢ 2`. The four large rows `(7,150)`, `(8,150)`, `(7,300)` and `(8,300)` hold for (i) and (ii). There, two methods agree: the expanded closed form, and an independent binomial block sum of the two coefficients at `p*` and `p*+1`. All four large rows have `dm ≡ 0`, so `ε = 1`, the tightest admissible margin `1/6`; the grid covers every residue. **Horizon: `d ≤ 13`, `m ≤ 60`, plus the four rows.**
- (3) The block route block by block on `d ∈ 6..13`, `m ∈ 1..40` (320 rows):
  - the block sums equal the closed forms coefficientwise;
  - 20000 block means were computed from coefficients as exact `Fraction` values and equal the formulas above;
  - every support contains `p*`, and `R`'s ratio identity holds;
  - every block descends as claimed (blockwise violations 0).

  The pairing identity was checked as a polynomial identity for `N = 1..399`, and symbolically through `(1+2x) + x(1+x) = 1 + 3x + x^2`.
- (4) `p* − μ(Π) = (3−2ε)/6` holds on 10500 rows (`d ∈ 6..40`, `m ∈ 1..300`), and `ε = 2 ⟺ dm ≡ 2` on every row.
- Side observation (bounded, not part of the lemma): the private leaves are also favorable at `p*` on all 100 rows with `dm ≡ 2` in the grid. This agrees with the adjudicator's 50 rows. I do not widen the statement.
- Third instrument: a copy-out replay of C-T1-F's `block_proof_check.py` (320 rows for (i), 253 for (ii), `d ≤ 13`, `m ≤ 40`) produced a log byte-identical to the frozen one. It is concordance, not evidence.

**1c: the citation algebra (check (5)).**
- `r_1 = (1+y)^{d−1}(1+2y)^{d(m−1)+1}` has mean `μ_1 = (d−1)/2 + 2(d(m−1)+1)/3 = (4dm − d + 1)/6`. This is the threshold key's own `μ_1`, and it was recomputed from the coefficients of `r_1` for `m ≤ 40`.
- With `p* = (2dm+4−ε)/3`: `p* − 2 − μ_1 = (d − 5 − 2ε)/6`. Since `p* − 2` is an integer, `p* ≥ ⌈μ_1⌉ + 2` iff `p* − 2 ≥ μ_1`.
- `d = 8`: `μ_1 = (32m−7)/6`, and `p* − 2 − μ_1 = (3−2ε)/6` with `ε = (m+1) mod 3`.
  - `m ≡ 0` (`ε = 1`): `1/6`.
  - `m ≡ 2` (`ε = 0`): `1/2`.
  - Both lie in `[0, 1)`, so `p* = ⌈μ_1⌉ + 2`, with equality.
  - `m ≡ 1` (`ε = 2`): `−1/6`, so `⌈μ_1⌉ = p* − 1`, the threshold is `p* + 1`, and `p*` is the key's undecided rank (c).
- `d = 7`: `μ_1 = (14m−3)/3`, and `p* − 2 − μ_1 = (2−2ε)/6` with `ε = (2m+1) mod 3`.
  - `m ≡ 1` (`ε = 0`): `1/3`.
  - `m ≡ 0` (`ε = 1`): `0`.
  - These give equality.
  - `m ≡ 2` (`ε = 2`): `−1/3`, and the threshold is `p* + 1`.
- Exact integer comparison on `m ∈ [1, 3000]` gives 1000/1000/1000 per residue for both `d`, as stated.
- In both cases the excluded residue is `dm ≡ 2 (mod 3)`: exactly K-2's excluded residue.
- This is a citation at the key's own grade. It asserts nothing about eligibility.

**1d: predicate and alias checks.**
- The name asserts: `d ≥ 6`, every leaf favorable, the rank `⌊(2dm+4)/3⌋`, and `dm ≢ 2 (mod 3)`. That is exactly (i) ∧ (ii) on the residue, together with the leaf-set identification. It asserts no more than the statement. The additional clause "arm leaf favorable for every `m`" is on the face, in the STATEMENT field.
- Lexical check (my `sr1_alias.py`, run against the 460 snapshot and the 434 and 457 masters): no exact key; no alias equality; no `alias_patterns` hit on the name or on its lower-cased spaced form; no token overlap `≥ 85%`. The top overlap is the threshold key at 8/17 (0.47). No forbidden phrase appears.
- The whole registration text was screened against every `alias_patterns` regex of all three registries. The only hit left is the literal `KEY:` line of distinction row DR7, which names `E993-TREE-REAL-ROOTED` itself. That hit is intended.
- The 434 master is a subset of both the 460 snapshot and the 457 master. The 457 master adds 23 path-star and binomial-block keys and none of r30's 26.
- Mathematical neighbours, each given a distinction row:
  - the threshold key: a different predicate, condition (i) of the criterion;
  - the `d ≤ 6` sector key: a lower bound on `x` and sector sufficiency for `d ≤ 6`;
  - `E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE`: an instance, since `492 = p*(8,92)` and `736 ≡ 1`;
  - the two FIVE-CB keys: the five first ranks equal `p*` at their trees, with `dm ≡ 1, 1, 1, 0, 0`, so they are instances of the favorability premise only;
  - `E993-ZERO-EXTENDED-BINOMIAL-BLOCK-RISE-FALL-STRICT-RISE` (457 master, formally verified): a neighbour of the descent tool, not an alias;
  - `E993-TREE-REAL-ROOTED` (REFUTED): not used or revived.

  `E993-PAIR-UNION-MODE` (Darroch on `(1+x)^p(1+2x)^q`, a mode-additivity guardrail) and `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` are further removed and need no row.

## Findings and repairs

**The mathematics of K-2 is correct as stated.** I found no gap in Tool (D), in the blocks, in the means, in the pairing or in the transfer. The verdict for 1a rests on the
proof re-derived above, not on the numbers. Every hypothesis enters where the critic places it:
- `d ≥ 6` enters in the mean bounds of `V_j` and `E0_j` for `j ≥ 1` and of every `E1_j` (for `E1_0` through `(7−d)/6 ≤ 1/6`), and in `m ≤ p*`;
- `m ≥ 1` enters in `dm ≥ 1`;
- `a_i > 0` enters in Newton's strictness and in the Bernoulli representation;
- `P_k > 0` enters through the support bounds.

No ℕ-subtraction occurs. Every `Δ` is an integer difference, and `dm − 1 ≥ 0` because `dm ≥ 1`.

The repairs are to the face text only. The repaired text is the K-2 block under `## Registration text`.
- **R-1 (1a; the leaf set on the face).** "Hence every leaf is favorable" needs `leafSet(CB(d,m)) = {v} ∪ {c_ij}`. Neither C-T1-F nor the adjudication states this. It is added,
  with the degree reason, and the conclusion is written as `F_{p*}(CB(d,m)) = leafSet(CB(d,m))`.
- **R-2 (1a; the support bounds).** C-T1-F asserts "every block's support contains `p*`" without the inequalities. They are added: `j ≤ m ≤ p* ≤ dm + 1`, from
  `p* ≥ (2dm+2)/3 > m` (using `d ≥ 6`) and `(2dm+4)/3 ≤ dm + 1` (using `dm ≥ 1`).
- **R-3 (1a; naming inside the registry text).** "Tool (D)" is a working label listed by C6 gate ruling 48. The label "(D)" also collides with the deletion relation (D) of
  `SEMANTIC-CONTRACT.md` §1.2, which the fences must mention. The registry text therefore calls it "the product descent step". The attribution records that it is the critique's descent tool, and the proof of the step is written on the face.
- **R-4 (1a; the definitions on the face).** The mean `μ(P) = P′(1)/P(1)` and the orientation `Δ_k = i_{k+1} − i_k` on the original carrier with `w` deleted are stated. So is the
  remark that `R` is never fed to Darroch: its mean `(2dm+3)/3` can exceed `p*`.
- **R-5 (1c; evidence discipline).** The synthesis's S-3 supports the fact with "checked by CF-REPLAY-c6d, the T critics, the T adjudicator and this synthesis". Protocol duty 4
  forbids citing a controller replay as evidence. The repaired scope note carries the algebra itself (`p* − 2 − μ_1 = (d − 5 − 2ε)/6`, specialized to `d = 7, 8`), and the
  exact comparison appears only as a bounded check. The general formula `μ_1 = (d−1)/2 + 2(d(m−1)+1)/3 = (4dm − d + 1)/6` is on the face, as the brief asks.
- **Face-level claim of 1a on the residue restriction: CONFIRMED.** The restriction `dm ≢ 2 (mod 3)` in (ii) is the proof's. At `dm ≡ 2`, `μ(Π) = p* + 1/6`, and the descent step
  is silent. The `dm ≡ 2` rows (the adjudicator's 50, and my 100) are a bounded side observation, recorded as RECORD SR-C6-1-R2 and not widened into the statement.
- **Condition (a) is not graded here.** `x ≤ p* − 2` is not part of K-2. It stays the `bounded_computation` record on `[106, 2395]` (d = 8, ten exceptions) under
  `R30-CB-RECORD`. The FENCES say so.

**Observations for the controller (not registered; no widening).**
- O-1. For general `d ≥ 6`, the threshold key reaches `p*` iff `d ≥ 5 + 2ε`. So at `d = 6` (where `ε = 1` always) its threshold is `p* + 1` for every `m`. At `d ≥ 9` it is
  `≤ p*` for every `m`. At `d = 7, 8` it reaches `p*` exactly off `dm ≡ 2`, which is S-3. I checked this exactly on `d ∈ 6..30`, `m ≤ 300`. It is relevant if a successor cites the key at `p*` for other `d`.
- O-2. T1's `G′(x)` is not a derivative. It is C-T1-F's `G_c`, the same polynomial; the documents order the first product differently (`(1+2x)^{d−1}(1+x)` against
  `(1+x)(1+2x)^{d−1}`). The registry text uses `G_c` only, so no prime appears on the face.
- O-3. The Darroch step of the `d ≤ 6` sector key is outside this read (SR-C6-4). Nothing in K-2 depends on it.
- O-4. The brief's four large rows all have `dm ≡ 0 (mod 3)`, the `ε = 1` margin `1/6`. The residue classes `ε = 0` and `ε = 2` are exercised on the grid.

**Verdict on the name (1d).** The name is a predicate of the repaired statement and asserts nothing beyond it, so it is kept. The arm clause for every `m` is on the face. The lexical alias check is clear against all three
registries. The mathematical neighbours get distinction rows DR1–DR7. The attribution follows the brief:
- the lemma and the descent step: C-T1-F (Claude Opus 5.5);
- the closed forms: T1 (Claude Sonnet 5), with C-T1-F's DP validation;
- the independent check: the T adjudicator (Claude Opus 5.5);
- `CB(d,m)` and the network: Codex GPT-6's lower-region run;
- the citation input: the threshold key.

## Registration text

Register in this order. Each field is on one line, the grade is a bare token, and the qualifier is in FENCES. The K-2 block carries the closed forms of SR-C6-1b as face content, which is not a separate key. The distinction rows go to `control/CLAIM-DISTINCTIONS.json`. The records are bounded and are never evidence.

**K-2 (the key; the repaired text of SR-C6-1a, with SR-C6-1b as face content and SR-C6-1d's name).**

```text
KEY: E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let d ≥ 6 and m ≥ 1, and let T = CB(d,m) be the tree with path r – s – v, m chokes u_1..u_m adjacent to r, d supports b_i1..b_id adjacent to each u_i, and one private leaf c_ij adjacent to each b_ij (n = 3 + m + 2dm). Its leaf set is exactly {v} ∪ {c_ij : 1 ≤ i ≤ m, 1 ≤ j ≤ d} (dm + 1 leaves; r, s, every u_i and every b_ij have degree at least 2). Put p* := ⌊(2dm+4)/3⌋ and ε := (2dm+4) mod 3, so that p* = (2dm+4−ε)/3, and write Δ_k(T − w) := i_{k+1}(T − w) − i_k(T − w) in the integers, on the original carrier with w deleted (the favorable selector of SEMANTIC-CONTRACT §1.1: a leaf w is favorable at rank p iff Δ_p(T − w) < 0, at the original rank). Then (i) for EVERY m ≥ 1, Δ_{p*}(T − v) < 0, that is, the arm leaf v is favorable at p*; and (ii) if dm ≢ 2 (mod 3), Δ_{p*}(T − c) < 0 for every private leaf c. Hence, when dm ≢ 2 (mod 3), every leaf of CB(d,m) is favorable at p*, that is, F_{p*}(CB(d,m)) = leafSet(CB(d,m)); this covers d = 8 with m ≢ 1 (mod 3) and d = 7 with m ≢ 2 (mod 3), for every m. Node (closed forms; elementary; split on whether r is chosen, then on each u_i): with G := (1+2x)^d + x(1+x)^d and G_c := (1+x)(1+2x)^{d−1} + x(1+x)^{d−1}, I(T) = (1+2x)G^m + x(1+x)(1+2x)^{dm}, I(T − v) = (1+x)G^m + x(1+2x)^{dm}, I(T − c) = (1+2x)G_cG^{m−1} + x(1+x)^2(1+2x)^{dm−1} for every private leaf c, and α(T) = m(d+1) + 1. The product descent step: let P = x^s ∏_{i=1}^{n}(1 + a_i x) with integer s ≥ 0 and every a_i > 0, let μ(P) := P′(1)/P(1), and let k be an integer with k ≥ μ(P) and P_k > 0; then P_{k+1} < P_k. Proof of the step: P_k = e_{k−s}(a_1..a_n) is positive exactly for s ≤ k ≤ s + n; Newton's inequalities with every a_i > 0 give P_j^2 > P_{j−1}P_{j+1} for every j in that range, so the ratio P_{j+1}/P_j strictly decreases there; P/P(1) is the law of s plus a sum of independent Bernoulli(a_i/(1+a_i)) variables with mean μ(P), so by Darroch (1964) every mode M lies in {⌊μ⌋, ⌈μ⌉} and hence M ≤ ⌈μ⌉ ≤ k; a positive strictly log-concave sequence strictly decreases from its largest mode onward, and P_{s+n+1} = 0 < P_{s+n}. Proof of (i): expanding G^m binomially, I(T − v) = Σ_{j=0}^{m} C(m,j)V_j + R with V_j := x^j(1+x)^{dj+1}(1+2x)^{d(m−j)} and R := x(1+2x)^{dm}. The mean is μ(V_j) = 2dm/3 + 1/2 − j(d−6)/6 ≤ 2dm/3 + 1/2 < (2dm+2)/3 ≤ p* (d ≥ 6 enters here, for j ≥ 1). The support of V_j is [j, dm + j + 1], and j ≤ m ≤ p* ≤ dm + 1 (p* ≥ (2dm+2)/3 > m because d ≥ 6, and (2dm+4)/3 ≤ dm + 1 because dm ≥ 1), so (V_j)_{p*} > 0 and the product descent step gives (V_j)_{p*+1} < (V_j)_{p*}. For R, R_k = C(dm, k−1)2^{k−1} > 0 for 1 ≤ k ≤ dm + 1 and R_{k+1}/R_k = 2(dm − k + 1)/k ≤ 1 iff 3k ≥ 2dm + 2, which holds at k = p*; so R_{p*+1} ≤ R_{p*}. Every weight C(m,j) is positive, so Δ_{p*}(T − v) < 0. Proof of (ii): for c = c_11, (1+2x)G_cG^{m−1} = Σ_{j=0}^{m−1} C(m−1,j)(E0_j + E1_j) with E0_j := x^j(1+x)^{dj+1}(1+2x)^{d(m−j)} (equal to V_j) and E1_j := x^{j+1}(1+x)^{dj+d−1}(1+2x)^{d(m−1−j)+1}. Pair E0_0 with the last term: (1+x)(1+2x)^{dm} + x(1+x)^2(1+2x)^{dm−1} = (1+x)(1+2x)^{dm−1}(1+3x+x^2) =: Π, where 1 + 3x + x^2 = (1+ax)(1+bx) with a + b = 3, ab = 1 and a, b = (3 ± √5)/2 > 0 (discriminant 5). The means are μ(E0_j) = 2dm/3 + 1/2 − j(d−6)/6 < p* for 1 ≤ j ≤ m − 1; μ(E1_j) = 2dm/3 − j(d−6)/6 + (7−d)/6 ≤ 2dm/3 + 1/6 < p*; and μ(Π) = 2dm/3 + 5/6, with p* − μ(Π) = (3 − 2ε)/6, which is positive iff ε ≤ 1 iff dm ≢ 2 (mod 3). The supports [j, dm + j + 1] of E0_j, [j + 1, dm + j + 1] of E1_j and [0, dm + 2] of Π all contain p*. So when dm ≢ 2 (mod 3) the product descent step applies to every block, every block strictly decreases at p*, and the sum with positive weights gives Δ_{p*}(T − c_11) < 0. Transfer: S_d ≀ S_m (permuting the chokes, and the supports within each choke) acts on T by automorphisms and transitively on the dm private leaves, so T − c ≅ T − c_11 for every private leaf c. The only polynomials fed to Newton's inequalities and to Darroch's theorem are V_j = E0_j, E1_j and Π, each a monomial times a product of linear factors 1 + a x with a > 0; R is handled by its explicit ratio; I(T), I(T − v) and I(T − c) are never fed to either, and they are not products of real linear factors (for example I(CB(8,1)) has 4 distinct real zeros out of 10). The restriction dm ≢ 2 (mod 3) in (ii) is the proof's: at dm ≡ 2 (mod 3) the paired block has mean p* + 1/6 and the product descent step does not apply; private-leaf favorability at those rows is neither asserted nor denied.
SCOPE: One explicit tree family CB(d,m), d ≥ 6, m ≥ 1, at one rank per tree, p* = ⌊(2dm+4)/3⌋; only the favorability of the original leaves (the fixed selector F_{p*}) is asserted. Hypotheses consumed: d ≥ 6 (only in the block-mean bounds, for V_j and E0_j with j ≥ 1 and for every E1_j, and in m ≤ p*), m ≥ 1, and the literal CB(d,m); no IsTree hypothesis is used beyond the explicit graph, and no eligibility, weight, relation or invariance hypothesis enters except the S_d ≀ S_m automorphisms in the transfer. The proof says nothing for d ≤ 5 or at any rank other than p*. Validation (bounded_computation, never proof): exact integer checks of (i) on 480 rows d ∈ 6..13, m ∈ 1..60, of (ii) on the 380 of them with dm ≢ 2 (mod 3), and of both at (7,150), (8,150), (7,300), (8,300) by two methods; the block route checked block by block on d ∈ 6..13, m ∈ 1..40; the closed forms equal a literal-tree dynamic program on 166 polynomial checks (d ∈ 1..9); every leaf favorable on the literal tree at 14 rows d ∈ 6..9 (isolated second read SR-C6-1); earlier checks by C-T1-F (d ≤ 13, m ≤ 40) and the r30 Cycle 6 T adjudicator (d ∈ 6..13, m ∈ 41..70 and four larger rows).
ATTRIBUTION: The lemma, the product descent step (the critique's descent tool) and the block decomposition with the paired-block factorization: C-T1-F (Claude Opus 5.5; r30 Cycle 6 Stage 4 critique of route T1). The closed forms for I(CB(d,m)), I(CB(d,m) − v) and I(CB(d,m) − c) and α(CB(d,m)) = m(d+1) + 1: T1 (Claude Sonnet 5; r30 Cycle 6 route return), re-derived and validated against a literal-tree dynamic program (72 checks, d ≤ 8) by C-T1-F. The on-face check, an independent instrument on rows beyond the critic's range, and the grade: the r30 Cycle 6 T adjudicator (Claude Opus 5.5). Isolated second read SR-C6-1 (Claude Opus 5.5): the leaf-set identification, the support bounds, the renaming of the descent step, and an own instrument. The family CB(d,m) and the lower-region transport network in which the favorable selector is used: Codex (GPT-6 Astra/Sol/Luna), the lower-region run; the definition layer: the first-interior run (Codex), entries 1–18. Citation input for the companion scope note at rank p* (not used in this proof): E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD. Classical: J. N. Darroch, On the distribution of the number of successes in independent trials, Ann. Math. Statist. 35 (1964); Newton's inequalities.
FENCES: No eligibility claim: the lemma does not assert x(T) + 2 ≤ p*; condition (a), x ≤ p* − 2, is a separate bounded_computation record at d = 8 on m ∈ [106, 2395] with the ten exceptions m ∈ {106, 109, …, 133}, recorded under R30-CB-RECORD and not graded here; for large m, p* is an interior eligible rank (bounded record). Not (HALL) and not a restricted-scope (HALL) theorem; nothing about the weight w_F, the relation (D) ∪ (S), flows, sector families or switch arcs; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. Newton's inequalities and Darroch's theorem are applied only to the explicit products V_j, E1_j and Π (a monomial times linear factors with positive coefficients), never to the independence polynomial of a graph; the refuted universal zero-location claim is neither used nor revived (distinction row SR-C6-1-DR7). Grade qualifier: proved_informal modulo Darroch (1964) and Newton's inequalities, classical dependencies not under sources/. The rows with dm ≡ 2 (mod 3) are a bounded side observation only and are not part of the statement. No census value enters the proof. The primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched, as are E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG and Erdős #993; no status transfers to or from E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK or E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE (distinction rows). No refuted mechanism is revived. No RTree or governed-model assertion. Any result built on this key inherits its grade (proved_informal modulo Darroch and Newton) at best.
ALIASES: C-T1-F top-rank block favorability lemma
```

**S-3 (the repaired scope note of SR-C6-1c).**

```text
SCOPE NOTE ON: E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD
TEXT: Citation fact at the rank p* = ⌊(2dm+4)/3⌋ (r30 Cycle 6). This is a citation of this key at its own grade (proved_informal modulo Darroch), not a new result. With μ_1 the mean of r_1 = (1+y)^{d−1}(1+2y)^{d(m−1)+1}, μ_1 = (d−1)/2 + 2(d(m−1)+1)/3 = (4dm − d + 1)/6. Writing p* = (2dm+4−ε)/3 with ε = (2dm+4) mod 3 gives p* − 2 − μ_1 = (d − 5 − 2ε)/6, and since p* − 2 is an integer, p* ≥ ⌈μ_1⌉ + 2 iff p* − 2 − μ_1 ≥ 0. For d = 8, μ_1 = (32m − 7)/6 and p* − 2 − μ_1 = (3 − 2ε)/6 ∈ {1/2, 1/6, −1/6} with ε = (m + 1) mod 3; so the hold condition (a) p ≥ ⌈μ_1⌉ + 2 holds at p = p* with equality, p* = ⌈μ_1⌉ + 2, exactly when m ≢ 1 (mod 3); at m ≡ 1 (mod 3) the threshold is p* + 1, and p* = ⌈μ_1⌉ + 1 is this key's undecided rank (c). For d = 7, μ_1 = (14m − 3)/3 and p* − 2 − μ_1 = (2 − 2ε)/6 ∈ {1/3, 0, −1/3} with ε = (2m + 1) mod 3; so equality holds exactly when m ≢ 2 (mod 3), and at m ≡ 2 (mod 3) the threshold is p* + 1. In both cases the excluded residue is exactly dm ≡ 2 (mod 3), that is, ε = 2. Hence condition (i) of E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL holds at every q ∈ [1, m] at (CB(8,m), p*) for every m ≢ 1 (mod 3) and at (CB(7,m), p*) for every m ≢ 2 (mod 3), by part (a) of this key and at its grade. No eligibility is asserted. Inside this key, Darroch is applied only to r_q, a product of linear factors. Checked (bounded_computation, not evidence): exact integer comparison of ⌈μ_1⌉ + 2 with p* for d = 7, 8 and every m ∈ [1, 3000], and μ_1 recomputed from the coefficients of r_1 for m ≤ 40 (isolated second read SR-C6-1). Attribution: C-T1-F (Claude Opus 5.5; the d = 8 algebra); the r30 Cycle 6 T adjudicator (Claude Opus 5.5) and the r30 Cycle 6 synthesis (the d = 7 case); isolated second read SR-C6-1 (Claude Opus 5.5; the general identity and the d = 7 algebra on the face).
```

**Distinction row DR1.**

```text
DISTINCTION ROW: SR-C6-1-DR1
KEY: E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD
TEXT: A different predicate. That key locates the ranks where condition (i) of the mark-clone criterion holds, a non-strict decrease of consecutive coefficients of r_q = (1+y)^{qd−1}(1+2y)^{d(m−q)+1} at every q, which is a statement about the criterion and not about any deleted tree. The new key asserts the favorability of the original leaves, that is, the strict descent of I(CB(d,m) − v) and I(CB(d,m) − c), at the single rank ⌊(2dm+4)/3⌋. They share the family CB(d,m) with d ≥ 6 and the classical steps on products of linear factors. Neither implies the other and no status transfers; the companion fact at ⌊(2dm+4)/3⌋ is a scope note on that key.
```

**Distinction row DR2.**

```text
DISTINCTION ROW: SR-C6-1-DR2
KEY: E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS
TEXT: A different object and a different range. That key covers d ≤ 6: a lower bound x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋ on the first strict descent of I(CB(d,m)), and the absence of deletion-deficient root-plus-arm sector subfamilies at every rank p ≥ x + 2. The new key covers d ≥ 6 and asserts the descent of I(CB(d,m) − v) and I(CB(d,m) − c) at the single rank ⌊(2dm+4)/3⌋, which is leaf favorability. They meet only at d = 6, where the statements concern different polynomials. The new key uses no part of that key, and that key's own Darroch step is re-read separately (SR-C6-4). No status transfers either way.
```

**Distinction row DR3.**

```text
DISTINCTION ROW: SR-C6-1-DR3
KEY: E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE
TEXT: That key's statement that all 737 leaves of CB(8,92) are favorable at 492 is one exact instance of the new key, since 492 = ⌊(2·736+4)/3⌋ and 736 ≡ 1 (mod 3). The new key is uniform in m. It says nothing about that key's other content: the arm contribution, Retag export, the tag-closed arm cut, the complete aggregate and the G1 statements at rank 491. The instance keeps its own grade, and no status transfers either way.
```

**Distinction row DR4.**

```text
DISTINCTION ROW: SR-C6-1-DR4
KEY: E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: Instances and not the lemma. The five ranks of that key are exactly ⌊(2dm+4)/3⌋ at their trees: 460, 476 and 492 at CB(8,86), CB(8,89) and CB(8,92), 577 at CB(8,108) and 673 at CB(7,144), with dm ≡ 1, 1, 1, 0 and 0 (mod 3). So its derived premise that every leaf is in F_p(T) is an instance of the new key. The (HALL) content of that key, its grade computer_assisted, its statement and its certificate are unchanged, and the new key asserts no (HALL). No status transfers either way.
```

**Distinction row DR5.**

```text
DISTINCTION ROW: SR-C6-1-DR5
KEY: E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK
TEXT: A different object. That key is deletion-arc (HALL) and (HALL-COND) at listed windows of five trees, mostly at ranks above ⌊(2dm+4)/3⌋, where the new key asserts nothing. The new key is leaf favorability at the one rank ⌊(2dm+4)/3⌋ and makes no Hall statement. No status transfers either way.
```

**Distinction row DR6.**

```text
DISTINCTION ROW: SR-C6-1-DR6
KEY: E993-ZERO-EXTENDED-BINOMIAL-BLOCK-RISE-FALL-STRICT-RISE
TEXT: A mathematical neighbour of the product descent step, not an alias. That formally verified key gives the exact rise-then-fall turning index t + ⌊u/2⌋ of the coefficients of x^t(1+x)^u(1+2x). The new key's descent step is a different statement: an arbitrary monomial times a product of linear factors with positive coefficients strictly decreases at every rank at or above its mean, modulo Darroch and Newton. The new key does not cite that key, and its blocks carry (1+2x) to high powers. No status transfers either way.
```

**Distinction row DR7.**

```text
DISTINCTION ROW: SR-C6-1-DR7
KEY: E993-TREE-REAL-ROOTED
TEXT: That claim stays REFUTED. The new key neither uses nor revives it: the classical mode and log-concavity steps are applied only to the explicit products V_j, E1_j and Π, and never to the independence polynomial of any graph. The struck citation of that claim in the Cycle 6 route return is not evidence for anything here.
```

**Record R1.**

```text
RECORD: SR-C6-1-R1
CLAIM: Exact checks of the new key at p* = ⌊(2dm+4)/3⌋. Part (i) holds on all 480 rows d ∈ 6..13, m ∈ 1..60, and part (ii) on the 380 of them with dm ≢ 2 (mod 3). Both hold at (7,150), (8,150), (7,300) and (8,300), where the expanded closed form and an independent binomial block sum agree. The block route was checked block by block on d ∈ 6..13, m ∈ 1..40 (320 rows): block sums equal the closed forms, 20000 exact Fraction mean identities hold, supports contain p*, and no block fails to descend. The closed forms equal a literal-tree dynamic program on 166 polynomial checks with d ∈ 1..9, α = m(d+1) + 1 holds on every such row, and every leaf is favorable at p* on the literal tree at 14 rows with d ∈ 6..9. p* − μ(Π) = (3 − 2ε)/6 holds on 10500 rows with d ∈ 6..40 and m ∈ 1..300.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-C6-1 (Claude Opus 5.5), own instrument scratchpad/c6-sr-SR-C6-1/sr1_checks.py; never evidence of the statement
```

**Record R2.**

```text
RECORD: SR-C6-1-R2
CLAIM: Side observation, not part of the new key. The private leaves are also favorable at p* on all 100 rows with dm ≡ 2 (mod 3) among d ∈ 6..13, m ∈ 1..60, and on the r30 Cycle 6 T adjudicator's 50 such rows. The key's proof does not reach these rows.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-C6-1 (Claude Opus 5.5), own instrument; the r30 Cycle 6 T adjudicator (Claude Opus 5.5)
```

**Record R3.**

```text
RECORD: SR-C6-1-R3
CLAIM: Exact distinct-real-zero counts, by Sturm sequences in Fraction arithmetic. For m = 1..4, I(CB(8,m)) has 4, 5, 4 and 5 distinct real zeros out of degree 10, 19, 28 and 37; I(CB(8,m) − v) has 2, 3, 2 and 3; I(CB(8,m) − c) has 4, 6, 5 and 6 out of degree 10, 18, 27 and 36; the choke factor G_8 has 3 of 9 and I(K_{1,3}) has 1 of 3. So none of these is a product of real linear factors, and the block route is the admissible route for the classical steps.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-C6-1 (Claude Opus 5.5), own instrument; concordant with C-T1-F and the r30 Cycle 6 T adjudicator
```


## Verdicts

verdict[SR-C6-1a]: confirmed_with_repairs
verdict[SR-C6-1b]: confirmed
verdict[SR-C6-1c]: confirmed_with_repairs
verdict[SR-C6-1d]: confirmed

- SR-C6-1a: the lemma and its proof are correct, modulo Darroch (1964) and Newton's inequalities, which are applied only to products of linear factors. The repairs R-1 to R-4
  are face text only, and the exact repaired text is the K-2 block. The grade is `proved_informal`. The restriction `dm ≢ 2 (mod 3)` in (ii) is the proof's, and the `dm ≡ 2` rows
  are a bounded side observation only.
- SR-C6-1b: the closed forms and `α(CB(d,m)) = m(d+1)+1` are confirmed by the root/choke split and by my literal-tree DP (166/0, `d ∈ 1..9`, including `d = 7, 8`). They are
  registered as face content of K-2, not as a key.
- SR-C6-1c: the citation fact is confirmed for `d = 8` (`m ≢ 1`) and `d = 7` (`m ≢ 2`), with threshold `p* + 1` at the excluded residue. Repair R-5 puts the algebra on the face and
  drops the replay citation as evidence. It is a citation at the key's grade, not a new result.
- SR-C6-1d: the name is kept. It is a predicate the repaired statement satisfies, and the arm clause is on the face. It is lexically clear against the 460, 434 and 457 registries, with distinction rows
  DR1–DR7.

Registration items written (key names):
- the new key `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`;
- a scope note on `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`;
- distinction rows SR-C6-1-DR1 to DR7, against:
  - `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`;
  - `E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS`;
  - `E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE`;
  - `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`;
  - `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`;
  - `E993-ZERO-EXTENDED-BINOMIAL-BLOCK-RISE-FALL-STRICT-RISE`;
  - `E993-TREE-REAL-ROOTED`;
- records SR-C6-1-R1 to R3, all `bounded_computation`.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-sr-SR-C6-1/` (SHA-256). There is no bytecode and no other file.

| File | SHA-256 | Role |
|---|---|---|
| `sr1_poly.py` | `8a67b1a920a2971346b07b4e5e5cf333e71165de3ae4818354638d130a8ccecc` | own instrument: polynomials, literal CB builder, tree test, forest DP, closed forms, exact Sturm counting |
| `sr1_checks.py` | `347c699a00c96dbd7b8883172f06b5d7187d22ec6a32e8e5f35d059223b2ea05` | own checks (1)-(6), descent-tool sanity and negative control; `cd <scratch> && python3 -B sr1_checks.py` (about 5 min, foreground) |
| `sr1_checks.log` | `f5fb41acc031413c869bf9bbba181c66514e78ef855f1cbc957445e5f33ffc48` | output of sr1_checks.py (`RESULT_DIGEST f93f148962d5969893700a4cbdd81c5d395f4f3ec923f54c0ed75e43a5a0ae78`) |
| `sr1_checks_result.json` | `58f7b0ddb5ca4ae7fe560bd7dbedd2d86bb447d60ca5ea325f240704ed836fae` | machine-readable results (the RESULT_DIGEST is the SHA-256 of this JSON without its trailing newline) |
| `sr1_alias.py` | `4bfdf2f40f7b2e2d1f8b5f13b9c197d705c1c64ec4a5be2410500a0c9cf8eeb3` | own lexical alias check against the 460 snapshot and the 434 and 457 masters; `python3 -B sr1_alias.py [text]` |
| `sr1_alias_name.log` | `22b8ea01a2398b6d3836b071e79c44aab74ee140b30e234b48b520ceb1a5c273` | alias check of the K-2 name (`ALIAS_DIGEST 1b29d4c11533f698c47c98a18a03f026a4c7caa15a235e689b13b97404e2b691`) |
| `sr1_alias_text.log` | `91775892701c2388608240e976b05685178a009ee2b6edf54740334830e4542d` | alias-pattern screen of the final registration text (`ALIAS_DIGEST 9b4f5ac605478032d78c36a54e7fb447cba87de41d2b6ed244c7b64f64a432f5`; the only hit is DR7's KEY line) |
| `sr1_registration_text.txt` | `31783bbd0be39ede3e3a006573d7d8c5055e11244b777aaad728d4849cb541c0` | the registration blocks, verbatim as embedded above |
| `sr1_body_head.md` | `6272084f8393ff6e7f3887fc96afe2e0cbb5ff014ab2d3c0439e75137f975a96` | assembly part (identity through re-derivation) |
| `sr1_body_findings.md` | `0f49861e7fce0073f1a599c28bd1706a83cec531db5ffac81fd642f9a2816c04` | assembly part (findings) |
| `sr1_body_tail.md` | `b16921022acae854954c8c8fdfcc1983cb687739097ab76d5def3268edb0a1a9` | assembly part (registration text and verdicts) |
| `replay-CT1F/block_proof_check.py` | `0463fc0f46f407ded10f1527afcb17571e8f2e2595c5e2c32cebeb74eabc79fb` | copy of the capsule member `sources/c6-stage7-sources/C-T1-F/block_proof_check.py` (third instrument) |
| `replay-CT1F/own_poly.py` | `b3b7871e38457dfdad96cc278e71048102f8bafcb0c4609df09c286e3dbdcc94` | copy of the capsule member `sources/c6-stage7-sources/C-T1-F/own_poly.py` |
| `replay-CT1F/block_proof_check.replay.log` | `a87fd67c751d47edbddb741c502714beabdb9cd7d7d6eff7fa6938494bcec2d2` | replay log, byte-identical to the frozen `C-T1-F/block_proof_check.log` |

The output file is `second-reads/SR-C6-1/SECOND-READ.md` (this file). Its digest is given in the final report, since a file cannot carry its own digest.
