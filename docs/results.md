# Current Results

## Current orientation, 2026-09-25

Code's r28 Hall/SDR experiment is complete: its universal sufficient condition is refuted, with restricted structural results formally verified. The registry has 405 identities (243 VERIFIED, 92 REFUTED, 26 CONDITIONAL, 44 OPEN). The new bounded forest census and fresh r27 review are authorized and pending; no additional mathematical award is made. See the [current research notepad](research-notepad-2026-09-25.md) and [assessment](assessment-2026-09-25.md). Historical sections retain their dates and scopes.

## First-interior ordinary aggregate, 2026-09-24

The exact claim `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` is formally verified. For a finite ordinary tree `T`, let `p=α(T)−2`; if the first strict negative independence-coefficient difference has `x(T)+2≤p`, then

```text
Σ_{v original leaf, Δ_p(T−v)<0}
  [Δ_(p−1)(T−{v,s_v}) − Δ_(p−1)(T−N_T[s_v])] ≤ 0.
```

Counts use integer zero extension. The favorable filter stays strict at the original rank, and leaves sharing a support remain separately tagged. There is no residual premise. The proof derives `α(T)≥7` from eligibility, then uses a bipartite tagged-set double count to show every original-leaf term is nonpositive. The experiment ended after two complete cycles out of six maximum; its sole registry award is this primary claim at `formally_verified`. Three related auxiliary keys remain OPEN as separate certificate scopes. At the first-interior close, the master had 395 identities (236 VERIFIED, 89 REFUTED, 26 CONDITIONAL, 44 OPEN); these mixed grades are not a count of formally verified theorems.

The ordinary all-rank aggregate remains OPEN and is a self-contained ordinary-tree target. The proposed non-residual top-rank consequence and uniform high-tail helpers still need separate certificates; the lower eligible ranks need complete selected-sum compensation. Governed `E993-BETA-AGG` would additionally need an exact ordinary-to-governed-model bridge. TREE, FOREST, TRANSFER and Erdős #993 remain open. See the [experiment](../experiments/first-interior-aggregate.md), [Lean package](../proofs/lean/first-interior-aggregate/README.md), [verification record](../evidence/verification-2026-09-24-first-interior.md), [terminal report](../runs/erdos-993-first-interior-aggregate-dre-2026-09-24/REPORT.md) and [independent final analysis](../runs/erdos-993-first-interior-aggregate-dre-2026-09-24/FINAL-ANALYSIS.md).

## G1 large-residual results, 2026-09-20

| Scope | Verified result |
|---|---|
| Ordinary G1, `p<=5` | Residual sign is nonpositive; the associated low-rank forest regime is classified |
| Finite simple graphs, `|G|=2r+2`, `r>=1` | Positive `Delta_r` iff at most one edge; exceptional graphs have strictly positive differences through `r` |
| Ordinary G1, `|U|=2p-2` | Residual sign is nonpositive |
| Finite forests, `|F|=2r+4`, `r>=1`, `x(F)<r` | `Delta_r(F)<=0` |
| Ordinary G1, `|U|=2p` | Residual sign is nonpositive |

These are the exact consequences of three governed contracts, published in three byte-identical Lean source packages. No unrestricted G1, TREE, FOREST or TRANSFER conclusion is awarded. The second wide band is retained at its informal grade. See [the experiment summary](../experiments/g1-large-residual-dre-2026-09-13.md), [verification record](../evidence/verification-2026-09-20-g1.md), and [current assessment](assessment-2026-09-20.md).

## Included Formal Result

For every finite nonempty simple tree `T` with `|V(T)| >= 27`,

```text
i_4(T)^2 > i_3(T) * i_5(T).
```

The included proof composes two inequalities:

```text
(|V(T)| - 5) * i_3(T) < 5 * i_4(T)
5 * i_5(T) <= (|V(T)| - 5) * i_4(T).
```

The corresponding Lean declarations are:

- `Erdos993GapBridge.tree_e3_large_order`
- `Erdos993GapBridge.five_ind_five_le`
- `Erdos993GapBridge.tree_plc4_of_card_ge_27`

## Rooted Residual-Profile Experiment

The completed eight-cycle experiment established the exact occurrence count

```text
sum_(S in N(X_(t_*))) m_(t_*)(S) = q|X_(t_*)|.
```

For positive `q`, the open first-recovery capacity inequality is therefore
equivalent to

