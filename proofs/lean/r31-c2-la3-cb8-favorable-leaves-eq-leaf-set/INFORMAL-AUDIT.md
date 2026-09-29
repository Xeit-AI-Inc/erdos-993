---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c2-la3-formalizer-opus-20260928
critic_id: c2-la3-opus-informal-20260928
attestation_id: c2-la3-informal-pass-20260928
claim_sha256: 4c1dc461d311b00cf733e210173f5d739be70af3b9f84f11402888a3fcb48dcc
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** I am operating within VerityOS. I loaded `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`, the three boot files the brief authorizes (§0). I loaded no memory, logs, decisions,
operations or conversations, and I wrote no conversation log: this brief permits exactly one output file, and the controller
owns logging for this run.

- Seat: the independent informal proof-integrity reviewer for award C2-LA3 (r31 Cycle 2 Stage 7).
- Canonical run id: `erdos-993-math-dre-20260927-r31-cb-uniform-switch`.
- Reviewer id: `c2-la3-opus-informal-20260928`, kind `independent-mathematical-proof-integrity-reviewer`.
- I am not the artifact producer, and I edited no contract, Lean source, informal proof or receipt.
- **Model disclosure (two-part).** Chartered: Claude Opus 5.5, effort high, on dispatch-record authority. Runtime-reported
  model id, verbatim: `claude-opus-5-5`. I used no child agents.
- Date: 2026-09-28 (clock read 05:23 EDT).

**Gate digests (all recomputed by me):**

| Object | Expected | Recomputed |
|---|---|---|
| Auditor brief `control/C2-STAGE7-INFORMAL-AUDITOR-BRIEF-LA3.md` | `7a30f714…e9` | `7a30f7143e1e8b7a7367a97519aca507e88190136841072c4cc01b176809e3e9` MATCH |
| `THEOREM-CONTRACT.yaml` | `f19bebf2…960da` | `f19bebf2b4689bd567a36db6df71fcf9edf485fe474f01eef7a2c41ae7a960da` MATCH |
| `INFORMAL-PROOF.md` | `918a9fe4…c6b7` | `918a9fe43296032c61b0557a1952600ff1487e2833979f00ecba82b198ecc6b7` MATCH |
| `LeanProject/LeanProof/Main.lean` | `7dab4388…b8a` | `7dab4388cdcf2a922312eb04c2ae27d21c418c271a38fe02c9540910fb582b8a` MATCH |
| Capsule seal (compact key-sorted JSON of the manifest minus `seal_sha256`) | `414eb681…321f` | `414eb681406d30edb951753447a2af597898b76718e9bcf0489ed7f9f53f321f` MATCH |
| Capsule members | 2,303 listed | 2,303 present, 0 digest mismatches |
| `sources/c1-results/SOURCE-DIGESTS.json` | 462 files | 0 mismatches |
| `sources/c2-results/SOURCE-DIGESTS.json` | 1,289 files | 0 mismatches |
| `sources/c2-stage7-sources/SOURCE-DIGESTS.json` | 687 files | 0 mismatches |
| `claim_sha256` = SHA-256 of `" ".join(informal_statement.split())` | `4c1dc461…dcc` | `4c1dc461d311b00cf733e210173f5d739be70af3b9f84f11402888a3fcb48dcc` MATCH |
| Contract `source_materials` (125 entries) | listed digests | 0 mismatches |

## Intended Claim

The claim is exactly the contract's `theorem.informal_statement`. For every natural number `m` with `107 ≤ m` and
`m % 3 = 2`, take the literal tree `CB(8,m) = cbGraph m` on `Fin (17m+3)`, with `r = 0`, `s = 1`, `v = 2`, `u_i = 3+17i`,
`b_ij = u_i+1+2j` and `c_ij = u_i+2+2j`. Let `p* = (16m+4)/3` (ℕ floor division, exact on the class). Then the fixed original
strict selector `favorableLeaves (cbGraph m) p*` equals `C5LA1.leafSet (cbGraph m)`. Equivalently, every original leaf `w`
satisfies `Δ_{p*}(CB − w) = i_{p*+1}(CB − w) − i_{p*}(CB − w) < 0`, where the counts are in ℕ and the difference is in ℤ.

