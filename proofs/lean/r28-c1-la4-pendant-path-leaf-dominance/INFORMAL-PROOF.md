# Informal Proof — C1-LA4, pendant-path leaf dominance (r28, Cycle 1 Stage 7)

Producer: `c1-la4-formalizer-opus-20260925` (governed formalizer seat; chartered Claude Opus 5, effort high,
stated on dispatch-record authority; the seat cannot self-inspect its runtime model or effort).
Key: `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`. Terminal declaration: `Erdos993G1.pendant_path_leaf_dominance`.

This proof is written at the granularity of the Lean declarations in `LeanProject/LeanProof/Main.lean`
(registrar entries 7–12). The mathematics was proved and second-read before this seat opened
(`SOURCES/SR-PP-SECOND-READ.md`, PP-1). This document is an input for the independent informal audit, not an
audit.

## 1. Statement

**Definitions (entries 1–5, carried; see §6).** `X` a finite type with decidable equality; `G : SimpleGraph X`
with decidable adjacency. `Erdos993G1.occ G v k := ((G.indepSetFinset k).filter (fun J => v ∈ J)).card`, the
number `c_v(k)` of independent `k`-sets of `G` containing `v`.

**Theorem (entry 12).** Let `m ∈ ℕ` and `u : Fin (m + 2) → X` satisfy

- (H-inj) `u` is injective;
- (H-adj) `u j ~ u (j + 1)` for every `j ≤ m` (Lean: `∀ i : Fin (m + 1), G.Adj (u i.castSucc) (u i.succ)`);
- (H-deg2) `deg u_j = 2` for every `0 < j < m + 1` (the interior vertices `u_1, …, u_m`);
- (H-leaf) `deg u_{m+1} = 1` (the end `ℓ := u_{m+1}` is a leaf); `u_0` has arbitrary degree.

Then for every `k ∈ ℕ` and every position `i ∈ {0, …, m + 1}`: `c_{u_i}(k) ≤ c_ℓ(k)`.

Index convention. The Lean path has `m + 2` vertices `u_0, …, u_{m+1}`. The SR-PP / SEMANTIC-CONTRACT form writes
the same path as `u_0, …, u_M = ℓ` with `M ≥ 1`; `M = m + 1`. The synthesis's "`m = 1` case" (SR-PP indexing: a
leaf and its support) is the Lean `m = 0` case, which the brief calls `m = 0`; both name the same instance, the
registered `E993-PAIR-R-LE-G-POINTWISE` clause (i), cited as corroboration only and never re-registered.

**Hypotheses that do not occur.** No tree, forest, connectivity or acyclicity hypothesis: `G` is any finite simple
graph. No `n ≥ 2` hypothesis (the path itself has `m + 2 ≥ 2` distinct vertices, so `n ≥ 2` holds automatically, but
the proof never uses it). No `k ≥ 1` hypothesis: the argument is uniform in `k`, and `k = 0` needs no separate case
(both counts are 0 there, and the injection below covers it anyway). No threshold `t` occurs in this statement.
Nothing is assumed about `deg u_0`.

## 2. Lemma A — neighbours of a non-anchor path vertex (entry 7, `pendant_path_adj_of_pos`)

*Statement.* Under (H-inj), (H-adj), (H-deg2), (H-leaf): if `0 < a ≤ m + 1` and `y ~ u_a`, then `y = u_b` for some
position `b` with `b + 1 = a` or `a + 1 = b`.

*Proof.* `u_{a−1} ~ u_a` by (H-adj) (at `j = a − 1`, which needs `0 < a`).
- If `a < m + 1` (interior): also `u_a ~ u_{a+1}` by (H-adj). `u_{a−1} ≠ u_{a+1}` by (H-inj). So the two-element set
  `{u_{a−1}, u_{a+1}}` lies in `N(u_a)`, and `|N(u_a)| = deg u_a = 2` by (H-deg2). A subset of a finite set with at
  least its cardinality is the whole set, so `N(u_a) = {u_{a−1}, u_{a+1}}` and `y` is one of the two.
- If `a = m + 1` (the leaf): `{u_m} ⊆ N(u_{m+1})` and `|N(u_{m+1})| = 1` by (H-leaf), so `N(u_{m+1}) = {u_m}`. ∎

