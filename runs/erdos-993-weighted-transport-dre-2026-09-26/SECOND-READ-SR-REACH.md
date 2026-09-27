# Second Read

Isolated second read `SR-REACH`, Cycle 1, run r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Erdős #993
(weighted mixed-boundary transport). Date 2026-09-26. Statements read: SR-11 to SR-15 (P10, P11 with B-b, P12, the (HALL)
scope note of registration 6, and the D8 scope note of registration 10).

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The only subsystem loaded is `experiments/`, limited to this
read's sealed capsule. The harness put the root `CLAUDE.md` and the user auto-memory index into my context at session start. I
did not open either as a source, and nothing below relies on them.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Capsule seal.** For `control/c1-second-read/SR-REACH-PACKET-MANIFEST.json`, I removed `seal_sha256` and took the SHA-256 of
  the canonical JSON (`sort_keys`, separators `(",", ":")`, no trailing newline). The result is
  **`56a07fc3990c1178f32cdec08b851de3be545ab319cfacab7876b7621eb68e0f`**. It equals the embedded value and the dispatched prefix
  `56a07fc3990c1178`.
- **Members.** At audit time, all 18 listed members matched their SHA-256 and byte counts, with 0 mismatches (`file_count` 18).
  At close, 17 of 18 match; see Disclosure 4 for the one that changed. The members are:
  - the two contracts;
  - my brief and the protocol;
  - `C1-STAGE6-CONTROLLER-FACTS.json` and the Stage 6 packet manifest;
  - the run-local and frozen claim registries;
  - the path check and `SOURCE-DIGESTS.json`;
  - F1's and F2's returns and their four critiques;
  - the F adjudication and the synthesis.
- **Statement of record.** The synthesis has SHA-256 `339a208e…0e7` and 53,703 bytes. Its sections are `## Exact established
  results` P10–P12, B-a, B-b and B-i; the (HALL) scope note under `## Headline verdicts`; and `## Registrations` items 6 and 10.
- **Read boundary.**
  - I read only the capsule members and the two boot files.
  - The registries were parsed by key: D8 and (HALL) in `sources/authority/CLAIM-IDENTITY.json` and
    `control/CLAIM-IDENTITY.run-local.json`, plus a lexical alias scan of both.
  - I opened no seat or critic scratch, no other return, critique or adjudication, no network source and no other experiment
    root, and I installed nothing.
- **Disclosure 1.** In the seal-check command I ran a non-recursive `ls` of the run's `scratchpad/` and `second-reads/`. It
  printed directory names only. I opened none of them except my own.
- **Disclosure 2.** The harness saved two oversized outputs of capsule members to its session tool-results store: synthesis
  lines 1–370 and the C-F2-U critique. I read those two members from there. Their content is the capsule members.
- **Disclosure 3: process deviation.** My first `CB` scan (`cb_scan.py 1600`) passed the 600 s foreground limit, and the harness
  moved it to the background.
  - To find it, I used `pgrep -f "cb_scan.py 1600"` and then `ps -o pid,ppid,command -p 4021,4023` on those two literal PIDs
    only. No full process listing was made.
  - I killed PID 4023 by literal PID. Its wrapper 4021 exited, and I verified both gone with `kill -0`. It exited with code 143.
  - Nothing from that run is used.
  - I rewrote the scan incrementally and re-ran it in the foreground under `timeout 550` (193 s). **No background job remains.**
- **Disclosure 4: a capsule member changed during the read, and not by me.**
  - At the audit, all 18 members matched. At the close re-check, `control/CLAIM-IDENTITY.run-local.json` no longer matched its
    sealed entry.
  - Sealed entry: 2,409,146 bytes, `86f94811…`. Now: 2,428,291 bytes, `743e77a9dbd9a34085374ab893bc1a31c6d1cc81f67ee3d0d30b45576d518aad`,
    modified 2026-09-26 15:15:51 local.
  - The writer was outside this read. I never wrote to it, and I did not read the new content (I hashed it only).
  - My single parse of this file, the (HALL) entry and the alias scan, ran before 15:15, against the sealed bytes. Every fact I
    take from it is also in the frozen `sources/authority/CLAIM-IDENTITY.json` (`eba20be3…`, unchanged).
  - The other 17 members still match. This is a controller-side living-file event, flagged here for the controller: a living
    file should not be a capsule member.
- No Lean invocation, no `find`, and no search rooted above the capsule. Python standard library and exact integers only.

## Statements read

- **SR-11 (P10), the reachability lemma.** An independent `p`-set `A` has no in-arc of (D) ∪ (S) iff `A` is maximal
  independent and no `u ∈ A` has two private neighbours. This is the form for triangle-free graphs; on general graphs, read
  "two non-adjacent private neighbours". Synthesis grade `proved_informal`, STATED. Attribution: F2; C-F2-T (general form);
  C-F2-U.
- **SR-12 (P11 and B-b), unreachable positive-weight targets on eligible rows.**
  - Counts: first at order 14 (11 of 313 rows, gap 2); none at orders 11–13, 15 or 16; 24 rows at order 17 (gap 2); 43 rows at
    order 18 (gaps 3 and 1). (HALL) saturates on each.
  - The families `G_k` (C-F2-T) and `T(m, k)` (C-F2-U). Unreachability is `proved_informal`. Eligibility is bounded
    (`3 ≤ k ≤ 1500`; `4 ≤ m ≤ 60`). The families are not registered as keys (registration 13).
- **SR-13 (P12).** An unreachable target on an eligible row forces `min(|P|, |M|) ≥ p/2`. Hypotheses given: "König;
  bipartiteness". Candidate `proved_informal`, STATED. Attribution: C-F2-T; F adjudicator.
