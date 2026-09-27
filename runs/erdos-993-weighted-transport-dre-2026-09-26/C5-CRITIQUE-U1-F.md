# Critique

Critic `C-U1-F` (orientation F, falsify), r30 Cycle 5 Stage 4, on the return of seat `U1` (route `C5-U-01 LEAN-CLAW-NM-AND-GK-TREE-LAYER`,
orientation U). Run `erdos-993-math-dre-20260926-r30-weighted-transport`. Date 2026-09-27.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full. I opened no other VerityOS file. The host put the project
`CLAUDE.md` and the user memory index into context at session start. I did not open either one or act on it, and I kept no conversation log
(writes are restricted to my critique path and my scratch).

**Model disclosure (two parts):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read boundary.** I read the dispatch `control/dispatch/c5-stage4/DISPATCH-C-U1-F.md` (SHA-256 `63eddd54…30c5`, verified before
following it). I read the capsule manifest and its 14 members only. Those members are the protocol, the common brief, my seat's section of the attack briefs (lines 1–19
and 115–136), both contracts, the allocation, the Stage 1 gate, `SOURCE-DIGESTS.json`, the Stage 2/3/4 manifests, the Stage 3
read-boundary disclosures, `PATH-CHECK-U1.json` and the U1 return. I also read U1's inventoried artifacts under `scratchpad/c5-U1/`, as a
single-level `ls` of that directory and its `LeanProject` and `.lake` (names only), then copied them out. Under `sources/` I read
`sources/first-interior/c2-primary-v2/LeanProject/` (Main.lean and four seed files) and `sources/mathlib-binding/PIN.json`, plus one
names-only `ls` of `sources/c4-stage7-sources/`. I ran one targeted `grep` inside one Mathlib file
(`Mathlib/Combinatorics/SimpleGraph/Clique.lean`) for API names. Every other `grep` ran on files I had copied into my own scratch or on
capsule members named explicitly. I did not read any other return, critique, adjudication, `runs/`, `second-reads/`, registry or other
root. I used no network and installed nothing. I started no background job.

## Identity and seal audit

- **Capsule seal** `U1-PACKET-MANIFEST.json`: recomputed SHA-256 of the canonical JSON (the manifest minus `seal_sha256`,
  `sort_keys`, separators `(",", ":")`, no trailing newline) = `79e10b9480265280e7a8ccec911b39ffc6466fd28bf976bf8bfd4f94e8dcc6a5`. It
  **matches**. All 14 members match on bytes and SHA-256.
- **Stage 4 dispatch seal** `C5-STAGE4-DISPATCH-MANIFEST.json`: recomputed = recorded
  `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d`.
- **Stage 3 seal** `C5-STAGE3-PACKET-MANIFEST.json`: recomputed = recorded
  `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58`.
- **Stage 2 seal** `C5-STAGE2-PACKET-MANIFEST.json`: recomputed = recorded
  `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289`. This agrees with the common brief and with U1's return, and
  `file_count` 1400 equals `len(files)` 1400. **Controller-record discrepancy:** `C5-CRITIC-PROTOCOL.md` duty 1 quotes the Stage 2
  seal as `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`, which is not the Stage 2 seal of this cycle. It is probably
  clone residue from an earlier cycle's protocol, a candidate for R30-E-h's class. I used the recomputed value, which matches the
  common brief. This is not the seat's fault.
