# Second Read

Isolated second read **SR-6**, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`), Cycle 1. The object is the leg-type and
leg-count template failure: synthesis S7 and registration R-6. Written 2026-09-28.

**Model disclosure (two-part):** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and loaded nothing else. My first combined print failed on a zsh `=====`
separator, so I re-read the startup protocol on its own. The controller owns conversation logging and durable updates. This read
writes only this file and scratch under `scratchpad/c1-sr-SR-6/`.

## Identity and seal audit

- **Protocol.** `control/C1-SECOND-READ-PROTOCOL.md` has SHA-256
  `cf04330bda4754d2238010497e57251fc0aec70003dd8d85847c5a56ccafc18c`. **MATCH** with the digest I was given. I checked it before
  reading anything else.
- **Brief.** `control/C1-SECOND-READ-BRIEF-SR-6.md` has SHA-256
  `721763453d7b39b072f989813d2233d9f7c57ace2f3acafca9640d02a4240222`. **MATCH.**
- **Capsule.** `control/c1-second-read/SR-6-PACKET-MANIFEST.json`, stage `cycle-1-second-read-SR-6`.
  - I recomputed the inner seal as the SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`, with no
    trailing newline: **`9c53291aec5b86761097ef5c9b3cb400e50cd631c6874f00ba6cce226c37b21e`. MATCH.**
  - The whole-file SHA-256 is `9dcaa6e8…d729`. That is not the seal, and I did not use it as one.
  - **194/194** members match both byte count and SHA-256, with 0 missing and 0 mismatched (`verify_seal_out.txt`).
- **Frozen instruments.** Every file listed in `sources/c1-stage7-sources/SOURCE-DIGESTS.json` matches its digest: 924 files, 0
  mismatches. I checked this before opening any instrument. See read-boundary disclosure 3.