- **SR-14.** The (HALL) scope note (registration 6), quoted verbatim in `## Findings and repairs` below.
- **SR-15.** The D8 scope note (registration 10): "literal failures already at order 11 (4/5 rows), 12 (33/34), 13 (161/163);
  minimality was never asserted; (HALL) saturates on each" (`bounded_computation`, three instruments: C-F2-T, C-F2-U, F
  adjudicator).
  - **Registered statement, verbatim** (frozen registry `eba20be3…`, status `REFUTED`, `evidence_grade`
    `exact_finite_refutation`, `known_witness_order` 14, `witness_minimality` "Not asserted or tested"): "For every finite
    ordinary tree T and natural p with x(T)+2<=p and 3p<2alpha(T)+1, let F be its fixed original strict favorable-leaf
    selector, w_F(B) the number of active tags v in F intersect B with (B minus {v}) meeting N_T(s_v) minus {v}, Q=sum over
    independent p-sets B of w_F(B), and E=sum over these B of w_F(B) times the number e_T(B) of addable vertices. Then
    i_p(T)*E <= (p+1)*i_(p+1)(T)*Q."

## Independent re-derivation

**Own instrument.** All files are under `scratchpad/c1-sr-SR-REACH/` and were written from SEMANTIC-CONTRACT §1 with erratum
R30-E-b. No seat, critic, adjudicator or controller code was imported or read.
- **Trees.** Free trees come from leaf extension with a centre-rooted AHU canonical form. Counts are asserted equal to A000055
  for orders 1–18. Every tree passes separate edge-count and BFS connectivity tests.
- **Polynomials.** Independence polynomials come from a forest DP on bitmasks. `x` is scanned through rank `α` with
  `i_{α+1} = 0`. Eligibility is `x + 2 ≤ p` and `3p < 2α + 1`, asserted on every row.
- **Selector and weight.** `F_p` is `{leaf v : Δ_p(T − v) < 0}` on the original tree. `w_F(B)` counts `v ∈ F ∩ B` with
  `B ∩ W_v ≠ ∅`, where `W_v = N(s_v) ∖ {v}`.
- **Aggregate.** `S` is computed separately as `Σ_{v∈F} [Δ_{p−1}(T − {v, s_v}) − Δ_{p−1}(T − N[s_v])]`.
- **Relation.** (D) ∪ (S) is taken literally. For every switch, the image is asserted independent and of size `p`.
- **Assertions and flow.** On every row, before any other output, the instrument asserts that the layer sizes equal the
  polynomial coefficients, that `supply − capacity = S`, and that `F ≠ ∅`. Flows are exact-integer Dinic, deletion-only first
  and mixed if needed.

**Census results.** All rows are free trees up to isomorphism.

| order | eligible rows | `F = leaf set` | targets checked by brute in-arc scan | P10 mismatches (tree / general form) | rows with an unreachable `w > 0` target | gap(s) | unreachable targets of weight 0 | deletion-only saturating | D8 literal failures |
|---:|---:|---:|---:|---|---:|---|---:|---:|---:|
| 11 | 5 | 5 | 434 | 0 / 0 | 0 | — | 0 | 5 | 4 |
| 12 | 34 | 34 | 3,699 | 0 / 0 | 0 | — | 0 | 34 | 33 |
| 13 | 163 | 163 | 26,120 | 0 / 0 | 0 | — | 0 | 163 | 161 |
| 14 | 313 | 313 | 81,577 | 0 / 0 | **11** | **2** (all 11) | 0 | 313 | 310 |
| 15 | 528 | 528 | 306,024 | 0 / 0 | 0 | — | 9 | 528 | 524 |
| 16 | 2,763 | 2,763 | 2,263,028 | 0 / 0 | 0 | — | 0 | 2,763 | 2,759 |
| 17 | 10,061 | 10,061 | (P10 path) | — | **24** | **2** (all 24) | 0 | 24/24 flagged | — |
| 18 | 37,295 | 37,295 | (P10 path) | — | **43** | **3** (24), **1** (19) | 346 | 43/43 flagged | — |

- **Method at orders 11–16.** A full brute network per row (`census_brute.py`).
- **Method at orders 17–18.** Every maximal independent set is enumerated by Bron–Kerbosch (`census_mis.py`), and the P10 test
  is applied to those of size `p`.
- **Validation of the P10 path.** It agrees exactly with the brute census at orders 11–16. Every flagged row at orders 14, 17
  and 18 was then rebuilt as a full brute network: (WID) asserted, brute reachability, brute gap equal to the P10 gap (78/78),
  and deletion-only max-flow equal to supply (78/78).
- **Shape of the flagged rows.** Every flagged row has exactly one unreachable positive-weight target, and every flagged row
  sits at `p = x + 2`.
- **Totals.** 51,162 eligible rows at orders 11–18. P12 holds on all 433 unreachable targets of any weight (11 + 9 + 24 + 389).
  The P10 check covered 2,680,882 targets at orders 11–16.

**SR-11, P10: re-derived.** Let `G` be a finite simple graph and `A ∈ I_p`.
- **(D) preimages.** A (D) arc `B → A` means `A = B ∖ {q}` with `q ∈ B`, so `B = A ∪ {q}` with `q ∉ A` and `B` independent,
  i.e. `q` is addable to `A`. Conversely, any addable `q` gives such a `B ∈ I_{p+1}`. So (D) preimages exist iff `A` is not
  maximal.
