# Second Read

Reader `SR-TRN`, r29 (`erdos-993-math-dre-20260925-r29-high-tail-certification`), Cycle 1, isolated second read of
the top-rank companions S7, S8 and S9 (ids SR-5, SR-6, SR-7). Date 2026-09-25.

## Identity and seal audit

- **VerityOS boot.** I operated within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
  `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The subsystem loaded is `experiments/`, limited to this
  run's capsule.
- **Model disclosure (two-part).** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]
  - The chartered model and effort (Claude Opus 5.5, high) and the transport part come from the dispatch record.
  - The runtime id is quoted verbatim from my runtime's own report.
- **Dispatch.** `control/dispatch/c1-second-read/DISPATCH-SR-TRN.md`. The protocol `control/C1-SECOND-READ-PROTOCOL.md`
  and the brief `control/C1-SECOND-READ-BRIEF-SR-TRN.md` were read in full.
- **Capsule seal.** `control/c1-second-read/SR-TRN-PACKET-MANIFEST.json`:
  - I recomputed SHA-256 over the canonical JSON without `seal_sha256` (sort_keys, separators `(",", ":")`, no
    trailing newline). Result: `8c9b7f4800612773755ad475089299661e41a788488676dde6c9efd9454c6ac2`, which **matches**.
  - The ASCII-escaped and the raw-UTF-8 serialisations give the same digest.
  - **22/22** listed members match their SHA-256 and byte counts (`file_count` 22).
  - `PATH-CHECK-SR-TRN.json` reports 0 findings.
  - Instrument: `scratchpad/c1-sr-SR-TRN/seal_check.py`, output `seal_check.out`.
- **Read boundary.**
  - **Capsule members.** I read the parts of the listed capsule members that bear on S7–S9: the contracts, the synthesis
    (rulings 11, 13 and 14; R-TRN; the S-table; C1-LA4; the registrations; the SR table), C-T2-F A1–A5, C-T2-U A1–A2,
    the relevant lines of the F, T and U adjudications and C-U1-T, CF-T-1 and CF-T-2, `Main.lean` entries 1–14 and
    44–45, and the three `E993-R26-TOP-RANK-*` records in `CLAIM-IDENTITY.run-local.json`.
  - **Mathlib (read-only).** `SimpleGraph/Acyclic.lean` (lines 55–66 and 585–625), plus grep hits in `Bipartite.lean`
    and `Clique.lean`, all under the pinned shared project's `.lake/packages/mathlib`.
  - **Disclosures.**
    1. To locate that package I ran `ls` on `/Users/ashtonsperry/.local/share/verityos/lean/` and on the project root.
       This root is inside the PATH-CHECK's allowed roots, but it was a directory listing above the Mathlib package
       directory itself.
    2. The harness injected the repository `CLAUDE.md` and the user auto-memory index into my context at session start.
       I did not read them as a choice, and I relied on neither.
  - **Not used.**
    - No seat or critic instrument is listed in this capsule, so none was read or replayed. Every number below comes
      from my own instrument.
    - No `lake` or `lean` invocation, network access, install or background job.
    - No `find`, `grep` or `rg` was rooted above the grant.
    - No capsule member was edited.
- **Conversation logging.** Not performed. The dispatch fixes a single deliverable for this isolated seat.

## Statements read

- **SR-5 (S7).** For every finite simple graph `G`: `crossingIndex G + 2 ≤ indepNum G ∸ 1` (ℕ) ⇒ `4 ≤ indepNum G`. The
  brief asks what `Nonempty` is needed for.
- **SR-6 (S8).** The statement has three parts:
  - (a) no tree eligible at `p = α − 1` has `α = 4`, hence such trees have `α ≥ 5` and the guard is strict, with slack
    `α − 4 ≥ 1`;
  - (b) no bipartite graph eligible at the top rank has `α = 4`, and the brief asks whether this is proved or only
    checked;
  - (c) census facts, read as `bounded_computation`: "the smallest eligible trees have order 7 with `α = 5` (three
    trees)".
- **SR-7 (S9).** For every finite bipartite simple `G`: `crossingIndex G + 2 ≤ indepNum G ∸ 1` ⇒
  `C5LA1.aggregate G (indepNum G − 1) ≤ 0`, hence for every forest. The brief asks for three further checks:
  - the dependency chain;
  - whether the empty graph and graphs with isolates satisfy the hypothesis vacuously;
  - the r24 selector-collapse cross-check on my own tree census to order 10.

The frozen definitions are those of `SEMANTIC-CONTRACT.md` §1, checked against `Main.lean` entries 1–14:
- `x = C5LA1.crossingIndex = Nat.find (Δ_k(G) < 0)`;
- `Δ_k(G − D) = i_{k+1}(G − D) − i_k(G − D)` in ℤ, on the original carrier with deletion realised as avoidance;
- `aggregate` sums over `leafSet.filter (IsFavorableAt · p)`, with the term `Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v)`
  (ℕ `p − 1`);
- `IsGraphLeaf := ∃! u, Adj v u`, so isolates are not leaves.

## Independent re-derivation

**S7 (any finite simple graph).**
1. **ℕ step.**
   - If `α ≤ 1`, then `α ∸ 1 = 0` and `x + 2 ≤ 0` is false.
   - Otherwise `α ∸ 1 = α − 1`, and the hypothesis gives `α ≥ x + 3 ≥ 3`.
   - In either case, the hypothesis implies `α ≥ 3` and that the subtraction is honest.
   - The hypothesis is equivalent to the integer hypothesis `x + 2 ≤ α − 1` for **every** `α`: at `α ∈ {0, 1}` both
     are false.
2. **`n ≥ α`.** `exists_isNIndepSet_indepNum` (`Clique.lean:997`) gives an independent set of size `α` inside `V`. So
   `n ≥ α ≥ 3`, and in particular `n ≥ 1`.
3. **`Δ_0 = n − 1`.**
   - `i_0 = 1`, because only `∅` is a 0-set and it is independent.
   - `i_1 = n`, because a singleton is independent (`Adj` is irreflexive).
   - So `Δ_0(G) = n − 1`, which is `≥ 0` by step 2.
4. **`x ≥ 1`.** `Nat.find = 0` exactly when the predicate holds at `0`, that is, when `Δ_0 < 0`. That fails, so
   `x ≥ 1`.
5. **Conclusion.** `1 + 2 ≤ x + 2 ≤ α − 1`, so `α ≥ 4`. ∎
6. **What `Nonempty` is needed for: nothing.** The proof uses `n ≥ 1`, but only in step 3, and step 2 derives it from
   the hypothesis. The statement holds with no `Nonempty` hypothesis. On the empty vertex type, `α = 0`, so the
   hypothesis is false and the statement holds vacuously; my census's `n = 0` row confirms this.
7. **Sharpness.** S7 is **sharp** on general simple graphs, and this is new to the record.
   - `K_3 ∨ 4K_1` (order 7, 15 edges, non-bipartite) has `i = 1, 7, 6, 4, 1`, `α = 4` and `x = 1`. It is top-eligible
     (`3 ≤ 3`), and `S = 0` because it has no leaves (`witnesses.out`).
   - So the `α ≥ 5` improvement in S8 needs bipartiteness or the tree property.
   - No labelled graph of order ≤ 6 is top-eligible with `α = 4`. All 91 top-eligible graphs of order ≤ 6 have
     `α ∈ {5, 6}`, and all are bipartite.

**S8(a) (trees).**
1. S7 gives `α ≥ 4`. If `α = 4`, then `x ≤ 1`, and `x = 0` is excluded (S7, step 4), so `x = 1`. That means
   `Δ_1(T) < 0`, i.e. `i_2 < i_1 = n`.
2. **Why `n ≥ 5`.** A tree on `n ≥ 2` vertices has `n − 1 ≥ 1` edges, so `V` is not independent and `α ≤ n − 1`.
   Hence `α = 4` gives `n ≥ 5`.
3. On any simple graph, `i_2 = C(n,2) − e`, since a 2-set is independent iff it is a non-edge. A tree has `e = n − 1`.
   So, in ℤ, `2Δ_1 = n(n−1) − 2(n−1) − 2n = n² − 5n + 2`.
   - The roots are `(5 ± √17)/2 ≈ 0.44` and `4.56`, so `n² − 5n + 2 ≥ 2` for every `n ≥ 5`.
   - This must be computed in ℤ: the quadratic is negative at `n = 1..4`.
   - `C(n,2) − (n − 1)` is an honest ℕ subtraction for `n ≥ 1`.
4. So `Δ_1 ≥ 1`, which contradicts `x = 1`. Hence `α ≥ 5`.
5. The guard slack is `3(α − 1) − (2α + 1) = α − 4 ≥ 1`. It is computed in ℤ, or in ℕ once `α ≥ 4` makes it honest.
   So on (TRN)'s domain, `3p ≥ 2α + 2`.

**S8(b) (bipartite): PROVED, not only checked.**
- Let `G` be bipartite with `α = 4`. S7 again forces `x = 1`, so `e > C(n,2) − n = n(n−3)/2`.
- A bipartite graph has `e ≤ ⌊n²/4⌋`, and `n²/4 ≤ n(n−3)/2 ⟺ n ≥ 6`. So `n ≥ 6` gives `Δ_1 ≥ 0`, a contradiction.
- `n ≤ 3` is impossible, since `n ≥ α = 4`.
- `n = 4` with `α = 4` is edgeless: `Δ_1 = 6 − 4 = 2`.
- `n = 5`: `Δ_1 < 0` needs `e ≥ 6`. A bipartition `(a, 5 − a)` has `a(5 − a) ≤ 6`, with equality only for the complete
  `K_{2,3}`, whose `α = 3 ≠ 4`. (C-T2-U's route also works: at `α = 4` all edges meet the one vertex outside a maximum
  independent 4-set, so `e ≤ 4`.)
- Hence no top-eligible bipartite graph has `α = 4`, and with S7, **every top-eligible bipartite graph has `α ≥ 5`**.
  Connectivity and acyclicity are not used.
- **Bounded corroboration** (my instrument, `graph_census.py`, 2-colouring test, labelled):
  - Labelled bipartite counts by order 0–7 are `1, 1, 2, 7, 41, 376, 5177, 103237`.
  - Top-eligible: 91 at order 6 (`α`: 5 ×90, 6 ×1) and 11,677 at order 7 (`α`: 5 ×11,256, 6 ×420, 7 ×1). That is
    **11,768** labelled, minimum `α` 5.
  - Up to isomorphism (canonical form: the lexicographically least adjacency bit-string over all degree-class-preserving
    vertex permutations), they form 3 classes at order 6 and 23 classes at order 7.

**S8(c) (census, `bounded_computation`).**
- **Instrument.** My tree census, `trees.py` plus `tree_census.py`:
  - canonical form: the AHU parenthesis string rooted at the centre (minimum over the two centres of a bicentral tree);
  - every class passes an acyclicity-and-connectivity test (`is_tree`: `n − 1` edges, union-find with no cycle, one
    component);
  - class counts for orders 1–13 are `1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301`, matching A000055.
- **Results.**
  - Top-eligible tree classes by order 1–13: `0, 0, 0, 0, 0, 0, 4, 6, 27, 90, 217, 502, 1301`.
  - Cumulative: 846 through order 12 and 2,147 through order 13.
  - By `α`: `5: 3, 6: 135, 7: 700, 8: 832, 9: 380, 10: 85, 11: 11, 12: 1`. The `α = 5` and `α = 6` counts are complete,
    since a tree has `n ≤ 2α`.
  - 0 failures; maximum `S(T, α − 1) = −12`.
  - The Δ_1 identity and `n ≥ α + 1` hold on every class.
- **Order 7 has FOUR eligible trees, not three.**
  - The three `α = 5` trees:
    - the double claw, edges `01, 12, 13, 04, 45, 46`, `i = 1, 7, 15, 12, 5, 1`, `x = 2`, `S = −12`;
    - edges `01, 12, 13, 14, 05, 06`, `i = 1, 7, 15, 14, 6, 1`, `S = −16`;
    - edges `01, 12, 13, 14, 05, 56`, `i = 1, 7, 15, 13, 6, 1`, `S = −14`.
  - The star `K_{1,6}`, with `α = 6`, `x = 3` and `i = 1, 7, 15, 20, 15, 6, 1`.
  - The accurate census text is therefore: "the smallest order of a top-eligible tree is 7. The minimum eligible
    `α = 5` is attained by exactly three trees, all of order 7 (complete, since `α = 5` forces `n ≤ 10`). Order 7 has
    four eligible trees, the fourth being `K_{1,6}` (`α = 6`)."

**S9 (bipartite / forest).**
1. **Dependency chain.** It is exactly as briefed, and it matches the synthesis R-TRN and C1-LA4 LA4b:
   - S7, which uses no graph class, gives `α ≥ 4`;
   - so `p := α − 1 ≥ 3 ≥ 2` (honest ℕ subtraction), and `2α + 1 ≤ 3(α − 1) ⟺ α ≥ 4`;
   - then (HTA) (`p ≥ 1`) or entry 44 `E993Interior.bipartiteHighTailAggregate G hBip p (hp : 2 ≤ p) hTail`, read
     verbatim in `Main.lean`, gives `aggregate G (α − 1) ≤ 0`;
   - inside the aggregate, the ℕ `p − 1 = α − 2` is honest.
2. **What the tree hypothesis of (TRN) contributes.** Only `hBip`.
   - Mathlib `IsTree.isBipartite` (`Acyclic.lean:598`) is `⟨hG.coloringTwo⟩`, where `coloringTwo` uses
     `hG.connected.nonempty.some` (lines 595–596). So that Lean term routes through connectivity.
   - The acyclicity-only term is `IsAcyclic.isBipartite` (`:617`, via the `isAcyclic` field at `:63`).
   - Mathematically, connectivity is unused.
3. **Forest corollary.** Every `G.IsAcyclic` is bipartite by `:617`, so S9 covers forests. `IsBipartite` is
   `Colorable 2` (`Bipartite.lean:286`).
4. **Grade.** S9 is a composition of S7 with (HTA) or entry 44, so its grade is its weakest input's.
   - (HTA) is a `proved_informal` route result.
   - Entry 44 is compiled-internal and has no grade of its own (§4, §3.8).
   - So S9 is **`proved_informal`**. It becomes kernel-backed only if an award's face carries it as a companion.
5. **Vacuity.**
   - **Empty vertex type:** `α = 0`, so the hypothesis is false (vacuous).
   - **Edgeless graph `⊥` on `n` vertices:**
     - `α = n` and `x = ⌈n/2⌉`, since `C(n,k+1) < C(n,k) ⟺ k > (n−1)/2`;
     - so the hypothesis holds **non-vacuously iff `n ≥ 6`**;
     - there are no leaves, so `S = 0` (the empty sum) and the conclusion holds with equality;
     - checked for `n = 0..10` (`witnesses.out`).
   - **Graphs with isolates:** the hypothesis holds non-vacuously.
     - All 91 labelled eligible bipartite graphs of order 6 have an isolate, as do 6,609 of 11,677 at order 7.
     - Isolates are not leaves, so they contribute no summand, but they change `α` and `x`.
     - Example: the double claw plus `K_1` has `α = 6`, `x = 3`, is eligible, and has `S = −16`. The double claw plus
       `K_2` has `S = −28`, with every leaf, including those of the `K_2`, favorable.
   - **Maximum `S`.** On eligible labelled bipartite graphs to order 7 it is **0**, with 0 positive. So on the bipartite
     form `S = 0` is attained, and no strict inequality may travel to it. On trees the census maximum is −12.
6. **r24 cross-check.**
   - The claim: every leaf of a tree with `α ≥ 2` is strictly favorable at `p = α − 1`.
   - On my census: 963 leaf checks on trees of order ≤ 10 and 14,161 through order 13, with 0 failures.
   - On every top-eligible tree to order 13, the favorable set equals the leaf set (asserted in `tree_census.py`), so
     (TRN) is a full-leaf sum there.
   - Because r24's source is not in my capsule, the declaration name `C4LA1.topRankSelectorCollapse` and its exact text
     are taken on the record of CF-T-2 and the T adjudication (item 12). I checked the mathematics, not the declaration.
   - **Unregistered observation** (mine, STATED, for the controller's information only). A short argument gives the same
     collapse on any bipartite `G` with `α ≥ 3` and any vertex `v`. `F = G − v` is bipartite with
     `α(F) ∈ {α − 1, α}`. In the first case `Δ_{α−1}(F) = −i_{α−1}(F) < 0`. In the second, the addable set of an
     independent `(α−1)`-set induces a bipartite graph whose colour classes each have size ≤ 1. So
     `α·i_α(F) ≤ 2·i_{α−1}(F)`, which gives `i_α(F) < i_{α−1}(F)`. It checks with 0 failures over 755,696
     vertex-instances (labelled bipartite graphs of order ≤ 7, `α ≥ 3`; `vertex_favorable.py`). It is not needed for
     any verdict and is not proposed for registration.

## Findings and repairs

1. **SR-5 (S7).** Confirmed as stated. The registration text omits the brief's "(nonempty carrier)" qualifier. That
   answers the brief's question; it is not a repair, because the synthesis's S7 text carries no `Nonempty`.
   - The statement holds on every finite simple graph, including the empty vertex type, where it is vacuous.
   - `n ≥ 1` is used only for `Δ_0 = n − 1 ≥ 0`, and it is derived from `α ≥ 3` via `exists_isNIndepSet_indepNum`.
   - Record the sharpness witness `K_3 ∨ 4K_1`. It shows the bound `α ≥ 4` cannot be improved on general graphs.
   - Attribution: C-T2-U, F's adjudicator (result 6) and U's adjudicator (`topRankEligibleAlphaGeFour`). r26 prior art
     travels: `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT`'s registered text says "Ingredient: hEligible implies alpha >= 4
     since x >= 1 always", and I verified it in the frozen claim identity.
2. **SR-6 (S8).** Confirmed with repairs.
   - (a) and (b) are both **proved** (`proved_informal`). (b) is not merely checked: the F adjudicator's 11,768 figure
     is bounded corroboration, which I reproduce exactly.
   - (b) strengthens, using S7, to "every top-eligible bipartite graph has `α ≥ 5`".
   - **Repair (census wording).** "The smallest eligible trees have order 7 with `α = 5` (three trees)" omits the
     fourth order-7 eligible tree `K_{1,6}` (`α = 6`). The accurate text is given in the registration below.
   - The three `α = 5` trees and their `S` values (−12, −16, −14) agree with C-T2-U's list.
3. **SR-7 (S9).** Confirmed with repairs.
   - **Repair (grade on the face).** The scope note must state the bipartite/forest clause at **`proved_informal`**.
     Otherwise it may inherit the key's grade if C1-LA4 closes `formally_verified`. The clause is a composition with
     (HTA), and nothing kernel-checks it unless an award's face carries it as a companion; C-U1-T's and C-T2-U's scratch
     builds are not certificates (§3.8).
   - **Repair (no strictness).** On the bipartite form `S = 0` is attained (e.g. edgeless `⊥` on 6 vertices). No strict
     wording and no "maximum −12" may be attached to the bipartite clause.
   - **Repair (Lean citation).** Cite `IsAcyclic.isBipartite` (`Acyclic.lean:617`) for the forest corollary and for the
     tree's `hBip`. `IsTree.isBipartite` (`:598`) routes through `connected.nonempty`.
   - **Vacuity answer.** The empty vertex type is vacuous. `⊥` on `n ≥ 6` vertices and graphs with isolates satisfy the
     hypothesis non-vacuously, with conclusion `S = 0` when there are no leaves.
   - **r24 cross-check.** Confirmed as bounded computation to order 13 (963 leaf checks to order 10). It is cited by
     declaration name on the record only.
4. **Fences.**
   - §3.2: r26's award is not widened. Every note sits on the r29 key, and r26 remains the proof of record on the
     residual class; `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` is untouched.
   - §3.3: every statement here is at `p = α − 1` with `3p ≥ 2α + 2`, and nothing is said below the guard.
   - §3.1: no no-recovery or headline status moves.
   - §3.8: the scratch kernel builds are cited as context only.
5. **Key predicate.** `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` names a top-rank aggregate sign with no residual
   hypothesis, and (TRN) satisfies that predicate. The notes below add no content to the key's statement: the
   bipartite clause is labelled as a separate `proved_informal` observation. No new key is proposed.

## Registration text

Controller: register each block verbatim as a scope note on `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE`. None changes a
status, none is a new key, and none is part of any formal award unless an award's face carries it as a kernel-checked
companion.

**SR-5 — scope note (S7).**
- key: `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (scope note; status unchanged)
- statement: "For every finite simple graph G (no nonempty-carrier or other hypothesis), the ℕ top-rank eligibility
  crossingIndex G + 2 ≤ indepNum G ∸ 1 implies 4 ≤ indepNum G. Proof: truncation forces α ≥ 3 (the hypothesis is false
  for α ≤ 1 and equals the integer hypothesis for every α); an independent α-set gives n ≥ α ≥ 3; i_0 = 1 and i_1 = n
  give Δ_0(G) = n − 1 ≥ 0, so x ≥ 1 and α ≥ x + 3 ≥ 4. The bound is sharp on general graphs (K_3 ∨ 4K_1: α = 4, x = 1,
  eligible, not bipartite)."
