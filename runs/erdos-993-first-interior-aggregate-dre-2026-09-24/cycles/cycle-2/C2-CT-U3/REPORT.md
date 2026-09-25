# C2-CT-U3 constructive critique of C2-U3

**Disposition of the sole incoming claim, `C2-U3-PRIMARY-PROOF-COMPLETENESS`: proposed_retained.** The stated elementary argument is a complete informal proof of the exact primary inequality. I independently checked its two delicate steps, the low-alpha exclusion and the tagged incidence inequality, including the empty/terminal cases. It proves a pointwise sign for **every** original leaf at the eligible rank, so the strict favorable selector can only remove nonpositive terms. No repair to the proof is needed. The informal proof is still a worker proposal: it has no governed Lean fidelity/kernel gate or controller status award. The primary registry status therefore remains OPEN at this critique stage.

## Exact proof audit

Write `a=alpha(T)` and the integer `p=a-2`. Eligibility `x(T)+2<=p` gives `x(T)+4<=a`; since `x>=0`, it also gives `a>=4` and `p>=2` before any natural subtraction. A connected tree with `a>=4` has an edge, hence `n=|V(T)|>=a+1`. Its first differences are `Delta_0=n-1>0` and `Delta_1=binom(n-1,2)-n`. At `n>=6`, the latter is at least 4 and increases with `n`. If `a=4`, eligibility requires `x=0`; if `a=5`, it requires `x<=1`. Both contradict these signs.

For `a=6`, eligibility requires `x<=2`, and `n>=7`. Inclusion-exclusion over edge-containing 3-sets in a tree gives

`i_3=binom(n,3)-(n-1)(n-2)+sum_u binom(deg(u),2)`.

Every edge lies in `n-2` triples; intersecting pairs of edge events are exactly adjacent edge pairs; a tree has no three edges within one triple. Since `i_2=binom(n,2)-(n-1)`, subtraction gives the exact identity

`Delta_2=(n-1)(n-2)(n-9)/6+sum_u binom(deg(u),2)`.

For `n>=9` both terms are nonnegative. At `n=7`, a maximum independent 6-set leaves a one-vertex cover of all six edges, so the tree is `K_(1,6)` and `Delta_2=-10+15=5`. At `n=8`, its two-vertex complement `{u,w}` covers all seven edges; hence `deg(u)+deg(w)>=7`. Convexity of `binom(d,2)` on nonnegative integers gives `binom(deg(u),2)+binom(deg(w),2)>=binom(3,2)+binom(4,2)=9`, while the first term of `Delta_2` is `-7`. Thus `Delta_2>=2`. In all cases `Delta_0,Delta_1,Delta_2` exclude `x<=2`. This proves `a>=7` without invoking the separately proposed r27 crossing/order transport. The source proof's numerical constants are correct.

Now fix one original degree-one vertex `v`, its **original** support `s`, `H=T-{v,s}`, `W=N_T(s)\{v}` inside `H`, and `R=T-N_T[s]=H-W`. Let `q_j` count independent `j`-subsets of `H` meeting `W`, with zero extension. Then `q_j=i_j(H)-i_j(R)` and the exact original-leaf summand is `g_v=q_p-q_(p-1)`. Every independent set of `H` can be enlarged by `v` in `T`, so `alpha(H)<=a-1`.

For a finite bipartite `H`, any `W`, and `1<=k<=alpha(H)`, count incidences `(A,B)` where `A` is a tagged independent `k`-set and `B` is a tagged independent `(k+1)`-set containing `A`. A fixed `A` has extension vertices in `K=H-N_H[A]`. The two color classes of `K` show `|K|<=2alpha(K)`, and every independent set of `K` can join `A`, so `alpha(K)<=alpha(H)-k`. This gives at most `2(alpha(H)-k)` incidences per `A`. A fixed `B` has at least `k` tagged deletions: only deletion of its sole `W` vertex could fail to meet `W`. Thus

`k q_(k+1) <= 2(alpha(H)-k) q_k`.

