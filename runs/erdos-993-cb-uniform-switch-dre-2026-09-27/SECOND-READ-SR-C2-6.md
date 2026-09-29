# Second Read

Read `SR-C2-6` (r31 Cycle 2; the two-sided switch-image residual margin, X-11, and its optional scope note, G-7). Reader: Claude
Opus 5.5, chartered effort high, isolated. Date: 2026-09-28 (clock read at 03:26 and 03:32 EDT).

**VerityOS boot.** I am operating within VerityOS. I loaded exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other subsystem. The binding documents for this task are the
protocol and the brief.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Protocol.** `control/C2-SECOND-READ-PROTOCOL.md`, SHA-256 `563877beef7a57b1fd71ef95f518998ec7598fc9f9328e28270f3405e85d9e82`.
  This matches the dispatch.
- **Brief.** `control/C2-SECOND-READ-BRIEF-SR-C2-6.md`, SHA-256 `f05afdfcd11aa3fe872f8a0e6c489e5fbdfab1b9ae8c71f05275cb099610d250`.
  This matches the dispatch.
- **Capsule seal.** `control/c2-second-read/SR-C2-6-PACKET-MANIFEST.json` records
  `seal_sha256 = 949cb5c6ae8330fb690bec9484031c947a8c476d2ce0170f59500e4d6136111b`.
  - I recomputed it as the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`, with no trailing newline.
    I got **`949cb5c6ae8330fb690bec9484031c947a8c476d2ce0170f59500e4d6136111b`**, a match.
  - The manifest file's own byte digest is `0735ed84…e427e`. That is not the seal.
  - `run_id`: `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. `stage`: `cycle-2-second-read-SR-C2-6`.
- **Members.** All 364 listed files are present, and each matches its listed SHA-256 and byte count (0 mismatches).
- **Frozen sources.** I checked all 338 `sources/` members against their directory's `SOURCE-DIGESTS.json`:
  - `sources/SOURCE-DIGESTS.json`;
  - `sources/c1-results/SOURCE-DIGESTS.json`;
  - `sources/c2-stage7-sources/SOURCE-DIGESTS.json`;
  - `sources/concurrent/SOURCE-DIGESTS.json`.

  Every one was covered, with 0 mismatches.
- **Read-boundary disclosures.**
  1. The harness put three things in my context before I started: the project `CLAUDE.md`, the user auto-memory index
     (`MEMORY.md`) and the user's email. I did not fetch or use any of them.
     - `CLAUDE.md` asks for conversation logging. I wrote no log, because the brief confines my writes to this file and my
       scratch.
     - The memory index's r31 lines were not used as evidence.
  2. Two overlong outputs of mine (the manifest and a listing of its members) were saved by the harness under
     `~/.claude/projects/.../tool-results/`. I did not open them. I read the manifest through my own script.
  3. I made no directory listing outside the capsule, not even names-only. `mkdir -p` and `test -e` touched only my scratch and
     output paths.
  4. I made no network access, no installs and no `lake`/`lean` runs. I started no background jobs and killed nothing.
  5. I used no Mathlib grep. I read the C1-LA1 Lean fragments as text only.
  6. I read no VerityOS file other than the two boot files.

## Statements read

| id | Statement (record: `cycles/cycle-2/stage6/SYNTHESIS.md`) | Grade on its face | Attribution on its face |
|---|---|---|---|
| SR-C2-6a | X-11: for every class `m` (`m ≥ 107`, `m ≡ 2 (mod 3)`), `11/(25m) ≤ 1 − ρ_1(m) − 288/(200m²+82m+5) ≤ 13/(25m)`, with `ρ_1 = r_1(p*−1)/r_1(p*−2)` and `r_1(k) = [y^k](1+y)^7(1+2y)^{8m−7}` | `computer_assisted` STATED (two degree-10 certificates) | C-F1-U |
| SR-C2-6b | G-7: an optional scope note carrying X-11 on `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107` | `computer_assisted` | C-F1-U |

**Origins read.** All are capsule members.
- The Cycle 2 records:
  - C-F1-U's critique (A7, the alias check, `## Remaining obligation` R1) and C-F1-T's critique (the struck `Θ(1/m)` literal and
    the `θ` typo);
  - F1's return;
  - the F adjudication (D5, fixed-certificate result 5, Group R1);
  - the synthesis (R-4, R-5, X-11, `## Refuted or narrowed mechanisms`, `### No award attempted`, G-7);
  - the controller facts for Stage 5 (F) and Stage 6.
