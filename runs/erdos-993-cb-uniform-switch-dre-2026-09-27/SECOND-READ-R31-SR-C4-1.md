# Second Read

Read `R31-SR-C4-1`, r31 Cycle 4. N1 covers the up-cover counts on `cbGraph m`: `cbOpenChokeCount_le` and B1, B2 and B3. The
reader is isolated, per `control/C4-SECOND-READ-PROTOCOL.md` (binding). Written 2026-09-29; clock read 01:17 EDT before drafting.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS under the restricted boot. I read exactly two VerityOS files,
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I then read my brief,
`control/C4-SECOND-READ-BRIEF-R31-SR-C4-1.md`, after checking its digest. I loaded no other subsystem: no memory, knowledge,
conversations, operations, modules, skills, logs or decisions. I wrote no conversation log, because the protocol allows exactly
one deliverable.

**Read-boundary disclosures.**
1. *Harness context.* Before my first tool call, the host placed the project `CLAUDE.md`, the user auto-memory index and the
   user's e-mail address into my context. I did not open any of them with a tool, and no ruling below rests on them.
2. *Capsule reads.* Every file I read is a member of the capsule manifest, apart from the two boot files. Members under
   `sources/c4-stage7-sources/` were checked against that directory's `SOURCE-DIGESTS.json` before I read them (85/85 match). Some
   members I read in part:
   - the Stage 6 synthesis: its reconciliation, `## Lean awards` and `## Registrations`;
   - the T adjudication: its N1 lines, located by `grep`;
   - C-U1-F's critique: its B3 passages and its A6/A7 sections;
   - base `Main.lean`: the definition blocks of `leafSet`, `support`, `IsGraphLeaf`, `indepFamily`, `tagWitnesses`,
     `activeWeight`, `favorableLeaves`, `cbEdge`, `cbGraph`, `cbGraph_decAdj` and `cbVertex`;
   - `E1FlowConstruction.lean`: lines 1–60;
   - the three registries: parsed by script, for the alias check and a status-token census.

   I read in full the frozen N1 texts, both N1 critiques (C-T1-F and C-T1-U), and all four N1 proof bodies with their helpers in
   `c4-crit-T1-F/…/Statements.lean` and `c4-crit-T1-U/…/Statements.lean`. I also read C-U1-F's B3 proof, with its helper and
   audit, in `CritU1F.lean` and `CritU1FAudit.lean`. I read the seat bodies of `cbOpenChokeCount_le` in T1's and U1's files. I
   grepped the critic build and axiom logs for their error, `sorry`, axiom and `TYPE==` lines.
3. *One listing outside the capsule.* Before writing, I made one one-level `ls` of the run's `second-reads/` directory, to confirm
   that my output directory did not exist. It printed only directory names (`SR-1` … `SR-C2-4`). I opened nothing there.
4. *A harness write.* One registry parse printed more than the harness keeps inline. The host saved that output to its own
   session `tool-results/` directory, outside the run root. I did not create that file with a tool, and I used nothing from it
   beyond what was printed inline.
5. *Not used.* I read no other return, critique, adjudication, second read or scratch. I made no network access and no installs,
   started no background jobs, made no process listings, and ran no `lake`/`lean`. I made no Mathlib grep, because none was
   needed. All my scratch is under `scratchpad/c4-sr-R31-SR-C4-1/`, and I ran Python only with `python3 -B`.

## Identity and seal audit

| Object | Recorded | Recomputed here | Result |
|---|---|---|---|
| Brief `C4-SECOND-READ-BRIEF-R31-SR-C4-1.md` | `e92aa3f0d0291c9417a0a4f95536e3facac0d0fc08f0000aa8e7b63e13259d32` | `shasum -a 256` (checked before reading) | **MATCH** |
| Capsule `R31-SR-C4-1-PACKET-MANIFEST.json`, inner seal | `f45ed7300bcec99cd1ec57980e3f81210d6ce81675575e33122d1a4b9772bd92` | SHA-256 of compact key-sorted JSON without `seal_sha256`, `(",",":")`, no trailing newline (`seal_check.py`) | **MATCH** |
| 120 capsule members (SHA-256 and bytes) | manifest (`file_count` 120) | recomputed | **120/120 MATCH** |
| 85 members under `sources/c4-stage7-sources/` | `sources/c4-stage7-sources/SOURCE-DIGESTS.json` (772 entries) | recomputed (`srcdig_check.py`) | **85/85 MATCH**, 0 unlisted |
| Protocol `C4-SECOND-READ-PROTOCOL.md` | `eb175f41…7026277` (manifest) | recomputed | MATCH |
| Frozen `control/C4-FROZEN-STATEMENTS.lean` = base `Statements.lean` | `0fc723d7…ede1` | recomputed | MATCH (byte-identical files) |
| Statement of record `…/stage6/SYNTHESIS.md` | `84c2805b…26cb` | recomputed | MATCH |
| C-T1-F N1 file `c4-crit-T1-F/…/Statements.lean` | `ddfbc61d…8a98` | recomputed | MATCH |
| C-T1-U N1 file `c4-crit-T1-U/…/Statements.lean` | `46cbca47…71e5ca` | recomputed | MATCH |
| C-U1-F `CritU1F.lean` | `459e9f67…e0e0cdf13` | recomputed | MATCH |

