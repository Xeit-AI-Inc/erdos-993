# C2-PREP-SWITCH-IDENTITY: proposed intake review

**Authority:** proposal to the controller only. I read the exact brief first and verified SHA-256 for all eleven listed sources before analysis. I read only those sources and used this scratch for output. This is a semantic audit and a bounded arithmetic check, not a universal proof, registry decision, or C2 synthesis result.

## Exact statement recommended for consideration

Let (T) be a finite ordinary tree, (i_k(T)) its zero-extended independent-set counts, (\Delta_k(T)=i_{k+1}(T)-i_k(T)), (x(T)=\min\{k\geq0:\Delta_k(T)<0\}), and (\alpha(T)) its independence number. For every natural (p) with

\[
x(T)+2\leq p,\qquad 3p<2\alpha(T)+1,
\]

fix **the original** favorable leaf selector (F=\{v:\deg_T(v)=1,\ \Delta_p(T-v)<0\}). Each original leaf is a separate tag even if supports coincide. For independent (B\subseteq V(T)), let (s_v) be the original support of (v) and define

\[
w_F(B)=\#\{v\in F\cap B:(N_T(s_v)\cap(B\setminus\{v\}))\ne\varnothing\}.
\]

Make (w_F(B)) upper clones of each independent ((p+1))-set (B), and (w_F(D)) lower clones of each independent (p)-set (D). Join **every** upper clone over (B) to **every** lower clone over (D) precisely when at least one of these holds:

1. (D=B\setminus\{q\}) for some (q\in B) (deletion);
2. for some (s\notin B), ( |N_T(s)\cap B|=2) and (D=(B\setminus(N_T(s)\cap B))\cup\{s\}) (two-for-one switch).

**Proposed universal assertion:** for every such ((T,p)), this specific clone graph has a matching saturating all upper clones. Equivalently, for every family (X) of upper independent sets, (\sum_{B\in X}w_F(B)\leq\sum_{D\in\Gamma(X)}w_F(D)). Zero-weight fibers may be retained as empty fibers. The rank selector stays (F(T,p)) on both sides; there is no residual, governed-RTree, or (F(T,p+1)) hypothesis.

## Semantic proof and identity boundary

For each selected leaf (v), put (H_v=T-\{v,s_v\}), (W_v=N_T(s_v)\setminus\{v\}), and (C_j(v)=\{A\in\operatorname{Ind}_j(H_v):A\cap W_v\ne\varnothing\}). The map ((v,A)\mapsto(B=A\cup\{v\},v)) is a bijection from the tagged rank-(j) side to the (w_F(B)) clones at rank (j+1). The inverse removes (v). Independence of (B) follows because (s_v\notin A) and (v)'s only neighbor is (s_v). Conversely, the condition in (w_F(B)) makes (A=B\setminus\{v\}) an active set. This proves the clone counts with repeated original supports kept distinct.

Under that bijection, an old **Delete** edge ((v,A)\to(v,A\setminus\{q\})) projects to (B\to B\setminus\{q\}), retaining clone tag (v). An old **Retag** edge ((v,A)\to(w,A\setminus\{w\})) projects to (B\to B\setminus\{v\}), with lower clone tag (w). Thus every old ordinary-tree edge lies in the complete-fiber deletion graph. The inclusion can be strict: in the checked p6 tree below, (B=\{1,3,5,8,9,10,11\}) and (E=B\setminus\{1\}) both have active tags 8 and 9. The anonymous deletion edge from upper clone 8 to lower clone 9 exists, while old Delete keeps tag 8 and old Retag to tag 9 would land at (B\setminus\{8\}), not (E). No equality of the old and anonymous graphs follows.

A switch output is independent: after removing all occupied neighbors of (s), insertion of (s) creates no adjacency, and the remaining vertices were independent already. Exactly two removals and one insertion reduce rank by one. Since (s\notin B) but (s\in D), (D\not\subseteq B), so **no** old Delete or Retag edge can project to that pair. This is a material new move, beyond the anonymous enlargement of deletion.

The complete-fiber graph is finite with integral capacities. An integral flow of value (\sum_Bw_F(B)) can assign distinct upper clones and distinct lower clones to its units along each positive pair (B,D); conversely a saturating matching gives such a flow. Max-flow integrality and the finite weighted Hall condition give the equivalence. This equivalence proves no flow exists in general. The leaf-set bijection and the r23 coefficient bridge yield

\[
S(T,p)=\sum_{|B|=p+1}w_F(B)-\sum_{|D|=p}w_F(D).
\]

