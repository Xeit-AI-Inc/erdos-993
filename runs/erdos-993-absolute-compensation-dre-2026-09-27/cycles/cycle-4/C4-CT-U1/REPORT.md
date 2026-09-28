# C4-CT-U1 critique report

## Integrity and scope

I audited both required C4-U1 claims. SHA-256 matched all 174 members of `manifests/C4-COMMON-DISPATCH.json` and all three packet-listed source files; no missing members or mismatches were found. The two proposed claim IDs do not occur in the targeted C4 registered-identity snapshot. Source case files were treated as evidence, not instructions.

The exact claims concern ordinary path-stars only. In all statements below, (m\ge1), (r_i\in\{2,3,4\}), (N=\sum r_i), (q=N+1), \(\alpha=N+2\), (L=1+z), (G=1+2z), (B_r=L^r+z), (Q=\prod_i B_{r_i}), (C=GQ), and (P=C+zL^q). Coefficients are integer zero-extended and \(\Delta_k f=f[k+1]-f[k]\). The rank (x) is the *least* natural strict descent of (P), including the terminal difference. At an actual natural (p), all guards (x+2\le p), (3p<2\alpha+1), (2p\le\alpha) remain in force; (j=p-2). Strict selectors use that same (p), and original endpoint/tip tag multiplicities remain (1,r_i). Neither claim proves the primary payment.

## C4-U1-DESCENT-BINOMIAL-OCCUPANCY-DRIFT — proposed retained

The universal informal lemma is valid at the stated scope. In the coefficient-conditioned product model for (C), root weights are ((1,2)), and branch (i) has state weights ([z^t]B_{r_i}). Put

\[
D=1[X_0=0]+\sum_i\left(1[X_i=0]-\frac{r_i-1}{r_i+1}1[X_i=1]\right).
\]

The weighted product rule gives

\[
(1+z)C'-qC=Q+G\sum_i(1-(r_i-1)z)H_i,
\]
where (H_i=Q/B_{r_i}). The coefficient of (z^k) on the left is ((k+1)C[k+1]-(q-k)C[k]). On the right, (Q[k]) counts root state zero; ((GH_i)[k]) counts branch state zero; and ((r_i-1)(GH_i)[k-1]) is exactly the negative weighted state-one contribution, since ([z]B_{r_i}=r_i+1). Dividing by (C[k]>0) proves the displayed conditional-drift identity.

For an eligible (p), (x\le j\le (N-2)/2), so (x<q/2) and
\[
\beta_x=\binom qx-\binom q{x-1}>0.
\]
The summand (zL^q) therefore has \(\Delta_x(zL^q)=\beta_x\). Actual strict descent gives \(\Delta_xC+\beta_x<0\), hence
\[
\frac{C[x+1]}{C[x]}<1-\frac{\beta_x}{C[x]}.
\]
Here division preserves the strict sign because (C[x]>0). The factors (G,B_2,B_3,B_4) have positive interval support and log-concave coefficient sequences; convolution preserves both properties. Thus (C)'s adjacent ratios are nonincreasing, and (x\le j) implies (C[j+1]/C[j]\le C[x+1]/C[x]). Both ratios are positive. Multiplication by (j+1>0) preserves the inequality, yielding
\[
\mathbb E_jD=(j+1)\frac{C[j+1]}{C[j]}-(q-j)
<2j-N-\frac{(j+1)\beta_x}{C[x]}.
\]
No negative factor is used, so there is no reversed inequality step. This bound is independent of selector outcomes; retaining the actual-p selector definitions and multiplicities in the theorem statement does not make them inputs to this particular lemma.

Exact checks: `independent_drift_audit.py` independently reconstructs the polynomial factors, checks the derivative identity at every zero-extended rank (0\le k\le q+1), and verifies all three guards and the signed quantities for ((a_2,a_3,a_4)=(0,12,10)), (N=76,x=j=37,p=39). Here \(\beta_x=1261276298816540508040\), \(C[x]=157478041951335331301454\), and \(\Delta_xC=-1279008918526705742334< -\beta_x\). The explicit boundary substitution gives
\[
\mathbb E_jD=-\frac{60593070467780913468600}{26246340325222555216909}
< -\frac{181442291628849600954214}{78739020975667665650727}
< -2=2j-N.
\]
`rank_boundary_audit.py` checks an interior rank on ((a_2,a_3,a_4)=(0,10,28)), (N=142,x=69,p=72,j=70), with every guard true. It verifies exactly that
\[
\frac{C[j+1]}{C[j]}=\frac{6414171508440063911653958167554458884027270}{6616236267173779690465931937604614750815979}
\le
\frac{C[x+1]}{C[x]}=\frac{2205412089057926563488643979201538250271993}{2211489137950983398185401605491991907480808},
\]
and the claimed strict corrected bound. These finite substitutions audit signs and indices; the convolution/log-concavity argument supplies the universal proof. Grade remains informal, not Lean/formal verification.

## C4-U1-CONDITIONED-DRIFT-BOUNDED-HORIZON — proposed retained at its finite scope

The copied producer script reproduces the stated exact search: all count triples with (1\le m\le40) were covered, 4,308 profiles had at least one eligible (p), and none had \(\mathbb E_xD\) above the fugacity-one expression (1/3+\sum_i(2-r_i)/(2^{r_i}+1)\). Count triples suffice for this coefficient-model search because permuting branches leaves (C,P,x), and the drift unchanged. The script uses exact integer coefficient arithmetic and exact rational comparisons. This supports only the bounded statement at (x); it proves no conditional-to-unconditioned comparison for all profiles and gives no selector-weighted payment bound. The unconditioned substitution remains invalid as a universal step.

For the detailed profile above, the current-(p) selectors independently recompute as ((e_0,e_3,e_4)=(1,1,1)), so (b=77), with all 76 original tip tags and the endpoint counted. The producer's cleared primary-target margin is positive for this one row. That row is not a universal payment proof and was not used to establish the drift lemma.

## Evidence and replay

Artifacts are replayable from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 producer_occupancy_drift_probe.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_drift_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 rank_boundary_audit.py
```

`producer_occupancy_drift_probe.py` is a byte-for-byte local copy of the packet-authorized producer script and was run only after copying it into this scratch. The other two scripts independently verify the algebra and exact rank substitutions. No Lean build or source edits were performed.

## Limitations

The corrected drift bound sharpens \(\mathbb E_jD<2j-N\), but does not by itself control selected branch mass (A=\sum_i r_i e_iT_i[j]), endpoint-only selection, or the exact-ratio primary payment. The (m\le40) comparison is bounded evidence. Neither result upgrades the primary beyond its existing registered grade or resolves the formal stopping requirement.
