# Second Read

Isolated second read `SR-4`, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`), Cycle 1: parent descent and top-rank
eligibility, with the block signs. Written 2026-09-28 (clock 00:26 EDT).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. My first combined print failed on a zsh `=====` separator, so I
printed the startup protocol again on its own; the tool display truncated about 5 KB in the middle of `verity.md`. Subsystems
loaded: the constitution and the startup protocol only. I followed no other part of the startup map (memory, modules, skills,
logs, decisions, conversations), as the brief requires. The harness put the project `CLAUDE.md` and the user's auto-memory index
into my context without a fetch. I used neither, and I did no conversation logging: this read may write only this file and its
scratch.

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Protocol** `control/C1-SECOND-READ-PROTOCOL.md`: SHA-256 `cf04330bda4754d2238010497e57251fc0aec70003dd8d85847c5a56ccafc18c`.
  I recomputed it with `shasum -a 256` before reading the file. **MATCH.**
- **Brief** `control/C1-SECOND-READ-BRIEF-SR-4.md`: SHA-256 `c6f3753475fa0fa729a4c119416b657574ebe92b5e05f11dd0cb48f06de219a8`.
  Recomputed before reading. **MATCH.**
- **Capsule** `control/c1-second-read/SR-4-PACKET-MANIFEST.json`, stage `cycle-1-second-read-SR-4`, 575 files.
  - I recomputed the seal as the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`
    (`separators=(",", ":")`, no trailing newline). With `ensure_ascii` on and off, both give
    **`9016a163164eed0a204076542875b175739b0c4afd4dbfb708b4e0bd1ceccd70`**.
  - This equals the recorded `seal_sha256` and the value in my dispatch. **Seal: MATCH.**
  - For the record, the manifest file's own byte digest is `973eb2c2…40e41f`. That is not the seal.
  - **All 575 listed members** exist and match their SHA-256 (0 mismatches, 0 missing).
- **Frozen instruments** `sources/c1-stage7-sources/`. I checked every entry of that directory's `SOURCE-DIGESTS.json`
  (schema `verityos.r31.source-digests.v1`, 924 files, 40 seats) before reading any of them: 924/924 match.
  - The brief names 14 seat folders. The files I opened are C-T3-F's `uniform_cert_J5_n35.json` (read as data, for a
    concordance check only) and the text of `C-U3-T/LeanProject/Smoke/Critic.lean`.
  - I also read the `crossingIndex` definition text in `ADJ-U/lean/u1/LeanProject/LeanProof/AdjIntegration.lean`, which is a
    capsule member.
- **Registries.** The frozen run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c1-stage2.json` and the frozen master
  `sources/authority/CLAIM-IDENTITY.json` are byte-identical: SHA-256 `b4a339eff1e2cdc04ceedcdd55fdd53697574bf64ed7e26631c50d84d56e470b`,
  491 claims each.

**Read-boundary disclosures** (names only where a listing occurred):

1. **Non-member files hashed.** The digest check of `sources/c1-stage7-sources/SOURCE-DIGESTS.json` hashed all 924 files it lists.
   450 of them are not capsule members (other seats' folders). I hashed their bytes only and did not read or use their content.
2. **Two directory listings outside the capsule:**
   - a names-only `ls` of `control/c1-second-read/`, showing `PATH-CHECK-SR-{1,2,3,4,6}.json`, `SEALS.json` and
     `SR-{1,2,3,4,6}-PACKET-MANIFEST.json`;
   - a names-only `ls` of `second-reads/`, showing `SR-3` and `SR-4`.

   I opened none of the non-member files.
3. **Directory created:** I made `second-reads/SR-4/` (the output location) and `scratchpad/c1-sr-SR-4/`.
4. **Searches.**
   - I searched the capsule's `.md`/`.lean` members for `crossingIndex` and the `sources/r30/` members for certificate
     precedents, with Python over files listed in the manifest only.
   - I made no `find`/`grep`/`rg` rooted above the capsule members.
   - I made no Mathlib search.
5. **Environment.** No network, no installs, no `lake`/`lean`, no background jobs (every run was in the foreground), and no process
   killed.
6. **SR-2's brief is not a capsule member.** For the statement of the two-binomial tool (G), I used the synthesis's S4
   "generic mechanism" text, which is on a member's face.

## Statements read

Statement of record: `cycles/cycle-1/stage6/SYNTHESIS.md`. The items read were `## Exact established results` S5 and S6,
`## Registrations` R-4, the Row 5 composition, and `## Refuted or narrowed mechanisms`. The origins (all capsule members) were:
- T3's return;
- critiques C-T3-F, C-T3-U, C-F3-T, C-F3-U, C-U3-T and C-U3-F;
- the F3 and U3 returns;
- the T, F and U adjudications;
- controller facts CF6-1..7 (facts, never authority).

The four statements are:

- **SR-4a (the block identity).** `I(CB(8,m)) = (1+2x)G^m + x(1+x)(1+2x)^{8m} = Σ_{j=0}^{m} C(m,j) x^j P_j + x(1+x)(1+2x)^{8m}`, with
  `P_j = (1+x)^{8j}(1+2x)^{8(m−j)+1}`. Hence `i_{p*−2} − i_{p*−1} = Σ_j C(m,j) g_j + τ`, where
  `g_j = a_j(l_j) − a_j(l_j+1)`, `l_j = p*−2−j` and `τ` is the tail difference (T3 step 1).
- **SR-4b (S6, the block signs).** `P_j` ascends at `l_j` exactly for `j ∈ {0,1,2}` and descends for every `j ≥ 3`, and the tail
  ascends. The parts are argued as follows:
  - `j ≥ 5` by the two-binomial tool (G), whose gap is `2j − 8`;
  - `j ≤ 1` and the tail by the mirror step;
  - `j = 2, 3, 4` by fixed Taylor-shift certificates.

  Proposed grade: `computer_assisted`.
- **SR-4c (S5, (ELIG-top)(a) and (E)).** `i_{p*−1}(CB(8,m)) < i_{p*−2}(CB(8,m))` for every class `m`, Darroch- and Newton-free,
  with no `M_0`. The proof composes the pooled `S_5` certificate with the tool for `j ≥ 6`. (E) then follows.
  Proposed grade: `proved_informal`.
- **SR-4d (the registration).** Key `E993-R31-CB-8-TOP-RANK-PARENT-DESCENT-HOLDS-AND-TOP-RANK-IS-ELIGIBLE-ON-THE-RESIDUE-2-CLASS-FROM-107`,
  with grade `proved_informal` and S6 as a node.

Class throughout: `T = CB(8,m)`, `m ≥ 107`, `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`, `n = 17m+3`, `α = 9m+1`, `L := p* − 2 = (16m−2)/3`.

