# Second Read

Read `R31-SR-C4-5` (r31 Cycle 4): the F2-T arc-by-arc composed-flow computation at rows 158, 161 and 164, and the off-class facts.
Run `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. Reader: isolated second-read seat, Claude Opus 5.5. Written 2026-09-29.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS under the restricted boot. I read exactly two VerityOS files,
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and then my brief. I loaded no
other subsystem (no memory, knowledge, conversations, operations, modules, skills, logs or decisions), and I wrote no conversation log:
the protocol allows one deliverable.

**Read-boundary disclosures.**
1. *Harness context.* Before my first tool call, the host placed the project `CLAUDE.md`, the user auto-memory index and the user's
   e-mail address into my context. I did not open them with a tool, and nothing below rests on them.
2. *Capsule members read.* I read these in full or in part:
   - `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md` (full);
   - `control/C4-SECOND-READ-BRIEF-R31-SR-C4-5.md` and `control/C4-SECOND-READ-PROTOCOL.md` (full);
   - `control/C4-FROZEN-STATEMENTS.lean`, lines 1–265 (N1–N6 and the N7 companion), plus a `grep -n` of its declaration lines;
   - `sources/c4-base/LeanProject/LeanProof/E1FlowConstruction.lean` and `ChokeState.lean` (full);
   - `Main.lean`, lines 95–110, 228–500 and 1700–1945 (the definitions of record), located by one `grep -n` of definition names in
     that file;
   - Stage 6 `SYNTHESIS.md`, lines 1–262, 303–453 and 554–594;
   - the F `ADJUDICATION.md`, lines 101–140, 160–190 and 236–262, plus a heading and keyword `grep` of the file;
   - C-F2-T `CRITIQUE.md` (full);
   - C-F2-U `CRITIQUE.md`, lines 60–160 and 190–230, plus a keyword `grep`;
   - `c4-crit-F2-T/crit_f2t.py` and `adv_literal.py` (full);
   - `c4-crit-F2-U/cb81_bundle.py`, lines 40–75;
   - the three registries and `control/CLAIM-DISTINCTIONS.json`, parsed by script. I extracted key names, statuses, scopes and
     aliases for the keys named below, and read the structure and last rows of the distinctions file.
3. *Capsule members only hashed, not read.* F2's `RETURN.md`, `composed_flow_check.py`, `tree_check.py`, `crit_f2u.py`,
   `cb81_split.py`, `table_compare.py`, `C4-ALLOCATION.md`, `C4-STAGE1-GATE.md`, `C4-FROZEN-STATEMENTS.md`, the Stage 6 controller
   facts and manifest, the obligations snapshot, the base logs, the other Lean files and the c1–c3 digest files. All 88 were hashed in
   the seal audit.
4. *Harness-persisted output.* The shell output of `cat` on C-F2-T's `CRITIQUE.md` exceeded the display limit. The harness saved it
   under `~/.claude/projects/-Users-ashtonsperry-VerityOS/<session>/tool-results/` (outside the run root), and I read the critique
   from that copy. The content is the capsule member (`cc01b9ba…`); I wrote nothing there.
5. *A background job, not by choice.* My literal run for rows 161 and 164 (`sr5_literal.py --rows-only 161 164`) exceeded the shell
   tool's 600 s limit. The harness moved it to the background (task `b6sp2f19a`, output under `/private/tmp/claude-501/…/tasks/`),
   which breaks the protocol's no-background-jobs rule. I then found its PIDs with one `pgrep -f` on the exact command string. That
   returned two PIDs only (47575, the shell wrapper; 47625, python); it is not a full process listing. I polled only by literal PID
   (`ps -p 47575,47625`). To wait for it, I used one harness Monitor watcher (task `bi0rf5l1p`) running
   `while ps -p 47625 …; do sleep 5; done`, which polls only that literal PID; it ended when the PID exited (exit 0). The run wrote
   its own output into my scratch. Every other computation ran in the foreground. That includes a rerun of `sr5_literal.py 158`
   under the final, refactored script, whose stdout is byte-identical to the earlier run's.
6. *Interpreter hygiene.* Every instrument ran with `python3 -B`. Four small patch scripts (string replacements in my own scratch
   files) ran as `python3 -` without `-B`; they import no local module, so no bytecode was written.
7. *Nothing else.* I made no reads outside the capsule and the two boot files. There were no other returns, critiques, adjudications
   or scratch of any other seat, no other experiment root, no network, no installs, no `lake` or `lean`, and no `find`/`grep`/`rg`
   rooted above a capsule member. I edited no sealed member.

## Identity and seal audit

- **Brief digest.** `shasum -a 256 control/C4-SECOND-READ-BRIEF-R31-SR-C4-5.md` gives
  `13341bd154405290ea5470a90f844704869e0f5622bc006b78d2cccfd2fd87ce`. This equals the dispatch value, and I checked it before following
  the brief.
- **Capsule seal.** `control/c4-second-read/R31-SR-C4-5-PACKET-MANIFEST.json` (file SHA-256 `0798bc07…4e48`). I recomputed the SHA-256
  of the compact, key-sorted JSON of the manifest minus `seal_sha256` (separators `(",", ":")`, no trailing newline):
  **`e0c39aa6b4d1b4a429c0ff35ab5efb9a1802d97014768b0ae6e8f9680115acd2`**. This equals the recorded seal and the dispatch value.
- **Members.** 88 of 88 match their recorded bytes and SHA-256 (`file_count` 88); there were 0 mismatches.
- **Frozen Stage 7 sources.** I checked the 53 capsule members under `sources/c4-stage7-sources/` against
  `sources/c4-stage7-sources/SOURCE-DIGESTS.json` (schema `verityos.r31.source-digests.v1`, 772 files): 53 of 53 match, and none is
  missing. I did this before reading any of them.
- **Statement of record.** The synthesis `SYNTHESIS.md` (`84c2805b…`): §(iii) and `## Registrations` (E-5 record; off-class record;
  read R31-SR-C4-5). The frozen texts `control/C4-FROZEN-STATEMENTS.lean` (`0fc723d7…`) are byte-identical to base `Statements.lean`.
