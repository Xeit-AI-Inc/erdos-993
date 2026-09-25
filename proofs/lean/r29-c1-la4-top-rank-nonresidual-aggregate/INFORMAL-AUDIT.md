---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la4-formalizer-opus-20260925
critic_id: c1-la4-fable-informal-20260925
attestation_id: c1-la4-informal-pass-20260925
claim_sha256: 913a944c56b690d5b84e2385577cac7da173de15e60b9332edb5f5de9dd385f9
---

**Boot acknowledgment.** I am operating within VerityOS. For this audit I read `verity.md`,
`identity/startup-protocol.md` and `skills/proof-integrity-audit/skill.md`. Subsystems loaded: the constitution, the
identity startup protocol, and the proof-integrity-audit skill. I loaded no memory, logs, decisions or modules. The
harness injected the root `CLAUDE.md` and a user-memory index into context, and I did not act on them. I kept no
conversation log, because the brief allows writes only under `scratchpad/c1-s7-informal-LA4/`.

**Model disclosure (two parts).** The chartered model is **Claude Opus 5.5**, effort high, on dispatch-record authority
(`control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA4.md`). The model id my runtime reports, verbatim, is
**`claude-opus-5-5[1m]`**. I delegated nothing.

**Role.** I am the independent informal proof-integrity auditor for award C1-LA4 (critic id
`c1-la4-fable-informal-20260925`). I did not produce the artifact. I edited nothing in the Lean run, never invoked
`lake` or `lean`, and built nothing.

**Read boundary.** I read only the following:
- in the Lean run: `THEOREM-CONTRACT.yaml`, `INFORMAL-PROOF.md`, `CAPSULE-VERIFICATION.json`,
  `EVIDENCE/THEOREM-CONTRACT.md`, `EVIDENCE/axioms.txt`, `EVIDENCE/axioms-all-declarations.txt`, `FORMALIZER-REPORT.md`,
  `LeanProject/LeanProof/Main.lean` and `LeanProject/LeanProof/Snippets/*`;
- the capsule manifest, whose members I verified by digest;
- in `SYNTHESIS.md`: `## Lean awards`, `## Exact established results`, and rulings 5–15 of `## Reconciliation`;
- the T2 return, §1–§3;
- critiques C-T2-F and C-T2-U, their re-derivation and attack sections;
- the U adjudicator's `## Lean readiness` (the LA4 lines);
- the formalizer brief, `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`;
- the frozen first-interior `Main.lean`, `Snippets/` and `FORMALIZATION-STATE.json`;
- `sources/c1-stage7-sources/` (to compute digests and compare the LA4b declaration blocks);
- the pinned Mathlib files (`Acyclic.lean`, `Bipartite.lean`, `Clique.lean`, `Data/Fintype/Defs.lean`,
  `Enumerative/DoubleCounting.lean`, and the `Finset` lemmas used).

One disclosure. Besides the two synthesis sections the brief names, I read part of `## Reconciliation` (rulings 5–15:
LA4 carry, the `IsTree` routing, the low-`α` step, and `α = 4`), because the dispatch text cites those rulings. I did
not read the r26 source. I relied on the r26 signature that `SEMANTIC-CONTRACT.md` §1 records.

# Informal Proof Integrity Audit

## Intended Claim

The intended claim is the contract's `theorem.informal_statement`:

> For every finite ordinary tree T with alpha = alpha(T), x = x(T) and integer rank p = alpha - 1: if x + 2 <= p, then
> S(T, p) = sum over original leaves v with Delta_p(T - v) < 0 of [Delta_(p-1)(T - {v, s_v}) - Delta_(p-1)(T - N_T[s_v])]
> <= 0. Key E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE (TRN), award C1-LA4 of r29 (canonical run id
> erdos-993-math-dre-20260925-r29-high-tail-certification).

**Claim hash, recomputed.** `sha256(" ".join(s.split()))` =
`913a944c56b690d5b84e2385577cac7da173de15e60b9332edb5f5de9dd385f9`. This **equals** the value the brief states.

