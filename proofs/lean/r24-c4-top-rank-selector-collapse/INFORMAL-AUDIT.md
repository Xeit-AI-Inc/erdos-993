---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: 01a0a742-4790-7180-9af5-89d57a076328
critic_id: c4-la1-terra-informal-20260915
attestation_id: c4-la1-informal-pass-20260915
claim_sha256: f0c0201302d47bb8eebd8fc44cdf160f603237f37f27ba97e3ad6f0fc5d93484
---

# Informal Proof Integrity Audit

## Intended Claim

For a finite simple literal tree `G`, an original vertex `v`, `2 <=
G.indepNum`, and `v` a unique-neighbor leaf, the exact conclusion is

```text
IsFavorableAt G v (G.indepNum - 1),
```

that is,

```text
i_alpha(G-v) < i_(alpha(G)-1)(G-v),
```

or equivalently the integer forward difference at `p = alpha(G)-1` is
strictly negative. This is the awarded top-rank selector-collapse theorem
only. It does not assert a top-rank aggregate sign, a residual inequality or
classification, the full interior-window statement, semantic transport,
governed `RTree`, `E993-BETA-AGG`, or Erdos #993.

## Source Hashes

All hashes below were recomputed with SHA-256 during this audit.

| source | sha256 |
|---|---|
| `control/c4-stage7-capsules/C4-LA1-PACKET-MANIFEST.json` | `8eacf3713064c12e136b0578a753219fe5986c48b414d50dfd34b2b1a4f40bd3` |
| `control/C4-STAGE6-PACKET-MANIFEST.json` | `d8e9a0f21871c43f48606ef6c78956a11307e1cbb7c1499a3dd20af516498b4e` |
| `control/C4-STAGE7-PROTOCOL.md` | `6b20c3acf3632d558030a4c4580e5b2de7ad43ea997df2d2196eb56a6dafc747` |
| `control/c4-stage7-capsules/PATH-CHECK-C4-LA1.json` | `1a99d2a473e1cf6c149c10debbd3e6c27465f59053b030bf7b1688d5497781f0` |
| `cycles/cycle-4/stage3/returns/F7/RETURN.md` | `a22309c0e16206fb0b985391e1c23d653392733e27a995b752c12717573bde06` |
| `cycles/cycle-4/stage4/critics/F7/T/CRITIQUE.md` | `e733db48f52a841401abce6262c1ed0568417c8b0c3c9ed236c20aa26a085bf2` |
| `cycles/cycle-4/stage4/critics/F7/U/CRITIQUE.md` | `09ef2f03bd51c74d3338fb68af2292c1a0904ba377f451396e2819cd8cd0cd36` |
| `cycles/cycle-4/stage5/adjudicators/F/ADJUDICATION.md` | `a4463d3a7e52492c1e1a6e0b8c6226d4932a101ca22aa68fc3e0d7a69d15e7a2` |
| `cycles/cycle-4/stage6/SYNTHESIS.md` | `a447703596340b4e754e79edaa7221a0b5b4048abd0c8efbcab3d59ad42f0fe9` |
| `INFORMAL-PROOF.md` | `0801e6cbb455c349a204419400df6e80ef7be3d16e915d57ea3b5299f3a42418` |
| `THEOREM-CONTRACT.yaml` | `9faa81ad73f1dec562b84a8c9a3173ff2b1565ff4b3f80c350d6f297d3358090` |
| `LeanProject/LeanProof/Main.lean` | `e2bc48690fe44b769687461ac8bfad867b6710cca93c6de81bd1ac7ad05d253a` |
| `RECEIPTS/kernel-verification.json` | `760881ace78c6f74ae1c2f1252bbc9c3f4887c4c5360cd92ea445d5c9310644c` |
| `RECEIPTS/reviewer-assignment.json` | `258b3ed840b9098c3887225bd701638a628202a54089ed81be20378421d8d60f` |

The eight manifest-member hashes match the manifest declarations. The source
hash for `Main.lean` also matches the receipt's before and after source hash.

## Reproduced Mathematical Evidence

