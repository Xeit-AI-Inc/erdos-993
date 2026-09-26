# C3-PREP-THIRD-SHELL-AUDIT — proposal to controller

**Verdict: PASS as an informal mathematical audit, conditional on the exact pinned first-wide graph theorem.** The proposed pointwise statement holds by the argument below for every finite ordinary tree (T), every natural (p\ge14) with (|T|=2p+4) and (x(T)+2\le p), and **every original leaf** (v). Here (x) is the first rank with a negative forward difference. This is a proposal, not a Lean build, kernel receipt, registry award, Hall theorem, governed aggregate theorem, or conjecture proof.

## Source and finite evidence

All 23 allowed source files matched the SHA-256 values in the exact brief. I read only listed sources and this scratch. The relevant saved source contracts are `Erdos993G1.firstWide_nonpos_of_two_edges` in `G1FirstWideMain.lean` lines 2513–2524, which says (i_{r+1}(G)-i_r(G)\le0) when (|G|=2r+2), (r\ge1), and (G) has at least two edges; and `ThirdWide.binomDelta_floor` / `binomDelta_mono_center` in `R25Card5Main.lean` lines 954–1002. `FirstInteriorMain.lean` lines 84–145, 203–229 fixes the original leaf, support, deletion sets, aggregate, and first-negative-rank conventions. These were inspected at their signatures, not rebuilt. The second-shell report was used only as a comparison; its matching-four dependency was checked afresh below.

`verify_third_shell.py` independently enumerates the certificate domains from the five disjoint edges, checks every row and image, and tests the whole lifted map for (k=4,5,6,7,8). `EVIDENCE.json` records the results. The five-edge core has exactly 80 independent rank-four sets and 80 rank-three sets; the 80-row map covers every upper set, has 80 different lower images, and every image is a proper independent subset. For the three-prefix case, the allowed outside states are exactly (\varnothing,\{10\},\{10,11\}), with no state containing 11 but omitting 10. Its upper rank-five domain has (32+80+80=192) sets and its lower rank-four domain has (80+80+40=200). All 192 rows cover the domain exactly once, yield distinct legal lower images, and delete one element. Thus the finite data are actual subset injections, not just favorable rank counts. The separate four-edge certificate has a complete 48-row rank-four to rank-three subset injection in (4K_2+K_1), with 56 possible lower states; I independently checked it as the odd-residual dependency. The bounded lift checks are corroboration only; the universal argument follows.

## Universal five-matching even-order lemma

Let (G) have (2k+2) vertices, (k\ge4), and five disjoint edges. First discard every other edge to obtain (M=5K_2+(2k-8)K_1). Independent sets of (G) form a downward-closed subfamily of those of (M). It suffices to construct an injective map from independent (k)-sets of (M) to independent ((k-1))-sets of (M) that sends each set to a subset: restricting this map to (G) then preserves both independence and injectivity.

Put (m=2k-8). Partition the Boolean lattice on the (m) isolated vertices into symmetric saturated chains. For completeness, recursively extend each chain (A_a\subset\cdots\subset A_{n-a}) on (n) elements by the new element (b): one chain is (A_a,\ldots,A_{n-a},A_{n-a}\cup\{b\}), and, when nonempty, the other is (A_a\cup\{b\},\ldots,A_{n-a-1}\cup\{b\}). These chains partition all subsets, are saturated, and their endpoint ranks sum to (n+1). Start with the singleton empty-set chain. Therefore every outside chain for even (m) starts at a rank (a\le k-4) and ends at rank (m-a).

Fix one outside chain and a matching-core independent set of size (j\le5). A rank-(k) source has outside rank (k-j\ge k-5). There are **exactly three chain-bottom cases**:

1. If (a\le k-6), the outside source is strictly above the bottom. Replace it by its unique predecessor and retain the core. For a fixed core this predecessor operation is injective along the chain.
2. If (a=k-5), the chain has outside ranks (a,a+1,a+2). Strip its fixed bottom (A); its three remaining prefixes identify with (\varnothing,\{10\},\{10,11\}). A rank-(k) source becomes a rank-five state of (5K_2\times C_3). Apply the checked 192-row rank-five to rank-four map, then reattach (A) and interpret its prefix as the corresponding outside-chain member.
3. If (a=k-4), the chain is a singleton. Strip its fixed outside set; the core has rank four. Apply the checked 80-row core rank-four to rank-three map, then reattach that outside set.