- The registry text of the R-1 key, from the frozen run-local snapshot (497 claims).
- C1-LA1's frozen run:
  - the carried `cb8R1` definition (entry 11);
  - `cb8R1_expand_top/sub` (entries 29, 30);
  - `cb8_residual_core` (entry 31);
  - `cb8_sectorTemplate_residual` (entry 32);
  - the `Main.lean` line holding the degree-9 numerator;
  - the Cycle 1 synthesis carried in `SOURCE/`.
- `SOLUTION-CONTRACT.md` §§1–5.
- C-F1-U's `cert_n8.py` and `cert_n8_out.json`, which I read and replayed as a copy-out only.

## Independent re-derivation

My instrument is `scratchpad/c2-sr-SR-C2-6/sr6_r1.py`. It uses the standard library only, exact `int`/`Fraction` arithmetic, and
shares no code with any seat, critic or adjudicator. It runs in 8.2 s.

**1. The exact rational form of `ρ_1`, by my own normalisation.**
- Let `N = 8m − 7` and `K = (16m+1)/3 = p* − 1`. `K` is an integer exactly when `m ≡ 2 (mod 3)`.
- I normalised every binomial against the top index `C(N, K)`, using `C(N,K−e)/C(N,K) = Π_{s<e} (K−s)/(N−K+1+s)`. This is a
  different anchor from the seats', who normalise at `C(N, K−8)`.
- With the common denominator `Π_{s=0}^{7}(N−K+1+s)`, this gives `ρ_1 = A(m)/B(m)` with `A` and `B` of degree 8 and `B − A` of
  degree 7.
- I checked `A/B` against `[y^K]/[y^{K−1}]` of the literally expanded `(1+y)^7(1+2y)^{8m−7}`, a convolution that does not use the
  binomial-sum formula, at `m = 2, 5, 8, 11, 107, 110, 113, 122`. All eight agree.

**2. A direct pair of certificates, by my own method.**
- Write `M = (B−A)L − 288B`, with `L = 200m²+82m+5`. Then `1 − ρ_1 − θ = M/(BL)`.
- Put `lowD = 25m·M − 11·B·L` and `upD = 13·B·L − 25m·M`. Both have degree 10.
- After the shift `m = 107 + t`:
  - `B` (degree 8), `M` (degree 9), `lowD` and `upD` (degree 10) have **every coefficient strictly positive**;
  - the smallest coefficients are `2147483648/6561`, `67108864000/2187`, `308700774400/6561` and `550292684800/6561`.
- So both inequalities hold for every real `m ≥ 107`, and at every class `m` in particular. They are also all-positive after the
  shift `m = 107 + 3t`.
- The limit of `m(1 − ρ_1 − θ)` is `M_top/(200·B_top) = 15/32`.

**3. C-F1-U's two certificates, rebuilt with my own code.**
- The shift is `m = 3p + 107` with real `p ≥ 0`. This covers the class exactly, and then `K = 16p + 571` and `a = K − 8 = 16p + 563`.
- Both binomial ratios are affine in `p`: `X_j/X_0 = Π_{s<j} (8p+286−s)/(16p+564+s)`, because `N − a = 8p + 286` and
  `a + 1 = 16p + 564`.
- The denominator is `Pd = Π_{s=0}^{7}(16p+564+s)`.
- `S0 = r_1(K−1)/2^a = Σ_{j=0}^{7} C(7,j)2^j X_j` and `S1 = r_1(K)/2^a = Σ_{j=1}^{8} C(7,8−j)2^j X_j`. There is no ℕ-subtraction
  hazard: `K − i ≥ 564` for `i ≤ 7`.
- The numerator `Q(p) = (L−288)·S0p − L·S1p` has degree 9 and all ten coefficients positive.
  - It equals, coefficient for coefficient, the numerator in the carried C1-LA1 `Main.lean`. That numerator is `hkey` inside
    `cb8_residual_core`: `(margin numerator)·Pd = X0·Q(P)`, closed by `linear_combination`.
  - So the identity `(1 − ρ_1 − θ)·L·S0·Pd = X_0·Q(p)` exists as a kernel-checked companion step of the R-1 key's award. It has
    no grade of its own.
