# C4-U1 search report

## Scope and integrity

I followed the Cycle 4 U1 allocation: seek an actual-descent/occupancy coupling without treating a fugacity-one mean as a conditional coefficient probability. The packet has no worker-specific source files. SHA-256 verification matched all 174 members of manifests/C4-COMMON-DISPATCH.json and all four members of manifests/C4-U1-DISPATCH.json, including the packet; there were no mismatches.

Use the contract's ordinary path-star with m >= 1, branch arities r_i ∈ {2,3,4}, N = Σr_i, q = N+1, α = N+2, L = 1+z, G = 1+2z, B_r = L^r+z, F_r = Σ_(h=0)^(r-2)L^h, Q = ∏B_(r_i), H_i = ∏_(h≠i)B_(r_h), C = GQ, T_i = GF_(r_i)H_i, and P = C+zL^q. Coefficients and forward differences Δ_k f=f[k+1]-f[k] are integer-zero-extended. Let x be the least natural k with Δ_kP<0, including the terminal difference.

At the actual current rank p, retain all guards x+2≤p, 3p<2α+1, 2p≤α; put j=p-2, δ=q-j, D_j=binom(N,j+1)-binom(N,j)>0. The original-leaf deletion polynomials are A_0=LQ+zL^N and A_i=GB_(r_i-1)H_i+zL^N. The selectors are evaluated at this same p: e_0=1[Δ_pA_0<0], e_i=1[Δ_pA_i<0], b=e_0+Σr_ie_i, and A=Σr_ie_iT_i[j]. The endpoint keeps one original tag and branch i keeps its r_i original tip tags. No supports or multiplicities are recomputed.

## Exact first-descent occupancy bound

On the product coefficient model for C=G∏B_(r_i), let root state X_0∈{0,1} have weights (1,2), and branch state X_i∈{0,...,r_i} have weights [z^t]B_(r_i). Condition on X_0+ΣX_i=k, and define

    D=1[X_0=0]+Σ_i(1[X_i=0]-(r_i-1)/(r_i+1)1[X_i=1]).

The local weights give the exact identity

    E_k D=((k+1)C[k+1]-(q-k)C[k])/C[k]
         =(k+1)C[k+1]/C[k]-(q-k).

For an actual eligible p, x≤j=p-2≤(N-2)/2, so β_x=binom(q,x)-binom(q,x-1)>0. Since the binomial summand zL^q has Δ_x(zL^q)=β_x, the actual first descent gives

    Δ_xP=Δ_xC+β_x<0,
    C[x+1]/C[x]<1-β_x/C[x].

Each factor of C is positive on an integer interval and log-concave; convolution preserves these properties, so the adjacent coefficient ratios of C decrease. Therefore C[j+1]/C[j]≤C[x+1]/C[x] and

    E_j D < 2j-N-(j+1)β_x/C[x].

This is a universal informal coefficient proof. It sharpens E_jD<2j-N by retaining the positive shifted-binomial contribution to the actual first descent. It is not a Lean result and does not alone bound selected mass A, exclude endpoint-only selection, or prove the primary payment.

## Exact bounded probe

occupancy_drift_probe.py reconstructs C, P, deletion polynomials, and marked factors with integer polynomial arithmetic and zero-extended lookups. Its deterministic search checks all count triples for 1≤m≤40 having at least one actual eligible p. It evaluates conditioned drift at the actual first descent x, verifies the derivative identity at each included profile, and checks literal guards. The search checked 4,308 profiles and found none with E_xD greater than its fugacity-one value. This is bounded evidence only; it neither proves a conditional-versus-unconditioned comparison nor licenses replacing one by the other.

A detailed eligible profile is (a_2,a_3,a_4)=(0,12,10): m=22, N=76, n=78, α=78, q=77, x=37, p=39, j=37, δ=40. All three guards hold. The actual current-p selectors are e_0=e_3=e_4=1, hence b=77. Exact values:

- C[x]=C[j]=157478041951335331301454, Δ_xC=-1279008918526705742334, and β_x=1261276298816540508040.
- C[j+1]=156199033032808625559120, D_j=176733862787006701400, T_3[j]=52490861809690993350452, T_4[j]=64566367527362107996110, and A=4472325726243360080460672.
- E_xD=-60593070467780913468600/26246340325222555216909; the fugacity-one value is -37/17, so the signed difference is -58967605919040985940567/446187785528783438687453.
- The corrected bound at j is -181442291628849600954214/78739020975667665650727, below 2j-N=-2.
- The cleared exact-ratio payment margin is the positive integer 841657089276596927110510442162384388444656818560.

This row is a consistency check and bounded example, not a counterexample to a registered predicate or a universal proof. It confirms the strict selectors and original multiplicities directly from the stated polynomials.

## Limitations and next obligation

The correction depends on β_x/C[x]; I did not derive a uniform lower bound strong enough to replace the small-prefix local certificates. The bounded search did not establish a general comparison to fugacity-one averages. Payment progress still needs a bound for the selector-weighted branch mass, including endpoint-only selection, with the actual current-p flags. Existing computer-assisted selected MASS/payment remains at its registered grade and was not used as a premise.

Replay from this directory:

    PYTHONDONTWRITEBYTECODE=1 python3 occupancy_drift_probe.py

The script uses only the Python standard library and exact integers/rationals.
