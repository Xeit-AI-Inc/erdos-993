# C6-AF neutral adjudication

All 275 actual shared-member byte hashes match `manifests/C6-COMMON-DISPATCH.json`; all 55 packet-authorized member hashes match `packets/C6-AF.json`. I inspected exactly C6-F1/F2/F3 and CT/CU critics for each, plus neutral shared sources and targeted registered identities. No current finite-prefix implementation, sibling scratch, private proposal, Lean build, or broad surplus census was used. My independent exact replay is `PYTHONDONTWRITEBYTECODE=1 python3 cycles/cycle-6/C6-AF/C6-AF-audit.py`; it writes `cycles/cycle-6/C6-AF/C6-AF-audit.json`. The script is original to this seat and imports no producer program.

## Dispositions and evidence grades

| Required ID | Disposition at exact scope | Grade and dependency |
|---|---|---|
| `C6-F2-PREFIX-COVERAGE-CLOSED-FORM` | Retained. The 1..99 profile and represented-type/rank counts are correct. | Exact combinatorial proof and independent integer enumeration; **coverage only**, no tested signs. |
| `C6-F2-KRONECKER-NO-CARRY-BOUND` | Retained with an explicit repair of the displayed strictness argument. | Universal elementary coefficient-sum bound; no executed prefix certificate. |
| `C6-F2-PREFIX-TELEMETRY-FORMAT-CONFLICT` | Retained narrowed to a format ambiguity concerning absolute timestamps and the status of transport receipts. | Governance observation, no mathematical grade; elapsed durations and absolute UTC timestamps must be distinguished. |
| `C6-F3-ULC-EXACT-RATIO-SURPLUS-TAIL` | Retained for **every** profile with `m>=100`, every represented original tip, and every `1<=k`, `2k<=N+2`, strictly. | Informal universal argument using the formally verified full finite-block Jensen theorem, established order-`h` ULC of `C`, and exact ratio-floor algebra. The family composition is not formalized. |
| `C6-F3-ENDPOINT-BRIDGE-TAIL` | Retained conditionally for `m>=100` on the same full guard. | Informal exact algebra plus separate main-product LR and order-`h` ULC; coefficient dominance alone is insufficient. |
| `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS` | Retained narrowed as evidence: the strict `m>=100` tail and a new all-`m` low band are supported. The **registered all-`m` predicate remains unresolved** because the complementary `m<=99` band has no complete certificate here. | Informal universal partial proofs, not an all-`m` computer-assisted certificate or Lean award. |
| `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR` | Retained narrowed to the `m>=100` tip **and endpoint** consequences; registered all-`m` predicate remains unresolved. | Conditional informal consequence of tail surplus, main-product LR, and order-`h` ULC. |
| `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR` | Retained narrowed to `m>=100`; registered all-`m` predicate remains unresolved. | Sum the same-`C` tip minors with the original positive `r_i` multiplicities. An aggregate sign does not imply each branch sign. |

### Analytic tail: independent sign audit

Put `L=1+z`, `G=1+2z=B_1`, `B_r=L^r+z`, `Q=prod_i B_(r_i)`, `C=GQ`, `E=zL^N`, `U_i=G B_(r_i-1)H_i`, and `h=1+2a_2+4a_3+7a_4`. Coefficients below are monomial `z` coefficients, zero-extended. The exact surplus is

`S_i(k)=(h+1)U_i[k]C[k]+(k+1)(h-k+1)(E[k]C[k]-E[k+1]C[k-1])`.

For `4k<=N+1`, expand `Q=sum_S z^s L^(N-R)`, where `s=|S|` and `R<=4s`. On common positive adjacent support, the normalized comparison at ranks `k-1,k` has sign `s(N+1)-kR>=0`. This sign comes from cross multiplication by **positive** binomial coefficients; division by them preserves order. New support at `k` adds a nonnegative term. Disappearance at `k` would give `N-R=k-1-s`, `s<=k-1`, hence `N<=4k-4`, contradicting `N>=4k-1`. Thus `Q[k]/binom(N,k)` is nondecreasing on this band. Writing `c_t=binom(N,t)`, the exact `E` minor is