The special maps have subset images, so reattachment produces a subset of the source even when a core element is deleted. Each result has total rank (k-1). Within one chain the special maps are injective, and their output outside-chain classes do not meet another chain. The predecessor case retains the core and its output is in a chain with a different bottom rank from either special case; hence the three cases do not collide. More directly, the outside chains partition all outside subsets, and for any one chain the bottom rank determines which one of the three rules is used. For (k=4), (m=0), only the singleton case exists: the 80-row map is the whole proof. This establishes (i_k(G)\le i_{k-1}(G)) universally, without a normal-poset product premise.

For the odd residual needed below, the same construction on (4K_2+(2k-7)K_1) uses a symmetric chain whose bottom is at most (k-4). Bottom (a\le k-5) admits outside-predecessor deletion; bottom (a=k-4) gives a two-element chain and the independently checked 48-row (4K_2+K_1) map. This proves (i_k\le i_{k-1}) for every graph of order (2k+1) with a four-edge matching, (k\ge4). Its finite checks for (k=4,5,6,7) are in the evidence; the chain argument covers all (k).

## Cover-six exclusion at every earlier rank

Suppose (T) has a cover of size at most six. Enlarge it to exactly six vertices (C), possible since (|T|=2p+4\ge32), and put (U=V(T)\setminus C), so (N=|U|=2p-2\ge26) and (U) is independent. Partition independent sets by their intersection (X\subseteq C). For each independent (X), the fiber is (z^{|X|}(1+z)^{b_X}), where (b_X) is the number of outside vertices with no neighbor in (X). Write (E(m,t)=\binom m{t+1}-\binom m t), with binomial coefficients zero at negative and out-of-range ranks. The empty fiber contributes (E(N,r)). For (t\ge0), (E(m,t)\ge-\mathrm{Cat}_t). Independently, for (t\ge1), Pascal gives (E(m+1,t)-E(m,t)=E(m,t-1)), whose sign changes from negative to positive at the center; the minimum occurs at (m=2t-1,2t) and equals (-\mathrm{Cat}_t). For (t=0), (E(m,0)=m-1\ge-1). For (t=-1), the shifted difference is (1); for (t\le-2), it is (0). Those last, nonnegative fibers must be omitted from the loss budget.

Consequently, for every (0\le r\le p-2),

\[
\Delta_r(T)\ge E(N,r)-L_6(r),\qquad
L_6(r)=\sum_{a=1}^{\min(6,r)}\binom6a\mathrm{Cat}_{r-a}.
\]

For (0\le r\le11), (N\ge26), and (E(N,r)) is nondecreasing with (N) in this range: its one-step difference is (E(N,r-1)\ge0) for (r\ge1), and one for (r=0). The exact (E(26,r)-L_6(r)) margins, in order (r=0,\ldots,11), are

`25, 293, 2254, 12303, 50735, 164230, 426971, 902685, 1556639, 2168811, 2352977, 1721965`.

For (r\ge12) with (r\le p-2), (N\ge2r+2), so (E(N,r)\ge E(2r+2,r)=\mathrm{Cat}_{r+1}). At (r=12), the latter is 742900, the six-cover loss is 726052, and the margin is 16848. For each fixed (a=1,\ldots,6), the normalized term (\mathrm{Cat}_{r-a}/\mathrm{Cat}_{r+1}) decreases as (r) increases, since every factor in the intervening product of Catalan ratios (\mathrm{Cat}_{j+1}/\mathrm{Cat}_j=2(2j+1)/(j+2)) increases with (j). Thus (L_6(r)/\mathrm{Cat}_{r+1}\le726052/742900<1) for every (r\ge12). All differences through rank (p-2) are strictly positive. The first negative rank (x(T)) must therefore be at least (p-1), contradicting (x(T)+2\le p). Hence (\tau(T)\ge7).

## Every first-hit residual order

