# C4-CF-T3 — independent critique of the count-vector/cofactor bridge

## Scope and source integrity

Reviewed the assigned claim `C4-T3-COUNT-VECTOR-COFACTOR-BRIDGE` in the C4-T3 case, the current registered identities for the general finite-block Jensen theorem, the path-star occupancy cofactor theorem and the formally verified center-subset expansion, and the dispatch-authorized neutral coefficient source. All 174 members of `manifests/C4-COMMON-DISPATCH.json` and both packet-listed source files matched their recorded SHA-256 digests. No producer script was needed or executed; no Lean build was run.

## Disposition: proposed retained at exact scope

Let the finite positive block sizes be (s_i), (M=\sum_i s_i), and let (f_i(t)\ge {s_i\choose t}) for (0\le t\le s_i). A uniform (k)-subset of the (M) labeled elements has count vector (K=(K_i)) with

\[
\Pr(K=t)=\frac{\prod_i {s_i\choose t_i}}{{M\choose k}}
\quad\text{when }\sum_i t_i=k.
\]

This law is not a product of independent block laws. For each admissible vector, multiplying its probability by \(\prod_i f_i(t_i)/{s_i\choose t_i}\) cancels the block binomials. Summing over vectors gives

\[
\mathbb E\prod_i w_i(K_i)
=\frac{1}{{M\choose k}}\sum_{\sum t_i=k}\prod_i f_i(t_i)
=\frac{[z^k]\prod_i\left(\sum_t f_i(t)z^t\right)}{{M\choose k}}.
\]

The count probabilities normalize to one because \([z^k]\prod_i(1+z)^{s_i}={M\choose k}\) (finite Vandermonde/convolution). This directly verifies the identity without an independence assumption. For the empty family, the separate convention \(M=k=0\) gives the empty product and coefficient as 1. At \(k=0\) and \(k=M\), the count vector is respectively all zero or all \(s_i\); the same identity holds exactly.

For the lower bound, every \(w_i(t)\ge1\), so \(W=\prod_iw_i(K_i)>0\). Finite Jensen for the convex exponential gives \(\mathbb E W=\mathbb E e^{\log W}\ge e^{\mathbb E\log W}\). The scalar bound used in the source has the correct direction: for \(w\ge1\), define \(g(w)=\log w-2(w-1)/(w+1)\). Then \(g(1)=0\) and

\[
g'(w)=\frac{(w-1)^2}{w(w+1)^2}\ge0.
\]

Thus \(\log w\ge2(w-1)/(w+1)\), with equality at the boundary \(w=1\) and strict inequality at every interior \(w>1\) (for example, integrating the positive derivative on \((1,2)\) gives \(g(2)>0\)). Taking expectations and using the hypergeometric marginal
\(\Pr(K_i=t)={s_i\choose t}{M-s_i\choose k-t}/{M\choose k}\)
produces exactly the stated (y_k). All denominators are positive: \({M\choose k}>0\) in range and \(f_i(t)+{s_i\choose t}\ge2{s_i\choose t}>0\). Since every summand of (y_k) is nonnegative, (y_k\ge0), and the nonnegative Taylor remainder gives \(e^{y_k}\ge E_d(y_k)\) for every natural (d\), including (y_k=0\) with equality.

For \(f_i(t)={s_i\choose t}+\mathbf1_{t=1}\), the only surplus is at (t=1\); the contribution to (y_k\) is exactly
\[
\frac{2s_i}{2s_i+1}\frac{{M-s_i\choose k-1}}{{M\choose k}},
\]
including zero-extended out-of-range binomials. This verifies the singleton-occupancy specialization. For path-star convolution, the displayed basis vectors are also consistent: (GF_2=(1,2)), (GF_3=(2,5,2)), (GF_4=(3,9,7,2)), in ascending monomial powers of (z). Their nonnegative coefficients preserve the direction of any coefficientwise lower bound on the zero-extended cofactor.

## Boundaries and non-transfer

This supports the general finite-block coefficient identity and its informal Jensen/Taylor consequence only. It does not formally verify Jensen, establish any graph identity from coefficient domination, or imply actual parent rank, marked-deletion factors, original leaf-tag multiplicities, strict current-(p) selectors, selected MASS or exact-ratio payment. The graph specialization needs separate proofs that the rooted components factor as claimed and that the parent and marked-deletion polynomials have the required forms. In the primary path-star setting any use must still use the actual least strict descent (including terminal differences), every rank guard and strict selector, and original multiplicities. The formally verified center-subset expansion is a separate polynomial identity and supplies none of those missing bridges.

## Replay

No computation was needed: the finite-sum identity and scalar inequality are proved above, including boundary cases. Input-byte verification can be replayed from the root with:

```sh
python3 - <<'PY'
import hashlib, json, pathlib
B = pathlib.Path('/Users/ashtonsperry/Documents/Codex/2026-09-13/in-x20/work/erdos-993-absolute-compensation-dre-2026-09-27')
for manifest in ('manifests/C4-COMMON-DISPATCH.json',):
    for row in json.loads((B/manifest).read_text())['members']:
        assert hashlib.sha256((B/row['path']).read_bytes()).hexdigest() == row['sha256'], row['path']
packet = json.loads((B/'packets/C4-CF-T3.json').read_text())
for row in packet['allowed_source_files']:
    assert hashlib.sha256((B/row['path']).read_bytes()).hexdigest() == row['sha256'], row['path']
print('174 common members and 2 packet files verified')
PY
```

No universal claim beyond the finite-block theorem is proposed. This is independent informal mathematical review, not a formal award or a primary-predicate verdict.
