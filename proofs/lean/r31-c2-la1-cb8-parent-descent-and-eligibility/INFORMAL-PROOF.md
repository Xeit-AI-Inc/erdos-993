# C2-LA1 — Informal proof at statement granularity

Run `erdos-993-math-dre-20260927-r31-cb-uniform-switch` (r31, Erdős #993, CB(8,m) at the top sector-deficient rank), Cycle 2
Stage 7, award **C2-LA1**: (ELIG-top)(a) on the literal tree and conjuncts 1–3 of the terminal. Governed run
`runs/lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree`. Formalizer `c2-la1-formalizer-opus-20260928`
(chartered Claude Opus 5.5, effort high; runtime-reported model id `claude-opus-5-5`). Governing text: `cycles/cycle-2/stage6/SYNTHESIS.md`,
`## Lean awards` → `### C2-LA1` (copied byte-identically to `SOURCE/governing/SYNTHESIS.md`).

This is an informal proof of the exact Lean statement below. It does not claim anything beyond it. Python in this run is a check,
never proof.

## Statement (frozen by the synthesis; namespace-relative)

For every `m : ℕ` with `107 ≤ m` and `m % 3 = 2`, writing `p* = (16m+4)/3` (ℕ division, exact on the class):

```lean
theorem cb8_topRank_parentDescent_and_conjuncts_1_2_3 (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    (cbGraph m).IsTree ∧
    C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 1) <
      C5LA1.indepSetCount (cbGraph m) ∅ ((16 * m + 4) / 3 - 2) ∧
    C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3 ∧
    3 * ((16 * m + 4) / 3) < 2 * (cbGraph m).indepNum + 1
```

in namespace `E993Transport`. Only change from the synthesis text: the `E993Transport.` prefix is supplied by the enclosing
`namespace` (binder/plumbing only; the elaborated statement is identical).

Objects (carried definitions of record, byte-identical): `cbGraph m : SimpleGraph (Fin (17m+3))` (C1-LA2 entry 24; labelling
`0 = r`, `1 = s`, `2 = v`, `u_i = 3+17i`, `b_ij = u_i+1+2j`, `c_ij = u_i+2+2j`); `C5LA1.indepSetCount G D k` = number of
independent `k`-subsets of `V \ D` (C1-LA2 entry 10); `C5LA1.forwardDifferenceDel G D k = (i_{k+1} : ℤ) − i_k` (entry 11);
`C5LA1.crossingIndex G = Nat.find (k ↦ forwardDifferenceDel G ∅ k < 0)` (entry 22).

## Class arithmetic (used throughout)

`m ≡ 2 (mod 3)` and `m ≥ 107` give `m = 3u + 107` with `u = (m−107)/3 ∈ ℕ` (`107 ≡ 2 mod 3`). Then `16m + 4 = 48u + 1716`, so
`p* = 16u + 572` exactly, `p* − 1 = 16u + 571`, `p* − 2 = 16u + 570 =: L`. Put `N0 = 24u+817`, `L1 = 16u+571`, `K1 = 8u+292`.

## DAG (the synthesis's; every node is a compiled declaration of this run)

### N0 — vertex split (U3 Node 0; `indepSetCount_succ_split`)
For any finite simple graph `G`, deletion set `D`, vertex `x ∉ D`, and `k`:
`i_{k+1}(G−D) = i_{k+1}(G−(D∪{x})) + i_k(G−(D∪N[x]))`. Proof: split the independent `(k+1)`-sets avoiding `D` by whether they
contain `x`; those containing `x` biject with independent `k`-sets avoiding `D ∪ N[x]` via `A ↦ A \ {x}` / `B ↦ B ∪ {x}`.

### N1 — component products and the closed form (C-U3-T)
- `critU3T_indepPoly G D := Σ_{k ≤ |V|} i_k(G−D) X^k ∈ ℕ[X]`; its `k`-th coefficient is `i_k(G−D)` for EVERY `k`
  (`critU3T_coeff_indepPoly`; counts vanish above `|V|`, `critU3T_indepSetCount_eq_zero`).
- Binary convolution: if the survivors of `D` split into disjoint `P, Q` with no `P–Q` edge, then
  `i_k(G−D) = Σ_{a+b=k} i_a(G−(D∪Q)) i_b(G−(D∪P))` (bijection `A ↦ (A∩P, A∩Q)`); hence the polynomial is a product
  (`critU3T_indepPoly_disjoint_mul`), and by induction over a finite index set, an `m`-ary product (`critU3T_indepPoly_eq_prod`).
- Base values: all deleted → `1`; one survivor → `1+X`; one surviving edge → `1+2X` (`_eq_one`, `_single`, `_edge`);
  polynomial form of N0: `I(G−D) = I(G−D−x) + X·I(G−D−N[x])` (`critU3T_indepPoly_vertex_split`).
- On `cbGraph m`: `CB − r` splits into the pendant `{s,v}` (`1+2X`) and `m` choke gadgets (`critU3T_cb_minus_root_prod`,
  parts `critU3T_cbPart`). A gadget, split at `u_i`: without `u_i`, eight disjoint support–leaf edges `(1+2X)^8`; without
  `N[u_i]`, eight isolated private leaves `(1+X)^8`; so `G := (1+2X)^8 + X(1+X)^8` (`critU3T_cb_gadget`). `CB − N[r]` is the arm
  leaf `v` plus the `8m` support–leaf edges: `(1+X)(1+2X)^{8m}` (`critU3T_cb_pairs`, `critU3T_cb_minus_closedNbhd_root`).
- Split at `r`: **`I(CB(8,m)) = (1+2X)·G^m + X·((1+X)(1+2X)^{8m})` in `ℕ[X]`, for every `m`** (`critU3T_cb_indepPoly_closedForm`).

### N2 — count = coefficient (C-U3-T; `critU3T_cb_indepSetCount_eq_coeff`)
`i_k(cbGraph m) = [X^k] ((1+2X)G^m + X((1+X)(1+2X)^{8m}))` in ℕ, for every `m, k`.

### N3 — cast bridge (U adjudicator; `AdjU.cb8I_eq_map`, `AdjU.cb8I_coeff_cast`)
U1's `cb8I m := (1+2X)·cb8G^m + X(1+X)(1+2X)^{8m} ∈ ℤ[X]`, `cb8G := X(1+X)^8 + (1+2X)^8` (the same `G`, commuted), equals the image
of the ℕ closed form under `Nat.castRingHom ℤ` (`map` commutes with `+`, `*`, `^`, `1`, `X`, numerals; then `ring`). Hence
`(cb8I m).coeff k = ((ℕ closed form).coeff k : ℤ)` (`Polynomial.coeff_map`).

### N4 — block identity and difference identity (U1 nodes 1, 4)
- `cb8I m = Σ_{j=0}^{m} C(m,j) X^j P_j + X(1+X)(1+2X)^{8m}`, `P_j = cb8P m j := (1+X)^{8j}(1+2X)^{8(m−j)+1}`
  (`cb8_block_identity`): binomial theorem on `G^m = (X(1+X)^8 + (1+2X)^8)^m`, then `(1+2X)·(X(1+X)^8)^j((1+2X)^8)^{m−j} = X^j P_j`
  (`cb8_term_eq`, needs `j ≤ m` for `8(m−j)+8+1`-bookkeeping via `pow_mul`).
- For `L ≥ m`: `[X^L] − [X^{L+1}]` of `cb8I m` equals `Σ_j C(m,j) (P_j[L−j] − P_j[L−j+1]) + (T[L] − T[L+1])`, `T = X(1+X)(1+2X)^{8m}`
  (`cb8_term_coeff`, `cb8_coeff_diff`), all in ℤ.

### N5 — (BD) for `j ≥ 6` (carried C1-LA3 entry 21, `cb8_block_descent_topRank`, within its scope `5 ≤ j ≤ m`)
For `5 ≤ j ≤ m` on the class: `P_j[L − j + 1] < P_j[L − j]`. Hence every term `C(m,j)(P_j[L−j] − P_j[L−j+1])`, `6 ≤ j ≤ m`, is `≥ 0`
(`cb8_tail_blocks_nonneg`; `C(m,j) ≥ 0`, product of nonnegatives, `nlinarith`).

### N6 — `S_5 > 0` (C-U1-T; `CriticU1T.*`)
`cb8S5 m := Σ_{j=0}^{5} C(m,j)(P_j[L−j] − P_j[L−j+1]) + (T[L] − T[L+1])` (SR-4's pooled quantity). With `m = 3u+107`:
1. `[X^l] (1+2X)^M = 2^l C(M,l)` (`coeff_one_add_two_X_pow`); `2^a (1+X)^a (1+2X)^M = Σ_{i=0}^{a} C(a,i)(1+2X)^{M+i}` (from
   `2(1+X) = (1+2X)+1`), so `2^a [X^l](1+X)^a(1+2X)^M = Σ_i C(a,i) 2^l C(M+i,l)` (`two_pow_block_expand`, `two_pow_block_coeff`).
2. **Factorial normalization** (`choose_base_form`): if `n = N0 + α`, `n = k + d`, `L1 = k + β`, `K1 = d + γ`, then
   `C(n,k)·L1!·K1! = N0!·(N0+1)^{(α)}·(k+1)^{(β)}·(d+1)^{(γ)}` (rising factorials; from `n! = C(n,k)k!d!` and
   `x!·(x+1)^{(t)} = (x+t)!`). For each of the 254 binomials `C(24u+n_c, 16u+k_c)` of `S_5` one has `α = n_c − 817`,
   `β = 571 − k_c`, `γ = 292 − (n_c − k_c)`, all `≥ 0`, `α+β+γ = 46`: the right side is `N0!` times 46 linear factors in `u`
   (`bc{j}{A,B}_{i}`, `bcT_{0,1}`; each proved by `linear_combination` of the cast of `choose_base_form`, no enumeration).
   Numeral binomials `C(8j, i)`, `j ≤ 5`, are the lemmas `ch_{a}_{i}` (`norm_num` on factorials).
3. Block `j ≤ 5` (`a = 8j`, `M0 = 24u+857−8j = 8(m−j)+1`): `blkA_j`, `blkB_j` give `L1!K1!·2^a·P_j[l]` at `l = 16u+570−j`, `16u+571−j` as
   `2^l N0!·(explicit polynomial)`; `C(m,j)·j! = (m−j+1)^{(j)}` (`choose_small`) removes `C(m,j)` after scaling by `120/j!`
   (integral for `j ≤ 5`) and `2^{45−8j}` (`8j ≤ 40 ≤ 45`): `blk_j`. Tail (`blkT`): `T[k+2] = Q[k+1] + Q[k]` with
   `Q = (1+2X)^{24u+856}` (`tail_coeff`), so `T[L] − T[L+1] = Q[L−2] − Q[L]`.
4. Summing (`cb8S5_scaled`): **`2^45·120·L1!·K1!·cb8S5(3u+107) = 2^{16u+570}·N0!·Poly(u)`**, `Poly` of degree 50 with 51 literal
   coefficients, **all positive**, on exponents `0..50` (checked by `EVIDENCE/s5-generator/assertion.json`: equal to
   `crit_u1t_Poly_u.json` `f75d2f19…`, the generator `gen_lean_s5.py` `53d4731b…` asserting the same before emitting).
5. `Poly(u) > 0` for every `u : ℕ` by `positivity` (`cb8Poly_pos`) — a universal statement in the variable `u`, not an enumeration.
   The prefactor `2^45·120·L1!·K1! > 0`, hence `0 < cb8S5 m` (`cb8S5_pos`, `pos_of_mul_pos_right`).

### N7 — (ELIG-top)(a) on `cb8I` (U1 node 4 + C-U1-T; `cb8_elig_top_a_conditional`, `CriticU1T.cb8_elig_top_a`)
At `L = p*−2 ≥ m`: `[X^L] − [X^{L+1}] = cb8S5 m + Σ_{j=6}^{m}(…) ≥ cb8S5 m > 0` (split `range (m+1) = range 6 ∪ Ico 6 (m+1)`; N4, N5,
N6). Since `p* − 1 = L + 1`: `(cb8I m).coeff (p*−1) < (cb8I m).coeff (p*−2)`.

### N8 — parent descent on the literal tree (NEW; `cb8_indepSetCount_parentDescent`)
Rewrite both counts by N2, both `cb8I` coefficients by N3; the ℤ inequality of N7 between casts of ℕ numbers is the ℕ inequality
(`exact_mod_cast`): `i_{p*−1}(cbGraph m) < i_{p*−2}(cbGraph m)`.

### N9 — conjunct 2 (C-U3-T + U adjudicator; `critU3T_cb_crossingIndex_le_of_coeff`, `critU3T_cb_conjunct2_of_coeff`, `AdjU.cb8_crossingIndex_add_two_le`)
If the ℕ closed form strictly descends at `q` (`[X^{q+1}] < [X^q]`), then `forwardDifferenceDel (cbGraph m) ∅ q < 0` (N2 and the cast
of a strict ℕ inequality), so `crossingIndex ≤ q` (`Nat.find_le`, first-descent minimality). With `q = p*−2` and N7 transported by
N3: `crossingIndex(cbGraph m) + 2 ≤ p*`.

### N10 — tree and low window (carried C1-LA2 entries 56, 66, 71)
`cbGraph_isTree`; `cbGraph_indepNum_eq : indepNum = 9m+1` (`0 < m`); `cb_lowWindow`: `3p* = 16m+4 < 18m+3 = 2(9m+1)+1` for `m ≥ 1`.

### Terminal
`⟨cbGraph_isTree m, N8, N9, cb_lowWindow m (by omega)⟩`.

## ℕ-subtraction and cast audit

| Site | Expression | Why no truncation / what the cast does |
|---|---|---|
| terminal, N7, N8 | `(16m+4)/3 − 1`, `(16m+4)/3 − 2` | `p* = 16u+572 ≥ 572`; both exact; `p* − 1 = (p* − 2) + 1` (omega) |
| N4 `cb8_coeff_diff` | `L − j`, `j ≤ m ≤ L` | hypotheses `hLm : m ≤ L`, `j ∈ range (m+1)`; `L − j + 1 = (L+1) − j` (omega) |
| `cb8P m j` | `m − j` | only used with `j ≤ m` (range/Ico bounds); at `j > m` unused |
| N5 (BD) | `(16m+4)/3 − 2 − j`, `5 ≤ j ≤ m` | `j ≤ m = 3u+107 < 16u+570`; exact |
| `cb8S5` | `(16m+4)/3 − 2 − j`, `j ≤ 5` | exact (as above); differences are in ℤ (coefficients of `ℤ[X]`) |
| N6 | `3u+107−j`, `16u+570−j`, `8(3u+107−j)+1 = 24u+857−8j` | `j ≤ 5`; each rewritten by `omega` |
| N6 `choose_base_form` | `n − k = d` | from `hd : n = k + d` (omega); all in ℕ, then cast to ℤ by `Nat.cast_mul/add` |
| class | `u = (m−107)/3`, `m = 3u+107` | `m ≥ 107`, `m % 3 = 2` (omega) |
| N3 | `ℕ[X] → ℤ[X]` | `Polynomial.map (Nat.castRingHom ℤ)`; `coeff_map`: `ℤ`-coefficient is the cast of the `ℕ`-coefficient |
| N8, N9 | `ℤ` inequality of casts ↔ `ℕ` inequality | `Nat.cast_lt` (`exact_mod_cast`; `omega` inside `critU3T_cb_crossingIndex_le_of_coeff`) |
| `forwardDifferenceDel` | `(i_{k+1} : ℤ) − i_k` | ℤ subtraction, no truncation |

## Options on the face (non-default; all scoped)

- `set_option exponentiation.threshold 2000`: the C-U1-T file-level option, reproduced inside the scope of each of the 409
  C-U1-T fragments (the option is reverted at each fragment's `end`).
- `set_option maxHeartbeats 0 in` ×21 (C-U1-T: `blkA0..5`, `blkB0..5`, `blk0..5`, `blkT`, `cb8S5_scaled`, `cb8S5_pos`).
- `set_option maxRecDepth 20000 in` ×1 (`cb8S5_pos`).
- `set_option maxHeartbeats 4000000 in` ×3 (`critU3T_cb_gadget`, `critU3T_cb_pairs`, `critU3T_cb_minus_closedNbhd_root`). The
  synthesis tally ×5 counted C-U3-T's whole file; its two other `4000000` declarations (`critU3T_cb_gadgets`,
  `critU3T_cb_minus_v_closedForm`) are off this DAG and not included.
- `set_option maxHeartbeats 1000000 in` ×2 (U1: `cb8_block_identity`, `cb8_elig_top_a_conditional`).
The governed workflow and the kernel verifier did not refuse `maxHeartbeats 0`, so it is kept as recorded.

## Excluded conclusions and fences (on this face)

One rank `p*` only; the class `m ≥ 107`, `m ≡ 2 (mod 3)` only; `d = 8` only. **Not claimed:** (H); conjunct 4; favorability;
(HALL) at any scope; `S(T_m, p*) ≤ 0`; any rank other than `p*`; `m < 107`; `m ≢ 2 (mod 3)`; `d ≠ 8`; no FLOW ⇒ SIGN; no aggregate or
(HALL) status. Not a new `E993-R31-` identity (it formalizes the registered ELIG key and the r30 closed-form node). Face companions
(`CriticU1T.cb8_elig_top_a`; the ℕ closed form `critU3T_cb_indepPoly_closedForm` with `critU3T_cb_indepSetCount_eq_coeff`;
`AdjU.cb8_topRank_of_flow`) carry no grade of their own.

Repairs carried into the award: U1's "(E)" wording narrowed (U1's declarations state only (ELIG-top)(a) for `cb8I`, conditional on
`hS5`; (E) is stated only by this terminal); U3's P4 import edit replaced by a clean import (single source, `import Mathlib` only);
the extra descent conjunct (N8) added.

## Attribution

U1 (Sonnet 5, seat `C2-U-01`); C-U1-T (Opus 5.5, critic; node 2); U3 (`C2-U-03`; Node 0); C-U3-T (critic; closed-form link); the U
adjudicator (composition, cast bridge); C-U1-F (independent symbolic derivation of `N_5`, not in the DAG); SR-4 (the certificate
method of record); C1-LA2 and C1-LA3 (r31 C1 formalizers); r30 (closed forms, T1 of r30 Cycle 6; network definitions, named seats);
Codex GPT-6's lower-region run (mechanism, weight, relation, (HALL)); Codex's heterogeneous-closure run as C1-LA3's face cites it.
C1-LA3's face line, verbatim (its `INFORMAL-PROOF.md`, `## Attribution (on the face)`): "Codex's heterogeneous-closure binomial-block
mechanisms are cited as templates only, not as carried fragments (none was opened as a Lean source in this run)." C1-LA3's
terminal docstring (carried entry 21, on this run's `Main.lean`): "Attribution: Lemma A and closing step C-U3-T; `q = 1` case r31
U3; corroboration C-U3-F; the (BD) instance and its role r31 synthesis (from C-U3-T's Lemma B); E1 criterion, threshold and
`r_q` r30; mechanism Codex GPT-6; formalizer c1-la3-formalizer-opus-20260928 (Claude Opus 5.5)." Formalizer of this award:
`c2-la1-formalizer-opus-20260928` (Claude Opus 5.5).