- **(S) arc gives a pair.** Take an (S) arc `B → A`: `u ∉ B`, `N(u) ∩ B = {y, z}`, and `A = (B ∖ {y, z}) ∪ {u}`.
  - Then `u ∈ A` and `B = (A ∖ {u}) ∪ {y, z}`.
  - `y, z ∉ A`: they were removed, and neither equals `u`.
  - `B` is independent, so `y ≁ z`, and `y` has no neighbour in `A ∖ {u} ⊆ B`. Since `u ~ y`, `N(y) ∩ A = {u}`, so `y` is a
    private neighbour of `u`; likewise `z`.
  - So `u` has two non-adjacent private neighbours.
- **Pair gives an (S) arc.** Suppose `y ≠ z` are non-adjacent private neighbours of `u ∈ A`. Put `B = (A ∖ {u}) ∪ {y, z}`.
  - `|B| = p + 1`, since `y, z ∉ A`.
  - `B` is independent: `A ∖ {u}` is independent, `y` and `z` have no neighbour in `A ∖ {u}` (privacy), and `y ≁ z`.
  - `u ∉ B`.
  - **Why no third neighbour of `u` lies in `B`.** Every element of `B` other than `y, z` lies in `A ∖ {u}`, and no element of
    `A ∖ {u}` is adjacent to `u` because `A` is independent. So `N(u) ∩ B = {y, z}` exactly, `|N(u) ∩ B| = 2`, and
    `(B ∖ N(u)) ∪ {u} = (A ∖ {u}) ∪ {u} = A`. This is an (S) arc.
- **Conclusion.** `A` has no in-arc iff `A` is maximal and no `u ∈ A` has two non-adjacent private neighbours.
  - On a triangle-free graph (in particular a tree), two neighbours of `u` are never adjacent, so the condition reads "two
    private neighbours".
  - The Lean `transportRel` (SOLUTION-CONTRACT §2) is exactly this relation.
  - Nothing uses `F`, the weights, eligibility or acyclicity, and there is no ℕ subtraction.
- **Corroboration** (not proof). 0 mismatches in both forms against brute in-arc enumeration on all 2,680,882 targets of all
  3,806 eligible rows at orders 11–16. This is my own replay; C-F2-T and C-F2-U report the same at orders 11–16.

**SR-12, P11 and B-b: recomputed and re-derived.**
- **Order 14.** My census gives **11 of 313** eligible rows, each with exactly one positive-weight target that has no in-arc,
  of weight 2, and gap `Σ_{I_p} w − Σ_{N(I_{p+1})} w = 2`. I computed the gap directly as capacity minus the weight of targets
  with at least one in-arc from any source.
- **Other orders.** None at orders 11–13 or 16. At order 15 there are 9 unreachable targets, but all have weight 0, so the gap
  is 0 on every order-15 row. Order 17 has 24 rows with gap 2. Order 18 has 43 rows: 24 with gap 3 and 19 with gap 1. All
  flagged rows saturate using deletion arcs alone.
- **B-b is reproduced digit for digit.**
- **Witnesses.** The 11 order-14 rows include `G_3` (`S = −274`, 253/527, `|F| = 6`) and `T(4, 2)` (`S = −252`, 202/454,
  `|F| = 5`). They are non-isomorphic (different canonical forms). The 24 order-17 rows include `G_4` and `T(5, 2)`. The 43
  order-18 rows include `T(5, 3)`, which has weight 3.
- **`G_k`** (root `0`; leaf `1`; support `2 ~ 0` with leaves `3, 4`; paths `0–a_i–b_i–c_i`; `n = 3k + 5`;
  `A_k = {0, 3, 4, b_1, …, b_k}`, `p = k + 3`).
  - For every `k ≥ 0`, `A_k` is independent and dominating.
  - Its outside vertices split as follows. `1` is private to `0`. `c_i` is private to `b_i`. `2` has 3 `A`-neighbours and
    `a_i` has 2. So every `u ∈ A_k` has at most one private neighbour, and `A_k` has no in-arc by P10.
  - The only leaves in `A_k` are `3` and `4`, with `W_3 = {0, 4} ⊆ A_k` and `W_4 = {0, 3} ⊆ A_k`. So
    `w_F(A_k) = |{3, 4} ∩ F|`.
  - König: the matching `{01, 23, a_i b_i}` and the cover `{0, 2, b_i}` both have size `k + 2`, so `α = 2k + 3`. The **upper**
    eligibility inequality `3(k + 3) < 2α + 1` therefore holds iff `k ≥ 3`, and this is proved.
  - Bounded only: `x(G_k) = k + 1`, i.e. `x + 2 ≤ p`, and `3, 4 ∈ F_{k+3}`.
    - My replay covers `3 ≤ k ≤ 300`: `x = k + 1`, eligible, `3, 4 ∈ F`, weight 2.
    - Both of C-F2-T's closed forms (`I(G_k)` and `I(G_k − 3)`) equal my DP for `1 ≤ k ≤ 300`.
    - At `k ≤ 5` I ran brute networks with all leaves favorable, gap 2 and deletion-only saturation.
    - `G_1` and `G_2` are not eligible.
- **`T(m, k)`** (path `c_1–d_1–…–c_m–f–s`; `e_i` on `c_i` for `i < m`; `k` leaves `ℓ_j` on `s`; `n = 3m + k`;
  `A = {c_i} ∪ {ℓ_j}`, `p = m + k`).
  - For every `m, k ≥ 1`, `A` is independent and dominating.
  - The private neighbours are `e_i` (to `c_i`, `i < m`) and `f` (to `c_m`), plus `s` (to `ℓ_1`) only when `k = 1`. Each `d_i`
    has 2 `A`-neighbours. So `A` has no in-arc by P10.
  - For `k ≥ 2`, `W_{ℓ_j} ⊇ {ℓ_{j'}}` meets `A` and the `c_i` are not leaves, so `w_F(A) = |{ℓ_j} ∩ F|`. For `k = 1` the
    weight is 0.
  - König: the matching `{c_i e_i (i < m), c_m f, s ℓ_1}` and the cover `{c_1, …, c_m, s}` have size `m + 1`, so
    `α = 2m + k − 1`. The upper inequality holds iff `m ≥ k + 2`, and this is proved.
  - Bounded only: `x ≤ p − 2` and `ℓ_j ∈ F_p`. C-F2-U checked `k = 2`, `4 ≤ m ≤ 60` and `k = 3`, `5 ≤ m ≤ 60`. My replay
    covers `k = 2, 3` with `m ≤ 150`: every row is eligible with the `ℓ_j` favorable, and at `k = 2`, `x ≤ m`. `T(2, 2)`,
    `T(3, 2)` and `T(4, 3)` are not eligible.