- **Copy-out-first replay** (under `scratchpad/c4-sr-R31-SR-C4-5/replay/`). I copied `crit_f2t.py` (`6ba35369…`) and `adv_literal.py`
  (`52d8046c…`) out of the frozen sources and ran them in the foreground.
  - `crit_f2t.py` exited 0 after 295 s with empty stderr. Its `stdout.log` (`72010eb75a66f6136aa4b4f35415f4b39750c889760bd4c65784dcd5c102820d`)
    and `crit_summary.json` (`d2d0a291017522745d4f9e25ed51db7da42bf45fdb93d6de14f4a0ade7842eb3`) are **byte-identical** to the frozen
    `run2/` files. The in-text digest is `16fca9d2…6ef6`.
  - `adv_literal.py` exited 0. Its stdout (`8f5ebc56…14202`, in-text `f7542939…7762`) is byte-identical to the frozen `adv/stdout.log`.
  - The replay reproduces the critic's run. It is not evidence for anything below: every conclusion there rests on my own instruments.

## Statements read

- **R31-SR-C4-5a (the computation).** C-F2-T's critic-derived advance (CRITIQUE P1–P4). At `m = 158, 161, 164` and `p*`, the
  composed function `f = cb8E1Arc + cb8GSec` has the following properties:
  - It is built from the frozen definitions and C1-LA1's unscaled allocation.
  - It is nonnegative and supported on literal (D) ∪ (S) arcs.
  - Every source row is at least `w`: sector rows are `≥ 1 = w`, r-free rows are `= w`, and every other source has weight 0.
  - Every target column is at most `w`: in-sector columns are `≤ 1`, switch images receive `≤ γ`, other r-free `q ≥ 1` targets
    receive `ρ_q·w`, and weight-0 targets receive 0.

  Hence (HALL-COND) holds for every `X`. The F adjudicator records this as E-5 and the synthesis as §(iii). The record's grade is
  `bounded_computation`, STATED, conditional and critic-attributed. The brief asks me to state the E1 class-count reduction on its
  face and to confirm each of the following: the selector is DERIVED, (WID) holds from two sides, the E1 rows equal `w` and the
  columns equal `ρ_q w`, the sector min Out and max In are exactly 1, switch images stay under capacity, and Hall holds for every
  `X`. It also requires my own instrument for at least one row.
- **R31-SR-C4-5b (the off-class facts).** CB(8,1) and CB(8,2) have no eligible rank. The composed flow fails at CB(8,1), `p = 6`,
  which is not a cut. Attribution: C-F2-T F-4 and C-F2-U finding 7; F adjudication E-6 and reconciliation item 3.

## Independent re-derivation

**Instruments** (mine; standard library; exact `int`/`Fraction`; no import of any seat or critic code). They were written from the
Lean text of record (Main.lean entries 14–26 and 80–91, `E1FlowConstruction.lean` §1–4, `ChokeState.lean` and the frozen
`cb8GSec`) and the contracts.
- `sr5_rows.py` is part 1: tree facts, selector, (WID), the E1 class census, the sector DP and the switch images.
- `sr5_literal.py` is part 2: literal evaluation of the frozen `cb8E1Arc` and `cb8GSec` on explicit sets.
- `dp_selftest.py` brute-force-checks my DP.

Methodological differences from C-F2-T, which were chosen for independence:
- `cb8R` is computed by a second expansion, `[y^k](1+y)^a(1+2y)^b = Σ_l C(b,l)·C(a+b−l, k−l)`, obtained by writing
  `(1+2y) = (1+y)+y`. It is asserted equal to `Σ_α cb8N`.
- The E1 census uses `Fraction` arithmetic straight from the Lean definitions, not scaled integers.
- (WID) side A uses forced-inclusion DPs. It does not use the critic's closed generating function.
- The sector DP runs over all 45 choke states per choke. It does not use the critic's per-leg-count reduction. It was checked against
  brute force over state multisets for `m = 1, 2, 3` at every leg total.

**P0, the fixed points** (checked before any fresh row). My tree DP gives `CB(8,107)`: `(n, α, x) = (1822, 964, 570)` and `CB(8,95)`:
`(1618, 856, 506)`. It also gives `θ(107) = 96/766193`, `θ(95) = 96/604265`, `σ(95, 1..3)`,
`ρ_1(95) = 1354839571516225/1361543988640524`, `R_K/R_{K−1}(95) = 508/507` and `(1 − ρ_1(107))/θ(107) = 34.9009`. All match
SEMANTIC-CONTRACT §5.

**P1, tree facts, derived selector and (WID)** (exact). In each row, the literal DP polynomial equals the closed form of record
`(1+2y)G^m + y(1+y)(1+2y)^{8m}`, which I asserted as a cross-check.

| m | n | α (= 9m+1) | p* | x (least k with i_{k+1} < i_k, through α) | eligible | i_{p*−1} < i_{p*−2} | F_{p*} derived | (WID) | S(T,p*) |
|---|---|---|---|---|---|---|---|---|---|
| 158 | 2689 | 1423 | 844 | 842 = p*−2 | yes | yes | leafSet, 1265 tags | equal | < 0; 604 digits (605 characters with sign), SHA-256 of decimal `ebda3c7e…72ee` |
| 161 | 2740 | 1450 | 860 | 857 = p*−3 | yes | yes | leafSet, 1289 tags | equal | < 0; 616 digits, `0a853501…c001` |
| 164 | 2791 | 1477 | 876 | 873 = p*−3 | yes | yes | leafSet, 1313 tags | equal | < 0; 627 digits, `a5133e02…d6c0` |

