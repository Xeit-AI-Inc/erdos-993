# C5-F3 independent search report

## Scope and input integrity

I followed the F3 application-boundary lens in `control/C5-SEARCH-ALLOCATION.json`. The packet has no additional allowed source files and no required covered claim IDs. I read the worker protocol, root `SOLUTION-CONTRACT.md`, status-grade clarification, neutral handoff, current allocation and packet; the requested `control/SOLUTION-CONTRACT.md` path is absent. I checked all **237** members named by `manifests/C5-COMMON-DISPATCH.json`: zero missing files and zero SHA-256 mismatches. Claim identity lookup was limited to the finite-block coefficient/Jensen theorem, occupancy cofactor, selected exact-ratio payment, first-descent ratio band, and guarded individual/weighted deletion comparisons.

## Finding: the finite-block floor does not transfer to a shifted marked-deletion comparison

The registered finite-block theorem `E993-FINITE-BLOCK-COEFFICIENT-JENSEN-DOMINATION` is formally verified at its stated scope. In a single block of size (r=2), set the real block coefficients to

\[
 (f(0),f(1),f(2))=(1,2,100),\qquad
 (\binom20,\binom21,\binom22)=(1,2,1).
\]

The coefficient-floor hypotheses hold. The product polynomial is (H=1+2z+100z^2), while the binomial baseline/comparator is (C=(1+z)^2=1+2z+z^2). The theorem's exponent values are (y_0=0, y_1=0, y_2=198/101): at ranks 0 and 1 the sampled block count has no excess weight; at rank 2 it is always 2 and the summand is (2(100-1)/(100+1)). Thus this example is inside the exact finite-block theorem's domain, including its actual uniform-subset law.

At the guarded rank (k=1), however, the shifted cross-minor is

\[
 H[1]C[1]-H[2]C[0]=2\cdot2-100\cdot1=-96<0,
 \qquad 1\le k,\quad 2k\le r+2.
\]

The deterministic exact-arithmetic replay is `python3 cycles/cycle-5/C5-F3/coefficient_floor_obstruction.py` and prints the coefficients, all three (y_k), and the signed minor. This proves a narrow logical point: the generic coefficient floor/Jensen conclusion by itself gives no shifted likelihood-ratio sign, even on a lower-half rank satisfying the analogous guard. It does not realize an ordinary path-star graph, a marked leaf deletion (A_v), an actual first descent (x), any strict current-(p) selector, or a failure of a registered claim.

## Application boundary and exact bridge needed

For the ordinary path-star, the needed marked objects have the specific shared-factor structure

\[
C=G B_{r_i}H_i,\qquad
A_i=U_i+E=G B_{r_i-1}H_i+zL^N,
\]

with the original branch carrying multiplicity (r_i). The comparison decomposes exactly as

\[
M_k(A_i)=M_k(U_i)+M_k(E),\quad
M_k(V)=V[k]C[k]-V[k+1]C[k-1].
\]

The handoff records a guarded rank where (M_k(E)<0) although the full endpoint and represented-tip margins are positive. Therefore a usable application of generic coefficient domination needs an additional marked-deletion compatibility argument: it must preserve the same (C) and the marked branch factor (B_{r_i-1}), retain the common (E=zL^N) term, and quantitatively show that the (U_i) minor covers any negative (E) minor on every rank being claimed. The endpoint (A_0) requires its own factorization/compensation argument. A lower bound on unmarked block coefficients, including the max-independent-set floor, gives none of those marked identities or signed-minor bounds. The negative term in the recurrence (P=LA_i-z^2G H_i) likewise cannot be dropped to manufacture a sign.

At the primary target, the actual first descent remains the least (x\ge0) with the signed zero-extended Δ\(_xP<0); each selector is the strict flag at the same actual (p), not a weak or transferred flag. The stated guards (x+2\le p, 3p<2\alpha+1, 2p\le\alpha), original tag multiplicities (endpoint 1 and each branch (r_i)), and all rank boundaries must survive any such bridge. This search supplies no change to the registry's computer-assisted/nonformal grade for the exact-ratio payment and no primary formal award.

## Evidence and limits

- Exact obstruction artifact: `cycles/cycle-5/C5-F3/coefficient_floor_obstruction.py`.
- Replay: `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-5/C5-F3/coefficient_floor_obstruction.py`.
- Evidence grade: exact finite integer/rational calculation plus a direct algebraic evaluation; no universal graph conclusion and no Lean work.
- No broader census was needed. The example is deliberately a generic finite-block input, so it diagnoses insufficiency of the transfer premise rather than refuting actual marked-deletion comparisons.
