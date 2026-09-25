# r29 — The High-Tail Mechanism, Certified

Chartered by Ashton on 2026-09-25 from a Codex (GPT-6) prompt, as a separately governed successor to the
[first-interior aggregate experiment](first-interior-aggregate.md). That experiment formally verified one statement —
the exact favorable-leaf aggregate at `p = α(T) − 2` on eligible trees — through a rank-uniform mechanism: on a
bipartite graph `H` with a tagged vertex set `W`, every tagged independent `(k+1)`-set has at least `k` tag-preserving
deletions and every independent `k`-set has at most `2(α(H) − k)` addable vertices (its addable set splits into two
colour classes, each of which can be adjoined), so `k·q_{k+1} ≤ 2(α − k)·q_k`. Applied to `H = G − {v, s}` for a leaf
`v` with support `s`, this signs the leaf's term whenever `3p ≥ 2α + 1`. The mechanism lived inside the award as
compiled internal lemmas that had received no certificate; three registry keys stood OPEN as proposals and the top-rank
consequence had no key. r29's assignment was extraction and certification, not search.

Internal run `erdos-993-high-tail-certification-dre-2026-09-25`: 4 routes / 8 cross-orientation critics / 3 isolated
adjudicators / 1 neutral synthesis / governed Lean awards / three isolated second reads (routes Claude Sonnet 5 xhigh;
critics Claude Opus 5.5 medium; adjudicators, synthesis, formalizers, reviewers and readers Claude Opus 5.5 high), up
to six cycles with early stop. was met in Cycle 1; the run closed after one cycle Terminal manifest `e4d7ede0233d1be72c103b0b91c0bc7cf83e6ecd96e511c320003f5b169ab355`; controller review
[`CONTROLLER-REVIEW-R29.md`](../runs/erdos-993-high-tail-certification-dre-2026-09-25/CONTROLLER-REVIEW-R29.md).

## Outcome

4 governed Lean package(s) closed `formally_verified`: `r29-c1-la1-tagged-shadow-bound` (`E993HighTail.bipartiteTaggedShadowBound` — E993-BIPARTITE-TAGGED-SHADOW-BOUND (OPEN → VERIFIED)); `r29-c1-la2-leaf-high-tail-pointwise` (`E993HighTail.bipartiteLeafHighTailPointwise` — E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE (OPEN → VERIFIED), with E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE as the companion lemma on its face); `r29-c1-la3-interior-eligibility-guard` (`E993HighTail.interiorEligibilityAlphaGeSeven` — E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN (OPEN → VERIFIED)); `r29-c1-la4-top-rank-nonresidual-aggregate` (`E993HighTail.topRankNonResidualAggregate` — E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE (new; VERIFIED formally_verified)).

**The tagged-shadow bound** is certified at registry scope: bipartite `H`, any `W`, `1 ≤ k ≤ α(H)`, in the integers.
It holds for every `k ≥ 0`, it is attained with equality on a perfect matching with one tagged vertex, and it fails
without bipartiteness (`K_1 ⊔ K_5`).

**The pointwise high-tail sign** is certified at every integer `p ≥ 1`. The previously open endpoint `p = 1` turned out
to need no new mechanism and not even bipartiteness: the guard `3 ≥ 2α + 1` forces `α = 1`, so the support's only
neighbour is the leaf and the two deletion sets coincide. Its aggregate corollary — the favorable-leaf sum is
nonpositive on every finite bipartite graph throughout the region, with the original strict selector — rides on the same
face. Every leaf-and-support deletion lowers the independence number by exactly one.

**The eligibility guard** `x + 2 ≤ α − 2 ⇒ α ≥ 7` is certified under its own contract: Codex's proof (the three
low-`α` exclusions by `Δ₀`, `Δ₁` and `Δ₂` counts) carried byte-identically.

**The non-residual top-rank corollary** is new: on trees with `p = α − 1`, eligibility alone gives `S(T, p) ≤ 0`.
Eligibility forces `α ≥ 4` (in fact eligible trees have `α ≥ 5`), which places the top rank inside the high-tail
region, so r26's residual hypothesis and its `α ≥ 2` are simply dropped — the same conclusion by a different mechanism.
r26 remains the proof of record on the residual class. The conclusion holds on every finite bipartite graph.

**The boundary is sharp.** The critics settled a question the falsification route had left open: for every `α ≥ 2`
there is a tree of order `2α` (a spider with `α − 1` legs of length 2 plus a pendant leaf, or a path with `α − 2`
pendant edges hung on one vertex) with a strictly positive leaf term at `p = ⌊2α/3⌋`, one rank below the guard. So the
largest rank at which a leaf term can be positive on a tree is exactly `⌊2α/3⌋`, and the guard `3p ≥ 2α + 1` cannot be
relaxed. This is registered as a record about precision; it refutes nothing in scope.

**What is NOT closed.** The all-rank favorable-leaf aggregate stays OPEN: r29 closes every eligible rank with
`3p ≥ 2α + 1` (which contains the top rank and the first interior rank); the open remainder is exactly the eligible
ranks `x + 2 ≤ p ≤ ⌊2α/3⌋`, where the leafwise sign fails and a compensation argument is needed — Codex/Astra's
proposed parallel experiment, untouched here. Nothing here is a no-recovery statement; `E993-BETA-AGG`, NR1, FOREST,
TREE, TRANSFER and Erdős #993 are untouched.

## Process

Every stage sealed by canonical-JSON SHA-256 manifests; per-seat sealed capsules; the second reads run concurrently
with Stage 7; every award a single self-contained Lean file carrying the first-interior definitions of record through
the registrar byte-identically; a residue check of cloned control files before the first seal; integrity sweep at the
close. Errata R29-E-a…d and incident R29-I-1 (a sealed digest record edited by the controller, restored byte-exact within
minutes) are on the record. Master registry 415 identities after publication. Verification record:
[`evidence/verification-2026-09-25-r29.md`](../evidence/verification-2026-09-25-r29.md).
