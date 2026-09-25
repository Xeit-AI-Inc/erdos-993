# C2-U1 independent U search report

## Result

The tagged-shadow count in the controller candidate is valid as stated for the leaf-derived family, and the small-alpha exclusion is also valid. Together they give a complete informal proof of the primary first-interior aggregate inequality. This is a proposed worker result only: I did not run Lean or any governing gate, so no registry/award status changes and the primary remains OPEN under the solution contract.

## Definitions fixed by the contracts

For a tree `T`, original leaf `v`, its original support `s`, let `H=T-{v,s}`, `W=N_T(s)\\{v}` (as a subset of `H`), and `R=H-W=T-N_T[s]`. For every integer rank `j`, set `q_j=i_j(H)-i_j(R)`. Since `R` is the induced graph obtained by deleting `W`, this is exactly the number of independent `j`-sets of `H` meeting `W`; in particular `q_j` is a nonnegative integer. It is zero for `j<0`, `j>alpha(H)`, and when `W` is empty. For `j=0`, it is also zero because the empty set does not meet `W`.

The summand is exactly

`Delta_(p-1)(H)-Delta_(p-1)(R) = q_p-q_(p-1)`.

The selector remains the unshifted strict condition `Delta_p(T-v)<0`; no step below changes or drops a tag. If several original leaves share a support, they are still counted as distinct tagged copies in the outer sum.

## Tagged deletion/extension count

Let `H` be finite bipartite, `W` any subset, `a=alpha(T)`, and assume `alpha(H)<=a-1`. Define `Q_j={A: A is an independent j-set of H and A meets W}`, so `|Q_j|=q_j`.

Count pairs `(A,B)` with `A in Q_k`, `B in Q_(k+1)`, and `A subset B`.

* For a fixed `B in Q_(k+1)`, at most one deletion can destroy the witness condition: this happens only when `B\cap W` has exactly one vertex and that vertex is deleted. Thus `B` has at least `k` deletions `A` which remain in `Q_k`. If `B` has two or more witnesses, all `k+1` deletions work. This includes no multiplicity assumption on W and handles a one-vertex witness correctly.
* For fixed `A in Q_k`, every extension vertex lies in `H-N_H[A]`. Any independent set `J` in this induced bipartite graph is disjoint and nonadjacent to `A`, so `A union J` is independent in `H`; hence `alpha(H-N_H[A])<=alpha(H)-k<=a-1-k`. A bipartite graph with independence number `b` has at most `2b` vertices because each color class is independent and has size at most `b`. Thus there are at most `2(a-1-k)` extension vertices. This upper bound counts even extensions whose new vertex is the only W witness, so it is also an upper bound on extensions whose enlarged set lies in `Q_(k+1)`.

Double counting gives the exact integer inequality

`k*q_(k+1) <= 2(a-1-k)*q_k` for `k>=1`.

If `Q_k` is empty the pair count forces `Q_(k+1)` empty; no division by `q_k` is used. When a tagged set exists, the argument itself ensures `k<=alpha(H)`, so no negative independence-number bound is being assumed. If no tagged `(k+1)`-set exists, the conclusion is immediate. For `k>alpha(H)`, both relevant upper-rank counts vanish. Empty `W` also makes all the q's zero.

For the primary rank, `p=a-2`, take `k=p-1=a-3`. If `a>=7`, then `k>=4`, and `2(a-1-k)=4`. Therefore `4q_p<=kq_p<=4q_(p-1)`, whence `q_p<=q_(p-1)` and the summand is nonpositive. The same derivation proves the proposed local high-tail sign when `p>=2` and `3p>=2a+1`; the contract's `p=1` edge case is not covered by this count and must be isolated in that broader auxiliary: its guard gives `a<=1`, and any graph with an original leaf then has `alpha(H)=0`, so its leaf summand is zero. For the primary, eligibility forces `p>=2`, so this exception never occurs.

## Eligibility forces alpha at least seven

Let `n=|V(T)|`. Eligibility gives `x(T)<=alpha(T)-4`, and thus `alpha(T)>=4` because `x>=0`. For every tree, `i_1=n`, `i_2=binom(n,2)-(n-1)=binom(n-1,2)`, hence `Delta_0=n-1` and `Delta_1=binom(n-1,2)-n`.

The exact triple count is

`i_3=binom(n,3)-(n-1)(n-2)+sum_u binom(deg(u),2)`.