`c_(k-1)Q[k]-c_k Q[k-1]+2(c_(k-1)Q[k-1]-c_k Q[k-2])>=0`.

The second bracket uses the comparison one rank earlier and `c_(k-1)^2>=c_k c_(k-2)`; at `k=1`, `Q[-1]=0`. Since `U_i[k]C[k]>0` and `h-k+1>0` under the registered guard, **the low band is strictly positive for every `m>=1`**, without Jensen or a finite scan. This is a useful additional partial theorem; it does not remove any rows from the frozen prefix protocol.

For the complement `4k>N+1`, `m>=100` implies `N>=200`. An unmarked block of arity `r` contributes exactly

`g_r=(2r/(2r+1))*binom(N-r,k-1)/binom(N,k)`

to the full finite-block Jensen exponent. The denominator is positive here. Direct cancellation gives `g_3/g_2=(15/14)(N-k-1)/(N-2)<=1` iff `N+13<=15k`, and `g_4/g_3=(28/27)(N-k-2)/(N-3)<=1` iff `N+25<=28k`; positive denominators preserve these comparisons. Both follow from `k>N/4`, `N>=200`. Also `g_4(k+1)/g_4(k)=(k+1)(N-k-3)/(k(N-k))<=1` iff `4k>=N-3`, so the minimum is at `K=floor((N+2)/2)`. For even `N=2s`, `g_4(N,K)>=1/20` clears to `4s^2(s-22)+13s+240>=0`; for odd `N=2s+1`, it clears to `4s^2-40s-71>=0`. Every cleared denominator is positive for `s>=100`; both numerators are positive there. The exact boundary values are `g_4(200,101)=480053/8820675` and `g_4(201,101)=19796/359991`, both above `1/20`. My script tests these boundaries and first/interior/midpoint ranks for `N=200,201,290,400`; the polynomial inequalities, not those samples, establish all `N`.

The factors of `U_i` have positive sizes `1,r_i-1,(r_l)_(l!=i)` summing to `N`; the marked size-one case is literally `B_1=G`. Each `B_a` exceeds its binomial coefficient floor only by one at rank one. The formal full Jensen theorem therefore applies **at coefficient rank `k` and total size `N`**, with each of the `m-1` unmarked contributions at least `1/20` and the other contributions nonnegative:

`U_i[k]>=binom(N,k) exp((m-1)/20)>binom(N,k)(m+2)`.

The strict bound follows from `a=99/20`, `t=(m-100)/20>=0`, and `exp(a+t)>=E_8(a+t)>=E_8(a)+tE_7(a)>102+20t=m+2`. Exact rationals are `E_8(a)=2162945642595007/16384000000000>102` and `E_7(a)=88220922596671/716800000000>20`; the nonnegative Taylor expansion justifies the middle direction at both `t=0` and interior `t>0`.

Independent expansion gives `B_1=(1,2)`, `B_2=(1,3,1)`, `B_3=(1,4,3,1)`, `B_4=(1,5,6,4,1)` in powers of `z`. They are **not** coefficient lists in powers of `L`. For `D_d(F)=(3+2z)F'-2dF`, the nonzero monomial lists for those four blocks are `(4)`, `(5)`, `(6,2,3)`, `(7,6,12,4)`. The product rule with nonnegative factors gives `D_(N+1)(C)>=0`, whose rank-`k-1` coefficient is `3kC[k]-2(N+2-k)C[k-1]>=0`. As `C[k-1],C[k],k>0`, taking the reciprocal of `C[k]/C[k-1]>=2(N+2-k)/(3k)` **reverses** the inequality; multiplication by positive `b=(N+1-k)/k` preserves it; subtraction from one reverses it again. With `e=binom(N,k-1)>0`, this yields

`M_k(E)/(eC[k])>=1-3(N+1-k)/(2(N+2-k))>-1/2`.

The last strict step is equivalent to `2k<N+3`, true at the exact upper boundary `2k=N+2` and in the interior. Put `lambda=(h+1)/((k+1)(h-k+1))`. Because `h>=N+1`, all its factors are positive; `lambda>1/(k+1)>=2/(N+4)` and `binom(N,k)/e=b>=N/(N+2)`. Hence

