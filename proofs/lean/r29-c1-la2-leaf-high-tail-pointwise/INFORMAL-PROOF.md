# Informal proof — C1-LA2 (HTP) with (HTA) on its face

Run: r29 `erdos-993-math-dre-20260925-r29-high-tail-certification`, Cycle 1 Stage 7, award `C1-LA2`.
Workflow run root: `runs/lean-2026-09-25-c1-la2-leaf-high-tail-pointwise/`.
Producer: `c1-la2-formalizer-opus-20260925`.
Model disclosure (two parts): chartered model Claude Opus 5.5, effort high (dispatch-record authority,
`control/dispatch/c1-stage7/DISPATCH-C1-LA2.md` and the brief); runtime-reported model id, verbatim: `claude-opus-5-5[1m]`.

This is a statement-level proof of record for the exact Lean declarations of this award. It condenses the admitted
synthesis (`cycles/cycle-1/stage6/SYNTHESIS.md`, `## Exact established results`, R-HTP and R-HTA; companion rows S2 and
S3) and follows the compiled Lean source `LeanProject/LeanProof/Main.lean` declaration by declaration. It proves nothing
beyond those declarations.

## 1. Statements

Notation. `V` is a finite type with decidable equality, `G : SimpleGraph V` with decidable adjacency, `n = |V|`,
`α = G.indepNum`. For a deletion set `D : Finset V`, `i_k(G − D) = C5LA1.indepSetCount G D k` is the number of
independent `k`-subsets of `V` disjoint from `D`, and `Δ_k(G − D) = C5LA1.forwardDifferenceDel G D k =
(i_{k+1}(G − D) : ℤ) − i_k(G − D)`. For a leaf `v` (`C4LA1.IsGraphLeaf G v := ∃! u, G.Adj v u`), `s = C5LA1.support G v`
is its unique neighbour, `H_v = C5LA1.H G v = {v, s}` and `R_v = C5LA1.R G v = insert s (N_G(s))`. The tagged count is
`q_j = (E993Interior.taggedFamily G (univ ∖ H_v) R_v j).card`: the independent `j`-subsets of `univ ∖ H_v` that meet
`R_v`.

**Terminal theorem (HTP)** `E993HighTail.bipartiteLeafHighTailPointwise`. If `G` is bipartite, `v` is a leaf of `G`,
`p : ℕ`, `1 ≤ p` and `2α + 1 ≤ 3p`, then
`Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v) ≤ 0` in ℤ.

**Companion lemma (HTA)** `E993HighTail.bipartiteHighTailAggregateAllRanks`. If `G` is bipartite, `1 ≤ p` and
`2α + 1 ≤ 3p`, then `C5LA1.aggregate G p ≤ 0`, where the aggregate is the sum of the (HTP) term over the original leaves
`v` with `Δ_p(G − v) < 0` (the strict selector `C4LA1.IsFavorableAt`).

## 2. Proof, declaration by declaration

### 2.1 `indepSetCount_zero` — `i_0(G − D) = 1` (any graph, any `D`)
The only `0`-subset is `∅`; it avoids `D` and is independent. No hypothesis.

### 2.2 `indepSetCount_one` — `i_1(G − D) = |univ ∖ D|` (any graph, any `D`)
Every singleton is independent, so the independent `1`-subsets avoiding `D` are exactly the `1`-subsets of `univ ∖ D`,
and there are `C(|univ ∖ D|, 1)` of them. No hypothesis.

### 2.3 `forwardDifferenceDel_zero_eq` — `Δ_0(G − D) = n − |D| − 1` in ℤ (any graph, any `D`)
`Δ_0 = i_1 − i_0 = |univ ∖ D| − 1`, and `|univ ∖ D| = n − |D|` in ℕ. **Cast audit:** the ℕ subtraction `n − |D|` is cast
to ℤ by `Nat.cast_sub`, justified by `|D| ≤ n` (`Finset.card_le_univ`); so the truncation is never active.

### 2.4 `leafTermAtOne_eq_degSubOne` (S2) — for every leaf of every finite simple graph, the `p = 1` term equals `deg_G(s) − 1`
`IsGraphLeaf` enters here: it supplies `G.Adj v s` (carried private helper `E993Interior.Leaf.support_adj`), hence
`v ≠ s` and `|H_v| = 2`. Also `s ∉ N(s)` (irreflexivity), so `|R_v| = deg(s) + 1`. By 2.3 the term is
`(n − 2 − 1) − (n − (deg(s) + 1) − 1) = deg(s) − 1`. No bipartiteness, no guard.

