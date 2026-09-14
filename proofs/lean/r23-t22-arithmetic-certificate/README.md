# r23 T22 Arithmetic Certificate

This package exports the byte-identical Lean source from the r23 terminal
workflow. Its contracted theorem is:

```lean
T22NoCenterHallFailureCertificate
```

It proves the two frozen binomial evaluations and their strict comparison.
The file also contains compiled groundwork and generic carrier-avoidance and
Hall-cut lemmas, but those declarations are not promoted beyond their stated
scope by the terminal theorem contract.

Build and check with:

```bash
lake build Erdos993R23
lake env lean check/KernelCheck.lean
lake env lean check/AxiomCheck.lean
```

Toolchain: Lean `4.32.2`; Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`.

Exact source SHA-256:
`d9849dfa976f4f36d35ffa73b3ea054d75119108f188a1bc04be2c2f509485c6`.

The theorem does not construct T22, prove its tree properties, enumerate its
favorable leaves, identify the concrete cut and target container, or prove
that their cardinalities equal the two `Z` values. It is therefore not the
full actual-tree Hall refutation and does not resolve aggregated beta-prime or
Erdős #993. See the
[verification record](../../../evidence/verification-2026-09-13-r23.md).
