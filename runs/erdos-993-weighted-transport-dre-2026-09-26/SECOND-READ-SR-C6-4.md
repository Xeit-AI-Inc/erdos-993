# Second Read

Read `SR-C6-4`, r30 Cycle 6 (the terminal cycle). This is an isolated second read of Darroch/Newton hygiene. It covers the proof of the registered `d ≤ 6` sector key and every other "modulo Darroch" or Newton-dependent face in the frozen registries. The read is non-decisive for the run's continuation and decisive for the registry text at the terminal close.

- Reader: Claude Opus 5.5, high. Isolated; no child delegation.
- Date: 2026-09-27 (session clock; the brief is dated 2026-09-28).

**VerityOS boot.** I am operating within VerityOS. I loaded exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, the two boot files the brief names. After that I worked only inside the run's experiment subsystem, through the sealed capsule.

Two-part model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Brief.** `shasum -a 256 control/C6-SECOND-READ-BRIEF-SR-C6-4.md` gives `a74ce42fb56af6bc8df845562e381c9f26c5e4f4c90b78961221fa0cbf0943a9`, which equals the chartered digest. I verified it before following the brief.
- **Protocol.** `control/C6-SECOND-READ-PROTOCOL.md` has digest `c2e9d131218cd682ab9113d8d0c536834dbf3c0e1e6aa2cdd5d8d1cb218837f9`, which matches its manifest entry. I followed it as binding.
- **Capsule seal.** `control/c6-second-read/SR-C6-4-PACKET-MANIFEST.json`. I recomputed SHA-256 over compact, key-sorted JSON of the manifest with `seal_sha256` removed: separators `(",", ":")`, no trailing newline, and the same result with and without `ensure_ascii`.
  - Stored: `842d96f1c49ad6a72a4f52aabd275c56efb1b586d589539fdc463e2d00097731`.
  - Recomputed: the same. **Seal verified.**
  - Manifest facts: schema `verityos.math-dre.packet-manifest.v1`, stage `cycle-6-second-read-SR-C6-4`, run `erdos-993-math-dre-20260926-r30-weighted-transport`, `file_count` 224.
- **Member digests.** All 224 members match their manifest SHA-256 and byte counts, with 0 mismatches (`seal_check.py`).
- **Frozen reference instruments.** Before reading any of them, I checked every capsule member under each source directory against that directory's `SOURCE-DIGESTS.json` (`srcdigest_check.py`):
  - `sources/c5-stage7-sources/`: 85 members, 0 mismatches, 0 unlisted (the digest file has 460 entries);
  - `sources/c6-stage7-sources/`: 95 members, 0 mismatches, 0 unlisted (723 entries).
- **Registries (frozen), all capsule members with matching digests.**
  - `control/snapshots/CLAIM-IDENTITY.run-local.c6-stage2.json`: 460 claims.
  - `control/snapshots/OBLIGATIONS.c6-stage2.csv`: 388 rows.
  - `sources/authority/CLAIM-IDENTITY.json`: the 434 master.
  - `sources/heterogeneous-closure/master-2026-09-27/CLAIM-IDENTITY.json`: the live 457 master. It holds no r30 key; the terminal close rebases r30 onto it additively.
- **Read-boundary deviations.** Each is disclosed below; none bears on the mathematics.
  1. At session start the harness put `/Users/ashtonsperry/VerityOS/CLAUDE.md` (project instructions) and the user auto-memory index into my context. I did not open either file and did not act on them. In particular I kept no conversation log, because the protocol's write boundary governs this seat.
  2. Two `cat` calls chained an `echo` whose `=====` argument zsh rejected (`===== not found`). The first chained the protocol with the manifest; the second chained the two boot files. Only the named files were printed, and no other file was touched.
  3. Two outputs overflowed to harness tool-result files under `~/.claude/projects/…/tool-results/`:
     - the manifest `cat`, whose overflow file I did not open (I listed the members with Python instead);
     - the `cat` of the capsule member `second-reads/SR-C5-5/SECOND-READ.md`, whose overflow file I opened once. It holds only that member's bytes.
  4. `mkdir -p` created `scratchpad/c6-sr-SR-C6-4/` and `second-reads/SR-C6-4/`. The only directory listing I made outside the capsule was one `ls` of my own scratch directory `scratchpad/c6-sr-SR-C6-4/`, to confirm its contents before close. It showed only the files in the inventory below.
  5. Every `grep` targeted named capsule members, non-recursively. There was no `find` or `rg`, no search rooted above a member, no network, no installs, no `lake`/`lean`, no background jobs and no kills. Every Python run used `python3 -B`, and I edited no sealed member.

## Statements read

**Statement of record.** `cycles/cycle-6/stage6/SYNTHESIS.md`:
- `## Registrations` → "Possible regression (SR-C6-4)" and S-6 (the scope note to be written here);
- K-2 (for the 4c cross-reference);
- `## Reconciliation` R-6 (the Darroch hygiene flag);
- the SR-C6-4 row of the Cycle 6 second-read batch table (`## Registrations`; the brief places the table under `## Progress and stop-gate ruling`, but in this synthesis it sits at the end of `## Registrations`);
- `## Refuted or narrowed mechanisms` → "Struck". It is used only to exclude items, never as evidence.

**Origins.**
- Cycle 5:
  - C-T1-F F-3, `cycles/cycle-5/stage4/critics/T1/F/CRITIQUE.md`, lines 107–126 (the lemma, its five-step proof, and the note that Darroch on `f_d^m` "would be wrong");
  - SR-C5-5 `### SR-C5-5a, step by step` 1–8, with repairs R-a2 (strict Darroch) and R-a3 (selector), and its registration text;
  - the SR-C5-5 brief;
  - the Cycle 5 T adjudication, Established 4–6 and the Lean-readiness note;
  - `cycles/cycle-5/CYCLE-CLOSE.md`, keys 6–7;
  - SR-C5-4 `### 4a` steps 1–6, its "Elementary replacement for Darroch: none", its registration text, and its brief.
- Cycle 6:
  - C-T1-F: F1 (the forest real-rootedness refutation), F4, F6 (the flag) and the critic-derived Tool (D) lemma;
  - the T adjudication: F1 findings, and "Darroch hygiene flag" under `## Rejected and narrowed mechanisms`;
  - controller fact CF6-6 (a fact, never authority).
- Registered faces (460 snapshot): the `d ≤ 6` sector key, the E1 threshold key, the CBstar key, and every claim whose text mentions Darroch or Newton (list in 4c).

