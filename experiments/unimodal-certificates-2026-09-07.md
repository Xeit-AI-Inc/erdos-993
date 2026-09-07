# Unimodal Certificates Experiment (Claude)

Completed: 2026-09-07 (two phases, one day; sealed).

## Charter and outcome

Chartered: a canonical decomposition of every tree's independence
sequence into a nonnegative sum of shifted symmetric unimodal blocks
with aligned centers — a "unimodality certificate" whose closure under
tree operations would prove the conjecture.

**Outcome: the chartered object is impossible, by proof.** The run's
one theorem (`E993-CERT-WINDOW-LB`): the common-peak criterion is the
complete sound certificate family; its optimal member (the comonotone
mode-centred box certificate) has exactly computable drift `S(T)`; and
`S(T) ≥ |α(T) − 2·mode(T)|`, which grows linearly on paths (mode/α →
≈0.5528). Every fixed-window scheme — four families tested exhaustively
to order 16 — dies as a special case.

**The surviving measured conjecture** (`E993-LAMBDA2-CONJ`, OPEN): the
graded certificate at slack 2, slope ≤ 1/5, strictly stronger than
unimodality. Exhaustive through order 22 — 7,768,261 trees at orders
21–22, zero violations, calibrated fail-closed and cross-checked
tree-for-tree against the sealed census's dual-implementation
sequences. It saturates at order 22: three near-corona trees (a
degree-12 hub with nine pendant-bearing neighbours) attain 1/5 exactly
and push max drift to 4. Tight where first tested; the caveat rides on
the claim's face. The non-log-concave Kadrawi–Levit trees certify with
tiny windows — the certificate captures what log-concavity misses.

**Strategic residue** (feeding the mode-synchronization pair-invariant
program): the mode of a tree's independence sequence never retreats
under leaf deletion or closed-neighborhood deletion (steps in {0,1},
all four combinations realized); convolution controls block centres
while unimodality is decided at modes, and for trees these drift apart
linearly; the disjoint-union closure `S(T₁⊔T₂) ≤ max(S₁,S₂)+1` is
unfalsified (4,560/4,560).
