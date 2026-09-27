# Second Read

Reader `SR-C4-9`, an isolated second read for Cycle 4 of run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30, Erdős #993).
It covers U2's `CB(d,1)` sector theorems: statements SR-C4-9a–9c of `control/C4-SECOND-READ-BRIEF-SR-C4-9.md`. Date 2026-09-27.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and loaded no other VerityOS subsystem (memory, decisions, logs,
conversations, operations, modules, skills, knowledge). The harness truncated the middle of `verity.md` on first display, and I
first displayed only the first 150 lines of the startup protocol. I then read the remaining spans of both files, so both were
read in full. The host injected the project `CLAUDE.md` and the auto-memory index into context at session start. I did not
open them or act on them.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Capsule** `control/c4-second-read/SR-C4-9-PACKET-MANIFEST.json`. The file is 11505 bytes, with SHA-256
  `eaa973f9461281b00153f0901b6eb213d06c213eedd02a2d60cf7b5cfe682f16`.
  - Inner seal: I took the SHA-256 of the compact (`(",", ":")`) key-sorted JSON of the manifest with `seal_sha256` removed,
    with no trailing newline. Recorded `b9378edad0ce23d4e08cdd1b0333ae5dcce46224e85747b339fa96f4dd822baf`; recomputed
    `b9378edad0ce23d4e08cdd1b0333ae5dcce46224e85747b339fa96f4dd822baf`. **MATCH.**
  - `file_count` is 63 and 63 entries are listed. I recomputed the SHA-256 and byte count of every member: **63/63 match**
    (`scratchpad/c4-sr-SR-C4-9/seal_audit.py`).
  - Stage `cycle-4-second-read-SR-C4-9`; schema `verityos.math-dre.packet-manifest.v1`.
- **Frozen reference instruments.** I checked the 36 capsule members under `sources/c4-stage7-sources/C-U2-{T,F}/` against
  `sources/c4-stage7-sources/SOURCE-DIGESTS.json` (itself a verified member), by path, SHA-256 and bytes: **36/36 match**. I used
  them for reading only. They are the seats' checks, not proof, and I replayed none of them. My own instrument is below.
- **Statement of record:** `cycles/cycle-4/stage6/SYNTHESIS.md` (`70021` bytes, digest verified). I read EST-11, R-16, the B9
  note and fidelity correction 6, registration item 12, the "Do not register" list and the headline table.
  - The brief cites "R-9, R-10" as the reconciliation items. In the synthesis, R-9 is CD-2/E1-R and R-10 is T2's E1 criterion,
    and U2's keys are **R-16**. This is a citation slip in the brief. I read R-16.
- **Read-boundary deviations.** All are listed here and repeated in the final message.
  1. I displayed the protocol and the manifest (`cat`, after a `wc -c`) before computing the seal, as the dispatch ordered
     ("FIRST read …"). The protocol is itself a capsule member, and its digest matched afterwards.
  2. The boot-file display was partial, then completed (see Boot). No other VerityOS file was opened.
  3. Every search was a single-file `grep`, or a Python string search, run on a capsule member: `SYNTHESIS.md`,
     `ADJUDICATION.md`, `SR-C3-7/SECOND-READ.md`, `OBLIGATIONS.c4-stage2.csv` and `C4-STAGE6-CONTROLLER-FACTS.json`. One `grep`
     on the controller-facts file failed with a regex-complexity error and produced no output. I then searched that file with
     Python.
  4. I read `control/C4-STAGE6-CONTROLLER-FACTS.json` (CF-U4, CF-U5, CF6-5) for orientation only. It is cited nowhere as
     evidence.
  5. There was no `find`, `ls -R`, `rg`, network access, install, Lean or `lake` use, background job or child agent.
     - I ran two non-recursive listings: `ls -la` of my own scratch directory, and `ls -d` of my output path before creating it.
     - Everything ran as `python3 -B` in the foreground. No `__pycache__` was written, and there was nothing to kill.
     - All scratch is under the absolute path `<run root>/scratchpad/c4-sr-SR-C4-9/`. Nothing was written to `/tmp` or to
       another seat's directory.

## Statements read

- **SR-C4-9a (key 1, as an extension of record B9).**
  - Setting: `CB(d,1)` at `p = k+1`, `1 ≤ k ≤ d`, with the derived indicators `1_v := [v ∈ F_p(T)]` and
    `1_c := [c_j ∈ F_p(T)]`.
  - Claim: `w_F(sec) = 2^k C(d,k)·1_v`, `w_F(N_D(sec)) = 2^{k−1}C(d,k−1)·1_v` and
    `w_F(N(sec)) = w_F(N_D(sec)) + (k−1)C(d,k−1)·1_c`.
  - Checks required: that the switch factor is `1_c`, and B9's text of record against the adjudicator's caveat.
  - Sources: U2 return, "B9 confirmation"; C-U2-T A3/A6; C-U2-F "One correction"; U adjudication row 2 and item D; B9's
    text of record (`OBLIGATIONS.c4-stage2.csv` row `R30-CB-RECORD-C3-B9-CBD1-WHOLE-SECTOR-SUMS`; SR-C3-7 §7c and its RECORD
    block).
- **SR-C4-9b (corrected key 2).** `max_{X⊆sec}(w_F(X) − w_F(N(X))) = 1_v·max(0, max_{0≤j0≤k} D(j0))`.
  - Here `X'_{j0} = {B ∈ sec : B holds at least j0 supports}` and `D(j0)` is its deficiency.
  - Proofs read: C-U2-T (quotient caterpillar, then run moves) and C-U2-F F-2 (supermodular invariant maximizer, then runs).
  - Also checked: that U2's literal statement (without the clamp) is false.