- grade: `proved_informal`
- attribution: "C-T2-U; r29 F adjudicator (result 6); r29 U adjudicator (topRankEligibleAlphaGeFour); r26 prior art on
  the residual class (E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT: 'hEligible implies alpha >= 4 since x >= 1 always');
  second read SR-TRN (SR-5: confirmed; nonempty qualifier shown unnecessary; sharpness witness)."
- fences: "§3.1 no status transfer; §3.2 r26's awards not widened or re-registered; §3.3 top rank only."

**SR-6 — scope note (S8).**
- key: `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (scope note; status unchanged; not a new key)
- statement: "Every finite tree eligible at p = α − 1 has α ≥ 5 (α = 4 would need x = 1, i.e. 2Δ_1 = n² − 5n + 2 < 0,
  impossible for n ≥ 5, while a tree with α = 4 has n ≥ 5 because it has an edge); hence the high-tail guard holds
  strictly on (TRN)'s domain: 3(α − 1) − (2α + 1) = α − 4 ≥ 1. Every finite bipartite graph eligible at p = α − 1 also has
  α ≥ 5 (proved: with α = 4, x = 1 needs e > n(n − 3)/2, but e ≤ ⌊n²/4⌋ excludes n ≥ 6, n = 4 is edgeless, and n = 5
  needs K_{2,3}, whose α = 3). Census (bounded_computation, free trees to order 13 by AHU canonical form, A000055
  matched): the smallest order of a top-eligible tree is 7; the minimum eligible α = 5 is attained by exactly three
  trees, all of order 7, with S = −12, −14, −16 (complete, since α = 5 forces n ≤ 10); order 7 has four eligible trees,
  the fourth being K_{1,6} (α = 6). Labelled bipartite graphs to order 7: 11,768 top-eligible, minimum α 5."
- grade: `proved_informal` (the α ≥ 5 clauses); `bounded_computation` (the census sentences)
- attribution: "C-T2-F (A1: trees and the bipartite extension); C-T2-U (A2: trees, kernel-checked in scratch as
  tree_eligible_top_alpha_ge_five, not a certificate; bipartite extension); controller derivation CF-T-1 (trees); r26
  prior art on the residual class ('on the eligible class in fact alpha >= 5'); r29 F adjudicator (11,768 bipartite
  check); second read SR-TRN (SR-6: confirmed with repairs; census wording corrected to include K_{1,6})."
- fences: "§3.2 r26 unchanged; §3.3 a statement about the guard's strictness at the top rank, nothing below the
  guard; §3.8 scratch builds are not certificates."

**SR-7 — scope note (S9 and the r24 selector remark).**
- key: `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (scope note; status unchanged)
- statement: "The conclusion holds on every finite bipartite graph under the same ℕ hypothesis: if G.IsBipartite and
  crossingIndex G + 2 ≤ indepNum G ∸ 1 then C5LA1.aggregate G (indepNum G − 1) ≤ 0; hence on every forest
  (SimpleGraph.IsAcyclic.isBipartite, Mathlib Acyclic.lean:617). The terminal theorem is stated on trees; the tree
  hypothesis is consumed only through bipartiteness, and connectivity is unused. The hypothesis is vacuous on the empty
  vertex type and holds non-vacuously on graphs with isolates (e.g. the edgeless graph on n ≥ 6 vertices, where S = 0);
  on the bipartite form S = 0 is attained and no strict inequality is claimed. On trees with α ≥ 2 every leaf is
  favorable at p = α − 1 (r24 C4-LA1 published Lean package, declaration C4LA1.topRankSelectorCollapse, no registry
  key), so on trees (TRN) is a full-leaf sum."
