# r28-c1-la5-btp-second-proof-on-class

Declaration `Erdos993G1.forest_degree_lemma_on_pathlike_branch_trees`, exported byte-for-byte from the sealed internal run
`erdos-993-degree-lemma-hall-sdr-dre-2026-09-24` (`runs/lean-2026-09-25-c1-la5-btp-second-proof-on-class`; r28 — see
[`experiments/r28-degree-lemma-hall-sdr.md`](../../../experiments/r28-degree-lemma-hall-sdr.md)).
Award `C1-LA5`; registry effect `E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2 (Theorem BTP composed into a second proof of (DL) on the class; a scope note on E993-R27-FOREST-DEGREE-LEMMA)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem forest_degree_lemma_on_pathlike_branch_trees {X : Type u} [Fintype X] [DecidableEq X]
    (G : SimpleGraph X) [DecidableRel G.Adj] (hT : G.IsTree) (hB : BranchTreeMaxDegreeLeTwo G)
    (k : ℕ) :
    (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> Let G be a finite simple graph on a vertex type X that is a tree (G.IsTree), and suppose G is in the class BranchTreeMaxDegreeLeTwo: every vertex v with deg v >= 3 has at most two neighbours w from which some vertex z with deg z >= 3 is reachable in G - v (Lean: a walk w ~> z of G whose support avoids v; proved equivalent in-run to reachability in G.induce {v}ᶜ with z ≠ v, lemma branchTreeMaxDegreeLeTwo_iff_induce). Then for every k in N: D_k(G) <= 2k * i_k(G), i.e. (indepDegreeSum G k : Z) <= 2 * k * indepCount G k, where indepDegreeSum G k = sum over independent k-sets J of sum over v in J of deg v and indepCount G k = number of independent k-sets. Route (terminal proof): Theorem BTP — for every k an injection from the branch slots Σ v : {v // 3 ≤ deg v}, Fin (deg v − 2) into the leaves sending each slot of v to an own pendant leaf l of v with c_v(k) <= c_l(k) exists (lemma btp_sdr_exists; face lemma leaf_slot_dominance_on_pathlike_branch_trees), hence slotsAtLeast G k t <= leavesAtLeast G k t for every t : N including t = 0 (threshold_of_sdr) — composed with the carried C1-LA2 reduction dominance_implies_degree_lemma. No hypothesis n >= 2, k >= 1 or t >= 1. SCOPE: a byte-different second formal proof of (DL) ON THIS CLASS ONLY; registers as a scope note on E993-R27-FOREST-DEGREE-LEMMA (an alias distinction), never as a (DL) key; the formal (DL) of record is r27 C1-LA1 forest_degree_lemma, an input that is not edited. FENCES: NOT (HS) on all trees — (HS) tree_leaf_slot_dominance is FALSE (T22, SR-HS-REF); T22 (branch tree K_{1,3}) is outside the class, which is sharp for every branch-degree bound D >= 3; slot_leaf_sdr_exists and R28U2.tree_leaf_slot_dominance are never carried or used. NOT (DL) on all forests. Not (PW). No status transfer (SOLUTION-CONTRACT §3.1). ATTRIBUTION: C-T2-U (Theorem BTP); C-T2-F, C-F2-T, C-F2-U, C-T1-F (independent proofs); SR-BTP (repairs; canonical proof); U adjudicator (route U-BTP-CLASS-FORMAL); pendant-path lemma C-T1-U, C-T1-F, C-T2-U, C-T2-F, C-F2-T, C-F2-U (SR-PP), Lean text by the C1-LA4 formalizer (carried); (LC) U1 (seat), Lean text as assembled by the C1-LA2 formalizer (carried); common attribution (r27 C-T2-U Finding 6; r27 T adjudicator's 2 <= n correction; SR-JOIN; Fang–Lu–Nevo–Yao–Zheng 2026 §8). New Lean text (entries 6, 21–31) written in-run by c1-la5-formalizer-opus-20260925.

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in
`source/lakefile.toml` and `source/lake-manifest.json`; the package cache is not shipped — bind a local
Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice,
Quot.sound]`; no `sorry`/`admit`/`native_decide`. Governed workflow: frozen theorem contract
(`THEOREM-CONTRACT.yaml`, rendered `THEOREM-CONTRACT.md`), independent informal proof-integrity audit
(`INFORMAL-AUDIT.md`; the formalizer's `INFORMAL-PROOF.md`), kernel/axiom receipt and independent
statement-fidelity attestation (`FIDELITY-REVIEW.md`, verdict `passed`), canonical close
(`VERIFICATION-REPORT.md`, `formally_verified`). Digests and verdicts are in `receipts/RECEIPT-SUMMARY.json`;
full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration —
an order bound / counting statement on finite forests with sign `Δ_k ≥ 0` on its contrapositive; nothing about no-recovery, `E993-R25-UNR-FOREST-WIDE`, NR1, FOREST, TREE, TRANSFER, or Erdős #993.