- **Registries.** The run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c1-stage2.json` and the frozen master
  `sources/authority/CLAIM-IDENTITY.json` are byte-identical (`b4a339ef…`). Each has 491 claims and 491 distinct keys.
- **Seat disclosures on the origin faces.**
  - T2: chartered sonnet/high, runtime id `claude-sonnet-5`.
  - C-T2-F and C-T2-U: chartered opus/medium, runtime id `claude-opus-5-5`.
  - The T adjudicator and the synthesis: chartered opus/high, runtime id `claude-opus-5-5`.
  - C-T2-F discloses one harness-backgrounded run that it stopped by task id. It used no output from that run.
- **Read-boundary disclosures.**
  1. The harness injected the project `CLAUDE.md` and the user auto-memory index into my context. I did not fetch or use either.
     Following the brief's write confinement, I wrote no conversation log.
  2. The harness saved my first print of the manifest to its own tool-results file outside the run root. I did not read that file
     back; I parsed the manifest with my own script instead.
  3. My digest script hashed the bytes of every file listed in `sources/c1-stage7-sources/SOURCE-DIGESTS.json`. That is 924 files,
     about 821 of them outside my capsule, such as other seats' instrument directories. It printed only counts, and I opened no
     non-member for content.
  4. I ran one `ls -la` of `sources/c1-stage7-sources/C-T2-F/`, a capsule directory. It showed the member names, a `replay`
     subdirectory and the parent entry's metadata.
  5. I ran `grep`s inside capsule members only: the T adjudication and my own scratch.
  6. I used no network, no installs, no Lean/`lake` and no background jobs, and I killed nothing. All computation was foreground
     `python3 -B`, standard library only, with exact integers and `Fraction`s.

## Statements read

- **SR-6a (C-T2-F F-2).** Hypothesis: `pb(β,γ) = f_b(β+γ)` and `pc(β,γ) = f_c(β+γ)`, for any `σ` and `θ`. Conclusion: the template's
  Out/In system is infeasible for every class `m`, with `max_{all-c targets} In ≥ (p*/K)·min_{pure sources} Out`.
  - The origins line of the brief also names "per-row Farkas certificates at `m = 107, 110, 113`". On C-T2-F's face these are the
    certificates of **F-3**, the β/γ-separated family `pb = f_b(β)`, `pc = f_c(γ)`. They are not certificates of F-2. Synthesis S7
    labels them correctly ("β/γ-separated").
- **SR-6b (C-T2-U Theorem N, a node).** Statement: on a deletion-deficient sector (`R_K > R_{K−1}`), every choke-local template that
  satisfies Out and In has a lone-`b` discount at some `γ ∈ {1..7}`. Its corollary is the leg-count no-go. Also checked: the
  switch-budget floor (B) does not enter the registration.
- **SR-6c (R-6).** Proposed key
  `E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-WITH-RATES-DEPENDING-ONLY-ON-LEG-TYPE-AND-CHOKE-LEG-COUNT-IS-INFEASIBLE-ON-THE-RESIDUE-2-CLASS-FROM-107`,
  grade `proved_informal`, marked "optional".
- **Faces read.** SEMANTIC-CONTRACT, SOLUTION-CONTRACT, the T2 return, both T2 critiques, the T adjudication's T2 section and its R6
  section, synthesis S7, R-6 and the struck lists, the Stage 5 and Stage 6 controller facts (as facts only), the alias pre-screen
  (not my verdict), the C-T2-F Farkas and cutplane scripts and data, and the T adjudicator's allocation table (as a prior).
- **Not used as evidence.** Controller replays, CF6-7, CF-T-4 and any frozen census.

## Independent re-derivation

My instrument is `sr6_instrument.py`, written for this read; its output is `sr6_output.json`, with 0 failures. It shares no code
with any seat, critic, adjudicator or r30 instrument. It reads C-T2-F's JSON and the adjudicator's table as data only.

**Template of record** (SEMANTIC-CONTRACT §2):
- A sector source is `{r,v}` plus `K = p*−1` legs, each in state `b` or `c`.
- `Out(B) = Σ_i [β_i pb(β_i,γ_i) + γ_i pc(β_i,γ_i) + [β_i=1, γ_i≥1] σ(γ_i)]`.
- For an in-sector target `A` with `K−1` legs: `In(A) = Σ_{i: n_i<8} (8−n_i)(pb(β_i+1,γ_i) + pc(β_i,γ_i+1))`.

**Class identities.** Exact, symbolic, and re-asserted for every class `m` in `[107, 2999]`, which is 965 rows:
- `3K = 16m+1` and `2(8m−K+1) = p*`;
- `3p* = 16m+4 < 18m+3 = 2α+1`;
- `1 ≤ K ≤ 8m`;
- `N_{K−1}/N_K = K/(8m−K+1) = 2K/p* = (16m+1)/(8m+2) < 2`, with `N_j = C(8m,j)`;
- `R_K/R_{K−1} = p*/(p*−1) > 1`, with `R_j = 2^j C(8m,j)`.

There is no ℕ-subtraction hazard: `K−n`, `K−1−γ` and `8m−8` are used only through `C(a,b) = 0` outside `0 ≤ b ≤ a`.

**SR-6a, the Farkas combination.** It puts weight 1 on every all-`c` source and every all-`b` source, and weight 1 on every all-`c`
target. These are the two pure source layers of the brief ("the two assignments").
- *Pure sources.* A pure source has no `(1, γ≥1)` choke, so `Out` there is deletion only, whatever `σ` is.
- *c-part.* The `c`-part of `In` at an all-`c` target is `Σ_i (8−γ_i) f_c(γ_i+1)`. Double counting the `c`-deletion arcs between the
  all-`c` layers turns it into `Σ_{all-c B} Out(B)`.
- *b-part.* The `b`-part is `Σ_i (8−γ_i) pb(1,γ_i) = Σ_i (8−γ_i) f_b(γ_i+1)`. Relabelling `b↔c` maps all-`c` targets bijectively onto
  all-`b` targets, and this sum becomes `Σ_{all-b B} Out(B)`.
- *Profile level, every `m`.*
  - The coefficient of `f_c(n)` or `f_b(n)` on each side is `m·C(8,n)·n·C(8m−8,K−n)`, because `C(8,n−1)(9−n) = n·C(8,n)`.
  - My instrument checks this coefficientwise for all `n = 1..8` at all 965 class rows, with 0 failures.
  - It also checks the profile formula against direct enumeration at `(m,K) = (2,3), (2,5), (3,4)`.
- *Contradiction.* The combination gives `Σ_{all-c A} In = Σ_{pure} Out ≥ 2N_K·min Out`, while there are `N_{K−1} < 2N_K` all-`c`
  targets.
  - So `max In ≥ (2N_K/N_{K−1})·min Out = (p*/K)·min Out`.
  - My instrument returns `2N_K/N_{K−1} = p*/K` exactly: `572/571, 588/587, 604/603, 860/859, 15980/15979` at `m = 107, 110, 113,
    161, 2996`.
- *What the proof does not use.* It uses no Switch, no Residual, no `σ`, no `θ` and no sign condition on `f_b` or `f_c`. It uses no
  Darroch, no Newton, no asymptotics and no `M_0`.
- *Flat case.* At `p = 1/K`, `In = 2p(8m−K+1) = p*/K` exactly at 107, 110 and 113. So the flat family attains the forced ratio, as
  C-T2-F says.

**Literal laboratories.** These are structural checks only, out of class: `CB(8,2)` with `K = 3, 4` and `CB(8,3)` with `K = 3`. They
use the literal tree (labels `0=r, 1=s, 2=v, u_i=3+17i, b_ij=u_i+1+2j, c_ij=u_i+2+2j`), literal (D) ∪ (S) arcs and the literal
active-tag weight with `F = leafSet`. Each check passed at every size:
- sector members are exactly the leg-state assignments, and their count is `2^K C(8m,K)`;
- every sector member and every in-sector target has weight 1;
- every leg deletion lands in the sector;
- every other arc out of a sector source has target weight 0, except the `u_i` switch at a `(1,γ)` choke, whose image has weight `γ`;
- no pure source has a positive-weight arc other than a leg deletion;
- the per-state `In` formula equals the literal inflow under random full-state rates;
- `Σ_sources Out_del = Σ_targets In`;
- the F-2 identity `Σ_{all-c targets} In = Σ_{pure sources} Out` holds literally under random leg-count rates.

**SR-6b, Theorem N.** I checked the proof line by line.
- *Hypothesis.* Suppose (N) fails at every `γ = 1..7`, so that `Out_del(1,γ) ≥ min{Out_del(β',γ') : β'+γ' = 1+γ, β' ≠ 1}`.
- *The twin.* Replace each `(1,γ≥1)` choke of a source `B` by a minimizing switch-free state with the same leg count. A state
  `(0,1+γ)` always exists and `1+γ ≤ 8`, so the twin `B'` is a sector source with `Σ n_i = K` and no switch-capable choke.
- *Out.* Out at `B'` gives `Out_del(B) ≥ Out_del(B') ≥ 1` for every source. Hence `Σ_sources Out_del ≥ R_K`.
- *In.* The exact double count, confirmed literally above, gives `Σ_sources Out_del = Σ_{in-sector} In ≤ R_{K−1} < R_K`. This is a
  contradiction.
- *What it uses.* Out and In only. It never uses Switch, Residual or the E1 loads.
- *Corollary.* For rates `f_b(n), f_c(n)`, `f_b(n) + γ f_c(n) = (1/n)·n f_b(n) + (γ/n)·n f_c(n)`. This is a convex combination of the
  deletion outflows of the switch-free states `(n,0)` and `(0,n)`, both with `β' ≠ 1` because `n ≥ 2`. So (N) fails at every `γ`,
  which proves SR-6a a second time.
- *Random check.* 2000 random rate pairs gave 0 cases where (N) holds under leg-count rates.
- *Type of statement.* (N) is a necessary condition on per-state rates. It names no `X` and no deficiency in the network, so it is a
  statement about templates, not a cut.
- *Prior, not evidence.* The adjudicator's table (`7d635805…`) satisfies (N) strictly at all seven `γ`, and also
  `pb(1,γ) < pb(γ+1,0)`, at 107, 110 and 113.

**Switch-budget floor (B).** I re-derived C-T2-U's proof.
- *Counting.* The number of `u_i`-switch images of weight `γ` is `N_γ = m·C(8,γ)·2^{K−1−γ}·C(8m−8,K−1−γ)`, and each has `8−γ`
  preimages.
- *Inequality.* `Σ Out ≥ R_K`, `Σ Out_del ≤ R_{K−1}` and `Σ Out_sw ≤ θ Σ γ N_γ`, so `θ ≥ θ_budget := (R_K − R_{K−1})/Σ_γ γ N_γ`.
- *Closed-form denominator.* `m(8[y^{K−2}](1+y)^7(1+2y)^{8m−8} − 8·2^{K−9}C(8m−8,K−9))`. It agrees exactly at 95, 107, 110 and 113.
- *Exact value.* `θ_budget(107) = 36132547728/342577655754191`, which reproduces C-T2-U's face exactly.
- *Normalized values.* `θ_budget·m² = 1.2071, 1.2076, 1.2076, 1.2077` at 95, 107, 110, 113. The ratio of the `θ*` law to the budget
  is `1.1878` to `1.1880`.

**Per-row Farkas replays** (F-3, the β/γ-separated relaxation; `σ ≥ 0` free; Switch and Residual dropped).
- *Method.* For each row I parsed C-T2-F's cutplane configurations and multipliers as data and validated every profile: `m` chokes,
  total `K` or `K−1`, and `β+γ ≤ 8` per state. I then built the Out and In rows with my own code over the 23 variables
  `f_b(1..8)`, `f_c(1..8)` and `σ(1..7)`, and checked:
  - `y, z` are nonnegative integers;
  - `Σ y·OutRow ≤ Σ z·InRow` holds coefficientwise;
  - `Σy > Σz`.
- *Results.* All three are valid, and their sums and support lists equal the JSON.

| m | sources/targets | support | σ columns | Σz/Σy | valid |
|---|---|---|---|---|---|
| 107 | 19/18 | 8/5 | all 0 | 571/572 | yes |
| 110 | 21/20 | 5/6 | all 0 | 587/588 | yes |
| 113 | 16/15 | 5/5 | all 0 | 603/604 | yes |

- *Grade.* `computer_assisted`, per row. The certificate is self-verifying, and my arithmetic is the second instrument for its
  validity.
- *Record only.* Each exact ratio `Σz/Σy = K/p*` equals F-2's forced ratio. This is an observation, not a claim.

**Alias check (own scan, `alias_scan.py`).**
- The proposed key is absent from both registries.
- The key triggers no `aliases` entry and no `alias_patterns` regex.
- No registered key contains `LEG-TYPE`, `LEG-COUNT`, `CHOKE-LEG`, `ALLOCATION`, `TEMPLATE`, `INFEASIBLE` or `E993-R31`.
- Mathematical neighbours:
  - `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` is deletion-only. It does not imply this key, because switch arcs can cover the
    deficit and feasible full-state tables exist. See distinction row SR-6-D1.
  - `E993-R30-CB-8-M-95-TO-107-…-WITH-LOAD-BEARING-SWITCH-ARCS` uses full-state rates and is consistent with this key at `m = 107`.
    See distinction row SR-6-D2.
  - `E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-…` covers `d ≤ 6` deletion-only, which is unrelated.
- No REFUTED key concerns templates or chokes.

## Findings and repairs

1. **F-2 is correct, uniformly on the class** (SR-6a). The Farkas combination is the two pure source layers against the all-`c`
   target layer, joined by the `b↔c` relabelling. The identity is exact for every `m`, and the gap is `2N_K − N_{K−1} = N_K(p*−2)/p*
   > 0`. There is no `M_0` and no omitted range.
2. **Repair: where the per-row certificates attach.** The three Farkas certificates at 107, 110 and 113 certify F-3, the β/γ-separated
   family. They do not certify F-2, which needs no finite certificate. They are recorded separately as `computer_assisted` per-row
   facts (RECORD SR-6-R1), not as a node of R-6. The synthesis S7 wording is already correct; the brief's origins line conflates the
   two.
3. **Theorem N is correct** (SR-6b).
   - It is a necessary condition on templates, and it uses Out and In only.
   - Its hypothesis `R_K > R_{K−1}` holds on the class at `p*`.
   - It is not a cut and makes no (HALL) statement.
4. **Repair: the stated reason for not registering `θ_budget`.** S7 says the floor has "no exact form on any face I hold". C-T2-U's
   face does carry an exact form, the rational `(R_K − R_{K−1})/Σ γN_γ` with a closed-form denominator, and I reproduced it exactly.
   - Only the gloss `≈ 1.21/m²` and the limit `19683/16256` are heuristic.
   - Non-registration **under R-6** is still correct, because R-6 does not state the floor and the floor uses Switch.
   - The corrected reason is: "not proposed by the synthesis; outside R-6; it would need its own key and read."
   - I propose no registration text for it.
5. **Observations, not registered.** Both are first made at this read, so neither goes into the registration text.
   - *Weaker hypothesis.* F-2's proof uses its hypothesis only through `pb(1,γ) = pb(γ+1,0)` for `γ = 1..7`, or symmetrically through
     `pc(β,1) = pc(0,β+1)`. The rates are otherwise unconstrained.
   - *Literal network.* On the literal network, pure sources have no positive-capacity arc other than an in-sector leg deletion, by
     the structural argument and the laboratories above. So the same combination excludes any literal rational flow whose sector
     deletion-arc values depend only on (leg type, choke leg count).
6. **Struck literals stay struck.** T2's "both sides worse" and its §7 alias statement are still struck; none of them enters here.
   T2's two proposals are absorbed as follows:
   - the constant-rate proposal becomes a special case in SCOPE;
   - the Jensen proposal is a technique statement, is not registrable, and is not an alias.
7. **Key predicate** (SR-6c).
   - The name is a true predicate of the statement. It is class-scoped ("ON-THE-RESIDUE-2-CLASS-FROM-107", "TOP-RANK") with no
     FOR-EVERY-M, and it contains no working label.
   - "SECTOR-ALLOCATION WITH RATES" is fixed on the face as the r30 choke-local template's `pb` and `pc`.
   - Grade `proved_informal`: the proof is complete and elementary, with no carried dependency.
   - Status `VERIFIED`.
   - The fence "a template failure, not a deficient cut; says nothing about (HALL)" is on the face.
   - The deficit-key scope note that the synthesis lists under R-7 concerns T2's deletion-only statements, which fall under this read.
     I confirm it: at `t = 1`, `3p* = 16m+4 < 16m+5 = 2dm+5`, and the maximal deficit `R_K − R_{K−1} > 0` is attained on the whole
     sector. Its text is below.

## Registration text

```text
KEY: E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-WITH-RATES-DEPENDING-ONLY-ON-LEG-TYPE-AND-CHOKE-LEG-COUNT-IS-INFEASIBLE-ON-THE-RESIDUE-2-CLASS-FROM-107
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let m >= 107 with m = 2 (mod 3), T = CB(8,m) (the path r - s - v; chokes u_1..u_m adjacent to r; supports b_ij adjacent to u_i; one private leaf c_ij adjacent to each b_ij; n = 17m+3, alpha = 9m+1), p* = (16m+4)/3 and K = p* - 1. The root-plus-arm sector {B in I_{p*+1}(T) : r, v in B} consists of {r, v} plus K legs, each leg in state b or c; a choke in state (beta, gamma) has beta legs in state b and gamma in state c. A choke-local sector template (the r30 certificate form) puts nonnegative pb(beta,gamma) on each b-deletion and pc(beta,gamma) on each c-deletion at a choke in state (beta,gamma), sigma(gamma) on the u_i-switch at a choke in state (1,gamma), and 0 on every other sector arc; Out(B) = sum_i [beta_i pb(beta_i,gamma_i) + gamma_i pc(beta_i,gamma_i) + [beta_i = 1, gamma_i >= 1] sigma(gamma_i)] and, for an in-sector target A (K - 1 legs), In(A) = sum over chokes with beta_i + gamma_i < 8 of (8 - beta_i - gamma_i)(pb(beta_i+1,gamma_i) + pc(beta_i,gamma_i+1)). If pb(beta,gamma) = f_b(beta+gamma) and pc(beta,gamma) = f_c(beta+gamma) for any functions f_b, f_c on {1..8}, then for every sigma and every theta no such template has Out(B) >= 1 for every sector source B and In(A) <= 1 for every in-sector target A; quantitatively, max over all-c targets of In >= (p*/K) * min over pure (all-b or all-c) sources of Out, and p*/K > 1. Proof: pure sources have no (1, gamma >= 1) choke, so their outflow is deletion only; double counting the c-deletion arcs between the all-c layers gives sum over all-c targets of the c-part of In = sum over all-c sources of Out; the b-part of In at an all-c target is sum_i (8 - gamma_i) f_b(gamma_i + 1), which the b<->c relabelling of all-c targets onto all-b targets turns into sum over all-b sources of Out; hence sum over the N_{K-1} all-c targets of In = sum over the 2N_K pure sources of Out >= 2N_K * min Out, with N_j = C(8m, j) and N_{K-1}/N_K = K/(8m - K + 1) = 2K/p* = (16m+1)/(8m+2) < 2 exactly (3K = 16m + 1, 2(8m - K + 1) = p*). Node (the lone-b discount; necessary for every choke-local template satisfying Out and In on the class, whatever its rates): some gamma in {1..7} has pb(1,gamma) + gamma pc(1,gamma) < min{beta' pb(beta',gamma') + gamma' pc(beta',gamma') : beta' + gamma' = 1 + gamma, beta' != 1}. Proof: otherwise replace every (1,gamma) choke of a source B by a switch-free state of the same leg count with minimal deletion outflow; the twin is a sector source with no switch, so Out >= 1 there forces the deletion outflow of B to be >= 1; summing, the total sector deletion outflow is >= R_K := 2^K C(8m,K), while it equals the total In over in-sector targets, which is <= R_{K-1}, and R_K/R_{K-1} = p*/(p* - 1) > 1. For rates depending only on the leg count, f_b(n) + gamma f_c(n) (n = 1 + gamma) is a convex combination of n f_b(n) and n f_c(n), the deletion outflows of the switch-free states (n,0) and (0,n), so the discount fails at every gamma: a second proof of the statement. Neither argument uses Switch, Residual capacity, sigma, theta, Darroch, Newton or any asymptotic step; there is no M_0.
SCOPE: CB(8,m), every m >= 107 with m = 2 (mod 3), at the one rank p* = (16m+4)/3 only; template level only (the Out and In constraints of the r30 choke-local sector certificate); every f_b and f_c (no sign condition used), every sigma, every theta. It contains as special cases the flat-rate and symmetric-quadratic families of r31 Cycle 1 route C1-T-02 (T2), including the all-c witness source that shows the switch cannot rescue a flat rate. Not covered: the beta/gamma-separated family pb = f_b(beta), pc = f_c(gamma), which is infeasible only at m = 107, 110, 113 by per-row certificates (record SR-6-R1, computer_assisted), not uniformly. The switch-budget floor of C-T2-U is not part of this key.
ATTRIBUTION: C-T2-F (Claude Opus 5.5; r31 Cycle 1 Stage 4 critic of route C1-T-02; the type-and-count double counting, the quantitative ratio p*/K and the statement of this key); C-T2-U (Claude Opus 5.5; the lone-b discount node, its leg-count corollary, and the completion of the flat case for every rate); T2 (Claude Sonnet 5; r31 Cycle 1 route C1-T-02; the flat-rate case with its all-c witness source and the identity 2(8m - K + 1) = p*); the r31 Cycle 1 T adjudicator (Claude Opus 5.5; line-by-line check of both proofs); the r31 Cycle 1 synthesis (Claude Opus 5.5; the registration proposal); isolated second read SR-6 (Claude Opus 5.5; own profile-level identity at every class m < 3000, literal laboratories, proof re-derivation). The choke-local sector certificate method: C-T1-U (Claude Opus 5.5; r30 Cycle 4), as registered on E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS, and its generalization by the r30 Cycle 5 T2 method (Claude Sonnet 5); the sector deletion deficit R_K - R_{K-1}: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT, as on its face. The transport network, the active-tag weight, the relation (D) union (S), (HALL) and the CB family: Codex (GPT-6), the lower-region run and its corrections; the CB record: r30 (R30-CB-RECORD).
FENCES: A template failure, not a deficient cut: it names no X in I_{p*+1}(T) with sum_X w_F > sum_{N(X)} w_F and says nothing about (HALL) at (CB(8,m), p*) or anywhere; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. It does not bear on the r30 per-state tables or on any allocation whose rates depend on the full choke state (beta, gamma); a feasible allocation must be genuinely two-dimensional in (beta, gamma). One rank per tree and the class only: nothing at other ranks, at m = 0 or 1 (mod 3), at m < 107, for d != 8 or for heterogeneous CB. No status transfer to E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta or Erdos #993. Not E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT (distinction row SR-6-D1). No Darroch or Newton; the theta* law is not used; no census value enters; no refuted mechanism is revived (the flat per-leg rate is shown infeasible, not proposed).
ALIASES: E993-R31-CB8-TOPRANK-SECTOR-ALLOCATION-DEPENDING-ONLY-ON-LEG-TYPE-AND-CHOKE-COUNT-IS-INFEASIBLE; r31 C1 leg-type and leg-count sector template no-go; type-and-count sector template obstruction
```

```text
SCOPE NOTE ON: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: [r31 C1; SR-6] On CB(8,m), m >= 107, m = 2 (mod 3), at p* = (16m+4)/3 (t = 1: 3p* = 16m + 4 < 16m + 5 = 2dm + 5), this key's maximal deficit R_K - R_{K-1} = R_{K-1}/K > 0 (K = p* - 1) is attained on the whole sector, so every deletion-only sector allocation fails there. The switch-free infeasibility statements of r31 Cycle 1 route C1-T-02 (T2, Claude Sonnet 5: the flat rate without the switch, and the symmetric convex-quadratic family and its Jensen certificate) are instances of this key, not new keys (C-T2-U, C-T2-F, Claude Opus 5.5; the r31 Cycle 1 T adjudicator; SR-6). The with-switch leg-count obstruction is registered separately as E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-WITH-RATES-DEPENDING-ONLY-ON-LEG-TYPE-AND-CHOKE-LEG-COUNT-IS-INFEASIBLE-ON-THE-RESIDUE-2-CLASS-FROM-107. This note changes neither this key's statement, grade nor fences.
```

```text
DISTINCTION ROW: SR-6-D1
KEY: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: The registered key evaluates the deletion-only deficit of the root-plus-arm sector, with switch arcs excluded; on the r31 class at p* it gives R_K - R_{K-1} > 0, so every deletion-only allocation fails. The new key admits every switch share sigma and every theta and restricts only the deletion rates, to functions of (leg type, choke leg count). It is not implied by the registered key, because switch arcs can cover the deletion deficit: the r30 per-state tables and the r31 closed-form allocation do. It neither implies nor restates the registered key's exact formula.
```

```text
DISTINCTION ROW: SR-6-D2
KEY: E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: The registered key certifies weighted Hall at five named rows through a choke-local table whose rates depend on the full choke state (beta, gamma). The new key excludes only rates that depend on (leg type, beta + gamma) and makes no (HALL) statement. At the shared row m = 107 the two are consistent, because the registered table is not of the excluded form. No row status changes.
```

```text
RECORD: SR-6-R1
CLAIM: At m = 107, 110, 113 (p* = 572, 588, 604), the beta/gamma-separated relaxation of the choke-local sector template (pb(beta,gamma) = f_b(beta), pc(beta,gamma) = f_c(gamma), sigma >= 0 free, Switch and Residual capacity dropped) admits no rates with Out >= 1 on every sector source and In <= 1 on every in-sector target. Witness: C-T2-F's integer Farkas certificates over 19/18, 21/20 and 16/15 literal state profiles (supports 8/5, 5/6, 5/5). Each has nonnegative multipliers with sum y*OutRow <= sum z*InRow coefficientwise over f_b(1..8), f_c(1..8) and sigma(1..7), zero weight on every sigma column, and sum z / sum y = 571/572, 587/588, 603/604 < 1. Per row only; not uniform in m; a template failure, not a cut; not part of E993-R31-CB-8-TOP-RANK-SECTOR-ALLOCATION-WITH-RATES-DEPENDING-ONLY-ON-LEG-TYPE-AND-CHOKE-LEG-COUNT-IS-INFEASIBLE-ON-THE-RESIDUE-2-CLASS-FROM-107.
STATUS: computer_assisted
PROVENANCE: C-T2-F (Claude Opus 5.5; r31 Cycle 1 Stage 4; cutting-plane search using the frozen r30 simplex as a search device only; frozen copies sources/c1-stage7-sources/C-T2-F/crit_t2f_cutplane_{107,110,113}.json and crit_t2f_farkas_{107,110,113}.json, file SHA-256 315be258823f492fc94b7c6cdccf457c8117596c8f71bc0130388ac9d74e1917, c7b91dc895fc5693a1762bd0fdde69e399e5a0b7fd171885945ba3a27d02a8cd, 1214764493fa8743a88efc8aa1b0b9dc47b4a768b320d0dfb75ccf5063b4b957 and fd8884a3af6d0c01592d96b16cc00b5748572cb082b01f113896bea85e8349e0, d204da811527a27e32f92abbcea43fefd85af74ff5f8c6aa36cae027c0aff6e9, abc6b2f34ba21552f16a7c2dc251c37a725f06cd37eae20ce342e378e2631d14); independent validity check by isolated second read SR-6 (Claude Opus 5.5; own profile validation and row arithmetic, sr6_instrument.py Part 4).
```

## Verdicts

verdict[SR-6a]: confirmed
verdict[SR-6b]: confirmed_with_repairs
verdict[SR-6c]: confirmed

- **SR-6a.** F-2 is confirmed as stated. The per-row certificates attach to F-3 and are recorded in SR-6-R1.
- **SR-6b.** Theorem N is confirmed as a statement about templates. Repair: `θ_budget` is correctly absent from R-6, but S7's reason
  for that is corrected (finding 4).
- **SR-6c.** The key name, the grade `proved_informal` and the status `VERIFIED` are confirmed. The controller registers the text
  above verbatim.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-sr-SR-6/`.

| File | SHA-256 | Role |
|---|---|---|
| `verify_seal.py` | `be4acfabf98dbc532e1b0c1c11dd4546dd655b48f5531ddeb95b073228b38cec` | Capsule seal and 194 member digests |
| `verify_seal_out.txt` | `09c1304b98b91ba91e2c2e462cdb7226e7565bc9d32ac1b40e0c1bcf634fecb1` | Seal match; 0 bad members |
| `alias_scan.py` | `735e54526e0898e4e0653e87834a6ae6c76a2130772027d7508cd693d1646773` | Own alias scan against both registries |
| `alias_scan_out.txt` | `b259bec871a4573fc13a4701db86496dde7fa9b20ef3c24cc204a278bb103594` | Exact absent; no alias or pattern hits |
| `sr6_instrument.py` | `968c11c1cdb409493385e4a26e6f4f7234788056012b13e821d78926b6e322c8` | Parts 1–7: class identities; F-2 profile identity on 965 class rows; literal labs; Farkas replays; (N) corollary; `θ_budget`; flat extremality |
| `sr6_output.json` | `558e36b46de519d494d606b6233e28f8d002bcbd93d013aaf0c3c24bcdaac9a8` | Payload SHA-256 `0d5fe3b156853638dd463ed9a6972eb295036681138ab9ec0a7631a6193c3840`; `failures: []` |

- **Replay.** `cd` into the scratch root and run `python3 -B sr6_instrument.py > sr6_output.json`. It takes about 32 s in the
  foreground.
- **Jobs.** I started no background job, so there was nothing to kill.
- **Writes.** The only file written outside scratch is this `SECOND-READ.md`.