- **The grade split is confirmed.** It is `proved_informal` that the family targets have no in-arc, for all parameters (and
  that `α` and the upper inequality are exact). Eligibility's first-descent half and favorability are `bounded_computation`.
  Hence positivity of the weight is also bounded.
- **Not registering the families as keys is right.**
  - The uniform statement "infinitely many eligible rows carry unreachable positive capacity" rests on the unproved
    `x(G_k) = k + 1` (or `x(T(m, 2)) ≤ m`) and on favorability.
  - C-F2-U's candidate name `E993-R30-UNREACHABLE-POSITIVE-TARGET-FAMILY` is a noun phrase, not a predicate.
  - The registry alias scan (frozen, 434 claims; run-local, 435) finds only the four unrelated `reachab` hits
    (`E993-PAIR-EDGE-JOIN-COMPOSITION`, `E993-R25-COVER-CELL-DRIFT-CRITERION`,
    `E993-R25-THIN-TREE-TAU-12-BAND-NO-IN-WINDOW-FAILURE-NO-RECOVERY`, `E993-R28-BRANCH-TREE-SURPLUS-IDENTITY`). No key concerns
    in-arcs of the (D) ∪ (S) network.

**SR-13, P12: re-derived.** The sets are not colour classes. The critique defines them, and I use the same: for an independent
`A`, `P := {w ∉ A : |N(w) ∩ A| = 1}` and `M := {w ∉ A : |N(w) ∩ A| ≥ 2}`. Let `T` be a finite tree and `A ∈ I_p` have no in-arc.
- **Partition.** By P10, `A` is maximal, so `V ∖ A = P ⊔ M` and `n = p + |P| + |M|`.
- **`ν ≥ |P|`.** Each `w ∈ P` is a private neighbour of its unique `A`-neighbour `u(w)`. By P10 each `u` has at most one
  private neighbour, so `w ↦ u(w)` is injective and `{w u(w)}` is a matching of size `|P|`.
- **`ν ≥ |M|`.** For `S ⊆ M`, the subgraph on `S ∪ N_A(S)` is a forest (acyclicity of `T`) with at least `2|S|` edges. So
  `2|S| ≤ |S| + |N_A(S)| − 1`, i.e. `|N_A(S)| ≥ |S| + 1`. Hall gives a matching saturating `M`.
- **König.** `T` is bipartite, so `τ = ν`, and Gallai gives `α = n − τ`. So `α = n − ν ≤ n − max(|P|, |M|) = p + min(|P|, |M|)`.
- **Eligibility.** `3p < 2α + 1` means `3p ≤ 2α ≤ 2p + 2·min(|P|, |M|)`, so `2·min(|P|, |M|) ≥ p`.
- **Where the hypotheses enter.** Acyclicity is load-bearing in the Hall step. Mere bipartiteness does not suffice there: in
  `K_{2,3}` with `A` the 2-side, `|N_A(M)| = 2 < 3 = |M|`. Bipartiteness is used for König. Only the upper eligibility
  inequality is used. The weight of `A`, `x`, `F` and `x + 2 ≤ p` are not used, so the statement covers unreachable targets of
  weight 0 as well. There is no ℕ subtraction, since `p/2` is read as `2·min ≥ p`.
- **Side facts.** C-F2-T also derives `|M| ≤ p − 1` and `n ≤ 3p − 1` by counting the edges at `A`. Both are correct, but they
  are not part of P12.
- **Corroboration.** P12 holds on all 433 unreachable targets at orders 11–18, with `α ≤ p + min` asserted on each at orders
  11–16. `G_k` has `|P| = |M| = k + 1 ≥ (k + 3)/2`.

**SR-14 and SR-15: evidence per clause.** See `## Findings and repairs`. My own replays used there:
- deletion-only saturation on all 3,806 eligible rows at orders 11–16;
- D8, read literally, fails on 4/5, 33/34, 161/163, 310/313, 524/528 and 2,759/2,763 rows at orders 11–16. I reproduce both
  critics' order-11 inequalities:
  - `134460 > 133644` on the double broom `0–{1..7}`, `1–{8, 9, 10}` at `p = 6` (`Q = 516`, `E = 1494`, `i_6 = 90`, `i_7 = 37`);
  - `120960 > 120694` on the spider `0–{1..7}`, `1–8`, `8–{9, 10}`.
  - The other two order-11 failures are `127500 > 127260` and `113475 > 113400`.
  - The sanity identity `Σ_{I_p} e_T = (p + 1) i_{p+1}` is asserted on every row.
  - Every D8-failing row saturates with deletion arcs alone.
