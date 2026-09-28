# C3-CF-U1 critique report

## Scope and source validation

I reviewed all three packet claims and the registered `E993-PATH-STAR-ARITY-2-4-PROFILE-SENSITIVE-STRICT-DESCENT-RANK` predicate. The packet's four additional case files match their pinned hashes. Independent replay of the common dispatch and both clarification transport manifests checks 86, 3, and 3 members respectively; every byte hash matches. This includes the shared-source clarification and critique reconciliation, plus the v3/v4 runners. `transport_evidence.json` records the result. The clarifications authorize relevant shared `sources/cycle3` inputs; no sibling case or scratch data was read.

Replay both independent artifacts from this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 verify_transport.py
PYTHONDONTWRITEBYTECODE=1 python3 independent_audit.py
```

Neither producer script was executed. `independent_audit.py` independently constructs the polynomials using integer convolution and checks the bounded scan and the focused operator calculations.

## Claim dispositions

1. **`E993-PATH-STAR-ARITY-2-4-PROFILE-SENSITIVE-STRICT-DESCENT-RANK` — proposed retained, informal universal proof.** The profile-weighted differential certificate in `sources/cycle3/C3-profile-sensitive-rank-candidate.md` is valid. Here is the full coefficient argument. Put `L=1+z`, `G=1+2z`, `B_r=L^r+z`, `Q=product_i B_(r_i)`, `C=GQ`, `q=N+1`, and `h=(2/3)a2+(1/2)a3`. For `D_d(f)=(5+4z)f'-4df`, the product rule gives `D_q(C)=D_1(G)Q+G sum_i D_(r_i)(B_(r_i))H_i`. Direct calculation gives `D_1(G)=6` and
   `D_2(B_2)=7-2z`, `D_3(B_3)=8-2z+3z^2`, `D_4(B_4)=9+12z^2+4z^3`.
   Split `hC` into `G sum_i h_(r_i) B_(r_i) H_i`, with `h_2=2/3`, `h_3=1/2`, `h_4=0`. The adjusted local factors are respectively `23/3+(2/3)z^2`, `17/2+(9/2)z^2+(1/2)z^3`, and `9+12z^2+4z^3`, all coefficientwise nonnegative. Also
   `D_q(zL^q)=(5+4z)L^q+qzL^(q-1)` is coefficientwise nonnegative. Thus `D_q(P)+hP` has nonnegative coefficients.

   Its coefficient at `k` is `5(k+1)P[k+1]+(4k-4q+h)P[k]`. At every strict descent `Delta_k P<0`, nonnegative coefficients of `P` imply `P[k]>0`, and `P[k+1]<P[k]`. Therefore this coefficient is strictly less than `(9k+1-4N+h)P[k]`; since it is nonnegative, `9k+1-4N+h>0`. Multiplication by 6 and integrality give `54k>=24N-4a2-3a3-5`. This holds for every strict descent, including the actual least strict descent `x` and any terminal zero-extended descent. It is an informal all-profile proof, not a Lean result.

   Maximizing `h=d/2-a2/3`, where `d=4m-N=2a2+a3`, over count profiles at fixed `(m,N)` uses `a2>=max(0,3m-N)`. This yields `h<=2m-N/2` when `N>=3m` and `h<=m-N/6` when `N<=3m`; substituting `hmax` gives the registered relaxed corollary. For an eligible lower-half rank, the actual first descent remains `x`; `x+2<=p` gives `j=p-2>=x`. The guards `3p<2alpha+1` and `2p<=alpha`, the current-p strict selectors, and original tag multiplicities remain separate and are not established or altered by this rank proof. No selector, MASS, or payment conclusion follows here.

2. **`C3-U1-DIFFERENTIAL-IDENTITY` — proposed retained.** For the older operator `E=LP'-(N+2)P`, the identity in U1's report follows from `LB_r'-rB_r=1-(r-1)z`, `LG'-G=1`, and `L(zL^q)'-(q+1)zL^q=L^q`. The coefficient formula is `[z^k]E=(k+1)P[k+1]-(N+2-k)P[k]`, with zero extension. The identity is sound, but the stronger condition `[z^k]E>=0` at every rank forbidden by the proposed rank bound is false. At `(a2,a3,a4)=(0,0,2)`, `N=8`, `k=3`, exact coefficients are `P[3]=178`, `P[4]=298`, so `Delta_3 P=120>0`, while `[z^3]E=-54` and the target rank slack is `-25`. This is not a counterexample: `k=3` is not a strict descent. The obstruction only rejects that sufficient cone route. The profile-weighted certificate above avoids this issue by bounding `D_q(P)+hP` directly.

3. **`C3-U1-BOUNDED-RANK-SCAN` — proposed retained as bounded evidence.** The independent exact scan covers every count triple with `1<=m<=45` and every zero-extended strict descent: 17,295 profiles, 938,431 descent rows, no violations, minimum slack 44 at `(a2,a3,a4)=(0,1,0)`, `N=3`, `k=2`, `Delta_kP=-2`. This is corroboration only; the universal conclusion above rests on the coefficient proof, not a finite scan.

## Limitations

No selector or compensation predicate was reviewed as a mathematical consequence of this rank claim. No graph deletion polynomial was independently built; the universal rank proof is for the exact parent-polynomial family stated in the registered identity, whose coefficients are the contract's integer zero-extended coefficients. No Lean build or award is claimed. The register's pre-critique status was OPEN; this report supplies a proposed informal proof disposition only.
