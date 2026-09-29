# Second Read

**Read:** `R31-SR-C4-3`, the isolated second read of N4 and N5 (the sector In half, the zero classes and A2) and of the
sector-image classification, r31 Cycle 4. Run `erdos-993-math-dre-20260927-r31-cb-uniform-switch`. Written 2026-09-29; the clock
read 01:23 EDT before drafting.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS under the restricted boot. I read exactly two VerityOS files,
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and then my brief. I
loaded no other subsystem: no memory, knowledge, conversations, operations, modules, skills, logs or decisions. I wrote no
conversation log, because the protocol allows one deliverable.

**Read-boundary disclosures.**
1. *Harness context.* Before my first tool call, the host placed the project `CLAUDE.md`, the user auto-memory index and the user's
   e-mail address into my context. I did not open any of them with a tool, and no ruling below rests on them.
2. *Harness spill of my own output.* Three of my own commands produced output too long for the terminal: `cat` of the packet
   manifest, `cat` of the C-T3-U critique, and one broad registry-statement search. The harness saved their output under
   `~/.claude/projects/…/tool-results/`. I read exactly one of those files from there, the C-T3-U critique, which is a capsule member.
   Nothing else outside the capsule was read that way.
3. *Reads.* Every other file I read or hashed is a member of my capsule, or a file I wrote under my scratch. I made no `find`, `grep`
   or `rg` call rooted above a capsule member. I did not read `SEMANTIC-CONTRACT.md` (a member); I worked from the Lean definitions of
   record instead. I read no Mathlib source.
4. *No execution outside the rules.* I made no network access and no installs. I started no background jobs and made no process
   listings. I ran no Lean and no `lake`: the Lean texts were read as mathematics, and the build and axioms logs I cite are the
   critics' records, not my evidence. Every script is `python3 -B`, standard library only, with exact integers and `Fraction`.

## Identity and seal audit

| Object | Recorded | Recomputed here | Result |
|---|---|---|---|
| Brief `control/C4-SECOND-READ-BRIEF-R31-SR-C4-3.md` | `297cbcc3a569473122510d2df04e0491dcb8e60f44fb9de3b87209ac2c9c6fc1` (dispatch) | `shasum -a 256`, before reading | **MATCH** |
| Capsule `control/c4-second-read/R31-SR-C4-3-PACKET-MANIFEST.json`, inner seal | `47095c1e9ee542e53dff985c2ed604d3efbfd0c572dcf2266d62fd3ebdb42e20` | SHA-256 of the compact key-sorted JSON without `seal_sha256`, no trailing newline (`seal_check.py`) | **MATCH** |
| 207 capsule members (SHA-256 and bytes) | manifest | recomputed | **207/207 MATCH** (`file_count` 207) |
| `sources/c4-stage7-sources/` members against `sources/c4-stage7-sources/SOURCE-DIGESTS.json` | 153 entries | recomputed | **153/153 MATCH** |
| `sources/c4-base/` members against `sources/c4-base/SOURCE-DIGESTS.json` | 12 entries | recomputed | **12/12 MATCH** |
| `sources/c3-stage7-sources/crit-U1-F/` (19 members) | no `SOURCE-DIGESTS.json` entry in any digest file of my capsule | — | verified by the capsule seal only (disclosed) |
| Frozen statements `control/C4-FROZEN-STATEMENTS.lean` | `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1` (gate ruling 23) | recomputed; byte-identical (`cmp`) to `sources/c4-base/LeanProject/LeanProof/Statements.lean` | MATCH |

**Lean texts read** (digests computed by me):

| File | SHA-256 |
|---|---|
| C-T3-U `SpliceN4N5.lean` (all five N4/N5 bodies in the frozen file) | `e65cc7c928b1b718506a0388208b04c716b173c810ed70edd938df19177c9277` |
| C-T3-U `CritIn.lean` / `CritN5.lean` / `SpliceN4.lean` | `769bb423…6385f490` / `db44cafc…3b9fc884` / `aefdd175…bd6203c44` |
| C-T3-F `CritN5.lean` / `SpliceN45.lean` / `SpliceN4Z.lean` | `97e0c568…488558a` / `262d102e…74168573` / `8495d95e…326bc5ff` |
| Seat T3 `T3.lean` (three identical copies) | `3359e810667923da3d80eb5296a97538e2f7c76cf8520fa3227d584de70b036b` |

**My own splice audits.**
- `splice_audit.py` undoes C-T3-U's `SpliceN4N5.lean` independently: it deletes the marked helper block and restores `  sorry` in the
  five marked bodies. The result hashes to `0fc723d7…39ede1`, byte-identical to the frozen file.
- `splice_diff_audit.py` compares all four critic splices with the frozen file line by line. Every change is a pure insertion,
  except the removal of these `  sorry` lines:
  - C-T3-F `SpliceN4Z`: line 214 (`cb8GSec_zero_classes`);
  - C-T3-F `SpliceN45`: lines 214, 233, 246 (`zero_classes`, `switchPreimages`, `switchImage_inflow`);
  - C-T3-U `SpliceN4`: line 214;
  - C-T3-U `SpliceN4N5`: lines 191, 198, 214, 233, 246.

  No other frozen line changes. Every frozen statement, and the single frozen `cb8GSec`, is untouched.

**Registries.**
- The run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c3-close.json` (497 claims), the frozen master (491) and the
  concurrent master (510) were searched by key and statement.
- No key is proposed by the brief or by me.
- My five record ids occur in none of the three registries, `control/CLAIM-DISTINCTIONS.json` or `control/snapshots/OBLIGATIONS.c3-close.csv`.
- **The content of all four statements is already of record at `proved_informal`** in scope notes on
  `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`:
  - the [r31 C2; SR-C2-3] note, clause (1): the arc table, which is statement d;
  - the [r31 C3; SR-C3-2] note, clause (3): statement a;
  - the same note, clause (4): statement c;
  - the same note, clause (5): statement b.

  See Finding F-1.

## Statements read

The statement of record is `cycles/cycle-4/stage6/SYNTHESIS.md`: `## Reconciliation` (i), the N4/N5 rows, and item (ii)4 on the
`in_le_one` route. Also from the synthesis: item (ii)9 (`γ = 0`), `## Exact established results` item 5, and `## Lean awards` (the
C4-LA1 attribution and the read list). The read list names R31-SR-C4-3 as "N4 `in_eq`/`in_le_one` (C-T3-U) and N5 (C-T3-F/C-T3-U),
including the sector-image classification and the `γ = 0` junk-value reading". Under `## Registrations`, the synthesis lists the
classification lemma as an "unconditional ledger record … `proved_informal` candidate, critic-attributed to C-F3-U (C-F3-T agreeing)".
The frozen texts are `control/C4-FROZEN-STATEMENTS.lean` lines 184–246.

