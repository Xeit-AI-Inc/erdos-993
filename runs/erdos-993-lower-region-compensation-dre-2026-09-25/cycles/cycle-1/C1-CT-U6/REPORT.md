# Critique of C1-U6-1

## Disposition: retained

The exact claim is valid on its stated scope. If `alpha(T)=a`, the two color classes of the finite ordinary tree are independent and each has size at most `a`, hence `|V(T)|<=2a`. There are finitely many tree isomorphism classes on at most `2a` vertices. For fixed `a` and fixed `p`, checking the original definitions on that finite domain would decide the restricted instance. This is only a parameterwise finite search: the bound grows with unbounded `a`, so it is not a finite uniform reduction or a proof of the universal target.

For leaves `v,w` with common original support `s`, exchanging `v,w` and fixing all other vertices is an automorphism of `T`. Its restriction gives isomorphisms `T-v` to `T-w` and `T-{v,s}` to `T-{w,s}`. Therefore the exact values `Delta_p(T-v)` and `Delta_p(T-w)` agree, including their strict selector status, and the first deletion term in the summands agrees. The second deletion graph `T-N_T[s]` is identical for both tags. Thus each same-support leaf is selected together with all the others, and the total contribution of that support is its leaf multiplicity times the common summand. Distinct tags are preserved by this weighted accounting.

The route's optional coefficient profile description is compatible with this argument: the original tree polynomial and `a,p` retain the guards, while the support multiplicity and exact selected summand retain the tagged sum. No enumeration, arithmetic, or external theorem is needed for the claim. I found no proof gap within the fixed-`a` reduction or the same-support equality.

## Evidence grade and limits

This is an exact elementary structural reduction, not a computational result. It does not bound `a`, control contributions across different supports, prove `S(T,p)<=0`, or give a counterexample. The primary aggregate remains unresolved by this claim. The packet-listed source hashes were verified before review.