- my closed-form `CB(d, m)` scan (`cb_scan.py`): 4,974 configurations with `n ≤ 1600`, with `x` through `α` and `v ∈ F_p`
  exact.
  - The polynomials are derived by conditioning on `r`: `I = t(1+t)(1+2t)^{dm} + (1+2t)[(1+2t)^d + t(1+t)^d]^m` and
    `I(T − v) = t(1+2t)^{dm} + (1+t)[(1+2t)^d + t(1+t)^d]^m`. Both are validated against the forest DP on five small members.
  - Exactly three eligible rows satisfy `3p < 2dm + 5` together with `v ∈ F_p` and `2 ≤ p ≤ dm + 1`:
    - `CB(8, 86)`, `p = 460` (`n = 1465`, `α = 775`, `x = 458`);
    - `CB(8, 89)`, `p = 476`;
    - `CB(8, 92)`, `p = 492`.
  - The sector algebra checks: `Σ_{X_sec} w / Σ_{N_D(X_sec)} w = 2(dm − p + 2)/(p − 1)`, which exceeds 1 iff `3p < 2dm + 5`.

## Findings and repairs

**SR-11 (P10): no repair needed.** The statement, both directions and the general form are correct. The attribution on the
synthesis face is right:
- F2 stated the tree form with a sketch and checked four non-eligible trees;
- C-F2-T gave the complete proof and the general form;
- C-F2-U gave the triangle-free form and the exactness of `N(u) ∩ B`.

I add only that the lemma needs no `F`, weight or eligibility, and holds for every `p ≥ 0` on every finite simple graph.

**SR-12 (P11, B-b): numbers confirmed; three repairs to P11's face.**
1. **Range for `T(m, k)`.** The bounded range "`4 ≤ m ≤ 60`" belongs to `T(m, 2)` only. The critic also checked `T(m, 3)` for
   `5 ≤ m ≤ 60`. No other `k` was checked. Positive weight requires `k ≥ 2`.
2. **Where "positive weight" sits.** P11's heading "Unreachable positive-weight targets … for all parameters" places positive
   weight inside the proved half. It is not proved: `w_F > 0` needs the tag leaves in `F_p`, and that is bounded. The proved
   half is "the family targets have no in-arc". Their weights are `|{3, 4} ∩ F|` and `|{ℓ_j} ∩ F|`.
3. **Eligibility is only partly bounded.** The upper inequality is PROVED for both families: `α(G_k) = 2k + 3`,
   `α(T(m, k)) = 2m + k − 1`, by König. Only `x ≤ p − 2` is bounded. This sharpens the split and does not change the grade of
   the family statement, which stays `bounded_computation` beyond the checked ranges.

B-b needs no repair. I add two facts from my census: each flagged row has a unique such target at `p = x + 2`, and every
flagged row saturates with deletion arcs alone. The synthesis is right not to register the families as keys.

**SR-13 (P12): two repairs.**
1. **Define `P` and `M` on the face.** The synthesis text never says what they are. They are the outside vertices with exactly
   one, respectively at least two, `A`-neighbours. They are not colour classes.
2. **Correct the hypotheses.** "König; bipartiteness" is not enough. Acyclicity (`T` a tree) is load-bearing in the Hall step
   (`K_{2,3}`). The used facts are P10's two conditions and only `3p < 2α + 1`. Positive weight is not needed.

State `min ≥ p/2` as `2·min(|P|, |M|) ≥ p`. The grade is `proved_informal`.

**SR-14 (the (HALL) scope note): true in substance; five wording repairs.** The synthesis text, verbatim: "r30 C1: bounded —
every eligible row of free trees of orders 11–18 (51,162; order 19 by one critic) saturates with deletion arcs alone; switch
arcs first necessary at `CB(8, 86)`, `p = 460` (sector criterion `3p < 2dm + 5`, STATED); the (HALL) inequality at
`X = I_{p+1}` is strictly stronger than `S ≤ 0` on exhibited eligible rows (unreachable positive targets from order 14), with no
separating instance known; no deficient cut known; (HALL-COND) ⇔ saturating flow compiled in scratch (critic, STATED); if
(HALL) fails, it fails on an `Aut(T)`-invariant positive-weight family (P4, STATED)".

Clause by clause:
- **(a) The order 11–18 census.** Backed.
  - C-F1-T (orders 11–19, 195,683 rows), C-F1-U (11–18, 51,162, with explicit flow certificates) and the F adjudicator (11–18)
    each give deletion-only saturation, and so does my replay at 11–16.
  - The controller's run to order 16 is a prior and does not count as an instrument.
  - F1's own evidence covers only 3,296 open-band rows and never ran deletion-only.
  - **Repair:** name the instruments and add "no census row exercises a switch arc".
- **(b) "switch arcs first necessary at `CB(8, 86)`, `p = 460`".**
  - The "necessary" half is correct. `X_sec` is an exact deletion-only deficient cut there (P8), so ANY saturating flow must use
    (S) arcs. It is not a claim that one exists; that is open.
  - "First" overstates. It holds only in the `CB(d, m)` family: `CB(8, 86)` is the only row with `n ≤ 1465` (C-F1-T,
    C-F1-U) and the smallest of exactly three with `n ≤ 1600` (F adjudicator; my scan).
  - Outside `CB`, the evidence is only that no free tree of order ≤ 19 needs a switch. Trees of other shapes at orders 20–1464
    are untested. The Cycle 2 F1 route itself says the smallest switch-necessary tree "is currently between order 20 and 1465".
  - **Repair:** "in the `CB(d, m)` family, deletion-only transport first fails at …".
  - The sector criterion's hypotheses (`v ∈ F_p`, `2 ≤ p ≤ dm + 1`) belong on the face.
- **(c) "strictly stronger than `S ≤ 0`".** Backed by SR-12.
  - **Repair for exactness:** on such a row, the whole-layer instance of (HALL-COND) reads `supply ≤ capacity − g`, with
    `g ∈ {1, 2, 3}` the unreachable positive weight. By (WID) that is stronger than `S ≤ 0 ⇔ supply ≤ capacity`.
  - Both hold on every exhibited row, so no instance separates them.
  - The subfamily quantifier (R5) is the other, always-present source of strength, and the note should not read as if the
    unreachable gap were the whole difference (C-F2-U F-2).
