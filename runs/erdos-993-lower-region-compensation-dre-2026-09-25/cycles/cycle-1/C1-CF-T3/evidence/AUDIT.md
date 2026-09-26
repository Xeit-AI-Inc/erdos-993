# Cross-orientation mathematical audit

## Pins and source boundary

The case packet and common packet were read first. Every SHA-256 pin listed in those packets was recomputed before source use; all observed hashes matched. The case supplied exactly one source worker, C1-T3, with REPORT.md, RETURN.json, and evidence/SOURCE-HASHES.txt. The additional allowed control C1-CRITIC-BRIEF.md was also read. No source script was run and no sealed file was changed.

## Claim C1-T3-1: identity and specialization

The bipartite identity is correct on its stated finite domain. For a marked independent k-set A, the vertices addable to A in either fixed color class form an independent set together with A. Thus each color class contributes at most h-k addable vertices, so e(A) <= 2(h-k) and D >= 0.

Count pairs (A,z) with A marked, independent, |A|=k, and z addable. If an independent (k+1)-set B meets W once, deleting any of its k unmarked vertices gives a marked A, hence B contributes k pairs. If B meets W at least twice, deleting any of its k+1 vertices leaves a marked set, hence it contributes k+1 pairs. The latter B is counted once in C. This proves sum_A e(A)=kQ_(k+1)+C and therefore kQ_(k+1)+C=2(h-k)Q_k-D. Both correction terms are nonnegative.

For an original leaf v with support s, H=T-{v,s} and W=N_T(s)\\{v}; removing W from H gives R=T-N_T[s]. Also alpha(H)=alpha(T)-1: a maximum independent set of T can be converted, if needed, to one containing v by replacing s with v; after deleting v this gives an independent set of H of size a-1, while any independent set of H can be enlarged by v, so alpha(H)<=a-1. Thus the claimed h and k ranges follow from the contract: eligibility gives p>=2, and p< (2a+1)/3 implies p-1<=a-1.

More directly, with k=p-1, q(j)=i_j(H)-i_j(R), and Delta_k(G)=i_(k+1)(G)-i_k(G), the leaf summand is exactly q(k+1)-q(k). The identity also gives D+C=2(h-k)q(k)-kq(k+1); substituting h=a-1 and k=p-1 into the contract specialization yields k*g=(2a+1-3p)q(k)-(D+C)=k(q(k+1)-q(k)). The formula is valid tag by tag and sums over the fixed favorable set without collapsing leaves that share a support.

The identity is a correct auxiliary counting result, but it does not prove the primary sign. D,C>=0 alone gives no lower bound on their selected total by the positive coefficient times sum q(k). No use of the selector has been shown to force such a bound.

## Claim C1-T3-2: exact reduction and matching gap

The target is exactly equivalent, for each eligible tree and its contract-defined selector, to sum over selected original leaf tags of q_v(k+1)-q_v(k)<=0. This is an exact reformulation, not a newly established inequality. An injection from all upper marked sets to lower marked sets in the disjoint union of the tagged incidence graphs would be sufficient for that inequality, but is not necessary; cardinality comparison does not in general imply a matching. No such injection, Hall condition, or alternate aggregate proof is supplied. The selector-to-shadow bridge and an abstract obstruction-to-ordinary-tree realization are both absent, so no counterexample follows from abstract incidence data.

The opposing-orientation critique finds no algebraic defect in the route's identity or cancellation. The remaining gap is exactly the sign of this selector-weighted aggregate. The route appropriately describes it as open. Its matching language should be read as a sufficient strategy only, not an equivalent criterion for the aggregate inequality.

## Scope, selector, and standing controls

The argument preserves the strict lower-region guard and correct rank shift. It does not establish any selector values itself; its universal algebra is conditional on using precisely F(T,p) from the contract. It makes no claim about the complementary high-tail region, residual variants, governed models, or pointwise/support-fibre assertions.

The common controls include K_(1,12), where a=12, x=6, p=8, 3p=24<25, x+2=p, all 12 leaves are selected, and each summand is C(11,8)-C(11,7)=-165, giving S=-1980. For the selector check, T-v=K_(1,11) has i_8=165 and i_9=55, so Delta_8(T-v)=-110 for every original leaf. Also Delta_5(T)=132 and Delta_6(T)=-132, giving x=6. This confirms the lower region is nonempty but proves no universal sign.

The hash-pinned order-91 T22 control has (a,x,p)=(68,32,34), 3p=102<137, 67 selected leaves, one positive marked term +212336130412243110, and full sum -498754180547001418536. Its pinned control lists Delta_34(T-v)<0 for all 67 selected leaves. The order-243 T60 control has (182,87,90), 270<365, 181 selected leaves, one positive marked term +2935177632783649903488454322226807645411570590073000, and full sum -1058142362147652597702654588268394677176033202323316960380. Its pinned control lists Delta_90(T-v)<0 for all 181 selected leaves. Thus positive local terms do not refute the aggregate and a strategy requiring every tag's summand to be nonpositive would fail on these eligible controls. These controls do not establish the tagged-incidence matching claim or a Hall property. The separate order-22 R28 slot-dominance refutation is not treated as a refutation of the present aggregate or as a direct incidence-graph counterexample.

## Disposition and evidence grade

C1-T3-1 is retained as a verified finite counting identity and exact tree-specialization formula, with no primary sign consequence. C1-T3-2 is retained narrowly as an exact reformulation and an unproved sufficient matching approach; the primary lower-region claim remains unresolved. No literature theorem or computational search was imported. The control values cited above are read from the authorized pinned common inputs; this review did not independently replay their graph generation.
