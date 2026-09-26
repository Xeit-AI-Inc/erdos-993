# Problem And Status

## Definition

For a finite simple graph `G`, let `i_k(G)` count the independent vertex sets
of cardinality `k`, and let `alpha(G)` be the largest such cardinality. The
independent-set sequence is

```text
(i_0(G), i_1(G), ..., i_alpha(G)).
```

A finite sequence is weakly unimodal if it weakly increases to at least one
mode and then weakly decreases.

## Erdős #993

The problem asks whether the independent-set sequence is weakly unimodal for:

1. every finite tree; and
2. every finite forest.

These are distinct proof obligations. The independence polynomial of a
disjoint union is the product of the component polynomials, so passing from
trees to forests requires controlling convolution. Arbitrary unimodal
sequences are not closed under convolution.

## Current Boundary

As of the 2026-09-26 six-cycle lower-region close, both headline targets remain open. No verified counterexample, complete proof, or formal independence result is in this record. The final identity count is `434 identities: 262 VERIFIED, 96 REFUTED, 26 CONDITIONAL, 50 OPEN`; registered identities mix formal, informal, computational, conditional, refuted and open grades.

The formal record includes the rank-four local log-concavity result; G1 residual and forest order bounds; the non-residual first-interior aggregate; r29's high-tail pointwise mechanism and non-residual top-rank aggregate; and the lower-region marked-isolate, ordinary-leaf and first-shell order bands. The ordinary all-rank favorable-leaf aggregate is still open. Its lower eligible remainder has `x+2≤p≤⌊2α/3⌋`; the new formal order bands cover `n≤2p+2` at their exact guards. A family proof for `T_m` and restricted heterogeneous evidence do not extend to arbitrary trees. See [current results](results.md), [experiment](experiments/lower-region-compensation-dre-2026-09-25.md), and [assessment](assessment-2026-09-25.md).

Earlier work narrowed a specific rank-four-to-rank-five recovery configuration and ruled out many finite cases; the general first-recovery problem remains open. Universal tree log-concavity is refuted by an order-26 tree, without deciding unimodality; see the [erratum](erratum-2026-09-03-universal-tree-trs2.md). The r28 universal leaf/branch-slot Hall condition is also refuted while its restricted branch-tree result and the underlying forest degree lemma remain valid. No generic convolution argument yet transfers a tree result to every forest.

## Why Log-Concavity Is Not The Whole Problem

Log-concavity of a positive sequence implies unimodality, but independence
polynomials of trees need not be log-concave. A successful universal argument
must therefore be weaker or more structural than global log-concavity.