- **Frozen headers (my own byte check, `hdr_check.py`).** For each of the four N1 declarations I took the frozen block (the
  `open Classical in` line where present, then the docstring, through `:= by`). It occurs **exactly once, byte-identical**, in each
  of these six files: the frozen file, the base, T1, C-T1-F, C-T1-U, and U1's seat copy in C-U1-F's capsule. The block digests
  (first 16 hex) are:
  - `cbOpenChokeCount_le`: `c6bed7ad67909897`;
  - B1: `3b184dafb707da8d`;
  - B2: `38f732f5a88213b3`;
  - B3: `e42c5fc53f67e858`.
- **Elaboration context (`diff_check.py`, a line diff against the frozen file).** C-T1-F and C-T1-U each remove exactly four lines,
  every one of them `  sorry`, and only add lines. Among the added lines there is no `open`, `variable`, `set_option`, `attribute`,
  `instance`, `namespace`, `section`, `import`, `notation`, `native_decide` or `admit`. The only pattern hit is a docstring
  containing "sorry-free". So the frozen headers elaborate in an unchanged context.
- **C-U1-F's B3.** It is `crit_cb8_nonChokeInsert_weight`, a separately named declaration in `CritU1F.lean`. Its audit log records
  `TYPE== E993Transport.cb8_nonChokeInsert_weight : true`, axioms `[propext, Classical.choice, Quot.sound]` and `SORRY-LEAVES []`.
  I read these as record, not evidence. It still has to be transplanted into the frozen body (C-U1-F's own remaining obligation 2).
- **Build records, read as record only.** Both critic N1 builds log "Build completed successfully (8661 jobs)" with no `error`
  line. There are 16 `sorry` warnings each, all at N2-onward declarations: C-T1-F from line 777 on, C-T1-U from line 840 on. None
  falls in N1's range. The axiom logs list `[propext, Classical.choice, Quot.sound]` for all four N1 declarations in both files,
  and C-T1-F's `sorryAx` control on N2 is live. Per protocol duty 4, none of this is cited as evidence below; the kernel
  certificate belongs to Stage 7.
- **Registry.** I parsed the run-local snapshot (497 claims, 6 `E993-R31-` keys), the frozen master (491 claims) and the concurrent
  master (510 claims). No key names any N1 declaration or its content, and no alias pattern or alias string matches my four claim
  texts (`alias_check.py`: 0 hits in all three). I propose **no key**: the synthesis rules that N-nodes are frozen statements
  internal to conjunct 4, not keys. The registration rows are records. There is one distinction row against the r30 mark-clone key.

## Statements read

Class of record: `T = CB(8,m)`, labels `0 = r`, `1 = s`, `2 = v`, `u_i = 3+17i`, `b_ij = u_i+1+2j` and `c_ij = u_i+2+2j`. Every N1
statement is rank-free and class-free. `cbOpenChokeCount_le` holds for every `m`; B1–B3 are stated for `0 < m`.

- **R31-SR-C4-1a — `cbOpenChokeCount_le (m) (X) : cbOpenChokeCount m X ≤ m`.** The proof of record is seat T1's body: `unfold`,
  then `card_filter_le`, then `card_range`. U1's body is the same three steps, which is the only natural proof.
- **R31-SR-C4-1b — B1 `cb8_rFree_deletionClasses`.** Take `0 < m` and an independent `B` with `r ∉ B`. The statement has five
  conjuncts:
  1. `#(B ∩ chokes) = q`;
  2. `#{z ∈ B : ¬choke ∧ z ∈ leafSet ∧ (B.erase z) meets W_z} = w`, where `w = activeWeight … leafSet B`;
  3. `q + w + ℓ = |B|`, with `ℓ := #{z ∈ B : ¬choke ∧ ¬active}`;
  4. `w ≤ 8q`;
  5. `ℓ + 8q ≤ 8m + 1`.
- **R31-SR-C4-1c — B2 `cb8_rFree_insertionClasses`.** Take `0 < m` and an independent `A` with `r ∉ A`. Call `z` admissible if
  `z ∉ A`, `z ≠ r` and `insert z A` is independent. The statement has three conjuncts:
  1. every admissible `insert z A` lies in `indepFamily (|A|+1)`;
  2. `#{admissible z : ¬choke ∧ active in insert z A} + w(A) = 8q(A)`;
  3. `#{admissible z : ¬choke ∧ ¬active in insert z A} + 2ℓ(A) + 16q(A) = 16m + 2`.
- **R31-SR-C4-1d — B3 `cb8_nonChokeInsert_weight`.** The hypotheses are `0 < m`, an arbitrary `A` (neither independence nor
  `r ∉ A` is assumed), and `z ∉ A` with `z ≠ r` and `z` not a choke. The conclusion has two parts:
  - `q(insert z A) = q(A)`;
  - `w(insert z A) = w(A) + [z ∈ leafSet ∧ (insert z A).erase z meets W_z]`.

## Independent re-derivation

**Definitions, read from the carried text.**
- `cbGraph m = fromRel (cbEdge m)`. Its edges are `r–s`, `s–v`, `r–u_i`, `u_i–b_ij` and `b_ij–c_ij`, so the degrees are:
  - `r`: `1+m`;
  - `s`: 2;
  - `v`: 1;
  - `u_i`: 9;
  - `b_ij`: 2;
  - `c_ij`: 1.
- Hence, for `m ≥ 1`, `leafSet = {v} ∪ {c_ij}`. The support of `v` is `s`, so `W_v = N(s)∖{v} = {r}`. The support of `c_ij` is
  `b_ij`, so `W_{c_ij} = N(b_ij)∖{c_ij} = {u_i}`.
- For non-leaves, `C5LA1.support` is an arbitrary `Classical.choose` value. That is harmless: every activity test in N1 is
  conjoined with `z ∈ leafSet`, and `activeWeight` is taken with `F = leafSet`.
- The choke map `i ↦ cbVertex m (3+17i)` is injective on `range m`, because `3+17i < 17m+3`.

**1a.** `cbOpenChokeCount m X` is the card of a filter of `range m`, so it is at most `m`. It needs no hypothesis.

**1b (B1).** Let `B` be independent with `r ∉ B`.
- *Activity.* `v` is never active, since its only witness `r` is absent. `c_ij` is active iff `u_i ∈ B`, because `u_i ≠ c_ij`.
  So the active set is `{c_ij ∈ B : u_i ∈ B}`.
- *Conjunct 1:* the image of the injective choke map.
- *Conjunct 2:* the two filters agree because a leaf is never a choke.
- *Conjunct 3:* the three filters are "choke", "non-choke and active" and "non-choke and not active", which partition `B`.
- *Conjunct 4:* sending `c_ij ↦ (i, j)` injects the active set into (open chokes) × `range 8`.
- *Conjunct 5.* A residual (non-choke, inactive) member of `B` is one of three kinds:
  - `s` or `v`. At most one of these is present, because `s ~ v`.
  - `b_ij` with `u_i ∉ B`. The choke is absent because `u_i ~ b_ij`.
  - `c_ij` with `u_i ∉ B`. The choke is absent, or `c_ij` would be active.

  A leg `(i, j)` holds at most one of `b_ij`, `c_ij`, since `b_ij ~ c_ij`. So `ℓ ≤ 1 + 8(m − q)`, and the `m − q` is obtained
  additively. Equivalently, the residuals and the open-choke legs occupy disjoint slots of `range(8m+1)`.
- *The docstring glosses.* These are not part of the statement: `α = w − 1` Boolean, `j − α` ternary, `a = 8q − 1`,
  `b = 8(m−q)+1`. Put `j := |B| − 1 − q`. Then `ℓ = |B| − q − w = j − α`; `α ≤ a` iff `w ≤ 8q`; and `ℓ ≤ b` is conjunct 5. The
  frozen conjuncts themselves are subtraction-free.

**1c (B2).** Let `A` be independent with `r ∉ A`, and let `z` be admissible.
- *Conjunct 1:* `z ∉ A` gives `|insert z A| = |A|+1`, and admissibility gives independence.
- *Boolean insertions.* These are admissible `z` that are active in `insert z A`, whose erase is `A`. The only candidate is
  `z = c_ij` with `u_i ∈ A`; `v` fails because `r ∉ A`. Conversely, every `c_ij ∉ A` with `u_i ∈ A` is admissible: its only
  neighbour `b_ij` is absent because `u_i ~ b_ij`. The Boolean insertions and the active set of `A` therefore biject together onto
  `{(i, j) : u_i ∈ A}`, which gives `Bool + w = 8q`.
- *Ternary insertions.* The 16m+2 non-root, non-choke vertices split as follows:
  - the 16q vertices on the legs of open chokes. None of them is a ternary insertion: `b_ij` is adjacent to `u_i ∈ A`, and `c_ij`
    would be active;
  - the free zone `U`: the arm `{s, v}` and the legs of closed chokes, `|U| = 2 + 16(m−q)`.

  Inside `U`, let `φ` be the involution `s ↔ v`, `b_ij ↔ c_ij`. Every `z ∈ U` has neighbours only among `r` (absent), `φ(z)`, and
  (when `z = b_ij`) the absent `u_i`. So:
  - `z ∈ U ∖ A` is admissible iff `φ(z) ∉ A`;
  - such a `z` is never active;
  - the residual set `E = ℓ(A)` lies in `U`, and `φ(E)` is disjoint from `A`.

  Hence `U = Tern ⊔ E ⊔ φ(E)` and `|φ(E)| = |E|`, so `Tern + 2ℓ + 16q = 16m + 2`. The same count, per slot: a slot empty in `A`
  gives 2 insertions, and an occupied slot gives 0.

**1d (B3).**
- *Chokes.* `z` is not a choke, so the choke filter is unchanged (the base lemma `cbOpenChokeCount_insert_of_not_choke`).
- *Weight.* Every witness set of a leaf is `{r}` or `{u_i}`, and this needs `m ≥ 1` for the leaf classification. A non-root,
  non-choke `z` therefore witnesses no leaf. So for `x ∈ A`, `x ≠ z`, activity in `insert z A` equals activity in `A`, because
  `(insert z A).erase x = insert z (A.erase x)` and `z ∉ W_x`. The new element contributes exactly its own indicator.
- *Domain.* Neither independence nor `r`-freeness enters, so the statement holds on its full frozen domain.
- *The `m = 0` boundary.* Now `n = 3`, `r`'s only neighbour is `s`, and `leafSet = {r, v}` (my instrument derives this: `[0, 2]`),
  with `W_r = {v}` and `W_v = {r}`. Take `A = {r}`, `z = v`. Then `w(A) = 0` and `w({r, v}) = 2`, since both `r` and `v` are
  active, but the indicator is 1. So `2 ≠ 0 + 1`. **`0 < m` is load-bearing for B3**, exactly as the brief states.

**My instrument** (`sr_n1.py`, standard library, exact integers, bitmask sets; independent of every seat and critic script).
- *Transcription.* The edges are transcribed from `cbEdge`. For `n ≤ 40` they are brute-force cross-checked against the literal
  `fromRel` predicate (`u ≠ v ∧ (cbEdge u v ∨ cbEdge v u)`) on every ordered pair.
- *Derived objects.* `leafSet` is the degree-1 vertices, support is the unique neighbour, and `W` is taken literally from
  entry 15. `activeWeight` and `cbOpenChokeCount` are taken literally.
- *Conjuncts.* Every frozen conjunct is evaluated clause by clause. That includes B2's conjunct (i): the card of `insert z A` and
  independence re-tested from scratch.
- *Runtime.* 33.7 s. Payload SHA-256: `faea4298eb028db34e8072ec1123d78f940562bd3d9eaf316d10dd361493c513`.

| Check | Scope | Result |
|---|---|---|
| `m = 0`, exhaustive | 3 `r`-free independent sets (B1, B2); all 8 subsets × admissible `z` (B3) | B1 0 fail, B2 0 fail; **B3 fails exactly at `A = {r}, z = v` and `A = {r, s}, z = v`** (both `w(A) = 0`, `w(insert) = 2`, indicator 1) |
| `m = 1`, exhaustive | all `2^20` subsets: 33,573 independent, **20,451** `r`-free independent (B1, B2); B3 on **all 9,437,184** frozen-domain pairs `(A, z)` | 0 / 0 / 0 failures; 28 distinct `(q, w, ℓ, #Bool, #Ter)` profiles |
| `m = 2, 3, 5` sampled | 400 / 300 / 200 graph-generic random `r`-free independent sets (choke-inclusion probability varied 0–1; sizes 0 up to 18 / 28 / 44); B3 on each set and on an arbitrary perturbed superset (not independent, possibly with `r`) | 0 failures; 78 / 132 / 109 profiles |
| Class rows 107, 110, 158, 161, 164, sampled | 30 / 20 / 20 / 20 / 20 sets, one third each at size `p*`, at `p*+1`, and uniform in `[0, α]`; B3 as above | 0 failures |
| Class rows at the N2 layers (`sr_n1_pstar.py`) | 8 sets of size exactly `p*` and 8 of size exactly `p*+1` per row (`p*` = 572, 588, 844, 860, 876); `q` spread 0/1 up to 150; 10 B3 insertions each | 0 failures; output SHA-256 `f8f2d4547c43991d292e0463a9fe3a828ddc66ac25a8d820fe9656649620c8d6` |
| Mutation controls (`m = 1`) | `w ≤ 8q − 1`; B2 total `16m+1`; B3 without the indicator (every 7th `A`); witness-ABSENT activity | caught 19,686 / 20,451 / 337,039 / 19,171 times |

The `m = 1` counts 33,573 and 20,451 agree with SEMANTIC-CONTRACT §2's closed form, as quoted in both critiques
(`3·6817 + 2·6561`). The critiques' counts are the critics' instruments; my figures come from my own enumeration. The
numbers are test evidence, not proof (fence 7). The universal content rests on the informal proofs above and on the critics'
proof texts, read below.

**The critics' proofs, read as mathematics, case by case.**

| Conjunct | C-T1-F | C-T1-U | Agreement |
|---|---|---|---|
| 1a | T1's body (verbatim) | T1's body (verbatim) | identical |
| B1 (1) | image of the injective choke map (`card_image_of_injOn`) | the same, via `crit_chokeFilter_card` | same argument |
| B1 (2) | `critLeaf_not_choke` + filter extensionality | `crit_leaf_not_choke` + filter extensionality | same |
| B1 (3) | two `card_filter_add_card_filter_not` + `omega` | `crit_card_filter_three` (the same two splits) | same |
| B1 (4) | injection `z ↦ ((z−3)/17, ((z−3)%17−2)/2)` into open × `range 8`, via `critActive_iff` | the same decode map, via `crit_active_leaf_cases` | same map |
| B1 (5) | split `val ≤ 2` (≤ 1 element: `s ~ v`) + injection of the rest into closed × `range 8` (`critEllClass`), then `|closed| = m − q` additively | residual slots `g` and open-leg slots `h` into `range(8m+1)`, disjoint, both injective (`s ~ v`, `b ~ c`) | same count, different packaging |
| B2 (i) | card of `insert` + independence | the same | same |
| B2 (ii) | Boolean = open pairs with `c ∉ A`, Active = open pairs with `c ∈ A`, summed | `Boo ∪ Act` = image of open × 8, disjoint | same bijection |
| B2 (iii) | free zone `U = Tern ⊔ E ⊔ φE`, `|U| + 16q = 16m+2` | `NR = OL ⊔ Te ⊔ S ⊔ PS`, `|NR| = 16m+2`, `|OL| = 16q` | equivalent: `NR = OL ⊔ U` |
| B3 | T1's helpers `cb_tagWitnesses_subset_root_or_choke` and `cb8_activeWitness_unaffected_by_insert`; case split on `z ∈ leafSet` and on activity | the same two T1 helpers; `if_pos`/`if_neg` | same assembly |
| B3 (C-U1-F) | — | — | own helper `crit_cb_tagWitness_root_or_choke` (witness is `r` or a choke); inline `erase_insert_of_ne` + `disjoint_insert_left`; `split_ifs` | independent of T1's helpers, same mathematics |

Every case in every proof matches my derivation, and no case is missing. The two B1/B2 proofs are independent texts: C-T1-F
records that it did not read U1's work, and C-T1-U records that it did not open `critics/T1/F/`. They agree on every count and
differ only in packaging, in the slot map versus the partner involution. This is the agreement the brief asks me to check.

**Hypotheses, and where they enter.**
- `hm : 0 < m` enters every critic proof through the base lemma `mem_leafSet_cbGraph_iff`, which is the leaf classification.
- `hB`/`hA` (independence) enter at:
  - `s ~ v` and `b_ij ~ c_ij`, for the injectivity in B1 (5) and the disjointness of `E` and `φ(E)`;
  - `u_i ~ b_ij`, for the residual classification and Boolean admissibility.
- `hr` enters at two points: `v` is never active, and `r` is not in the residual or free set.
- B3 uses neither independence nor `hr`.

**ℕ-subtraction.**
- The four frozen N1 texts contain no subtraction.
- In the proofs, subtraction occurs only in these places:
  - the label decoders `(z.val − 3)/17` and `((z.val − 3)%17 − 1 or 2)/2`, applied only to vertices with `z.val ≥ 3`, with every
    use closed by `omega` against explicit value equations;
  - the partner maps `critPartnerVal`/`critPv`, whose `n − 1` branch is reached only on `c_ij` labels (`n ≥ 5`). Both are total
    definitions and truncate at `n = 0`, but they are applied only to free or closed-slot vertices, which have label ≥ 1 by
    hypothesis.
- `m − q` never appears as a truncated count. It enters through `card_filter_add_card_filter_not` over `range m`.
- No Newton or Darroch step, residue class, endpoint or `M_0` enters N1. N1 is class-free and rank-free, so there is none to check.

## Findings and repairs

1. **All four frozen N1 statements are true and correctly proved.** I derived each one independently. Both critics' B1/B2 texts
   and all three B3 texts agree with my derivation on every case. No repair to any statement is needed: the frozen texts stand
   byte for byte.
2. **`0 < m` is load-bearing for B3 and only proof-route for B1/B2.**
   - For B3, the counterexample at `m = 0` is `A = {r}`, `z = v`: `w` goes from 0 to 2, but the indicator is 1. My exhaustive
     `m = 0` run finds exactly two failures, that one and the non-independent `A = {r, s}`, `z = v`.
   - B1 and B2 remain **true at `m = 0`** (exhaustive over the three `r`-free independent sets `∅`, `{s}`, `{v}`). There, `hm` is
     a hypothesis of the proof route, entering through the leaf classification, not a truth condition.
   - C-T1-F's phrase "`hm` enters through entry 60, since at `m = 0` the root is a leaf" is accurate about the proof, but it should
     not be read as saying that B1/B2 fail at `m = 0`.

   This is a record note; nothing changes on any face.
3. **B3's domain.** B3 holds on its full frozen domain: arbitrary `A`, `r` allowed, no independence. The seat's bounded check
   covered only independent `r`-free `A` with one sampled `z`, and the critiques narrowed it correctly. My exhaustive `m = 1` run
   covers all 9,437,184 frozen-domain pairs. It agrees with both critiques' figure, but it is my own count.
4. **Attribution precision (B3), for the face.** The Stage 6 line "B1/B2/B3 **C-T1-F / C-T1-U** (B3 also C-U1-F)" should carry the
   seat helpers explicitly:
   - B3 is C-T1-F's and C-T1-U's assembly over seat **T1**'s two compiled helpers (`cb_tagWitnesses_subset_root_or_choke`,
     `cb8_activeWitness_unaffected_by_insert`);
   - independently, it is C-U1-F's full proof over C-U1-F's own helper.

   The reconciliation table and the T adjudication (line 203) already say this. The registration text below carries it.
