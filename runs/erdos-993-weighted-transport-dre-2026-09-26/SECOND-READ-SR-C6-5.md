# Second Read

Read `SR-C6-5`, run `erdos-993-math-dre-20260926-r30-weighted-transport`, Cycle 6 (terminal). This is an isolated second read of K-5, the
CB arm-support-free exactness lemma with s-isolation. The read also rules on the boundary `p = dm` and on the general-`F` form.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The first display of `verity.md` truncated its middle, so I read the
missing span in a second call on the same file. I loaded no other VerityOS subsystem. The host placed the project `CLAUDE.md` and the
user's auto-memory index into context. I acted on neither: I kept no conversation log and wrote no memory, because the brief confines
my writes to this file and my scratch directory.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Brief.** `control/C6-SECOND-READ-BRIEF-SR-C6-5.md` has SHA-256
  `9d4823604d3efcd42789befdbf67c9d9b2d7a74ba7796417139933afc63fe2c0`, which equals the chartered value. I checked it before
  following the brief. The protocol `control/C6-SECOND-READ-PROTOCOL.md` hashes to `c2e9d131…837f9`, its capsule value.
- **Capsule seal.** For `control/c6-second-read/SR-C6-5-PACKET-MANIFEST.json` I computed SHA-256 over the compact, key-sorted JSON of
  the manifest without `seal_sha256`, with no trailing newline. The result is
  **`123b57cfbd0824d294395e31d157e776e2c4a322f9839df063bba96412aecc7b`**, which matches the stated seal. The manifest's stage is
  `cycle-6-second-read-SR-C6-5`.
- **Members.** All 350 listed members exist and match their SHA-256 and byte counts, with 0 mismatches
  (`scratchpad/c6-sr-SR-C6-5/seal_check.py`).
- **Frozen reference instruments.** I checked every entry of `sources/c6-stage7-sources/SOURCE-DIGESTS.json` (723 files) against
  its digest before reading any of them. There were 0 mismatches.
- **Registries.**
  - The frozen run-local snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c6-stage2.json` has 460 claims.
  - The frozen 434 master is `sources/authority/CLAIM-IDENTITY.json`.
  - The live 457 master is `sources/heterogeneous-closure/master-2026-09-27/CLAIM-IDENTITY.json`.
  - All three are capsule members, and all three digests match.
- **Standing errata applied.** R30-E-m, -n, -p, -q, -r and -s, and the synthesis's proposed E-1..E-7. None of them touches K-5.
  Following R30-E-q, I treat the controller replays as third instruments only. They bear on K-5 only through CF-0's summary of
  CF-REPLAY-c6c, which records that the U2 laboratories are non-eligible. I did not open the replay files themselves.
- **Read boundary: deviations, all disclosed.**
  1. **Hashing outside the capsule.** The digest check of `sources/c6-stage7-sources/` hashed all 723 files that
     `SOURCE-DIGESTS.json` lists. 417 of them are not capsule members; one example is `sources/c6-stage7-sources/F2/…`. I read
     their bytes only to hash them. I displayed or used no content, and each matched.
  2. **Harness copy of a member.** The host saved the display of one capsule member (C-U2-T's `CRITIQUE.md`) to a harness file under
     `~/.claude/projects/…/tool-results/`, and I read the member through that copy. The content is the member's.
  3. **One glob.** A `glob('sweep_broad_*_RESULT.json')` ran inside the capsule directory `sources/c6-stage7-sources/C-U2-T/own/`.
     It lists names, and every file it matched is a capsule member.
  4. **Nothing else.** I ran no other directory listing, no `find`/`grep` above the capsule members, no network, no install, no
     `lake`/`lean`, and no background job. I killed nothing. I ran `python3 -B` with exact integers throughout.

## Statements read

Sources read in the capsule:

- `SEMANTIC-CONTRACT.md` §1–3 and `SOLUTION-CONTRACT.md` §3–5.
- The synthesis (`cycles/cycle-6/stage6/SYNTHESIS.md`): `## Reconciliation` R-3, `## Exact established results` item 5,
  `## Refuted or narrowed mechanisms`, `## Registrations` (K-5), and the SR-C6-5 row of the second-read batch.
- C-F1-T (`## Independent re-derivation`, `## Attacks and findings` A3: the move enumeration, Lemma 1, Lemma 2, Identity 3).
- C-U2-T (all of it, including A6).
- C-U2-F (`## Independent re-derivation`, `## Attacks and findings` (A)–(E), `## Verdict`).
- The F adjudication (`## Established results`: L1 and ID3; `## Lean readiness` key-name note).
- The U adjudication (`### U2`, `## Cross-route reconciliation`, `## Established results` item 5).
- Controller facts `control/C6-STAGE6-CONTROLLER-FACTS.json`, which contains the Stage 5 F facts unchanged.
- The alias pre-screen `control/C6-CONTROLLER-ALIAS-PRESCREEN.json` (K-5 row).
- `control/CLAIM-DISTINCTIONS.json` (row format).
- The registry entries of the (WID) key, the CBstar key, the d ≤ 6 sector key, the non-sector criterion key and
  `E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD`.
- From the frozen instruments, C-U2-T's `closedform.py` (check loop), `sweep.py`/`summarize.py` (grep for the X2 test) and its
  `sweep_broad_*_RESULT.json` data. I used them for one reconciliation only (see `## Findings and repairs`, R-b2). I did not read
  F1's or U2's returns beyond what the critiques quote, and no conclusion of mine rests on them.

**Notation (frozen definitions).**

- The tree:
  - `T = CB(d,m)` with `d, m ≥ 1`: the path `r–s–v`, chokes `u_i ~ r`, supports `b_ij ~ u_i`, and private leaves `c_ij ~ b_ij`.
  - `leafSet(T) = {v} ∪ P`, where `P = {c_ij}` has `|P| = dm`.
  - `W_v = {r}` and `W_{c_ij} = {u_i}`.
  - A *column* is a pair `{b_ij, c_ij}`; there are `dm` of them.
  - The *choke forest* is `C := T − {r,s,v}`.
- The network: `F` is a tag set of original leaves, `w_F` is literal, and the relation is (D) ∪ (S).
- Classes of an independent `B`, by `B ∩ {r,s,v}`:
  - root-arm `{r,v}` (RV);
  - root-only `{r}` (R);
  - arm-leaf `{v}` (V);
  - arm-support `{s}` (S);
  - arm-free `∅` (EMPTY).
- Weight facts:
  - `r ∈ B` excludes every `u_i`, so every private tag is inactive. A root-arm set has weight `[v ∈ F]`, and a root-only set has
    weight 0.
  - On root-free sets `v` is inactive, so the weight is the number of `c_ij ∈ F ∩ B` with `u_i ∈ B`.
