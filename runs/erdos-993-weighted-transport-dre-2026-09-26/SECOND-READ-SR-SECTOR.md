# Second Read

Isolated second read `SR-SECTOR`, Cycle 1 of r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Erdős #993,
correctly weighted mixed-boundary transport. Statements SR-7 to SR-10 (synthesis P5, P6, P7, P8, P9, and the `R30-CB-RECORD`
text). Date 2026-09-26.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. The subsystem loaded is `experiments/`, limited to this read's sealed
capsule. The harness injected the root `CLAUDE.md` and the user auto-memory index into context at session start; I did not open
either as a source, and nothing below relies on them.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosure.**
- Order: I read the protocol, the brief and the manifest (in that order) before the seal audit, because the audit needs the
  manifest. A zsh `=`-expansion error in my first two shell reads interrupted the concatenated output after each file, so each
  was read in a separate call. I read the two boot files immediately after the seal audit and before any mathematical work.
- Files read: the 20 capsule members only (full reads of the protocol, brief, both contracts, T1's return, the four critiques
  C-T1-F, C-T1-U, C-F1-T, C-F1-U, and the synthesis sections I rule on; targeted `grep`/`sed` reads inside the two adjudications
  and the controller-facts file, which are capsule members). The harness spilled one long `cat` of the two contracts into its own
  tool-result file, which I then read; that file is a byte copy of capsule members.
- Not read: no other return, critique, adjudication, seat scratch, experiment root or frozen source; no Mathlib (no Lean was
  needed); no network, no installs; no `find`, `grep` or `rg` above the capsule members. The controller's replay record
  `CF-REPLAY-c1.json` was used once as a cross-check prior after my own computation (below), never as evidence.
- Processes: every computation ran in the foreground (Python standard library, exact integers); no background job was started.

## Identity and seal audit

- **Capsule seal.** SHA-256 of the canonical JSON of `control/c1-second-read/SR-SECTOR-PACKET-MANIFEST.json` without
  `seal_sha256` (`sort_keys=True`, separators `(",", ":")`, no trailing newline), recomputed by
  `scratchpad/c1-sr-SR-SECTOR/seal_audit.py`:
  **`a24d39b9ee3bee41eff72a27b3d9d9bdd15a3d914d9129a8ff7a390c8fb20e1e`**. This matches the recorded value and the dispatched
  prefix `a24d39b9ee3bee41`.
- **Members.** All 20 listed files match their SHA-256 and byte counts (own recomputation; `file_count` 20). They include
  `cycles/cycle-1/stage6/SYNTHESIS.md` (`339a208e2ae90884ead9fc6c980d0eb9ae715550aeb4588d643ae0f666967a0f`),
  T1's return (`99856702…9013`), the four critiques and both adjudications as listed.
- **Brief-path check.** `control/PATH-CHECK-c1-second-read-briefs.json` records 0 findings over 6 files.
- **Statement of record.** The synthesis `## Exact established results` P5 to P9, `## Headline verdicts` (the `CB(8, 92)` record)
  and `## Registrations` items 4 and 5. Origins: T1's return; critiques C-T1-F (Lemma C, coverage sweep), C-T1-U (A1, A2, the
  abstract-model failures), C-F1-T and C-F1-U (sector criterion, `CB(8, 86)`); the T and F adjudications.

## Statements read

- **SR-7 (P5).** Sector pair-product normalized matching. Proposed key
  `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`. For `G` finite simple, `Q` independent, `G − N_G[Q]` a
  perfect matching on `N` edges, and `k ≥ 1`: `k·|X| ≤ 2(N − k + 1)·|∂_Q X|` for every `X ⊆ S^Q_{|Q|+k}`.
- **SR-8 (P6).** Switch-image weight on the `CB(d, m)` root-plus-arm sector. `A = (B ∖ {r, b_{ij0}}) ∪ {u_i}` is independent, has
  weight `ℓ_i(B)` and exactly `d − ℓ` sector preimages. The `s`-switch and the deletions of `r` or `v` give weight 0. The
  whole-sector switch capacity formula is derived from this.
- **SR-9 (P8, P9).** The whole-sector criterion `3p < 2dm + 5` and its composition with P5. Also the three eligible rows with
  `n ≤ 1600` and the switch-exit multiples.
- **SR-10 (P7 and the `R30-CB-RECORD` text).** Lemma C (C-T1-F), its grades, and the record text for `CB(8, 92)`.

## Independent re-derivation

Own instruments are in `scratchpad/c1-sr-SR-SECTOR/`. They use exact integers and the Python standard library only, and were
written from SEMANTIC-CONTRACT §1 without reusing any seat, critic, adjudicator or controller code. `sr_lib.py` provides:
- the literal `CB(d, m)` builder with separate BFS-connectivity and union-find-acyclicity tests;
- the generic forest DP for `i_j(T − D)` on the original carrier;
- `α`, and `x` scanned through rank `α` with explicit zero extension.

### SR-7 (P5)

*Re-derivation.* Every independent set containing `Q` avoids `N(Q)`, so it is `Q` plus an independent set of
`G[V ∖ N[Q]]`. By hypothesis that graph is exactly `N` disjoint edges. So `S^Q_{|Q|+k}` is in bijection with the rank-`k` layer
of `{0, 1, 2}^N` (per edge: empty, `b_i` or `c_i`). Deleting one non-`Q` vertex is the covering relation, and every deletion stays
independent and keeps `Q`.

