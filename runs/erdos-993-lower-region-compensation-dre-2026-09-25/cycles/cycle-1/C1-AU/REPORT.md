# C1-AU neutral adjudication — U-origin routes

## Contract and evidence boundary

This is a proposed adjudication, not a controller verdict. The primary registered question is whether the following holds for every finite ordinary tree (T). Put (a=\alpha(T)), let (i_j(T)) count independent (j)-sets with integer zero extension, set (\Delta_j(T)=i_{j+1}(T)-i_j(T)), and let (x(T)) be the first (j\geq0) with (\Delta_j(T)<0), checking through the terminal rank (a). For a natural (p) with (x(T)+2\leq p) and the strict guard (3p<2a+1), select **exactly** the original leaves (F(T,p)=\{v:\Delta_p(T-v)<0\}). With original support (s_v) and original closed neighborhood (N_T[s_v]), the question is whether

\[
S(T,p)=\sum_{v\in F(T,p)}\bigl[\Delta_{p-1}(T-\{v,s_v\})-\Delta_{p-1}(T-N_T[s_v])\bigr]\leq0.
\]

Each original leaf is one tag and one summand, even when supports coincide. The empty sum is zero. This adjudication uses the six U routes and their twelve CT/CF critiques only. All 52 case-listed worker files and 16 common files matched their packet SHA-256 pins. No source file was modified. The separate high-tail, governed, residual, and support-fibre claims do not transfer to this contract.

## Dispositions of every source claim

| Source claim | Disposition | Carried statement and exact scope |
|---|---|---|
| `C1-U1-1` | **retained** | The tagged-incidence deficit identity and (D,C\geq0) hold for every finite bipartite (H), arbitrary marked (W), integer (h\geq\alpha(H)), and (1\leq k\leq h), including (k=h) and (q_k=0). This is the separately registered auxiliary, not a primary proof. |
| `C1-U1-2` | **retained_narrowed** | On every eligible tree, the proposed global deficit-budget margin equals (-kS), so the budget is equivalent to the selected aggregate. The identity and nonnegativity alone do not establish the needed lower bound. CF's qualification is adopted: this is a lack of deduction from those facts, not a counterexample to a possible tree-structural budget. |
| `C1-U2-1` | **retained** | On every eligible tree, (S>0) forces a selected original leaf tag (v) and marked independent ((p-1))-set (A\subseteq H_v) with at least (p) **actual** addable vertices. If all such sets have at most (p-1), then (S\leq0). This conditional criterion does not establish the bound universally or produce a witness. |
| `C1-U3-1` | **retained** | The complete selected sum is exactly (\sum_{v\in F}(q_v(k+1)-q_v(k))), (k=p-1), on every eligible tree. Thus the primary is precisely the fixed-selector aggregate tagged-layer inequality. It is an identity, not a sign proof. |
| `C1-U3-2` | **retained** | For a fixed eligible tree, saturation of every tagged upper-layer node by a within-tag unit-capacity fractional matching to lower-layer nodes suffices for (S\leq0); Hall deficiency is the exact obstruction to this certificate, not to the scalar target. The certificate fails on the pinned eligible T22 and T60 controls although both have negative complete sums. |
| `C1-U3-3` | **retained_narrowed** | This route does not resolve the primary. Its particular within-tag matching certificate is **not universally feasible**, by the controls' positive selected rows. Neither that failure nor the route's abstract profile discussion supplies an eligible positive complete sum. CF's stronger, control-based method limitation is adopted. |
| `C1-U4-1` | **retained_narrowed** | The local independence-polynomial split and two coefficient identities are exact for every original leaf. They leave a missing comparison for the **displayed direct coefficient route**. Chudnovsky–Seymour Theorem 1.1 applies to claw-free graphs, not arbitrary trees, and by itself supplies no selected global comparison. CT's scope qualification is adopted: no claim is made about every possible generating-function proof. |
| `C1-U5-1` | **retained** | The support-core polynomial and rooted branch recurrences exactly evaluate every ordinary tree of order at least three, preserving leaf multiplicities. The complete aggregate is strictly negative for every eligible ordinary star. No sign theorem for general decorated cores follows. |
| `C1-U6-1` | **retained** | For fixed (a=\alpha(T)), candidate trees have order at most (2a), hence a finite isomorphism-class search domain. Same-support original leaves have equal selector values and summands, so a support contribution is its multiplicity times its common selected term. This is parameterwise and sign-neutral; no census was run. |

Both critics retain `C1-U1-1`, `C1-U2-1`, `C1-U3-1`, `C1-U3-2`, `C1-U5-1`, and `C1-U6-1` on those scopes. The differences for `C1-U1-2`, `C1-U3-3`, and `C1-U4-1` concern how broadly to describe a missing bridge or failed proof method; the narrower wording above follows the equations and finite controls, not a vote. No source claim is rejected.

## Proofs and checks carried to synthesis

### Tagged identity, tree specialization, and the exact open budget (`U1`, `U3`)

