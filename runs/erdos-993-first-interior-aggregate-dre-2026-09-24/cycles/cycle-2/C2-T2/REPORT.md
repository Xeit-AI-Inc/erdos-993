# C2-T2 search report: first-interior eligibility

**Disposition proposed by this worker:** prove the exact auxiliary guard `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` at its registered scope. This does not prove the primary favorable-leaf aggregate. The controller's tagged-shadow inequality remains an unproved separate step.

## Claim and proof

Claimed scope: every finite ordinary connected tree `T`; with integer `p = alpha(T)-2`, and `x(T)` the least natural index with the strict integer difference `Delta_x(T)<0`, if `x(T)+2 <= p`, then `alpha(T)>=7`. No residuality condition is used.

Assume eligibility and, for contradiction, `a=alpha(T)<=6`. Since `x>=0` and `p=a-2`, eligibility gives the ordinary integer inequality

`x+4 <= a`.

In particular `a>=4`. A tree with independence number at least four has an edge (indeed, the eligibility inequality itself rules out the one-vertex tree), so a maximum independent set omits at least one vertex and `a+1<=n`, where `n=|V(T)|`.

Apply the pinned r27 forest descent lemma `Erdos993G1.forest_descent_linear_bound` at natural rank `k=x`. Its exact face is: for finite carrier `X`, acyclic simple graph `G`, and integer-coefficient descent `delta G (k:ℤ)<0`, `Nat.card X<=4*k`. A tree is acyclic, and `Delta_x(T)<0` is precisely this premise under the shared zero-extended coefficient/difference definitions. In the pinned source `firstDescent` is `Nat.find` of this same strict-descent predicate; its `firstDescent_spec` is stated explicitly. Thus there is no shifted-rank, terminal-rank, Nat-truncation, or connectivity transport in this application. We obtain `n<=4x`.

Combining the inequalities,

`a+1 <= n <= 4x <= 4(a-4)`,

so `17<=3a`, hence `a>=6`. Therefore `a=6`. Eligibility now gives `x<=2`, while `n>=a+1=7` and `n<=4x` give `x>=2`. Hence `x=2` and `7<=n<=8`. In particular the first strict descent would be `Delta_2(T)<0`.

For every `n`-vertex tree, let `d_u` be its degrees and `S=sum_u binom(d_u,2)`. Exact counting gives

`i_2(T)=binom(n-1,2)`

and

`i_3(T)=binom(n,3)-(n-1)(n-2)+S`,

so

`Delta_2(T)=((n-1)(n-2)(n-9))/6 + S`.

For the first identity, the only non-independent pairs are the `n-1` edges. For the second, count edge/triple incidences: there are `(n-1)(n-2)` such incidences. A non-independent triple is counted once unless it has two edges; a tree has no triangle, and its two-edge triples are length-two paths, counted exactly once by `S`. Subtracting these double counts from `binom(n,3)` gives the formula. All quantities are integers; the displayed division by six is exact because the expression equals `i_3-i_2`.

If `n=7`, a maximum independent six-set has one vertex `c` in its complement. That complement is a vertex cover, so all six edges meet `c`; thus `d_c=6` and `S>=binom(6,2)=15`. The formula yields `Delta_2>=-10+15=5`.

If `n=8`, the complement `{u,w}` of a maximum independent six-set covers all seven edges, so `d_u+d_w>=7`. For nonnegative integers `d,e` with `t=d+e>=7`,

`binom(d,2)+binom(e,2) = (d^2+e^2-t)/2 >= t(t-2)/4 >= 35/4`,

and integrality makes this at least `9`. Hence `S>=9`, and `Delta_2>=-7+9=2`. In both cases `Delta_2>0`, contradicting `x=2` and strict descent. This proves `alpha(T)>=7` at the exact auxiliary quantifiers.

## r27 audit and limits

The relevant r27 face is the verified `forest_descent_linear_bound` declaration, with finite-carrier and acyclicity hypotheses and an arbitrary natural rank `k` at which the exact integer `delta` is negative. It proves `n<=4k`, not merely a census observation. The r27 report records `firstDescent` as `Nat.find` on the descent predicate; applying the arbitrary-rank face directly at `k=x` also avoids reliance on the separate `XR` inequality's natural truncated subtraction. Its order bound is useful here only under the contradiction `alpha<=6`; it does not bound the order of all eligible trees. In fact, this argument shows that any hypothetical eligible tree with `alpha<=6` would have order seven or eight, so a larger counterexample to that contradiction case is mathematically impossible. Eligible trees with `alpha>=7` can be larger.

No r25 `Delta_2` theorem is needed: the r27 order bound reduces the only negative case to orders seven and eight, and the exact cover/counting argument treats those. The proof does not use the unverified controller proposal as a premise, a finite search, residuality, or any claim about the aggregate.

## Exact finite and fresh boundary checks

`checks.py` is a self-contained standard-library check. It enumerates every labeled tree by Prüfer code at orders seven and eight (`7^5=16,807` and `8^6=262,144` codes), computes independent-set counts by exact subset enumeration, and checks the two formulas and their `Delta_2` identity on every tree. Among trees with `alpha=6`, the minima were `Delta_2=5` at order seven and `3` at order eight; no enumerated tree with `alpha<=6` passed eligibility. The universal proof above, not this bounded run, supplies the guard. The unconditioned minima over all trees were `-5` and `-1`, respectively, illustrating why the `alpha=6` cover constraint matters.

As a fresh larger in-scope check of the proposed tail mechanism, take the ordinary tree `K_{1,10}` with edges `{(0,j):1<=j<=10}`. Its independent counts are `i_0=1`, `i_1=11`, and `i_k=binom(10,k)` for `2<=k<=10`, with `i_11=0`; hence `alpha=10`, `x=5`, `p=8`, and `x+2=7<=8`. All ten original leaves are favorable because `Delta_8(T-v)=1-9=-8`. For each leaf, `H` is nine isolated vertices and `R` is empty, so the summand is `Delta_7(H)-Delta_7(R)= (9-36)-0=-27`; the complete tagged sum is `-270`. For this leaf's tagged-shadow counts at `k=7`, `q_7=36`, `q_8=9`, and the proposed inequality reads `7*9<=2*(9-7)*36`, i.e. `63<=144`. This is a consistency check, not evidence for the inequality at all graphs.

Inherited fences: the registered positive local witnesses `T_22` and `T_60` are below the high-tail rank guard (`3p=102<2alpha+1=137` and `270<365`, respectively), and their positive local margins do not refute a restricted high-tail pointwise claim or the complete favorable sum. The controller's unadjudicated `m=3,4` boundary examples have `(alpha,p)=(5,3),(6,4)` and are outside eligibility; they are boundary checks only. No primary counterexample is supplied. Since the r27 contradiction bound rules out order above eight when `alpha<=6`, there is no larger eligible low-alpha tree to test under that specific contradictory hypothesis; the star above supplies a larger eligible tree for a direct sanity check of the proposed tail quantities.

## Reproduction

From the run root:

```sh
python3 scratchpad/C2-T2/checks.py > scratchpad/C2-T2/checks.out.json
```

The check completed with all assertions passing. No background jobs were started. No Lean build or remote/master write was performed.

The primary `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` remains OPEN here: the tagged-shadow inequality is not established, and the star check cannot promote it to a proof. The eligibility guard alone is only one proposed auxiliary.
