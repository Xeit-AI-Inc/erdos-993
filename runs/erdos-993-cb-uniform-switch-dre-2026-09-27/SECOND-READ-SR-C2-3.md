# Second Read

Isolated second read `SR-C2-3`, r31 Cycle 2 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`): the complete sector-arc table on
`CB(d,m)` (synthesis X-10), the post-scaling in-sector tightness, and the G-5 scope-note text. Written 2026-09-28, closed at 03:38 EDT by
the clock (the first clock reading of this read was 03:35 EDT).

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Subsystems loaded: those two files only. I did not follow the task-type
map into memory, logs, skills, decisions, operations or conversations. The controller owns conversation logging for this run; I wrote
no conversation log.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| Protocol `control/C2-SECOND-READ-PROTOCOL.md` (file SHA-256) | `563877beef7a57b1fd71ef95f518998ec7598fc9f9328e28270f3405e85d9e82` | MATCH (dispatch) |
| Brief `control/C2-SECOND-READ-BRIEF-SR-C2-3.md` (file SHA-256) | `4e91247bf0d9720886c8a7d49c03d17652a9f2c171cbe9d6aad768f1a678823b` | MATCH (dispatch and manifest) |
| **Capsule seal** `control/c2-second-read/SR-C2-3-PACKET-MANIFEST.json` (compact key-sorted JSON of the manifest minus `seal_sha256`, `(",", ":")`, no trailing newline; identical with and without `ensure_ascii`) | **`2b9ce6f68c6cb9bc5da7df0c454b5e2a9dacf2f3ce855b9095a34feab46ee292`** | MATCH (dispatch and recorded `seal_sha256`) |
| Manifest file SHA-256 | `422c8b52c39c55d39c1bac9588c40accc6ecaa3d616926c9f2403a8cfbf330e5` | recorded |
| Manifest fields | `run_id` as above; `stage` `cycle-2-second-read-SR-C2-3`; `schema_version` `verityos.math-dre.packet-manifest.v1`; `file_count` 291 | consistent |
| All 291 listed members (SHA-256 and byte count) | each equals its entry | MATCH ×291, 0 missing |
| The 263 members under `sources/`, each against its own directory's `SOURCE-DIGESTS.json` (196 in `c2-stage7-sources/`, 65 in `sources/`, 1 in `c1-results/`, 1 in `concurrent/`) | each equals its table entry | MATCH ×263, 0 unlisted |

The concurrent master `sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json` is `d917fd1d…c08` (494 claims); the frozen master
`sources/authority/CLAIM-IDENTITY.json` is `b4a339ee…470b` (491 claims); the run-local snapshot
`control/snapshots/CLAIM-IDENTITY.run-local.c2-stage2.json` is `34b2bdca…bd5b` (497 claims). All three are capsule members.

**Read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md`, the user auto-memory index and the user's e-mail into my context before my first
   tool call. I did not open or use them beyond that injection. The conversation-logging instruction there is superseded by the
   protocol's single-file write rule.
2. The combined display of the brief and the manifest exceeded the tool's inline limit. The harness saved it to its own tool-output
   cache outside the run root, and I paged that copy with the file reader. The copy holds only the two capsule members' content; no
   other file there was listed or opened.
3. Two shell calls printed a zsh `=====` separator error (cosmetic). The display of `verity.md` was truncated mid-file by the tool (about
   5,000 characters of the middle not shown). I read `startup-protocol.md` through line 150 (`head -150`). Both files are boot files
   only, not evidence.
4. One names-only, non-recursive listing outside the capsule: `second-reads/` (it showed `SR-1`..`SR-6` and `SR-C2-6`). I opened nothing
   there. There was no other directory listing above the capsule members, and no `find`, `rg`, `ls -R` or glob `cat`. Every file I read
   is a capsule member or a boot file, and every script iterates over manifest paths only.
5. No Mathlib read, no `lake`/`lean`, no network, no installs and no child agents. No background job was started, so none was
   running at the final write. `python3 -B`, standard library, exact integers and `Fraction` only.

## Statements read

From the brief (`## Statements to read`), with the statement of record `cycles/cycle-2/stage6/SYNTHESIS.md`:

- **SR-C2-3a (X-10).** "Lemma DF on `CB(d,m)` at every rank". Sector-source arcs are exactly: leg deletions (weight 1); deletions of
  `r` and `v` and the `s`-switch (weight 0); and one `u_i`-switch per choke with `β_i = 1` (`r`-free, one choke, weight `γ_i`). A
  weight-`γ` switch image has `d − γ` sector preimages. Every (D) preimage of an in-sector target is a sector source. The only
  doubly-fed class is the switch images with `γ ≥ 1`. On record: `proved_informal` STATED; attribution C-F3-U, C-F3-T (agreeing
  table).