- **Selector: DERIVED.** The literal degree-1 vertices are exactly `{v} ∪ {c_ij}`. The difference index is
  `Δ_{p*}(T − ℓ) = i_{p*+1}(T − ℓ) − i_{p*}(T − ℓ)`:
  - `Δ_{p*}(T − ℓ) < 0` at `ℓ = v`;
  - `Δ_{p*}(T − ℓ) < 0` at four private leaves `c(0,0)`, `c(m−1,7)`, `c(⌊m/3⌋,5)` and `c(⌊2m/3⌋,2)`, with equal values.

  The automorphisms of `CB(8,m)` permute chokes (with their subtrees) and the legs of a choke, so they act transitively on the `8m`
  private leaves, and `Δ_{p*}(T − c)` is constant on that orbit. Hence `F_{p*} = leafSet`.
- **(WID), two independent sides.**
  - Side A (supply − capacity) comes from the weight generating function. Since `W_ℓ` is a single vertex (`{r}` for `v`, `{u_i}` for
    `c_ij`), it equals `Σ_ℓ y²·I(T − N[ℓ] − N[W_ℓ])` (forced inclusion of `ℓ` and its witness). Each term is a literal deletion DP,
    and the `c` term agrees at two representatives.
  - Side B is `S = Σ_ℓ [q_ℓ(p*) − q_ℓ(p*−1)]` with `q_ℓ(j) = i_j(T − {ℓ, s_ℓ}) − i_j(T − N[s_ℓ])`, computed by other deletion DPs.
  - The two sides agree exactly, and `S < 0`.
  - `supply`, `capacity` and `S` also equal the critic's `crit_summary.json` values digit for digit.
  - I take `S`'s formula as C-F2-T and C-F2-U write it. r30's contract text is not in my capsule. By double counting,
    `q_ℓ(j)` is the number of `(j+1)`-sets containing `ℓ` in which `ℓ` is active, so side B is literally
    `Σ_{I_{p*+1}} w − Σ_{I_{p*}} w`.

**P2, E1: the class-count reduction, stated on its face.** Let `B` be an `r`-free independent set with `q` open chokes. By the text of
`cb8E1Val`, the value of deleting `z` from `B` depends only on the following:
- `w = activeWeight(F, B)`;
- `q = cbOpenChokeCount B`;
- the branch: 0 if `w = 0`, `q = 0` or `z` is a choke; **Boolean** if `z ∈ F` and `B ∖ {z}` meets `W_z`; **ternary** otherwise.

With `a = 8q−1`, `b = 8(m−q)+1`, `j = p* − q` and `α = w−1`, the Boolean value is `vB(q,w) = cb8E1G/cb8N(α,j)`. The ternary value is
`vT(q,w) = w·cb8H/((j−α)·cb8N(α,j))`, and `j − α = t_B := p*+1−q−w`.

- **Source row.** `B` consists of:
  - `q` chokes, which carry 0;
  - `w` Boolean elements, the present private leaves at open chokes (no support can sit at an open choke);
  - `t_B` ternary elements, each a `b` or `c` at a closed leg, or `s`/`v` in the arm. There are `8(m−q)+1 = b` such slots, at most
    one element each.

  So `row(B) = w·vB(q,w) + t_B·vT(q,w)`.
- **Target column.** For an `r`-free `A` of rank `p*` with class `(q, w)` and `t = p*−q−w`, the only positive-value arcs into `A` are
  single insertions `B = A ∪ {z}` (by the sorry-free `cb8E1Arc_shape` in the base). `r` is excluded by the guard `r ∉ B`, and
  choke insertions carry 0. The remaining insertions are of two kinds:
  - **Boolean:** a private leaf at an empty leg of an open choke, `8q − w` of them. The source class is `(q, w+1)`, because `q` is
    unchanged and the new leaf is active through `u_i`.
  - **Ternary:** a `b` or `c` at an empty closed leg, or `s`/`v` in an empty arm, 2 choices per empty slot, `2(b − t)` of them. The
    source class is `(q, w)` with `t_B = t+1`.

  So `col(A) = (8q−w)·vB(q,w+1) + 2(b−t)·vT(q,w)` (the second term only when `w ≥ 1`).
- **Class ranges.**
  - Sources: `1 ≤ q ≤ m`, `1 ≤ w_B ≤ 8q`, `0 ≤ t_B ≤ 8(m−q)+1` (plus 60/61/62 classes with `w_B = 0`, where the row is `0 = w`).
  - Targets: `1 ≤ q ≤ m`, `0 ≤ w ≤ 8q`, `0 ≤ t ≤ 8(m−q)+1`.

  Every such triple is realized by an independent set.
- **Identification with the frozen texts** (read on their face; see `## Findings and repairs`, R-1). The decomposition, the counts
  `w` and `t_B`, and the bounds `w ≤ 8q` and `t_B ≤ b` are N1 (B1) `cb8_rFree_deletionClasses`. The insertion counts are
  N1 (B2) `cb8_rFree_insertionClasses`: Boolean count + `w = 8q`, and ternary count + `2t + 16q = 16m + 2`, so the ternary count is
  `2(b − t)`. The source class of each insertion is N1 (B3) `cb8_nonChokeInsert_weight`.
