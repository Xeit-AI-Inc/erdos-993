# C1-CF-T5 independent audit (orientation F)

## Scope and disposition: C1-T5-1

**Disposition: retained.** For a leaf `v` supported at `s`, write `m_s` for the number of original leaf neighbors of `s`, and let the components of `T-s` rooted at non-leaf neighbors `w` have rooted messages `J_{s,w}=I(C_{s,w})`, `E_{s,w}=I(C_{s,w}-w)`. In `T-{v,s}`, each of the other `m_s-1` original leaves is isolated and each non-leaf branch remains intact, giving `P_s=(1+z)^(m_s-1) product_w J_{s,w}`. In `T-N_T[s]`, each branch root is removed and the remaining branch contributes `E_{s,w}`, giving `Q_s=product_w E_{s,w}`. Partitioning independent sets of `T-v` by whether they contain `s` gives `I(T-v)=P_s+zQ_s`.

Thus `Delta_p(T-v)=Delta_p(P_s+zQ_s)` is constant over the entire original support fibre, and each selected leaf contributes `Delta_(p-1)(P_s-Q_s)`. Counting all `m_s` leaves gives exactly

`S(T,p)=sum_{s:Delta_p(P_s+zQ_s)<0} m_s Delta_(p-1)(P_s-Q_s)`.

This is an exact identity, valid with integer zero-extension. It preserves distinct same-support leaf tags. The rooted two-message recurrence is a computation/reformulation of the target data, not an inequality or proof of compensation across supports.

## Control replay

`rooted_transfer_replay.py` independently builds the two named `T_m` trees from their stated recipe and computes forest independence polynomials by a separate include/exclude DP. It also computes rooted `J,E` messages, compares their `P_s,Q_s,P_s+zQ_s` against direct graph-deletion polynomials for every leaf, checks every rank selector, and scans `Delta_j(T)` through `j=alpha(T)` for `x`.

- `T_22`, order 91, `a=68`, `x=32`, `p=34`: eligibility passes; 67 leaves are selected. The marked one-leaf fibre has selector `-24528898691191536776` and summand `+212336130412243110`. The rooted-fibre sum is `-498754180547001418536`.
- `T_60`, order 243, `a=182`, `x=87`, `p=90`: eligibility passes; 181 leaves are selected. The marked one-leaf fibre has selector `-15565770095057318183957442334118197772104728039077642600` and summand `+2935177632783649903488454322226807645411570590073000`. The rooted-fibre sum is `-1058142362147652597702654588268394677176033202323316960380`.

Both replayed complete sums match the common handoff's standing controls; each has positive local contributions with a negative total. This rules out pointwise nonpositivity as a universal closure for this transfer state. The two named cases are checks only, not an exhaustive census or a proof of the aggregate.

## Disposition: E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE

**Disposition: retained, narrowly as a report about the source route's result.** The source supplies no proof, no eligible positive complete sum, and no global compensation inequality. Its transfer formula is equivalent to the selected aggregate, so it neither proves nor refutes the registered lower-region assertion. The proposed `proposed_open` status is acceptable only for “open on this evidence”; this critique makes no global status award.

## Limits

The replay checks two prescribed trees only. It does not reconstruct a broader generation domain, prove an induction invariant, or settle whether any eligible ordinary tree has positive full aggregate. No literature bridge is involved. The common T22/T60 control rows are used solely as finite controls.
