# C5-CU-T2 independent critique

## Dispositions

1. **`C5-T2-ACTIVITY-BASIS-NEGATIVE-LAYER` — retain, narrowed to the proposed coefficientwise-positivity mechanism.** For the ordinary profile ((a_2,a_3,a_4)=(0,0,3)), (N=12,n=18), distinguished branch (i), and activity in the other two factors, the monomial-(t) coefficients of
   \[
   A_{i,t}[7]C_t[7]-A_{i,t}[8]C_t[6]
   \]
   are ((1{,}898{,}616,171{,}542,6{,}175,-66,0)). The rank (k=7) satisfies (1\le k,2k=N+2), so the negative (t^3) coefficient refutes coefficientwise nonnegativity on this guarded rank. At (t=1), however, the minor is (2{,}076{,}267>0). The actual parent first strict descent is (x=7); eligibility requires (p\ge9) and (p\le7), so there is no actual eligible payment rank in this example. This is not a counterexample to either LR predicate or the payment.

   Boundary/interior checks for this activity polynomial at (k=1,4,7) give coefficient lists ((126,40,3,0,0)), ((326220,164806,33688,3290,127)), and the list above. Their (t=1) values are all positive. These checks delimit the mechanism obstruction; they do not prove a universal sign result.

2. **`E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR` — open.** In the exact ((0,22,0)) profile, (N=66,n=91,\alpha=68), the polynomial formulas give first descent (x=32). At (p=34), all actual guards hold: (x+2=p), (3p=102<137=2\alpha+1), and (2p=68=\alpha). The current-(p) strict selectors are (e_0=e_i=1) for each arity-3 branch, hence (b=1+22\cdot3=67), retaining original multiplicities. For the guarded shifted rank (k=27), the exact isolated-binomial minor is
   \[
   M_{27}(E)=E[27]C[27]-E[28]C[26]
   =-518620474811633289768751398606375936,
   \]
   but the full tip minor is (777419068009671422357461955841645743808>0). At (k=1,34), the same full tip minor is respectively (4184) and (3519646978509896300712980023674737675664). At actual (j=p-2=32), it is (4379201511889896286434389991529125770579>0). Thus the negative (E)-term cannot be assigned a sign by itself; these positive samples do not prove the universal guarded claim.

3. **`E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR` — open.** For the same homogeneous profile, symmetry and the original multiplicity (r_i=3) give (W=\sum_i r_iA_i=66A_i) and (M_{27}(W)=66M_{27}(A_i)=51309658488638313875592489085548619091328>0). This is one exact sample only. The valid implication is one-way: if each individual minor (M_k(A_i)\ge0), then
   \[
   M_k(W)=\sum_i r_iM_k(A_i)\ge0
   \]
   because every original multiplicity (r_i\) is positive. This positive-sum step preserves the inequality direction. It does not show that a weighted minor controls every individual minor, and a single positive weighted sample establishes neither universal claim.

4. **`E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS` — open.** The stated reduction is directionally valid, conditional on the enlarged-order ULC curvature bound and the main-product LR lemma. Writing (A_i=U_i+E), the latter ingredients give
   \[
   M_k(U_i)\ge \frac{h+1}{(k+1)(h-k+1)}U_i[k]C[k].
   \]
   Therefore the registered surplus inequality implies (M_k(U_i)+M_k(E)\ge0), which is the full tip shifted comparison. Multiplying or dividing by (d=(k+1)(h-k+1)>0) preserves order: on the guarded band (k\ge1,2k\le N+2), one has (h\ge N), hence (h-k+1>0). This only proves sufficiency, not the surplus inequality itself or the endpoint comparison.

   In the ((0,22,0)) profile, (h=89). Exact surplus left sides at (k=1,27,34) are respectively (725172), (783047390962129386096766512578362723639296), and (3444840812830598299434221356221482345528160), all positive; (M_{27}(E)<0) as above. This is bounded evidence. The predecessor's (217(j+1)\epsilon<1) tail criterion remains a separate source-dependent route; no implication from it to this all-guard exact-ratio condition was established here. The endpoint (A_0) remains outside this tip condition.

## Source and arithmetic audit

All 237 member byte strings in `manifests/C5-COMMON-DISPATCH.json` match their manifest SHA-256 values. All four packet-listed source files match their packet SHA-256 values. I read the required shared structural-reduction and main-mark sources, the current-cycle identity lookup for the three registered predicates, and the packet's T2 case; I did not inspect other worker cases or private proposals. All coefficient computations in `independent_audit.py` use ordinary monomial (z)-coefficients, integer convolution, zero extension and Python integer arithmetic. Thus no powers-of-(L=1+z) coefficient list was interpreted as a monomial list.

A report transcription error was found in the producer's claimed full-tip (k=27) minor for ((0,22,0)). The producer JSON and both independent arithmetic implementations give
`777419068009671422357461955841645743808`; the producer report instead prints
`777419068009671422357461153834912453824`. The corrected integer remains positive, so this typo does not change the mechanism conclusion.

Replay from the eventual admitted directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 paired_minor_audit.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_audit.py
```

The first file is the packet-listed producer script copied into this scratch directory before execution. The second is my independent monomial-basis implementation. Its deterministic output is `independent_audit.json`. No universal proof or full-target counterexample was found. No Lean build, source edit, installation, controller action or message to another worker was performed.

## Evidence grade and limitations

The negative activity layer is an exact finite refutation of coefficientwise positivity for that specific activity expansion. The large-profile values are exact bounded samples with all stated rank guards checked. The individual and weighted guarded LR claims and the exact-ratio surplus remain OPEN at their full universal scopes. None of these results changes the exact-ratio selected-payment or selected-MASS status, the established aggregate evidence, or any unrestricted Erdős 993 claim.
