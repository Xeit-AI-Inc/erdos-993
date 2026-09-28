# C4-CF-T2 critique report

## Scope and result

I reviewed both packet-required claims: the registered guarded weighted-tip-deck comparison and C4-T2's conditional implication from that comparison to an actual strict tip selector. I checked the worker packet's four source hashes and all 174 common-dispatch member hashes; all 178 matched. The review used only the common neutral inputs, the C4-T2 packet sources, and this scratch's own exact replays.

**Weighted comparison — proposed open.** With the exact profile definitions and original multiplicities in the registered claim, the proposed inequality is

\[
W[k+1]C[k-1]\le W[k]C[k],\qquad 1\le k,\quad 2k\le N+2,
\]

where \(W=\sum_i r_iA_i\). I found no guarded counterexample, but neither the worker's eight fixed profiles nor my three exact rank checks prove the universal claim. The known individual-deletion failure at \((a_2,a_3,a_4)=(38,0,1), k=77\) is outside this claim's guard (its guarded range ends at 41); it is not a counterexample here. The copied worker program reproduces `weighted_deck_evidence.json`, including its literal parent and original-tip-deletion check.

My separate exact check uses 24 arity-4 branches, so \(N=96\). For the guarded boundary ranks \(k=1,49\) and interior \(k=24\), the signed margins \(W[k]C[k]-W[k+1]C[k-1]\) are respectively 731424, 13494222668769354079683254233167356102254427776974408847680, and 1225075519517546508327696094928586521598583518912. These positive values are bounded evidence only. Replay both checks with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 weighted_deck_check_copy.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_selector_check.py
```

The copied worker script is retained as `weighted_deck_check_copy.py`; the independent profile/rank audit is `independent_selector_check.py`, with its exact output in `independent_selector_evidence.json`.

## Conditional weighted-to-selector implication — proposed retained

Assume the weighted comparison at the actual eligible \(p\). Since \(W[p]>0\) and \(C[p-1]>0\), dividing by their positive product preserves the inequality direction:

\[
\frac{W[p+1]}{W[p]}\le\frac{C[p]}{C[p-1]}.
\]

The accepted `E993-PATH-STAR-ARITY-2-4-FIRST-DESCENT-RATIO-BAND` supplies \(\Delta_x C<0\), positivity and log-concavity of \(C\), for the actual least strict descent \(x\), including its terminal-difference convention. Thus \(C[x+1]/C[x]<1\). Because \(p\ge x+2\), decreasing adjacent ratios give

\[
0<\frac{C[p]}{C[p-1]}\le\frac{C[x+1]}{C[x]}<1.
\]

All denominators here are positive on the required support. Hence \(\Delta_pW<0\). The identity \(\Delta_pW=\sum_i r_i\Delta_pA_i\), with each original \(r_i>0\), implies at least one \(\Delta_pA_i<0\); this is exactly a strict selector evaluated at current \(p\). It does not imply endpoint selection. The actual guards \(x+2\le p\), \(3p<2(N+2)+1\), and \(2p\le N+2\) are all used or retained, and no flat difference is treated as descent.

For a numerical direction check, the same 24-branch profile has actual first descent \(x=47\) and eligible \(p=49\) (\(147<197\), \(98\le98\)). Exact values give \(\Delta_xP<0\), \(\Delta_xC<0\), and

\[
W[p+1]C[p-1]=294536417289215684474770384346330060964540748340451748522560
\]

\[
< W[p]C[p]=308030639957985038554453638579497417066795176117426157370240.
\]

The exact adjacent ratios also satisfy \(W[p+1]/W[p]<C[p]/C[p-1]<C[x+1]/C[x]<1\) in this instance. This is a check of direction and boundary conditions, not a proof of the assumed comparison.

Finally, one or more selected branches suffice for the local MASS consequence: if \(R=\sum_{i:e_i=1}r_i\), then \(R\ge2\), \(b=e_0+R\le R+1\), and the established branchwise bound contributes at least \((3/2)R\,\delta D_j\) to \(A\); since \((3/2)R\ge R+1\), this covers \(b\delta D_j\). This consequence retains original tag multiplicities. It does not establish the weighted comparison or upgrade bounded evidence to a universal proof.

## Scope limits

The weighted claim remains open at its registered scope. The conditional implication is an informal proof conditional on that open claim and on the accepted first-descent and branchwise bounds. No Lean build, formal award, or claim about arbitrary trees, the primary exact-ratio payment, the aggregate, or Erdős 993 follows from this critique.