### 2.5 `leafEndpointAtOne` (S3, graph-general) — a leaf and `α ≤ 1` give term `0`
Let `w ∈ N(s)` with `w ≠ v`. Then `w ≠ s` (no loops), and `v` is not adjacent to `w`: otherwise leaf uniqueness
(`E993Interior.Leaf.support_unique`, from `IsGraphLeaf`) gives `w = s`. So `{v, w}` is an independent set of size `2`,
and `IsIndepSet.card_le_indepNum` gives `2 ≤ α`, contradicting `α ≤ 1`. Hence `N(s) ⊆ {v}`; also `v ∈ N(s)`. So
`N(s) = {v}`, `deg(s) = 1`, and by 2.4 the term is `0`. (Equivalently `R_v = H_v`.) **No bipartiteness is used.** The
hypothesis `α ≤ 1` is supplied by the guard in 2.6.

### 2.6 `leafHighTailPointwiseAux` — the pointwise sign, two branches on `p`
Hypotheses in scope: `hBip`, `hv`, `hp : 1 ≤ p`, `hTail : 2α + 1 ≤ 3p`.

**Branch `p = 1`** (`p < 2` with `1 ≤ p`, by `omega`). Then the ℕ value `p − 1` is `0`. **The guard enters here** as
`2α + 1 ≤ 3`, so `α ≤ 1` (by `omega`), and 2.5 gives term `= 0 ≤ 0`. `hBip` is not consumed on this branch.

**Branch `p ≥ 2`** (`2 ≤ p`). The carried private lemma `E993Interior.Leaf.leaf_term_nonpos` (entry 42's helper, byte-
identical in this file) is applied with `hShadow` discharged by `E993Interior.taggedShadowBound G hBip` (entry 41). Its
argument, read from the carried Lean:
- (a) `H_subset_R`: `H_v ⊆ R_v` (`s ∈ R_v`; `v ∈ N(s)` because `v ~ s`). `IsGraphLeaf` enters here.
- (b) `tagged_count_split` at `D = H_v ⊆ E = R_v`: `i_k(G − H_v) = q_k + i_k(G − R_v)` for every `k` (an independent set
  avoiding `H_v` either meets `R_v`, and is tagged, or avoids `R_v`; `Finset.card_filter_add_card_filter_not`). Any graph.
- (c) Consequently, with `p − 1 + 1 = p` (**`p ≥ 2`**, a fortiori `p ≥ 1`, makes the ℕ `p − 1` the integer rank), the
  term equals `(i_p(G−H) − i_{p−1}(G−H)) − (i_p(G−R) − i_{p−1}(G−R)) = q_p − q_{p−1}`.
- (d) `leaf_indep_cap`: every independent `A ⊆ univ ∖ H_v` has `|A| ≤ α − 1`. `v ∉ A` and `s ∉ A`; the only neighbour
  of `v` is `s` (`IsGraphLeaf`), so `A ∪ {v}` is independent, and `|A| + 1 ≤ α`. **Cast audit:** the ℕ `α − 1` is exact
  because `α ≥ |A| + 1 ≥ 1`.
- (e) `leaf_tagged_monotone`: put `k = p − 1`; **`1 ≤ k` follows from `p ≥ 2`**. **The guard enters here:** from
  `2α + 1 ≤ 3p` and `p = k + 1`, `omega` derives `2((α − 1) − k) ≤ k` in truncated ℕ, before any case split.
  - If `α − 1 < k` (above the cap): `tagged_zero_above_leaf_cap` (from (d)) gives `q_k = q_p = 0`.
  - Otherwise **`k ≤ a := α − 1`**, so the ℕ `a − k` equals the integer `a − k`. Entry 41 at `U = univ ∖ H_v`,
    `W = R_v`, `a = α − 1`, cap (d), `1 ≤ k`: `k · q_{k+1} ≤ 2(a − k) · q_k ≤ k · q_k`. **`IsBipartite` enters here
    only**, inside entry 41 at `Core.card_extension_le`: for an independent tagged `k`-set `A`, the set `E` of vertices
    addable to `A` splits by a 2-colouring into two classes, each of which can be adjoined to `A` keeping independence,
    so each class has at most `a − k` vertices and `|E| ≤ 2(a − k)`; every tagged `(k+1)`-set has at least `k` tagged
    `k`-subsets (deleting any vertex other than one fixed tagged vertex); double counting the containment pairs gives
    the inequality. **`1 ≤ k` enters at the cancellation** `k · q_{k+1} ≤ k · q_k ⇒ q_{k+1} ≤ q_k` (`nlinarith`); in
    entry 41 itself `hk` is statement scope and unused by the body.
