# Orientation Adjudication

Adjudicator of orientation **F (falsify)**, r31 Cycle 2 Stage 5 (run id `erdos-993-math-dre-20260927-r31-cb-uniform-switch`).
Portfolio: returns `F1` (`C2-F-01 ASSEMBLED-CHAIN-LITERAL-NETWORK-ADVERSARY`), `F2` (`C2-F-02 ELIG-AND-CERTIFICATE-RANGE-ADVERSARY`),
`F3` (`C2-F-03 CRITERION-LOAD-AND-TYPE-PATH-ADVERSARY`) and their six cross-orientation critiques `C-F1-T`, `C-F1-U`, `C-F2-T`,
`C-F2-U`, `C-F3-T`, `C-F3-U`. Date 2026-09-28 (by the clock, ~02:50–03:15 EDT).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (both in full; the first display of each was truncated by the tool, and I
read the missing parts before writing). Subsystems loaded: the constitution and the startup protocol only. I did not follow the
protocol's task-type map into memory, conversations, modules, skills, logs or decisions. The controller owns conversation logging
for this run, and I wrote none.

**Model disclosure (two-part):**
chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

Tools: Python standard library only (`python3 -B`, exact integers and `fractions`), plus one Lean rebuild in a copied project
bound to the pinned shared Mathlib by manual symlink. No network access, no package installs, no child agents.

## Identity and seal audit

**Dispatch and capsule.**

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c2-stage5/DISPATCH-ADJ-F.md` (file SHA-256, checked before reading) | `a24f07234ead4cd9a873699b0619add612536b7f02198eb683c148128d113ec1` | MATCH |
| **Capsule seal** `control/c2-adjudicator-capsules/F-PACKET-MANIFEST.json` (canonical JSON without `seal_sha256`, sort_keys, `(",", ":")`, no trailing newline) | **`a176bc0955f6c06a321eb73ef2eebc376d992433422b92e86e82d0e06bff16bc`** | MATCH |
| All 24 capsule members (SHA-256 and byte count) | each equals its capsule entry | MATCH ×24 |
| Stage 2 packet seal (manifest file `000f89f8…b605`, 2,799 files) | `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4` | MATCH |
| Stage 3 packet seal (40 files) | `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5` | MATCH |
| Stage 4 packet seal (66 files) | `297f51b20cda73b5e0289e322e7bc7b30aba7a03a9a9911de86e91b93a09b8ec` | MATCH |
| `control/c2-adjudicator-capsules/PATH-CHECK-F.json` | 21 files scanned, 0 findings | read |

**Admission.** Stage 3 admitted 9/9. One exception touches my portfolio: F1's `headline_resolved: no` was written in backticks
inside a sentence (`BAD_HEADLINE_FLAG`, format only). Stage 4 admitted 18/18 with no exceptions. All six F-critic verdicts are
`retained_narrowed`. The Stage 4 disclosures record adds an index correction for F1 and F2 (their own disclosures had been
recorded as "none"). I checked that correction against the returns and it is right.

**Controller facts** `control/C2-STAGE5-CONTROLLER-FACTS-F.json` (CF2-F-1..4): read as facts, never as authority. I independently
confirm CF2-F-1 on shipped code and extend it (see Cross-route reconciliation, D2). CF2-F-2..4 concern other portfolios. I cite
them only as pointers and did not read those portfolios.

**Seats and disclosures.** F1, F2 and F3 each disclose "chartered sonnet/high; transport-resolved model sonnet (explicit parameter);
runtime-reported model id: claude-sonnet-5", matching the allocation. All six critics disclose "chartered opus/medium; … opus
(explicit parameter); runtime-reported model id: claude-opus-5-5". The route IDs and mechanism tokens appear verbatim.

**Inventoried scratch: copy-out-first replays** (into `scratchpad/c2-adj-F/copies/`, foreground, `python3 -B`). The
inventoried digest of every copied file matches its return or critique. `scratchpad/c2-F3/` also holds five small stdout files
that F3 did not inventory (`cond_ii_stdout.txt`, `crit_stdout.txt`, `dbf_stdout.txt`, `fp_stdout.txt`, `run_stdout.txt`). They
are not evidence; this is an inventory-hygiene note only.

| Replayed | Time | Result |
|---|---|---|
| F1 `f1_instr.py` | 14.6 s | `f1_instr_out.json` byte-identical (`cf300011…53b6`) |
| F2: 4 scripts | 0.1 / 8.1 / 34.1 / 1.3 s | all four outputs byte-identical (`3944a537…`, `63fd7f3d…`, `a0a6189d…`, `06e412a6…`) |
| F3: 5 generators | ~20 s total | all five outputs byte-identical (`31d22d7f…`, `7535a2ef…`, `776fff74…`, `22873a13…`, `2c4c747a…`) |
| C-F1-T `scaled_load.py`, `tight.py`, `literal_quotient.py` | <2 s each | byte-identical (`54c6fc9b…`, `8a0a20bf…`, `978d0f20…`) |
| C-F1-U `cert_n8.py`, `lit_sector.py` | 0.2 s, 44 s | byte-identical (`2a6da8b0…`, `ba9f36b0…`) |
| C-F2-U `crit_cert.py`, `crit_fav.py` | 2.1 s, <1 s | byte-identical (`79d36f78…`, `ec70b556…`); `N5.json` `c8c8aed8…` |
| C-F3-T `crit_dbf.py` | 3.5 s | byte-identical (`12f3acc7…`) |
| C-F3-U `crit_small_network.py` | 6.4 s | byte-identical (`6edccc28…`) |
| **C-F2-U Lean scratch** (fresh `lake build` of the carried `Main.lean`, then `lake env lean LeanProof/CritFav.lean`) | 11.6 s + 7.3 s | exit 0, no `sorry`; `#print axioms` output byte-identical to the shipped `critfav-axioms.txt` (`b4bf0d11…a5`) |

