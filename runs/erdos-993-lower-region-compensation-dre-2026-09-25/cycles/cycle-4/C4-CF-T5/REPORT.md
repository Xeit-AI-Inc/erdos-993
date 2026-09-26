# C4-T5 independent critique (orientation F)

## Dispositions

- `C4-T5-TM80-BOUNDED` — **retained_narrowed** to the stated exact family and horizon `m=1,...,80`, with corrected selector evidence. The bounded conclusion is true, but the sealed producer replay does not correctly compute the claw-leaf selector differences.
- `C4-T5-TM-ALL-OPEN` — **retained**. The coefficient identity does not prove a sign for every eligible `(m,p)`, and the route supplies no all-parameter selector or aggregate proof.

## Independent reconstruction

I reconstructed the labeled tree with vertices `a,b,r` and, for each `1<=i<=m`, a center `c_i` joined to `r` and three distinct leaves joined to `c_i`; the path edges are `a-b-r`. The graph has `4m+3` vertices. Reconstructing degree-one vertices from this edge list gives exactly `a` and the `3m` claw leaves. Their original supports are respectively `b` and the corresponding `c_i`; all claw leaves remain separate summands.

For each induced forest I used the generic rooted include/exclude recurrence: at a vertex, the selected state is `z` times the product of child-unselected polynomials, while the unselected state is the product of each child's selected-plus-unselected polynomials. This independently computes `P(T_m)`, each representative leaf-deletion polynomial, and `I(H_v), I(R_v)`. The representative orbit terms are multiplied by their graph-derived multiplicities `1` and `3m`. The script also derives `alpha`, the first negative difference `x` over `0,...,alpha` (including the terminal zero extension), all eligible ranks, and both strict selector tests.

Across `m=1,...,80`, this checked 1,749 eligible `(m,p)` rows, with 78 nonempty family members. Both orbit selectors are strict-negative in every eligible row, and every corrected complete selected sum is negative. At `m=3,p=7`, the graph-derived claw selector difference is `-110` (the arm difference is `-141`), while the per-leaf terms are `-125` for a claw leaf and `-42` for the arm leaf; the full sum is `-42 + 9(-125) = -1167`. For `m=3`, literal independent-subset enumeration also matched the recurrence on `T`, all 10 leaf deletions, and all corresponding `H_v,R_v` graphs (31 graphs total).

## Replay defect and its effect

The report gives the claw deletion polynomial as

`D_c,m=(1+2z)(1+3z+z^2)B^(m-1)+zL^(3m)`.

The sealed `replay.py` instead constructs `(1+3z+z^2)B^(m-1)+zL^(3m)`, omitting `(1+2z)`. Thus its recorded claw selector differences are not the actual `Delta_p(T-v)` values: all 1,749 differ from the graph-derived values. Despite this numerical defect, both versions yield a negative claw selector difference in all eligible rows. The `q`-terms and complete selected sums independently match on every row. The finite result is therefore retained with corrected evidence, not on the strength of the faulty claw differences.

The derivative identity itself is algebraically consistent: differentiating `P_m` and using `B'-4=3z(2+z)` gives the displayed `Q_m` identity. It is only a coefficient identity. The equality of `Q_m` with the fixed selected marked polynomial requires both selector tests, and the identity alone supplies no coefficient inequality proving the aggregate sign.

## Limits

This critique proves only the exact bounded family statement through `m=80`; it does not prove either orbit selector for all `m`, the aggregate sign for all eligible `(m,p)`, or the primary claim on arbitrary ordinary trees. No imported theorem, external literature, Lean, or exhaustive census of ordinary trees was used. The independent recurrence and literal checks are recorded in `audit.py` and `audit_evidence.json`.
