# C2-CF-T3 independent F critique of C2-T3

**Authority and disposition.** This is proposed worker criticism only. I checked the four incoming IDs in `cycles/cycle-2/C2-T3/RETURN.json` against its pinned `REPORT.md` and script/data; all four source hashes match `packets/C2-CF-T3.json`. I propose retaining all four exact statements. The proof chain appears complete at the informal level and matches `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`; no Lean gate is claimed. The route was already proposed in `packets/C2-COMMON-NEUTRAL.md`, so its novelty is a completed argument, particularly the independent low-alpha exclusion, not a new mechanism.

## C2-T3-01 — proposed_retained

For a finite bipartite graph `H`, let `a=alpha(H)`, `W` be any vertex subset, and `q_j` count independent `j`-sets meeting `W`, zero outside the feasible range. Fix integer `1<=k<=a`. Count ordered incidences `(A,B)` where `A` is a tagged independent `k`-set and `B` a tagged independent `(k+1)`-set with `A subset B`. Every `B` has at least `k` such `A`: if exactly one vertex of `B` is in `W`, delete one of the other `k`; if at least two, every deletion works. For a fixed `A`, each extension vertex belongs to `Q=H[V(H)\(A union N_H(A))]`. Any independent `U` in `Q` makes `A union U` independent, so `alpha(Q)<=a-k`. A bipartite graph on `|Q|` vertices has a color class of size at least `|Q|/2`, giving `|Q|<=2(a-k)`. The incidence upper bound is therefore `2(a-k)q_k`, exactly as claimed. This proof handles `W=empty`, `k=a`, and both possible tag counts without division or positivity assumptions on `q_k`. It is sharp: for `H` a disjoint union of `a` edges and `W=V(H)`, `q_j=2^j binom(a,j)` for `j>=1`, and equality holds for every `1<=k<=a`.

## C2-T3-02 — proposed_retained

For a degree-one vertex `v` of bipartite `G`, let `s` be its unique neighbor, `H=G-{v,s}`, `W=N_G(s)-{v}`, and `R=G-N_G[s]=H-W`. The difference `i_j(H)-i_j(R)` counts exactly the independent `j`-sets of `H` meeting `W`, hence is `q_j` including terminal zero extension. Thus the asserted term is `q_p-q_(p-1)` at the **original** integer rank. Adjoining `v` to any independent set of `H` proves `alpha(H)<=alpha(G)-1` even if `G` is disconnected. If `p>=2`, set `k=p-1>=1`. The guard `3p>=2alpha(G)+1` rearranges to `3k>=2alpha(G)-2>=2alpha(H)`, or `k>=2(alpha(H)-k)`. If `k<=alpha(H)`, C2-T3-01 implies `k q_p<=2(alpha(H)-k)q_k<=kq_k`; division by the positive integer `k` is valid. If `k>alpha(H)`, both `q_k` and `q_p` vanish. If `p=1`, the guard forces `alpha(G)<=1`; the leaf edge forces equality, and `alpha(H)=0`, so both tagged counts vanish. The original return's shorthand “G=K2” is true for finite bipartite `G` with a degree-one vertex and alpha one, but the argument only needs `H` empty. No connectivity or residual assumption enters.

The bound's rank guard has real scope: the exact older positive local witnesses below occur at ranks failing it. Sharpness of C2-T3-01 alone does not show the rank guard is optimal for the more structured leaf-neighborhood `W` in C2-T3-02.

## C2-T3-03 — proposed_retained

Here `p=a-2` is an integer and eligibility gives `x+4<=a`; since `x>=0`, `a>=4` and `p>=2`. The tree has an edge, hence `n>=a+1`. Tree counts give `Delta_0=n-1>0` and `Delta_1=binom(n-1,2)-n>0` for `n>=6`. For `a=4`, `x<=0` contradicts `Delta_0`; for `a=5`, `x<=1` contradicts both early positive differences.

For `a=6`, eligibility requires `x<=2` and `n>=7`. Edge/triple inclusion-exclusion in a triangle-free tree gives

`i_3=binom(n,3)-(n-1)(n-2)+sum_u binom(deg(u),2)`

and, subtracting `i_2=binom(n-1,2)`, the exact integer identity

`6 Delta_2=(n-1)(n-2)(n-9)+6 sum_u binom(deg(u),2)`.