- **(d) "no deficient cut known".** Backed.
- **(e) "(HALL-COND) ⇔ saturating flow compiled in scratch (critic, STATED)".**
  - The mathematical iff is `proved_informal`. I re-derived both directions:
    - (⇒) Hall on the clone expansion, using C-F2-U's completion sentence;
    - (⇐) restrict a saturating flow to `X`, which gives `Σ_X w = Σ f(X, ·) ≤ Σ_{N(X)} w`.
  - The compilation claim rests only on the U orientation's report (CF6-4; synthesis R3). The scratch Lean and the U
    adjudication are outside my capsule, so this read does not verify it, and a scratch compilation carries no grade
    (SOLUTION-CONTRACT §4).
  - **Repair:** attach the grade to the informal iff, and record the compilation as reported with no grade.
- **(f) "an `Aut(T)`-invariant positive-weight family".**
  - The argument checks at the level this note uses:
    - `X ↦ Σ_{N(X)} w` is a nonnegative coverage function and hence submodular, so `φ` is supermodular;
    - its maximizers are closed under `∪` and `∩`;
    - automorphisms preserve (D) ∪ (S), `F_p` and `w_F`, and so fix `X_min`;
    - dropping zero-weight sources never lowers `φ`, so `X_min` consists of positive-weight sources.
  - **Repair of wording:** "a family of positive-weight sources" (namely `X_min`).
  - P4 itself stays STATED pending its own second read. I did not read the U portfolio.

Status of (HALL) stays OPEN. No clause moves a key.

**SR-15 (D8 scope note): true; one attribution repair.**
- **Reading and recount.**
  - I read the registered statement literally and recomputed the order-11 rows myself. Of the five eligible trees
    (`α = 9`, `x = 4`, `p = 6`), four fail.
  - I also recomputed orders 12, 13 and 14: 33/34, 161/163 and 310/313.
  - `witness_minimality` is "Not asserted or tested", so an order-11 failure does not contradict the registered order-14
    witness.
  - Every failing row saturates.
  - So the note is a predicate the evidence satisfies. It changes no status: REFUTED stays REFUTED, and it is a scope note, not
    a correction.
- **Repair:** the note's "three instruments" is exact only at order 11 (C-F2-T, C-F2-U, the F adjudicator).
  - In this capsule, C-F2-U reports counts only at orders 11 and 14.
  - Orders 12–13 rest on C-F2-T and the F adjudicator. With this second read they reach three instruments.
  - Attribute per order, and quote the registry value verbatim.
- **Residual caveat.** C-F2-U flagged its reading as unconfirmed because the failure is near-universal. The registered text is
  the statement of record, and my reading follows it word for word, with `e_T(B)` the number of vertices addable to `B`. Any
  difference from the fenced source's code is outside this read and is not asserted.

## Registration text

Each text below is to be registered verbatim if the controller registers the item. None changes a status.

**SR-11.**
- *Where:* a component of the (HALL) scope note (registration 6). There is no new key. If the controller registers it as its
  own lemma, the predicate key is `E993-R30-TRANSPORT-TARGET-NO-IN-ARC-IFF-MAXIMAL-WITHOUT-NONADJACENT-PRIVATE-PAIR`.
- *Statement:* "On every finite simple graph `G` and every `p ≥ 0`, an independent `p`-set `A` has no in-arc of (D) ∪ (S) (no
  `B ∈ I_{p+1}(G)` with `transportRel G B A`) iff (i) `A` is a maximal independent set and (ii) no `u ∈ A` has two non-adjacent
  private neighbours relative to `A` (vertices `w ∉ A` with `N(w) ∩ A = {u}`). On triangle-free graphs, in particular on
  trees, (ii) reads: no `u ∈ A` has two private neighbours. Proof: the (D)-preimages of `A` are exactly `A ∪ {q}` with `q`
  addable; the (S)-preimages are exactly `(A ∖ {u}) ∪ {y, z}` with `y, z` non-adjacent private neighbours of `u`, and there
  `N(u) ∩ B = {y, z}` exactly because `A ∖ {u}` contains no neighbour of `u`."
- *Grade:* `proved_informal` (STATED at Stage 4; confirmed by isolated second read SR-REACH).
- *Attribution:* r30 F2 (tree form); C-F2-T (complete proof, general form); C-F2-U (triangle-free form); F adjudicator
  (check); SR-REACH (second read). Bounded corroboration, not proof: 0 mismatches against brute in-arc enumeration on every
  target of every eligible row at orders 11–16 (C-F2-T, C-F2-U, SR-REACH).
- *Fences:* a structural fact about the (HALL) network; no sign content; not a cut; moves no key; mechanism ≠ aggregate.

**SR-12, B-b.**
- *Where:* a record inside the (HALL) scope note.
- *Statement:* "On free trees up to isomorphism (A000055 asserted), eligible rows `(T, p)` with an independent `p`-set of
  positive active weight and no in-arc of (D) ∪ (S) number: 0 at orders 11–13; 11 of 313 at order 14 (gap
  `Σ_{I_p} w_F − Σ_{N(I_{p+1})} w_F = 2` on each); 0 at orders 15–16; 24 at order 17 (gap 2); 43 at order 18 (gap 3 on 24,
  gap 1 on 19). Each such row has exactly one such target and `p = x(T) + 2`, and has a saturating flow using deletion arcs
  alone."