Throughout: `T = CB(8,m)`, `p* = (16m+4)/3`, `K = p* − 1`. Labels: `r = 0`, `s = 1`, `v = 2`, `u_i = 3+17i`, `b_ij = u_i+1+2j`,
`c_ij = u_i+2+2j`. `(β_i(X), γ_i(X))` = (`chokeBeta`, `chokeGamma`) of `X` at choke `i`, and `q(X)` = `cbOpenChokeCount m X`.

- **R31-SR-C4-3a.** The two frozen N4 texts below, with the attribution (C-T3-U) and the claim that the compiled `in_le_one` does not
  depend on N3:
  - `cb8GSec_in_eq`: for every `m`, every `A ∈ I_{p*}` with `IsSectorSource m A` has column `Σ_B cb8GSec m B A = Σ_{i<m} cb8In m (state_i A)`;
  - `cb8GSec_in_le_one`: on `107 ≤ m`, `m % 3 = 2`, every in-sector column of `I_{p*}` is `≤ 1`.
- **R31-SR-C4-3b.** `cb8GSec_zero_classes`, the frozen text, for every `m`: (i) non-sector sources; (ii) weight-zero targets; (iii) on
  `B ∋ r, v`: the deletions of `r` and `v`, the switch at `s`, and the switch at every choke in state `(1, 0)`. The claim to check is
  that no class is vacuous on the class.
- **R31-SR-C4-3c.** N5 (`cb8_sector_switchPreimages`, `cb8GSec_switchImage_inflow`), the frozen texts, for every `m`:
  - the `8 − γ` sector preimages of a one-choke `v`-target, each in state `(1, γ)`, with inflow `(8 − γ)·cb8Sigma m γ`;
  - column 0 for multi-choke targets and for `v`-free one-choke targets;
  - the reading of `γ = 0` through `cb8CGamma 0`, and `cb8Sigma m 0 = cb8Sigma m 8 = 0`.
- **R31-SR-C4-3d.** The sector-image classification (C-F3-U item 1, r31 Cycle 4; C-F3-T F-2 agreeing; F adjudication E-4). Every
  literal image of a sector source is one of five classes, and no sector source reaches `q ≥ 2`, or `q = 1` without `v`. The claims
  to check are that it is complete and exact, and what the registration text for the ledger record should be.

## Independent re-derivation

### (a) N4 In bridge and In bound (my proof, then the compiled text)

Let `A ∈ I_{p*}` be independent with `r, v ∈ A`. Then `s ∉ A` and no choke lies in `A`.

1. **Only deletion arcs can carry a nonzero value.** A nonzero `cb8GSec m B A` needs the guard: `B` independent, `r, v ∈ B`,
   `B ∈ I_{p*+1}`, and a literal arc `B → A`.
   - Suppose the arc is a switch at `u ∉ B` with `|N(u) ∩ B| = 2`. The candidates for `u` are:
     - `u = r` and `u = v`: impossible, since both lie in `B`;
     - `u = c_ij`: impossible, since `|N(c_ij)| = 1`;
     - `u = b_ij`: impossible, since `N(b_ij) = {u_i, c_ij}` and `u_i ∉ B` (it is adjacent to `r`).
   - So `u ∈ {s, u_i}`, and `u` is adjacent to `r`. But `r ∈ B ∖ N(u)` would have to hold for `r ∈ A`. Contradiction.
   - Hence `B = A ∪ {x}` with `x ∉ A`.
2. **Value of each deletion arc.**
   - The arc `A ∪ {x} → A` has `B ∖ A = {x}` and `A ∖ B = ∅`. So the only live summand is the `b`- or `c`-summand whose label equals
     `x`, read at the state of `B`.
   - If `x = b_ij`: the state of `B` at choke `i` is `(β_i(A)+1, γ_i(A))`, and `B` is independent iff `c_ij ∉ A` (`u_i ∉ A`).
   - If `x = c_ij`: the state is `(β_i(A), γ_i(A)+1)`, and `B` is independent iff `b_ij ∉ A`.
   - For every other `x`, the value is 0: either no label matches, or `B` fails independence (`x = s` or `x = u_k`, which are
     adjacent to `r`).
   - So each empty leg `(i, j)` of `A` contributes `pb(β_i+1, γ_i) + pc(β_i, γ_i+1)`, and nothing else contributes.
3. **Sum by choke.**
   - The legs of choke `i` split into `b`-legs, `c`-legs and empty legs, so choke `i` has `8 − β_i − γ_i` empty legs. This ℕ
     subtraction is safe: `β_i + γ_i ≤ 8` by `chokeBeta_add_chokeGamma_le`.
   - When `β_i + γ_i ≤ 7`, the choke's contribution is `cb8In`'s value.
   - When `β_i + γ_i = 8`, there are no empty legs, and `cb8In` returns 0.
   - This proves `cb8GSec_in_eq` for every `m`.
4. **In bound.**
   - Since `r, v ∈ A` and `s` and every `u_i` are absent, the leg count is `Σ_i (β_i + γ_i) + 2 = |A| = p*`.
   - With `m % 3 = 2`, both `16m + 4` and `16m + 1` are divisible by 3. So the leg total is `p* − 2 = (16m+1)/3 − 1 = K − 1`, which
     is exactly the hypothesis `hc` of C1-LA1's `cb8_sum_in` (base entry 102; C1-LA1 Snippet 0024). The ℕ subtraction is safe
     because `(16m+1)/3 ≥ 11`.
   - `cb8_sum_in` needs only `m % 3 = 2`. The frozen `107 ≤ m` is carried unused, and the build log's unused-variable warning at
     `SpliceN4N5.lean:1576` records exactly this.

**The compiled text (C-T3-U), read case by case.**
- `crit_gsec_support` is my step 1. It uses T3's `sector_switch_vertex_classify`, which I read: `leg_neighborFinset_inter_card_le_one`
  handles every non-choke `u ≥ 3`.
- `crit_gsec_insert` is my step 2, with the independence guard handled through `crit_indep_insert_b/c` and `crit_beta/gamma_insert_*`.
- `crit_emptyLegs_card` gives `8 − β − γ`. It is stated additively, and `omega` produces the ℕ subtraction under the proved bound.
- The `in_eq` body reindexes by `Finset.sum_bij_ne_zero`, collapses by `sum_comm` and `sum_ite_eq'`, and casts with `Nat.cast_sub`
  under explicit `≤`. It splits on `cb8In`'s `≤ 7` branch.