- **Algebra** (my check; it explains the zero exception counts). Write `S_{<α}(k) = Σ_{α'<α} cb8N(α',k)`, so that
  `cb8E1G(α) = ρS_{<α}(j−1) − S_{<α}(j)` and `cb8H(α) = S_{≤α}(j) − ρS_{<α}(j−1)`.
  - Then `cb8E1G(α) + cb8H(α) = cb8N(α,j)`, so `row = w` whenever `t_B ≥ 1`.
  - At `t_B = 0` (so `α = j`), `cb8H = r_q(j) − ρ·r_q(j−1) = 0` because `r_q(j−1) > 0`. The row is again `w`, and Lean's `x/0 = 0`
    never enters.
  - Using `(8q−w)/cb8N(w,j) = w/cb8N(w−1,j−1)` and `2(b−t)/((t+1)·cb8N(w−1,j)) = 1/cb8N(w−1,j−1)`, we get
    `col = w·(cb8E1G(w) + cb8H(w−1))/cb8N(w−1,j−1) = ρ_q·w`.
  - The edge cases `w = 8q` (where `cb8E1G(a+1) = 0`) and `t = b` (where `cb8H(w−1) = 0`) are consistent with this.
  - So "row = w" and "column = ρ_q w" are identities once the denominators are positive. The substantive content of the census is the
    **sign** of every arc value, and `ρ_q < 1`.

**My census** (exact `Fraction`s; ℕ subtractions `8q−1` (`q ≥ 1`), `m−q` (`q ≤ m`), `p*−q` (`q ≤ m < p*`) and `w−1` (`w ≥ 1`) are safe
by the loop bounds, and `t` is checked in ℤ):

| m | source classes (`w_B ≥ 1`) | negative arc values | row ≠ w | target classes (q ≥ 1) | column ≠ ρ_q·w | max ρ_q (= ρ_1) | ρ_q ≥ 1 |
|---|---|---|---|---|---|---|---|
| 158 | 47,844 | 0 | 0 | 47,937 | 0 | 0.997036870 | 0 |
| 161 | 49,675 | 0 | 0 | 49,770 | 0 | 0.997092017 | 0 |
| 164 | 51,541 | 0 | 0 | 51,638 | 0 | 0.997145149 | 0 |

The class counts agree with C-F2-T's exactly.

**P3, the sector** (the N3/N4 bridges read the row and column through `chokeState`). A sector source is `{r, v}` plus `K = p* − 1`
legs, and each choke is in state `(β, γ)` with `β + γ ≤ 8`. Every assignment of states with leg total `K` occurs, since legs are
pairwise non-adjacent and `r` excludes `s` and every `u_i`. In-sector targets are the same with leg total `K − 1`. My DP over all 45
states per choke gives exact results:

