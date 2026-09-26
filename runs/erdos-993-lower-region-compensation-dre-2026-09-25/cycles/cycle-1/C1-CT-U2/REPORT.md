# Critique of C1-U2-1 (orientation T)

## Disposition: retained

The source claim is a correct conditional necessary criterion on the exact eligible ordinary-tree instances. It does not prove or refute the primary aggregate inequality and does not assert that an instance with the required high-addability pair exists.

Let `a=alpha(T)`, `k=p-1`, `c=2a+1-3p`, and for each original favorable leaf tag `v`, use the source's `H_v`, `W_v`, and `q_v(j)=i_j(H_v)-i_j(H_v-W_v)`. Eligibility gives `p>=2`, hence `k>=1`; strict lower-region eligibility gives integer `c>=1`. It also gives `p<=a`, so `k<=a-1`.

The identity `alpha(H_v)=a-1` is valid. Any independent set in `H_v` can be augmented by `v`, so `alpha(H_v)<=a-1`. Conversely, a maximum independent set of `T` can be chosen to contain `v`: if it contains the support, replace that support by its leaf; if it omits the support, add the leaf if needed. Its restriction after deleting `v` and its support has size `a-1` in `H_v`.

For an independent marked `k`-set `A` of `H_v`, let `E(A)` be its actual addable vertices and `e_v(A)=|E(A)|`. Each color class of `E(A)` together with `A` is independent. Each such class has size at most `(a-1)-k=a-p`, so `e_v(A)<=2(a-p)`. Thus the deficit `d_v(A)=2(a-p)-e_v(A)` is nonnegative. This argument concerns the color classes of the *addable vertices*, not necessarily the full color classes of `H_v`; the source's intended reading is sound.

Count pairs `(A,z)` with `A` a marked independent `k`-set and `z` actually addable. A resulting `(k+1)`-set meeting `W_v` once has exactly `k` preimages, by deleting one of its unmarked vertices. A resulting set meeting `W_v` at least twice has `k+1` preimages, all marked; the correction counts each such set once. Therefore

`2(a-p)q_v(k)-D_v = k q_v(k+1)+C_v`,

where `D_v=sum_A d_v(A)` and `C_v` counts each twice-marked-or-more independent `(k+1)`-set once. Also the selected summand is exactly `q_v(k+1)-q_v(k)`, by expanding the two `Delta_(p-1)` terms on `H_v` and `H_v-W_v`. Since `2(a-p)-k=c`, this yields

`k * summand_v = c q_v(k)-D_v-C_v`.

Summing over the exact fixed favorable-tag set, including repeated-support leaves with their separate multiplicities, gives `kS=cQ-E`, where `Q=sum_F q_v(k)` and `E=sum_F(D_v+C_v)`. If `S>0`, then `Q>0` and `E<cQ`; consequently some marked pair has `d_v(A)<c`, since otherwise `D_v>=cQ` and `E>=D_v`. Substitution gives `e_v(A)>p-1`, hence `e_v(A)>=p`. Conversely, if every such marked pair has `e_v(A)<=p-1`, then each deficit is at least `c`, whence `D_v>=cQ`, `E>=D_v`, and `S<=0`. Empty selector and empty marked-set cases are covered by the same identities.

## Scope and controls

The selector is not recomputed or replaced: `F` remains precisely the original leaves with `Delta_p(T-v)<0`; `v`, its original support, and its original neighborhood define each summand. `H_v` is a finite forest and therefore bipartite. The rank and alpha bounds above validate the incidence domains. The argument is non-computational and invokes no literature theorem.

The standing controls are consistent with, but do not prove, this criterion. The handoff's `K_(1,12)` has a negative complete sum. The order-91 `T_22` and order-243 `T_60` likewise have negative complete sums despite positive marked/local terms. A necessary condition for *positive total* makes no prediction that any one positive local term suffices, so these are not counterexamples. They also do not establish that `e_v(A)>=p` is realizable on an eligible selected tag: the source supplies no such witness, and this critique does not claim one.

## Evidence grade and limitations

The proof is exact and algebraic, conditional only on the primary eligibility hypotheses. The reformulation is useful as a filter: failure of the addability threshold on every selected tagged marked set is sufficient to certify `S<=0`. The filter's fireability on a positive aggregate, and its usefulness for finding a positive aggregate, remain unestablished. The primary target stays open on this evidence. No standing-control computation was replayed because the claim is a general incidence identity and the supplied controls' complete aggregate signs do not test its conditional antecedent.
