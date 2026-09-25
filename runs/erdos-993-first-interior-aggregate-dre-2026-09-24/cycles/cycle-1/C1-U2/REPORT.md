# C1-U2 cycle 1 report: local top-shell reduction at the first interior rank

## Result and scope

This seat did not prove or refute the universal sign. It proves an exact, residual-free local reduction that sharpens where the gap is. For every original leaf `v` of a finite tree `T`, with support `s`, put

- `H = T - {v,s}`;
- `W = N_T(s) - {v}` (the other neighbors of `s`, all vertices of `H`);
- `R = H - W = T - N_T[s]`;
- `a = alpha(T)-1` and, at the target rank, `p = alpha(T)-2 = a-1`.

Then `alpha(H)=a`, without any residual-leaf assumption. Define

`q_v(j) = i_j(H)-i_j(R) = #{A subseteq V(H): A independent, |A|=j, A intersects W}`.

The exact target summand and the favorable selector become

`g_v = q_v(a-1)-q_v(a-2)`,

`v is favorable iff Delta_(a-1)(H)+Delta_(a-2)(R)<0`.

Consequently the complete target is the tagged signed cardinality difference

`S(T,alpha-2) = |{(v,A): v in F_p(T), A independent in H_v, |A|=a-1, A meets W_v}|`

`                              - |{(v,A): v in F_p(T), A independent in H_v, |A|=a-2, A meets W_v}|`.

Each leaf is a distinct tag, including leaves at one support. This is an identity, not an injection/Hall assertion. The missing central step is exactly a cardinality comparison between these two tagged near-maximum shells after selection by the strict delta condition. No such comparison is proved here.

## Proof of the local reduction

An independent set in `H` can be enlarged by adding `v`, because the only neighbor of `v` is the deleted vertex `s`. Hence `alpha(T) >= alpha(H)+1`. Conversely, let `Q` be independent in `T`. If `v` is in `Q`, then `Q-{v}` lies in `H`. If neither `v` nor `s` is in `Q`, then `Q` lies in `H`. If `s` is in `Q`, then `Q-{s}` contains no vertex of `W` and lies in `H`. In all cases `|Q| <= alpha(H)+1`. Thus `alpha(T)=alpha(H)+1`, so `alpha(H)=a` and `p=a-1`.

Every independent set of `H` of size `j` is either disjoint from `W`, in which case it is an independent set of `R`, or meets `W`. These alternatives are disjoint and exhaustive; hence `q_v(j)` is exactly the number of independent `j`-sets of `H` meeting `W`. From the contract definition,

`Delta_(p-1)(H)-Delta_(p-1)(R)`
` = (i_p(H)-i_(p-1)(H))-(i_p(R)-i_(p-1)(R))`
` = q_v(p)-q_v(p-1)`.

For the selector, partition independent sets of `T-v` according to whether they contain `s`. The sets omitting `s` are the independent sets of `H`; the sets containing `s` are `{s}` joined to an independent set of `R`. Thus `I(T-v,z)=I(H,z)+z I(R,z)`, so coefficient extraction gives

`Delta_p(T-v)=Delta_p(H)+Delta_(p-1)(R)`.

Substitute `p=a-1` to obtain the stated strict favorable condition. All identities use ordinary integer counts; no sign property, log-concavity, or residual premise was inserted.

There is also an exact per-leaf distinction explaining why the r26 result does not close this rank. A maximum independent set avoiding `v` must contain `s`; after deleting `s` it is a size-`a` independent set in `R`. Conversely, an independent size-`a` set in `R` together with `s` is a maximum set of `T` omitting `v`. Therefore `v` is residual (belongs to every maximum independent set) iff `alpha(R) <= a-1`; it is non-residual iff `alpha(R)=a`. For a residual leaf, `alpha(T-v)=a`, and the selector `Delta_(a-1)(T-v)` is at the top difference of `T-v`. For a non-residual leaf, `alpha(T-v)=a+1`, and the same selector is one rank below its top difference. The all-leaf target permits both cases and their tags can coexist. The r26 identity `(RI)` requires all original leaves to be residual and concerns rank `alpha-1`; neither hypothesis is supplied here.

## Fresh larger constructed test and replay