| m | min Σ_i Out over sector sources | a minimizer (states: #chokes) | max Σ_i In over in-sector targets | a maximizer |
|---|---|---|---|---|
| 158 | **1** | (0,1): 60, (0,7): 1, (0,8): 97 | **1** | (0,0): 37, (0,2): 1, (0,7): 120 |
| 161 | **1** | (0,1): 61, (0,6): 1, (0,8): 99 | **1** | (0,0): 38, (0,4): 1, (0,7): 122 |
| 164 | **1** | (0,1): 62, (1,4): 1, (0,8): 101 | **1** | (0,0): 39, (0,6): 1, (0,7): 124 |

- The used `pb`, `pc` and `σ` cells are nonnegative (0 negative cells).
- The **zero slack at the Out end is structural.** At all 45 states I checked `D·Out(s) = (25m/2)·ℓ + OutConst(s)` and
  `OutConst(s) ≥ 5ℓ − 7/2`. I also checked the identity `(25m/2 + 5)K − 7m/2 = D` with `D = (200m²+82m+5)/3`. Together these give
  `Σ Out ≥ 1` on every distribution, and the DP shows that the bound is attained.
- The extremizers match C-F2-T's histograms exactly.

**Switch images** (`q = 1`, `v ∈ A`, `r ∉ A`, choke state `(0, γ)`, `w = γ`). The E1 load is my P2 column (from the definition),
`ρ_1γ`. The sector load is `(8−γ)σ(γ)`. Then `ρ_1γ + (8−γ)σ(γ) ≤ γ` for `γ = 0..8`, and the minimum slack is exactly:
- `9151279169336332737349/3149535742809581379496476` ≈ 2.906e−3 at 158;
- `298427137595725671381/104616909497994454217188` ≈ 2.853e−3 at 161;
- `16180014436301517703/5775595415439467894500` ≈ 2.801e−3 at 164.

These are equal to the critic's fractions. The margins `(1−ρ_1)/θ` are 51.50, 52.48 and 53.46.

**P4, literal evaluation of the frozen definitions** (`sr5_literal.py`: my own `transportRel`, `activeWeight`, `cb8E1Val`/`cb8E1Arc`
with Lean conventions, and `cb8GSec` guard by guard; images and preimages enumerated literally).
- **The E1 reduction, exhaustively** (every `r`-free source row and every `r`-free `q ≥ 1` target column against the class formula):
  - CB(8,1) at ranks 1–9: 20,431 sources and 766 targets, 0 mismatches. There are 8 off-class rows `≠ w`. All 8 are the sources
    `{u, c}` at `(p, q, w) = (1, 1, 1)`: there `r_1(−1) = 0`, so `ρ = 0` by `x/0 = 0` (checked separately).
  - CB(8,2) at ranks 2–4: 272,910 sources and 5,623 targets, 0 mismatches.
- **At each class row** (158 in `sr5_literal.py 158`; 161 and 164 in the `--rows-only` run), with 0 failures:
  - the DP-minimizing sector source: literal E1 row 0 and `cb8GSec` row exactly 1;
  - the DP-maximizing in-sector target: E1 column 0 and `cb8GSec` column exactly 1;
  - the idle-choke target (F2's class (a) shape): `1668167/1668587`, `1732041/1732469` and `1797115/1797551`;
  - the `cb8GSec` row or column equal to `Σ Out`/`Σ In` at 5 sector sources and 4 in-sector targets;
  - 9 switch images with `γ = 0..8`: exactly `8 − γ` sector preimages each, E1 column `ρ_1γ`, `cb8GSec` column `(8−γ)σ(γ)`, and total
    at most `γ`;
  - 34 `r`-free targets and 25 `r`-free sources across `q ∈ {1, 2, 3, 5, ⌊m/3⌋, ⌊m/2⌋, ⌊(p*+1)/9⌋, +1, m−1, m}`, including the
    boundaries `w = 0`, `w = 8q`, `t = 0` and `t = b`. The column equals the class formula and `ρ_q w`; `cb8GSec` gives 0 except at
    one-choke `v`-targets, where it gives `(8−w)σ(w)`. Rows equal `w`, with `cb8GSec` row 0;
  - the weight-0 classes (`r ∈ A ∌ v`; `r`-free with `q = 0`; sources with `r` but not `v`): 0 in and 0 out;
  - every enumerated image or preimage lies in the correct layer and satisfies `transportRel`.
- The per-row counts are the same at 158, 161 and 164: 5 sector sources, 4 in-sector targets, 9 switch images, 34 `r`-free
  targets, 25 `r`-free sources and 6 weight-0 cases, with 0 failures at each row.

**Hall for every `X`** (the elementary step, read on its face). By P2 and P3, `f ≥ 0`. By the guards, it is supported on
`transportRel` pairs with the image in `I_{p*}`. Every source `B` has `row(B) ≥ w(B)`:
- sector sources: E1 row 0 (`r ∈ B`), `cb8GSec` row `≥ 1 = w`;
- `r`-free sources: E1 row `= w`, `cb8GSec` row 0 (non-sector guard);
- sources with `r` and not `v`: weight 0.

Every target `A` has `col(A) ≤ w(A)`:
- in-sector targets: E1 0, `cb8GSec ≤ 1 = w`;
- one-choke `v`-targets: `ρ_1γ + (8−γ)σ(γ) ≤ γ`;
- other `r`-free `q ≥ 1` targets: `ρ_q w ≤ w`;
- `r ∈ A ∌ v` and `r`-free `q = 0` targets: weight 0 and column 0.

A sector source's images are its leg deletions, the deletions of `r` and `v`, the switch at `s`, and the `u_i`-switches at `β_i = 1`.
The switch at `u_i` with `β_i ≥ 2` has `|N(u_i) ∩ B| ≥ 3`. So `cb8GSec` reaches no other target class. Then for every
`X ⊆ I_{p*+1}`:

`Σ_X w ≤ Σ_{B∈X} Σ_A f(B,A) ≤ Σ_{A∈N(X)} col(A) ≤ Σ_{N(X)} w`.

**R31-SR-C4-5b.** Computed by `sr5_literal.py` L1 and L3.

| tree | n | α | x | ⌊2α/3⌋ | eligible ranks (x+2 ≤ p, 3p < 2α+1) |
|---|---|---|---|---|---|
| CB(8,1) | 20 | 10 | 6 | 6 | **none** |
| CB(8,2) | 37 | 19 | 12 | 12 | **none** |
| CB(8,3) (context) | 54 | 28 | 17 | 18 | none |
| CB(8,4) (context) | 71 | 37 | 22 | 24 | {24} |

At CB(8,1), `p = 6 = (16+4)/3` (ℕ division), I enumerated `I_7` (8,332 sets) and `I_6` (8,484 sets) exhaustively; the full
independence count is 33,573. `F_6 = leafSet` is derived leaf by leaf. The frozen `g = cb8E1Arc + cb8GSec` gives the following:
- 1,400 arcs with a negative `cb8GSec` value. E1 has 0 negative values, and every `r`-free E1 row equals `w`.
- 1,736 sources with row `< w`.
- 1,190 targets with column `> w`: all 1,120 in-sector targets, plus 70 one-choke `v`-targets.
- The class-free bridges hold: Out 1,792/1,792 and In 1,120/1,120.

Every count equals C-F2-U's. `m = 1` is off-class (`m ≡ 1 mod 3`, `m < 107`), and `p = 6 = x` is not eligible.

## Findings and repairs

- **R-1 (the reduction is identified; repairs synthesis §(iii)(a)).** The synthesis says C-F2-T's E1 class-count reduction "is not
  identified on the record with the frozen N1/N2". Read on their face, it is identified: its content is exactly the three frozen N1
  texts plus the definition of `cb8E1Val`:
  - B1 `cb8_rFree_deletionClasses`: the deletion decomposition, the counts and the bounds;
  - B2 `cb8_rFree_insertionClasses`: Boolean `8q − w`, ternary `16m + 2 − 2t − 16q = 2(b − t)`, and the up-covers lie in the next
    layer;
  - B3 `cb8_nonChokeInsert_weight`: the class of `A ∪ {z}`;
  - the definition of `cb8E1Val` (value depends on `(w, q, branch)` only) and the sorry-free `cb8E1Arc_shape` (single-deletion
    support).

  It does not use N2. So condition (a) of the E-5 record is the frozen N1 (compiled scratch, ungraded; second read R31-SR-C4-1),
  together with definitional facts. I also confirmed the reduction independently (P2 on its face, P4 exhaustively at CB(8,1) and
  CB(8,2), and by sampling at all three rows). The record stays **conditional**: no compiled scratch has a grade.
- **R-2 (what the census proves).** "Row = `w`" and "column = `ρ_q w`" are algebraic identities of the E1 definitions when
  `cb8N(w−1, p*−q) > 0` and `r_q(p*−q−1) > 0` (P2, Algebra). The census's substantive content at the rows is:
  - nonnegativity of every Boolean and ternary arc value over all 47,844 / 49,675 / 51,541 source classes;
  - `ρ_q < 1` for every `q ∈ [1, m]`.

  The record should say so, so that the zero exception counts are not read as independent evidence.
- **R-3 (class-count precision).** The counts 47,844 / 49,675 / 51,541 are source classes with `w_B ≥ 1`. The 60 / 61 / 62 classes
  with `w_B = 0` are trivial, since the row is 0 and the weight is 0. The target counts 47,937 / 49,770 / 51,638 include `w = 0`.
  These are the "about 48–52k classes per row" of the brief.
- **R-4 (a wrong digest literal on C-F2-T's face).** The P1 table gives the SHA-256 of the decimal `S` at 158 as `ebda3c7e…d6ee`. The
  true digest of the same decimal (equal digit for digit to the critic's own `crit_summary.json` value) is
  `ebda3c7e6daa8958a58d32c6a732ede53b193b3e60051eab3a978c84e7fb72ee`, which ends `…72ee`. The 161 and 164 literals are correct. The
  "605/617/628 digits" count includes the minus sign; the digit counts are 604/616/627. Neither error touches any conclusion.
- **R-5 (what "exactly 1" means).** The min-Out value 1 is forced from below on every distribution by C1-LA1's per-state bound (entry
  92's `OutConst ≥ 5ℓ − 7/2`, which I checked at all 45 states) and the polynomial identity. The DP adds attainment. The max-In value 1
  is a DP fact at these three rows only. Neither is an LP-optimality statement, and the `θ*` law is not used.
- **Checks that pass.**
  - The selector is derived, not cited.
  - `x` is computed through `α`.
  - (WID) holds from independent sides before any interpretation.
  - Every ℕ subtraction is guarded by the loop bounds.
  - There is no Newton or Darroch step.
  - Only rank `p*` and only the class rows are used; CB(8,1) and CB(8,2) enter only as off-class, non-eligible mechanics tests.
  - Row 161 is structural (`x = p* − 3`), and the computation there does not use `x = p* − 2`.
- **Fences held.** The record rests on no refuted mechanism. It uses the `m`-dependent affine template of C1-LA1, not the refuted
  `m`-independent per-choke certificate. It gives no status to any key and transfers nothing across a fence. It is not an evaluation
  through r30's PROVED orbit quotient (C-F2-T's remaining obligation 3 stands), and it is not a `computer_assisted` row certificate.
- **Alias check.**
  - No key in any of the three registries names rows 158, 161 or 164. The only lexical hit, `E993-C2-CT-F1-T1588-TARGET-LC-CONTROL`,
    is unrelated.
  - No key covers the CB(8,1)/CB(8,2) eligibility facts.
  - The nearest keys are the Tier 1 key `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`
    (run-local) and the r30 row key `E993-R30-CB-8-M-95-TO-107-…-WITH-LOAD-BEARING-SWITCH-ARCS` (all three registries).
  - Both records below are ledger records with no key. The distinction rows below separate them from those two keys.

## Registration text

```text
RECORD: R31-SR-C4-5-R1
CLAIM: [r31 C4; R31-SR-C4-5] Three-row conditional composed-flow confirmation (C4 E-5). Let T = CB(8,m) with m ∈ {158, 161, 164} (m ≡ 2 mod 3) and p* = (16m+4)/3 = 844, 860, 876, at that rank only. (E) (n, α, x) = (2689, 1423, 842), (2740, 1450, 857), (2791, 1477, 873), with x the least k such that i_{k+1}(T) < i_k(T), computed through rank α; so x + 2 ≤ p* (x = p* − 2 at 158, x = p* − 3 at 161 and 164), 3p* < 2α + 1, and i_{p*−1}(T) < i_{p*−2}(T). F_{p*}(T) = leafSet(T) is derived: Δ_{p*}(T − ℓ) = i_{p*+1}(T − ℓ) − i_{p*}(T − ℓ) < 0 at v and at representative private leaves, and the 8m private leaves form one automorphism orbit. (WID), supply − capacity = S(T, p*) < 0, holds from two independent sides (forced-inclusion DPs; deletion DPs). (H) The frozen function g = cb8E1Arc m p* F + cb8GSec m (with C1-LA1's unscaled table) is nonnegative and supported on literal (D) ∪ (S) arcs with images in I_{p*}; every source row is at least w_F and every target column at most w_F. In detail: (i) over every r-free source class (q, w_B), with 1 ≤ q ≤ m, 1 ≤ w_B ≤ 8q and 0 ≤ p* + 1 − q − w_B ≤ 8(m − q) + 1 (47,844 / 49,675 / 51,541 classes), every E1 arc value is ≥ 0 and every row equals w_F; (ii) over every r-free target class with q ≥ 1 (47,937 / 49,770 / 51,638 classes), every E1 column equals ρ_q·w_F, with ρ_q < 1 for every q ∈ [1, m] and the maximum at q = 1; (iii) over all distributions of the K = p* − 1 source legs and the K − 1 target legs among the m chokes, the minimum over sector sources of Σ_i Out is exactly 1 and the maximum over in-sector targets of Σ_i In is exactly 1 (zero slack at both ends; the lower bound is forced by C1-LA1's per-state bound, the DP gives attainment); (iv) u_i-switch images of weight γ receive ρ_1γ + (8 − γ)σ(γ) ≤ γ for γ = 0..8, with minimum slack ≈ 2.906e−3, 2.853e−3 and 2.801e−3; (v) in-sector targets receive 0 from E1, and weight-zero targets receive 0. Hence Σ_{B∈X} w_F(B) ≤ Σ_{A∈N(X)} w_F(A) for every X ⊆ I_{p*+1}(T) at these three (T, p*). The E1 identities row = w_F and column = ρ_q·w_F hold algebraically once the denominators are positive; the census's substantive content is the sign of every arc value and ρ_q < 1. Conditional on: (a) the E1 class-count reduction (Boolean insertions 8q − w, from class (q, w + 1); ternary insertions 2(8(m − q) + 1 − t), from class (q, w); choke insertions carry 0; r is not insertable), whose content is exactly the frozen N1 texts cb8_rFree_deletionClasses, cb8_rFree_insertionClasses and cb8_nonChokeInsert_weight together with the definition of cb8E1Val (compiled scratch, ungraded; R31-SR-C4-1); and (b) the N3/N4/N5 bridges cb8GSec_out_eq, cb8GSec_in_eq, cb8_sector_switchPreimages, cb8GSec_switchImage_inflow and cb8GSec_zero_classes (compiled scratch, ungraded; R31-SR-C4-3). Both were validated literally: (a) exhaustively on CB(8,1) at ranks 1–9 and on CB(8,2) at ranks 2–4; (a) and (b) exhaustively at CB(8,1), p = 6, and on sampled and adversarial sets, including the DP extremizers, at all three rows. Fences: rows 158, 161 and 164 and rank p* only. This is not an evaluation through r30's proved orbit quotient and not a computer_assisted row certificate. It is census evidence (fence 7) and never evidence for the universal Tier 1 statement. It gives no status to any key, including the r31 Tier 1 key, E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL and the primary aggregate. No θ* law, LP optimality, Newton or Darroch step is used.
STATUS: bounded_computation
PROVENANCE: STATED at Stage 4, critic-derived by C-F2-T (cycles/cycle-4/stage4/critics/F2/T/CRITIQUE.md P1–P4; crit_f2t.py 6ba35369…, run2 stdout 72010eb7…, crit_summary.json d2d0a291…; adv_literal.py 52d8046c…, stdout 8f5ebc56…). C-F2-U's independent per-class DP agrees at every class inequality. F adjudication E-5 (replay byte-identical); Stage 6 synthesis §(iii). Isolated second read R31-SR-C4-5 (Claude Opus 5.5): the copy-out replay was byte-identical, and the reader's own instruments sr5_rows.py and sr5_literal.py re-derived every figure. Mechanism attribution: the weight, relation and (HALL) are from Codex GPT-6's lower-region run; the E1 criterion and the choke-local certificate method are from r30, as registered; cb8E1Arc is from r31 C3 seat U2; the allocation table is from r31 C1-LA1; the frozen texts were drafted by r31 controller staff.
```

```text
RECORD: R31-SR-C4-5-R2
CLAIM: [r31 C4; R31-SR-C4-5] Off-class adversarial facts; they are neither cuts nor class statements. (i) CB(8,1) (n = 20, α = 10, x = 6) and CB(8,2) (n = 37, α = 19, x = 12) have no eligible rank: x + 2 ≤ p and 3p < 2α + 1 have no common solution, since x = ⌊2α/3⌋ = 6 and 12 respectively; x is the least k such that i_{k+1} < i_k, computed through α. (ii) At CB(8,1) with p = 6 = (16·1 + 4)/3 (ℕ division), the row is off-class (m = 1 ≡ 1 mod 3, m < 107) and p = x is not eligible. With F_6 = leafSet derived leaf by leaf, the frozen g = cb8E1Arc + cb8GSec is not a flow bundle. There are 1,400 arcs with a negative cb8GSec value; every E1 arc value is ≥ 0 and every r-free E1 row equals w_F. There are 1,736 sources with row sum < w_F and 1,190 targets with column sum > w_F (all 1,120 in-sector targets and 70 one-choke v-targets). The class-free N3/N4 bridges hold there (Out 1,792/1,792; In 1,120/1,120). This is consistent with the frozen N3/N4 sign and bound statements, which carry 107 ≤ m ∧ m % 3 = 2. It bears on no class row, is not a template failure within the class, and says nothing about (HALL) at CB(8,1).
STATUS: bounded_computation
PROVENANCE: Critic-attributed. (i) C-F2-T (CRITIQUE F-4), with C-F2-U agreeing. (ii) C-F2-U (CRITIQUE finding 7; cb81_bundle.py, replayed byte-identically by the F adjudicator, a112ca84…). F adjudication E-6 and cross-route reconciliation item 3; Stage 6 synthesis `## Registrations`. Isolated second read R31-SR-C4-5 (Claude Opus 5.5): the reader's own sr5_literal.py (L1, L3) reproduced every count by exhaustive literal enumeration.
```

```text
DISTINCTION ROW: R31-SR-C4-5-D1
KEY: E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL
TEXT: Record R31-SR-C4-5-R1 evaluates the single frozen function cb8E1Arc + cb8GSec (the Cycle 4 conjunct-4 flow) against the literal network at three rows of this key's class (m = 158, 161, 164; rank p* only). It is bounded_computation and conditional on the frozen N1 and N3/N4/N5 texts. It records three instances of the key's (H); it is not the key, not an alias of it, and not evidence for it (fence 7). It neither restates nor upgrades the key, and the key's grade does not flow to the record.
```

```text
DISTINCTION ROW: R31-SR-C4-5-D2
KEY: E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: The r30 row key covers m ∈ {95, 98, 101, 104, 107} at the first eligible rank p = x + 2, through r30's census flow. Record R31-SR-C4-5-R1 concerns the disjoint rows 158, 161 and 164 (at 161 and 164, p* = x + 3 is not the first eligible rank), evaluates the frozen r31 functions cb8E1Arc and cb8GSec, and is bounded_computation and conditional. Neither extends the other.
```

## Verdicts

verdict[R31-SR-C4-5a]: confirmed_with_repairs
verdict[R31-SR-C4-5b]: confirmed

- **5a, repairs R-1 to R-4.**
  - The E1 reduction is identified with frozen N1 B1–B3, so condition (a) names them.
  - The census's content is the sign of every arc value plus `ρ_q < 1`; the identities are algebraic.
  - The class-count ranges are stated precisely.
  - C-F2-T's digest literal at 158 is corrected to `…72ee`, and its digit count includes the sign.

  My own instruments re-derive every figure the record states, at all three rows:
  - fixed points;
  - `(n, α, x)`, eligibility, parent descent, the derived selector, and (WID) from two sides, with `S` equal digit for digit;
  - the E1 census class for class;
  - the sector min and max, exactly 1 and 1, with the same extremizers;
  - the switch slacks, as the same fractions;
  - literal checks of the frozen definitions.

  Grade `bounded_computation`, conditional, critic-attributed to C-F2-T.
- **5b, confirmed as stated.** Every number was reproduced by exhaustive literal enumeration with my own code.

## Artifact inventory

All my files are under `scratchpad/c4-sr-R31-SR-C4-5/` (run root
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/`). Digests were computed by `shasum -a 256`
at close.

| Path (under `scratchpad/c4-sr-R31-SR-C4-5/`) | SHA-256 | Role |
|---|---|---|
| `seal_audit.py` | `352c1066b48d73973f2b3fdf52a34a69f0e193d8277b23f7063b9cda6823af58` | capsule seal, member and Stage 7 SOURCE-DIGESTS audit |
| `sr5_rows.py` | `3e62f78b5c14a6651a2dc6da21f93ba750afe6f6bdcaa6522fc9bf84326d5119` | own instrument, part 1 (P0–P3, switch images) |
| `sr5_rows.stdout` | `541996bb782d09835e43e9f0de0990711f9f89684a8ec6a1c11dfb8ff1887efc` | part 1 output, rows 158/161/164, exit 0 |
| `sr5_rows.stderr` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | empty |
| `sr5_rows_158_161_164.json` | `7e50cf648bba09fb9dcec78d79c68d72812a9bb8a4c242846f937d90a0dec4e0` | part 1 exact values (includes S, supply, capacity, extremal distributions) |
| `sr5_rows_158.json` | `4b365a1d58ae66988882560216a202181e637361ebad765965b49c3861f12169` | superseded: first 158-only run of an earlier sr5_rows.py (no S field); same figures |
| `dp_selftest.py` | `9545acbac8e3e56aa8d9c0d55ef051d76c325779036408134d321ff9c21d322e` | brute-force check of the all-45-state DP (m = 1..3, every leg total) |
| `sr5_literal.py` | `0622153a96d9885a113f0b793edda41507ba9aebdac6a8141c069a2020a36175` | own instrument, part 2 (L1–L5, literal frozen definitions) |
| `sr5_literal_final.stdout` | `c920d8a7159b1b9bafbad0686323faba4b2e1abcf4a099a7b7cd6dbb60faf5b6` | part 2 output, final version: L1–L4 and L5 at 158, exit 0 |
| `sr5_literal_final.stderr` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | empty |
| `sr5_literal_158.json` | `d6ed502c0cd212e896e1fc5e252f39049aaf9476446e3d25b4f282d96f95e841` | part 2 exact values (final version run) |
| `sr5_literal.stdout` | `c920d8a7159b1b9bafbad0686323faba4b2e1abcf4a099a7b7cd6dbb60faf5b6` | superseded: the same run under the pre-refactor sr5_literal.py; its stdout is identical to the final run's |
| `sr5_literal.stderr` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | empty (superseded run) |
| `sr5_literal_rows.stdout` | `fe0d7853458466bee5100fc9dd224005e25b6156db24a562f3fc9e7d71346226` | part 2, L5 at 161 and 164 (--rows-only; the harness-backgrounded run, PID 47625), exit 0 |
| `sr5_literal_rows.stderr` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | empty |
| `sr5_literal_rowsonly_161_164.json` | `505791280315f64f15ba88b8615661fdee3aa2c1d902da038d4cf5cdfe264a0f` | part 2 exact values at 161 and 164 |
| `replay/crit_f2t.py` | `6ba35369ee65e8702f5138ca7d716fa01e8ba2809569bdf5c957ae30b716814a` | copy-out of the frozen critic instrument (byte-identical) |
| `replay/adv_literal.py` | `52d8046c0f452d1d8078351787b6de6b0864d1e7e10b91a6249228133eeb13d6` | copy-out of the frozen supplement (byte-identical) |
| `replay/stdout.log` | `72010eb75a66f6136aa4b4f35415f4b39750c889760bd4c65784dcd5c102820d` | replay stdout; byte-identical to frozen run2/stdout.log |
| `replay/crit_summary.json` | `d2d0a291017522745d4f9e25ed51db7da42bf45fdb93d6de14f4a0ade7842eb3` | replay summary; byte-identical to frozen run2/crit_summary.json |
| `replay/stderr.log` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | empty |
| `replay/adv_stdout.log` | `8f5ebc56c23e89be536ce61410afc1b51ae846c48f1899695f8a98ae37814202` | replay; byte-identical to frozen adv/stdout.log |
| `replay/adv_stderr.log` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | empty |

The deliverable is `second-reads/R31-SR-C4-5/SECOND-READ.md`. Its own digest is reported in the final message, because it cannot
contain itself.

Replay commands (foreground, from the scratch directory):
- `cd replay && python3 -B crit_f2t.py > stdout.log`, then `python3 -B adv_literal.py > adv_stdout.log` (about 5 min);
- `python3 -B sr5_rows.py 158 161 164` (about 1 min);
- `python3 -B sr5_literal.py 158` (about 8 min; includes L1–L4);
- `python3 -B sr5_literal.py --rows-only 161 164` (over 10 min; poll by PID).
