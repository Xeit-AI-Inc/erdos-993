# Independent exact replay

Replay method: direct Python integer binomial coefficients with zero extension, using only the formulas stated in the pinned C2-F4 report. No sealed source code was executed or modified.

For v=11, p=8:

- Tree coefficient vector i_0 through i_12: `1,14,78,275,660,1122,1386,1254,825,385,121,23,2`.
- Zero-extended differences Delta_0 through Delta_12, including terminal descent: `13,64,197,385,462,264,-132,-429,-440,-264,-98,-21,-2`.
- Therefore x=6, alpha=12; `p=x+2` and `3p=24<25=2alpha+1`.
- A-leaf deletion: Delta_8=-275. Each B-leaf deletion: Delta_8=-185. Thus all 12 distinct original leaves satisfy the strict selector.
- A-leaf contribution is 0. Each of the eleven B-leaf tags contributes `q_8-q_7=285-540=-255`.
- Exact complete sum: `0+11*(-255)=-2805`.

The replay used the explicit coefficient formulas, not a graph census. As a consistency check on the family sign boundary, the expression `v^2-ceil(v/2)*(v+2)-2*ceil(v/2)^2` was negative for every tested integer v=8..200; the report supplies the symbolic parity calculation for all v>=8, which is the proof and not the bounded check.