- *Grade:* `bounded_computation`.
- *Attribution:* C-F2-T and C-F2-U (orders 11–16; discovery at order 14); F adjudicator (11–18); SR-REACH (11–18; brute
  networks at 11–16 and on every flagged row).
- *Fences:* an unreachable target refutes nothing and shows only that (HALL) is a strictly stronger sufficient condition; a
  census proves nothing universal.

**SR-12, P11.**
- *Where:* a route record inside the (HALL) scope note, NOT a key.
- *Statement:* "`G_k` (root `0`, leaf `1`, support `2 ~ 0` with leaves `3, 4`, paths `0–a_i–b_i–c_i`, `i ≤ k`) with
  `A_k = {0, 3, 4, b_1, …, b_k}`, and `T(m, k)` (path `c_1–d_1–…–d_{m−1}–c_m–f–s`, leaf `e_i` on `c_i` for `i < m`, leaves
  `ℓ_1, …, ℓ_k` on `s`) with `A = {c_1, …, c_m, ℓ_1, …, ℓ_k}`: for all parameters these targets are independent and maximal,
  with at most one private neighbour per member, hence have no in-arc of (D) ∪ (S) [`proved_informal`]; `w_F(A_k) = |{3, 4} ∩ F|`
  and, for `k ≥ 2`, `w_F(A) = |{ℓ_j} ∩ F|`; `α(G_k) = 2k + 3` and `α(T(m, k)) = 2m + k − 1` (König), so the upper eligibility
  inequality holds iff `k ≥ 3`, respectively `m ≥ k + 2` [`proved_informal`]. The first-descent condition `x ≤ p − 2` and the
  favorability of the tag leaves (hence positive weight and eligibility) are checked only for `3 ≤ k ≤ 1500` (C-F2-T;
  SR-REACH replay `k ≤ 300`), for `T(m, 2)` with `4 ≤ m ≤ 60` and for `T(m, 3)` with `5 ≤ m ≤ 60` (C-F2-U; SR-REACH replay
  `m ≤ 150`) [`bounded_computation`]."
- *Attribution:* C-F2-T (`G_k`); C-F2-U (`T(m, k)`); F adjudicator (non-isomorphism of `G_3` and `T(4, 2)`; re-derivation);
  SR-REACH (König values; second read).
- *Fences:* not registered as a key until uniform eligibility and favorability are proved and a predicate key is named;
  moves no status.

**SR-13, P12.**
- *Where:* a component of the (HALL) scope note. If the controller registers it as its own lemma, the predicate key is
  `E993-R30-UNREACHABLE-TARGET-ON-ELIGIBLE-TREE-FORCES-HALF-PRIVATE-HALF-MULTI-DOMINATED`.
- *Statement:* "Let `T` be a finite tree, `p ≥ 0`, and `A` an independent `p`-set with no in-arc of (D) ∪ (S). Put
  `P = {w ∉ A : |N(w) ∩ A| = 1}` and `M = {w ∉ A : |N(w) ∩ A| ≥ 2}`. Then `V ∖ A = P ⊔ M` and
  `α(T) ≤ p + min(|P|, |M|)`; hence if `3p < 2α(T) + 1`, then `2·min(|P|, |M|) ≥ p`. Proof: the private-neighbour map is a
  matching of size `|P|` (P10: at most one private neighbour per member); for `S ⊆ M` the forest on `S ∪ N_A(S)` gives
  `|N_A(S)| ≥ |S| + 1`, so Hall matches `M` into `A`; König–Gallai gives `α = n − ν`."
- *Grade:* `proved_informal` (STATED at Stage 4; confirmed by isolated second read SR-REACH).
- *Hypotheses used:* acyclicity (Hall step), bipartiteness (König), P10, and only the upper eligibility inequality. The weight
  of `A`, `x` and `F` are not used.
- *Attribution:* C-F2-T (statement and proof); F adjudicator (check); SR-REACH (second read; holds on all 433 unreachable
  targets of eligible rows at orders 11–18).
- *Fences:* a necessary condition on unreachable targets; not a cut; moves no key.

**SR-14.**
- *Key:* `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`. Status **OPEN, unchanged**.
- *Scope note:* "r30 C1 (`bounded_computation` unless marked): every eligible `(T, p)` on free trees of orders 11–18 (51,162
  rows; C-F1-T, C-F1-U, F adjudicator; order 19, 144,521 rows, C-F1-T only) has a saturating flow using deletion arcs alone,
  so no census row exercises a switch arc; in the `CB(d, m)` family deletion-only transport first fails at `CB(8, 86)`,
  `p = 460` (`n = 1465`; the only such row with `n ≤ 1465`, one of exactly three with `n ≤ 1600`), where the root-plus-arm
  sector is an exact deletion-only deficient cut (criterion `3p < 2dm + 5` for `v ∈ F_p`, `2 ≤ p ≤ dm + 1`; `proved_informal`,
  STATED), so any saturating flow there must use switch arcs — whether one exists is open, and trees of other shapes at orders
  20–1464 are untested; on eligible rows carrying an arc-unreachable positive-weight target (from order 14; P10–P12, B-b) the
  whole-layer instance of (HALL-COND) reads `supply ≤ capacity − g` with `g ≥ 1` the unreachable weight, strictly stronger than
  `S ≤ 0`, and every such row saturates — no separating instance is known; no deficient cut is known; (HALL-COND) for every
  `X` ⇔ a saturating integral flow: `proved_informal` (F2; C-F2-U completion; converse critic-first, STATED), a scratch
  compilation reported by the U orientation carrying no grade; if (HALL) fails at `(T, p)`, it fails on an `Aut(T)`-invariant
  family of positive-weight sources (P4, STATED)."