- Aggregate: `S_F(p) := Σ_{t∈F} [q_t(p) − q_t(p−1)]`, the right side of (WID). `S_F(p) = S(T,p)` when `F = F_p(T)`.
- Generating functions: `PC := (1+2y)^d + y(1+y)^d`, `G(y) := y²(1+y)^{d−1}·PC^{m−1}` and `W_C := dm·G`.

**Statements, one verdict each:**

- SR-C6-5a (L1);
- SR-C6-5b (clause (a) and the boundary `p = dm`);
- SR-C6-5c (clause (c) and the three closed forms);
- SR-C6-5d (clause (d) and the isomorphism);
- SR-C6-5e (clause (e));
- SR-C6-5f (the general-`F` form and the key).

## Independent re-derivation

**Own instrument** (`scratchpad/c6-sr-SR-C6-5/sr5_lit.py`; standard library; exact integers; shares no code with any seat). It works
as follows:

- It builds `CB(d,m)` and tests that it is a tree (edge count and connectivity).
- It enumerates every independent set as a bitmask.
- It computes its own forest-DP independence polynomials of `T − D`. The layer sizes are asserted equal to the enumeration, and
  `I(T)` is asserted equal to the closed form `(1+2y)PC^m + y(1+y)(1+2y)^{dm}`.
- It computes `x` through rank `α`, with `α = m(d+1)+1` asserted.
- It derives `F_p` from `Δ_p(T − t) < 0` on the original tree.
- It computes `S_F` from `q_t = i(H_t) − i(R_t)` by DP.
- It computes `w_F` and (D) ∪ (S) literally, and uses its own Dinic max-flow, returning both the minimal and the maximal maximizer.
- It asserts **`supply − capacity = S_F` on every instance**, from the independent literal and DP sides, before anything else is
  recorded.

**Coverage.**

- Every rank `p = 1 … α−1` of `CB(2,1)`, `CB(3,1)`, `CB(4,1)`, `CB(5,1)`, `CB(1,2)`, `CB(2,2)`, `CB(3,2)`, `CB(4,2)`, `CB(1,3)`,
  `CB(2,3)`, `CB(3,3)` and `CB(2,4)`.
- F-modes at each rank:
  - `F` derived: 44 instances, plus 41 ranks where `F_p = ∅`, which are skipped and recorded;
  - `F` = every leaf: 85;
  - 2–4 random arbitrary tag sets per rank: 254, of which 176 have `0 < |F ∩ P| < dm`.
- 383 instances in all. `RESULT_SHA256 97119541…c849426`; summary `SUMMARY_SHA256 c03b1ca2…87449fe`.
- The brief's list `CB(2,1)…CB(4,2)`, `CB(2,3)`, `CB(3,3)` is covered.
- Every one of these rows is non-eligible. The lemma is rank-generic, so the laboratory rows test it directly.
- I also added **two eligible literal rows**, `CB(2,5)/10` (`n = 28`, `α = 16`, `x = 8`, **`p = dm`**) and `CB(1,7)/10` (`n = 24`,
  `α = 15`, `x = 8`, `p = dm + 3`). Each was run in derived, every-leaf and one random mode (`RESULT_SHA256 6cc332e5…`).

**Checks per instance.**

- L1, literally: every positive target containing `s`, and every source joined to it.
- (a): same-class deletion cover of every positive target; `def(X2) = S_F`.
- (c): `N(X1) ∩ {w>0}` equals the positive `s`-free targets exactly, and `def(X1) = S_F − L_F`. `L_F` is computed literally and
  equals `|F∩P|·([y^p]G − [y^{p−1}]G)`. In the homogeneous modes, C-F1-T's `W_C` form, C-U2-F's `Ψ` form, C-U2-T's `dm·g` form and
  C-U2-T's closed `S` and `deficit(X1)` are each evaluated separately. C-F1-T's second (sector) form is evaluated as well.
- (d), in four parts:
  - (i) An explicit isomorphism check `B ↦ B ∖ {s}`. It verifies the bijection of sources and of targets, equal weights, the
    arm-support-to-arm-support arcs equal to `C`'s own literal (D) ∪ (S) arcs, and that the only other arcs go to `B ∖ {s}` or to
    weight-0 root-only targets.
  - (ii) A restricted max-flow with `X1` forced, compared with `def(X1) +` the literal max deficiency of `C`'s own network at rank
    `p−1`.
  - (iii) The `S`-parts of both restricted maximizers, and of every full maximizer containing `V⁺`, are maximizers of `C`'s network.
  - (iv) 20 random `(X ⊇ V⁺ s-free, Y ⊆ S-class)` tests of the decomposition formula.
- (e): structurally, every positive neighbour of every positive arm-free source is an arm-free `A` with `A ∪ {v} ∈ V⁺`. Also, a
  forced-`V⁺` restricted max-flow, whose minimal and maximal maximizers both contain `EMPTY⁺`; and the full maximizers are inspected.

**Results by rank band** (instances passing / tested):

| Check | `p ≤ dm−1` | `p = dm` | `p = dm+1` | `p ≥ dm+2` |
|---|---|---|---|---|
| instances | 194 | 63 | 64 | 62 |
| L1 | 194/194 | 63/63 | 64/64 | 62/62 |
| (a) same-class deletion cover | 194/194 | **63/63** | 1/64 | 0/62 |
| (a) `def(X2) = S_F` | 194/194 | **63/63** | **64/64** | 8/62 |
| (c) cover exact | 194/194 | 63/63 | 64/64 | 8/62 |
| (c) `def(X1) = S_F − L_F` | 194/194 | 63/63 | 64/64 | 8/62 |
| `L_F` literal = `|F∩P|(G_p − G_{p−1})` | 194/194 | 63/63 | 64/64 | 62/62 |
| three forms equal each other and `S_closed` | 104/104 | 37/37 | 36/36 | 30/30 |
| C-F1-T sector form | 93/93 | 29/29 | 34/34 | 28/28 |
| (d) isomorphism | all | all | all | all |
| (d) restricted max = `def(X1) + maxdef_C` | all | all | all | all |
| (d) S-parts of maximizers maximize `C` | all | all | all | all |
| (d) random formula | all | all | all | all |
| (e) structural / forced-`V⁺` / inspection | all | all | all | all |

- **Eligible literal rows.** Every check passes at `CB(2,5)/10`, which is **at `p = dm`**, including the same-class form. The values
  are `S = −136480`, `L = −38120` and `def(X1) = −98360`.
  - At `CB(1,7)/10` (`p = dm+3`) the same-class form fails, but `def(X2) = S` and `def(X1) = S − L` still hold (`−28812`, `−18396`).
    So failure beyond `dm+1` is not universal.
  - Maximum deficiency is 0 at both rows, with `maxdef_C = 0`. These are bounded records, not part of any key.