**Statements.**
- **SR-C6-4a.** Does the proof of record of `E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS` apply Newton or Darroch only to shifted products of linear factors? Confirm (the key keeps `proved_informal` modulo Darroch/Newton on such products) or regress (to `bounded_computation` on its census).
- **SR-C6-4b.** Does `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` apply Darroch only to `r_q = (1+y)^{qd−1}(1+2y)^{d(m−q)+1}`, and Newton only for their log-concavity? Is its "modulo Darroch" qualifier on its face?
- **SR-C6-4c.** Every other Darroch- or Newton-dependent face in the 460 snapshot (searched), plus the K-2 cross-reference.
- **SR-C6-4d.** The S-6 scope-note text.

**Named classical dependencies (not under `sources/`; not re-proved here).**
- J. N. Darroch (1964): every mode of a Poisson-binomial law (a sum of independent Bernoulli variables) lies in `{⌊μ⌋, ⌈μ⌉}`, and equals `μ` when `μ ∈ ℤ`.
- Newton's inequalities: the coefficients of a real-rooted polynomial with nonnegative coefficients are log-concave, with no internal zeros.

## Independent re-derivation

### SR-C6-4a — every Newton/Darroch application in the proof of record, one by one

Setup (SR-C5-5, checked again). Condition on `r`:
- `r ∉ I` gives the component `s–v`, with polynomial `1+2y`, times `m` choke subtrees. Each choke subtree contributes `f_d = y(1+y)^d + (1+2y)^d`.
- `r ∈ I` gives `y(1+y)(1+2y)^{dm}`.
- So `I(CB(d,m)) = (1+2y) f_d^m + y(1+y)(1+2y)^{dm}`.
- My instrument checks this closed form against a literal rooted-tree DP on the explicit edge list for all 30 rows `d ≤ 6`, `m ≤ 5`. The tree property (edge count and connectivity) is asserted on each row. There are 0 mismatches.

`x(G) = min{k : Δ_k(G) < 0}` with `Δ_k = i_{k+1} − i_k` and the terminal difference `Δ_α = −i_α` (SEMANTIC-CONTRACT, first strict descent). So `Δ_k(I) ≥ 0` for all `k ≤ N − 1` gives `x ≥ N`.

Here is the complete list of the objects the proof treats analytically, with where Newton or Darroch enters:

| # | Step (SR-C5-5 numbering) | Object | Tool applied | Shifted product of linear factors? | Real-rooted? (own Sturm) |
|---|---|---|---|---|---|
| 1 | step 1, binomial split | `(1+2y) f_d^m = Σ_q C(m,q) T_q` | none (algebra: binomial theorem on `f_d^m = (y(1+y)^d + (1+2y)^d)^m`) | n/a | n/a |
| 2 | steps 2–3 | `T_q = y^q (1+y)^{qd} (1+2y)^{d(m−q)+1}`, `0 ≤ q ≤ m` | Newton (log-concave, so nondecreasing to the first mode); Darroch (first mode `≥ ⌊μ⌋`) | **yes**: the monomial `y^q` times the linear factors `1+y` and `1+2y` | yes: 162/162 positive controls (`d ≤ 6`, `m ≤ 6`, all `q`) |
| 3 | steps 2–3 | `E = y(1+y)(1+2y)^{dm}` | Newton; Darroch | **yes** | yes: 36/36 |
| 4 | step 4 | the means of `T_q` and `E` | exact arithmetic only | n/a | n/a |
| 5 | step 5 | `I = Σ_q C(m,q) T_q + E` | **none**: coefficientwise sum of nondecreasing prefixes with positive weights | not required | **no** (see below) |
| 6 | explanatory companion (R-a5) | `μ(d) = f_d′(1)/f_d(1)` and `2d/3 − μ(d) = 2^d(d−6)/(6(2^d+3^d))` | none: a mean identity, used in no proof step | n/a | `f_d` is not real-rooted for `d = 3..8` (own Sturm) |
| 7 | steps 6–8 (sector conclusion, selector) | the CBstar `t = 1` criterion; private-tag witness sets | none | n/a | n/a |

**Where Darroch and Newton are NOT applied.**
- They are never applied to `I(CB(d,m))`, to `f_d` or `f_d^m`, or to any tree or forest independence polynomial.
- The proof never uses unimodality of `I`, a mode of `I`, or a mean of `I` or of `f_d^m`.
- The only step that touches `I` is step 5. It adds the nondecreasing prefixes `a_0 ≤ … ≤ a_N` of the summands, `N = ⌊(2dm+2)/3⌋`, with the weights `C(m,q) > 0` and `1`. It is a positivity argument and needs no property of `I` as a polynomial.
- C-T1-F had already written in Cycle 5 (F-3, last paragraph) that "`f_d` is NOT real-rooted for `d ≥ 3`" and that "a Darroch argument applied directly to `f_d^m` would be wrong". The proof was built around that fact.

**Hypotheses of Darroch and Newton, checked where they enter.**
- **Newton.** The input is a polynomial with nonnegative coefficients and only real roots.
  - `T_q` has roots `0` (multiplicity `q`), `−1` (multiplicity `qd`) and `−1/2` (multiplicity `d(m−q)+1`).
  - `E` has roots `0`, `−1` and `−1/2`.
  - Coefficients are positive on the support interval `[q, deg]`, with only leading zeros from the shift, so there are no internal zeros.
  - Log-concavity without internal zeros gives nonincreasing ratios `a_{k+1}/a_k` on the support. So the sequence, including the leading zeros, is nondecreasing up to its first mode.
- **Darroch.** `T_q / T_q(1)` is the law of `q + Bin(qd, 1/2) + Bin(d(m−q)+1, 2/3)`. That is a deterministic shift by `q` of a Poisson-binomial law with success probabilities in `{1/2, 2/3} ⊂ (0,1)`. `E / E(1)` is `1 + Bernoulli(1/2) + Bin(dm, 2/3)`.
  - Darroch applies to the unshifted Poisson-binomial part. The shift moves the mean and every mode by the same integer.
  - So every mode of each summand lies in `{⌊μ⌋, ⌈μ⌉}`, and the **first mode is `≥ ⌊μ⌋`**.
  - This needs the strict form: every mode is within distance strictly less than 1 of `μ`, and equals `μ` when `μ ∈ ℤ`. SR-C5-5 repair R-a2 put that form on the face. The registered statement reads "by Darroch every mode lies in `{⌊μ⌋, ⌈μ⌉}`", which is the correct strict form.