5. **The docstring glosses.** These are the `α`/`j`/`a`/`b` readings and "`8q − w = a − α`". They are consistent under the
   marked-tag convention `α = w − 1`, `j = |B| − 1 − q`, but they are not statement content. The registrations cite the
   subtraction-free conjuncts only.
6. **Struck or narrowed seat items, adopted.** Both critiques agree on three items, and I adopt them without relitigating:
   - the four literal `q_le_m: True` rows are struck;
   - "two independent sides" is narrowed to B1's `(q, w, ℓ)`;
   - T1's B3 decidable-instance diagnosis is struck, because the frozen B3 carries no `open Classical in` (lines 72–83).

   None of these is cited as evidence here.
7. **Grade.** The informal grade of all four is `proved_informal`. B1, B2 and the B3 assembly are critic-derived and
   critic-attributed; the companion is seat T1's.
   - The compiled scratch has no formal grade (SOLUTION-CONTRACT §4).
   - If C4-LA1 closes, the four become face content of that award, byte-identical, with no certificate of their own.
   - Nothing here moves any key, and nothing crosses fence 1.

## Registration text

```text
RECORD: R31-C4-N1-OPEN-CHOKE-COUNT-AT-MOST-M
CLAIM: [r31 C4; R31-SR-C4-1] For every natural m and every vertex set X of cbGraph m (CB(8,m) on Fin (17m+3)), the open-choke count cbOpenChokeCount m X = #{i < m : u_i = 3+17i ∈ X} is at most m (frozen `cbOpenChokeCount_le`, `control/C4-FROZEN-STATEMENTS.lean` 0fc723d7…). It makes the ℕ subtractions m − q and p* − q in N2 exact. Rank-free, class-free; no key; no status to any aggregate.
STATUS: proved_informal
PROVENANCE: Proof: seat T1 (route C4-T-01), body compiled in T1 scratch 9904581d…; U1 wrote the same three-step body independently. Isolated second read R31-SR-C4-1a confirmed (Claude Opus 5.5). Compiled scratch, no formal grade until the C4-LA1 award closes; on that award's face it carries no certificate of its own.
```

