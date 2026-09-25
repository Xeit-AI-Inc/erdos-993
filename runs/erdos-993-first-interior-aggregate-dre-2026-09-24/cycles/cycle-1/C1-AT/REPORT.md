# C1-AT neutral adjudication: three T-origin routes

`novelty_claimed: false`. This is a proposed worker adjudication, not a registry update or Lean award. I reviewed the three T-origin reports and returns, their six assigned F/U critiques, the frozen contracts, and the permitted common historical authority. All 67 pinned files in `packets/C1-AT.json` matched their SHA-256 manifests. The original claims and additional critique claims are disposed below. The primary unrestricted first-interior aggregate remains **OPEN**: no route proves it and no route gives an eligible tree with a positive **complete** sum.

## Frozen definitions and exact common identity

For a finite ordinary tree `T`, `i_j(G)` counts independent `j`-sets, with `i_j=0` outside the possible integer ranks; `Delta_j(G)=i_(j+1)(G)-i_j(G)`. Put `alpha=alpha(T)` and **integer** `p=alpha-2`. Eligibility means `x(T)+2<=p`, where `x` is the first strictly negative difference, including the terminal zero extension. The guard implies `p>=2` and `alpha>=4`. For each *original* degree-one vertex `v` with original support `s`, let `H_v=T-{v,s}` and `R_v=T-N_T[s]`. Favorability means `a_v=Delta_p(T-v)<0`, strictly at the original rank. The summand is `g_v=Delta_(p-1)(H_v)-Delta_(p-1)(R_v)` and `S(T,p)=sum_(v:a_v<0) g_v`, with one term for every original leaf tag.

All three origins independently present the same elementary partition; see `cycles/cycle-1/C1-T1/REPORT.md`, `C1-T2/REPORT.md`, and `C1-T3/REPORT.md`. In `T-v`, an independent set omitting `s` is one in `H_v`; an independent set containing `s` is `{s}` plus one in `R_v`. The latter equality uses the **original** neighborhood, which already contains `v`. Thus, for every integer `j`,

`i_j(T-v)=i_j(H_v)+i_(j-1)(R_v)`, or `I_(T-v)(z)=I_H(z)+z I_R(z)`.

Subtract at `j=k+1` and `j=k` to obtain `Delta_k(T-v)=Delta_k(H_v)+Delta_(k-1)(R_v)` at every integer `k`, including negative and terminal ranks. Define `A_v=Delta_p(H_v)`, `B_v=Delta_(p-1)(R_v)`, and `C_v=Delta_(p-1)(H_v)`. Then the **exact** selector is `A_v+B_v<0` and the exact contribution is `C_v-B_v`. Consequently `S(T,p)=sum_(v:A_v+B_v<0)(C_v-B_v)`. The selector is a sum of two differences, while the contribution is their different-rank difference. This identity alone does not sign any contribution or the total. It needs no residual hypothesis and does not use any historical pointwise, Hall, or sequence-shape conjecture. The proof works for a pendant vertex of a general finite graph, but the admitted claims remain at their stated tree scope. The one-vertex tree has no original leaves, so the leaf-indexed identities are vacuous there; `K_2` presents no edge-rank exception.

For a support `s`, let `m_s` be its number of original adjacent leaves. Permuting those leaves preserves `T`, its deletion graph, `H`, and `R` up to isomorphism. Hence every leaf at that support has the same `a_s,g_s`, so its entire fibre is favorable or none is. The exact regrouping is

`S(T,p)=sum_(s:m_s>0) m_s 1[A_s+B_s<0](C_s-B_s)`.

The multiplier `m_s` is essential. It does **not** permit replacing a complete leaf-tag sum by one representative per support. This agrees with both critiques of T3 (`cycles/cycle-1/C1-CF-T3/REPORT.md`, `C1-CU-T3/REPORT.md`).

There is also T2's algebraic version. Partition independent sets of `T` by whether they contain `v`: `I_T=(1+z)I_H+z I_R`. Since `R` is induced in `H`, `alpha(R)<=alpha(H)` and the positive leading term `z I_H` shows `alpha(T)=alpha(H)+1`. Write `h_j=i_j(H)`, `r_j=i_j(R)`, and `a=Delta_p(T-v)`. Direct expansion gives

`a=(h_(p+1)-h_p)+(r_p-r_(p-1))`,
`g=(h_p-h_(p-1))-(r_p-r_(p-1))`, hence
`g+a=h_(p+1)-h_(p-1)`.

At `p=alpha-2`, every favorable leaf has

`g=i_(alpha-1)(H)-i_(alpha-3)(H)+|a|`.

Thus the proposed pointwise budget `i_(alpha-3)(H)-i_(alpha-1)(H)>=-a` is **equivalent** to `g<=0` on that favorable leaf. If true for every favorable leaf, it implies `S<=0`; its truth has not been established. Eligibility constrains `x(T)` and provides no proved bound on these `H_v` coefficients or `a_v`. An aggregate proof could exist even if this stronger pointwise statement fails. This reconciles both T2 critiques (`cycles/cycle-1/C1-CF-T2/REPORT.md`, `C1-CU-T2/REPORT.md`) with the origin's explicitly unresolved budget.