- **The guard `d ≤ 6`.**
  - `mean(T_q) = q + qd/2 + 2(d(m−q)+1)/3 = 2dm/3 + 2/3 + q(1 − d/6)`.
  - `mean(E) = 1 + 1/2 + 2dm/3 = 2dm/3 + 3/2`.
  - For `q ≥ 0`, `q(1 − d/6) ≥ 0` holds exactly when `d ≤ 6`. So every summand has `μ ≥ (2dm+2)/3`, hence `⌊μ⌋ ≥ N`. `E` needs no guard.
  - At `d = 6` equality `μ(T_q) = (2dm+2)/3` holds for every `q`, which is the sharp case.
  - `d ≤ 6` enters here and only here.
- **ℕ-subtractions.**
  - `m − q` is guarded by `0 ≤ q ≤ m`.
  - `N − 1 = ⌊(2dm−1)/3⌋` is guarded by `dm ≥ 1`.
  - `p − 1` and `K − 1` in the CBstar step are guarded by `p ≥ x + 2 ≥ 2`.
  - `N ≤ α = 1 + m(d+1)`, so the terminal difference is not in play.

**Conclusion for 4a.** Newton and Darroch are applied to exactly two kinds of polynomial: the `m + 1` summands `T_q` and the summand `E`. Each is a monomial times a product of linear factors `(1+y)^a(1+2y)^b`, that is, a shifted Poisson-binomial law. Both theorems are applied within their hypotheses, and the argument never needs a mode or unimodality of the sum. The F1 failure mode (Darroch fed a non-real-rooted tree polynomial) **does not occur** in this proof. Regression is not warranted.

### Own instrument (`sr64_instr.py`, exact integers and `Fraction`; output digest `3e186d63…`)

**(1) Sturm real-root counts.** The counter uses exact `Fraction` Sturm sequences on the square-free part. A polynomial is real-rooted iff its number of distinct real roots equals its number of distinct roots.

| Polynomial | Degree | Distinct roots | Distinct real roots | Real-rooted |
|---|---|---|---|---|
| `K_{1,3}`: `1+4y+3y²+y³` | 3 | 3 | 1 | **no** |
| `K_{1,4}` | 4 | 4 | 2 | no |
| `f_1`, `f_2` | 2, 3 | 2, 3 | 2, 3 | yes |
| `f_3` … `f_8` | 4 … 9 | 4 … 9 | 2, 3, 2, 3, 2, 3 | **no** for every `d = 3..8` |
| `f_d^m`, `d = 3..8`, `m = 2, 3` | `m(d+1)` | `d+1` | as `f_d` | no |
| `I(CB(d,m))`, `d = 3..8`, `m = 1..4` | `1 + m(d+1)` | same | 3 to 5 | **no** on all 24 rows |
| `I(CB(1,m))`, `m = 1..4`; `I(CB(2,m))`, `m = 1..4` | | | | yes at `(1,1)`, `(1,2)`, `(2,1)`; no at `(1,3)`, `(1,4)`, `(2,2)`, `(2,3)`, `(2,4)` |
| `T_q`: `d ≤ 6`, `m ≤ 6`, all `q` (positive control) | | | | yes, 162/162 |
| `E`: `d ≤ 6`, `m ≤ 6` (positive control) | | | | yes, 36/36 |
| `r_q`: `d = 6..10`, `m ≤ 5`, all `q` (positive control) | | | | yes, 75/75 |
| `(1+3y+y²)^k`, `k ≤ 11` (positive control) | | | | yes, 11/11 |

- The counts at `d = 8` (`I(CB(8,m))`: 4, 5, 4, 5 real roots of degree 10, 19, 28, 37) agree with C-T1-F's `realroot_test.log`, a third instrument only.
- **Minimal witness.** An exhaustive enumeration of all labelled trees of order 1–7 (Prüfer sequences), with literal DP and Sturm counts, gives these numbers of distinct non-real-rooted independence polynomials: 0, 0, 0, **1** (`K_{1,3}`), 1, 3 and 7. The 1, 1, 1, 2, 3, 6 and 11 trees of these orders have pairwise distinct polynomials, so these are also tree counts. The smallest tree whose independence polynomial is not real-rooted is `K_{1,3}`, of order 4.

**(2) Bounded support for the Darroch step** (`d ≤ 6`, `m ≤ 40`, every `q`; 5,400 summands, 0 failures).
- Each `T_q` and `E` is nondecreasing through index `N = ⌊(2dm+2)/3⌋`.
- Its first mode is `≥ ⌊mean⌋` and `≥ N`.
- Every mode lies in `{⌊μ⌋, ⌈μ⌉}`.
- The binomial split re-sums to the closed form of `I` on all 240 `(d, m)` rows.

This is **bounded_computation support for the Darroch step, not a proof of Darroch or of Newton**.

**(3) Mean identities in exact `Fraction`s.**
- `mean(T_q) = 2dm/3 + 2/3 + q(1 − d/6)` and `mean(E) = 2dm/3 + 3/2` hold on all 5,400 summands above, and `μ ≥ (2dm+2)/3` holds on each.
- The algebraic identity `q + qd/2 + 2(d(m−q)+1)/3 = 2dm/3 + 2/3 + q(1 − d/6)` holds on the grid `d, m ≤ 12`, all `q`, with 0 failures. I also derived it by hand, above.

**(4) Census** (the census a regression would fall back to; bounded, not evidence).
- For `1 ≤ d ≤ 6` and `1 ≤ m ≤ 200` (1,200 rows, `x` computed through `α = 1 + m(d+1)`, which is asserted), `x ≥ ⌊(2dm+2)/3⌋` holds on every row.
- The minima of `3x − 2dm` are 4, 3, 3, 2, 2, 3 for `d = 1..6`.
- Equality holds at exactly `CB(4,2)` and `CB(5,m)` for `m = 1, 4, 7, 10, 13, 16`.
- This reproduces SR-C5-5's census, and it agrees with C-T1-F's `d_le6_x_check.log` (900 rows, `m ≤ 150`, 0 violations), a third instrument.

**Non-product control (data only).**
- `I(CB(d,m))` itself is not real-rooted on every checked row with `d ≥ 3` (`d ≤ 8`, `m ≤ 4`), so Darroch could not have been applied to it.
- The proof's route does not need it, and my instrument never uses a mode of `I`. It records the first mode of `I` beside its mean for `d = 3..6` and `m ∈ {1, 2, 3, 5, 10}` only as a descriptive table in the output.