```text
RECORD: R31-C4-N1-B1-R-FREE-INDEPENDENT-SET-DELETION-CLASS-COUNTS
CLAIM: [r31 C4; R31-SR-C4-1] On cbGraph m with m ≥ 1, let B be an independent set with r ∉ B, q its open-choke count, w its active-tag weight for the tag set leafSet (a leaf z ∈ B is active iff B ∖ {z} meets W_z = N(support z) ∖ {z}), and ℓ the number of members that are neither chokes nor active. Then the choke members number q, the non-choke active members number w, q + w + ℓ = |B|, w ≤ 8q and ℓ + 8q ≤ 8m + 1 (frozen `cb8_rFree_deletionClasses`, byte-identical, subtraction-free). Any rank; no class or rank hypothesis. B1 also holds at m = 0; there 0 < m is a proof-route hypothesis only.
STATUS: proved_informal
PROVENANCE: Critic-derived, critic-attributed: C-T1-F (Claude Opus 5.5; injection into open or closed choke × leg, arm split; scratch ddfbc61d…) and C-T1-U (Claude Opus 5.5; slot injection into range(8m+1); scratch 46cbca47…), independently. Carried definitions: C1-LA2 entries 23–26, 60, 69, 70 and r30 entries 6, 15, 16, with `cbOpenChokeCount` from the E1 layer. Isolated second read R31-SR-C4-1b confirmed (Claude Opus 5.5; own instrument: m = 1 exhaustive over 20,451 r-free independent sets; m = 2, 3, 5 and class rows 107/110/158/161/164 sampled, including sets of size exactly p* and p*+1; 0 failures). Compiled scratch, no formal grade until the C4-LA1 award closes.
```

