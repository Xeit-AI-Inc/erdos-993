---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c2-la1-formalizer-opus-20260928
critic_id: c2-la1-opus-informal-20260928
attestation_id: c2-la1-informal-pass-20260928
claim_sha256: ff63d6845aabd9b996549a9e8d4b49f4f7749f99a615dd90f55cbcf85b33d472
---

# Informal Proof Integrity Audit

**VerityOS boot.** I am operating within VerityOS. Before any substantive work I loaded `verity.md`,
`identity/startup-protocol.md` and `skills/proof-integrity-audit/skill.md` (brief §0). I loaded no memory, logs,
decisions, operations or conversations, and I wrote no conversation log. I ran the skill in single-problem mode.
The ledger lives in this file, because the brief allows this file plus scratch only.

**Model disclosure (two-part).** Chartered: Claude Opus 5.5, effort high, on dispatch-record authority. Runtime-reported
model id, verbatim: `claude-opus-5-5`. I used no child agents.

**Seat.** Reviewer `c2-la1-opus-informal-20260928` (kind `independent-mathematical-proof-integrity-reviewer`). Award
C2-LA1, canonical run `erdos-993-math-dre-20260927-r31-cb-uniform-switch`, governed run
`runs/lean-2026-09-28-c2-la1-cb8-parent-descent-and-eligibility-on-the-tree`. I am not the artifact producer. I edited no
contract, Lean source, informal proof or receipt, and I wrote nothing outside `scratchpad/c2-s7-informal-LA1/`.

## Gate checks (before the audit)

| Item | Expected | Recomputed | Result |
|---|---|---|---|
| Brief `control/C2-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md` | `877cf7ca…dba123f` | `877cf7cad0e898a8f031453df86e5ab8028aa0410f93f6c52915c978dbba123f` | MATCH |
| `THEOREM-CONTRACT.yaml` | `2158db77…c1e587d` | same | MATCH |
| `INFORMAL-PROOF.md` | `952ac167…ee64a` | same | MATCH |
| `Main.lean` | `986b5257…90c9d` | same | MATCH |
| Capsule seal `C2-LA1-PACKET-MANIFEST.json` | `f2de53fe…c9dd5a` | same. Rule: SHA-256 of the compact, key-sorted JSON of the manifest without `seal_sha256`. The file's own digest is `f2c8cd0f…11bc7`, recorded only. | MATCH |
| Capsule members | 1,135 | 1,135 match on SHA-256 and byte count | ALL MATCH |
| `sources/c1-results/SOURCE-DIGESTS.json` | 462 files | 462/462 match, 0 missing | ALL MATCH |
| `sources/c2-stage7-sources/SOURCE-DIGESTS.json` | 687 files | 687/687 match, 0 missing | ALL MATCH |
| `claim_sha256` = SHA-256 of `" ".join(informal_statement.split())` | `ff63d684…d472` | `ff63d6845aabd9b996549a9e8d4b49f4f7749f99a615dd90f55cbcf85b33d472` | MATCH |
| Contract `source_materials` | 128 entries | 128/128 digests match on disk | ALL MATCH |

## Intended Claim

The claim is the contract's `theorem.informal_statement`, whose OBJECT is: for every natural `m` with `107 ≤ m` and
`m % 3 = 2`, at the one rank `p* = (16m+4)/3`:
1. `cbGraph m` is a tree;
2. the literal parent descent `indepSetCount (cbGraph m) ∅ (p*−1) < indepSetCount (cbGraph m) ∅ (p*−2)` holds;
3. `crossingIndex (cbGraph m) + 2 ≤ p*`;
4. `3p* < 2·indepNum + 1`.

The face companions carry no grade. The fences, exclusions, repairs, carries and attribution are stated in the claim.

The Lean terminal is `E993Transport.cb8_topRank_parentDescent_and_conjuncts_1_2_3 (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2)`,
followed by the four conjuncts verbatim. I checked its hypotheses one for one:
- There are exactly two, and they match the contract's `hyp-m-ge-107` and `hyp-residue` verbatim.
- They match the synthesis block exactly. The synthesis also lists no other hypotheses.
- `lean_binding.expected_statement` occurs exactly once in `Main.lean`, followed immediately by ` :=`. Its SHA-256 is
  `c8809d8e…`, as recorded.