- **SR-C2-3b.** The post-scaling in-sector load is exactly 1 and attained, so the composition uses `ΣIn ≤ 1` non-strictly (C-F1-T).
- **SR-C2-3c (G-5).** The scope note on
  `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`
  (grade `proved_informal`; attribution C-F3-U, C-F3-T, C-F1-T; precondition: SR-C2-3 concordant).

Origins read, all capsule members:
- F3's return: §4, the structural note (Facts 1–4) and its `STATED` status.
- C-F3-U: Attacks 1–3 and 11, the certification audit, and the critic-derived statement of the table.
- C-F3-T: the arc table, F-6 and F-7.
- C-F1-T: re-derivation items 6 and 8, A4–A6, and its `tight_out.txt`, for concordance only.
- The F adjudication: the scaling ruling, D9, established results 2 and 9, the tightest classes, and Group DF+CD-2.
- The synthesis: R-4, R-5, X-10, B-1, `## Refuted or narrowed mechanisms`, G-5, and the SR-C2-3 line.
- The two contracts.
- The registry texts of the composition key and the allocation key.
- SR-3's `## Registration text`, for its grammar and the key's provenance.
- Both controller-facts files, as facts only.

## Independent re-derivation

Notation, from the contracts: `T = CB(d,m)` (`d, m ≥ 1`) with path `r – s – v`, chokes `u_i ~ r`, supports `b_ij ~ u_i` and leaves
`c_ij ~ b_ij`. The relation is (D) `A = B∖{q}`, or (S) `A = (B∖N(u)) ∪ {u}` for `u ∉ B` with `|N(u) ∩ B| = 2`. The weight is
`w_F(B) = #{t ∈ F ∩ B : B ∩ (N(s_t)∖{t}) ≠ ∅}`. `leafSet = {v} ∪ C` (degrees: `r` has `m+1`, `u_i` has `d+1`, `b_ij` has 2), with
`N(s_v)∖{v} = {r}` and `N(b_ij)∖{c_ij} = {u_i}`. Since `F_p ⊆ leafSet` by definition, `F ⊇ leafSet` means `F = leafSet`; on the class
at `p*` that is the composition key's hypothesis (a).

### SR-C2-3a: the complete sector-arc table (my own proof)

Let `B ∈ I_{p+1}` with `r, v ∈ B` (a sector source). `N(r) = {s, u_1, …, u_m}`, so `s ∉ B` and no choke lies in `B`. `B` is therefore
`r`, `v` and `p − 1` leg vertices, each leg empty, `b_ij` or `c_ij`, with state `(β_i, γ_i)` at choke `i`.

1. **(D) arcs.** There is one arc per `q ∈ B`:
   - `q` a leg vertex: the image contains `r` and `v`, so it is in-sector.
   - `q = r`: the image is `r`-free and has no choke.
   - `q = v`: the image contains `r` but not `v`.
2. **(S) arcs.** Take `u ∉ B`, and count `|N(u) ∩ B|`:
   - `u = s`: `N(s) = {r, v} ⊆ B`, count 2. The switch always exists, with image `(B∖{r, v}) ∪ {s}`.
   - `u = u_i`: `N(u_i) = {r} ∪ {b_i1..b_id}`, so the count is `1 + β_i`. The switch exists iff `β_i = 1`. Its image is
     `(B∖{r, b_ij}) ∪ {u_i}` (`j` the unique b-leg), and it is independent because `N(u_i)` has been removed.
   - `u = b_ij ∉ B`: `N(b_ij) = {u_i, c_ij}` with `u_i ∉ B`, so the count is at most 1.
   - `u = c_ij`: `|N(c_ij)| = 1`.
   - `r` and `v` lie in `B`.

   No other switch exists.
3. **Distinctness.** The targets are pairwise distinct:
   - leg deletions differ from each other and contain `r, v`;
   - `B∖{r}` has no choke and no `s`;
   - `B∖{v}` contains `r` but not `v`;
   - the `s`-image contains `s`;
   - the `u_i`-images contain distinct chokes.

   The arc count is `|B| + 1 + #{i : β_i = 1}`.
4. **Weights, with `F = leafSet`.**
   - Sector source, and every leg-deletion image: `v` is active with witness `r`, and no `c_ij` is active because no choke is
     present. Weight 1.
   - `B∖{r}`: `v` is inactive and no choke is present. Weight 0.
   - `B∖{v}`: no `v`, no choke. Weight 0.
   - `s`-image: no `v`, no choke. Weight 0.
   - `u_i`-image: `v` is present but inactive (`r` is gone). The `c_ik` at choke `i` are active with witness `u_i`, and no other
     choke is present. Weight `γ_i`, which is 0 exactly at state `(1, 0)`.

   The structural clauses (1–3) need no hypothesis on `F`; only the weights need `F = leafSet`.
