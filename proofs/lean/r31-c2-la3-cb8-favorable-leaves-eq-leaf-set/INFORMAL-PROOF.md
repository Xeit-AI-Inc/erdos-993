# INFORMAL-PROOF — C2-LA3 (r31): graph-level favorability, `favorableLeaves = leafSet` at `p*`

- Canonical run id: `erdos-993-math-dre-20260927-r31-cb-uniform-switch`
- Lean run: `lean-2026-09-28-c2-la3-cb8-favorable-leaves-eq-leaf-set`
- Producer: `c2-la3-formalizer-opus-20260928`. Chartered model: Claude Opus 5.5, effort high, on dispatch-record authority.
  Runtime-reported model id, verbatim: `claude-opus-5-5`.
- Governing text: `cycles/cycle-2/stage6/SYNTHESIS.md`, `## Lean awards` → `### C2-LA3 — graph-level favorability.`
  (copy `SOURCE/cycle-2-stage6-SYNTHESIS.md`), and the brief `control/C2-STAGE7-FORMALIZER-BRIEF-LA3.md`.
- Grade asserted here: none. This file is the statement-level informal proof the Lean text follows. The kernel receipt,
  the independent informal audit and the fidelity review are separate gates.

## Statement (frozen by the synthesis)

```lean
theorem E993Transport.cb8_favorableLeaves_eq_leafSet_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    favorableLeaves (cbGraph m) ((16 * m + 4) / 3) = C5LA1.leafSet (cbGraph m)
```

In words: on the literal tree `T_m = CB(8, m)` (the carried `cbGraph m` on `Fin (17m+3)`), for every `m ≥ 107` with
`m ≡ 2 (mod 3)`, every original leaf is strictly favorable at the single rank `p* = (16m+4)/3`. Here "strictly favorable at `p`"
is the carried `C4LA1.IsFavorableAt G v p`, meaning `Δ_p(T − v) = i_{p+1}(T − v) − i_p(T − v) < 0` (counts in `ℕ`, difference in `ℤ`).
So the fixed original strict selector `F_{p*}(T_m)` (the carried `favorableLeaves`) is the whole leaf set.

Hypotheses: `107 ≤ m` (passed through to C2-LA2, where it is unused, and used here only for `0 < m`) and `m % 3 = 2` (C2-LA2's
residue hypothesis). Neither is weakened nor strengthened.

## Definitions of record (carried byte-identically from C1-LA2; nothing re-typed)

| Lean name | Meaning |
|---|---|
| `C4LA1.vertexDeletionIndepSetCount G v k` | `i_k(G − v)`: independent `k`-subsets of `V` avoiding `v` |
| `C4LA1.vertexDeletionForwardDifference G v p` | `(i_{p+1}(G−v) : ℤ) − i_p(G−v)` |
| `C4LA1.IsFavorableAt G v p` | `vertexDeletionForwardDifference G v p < 0` |
| `C4LA1.IsGraphLeaf G v` | `∃! u, G.Adj v u` |
| `C5LA1.leafSet G` | the leaves of `G` (a `Finset`, classical filter) |
| `C5LA1.indepSetsAvoiding`, `C5LA1.indepSetCount G D k` | independent `k`-subsets avoiding `D`, and their number |
| `E993Transport.favorableLeaves G p` | `(leafSet G).filter (IsFavorableAt G · p)` |
| `E993Transport.cbEdge`, `cbGraph`, `cbGraph_decAdj`, `cbVertex` | `CB(8,m)` on `Fin (17m+3)`: `0 = r`, `1 = s`, `2 = v`; `u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j` (`i < m`, `j < 8`) |

Auxiliary (carried from C2-LA1 / C2-LA2): `critU3T_indepPoly G D` (the generating polynomial of `G − D` over `ℕ`),
`critU3T_cbPart m k` (the branch parts of `CB − r`), `polyCoeffZ` (C1-LA3 via C2-LA2).

## Closed forms used (the contract's `G`; synthesis correction 5)

