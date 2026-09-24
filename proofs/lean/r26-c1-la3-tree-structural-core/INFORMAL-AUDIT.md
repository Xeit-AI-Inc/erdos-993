---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la3-formalizer-opus-20260924
critic_id: c1-la3-fable-informal-20260924
attestation_id: c1-la3-informal-pass-20260924
claim_sha256: 03a5e63a93671dc88390a1274d4929e610c8856372d31dd7997f9fca5f4a3e81
---

# Informal Proof Integrity Audit

**VerityOS boot.** This seat is operating within VerityOS. Loaded this session: `verity.md`;
`identity/startup-protocol.md`; `skills/proof-integrity-audit/skill.md`; and, inside the run root
`experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/`, only the files named in
`control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA3.md` §1 (the Lean run
`runs/lean-2026-09-24-c1-la3-tree-structural-core/`, the sealed capsule
`control/c1-stage7-capsules/C1-LA3-PACKET-MANIFEST.json` and its members, the formalizer brief
`control/C1-STAGE7-FORMALIZER-BRIEF-LA3.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, the
frozen C5-LA1 award under `sources/r24/c5-la1/`, and Mathlib sources under the shared read-only
project). Nothing outside that boundary was read; no network, no installs, no Lean build.

**Model disclosure.** This seat cannot self-inspect its runtime model or effort. On dispatch-record
authority (`control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA3.md`, header): Claude Opus 5, chartered
effort high, independent informal proof-integrity reviewer, child delegation forbidden. This seat is
not the artifact producer; it edited no contract, no Lean source, no informal proof and no receipt.

**Role separation.** Producer of the audited artifacts: `c1-la3-formalizer-opus-20260924`. Reviewer:
`c1-la3-fable-informal-20260924`. This document and the scratch beneath
`scratchpad/c1-s7-informal-LA3/` are the only files this seat wrote.

---

## Intended Claim

The intended claim is exactly `THEOREM-CONTRACT.yaml` → `theorem.informal_statement`, verbatim:

> For every finite simple graph G on a finite vertex type with decidable equality and decidable
> adjacency, if G is a tree, its leaf set has exactly two elements, and some vertex s has leaf degree
> exactly 2 (both leaves are adjacent to s), then G.indepNum = 2. The declaration is the deepest fact
> of award group C1-LA3, whose registered declarations are the tree-structural core of
> C1-ALLOCATION.md item 9 (a)-(f) in the sharp forms ruled by the Cycle 1 synthesis, together with
> the critic-compiled extensions L intersect C(G) = empty, lambda identically zero on the leaf set,
> j*|C_j| <= |L| hence k_2 <= floor(|L|/2), and k_2 = 0 on the eligible class when |L| = 2. No
> registered declaration mentions the aggregate S, W_III, the families, or (RC), and none consumes
> hyp-residual.

**Claim digest, recomputed by this seat.** `" ".join(s.split())` over the string above, SHA-256:

```
03a5e63a93671dc88390a1274d4929e610c8856372d31dd7997f9fca5f4a3e81
```

This equals the digest the brief pins. Recomputed with `hashlib` in
`scratchpad/c1-s7-informal-LA3/` (see Reproduced Mathematical Evidence, R0).

**Artifact digests, recomputed.** `THEOREM-CONTRACT.yaml`
`3205cad3795799a18b8d8903f333965021560cf8f53977dad85fafa73fe7947c`; `INFORMAL-PROOF.md`
`9493e9c267fb4563bfb7b2bd7c5e8edf890a8d01698cfe6806294e055b061b71`; `LeanProject/LeanProof/Main.lean`
`28c765ec8846d0fc561e3098bc1b992f856dad7817daa58abab7700ebfb2b054`; frozen C5-LA1 source
`0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b`; `U3-Main.lean`
`fb54fa05563238ba77167cefd1d30fd85baa0135a36d24518284e2380b6fa332`; `C-U3-T-CriticU3T.lean`
`1dba1d5bb45129f3e0a62a1081723db558bbcf134a4acb0d928125a24074a993`; `C-U3-F-CriticF.lean`
`1963b75b716982237cb9da80ff5c88cfc10c68960bb37568664723e2e582b52a`. All match the brief.

**Capsule seal, recomputed.** The declared seal
`c5fcd34880aae4310c39f6d1ae2e7e8fa7b13531610da5e09c68aef06cfc29af` reproduces as the SHA-256 of the
manifest JSON with `seal_sha256` removed, serialized with sorted keys and compact separators. All 29
member files verified byte-count and digest exact; **0 mismatches**.

**Terminal binding.** `lean_binding.declaration_name` = `R26LA3.leafDegree_two_indepNum_eq_two`,
kind `theorem`, present as the last registered entry (entry 30) of `Main.lean`. The declaration text
in the source, whitespace-normalized, equals `expected_statement` exactly, and
SHA-256(`expected_statement`) = `272221c3cf3809e320778b53f0c156e68293e47bde5948dee3677de7a526add5`,
matching the contract. The terminal declaration's hypotheses are exactly `hTree`, `hLeafCard`,
`hDeg2` — one-for-one with the contract's `hypotheses` list (`hyp-tree`, `hyp-leaf-card`,
`hyp-leafdegree-two`), no more and no fewer.

---

## Claim Ledger

Registration is 30 declarations: 9 definitions, 20 lemmas, 1 terminal theorem
(`FORMALIZATION-STATE.json`, `state_revision` 30; counts confirmed by this seat). `INFORMAL-PROOF.md`
covers **all 30**, in registration order, at statement-level granularity: §1 items 1–9 = entries 1–9,
§2 items 10–12 = entries 10–12, §3 items 13–29 = entries 13–29, §4 item 30 = entry 30. No registered
declaration is uncovered; no covered item is unregistered.

Notation: `L` = leaf set, `ℓ = |L|`, `λ(s)` = leaf degree, `C(G)` = support set, `α` = `indepNum`,
`x(G)` = crossing index, `C_j = {s : λ(s) = j}`, `k₂ = |C_2|`.

### Definition layer (entries 1–9)

| # | Declaration | Hypotheses consumed | Verdict | Evidence |
|---|---|---|---|---|
| 1 | `C4LA1.IsGraphLeaf` — `∃! u, G.Adj v u` | — | verified, byte-identical to frozen entry 4 | R1, R3 |
| 2 | `C5LA1.support` — `Classical.choose` of the unique neighbour; unconstrained off `L` | — | verified, byte-identical to frozen entry 5 | R1 |
| 3 | `C5LA1.leafSet` — `univ.filter (IsGraphLeaf G)` | — | verified, byte-identical to frozen entry 6 | R1 |
| 4 | `C5LA1.leafDegree` — `((leafSet G).filter (G.Adj · s)).card` | — | verified, byte-identical to frozen entry 7 | R1 |
| 5 | `C5LA1.indepSetsAvoiding` | — | verified, byte-identical to frozen entry 10 | R1 |
| 6 | `C5LA1.indepSetCount` | — | verified, byte-identical to frozen entry 11 | R1 |
| 7 | `C5LA1.forwardDifferenceDel` — `Δ_k = i_{k+1} − i_k` in `ℤ` | — | verified, byte-identical to frozen entry 12 | R1 |
| 8 | `C5LA1.crossingIndex` — least `k` with `Δ_k < 0` | — | verified, byte-identical to frozen entry 14; well-definedness (`Δ_α = −i_α < 0`) recomputed | R1, R4 |
| 9 | `R26LA3.supportSet` — `(leafSet G).image (support G)` | — | verified; image/filter equivalence recomputed | R3, R5 |

The C5-LA1 layer was compared **byte-for-byte** against
`sources/r24/c5-la1/LeanProject/LeanProof/Main.lean` (digest `0933211d…`) by extracting the
`VERITYOS ENTRY … BEGIN/END` blocks of both files and comparing the enclosed bytes. All 11 carried
entries (the 8 definitions above plus entries 10–12 below) are **byte-identical**, with the frozen
per-entry digest reproduced unchanged; nothing is re-stated. Frozen→award entry map, as the contract
declares it: 4→1, 5→2, 6→3, 7→4, 10→5, 11→6, 12→7, 14→8, 19→10, 20→11, 22→12 — each verified.

### C5-LA1 lemma layer (entries 10–12)

| # | Declaration | Hypotheses | Verdict | Evidence |
|---|---|---|---|---|
| 10 | `C5LA1.support_spec` | `IsGraphLeaf G v` | verified, byte-identical to frozen entry 19 | R1 |
| 11 | `C5LA1.adj_iff_support_eq` — `Adj v s ↔ support v = s` | `IsGraphLeaf G v` | verified, byte-identical to frozen entry 20 | R1 |
| 12 | `C5LA1.leafDegree_eq_filter_support` — `λ(s) = |{v ∈ L : support v = s}|` | — | verified, byte-identical to frozen entry 22; identity recomputed at every vertex of every graph and tree in the sweep | R1, R5 |

### Award lemma layer (entries 13–29) and terminal theorem (entry 30)

| # | Declaration | Hypotheses consumed (as the proof records them) | Audit verdict | Evidence |
|---|---|---|---|---|
| 13 | `closed_reachable` — a walk transports a step-closed `P` | `hP` only; **no tree, no connectivity, no `hyp-alpha`** | verified; walk induction sound (`nil`: identity; `cons`: one `hP` step then IH) | R6 |
| 14 | `card_leafSet_ge_two_of_nontrivial` — `2 ≤ ℓ` | `hyp-tree` (acyclicity via edge count; **connectivity** via `degree_pos_of_nontrivial`), `Nontrivial V` | verified; handshake bound `∑deg = 2(n−1)`, `ℓ + 2(n−ℓ) ≤ ∑deg` refutes `ℓ ≤ 1` | R4, R7 |
| 15 | `tree_two_le_indepNum_two_le_leafSet` — item 9(a) | `hyp-tree`, `hyp-alpha` (**only** to produce `Nontrivial V`) | verified; `α ≥ 2 ⟹ |V| ≥ 2` via `card_le_univ` | R4, R7 |
| 16 | `tree_two_le_indepNum_no_adjacent_leaves` — item 9(b) | `hyp-tree` (**connectivity only**), `hyp-alpha` | verified; closure `P x := x = v ∨ x = w` forces `V = {v,w}`, contradicting `α ≥ 2` | R4, R7, R9 |
| 17 | `leafDegree_eq_zero_of_not_mem_supportSet` — item 9(c), **sharp** | **none** — no `IsTree`, no `hyp-alpha`, **no inert `¬ IsGraphLeaf G d`** | verified hypothesis-free on every graph tested; dropped hypothesis shown inert by exhibit | R4, R8 |
| 18 | `leaf_not_mem_supportSet` | `hyp-tree`, `hyp-alpha` (both only through 16) | verified | R4, R9 |
| 19 | `disjoint_leafSet_supportSet` — `L ∩ C(G) = ∅` | `hyp-tree`, `hyp-alpha` | verified; `hyp-alpha` sharp (K₂ counterexample) | R4, R8, R9 |
| 20 | `leaf_leafDegree_eq_zero` — `λ ≡ 0` on `L` | `hyp-tree`, `hyp-alpha` | verified as 17 ∘ 18; `hyp-alpha` sharp (K₂) | R4, R8, R9 |
| 21 | `sum_leafDegree_eq_card_leafSet` — item 9(d).1 | **none** (synthesis repair "(iii) at no hypotheses") | verified on every graph tested; fibrewise count `card_eq_sum_card_fiberwise` confirmed at Mathlib source | R4, R10, R11 |
| 22 | `card_C1_le_card_leafSet` — item 9(d).2 | **none** | verified; `|C_1| = ∑_{C_1} λ ≤ ∑_V λ = ℓ` | R4, R10 |
| 23 | `mul_card_leafDegree_fiber_le_card_leafSet` — `j·|C_j| ≤ ℓ` | **none** | verified for every `j` including `j = 0` and `j > |V|` | R4, R8 |
| 24 | `two_mul_card_C2_le_card_leafSet` — `2k₂ ≤ ℓ` | **none** | verified; `2k₂ ≤ ℓ ⟺ k₂ ≤ ⌊ℓ/2⌋` confirmed on a 200×200 grid; **no `ℕ`-division occurs** | R4, R12 |
| 25 | `eligible_three_le_indepNum` — item 9(f) | `hyp-eligible` only; **no `IsTree`, no `hyp-alpha`** | verified on the full truncated-`ℕ` grid, `α = 0` included | R13 |
| 26 | `nonleaf_degree_eq_two_of_leafSet_card_eq_two` | `hyp-tree` (acyclicity + **connectivity**), `ℓ = 2`; **no `hyp-alpha`** | verified; degree-sum tightness `∑_{non-leaf} deg = 2(n−2)` with each term `≥ 2` | R4, R7 |
| 27 | `leafDegree_two_indepNum_eq_two_core` — the `P₃` lemma | `hyp-tree` (acyclicity via 26; **connectivity via `closed_reachable`**), `ℓ = 2`, `λ(s) = 2`; **no `hyp-alpha`** | verified; all five steps recomputed | R4, R7, R9, R14 |
| 28 | `no_leafDegree_two_of_eligible` | `hyp-tree`, `hyp-eligible`, `ℓ = 2`; no `hyp-alpha` | verified (25 gives `α ≥ 3`, 27 gives `α = 2`) | R4, R15 |
| 29 | `card_C2_eq_zero_of_eligible` — `k₂ = 0` | `hyp-tree`, `hyp-eligible`, `ℓ = 2` | verified | R4, R15 |
| 30 | **`R26LA3.leafDegree_two_indepNum_eq_two`** (terminal `theorem`) | exactly `hTree`, `hLeafCard`, `hDeg2` | verified; statement byte-identical to 27 and to U3's compiled statement; proof is a one-term application of 27 | R3, R14 |

**`ℕ`-subtraction and cast audit (every occurrence).**

1. Entry 14, `2(n−1)`: supplied to `omega` as the linear fact `#E + 1 = n`; never computed by hand;
   `n ≥ 2` holds, so no truncation is reachable. Sound.
2. Entry 25, `α − 1`: **genuinely truncating at `α = 0`**. The proof's validity rests on `omega`
   modelling `Nat.sub` truncation exactly rather than assuming `α ≥ 1`. This seat recomputed the
   statement over the full grid `0 ≤ x, α < 40` **using truncated subtraction** and confirms it holds
   at `α = 0` (where `α − 1 = 0` and `x + 2 ≥ 2 > 0`, so the premise is false). The informal proof's
   `ℕ`-subtraction note states precisely this. Sound.
3. Entry 26, `n − 1` and `|T.erase v| + 1 = |T|`: both supplied to `omega` as exact linear facts
   (`hedges`, `Finset.card_erase_add_one`); `2(n−1) − 2 = 2(n−2)` is never computed as a `ℕ`
   subtraction in the source, only as the equality `∑_{non-leaf} deg = 2·|non-leaf|`. Sound.
4. Entry 24: the `SEMANTIC-CONTRACT.md` §4 form `k₂ ≤ ⌊ℓ/2⌋` is **not** registered; the award
   registers `2·k₂ ≤ ℓ`, so **no `ℕ`-division is introduced at all**. The equivalence cited
   (`Nat.le_div_iff_mul_le`, core `Init/Data/Nat/Div/Basic.lean:271`,
   `(k0 : 0 < k) : x ≤ y / k ↔ x * k ≤ y`) is correct, and the commutation `2·k₂` vs `k₂·2` is
   immaterial. Sound.
5. Entry 7 (`forwardDifferenceDel`) is the only cast: `(indepSetCount … : Int) − indepSetCount …`,
   an `ℕ → ℤ` cast **before** the subtraction, so the difference is a true integer difference and can
   be negative. This is exactly what `crossingIndex` needs. Sound; no truncation.

No other subtraction or cast occurs in any registered declaration.

**Every equality used is an identity (recomputed, not trusted).** Entries 12, 21 and the Step-1/Step-3
set equalities of 27 are the load-bearing equalities. Each was recomputed exhaustively (R5, R10, R14)
rather than read off the prose.

**Dependency-graph integrity.** The contract's `dependency_graph` has 39 nodes (31 `definition`, 4
`domain`, 3 `hypothesis`, 1 `conclusion`), is **acyclic**, and contains a node for **every** one of the
30 registered declarations (the terminal theorem as the `conclusion` node). This seat extracted the
actual intra-award references from each entry body with docstrings stripped and confirmed that **every
actual reference is an edge of the transitive closure** of the declared DAG — 0 uncovered references.
The graph records the minimal (immediate) edges; several genuine references are transitive rather than
immediate (e.g. `sum_leafDegree_eq_card_leafSet` reaches `leafSet`/`leafDegree`/`support` through
`leafDegree_eq_filter_support`). That is a correct DAG, not a gap.