- **SR-C4-9c (scope and naming).**
  - The scope claim: `CB(d,1)` has no eligible rank for `d ≤ 300`.
  - The ruling asked for: record or key.
  - The name `E993-R30-CB-D1-ROOT-ARM-SECTOR-MAX-HALL-DEFICIT-EQUALS-SUPPORT-COUNT-SUFFIX-MAXIMUM`, with no "DEFICIENT-CUT" in
    any name.
  - C-U2-F's `m = 2` deficiencies `CB(5,2)/7` and `CB(10,2)/14`, as records.

## Independent re-derivation

**Frozen definitions used** (`SEMANTIC-CONTRACT.md` §1.1–1.2): `F_p(T) = {leaves v : Δ_p(T − v) < 0}` on the original tree; the
literal weight `w_F(B) = #{v ∈ F ∩ B : (B∖{v}) ∩ W_v ≠ ∅}` with `W_v = N(s_v)∖{v}`; and the relation (D) ∪ (S).

`CB(d,1)` is built as the contract says: path `r–s–v`, one choke `u ~ r`, supports `b_j ~ u`, and private leaves `c_j ~ b_j`,
for `j = 1..d`. So `n = 2d + 4`, the leaf set is `{v, c_1, …, c_d}`, `W_v = {r}` and `W_{c_j} = {u}`. The column group `S_d`
acts by automorphisms, so it preserves `F_p(T)` and hence the weight, the relation and `sec`. Because it is transitive on the
`c_j`, `1_c` is well defined.

**Key 1 (by hand).** Let `B ∈ sec`, that is, `B ∈ I_{k+2}` with `r, v ∈ B`.
- Then `s, u ∉ B`, and `B = {r, v}` plus `k` columns, each holding either `b_j` ("S") or `c_j` ("L"). Write `j(B)` for the
  number of S columns.
- `w(B) = 1_v`: `v` is active through `r`, and every `c_j` is inactive because `u ∉ B`. Hence `w(sec) = 2^k C(d,k)·1_v`.
- The deletion targets are of three kinds:
  - `B∖{r}` has weight 0 (`v` loses its witness, and `u` is absent);
  - `B∖{v}` has weight 0;
  - `B` minus a column is `{r, v}` plus `k − 1` columns, with weight `1_v`. Each of the `2^{k−1}C(d,k−1)` sets of this form is
    reached, because `k − 1 < d` leaves a free column.
  - Hence `w(N_D(sec)) = 2^{k−1}C(d,k−1)·1_v`.
- The switch pivots `x ∉ B` with `|N(x) ∩ B| = 2` are of four kinds:
  - `s` (`N(s) = {r, v}`) gives `{s}` plus the columns, with weight 0;
  - `u` qualifies iff `j(B) = 1` (`N(u) ∩ B = {r, b_i}`). Its target is `Z_K = {v, u} ∪ {c_j : j ∈ K}`, where `K` is the
    set of `k − 1` L columns. There `v` is inactive (`r` is gone) and each `c_j` is active through `u`, so the weight is
    `(k−1)·1_c`;
  - no `b_j ∉ B` qualifies (`N(b_j) = {u, c_j}`, and `u ∉ B`);
  - no `c_j` qualifies.
- Every `Z_K` with `|K| = k − 1` is reached, again because a free column exists. The `Z_K` contain `u`, so they are disjoint
  from the deletion targets. Hence `w(N(sec)) = 2^{k−1}C(d,k−1)·1_v + (k−1)C(d,k−1)·1_c`.
- The switch targets are present in `N(sec)` whatever `1_v` is (the sector is never empty for `k ≤ d`). **The factor is `1_c`.**
  The printed `1_v·1_c` agrees with it only when `1_v = 0 ⇒ 1_c = 0` or `k = 1`.

**Key 2 (the quotient).**
- Source orbits are the classes `j = 0..k`, of size `a_j = C(d,k)C(k,j)`. Target orbits of positive weight are the sector
  classes `j' = 0..k−1`, of size `b_{j'} = C(d,k−1)C(k−1,j')`, and the switch orbit, of capacity
  `π = (k−1)C(d,k−1)·1_c`.
- The arc orbits `j → j−1`, `j → j` and `1 → *` are biregular:
  - out-degrees `j`, `k − j` and `1`;
  - in-degree `d − k + 1` in each case (the free columns).
- Summing an original flow over orbits gives a quotient flow. Conversely, spreading a quotient flow uniformly over each
  biregular arc orbit gives an original flow. So the two max-flows are equal, and
  `δ = max_Y (1_v·Σ_{j∈Y} a_j − cap(N_Q(Y)))` over sets `Y` of classes.
- This is C-U2-T's step 2. I checked it without the averaging step, which is not needed.

**C-U2-T's proof, checked line by line.**
- The run deficit of `[a, b]`, in units of `C(d,k−1)` with `ρ = (d−k+1)/k`, is
  `(ρ−1)[C(k−1,a−1) + C(k−1,b)] + (2ρ−1)Σ_{a}^{b−1}C(k−1,j) − [a ≤ 1 ≤ b](k−1)1_c`. I re-derived it from
  `C(k,j) = C(k−1,j) + C(k−1,j−1)`, with the conventions `C(k−1,−1) = C(k−1,k) = 0`.
- Case `ρ < 1/2`: both coefficients are negative, so `δ = 0` and every `D(j0) ≤ 0`.
- Case `ρ ≥ 1/2`:
  - Extending the last run gains `ρC(k−1,b) + (2ρ−1)Σ_{b+1}^{k−1}`.
  - Filling a gap after a run with `b_1 ≥ 1` gains `ρ[C(k−1,b_1) + C(k−1,a_2−1)] + (2ρ−1)Σ_{b_1+1}^{a_2−2}`. The gap
    indices are all `≥ 2`, so `π` is untouched.
  - I recomputed both gains exactly; both are `≥ 0`. This leaves the forms `∅`, `[a,k]`, `{0}` and `{0} ∪ [a,k]` with `a ≥ 2`.
