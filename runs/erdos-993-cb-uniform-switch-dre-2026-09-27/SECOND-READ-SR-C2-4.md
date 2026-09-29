# Second Read

Isolated second read `SR-C2-4`, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`), Cycle 2: the informal inputs of award
C2-LA1 (the factorial normalization of the pooled `S_5`, the ℕ closed-form encoding of `I(cbGraph m)`) and the certificate facts of
X-12 / G-6. Written 2026-09-28 (clock 03:38 EDT at the start of writing).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the constitution and the startup protocol). Subsystems loaded: those two
files only. I followed no other part of the startup map (memory, modules, skills, logs, decisions, operations, conversations), as the
brief requires; the controller owns conversation logging for this run, and this read writes only this file and its scratch.

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Protocol** `control/C2-SECOND-READ-PROTOCOL.md`: SHA-256 recomputed with `shasum -a 256` before reading:
  `563877beef7a57b1fd71ef95f518998ec7598fc9f9328e28270f3405e85d9e82`. **MATCH** (dispatch value).
- **Brief** `control/C2-SECOND-READ-BRIEF-SR-C2-4.md`: `56b9888ca24572ed93cbd3a2ed62d0807cb68f45024a798abb15399b0aa73cb9`. **MATCH**.
- **Capsule** `control/c2-second-read/SR-C2-4-PACKET-MANIFEST.json`, stage `cycle-2-second-read-SR-C2-4`, schema
  `verityos.math-dre.packet-manifest.v1`, run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`, 623 files.
  - Seal recomputed as the SHA-256 of the compact key-sorted JSON of the manifest without `seal_sha256` (`separators=(",", ":")`, no
    trailing newline): **`362777433736833657b9a825b8ee417db3188c4736be125fc18a826428d56c6c`** = recorded `seal_sha256` = dispatch value.
    **Seal: MATCH.** (The manifest file's own byte digest, `444d6030…d981`, is not the seal.)
  - **All 623 listed members exist and match their SHA-256** (0 mismatches, 0 missing).
- **Directory digest files** (checked before reading any member under them; only capsule members hashed):
  `sources/SOURCE-DIGESTS.json` 65/65 members match; `sources/c1-results/SOURCE-DIGESTS.json` 322/322; `sources/c2-stage7-sources/SOURCE-DIGESTS.json`
  202/202; `sources/concurrent/SOURCE-DIGESTS.json` 1/1. 0 mismatches.
- **Frozen Lean texts read (reading only; no `lake`/`lean` run):** `CriticS5.lean` `300b6bd8…8745` is byte-identical in
  `crit-U1-T/`, `adj-U/P1/` and `adj-U/P4/`; `CriticU3T.lean` and `CriticU3T2.lean` are byte-identical in `crit-U3-T/` and `adj-U/P4/`;
  `adj-U/P4/LeanProof/U3.lean` differs from `crit-U3-T/…/U3.lean` only in line 1 (`import LeanProof.LA2Main` for `import LeanProof.Main`), as
  the U adjudication discloses.
- **Registries.** Run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c2-stage2.json` (497 claims), frozen master
  `sources/authority/CLAIM-IDENTITY.json` (491), concurrent master `sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json` (494).
- **Controller facts** `C2-STAGE6-CONTROLLER-FACTS.json` (CF6-2-1..6), `C2-STAGE5-CONTROLLER-FACTS-U.json`, `-F.json`: read as facts, never
  authority, never evidence. The capsule's `PATH-CHECK-SR-C2-4.json`: 612 files scanned, 0 findings.

**Read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md`, the user's auto-memory index and the user's e-mail into my context before my first
   tool call. I did not open, fetch or use them; I did no conversation logging (the brief's single-file write rule governs).
2. My first shell call printed a zsh `=====` separator error (cosmetic; the protocol text displayed in full before it).
3. Two displays exceeded the tool's inline limit (the brief-plus-manifest print and the synthesis). The harness saved them to its own
   tool-output cache outside the run root; I paged the synthesis copy there with the file reader. The copies are capsule members'
   bytes; no other file in that cache was listed or opened.
4. **Directory listings outside the capsule (names only):** `ls` of `second-reads/` (showing `SR-1`..`SR-6`, `SR-C2-2`, `SR-C2-3`,
   `SR-C2-6`; none opened) before writing my output. Inside the capsule tree: a non-recursive `ls` of
   `sources/c1-results/runs/lean-2026-09-28-c1-la2-cb8-definition-layer/` and of its `LeanProject/LeanProof/` (every name shown is a capsule
   member, checked against the manifest).
5. Every `grep` was of a single named capsule member (U1 `Main.lean`, C1-LA2 `Main.lean`, `CriticS5.lean`, U3/C-U3-T files, the C-F2 and
   F-adjudication records, three instrument output files). No `find`, `rg`, `ls -R` or glob `cat` above the capsule members; no Mathlib
   search (none was needed).
6. No network, no installs, no `lake`/`lean`, no child agents, no background jobs (every run in the foreground), no process killed. I
   ran no seat or critic script; all computation is by my own instruments below.
7. Writes: this file and `scratchpad/c2-sr-SR-C2-4/` only.

## Statements read

Statement of record: `cycles/cycle-2/stage6/SYNTHESIS.md` — `## Exact established results` X-1, X-2, X-3, X-12; `## Registrations` G-1, G-6;
`## Lean awards` C2-LA1 (its DAG and preconditions); `## Refuted or narrowed mechanisms` (for what is struck). Origins read (all capsule
members): the U adjudication (in full), the F adjudication (targeted), C-U1-T (in full), C-U3-T (re-derivation and attacks), C-U1-F / C-U3-F
(structure and findings), C-F2-T and C-F2-U (the `N_5`, `N_4` passages), SR-4 (in full through its registration text), and the Lean texts of
U1 `Main.lean` (the new section), C-U1-T `CriticS5.lean` and `gen_lean_s5.py`, U3 `U3.lean` (Node 0), C-U3-T `CriticU3T.lean`,
`CriticU3T2.lean`, the U adjudicator's `AdjCompose.lean`, and C1-LA2 entries 9, 10, 22–25.

- **SR-C2-4a (the factorial normalization).** With `m = 3t+2`, `t = 35+u`, each of the 254 binomial terms of the pooled `S_5` (blocks `j ≤ 5`
  plus the tail) satisfies `C(n,k)·L1!·K1! = N0!·(46 linear factors in u)`, hence `2^45·120·L1!·K1!·S_5 = 2^(16u+570)·N0!·Poly(u)` with `Poly`
  of degree 50 and 51 positive integer coefficients; the digest of `Poly(u)` and SR-4's `N_5` (`893a21b6…51f7`) agree up to the stated
  normalization; every factor's sign on the class; no ℕ-subtraction truncates.
- **SR-C2-4b (the ℕ closed-form encoding).** `I(cbGraph m) = (1+2X)G^m + X(1+X)(1+2X)^{8m}` over ℕ as the generating function of
  `C5LA1.indepSetCount (cbGraph m) ∅`, via the vertex split at `r` and the `m`-ary product over vertex-disjoint branches; the literal
  branches of C1-LA2's frozen labelling; count = coefficient; the cast bridge to `ℤ[X]`.
- **SR-C2-4c (X-12, G-6 scope-note facts).** `N_5`'s minimal all-positive shift `t = 33`; `S_4 > 0` for class `m ≥ 137`; eligibility at `p*` fails
  at every residue-2 `m ≤ 83` and holds at `86..104` (bounded); the exact `SCOPE NOTE ON:` text for the ELIG key.

Class throughout: `T = CB(8,m)`, `m ≥ 107`, `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`, `n = 17m+3`, `α = 9m+1`, `L := p* − 2 = (16m−2)/3`;
labelling 0 = r, 1 = s, 2 = v, `u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`. Index of record: descent at index `k` means
`i_{k+1} < i_k`.

## Independent re-derivation

All instruments are mine, under `scratchpad/c2-sr-SR-C2-4/`: Python standard library only, exact `int`/`Fraction`, `python3 -B`, foreground.

### SR-C2-4a by hand

*Object.* U1's `cb8S5 m` (U1 `Main.lean`, read) is `Σ_{j<6} C(m,j)(coeff_{L−j} P_j − coeff_{L−j+1} P_j) + (coeff_L T − coeff_{L+1} T)` with
`P_j = (1+X)^{8j}(1+2X)^{8(m−j)+1}`, `T = X(1+X)(1+2X)^{8m}`, `L = (16m+4)/3 − 2`, all differences in ℤ. This is SR-4's `S_5`.

*Parametrization.* `m = 3t+2`, `t = 35+u` gives `m = 3u+107`, `8m = 24u+856`, `p* = 16u+572`, `L = 16u+570`. Put `N0 := 8m − 39 = 24u+817`,
`L1 := L+1 = 16u+571`, `K1 := 8m − L + 6 = 8u+292`.

*Coefficient extraction.* `2(1+x) = (1+2x) + 1` gives `2^{8j}[x^l](1+x)^{8j}(1+2x)^M = Σ_{i=0}^{8j} C(8j,i)·2^l·C(M+i, l)`, and
`[x^l]X(1+X)Q = [x^{l−1}]Q + [x^{l−2}]Q` with `Q = (1+2x)^{8m}` gives `τ = 2^{L−2}C(8m, L−2) − 2^L C(8m, L)` (the two middle terms cancel).
So `S_5` is a signed combination of exactly **254 binomial terms**: `C(8(m−j)+1+i, L−j+e)` for `0 ≤ j ≤ 5`, `0 ≤ i ≤ 8j`, `e ∈ {0,1}`
(`2·Σ_{j≤5}(8j+1) = 252`) and the tail's `C(8m, L−2)`, `C(8m, L)`. (They are 167 distinct binomials; the count 254 is of terms.)

*Ranges (no truncation).* For block terms `n = 24u + 857 − 8j + i ∈ [24u+817, 24u+857]`, `k = 16u + 570 − j + e ∈ [16u+565, 16u+571]`,
`n − k = 8u + 287 − 7j + i − e ∈ [8u+251, 8u+287]`; tail `n = 24u+856`, `n − k ∈ {8u+288, 8u+286}`. Hence `N0 ≤ n`, `k ≤ L1`, `n − k ≤ K1`
for every term and every `u ≥ 0`.

*The normalization.* From `C(n,k)·k!·(n−k)! = n!`:
`C(n,k)·L1!·K1! = N0! · Π_{q=N0+1}^{n} q · Π_{q=k+1}^{L1} q · Π_{q=n−k+1}^{K1} q`, and the number of factors is
`(n − N0) + (L1 − k) + (K1 − n + k) = L1 + K1 − N0 = 46` for every term. Each factor is `24u+c`, `16u+c` or `8u+c` with `c ≥ 252`
(the least is `8u+252`), so **every factor is positive for every `u ≥ 0`**, in particular on the whole class and at its endpoint `u = 0`.

*Weights and powers of two.* `120·C(m,j) = (120/j!)·Π_{q=0}^{j−1}(3u+107−q)` (positive factors; `j ≤ 5`, so `120/j!` is an integer). The block
term carries `2^{L−j+e}·2^{−8j}`, and `2^{45}·2^{L−j+e−8j} = 2^L·2^{45−9j+e}` with `45 − 9j ≥ 0`; the tail carries `2^{45}·2^{L−2} = 2^L·2^{43}`
and `2^{45}·2^L`. Therefore
`2^45·120·L1!·K1!·S_5 = 2^L·N0!·Poly(u)`, `L = 16u+570`, with
`Poly(u) = Σ_{j≤5} (120/j!)Π_{q<j}(3u+107−q)·2^{45−9j}·Σ_i C(8j,i)[F(n_{ij}, L−j) − 2F(n_{ij}, L−j+1)] + 120·2^{43}F(8m, L−2) − 120·2^{45}F(8m, L)`,
`F(n,k)` the 46-factor product. This is an exact polynomial identity in `u` (term by term). `Poly` is a signed sum, so positivity is carried by
its coefficients: **all 51 coefficients (degree 50) are positive** (instrument below), hence `Poly(u) > 0` for `u ≥ 0`, and since
`2^45·120·L1!·K1! > 0` and `2^L·N0! > 0`, **`S_5 > 0` on the class**. With (BD) for `6 ≤ j ≤ m` (carried C1-LA3 entry 21) and U1's difference
identity (valid because `m ≤ L`), `i_{p*−2} − i_{p*−1} = S_5 + Σ_{j≥6}C(m,j)g_j > 0`. No Darroch, no Newton, no `M_0` beyond the endpoint.

*Relation to SR-4's `N_5`.* SR-4 writes `S_5/R = N_5(t)/D_5(t)` with `R = 2^L C(B,L)`, `B = 8m+1 = N0 + 40`,
`D_5 = Π_{q=0}^{39}(B−q)·(L+1)·Π_{q=1}^{5}(B−L+q)`. Since `B! = N0!·Π_{q=0}^{39}(B−q)`, `L1! = (L+1)·L!` and `K1! = (B−L)!·Π_{q=1}^{5}(B−L+q)`,
the normalization above gives `S_5/R = Poly(t−35)/(2^45·120·D_5(t))`. So `N_5 ∝ Poly(t − 35)`; an integer shift preserves the content, so the
primitive forms coincide.

*Where the hypotheses enter.* `m % 3 = 2` and `107 ≤ m`: the existence of `u` with `m = 3u+107` (so `(16m+4)/3 − 2 = 16u+570` exactly), the
certificate's endpoint `u = 0`, and C1-LA3 entry 21 (hypotheses `107 ≤ m`, `m % 3 = 2`, gap `2j − 8` through `3p* = 16m+4`). `m ≤ L`
(U1's `cb8_coeff_diff`) holds for every `m ≥ 1` in the class since `L − m = (13m−2)/3`.

*ℕ-subtractions audited (all non-truncating on the class).* `(16m+4)/3 − 1`, `− 2` (`p* ≥ 572`); `(16m+4)/3 − 2 − j` for `j ≤ 5` and, in
(BD), for `j ≤ m` (`≥ L − m ≥ 1`); `8·(m − j) + 1` (`j ≤ m`); `L − j` in `cb8_coeff_diff` (`j ≤ m ≤ L`); `3u+107 − j` (`j ≤ 5`) in the
generator's `choose_small` instances; `16u+570 − j` rewrites. The per-binomial Lean lemmas take their ranges as additive equalities
(`n = N0 + α`, `n = k + d`, `L1 = k + β`, `K1 = d + γ`, discharged by `omega`), so no subtraction occurs there. All coefficient differences are
in ℤ (`ℤ[X]` coefficients); the ℕ closed form has no subtraction.

### SR-C2-4a by instrument (`sr_c24_poly.py`; output `sr_c24_poly_out.json`)

- **Two different term sets, one polynomial.** Set A = the 254 terms above (`(1+x)^{8j} = 2^{−8j}Σ C(8j,i)(1+2x)^i`); set B = my own Cauchy
  expansion `[x^l](1+x)^a(1+2x)^M = Σ_s C(a,s)2^{l−s}C(M, l−s)` (binomials `C(M, l−s)`, a different set, also 254 terms). The code asserts for
  every term `n ≥ N0`, `k ≤ L1`, `n − k ≤ K1`, and exactly 46 factors. **Poly from set A = Poly from set B** (exact).
- **Poly(u):** degree **50**, **51 coefficients, all positive**, 69 to 147 digits. JSON of the decimal-string list:
  SHA-256 **`f75d2f198decd410a274f7630a04f14d85709251454405330120a8d265ae4bac`** = the synthesis's recorded `Poly(u)` digest (`f75d2f19…`) =
  the file digest of `crit_u1t_Poly_u.json`. JSON of the integer list: `0f86088c…b2d1` (equals C-U1-T's recorded `Poly_sha256`).
- **Against `S_5` computed with no binomial formula and no normalization** (full polynomial multiplication of `(1+x)^{8j}` and `(1+2x)^M`):
  `2^45·120·L1!·K1!·S_5 = 2^L·N0!·Poly(u)` holds exactly at `m = 107, 110, 113, 116, 122, 134`, with `S_5 > 0` at each.
- **Per-binomial identity** checked exactly (factorials) for all 254 terms at `t = 35` and `t = 39`: all hold.
- **SR-4 normalization:** `S_5/(C(B,L)2^L) = Poly_5(t)/(2^45·120·D_5(t))` exactly at `t = 35, 36, 40`.
- **SR-4's digest:** primitive integer form of `Poly_5(t)` (content `26388279066624 = 3·2^43`, leading coefficient positive, JSON integer
  list): **`893a21b6fdd0f7c2ac7e151db10873351c164c949ee12582812fc3452db651f7`** = SR-4's `893a21b6…51f7`. Hence **`Poly(u) = 3·2^43·N_5(35+u)`**
  with `N_5` SR-4's primitive numerator; the stated normalization is exact.

### SR-C2-4a against the frozen Lean text (`sr_c24_leanparse.py`, reading only; output `sr_c24_leanparse_out.json`)

- All **254** per-binomial lemmas `bc…` of `CriticS5.lean` parsed; the multiset of `(n, k)` equals the 254 terms above; **each stated
  46-factor polynomial equals my own product** (0 mismatches); least factor constant 252.
- The polynomial in `cb8S5_scaled` (`2^45 * 120 * (16u+571)! * (8u+292)! * cb8S5 (3u+107) = 2^(16u+570) * (24u+817)! * Poly`) and in
  `cb8Poly_pos` (closed by `positivity` over `u : ℕ`) **equals my `Poly(u)`**.
- `cb8S5_pos (m) (hm : 107 ≤ m) (hmod : m % 3 = 2) : 0 < cb8S5 m` and `cb8_elig_top_a … : (cb8I m).coeff ((16m+4)/3 − 1) < (cb8I m).coeff
  ((16m+4)/3 − 2)` are stated as the synthesis says.
- No `sorry`, `admit`, `decide`, `native_decide` or `axiom` token in code (the one `sorry` string is the docstring "sorry-free"). Options:
  `exponentiation.threshold 2000`, `maxHeartbeats 0` ×21, `maxRecDepth 20000` — as recorded on the synthesis face. I did not run Lean
  (forbidden to this read); kernel acceptance rests on the adjudicator's replays and awaits the governed award.

### SR-C2-4b by hand

Split at `r` (vertex 0). If `r ∉ B`: `T − r` is the disjoint union of the edge `s–v` (labels 1–2; polynomial `1+2x`) and the `m` gadgets
`{u_i} ∪ {b_ij, c_ij : j < 8}` (labels `3+17i .. 3+17i+16`), with no edge between different parts (every edge of `cbEdge` is `r–s`, `s–v`, `r–u_i`,
`u_i–b_ij` or `b_ij–c_ij`). A gadget splits at `u_i`: without `u_i`, eight disjoint edges `b–c` (`(1+2x)^8`); with `u_i`, the supports are
excluded and the eight private leaves are free (`x(1+x)^8`); so the gadget is `G = (1+2x)^8 + x(1+x)^8` (the contract's `G`, not the
allocation's swapped form). If `r ∈ B`: `N[r] = {r, s, u_0..u_{m−1}}` is removed, leaving `v` isolated (`1+x`) and the `8m` edges `b–c`
(`(1+2x)^{8m}`). Hence `I(CB(8,m)) = (1+2x)G^m + x(1+x)(1+2x)^{8m}` for every `m`. Over ℕ[X] nothing is subtracted.

*The Lean encoding (read, statement by statement).* `critU3T_indepPoly G D := Σ_{k ≤ |V|} monomial k (indepSetCount G D k)` over ℕ; its
`k`-th coefficient is `indepSetCount G D k` for **every** `k` (zero above `|V|` because `powersetCard k` of a set of size `≤ |V|` is empty).
Node 0 (U3, `indepSetCount_succ_split`) is the literal vertex split for any `x ∉ D`, with the closed neighbourhood `insert x (D ∪ N(x))`; C-U3-T
turns it into `I(G−D) = I(G−D−x) + X·I(G−D−N[x])`. The `m`-ary product `critU3T_indepPoly_eq_prod` takes pairwise-disjoint parts with no
cross edges covering exactly the survivors. The parts `critU3T_cbPart m 0 = {1,2}` and `critU3T_cbPart m (i+1) = [3+17i, 3+17i+17)` for
`i < m` are exactly C1-LA2's frozen branches (entry 23 labelling). `critU3T_cb_indepPoly_closedForm` then states
`critU3T_indepPoly (cbGraph m) ∅ = (1+2X)·((1+2X)^8 + X(1+X)^8)^m + X·((1+X)(1+2X)^{8m})` and `critU3T_cb_indepSetCount_eq_coeff` states
`indepSetCount (cbGraph m) ∅ k = (that ℕ polynomial).coeff k`. The adjudicator's `cb8I_eq_map` is the image of the ℕ form under the ring
hom `Nat.castRingHom ℤ` (which fixes `X`, `1`, `2`), equal to U1's `cb8I m = (1+2X)(X(1+X)^8 + (1+2X)^8)^m + X(1+X)(1+2X)^{8m}` by
commutativity and associativity only; `coeff_map` gives `(cb8I m).coeff k = ((ℕ form).coeff k : ℤ)`, and the cast ℕ → ℤ is injective and
order-preserving, so the ℤ inequality `cb8_elig_top_a` transfers to the ℕ counts (`exact_mod_cast`). `crossingIndex` (C1-LA2 entry 22) is
`Nat.find` of `forwardDifferenceDel G ∅ k < 0`, computed in ℤ after casting; `critU3T_cb_crossingIndex_le_of_coeff` is `Nat.find_le` at
`q = p* − 2`, so the first descent is at most `p* − 2`.

### SR-C2-4b by instrument (`sr_c24_tree.py`; output `sr_c24_tree_out.json`)

- C1-LA2's `cbEdge` predicate transcribed literally and symmetrised as `SimpleGraph.fromRel` does; its edge set equals the formula edge set
  for `m = 1..9`.
- Literal `CB(8,1)` (`n = 20`): brute force over all `2^20` subsets = rooted-tree DP = closed form
  (`1, 20, 171, 844, 2688, 5782, 8484, 8332, 5184, 1809, 258`).
- Components of `T − r` and `T − N[r]` computed from the literal predicate at `m = 1, 2, 5, 9`: exactly `{1,2}` plus the `m` blocks
  `[3+17i, 3+17i+17)`, and `{2}` plus the `8m` pairs `{b_ij, c_ij}`; `N(r) = {s} ∪ {u_i}`.
- Generic rooted-tree DP = closed form, coefficient for coefficient, at `m = 1..12, 95, 107, 110, 122`. Fixed points reproduced:
  `CB(8,107)`: `n = 1822, α = 964, x = 570`; `CB(8,95)`: `n = 1618, α = 856, x = 506`.
- At `m = 107` from the literal DP: `i_L − i_{L+1} = S_5 + Σ_{j=6}^{m}C(m,j)g_j` exactly, `S_5 > 0`, every `g_j > 0` for `j ≥ 6`.
- Companion (X-3, not a verdict item here): `I(T − v) = (1+x)G^m + x(1+2x)^{8m}` by the same split (`s` isolated when `r ∉ B`), and the DP
  agrees at `m = 1, 2, 5, 107`.

### SR-C2-4c by instrument (`sr_c24_poly.py`, `sr_c24_tree.py`)

- **`N_5` shift.** Taylor shifts of the primitive `N_5` for every integer `s ∈ [−40, 40]`: all coefficients of `N_5(s+u)` are positive
  **exactly for `s = 33..40`**; minimal all-positive shift **33**; shift **35** all-positive. At `s = 32` only the constant term fails
  (`N_5(32) < 0`). Sign of `N_5(t)`: `0` at `t = 0`, negative at `t = 1..32`, positive at `t = 33..40`; the root in `(32, 33)` is
  `≈ 32.148493`. No integer shift `s ≤ 32` can be all-positive, since that would force `N_5(32) > 0`. Since `D_5(t) > 0` for `t ≥ 1`,
  `S_5 > 0` at every `m = 3t+2` with `t ≥ 33` (`m ≥ 101`; off-class below 107).
- **`S_4`.** Same normalization with `J = 4`: `N0 = 8m − 31`, `L1 = L+1`, `K1 = 8m + 5 − L`, 37 factors per term (172 terms), and
  `2^36·4!·L1!·K1!·S_4 = 2^L·N0!·N_4(t)`. Sets A and B agree; the identity holds exactly against the directly computed `S_4` at `m = 107, 137`.
  `N_4` has degree **40**; its primitive digest **`ed0101b2c3175fa820d1e600042fd7331867c604972393ee8f4cc2b880fcc68d`** equals C-F2-T's recorded
  `ed0101b2…c68d`; **all 41 coefficients of `N_4(45+w)` are positive**, and 45 is its minimal all-positive shift (`N_4(44) < 0`). Sign of `N_4`
  at `t = 35..46`: `−` ×10 (`t = 35..44`), then `+`. So **`S_4 > 0` for every class `m ≥ 137`** and `S_4 < 0` at every class row `m = 107..134`.
- **Pool minimality from 107.** Exact signs of `S_J` (`J = 0..5`) at every class row `107..140`: `−−−−−+` for `m = 107..134`, `−−−−++` for
  `137, 140`. At `m = 107`: `g_0, g_1, g_2 < 0`, `g_3, g_4, g_5 > 0`, `τ < 0`. So `J = 5` is the smallest pool that certifies from `m = 107`.
- **`τ` (X-12 companion; not in G-6).** `τ < 0 ⟺ C(8m, L−2) < 4C(8m, L) ⟺ 4(N−L+2)(N−L+1) > L(L−1)` with `N − L = (8m+2)/3`; the difference
  of the two sides times 9 is `528m + 150 > 0`, so `τ < 0` for every `m ≡ 2 (mod 3)`, `m ≥ 2` (by hand; bounded check to `m = 500` agrees).
- **Eligibility rows** (literal-tree DP, `x` through `α`, zero-extended): for every `m ≡ 2 (mod 3)` with `2 ≤ m ≤ 83`, `p*` is **not**
  eligible: `x = p*` for `m ≤ 20` and `x = p* − 1` for `23 ≤ m ≤ 83` (e.g. `m = 2`: `x = p* = 12`; `m = 83`: `x = 443 = p* − 1`), and
  `i_{p*−1} < i_{p*−2}` fails there. For `m = 86, 89, …, 104` (and 107, 110) `p*` is eligible with `x = p* − 2` (`m = 86`: `p* = 460`, `x = 458`,
  `α = 775`). `α = 9m+1` and `3p* < 2α+1` hold at every row.

## Findings and repairs

**F-1 (SR-C2-4a): confirmed.** The statement is exact as briefed. The 254 terms, the three range conditions, the 46-factor normalization
with every factor positive for `u ≥ 0`, the scaled identity `2^45·120·L1!·K1!·S_5 = 2^(16u+570)·N0!·Poly(u)`, and `Poly` of degree 50 with 51
positive coefficients are re-derived by hand and reproduced by two independent term expansions, checked against `S_5` computed with no
binomial formula, and matched to the digests of record (`f75d2f19…` for `Poly(u)`; `893a21b6…51f7` for SR-4's `N_5`, with
`Poly(u) = 3·2^43·N_5(35+u)`). The frozen Lean text states exactly these objects (254/254 lemma statements match my own factor products).
Hypotheses, endpoint (`u = 0`), residue class and ℕ-subtractions are as audited above. The grade stays `computer_assisted` (one fixed
positivity check of 51 coefficients; every other step is hand-checkable), which is the ELIG key's registered grade; the formal grade moves only
when C2-LA1 closes (G-1). Two literal notes, neither affecting any statement: "254 binomials" counts terms (167 distinct binomials); C-U1-T's
prose "69 to 146 digits" should read 69 to 147 (its own output file records 147).

**F-2 (SR-C2-4b): confirmed.** The closed form is re-derived by hand from the literal edge relation, the branches are exactly C1-LA2's frozen
labelling, and the Lean statements say what the synthesis says: count = coefficient at every `k`, the `m`-ary product over pairwise-disjoint,
edge-separated parts covering the survivors of `T − r`, the `N[r]` branch `(1+X)(1+2X)^{8m}`, and the ring-hom cast to `ℤ[X]` with no
subtraction anywhere in ℕ. The contract's (non-swapped) `G` is the one encoded (CF-C2-G). Grade: the identity is `proved_informal` (elementary);
its Lean form is compiled scratch with no grade until C2-LA1 closes. It formalizes the r30 closed-form node; it is not a new identity.

**F-3 (SR-C2-4c): confirmed, with repairs to the scope-note wording.** Every fact reproduces on my own instruments. Repairs for the text of G-6:
- (a) The minimal shift is a property of **SR-4's `N_5`** (digest-identified), not of F2's `N_total`; C-F2-T and C-F2-U already transferred it,
  and the note must name the object by its digest.
- (b) "Degree 40" and "shift 45" are properties of `N_4` in a named normalization; the note names it and its digest.
- (c) "The class bound is load-bearing" (synthesis `## Exact established results`, scope-note bullet) is imprecise. Exact content: **some**
  lower bound on `m` is necessary, because the statement fails at every residue-2 `m ≤ 83`; the endpoint 107 is **not** sharp for the statement
  (it holds at the bounded rows 86..104), and the `S_5` certificate alone reaches down to `t = 33` (`m = 101`). The key's own scope sentence,
  "`m ≥ 107` (only through the certificate endpoint `t ≥ 35` …)", stays true of the informal proof; in the formal route `107 ≤ m` also enters
  through C1-LA3 entry 21's hypotheses.
- (d) Attribution: the eligibility rows (`m ≤ 83` fail; 86..104 hold) were first recorded by **SR-4** (Cycle 1, bounded observations) and the
  `S_4` window at `t = 35..44` is on SR-4's face; C-F1-T, C-F2-T, C-F2-U and the F adjudicator carry the Cycle 2 findings.
- (e) Grades split as the synthesis says: the shift and `S_4 > 0` facts are `computer_assisted` (fixed polynomial checks); the finite sign
  tables and eligibility rows are `bounded_computation`.

**F-4 (key and alias check).** The only key touched is the existing
`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`.
It is a predicate that the statement satisfies (`i_{k+1} < i_k` at `k = (16m−2)/3 = p* − 2`, and `p*` eligible, on the named class). Exact hit
in the run-local snapshot only (itself, `VERIFIED`, `computer_assisted`); absent from the frozen master and the concurrent master-494 (expected:
it is run-local); 0 alias-string hits and 0 `alias_patterns` hits in all three registries. Lexical neighbours in the masters are the r30 row
key `E993-R30-CB-8-M-95-TO-107-…` (distinguished by SR-4-DR3) and other families' `…ELIGIBLE…` keys; distinction rows SR-4-DR1..DR8 already
exist. No new key is proposed, so no new distinction row is needed. The two RECORD rows below use no key name as a claim.

**F-5 (precondition of G-1).** SR-C2-4 is concordant on both informal inputs of C2-LA1 (F-1, F-2): the synthesis's precondition "SR-C2-4
concordant" for G-1 is met. G-1's grade move still waits on C2-LA1's close. Attribution note for G-1: its face lists U1, C-U1-T, U3, C-U3-T, the U
adjudicator, SR-4, C1-LA2 and C1-LA3; the key's registered attribution (r30 T1 for the closed forms and `α`; Codex GPT-6 for the CB family and
transport context; the first-interior definition layer for `crossingIndex`) must be kept on the face (fence 9), not replaced.

**F-6 (fences).** One rank per tree; the class only; Darroch/Newton used nowhere (the normalization is exact integer algebra and the
positivity is a coefficient check); no real-rootedness of `I`, `G`, `G^m` or any forest polynomial; no asymptotics; census rows are never
evidence; no sealed member edited; nothing here touches favorability, E1, (HALL), the aggregates, TREE, FOREST, TRANSFER, governed beta or
Erdős #993, which stay as registered (the global problem stays OPEN). No struck item is used as evidence.

## Registration text

Register the scope note on the existing ELIG key; file the two records as ledger rows (they are C2-LA1's confirmed informal inputs and the
G-1 precondition; they register no key and move no grade).

```text
SCOPE NOTE ON: E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE
TEXT: [r31 C2; SR-C2-4] Certificate facts and off-class rows. This key's statement, grade (computer_assisted), proof and fences are unchanged, and nothing below is a new input to its proof. (i) computer_assisted: N_5, the degree-50 numerator of proof step (3) in SR-4's normalization S_5/(2^L C(8m+1, L)) = N_5(t)/D_5(t) (m = 3t + 2; primitive integer form, SHA-256 of its JSON coefficient list 893a21b6fdd0f7c2ac7e151db10873351c164c949ee12582812fc3452db651f7), has minimal all-positive integer Taylor shift t = 33: all 51 coefficients of N_5(33 + u) are positive, and N_5(32) < 0, so no integer shift at most 32 is all-positive. The shift t = 35 used by this key (the class endpoint m = 107) is also all-positive. Off-class consequence: S_5 > 0 at every m = 3t + 2 with t ≥ 33 (m ≥ 101). bounded_computation: N_5(t) < 0 at t = 1..32, and its real root in (32, 33) is near 32.1485. (ii) The pool j ≤ 5 is the smallest that certifies from m = 107. bounded_computation (exact): S_J < 0 at m = 107 for every J ≤ 4, and S_4 < 0 at every class row m = 107, 110, …, 134. computer_assisted: S_4 > 0 for every class m ≥ 137. In the normalization 2^36·4!·(L+1)!·(8m + 5 − L)!·S_4 = 2^L·(8m − 31)!·N_4(t), N_4 has degree 40 (primitive digest ed0101b2c3175fa820d1e600042fd7331867c604972393ee8f4cc2b880fcc68d); all 41 coefficients of N_4(45 + w) are positive, and N_4(44) < 0. (iii) bounded_computation, from literal-tree dynamic programs with x computed through α: for every m ≡ 2 (mod 3) with 2 ≤ m ≤ 83, the rank p* = (16m+4)/3 is not eligible and i_{p*−1} < i_{p*−2} fails (x = p* for m ≤ 20, x = p* − 1 for 23 ≤ m ≤ 83). For m = 86, 89, …, 104, p* is eligible with x = p* − 2. So some lower bound on m is necessary for this key's statement. The class endpoint 107 is not sharp for its truth (bounded rows 86..104); it is the r31 class endpoint, used by the certificate at t ≥ 35 and, in the formal route, by the carried block-descent theorem's hypotheses. Every row here is off-class and asserts nothing below 107. Attribution: (i) and (ii) C-F2-T and C-F2-U (Claude Opus 5.5; r31 Cycle 2 critics), confirmed by the r31 F adjudicator (Claude Opus 5.5); the S_4 window at t = 35..44 was already on SR-4's face. (iii) SR-4 (bounded observations, r31 Cycle 1), C-F1-T (r31 Cycle 2 critic) and the r31 F adjudicator. All of it was re-derived by isolated second read SR-C2-4 (Claude Opus 5.5) with its own instruments. The certificate method is SR-4's. The closed form and α are r30's (T1, r30 Cycle 6). The CB family and transport context are Codex's (GPT-6, the lower-region run). One rank per tree and the class only. Census rows are never evidence. No status transfers to or from any key.
```

```text
RECORD: SR-C2-4-R1
CLAIM: C2-LA1 informal input (i), the factorial normalization of the pooled S_5 (node (2) of the proof of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE), confirmed. Let m = 3t + 2 and t = 35 + u with u ≥ 0 (the class m ≥ 107, m ≡ 2 (mod 3)). Put L = (16m+4)/3 − 2 = 16u + 570, N0 = 8m − 39 = 24u + 817, L1 = L + 1 = 16u + 571 and K1 = 8m − L + 6 = 8u + 292. Define S_5 = Σ_{j=0}^{5} C(m,j)([x^{L−j}]P_j − [x^{L−j+1}]P_j) + τ, with P_j = (1+x)^{8j}(1+2x)^{8(m−j)+1} and τ = [x^L] − [x^{L+1}] of x(1+x)(1+2x)^{8m} = 2^{L−2}C(8m, L−2) − 2^L C(8m, L). Since 2^{8j}(1+x)^{8j} = Σ_i C(8j,i)(1+2x)^i, S_5 is a signed combination of exactly 254 binomial terms: C(8(m−j)+1+i, L−j+e) for 0 ≤ j ≤ 5, 0 ≤ i ≤ 8j and e ∈ {0,1}, together with C(8m, L−2) and C(8m, L). These are 167 distinct binomials. Each term has N0 ≤ n, k ≤ L1 and n − k ≤ K1, so C(n,k)·L1!·K1! = N0!·Π_{q=N0+1}^{n} q·Π_{q=k+1}^{L1} q·Π_{q=n−k+1}^{K1} q. That product has exactly 46 linear factors 24u+c, 16u+c, 8u+c with c ≥ 252, and every factor is positive for u ≥ 0. With 120·C(m,j) = (120/j!)·Π_{q<j}(3u+107−q) and every power of 2 at least 2^{L−45}, it follows that 2^45·120·L1!·K1!·S_5 = 2^{16u+570}·N0!·Poly(u) exactly. Here Poly ∈ ℤ[u] has degree 50, and its 51 coefficients are all positive (69 to 147 digits). Hence S_5 > 0 on the class. Poly(u) = 3·2^43·N_5(35+u), where N_5 is SR-4's numerator in primitive integer form. No ℕ-subtraction truncates on the class. Newton and Darroch are not used.
STATUS: computer_assisted
PROVENANCE: Method and Lean scratch: C-U1-T (Claude Opus 5.5, r31 Cycle 2 critic; CriticS5.lean 300b6bd8…8745, generator gen_lean_s5.py 53d4731b…, Poly(u) file f75d2f198decd410a274f7630a04f14d85709251454405330120a8d265ae4bac). The S_5 object (cb8S5), the block and difference identities and the conditional composition: U1 (Claude Sonnet 5, seat C2-U-01). The certificate method of record: SR-4. An independent symbolic N_5 (digest-concordant): C-U1-F. Kernel replay: the r31 U adjudicator (P1). Re-derived by isolated second read SR-C2-4 with its own instruments: two independent term expansions agree exactly; the identity was checked against S_5 computed with no binomial formula at m = 107, 110, 113, 116, 122 and 134; each of the 254 Lean lemma statements equals the reader's own 46-factor product; the N_5 primitive digest is 893a21b6fdd0f7c2ac7e151db10873351c164c949ee12582812fc3452db651f7. The formal grade moves only when award C2-LA1 closes (registration G-1). This record is not a key.
```

```text
RECORD: SR-C2-4-R2
CLAIM: C2-LA1 informal input (ii), the ℕ closed-form encoding of I(cbGraph m), confirmed. For every m : ℕ, with cbGraph m the C1-LA2 tree of record on Fin (17m+3) (labels 0 = r, 1 = s, 2 = v, u_i = 3+17i, b_ij = u_i+1+2j and c_ij = u_i+2+2j for i < m, j < 8), Σ_k C5LA1.indepSetCount (cbGraph m) ∅ k · X^k = (1+2X)·((1+2X)^8 + X(1+X)^8)^m + X·((1+X)(1+2X)^{8m}) in ℕ[X]. The coefficient of X^k equals the literal count for every k, and both are zero above 17m + 3. Proof: split at r. Without r, the survivors form the edge {s, v} and the m gadgets [3+17i, 3+17i+17), which are pairwise disjoint with no edge between them. The edge gives 1 + 2X. Splitting a gadget at u_i gives (1+2X)^8 + X(1+X)^8 = G, the contract's G. With r, removing N[r] = {r, s, u_0, …, u_{m−1}} leaves v and 8m disjoint edges b_ij–c_ij, giving (1+X)(1+2X)^{8m}. There is no subtraction over ℕ. Cast bridge: the image of this ℕ polynomial under Nat.castRingHom ℤ equals cb8I m = (1+2X)G^m + X(1+X)(1+2X)^{8m} in ℤ[X], so (cb8I m).coeff k = (indepSetCount (cbGraph m) ∅ k : ℤ) for every k. It formalizes the r30 closed-form node and is not a new identity.
STATUS: proved_informal
PROVENANCE: Vertex split (Node 0): U3 (seat C2-U-03). Convolution, the m-ary product, the closed form and count = coefficient: C-U3-T (Claude Opus 5.5, r31 Cycle 2 critic; CriticU3T.lean, CriticU3T2.lean). Cast bridge and composition: the r31 U adjudicator (AdjCompose.lean, P2/P4 replays). Labelling and cbGraph: C1-LA2 (r31 Cycle 1 formalizer; entries 23–24). Closed forms: r30 (T1, r30 Cycle 6). CB family: Codex (GPT-6, the lower-region run). Re-derived by isolated second read SR-C2-4. The branch structure was computed from the literal cbEdge predicate at m = 1, 2, 5 and 9. On literal CB(8,1), brute force over all 2^20 subsets equals the tree DP and equals the closed form. The rooted-tree DP equals the closed form at m = 1..12, 95, 107, 110 and 122. The Lean statements were read against the carried definitions. The compiled scratch has no grade until C2-LA1 closes. This record is not a key.
```

## Verdicts

verdict[SR-C2-4a]: confirmed
verdict[SR-C2-4b]: confirmed
verdict[SR-C2-4c]: confirmed_with_repairs

Seal verified: `362777433736833657b9a825b8ee417db3188c4736be125fc18a826428d56c6c` (capsule `SR-C2-4-PACKET-MANIFEST.json`, 623/623 members).

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

Scratch root: `scratchpad/c2-sr-SR-C2-4/` (under the run root). Python 3 standard library only, exact integers/`Fraction`, `python3 -B`,
foreground; no seat or critic code executed.

| Path | SHA-256 | Role |
|---|---|---|
| `scratchpad/c2-sr-SR-C2-4/sr_c24_poly.py` | `56ae0751b74a6315e98974f2a01b295d262e5d2e22033fe65f5fcedf9c055816` | own normalization for pools J = 5, 4 by two term sets; direct `S_J`; SR-4 normalization; `N_5`, `N_4` digests; Taylor shifts; sign tables |
| `scratchpad/c2-sr-SR-C2-4/sr_c24_poly_out.json` | `78ee266b3fc5f4e2d6b088bdc8be241b3e385bd7710dde74428381ba3962067b` | its output (payload `ac946d70…74c0`; about 6 s) |
| `scratchpad/c2-sr-SR-C2-4/sr_PolyU.json` | `f75d2f198decd410a274f7630a04f14d85709251454405330120a8d265ae4bac` | own `Poly(u)` (decimal-string JSON list) |
| `scratchpad/c2-sr-SR-C2-4/sr_c24_tree.py` | `3cf813cfd3adecc951434384c12cbd7e87dc8032343369f43a64d685b184a069` | literal `cbEdge` transcription; brute force at m = 1; tree DP vs closed forms; branch components; eligibility rows `m ≡ 2 (mod 3)`, 2..110; difference identity at 107 |
| `scratchpad/c2-sr-SR-C2-4/sr_c24_tree_out.json` | `3202b631a65a939e585756f2e131b105092a6eeb02225d18431e5ef5b89c75b1` | its output (payload `6d858d7d…b784`; about 5 s) |
| `scratchpad/c2-sr-SR-C2-4/sr_c24_leanparse.py` | `7b41da2850747af02c861fb689773b8bcc1a7b1f133734c56174352bd4b1d375` | reads (never runs) `CriticS5.lean`; compares 254 lemma statements, `cb8S5_scaled`, `cb8Poly_pos` with own objects; token scan |
| `scratchpad/c2-sr-SR-C2-4/sr_c24_leanparse_out.json` | `f9226a5d2c604d967a62e94ae4c8e7211da84651f637f2e9c9dd8a6742c0912d` | its output |
| `second-reads/SR-C2-4/SECOND-READ.md` | (this file) | the deliverable |

Replay: from `scratchpad/c2-sr-SR-C2-4/`, `python3 -B sr_c24_poly.py > sr_c24_poly_out.json`, `python3 -B sr_c24_tree.py > sr_c24_tree_out.json`,
`python3 -B sr_c24_leanparse.py ../../sources/c2-stage7-sources/crit-U1-T/LeanProject/LeanProof/CriticS5.lean > sr_c24_leanparse_out.json`
(the last reads `sr_PolyU.json`, written by the first). Background jobs: none started, none running at the final write. This file was
reread before close.
