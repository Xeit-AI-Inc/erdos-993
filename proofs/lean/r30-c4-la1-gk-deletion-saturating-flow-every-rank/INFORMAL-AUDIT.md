---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c4-la1-formalizer-opus-20260927
critic_id: c4-la1-fable-informal-20260927
attestation_id: c4-la1-informal-pass-20260927
claim_sha256: d0452d6a76ae4913b43803be614e32a5f36913b17e5ad428969b61bb23243877
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** I am operating within VerityOS. Boot reads (brief §0): `verity.md`, `identity/startup-protocol.md`,
`skills/proof-integrity-audit/skill.md`. The host injected the project `CLAUDE.md` and the user auto-memory index into context at
session start. I did not act on either beyond this boot. Conversation logging was not performed, because this governed seat may
write only this file and its scratch (brief §3).

**Seat.** Independent informal proof-integrity reviewer for `C4-LA1`. Canonical run id
`erdos-993-math-dre-20260926-r30-weighted-transport`. Brief `control/C4-STAGE7-INFORMAL-AUDITOR-BRIEF-LA1.md`, SHA-256
`957d77437fa1394c9f0b0a06c00fb287b14371d7974b157b89dc7b4c9cd9abfc`.

**Model disclosure (two-part).** Chartered model, on dispatch-record authority: Claude Opus 5.5, effort high. Model id reported by
my runtime, verbatim: `claude-opus-5-5[1m]`.

**Input bindings (recomputed).**

| Input | Expected | Recomputed |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `4b71b7ca…3e79` | match |
| `INFORMAL-PROOF.md` | `5dea6a4c…bb86` | match |
| `LeanProject/LeanProof/Main.lean` | `66db6c73…a79bf` | match |
| Capsule seal (compact key-sorted JSON of the manifest minus `seal_sha256`) | `c67742f0…ee0a` | match; 484/484 members, byte counts and digests, 0 missing |
| `claim_sha256` (`" ".join(informal_statement.split())`) | `d0452d6a…3877` | match |
| `expected_statement` vs `Main.lean` text from `theorem` to ` :=` | `9f6fc96e…404e` | identical text and hash |
| C1-LA1 `Main.lean` / kernel receipt | `86b59c6c…` / `9e733491…` | match; receipt `source_sha256_before = after` = the `Main.lean` digest; `VERIFICATION-REPORT.json` `formally_verified`, binds the receipt |
| C1-LA2 `Main.lean` / kernel receipt | `7c279f4b…` / `dc1371a0…` | match; same bindings |
| Frozen instruments `C-F2-T/`, `ADJ-F/` vs `sources/c4-stage7-sources/SOURCE-DIGESTS.json` | 49 files | 49/49 match |

## Intended Claim

The claim is exactly the contract's `theorem.informal_statement`. Mathematically:

Let `G_k` be the graph on `Fin (3k+5)` with root `0`, leaf `1` on `0`, support `2` on `0` with leaves `3, 4`, and, for `i < k`,
the arm `0 – (5+3i) – (6+3i) – (7+3i)`. Take natural `k, p` with `k + 3 ≤ p` and any `F ⊆ C5LA1.leafSet (gkGraph k)`. Then the
transport network at rank `p` with tag set `F` has a natural-number flow `f` satisfying `IsSaturatingFlow (gkGraph k) F p f`, whose
support is single deletions only: `0 < f B A → ∃ q ∈ B, A = B.erase q`. The network has sources `I_{p+1}`, targets `I_p`, and supply
and capacity `activeWeight`.

Lean binding: `theorem E993Transport.gk_deletionSaturatingFlow_of_rank_ge (k p : ℕ) (hp : k + 3 ≤ p) (F : Finset (Fin (3*k+5)))
(hF : F ⊆ C5LA1.leafSet (gkGraph k)) : ∃ f, IsSaturatingFlow (gkGraph k) F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q`.

- **Hypotheses.** They match the claim one for one: `hp`, `hF`, and nothing else. There is no `IsTree`, no eligibility, no
  `crossingIndex`, no `indepNum` and no quotient. The instance on `(gkGraph k).Adj` is `gkGraph_decAdj`.