**Nothing marked NOT a dependency is a dependency.** Checked by name over the whole source, with
substring false positives resolved by line:

- `hyp-residual` / `(★)` (`∀ v, IsGraphLeaf G v → ∀ S, IsIndepSet S → S.card = α → v ∈ S`,
  `SEMANTIC-CONTRACT.md` §2) — **absent**: the token does not occur, and no registered declaration
  carries a hypothesis of that shape. The complete hypothesis inventory across all 30 declarations is
  `hTree`, `hAlpha`, `hLeafCard`, `hDeg2`, `hEligible`, `hd`, `hv`, `hP`, `j`, `[Nontrivial V]`.
- `R26U3.connected_induce_compl_pair` — **absent** (0 occurrences).
- `R26U3.degree_one_mem_support_eq_endpoint` — **absent** (0 occurrences).
- `R26CritU3F.isTree_induce_compl_pair` — **absent** (0 occurrences).
- `R26U3.interior_leafDegree_eq_zero` — **not registered**; the single textual hit (line 383) is
  inside entry 17's docstring, which names the repaired-away lemma in prose.
- `C5LA1.support_ne_self`, `C5LA1.sum_card_filter_comm` — **not registered**, and no registered
  declaration references either. Brief R1 lists them "as needed"; they are not needed, so nothing
  unused is imported.
