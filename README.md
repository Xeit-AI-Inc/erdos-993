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

## Latest Research Boundary

The completed twelve-cycle proof-gap experiment narrowed a possible
rank-four-to-rank-five recovery to tree orders `13..32`, produced complete
no-recovery certificates at orders 20 and 21, and identified positive terminal
residual charge as necessary under the specified residual construction. It
also refuted two proposed universal proof mechanisms. These advances do not
close the remaining finite band or any all-order headline.

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

- [Problem and status](docs/problem-and-status.md)
- [Current results](docs/results.md)
- [Research methodology](docs/methodology.md)
- [Evidence policy](docs/evidence-policy.md)
- [Open research roadmap](docs/roadmap.md)
- [References](docs/references.md)
- [Lean package](proofs/lean/gap-bridge/README.md)
- [Rooted residual-profile Lean package](proofs/lean/rooted-residual-profile/README.md)
- [Marked-extension charge Lean package](proofs/lean/marked-extension-charge/README.md)
- [Order-20/21 computational evidence](evidence/order-20-21-search/README.md)

## Repository Status

This is a curated public research release. The internal sealed experiment
lineage is substantially larger than this repository. Only artifacts that are
appropriate for public verification and collaboration are published here.

See [STATUS.md](STATUS.md) for the exact claim boundary and
[RIGHTS.md](RIGHTS.md) before reusing material.
