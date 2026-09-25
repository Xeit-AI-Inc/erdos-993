# Cycle 1 Route Allocation — r29 (certify the uniform high-tail mechanism and its non-residual top-rank consequence)

Controller: Claude Fable 5.1, 2026-09-25. Topology 4 routes / 8 critics / 3 adjudicators / 1 synthesis; routes Claude
Sonnet 5 xhigh, critics Claude Opus 5.5 medium, adjudicators/synthesis/Stage 7 Claude Opus 5.5 high (`AUTHORIZATION.md`).
The objects: the four targets of `SOLUTION-CONTRACT.md` §1–2 — (TSB) the tagged-shadow bound, (HTP) the pointwise high-tail
sign at every `p ≥ 1` with its aggregate corollary (HTA), (ELIG) the first-interior eligibility guard, (TRN) the
non-residual top-rank corollary — each to be certified as its OWN governed Lean award. This is an extraction run: the
mechanism and three of the four statements already exist as compiled internal lemmas inside the verified first-interior
package (`sources/first-interior/c2-primary-v2/`); the new mathematics is the `p = 1` endpoint, the registry-scope forms,
and the top-rank corollary's derivation. No route runs a broad search.

| Seat | Route | Object |
|---|---|---|
| `T1` | `C1-T-01 HIGH-TAIL-EXTRACTION-AND-ENDPOINT` | Targets 1–3: extract the existing proofs into statement-level informal proofs at REGISTRY scope; prove the `p = 1` endpoint; the compiled-internal vs awarded distinction table |
| `T2` | `C1-T-02 TOP-RANK-NONRESIDUAL-COROLLARY` | Target 4: exact statement, low-`α` audit, guard membership, informal proof; relation to r26; the scope notes; alias checks of the new keys |
| `F1` | `C1-F-01 HIGH-TAIL-FALSIFICATION-AND-BOUNDARY` | Attack all five statements on their literal hypotheses (own instrument; exhaustive horizons); the boundary record (is `3p ≥ 2α + 1` sharp on bipartite graphs? on trees?); registry-text vs Lean-text gaps |
| `U1` | `C1-U-01 LEAN-EXTRACTION-SKELETON` | Scratch project carrying the first-interior source byte-identically; the five §2 declarations compiled sorry-free; the exact dependency diagram; draft contracts for four awards; registrar/carry plan |

## Standing state entering Cycle 1