- **Factor bounds.** Write `f_s(p) = (8p+286−s)/(16p+564+s)`.
  - The derivative numerator is `8(564+s) − 16(286−s) = 24s − 64`. Its values are `−64, −40, −16, 8, 32, 56, 80, 104` for
    `s = 0..7`.
  - So `f_s` is monotone from `f_s(0)` toward `1/2`, and it stays within `[279/571, 143/282]` for every real `p ≥ 0` and every
    `s`.
  - This gives `(1129/571)^7 ≤ S0/X_0 ≤ (284/141)^7`. Both endpoint equalities are checked exactly as binomial sums.
  - The direction is sound because `Q > 0`, `L > 0` and `Pd > 0` for `p ≥ 0`.
- **Lower certificate** `(3p+107)·141^7·Q − (11/25)·284^7·L·Pd`: degree 10, all 11 coefficients positive, minimum
  `7056249918113185971717537792`.
- **Upper certificate** `(13/25)·1129^7·L·Pd − 571^7·(3p+107)·Q`: degree 10, all 11 coefficients positive, minimum
  `219385525499494700114137269141504`.
- Both minima equal C-F1-U's recorded minima. A copy-out replay of `cert_n8.py` in my scratch reproduces `cert_n8_out.json`
  byte-identically (`2a6da8b0…cdaf48`). This is corroboration only.

**4. Exact rows (`bounded_computation`, corroboration only).**
- I computed `ρ_1` from the literal binomial sum at 401 class rows: every `m ≡ 2 (mod 3)` in `107..1298`, plus 2999, 5999 and
  30002.
- At every row, `ρ_1 = A/B` exactly, and `11/25 ≤ m(1−ρ_1−θ) ≤ 13/25`. There were 0 failures.
- `m·margin` runs from `0.454493…` (at 107) to `0.468699…` (at 30002). Other values: `0.454881` (110), `0.456241` (122),
  `0.457607` (137), `0.467366` (1106).

**5. The key's existing face bounds, checked on my instrument.**
- The R-1 key's text already carries three bounds in its proof paragraph and certificate line (r31 C1 critic C-F2-T):
  - `15/32 − 1/(8m) ≤ m(1 − ρ_1) ≤ 15/32`;
  - `9/(20m) ≤ 1 − ρ_1`.
- I checked all three as polynomial inequalities after the shift `m = 107 + t`. They have degrees 8, 7 and 8, and every
  coefficient is positive.

**6. Hypotheses, `M_0`, endpoint, residue, fences.**
- `m ≡ 2 (mod 3)` enters only through `K ∈ ℕ`, that is, through the substitution `m = 3p + 107`.
- `m ≥ 107` enters as `p ≥ 0`. It is the class endpoint, and no `M_0` beyond it is used.
- Both bounds are explicit, with no remainder term. No step is asymptotic (fence 5).
- Darroch and Newton are used nowhere (fence 3). The `θ*` law and LP optimality are not used; `θ = 288/L` is the allocation value
  of record (fence 4).
- **Off-class context** (`bounded_computation`, never evidence on the class, not for registration):
  - at residue-2 `m ≤ 50` the two-sided bound fails;
  - at `53..104` it holds;
  - my direct lower certificate becomes coefficientwise positive from the shift `m = 53 + t`.

  So the class endpoint is not what makes the bound true, and nothing is claimed below 107.

## Findings and repairs

1. **X-11 is true as stated, and the grade `computer_assisted` is right.**
   - It rests on fixed polynomial certificates whose coefficient signs are checked exactly (ruling 10).
   - The degree-10 description is correct in both parameterisations: C-F1-U's `p`, and my `m = 107 + t`.
2. **Domination by the key's own face.**
   - X-11 is a two-line corollary of the bound `15/32 − 1/(8m) ≤ m(1 − ρ_1) ≤ 15/32` already on the R-1 key's face, because
     `mθ = 288m/L < 36/(25m)`:
     - `m(1 − ρ_1 − θ) ≥ 15/32 − (1/8 + 36/25)/m ≥ 11/25` as soon as `m ≥ 1252/23 ≈ 54.4`;
     - the value at 107 exceeds `11/25` by `1209/85600`;
     - `m(1 − ρ_1 − θ) < m(1 − ρ_1) ≤ 15/32 < 13/25`.
   - So the lower half is weaker than what the face already gives (`≥ 0.4541` against `0.44`). The upper half is weaker than the
     face's `15/32`.
   - C-F1-U could not see this: the run-local registry was outside its capsule, as it disclosed. Its alias check also ran only on
     the two masters.
   - The scope note must say that X-11 adds a certificate and an explicit statement for the margin *including* `θ`. It adds no
     strength beyond the key's face, and no formal content: the award's statement is (v) only.