I constructed the admitted `T_m` family from the `t_family` definition in `sources/standing-controls/ordinary_tree.py`, with `m=100`; this is order `4m+3=403`, beyond the order-243 `T_60` fixture in `sources/standing-controls/t60-order243.json`. I copied the evaluator into this seat's scratch before the first family scan. The family scan checked `m=1..40,50,60,80,100`; the cycle-wide table is `scratchpad/C1-U2/fresh_T_family_test.json`. The fresh larger row was independently rebuilt by the self-contained recurrence in `scratchpad/C1-U2/independent_T100_replay.py`, with output `scratchpad/C1-U2/independent_T100_replay.json`.

At `T_100`, exact recursive integer DP gives `alpha=302`, `x=145`, `p=300`, so `x+2=147<=300`; there are 301 original leaves and all 301 are favorable. The complete sum is `-13,588,650`. The marked pendant leaf contributes `-44,550`; each of the other 300 leaves contributes `-45,147`. The independent replay checked for every original leaf that `alpha(H)=301`, `Delta_300(T-v)=Delta_300(H)+Delta_299(R)`, and `g_v=q_v(300)-q_v(299)`; it also recomputed the strict selector, including the terminal zero-extended coefficient difference when locating `x`. Commands from the run root:

```sh
python3 scratchpad/C1-U2/fresh_T_family_test.py > scratchpad/C1-U2/fresh_T_family_test.json
python3 scratchpad/C1-U2/independent_T100_replay.py > scratchpad/C1-U2/independent_T100_replay.json
```

The second program has no import of the admitted evaluator. It rebuilds the edge list, forest component polynomials, alpha, first strict descent, each deletion graph, selector and local reduction from its own code. These are exact computational corroborations of the identity and target arithmetic on this constructed eligible row only, not universal evidence and not a target counterexample.

## Applicable inherited obstruction checks

- The exact r26 result `E993-R26-TOP-RANK-RESIDUAL-SIGN` is confined to `p=alpha-1` plus residual leaves. Its `(RI)` premise fails exactly for non-residual tags (`alpha(R)=a` above); it is not transferred. The r26 family-count facts `N2 <= k2*M` also depend on its residual near-maximum-shell argument. The false `N2 <= M` shortcut is explicitly not used; the registry records its order-9 counterexample.
- Pointwise `(beta)` and per-support aggregate nonpositivity are refuted at their own scopes. The registered pointwise witness includes `T_22`, order 91, `p=34`; the support-fibre counterexample is the same family/rank and has a positive singleton-support fibre. These forbid replacing this complete signed difference by an assumed pointwise or supportwise sign. They do not refute the complete target. In `T_100`, individual summands happen to be negative; that is a property of this test only.
- The literal fixed `Delete/Retag` all-cut Hall mechanism is refuted by the order-91 `T_22` row at `p=34`, even though the complete aggregate on that row is negative. Universal tag-closed-cut Hall is also refuted by the order-1567 choked-broom witness at `p=492`. The displayed `q` identity counts tagged source and target sets but makes no claim that a particular deletion/retag relation is left-total, Hall, or injective. Thus it does not revive either obstruction.
- Universal tree log-concavity/TRS2 and real-rootedness are refuted from order 26. No such premise is used: all operations above are signed finite coefficient identities. The raw edge-difference monotonicity, same-leaf extraction from marginals, cover-diagonal `d`, arbitrary unimodal-convolution, and `N2<=M` mechanisms are likewise not used or asserted. The support/selector exact local recurrence here is not a sign-monotonicity lemma.

These distinctions are supported by the admitted `control/REJECTED-MECHANISMS.json`, `control/SCOPE-AUDIT.md`, `sources/public/experiments/r26-top-rank-residual-sign.md`, and `sources/public/proofs/lean/r26-c1-la1-top-rank-residual-sign/INFORMAL-PROOF.md`. The registry's `E993-BETA-TARGET` ordinary-tree wording retains the source's governed-`RTree`/D9 bridge caveat; its inherited witness is cited only as a method fence, not as a literal ordinary-tree counterexample to this contract.

## Status and limitations

This yields a proved residual-free exact reduction and a precise split between residual and non-residual favorable tags. It neither signs the two-shell difference nor establishes a matching between its shells. The `T_m` scan is a one-parameter family scan, not a census of all trees. No Lean build was run (cycle-1 search seat), no universal computational sweep was attempted, and no claim about TREE, FOREST, TRANSFER, `E993-BETA-AGG`, or Erdős #993 follows. Novelty is not claimed. All owned commands have completed; no background job remains.
