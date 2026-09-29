# C5-T1 search report

## Scope and disposition

This search follows the branch-addition state lens for the registered weighted guarded tip-deck comparison `E993-PATH-STAR-ARITY-2-4-LOWER-HALF-SHIFTED-C-WEIGHTED-TIP-DECK-LR`. I found no universal invariant that closes it. Its status remains **OPEN**; the exact checks below are bounded evidence only. The accepted primary selector/payment result and its evidence grade are untouched.

For a nonempty profile with original branch multiplicities (r_i\in\{2,3,4\}), use the shared notation
\[
C=G\prod_iB_{r_i},\quad E=zL^N,\quad
U=\sum_i r_iG B_{r_i-1}\prod_{h\ne i}B_{r_h},\quad W=U+NE.
\]
The guarded coefficient target is (W[k+1]C[k-1]\le W[k]C[k]), with zero extension and exactly (1\le k, 2k\le N+2). This coefficient-only predicate does not impose actual first descent or the current-(p) strict selectors; I make no selector/payment inference from it. Original tip multiplicities are the factors (r_i).

## Exact branch-addition identities and induction boundary

On adjoining a branch of arity (r\in\{2,3,4\}), direct multiplication gives
\[
C'=B_rC,\qquad U'=B_rU+rB_{r-1}C,\qquad E'=L^rE,\qquad N'=N+r.
\]
Thus the three component recurrences have nonnegative polynomial terms. Recombining (W=U+NE) gives the exact identity
\[
W'=B_rW+rB_{r-1}C+(rL^r-Nz)E.
\]
Indeed, subtract (B_rW+rB_{r-1}C) from (U'+N'E'); the residual is
\(((N+r)L^r-N(L^r+z))E=(rL^r-Nz)E\).
The (-NzE) contribution has no general nonnegative sign and cannot be dropped.

The guard endpoint is (g(N)=\lfloor(N+2)/2\rfloor). After adding a branch, the new target band contains ranks through (g(N+r)), whereas the old band only controlled ranks through (g(N)). The newly admitted ranks are exactly (g(N)+1,\ldots,g(N+r)), with
\[
g(N+2)-g(N)=1,\quad
g(N+3)-g(N)=\begin{cases}1&N\text{ even},\\2&N\text{ odd},\end{cases}\quad
g(N+4)-g(N)=2.
\]
Consequently an induction based only on the old guarded minors leaves one new rank for (r=2), one or two for (r=3), and two for (r=4). A convolution closure proof would need estimates on those strips and on the signed (E) contribution; the old guarded hypothesis alone does not furnish them. This diagnoses the boundary obligation, not a counterexample to the reachable-profile comparison.

The existing ULC main-product estimate, when combined with exact common-denominator summation over original multiplicities, reduces the weighted target to the sufficient inequality
\[
(h+1)U[k]C[k]+(k+1)(h-k+1)N\,M_k(E)\ge0,
\quad h=1+2a_2+4a_3+7a_4,
\]
where (M_k(E)=E[k]C[k]-E[k+1]C[k-1]). This is a route to the target, not a proof: neither the separate (E)-minor nor a nonnegative recurrence term can be presumed. The shared neutral handoff records negative (E)-only minors and the existing (217(j+1)\epsilon<1) tail criterion; this search derives no sharper all-profile bound and does not replace that tail proof.

## Independent exact replay

`recurrence_audit.py` is a self-contained exact-integer implementation of the polynomial operations and state recurrences. Replay from this directory with:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 recurrence_audit.py > recurrence_audit.json
```

It checked 19 branch-addition steps on five profiles and all 32 guarded ranks in profiles with counts ((1,0,0),(0,1,0),(0,0,1),(2,3,4),(4,1,2)). The state identities matched exactly; both the weighted shifted minor and the sufficient weighted-surplus margin were nonnegative at all 32 ranks. These small samples do not cover all profiles or prove the induction strips. No actual graph witness or universal payment proof is claimed.

The common dispatch manifest's 237 member byte hashes were independently recomputed; there were no mismatches. Only common-manifest members were read, with claim lookup limited to the assigned guarded comparison and its stated ULC route.

## Exact remaining obligation

Prove a profile-uniform lower bound on the weighted (U)-minor surplus strong enough to absorb (N M_k(E)) at every guarded rank, including the one/two new boundary ranks created at each branch addition, or find a realizable exact guarded failure. The present recurrence, finite replay, and prior ULC route establish neither. Keep the weighted comparison OPEN.