## Independent re-derivation

All instruments are my own and live under `scratchpad/c1-sr-SR-4/`. They use the Python standard library only, with exact
`int`/`Fraction` arithmetic, run with `python3 -B` in the foreground. No seat code is called.

**1. SR-4a by hand.**
- *Closed form.* Split on `r`.
  - If `r ∈ B`, then `s` and every `u_i` are excluded and `v` is free, giving a factor `(1+x)`. Each pendant pair `b_ij – c_ij` is
    empty, `b` or `c`, giving `(1+2x)`. Together: `x(1+x)(1+2x)^{8m}`.
  - If `r ∉ B`, the edge `s – v` gives `(1+2x)`. Each choke gives `(1+2x)^8` when `u_i ∉ B` and `x(1+x)^8` when `u_i ∈ B`
    (the supports are then excluded and the leaves are free), which is `G`.
  - Hence `I = (1+2x)G^m + x(1+x)(1+2x)^{8m}`.
- *Blocks.* The binomial theorem on `G^m = ((1+2x)^8 + x(1+x)^8)^m` gives the blocks.
- *Coefficient extraction.* This gives `i_k = Σ_j C(m,j) a_j(k−j) + t_k`, with `a_j(l) = [x^l]P_j` (zero outside `[0, 8m+1]`) and
  `t_k = 2^{k−1}C(8m,k−1) + 2^{k−2}C(8m,k−2)`.
- *The tail.* `τ = t_L − t_{L+1} = 2^{L−2}C(8m,L−2) − 2^L C(8m,L)`. The two middle terms cancel exactly.
- *Index range.* All differences are taken in ℤ. For every `0 ≤ j ≤ m`, `1 ≤ L−j` and `L−j+1 ≤ 8m+1`, because
  `L − m = (13m−2)/3 ≥ 1`.
- *`α`.* `α = deg I = 9m+1`. The leading term is `2x^{9m+1}` from `(1+2x)G^m`, since `G` has degree 9 with leading coefficient 1,
  and the tail has degree `8m+2`.

**2. SR-4a by instrument (`sr4_core.py`, `sr4a_identity.py`; output `sr4a_out_95_107_110_113.json` `1e4a5c59…d53f`).**
- *Tree construction.* The literal tree is built from the contract labelling: `0 = r`, `1 = s`, `2 = v`, `u_i = 3+17i`,
  `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`. The instrument asserts `n − 1` edges and connectivity, then runs a generic rooted in/out
  independence-polynomial DP with no closed form.
- *Validation.*
  - The DP equals brute-force subset enumeration on `CB(1,1)`, `CB(2,1)`, `CB(2,2)`, `CB(3,2)` and `CB(8,1)`.
  - The block sum equals the closed form as a polynomial for `m = 1..8`.
- **At `m = 110`** (the fresh row the brief names):
  - `n = 1873`, 1872 edges, and the tree is connected;
  - `α = 991 = 9m+1`, `x = 586` (computed through `α`), `p* = 588`;
  - tree DP = closed form = block sum, coefficient for coefficient;
  - the difference identity `i_L − i_{L+1} = Σ_j C(m,j)g_j + τ` holds exactly, with `g_j` from direct binomial convolutions;
  - `Δ = i_{586} − i_{587} > 0` (418 digits).
- **Also at 95, 107 and 113.** The §5 fixed points reproduce from the tree: `CB(8,95)`: `n = 1618`, `α = 856`, `x = 506`;
  `CB(8,107)`: `n = 1822`, `α = 964`, `x = 570`. The identity holds at every row.

**3. SR-4b, the tool (G), my own proof.** Let `r(k) = [y^k](1+y)^a(1+2y)^b`, with `a, b ≥ 0` and `a+b ≥ 1`.
- **(R)** From `f′/f = a/(1+y) + 2b/(1+2y)`, we get `(1+y)(1+2y)f′ = ((a+2b) + (2a+2b)y)f`. Comparing `[y^k]`:
  `(k+1)r(k+1) = (a+2b−3k)r(k) + 2(a+b−k+1)r(k−1)`.
- **(LC)** `r > 0` on `[0,a+b]` and `r` is log-concave. The proof is by induction on linear factors:
  `z_k = x_k + c·x_{k−1}` with `c > 0` gives `z_k² − z_{k−1}z_{k+1} = LC_k + c²·LC_{k−1} + c(x_k x_{k−1} − x_{k−2}x_{k+1})`. The
  last bracket is `≥ 0` by the monotone ratio chain of a positive log-concave sequence without internal zeros, and it is trivially
  `≥ 0` at the support ends. No Newton, no Darroch.
- **Closing step.** Let `1 ≤ t ≤ a+b`, and suppose `r(t+1) ≥ r(t)`.
  - Then `r(t)² ≥ r(t−1)r(t+1) ≥ r(t−1)r(t)` with `r(t) > 0`, so `r(t) ≥ r(t−1)`.
  - Since `2(a+b−t+1) ≥ 0`, (R) gives `(t+1)r(t) ≤ (t+1)r(t+1) ≤ (3a+4b−5t+2)r(t)`, so `6t ≤ 3a+4b+1`.
  - Hence **`6t ≥ 3a+4b+2 ⇒ r(t+1) < r(t)`**.
- **Mirror step.** Let `0 ≤ t` with `t+1 ≤ a+b`, and suppose `r(t+1) ≤ r(t)`.
  - LC gives `r(t+2) ≤ r(t+1)`.
  - (R) at `k = t+1` gives `(t+2)r(t+1) ≥ (3a+4b−5t−3)r(t+1)`, so `6t ≥ 3a+4b−5`.
  - Hence **`6t ≤ 3a+4b−6 ⇒ r(t+1) > r(t)`**.
- **Gap at the target.** `a = 8j`, `b = 8(m−j)+1`, `t = L−j`. With `3p* = 16m+4`: `6t = 32m−4−6j` and `3a+4b = 32m−8j+4`, so
  **`6t − (3a+4b) = 2j − 8`**. The value `2j − 8` is correct.
  - The block descends for `j ≥ 5` (gap `≥ 2`).
  - It ascends for `j ≤ 1` (gaps `−8` and `−6`).
  - The tail `a = 1`, `b = 8m`, `t = L−1` has gap `6(L−1) − (3 + 32m) = −13`, so it ascends.
  - The residue class enters only through `3p* = 16m+4`.