The terminal is `E993Transport.cb8_favorableLeaves_eq_leafSet_topRank`:

```lean
theorem cb8_favorableLeaves_eq_leafSet_topRank (m : ℕ) (hm : 107 ≤ m) (hmod : m % 3 = 2) :
    favorableLeaves (cbGraph m) ((16 * m + 4) / 3) = C5LA1.leafSet (cbGraph m)
```

- It is the only `theorem` keyword in `Main.lean`, and it sits inside `namespace E993Transport`.
- Its text equals `lean_binding.expected_statement`. That text occurs exactly once in `Main.lean`, followed by ` := `.
- `expected_statement_sha256` = `fcfbc54b…9b27`, recomputed and matching.
- It equals the synthesis `### C2-LA3` block and the formalizer brief §2 block after the two plumbing edits: the 2-space Markdown
  dedent, and `E993Transport.` removed from the name. My own check is `statement_check.out`, which returns `True`.
- The terminal has three binders: `m : ℕ`, `hm : 107 ≤ m` and `hmod : m % 3 = 2`. They correspond one-for-one to the claim's
  quantifier (`m`) and its two hypotheses. No hypothesis encodes the conclusion.

## Claim Ledger

Verdict codes: **V** = verified with reproduced evidence; **V-def** = verified against the Lean source literally; **O** = an
observation that is not a defect. The "Evidence" column cites my scratch outputs (§ Reproduced Mathematical Evidence).