(H-deg2) and (H-leaf) enter here and nowhere else.

## 3. Lemma B — path adjacency is consecutive (entry 8, `pendant_path_adj_consec`)

*Statement.* If `u_a ~ u_b` then `a + 1 = b` or `b + 1 = a`.

*Proof.* If `0 < a`, Lemma A gives `u_b = u_c` with `c` consecutive to `a`, and `b = c` by (H-inj). If `a = 0`,
then `a ≠ b` (adjacency is irreflexive, so `u_a ≠ u_b`), hence `0 < b`; apply Lemma A to `u_b ~ u_a` and (H-inj). ∎

## 4. Lemma C — off-path neighbours only at the anchor (entry 9, `pendant_path_adj_mem_range`)

*Statement.* If `0 < a` and `y ~ u_a`, then `y` lies on the path (`y ∈ range u`). *Proof.* Lemma A. ∎

## 5. The shift permutation and the injection

**Lemma D (entry 10, `exists_pendant_shift_perm`).** For `i < m + 1` the index map

```
π(j) = j          if j < i
π(j) = m + 1      if j = i
π(j) = m          if j = i + 1
π(j) = j − 2      if j ≥ i + 2
```

is a permutation of `{0, …, m + 1}`. *Proof.* Each value is `≤ m + 1` (for `j ≥ i + 2`, `j − 2 ≤ m − 1`), and the
map is injective: the four branches have pairwise disjoint ranges (`[0, i)`, `{m + 1}`, `{m}`, `[i, m − 1]`) and
each branch is injective on its domain. An injective self-map of a finite set is a bijection. The subtraction
`j − 2` is ℕ-subtraction guarded by `j ≥ i + 2 ≥ 2`. ∎

This is the two-step shift of `C-T1-U` (Finding 1: identity off the tail, `φ(u_j) = u_{j−2}` on the tail
`u_{i+2}, …, u_{m+1}`, `u_i ↦ ℓ`), completed to a permutation by sending `u_{i+1} ↦ u_m`. The completion is harmless:
`u_{i+1}` never lies in an independent set containing `u_i`.

**Vertex permutation.** Let `σ` be the permutation of `X` with `σ(u_j) = u_{π(j)}` and `σ(x) = x` for `x` off the
path (Mathlib `Equiv.Perm.viaEmbedding` of `π` along the embedding `u`, which is an embedding by (H-inj)). In
particular `σ(u_i) = u_{m+1} = ℓ`.

**Lemma E (entry 11, `pendant_path_occ_le_of_lt`).** For `i < m + 1` and every `k`: `c_{u_i}(k) ≤ c_ℓ(k)`.

