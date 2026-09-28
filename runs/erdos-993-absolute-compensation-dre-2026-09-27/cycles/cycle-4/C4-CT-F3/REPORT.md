# C4-CT-F3 independent critique

## Scope and byte audit

I reviewed the five required claims in the packet against the sealed definitions. All 174 members of `manifests/C4-COMMON-DISPATCH.json` matched their listed SHA-256 hashes. All four packet source files also matched their packet hashes. The producer audit was copied to this scratch before execution. Its exact-integer/rational replay completed 17 cases; I also ran a separate exact polynomial check for guarded shifted comparisons on six small profiles, at both interior and guard-edge ranks where available. No experiment here is a universal proof.

## Finite-block coefficient/Jensen claim

For positive block sizes (r_i), write (c_i(t)=\binom{r_i}{t}) and (w_i(t)=f_i(t)/c_i(t)\ge1). A uniform (k)-subset of the disjoint union has block-count vector (K), with

\[
\Pr(K=t)=\frac{\prod_i c_i(t_i)}{\binom{M}{k}},\qquad \sum_i t_i=k.
\]

Expanding the product coefficient by count vectors gives the exact identity
\[
H[k]/\binom{M}{k}=\mathbb E\prod_i w_i(K_i).
\]
The (K_i) are dependent; no independence is needed. Jensen applied to their joint law gives a lower bound \(\exp(\sum_i\mathbb E\log w_i(K_i))\). For (w\ge1\),
\[
\log w-2(w-1)/(w+1)\ge0,
\]
because its derivative is \((w-1)^2/(w(w+1)^2)\ge0\) and its value at (w=1) is zero. All denominators are positive. At (w=1,3/2,2\), the rational terms are respectively (0,2/5,2/3), while the logarithms are respectively (0,\log(3/2)>2/5,\log2>2/3). Thus the stated exponent is nonnegative, and \(\exp(y)\ge E_d(y)\) for every finite (d\), since the omitted exponential-series terms are nonnegative. This proves the abstract finite-block theorem informally on exactly (0\le k\le M\).

For the special factor (B_s=(1+z)^s+z), its coefficient ratio to \((1+z)^s\) is (1+1/s\) at degree one and 1 elsewhere. The log lower bound specializes to \(\log(1+1/s)\ge2/(2s+1)\), with the same positive-denominator argument. The exact subset identity follows by assigning each singleton subset its extra (z)-choice; the expectation/Jensen step remains valid for dependent occupancy indicators. The empty family has only (M=k=0), coefficient and normalization 1, and exponent 0. At (k=0), all singleton probabilities vanish. At (k=M), the size-one block singleton event has probability 1, while for larger blocks it has probability 0. The producer's 17 rational boundary/interior checks replayed successfully.

## Graph coefficient bridge and limits

For a graph with independence number (r\), the subsets of one maximum independent set contribute at least \(\binom rt\) independent sets in each degree. If the graph has a vertex outside that set, its singleton is an additional degree-one independent set, proving the coefficient floor \((1+z)^r+z\). The generic finite-block theorem therefore applies to a product of such factors once an actual disjoint-component factorization is established.

This does not transfer a path-star parent or deletion identity. Any application to a marked deletion must separately establish factorization for parent and deletion, the corresponding component independence numbers (including the changed marked component), and the exact parent coefficient sequence. Selector/payment use must then retain the actual least strict zero-extended descent (x), including terminal differences and excluding flats; at the same (p), keep (x+2\le p), (3p<2(N+2)+1), (2p\le N+2), and the strict flags \(e_0=1[\Delta_p A_0<0]\), \(e_i=1[\Delta_p A_i<0]\). Original tip multiplicity (r_i) remains in (W=\sum_i r_iA_i) and in the selected sum. Coefficient floors alone prove none of these transfer conditions.

## Guarded shifted comparisons

I found no guarded counterexample or universal proof for either registered comparison. My direct monomial-basis integer checks on profiles ((2),(3),(4),(2,2),(2,3),(4,4,4)) gave nonnegative margins (A[k]C[k]-A[k+1]C[k-1]) and (W[k]C[k]-W[k+1]C[k-1]) on the tested guarded ranks. These are bounded diagnostics only. The known ((a_2,a_3,a_4)=(38,0,1), k=77, N=80) all-rank obstruction lies outside the claimed guard since (2k=154>N+2=82); it cannot refute either guarded claim.

The shifted inequalities would still need a separate, direction-checked bridge to strict current-(p) selection using the accepted actual-descent ratio facts. In particular, a strict descent of the weighted deck can give at least one selected branch, not selection of every tip or the endpoint. The branchwise mass/payment statement still uses each original (r_i) multiplicity. Nothing here promotes the primary exact-ratio payment beyond its existing computer-assisted/nonformal grade or asserts a Lean award.

## Replay

From this directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 producer_audit_finite_blocks.py > producer_replay.json
PYTHONDONTWRITEBYTECODE=1 python3 independent_checks.py > independent_checks.json
```

The producer replay is independent of its producer directory because the source script was copied here before execution. `independent_checks.py` builds the path-star polynomials directly in monomial (z) coefficients; no (L=1+z) coefficient list is treated as a monomial list.