For the Lean replay, `lakefile.toml` (`45d0ca58…`), `lake-manifest.json` (`52a4d73c…`), `lean-toolchain` (`2bdc48ad…`) and the
carried `Main.lean` (`c0605e12…3011`) each equal the values in C1-LA3's `RECEIPTS/kernel-verification.json` (`source_sha256_after`,
manifest, lakefile and toolchain digests). The pins are Lean v4.32.2 and Mathlib `905b9581…`.

**Adjudicator's own instruments** (`scratchpad/c2-adj-F/own/`; stdlib only; they share no code with any seat or critic):
- `adj_rows.py`: literal CB(8,m) with a generic forest DP; `x` through `α`; eligibility; favorability at the index of record and
  at `p*−1`; (WID) with side A the structural supply polynomial and side B the literal aggregate `Σ_ℓ[q_ℓ(p*) − q_ℓ(p*−1)]`.
  Rows: 107, 116, 119, **122**, 137, **200**, **500**.
- `adj_small_m.py`: eligibility on residue-2 rows `m = 2..104`.
- `adj_r1_n5.py`: C-F1-U's bound R1 checked exactly at every class `m` in `[107, 6002]`, plus `N_5`'s primitive digest and its
  Taylor shifts at 32, 33 and 35.
- `adj_fav_guard.py`: (G)'s hypotheses for every block and every `j` on residue-2 `m ≤ 3002`, and C-F2-T's T−c tail identity on
  `m ≤ 302`.