- **Frozen text.** The terminal statement and both companion statements are identical, whitespace-normalised, to the frozen text
  in the synthesis `## Lean awards`. So are `gkEdge` and `gkGraph`.

## Claim Ledger

The ledger is at statement-level granularity. "Enters" names where each hypothesis is consumed. Evidence codes: **R** = my own
recomputation (E0–E3, next section); **L** = I read the Lean declaration against the prose; **H** = I checked it by hand.

| ID | Claim (proof step) | Hypotheses that enter | Evidence | Verdict |
|---|---|---|---|---|
| D1 | `gkEdge`/`gkGraph` is the registered `G_k`: its edges are `{0-1, 0-2, 2-3, 2-4}` ∪ `{0-a_i, a_i-b_i, b_i-c_i : i<k}`, with `n = 3k+5`. Labels `≤ 3k+4`, so there is no wrap. `fromRel` symmetrises and makes the relation irreflexive (Mathlib `fromRel_adj`, read: `v ≠ w ∧ (r v w ∨ r w v)`). | — | L, H, R(E0: the Lean predicate transliterated equals the registered edge list for k=0..5; a tree; degree sequences; α = 2k+3) | verified |
| D2 | `gkGraph_decAdj` is a genuine decidable instance, with no choice. It is `decidable_of_iff` over a finite disjunction of `Nat` equalities and a bounded `∃ i < k`. | — | L; `axioms-all-declarations.txt`: `[propext, Quot.sound]` | verified |
| D3 | The definitions of record (C1-LA1 1–21) are carried byte-identically, so `indepFamily`, `support`, `leafSet`, `tagWitnesses`, `activeWeight`, `transportRel`, `IsSaturatingFlow` and `WeightedHall` mean what the claim says. | — | R: byte comparison against the origin `Snippets/` (next section) | verified |
| N2a | `leafSet(G_k) ⊆ {1, 3, 4, c_i}`, with equality: `0` (neighbours `1, 2`), `2`, `a_j` and `b_j` each have two distinct neighbours. | `hF` (every tag is one of the four shapes) | L (`gk_leaf_cases`), R(E0) | verified |
| N2b | Supports and witnesses: `s_1 = 0`, `W_1 = {2, a_j}`; `s_3 = s_4 = 2`, `W_3 = {0,4}`, `W_4 = {0,3}`; `s_{c_i} = b_i`, `W_{c_i} = {a_i}`. Activity: `c_i` active iff `a_i ∈ B`; `3` (resp. `4`) active iff `4 ∈ B` (resp. `3 ∈ B`), given `0 ∉ B`; `1` active iff `B` meets `W_1`. Support uniqueness comes from the carried private helper `support_unique` (entry 45 fragment). | leaf property from `hF`; `0 ∉ B` for 3/4 | L (`gk_active_*_iff`, `not_disjoint_erase_tagWitnesses_iff`), H, R(E0) | verified |
| N3 | Root exclusion. If `B` is independent and `0 ∈ B`, then `B` contains none of `1, 2, a_j`, at most `{3,4}` from the cherry, and at most one vertex per arm. So `|B| ≤ k+3 < k+4 ≤ p+1`, and every source avoids `0`. | `hp` | L (`gk_root_notMem`), H, R(E0: the largest independent set containing `0` has size exactly `k+3`, k=0..5) | verified |
| N4 | Tag slice by block freezing. For a τ-active source `B` with `0 ∉ B`, the tag's own block restricted to `B` equals its fixed value. For `c_i` this is `{a_i, c_i}`: `τ ∈ B`, activity gives `a_i`, and independence excludes `b_i`. For `3`/`4` it is `{3,4}`. For `1` it is `{1}`. Every free block restriction is independent in that block. Freezing is the product with a one-point chain at the constant rank offset `rk = 2|s|`. This is the same statement as the slice equivalence onto `K_1 ⊔ kP_3` / `(k+1)P_3`. | N3, N2b, `hF` | L (`chainValid_gkTagFactors`), H, R(E3: every τ-active source lies in its slice product) | verified |
| N5a | Block chains: `K_1`: `∅<{v}`. Path `x–y–z`: `∅<{x}<{x,z}`, `{y}`, `{z}`, with cherry `(3,2,4)` and arms `(a_j,b_j,c_j)`. Frozen: one point. `code`, `drop` and `rk` are as stated. Per-block identity: `2·|B∩block| + m = rk + 2t`. | — | L (`code`, `drop`, `rk`, `two_mul_card_add_len_eq`), H (all 5 path states and both single states) | verified |
| N5b | Two-chain split. `L_i = {(s,i): s ≤ ℓ−i} ∪ {(ℓ−i,t'): i<t'≤m}`. `(S,t)` lies in `L_t` if `t ≤ u'`, giving `(d,u) = (d', u'−t+(m−t))`; otherwise it lies in `L_{ℓ−S}`, giving `(d,u) = (d'+t−u', m−t)`. The predecessor moves in the tail or the head accordingly. | — | H (derivation), L (`chainDownUp`, `chainDownVertex`), R(E2: the Lean recursion agrees with explicitly built chains on all 72,264 product elements, k=0..5, every tag) | verified |
| N5c | Symmetry: `2·|B ∩ blocks| + u = R + d`. So every chain runs from rank `r` to rank `R − r`. | — | L (`two_mul_chainSize_add_up_eq`), R(E2: identity and chain symmetry on every element) | verified |
| N5d | `d > 0` iff a predecessor exists. The predecessor is `B ∖ {q}` with `q ∈ B`, lying in a block of positive position. It stays valid and has `(d−1, u+1)`. | — | L, R(E2) | verified |
| N5e | A step never touches a block at position 0. In particular it never touches a frozen block. | — | L (`notMem_verts_of_chainDownVertex`), R(E3: frozen blocks untouched in every image) | verified |
| N5f | The predecessor map is injective. Tail/tail follows by induction. Head/head has equal drop vertices. The mixed case is impossible: `t₁ ≤ u'₁` and `t₁+1 > u'₁+1` contradict. | — | H, L (`eq_of_chainDownVertex_erase_eq`), R(E2: partition into disjoint chains; E3: per-tag injectivity) | verified |
| N5g | Top of box implies top of chain: if every block is at its chain top, then `u = 0`. | — | H (`(m,n)` is the top of `L_0`), L, R(E2) | verified |
| N5h | Level condition (R2′). The exact `R` is `2k+5` for tags `c_i, 3, 4` and `2k+4` for tag `1`. With `|B| = p+1 ≥ k+4` and `0 ∉ B`, `R + d = 2(p+1) + u` gives `d ≥ 2k+8 − (2k+5) = 3 > 0` at every `p ≥ k+3`. So every τ-active source lies strictly above its centre: the free part has size `≥ k+2 > k+½`, or `≥ k+3 > k+1` for tag `1`. | `hp`, N3 | H, L (`exists_chainDownVertex_gkTagFactors`, additive form closed by `omega`), R(E2: exact `R` values k=0..5; E3: minimum `d = 3` at `p = k+3`, `5` at `k+4`, `7` at `k+5`) | verified |
| N5i | τ stays active. For `c_i`, `3` and `4`, the tag and its witness lie in the frozen block. For `1`: a `W_1`-avoiding image `B'` of size `p` has `|B'| ≤ 1+2+k`. That forces `p = k+3` and every block at its top (cherry `{3,4}`; arms `{b_j}` or `{c_j}`), so `u(B') = 0`, which contradicts `u(B') = u(B)+1 ≥ 1`. For `p ≥ k+4` the size bound alone excludes avoidance. | `hp`, N3, N5d, N5g | H, L (`gk_one_blocks_top_of_avoid`, `gk_one_active_after_down`, `gkTagDown_erase_keeps_tag_active`), R(E3: τ active in every image; `q ≠ τ`) | verified |
| N5j | `φ_τ = gkTagDown k τ` is injective on τ-active `(p+1)`-sources. | N5f, N4 | L (`gkTagDown_injOn`), R(E3) | verified |
| N1 | Take per-tag injective single-deletion maps that keep `τ` active, and set `f(B,A) = #{τ ∈ F ∩ B active : φ_τ(B) = A}` on `I_{p+1}`, and `0` elsewhere. Support: `B ∈ I_{p+1}` and `A = B∖{q} ∈ I_p`, a (D) arc, so the first disjunct of `transportRel` holds. Row sum: by fibres, it equals `activeWeight F B` exactly. Column sum: `Σ_τ #{B : …} ≤ Σ_{τ ∈ F} [τ active in A] = activeWeight F A`, since each inner count is `≤ 1` by injectivity and `0` unless `τ` is active in `A`. | any graph, any `F` | H, L (`saturatingFlow_of_perTag_deletionInjections`), R(E3: all four clauses checked literally) | verified |
| N6 | Assembly: N1 with `φ = gkTagDown k`, and each `τ ∈ F` a leaf by `hF`. The terminal theorem's proof is exactly `gk_exists_deletionSupported_saturatingFlow k p hp F hF`, a lemma with an identical statement. That is registrar ordering, not a gap. | `hp`, `hF` | L | verified |
| C1 | Companion `gk_weightedHall_of_rank_ge` is the carried C1-LA2 `weightedHall_of_saturatingFlow` applied to the N6 flow. It is a scope note with no grade. | `hp`, `hF` | L | verified (companion; no grade asserted) |
| C2 | Companion `gk_aggregate_nonpos_of_rank_ge` uses `F = favorableLeaves ⊆ leafSet` (`Finset.filter_subset`, instance-independent), `1 ≤ p` from `hp`, and the carried C1-LA2 FLOW⇒SIGN. | `hp` | L; R(E1: literal `S < 0` at every non-vacuous row, and `S = supply − capacity`) | verified (companion; no grade asserted) |
| V1 | Vacuous ranges. At `k = 0`, `α(G_0) = 3 < p+1`, so there are no sources and `f = 0` saturates. The same holds whenever `p+1 > 2k+3`. The general argument covers both without a special case. | — | H, R(E1/E3: k=0 at p=3,4,5; k=1 at p=5,6; k=2 at p=7) | verified |
| A1 | ℕ audit: no subtraction in the statement. Every subtraction in the new declarations is guarded. In `chainDownUp`: `u'−t` (`t ≤ u'`), `m−t` (`t ≤ m`, from `code_fst_le_snd`), `(d'+t)−u'` (`t > u'`). Elsewhere: `(code).1−1` and `d−1` (positivity), `gkArmIndex`'s `(τ−7)/3` (`7 ≤ τ`), `7−τ` with `τ ∈ {3,4}`, and the proof-internal `(v−5)/3` (after excluding labels 0–4). The aggregate's `p−1` has `1 ≤ p`. The level form `2(p+1)+u−R` is a derived identity; in Lean it is additive, closed by `omega`. | — | L (every `-` in entries 22–44 and 55–113 enumerated), R(E2: `nsub` never truncates) | verified (see note N-2) |
| A2 | Classical logic enters only through the carried definitions and Mathlib. The only in-run `classical` is in C2. No new fragment has `open scoped Classical`: all 17 occurrences are in carried entries or their comments. There is no `sorry`, `admit`, `native_decide`, `decide`, `axiom`, `opaque`, `extern` or `implemented_by` in the source. | — | L (token scan of `Main.lean` with comments stripped) | verified |

