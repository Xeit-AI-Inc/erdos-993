# r26 — Validate and Formalize the r24 Top-Rank Residual Sign (RC)

Chartered by Ashton on 2026-09-23 from a literature map of the same day whose top-rank seat proposed a short
proof of the r24 top-rank residual sign `(RC)` — a maximum-independent-set exchange ("forced neighbour") and
grouped counting over the near-maximum shell — with an independent review and an exhaustive check through
order 12. The charter: treat the candidate as an argument to attack, resolve a discrepancy in the r24 record
(its terminal synthesis said negative family-(I) weights were "realized by 1,420 eligible residual trees",
which the candidate makes impossible), and, if sound, produce a governed Lean proof composed with the verified
identity `(RI)`. A success closes this named subproblem only.

Internal run `erdos-993-top-rank-residual-sign-dre-2026-09-23`: 9 routes / 18 cross-orientation critics / 3
isolated adjudicators / 1 neutral synthesis (routes Claude Sonnet 5 xhigh; critics Claude Opus 5 medium;
adjudicators, synthesis, formalizers and reviewers Claude Opus 5 high), up to six cycles with early stop on a
formal award or an in-scope counterexample. **The award landed in Cycle 1**; the run closed after one cycle.
Terminal manifest `4f835552b5b8b417c616a7395f9d623de50fcc89aef290ccea9f867317481765`; controller review
[`CONTROLLER-REVIEW-R26.md`](../runs/erdos-993-top-rank-residual-sign-dre-2026-09-23/CONTROLLER-REVIEW-R26.md).

## Outcome

**`(RC)` is formally verified.** For every finite tree `G` with `2 ≤ α(G)`, `x(G) + 2 ≤ α(G) − 1` (first strict
descent `x`) and every leaf in every maximum independent set, the top-rank favorable-leaf aggregate satisfies
`S(G, α−1) ≤ 0` — [`proofs/lean/r26-c1-la1-top-rank-residual-sign`](../proofs/lean/r26-c1-la1-top-rank-residual-sign/README.md),
registry `E993-R26-TOP-RANK-RESIDUAL-SIGN`. r24's terminal debt TD-6 (the non-flat residual class, ~98% of the
class) is closed. Two companion packages: the deletion-injection/sharp fibre bound
([`r26-c1-la2-…`](../proofs/lean/r26-c1-la2-deletion-injection-fibre/README.md)) and the tree-structural core
([`r26-c1-la3-…`](../proofs/lean/r26-c1-la3-tree-structural-core/README.md)).

**What is NOT closed.** The all-rank literal aggregate `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` stays
OPEN: the interior ranks `x+2 ≤ p < α−1` were never searched, and at the top rank the non-residual class needs a
different identity (`(RI)` holds exactly on the residual class). `E993-BETA-AGG` (governed `RTree` scope) needs
the ordinary-to-RTree transport, never attempted. TREE, FOREST, TRANSFER and Erdős #993 are untouched.

## The proof, in one paragraph

Let `L` be the leaves (`ℓ = |L|`), `C` the supports with leaf multiplicities `λ`, `D` the interior, `M` the
number of maximum independent sets. Under the residual hypothesis every maximum independent set is `L ∪ J`
with `J` maximum in `D`, so `α = ℓ + a`. *Forced neighbour:* a maximum `J ⊆ D` meets the neighbourhood of every
multiplicity-1 support (else swapping that support for its leaf gives a maximum set missing a leaf). For a
near-maximum independent `B` the exact budget `(a − |B∩D|) + Σ_{s∈B∩C}(λ(s) − 1) + h = 1` (`h` the extra
omitted leaves) leaves four arithmetic shapes, which forced neighbour prunes to three families: (I) `|B∩D| = a`,
no supports, one omitted leaf — `ℓM` sets of weight `ℓ−1`; (II) one multiplicity-2 support — `N₂` sets of weight
`ℓ−4`; (III) `|B∩D| = a−1` with an independent set `A` of compatible multiplicity-1 supports — weight `ℓ − 2|A|`,
and the deletion injection `2Σ|A| ≤ |U|·|I(U)|` with `|U| ≤ ℓ` makes every fibre sum nonnegative. With `(RI)`,
`S = ℓM − W ≤ −ℓ(ℓ−2)M − (ℓ−4)N₂`, and `N₂ ≤ k₂M` with `k₂ ≤ ⌊ℓ/2⌋` finishes `ℓ ≥ 4`, `ℓ = 3`; at `ℓ = 2` the
eligibility guard (through `α ≥ 3`) excludes the only tree with a multiplicity-2 support, `P₃` (whose
unqualified value is `+2`). Sharper, informally: `S ≤ −2` on the whole eligible class, with `S = 0` exactly at
`P₅` and `S > 0` exactly at `P₃`, both outside the window.

## The record correction

The r24 C6 terminal synthesis (B3/TD-6) and T adjudication said family-(I) weights `ℓ−1−2|A_S|` "flip … realized
by 1,420 eligible residual trees of orders 7–16, first at order 9". Six independent instruments reproduce
1,420 exactly — as the count of trees whose multiplicity-1 supports contain an independent set of size
`> (ℓ−1)/2`, a structural precondition — while the number of trees with a *realized* family-(I) member having a
nonempty support selection is 0 of 7,247 (0 of 128,908 shell members), and is now a theorem (forced
neighbour). B3's three-family identity is exact; the sign-flipping is family (III)'s. The r24 T adjudicator's
instrument for the count did not survive (provenance gap); the substitution originates in an r24 critic's
sentence. Registered as `E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION`; the sealed r24 files are unchanged.
Also refuted and registered: `N₂ ≤ M` (false from order 9; `N₂ ≤ k₂M` is the true bound). Census
reconciliation: 16,424 eligible residual trees to order 17 = 290 flat + 16,134 non-flat (TD-6's figure).

## Process

Every stage sealed by canonical-JSON SHA-256 manifests; per-seat sealed capsules for critics, adjudicators,
formalizers and reviewers; three isolated second reads before registration; integrity sweep 36 manifests /
2,581 members / 0 unexpected drifts. Controller errata: R26-E-a, R26-E-b (`P₇` mislabelled eligible in the
controller's brief — caught by four seats), R26-E-c. Master registry 370 identities after publication.
Verification record: [`evidence/verification-2026-09-24-r26.md`](../evidence/verification-2026-09-24-r26.md).