**My read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md`, the user memory index and the user's email into my context. I did not fetch or
   use them. `CLAUDE.md` asks for conversation logging; I wrote no log, because the dispatch confines my writes to this file and
   my scratch.
2. Reads under `sources/` (authorized):
   - a `grep` of the single file `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean`, for the favorability
     definitions of record (entries 2–3);
   - the top-level keys of `sources/SOURCE-DIGESTS.json`, and a `grep` of it for the C1-LA3 `Main.lean` entry;
   - `ls sources/c1-results/runs/` and `ls` of the C1-LA3 run directory; its `FORMALIZATION-STATE.json` (entries 17–21 and the
     project pins); a `grep` of its `RECEIPTS/kernel-verification.json` for digests;
   - the SHA-256 and a `grep` of `sources/c1-results/second-reads/SR-4/SECOND-READ.md`, for its certificate digests (it matches
     `112164b8…9bf1`).
3. Non-recursive `ls` of the nine inventoried scratch directories of my portfolio, and of `c2-crit-F2-U/lean/` and its
   subdirectories (`LeanProject`, `LeanProof`, `.lake`), in order to copy the Lean project. Each is inside the granted scratch.
4. Lean: `.lake/packages` in my copy is a manual symlink to
   `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages`. I ran `lake build` and `lake env lean`
   only after `cd` into the copied project. I never ran `lake update` or `lake clean`.
5. I started no background job. Every command ran in the foreground (the longest took 3 min 12 s), so there was nothing to kill
   before this write.
6. I read no other orientation's portfolio or adjudication, no prior synthesis beyond SR-4's digest lines, no other experiment
   root, and no network resource.

## Route-by-route decisions

### F1 — `C2-F-01` (ASSEMBLED-CHAIN-LITERAL-NETWORK-ADVERSARY): **retained_narrowed, `bounded_computation`, no key**

**Survives, backed by replay plus the critics' instruments and mine.** At `m ∈ {110 (control), 116, 119 (fresh), 137}`:
- the tree, `α = 9m+1`, and the closed forms `I`, `I−v`, `I−c` equal the literal DP;
- `x = p*−2`, and the row is eligible;
- C1-LA1's template satisfies Out, In, Switch and Residual, with `min ΣOut = max ΣIn = 1` exactly (the leg-count DP collapse is
  valid; C-F1-U's 45-state DP agrees);
- `ρ_q < 1` for every `q ∈ [1,m]`, with its maximum at `q = 1`;
- no template or criterion failure;
- the `G` erratum finding (CF-C2-G), which is a genuine record correction and is F1's.

**Struck** (each with its paired-critic basis and my ruling):
- **Favorability evidence.** F1 tested `i_{p*}(T−t) < i_{p*−1}(T−t)` (`f1_instr.py` lines 459–460), which is `Δ_{p*−1}`. Both
  critics struck it. I confirm this on the code and on the definition of record (`C4LA1.vertexDeletionForwardDifference G v p :=
  i_{p+1}(G−v) − i_p(G−v)`). `F_{p*} = leafSet` holds at the correct index on critic instruments and on mine, so every
  downstream number is correct in value but rests on that evidence, not on F1's.
- **(WID).** F1 never computed the aggregate. It set `S := supply − capacity` and hard-coded the flag
  `WID_two_independent_sides_agree = True` (line 476). Both critics struck it. (WID) is restored by C-F1-T, by C-F1-U and by me
  (side A equals side B at 107, 116, 119, 122, 137, 200 and 500).
- **"`m ≥ 107` enters nowhere … the descent check holds at any `m` in this residue class".** Struck; see D1. It is false at every
  residue-2 `m ≤ 83`, which I confirmed by my own replay.
- **Switch-image literal.** "Exactly `ρ_1+θ`, independent of `γ`" is struck. The correct statement is `ρ_1+θ` for `γ ≤ 6` and
  `ρ_1+θ/2` at `γ = 7`, because `(8−γ)c_γ = 7/2` there. Both critics agree.
- **Further literals struck:** `θ = 96/(200m²+82m+5)` (the correct value is `288/…`); "`S` magnitude 422–526 digits" (the correct
  range is 420–524); "exact fractions for every entry"; "`9^m`-shaped" (it is `45^m`); and "`Θ(1/m)`" as an unbacked
  asymptotic, now replaced by C-F1-U's R1.
- **"Literal network" and "no deficient cut".** Narrowed to template/quotient loads, conditional on SR-3's composition and on the
  criterion key. This combines both critics' narrowings, which are compatible. No Hall condition over any `X` was evaluated.
- **The scaling step was not delivered by F1.** C-F1-T delivered it (replayed): after scaling, the in-sector maximum load is
  exactly 1 and is attained, for example by the profile `(1,4)^{(2m+2)/3}(1,5)^{(m−2)/3}` (I checked that its counts are
  nonnegative and sum to `m` chokes and `K−1` legs).

### F2 — `C2-F-02` (ELIG-AND-CERTIFICATE-RANGE-ADVERSARY): **retained_narrowed, `bounded_computation` / `computer_assisted`, no key**

**Survives:**
- the side condition `1 ≤ L−j ≤ 8m+1` (exact algebra);
- the gap `2j−8` and the ascending blocks `{0,1,2}`, which critics verified at every `j` on six class rows;
- the `S_5` root at `t* ≈ 32.1485` (Sturm; bracket width 2^-100);
- `S_4 < 0` exactly at `m = 107..134`. This window was already on SR-4's face ("pool too small"), so it is a confirmation, not a
  new finding;
- the τ algebra (`528m+150 > 0`);
- the degree-90 construction, which is exact and replays byte-identically.

**Narrowed or struck:**
- **"Third method … stronger form of independence".** Narrowed to an independent implementation of the same identity; see D3.
- **"The form of proof SR-4 ships already holds at shift 33".** Unbacked on F2's face, because positivity passes from `N_5` to
  `N_total = N_5·Π_{k=6}^{45}(8t+7+k)` and not back. It is now **backed** on SR-4's own `N_5`: both critics showed it, and so do I.
  My `N_5` primitive digest is `893a21b6…51f7`, equal to SR-4's recorded value. `N_5(33+u)` has all 51 coefficients positive,
  and `N_5(32+u)` fails only at its constant term.
- **"Leading-coefficient sign guarantees positivity for every larger t … finitely many roots".** Struck as an inference. The
  conclusion survives on the shift certificate and on C-F2-U's Sturm count to `+∞`.
- **τ scope.** "For every integer `m ≥ 1`, no class restriction" is narrowed to `m ≡ 2 (mod 3)`, `m ≥ 2`. "Strictly stronger than
  needed" is struck: `τ < 0` is the adverse sign, and the certificate carries τ's exact value. This is a second proof of an SR-4
  companion fact.
- **"`j ≤ 4` alone would already certify the tail of the class".** Struck on F2's own evidence, which is a bounded sweep. The
  statement is now true on the critics' degree-40, shift-45 certificate (`computer_assisted`): `S_4 > 0` for every class
  `m ≥ 137`.
- **F2-R3.** "`E0_0` not independently two-binomial" is **false** (`E0_0 = (1+x)(1+2x)^{8m}` has gap 5). "Only the paired block
  needs a separate argument" is **superseded**. The grade "computer_assisted, tested rows only" under-grades the content: the gap
  values are exact affine identities. The remark that the paired block is real-rooted (discriminant 5) is correct and moot.
- **Fresh rows.** The rows of ruling 9 (116, 119) were not run by F2. This is procedural; the critics and I ran them.

### F3 — `C2-F-03` (CRITERION-LOAD-AND-TYPE-PATH-ADVERSARY): **retained_narrowed, `bounded_computation`, no key**

**Survives** (replayed byte-identically, then re-derived by the critics):
- `n`, `α`, `x = p*−2` and eligibility at 113 and 116; the closed-form match;
- condition (i) strict at every `q` at both rows, with the minimum relative margin at `q = 1`, the `q = m` margin about 0.156, and
  the edge-case digit counts;
- the 571,768-triple condition-(ii) sweep with 0 failures, which is **corroboration only**: CD-2 is `proved_informal` on record,
  and the critics re-derived its likelihood-ratio proof;
- the conclusion that the `u_i`-switch images with `γ ∈ [1,7]` are the only doubly-fed class;
- F3's own instrument repair of its transposed `G`.

**Struck or narrowed:**
- **Favorability table (8 rows) and "`F_{p*} = leafSet` at both rows".** Wrong index: `delta_at` returns `ip − ipm1`, which is
  `Δ_{p*−1}`. Struck; see D2. The correct-index fact is restored elsewhere.
- **(WID).** Never asserted, and the "`r_q` computed two ways" substitute does not exist in the code (one method only). Both
  critics struck it.
- **Leaf transitivity.** "One involution confirms every `c_ij` plays an identical role" is narrowed. The critics' verified
  generators give transitivity.
- **θ\* "reproduction".** Tautological: the fitted law was evaluated at the rows it was fitted to. Struck. `n`, `α`, `x` and
  `ρ_1(95)` stand.
- **Fact 3 ("never r, never v").** False under the literal relation (D). The images `B∖{r}` and `B∖{v}` exist and have weight 0.
  Corrected by both critics.
- **"Literal, exhaustive over V∖A".** Vacuous by construction (the targets contain neither `r` nor `v`), not independence-tested,
  (D) arcs only, and not at rank `p*`. The "concrete sector source" has `K = 99`, not 603. Struck as evidence at `p*`. The at-rank
  replacement is C-F3-T's `crit_dbf.py` (replayed).
- **The STATED note.** Its content is already in SR-3's registered key text, and as worded it carries the Fact 3 error. It is not
  to be folded in; see D9.
- **Citations.** "Quoted in full from `CLAIM-IDENTITY.json`" is false (the key is run-local). "An order of magnitude past anything
  SR-C4-6 tested" is narrowed; C-F3-U cites r30 checks at `D = 670`. That narrowing is critic-cited and I did not verify it; it is
  not load-bearing.
- **Fresh rows.** F3 ran only one fresh row under ruling 9 (116). C-F3-T and C-F3-U supplied 119.

## Cross-route reconciliation

**Paired-critic disagreements, resolved claim by claim** (never averaged; replays weighed over self-reports):

- **D1 — F1 §3, "`m ≥ 107` enters nowhere; the descent holds at any `m` in this residue class".**
  - C-F1-T **struck** it: eligibility fails at every residue-2 `m ≤ 83`.
  - C-F1-U (A9) **accepted** it ("F1 correctly states that `m ≥ 107` plays no role in a single-row check").
  - **Ruling: C-F1-T upheld.** My own literal DP (`adj_small_m.py`, a different code base) gives `x + 2 > p*` at every residue-2
    `m ∈ {2, …, 83}` (for example `m = 2`: `x = p* = 12`; `m = 83`: `x = 443 = p*−1`) and eligibility at `86..104`.
  - C-F1-U's reading holds for a single row, but the literal is universal and false. The lower bound on `m` is load-bearing for (E).
    Any formal statement of (E) must keep `107 ≤ m` (or a proved smaller cutoff, never below 86).
  - Grade: `bounded_computation`, off-class, critic-attributed to C-F1-T and confirmed by the adjudicator.
- **D2 — F3's favorability evidence.**
  - C-F3-T **struck** it (wrong index).
  - C-F3-U **backed** it: its certification audit lists "favorability at 113 and 116" as backed, and its table column
    "F = leafSet (derived)" says yes.
  - **Ruling: C-F3-T upheld. Adjudicator-derived record correction:** C-F3-U's own instrument (`own/crit_rows.py` line 108,
    `co(P,p) − co(P,p−1)` at `p = p*`) repeats F3's index error. So C-F3-U's favorability column and its backing of F3's table are
    struck as evidence at `p*`.
  - This extends CF2-F-1: **three** instruments in this portfolio (F1, F3, C-F3-U) tested `Δ_{p*−1}`.
  - The fact itself stands at the correct index on five critic instruments (C-F1-T, C-F1-U, C-F2-T, C-F2-U, C-F3-T; code
    inspected) and on mine at 107–500, with `Δ_{p*−1} < 0` also holding. Everything else in C-F3-U stands: its (WID) is the
    identity for `F = leafSet`, which is the correct selector.
- **D3 — F2's "third method".**
  - C-F2-T: "genuine" independence (different decomposition, own code, own Sturm).
  - C-F2-U: narrowed to "an independent implementation of the same identity".
  - **Ruling: C-F2-U's narrowing upheld on the literal; C-F2-T's point stands as implementation independence.**
    `N_total = N_5·Π_{k=6}^{45}(8t+7+k)` exactly (C-F2-U `crit_reconcile.py`; C-F2-T reconciles the same ratio 1/32). The
    rational function is identical, and only the uncancelled factor differs.
  - F2's value as a check is real (independent code agreeing with SR-4's digest). Its "stronger form of independence" wording is
    narrowed.
- **D4 — Repairing F2-R3's T−c tail.** C-F2-T proves the tail negative by a three-ratio identity; C-F2-U regroups `E0_0 + tail`
  into two (G)-blocks with gaps 3 and 3. **Not a disagreement: two valid proofs.**
  - I verified both by hand. `f_{p*−3}, f_{p*−1}, f_{p*}` are the stated multiples of `f_{p*−2}`, and the bracket equals
    `−12u+6 = −6(32m−1)`. `(1+3x+x²) = (1+x)²+x` gives gaps `6p* − (9 + 32m − 4) = 3` and `6(p*−1) − (3 + 32m − 4) = 3`.
  - `adj_fav_guard.py` found 0 failures of (G)'s hypotheses over every `j` for residue-2 `m ≤ 3002`, and 0 failures of the tail
    identity for `m ≤ 302`.
  - C-F2-U's version compiles (below).
- **D5 — F1's `Θ(1/m)`.** C-F1-T flags it as an unbacked asymptotic (limit near 15/32, conjecture); C-F1-U strikes it and proves
  the bound R1. **Compatible.** F1's literal is struck, and R1 replaces it. The two quantities differ, `m(1−ρ_1)` against
  `m(1−ρ_1−θ)`; their values (0.4679 against 0.4545 at 107) differ by `mθ ≈ 0.0134`, so they are consistent.
- **D6 — F1's cut claim.** C-F1-T narrows "literal network" to template/quotient loads; C-F1-U narrows "no cut" to a conditional on
  SR-3 and the criterion key. **Compatible; both applied.**
- **D7 — F2's `FAV_darroch_free: advanced`.** C-F2-T: consistent, carried by the critic's completion. C-F2-U: backed only as a
  pointer. **Ruling:** the advance is critic-attributed. F2's own evidence only pointed at it.
- **D8 — CD-2 (condition (ii)).** Both critics say it is `proved_informal` on record, re-derive its proof, and find it sound. F3's
  framing of CD-2 as an unproved "claim" is struck. No disagreement.
- **D9 — F3's doubly-fed note.**
  - C-F3-T: not a sharpening; the key already states it; do not fold in.
  - C-F3-U: F3 "offers a reason and makes no new claim", and Lemma DF is the proof paragraph the key "states without writing out".
  - **Ruling:** F3's note as worded is struck (Fact 3, the vacuous check). The correct, complete proof paragraph is C-F3-U's
    Lemma DF (STATED, needs a second read). C-F3-T's arc table agrees with it clause for clause, including the zero-weight images
    and the absence of (S) arcs at `b_ij`, `c_ij` and `v`. Neither is a key candidate.

**Cross-route observations.**
- All three F seats share one fidelity lapse pattern: F1 and F3 used the selector index `p*−1`, and none of F1, F2 or F3 asserted
  (WID) against the aggregate. The rule for successors is fixed below.
- No route or critic produced a cut candidate. All eight gate lines of the six critiques and three returns say `cut_candidate: none`.
- CF2-F-2 (four independent private-leaf proofs across portfolios) is consistent with D4. I verified only the two in my portfolio.
  CF2-F-4 (explicit criterion arc values, T3 critics) is consistent with the doubly-fed classification here (E1 is deletion-only
  and loads only r-free targets with `q ≥ 1`). I cite it as a fact only.

## Established results

Grades are never upgraded by use. Critic-derived items are **critic-attributed**. "STATED" means first made at Stage 4, so an
isolated second read is needed before registration.

**Exact theorems (informal), with hypotheses, `M_0` and residue class**
1. **FAV-TOP, Darroch/Newton-free favorability at `p*`**
   - Attribution: critic-attributed to C-F2-T (tail ratio identity) and C-F2-U (regrouping plus compiled scratch). STATED;
     `proved_informal` pending an isolated second read.
   - Statement: for every `m ≡ 2 (mod 3)`, `m ≥ 2` (in particular the class `m ≥ 107`), every leaf of `CB(8,m)` is favorable at
     `p* = (16m+4)/3`, i.e. `F_{p*}(CB(8,m)) = leafSet`.
   - Hypotheses consumed:
     - the closed forms of record for `I(T−v)` and `I(T−c)` (a `proved_informal` node of the r30 favorability key);
     - tool (G) `E993Transport.twoBinom_coeff_strictAnti_of_gap` (C1-LA3 entry 17, kernel-checked companion; no Newton, no
       Darroch);
     - exact ratio algebra;
     - the automorphisms of `CB(8,m)` acting transitively on the `8m` private leaves;
     - the leaf classification `leafSet = {v} ∪ C`.
   - `M_0`: none needed. `m ≡ 2 (mod 3)` enters through `6p* = 32m+8`.
   - Scope: it is the restriction of the r30 key to `d = 8`, `8m ≡ 1 (mod 3)`, proved without Darroch/Newton. It is a dependency
     removal (the gate object `FAV_darroch_free`), **not a new key and not Tier 2 progress**.
   - Verified here: both algebras by hand; the gap-hypothesis guard; the Lean replay.
2. **Lemma DF, the complete sector-arc table on `CB(d,m)` at every rank.** Critic-attributed to C-F3-U; STATED;
   `proved_informal` pending a second read.
   - The arcs out of a sector source are exactly: leg deletions (in-sector, weight 1); the deletions of `r` and `v` (weight 0);
     the `s`-switch (weight 0); and one `u_i`-switch per choke with `β_i = 1` (r-free, one choke, weight `γ_i`).
   - A switch image of weight `γ ≥ 1` has exactly `d−γ` sector preimages.
   - Every (D) preimage of an in-sector target is a sector source.
   - Hence the only doubly-fed class is the `u_i`-switch images with `γ ≥ 1`, with the per-`γ` constraint
     `(8−γ)σ(γ) ≤ (1−ρ_1)γ`.
   - It confirms SR-3's key text and is the proof paragraph U2's target case split needs.
3. **CD-2 re-derived** (C-F3-T, C-F3-U; confirmatory). The likelihood-ratio proof of condition (ii) is sound for all `a, b ≥ 0`
   and all `j`. The record grade stays `proved_informal`, with nothing added.
4. **τ < 0** for `m ≡ 2 (mod 3)`, `m ≥ 2` (F2, by elementary algebra). This is a second proof of an SR-4 companion fact.

**Fixed-certificate results (`computer_assisted`, critic-attributed, STATED)**
5. **R1** (C-F1-U): for every `m ≥ 107`, `m ≡ 2 (mod 3)`, `11/(25m) ≤ 1 − ρ_1(m) − 288/(200m²+82m+5) ≤ 13/(25m)`, with
   `M_0 = 107`. Corollary: `θ/(1−ρ_1) ≤ 36/(11m)`.
   - Proof: the N8 identity (whose `Q` equals C1-LA1's record exactly), factor bounds in `[279/571, 143/282]`, and two
     degree-10 nonnegative-coefficient certificates.
   - Replayed byte-identically, and checked directly and exactly by me at every class `m ∈ [107, 6002]` (0 failures; `m·margin`
     lies in `[0.4545, 0.4685]`).
   - It strengthens C1-LA1 (v). It is not needed by Tier 1.
6. **`N_5`'s minimal all-positive Taylor shift is `t = 33`** (C-F2-T, C-F2-U, confirmed by me on the digest-identified `N_5`).
   Shift 35 (the class floor) is also all-positive. SR-4's key is unchanged.
7. **`S_4 > 0` for every real `t ≥ 45`** (every class `m ≥ 137`), from the degree-40 `N_4` at shift 45 (C-F2-T, C-F2-U; digest
   `ed0101b2…c68d`). It is not needed for Tier 1.

**Bounded computations** (`bounded_computation`; exact; rows named)
8. At `m = 107, 110, 113, 116, 119, 137` (critics) and at `107, 116, 119, 122, 137, 200, 500` (adjudicator), each row has:
   - tree, `α = 9m+1`, and the closed form equal to the literal DP;
   - `x = p*−2` at 107–137, and `x = p*−3` at 200 and `p*−7` at 500 (the window opens as `m` grows);
   - eligibility;
   - `F_{p*} = leafSet` at the index of record;
   - (WID) from independent sides, with `S(T_m, p*) < 0`.
9. At `m = 110, 116, 119, 137`:
   - C1-LA1's template is exact (`min ΣOut = max ΣIn = 1`), with Switch and Residual;
   - after scaling (C-F1-T), the in-sector maximum load is exactly 1 and is attained;
   - switch images are loaded at most `ρ_1+θ` (`γ ≤ 6`) and `ρ_1+θ/2` (`γ = 7`), strictly below 1.
10. Condition (i) is strict at every `q` at 95, 107, 110, 113, 116, 119 and 137, with the minimum at `q = 1`.
11. Literal sector-arc audits:
    - C-F3-T, at rank `p*` with `K = 603` and `635` (m = 113 and 119), sampled sources: 0 violations;
    - C-F3-U, 8 small `CB(d,m)` at every rank (78 instances), exhaustive: 0 failures;
    - C-F1-U, `CB(8, m′ ≤ 3)`, 880,320 sources: 0 failures;
    - C-F1-T, `CB(8,2)` and `CB(8,3)`: 0 violations.
12. **Off-class:** eligibility at `p*` fails at every residue-2 `m ≤ 83` and holds at `86..104` (C-F1-T; confirmed by me).

**Template failures** (never cuts)
13. The pooling template `j ≤ 4` fails at `m = 107..134`: its pooled coefficient difference is negative there. This was already on
    SR-4's face. The pool `j ≤ 5` is the smallest uniform pool from 107.
14. The `N_5` shift certificate fails at shift 32 (constant term, `m = 98`, off-class).

**Compiled scratch** (no grade until a governed award closes; carried, not authored, where stated)
15. C-F2-U `CritFav.lean` (`1cf34606…65d0`): `E993Transport.CritF2U.armLeaf_block`, `armLeaf_favorable_topRank` and
    `privateLeaf_favorable_topRank`.
    - Sorry-free; axioms `[propext, Classical.choice, Quot.sound]`; no `native_decide`, `decide` or enumeration. Rebuilt and
      re-checked by me.
    - It carries C1-LA3's `Main.lean` byte-identically (`c0605e12…3011`, entries 1–21).

**Imported at their grades** (cited, not re-proved):
- C1-LA1 (template, `formally_verified`);
- SR-3's composition key (`proved_informal`);
- SR-4's eligibility key (`computer_assisted`);
- the criterion key and the threshold key (`proved_informal`);
- the r30 favorability key (`proved_informal` modulo Darroch/Newton; now with a Darroch-free proof route, item 1);
- the closed forms (`proved_informal` node);
- C1-LA3's tool (G) (kernel-checked companion).

**Record corrections**
- CF-C2-G (swapped `G` in the allocation's U1 text): found by F1 and confirmed. F3's `cb_lib` docstring still carries the
  transposed `G`; the code is right.
- The favorability-index slip in F1, F3 and C-F3-U (D2).
- The Stage 3 disclosure index for F1 and F2 (already corrected by the controller's addendum).

**Open bridges.** None are closed by this orientation. They are listed under Lean readiness and Next-route allocation.

## Rejected and narrowed mechanisms

**Adversarial record (protocol duty 7).**
- **Horizons**, by instrument:
  - class rows `m ∈ {107, …, 137}` for every Tier 1 hypothesis, plus 200 and 500 on mine;
  - condition (ii) triples to `a, b ≤ 80`, plus asymmetric pairs up to `a = 1000`;
  - Sturm root counts to `+∞` (C-F2-U) and to 10^12 (F2);
  - `S_4`/`S_5` sign sweeps to `m = 9008`;
  - R1 exactly to `m = 6002`;
  - small-tree literal networks at every rank (`CB(d,m)`, orders 13–25);
  - at-rank sampled sector audits at `m = 113` and `119`.
- **Cut candidates: none.** No computation in the portfolio evaluated a set `X ⊆ I_{p*+1}` against its neighbourhood capacity at
  an eligible row, and none produced any candidate. So no candidate satisfies "eligible row of the class, exact supply and
  neighbourhood capacity, adjudicator replay".
- Nothing approaches the decisive-(b) threshold. The tightest classes are:
  - the in-sector targets, exactly tight (load 1) by construction of the allocation. This is an equality constraint of the
    certificate, not a near-cut, since capacity is met, not exceeded;
  - the switch images, with margin `1 − ρ_1 − θ ≥ 11/(25m) > 0` on the whole class (R1).
- **Template failures:** items 13–14 above (the pooling template at `m = 107..134`; the shift-32 constant term). Neither is a
  network statement.

**Rejected** (struck; the mechanism or inference is not accepted in any form):
- the selector test `i_{p*}(T−t) < i_{p*−1}(T−t)` as favorability at `p*` (F1, F3, C-F3-U);
- `S := supply − capacity` as an assertion of (WID) (F1, F3);
- finitely-many-roots reasoning as a universality argument (F2);
- "the paired block is the only non-(G) block" (F2);
- θ\* evaluated at fitted rows as a "reproduction" (F3);
- vacuous exhaustive checks as evidence (F3);
- a single involution as transitivity (F3);
- sweeps of CD-2 presented as the adversarial test of a proved statement (F3).

**Narrowed:**
- F1's "literal network": template/quotient loads, conditional on SR-3 and the criterion key.
- F2's independence: of implementation only.
- F2's τ: to the residue class.
- F2's `S_4` tail: universal only on the critics' certificate.
- F3's doubly-fed note: superseded by Lemma DF.
- F1's switch-image literal: per-`γ` values.

**No refuted mechanism was revived.** `E993-TREE-REAL-ROOTED` stays REFUTED. Newton and Darroch appear nowhere in the portfolio
(F2's discriminant remark concerns a single quadratic factor and is moot). The θ\* law is never a hypothesis.

## Lean readiness

Criteria: (a) a complete informal proof at statement-level granularity with a closed dependency DAG; (b) compiled fragments
covering named DAG nodes, sorry-free; (c) the open nodes named. A bounded result never qualifies (items 8–12 are excluded).

**Group FAV-TOP (the closed-form favorability coefficient theorem): CONTRACT-READY** as a pure coefficient award. It needs an
isolated second read of item 1 first.

- **Exact statement** (as compiled by C-F2-U; the synthesis freezes the final text):
  ```lean
  theorem armLeaf_favorable_topRank (m : ℕ) (hmod : m % 3 = 2) :
      ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
        ((1 + X) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ m + X * (1 + 2 * X) ^ (8 * m) : ℤ[X]).coeff ((16 * m + 4) / 3)
  theorem privateLeaf_favorable_topRank (m : ℕ) (hmod : m % 3 = 2) :
      ((1 + 2 * X) * ((1 + 2 * X) ^ 7 * (1 + X) + X * (1 + X) ^ 7) * ((1 + 2 * X) ^ 8 + X * (1 + X) ^ 8) ^ (m - 1) +
          X * (1 + X) ^ 2 * (1 + 2 * X) ^ (8 * m - 1) : ℤ[X]).coeff ((16 * m + 4) / 3 + 1) <
        ( …same polynomial… ).coeff ((16 * m + 4) / 3)
  ```
- **Index:** these are the forward differences of record, `Δ_{p*} < 0`, not `Δ_{p*−1}`. I checked this against entries 2–3 of
  record.
- **Hypotheses:** `m % 3 = 2` only. That is stronger than the class. For fence 1, I recommend that the frozen statement add the
  (unused) hypothesis `107 ≤ m`, or that the registration text scope the key to the class.
- **Fences:**
  - It is a statement about closed-form polynomials over `ℤ[X]`, not about `cbGraph`.
  - It transfers no status to the favorability key's graph statement until the link node closes.
  - One rank, `p*`. `d = 8` only.
- **Carried fragments:** C1-LA3 `LeanProject/LeanProof/Main.lean` (`c0605e12b91375ede9fb72cb9af428a96d9b6a7d678b856b0131f9c7b10f3011`,
  entries 1–21), consumed through entry 17 `E993Transport.twoBinom_coeff_strictAnti_of_gap` (`b39cd78768d02c83…`), whose
  hypotheses are `1 ≤ t`, `t ≤ a + b` and `3a + 4b + 2 ≤ 6t`.
- **New declarations:** `armLeaf_block`, `armLeaf_favorable_topRank`, `privateLeaf_favorable_topRank`.
- **Compiled status:** sorry-free; standard axioms; rebuilt by the adjudicator (build log `c57d758b…`, axioms log `45252c28…`).
- **Open nodes (outside this group; they are what the graph-level favorability still needs):**
  - (N1) `indepSetCount (cbGraph m − v) k` and `indepSetCount (cbGraph m − c_ij) k` equal the closed-form coefficients (U3's
    vertex-split link). **This is the smallest unproved lemma for graph-level Darroch-free favorability.**
  - (N2) The automorphisms of `cbGraph m` are transitive on the private leaves.
  - (N3) The leaf classification of `cbGraph m` (possibly already in C1-LA2's layer).
  - (N4) The assembly `favorableLeaves (cbGraph m) p* = leafSet`.

**Group DF+CD-2 (the composition's target case split and condition (ii)): NOT contract-ready.**
- (a) The informal proofs are complete: CD-2 on record; Lemma DF STATED, pending a second read.
- (b) There are no compiled fragments.
- (c) Every formal node is open. The smallest unproved formal lemmas are:
  - DF's (S)-arc enumeration over `cbGraph m`: for a sector source `B` and choke `u_i`, `|N(u_i) ∩ B| = 1 + β_i`, and
    `|N(b_ij) ∩ B| ≤ 1`;
  - CD-2's pairwise step `C(b,u)·C(b,w) ≥ C(b,u−1)·C(b,w+1)` for `u ≤ w` (and the same with `2^·` weights), followed by the
    antisymmetric summation.
- These feed U2's conjunct-4 node. The composition must use `ΣIn ≤ 1` **non-strictly**, because the post-scaling in-sector load
  equals 1 exactly (C-F1-T).

**Group R1 (the switch-image margin bound): NOT recommended and NOT ready.**
- (a) Complete informally, with fixed certificates.
- (b) Nothing compiled.
- (c) Nodes: the N8 rational identity for `1 − ρ_1 − θ`; the factor-bound lemma; two degree-10 positivity certificates.
- It has no consumer in Tier 1 (C1-LA1 (v) already formally gives `θ ≤ 1 − ρ_1`), so funding it would re-prove a registered
  conclusion in stronger form.

**Certificate facts** (the `N_5` shift 33, the `S_4` shift 45) belong to U1's (ELIG-top)(a) line. They are not F award groups.
U1 may freeze `N_5` at shift 33 or 35; both are all-positive, and 35 matches the class hypothesis.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

Basis:
- The F seats themselves produced only bounded evidence, several fidelity lapses, and one genuine record correction (CF-C2-G).
- The orientation's portfolio nonetheless contains a **material, critic-attributed advance on the Tier 1 chain**: a
  Darroch/Newton-free proof that every leaf is favorable at `p*` on the class (two independent proofs; the coefficient core
  compiled sorry-free and rebuilt here).
- That removes the last Darroch/Newton dependency from the informal (H), modulo the `proved_informal` closed forms, and it advances
  the gate object `FAV_darroch_free`.
- It does not change any Tier 1 or Tier 2 grade: Tier 1 stays `computer_assisted` through the `S_5` certificate, and Tier 2 is
  unchanged.
- Further items:
  - new STATED `proved_informal` content (Lemma DF);
  - a new `computer_assisted` bound (R1);
  - new adversarial findings: the index lapse in three instruments; eligibility failing at `m ≤ 83`; the shift-33 minimality; the
    exact `S_4` tail.
- Under SOLUTION-CONTRACT §5 and ruling 15, a plateau needs no advance on any gate object and no new result above
  `bounded_computation`. Neither holds for this orientation.
- **Stop gate:** no decisive event bears on it. There is no formal Tier 1 and no cut.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at the F orientation's evidence grade:
- **Tier 1** (for every `m ≥ 107`, `m ≡ 2 (mod 3)`, both (E) and (H) at `p*`): **still_open**.
  - Not refuted: there is no eligible deficient cut, and no candidate, on any instrument.
  - Not `proved` at my grade: the chain rests on SR-3's `proved_informal` composition, the criterion key, the closed-form node
    and SR-4's fixed `S_5` certificate. I did not verify the complete informal proof of the whole statement; the composition
    record is outside my capsule.
  - F evidence found no defect in any link at rows 107–137 (and 200, 500 for (E) and the Tier 1 hypotheses).
- **(L-S)_top: still_open at network level** (neither proved nor refuted here).
  - Template level is `formally_verified` (C1-LA1). F1's rows and C-F1-T's post-scaling loads corroborate it exactly.
  - Residual keeps a positive margin of order `1/m` (R1).
  - The literal-network composition stays `proved_informal` through SR-3's reduction. Lemma DF (STATED) supplies its target case
    split.
- **(ELIG-top)(a): still_open as a certificate-free or formal statement; `computer_assisted` and not refuted.**
  - The degree-50 `N_5` is confirmed by digest (`893a21b6…51f7`) on three instruments, all-positive from shift 33.
  - The pool `j ≤ 5` is minimal from `m = 107`.
  - The side conditions and the τ algebra hold.
  - The class lower bound on `m` is essential: eligibility fails at every residue-2 `m ≤ 83`.

## Next-route allocation

**Exact remaining obligation for the F orientation.**
- Nothing adversarial is pending on the informal chain.
- The open objects are formal statements whose hypotheses must not encode their conclusions:
  - U1's parent-descent theorem;
  - U2's conjunct-4 composition;
  - U3's closed-form link;
  - any FAV-TOP award.
- Also open: the isolated second reads of the three STATED items (FAV-TOP, Lemma DF, R1).
- **Binding hygiene for every successor instrument:**
  - evaluate the selector as `i_{p+1}(T−t) < i_p(T−t)`;
  - assert (WID) against `Σ_F[q_t(p) − q_t(p−1)]` from an independent side, never as the definition of `S`;
  - scan `x` through `α`;
  - run the fresh rows of the current gate;
  - never let a docstring or allocation text override the contract's `G`.

**Routes** (at most three; each with what it could close in one cycle):
1. **F-A: formal-statement fidelity adversary.** Attack the frozen `expected_statement`s of U1, U2, U3 and FAV-TOP against the
   contract. Check:
   - that every index is the forward difference of record at `p*`, not `p*−1`;
   - `G`;
   - the ℕ-subtractions `m − 1`, `8m − 1` and `(16m+4)/3 − j`;
   - the unused or missing `107 ≤ m`;
   - that no hypothesis assumes the conclusion (for example favorability or `ΣIn < 1`);
   - that the link node really targets `C5LA1.indepSetCount` of `cbGraph m` minus the leaf.

   Could close: a signed fidelity audit of every Cycle 3 award statement before Stage 7 freezes it.
2. **F-B: at-rank literal-flow adversary.** At a fresh class row (`m = 122` or `125`), build the actual composed rational flow:
   T3-critics' explicit E1 arc values (CF2-F-4) plus C1-LA1's allocation after scaling. Then, on sampled and extremal sources and
   on every target class (in-sector, one-choke switch images, one-choke non-images, `q ≥ 2`, weight 0), compute exact inflows at
   rank `p*` against literal active-tag capacities.

   Could close: an end-to-end at-rank bounded confirmation of the composition (not the template), or an exact failure. It also
   tests the non-strict in-sector tightness.
3. **F-C: second-read-grade adversary of FAV-TOP and of the link node.**
   - Re-derive the four favorability proofs' block expansions and their weights (`C(m−1, j)`, `C(m−1, j−1)`).
   - Test node N1 by brute force: `indepSetCount` of `CB(8,m)` minus `v` and minus `c_ij`, against the closed forms at every `k`
     for small `m`, and literally at one class row.
   - Try to break transitivity and the leaf classification on the graph definition of C1-LA2.

   Could close: registration readiness of the Darroch/Newton-free favorability chain at `proved_informal`, and a vetted statement
   for N1.

## Artifact inventory

All adjudicator scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-adj-F/`.