```text
RECORD: R31-C4-N1-B2-R-FREE-INDEPENDENT-SET-INSERTION-CLASS-COUNTS
CLAIM: [r31 C4; R31-SR-C4-1] On cbGraph m with m ≥ 1, let A be an independent set with r ∉ A, with q, w and ℓ as in R31-C4-N1-B1-R-FREE-INDEPENDENT-SET-DELETION-CLASS-COUNTS. Call z admissible when z ∉ A, z ≠ r and insert z A is independent. Then every admissible insert z A lies in indepFamily (|A| + 1). The admissible non-choke z that are active in insert z A (the Boolean class) satisfy #Boolean + w = 8q. The admissible non-choke z that are not active (the ternary class) satisfy #ternary + 2ℓ + 16q = 16m + 2 (frozen `cb8_rFree_insertionClasses`, byte-identical, subtraction-free). Choke insertions are the remaining class. Any rank; no class or rank hypothesis.
STATUS: proved_informal
PROVENANCE: Critic-derived, critic-attributed: C-T1-F (Claude Opus 5.5; free-zone partition U = Tern ⊔ E ⊔ φ(E) under the partner involution s↔v, b_ij↔c_ij; scratch ddfbc61d…) and C-T1-U (Claude Opus 5.5; four-way partition of the 16m+2 non-root non-choke vertices, open legs ⊔ ternary ⊔ residual ⊔ partners; scratch 46cbca47…), independently. Isolated second read R31-SR-C4-1c confirmed (Claude Opus 5.5; own instrument: m = 1 exhaustive, sampled rows including p* and p*+1 layers at 107/110/158/161/164; 0 failures). Compiled scratch, no formal grade until the C4-LA1 award closes.
```