5. **Switch-image preimages.** Let `A ∈ I_p` be an image of a sector-source `u_i`-switch. Then:
   - `r ∉ A`, `s ∉ A`, `v ∈ A`;
   - the only choke in `A` is `u_i`;
   - there is no b-leg at `u_i`;
   - there are `γ ≤ d − 1` c-legs at `u_i`, since `β = 1` forces `γ ≤ d − 1`.

   Conversely, every `A` with these properties is such an image. A sector preimage `B` of `A` has `r ∈ B∖A`:
   - A (D) arc would give `A = B∖{r}`, which has no choke. That is impossible.
   - So the arc is (S) with inserted vertex `u ∈ A` and `r ∈ N(u)`, so `u ∈ {s, u_1..u_m} ∩ A = {u_i}`.
   - Then `B = (A∖{u_i}) ∪ {r, b_ij}` with `c_ij ∉ A`. It is independent: `N(r)∖{u_i}` and `N(b_ij)` miss `A∖{u_i}`. Its switch
     at `u_i` returns `A`.

   So there are exactly `d − γ` sector preimages, all of state `(1, γ)` at `i`.
6. **In-sector preimages.** Let `A` be in-sector (`r, v ∈ A`).
   - **(D) preimages.** Every (D) preimage `A ∪ {y}` contains `r` and `v`, so it is a sector source. They are exactly `A ∪ {b_ij}`
     and `A ∪ {c_ij}` over the empty legs, `Σ_i 2(d − β_i − γ_i)` in all.
   - **(S) preimages.** These insert some `u ∈ A` with `|N(u) ∩ B| = 2`:
     - `u = v` and `u = c_ij` are impossible (degree 1).
     - `u = b_ij` needs `u_i ∈ B`, which forces `r ∉ B`, hence `r ∉ A`. Contradiction.
     - So `u = r`, with `B = (A∖{r}) ∪ {u_i, u_k}`. Since `v ∈ B`, `s ∉ B`. Independence needs no b-leg at `i` or `k`.

     There are `C(z, 2)` such preimages, where `z` is the number of chokes of `A` without a b-leg. They exist only for `m ≥ 2`, and
     all are non-sector: they contain `v` and two chokes, and no `r`.
7. **Doubly-fed class**, in the composition key's flow:
   - **Criterion flow.** It is deletion-only from non-sector sources. It loads only `r`-free targets with `q ≥ 1` chokes, at
     `ρ_q·w_F(A)`, and 0 elsewhere.
   - **Sector part.** Its positive arcs are the leg deletions (to in-sector targets, which contain `r`) and the switches at states
     `(1, γ)` with `γ ≥ 1`. It puts 0 on the deletions of `r` and `v`, on the `s`-switch and on the `(1, 0)` switches.
   - **Intersection.** The targets that can receive positive flow from both parts are exactly the `u_i`-switch images with
     `γ ∈ [1, d − 1]`. These are `r`-free, have one choke and weight `γ > 0`, and receive `(d − γ)` arcs of `σ(γ)`.
   - **In-sector targets.** They take nothing from the criterion flow. By 6, a deletion into them comes from a sector source, and the
     criterion flow never uses a sector source. Their (S) in-arcs carry no flow in either part.
   - **Zero-weight classification.** A non-sector source of positive weight is `r`-free with `q ≥ 1` (checked; synthesis R-4).

Hypotheses and where they enter:
- `F = leafSet` enters the weight clauses only. At `p*` on the class it is hypothesis (a).
- `d, m ≥ 1` enter everywhere; `m ≥ 2` enters only for the existence of the (S) preimages in 6.
- No rank restriction enters. The argument holds for every `p` with a nonempty sector.
- No `M_0`, no remainder, no Newton, no Darroch, no residue class and no endpoint `107` enter.
- The ℕ-subtraction `d − γ` is in range (`γ ≤ d − 1`), and so is `d − β_i − γ_i`.

**Own instrument A** (`sr_df_small.py`, exhaustive, `bounded_computation`):
- Coverage: every independent set of 18 small trees, `CB(d,m)` for `(d,m) ∈ {(1,1),(1,2),(1,3),(1,5),(2,1..4),(3,1..3),(4,1),(4,2),(5,1),(5,2),(6,1),(7,1),(8,1)}`,
  at every rank `p = 0..α−1`, up to 344,973 independent sets per tree.
- Arcs are generated generically from adjacency over all vertices. The weight is the generic active-tag definition, with leaves
  and supports read off the adjacency.
- Asserted:
  - clauses 1–4 per sector source: the exact arc set, distinct targets, the arc count and every weight;
  - the characterization of switch images, with exactly `d − γ` sector preimages, all (S) at `u_i`, equal to the predicted set;
  - for every in-sector target, the (D) census and the `C(z, 2)` (S) count with its shape;
  - the doubly-fed set equal to the switch images with `γ ≥ 1`;
  - the zero-weight classification.