3. **Attribution repair (statement unchanged).**
   - The face's `C-F1-U` is right for the statement, the factor-bound lemma and both certificates.
   - The note must also carry:
     - the degree-9 numerator `Q` and the margin identity, which are the R-1 key's award residual proof (Residual origins r31 C1
       critics C-T1-F and C-T1-U, as registered on the key). The identity is kernel-checked there as a companion step;
     - the face bound it is implied by (r31 C1 critic C-F2-T);
     - `r_q`, `ρ_q` and the E1 load `ρ_1·γ` that motivate it, from r30 by key;
     - the mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run.
   - Labels are run- and cycle-qualified, because r31 has both a Cycle 1 and a Cycle 2 critic named C-F2-T.
4. **Fence on the reading.**
   - C-F1-U's gloss, that the doubly-fed class "keeps a strictly positive load margin of exact order `1/m`", holds only through
     three things:
     - the criterion key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`);
     - the composition key `E993-R31-CB-8-SECTOR-CERTIFICATE-…` (`proved_informal`);
     - the explicit Cycle 2 arc values (X-8, X-10), which are STATED and have their own second reads.
   - As registered, the note is an arithmetic inequality. It mirrors the R-1 key's own fence on (v).
5. **Naming.**
   - No new key is proposed or needed. G-7 touches the existing R-1 key, which is present in the run-local snapshot and absent
     from both frozen masters, as expected for an unpublished r31 key.
   - C-F1-U's candidate name
     `E993-R31-CB-8-ONE-MINUS-RHO-1-MINUS-SECTOR-THETA-AT-RANK-16M-PLUS-4-OVER-3-LIES-BETWEEN-11-OVER-25M-AND-13-OVER-25M-ON-THE-RESIDUE-2-CLASS-FROM-107`
     is lexically alias-clear against all three registries: 1431, 1393 and 1399 names and patterns. Its only
     `MARGIN`/`RHO`-type hits are unrelated G1, C3 and path-star keys.
   - I rule that the name should **not** be registered: it would name a corollary of an existing key's face.
   - The registration text below uses no working label: no "R1", "X-11", "N8", "SR-n" as mathematics, and no "`θ*` law" as a
     name.
6. **No struck item is relied on.**
   - I use neither F1's struck `Θ(1/m)` literal nor its `θ = 96/L` typo.
   - I cite none of the controller's replays or frozen censuses. The adjudicator's `[107, 6002]` sweep and the synthesis's
     `0.4545`/`0.4562` rows are consistent with my rows but not used.
7. **Funding (no change).** The synthesis's decision not to fund a formal award stands. X-11 has no Tier 1 consumer, and (v) is
   already formal.

## Registration text

X-11 (SR-C2-6a) is registered **only** through the scope note of G-7 (SR-C2-6b), with no new key and no separate ledger row.
The single text below serves both statements.

```text
SCOPE NOTE ON: E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107
TEXT: [r31 C2; SR-C2-6] Two-sided residual margin including θ (computer_assisted; first stated at r31 Cycle 2 Stage 4; confirmed by an isolated second read). For every integer m >= 107 with m ≡ 2 (mod 3), with p* = (16m+4)/3, ρ_1(m) = r_1(p* − 1)/r_1(p* − 2), r_1(k) = [y^k](1+y)^7(1+2y)^{8m−7} = Σ_{i=0}^{7} C(7,i)·C(8m−7, k−i)·2^{k−i}, L = 200m² + 82m + 5 and θ = 288/L: 11/(25m) <= 1 − ρ_1(m) − θ <= 13/(25m); hence θ/(1 − ρ_1(m)) <= 36/(11m). Certificate: put m = 3p + 107 (p >= 0), K = p* − 1 = 16p + 571, X_j = C(8m−7, K−8+j) and Pd = Π_{s=0}^{7}(16p+564+s); then (1 − ρ_1 − θ)·L·S0·Pd = X_0·Q(p), where S0 = Σ_{j=0}^{7} C(7,j)·2^j·X_j and Q is the degree-9 numerator with all ten coefficients positive of this key's residual proof (the identity is a kernel-checked companion step of this key's governed award, lemma cb8_residual_core, with no grade of its own); each ratio (8p+286−s)/(16p+564+s) lies in [279/571, 143/282] for real p >= 0 (derivative numerator 24s − 64), so (1129/571)^7 <= S0/X_0 <= (284/141)^7; the degree-10 polynomials (3p+107)·141^7·Q(p) − (11/25)·284^7·L·Pd and (13/25)·1129^7·L·Pd − 571^7·(3p+107)·Q(p) have all eleven coefficients positive (exact). Independently re-derived by the second read with a direct certificate: ρ_1 = A/B with A, B explicit degree-8 polynomials in m, and 25m·((B−A)L − 288B) − 11BL and 13BL − 25m·((B−A)L − 288B), both of degree 10, have all coefficients positive after m = 107 + t. No Darroch, no Newton, no LP optimality, no θ* law, no M_0 beyond the class endpoint 107, no asymptotic step. Relation to this key: a quantitative strengthening of conclusion (v) (θ <= 1 − ρ_1), and implied by the bound 15/32 − 1/(8m) <= m(1 − ρ_1(m)) <= 15/32 already on this key's face together with mθ < 36/(25m); both halves are weaker than that face bound; it adds no formal content (this key's formally_verified grade covers (v) as stated, not this note). Fences: an arithmetic inequality on the class only (one rank p*; nothing at m < 107, at m ≡ 0, 1 (mod 3), at other ranks, for d ≠ 8 or for heterogeneous patterns); its reading as a load margin on the u_i-switch images holds only through E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL and E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107 at their own grades, with no status transfer; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN. Attribution: the two-sided bound, the factor-bound lemma and both degree-10 certificates: r31 Cycle 2 critic C-F1-U (of route F1); the degree-9 numerator and the margin identity: this key's governed award residual proof (Residual origins r31 Cycle 1 critics C-T1-F and C-T1-U, as registered on this key); the implying face bound: r31 Cycle 1 critic C-F2-T; θ = 288/L: this key's allocation (r31 Cycle 1 seat T1), first recorded by r30 as a conjecture; r_q, ρ_q and the E1 load ρ_1·γ: r30 (E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, with its named seats as registered); mechanism, weight, relation and (HALL): Codex GPT-6's lower-region run; isolated second read: r31 SR-C2-6.
```

## Verdicts

verdict[SR-C2-6a]: confirmed_with_repairs
verdict[SR-C2-6b]: confirmed_with_repairs

- **SR-C2-6a.** The statement, grade and certificates are confirmed exactly. There are two repairs, both confined to the face and
  the vehicle. The attribution is completed (item 3). The relation to the key's face bound and the fence on the switch-image
  reading are recorded (items 2 and 4).
- **SR-C2-6b.** The key is right, and so is the vehicle: a scope note, with no new key and no alias added. The note's exact text
  is supplied above in place of the synthesis's placeholder "R1 (X-11)".

## Artifact inventory

All scratch files are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-sr-SR-C2-6/`. Everything was
run with `python3 -B` in the foreground, standard library only.

