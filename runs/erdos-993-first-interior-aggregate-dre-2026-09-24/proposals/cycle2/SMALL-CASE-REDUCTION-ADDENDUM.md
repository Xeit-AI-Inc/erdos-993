# Unreviewed small-case simplification using r27
This is a Cycle 2 proposal, not a mathematical award or Cycle 1 source.

Let a=alpha(T), n=|V(T)| and x be the first strict descent. Assume the target eligibility x+2<=a-2 and, for contradiction, a<=6. With integer ranks, eligibility gives x+4<=a. Thus a>=4 and T is nontrivial. A connected tree with at least two vertices has an edge, so no independent set is all vertices: a+1<=n.

The r27 formally verified forest descent bound applies to Delta_x(T)<0 and gives n<=4x. These three linear inequalities force a=6, x=2 and n in {7,8}. Indeed a+1<=4x<=4a-16 yields a>=6; then x<=2 and 7<=n<=4x force x=2. Hence only Delta_2 needs consideration, not separate Delta_0 and Delta_1 cases.

For any n-vertex tree, i2=choose(n-1,2) and i3=choose(n,3)-(n-1)(n-2)+sum_v choose(deg(v),2). Equivalently Delta2=(n-1)(n-2)(n-9)/6+sum_v choose(deg(v),2). The latter must be interpreted as an exact integer identity; in Lean a six-times identity avoids division.

If n=7, a maximum independent 6-set has a one-vertex complement covering every edge. That vertex has degree6, giving Delta2>=-10+15=5. If n=8, the complement is {u,w} covering all7 edges, so d(u)+d(w)>=7. For nonnegative integers d,e with d+e>=7, choose(d,2)+choose(e,2)>=9, e.g. by the nonnegative square (d-e)^2 and integrality. Thus Delta2>=-7+9=2. Both contradict Delta_x=Delta2<0.

All carrier/count/first-descent agreements between r27 and our original-leaf coefficient definitions must be proved, not assumed by name. The exact tree triple identity and two-vertex-cover degree bound require independent scrutiny before use. This is a proposed replacement proof of the same eligibility guard, not a new primary theorem.
