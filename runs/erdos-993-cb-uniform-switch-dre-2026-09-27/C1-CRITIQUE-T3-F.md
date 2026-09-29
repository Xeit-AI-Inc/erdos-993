# Critique

Critic `C-T3-F` (orientation F, falsify), Cycle 1 Stage 4, r31. Assigned return: seat `T3`, route `C1-T-03`, mechanism token
`ELIG-TOP-BLOCK-MIXTURE-PARENT-DESCENT`, orientation T, obligation (ELIG-top)(a): `i_{p*-1}(CB(8,m)) < i_{p*-2}(CB(8,m))` for every
`m ≥ 107`, `m ≡ 2 (mod 3)`, `p* = (16m+4)/3`.

**Boot.** I booted VerityOS by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file outside this run root. The startup protocol's
memory, module, skill, log and decision steps were not followed, because the dispatch restricts a critic to the two boot reads (the
controller booted for the run). Subsystems loaded: the constitution and the startup protocol only.

Model disclosure (two-part): chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- Dispatch `control/dispatch/c1-stage4/DISPATCH-C-T3-F.md`: I recomputed its SHA-256 as
  `718a078aac1a6098b2d0eb131a9c8d9af1ec25b15228074b2990db4d7ed37965` with `shasum -a 256`. MATCH.
- **Capsule seal** (`control/c1-critic-capsules/T3-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`, sort_keys,
  separators `(",", ":")`, no trailing newline): `b0aa7004fb0cf9e348c45fe8b7e1c5d589d40f457f6e622c70391e0960150706`. MATCH. All 14 member
  files match their listed SHA-256 and byte counts.
- Stage 2 seal: recomputed `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`. MATCH, and equal to the value the return cites.
- Stage 3 packet manifest: its inner seal `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37` recomputes. MATCH. The file digest
  equals the capsule's entry.
- Stage 4 dispatch manifest: its inner seal `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b` recomputes. MATCH.
- Digests the return lists: `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-ALLOCATION.md` and `control/C1-STAGE1-GATE.md` match
  the capsule. `control/C1-WORKER-COMMON-BRIEF.md` (`89a93d95…2b00`) matches the Stage 2 manifest. `sources/authority/CLAIM-IDENTITY.json`
  (`b4a339ef…470b`) matches the Stage 2 manifest and is recomputed. The return's values for `OBLIGATIONS.csv` (`8d8cd511…2880`) and the
  run-local registry equal the Stage 2 manifest's entries. I did not recompute them from those files, which are outside my capsule.
- Return artifacts, copied out to `scratchpad/c1-crit-T3-F/replay/`:
  - `gen_eligtop.py` `589d9e6f…2d833` and `block_mixture_check.py` `19c2d45d…5b58d` match the return.
  - The file digest of `eligtop_rows.json` equals the cited `rows_sha256` `853e3201…7613`.
  - The cited block-check digests `48bfbf4d…9903` (m = 107) and `31c74b7c…e9b1` (m = 110, 113, 116, 200, 500) are digests of the files'
    content without the trailing newline. My copy-out-first replays reproduced both, including a full rerun of the five-row batch
    (143 s).
- Route identity: the route ID, mechanism token and orientation agree with `control/C1-ALLOCATION.md`. The return's model disclosure
  ("Chartered sonnet/high … runtime-reported model id: claude-sonnet-5") agrees with the allocation's charter (Sonnet 5, high).

**Read-boundary disclosure (critic).** I ran one names-only, non-recursive `ls` of
`scratchpad/c1-T3-replay/`, the seat's own replay directory named in the return. It is not one of the return's inventoried
`scratchpad/c1-T3/` artifacts. It showed two filenames, `block_mixture_check.py` and `gen_eligtop.py`. I read neither and used neither.
I also grepped `sources/authority/CLAIM-IDENTITY.json` for the alias check. That file is within my grant, and no recursive search was
run. No other VerityOS file was read. There was no network access, no package install and no background job.

## Independent re-derivation

I built my own instruments, all in `scratchpad/c1-crit-T3-F/`, using the Python standard library and exact integers and `Fraction`s.
The return's scripts are replayed only as a secondary check.

