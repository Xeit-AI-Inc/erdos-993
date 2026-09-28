# C3-CT-U3 critique

## Integrity and scope

The packet lists four additional case files; each byte hash matches. All 86 entries of `manifests/C3-COMMON-DISPATCH.json`, all 3 entries of `manifests/C3-TRANSPORT-CLARIFICATION.json`, and all 3 entries of `manifests/C3-CRITIQUE-TRANSPORT.json` match their recorded SHA-256 values. The shared-source clarification authorizes the common cycle3 sources. The v4 seat runner appends that clarification and, for critique seats, the sealed source reconciliation. The v4 stage runner coordinates worker dispatch/admission; neither runner was executed. The targeted registry lookup found the canonical all-m branchwise three-halves claim `E993-PATH-STAR-ARITY-2-4-ALL-M-ACTUAL-ELIGIBLE-BRANCHWISE-THREE-HALVES-MASS` OPEN; the two worker-local claim IDs are not separate registry identities. This review dispositions the packet's exact source claims and makes no identity/status change.

Reviewed the assigned `C3-U3` report, return, layer script and JSON. No producer script was executed. Independent replay command: `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-3/C3-CT-U3/independent_layer_check.py` (from the admitted worker directory). It writes `independent_layer_check.json` alongside the script. The implementation uses exact integer convolution, independently computes the parent least strict descent, checks all three eligible-rank guards, and recomputes both strict current-p selectors at each row.

## Claim dispositions

### `C3-U3-CENTER-LAYER-EXPANSION` — proposed retained

For fixed branch (i), write (B_{r_h}=L^{r_h}+z) in every factor of (H_i). For a subset (J\subseteq[m]\setminus\{i\}) choosing the (z) term, its contribution is

\[
z^{|J|}L^{N-r_i-\sum_{h\in J}r_h}G F_{r_i}.
\]

Taking coefficient (j), and expanding (G=1+2z) and (F_{r_i}=\sum_{s=0}^{r_i-2}L^s), gives the claimed binomial sum with (g_0=1,g_1=2). Every coefficient is nonnegative, so omitting terms with (|J|>d) gives (U_i^{(d)}[j]\le T_i[j]), including zero-extended indices. This is an exact profilewise identity and bound; it gives no uniform depth or local (3/2) theorem.

### `C3-U3-HOMOGENEOUS-LAYER-BOUND-EVIDENCE` — proposed retained_narrowed

The center-layer method and its checked selector/rank rows are valid, but the reported (m=40) layer margins are wrong. The producer script sets `F=[1]*(r-1)`, which for (r=4) is not (F_4=1+L+L^2=(3,3,1)). It therefore uses (GF_4=(1,1,1)*(1,2)=(1,3,2,0)) in its polynomial computation instead of the contract's (GF_4=(3,9,7,2)).

With the corrected factor, exact replay gives (x=78) and eligible (p=80,81) at (m=40); all three guards and both strict selectors are true on both rows. The signed margins (2U^{(d)}-3\delta D_j), for (d=0,1,2,3), are:

- (p=80): ((-591374503393435019823683990776142983238584830740,\ 6152364126501330251950934541782040442847646940,\ 722724455446538076746556482596023354496120951540,\ 1265742321518536493786656532254489069191833626180)).
- (p=81): ((-37490443068911734492940702310639265577961789360,\ 558196907421765106880744122703262130150437272640,\ 1253932479011063659307509494459010751946623931000,\ 1766671821733335423815971200804234232817715208680)).

Thus depth 2 passes both (m=40) rows (contrary to the producer report); depth 1 fails only at (p=80). At (m=150), exact replay gives (x=292), the eight eligible ranks (294\ldots301), with all guards and both strict selectors true. The depth-1 margin is negative at (p=294), and depth 2 has positive margin at all eight rows, so those reported outcomes survive the corrected (F_4). The full branch coefficient passes the tested rows in both profiles. These remain bounded exact checks only; no all-profile local-mass inequality, selected MASS, or payment follows.

The known singleton truncation obstruction is directly relevant to any claim that depth 1 suffices uniformly: the (m=150,p=294) row reproduces its failure. The known spread obstruction is not used by this fixed-profile expansion and is irrelevant to the argument as stated. No broader census is needed for this critique.

## Evidence and limitations

Own replay artifacts: `cycles/cycle-3/C3-CT-U3/independent_layer_check.py` and `cycles/cycle-3/C3-CT-U3/independent_layer_check.json`. The output records actual descent, every eligible row, guard booleans, selector values, full coefficients, truncations and signed integer margins. There is no formal verification. This review does not alter the primary or any registered status and does not claim a full local-mass counterexample.