**Digests, recomputed.**

| File | SHA-256 | Result |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `beb1d60b…cad8e` | matches |
| `INFORMAL-PROOF.md` | `46549307…8715c` | matches |
| `Main.lean` | `0c803739…24330b` | matches |

**Capsule.** The seal recomputes to `d1cd2b85…442a65` (compact key-sorted JSON, without `seal_sha256`), which matches.
All 86 members match in both bytes and SHA-256.

**Terminal statement.** `lean_binding.expected_statement` (SHA-256 `b21887c0…0e44e`) matches the synthesis `### C1-LA4`
Lean block byte for byte. It also occurs verbatim in `SOLUTION-CONTRACT.md` §2 and in `Main.lean`, followed by ` :=`.

## Claim Ledger

Notation: `n = |V|`, `α = indepNum`, `x = crossingIndex`, `p = α ∸ 1`, `k = p ∸ 1`, `a = α − 1`.
`q_j = |taggedFamily G (univ ∖ H_v) R_v j|`. Verdict key: **V** = verified with reproduced evidence; **V-lit** = verified
by literal source comparison.

### Definitions

| # | Item | Check | Verdict |
|---|---|---|---|
| D1 | Entries 1–14 and 18: `vertexDeletionIndepSetCount`, `vertexDeletionForwardDifference`, `IsFavorableAt`, `IsGraphLeaf`, `support`, `leafSet`, `leafDegree`, `H`, `R`, `indepSetsAvoiding`, `indepSetCount`, `forwardDifferenceDel`, `aggregate`, `crossingIndex`, `taggedFamily` | For all 18 carried registrar entries (the 15 definitions plus lemmas 41, 42 and 44), the block body in the run's `Main.lean` equals four things byte for byte: the run's snippet, the frozen first-interior `Snippets/NNNN-*.fragment`, the frozen first-interior `Main.lean` block, and the frozen `FORMALIZATION-STATE.json` `source_sha256`. That makes 18/18 matches. Each contract definition description contains its fragment text verbatim (15/15). Outside the entry blocks, `Main.lean` holds only `import Mathlib` and the generator comment. There is no re-typed definition of record. | V-lit |
| D2 | Meaning of the definitions against the informal statement | `Δ_p(T − v)` is the `univ.erase v` count. `H_v = {v, s_v}` and `R_v = insert s_v (neighborFinset s_v) = N[s_v]`. The selector is strict at the original rank `p`. There is one summand per original leaf. `x` is `Nat.find` of `Δ_k(G) < 0` with `D = ∅`. All of these match the prose of `SEMANTIC-CONTRACT.md` §1 and the claim. | V-lit |
| D3 | Mathlib meanings | Each was read in the pinned tree: `IsTree` extends `connected` with the field `isAcyclic` (`Acyclic.lean:60–63`); `IsAcyclic.isBipartite` (`:617`) is `⟨hG.coloringTwo⟩`, where `coloringTwo` picks a vertex of each connected component (`nonempty_supp`) and needs no `Nonempty V`; `IsBipartite := Colorable 2` (`Bipartite.lean:286`); `indepNum` (`Clique.lean:983`); `exists_isNIndepSet_indepNum`; `IsIndepSet.card_le_indepNum`; `Finset.card_nsmul_le_card_nsmul` (`DoubleCounting.lean:98`, the double count over `bipartiteAbove`/`bipartiteBelow`). The line citations in the contract and the proof are correct. | V-lit |

### Step A (new lemmas, any graph)

| # | Item | Check | Verdict |
|---|---|---|---|
| A1 | `i_0(G − D) = 1` | The empty set is the unique 0-subset and it is independent. Brute force: every labelled graph of order ≤ 5 and every `D`. | V |
| A2 | `i_1(G − D) = \|univ ∖ D\|` | A singleton is always independent (no loops). Same brute-force grid. | V |
| A3 | `Δ_0(G − D) = n − \|D\| − 1` in ℤ | The only ℕ subtraction, `n − \|D\|`, is cast by `Nat.cast_sub` under `\|D\| ≤ n`, so there is no truncation. Same grid, 0 failures. | V |
| A4 | `α ≤ n` | A maximum independent set is a subset of `V`. 0 failures on 33,867 labelled graphs of orders 1–6. | V |
| A5 | `Δ_x(G) < 0` | `Nat.find_spec`. The existence witness `k = α` gives `Δ_α = −i_α < 0` (entry 14). | V |

