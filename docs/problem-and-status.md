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

As of this repository's 2026-08-31 release, both targets remain open in the
research record. No verified counterexample, complete proof, or formal
independence result has been found.

The strongest included graph theorem proves strict log-concavity at rank four
for finite trees of order at least 27. The latest completed experiment also
isolates the remaining first-recovery capacity gap as a specific
neighborhood-shadow inequality and verifies two auxiliary interface theorems.
The shadow inequality itself remains unproved.

The latest proof-gap completion experiment independently narrows the specific
condition `i_5<i_4<i_6` to orders 13 through 32. Complete searches exclude a
descent followed by recovery at orders 20 and 21, but the other orders in that
band and the general first-recovery problem remain open.

Two later completed experiments do not change that boundary. Code's r6
corpus is computation grade under its own rubric, explicitly not
`formally_verified`. The r7 joint-shadow-incidence run has twelve exact
kernel-checked and fidelity-reviewed auxiliary or conditional declarations;
they exclude rank-one first recovery and establish several exact local or
component identities, but none supplies the strict joint inequality, carrier,
or transfer argument needed for a headline target.

## Why Log-Concavity Is Not The Whole Problem

Log-concavity of a positive sequence implies unimodality, but independence
polynomials of trees need not be log-concave. A successful universal argument
must therefore be weaker or more structural than global log-concavity.