- (f) So `q_p ≤ q_{p−1}` and the term `q_p − q_{p−1} ≤ 0` (`omega` after the rewrites of (c)).

### 2.7 `bipartiteHighTailAggregateAllRanks` (HTA) — companion lemma, placed before the terminal theorem
`C5LA1.aggregate G p` is the sum, over `v ∈ (leafSet G).filter (IsFavorableAt G · p)`, of the (HTP) term. Each such `v`
lies in `leafSet G = univ.filter (IsGraphLeaf G)`, so `IsGraphLeaf G v` holds, and 2.6 gives each summand `≤ 0`;
`Finset.sum_nonpos` concludes. The selector `IsFavorableAt` is never used beyond membership (the argument holds for the
sum over any set of leaves). Hypotheses `hBip`, `hp`, `hTail` are passed to 2.6.

### 2.8 `bipartiteLeafHighTailPointwise` (HTP) — the terminal theorem
Exactly 2.6 at the same hypotheses.

## 3. Hypothesis ledger

| Hypothesis | Where it enters |
|---|---|
| `hBip : G.IsBipartite` | only on the `p ≥ 2` branch, through entry 41 `E993Interior.taggedShadowBound G hBip` at `U = univ ∖ H_v`, `a = α − 1`; inside entry 41 only at `Core.card_extension_le` (2-colouring of the addable set). Not consumed on the `p = 1` branch. |
| `IsTree` | **not used anywhere in this award** (neither connectivity nor acyclicity). |
| `hv : C4LA1.IsGraphLeaf G v` | support adjacency and uniqueness (`support_adj`, `support_unique`); `H_v ⊆ R_v`; `leaf_indep_cap`; `|H_v| = 2`; the `p = 1` argument `N(s) = {v}`; in (HTA) supplied by membership in `leafSet`. |
| `hp : 1 ≤ p` | makes the ℕ `p − 1` the integer rank; with `p < 2` it pins `p = 1`. |
| `p ≥ 2` (branch) | gives `k = p − 1 ≥ 1` and `p − 1 + 1 = p`. |
| `1 ≤ k` | passed to entry 41 (statement scope there) and used at the cancellation `k·q_{k+1} ≤ k·q_k ⇒ q_{k+1} ≤ q_k`. |
| `k ≤ a` (`a = α − 1`) | the non-zero branch of `leaf_tagged_monotone`; makes the truncated `a − k` exact. Above the cap both counts are `0`. |
| `hTail : 2α + 1 ≤ 3p` (the guard) | `p = 1`: gives `α ≤ 1`. `p ≥ 2`: gives `2((α − 1) − (p − 1)) ≤ p − 1`. |
| no selector / residual / connectivity / `Nonempty` hypothesis | none appears in any hypothesis text. |

## 4. ℕ/ℤ cast audit

- `p − 1` (ℕ) in the statement: under `hp : 1 ≤ p` it equals the integer `p − 1`, so the statement at ℕ rank `p − 1` is
  exactly the registry statement at integer rank `p − 1`, for every integer `p ≥ 1`.
- `2 * G.indepNum + 1 ≤ 3 * p` is an ℕ inequality with no subtraction; it is literally `3p ≥ 2α + 1`.
- `n − |D|` in 2.3: exact by `|D| ≤ n` (`Nat.cast_sub`).
- `α − 1` in (d)/(e): exact whenever an independent set is present (`α ≥ 1`); the truncated coefficient inequality
  `2((α − 1) − k) ≤ k` is only used on the branch `k ≤ α − 1`, where every subtraction is exact.
- Every difference in the conclusion is an ℤ difference of ℕ counts cast to ℤ (definition `forwardDifferenceDel`).

## 5. Carry table (byte-identical transport)