- It equals the synthesis's frozen block once I remove the markdown indentation and the `E993Transport.` prefix. The
  enclosing `namespace E993Transport` supplies that prefix, which is the one recorded plumbing change.
- The statement block in `INFORMAL-PROOF.md` is byte-equal to `expected_statement`.

## Claim Ledger

Notation: `u = (m−107)/3`, `L = p*−2`, `N0 = 24u+817`, `L1 = 16u+571`, `K1 = 8u+292`. "Evidence" names the check in
`audit_eval.py` (output `audit_eval_output.json`) or a literal source read. Every row is **verified** unless marked otherwise.

| # | Claim (INFORMAL-PROOF node) | Hypotheses and where they enter | Lean declaration(s) (run entry) | Evidence | Verdict |
|---|---|---|---|---|---|
| D1 | `cbGraph m = fromRel (cbEdge m)` on `Fin (17m+3)`, labelling 0=r, 1=s, 2=v, `u_i=3+17i`, `b_ij=u_i+1+2j`, `c_ij=u_i+2+2j` | none | 23, 24, 25 (C1-LA2 23–25, byte-identical) | Literal read. My `cb_edges` transcribes `cbEdge`; it is a tree on 17m+3 vertices for all 23 tested `m` | verified |
| D2 | `indepSetsAvoiding`, `indepSetCount` = number of independent k-subsets of `V∖D`; `forwardDifferenceDel` = `(i_{k+1}:ℤ) − i_k` | none | 9, 10, 11 (C1-LA2, byte-identical) | Literal read. The difference is in ℤ, with no truncation | verified |
| D3 | `crossingIndex G = Nat.find (k ↦ forwardDifferenceDel G ∅ k < 0)`, i.e. the least strict descent | existence proved in the definition (`Δ_α = −i_α < 0`) | 22 (C1-LA2, byte-identical) | Literal read. My `crossing_index` implements the same minimality | verified |
| D4 | `cb8G = X(1+X)^8 + (1+2X)^8`, `cb8I m = (1+2X)G^m + X(1+X)(1+2X)^{8m}`, `cb8P m j = (1+X)^{8j}(1+2X)^{8(m−j)+1}`, `cb8S5` = the six blocks `j<6` plus the tail at `L` | none | 32–35 | Literal read. Same `G` as SEMANTIC-CONTRACT §2 (summands commuted, no CF-C2-G swap); my code asserts both orders are equal | verified |
| D5 | `critU3T_indepPoly G D = Σ_{k≤|V|} monomial k (i_k(G−D))`; `critU3T_cbPart` (part 0 = {1,2}, part i+1 = labels `3+17i .. 3+17i+16`) | none | 36, 37 | Literal read | verified |
| N0 | `i_{k+1}(G−D) = i_{k+1}(G−(D∪{x})) + i_k(G−(D∪N[x]))` for `x ∉ D` | `x ∉ D` enters as `hx` | 521 | Proof idea (split by `x ∈ A`, bijection by erasing `x`) checked. Tested by exhaustive subset counting on 60 seeded random graphs (n ≤ 9), every k | verified |
| N1a | The count at `k` is the `k`-th coefficient of `indepPoly` for every `k`; counts vanish above `|V|` | none | 524, 525 | Follows from D5 | verified |
| N1b | Binary convolution and product for a vertex-disjoint, edgeless-between cover of `V∖D`; the m-ary product by induction | cover, disjointness, no cross edges | 523, 526, 527, 528, 529 | Standard bijection `A ↦ (A∩P, A∩Q)`; hypotheses are exactly those needed | verified |
| N1c | Base values 1, 1+X, 1+2X; polynomial form of N0 | as stated | 532–535 | Direct | verified |
| N1d | `CB−r` = pendant (1+2X) × m gadgets; gadget `(1+2X)^8 + X(1+X)^8`; `CB−N[r] = (1+X)(1+2X)^{8m}` | `i < m` for gadgets | 531, 536–539 | Tree DP on the literal edge list agrees with the closed form (next row) | verified |
| N1e | **`I(cbGraph m) = (1+2X)G^m + X(1+X)(1+2X)^{8m}` over ℕ, for every m** | none | 540 | Exact equality of my literal DP and the closed form at m = 0..12, 83, 95, 104, 107, 110, 113, 116, 119, 137, 200; independent brute-force enumeration also agrees at m = 0, 1 (`I(CB(8,1))(1) = 33573`) | verified (bounded check of a proved universal) |
| N2 | `i_k(cbGraph m) = [X^k]` of the ℕ closed form, for all `m, k` | none | 541 | Rewrites N1e with N1a | verified |
| N3 | `cb8I m = map (Nat.castRingHom ℤ)` of the ℕ closed form; `coeff` commutes with the cast | none | 544, 545 | `map` is a ring hom (`map_add/mul/pow/one/X/ofNat`); `coeff_map`. The cast is injective and order-preserving on ℕ | verified |
| N4a | Block identity `cb8I m = Σ_{j≤m} C(m,j) X^j P_j + X(1+X)(1+2X)^{8m}` | `j ≤ m` inside `cb8_term_eq` (for `m−j`) | 106, 107 | Binomial theorem on `G^m`. The algebra `(1+2X)(X(1+X)^8)^j((1+2X)^8)^{m−j} = X^j P_j` needs `8(m−j)+1` with `j ≤ m`, and that is supplied | verified |
| N4b | For `m ≤ L`: `[X^L] − [X^{L+1}]` = `Σ_j C(m,j)(P_j[L−j] − P_j[L−j+1]) + (T[L] − T[L+1])`, in ℤ | `hLm : m ≤ L` keeps `L−j` exact; `L−j+1 = (L+1)−j` by omega | 108, 109 | Recomputed exactly over all `j ∈ [0,m]` at m = 107, 110, 116, 137, 200, 302 | verified |
| N5 | (BD): `P_j[L−j+1] < P_j[L−j]` for `5 ≤ j ≤ m` on the class, hence each `j ≥ 6` term is ≥ 0 | 107 ≤ m, m%3=2 (C1-LA3 scope) | 57 (carried, keyword-rekeyed), 110 | Recomputed for every `j ∈ [5,m]` at the six rows above: all strict. Signs of `g_0..g_8` are `− − − + + + + + +` (blocks 0–2 rise, which is why pooling is needed) | verified |
| N6.1 | `[X^l](1+2X)^M = 2^l C(M,l)`; `2^a(1+X)^a(1+2X)^M = Σ_i C(a,i)(1+2X)^{M+i}` | none | 112, 113, 114 | Identity `2(1+X) = (1+2X)+1`. Tested exhaustively for a ≤ 9, M ≤ 11, all l | verified |
| N6.2 | Factorial normalization `C(n,k)·L1!·K1! = N0!·(N0+1)^{(α)}(k+1)^{(β)}(d+1)^{(γ)}` given `n = N0+α = k+d`, `L1 = k+β`, `K1 = d+γ` | the four equalities; `k ≤ n` from `hd` | 115 | Mathlib at the pinned rev: `ascFactorial n k = n(n+1)…(n+k−1)` (`ascFactorial_succ`) and `factorial_mul_ascFactorial : n!·(n+1).ascFactorial k = (n+k)!`, so the rising factorial starts at `N0+1` as the informal proof says. `choose_mul_factorial_mul_factorial` needs `k ≤ n`. Tested on a grid | verified |
| N6.2' | For each of the 254 binomials, `α = n_c−817`, `β = 571−k_c`, `γ = 292−(n_c−k_c)`, all ≥ 0 and summing to 46 | as stated | 244–513 (`bc*`), 514–515 (`bcT_*`) | My code asserts `α, β, γ ≥ 0` and `α+β+γ = 46` for all 254. I parsed the `(α, β, γ)` arguments of every `choose_base_form` instance in the Lean text; all equal mine | verified |
| N6.2'' | `C(8j,i)` numerals, `j ≤ 5` | none | 118–243 (126 lemmas) | All 126 parsed values equal `math.comb` | verified |
| N6.3 | `C(m,j)·j! = (m−j+1)^{(j)}`; the block lemmas `blkA_j`, `blkB_j`, `blk_j` (scale by `2^{45−8j}·120/j!`, integral for j ≤ 5); tail `T[k+2] = Q[k+1]+Q[k]`, so `T[L]−T[L+1] = Q[L−2]−Q[L]` | `n = d+j` | 116, 117, 245–513 (blk*), 516 | Exact at m = 107..302 (tail identity). Checked symbolically and pointwise below | verified |
| N6.4 | **`2^45·120·L1!·K1!·cb8S5(3u+107) = 2^{16u+570}·N0!·Poly(u)`**, `Poly` of degree 50 with 51 coefficients, all positive | `u : ℕ` | 517 | I rebuilt Poly(u) symbolically from the 46-linear-factor products and it is identical to the Lean literals and to `crit_u1t_Poly_u.json` (`f75d2f19…`). The identity holds exactly against the definition of `cb8S5` at u = 0, 1, 2, 5, 11, 33 | verified |
| N6.5 | `Poly(u) > 0` for every `u : ℕ` (`positivity`); the prefactor is > 0, hence `0 < cb8S5 m` | m = 3u+107 from both hypotheses (omega) | 518, 519 | 51 coefficients on exponents 0..50, all > 0, so `Poly(u) ≥ Poly(0) > 0` for `u ≥ 0`. This is a universal argument, not an enumeration. `cb8S5 > 0` also checked directly on every class m in 107..1307 | verified |
| N7 | `[X^L] − [X^{L+1}]` of `cb8I` = `cb8S5 m + Σ_{j=6}^{m} … ≥ cb8S5 m > 0`; so `coeff(p*−1) < coeff(p*−2)` | `m ≤ L` (omega from hm), `p*−1 = L+1` | 111, 520 | Recomputed: `S5 + Σ_{j≥6} = Δ` exactly at six rows | verified |
| N8 | Parent descent `i_{p*−1}(cbGraph m) < i_{p*−2}(cbGraph m)` | hm, hmod | 548 | N2 + N3 + N7 via `exact_mod_cast`. Recomputed on 134 class rows (m = 107..503 step 3, and 1001) from the literal-DP-validated closed form | verified |
| N9 | A strict descent of the ℕ closed form at q gives `crossingIndex ≤ q`; with q = p*−2, `crossingIndex + 2 ≤ p*` | `p* ≥ 2` (omega, from hm) | 542, 543, 546 | `Nat.find_le` (Mathlib `Data/Nat/Find.lean:138`, `p n → Nat.find h ≤ n`) matches first-descent minimality. Recomputed: `x = p*−2` at 107–137, `p*−3` at 200, `p*−7` at 500/503, `p*−13` at 1001, which agrees with the synthesis B-1 rows. `x + 2 ≤ p*` holds on all 134 rows | verified |
| N10 | `cbGraph_isTree`; `indepNum = 9m+1` for `0 < m`; `3p* = 16m+4 < 18m+3` | `0 < m` from hm (omega) | 83, 93, 98 (C1-LA2 56, 66, 71, byte-identical) | Tree check on 23 literal rows. `α` = DP degree = `9m+1` on all rows. The inequality `2m > 1` is trivial | verified |
| T | Terminal `⟨cbGraph_isTree m, N8, N9, cb_lowWindow m (by omega)⟩` | hm, hmod exactly | 549 | Literal read | verified |