### SR-C6-4b — the E1 threshold key

The proof of record is C-T1-U A5 as read by SR-C5-4 `### 4a` steps 1–6, and it is on the registered face verbatim.
- **Step 1.** `r_q = (1+y)^a (1+2y)^b` with `a = qd − 1 ≥ 5` (since `d ≥ 6` and `q ≥ 1`) and `b = d(m−q) + 1 ≥ 1`. Its roots are `−1` and `−1/2`, and its coefficients are positive on `0..dm`. It is a Poisson-binomial law with `p ∈ {1/2, 2/3}` and mean `μ_q = (qd−1)/2 + 2(d(m−q)+1)/3`.
- **Step 2.** Newton gives log-concavity of `r_q`, with no internal zeros. It is applied to nothing else.
- **Step 3.** Darroch gives `⌊μ_q⌋ ≤ M_q ≤ ⌈μ_q⌉`, applied to `r_q` only.
- **Steps 4–6.** Arithmetic in `μ_q + q` and the integer rank bookkeeping. No other polynomial is analysed.
- **The qualifier is on the face.** The snapshot's `scope` field ends "Grade qualifier (second read): modulo Darroch 1964, a classical theorem not under sources/, named here as an undischarged dependency; log-concavity by Newton's inequalities, classical". The statement's proof names Newton in step (2) and Darroch in step (3). `evidence_grade` is the bare `proved_informal`, and the Cycle 5 close normalized the qualifier into `scope`.
- **Own data** (`sr64_rq.py`, `d = 6..10`, `m ≤ 25`, every `q`; 1,625 `r_q`):
  - positive coefficients, log-concavity, the mean formula, and every mode in `{⌊μ_q⌋, ⌈μ_q⌉}` all hold, with 0 failures;
  - the Sturm positive control holds on 75/75.
- **Consumers that inherit this key's Darroch dependency, all through `r_q` only:**
  - the `[r30 C5; SR-C5-4]` scope note on `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`;
  - obligations row `R30-C5-CB-CONDITION-I-AND-SECTOR-DEFICIENCY-BAND` (`proved_informal` "modulo Darroch 1964, through" this key);
  - the Cycle 6 synthesis item 4 citation (E1(i) at `p*` on `𝒞_8`) and S-3.
  - Obligations row `R30-C5-CB8-TOP-SECTOR-DEFICIENT-RANK-FAMILY` is `bounded_computation`. It mentions Darroch only to say that Darroch does not decide the excluded rank.
- **Conclusion for 4b.** Darroch is applied only to the products of linear factors `r_q`, and Newton only for their log-concavity. Confirmed.

### SR-C6-4c — every other Darroch/Newton-dependent face (search, not assumption)

`registry_search.py` searched every string field of every claim for `darroch|newton`, case-insensitively, in the 460 snapshot, the 434 master and the 457 master. `registry_search2.py` ran a secondary search for `real-root`, `Poisson-binomial`, `mean-mode`, `first mode`, `mode of` and `local-CLT`. It catches reasoning that applies real-rootedness without naming Newton.

- 460 snapshot: 10 claims name Darroch or Newton.
- 434 master: 2 claims, both pre-r30.
- 457 master: the same 2 claims.
- Non-claim top-level fields: 0 hits.
- Obligations CSV: 4 rows.

| Claim (460 snapshot) | Field(s) | What is invoked, on what | Hygiene |
|---|---|---|---|
| `E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS` | statement, scope, certificate, history | Newton and Darroch on `T_q`, `E` | 4a: **pass** |
| `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` | statement, scope, certificate, history | Newton and Darroch on `r_q` | 4b: **pass** |
| `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` | scope (`[r30 C5; SR-C5-4]` note) | inherits 4b (`r_q`) | pass |
| `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` | scope (`[r30 C5; SR-C5-5]` and `[… #2]` notes) | (i) a cross-reference to the `d ≤ 6` key, which inherits 4a; (ii) the `CB(1,m)` note, with Newton on `(1+3y+y²)^m`, whose roots `(−3 ± √5)/2` are real ("Darroch-free") | pass |
| `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2` | statement, scope | Newton on the real-rooted `(1+3y+y²)^k` | pass |
| `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN) | scope (spider scope note) | the same Newton use, by citation | pass |
| `E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE` | statement, certificate | an alternative ("second") proof: Newton on the palindromic real-rooted `(1+3y+y²)^{k+1}`; the proof of record is elementary (C-U1-F) | pass |
| `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` | certificate only | "C-F2-T … the independent bound `S ≤ −2 − 2^(k+1)` (Newton/Darroch)"; see the finding below | the face proof (Lemma M) uses neither, so the grade does not depend on them; **the alternative is not auditable in this capsule** |
| `E993-PAIR-UNION-MODE` (pre-r30; also in both masters) | statement, scope, certificate | Darroch on the mixed families `(1+x)^p(1+2x)^q` | pass (products of linear factors) |
| `E993-PAIR-BROOM-DOMINATION` (pre-r30; also in both masters) | statement | "no Newton, no external citation", a negative mention | not dependent |

**Implicit uses** (secondary search). `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` uses "`(1+3y+y²)^k` is palindromic, real-rooted and strictly decreasing past its centre". That is Newton on a real-rooted input, not named: pass. `E993-PAIR-STAR-CLOSURE`, `E993-PAIR-BROOM-DOMINATION` and `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN` mention real-rootedness only to disclaim its use.

**The refuted key behind the hygiene rule.** The registry already carries `E993-TREE-REAL-ROOTED` ("Every finite tree has a real-rooted independence polynomial"), with status `REFUTED` in all three registries.
- T1's Cycle 6 citation ("the independence polynomial of any finite forest has only real roots") implies that refuted statement. It was therefore a revival of a REFUTED registered key.
- No Cycle 6 document in my capsule names the key.
- The key's `alias_patterns` (`real[- ]rooted…trees?` and `trees?…real[- ]rooted`) do **not** match T1's wording, since "forest" and "only real roots" slip past them (`sr64_alias.py`, 0 hits in all three registries). That is why no lexical screen caught it.
- The key records `smallest_witness_order: 26`, with the certificate "implied by E993-UNIV-TREE-TRS2". My exhaustive enumeration shows the minimal witness is `K_{1,3}`, of **order 4**. The recorded 26 is the order at which the log-concavity refutation implies non-real-rootedness, not the minimum.

**K-2 cross-reference (SR-C6-1's verdict, not mine).** The synthesis states K-2's grade as "`proved_informal` modulo Darroch and Newton (products of linear factors only)". `## Exact established results` item 2 says "applied only to products of linear factors". R-6 records that Tool (D) is applied "only to products of linear factors and to the factor `1+3x+x²` (discriminant 5)". That factor is itself `(1+ax)(1+bx)` with `a, b = (3 ± √5)/2 > 0`, a product of real linear factors. **Confirmed as a cross-reference**: the wording is on K-2's proposed face.