```text
RECORD: R31-C4-N1-B3-NON-CHOKE-INSERTION-KEEPS-CHOKE-COUNT-AND-ADDS-ONLY-ITS-OWN-ACTIVITY
CLAIM: [r31 C4; R31-SR-C4-1] On cbGraph m with m ≥ 1, take any vertex set A (independence and r ∉ A are not assumed) and any z ∉ A with z ≠ r and z not a choke. Then cbOpenChokeCount m (insert z A) = cbOpenChokeCount m A, and the leafSet active-tag weight of insert z A equals that of A plus 1 exactly when z ∈ leafSet and A meets W_z (frozen `cb8_nonChokeInsert_weight`, byte-identical). The hypothesis m ≥ 1 is necessary: at m = 0, r is a leaf with W_r = {v}, and A = {r}, z = v gives weight 2 on the left and 0 + 1 on the right.
STATUS: proved_informal
PROVENANCE: Helpers: seat T1 (`cb_tagWitnesses_subset_root_or_choke`: every leaf witness is r or a choke; `cb8_activeWitness_unaffected_by_insert`), compiled in T1 scratch 9904581d…. Assembly: critic-derived, critic-attributed to C-T1-F and C-T1-U (Claude Opus 5.5), each over T1's two helpers. An independent full proof by C-U1-F (Claude Opus 5.5) uses its own helper `crit_cb_tagWitness_root_or_choke`, under the critic name `crit_cb8_nonChokeInsert_weight` (CritU1F.lean 459e9f67…; type recorded equal to the frozen declaration's; still to be transplanted). Isolated second read R31-SR-C4-1d confirmed (Claude Opus 5.5; own instrument: m = 1 exhaustive over all 9,437,184 frozen-domain pairs; m = 0 exhaustive, failing exactly at A = {r}, z = v and at the non-independent A = {r, s}, z = v; sampled rows including non-independent sets containing r; 0 failures for m ≥ 1). Compiled scratch, no formal grade until the C4-LA1 award closes.
```