**ℕ-subtraction and cast audit (recomputed).** I checked every row of the proof's table:
- For u = 0..399: `p* = 16u+572 ≥ 2`; `L = p*−2 ≥ m`; `L−5 ≥ 0`; `m−5 ≥ 0`; `8(m−5)+1 = 24u+817`; `8m = 24u+856`; and
  `L−j+1 = (L+1)−j` for every `j ≤ m`.
- `(16m+4)/3` is exact on the class (`(16m+4) % 3 = 0` on all 134 rows).
- In `cb8S5`, `m−j` and `L−j` for `j ≤ 5` are exact.
- `forwardDifferenceDel` and all block differences live in ℤ.
- The only ℕ→ℤ bridges are `Nat.castRingHom` / `coeff_map` (N3) and `exact_mod_cast` on a strict inequality of casts
  (N8, N9). Both are faithful.

No truncation site is load-bearing.

**Carried entries, keyed by (origin award, entry, digest).** I verified these independently:
- All 21 C1-LA3 and all 78 C1-LA2 origin fragments match their origin `FORMALIZATION-STATE.json` digests.
- Each origin `Main.lean` (`c0605e12…3011`, `a906ec17…5f3f`) contains its fragments in order, and each is the digest named
  in its origin kernel receipt (verdict `verified`).