```text
a|X_(t_*)| <= b|N(X_(t_*))|.
```

This is a reduction of the remaining proof gap, not a proof of the inequality.
It must still be derived from minimum-order first-recovery history, including
the `t_*=0` boundary case, without assuming the desired recovery sign.

The accompanying Lean package verifies:

- `LeanProof.positiveLogConcave_descent_persists`; and
- `Erdos993C8U1.tail_contradiction_from_occurrence_interface`.

The second theorem takes the load-bearing capacity inequality as `hMult`; it
proves only the downstream contradiction once that hypothesis is supplied.

## 2026-08-31 r6/r7 Update

The completed Code r6 NR-foundation experiment is represented here as a
provenance-backed computation-grade record only. Its terminal controller
record says that its Lean-gated corpus is not `formally_verified` under the
r6 rubric. Accordingly, this release publishes no r6 theorem package and
does not use r6 to upgrade any formal claim.

The completed r7 joint-shadow-incidence experiment contributes twelve exact
kernel-checked, axiom-checked, fidelity-reviewed declarations. Every one is
auxiliary or conditional, and none is a headline theorem. The reproducible
packages establish:

- no plateau-safe first recovery beginning at rank one in a finite nonempty
  labelled tree;
- first-recovery exclusion for the proper labelled families `D_(1,m)` and
  `D_(2,m)`;
- exact rooted attachment transitions and coefficient formulas through degree
  five;
- a conditional endpoint-sign implication and a conditional finite-coupling
  diagonal consequence;
- conditional common-freshening and contextual congruence infrastructure, and
  an explicit pair of rooted trees with equal degree-five signature but
  unequal `i_6`;
- exact two-leaf four-class, containment/stub, component-boundary, and
  fixed-component selector identities.

The endpoint and coupling declarations retain their displayed antecedents.
The selector characterization does not prove a nonempty common selector, and
the structural identities do not establish a strict same-leaf inequality.
The complete package list, declarations, source hashes, and scope boundaries
are in the [r7 provenance record](../evidence/verification-2026-08-31-r6-r7.md).

## 2026-09-01 r8 Extension-Profile And Same-Leaf Update

The terminal r8 experiment contributes eight governed formally verified
auxiliary declarations in seven public packages. Their exact scopes are:

- an extension-set cardinality bridge under labelled graph disjoint union;
- recovery of independent-set coefficients by evaluating an encoded
  extension-profile variable at one;
- a fixed five-label obstruction to a universal decoder for the exact
  `R_bag` state;
- closure of an abstract universal-preserver predicate under convolution;
- endpoint-deletion isomorphism, coefficient equality, and difference
  equality for an exact two-leaf tree;
- a positive-rank and carrier-bound legality consequence of the displayed
  minimum-first-recovery hypothesis; and
- a route-local `TRS2` characterization by adjacent log-concavity and a
  closure theorem for abstract finitely supported sequences.

No result establishes a strict common-leaf inequality, proves that a tree
independence sequence belongs to `SCP` or `TRS2`, provides a realizable
transfer class, or changes any headline status. The two Cycle 12 nominees are
blocked future work and are not published as verified Lean theorems.

See the [r8 experiment summary](../experiments/r8-extension-profile-same-leaf.md)
and [verification record](../evidence/verification-2026-09-01-r8.md).

For a linear account of the intended minimum-counterexample proof, including
which portions form its beginning, unresolved middle, and conditional ending,
see the [proof architecture status note](proof-architecture-status-2026-09-01.md).

## r19 Aggregated Beta-Prime Update

The pointwise beta condition is refuted, but its favorable-leaf aggregate
remains an open candidate. The completed nine-cycle r19 experiment found no
positive complete aggregate in its exact bounded batteries and no universal
proof.

The run's strongest structural result is a fixed Delete/Retag Hall reduction.
Exact local cut facts, one-block compensation, a high-rank conditional Hall
theorem, and a minimal deficient-core normal form reduce the live route to one
of two outcomes:

1. prove uniform compensation for arbitrary active-base subsets; or
2. exhibit an exact governed deficient cut with the complete aggregate data
   from the same row.

Cycles 1-8 formally verified 25 auxiliary Lean declarations at exact
algebraic, finite-combinatorial, or conditional scope. Their contract, kernel,
and fidelity digests are in the
[r19 verification record](../evidence/verification-2026-09-09-r19.md). The
source projects are not part of this public release. Cycle 9 made no formal
award after one fidelity failure and two exhausted repaired kernel builds.

