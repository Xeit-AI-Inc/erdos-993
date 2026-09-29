# C5-U2 search report

## Finding: activity-layer coefficientwise positivity fails at every size

For a homogeneous arity-4 profile with (m\ge3), distinguish one tip branch and insert a formal activity (t) only into the other (m-1) factors, replacing each (B_4=L^4+z) by (L^4+t z). Keep the distinguished deletion (A_i=G B_3(L^4+t z)^{m-1}+E), where (E=zL^{4m}), and parent product (C_t=G B_4(L^4+t z)^{m-1}). At the guarded rank (k=m+4), the coefficient of (t^{2m-3}) in

\[
  A_{i,t}[k]C_t[k]-A_{i,t}[k+1]C_t[k-1]
\]
is exactly (-33(m-1)<0). The guard (1\le k), (2k\le N+2) holds since (N=4m) and (2m+8\le4m+2) for (m\ge3).

Proof: (E) has activity degree zero, while (2m-3>m-1=\deg_t C_t), so it contributes nothing to this coefficient. The only activity-degree splits are ((m-2,m-1)) and ((m-1,m-2)). Their branch-layer polynomials are respectively ((m-1)z^{m-2}GB_3L^4,z^{m-1}GB_4) and (z^{m-1}GB_3,(m-1)z^{m-2}GB_4L^4). After extracting the common factor (m-1), the required local coefficient combination is

\[
 [z^6](GB_3L^4)[z^5](GB_4)+[z^5](GB_3)[z^6](GB_4L^4)
 -[z^7](GB_3L^4)[z^4](GB_4)-[z^6](GB_3)[z^5](GB_4L^4)
=51\cdot2+0\cdot142-15\cdot9-0\cdot205=-33.
\]

Thus nonnegativity of every activity-layer coefficient cannot prove the guarded (t=1) shifted comparison, at any profile size. This does not refute the comparison: at (m=3,N=12,n=18,k=7), the actual full (t=1) minor is (2{,}076{,}267>0), despite the (t^3) coefficient (-66). Direct expansion gives actual first strict parent descent (x=7); no actual eligible lower-half (p) exists because eligibility requires (p\ge9) and (2p\le14). Therefore this is a guarded shifted-comparison mechanism obstruction, not an actual-eligible payment witness. The individual and weighted shifted comparisons, and the ULC exact-ratio surplus condition, remain unresolved by this search.

The proof above is exact algebra; `layer_replay.py` independently constructs the activity layers and direct full (t=1) polynomials with integer arithmetic. Its deterministic checks for (3\le m\le20) agree with the closed formula. Run from this directory with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 layer_replay.py
PYTHONDONTWRITEBYTECODE=1 python3 dispatch_audit.py
```

The dispatch audit checked all 237 members of `manifests/C5-COMMON-DISPATCH.json`: no missing member and no SHA-256 mismatch. `packets/C5-U2.json` has an empty `allowed_source_files` list and no separate hash list. The source review used the shared neutral predecessor proofs and the admitted C5 center-layer, obstruction-control, and claim-identity materials; no producer script was executed.

## Claim disposition proposed by this worker

- `C5-U2-ACTIVITY-LAYER-COEFFICIENTWISE-OBSTRUCTION`: the universal coefficientwise nonnegativity mechanism is rejected at its exact stated scope by the all-(m\ge3) formula. The registered guarded (t=1) shifted deletion comparison is not refuted. Evidence grade: exact algebra with deterministic integer replay; nonformal.

## Limitations

- No adaptive window, omitted-tail estimate, or positive paired-layer certificate was obtained.
- The demonstrated negative coefficient rules out only termwise nonnegativity in this activity basis; cancellation at (t=1) remains possible.
- The (m=3) example is not actual-eligibility data. It gives no full-payment or primary counterexample.
- No census or universal result for the registered individual/weighted comparisons or the ULC surplus condition is claimed.
