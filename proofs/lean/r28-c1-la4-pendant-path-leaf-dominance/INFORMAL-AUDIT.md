---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la4-formalizer-opus-20260925
critic_id: c1-la4-fable-informal-20260925
attestation_id: c1-la4-informal-pass-20260925
claim_sha256: 25d1404628b972dc27b9ecdf273dbb571e726f4f781ed2262ad794587ae8daf0
---

# Informal Proof Integrity Audit

Award `C1-LA4` (r28 Cycle 1 Stage 7), key `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`, terminal declaration
`Erdos993G1.pendant_path_leaf_dominance`. Seat: independent informal proof-integrity reviewer
`c1-la4-fable-informal-20260925` (kind `independent-mathematical-proof-integrity-reviewer`). The seat is not the
artifact producer. It edited no run artifact. It wrote only under `scratchpad/c1-s7-informal-LA4/`.

**VerityOS boot.** Operating within VerityOS. Loaded: `verity.md`, `identity/startup-protocol.md`,
`skills/proof-integrity-audit/skill.md` (single-problem scale; one prover/critic cycle). Subsystems: identity
(startup protocol), skills (proof-integrity audit), experiments (this run root, inside the brief's read boundary).

**Model disclosure.** Chartered seat: Claude Opus 5, effort high, on the authority of the dispatch record. The
runtime reports the model as Claude Opus 5.5 (`claude-opus-5-5[1m]`). The seat cannot inspect its own runtime
effort. This record states both facts and does not reconcile them. No child agent was used.

**Pinned inputs (recomputed).** `THEOREM-CONTRACT.yaml` `0c3a4027…c23c3`, `INFORMAL-PROOF.md`
`bc7ea2e3…2fafe`, `LeanProject/LeanProof/Main.lean` `f979e1d7…8bae0` and `CAPSULE-VERIFICATION.json`
`7f64fdc8…4131f` all match their pinned digests. The capsule seal recomputes to `d09c1c24…b8f9`, the value of record.
All 46 capsule members match on bytes and SHA-256, and all 7 carry files match `SOURCE-DIGESTS.json`. The digests
were rechecked immediately before close, and none of the four audited artifacts changed during the audit.

## Intended Claim

The contract's `theorem.informal_statement`: for any finite simple graph `G` (no tree hypothesis), take a path
`u : Fin (m+2) → X` that is injective, has consecutive vertices adjacent, has interior vertices `u_1..u_m` of
degree 2, and ends at a leaf `ℓ = u_{m+1}` of degree 1, with `u_0` of any degree. Then for every `k ∈ ℕ` and every
position `i ∈ {0..m+1}`, `c_{u_i}(k) ≤ c_ℓ(k)`, where `c_v(k) = occ G v k` is the number of independent `k`-sets
containing `v`.

- `claim_sha256` recomputed as the SHA-256 of `" ".join(s.split())` over the contract string:
  `25d1404628b972dc27b9ecdf273dbb571e726f4f781ed2262ad794587ae8daf0`. It equals the value of record.
- Lean binding. `expected_statement` has SHA-256 `3087849e…f383`, matching the contract's
  `expected_statement_sha256`. It occurs exactly once in `Main.lean`, followed by ` := by`, and it is byte-equal to
  the formalizer brief's §2 block.
- Binder order. `(k) (i)` in the Lean form against `∀ (i) (k)` in the T adjudicator's form is the controller-accepted
  choice, recorded on the face. The two are logically equivalent.
- The informal proof proves exactly this claim. SR-PP's path `u_0..u_M = ℓ` has `M = m + 1`.

## Claim Ledger

Each row names the step, the hypotheses it uses, how it was checked, and the verdict. Recomputed evidence is in
`pp_audit_out.txt` (P) and `integrity_out.txt` (I).

| # | Claim (INFORMAL-PROOF.md) | Hypotheses entering | Check | Verdict |
|---|---|---|---|---|
| D1 | `occ G v k := ((G.indepSetFinset k).filter (· ∋ v)).card` is `c_v(k)` from SEMANTIC-CONTRACT §1. | — | Lean entry 3 read literally. Mathlib `indepSetFinset n = {s \| IsNIndepSet n s}`, where `IsNIndepSet` is pairwise non-adjacency plus `card = n`, and `degree = #neighborFinset`. The body is byte-identical to U1 lines 45–49 (`009eec1a…`) (I). | verified |
| D2 | Hypotheses of the statement correspond one-for-one to the Lean binders. | — | The contract's four hypothesis strings occur verbatim in `expected_statement` (I). (H-adj) with `j ≤ m` corresponds to `i : Fin (m+1)`. (H-deg2) with `0<j<m+1` matches exactly. (H-leaf) is `Fin.last (m+1)`. | verified |
| A | Lemma A (entry 7): for `0<a≤m+1` and `y ~ u_a`, `y = u_b` with `b` consecutive to `a`. Interior case: `{u_{a−1},u_{a+1}} ⊆ N(u_a)`, the two are distinct, `\|N\| = 2`, so the sets are equal. Leaf case: `N(ℓ) = {u_m}`. | (H-adj) twice (needs `0<a` for `a−1`); (H-inj) for `u_{a−1} ≠ u_{a+1}`; (H-deg2) interior; (H-leaf) at `a = m+1` | Inference checked by hand. `a−1` is guarded by `0<a`. Matches Lean lines 98–161 (`eq_of_subset_of_card_le`). The generator check below confirms the degree pattern forces every edge at `u_1..u_{m+1}` onto the path. | verified |
| B | Lemma B (entry 8): `u_a ~ u_b` implies `a`, `b` consecutive. The case `a = 0` uses irreflexivity to get `b > 0`, then A with `b`. | via A; (H-inj) for `b = c` | By hand. The same fact holds as an integer consequence on every instance, since `σ(J)` independence was checked 22,140,371 times with 0 failures. | verified |
| C | Lemma C (entry 9): `0<a` and `y ~ u_a` imply `y ∈ range u`. | via A | Immediate from A. | verified |
| E1 | Lemma D (entry 10): `π` (identity on `j<i`, `i↦m+1`, `i+1↦m`, `j↦j−2` for `j≥i+2`) is a permutation of `{0..m+1}` when `i < m+1`. | `i<m+1` | Integer check for every `m ≤ 40` and `i ≤ m`: bijective with `π(i) = m+1`, 0 failures (P). `j−2` sits in the branch where `j ≥ i+2 ≥ 2`, so it never truncates. | verified |
| E2 | `σ := π.viaEmbedding ⟨u,hinj⟩` satisfies `σ(u_j) = u_{π(j)}` and fixes every vertex off the path, so `σ(u_i) = ℓ`. | (H-inj) (embedding) | Mathlib `GroupTheory/Perm/ViaEmbedding.lean`: `viaEmbedding_apply` and `viaEmbedding_apply_of_notMem` state exactly these two facts. My instrument builds `σ` independently and asserts that it is a permutation with `σ(u_i) = ℓ` on every instance. | verified |
| E3 | Fact (N): `S = {j : u_j ∈ J}` has no two consecutive positions. | (H-adj), independence of `J` | Lean `hcons`/`hS`. By hand. | verified |
| E4 | `J ↦ σ(J)` is injective and preserves cardinality, and `ℓ ∈ σ(J)`. | `σ` bijective | Lean uses `Finset.map` with `card_map`, `map_injective` and `card_le_card_of_injOn`, whose Mathlib statement was read. Replayed: every image is distinct and has the same size (P). | verified |
| E5 | Case 1 (both vertices off the path): `σ` is the identity there, so the edge lies inside `J`. | — | By hand. | verified |
| E6 | Case 2 (`x = u_a` on the path, `y` off it). If `π(a) > 0`, Lemma C puts `y` on the path, a contradiction. If `π(a) = 0`, then `π(a) ∈ {a, i}`, via `a < i`, or `a = 2` with `i = 0` (the anchor). The branch `a = i` gives `m+1 ≠ 0`. The branch `a = i+1` (value `m`, which is 0 when `m = 0`) is excluded by (N). | Lemma C; (N) at `(a,i)` | Integer statement "(N) at `(a,i)` and `π(a) = 0` imply `π(a) ∈ {a,i}`": 5,876 checks for `m ≤ 25`, 0 failures. Negative control: at `m = 0`, `i = 0`, `π(1) = 0`, so the (N) exclusion the prose names is needed. At `m = 3`, `i = 0`, `π(2) = 0 = i` is the anchor case, where `u_0 ∈ J`. | verified |
| E7 | Case 3 is symmetric to case 2. | — | Adjacency is symmetric (Lean `hA.symm`). | verified |
| E8 | Case 4 (both on the path). Lemma B says `π(a)`, `π(b)` are consecutive. The branch table rules this out under (N) at `(a,b)`, `(a,i)`, `(b,i)`. | Lemma B; (N) | Integer statement for `m ≤ 25` and every admissible `(i,a,b)`: 102,026 checks, 0 failures. Negative control for `m ≤ 7`: all 98 non-consecutive pairs whose images are consecutive involve `i−1` or `i+1`, for example the gap pair `(m,i,a,b) = (5,2,1,4)` with `π = (1,2)`. So every exclusion the proof invokes is load-bearing. | verified |
| E9 | Lemma E: for `i < m+1`, `c_{u_i}(k) ≤ c_ℓ(k)`. | all four, through A/B/C | Replayed by construction (the proof's `σ`, 22,140,371 set-level checks) and by conclusion (2,853,045 `(path, i, k)` checks). 0 failures (P). | verified |
| T | Theorem (entry 12): Lemma E if `i < m+1`, else `i = m+1` and the inequality is reflexive. | — | By hand. Lean lines 365–371 (`rw [hlast]` closes `occ … ≤ occ …` by reflexivity). | verified |
| S1 | §1 side claims: no tree, `n ≥ 2`, `k ≥ 1` or `t` hypothesis; at `k = 0` both counts are 0; `n ≥ 2` is automatic. | — | `c_v(0) = 0` checked on 240 random graphs (P). The statement has none of those binders (I: no `IsTree`/`IsAcyclic`/`Connected` in any code of entries 7–12; `IsTree` appears only in a docstring saying "no `IsTree`"). | verified |
| S2 | §7 ℕ/ℤ cast audit: the conclusion is in ℕ with no subtraction or cast; the ℕ-subtractions are `a−1` (guarded by `0<a`) and `j−2` (guarded by `j ≥ i+2`); `deg v − 2` appears only in the unused `slotsAtLeast`, guarded by `3 ≤ deg v`. | — | True of the Lean text. The prose also uses integer notation `i−1`, `m−1` and `b−2`, not listed in §7. Each is harmless: `a = i−1` is used only when `a < i`, so `i ≥ 1`; `π(b) = b−2 ≤ m−1` only with `2 ≤ b ≤ m+1`, so `m ≥ 1`; the range `[i, m−1]` is empty exactly when the tail branch is. One sentence, "(N)… in particular `i − 1, i + 1 ∉ S`", is false under a literal ℕ reading at `i = 0` (where `i−1 = 0 = i`), but it is used only for `i ≥ 1`. The Lean text uses the additive form `a.val + 1 = b.val` and never subtracts `i`. | verified (notation note O1) |
| S3 | §8 attribution: route `C-T1-U` Finding 1, realized as the T adjudicator's direct injection `J ↦ φ(J∖{u_i}) ∪ {ℓ}`; six independent derivations; T1 and F2 for the leaf/support case; common r28 attribution. | — | `σ(J)` equals `φ(J∖{u_i}) ∪ {ℓ}` on these sets, because `u_{i+1} ∉ J`. C-T1-U Finding 1 (read) is the shift `φ(u_j) = u_{j−2}` with the anchor bullet. The list matches synthesis `## Lean awards` C1-LA4 and brief §2. | verified |
| S4 | §9 fence witnesses: `S(3,1,1)` gives `(0,3,1,3)` along `0–1–4–5` at `k = 3`; the lemma holds on `R(3,2)_3` at every vertex of every pendant path. | — | `S(3,1,1)` recomputed as `(0,3,1,3)`, and the lemma holds there (each value `≤ c_5`). `T22`: 18 pendant-path instances, 1,296 claim checks and 498,858 `σ` checks, 0 failures. `c_0(12) = 18` and `slots_{≥18} = 1 > 0 = leaves_{≥18}` at `k = 12` recompute ((HS) fails, as the fence says). | verified |
| S5 | §10 carry table and provenance: entries 1, 2 and 6 are byte-identical to r25 entries 1 and 4 and r27 entry 7; entries 3–5 are declaration-level byte-identical to U1 lines 45–60; entries 7–12 were re-derived in-run; no critic body and nothing from U2. | — | Entry bodies and header digests are byte-equal to the origins (`5484fc21…`, `4463e7ee…`, `a1ed32eb…`). All 12 snippet digests match their headers. The U1 blocks are verbatim, with digests `009eec1a…`, `1e3005c3…`, `5f3da124…` (I). No U2 or (HS) identifier appears in the code. | verified |
| X1 | Addendum: each hypothesis is consumed where the prose says. | — | (H-deg2) and (H-leaf) enter only Lemma A: Lean lines 138 and 151, and B, C and E only pass them on. (H-inj) enters A (`u_{a−1} ≠ u_{a+1}`), B (`b = c`) and E (the embedding). (H-adj) enters A and (N). The prose statement "(H-deg2) and (H-leaf) enter here and nowhere else" is exact. | verified |
| X2 | Hypothesis necessity (a negative control; the record claims no sharpness). | — | Dropping one hypothesis at a time on all labelled graphs with `n ≤ 6` (P): drop (H-adj): fails (`n = 3`, `u = (2,0)`, `k = 2`, `2 > 1`); drop (H-deg2): fails (`S(2,1,1)`-shaped, `k = 3`, `2 > 1`); drop (H-leaf): fails (`P_3`, `u = (2,0)`, `k = 2`, `1 > 0`); drop (H-inj): **no failure** over 66,534 non-injective walks (observation O2). | recorded |

**Instance generator (validity of the replay).** The generator returns every Lean instance `(m, u)` as the pendant
walk from each leaf. It was checked against brute force: on all labelled graphs of order ≤ 5, the 2,308
sequences satisfying the four Lean hypotheses literally are exactly those it returns (0 missed, 0 spurious). Its
path counts also reproduce SR-PP's independent counts exactly: 20,249 on free trees of orders 1–13 and 45,748 on
labelled graphs of orders 1–6.

## Reproduced Mathematical Evidence

My own instrument, written this session under `scratchpad/c1-s7-informal-LA4/`. It uses the standard library
only and imports no prior evaluator. Nothing in the hashed outputs records wall-clock time. Each script was run
twice and the outputs are byte-identical.

| File | SHA-256 | Imports |
|---|---|---|
| `pp_audit.py` | `5f297ef3ef8a2173fce9f2b2587ca3980943fda9ac45c5930e45bd6b630eabf4` | `sys, random, itertools, hashlib` |
| `pp_audit_out.txt` (= `.replay.txt`) | `3476a2404f24ab1b02d943ed8a88ff36996968b822f85639b4a49628ffd34d53` | — |
| `integrity_check.py` | `48a67a3b1fa5498f3b40c4d6c44a04aea097b24cdb6f3d3cc9853a9c8e59037b` | `hashlib, json, re, sys, pathlib` |
| `integrity_out.txt` (= `.replay.txt`) | `d650429cb277faa5f75429d680bd28cddd350e54e4a2e81c2cb2a65a42384489` | — |

Method. The instrument enumerates independent sets by include/exclude backtracking. On 400 random graphs with
`n ≤ 10` this equals a literal `2^n` scan with 0 mismatches. `c_v(k)` is counted from the definition. On 240
random graphs `Σ_v c_v(k) = k·i_k`, `c_v(0) = 0` and `c_v(1) = 1` hold with 0 failures. Free trees come from
Beyer–Hedetniemi level sequences deduplicated by centre-AHU. The counts equal A000055 for orders 1–13 (2,288
trees), and every tree passes an edge-count and union-find acyclicity test. For every instance, every `i` and every
`k ∈ 0..n+1`, the instrument checks the claim. For every `i < m+1` it also builds the proof's `σ` and checks, over
every independent `J ∋ u_i`, that `σ(J)` is independent, contains `ℓ`, has `|σ(J)| = |J|`, and is new (injectivity).

| Family | Instances (pendant paths) | Claim checks | `σ`-injection checks | Failures |
|---|---|---|---|---|
| All free trees, orders 1–13 (`σ` for orders ≤ 12) | 20,249 | 721,692 | 967,672 | 0 |
| All labelled graphs, orders 1–6 (33,867 graphs) | 45,748 | 901,898 | 331,260 | 0 |
| Random hosts (1–10 vertices, 5 densities) plus 1–3 pendant paths of length 1–5, `n ≤ 18`, seed 99302825: 2,820 hosts, 2,231 of them non-trees | 21,915 | 1,092,063 | 19,914,518 | 0 |
| Plain `G(n,p)`, `n ≤ 14`, 1,500 graphs | 4,954 | 137,392 | 926,921 | 0 |
| **Total** | **92,866** | **2,853,045** | **22,140,371** | **0** |

Corroboration outside the proof, not used by it. The synthesis identity
`Σ_k (c_ℓ(k) − c_w(k)) x^k = x·(I(R−w) − I(R−N_R[w]))·I(P_{M−2})` at the anchor `w = u_0` was checked with
`R = G − {u_1..u_M}` and `I(P_{−1}) = I(P_0) = 1`, and with the independence polynomials taken by filtering the
enumeration rather than by recurrence. It holds on every instance above: 1,008,820 coefficient checks, 0 failures.

Named witnesses recomputed:
- `S(3,1,1)` at `k = 3` gives `(0,3,1,3)` along `0–1–4–5`, and `(0,1,0,1)` at `k = 4`.
- `S(2,1,1)` at `k = 3` gives `c = (0,1,2,2,1)`, so `c_2 = 2 > c_4 = 1`, both leaves (SEMANTIC-CONTRACT's (PW) refutation).
- `T9` at `k = 5` gives `c_0 = 2 > c_8 = 1`. Leaf 8 ends the pendant path `1–4–8`, not a path at 0.
- The first failures of (PW) in branch wording come at orders `{9: 1, 10: 2}`, and those of branch-anchored
  stepwise monotonicity at `{6: 1, 7: 4, 8: 9, 9: 22, 10: 52}`. Both agree with SR-PP PP-5.
- `T22` is as in S4.
- The counts 2,288, 33,867, 20,249 and 45,748 cited in the contract and in SR-PP reproduce exactly.

## Independent Critic Pass

A separate adversarial pass over the unchanged ledger. Each attack names a way the proof or the ledger could fail
and how it was resolved.

1. **Does `σ(J)` really avoid `u_m`–`ℓ` adjacency?** `ℓ = σ(u_i)` is adjacent only to `u_m = σ(u_{i+1})`, and
   `u_{i+1} ∉ J`. The tail branch lands in `[i, m−1]`, so `u_m ∉ σ(J)` apart from the `i+1` branch. Case 4's row
   `a = i, b ≥ i+2` covers this. No gap.
2. **The anchor `u_0` when `i ≥ 1`.** `π` fixes `0 < i`, so `u_0 ∈ σ(J)` iff `u_0 ∈ J`. Its off-path neighbours
   stay where they were, and case 2 with `π(a) = a = 0` closes this. When `i = 0`, `u_0 ↦ ℓ` and `u_2 ↦ u_0`, so the
   off-path neighbours of the new `u_0` are neighbours of the old `u_0 ∈ J`, hence absent. That is the "`a = 2`,
   `i = 0`" subcase. The integer checks and 5,876 zero-branch checks confirm both.
3. **Degenerate sizes.** `m = 0` (`π` is the swap `0 ↔ 1`), `i = m` (`π` swaps `m ↔ m+1`, empty tail) and `k = 0`
   are all inside the exhaustive grids (every `m ≤ 25`/`40`, every graph with `n ≤ 6`, `k` from 0). `K_2` is itself
   an instance, with `m = 0`.
4. **Hidden reliance on acyclicity or connectivity.** Lemma A derives "every edge at a non-anchor path vertex is a
   path edge" from degrees alone. 2,231 random non-trees and all 33,867 labelled graphs give 0 failures. The code of
   entries 7–12 names no tree predicate.
5. **Could the replay be vacuous?** Three negative controls rule this out: removing any one of (H-adj), (H-deg2) or
   (H-leaf) produces a counterexample at `n ≤ 5`; the case-table control shows the (N) exclusions carry weight; and
   the brute-force generator check shows the instance set is exactly the hypothesis set.
6. **Truncation.** Every ℕ-subtraction in the Lean text was re-derived with its guard. The prose's integer
   notation is note O1 and changes no inference.
7. **Status and fence leakage.** The claim asserts only `≤` against the leaf of the same path: not (PW), not
   stepwise, not (HS), and no transfer (see the next section).
8. **My own instrument.** `pi_map` transcribes the construction under audit, so the `σ` replay tests that
   construction rather than deriving it independently. The claim checks are the independent part: they count from
   the definition with no reference to `π`. The generator was validated by brute force, and the tree enumeration
   against A000055.

Observations (none is a defect of the claim or the proof):
- **O1 (notation).** §7 lists only the Lean ℕ-subtractions. The prose uses `i−1`, `m−1` and `b−2` as integers, each
  guarded in context. The phrase "`i − 1 ∉ S`" read literally in ℕ at `i = 0` is false but is never used there.
- **O2 (redundant hypothesis).** (H-inj) is used by this proof route but is not needed for the conclusion. Given
  (H-adj), (H-deg2) and (H-leaf), every `u_j` with `j ≥ 1` lies on the pendant walk from `ℓ`, and `u_0` is a
  neighbour of such a vertex. So a non-injective `u` only revisits vertices already covered by the injective lemma.
  0 failures over 66,534 non-injective walks confirms this. Carrying an unneeded hypothesis weakens the statement;
  it does not make it wrong. No record claims (H-inj) is sharp.
- **O3 (cross-reference).** §1 says "entries 1–5, carried; see §6", but the carry table is §10 and §6 is the
  theorem. This is editorial only.

## Scope and Fence Check

- **Not (PW).** The conclusion compares `u_i` only with the leaf ending its own pendant path. Fence present in
  INFORMAL-PROOF §9 and in the contract's `informal_statement` and `conclusion`.
- **Not stepwise monotonicity** (REFUTED, `S(3,1,1)`, `k = 3`). It is not claimed anywhere and is fenced on every
  face. The recomputed witness is `(0,3,1,3)`.
- **Not (HS)** (FALSE, `T22`). No declaration depends on `slot_leaf_sdr_exists` or `tree_leaf_slot_dominance`,
  and neither is in the project (I). The lemma holds on `T22`.
- **No status transfer.** No fenced key is mentioned as upgraded. (DL) `forest_degree_lemma` is not imported, used
  or re-proved. The definitions marked "NOT referenced" (`slotsAtLeast`, `leavesAtLeast`, `indepCount`,
  `indepDegreeSum`, `indepCount_eq_card_indepSetFinset`) occur nowhere in the code of entries 7–12 or in the
  terminal statement (I), so nothing marked "not a dependency" is one.
- **Attribution on the face.** The synthesis requires `C-T1-U`, `C-T1-F`, `C-T2-U`, `C-T2-F`, `C-F2-T`, `C-F2-U`,
  "six independent derivations, one proof (SR-PP)", and T1 and F2 for the leaf/support case with
  `E993-PAIR-R-LE-G-POINTWISE` (i) cited as corroboration only. All of this appears in INFORMAL-PROOF §8 and in the
  contract's `informal_statement` (scope text), together with the common r28 attribution. The index convention is
  recorded: synthesis `m = 1` in SR-PP indexing is Lean `m = 0`.
- **Brief conditions relevant to the informal audit.** R1 and R2 (byte identity and carry digests) verified (I).
  R4: axioms are the three for all 12 declarations, and `Main.lean` contains no `sorry`, `admit`, `native_decide`,
  `decide` or `axiom` token. R5: every hypothesis is named where it enters, and the cast audit, attributions,
  fences and carry table are present, with notes O1 and O3. R7: the route is the direct injection, which the brief
  permits, and it is recorded.
- **Controller addendum.** The binder order and registrar ordering are accepted rulings, noted. The `/tmp/.x`
  write: a token scan of the run root's formalizer-shipped files finds "/tmp" only in the disclosure sentence of
  `FORMALIZER-REPORT.md`. Every shipped fragment's digest matches its registrar header, and every pinned digest
  holds, so nothing shipped depends on that file.
- **Read-boundary disclosure.**
  - The `/tmp` token scan and the capsule digest check read bytes of files beyond the listed reading set (RECEIPTS,
    other capsule members) for hashing and token matching only. Their content was not consulted.
  - During the audit, a concurrent fidelity-review seat wrote `FIDELITY-REVIEW.md`, `FIDELITY-REVIEWER-NOTES.md`,
    `RECEIPTS/fidelity-audit.json` and a new `EVIDENCE/fidelity-audit-input.json`. The replay scan flagged them. To
    trace the token I printed about 200 characters around it in the fidelity input: one sentence of that seat's
    notes, which calls the `/tmp` write procedural. No other fidelity-review content was read. The scan was then
    scoped to exclude that seat's files, which the script records, and my verdict was reached on the evidence
    above, independent of that sentence.

## Verdict

passed

The informal proof establishes the contract's `informal_statement` exactly. Its hypotheses match the terminal
declaration one-for-one, every step is verified, and every step was replayed with 0 failures. It asserts nothing
fenced, and the required attribution travels on its face. Observations O1–O3 are notational or editorial, or
concern a redundant hypothesis. None is a defect in any inference.