- Result: 0 failures. Totals include 59,049 sector sources at `CB(5,2)`, 15,309 switch images at `CB(3,3)` and 7,776 in-sector (S)
  preimages at `CB(2,4)`.
- A mutation run (`mutant_check.py`: `d − γ + 1`, `γ ≥ 0`, `C(z+1, 2)`, `s`-image weight 1) fails at `CB(3,2)` on every mutated
  clause, so the checks are not vacuous.

**Own instrument B** (`sr_df_atrank.py`, sampled, at rank `p*`, class rows):
- Rows: `CB(8,107)/572` (`K = 571`) and `CB(8,122)/652` (`K = 651`; 122 is not a row named on the record).
- Sources: 12 sector sources per row (seed 3103), half uniform and half structured, forcing `β = 1` chokes with `γ = 0..7`.
- Arcs: literal (D) ∪ (S) over all `n` vertices (1,822 and 2,077). Preimages are generated generically over all vertices, with
  independence tested.
- Checked:
  - 7,632 and 8,694 arcs against clauses 1–4, every `γ = 0..7` seen;
  - 36 switch images per row with exactly `8 − γ` sector preimages, all at `u_i`;
  - 24 in-sector targets per row: (D) census and `C(z, 2)` (S) count and shape (84 and 164 (S) preimages).
- Result: 0 failures.

### SR-C2-3b: post-scaling in-sector tightness (my own proof, every class `m`)

The allocation of record is the table on the face of
`E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107`.
I parsed it from the frozen run-local registry text, 36 + 36 intercepts, and wrote `σ(γ) = c_γθ`. Multiplying by
`D = (200m² + 82m + 5)/3`:
- `D·Out(β,γ) = 25mn/2 + [βB_pb + γB_pc + [β=1, γ≥1]·96c_γ]`;
- `D·In(β,γ) = 25m(8 − n) + (8 − n)(B_pb(β+1,γ) + B_pc(β,γ+1))` for `n = β + γ ≤ 7`.

**m-free per-state rows** (`sr_insector_tight.py`, exact):
- The Out row `≥ −7/2 + 5n` holds at all 45 states. It is tight except at `(0,0), (0,2), (0,3), (0,4), (0,5)`, with slacks `7/2`,
  `96/7`, `42`, `72`, `72`.
- The In row `≤ 24 − 5n/2` holds at all 45 states. It is tight at every `n ≤ 7`. At the nine `n = 8` states, `In = 0` and the slack is 4.
- This agrees with C-F1-T's `tight_out.txt` (concordance only).

**Summation identities, identically in m.**
- `(25m/2 + 5)K − 7m/2 = D` and `25m(8m − K + 1) + 24m − 5(K − 1)/2 = D`, with `K = (16m+1)/3`. Both are checked by hand and at five
  values of `m` (quadratics).
- So over any state assignment, `min ΣOut = 1` is attained iff every choke is Out-tight, and `max ΣIn = 1` is attained iff every
  choke has `n ≤ 7`.

**Upper bound.**
- By clause 6, the pre-scaling load of an in-sector target `A` is exactly `Σ_i In(β_i, γ_i) ≤ 1`: its sector preimages are
  `A ∪ {b_ij}` and `A ∪ {c_ij}`, carrying `pb(β_i+1, γ_i)` and `pc(β_i, γ_i+1)`, and no other flow reaches it.
- Scaling each source by `1/ΣOut(B) ≤ 1` only lowers the load. So the post-scaling load is at most 1.

**Attained, for every class `m`.**
- Take `A` with states `(1,4)` at `(2m+2)/3` chokes and `(1,5)` at `(m−2)/3` chokes.
  - Both counts are nonnegative integers because `m ≡ 2 (mod 3)`.
  - The choke count is `m`, and the leg count is `5(2m+2)/3 + 6(m−2)/3 = (16m−2)/3 = K − 1`.
  - So `A` is a literal in-sector target in `I_{p*}`.
- Every choke has `n ≤ 7` and is In-tight, so `ΣIn = 1`.
- Every preimage changes one choke to `(2,4)`, `(1,5)`, `(2,5)` or `(1,6)` and keeps the others. All of these are Out-tight, so every
  preimage has `ΣOut = 1` exactly and the scaling is the identity on `A`'s in-arcs.
- The post-scaling load is exactly 1.

**Characterization** (for `m ≥ 2`; `pb, pc > 0` for `m ≥ 4`, where arc values of 0 would only remove terms).
- The post-scaling load of an in-sector target equals 1 iff every choke state lies in the 30-state set `S*` = {`n ≤ 7`, In-tight,
  Out-tight, and both successors Out-tight}.
- `S*` is every `β ≥ 1` state with `n ≤ 7`, together with `(0,6)` and `(0,7)`.
- A second load-1 family is `(0,6)^{(m−2)/3}(1,4)^{(2m+2)/3}`.
- Profiles containing `(0,1)` or an `n = 8` state are strictly below 1.

