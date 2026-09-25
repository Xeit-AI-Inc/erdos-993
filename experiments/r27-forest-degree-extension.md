# r27 — Audit and Formalize the Finite Forest Degree/Extension Inequality

Chartered by Ashton on 2026-09-24 as the r26 review's recommended next experiment. Fang–Lu–Nevo–Yao–Zheng
(2026, arXiv:2609.20961v1, §8) prove, for finite forests, a degree lemma — the total degree over all
independent `k`-sets is at most `2k` times their number — and from it an extension inequality
`(k+1)·i_{k+1} ≥ (n − 3k)·i_k`, on the way to their asymptotic unimodality theorem. The charter: treat the
finite statements as inputs under attack, prove them in-run on the program's own definitions, formalize them,
derive the order-bound consequences the literature map had flagged (`Δ_k < 0 ⇒ n ≤ 4k`; `n ≥ 21 ⇒ Δ_5 ≥ 0`;
`x < r ⇒ n ≤ 4r − 4`), close out the r25 rank-5 residue dependency by dependency, and audit the authors'
Lean development without copying it (no license in the audit copy). The asymptotic `N₀` was out of scope.

Internal run `erdos-993-forest-degree-extension-dre-2026-09-24`: 9 routes / 18 cross-orientation critics /
3 isolated adjudicators / 1 neutral synthesis / four governed Lean awards / four isolated second reads
(routes Claude Sonnet 5 xhigh; critics Claude Opus 5 medium; adjudicators, synthesis, formalizers, reviewers
and readers Claude Opus 5 high), up to six cycles with early stop. **Stop-gate (a) was met in Cycle 1**; the
run closed after one cycle. Terminal manifest `017ddb693bdb678625efa3ead71aa34eb09af2d8ab53ff7b4b71fc25fb22b569`; controller review
[`CONTROLLER-REVIEW-R27.md`](../runs/erdos-993-forest-degree-extension-dre-2026-09-24/CONTROLLER-REVIEW-R27.md).

## Outcome

**The degree lemma and the extension inequality are formally verified** — for every finite forest `G` and every
`k`, `Σ_{J∈I_k} Σ_{v∈J} deg(v) ≤ 2k·i_k` and `n·i_k ≤ (k+1)·i_{k+1} + 3k·i_k`
([`proofs/lean/r27-c1-la1-forest-degree-extension`](../proofs/lean/r27-c1-la1-forest-degree-extension/README.md);
registry `E993-R27-FOREST-DEGREE-LEMMA`, `E993-R27-FOREST-EXTENSION-INEQUALITY`). **So are the consequences**,
unconditionally: `Δ_k < 0 ⇒ n ≤ 4k` (a linear order bound for a descent at rank `k`, strengthening the r25
`(k+1)²` award as a separate key), `n ≥ 21 ⇒ Δ_5 ≥ 0`, and `x < r ⇒ n ≤ 4r − 4` for the first strict descent `x`
([`r27-c1-la4-…`](../proofs/lean/r27-c1-la4-descent-order-bounds/README.md)). Two companion packages: the
graph-general counting core ([`r27-c1-la2-…`](../proofs/lean/r27-c1-la2-extension-counting-core/README.md))
and the implication chain ([`r27-c1-la3-…`](../proofs/lean/r27-c1-la3-degree-lemma-implication-chain/README.md)).

**What this closes.** The r25 rank-5 residue — forests of order 22–25 with at least three branch vertices
and `Δ_5 < 0` — is EMPTY under `n ≥ 21 ⇒ Δ_5 ≥ 0`; the branch-vertex condition turned out to be inert. The
isolated-vertex-addition closure `x(G ⊔ K₁) ≤ x(G) + 1` extends from `x ≤ 4` to `x ≤ 5`, at the grade of the
census it uses (the r25 order-≤21 forest census, re-verified in-run to order 20).

**What is NOT closed.** Every result here is an order bound or a counting statement whose contrapositive has
sign `Δ_k ≥ 0`. None is a no-recovery statement; the forest-wide no-recovery claim `E993-R25-UNR-FOREST-WIDE`,
the no-size-cap claim, NR1, FOREST, TREE, TRANSFER and Erdős #993 are untouched.

## The proof, in one paragraph

Root each component of the forest at one vertex; every non-root `u` owns the edge to its parent `p(u)`, so the
total degree `D_k` over independent `k`-sets decomposes as `Σ_{u non-root} (a_u + a_{p(u)})`, where `a_v`
counts the independent `k`-sets containing `v`. Pair each independent set `J` with a non-root `u` in one of
two ways — `u ∈ J` (type A) or `p(u) ∈ J` (type B) — and map the pair to `(J', v)` with `v ∈ J'` by swapping
along the parent edge. The map is an injection into the `k·i_k` pairs `(J', v)` with `v ∈ J'`: the two types
are separated by whether the grandparent `p(p(u))` lies in the image set, and this needs `p(p(u)) ≠ u` — a
third use of acyclicity that an isolated second read found latent in the critic's proof and that the
formalizer had independently supplied as a lemma. Hence `D_k + 2·(root pairs) ≤ 2k·i_k`, the *root-corrected*
degree lemma, and dropping the correction gives `(DL)`. The extension inequality follows from the classical
double count `(k+1)·i_{k+1} = Σ_J e(J)` and `e(J) ≥ n − k − Σ_{v∈J} deg(v)`, which need no acyclicity. `(DL)`
is never tight for `k ≥ 1` with `i_k > 0` (the `k = 1` slack is exactly twice the number of components), it is
false on `K_{2,3}`, and every cycle satisfies it with equality at every `k`.

## What else was learned

The root-corrected lemma has an exact correction term (`M_k = Σ_C max_v a_v(k)`, attained). The bound `n ≤ 4k`
is exact only at `k = 1, 2` among the tested ranks `1..5`: an in-run exhaustive census to order 20 gives the true descent maxima
`4, 8, 11, 15, 18` for `k = 1..5` and the sharp rank-5 ceiling `Δ_5 < 0 ⇒ n ≤ 18` (9,532 order-18 forest
classes), at census grade only. The paper's two-potential recurrences hold for arbitrary graph pieces —
acyclicity enters only afterwards, twice. Registered informally after isolated second reads: the root-corrected
lemma, its equality classification, the `k = 1` acyclicity criterion, the exact extension identity with the
co-degree excess, the rooted recurrences, the separated-union convolution and single-root reduction, the
leaf/branch reformulation at `n ≥ 2`, and ℤ-index completeness of the first descent.

## Process

Every stage sealed by canonical-JSON SHA-256 manifests; per-seat sealed capsules; four isolated second reads
run concurrently with the Lean stage (which let a reader's finding reach a formalizer before its close); an
integrity sweep of 38 manifests / 3,698 members / 0 unexpected drifts. Controller errata R27-E-a…g are on
the record. Master registry 392 identities after publication. Verification record:
[`evidence/verification-2026-09-24-r27.md`](../evidence/verification-2026-09-24-r27.md).

## Follow-up review and census, 2026-09-25

The [fresh review](../docs/r27-fresh-review-2026-09-25.md) confirms the four package faces against source and reported receipts, without a Lean rebuild. The informal Corollary B equality sentence is corrected at k=0 and i_k=0; no complete positive supported k>=2 classification is asserted by the corrected face. Sealed source and formal awards are unchanged. The separate [order-24 census](forest-census-order24.md) extends the descent maxima to M(6)=22 and K1-addition closure to x<=6 at census-dependent grades.