- *Attribution:* r30 F1 and F2; C-F1-T, C-F1-U, C-F2-T, C-F2-U; F adjudicator; the U orientation for (e) and P4; SR-REACH
  (second read of clauses a–d; clauses e–f checked at the level used). The controller prior is recorded as prior.
- *Fences:* a census proves nothing universal; an unreachable target refutes nothing; no status transfer; the primary
  aggregate is untouched.

**SR-15.**
- *Key:* `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`. Status **REFUTED, unchanged**.
- *Scope note:* "r30 C1 (`bounded_computation`): read literally, the registered inequality
  `i_p(T)·E ≤ (p+1)·i_{p+1}(T)·Q` already fails on eligible free trees of order 11 (4 of 5 rows; e.g. the double broom
  `0–{1..7}`, `1–{8, 9, 10}` at `p = 6`: `134460 > 133644`), order 12 (33 of 34), order 13 (161 of 163) and order 14 (310 of
  313). This does not conflict with the registered order-14 witness, whose registry entry records `witness_minimality`: "Not
  asserted or tested". Every one of these rows has a saturating (HALL) flow (deletion arcs alone). Instruments: order 11 C-F2-T,
  C-F2-U, F adjudicator, SR-REACH; orders 12–13 C-F2-T, F adjudicator, SR-REACH; order 14 C-F2-T, C-F2-U, SR-REACH."
- *Attribution:* C-F2-T and C-F2-U (discovery); F adjudicator (minimality ruling; replay); SR-REACH (second read).
- *Fences:* no status change; mechanism ≠ aggregate; (HALL) saturation is bounded and moves no key.

## Verdicts

verdict[SR-11]: confirmed
verdict[SR-12]: confirmed_with_repairs
verdict[SR-13]: confirmed_with_repairs
verdict[SR-14]: confirmed_with_repairs
verdict[SR-15]: confirmed_with_repairs

Strongest repair: SR-14(b). "switch arcs first necessary at `CB(8, 86)`" holds only within the `CB(d, m)` family. The
necessity is real (an exact deletion-only cut), but trees of other shapes at orders 20–1464 are untested, and whether the mixed
network saturates there is open. Next: SR-13's hypotheses must name acyclicity, since bipartiteness alone breaks the Hall step.

## Artifact inventory

- **Scratch root.** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-sr-SR-REACH/`
  (standard library, exact integers).
- **Replay.** `cd` there and run:
  - `python3 -B census_brute.py 11 13 census_11_13.json` and `… 14 16 census_14_16.json` (about 60 s);
  - `python3 -B census_mis.py 11 16 mis_11_16.json` and `… 17 18 mis_17_18.json` (about 100 s);
  - `python3 -B family.py 60 60 family.json` and `… 300 150 family_big.json`;
  - `python3 -B match_rows.py`;
  - `python3 -B cb_scan.py 1600` (about 195 s).

| file | sha256 | role |
|---|---|---|
| `srlib.py` | `b1b3822889613661e8a4b1996d009d4091ec718f2fb7d9a4a71b8cd3a28cf805` | instrument: trees, DP, selector, weight, (D) ∪ (S), P10 tests, Bron–Kerbosch, Dinic, (WID) assertion |
| `census_brute.py` | `d684de3fbcda6d62feb4eeb777163cfb0438468aa1d852646bfafeb3731557b3` | orders 11–16 full brute census (P10, gaps, P12, flows, D8) |
| `census_11_13.json` | `2c59131224ca37dff3d8fcfa8a9d423c1d8d4c8b9b7357a1fc606557c87c2078` | output (includes the four order-11 D8 failures) |
| `census_14_16.json` | `09db30881c53ef7e136916a9ee380e2c987d35f14323214b0d6b07e20b68221a` | output (the 11 order-14 rows with edge lists and targets) |
| `census_mis.py` | `141f073d52df73f2cf447e31dbb6d419a6100d142a92eebc6fdd9ddcbb29f5b5` | orders 11–18 P10 census on maximal sets plus a brute network per flagged row |
| `mis_11_16.json` | `875ff1c6e4ed4b2ae22f06ab638921ce48bf134d69f5a478d0ce999fdd835444` | cross-validation against the brute census |
| `mis_17_18.json` | `9e1167401cd7c2b1151f0fae106ff6c356104abe866b8995c295a49f96dfdd40` | the 24 + 43 flagged rows |
| `family.py` | `e536528d26efea86869a663d6f6703fa0b1ee2152b2622b5ba7fc23a89d39223` | `G_k`, `T(m, k)`: structure, König values, closed forms, eligibility, small brute networks |
| `family.json` | `e9ff5146ede646b808139272654083ec3efd1300fbd4a43b6dbaf15d904933b2` | `k, m ≤ 60` |
| `family_big.json` | `f24d2a7f25b9f18fcd0515b7f45f850aac2f4fd80b9beaecb457762524b5cefc` | `k ≤ 300`, `m ≤ 150` |
| `match_rows.py` | `33a0691ade49b00bf36fb11c3547b1e6416de4590ae459af2b624d328de5c63a` | matches family members to census rows (prints only) |
| `cb_scan.py` | `51abf2ca713c673bd0b030eae9de946755802e58bb0df6edabb0d55299d53fb5` | `CB(d, m)` closed-form scan, `n ≤ 1600` |
| `cb_scan.json` | `3d53953e0586aa9378a57111a41af78866f838063a4f799e0e25a6a9755dbb84` | 4,974 configurations, 3 rows |

- **Jobs.** No background job remains. The auto-backgrounded first scan (PID 4023, wrapper 4021) was killed by literal PID and
  verified gone, and none of its output is used (Disclosure 3).
- **Sealed members.** No sealed member was edited.
- **Deliverable.** `second-reads/SR-REACH/SECOND-READ.md` (this file).