- **Corroboration** (`sr4_tool.py`, `sr4_tool_out.json` `71026a13…71c2e5`). On the full grid `0 ≤ a, b ≤ 40`, the checks give:
  - (R): 0 failures at every `k`;
  - positivity and (LC): 0 failures;
  - (G): 28,447 instances, 0 failures;
  - the mirror step: 38,533 instances, 0 failures.

  At `m = 110` the side conditions and the gap `2j − 8` hold for every `j`.

**4. SR-4b/4c, my own certificate construction (`sr4_cert.py`; output `sr4_cert_out.json` `cf206837…55f1f0`).**
- **Setup.** Put `m = 3t+2`, so that `t ≥ 35 ⟺ m ≥ 107` in the class. Then `B = 8m+1 = 24t+17`, `L = 16t+10`,
  `M = B−L = 8t+7` and `R = C(B,L)2^L > 0`.
- **Terms.** Every term `C(B−a, L−c)2^{L−c}` equals `R·2^{−c}·ff(L,c)·[M!/(M−a+c)!]/ff(B,a)`, where `ff(L,−1) = 1/(L+1)`.
  - The block terms have `a = 8j`, `c = j+i−e`, with sign `(−1)^e`, `0 ≤ i ≤ 8j`, `e ∈ {0,1}`.
  - The tail has `(a,c) = (1,2)` with sign `+` and `(1,0)` with sign `−`.
- **Common denominator.** Every piece is placed over one common denominator
  `D_5(t) = Π_{q=0}^{39}(24t+17−q)·(16t+11)·Π_{q=1}^{5}(8t+7+q)`, of degree 46. Every factor has a positive leading coefficient and is
  positive at `t = 35`.
- **Range conditions.** Over all terms of `j ≤ 5`, `L−c ≥ 525` and `M−a+c ≥ 246` at `t = 35`.
- **Guard against coding slips.** The identity `N(t)/D_5(t) = piece/R` was checked exactly against direct binomial sums at 99
  integers, `t = 4..100` plus 200 and 333, for every piece.
  - Each true piece·`D_5`/`R` is a polynomial of degree `≤ 51` for `t ≥ 4`.
  - So agreement at more than 52 points pins each constructed numerator to the true one, independent of how the code built it.
- **Positivity tests.** Two independent tests were run:
  - (i) a Taylor shift `t = 35 + u` with a uniform-sign test on the coefficients;
  - (ii) Sturm's theorem, counting distinct real roots in `(35, ∞)`, together with the sign at `t = 35`.

| Piece (normalized by `R`) | deg | coefficients of `N(35+u)` | Sturm roots in `(35,∞)` | Sign for all `t ≥ 35` | Reading |
|---|---|---|---|---|---|
| tail `τ` | 45 | 46, all `<0` | — | `−` | ascends |
| `g_0` | 45 | 46, all `<0` | — | `−` | ascends |
| `g_1` | 45 | 46, all `<0` | — | `−` | ascends |
| `g_2` | 45 | 46, all `<0` | 0 | `−` | ascends |
| `g_3` | 44 (the leading term cancels) | 45, all `>0` | 0 | `+` | descends |
| `g_4` | 45 | 46, all `>0` | 0 | `+` | descends |
| `g_5` | 45 | 46, all `>0` | — | `+` | descends |
| `S_3 = Σ_{j≤3}C(m,j)g_j + τ` | 47 | 48, all `<0` | — | `−` | pool too small |
| `S_4` | 49 | 50, **mixed** | — | `<0` at `t = 35..44` | pool too small |
| **`S_5 = Σ_{j≤5}C(m,j)g_j + τ`** | **50** | **51, all `>0`** (smallest 56 digits, primitive integer form) | **0** | **`+`** | **certificate** |

- **Digests.** The `N_5` primitive integer coefficients have SHA-256 `893a21b6…51f7`, and the shifted coefficients have
  `b551b6ae…b9dd`.
- **Values.** `S_5/R` at `t = 35` is about `0.01438`. `S_5` is negative at `t = 28..32` and positive at `t = 33, 34`. Nothing is
  claimed below `t = 35`.
- **Concordance** (`sr4_concord.py`; not evidence). My shifted `S_5` numerator is exactly `160 ×` C-T3-F's frozen `N_shifted`
  (51 coefficients, one ratio).

**5. SR-4c, the composition and (E), on the rows.** At `m = 107, 110, 113`:
- `S_5 > 0`, and `S_5/Δ = 0.1417`, `0.1625` and `0.1759`;
- the ascending/descending mass ratios are `0.2886`, `0.2493` and `0.2158`;
- the sign pattern of `g_0..g_11` is `---+++++++++`, with `neg_j = {0,1,2}` among all `j ≤ m` and no zero;
- `τ < 0`, and `S_4 < 0`;
- `x + 2 = p*` and `3p* < 2α+1`.

At `m = 95` (outside the class) `S_5 < 0` while `Δ > 0`, which is consistent with the certificate's start at `t = 33`.

**6. SR-4c, bounded observations (`sr4_rows.py`; `sr4_rows_out.json` `58c860e4…fef5b`).** I used the full closed-form
polynomials for every `m ≡ 2 (mod 3)` in `[2, 170]`, with `x` computed through `α`. The closed form was validated against my
literal-tree DP above and spot-checked by the tree DP at `m = 83`, 86, 158 and 161.
- `p*` is not eligible for any such `m ≤ 83`. At `m = 83`, `x = 443 = p*−1`, and parent descent fails at every such `m ≤ 83`.
- `p*` is eligible at every such `m ∈ [86, 170]`. At `m = 86`: `p* = 460`, `x = 458`, `α = 775`.
- `x = p*−2` at every class row `107..158`. **The first class row with `x < p*−2` is `m = 161`** (`p* = 860`, `x = 857`). At
  `m = 164`, `x = 873`.

These are `bounded_computation` only.

**7. SR-4d, alias check (`sr4_alias.py`; `sr4_alias_out.json` `2f036eb7…2114`).** I checked both registries (491 claims each)
for the exact key, every `aliases` string and every `alias_patterns` regex, against:
- the synthesis name;
- my repaired name;
- both names with hyphens replaced by spaces;
- the statement text.

Results:
- **0 exact hits, 0 alias-string hits, 0 pattern hits** in both registries.
- Lexical token scan: `INDEPENDENCE-COEFFICIENT`, `STRICTLY-DESCEND`, `AT-INDEX`, `16M-MINUS-2`, `IS-ELIGIBLE`, `RESIDUE-2` and
  `PARENT` occur in no key.
- `RANK-16M-PLUS-4-OVER-3` occurs only in the r30 row key.
- **`TOP-RANK` occurs in four keys**, and there it means the rank `α − 1`:
  - `E993-R26-TOP-RANK-RESIDUAL-SIGN`;
  - `E993-R26-TOP-RANK-N2-LE-M`;
  - `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT`;
  - `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE`.

  See finding F-3.

