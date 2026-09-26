# C5-F6 search report: small-rank third shell

## Result

I tested the third-shell pointwise term

\[
G_v=\Delta_{p-1}(T-\{v,s_v\})-\Delta_{p-1}(T-N[s_v])
\]

on an exact six-arm family at (n=2p+4), (p=10,11,12,13). This did not produce a positive (G_v). It does independently reproduce an eligible (p=10) tree with minimum vertex-cover number six, so the proposed cover-exclusion shortcut “\(\tau(T)\ge7\)” is false. The example has (G_v<0) for every selected leaf and full aggregate (S=-122805); it does not refute the pointwise sign or the primary aggregate.

## Family and exact calculation

The root is joined to six centers; center (i) has (d_i\ge0) pendant leaves. I enumerated all nondecreasing six-tuples with \(\sum_i d_i=2p-3\), which gives 163, 235, 331, and 454 multisets for (p=10,11,12,13), respectively. Each is one tree up to the permutation of the six arms in this specified family. For a tuple (d), its independence polynomial is computed exactly as

\[
P_T(z)=\prod_i((1+z)^{d_i}+z)+z\prod_i(1+z)^{d_i}.
\]

The first product counts sets omitting the root, the second sets containing it. For each original leaf, the script computes the deletion polynomial for the fixed selector \(\Delta_p(T-v)<0\), then both graph-deletion polynomials in (G_v). If (d_i>0), deleting a pendant leaf with its center leaves its (d_i-1) siblings isolated and the root component on the other arms; deleting the center's closed neighborhood leaves the five other center-stars as a disjoint union. The multiplicity (d_i) is retained. The case (d_i=0), where the center itself is an original leaf supported at the root, is handled separately in the replay code.

Only one multiset in the enumerated family is eligible, at (p=10):

\[
(d_1,\ldots,d_6)=(2,3,3,3,3,3),\quad n=24.
\]

The exact independence-count vector for ranks (0\) through \(\alpha=18\) is

\[
(1,24,253,1566,6400,18419,38970,62650,78593,78515,63348,41582,22199,9548,3240,836,154,18,1).
\]

Zero extension gives \(\Delta_8=78515-78593=-78<0\), hence (x=8). Both guards hold: (x+2=10\le p) and (3p=30<37=2\alpha+1). After deletion of one pendant leaf on a 2-leaf arm, \(\Delta_{10}=-13234\); on each 3-leaf arm it is \(-12357\). Thus all 17 original leaves are selected. Their local terms are:

- two leaves on the 2-leaf arm: \(\Delta_9(H)=-8532\), \(\Delta_9(R)=-3657\), so \(G_v=-4875\) each;
- fifteen leaves on the five 3-leaf arms: \(\Delta_9(H)=-9409\), \(\Delta_9(R)=-1872\), so \(G_v=-7537\) each.

Consequently \(S=2(-4875)+15(-7537)=-122805\). The six centers form a vertex cover. One pendant edge at each center gives a matching of size six, so \(\tau(T)=6\) exactly. This refutes a universal eligible-tree cover bound of at least seven, while the pointwise terms and full sum in this witness have the desired nonpositive sign.

## Bounded census and limits

For (p=11,12,13), the enumerated six-arm multisets contain no row passing both eligibility guards. At (p=10), the sole eligible row has no positive selected term; its least and greatest selected terms are −7537 and −4875. The finite counts and exact values are in `EVIDENCE.json`; `COMPUTE.py` is the foreground integer-arithmetic replay.

This is only a census of the stated rooted six-arm family. It does not enumerate all trees of these orders or all trees with vertex-cover number at most six. The counterexample to the cover threshold is already a known pinned control example, so this report claims independent arithmetic replay, not novelty. No primary-source theorem was needed. The actual third-shell pointwise sign for general trees, the aggregate claim, and any complete low-cover replacement inequality remain open.
