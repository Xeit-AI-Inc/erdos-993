# Erdős Problem #993

Formal and computational research by [Xeit AI, Inc.](https://xeit.ai) on the
unimodality of independent-set sequences of finite trees and forests.

> [!IMPORTANT]
> Erdős Problem #993 remains open. This repository does not claim a proof,
> counterexample, or independence result.

For a finite graph `G`, let `i_k(G)` be the number of independent vertex sets
of size `k`. The problem asks whether

```text
(i_0(G), i_1(G), ..., i_alpha(G))
```

is weakly unimodal whenever `G` is a finite tree, and likewise whenever `G` is
a finite forest.

## 2026-09-24: first-interior aggregate formally verified

The [first-interior experiment](experiments/first-interior-aggregate.md) closed after two full cycles (six maximum). For every finite ordinary tree `T`, put `p = α(T) − 2`. If the first strict negative difference satisfies `x(T) + 2 ≤ p`, the complete sum over **original leaves** with `Δ_p(T−v) < 0` is formally verified nonpositive:

```text
Σ_v [Δ_(p−1)(T−{v,s_v}) − Δ_(p−1)(T−N_T[s_v])] ≤ 0.
```

The strict selector remains at the original rank; leaves sharing a support retain distinct tags. The theorem needs no residual assumption, and eligibility itself implies `α(T) ≥ 7`. The sole new award is `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` at `formally_verified`; the three related auxiliary registry keys remain OPEN. The master has 395 identities (236 VERIFIED, 89 REFUTED, 26 CONDITIONAL, 44 OPEN), whose mixed grades are not a formal-theorem count. The all-rank ordinary aggregate, governed `E993-BETA-AGG`, TREE, FOREST and Erdős #993 remain open. Read the [Lean package](proofs/lean/first-interior-aggregate/README.md), [verification record](evidence/verification-2026-09-24-first-interior.md), [terminal report](runs/erdos-993-first-interior-aggregate-dre-2026-09-24/REPORT.md) and [independent final analysis](runs/erdos-993-first-interior-aggregate-dre-2026-09-24/FINAL-ANALYSIS.md).

## 2026-09-25: r28 — the Hall/SDR route to the degree lemma is refuted; what survives is registered

The [r28 run](experiments/r28-degree-lemma-hall-sdr.md) attacked the leaf/slot dominance condition `(HS)` — the Hall/SDR sufficient condition an r27 critic proposed for a second, structural proof of the forest degree lemma — and refuted it: the order-22 tree `T22` (a root with three hubs, each carrying two pendant 3-paths) has its root in 18 of the 19 independent 12-sets while every leaf lies in 17, so one branch slot at threshold 18 has no leaf; found independently by two critics, reproduced by all three adjudicators, confirmed by an isolated second read that enumerated all 5,623,756 trees of order 22 and found it unique. The degree lemma `(DL)` holds on `T22` and is untouched. Registered from the run: the pendant-path leaf dominance lemma (graph-general), Theorem BTP — `(HS)` holds on every tree whose branch tree is a path, sharp for every branch-degree bound — the surplus identity, the SDR/threshold equivalence, the layer-cake reduction `(HS) ⇒ (DL)`, five refuted local mechanisms, and the census; 4 governed Lean package(s). Nothing transfers to the forest-wide no-recovery claim, NR1, FOREST, TREE or Erdős #993. Verification record: [`evidence/verification-2026-09-25-r28.md`](evidence/verification-2026-09-25-r28.md). Master registry 405 identities.

## 2026-09-24: r27 — the finite forest degree lemma and extension inequality are formally verified

The [r27 run](experiments/r27-forest-degree-extension.md) audited and formalized the finite forest degree lemma and extension inequality of Fang–Lu–Nevo–Yao–Zheng (2026, §8) on the program's G1 definitions of record, with an in-run injection proof: for every finite forest and every `k`, `Σ_{J∈I_k} Σ_{v∈J} deg v ≤ 2k·i_k` and `n·i_k ≤ (k+1)·i_{k+1} + 3k·i_k` ([`r27-c1-la1-…`](proofs/lean/r27-c1-la1-forest-degree-extension/README.md)); the unconditional consequences `Δ_k < 0 ⇒ n ≤ 4k`, `n ≥ 21 ⇒ Δ_5 ≥ 0` and `x < r ⇒ n ≤ 4r − 4` ([`r27-c1-la4-…`](proofs/lean/r27-c1-la4-descent-order-bounds/README.md)); the graph-general counting core ([`r27-c1-la2-…`](proofs/lean/r27-c1-la2-extension-counting-core/README.md)) and the implication chain ([`r27-c1-la3-…`](proofs/lean/r27-c1-la3-degree-lemma-implication-chain/README.md)). The r25 rank-5 residue (orders 22–25) is closed out; the K1-addition closure extends to `x ≤ 5` at census grade. These are order bounds whose contrapositives have sign `Δ_k ≥ 0` — not no-recovery statements; nothing transfers to the forest-wide no-recovery claim, NR1, FOREST, TREE or Erdős #993. Verification record: [`evidence/verification-2026-09-24-r27.md`](evidence/verification-2026-09-24-r27.md). At the r27 close, the master registry held 392 identities.

## 2026-09-24: r26 — the r24 top-rank residual sign is formally verified

The [r26 run](experiments/r26-top-rank-residual-sign.md) validated a literature-map candidate proof of the r24 top-rank residual sign `(RC)` and closed it as a governed Lean package composed with the r24 identity `(RI)`: for every finite tree with `2 ≤ α`, `x + 2 ≤ α − 1` and every leaf in every maximum independent set, `S(T, α−1) ≤ 0` — r24's terminal debt TD-6. Two companion packages (the deletion-injection/fibre bound; the tree-structural core), the strict form `S ≤ −2` informally, a correction of the r24 record's "1,420 realized" statement, and `N₂ ≤ M` refuted. At the r26 close, the master registry held 370 identities. The all-rank aggregate and every headline stay open. Read the [verification record](evidence/verification-2026-09-24-r26.md).

## 2026-09-23: r25 addendum

The [r25 addendum](experiments/r25-uniform-residual-no-recovery.md#addendum-2026-09-2223-surgical-package-and-one-seating-design-cycle) adds two reproducible Lean packages — the `d = 5` band's arithmetic tail `∀ r ≥ 6, Bd(r,r) < 0` on the ranged integer-rank object, and the enumeration-free forest threshold `Δ₃ > 0` at order ≥ 12 — closes the four second reads the terminal cycle could not seat (all confirmed, with corrections to the r25 record including the band's formal-input count), and runs one seating-design cycle whose census closes the `τ = 12` thin-tree band at every order. The master registry now holds 363 identities. Every headline stays open. Read the [verification record](evidence/verification-2026-09-23-r25-addendum.md).

## 2026-09-22: r25 six-cycle terminal close

The completed [r25 uniform residual no-recovery experiment](experiments/r25-uniform-residual-no-recovery.md) adds twelve reproducible Lean packages at exact, narrow scopes — fixed-band `d = 5` matching and carry-step results, a Catalan-gap theorem, a uniform-in-`d` bottom-rank matching sign at rank `r = d` only, a sharp forest order bound `Δ_k < 0 ⟹ |V| ≤ (k+1)²`, the uniform-in-order forest threshold `Δ₂ > 0` (order ≥ 9), coefficientwise positivity of the certificate dual for every index, and the five `τ ≤ 5` small-rank cells on actual forests — and 72 registered identities. Every headline stays open; no recovering forest exists anywhere in the evidence; the charter outcome is another fixed-band result plus method-fencing refutations, not a uniform advance. Read the [verification record](evidence/verification-2026-09-22-r25.md) and the [terminal controller review](runs/r25-uniform-residual-no-recovery-dre-2026-09-20/CONTROLLER-REVIEW-C6.md).

## 2026-09-20: G1 three-cycle results

The completed [G1 large-residual experiment](experiments/g1-large-residual-dre-2026-09-13.md) adds three reproducible Lean packages. For a finite forest `F`, `r>=1`, order `2r+4`, and first strict descent before `r`, Cycle 3 proves `i_(r+1)(F)<=i_r(F)`. This gives ordinary G1 at residual order `|U|=2p`, alongside the earlier formal `p<=5` and `|U|=2p-2` cases. The intervening `|U|=2p-1` case remains informal with named dependencies.

Unrestricted G1 and Erdős #993 remain open. Read the [verification record](evidence/verification-2026-09-20-g1.md), [full report](runs/g1-large-residual-dre-2026-09-13/REPORT.md), and [assessment and three research priorities](docs/assessment-2026-09-20.md). Run `./scripts/verify-g1-lean.sh` to reproduce the new packages.

## What This Repository Contains

- a precise account of the problem and current research boundary;
- governed mathematical results and explicit open obligations;
- a public description of the multi-agent Mathematical Solver DRE method;
- reproducible Lean 4 projects for the currently published formal results in
  this research line;
- provenance and evidence rules that separate proof, computation, and
  conjecture.

## Formal Results Currently Included

For every finite nonempty simple tree `T` with at least 27 vertices,

```text
i_4(T)^2 > i_3(T) * i_5(T).
```

The Lean declaration is
`Erdos993GapBridge.tree_plc4_of_card_ge_27`. This is a strict local
log-concavity result at rank four. It does **not** prove unimodality at every
rank and does not solve Erdős #993.

The package also includes the auxiliary inequalities and finite-set bridge used
in the rank-four result. A second package adds two governed auxiliary results:

- descent persists in a strictly positive adjacent-log-concave finite natural
  sequence; and
- the finite occurrence interface, an **assumed** capacity inequality, and a
  strict normalized deficit imply a contradiction.

The second result does not prove the capacity inequality. The exact open
obligation is described in [Current results](docs/results.md).

A third package verifies the exact marked-extension counting theorem. For the
specified induced extension residual `R_spec`, it proves the one-mark,
unordered two-mark, and aggregate charge identities. This is an auxiliary
identity, not a sign theorem or a first-recovery contradiction.

The 2026-08-31 update adds twelve separately reproducible Lean projects from
the completed joint-shadow-incidence run. They verify exact auxiliary or
conditional statements only: no first recovery at rank one, two proper
double-broom exclusions, rooted attachment and context infrastructure,
conditional endpoint and coupling bridges, a finite rooted countercertificate,
and four exact incidence/component identities. None is a TREE, FOREST,
TRANSFER, counterexample, or Erdős #993 theorem.

The 2026-09-01 r8 update adds seven Lean projects for eight governed auxiliary
declarations: extension-set splitting, extension-profile specialization, a
fixed-state decoder obstruction, abstract convolution closure results,
two-leaf deletion symmetry, and a positive-rank boundary. These are exact
narrow results only. They do not prove TREE, FOREST, TRANSFER, a
counterexample, or Erdős #993.

## Latest Research Boundary

The completed r6 and r7 experiments both leave TREE, FOREST, and TRANSFER
open. Under r6's own rubric, its Lean-gated corpus is computation grade only
and is explicitly not `formally_verified`. The r7 packages meet the stated
kernel, axiom, and fidelity checks at their narrow scopes, but none is a
headline theorem. The earlier proof-gap experiment narrowed a possible
rank-four-to-rank-five recovery to tree orders `13..32` and produced complete
no-recovery certificates at orders 20 and 21. These advances do not close the
remaining finite band or any all-order headline.

The completed r8 extension-profile and same-leaf experiment also leaves all
four headline targets open. Its eight verified declarations are auxiliary; the
remaining universal route needs representation fidelity, noncircular endpoint
signs, and a strict common-leaf overlap.

The completed r19 aggregated β′ experiment likewise leaves every headline
target open. It ran all nine authorized cycles, formally verified 25 narrow
auxiliary declarations, and reduced its best surviving route to arbitrary
multi-base compensation in a fixed Delete/Retag Hall relation. The aggregate
claim itself is neither proved nor refuted. Three tempting transport and
provenance mechanisms are now excluded at exact scope.

The r21/r22 O14 multibase-Hall lineage then completed nine more semantic
cycles with the expanded 21-route topology. It formally verified nine
workflow artifacts at exact auxiliary scope, sharpening collision,
minimal-deficiency, tree-incidence, and signed-payment structure. The work
also shows why a tree-shaped incidence relation alone cannot exclude a
minimal Hall defect and why an unaugmented all-subcut payment cannot remain
termwise nonnegative. At the r21/r22 close, both the aggregate and fixed-Gamma
Hall claims remained open; the next run therefore constructed the literal
ordinary-tree relation while preserving the governed-model fidelity fence.

The r23 actual-tree experiment supplied that literal ordinary-tree
construction and found a decisive limitation: universal all-cut Hall is false
for the frozen literal relation. On `T_22,p=34`, a source cut exceeds a target
container for its entire neighborhood by `14226520737620288370`, while the
same row's complete favorable-leaf aggregate remains negative. This refutes
the literal Hall mechanism, not aggregated beta-prime. The next aggregate
route must prove direct full demand or total signed cancellation without
requiring every proper cut to expand. The broader governed-RTree Hall claim
remains open pending the same-byte model bridge.

## Verify The Lean Package

Install [elan](https://github.com/leanprover/elan), then run:

```bash
./scripts/verify-lean.sh
```

The project pins:

- Lean `v4.32.2`
- Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`

The expected transitive axioms are `propext`, `Classical.choice`, and
`Quot.sound`.

## Start Here

- [First-interior aggregate result](experiments/first-interior-aggregate.md)
- [First-interior Lean package](proofs/lean/first-interior-aggregate/README.md)
- [First-interior verification record](evidence/verification-2026-09-24-first-interior.md)
- [Problem and status](docs/problem-and-status.md)
- [Current results](docs/results.md)
- [Proof architecture status, 2026-09-01](docs/proof-architecture-status-2026-09-01.md)
- [Research methodology](docs/methodology.md)
- [Evidence policy](docs/evidence-policy.md)
- [Open research roadmap](docs/roadmap.md)
- [References](docs/references.md)
- [Lean package](proofs/lean/gap-bridge/README.md)
- [Rooted residual-profile Lean package](proofs/lean/rooted-residual-profile/README.md)
- [Marked-extension charge Lean package](proofs/lean/marked-extension-charge/README.md)
- [r7 auxiliary and conditional Lean packages](proofs/lean/r7-first-recovery-rank-one/README.md)
- [2026-08-31 provenance record](evidence/verification-2026-08-31-r6-r7.md)
- [r8 experiment summary](experiments/r8-extension-profile-same-leaf.md)
- [r19 aggregated β′ experiment](experiments/r19-beta-aggregate.md)
- [2026-09-09 r19 verification record](evidence/verification-2026-09-09-r19.md)
- [r21 O14 multibase-Hall parent](experiments/r21-o14-multibase-hall.md)
- [r22 O14 multibase-Hall continuation](experiments/r22-o14-multibase-hall-continuation.md)
- [2026-09-12 r21/r22 verification record](evidence/verification-2026-09-12-r21-r22.md)
- [r23 actual-tree Delete/Retag experiment](experiments/r23-delete-retag-actual-tree.md)
- [2026-09-13 r23 verification record](evidence/verification-2026-09-13-r23.md)
- [r23 T22 arithmetic certificate](proofs/lean/r23-t22-arithmetic-certificate/README.md)
- [r23b actual-tree Delete/Retag construction & verification](experiments/r23b-delete-retag-construction-verification.md)
- [2026-09-17 r23b verification record](evidence/verification-2026-09-17-r23b.md)
- [r24 direct favorable-leaf aggregate DRE (six cycles, terminal)](experiments/r24-direct-favorable-leaf-aggregate.md)
- [2026-09-18 r24 verification record](evidence/verification-2026-09-18-r24.md)
- [r24 top-rank selector collapse Lean package](proofs/lean/r24-c4-top-rank-selector-collapse/README.md)
- [r24 top-rank residual identity Lean package](proofs/lean/r24-c5-top-rank-residual-identity/README.md)
- [r25 uniform residual no-recovery DRE (six cycles, terminal)](experiments/r25-uniform-residual-no-recovery.md)
- [2026-09-25 r28 verification record](evidence/verification-2026-09-25-r28.md)
- [r28-c1-la2-layer-cake-reduction Lean package](proofs/lean/r28-c1-la2-layer-cake-reduction/README.md)
- [r28-c1-la3-forest-composition-and-hall Lean package](proofs/lean/r28-c1-la3-forest-composition-and-hall/README.md)
- [r28-c1-la4-pendant-path-leaf-dominance Lean package](proofs/lean/r28-c1-la4-pendant-path-leaf-dominance/README.md)
- [r28-c1-la5-btp-second-proof-on-class Lean package](proofs/lean/r28-c1-la5-btp-second-proof-on-class/README.md)
- [2026-09-24 r27 verification record](evidence/verification-2026-09-24-r27.md)
- [r27-c1-la1-forest-degree-extension Lean package](proofs/lean/r27-c1-la1-forest-degree-extension/README.md)
- [r27-c1-la2-extension-counting-core Lean package](proofs/lean/r27-c1-la2-extension-counting-core/README.md)
- [r27-c1-la3-degree-lemma-implication-chain Lean package](proofs/lean/r27-c1-la3-degree-lemma-implication-chain/README.md)
- [r27-c1-la4-descent-order-bounds Lean package](proofs/lean/r27-c1-la4-descent-order-bounds/README.md)
- [2026-09-24 r26 verification record](evidence/verification-2026-09-24-r26.md)
- [r26-c1-la1-top-rank-residual-sign Lean package](proofs/lean/r26-c1-la1-top-rank-residual-sign/README.md)
- [r26-c1-la2-deletion-injection-fibre Lean package](proofs/lean/r26-c1-la2-deletion-injection-fibre/README.md)
- [r26-c1-la3-tree-structural-core Lean package](proofs/lean/r26-c1-la3-tree-structural-core/README.md)
- [2026-09-23 r25 addendum verification record](evidence/verification-2026-09-23-r25-addendum.md)
- [r25a-b-bd-tail-negative Lean package](proofs/lean/r25a-b-bd-tail-negative/README.md)
- [r25a-a1-forest-delta3-pos-order-12 Lean package](proofs/lean/r25a-a1-forest-delta3-pos-order-12/README.md)
- [2026-09-22 r25 verification record](evidence/verification-2026-09-22-r25.md)
- [r25-c1-fourth-band-seven-edge-matching-sign Lean package](proofs/lean/r25-c1-fourth-band-seven-edge-matching-sign/README.md)
- [r25-c1-perfect-matching-even-excess-sign Lean package](proofs/lean/r25-c1-perfect-matching-even-excess-sign/README.md)
- [r25-c3-catalan-gap-monotone-ratio Lean package](proofs/lean/r25-c3-catalan-gap-monotone-ratio/README.md)
- [r25-c4-matching-bottom-rank-uniform-sign Lean package](proofs/lean/r25-c4-matching-bottom-rank-uniform-sign/README.md)
- [r25-c4-forest-descent-order-bound-sharp Lean package](proofs/lean/r25-c4-forest-descent-order-bound-sharp/README.md)
- [r25-c5-matching-dual-scalar-core Lean package](proofs/lean/r25-c5-matching-dual-scalar-core/README.md)
- [r25-c6-forest-delta2-pos-order-9 Lean package](proofs/lean/r25-c6-forest-delta2-pos-order-9/README.md)
- [r25-c6-band-carry-step-hall Lean package](proofs/lean/r25-c6-band-carry-step-hall/README.md)
- [r25-c6-matching-all-index-coefficientwise-nonneg Lean package](proofs/lean/r25-c6-matching-all-index-coefficientwise-nonneg/README.md)
- [r25-c6-bd-step-sign-and-interior-peak Lean package](proofs/lean/r25-c6-bd-step-sign-and-interior-peak/README.md)
- [r25-c6-card5-cells-and-cover-catalan-bound Lean package](proofs/lean/r25-c6-card5-cells-and-cover-catalan-bound/README.md)
- [r25-c6-sharpened-order-bound-argmin Lean package](proofs/lean/r25-c6-sharpened-order-bound-argmin/README.md)
- [2026-09-01 r8 verification record](evidence/verification-2026-09-01-r8.md)
- [Order-20/21 computational evidence](evidence/order-20-21-search/README.md)

## Repository Status

This is a curated public research release. The internal sealed experiment
lineage is substantially larger than this repository. Only artifacts that are
appropriate for public verification and collaboration are published here.

See [STATUS.md](STATUS.md) for the exact claim boundary and
[RIGHTS.md](RIGHTS.md) before reusing material.