### Step B (S7, `topRankEligibleAlphaGeFour`; consumes only `hEligible`)

| # | Item | Check | Verdict |
|---|---|---|---|
| B1 | `hEligible` with `α ≤ 3` forces `α = 3` and `x = 0` | An exact scan of `α ≤ 3`, `x < 50` finds the unique solution `(3, 0)`. For `α ≤ 2`, `α ∸ 1 ≤ 1 < 2`. | V |
| B2 | `α = 3` gives a contradiction | `Δ_0 = n − 1 ≥ α − 1 = 2` (A3, A4) contradicts A5. So `α ≥ 4`. It uses no tree, bipartite or connectivity hypothesis. | V |
| B3 | S7 is sharp on general graphs (observation; the proof claims only `α ≥ 4`) | `K_3 ∨ 4K_1` has `i = (1,7,6,4,1)`, `α = 4` and `x = 1`, so it is eligible. The bound is attained off trees. On trees the minimum eligible `α` is 5 (companion S8, which is not claimed here). | V |

### Step C (terminal step)

| # | Item | Check | Verdict |
|---|---|---|---|
| C1 | From `α ≥ 4`: `p = α − 1 ≥ 3 ≥ 2` and `2α + 1 ≤ 3p` | Exact grid over `α ≤ 4999`: `2α + 1 ≤ 3(α ∸ 1) ⟺ α ≥ 4`, 0 failures. For `α ≥ 4`, both `hp` and `hTail` hold and the inner `p ∸ 1 = α − 2`, 0 failures. | V |
| C2 | Bipartiteness from `hT` | The term is `hT.isAcyclic.isBipartite`. `hT` occurs in the terminal's proof exactly once, and in no other declaration. Connectivity is not consumed. | V-lit |
| C3 | Apply entry 44 at `p = α ∸ 1` | Entry 44's hypotheses are exactly `hBip`, `2 ≤ p` and `2α + 1 ≤ 3p`, and it concludes `aggregate G p ≤ 0` with `p` the same ℕ expression as the terminal's rank. | V-lit |

### Step D (carried chain, audited as mathematics)

