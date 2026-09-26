# C6-CU-T2 independent critique of C6-T2

## Disposition

**Retained** at the source claim's exact restricted scope: for the path-with-private-stars tree with (m\ge 2000), arbitrary branch arities (r_i\in\{2,3,4\}), and every eligible strict lower-region (p), the complete original favorable-leaf sum is strictly negative. This is an informal infinite-family proof supported by an imported finite-order ULC convolution theorem. It is not an arbitrary-tree result, a finite-prefix result, or a kernel-verified result.

## Checks performed

The common packet lists 237 source pins and the case packet lists four C6-T2 source files. All 241 hashes matched. I read the required common sources, the additional critic brief, the route's report/return/replay, and the exact heterogeneous candidate and cutoff arithmetic identified by the common source map. The exact route key is absent from the pinned C6 transitive-refutation list; the nearby lower-region mechanism refutations have narrower, different scopes and do not refute this scalar family claim.

For the graph with path (0-1-2), (m) centers at 0, and (r_i) private leaves at center (i), let (N=\sum_i r_i), (L=1+z), (B_r=L^r+z), and (H_i=\prod_{h\ne i}B_{r_h}). Root inclusion/exclusion gives

\[
P=(1+2z)\prod_i B_{r_i}+zL^{N+1},\quad
A_0=L\prod_iB_{r_i}+zL^N,\quad
A_i=(1+2z)B_{r_i-1}H_i+zL^N.
\]

Here (A_0) and (A_i) are the endpoint and private-tip deletion polynomials. Root inclusion attains (N+2) independent vertices (0, endpoint 2, and all private tips); root exclusion has at most (N+1), so \(\alpha=N+2\). Direct support deletion for a private tip gives
\(q_v=z((1+2z)F_{r_i}H_i+L^N)\), where (F_r=(L^{r-1}-1)/z\), while the endpoint contributes (zL^N\). The distinct tags therefore sum to (zR\), with
\[
R=\sum_i r_iZ_i,\qquad Z_i=(1+2z)F_{r_i}H_i+\frac{N+1}{N}L^N.
\]
This retains one endpoint tag and every private-tip tag. If the stated minor/curvature argument makes all (A_0,A_i) descend at (p), the fixed selector is the full original leaf set; if each (Z_i) descends at (p-1), then the complete sum is exactly
\(S=R_{p-1}-R_{p-2}=\sum_i r_i((Z_i)_{p-1}-(Z_i)_{p-2})<0\). No pointwise-to-global inference or LC claim for the mixture (R) is used.

The selector bridge is correctly scoped. The direct derivative bound for (M=(1+2z)Q) gives (M_{j+1}/M_j\ge (N+1-j)/(2(j+1))>1) for (j\le N/4) and (N>4); the perturbation (zL^{N+1}) also increases there. Thus (x>N/4). The strict guard gives (p\le\lfloor(2N+4)/3\rfloor), and eligibility gives (x\le p-2). Hence the crossing and propagation ranks are in the claimed central interval. Positive mixed minors transfer the first descent at (x) separately to each deletion polynomial and each (Z_i); strict central log-concavity propagates it to ranks (p) and (p-1) respectively.

The cutoff replacement is internally consistent. Choosing 29 additional-(z) factors in (H_i) yields the coefficientwise lower bound \(H_i\ge {m-1\choose29}z^{29}L^{N-120}\). The exact quotient against \({N\choose j-s}\) is
\[
f_s(j)=\frac{(j-s)_{29-s}(N-j+s)_{91+s}}{(N)_{120}},\qquad s=0,1.
\]
Its consecutive ratio is at most one throughout the interval because the cross-multiplied difference is at least (N+91) for (s=0) and (2N-28) for (s=1). At the upper endpoint the common lower product (A^{28}B^{92}), with (A=2/3-29/(2m)) and (B=1/3-95/(2m)), follows from (N\ge2m), (A>B>0). The copied replay recomputes the exact rational at (m=2000) and confirms (80328m\epsilon(m)<1) there; (m/(m-29)^{29}) decreases and (A,B) increase thereafter. This validates the cutoff arithmetic, not the graph theorem by itself.

## Review limits and precision notes

I found no decisive mathematical defect. Two proof details should be made explicit in any final polished proof: (i) (B_1=(1,2)) occurs as (B_{r_i-1}) when (r_i=2), although the route's finite ULC list starts at (B_2); its ULC(1) check is immediate. (ii) Some ratio bounds are stated for common factors of degree at least (N-3); this applies to the factors used in the mixed minors. It should not be read as a claim about the raw (H_i), whose degree can be (N-4). The available ratio cap remains valid with that lower degree at (N\ge4000), but that distinction should be stated where the bound is applied.

I did not retrieve Gurvits's paper directly in this critique; the route cites Theorem 1.1, and the pinned common preparation report records its finite-order formulation and hypothesis bridge. I also did not perform a separate literal graph enumeration for arbitrary (m), nor independently regenerate every mixed-minor envelope; those are analytic steps in the self-contained route/candidate derivation, rather than checks furnished by my cutoff replay. These are review limits, not counterexamples. The exact rational replay was run from a copy under this scratch root with the specified Python 3.11 interpreter.

No primary-tree conclusion follows. The arity range, the (m\ge2000) cutoff, the fixed original selector, and the strict lower-region guard remain essential parts of this disposition.
