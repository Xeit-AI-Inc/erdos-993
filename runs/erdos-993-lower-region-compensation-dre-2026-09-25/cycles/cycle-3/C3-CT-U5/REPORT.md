# C3-CT-U5 critique of C3-U5

## Scope and result

This is an independent audit of the two claims in the assigned C3-U5 route case, under opposing orientation T. I find no defect in the conditional counting implication. It is a conditional result only: its marked occupancy transfer premise is not proved, so it does not resolve the primary aggregate. The primary claim is retained as an open target at exactly the contract scope.

The common packet hashes verified before review: 115/115 listed common entries and 3/3 case entries matched. The four required read-first files, the explicitly allowed C3 critic brief, and the exact three case files were read. No computation or source replay was needed for these symbolic counting claims.

## Audit of `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`

**Disposition: retained. Proposed status: open.** The route accurately states the registered target and does not purport to prove it. Its claimed gap is material: no argument establishes the transfer inequality for every eligible tree. The conditional lemma below cannot fill that gap without this premise (or another sufficient universally proved premise).

The target scope remains the exact finite ordinary tree, lower-region guards, original strict selector `F(T,p)`, and one summand per original leaf including same-support leaves. No local term, census, or auxiliary identity changes that status.

## Audit of `C3-U5-EARLY-DESCENT-MARKED-OCCUPANCY-BRIDGE`

**Disposition: retained. Proposed status: verified as a conditional implication.** The proof checks out with the stated premise and exact domains.

Write `a=alpha(T)`, `x=x(T)`, `k=p-1`, and for each selected original leaf use the contract definitions `H_v=T-{v,s_v}`, `W_v=N_T(s_v)\\{v}`, and `R_v=H_v-W_v`. Since `x+2<=p`, `x+1<=k`; eligibility also gives `p>=2`. The strict lower-region inequality implies `p<=a-1`, hence `1<=k<=a-2<a-1=h`, with `h=alpha(H_v)=a-1` as in the contract. Thus all ranks in the auxiliary identity are in range. The first descent gives `i_x(T)>0`, and double-counting addable-vertex pairs gives

`E_x(T)=(x+1)i_(x+1)(T)/i_x(T)<x+1<=k`.

For each `v`, put `q_v(j)=i_j(H_v)-i_j(R_v)`, which counts independent `j`-sets meeting `W_v`; let `Q=sum_F q_v(k)` and let `E` be the sum of actual addable-vertex counts over these marked `k`-sets, retaining every original-leaf tag. Under the route's premise `E<=E_x(T)Q`, if `Q>0` then `E<kQ`.

The tagged identity is valid. For a marked independent `k`-set `A`, each color class contributes at most `h-k` vertices addable to `A`, since its union with `A` is independent. So the actual addability `e(A)<=2(h-k)` and `D=2(h-k)q_v(k)-sum_A e(A)>=0`. Counting addable extensions of all marked `k`-sets counts each singly marked `(k+1)`-set `k` times (the marked vertex cannot be deleted) and each multiply marked one `k+1` times. If `C` counts multiply marked extensions once per resulting set, this proves `k q_v(k+1)+C=2(h-k)q_v(k)-D`; there is no overcount in `C` under the stated convention.

Also `Delta_k(H_v)-Delta_k(R_v)=q_v(k+1)-q_v(k)`, so summing the exact leaf summands and applying the identity yields

`k*S=(2(h-k)-k)Q-sum_F(D_v+C_v)=(2a+1-3p)Q-sum_F(D_v+C_v)`.

Here `sum_F D_v=2(h-k)Q-E`. If `Q>0`, the premise and strict descent give `sum D_v>(2(h-k)-k)Q`, and `C_v>=0`, hence `S<0`. If `Q=0`, the tagged identity directly gives `k*S=-sum_F(D_v+C_v)<=0`; no division by `Q` or strict conclusion is needed. This also handles an empty selector, where all sums are zero. The strict lower-region coefficient is positive, but it is the stronger addability comparison above, not mere nonnegativity of `D_v+C_v`, that establishes the conditional conclusion.

The strict selector is fixed at the original `T,p` throughout. The argument counts each `v` separately, so equal supports do not merge tags. The proof uses `x` only through the first-descent mean and rank guard; it does not silently assume descent at later ranks.

## Limitation

The comparison between the selected, marked rank-`p-1` addability total in the deletion graphs and the unmarked rank-`x` mean in `T` remains unproved. Nothing here shows that comparison is universal, refutes the primary claim, establishes a full-sum counterexample, or supplies finite computational coverage. The primary remains open.
