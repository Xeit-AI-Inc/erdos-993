# C5-T6 independent critique: six-cover third-shell witness

## Disposition

**Retained, narrowed** for `C5-T6-THIRDSHELL-COVER6-P10`. The evidence establishes an eligible ordinary tree in the third shell `n=2p+4` with a vertex cover of size 6. It therefore rules out treating `tau(T) >= 7` as a universal property of all eligible trees in that slice. More narrowly, the example does not disprove a conditional implication whose hypothesis is `tau(T) >= 7`, nor any proof that separately handles the low-cover cases. The example's full aggregate is negative, so it does not refute the primary inequality.

## Independent checks

I copied the pinned case evidence and `inputs/ordinary_tree_checked.py` into this seat's scratch directory before replay. The replay script `replay.py` constructs the graph from the exact edge list and checks connectedness and the 23-edge tree criterion on 24 vertices, all edges covered by the six listed centers, the full independence polynomial, selector output, every listed summand, and the full sum. It reproduces `alpha=18`, first strict descent `x=8`, `Delta_10(T)=-21766`, all 17 original leaves selected, and `S=-122805`.

I also checked the displayed independence polynomial by a separate branch factorization. With root 0, each of five 3-leaf branches has polynomial `(1+z)^3+z`; the 2-leaf branch has `(1+z)^2+z`; when the root is included, the 17 pendant leaves contribute `z(1+z)^17`. Thus

`P_T(z)=((1+z)^3+z)^5 ((1+z)^2+z) + z(1+z)^17`,

which gives the listed coefficient vector. The eligibility arithmetic is exact: `x+2=10<=p=10` and `3p=30<37=2alpha+1`. Each leaf is separately in the strict selector by the replayed `Delta_10(T-v)<0`; repeated leaves at a support remain distinct and all per-leaf terms agree with the pinned case evidence.

## Exact scope and limitations

This is a finite obstruction only to a claimed universal lower bound `tau(T)>=7` on eligible third-shell trees. Since a sufficient condition `tau(T)>=7` may still hold on the subclass satisfying that premise, this low-cover example alone cannot refute that conditional sufficiency claim. The computed `S` is negative, so this example does not challenge the primary aggregate. It also supplies no general low-cover classification or pointwise sign theorem. Selector and summand replay used the pinned evaluator; I did not run a second implementation for all leaf-deleted polynomials.
