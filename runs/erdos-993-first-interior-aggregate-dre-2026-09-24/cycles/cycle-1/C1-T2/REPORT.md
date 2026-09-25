# C1-T2 Cycle 1 report

## Scope and definitions

This is the frozen ordinary-tree target with integer p=alpha(T)-2 and x(T)+2<=p. For each original leaf v with support s, let H=T-{v,s}, R=T-N[s], and let a_v=Delta_p(T-v). A leaf is favorable exactly when a_v<0. The requested sum is S=sum_{a_v<0}(Delta_{p-1}(H)-Delta_{p-1}(R)); leaves sharing a support retain their separate tags.

No residual hypothesis is used. The derivation below concerns literal finite simple trees and uses no h-index, transfer, or external conjecture.

## Exact deletion identity and reduction

Put C=N_T(s)-{v}. Then R=H-C. In T-v, the independent sets avoiding s are exactly the independent sets of H, while those containing s are s joined to an independent set of R. Therefore the independence polynomial satisfies
I_{T-v}(z)=I_H(z)+z I_R(z).
Writing h_j=i_j(H) and r_j=i_j(R), coefficient comparison gives
a_v=(h_{p+1}-h_p)+(r_p-r_{p-1})=Delta_p(H)+Delta_{p-1}(R).

The summand g_v is
g_v=(h_p-h_{p-1})-(r_p-r_{p-1})=Delta_{p-1}(H)-Delta_{p-1}(R).
Adding the two identities yields
g_v+a_v=h_{p+1}-h_{p-1},
so for every favorable leaf,
g_v = [i_{p+1}(H)-i_{p-1}(H)] + |a_v|.                         (1)

Also I_T=(1+z)I_H+zI_R, so alpha(T)=alpha(H)+1 because R is an induced subgraph of H. At p=alpha(T)-2, (1) specializes to
g_v = i_{alpha-1}(H)-i_{alpha-3}(H)+|Delta_{alpha-2}(T-v)|.      (2)

Thus a sufficient pointwise statement for the full target is the exact “rank-budget” inequality, for every favorable original leaf,
i_{alpha-3}(H)-i_{alpha-1}(H) >= -Delta_{alpha-2}(T-v).         (3)
If (3) holds, each summand is nonpositive and summing preserves the distinct leaf tags. A weaker aggregate budget could also suffice. Identity (3)'s equivalence to g_v<=0 follows directly from (2); it is not itself proved here.

## Status and precise gap

The polynomial factorization and identities (1)–(2) are proved above for every finite ordinary tree and every leaf, without eligibility assumptions. They reduce the frozen target to controlling a near-maximum coefficient gap of H against the strict selector deficit of T-v. I do not prove (3), an aggregate replacement for it, or the target S<=0. The universal complete aggregate therefore remains open from this seat.

A potentially useful rank feature is that H has independence number alpha-1, so the two H coefficients in (2) are its maximum-set count and its count two below maximum. But eligibility is a condition on T's first strict descent. I found no justified transfer of that condition to a sign or magnitude bound for these two coefficients in each H_v, and I make no such assumption.

## Fresh falsification checks

I tested the stronger candidate g_v<=0 for every favorable leaf at p=alpha-2 using exact integer tree-DP coefficients. All tested cases were eligible, and every tested favorable summand was nonpositive. These are bounded checks, not evidence of universality.

- P_501: n=501, alpha=251, x=139, p=249, 2 favorable leaves, S=-322849250.
- T_125 from the copied deterministic constructor: n=503, alpha=377, x=181, p=375, 376 favorable leaves, S=-26506125.
- Four deterministic uniform Prüfer trees of order 260: all eligible; respectively (alpha,x,p,F,S)=(147,79,145,96,-36327064026382336), (146,80,144,91,-11820291646586501120), (146,79,144,93,-9046564555277139968), and (146,79,144,94,-6020601544695297024). Every one had zero positive favorable summands. The Prüfer sequences and exact edge lists are recorded in random-probe.json.

Replay from the run root after controller admission:
- `python3 cycles/cycle-1/C1-T2/identity_probe.py`
- `python3 cycles/cycle-1/C1-T2/random_probe.py`

Both scripts import the worker's copied `ordinary_tree.py`; the independent first-descent routine explicitly checks through terminal k=alpha, where zero extension forces a negative difference. The scripts and input constructors are all in this seat's output package.

## Inherited obstruction checks and applicability

- The inherited T22 order-91 row has a positive favorable summand and a positive singleton-support aggregate at p=34 (r24; also registered as the refutation of E993-BETA-AGG-SUPPORT). This refutes a rank-unqualified pointwise or support-fibre sign method. Here alpha(T22)=68, so its p=34 row is not the p=alpha-2=66 row and does not refute the restricted candidate tested here. I do not infer a support-fibre sign from the aggregate identity.
- Universal tree log-concavity is already refuted by the admitted Kadrawi-Levit order-26 fixtures. The present proof uses no log-concavity premise or coefficient-ratio consequence.
- The fixed- and tag-closed Hall mechanisms have inherited counterexamples (respectively the order-91 T22 cut and order-1567 choked broom); this seat proposes no Hall relation or Hall transfer.
- The old raw edge-difference, same-leaf marginal extraction, cover-diagonal, arbitrary-unimodal-convolution, and N2<=M fences do not enter the deletion factorization or (3). No claim in this report relies on them.
- The r26 top-rank residual theorem is outside scope twice over: it concerns p=alpha-1 and adds the residual hypothesis. Neither its selector collapse nor its residual sign is used.

No Lean build or background job was started. This is an informal derivation plus deterministic bounded computation, not a governed proof. novelty_claimed: false.