1. **Literal tree, no closed form (`tree_dp.py`).**
   - Method: the tool builds `CB(8,m)` as explicit vertex and edge lists, asserts `n − 1` edges and connectivity (so the graph is a
     tree), and computes `I` with a generic rooted-tree DP.
   - Validation: brute-force subset enumeration matches the DP on `CB(2,1)`, `CB(2,2)`, `CB(3,2)` and `CB(8,1)`.
   - Results: `x` is computed through `α`, with `i = 0` above `α`.
     - `CB(8,95)`: `n = 1618`, `α = 856`, `x = 506`, `p* = 508`.
     - `CB(8,107)`: `n = 1822`, `α = 964`, `x = 570`, `p* = 572`.
     - `CB(8,110)`: `n = 1873`, `α = 991`, `x = 586`, `p* = 588`.
     - `CB(8,113)`: `n = 1924`, `α = 1018`, `x = 602`, `p* = 604`.

     These reproduce the §5 fixed points (`n`, `α`, `x`). The `θ*`, `ρ_1` and `σ` fixed points belong to (L-S)_top and are not
     reached by this route.
   - At all four rows the DP polynomial equals the carried closed form `(1+2x)G^m + x(1+x)(1+2x)^{8m}` coefficient by coefficient.
   - Critic re-derivation of the closed form (elementary): the DP at `r` gives it directly. With `r ∈ B`, the vertices `s` and `u_i` are
     excluded, `v` is free, and every support–leaf pair is free, giving `x(1+x)(1+2x)^{8m}`. With `r ∉ B`, the `s–v` edge gives
     `(1+2x)`, and each choke gives `u_i` in with `x(1+x)^8` or `u_i` out with `(1+2x)^8`, which is `G`.
2. **The return's full census against the literal tree (`census_compare.py`).**
   - All 160 rows `m ≡ 2 (mod 3)` in `[107, 584]` were rerun with the literal-tree DP (10 workers, foreground, 115 s wall).
   - `i_{p*-2}`, `i_{p*-1}` and `Δ` equal T3's `eligtop_rows.json` exactly at every row. The parent descent and (E) hold at every row, and
     `α = 9m + 1` at every row.
   - `p* − x` ranges from 2 to 8: `x = p* − 2` exactly at 107, 110 and 113, and `p* − x = 8` at `m = 584`.
   - Output digest: `census_compare_107_584.json` `d069bafc…1631`.
3. **Block identity against the literal tree (`blocks.py`).**
   - I checked that `Σ_{j=0}^{m} C(m,j) g_j(l_j) + (t_L − t_{L+1}) = i_{p*-2} − i_{p*-1}`, with `L = p* − 2`, `l_j = L − j` and
     `t_L − t_{L+1} = C(8m,L−2)2^{L−2} − C(8m,L)2^L`. It holds against the literal-tree DP at `m = 107, 110, 113, 116, 200`. This is a
     genuinely different code path from the one computing the blocks.
   - Critic identity (exact per-block form, verified term by term at `m ≤ 200`). With `k_i := l_j − i` and `B_j := 8(m−j)+1`:
     `g_j(l_j) = Σ_{i=0}^{8j} C(8j,i)·C(B_j,k_i)·2^{k_i}·(13j − 3 − 3i)/(k_i + 1)`. This is the return's step 6 with the magnitude factor
     made explicit, since `g_0^{(B)}(k) = C(B,k)2^k·(3k + 1 − 2B)/(k + 1)`.
   - At `j = 0` the identity gives `g_0(l_0) = −3·C(8m+1,L)2^L/(L+1) < 0`, which confirms the return's step 5.
4. **Algebra re-derived by hand.**
   - `l_j − μ_j = (j−4)/3`, with `μ_j = 4j + (2/3)(8(m−j)+1)`.
   - The step-5 threshold: `g_0(l) ≥ 0 ⟺ l ≥ (2B−1)/3`, and `l_0 = (16m+1)/3 − 1`.
   - The step-6 split `i* = (13j−3)/3` and `i* − 4j = (j−3)/3`.

   All of these are correct.
