# C1-CT-F2 constructive critique of C1-F2

Seat C1-CT-F2; cycle 1; critique; T orientation. **novelty_claimed: false.** All conclusions below are proposed worker findings. The primary all-tree interior inequality remains open: this critique supplies neither its general proof nor a positive eligible complete sum. I read only the assigned C1-F2 packet, the review/worker/semantic/solution contracts, and the common historical source authority allowed through `packets/C1-T1.json`. Original source citations below refer to the admitted files in `cycles/cycle-1/C1-F2/` and `sources/`; all executed scripts were copied to this seat's scratchpad first. No Lean build was run.

## Disposition of C1-F2-RESIDUAL-SCOPE-GAP: proposed retained, narrowed to the pinned graph

The **edge list printed in `cycles/cycle-1/C1-F2/REPORT.md` is erroneous for its stated certificate**. It is exactly the first eligible example's edge list in `cycles/cycle-1/C1-F2/random-search-summary.json`, not the graph in `cycles/cycle-1/C1-F2/nonresidual-example.json`. For the printed edges `{0-8,1-2,2-5,3-7,3-8,4-8,5-8,6-8,7-9}`, independent enumeration gives polynomial `(1,10,36,62,58,32,9,1)`, leaves `[0,1,4,6,9]`, selector `[0,1,4,6,9]`, summands `[-16,-7,-16,-16,-7]`, `S=-62`, and a unique maximum independent set `[0,1,3,4,5,6,9]`. It is residual. In particular the report's listed leaf 8 has degree five in that graph. Thus the printed graph does not prove the scope gap.

The **correct pinned non-residual witness** in `cycles/cycle-1/C1-F2/nonresidual-example.json` has vertices `0..9` and edges

`{0-3,1-6,1-9,2-6,3-5,3-7,3-8,4-6,6-7}`.

Direct enumeration from these edges gives polynomial `(1,10,36,62,61,37,13,2)`, `alpha=7`, `p=5`, and first strict descent `x=3`, hence `x+2=p`. Its original leaves are `[0,2,4,5,8,9]`, all favorable: their selector differences are `[-9,-10,-10,-9,-9,-14]`. In the same order, `(Delta_4(H_v),Delta_4(R_v),g_v)` are `(-15,0,-15)`, `(-14,-1,-13)`, `(-14,-1,-13)`, `(-15,0,-15)`, `(-15,0,-15)`, and `(-10,-9,-1)`. The complete leaf-tagged sum is `-72`. The maximum independent sets are `[0,1,2,4,5,7,8]` and `[0,2,4,5,7,8,9]`; leaf 9 is omitted by the first. The edge count is nine and breadth-first traversal reaches all ten vertices, so this is an ordinary tree. `scratchpad/C1-CT-F2/independent_audit.py` enumerates every independent subset of each induced graph, and its saved result is `independent-audit.json`; this is separate from the source's `verify_nonresidual.py` replay. The source verifier's generated JSON also reproduced byte for byte when copied and run locally.

The repaired claim is an **exact single-tree coverage obstruction**: the historical r26 theorem is for residual trees at `p=alpha-1` (`sources/public/experiments/r26-top-rank-residual-sign.md`); this witness lies outside its residual class and at `p=alpha-2`. Its negative sum supports no refutation of the current target. Even a residual example would still face the top-rank/interior mismatch.

## Disposition of C1-F2-NEGATIVE-BOUNDED-SEARCH: proposed retained, narrowed to audited scope

Copied `random_search.py` gives 120 seeded Prüfer draws at each order 8 through 45, exactly 4,560 samples, of which 3,840 are eligible; it reports zero positive complete sums and zero positive selected summands. `random-search-summary.json` was reproduced byte for byte. This is a replay of the source algorithm, not an independent resampling or exhaustive search. Independently enumerating the five saved eligible example graphs verifies their `alpha`, `x`, `p`, selectors, summands, and sums; see `crosscheck.py` and `crosscheck.json`. The code uses signed integer differences, original leaves, original supports, original closed-neighborhood deletion, strict `Delta_p(T-v)<0`, and sums all selected leaf tags. The negative result has only the specified sampled scope.

Copied `exhaustive_small.py` reproduces `exhaustive-small-summary.json` byte for byte. Its Prüfer enumeration is complete for orders **2 through 7** and finds no eligible tree. The `n=1` branch is a coding mistake: it passes the empty Prüfer sequence to `prufer_tree`, which constructs the two-vertex tree, so its row labelled `n=1` did not check the one-vertex graph. The one-vertex graph is independently ineligible (`alpha=1`, `p=-1`), repairing the stated through-order-7 conclusion without treating that row as computation. The source's `family-sweep.json` has 100 rows while the described/replayed `search.py` generates 60; its first 60 agree with the copied DP replay and independent factorized evaluator. The claim only invokes `m=1..60`, so the extra 40 source rows are outside this disposition.