- `in_le_one` is `cb8GSec_in_eq` + `crit_legCount` + `cb8_sum_in m hres` + `omega`.

**N3-independence.** The brief asks me to confirm that `in_le_one` does not depend on N3. Confirmed three ways:
1. The body cites `crit_legCount`, the critic's own lemma. That lemma is proved from the base labelling (`crit_label_blocks`,
   `crit_block17`, `crit_choke_notMem`, `eq_cbVertex_iff`) with no `0 < m`.
2. My scan of the inserted helper block and the five bodies (`splice_audit.py`) finds no term reference to any of the 15 other frozen
   declarations. The single textual hit, `cb8_sector_legCount`, is inside the docstring at `SpliceN4N5.lean:1120`.
3. Corroboration only, not my evidence: C-T3-U's `axioms-splice-N4N5.log` (`34ee5bcc…`) shows `in_le_one` free of `sorryAx`, in a
   file where the five N3 declarations are `sorry` (control: `cb8GSec_out_eq` shows `sorryAx`). Any dependence on N3 would have
   surfaced there.

### (b) N4 zero classes

1. **Class (i).** If not both `r, v ∈ B`, the guard's `IsSectorSource` fails, so the value is 0 by `dif_neg`.
2. **Class (ii), weight-zero targets.** A nonzero value needs either:
   - a leg-deletion arc from a sector source, so `r, v ∈ A`, and `v` is active with witness `r`; or
   - a switch at `u_k` from state `(1, γ ≥ 1)`, so `u_k ∈ A` and `c_kj ∈ A` for some `j` (`c_kj ∉ N(u_k)`), and `c_kj` is active
     with witness `u_k`.

   Either way `w(A) ≥ 1`. When `m = 0`, the sum over `Fin 0` is empty, so the class holds trivially. T3's
   `cb8GSec_weight_zero_eq_zero` does exactly this. It uses `weight_pos_of_r_v_mem` and `weight_pos_of_choke_c_mem` through the
   carried `mem_tagWitnesses_iff_of_adj`, and it gets `0 < m` from the choke index.
3. **Class (iii), sources `B` with `r, v ∈ B`.**
   - Deletion of `r` or of `v`: `B ∖ A` is `{r}` or `{v}`, a singleton that is no leg label, and `A ∖ B = ∅`.
   - Switch at `s`: `B ∖ A = {r, v}`, which is not a singleton, and `A ∖ B ⊆ {s}`, which is no choke.
   - Switch at a choke `u_i` in state `(1, 0)`: `B ∖ A = {r, b_ij0}`, which is not a singleton. At choke `i` the `σ`-summand needs
     `1 ≤ γ`, which fails. At every other choke `k`, `A ∖ B ⊆ {u_i} ≠ {u_k}`.
   - T3's four lemmas prove these facts by exact set algebra, through the generic `cb8GSec_eq_zero_of_arcs`.
4. **Non-vacuity on the class.** I exhibited explicit instances at `m = 107, 110, 158, 161, 164`:
   - On a sector source `B ∈ I_{p*+1}` with a choke in state `(1, 0)`, all four arcs of (iii) are literal `(D) ∪ (S)` arcs (the guard
     holds). Each has `cb8GSec = 0`, and each ends at a target of weight 0, so (ii) is exercised on guard-holding arcs.
   - For (i), the literal switch-at-`r` arc `(A ∖ {r}) ∪ {u_a, u_k} → A` from a non-sector source in `I_{p*+1}` lands on an in-sector
     target, with value 0.
   - A control on the same source: the switch at a choke in state `(1, g ≥ 1)` carries `σ(g) > 0` into a target of weight `g`.
   - The `(1, 0)` class is empty in the layer only at `m ≤ 2`. At `m = 2`, 11 legs over two chokes with one choke at a single leg
     would need 10 legs on the other choke. My exhaustive `m = 1` count confirms 0 guard-holding `(1, 0)` arcs in the layer.
   - The switch-at-`r` arcs need two chokes with no `b`-leg, so they exist only for `m ≥ 2`.

### (c) N5

Let `A ∈ I_{p*}` with `v ∈ A`, `q(A) = 1` and `u_i ∈ A`. Then `r ∉ A` and `s ∉ A` (`s` is adjacent to `v`), `b_ij ∉ A` for every
`j`, and no other choke is in `A`.

1. **The census, `⊆`.**
   - A deletion preimage `B` would contain both `u_i` and `r`, which are adjacent, so every preimage is a switch.
   - The inserted vertex of a switch lies in `A ∖ B`, and `u_i ∈ A` cannot lie in `B ∋ r`, so the switch vertex is `u_i`.
   - `r ∈ N(u_i) ∩ B` and the card is 2, so `N(u_i) ∩ B = {r, b_ij}` for exactly one `j`.
   - Then `B = (B ∖ N(u_i)) ∪ {r, b_ij} = (A ∖ {u_i}) ∪ {r, b_ij}`, and independence gives `c_ij ∉ A`.
2. **The census, `⊇`.**
   - `B_j` is independent:
     - `r`'s neighbours `s`, `u_i` and `u_k` are all absent;
     - `b_ij`'s neighbours `u_i` (removed) and `c_ij` (`∉ A`) are absent.
   - `|B_j| = p* + 1`.
   - `B_j` is carried to `A` by the switch at `u_i`, because `N(u_i) ∩ B_j = {r, b_ij}`: every `b_ik` is absent from `A`.
   - Distinct `j` give distinct `b_ij`, so the map is injective. The count is therefore `8 − γ`.
   - The state at choke `i` is `(1, γ)`: `u_i`, `r` and `b_ij` are not `c`-vertices, and `c_ij ∉ A`.
3. **Inflow (i).**
   - The guard's support is exactly the census set.
   - On each `B_j`, `B_j ∖ A = {r, b_ij}` is not a singleton, so no leg summand fires.
   - `A ∖ B_j = {u_i}` fires only at index `i`. Its value is `σ(γ)` when `γ ≥ 1`, and 0 when `γ = 0`.
   - The column is therefore `(8 − γ)·[γ ≥ 1]·σ(γ)`. It equals the frozen `(8 − γ)·cb8Sigma m γ` because `cb8Sigma m 0 = 0` (F-2).