Let `a = alpha(G)` and let `u` be the unique neighbor of leaf `v`.

1. Any independent `a`-set avoiding `v` contains `u`: otherwise adjoining
   `v` preserves independence and creates an independent set of size `a+1`.
2. A maximum independent set containing `v` exists. Starting from any maximum
   independent set, retain it if it contains `v`; otherwise it contains `u`
   by step 1, and replacing `u` by `v` preserves independence and size.
3. Let `A` be independent `a`-subsets avoiding `v`, and `B` independent
   `(a-1)`-subsets avoiding `v`. Every member of `A` contains `u`, so erasure
   of `u` injects `A` into `B`.
4. Let `M` be a maximum independent set containing `v` and put
   `H = M \\ {v}`. Then `H` is in `B`; it avoids `u`, and it is nonempty
   because `a >= 2`. If `H` is outside the image, the injection is proper. If
   it has preimage `S`, then `S = H union {u}` is independent. Choosing
   `w in H`, the set `(H \\ {w}) union {u}` is an independent member of `B`
   but cannot be an image, since all images omit `u`. Thus the injection is
   proper in either case.
5. Hence `|A| < |B|`, exactly
   `i_a(G-v) < i_(a-1)(G-v)`. Casting the natural counts to integers gives
   the required strict negative forward difference.

This independently establishes the claim without using the recorded Lean
compilation as proof of mathematical fidelity.

## Independent Critic Pass

- **Coefficient fidelity: PASS.** `vertexDeletionIndepSetCount G v k` counts
  exactly the independent `k`-subsets of the original finite vertex type that
  avoid `v`. This is in bijection with independent `k`-sets of the induced
  vertex-deletion graph `G-v`; no placeholder or isolated deleted vertex is
  counted.
- **Leaf semantics: PASS.** `IsGraphLeaf G v := exists unique u, G.Adj v u` is
  exactly the degree-one, unique-support condition for a `SimpleGraph`.
- **Nat boundary: PASS.** `hAlpha : 2 <= G.indepNum` makes
  `G.indepNum - 1 >= 1`, so `(G.indepNum - 1) + 1 = G.indepNum` and no
  predecessor underflow is hidden. It also makes `H` nonempty, which is
  precisely what the strictness construction needs. The final Lean rewrite
  uses this equality explicitly.
- **Strict inequality: PASS.** The formal proof proves a proper finite-set
  inclusion, not merely non-strict coefficient monotonicity. The constructed
  `K` witnesses the missing lower-layer element in the only remaining case.
- **Graph hypotheses: PASS.** The declaration quantifies over a finite simple
  graph with decidable adjacency, retains `G.IsTree`, requires
  `2 <= G.indepNum`, and uses the original vertex `v` with the exact leaf
  predicate. No family restriction or extra mathematical assumption is added.
- **Proof implementation: PASS.** The support-forcing lemma, exchange lemma,
  erasure inclusion and injectivity, lower-layer witness, cardinal comparison,
  integer cast, and final rank rewrite are all valid. The direct finite-set
  implementation faithfully realizes the recurrence/downward-closure argument
  from the awarded proof.

### Findings

1. **Non-blocking strengthening.** `G.IsTree` is syntactically retained in
   `C4LA1.topRankSelectorCollapse` but is not used by the proof. The argument
   is valid for the stronger class of finite simple graphs having a
   unique-neighbor leaf and `alpha >= 2`. The intended finite-tree theorem is
   therefore a direct faithful corollary, not a weakened or substituted claim.
2. **No blocking finding.** The formal declaration, coefficient semantics,
   strict selector, alpha-minus-one boundary, and stated scope agree with the
   C4-LA1 contract and packet award. Kernel verification is corroborating
   evidence only: the PASS above follows from the independent derivation and
   source-level audit, not from successful compilation alone.

## Verdict

verdict: **PASS**

ready_for_fidelity_review: **YES**

The exact C4-LA1 theorem is ready for the assigned independent fidelity review.
This audit neither grants that later fidelity verdict nor closes the Stage 7
workflow.
