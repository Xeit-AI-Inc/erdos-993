# C5-U6 search report: marked shells and the star family

## Scope and result

The case packet assigns no source worker files and no review claim IDs. This route gives (1) an exact first-mark decomposition of each selected leaf summand, and (2) a complete symbolic proof of the primary inequality on the infinite subfamily of stars in the eligible lower region. It does not resolve the primary assertion for arbitrary trees.

The common packet's 237 listed source hashes were checked; all matched. The case identity is C5-U6, stage `search`, orientation `U`.

## Exact marked-shell reduction

Fix an original leaf (v), its support (u=s_v), and set

\[
H=T-\{v,u\},\qquad W=N_T(u)\setminus\{v\},\qquad R=T-N_T[u]=H-W.
\]

For (j\ge0), let (q_j=i_j(H)-i_j(R)), the number of independent (j)-sets in (H) meeting (W). Put (k=p-1). The original summand is exactly

\[
\Delta_k(H)-\Delta_k(R)=q_{k+1}-q_k=q_p-q_{p-1}.
\]

Choose any fixed linear order on (W). For (w\in W), let (W_{<w}) be its earlier elements and define the induced forest
\[
G_w=H-(W_{<w}\cup N_H[w]).
\]
Every independent set meeting (W) has a unique first member (w\). Removing (w) gives a bijection from such (j)-sets to independent ((j-1))-sets of (G_w): earlier marked vertices are forbidden, and all neighbors of (w) are forbidden. Hence, with integer zero extension,
\[
q_j=\sum_{w\in W} i_{j-1}(G_w),\qquad
q_j-q_{j-1}=-\sum_{w\in W}\Delta_{j-2}(G_w).
\]
In particular, the target summand is
\[
-\sum_{w\in W}\Delta_{p-2}(G_w).
\]

The selector has a different rank gate. The leaf-deletion decomposition is
\[
I(T-v;z)=I(H;z)+zI(R;z),
\]
so
\[
\Delta_p(T-v)=\Delta_p(H)+\Delta_{p-1}(R)
=(q_{p+1}-q_p)+i_{p+1}(R)-i_{p-1}(R)
=-\sum_{w\in W}\Delta_{p-1}(G_w)+i_{p+1}(R)-i_{p-1}(R).
\]
Thus membership of (v) in the fixed selector is equivalent to strict negativity of this last expression. The decomposition preserves distinct leaf tags even when their supports agree; it never replaces the fixed selector by a new one.

These are identities, not a sign theorem. For a residual forest (G_w), Δ\(_{p-2}\) can be nonzero only if its independence number is at least (p-2), and Δ\(_{p-1}\) only if it is at least (p-1); at equality each is the negative terminal coefficient. Above its independence number, the zero-extended difference is zero. In particular at the lowest relevant gate (p=6), the target samples Δ\(_4(G_w)\), while the selector samples Δ\(_5(G_w)\) and the residual (i_7(R)-i_5(R)). A generic threshold that controls only one of these ranks does not dispose of the other two terms. The decomposition alone gives no uniform bound on the sum over selected leaves.

## Complete star subfamily certificate

Let (T=K_{1,m}), (m\ge4), with center (c) and (m) original leaves. Its independence number is (a=m), and
\[
i_0=1,\quad i_1=m+1,\quad i_j=\binom mj\ (2\le j\le m),\quad i_{m+1}=0,
\]
with zero extension afterward. We have Δ\(_0=m>0\) and
\[
\Delta_1=\binom m2-(m+1)>0\quad(m\ge4).
\]
For every (2\le j\le m),
\[
\Delta_j=\binom m{j+1}-\binom mj,
\]
which is negative exactly when (2j>m-1), zero exactly when (2j=m-1), and positive when (2j<m-1). Therefore the first strict descent is
\[
x(T)=\lceil m/2\rceil.
\]
This checks the first descent through the terminal rank: Δ\(_m=-1\), and all later zero-extended differences vanish.

The hypotheses (x+2\le p) and (3p<2a+1) are, for integral (m,p), exactly
\[
\lceil m/2\rceil+2\le p,\qquad m\ge\lceil3p/2\rceil.
\]
The first inequality implies (m\le2p-4); the second is the strict lower-region condition. Consequently the star subfamily has the exact eligible parameter window
\[
\lceil3p/2\rceil\le m\le2p-4.
\]
It is empty for (p\le7), including the specialized (p=6) and (p=7) cases: at (p=6) it would require (9\le m\le8); at (p=7), (11\le m\le10). For (p\ge8) it is nonempty.

For each original leaf (v), (T-v=K_{1,m-1}). Since (p\ge8), the relevant coefficients are binomial coefficients and
\[
\Delta_p(T-v)=\binom{m-1}{p+1}-\binom{m-1}{p}<0
\]
throughout the window (equivalently (m<2p+2), implied by (m\le2p-4)). Thus every original leaf is selected, with no support-fiber collapse. Also
\[
T-\{v,c\}= (m-1)K_1,\qquad T-N_T[c]=\varnothing.
\]
Each of the (m) tagged leaf summands equals
\[
\Delta_{p-1}((m-1)K_1)-\Delta_{p-1}(\varnothing)
=\binom{m-1}{p}-\binom{m-1}{p-1}<0,
\]
since (m\le2p-4<2p). Therefore
\[
S(T,p)=m\left(\binom{m-1}{p}-\binom{m-1}{p-1}\right)<0
\]
for every eligible star. This is a full selected-sum proof on the stated subfamily, not a finite census.

## Limits

The star calculation gives no control of the first-mark residual forests for general trees. The selector identity involves Δ\(_{p-1}\) and an unmarked two-rank residual, while the desired term involves Δ\(_{p-2}\); the global sum may also include different supports with distinct tag multiplicities. No inequality bounding their aggregate by the star argument has been established. Empty star windows at (p=6,7) are only exclusions from this subfamily and are not exceptional cases resolved for general trees. No universal claim about unimodality, no-recovery, or the primary aggregate is used.