Mathematical neighbours were read in full: the favorability key, the `d ≤ 6` key, the r30 `m ∈ [95,107]` row key, the threshold
key, `E993-TREE-REAL-ROOTED`, `E993-ZERO-EXTENDED-BINOMIAL-BLOCK-RISE-FALL-STRICT-RISE`, `E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER`
and the R26/R29 top-rank keys. None states or implies the statement (distinction rows below).

## Findings and repairs

**F-1. The block identity (SR-4a) is correct.** It is re-derived by hand and confirmed against my literal-tree DP at
`m = 95, 107, 110, 113`, and as a polynomial identity for `m = 1..8`.
- The ℕ-subtraction points are `p*−2−j`, `8(m−j)` and the tail indices. All of them are in range on the class, and every
  difference is taken in ℤ.
- T3's own "independent cross-check" stays struck, because it was tautological (synthesis, struck list). My check replaces it; it
  is not a citation of it.

**F-2. The block signs (SR-4b) are correct.** The tool (G) and its gap `2j − 8` are proved above, Darroch- and Newton-free. The
mirror step settles `j ≤ 1` and the tail. The certificates at `j = 2`, 3 and 4 replay under my own construction with uniform
signs, and Sturm finds no root in `(35, ∞)`.

Two repairs:
- (a) **S6 is not a load-bearing node of S5.** The composition uses only the pooled `S_5 > 0` and the tool for `j ≥ 6`. The
  individual signs of `j = 0..5` are never used. S6 is a companion on the face, not an input. The synthesis's "Role: a node of
  S5" is repaired to "companion (not used in the proof)".
- (b) **The grade `computer_assisted` is confirmed** for the whole lemma, because it contains three fixed polynomial
  positivity checks. The `j ≥ 5`, `j ≤ 1` and tail parts are `proved_informal`.

**F-3. The pooled certificate and the composition (SR-4c) are correct.**
- **Pooling.** `S_5` pools the ascending blocks `j = 0,1,2` and the ascending tail with the descending blocks `j = 3, 4, 5`.
  Blocks `3, 4, 5` alone dominate. A pool with `J = 4` does not suffice: it is negative at `t = 35..44`.
- **Shift.** The shift is `t = 35 + u`, which is exactly the class endpoint `m = 107`.
- **Positivity.** All 51 coefficients are positive, and the Sturm count on `(35, ∞)` is 0.
- **Composition.** `i_{p*−2} − i_{p*−1} = S_5 + Σ_{j=6}^{m}C(m,j)g_j > 0`.
- **Dependencies.** It uses neither Darroch nor Newton. There is no `M_0` beyond the class endpoint and no omitted range.
- **(E).**
  - The contract's `x` is `C5LA1.crossingIndex`, which is `Nat.find` of the **least** `k` with `Δ_k = i_{k+1} − i_k < 0`, computed in
    ℤ with zero extension above `α`. I read this in the r30 SEMANTIC-CONTRACT §1.1 and in the carried Lean text in
    `AdjIntegration.lean`. It is the actual first descent, not a mean or criterion threshold.
  - Any strict descent at `k = p*−2` therefore gives `x ≤ p*−2`. This holds even where `x < p*−2` (every class row from 161 on).
  - With `α = 9m+1` and `3p* = 16m+4 < 18m+3 = 2α+1`, `p*` is eligible.
  - Eligibility uses no favorability, selector, weight or E1 hypothesis.

Repairs:
- (a) **Input wording.** The synthesis lists "the closing-step descent of `P_j` for `j ≥ 6` (Lemma B, C-U3-T)" as an input. The
  input is the tool (G), which is Lemma A's closing step applied to `P_j` (C-U3-T), not Lemma B's certificates.
- (b) **The grade (see F-4).**

**F-4. Grade: S5 is `computer_assisted`, not `proved_informal`.**
- The brief's rule for S6 is "`computer_assisted` if it is a fixed polynomial identity/positivity check". The `S_5` step is
  exactly such a check: a fixed degree-50 polynomial with 51 positive shifted coefficients of 56+ digits. It is the same kind of
  object as S6's `j = 3, 4` certificates, and my instrument builds all of them with the same code.
- Under SOLUTION-CONTRACT §4 a composition takes its weakest input's grade, so S5 is `computer_assisted`: universal on the class,
  Darroch- and Newton-free. Every other step is hand-checkable.
- **Consequence for R-5 and SR-5.** Tier 1 inherits at most `computer_assisted` through this key.
- The synthesis's split (S5 `proved_informal`, S6 `computer_assisted`) is inconsistent under any single convention.
- A registry precedent treats an exact `N(t)/Q(t)` identity with nonnegative shifted coefficients as `proved_informal`
  (`E993-G1-ODD-BROOM-VANISHING-RELATIVE-GAP`). If the controller rules for that convention instead, it must apply it to S5 and
  S6 alike, and to every certificate of this kind in the run.
- I register under the brief's rule.

**F-5. The Darroch/Newton hygiene of the alternative route is confirmed.** Where each route uses the classical theorems:

| Route | Use |
|---|---|
| T3 step 2 | Newton (log-concavity) on `P_j = (1+x)^{8j}(1+2x)^{8(m−j)+1}`, `0 ≤ j ≤ m` |
| C-T3-F (B-1), C-T3-U (i), T adjudicator R3 (B-1), F adjudicator E3 | Darroch and Newton on `P_j`, `j ≥ 6` |
| C-F3-T Step 1 | Darroch and Newton on `x^j P_j`, `j ≥ 7` (sign convention reversed) |
| C-F3-U Step 2 | Darroch ("mode < mean + 1") and Newton on `P_j`, `j ≥ 11` |

- Each input is a product of linear factors with nonnegative coefficients, whose roots are `0` (multiplicity `j`), `−1`
  (multiplicity `8j`) and `−1/2` (multiplicity `8(m−j)+1`).
- None applies either theorem to `I(CB(8,m))`, `G`, `G^m` or any forest polynomial.
- The route of record now uses neither theorem.

**F-6. The key name (SR-4d) needs repair.** The proposed name is not an unambiguous predicate, for two reasons:
- (i) **`TOP-RANK` collides in the registry.** In the four R26/R29 keys it means `p = α − 1`, and here `α − 1 = 9m`, whereas
  `p* = (16m+4)/3`. So `TOP-RANK-IS-ELIGIBLE` reads naturally as "`α − 1` is eligible", which is a different statement.
- (ii) **`PARENT-DESCENT` does not name its index.** Under the contract's own convention (favorability `Δ_p < 0` at rank `p`),
  "parent descent at the top rank" can be read as `Δ_{p*}(T) < 0`, which is `i_{p*+1} < i_{p*}`. That is not implied.