```text
DISTINCTION ROW: R31-C4-N1-VS-R30-MARK-CLONE
KEY: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: The four R31-C4-N1 records are graph-level class counts on CB(8,m), m ≥ 1 (d = 8 only), stated over the carried Lean definitions: r-free deletion classes, r-free insertion classes, and the non-choke insertion invariance. They are inputs to the Lean E1 layer (N2), not the r30 mark-clone criterion or its non-sector deletion flow. They do not re-prove that key, change its grade, scope or attribution, or extend it to any rank or class. That key's proof of record uses the same witness facts (W_{c_ij} = {u_i}, W_v = {r}) informally for every d; the r31 records restate only the d = 8 counts, with their own attribution.
```

No key is proposed, so no `KEY:` registration block and no `SCOPE NOTE ON:` block apply. The alias check of the four claim
texts against the run-local snapshot (497), the frozen master (491) and the concurrent master (510) gives 0 hits.

## Verdicts

verdict[R31-SR-C4-1a]: confirmed
verdict[R31-SR-C4-1b]: confirmed
verdict[R31-SR-C4-1c]: confirmed
verdict[R31-SR-C4-1d]: confirmed

**Consequences.**
- All four frozen N1 statements are the frozen text, byte for byte, and are true.
- Every case of the critics' proofs was read and agrees with my own derivation.
- The informal grade is `proved_informal`, with critic attribution for B1, B2 and the B3 assembly (B3 helpers: T1; independent
  B3: C-U1-F).