Master registry 407 identities (`sources/authority/`; `control/CLAIM-IDENTITY.run-local.json` identical at Stage 2);
public `main` `713f0df`. The three auxiliary keys `E993-BIPARTITE-TAGGED-SHADOW-BOUND`,
`E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE`, `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` are OPEN (`formal_award: false`;
certificate "OPEN proposal only; independent Sol high scope audit approved exact identity" — `sources/first-interior/records/C2-SCOPE-AUDIT.md`).
`E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` is VERIFIED `formally_verified` (award `E993Interior.firstInteriorAggregate`,
Main.lean `8d864da2…`, 45 registrar entries; entries 41–44 are the mechanism's compiled internal lemmas — context, never
certificates). `E993-R26-TOP-RANK-RESIDUAL-SIGN` is VERIFIED (r26 award `R26LA1.topRankResidualSign`; its definition layer
entries 1–14 is byte-identical to the first-interior source's). `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (all eligible
ranks) is OPEN. Codex's `FINAL-ANALYSIS.md` (`sources/first-interior/records/`) records the high-tail calculation
("for `p ≥ 2` the leafwise argument works when `3p ≥ 2α(G) + 1` on any finite bipartite `G`, without favorability or
residuality"), the `p = 1` gap, the top-rank corollary "supported informally", and the three next needs this run answers.
The controller's pre-run instrument (`control/controller-prerun/ht_check.py`, `ht_report.json`) found no failure of any
target on bipartite graphs to order 6 or trees to order 12 — a prior, not evidence. The r28 refutation of Hall/SDR slot
dominance and the fresh r27 review (`sources/public-docs/r27-fresh-review-2026-09-25.md`) are context: neither mechanism
is available here (fence §3.5).

## Mechanism fingerprints and load-bearing obligations

1. **T1 `HIGH-TAIL-EXTRACTION-AND-ENDPOINT`.** (a) Read the frozen source (`Main.lean`, entries 18, 41, 42, 43, 44 and
   the definition layer 1–17) and write the EXACT dependency diagram: for each internal lemma, its statement, its
   `private` helpers, and where `p ≥ 2` / `1 ≤ k` / the `U`-relative cap `hcap` / `IsBipartite` / `IsTree` enter (name the
   line). (b) Derive the REGISTRY form of (TSB) from the internal `taggedShadowBound`: `U = univ`, `a = α(H)`, `hcap` from
   `IsIndepSet.card_le_indepNum`, the `k ≤ a` clause and the ℤ cast; state the companion identity
   `q_j(H, W) = i_j(H) − i_j(H − W)` and prove it (it is `tagged_count_split` at `D = ∅`, `E = W`). (c) Prove the `p = 1`
   endpoint of (HTP) with every hypothesis named: from the guard `2α + 1 ≤ 3`, `α ≤ 1`; the leaf `v` gives `α ≥ 1`; a
   bipartite graph with `α = 1` has `n ≤ 2` (two vertices of one colour class are non-adjacent — where exactly does
   bipartiteness enter?); so `V = {v, s}`, `H_v = R_v = V` as deletion sets, term `0`. Also prove the general `p = 1`
   formula `term = deg_G(s) − 1` on ANY graph with a leaf (so the endpoint is true only because the guard forces `K_2`)
   and say so on the face. (d) Write candidate statement-level informal proofs for (TSB), (HTP) at every `p ≥ 1` (the
   `p ≥ 2` body from the source, re-derived in prose: `k = p − 1`, `H = G − {v, s}`, `W` inside `univ ∖ H`,
   `α(H) ≤ α(G) − 1` via `leaf_indep_cap`, `2(α − 1 − k) ≤ k` from the guard, zero counts above `α − 1`), (HTA) at every
   `p ≥ 1`, and (ELIG) (extract entry 43's proof: the three low-`α` exclusions with the exact identities `i_2(T) = C(n,2) − (n−1)`,
   `Δ_2` inclusion–exclusion, the `n ∈ {7, 8}` cover bounds — recompute every number). (e) The distinction table: for
   each of the four targets, the compiled internal declaration (if any), its hypotheses, the registry statement, the gap,
   and what the award must add. (f) Fixed points BEFORE any table: `K_2`, `P_3`, `K_{1,m}` (SEMANTIC-CONTRACT §2).
2. **T2 `TOP-RANK-NONRESIDUAL-COROLLARY`.** (a) The exact statement (SOLUTION-CONTRACT §2 `topRankNonResidualAggregate`)
   and its informal proof: the ℕ hypothesis `x + 2 ≤ α − 1` forces `α ≥ 3`; `α = 3` forces `x = 0`, contradicting
   `Δ_0(T) = n − 1 ≥ 0` (a tree with `α ≥ 3` has `n ≥ 4`; where does `IsTree` — connectivity vs acyclicity — enter? only
   `Nonempty`/`n ≥ 2` is needed here: say so); hence `α ≥ 4`, `p = α − 1 ≥ 3 ≥ 2`, and `3(α − 1) ≥ 2α + 1 ⟺ α ≥ 4`; then
   (HTA) (or the internal `bipartiteHighTailAggregate` at `p ≥ 2`) with `hT.isBipartite`. (b) Low-`α` audit by
   exhaustive census on all trees to order ≥ 14 (own instrument, canonical form, A000055 reconciled): the eligible set at
   `p = α − 1` per order and per `α` (smallest eligible tree; which `α` occur; exact `S` values; non-vacuity witnesses
   with the favorable set listed); confirm no eligible tree has `α ≤ 3`. (c) The relation to r26: list
   `topRankResidualSign`'s four hypotheses and show which are dropped (`2 ≤ α`, the residual (★)); state that the
   mechanism differs (tagged shadow vs the (RI)/(RC) budget), that the conclusion is identical, and write the scope-note
   text for `E993-R26-TOP-RANK-RESIDUAL-SIGN` (status unchanged; r26 stays the proof of record on the residual class).
   (d) The region scope note for `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`: (HTA) closes it for every eligible `p` with
   `3p ≥ 2α + 1` (trees are bipartite; eligibility not even needed), so the remaining open region is exactly
   `x + 2 ≤ p`, `3p < 2α + 1` — state it precisely, do NOT attack it (fence §3.3). (e) Alias check of the new keys
   `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` and `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` lexically and mathematically
   against `E993-R26-*`, `E993-R24-*` (`TOP-RANK-SELECTOR-COLLAPSE`), `E993-R23-*`, `E993-BETA-*`,
   `E993-INTERIOR-*`; write the candidate registry entries (statement, scope, aliases, fences). (f) A draft
   `THEOREM-CONTRACT.yaml` for LA4 (definitions by exact `lean_name`; the ℕ-hypothesis equivalence text).
3. **F1 `HIGH-TAIL-FALSIFICATION-AND-BOUNDARY`.** (a) Your OWN instrument from SEMANTIC-CONTRACT §1 (do not copy the
   controller's `ht_check.py`; read it only to reconcile counts at the end): independent-set counts by subset enumeration
   or a DP, exact integers, canonical forms named as such. (b) Exhaustive attacks: (TSB) on every bipartite graph to
   order 7 (labelled, or up to isomorphism with class counts stated), every `W`, every `1 ≤ k ≤ a` — and report what
   happens for `k > a` (the companion) and `W = ∅`; (HTP) on every bipartite graph to order 7–8 and every tree to order
   ≥ 14 for every leaf and every `p ≥ 1` with `3p ≥ 2α + 1`, `p = 1` included; (HTA) likewise; (ELIG) and (TRN) on
   every tree to order ≥ 16 (eligible sets, exact `S`); adversarial families (stars, spiders, double brooms, caterpillars,
   matchings with pendant leaves, disconnected unions with isolates) to large orders by formulas or a DP. (c) The
   BOUNDARY: for bipartite graphs and, separately, for TREES: the smallest order with a POSITIVE leaf term at
   `3p = 2α`; at `3p = 2α − 1`; for each `α` to the horizon, the largest `p` at which some tree has a positive term (the
   true pointwise threshold on trees vs the guard) — deliver the table; if the guard is sharp on trees, the minimal
   witness with exact counts (a boundary RECORD, §1 Tier 2; refutes nothing in scope). (d) Literal-hypothesis attacks:
   `IsGraphLeaf` on a `K_2` component; a leaf whose support has degree 1 (`deg s = 1`) at `p = 1` and `p ≥ 2`; isolates;
   `α(H_v) < α(G) − 1` cases; the ℕ hypotheses at `α < 2`; `p − 1` at `p = 1`; the registry text "1 ≤ k ≤ a" vs a Lean
   text without `k ≤ a`. (e) Mechanism-equivalence: (HTP) vs the REFUTED `E993-BETA-TARGET` (governed all-window `(β)`):
   check the registered refutation witnesses of the unrestricted pointwise sign lie in `3p < 2α + 1` (consistency, not
   evidence); (TSB) vs the REFUTED `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` (≤ `r` addable vertices): exhibit where
   `2(a − k)` addable vertices are attained and `r` is exceeded — they are different statements; say why. (f) Reconcile
   with the controller's prior at the end (counts per order) and report every discrepancy.
4. **U1 `LEAN-EXTRACTION-SKELETON`.** In a scratch project pinned at the run's toolchain (`scratchpad/c1-U1/LeanProject`
   seeded from the byte-copied `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean` of
   `sources/first-interior/c2-primary-v2/LeanProject/`; MANUAL SYMLINK of `.lake/packages`; verify the Mathlib revision
   against `sources/mathlib-binding/PIN.json`; `cd` into the project before any `lake`/`lean`): (a) carry `Main.lean`
   byte-identically (all 45 entries) and append, in a NEW namespace `E993HighTail`, the five §2 declarations:
   `bipartiteTaggedShadowBound` (registry scope; ℤ), the `p = 1` endpoint lemma(s) (`indepNum = 1 ∧ IsBipartite ⇒
   card V ≤ 2`; the `deg s − 1` formula or a direct argument), `bipartiteLeafHighTailPointwise` (`p ≥ 1`),
   `bipartiteHighTailAggregateAllRanks` (`p ≥ 1`), `interiorEligibilityAlphaGeSeven` (keyword re-export),
   `topRankNonResidualAggregate`; compile sorry-free (`lake build` in the foreground); `#print axioms` on each. (b) The
   exact dependency diagram: each new declaration → the entries (by number, name and fragment digest from
   `FORMALIZATION-STATE.json`) and Mathlib lemmas (pinned file:line) it uses; which `private` helpers each award needs
   (private declarations are visible within one file — confirm by compiling, and state whether the terminal theorem of
   LA4 may call `E993Interior.Guard.delta_zero_nonneg`/`order_ge_alpha_succ`, or whether a public re-statement is
   cleaner). (c) The registrar/carry plan for FOUR separate award projects: which fragments each carries
   (`sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Snippets/…`), in what order (definitions before lemmas;
   one terminal `theorem`; the name regex rejects a trailing prime), and the exact `expected_statement` text for each
   (namespace-relative, from `theorem` to before ` :=`). (d) Draft `THEOREM-CONTRACT.yaml` for LA1–LA3 (T2 drafts LA4):
   definitions by exact `lean_name`, hypotheses with the ℕ/ℤ equivalence text, dependency graph, permitted axioms. (e)
   Report every `sorry` by name if any node blocks, with the smallest blocking statement.

## Shared rules (binding on every route)

- Statement-level derivations; every hypothesis (`IsBipartite`, `IsTree` — connectivity and acyclicity separately,
  finiteness, `1 ≤ k`, `k ≤ a`, `p ≥ 1`, `p ≥ 2`, the guard) named where it enters; every ℕ-subtraction (`a − k`, `p − 1`,
  `α − 1`, `α − 2`) guarded or cast, and the guard named.
- Fences §3.3–3.5: the lower region `3p < 2α + 1` is not attacked; the census values, the r27 root correction and the
  Hall/SDR route do not appear in any proof.
- The compiled internal lemmas inside the first-interior package are CONTEXT, never certificates: a route cites them by
  entry number and digest and says "compiled internal, unawarded" (fence §3.8).
- Every numeric claim: own instrument, standard library, exact integers, digest, copy-out-first replay under
  `scratchpad/c1-<seat>-replay/`; trees pass an acyclicity-and-connectivity test; bipartite graphs pass a 2-colouring
  test in code; counts up to isomorphism by a canonical form named as such; `x`, `Δ_k`, `α` and the graph on every row.
- `headline_resolved: no` this cycle (the headline is all four targets FORMALLY VERIFIED — Stage 7's, never a route's);
  one typed route verdict.