The argument includes disconnected or empty `K` and `W`. At `k=alpha(H)`, its right side and `q_(k+1)` vanish. At the target put `k=p-1=a-3>=4`. If `k>alpha(H)`, both relevant `q` values vanish. Otherwise `2(alpha(H)-k)<=2((a-1)-(a-3))=4<=k`. All counts are nonnegative integers, so `q_p<=q_(p-1)` and `g_v<=0`. This is valid independently for every original leaf, including two or more leaves sharing a support. Summing once per favorable **leaf tag** preserves support multiplicity; an empty favorable set gives zero. No residual hypothesis, Hall injection, shifted selector, or floating arithmetic enters the implication. The source report's `p=1` discussion concerns a proposed broader auxiliary; eligibility keeps the primary at `p>=5`.

## Scope and inherited obstructions

The order-91 and order-243 controls with positive marked terms are at `(alpha,p)=(68,34)` and `(182,90)`, respectively, both below `3p>=2alpha+1`; they do not contradict the high-tail or target-rank pointwise inequality. At the target ranks 66 and 180, the pinned Cycle 1 synthesis records complete sums `-147807` and `-2947590`. Its eligible nonresidual 10-vertex example has `alpha=7`, `x=3`, `p=5`, six favorable tags and `S=-72`, so the proof must not rely on residuality; it does not. The controller's boundary note gives a positive marked term at `alpha=6,p=4`, but eligibility fails there (`x=4`), exactly the excluded low-alpha boundary. That note is an unadjudicated proposal, not a counterexample to the primary. The ordinary all-rank aggregate, governed RTree beta/support-fibre failures, top-rank residual theorem, forest extension and Erdős #993 headline remain separate scopes. The argument resolves only the frozen ordinary-tree first-interior claim informally.

This count follows the route proposed in `packets/C2-COMMON-NEUTRAL.md` and scoped in `control/C2-SCOPE-AUDIT.md`. The C2-U3 contribution is a self-contained proof candidate, particularly its direct `alpha>=7` exclusion, rather than a novelty or registry-status claim. I checked all four origin-file hashes against `packets/C2-CT-U3.json` and all 127 common historical pins against `packets/C2-T1-v2.json`; no mismatch was found. Sources used: `cycles/cycle-2/C2-U3/REPORT.md`, `RETURN.json`, `fresh_large_target.py`, `fresh_large_target.json`; `packets/C2-REVIEW-PROTOCOL-v2.md`, `C2-COMMON-NEUTRAL.md`, `C2-T1-v2.json`; `WORKER-PROTOCOL.md`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`; `control/C2-SCOPE-AUDIT.md`, `C2-CAPSULE-AND-COUNTEREXAMPLE-GATE.md`; `cycles/cycle-1/C1-SYNTHESIS/REPORT.md`; and `proposals/cycle2/controller/BOUNDARY-NOTE.md`. I did not consult current siblings or controller notes outside this pinned common authority.

## Exact numerical replay and fresh larger check

I copied the pinned origin evaluator into my assigned scratch as `replay_large_target.py` and ran it there; its JSON is byte-identical to the pinned origin result. The constructed `T_300` has 1203 vertices, `a=902`, `p=900`, `x=434`, 901 original leaves and 901 favorable tags. The marked term is `-403650`; each of 900 star-leaf terms is `-405447`; their complete sum is `-365305950`. Its program compares seven displayed graph polynomials against an explicit induced-forest dynamic program. This is substantial exact-integer corroboration, though the formulas and DP share basic polynomial arithmetic and are not two independent software implementations.

As a fresh beyond-243 target, I changed the owned copy to `m=83`, giving the self-built `T_83` of order 335. The replay reports `a=251`, `p=249`, first strict descent `x=120`, so `x+2<=p`; marked and star selectors are `-497` and `-250`. All `1+3(83)=250` original leaf tags are favorable. The marked term is `-30627`, and each of the 249 star-leaf terms is `-31122`; direct arithmetic gives `-30627+249(-31122)=-7780005`, exactly the complete reported sum. The same evaluator checked the whole and deletion polynomials against the explicit-graph forest DP. The graph recipe is in `fresh_target_335.py`, the exact row in `fresh_target_335.json`. Both checks are finite corroboration, not proof of the universal inequality.

Replay commands from the run root:

```sh
python3 scratchpad/C2-CT-U3/replay_large_target.py > scratchpad/C2-CT-U3/replay_large_target.json
python3 scratchpad/C2-CT-U3/fresh_target_335.py > scratchpad/C2-CT-U3/fresh_target_335.json
```

No Lean build was run. I started no background job; all evaluator processes exited successfully. All writes are confined to `scratchpad/C2-CT-U3/`.