4. **Inflow (ii).**
   - A deletion image of a sector source has no choke.
   - A switch image `A = (B ∖ N(u)) ∪ {u}` has every choke of `A` equal to `u`, since `B ∖ N(u) ⊆ B ∌ u_k`. So `q(A) ≤ 1`.
   - If `q(A) = 1`, then `u` is a choke. Since `v ∉ N(u_i)`, `v ∈ B ∖ N(u) ⊆ A`.
   - So targets with `q ≥ 2`, or with `q = 1` and `v ∉ A`, receive nothing.

The compiled texts (C-T3-U: `crit_oneChoke_facts`, `crit_Bj_props`, `crit_SP_sub`, `crit_gsec_Bj` and the two bodies) are exactly
this argument. C-T3-F's `CritN5.lean` is a second, independent text with the same route. Its `crit_cb8Sigma_zero` closes `γ = 0` by
`rfl` on the wildcard.

### (d) The sector-image classification

- Let `B` be independent with `r, v ∈ B`, of any size. Then `s ∉ B` and no choke is in `B`.
- **Deletions.**
  - A deletion removes `r`, `v`, or a leg vertex.
  - A switch needs `u ∉ B` with `|N(u) ∩ B| = 2`, which forces `u ∈ {s, u_i}` (as in (a)1).
  - `N(s) = {r, v} ⊆ B`, so the switch at `s` always exists.
  - `|N(u_i) ∩ B| = 1 + β_i(B)`, so the switch at `u_i` exists iff `β_i(B) = 1`.
- **Image properties.** The five classes and their stated properties follow from the labels. The weights use the `activeWeight` definition on `leafSet`: for `m ≥ 1`,
  `leafSet = {v} ∪ {c_ij}`, `W_v = {r}` and `W_{c_ij} = {u_i}`.
  - A leg-deletion image keeps `r` and `v` and has no choke, so its weight is 1.
  - The images of the deletions of `r` and `v`, and of the switch at `s`, have no choke and do not contain both `r` and `v`, so
    their weight is 0.
  - The `u_i`-switch image, `(B ∖ {r, b_ij}) ∪ {u_i}`, contains `v` but not `s`. It has exactly one choke, and no `b`-leg at that
    choke. Its weight is `γ_i(B)`.
  - At `m = 0` the leaf set is `{r, v}`. The classes with legs are empty, and the three weight-0 classes still have weight 0
    (checked exhaustively).
- **Exactly one class, and the count.** Each image has a unique witness: `B ∖ A` for a deletion, `A ∖ B` for a switch. So each image
  falls in exactly one class. The images are pairwise distinct, and there are `|B| + 1 + #{i : β_i(B) = 1}` of them (`K + 3 + #{…}`
  on the layer).
- **The corollary follows:** no image has `q ≥ 2`, and every image with `q = 1` contains `v`.

### My instrument (`scratchpad/c4-sr-R31-SR-C4-3/`)

**Construction.**
- Written from the frozen text and the base definitions. It imports and reads no seat, critic or controller code.
- The `cb8Bpb`, `cb8Bpc` and `cb8CGamma` tables are parsed from the base `Main.lean` text (36/36/7 cells).
- The graph is the literal `cbEdge` disjunction through `fromRel`. This equals the structural build at `m = 0..3`, which is used for
  large `m`.
- `leafSet` is `∃!`-neighbour. `tagWitnesses` is `N(support) ∖ {x}`. `activeWeight` follows its definition.
- `transportRel` is literal. The backward preimage generator is complete by the relation's definition, and at `m = 1` it equals the
  forward images on all 33,315 targets of every rank.
- `cb8GSec` is the frozen guard followed by the literal indicator sum by set difference.
- At the class rows, a label-collapsed evaluator is used. It was cross-checked against the literal one on 1,235 sampled arcs, with 0
  mismatches.

**Results (all 0 failures).**

| Check | Exhaustive `m = 0, 1` (`p* = 1, 6`) | Sampled `m = 2, 5` (off class) and class rows 107, 110, 113, 158, 161, 164 |
|---|---|---|
| N4 `in_eq` | 1,120 in-sector targets | 88 targets, including the explicit load-1 profile `(1,4)^{(2m+2)/3}(1,5)^{(m−2)/3}` and an all-`(0,·)` profile |
| N4 `in_le_one` | off class (max column 342/287) | 48 class-row targets `≤ 1`; the exact DP maximum of `Σ_i cb8In` over **all** state assignments with leg total `K − 1` is exactly `1` at all six class rows |
| N4 zero classes | (i) 47,740 arcs, plus 16,927 arcs from arbitrary non-sector finsets; (ii) 51,100 arcs and 7,168 full columns; (iii) 6,561 sector sources × {r, v, s}, plus 8 `(1,0)` switches off the layer | non-vacuity: all four (iii) arcs literal and guard-holding at 5 class rows; (ii) on guard-holding arcs; (i) on literal switch-at-`r` arcs into in-sector targets |
| N5 census, card `+ γ = 8`, states `(1, γ)`, inflow (i) | 70 targets (`γ = 4` is the only value in the layer) | 140 targets, every `γ = 0..8` at `m = 5` and at every class row; `γ = 0`: 8 preimages, column 0 (14×); `γ = 8`: no preimage (16×) |
| N5 inflow (ii) | 126 targets | 29 targets with `q ≥ 2`, 31 with `q = 1` and `v ∉ A` (with and without `s`) |
| Classification | every sector source of every size (6,561): 34,992 / 6,561 / 6,561 / 6,561 / 1,024 images in classes i–v; count and distinctness | 10 class-row sector sources, 7,740 images: classes i/ii/iii/iv/v, count `K + 3 + #{β_i = 1}`, distinct, weights from the definition |

**Mutation controls at `m = 107`.** M1–M3 and M5 must be caught; M4 must not change anything.

| Mutant | Result |
|---|---|
| M1: In factor `7 − β − γ` | caught |
| M3: guard without independence | caught |
| M2: `cb8CGamma 0 := 1/10`, guard kept | the column stays 0, but the frozen right-hand side becomes `8·σ(0) ≠ 0`; caught |
| M4: drop `1 ≤ γ` in the switch summand, `cb8CGamma 0 = 0` kept | nothing changes |
| M5: drop `1 ≤ γ` and set `cb8CGamma 0 := 1/10` | the `γ = 0` column and the `(1, 0)` zero class break; caught |

These rows are `bounded_computation`: they test the statements and never prove them. The universal statements rest on the proofs
above and on the compiled texts read as mathematics.

## Findings and repairs

**F-1 (material; d, and the registration of a–c). The content is already of record, so a new fact-record would duplicate it.**
- The Cycle 4 synthesis proposes the classification as a new "unconditional ledger record … `proved_informal` candidate,
  critic-attributed to C-F3-U". The F adjudication's E-4 calls it a "critic-derived" advance.
