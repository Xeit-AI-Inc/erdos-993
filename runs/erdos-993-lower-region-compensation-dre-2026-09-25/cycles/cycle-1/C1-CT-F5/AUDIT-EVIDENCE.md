# C1-F5-1 audit evidence

## Scope and source integrity

The packet-listed source hashes and all common-source hashes matched their packet pins before review. The only route claim is C1-F5-1. The claim is a bounded statement about (i) an abstract scalar relaxation and (ii) exact necessary structure of tree-derived leaf profiles; it does not assert the primary aggregate inequality.

## Scalar arithmetic

For the stated scalar relaxation, the parameters satisfy the incidence identity:

- h=5, k=2, q_k=1, q_(k+1)=3, D=C=0;
- k*q_(k+1)+C = 2*3+0 = 6;
- 2*(h-k)*q_k-D = 2*3*1-0 = 6;
- (2h-3k)*q_k-D-C = (10-6)*1 = 4, hence k*g=4 and g=2.

Thus nonnegativity of D and C alone does not force g<=0 in the scalar equation. This is a point of the equation-only relaxation. It is not certified by a bipartite graph, rooted forest, or ordinary tree. In particular no selector or eligibility assertion follows from it.

## Tree-derived structural identities

Fix an original leaf v with support s in a finite ordinary tree T. In T-s, the components are in bijection with the neighbors of s, each component containing exactly its one neighbor of s. The component containing v is the singleton {v}; deleting v leaves H=T-{v,s} with one rooted component for each w in W=N_T(s)\\{v}. Removing all those roots gives R=T-N_T[s]. Consequently, if H_i is the component rooted at w_i, independence polynomials factor as I(H)=product_i A_i and I(R)=product_i B_i, where A_i=I(H_i), B_i=I(H_i-w_i), and root inclusion/exclusion gives A_i=B_i+z I(H_i-N[w_i]). These are necessary tree constraints, not a sign bound.

Writing r_j=i_j(R) and q_j=i_j(H)-i_j(R), adding s back to H gives I(T-v)=I(H)+zI(R). Coefficient subtraction therefore yields exactly

Delta_p(T-v)=q_(p+1)-q_p+r_(p+1)-r_(p-1).

Favorable membership is the strict negativity of this expression for the same profile; it cannot be chosen independently of the rooted products. For m leaf neighbors of one support, each deletion T-v has the same polynomial (the leaves are interchangeable); H and R coefficient profiles are also identical up to relabeling. Thus all m leaf tags at that support are selected together or none are, and their contribution is m times one local summand.

## Standing local-positive/full-negative controls

The T22 (order 91) and T60 (order 243) standing JSON controls were copied into this scratch root before replay and removed after. On those copies I checked every stored selected row has pointwise_delta<0, the row count equals favorable_count, and the sum of stored g values equals the full aggregate. Both also pass the strict target guards:

| Control | (a,x,p) | x+2<=p | 3p<2a+1 | selected rows | positive selected terms | full S |
|---|---:|:---:|:---:|---:|---:|---:|
| T22 | (68,32,34) | yes | 102<137 | 67 | 1; +212336130412243110 | -498754180547001418536 |
| T60 | (182,87,90) | yes | 270<365 | 181 | 1; +2935177632783649903488454322226807645411570590073000 | -1058142362147652597702654588268394677176033202323316960380 |

These checks validate that local positivity is compatible with negative full sums. They do not establish a universal result or a bound for the abstract LP point.

The small star control K_(1,12) is consistent with the same scope: I(T)= (1+z)^12+z, so a=12 and the first strict descent is x=6; p=8 has 24<25. For each of the 12 leaves, T-v=K_(1,11) and Delta_8(T-v)=55-165=-110, so every leaf is selected. H is 11 isolated vertices and R is empty, giving local term Delta_7(H)-Delta_7(R)=C(11,8)-C(11,7)=165-330=-165; hence S=12*(-165)=-1980.

## Audit conclusion and boundaries

The route correctly identifies omitted realizability and selector couplings and does not claim they discharge the global deficit budget. Its mathematical content is retained only with the explicit scope that the positive tuple satisfies the one scalar equation with D,C>=0, not the full tagged-incidence or tree-profile constraints. The primary lower-region aggregate remains unresolved by this route. No new tree witness, finite exhaustive result, imported theorem, or global budget proof is supplied.