Indeed, the `(n-1)(n-2)` edge/triple incidences count an edge-containing triple once if it has one edge and twice if it has two; every two-edge triple in a tree is a unique wedge at its middle vertex, counted by the displayed degree sum. Subtracting edge-containing triples from all triples gives the formula. Consequently

`Delta_2=(n-1)(n-2)(n-9)/6 + sum_u binom(deg(u),2)`.

Now exclude `alpha<=6` casewise. If `alpha=4`, `n>=5`, and `x<=0`, contradicted by `Delta_0>0`. If `alpha=5`, `n>=6`, `x<=1`, but `Delta_0>0` and `Delta_1>0` (already `10-6=4` at `n=6`, and the expression increases thereafter). If `alpha=6`, `n>=7`, `x<=2`, while `Delta_0,Delta_1>0`. At `n>=9`, the exact `Delta_2` identity is nonnegative, so it cannot be the strict descent either. At `n=7`, the complement of a maximum independent 6-set is a one-vertex cover of the six tree edges; hence `T=K_(1,6)` and the degree-square sum is 15, giving `Delta_2=5`. At `n=8`, that complement is a two-vertex cover. Its two degrees sum to at least 7, since it covers all 7 edges. Among nonnegative integer degree pairs with sum at least 7, the minimum of `binom(d1,2)+binom(d2,2)` is 9 (at 3 and 4); therefore `Delta_2>=-7+9=2`. In all cases `Delta_2>=0`, contradicting `x<=2` after the two earlier differences were positive. Thus every eligible tree has `alpha>=7`.

No isolated vertices are introduced as original leaves: H/R may be empty or disconnected and their independent-set counts are interpreted with the contract's zero extension. The only use of bipartiteness is on induced subgraphs of H, so it is inherited without connectivity assumptions.

## Composition to the complete sum

For each original leaf, the tree case above has `H` a forest and hence bipartite, while `alpha(H)<=alpha(T)-1` because any independent set in H can be augmented by the deleted leaf `v`. Eligibility gives `alpha(T)>=7`. Therefore every original leaf term is nonpositive, a stronger statement than needed for favorable leaves. Summing this pointwise result over exactly `F(T)` (all strict favorable original leaves, with leaf tags retained) yields `S(T,p)<=0`; if `F(T)` is empty the contract's empty sum is 0. This uses neither residuality nor a shifted selector.

## Inherited fences and independent exact check

All 89 imported REFUTED mechanisms retain their exact registered scopes; none is the tagged family count proved here, and none licenses altering the primary definitions. The relevant nearby fences remain disjoint by scope: the order-91 T22 positive marked term is at `p=34` while its target rank is `alpha-2=66`; order-243 T60's `p=90` also fails `3p>=2alpha+1` (the capsule gives `alpha>=180`, hence `270<361`). The Cycle-1 non-residual ordinary-tree witness has `(alpha,x,p)=(7,3,5)`, is eligible but has complete favorable sum `-72`, with its six terms all nonpositive; it confirms the proof does not need residuality but is not a counterexample. The proposed low-alpha boundary tree at `m=4` below illustrates why eligibility is needed: alpha=6, p=4, x=4 (ineligible), its marked term is +8, and the five-tag complete sum is 0. At m=5, the threshold is sharp for the count (`q_p=q_(p-1)` for the marked tag), but the example is again ineligible.

I made an independent exact larger check using a newly written forest-polynomial DP (no admitted evaluator was run). The constructive family is the tree with path `v-s-u-w` and `m` disjoint length-two arms `w-a_j-b_j`. At `m=11`, the DP gives order 26, independence polynomial coefficients `[1,26,300,2079,9735,32604,80322,147114,199782,197945,138369,64121,17431,2050]`, `(alpha,p,x)=(13,11,8)`, so it is eligible. Every original leaf is favorable; the marked term is `-16896`, each of the eleven arm-leaf terms is `-79`, and the full tagged sum is `-17765`. At m=4 the same DP confirms the positive marked term is canceled by four `-2` terms, total 0. These finite checks are arithmetic cross-checks only; they are not the universal proof.

Replay command from the run root:

`python3 scratchpad/C2-U1/fresh_shadow_check.py`

The script is standalone and uses exact integer polynomial tree DP. It checks only `m=4,5,11`, not an exhaustive class.

## Limitations / requested next step

The reasoning supplies an informal proof but no Lean proof/fidelity certificate under the current primary contract. The controller should review the two elementary arguments against the full statement, then route the exact tree inequality and case split through the prescribed formal gate before any status change. No unbounded search was run. No background job remains active.