| # | Item | Check | Verdict |
|---|---|---|---|
| D-42a | `H_v ⊆ R_v` for a leaf | `s ∈ N[s]`, and `v ∈ N(s)` because `v ~ s`. | V |
| D-42b | `tagged_count_split`: for `D ⊆ E`, `i_j(G − D) = \|tagged(univ ∖ D, E, j)\| + i_j(G − E)` | A disjoint split of the sets avoiding `D` by whether they meet `E`. This is an identity. Brute force on all 436 trees of order ≤ 11, every leaf and every `j`: the directly enumerated `q_j` equals `i_j(T − H) − i_j(T − R)`, 0 failures. | V |
| D-42c | The term equals `q_p − q_{p−1}` | This is algebra from D-42b, with `p ∸ 1 + 1 = p` because `p ≥ 1`. Checked on 1,722,911 leaf instances (every leaf of every eligible tree to order 18), 0 failures. | V |
| D-42d | `leaf_indep_cap`: an independent `A ⊆ univ ∖ H_v` has `\|A\| ≤ α − 1` | `v ∉ A`, `s ∉ A`, and `v`'s only neighbour is `s`, so `A ∪ {v}` is independent. Brute force (order ≤ 11): 0 failures. In the census, `α(T − H_v) = α − 1` holds exactly on every eligible leaf. | V |
| D-42e | Above the cap, `q_k = q_{k+1} = 0` | This follows from D-42d, since a `j`-set with `j > α − 1` cannot exist. | V |
| D-42f | Guard gives `2((α ∸ 1) ∸ k) ≤ k` from `2 ≤ p` and `2α + 1 ≤ 3p` | ℕ grid over `α, p ≤ 599` with truncation: 0 failures. At the top rank this reads `2 ≤ α − 2`. | V |
| D-41 | TSB: `k·q_{k+1} ≤ 2(a ∸ k)·q_k` under the `U`-relative cap, bipartite | (i) Deletions: a tagged `(k+1)`-set keeps its tag after deleting any vertex other than one fixed tag vertex `w`, which gives `≥ k` tagged `k`-subsets. (ii) Additions: every extension adds a vertex of the addable set `E ⊆ U`. `E` is non-adjacent to `A`, and `A ∪ (E ∩ class z)` is independent for each colour `z`, so `\|E ∩ class z\| ≤ a − \|A\|` and `\|E\| ≤ 2(a − k)`. The truncation is harmless, because `hcap A` gives `k ≤ a`. (iii) Double count. Brute force with `U = univ ∖ H_v`, `W = R_v`, `a = α − 1`, every `k ≥ 1` (23,567 instances, order ≤ 11): 0 failures. Census: the shadow inequality holds on all 1,722,911 eligible leaf instances. | V |
| D-42g | `k·q_{k+1} ≤ 2(a−k)·q_k ≤ k·q_k ⇒ q_{k+1} ≤ q_k` | The cancellation divides by `k`, so it needs `k ≥ 1`. That holds because `k = p − 1 ≥ 1`, as Step D states at the start of the leaf chain. See Observation O1. | V |
| D-42h | Every leaf term `≤ 0`, so `S ≤ 0` over any sub-filter | `Finset.sum_nonpos`. The selector is not consumed. Census: 0 positive leaf terms on any eligible tree, favourable or not. | V |

### Hypotheses and the cast audit

| # | Item | Check | Verdict |
|---|---|---|---|
| H1 | Hypothesis consumption table | Checked against the source tokens. `hT`: once, as `.isAcyclic`. `hBip`: bound only by `obtain ⟨c⟩` in `Core.card_extension_le`, and entries 44 → 41 → `tagged_extensions_upper` → `card_extension_le` only pass it along. `hEligible`: only in S7. `1 ≤ k`: unreferenced in entry 41's proof (the linter warns at `Main.lean:419`); it is used by `leaf_tagged_monotone`. `k ≤ a`: the non-vanishing branch. The selector: unused. | V |
| H2 | ℕ/ℤ equivalence of `hEligible` for every `α` | Exact grid `α, x ∈ [0, 399]`: `x + 2 ≤ α ∸ 1` ⟺ `x + 2 ≤ α − 1` (ℤ), 0 failures. Both are false for `α ≤ 1`. Census: ℕ-eligible = ℤ-eligible on all 205,004 trees. | V |
| H3 | Terminal hypotheses one-for-one with the claim | "finite ordinary tree" ↔ `[Fintype V]` plus `hT : G.IsTree`. `[DecidableEq V]` and `[DecidableRel G.Adj]` are instances, not restrictions. "`x + 2 ≤ p`" ↔ `hEligible` (H2). The conclusion ↔ `aggregate G (indepNum − 1) ≤ 0`, where the inner `p ∸ 1` equals the integer `p − 1 ≥ 1`, because eligibility forces `p ≥ 2` in the integers too. Nothing is added or dropped. | V |
| H4 | "Not a dependency" claims | `leafDegree` (entry 7) occurs only in its own definition. No `Erdos993G1`, `Guard`, entry 43, `Nonempty`, `connected` or `card_edgeFinset` token appears in `Main.lean`. No `sorry`, `admit`, `native_decide`, `decide` or `axiom` appears. The contract's dependency graph is closed (its node set equals the declared ids; its edges equal the declared dependencies) and acyclic. | V-lit |
| H5 | Provenance of the new declarations | The six new lemmas are byte-identical to `ADJ-U-awards-LA4b-Main.lean` lines 671–744. The block SHA-256s, with a trailing newline, reproduce the stated values `fedae3a6…` to `a780ca97…`, and each block occurs verbatim in `Main.lean`. The terminal differs from LA4b lines 746–753 by exactly one term (`hT.isBipartite` → `hT.isAcyclic.isBipartite`), as disclosed. All five carry files match `SOURCE-DIGESTS.json`. No critic-authored body is present. | V-lit |