5. **Signs.**
   - Blocks `j ≤ 4`, all 966 rows `m ≡ 2 (mod 3)` in `[107, 3002]` (`small_block_signs.json` `8904e7af…7c65`): the sign pattern
     `(g_0,…,g_4) = (−,−,−,+,+)` holds at every row.
   - All `j` at the five `blocks.py` rows: negative only at `j ∈ {0,1,2}`, and no zero.

## Attacks and findings

**F-1 (certification literal, struck).** The return's `identity_check_pass` is tautological. `block_mixture_check.py` compares
`sum_weighted = Σ_j C(m,j)(a_j(l_j) − a_j(l_j+1))` with `main_diff_direct = Σ_j C(m,j)a_j(l_j) − Σ_j C(m,j)a_j(l_j+1)`, both accumulated
in the same loop from the same numbers. It cannot fail, and it never touches `i_k`.

Two statements in the return are therefore false as certification literals and are struck:

- Step 1: "checked against the generator's independent closed-form evaluation of `i_k` at `m=107`".
- Computation (b): "verified against a direct closed-form evaluation — NOT the same code path as (a), an independent cross-check".

The identity itself is TRUE. It is now backed by my literal-tree check in Re-derivation §3, attributed to this critic.

**F-2 (literal, narrowed).** "Verified to hold EXACTLY … `l_minus_mu_formula_verified`" is a floating-point comparison with tolerance
`1e-9`, not an exact one. The identity `l_j − μ_j = (j−4)/3` is exact by two lines of algebra (Re-derivation §4), so it survives as an
algebraic fact. The word "exactly" is struck from the computational claim.

**F-3 (replay defect).** Both replay recipes in the return copy from the replay target itself
(`cp …/c1-T3-replay/gen_eligtop.py …/c1-T3-replay/gen_eligtop_replay.py`), not from the inventoried `scratchpad/c1-T3/`. As written they
are not copy-out-first replays of the shipped artifacts, and they succeed only if that directory was pre-populated by hand. The text
also says "the commands below" for commands that appear above. The artifacts themselves replay correctly when copied from `c1-T3/`
(Identity §).

**F-4 (grades).** The return grades steps 1, 2, 4, 5 and 6 as `proved`. That is a route-verdict word, not a grade of
`SOLUTION-CONTRACT.md` §4. They are first statements at this cycle and so are STATED.

- Steps 1, 4, 5 and 6 are elementary exact algebra. On my re-derivation their mathematics is complete (grade `proved_informal`, pending
  a second read).
- Step 2 uses Newton's inequalities on `P_j`. Its hypotheses are satisfied, but the dependency must be named on its face: modulo Newton.

**F-5 (fence 3 check: passed).** Newton and log-concavity are applied only to `P_j = (1+x)^{8j}(1+2x)^{8(m−j)+1}`, a product of linear
factors with positive coefficients. They are never applied to `I`, `G` or `G^m`.

The return deliberately avoided Darroch altogether. That choice cost it the easy half of the exceptional-set question (F-6).

**F-6 (the exceptional set: reconciling U3's and F3's statements).** The indexing is as follows:

- `j` is the number of chokes in the `x(1+x)^8` state, that is, `u_i ∈ B`.
- The coefficient pair is `(a_j(l_j), a_j(l_j+1))` at `L = p* − 2`.
- "Ascend" means `g_j(l_j) < 0`.

In this indexing:

- `l_j − ⌈μ_j⌉ = ⌊(j−4)/3⌋`, so `l_j ≥ ⌈μ_j⌉` exactly when `j ≥ 4`. For those blocks, Darroch's mode theorem on the real-rooted `P_j`
  (mode ∈ {⌊μ⌋, ⌈μ⌉}) plus log-concavity (Newton) gives `g_j(l_j) ≥ 0`. The Darroch-decidable set is therefore exactly `j ≥ 4`, for every
  `m` in the class.