- The run-local registry already carries it, at `proved_informal` since r31 Cycle 2, as clause (1) ("Arcs out of a sector source")
  of the [r31 C2; SR-C2-3] note on the composition key. That clause is complete: all five classes, "No other switch exists", the
  pairwise-distinct `K + 3 + #{i : β_i = 1}` targets, and the weights. Its registered origin is **r31 Cycle 2** critic C-F3-U.
- Clause (4) of the [r31 C3; SR-C3-2] note already carries the no-preimage corollary.
- The same C3 note also carries, at `proved_informal`:
  - N4 `in_eq` (clause (3));
  - N5 census and inflow, including `γ = 8` and the one-choke-without-`v` case (clause (4));
  - the zero classes (clause (5)).

  The frozen texts cite exactly these clauses in their docstrings ("SR-C3-2 (3)", "(5)"), and so does `C4-FROZEN-STATEMENTS.md`.
- None of the Cycle 4 records I read cites the SR-C2-3 note.

**Repair.**
- Register no new fact.
- Register the Cycle 4 contribution for what it is: proofs of the frozen Lean texts (a–c), with their attribution and informal grade;
  and, for (d), a cross-reference row that confirms the Cycle 4 re-derivation and points to the clause of record.
- The origin attribution of the classification stays with the Cycle 2 authors. Cycle 4 C-F3-U and C-F3-T are credited as independent
  re-derivations.

**F-2 (c). The `γ = 0` reading, stated exactly. This repairs the synthesis's gloss in item (ii)9.**
- The synthesis writes that a `γ = 0` target "receives `8·σ(0)`; the frozen `cb8Sigma` returns 0 there". That runs two separate
  facts together. On the literal network, the target has 8 sector preimages, and each arc carries **0** because `cb8GSec`'s switch
  summand requires `1 ≤ γ`. That reason is independent of `cb8Sigma`. M2 shows it: with `cb8CGamma 0` changed and the guard kept,
  the column stays 0. M4 shows the converse: with the guard dropped, the junk value alone also keeps the column at 0.
- The frozen right-hand side `(8 − 0)·cb8Sigma m 0` is 0 only through `cb8CGamma`'s wildcard `| _ => 0`.
- So the junk value is load-bearing for the **truth of the frozen equality** at `γ = 0`: M2 shows the column unchanged while the
  equality fails. It is not load-bearing for the network. The compiled proofs also use it, because they state each arc's value
  uniformly as `cb8Sigma m (chokeGamma m A i)` (C-T3-U `crit_gsec_Bj`, via `simp [cb8Sigma, cb8CGamma]`; C-T3-F
  `crit_cb8Sigma_zero`, by `rfl`).
- On the face: no rate `σ(0)` is asserted. The informal meaning is "8 preimages, each carrying 0".
- `cb8Sigma m 8 = 0` also holds through the wildcard, but it is **not load-bearing anywhere in N4/N5**:
  - at `γ = 8` the preimage set is empty, and `(8 − 8)·cb8Sigma m 8 = 0` whatever `cb8Sigma m 8` is;
  - `cb8GSec` never evaluates `σ` at 8, because `β = 1` forces `γ ≤ 7`.

  The brief's "`cb8Sigma m 0 = cb8Sigma m 8 = 0`" is true. Only the first equation carries weight.
- The F adjudication's cite `cb8Sigma_zero_and_eight` is not in my capsule, and I did not verify it.