For the root-plus-three-leaf-star family, the source `search.py`/`ordinary_tree_copy.py` tree DP and `verify_large_family.py` factorized evaluator were copied and run in this scratchpad. Their saved rows for `m=22,60`, as well as the other `m=1..60` factorized rows, reproduce the admitted bytes. A separate evaluator in `independent_audit.py` agrees on all 60 parameter rows, including selector differences and all summands. At `m=22`: order 91, `alpha=68`, `p=66`, `x=32`, selector differences `(-131,-67)` for marked/branch leaves, terms `(-2079,-2208)` with 66 branch-leaf tags, and `S=-147807`. At `m=60`: order 243, `alpha=182`, `p=180`, `x=87`, selector differences `(-359,-181)`, terms `(-15930,-16287)` with 180 branch-leaf tags, and `S=-2947590`. Both are eligible. These are target ranks; historical T22/T60 positive pointwise or support-fibre examples at ranks 34/90 in `control/REJECTED-MECHANISMS.json`, `sources/public/experiments/r24-direct-favorable-leaf-aggregate.md`, and `sources/standing-controls/t22-order91.json`/`t60-order243.json` do not contradict them. This seat proposes no global pointwise, support-fibre, Hall, log-concavity, real-rootedness, `N2<=M`, or arbitrary-convolution mechanism. Hence those inherited refutations remain fences, not counterexamples to this family calculation.

## New exact family lemma C1-CT-F2-FAMILY-SIGN

The bounded family check admits a short symbolic repair, valid for **every integer `m>=2`**. Let `A=1+z`, `Q=A^3+z=1+4z+3z^2+z^3`, and `n=3m`. The graph is exactly the source's root `0`, marked path `0-1-2`, and `m` root-adjacent centers each with three leaf neighbors. Conditioning on whether the root is included gives

`P_T=(1+2z)Q^m+z A^(n+1)`.

The `z^(n+2)` coefficient is one and no higher term occurs, so `alpha=n+2` and the target rank is `p=n`. For the marked leaf, deleting it gives `D_M=A Q^m+z A^n`, while `H_M-R_M=z A^n` at the polynomial level. For any branch leaf, set `Q'=A^2+z`. Deleting it gives `D_B=(1+2z)Q'Q^(m-1)+z A^n`; the difference of the two witness polynomials is

`P_(H_B)-P_(R_B)=(2z+5z^2+2z^3)Q^(m-1)+z A^n`.

Taking exact coefficients yields `Delta_n(D_M)=1-6m<0`, `Delta_n(D_B)=-3m-1<0`,

`g_M=Delta_(n-1)(H_M-R_M)=-(9/2)m(m-1)`, and

`g_B=Delta_(n-1)(H_B-R_B)=3-6m-(9/2)m(m-1)`.

The fractions are integers because `m(m-1)` is even. All `1+3m` original leaves are favorable, with each branch leaf counted separately. Consequently

`S=-(9/2)m(m-1)+3m[3-6m-(9/2)m(m-1)]<0` for every `m>=2`.

Eligibility is also exact, without assuming a numerical `x`. Write the top deficits of `Q^m` as `a_1=3m`, `a_2=4m+9*binom(m,2)`, and `a_3=m+12m(m-1)+27*binom(m,3)`. Expanding `P_T` at ranks `n-2,n-1` gives

`Delta_(n-2)(T)=a_1+a_2-2a_3+binom(n+1,3)-binom(n+1,4)`

`=5m-(39/2)m(m-1)-54*binom(m,3)+binom(n+1,3)-binom(n+1,4)<0`.

Indeed the first three terms are negative for `m>=2`, while `binom(n+1,3)<=binom(n+1,4)` since `n+1>=7`. Thus the first strict descent `x<=n-2`, so `x+2<=p=n`. The family sign is an infinite exact **restricted lemma**, not a proof of the all-tree target. The small case `m=1` has `p=3,x=2` and is ineligible. The independent integer implementation checks `m=1..60` but the lemma's all-`m` force comes from the displayed coefficient identities, not that check. No Lean gate was assigned.

## Reproduction and limits

From the run root, execute `python3 scratchpad/C1-CT-F2/independent_audit.py` and `python3 scratchpad/C1-CT-F2/crosscheck.py`. The copied source scripts may be replayed there with `verify_nonresidual.py`, `verify_large_family.py`, `search.py`, `exhaustive_small.py`, and `random_search.py`; their individual stdout receipts are `replay-*.log`. The five generated JSON files named in the preceding paragraphs matched their pinned source counterparts byte for byte. All jobs have exited; no owned background job remains.

The corrected witness is a scope gap only. The sampled and finite searches cannot establish the universal inequality. The exact family lemma handles only the stated root-plus-stars shape. No formal proof or primary counterexample is claimed.