The repaired key is
`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`.
- "Descends at index `k`" follows the contract's descent convention, `i_{k+1} < i_k`, and here `k = (16m−2)/3 = p*−2`.
- The class is named as in the r30 row keys.
- The statement satisfies the name.
- It is alias-clear against both registries.
- The synthesis's name and the four critic candidates are recorded as aliases.

**F-7. Attribution.**
- The R-4 row's attribution travels on the face.
- Per fence 9 I add r30 for the closed forms and `α` (T1, r30 Cycle 6, as registered on the favorability key), and Codex for the
  CB family and transport context.

**F-8. Fences (SOLUTION-CONTRACT §3).**
- 1: one rank, the class only.
- 3: Darroch/Newton appear nowhere in the proof.
- 5: explicit endpoint, no asymptotics.
- 6: nothing refuted is revived.
- 7: the census is not evidence.
- 8: no sealed member was edited.
- 9: attribution is on the face.
- Fence 2 and fence 4 concern networks and do not apply to a coefficient statement.

No struck item is used: T3's tautological check and float "EXACTLY", F3's favorability evidence and mass-ratio labels, and U3 §5.6.

**F-9. Scope note on the bounded record.**
- The favorability key's fence cites the (ELIG-top)(a) bounded record `R30-CB-RECORD` (`m ∈ [106, 2395]`), and the synthesis asks
  for a note once SR-4 confirms. I write that note (below).
- The record's ten exceptions are all at `m ≡ 1 (mod 3)`, outside the class.

## Registration text

Register in this order.
- The key carries S5 with SR-4a as proof content and S6 as a companion, not as a separate key.
- The scope note attaches to the favorability key, where the bounded record is cited.
- The distinction rows go to `control/CLAIM-DISTINCTIONS.json`.
- The records are bounded and are never evidence.

