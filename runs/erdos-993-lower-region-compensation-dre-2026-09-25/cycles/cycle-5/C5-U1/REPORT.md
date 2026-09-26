# C5-U1: coefficient-window reduction and bounded T_m check

## Route scope

The allocated U1 lens asks for a minimized certificate/transfer scope for the (T_m) candidate, with central-only log-concavity separated from crossing-minor arguments, and asks what can be concluded without a no-recovery premise. I interpret (T_m) as the path (0-1-2) with (m) copies of (K_{1,3}), each claw center adjacent to 0. The three tips of each claw and vertex 2 are precisely the original leaves. This report makes no claim about trees outside this family.

## Exact polynomial reduction

All polynomials below are independence polynomials. Put

\[
 A=1+4z+3z^2+z^3=(1+z)^3+z,\quad
 B=1+3z+3z^2+z^3=(1+z)^3,\quad
 C=1+3z+z^2=(1+z)^2+z.
\]

Conditioning on whether 0 is selected gives

\[
 I(T_m)=(1+2z)A^m+z(1+z)B^m.
\]
For a claw-tip leaf (v), and for endpoint 2 respectively, direct deletion and the same conditioning give

\[
\begin{aligned}
 I(T_m-v_{tip})&=(1+2z)A^{m-1}C+z(1+z)^2B^{m-1},\\
 I(T_m-2)&=(1+z)A^m+zB^m,\\
 I(T_m-\{v_{tip},s_{v_{tip}}\})&=(1+z)^2I(T_{m-1}),\\
 I(T_m-N[s_{v_{tip}}])&=(1+2z)A^{m-1},\\
 I(T_m-\{2,1\})&=A^m+zB^m,\\
 I(T_m-N[1])&=A^m.
\end{aligned}
\]
Here (s_{v_{tip}}) is that claw center. The first tip-deletion term has a factor (1+2z), as required by the residual path (1-2); omitting it changes the selector. Tip multiplicity is (3m), including when many tags share one support. For endpoint 2 the support is 1.

For any coefficient sequence extended by zero, write \(\Delta_j f=[z^{j+1}]f-[z^j]f\). The exact transferable identity is

\[
 f=Gg+e,\quad G=\sum_{r=0}^d g_rz^r
 \quad\Longrightarrow\quad
 \Delta_p f=\sum_{r=0}^d g_r\Delta_{p-r}g+\Delta_pe.
\]
This gives a minimal coefficient window: only \(\Delta_{p-d}g,\ldots,\Delta_pg\), with nonzero (g_r), and the one error difference \(\Delta_pe\) are needed. If the window sum is (M<0) and \(|\Delta_pe|<-M\), then \(\Delta_pf<0\). When (e=0) and all (g_r\ge0), a sufficient sign certificate is that every window difference with nonzero weight is nonpositive and at least one is negative. This is an identity and an explicit perturbation test, not a log-concavity theorem.

Central-only log-concavity of (g) does not establish the needed signs throughout this shifted window. In particular, knowing only its first descent does not rule out a later positive \(\Delta_jg\). Without a no-recovery premise (or a direct check of the whole weighted window), the transfer conclusion is therefore unavailable. Crossing minors likewise cannot be dropped merely because a central block is log-concave: they are independent inequalities unless an argument proves they are redundant.

## Exact finite computation

`COMPUTE.py` implements low-degree-first polynomial addition, multiplication, and powers using Python integers. It constructs the displayed six formulas, finds (\alpha(T_m)=\deg I(T_m)), and locates (x(T_m)) by scanning zero-extended differences through the terminal rank. For every (m=1,\ldots,40), it checks every integer (p\) with (x+2\le p\le\alpha) and (3p<2\alpha+1). It computes the strict selectors independently for the tip and endpoint orbits, then forms the complete sum with multiplicity (3m) and 1. `EVIDENCE.json` records (x,\alpha), every guarded eligible rank, both orbit selector differences, every per-leaf summand, and the total.

There are 427 eligible ((m,p)) rows (for (m=3,\ldots,40)); every exact total (S(T_m,p)) is negative. For (m=1,2) the eligible-rank list is empty. This is an exact finite-family result only; the computation has no implication for (m>40) or general trees. It is not an exhaustive census of the primary class.

## Disposition and limitations

The coefficient-window identity is retained as a useful exact reduction, with the no-recovery bridge explicitly open. The bounded (T_m) output supports the primary inequality only on the listed (m\le40) rows. It neither proves the proposed infinite (T_m) certificate nor verifies the candidate's imported analytic inequalities, central log-concavity claim, crossing minors, or any claim for arbitrary ordinary trees. No literature theorem was imported, no status is awarded, and the primary contract remains outside this route's proof scope.
