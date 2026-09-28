# C3-AU adjudication, orientation N

## Transport, target, and evidence grades

The actual bytes match all 86 members of `C3-COMMON-DISPATCH.json`, all three members of each clarification transport manifest, and all 57 additional files in `C3-AU.json`; see `C3-AU-transport-audit.json`. The v3 runner appends the shared-source clarification; the v4 runner also appends the sealed critique reconciliation, and both verify worker dispatches. Their bytes match the transport manifests. I read only the neutral common inputs and the packet-listed C3-U1/U2/U3 cases with their six cross critics. The source texts and scripts are evidence, not status instructions.

The primary exact-ratio payment and all-\(m\) branchwise three-halves claim remain outside this adjudication's conclusions. All statements here use the contract's \(P=C+zL^{N+1}\), its **least strict** zero-extended descent \(x\), and, when a row is called eligible, *all* guards \(x+2\le p\), \(3p<2\alpha+1\), \(2p\le\alpha\). The strict flags are evaluated at this \(p\): \(e_0=1[\Delta_pA_0<0]\), \(e_i=1[\Delta_pA_i<0]\). The selected quantities remain \(A=\sum_i r_i e_iT_i[j]\), \(b=e_0+\sum_i r_i e_i\), with original private-tip multiplicities. No coefficient-only result silently supplies these flags or the factor \(1-t+t/\delta\).

## Dispositions at exact scope

| Required claim ID | Disposition and grade | Dependencies and limit |
|---|---|---|
| `E993-PATH-STAR-ARITY-2-4-PROFILE-SENSITIVE-STRICT-DESCENT-RANK` | **retained**, universal informal proof | Coefficientwise differential certificate below. Every strict descent, including terminal and actual first; no selector or payment. No Lean award. |
| `C3-U1-DIFFERENTIAL-IDENTITY` | **retained**, exact algebra | Its earlier nonnegative-\(E\) cone is false at \((a_2,a_3,a_4)=(0,0,2),k=3\); the identity survives. |
| `C3-U1-BOUNDED-RANK-SCAN` | **retained**, exact bounded computation | Copied independent critic evaluator replayed through \(m=45\); cannot establish the universal rank theorem by itself. |
| `C3-CF-U1-COUNT-RELAXED-RANK` | **retained**, universal informal corollary | Depends on the profile-sensitive rank theorem and a fixed-\((m,N)\) maximization of \(h\). |
| `E993-PATH-STAR-ARITY-2-4-OCCUPANCY-JENSEN-COFACTOR` | **retained**, universal informal proof | Finite subset counting, AM–GM, log and Taylor bounds, nonnegative \(GF_r\) convolution. The source's \(k=M\) commentary needs the size-one correction below. |
| `E993-PATH-STAR-COFACTOR-JENSEN-EXPONENT-ADJACENT-ARITY-BALANCING` | **retained**, universal informal proof | Exact rational identity and pair replacement on \(M\ge10,3k\ge M,k\le M\); orders only Jensen exponents. |
| `C3-U2-BALANCED-FINITE-COFACTOR-CERTIFICATE` | **retained**, exact bounded scalar certificate | Depends on occupancy/Taylor and balancing plus shift guards. Checks \(799895\) relaxed states, not actual selectors, descent, MASS or payment. |
| `C3-U3-CENTER-LAYER-EXPANSION` | **retained**, exact informal identity | Nonnegative expansion of each \(B_r\); every finite depth is a lower bound, with no uniform depth asserted. |
| `C3-U3-HOMOGENEOUS-LAYER-BOUND-EVIDENCE` | **rejected as stated**, erroneous finite evaluation | The producer used \(F_4=(1,1,1)\) as a coefficient vector. Its claimed \(m=40,p=80\) depth-2 failure is false. The corrected part is recorded separately. |
| `C3-CF-U3-CORRECTED-LAYER-EVIDENCE` | **retained**, exact bounded computation | Correct \(GF_4=(3,9,7,2)\) on the two homogeneous profiles; no universal local inequality. |

The C3-CT-U3 critique's *corrected displayed margins* are right, but its sentence saying depth 1 fails at \(m=40,p=80\) contradicts its own positive margin. Depth 1 passes both \(m=40\) eligible rows. This does not change the returned source claim's rejection: its stated depth-2 failure is false.

## Rank proof and its limit