```text
KEY: E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE
STATUS: VERIFIED
GRADE: computer_assisted
STATEMENT: Let m ≥ 107 be an integer with m ≡ 2 (mod 3), and let T = CB(8,m) be the tree with path r – s – v, m chokes u_1..u_m adjacent to r, 8 supports b_i1..b_i8 adjacent to each u_i and one private leaf c_ij adjacent to each b_ij (n = 17m + 3). Put p* := (16m+4)/3 (an integer exactly when m ≡ 2 (mod 3)) and L := p* − 2 = (16m − 2)/3, and let i_k := i_k(T) be the number of independent k-sets (zero for k < 0 and above α(T)). Then (a) i_{p*−1} < i_{p*−2}, that is, Δ_L(T) = i_{L+1} − i_L < 0 in ℤ; and (E) the first strict descent x(T) = C5LA1.crossingIndex (the least k with i_{k+1} < i_k, computed in ℤ through rank α) satisfies x(T) ≤ p* − 2, α(T) = 9m + 1, and 3p* = 16m + 4 < 18m + 3 = 2α(T) + 1, so p* is eligible (x(T) + 2 ≤ p* and 3p* < 2α(T) + 1); eligibility uses no favorability, selector, weight or E1 hypothesis. Proof. (1) Closed form and block identity (elementary): splitting on whether r is chosen, then on each u_i, I(T) = (1+2x)G^m + x(1+x)(1+2x)^{8m} with G = (1+2x)^8 + x(1+x)^8, and the binomial theorem gives I(T) = Σ_{j=0}^{m} C(m,j) x^j P_j(x) + x(1+x)(1+2x)^{8m} with P_j := (1+x)^{8j}(1+2x)^{8(m−j)+1}; with a_j(l) := [x^l]P_j, g_j := a_j(L−j) − a_j(L−j+1) and τ := 2^{L−2}C(8m, L−2) − 2^L C(8m, L) (the tail difference), i_{p*−2} − i_{p*−1} = Σ_{j=0}^{m} C(m,j) g_j + τ in ℤ; for 0 ≤ j ≤ m, 1 ≤ L − j and L − j + 1 ≤ 8m + 1 because L − m = (13m − 2)/3 ≥ 1; deg I = 9m + 1 (leading term 2x^{9m+1} from (1+2x)G^m; the tail has degree 8m + 2), so α(T) = 9m + 1. (2) Two-binomial descent tool: for r(k) = [y^k](1+y)^a(1+2y)^b with a, b ≥ 0, (R) (k+1)r(k+1) = (a+2b−3k)r(k) + 2(a+b−k+1)r(k−1), from (1+y)(1+2y)f′ = ((a+2b) + (2a+2b)y)f; (LC) r is positive on [0, a+b] and log-concave, by induction on linear factors (z_k = x_k + c x_{k−1} with c > 0 gives z_k² − z_{k−1}z_{k+1} = LC_k + c²LC_{k−1} + c(x_k x_{k−1} − x_{k−2}x_{k+1}) ≥ 0), with neither Newton's inequalities nor Darroch's theorem; hence, if 1 ≤ t ≤ a+b and 6t ≥ 3a+4b+2, then r(t+1) < r(t) (if r(t+1) ≥ r(t), log-concavity gives r(t) ≥ r(t−1), and (R) gives (t+1)r(t) ≤ (3a+4b−5t+2)r(t), so 6t ≤ 3a+4b+1). For P_j take a = 8j, b = 8(m−j)+1, t = L − j; 3p* = 16m + 4 gives 6t − (3a+4b) = 2j − 8, so g_j > 0 for every j with 5 ≤ j ≤ m. (3) Pooled certificate: put m = 3t + 2 (t ≥ 35 ⟺ m ≥ 107 on the class), B = 8m+1 = 24t+17, M = B − L = 8t+7 and R := C(B,L)2^L > 0; every term C(B−a, L−c)2^{L−c} of S_5 := Σ_{j=0}^{5} C(m,j) g_j + τ equals R·2^{−c}·ff(L,c)·[M!/(M−a+c)!]/ff(B,a), with ff the falling factorial and ff(L,−1) = 1/(L+1) (block terms a = 8j, c = j + i − e, 0 ≤ i ≤ 8j, e ∈ {0,1}; tail terms (a,c) = (1,2), (1,0); all factorial arguments nonnegative for t ≥ 4); hence S_5/R = N_5(t)/D_5(t) with D_5(t) = Π_{q=0}^{39}(24t+17−q)·(16t+11)·Π_{q=1}^{5}(8t+7+q) > 0 for t ≥ 1 and N_5 an explicit rational polynomial of degree 50, and all 51 coefficients of N_5(35+u) are strictly positive, so S_5 > 0 for every real t ≥ 35. The pool sets the ascending blocks j = 0, 1, 2 and the ascending tail against the descending blocks j = 3, 4, 5; the pool j ≤ 4 does not suffice (S_4 < 0 at t = 35..44). (4) Composition: i_{p*−2} − i_{p*−1} = S_5 + Σ_{j=6}^{m} C(m,j) g_j > 0 by (3) and (2). No Darroch, no Newton, no M_0 beyond the class endpoint m = 107, and no omitted range. (E) follows from (a) because x is the least strict descent, together with α(T) = 9m + 1 from (1). Companion (face content, not an input): the exact block signs. g_j < 0 (P_j ascends at L − j) exactly for j ∈ {0,1,2}; g_j > 0 for every 3 ≤ j ≤ m; and τ < 0 (the tail ascends). These follow from the tool for j ≥ 5; from its mirror (0 ≤ t, t+1 ≤ a+b and 6t ≤ 3a+4b−6 imply r(t+1) > r(t)) for j = 0, 1 (gaps −8, −6) and the tail (a = 1, b = 8m, t = L − 1, gap −13); and from fixed Taylor-shift certificates of the same construction at t = 35 for j = 2 (all shifted coefficients negative), j = 3 and j = 4 (all positive).
SCOPE: One explicit tree family CB(8,m), m ≥ 107, m ≡ 2 (mod 3), at one rank per tree, p* = (16m+4)/3 (the r31 contract's top sector-deficient rank, not the rank α − 1 of the R26/R29 top-rank keys), and one coefficient pair (indices p* − 2, p* − 1) of I(CB(8,m)). Hypotheses consumed: m ≡ 2 (mod 3) (integrality of p*, the gap 2j − 8 through 3p* = 16m + 4, and the parametrization m = 3t + 2), m ≥ 107 (only through the certificate endpoint t ≥ 35; S_5 < 0 at t = 28..32, so the proof says nothing below 107 even though the parent descent holds at the bounded rows m ∈ [86, 104]), and the literal CB(8,m). Nothing is asserted at any other rank, for m ≢ 2 (mod 3), for m < 107, for d ≠ 8, for heterogeneous CB patterns or for arbitrary trees, and nothing is asserted about favorability, the weight, the relation, flows or (HALL). Bounded support (bounded_computation, never evidence): the parent descent exact at every class row m ∈ [107, 2600] (C-F3-U, 832 rows; F3, 69 rows beyond 2395; T3, 160 rows to 584; the r30 record to 2395); the block identity against literal-tree dynamic programs at m = 95, 107, 110, 113 (several critics; isolated second read SR-4); the certificate reproduced by C-T3-F, C-T3-U, C-F3-T and C-F3-U (J = 5 and J = 10), by the r31 T and F adjudicators, and by SR-4's own construction (Sturm count 0 on (35, ∞); N_5 proportional to C-T3-F's).
ATTRIBUTION: The block decomposition of the carried closed form and the reduction steps (the block identity, l_j − μ_j = (j − 4)/3, the j = 0 fact): T3 (Claude Sonnet 5; r31 Cycle 1 route C1-T-03). The closed forms of I(CB(d,m)) and α(CB(d,m)) = m(d+1) + 1: r30 (T1, r30 Cycle 6, re-derived by C-T1-F, as registered on the face of E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3). The pooled S_5 / J certificates: C-T3-F and C-T3-U, found independently, and C-F3-T and C-F3-U, found independently (Claude Opus 5.5; r31 Cycle 1 critics), replayed by the r31 T and F adjudicators (Claude Opus 5.5). The two-binomial descent tool (recurrence (R), elementary log-concavity, the closing step) and the block-sign lemma: C-U3-T (Claude Opus 5.5), with the block signs for j ≤ 8 and the tail concordant from C-U3-F (Claude Opus 5.5). The composition (the tool for j ≥ 6 with the pooled S_5): the r31 Cycle 1 synthesis (Claude Opus 5.5). Isolated second read SR-4 (Claude Opus 5.5): own literal-tree DP, own certificate construction with a Sturm cross-check, the rename and the grade. The CB family and the lower-region transport context: Codex (GPT-6), the lower-region run. The first-descent definition C5LA1.crossingIndex: the r30 / first-interior definition layer.
FENCES: Grade qualifier: computer_assisted, universal on the class. The only machine step is the single fixed exact polynomial positivity certificate (3) (51 shifted coefficients); every other step is hand-checkable, and the proof is Darroch- and Newton-free. The companion block-sign statement is computer_assisted (three fixed certificates, j = 2, 3, 4), with its j ≤ 1, j ≥ 5 and tail parts at proved_informal level; it is not an input. Newton's inequalities and Darroch's theorem are used nowhere in the proof. The alternative route of record (C-T3-F, C-T3-U, C-F3-T, C-F3-U, the r31 T and F adjudicators) applied them only to the real-rooted products P_j or x^j P_j (roots 0, −1, −1/2) for j ≥ 6, 7 or 11, never to I(CB(8,m)), G, G^m or any forest polynomial; E993-TREE-REAL-ROOTED stays REFUTED and is not revived. Census rows are bounded_computation and are not evidence. One rank per tree and the class only. Not (HALL), not a restricted-scope (HALL) theorem, not favorability and not E1: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL and E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE stay OPEN, as do TREE, FOREST, TRANSFER, governed beta and Erdős #993, and no status transfers to or from any registered key. Struck items are never evidence (T3's tautological identity check and its float "exactly", F3's favorability evidence and mass-ratio labels, U3 §5.6). Any composition that uses this key inherits computer_assisted at best.
ALIASES: E993-R31-CB-8-TOP-RANK-PARENT-DESCENT-HOLDS-AND-TOP-RANK-IS-ELIGIBLE-ON-THE-RESIDUE-2-CLASS-FROM-107; E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-PARENT-DESCENT-AT-RANK-16M-PLUS-4-OVER-3-MINUS-1; E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3; E993-R31-CB-8-EVERY-M-GE-107-CONGRUENT-2-MOD-3-PARENT-DESCENT-AT-RANK-16M-PLUS-4-OVER-3-MINUS-2; E993-R31-CB8-CLASS-PARENT-DESCENT-HOLDS-AT-PSTAR-MINUS-2; r31 C1 (ELIG-top)(a) on the class; CB(8,m) parent descent at rank (16m+4)/3
```