**Exact instances** (sanity only): the `(1,4)/(1,5)` and `(0,6)/(1,4)` profiles give pre-scaling load 1 and post-scaling load 1 at
`m = 107, 110, 113, 116, 119, 122, 137, 200, 500, 2000, 20000`; the comparator profiles are `< 1`; all `pb`, `pc`, `σ` are positive at
each row.

How the conditions enter:
- The residue class enters only through the integrality of `K`, `(2m+2)/3` and `(m−2)/3`.
- The endpoint `107` is not used by the tightness argument. It is the scope of the key and of the allocation's Residual row.
- No Newton, no Darroch, no `M_0`, no asymptotics, no census value and no θ* law enter.
- The tightness is a property of THIS allocation. Hypothesis (c) of the composition key does not force it, and other feasible
  tables with the same `θ` exist on record.

### Alias and predicate check

- G-5 is a scope note on an existing key. No new key is proposed.
- `sr_alias.py` finds the key present exactly once in the run-local registry (497) and absent as a key or alias from the frozen master
  (491) and the concurrent master (494).
- None of the tokens `SECTOR-ARC-TABLE`, `DOUBLY-FED`, `IN-SECTOR`, `PREIMAGE` or `Lemma DF` occurs in any key or alias of the three
  registries.
- My record id `R31-C2-SR-C2-3-SMALL-CB-AND-CLASS-ROW-SECTOR-ARC-TABLE-AUDIT` occurs nowhere.
- The key's name remains a predicate that its statement satisfies. The note adds proof-face text and changes neither the statement
  nor the hypotheses.
- The controller's lexical pre-screen was not consulted.

## Findings and repairs

1. **X-10's weight clauses need `F = leafSet` on the face** (repair).
   - The structural clauses hold for every `F`. The weights "1", "0" and "`γ_i`" hold for `F ⊇ leafSet`, which C-F3-U's own statement
     carries but the synthesis row omits.
   - At an arbitrary rank of `CB(d,m)`, `F_p` need not be `leafSet`. On the class at `p*` it is hypothesis (a) of the key.
2. **Fence 1** (repair).
   - X-10 is stated "on `CB(d,m)` at every rank". The argument is uniform in `(d, m, p)`, which I confirm.
   - SOLUTION-CONTRACT §3.1 forbids claims for `d ≠ 8`, at other ranks, or off the class.
   - Registered as a scope note, the table is fenced to the key's class and rank. The uniformity is recorded as a property of the
     argument, as the key's own scope already does. Off-class instruments are sanity only.
3. **Omitted (S) preimages of in-sector targets** (completeness repair).
   - The synthesis row says only that every (D) preimage is a sector source. C-F3-U correctly adds the literal (S) preimages (the
     switch at `r` from two-choke sources).
   - I write their exact count `C(z, 2)` and shape, and why they carry no flow. The in-sector load equals `ΣIn` only because of this.
4. **"Only doubly-fed class" is relative to the key's flow** (wording repair).
   - It concerns the flow on the key's face: the criterion flow is deletion-only, and the sector part is zero on the `r`, `v`,
     `s`-switch and `(1, 0)`-switch arcs. It is not a property of the bare network.
   - Stated as "the targets that can receive positive flow from both parts". The range is `γ ∈ [1, 7]` at `d = 8`.
5. **Switch-image description completed.** The image is also `s`-free, contains `v`, and has no b-leg at `u_i`. The preimage count
   `8 − γ` holds for `γ ≤ 7`, and a one-choke target with `γ = 8` is not a switch image. This matches the key's own parenthesis.
6. **SR-C2-3b rests on four rows on record; now proved for every class `m`.**
   - C-F1-T computed the load at 110, 116, 119 and 137 and observed the `m`-free slacks. The F adjudicator checked the profile counts.
   - The class-uniform argument above closes it: per-state tightness, the summation identities, the profile and the characterization.
   - Repair: it is a fact about the allocation of record, not about every allocation satisfying (c). "Exactly 1" means that the
     maximum over in-sector targets equals 1.
7. **G-5 text** (repair).
   - Working labels ("Lemma DF", "X-10") are removed from registry text.
   - The attribution is extended to the F adjudicator, the synthesis, the F3 seat (struck note) and this read, and the key's own
     attribution travels unchanged.
   - Grade `proved_informal`, with no grade transfer to the key or any headline.
8. **No defect in the mathematics.** The origins agree:
   - C-F3-U's table and C-F3-T's table agree clause for clause.
   - F3's Fact 3 ("never r, never v") is correctly struck: the deletions of `r` and `v` exist and land on weight-0 targets.
   - No cut, no template failure, no refuted mechanism revived.
   - `E993-TREE-REAL-ROOTED` stays REFUTED. (HALL) at full scope, the primary aggregate, TREE, FOREST, TRANSFER, governed beta and
     Erdős #993 stay OPEN.

