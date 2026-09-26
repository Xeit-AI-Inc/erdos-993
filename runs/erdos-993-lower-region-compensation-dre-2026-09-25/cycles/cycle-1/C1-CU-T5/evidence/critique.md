# C1-CU-T5 evidence: audit of C1-T5

## Source integrity and scope

The case packet pins for `C1-T5/REPORT.md`, `C1-T5/RETURN.json`, and `C1-T5/evidence/rooted-transfer.md` matched. All fifteen hashes listed in `C1-COMMON.json` matched as well. I read the four `read_first` files, the allowed `control/C1-CRITIC-BRIEF.md`, and the three exact case-listed worker files. The standing-control checks below read only the pinned `t22-order91.json` and `t60-order243.json` files.

## Claim C1-T5-1: algebraic audit

Fix an original support `s`, with original leaf-neighbor set `L_s` of size `m_s`. In `T-s`, the components rooted at non-leaf neighbors `w` are disjoint. Their independence polynomials multiply; choosing each root or not gives the usual rooted recurrence `J=product(J_i)+z product(E_i)`, while deleting the root gives `E=product(J_i)`. The other `m_s-1` original leaf neighbors of `s` contribute `(1+z)^(m_s-1)` to `T-{v,s}` and are absent from `T-N[s]`. Thus the source's `P_s,Q_s` satisfy

`I(T-{v,s})=P_s`, `I(T-N[s])=Q_s`.

Partition independent sets of `T-v` by whether they contain `s`. The sets containing `s` exclude every neighbor of `s`; after removing `s` itself their polynomial is `z Q_s`. Hence `I(T-v)=P_s+zQ_s`. All `v` in `L_s` therefore have the same strict selector value `Delta_p(P_s+zQ_s)<0`. By linearity of the coefficient-difference operator, each selected leaf contributes `Delta_(p-1)(P_s-Q_s)`, and summing over the distinct leaves gives the factor `m_s`:

`S(T,p)=sum_{s: Delta_p(P_s+zQ_s)<0} m_s Delta_(p-1)(P_s-Q_s)`.

This derivation holds for every finite ordinary tree and every integer rank where the zero-extended differences are defined; it does not use the eligibility inequalities. It handles the two-vertex tree as well (the empty products are 1). The transfer is an exact identity, not a sign theorem.

## Standing-control replay

For each supplied control JSON, I grouped its recorded `complete_row.summands` by original support and checked: the reported rank guards, equal recorded summands inside each fibre, the sum of all recorded terms, and the sum of `fibre_size * common_fibre_term`.

- T22: `(order,a,x,p)=(91,68,32,34)`, so `x+2<=p` and `3p=102<137=2a+1`. It has 67 selected leaves in 23 fibres (one singleton plus 22 fibres of size 3). Every recorded fibre is constant; both term-sum checks equal `-498754180547001418536`. One selected term is positive (`+212336130412243110`), while the full sum is negative.
- T60: `(order,a,x,p)=(243,182,87,90)`, so `x+2<=p` and `3p=270<365=2a+1`. It has 181 selected leaves in 61 fibres (one singleton plus 60 fibres of size 3). Every recorded fibre is constant; both term-sum checks equal `-1058142362147652597702654588268394677176033202323316960380`. One selected term is positive (`+2935177632783649903488454322226807645411570590073000`), while the full sum is negative.

This is an arithmetic replay of the supplied rows, not an independent reconstruction of either tree or recomputation of its independence polynomial. These controls confirm that a pointwise nonpositive summand invariant is false on eligible cases and that preserving fibre multiplicity gives the recorded global sum. They do not establish a new inequality or refute the aggregate.

## Claim E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE

The route supplies no compensation inequality across selected fibres and no eligible tree with a positive complete sum. Its proposed-open conclusion is valid only as a description of what that route established. The transfer reduction makes the unresolved step explicit but does not resolve it. Neither the controls nor the exact identity decide the universal target. No imported theorem was used.

## Limitations

- The T22/T60 checks group and sum the source's recorded rows; they do not independently replay the graph encodings or coefficients.
- The support-fibre formula is a reformulation with exact multiplicity, not a proof that its sum is nonpositive.
- The route's failure to prove or refute the target is not a mathematical proof that the target is open in any broader adjudicative sense.