Put \(h=2a_2/3+a_3/2\) and \(D_d(f)=(5+4z)f'-4df\). The weighted product rule gives \(D_{d+e}(fg)=D_d(f)g+fD_e(g)\). Direct calculation yields \(D_1(G)=6\) and

\[
D_2(B_2)=7-2z,\quad D_3(B_3)=8-2z+3z^2,\quad
D_4(B_4)=9+12z^2+4z^3.
\]

The local adjusted rows \(D_2(B_2)+(2/3)B_2=(23/3)+(2/3)z^2\), \(D_3(B_3)+(1/2)B_3=(17/2)+(9/2)z^2+(1/2)z^3\), and \(D_4(B_4)\) are coefficientwise nonnegative. Consequently \(D_q(C)+hC\ge0\) coefficientwise for \(q=N+1\). Also \(D_q(zL^q)=(5+4z)L^q+qzL^{q-1}\ge0\). Thus \(D_q(P)+hP\ge0\) coefficientwise for every profile. At any strict descent \(k\), \(P[k]>P[k+1]\ge0\), including terminal zero extension, and its \(k\)-coefficient gives

\[
0\le5(k+1)P[k+1]+(4k-4q+h)P[k]
 <(9k+1-4N+h)P[k].
\]

Therefore \(9k+1-4N+h>0\). Multiplying by six and using integrality gives exactly \(54k\ge24N-4a_2-3a_3-5\). This proves the registered all-profile rank claim informally. At fixed \((m,N)\), \(d=4m-N=2a_2+a_3\) and \(h=d/2-a_2/3\); since \(a_2\ge\max(0,3m-N)\), \(h\le h_{\max}=2m-N/2\) if \(N\ge3m\), and \(h\le m-N/6\) if \(N\le3m\). Replacing \(h\) by this larger number proves the count-relaxed corollary. For eligible \(j=p-2\ge x\), apply only the resulting numerical lower bound on \(j\); the strict current-\(p\) flags are untouched.

U1's different operator \(E=LP'-(N+2)P\) has the exact identity \(E=L^{N+1}-2zQ+G\sum_i(1-(r_i-1)z)H_i\), with \([z^k]E=(k+1)P[k+1]-(N+2-k)P[k]\). Its proposed sign-cone strengthening fails at two arity-4 branches: \(N=8,k=3,P[3]=178,P[4]=298,\Delta_3P=120,[z^3]E=-54\), rank slack \(-25\). This is a *rising* rank, hence no counterexample to the rank theorem. `C3-AU-rank-replay.log` records the copied independent scan: 17295 profiles, 938431 strict-descent rows, minimum slack 44 through \(m=45\). `C3-AU-focused-audit.json` checks the adjusted local coefficients exactly.

## Occupancy, balancing, and finite scalar bridge

For positive-size disjoint blocks \(V_i\) of total size \(M\), expand \(\prod_i(1+X_i(S)/s_i)\) over marked block sets \(I\), with \(X_i(S)=1[|S\cap V_i|=1]\). At fixed \(I\), the number of \(k\)-subsets satisfying all marks is \((\prod_{i\in I}s_i)\binom{M-\sum_{i\in I}s_i}{k-|I|}\). The product of reciprocals cancels the multiplicity, yielding exactly the \(I\)-term of \([z^k]\prod_i(L^{s_i}+z)\). This proves the fixed-size identity, including the empty block family and out-of-range binomial zeros. Finite AM–GM on positive subset weights gives the integer-power inequality

\[
\left(H[k]/\binom Mk\right)^{\binom Mk}\ge
\prod_i(1+1/s_i)^{s_i\binom{M-s_i}{k-1}}.
\]

For \(u\ge0\), the derivative of \(\log(1+u)-2u/(2+u)\) is \(u^2/((1+u)(2+u)^2)\ge0\). Taking logs and using the nonnegative exponential Taylor remainder proves \(H[k]\ge\binom Mk E_d(y_k)\) for every \(0\le k\le M\), where \(y_k=\sum_i\frac{2s_i}{2s_i+1}\frac{\binom{M-s_i}{k-1}}{\binom Mk}\). Zero extension and convolution with \(GF_2=(1,2),GF_3=(2,5,2),GF_4=(3,9,7,2)\) give the cofactor floor. At \(k=M\), singleton probabilities vanish for sizes 2–4 but **not** arbitrary positive sizes: one size-one block has \(M=k=1,H[1]=2,X_1(V)=1,y_k=2/3\). The theorem remains valid.

For \(g_r=\frac{2r}{2r+1}\binom{M-r}{k-1}/\binom Mk\), exact factorial cancellation, \(M\ge10\), \(M/3\le k<M\), and \(v=3k-M\ge0\) give

\[
g_2-2g_3+g_4=\frac{4k(M-k)}{315M(M-1)(M-2)(M-3)}f,
\quad9f=37(M-10)^2+290(M-10)+217+v(125M-585)+70v^2>0.
\]

