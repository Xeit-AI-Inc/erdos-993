# C1-U1 search report

`novelty_claimed: false`.

## Exact support-fibre representation

For a finite ordinary tree `T`, a support `s` of original leaves, and `lambda_s` leaves adjacent to `s`, remove `s`. For each non-leaf neighbor `u` of `s`, let `C_{s,u}` be the component of `T-s` containing `u`, rooted at `u`. Define independence polynomials

`A_s(z) = product_{u} I(C_{s,u};z)` and `B_s(z) = product_{u} I(C_{s,u}-u;z)`.

An empty product is `1`. Set

`H_s(z) = (1+z)^(lambda_s-1) A_s(z)`, `R_s(z)=B_s(z)`, and `Q_s(z)=H_s(z)-R_s(z)`.

These are the polynomials of `H_v` and `R_v` for every leaf `v` at `s`: after deleting `v,s`, the other `lambda_s-1` leaves are isolated and every non-leaf branch is a component `C_{s,u}`; deleting `N[s]` removes all branch roots `u`, leaving exactly `C_{s,u}-u` and deleting all leaves at `s`. The identities use original leaves/supports and preserve each leaf tag.

Partition independent sets of `T-v` by whether they contain `s`. If they omit `s`, they are counted by `H_s`; if they contain `s`, they avoid each leaf and branch root and are counted by `z R_s`. Thus

`I(T-v;z) = H_s(z) + z R_s(z)`.

Writing `[z^k]P` for a coefficient (zero outside the degree), a leaf at `s` is favorable at rank `p` exactly when

`[z^(p+1)]H_s + [z^p]R_s - [z^p]H_s - [z^(p-1)]R_s < 0`.

Its summand is exactly

`[z^p]Q_s - [z^(p-1)]Q_s`.

All leaves at one support therefore have the same favorable status and summand. The complete tagged-leaf sum can be grouped, without collapsing multiplicity, as

`S(T,p) = sum_{s: lambda_s>0} lambda_s * 1{[z^(p+1)]H_s+[z^p]R_s-[z^p]H_s-[z^(p-1)]R_s < 0} * ([z^p]Q_s-[z^(p-1)]Q_s)`.

This is a direct partition/counting proof for every integer `p`; it does not use the residual condition. In the target one substitutes the integer `p=alpha(T)-2` after checking `x(T)+2<=p`.

## What this does and does not resolve

This turns the question into a weighted sum of selected local coefficient slopes. The selector tests a different linear combination of the same two branch products than the slope being summed. The exact missing step is a global theorem relating those per-support selector inequalities to the weighted sum of the `Q_s` slopes at `p=alpha-2`, using tree structure and `x(T)+2<=p`. I found no such relation and no in-scope positive complete aggregate. The formula alone does not prove the sign.

I do not assume independence-sequence log-concavity or raw edge-difference monotonicity; the admitted registry refutes those universal shortcuts. I make no Hall/injection claim. The r26 top-rank residual identity/sign has different rank and extra residual hypothesis and supplies no step here. In particular, no residual premise has been added to the primary target.

## Exact arithmetic checks

Copied the admitted `ordinary_tree.py` to this seat's scratch and used its forest DP, with a local first-descent scan that includes terminal `k=alpha` as required by the semantic contract. The local script is `scratchpad/C1-U1/check_path.py`; run it from the run root with:

`python3 scratchpad/C1-U1/check_path.py`

Its deterministic JSON output is `scratchpad/C1-U1/exact-replays.json`. On both examples the script checks the coefficient identity `I(T-v)=I(H_v)+zI(R_v)` and the `Q`-slope expression against the deletion definitions, then lists every original leaf, exact selector value, every summand, `alpha`, first strict descent, eligibility, and complete sum.

* `P_100`, edges `(i,i+1)` for `0<=i<99`: `alpha=50`, `x=28`, `p=48`, eligible; both endpoint leaves are favorable, each selector is `-269450`, each summand is `-2329460`, so the complete sum is `-4658920`.
* A newly specified 91-vertex tree: hub `0` is adjacent to supports `1,...,30`, and each support is adjacent to two distinct leaves (leaf ids `31,...,90`, two consecutive ids per support). Here `alpha=61`, `x=30`, `p=59`, eligible. All 60 original leaves are separately favorable with selector `-60`; every tagged leaf has summand `-1738`; the complete sum is `-104280`. This checks the repeated-tag weight `lambda_s=2` on 30 supports.

These are fresh larger examples validating the representation and contract arithmetic, not evidence for a universal sign. No exhaustive order range was searched. No Lean build was run (none is assigned in this search stage).

## Status and remaining work

The support-fibre identity is established by the partition proof above (`proposed_proved_informal`). The primary universal statement remains OPEN (`proposed_open`): no complete proof, counterexample, Lean result, or additional hypothesis-free aggregate bound was obtained. The immediate useful follow-up is to prove or refute a tree-specific inequality for the selected weighted `Q_s` slopes; a proposed bound must be tested against the admitted positive local support-fibre examples and the inherited log-concavity, Hall, and monotonicity fences before being treated as a mechanism.