## Registration text

```text
SCOPE NOTE ON: E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107
TEXT: [r31 C2; SR-C2-3] Written proof of this key's target case split and the in-sector tightness of the allocation of record (proved_informal; no new key; the key's statement, hypotheses, grade and fences are unchanged). (1) Arcs out of a sector source. For B ∈ I_{p*+1}(T) with r, v ∈ B (so s ∉ B and no choke lies in B), the literal (D) ∪ (S) arcs are exactly: the K deletions of a leg vertex (image in-sector); the deletion of r (image r-free with no choke); the deletion of v (image contains r, not v); the switch at s, which always exists since N(s) = {r, v} ⊆ B (image (B ∖ {r, v}) ∪ {s}); and, for each choke u_i with β_i = 1, the switch at u_i (image (B ∖ {r, b_ij}) ∪ {u_i}: r-free, s-free, containing v, with exactly one choke u_i and no b-leg at it). No other switch exists: |N(u_i) ∩ B| = 1 + β_i because r ∈ B, |N(b_ij) ∩ B| <= 1 because u_i ∉ B, c_ij and v have one neighbour, and r, v ∈ B. The K + 3 + #{i : β_i = 1} targets are pairwise distinct. With F_{p*}(T) = leafSet(T) (hypothesis (a)): the source and every leg-deletion image have w_F = 1 (the only active tag is v, witness r); the images of the deletions of r and v and of the switch at s have weight 0; the image of the switch at u_i has weight γ_i (the private leaves at u_i, witness u_i; v is inactive once r is gone), which is 0 exactly at state (1, 0). (2) Switch images. A target A ∈ I_{p*}(T) that is r-free and s-free, contains v, and has exactly one choke u_i, no b-leg at u_i and γ <= 7 private leaves at u_i has exactly 8 − γ sector preimages, the sets (A ∖ {u_i}) ∪ {r, b_ij} over the legs j with c_ij ∉ A, each through the switch at u_i from state (1, γ). A sector preimage contains r ∉ A; a deletion preimage of A contains the choke u_i and so cannot contain r; the inserted vertex of a switch preimage is a neighbour of r lying in A, and that neighbour is u_i. (3) In-sector targets. Every (D) preimage A ∪ {y} of an in-sector target A (r, v ∈ A) is a sector source; these are exactly A ∪ {b_ij} and A ∪ {c_ij} over the 8 − β_i − γ_i empty legs of each choke. For m >= 2 an in-sector target also has literal (S) preimages: the switch at r from (A ∖ {r}) ∪ {u_i, u_k}, one for each of the C(z, 2) pairs of chokes with no b-leg in A (z the number of such chokes). These sources are non-sector (they contain v and two chokes, not r) and carry no flow in this key's flow, so an in-sector target is loaded only through sector deletions, at most Σ_i In(β_i, γ_i) before scaling. (4) Hence, in this key's flow (the criterion flow deletion-only from non-sector sources, loading only r-free targets with q >= 1 chokes at ρ_q·w_F; the sector part zero on the deletions of r and v, the switch at s and the switches at state (1, 0)), the targets that can receive positive flow from both parts are exactly the u_i-switch images of weight γ ∈ [1, 7]. (5) In-sector tightness. For the allocation of record of E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107, after every sector source is scaled to outflow exactly 1, the maximum load over in-sector targets is exactly 1, for every m in the class. This key's hypothesis In is therefore used non-strictly (Σ_i In <= 1) and has no slack. Proof: multiplied by D, the 45 Out rows of that table hold with equality except at (0,0), (0,2), (0,3), (0,4), (0,5) (slacks 7/2, 96/7, 42, 72, 72); the In rows hold with equality at every state with β + γ <= 7 (slack 4 at the nine states with β + γ = 8). By (3) the load before scaling is at most 1, and scaling by 1/Σ_i Out <= 1 only lowers it. An in-sector target with states (1,4) at (2m + 2)/3 chokes and (1,5) at (m − 2)/3 chokes (nonnegative integers because m ≡ 2 (mod 3), with m chokes and K − 1 legs) has Σ_i In = 1, and each of its preimages has only Out-tight states, so Σ_i Out = 1 there and the load after scaling is exactly 1. For m >= 2 the load after scaling equals 1 exactly when every choke state has β + γ <= 7 and is Out-tight with both successor states Out-tight: every state with β >= 1 and β + γ <= 7, together with (0,6) and (0,7). No Darroch, Newton, asymptotic step, M_0, census value or θ* law enters; the residue class enters only through the integrality of K, (2m + 2)/3 and (m − 2)/3; the tightness is a property of the allocation of record, not of every allocation satisfying hypothesis (c). The argument uses no property of d, m or p beyond d, m >= 1, but nothing is claimed off this key's class and rank. Checks (bounded_computation; sanity only, never evidence of the universal statement): record R31-C2-SR-C2-3-SMALL-CB-AND-CLASS-ROW-SECTOR-ARC-TABLE-AUDIT; the literal audits of C-F3-U (eight small CB(d,m), every rank), C-F3-T (CB(8,113)/604 and CB(8,119)/636, sampled) and C-F1-T (CB(8,2), CB(8,3), small ranks), 0 failures; the exact loads of C-F1-T at m = 110, 116, 119, 137. Attribution: the complete arc table, the (S) enumeration, the 8 − γ preimage bijection and the (S) preimages of in-sector targets: critic C-F3-U (Claude Opus 5.5, r31 Cycle 2, first written at Stage 4); the agreeing arc table and the at-rank sampled audit: critic C-F3-T (Claude Opus 5.5); the post-scaling in-sector load, the per-state slack table and the explicit load-1 profile: critic C-F1-T (Claude Opus 5.5); the ruling that the table supersedes the seat's structural note and the profile-count check: the r31 Cycle 2 F adjudicator (Claude Opus 5.5); the structural question, whose note was struck as worded ("never r, never v"): the r31 Cycle 2 seat F3 (Claude Sonnet 5); consolidation: the r31 Cycle 2 synthesis (Claude Opus 5.5); the class-uniform proof of (5), its characterisation, the written count C(z, 2) and own literal instruments: isolated second read SR-C2-3 (Claude Opus 5.5). The allocation of record carries the attribution on its own key's face. This key's own attribution (r31 Cycle 1 U2, C-U2-T, C-U2-F, the Cycle 1 U adjudicator and synthesis, SR-3; r30 as registered; Codex GPT-6's lower-region run for the transport network, the active-tag weight, the relation (D) ∪ (S), (HALL) and the CB family) travels unchanged. Fences: this key's fences apply unchanged; one rank per tree, the class only; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, governed beta and Erdős #993 stay OPEN, with no status transfer; E993-TREE-REAL-ROOTED stays REFUTED.
```

