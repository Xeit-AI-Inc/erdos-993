# C1-CF-T2 critique of C1-T2-1

## Disposition

**Retained.** The coefficient identities are valid for an original leaf and its support, and the stated `K_(1,12)` instance is an exact witness that deleting a leaf-support pair need not preserve the strict lower-region guard. This is a valid obstruction to a direct induction that requires that guard after every such deletion. It proves neither the primary aggregate nor its negation.

## Identity audit

Let `s` support original leaf `v`, `H=T-{v,s}`, `B=N_T(s)\{v}`, and `R=T-N_T[s]=H-B`. If `s` is absent from an independent set, `v` is free and the remaining set lies in `H`, giving `(1+z)P_H`. If `s` is present, `v` and `B` are forbidden and the remainder lies in `R`, giving `zP_R`. Thus

`P_T=(1+z)P_H+zP_R`, while after deleting `v`, the two cases give `P_(T-v)=P_H+zP_R`.

Taking adjacent coefficient differences with zero extension gives, for every integer `p`,

`Delta_p(T-v)=Delta_p(H)+Delta_(p-1)(R)`,

`Delta_p(T)=Delta_p(H)+Delta_(p-1)(H)+Delta_(p-1)(R)`,

and the target summand at `v` is `Delta_(p-1)(H)-Delta_(p-1)(R)`. These identities use the original graph and support. In particular, the first equation is the selector for `F(T,p)`; it does not license reselecting leaves after pruning. Multiple leaves with one support remain distinct summands.

## Exact pruning check

For `T=K_(1,12)`, `P_T=(1+z)^12+z`, so `a=12`, `x=6`, and at `p=8` both `x+2<=p` and `3p=24<25=2a+1` hold. For every one of the 12 original leaves, `P_(T-v)=(1+z)^11+z` and `Delta_8(T-v)=55-165=-110<0`; thus all 12 leaf tags belong to the fixed selector. Here `H` is 11 isolated vertices and `R` is empty, so each original summand is `Delta_7(H)-Delta_7(R)=(165-330)-0=-165`, and the complete original sum is `-1980`.

Deleting one original leaf and its support leaves 11 isolated vertices. Its independence polynomial is `(1+z)^11`, with `a'=11`, `x'=6` (`Delta_5=0`, `Delta_6=-132`). At the unchanged rank `p=8`, `x'+2<=p` holds but `3p=24<2a'+1=23` fails. The replay with full coefficient vectors is in `star-replay.json`; `replay_star.py` is the standalone reproduction. This finite example establishes the claimed failure of closure under pair pruning. It is not an aggregate counterexample: its full eligible sum is negative.

## Standing-control check and scope

The supplied order-91 `T22` control is eligible at `(a,x,p)=(68,32,34)` and has 67 selected leaves, a positive summand `+212336130412243110`, and complete aggregate `-498754180547001418536`. The supplied order-243 `T60` control is eligible at `(182,87,90)` and has 181 selected leaves, a positive summand `+2935177632783649903488454322226807645411570590073000`, and complete aggregate `-1058142362147652597702654588268394677176033202323316960380`. These listed exact rows show why a positive local term cannot be transported into a conclusion about the full sum. They are used here as supplied controls, not newly replayed computations.

No transport inequality, minimal-positive-witness reduction, preservation of the fixed selector under pruning, or compensation for lost lower-region eligibility is proved. Thus the route correctly limits the result to an exact recurrence and a counterexample to one induction-closure requirement. There is no citation or imported theorem to audit, no generation boundary or bounded census behind this claim, and no proposed status change to the OPEN primary aggregate.

## Limitations

- This review establishes the exact local recurrence and the stated finite pruning obstruction only; it does not prove or refute the full selected-leaf inequality.
- A different induction with an augmented invariant or compensation term remains possible.
- T22/T60 rows were read as authorized standing controls and were not independently recomputed in this review.
