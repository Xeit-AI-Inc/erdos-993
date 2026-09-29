# C5-CF-T2 independent critique

## Dispositions

- `C5-T2-ACTIVITY-BASIS-NEGATIVE-LAYER`: retain narrowly as a finite obstruction to coefficientwise nonnegativity in the stated center-activity basis. It does not refute the evaluated (t=1) minor, the guarded individual comparison, or an actual-eligible payment.
- `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-INDIVIDUAL-DELETION-LR`: remains open at its all-profile, all-original-deletions scope for every integer (k\ge1) with (2k\le N+2). The guard does not assume actual eligibility.
- `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR`: remains open with (W=\sum_i r_iA_i); each original private-tip deletion retains multiplicity (r_i).
- `E993-PATH-STAR-ARITY-2-4-ULC-EXACT-RATIO-TIP-SURPLUS`: remains open at the stated tip-only guarded scope. The endpoint is not covered, and the exact ratio estimate is not proved by these checks.

## Independent checks

I verified all 237 byte sequences named by `manifests/C5-COMMON-DISPATCH.json` against their SHA-256 entries: no mismatches. All four packet-authorized `cycles/cycle-5/C5-T2/` files likewise match the hashes in `packets/C5-CF-T2.json`. The packet itself is not a common-manifest member and carries no self-hash; its observed SHA-256 is `15a980deac237ea6af8b799b3a317f9a99d0992e939bbb18f6ef0f924096df9c`. The source audit script was copied to this scratch before execution.

`independent_audit.py` rebuilds the polynomials directly in monomial powers of (z), using ([z^k](1+z)^d=\binom dk), zero extension, exact Python integers, and strict `<0` selector checks. It independently recovers the activity polynomial
\[
1{,}898{,}616+171{,}542t+6{,}175t^2-66t^3,
\]
so its (t^3) coefficient is negative, whereas the exact evaluated minor at (t=1) is (2{,}076{,}267>0). The direct (z)-coefficients are (A_7=2420,A_8=1711,C_7=3066,C_6=3123). Thus the layerwise certificate fails, but the target minor has positive sign at this profile. Here (N=12,k=7) is in the registered shifted guard, while the parent first strict descent is (x=7), and actual lower-half eligibility is impossible because (p\ge x+2=9) conflicts with (2p\le N+2=14).

For a distinct actual-eligibility control, the script reconstructs the homogeneous arity-3 profile with 22 branches: (N=66,\alpha=68,n=91). It scans through terminal degree and finds the least strict descent (x=32). At (p=34), all strict selectors are evaluated on that same profile and current (p): (e_0=e_i=1); the exact guards are (x+2=p=34), (3p=102<137=2\alpha+1), and (2p=68\le\alpha). The original selected tag weight is (b=1+22\cdot3=67). At guarded shifted rank (k=27),
\[
M_{27}(E)=E_{27}C_{27}-E_{28}C_{26}=-518620474811633289768751398606375936,
\]
but for each arity-3 tip
\[
M_{27}(A_i)=777419068009671422357461955841645743808>0.
\]
Directly, (M_{27}(U_i)=777937688484483055647230707240252119744), and the exact identity (M_{27}(A_i)=M_{27}(U_i)+M_{27}(E)) holds. This rejects a proof that assigns a nonnegative sign to the (E)-minor separately; it is not a counterexample to the full minor. At actual rank (j=p-2=32), the full tip minor is (4379201511889896286434389991529125770579>0).

As bounded evidence only, direct exact checks cover all 83 guarded ranks across the 19 multisets of arities with (1\le m\le3). Every individual endpoint/tip margin, multiplicity-weighted tip margin, and stated exact-ratio tip-surplus expression is positive in that finite horizon. Further exact boundary and interior rows, including the (m=4), all-arity-4 exact-ratio example at (k=8) with margin `45380234160`, are in `independent_audit.json`. These finite checks imply no universal result.

## Order and implication checks

For the exact-ratio sufficient condition, the denominator in the source reduction is ((k+1)(h-k+1)). In this family (h-N=1+a_3+3a_4\ge1), and the guard gives (k\le(N+2)/2); hence both factors are strictly positive. Dividing by them preserves order. The main-product lower bound plus the stated surplus condition would imply (M_k(U_i)+M_k(E)\ge0), but the surplus condition remains OPEN; no conclusion about the endpoint or the weighted deck follows from it without additional proof. In the negative-(E) control, adding the positive (U_i) minor preserves order by ordinary addition and yields the positive full minor shown above. No negative-factor division or unguarded rank extension is used.

The source's local main-product ratios are consistent with direct (z)-expansion: (B_2=(1,3,1)), (B_3=(1,4,3,1)), (B_4=(1,5,6,4,1)), and (B_{r-1}) has ratios to (B_r) respectively ((1,2/3,0)), ((1,3/4,1/3,0)), and ((1,4/5,1/2,1/4,0)). This supports the local-factor ingredient, not the missing (E)-compensation or a universal deletion comparison. Coefficients above are monomial (z)-coefficients; no list in powers of (L=1+z) was treated as a (z)-coefficient list.

## Replay and limits

From this admitted directory, replay with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 independent_audit.py > independent_audit.json
PYTHONDONTWRITEBYTECODE=1 python3 producer_copy_paired_minor_audit.py
```

The first script is the independent check; the second is the packet-authorized producer script, copied before execution. This critique found no exact guarded counterexample and supplies no universal proof. It does not change selected MASS, payment, aggregate, or broader Erdős 993 status. No Lean build, source edit, installation, external message, or controller action was performed.