Fix any original leaf (v) with support (s). Put (H=T-\{v,s\}), (W=N_T(s)\setminus\{v\}), (R=T-N_T[s]=H-W), and (k=p-1\ge13). Then (|H|=2k+4). Adding (s) to any cover of (H) covers (T), because the only deleted edges touch (s) (the other deleted vertex (v) is a leaf). Thus (\tau(H)\ge\tau(T)-1\ge6). In fact equality (\tau(T)=\tau(H)+1) follows by the usual leaf exchange on maximum independent sets, but only the lower bound is used. In particular (H) has an edge. A nontrivial component of (H) must attach to (s) along the unique tree path, so some (w\in W) is nonisolated in (H).

Order (W) with that (w) first. Let (q_j(H,W)) count independent (j)-sets meeting (W). Partition each such set by its first mark (w_i). With

\[
D_i=N_H[w_i]\cup\{w_1,\ldots,w_{i-1}\},\qquad J_i=H-D_i,
\]

the exact count is (q_j(H,W)=\sum_i i_{j-1}(J_i)). The first (D_i) has at least two vertices because (w_1) has a neighbor; each later (D_i) contains its own mark and an earlier distinct mark. Every edge removed from (H) is covered by (D_i\setminus\{w_i\}): an edge at (w_i) has its other endpoint in the closed neighborhood, and any other removed edge has an endpoint in (D_i\setminus\{w_i\}). Thus, for (d=|D_i|\ge2),

\[
\tau(J_i)\ge\tau(H)-(d-1)\ge7-d.
\]

This covers overlaps between earlier marks and the closed neighborhood, including an isolated later mark. Each residual is a forest, and a forest has minimum cover number equal to maximum matching size. An elementary proof chooses a leaf (u) of a nontrivial component with neighbor (t): a minimum cover can be chosen to contain (t), and a maximum matching can be chosen to contain (ut); deleting (t) leaves (u) isolated and reduces both optima by one. Induct on edges.

The exhaustive cases are:

| (d) | Residual order and information | Reason (i_k(J_i)\le i_{k-1}(J_i)) |
|---|---|---|
| 2 | (2k+2), (\tau\ge5), hence five disjoint edges | Five-matching even-order lemma above |
| 3 | (2k+1), (\tau\ge4), hence four disjoint edges | Four-matching odd-order lemma above |
| 4 | (2k), (\tau\ge3), hence at least three edges | Pinned first-wide theorem at (r=k-1\ge1), requiring only two edges |
| (d\ge5) | At most (2k-1) vertices | Ordinary downward-shadow incidence: if (m\ge k), (k,i_k\le(m-k+1)i_{k-1}\le k,i_{k-1}); if (m<k), (i_k=0) |

Summing the exact first-hit fibers gives (q_{k+1}(H,W)\le q_k(H,W)). Since (R=H-W), (q_j(H,W)=i_j(H)-i_j(R)), including out-of-range ranks. Hence each original-leaf term is

\[
\Delta_{p-1}(H)-\Delta_{p-1}(R)=q_p(H,W)-q_{p-1}(H,W)\le0.
\]

The saved aggregate is a sum over the original leaf set filtered by strict original-vertex-deletion favorability. Every summand in that subset is nonpositive; empty selection gives zero, and leaves sharing a support remain separate summands. The strict alpha guard is unused in this pointwise shell result.

## Falsification checks and limits

I tested the endpoint (k=4), the three allowed chain bottoms, both finite domains and prefix restrictions, the negative shifted ranks in the cover budget, all twelve low-rank margins, the (r=12) threshold, the (d=2,3,4,\ge5) deletion cases, and the original (H/R) count identity. No counterexample or missing hypothesis survived those checks. The five-matching lemma is genuinely tied to its residual order: at (k=13), (5K_2+19K_1) has order (2k+3=29) and (i_{13}-i_{12}=1{,}202{,}852>0). This is a local counterexample to extending that lemma one vertex further; it is not a counterexample to the tree claim.

If accepted, this proves only the exact-order (2p+4) aggregate as a consequence of the pointwise sign, and can be combined with separately accepted earlier shells only at their own exact orders. At larger order excess, a (d=2) first-hit residual has more than (2k+2) vertices, where five matching edges alone do not force the sign. The argument supplies no compensation mechanism for positive local terms, no all-order aggregate, no weighted-switch Hall result, and no conclusion for (p<14). Universal lifting is an informal proof; finite scripts cannot replace a Lean formalization or recheck the pinned first-wide theorem in a kernel.
