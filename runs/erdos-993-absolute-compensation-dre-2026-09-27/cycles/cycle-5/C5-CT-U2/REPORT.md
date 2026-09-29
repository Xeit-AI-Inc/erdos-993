# C5-CT-U2 independent critique

## Disposition

Retain `C5-U2-ACTIVITY-LAYER-COEFFICIENTWISE-OBSTRUCTION` at its stated scope: for homogeneous arity-4 profiles with \(m\ge3\), distinguished-tip activity \(t\), and guarded rank \(k=m+4\), the coefficient of \(t^{2m-3}\) in the individual shifted minor is exactly \(-33(m-1)\). This disproves coefficientwise nonnegativity in this activity basis. It does not disprove the evaluated \(t=1\) minor, any actual-selector comparison, or a payment claim.

## Exact check

Use ordinary monomial coefficients in \(z\), with \(L=1+z\), \(G=1+2z\), \(B_3=L^3+z\), and \(B_4=L^4+z\). The non-binomial part of the activity expansion in either factor has \(t\)-degree at most \(m-1\). Since \(2m-3>m-1\) for \(m\ge3\), the \(E=zL^{4m}\) term times \(C_t\) contributes nothing to the target activity coefficient. In the product of the two marked-factor terms, only degree splits \((m-2,m-1)\) and \((m-1,m-2)\) contribute. Each has binomial multiplier \(\binom{m-1}{m-2}=m-1>0\), so it preserves the sign of the local combination. The exact local monomial coefficients are

\[
[z^6](GB_3L^4)=51,\quad [z^5](GB_4)=2,\quad [z^5](GB_3)=0,\quad [z^6](GB_4L^4)=142,
\]
\[
[z^7](GB_3L^4)=15,\quad [z^4](GB_4)=9,\quad [z^6](GB_3)=0,\quad [z^5](GB_4L^4)=205.
\]

Thus the signed coefficient is
\[
(m-1)(51\cdot2+0\cdot142-15\cdot9-0\cdot205)=-33(m-1).
\]
No division or order reversal is used. The only sign-preserving multiplier is \(m-1>0\). The rank guard is exact: \(1\le m+4\), and \(2k\le N+2\) becomes \(2m+8\le4m+2\), equivalent to \(m\ge3\). At \(m=3\), equality holds in the second guard; the coefficient is \(-66\).

As a scope check, for \(m=3\) the full \(t=1\) minor is \(2{,}076{,}267>0\). The parent has actual first strict descent \(x=7\); the primary eligibility conditions would require \(p\ge x+2=9\) and \(2p\le\alpha=14\), hence \(p\le7\). There is no actual eligible \(p\), so this example supplies no strict-selector flags or payment witness. This explicitly separates the coefficientwise obstruction from the guarded \(t=1\) comparison and primary predicate.

## Replay and provenance

Run `PYTHONDONTWRITEBYTECODE=1 python3 independent_activity_audit.py` in this directory. It writes `independent_activity_audit.json`, checks the local monomial coefficients and guard-boundary/interior samples \(m=3,4,5,7,20\), and independently computes the \(m=3\) parent descent/eligibility diagnostic. Integer layer convolution for \(3\le m\le7\) agrees with the closed formula; the symbolic split argument above proves all \(m\ge3\).

Before replay, I verified all 237 actual common-dispatch member bytes against `manifests/C5-COMMON-DISPATCH.json` (no missing or mismatched members) and all six actual packet `allowed_source_files` hashes (all matched). I copied the producer scripts into this scratch before running them; their exact activity replay agreed at \(m=3\ldots20\), and their common-manifest audit agreed. The independent script and derivation above are the retained evidence. A targeted lookup in the registered identity snapshot found no entry for this worker-local claim ID; this report therefore only critiques the assigned source claim and changes no registry status.

## Limitations

- The negative coefficient rules out only termwise nonnegativity in the specified activity basis; cancellation at \(t=1\) remains possible.
- No paired-layer certificate, uniform remainder estimate, or resolution of the guarded individual/weighted comparisons is supplied.
- The \(m=3\) diagnostic is not actual-eligible and does not address original-multiplicity payment or the primary selected-payment theorem.
- Exact computations are bounded cross-checks; the all-\(m\) conclusion comes from the displayed finite activity-degree split and exact coefficient calculation.