- Each run fragment matches its origin entry by name, one to one: 97 byte-identical and 2 keyword-rekeyed. Relative
  order within each origin is preserved.
- **Ruling R31-N-15 re-check:** replacing the first `lemma ` with `theorem ` in run entry 57 reproduces C1-LA3 entry 21
  (`1afd4f7d…`) byte-for-byte. The same substitution in run entry 105 reproduces C1-LA2 entry 78 (`df7623e2…`)
  byte-for-byte. There are no other differences.
- The run `Main.lean` is exactly the header plus the 549 registered fragments with their BEGIN/END markers. I
  reconstructed it byte-for-byte, so it contains no unregistered text.

**Tokens and options (own scan, comments stripped).**
- There are 0 each of `sorry`, `admit`, `native_decide`, `decide`, `axiom`, `opaque`, `unsafe`, `implemented_by` and `extern`.
- There is exactly one `theorem` keyword (the terminal).
- `interval_cases` appears ×3, all as `(try interval_cases j') <;> omega` over the fixed gadget index `j' < 8` in C-U3-T's
  adjacency case analyses. `m`, `i` and `k` stay variables, so this is a fixed finite split with each case proved (R2).
- Options: `exponentiation.threshold 2000` ×409, `maxHeartbeats 0` ×21, `maxHeartbeats 4000000` ×3,
  `maxHeartbeats 1000000` ×2, `maxRecDepth 20000` ×1. These equal the counts on the informal proof's face.