Result: 24 ledger items; 24 verified; 0 escalated.

## Reproduced Mathematical Evidence

I wrote my own evaluator; no prior evaluator was imported:
`scratchpad/c4-s7-informal-LA1/audit_eval.py`, SHA-256 `01225803e1591b5fc07d18f5bdbda1eefe1e8398481a551ac2f4c8b6cc3afb62`.

- **Imports.** Standard library only: `sys`, `json`, `hashlib`, `itertools`, `collections.deque`.
- **Output.** `audit_eval_out.json`, SHA-256 `8a92fa0e722103bf2e8aabbbafde65b4ffef985da8b451c6cda91f95bf0341ee`. It has no wall-clock
  fields. A rerun produced a byte-identical file.
- **Log.** `audit_eval.log`, SHA-256 `7f44328039c10f29b048fc43014e25b24cf49f938393eef081c624f786bedfa7`.
- **Method.** All arithmetic is exact integer arithmetic on bitmasks, with an exact Dinic max-flow.

**E0 — the graph** (k = 0..5). I transliterated the Lean `gkEdge` together with `fromRel` into a predicate. Its adjacency equals the
registered edge list at every `k`. Across k = 0..5:

- `n = 3k+5`, and the graph is a tree.
- The leaf set is exactly `{1,3,4,c_i}`, and the supports and `tagWitnesses` are as stated in N2b.
- `α = 2k+3`.
- The largest independent set containing `0` has size exactly `k+3`.

