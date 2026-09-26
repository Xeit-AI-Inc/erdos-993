# C1-AT neutral adjudication — cycle 1, orientation N

This is a proposed worker adjudication of the six C1-T routes and their twelve sealed cross-orientation critiques. The 63 case-listed worker files and 16 common files matched their SHA-256 packet pins. The eight required claim IDs are each disposed of below. No claim here is an authoritative award.

## Exact target and common notation

For a finite ordinary tree (finite, simple, connected, acyclic) `T`, let `i_j(T)` count independent `j`-sets, with integer zero extension, `Delta_j(T)=i_(j+1)(T)-i_j(T)`, `a=alpha(T)`, and `x(T)=min{j>=0:Delta_j(T)<0}`, checking through `j=a`. For a natural `p` with `x(T)+2<=p` and the strict guard `3p<2a+1`, set `F(T,p)={v: v is an original leaf and Delta_p(T-v)<0}`. With original support `s_v` and original closed neighborhood `N_T[s_v]`, the registered primary assertion is

`S(T,p)=sum_(v in F(T,p)) [Delta_(p-1)(T-{v,s_v})-Delta_(p-1)(T-N_T[s_v])]<=0`.

Every original leaf is a distinct summand even when supports coincide; an empty sum is zero. The rank is `p-1`, and there is no residual or governed-tree hypothesis. Eligibility gives `p>=2`. The separate high-tail region and the all-rank R23 aggregate are outside this claim.

For any original leaf `v`, abbreviate `s=s_v`, `G=T-v`, `H=T-{v,s}`, `W=N_T(s)\{v}`, and `R=T-N_T[s]=H-W`. Write `k=p-1` and `q_v(j)=i_j(H)-i_j(R)`, the number of independent `j`-sets of `H` meeting `W`. Partitioning sets by whether they contain `s` proves

`I_T=(1+z)I_H+zI_R`, `I_G=I_H+zI_R`,

`Delta_p(G)=Delta_p(H)+Delta_(p-1)(R)`, and

`g_v:=Delta_k(H)-Delta_k(R)=q_v(k+1)-q_v(k)`.

The first difference is the **fixed strict selector**; the last difference is its selected summand. These equalities are valid with zero extension, including disconnected deletion forests. They do not control the sign of the selected sum.

## Claim dispositions and reconciled evidence

### C1-T1-1 — retained; proposed verified at star scope

For every `T=K_(1,m)` with `m>=4` and eligible `p`, all `m` original leaves are favorable and

`S(T,p)=m[binom(m-1,p)-binom(m-1,p-1)]<0`.

Indeed `I_T=(1+z)^m+z`, `a=m`, and `x=ceil(m/2)`: `Delta_0=m>0`, `Delta_1=binom(m,2)-(m+1)>0`, and the subsequent binomial differences first become negative at that rank (including the odd central zero and terminal zero extension). The guards imply `p>=ceil(m/2)+2` and `p<m`, hence `2<=p<=m-1`. For each leaf, `G=K_(1,m-1)` has `Delta_p(G)=binom(m-1,p+1)-binom(m-1,p)<0`, also at `p=m-1`. Here `H` is `m-1` isolates, `R` is empty, and `k=p-1>(m-1)/2`, so every `g_v=binom(m-1,p)-binom(m-1,p-1)<0`. Multiplying by all `m` leaf tags proves the formula. Both critics retained the exact symbolic proof. This family result supplies no compensation theorem for trees with several support fibres. The instance `m=12,p=8` establishes that the guarded family is nonempty.

### C1-T2-1 — retained; proposed verified as identities and one pruning obstruction

The displayed leaf-support polynomial and selector identities above are exact. The additional finite assertion is that pair pruning need not preserve the strict lower-region guard. For `T=K_(1,12)`, `a=12`, `x=6`, and `p=8` satisfy `x+2<=p` and `24<25`. All 12 original leaves have `Delta_8(T-v)=-110`; each has `g_v=-165`, so the **complete** selected sum is `-1980`. Deleting any leaf together with its support leaves 11 isolates, with `a'=11`, `x'=6`; at unchanged `p=8`, `24<23` fails. The pruned object is also a forest rather than a tree. Both critics retained the recurrence and this exact nonclosure example. It blocks only an induction that requires the pruned object to remain within the same strict guarded tree domain. It gives no positive aggregate witness and does not exclude an augmented invariant or compensation argument.

