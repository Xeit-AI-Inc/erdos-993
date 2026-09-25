# C2-CF-T1: falsification critique of the tagged-shadow count

## Proposed disposition

**Retain** the sole incoming claim `C2-T1-EXACTID-E993-BIPARTITE-TAGGED-SHADOW-BOUND` at its exact registered scope, as an informal finite-set proof. I found no missing premise or counterexample. This is a proposed critic disposition, not a registry update or Lean award. The registered identity was OPEN in `control/C2-REGISTERED-CLAIM-IDENTITY.json` and its exact scope was fixed in `control/C2-SCOPE-AUDIT.md` §1. The primary aggregate remains OPEN because this claim does not establish the separate eligibility guard.

I verified SHA-256 for every origin file named in `packets/C2-CF-T1.json`; all four matched. The origin evidence inspected was `cycles/cycle-2/C2-T1/{REPORT.md,RETURN.json,check_tagged_shadow.py,checks.json}`. The original script was read but not executed in place. The fresh check below used only my own `larger_check.py`.

## Hostile proof audit

Let `H` be a finite bipartite simple graph, `W⊆V(H)`, `a=α(H)`, and `1≤k≤a`. Let `q_j` count independent `j`-sets intersecting `W`. For the incidence set

`I={(X,u): X independent, |X|=k+1, X∩W≠∅, u∈X, (X\{u})∩W≠∅}`, 

the left degree of a tagged `X` is `k` when `|X∩W|=1` and `k+1` when `|X∩W|≥2`. Thus `|I|≥k q_(k+1)`; neither deletion can make an independent set non-independent nor duplicate its distinguished deleted vertex.

For each tagged independent `k`-set `J`, let `A(J)` be its addable vertices outside `J`. The right degree in `I` is exactly `|A(J)|`: the retained tag in `J` ensures every such extension is counted. The union of `J` and any independent subset of `H[A(J)]` is independent, hence `α(H[A(J)])≤a−k`. Any bipartition of `H[A(J)]` has a side of size at least `|A(J)|/2`, even with isolated vertices or disconnected components. Therefore `|A(J)|≤2(a−k)`. Summing right degrees gives `|I|≤2(a−k)q_k`. Combining both bounds proves the integer inequality. This reasoning covers nonempty and empty `W`, disconnected `H`, and `k=a`; if `a=0` no admissible `k` exists. No division by `q_k` occurs.

I tried to break the extension step by allowing multiple tags, isolated vertices, and disconnected components. Multiple tags only increase left degrees; isolated vertices remain inside a bipartition and its independent side; disconnection changes neither the disjoint-union independence argument nor the side bound. The proof uses global `a=α(H)`, not the independence number of `H−W`. Replacing the latter would be unjustified. The bipartite premise is genuinely used in `|V(B)|≤2α(B)`; it cannot be dropped from this proof.

The origin's P4 equality check is exact: edges `02,03,12`, `W={1}`, `a=2`, `q_1=1`, `q_2=2`, and at `k=1` both sides are 2. Thus a strict version is false even for a connected tree. The origin's 682-graph/6,568 graph-tag sweep and order-24 `K_{11,13}` calculation are finite corroboration, not its proof; `check_tagged_shadow.py` matches the stated definitions upon inspection.

## Fresh larger falsification and sharpness

The order-245 graph `122K2 ⊔ K1`, with `W` equal to the isolated vertex, is bipartite and has `a=123`. A tagged independent `j`-set includes that vertex and selects one endpoint from each of `j−1` selected edges, so exactly

`q_j = C(122,j−1) 2^(j−1)` for `1≤j≤123`, with zero extension.

The binomial identity `k C(122,k)=(123−k) C(122,k−1)` makes `k q_(k+1)=2(123−k)q_k` at **every** `1≤k≤123` (positive equality through `k=122`, zero at `k=123`). This exceeds the inherited order-243 witness size and tests the coefficient at all ranks. As a connected-tree stress check, `P245` has `a=123`; independent-set polynomial recurrence and subtraction of the polynomial after deleting tags checked all `123` ranks for `W=∅`, all vertices, both endpoints, the center vertex, and all odd-index vertices, without a violation. The recurrence is implemented in my scratch `larger_check.py`; exact outputs are in `larger_check.json`. Replay from the run root: `python3 scratchpad/C2-CF-T1/larger_check.py > scratchpad/C2-CF-T1/larger_check.json`. The algebraic incidence proof, not these calculations, carries the universal conclusion.

## Scope, bridge, and inherited fences

The exact identity in `control/C2-SCOPE-AUDIT.md` §1 is a bound for *tagged counts in any bipartite graph*. It does not assert a pointwise addability cap in a G1 residual. The refuted `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` has full ordinary G1 tuples and each residual independent set as its scope; it cannot refute this average incidence inequality. The refuted `E993-BETA-TARGET` and `E993-BETA-AGG-SUPPORT` involve different unrestricted coefficient or support-fibre signs. `control/C2-SCOPE-AUDIT.md` §2 places the order-91 `T_22,p=34` and order-243 `T_60,p=90` margins below the proposed high-tail guard, respectively `3p=102<135≤2α+1` and `3p=270<361≤2α+1`. These fences remain intact. The refuted literal Delete/Retag Hall and hot-tag cut mechanisms concern a different relation, not this inclusion count. None of these obstructions licenses extending the retained bound beyond bipartite graphs or awarding the primary aggregate.

The origin's conditional leaf translation is correct within its stated ordinary bipartite scope: for an original leaf `v` and support `s`, `H=G−{v,s}`, `W=N_G(s)\{v}` inside `H`, and `R=G−N_G[s]=H−W`, so `q_j=i_j(H)−i_j(R)`. Since `v` can be adjoined to every independent set in `H`, `α(H)≤α(G)−1`. With `p≥2`, `k=p−1`, and `3p≥2α(G)+1`, one gets `2(α(H)−k)≤k`; if `k≤α(H)`, the retained bound yields `q_p≤q_(p−1)`, and if `k>α(H)`, both terms vanish. At `p=1`, the guard forces `α(G)≤1`; an existing degree-one vertex then makes `G=K2` and `H=R=∅`, so the sign is zero. This confirms a conditional consequence, not a second incoming claim or an independent formal award.

At the primary rank `p=α(T)−2`, the guard is equivalent to `α(T)≥7`. The separate registered `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` is still OPEN. The origin therefore cannot conclude every eligible tree satisfies the complete favorable-leaf sum. Its proof never uses or shifts the favorable selector, and makes no assertion about residual trees or the r26 top-rank theorem. A later composition must preserve integer `p`, strict first descent, original leaves and support neighborhoods, one summand per original leaf, and the complete favorable set as required by `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`.

## Execution limits

No Lean build or source script execution was performed. The fresh recurrence checks only the two stated order-245 graphs and listed tag sets; its scope is explicit. No background jobs were started, so none remain active. All my output files are confined to `scratchpad/C2-CF-T1`.
