# C5-CF-U2 critique report

## Disposition

Retain `C5-U2-ACTIVITY-LAYER-COEFFICIENTWISE-OBSTRUCTION` at its exact scope: the indicated coefficient in the distinguished-tip activity minor is negative for every homogeneous arity-4 profile with (m\ge3), at a rank satisfying the stated guarded band. This invalidates a proof that requires every activity-layer coefficient to be nonnegative. It does **not** refute the full shifted minor at (t=1), either registered selected-payment predicate, or a first-descent payment conclusion.

## Independent algebra check

Write (L=1+z), (G=1+2z), (B_3=L^3+z), (B_4=L^4+z), and let (t) mark the (z)-choice in just the (m-1) unmarked factors. At activity degree (a), the distinguished deletion's non-(E) part has layer

\[
\binom{m-1}{a} z^a G B_3 L^{4(m-1-a)},
\]

and the parent-product layer is

\[
\binom{m-1}{a} z^a G B_4 L^{4(m-1-a)}.
\]

Set (d=2m-3), (k=m+4). Since each polynomial has activity degree at most (m-1), the only layer splits in the product minor are ((a,b)=(m-2,m-1),(m-1,m-2)). The (E=zL^{4m}) term has activity degree zero; its products with the parent layers have degree at most (m-1<2m-3), so it contributes zero to this coefficient.

For the positive product (A_{i,t}[k]C_t[k]), the two splits give, after factoring (m-1),
\[
[z^6](GB_3L^4)[z^5](GB_4)+[z^5](GB_3)[z^6](GB_4L^4).
\]
For the subtracted product (A_{i,t}[k+1]C_t[k-1]), they give
\[
[z^7](GB_3L^4)[z^4](GB_4)+[z^6](GB_3)[z^5](GB_4L^4).
\]
Direct monomial expansion in (z) gives the eight coefficients (51,2,0,142,15,9,0,205), respectively. Thus the signed local combination is
\[
51\cdot2+0\cdot142-15\cdot9-0\cdot205=-33,
\]
and the full activity coefficient equals (-33(m-1)<0), since (m-1>0). This establishes the direction after substitution; no division by a potentially signed factor is used.

The rank guards hold for all (m\ge3): (k=m+4\ge1) and (2k=2m+8\le4m+2=N+2), with equality at (m=3) and strict inequality for (m>3). Independent exact layer enumeration checks (m=3,4,8,20), giving margins (-66,-99,-231,-627); the closed algebra proves all (m\ge3), not only these samples.

At the boundary (m=3), direct monomial computation gives the full (t=1) shifted minor (2{,}076{,}267>0). The actual parent is (P=G B_4^3+zL^{13}), whose least strict descent is (x=7). Eligibility would require (p\ge x+2=9) and (2p\le N+2=14), impossible. Thus this case checks the scope boundary and supplies no actual-eligible payment counterexample. The positive full minor alongside a negative layer coefficient demonstrates cancellation at (t=1).

The polynomial expansions above use monomial coefficients in (z); in particular (L^4=(1,4,6,4,1)). No (L)-basis coefficient list is substituted for a (z)-basis list.

## Replay and provenance

From this scratch directory, run:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_check.py
PYTHONDONTWRITEBYTECODE=1 python3 source/layer_replay.py
PYTHONDONTWRITEBYTECODE=1 python3 source/dispatch_audit.py
```

`independent_check.py` uses a separate coefficient-vector implementation and writes `independent_check.json`; the copied producer replay writes `source/layer_replay.json`. SHA-256 verification found all 237 common-dispatch members present and matching `manifests/C5-COMMON-DISPATCH.json`; all six packet-listed source files match their packet hashes. The targeted registered-identity lookup found no entry for this exact worker claim ID. This review relies on the supplied C5-U2 report and replay plus its own exact arithmetic; it makes no universal claim beyond the closed layer formula above.

## Limitations

- The negative coefficient rules out termwise positivity in this activity basis only. Other cancellation or pairing arguments may establish the (t=1) comparison.
- No actual-eligible payment witness, primary counterexample, universal selected-payment proof, or Lean result is obtained.
- No census expansion is undertaken.