Carried definition-of-record fragments and mechanism lemmas (registrar units, byte-identical to the frozen first-interior
award `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Snippets/`, frozen `Main.lean`
`8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`; full per-entry digests in `CAPSULE-VERIFICATION.json`):

| Registrar entry | Original entry | Declaration | SHA-256 |
|---|---|---|---|
| 1 | 1 | `C4LA1.vertexDeletionIndepSetCount` | `7e0a588e243735a611c919ea1080816911a3e27e4523478af0c0f560ce1b3b48` |
| 2 | 2 | `C4LA1.vertexDeletionForwardDifference` | `c2da50eb16ee788c439b146577efeedd7dd42811c6943fb437585edcf63b5880` |
| 3 | 3 | `C4LA1.IsFavorableAt` | `25d8f7d274f9080468bf6d46acc6db3d4a469c2e399e7faee6cdcee24290a0db` |
| 4 | 4 | `C4LA1.IsGraphLeaf` | `65acd314d3bfd74aca476e00dd8866434c67682b627bce5e105d372a556f7ae5` |
| 5 | 5 | `C5LA1.support` | `8e1e1a689393f555eb5c216207b1368c7415a8543c569884b2fc86954b7bc2b4` |
| 6 | 6 | `C5LA1.leafSet` | `78ec65517bde90cc2fc5e542fc7c60d6a5147b243b74b9ac3de33d4efd1df697` |
| 7 | 7 | `C5LA1.leafDegree` | `ccfc9b2f549aa8c9986931152d249096ce49e3ccd3b67f4afd8678a749d93a68` |
| 8 | 8 | `C5LA1.H` | `55f37d9161901d6006e571cf548c4e56675c9d786a1aba83e7889ad9d443224d` |
| 9 | 9 | `C5LA1.R` | `a0407d82ab112a65a0f9d85970e9d6217b66201680cc079a4ba13751e53dc6b8` |
| 10 | 10 | `C5LA1.indepSetsAvoiding` | `ac0e331eec99650eca7a18e9fe98829bb5495850685b8f31936169f0a6d8e368` |
| 11 | 11 | `C5LA1.indepSetCount` | `e22635d8697e49b38dd521080f34c3eefe56a93964120c70f53ad9899b4a7f71` |
| 12 | 12 | `C5LA1.forwardDifferenceDel` | `60bd8efcc88e8e511a7caacac5867f7845243ccab08f1660e8c3962af544dd8f` |
| 13 | 13 | `C5LA1.aggregate` | `d66e776c5cf49b2a78a2d9713e4a41de2cbaf5de0af7b6d580075064d1daea8b` |
| 14 | 14 | `C5LA1.crossingIndex` | `378868ab2e660af8a36ea0b1045c55bc60f8383dca3d31dd85c4b52fa8a898fb` |
| 15 | 18 | `E993Interior.taggedFamily` | `cb43feebd48bdf3a82d95db4c0475a34a83acdd8c55f13ac44433ea26141fa1e` |
| 16 | 41 | `E993Interior.taggedShadowBound` (+ `Core` private helpers) | `50dcce4a7ad13fbb73361ff1235996a7bb79eeea2cf9435a752b1eab50d8583f` |
| 17 | 42 | `E993Interior.highTailAggregateFromShadow` (+ `Leaf` private helpers) | `972d0d900218889995bebd2e0682c1886576df4d7b2b22356924b0d7295baa9d` |

Entries 15–17, 19–40, 43, 44 and 45 are not carried. Entries 41–42 are context, never certificates; the lemma
`highTailAggregateFromShadow` itself is not called; its private `Leaf` helpers are.

New declarations (registrar entries 18–25): every declaration body is carried **byte-identically** from the U
adjudicator's scratch candidate, plan of record — `sources/c1-stage7-sources/ADJ-U-tails-LA2.lean`
(SHA-256 `5db83f7b23f0afaad7bc844402b1ffd9435f76390063e0ff133e9b720d15ca0a`, 6,639 B; origin
`scratchpad/c1-adj-U/awards/tails/LA2.lean`), whose text is also byte-identically the tail of
`sources/c1-stage7-sources/ADJ-U-awards-LA2-Main.lean` (SHA-256
`8700323190cb4a14b3cbc12188853aeea4b7ea85cd810133bc294f6da6ab53df`, 32,283 B). Only the registrar-unit wrapper
(`namespace E993HighTail` / `open SimpleGraph E993Interior` / `end E993HighTail`) is authored in-run; it is not a body. No
declaration is re-derived.

