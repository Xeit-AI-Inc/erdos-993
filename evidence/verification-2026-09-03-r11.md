# Verification Record: r11 Public Update

Date: 2026-09-03

This record binds the public r11 curation — the experiment summary and the
four `proofs/lean/r11-*` packages — to the sealed source run
`erdos-993-math-dre-20260903-r11-corridor-transport`, without reproducing
internal prompts, raw returns, private paths, manifests, logs, or failed
workflow artifacts. TREE, FOREST, TRANSFER, PAIR-G4, the literal
counterexample target, and Erdős #993 remain open.

## Terminal Binding

| Run-relative terminal artifact | SHA-256 |
|---|---|
| `CLOSING-RECORD.md` | `d3d2a93bf90da4315075cf143a1134a3a4078a37568c5b25c4130bca13f7fe24` |
| `RUN-STATE.json` (closed) | `ec4c828ec1c4b8480d6b384d69fe581f29eb6b0251925e6bf1e0f3629698b9ae` |
| `control/STUDY-INTERLUDE-1.md` | `3dba37e6bcbaa91f3e21d15b59048da4ee84fca69ef720b15b26de8cb36e13ed` |
| `control/STUDY-INTERLUDE-2.md` | `9d636a34a3b5843e715db65b075d1877c665d73d256a8a29e55e7ec2bf2d1ecb` |
| `control/RESIDUE-REGISTER.md` | `dacf49b71b5dfec9cc644825672ca84afad800fc1bfda4a12e1438c8844b4dfe` |
| `cycles/cycle-5/DOCUMENTARY-CORRECTIONS-ACT.md` | `57afbe5e42ae231862eedf1760c2b361070424fc4785026252db024ee84db888` |

## Gate Acts (four governed awards)

| Gate record | SHA-256 |
|---|---|
| `cycles/cycle-2/lean/C2-GATES.md` (GATE-R11-A and -B) | `e0a330f5152cf60939c9e11e77b2eeb1280da5ec4de14e3218ea622900f97a7c` |
| `cycles/cycle-3/lean/C3-GATE.md` (GATE-R11-C) | `73b598ece68df1244429b7ffe0eb55905bbfe969dd9e979eddb7cbfaacc85f13` |
| `cycles/cycle-5/lean/C5-GATE-D.md` (GATE-R11-D) | `26d2fa0cec207d87a9313771fe8aaf8226fa254bca33c68f248097ad57579d25` |

## Package Export

Each package ships the byte-identical gated snapshot of the (nested)
module at its award:

| Package | Source SHA-256 | Lines |
|---|---|---|
| `r11-corridor-interface` | `4180da7c8150f1a03746c8a32bbcaad67fbfa9c1f4571a41187f1bf0fadabd63` | 1,151 |
| `r11-corridor-interface-extended` | `d78627e852075fd68b013ef73dac6b37ea3a19a1c628729cf3de76de071cd4f1` | 1,745 |
| `r11-bridge-predicate` | `b7cec761722028a7cab068b58091a78debeebfc17dd1830bd1a1f780e33cba0f` | 2,121 |
| `r11-ingredient-reductions` | `d846b17d32252c447b09197cf2b051b24be5153220da760935a44b95897ffd8a` | 2,540 |

Each later package's consumed region is byte-identical to the previous
package's full source, verified at each gate act. At export, all four
packages compiled at the pin (Lean 4.32.2, Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`, the run's read-only cache
manifest `52a4d73c…` asserted unchanged before and after) and all checked
declarations depend on axioms within
`[propext, Classical.choice, Quot.sound]`. GATE-R11-D's evidence shape is
source-only by deliberate ruling: six independent full elaborations of
identical bytes (five of record in the sealed run, plus the controller's
final re-elaboration), three independently-authored axiom-check files,
and six planted one-token faults all failing correctly.

## Claim Boundary

Nothing in this update proves or refutes any headline target or the
corridor obligation. The headline export is a pair of KERNEL-CHECKED
REDUCTIONS of two open conjectures to one named missing lemma — the
conjectures themselves are not proved, not refuted, and not asserted, and
the exhaustive order-≤18 zero behind them is bounded evidence cited as
nothing. Grades named `governed` are the source run's rubric grades and
are not `formally_verified`.