- `axioms-all-declarations.txt` has 549 rows, in registration order, with fully qualified names, and every set ⊆
  {propext, Classical.choice, Quot.sound}. The tally is 510/33/2/4, as the report states. The terminal has exactly
  the three.

## Reproduced Mathematical Evidence

My evaluator is `scratchpad/c2-s7-informal-LA1/audit_eval.py` (SHA-256 `1e9837594378a0d7bc344003d833a8c7ea9935050f5f5fc498b36155ca9d9482`):
- I wrote it for this audit and import no prior evaluator.
- It uses exact integers and the standard library only. Explicit imports: `hashlib`, `itertools`, `json`, `math`,
  `random` (seeded 993), `re`, `sys`.
- Its output is `audit_eval_output.json` (SHA-256 `1b54b61a16a3efee195cacd96dd7f4b209261cfab2e3fb64154782be5c8f01d6`),
  which has no wall-clock fields.
- The run was `python3 -B audit_eval.py`, in the foreground, exit 0, `failures: []`.

It is a check, never proof. Findings:

1. **Literal tree = closed form.** A generic rooted-tree DP on the literal `cbEdge` edge list equals
   `(1+2X)G^m + X(1+X)(1+2X)^{8m}` coefficient by coefficient at 23 values of `m` (0–12, 83, 95, 104, 107, 110, 113, 116,
   119, 137, 200). Brute-force enumeration agrees at m = 0, 1. The graph is a tree (n−1 edges, connected) and
   `α = 9m+1` at every row.
2. **Fixed points.** `CB(8,107)`: `n=1822, α=964, x=570, p*=572`. `CB(8,95)`: `n=1618, α=856, x=506, p*=508`. Both
   equal SEMANTIC-CONTRACT §5 as quoted in the record.
3. **All four conjuncts on the class.** They hold on 134 rows: m = 107..503 step 3 (built incrementally, and
   cross-checked against a direct build at 107, 200, 503), plus m = 1001.
4. **Hypotheses are load-bearing, not sharp at 107, as the record says.**
   - The record says eligibility at `p*` fails at every residue-2 `m ≤ 83` and holds at 86..104. I reproduce exactly
     this: the descent fails at all 28 residue-2 values `2..83` and holds at `86..104`.
   - So `m ≥ 107` is the certificate's floor, not the truth boundary. The record does not claim sharpness, and the
     award does not assert anything below 107.
   - `S_5 < 0` at every residue-2 `m ≤ 98` (including 95) and `S_5 > 0` at 101 and 104. This reproduces the sign change
     at `t = 33` (m = 101), two residue steps below the class start.
   - `S_4 ≤ 0` at every class `m` in 107..134 and `S_4 > 0` from 137. This reproduces the record that the pool `j ≤ 5`
     is minimal from 107.
   - Off the residue (informative only, not claimed): at the other residues in 100..139, `p* = ⌊(16m+4)/3⌋` gives mixed
     results (the descent fails at every `m ≡ 1 (mod 3)` in 100..133 and at `m = 102, 105`, and holds at `m ≡ 0 (mod 3)` from 108). The `m % 3 = 2` hypothesis cannot be
     dropped.