- `0 < m` is load-bearing for B3 (the `m = 0` counterexample is confirmed) and a proof-route hypothesis only for B1/B2.
- This read does not gate the C4-LA1 kernel certificate. Nothing here moves any key, and conjunct 4 and every aggregate stay as
  recorded.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/`. There were no
background jobs: every script ran in the foreground with `python3 -B`, and no `__pycache__` was written.

| Artifact | SHA-256 |
|---|---|
| `second-reads/R31-SR-C4-1/SECOND-READ.md` (this file) | reported in the reader's final message (computed by tool after writing) |
| `scratchpad/c4-sr-R31-SR-C4-1/seal_check.py` (capsule seal and 120 members) | `c79929be5ba9710144ae841829e3009eb96ccd8dc5dfcb059d8bef1b5c3b91f6` |
| `scratchpad/c4-sr-R31-SR-C4-1/srcdig_check.py` (85 members vs `SOURCE-DIGESTS.json`) | `3dc9797f9d6d8bfe5f43c108039af894a0b599eaafa721ab2c690e3e64a41a1b` |
| `scratchpad/c4-sr-R31-SR-C4-1/hdr_check.py` (frozen N1 header byte check, six files) | `247a1256194b33c0693094c0f00615f32f9420e4aa4685f46cfec191a5e38eec` |
| `scratchpad/c4-sr-R31-SR-C4-1/diff_check.py` (line diff vs frozen; added-line keyword scan) | `3503d912a3af7a56fb8d72e6631ccdb32c4bae88556e9782ec36ecb5e8a96fea` |
| `scratchpad/c4-sr-R31-SR-C4-1/sr_n1.py` (own instrument) | `adfec68f501a7e1f95334592403676504c5f850fc737554e6623a32a9d1276a0` |
| `scratchpad/c4-sr-R31-SR-C4-1/sr_n1.out` (payload digest `faea4298…c513`) | `50484f5c36478da5c04ef0557b57c815573a902ac7cbdb6faf4e226c27abddf9` |
| `scratchpad/c4-sr-R31-SR-C4-1/sr_n1_pstar.py` (class rows at the `p*`/`p*+1` layers) | `2a6f6c80f6ad5f848fbb97420f56ae8242ba3ef1f1e66cd45e9214d7e45b7a56` |
| `scratchpad/c4-sr-R31-SR-C4-1/sr_n1_pstar.out` | `c67e4c21aca5b363e9a01f4b1087994c2a9bae13c5f9d4252d28dce212e039d0` |
| `scratchpad/c4-sr-R31-SR-C4-1/alias_check.py` (three registries; alias patterns and strings) | `8890edec7ec02c303da07d6b6ce3205716f19fdcdf8b47bda5253b1c85eb1ed8` |

Replay commands, run from the run root:
- `python3 -B scratchpad/c4-sr-R31-SR-C4-1/seal_check.py`
- `python3 -B scratchpad/c4-sr-R31-SR-C4-1/srcdig_check.py`
- `python3 -B scratchpad/c4-sr-R31-SR-C4-1/hdr_check.py`
- `python3 -B scratchpad/c4-sr-R31-SR-C4-1/diff_check.py`
- `python3 -B scratchpad/c4-sr-R31-SR-C4-1/alias_check.py`
- `cd scratchpad/c4-sr-R31-SR-C4-1 && python3 -B sr_n1.py && python3 -B sr_n1_pstar.py`