## Reproduced Mathematical Evidence

**Instrument.** I wrote my own tools, standard library only. The explicit import list is `sys`, `json`, `hashlib`,
`itertools`, `math` and `time`. `time` is used only for stdout progress lines, and no wall-clock value is written into
a hashed file. I imported no prior evaluator. The files are under
`scratchpad/c1-s7-informal-LA4/`:

| File | SHA-256 |
|---|---|
| `la4_audit_eval.py` | `be89494dd946865566712e1dd8f80748a386405277924dfc16621a18714622dc` |
| `la4_audit_result.json` (`python3 la4_audit_eval.py 18 la4_audit_result.json 6`) | `896961b8cf28d8bd699eeb15ca1227deb2d85b90acbf9cec4f754af5408d944f` |
| `la4_audit_result_replay.json` (an independent foreground re-run) | byte-identical, `896961b8…944f` |
| `la4_nonbip_probe.py` | `df11678f057214e34e6ce733a0e74a985286c0c71d520bb64c66106c2868392a` |
| `la4_nonbip_probe.json` | `f1600740e260762924e9bc550ef372438a5ffd3f0166f403f12867bebbda5e77` |

**Methods.**
- **Free trees.** Built by leaf-augmentation, deduplicated by the minimum AHU string over the tree's centres. Every
  object is tree-tested (`n − 1` edges and one component).
- **Counts on trees and forests.** An exact tree/forest DP for the independence polynomial, run on every induced
  deletion. It is cross-checked against brute-force subset enumeration on all 436 trees of order ≤ 11 (whole tree and
  every `T − H_v`): 0 mismatches.
- **General graphs.** Brute-force subset enumeration.

**Results.** All counts are exact integers.

1. **Generator.** Orders 1–18 match A000055 exactly: 1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741,
   19320, 48629, 123867. That is 205,004 trees in all, with 0 non-tree objects.
2. **TRN census at `p = α ∸ 1`.**
   - Eligible per order: 0 for orders 1–6, then 4, 6, 27, 90, 217, 502, 1301, 3156, 7741, 19320, 48629, 123867.
   - Cumulative: 846 (≤ 12), 2,147 (≤ 13), 32,364 (≤ 16), 204,860 (≤ 18). Each reproduces the record: T2's and
     C-T2-F's per-order tables, the synthesis's 846 / 2,147 / 32,364, and F's adjudicator's 204,860.
   - Eligible counts by `α` at `α = 5, 6, 7, 8`: 3, 135, 877, 4068. This matches the record, and it is complete for
     `α ≤ 8`, since those trees have `n ≤ 16`.
   - Minimum eligible `α` is 5. No eligible tree has `α < 4`.
   - `S > 0`: 0 times. Maximum `S` = −12 through order 18. No leaf term is positive, favourable or not.
     (This is `bounded_computation`. It enters no proof step, and TRN states no strict inequality.)
3. **Witnesses.**
   - The order-7 double claw: `α = 5`, `x = 2`, `p = 4`. All four leaves are favourable, each with term −3, so `S = −12`.
   - The order-8 witness: `α = 6`, `x = 3`, `p = 5`. The favourable set is `{1,2,3,4,7}` with terms −5, −5, −5, −5, −3,
     so `S = −23`.
   - Both reproduce T2 and C-T2-F exactly.
4. **General graphs, orders 1–6.** There are 33,867 labelled graphs. 91 are top-eligible, all bipartite, with minimum
   `α` 5. S7 has 0 failures and Step A has 0 failures. This reproduces the synthesis's "91 top-eligible graphs".
5. **Arithmetic grids.** H2, C1, D-42f and B1, as tabulated above. 0 failures.