**F-3 (d). Load point narrowed.**
- F's E-4 and C-F3-U's remaining obligation 2 call the classification "the load-bearing lemma for N5 clause 2".
- The two **compiled** N5 proofs do not use it. Both prove clause 2 directly (C-T3-U's inflow body, clause (ii)).
- Its load points are the *informal* N5 proofs (C-F3-U item 2, C-F3-T P-N5) and the completeness of N7's informal case split.

**F-4 (d). Scope and wording.**
- The classification needs no rank, no layer and no class. It holds for every sector source of every size and every `m`: classes (i)
  and (v) are empty at `m = 0`, where the weight-0 classes still hold.
- Nothing is claimed off the class or at any rank other than `p*`.
- Class (v) should also say "`s ∉ A`, no `b`-leg at `u_i`", as the clause of record does.
- The weights are w.r.t. `leafSet`, which equals `F_{p*}` on the class by carried C2-LA3.

**F-5 (a). Informational; no repair to the frozen text.**
- `C4-FROZEN-STATEMENTS.md` lists `cb8_sector_legCount` (N3) as a dependency of `in_le_one`. The compiled proof uses
  `crit_legCount` instead, so the synthesis's (ii)4 ruling ("does not depend on N3") is correct.
- Stage 7 may use either lemma, but must not cite T2's text as the critic's.
- `107 ≤ m` is unused. The class enters `in_le_one` only through `m % 3 = 2` (entry 102).

**F-6 (b). Non-vacuity, scoped.**
- No zero class is vacuous at any class row.
- Two facts hold only at small `m`:
  - the `(1, 0)`-switch class is empty in the layer at `m ≤ 2`;
  - switch-at-`r` arcs into in-sector targets need `m ≥ 2`.
- T3's own instrument logged 0 checks for (iii-d). Its critics recorded this, and the Lean proof does not depend on it.

**F-7 (process). Corroborating logs.**
- The `build-*.log` and `axioms-*.log` files I cite are the critics' records. They corroborate my reading, but they are not my
  evidence, and I rebuilt nothing.
- The kernel certificate belongs to C4-LA1's Stage 7, which this read does not gate.

**Fences** (SOLUTION-CONTRACT §3).
- One rank `p*`, `d = 8`.
- The frozen N4/N5 signatures quantify over every `m`, but the records below claim nothing off the class.
- There is no Newton or Darroch input, no asymptotic step, no `M_0` and no census value used as proof.
- `θ` enters only as the definition `cb8Theta`, with no `θ*` law and no optimality.
- There is no (HALL) and no status transfer: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`,
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, TREE, FOREST, TRANSFER and #993 stay OPEN, and `E993-TREE-REAL-ROOTED` stays
  REFUTED.
- The ℕ-subtractions are all guarded:
  - `8 − β − γ` (`chokeBeta_add_chokeGamma_le`);
  - `(16m+1)/3 − 1` (value `≥ 11`);
  - `8 − γ`, taken in ℚ after the additive card identity;
  - `A.card − 1`, under `u ∈ A`.

## Registration text

No key, no scope note and no distinction row is proposed: the facts are of record (F-1). The five rows below are ledger records.

```text
RECORD: R31-C4-SR-C4-3-N4-IN-BRIDGE-AND-IN-BOUND
CLAIM: [r31 C4; R31-SR-C4-3] The frozen N4 texts cb8GSec_in_eq and cb8GSec_in_le_one (control/C4-FROZEN-STATEMENTS.lean, SHA-256 0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1; the single frozen cb8GSec) hold as stated. With T = CB(8,m), p* = (16m+4)/3 and (β_i, γ_i) the leg state of choke i: (1) for every A ∈ I_{p*}(T) that is independent with r, v ∈ A, Σ_{B ∈ I_{p*+1}(T)} cb8GSec m B A = Σ_{i<m} cb8In m (β_i(A), γ_i(A)); a nonzero arc into A comes only from a deletion A ∪ {x} (the switch vertex of a sector source is s or a choke, both adjacent to r, so no switch image contains r), paying pb(β_i(A)+1, γ_i(A)) at x = b_ij and pc(β_i(A), γ_i(A)+1) at x = c_ij exactly when leg (i, j) of A is empty (otherwise the source is not independent) and 0 at every other x; choke i has 8 − β_i − γ_i empty legs, which is cb8In, including 0 at β_i + γ_i = 8. (2) If m ≡ 2 (mod 3), every such column is at most 1: the leg total of A is |A| − 2 = p* − 2 = (16m+1)/3 − 1 = K − 1, and C1-LA1's In bound cb8_sum_in (hypothesis m % 3 = 2 only) applies; the frozen hypothesis 107 ≤ m is carried unused. The compiled proof takes the leg count from its own helper crit_legCount, not from N3's cb8_sector_legCount, so cb8GSec_in_le_one does not depend on N3. No new fact: this is clause (3) of the [r31 C3; SR-C3-2] note on E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107; this record attaches the proof of the frozen Lean texts and its attribution. The frozen signatures quantify over every m; nothing is claimed off the class m >= 107, m ≡ 2 (mod 3), or at any rank other than p*. The compiled declarations are scratch with no grade until the governed award C4-LA1 closes. No Darroch, Newton, asymptotic step, M_0, census value or θ* law; no (HALL) and no status transfer.
STATUS: proved_informal
PROVENANCE: Proof of the frozen texts: critic C-T3-U (Claude Opus 5.5, r31 Cycle 4, first stated at Stage 4; compiled scratch sources/c4-stage7-sources/c4-crit-T3-U/LeanProject/LeanProof/SpliceN4N5.lean, SHA-256 e65cc7c928b1b718506a0388208b04c716b173c810ed70edd938df19177c9277; kernel replay by the r31 Cycle 4 T adjudicator, Claude Opus 5.5). Agreeing informal derivation with two precision repairs: critic C-T3-F (Claude Opus 5.5, r31 Cycle 4). Route statement, narrowed: seat T3 (Claude Sonnet 5, r31 Cycle 4). In bound: r31 award C1-LA1 (cb8_sum_in, base entry 102), carried. Frozen text: r31 controller staff (Claude Opus 5.5). Fact of record: the authors of the [r31 C3; SR-C3-2] note. Isolated second read R31-SR-C4-3 (Claude Opus 5.5): the proof text read case by case, the N3-independence check and own literal instrument (record R31-C4-SR-C4-3-LITERAL-CHECKS). Transport network, active-tag weight and relation (D) ∪ (S): Codex GPT-6's lower-region run; the choke-local sector certificate method: r30, as registered.
```

```text
RECORD: R31-C4-SR-C4-3-N4-ZERO-CLASSES
CLAIM: [r31 C4; R31-SR-C4-3] The frozen N4 text cb8GSec_zero_classes holds for every m: cb8GSec m B A = 0 (i) whenever not both r, v ∈ B (the guard); (ii) whenever activeWeight (cbGraph m) (leafSet (cbGraph m)) A = 0, because a nonzero summand forces a positive-weight witness in A (v with witness r after a leg deletion; c_kj with witness u_k after the switch at u_k from state (1, γ), γ >= 1); (iii) for every B with r, v ∈ B, on B ∖ {r} and B ∖ {v} (a singleton difference that is no leg label), on the switch at s (B ∖ A = {r, v}, A ∖ B ⊆ {s}) and on the switch at every choke in state (1, 0) (the σ summand needs 1 <= γ; every other choke fails the label). None of the classes is vacuous on the class: at every class row the four arcs of (iii) are literal (D) ∪ (S) arcs from sector sources of I_{p*+1} that satisfy the guard, each ending at a target of weight 0, so (ii) acts on guard-holding arcs; and (i) covers the literal switch-at-r arcs (A ∖ {r}) ∪ {u_a, u_k} → A from non-sector sources into in-sector targets. The (1, 0)-switch class is empty in the layer only at m <= 2, and the switch-at-r arcs need m >= 2. No new fact: this is clause (5) of the [r31 C3; SR-C3-2] note on E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107; this record attaches the proof of the frozen Lean text and its attribution. Nothing is claimed off the class or at any rank other than p*; compiled scratch, no grade until C4-LA1 closes.
STATUS: proved_informal
PROVENANCE: Proof: seat T3 (Claude Sonnet 5, r31 Cycle 4; compiled against a local copy of cb8GSec, T3.lean SHA-256 3359e810667923da3d80eb5296a97538e2f7c76cf8520fa3227d584de70b036b; its Section 1 helpers adapted from r31 Cycle 3 critic C-T3-U scratch). Binding to the frozen constant in the frozen file: critics C-T3-F (SpliceN4Z.lean 8495d95e230a025586578b24fae54c87cf18d0cb98ae0f67537b8433326bc5ff) and C-T3-U (SpliceN4.lean aefdd1759d39cea4d4722e52b5cbe9fe28834ed2592b41544aafd76bd6203c44), Claude Opus 5.5, r31 Cycle 4. Non-vacuity at class rows: C-T3-F, C-T3-U and R31-SR-C4-3 (T3's own instrument logged 0 checks for the (1, 0) class, a sampling artifact struck by the critics). Fact of record: the authors of the [r31 C3; SR-C3-2] note. Isolated second read R31-SR-C4-3 (Claude Opus 5.5).
```

```text
RECORD: R31-C4-SR-C4-3-N5-SWITCH-PREIMAGES-AND-INFLOW
CLAIM: [r31 C4; R31-SR-C4-3] The frozen N5 texts cb8_sector_switchPreimages and cb8GSec_switchImage_inflow hold for every m. Let A ∈ I_{p*}(T) contain v and exactly one choke u_i (i < m), and γ = γ_i(A). (a) The sector preimages {B ∈ I_{p*+1}(T) : r, v ∈ B, transportRel B A} are exactly the 8 − γ pairwise distinct sets (A ∖ {u_i}) ∪ {r, b_ij} over the legs j with c_ij ∉ A, each carried by the switch at u_i and each in state (1, γ) at choke i: a deletion preimage would contain u_i next to r; the inserted vertex of a switch preimage is u_i; |N(u_i) ∩ B| = 2 with r ∈ B leaves one b_ij; independence forces c_ij ∉ A; conversely each such set is independent because s ∉ A (v ∈ A), no other choke is in A and b_ij, r ∉ A. (b) Its cb8GSec column is (8 − γ)·cb8Sigma m γ: on each preimage B ∖ A = {r, b_ij} is not a singleton, and the only live summand is the u_i-switch term, σ(γ) for γ >= 1 and 0 for γ = 0; its weight is γ (N6, m >= 1). (c) A target of I_{p*}(T) with two or more chokes, or with one choke and v ∉ A, has no sector preimage and column 0: a deletion image of a sector source has no choke, a switch image has at most the inserted choke, and a switch image at a choke keeps v. The γ = 0 reading, stated on the face: the column is 0 because the switch summand requires 1 <= γ (8 literal arcs, each carrying 0; no rate σ(0) is asserted); the frozen right-hand side (8 − 0)·cb8Sigma m 0 is 0 only because cb8CGamma's wildcard gives cb8CGamma 0 = 0, so the junk value is load-bearing for the truth of the frozen equality at γ = 0 (and in the compiled arc lemmas, which write each arc's value as cb8Sigma m γ), not for the network. At γ = 8 the preimage set is empty and (8 − 8)·cb8Sigma m 8 = 0 whatever cb8Sigma m 8 is; cb8Sigma m 8 = 0 also holds through the wildcard but is load-bearing nowhere in N4/N5 (cb8GSec never evaluates σ at 8, since β = 1 forces γ <= 7). No new fact: this is clause (4) of the [r31 C3; SR-C3-2] note on E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107; this record attaches the proofs of the frozen Lean texts, their attribution and the exact γ = 0 reading. Nothing is claimed off the class or at any rank other than p*; compiled scratch, no grade until C4-LA1 closes.
STATUS: proved_informal
PROVENANCE: Proofs of the frozen texts, independently: critic C-T3-F (Claude Opus 5.5, r31 Cycle 4; CritN5.lean 97e0c5686473a950026c14bea526e88b25bd46f03b04ceec0fa611dad488558a, frozen-file splice SpliceN45.lean 262d102ed35b38b2c18149fb4ad4308a77a92a3e08375da1b657f3ed74168573) and critic C-T3-U (Claude Opus 5.5, r31 Cycle 4; CritN5.lean db44cafcc8264b48f4c6c10cc75622b5756dc55fc57db2dc620bb86b3b9fc884, SpliceN4N5.lean e65cc7c928b1b718506a0388208b04c716b173c810ed70edd938df19177c9277); both first stated at Stage 4; kernel replay by the r31 Cycle 4 T adjudicator. Agreeing informal proofs: critics C-F3-T (P-N5) and C-F3-U (item 2), Claude Opus 5.5, r31 Cycle 4. The γ = 0 fidelity flag: critics C-U2-F and C-U2-T and the r31 Cycle 4 synthesis; its exact reading (column zero by the 1 <= γ guard; junk value load-bearing for the frozen equality only; σ at 8 never load-bearing): isolated second read R31-SR-C4-3 (Claude Opus 5.5). Fact of record: the authors of the [r31 C3; SR-C3-2] note. Transport network and relation (D) ∪ (S): Codex GPT-6's lower-region run; r30 as registered.
```

```text
RECORD: R31-C4-SR-C4-3-SECTOR-IMAGE-CLASSIFICATION-CROSS-REFERENCE
CLAIM: [r31 C4; R31-SR-C4-3] The r31 Cycle 4 sector-image classification (critic C-F3-U item 1; critic C-F3-T F-2 agreeing; F adjudication E-4; Cycle 4 synthesis, unconditional ledger records) is confirmed complete and exact. It is not a new fact: it is clause (1) of the [r31 C2; SR-C2-3] note on E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107 (proved_informal since r31 Cycle 2), with its no-preimage corollary in clause (4) of the [r31 C3; SR-C3-2] note on the same key; this row only cross-references it and adds no status. As confirmed: for T = CB(8,m) and any independent B with r, v ∈ B (so s ∉ B and no choke lies in B), every literal (D) ∪ (S) image of B is exactly one of: (i) B ∖ {b_ij} or B ∖ {c_ij}, in-sector with no choke, weight 1; (ii) B ∖ {r}, r-free with v, no choke, weight 0; (iii) B ∖ {v}, with r and without v, no choke, weight 0; (iv) the switch at s, (B ∖ {r, v}) ∪ {s}, r-free and v-free, no choke, weight 0; (v) for each choke with β_i(B) = 1, the switch at u_i, (B ∖ {r, b_ij}) ∪ {u_i}, r-free and s-free, with v, exactly one choke and no b-leg at it, weight γ_i(B). No other switch exists (|N(u_i) ∩ B| = 1 + β_i(B); |N(b_ij) ∩ B| <= 1 because u_i ∉ B; c_ij and v have one neighbour; r, v ∈ B). The images are pairwise distinct and number |B| + 1 + #{i : β_i(B) = 1}. Hence no image of a sector source has two or more chokes, or one choke without v. Weights are the active-tag weight on leafSet, which equals F_{p*} on the class (carried C2-LA3). The argument uses no rank, layer or class hypothesis (at m = 0 classes (i) and (v) are empty); nothing is claimed off the class or at any rank other than p*. The compiled N5 proofs do not use this lemma: they prove N5 clause 2 directly. Its load points are the informal N5 proofs of C-F3-U and C-F3-T and the completeness of N7's informal case split. A second proved_informal record of the same fact is not to be registered.
STATUS: proved_informal
PROVENANCE: Origin, as registered on the [r31 C2; SR-C2-3] note: r31 Cycle 2 critic C-F3-U (Claude Opus 5.5; the complete arc table, first written at Stage 4), with that note's other authors (C-F3-T, C-F1-T, the r31 Cycle 2 F adjudicator and synthesis, SR-C2-3). Independent r31 Cycle 4 re-derivations: critic C-F3-U (Claude Opus 5.5, item 1) and critic C-F3-T (Claude Opus 5.5, F-2), consolidated by the r31 Cycle 4 F adjudicator (E-4) and the r31 Cycle 4 synthesis. The duplication finding, the rank-free and layer-free scope, the image count, the corrected load point and own literal checks: isolated second read R31-SR-C4-3 (Claude Opus 5.5).
```

```text
RECORD: R31-C4-SR-C4-3-LITERAL-CHECKS
CLAIM: [r31 C4; R31-SR-C4-3] Bounded checks of the frozen N4/N5 texts and of the sector-image classification by the second read's own instrument (literal cbEdge graph, literal transportRel, activeWeight from its definition, cb8GSec from the frozen guard and indicator sum, tables parsed from the base Main.lean; exact Fraction arithmetic; no seat or critic code), 0 failures: exhaustive at CB(8,0) and CB(8,1) (p* = 1, 6; every independent set: in_eq on 1,120 in-sector targets, zero classes (i) 47,740 arcs, (ii) 51,100 arcs and 7,168 columns, (iii) on every sector source, N5 census and inflow on 70 targets and clause (ii) on 126, backward preimages equal to forward images on 33,315 targets, the classification on every sector source of every size); sampled at m = 2 and 5 and at the class rows m = 107, 110, 113, 158, 161, 164 (88 in_eq targets including the load-1 profile, 48 in_le_one targets, 140 N5 targets covering γ = 0..8, 60 no-preimage targets, 10 class-row sector sources with 7,740 classified images); the exact maximum of Σ_i cb8In over every state assignment with leg total K − 1 equals 1 at all six class rows; zero-class non-vacuity instances at five class rows; mutation controls at m = 107 (In factor 7 − β − γ, guard without independence and a changed cb8CGamma 0 caught; dropping 1 <= γ with cb8CGamma 0 = 0 changes nothing, which exhibits the double determination of the (1, 0) and γ = 0 zeros). These checks test the statements; they never prove them.
STATUS: bounded_computation
PROVENANCE: Isolated second read R31-SR-C4-3 (Claude Opus 5.5); scripts and outputs under scratchpad/c4-sr-R31-SR-C4-3/ (sr3_core.py, sr3_small.py/.out, sr3_rows.py/.out, sr3_nonvac.py/.out), digests in second-reads/R31-SR-C4-3/SECOND-READ.md ## Artifact inventory.
```

## Verdicts

verdict[R31-SR-C4-3a]: confirmed
verdict[R31-SR-C4-3b]: confirmed
verdict[R31-SR-C4-3c]: confirmed_with_repairs
verdict[R31-SR-C4-3d]: confirmed_with_repairs

**Rationale.**
- **a:** the frozen `in_eq` and `in_le_one` hold as stated. The attribution to C-T3-U is correct, and the compiled `in_le_one` does not
  depend on N3.
- **b:** every zero class is correct, and none is vacuous at any class row.
- **c:** the N5 texts are correct as frozen. The repair is to the `γ = 0` gloss (F-2): the zero column comes from the `1 ≤ γ` guard,
  the junk value is load-bearing only for the frozen equality, and `σ(8)` is load-bearing nowhere.
- **d:** the mathematics is complete and exact. The repairs:
  - it is already of record, so there is no new fact-record, and the origin is r31 Cycle 2 (F-1);
  - the load point is narrowed (F-3);
  - the scope and the class (v) wording are corrected (F-4).

## Artifact inventory

- **Deliverable:** `second-reads/R31-SR-C4-3/SECOND-READ.md` (this file; I created the directory `second-reads/R31-SR-C4-3/` for it).
- **Scratch** (`scratchpad/c4-sr-R31-SR-C4-3/`; SHA-256):

  | File | SHA-256 |
  |---|---|
  | `seal_check.py` / `.out` | `fd9346c13b5e45579f62f1d92c5f268499ebce8617cfb097f90be0636cb8c6f5` / `3c9c10126a723a1feebbd271cd7dc18d672d9bf754dbb1621415991efe654dae` |
  | `source_digest_check.py` / `.out` | `634fe3a69fb2770e7dfb657779c0daefe404fb6e96fd6b56dae7746896fea1e3` / `ce89dc30f2f73d047d6ee6c534fb66d5d1d742e3ef297b64e443f6fe8326d875` |
  | `splice_audit.py` / `.out` | `33b1646903ddcf66e9116ca7541f638ff47f017d52330e4a8d80799f381dd3d4` / `407a593bce224370ec53474f98431bf86a2446e8e762e595a29e08b6e49bdda1` |
  | `splice_diff_audit.py` / `.out` | `dd51ddf03d05e1b9f3fa37a6c94a0d2d9835860669493b91fbe82605465fa650` / `3c18699018e18b7539f99bb0f314c2789c416d9f86a6c6c71ed9c3c9de161203` |
  | `sr3_core.py` | `80e079c20488e9507141631b18a7b543a38a5cded0aa3fe006f2f1cd55fec882` |
  | `sr3_small.py` / `.out` | `9aad91299739fcd873552123b889881782f516c2d595ced08a03db6875fce99c` / `054b111baf54f089e8ce9894a243af62efd7dd7313fac829f3f5d884b412faff` |
  | `sr3_rows.py` / `.out` | `3e427aa149befe929f681099fb27a937cd3b2a54cd0b1cdfb577f862b1fc6bdf` / `0c870d35d7d5e7983a5a869527baa3f2921e606e2932fe71548414c96bfe3a17` |
  | `sr3_nonvac.py` / `.out` | `3b84dde9e2c251164fc8bc90c8070db38dd4caff7bde3dc15b7a07cd26c8e05a` / `83b5410156e73d09e02b452a24e7504a38a6f2701b31c1fd9f3cda1d020663d2` |

- **Replay:**
  - `cd <run root>/scratchpad/c4-sr-R31-SR-C4-3 && python3 -B sr3_small.py && python3 -B sr3_rows.py && python3 -B sr3_nonvac.py`
    (about 2 s, 33 s and 11 s respectively; deterministic seeds);
  - the audits: `python3 -B seal_check.py`, `source_digest_check.py`, `splice_audit.py`, `splice_diff_audit.py`.
- **Imports:** `fractions`, `re`, `random`, `itertools`, `collections`, `difflib`, `hashlib`, `json`, `os`, `sys`, `math`. All are
  standard library. No installs and no network.
- **Background jobs:** none. Every command ran in the foreground, so there is nothing to kill. There was no Lean or `lake` invocation
  and no process listing.
- **Writes:** this file and the scratch files above. Nothing else was written, and no sealed member was edited.