### SR-C6-4d — the hygiene rule as a scope note

The text is under `## Registration text`.

## Findings and repairs

1. **(4a) No regression.** The `d ≤ 6` key's proof applies Newton and Darroch only to `T_q` (for `0 ≤ q ≤ m`) and to `E`, all shifted products of `(1+y)` and `(1+2y)`. It never applies them to `I(CB(d,m))`, `f_d`, `f_d^m` or any tree polynomial. It uses only summand-wise monotone prefixes and positive weights. The key keeps `proved_informal` modulo Darroch/Newton on products of linear factors, and no statement text changes.
2. **(4a, face hygiene; additive) Newton missing from the qualifier.** The registered grade qualifier names Darroch only ("modulo Darroch (1964)"), while the statement's proof also invokes Newton ("log-concave by Newton"). The replacement FENCES text below names both, and the domain restriction to products of linear factors. This is additive, not a repair of the mathematics. Log-concavity of such products is also elementary (a convolution of log-concave Bernoulli laws), so naming Newton adds no new risk.
3. **(4a, wording errata candidates; facts, not authority).**
   - CF6-6 says the key "applies Darroch's mode theorem to the independence-polynomial data of CB(d,m)".
   - The sealed SR-C5-5 brief says "Darroch's theorem applied term by term to the real-rooted factors of `I(CB(d,m))`".
   - Both are loose. `T_q` and `E` are **summands** of a binomial split of `I`, not factors of `I`, and Darroch is applied to them, not to `I`'s data. Proposed wording: "applies Darroch's theorem to the summands `T_q`, `E` of a binomial split of `I(CB(d,m))`, each a shifted product of linear factors".
4. **(4a/4b, registry hygiene; errata candidates for the close, outside the mathematics).**
   - **Alias fields.** Both keys' `aliases` fields hold comma fragments:
     - `"E993-R30-CB-CHOKE-DEGREE-AT-MOST-SIX-SECTOR-DELETION-SUFFICIENT-AT-EVERY-ELIGIBLE-RANK (synthesis proposal"` / `"renamed by SR-C5-5)"`;
     - `"E993-R30-CB-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD (synthesis proposal"` / `"renamed by SR-C5-4)"`.
     This violates the names-only alias rule, in the same class as R30-E-i. The `d ≤ 6` key also lacks SR-C5-5's alias "CB at-most-six-supports sector non-deficiency". Repaired ALIASES lines are below; they have a clean lexical screen against all three registries.
   - **Terminal history.** Both keys' `terminal_history` registration events carry `"cycle": 4`, but both were registered at the Cycle 5 close.
   - **Obligations provenance.** Rows `R30-C5-SR-C5-4` and `R30-C5-SR-C5-5` give "synthesis C2 registrations"; the source is the Cycle 5 synthesis.
5. **(4b) Confirmed.** Darroch is applied only to `r_q`, and Newton only for `r_q`'s log-concavity. The qualifier is on the face, in `scope`, as the grade qualifier, and in the statement's proof.
6. **(4c) Finding on GK-SIGN's certificate.**
   - The certificate of `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` credits C-F2-T (Cycle 3) with "the independent bound `S ≤ −2 − 2^(k+1)` (Newton/Darroch)".
   - The face's own proof is Lemma M (palindromy recursions, elementary). It proves the displayed bound `S ≤ −(3^k + 2^k + (k+2)(2^k + 3^(k−1))) < −2`, and hence `S ≤ −2 − 2^(k+1)`, with no Newton or Darroch. So **the key's grade does not depend on the tagged alternative**, and no regression arises.
   - The objects in that key are `P^(k+1)` (real-rooted) and `(1+y)^2(1+2y)^k` (a product), but also the differences `H_v − R_v`. I cannot see from my capsule which polynomial C-F2-T fed to Darroch.
   - Recommendation: a one-line scope note (below) saying the alternative is not the proof of record and must not be cited as a proof until it is read under the hygiene rule.
7. **(4c) Finding on `E993-TREE-REAL-ROOTED`.**
   - T1's struck Cycle 6 lemma was a revival of this REFUTED key, and the registered alias patterns miss the forest/"only real roots" wording.
   - The recorded smallest witness order, 26, is not minimal: `K_{1,3}`, order 4, is the minimal witness, shown by exhaustive enumeration through order 7.
   - I propose, as optional and at the registrar's discretion:
     - a scope note recording `K_{1,3}` and the forest form;
     - two alias names;
     - that the controller consider an erratum to `smallest_witness_order` (26 → 4) and an alias pattern covering "forest" and "real roots". A pattern is outside the ALIASES grammar, so I only recommend it.
8. **No fence crossed.**
   - This read changes no statement and no grade.
   - It touches no (HALL) scope, the primary aggregate or the sign of `S`.
   - It revives no refuted mechanism and re-proves no closed region.
   - It cites no census as evidence.
   - It uses no struck item. T1's forest real-rootedness citation is cited only as the thing excluded.

## Registration text

The replacement face of the `d ≤ 6` key follows. STATEMENT and SCOPE are unchanged from the registered text, verbatim. FENCES is the registered fence text plus the explicit hygiene clauses. ALIASES is repaired.