5. **Difference identity and (BD).** Both are exact, and (BD) is strict for every `j ∈ [5,m]`, at m = 107, 110, 116, 137,
   200, 302. `S_5 > 0` on every class `m` in 107..1307.
6. **Factorial normalization and the certificate.**
   - I built `Poly(u)` symbolically: for each of the 254 binomials, the product of its 46 linear factors; then the block
     assembly `Σ_j 2^{45−9j}(120/j!)·Π_{t<j}(3u+107−t)·(A_j − 2B_j) + 2^43·120·p_{856,568} − 2^45·120·p_{856,570}`.
   - Result: degree 50, 51 coefficients, **all positive**, 69 to 147 digits.
   - The SHA-256 of its decimal list is `f75d2f19…ac4bac`, which equals `crit_u1t_Poly_u.json` byte-for-byte in value
     (the frozen C-U1-T copy and the run's EVIDENCE copy are `cmp`-identical).
   - I parsed all 275 generated statements (254 `bc*`/`bcT_*`, 12 `blkA/B*`, 6 `blk*`, `blkT`, `cb8S5_scaled`,
     `cb8Poly_pos`). Every literal coefficient list equals my symbolic one, and every LHS template parameter (n, k,
     exponents, indices, the `2^45·120` scaling) equals the expected value.
   - Pointwise anchor to the definitions: at u = 0, 1, 2, 5, 11, 33, every one of these statements holds exactly with both
     sides evaluated from factorials and direct coefficient convolutions, including `cb8S5` from its definition.
   - **Sampling of the 254 factorial-normalization lemmas:** all 254 were checked, not sampled, in three ways: (i) the
     statement's polynomial equals the 46-factor product; (ii) the `(α, β, γ)` arguments equal mine; (iii) the equality
     holds pointwise at six `u`.
7. **Generator provenance.**
   - The shipped `gen_lean_s5.py` (`53d4731b…`) and `crit_u1t_Poly_u.json` (`f75d2f19…`) equal the frozen C-U1-T copies
     under `sources/c2-stage7-sources/crit-U1-T/`, and those match `SOURCE-DIGESTS.json`.
   - The replay `CriticS5.lean` digest `300b6bd8…` equals the frozen seed digest.
   - I did not execute the generator, because my own derivation supersedes it as a check.

## Independent Critic Pass

I re-read the ledger adversarially, row by row. I looked for circularity, silent hypothesis use, scope leakage,
truncation, statement drift and record-literal errors. Findings:

- **No circularity.** `hS5` is a proper sub-statement: blocks `j ≤ 5` plus the tail. The `j ≥ 6` terms come only from
  the carried (BD) within its own scope. `cb8S5_pos` is proved from `cb8S5_scaled` and `positivity`, and neither uses
  N7 or N8.
- **Universality.** `u`, `m`, `j` and `k` are variables throughout. The only case splits are fixed: 6 blocks, 254 fixed
  binomial templates in the variable `u`, 126 numeral binomials, and `j' < 8`. `positivity` over `u : ℕ` is a
  universal argument.
- **Faithfulness of the bridge.** The literal-graph count (D2) reaches the ℤ-polynomial statement only through N1e/N2
  (ℕ closed form) and N3 (injective cast). There is no gap between `cbGraph` and `cb8I`.
- **Dependency claims.** Two claims say something is not a dependency, and I checked both:
  - C-U3-T's two other `maxHeartbeats 4000000` declarations (`critU3T_cb_gadgets`, `critU3T_cb_minus_v_closedForm`) are
    absent from `Main.lean`.
  - Cycle 2's C-U1-F ("independent symbolic derivation of `N_5`, not in the DAG") contributes no declaration.
- **Advisory A1 (label, not a defect).** The four C1-LA2-carried declarations 101–104 name "critic C-U1-F" as origin.
  That is the **Cycle 1** C-U1-F interface-lemma seat, attributed on C1-LA2's own face, and entries 102–103 are used by
  537 and 539. The "C-U1-F … not in the DAG" line (synthesis verbatim) refers to the Cycle 2 seat. The attribution
  travels through "C1-LA2 and C1-LA3 (r31 C1 formalizers)", so nothing is misattributed. Readers should not conflate
  the two seats.
- **Advisory A2 (stale docstring, not a defect).** The re-authored `cb8S5` (entry 35) keeps U1's docstring sentence
  that node (2) "is NOT proved in this seat … isolated here as a named hypothesis". The formalizer's origin comment on
  the same fragment states that node (2) is discharged by `CriticU1T.cb8S5_pos` in this award. The docstring describes
  the seed, not this award, and it states no false mathematics about the award's claim.
- **Advisory A3 (option tally).** The synthesis lists `maxHeartbeats 4000000` ×5, and the face records ×3. The
  difference is explained on the face (two off-DAG declarations not included) and matches my scan. This is an honest
  recording, not a divergence in the proof.
- **Advisory A4 (predecessor-record literal, not on this face).** C-U1-T's critique describes `Poly(u)`'s coefficients as
  "69 to 146 digits". The largest (the `u^1` coefficient) has **147** digits. No award file repeats the range.
- **Informal wording.** N6 step 3 says the block scaling is `2^{45−8j}`. Relative to the common factor `2^{16u+570}`, the
  net power is `2^{45−9j}`, because `blkA_j` carries `2^{16u+570−j}`. The Lean (`blk1` uses `2^37`) and my symbolic
  assembly agree. The prose is imprecise about which factor is meant but correct as a scaling of the equation, so it is
  not a defect.

The critic pass leaves every ledger row verified. It finds no defective step.

## Scope and Fence Check

- **Asserted:** exactly one rank `p*`, the class `m ≥ 107, m ≡ 2 (mod 3)`, and `d = 8` (via `cbGraph`). The terminal
  asserts nothing fenced: no (H), no conjunct 4 (the flow is absent from the statement), no favorability, no (HALL), no
  `S(T_m, p*) ≤ 0`, no other rank, no `m < 107`, no other residue, no `d ≠ 8`.
- **FLOW ⇒ SIGN** is not invoked. The companion `AdjU.cb8_topRank_of_flow` takes the flow as a hypothesis, is ungraded
  and is not a dependency of the terminal.
- **Excluded conclusions and fences on the face.** They appear in `INFORMAL-PROOF.md` (`## Excluded conclusions and
  fences`), in the contract's `informal_statement` (FENCES and EXCLUDED CONCLUSIONS) and in the terminal docstring. The
  exclusion list is word-for-word the synthesis list and brief §2's list.
- **Not a new `E993-R31-` identity:** stated on both faces.
- **Companions carry no grade:** stated on both faces.
- **Repairs:** all three appear on both faces, and each matches the adjudication:
  - U1's "(E)" narrowed (U adjudicator: C-U1-F right on the text; `cb8_elig_top_a_conditional` states only
    (ELIG-top)(a) for `cb8I`);
  - U3's P4 import edit replaced by a clean `import Mathlib`-only single source (entry 521 notes it);
  - the descent conjunct added (entry 548).
