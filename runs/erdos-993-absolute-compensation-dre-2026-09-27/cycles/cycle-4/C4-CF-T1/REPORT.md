# C4-CF-T1 critique

## Integrity and scope

All 174 members in manifests/C4-COMMON-DISPATCH.json and all four packet members matched their SHA-256 hashes. The packet authorizes only C4-T1 as case input. The targeted registry lookup confirms the individual and weighted-deck guarded claims are OPEN, while the retained all-rank shifted comparison is REFUTED at a different, unguarded scope. That witness is not a guarded counterexample.

I independently rebuilt coefficient products with exact integer convolution, derived each sampled parent's first strict descent, evaluated original current-p selectors, and replayed the retained literal tree and deleted-tip polynomials by tree dynamic programming. Replay from the run root: PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-4/C4-CF-T1/critique_replay.py > cycles/cycle-4/C4-CF-T1/critique_replay.json.

## Guarded individual and weighted-deck comparisons

Both universal statements remain OPEN. I found no guarded failure, but the six profiles are bounded diagnostics only. Exact replay checks every guarded k for every represented deletion and the weighted tip deck: counts (0,22,0), (0,0,39), (0,12,10), (1,1,30), (100,1,1), and (38,0,1), respectively 34, 79, 39, 63, 104, and 41 guarded ranks. There were no negative margins. The first four profiles have actual eligible p sets {34}, {78,79}, {39}, {63}. At those actual ranks, the replay computes strict selectors at current p for A0 and each distinct branch polynomial; all tips, counted with their original r_i multiplicities, and the endpoint are selected. The last two profiles have no eligible p.

For an exact boundary/interior sign check in profile (0,22,0), use M_k(A)=A[k]C[k]-A[k+1]C[k-1]. For endpoint A0, one arity-3 tip deletion, and W=sum_i r_i A_i, respectively, M_1 is 4184, 4184, 276144; M_17 is 523101391479043630993788192575409, 533526956487772820390719995323142, 35212779128193006145787519691327372; and M_34 is 3415643385409841308648469925255391780928, 3519646978509896300712980023674737675664, 232296700581653155847056681562532686593824. These are finite checks only.

The individual comparison implies the weighted one: multiply each branch inequality by its positive original multiplicity r_i and sum over distinct branches. This preserves order. The converse does not follow. A direct weighted inequality can imply at least one strict tip selector at eligible p by the bridge below; it does not select the endpoint or all tips.

## Exact strict-selector bridge

Let rho_k=C[k]/C[k-1]. Accepted log-concavity of C makes rho_k nonincreasing. At the actual first strict descent x of P=C+zL^(N+1), the binomial summand is rising, so Delta_x P<0 implies Delta_x C<0 and rho_(x+1)<1. This uses the actual least x and assumes no no-recovery property of P. For eligible p, p>=x+2, so 0<rho_p<=rho_(x+1)<1.

If A_v[p+1]C[p-1] <= A_v[p]C[p], divide by positive C[p-1] to get A_v[p+1] <= A_v[p]rho_p. Path-star formulas give A_v[p]>0 throughout eligibility: p<=floor((N+2)/2)<=N+1, inside each deletion polynomial's positive interval. Multiplication by positive A_v[p] and rho_p<1 yields A_v[p+1]<A_v[p], exactly the strict current-p selector. No negative factor is used; division and multiplication preserve inequality direction. Thus a universal individual comparison selects every original deletion. For W=sum_i r_i A_i, its shifted comparison gives W[p+1]<W[p]; since every r_i>0, not all Delta_p A_i can be nonnegative, so at least one distinct tip branch is strictly selected. This is a valid conditional bridge, not a proof of either universal comparison or a payment predicate.

At sampled (0,22,0), N=66, actual x=32, p=34, the ratio is C[34]/C[33]=274888731183684563008/295365112846734182630<1. Direct selector differences are negative for A0 and all 22 arity-3 branch deletions; their original tip multiplicity is 22*3=66.

## Binomial-term obstruction and all-rank control

For (a2,a3,a4)=(0,22,0), let E=zL^N, N=66. At interior guarded k=27, E[27]=1654284096099796392, E[28]=2450791253481179840, C[27]=116461439672085416832, C[26]=78823085262292775712, and

    E[27]C[27]-E[28]C[26] = -518620474811633289768751398606375936.

The sign is negative where the proposed margin must be nonnegative. This rules out proving the whole deletion comparison by proving this component's margin nonnegative separately. It does not refute the full deletion polynomial: the main summand may compensate, and the complete polynomial passes this row.

The retained unguarded control (38,0,1) has n=122, N=80, alpha=82, actual x=41, k=77, signed margin -49239834336. Here 2k=154>N+2=82, so it is not a guarded counterexample. Independent tree dynamic programming confirms the parent and original-tip-deletion polynomials match the path-star formulas; parent degree is 82 and first strict descent is 41. It refutes only the unguarded claim.

## Dispositions and limits

The individual and weighted guarded comparisons remain OPEN: evidence is exact but bounded, and no universal proof or in-scope counterexample was found. The binomial component failure is retained at its narrow componentwise scope. The strict-selector bridge is retained with the positive-support, log-concavity, and actual-first-descent dependencies above. Neither route changes current-p selectors, original tip multiplicities, selected MASS/payment status, or the primary formal stop. No Lean build or broad census expansion was performed.

Own evidence: cycles/cycle-4/C4-CF-T1/critique_replay.py and cycles/cycle-4/C4-CF-T1/critique_replay.json.
