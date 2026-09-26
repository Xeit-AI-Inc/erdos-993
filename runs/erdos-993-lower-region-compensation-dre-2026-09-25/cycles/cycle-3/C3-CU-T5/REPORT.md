# C3-T5 opposing-orientation critique (U)

## Integrity and scope

The 115 listed common source hashes and all four case-file hashes match their packet pins (119 total). The assigned route contains exactly two claims, both covered below. I copied its `COMPUTE.py` into this worker directory as `COMPUTE-replay.py` and ran that copy; the complete script and replay result summary are preserved in this directory. I read the allowed T_m coefficient direction. I did not read other worker outputs.

## T5-TM-COEFFICIENT-IDENTITY — retained_narrowed

The exact polynomial identity is valid on the displayed T_m family and the stated both-orbits-selected condition. For the described tree, splitting independent sets at root 0 gives

\[
P=(1+2z)B^m+z(1+z)^{3m+1},\quad B=1+4z+3z^2+z^3.
\]

For the path leaf (support 1), deleting that leaf and support leaves root 0 with the claws, whose polynomial is B^m+z(1+z)^(3m); deleting the closed neighborhood of 1 leaves the m claws, with polynomial B^m. Thus q_arm=z(1+z)^(3m). For a claw leaf, deleting it and its center leaves the path branch factor (1+2z), the two detached sibling leaves, and the other m-1 claws, plus the root-present term z(1+z)^(3m); deleting the center closed neighborhood leaves the path edge and the other claws, with polynomial (1+2z)B^(m-1). Subtraction gives q_claw=z(2+z)(1+2z)B^(m-1)+z(1+z)^(3m). The path contributes one leaf tag, and the m root-adjacent claws contribute 3m tags. Summing these terms yields

\[
Q_{all}=(3m+1)z(1+z)^{3m}+3m z(2+5z+2z^2)B^{m-1}.
\]

For each tag, if q_j=i_j(H)-i_j(R), then its summand is exactly q_p-q_(p-1). Thus the coefficient-difference formula for the full sum follows when both orbits pass the selector. It cannot be used for a row where either orbit fails the strict selector. The route's computation correctly evaluates the selected orbit terms separately before using the all-leaf identity as a check.

The narrowing is to this explicit family, these polynomial formulas, and the both-orbits-selected identity. The route does not establish selector coincidence or the sign of the coefficient difference for all eligible m,p.

## E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE — retained_narrowed

The copied exact-integer replay reproduces 674 eligible (m,p) rows for m=1,...,50, with both orbit selectors true in every row and all complete sums negative. It also reproduces the compensation row m=22,p=34: alpha=68, x=32, 3p=102<137=2alpha+1; the single arm term is 212336130412243110, while each of the 66 claw terms is -7560098737536570631, giving full sum -498754180547001418536. This checks the stated guard, the strict-selector outcome as computed, multiplicities, sign arithmetic, and the complete tagged sum on that row. For the script's first-descent scan, it checks Delta_j(P) through j=alpha, including the terminal zero-extension comparison Delta_alpha=-i_alpha.

The route has no proof of the infinite T_m selector classification or selected coefficient inequality, and no argument for general ordinary trees. This finite T_m replay is evidence only for its stated boundary; it is neither a proof nor a refutation of the registered universal lower-region aggregate. The status remains proposed_open.

## Limitations

The replay reruns a copied route script rather than an independently written enumeration. The symbolic verification uses the pinned coefficient formulas and root-splitting derivation; I did not independently enumerate independent sets of every T_m. No result is asserted beyond m<=50 and the route's explicit family. Same-support leaf tags are counted separately (three per claw), and the route does not conflate this evidence with a support-fiber claim.