| File | SHA-256 | Role |
|---|---|---|
| `seal.py` | `797573c83a9da9eaf9a594e195657c49515b8edbdbc09c5e54f203f920fa263f` | Capsule seal recomputation plus the 364 member digests |
| `srcdig.py` | `29761cb277895bba6c8cd4c608d9ff90ed29e52dcc70834983b4e9dc7c1d127e` | 338 `sources/` members against their `SOURCE-DIGESTS.json` |
| `sr6_r1.py` | `566c915c1f2fcf99223874a357a06513765ed76b6641975fc70f22501f9414b5` | Own instrument, covering Independent re-derivation §§1–6 |
| `sr6_r1_out.json` | `9ca42d298fbaa1b53fe45ac8fb860bb0693b4bdd8d4425289efe191b13170725` | Its output |
| `alias.py` | `cd6996c102b1e9f12498c1db1d351f1670e1014551146cf55ffce1ce7d2d32a1` | Lexical alias check against the run-local snapshot, the frozen master (491) and the concurrent master (494) |
| `replay/cert_n8.py` | `dd94f15b418a1a8b977e7c262dec6aa358baa7d118678e47b6a224d491a9d187` | Copy-out of C-F1-U's instrument (read and replay only) |
| `replay/cert_n8_out.json` | `2a6da8b0561559f0be738868d4314f3c6a9a1a1e12f149daeb09919d15cdaf48` | Replay output, byte-identical to the frozen `cert_n8_out.json` |

The only other write is this file, `second-reads/SR-C2-6/SECOND-READ.md`. No sealed member was edited.

I reread this file before closing it.
