# C6-CT-F3 critique (orientation T)

## Disposition

**retained_narrowed; proposed status: proposed_open.** The case's universal arity-2..12, `m >= 100000000` path-plus-private-star conclusion is not established by the route evidence reviewed here. The disposition is narrowed to the reproducible finite factor arithmetic, cutoff scalar, and bounded graph-fidelity checks recorded in `EVIDENCE.json`. This is not a counterexample to the family statement.

## Checks performed

All four case pins and all 237 common-source pins matched. I read the exact common source-map entries for the grouped marked factors, wide-arity candidate, ULC source bridge, and the critic brief's specified proof obligations.

I copied the sealed route replay into this scratch directory and ran that copy with the specified Python 3.11 executable. Its exact-integer assertions pass for all 121 products `F_r B_s`, `2 <= r,s <= 12`, and the scalar `9 m C epsilon < 1` at `D=12`, `h=17`, `m=100000000`; it reports `0.013328111998270626`. Order exceeding degree is permitted by the cited ULC definition. Gurvits, Definition (2), Theorem 1.1 and Remark 1.2 define ULC of order `d >= degree` and give convolution closure with orders added; this supports the proposed factor-closure step when the individual factor inequalities and supports hold ([primary source](https://arxiv.org/abs/0804.1181)). It does not establish the remaining family estimates.

I independently constructed two small trees from the stated graph recipe and enumerated their vertex subsets. For arity `[12]`, this confirmed `n=16`, `alpha=14`, `x=7`; at the eligible `p=9`, all 13 original leaves, including endpoint 2, are selected, and the complete tagged sum is `-9141`. This matches the route's finite example. For profile `[2,3]`, the computed `n=10`, `alpha=7`, `x=3` and there are no eligible ranks. The enumeration checked the stated independence-polynomial formula on these examples only.

## Proof audit and limits

The selector logic is coherent at the level stated: if the central strict-descent transfers to each deletion polynomial, then ranks `p-2 >= x` are available for the summand sequence, while positive mixed minors transfer the first strict descent and log-concavity propagates later descent. The graph formulas preserve the endpoint tag and each private-tip tag; the endpoint term cannot be dropped merely because its individual summand may have a different sign.

I did not independently establish the candidate's full coefficientwise perturbation envelopes, all shifted-index inequalities, or the uniform mixed-minor positivity across every profile and eligible rank. The cutoff scalar and finite factor table alone do not imply these statements. Accordingly, I found no decisive defect in the route's bounded evidence, but the essential infinite-family bridge remains unreviewed/unproved in this critique. No arbitrary-tree conclusion follows. This is a proof gap and a limitation of review, not a mathematical counterexample.

## Evidence files

- `replay_copy.py`, `replay_stdout.json`: copied replay and exact run output.
- `graph_check.py`, `graph_check.json`: independent bounded graph enumeration.
- `EVIDENCE.json`: hash, arithmetic, graph-check, citation, and limitation summary.