The run also refuted three universal mechanisms: literal-leaf-preserving
connected strict-prune totality, support-locked literal-label corridor
advance, and exact support-preserving unit transport. These exclusions do not
refute the aggregate claim or Erdos #993.

## r21/r22 O14 Multibase-Hall Update

The r21 parent and r22 continuation completed one combined nine-cycle
lineage. The parent isolated the exact cutwise compensation target and
verified two generic auxiliaries before stopping fail-closed at a Cycle 3
exact-binding defect. The continuation formally repaired that unchanged
conditional theorem, then completed Cycles 4–9.

The combined formal record contains nine workflow awards at exact auxiliary
scope. Its principal mathematical advances are:

- global signed slack equals active-base slice slack minus cross-base
  collision, with exact full-fibre boundary corrections;
- fixed-data collision is monotone under pure source deletion;
- unordered distinct-base pair overlap bounds targetwise collision;
- nonempty inclusion-minimal deficient cuts have deficit one and unchanged
  neighborhood after any one source deletion;
- tree incidence alone does not rule out such a deficient core; and
- exact fixed weights on every subcut of a four-element fibre are forced to
  be `+1` on pairs, `-1` on triples, and `+1` on the four-set.

The last fact rules out the unaugmented all-subcut representation as a
termwise nonnegative Hall payment. It does not rule out corrected payments or
global cancellation.

Neither run supplied the source-complete governed binding needed to apply the
generic theorems to the actual Delete/Retag construction. Consequently
`E993-R19-FIXED-GAMMA-HALL` and `E993-BETA-AGG` remain open, and no headline
status changes. See the [r22 summary](../experiments/r22-o14-multibase-hall-continuation.md)
and [verification record](../evidence/verification-2026-09-12-r21-r22.md).

## r23 Actual-Tree Delete/Retag Update

The r23 experiment reconstructed the literal ordinary-tree source and target
sets and established, at independently criticized informal-proof tier, the
exact tagged identity

```text
|P|-|N| = S(T,p).
```

It also proved the conditional chain

```text
Hall => |P|<=|N| <=> S(T,p)<=0.
```

Universal Hall for the literal relation is false. On eligible `T_22,p=34`, a
center-free source cut has size `1020660578375268831042`, while its complete
neighborhood lies in a target container of size
`1006434057637648542672`. The Hall deficit is
`14226520737620288370`. The same row's complete favorable-leaf aggregate is
`-498754180547001418536`, so this is not a counterexample to aggregated
beta-prime.

The new scoped claim
`E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` is refuted. Canonical
`E993-R19-FIXED-GAMMA-HALL` remains open over the governed RTree model until
the same-byte model bridge is proved. Lean formally verifies the frozen
arithmetic comparison only, not the graph/counting bridge. See the
[r23 summary](../experiments/r23-delete-retag-actual-tree.md) and
[verification record](../evidence/verification-2026-09-13-r23.md).

## Bounded Exclusions

- All 522,959 nonisomorphic trees through order 19 were checked with no
  descent-recovery witness.
- All 310,782 disconnected forest isomorphism types through order 18 were
  checked with no non-unimodal witness.
- An actual-factor replay checked 2,555,012 states and 10,394,520 order-14
  products, plus the stated hub-spider products, with no recovery.
- Complete center-code certificates cover all 823,065 nonisomorphic trees of
  order 20 and all 2,144,505 of order 21. Both contain zero recovery rows, and
  an independent implementation regenerated the carriers and checked every
  row. The sources and exact hashes are published under
  [`evidence/order-20-21-search`](../evidence/order-20-21-search/README.md).

These computations exclude finite ranges and tested mechanisms only.

## Proof-Gap Completion Update

Write `Delta_r(T)=i_(r+1)(T)-i_r(T)` in `Int`. The completed twelve-cycle
experiment established the following restricted results.

### Audited informal order band

If a finite tree has order at least 12 and satisfies

```text
Delta_4(T) < 0 < Delta_5(T),
```

then its order lies between 13 and 32. More precisely, if `mu(T)` is the
minimum cardinality of a maximal independent set, then `2<=mu(T)<=8` and the
surviving order is below the corresponding threshold

```text
N_2=17, N_3=20, N_4=23, N_5=26,
N_6=28, N_7=31, N_8=34.
```