```text
RECORD: R31-C2-SR-C2-3-SMALL-CB-AND-CLASS-ROW-SECTOR-ARC-TABLE-AUDIT
CLAIM: Exhaustive literal audit, every independent set at every rank p = 0..α−1, of CB(d,m) for (d,m) ∈ {(1,1), (1,2), (1,3), (1,5), (2,1), (2,2), (2,3), (2,4), (3,1), (3,2), (3,3), (4,1), (4,2), (5,1), (5,2), (6,1), (7,1), (8,1)} (up to 344,973 independent sets; arcs (D) ∪ (S) generated from adjacency over all vertices; w_F generic with F = leafSet read off the adjacency). For every sector source: the exact arc set (leg deletions in-sector of weight 1; deletions of r and v and the switch at s of weight 0; one switch per choke with β_i = 1, image r-free, s-free, containing v, with one choke, no b-leg at it and weight γ_i); pairwise distinct targets; |B| + 1 + #{β_i = 1} arcs. The u_i-switch images are exactly the r-free, s-free targets containing v with one choke and γ <= d − 1, each with exactly d − γ sector preimages, all through the switch at u_i. Every in-sector target: (D) preimages exactly A ∪ {b_ij}, A ∪ {c_ij} over empty legs, all sector; (S) preimages exactly C(z, 2), each the switch at r from a non-sector source with v and two chokes. Targets that can receive positive flow from both parts equal the switch images with γ >= 1; positive-weight non-sector sources are r-free with at least one choke. 0 failures; a four-clause mutation run fails on every mutated clause. Sampled at rank p* on CB(8,107)/572 and CB(8,122)/652 (12 sector sources each, seed 3103; 7,632 and 8,694 literal arcs; 36 switch images and 24 in-sector targets per row with generic reverse preimages): 0 failures. For the allocation of record: the m-free Out/In slack table (Out non-tight only at (0,0), (0,2), (0,3), (0,4), (0,5); In non-tight only at β + γ = 8, slack 4); the profiles (1,4)^{(2m+2)/3}(1,5)^{(m−2)/3} and (0,6)^{(m−2)/3}(1,4)^{(2m+2)/3} have in-sector load exactly 1 before and after scaling at m = 107, 110, 113, 116, 119, 122, 137, 200, 500, 2000, 20000.
STATUS: bounded_computation
PROVENANCE: Isolated second read SR-C2-3 (Claude Opus 5.5), own instruments under scratchpad/c2-sr-SR-C2-3/: sr_df_small.py (b2176c268b7cc0dcf816ca0df171767e0df0a0525190d2321a70d5011642309f; sr_df_small_out.json 4a513133c04c00dcbc9da570e43f8230cdfa720d180b82b6740c1350ce818183), mutant_check.py (4bac303b989aaf9f3ed4b8eed5134a6e7fe5aa81f0bbd1d93782b24fa6b56e26), sr_df_atrank.py (cf08590c4c653b28239d39b975cbb2fa3dbff662d0f8cfb65576688365bf6461; sr_df_atrank_out.json b744b2091125c39d9b80ce21d1cd2b00805ad5315f9d484771786f4aba9bcd24), sr_insector_tight.py (55e8a8820bad0b6f4012ab1a4ae4ee94555dec0b550844163ef725fd32239290; sr_insector_tight_out.json 670535a9958e0b10b9a6d34ca597f365d0a7836b6b192c576a44720bc04cdfd2). Sanity only; never evidence of a universal statement.
```