| # | Claim (statement level) | Hypotheses and where they enter | Evidence | Verdict |
|---|---|---|---|---|
| D1 | `vertexDeletionIndepSetCount G v k` = number of independent `k`-subsets of `univ.erase v` (= `i_k(G−v)`), in ℕ | none | Main.lean entry 1, read literally; byte-identical to C1-LA2 entry 1 | V-def |
| D2 | `vertexDeletionForwardDifference G v p = (i_{p+1} : ℤ) − (i_p : ℤ)`: the FORWARD difference of record, computed in ℤ | none | entry 2, read literally (controller note: the forward difference) | V-def |
| D3 | `IsFavorableAt G v p :⇔ D2 < 0`: STRICT | none | entry 3 | V-def |
| D4 | `IsGraphLeaf G v :⇔ ∃! u, G.Adj v u`; `leafSet G = univ.filter IsGraphLeaf` (classical) | none | entries 4–5 | V-def |
| D5 | `favorableLeaves G p = (leafSet G).filter (IsFavorableAt G · p)` | none | entry 8 | V-def |
| D6 | `cbEdge`/`cbGraph = fromRel cbEdge`: edges `r–s`, `s–v`, `r–u_i`, `u_i–b_ij`, `b_ij–c_ij` (`i<m`, `j<8`) on `Fin (17m+3)` | none | entries 9–10. My evaluator builds the graph by evaluating the `cbEdge` predicate literally over all ordered pairs and symmetrizing as `fromRel` does; it equals the witness construction at m = 0..6 | V |
| D7 | `indepSetCount G D k`, and `critU3T_indepPoly G D = Σ_{k ≤ |V|} monomial k (indepSetCount G D k)`, so coefficient `k` is `indepSetCount G D k` for every `k` (entry 65) | none | entries 6–7, 14, 65. For `k > |V|` both sides are 0 | V-def |
| D8 | `critU3T_cbPart m 0 = {s, v}`; `critU3T_cbPart m (i+1)` = labels `[3+17i, 3+17i+17)`, which is gadget `i` | none | entry 15 | V-def |
| L1 | Vertex split (U3 Node 0), polynomial form: for `x ∉ D`, `I(G−D) = I(G−D−x) + X·I(G−D−N[x])` | `x ∉ D` | entries 61, 71. Brute force on 400 random graphs (n ≤ 10), all equal | V |
| L2 | Branch product: survivors partitioned into parts with no edges between parts gives a product of the parts' polynomials (`critU3T_indepPoly_disjoint_mul`, `_eq_prod`) | cover, disjointness, no cross edges | entries 66, 69. Generic, and the special cases L5–L9 are reproduced numerically | V |
| L3 | Base values: nothing survives gives 1; one vertex gives `1+X`; one edge gives `1+2X`. On `CB`, part 0 gives `1+2X`, an intact gadget gives `G`, and the `8m` pairs give `(1+2X)^{8m}` | as stated | entries 72–77. Gadgets alone (`CB − {r,s,v}`) give `G^m` at m = 0..8 | V |
| L4 (item 4) | Isolated factor: `x ∉ D` and `N(x) ⊆ D` imply `I(G−D) = (1+X)·I(G−D−x)` | both enter: `hx` feeds L1, and `hN` collapses `D ∪ N(x) ∪ {x}` to `D ∪ {x}` | 137 random qualifying instances, all equal. `hN` is necessary: for a single edge, `I = 1+2X` but `(1+X)·I(edge−x) = 1+2X+X²` | V |
| L5 (item 5) | Damaged gadget: the gadget of `u_i` minus `c_ij` gives `G_c = (1+2X)^7(1+X) + X(1+X)^7` | `i<m`, `j<8` (labels in range) | literal DP at every `(i,j)`, m = 1..8, 0 bad. Derivation: split at `u_i`. Without `u_i`, 7 edges and the isolated `b_ij` give `(1+2X)^7(1+X)`. Without `N[u_i]`, 7 leaves give `(1+X)^7` | V |
| L6 (item 6) | The `8m−1` pairs other than `b_ij c_ij` give `(1+2X)^{8m−1}`. The exponent is `|(range m ×ˢ range 8).erase (i,j)| = 8m−1` | `(i,j)` is a member, so the ℕ-subtraction is exact | literal DP at every `(i,j)`, m = 1..8 | V |
| L7 (item 7) | `I(CB − c_ij − N[r]) = (1+X)((1+X)(1+2X)^{8m−1})`: `v` is isolated (its neighbour `s ∈ N(r)`), `b_ij` is isolated (`u_i ∈ N(r)` and `c_ij` deleted), plus L6 | `i<m`, `j<8` | literal DP at every `(i,j)`, m = 1..8. `N(r) = {s} ∪ {u_i}` checked literally at m = 0..6 | V |
| L8 (item 8) | `I(CB − c_ij − r) = (1+2X)(G_c·G^{m−1})`: the pendant, one damaged gadget, and `|(range m).erase i| = m−1` intact gadgets | `i<m`, so the ℕ-subtraction `m−1` is exact | literal DP at every `(i,j)`, m = 1..8 | V |
| L9 (item 9) | `I(CB − c_ij) = (1+2X)G_cG^{m−1} + X(1+X)^2(1+2X)^{8m−1}`, by L1 at `r` (`r ≠ c_ij`), L8, L7 and `ring` | `i<m`, `j<8` | recomputed identity. Literal DP equals the closed form for EVERY private leaf at m = 1..8 (brute-force subset enumeration at m = 1), and for 24 leaves (`i ∈ {0, ⌊m/2⌋, m−1}`, all `j`) at m = 107 and m = 110 | V |
| L9′ | Correction 5: `G − G_c = X·G'` with `G' = (1+2X)^7 + X(1+X)^7`. `G'` belongs to `I(CB − {c_ij, b_ij})`, NOT to `I(CB − c_ij)` | none | identity recomputed. Literal `I(CB − {c,b}) = (1+2X)G'G^{m−1} + X(1+X)(1+2X)^{8m−1}` at every `(i,j)`, m = 1..8. The award uses `G_c` in the `CB − c_ij` form, as required | V |
| L10 (item 10, node N1) | `vertexDeletionIndepSetCount (cbGraph m) c_ij k = [X^k]` of the L9 polynomial over ℕ. The step `univ.erase w = univ \ {w}` is used | `i<m`, `j<8` | entry 87; argument order `(G, v, k)` matches D1. Numerics as in L9 | V |
| L11 (items 1–3, node N2) | `I(CB − v) = (1+X)G^m + X(1+2X)^{8m}` (split at `r`: `{s}` isolated beside `G^m`; without `N[r]`, the `8m` pairs), and count = coefficient | none (holds for every `m`, including m = 0, where it gives `1+2X`) | literal DP equals the closed form at m = 0..8, 107 and 110; brute force at m = 1. Entries 78–80 are C-U3-T's DRAFT lines 288–313, 315–368 and 370–376 byte for byte after the one keyword edit (`reauthor_check.out`) | V |
| L12 (C2-LA2 terminal, carried) | Over ℤ[X], at the index pair `(p*+1, p*)`: strict descent of the arm closed form (conjunct 1) and of the private closed form with `G_c` (conjunct 2) | `hmod` used; `hm` unused (fence 1) | Not re-proved (kernel-checked origin, receipt verified). Integer recomputation of both descents at every class `m ≤ 1500` (500 rows, 465 of them with `m ≥ 107`), 0 failures | V |
| L13 (items 11–12, node N4) | The ℤ[X] polynomial equals `map (Nat.castRingHom ℤ)` of the ℕ[X] polynomial, so its coefficients are the ℕ coefficients cast. By L10/L11 these are `(i_{p*+1} : ℤ)` and `(i_{p*} : ℤ)`, and D2/D3 give `a − b < 0` from `a < b` | `hm`, `hmod` passed through to L12; `i<m`, `j<8` for `c_ij` | The polynomial expressions contain only `+`, `·`, powers and literals, and the exponents `m − 1` and `8m − 1` are the same ℕ terms on both sides, so the map identity is exact. No ℕ-subtraction on counts: the difference is formed in ℤ by D2. The literal DP gives `i_{p*+1} < i_{p*}` directly for `v` and for `c_{0,0}` at m = 107 and m = 110 | V |
| L14 (N3; carried entries 60, 72) | For `0 < m`, `leafSet(cbGraph m) = {v} ∪ {c_ij : i<m, j<8}` (`8m+1` leaves) | `0 < m`, which is SHARP: at m = 0 the literal leaves are `{0, 2}` (`r` is a leaf of the path `r–s–v`) | Literal leaf computation (`∃!` neighbour, i.e. degree 1) at m = 0..6: matches for m ≥ 1 (leaf counts 9, 17, …, 49), and gives `{0, 2}` at m = 0 | V |
| L15 (carried entry 74) | If every leaf is favorable at `p`, then `favorableLeaves G p = leafSet G` (`Finset.filter_true_of_mem`) | the universal favorability hypothesis | entry 74, read; elementary | V-def |
| L16 (item 13, terminal) | Apply L15, rewrite by L14 (`0 < m` from `107 ≤ m`), then `v` by L13 (arm) and each `c_ij`, `(i,j) ∈ range m ×ˢ range 8`, by L13 (private) | `hm` gives `0 < m` and is passed to L12; `hmod` is passed to L12 | composition checked line by line against entry 90 | V |
| A1 | ℕ-subtraction audit: `m − 1` and `8m − 1` are exact because `i < m` (so `m ≥ 1`) and `(i,j)` is a member; `(16m+4)/3` is exact iff `m ≡ 2 (mod 3)`, and it is used only as an index, with syntactically identical terms in C2-LA2, D2 and the terminal; the proof-internal witnesses `(t−3)/17` and `((t−3)%17−1)/2` recover `(i,j)` for every support/leaf label | as stated | `pstar_exact_iff_class` true for m ≤ 1500; `p*+1 ≤ 8m−1` on the class; label witnesses checked for m = 1..11 | V |
| A2 | Cast audit: the only cast is ℕ→ℤ on counts; no truncated ℕ difference of counts appears anywhere | — | D2 literal; L13 | V |
| U1 | Uniformity: `m`, `i`, `j`, `k` are variables. The only finite splits are 6 × `interval_cases j'` over the gadget edge index `j' < 8`: 2 in entry 76 (carried), 1 in entry 78 (re-authored), 2 in entry 82 and 1 in entry 85 (new), each case closed by `omega`. There are 0 occurrences of `decide`, `native_decide`, `sorry`, `admit`, `axiom`, `unsafe`, `implemented_by`, `extern` and `fin_cases`; `set_option maxHeartbeats 4000000 in` appears ×8 (entries 76–79, 82–85); there is exactly one `theorem` | — | my own token scan of the entry blocks; matches INFORMAL-PROOF §Uniformity exactly | V |
| C1 | Carries: 77 carried entries. 76 are byte-identical to their origin block, keyed (origin award, origin entry, origin state digest). One, C2-LA2 entry 28 → run entry 60, is rekeyed `theorem` → `lemma` (R31-N-15); the reverse single substitution reproduces origin digest `93acf3cc7326a0de9b538f3c76ef1425fca0e7789d5d3dc84a2dbfd5de658fc9`. Each origin `Main.lean` equals its kernel receipt's `source_sha256_before` = `_after` (verdict `verified`) and its closeout `formally_verified`: C1-LA2 `a906ec17…5f3f`, C2-LA1 `986b5257…0c9d`, C2-LA2 `e75c66b2…faae`, C1-LA3 `c0605e12…3011`. By origin: C1-LA2 30 entries; C2-LA2 28 (27 identical, 1 rekeyed); C2-LA1 19. Nothing of record is re-typed, and `Main.lean` has no text outside the entry blocks apart from `import Mathlib` and the registrar header | — | `carry_check.py` / `carry_check.out`, independent of the producer's `CAPSULE-VERIFICATION.json` (whose verdict `passed` agrees) | V |
| C2 | New and re-authored entries 78–90: 13 entries, none a carry. 78–80 are C-U3-T DRAFT re-authorings under attribution (keyword edit only). 81–90 are new | — | `reauthor_check.out`; entry headers name each origin | V |
| X1 | Nothing marked "not a dependency" is a dependency. The contract marks `cbVertex`, `polyCoeffZ` and the two `critU3T_*` definitions "used in the proof, not in the statement". None of them occurs in the terminal statement, whose free constants are `favorableLeaves`, `cbGraph` (with the `cbGraph_decAdj` instance), `C5LA1.leafSet`, ℕ arithmetic and `Fin`, all listed as statement dependencies. `hm` is declared unused only inside C2-LA2 (fence 1), and it IS used here, for `0 < m` (L16), exactly as the contract says | — | terminal text; entry 60 build warning (`hm` unused in the carried lemma only) | V |
| O1 | INFORMAL-PROOF §DAG says the generic machinery is "carried from C2-LA1 entries 36–37 and 521–538". Origin entry 531 (`critU3T_cb_minus_root_prod`) is NOT carried: the carried set is 521–530 and 532–538, which FORMALIZER-REPORT states exactly | — | carry table | O (imprecise range, no mathematical effect) |
| O2 | Hypothesis sharpness. For L14, `0 < m` is sharp (m = 0). For the conclusion, neither `107 ≤ m` nor `m ≡ 2 (mod 3)` is sharp on my grid: the two closed-form descents at `⌊(16m+4)/3⌋` hold at EVERY `m ≤ 1500` of every residue, including class rows `2 ≤ m < 107`. The record claims no sharpness here (C2-LA2 records `hm` unused; the class is the run's fence), so this is scope data, not a defect. The award claims nothing off the class | — | `la3_eval_M1500.json` | O |

## Reproduced Mathematical Evidence

I wrote all instruments myself under `scratchpad/c2-s7-informal-LA3/`. They use the standard library only, with explicit imports:
`la3_eval.py` imports `sys, json, random, math`, and `carry_check.py` imports `json, hashlib, re, os, sys`. I imported no prior
evaluator. The outputs contain no wall-clock fields, all arithmetic is exact integer arithmetic, and every run was in the
foreground.

| File | SHA-256 | Content |
|---|---|---|
| `la3_eval.py` | `9ffaac0b46b00c2d7011f32a4d53791149f40ec300158988788c0d230cc7343c` | literal `cbEdge` graph; leaf set; brute-force and forest-DP independence polynomials; generic lemmas on random graphs; closed forms and intermediate items; favorability grid |
| `la3_eval_M1500.json` | `e12c2c796eec7bd50c1af0c238145a91df1614eb1c4eb340df354f24b2040337` | full run with grid bound M = 1500 |
| `la3_eval_M600.json` | `ed8fbf612cf0336367581311f53bede8064501e7b358e833de6edf554e1dd42d` | same, M = 600 |
| `la3_eval_M60.json` | `8d8687d4aede1ab7764596d80258ed5de31d29bab41b002a0b1d678ee830a539` | same, M = 60 |
| `carry_check.py` | `665c6c13ea54b2bc015259c065e45bc9dc50ef0e9c808ccb2ce13b1ad3a597b2` | digest files; origin receipt binding; byte identity of every run entry block against the origin blocks and states; rekey reversibility |
| `carry_check.out` | `52e0c0b0b9da97054b38ec4adfb30a61d341bb4ea708179e4f4562aa12ad6668` | its output (90 rows; bindings) |
| `reauthor_check.out` | `5ceb549c29d59d0bc4eacbfb48c42eab7b89e36ebf76c89ef2427f8b4824525a` | entries 78–80 against DRAFT `CriticU3T2.lean` (`74a1c05c…`) lines 288–313, 315–368, 370–376: identical after `theorem`→`lemma` |
| `state_check.out` | `86db4eecdb4c2b420ca19e42e757ba7165dde5a78b297dfcc7aef38ac1229f77` | origin state layouts and closeouts (`formally_verified` ×4) |
| `statement_check.out` | `a9ac0c3ac83c40e1b4c3416066d63d324ee9f8c144641dfeed72d140b6557245` | synthesis block equals `expected_statement` after plumbing |

Results:

1. **The literal graph (A).**
   - For m = 0..6, evaluating the `cbEdge` predicate over all ordered pairs and symmetrizing as `fromRel` does gives the
     witness graph exactly.
   - It is a tree with `N(r) = {s} ∪ {u_i}` and `N(u_i) = {r} ∪ {b_ij}`.
   - Its degree-1 vertices are exactly `{2} ∪ {3+17i+2+2j}` for m ≥ 1, with `8m+1` of them.
   - At m = 0 they are `{0, 2}`, which is the failure of the leaf classification without `0 < m`.
2. **Generic lemmas (B).**
   - The forest DP equals brute-force subset enumeration on `CB(8,1)` for all 9 leaves and 4 internal vertices.
   - The vertex split holds on 400 random graphs.
   - The isolated-factor lemma holds on its 137 qualifying random instances and fails for an edge without `hN`.
3. **Closed forms (C).**
   - At m = 0..8, `I(CB − v)` equals `(1+X)G^m + X(1+2X)^{8m}`.
   - At m = 1..8, for EVERY private leaf, `I(CB − c_ij)` equals `(1+2X)G_cG^{m−1} + X(1+X)^2(1+2X)^{8m−1}`.
   - Items 5, 6, 7 and 8 each match at every `(i,j)`.
   - `G − G_c = X·G'`, and `I(CB − {c,b})` carries `G'`.
   - At m = 107 and m = 110 (`p* = 572`, `588`), the literal DP equals the closed forms for `v` and for 24 private leaves each.
     The literal counts satisfy `i_{p*+1} < i_{p*}` for `v` and `c_{0,0}`; the coefficients have about 1,360 and 1,400 bits.
4. **Favorability grid (D).**
   - For every m = 1..1500 I computed `Δ_{p}` at `p = ⌊(16m+4)/3⌋` for both closed forms as exact integers.
   - `G^m` is computed by iterated truncated multiplication; the binomial parts come from `C(n,k)2^k`.
   - Before the sweep, this coefficient routine was cross-checked against fully expanded polynomials at m = 2, 5, 107 and 110,
     at indices `p*−1..p*+2`.
   - Class rows: 500 checked (465 with m ≥ 107), with 0 failures of `Δ < 0` for either leaf class.
   - Off-class rows: also 0 failures (O2).
   - `(16m+4) % 3 = 0` holds iff `m ≡ 2 (mod 3)`, and `p*+1 ≤ 8m−1` on the class.

This is bounded support for the informal steps. It is not a substitute for the kernel check of C2-LA2's universal descent,
which is carried byte-identically from a `verified` receipt, and I did not re-prove it. SR-C2-1 was read for context only
(controller note); it is not evidence here, and none of my numbers came from it.

## Independent Critic Pass

I re-attacked my own ledger in a separate pass. Each row below is an objection and its resolution.

- **Is `Δ` backward rather than forward, or `≤` rather than `<`?** No. Entry 2 is `(i(p+1) : Int) − i(p)`, and entry 3 is `< 0`.
  C2-LA2's conjuncts compare `coeff (p*+1) < coeff p*`, the same orientation.
- **Does the ℤ[X] polynomial of C2-LA2 differ from the ℕ[X] one?** The two terms are the same syntax typed at different
  semirings, and the exponents `m − 1` and `8m − 1` are ℕ in both. So `map (Nat.castRingHom ℤ)` carries one onto the other.
  There is no subtraction inside either polynomial.
- **Is `G_c` swapped with `G'`?** No. Entry 82's survivor set is the gadget minus `c_ij` alone, with `b_ij` kept, and my DP
  confirms `G_c` for `CB − c_ij` and `G'` only for `CB − {c_ij, b_ij}`.
- **Is the private-leaf count taken for the right vertex?** Entry 87 uses `cbVertex m (3+17i+2+2j)`, and entry 72's image uses
  the same label function. `cbVertex_val` makes the label exact because `3+17i+2+2j < 17m+3` when `i<m` and `j<8`.
- **Could the `DecidableRel` instance change a count?** A `Finset.filter` does not depend on the choice of decidability
  instance, and the statement elaborates `cbGraph_decAdj`, which the contract lists.
- **Is `hm` really used?** Yes. `0 < m` is required by entry 72, and it is sharp there (m = 0). That is its only use in this
  award, as the face states.
- **Is anything proved by enumeration over `m`?** No. All six `interval_cases` range over `j' < 8`, a fixed gadget index, and
  every case is proved.
- **Was a carried block silently altered?** No. Byte comparison against all four origin files and their state digests holds
  for 76 entries, and the one rekey reverses exactly.
- **Does the "i.e." in the claim overreach?** No. `filter p s = s` holds iff `p` holds on all of `s`, so the equality is
  exactly "every leaf is strictly favorable".

The critic pass found no defect. O1 and O2 stand as observations.

## Scope and Fence Check

- **Fences on the face** (contract scope text, INFORMAL-PROOF §Fences, terminal docstring): one rank `p* = (16m+4)/3`,
  `d = 8`, the r31 class only (`m ≥ 107`, `m ≡ 2 (mod 3)`), and a statement about the literal `cbGraph m`. PRESENT.
- **Excluded conclusions of the formalizer brief §2:** (H), conjunct 4, (HALL), any aggregate, and any TREE/FOREST/TRANSFER
  status. All are listed on the contract's face, in INFORMAL-PROOF and in the terminal docstring.
- **Excluded conclusions of the synthesis `### C2-LA3`:** (H), conjunct 4 and (HALL). All are listed.
- **Additional exclusions on the face:** Erdős #993, other ranks, `m < 107`, other residues and `d ≠ 8`.
- **The claim itself asserts nothing fenced.** It is favorability, a Tier 3 carried input, at one rank on the class. It
  asserts nothing about (H), conjunct 4, (HALL), an aggregate, TREE/FOREST/TRANSFER, or any Tier 2 object.
- **Inherited C2-LA2 exclusions.** The synthesis's "as C2-LA2" also pulls in two C2-LA2 exclusions:
  - "any Tier 2 progress". This is not written verbatim on this award's face, but the claim is not Tier 2 progress, so
    nothing fenced is asserted.
  - `IsFavorableAt (cbGraph m) w p*`. This is necessarily superseded, because the synthesis routes exactly that statement to
    C2-LA3 ("no status transfer … until C2-LA3 or U-C closes").
- **No grade is asserted** for any companion: every non-terminal declaration is stated to be an ungraded companion.
- **Registration text.** On closure there is no new key, only the formal clause of the r30 favorability key's scope note at
  the restricted scope, consistent with the synthesis.
- **Attribution travels on the face.** It appears in INFORMAL-PROOF §Attribution and in the contract's `informal_statement`
  scope text, and it is exactly the synthesis `### C2-LA3` list ("as C2-LA2, plus C-U3-T and U3 for the link machinery"):
  - T1 (seat, arm leaf);
  - C-T1-F, C-T1-U;
  - C-F2-U;
  - C-F2-T, C-T2-F, C-T2-U;
  - r30;
  - C1-LA3 ((G));
  - C-U3-T and U3 (seat C2-U-03; Node 0);
  - the brief's additions: C2-LA1 and C2-LA2 (r31 Cycle 2 formalizers), and the formalizer `c2-la3-formalizer-opus-20260928`
    (Claude Opus 5.5).

  C1-LA2 is recorded as carry provenance and not as an attribution addition, as the brief permits. PRESENT.
- **Read-boundary disclosures.**
  1. The harness put the project `CLAUDE.md`, the user memory index and the user's e-mail into my context before my first
     call. I opened none of them and used none of them.
  2. The capsule-manifest print was saved by the harness to its own tool-output cache, and I did not open that copy.
  3. A listing of `sources/` showed directory names outside my grant (`authority`, `c1-stage7-sources`, `concurrent`,
     `first-interior`, `heterogeneous-closure`, `mathlib-binding`, `public-docs`). I opened nothing in them.
  4. Two listings showed names without contents: the run root, including `.sandbox-home`, `DRAFTS` and `SOURCE`, and the
     `sources/c2-stage7-sources/` seat directories.
  5. In the U adjudication (a capsule member), I also grepped the U-B/U-C paragraphs that follow `## Lean readiness`, for the
     favorability link.
  6. I read `SOLUTION-CONTRACT.md` §1 (to place "Tier 2"), grep hits in the U3 return and its two critiques, SR-C2-1
     (granted), origin `FORMALIZATION-STATE.json`, `VERIFICATION-REPORT.json` and kernel receipts under `sources/c1-results/`
     and `sources/c2-results/`, and C-U3-T's DRAFT `CriticU3T2.lean`.
  7. There was no network, no install, no `lake`/`lean`/`elan`, no `find`/`grep` rooted above the granted paths, no child
     agents, and no writes outside `scratchpad/c2-s7-informal-LA3/`.

## Verdict

passed

`INFORMAL-PROOF.md` is a correct, statement-level proof of the contract's `informal_statement`.
- Every definition matches the Lean source literally, and every carried entry is byte-identical to its origin block, which is
  bound to a `verified` kernel receipt (one rekey, which reverses exactly).
- Every ℕ-subtraction is exact under the hypothesis that introduces it, and the only cast is ℕ→ℤ on counts.
- Every closed form and intermediate identity was reproduced on the literal tree, and the two key integer inequalities hold at
  all 500 class rows up to m = 1500.
- The terminal's hypotheses match the claim one-for-one.
- No fenced conclusion is asserted, and the full attribution is on the award's face.

Observations O1 (an imprecise carried-entry range in the prose) and O2 (neither hypothesis is sharp for the conclusion on the
grid; the record claims no sharpness) are not defects.

Model disclosure: chartered Claude Opus 5.5, effort high (dispatch-record authority); runtime-reported model id, verbatim, `claude-opus-5-5`.
