# r23 Actual-Tree Delete/Retag Correspondence

Completed: 2026-09-13. One complete cycle of nine allowed cycles, stopped on a
decisive exact-scope refutation.

## Charter And Outcome

The run reconstructed the literal ordinary-tree instance of r19's fixed
Delete/Retag relation. Cycle 1 used 10 T routes, 10 F routes, and 10 U routes,
followed by 60 isolated cross-orientation critics, three portfolio
adjudicators, one neutral synthesis, and one governed Lean gate.

The literal source and target sets satisfy the exact tagged identity

```text
|P| - |N| = S(T,p),
```

where `S(T,p)` is the complete sum over favorable original leaves. Hall for
the literal relation would imply the desired aggregate sign, but the converse
need not hold.

The universal literal Hall claim is false. On the eligible order-91 tree
`T_22` at rank `p=34`, all 67 original leaves are favorable and a center-free
source cut has

```text
|X| = 1020660578375268831042,
|Gamma_actual(X)| <= 1006434057637648542672.
```

Its deficit is `14226520737620288370`. The same row's complete aggregate is
`-498754180547001418536`, so this refutes the all-cut Hall mechanism without
refuting aggregated beta-prime. T60 at order 243 independently corroborates
the same separation.

## Claim Status

- `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`: **REFUTED**.
- `E993-R19-FIXED-GAMMA-HALL`: **OPEN**, because its canonical scope is the
  governed RTree model and the same-byte ordinary-tree/RTree bridge remains
  open.
- `E993-BETA-AGG`: **OPEN**.
- TREE, FOREST, TRANSFER, and Erdős #993: unchanged and open.

The distinction between the first two rows is binding. A changed relation must
receive a new name, and the literal-scope counterexample may not be transferred
to the governed model merely by renaming it.

## Formal Scope

Lean formally verifies the frozen arithmetic certificate

```text
Z(22,34) = 1020660578375268831042,
Z(22,33) = 1006434057637648542672,
Z(22,33) < Z(22,34).
```

It also compiles generic carrier-avoidance and finite Hall-cut lemmas. The
terminal theorem contract covers only the closed arithmetic certificate. Lean
does not formalize the T22 graph, leaf/favorability enumeration, concrete cut
and container, or their cardinality bridge. The headline Hall refutation is an
independently criticized informal proof backed by exact computation.

## Next Entry Point

Do not continue universal all-cut Hall for this literal relation. The next
aggregate-beta experiment should attack the weaker exact condition

```text
|P| <= |N|  <=>  S(T,p) <= 0
```

through signed cancellation, recurrence, aggregate mass transport, or a
tree-derived total-capacity theorem. T22 and T60 are mandatory compensation
tests because proper-cut Hall fails while total aggregate mass remains
negative.

The [verification record](../evidence/verification-2026-09-13-r23.md) binds
the public summary to the sealed internal run. The public Lean package is
[`r23-t22-arithmetic-certificate`](../proofs/lean/r23-t22-arithmetic-certificate/README.md).
