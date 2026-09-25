# Theorem Contract: Bipartite tagged-shadow bound (TSB), E993-BIPARTITE-TAGGED-SHADOW-BOUND, r29 award C1-LA1

- Contract ID: `erdos-993-r29-c1-la1-tagged-shadow-bound-v1`
- Schema: `theorem-contract/v1`
- Structural verdict: `valid_for_formalization`
- Formulation status: `established`
- Contract SHA-256: `32aa0f3bd021e4e58b5b35b52fc0b2dc44d4fe8ed6890e9b27a573320348b19e`
- Mathematical proof claim: `false`

> This view is generated from the canonical contract. Structural validity does not prove the theorem.

## Intended Theorem

For every finite type V ([Fintype V] [DecidableEq V]), every simple graph H on V with [DecidableRel H.Adj] that is bipartite (H.IsBipartite), every tag set W : Finset V, and every natural k with 1 <= k <= H.indepNum: (k:Z) * q_{k+1} <= 2 * ((H.indepNum:Z) - k) * q_k in the integers, where q_j := (taggedFamily H Finset.univ W j).card is the number of independent j-subsets of V that meet W. Key E993-BIPARTITE-TAGGED-SHADOW-BOUND (TSB), r29 award C1-LA1 (canonical run id erdos-993-math-dre-20260925-r29-high-tail-certification); OPEN -> VERIFIED by this award only. N/Z equivalence: under hka : k <= H.indepNum the integer value (H.indepNum:Z) - k equals the cast of the natural truncated value H.indepNum - k (Nat.cast_sub hka); the registry text (1 <= k <= a, integers) and the Lean text agree on this domain. Hypothesis consumption: hBip is consumed at entry 41's Core.card_extension_le (the proper 2-colouring splits the addable set into two colour classes); hk : 1 <= k is statement scope (passed to entry 41, whose body does not use it); hka is consumed by Nat.cast_sub. Fences: SOLUTION-CONTRACT 3.1 (a statement about independent-set counts on finite bipartite graphs; not a no-recovery statement; no status transfer to E993-R25-UNR-FOREST-WIDE, E993-G1WIDE-NO-SIZE-CAP, NR1, FOREST, TREE, TRANSFER, E993-BETA-AGG or Erdos #993); 3.4 (this is NOT E993-C3-G1-POINTWISE-ADDABILITY-BOUND, which stays REFUTED and is neither reopened nor aliased); 3.7 (attribution on every face); 3.8 (a separate certificate; entry 41's presence inside the first-interior package is context, never a certificate). Excluded conclusions: no leaf, tree, selector or aggregate statement; no k = 0 or k > a clause in the terminal theorem (the N companion without k <= a is a lemma only); no tightness claim; nothing about non-bipartite graphs (false there, B4: K_1 disjoint-union K_5); no reopening or aliasing of the refuted addability bound. Attribution: Codex (GPT-6 Luna/Sol/Astra) for the tagged-shadow mechanism, entry 41 and the proposed statement (Sol's C2 scope audit); the first-interior award source for the definition of entry 18; r29 T1 (registry derivation), C-T1-F and C-T1-U (the Nat.cast_sub hka narrowing), U1 (scratch compile), C-U1-T and C-U1-F (carry sets, candidates), U's adjudicator (base candidate; the bodies of the companion lemma and the terminal theorem are adjudicator-authored and transported byte-identically), F1, C-F1-T and C-F1-U (falsification, tightness). Governing text: cycles/cycle-1/stage6/SYNTHESIS.md, ## Lean awards, C1-LA1.

## Exact Lean Binding

- Project: `LeanProject`
- Source: `LeanProject/LeanProof/Main.lean`
- Declaration: `theorem E993HighTail.bipartiteTaggedShadowBound`
- Statement SHA-256: `87b98c294ccee3aaddf06cd0a52cbb0a65e6d8981a091a6f030b38fdf2eb9f68`

```lean
theorem bipartiteTaggedShadowBound {V : Type*} [Fintype V] [DecidableEq V]
    (H : SimpleGraph V) [DecidableRel H.Adj] (hBip : H.IsBipartite) (W : Finset V) (k : ℕ)
    (hk : 1 ≤ k) (hka : k ≤ H.indepNum) :
    (k : ℤ) * (taggedFamily H Finset.univ W (k + 1)).card ≤
      2 * ((H.indepNum : ℤ) - k) * (taggedFamily H Finset.univ W k).card
```

## Quantifiers

- `forall V` over `dom-v`
- `forall H` over `dom-h`
- `forall W` over `dom-w`
- `forall k` over `dom-k`

## Hypotheses

- `hyp-bip`: hBip : H.IsBipartite -- consumed at entry 41's Core.card_extension_le (obtain ⟨c⟩ := hBip; the 2-colouring splits the addable set E of an independent k-set A into two colour classes, each of which can be adjoined to A, so |E| ≤ 2(a − k)). The only place bipartiteness is used.
- `hyp-k-pos`: hk : 1 ≤ k -- statement scope: passed to the N companion and to entry 41 (taggedShadowBound), whose body does not reference it (Lean unused-variable linter at the carried fragment). Kept to match the registry text 1 ≤ k ≤ a.
- `hyp-k-le-alpha`: hka : k ≤ H.indepNum -- consumed by Nat.cast_sub hka in the terminal theorem: ((H.indepNum - k : ℕ) : ℤ) = (H.indepNum : ℤ) - k. N/Z equivalence: under hka the integer value α − k equals the natural truncated value α ∸ k.

## Conclusion

- `conclusion`: (k : ℤ) * (taggedFamily H Finset.univ W (k + 1)).card ≤ 2 * ((H.indepNum : ℤ) - k) * (taggedFamily H Finset.univ W k).card -- i.e. k·q_{k+1}(H, W) ≤ 2(α(H) − k)·q_k(H, W) over the integers.

## Dependencies

- `def-isindepset` -> `def-indepnum`
- `def-isindepset` -> `def-taggedfamily`
- `dom-v` -> `dom-h`
- `dom-v` -> `dom-w`
- `def-isbipartite` -> `hyp-bip`
- `dom-h` -> `hyp-bip`
- `dom-k` -> `hyp-k-pos`
- `def-indepnum` -> `hyp-k-le-alpha`
- `dom-h` -> `hyp-k-le-alpha`
- `dom-k` -> `hyp-k-le-alpha`
- `def-taggedfamily` -> `conclusion`
- `def-univ` -> `conclusion`
- `def-indepnum` -> `conclusion`
- `dom-w` -> `conclusion`
- `hyp-bip` -> `conclusion`
- `hyp-k-pos` -> `conclusion`
- `hyp-k-le-alpha` -> `conclusion`

## Axiom And Constructivity Policy

- Policy: `explicit_axiom_allowlist`
- Constructive proof required: `false`
- Permitted axioms: `propext`, `Classical.choice`, `Quot.sound`

## Source Evidence

- `src-base-candidate`: `SOURCE/ADJ-U-awards-LA1-Main.lean` (match)
- `src-brief`: `SOURCE/C1-STAGE7-FORMALIZER-BRIEF-LA1.md` (match)
- `src-capsule-manifest`: `SOURCE/C1-LA1-PACKET-MANIFEST.json` (match)
- `src-capsule-verification`: `CAPSULE-VERIFICATION.json` (match)
- `src-carried-entry18`: `LeanProject/LeanProof/Snippets/0001-definition-E993Interior-taggedFamily.lean.fragment` (match)
- `src-carried-entry41`: `LeanProject/LeanProof/Snippets/0002-lemma-E993Interior-taggedShadowBound.lean.fragment` (match)
- `src-carry-digests`: `SOURCE/c1-stage7-sources-SOURCE-DIGESTS.json` (match)
- `src-first-interior-main`: `SOURCE/first-interior-c2-primary-v2-Main.lean` (match)
- `src-informal-proof`: `INFORMAL-PROOF.md` (match)
- `src-new-companion`: `LeanProject/LeanProof/Snippets/0003-lemma-E993HighTail-bipartiteTaggedShadowBoundNat.lean.fragment` (match)
- `src-new-terminal`: `LeanProject/LeanProof/Snippets/0004-theorem-E993HighTail-bipartiteTaggedShadowBound.lean.fragment` (match)
- `src-semantic-contract`: `SOURCE/SEMANTIC-CONTRACT.md` (match)
- `src-solution-contract`: `SOURCE/SOLUTION-CONTRACT.md` (match)
- `src-synthesis`: `SOURCE/C1-SYNTHESIS.md` (match)

## Validation Notes

- Errors: none
- Warnings: none
