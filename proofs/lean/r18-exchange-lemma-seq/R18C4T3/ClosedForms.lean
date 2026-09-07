import R14C4T.ShadowBand

/-!
# R18C4-T3 — GATE-2 scoped Lean: the two closed forms

Continues `R18C4T3.GovernedCore` (see that file's module docstring for the
route's AMD-9 line, charge, and the reserved-zone reason every declaration
here is a `def`-transcription rather than a re-derived `theorem`: both
closed forms below are, per the sealed record's own account, established
from the SAME peeling construction `(★)` uses
(`|N[z_j] ∩ V_{j−1}| = deg_T(z_j)`, `cycles/cycle-2/stage3/R18C2-T1.md`
:133-134, "pairwise non-adjacency of the `z`'s in a tree"), which walks the
reserved rooted-recursion zone. This route CONSUMES both closed forms,
citing their sealed source, and does not reprove them from `RTree`
adjacency primitives.
-/

namespace R18C4T3

open RTree

/-- **Closed form 1** (`GATE-2` §2 item 2). Sealed source:
`cycles/cycle-2/stage3/R18C2-T1.md`:136, cited there as `T1-CRIT-F` M-9,
verified by ADJ-T at ADJ-N5 (696/696 checks, 0 failures) and "proved
analytically by ADJ-T from `|N[z_j] ∩ V_{j−1}| = deg_T(z_j)` — pairwise
non-adjacency of the `z`'s in a tree" (same file, same lines) — CONSUMED
verbatim, cited, not re-derived (module docstring above).

`n` is the order of the base tree at the sealed instance
(`cycles/cycle-1/stage3/R18C1-T1.md`:92-97: `W := T∖N[v]`, order `n−2`,
so `n` is `t.vertices.card` before any deletion); `j` the position of the
branch remnant under a fixed enumeration of `g`'s other neighbors; `z`
names that enumeration (`z j` is `g`'s `j`-th other neighbor); `Rem` the
branch remnant Finsets, exactly as in `GovernedCore.GovernedDeletionIdentity`.
Every symbol is bound to a real governed field (`t.degree`, `Finset.card`)
— never a severed numeric variable standing in for `deg_T(z_j)` or
`|Rem_j|`.

**`def`, not `theorem`**: a structure-carrying NAME for the sealed
equation, per `GATE-2`'s "consume, cite, do not re-derive" charge. -/
def RemnantClosedForm
    (t : RTree) (n j : ℕ) (z : ℕ → List ℕ) (Rem : ℕ → Finset (List ℕ)) : Prop :=
  ((Rem j).card : ℤ) = (n : ℤ) - 2 - (j : ℤ) - (t.degree (z j) : ℤ)

/-- **Band-eligibility criterion** (`GATE-2` §2 item 3). Sealed source:
`cycles/cycle-2/stage3/R18C2-T1.md`:137, the same ADJ-N5 verification
(696/696, 0 failures) as `RemnantClosedForm` above — CONSUMED, cited, not
re-derived, for the identical reserved-zone reason (module docstring):
establishing this "iff" from real tree adjacency walks the same rooted
branch-peeling construction that produces `Rem_j`, inside the reserved
`I/A/B` zone (`Ipoly_node`/`Apoly_node`/`Bpoly_node`) this seat's charge
bars outright.

`k_shell` is bound to its own frozen definition
(`CYCLE4-ALLOCATION.md`/RUL-C1-8: `k_shell := |U| − (2p−2)`) inline as
`(U.card : ℤ) − (2 * p − 2)`, never treated as an independent free
integer disconnected from the real `U : Finset (List ℕ)` it names.
`tCount` is the sealed record's `t := deg_T(g) − 1` (renamed here for the
same reason as in `GovernedCore`, to avoid colliding with `t : RTree`).

This closed form is stated **independently** of `RemnantClosedForm` above
(the sealed record cites both as separate, independently-verified closed
forms, `R18C2-T1.md`:131-138 — this route does not attempt to derive one
from the other, since doing so would require the additional, uncited
relation between `n`, `|U|`, and `tCount` that only the reserved peeling
construction supplies; inventing that relation here would be new,
unverified mathematical content, exactly what `GATE-2`'s scope excludes). -/
def BandEligible
    (t : RTree) (p tCount j : ℕ) (U : Finset (List ℕ)) (z : ℕ → List ℕ)
    (Rem : ℕ → Finset (List ℕ)) : Prop :=
  ((Rem j).card : ℤ) ≤ 2 * (p : ℤ) - 3 ↔
    (t.degree (z j) : ℤ) ≥
      ((U.card : ℤ) - (2 * (p : ℤ) - 2)) + (tCount : ℤ) + 2 - (j : ℤ)

end R18C4T3