| Path | SHA-256 | Role |
|---|---|---|
| `own/adj_rows.py` | `584717c02654075ad40722e4f9f7d005c28f090b98a15f82d0af895e18f27483` | own literal-tree instrument: `x` through `α`, eligibility, favorability at both indices, (WID) two sides |
| `own/adj_rows_out_107_116.json` | `309821fab889aa2cf20767abcbc72e01ee08e3b08fed8fee1a6e7bc36ad355fe` | rows 107, 116 (3.2 s) |
| `own/adj_rows_out_119_122_137_200_500.json` | `17372502c4ccc161711538741ddd0fba579eaa6556fa07e75ec7e81a37281040` | rows 119, 122, 137, 200, 500 (106 s) |
| `own/adj_small_m.py` / `own/adj_small_m_out.json` | `ead323cc13181c11fcde2a0ed100622b96ac16ff5126a7fee3833355b87e86a1` / `77e67ce7f8c481eaba590050e0040d8c2ca7659d5695f8cfb417939527ef2af5` | D1: eligibility on residue-2 `m ≤ 104` |
| `own/adj_r1_n5.py` / `own/adj_r1_n5_out.json` | `f1d662aeb60ed217fe3ec57c5001be2f0a1da472fcc68f528cd3422daefb57d0` / `094391e66f8e8bb87fff2376e60f782637f4d93336caf0acfc9f4340e52c0953` | R1 exact on `107..6002`; `N_5` digest; shifts 32, 33, 35 (3 min 12 s) |
| `own/adj_fav_guard.py` / `own/adj_fav_guard_out.json` | `49e1a256872b5ca4c687888ae9817f4a2b947fe524a2a17f91ac5e10abea975a` / `15bc4ef247bf5dfa8d4f377ea4853e00a7324c24ae42b3ca8662f95ee52c7339` | (G)-hypothesis guard (`m ≤ 3002`, all `j`); T−c tail identity (`m ≤ 302`) |
| `lean/LeanProject/` | copied C-F2-U project; `.lake/packages` is a manual symlink | Lean rebuild |
| `lean/build.log` / `lean/critfav.log` | `c57d758bfe18181a2ac4124b6b099f23b39777ebfbeebb60b7f07e700269382c` / `45252c28e4e5da63cbefed92a3a877db3236b0f645f24eef39a33f3c18eb3dc3` | `lake build` (exit 0); `CritFav.lean` axioms (the first three lines are byte-identical to `critfav-axioms.txt`) |
| `copies/<seat or critic>/` | inventoried digests (all MATCH) | copy-out-first replays; regenerated outputs byte-identical (Identity and seal audit) |

Replay (from `scratchpad/c2-adj-F/own/`): `python3 -B adj_rows.py 107 116`; `python3 -B adj_rows.py 119 122 137 200 500`;
`python3 -B adj_small_m.py`; `python3 -B adj_r1_n5.py`; `python3 -B adj_fav_guard.py`. Lean (from `scratchpad/c2-adj-F/lean/LeanProject/`,
with the v4.32.2 toolchain on `PATH`): `lake build && lake env lean LeanProof/CritFav.lean`.

Background jobs: none were started, so none were running at the final write. This file was reread before close.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