- **Digests the return lists.** I recomputed all seven artifacts in my copy-out and all match: `lakefile.toml` `45d0ca58…`,
  `lake-manifest.json` `52a4d73c…`, `lean-toolchain` `2bdc48ad…`, `LeanProof.lean` `f4dfdef8…`, full `Main.lean` `05c24dda…` (3229
  lines), `gk_tree_layer.py` `d5dc3200…`, and the first 2956 lines of `Main.lean` = `66db6c73ad8f0dbe58dfdf31bf6a5d0b50e3f33459ca08f89ba372cc9ca979bf`.
  That prefix matches the `66db6c73…` of Stage 1 gate ruling 40. The C4-LA1 award directory is not in my grant, so I verified the
  prefix against the ruling's digest prefix and not against the award's file. The four seed files are byte-identical to
  `sources/first-interior/c2-primary-v2/LeanProject/`'s. The Mathlib rev in `lakefile.toml` equals `PIN.json`'s `905b9581…`. U1's
  `DISPATCH-U1.md` digest (`ef28f198…`) is outside my grant and I did not verify it.
- **Carried definitions (byte-compare).** Using the `VERITYOS ENTRY` markers, all 14 entries shared with the first-interior source
  are byte-identical in body, header digest and body hash: C4LA1 entries 1–4, C5LA1 `support`/`leafSet`/`H`/`R`/`indepSetsAvoiding`/
  `indepSetCount`/`forwardDifferenceDel`/`aggregate`, `E993Interior.taggedFamily`, and `highTailAggregateFromShadow`.
  `C5LA1.crossingIndex` (entry 14) is **not carried** in U1's file (see Remaining obligation).
- **Process (note only).** U1 disclosed two names-only `ls` above its literal grant and a `find` inside Mathlib, as the Stage 3
  disclosures record. The return also contradicts itself. It says "no member under `sources/` was read", but `## Runtime hygiene` says
  the Mathlib rev "was verified against `sources/mathlib-binding/PIN.json`". This is a read-record inconsistency with no effect on the
  mathematics.

## Independent re-derivation

**Lean rebuild (copy-out-first).** I copied U1's five project files into `scratchpad/c5-crit-U1-F/LeanProject/` and bound
`.lake/packages` by manual symlink to the shared `mathlib-v4.32.2-project`. I ran `cd` into the project and then `lake build` in the
foreground. There was no `lake update` and no `lake clean`. Result: `Build completed successfully (8657 jobs)`, `LeanProof.Main` built in 12 s. The one diagnostic is a
linter suggestion at line 758, inside C4-LA1's frozen text. There were no `sorry` warnings and no errors. The appended region (lines 2957–3229) contains no
`sorry`, `admit`, `native_decide`, `decide`, `axiom`, `unsafe`, `implemented_by`, `extern` or `set_option`. `Check.lean` (`0a824518…`)
gives these results:

- `gkGraph_isTree : ∀ (k : ℕ), (gkGraph k).IsTree`. This is general in `k` with no hypotheses. It uses Mathlib's `SimpleGraph.IsTree`,
  which `#print` shows is a structure with fields `connected` and `isAcyclic`. My `example` extracts `Connected ∧ IsAcyclic` through
  `SimpleGraph.isTree_iff`, and it type-checks.
- `#print axioms gkGraph_isTree` → `[propext, Classical.choice, Quot.sound]`. `gkChildEdge_range` and `gkGraph_card_nonroot` give the
  same list. `gkGraph_connected`, `gkGraph_reachable_zero`, `gkGraph_adj_parent`, `gkChildEdge_injective`, `gkParentVal_lt`,
  `gkParentVal_le`, `gkGraph_adj_zero_one`, `gkGraph_adj_arm_tip` and `gkParentVal_at_arm_tip` give `[propext, Quot.sound]`.
  C4-LA1's `gk_deletionSaturatingFlow_of_rank_ge` gives `[propext, Classical.choice, Quot.sound]`.
- Proof reading. Connectivity uses explicit walks of length ≤ 3 from `0`, with the case split guarded by `omega` from `v.val < 3k+5`.
  The tree property comes from `isTree_iff_connected_and_card` plus a child→parent `Sym2` map. That map is injective because
  `gkParentVal` strictly decreases, and its range equals `edgeSet` by a case analysis over the seven `gkGraph_adj_iff_val` patterns. So
  there are `3k+4` edges on `3k+5` vertices. The proof is uniform in `k` and uses no enumeration. `gkGraph` and `gkEdge` are C4-LA1's entries 22–23, inside the byte-identical prefix.
  I count **26** new declarations, which matches the return's list.

