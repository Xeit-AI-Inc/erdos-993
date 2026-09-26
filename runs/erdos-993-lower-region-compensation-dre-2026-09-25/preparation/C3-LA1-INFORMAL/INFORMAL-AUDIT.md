# C3-LA1-INFORMAL independent evidence and limits

All 16 brief-listed sources matched their SHA-256 pins. The normalized informal statement hash is `6edd0595c52ead3821e2858f56beb1e24616c9d305bce26d728d16ce2384db74`; the exact planned Lean header hashes to `4546fe679579b0f8cafc43d01be9c42a35cafd162ebf4a84ab55773aa7a10286`. `REPORT.md` quotes both verbatim.

## Claim chain

1. Original graph definitions: `IsGraphLeaf` means exactly one neighbor; `support` selects that neighbor under the leaf hypothesis; `H={v,s}`, `R={s}∪N_T(s)`; the leaf sum is an integer sum over separately filtered original leaves. See `OrderBandMain.lean:7-111` and `FirstInteriorMain.lean:7-46,84-95,192-205,210-243`.
2. Early descent: `Δ_0=|T|-1>0`, so `x≥1`, and the early inequality forces `p≥3` even for the aggregate.
3. A cover of size at most three can be padded to exactly three; its outside has `2p-1` vertices and is independent. The cover-fiber expansion is exact (`R25Card5Main.lean:179-349`). The signed Catalan floor (`:993-1019`) keeps the `a=r+1` contribution equal to `1` and `a≥r+2` equal to `0`. The lower bound is positive for all ranks `0..p-2`, excluding such a cover.
4. Any cover of the original-leaf retained graph extends with `s` to a cover of the original tree. Thus retained cover size is at least three. Connectivity and an edge give a marked nonisolated retained vertex.
5. First-hit partition counts each independent marked set once. Residual order at most `2k-1` is handled by incidence shadow, with the out-of-range branch explicit. At residual order `2k`, a one-edge residual would give a two-vertex cover of the parent; therefore the precise `G1FirstWideMain.lean:2512-2524` lemma applies at `r=k-1`.
6. `leaf_count_split` (`OrderBandMain.lean:1011-1021`) identifies the exact H/R difference with `q_p-q_(p-1)`. Every leaf term is nonpositive, so any fixed subset selected by the strict original deletion test has nonpositive sum. The alpha hypothesis is retained exactly and unused.

## Hostile checks

- The smallest marked-shadow equality boundary `m=6,k=2` was exhaustively enumerated: 27,626 graphs of cover number at least three, 1,738,095 nonempty mark sets containing a nonisolated vertex, zero violations. This cannot replace the general proof.
- Removing the cover hypothesis fails: the graph on six vertices with edges `01` and `23`, marks `{0}`, has `q_3=5` and `q_2=4`.
- Ordering an isolated mark first would allow a one-vertex deletion and invalidate the first-hit argument; the proof explicitly orders a nonisolated mark first.
- Positivity only at `r=p-2` would not exclude an earlier strict descent; the proof obtains positivity at every rank `0≤r≤p-2`.
- The terms are integer differences; applying natural subtraction to `i_p-i_(p-1)` or to negative shifted fiber ranks would lose the sign.
- The argument is for the equality shell `|T|=2p+2`; it makes no claim for larger orders or the global aggregate.

## Status boundary

The pinned first-wide lemma and Catalan-floor source are dependency evidence with inspected hypotheses and proof branches. Their prior status is not transferred to the proposed flat assembly. This run performed no Lean build, formalization, kernel check, axiom check, registration, source edit, or independent fidelity review. The mathematical audit is a proposal for controller inspection only.