- **Attribution travels on the face.** The attribution list in `INFORMAL-PROOF.md` and in the contract's scope text is
  the synthesis section's list verbatim (whitespace-normalized comparison), plus the formalizer
  `c2-la1-formalizer-opus-20260928` (Claude Opus 5.5).
  - C1-LA3's face line, quoted in both, matches C1-LA3's `INFORMAL-PROOF.md` `## Attribution (on the face)` verbatim.
  - The quoted C1-LA3 terminal docstring matches carried entry 57 verbatim.
  - Every re-authored declaration names its origin (U1 57, C-U1-T 412, C-U3-T 24, U3 1, U adjudicator 4 origin headers,
    plus the C1 carries' own headers).
- **Canonical run id** `erdos-993-math-dre-20260927-r31-cb-uniform-switch` appears in the contract, in
  `CAPSULE-VERIFICATION.json` and in the report.

## Verdict

passed

`INFORMAL-PROOF.md` is a correct statement-level proof of exactly the contract's `informal_statement`:
- the DAG N0–N10 closes;
- every hypothesis enters where stated;
- no ℕ-subtraction truncates;
- every equality used is an identity I recomputed;
- every numeric claim reproduces;
- the terminal's hypotheses match the claim one for one;
- the carried entries are byte-identical or keyword-rekeyed exactly as ruled (R31-N-15);
- nothing fenced is asserted;
- the attribution travels on the face.

Advisories A1–A4 are non-blocking record notes.

Model disclosure: chartered Claude Opus 5.5 (effort high, dispatch-record authority); runtime-reported model id `claude-opus-5-5`.