**Python replay (copy-out-first).** `python3 -B gk_tree_layer.py` in my scratch reproduced `ALL_OK True` and
`RESULT_SHA256 60f1b4cf2414e933376a2a5819bc8ad738b0f883412597a9998e0d223e6f2f70` byte-identically. Its `gk_edges` is C4-LA1's `gkEdge`
literally, and its `crossing_index` scans through rank `α` with the zero-extension difference included.

**My own instrument** (`inst/gk_crit.py`, `c87725c8…`, standard library, exact integers):

- It builds the literal edge list and runs a tree test (BFS connectivity, DFS parent-tracking acyclicity, `|E| = n − 1`).
- It computes the independence polynomial with an independently coded rooted DP.
- For `n ≤ 20` (`k ≤ 5`) it also enumerates all subsets by brute force.
- It computes `x` as `Nat.find` of `Δ_j < 0` with zero extension, and asserts `i_0 = 1`, `i_1 = n`, `i_2 = C(n,2) − (n−1)` and `α = 2k+3`.

It reproduces the instrument fixed points: `K_{1,12}` (n 13, α 12, x 6), path-star `(2,3,4)` (n 15, α 11, x 5), and `(2,2,4,3)` (n 18,
α 13, x 6). For `k = 0..400` (`gk_crit_400.out`, `f59ecdfc…`, row digest `fbc224c5…`): every `G_k` is a tree, `α = 2k+3`,
`8·Δ_{k+1} = −2^k(k²+3k−8)` for every `k ≥ 1`, and `x(G_k) = k+1` for every `k = 2..400`. The only exceptions are `x(G_0) = 2` and
`x(G_1) = 3`. This is a second, independent instrument for U1's bounded record. The transport network (weights, relation, `F_p`,
`supply − capacity = S`) does not enter U1's object, so those fidelity checks are N/A. U1 asserts no weight, relation or aggregate
number.

**The step U1 left open: a proof of `x(G_k) = k+1` for every `k ≥ 2` (critic-derived, attributed to `C-U1-F`; STATED at a review
stage, `proved_informal` candidate pending an isolated second read).**

*Lemma (C-U1-F).* For every `k ≥ 0` and every `0 ≤ j ≤ k`, `Δ_j(G_k) = i_{j+1}(G_k) − i_j(G_k) ≥ 0`. Also, for every `k ≥ 1`,
`Δ_{k+1}(G_k) = −2^{k−3}(k²+3k−8)`. Hence `x(G_k) = k+1` for every `k ≥ 2`, and `x(G_k) ≥ k+1` for every `k ≥ 0`.

*Proof.* The polynomial is `I(G_k) = (1+y)Q^{k+1} + y(1+y)²(1+2y)^k` with `Q = 1+3y+y²`. Rooting at `0` gives this directly: if `0` is
excluded, the pieces are `K_1`, the cherry `K_{1,2}` and `k` copies of `P_3`. If `0` is included, the pieces are `{3,4}` and `k` copies
of `K_2`. So `I = (1+y)U` with `U = Q^{k+1} + y(1+y)(1+2y)^k`. Therefore `Δ_{m−1} = p_m − p_{m−1} = u_m − u_{m−2}`, and it suffices to
show `u_m ≥ u_{m−2}` for `1 ≤ m ≤ k+1`. Expand both pieces in binomial rows:

- `Q = (1+y)² + y` gives `Q^{k+1} = Σ_{i=0}^{k+1} C(k+1,i) y^i (1+y)^{2(k+1−i)}`. Every row is symmetric about `k+1`.
- `1+2y = (1+y) + y` gives `y(1+y)(1+2y)^k = Σ_{l=0}^{k} C(k,l) y^{l+1}(1+y)^{k−l+1}`.