At \(k=M\), each \(g_r=0\). Replacing a 2/4 pair by two 3s preserves block count and tips and lowers the exponent by \(g_2-2g_3+g_4\). Iterating gives the registered adjacent-arity formulas. This orders the Jensen lower-bound exponent alone. `C3-AU-focused-audit.py` independently checks the exact identity at 7614 in-band pairs; the displayed algebra supplies the universal proof.

For the finite scalar bridge, I inspected the producer's loop and copied a critic's independently written direct-binomial evaluator into this top-level scratch, then executed it with bytecode disabled. The domain is exactly \(70\le m\le119\), \(2m\le N\le4m\), \(r=2,3,4\), \(2(m-1)\le M=N-r\le4(m-1)\), \(5j>2N-1\), \(2j\le N-2\). Every \(GF_r\) shift \(k=j-s\) has \(M\ge136\) and \(3k\ge M\): since \(5j\ge2N\), the worst \(r=4,s=3\) reduces to \(N\ge25\), satisfied here. The program floors each balanced exponent to \(10^{-3}\), evaluates the positive degree-12 Taylor polynomial with exact integers, and strictly checks \(2(j+1)\mathrm{num}>3(N+1-j)(N-2j-1)\mathrm{den}\). All 799895 states pass, none are excluded; all 50 per-\(m\) counts, minima and minimizers agree with the producer JSON. The global least comparison ratio is

\[
112684538106937462073347997540188623037695726373663717/
81619490325542400000000000000000000000000000000000000>1
\]

at \((m,N,r,j)=(70,278,2,112)\). This is a finite certificate conditional on the analytic coefficient/balancing bounds. It does not examine actual deletion flags, and it does not by itself extend to \(m\le69\) or \(m\ge120\).

## Center layers and exact correction

For fixed branch \(i\), expand each \(B_{r_h}=L^{r_h}+z\) in \(H_i\), choosing the \(z\) term on \(J\). Then

\[
T_i[j]=\sum_{J\subseteq[m]\setminus\{i\}}\sum_{\epsilon=0}^1\sum_{s=0}^{r_i-2}
g_\epsilon\binom{N-r_i-\sum_{h\in J}r_h+s}{j-|J|-\epsilon},
\quad(g_0,g_1)=(1,2).
\]

All terms are nonnegative, so restriction to \(|J|\le d\) is an exact lower bound \(U_i^{(d)}[j]\le T_i[j]\). The producer's script instead encoded \(F_4\) as coefficient row \((1,1,1)\), whereas \(F_4=1+L+L^2=(3,3,1)\). Thus its \(GF_4\) and reported \(m=40\) depth threshold are wrong.

An exact corrected witness for this *instrument error* has profile \((a_2,a_3,a_4)=(0,0,40)\), \(n=203,N=160,\alpha=162,x=78,p=80,j=78,\delta=83\); all three rank guards hold, and current-\(p\) strict flags are \(e_0=e_i=1\), with each branch carrying four original tip tags. Here \(D_j=3325930472040984210531608420501465726832040800\), \(T_i[j]=1276384236266955407404589199530667958725386358334\), and \(U_i^{(2)}[j]=775440571492371572584463489650444160238649555370\). The signed integer target margin \(2U_i^{(2)}[j]-3\delta D_j=722724455446538076746556482596023354496120951540>0\), contrary to U3's negative result. Even depth 1 has positive margin \(6152364126501330251950934541782040442847646940\). At \(p=81\), depth 1 and 2 also pass. At homogeneous arity 4 \(m=150\), corrected replay finds \(x=292\), eligible \(p=294,\ldots,301\), both flags strict, depth 1 failing at \(p=294\), and depth 2 passing all eight. Exact coefficients and margins for every row are in `C3-AU-layer-replay.json`. These are lower-bound tests, not a failure of the full local inequality or of the primary payment.

## Replay and remaining obligations

All output artifacts are top-level and intended at `cycles/cycle-3/C3-AU/`. From that directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 C3-AU-rank-replay.py 45 > C3-AU-rank-replay.log
PYTHONDONTWRITEBYTECODE=1 python3 C3-AU-focused-audit.py
PYTHONDONTWRITEBYTECODE=1 python3 C3-AU-scalar-replay.py > C3-AU-scalar-replay.log
PYTHONDONTWRITEBYTECODE=1 python3 C3-AU-layer-replay.py > C3-AU-layer-replay.log
```

`C3-AU-rank-replay.py`, `C3-AU-scalar-replay.py`, and `C3-AU-layer-replay.py` are own-scratch copies of allowed critic scripts, with output paths localized; `C3-AU-focused-audit.py` is independently written. The scalar replay reads the copied immutable producer JSON `C3-AU-scalar-producer.json`. No Lean build was run. A census-free selector/selected-MASS bridge, the remaining local ranges and a governed formal theorem are separate obligations; this adjudication proposes no primary or all-\(m\) status change.
