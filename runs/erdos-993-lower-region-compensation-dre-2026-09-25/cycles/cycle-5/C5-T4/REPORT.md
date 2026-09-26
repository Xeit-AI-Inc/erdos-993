# C5-T4 search report: pendant-path selector propagation

## Result

I prove an exact boundary-state recurrence for the fixed strict leaf selector under the operation of attaching a pendant path at a specified vertex. It determines every old leaf's selector value separately (including leaves with a common support), removes the attachment vertex from the old-leaf list when that vertex was a leaf, and gives the new endpoint's selector test. The recurrence is a selector propagation rule, not a sign-preservation theorem: its correction can change the strict sign.

## Definitions and lemma

For a rooted finite forest `(G,r)`, define

`A_{G,r}(z)=I_{G-r}(z)` and `B_{G,r}(z)=z I_{G-N[r]}(z)`,

where `I_H(z)=sum_j i_j(H)z^j` is the independence polynomial. These are the independent-set generating polynomials according as `r` is absent or present; hence `I_G=A+B`. Let `P_0=1`, `P_1=1+z`, and `P_m=P_{m-1}+zP_{m-2}` for `m>=2`; this is the independence polynomial of the path on `m` vertices.

Attach a path with vertices `w_1,...,w_m` and edges `rw_1,w_1w_2,...,w_{m-1}w_m`, forming `G_m`. Partition independent sets according to whether `r` is absent or present. If absent, the attached path contributes `P_m`; if present, `w_1` is forbidden and the remaining path contributes `P_{m-1}`. Therefore

`I_{G_m}=A_{G,r}P_m+B_{G,r}P_{m-1}`.  (1)

Equivalently the rooted boundary state updates exactly as `(A,B) -> (A P_m, B P_{m-1})`. For every integer rank `p`, the strict selector statistic is thus

`Delta_p(G_m)=[z^(p+1)](A P_m+B P_{m-1})-[z^p](A P_m+B P_{m-1})`.  (2)

This is a complete boundary state for this operation and all ranks: the two polynomials determine the attached independence polynomial and every required coefficient, including zero extension above the degree. For a sequence of attachments at the same root one may iterate the boundary-state update. No assumption about log-concavity or monotonicity of the coefficient differences is used.

## Applying it to a tree's fixed selector

Let `T` be an ordinary tree and attach the path above at `r`, producing `T_m`. Each old original leaf `v != r` remains an original leaf, one summand tag per vertex even if several such leaves share their support. Set `G_v=T-v`; root it at `r`. Its selector membership after attachment is exactly the strict inequality in (2) with `(A,B)=(I_{G_v-r}, z I_{G_v-N[r]})`. This computes each tag independently and retains all other leaves, including other leaves at the same support, in `G_v`.

If `r` itself was an old leaf, it has degree two in `T_m` and is no longer an original leaf, so it is not in the new original-leaf selector. For `m>=1`, the new endpoint `w_m` is an original leaf; its selector test is `Delta_p(T_{m-1})<0`, where `T_0=T` and `T_{m-1}` denotes the shorter attachment at the same root. For `m=1`, this reads `Delta_p(T)<0`. These statements concern the strict selector at a fixed rank. The primary problem's conditions on `x(T_m)`, `alpha(T_m)`, `p`, and `3p<2alpha(T_m)+1` must be checked separately; (1) does not propagate those guards or the global sum `S`.

## Exact sign-change example

Take `T=K_{1,7}`, attach one new leaf at its center `r`, and let `v` be any one of the seven old leaves. Before attachment, `T-v=K_{1,6}` has independence polynomial

`1+7z+15z^2+20z^3+15z^4+6z^5+z^6`,

so `Delta_3(T-v)=15-20=-5<0`. For its root state, `A=(1+z)^6` and `B=z`; hence `Delta_2(A)=20-15=5`. Formula (1) for `m=1` gives `Delta_3(T_m-v)=-5+5=0`, so this old leaf leaves the strict selector. Directly, `T_m-v=K_{1,7}` has polynomial `1+8z+21z^2+35z^3+35z^4+21z^5+7z^6+z^7`, with `Delta_3=0`. The strict sign can therefore change even at a shared support, with every old leaf tag still separately covered by the formula.

This example is only a selector-mechanics check: it does not meet the primary eligibility condition `x(T)+2<=p` (for `K_{1,7}`, `x=4`, since `Delta_3=0` and `Delta_4<0`). It is not a counterexample to the primary aggregate.

## Scope, evidence, and unresolved work

The recurrence is an exact proved lemma for pendant-path attachment. It supplies the requested complete rooted boundary state and a concrete non-preservation example. It does not prove an eligibility-preserving closure/exclusion theorem, establish selector behavior only within the eligible lower region, or give a bound for the change in the selected aggregate. No primary literature is needed for this elementary decomposition. The coefficient checks for the example and the state/selector interfaces are recorded in `EVIDENCE.json`.