Write `E(N,t) = C(N,t) − C(N,t−2)`. Fix `m ≤ k+1`. The `i = 0` row contributes `E(2k+2, m) ≥ 0` because `m ≤ k+1`. Pair row `i = l+1`
with row `l` of the second sum, and set `M = k−l` and `t = m−l−1 ≤ M`. The pair contributes
`C(k+1,l+1)E(2M,t) + C(k,l)E(M+1,t) ≥ C(k,l)·h(M,t)`, where `h(M,t) = E(2M,t) + E(M+1,t)`. This step uses `C(k+1,l+1) ≥ C(k,l)` and
`E(2M,t) ≥ 0` for `t ≤ M`. It remains to show `h(M,t) ≥ 0` for `0 ≤ t ≤ M`.

- If `t ≤ 1`, then `h ≥ 0` trivially.
- If `2 ≤ t ≤ (M+3)/2`, then `E(M+1,t) ≥ 0`, since `t(t−1) ≤ (M−t+3)(M−t+2)`.
- Otherwise `(M+3)/2 < t ≤ M`, which forces `M ≥ 3` and `t−2 ≥ M/2`. Then:
  - `E(2M,t) = C(2M,t)[1 − t(t−1)/((2M−t+2)(2M−t+1))] ≥ C(2M,t)(4M+2)/((M+1)(M+2))`, because the bracket's subtrahend increases in `t`
    and is largest at `t = M`.
  - `C(2M,t) ≥ C(2M,t−2) ≥ C(M+1,t−2)·(2M/(M+1))^{t−2}`, using factor-wise `(2M−u)/(M+1−u) ≥ 2M/(M+1)`.
  - `(2M/(M+1))^{t−2} ≥ (3/2)^{M/2} ≥ (M+2)/3 ≥ (M+1)(M+2)/(4M+2)`. The middle inequality holds by induction from `M = 3`, since
    `√(3/2) > 6/5 ≥ (M+3)/(M+2)`.
  - Together these give `E(2M,t) ≥ C(M+1,t−2) ≥ −E(M+1,t)`.

That proves the first claim. For `Δ_{k+1}`: `(1+y)Q^{k+1}` is palindromic of degree `2k+3`, so its coefficients at `k+1` and `k+2` are
equal. Hence `Δ_{k+1} = β_{k+1} − β_k`, where `β = [(1+y)²(1+2y)^k]`, so
`Δ_{k+1} = (2^{k+1} + k2^{k−1}) − (2^k + k2^k + C(k,2)2^{k−2}) = −2^{k−3}(k²+3k−8)`. This is negative if and only if `k ≥ 2`. ∎ This is
also an independent proof of the closed form on the eligibility key's face.

*Exact checks* (`inst/gk_monotone_check.py`, `4ce6d706…`, exact integers and `Fraction`; `ALL True`):

- Both binomial-row decompositions and `I = (1+y)U` hold as polynomial identities against the tree DP for `k = 0..40`.
- `u_m ≥ u_{m−2}` for `1 ≤ m ≤ k+1` and `Δ_j ≥ 0` for `j ≤ k` hold for `k = 0..40`.
- `h(M,t) ≥ 0` holds for all `0 ≤ t ≤ M ≤ 600`.
- Every link of the analytic chain holds exactly for `3 ≤ M ≤ 600`.
- The induction base and step hold.

The checks corroborate the proof. They do not replace it.

*Lean corollary check (critic-authored, compiled scratch, no grade).* `LeanProject/Corollary.lean` (`32ac25a1…`) imports U1's
`Main`. Its lines 3–40 are entry 14 (`C5LA1.crossingIndex`), byte-identical to the first-interior source's lines 210–247 (compared in
code). It proves two theorems:

- `gk_weightedHall_flow_of_crossing_lower (k p) (hx : k+1 ≤ crossingIndex (gkGraph k)) (hElig : crossingIndex (gkGraph k) + 2 ≤ p)
  (_hLow : 3p < 2·indepNum + 1) : ∃ f, IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f`. The proof applies C4-LA1's
  terminal theorem to `F_p ⊆ leafSet`.
- `gk_crossing_lower_iff : k+1 ≤ crossingIndex (gkGraph k) ↔ ∀ j ≤ k, ¬ Δ_j(G_k) < 0`.

Both give `[propext, Classical.choice, Quot.sound]`, with no warnings. So the `G_k` (HALL) corollary at every eligible rank needs
exactly one more Lean node: `hx`, which is the lemma above. `indepNum` is not on the critical path, because `hLow` is unused.
`gkGraph_isTree` supplies the tree face.

## Attacks and findings

1. **`gkGraph_isTree` survives.** It is stated over the carried `gkGraph` (prefix byte-identical) with Mathlib's `IsTree`. There is no
   hypothesis, no enumeration step and no ℕ-subtraction hazard: every `n−1`, `(n−5)/3` and `(n−5)%3` sits under a branch guard
   discharged by `omega`. The injectivity argument (`v = parent w` and `w = parent v` contradict strict decrease) is sound. Retained at
   `compiled` (scratch). U1 claims no more than that, which is correct under SOLUTION-CONTRACT §4.