```text
KEY: E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let 1 ≤ d ≤ 6 and m ≥ 1, and let CB(d,m) = CBstar(d,m,1) be the tree with path r – s – v, m chokes u_i adjacent to r, d supports b_ij adjacent to each u_i and one private leaf c_ij adjacent to each b_ij (n = 3 + m + 2dm). Then I(CB(d,m)) = (1+2y)·f_d^m + y(1+y)(1+2y)^{dm} with f_d = y(1+y)^d + (1+2y)^d, and the first strict descent (computed through rank α = 1 + m(d+1)) satisfies x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋, hence 3x ≥ 2dm. Consequently, for every rank p ≥ x + 2 (in particular every eligible p) and every set F of leaves of CB(d,m) (in particular F = F_p(T)), no subfamily X of the root-plus-arm sector {B ∈ I_{p+1} : r, v ∈ B} is deletion-deficient: Σ_{B∈X} w_F(B) ≤ Σ_{A∈N_D(X)} w_F(A), and a fortiori ≤ Σ over the (D) ∪ (S) neighbourhood. Proof: I = Σ_q C(m,q)·T_q + E with T_q = y^q (1+y)^{qd} (1+2y)^{d(m−q)+1} and E = y(1+y)(1+2y)^{dm}; each summand is a shifted Poisson-binomial coefficient sequence (log-concave by Newton, so nondecreasing to its first mode), with means 2dm/3 + 2/3 + q(1 − d/6) and 2dm/3 + 3/2, both ≥ (2dm+2)/3 because d ≤ 6; by Darroch every mode lies in {⌊μ⌋, ⌈μ⌉}, so every summand is nondecreasing through index ⌊(2dm+2)/3⌋ and Δ_k(I) ≥ 0 for k ≤ ⌊(2dm−1)/3⌋. For p ≥ x + 2, 3p ≥ 2dm + 6 > 2dm + 5, so by E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT at t = 1 (deficient iff 3p < 2dm + 5) no sector subfamily is deletion-deficient when v ∈ F and P ⊆ F. For general F: each private tag c_ij has W = {u_i}, and u_i lies in no sector source and in no deletion target of one, so the sector deletion network depends on F only through [v ∈ F], and v ∉ F gives weight 0. The bound x ≥ ⌊(2dm+2)/3⌋ is attained (e.g. CB(4,2), CB(5,1), bounded_computation).
SCOPE: The root-plus-arm sector of the homogeneous CB(d,m) family, 1 ≤ d ≤ 6, m ≥ 1, every rank p ≥ x(T) + 2, every set F of leaves. Deletion arcs; the (D) ∪ (S) inequality on sector subfamilies follows from N_D ⊆ N.
ATTRIBUTION: C-T1-F (Claude Opus 5.5; r30 Cycle 5 critic-derived lemma F-3, the binomial split and the summand-mean bound; proof of record); isolated second read SR-C5-5 (Claude Opus 5.5; the selector-independence step at t = 1, the strict Darroch form, the sharper bound on the face); the mean identity 2d/3 − μ(d) = 2^d(d−6)/(6(2^d+3^d)) as an explanatory companion, C-T1-F and C-T1-U (Claude Opus 5.5); the r30 Cycle 5 T adjudicator (Claude Opus 5.5; step check and census); E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT (C-T2-U and T2, with their attribution); the Darroch hygiene flag, C-T1-F (r30 Cycle 6, Claude Opus 5.5; F6), endorsed by the r30 Cycle 6 T adjudicator; isolated second read SR-C6-4 (Claude Opus 5.5; hygiene confirmed); J. N. Darroch, On the distribution of the number of successes in independent trials, Ann. Math. Statist. 35 (1964) (classical); Newton's inequalities (classical); Codex (GPT-6) for the transport mechanism, the active-tag weight and the relation; the first-interior run (Codex) for the definition layer, entries 1–18.
FENCES: sector subfamilies of CB(d,m) with d ≤ 6 only; not (HALL) or (HALL-COND) for any X outside the sector, at any scope; not a (CUT); not the primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, nothing about the sign of S(T, p); no status transfer to E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993; not E993-R23-LITERAL-DELETE-ONLY-HALL (distinction row); not E993-GRAPH-SINGLE-RANK-DELETION-SUFFICIENT (distinction row); nothing for d ≥ 7, where eligible sector-deficient rows exist (bounded census, first CB(7,109)/510); modulo Darroch (1964) and Newton's inequalities, both named classical dependencies not under sources/ and undischarged, and both invoked ONLY for the shifted products of linear factors T_q = y^q (1+y)^{qd} (1+2y)^{d(m−q)+1} (0 ≤ q ≤ m) and E = y(1+y)(1+2y)^{dm} (shifted Poisson-binomial laws, all roots real); no step applies Darroch, Newton, unimodality or a mode to I(CB(d,m)), to f_d, to f_d^m or to any other tree or forest independence polynomial, which are not real-rooted in general (K_{1,3}; f_d for 3 ≤ d ≤ 8 by exact Sturm counts; E993-TREE-REAL-ROOTED is REFUTED); the only step on I itself adds the summands' nondecreasing prefixes with the positive weights C(m,q); the mean identity for f_d is explanatory and supports no mode, mean-to-mode or descent statement about f_d^m or I; nothing for d ≥ 7 (the Cycle 5 local-CLT sketch there is not part of this key); the census rows (SR-C5-5: 1,200 rows d ≤ 6, m ≤ 200; C-T1-F: 900 rows m ≤ 150; SR-C6-4: 1,200 rows) are bounded_computation and are not evidence of the statement.
ALIASES: CB at-most-six-supports sector non-deficiency
ALIASES: CB d at most 6 sector sufficiency
ALIASES: E993-R30-CB-CHOKE-DEGREE-AT-MOST-SIX-SECTOR-DELETION-SUFFICIENT-AT-EVERY-ELIGIBLE-RANK
```

```text
SCOPE NOTE ON: E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS
TEXT: [r30 C6; SR-C6-4] Darroch hygiene (S-6). Darroch's theorem and Newton's inequalities are invoked only for products of linear factors: the summands T_q = y^q (1+y)^{qd} (1+2y)^{d(m−q)+1} (0 ≤ q ≤ m) and E = y(1+y)(1+2y)^{dm} of the binomial split I(CB(d,m)) = Σ_q C(m,q) T_q + E, each a shifted Poisson-binomial law whose first mode is ≥ ⌊mean⌋ ≥ ⌊(2dm+2)/3⌋ when d ≤ 6. The independence polynomial of a forest is not real-rooted in general (K_{1,3}: 1 + 4y + 3y² + y³ has one real root; E993-TREE-REAL-ROOTED is REFUTED), and f_d is not real-rooted for 3 ≤ d ≤ 8 (exact Sturm counts), so no step applies them to I(CB(d,m)), f_d or f_d^m; the proof uses no unimodality or mode of I, only summand-wise monotonicity up to each summand's first mode and the positivity of the weights C(m,q). The key keeps proved_informal modulo Darroch (1964) and Newton on products of linear factors; no regression. Bounded support, not proof: exact Sturm counts (T_q, E, r_q real-rooted on every control; I(CB(d,m)) not real-rooted for 3 ≤ d ≤ 8, m ≤ 4) and 5,400 summands (d ≤ 6, m ≤ 40, every q) nondecreasing through ⌊(2dm+2)/3⌋ with first mode ≥ ⌊mean⌋. Attribution: the flag, C-T1-F (r30 Cycle 6, Claude Opus 5.5; F6), endorsed by the r30 Cycle 6 T adjudicator (Claude Opus 5.5) and carried as controller fact CF6-6; the refutation instance K_{1,3} and the non-real-rootedness of I(CB(8,m)), C-T1-F (F1), replayed by C-T1-U and the T adjudicator; the proof of record, C-T1-F (r30 Cycle 5, F-3) as repaired by the isolated second read SR-C5-5 (Claude Opus 5.5); this hygiene read, SR-C6-4 (Claude Opus 5.5). This note changes neither this key's statement, grade nor fences.
```

