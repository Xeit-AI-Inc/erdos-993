# Independent C4-T4 signed-map audit

**Disposition (proposed worker review only).** The C4-T4 relative-chain identity is correct. The universal injectivity property of its *exact signed, least-eligible-tag deletion map* is false on the eligible ordinary star (K_{1,12}). This defeats that sufficient mechanism, not the lower-region aggregate: the complete selected sum on the same tree is (-1980). The conditional statement “if this map is injective, then the sum is nonpositive” remains valid. The C4-T4 suggestion that an SDR of displayed nonzero entries certifies a full-rank minor is false for a fixed signed matrix; this example has Hall's condition and a nonzero kernel simultaneously.

## Exact original-tree data

Label the centre (0) and the twelve leaves (1,ldots,12), with precisely the edges ((0,v)) for (1\le v\le12). The independence polynomial is

\[
 I_T(z)=(1+z)^{12}+z,
 \qquad (i_j(T))_{j=0}^{12}=(1,13,66,220,495,792,924,792,495,220,66,12,1).
\]

Thus (a=12), the first strict descent is (x=6), and (p=8=x+2) satisfies (3p=24<25=2a+1). For every original leaf (v), (T-v=K_{1,11}) and its coefficient vector is

\[
 (1,12,55,165,330,462,462,330,165,55,11,1).
\]

Consequently (Delta_8(T-v)=55-165=-110<0), so the **complete** favorable set is (F=\{1,ldots,12\}). Its original support is (s_v=0). The residual (H_v=T-\{v,0\}) consists of eleven isolated vertices, (W_v=N_T(0)\setminus\{v\}=V(H_v)), and (R_v=T-N_T[0]) is empty. Hence (q_v(7)=\binom{11}{7}=330), (q_v(8)=\binom{11}{8}=165), and each selected summand is (165-330=-165). The full (S(T,8)=12(-165)=-1980). In particular, \(\dim K_8=1980\) and \(\dim K_7=3960\), so the dimension inequality itself holds.

## Nonzero signed kernel and the SDR gap

Take tag (v=1) and (C=\{2,3,4,5,6,7,8,9,10\}\). In the source space (K_8), set

\[
 z=\sum_{j=0}^{8}(-1)^j(1,C\setminus\{c_j\}),
 \quad (c_0,\ldots,c_8)=(2,\ldots,10).
\]

All nine terms are distinct valid source basis elements, so (z\ne0). Every seven-face formed in applying (L) still meets (W_1=V(H_1)). Therefore each of the 72 individual deletion branches retains tag 1; the least-tag transfer rule does not activate. Every final seven-face of (C) occurs twice, from the two possible orders of deletion, with opposite signs. The independent replay explicitly evaluates all 36 output coordinates and gets zero in each: (Lz=0).

There is nevertheless an SDR of displayed nonzero entries. Within each tag block every eight-set has eight deletion neighbors and every seven-set has four eight-set extensions inside the eleven available vertices. For **any** family (X) of source faces, edge counting gives (8|X|\le4|N(X)|), hence (|N(X)|\ge2|X|\). Different tags have disjoint output coordinates on this star, so Hall holds for the full tagged bipartite support graph as well. Hall certifies a matching, hence generic structural rank if entries are independent variables; it does not prevent determinant cancellation in this fixed alternating-sign matrix.

This is not the previously registered *unsigned local* down-map refutation: applying unsigned deletion to this same (z) has a nonzero coordinate, namely coefficient (2) on the face \(\{3,5,6,7,8,9,10\}\) with tag 1. The signed obstruction is cancellation, even when the source side is smaller than the target and Hall is satisfied.

## General two-mark obstruction

The root's broader sufficient kernel condition is valid with its stated quantifiers. Fix a selected tag (v\), and suppose (C\subseteq V(H_v)) is an independent \((p+1)\)-set with **at least two** elements of (W_v). Every (p)-face (C\setminus\{u\}) remains marked and is a source basis element. Its alternating boundary (z=\sum_u(-1)^{\operatorname{pos}(u,C)}(v,C\setminus\{u\})) is nonzero. For any \((p-1)\)-face (B=C\setminus\{u,t\}), the two paths through the distinct intermediate (p)-faces have opposite simplicial signs. Both are sent to the same destination: the C4-T4 rule chooses the output tag (\tau_v(B)) solely from the original (v) and final face (B), or omits both. Therefore their coefficients cancel, including when (B) loses both marks and gets retagged. A four-vertex two-mark abstract case in `REPLAY.py` checks the latter branch explicitly. The condition is sharp for this full-boundary construction in the sense that one marked vertex would leave a (p)-face outside the source; it is a sufficient condition, not a characterization of the entire kernel.

## Registry identity and proposed exact entry

The pinned canonical registry has no exact signed C4-T4 cross-tag injectivity record. Its `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` is a **different unsigned, one-tag** map, refuted on a selected T22 arm by a dimension obstruction. Its literal r23 Delete/Retag Hall records are combinatorial relations with different source/edge definitions. `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` is a distinct OPEN capacitated network. None is settled by this signed-kernel calculation. The target `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` remains OPEN.

If the controller registers this mechanism, the exact proposed statement is:

> **E993-LOWER-REGION-C4-T4-SIGNED-CROSS-TAG-INJECTIVITY — REFUTED.** For every finite ordinary tree (T) and natural (p) with (x(T)+2\le p) and (3p<2\alpha(T)+1), fix the original-leaf selector (F=\{v:\Delta_p(T-v)<0\}\), the separate tagged spaces (K_j) of independent (j)-sets of (H_v=T-\{v,s_v\}) meeting (W_v=N_T(s_v)\setminus\{v\}), and a fixed total order on vertices and leaf tags. The rational map (L:K_p\to K_{p-1}) deletes each element of a source (p)-set with alternating position sign, retaining its original tag when the resulting face still meets (W_v), otherwise assigning the least favorable tag for which that face is independently valid and marked, and omitting the term if none exists. The claim that (L) is injective for every such instance is false: (T=K_{1,12}), (p=8), any natural tag order, and the displayed nine-term vector give (Lz=0\ne z).

The proof of the separate C4-T4 relative-chain identity is direct: (R_v=H_v-W_v), so the difference (i_j(H_v)-i_j(R_v)) counts exactly the valid tagged (j)-faces. With fixed (F), each selected summand is (q_v(p)-q_v(p-1)), hence (S=\dim K_p-\dim K_{p-1}). This proposition survives the counterexample.

All 13 source SHA-256 pins in the brief matched. Run `python3 REPLAY.py` in this directory to regenerate `RESULTS.json` and `EVIDENCE.json`; the replay uses exact integer counts and signed coefficients, with no Lean build or registry mutation.