**Failure outside the hypotheses, where the record says a hypothesis is load-bearing or sharp.**
- **Without eligibility, top rank.** 4 trees have `S(T, α ∸ 1) > 0`, all with `α ∈ {2, 3}`. The first is `P_3`:
  `α = 2`, `p = 1`, `S = +2`. So the conclusion genuinely needs `hEligible`, which enters through `α ≥ 4`.
- **Guard sharpness (record B1/B3).**
  - `P_6` and the spider `S(1,2,2)`, at `α = 3`, `p = 2` (so `3p = 2α`), have leaf terms `+1`, as the record states.
  - Family A's closed form `C(m,p)(2^p − 1) − C(m,p−1)(2^{p−1} − 1)` equals brute force at every `p ≤ α`, for
    `α = 2..7` (27 checks).
  - The term is positive at `p = ⌊2α/3⌋` for all six values of `α`.
- **Bipartiteness (record B4).**
  - `K_1 ⊔ K_5`, `W` = the isolate, `k = 1`: `α = 2`, `q_1 = 1`, `q_2 = 5`, and `5 > 2 = 2(α − 1)·q_1`. TSB fails.
  - `P_3 ⊔ 2K_3` at `α = 4`, `p = 3` (guard equality): the leaf term is `+3`, so HTP fails. This graph is not
    top-eligible (`x = 3`).
- **Informational only, outside TRN's scope.**
  - Every order-7 graph with `α ≥ 4` (32,768 labellings, complete up to isomorphism) and every order-8 graph with
    `α ≥ 5` (262,144): of the eligible graphs, 1,774 and 117,937 respectively are non-bipartite. None has
    `S(G, α − 1) > 0`.
  - I found no non-bipartite counterexample to the TRN conclusion. The record claims no sharpness for `hT`, and
    nothing in this award depends on it.

## Independent Critic Pass

I reran each closing claim adversarially, apart from the ledger pass.

- **Does anything assume connectivity or `Nonempty`?** No. Step B takes `n ≥ α` from a maximum independent set.
  `IsAcyclic.coloringTwo` chooses one vertex per connected component, so an empty `V` is harmless. The census and
  graph checks agree.
- **Could truncated subtraction hide a mismatch?** Four places, all exact.
  - `α ∸ 1`: settled by H2 on a grid, including `α = 0, 1`.
  - `p ∸ 1` inside `aggregate`: exact because `p ≥ 3`.
  - `a ∸ k` in entry 41: used only when `k ≤ α − 1`, and its bound is also valid in the truncated form (brute force over
    every `k ≥ 1`, including `k > a`).
  - `n − \|D\|`: cast by `Nat.cast_sub` with the bound proved.
- **Is the `x`-step correct?** Yes. `crossingIndex` is the least `k` with `Δ_k < 0` (a plateau is not a descent), so
  `x = 0 ⟺ Δ_0 < 0`, and `Δ_0 = n − 1 ≥ 2` excludes it. I checked that no ℤ/ℕ confusion arises: the Lean
  `forwardDifferenceDel` is ℤ-valued.
- **Is the favourable filter a hidden dependency?** No. The bound is proved for every leaf term, and the census confirms
  it for non-favourable leaves as well.
- **Does TRN collapse to r26 or widen it?** No. By `SEMANTIC-CONTRACT.md` §1, r26 has the same conclusion and
  `hEligible` plus `hAlpha` and (★). TRN proves the same conclusion without them by a different mechanism, and it
  re-registers and edits nothing of r26. The proof text says exactly this, as a scope note.
- **Does the proof overclaim anything?**
  - S7 is described as a compiled companion that needs SR-5 before registration. That is correct.
  - S8 and S9 are not formalized and not claimed.
  - "Entries 41, 42 and 44 are context, never certificates" is stated.
  - The census maximum −12 is not used.
  - The stated linter lines 419 and 493 are in carried text, confirmed.
- **Reconciling the records against each other.** C-T2-U reports a zero pointwise leaf term (order 8, leaf 7), while
  C-T2-F's order-8 witness has leaf 7 at term −3. These are different trees. My census confirms that zero leaf terms
  occur on eligible trees (48,057 instances to order 18), which is consistent with the non-strict claim. It is not a
  defect.