- `j = 3` sits at `l_3 = μ_3 − 1/3`, below the mean. The split `i* = 12` is the exact centre of `C(24,·)`, which is a knife-edge. The
  leading coefficient of its certificate polynomial cancels (degree 44 against 45 for the neighbouring blocks). Its sign is set by the
  skewness of `Bin(B,2/3)`, and it DESCENDS: `g_3 > 0`. This is proved for every `m ≥ 107` in the class (F-10, B-2).
- F3's summary as given in my attack brief ("`j = 0, 1, 2` ascend, `j ≥ 3` descend") agrees exactly with this.
- U3's summary ("`j ≥ 4` descend, `j ∈ {0,…,3}` ascend") agrees on `j ≥ 4`, which is the Darroch-provable set. It is WRONG at `j = 3`
  if read as a statement about signs: `j = 3` is below its mean but descends. A mean-side classification is not a sign classification.

I have not read U3 or F3. These reconciliations rest only on the brief's one-line summaries and must be checked by the adjudicator
against those returns.

**F-7 (the census).** The census `[107, 584]`, 160 rows, `bounded_computation`, is CONFIRMED exactly by an independent literal-tree
instrument (Re-derivation §2). The return reports its horizon honestly. The `report_sha256` timing defect was self-disclosed and that
digest is not relied on. Only `rows_sha256` is cited, and it reproduces.

**F-8 (composition (E)).** The allocation asks for (E) = (a) + `3p* < 2α + 1`. The return states `x ≤ p* − 2` only at the two fixed
points and never writes the composition for general `m`. It is immediate:

- (a) makes `k = p* − 2` a strict descent, so `x ≤ p* − 2`.
- `3p* = 16m + 4 < 18m + 3 = 2α + 1` for `m ≥ 1`, with `α = 9m + 1` as the degree of the closed form (`deg(1+2x)G^m = 9m + 1 > 8m + 2`).

This is an omission, not an error.

**F-9 (no cut, no obstruction).** No row violates (a). No fence is crossed. The return makes no claim at ranks other than `p*` or
outside the class.

**F-10. Attempted step: the mixture bound (critic-derived advance, attributed to C-T3-F; STATED, needs an isolated second read).**

The return leaves open the magnitude comparison across `j`: "blocks `j ≥ 3` dominate `j ≤ 2`". I closed it for EVERY `m ≥ 107`,
`m ≡ 2 (mod 3)`, with no asymptotic step and no `M_0`, as follows.

**Theorem (critic-derived, STATED).** For every integer `m ≥ 107` with `m ≡ 2 (mod 3)`, `i_{p*−1}(CB(8,m)) < i_{p*−2}(CB(8,m))`.
Consequently `x(CB(8,m)) ≤ p* − 2`, and `p*` is eligible (`x + 2 ≤ p*`, `3p* < 2α + 1`).

**Proof.** Write `m = 3n + 2` with `n ≥ 35`. Put `L = p* − 2 = 16n + 10`, `B = 8m + 1 = 24n + 17` and `M = B − L = 8n + 7`.

- **(B-0)** `S := i_L − i_{L+1} = Σ_{j=0}^{m} C(m,j) g_j(l_j) + (t_L − t_{L+1})`. This is the exact block identity (return step 1;
  re-checked against the literal tree).
- **(B-1) Darroch on the blocks only.** For `6 ≤ j ≤ m`, `P_j` is real-rooted with positive coefficients, its mean is `μ_j`, and
  `l_j ≥ ⌈μ_j⌉` (F-6). Darroch's theorem puts every mode of `P_j` in `{⌊μ_j⌋, ⌈μ_j⌉}`, and Newton's inequalities make the coefficients
  log-concave with no internal zeros. So the coefficients are non-increasing from `⌈μ_j⌉` on, and `g_j(l_j) ≥ 0`.

  Also `0 < l_j` and `l_j + 1 ≤ 8m + 1 = deg P_j` for every `j ≤ m`. Hence `S ≥ S_5 := Σ_{j=0}^{5} C(m,j) g_j(l_j) + (t_L − t_{L+1})`.