- grade: `proved_informal` for the bipartite/forest clause (a composition of S7 with (HTA); it carries no formal grade
  from this key's award); the r24 selector remark carries r24's own standing, replayed here as `bounded_computation`
  (every tree of order ≤ 13, 0 failures).
- attribution: "C-T2-F (A3); C-T2-U; C-U1-T (bipartiteTopRankNonResidualAggregate, scratch, not a certificate); r29 F
  adjudicator; (HTA) proposal Codex (GPT-6 Astra) with r29 T1/T2 derivations; r24 C4-LA1 for the selector collapse
  (cited by declaration name only); second read SR-TRN (SR-7: confirmed with repairs: grade stated on the face, no
  strictness, IsAcyclic citation)."
- fences: "§3.1 no status transfer (not a no-recovery statement; FOREST, TREE, TRANSFER and Erdős #993 unchanged);
  §3.2 E993-R26-TOP-RANK-RESIDUAL-SIGN is not widened and remains the proof of record on the residual class; §3.3 top
  rank only, inside 3p ≥ 2α + 1; §3.8 scratch kernel builds are context only."

## Verdicts

verdict[SR-5]: confirmed
verdict[SR-6]: confirmed_with_repairs
verdict[SR-7]: confirmed_with_repairs

## Artifact inventory

Deliverable: `second-reads/SR-TRN/SECOND-READ.md` (this file).

Scratch: all files are under `scratchpad/c1-sr-SR-TRN/`, written by this reader. They use the Python standard library
and exact integers only, and ran in the foreground.

| File | SHA-256 | Role |
|---|---|---|
| `seal_check.py` | `86cfca205c98c1b93230012efe837c264891751925d5670d32a570b858019bbe` | seal and 22 digests |
| `seal_check.out` | `948cf8166f0628f45afdaa91c92f0c24ed6f24c7652ce20919536a9cca3ba6ea` | seal output |
| `core.py` | `7431c4b5c5f42f3b73c13dacfa0a87dfae3ec1c48e4d8196074a532442d742cf` | counts, Δ, x, leaves, H/R, selector, aggregate, 2-colouring, tree test |
| `trees.py` | `363d54ff0e04aa2b7d7bf53af7334e8f17063cd16fae625abb09271478f20bc7` | free trees by AHU centre canonical form |
| `tree_census.py` | `585c1bfa4117463f6d0efda8d147d4550a79a18d3860b238330644101df23e02` | tree census (S8a/c, TRN, r24 cross-check) |
| `tree_census_13.json` | `98ceb3264071b63a720450ee1192f3b6641948ae6a8b6fa3a9666f4fc95dee14` | census result, order ≤ 13 |
| `tree_census_13.out` | `f10553669e8fdf3e9c52c174a44ad738eac3912858f326c72d3bd9aa38d4b4c8` | census printout |
| `graph_census.py` | `60a84e1f2a39569a4324fd653a003e97cce92647d571ad696e312830aa074f54` | all labelled graphs ≤ 6 and bipartite ≤ 7 (S7, S8b, S9) |
| `graph_census_6_6.json` | `f6442e095b9dc7077ea99fa27a1821f0f878c39f627e3b1080885ec53686d247` | result (≤ 6) |
| `graph_census_6_7.json` | `0df6a1030e55838ec675dd7ef354e9467a9dbc33632e7ae59a832e6acdd2ab6c` | result (bipartite ≤ 7) |
| `witnesses.py` | `8556cf5cd0ea1532a13bb503087abbd09d96e0ef7917463fa16e8e2666d44c70` | `K_3 ∨ 4K_1`, edgeless graphs, isolate examples |
| `witnesses.out` | `27e7faa0dbd03ae5c02b5c2f55505a80961cb14f4b34451586f26a44a334c080` | witness output |
| `vertex_favorable.py` | `fc0757d3ac0afb2e770959baee1ec35ac8753955f6733e8d61e435eb62ad2bca` | unregistered side observation (all-vertex collapse, bipartite ≤ 7) |

No capsule member was edited. No seat or critic instrument was read or replayed, since none is listed in this capsule.
I reread this file before close.