`lambda U_i[k]/e>2N(m+2)/((N+4)(N+2))>1/2`.

The final sign is certified after **positive** denominator clearing: `4N(m+2)-(N+4)(N+2)=4Nm-N^2+2N-8>=2N-8>0`, using `N<=4m` and `N>=200`. It follows that `lambda U_i[k]C[k]+M_k(E)>0`; multiplying by positive `(k+1)(h-k+1)` recovers `S_i(k)>0`. Multiplication by a negative factor would reverse order and is never used. This is a universal *informal composition* of the formal Jensen theorem with elementary family algebra, not a formal theorem for this path-star predicate.

### Endpoint and weighted consequences

With `U_0=LQ`, direct expansion gives `U_0-U_i=z^2(L^(r_i-1)-1)H_i>=0` coefficientwise. Thus replacing `U_i[k]` by `U_0[k]` preserves the strict surplus since `(h+1)C[k]>0`. This coefficient dominance does **not** imply the shifted endpoint minor. Independently, the local ratios `L/G=(1,1/2,0)` and `B_(r-1)/B_r=(1,2/3,0)`, `(1,3/4,1/3,0)`, `(1,4/5,1/2,1/4,0)` decrease. Their common cofactors `Q` and `GH_i` have positive interval support and log-concave coefficients, so the finite cross-product convolution lemma gives `U_v[k+1]C[k]<=U_v[k]C[k+1]` for endpoint and tips, including support boundaries. The established order-`h` ULC inequality of `C` gives

`C[k]^2-C[k-1]C[k+1]>=lambda C[k]^2`,

so, multiplying LR by the **positive** `C[k-1]/C[k]`, `M_k(U_v)>=lambda U_v[k]C[k]`. Adding the common `M_k(E)` and the strict surplus gives `A_v[k]C[k]-A_v[k+1]C[k-1]>0` for `m>=100` on the whole guard. Summing tip minors with original positive weights `r_i` and the **same** `C` gives the weighted deck inequality. Neither an aggregate bound nor coefficient dominance alone yields each branch comparison; the argument uses each branch's tail surplus and separate LR. The endpoint is the original vertex 2 tag; tips retain their original multiplicities, never recomputed after deletion.

For actual payment application only, retain `P=C+zL^(N+1)`, `x=min{k>=0:Delta_k P<0}` including terminal zero extension and ignoring plateaus, `x+2<=p`, `3p<2(N+2)+1`, `2p<=N+2`, `j=p-2`, `delta=N+1-j`, and strict flags at **this** `p`: `e_0=1[Delta_p A_0<0]`, `e_i=1[Delta_p A_i<0]`. The selected mass is `A=sum_i r_i e_i T_i[j]` and `b=e_0+sum_i r_i e_i`. None of the guarded surplus or LR arguments silently changes this selector, asserts a first descent, or derives the all-`m` exact payment from a tail. The primary payment and MASS retain their separately recorded computer-assisted status; this adjudication supplies no new all-profile formal award.

### Prefix, radix, and critical repairs

At fixed `m`, a profile contributes `s floor((N+2)/2)` rows, where `s` is the number of represented arities. `S_m=sum s=3 binom(m+1,2)`, `sum sN=3mS_m`, and `O_m=sum_(a3 odd)s` equals `3u^2+u` for `m=2u`, `(u+1)(3u+1)` for `m=2u+1`. Thus `rows_m=((3m+2)S_m-O_m)/2`; direct per-profile enumeration for all 99 layers agrees and totals **171699 profiles, 56245000 rows** (109175 through m20). One row per represented arity is correct because equal-arity marked polynomials coincide; original multiplicities reappear in the weighted bridge. This proves **no** surplus sign, full base certificate, or two-instrument completion.