```text
SCOPE NOTE ON: E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3
TEXT: [r31 C1; SR-4] This key's fence cites condition (a), x ≤ p* − 2 at d = 8, as the bounded_computation record R30-CB-RECORD on m ∈ [106, 2395]. On the r31 class m ≥ 107, m ≡ 2 (mod 3), with p* = (16m+4)/3, that condition is now the statement of E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE (computer_assisted, Darroch- and Newton-free). On that class the record, and its r31 extension to m = 2600 (C-F3-U, 832 rows), are superseded as proof and remain bounded evidence. Outside the class (m ≡ 0, 1 (mod 3), including the record's ten exceptions m ∈ {106, 109, …, 133}, and m < 107) the record is unchanged. This key's statement, grade (proved_informal modulo Darroch and Newton) and fences are unchanged. The new key uses only the closed form of I(CB(8,m)) from this key's node, re-derived independently, and none of its favorability content. No status transfers either way.
```

```text
DISTINCTION ROW: SR-4-DR1
KEY: E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3
TEXT: A different predicate. That key asserts the favorability of the original leaves, that is, the strict descents Δ_{p*}(T − v) < 0 and Δ_{p*}(T − c) < 0 of the leaf-deleted forests at the rank p* = ⌊(2dm+4)/3⌋, and it asserts no eligibility. The new key asserts the strict descent i_{p*−1} < i_{p*−2} of I(CB(8,m)) itself, at index p* − 2, and the eligibility of p* on the class m ≥ 107, m ≡ 2 (mod 3). They share the family, the rank and the closed form of I(CB(8,m)) (a node of that key, re-derived independently for the new key); the new key uses none of the favorability content and neither Darroch nor Newton. Neither implies the other, and no status or grade transfers.
```

```text
DISTINCTION ROW: SR-4-DR2
KEY: E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS
TEXT: A different range and the opposite direction. That key is for d ≤ 6 and gives a lower bound x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋ on the first strict descent (by Darroch on the binomial blocks), with a sector deletion-sufficiency consequence. The new key is for d = 8 on the class and gives an upper bound x ≤ p* − 2 through a strict descent at index p* − 2 (Darroch-free), together with eligibility; it has no network content. The two share the binomial block split of I(CB(d,m)) and nothing else. No status transfers.
```

```text
DISTINCTION ROW: SR-4-DR3
KEY: E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: Overlap at one row only, and on the eligibility facts only. That key's m = 107 row records (n, α, x) = (1822, 964, 570) and the eligibility of p = 572 as row facts of a computer_assisted (HALL) certificate at five named rows. The new key proves the eligibility of p* uniformly on m ≥ 107, m ≡ 2 (mod 3), and says nothing about (HALL), weights, flows or switch arcs. At m = 107 the two agree on x ≤ p* − 2. The row key's (HALL) content, grade and certificate are unchanged, and no status transfers either way.
```

```text
DISTINCTION ROW: SR-4-DR4
KEY: E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE
TEXT: A different rank despite the shared words. In the R26/R29 keys (E993-R26-TOP-RANK-RESIDUAL-SIGN, E993-R26-TOP-RANK-N2-LE-M, E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT and this key), "top rank" is p = α(T) − 1; on CB(8,m) that is 9m. The new key concerns p* = (16m+4)/3, the r31 contract's "top sector-deficient rank", which is interior to the eligible window for large m. The synthesis's proposed name for the new key, which used "TOP-RANK", is kept only as an alias. No statement, rank or status is shared.
```

```text
DISTINCTION ROW: SR-4-DR5
KEY: E993-TREE-REAL-ROOTED
TEXT: No revival. The new key's proof uses no real-rootedness, mode or unimodality statement about any polynomial: its descent tool rests on an exact three-term recurrence and an elementary log-concavity induction on linear factors. The superseded alternative route applied Darroch and Newton only to the real-rooted products P_j = (1+x)^{8j}(1+2x)^{8(m−j)+1} or x^j P_j, never to I(CB(8,m)), G or G^m. That key stays REFUTED.
```

```text
DISTINCTION ROW: SR-4-DR6
KEY: E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD
TEXT: A different polynomial. That key locates the ranks where condition (i) of the mark-clone criterion holds, as a statement about r_q = (1+y)^{qd−1}(1+2y)^{d(m−q)+1}. The new key concerns I(CB(8,m)) at index p* − 2 and eligibility. The same two-binomial descent tool (the recurrence, elementary log-concavity and the closing step, C-U3-T) is applied in the new key to the blocks P_j, not to the r_q; its use on the r_q at p* is the subject of that key's r31 scope note (isolated second read SR-2). No status transfers.
```

```text
DISTINCTION ROW: SR-4-DR7
KEY: E993-ZERO-EXTENDED-BINOMIAL-BLOCK-RISE-FALL-STRICT-RISE
TEXT: A formally verified coefficient theorem about g(t,u,k) = b(u,k−t) + 2b(u,k−t−1) (a binomial row times (1+2x), shifted), which is a different block family. The new key neither uses nor restates it; the new key's blocks (1+x)^{8j}(1+2x)^{8(m−j)+1} carry two growing exponents. No status transfers.
```

```text
DISTINCTION ROW: SR-4-DR8
KEY: E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: Outside the class. Three of that key's rows, (CB(8,86), 460), (CB(8,89), 476) and (CB(8,92), 492), sit at the rank (16m+4)/3 with m ≡ 2 (mod 3), but at m < 107. The new key says nothing below m = 107: its certificate is negative at m = 86..98, even though the parent descent holds there at the bounded rows. That key's eligibility row facts and its (HALL) content keep their own grade (computer_assisted), and no status transfers either way.
```

```text
RECORD: SR-4-R1
CLAIM: First eligible residue-2 row. Over m ≡ 2 (mod 3), 2 ≤ m ≤ 170, the rank p* = (16m+4)/3 of CB(8,m) is not eligible for m ≤ 83 (at m = 83, x = 443 = p* − 1, and the parent descent fails at every such m ≤ 83), and it is eligible for every such m ∈ [86, 170]; at m = 86, p* = 460, x = 458 and α = 775.
STATUS: bounded_computation
PROVENANCE: C-F2-U and the r31 F adjudicator (critic-attributed); isolated second read SR-4 (own full closed-form sweep with x through α, validated against its literal-tree DP, with literal-tree spot rows m = 83 and 86; sr4_rows_out.json 58c860e4…fef5b).
```

```text
RECORD: SR-4-R2
CLAIM: First-descent transition on the class. x = p* − 2 exactly at every class row m ∈ [107, 158]; the first class row with x < p* − 2 is m = 161 (p* = 860, x = 857); at m = 164, x = 873 = p* − 3. The parent descent, and hence eligibility, holds at every one of these rows.
STATUS: bounded_computation
PROVENANCE: C-F3-T and C-F3-U (critic-attributed), confirmed by the r31 F adjudicator; isolated second read SR-4 (own sweep; literal-tree spot rows m = 158 and 161).
```