### C1-T3-1 — retained; proposed verified as an exact incidence identity and specialization

Let `H` be any finite bipartite graph, `W` any marked vertex set, `h>=alpha(H)` an integer, and `1<=k<=h`. Let `Q_j` count independent `j`-sets meeting `W`. For each marked independent `k`-set `A`, let `e(A)` count **actual** addable vertices, and set `D=sum_A[2(h-k)-e(A)]`. Let `C` count independent `(k+1)`-sets meeting `W` in at least two vertices, once per set. Then

`k Q_(k+1)+C=2(h-k)Q_k-D`, with `D,C>=0`.

For either bipartition class, `A` together with all addable vertices of that class is independent, so at most `h-k` vertices are addable from it. This proves each deficit nonnegative. Count pairs `(A,u)` with `u` addable: an upper set with one mark has `k` deletions retaining a mark, while one with at least two marks has `k+1`. Their total is `kQ_(k+1)+C`, proving the identity, including empty `W` and `k=h`.

For the tree specialization, `H_v` is bipartite and `alpha(H_v)=a-1`: an independent set in `H_v` extends in `T` by `v` if it meets `W_v`, and by `s_v` otherwise; conversely any maximum independent set of `T` contains exactly one of `v,s_v`, whose removal lies in `H_v`. Eligibility gives `1<=k=p-1<=a-1=h`. Thus `Q_j=q_v(j)` and the original `g_v=q_v(k+1)-q_v(k)`. The incidence identity equivalently gives

`k S(T,p)=(2a+1-3p)sum_(v in F)q_v(k)-sum_(v in F)(D_v+C_v)`.

The two critics retained this proof and domain check. This is an exact proof candidate for the separately registered bipartite tagged-incidence identity, whose controller status remains OPEN; it is **not** a sign proof for the primary. The coefficient `2a+1-3p` is positive, so `D_v,C_v>=0` alone is insufficient.

### C1-T3-2 — retained narrowed to the exact equivalence; proposed open on the sign

For the actual fixed selector and distinct original leaf tags, the primary assertion is exactly

`sum_(v in F)q_v(k+1)<=sum_(v in F)q_v(k)`.

A containment matching from all marked upper sets to marked lower sets within each tag would suffice, but is stronger than the total cardinality inequality. In a disjoint union of per-tag incidence graphs, a matching cannot transfer unused lower capacity across tags. The eligible order-91 `T_22` and order-243 `T_60` standing controls each have a selected **positive** tag yet a negative complete sum; hence a universal tagwise upper-to-lower matching is impossible. The F critic stressed that matching was only sufficient; the U critic added the decisive positive-tag obstruction. These observations reconcile: the exact aggregate equivalence survives, while no Hall theorem, cross-tag incidence rule, selector bridge, or sign proof survives. The distinct order-22 R28 slot-dominance refutation also provides no shortcut to this target.

### C1-T4-1 — retained; proposed verified as a partial probability translation

For a favorable leaf, `i_p(G)>0` because `i_(p+1)(G)<i_p(G)` and counts are nonnegative. For a uniform independent `p`-set `J` of `G`, double-counting addable pairs gives `E[e_G(J)]=(p+1)i_(p+1)(G)/i_p(G)`. Hence the strict selector `Delta_p(G)<0` is equivalent to `E[e_G(J)]<p+1`. The desired `g_v=q_v(p)-q_v(p-1)` instead compares adjacent ranks in the marked slice of `H`. If `q_v(k)>0`, its marked addability mean is `[kq_v(k+1)+C_v]/q_v(k)`; when `q_v(k)=0` this conditional mean is undefined, but the integer identity remains valid. Both critics retained these double counts and the positive-denominator guard. No coupling from the unconditioned rank-`p` law on `G` to the marked rank-`k` law on `H`, and no aggregate deficit budget, was proved. The translation is exact but does not resolve `S<=0`.

### C1-T5-1 — retained; proposed verified as a support-fibre identity

For each original support `s`, let `L_s` be its original leaf neighbors and `m_s=|L_s|`. For each non-leaf neighbor `w`, root the component `C_(s,w)` of `T-s` at `w`, set `J_(s,w)=I(C_(s,w))` and `E_(s,w)=I(C_(s,w)-w)`, and define

`P_s=(1+z)^(m_s-1) product_w J_(s,w)`, `Q_s=product_w E_(s,w)`.