*Proof.* The map `J ↦ σ(J)` sends the independent `k`-sets containing `u_i` injectively into the independent `k`-sets
containing `ℓ`:
- injective and card-preserving because `σ` is a permutation (image of a finset under an embedding);
- `ℓ = σ(u_i) ∈ σ(J)`;
- `σ(J)` is independent. Fix an independent `J ∋ u_i`. Write `S := {j : u_j ∈ J}`. By (H-adj) and independence, `S`
  contains no two consecutive positions (fact (N)); in particular `i − 1, i + 1 ∉ S`. Let `x, y ∈ J` and suppose
  `σ(x) ~ σ(y)`; we derive a contradiction in four cases.
  1. *Both off the path.* `σ(x) = x`, `σ(y) = y`, so `x ~ y` inside `J`. Contradiction.
  2. *`x = u_a` on the path, `y` off it.* `σ(y) = y` and `u_{π(a)} ~ y`. If `π(a) > 0`, Lemma C puts `y` on the
     path — contradiction. If `π(a) = 0`: by the definition of `π`, (N) at the pair `(a, i)`, `a ≤ m + 1`, and
     `i < m + 1`, either `π(a) = a` (the case `a < i`) or `π(a) = i` (the case `a = 2`, `i = 0`); the branches
     `a = i` (value `m + 1 ≥ 1`) and `a = i + 1` (excluded by (N)) cannot give 0. Either way `u_{π(a)} ∈ J`, so
     `u_{π(a)} ~ y` is an edge inside `J`. Contradiction. This is where the anchor `u_0`'s arbitrary degree is
     handled: when `i = 0` and `u_2 ∈ J`, the shifted vertex lands on `u_0 = u_i ∈ J`, whose off-path neighbours
     are absent from `J` (C-T1-U's "`i = 0`" bullet).
  3. *`x` off the path, `y = u_b` on it.* Symmetric to case 2 (adjacency is symmetric).
  4. *Both on the path, `x = u_a`, `y = u_b`.* By Lemma B, `π(a)` and `π(b)` are consecutive. With (N) at the pairs
     `(a, b)`, `(a, i)`, `(b, i)` this is impossible, by the branch table of `π`:
     - `a, b < i`, or `a, b ≥ i + 2`: `π` is a translation on the pair, so `a, b` are consecutive; contradicts (N).
     - `a < i`, `b = i`: `π(b) = m + 1` and `π(a) = a < i ≤ m`, so `π(a) + 1 ≤ m < m + 1`; not consecutive.
     - `a < i`, `b ≥ i + 2`: `π(b) = b − 2 ≥ i > a`; consecutiveness forces `b = a + 3`, so `a ≥ i − 1`, i.e.
       `a = i − 1`, which (N) at `(a, i)` excludes. (This is the "gap at `u_{i−1}`".)
     - `a = i`, `b ≥ i + 2`: `π(a) = m + 1`, `π(b) = b − 2 ≤ m − 1`; not consecutive.
     - any of `a, b` equal to `i + 1`: excluded by (N) at `(·, i)`.
     - `a = b`: `π(a) = π(b)`; not consecutive.
     All symmetric cases likewise. Contradiction.

Hence `σ(J)` is an independent `k`-set containing `ℓ`, and `c_{u_i}(k) = #{J} ≤ #{σ(J)} ≤ c_ℓ(k)`. ∎

Finiteness is the only structural input beyond the degree pattern; no acyclicity, connectivity or `k ≥ 1`.

## 6. Theorem (entry 12, `pendant_path_leaf_dominance`)

If `i < m + 1`, Lemma E. Otherwise `i = m + 1`, `u_i = ℓ`, and the inequality is `c_ℓ(k) ≤ c_ℓ(k)`. ∎

## 7. ℕ/ℤ cast audit

- Every count (`occ`, finset cardinalities) is a natural number; the conclusion is an inequality in ℕ with no
  subtraction and no cast.
- The ℕ-subtractions in the proof are index arithmetic only: `a − 1` (guarded by `0 < a` in Lemma A) and `j − 2`
  (guarded by `j ≥ i + 2` in Lemma D). Both are guarded; Lean's `omega` discharges each use with the guard in
  context.
- `deg v − 2` occurs only inside the carried definition `slotsAtLeast` (guarded there by `3 ≤ deg v` in its filter);
  it is registered with the definition layer (R1/R3) and is not used by this theorem. The slot count in ℤ and the
  quantity `t` do not occur.

## 8. Attribution

- Route: `C-T1-U` (Finding 1, the two-step shift / induced embedding), realized as the direct injection form the
  T adjudicator recommends (`## Lean readiness`: "`J ∋ u_i ↦ φ(J ∖ {u_i}) ∪ {ℓ}` with the two-step shift `φ`"),
  completed to a vertex permutation in-run by this seat.
- Independent derivations of the same lemma (SR-PP: "six presentations, one proof"): `C-T1-U` (two-step shift),
  `C-T1-F` and `C-T2-U` (induced-subgraph isomorphism `G − N[u_i] ≅ (G − N[ℓ]) − u_{i−1}`; polynomial identity at
  `u_0`), `C-T2-F`, `C-F2-T`, `C-F2-U` (exact nonnegative difference formulas). Second read: SR-PP (PP-1).
- The leaf/support case (Lean `m = 0`): T1 and F2; registered `E993-PAIR-R-LE-G-POINTWISE` clause (i) (VERIFIED),
  cited as corroboration, never re-registered.
- Common r28 attribution (synthesis `## Lean awards`): the mechanism, r27 critic `C-T2-U` (Finding 6, Steps A–D);
  the `2 ≤ n` correction, the r27 T adjudicator; the reformulation's second read, SR-JOIN; the degree lemma,
  Fang–Lu–Nevo–Yao–Zheng 2026 §8 (formal (DL) of record r27 C1-LA1 — an input, not used or re-proved here); Hall,
  classical via Mathlib (not used here).

## 9. Fences and excluded conclusions

- Not (PW): no branch vertex is compared with an arbitrary leaf; `u_i` is compared only with the leaf ending its
  own pendant path.
- Not stepwise monotonicity along the path: `c_{u_j}(k) ≤ c_{u_{j+1}}(k)` is REFUTED (`S(3,1,1)`, `k = 3`, values
  `(0, 3, 1, 3)` along `0–1–4–5`) and is not claimed.
- Not (HS), which is FALSE (`T22` / `R(3,2)_3`; SR-HS-REF). This lemma holds on `R(3,2)_3` at every vertex of every
  pendant path. Nothing here depends on `slot_leaf_sdr_exists` or `tree_leaf_slot_dominance`; neither is in the
  project.
- No status transfer to any fenced key (SOLUTION-CONTRACT §3.1); (DL) is neither re-proved nor edited.

## 10. Carry table

| Lean declaration | Registrar entry | Origin | Origin file SHA-256 | Fragment / declaration SHA-256 | Mode |
|---|---|---|---|---|---|
| `Erdos993G1.indepCount` | 1 | r25 award source, entry 1 | `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0` | entry `5484fc21ffce7bf707240da15858d7d82289f8e6f286a8fa9837cd9a0c474ccb` | byte-identical entry (registrar digest reproduces the original) |
| `Erdos993G1.indepDegreeSum` | 2 | r27 C1-LA1 award source, entry 7 | `b49ea82a33edc55f8185379c3abd44e13a17914b7f8b9ab0bf5e2aaac5aafc5a` | entry `a1ed32eb12b137ac5915bf15255c1173593296f3eb22127e2dcf0fab2ea9f38e` | byte-identical entry (replaces U1's re-typed text) |
| `Erdos993G1.occ` | 3 | U1 seat, `U1-Main.lean` lines 45–49 | `74ab21082d03161c1dc875eb04cb356e07d81de997b9e4a8ddacb4f982d628e5` | declaration text `009eec1acbfffe0272be4e99faf0707e336ea41330cd3ce0fbd22f61c77e3d6c`; fragment `db58fa8816d4fd3ced845333ac9fe9beb9802c0657631a15bb03e5ab273583e6` | declaration-level byte-identical; namespace wrapper added |
| `Erdos993G1.slotsAtLeast` | 4 | U1 seat, lines 51–55 | `74ab2108…e628e5` (as above) | declaration `1e3005c36f19aab1d63927c2002b7bc6875e15712da03e36841e3fd9c9f29f7f`; fragment `0c74d48cbf739f4bc344b3b64d7a60cb2ebda43753b66db8d2dec09f72285b73` | declaration-level byte-identical |
| `Erdos993G1.leavesAtLeast` | 5 | U1 seat, lines 57–60 | `74ab2108…e628e5` (as above) | declaration `5f3da12459b71b141aed70fab37bebe48b13b8e7db751c2ebbcd165d23a3e64f`; fragment `e916f3de7a4a8ebf1bbd40ebb6f5fe99d9779723e10f894ab43619e191cd55dd` | declaration-level byte-identical |
| `Erdos993G1.indepCount_eq_card_indepSetFinset` | 6 | r25 award source, entry 4 | `736eb9df…e7dfe0` (as above) | entry `4463e7eea65f11f69266095e58b54777ea245aa79caee47bf5b6e3ab77aa0eac` | byte-identical entry |
| `pendant_path_adj_of_pos`, `pendant_path_adj_consec`, `pendant_path_adj_mem_range`, `exists_pendant_shift_perm`, `pendant_path_occ_le_of_lt`, `pendant_path_leaf_dominance` | 7–12 | this formalizer seat, in-run | — | see `FORMALIZER-REPORT.md` | re-derived in-run (new Lean text; no fragment existed) |

No critic-authored Lean body is carried. The other carry files (`C-U1-T-CriticCheck.lean`, `C-U1-F-Critic.lean`,
`C-U1-F-Audit.lean`, `U2-Main.lean`, `C-U2-T-CritU2T.lean`, `C-U2-F-CritAdvance.lean`) were digest-verified and not
transported. Nothing from U2 is in the project.