- `G = (1+2X)^8 + X(1+X)^8` (an intact choke gadget).
- `G_c = (1+2X)^7(1+X) + X(1+X)^7` (the gadget of `u_i` with `c_ij` deleted). This is the factor of `I(CB − c_ij)`. The other
  factor `G' = (1+2X)^7 + X(1+X)^7` belongs to `I(CB − {c_ij, b_ij})`, which is not used here.
- `I(CB − v) = (1+X)G^m + X(1+2X)^{8m}`.
- `I(CB − c_ij) = (1+2X)·G_c·G^{m−1} + X(1+X)^2(1+2X)^{8m−1}`.

## DAG (the synthesis's nodes N1–N4; each item is one registered declaration)

Generic machinery, carried from C2-LA1 entries 36–37 and 521–538 (U3 Node 0 and C-U3-T's link, as C2-LA1 re-authored them):
- Vertex split (U3 Node 0, `indepSetCount_succ_split`): for `x ∉ D`, `i_{k+1}(G − D) = i_{k+1}(G − D − x) + i_k(G − D − N[x])`.
  Polynomial form (`critU3T_indepPoly_vertex_split`): `I(G − D) = I(G − D − x) + X·I(G − D − N[x])`.
- Branch product (`critU3T_indepPoly_disjoint_mul`, `critU3T_indepPoly_eq_prod`): if the surviving vertices split into pairwise
  disjoint parts with no edges between parts, `I` is the product of the parts' polynomials.
- Base values: `critU3T_indepPoly_eq_one` (nothing survives), `_single` (one vertex: `1+X`), `_edge` (one edge: `1+2X`).
- `CB` pieces: `critU3T_cb_pendant` (`{s, v}`: `1+2X`), `critU3T_cb_gadget` (gadget of `u_i`: `G`), `critU3T_cb_pairs` (all `8m`
  support–leaf edges: `(1+2X)^{8m}`).
- Coefficients: `critU3T_coeff_indepPoly`, `(critU3T_indepPoly G D).coeff k = indepSetCount G D k`.

**N2, the arm leaf `v`.** Re-authored from C-U3-T's draft `CriticU3T2.lean` (lines 288–376), the three declarations C2-LA1 left
off its DAG:
1. `critU3T_cb_gadgets`: with `r, s, v` deleted, the `m` gadgets give `G^m` (branch product over `critU3T_cbPart m (i+1)`).
2. `critU3T_cb_minus_v_closedForm`: split `CB − v` at `r`. Without `r`, `s` is isolated (`1+X`) beside the gadgets (`G^m`). Without
   `N[r] = {r, s, u_0..u_{m−1}}`, the `8m` support–leaf edges remain (`(1+2X)^{8m}`). Hence `I(CB − v) = (1+X)G^m + X(1+2X)^{8m}`.
3. `critU3T_cb_vertexDeletion_v_eq_coeff`: `vertexDeletionIndepSetCount (cbGraph m) v k` is the `k`-th coefficient of that
   polynomial over `ℕ`. The two counts are the same finset, because `univ.erase v = univ \ {v}`.

**N1, every private leaf `c_ij`, per `(i, j)` directly with no automorphism.** These are new declarations:
4. `cb8_indepPoly_isolated_factor` (generic): if `x ∉ D` and every neighbour of `x` lies in `D`, then
   `I(G − D) = (1+X)·I(G − D − x)`. Proof: the vertex split at `x`, where `D ∪ N(x) ∪ {x} = D ∪ {x}` as sets.
5. `cb8_damagedGadget`: the gadget of `u_i` minus `c_ij` gives `G_c`. Split at `u_i`. Without `u_i`, the survivors are the isolated
   support `b_ij` (`1+X`) and the seven edges `b_ij'c_ij'` with `j' ≠ j` (a product over `(range 8).erase j`, giving `(1+2X)^7`).
   Without `N[u_i] = {u_i, r, b_i0..b_i7}`, the seven leaves `c_ij'` with `j' ≠ j` survive (`(1+X)^7`). So `(1+2X)^7(1+X) + X(1+X)^7`.
6. `cb8_pairs_erase`: the `8m − 1` support–leaf edges other than `b_ij c_ij` give `(1+2X)^{8m−1}`. This is a product over
   `(range m ×ˢ range 8).erase (i, j)`, whose cardinality is `m·8 − 1`.
7. `cb8_privateLeaf_minus_closedNbhd_root`: in `CB − c_ij − N[r]`, the vertices `v` and `b_ij` are isolated. The neighbour of `v` is
   `s ∈ N(r)`. The neighbours of `b_ij` are `u_i ∈ N(r)` and `c_ij`, and both are deleted. Two applications of item 4 and item 6
   give `(1+X)((1+X)(1+2X)^{8m−1})`.
8. `cb8_privateLeaf_minus_root`: `CB − c_ij − r` is the product over the parts `critU3T_cbPart m k` with `c_ij` erased
   (`k ≤ m`). Part 0 is the pendant (`1+2X`). Part `i+1` is the damaged gadget (item 5, `G_c`). Every other part is an intact gadget
   (`G`), and there are `|(range m).erase i| = m − 1` of them. This gives `(1+2X)(G_c·G^{m−1})`.
9. `cb8_privateLeaf_indepPoly_closedForm`: split `CB − c_ij` at `r` (`r ≠ c_ij`). By items 8 and 7,
   `I(CB − c_ij) = (1+2X)G_c G^{m−1} + X(1+X)^2(1+2X)^{8m−1}` (`ring`).
10. `cb8_vertexDeletion_privateLeaf_eq_coeff` (the node (N1) as the synthesis states it):
    `C4LA1.vertexDeletionIndepSetCount (cbGraph m) c_ij k` is the `k`-th coefficient of the item-9 polynomial over `ℕ`.

**N4, favorability of each leaf through the cast of entry 2.**
11. `cb8_armLeaf_isFavorableAt_topRank`: take C2-LA2's first conjunct, which says the arm-leaf closed form over `ℤ[X]` strictly
    descends from `p*` to `p*+1`. The `ℤ[X]` polynomial is `map (Nat.castRingHom ℤ)` of the `ℕ[X]` polynomial (`map_add`,
    `map_mul`, `map_pow`, `map_one`, `map_X`, `map_ofNat`). So its coefficients are the casts of the `ℕ` coefficients (`coeff_map`,
    `eq_natCast`). By item 3, those are `(i_{p*+1}(CB − v) : ℤ)` and `(i_{p*}(CB − v) : ℤ)`. Unfolding `IsFavorableAt` and
    `vertexDeletionForwardDifference` (carried entries 3 and 2) gives `a − b < 0` from `a < b` (`sub_neg`).
12. `cb8_privateLeaf_isFavorableAt_topRank`: the same argument for every `i < m`, `j < 8`, using C2-LA2's second conjunct and item 10.

**N3 and the terminal.**
13. `cb8_favorableLeaves_eq_leafSet_topRank`. By carried entry 74 (`favorableLeaves_eq_leafSet_of_all`), it suffices that every
    leaf is favorable. Carried entry 72 (`cb_leafSet_eq_image`, proved from entry 60 `mem_leafSet_cbGraph_iff`; it needs `0 < m`,
    from `107 ≤ m`) writes `leafSet (cbGraph m) = insert v (image c (range m ×ˢ range 8))`. The leaf `v` is favorable by item 11,
    and each `c_ij` by item 12.

Carried C2-LA2 terminal (rekeyed): `cb8_leafDeletion_closedForms_descent_topRank` is the conjunction that items 11 and 12 consume.
It is carried with the single keyword edit `theorem` → `lemma` (ruling R31-N-15). The reverse edit reproduces the origin bytes, as
recorded in `CAPSULE-VERIFICATION.json`. Its proof is C2-LA2's own: (G) blocks with weights `C(m, j)` and `C(m−1, k)`, plus the
regrouped `Π` blocks, through C1-LA3 entry 17. It is not re-proved here.

## ℕ-subtraction and cast audit

- **`m − 1`** (exponent of `G`): it arises as `|(range m).erase i| = m − 1` (`Finset.card_erase_of_mem`, `i < m`). Every private
  leaf has `i < m`, so `m ≥ 1` and the subtraction is exact. The same expression appears in C2-LA2's statement, and the two
  are matched syntactically.
- **`8m − 1`** (exponent of `1+2X`): it arises as `|(range m ×ˢ range 8).erase (i,j)| = m·8 − 1`, rewritten `Nat.mul_comm m 8`.
  This is exact because `(i, j)` is a member, so `8m ≥ 1`. It is matched syntactically with C2-LA2.
- **`(16m + 4)/3`**: this is `ℕ`-division, exact on the class (`m = 3k + 2` gives `16m + 4 = 48k + 36`). It is used only as the
  rank index, with the same text in C2-LA2, the carried definitions and the terminal. No arithmetic is done on it here.
- **`(p* + 1)` and `p*`**: `vertexDeletionForwardDifference G v p` is `(i_{p+1} : ℤ) − (i_p : ℤ)`, and C2-LA2's indices are
  `(16m+4)/3 + 1` and `(16m+4)/3`. These are identical terms.
- **Casts**: the only cast is `ℕ → ℤ` on counts. Item 3 and item 10 give `i_k = P_ℕ.coeff k` in `ℕ`. The map identity gives
  `P_ℤ = map (Nat.castRingHom ℤ) P_ℕ` as a syntactic polynomial equality, so `P_ℤ.coeff k = ((P_ℕ.coeff k : ℕ) : ℤ)` exactly.
  No truncated subtraction is taken in `ℕ` on counts. The difference is formed in `ℤ` by the carried definition.
- **Proof-internal `ℕ` arithmetic** (the witnesses `(a − (3+17i) − 1)/2`, `(t − 3)/17`, `((t − 3) % 17 − 1)/2`, and `i + 1 − 1` in
  `critU3T_cbPart`) appears only in proof terms. `omega` discharges each under hypotheses that make it exact. None of it
  enters any statement.

## Uniformity (R2)

`m`, `i`, `j`, `k`, `t` and `a` are variables throughout. The only finite splits are `interval_cases` over the gadget edge index
`j' < 8` in the no-edge-between-parts obligations, and every case is closed by `omega`. There are six occurrences: two in the
carried `critU3T_cb_gadget`, one in the re-authored `critU3T_cb_gadgets`, two in `cb8_damagedGadget` and one in
`cb8_privateLeaf_minus_root`. There is no `decide`, `native_decide`, `sorry`, `admit` or `axiom` (`EVIDENCE/forbidden-token-scan.json`). Option on the
face: `set_option maxHeartbeats 4000000 in` on eight declarations: two carried from C2-LA1 (`critU3T_cb_gadget`, `critU3T_cb_pairs`),
two re-authored (`critU3T_cb_gadgets`, `critU3T_cb_minus_v_closedForm`), and four new (items 5–8).

## Fences

One rank `p*`. `d = 8`. The r31 class only (`m ≥ 107`, `m ≡ 2 (mod 3)`). This is a statement about the literal `cbGraph m`.

## Excluded conclusions (not claimed, not implied)

(H), conjunct 4 of the terminal, (HALL) at any scope, any aggregate, and any TREE, FOREST or TRANSFER status. Also excluded: any
rank other than `p*`, `m < 107`, `m ≢ 2 (mod 3)`, and `d ≠ 8`. No grade is asserted for any companion.

## Attribution

This is the synthesis section's list: "as C2-LA2, plus C-U3-T and U3 for the link machinery", with the brief's additions.
- From C2-LA2's list:
  - T1 (seat, arm leaf).
  - C-T1-F and C-T1-U (arm-leaf Lean).
  - C-F2-U (both leaves, regrouping, Lean).
  - C-F2-T, C-T2-F and C-T2-U (independent private-leaf proofs).
  - r30 (closed forms, pairing, favorability key).
  - C1-LA3 ((G)).
- For the link machinery:
  - C-U3-T (critic; closed-form link: branch product, base values, the `v` closed form and count).
  - U3 (seat `C2-U-03`; Node 0, the vertex split).
- C2-LA1 and C2-LA2 (r31 Cycle 2 formalizers).
- Formalizer: `c2-la3-formalizer-opus-20260928` (Claude Opus 5.5).

Carry provenance, recorded for binding and not as an addition to the list: the definition layer and entries 60, 72 and 74 are
C1-LA2's (r31 C1 formalizer). Each carried fragment keeps its own origin header.
