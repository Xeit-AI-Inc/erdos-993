# C3-F1 independent review

## Dispatch and scope

The common dispatch manifest verifies byte-for-byte: all 86 listed members exist and match their SHA-256 entries. The C3-F1 dispatch manifest likewise verifies all 4 members. The assigned packet is the sealed `packets/C3-F1.json`; it has `allowed_source_files: []` and `required_covered_claim_ids: []`. The cycle allocation assigns F1 to the exact m=70..119 scalar certificate audit, but no certificate, protocol, or producer script is authorized by this packet. I therefore did not read or execute the cycle3 producer files and cannot certify the claimed 799895-state coverage or zero exclusions. This is a dispatch/packet scope mismatch, not evidence for or against the numerical certificate.

I independently checked the relevant registered identity `E993-PATH-STAR-COFACTOR-JENSEN-EXPONENT-ADJACENT-ARITY-BALANCING` and proved its rational adjacent-arity convexity inequality below. This supports the exponent-minimization step only; it does not validate the finite scalar certificate, coefficients, selectors, MASS, or exact-ratio payment.

## Exact proof: adjacent-arity Jensen exponent

Let (M\ge10), (0\le k\le M), and (3k\ge M). Define
\[
 g_r=\frac{2r}{2r+1}\frac{\binom{M-r}{k-1}}{\binom Mk},\qquad r=2,3,4,
\]
with zero-extended binomial coefficients. If (k=M), all three terms vanish. Otherwise put (y=M-k\ge1) and
\[
 K=\frac{\binom{M-2}{k-1}}{\binom Mk}>0,\quad
 u=\frac{y-1}{M-2},\quad v=\frac{y-2}{M-3}.
\]
The binomial quotient recurrence gives (g_2=\tfrac45K), (g_3=\tfrac67Ku), and (g_4=\tfrac89Kuv), including (y=1) where (u=0). Since (y\le2M/3), (0\le u\le5/7): the upper bound is equivalent to (7(2M/3-1)\le5(M-2)), which holds for (M\ge9). Also (v\le u), because
\[
 u-v=\frac{M-y-1}{(M-2)(M-3)}\ge0.
\]
For (y=1), (uv=0\le u^2); for (y\ge2), (v\ge0) and hence (uv\le u^2). Therefore
\[
 g_2-2g_3+g_4
 =K\left(\frac45-\frac{12}{7}u+\frac89uv\right)
 \ge K\left(\frac45-\frac{12}{7}u+\frac89u^2\right)
 \ge K\left(\frac45-\frac{12}{7}\frac57+\frac89\left(\frac57\right)^2\right)
 =K\frac{64}{2205}>0.
\]
The quadratic is decreasing on ([0,5/7]), since its derivative is (-12/7+16u/9<0) there. Thus (r\mapsto g_r) is discretely convex on the three arities. For fixed total branch count (m') and total arity (M), the linear functional (\sum a_rg_r) is consequently minimized among integer mixtures by the adjacent-arity mixture bracketing (M/m'): ((2,3)) when (2m'\le M\le3m'), and ((3,4)) when (3m'\le M\le4m'). This is a statement about the rational Jensen exponent alone.

## Audit limits and status distinctions

No producer bytes were examined beyond hashing manifest members. No m=70..119 states were independently enumerated, so the finite certificate remains unreviewed here. The proof above does not show that an actual cofactor coefficient is ordered by its Jensen exponent, does not constrain actual first strict descent or any eligible rank, and does not alter strict current-p deletion selectors or original tip multiplicities. It gives no proof of selected MASS or payment. The mathematical primary remains OPEN; the all-m selector predicate retains its separate accepted computer-assisted status, while a census-free proof and formalization remain method obligations. No Lean work was performed.