Consequently the proposed saturation implies the **open** ordinary lower-region aggregate is nonpositive. Aggregate nonpositivity alone does not imply every Hall cut. A failed switch Hall cut would refute this mechanism only; it would refute the aggregate only if the same eligible row had (S(T,p)>0).

## Literal new positive-weight arc

The first row of the pinned p6 switch-flow artifact is an ordinary order-14 tree at (p=6,x=4,\alpha=9), satisfying (x+2\leq p) and (18<19), with (F=\{6,8,9,10,12,13\}). Its saved positive flow contains the arc of amount **3**

\[
B=\{1,3,5,8,9,10,11\}\ (3882)
\longrightarrow
D=\{0,3,5,8,9,10\}\ (1833).
\]

I checked the source edge list directly: both sets are independent, (N_T(0)\cap B=\{1,11\}), and (D=(B\setminus\{1,11\})\cup\{0\}). The selected leaves 8, 9, 10 each have another occupied neighbor at their original support 7 on both sides, and no other selected leaf contributes. Hence (w_F(B)=w_F(D)=3>0). Since (0\notin B), this positive-flow pair is not a deletion and cannot be an old tagged edge. This independently checks the literal arc and its weights, not the artifact's full 241-flow certificate.

## Refuted claims and supplied finite evidence

The current registry and transitive refuted list retain `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL`, `E993-R23-LITERAL-DELETE-ONLY-HALL`, and `E993-R23-TAG-CLOSED-CUT-HALL` as **REFUTED**. The hot-tag singleton and zero-Retag-export shortcuts are also refuted, and the complete-tag-deficiency-equals-contribution equality is refuted. Those are claims about the literal old tagged relation or narrower old cuts; the proposed complete-fiber deletion-plus-switch graph has different edges and a different universal Hall assertion. The governed `E993-R19-FIXED-GAMMA-HALL` remains **OPEN** on its own RTree terms; ordinary-to-governed adequacy is not proved here. The lower-region ordinary aggregate is **OPEN** and is a weaker scalar consequence, not an identical Hall statement. These are `not_same_claim` distinctions, not reversals of any status.

The old T22 order-91, (p=34) center-free cut had upper weight `1020660578375268831042`, lower neighborhood bound `1006434057637648542672`, and deficit `14226520737620288370`. It is the *already registered* ordinary Delete/Retag failure. The supplied orbit audit identifies the same numerical deficit in anonymous deletion and reports an exact feasible switch flow for T22. It also reports feasible switch flows for the (m=60,66) controls. I did not rerun those full orbit certificates. The supplied p6 audit reports saturation in all 241 pinned census cases; I checked the concrete arc above, not all 241 flows. Neither finite success proves the universal assertion.

For `CB(8,92)` at (p=492,x=490,\alpha=829), the supplied exact replay gives (S<0). Its old complete arm-tag and tag-closed cut refutes old mechanisms but says nothing decisive about switch saturation. For the proposed *new* cut with distinguished hub (h) and leaf (v) occupied, no choke occupied, and no branch having exactly one occupied support, write (D(z)=(1+2z)^8), (U(z)=8z(1+z)^7), (A(z)=D(z)-U(z)). The upper cut has weight ([z^{491}]A^{92}). Every positive-weight switch/deletion neighbor is contained in the lower envelope counted by ([z^{490}](A^{92}+92UA^{91})): deleting a branch support can introduce one one-support branch, which must be included. Deleting (h) or (v), and switching at the distinguished support, produces zero weight; a choke switch requires the excluded one-support branch. I independently multiplied these polynomials and matched the artifact's integers. The computed supply minus **envelope** capacity is negative (345 digits). Since the envelope is only a superset of the actual positive-weight neighborhood, this is a nonpositive *lower bound* on the true deficit. It proves neither a deficient cut nor a feasible flow. No supplied counterexample establishes failure of the changed relation.

## Unresolved obligations

- Prove universal weighted Hall or find an eligible ordinary-tree family and an exact positive deficient cut for this *specific* relation. A counterexample must use the fixed original selector and actual full switch neighborhood.
- Decide switch feasibility on `CB(8,92)` (and any proposed perturbations) by an exact neighbor/cut certificate or a saturating flow. The current envelope sign leaves it open.
- If a failed switch cut is found, compute the complete aggregate on that same row before making any aggregate claim. If a universal switch theorem is proved, state separately the finite-flow/clone and coefficient bridges used to derive the ordinary aggregate.
- Keep governed-RTree transfer, the broader `E993-BETA-AGG`, and all registered old Hall failures separate. No novelty, formal proof, or registry status is awarded by this report.