Route 1 (T1's Lemma 1). The abstract group `S_N ≀ (ℤ/2)^N` permutes coordinates and swaps the two nonzero symbols per
coordinate. It preserves rank and covering, and it is transitive on each rank. So down-degrees are constant on rank `k` and
up-degrees are constant on rank `k − 1`, and double counting gives `d_k|X| ≤ d_{k−1}|∂X|` with `d_k/d_{k−1} = R_{k−1}/R_k`. The
proof is complete.

Route 2 (direct). Each rank-`k` state has exactly `k` lower covers. Each rank-`(k−1)` state has exactly `2(N − k + 1)` upper
covers: an empty coordinate and one of two symbols. Every edge out of `X` lands in `∂_Q X`, and each `A ∈ ∂_Q X` receives at
most `2(N − k + 1)` of them. Hence `k|X| ≤ 2(N − k + 1)|∂_Q X|`.

No automorphism of `G` is used by either route. T1's §4 `Aut(T)` hypothesis is vacuous on trees: `deg b_i ≥ 2 > 1 = deg c_i`,
so no automorphism swaps a support with its leaf. The corrected hypothesis is the one the argument uses.

*Hypothesis audit.*
- The load-bearing hypothesis is exactly that `G[V ∖ N_G[Q]]` is 1-regular with `N` edges.
- "Induced" is redundant, since `G − N[Q]` is an induced subgraph by definition, and harmless.
- Independence of `Q` is not load-bearing: if `Q` is not independent, the family is empty and the inequality is vacuous. It is
  harmless and may stay.
- No tree, weight, selector or eligibility hypothesis is needed, and none is present.
- ℕ-subtraction: for `k ≤ N`, `N − k + 1 ≥ 1`; for `k > N` the family is empty, so both sides are 0 in ℕ even with truncation.

*Instrument* (`sr7_p5_check.py`). 40 random general graphs (not trees and not `CB`: extra edges inside `N(Q)` and between `N(Q)` and
the matching) and every `k ∈ [1, N]`, 93 `(G, Q, k)` instances in all. The instrument asserts:
- layer sizes `R_k`, `R_{k−1}`;
- exact biregularity (`k` down, `2(N − k + 1)` up);
- the inequality on 127,650 subfamilies, exhaustively whenever the layer has at most 12 members and randomly otherwise.

No failures (digest `91a1cc96…d970`).

*CB instantiation.* `CB(8, 92) − N[{r, v}]` is the 736 edges `b_{ij}c_{ij}`, so `N = 736`. At `k = 491` P5 gives
`491|X| ≤ 492|∂X|`, i.e. `|∂X| ≥ |X|·491/492`.

*Key as predicate.* `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` names a shadow inequality of normalized-matching
type on sectors whose complement is a matching. The statement satisfies exactly that. The name asserts no weight, no Hall property
and no tree scope. It is a predicate and asserts nothing beyond the statement.

### SR-8 (P6)

*Re-derivation.* Take `B` in the sector (`r, v ∈ B`). Then `s ∉ B` and every choke is outside `B`. Candidate switch vertices
`u ∉ B` with `|N(u) ∩ B| = 2`:
- `s`: `N(s) = {r, v}`, both in `B`, so the `s`-switch always exists.
- `u_i`: `N(u_i) = {r} ∪ {b_{i1}, …, b_{id}}`, so it switches iff exactly one support `b_{ij0}` of group `i` is in `B`.
- `b_{ij} ∉ B`: its neighbours are `u_i ∉ B` and `c_{ij}`, at most one in `B`.
- `c_{ij}`: degree 1.

These are therefore ALL the switch arcs out of a sector source.

The image is `A = (B ∖ {r, b_{ij0}}) ∪ {u_i}`. It is independent: `u_i`'s neighbours in `B` were removed, and group `i` holds no
other support. It has size `p`. Active tags in `A`:
- `v`: `W_v = N(s) ∖ {v} = {r}`, and `r ∉ A`, so `v` is inactive.
- `c_{ij}` in group `i`: `W = N(b_{ij}) ∖ {c_{ij}} = {u_i} ⊆ A`, so it is active iff present and in `F`.
- Other groups' leaves: their chokes are absent, so they are inactive.

Hence `w_F(A) = #{j : c_{ij} ∈ B ∩ F}`. This equals `ℓ_i(B)`, the number of group-`i` leaves in `B`, **when the group-`i` private
leaves are in `F`** (with `0 ≤ ℓ ≤ d − 1`, since position `j0` holds the support).

As a set, `A` records `i`, the leaf set `L` (`|L| = ℓ`) and the other groups' states, but not `j0`. Its sector preimages under (S)
are the `d − ℓ` choices of an empty position `j0` of group `i` in `A`. It has no (D)-preimage in the sector, because `u_i ∈ A`.

Weight-0 targets, for every `F`:
- the `s`-switch image `(B ∖ {r, v}) ∪ {s}` (no tag of `F` is active; `s` is not a leaf);
- `B ∖ {r}` (`v` loses its witness, and private tags have no choke);
- `B ∖ {v}` (the only possibly active tag is gone).

*Whole-sector formula.* The distinct choke-switch targets of the whole sector at rank `p + 1` (branch rank `p − 1`) are the triples
`(i, L, rest)`, where `|L| = ℓ ≤ d − 1` and `rest` is a rank-`(p − 2 − ℓ)` state of the other `m − 1` groups. Distinct triples are
distinct vertex sets, because `u_i` identifies `i`. With the private leaves in `F`, the capacity is
`m·Σ_{ℓ=0}^{d−1} ℓ·C(d, ℓ)·C(d(m−1), p−2−ℓ)·2^{p−2−ℓ}`, with each distinct target counted once and `ℓ = 0` contributing 0. The
formula is confirmed.

*Instrument* (`sr8_small_enum.py`). Eight literal trees `CB(1,3), CB(2,2), CB(1,5), CB(3,2), CB(2,3), CB(4,2), CB(3,3), CB(2,4)`
(`n ≤ 24`; `is_tree` asserted). Layers are enumerated explicitly and asserted equal to the DP coefficients. The runs cover every
`p` with `2 ≤ p ≤ dm + 1` and `p + 1 ≤ α`, and four tag sets `F ∈ {F_p (literal selector), all leaves, {v}, private leaves only}`:
196 rows in all.

On every row the instrument asserts:
- (WID): `supply − capacity` equals the tag-route `Σ_F[Δ_{p−1}(T − H_t) − Δ_{p−1}(T − R_t)]`;
- sector weights `= [v ∈ F]`;
- the complete switch list (only `s` and single-support chokes);
- `w_F(A) = #{j : c_{ij} ∈ B ∩ F}`, and `= ℓ` when all private leaves are in `F`;
- exactly `d − ℓ` preimages per choke-switch target;
- weight 0 for the `s`-switch and for the deletions of `r`/`v`;
- the whole-sector distinct-target capacity against the formula (121 rows with the private leaves in `F`).

Every assertion passed (digest `8b3b97d7…ad14`).

### SR-9 (P8, P9)

*P8 re-derivation.* Assume `v ∈ F_p` and `2 ≤ p ≤ dm + 1`, and let `N = dm`.
1. `X_sec` is the rank-`(p − 1)` sector, so `|X_sec| = |R_{p−1}|` with `|R_j| = 2^j C(N, j)`. Every member has weight 1 (SR-8).
2. Deletion images:
   - deleting a pair element lands in the rank-`(p − 2)` sector, weight 1;
   - every rank-`(p − 2)` state is reached, because `p − 2 < N` leaves an empty coordinate to add;
   - deleting `r` or `v` gives weight 0.
3. So the positive-weight deletion shadow is exactly `R_{p−2}`, and the deletion-only deficit of `X_sec` is `|R_{p−1}| − |R_{p−2}|`.
4. The ratio is `|R_{p−1}|/|R_{p−2}| = 2(N − p + 2)/(p − 1)`. It exceeds 1 iff `2N − 2p + 4 > p − 1`, i.e. iff `3p < 2N + 5`.

Both ℕ-subtractions (`p − 1`, `p − 2`) are guarded by `p ≥ 2`, and `N − p + 2 ≥ 1` is guarded by `p ≤ N + 1`.

*P9 re-derivation.*
- (⇐) Apply P5 with `Q = {r, v}`, `N = dm` and `k = p − 1`. Then `(p − 1)|X| ≤ 2(dm − p + 2)|∂X|`, so `|∂X| ≥ |X|` when
  `3p ≥ 2dm + 5`. For `X ⊆ X_sec`: `Σ_X w = |X|·[v ∈ F]`, and `Σ_{N_D(X)} w ≥ |∂X|·[v ∈ F]`. This direction needs neither
  `v ∈ F_p` nor the `p`-range: if `v ∉ F`, all sector weights are 0, and for `p ≥ dm + 2` the inequality is automatic.
- (⇒) If `3p < 2dm + 5`, `v ∈ F_p` and `2 ≤ p ≤ dm + 1`, then `X_sec` is itself a failing subfamily by P8.

The "iff" is correct under the stated hypotheses. The only-if direction genuinely needs `v ∈ F_p` and `p ≤ dm + 1`.

*Scan* (`sr9_scan1600.py`). I used the closed forms `I(T) = t(1+t)(1+2t)^{dm} + (1+2t)Q^m` and
`I(T − v) = t(1+2t)^{dm} + (1+t)Q^m`, with `Q = (1+2t)^d + t(1+t)^d`, which I derived from the rooted case split at `r`. They were
validated against the literal forest DP on six small members, and on `CB(8, 86)`, `CB(8, 89)` and `CB(8, 92)` in `sr_cb892.py`.
- Exact Kronecker-packed integers.
- All **4,974** configurations with `n = 3 + m(2d + 1) ≤ 1600`; 3,509 have a nonempty eligible window.
- `x` through `α`, and the window `[x + 2, ⌊2α/3⌋]`.
- `v ∈ F_p` is checked exactly.

The scan finds exactly three eligible sector-deficient rows (digest `0d025ec3…9a5a`):

| row | `n` | `α` | `x` | window | sector-deficient `p` | ratio |
|---|---|---|---|---|---|---|
| `CB(8, 86)` | 1465 | 775 | 458 | `[460, 516]` | 460 | 460/459 |
| `CB(8, 89)` | 1516 | 802 | 474 | `[476, 534]` | 476 | 476/475 |
| `CB(8, 92)` | 1567 | 829 | 490 | `[492, 552]` | 492 | 492/491 |

- `CB(8, 86)`, `p = 460`, is the smallest.
- Each row has a single deficient rank, `p = x + 2`.
- At all three rows, `v` and the private leaves are favorable at every eligible `p` (literal DP, `sr_cb892.py`).
- (A first run capped the window one rank short when `3 | 2α`. I fixed it and re-ran; the three rows are unchanged.)

*Multiples* (`sr_cb892.py`: exact formula of SR-8 against the deficit `|R_{p−1}| − |R_{p−2}|`, with the private leaves in `F`):

| row | switch capacity / deficit | floor |
|---|---|---|
| `CB(8, 86)` | 6,128.8 | 6128 |
| `CB(8, 89)` | 6,563.1 | 6563 |
| `CB(8, 92)` | 7,012.3 | 7012 |

After my computation I compared against the controller prior `CF-REPLAY-c1.json` as a cross-check only. `R_490`, `R_491`, the
deficit and the switch total at `CB(8, 92)` are string-equal.

*By-product.* At each of the three rows the arm tag's own summand `q_v(p) − q_v(p − 1)` equals the whole-sector deletion deficit
`|R_{p−1}| − |R_{p−2}|` exactly (C-T1-U's remark, re-derived by the tag route). The complete `S(CB(8, 92), 492)` by the tag route
is negative (351 digits).

### SR-10 (P7, Lemma C, the record)

*Lemma C, fact by fact* (C-T1-F's proof, re-derived). Setting: `k = p − 1`, `Z' = N − k + 1`, `δ = R_{k−1}/R_k = k/(2Z')`, and
`B` the sector cover matrix (rank `k` to rank `k − 1`; left degree `k`, right degree `2Z'`).

- **Fact A.** Sector targets contain `r`; choke-switch targets contain `u_i` and not `r`. They are therefore disjoint, and
  `Σ_{N(X)} w ≥ |∂X| + Σ_{N_sw(X)} w` for `X ⊆ X_sec` (with `v ∈ F`). Correct.
- **Fact B.** For each `σ ∈ X ∖ X''` pick a positive-weight switch image. A target of weight `w` has at most `d − w` sector
  preimages, and `w/(d − w) ≥ 1/(d − 1)` for `1 ≤ w ≤ d − 1`. So `Σ_{N_sw(X)} w ≥ |X ∖ X''|/(d − 1)`. Correct. It needs the
  private leaves in `F`.
- **Fact C.** The flip-character decomposition `V^J` reduces `BBᵀ` on `V^J` to `2·U D` on level `k − |J|` of the Boolean lattice
  of `[N] ∖ J`. The summed symbol gives the factor 2, and a coordinate in `J` cancels. I re-derived this reduction.
  - What is cited is the Boolean up–down spectrum `(j − i)(n − j − i + 1)`.
  - The proof needs only the upper bound "every eigenvalue on `𝟙^⊥` is `≤ 2(k − 1)Z'`".
  - My exact replay (`sr10_spectral.py`, integer Bareiss nullities for every predicted eigenvalue) confirms the full spectrum with
    multiplicities on 14 `(N, k)` pairs up to `(6, 4)`: the multiplicities sum to `R_k`, `λ₁ = 2kZ'` is simple and `λ₂ = 2(k − 1)Z'`.
- **Fact D.** Write `1_X = (|X|/R_k)𝟙 + g` with `g ⊥ 𝟙`. The cross term vanishes because `BBᵀ𝟙 = 2kZ'𝟙`. Then
  `‖Bᵀ1_X‖² ≤ 2kZ'|X|²/R_k + λ₂(|X| − |X|²/R_k)`, and Cauchy–Schwarz on `Σ_{τ∈∂X} deg_X τ = k|X|` gives
  `|∂X| ≥ k²|X|/(λ₂ + 2Z'|X|/R_k)`, using `2kZ' − λ₂ = 2Z'`. Hence `|∂X| ≥ |X|` for `|X|/R_k ≤ x₀ = (k² − λ₂)/(2Z')`. Correct.
  Brute-force check on every subfamily for layers of at most 12 states and 2,000 random subfamilies otherwise, 14 pairs, with no
  failure.
- **Composition (ii).**
  - If `|X| ≤ x₀R_k`, Fact D applies.
  - Otherwise, the deletion deficit is `≤ (1 − δ)|X|` by P5, and the switch weight is `≥ (|X| − |X''|)/(d − 1)`.
  - That weight is `≥ (1 − δ)|X|`, because `|X|(1 − (d − 1)(1 − δ)) > x₀R_k(1 − (d − 1)(1 − δ)) ≥ |X''|`.
  - So `Σ_{N(X)} w ≥ δ|X| + (1 − δ)|X| = |X|`. Correct.
- **(i).** `δ ≥ 1` iff `3p ≥ 2N + 5`, and then this is P9 (⇐). It has no spectral input.

*Negative controls* (`sr10_lemmaC_small.py`). On every one of C-T1-U's balanced-rank sector-Hall failure rows, Lemma C's
conditions fail:
- `(7, 1)`: `(d − 1)(1 − δ) = 1`;
- `(10, 1)`: `(d − 1)(1 − δ) = 9/8`;
- `(14, 2)`, `(17, 2)`, `(20, 2)`: margins 0.0181, 0.0140 and 0.0115.

My exact abstract sector max-flow at `(7, 1, 5)` reproduces the recorded deficiency 21 (672 sources, flow 651).

*No positive control is brute-forceable.* The smallest parameter set where (ii) applies (`d ≤ 12`, `dm ≤ 80`) is `(2, 11, 15)`,
with `R_k ≈ 5.6×10^9` (`sr10_find_ii.py`). Lemma C (ii)'s evidence is therefore its proof plus the component checks above. That is
consistent with its `proved_informal` (conditional) grade and not a weakness of the grade.

*`CB(8, 92)` numbers* (`sr_cb892.py`, literal 1567-vertex tree, generic DP, cross-checked against the closed form):
- `n = 1567`, `α = 829`, `x = 490`, window `[492, 552]` (61 ranks), 737 leaves.
- `Δ_p(T − v) < 0` and `Δ_p(T − c) < 0` at every eligible `p`, with `c` spot-checked at `c_{0,0}` and `c_{91,7}` (identical
  polynomials). `S_8 ≀ S_92 ≤ Aut(T)` is transitive on the 736 private leaves, and `F_p` is `Aut`-invariant, so `F_p` = all 737
  leaves.
- At `p = 492`: `k = 491`, `Z' = 246`, `δ = 491/492`, `λ₂ = 241080`, `k² = 241081`, `x₀ = 1/492`, `(d − 1)(1 − δ) = 7/492`,
  `|X''|/R_491 = 1.0932×10^{−7}`, margin `x₀R_491(485/492)/|X''|` = **18,328.28**. So (ii) holds.
  - `|X''| = [t^k] g_8(t)^{92}`, where `g_d(t) = (1+2t)^d − d·t·((1+t)^{d−1} − 1)` is the per-group count of states with no
    "exactly one support and at least one leaf" configuration.
- For every `p ∈ [493, 552]`, `δ ≥ 1`, so (i) holds.

*Grade audit.*
- `proved_informal modulo the cited node (n1)` is honest for (ii). The proof is complete except the classical Boolean-lattice
  up–down spectrum, which is cited. The flip-character reduction to it is proved on C-T1-F's face.
- (i), and hence sector Hall at `p ≥ 493`, carries NO spectral node. It is `proved_informal` outright, and it does not depend on
  `F_p` at all.
- `computer_assisted` at `p = 492` is honest and required. Two numeric inputs enter there, and (n1) is cited:
  - the exact coefficient `|X''|`;
  - the favorability `F_492` = all leaves, needed for (ii)'s private-leaf hypothesis. It is an exact DP evaluation, with no
    `decide` and no proof.

## Findings and repairs

1. **SR-7: confirmed as stated.**
   - The corrected hypothesis is exactly what the statement uses.
   - Independence of `Q` and the word "induced" are not load-bearing but harmless.
   - The group action is unnecessary: direct biregularity suffices. Route 2 is the recommended proof on the face, and it matches
     the T adjudicator's Lean DAG.
   - No novelty should be claimed (C-T1-U, T adjudicator: a textbook normalized-matching fact).
   - My registration text adds explicit fences and the weighted-reading separation. Neither changes the statement.
2. **SR-8: repair (missing hypothesis on the face).**
   - P6's hypothesis column reads only "literal (S); `F` fixed". But `w_F(A) = ℓ_i(B)` holds only when the group-`i` private
     leaves are in `F`. In general `w_F(A) = #{j : c_{ij} ∈ B ∩ F}`.
   - For `F = F_p(T)` the private leaves are all in or all out, by `Aut`-transitivity. If out, every choke-switch image has
     weight 0.
   - Completeness should also be on the face: the `s`-switch and the single-support choke switches are the ONLY switch arcs out
     of a sector source.
   - The whole-sector capacity formula inherits the private-leaf hypothesis.
3. **SR-9: repair (direction-specific hypotheses; qualify "cut").**
   - P9's (⇐) needs no hypothesis on `F` or on `p`'s range. Its (⇒) needs `v ∈ F_p` and `2 ≤ p ≤ dm + 1`. The statement as given
     (hypotheses on both) is correct, and the registration should say which direction uses what.
   - "Deficient cut" must read "deficient in the deletion-only network (active weight)". It is not a (CUT) of (HALL): the switch
     exits carry 6,128.8×, 6,563.1× and 7,012.3× the deficit at the three rows.
   - The multiples also need the private leaves in `F`, which holds at all three rows.
   - The scan (4,974 configurations, three rows, `CB(8, 86)`/460 smallest) and the multiples are reproduced exactly.
4. **SR-10: repair (grade split and record wording).**
   - Lemma C should be registered with (i) `proved_informal` (no node) and (ii) `proved_informal` modulo (n1). The synthesis
     qualifies the whole of P7.
   - The record line for `p = 492` must carry "(n1) cited" on its face, next to `computer_assisted`. The synthesis's record
     bullet omits it.
   - "737 favorable at every eligible `p`" is exact computation plus `Aut`-transitivity, so it is `bounded_computation`. The
     record must not present it as proved.
   - Otherwise the record text is a predicate the evidence satisfies.
5. **Node (n1) is closable on the face, offered as a route record, NOT used to raise the grade here.**
   - On level `j` of the Boolean lattice `B_n`, `D_{j+1}U_j − U_{j−1}D_j = (n − 2j)I`. Expand both sides; the off-diagonal
     exchange terms cancel. I verified this identity exactly for `n ≤ 8`, all `j`.
   - Induction on `j`: level `j = U(level j − 1) ⊕ ker D_j` when `j ≤ n/2`. This gives the eigenvalues of `U_{j−1}D_j` as
     `Σ_{l=i+1}^{j}(n − 2l + 2) = (j − i)(n − j − i + 1)` on the component born at level `i`. Complementation `S ↦ [n] ∖ S`
     handles `j > n/2` and gives the same formula.
   - This is the standard sl₂ argument, and it would remove the "modulo (n1)" qualifier. It is first written here, at a second
     read, so I leave the registered grade qualified. It is recommended as the Cycle 2 T1 `(n1)` face proof, with its own check.
6. **Single-instrument extension, not registered: Lemma C (ii) also covers the two smaller rows.**
   - At `CB(8, 86)`, `p = 460`: margin 6,863.26 (`x₀ = 1/460`, `c = 7/460`).
   - At `CB(8, 89)`, `p = 476`: margin 11,209.54 (`x₀ = 1/476`, `c = 1/68`).
   - At both, the private leaves are favorable at every eligible `p`, and (i) holds at every other eligible `p`.
   - This closes, at one instrument, the synthesis R6 gap "`CB(8, 89)`/476 not individually replayed".
   - Grade would be `computer_assisted` modulo (n1). A second instrument is needed before it enters the record.
7. **Coverage boundary replayed.**
   - Not covered by Lemma C: `CB(8, 108)`, `p = 577` (`x₀ = −287/289`), and `CB(7, 144)`, `p = 673` (`x₀ = −335/337`).
   - Covered by (ii): `CB(8, 107)`, `p = 572`.
   - This agrees with C-T1-F and the T adjudicator. The ordering by `n` is 1839 < 2163, consistent with synthesis R7.
8. **Fences held throughout.** Nothing here touches (HALL) at any tree, the primary aggregate, or any refuted key.
   - P5 is unweighted and sector-only.
   - P8/P9 concern the ACTIVE-weight deletion-only network, not `E993-R23-LITERAL-DELETE-ONLY-HALL` (different weight, different
     sector object).
   - Lemma C is sector-only; mixed and non-sector subfamilies of `CB(8, 92)` are open.
   - No census value enters a proof. The `|X''|` coefficient enters only the `computer_assisted` line.

## Registration text

**Registration 1 (SR-7). Key `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`, VERIFIED `proved_informal`.**

> *Statement.* Let `G` be a finite simple graph and `Q ⊆ V` independent, and suppose `G − N_G[Q]` is a perfect matching on `N`
> edges `{b_i, c_i}`. For `k ≥ 1` let `S^Q_{|Q|+k} := {B ∈ I_{|Q|+k}(G) : Q ⊆ B}`, and for `X ⊆ S^Q_{|Q|+k}` let
> `∂_Q X := {B ∖ {y} : B ∈ X, y ∈ B ∖ Q}`. Then `k·|X| ≤ 2(N − k + 1)·|∂_Q X|`; equivalently `|∂_Q X|·R_k ≥ |X|·R_{k−1}` with
> `R_k = C(N, k)·2^k`. (For `k > N` the family is empty; the ℕ form needs no guard.)
>
> *Proof on the face.* `S^Q_{|Q|+k}` is the rank-`k` layer of `{0,1,2}^N`, and `∂_Q` is its covering relation. The cover graph is
> biregular (down-degree `k`, up-degree `2(N − k + 1)`), and double counting gives the inequality. Equivalently, T1's Lemma 1
> with the ABSTRACT group `S_N ≀ (ℤ/2)^N`. No automorphism of `G` is used.
>
> *Grade.* `proved_informal`. Isolated second read SR-SECTOR confirmed it; bounded check on 93 general-graph instances and
> 127,650 subfamilies.
>
> *Novelty.* None claimed: the classical normalized-matching property of the rank levels of a product of three-element "V"
> posets.
>
> *Attribution.*
> - r30 T1 (Lemma 1, the normalized-matching bound);
> - C-T1-F and C-T1-U (corrected hypothesis replacing T1 §4's vacuous `Aut(T)` hypothesis);
> - r30 T adjudicator (direct biregularity DAG);
> - second read SR-SECTOR.
>
> *Fences.*
> - Unweighted and sector-only.
> - Not (HALL), not (HALL-COND) for any `X`, not deletion-only Hall, and not `E993-R23-LITERAL-DELETE-ONLY-HALL`.
> - No tree, weight, selector or eligibility hypothesis.
> - The weighted `CB` reading (`w_F ≡ [v ∈ F]` on the `(r, v)`-sector; `|∂X| ≥ |X|·491/492` for `X ⊆ S_493` at `CB(8, 92)`) is a
>   scope note on `R30-CB-RECORD`, not part of this key.

**Registration 2 (SR-8). Scope note P6 on `R30-CB-RECORD`, `proved_informal`. Not a key.**

> *Statement.* Let `T = CB(d, m)` (path `r–s–v`; chokes `u_i ~ r`; supports `b_{ij} ~ u_i`; private leaves `c_{ij} ~ b_{ij}`), let
> `F` be a fixed set of original leaves (in particular `F_p(T)`), and let `B ∈ I_{p+1}(T)` with `r, v ∈ B`.
> 1. The switch arcs (S) out of `B` are exactly two kinds:
>    - the `s`-switch, `(B ∖ {r, v}) ∪ {s}`;
>    - for each choke `u_i` with exactly one support `b_{ij0}` of group `i` in `B`, the image `A = (B ∖ {r, b_{ij0}}) ∪ {u_i}`.
> 2. Each such `A` is independent of size `p`, and `w_F(A) = #{j : c_{ij} ∈ B ∩ F}`:
>    - `v` is inactive (`W_v = {r}`), and other groups' tags are inactive;
>    - this equals `ℓ_i(B)`, the number of group-`i` leaves present in `B` (`0 ≤ ℓ ≤ d − 1`), when the group-`i` private leaves
>      are in `F`;
>    - for `F = F_p(T)`, either all private leaves are in `F` or none (`S_d ≀ S_m ≤ Aut(T)`).
> 3. `A` has exactly `d − ℓ` sector preimages under (S) and none under (D).
> 4. The `s`-switch image, `B ∖ {r}` and `B ∖ {v}` have weight 0 for every `F`.
>
> Consequently, with the private leaves in `F`, the whole-sector distinct switch capacity is
> `m·Σ_{ℓ=0}^{d−1} ℓ·C(d, ℓ)·C(d(m−1), p−2−ℓ)·2^{p−2−ℓ}`. Each distinct target `(i, L, rest)` is counted once.
>
> *Grade.* `proved_informal`. Literal enumeration on 8 small `CB(d, m)` (`n ≤ 24`), 196 `(p, F)` rows including the literal
> `F_p`, is `bounded_computation`.
>
> *Attribution.*
> - r30 T1 (formula);
> - C-T1-F and C-T1-U (the `s`-switch, the `r`/`v` deletions, the preimage count, the factor `m`);
> - r30 T adjudicator;
> - Codex (corrected sector facts, active-tag weight);
> - SR-SECTOR (the `F`-membership qualifier and the completeness of the switch list).
>
> *Fences.* Sector sources only. Sources with `r ∉ B` that reach the same targets are not addressed. Not (HALL).

**Registration 3 (SR-9). Scope notes P8 and P9 on `R30-CB-RECORD`.**

> *P8 (`proved_informal`).* Let `T = CB(d, m)`, `N = dm`, `2 ≤ p ≤ N + 1`, `v ∈ F_p(T)`, and
> `X_sec := {B ∈ I_{p+1}(T) : r, v ∈ B}`.
> - `|X_sec| = |R_{p−1}|`, and every member has active weight 1.
> - The positive-weight part of its deletion image is exactly the `(r, v)`-sector of `I_p`: `|R_{p−2}|` targets of weight 1
>   (`B ∖ {r}` and `B ∖ {v}` have weight 0). Here `|R_j| = 2^j·C(N, j)` and `|R_{p−1}|/|R_{p−2}| = 2(N − p + 2)/(p − 1)`.
> - So `X_sec` is deficient in the deletion-only network (active weight) iff `3p < 2dm + 5`, with deficit `|R_{p−1}| − |R_{p−2}|`.
>
> *P9 (`proved_informal`; composition of P5 with P8).*
> - If `3p ≥ 2dm + 5`, then `Σ_X w_F ≤ Σ_{N_D(X)} w_F` for every `X ⊆ X_sec`. This is P5 with `Q = {r, v}` and `k = p − 1`, and
>   needs no hypothesis on `F` or on `p`'s range.
> - If `v ∈ F_p`, `2 ≤ p ≤ dm + 1` and `3p < 2dm + 5`, then `X_sec` itself fails it.
> - Hence, under `v ∈ F_p` and `2 ≤ p ≤ dm + 1`: deletion-only Hall holds on every sector subfamily iff `3p ≥ 2dm + 5`.
>
> *Record data (`bounded_computation`; exact closed forms validated against the literal forest DP).* Among all 4,974 `CB(d, m)`
> with `n ≤ 1600`, exactly three have an eligible sector-deficient `p`, each at `p = x + 2` and unique in its window:
> - `CB(8, 86)`, `p = 460` (`n = 1465`, `α = 775`, `x = 458`, window `[460, 516]`, ratio 460/459);
> - `CB(8, 89)`, `p = 476` (`n = 1516`, `α = 802`, `x = 474`, window `[476, 534]`, ratio 476/475);
> - `CB(8, 92)`, `p = 492` (`n = 1567`, `α = 829`, `x = 490`, window `[492, 552]`, ratio 492/491).
>
> At each, `v` and all private leaves are favorable at every eligible `p`. The whole-sector choke-switch capacity (P6 formula,
> private leaves in `F`) is 6,128.8×, 6,563.1× and 7,012.3× the deletion deficit (floors 6128, 6563, 7012).
>
> *Attribution.*
> - Codex (corrected sector facts: weight one, `492/491`, `|R_490|/491`);
> - C-F1-T and C-F1-U (the criterion and `CB(8, 86)`);
> - r30 F and U adjudicators (re-derivations, scans with `n ≤ 1600`, multiples);
> - r30 T1, C-T1-F and C-T1-U (P5; C-T1-U A1 = the (⇐) direction);
> - the Stage 6 synthesis (P9 composition);
> - SR-SECTOR.
>
> *Fences.*
> - `X_sec` is not a (CUT) of (HALL): its switch exits carry the multiples above.
> - Active-weight deletion-only network, not `E993-R23-LITERAL-DELETE-ONLY-HALL` (different weight, different sector object).
> - No statement about `S`. Mechanism ≠ aggregate.

**Registration 4 (SR-10). Scope note P7 (Lemma C) and the `R30-CB-RECORD` record text.**

> *Lemma C (C-T1-F).* Let `T = CB(d, m)`, `N = dm`, `2 ≤ p ≤ N + 1`, `k = p − 1`, `Z' = N − k + 1`, `δ = k/(2Z')`, and
> `R_j = 2^j·C(N, j)`. Let `X''` be the switch-dead family: the members of `X_sec` in which no group has exactly one support and at
> least one private leaf. Then `|X''| = [t^k] g_d(t)^m` with `g_d(t) = (1+2t)^d − d·t·((1+t)^{d−1} − 1)`.
>
> (HALL-COND) `Σ_X w_F ≤ Σ_{N(X)} w_F` for the literal relation (D) ∪ (S) holds for every `X ⊆ X_sec` if either:
> - (i) `δ ≥ 1` (⟺ `3p ≥ 2dm + 5`), by deletion arcs alone, for any `F`; or
> - (ii) `δ < 1`, `v` and the private leaves are in `F`, `x₀ := (k² − 2(k − 1)Z')/(2Z') > 0`, `(d − 1)(1 − δ) < 1`, and
>   `x₀·R_k·(1 − (d − 1)(1 − δ)) ≥ |X''|`.
>
> *Grade.*
> - (i): `proved_informal`.
> - (ii): `proved_informal` modulo ONE cited classical node (n1). The node: every eigenvalue of `BBᵀ` on `𝟙^⊥` (`B` the sector
>   cover matrix between ranks `k` and `k − 1` of `{0,1,2}^N`) is at most `2(k − 1)(N − k + 1)`. It is reduced on C-T1-F's face,
>   by the flip-character decomposition, to the Boolean-lattice up–down spectrum `(j − i)(n − j − i + 1)`, and that spectrum is
>   cited.
> - Exact spectrum replays (T adjudicator: 13 `(N, k)`; SR-SECTOR: 14 `(N, k)` with multiplicities) are checks, not the proof.
>
> *Attribution.* C-T1-F (Lemma C, Facts A–D); C-T1-U (A1 = (i)); r30 T adjudicator (replays); SR-SECTOR.
>
> *Fence.* Sector subfamilies only. Not (HALL).

> **`R30-CB-RECORD` (Tier 3 record; `bounded_computation` with the proved sector facts noted; a record, not a key on (HALL)).**
>
> *Tree.* `CB(8, 92)`: path `r–s–v`, 92 chokes `u_i ~ r`, 8 supports `b_{ij} ~ u_i`, and one private leaf `c_{ij} ~ b_{ij}`.
> - `n = 1567` (connected and acyclic, checked separately);
> - `α = 829`; `x = 490`, the first strict descent computed through `α`;
> - eligible window `p ∈ [492, 552]` (61 ranks);
> - `F_p` = all 737 original leaves (`v` and the 736 private leaves) at every eligible `p` (exact DP; the private leaves by
>   `S_8 ≀ S_92` transitivity);
> - `S(CB(8, 92), 492) < 0`. The exact value is in the frozen `cb-switch-cut/RESULTS.json`; the sign was re-derived by the tag route.
>
> *Grade:* `bounded_computation`.
>
> *Sector* (`r, v ∈ B`; hence no choke and no `s`).
> - Every sector member has active weight exactly 1 at every eligible `p`: `v` is active through `W_v = {r}`, and every private
>   tag is inactive. `proved_informal`.
> - At `p = 492`: `|R_491|/|R_490| = 492/491`, and the whole-sector deletion-only shortfall is `|R_491| − |R_490| = |R_490|/491`.
>   Exact. The earlier `493/491` used the wrong weight and stays struck.
> - The whole sector's choke-switch exits carry 7,012.3× that shortfall (floor 7012). T1's 76 omitted the factor `m = 92` and is
>   struck. `bounded_computation`, one `X`.
>
> *Sector Hall.* (HALL-COND) holds for every `X ⊆ {B ∈ I_{p+1} : r, v ∈ B}` under the mixed relation (D) ∪ (S), at every eligible `p`:
> - `p ∈ [493, 552]`: by Lemma C (i), deletion arcs alone. `proved_informal`.
> - `p = 492`: by Lemma C (ii), margin `x₀R_491(485/492)/|X''| = 18,328.28` (`x₀ = 1/492`, `|X''|/R_491 = 1.0932×10^{−7}`).
>   `computer_assisted`: the exact `|X''|` coefficient and `F_492` are numeric inputs, and the classical node (n1) is cited.
>
> *Scope notes.* P6 (Registration 2); P8, P9, the three sector-deficient rows with `n ≤ 1600` and the multiples 6,128.8×,
> 6,563.1× and 7,012.3× (Registration 3); Lemma C (Registration 4).
>
> *Fence.* This is **not (HALL) on `CB(8, 92)`**. Subfamilies not contained in the root-plus-arm sector are open. That includes
> mixtures, and sources with `r ∉ B` that compete for the same choke-switch targets. No statement about the primary aggregate
> `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`.
>
> *Attribution.*
> - Codex (the `CB(8, 92)` row and the corrected sector facts: weight one, `492/491`, `|R_490|/491`);
> - r30 T1 (sector normalized-matching bound; switch-image formula);
> - C-T1-F (Lemma C; factor-`m` correction; coverage sweep);
> - C-T1-U (A1; factor-`m` correction; corrected hypothesis);
> - C-F1-T and C-F1-U (the sector criterion; `CB(8, 86)`);
> - r30 T and F adjudicators (replays);
> - controller CF6-0, as a prior only;
> - second read SR-SECTOR.

Not for registration: Finding 5 (the (n1) face proof; route record for Cycle 2 T1) and Finding 6 (Lemma C (ii) at `CB(8, 86)` and
`CB(8, 89)`; one instrument; needs a second).

## Verdicts

verdict[SR-7]: confirmed
verdict[SR-8]: confirmed_with_repairs
verdict[SR-9]: confirmed_with_repairs
verdict[SR-10]: confirmed_with_repairs

headline_resolved: no. (HALL) stays OPEN and the primary aggregate is untouched.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-sr-SR-SECTOR/`.
Replay any file with `python3 -B <file>` in that directory.

| file | SHA-256 | role |
|---|---|---|
| `seal_audit.py` | `8eb2a97e9d135166bc64c3a7e8e680ef9d3b090bef87e1db20fe028e8915b2d4` | capsule seal and 20 member digests |
| `sr_lib.py` | `1de33c20ec2b3db5da7e1cc5c81970d54d9d79a9a3b704b69d05d197f52a2cbe` | `CB` builder, tree tests, forest DP, `α`/`x` |
| `sr7_p5_check.py` | `a4d745e053ba46335726462822adad6ab6e838b214897994f36d1258b4a8fc89` | P5 on general graphs (biregularity plus subfamilies) |
| `sr7_p5_check.json` | `91a1cc96ff12c64a1d35957cbac14c4019ad3ddb87ff6e2d3243309a753bd970` | output |
| `sr8_small_enum.py` | `6dd11181123798427d36a0f13317303984e1f7d3c99d36686ecc6b5aa2016e9b` | literal `CB` enumeration: WID, weights, switch list, preimages, formula, P8 |
| `sr8_small_enum.json` | `8b3b97d7fcd64ab5d435b75eda770e1888fd5a8b3d7d87a24bd10455a220ad14` | output (196 rows) |
| `sr9_scan1600.py` | `e0a85a7e9a0e81e8a33c159102eccf7a20cd4c8917899f8d4361e9ab783c1a25` | exhaustive `n ≤ 1600` scan (window bound corrected before the reported run) |
| `sr9_scan1600.json` | `0d025ec38f9054744684cca38ed815007cb4fc74627cfdec5392a66aec869a5a` | output (4,974 configurations; three rows) |
| `sr_cb892.py` | `1be0b9cd699e1e22261d9b161da802cee578050f98cf258823ab06d0ce68a2f6` | literal `CB(8, 86/89/92)`: window, favorability, `S` sign, sector, multiples, Lemma C numbers |
| `sr_cb892.json` | `23b8434c13964ab93c362077eb7c8685613ebba4a6076b19a7272a82f3fed220` | output |
| `sr10_spectral.py` | `95ad2d8ba27d792fefc268478fea078827ce1131eca7fca2811a84e140e5652f` | exact `BBᵀ` spectrum (14 pairs), Tanner brute force, Boolean commutation identity (`n ≤ 8`) |
| `sr10_spectral.json` | `43533db9d07643164e9ca33809eb7868412735c5b9a8c3f735a910717c8bba83` | output |
| `sr10_lemmaC_small.py` | `8c3ea108b7aa8a3e4544554bc74a940137c10569c20f1457fc5cc91e22d8cde5` | Lemma C conditions on the C-T1-U failure rows; `(7, 1, 5)` max-flow |
| `sr10_lemmaC_small.json` | `88cb911535d66df98cae1729f7e4d2fe7387890fd349ca6d016037bdc95ffc33` | output |
| `sr10_find_ii.py` | `3e68cce4d2644e155d96c067fda476d2402976149e99992ff2adada4c1b2c834` | smallest (ii)-applicable parameters (stdout only) |
| `sr10_uncovered.py` | `56545a00074940ff21db5e1f16b8b8e5634af952491d40d67df145c747f551e2` | Lemma C at `CB(8, 107)`, `CB(8, 108)`, `CB(7, 144)` |
| `sr10_uncovered.json` | `05d5878cd947b12c59913a09fe85ac32148a9b11ab582e17293da6abb5823cc2` | output |

No sealed member was edited. No background job was started. No `__pycache__` was written (`-B` everywhere).
