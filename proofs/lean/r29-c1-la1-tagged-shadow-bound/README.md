# r29-c1-la1-tagged-shadow-bound

Declaration `E993HighTail.bipartiteTaggedShadowBound`, exported byte-for-byte from the sealed internal run
`erdos-993-high-tail-certification-dre-2026-09-25` (`runs/lean-2026-09-25-c1-la1-tagged-shadow-bound`; r29 — see
[`experiments/r29-high-tail-certification.md`](../../../experiments/r29-high-tail-certification.md)).
Award `C1-LA1`; registry effect `E993-BIPARTITE-TAGGED-SHADOW-BOUND (OPEN → VERIFIED)`.

Statement (the contract's `expected_statement`, namespace-relative):

```lean
theorem bipartiteTaggedShadowBound {V : Type*} [Fintype V] [DecidableEq V]
    (H : SimpleGraph V) [DecidableRel H.Adj] (hBip : H.IsBipartite) (W : Finset V) (k : ℕ)
    (hk : 1 ≤ k) (hka : k ≤ H.indepNum) :
    (k : ℤ) * (taggedFamily H Finset.univ W (k + 1)).card ≤
      2 * ((H.indepNum : ℤ) - k) * (taggedFamily H Finset.univ W k).card
```

Informal statement of record (the contract's `informal_statement`, verbatim; the scope fences and
attribution are part of it):

> For every finite type V ([Fintype V] [DecidableEq V]), every simple graph H on V with [DecidableRel H.Adj] that is bipartite (H.IsBipartite), every tag set W : Finset V, and every natural k with 1 <= k <= H.indepNum: (k:Z) * q_{k+1} <= 2 * ((H.indepNum:Z) - k) * q_k in the integers, where q_j := (taggedFamily H Finset.univ W j).card is the number of independent j-subsets of V that meet W. Key E993-BIPARTITE-TAGGED-SHADOW-BOUND (TSB), r29 award C1-LA1 (canonical run id erdos-993-math-dre-20260925-r29-high-tail-certification); OPEN -> VERIFIED by this award only. N/Z equivalence: under hka : k <= H.indepNum the integer value (H.indepNum:Z) - k equals the cast of the natural truncated value H.indepNum - k (Nat.cast_sub hka); the registry text (1 <= k <= a, integers) and the Lean text agree on this domain. Hypothesis consumption: hBip is consumed at entry 41's Core.card_extension_le (the proper 2-colouring splits the addable set into two colour classes); hk : 1 <= k is statement scope (passed to entry 41, whose body does not use it); hka is consumed by Nat.cast_sub. Fences: SOLUTION-CONTRACT 3.1 (a statement about independent-set counts on finite bipartite graphs; not a no-recovery statement; no status transfer to E993-R25-UNR-FOREST-WIDE, E993-G1WIDE-NO-SIZE-CAP, NR1, FOREST, TREE, TRANSFER, E993-BETA-AGG or Erdos #993); 3.4 (this is NOT E993-C3-G1-POINTWISE-ADDABILITY-BOUND, which stays REFUTED and is neither reopened nor aliased); 3.7 (attribution on every face); 3.8 (a separate certificate; entry 41's presence inside the first-interior package is context, never a certificate). Excluded conclusions: no leaf, tree, selector or aggregate statement; no k = 0 or k > a clause in the terminal theorem (the N companion without k <= a is a lemma only); no tightness claim; nothing about non-bipartite graphs (false there, B4: K_1 disjoint-union K_5); no reopening or aliasing of the refuted addability bound. Attribution: Codex (GPT-6 Luna/Sol/Astra) for the tagged-shadow mechanism, entry 41 and the proposed statement (Sol's C2 scope audit); the first-interior award source for the definition of entry 18; r29 T1 (registry derivation), C-T1-F and C-T1-U (the Nat.cast_sub hka narrowing), U1 (scratch compile), C-U1-T and C-U1-F (carry sets, candidates), U's adjudicator (base candidate; the bodies of the companion lemma and the terminal theorem are adjudicator-authored and transported byte-identically), F1, C-F1-T and C-F1-U (falsification, tightness). Governing text: cycles/cycle-1/stage6/SYNTHESIS.md, ## Lean awards, C1-LA1.

Toolchain: Lean `leanprover/lean4:v4.32.2`, Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c` (pinned in
`source/lakefile.toml` and `source/lake-manifest.json`; the package cache is not shipped — bind a local
Mathlib checkout at that revision, never `lake update`). Axioms exactly `[propext, Classical.choice,
Quot.sound]`; no `sorry`/`admit`/`native_decide`. Every definition of record in the source is a byte-identical
registrar carry of the verified first-interior award source. Governed workflow: frozen theorem contract
(`THEOREM-CONTRACT.yaml`, rendered `THEOREM-CONTRACT.md`), independent informal proof-integrity audit
(`INFORMAL-AUDIT.md`; the formalizer's `INFORMAL-PROOF.md`), kernel/axiom receipt and independent
statement-fidelity attestation (`FIDELITY-REVIEW.md`, verdict `passed`), canonical close
(`VERIFICATION-REPORT.md`, `formally_verified`). Digests and verdicts are in `receipts/RECEIPT-SUMMARY.json`;
full receipts stay in the sealed internal run. Internal grade `formally_verified`; published as `verified`.
Claim boundary: Lean kernel validity plus independent statement fidelity for exactly the stated declaration —
a counting/sign statement about independent sets of finite bipartite graphs or trees at the stated ranks; nothing about
the lower region `3p < 2α + 1`, `E993-BETA-AGG`, no-recovery, NR1, FOREST, TREE, TRANSFER, or Erdős #993.