- The leftover case:
  - `ρ ≤ 1`: `{0}` has value `ρ − 1 ≤ 0` and can be dropped.
  - `ρ > 1`, left extension to `[2,k]`: the gain is `ρC(k−1,a−1) + (ρ−1)(k−1) + (2ρ−1)Σ_2^{a−2} ≥ 0`.
  - `ρ > 1`: `({0} ∪ [2,k]) − [1,k] = (k−1)(1_c − ρ) < 0`, which I recomputed.
  - `ρ > 1`: `D(1) − (ρ−1) = (2ρ−1)(2^{k−1}−1) − (k−1)1_c ≥ 0`.
- **Sound.**

**C-U2-F's proof, checked line by line.**
- The function `δ(X) = w(X) − w(N(X))` is supermodular: modular minus a weighted coverage function. So the union `M*` of all
  maximizers is a maximizer, and it is `S_d`-invariant, hence a union of classes.
- Every class reaches its target classes in full (a free column exists), and runs have disjoint neighbourhoods.
- `a_j/b_j = (d−k+1)/(k−j)`, so `a_j ≥ b_j` iff `j ≥ j* := 2k − d − 1`. This must be read in ℤ: `j*` may be negative.
- Step 5 (a run with top `t ∈ [1, k−1]`): see repair (ii) below. With it, the argument is complete.
- Steps 6–8 give the same four residual forms and dominate them:
  - `a_1 − π = C(d,k−1)((d−k+1) − (k−1)1_c) > 0` when `2k < d + 1`;
  - `a_j/b_{j−1} = (d−k+1)/j`.
- **Sound, with two local repairs** (Findings).

**Own instrument** (`scratchpad/c4-sr-SR-C4-9/`, standard library only, exact integers). It was written from the contract
alone and imports no seat, critic or adjudicator code (`srlib.py`). It provides:
- the tree test: `|E| = n − 1`, then union-find acyclicity, then BFS connectivity;
- a constrained tree DP for independence polynomials, with states forced in or out and a deletion set;
- `x` scanned through rank `α` inclusive;
- `F_p` derived by a fresh DP on `T − v`;
- `S` evaluated literally as `C5LA1.aggregate`, that is `Σ_{v∈F}(Δ_{p−1}(T − H_v) − Δ_{p−1}(T − R_v))`;
- exhaustive labelled enumeration of independent sets;
- the literal `w_F` and the literal (D) ∪ (S) relation from adjacency;
- Dinic max-flow with the infinity set to `supply + 1`, and residual min-cut extraction.

1. **Literal brute force on `CB(d,1)`, `d = 1..10`, every `k = 1..d` (55 rows; 54 with `d ≥ 2`).** Script `sr9_literal.py`
   (`sr9_literal_d10.json`, `RESULT_SHA256 8055e6e9…cf75acf`). The `d ≤ 6` sub-run the brief requires is
   `sr9_literal_d6.json` (`5cef7c73…98d61`), and it agrees.
   - `|I_{p+1}|` and `|I_p|` equal the DP coefficients.
   - `supply − capacity = S` (the full layers against the aggregate) holds on **55/55** rows.
   - Every row is non-eligible.
   - Indicators observed: `(1_v, 1_c) = (0,0)` on 25 rows, `(1,1)` on 28 and `(1,0)` on 2 (`(7,4)` and `(10,6)`). `(0,1)`
     never occurs.
   - Key 1, all three sums literal against the `1_c` formula: **55/55**. B9 recomputed with `F = leafSet`: **55/55**.
   - The sector-restricted max-flow deficiency `δ` equals `1_v·max(0, max_{j0} D(j0))` on **55/55** rows. So do:
     - the residual min cut's literal `w(X) − w(N(X))`: 55/55;
     - the exhaustive maximum over all `2^{k+1}` unions of `j`-classes, computed without the flow: 55/55;
     - the literal `D(j0)` of every `X'_{j0}`, which equals the closed form on every `j0` of every row.
   - The deficient rows `(d,k): δ / S` are (1,1): 1/+2, (2,1): 3/+7, (3,2): 3/+9, (5,3): 20/+50, (6,4): 25/+50,
     (7,4): 280/+280, (7,5): **21/−21**, (8,5): 406/+560, (9,6): 882/+840, (10,6): 5376/+5376 and (10,7): 1170/+600. The ten
     with `d ≥ 2` equal C-U2-T's values exactly.
   - **U2's literal statement** (its `max_{j0}` with no clamp, and its `1_v·1_c` switch term) equals `δ` on **35 of the 54**
     rows with `d = 2..10` and **fails on 19**. Every failure is a non-deficient row with `1_v = 1`, where the threshold
     maximum is negative. On `d = 2..9` it is 28 true and 16 false, which agrees with the adjudicator's 28/44.
2. **Eligibility and indicator scan, `d = 1..300`, and a quotient check for `d ≤ 60`.** Script `sr9_scan.py`
   (`RESULT_SHA256 be0cb632…c7907`).
   - The DP polynomial equals the closed form `I(x) = (1+2x)^d(1+3x+x^2) + x(1+2x)(1+x)^d` for every `d ≤ 300`, and `α = d + 2`.
   - The eligible set is **empty for every `d ≤ 300`**. Throughout, `⌊2α/3⌋ − (x + 2) = −2` at most. Examples: `d = 300` has
     `α = 302`, `x = 201` and window `[203, 201]`; `d = 120` has window `[83, 81]`.
   - Indicator patterns over 45,150 `(d,k)` rows: `(0,0)` 29,702, `(1,1)` 15,350 and `(1,0)` 98. The `(1,0)` rows are
     exactly `(3t+1, 2t)` for `t = 2..99`. `(0,1)` occurs nowhere.
   - Quotient max-flow against the formula: 1,830 rows (`d ≤ 60`), 0 mismatches, 77 deficient (76 with `d ≥ 2`, as C-U2-F
     counts).
   - Exhaustive class unions (`k ≤ 12`): 654 rows, 0 mismatches.
