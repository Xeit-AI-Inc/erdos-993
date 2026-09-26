# Unreviewed third-shell extension direction

Do not insert in frozen C3 packets or award. If second-shell candidate survives review, investigate n=2p+4,p>=14,x+2<=p.

A cover C of size<=6 can be enlarged to six, leaving N=2p-2 independent vertices. Corrected Catalan budget (omit nonnegative negative-rank shifts):
Delta_r >= E(N,r)-sum_{a=1..min(6,r)} binom(6,a) Cat_(r-a).
For r>=12, N>=2r+2 gives E>=Cat_(r+1); at r12 the margin is16848>0, and normalized Catalan loss decreases with r. For r<=11 use N>=26 and check twelve finite inequalities. This would force tau(T)>=7, tau(H)>=6.

In the exact first-hit partition H has2k+4 vertices,k=p-1. Let d=|D|>=2. The correct universal cover loss tau(J)>=tau(H)-(d-1) gives:
- d2: Jorder2k+2, matching>=5;
- d3: Jorder2k+1, matching>=4;
- d4: Jorder2k, at least2edges;
- d>=5: elementary ordinary shadow.
The odd matching4 lemma and first-wide lemma cover the latter cases. Missing matching5-even lemma: every graph n2k+2 containing5 disjoint edges has i_k<=i_(k-1), provided k>=4 (n>=10).

Potential constructive proof: symmetric chains on 2k-8 unmatched vertices. If chain bottom a<=k-6, directly delete outside predecessor, since core ranks<=5. Only two exceptional outside chain shapes contribute:
(a) a=k-4, chain length0: require deletion injection rank4 to3 in the independent-set poset of5K2; counts80 to80.
(b) a=k-5, chain length2: require deletion injection rank5 to4 in Q5 x chain3; counts192 to200, where Q5 is the matching independence poset (1+2z)^5 and chain3 has polynomial1+z+z^2. A finite explicit map is needed; counts alone are not Hall. The general normal/log-concave product theorem would imply both finite injections, but constructing/checking them avoids a large literature import. Attach fixed chain bottom and strip it as in matching4 lift. Preserve subsets so extra edges cause no issue. Cases k4 have no length2 exception (negative bottom), handle explicitly.

No proof/certificate yet for these finite maps; no all-order conclusion. Small p3..13 remain outside this proposed third-shell theorem.

## Subsequent finite certificate check

Root constructed both finite subset injections in MATCHING5-EVEN-FINITE-CERTIFICATES.json: 80/80 and192/200. All upper states covered, images distinct and legal subsets inside the prefix-chain restrictions. The earlier missing-map statement above records the prior stage; the maps now exist as finite artifacts. Universal SCD lifting and complete third-shell theorem still need independent review and formalization. Twelve cover-budget margins at N26,r0..11 are25,293,2254,12303,50735,164230,426971,902685,1556639,2168811,2352977,1721965; at r12 normalizedCatalanmargin16848, ratiosmonotone. No award or registration.
