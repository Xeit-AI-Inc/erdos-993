# Verification record: r29 release, 2026-09-25

The source experiment is `erdos-993-high-tail-certification-dre-2026-09-25` (r29: certify the uniform high-tail
mechanism and its non-residual top-rank consequence; chartered from a Codex prompt). Terminal manifest `e4d7ede0233d1be72c103b0b91c0bc7cf83e6ecd96e511c320003f5b169ab355`.
Every stage was sealed by a canonical-JSON SHA-256 manifest and the controller's integrity sweep at the close
recomputed every manifest with zero unexpected mismatches. 4 governed Lean package(s) closed `formally_verified`: `r29-c1-la1-tagged-shadow-bound` (`E993HighTail.bipartiteTaggedShadowBound` — E993-BIPARTITE-TAGGED-SHADOW-BOUND (OPEN → VERIFIED)); `r29-c1-la2-leaf-high-tail-pointwise` (`E993HighTail.bipartiteLeafHighTailPointwise` — E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE (OPEN → VERIFIED), with E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE as the companion lemma on its face); `r29-c1-la3-interior-eligibility-guard` (`E993HighTail.interiorEligibilityAlphaGeSeven` — E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN (OPEN → VERIFIED)); `r29-c1-la4-top-rank-nonresidual-aggregate` (`E993HighTail.topRankNonResidualAggregate` — E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE (new; VERIFIED formally_verified)).

| Award | Terminal declaration | Registry effect | Main source SHA-256 | Fidelity receipt |
|---|---|---|---|---|
| `C1-LA1` | `E993HighTail.bipartiteTaggedShadowBound` | `E993-BIPARTITE-TAGGED-SHADOW-BOUND (OPEN → VERIFIED)` | `efafb79b0f33e1319c72d6d102d26212580110d76283c12edaad1938f97bb55c` | `1a414f28431cb0d6…` |
| `C1-LA2` | `E993HighTail.bipartiteLeafHighTailPointwise` | `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE (OPEN → VERIFIED), with E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE as the companion lemma on its face` | `d968eb56ec0dcab9ad96195a9adbaf0c0e515a073a2b5ba29131bed98c8fd496` | `73d954f6eb1ab900…` |
| `C1-LA3` | `E993HighTail.interiorEligibilityAlphaGeSeven` | `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN (OPEN → VERIFIED)` | `8d500fd7c6811e9a4ce560cbaeea6e6b16a208eebb925498618fb66ed133550b` | `ea22ed067b21e0ac…` |
| `C1-LA4` | `E993HighTail.topRankNonResidualAggregate` | `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE (new; VERIFIED formally_verified)` | `0c8037390b351effdef9f4f30f56b3341e852a10de0ffb80da7641403f24330b` | `ff29bb30ad6ff082…` |

Every package pins Lean `v4.32.2` and Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`; the only reported
transitive axioms are `propext`, `Classical.choice`, `Quot.sound`; no admitted declaration or native decision axiom.
Every Main file is byte-identical to the sealed internal run, and every definition of record in it is a byte-identical
registrar carry of the verified first-interior award source (`8d864da2…`; entries 1–44 as each award needs them; the
first-interior award's own terminal theorem, entry 45, is never carried). Verification reports: C1-LA1 `b21597ab9d783c91…`; C1-LA2 `47910b509d85d808…`; C1-LA3 `2f5cee601be3829c…`; C1-LA4 `f7504a694964582d…`.

**What the packages prove.** (1) The tagged-shadow bound: on a finite bipartite graph with any tagged vertex set,
`k·q_{k+1} ≤ 2(α − k)·q_k` for `1 ≤ k ≤ α`. (2) The pointwise high-tail sign: for an original leaf `v` with support `s`
of a finite bipartite graph and every `p ≥ 1` with `3p ≥ 2α + 1`, `Δ_{p−1}(G − {v, s}) − Δ_{p−1}(G − N[s]) ≤ 0`, with
the favorable-leaf aggregate `S(G, p) ≤ 0` as a companion lemma on the same face — no residual, selector or connectivity
hypothesis; the `p = 1` endpoint is new. (3) The eligibility guard: on trees, `x + 2 ≤ α − 2` forces `α ≥ 7`. (4) The
non-residual top-rank corollary: on trees with `p = α − 1`, `x + 2 ≤ p` alone gives `S(T, p) ≤ 0` — the same conclusion
as the r26 residual award with its two extra hypotheses dropped. None of this is a no-recovery statement; nothing
transfers to `E993-BETA-AGG`, the forest-wide no-recovery claim, NR1, FOREST, TREE, TRANSFER or Erdős #993; the lower
region `3p < 2α + 1` is untouched and is exactly the open remainder of the all-rank aggregate.

**Second reads.** Three isolated Opus 5.5 reads (SR-MECH, SR-TRN, SR-BOUNDARY) before registration of every statement
first made at a review stage: SR-MECH: SR-1 confirmed, SR-2 confirmed, SR-3 confirmed, SR-4 confirmed, SR-9 confirmed_with_repairs; SR-TRN: SR-5 confirmed, SR-6 confirmed_with_repairs, SR-7 confirmed_with_repairs; SR-BOUNDARY: SR-8a confirmed, SR-8b confirmed_with_repairs, SR-8c confirmed; their reports are mirrored under
`runs/erdos-993-high-tail-certification-dre-2026-09-25/`.

**Registry.** The master registry moves to 415 identities (251 VERIFIED, 92 REFUTED, 26 CONDITIONAL, 46 OPEN); the
three auxiliary keys change status only through their own awards; all prior objects preserved with statuses unchanged;
scope notes on six prior keys. Registry pin after publication `f5089e092692916c94897f27ed74cb55ac8047dc09beccff4444b03686445cae`; ledger `8269d0a850846e5ec682e905b7fa534f3cabbf133f1c09190861ae996b6a1d6b`. Statuses are registry
grades at their explicit evidence, not a count of theorems; no claim bears on Erdős #993.