For nonnegative arrays, `||B_r||_1=2^r+1<2^(r+1)`. Hence `||Q||_1<2^(N+m)`, `||C||_1<3*2^(N+m)<2^(N+m+2)`, and `||E||_1=2^N<2^(N+m+2)`. For `U_i`, the marked factor has the **strict** bound `||B_(r_i-1)||_1=2^(r_i-1)+1<2^r_i` for every `r_i>=2`; the unmarked product has `||H_i||_1<=2^(N-r_i+m-1)`, with equality possible for the empty product at `m=1`. Therefore `||U_i||_1<3*2^(N+m-1)<2^(N+m+1)`. Every nonnegative coefficient lies below radix `2^(N+m+2)`, so complete digit extraction after evaluating **positive** polynomials at that radix is carry-free. Signed surplus arithmetic must occur after extraction.

The F2 source's displayed strict `U_i` bound is **true**, but its immediate explanation used a weak marked-factor bound and implicitly a strict cofactor bound, leaving `m=1` unjustified. Reject that displayed *argument* as a proof at the empty cofactor; the strict marked-factor bound above repairs it. CT-F2 correctly noticed the empty-cofactor issue, but its “strictness error” wording should be read as a gap in justification, not a counterexample to the inequality. CU-F2 supplied the strict marked-factor repair. This is an implementation lemma, not a positive prefix outcome.

The F2 timing observation has no mathematical consequence. Per-`m` elapsed duration is distinct from the runner's absolute `started_at_utc`; whether an absolute timestamp in a transport receipt violates the general artifact ban depends on that receipt's governed status. CT-F2's proposed specific-over-general reading is plausible but cannot itself grant governance; CU-F2's narrower wording is safer. This adjudication contains no clock field.

### Cross-critic decisions and obstruction controls

- CT-F1 and CU-F1: retain their restricted tail audit, including low-band support, exact Jensen size-one specialization, reciprocal direction, and no all-`m` promotion. No distinct new mathematical claim was introduced.
- CT-F2: retain coverage and its diagnosis of a strictness **proof gap** at the empty cofactor; the strict inequality itself holds by the repaired marked-factor bound. Retain its format point only as ambiguity. CU-F2: retain its strict-factor repair and coverage; narrow its timestamp concern to absolute receipt fields, not elapsed duration by default.
- CT-F3 and CU-F3: retain the `m>=100` tail, conditional endpoint bridge, and tail-only individual/weighted consequences. **Reject CU-F3 RETURN's literal all-`m` surplus statement as written**: it prints `U_i=G B_(r_i-1) product_(ell!=i) B_(r_i)`, repeating the marked arity in every unmarked factor. On the mixed profile `(a2,a3,a4)=(1,0,1)` with marked `r_i=2`, the correct `U_i[1]` is `9`, while that printed polynomial has coefficient `7`. CU-F3's REPORT and tail claim use the correct `H_i=product_(ell!=i)B_(r_ell)`; retain those corrected arguments, not the malformed RETURN formula. Their finite profile replays are corroboration, not universal proofs. The all-`m` registered identities remain unresolved here.

Independent direct convolution gives the known `N=66,(a2,a3,a4)=(0,22,0),k=27` E-only minor `-518620474811633289768751398606375936` but full tip minor `+777419068009671422357461955841645743808`; the negative **summand** is not a target counterexample. For `(38,0,1),N=80,k=77`, the full tip minor is `-49239834336`, but `154>82`, outside the registered guard. For all-arity-4 `m=3,k=7`, the activity coefficient is `-66` while the full tip minor is `+2076267` and original weighted tip minor `+24915204`; an activity layer is not the full minor. The exact `m=1,r=2,k=1` surplus is `98` and its upper guarded `k=2` surplus is `166`. My extra `m=100` boundary/interior profile checks are finite only. No known control refutes the guarded full predicate.

## Remaining obligations

The full `m=1..99` exact surplus base requires completed independent frozen instruments with all represented types and all guarded ranks, exact minima/witnesses, controls, and no coverage gaps. A successful complete base joined to this tail could support the all-`m` auxiliary at computer-assisted/nonformal grade after review; it would still need the separate main-product LR/ULC bridge for individual and weighted claims and would not be a governed formal award. A tail-only Lean theorem cannot settle an all-`m` key. No conclusion here changes arbitrary-tree Erdős 993.