**E1 — literal networks and exact deletion-only max-flow.** Rows: `p = k+3, k+4, k+5` for `k = 0..4`, and `p = 8` at `k = 5`.

- **Tag sets.** Every `F ⊆ leafSet` was tested at `k ≤ 4`: 8, 16, 32, 64 and 128 sets. This exceeds the brief's `k ≤ 3`. At
  `k = 5` I tested the full leaf set.
- **Result.** Max-flow equals supply at every one of the 745 (row, `F`) instances: 0 failures.
- **WID.** `supply − capacity = S` holds at `F = F_p` on all 16 rows. `S` is computed from the literal aggregate definition
  (`i_j(G−H_v)`, `i_j(G−R_v)`, with `F_p` derived). It is independent of the network sums.

| k | p | sources | targets | supply | capacity | S | max-flow (D) |
|---|---|---|---|---|---|---|---|
| 1 | 4 | 1 | 9 | 4 | 20 | −16 | 4 |
| 2 | 5 | 10 | 43 | 37 | 102 | −65 | 37 |
| 2 | 6 | 1 | 10 | 5 | 37 | −32 | 5 |
| 3 | 6 | 70 | 210 | 253 | 527 | −274 | 253 |
| 3 | 7 | 13 | 70 | 62 | 253 | −191 | 62 |
| 3 | 8 | 1 | 13 | 6 | 62 | −56 | 6 |
| 4 | 7 | 425 | 1031 | 1542 | 2735 | −1193 | 1542 |
| 4 | 8 | 110 | 425 | 515 | 1542 | −1027 | 515 |
| 4 | 9 | 16 | 110 | 93 | 515 | −422 | 93 |
| 5 | 8 | 2400 | 5060 | 8875 | 14196 | −5321 | 8875 |

