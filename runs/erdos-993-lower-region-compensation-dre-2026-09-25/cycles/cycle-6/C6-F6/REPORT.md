# C6-F6 search report

## Scope and route

This route tested the selector-transfer claim explicitly posed by the pinned non-star lead: for the equal-length-three rooted spider, an eligible rank selects all original endpoint leaves and yields a negative complete aggregate, with the proposed first-descent bridge (x(P)\ge m-1) as the key unresolved premise. This is an explicitly bounded audit of that claim, rather than a universal tree result or a primary-target counterexample.

The graph for each tested (m) has vertices (r,a_i,b_i,c_i) ((1\le i\le m)) and edges (ra_i,a_ib_i,b_ic_i). For (m\ge2), its original leaves are exactly (c_1,\ldots,c_m), each with its original support (b_i). Root conditioning predicts

\[
P_m(z)=(1+3z+z^2)^m+z(1+2z)^m,
\]
\[
I_{T_m-c_i}(z)=(1+2z)(1+3z+z^2)^{m-1}+z(1+z)(1+2z)^{m-1},
\]
\[
I_{T_m-\{b_i,c_i\}}(z)-I_{T_m-N[b_i]}(z)=z(1+3z+z^2)^{m-1}.
\]
The replay checks each displayed identity against an independently coded exact integer forest-DP on the literal graph and each deletion. It then determines (x) using zero-extended differences through the terminal rank, checks both eligibility guards, tests every endpoint's original-tree deletion selector, and sums all selected original-leaf tags separately (including their repeated support pattern).

## Bounded result

The exact boundary is (2\le m\le40), 39 graphs, with every integer rank satisfying (x(T_m)+2\le p) and (3p<2\alpha(T_m)+1) checked. There are 222 eligible ((m,p)) rows; (m=2,3,4,5) have none. In all 39 graphs, (|V|=3m+1), (α=2m), and the computed first strict descent is (x=m). In all 222 eligible rows, every one of the (m) distinct endpoint tags is selected, and the exactly summed (S(T_m,p)) is negative. The smallest eligible case is (m=6,p=8): every leaf deletion has Δ_8=-550, each of six summands is (-355), and (S=-2130). Full independence vectors, per-leaf selector values, supports, summands, and sums are recorded in `evidence.json`.

## What this establishes and what remains open

This computation supports the lead's selector-transfer behavior only on the stated finite family boundary. It finds no eligible positive aggregate and no failure of (x\ge m-1) there. The data do not prove (x(P_m)\ge m-1) for arbitrary (m), prove the all-(m) selection and sum claims, or establish the primary aggregate for arbitrary ordinary trees. No theorem import or universal conclusion is used. No primary-target refutation or proof is claimed.

## Reproduction

Run with `/Library/Frameworks/Python.framework/Versions/3.11/bin/python3 replay.py` from this worker directory. `replay.py` is self-contained and writes `evidence.json` beside itself. It uses only exact Python integer arithmetic; no random seed or external package is involved. Hashes for all 237 common packet pins were checked before using the assigned sources; all matched. Relevant mathematical input pins were the C6 non-star lead, source map, and `inputs/ordinary_tree_checked.py` graph conventions; this replay independently builds the displayed graph and DP.