3. **`m = 2`.**
   - Validation: `sr9_m2val.py` uses an `S_d × S_d` orbit quotient (per-choke class `(j_i, l_i)`; switch at `u_i` iff
     `j_i = 1`, with target weight `l_i·1_c`; biregular arcs). This is a different group from C-U2-F's `S_d ≀ S_m`.
     - I checked it against literal sector max-flow on `CB(d,2)`, `d ≤ 5`, every `k = 1..2d`, for **every**
       `Aut`-invariant tag set `F ∈ {∅, {v}, C, {v} ∪ C}` (`C` the private leaves).
     - Result: **120/120 equal**, including 36 deficient rows, 16 of them with `1_c = 1`, so the switch modelling is exercised
       (`sr9_m2val_5.json`, `6fef3817…b7bf5`).
   - The two rows: `sr9_m2.py`, `sr9_m2_RESULT.json`, `RESULT_SHA256 df1f215c…bca0`.
     - `S` is computed as the aggregate. Supply and capacity come from a second, independent path: a constrained DP counting
       `#{B ∋ v} − #{B ∋ v, B ∩ W_v = ∅}` per tag on `T`.
   - `CB(5,2)/7`:
     - `n = 25`, `α = 13`, `x = 8`, window `[10, 8]` (empty), **non-eligible**;
     - `F_7 = {v}`, `(1_v, 1_c) = (1,0)`;
     - supply / capacity / `S` = 13440 / 8064 / **+5376**, from both paths and by literal enumeration;
     - literal sector deficiency **5376**, which the quotient gives too;
     - the literal min cut is the whole sector: 13440 sources, `w(N) = 8064`;
     - the literal whole-network max-flow is 8064.
   - `CB(10,2)/14`:
     - `n = 45`, `α = 23`, `x = 14`, window `[16, 15]` (empty), **non-eligible**;
     - `|F_14| = 21` (all leaves), `(1_v, 1_c) = (1,1)`;
     - `i_14 = 3118890130`, `i_15 = 3098800692`;
     - supply / capacity / `S` = 931899840 / 851152520 / **+80747320**, and the two paths agree;
     - sector supply 635043840, sector deficiency **34893540** by the validated quotient. This equals C-U2-F's value.
4. **Alias check** (`sr9_alias.py`; JSON loads of the two capsule registries).
   - The run-local snapshot has 448 claims; `sources/authority/CLAIM-IDENTITY.json` has 434.
   - No key contains `CB-D1`, `CBD1`, `SUFFIX`, `SUPPORT-COUNT`, `MAX-HALL`, `HALL-DEFICIT`, `ROOT-ARM`, `J-THRESHOLD`,
     `SWITCH-CAPACITY` or `DEFICIENT-CUT`.
   - No claim's `alias_patterns` regex matches any of my four proposed names or U's key-form name.
   - The only `DEFICIENT-CUT` string in either file is the alias `E993-R30-INVARIANT-DEFICIENT-CUT-REDUCTION` of (INV), which is
     unrelated.
   - The two `B9` key hits (`E993-C2-CU-T3-B9-…`, `E993-K26-B9-…`) are unrelated predecessor keys.

## Findings and repairs

**SR-C4-9a.**
- The three formulas are correct as stated in EST-11, with switch factor **`1_c`**.
- The hypotheses and where they enter:
  - `1 ≤ k ≤ d` supplies the free column: every class is reached, and the sector is nonempty;
  - `F = F_p(T)` is used only through its `S_d`-invariance and its indicators.
- ℕ-subtractions: `k − 1 ≥ 0` (from `k ≥ 1`), `p − 1 = k`, and `d − k + 1 ≥ 1` (from `k ≤ d`).
- **B9 against its text of record.** B9's registered claim fixes the tag set `F = leafSet(T) = {v, c_1, …, c_d}` on its face. It
  ends: "Using the two sums as the rank-p network's sums requires F_p(T) = leafSet(T), derived row by row."
  - On `CB(d,1)`, `F_p(T) = leafSet(T)` iff `1_v = 1_c = 1`. So the caveat from the adjudicator (and U2's quotation) is
    **already carried by B9's text of record**, and B9 needs **no correction**.
  - The synthesis's "fidelity correction 6" and the adjudication's item D should not be registered as corrections to B9. The
    right instrument is a scope note plus an extension record.
  - B9's pairing on its own tag set is correct: 55/55 literal rows, `d ≤ 10`.
- **"Only when" is exact except at `k = 1`.** B9's pair equals the `F_p`-network's pair iff `1_v = 1` and (`1_c = 1` or
  `k = 1`). At `k = 1` the switch term vanishes. No `(1,0)` row has `k = 1` for `d ≤ 300`, since the splits sit at `k = 2t ≥ 4`.
  - Literal: the pair matches on all 28 `(1,1)` rows and fails on all 25 `(0,0)` rows and both `(1,0)` rows (`d ≤ 10`).
- The implication `1_v = 0 ⇒ 1_c = 0` holds for `d ≤ 300`, bounded. It is **not proved**, so the `1_c` form is the one to register.
- Verdict: `confirmed_with_repairs`. The repairs concern the B9 scope-note framing and the exact "only when" clause. The three
  formulas are registered verbatim.

**SR-C4-9b.**
- The corrected statement is **true for every `d ≥ 1`, `1 ≤ k ≤ d`**, and both critics' proofs are sound. The adjudicator
  checked C-U2-F line by line and C-U2-T's closing inequality. I re-checked every gain in both proofs.
- Repairs:
  - **(i) The count is inverted in the synthesis (R-16) and the brief.** They say "Key 2 as literally stated is false (35/54
    rows)". U2's literal statement **holds on 35 and fails on 19** of the 54 rows `d = 2..10`.
    - C-U2-T's face ("holds on 35/54 … fails on 19/54") and CF-U4 ("matches 35/54 rows") are right.
    - The adjudication's "false as stated (35/54)" is ambiguous. Its own replay count is 28/44 true.
    - The registration text must read "fails on 19 of 54 (holds on 35)".
  - **(ii) C-U2-F step 5.**
    - "Adding `t+1` adds `a_{t+1} − b_{t+1}`" misses the case `t + 2 ∈ M*`. There the target class `t + 1` is already
      covered, and the gain is `a_{t+1} > 0`.
    - The step should read: the gain is `≥ a_{t+1} − b_{t+1}`, and it is `< 0` because `M*` is the union of all maximizers.
      Hence the merge case is impossible and `a_{t+1} < b_{t+1}`.
    - The conclusion is unchanged. The run's value is then `≤ Σ_{j∈run}(a_j − b_j) < 0`.
  - **(iii) C-U2-F step 8.** "each `a_j ≥ b_{j−1}` … for `j ≤ k − 1`" must read "for `j ≤ k`". The comparison of `{0}` with
    `[0..k]` sums up to `j = k`. The inequality holds there because `2k < d + 1` gives `(d−k+1)/j > 1` for every `j ≤ k`.
    Also, "at least" is in fact an equality.
  - **(iv) Carry `D(j0)` explicitly on the face.** Use the `1_v = 1` closed form, as C-U2-T and the adjudicator do. The literal
    reading (`D(j0)` the deficit of `X'_{j0}` at the actual indicators) gives the same right side, because the `1_v` factor
    zeroes it when `1_v = 0`.