## Adjudicated claim ledger

The ten IDs below are the exact incoming union: six origin IDs and four additional critique IDs. Each appears once. “Retained” means the stated scoped mathematical or finite claim is supported informally; it confers no formal award.

| Claim ID | Proposed disposition | Exact retained scope and reason |
| --- | --- | --- |
| `C1-T1-LEAF-BRANCH-IDENTITY` | `proposed_retained` | Universal tree branch identity and exact selector/summand representation, all integer ranks; direct partition above. The P60/T60 replays are finite corroboration only. |
| `C1-T2-ALG-IDENTITY` | `proposed_retained` | Universal tree deletion identities, `g+a` equation, and `alpha(T)=alpha(H)+1`; direct algebra above, independent of eligibility. |
| `C1-T2-ALPHA2-BUDGET` | `proposed_retained_narrowed` | Retain only the equivalence and conditional implication at eligible `p=alpha-2`; the proposed pointwise inequality itself is **unresolved**. No sign theorem follows. |
| `C1-T2-BOUNDED-POINTWISE-CHECK` | `proposed_retained_narrowed` | Six specified eligible fixtures have no positive favorable summand, with the reported complete negative sums. They use an exact integer DP and replay of the same evaluator; P501 also has an independent binomial check. The four Prüfer trees come from one continuous seed-20260924 stream, not four seeds. |
| `C1-T3-01` | `proposed_retained` | Coefficient recurrence, strict selector, all-or-none support fibres, and multiplicity-weighted regrouping, all integer ranks; identity only. |
| `C1-T3-02` | `proposed_unresolved` | The primary unrestricted eligible-tree inequality `S(T,alpha-2)<=0`: neither universal proof nor eligible positive complete sum is present. |
| `C1-CU-T1-INDEPENDENT-FINITE-REPLAY` | `proposed_retained` | Exactly P60 and T60 at `alpha-2`, independently factored integer polynomials; values and complete sums below. |
| `C1-CF-T2-TARGETED-T22-RANK` | `proposed_retained_narrowed` | Exact T22 target-rank row and the stated 123-tree bounded probe, of which 94 were eligible. T22's row is independently supported by the family formula below; the other directed rows replay a copied evaluator. No universal pointwise conclusion. |
| `C1-CF-T3-01` | `proposed_retained` | Exact `T_m` family polynomial, selector, summand, and negative aggregate formulas for `m>=1`; eligibility checked only for listed `m`. |
| `C1-CU-T3-01` | `proposed_retained` | The same exact `T_m` result in notation `n=3m`, independently derived. Its formula equals the CF formula identically; it is one family fact, not a second general result. |

The origin T2 budget claim deliberately combines a valid reduction with an unproved antecedent. Its narrowed disposition retains the former and explicitly leaves the latter open. T3's primary claim is unresolved rather than rejected: neither an algebraically possible sign pattern nor a positive *individual* term is a graph-realizable positive complete-sum counterexample. The two T3 family claims are compatible, not competing proofs of the general target.

## Independently readable finite and family evidence

For paths, `i_j(P_N)=binom(N-j+1,j)` by choosing `j` nonadjacent sites. This gives P60: `(alpha,x,p)=(30,17,28)`, two favorable original ends, each with selector `-35495` and `g=-165851`, so `S=-331702`. The separate symbolic check in `cycles/cycle-1/C1-CF-T1/REPORT.md` and `C1-CU-T1/REPORT.md` agrees with the origin's copied-DP replay. P501 similarly has `(alpha,x,p)=(251,139,249)`, two favorable ends, each `g=-161424625`, and `S=-322849250`; `x+2<=p` in both cases. The independent path check is described in `C1-CF-T2/REPORT.md`. These are exact examples, not a path-family sign proof.

For `T_m`, construct a root with one adjacent marked two-vertex path arm and `m` adjacent `K_(1,3)` arms, each joined to the root at its star centre. There are `4m+3` vertices and `3m+1` original leaves: one marked leaf and three per star arm. Let `n=3m`, `A=1+z`, and `B=A^3+z=1+4z+3z^2+z^3`. Splitting on root membership gives

`I_(T_m)=(1+2z)B^m+z A^(n+1)`.

The positive leading term proves `alpha(T_m)=n+2`, so `p=n`. For the marked leaf, `I_H=B^m+z A^n`, `I_R=B^m`, and `I_(T-v)=A B^m+z A^n`. For any star leaf, put `Q=(1+2z)B^(m-1)`; then `I_H=Q A^2+z A^n`, `I_R=Q`, and `I_(T-v)=(1+2z)(1+3z+z^2)B^(m-1)+z A^n`. Coefficient extraction at `p=n` gives

