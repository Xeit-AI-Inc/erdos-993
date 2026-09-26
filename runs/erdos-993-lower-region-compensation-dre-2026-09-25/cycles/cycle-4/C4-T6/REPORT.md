# C4-T6 search report: rooted polynomial messages and the selector boundary

## Result

I obtained an exact rooted-tree recurrence that computes the whole-tree polynomial, each original leaf's deletion polynomial, and its two deletion polynomials in the summand. It is a compositional calculation framework, but it does not supply the missing sign or a uniform compositional invariant proving the aggregate. The primary claim therefore remains open on this route.

## Rooted messages

For a component `C` rooted at `u`, write `A_u(z)=I(C-u;z)` and `B_u(z)=I(C-N[u];z)`. The independence polynomial of the component is

`I(C;z)=A_u(z)+z B_u(z)`.

Equivalently, if the children of `u` have rooted messages `(A_c,B_c)`, then

`A_u=product_c (A_c+z B_c)`, `B_u=product_c A_c`,

and `I(C)=A_u+zB_u`. The empty product is 1. This follows by partitioning independent sets according to whether `u` is selected. It applies to every finite rooted tree and has no rank truncation.

Root the full tree at an original leaf's support `s`. For each neighbor `u` of `s` other than the selected leaf `v`, let `C_u` be the component on the `u` side after deleting `s`; put `J_u=I(C_u)` and `A_u=I(C_u-u)`. Then direct component multiplication gives

`I(T-v;z) = product_{u != v} J_u + z product_{u != v} A_u`.

The indexing includes every other branch at `s`, including other original leaf branches. Thus it does not drop same-support leaf tags. If several leaves share `s`, each leaf has its own selector test and its own summand, even when symmetry makes their polynomial values equal.

For each such tagged leaf `v`, its local summand uses

`I(T-{v,s};z)=product_{u != v} J_u`,

`I(T-N[s];z)=product_{u not a leaf-neighbor of s} A_u`.

In the second product, `u` ranges over the non-leaf neighbors of `s`: deleting `N[s]` removes each such `u`, leaving precisely `C_u-u`. Leaf neighbors contribute no remaining vertices. Therefore, with `k=p-1` and `d_k(f)=[z^{k+1}]f-[z^k]f`, the tagged contribution is exactly

`d_k(product_{u != v} J_u) - d_k(product_{u not a leaf-neighbor of s} A_u)`.

These formulas cover support degree one as well: the empty products are 1, so the closed-neighborhood residual polynomial is 1 when `s` has only leaf neighbors.

## Where the global selector enters

Write `c_j(f)=[z^j]f` and `d_j(f)=c_{j+1}(f)-c_j(f)`, with coefficients zero outside the polynomial's degree range. The contract's `x(T)` is the first `j>=0` with `d_j(I(T))<0`, checking through the terminal zero extension. The fixed selected set is determined separately by `d_p(I(T-v))<0` for each original leaf. The recurrences above calculate these inputs exactly, after which the required result is the sum of the displayed tagged contributions over precisely those selected leaves and only under `x(T)+2<=p` and `3p<2 alpha(T)+1`.

The messages `(A,B)` compose at a fixed root, and a rerooted edge can provide the same data from either side. But the inequalities needed here compare coefficient differences of products at ranks selected by a first-descent rule on the assembled tree. I found no order or coefficient invariant preserved by the message product that bounds this selected sum. A state that records full coefficient vectors and every leaf-tagged deletion polynomial suffices to evaluate an individual finite input, but that is an exact evaluator, not a uniform inequality or a finite-size-independent induction invariant. In particular, local message composition alone proves neither `S<=0` nor a contrary example.

## Scope and limitation

This is an elementary exact recurrence for finite ordinary trees, not an exhaustive computation, an imported theorem, or a resolution of either registered identity. No universal conclusion follows from it. The open step is a compositional comparison controlling the aggregate after the global first-descent and fixed favorable-leaf selectors have been applied. No claim is made that a particular finite boundary-state system is impossible; I only did not identify one with the required sign property.