Empty products are 1. For every `v in L_s`, `I(T-{v,s})=P_s`, `I(T-N_T[s])=Q_s`, and `I(T-v)=P_s+zQ_s`. This follows by separating components after deleting `s` and partitioning sets of `T-v` by inclusion of `s`. Thus the selector and summand are constant on the fibre and the **full** selected aggregate is exactly

`S(T,p)=sum_(s:Delta_p(P_s+zQ_s)<0) m_s Delta_(p-1)(P_s-Q_s)`.

The branch messages obey `E=product_i J_i`, `J=product_i J_i+z product_i E_i`. Full coefficient vectors reconstruct `I_T`, `a`, `x` through the terminal rank, and every strict selector value. Both critics retained the algebra; the F critic independently replayed the two named large controls, while the U critic only grouped their pinned rows. Their different replay depths do not affect the symbolic identity. This is a computation scheme and exact reformulation. No bound compensating positive selected fibres with negative ones was proved.

### E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE — retained narrowed to route-limited nonresolution; proposed open

The source C1-T5 used this registered ID to say it obtained neither a proof nor an eligible positive full-sum counterexample. Both critics narrow that to a report **about C1-T5's evidence**, not a mathematical proof that the universal proposition is open and not a controller status award. Its exact support-fibre identity restates the missing inequality; the T1 star theorem proves a proper subfamily, while T2–T4 and T6 supply identities or diagnostics. On these eighteen sealed worker outputs there is no proof of the complete selected sum for all eligible ordinary trees and no reproducible eligible `S>0` witness. The registered assertion remains unresolved by this case. The precise missing budget, equivalent to the primary under `k>0`, is

`sum_(v in F)(D_v+C_v)>=(2a+1-3p)sum_(v in F)q_v(k)`.

This conclusion is evidence-limited and proposed; the controller retains all status authority.

### C1-T6-1 — retained; proposed verified as an information-loss diagnostic

For the edgeless forest `H_m`, `Ind(H_m)` is a full simplex and is contractible, while `i_j(H_m)=binom(m,j)`. Therefore `Delta_7(H_10)=45-120=-75` and `Delta_7(H_11)=165-330=-165`: ordinary homotopy type alone does not determine this rank-seven difference. Both arise as local `H_v` from stars with 11 and 12 leaves, respectively. The route also correctly notes that `dim C_(j-1)(Ind(H_v),Ind(R_v))=q_v(j)` for the relative simplicial chain group, because its basis comprises independent `j`-sets meeting `W_v`. This preserves graded counts but implies no inequality. The route cites Ehrenborg–Hetyei, *The topology of the independence complex*, European Journal of Combinatorics 27 (2006), Corollary 6.1, for the broader forest point-or-sphere homotopy statement; the retained two-simplex diagnostic needs only the direct full-simplex observation. Both critics retained this narrow result. The `H_10` star realization at `p=8` fails the strict lower guard, so this comparison is not an eligible full target witness.

## Control checks, dependencies, and limits

The `K_(1,12)` vectors and arithmetic appear in [EVIDENCE.md](EVIDENCE.md). The two larger named standing controls were checked against their pinned common JSON rows by summing **every recorded selected summand**; both satisfy the rank and strict lower guards and have negative full sums. `T_22` has order 91, `(a,x,p)=(68,32,34)`, 67 selected leaves, a positive marked term `+212336130412243110`, and `S=-498754180547001418536`. `T_60` has order 243, `(182,87,90)`, 181 selected leaves, a positive marked term `+2935177632783649903488454322226807645411570590073000`, and `S=-1058142362147652597702654588268394677176033202323316960380`. The pinned common rows and the F critic's independent recurrence replay support their finite control use; this adjudicator re-summed the rows but did not regenerate either large graph from its recipe. Neither finite negative sum proves the universal aggregate. Positive selected terms refute pointwise nonpositivity, not the complete selected inequality.

The exact symbolic claims above need no external theorem or bounded census. The cited forest topology theorem is not a premise of any proposed primary-target implication. No universal compensation inequality, valid general matching, induction invariant respecting the guards and fixed selector, or eligible positive complete-sum witness was established. In particular, the optional exact incidence identity is distinguishable from its unproved global deficit budget, and the order-22 R28 slot counterexample is distinguishable from the order-91 `T_22` control.