`a_mark=1-2n<0`, `a_star=-(n+1)<0`,
`g_mark=n-binom(n,2)`, `g_star=g_mark+3-2n`.

Thus all `n+1` leaf tags are favorable, and

`S(T_m,n)=g_mark+n*g_star=-n(n^2+2n-9)/2=-(9m/2)(3m^2+2m-3)<0` for every integer `m>=1`.

The two displayed closed forms agree after `n=3m`, reconciling `C1-CF-T3-01` and `C1-CU-T3-01`. The proof is a **general family identity**, but it does not prove that every `m` is eligible and says nothing universal about other trees. Independent coefficient scripts reported in `cycles/cycle-1/C1-CF-T3/REPORT.md` and `C1-CU-T3/REPORT.md` check `(m,x,p,S)=(22,32,66,-147807),(60,87,180,-2947590),(100,145,300,-13588650)`. All three are eligible. At T22, `a_mark=-131`, `a_star=-67`, `g_mark=-2079`, `g_star=-2208`, with `1+66=67` favorable tags. At T60, the corresponding values are `-359,-181,-15930,-16287`, with `181` tags. At T100, they are `-599,-301,-44550,-45147`, with `301` tags. The T125 origin row has `(alpha,x,p,F,S)=(377,181,375,376,-26506125)`; the family formula independently corroborates its `S` and favorable count, while `x=181` is from the bounded DP replay. The T8 and T40 directed rows likewise have `S=-7380` and `-877860` by the same formula; their reported `x=12,58` is bounded evaluator evidence.

The T2 six-fixture packet also reports four distinct 260-vertex Prüfer trees with `(alpha,x,p,F,S)` respectively `(147,79,145,96,-36327064026382336)`, `(146,80,144,91,-11820291646586501120)`, `(146,79,144,93,-9046564555277139968)`, and `(146,79,144,94,-6020601544695297024)`. Each is eligible and has zero positive favorable summands. These rows were replayed from copied code by both T2 critics; this confirms reproducibility, not an independent proof of all DP results. The source script uses one RNG initialized to `20260924`; labels ending in later dates do not denote separate seeds. A detailed pinned `identity-probe.json` was not regenerated by the source script, so the six-fixture disposition rests on the reproducible summary files. The U critic's literal-subset audit found the identities correct in 358242 leaf/rank instances for labeled Prüfer trees of orders 2–7, but none was eligible; its eligible nine-vertex star has `S=-112` (`C1-CU-T2/REPORT.md`). These checks are finite.

The CF T2 directed probe includes 3 constructed T-family rows and 120 seeded Prüfer draws at orders 12, 18, 24, and 30: 123 rows total, 94 eligible. Among eligible rows, no positive favorable summand or positive complete sum was found. Three **ineligible** order-12 rows (indices 8, 11, 14) do have one positive local summand each; their complete sums are `-1,-1,-6`. The probe's summary field `positive_pointwise_cases: 0` concerns eligible rows, so it does not conflict with its raw rows. This distinction is necessary before anyone cites it as pointwise evidence (`cycles/cycle-1/C1-CF-T2/targeted-probe.json`).

## Authority, obstruction, and remaining obligation

The historical r24 summary records a positive *marked summand* for T22 at rank 34 inside a negative complete aggregate; its `alpha=68` makes the frozen rank 66. The verified T22 rank-66 row above is negative pointwise and in total, so there is no numeric contradiction and no rank transfer (`sources/public/experiments/r24-direct-favorable-leaf-aggregate.md`, outcome). The r26 result is at `alpha-1` under the residual condition that every original leaf is in every maximum independent set; both its rank and hypothesis differ from this unrestricted `alpha-2` problem (`sources/public/experiments/r26-top-rank-residual-sign.md`, resolved theorem and open scope). The common handoff additionally fences universal tree log-concavity/real-rootedness, rank-unqualified pointwise and support-fibre signs, all-cut/tag-closed Hall, raw edge-difference monotonicity, same-leaf marginal extraction, cover-diagonal `d`, arbitrary unimodal convolution, and `N2<=M` (`packets/C1-COMMON-NEUTRAL.md`). None is a premise of the retained identities or the exact `T_m` factorization. Conversely, the negative `T_m` rows do not restore any fenced universal mechanism.

The live proof obligation is to sign the **strictly selected, multiplicity-weighted complete sum** at the fixed eligible rank, possibly through a tree-wide compensation inequality, or to give an eligible tree with a positive complete sum and independently checked graph, coefficients, selector, all leaf-tag terms, and first descent. The pointwise T2 budget is one sufficient but stronger candidate; it remains unproved. There is no exact centrally decisive Lean candidate with a closed sign-proof dependency DAG in these three routes. All statements here are informal mathematics or bounded exact arithmetic; no Lean build was run. All my foreground commands finished and no owned background job remains.