```text
SCOPE NOTE ON: E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD
TEXT: [r30 C6; SR-C6-4] Darroch hygiene. Darroch's theorem is invoked only for r_q = (1+y)^{qd−1}(1+2y)^{d(m−q)+1}, a product of linear factors (roots −1 and −1/2 only; a Poisson-binomial law), and Newton's inequalities only for the log-concavity of the same r_q; no step applies either to a tree or forest independence polynomial (not real-rooted in general: K_{1,3}; E993-TREE-REAL-ROOTED is REFUTED). Every citation of this key (the [r30 C5; SR-C5-4] note on E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, R30-C5-CB-CONDITION-I-AND-SECTOR-DEFICIENCY-BAND, E1(i) at p* on 𝒞_8) inherits exactly this dependency. Bounded support, not proof: 1,625 r_q (d = 6..10, m ≤ 25, every q) with every mode in {⌊μ_q⌋, ⌈μ_q⌉}. Attribution: C-T1-F (r30 Cycle 6, Claude Opus 5.5; F4 and F6, which first recorded that this key's generating functions are products of linear factors) and the r30 Cycle 6 T adjudicator (Claude Opus 5.5), who recorded that this key passes; isolated second read SR-C6-4 (Claude Opus 5.5). This note changes neither this key's statement, grade nor fences.
```

```text
SCOPE NOTE ON: E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE
TEXT: [r30 C6; SR-C6-4] Darroch hygiene. The proof of record on this key's face (Lemma M and the three summand closed forms, C-F2-U) uses neither Darroch's theorem nor Newton's inequalities, and it already yields S(G_k, k+3) ≤ −2 − 2^(k+1). The certificate's "(Newton/Darroch)" tag attaches only to C-F2-T's independent alternative bound (r30 Cycle 3). That alternative is not the proof of record, was not audited under the hygiene rule (Darroch and Newton only on products of linear factors or other real-rooted inputs; tree independence polynomials are not real-rooted in general, K_{1,3}), and is not to be cited as a proof until it is. This note changes neither this key's statement, grade nor fences.
```

```text
SCOPE NOTE ON: E993-TREE-REAL-ROOTED
TEXT: [r30 C6; SR-C6-4] Minimal witness and forest form. K_{1,3} (order 4) has I = 1 + 4y + 3y² + y³, whose derivative 3y² + 6y + 4 has discriminant −12, so I has exactly one real root; every tree of order ≤ 3 is real-rooted, so order 4 is minimal (exhaustive through order 7, exact Sturm counts: 0, 0, 0, 1, 1, 3, 7 non-real-rooted independence polynomials at orders 1..7, one per tree since the 1, 1, 1, 2, 3, 6, 11 trees there have pairwise distinct polynomials, bounded_computation). The recorded smallest witness order 26 is the order at which the log-concavity refutation (E993-UNIV-TREE-TRS2) implies non-real-rootedness, not the minimum. The forest form ("the independence polynomial of any finite forest has only real roots") implies this statement and is refuted with it; it was cited in r30 Cycle 6 by route T1 and struck (C-T1-F F1; the r30 Cycle 6 T adjudicator), and the registered alias patterns did not match that wording. Proposed aliases for the registrar: forest independence polynomials are real-rooted; every forest independence polynomial has only real roots. Attribution: C-T1-F (r30 Cycle 6, Claude Opus 5.5; K_{1,3} on the face of F1), replayed by C-T1-U and the T adjudicator; isolated second read SR-C6-4 (Claude Opus 5.5; minimality and the alias gap). This note changes neither this key's statement, status nor fences.
```

```text
RECORD: R30-C6-SR4-DARROCH-HYGIENE-CENSUS
CLAIM: Exact (integer/Fraction) checks by SR-C6-4. Sturm: K_{1,3} has 1 of 3 roots real; f_d is real-rooted for d = 1, 2 and not for d = 3..8 (2 or 3 real roots of d + 1); I(CB(d,m)) is not real-rooted for d = 3..8, m = 1..4 (24 rows); T_q (162), E (36), r_q (75) and (1+3y+y²)^k (11) are real-rooted on every control. Summands: for d ≤ 6, m ≤ 40 and every q (5,400 summands) each T_q and E is nondecreasing through ⌊(2dm+2)/3⌋, has first mode ≥ ⌊mean⌋, has every mode in {⌊μ⌋, ⌈μ⌉}, and the split re-sums to I on all 240 rows; the closed form of I equals a literal tree DP on 30 rows (d ≤ 6, m ≤ 5). Census: x(CB(d,m)) ≥ ⌊(2dm+2)/3⌋ on all 1,200 rows d ≤ 6, m ≤ 200 (minima of 3x − 2dm: 4, 3, 3, 2, 2, 3; equality exactly at CB(4,2) and CB(5,m), m = 1, 4, 7, 10, 13, 16). r_q: 1,625 cases (d = 6..10, m ≤ 25) with every mode in {⌊μ_q⌋, ⌈μ_q⌉}. Trees of order ≤ 7: the minimal non-real-rooted independence polynomial is K_{1,3}'s.
STATUS: bounded_computation
PROVENANCE: isolated second read SR-C6-4 (Claude Opus 5.5), scratchpad/c6-sr-SR-C6-4/sr64_instr.py (output 3e186d63483cba2844add5cba819a5f31a059906d96f2b6fbb4fdbab27494982) and sr64_rq.py (output d4f1e640d8527694c4fa03075e64eeb992b375f3c2a22244c47b70e01287696d); support for the Darroch step and for the hygiene finding, never evidence in a proof and not a proof of Darroch or Newton.
```

## Verdicts

verdict[SR-C6-4a]: confirmed
verdict[SR-C6-4b]: confirmed
verdict[SR-C6-4c]: confirmed
verdict[SR-C6-4d]: confirmed