For bipartite (H) with color classes (L,R), let (q_j) count independent (j)-sets meeting (W). For every marked independent (k)-set (A), let (E(A)) be its **actual** addable vertices and (e(A)=|E(A)|). Each of (A\cup(E(A)\cap L)) and (A\cup(E(A)\cap R)) is independent, so each addable color-side has at most (h-k) vertices. Thus (d(A)=2(h-k)-e(A)\geq0) and (D=\sum_A d(A)\geq0). Count pairs ((A,y)) with (y\in E(A)). An independent ((k+1))-set meeting (W) once has exactly (k) marked (k)-deletions; one meeting (W) at least twice has (k+1). If (C) counts each latter set **once**, the same incidence total is both (kq_{k+1}+C) and (2(h-k)q_k-D). Hence

\[
kq_{k+1}+C=2(h-k)q_k-D,\qquad D,C\geq0.
\]

The proof includes (k=h): no independent ((h+1))-set or addable vertex exists, so all four terms are zero. If (q_k=0), no marked ((k+1))-set can exist because deleting an unmarked vertex, or any vertex when at least two marks occur, would leave a marked (k)-set. The identity still holds. The argument does not require (h=\alpha(H)).

For an original leaf (v), put (H_v=T-\{v,s_v\}), (W_v=N_T(s_v)\setminus\{v\}), and (R_v=T-N_T[s_v]=H_v-W_v). A maximum independent set of (T) can contain (v): replace (s_v) by (v) if it contains the support. Deleting (v) then gives size (a-1) in (H_v); conversely any independent set of (H_v) extends by (v). Thus (\alpha(H_v)=a-1). Eligibility gives (p\geq2) and (3p<2a+1), hence (p<a) and (1\leq k=p-1\leq h=a-1). All (H_v) are bipartite forests. With (q_v(j)=i_j(H_v)-i_j(R_v)), these are exactly the independent sets of (H_v) meeting (W_v), and the selected summand is (q_v(k+1)-q_v(k)). Summing over the **unchanged** (F(T,p)) gives

\[
kS=(2a+1-3p)\sum_{v\in F}q_v(k)-\sum_{v\in F}(D_v+C_v),
\]

and the exact budget margin is (\sum_F(D_v+C_v)-(2a+1-3p)\sum_Fq_v(k)=-kS=k\sum_F(q_v(k)-q_v(k+1))). The coefficient (2a+1-3p) is a positive integer. Nonnegative (D_v,C_v) alone do not bound their sum below that positive multiple of (\sum_Fq_v(k)). The missing statement is exactly (\sum_Fq_v(k+1)\leq\sum_Fq_v(k)). All sums retain repeated-support tags.

### Addability filter (`U2`)

Write (c=2a+1-3p\geq1), (Q=\sum_Fq_v(k)), and (E=\sum_F(D_v+C_v)). For each marked (A) in a selected (H_v), its nonnegative deficit is (d_v(A)=2(a-p)-e_v(A)), since (h-k=a-p). The preceding identity gives (kS=cQ-E). If (S>0), then (Q>0) and (E<cQ); hence some marked pair has (d_v(A)<c), since otherwise (D\geq cQ). Integer arithmetic gives (e_v(A)>p-1), or (e_v(A)\geq p). Conversely if every selected marked (A) has (e_v(A)\leq p-1), then every deficit is at least (c), so (D\geq cQ) and (S\leq0). Empty (F) or (Q=0) cases satisfy the latter conclusion directly. No route proves the uniform addability bound or realizes a positive aggregate.

### Transport certificate and finite controls (`U3`)

For each (v\in F), form upper nodes ((v,B)) from marked independent ((k+1))-sets of (H_v), lower nodes ((v,A)) from marked independent (k)-sets, and inclusion edges only when the tags agree and (A\subset B). A nonnegative flow sending one unit from each upper node and at most one unit to each lower node implies (\sum_F q_v(k+1)\leq\sum_F q_v(k)). The finite bipartite matching/Hall theorem makes feasibility equivalent to (|N(X)|\geq|X|) for every upper-node set (X). This is sufficient, not necessary, for the scalar aggregate inequality.

The packet-listed T22 order-91 control has ((a,x,p)=(68,32,34)), 67 selected tags, a selected row (+212336130412243110), and complete (S=-498754180547001418536). The T60 order-243 control has ((182,87,90)), 181 selected tags, a selected row (+2935177632783649903488454322226807645411570590073000), and complete (S=-1058142362147652597702654588268394677176033202323316960380). Both satisfy (x+2\leq p) and (3p<2a+1). The CT critic's exact replay of pinned control rows checked the listed strict selector values and summed all 67 and 181 terms, respectively; the trees and full coefficient vectors were **not** independently regenerated here. A positive row means its whole tagged upper component outnumbers its lower component, so it violates Hall despite a negative complete (S). Neither control refutes the primary.

### Coefficient route and literature hypothesis (`U4`)

Split independent sets of (T-v) by inclusion of the original support: (I(T-v,z)=I(H_v,z)+zI(R_v,z)). Writing (r_j=i_j(R_v)) and (q_j=i_j(H_v)-r_j), with zero extension, gives