```text
RECORD: SR-4-R3
CLAIM: Row facts on SR-4's literal-tree DP. At m = 107, 110 and 113: (n, α, x, p*) = (1822, 964, 570, 572), (1873, 991, 586, 588) and (1924, 1018, 602, 604); I(T) equals the closed form and the block sum; the block pattern of g_0..g_11 is −−−+++++++++ with no zero block among all j ≤ m; τ < 0; S_4 < 0 < S_5, with S_5/Δ = 0.1417, 0.1625 and 0.1759; the ascending/descending mass ratio is 0.2886, 0.2493 and 0.2158. At m = 95 (outside the class): x = 506 and Δ > 0, but S_5 < 0.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-4 (sr4a_identity.py; sr4a_out_95_107_110_113.json 1e4a5c59…d53f).
```

## Verdicts

verdict[SR-4a]: confirmed
verdict[SR-4b]: confirmed_with_repairs
verdict[SR-4c]: confirmed_with_repairs
verdict[SR-4d]: confirmed_with_repairs

- **SR-4a.** The block identity and the difference decomposition at `l_j = p*−2−j`, plus the tail
  `τ = 2^{L−2}C(8m,L−2) − 2^L C(8m,L)`, are re-derived by hand. They are confirmed against my own literal-tree DP at `m = 110`
  (and 95, 107, 113), and as a polynomial identity for `m = 1..8`. They are registered as proof content of the key.
- **SR-4b.** The signs are exact.
  - `j ∈ {0,1,2}` ascend, every `j ≥ 3` descends, and the tail ascends.
  - The gap `2j − 8` is proved and the tool (G) is proved, Darroch- and Newton-free.
  - The `j = 2, 3, 4` certificates are replayed with my own arithmetic (uniform signs; Sturm 0 roots).
  - Grade `computer_assisted`.
  - Repair: S6 is a companion, not a load-bearing node of S5.
- **SR-4c.** (a) holds for every class `m`, Darroch- and Newton-free, with no `M_0` and no omitted range.
  - The pool is `j ≤ 5` plus the tail, with a shift to `t = 35` and 51 positive coefficients.
  - (E) follows from the least-descent definition, the actual first descent.
  - Eligibility needs no favorability.
  - The alternative route confines Darroch and Newton to `P_j` and `x^j P_j`.
  - The records `m = 86` and `m = 161` are confirmed as bounded observations.
  - Repairs: the grade is `computer_assisted` (F-4), and the `j ≥ 6` input is the tool (G), not Lemma B's certificates.
- **SR-4d.** Repaired name `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`.
  - The reason: `TOP-RANK` means `α − 1` in four registered keys, and `PARENT-DESCENT` leaves the index implicit.
  - Grade `computer_assisted`, with S6 as a companion.
  - Attribution as in the R-4 row, plus r30 (closed forms) and Codex.
  - Alias-clear against both frozen registries; the synthesis name is kept as an alias.
  - The consequence for R-5 and SR-5 is that Tier 1 inherits at most `computer_assisted` through this key.

Registration items written: the key above; one scope note on
`E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3`; distinction rows SR-4-DR1 to
DR8; records SR-4-R1 to R3 (`bounded_computation`).

Seal verified: `9016a163164eed0a204076542875b175739b0c4afd4dbfb708b4e0bd1ceccd70` (MATCH; 575/575 members).

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-sr-SR-4/`. The
instruments use the Python standard library only (`math`, `fractions`, `itertools`, `json`, `hashlib`, `re`, `sys`), with exact
arithmetic, run with `python3 -B` in the foreground. Total compute was under one minute.

| File | SHA-256 | Role |
|---|---|---|
| `sr4_core.py` | `ec1a231ad7f8d355d2498fd2c26b1e51a1da3cca569bf1663d3ac6b1aeaa304f` | literal CB(8,m) tree from the contract labelling; generic rooted DP; closed form; block sum; direct block and tail coefficients; first descent through `α` |
| `sr4a_identity.py` | `2942a219395394868102cfa6abca535bc3faca9d4b5b1bdc1ae25f0f3adec2b1` | SR-4a: DP vs brute force (small), block identity `m = 1..8`, rows 95/107/110/113 |
| `sr4a_out_95_107_110_113.json` | `1e4a5c59dec1c695b8d0eb61413828c8bf62db0dd2493660d8f042a7466cd53f` | its output |
| `sr4_tool.py` | `c292bfdd7c6949f0ed2d028f7617818bb2add8e79eddec45fa41c35ac708f191` | (R), (LC), (G), the mirror step on the grid; side conditions and gap at `m = 110` |
| `sr4_tool_out.json` | `71026a138cfa8f0062d54c0c08a3657d294fb624a3bceea4a82d3f4223e2c371` | its output |
| `sr4_cert.py` | `c94ec98b0682b9c47911b15225f734b1ef9cfeb31b81ad257b9c10af43b72ce4` | own symbolic certificates: tail, `g_0..g_5`, `S_3`, `S_4`, `S_5`; Taylor shift; Sturm; 99-point identity guard |
| `sr4_cert_out.json` | `cf2068379aa973d1f772daf7c6c0dd04748059f052ad64e493523b5b8155f1f0` | its output |
| `sr4_rows.py` | `ce27751ba9e7a99a187f8189fef550cfd62a131faa757205b5332ce0a5fe1e38` | bounded observations (`m = 86`, `m = 161`) with tree spot rows |
| `sr4_rows_out.json` | `58c860e4dae18da2413075f84176d9c6a779d829305825986d78873bd2bfef5b` | its output |
| `sr4_alias.py` | `80100563c2856d3dddc2adacf2300f58a9185109f231c2e5ee0daece822ff958` | alias check against both registries (key, alias strings, alias patterns, neighbours) |
| `sr4_alias_out.json` | `2f036eb7df7323b05a301a9e8758c42c13c4afd5a003c717fc98900ce2ae2114` | its output |
| `sr4_concord.py` | `29f79ef1a799130f37e3a1e92ca34fcfaca450881b8dde71a59797f5eea2d8ce` | concordance only: my `S_5` numerator against C-T3-F's frozen `N_shifted` (ratio 160, one value); not evidence |

Replay (copy-out-first; the target is a fresh scratch folder):

```
S=/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-sr-SR-4
mkdir -p $S-replay && cp $S/*.py $S-replay/ && cd $S-replay
python3 -B sr4a_identity.py 95 107 110 113
python3 -B sr4_tool.py
python3 -B sr4_cert.py
python3 -B sr4_rows.py
python3 -B sr4_alias.py      # reads ../../control/snapshots/… and ../../sources/authority/… relative to scratchpad/<dir>/
```

No sealed member was edited. No background job was started, and none is running.
