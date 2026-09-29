# C5-T2 search report

## Result

I did not obtain a weight-preserving two-color switching or a universal proof of the guarded individual or weighted shifted comparison. The registered individual comparison, weighted tip-deck comparison, and ULC exact-ratio tip surplus remain open at their stated scopes. No full-target counterexample was found.

The center-activity coefficientwise-positivity route has an exact obstruction. For the ordinary homogeneous profile (r_i=4) for three distinct branches, (N=12), (n=N+m+3=18), choose one original tip branch (i), and put the activity (t) only in the other two factors:

\[
C_t=G B_4(L^4+tz)^2,\qquad
A_{i,t}=G B_3(L^4+tz)^2+E,\qquad E=zL^{12}.
\]

At guarded shifted-comparison rank (k=7), the exact integer minor is

\[
A_{i,t}[7]C_t[7]-A_{i,t}[8]C_t[6]
=1{,}898{,}616+171{,}542t+6{,}175t^2-66t^3.
\]

Thus the coefficient of (t^3) is negative, while the actual (t=1) minor is (2{,}076{,}267>0). The parent (P=C+zL^{13}) has actual first strict descent (x=7). There is no actual eligible lower-half (p): (x+2\le p) requires (p\ge9), while (2p\le\alpha=14) requires (p\le7). This refutes only coefficientwise nonnegativity in this activity basis. It does not refute the guarded comparison or an actual-eligible payment, and is not a counterexample to the registered predicate.

As an actual-eligibility control, for counts ((a_2,a_3,a_4)=(0,22,0)), (N=66), (n=91), exact coefficient arithmetic gives the first strict descent (x=32). At (p=34), the guards (x+2\le p), (3p<2\alpha+1), and (2p\le\alpha) all hold; the current-(p) strict selectors are (e_0=e_i=1) for each of the 22 arity-3 branches, so the original multiplicity weight is (b=1+22\cdot3=67). At the guarded shifted rank (k=27), the isolated common-binomial minor is

\[
E[27]C[27]-E[28]C[26]=-518620474811633289768751398606375936,
\]

but the full original tip-deletion minor is (777419068009671422357461153834912453824>0). At the actual rank (j=p-2=32), the full tip-deletion minor is (4379201511889896286434389991529125770579>0). The negative (E)-only term therefore cannot be assigned a sign alone; neither full positive value proves a universal comparison.

These exact computations reproduce the shared mechanism controls independently. They supply no universal compensation bound and no census-free argument. The cited symmetric-function lead is not imported: its one-branching-vertex spider result does not directly cover path-stars with multiple distinct centers, and no matching injection preserving the marked original tip and rank was constructed.

## Audit and replay

All 237 member byte sequences in `manifests/C5-COMMON-DISPATCH.json` match their listed SHA-256 digests. `packets/C5-T2.json` has no hash field, is not a manifest member, and lists zero additional sources; its observed SHA-256 is `944a4d0abb887f2566bba6463b671728e98c5210d5db9c6bc0f5831d19a9f259`. No producer instrument was executed or copied; the finite checks below were written independently in this scratch directory.

From the eventual admitted directory, replay with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 paired_minor_audit.py
```

The deterministic output is retained in `paired_minor_audit.json`. Arithmetic uses Python integers and zero-extended coefficient lookup. The script computes the activity-variable minor directly from bivariate coefficient arrays, builds the parent/deletion polynomials from the stated path-star formulas, and finds the first strict descent by scanning through the terminal degree. It retains the original tip multiplicity in (b).

## Scope limits

This search yields bounded exact mechanism evidence only. It neither establishes nor changes the status of selected MASS, the exact-ratio selected payment, the all-(m) primary, or any broader Erdős 993 statement. No Lean build, source edit, installation, or controller operation was performed.