- **Observation O1 (imprecision, not a defect).** The informal proof's hypothesis table places `1 ≤ k` only as entry
  41's `hk`, which is unreferenced there. In fact `1 ≤ k` is also what licenses the cancellation
  `k·q_{k+1} ≤ k·q_k ⇒ q_{k+1} ≤ q_k` inside `Leaf.leaf_tagged_monotone` (the `nlinarith` step, with `hk` in context).
  Step D states `k = p − 1 ≥ 1` at the head of that chain, so the hypothesis is named where the chain begins. The
  mathematics is complete. A future revision could add "and the cancellation in `leaf_tagged_monotone`" to that table
  row. I do not repair it.
- **Observation O2 (outside this audit).** `FORMALIZER-REPORT.md` discloses that the kernel verifier rewrote
  `EVIDENCE/axioms.txt` during verification, as its skill contract says. This is a process record for the kernel and
  fidelity gates. It does not affect the mathematics.

The critic pass leaves every ledger verdict unchanged. There are no disputed rows.

## Scope and Fence Check

**Excluded conclusions of the synthesis and brief §2.** The claim asserts none of them:
- The claim is non-strict (`≤ 0`). `E993-R26-TOP-RANK-RESIDUAL-SIGN-STRICT` is untouched, and −12 appears only as a
  bounded figure.
- It is one rank (`α − 1`), and on trees only. The terminal theorem makes no bipartite or forest statement. S9 is
  neither formalized nor claimed.
- `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` stays OPEN; one rank is closed, not the key.
- r26 is not widened, re-registered or edited.
- There is no `E993-BETA-AGG` transport.

**Fences.**
- §3.1: this is a counting statement, not a no-recovery statement, and it transfers no status.
- §3.2: honoured.
- §3.3: TRN lies strictly inside `3p ≥ 2α + 1`, and nothing in the proof enters `3p < 2α + 1`. My guard-sharpness
  witnesses reproduce record items B1/B3 only, and they refute nothing in scope.
- §3.8: stated on the face.

**Attribution.** Every item the synthesis requires is present both in `INFORMAL-PROOF.md` §6 and in the contract's
`formulation_status.evidence`:

| Credited party | Credited for |
|---|---|
| Codex (GPT-6 Astra) | the proposed corollary ("supported informally") |
| r26 | the `C5LA1` layer and the `α ≥ 4` ingredient on the residual class |
| r24 C4-LA1 | the selector and leaf definitions |
| T2 | the derivation |
| C-T2-F and C-T2-U | `α ≥ 5` and the bipartite form |
| C-T2-U, F's adjudicator, U's adjudicator | the `x ≥ 1` shortening |
| C-U1-T | the minimal public route |
| U's adjudicator | the base candidate |

The formalizer's own contribution (the one-term acyclicity routing) is disclosed. The synthesis's required T2 contract
repairs are all present:
- `Nat.sub`, entry 44 and `IsTree.isBipartite` are absent from `definitions`, which lists exactly 20 entries;
- the seven named definitions were added;
- the equivalence is stated for every `α`;
- `hyp-tree` has no `Nonempty` dependency;
- the attribution is present.

## Verdict

passed

`INFORMAL-PROOF.md` is a complete, correct statement-level proof of the contract's `informal_statement`. Every
inference step is verified by derivation and by reproduced exact computation. Every ℕ subtraction and cast is exact
where it is used. The carried definitions are byte-identical to the frozen first-interior source. The terminal
declaration's hypotheses match the claim one for one. No NOT-a-dependency item is a dependency. The claim asserts
nothing fenced. The required attribution travels on the face.

There is one non-blocking imprecision: Observation O1, the `1 ≤ k` table row. It is recorded but not repaired.

Model disclosure: chartered Claude Opus 5.5 (effort high) on dispatch-record authority; runtime-reported model id
`claude-opus-5-5[1m]`.