Vacuous rows (no sources) are k=0 at p=3,4,5; k=1 at p=5,6; and k=2 at p=7. Each has supply 0, and the zero flow saturates.

**Comparison with `CF-REPLAY-c4c.json`.** Equal at all three fixed points: 253/527/−274 (k=3), 1542/2735/−1193 (k=4) and
8875/14196/−5321 (k=5). The source and target counts (70/210, 425/1031, 2400/5060) also match. As seat checks only, the frozen
outputs `C-F2-T/scd_flow_out.json` and `ADJ-F/ct1_allranks_out.json` agree with my rows where they overlap. I read their outputs,
never their code.

**E2 — the construction itself.** For every tag shape at k = 0..5, I built the symmetric chain decomposition explicitly. I iterated
the two-chain split `L_i` exactly as step (3) of the proof describes: head = first block, tail = product of the rest, with the tag's
block frozen. The following checks hold on every element:

- The chains partition the slice product: element counts are `2·5^k` / `5^{k+1}`, and each element occurs once.
- Every chain is saturated: each step adds one vertex.
- Every chain is symmetric: bottom rank plus top rank equals `R`.
- `R` equals `2k+5` for `c_i, 3, 4` and `2k+4` for `1`.
- My transliteration of the Lean `chainDownUp`/`chainDownVertex` returns the explicit chain's `(position, steps up)` and the exact
  predecessor vertex, on all 72,264 elements.
- `2·|B| + u = R + d` holds, and top-of-box gives `u = 0`.
- None of the guarded ℕ subtractions truncates.

**E3 — per-tag injections and the flow, arc by arc.** I checked `k ≤ 4` at `p = k+3, k+4` as the brief requires, and also at
`p = k+5` and at `(5, 8)`. For every tag and every τ-active source:

- The source avoids `0` and lies in its slice.
- It has a predecessor, and the image is `B ∖ {q}` with `q ∈ B` and `q ≠ τ`.
- The image lies in `I_p`, and `τ` is active in it.
- The frozen block is untouched, and the Lean `chainDownVertex` names the same `q`.
- `φ_τ` is injective.

The minimum `d` is 3 at `p = k+3`. In total, 11,392 (source, tag) units were checked. I then built
`f(B,A) = #{τ ∈ F active in B : φ_τ(B) = A}` for every `F ⊆ leafSet` (`k ≤ 4`) and for the full set at `k = 5`: 745 flows. For each,
I checked literally the three clauses of `IsSaturatingFlow` and the support conjunct: positivity only on
`I_{p+1} × I_p × transportRel`, single deletion, rows equal to `activeWeight` exactly, and columns `≤ activeWeight`. All pass. At
the full leaf set, the units sent equal the supply: 4, 37, 5, 253, 62, 6, 1542, 515, 93, 8875.

**Negative controls.** They show the checks can fail:

- At `p = k+2` (k=3), root-containing active sources exist, so `hp` is load-bearing.
- A single-deletion map that is not injective (delete the least non-tag vertex) is detected by the column check.
- A non-symmetric `P_3` decomposition, `[∅<{y}], [{x}<{x,z}], [{z}]`, fails the symmetry check.

**Carry check (byte-for-byte, keyed by origin award).**

- **C1-LA1 1–21.** Run entries 1–21 are byte-identical to C1-LA1 entries 1–21.
- **C1-LA1 22.** Run entry 45 is byte-identical to C1-LA1 entry 22. It is the extra carry the formalizer disclosed.
- **C1-LA1 23–28.** Run entries 46–51 are byte-identical to C1-LA1 entries 23–28.
- **C1-LA1 36.** Run entry 52 is C1-LA1 entry 36. The unified diff is a single line, `theorem` → `lemma`; the origin digest is
  `939231f2…`.
- **C1-LA2 29 and 33.** Run entries 53 and 54 are byte-identical to C1-LA2 entries 29 and 33.
- **Origin state files.** Every origin fragment digest equals its award's `FORMALIZATION-STATE.json` `source_sha256`: 36/36 for
  C1-LA1 and 35/35 for C1-LA2.
- **Run self-consistency.** All 113 `Main.lean` entry bodies equal this run's `Snippets/` and their header digests. The entries are
  44 definitions, 68 lemmas and exactly 1 theorem.

## Independent Critic Pass

I ran a separate adversarial pass over the unchanged ledger, attacking the highest-risk steps first.

1. **Centre arithmetic at every rank (R2′).**
   - *Attack:* at large `p` the free part may lie below the centre.
   - *Finding:* no. `d = 2(p+1)+u−R` grows with `p`, and `R` does not depend on `p`, so the bound only improves. Sources vanish past
     `α`.
   - *Holds:* symbolically, and in E3 (`d_min` = 3, 5, 7 at `p = k+3, k+4, k+5`).
2. **Tag `3`/`4` activity through the witness `0`.**
   - *Attack:* activity could be witnessed by `0`, and then `B ∩ cherry ≠ {3,4}`.
   - *Finding:* N3 excludes `0` from every source. Independence excludes `2`.
   - *Holds.*
3. **Tag `1` after deletion.**
   - *Attack:* at `p = k+3`, the deleted vertex could be the last `W_1` element.
   - *Finding:* the box-top argument settles it. The literal count of `W_1`-avoiding images is 0 at every row.
   - *Holds.*
4. **The mixed case of injectivity.**
   - *Finding:* the positional contradiction (N5f) is correct. The explicit chains are disjoint.
   - *Holds.*
5. **Why the column bound needs both injectivity and activity preservation.**
   - *Finding:* the negative control confirms that the column clause fails without injectivity.
   - *Holds.* N1 uses both hypotheses exactly where the prose says.
6. **Does block-freezing change the set denoted?**
   - *Finding:* for a τ-active source, the frozen value is forced (N4), and the image keeps it (N5e). The slice is the same set as
     under the type equivalence.
   - *Holds.*