- **Failures.** The cover and the identity fail at `p ≥ dm+2`, for example:
  - `CB(2,2)/6`: `def(X2) = −45 ≠ S = −68`, and `def(X1) = −25 ≠ S − L = −44`;
  - also `CB(3,2)/8`, `CB(2,3)/8`, `CB(2,3)/9`, `CB(4,2)/10`, `CB(3,3)/11`, `CB(3,3)/12`, `CB(2,4)/10..12`, `CB(1,2)/4` and
    `CB(1,3)/5`.

  They hold at `CB(1,3)/6` and `CB(1,7)/10`. The F adjudicator's ten failing instances are all at `p = dm+2` or `dm+3`, which agrees.

**Proofs, re-derived on my own face.** Hypotheses consumed are the `CB(d,m)` adjacency and, for (a) and (c), (WID)
`E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (`formally_verified`, guard `p ≥ 1`). Nothing else is consumed: no eligibility, no
favorability, no `IsTree`, no invariance and no quotient.

- **Lemma G (the arm-support layer).** For each `c = c_ij` and each `j ≥ 0`, the independent `j`-sets of `C` in which `c` is active
  (`c, u_i` present) number `[y^j]G`.
  - Proof: `u_i` excludes every `b_ik`, and the other `d−1` private leaves of choke `i` are free, giving `(1+y)^{d−1}`. Each other
    choke is a spider with centre absent (`(1+2y)^d`) or present (`y(1+y)^d`).
  - `B ↦ B ∖ {s}` is a weight-preserving bijection from the arm-support sets of `I_{j+1}(T)` onto `I_j(C)`: `s` excludes `r` and `v`,
    `s` has no neighbour in `C`, and `v` is absent.
  - Hence the arm-support class has supply `|F∩P|·[y^p]G` and capacity `|F∩P|·[y^{p−1}]G`. Its excess supply is
    `L_F(p) = |F∩P|·([y^p]G − [y^{p−1}]G)`.
- **L1.** Let `A ∋ s` be joined to `B ∌ s`.
  - (D) gives `A ⊆ B`, which is impossible.
  - (S) at `u ∉ B` gives `A = (B ∖ N(u)) ∪ {u}` with `s ∈ A ∖ B`, so `u = s` and `N(s) = {r, v} ⊆ B`.
  - Then `r ∈ B` excludes every `u_i`, so `A = B ∖ {r,v} ∪ {s}` has no `u_i` and no `v`, and `w_F(A) = 0`.
  - This holds for any `F` and any `p ≥ 1`.
- **(a).** Let `1 ≤ p ≤ dm`, and let `A` be a positive target.
  - If `r ∈ A`, then `v ∈ A`, and `A` has at most `p − 2` column vertices.
  - If `r ∉ A`, then some `u_i ∈ A`, and `A` has at most `p − 1` column vertices.
  - Either way `A` has at most `dm − 1` column vertices, so some column `{b_kl, c_kl}` misses `A`.
  - `c_kl`'s only neighbour is `b_kl ∉ A`, so `B := A ∪ {c_kl}` is independent. It is in the same class, and `A = B ∖ {c_kl}` is a
    (D)-arc.
  - Activity is monotone: `(B ∖ {t}) ∩ W_t ⊇ (A ∖ {t}) ∩ W_t`. So `w_F(B) ≥ w_F(A) > 0`.
  - Hence `N(X2) ⊇` every positive target, and `def(X2) = supply − capacity = S_F(p)` by (WID).
  - At `p = 1` every target has weight 0, so the cover statement is vacuous and `def(X2) = supply = S_F(1)`.
- **(c).** Let `1 ≤ p ≤ dm` and `X1 := {B : w_F(B) > 0, s ∉ B}`.
  - By L1, no positive `s`-target is in `N(X1)`.
  - Every positive `s`-free target is in `N(X1)`:
    - **root-arm:** by (a)'s construction.
    - **arm-leaf:** by (a)'s construction. Equivalently, `A ∖ {v}` is an independent `(p−1)`-set of `C` with `p − 1 < dm`. Every
      maximal independent set of `C` meets every column, since an empty column admits its `c`, and so has at least `dm` vertices.
      Hence some `x ∈ C` is addable; `x ≁ v`, and the class is kept. The step is correct as the F adjudicator states it.
    - **arm-free:** `A ∪ {v}` is independent (`N(v) = {s}`), is arm-leaf, and has weight `w_F(A)`, because `v` is inactive without
      `r` and `v ∉ W_c`. This case needs no rank bound.
    - **root-only:** weight 0.
  - Therefore `def(X1) = (supply − arm-support supply) − (capacity − arm-support capacity) = S_F(p) − L_F(p)`, by
    (WID).
- **(c), sector form** (C-F1-T's second equality). Take `P ⊆ F`. Counting class by class:
  - supply `= [v∈F]·C(dm,p−1)2^{p−1} + W_C[p]` (arm-leaf) `+ W_C[p+1]` (arm-free) `+ W_C[p]` (arm-support);
  - capacity likewise at `p−1`.
  - So `def(X1) = [v∈F]·(C(dm,p−1)2^{p−1} − C(dm,p−2)2^{p−2}) + W_C[p+1] − W_C[p−1]`.
  - The bracket is the root-arm class's supply minus capacity. It is the inner expression of the CBstar formula at `t = 1`,
    `k = p − 1`, without its `max(0, ·)`.
- **(d).** Take any `p ≥ 1` and any `F`.
  - The isomorphism:
    - **Vertices:** `C` is `m` disjoint copies of the spider `S(2^d)`, with centre `u_i` and legs `u_i–b_ij–c_ij`.
    - **Tags:** `F ∩ P`. In `C`, `c_ij` is a leaf with support `b_ij` and `W^C_{c_ij} = N_C(b_ij) ∖ {c_ij} = {u_i} = W^T_{c_ij}`. When
      `d = 1`, `u_i` is also a leaf of `C` but is not a tag.
    - **Weight:** `w^C_{F∩P}(B ∖ {s}) = w^T_F(B)`.
    - **Ranks:** arm-support sources `I_{p+1}(T) ↔ I_p(C)`, and arm-support targets `I_p(T) ↔ I_{p−1}(C)`. That is `C`'s network at
      rank `p − 1`.
    - **Arcs:** (D) removing `q ≠ s` corresponds exactly to (D) in `C`. (S) at `u ∈ C` corresponds exactly to (S) in `C`, because
      the only `T`-neighbour of `C` outside `C` is `r`, and `r ∉ B`. No other (S) keeps `s`: `u = v` has degree 1, and `u = r`
      removes `s`.
  - The only other arcs out of an arm-support source are:
    - `B → B ∖ {s}`, landing on an arm-free target;
    - the `r`-switch, which fires when exactly one `u_i ∈ B` and lands on a root-only target of weight 0.

    No arc of `C` is dropped. The "`r`-switch dropped" in the origin wording is exactly these arm-support-to-root-only arcs.
  - **Decomposition.** Take `X` with no member containing `s` and `V⁺ ⊆ X`, and let `Y` be arm-support sources. The positive part of
    `N(Y) ∖ {∋ s}` is contained in `N(V⁺)`, because a positive arm-free `B ∖ {s}` is joined to `(B ∖ {s}) ∪ {v} ∈ V⁺`. And
    `N(X) ∩ {∋ s}` has weight 0 by L1. So
    `def(X ∪ Y) = def(X) + w_F(Y) − w_F(N(Y) ∩ {∋ s}) = def(X) + def_C(φ(Y))`.
  - Hence the arm-support part of **any** maximizer containing `V⁺` is a maximizer of `C`'s network at rank `p−1`; any maximizer
    containing `X1` is a special case.
  - Also, `max_{X ⊇ X1} def(X) = def(X1) + maxdef_C(p−1)`, because adding weight-0 `s`-free sources never raises the deficiency.
- **(e).** Take any `p ≥ 1` and any `F`.
  - Deleting a vertex from an arm-free source gives an arm-free target.
  - (S) at `u_i` or `b_ij` keeps the source arm-free.
  - (S) at `r` needs two chokes (since `s ∉ B`) and lands on a root-only target of weight 0.
  - `s`, needing `r, v ∈ B`, and `v`, of degree 1, never fire.
  - So every positive neighbour of an arm-free source is an arm-free `A` joined to `A ∪ {v} ∈ V⁺`. If `M ⊇ V⁺` is a maximizer and
    `B ∈ EMPTY⁺ ∖ M`, then `def(M ∪ {B}) = def(M) + w_F(B) > def(M)`, a contradiction.

**Closed forms reconciled (SR-C6-5c).** The three forms are the **same polynomial**:

- `Ψ` is `W_C` with the two summands of `PC` written in the other order.
- `dm·y²·g = W_C`, with `g = (1+y)^{d−1}PC^{m−1}`, so `W_C[j] = dm·g_{j−2}`.
- `K_p = 1_c([y^p]Ψ − [y^{p−1}]Ψ) = L`, and C-U2-T's `deficit(X1) = 1_v(A_{p−1} − A_{p−2}) + 1_c·dm(g_{p−1} − g_{p−3})` is
  `S − L` expanded.
- All agree on every homogeneous instance: 207/207 equal to each other and to `S_closed`, and equal to literal `def(X1)` wherever
  `p ≤ dm+1`.
- **ℕ-subtraction hazard.** In the `g`-form the indices must be integer indices, with `g_k := 0` for `k < 0`. Under ℕ-truncation
  `p − 3 = 0` at `p = 2` gives `g_0 = 1` and `L = 0` instead of `dm`. The `W_C`/`Ψ` forms at `[y^p]`, `[y^{p−1}]` with `p ≥ 1` carry
  no hazard, because `G` has the factor `y²`.
- **Derived `F`.** `Aut(CB(d,m))` is transitive on `P` (legs within a choke and chokes permute), so `F_p(T) ∩ P ∈ {∅, P}`. This gives
  the indicator `1_c` of C-U2-T and C-U2-F.

## Findings and repairs

**R-a (L1): confirmed as stated.**

- Any tag set `F` of original leaves and any `p ≥ 1`.
- A stronger form, used by (d): the only arcs from `s`-free sources to `s`-containing targets are the `s`-switches out of root-arm
  sources, and their images have weight 0.

**R-b (clause (a) and the boundary): repaired.**

- R-b1, the boundary. **At `p = dm` clause (a) holds, with the same argument, sharpened.**
  - C-U2-T's proof counts all `p` vertices of `A` as possible column vertices, hence its `p ≤ dm − 1`. Positivity forces `r` or some
    `u_i` into `A`, leaving at most `p − 1` column vertices. So the same-class deletion cover holds for `1 ≤ p ≤ dm`.
  - It is sharp there: at `p = dm + 1` the same-class form fails, on 12 of 12 `(d,m)` of my instrument whenever the extremal target
    is positive. The extremal target is an arm-free `A = {u_i} ∪` one vertex of every column, with the rest of choke `i` all `c`. Its
    only addable vertices are `s` and `v` (plus a `u_j` whose choke is all `c`).
  - The consequence `def(X2) = S_F` survives at `p = dm+1`, through `A ∪ {v}`: 64/64. That is recorded under
    `## Registration text`, not keyed.