2. **CD-1 "type-checks": unbacked, struck.** The return says the T adjudicator's draft statement elaborates against "`clawRank`,
   `clawLayer`, `clawShadow`". No shipped file contains any `claw` declaration: `grep -c claw` on the shipped `Main.lean` returns
   `0`. The check file was deleted. So the claw-product definition layer does not exist in any
   inventoried artifact, and the elaboration claim cannot be replayed. The brief asks whether the poset is defined in Lean. On the
   shipped evidence it is not. I also cannot judge exact scope (`q_i ≥ 1`, covers `L_k → L_{k−1}`, SR-C4-5's guards), because no
   statement text is shipped. The key `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` stays `proved_informal` and gains nothing
   from this return.
3. **"`crossingIndex = k+1` is supplied informally" (§6): unbacked, struck.** The allocation required an informal proof first. The
   return offers only the closed form plus a bounded scan to `k = 400`, and its Remaining obligation item 2 calls "the closed-form
   polynomial of this return" "the informal proof". A closed form with a finite scan does not prove `Δ_j ≥ 0` for all `j ≤ k` and all
   `k`, and tree independence sequences are not known to be unimodal. So even `Δ_k ≥ 0` alone would not suffice. The attack brief's
   framing ("`Δ_k ≥ 0`, the missing half") understates this in the same way. The needed statement is `Δ_j ≥ 0` for every `j ≤ k`. I supply
   it above as a critic-derived advance.
4. **Index mislabels in the numeric table and the `k = 1` note (literals corrected; values right).** The column headed
   `Δ_{k+1} = i_{k+2} − i_{k+1}` writes its entries as `i_{k+1} − i_k`. The numbers are really `Δ_{k+1}`:
   - `k=1`: `22−21 = i_3 − i_2`
   - `k=2`: `87−88 = i_4 − i_3`
   - `k=3`: `367−377 = i_5 − i_4`
   - `k=5`: `7391−7519 = i_7 − i_6`
   - `k=10`: `17508787−17524403 = i_{12} − i_{11}`

   These come from my DP, e.g. `I(G_2) = 1, 11, 45, 88, 87, 43`. Item 4's "`Δ_1(G_1) = i_2 − i_1 = +1`, rank 1 is an ascent" is wrong
   on its face: `Δ_1(G_1) = 21 − 8 = 13`. The `+1` is `Δ_2(G_1) = i_3 − i_2`, and it is rank `k+1 = 2` that is not a descent. The
   conclusion `x(G_1) = 3` stands.
5. **Axiom-list literal.** "Every declaration built along the way … same axiom list" is inaccurate. Nine of the helpers I checked depend
   on `[propext, Quot.sound]` only. This is a strict subset of the permitted three, so there is no soundness consequence, but the
   literal is corrected.
6. **Two-instrument claim, k = 41..400.** On that range U1's generic DP was not run, so `x = k+1` rested on the closed form alone. The
   `8·Δ_{k+1}` cross-check touches only the rank-`(k+1)` descent, not `Δ_j ≥ 0` for `j ≤ k`. My independent DP now covers `k = 0..400`,
   so the bounded record has two instruments. After the lemma it is superseded in kind anyway.
7. **Alias-check literal.** "14 hits, listed and read in full above": only four keys are listed. The registry is not in my capsule, so I
   cannot replay the search. The literal "listed above" is unbacked.
8. **Remaining-obligation item 4 overstates the DAG.** It says the corollary needs `crossingIndex`, `indepNum` and the eligibility
   predicate. My compiled check shows it needs only `k+1 ≤ crossingIndex (gkGraph k)`, plus entry 14 carried. `indepNum = 2k+3` is needed
   only to state that the eligible set is nonempty (`k ≥ 3`) or to identify its top.
9. **Circularity / encoded conclusion.** None in U1's Lean. In my `Corollary.lean`, `hx` is an explicit, open hypothesis that I name,
   not the conclusion (the conclusion is a flow).

## Mechanism-equivalence and fence check

- U1's object is the unweighted structural layer of `G_k`. It does not restate any of the ten refuted keys under new notation, and it
  touches no weight, relation, tag or retag map. Not deletion-only Hall, not Delete/Retag, not own-support unit capacity, not per-leaf
  injectivity, not occupancy domination, not signed cross-tag, not covariance.
- Closed regions: not re-proved. `α(G_k) = 2k+3` and the closed form are reported as replication of registered companion content,
  correctly.
- No census value is used in a proof, there is no RTree wording, and no live root is read. (LIFT) and (DCB) are not used.
- My lemma is a statement about the unweighted independence sequence of one explicit family. It is not any refuted mechanism, and it
  re-proves no closed region: the registered content (per U1's quote) is `x(G_k) ≤ k+1`, and I supply the `≥` direction.
- The composition "(HALL) at every eligible rank of every `G_k`" is a restricted-scope (HALL) statement about one family. It is not
  (HALL) at full scope and it says nothing about the primary aggregate beyond `G_k`. It widens the C4-LA1 key's fenced scope ("not
  'every eligible rank of `G_k`'") exactly by the lemma.
- Claim identity. Keys touched:
  - `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (unchanged, OPEN at full scope)
  - `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET` (consumed)
  - `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` (its `x ≤ k+1` companion is completed
    to equality)
  - `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` (unchanged)

  Candidate keys for the synthesis (predicates of the statement, no working labels):
  - `E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE` (`i_0 ≤ … ≤ i_{k+1}`, every `k ≥ 0`)
  - `E993-R30-GK-TREE-CROSSING-INDEX-EQUALS-K-PLUS-ONE-FOR-K-AT-LEAST-TWO`
  - `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK` (the composition; grade = its weakest input)

  Lexical alias check against every `E993-…` token in my capsule found no collision; the only `GK`/`CROSS` hits are the two
  `E993-R30-GK-TREE-…` keys above and `…C4-T4-SIGNED-CROSS-TAG-INJECTIVITY`. The mathematical alias check against the registry is the
  synthesis's obligation, because the registry is not in my capsule.

## Certification audit

| Literal (return) | Status |
|---|---|
| `gkGraph_isTree` general, sorry-free | **Backed** (rebuild; token scan; no `sorry` warning) |
| `#print axioms gkGraph_isTree` = `[propext, Classical.choice, Quot.sound]` | **Backed** (reproduced) |
| "every declaration … same axiom list" | **Corrected**: nine helpers are `[propext, Quot.sound]` |
| first 2956 lines = `66db6c73…` | **Backed** against ruling 40's prefix; the award file itself is outside my grant |
| full `Main.lean` `05c24dda…`, 3229 lines, 26 new declarations | **Backed** |
| seed files byte-identical to C1-LA1's | **Backed** against the first-interior copy (C1-LA1's directory outside my grant) |
| `Build completed successfully (8657 jobs)` | **Backed** (reproduced) |
| `RESULT_SHA256 60f1b4cf…` | **Backed** (replayed byte-identically) |
| 61 tree rows, 40 DP/closed-form rows, 400 closed-form rows; `x = k+1` on `k = 2..400` | **Backed** (replay, plus my instrument to 400) |
| `8·Δ_{k+1} = −2^k(k²+3k−8)` matches at every `k` checked | **Backed** (values); **table index labels corrected** (finding 4) |
| "`Δ_1(G_1) = i_2 − i_1 = +1`" | **Struck** (it is `Δ_2(G_1)`; `Δ_1(G_1) = 13`) |
| CD-1 statement "type-checks", "`clawRank`/`clawLayer`/`clawShadow` all elaborate", grade "`compiled` in the weakest sense" | **Struck**: no shipped artifact; no `claw` definition exists in any inventoried file |
| "`crossingIndex = k+1` is supplied informally"; "the informal proof is the closed-form polynomial" | **Struck** (bounded only); the proof is now supplied by this critique, STATED |
| "14 hits, listed and read in full above" | **Struck** ("listed" unbacked; 4 shown) |
| "Two instruments … for every numeric claim: yes" | **Narrowed**: `k = 41..400` rested on one instrument; now two (U1's plus mine) |
| "no member under `sources/` was read" | **Inconsistent** with the PIN.json verification in `## Runtime hygiene` (note) |

## Verdict

verdict: retained_narrowed
headline_resolved: no

What is retained:

- `gkGraph_isTree` (∀ `k`) is compiled scratch with the three permitted axioms and no grade (U1 wrote no more than this).
- The replication of `α(G_k) = 2k+3` and of the closed form, and the bounded record `x(G_k) = k+1` for `k = 2..400`, which is now
  two-instrument.

What is struck or narrowed:

- The CD-1 "type-checks" claim.
- The claim that `x = k+1` was "supplied informally".
- The mislabeled difference indices.
- The axiom-list literal and the alias-list literal.

**Critic-derived advance** (attributed to `C-U1-F`, STATED, `proved_informal` candidate pending an isolated second read): `Δ_j(G_k) ≥ 0`
for all `0 ≤ j ≤ k` and every `k ≥ 0`, with the closed form of `Δ_{k+1}`. Hence `x(G_k) = k+1` for every `k ≥ 2`. Composed with C4-LA1
(`formally_verified`), it gives (HALL) at **every** eligible rank of every `G_k`, as a restricted-scope statement at grade
`proved_informal` (its weakest input). In Lean, a compiled scratch check reduces that corollary to one node.

**Ruling-39 letters:** U1 supplies none of (a′)–(d′). It has no award, and (d′) also needs an award beyond the seeds together with one of
(a′)–(c′). The critic-derived lemma moves the `G_k` (HALL) corollary, one of (d′)'s Lean candidates, to a one-node DAG, but no award exists
this cycle. **Plateau (d′):** nothing from U1 is award-ready this cycle.

## Remaining obligation

1. **Isolated second read** of the C-U1-F lemma (proof in `## Independent re-derivation`; exact checks in `inst/gk_monotone_check.py`).
   After that, register the `x(G_k) = k+1` (`k ≥ 2`) and "every eligible rank" statements under keys that pass the synthesis's alias
   check.
2. **Smallest Lean node** for the `G_k` (HALL) corollary: carry `C5LA1.crossingIndex` (entry 14, `378868ab…`) byte-identically, then
   prove `k + 1 ≤ C5LA1.crossingIndex (gkGraph k)`. That is `∀ j ≤ k, 0 ≤ forwardDifferenceDel (gkGraph k) ∅ j`, and `Nat.le_find_iff`
   reduces the one to the other (compiled in `Corollary.lean`). This needs a Lean count of `indepSetCount (gkGraph k) ∅ j`, either the
   rooted block-product formula or a direct injection `I_j → I_{j+1}` for `j ≤ k`, and then the binomial-row inequality above. The final
   composition is already compiled in `Corollary.lean`.
3. `indepNum (gkGraph k) = 2k+3` in Lean (U1's item 1). U1's scoping is correct: `IsIndepSet.card_le_indepNum` and
   `exists_isNIndepSet_indepNum` exist in the pinned `Clique.lean`, the core fiber is `≤ 3`, and each arm fiber is `≤ 2`. It is needed
   only for non-vacuity and the top of the eligible window, not for the flow corollary.
4. **CD-1 in Lean from scratch.** First ship a claw-product definition layer (`clawRank`, `clawLayer`, `clawShadow`) and the statement
   in an inventoried file, so that exact scope and SR-C4-5's guards (`N_{k−2} = 0` at `k = 1`, no truncated subtraction) can be
   audited. Then prove it by the product-step induction. Nothing from this cycle carries over except the identification of the target.
5. **Controller:** correct the Stage 2 seal literal in `C5-CRITIC-PROTOCOL.md` (`f0b5a2a1…` should be `2e8e3d44…`).

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-U1-F/` (critic
scratch; nothing written elsewhere except this file; no background job started, none running):

| File | SHA-256 | Note |
|---|---|---|
| `gk_tree_layer.py` | `d5dc320002949bac466776b12d2579508c6d10f4ad0305310384f358278d265c` | U1's generator, copied out and replayed (`RESULT_SHA256 60f1b4cf…`) |
| `LeanProject/{lakefile.toml, lake-manifest.json, lean-toolchain, LeanProof.lean}` | `45d0ca58…`, `52a4d73c…`, `2bdc48ad…`, `f4dfdef8…` | U1's copied seeds; `.lake/packages` is a symlink to the shared project |
| `LeanProject/LeanProof/Main.lean` | `05c24dda55cea6f877bc2e3caed0a156e559e6ef6254d303d81e377aaf64165e` | U1's file, copied and rebuilt |
| `LeanProject/Check.lean` | `0a8245186075464f2a9adb2ab61100851381d0e74347a2abdb1278e282f5c4c8` | `#check`/`#print axioms`/`IsTree` unfolding |
| `LeanProject/Corollary.lean` | `32ac25a1ea2d99e9d65836593a53b1298b0512f01cf42edfc882cf0e0050e0ec` | entry 14 carried (byte-compared) plus the conditional `G_k` corollary and `Nat.find` reduction; compiled scratch, no grade |
| `inst/gk_crit.py` | `c87725c8373bf869dbbe55b6f89622d4ab03704f2b6ae0957951585d5229c75e` | independent tree test, DP, brute force, and `x` via `Nat.find` semantics |
| `inst/gk_crit_400.out` | `f59ecdfc481cb01b29339d01cd1a2c92202cd52752089b131a5c4b160c1e4d8e` | `k = 0..400` output (row digest `fbc224c5…`) |
| `inst/gk_monotone_check.py` | `4ce6d7067c937d3aeda7ca6b056bf1c4ffbae25696268bc420657d9e953f8005` | exact checks of the lemma's identities and inequality chain (`ALL True`) |

Replay: `cd <scratch>/inst && python3 -B gk_crit.py 400 && python3 -B gk_monotone_check.py`, and
`cd <scratch>/LeanProject && lake build && lake env lean Check.lean && lake env lean Corollary.lean`. These are foreground, with the
shared packages bound by symlink, never `lake update` or `lake clean`.