- `R26CritU3F.two_mul_card_C2_le` — **absent**; the 2 textual hits are the substring inside the
  registered C-U3-T name `two_mul_card_C2_le_card_leafSet` (entries 24's marker and declaration).
- `C5LA1.aggregate`, `C5LA1.H`, `C5LA1.R` (the `S`-side machinery of the frozen award) — **not
  registered**.

**Carry and provenance integrity.** `DRAFTS/CARRY-TABLE.json` declares, for every non-C5-LA1 entry, an
origin file, a line range, a slice digest and an explicit transcription list. This seat re-sliced each
origin by its declared line range: **all 19 slice digests and byte counts reproduce exactly**, and
applying only the declared transcriptions reconstructs the registered body verbatim in every case
(the terminal theorem being the one declared manual re-proof, its statement byte-identical and its
proof a one-term application). All 30 `DRAFTS/*.lean` fragments match their declared digests and appear
verbatim in `Main.lean`. Every transcription is name-scoping (`R26U3.` → bare, `theorem` → `lemma`,
the `_core` rename, the `noncomputable` line break) — **no transcription alters a statement**.

The "one derivation of each fact" rule holds: every fact is carried once, from `C-U3-T` where the
synthesis attributes the extension and from U3 for the route. `C-U3-F`'s seven declarations
(`interior_leafDegree_eq_zero'`, `leaf_leafDegree_eq_zero`, `leaf_not_support`,
`leafSet_disjoint_supports`, `mul_card_leafDegree_eq_le`, `two_mul_card_C2_le`,
`isTree_induce_compl_pair`) are exactly the seven this seat found in `C-U3-F-CriticF.lean`, and all
seven are correctly listed in `INFORMAL-PROOF.md` §5 as recorded-not-carried. The "one name collision"
finding is correct: intersecting the `C-U3-T` and `C-U3-F` name sets yields exactly
`{leaf_leafDegree_eq_zero}`. Entries 22 and 23 are not a duplicate derivation: the synthesis names both
`card_C1_le_card_leafSet` (U3) and `j·|C_j| ≤ ℓ` (critic) as distinct award items; 23 generalizes 22
but does not re-derive it, and 24 is a one-term instance of 23.

**Attribution on the award's face.** `INFORMAL-PROOF.md` carries a dedicated attribution block naming
U3 (route), `C-U3-T` and `C-U3-F` (critic extensions, with the specific facts each contributed), T3
(informal proofs and Mathlib anchors) and the two T3 critics that verified the anchors, plus the frozen
C5-LA1 source as definitions of record. The contract carries the same attribution per declaration
(`Origin route U3` / `Origin critic C-U3-T` / `co-derived by C-U3-F` in each `description`) and in
`formulation_status.evidence`. The synthesis's attribution requirement is satisfied on both faces.

---

## Reproduced Mathematical Evidence

All code was written by this seat under `scratchpad/c1-s7-informal-LA3/` (`evaluator.py`,
`check_claims.py`, `sharpness.py`, `extended.py`, `critic_pass.py`, `extract_entries.py`,
`c5la1_bytecheck.py`, `carry_check.py`). **Imports: `itertools`, `sys`, `random`, `heapq`, `hashlib`,
`json`, `re` — Python standard library only.** No prior evaluator was imported; no third-party package
was used; no wall-clock field appears in any hashed file. Every quantity is an exact Python integer or
frozenset; **no floating-point arithmetic appears anywhere**. All runs were foreground.

Graph model: `V = range(n)`, edges as frozensets; `IsGraphLeaf` as "exactly one neighbour" (equivalent
to `degree = 1`, which Mathlib's `degree_eq_one_iff_existsUnique_adj` certifies); `support` as the
unique neighbour of a leaf (undefined off `L`, and never used off `L`); `indepNum` by exhaustive subset
search; `crossingIndex` as the least `k` with `i_{k+1} − i_k < 0` over `D = ∅`; `IsTree` as connected
and acyclic (`#E = n − #components`, plus connectivity).

**Generator completeness (prerequisite).** The labeled-tree generator is Prüfer-based; its output
count matches Cayley's formula `n^{n−2}` at `n = 1..7` (1, 1, 3, 16, 125, 1296, 16807) and every
output is confirmed to be a tree. The graph generator enumerates all `2^{C(n,2)}` edge sets.

**Sweep sizes.** All simple graphs on `n ≤ 6` (33 867 graphs); all labeled trees on `n ≤ 8`
(280 393 trees, including all 262 144 on 8 vertices); 4 000 random graphs on `n ∈ [7,10]` at three
densities (seed 20260924); all step-closed predicates over all graphs `n ≤ 5`; two 200×200 and 40×40
integer grids. **Total failures across every sweep: 0.**

- **R0 — claim digest.** `" ".join(informal_statement.split())` hashed to
  `03a5e63a93671dc88390a1274d4929e610c8856372d31dd7997f9fca5f4a3e81`, equal to the brief's value.
  `expected_statement` hashed to `272221c3…`, equal to the contract's `expected_statement_sha256`.
- **R1 — C5-LA1 byte-for-byte.** All 11 carried entries byte-identical to the frozen source, frozen
  digests reproduced, kinds unchanged; no extra `C4LA1.`/`C5LA1.` entry registered.
- **R2 — capsule.** Seal recomputed; 29/29 members exact.
- **R3 — terminal statement.** Entry 27 and entry 30 statements identical after normalizing kind and
  name; entry 30's declaration text normalizes to `expected_statement` exactly.
- **R4 — the full statement sweep.** Every claim in the table above recomputed over all graphs
  `n ≤ 6`, all trees `n ≤ 7` (`check_claims.py`) and all trees `n = 8` (`extended.py`): 0 failures.
- **R5 — entries 12 and 9.** `λ(s) = |{v ∈ L : support v = s}|` and
  `supportSet = {s : λ(s) > 0}` (the image/filter reconciliation §1 item 9 asserts) verified at every
  vertex of every graph in the sweep plus the random `n ∈ [7,10]` set.
- **R6 — entry 13.** Verified exhaustively: for every graph on `n ≤ 5`, every step-closed predicate
  `P` and every `a ∈ P`, the reachable set of `a` is contained in `P`.
- **R7 — the degree-sum core.** Entries 14, 15, 26 verified on every tree in the sweep.
- **R8 — sharpness, exhibited failures outside the stated hypotheses.**
  - `hyp-tree` connectivity in 14: the edgeless graph on 2 vertices is acyclic, not connected, and has
    `ℓ = 0`, so `2 ≤ ℓ` **fails**. Connectivity is load-bearing, exactly as recorded.
  - `hyp-alpha` in 15: `K₁` is a tree with `α = 1` and `ℓ = 0`, so `2 ≤ ℓ` **fails**.
  - `hyp-alpha` in 16/19/20: `K₂` is a tree with `α = 1`, `L = {a,b}`, `C(G) = {a,b}`,
    `λ(a) = λ(b) = 1`. Its two leaves are adjacent, `L ∩ C(G) = {a,b} ≠ ∅`, and `λ ≢ 0` on `L`. All
    three conclusions **fail**. This is exactly the exception `SEMANTIC-CONTRACT.md` §3 names ("the
    only tree with a leaf adjacent to a leaf is `K₂`").
  - Connectivity in 27: `P₃ ⊔ K₁` (4 vertices, edges `{0,1},{1,2}`) is acyclic, not connected, with
    `ℓ = 2` and `λ(1) = 2`, yet `α = 3 ≠ 2`. The conclusion **fails**.
  - Acyclicity in 27: the connected graph on 5 vertices with edges
    `{0,1},{0,2},{0,3},{0,4},{1,2}` has `ℓ = 2` and a vertex of leaf degree 2, yet `α = 3 ≠ 2`. The
    conclusion **fails**. (Three further witnesses were found at `n = 5`.) Both halves of `hyp-tree`
    are therefore genuinely load-bearing in the terminal theorem, exactly as the contract's `hyp-tree`
    note states.
  - Inertness of the hypothesis the sharp form drops: in the star `K_{1,2}` the vertices `1` and `2`
    **are** leaves and lie outside `C(G)`, and `λ = 0` at both — so the conclusion holds on precisely
    the vertices U3's `¬ IsGraphLeaf G d` would have excluded. The synthesis's sharp form is correct
    and strictly stronger.
  - Entry 23 at degenerate `j`: `j = 0` gives `0 ≤ ℓ`; `j > |V|` gives `|C_j| = 0`. Both hold.
- **R9 — the prose claim "connectivity only" in 16/18/19/20.** Over all **connected** graphs with
  `α ≥ 2` on `n ≤ 6` (27 470 graphs, not merely the trees), no two leaves are adjacent, no leaf lies
  in `C(G)`, `L ∩ C(G) = ∅`, and `λ ≡ 0` on `L`. Acyclicity is indeed unused, confirming the informal
  proof's hypothesis accounting rather than merely restating it.
- **R10 — entries 21/22/23/24 at no hypotheses.** Verified on all 33 867 graphs `n ≤ 6`, all trees
  `n ≤ 8`, and the random `n ∈ [7,10]` set. `∑_s λ(s) = ℓ` independently re-derived a third way, by
  counting leaf–neighbour incidences directly (each leaf contributes exactly one).
- **R11 — Mathlib anchors, checked at file and line in the pinned project.** Every anchor the informal
  proof cites resolves and says what the proof says it says:
  `degree_eq_one_iff_existsUnique_adj` `Combinatorics/SimpleGraph/Finite.lean:244` ✔;
  `card_neighborFinset_eq_degree` `Finite.lean:200` ✔; `IsTree.card_edgeFinset` `Acyclic.lean:296` ✔;
  `sum_degrees_eq_twice_card_edges` `DegreeSum.lean:102` ✔;
  `Preconnected.degree_pos_of_nontrivial` `Connectivity/Connected.lean:279` ✔ (and it does carry
  `[Nontrivial V]`, so the nontriviality bookkeeping is real);
  `exists_isNIndepSet_indepNum` `Clique.lean:997` ✔;
  `Connected.induce_compl_singleton_of_degree_eq_one` `Acyclic.lean:516` ✔ (cited only to describe
  T3's *unused* route); `sum_le_sum_of_subset`
  `Algebra/Order/BigOperators/Group/Finset.lean:418` ✔ — the `to_additive` alias of
  `prod_le_prod_of_subset'`, inside the `CanonicallyOrderedMul` section, confirming the proof's remark
  that it is "valid in `ℕ` with no nonnegativity side condition";
  `card_eq_sum_card_fiberwise` `Algebra/BigOperators/Group/Finset/Basic.lean:979`, statement
  `(H : (s : Set ι).MapsTo f t) : #s = ∑ b ∈ t, #{a ∈ s | f a = b}` ✔ — the "trivial `MapsTo`
  obligation" is exactly `support G v ∈ univ`. Also confirmed: `IsIndepSet.card_le_indepNum`
  `Clique.lean:991`, `nontrivial_of_degree_ne_zero` `Finite.lean:240`, `Finset.card_erase_add_one`
  `Data/Finset/Card.lean:156`, `Finset.eq_of_subset_of_card_le` `Data/Finset/Card.lean:277`,
  `Finset.card_eq_two` `Data/Finset/Card.lean:782`, `Nat.le_div_iff_mul_le`
  `Init/Data/Nat/Div/Basic.lean:271`.
- **R12 — the division-form equivalence.** `2k ≤ ℓ ⟺ k ≤ ⌊ℓ/2⌋` verified for all `0 ≤ k, ℓ < 200`
  in exact integer arithmetic.
- **R13 — entry 25 on a grid.** `x + 2 ≤ α ∸ 1 ⟹ 3 ≤ α` verified for all `0 ≤ x, α < 40` with
  **truncated** `∸`, and separately at the real `(x(G), α(G))` of every graph and tree in the sweep.
- **R14 — the `P₃` lemma, step by step.** Step 1 (filter = `L`, both leaves adjacent to `s`), Step 2
  (`s` not a leaf, `deg s = 2`), Step 3 (`N(s) = {t₁,t₂}`), Step 4 (closure gives `V = {t₁,s,t₂}`),
  Step 5 (`α = 2`) each recomputed. Over all trees `n ≤ 8`, the hypothesis set
  `{IsTree, ℓ = 2, ∃s λ(s) = 2}` is satisfied by exactly the **3 labeled `P₃`s on 3 vertices and
  nothing else**, and `α = 2` on each — confirming the contract's conclusion note that the tree is
  forced to be `t₁ − s − t₂`, and confirming that the declaration asserts only the `indepNum` value.
- **R15 — the eligible-class lemmas.** Verified wherever the hypotheses hold. Context recorded under
  Observations below.
- **R16 — axiom report.** All 30 registered declarations probed in
  `EVIDENCE/axioms-all-declarations.txt` (written before kernel verification, per its own header):
  `C4LA1.IsGraphLeaf` depends on no axioms; `R26LA3.closed_reachable` depends on
  `[propext, Quot.sound]`; the other 28 depend on exactly `[propext, Classical.choice, Quot.sound]`.
  Every entry is a subset of the contract's `permitted_axioms`. `EVIDENCE/axioms.txt` records the
  terminal declaration's probe at the three permitted axioms. No `sorry`, `admit`, `native_decide`,
  or `axiom` declaration occurs anywhere in `Main.lean`.

---

## Independent Critic Pass

A separate pass was run over this seat's own ledger before closing, by a second route where one
existed (`critic_pass.py`).

- **C1 — the auditor's own `α`.** `indepNum` was recomputed a second way, as the clique number of the
  complement, and cross-checked on all 33 867 graphs `n ≤ 6`. The two implementations agree
  everywhere, so no ledger verdict rests on a single independence routine.
- **C2 — the terminal hypothesis class.** Enumerated directly: among all labeled trees on `n ≤ 8`,
  the terminal hypotheses are satisfied only at `n = 3` (3 labeled instances), with `α = 2` in each.
- **C3/C4 — `α(P₃)` from scratch.** Every subset of `P₃` enumerated: the independent sets are
  `∅, {t₁}, {s}, {t₂}, {t₁,t₂}`, so `α = 2`. The triple `{t₁, s, t₂}` is not independent (`t₁ ∼ s`),
  which is precisely the informal proof's Step-5 exclusion of `|M| = 3`.
- **C5 — `∑λ = ℓ` a third way.** Counted leaf–neighbour incidences directly; equals `∑_s λ(s)` and
  equals `ℓ`, on all graphs `n ≤ 6`.
- **C6 — the sharpness ledger re-run** against fresh witnesses; all five hypothesis-necessity claims
  reconfirmed.
- **C7 — adversarial re-reading of the prose.** Two statements in `INFORMAL-PROOF.md` were
  deliberately re-tested rather than accepted: "(b) consumes connectivity only" (confirmed by R9, over
  connected non-trees) and "no `ℕ`-division occurs" in 24 (confirmed by reading the registered
  statement, which contains no `/`). Both hold.
- **C8 — was any verdict softened?** Reviewed each ledger row for a verdict issued on prose agreement
  alone. None: every mathematical row carries recomputed evidence, and every structural row carries a
  digest or a byte comparison.

**Observations recorded by the critic pass (examined, and each found NOT to be a defect):**

- **IMP-1 (prose imprecision in `INFORMAL-PROOF.md` §6).** §6 states "`C4LA1.IsGraphLeaf` depends on
  no axioms at all; every other declaration depends on exactly the three permitted axioms." The
  producer's own evidence file shows one exception: `R26LA3.closed_reachable` depends on
  `[propext, Quot.sound]` — **two**, not three. This is a misstatement about the axiom *report*, not
  about the mathematics, and it errs strictly on the safe side: the actual dependency is a proper
  subset of the permitted set, the contract's policy is an explicit allowlist
  (`explicit_axiom_allowlist`), and `success_criteria.approved_axioms_only` is satisfied. It cannot
  weaken any claim, since a declaration proved with fewer axioms is stronger, not weaker. Recorded as
  an imprecision for the controller's attention; **not** a defect and **not** a ground for failure.
- **OBS-1 (vacuity of the eligible-class lemmas on the tested range).** Entries 28 and 29 are true
  conditionals, but no tree with `ℓ = 2` on `n ≤ 8` satisfies `hyp-eligible`: 0 of the 23 116 such
  trees. (For paths, `x(P_n) + 2` exceeds `α(P_n) ∸ 1` throughout the range: `P₃` gives `3 ≤ 1` false,
  `P₅` gives `4 ≤ 2` false, `P₇` gives `4 ≤ 3` false, and so on.) `hyp-eligible` is nevertheless
  *inhabited* on trees — 1 897 of 16 807 labeled trees on 7 vertices, 6 784 of 262 144 on 8 — so entry
  25 is not vacuous, and the eligible class is a real class. The award nowhere claims non-vacuity of
  the `ℓ = 2` eligible subclass, and the informal proof correctly presents 28/29 as the composition of
  25 and 27 rather than as an inhabited-class result. Recorded as context, not a defect.
- **OBS-2 (shorthand in the contract's `informal_statement`).** The statement names the critic
  extensions by their conclusions — "L intersect C(G) = empty", "lambda identically zero on the leaf
  set" — without their hypotheses, and `K₂` shows both fail without `hyp-alpha` (R8). Examined and
  cleared: the sentence is a description of the group's registered contents, not an assertion of those
  facts hypothesis-free; the wording mirrors the governing synthesis text verbatim ("`L ∩ C = ∅`,
  `λ ≡ 0` on `L`"); and every registered declaration carries `hTree` and `hAlpha` explicitly in the
  Lean source, in the contract's per-declaration descriptions, and in `INFORMAL-PROOF.md`'s
  "Hypotheses consumed" line. The first sentence of the `informal_statement` — the one that is the
  theorem — is fully hypothesized and verified. The `K₂` witness is recorded here so that no later
  reader can mistake the shorthand for a hypothesis-free claim.
- **OBS-3 (a fenced name inside a docstring).** Entry 28's doc-comment quotes `C1-ALLOCATION.md` item
  1(f), which contains the string "`N_2 = 0`". This is a quotation in a comment, not an assertion:
  `N_2` is not defined in the project, appears in no statement, and the declaration's conclusion is
  `leafDegree G s ≠ 2`. `INFORMAL-PROOF.md` §28 itself flags this. Fence intact.

No disputed claim remains between the prover reading and the critic reading. No claim is closed on
prose agreement. No repair was proposed or applied by this seat.

---

## Scope and Fence Check

Audited against the excluded conclusions of the synthesis dispatch and of the formalizer brief §2, as
reproduced in the auditor brief.

1. **"Nothing about `S`"** — satisfied. The aggregate is `C5LA1.aggregate` (`SEMANTIC-CONTRACT.md`
   §1, line 35); it is **not registered**, nor are the `S`-side helpers `C5LA1.H`, `C5LA1.R` and their
   lemmas. No registered statement mentions an aggregate.
2. **"Nothing about `W_III`"** — satisfied; the token does not occur in the source or the proof.
3. **"Nothing about the families (I)/(II)/(III)"** — satisfied; no family construct is defined,
   registered or mentioned in any statement.
4. **"Nothing about (RC)"** — satisfied; `INFORMAL-PROOF.md` §7 additionally disclaims (RC), the
   aggregate, Erdős #993, TREE, FOREST, `E993-BETA-AGG`, the transport and the all-rank aggregate.
5. **"None of these consumes `(★)`"** — satisfied. `hyp-residual` occurs nowhere in the project, and
   the complete hypothesis inventory across all 30 declarations contains nothing of its shape.
6. **Brief §2 repair: state (c) in the sharp form** — satisfied. Entry 17 is hypothesis-free
   (no `IsTree`, no `hyp-alpha`, no inert `¬ IsGraphLeaf G d`); U3's body is **not** carried; the
   carried derivation is `C-U3-T`'s, with `C-U3-F`'s `interior_leafDegree_eq_zero'` recorded as
   corroboration only.
7. **Brief §2 repair: do NOT carry `connected_induce_compl_pair` or its `IsTree` corollary as a DAG
   step** — satisfied. Neither `connected_induce_compl_pair`, nor its helper
   `degree_one_mem_support_eq_endpoint`, nor `C-U3-F`'s corrected `isTree_induce_compl_pair` appears in
   the source or the DAG. No registered declaration needs the corollary, so the conditional permission
   to carry it was correctly not exercised; `C-U3-F`'s correction is preserved in prose in §5.
8. **Brief §2 repair: record (iii) at no hypotheses** — satisfied. Entry 21 is registered with no
   hypotheses, and this seat verified it holds on arbitrary finite graphs (R10), so the repair is
   mathematically warranted and not merely declared.
9. **Brief §2 repair: record (iv′) without `hyp-alpha`** — satisfied. Entries 27 and 30 carry only
   `hTree`, `hLeafCard`, `hDeg2`.
10. **Brief §2: the terminal `theorem` is `R26LA3.leafDegree_two_indepNum_eq_two`, every other
    declaration a `lemma`/`definition`** — satisfied (1 theorem, 20 lemmas, 9 definitions; the theorem
    registered last). The `27 + 30` split is disclosed on the face of `INFORMAL-PROOF.md` §4 as a
    registrar-packaging necessity; the statements are byte-identical, so nothing is weakened and
    nothing is derived twice.
11. **Brief §2: the named content is all present** — satisfied. Item 9 (a)–(f) map to entries 15, 16,
    17, 21+22, 27/30, 25; the critic extensions map to 19, 20, 23, 24, 29; the `P₃` lemma is the
    terminal theorem and `card_C2_eq_zero_of_eligible` is registered as a lemma, both as the brief
    requires.
12. **Brief §2: attribution travels on the award's face** — satisfied, in both `INFORMAL-PROOF.md`
    (dedicated attribution block) and the contract (per-declaration origin fields and
    `formulation_status.evidence`).
13. **Brief R1: single-source project importing only `Mathlib`; C5-LA1 entries byte-identical;
    nothing re-stated** — satisfied. `Main.lean` line 1 is `import Mathlib` and there is no other
    import; the 11 carried C5-LA1 entries are byte-identical with frozen digests reproduced; the only
    definition added to the C5-LA1 layer is `R26LA3.supportSet`.
14. **Brief R1: `support_ne_self` / `sum_card_filter_comm` "as needed"** — correctly not registered;
    no registered declaration depends on either. The informal proof's §5 explanation is accurate: the
    compiled route to (iii) uses `card_eq_sum_card_fiberwise` rather than T3's `sum_card_filter_comm`
    double count.
15. **Brief R4: no `sorry`/`admit`/`native_decide`/`axiom`** — satisfied; none occurs. No `decide`
    over an enumeration stands in for a universal step: every universal step is a genuine proof term
    or an `omega` over explicitly supplied linear facts.
16. **Claim does not overreach in the other direction either.** The conclusion asserts the
    independence-number value only; it does **not** assert the vertex identification `V = {t₁,s,t₂}`,
    exactly as the contract's conclusion note says — confirmed by reading the declaration, whose
    conclusion is the single equation `G.indepNum = 2`.

No fenced conclusion is asserted anywhere in the contract, the Lean source, or `INFORMAL-PROOF.md`.

---

## Verdict

**passed**

`INFORMAL-PROOF.md` (`9493e9c267fb4563bfb7b2bd7c5e8edf890a8d01698cfe6806294e055b061b71`) is a sound,
complete, statement-level informal proof of exactly the claim recorded at
`claim_sha256 03a5e63a93671dc88390a1274d4929e610c8856372d31dd7997f9fca5f4a3e81`, and of every one of
the 30 declarations registered by award group `C1-LA3`. Every definition matches the Lean source
literally; the eleven carried C5-LA1 entries are byte-identical to the frozen award source
`0933211d…`; every carried U3 and critic body reconstructs from its declared origin slice under only
the declared name-scoping transcriptions; the terminal declaration's hypotheses match the claim
one-for-one; nothing marked not a dependency is a dependency; every `ℕ`-subtraction and the single
cast were checked for truncation and are sound; every equality used is an identity, recomputed;
every inequality was verified as an integer statement; every hypothesis the record calls load-bearing
was shown load-bearing by an explicit failure witness outside it; and nothing fenced is asserted.

Three items are recorded as **observations, not defects**: IMP-1, a prose imprecision in
`INFORMAL-PROOF.md` §6 about the uniformity of the axiom report (`closed_reachable` depends on two of
the three permitted axioms, not three — an error in the safe direction that cannot weaken a claim);
OBS-1, the vacuity of the `ℓ = 2` eligible subclass on trees of order ≤ 8 (the conditionals are true
and the eligible class itself is inhabited from order 7; non-vacuity is nowhere claimed); and OBS-2,
the contract's hypothesis-free shorthand for the critic extensions in the descriptive tail of the
`informal_statement` (mirrors the governing synthesis, and every registered declaration carries its
hypotheses explicitly). None of these is a defective step, and none is a softened defect. There is no
defective step to report.

Scope note: this audit is an informal proof-integrity audit only. It makes no kernel-verification
claim and no formalization-fidelity claim; those receipts are separate and remain outstanding under
the controller's assignment.