\[
\Delta_p(T-v)=q_{p+1}-q_p+r_{p+1}-r_{p-1},\qquad
\Delta_{p-1}(H_v)-\Delta_{p-1}(R_v)=q_p-q_{p-1}.
\]

The strict sign of the first expression defines (F); it does not alone give the sign of the second or their selected sum. The route supplies no further tree-wide comparison. [Chudnovsky–Seymour, *The Roots of the Independence Polynomial of a Clawfree Graph*, Theorem 1.1](https://web.math.princeton.edu/~pds/papers/roots/roots.pdf) proves real-rootedness for **claw-free** graph independence polynomials. Its introduction gives the claw (K_{1,3}) as a non-real-rooted example. Arbitrary trees and the deletion forests here can have induced claws, and the theorem itself gives no comparison of these two selected coefficient functionals. This rules out the claimed blanket application of that particular theorem; it makes no assertion about other possible proofs.

### Decorated-core formula and eligible stars (`U5`)

For an ordinary tree of order at least three, delete all original leaves to obtain connected core (C), and let (m_u) be the number of original leaves at (u\in C). Its exact independence polynomial is

\[
I_T(z)=\sum_{X\in\operatorname{Ind}(C)} z^{|X|}\prod_{u\notin X}(1+z)^{m_u}.
\]

For a core neighbor (u) of support (s), orient the branch away from (s). Let (A_{u|s}) be the decorated branch polynomial and (A^0_{u|s}) the polynomial after deleting its root. If (w) runs over the children of (u), then (A^0_{u|s}=(1+z)^{m_u}\prod_w A_{w|u}) and (A_{u|s}=A^0_{u|s}+z\prod_w A^0_{w|u}). Consequently, for a leaf (v) at (s),

\[
I_{T-\{v,s\}}=(1+z)^{m_s-1}\prod_{u\sim_C s}A_{u|s},\qquad
I_{T-N_T[s]}=\prod_{u\sim_C s}A^0_{u|s}.
\]

Each equation partitions independent sets by core-root inclusion. In the second formula, deleting each neighbor root leaves that root's pendant leaves available, as (A^0) requires. Replacing (m_s) by (m_s-1) in the full core formula evaluates (T-v), hence the exact selector. All (m_s) leaves have equal data but remain (m_s) terms. These formulas evaluate, but do not sign, the general selected sum.

For (K_{1,m}), (I(z)=(1+z)^m+z) and (a=m) for (m\geq1). For (m\geq6), direct binomial differences give (x=m/2) if (m) is even and (x=(m+1)/2) if (m) is odd; the odd central tie is zero, not a strict descent. Direct coefficients for (m=1,\ldots,5) show no eligible rank (nor does the one-vertex convention (m=0)). Eligibility therefore gives (p\geq x+2>m/2) and (p<m). For every original leaf, (T-v=K_{1,m-1}), and (\Delta_p(T-v)=\binom{m-1}{p+1}-\binom{m-1}{p}<0), so all (m) tags are favorable. Its summand is (\binom{m-1}{p}-\binom{m-1}{p-1}<0), because the ratio of these binomial coefficients is ((m-p)/p<1). Thus (S=m[\binom{m-1}{p}-\binom{m-1}{p-1}]<0) for every eligible star. The supplied (K_{1,12}) check has ((a,x,p)=(12,6,8)), selector value (-110) for each leaf, term (-165), and (S=-1980). The all-star conclusion uses the symbolic binomial argument, not a finite loop.

### Fixed-(a) reduction and support multiplicity (`U6`)

The two bipartition classes of a tree are independent and each has at most (a) vertices, so (|V(T)|\leq2a). At any fixed (a), only finitely many tree isomorphism classes remain. This does not bound the unbounded parameter (a), and no enumeration was performed. If original leaves (v,w) share support (s), transposing them is a tree automorphism. It identifies (T-v) with (T-w) and (T-\{v,s\}) with (T-\{w,s\}); (T-N_T[s]) is the same graph. Their strict selector values and summands coincide, so the support contributes either zero or (m_s) times its common term. A fixed-(a) search must still compute (x) through (\Delta_a), check both strict guards, and include every selected tag.

## Recommendation and limitations

The registered bipartite tagged-incidence identity has a complete direct proof at its exact scope. The U-origin evidence supplies no universal proof or eligible positive complete-sum refutation of the primary lower-region ordinary-tree aggregate; its proposed status remains open. In particular, the positive lower-region coefficient leaves the global (D+C) budget unproved. The star theorem is a proper subfamily result, the addability criterion is conditional, the core and fixed-(a) reductions are sign-neutral, and the within-tag matching condition is disproved as a universal **certificate** by the finite controls. No exhaustive computation, new tree witness, or high-tail certificate is claimed. The T22/T60 figures are pinned finite controls with critic replay of stored rows only; no independent regeneration of their graph coefficient vectors was done. The literature audit covers the named claw-free theorem only.