| Registrar entry | Declaration | Body SHA-256 (declaration text only) | Authorship of the body |
|---|---|---|---|
| 18 | `E993HighTail.indepSetCount_zero` | `4affd70d2893a118c777c5f69a981f2edb67e8934fd9f75d88fa07483196a576` | U adjudicator (r29) |
| 19 | `E993HighTail.indepSetCount_one` | `32344df9b2d061dbff34903e181cd14c88694f1223d32c907506d9bde718312e` | U adjudicator (r29) |
| 20 | `E993HighTail.forwardDifferenceDel_zero_eq` | `1e25fc2fb23cce8780f90b879aef29d93bf542ab38425a9243e354c44f32b9ce` | U adjudicator (r29) |
| 21 | `E993HighTail.leafTermAtOne_eq_degSubOne` (S2) | `54db75a6ec952d1412c1c7b7124da8fdd0308a4e3fa4e383b18e75d2a4c1435d` | U adjudicator (r29); mathematics T1 |
| 22 | `E993HighTail.leafEndpointAtOne` (S3) | `be705131f5fc2de6641ff205ea488e4783ba64a8dede784a01f2e3edd91f9e3d` | U adjudicator (r29); mathematics C-T1-F A1, C-F1-T A3, C-F1-U A3 (critic-attributed); Codex prior art |
| 23 | `E993HighTail.leafHighTailPointwiseAux` | `fa86fd1feae83baf5d27a2c6f60565f9fbe3054bc3227bdda73eec7885449949` | U adjudicator (r29); `p ≥ 2` mechanism Codex (entries 41/42) |
| 24 | `E993HighTail.bipartiteHighTailAggregateAllRanks` | `6e8ee1b356cb48c9ae3c3dfa134ef00ccf81841a50668cada3df56921df8c810` | U adjudicator (r29); statement Codex/Astra, T1, T2 |
| 25 | `E993HighTail.bipartiteLeafHighTailPointwise` | `f6b4995be1a154d1daed4312c9757f0ab76bcbc8a70075f2fe48d37b9ed0d11e` | U adjudicator (r29); statement Codex (SOLUTION-CONTRACT §2) |

Excluded bodies (not used): U1's `bipartite_indepNum_one_card_le_two` (uses `decide`); C-U1-T's LA2 order and primed
names. The admissible alternative (C-T1-U's two-branch split, `ADJ-T-CarryLA2.lean`) was not used.

## 6. Attribution

Codex (GPT-6 Luna/Sol/Astra): the tagged-shadow mechanism, entries 41/42, the proposed (HTP)/(HTA) statements, the
identification of the `p = 1` gap and the bipartite-free endpoint observation (prior art). r24 C4-LA1: the selector and
leaf definitions (entries 1–4). r26 (Claude, Fable-controlled): the `C5LA1` layer (entries 5–14). The first-interior
source: entry 18. r29: T1 (the `p = 1` endpoint and the `deg(s) − 1` formula; the registry extraction of the `p ≥ 2`
body); C-T1-F (A1), C-T1-U (the two-branch packaging), C-F1-T (A3), C-F1-U (A3) and the U adjudicator
(`leafEndpointAtOne`): the bipartite-free endpoint; U1 and the critics: compiles; T2: the aggregate corollary's use; the
U adjudicator: the base candidate whose bodies are carried here.

## 7. Excluded conclusions and fences

- No sign below the guard (`3p < 2α + 1`); the guard is sharp (boundary record B1). Nothing here concerns the lower
  region (fence §3.3).
- No favorable-selector, eligibility or residual statement.
- No non-bipartite `p ≥ 2` statement (false; B4, `P_3 ⊔ 2K_3`). The graph-general `p = 1` companion
  `leafEndpointAtOne` is a lemma, not a registered claim until the second read SR-1.
- Not `E993-BETA-TARGET` (its witnesses fail the guard; fence §3.4). No transfer to `E993-BETA-AGG`, to the all-rank
  `E993-R23-…`, to any no-recovery key, or to Erdős #993 (fence §3.1).
- No strict sign.
- Every award is a separate certificate (fence §3.8); nothing here is presented as awarded before the controller's
  close. Attribution travels on every face (fence §3.7).