This is an independently audited informal theorem, not a Lean theorem. It
does not exclude the remaining orders 13 through 32.

The terminal DRE synthesis also accepted at internal informal scope that
`i_4(T)>i_3(T)` for every tree of order at least 12, excluding the associated
`q=5,p=3` branch. Its final formalization audit did not reify the order-eight
base and leaf-restoration sublemmas, so this repository does not present it as
a formally verified theorem.

### Verified marked-extension identity

For an independent `(r-1)`-set `X`, let `e_X` count its available extension
vertices and let `m_X` count the edges in the induced extension residual
`R_spec(T,X)`. The included Lean theorem proves

```text
sum_X e_X = r i_r(T),
sum_X (choose(e_X,2)-m_X) = choose(r+1,2)i_(r+1)(T),
sum_X [e_X(e_X-r-2)-2m_X] = r(r+1)Delta_r(T).
```

At a positive `Delta_r`, the aggregate charge is positive. Therefore at least
one specified residual has positive charge. The theorem does not identify a
different operational residual, control each local sign, or supply the missing
descent to a smaller recovery tree.

### Refuted mechanisms

Two attractive routes fail exactly:

- the proposed actual-factor moment threshold is a positive multiple of the
  next coefficient difference and therefore reverses direction at a strict
  recovery; and
- universal nonpositive terminal residual charge is incompatible with the
  positive aggregate at every instantiated specified recovery carrier.

These are refutations of proof mechanisms, not counterexamples to Erdős #993.

## Other Governed Progress In The Research Line

- A decreasing terminal band for every finite forest.
- Positive log-concave convolution closure results.
- Plateau-safe extraction of an internal bottom from a non-unimodal finite
  sequence.
- An exact residual-surplus identity for independent sets.
- Conditional extraction of a positive residual witness from non-unimodality.
- Algebraic transport identities for component subproducts.

Not every governed declaration is included in this initial public package.

## Negative Knowledge

The research also eliminated broad classes of tempting approaches, including:

- universal log-concavity for tree independence sequences;
- arbitrary unimodal convolution;
- several fixed scalar transfer classes;
- multiple rooted monotonicity and covariance-sign proposals;
- circular classes defined by the target property itself.

These failures narrow the useful frontier toward tree-specific early-rank
structure and realizability-aware forest convolution.

## r23b (2026-09-17): the Delete/Retag correspondence discharged to one residual

Every cut-based strengthening of the aggregate is now refuted by exact witnesses
(orders 91 and 1567), so the surviving open object at literal scope is the O14
per-row demand `|P| ≤ |N|` itself. On it: paths closed at governed scope, stars
characterized, TYPE-2-DIRECT proved unconditional, LEMMA F3-1 sharp, the CB-arm
criterion proved in Lean. The relation-family transport lemmas and abstract
bridge corollaries are sorry-free; one named residual (O16) remains. Object of
record: the ordinary-tree object (Horn B), with the universal transfer as O15.

## r24 (2026-09-18): the signed top-rank residual identity

The direct attack on the literal complete favorable-original-leaf aggregate `S(T,p) ≤ 0` on the window
`x(T)+2 ≤ p < α(T)` left the headline open after six cycles, but produced the signed identity `(RI)` at the top
rank `p = α−1` on the residual class (every leaf in every maximum independent set): `S(T, α−1) = ℓM − Σ_B(|B∩L| −
Σ_{s∈B} λ(s))`, formally verified together with its four-hypothesis companion. Its weighted lower bound on the
non-flat residual class was named as terminal debt TD-6. See [r24](../experiments/r24-direct-favorable-leaf-aggregate.md).

## r25 (2026-09-22/23): uniform-in-`d` matching/cover theorems and forest order bounds

Fourteen formal awards across the run and its surgical addendum: the fixed-band and even-`d` perfect-matching
theorems, the uniform-in-`d` bottom-rank matching, the Catalan-gap monotone ratio, the `Bd` tail `Bd(r,r) < 0` for
`r ≥ 6`, the sharp forest descent order bound `Δ_k < 0 ⇒ n ≤ (k+1)²`, and the enumeration-free forest threshold
`Δ₃ > 0` at order ≥ 12. The `d = 5` band closed informally for every `r`; the forest-wide no-recovery headline
`E993-R25-UNR-FOREST-WIDE` stays open. The K1-addition closure `x(G ⊔ K₁) ≤ x(G)+1` was registered for `x ≤ 4`,
with a rank-5 residue at orders 22–25. See [r25](../experiments/r25-uniform-residual-no-recovery.md).

