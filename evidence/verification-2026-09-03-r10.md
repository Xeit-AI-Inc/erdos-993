# Verification Record: r10 Public Update

Date: 2026-09-03

This record binds the public r10 curation — the experiment summary and the
four `proofs/lean/r10-*` packages — to the sealed source run
`erdos-993-math-dre-20260902-r10-trs2-bt-closure`, without reproducing
internal prompts, raw returns, private paths, manifests, logs, or failed
workflow artifacts. TREE, FOREST, TRANSFER, the literal counterexample
target, and Erdős #993 remain open.

## Terminal Binding

| Run-relative terminal artifact | SHA-256 |
|---|---|
| `CLOSING-RECORD.md` | `2f2bc5b814ff817c31b3a2b2aac3dfada03464103da866e8319b4cd8872ef8fa` |
| `RUN-STATE.json` (closed) | `140085c400b1054fd1fbc073ab9ca02516d4c8d3f64be17816a1aa5257b16871` |
| `control/STUDY-INTERLUDE-1.md` | `f0007adde5ab2327ec0018abe34b6f1dc40675fca6ec524645b930425bc23156` |
| `control/STUDY-INTERLUDE-2.md` | `536a672051889e24fd43f34f93cbf9a4f371c03375b8bf7c3a613fd9c92dbe71` |
| `control/E10-DETERMINATION.md` | `4905d02a344ef1bbc8acaf86edf53c050ef7ae5e22c98ee3a4ecc4af1de0ebf7` |

## Gate Acts (four governed awards)

| Gate record | SHA-256 |
|---|---|
| `cycles/cycle-2/lean/C2-GATE.md` (recurrence package) | `ae7ac71aec536d497b2adbdfa902fc3faf3f0a5c709096052fa20e976eb6ef92` |
| `cycles/cycle-3/lean/C3-GATE.md` (NNSeq admission) | `6deebc29e06dc6d7cc6497a3b733e295211853b2d198b00c988f802f254d75cb` |
| `cycles/cycle-4/lean/C4-GATE-B05.md` (coefficient correspondence) | `5d04af37c3ea6f3e799b17bb3d01af1f4bde5f5968c7ba974d8b93e5effea40e` |
| `cycles/cycle-5/lean/C5-GATE-CA.md` (transfer to forest) | `d50e0451234606c3046849c57f45e5f044a095e553373701859d1c44b59cd280` |

Each award's scope conditions travel on its gate record and are reproduced
in the corresponding package README; every award is about constructed
objects over the run's own ground-truth model and asserts no unconditional
sequence property of any tree.

## Package Export

The four `proofs/lean/r10-*` packages carry sources byte-identical to the
sealed gated modules (per-module SHA-256 tables in each README). At
export, every package compiled at the pin (Lean 4.32.2, Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`, the run's read-only cache
manifest `52a4d73c…` asserted unchanged before and after) and all 19
checked declarations depend on axioms within
`[propext, Classical.choice, Quot.sound]`. The source run additionally
records, for every awarded module: dual independent critic rebuilds with
byte-identical artifacts, adversarial one-token mutants correctly failing,
and a final controller cold rebuild reproducing every awarded `.olean`
byte-identically.

The `r10-transfer-to-forest` package's convolution-closure module is a
source-level transplant of the r8 governed abstract theorem, byte-faithful
and re-proved in this lineage's own kernel builds; no r8 receipt is
transported. The scope determination that the sibling
unimodality-nonclosure result does not touch the consumed TRS2 closure is
bound above (`E10-DETERMINATION.md`).

## Claim Boundary

Nothing in this update proves or refutes TREE, FOREST, or TRANSFER;
exhibits a counterexample; or establishes independence. The headline
export is a CONDITIONAL theorem whose hypothesis — every tree's sequence
is TRS2 — was described here at publication time as "the open universal
branch of the tree-TRS2 obligation." **[Corrected 2026-09-03: that
universal branch is refuted at order 26; see
`../docs/erratum-2026-09-03-universal-tree-trs2.md`. The verification
statements in this record — digests, compilation, axioms, grades — are
unaffected.]** Grades named `governed` are the source run's rubric grades and
are not `formally_verified`. Zero-hit searches cited in the run's lineage
are bounded evidence and never universal evidence.