- **4a: confirmed; no regression.**
  - The `d ≤ 6` key's proof applies Newton and Darroch only to the shifted products of linear factors `T_q` and `E`. It never applies them to `I(CB(d,m))`, `f_d` or `f_d^m`.
  - It uses only summand-wise monotone prefixes and the positive weights `C(m,q)`. Darroch is used in its strict form, `d ≤ 6` enters only through `q(1 − d/6) ≥ 0`, and every ℕ-subtraction is guarded.
  - The key keeps `proved_informal` modulo Darroch/Newton on products of linear factors. The replacement FENCES text above says so explicitly, with Newton added to the qualifier and aliases repaired, while STATEMENT and SCOPE stay unchanged.
- **4b: confirmed.** Darroch is applied only to `r_q`, and Newton only for `r_q`'s log-concavity. The "modulo Darroch" qualifier, with Newton, is on the face.
- **4c: confirmed.**
  - 10 snapshot claims name Darroch or Newton, plus 1 implicit use. Every application is to a product of linear factors or to powers of the real-rooted `1 + 3y + y²`. No face regresses.
  - GK-SIGN's certificate tag attaches to a non-record alternative, which gets a scope note.
  - `E993-TREE-REAL-ROOTED` gets an optional scope note, with minimal witness `K_{1,3}` of order 4.
  - The K-2 cross-reference is confirmed: "products of linear factors only" is on its proposed face.
- **4d: confirmed.** The S-6 scope-note text is above, with the brief's attribution.

## Artifact inventory

Scratch is under `scratchpad/c6-sr-SR-C6-4/`. Everything uses the Python standard library with exact integers and `Fraction`, runs under `python3 -B`, and ran in the foreground.

| File | SHA-256 | Content |
|---|---|---|
| `seal_check.py` | `7082c6b336077ec273ac76b46756134b16bb2eca7bf7966050d5a98e24ac19b3` | Capsule seal and 224 member digests |
| `srcdigest_check.py` | `0830a2a06aa8f8ab32b21d675ccce35e622e8aaa4e8f454c3e1dd20cf1e0a26b` | Frozen instruments vs both SOURCE-DIGESTS.json |
| `registry_search.py` | `db1cb8f264290bffaad67a684ec960f6c5eb7a2b35ab184512415f5e712b6fc3` | Darroch/Newton search, three registries |
| `registry_search.out.json` | `5f2668975f37aedf4a0027ae960f1df0c7f927404fe09aa3758ae9cc378e4182` | Search output |
| `registry_search2.py` | `889159874a5a9804f94b32a3210529d16e19bef30df209b6d7fb5f4a9d85d559` | Secondary search (real-root / mode wording) |
| `sr64_instr.py` | `08d1ce3724a7b27dccbc3cd04d41a27c54b772f90eb8db04808369f73050433e` | Own instrument: Sturm, summand checks, means, census, tree minimal witness |
| `sr64_instr.out.json` | `3e186d63483cba2844add5cba819a5f31a059906d96f2b6fbb4fdbab27494982` | Its output (RESULT_SHA256 of the same bytes) |
| `sr64_rq.py` | `af33d3ea249f1e1d6f05fbb242c1ec0fe990d7477ab62e03df1e3e5fc9f6ffb9` | r_q Darroch/Newton data (E1 threshold key) |
| `sr64_rq.out.json` | `d4f1e640d8527694c4fa03075e64eeb992b375f3c2a22244c47b70e01287696d` | Its output |
| `sr64_alias.py` | `d05af201d5372a24337143da9b14389462b74cfe9bdf4d429e3851cb51d8594f` | Lexical screen of proposed aliases; T1 wording vs alias patterns |
| `sr64_alias.out.json` | `70a9c76779ad3bebea17ba8d52e85bd64bb29cd6f4eb39a3a138f72a156ad930` | Its output |
| `d6_statement.txt` | `b53bdce1838a433028306cc1d0e99611fee39cc40e860246fa243fcf23c4ae8a` | Registered statement of the d ≤ 6 key (verbatim extract) |
| `d6_scope_base.txt` | `ab6549e6b82e07b4cabbebcb7a4e09b2f1df19623a792a1a23ad6eba65b0144d` | Registered scope (extract) |
| `d6_fences_base.txt` | `9e04e323573d8558a71a6aef0236f3382d7df9c219b8a20ba35e01c2d9dbf92b` | Registered fences (extract) |
| `second_read_template.md` | `989a2f2cc77f1f406d012af70c67098ff02c1260cc0815d5f7bec2fa30e5aca1` | Template this file was assembled from |
| `assemble.py` | `16ed6734ae0e79cc9767fd644efa5ff059435a0afbc33badaa3c060232e2bef4` | Assembler (template + verbatim extracts + digests) |
| `second-reads/SR-C6-4/SECOND-READ.md` | (this file) | The read |

Capsule members I read (all digest-verified):
- the brief, the protocol and the manifest;
- `SEMANTIC-CONTRACT.md` (the `x`/`Δ` definitions, by `grep`) and `SOLUTION-CONTRACT.md` (§4 grades, by `grep`);
- the Cycle 6 synthesis (the sections named above);
- the Cycle 6 C-T1-F critique (summary, audit, F1–F7, the Tool (D) lemma);
- the Cycle 6 T adjudication (Darroch passages and the flag);
- the Cycle 5 C-T1-F critique (F-2 tail, F-3, F-4 head);
- the Cycle 5 T adjudication (Established 4–6 and the readiness note);
- `cycles/cycle-5/CYCLE-CLOSE.md` (keys and scope-note list);
- SR-C5-5 (whole) and SR-C5-4 (`### 4a` and the registration blocks);
- the SR-C5-5 and SR-C5-4 briefs (`grep` and the 5a passage);
- `C6-STAGE6-CONTROLLER-FACTS.json` (CF6-6 and the Darroch-mentioning facts);
- `C6-STAGE5-CONTROLLER-FACTS-T.json`, `CLAIM-DISTINCTIONS.json` and `C6-ALLOCATION.md` (`grep` only);
- `C6-CONTROLLER-ALIAS-PRESCREEN.json` (the K-2 entry);
- the three registries and the obligations CSV (programmatic search);
- CF-REPLAY-c6a–d (third instruments; only c6d touches the threshold key, and none bears on 4a);
- the C-T1-F Cycle 6 logs `d_le6_x_check.log`/`.py`, `realroot_test.log` and `sturm_sanity.log` (compared only).

Read-boundary deviations are listed under *Identity and seal audit*.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]