- **(B-2) The finite mixture, exactly and uniformly in `n`.** Every term of `S_5/(C(B,L)2^L)` is
  `±2^{−(j+i)+e}·C(8j,i)·C(m,j)·Q(8j, j+i−e)`, where

  `Q(a,c) = C(B−a, L−c)/C(B,L) = ff(L,c)·ff(M,a−c)/ff(B,a)`,

  `ff` is the falling factorial, extended to negative length as a reciprocal rising factorial. The tail contributes
  `Q(1,2)/4 − Q(1,0)`. All `L − c` and `M − a + c` stay positive for `n ≥ 35`, so the binomials are in range.

  So `S_5/(C(B,L)2^L) = N_5(n)/D(n)`, where:
  - `D(n) = ff(B,40)·(L+1)·(M+1)(M+2)⋯(M+5)` is positive for `n ≥ 35`;
  - `N_5` is an explicit polynomial of degree 50 with rational coefficients.

  **Certificate.** Every one of the 51 coefficients of `N_5(n + 35)` is strictly positive, computed exactly
  (`uniform_cert_J5_n35.json` `738da71f…5adc`). Hence `N_5(n) > 0` for every real `n ≥ 35`.

  Cross-checks:
  - `N_5/D` equals `S_5/(C(B,L)2^L)` computed directly from binomial sums at `n = 35, 36, 40, 60, 100`.
  - The shift was checked by evaluation.
  - `J = 6` also certifies (`uniform_cert_J6_n35.json` `becdb7b8…4f86`).
- **(B-3)** `S ≥ S_5 > 0`. ∎

**Corollary (critic-derived, STATED): the exceptional set is exactly `{0,1,2}` for every `m ≥ 107` in the class.** The same construction,
applied block by block (`block_sign_cert.py`, output digest `9980a1fa…794d`), gives these sign-definite polynomials in `n ≥ 35`:

- `g_0`, `g_1` and `g_2` have `N^{(j)}(n+35)` with all nonzero coefficients negative, so each is `< 0` for all `n ≥ 35`.
- `g_3`, `g_4` and `g_5` have all nonzero coefficients positive, so each is `> 0` for all `n ≥ 35`.
- Every `j ≥ 6` has `g_j ≥ 0` by (B-1). Every `j ≥ 6` is also strictly positive at the tested rows.

This settles the return's "Remaining obligation" items 1–3. The mixture needs no Hoeffding bound and no `J_0` search: `J = 5` works
uniformly down to `m = 107`. At `m = 107` the least `J` with `S_J > 0` is exactly 5, and the relative margin `S/i_{p*−2}` is about
`1.67·10⁻³`.

**Dependencies, named on the face.**

- Darroch's mode theorem and Newton's inequalities, applied only to `P_j`, `j ≥ 6`. These are classical external theorems, not under
  `sources/`. This is the same dependency class as the carried favorability and E1 keys.
- The closed form of `I(CB(8,m))`: a registered node, and re-derived elementarily above.
- One exact computer-algebra certificate. It is uniform in `n`, not a census.

**Suggested grade.** `proved_informal` modulo Darroch/Newton on products of linear factors, with a computer-verified exact polynomial
certificate, subject to the isolated second read that `SOLUTION-CONTRACT.md` §4 requires of a statement first made at a review stage.

**Candidate key** (a predicate; not registered by a critic):
`E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-PARENT-DESCENT-AT-RANK-16M-PLUS-4-OVER-3-MINUS-1`.

- **Lexical alias check** against `sources/authority/CLAIM-IDENTITY.json` (491 claims), for the terms
  `PARENT-DESCENT|TOP-RANK|CB-8|CB-D|ELIG|BLOCK`: no key names a CB(8,m) parent descent.
- **Mathematical alias check:**
  - `E993-R30-CB-AT-MOST-SIX-SUPPORTS-…` is a LOWER bound on `x` for `d ≤ 6`. It is a different object and a different `d`.
  - The `d ≥ 6` favorability key concerns `Δ_{p*}(T − w)`, not `I(T)`.
  - `E993-ZERO-EXTENDED-BINOMIAL-BLOCK-RISE-FALL-STRICT-RISE` concerns the path-star family.
  - None states or implies this theorem.

