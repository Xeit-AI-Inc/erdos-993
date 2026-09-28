# C4-CF-U2 critique report

## Scope and source integrity

I reviewed both required packet claims against the allowed C4-U2 case and the neutral common dispatch. All 174 common-manifest members and all 7 packet-listed case files exist and match their SHA-256 digests. The claim-identity lookup was restricted to the selected exact-ratio payment, its stronger MASS context, the finite center-subset coefficient identity, and the registered empty-plus-singleton payment obstruction.

I copied the case producer scripts into this scratch directory before running them. The copied literal-tree replay and layer audit reproduce the packet values. I also implemented a separate exact product-coefficient replay in `critic_replay.py`; it independently obtains the actual least strict descent, current-p selector signs, layer coefficients, and signed margins. It expands `GF_4` in powers of z as `(3,9,7,2)`. Replay command: `PYTHONDONTWRITEBYTECODE=1 python3 critic_replay.py`.

## Required claims

1. **C4-U2-R4-M173-DEPTH1-OBSTRUCTION — retain at the stated bounded scope.** The ordinary homogeneous arity-4 profile has `m=173`, `N=692`, `q=693`, `alpha=694`; exact zero-extended coefficients give actual first strict descent `x=336`, including the terminal difference check. At `p=338`, `j=336`, `delta=357`, both eligibility inequalities hold (`1014<1389` and `676<=694`). The endpoint and all 692 original tip tags pass their strict current-p deletion selectors, so `b=693` with multiplicity preserved.

   The cleared payment is `K*A - b*delta*D*C[j]`, where `K=delta*C[j]-(delta-1)*C[j+1]`. Here `C[j]>C[j+1]>0`, `D>0`, and `delta>0`; in particular `K=C[j]+(delta-1)(C[j]-C[j+1])>0`. Thus multiplying/dividing the exact ratio comparison by these positive factors preserves its direction. With `GF_4=(3,9,7,2)` in monomial z coefficients, the empty-plus-singleton floor gives ratio `0.9492540489806088` and a strictly negative exact integer margin. The full `T_i[j]` gives a positive exact margin. This refutes only the depth-one floor on this row, not full MASS or full exact-ratio payment. The registry already marks the broader universal empty-plus-singleton payment claim REFUTED at its separate retained witness; that does not change this row's bounded status.

2. **C4-U2-R4-M173-DEPTH2-LOCAL-REPAIR — retain at the stated bounded scope.** For this homogeneous profile, the exact expansion is
   `T_i[j] = sum_{a=0}^{m-1} binom(m-1,a) * sum_{s=0}^3 g_s binom(4(m-1-a),j-a-s)`, with `g=(3,9,7,2)`.
   Every term is nonnegative. Summing through `a=1` has the same negative depth-one margin above; including `a=2` yields a strictly positive exact margin. The exact equality of the full layer sum with the product coefficient is checked in the replay. This is a valid local repair of that surrogate on that row, not a profile-uniform payment bound or proof of the primary predicate.

## Inequality-direction and boundary audit

For fixed `s`, write `R_(a,s)=g_s*binom(m-1,a)*binom(n,k)`, where `n=4(m-1-a)` and `k=j-a-s`. When both adjacent terms are positive (`a<m-1`, `n>=4`, `1<=k<=n-3`, and `g_s>0`), direct cancellation gives

`R_(a+1,s)/R_(a,s) = (m-1-a)/(a+1) * k(n-k)(n-k-1)(n-k-2)/(n(n-1)(n-2)(n-3))`.

Both factors are positive on that domain, so the ratio identity preserves order there. It is undefined at zero-term boundaries and cannot be extended by dividing there. Exact checks at feasible edge and interior indices are in `critic_replay.json`; the ratio is greater than one at `(a,s)=(0,0)` and below one at `(80,2)`. Consequently the identity alone supplies no monotonicity or uniform tail estimate. The source's use of the full selected multiplicity is correct for this symmetric row, where all tip selectors agree; dropping those multiplicities would change the payment being tested.

## Grade and limitations

These two dispositions are bounded exact evidence only. The coefficient expansion has a separate formally verified coefficient-only identity in the neutral registry; this critique does not promote any selector, graph-transfer, MASS, or payment theorem to formal verification. The existing all-m exact-ratio payment remains at its registered computer-assisted/nonformal grade. No universal depth schedule, tail lower bound, or new counterexample to the full payment is established here.