7. **Statement fidelity.**
   - *Findings:* the hypotheses match one for one. `hF` is `⊆ C5LA1.leafSet`, and any such `F` is allowed; that is stronger than
     `F_p`, which the companion instantiates. The support conjunct is exactly `∃ q ∈ B, A = B.erase q`. The terminal theorem's
     proof is the identically stated N6 lemma, as the report says.
   - *Holds.*
8. **Hidden dependencies.**
   - *Finding:* the terminal theorem's cone reaches carried entry 45 only through the private `support_unique`. That lemma is the
     `Classical.choose_spec` property of `C5LA1.support`; the proof and the report both disclose it. The high-tail lemma
     `highTailAggregateFromShadow`, with its `indepNum` hypothesis, is not in the cone. Nothing asserts `indepNum`, `IsTree`,
     eligibility or `crossingIndex` about `G_k`: a `grep` over new code finds none.
   - *Holds.*
9. **ℕ truncation.**
   - *Finding:* each subtraction's guard is checked in the ledger (A1). E2's truncation assertions never fired.
   - *Holds.*
10. **Decidability.**
    - *Finding:* `fromRel_adj` is `Iff.rfl` in the pinned Mathlib. The instance adds no choice.
    - *Holds.*

The critic pass reopened no ledger item.

**Notes.** These are not defects of the mathematics.

- **N-1.** `INFORMAL-PROOF.md` calls N4's block-freezing "the recorded alternative permitted by the synthesis for N4". The
  synthesis's alternative clause is worded for N5's chain decomposition. The auditor brief nonetheless treats block-freezing as
  the formalizer's permitted alternative. It is mathematically the same slice: a product with a one-point chain at constant rank
  offset `2|s|`. The wording overstates the provenance of the permission; the proof is unaffected.
- **N-2.** The ℕ audit says subtraction occurs "only in the chain bookkeeping (`chainDownUp`)". As an inventory this is
  incomplete. It omits the guarded label arithmetic in `gkArmIndex` and `gk_active_cherry_iff`, the proof-internal `(v−5)/3`, and
  the positivity-guarded `−1` forms. Every instance is guarded and none enters the statement (A1). The claim is imprecise but true
  under a charitable reading.
- **N-3.** Formally, the terminal theorem depends on the private `support_unique` inside carried entry 45 (C1-LA1 22). This is
  disclosed and mathematically trivial.

**The formalizer's disclosed deviations (brief §2.5).** I judged whether any affects the mathematics:

- **Extra carried entry 22.** Byte-identical, and it contributes only the support helpers. **None.**
- **`@[reducible, instance] def`.** Plumbing, and it is what `instance` elaborates to. **None.**
- **Terminal theorem calls the identical N6 lemma.** A registrar-order artefact. **None.**
- **N4 block-freezing.** Same statement (see N-1). **None.**
- **`k = 0` quantification.** True, and vacuous for every `p ≥ 3` (V1). **None.**

## Scope and Fence Check

**What the claim asserts.** The claim asserts only the existence of a deletion-supported saturating ℕ-flow on the explicit family
`G_k`, for `p ≥ k+3` and `F ⊆ leafSet`. Checked against the excluded conclusions of the synthesis's C4-LA1 and of brief §2:

- **One explicit family only.** Yes.
- **(HALL) at any other scope.** Not asserted. The Hall statement is a companion, on `G_k` only, with no grade. EST-3 stays an
  informal composition at `proved_informal`.
- **`IsTree`, eligibility, `crossingIndex`, `indepNum`.** None appears in the statement. None is asserted in `INFORMAL-PROOF.md`,
  which lists them as not consumed. The only `indepNum` in `Main.lean` is inside the carried entry-45 lemma's own hypothesis, which
  is outside the terminal theorem's cone.
- **"Every eligible rank of `G_k`".** Not claimed. The proof and the contract both say it needs `x(G_k) ≥ k+1`, which is open.
- **Primary aggregate beyond `G_k`; RTree; switch arcs elsewhere.** None is asserted.
- **Refuted keys.** The claim is not `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`: a per-tag injective set map on one family
  is a matching, not linear injectivity of `d_p`. It is not `E993-R23-LITERAL-DELETE-ONLY-HALL`: it is weighted, at fixed `F`, on
  one family. It is not C6-F4 and not R19. The face states all of these.