For `n>=9`, this is nonnegative. At `n=7`, the complement of an independent six-set is a one-vertex cover, so all six edges meet that vertex; `Delta_2=-10+15=5`. At `n=8`, the two-vertex complement covers seven edges. If its vertices have degrees `d,e`, then `d+e>=7`; the minimum of `binom(d,2)+binom(e,2)` over nonnegative integers with this constraint is `9` at `(3,4)` or `(4,3)`. Thus `Delta_2>=-7+9=2`. In all cases `Delta_0,Delta_1>0` and `Delta_2>=0`, so the first **strict** negative difference cannot have `x<=2`. This avoids relying on the r27 bridge proposed in `proposals/cycle2/SMALL-CASE-REDUCTION-ADDENDUM.md` and handles a flat difference correctly.

## C2-T3-04 — proposed_retained

For an eligible tree, C2-T3-03 gives `a>=7`; `p=a-2` then has `3p=3a-6>=2a+1`. A tree is bipartite. Apply C2-T3-02 separately to every vertex of the **original** degree-one set `L(T)`. Each original support defines exactly the `H_v` and `R_v` in the semantic contract, and every term is nonpositive. The selector uses the unshifted strict test `Delta_p(T-v)<0`; selecting any subset of the nonpositive tagged terms preserves the bound. If two original leaves share a support, each remains a separate summand. The empty selector gives sum zero. Thus the proof reaches the complete primary expression with no residual premise. It proves more than required on eligible trees (all original-leaf terms have nonpositive sign), but it does not assert that pointwise statement at all ranks.

The inherited order-91 and order-243 marked leaves have positive local terms at ranks `34` and `90`, with `(alpha,x)=(68,32)` and `(182,87)` respectively (`sources/standing-controls/t22-order91.json`, `t60-order243.json`). They fail `3p>=2alpha+1` there: `102<137` and `270<365`. Their contract ranks are instead `66` and `180`; `cycles/cycle-1/C1-SYNTHESIS/REPORT.md` reports negative complete sums `-147807` and `-2947590` at those ranks. They falsify an unguarded pointwise shortcut, not any of these four claims. The Cycle 1 nonresidual witness at `(alpha,x,p,S)=(7,3,5,-72)` is in scope and is covered because this proof uses no residual assumption. Bounded evidence does not establish the universal claim.

## Exact falsification replays

I copied the pinned C2-T3 script into this scratch as `replay_m200.py`, ran `python3 scratchpad/C2-CF-T3/replay_m200.py > scratchpad/C2-CF-T3/replay_m200.json`, and byte-compared its output with the pinned `cycles/cycle-2/C2-T3/check_m200.json`: equal. The replay's order-404 tree has `(alpha,x,p)=(202,134,200)`, all 201 original leaves favorable, and complete sum `-7833822965762577593267065200163167687295739594691115072102048400`. Its tagged shadow is equality at the specified leaf/rank.

For a fresh distinct check **larger than both the inherited order-243 fence and C2-T3's order-404 replay**, `check_augmented_m201.py` constructs vertices `0..406` with edges `0-1-2-3`, an extra leaf `4-1`, and `3-(5+2j)-(6+2j)` for every `0<=j<201`. The script uses exact forest DP and independently checks all coefficients against the branch formula

`I(T;z)=(1+4z+3z^2+z^3)(1+2z)^201 + z(1+3z+z^2)(1+z)^201`.

It obtains `n=407`, `a=204`, `x=136`, `p=202`, hence eligibility and the high-tail guard. There are 203 original leaves: `0` and `4` share support `1`, while the other 201 are symmetric pendant-path leaves. The automorphisms exchanging `0,4` and permuting the 201 paths justify evaluating one representative of each orbit and multiplying the result by `2` or `201`; this is the **complete** original-leaf sum, not a single selected term. Both orbits are favorable. Their exact terms are `-16466294139521873353478485560219893188045014077292278183333219771` (twice) and `-20298` (201 times), giving `S=-32932588279043746706956971120439786376090028154584556366670519440`. The script also checks `q_p-q_(p-1)` equals the corresponding `Delta` difference and checks the shadow slack for both representatives. Replay with `python3 scratchpad/C2-CF-T3/check_augmented_m201.py > scratchpad/C2-CF-T3/check_augmented_m201.json`; its JSON provides all representative integers. This bounded test probes a shared-support multiplicity case beyond the origin's size. It supplies no universal proof.

No Lean build, remote/master edit, sibling read, or subagent was used. All owned commands have exited; no owned background job remains.
