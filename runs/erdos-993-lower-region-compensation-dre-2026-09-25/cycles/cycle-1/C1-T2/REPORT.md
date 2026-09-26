# C1-T2 search result: leaf-support pruning does not preserve the lower-region induction domain

## Exact result

For any original leaf `v` of a tree `T`, write `s=s_v`, `H=T-{v,s}`, `B=N_T(s)\\{v}`, and `R=T-N_T[s]=H-B`. Let `P_G(z)=sum_j i_j(G)z^j`, with zero extension. Decomposition according to whether `s` is selected gives

`P_T=(1+z)P_H+zP_R`,

whereas deleting only the leaf gives

`P_(T-v)=P_H+zP_R`.

Consequently, for every integer `p`,

`Delta_p(T-v)=Delta_p(H)+Delta_(p-1)(R)`,

`Delta_p(T)=Delta_p(H)+Delta_(p-1)(H)+Delta_(p-1)(R)`,

and the contribution indexed by `v` to the proposed aggregate is

`Delta_(p-1)(H)-Delta_(p-1)(R)`.

These exact identities track the fixed selector: `v` is favorable precisely when the first displayed sum is strictly negative. They do not make favorability a property of `H` alone or of the summand's sign. In particular, pruning another leaf-support pair changes the polynomial used in the selector; replacing `F(T,p)` by a selector recomputed on a pruned/grafted tree is not justified by these recurrences.

## Exact lower-guard failure under pair pruning

Take `T=K_(1,12)` and `p=8`. Its polynomial is `(1+z)^12+z`, so `a=12`; the first negative difference is `Delta_6=-132` (with `Delta_5=132`), hence `x=6`. Thus `x+2<=p` and `3p=24<25=2a+1`. For each original leaf `v`, `T-v=K_(1,11)` and `Delta_8(T-v)=C(11,9)-C(11,8)=-110<0`, so all 12 distinct original leaf tags are selected.

Prune any one leaf together with its support. The residual graph is 11 isolated vertices, with polynomial `(1+z)^11`, independence number `a'=11`, and first strict descent `x'=6` (`Delta_5=0`, `Delta_6=-132`). The same rank still satisfies `x'+2<=8`, but fails the lower-region condition: `3p=24` is not less than `2a'+1=23`. Thus even the simplest eligible target tree has an ordinary leaf-support pruning whose residual object exits the induction domain. This is a precise obstruction to a proof that assumes the proposed lower-region claim is closed under this pruning. It does not obstruct an induction with additional compensation or a stronger invariant.

For completeness, the target aggregate on this control is directly `-1980`: here `H` consists of 11 isolated vertices and `R` is empty, so each selected summand is `Delta_7(H)-Delta_7(R)= (C(11,8)-C(11,7))-0=-165`, counted once for each of 12 original leaves. The example illustrates domain loss while the original full sum remains negative; it is not a counterexample.

## Induction/minimal-witness status

No closure lemma for the exact selected aggregate was established. The identities leave two linked obligations for a successful prune/graft argument: (i) account for the change in `a` and the first strict descent `x` so that both rank guards are preserved or explicitly repaired, and (ii) retain the original selector `F(T,p)` with all same-support tags, or prove a compensation inequality for tags entering and leaving it. A proof that simply applies induction to the pruned tree and reselects favorable leaves would change the theorem's fixed index set. No argument here shows that a hypothetical minimal positive witness can be reduced while preserving the guards and its complete sum.

The calculation is symbolic for the leaf-support recurrence and exact for the stated star instance. No exhaustive search, external theorem, or universal claim is used.
