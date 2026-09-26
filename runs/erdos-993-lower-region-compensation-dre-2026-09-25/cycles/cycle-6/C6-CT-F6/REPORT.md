# C6-CT-F6 critique of C6-F6

## Disposition

**Retained** for the exact finite claim `C6-F6.SPIDER-SELECTOR-BOUNDED`. The bounded computation supports the stated result on the 39 equal-length-three rooted spiders with `2 <= m <= 40`; it makes no claim beyond this finite family.

## Independent audit

The graph recipe in the source is `r-a_i-b_i-c_i` for each branch. For `m >= 2`, its original leaves are exactly the distinct vertices `c_i`, with original supports `b_i`. Root conditioning gives

`P_T(z) = (1+3z+z^2)^m + z(1+2z)^m`.

For any endpoint leaf, its deletion polynomial is `A= (1+2z)Q^(m-1) + z(1+z)(1+2z)^(m-1)`, and the support versus closed-neighborhood difference is `zQ^(m-1)`, where `Q=1+3z+z^2`. The replay checks these formulas against exact forest dynamic programming on the literal graph and its deletions. In particular the second difference uses the original support and original closed neighborhood; every endpoint remains a separate summand.

I copied the sealed replay into this worker directory and ran it with the specified Python 3.11 interpreter. Its generated `evidence.json` matches the sealed evidence byte for byte. A separate check of the replay output confirmed 39 profiles, 222 eligible `(m,p)` rows, `alpha=2m`, `x=m`, the exact eligible-rank guards, all `m` endpoint tags selected in each eligible row, and each reported sum equal to the sum of its `m` summands and strictly negative. The first eligible case is `(m,p)=(6,8)`, with 6 terms of `-355` and full sum `-2130`. The replay's zero extension checks the descent through the terminal rank. The arithmetic for row counts also follows directly from `m+2 <= p` and `3p < 4m+1`.

## Scope and limitations

The disposition retains only this bounded, replayable census. It does not prove `x(P_m) >= m-1` for every `m`, the all-`m` selector-transfer consequence in the non-star lead, or the arbitrary ordinary-tree aggregate. There is no positive eligible example in this bounded family. No theorem import is used. The source-map graph pointers and the non-star lead were available; this audit does not claim those materials or a broader proof are absent.

## Evidence files

- `evidence.json`: replay output, with all independence vectors, selectors, endpoint tags, summands, and sums.
- `replay.py`: copied bounded replay source.
- `replay_stdout.json`: replay summary from this scratch copy.
