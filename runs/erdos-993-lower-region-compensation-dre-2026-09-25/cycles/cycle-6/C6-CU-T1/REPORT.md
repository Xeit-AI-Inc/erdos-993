# C6-CU-T1 critique of C6-T1

## Dispositions

- `C6-T1-TM-CUTOFF400` — **retained** at the source claim's exact scope: the explicitly defined homogeneous family `T_m`, all eligible strict lower-region ranks, and the complete original-leaf sum. It does not imply the arbitrary-tree aggregate.
- `C6-T1-TM-DIRECT-FIRST-DESCENT` — **retained**: for `m >= 2`, `x(T_m) >= m+1`; `m=1` is a separate exact ineligible case.

These are proposed worker dispositions only.

## Independent checks

All 4 case-source pins and all 237 common-source pins matched their listed SHA-256 values. I read the required common first-read sources, the critic brief, the exact `T_m` source-map entries, and only the four case-listed `C6-T1` files. The source map identifies the relevant coefficient candidate and primary ULC bridge; neither a graph nor the cited theorem is unavailable.

The graph has one root-adjacent `P3` arm with endpoint leaf `a`, plus `m` root-adjacent `K_{1,3}` arms. Its original leaves are `a` and the `3m` private tips, with their original supports. Root splitting gives

`P=(1+2z)(1+4z+3z^2+z^3)^m + z(1+z)^(3m+1)`, `alpha=3m+2`.

The endpoint deletion polynomial is `A0=(1+z)B^m+z(1+z)^(3m)`, and each private-tip deletion polynomial is `Astar=(1+2z)(1+3z+z^2)B^(m-1)+z(1+z)^(3m)`, where `B=1+4z+3z^2+z^3`. The tagged differences sum over all distinct original leaves to `sum_v (I(H_v)-I(R_v))=zR`, with

`R=3m(2+5z+2z^2)B^(m-1)+(3m+1)(1+z)^(3m)`.

These formulas preserve the endpoint tag and all `3m` private-tip tags. The independent preparation replay also literally enumerates graph masks and deletions for the small `T_m` profiles `m=1,2,3` and confirms the formulas there.

For `m>=2`, coefficientwise differentiation gives `B' >= (2/3)(3B-zB')` and `G' >= (2/3)(G-zG')` for `G=1+2z`. The product rule yields

`(j+1)[z^(j+1)](GB^m) >= (2/3)(3m+1-j)[z^j](GB^m)`.

For `0<=j<=m`, the resulting ratio is at least `(4m+2)/(3m+3)>1`. The other summand `z(1+z)^(3m+1)` is strictly increasing through those ranks as well. Thus `Delta_j(P)>0` through `j=m` and `x>=m+1`. The exact `m=1,2` rows have `x=2,4`; their lower-region guard implies `p<=3,5`, respectively, so neither admits an eligible `p`.

For `m>=3`, the strict guard implies `p<=2m+1`; eligibility and the direct descent bound put `m+1<=x<=p-2<=2m-1`. The two foreground exact replays agree on the finite base `3<=m<=399`: each checked 242,964 positive central LC margins and 242,964 positive mixed minors for `A0`, `Astar`, and `R`, over `m<=j<=2m+2`; the two independent recurrence methods produced the same streams and minima (1210 and 1243, respectively, both at `(m,Astar,j)=(3,Astar,8)`). The finite base is exact integer arithmetic, not a kernel certificate.

For the tail `m>=400`, I checked the cutoff argument: using `B=(1+z)^3+z`, the selected term of `B^(m-1)` is `binom(m-1,17) z^17 (1+z)^(3m-54)`. Its coefficient comparison gives the stated common bound

`E(m)=17!(3m)^54 / ((m-17)^17(2m-14)^16(m-39)^38)`

for both perturbation shifts. The neighbor-ratio bounds preserve the adverse constants in the LC and mixed-minor estimates. At `m=400`, all four exact rational cutoff products are below one (largest approximately `0.141222`); writing `E(m)=K(m)/m^17` shows the products decrease for larger `m`. Gurvits's Theorem 1.1 permits ULC order at least the sequence degree and gives convolution closure; the factors here have positive interval support, and the finite-order-to-Poisson-ULC limit is the informal bridge described in the route. I checked the cited primary source at [arXiv:0804.1181, Definition (2), Theorem 1.1 and Remark 1.2](https://arxiv.org/pdf/0804.1181). This is a mathematical import, not a Lean/kernel result.

At the first descent, each positive mixed minor `Z_x P_(x+1)-Z_(x+1)P_x` and `P_(x+1)<P_x` imply `Z_(x+1)<Z_x` for `Z=A0,Astar,R`. Central LC then propagates the two deletion descents through rank `p`, so every original leaf belongs to the fixed selector. It also propagates the `R` descent to rank `p-1`. Since the sum of tag polynomials is `zR`, the contract's complete aggregate is

`S(T_m,p) = sum_v(q_v(p)-q_v(p-1)) = R_(p-1)-R_(p-2) < 0`.

There is a one-line indexing typo in the source report: its prose calls the summand `q_v(p-1)-q_v(p-2)`. From the contract and `q_v(j)=[z^j](I(H_v)-I(R_v))`, the summand is `q_v(p)-q_v(p-1)`. The report's final `R_(p-1)-R_(p-2)` identity is nevertheless the correct contract expression because `sum_v q_v(z)=zR`; the exact replay checks that same correct shifted difference. This is a report wording error, not a mathematical defect in the conclusion.

## Replay evidence and limitations

I copied both replay programs into this worker's scratch directory and ran them with the specified Python 3.11 executable. `replay_cutoff400.py` reproduces the sealed exact recurrence; `replay_independent.py` uses iterative polynomial multiplication and also checks eligible finite rows. Their output records the exact counts, minima, cutoff fractions, early rows, and matching margin-stream hashes in `EVIDENCE.json` and `REPLAY-RESULTS.json`.

The review supports only the stated `T_m` family claim and first-descent claim. The finite base is computer-assisted exact arithmetic without kernel certification. The ULC closure and limiting bridge are informal mathematics supported by the cited primary theorem. I did not build a Lean certificate or independently re-enumerate every graph in the infinite family; the all-`m` graph and polynomial statements are checked through the stated root-splitting formulas. No mathematical counterexample was found, and no conclusion about arbitrary ordinary trees follows.