- **GK-SIGN.** Not formally verified. The companion gives `S ≤ 0`, which is weaker than GK-SIGN's strict bound at `p = k+3`.
- **Attribution on the face.** Both `INFORMAL-PROOF.md § Attribution` and the contract's scope text carry the full attribution:
  - CT-1 to critic `C-F2-T` (Claude Opus 5.5).
  - R2′ to the r30 Cycle 4 F adjudicator (Claude Opus 5.5).
  - The definitions to r30 C1-LA1 (transport definitions and WID), r30 C1-LA2 (FLOW⇒SIGN) and the first-interior run (entries
    1–13).
  - The mechanism (the network, the active-tag weight and (HALL)) to Codex GPT-6.
  - The `G_k` family to r30 Cycles 2–3.

  The per-declaration Lean headers repeat the CT-1 and R2′ credits.
- **Repairs on the face.** `C-F2-T`'s `x = k+1` is not used; nothing in the proof depends on `x`. The F draft's instance comment
  is now an authored instance.

## Verdict

passed

**Basis.** `INFORMAL-PROOF.md` is a complete and correct statement-level proof of the contract's `informal_statement`. Every
ledger step is verified by derivation, by line-by-line reading of the matching Lean declaration, and by independent exact
recomputation, including the construction itself, arc by arc. There is no defective step. Notes N-1 to N-3 are not mathematical
defects. The pass carries no grade for either companion.

**Model disclosure.** Chartered Claude Opus 5.5 (effort high), on dispatch-record authority. Runtime-reported model id, verbatim:
`claude-opus-5-5[1m]`.

**Read-boundary deviations (disclosed).**

1. **Scratchpad listing.** An early `ls` of `scratchpad/` printed the names of other seats' scratch directories (e.g. `c1-F1`,
   `c1-T1`). I printed names only; I opened no file in them.
2. **Capsule hashing.** To recompute the seal, I hashed all 484 capsule members, including members outside my read list:
   `sources/lower-region/*`, `sources/first-interior/*`, `sources/r29/*`, the C3-LA1 run files and
   `scratchpad/c3-s7-informal-LA1/INFORMAL-AUDIT.md`. I hashed them; I did not read them.
3. **Other seats' directory names.** A top-level `ls` of `sources/c4-stage7-sources/` printed the names of the other seats'
   instrument directories. I opened only `C-F2-T/` and `ADJ-F/` content, and there only two output JSONs, for the seat
   comparison. I read no instrument code.
4. **Out-of-list synthesis snippets.** A heading and keyword `grep` over `SYNTHESIS.md` displayed single matching lines from
   sections outside my list: `## Reconciliation`, `## Refuted or narrowed mechanisms`, `## Headline verdicts`, the SR-C4-1 row,
   `## Registrations`. A `sed` range also showed the first lines of EST-4. None was used as evidence.
5. **Skill modules not loaded.** I did not load the modules the skill lists under "Load First" (`modules/project-regimes/…`,
   `modules/integrity/…`). I did not create the skill's `LEDGER.csv`/`ESCALATIONS.md`/`LOOP-STATE.md`. The reason: the brief
   authorizes only three boot files and a single output file. The ledger is embedded above.
6. **Mathlib.** I read one Mathlib passage, `SimpleGraph.fromRel` / `fromRel_adj` in `Mathlib/Combinatorics/SimpleGraph/Basic.lean`,
   with the `grep` inside the Mathlib package directory. This is within the brief.
7. **Not read.** F2's `RETURN.md`, the `C-F2-U` critique, `cf_replay_c4c.py`, and this run's `DRAFTS/`, `SOURCE/`, `RECEIPTS/`,
   `FORMALIZATION-STATE.json` and `EVIDENCE/fidelity-audit-input.json`.
8. **Hygiene.** No network, no package install, no `lake`/`elan`, no `find`. Every Python invocation used `python3 -B`. I wrote
   nothing outside `scratchpad/c4-s7-informal-LA1/` and nothing under `/tmp`.