## r26 (2026-09-24): the top-rank residual sign `(RC)` is formally verified

For every finite tree with `2 ≤ α`, `x + 2 ≤ α − 1` and every leaf in every maximum independent set,
`S(T, α−1) ≤ 0` — TD-6 closed by an exchange ("forced neighbour") and grouped counting over the near-maximum
shell, composed with `(RI)`. Informally sharper: `S ≤ −2` on the eligible class, with `S = 0` exactly at `P₅` and
`S > 0` exactly at `P₃`, both outside the window. The r24 record's "realized by 1,420 eligible residual trees"
statement was a predicate substitution (realized count 0, now a theorem). At the r26 close, the all-rank aggregate stayed open, including interior ranks and the non-residual class. The later first-interior result and its current boundary are stated above. See [r26](../experiments/r26-top-rank-residual-sign.md).

## r27 (2026-09-24): the finite forest degree lemma and extension inequality are formally verified

On the program's G1 definitions of record, for every finite forest and every `k`:
`Σ_{J∈I_k} Σ_{v∈J} deg(v) ≤ 2k·i_k` and `n·i_k ≤ (k+1)·i_{k+1} + 3k·i_k` (Fang–Lu–Nevo–Yao–Zheng 2026 §8; in-run
injection proof of a stronger root-corrected lemma, not the paper's polynomial induction), with the unconditional
consequences `Δ_k < 0 ⇒ n ≤ 4k` (a linear order bound, strengthening the r25 `(k+1)²` award as a separate key),
`n ≥ 21 ⇒ Δ_5 ≥ 0` and `x < r ⇒ n ≤ 4r − 4`. The r25 rank-5 residue is empty; the K1-addition closure extends to
`x ≤ 5` at census grade. The true descent maxima are `4, 8, 11, 15, 18` for `k = 1..5` (order-20 census), so `4k`
is exact only at `k = 1, 2`. `(DL)` is never tight for `k ≥ 1` with `i_k > 0`, is false on `K_{2,3}`, and every
cycle satisfies it with equality. These are order bounds with sign `Δ_k ≥ 0` — not no-recovery statements.
See [r27](../experiments/r27-forest-degree-extension.md) and [verification](../evidence/verification-2026-09-24-r27.md).

## r28 (2026-09-25): the Hall/SDR route to the degree lemma is refuted; its true boundary is registered

An r27 critic had reformulated the forest degree lemma for trees as `Σ_{v∈Br}(deg v − 2)·c_v(k) ≤ Σ_{ℓ∈L} c_ℓ(k)` and
proposed the stronger leaf/slot dominance condition `(HS)`: for every threshold `t`, the branch slots with `c_v(k) ≥ t`
are at most the leaves with `c_ℓ(k) ≥ t` (by Hall, an injection from slots to leaves respecting `c_ℓ ≥ c_v`). r28 refuted
it: the order-22 tree with a root joined to three hubs, each carrying two pendant paths of three edges, has its root in
18 of the 19 independent 12-sets while every leaf lies in 17 — one slot at threshold 18, no leaf. Two critics found it
independently; all three adjudicators reproduced it; an isolated second read confirmed it by three methods, proved an
infinite family with unbounded shortfall, and enumerated all 5,623,756 trees of order 22 (unique failure; none below).
The degree lemma holds on the tree and is untouched. What survives, all formally verified: a leaf dominates every
vertex of its own pendant path (`c_{u_i}(k) ≤ c_ℓ(k)`, any finite graph); Theorem BTP — `(HS)` holds on every tree whose
branch tree has maximum degree ≤ 2 (caterpillars, spiders, brooms), sharp for every branch-degree bound; the
layer-cake reduction `(HS at t ≥ 1) ⇒ (DL)` with the r27 leaf/branch reformulation formalized; the forest composition
at its corrected hypothesis; the SDR/threshold equivalence; and their composition — a second, matching-type proof of
`(DL)` on the path-like class. Every proposed matching-type strengthening of `(DL)` on all trees fails on the same
order-22 tree, where the root's occupancy is the strict maximum over all vertices. Nothing here is a no-recovery
statement. See [r28](../experiments/r28-degree-lemma-hall-sdr.md) and [verification](../evidence/verification-2026-09-25-r28.md).
