# C5-F3 search: asymmetric selected neighborhood budget

## Result

I evaluated the lower-region selector and the marked-neighborhood budget on an explicit asymmetric ordinary tree. The exact full sum is negative, and the matching-slack identity closes numerically on every selected leaf. This is a bounded computation, not evidence for all ordinary trees. The exact graph and a replay program are in `EVIDENCE.json` and `REPLAY.py`.

The graph has vertices `0,...,12` and edges

```text
01, 12, 03, 34, 35, 06, 67, 68, 09, 9-10, 9-11, 9-12.
```

Equivalently, root 0 has a path `0-1-2` and three other branches whose support vertices have respectively 2, 2, and 3 terminal leaves. The unequal branch sizes make the tree asymmetric. Its independence vector is

```text
i_j(T), j=0,...,9 = (1, 13, 66, 173, 258, 231, 131, 47, 10, 1).
```

Thus `a=9`, `x=4`, `i_x=258`, and `i_(x+1)=231`; scanning the zero-extended vector through rank `a` gives the first strict descent at 4. The tested rank is `p=6`: `p>=x+2` and `3p=18<19=2a+1`. Here `k=p-1=5` and the budget coefficient `2a+1-3p` is 1.

## Selector and full sum

The original leaves are exactly `2,4,5,7,8,10,11,12`. Their respective values of `Delta_6(T-v)` are

```text
v:                 2    4    5    7    8   10   11   12
Delta_6(T-v):    -46  -38  -38  -38  -38  -31  -31  -31
```

All eight leaves are favorable, so this fixture does not provide a proper-selector witness. The eight selected summands, in the same order, are

```text
-14, -35, -35, -35, -35, -51, -51, -51,
```

and the complete aggregate is `S=-307`.

## Neighborhood and matching-slack counts

For each selected leaf `v`, the replay constructs `H_v=T-{v,s_v}`, `R_v=T-N[s_v]`, and `W_v=N(s_v)-{v}` in the original tree. It computes `q_v(j)=i_j(H_v)-i_j(R_v)` by exact integer counts; `E_v` is the sum of actual addable vertices over marked independent `k`-sets in `H_v`; `C_v` counts marked independent `(k+1)`-sets meeting `W_v` at least twice, once per leaf tag; and `D_v=2(a-1-k)q_v(k)-E_v`. The row below records `(q_v(k), q_v(k+1), E_v, C_v, D_v, summand)`.

| Leaf tags | Per-tag tuple | Number of tags |
|---|---:|---:|
| `2` | `(35, 21, 105, 0, 105, -14)` | 1 |
| `4,5,7,8` | `(69, 34, 185, 15, 229, -35)` | 4 |
| `10,11,12` | `(89, 38, 223, 33, 311, -51)` | 3 |

Summing over the fixed selector gives

```text
Q=578, U=271, E=1514, C=159, D=1954, S=-307.
```

The exact incidence count checks as `E=kU+C=5*271+159=1514`. The selected budget margin is

```text
D+C-(2a+1-3p)Q = 1954+159-1*578 = 1535 = -kS.
```

This fixture illustrates the required global accounting, including all original leaf tags and the deleted leaf/support in each `H_v`. Its positive margin is consistent with the primary assertion and does not establish the budget for other trees.

## Bounded selector search

`REPLAY.py` also reproduces two finite probes. First, it samples 5,000 Prüfer sequences using Python's `random.Random(993)`, with order drawn uniformly from `10,...,17` and each sequence entry drawn uniformly from the corresponding vertex set. Among 98 eligible `(tree,p)` rows with a nonempty selector, none had both favorable and nonfavorable original leaves. Second, it exhausts all 342 ordered asymmetric profiles with `m=3,4,5` root-adjacent star branches, each branch size in `{2,3,4}`, preceded by the distinguished path `0-1-2` (constant profiles are excluded). Those profiles contain 536 eligible rows, again with no proper selector.

For this profile search, an eligible row satisfies `x+2<=p` and `3p<2a+1`; only rows with nonempty `F(T,p)` are counted. The first search is a reproducible sample, not an exhaustive tree census. Neither probe implies that a proper favorable selector cannot occur.

## Limits

- No proper-selector example or counterexample to the primary aggregate was found.
- The finite sample and profile box do not cover all ordinary trees, orders, or eligible ranks.
- The budget identity is verified arithmetically for this fixture; no general charging inequality is proved.
- No literature theorem is imported, and no status or award is claimed.