- R-b2, a correction. C-U2-T's sentence "the coverage hypothesis `p ≤ dm − 1` is **necessary**: `deficit(X2) ≠ S` at exactly those
  sweep rows with `p ≥ dm`" is **false, and struck**.
  - C-U2-T's own shipped sweep data (`sweep_broad_*_RESULT.json`, 701 rows) have `deficit(X2) = S` and `deficit(X1) = S − L` on all
    78 rows with `p ∈ {dm, dm+1}`. The 81 failures of each identity are at `p − dm ∈ {2,…,6}`.
  - Its validation script `closedform.py check` asserts X2 and X1 only when `p ≤ dm − 1`, so it never tested `p = dm`.
  - My literal instrument agrees: the first failures are at `p = dm+2`.
  - The necessity sentence is not evidence of anything. The adjudications and the synthesis carried the `p ≤ dm − 1` scope from it.
- **Repaired text (a):** "Let `d, m ≥ 1`, `T = CB(d,m)`, `F` any set of original leaves and `1 ≤ p ≤ dm`. Every positive-weight
  target `A ∈ I_p` is the deletion image `A = B ∖ {c}` of the positive-weight source `B = A ∪ {c}` of the same class, where `c` is the
  private leaf of a column disjoint from `A`. Hence the family of all positive-weight sources has deficiency
  `S_F(p) = Σ_{t∈F}[q_t(p) − q_t(p−1)]` by `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, which is `S(T,p)` when `F = F_p(T)`."

**R-c (clause (c)): repaired.**

- Three repairs:
  1. The scope is `1 ≤ p ≤ dm` and any `F`, with `L_F = |F∩P|·([y^p]G − [y^{p−1}]G)`.
  2. The `g`-form carries integer indices with `g_k = 0` for `k < 0`.
  3. The synthesis's "every original leaf favorable" is a special case, not a hypothesis.
- The step "a root-free configuration of size `p − 1 < dm` is not maximal" is correct: every maximal independent set of `C` meets all
  `dm` columns.
- Both of C-F1-T's forms are correct. The sector form needs `[v ∈ F]` on its bracket when `v ∉ F` is allowed.
- **Repaired text (c):** "For `1 ≤ p ≤ dm` and any `F`: `X1 := {B ∈ I_{p+1} : w_F(B) > 0, s ∉ B}` has
  `N(X1) ∩ {w_F > 0} = {A ∈ I_p : w_F(A) > 0, s ∉ A}` and `def(X1) = S_F(p) − L_F(p)`. Here
  `L_F(p) = Σ_{B∈I_{p+1}, s∈B} w_F(B) − Σ_{A∈I_p, s∈A} w_F(A) = |F ∩ P|·([y^p]G − [y^{p−1}]G)` and
  `G = y²(1+y)^{d−1}[(1+2y)^d + y(1+y)^d]^{m−1}`. With `P ⊆ F` this is `def(X1) = S_F + W_C[p−1] − W_C[p]`, where
  `W_C = dm·G = Ψ` and `W_C[j] = dm·g_{j−2}` (integer indices). Equivalently,
  `def(X1) = [v∈F](C(dm,p−1)2^{p−1} − C(dm,p−2)2^{p−2}) + W_C[p+1] − W_C[p−1]`."

**R-d (clause (d)): repaired in wording; the content is confirmed.**

- The brief's "containing `X1` (equivalently `V⁺`)" is not an equivalence. A maximizer containing `V⁺` need not contain the positive
  root-arm sources.
- The correct and stronger statement is "any maximizer containing `V⁺`, in particular any containing `X1`". It is literally
  verified: S-parts of every full maximizer containing `V⁺` maximize `C`'s network on 383/383 instances.
- It holds for every `p ≥ 1` and every `F`. No rank bound is used; the rank bound enters only when `def(X1)` is evaluated by (c).
- The phrase "with the `r`-switch dropped" is made precise: no arc of `C` is dropped. The arm-support sub-network omits only the
  arcs to weight-0 root-only targets and the `s`-deletions to arm-free targets, which `V⁺` already covers.
- **Repaired text (d):** "For every `p ≥ 1` and every `F`, `φ(B) = B ∖ {s}` is a weight-preserving bijection between the
  arm-support sources in `I_{p+1}(T)` and `I_p(C)`, and between the arm-support targets in `I_p(T)` and `I_{p−1}(C)`. Here
  `C = T − {r,s,v}` is `m` disjoint copies of the spider with `d` legs of length 2, tagged by `F ∩ P` with `C`'s own witnesses
  `W^C_{c_ij} = {u_i}`, and arm-support-to-arm-support arcs of (D) ∪ (S) correspond exactly to `C`'s own (D) ∪ (S) arcs. For every
  `X ⊆ I_{p+1}` whose members avoid `s` and contain every positive arm-leaf source, and every set `Y` of arm-support sources,
  `def(X ∪ Y) = def(X) + def_C(φ(Y))`. Hence the arm-support part of every Hall-deficiency maximizer containing all positive
  arm-leaf sources, in particular every one containing `X1`, maps under `φ` to a Hall-deficiency maximizer of `C`'s network at rank
  `p − 1`. Moreover, `max_{X ⊇ X1} def(X) = def(X1) + maxdef_C(p − 1)`."

**R-e (clause (e)): confirmed as stated.**

- Any `p ≥ 1` and any `F`. This is C-U2-F (B).
- Every positive neighbour of a positive arm-free source is an arm-free target `A`, and `A` is joined to `A ∪ {v} ∈ V⁺`.
- Verified structurally on 383/383 instances, and by the forced-`V⁺` restricted max-flow on 383/383 instances.

**R-f (the general-`F` form and the key): repaired.**

- **Hypotheses per clause.**

  | Clause | Hypotheses |
  |---|---|
  | L1 | any `F`, `p ≥ 1` |
  | (a) | any `F`, `1 ≤ p ≤ dm` |
  | (c) | any `F`, `1 ≤ p ≤ dm`, with `L_F` carrying `|F ∩ P|` |
  | (d) | any `F`, `p ≥ 1` |
  | (e) | any `F`, `p ≥ 1` |

  - None of them needs `F = F_p(T)`, and none needs "every leaf favorable".
  - The `W_C` form needs `P ⊆ F`. The derived-`F` form is the `1_c`, `1_v` specialisation.
  - Literal support: 254 random-`F` instances, 176 of them with `P` only partly tagged.
- **The name.** `…-EQUALS-AGGREGATE-PLUS-ARM-SUPPORT-LAYER-WEIGHT-DROP` has two defects.
  - It is sign-ambiguous. It is correct only if "drop" means the arm-support target-layer weight minus the source-layer weight
    (`W_C[p−1] − W_C[p] = −L`). The reading "the weight falls from the source layer to the target layer" gives `S + L`, which is
    false.
  - It carries no rank bound, although the identity fails at `p ≥ dm+2`.

  So a name that is a predicate the statement satisfies should state the sign and the range.
- **Repaired key:**
  `E993-R30-CB-ARM-SUPPORT-FREE-POSITIVE-SOURCE-FAMILY-DEFICIENCY-EQUALS-AGGREGATE-MINUS-ARM-SUPPORT-CLASS-EXCESS-SUPPLY-AT-RANKS-UP-TO-DM`.
  - "Excess supply" is supply minus capacity, signed.
  - Its primary predicate is clause (c). L1, (a), (d) and (e) are companions on the face.
- **Alias check** (`sr5_alias.py`; `ALIAS_SHA256 f1bdf16c…`). Both the synthesis name and the repaired name were checked against the
  460 snapshot, the 434 master and the 457 master. The method is the pre-screen's: exact key, alias equality, every
  `alias_patterns` regex on the name and on its lower-cased spaced form, token overlap of at least 85% with at least 4 shared tokens,
  and the forbidden phrases.
  - **No hit** of any kind in any of the three.
  - Top overlaps are at most 0.57: `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`,
    `E993-BETA-AGG-SUPPORT` and `E993-TRANSFER-TO-FOREST`.
  - The three proposed aliases hit no alias or pattern in any registry.
  - I also ran every registered `alias_patterns` regex over the nine registration-text blocks. The only hits are the (WID) key's
    `active.tag.weight.*identity` and `supply.*capacity.*aggregate`. They fire on the KEY block, because it cites the (WID) key and
    uses the phrase "active-tag weight", and on DR-SR-C6-5-04 itself. The (WID) key is a named input, and DR-SR-C6-5-04 records the
    distinction. There are no hits in the 434 or 457 masters.
  - `E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD` is present in all three registries. The (WID) and CBstar keys are present only in the
    460 snapshot, as run-local keys. The distinction rows follow.
- **Fences checked.**
  - Homogeneous `CB(d,m)` only.
  - Not (HALL) or (HALL-COND) at any row, and not a (CUT).
  - The eligible-row values (`≈ −0.72·|S|`) and CHAR are not graded here and are not in the key.
  - No refuted mechanism is revived. (a) is a covering statement for one family, the whole positive layer. It is not a Hall
    statement for subfamilies, and it is not per-leaf transport.
- **Attribution travels on the face** (below).

## Registration text

```text
KEY: E993-R30-CB-ARM-SUPPORT-FREE-POSITIVE-SOURCE-FAMILY-DEFICIENCY-EQUALS-AGGREGATE-MINUS-ARM-SUPPORT-CLASS-EXCESS-SUPPLY-AT-RANKS-UP-TO-DM
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let d, m >= 1 and T = CB(d,m): the path r - s - v, m chokes u_i adjacent to r, d supports b_ij adjacent to each u_i and one private leaf c_ij adjacent to each b_ij; leafSet(T) = {v} ∪ P with P = {c_ij} (|P| = dm), W_v = {r}, W_{c_ij} = {u_i}; a column is a pair {b_ij, c_ij}; C := T − {r, s, v}. Let F be any set of original leaves of T, p a natural number, w_F the active-tag weight and (D) ∪ (S) the literal relation (SEMANTIC-CONTRACT §1.2), and S_F(p) := Σ_{t∈F} [q_t(p) − q_t(p−1)] (so S_F(p) = S(T,p) when F = F_p(T)). Class an independent set by its intersection with {r, s, v}: root-arm {r, v}, root-only {r}, arm-leaf {v}, arm-support {s}, arm-free ∅. Put G(y) := y^2 (1+y)^{d−1} [(1+2y)^d + y(1+y)^d]^{m−1} and L_F(p) := Σ_{B∈I_{p+1}, s∈B} w_F(B) − Σ_{A∈I_p, s∈A} w_F(A). Then: (L1) for every p >= 1, every target A ∈ I_p with s ∈ A and w_F(A) > 0 is joined only to sources containing s. (a) For 1 <= p <= dm, every positive-weight target A is the deletion image A = B ∖ {c} of the positive-weight source B = A ∪ {c} of the same class, c the private leaf of a column disjoint from A; hence the family of all positive-weight sources has deficiency S_F(p). (c) For 1 <= p <= dm, the family X1 := {B ∈ I_{p+1} : w_F(B) > 0, s ∉ B} satisfies N(X1) ∩ {w_F > 0} = {A ∈ I_p : w_F(A) > 0, s ∉ A} and def(X1) = S_F(p) − L_F(p), with L_F(p) = |F ∩ P|·([y^p]G − [y^{p−1}]G); when P ⊆ F this reads def(X1) = S_F(p) + W_C[p−1] − W_C[p] with W_C := dm·G (the same polynomial as m·d·y^2(1+y)^{d−1}[y(1+y)^d + (1+2y)^d]^{m−1}, and W_C[j] = dm·g_{j−2} with g = (1+y)^{d−1}[(1+2y)^d + y(1+y)^d]^{m−1} and g_k := 0 for integer k < 0), equivalently def(X1) = [v∈F]·(C(dm,p−1)2^{p−1} − C(dm,p−2)2^{p−2}) + W_C[p+1] − W_C[p−1]; for F = F_p(T), F ∩ P ∈ {∅, P} by the transitivity of Aut(T) on P. (d) For every p >= 1, φ(B) := B ∖ {s} is a weight-preserving bijection from the arm-support sources in I_{p+1}(T) onto I_p(C) and from the arm-support targets in I_p(T) onto I_{p−1}(C), where C (m disjoint spiders with centre u_i and d legs u_i − b_ij − c_ij) carries the tags F ∩ P with its own witnesses W^C_{c_ij} = {u_i}; arm-support-to-arm-support arcs of (D) ∪ (S) correspond exactly to C's own (D) ∪ (S) arcs, and every other arc out of an arm-support source ends at B ∖ {s} (arm-free) or at a root-only target of weight 0. Consequently, for every X ⊆ I_{p+1} whose members avoid s and which contains every positive arm-leaf source, and every set Y of arm-support sources, def(X ∪ Y) = def(X) + def_C(φ(Y)), where def_C is the Hall deficiency of C's network at rank p − 1 (sources I_p(C), targets I_{p−1}(C)); the arm-support part of every deficiency maximizer containing all positive arm-leaf sources (in particular every one containing X1) maps under φ to a maximizer of def_C, and max over X ⊇ X1 of def(X) equals def(X1) + max def_C. (e) For every p >= 1, every positive-weight target joined to an arm-free source is an arm-free target A joined to the positive arm-leaf source A ∪ {v}; hence every deficiency maximizer containing all positive arm-leaf sources contains all positive arm-free sources. Proof of record: L1 — (D) cannot create s, and the only (S) creating s is the s-switch, which needs r, v ∈ B, so its image B ∖ {r, v} ∪ {s} has no u_i and no v and weight 0. (a) — a positive target contains r (then v) or some u_i, so it has at most p − 1 <= dm − 1 column vertices and misses some column; the private leaf c of that column has its only neighbour outside A, and activity is monotone under adding vertices; (WID) converts the cover into def = S_F. (c) — L1 excludes the positive arm-support targets; root-arm and arm-leaf targets are covered as in (a) (equivalently, every maximal independent set of C meets all dm columns, so a root-free configuration of size p − 1 < dm has an addable vertex of C); an arm-free target A is covered by A ∪ {v}, which has the same weight because v is inactive without r; L_F by counting, for each tagged c_ij, the independent sets of C containing c_ij and u_i. (d) — the only neighbour of C outside C is r, absent from arm-support sets; the positive arm-free images B ∖ {s} are already joined to V⁺, and N(X) carries no positive arm-support target by L1. (e) — arm-free sources reach only arm-free targets and root-only targets of weight 0; adding a positive arm-free source to a maximizer containing V⁺ raises the deficiency by its weight.
SCOPE: The homogeneous family CB(d,m), d, m >= 1, one rank p at a time; clauses (a) and (c) at 1 <= p <= dm (p = 1 degenerate: every target has weight 0); L1, (d), (e) at every p >= 1; every set F of original leaves (F = F_p(T) is the case of record; the hypothesis "every original leaf favorable" is not needed); the literal network of SEMANTIC-CONTRACT §1.2. Inputs: E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY (formally_verified; guard p >= 1) for (a) and (c); the CB(d,m) adjacency. Consumes no eligibility, favorability, IsTree, invariance or quotient step.
ATTRIBUTION: Codex (GPT-6) lower-region run for CB(d,m), the transport network, the active-tag weight and its corrections; r30 C-F1-T (Claude Opus 5.5) for the move enumeration, Lemma 1 (s-isolation) and Identity 3 with its sector form (its Lemma 2 belongs to the arm-leaf/arm-support shift statement read at SR-C6-6); r30 C-U2-T (Claude Opus 5.5) for the CB mixed-family exactness lemma (clauses a–d, the closed forms in g and the S-class balance L); r30 C-U2-F (Claude Opus 5.5) for (A) arm-support decoupling and the isomorphism with the choke-forest network, (B) the arm-leaf-full-implies-arm-free-full step, and (C) the closed form Ψ with K_p; the r30 Cycle 6 F and U adjudicators for their line-by-line checks and replays; the Cycle 6 synthesis for the concordance of the two orientations; isolated second read SR-C6-5 (Claude Opus 5.5) for the boundary ruling (a) and (c) hold at p = dm, the general-F hypotheses, the integer-index convention and the repaired wording of (d).
FENCES: Homogeneous CB(d,m) only (no heterogeneous pattern, no other tree family). Not (HALL) and not (HALL-COND) at any row, at any rank or for any family other than the ones named; not a (CUT) and not evidence against one: the lemma confines where a deficient family could live and finds none. The deficiency values at eligible rows (about −0.72·|S| at CB(8,95)/508, CB(9,112)/673, CB(8,92)/492 and CB(7,109)/510; the window screens) are bounded records, and CHAR (maximum deficiency = max(0, S, S − L) for m >= 2) is a conjecture refuted at m = 1; neither is part of this key and neither is graded by it. Clauses (a) and (c) are not asserted at p >= dm + 1 (the same-class cover fails at p = dm + 1 and both identities fail at p = dm + 2 on CB(2,2)/6 and other rows; records below). The g-form is read with integer indices (g_k = 0 for k < 0), never with truncated natural subtraction. No status transfer to E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL, E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993. Not E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD, not E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT and not E993-R23-LITERAL-DELETE-ONLY-HALL (distinction rows). No Lean; no formal award.
ALIASES: CB arm-support-free positive family deficiency identity; CB s-free positive source family deficiency identity; CB arm-support class decoupling onto the choke forest
```

```text
DISTINCTION ROW: DR-SR-C6-5-01
KEY: E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD
TEXT: Nearest lexical neighbour in the 434 and 457 masters. The C3 key concerns the r23-era literal Delete/Retag relation of the complete arm-tag cut on CB(j,k) (unweighted tagged sources; zero Retag export; the exact Delete/Retag neighbourhood cardinality C(m,p−2)2^(p−2) for 2 <= p <= m+1, m = jk). The new key concerns the r30 active-tag weighted network with the two-for-one switch relation (D) ∪ (S), the family of all positive-weight sources avoiding the arm support s, and its exact weighted deficiency S_F − L_F, together with s-isolation and the decoupling of the arm-support class onto the choke forest. Different relation, weight, source family and conclusion; the shared tokens CB, ARM, EXACT name unrelated objects. Not an alias; no status transfers either way.
```

```text
DISTINCTION ROW: DR-SR-C6-5-02
KEY: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: CBstar gives the maximum deletion-only deficiency over subfamilies of the root-plus-arm sector {r, v} ⊆ B. The new key evaluates one mixed family (all positive sources avoiding s, of every class) in the full (D) ∪ (S) network, and its sector form contains the root-arm class supply minus capacity C(dm,p−1)2^{p−1} − C(dm,p−2)2^{p−2} (the inner expression of the CBstar formula at t = 1, k = p − 1) only as one additive term, without the max(0, ·) and without any subfamily maximization. Neither statement implies the other; CBstar's statement, grade and fences are unchanged.
```

```text
DISTINCTION ROW: DR-SR-C6-5-03
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key asserts universal unweighted Delete-only Hall on the r23 tagged top side of every eligible ordinary tree. Clause (a) of the new key says only that every positive-weight target of the r30 weighted network on CB(d,m) is a deletion image of some positive-weight source, which is a statement about the neighbourhood of the single family of all positive sources; it asserts no Hall inequality for any subfamily and no deletion-only transport. Not a revival.
```

```text
DISTINCTION ROW: DR-SR-C6-5-04
KEY: E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY
TEXT: Top lexical overlap in the 460 snapshot (shared tokens R30, AGGREGATE, WEIGHT-type vocabulary). (WID) is a graph-generic identity, total supply minus total capacity equals the tagged aggregate, and it is a registered INPUT of the new key (used in clauses a and c). The new key is a CB-specific statement about the neighbourhood and deficiency of one mixed source family and about the arm-support decoupling; it does not restate or strengthen (WID).
```

```text
RECORD: R30-C6-SR5-REC-01
CLAIM: On CB(d,m) with any tag set F of original leaves, at p = dm + 1: every positive-weight target is still joined to some positive-weight source (root-arm, arm-leaf and arm-support targets have at most p − 2 = dm − 1 column vertices and are covered in class; a column-full arm-free target A is covered by A ∪ {v}), so the family of all positive sources has deficiency S_F(p) and the family of positive sources avoiding s has deficiency S_F(p) − L_F(p); the same-class form of the cover fails at p = dm + 1 (arm-free target {u_i} ∪ one vertex of every column). Literal: 64/64 instances for both identities; same-class cover 1/64.
STATUS: bounded_computation
PROVENANCE: SR-C6-5 own literal instrument scratchpad/c6-sr-SR-C6-5/sr5_lit.py (CB(2,1)..CB(5,1), CB(1,2)..CB(4,2), CB(1,3)..CB(3,3), CB(2,4); F derived, every leaf, random); the covering argument is written on the face of second-reads/SR-C6-5/SECOND-READ.md and is STATED (it would need its own isolated second read to be registered at proved_informal).
```

```text
RECORD: R30-C6-SR5-REC-02
CLAIM: Failure pattern of clauses (a) and (c) above the range: at p >= dm + 2 the positive-source cover and both identities fail on CB(1,2)/4, CB(1,3)/5, CB(2,2)/6 (every leaf: def of all positive sources −45 against S = −68; def of the s-free positive family −25 against S − L = −44), CB(3,2)/8, CB(2,3)/8, CB(2,3)/9, CB(4,2)/10, CB(3,3)/11, CB(3,3)/12, CB(2,4)/10, CB(2,4)/11, CB(2,4)/12; they hold at CB(1,3)/6 and at the eligible CB(1,7)/10 (p = dm + 3), so the failure beyond dm + 1 is not universal. L1, (d) and (e) hold on every instance at every rank.
STATUS: bounded_computation
PROVENANCE: SR-C6-5 own literal instrument (RESULT_SHA256 97119541…c849426; rows 6cc332e5…); concordant with the F adjudicator's ten failures of Identity 3, all at p = dm + 2 or dm + 3.
```

```text
RECORD: R30-C6-SR5-REC-03
CLAIM: Correction of a critic sentence (not a registered claim): C-U2-T's "the coverage hypothesis p <= dm − 1 is necessary: deficit(X2) ≠ S at exactly those sweep rows with p >= dm" is false and struck. C-U2-T's own shipped sweep data (701 rows) have deficit(X2) = S and deficit(X1) = S − L on all 78 rows with p ∈ {dm, dm + 1}, and every one of the 81 failures of each identity has p − dm ∈ {2, …, 6}; its closedform.py check asserts the two identities only for p <= dm − 1. The sharp range of the same-class cover is p <= dm.
STATUS: bounded_computation
PROVENANCE: SR-C6-5 reading of the frozen C-U2-T instrument outputs (sources/c6-stage7-sources/C-U2-T/own/sweep_broad_*_RESULT.json, closedform.py; digests verified) and the SR-C6-5 literal instrument.
```

```text
RECORD: R30-C6-SR5-REC-04
CLAIM: Literal whole-network checks at two eligible CB rows. CB(2,5)/10 (n = 28, α = 16, x = 8, p = dm = 10; F derived = every leaf): supply 259980, capacity 396460, S = −136480, L = −38120, def of the s-free positive family −98360 = S − L, same-class cover holds, all clauses hold, maximum deficiency 0, choke-forest maximum deficiency 0. CB(1,7)/10 (n = 24, α = 15, x = 8, p = dm + 3; F derived = every leaf): supply 29190, capacity 58002, S = −28812, L = −10416, def of the s-free positive family −18396 = S − L, same-class cover fails, maximum deficiency 0.
STATUS: bounded_computation
PROVENANCE: SR-C6-5 own literal instrument, rows mode (RESULT_SHA256 6cc332e546b5fecae89061db20f62f6f230aa9c9daf5b932753c66d9efae807e); supply − capacity = S asserted from independent sides.
```

## Verdicts

verdict[SR-C6-5a]: confirmed

verdict[SR-C6-5b]: confirmed_with_repairs

verdict[SR-C6-5c]: confirmed_with_repairs

verdict[SR-C6-5d]: confirmed_with_repairs

verdict[SR-C6-5e]: confirmed

verdict[SR-C6-5f]: confirmed_with_repairs

**Rulings.**

- **Boundary `p = dm`.** Clauses (a) (same-class cover) and (c) hold at `p = dm` by the same argument, because positivity leaves at
  most `p − 1` column vertices. L1, (d) and (e) hold at every `p`.
  - Above the key's range: at `p = dm+1`, the same-class form of (a) fails, while `def(X2) = S` and `def(X1) = S − L` still hold
    (record only). At `p ≥ dm+2` both identities fail in general.
  - C-U2-T's "`p ≤ dm − 1` necessary" is struck.
- **General `F`.** L1, (d) and (e) hold for every tag set of original leaves at every `p ≥ 1`. (a) and (c) hold for every such `F` at
  `1 ≤ p ≤ dm`, with `L_F = |F ∩ P|·([y^p]G − [y^{p−1}]G)` and `S_F` the tagged aggregate. "Every leaf favorable" is not a hypothesis.
- **Key.** Register the repaired name above at `proved_informal`, with clause (c) as the predicate and L1, (a), (d) and (e) as
  companions on the face.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

- Deliverable: `second-reads/SR-C6-5/SECOND-READ.md`, this file.
- Scratch: `scratchpad/c6-sr-SR-C6-5/`.

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `d5eacbbdcd60a29285ee5bad1c9f020ed90419cd65b82d0ff09eb6502940e4fd` | Capsule seal and 350 member digests |
| `sr5_lit.py` | `900dc1db7d603ed267897118d7a8d7713026d7fff1eccb9161a5d165c5abb3d4` | Own literal instrument (final version; every output below comes from it) |
| `sr5_lit_out.json` | `8a354e5de41c992053e70dee15a90d072c91465d922ac8880de2635ee031e870` | 424 records: 383 instances plus 41 empty-`F_p` skips (`RESULT_SHA256 97119541553321748573ba9fb3b6dc8a736a983f6e7b47562d6d27ac3c849426`) |
| `sr5_lit_stdout.txt` | `241e498b3499ce80a8b0e7041ab8a7469c6e6928e1cd22e0fee5fa471ed2c3af` | Its stdout |
| `sr5_summary.py` | `3fadcba56eaf58261d4927c288ca1d86005a0afa4adf7d05c0bc24aee9832b07` | Band summary |
| `sr5_summary_out.txt` | `33694864bf5fcaf5b14e914e525ea90bf06ccfb7e0d713d719e1b7997fbd16e6` | Summary (`SUMMARY_SHA256 c03b1ca2e1128146865735143918efd5c15d95161ed45ab797f2d200b87449fe`) |
| `sr5_rows_out.json` | `2e151bd27476138c232a70afb73a64f016bc818b223d2a7bdb6dc0cc4c01a03c` | Eligible rows `CB(2,5)/10` and `CB(1,7)/10` (`RESULT_SHA256 6cc332e5…`) |
| `sr5_rows_stdout.txt` | `36f5584de23eefeca6f82e63280379f76533bbd7111efc2204233d9b15f7219e` | Its stdout |
| `sr5_alias.py` | `b21761fd349cc60963a14f548430b740d9b2b85f624bca05e78e7d81da018a23` | Alias check against 460 / 434 / 457 |
| `sr5_alias_out.txt` | `2e48879e8820b03592bd181f21c0b5f7512b2a988764a49be10a5f99997d592e` | Alias results (`ALIAS_SHA256 f1bdf16cab91d0e497640318a072bddbe81a00d56bec3dd2a894b6c4e8241e49`) |

- **Process.**
  - `sr5_lit.py` was edited three times during the read: the restricted-rank mode, the sector-form check, and the full-maximizer
    `V⁺` check. Every output listed was regenerated with the final version.
  - All runs were foreground: at most 43 s each. There were no background jobs and no kills, and no `__pycache__` was written
    (`python3 -B`).
  - No sealed member was edited.
