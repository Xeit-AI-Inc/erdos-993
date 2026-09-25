---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la3-formalizer-opus-20260925
critic_id: c1-la3-fable-informal-20260925
attestation_id: c1-la3-informal-pass-20260925
claim_sha256: e841548d4edcc85bf99c2ef360bc32388474bf8731925cdf2b1bf120b8d9032f
---

# Informal Proof Integrity Audit

**VerityOS boot.** I am working within VerityOS. I loaded `verity.md`, `identity/startup-protocol.md` and
`skills/proof-integrity-audit/skill.md`, which is the authorized boot set in brief §0. Subsystems: the constitution,
identity (the startup protocol) and skills (proof-integrity audit). I opened no memory, decision, log or knowledge file.
The host injected the repository `CLAUDE.md` and the auto-memory index into context; I did not act on them beyond this
boot.

**Model disclosure (two parts).** The chartered model is **Claude Opus 5.5**, effort high, on dispatch-record authority
(the controller's dispatch of this seat under `control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA3.md`). The model id my runtime
reports, verbatim, is `claude-opus-5-5[1m]`. I delegated no child work.

**Seat.** Independent informal proof-integrity reviewer `c1-la3-fable-informal-20260925`
(`independent-mathematical-proof-integrity-reviewer`). I am not the artifact producer. I edited nothing in the Lean run,
did not invoke `lake` or `lean`, and wrote only under `scratchpad/c1-s7-informal-LA3/`.

**Read boundary kept.** I read the following and nothing else:
- the run's `THEOREM-CONTRACT.yaml`, `INFORMAL-PROOF.md`, `CAPSULE-VERIFICATION.json`, `EVIDENCE/THEOREM-CONTRACT.md`,
  `FORMALIZER-REPORT.md`, `EVIDENCE/axioms-all-declarations.txt` (header and axiom lines), `LeanProject/LeanProof/Main.lean`,
  `LeanProject/LeanProof.lean`, its `Snippets/`, `FORMALIZATION-STATE.json` and `SOURCE/` copies (compared by digest);
- the capsule manifest and its members that bear on LA3: the synthesis (`## Exact established results`, `## Lean awards`,
  the boundary record and the bounded computations), T's adjudication `## Lean readiness`, and U's adjudication (a heading
  scan only);
- the ELIG passages of T1's return and of C-T1-F and C-T1-U, located by `grep`;
- the formalizer brief, `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`;
- the frozen first-interior `Main.lean`, its `Snippets/` and `FORMALIZATION-STATE.json`, and the frozen r25 `Main.lean`
  (G1 entries 1–5);
- Mathlib `Acyclic.lean` and `Clique.lean` under the shared pinned project.

**Input digests (recomputed).**

| Input | SHA-256 | Status |
|---|---|---|
| `THEOREM-CONTRACT.yaml` | `99379e6d984bfb73fc2626b2d1c27cde794c68666689ea0638ce9e80f9fe7542` | matches the brief |
| `INFORMAL-PROOF.md` | `232a8378bd23fef993f604fb02f673bcc7477f050a80921dfacce35a40d0af30` | matches the brief |
| `LeanProject/LeanProof/Main.lean` | `8d500fd7c6811e9a4ce560cbaeea6e6b16a208eebb925498618fb66ed133550b` | matches the brief |
| `CAPSULE-VERIFICATION.json` | `8addb5feb0a88df17cd3091f7c5b19f3d2517e7ab1fa305a8ee622241b159218` | matches the contract's `source_materials` |
| capsule `C1-LA3-PACKET-MANIFEST.json` | file `c0d0e53c…3c08d`; seal recomputed as `1a6739e636dd589a4767794f5d193e961a22f71c1828b870f17d7758b3beb081` | matches; all 83 members match in bytes and SHA-256 |

## Intended Claim

The intended claim is the contract's `theorem.informal_statement`. I recomputed its SHA-256 with whitespace collapsed
(`" ".join(s.split())`) and got `e841548d4edcc85bf99c2ef360bc32388474bf8731925cdf2b1bf120b8d9032f`, which equals the
required value.

The mathematical content: **for every finite ordinary tree `T` with integer `p = α(T) − 2`, if `x(T) + 2 ≤ p`, where
`x(T)` is the least `k` with `Δ_k(T) = i_{k+1}(T) − i_k(T) < 0`, then `α(T) ≥ 7`.**

The Lean binding is `E993HighTail.interiorEligibilityAlphaGeSeven`. Its hypotheses are
`hT : G.IsTree` and `hInterior : C5LA1.crossingIndex G + 2 ≤ G.indepNum - 2`, in ℕ, and its conclusion is
`7 ≤ G.indepNum`. The statement text's SHA-256 is `16f7270f20ee1f5980d1381a2297a3ea3460caf934ad0b7cc6d48299b15eac07`.
I recomputed it and found the text byte-identical, once each, in the synthesis, `SOLUTION-CONTRACT.md` §2, the formalizer
brief §2, `INFORMAL-PROOF.md` and `Main.lean`.

## Claim Ledger

Notation: `n = |V|`, `m = |E|`, `α = G.indepNum`, `i_k = C5LA1.indepSetCount G ∅ k`,
`Δ_k = C5LA1.forwardDifferenceDel G ∅ k` (in ℤ), `x = C5LA1.crossingIndex G`, and `D = Σ_u C(deg u, 2)`.
"Run entry" is the registrar index in this run; "orig" is the first-interior index.

### Definitions (checked literally against `Main.lean` and byte-for-byte against the frozen first-interior fragments)

| ID | Claim | Evidence | Verdict |
|---|---|---|---|
| D1 | `indepSetsAvoiding G D k` is the `k`-subsets of `univ \ D` that are independent (orig 10) | Lean text read; fragment `ac0e331e…` byte-identical to frozen | verified |
| D2 | `i_k = indepSetCount G ∅ k` is the number of independent `k`-subsets of `V` (orig 11); it is `0` above `α` | Lean text; also `hzero` inside orig 14 | verified |
| D3 | `Δ_k = (i_{k+1} : ℤ) − i_k` (orig 12); no truncation, since the cast precedes the subtraction | Lean text | verified |
| D4 | `x = Nat.find (k ↦ Δ_k < 0)`, the least strict descent (orig 14); it exists because `Δ_α = −i_α < 0`; a plateau is not a descent. It matches the informal "least `k` with `Δ_k < 0`" | Lean text; my evaluator's `crossing_index` implements the same rule | verified |
| D5 | `α = G.indepNum = sSup {n ∣ ∃ s, G.IsNIndepSet n s}` (Mathlib `Clique.lean:983`); `exists_isNIndepSet_indepNum` (`:997`) and `IsIndepSet.card_le_indepNum` (`:991`) are used | Mathlib source read | verified |
| D6 | `IsTree` is a structure extending `Connected` with `isAcyclic` (`Acyclic.lean:60`); `IsTree.card_edgeFinset : #E + 1 = card V` (`:296`); `IsAcyclic.cliqueFree (3 ≤ n)` (`:659`) | Mathlib source read | verified |
| D7 | G1 `indepCount`/`coeff`/`delta` (orig 15–17), bridged to `i_k` and `Δ_k` by `count_bridge`/`delta_bridge` | Lean text; bridges read | verified |
| D8 | All 40 carried fragments (orig 1–17, 19–40, 43 → run 1–40) are byte-identical to the frozen first-interior fragments and appear verbatim in both `Main.lean` files. Registrar digests equal the frozen `FORMALIZATION-STATE.json`, names and kinds agree, and the only text outside the entry markers is `import Mathlib` and the generator comment | `carry_check.py` → `ALL CARRIED OK True` | verified |

### Inference steps (the carried entry 43 and its 20 `Guard` helpers, and the terminal wrapper)

| ID | Claim (hypotheses where they enter) | Evidence | Verdict |
|---|---|---|---|
| S0 | **Guard ⇒ `α ≥ 4`.** If `α ≤ 3` then `α ∸ 2 ≤ 1 < 2 ≤ x + 2`. *`hInterior` enters.* | Grid: ℕ guard false for every `α ≤ 3`, `x ≤ 60` | verified |
| S0′ | **ℕ/ℤ equivalence.** `x + 2 ≤ α ∸ 2 ⇔ x + 2 ≤ α − 2` in ℤ for every `α`. When `α < 2`, the ℕ side is `0`, the ℤ side is negative, and `x + 2 ≥ 2`, so both are false; when `α ≥ 2` they are identical | Grid `α, x ∈ [0,60]`: 3,721 pairs, all equivalent; also asserted on every enumerated tree | verified |
| S1 | **`n ≥ α + 1`** (`order_ge_alpha_succ`, needs `2 ≤ α`). If `n ≤ α`, a maximum independent set is `V`, so `m = 0`, so `n = 1` by `card_edgeFinset`, contradicting `α ≥ 2`. *`hT` enters through `card_edgeFinset` (connectivity, with acyclicity inside that lemma).* Hence `n ≥ 5` | Lean body read; 0 violations on 32,508 trees | verified |
| S2 | **`Δ_x < 0`** (`crossing_negative`: `Nat.find_spec`) | Lean body read | verified |
| S3 | **`Δ_0 = n − 1 ≥ 0`** (`i_0 = 1`, `i_1 = n`; the lemma requires `2 ≤ n`, which S1 supplies). No graph hypothesis | identity `i0=1`, `i1=n`, `Δ0=n−1` on 32,508 trees | verified |
| S4 | **`α = 4` excluded.** The guard gives `x + 2 ≤ 2`, so `x = 0`, and S2 contradicts S3 | Grid: `α = 4` admits only `x = 0` | verified |
| S5 | **`i_2 + m = C(n,2)`** (orig 25; no acyclicity needed) and, for a tree, `m = n − 1`, so `Δ_1 = C(n−1,2) − n = C(n,2) − 2n + 1`. The value at `n = 6` is `4`, and `Δ_1 ≥ 0` for `n ≥ 6`. *`hT` enters through `card_edgeFinset` only* | identities on 32,508 trees; grid `n ≤ 400`; values at `n = 4, 5, 6` are `−1, 1, 4`; Lean auxiliary `(n−5)(n+1) ≥ 0` holds for `n ≥ 6` | verified |
| S6 | **`α = 5` excluded.** `x ≤ 1`; `n ≥ 6` by S1; `Δ_0, Δ_1 ≥ 0` contradict S2 | Grid: `α = 5` admits only `x ∈ {0,1}` | verified |
| S7 | **Triple identity** (orig 31–34, `hF : IsAcyclic`): for acyclic `G`, `i_3 + m(n ∸ 2) = C(n,3) + D`. The per-triple local identity `[B indep] + #edges(B) = 1 + Σ_{a∈B} C(deg_B a, 2)` holds for 0, 1 or 2 edges and fails only for a triangle, which `cliqueFree 3` excludes. *Acyclicity enters here.* | identity on 32,508 trees; `K_3` gives `3 ≠ 4` (fails without acyclicity) | verified |
| S8 | **`6Δ_2 = (n−1)(n−2)(n−9) + 6D`** for a tree. By algebra, `(n−1)[n(n−2) − 3n − 6(n−2) + 6] = (n−1)(n²−11n+18)` | recomputed by hand and on 32,508 trees (exact) | verified |
| S9 | **`n ≥ 9` branch**: both terms are `≥ 0` (`delta_two_nonneg_large`; uses `card_edgeFinset` and `hT.isAcyclic` → orig 34; `((n−2 : ℕ) : ℤ) + 2 = n` needs `n ≥ 2`, and `n ≥ 9` holds) | grid `n ∈ [9,400]` | verified |
| S10 | **`n = 7`, `α = 6`**: `Δ_2 = −10 + D`. The complement of a maximum independent 6-set is `{u}`, every edge meets `u`, and `m = 6`, so `deg u ≥ 6` and `D ≥ C(6,2) = 15` (`cover_degree_one`, `choose_ge_fifteen`, `choose_degree_one_le_sum`; *`card_edgeFinset` and orig 34 with `hT.isAcyclic`*) | Exhaustive: the only tree is `K_{1,6}`, with `D = 15`, `Δ_2 = 5`, so the bound is tight; `C(5,2) = 10 < 15` shows `d ≥ 6` is needed | verified |
| S11 | **`n = 8`, `α = 6`**: `Δ_2 = −7 + D`. A two-vertex cover `{u ≠ w}` of `m = 7` edges gives `deg u + deg w ≥ 7`, so `D ≥ C(d,2) + C(e,2) ≥ 9` (`cover_degree_two`, `choose_pair_ge_nine`, `choose_degree_two_le_sum`, which uses `u ≠ w`; *`card_edgeFinset` and orig 34*) | Exhaustive: 5 trees, `D ∈ {16,13,12,12,10}`, `Δ_2 ∈ {9,6,5,5,3}`; minimum cover-degree sum is 7 or 8. `min C(d,2)+C(7−d,2) = 9`; at `d + e = 6` the minimum is `6 < 9`, so the hypothesis is needed | verified |
| S12 | **`α = 6` excluded.** `x ≤ 2`, `n ≥ 7`, the split `n ≥ 9` or `n ∈ {7,8}` is exhaustive, and `Δ_0, Δ_1, Δ_2 ≥ 0` contradict S2 | Grid: `α = 6` admits only `x ∈ {0,1,2}` | verified |
| S13 | **Conclusion** `α ≥ 7` (`by_contra`: `α ≤ 6` together with S0 leaves `{4,5,6}`) | case split read | verified |
| S14 | **Terminal wrapper.** `E993HighTail.interiorEligibilityAlphaGeSeven := E993Interior.eligibleAlphaGeSeven G hT hInterior`. Entry 43's statement text equals the terminal's except for the keyword and name (`lemma eligibleAlphaGeSeven` vs `theorem interiorEligibilityAlphaGeSeven`), so the hypotheses match one-for-one. The declaration (280 B, `899e87a4…`) is byte-identical to U's adjudicator's base candidate `1ef28389…`. It is a new name, not a byte-identical re-export, and the face says so | `carry_check.py`, `stmt_presence.py` | verified |

### Hypothesis map and non-dependencies

- `hT`, connectivity: enters only via `IsTree.card_edgeFinset`, in S1, S5, S9, S10, S11 and the cover-degree lemmas. This
  matches the contract and `INFORMAL-PROOF.md` §3.
- `hT`, acyclicity: enters via `hT.isAcyclic` → orig 34 in **all three** `Δ_2` branches (S9–S11), and inside
  `card_edgeFinset`. This matches the correction by C-T1-F F4, C-T1-U F2 and T's adjudicator.
- `hInterior`: enters in S0 and in the three bounds on `x` (S4, S6, S12).
- **Checked non-dependencies.** I scanned every entry the proof uses (orig 10–12, 14–17, 19–40, 43 and the terminal) for
  names from orig 1–9 and 13, for `IsBipartite`/`isBipartite` and for `taggedFamily`. I found no constant reference.
  - The only match is the line `open SimpleGraph C4LA1` in orig 10–12 and 14. It needs the namespace `C4LA1` to exist,
    which is syntactic, not mathematical.
  - The contract's "not used by this statement or its proof" for entries 1–9 and 13 and for `IsBipartite` is therefore
    correct at the level of mathematical dependency.
  - Carried lemmas orig 35–38 are also unused by entry 43. No face claims they are used.
- **Cast audit.** There are three truncated ℕ subtractions: the guard's `α − 2` (S0′); `(n − 2 : ℕ)` in orig 34, used
  only where `n ≥ 7`; and `n − 2` in orig 29, an identity valid for every `n` because a graph with `n < 2` has no edges.
  None truncates on the path of the proof.

## Reproduced Mathematical Evidence

My instruments, all written from scratch, use only the standard library, record their import lists in their headers and
write no wall-clock fields. They live under `scratchpad/c1-s7-informal-LA3/`:

| File | SHA-256 | Role |
|---|---|---|
| `elig_audit.py` (imports `itertools, json, math, sys`) | `4e5a5da1af805b6c8a1c6239c320ca36dc7bbcaaad46e85d5ea758006f16bd69` | main evaluator |
| `elig_audit.out.json` | `c2d40fd757f601a66ea8db781a66442fb434491fd1b79870e753beb4809455fa` | its output; replayed twice with byte-identical results |
| `carry_check.py` / `.out.txt` | `684a9d58…07fa` / `a336ac6e…c05f` | carry and byte-identity check |
| `stmt_presence.py` / `.out.txt` | `bf0a876c…9f22` / `45c23cd9…3b5b` | statement-text presence |
| `claim_sha.py` / `.out.txt` | `d5ec682e…90b2` / `c8e72eac…fb2a5` | claim and statement digests |
| `r25_g1_compare.py` / `.out.txt` | `c4148943…55c9a1` / `118b5e35…f759` | G1 comparison against r25 (finding F1) |

1. **Exhaustive finite verification of the theorem.** This is independent of the proof.
   - A tree is bipartite, so `α ≥ ⌈n/2⌉`. I asserted this on every enumerated tree. So `α ≤ 6` forces `n ≤ 12`, and the
     largest order with `α ≤ 6` found is 12.
   - I enumerated every free tree of order ≤ 12 (987 classes; A000055 matched at every order) and computed `i_k` two ways:
     tree DP and brute-force subset enumeration. The two agreed on all 987 trees.
   - **No tree with `α ≤ 6` satisfies the ℕ guard.** Through order 16 (32,508 classes) the ELIG-eligible trees number
     29,181, with 0 failures and minimum eligible `α = 7`.
   - Cumulative eligible counts are 5 (order 9), 31, 102, 361 (order 12), 1,339 (13), 4,123 (14), 10,563 (15) and
     29,181 (16). These reproduce the synthesis figures (361, 1,339, 29,181), C-T1-F's 4,123 and C-T1-U's
     `5 + 26 + 71 + 259 = 361`.
2. **Sharpness of `7`.** The bound cannot be raised: the smallest eligible tree with `α = 7` has order 9.
   - Witness: a vertex of degree 6 whose neighbour carries two pendant leaves.
   - Its counts are `i = (1,9,28,46,45,26,8,1)` and `Δ = (8,19,18,−1,…)`, so `x = 3`.
   - Then `x + 2 = 5 = α − 2`: the tree is eligible at exactly `α = 7`.
   - This matches the synthesis's "order-9 ELIG-eligible trees" non-vacuity note.
3. **Proof identities as integer statements, on all 32,508 trees:** `i_0 = 1`; `i_1 = n`; `i_2 + m = C(n,2)`;
   `i_3 + m(n∸2) = C(n,3) + D`; `Δ_0 = n − 1`; `Δ_1 = C(n−1,2) − n`; `6Δ_2 = (n−1)(n−2)(n−9) + 6D`. That is 227,556 checks
   with 0 failures. For every tree with `α ∈ {4,5,6}` (15, 52 and 203 trees), the `Δ`s each case needs are `≥ 0`.
4. **Lemma-level grid** (`n, d ≤ 400`; pairs `d, e ≤ 120`): `scaledChooseTwo/Three`, `degreeDefect_nonneg`,
   `choose_ge_fifteen` (`d ≥ 6`), `choose_pair_ge_nine` (`d + e ≥ 7`, minimum exactly 9), `Δ_1 ≥ 0` for `n ≥ 6`, and
   `(n−1)(n−2)(n−9) ≥ 0` for `n ≥ 9` all hold. The constants are `−60/6 = −10` (`n = 7`) and `−42/6 = −7` (`n = 8`).
5. **Failures outside the stated hypotheses.** Each hypothesis-dependent step fails when its hypothesis is removed:
   - **Triangle `K_3`, acyclicity dropped:** `i_3 + m(n−2) = 3`, but `C(3,3) + D = 4`.
   - **`P_7` and `P_8`, trees with `α = 4`, cover step unavailable:** `Δ_2 = −5` and `−1`. The `α = 6` cover step is
     load-bearing in the `n ∈ {7,8}` branches.
   - **Order-4 trees, `n ≥ 6` dropped:** `Δ_1 = −1`. The order bound in `delta_one_nonneg` cannot be dropped to 4.
     The record does not claim `6` is sharp: `n = 5` gives `+1`.
   - **The tree hypothesis dropped:** the conclusion itself fails. The split graph `K_6 ∨ 5K_1` has `n = 11` and
     `i = (1,11,10,10,5,1)`, so `α = 5` and `x = 1`. The ℕ guard `3 ≤ 3` holds, yet `α = 5 < 7`.
   - **Scope note on connectivity, not a defect:** I enumerated all 1,961 forests of order ≤ 12 with two or more
     components. 991 are eligible and none has `α < 7`. Every bipartite graph with `α ≤ 6` has `n ≤ 12`, so the
     conclusion also holds on every finite forest. Connectivity is load-bearing for this proof's route (`m = n − 1`),
     not for the truth of the statement. The award claims only trees, and nothing on its face says otherwise.

## Independent Critic Pass

I ran a second, adversarial pass over the unchanged ledger, trying to break each closed row:

- **Quantifier and definition fidelity.** Could "least `k` with `Δ_k < 0`" differ from `Nat.find` above `α`? No. Both
  count with `i_k = 0` beyond `α`, the first negative index is at most `α`, and my evaluator follows the same rule.
- **"Ordinary tree"** means Mathlib `IsTree` on a `Fintype`, not the governed RTree. `V` is nonempty by connectivity.
- **Exhaustiveness.** The split `α ∈ {4,5,6}` is exhaustive under `by_contra` and S0. The `n` split in S12 is exhaustive
  because S1 gives `n ≥ 7`. In S11, `u ≠ w` comes from `Finset.card_eq_two`. The bound in S11 does not double-count the
  edge `uw`; it only needs `|inc u ∪ inc w| ≤ deg u + deg w`.
- **Hidden hypotheses.** `delta_zero_nonneg` requires `2 ≤ n`, supplied by S1. `order_ge_alpha_succ` requires `2 ≤ α`,
  supplied by S0. No `IsBipartite`, `IsGraphLeaf`, rank variable `k`/`p`, or `1 ≤ k`, `k ≤ a`, `p ≥ 1`, `p ≥ 2` guard
  occurs. The face's "not applicable" entries are correct.
- **Two gaps in instrument 1, and how each is closed.**
  - The enumeration's completeness rests on distinct canonical forms plus the A000055 count at every order. Distinct
    canonical forms give pairwise non-isomorphic trees, and the known count then gives completeness.
  - The `n ≤ 12` coverage rests on `α ≥ ⌈n/2⌉`: a tree has a proper 2-colouring, and its larger colour class is
    independent.
  - So the exhaustive check is a genuine second proof route, not a sample.
- **Carry integrity.** I re-derived byte-identity from the frozen fragments themselves, not from the producer's
  `CAPSULE-VERIFICATION.json`. I also confirmed that entry 43 inside the frozen first-interior `Main.lean` equals the
  run's copy.
- **Challenge I could not dismiss (recorded as F1, non-blocking).** `INFORMAL-PROOF.md` §5 says the G1 definitions are
  "byte-identical to the r25 award". The r25 award's G1 entries 1–3 differ from first-interior entries 15–17 in
  whitespace only:
  - line breaks inside `def … {V : Type u}` and an extra blank line after `universe u`;
  - fragment digests differ (`f6bc96fd…` vs `5484fc21…`, `15ce5e34…` vs `21190043…`, `d7dc776c…` vs `bdb46014…`);
  - whitespace-normalised, the three are identical, so they elaborate to the same constants.

  The phrase originates in `SOLUTION-CONTRACT.md` §2, `SEMANTIC-CONTRACT.md` §1 and the synthesis `### C1-LA3`
  attribution. The award face inherited it.
  - The definitions of record for this award are the first-interior entries (brief §1), and those are byte-identical.
  - The attribution itself (r25 authored the G1 definitions) is correct.
  - F1 is therefore a provenance imprecision in governing and face prose, not a step of the proof. Its class is
    "imprecise but true under a charitable reading": the definitions are token-identical.
  - The controller may record a correction note ("token-identical; whitespace differs") without editing sealed text.
- **Out-of-scope observation (not part of the audited object).** `SEMANTIC-CONTRACT.md` §2's pre-run prior cites "976
  classes" of trees of order ≤ 12, but A000055 gives 987 (orders 1–12). This is a prior, not evidence, and it enters no
  proof. The same sentence's 361 eligible trees is reproduced exactly.

The critic pass agrees with the prover-side ledger on every mathematical row. No row changes verdict.

## Scope and Fence Check

- **Excluded conclusions.** The claim asserts no aggregate sign, no statement at any depth other than `p = α − 2`, and no
  no-recovery or unimodality claim. It does not re-certify `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`. The conclusion is
  exactly `7 ≤ G.indepNum`.
- **Fences.**
  - §3.1 (no status transfer to the listed keys or Erdős #993), §3.2 (the first-interior award is unchanged; the relation
    is a scope note), §3.5 (no census value, r27 root correction or r28 Hall/SDR route), §3.7 and §3.8 (separate
    certificate; entry 43 inside the first-interior package is context only) all appear on the contract face and in
    `INFORMAL-PROOF.md` §5.
  - `Main.lean` contains no census value, no lower-region statement and no `taggedFamily`, `aggregate` or selector use.
- **Attribution on the face.** The synthesis requires four attributions:
  - Codex (GPT-6): entry 43's proof and the proposed statement;
  - r25: the G1 definitions and the `Erdos993G1` counting layer as carried in the first-interior source;
  - r29: T1's extraction as corrected by C-T1-F, C-T1-U and T's adjudicator (acyclicity in all three branches);
  - U's adjudicator's recomputation.

  All four appear in `INFORMAL-PROOF.md` §5, in the contract's `informal_statement` scope text and in the rendered
  `EVIDENCE/THEOREM-CONTRACT.md`. The terminal text is attributed to U's adjudicator. The contract additionally credits
  r24 C4-LA1 / r26 for the definition layer, as `SEMANTIC-CONTRACT.md` §3 requires. The wording defect in "byte-identical
  to the r25 award" is F1.
- **Keywords and hygiene.** There is exactly one `theorem` (the terminal, placed last). There is no `sorry`, `admit`,
  `native_decide`, `axiom` or `decide` in the file. The only new declaration is the terminal application; nothing was
  re-derived. The kernel and axiom gates are outside this audit.

## Verdict

passed

`INFORMAL-PROOF.md` is a complete, correct statement-level proof of the intended claim, the contract's
`informal_statement`, `claim_sha256` `e841548d…9032f`. Every step is verified:
- every definition and inference step matches the Lean source, and every carried entry is byte-identical to the frozen
  first-interior fragment;
- every hypothesis enters where the face says;
- no ℕ subtraction truncates on the proof path;
- every identity was recomputed exactly;
- an independent exhaustive computation (all trees of order ≤ 12, which covers every tree with `α ≤ 6`) confirms the
  theorem, and an order-9 witness shows the constant 7 is sharp.

Non-blocking escalation for the controller: **F1**. The phrase "byte-identical to the r25 award" for orig 15–17 is
literally false. The definitions are whitespace-only variants (token-identical). The phrase is inherited from
`SOLUTION-CONTRACT.md` §2, `SEMANTIC-CONTRACT.md` §1 and the synthesis. It is a provenance correction record, not a proof
defect.