## Verdicts

verdict[SR-C2-3a]: confirmed_with_repairs
verdict[SR-C2-3b]: confirmed_with_repairs
verdict[SR-C2-3c]: confirmed_with_repairs

- **SR-C2-3a.** The complete sector-arc table is confirmed by my own proof and two own literal instruments. The repairs are:
  - `F = leafSet` stated for the weight clauses;
  - the claim fenced to the class and rank, with the uniformity kept as a property of the argument;
  - the (S) preimages of in-sector targets written, with count `C(z, 2)`;
  - "doubly-fed" read relative to the key's flow;
  - the switch-image description completed.

  Grade `proved_informal`, registered only as proof-face text of the composition key.
- **SR-C2-3b.** Confirmed and upgraded from four bounded rows to a proof for every class `m`: per-state tightness, the summation
  identities and the explicit profile. The repair scopes it to the allocation of record, with "exactly 1" meaning the maximum over
  in-sector targets. Grade `proved_informal`.
- **SR-C2-3c.** The G-5 note is concordant in substance. Register the text above verbatim. The repairs are: working labels removed,
  hypothesis (a) named, fence 1 on the face, the attribution extended, and the key's attribution travelling unchanged. No new key.
  The key is unchanged, alias-clear and still a predicate that its statement satisfies. No grade moves on any key or headline.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Artifact inventory

Written file: `second-reads/SR-C2-3/SECOND-READ.md` (this file). Scratch, all under `scratchpad/c2-sr-SR-C2-3/`, run in the foreground
with `python3 -B`:

| File | SHA-256 | Purpose |
|---|---|---|
| `seal_check.py` | `4aa0b26e6e95afb42864f7efde6d4d758a124eb6089bbf280f962688da5a7f07` | capsule seal and 291 member digests |
| `src_digests.py` | `1fde786290fd218a83d46bed86089605a0b3accda1cc995ba00edd2c88c4998c` | 263 `sources/` members against their `SOURCE-DIGESTS.json` |
| `sr_df_small.py` | `b2176c268b7cc0dcf816ca0df171767e0df0a0525190d2321a70d5011642309f` | instrument A, exhaustive small `CB(d,m)`, every rank |
| `sr_df_small_out.json` | `4a513133c04c00dcbc9da570e43f8230cdfa720d180b82b6740c1350ce818183` | its output (`total_failures: 0`) |
| `mutant_check.py` | `4bac303b989aaf9f3ed4b8eed5134a6e7fe5aa81f0bbd1d93782b24fa6b56e26` | four-clause mutant of instrument A (non-vacuity) |
| `sr_df_atrank.py` | `cf08590c4c653b28239d39b975cbb2fa3dbff662d0f8cfb65576688365bf6461` | instrument B, sampled literal audit at `p*`, `m = 107, 122` |
| `sr_df_atrank_out.json` | `b744b2091125c39d9b80ce21d1cd2b00805ad5315f9d484771786f4aba9bcd24` | its output (0 failures) |
| `sr_insector_tight.py` | `55e8a8820bad0b6f4012ab1a4ae4ee94555dec0b550844163ef725fd32239290` | instrument C, allocation-of-record slacks, identities, load-1 characterization and profiles |
| `sr_insector_tight_out.json` | `670535a9958e0b10b9a6d34ca597f365d0a7836b6b192c576a44720bc04cdfd2` | its output |
| `sr_alias.py` | `2da87938a7348825ebb506cad1a653fad61ad5ba66f55cae6fe63782b772f77b` | key and record-id checks against the three registries |
| `sr_alias_out.json` | `685f28233058d177d1f65e5007f60dfae2704bf42757c24d1ef2e8231ba21caf` | its output |

Replay commands (from the scratch directory): `python3 -B sr_df_small.py`, `python3 -B sr_df_atrank.py 107 122`,
`python3 -B sr_insector_tight.py`, `python3 -B sr_alias.py`, and `python3 -B seal_check.py`, `python3 -B src_digests.py` for the audit.
No sealed member was edited, and no seat instrument was run. Seat and critic files were read only as concordance and never cited as
proof.
