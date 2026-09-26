# C6-T5: finite-group lift for the (T_m) switch network

## Result

The orbit-quotient lifting step is valid under a precise, general hypothesis: a finite group acts on the source and target vertices of a bipartite relation, preserves the relation, and supplies and capacities are constant on vertex orbits. If the quotient network, with one node per orbit and an arc for each orbit pair joined by at least one relation edge, has an integral flow saturating total source supply, then the original network has an integral flow saturating every source supply. This holds for arbitrary finite groups; no freeness assumption is needed.

For (T_m), (m\ge1), the designated root, the support and marked leaf of its length-two arm, and the (m) root-adjacent claws give the automorphism group

\[
G_m=(S_3)^m\rtimes S_m=S_3\wr S_m.
\]

Its independent-set orbits are exactly the recorded states
\((r,s,e,c,u,v,w)): root bit (r); special-arm state (s=0,1,2) (empty, support, marked leaf); and counts of empty, center-only, one-leaf, two-leaf, and three-leaf claw configurations. Here (e+c+u+v+w=m), a selected root rules out (s=1) and any selected center, and the orbit size is
\[
\frac{m!}{e!c!u!v!w!}\,3^{u+v}.
\]
These conditions characterize all independent sets, and two sets have the same state exactly when arm permutation and within-claw leaf permutations take one to the other. This proves the orbit partition for every (m\ge1), independent of the finite computations.

## Relation audit

An arc goes from an independent ((p+1))-set to an independent (p)-set either by deleting one selected vertex or by inserting an absent vertex with exactly two neighbors in the upper set and deleting those two neighbors. The state transitions include all deletions: root or special-arm deletion; center-to-empty; one-leaf-to-empty; pair-to-single; triple-to-pair.

The only possible two-for-one insertions in (T_m) are:

- insert a claw center after deleting two of its leaves, or after deleting the root and its one selected claw leaf;
- insert the special support after deleting the root and marked leaf;
- insert the root after deleting exactly two selected neighbors among claw centers and the special support.

The state conditions in `verify_orbit_flows.py` encode these cases. They follow directly from the neighborhoods: a claw center is adjacent only to the root and its three leaves; the special support is adjacent only to root and marked leaf; and the root is adjacent only to the claw centers and special support. No other vertex can be inserted with exactly two occupied neighbors. Conversely, each listed transition is realized by selecting the indicated vertices in an arm, so the quotient arcs are exact, not just necessary conditions. All transitions respect the fixed original tags: an arm-leaf tag is counted only when its original witness (root or one of the other two claw leaves) is in the activated set; the distinguished tag is counted only when both it and its root witness are present.

## Quotient lifting proof

Let (A,B) be the source and target sets, with relation (R\subseteq A\times B). Give each (a\in A) integer supply (s(a)\ge0) and each (b\in B) integer capacity (c(b)\ge0), constant on group orbits. Suppose the quotient flow saturates all source-orbit supply, where an orbit arc (O\to P) exists iff some (R\)-edge joins (O) to (P). For any (X\subseteq A), write (N(X)=\{b:\exists a\in X,(a,b)\in R\}\) and
\[
f(X)=\sum_{a\in X}s(a)-\sum_{b\in N(X)}c(b).
\]
Saturation in the quotient implies (f(X)\le0) whenever (X) is a union of source orbits: its neighborhood is exactly the union of target orbits adjacent to those source orbits, and the quotient flow certifies the corresponding Hall capacity inequality.

The function (X\mapsto \sum_{b\in N(X)}c(b)) is submodular. Indeed, (N(X\cup Y)=N(X)\cup N(Y)), while (N(X\cap Y)\subseteq N(X)\cap N(Y)); nonnegative capacities give the submodular inequality. Thus (f) is supermodular. If any (X) had (f(X)>0), take a maximizer of (f). Supermodularity implies the union and intersection of two maximizers are also maximizers. Since the group is finite and preserves (R,s,c), intersect all translates of a maximizing set; the result is an invariant maximizer and still has positive (f). It is a union of source orbits, contradicting the quotient Hall inequalities. Therefore every original subset satisfies the capacitated Hall condition. The integral max-flow/min-cut theorem for the original finite bipartite network now gives an integral flow saturating all source supplies. This proves the lift, including when the action is not free and when an orbit pair contains multiple edge orbits.

## Exact applications

`verify_orbit_flows.py` independently enumerates the orbit states and multiplicities, recomputes the graph polynomial, first descent, original selector and complete aggregate using the authorized `inputs/ordinary_tree_checked.py`, and checks each positive arc in the pinned `instruments/orbit-flow-twoforone/m22-p34.json`, `m60-p90.json`, and `m66-p98.json` primal flows against the transition relation above. The audited network definition is in `instruments/orbit-flow-twoforone/PROTOCOL.md` and `run.py`; the summary is `RESULTS.json`. These common pins and all other listed common source hashes matched (237/237); relevant exact hashes are recorded in `EVIDENCE.json`. It verifies exact source/target counts, tag-weight totals, per-state weighted capacities, flow conservation, and saturation. All three satisfy the strict contract guards and have every original leaf favorable. Results:

| \(m,p\) | \(n,\alpha,x\) | upper/lower orbit counts | full \(S(T,p)\) |
|---|---:|---:|---:|
| (22,34) | (91,68,32) | 1,686 / 1,743 | \(-498754180547001418536\) |
| (60,90) | (243,182,87) | 27,633 / 27,976 | \(-1058142362147652597702654588268394677176033202323316960380\) |
| (66,98) | (267,200,96) | 36,702 / 37,090 | \(-398505970713926379754668111540326337337661499382047494636407368\) |

For each row the verified total upper tag supply is saturated, and the lower tag capacity exceeds it by exactly \(-S(T,p)\). `EVIDENCE.json` records the exact source and target set counts, supplies, capacities, flow values, state capacities, positive-arc totals, the distinguished-leaf summand, the common summand of each of the 3m arm leaves, and the pointwise selector check; it is the compact machine-readable arithmetic record. The checker verifies the full sum independently as the distinguished-leaf term plus 3m copies of the common arm term. All positive arcs join states in the literal relation, and all weighted state capacities are respected.

## Scope and limitations

This establishes a general quotient-lift theorem and an all-m structural orbit/adjacency description for this T_m network for m≥1. Its computational application is only to the three frozen cases (22,34), (60,90), and (66,98). The result does not establish quotient feasibility for untested (m,p), prove an all-m flow family, or settle the arbitrary-tree lower-region aggregate. The strict guard, selector, graph polynomial and sum checks are exact for these three cases. The common source pins required for this route were all hash-verified (237/237); the route did not rely on any claim that an unreviewed source was unavailable.