- An equivalent unclamped form justifies the name's "SUFFIX-MAXIMUM": `δ = max_{0≤j0≤k+1} (w(X'_{j0}) − w(N(X'_{j0})))`, with
  `X'_{k+1} = ∅`, at every indicator pattern. Both are verified literally on 55/55 rows.
- Hypotheses consumed: key 1's structure, `S_d` invariance, supermodularity (C-U2-F) or biregular orbit arcs (C-U2-T), and
  binomial identities. No census value and no eligibility are used. (LIFT) is not used.
- ℕ-subtractions: `j0 − 1` is guarded by `max(·, 0)`; `D(j0)`, the deficits and `j*` live in ℤ; the conventions
  `C(k−1,−1) = C(k−1,k) = 0` are stated.
- Observation, not for registration: both proofs use only the `S_d`-invariance of `F ⊆ leafSet(T)`, so the same equality holds
  for every `S_d`-invariant tag set (`sr9_m2val.py` exercises all four at `m = 2`). I register the `F = F_p(T)` scope only.
- Verdict: `confirmed_with_repairs`.

**SR-C4-9c.**
- **Ruling: RECORD, not key.** I agree with the synthesis.
  - The statement is a laboratory theorem on a family whose eligible set is empty for every `d ≤ 300` (computed, not proved for
    all `d`). It bears on no eligible row and no (HALL) instance.
  - It is not an outcome-B lemma on a family where (HALL) is live.
- Row id: in the `R30-CB-RECORD-…` form, as B9's row, rather than the `E993-` key form.
  - The key-form name passes the lexical and alias-pattern check against both capsule registries.
  - It reads as a true predicate on its stated scope: "max Hall deficit equals the support-count suffix maximum", with the
    empty suffix included.
  - It contains no "DEFICIENT-CUT". It is recorded in the record's provenance as the reserved name, should the record ever be
    promoted.
- "DEFICIENT-CUT" appears in none of my names. U2's `…-J-THRESHOLD-EXTREMAL-DEFICIENT-CUT` stays unregistered.
- **`m = 2` records confirmed** at `bounded_computation`:
  - `CB(5,2)/7`: literal plus the quotient, three instruments on record (C-U2-F, C-U2-T `multi.py`, the adjudicator) and mine;
  - `CB(10,2)/14`: C-U2-F's `S_d ≀ S_2` quotient and my independently validated `S_d × S_d` quotient.
  - Both are non-eligible with `S > 0`.
  - At `CB(5,2)/7` the sector deficiency is forced by FLOW⇒SIGN: every positive-weight source lies in the sector, since
    `F = {v}`.
  - At `CB(10,2)/14`, `S > 0` forces a whole-network deficiency of at least `S`. The sector value 34893540 is a separate,
    smaller number.
  - C-U2-F's table carries no `S`, window or supply values, so I supply them on the record face.
- Verdict: `confirmed_with_repairs`. The repairs are the record-id form and the missing row literals.

**Fences** (`SOLUTION-CONTRACT.md` §3), checked for all three:
- Every row is at a non-eligible rank, so none is (HALL) evidence and none is a (CUT).
- No status transfer: (HALL) stays OPEN, and the primary aggregate, TREE, FOREST, TRANSFER, `E993-BETA-AGG` and Erdős #993 are
  untouched.
- The relation is (D) ∪ (S), not deletion-only. This is not a revival of `E993-R23-LITERAL-DELETE-ONLY-HALL`, and no retag
  relation or own-support rule is involved.
- The weight is the literal `w_F` with `F` fixed at `p`.
- No census value enters a proof. This is an ordinary-tree statement, not RTree.
- Attribution travels on every face.

## Registration text

```text
SCOPE NOTE ON: R30-CB-RECORD-C3-B9-CBD1-WHOLE-SECTOR-SUMS
TEXT: [r30 C4; SR-C4-9] Scope clarification and extension; B9's claim, grade and fences are unchanged and need no correction. B9's text of record fixes the tag set F = leafSet(T) = {v, c_1, ..., c_d} on its face, and its last sentence already restricts the use of its two sums as the rank-p network's sums to rows with F_p(T) = leafSet(T), i.e. to 1_v = 1_c = 1, where 1_v := [v in F_p(T)] and 1_c := [c_j in F_p(T)] (well defined by the column symmetry S_d). The caveat "B9's pairing holds only when 1_v = 1_c = 1" is therefore already carried and is not a correction to B9. Exactly: B9's pair equals the F_p(T)-network's pair (sum over sec of w_F, sum over N(sec) of w_F) if and only if 1_v = 1 and (1_c = 1 or k = 1). The F_p(T)-network's sums at every indicator pattern are recorded in R30-CB-RECORD-C4-B9X-CBD1-DERIVED-SELECTOR-SECTOR-SUMS. Bounded (bounded_computation): on CB(d,1), d <= 300, 1 <= k <= d, the derived indicator patterns are (0,0), (1,1) and (1,0), the last exactly at (d,k) = (3t+1, 2t), 2 <= t <= 99; (0,1) does not occur; the implication 1_v = 0 => 1_c = 0 is not proved. Attribution: C-U2-T and C-U2-F (Claude Opus 5.5; indicator split and factor 1_c); U adjudicator (Claude Opus 5.5); isolated second read SR-C4-9 (Claude Opus 5.5; B9's text of record checked; exact coincidence condition).
```

```text
RECORD: R30-CB-RECORD-C4-B9X-CBD1-DERIVED-SELECTOR-SECTOR-SUMS
CLAIM: Extension of R30-CB-RECORD-C3-B9-CBD1-WHOLE-SECTOR-SUMS from the tag set leafSet(T) to the derived selector. On CB(d,1), d >= 1 (path r - s - v, one choke u ~ r carrying d supports b_j, each with one private leaf c_j), at rank p = k + 1 with 1 <= k <= d, with F = F_p(T) derived on the original tree (Delta_p(T - v) < 0), 1_v := [v in F_p(T)] and 1_c := [c_j in F_p(T)] (independent of j by the column symmetry S_d), the root-plus-arm sector sec = {B in I_{p+1} : r, v in B}, its deletion neighbourhood N_D(sec) and its (D) union (S) neighbourhood N(sec) in I_p satisfy: sum_{sec} w_F = 2^k * C(d,k) * 1_v; sum_{N_D(sec)} w_F = 2^(k-1) * C(d,k-1) * 1_v; sum_{N(sec)} w_F = 2^(k-1) * C(d,k-1) * 1_v + (k-1) * C(d,k-1) * 1_c. Structure: every source has weight 1_v (v active through r; each c_j inactive because u is absent); the positive-weight targets are the 2^(k-1) * C(d,k-1) in-sector deletions {r, v} plus k-1 coordinates (weight 1_v) and the C(d,k-1) choke switches {v, u} plus k-1 private leaves, fired exactly from sources holding one support (weight (k-1) * 1_c; v inactive); B minus {r}, B minus {v} and the switch at s have weight 0; no support or leaf is a pivot. The switch factor is 1_c, not 1_v * 1_c (the switch targets lie in N(sec) whatever 1_v is); the two agree only when 1_v = 0 implies 1_c = 0, or k = 1. At 1_v = 1_c = 1 (F_p(T) = leafSet(T)) this is B9's pair. The range 1 <= k <= d is load-bearing (free coordinate; nonempty sector).
STATUS: proved_informal (U2 statement corrected by both critics; STATED at Stage 4; confirmed by isolated second read SR-C4-9); a record, not a key. Bounded corroboration: literal brute force, CB(d,1), d = 1..10, every 1 <= k <= d, all three sums on 55 of 55 rows with supply - capacity = S asserted on every row (SR-C4-9); 54 rows d = 2..10 (C-U2-T); 44 rows d = 2..9 (U adjudicator). Fences: a sector statement on one family at non-eligible ranks only (no eligible rank for d <= 300, computed); not (HALL), not a cut, no status transfer; the primary aggregate untouched.
PROVENANCE: U2 (Claude Sonnet 5; route C4-U-02, three-term identity with factor 1_v * 1_c); C-U2-T (Claude Opus 5.5; factor 1_c, A3; B9 extension, A6); C-U2-F (Claude Opus 5.5; restated switch term); U adjudicator (Claude Opus 5.5; 44-row replay, hand re-derivation); isolated second read SR-C4-9 (Claude Opus 5.5; hand derivation, literal instrument, B9 text of record). B9: C-U2-T (Cycle 3) and SR-C3-7. Network, weight and relation: Codex (GPT-6), lower-region run.
```

```text
RECORD: R30-CB-RECORD-C4-CBD1-ROOT-ARM-SECTOR-MAX-HALL-DEFICIT-EQUALS-SUPPORT-COUNT-SUFFIX-MAXIMUM
CLAIM: On CB(d,1), d >= 1, at rank p = k + 1 with 1 <= k <= d, F = F_p(T) derived, 1_v and 1_c as in R30-CB-RECORD-C4-B9X-CBD1-DERIVED-SELECTOR-SECTOR-SUMS, sec = {B in I_{p+1} : r, v in B}, relation (D) union (S), and X'_{j0} := {B in sec : B contains at least j0 supports b_j}: max over X subset of sec of (sum_{X} w_F - sum_{N(X)} w_F) = 1_v * max(0, max_{0 <= j0 <= k} D(j0)), where D(j0) := C(d,k) * sum_{j = j0..k} C(k,j) - C(d,k-1) * sum_{j' = max(j0-1,0)..k-1} C(k-1,j') - [j0 <= 1] * (k-1) * C(d,k-1) * 1_c, which is the deficit of X'_{j0} when 1_v = 1. Equivalently, at every indicator pattern, the maximum equals max_{0 <= j0 <= k+1} (sum_{X'_{j0}} w_F - sum_{N(X'_{j0})} w_F) with X'_{k+1} the empty family (the support-count suffix maximum, empty suffix included). U2's literal statement (the maximum over j0 without max(0, .)) is false: on the 54 rows d = 2..10 it holds on 35 and fails on 19, every failure a non-deficient row with 1_v = 1.
STATUS: proved_informal (critic-derived; STATED at Stage 4; confirmed by isolated second read SR-C4-9); a record, not a key. Two independent proofs, both confirmed: C-U2-T (orbit quotient with biregular arc orbits to the caterpillar s_0 - t_0 - s_1 - ... - t_{k-1} - s_k with the switch orbit on s_1; run additivity; run extension and gap filling; the leftover cases rho <= 1 and rho > 1, rho = (d-k+1)/k); C-U2-F (supermodularity of X -> w(X) - w(N(X)); the union of all maximizers is S_d-invariant; runs; threshold j* = 2k - d - 1 read in Z), with two local repairs by SR-C4-9 (step 5: the gain of adding class t+1 is at least a_{t+1} - b_{t+1}, the merge case giving a_{t+1} > 0; step 8: a_j >= b_{j-1} for every j <= k). Hypotheses consumed: the sector structure of R30-CB-RECORD-C4-B9X-CBD1-DERIVED-SELECTOR-SECTOR-SUMS, S_d invariance, binomial identities; no census value, no eligibility, no (LIFT). Bounded corroboration: literal sector-restricted max-flow, residual min cut, and exhaustive class unions on 55 of 55 rows d = 1..10 (SR-C4-9), 54 rows (C-U2-T), 44 rows (U adjudicator); quotient max-flow on 1,830 rows d <= 60 (SR-C4-9), class unions on 653 rows (C-U2-F). Scope: laboratory; CB(d,1) has no eligible rank for any d <= 300 (bounded_computation; not proved for all d). Fences: non-eligible laboratory rows only; not (HALL), not a cut (no "deficient cut" in the contract's sense exists at a non-eligible rank), no status transfer; the primary aggregate untouched; not a revival of E993-R23-LITERAL-DELETE-ONLY-HALL (relation (D) union (S), active weight).
PROVENANCE: U2 (Claude Sonnet 5; route C4-U-02; the j-threshold pattern, stated without the clamp as E993-R30-CB-D1-J-THRESHOLD-EXTREMAL-DEFICIENT-CUT, not registered); C-U2-T (Claude Opus 5.5; corrected statement, proof by quotient and runs); C-U2-F (Claude Opus 5.5; proof by supermodularity and runs); U adjudicator (Claude Opus 5.5; both proofs checked; name E993-R30-CB-D1-ROOT-ARM-SECTOR-MAX-HALL-DEFICIT-EQUALS-SUPPORT-COUNT-SUFFIX-MAXIMUM, which passes the lexical and alias-pattern check against both registries and is reserved should the record be promoted); isolated second read SR-C4-9 (Claude Opus 5.5). Network, weight and relation: Codex (GPT-6), lower-region run.
```

```text
RECORD: R30-CB-RECORD-C4-CB5x2-P7-NON-ELIGIBLE-SECTOR-DEFICIT
CLAIM: CB(5,2) (path r - s - v, two chokes on r, five supports per choke, one private leaf per support), p = 7: n = 25, alpha = 13, x = 8 (computed through rank alpha), window [10, 8] empty, non-eligible; F_7 = {v} derived (1_v = 1, 1_c = 0); supply / capacity / S = 13440 / 8064 / +5376 (supply - capacity = S asserted); the root-plus-arm sector (all 13440 positive-weight sources, each of weight 1) has (D) union (S) sector deficiency 5376, attained by the whole sector (w(N(sec)) = 8064); whole-network maximum flow 8064. Since S > 0 the deficiency is forced by FLOW=>SIGN (E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE); it is not a switch-allocation phenomenon.
STATUS: bounded_computation (critic-derived; confirmed by isolated second read SR-C4-9); a record. Instruments: C-U2-F (S_d wr S_2 orbit-quotient sector instrument, validated 55/55 against literal flows); C-U2-T (multi.py, literal); U adjudicator (literal replay); SR-C4-9 (literal enumeration and max-flow, and an S_d x S_d quotient validated 120/120 against literal flows). Fences: non-eligible; not (HALL), not a cut; says nothing about the CB(8,.) first ranks; no status transfer.
PROVENANCE: C-U2-F (Claude Opus 5.5; F-3); C-U2-T (Claude Opus 5.5); U adjudicator (Claude Opus 5.5); isolated second read SR-C4-9 (Claude Opus 5.5). Network, weight and relation: Codex (GPT-6), lower-region run.
```

```text
RECORD: R30-CB-RECORD-C4-CB10x2-P14-NON-ELIGIBLE-SECTOR-DEFICIT
CLAIM: CB(10,2), p = 14: n = 45, alpha = 23, x = 14 (computed through rank alpha), window [16, 15] empty, non-eligible; F_14 = all 21 leaves derived (1_v = 1, 1_c = 1); i_14 = 3118890130, i_15 = 3098800692; supply / capacity / S = 931899840 / 851152520 / +80747320 (supply - capacity = S asserted, supply and capacity from a constrained tree DP independent of the aggregate path); the root-plus-arm sector has total weight 635043840 and (D) union (S) sector deficiency max over X subset of sec of (sum_X w_F - sum_{N(X)} w_F) = 34893540, with the choke switches present (1_c = 1). A second choke does not remove sector deficiency; S > 0 here, so the whole network is deficient by at least S by FLOW=>SIGN.
STATUS: bounded_computation (critic-derived; confirmed by isolated second read SR-C4-9); a record. Instruments: C-U2-F (S_d wr S_2 orbit quotient, validated 55/55 against literal flows); SR-C4-9 (S_d x S_d orbit quotient with biregular arc orbits, validated 120/120 against literal sector flows on CB(d,2), d <= 5, for all four invariant tag sets, 16 deficient validation rows with 1_c = 1). Fences: non-eligible; not (HALL), not a cut; says nothing about the CB(8,.) first ranks; no status transfer.
PROVENANCE: C-U2-F (Claude Opus 5.5; F-3); isolated second read SR-C4-9 (Claude Opus 5.5). Network, weight and relation: Codex (GPT-6), lower-region run.
```

Do not register: U2's key 2 as literally stated, its name `E993-R30-CB-D1-J-THRESHOLD-EXTREMAL-DEFICIENT-CUT`, or any name
containing "DEFICIENT-CUT". Do not register synthesis fidelity correction 6 as a correction to B9; it is replaced by the scope
note above.

## Verdicts

verdict[SR-C4-9a]: confirmed_with_repairs
verdict[SR-C4-9b]: confirmed_with_repairs
verdict[SR-C4-9c]: confirmed_with_repairs

- 9a: the three formulas are registered verbatim, with factor `1_c`, as an extension record of B9, not a key. B9 needs no
  correction: its text of record already carries `F_p = leafSet`. The exact coincidence condition is `1_v = 1` and
  (`1_c = 1` or `k = 1`).
- 9b: the corrected statement is proved, and both proofs are confirmed; C-U2-F's needs two local repairs. The synthesis and brief
  literal "false (35/54)" is corrected: U2's literal statement fails on 19 of 54 rows and holds on 35.
- 9c: RECORD, not key, under an `R30-CB-RECORD-C4-…` id. The name contains no "DEFICIENT-CUT" and passes the alias check. The
  `m = 2` rows `CB(5,2)/7` and `CB(10,2)/14` are confirmed as `bounded_computation` records (non-eligible, `S > 0`).
- None of these is decisive for ruling 30.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-sr-SR-C4-9/`.
All scripts ran with `python3 -B` in the foreground.

| File | SHA-256 | Role |
|---|---|---|
| `seal_audit.py` | `62ff6bece6d9a5868d6d79ffbb7c96af21a725364c02afa29b587956f16afbfe` | capsule seal, 63 member digests, 36 stage-7 members against `SOURCE-DIGESTS.json` |
| `srlib.py` | `7fa5100936a18e071575019521f8354c444e16aa4aeef66f27eccfa6b9422f6a` | own library (tree test, constrained DP, `x`, `F_p`, `S`, enumeration, `w_F`, (REL), Dinic) |
| `sr9_literal.py` | `b968c842a0a9c9b7103f50954d0962fc6580d7e48f32edd3f9cf8e9166b53699` | literal `CB(d,1)` rows |
| `sr9_literal_d6.json` | `5cef7c738360bde6876fafe888b271f1a265bb06c073711df133966781f98d61` | `d ≤ 6` (21 rows) |
| `sr9_literal_d10.json` / `.out` | `8055e6e9761dab7d7d6593448f0ac1ca33f70f1da303baa6185a0ca42cf75acf` / `7ebe56ff9625a45cdd208c4973f83de168685fbda9f0977c545c4503234ecc31` | `d ≤ 10` (55 rows) |
| `sr9_scan.py` | `a5fdeb35091f06e271ade0445e53156caa4b8c438bf6e8e943c5b5309ce9af40` | eligibility and indicators `d ≤ 300`; quotient `d ≤ 60` |
| `sr9_scan_300_60.json` / `.out` | `be0cb6322a800cbb946c1a3b2cdb918e0bbcdf9366ca82c2e14eef49006c7907` / `ee9d8d914f50efac076c1ab67c9bbf8430cb6ca1ec666170fa03f2a55710a5e6` | scan results |
| `sr9_m2val.py` | `da8eae272f256c5eabf9ff87a38727349ad8897d7328cbc9ddb22b170bba4a65` | `m = 2` quotient against literal, all invariant `F` |
| `sr9_m2val_4.json` / `.out` | `9f0d4391a7673b4eb7c8824b44d5303e61aa711f508627f89cdda6b3ba0247ec` / `72105ab1e664302296f75431c18c22505adac4f34fb9226a2bfceda1828653cf` | `d ≤ 4` (80 rows) |
| `sr9_m2val_5.json` / `.out` | `6fef381798599809c6998d55da4cce7c9e1ccd83954b472cf89b4761f25b7bf5` / `3a5dbda67e5b86658f1d0115702e8b14013886bdd7807f5c9153681d5646b516` | `d ≤ 5` (120 rows) |
| `sr9_m2.py` | `82b74554402f275a395aae7a1520989a7e00d1f13551d28c5702d70cad2d3c6c` | `CB(5,2)/7`, `CB(10,2)/14` |
| `sr9_m2_RESULT.json` / `sr9_m2.out` | `df1f215c262176e5c5a8882fdcdedb827e47081b32e17e46c03d964eee53bca0` / `f111993421d4e9cdcca3d19dd103b6f49318fbb9bd9523fb272a9444b0b96c3f` | the two `m = 2` rows |
| `sr9_alias.py` | `78004335fe590f5418782c11663e5b8dbb4887870ce753f4b75e96646bb6231e` | lexical and alias-pattern check |
| `sr9_alias_RESULT.json` | `265b5ade530d8ba6c2a48d76c134363963587068630d9c4c0a9a3f9713029e26` | lexical part; the alias-pattern part is printed only (0 hits) |

Deliverable: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/second-reads/SR-C4-9/SECOND-READ.md`
(this file; its digest is reported in the final message).