**The Darroch-free and formal path.** A Lean award could carry three pieces:

- (B-0) as a finite sum identity;
- (B-2) as the positivity of one explicit degree-50 polynomial with positive coefficients after a shift, which reduces to `positivity`
  after `n = n' + 35`;
- (B-1) as the only analytic input.

Replacing (B-1) by an integer argument is U3's natural target.

## Mechanism-equivalence and fence check

- The return's mechanism is the block decomposition of the carried closed form with log-concavity on each block. It is not the struck
  r30 argument, which applied Darroch to `I`, and it is not any refuted mechanism in fence 6.
- My advance uses the same decomposition, with Darroch strictly on the blocks.
- Neither the return nor this critique revives forest real-rootedness (`E993-TREE-REAL-ROOTED` stays REFUTED).
- The census is used only as a test and never as proof (fence 7). The theorem above rests on (B-0)–(B-3), not on the 160 or 966 rows.
- Scope is one rank per tree (`p*`) and the class only (`m ≥ 107`, `m ≡ 2 (mod 3)`, `d = 8`).
- The `θ*` law, the LP and (L-S)_top are not touched, and no status transfers to (HALL), the aggregate keys or #993.
- Attribution: the closed forms and the block decomposition come from r30 (as registered). The reduction steps 1–6 and the `j = 0`
  proof come from seat T3. The exact per-block factor identity, the Darroch range `j ≥ 4`, the uniform certificate and the
  exceptional-set corollary come from critic C-T3-F.

## Certification audit

| Literal in the return | Status |
|---|---|
| Stage 2 seal, source digests | backed (recomputed) |
| fixed points `x = 570` (m=107), `506` (m=95), `n`, `α` | backed (critic literal-tree DP) |
| census `[107,584]`, 160 rows, all hold; `rows_sha256` `853e3201…` | backed (file digest; literal-tree equality at all 160 rows) |
| `identity_check_pass: true` as an independent check of the block identity | **STRUCK**: tautological (F-1); the identity is true on critic evidence |
| "checked against … independent closed-form evaluation of `i_k` at m=107" | **STRUCK** (F-1) |
| `l_minus_mu_formula_verified` "EXACTLY" | **narrowed**: a float check; the identity is exact by algebra (F-2) |
| block-check digests `48bfbf4d…`, `31c74b7c…` | backed (replayed; digest of the newline-stripped output) |
| `exceptional_j_values = [0,1,2]` at six rows | backed; now superseded by the critic corollary (all `m` in the class) |
| "`report_sha256`" | not evidence (timing field; self-disclosed) |
| replay recipes | **defective** (F-3): they copy from the target directory |
| grade word `proved` (steps 1, 2, 4–6) | **re-labelled**: STATED; `proved_informal` on my re-derivation (step 2 modulo Newton) |
| gate `ELIG_top: advanced` | fair for the return's own content |

The return's `## Remaining obligation` was an exact and honest statement of the open step, but it is now superseded (see below).

## Verdict

verdict: retained_narrowed
headline_resolved: no

`LS_top: not_advanced`
`ELIG_top: advanced`
`cut_candidate: none`

These parts of the return are retained:

- the exact block reduction (steps 1, 4, 5, 6) and the log-concavity of each `P_j` (step 2, modulo Newton);
- the `j = 0` theorem;
- the census `[107, 584]` at `bounded_computation`;
- the route label `bounded_evidence`.

The narrowing strikes the tautological "independent cross-check" literals and the "exact" float check, flags the replay recipes as
defective, and re-labels the grade words.

In prose: the critic-derived theorem above (the parent descent at `p*` for every `m ≥ 107`, `m ≡ 2 (mod 3)`) has, in my assessment,
complete mathematics at grade `proved_informal` modulo Darroch/Newton on the blocks `P_j`, `j ≥ 6`, with one exact polynomial
certificate. It is a Tier 2 lemma, not the headline, and it needs an isolated second read.

## Remaining obligation

A successor inherits the following:

1. **An isolated second read** of the critic-derived theorem: (B-0)–(B-3), the per-block factor identity, the rational-function
   construction of `N_5`/`D`, and the claim that every coefficient of `N_5(n+35)` is positive. The reader should rebuild `N_5` with an
   independent instrument (for example, a different common denominator, or direct interval evaluation) rather than rerunning
   `uniform_cert.py`.
2. **Discharge or formalize (B-1)** for `j ≥ 6`, which currently rests on Darroch and Newton. Two routes are open:
   - a Darroch-free integer proof that `a_j(l) ≥ a_j(l+1)` for `l ≥ ⌈μ_j⌉` (U3's route);
   - a Lean award carrying (B-0), (B-2) and (B-1).
3. **Registration** of the candidate `E993-R31-` predicate, after the second read, against the then-current run-local registry.
4. **(E) as a statement:** compose (a) with `3p* < 2α + 1` and `α = 9m + 1`. This is trivial, but it must be written on the face of any
   award.
5. **Nothing here touches (L-S)_top or (H).** Tier 1 remains open.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-T3-F/`. All
tools use the Python standard library only. Every invocation was `python3 -B`, run in the foreground, and no background job was
started.

| File | SHA-256 | Role |
|---|---|---|
| `tree_dp.py` | `6d37d222970abac08a0cf6a32e8b9737f29619fc79aa9246e0db7a731cf1e972` | literal-tree DP, `α`, `x`, (a), (E), closed-form comparison |
| `tree_dp_rows.json` | `6119852654fe715285672fc4c2cbf9c5b5728db491ec928f1bccf488c5202328` | m = 95, 107, 110, 113 |
| `census_compare.py` | `b3fc6a43c6b49676cee7945f3856f5cda64f8d076d43d38553da91f535f2ea9c` | T3 census vs literal tree, 160 rows |
| `census_compare_107_584.json` | `d069bafcce92441b993244c14ad7dea4c361ad4c0dff3e6e31ba2b2c23661631` | result (no mismatches) |
| `blocks.py` | `75a9c524c7813a1d1fc3ef2beee2cc5d582f086f60e13850c6b024bca606981d` | block identity vs literal tree; factor identity; signs; least `J` |
| `blocks_rows_a.json` | `b4c9e6c7aa6f892f1fd335e38a96d666f6a4d8ddc49a29fa3577a55cfb55a31b` | m = 107, 110, 113, 116, 200 |
| `small_block_signs.json` | `8904e7afd282786f17ab32c538f1e3580a01d1756a2e32263444add255ec7c65` | signs of `g_0..g_4`, 966 rows to 3002 |
| `uniform_cert.py` | `b91e3e1753d603bc6a0a4377890b0c6d1ab6065805b3ac06912b9bec1997f52d` | the uniform certificate `N_J`, `D` |
| `uniform_cert_J5_n35.json` | `738da71f20661f5f3d0b37d7101f5b3154ecb647da4fea1af1cb07d1ba4c5adc` | J = 5: all shifted coefficients (the certificate) |
| `uniform_cert_J6_n35.json` | `becdb7b8effb55a3284aa3e152d9f22dc215c69dda3ff3324b3ecf1fa2744f86` | J = 6 (redundant confirmation) |
| `block_sign_cert.py` | `1ea7aa686bf79c7682e6113ae0a0cafc2c91b10cc943a4feb251f307da84cc35` | per-block sign certificates, j = 0..5 (stdout digest `9980a1fa…794d`) |
| `replay/` | copies of T3's five inventoried artifacts, plus `out107.json` and `outmulti.json` (replays; identical to the shipped outputs) | copy-out-first replay |

**Replay (copy-out-first; the target is the critic scratch).**

```
S=/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-T3-F
mkdir -p $S-replay && cp $S/*.py $S-replay/ && mkdir -p $S-replay/replay && cp $S/replay/eligtop_rows.json $S-replay/replay/
cd $S-replay
python3 -B tree_dp.py 95 107 110 113
python3 -B census_compare.py 107 584
python3 -B blocks.py 107 110 113 116 200
python3 -B uniform_cert.py 5 35
python3 -B uniform_cert.py 6 35
python3 -B block_sign_cert.py
```
