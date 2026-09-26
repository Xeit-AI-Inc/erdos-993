# C3-AU-REPAIR-A1: proposed correction to the U portfolio

## Scope and source integrity

This is an append-only worker proposal for the controller. The exact brief `control/C3-AU-REPAIR-A1.json` was read first. All 186 source files it lists matched their SHA-256 digests before analysis. Only listed sources and this scratch were read. No source, registry, or authoritative status was changed. `REPLAY.py` and `EVIDENCE.json` contain the independent exact-integer check below.

## Ordinary T22 construction and eligibility

Use vertices `0,...,90`, edges `(0,1),(1,2)`, and, for each `b=0,...,21` with `c=3+4b`, edges `(0,c),(c,c+1),(c,c+2),(c,c+3)`. This is a connected simple graph with 91 vertices and 90 edges, hence an ordinary tree. Original leaves are `2` and the 66 claw leaves `4,5,6,...,88,89,90` in blocks of three. Leaf `2` has original support `1`; each claw leaf has its own block center as original support. The full edge list appears in `EVIDENCE.json`.

The replay computes each forest independence polynomial by the exact rooted recurrence `E_v=product(E_child+I_child)`, `I_v=z product(E_child)`, multiplying component polynomials. The independent structural formula is

`I(T22,z)=(1+2z)(1+4z+3z^2+z^3)^22+(z+z^2)(1+z)^66`.

Both computations agree coefficient by coefficient. The degree is `alpha=68`, with `i_68=1` and zero-extended `i_69=0`, so the terminal difference is `Delta_68=-1`. The first negative difference is `Delta_32=-940335682600092973`; all `Delta_0,...,Delta_31` are nonnegative, as recorded individually in the evidence. Thus `x=32`. At `p=34`, `x+2=p` and `3p=102<137=2alpha+1`. The row is eligible with strict upper guard.

All 67 original leaves meet the strict selector condition. For leaf `2`, `Delta_34(T-2)=-24528898691191536776`; each of the 66 claw leaves has `Delta_34(T-v)=-22537233346124540898`. The replay independently computes every leaf, support, original closed-neighborhood deletion, and selected summand; it matches all 67 rows in the pinned `inputs/standing-controls/t22-order91.json`.

## Local dimension obstruction and complete sum

For selected leaf `v=2`, `H_2=T-{1,2}` has 89 vertices, `W_2={0}`, and `R_2=T-N_T[1]=H_2-W_2` has 88 vertices. Exact counts give

| rank | `i_j(H_2)` | `i_j(R_2)` | `q_j=i_j(H_2)-i_j(R_2)` |
|---:|---:|---:|---:|
| 33 | 102102838911332628362 | 95095746607728605732 | 7007092303604022630 |
| 34 | 91916666402243617284 | 84697237968227351544 | 7219428434016265740 |

Here the marked count has the further direct form `q_j=binom(66,j-1)`: retaining marked root `0` forces all branch centers out and permits any subset of the 66 claw leaves. Hence `q_34-q_33=212336130412243110>0`. The C3-U6 map `d_34:M_34(H_2,W_2)->M_33(H_2,W_2)` has source dimension `7219428434016265740` and target dimension `7007092303604022630`; it **cannot be injective**, regardless of its entries. This is a selected leaf at an eligible rank, so the universal premise that every selected-leaf map is injective is refuted as a mechanism.

Every claw leaf has `q_34-q_33=-7560098737536570631`. The complete fixed-selector sum, with all same-support leaves counted separately, is

`S(T22,34)=212336130412243110 + 66*(-7560098737536570631) = -498754180547001418536`.

Thus the T22 row refutes the pointwise sign and the proposed universal local-injectivity premise. It does **not** refute the registered aggregate inequality; this entire eligible aggregate is negative. An operator coupling different leaf tags could be a different candidate, but no such cross-tag operator is proved here.

## Exact disposition correction

For the existing claim ID `C3-U6.marked-down-operator`, propose `retained_narrowed`: retain the true conditional implication “if every selected `d_p` is injective, then `S(T,p)<=0`,” because injectivity gives `dim M_p=q_v(p)<=q_v(p-1)=dim M_(p-1)` term by term. Correct its AU description that general injectivity merely “remains unproved”: it is **refuted** by the eligible T22 selected arm leaf above. The conditional implication is valid, but its universal premise is unavailable in the strongest possible sense. The unselected `K_(1,20)` rank-6 dimension example remains correct but is no longer the decisive boundary. This correction does not change `C3-U6.star-subcase`: its eligible-star proof and negative full sums stand at their stated scope.

The other eleven C3-AU claim dispositions are unaffected; `RESULTS.json` lists their exact IDs, statuses and review dispositions. In particular, the registered lower-region aggregate remains proposed open on this evidence.

## U3 clerical correction

The C3-U3 report's “no allocated claim IDs” sentence is consistent with its search return proposing two new auxiliary IDs. `control/C3-SEARCH-ALLOCATION.json` gives U3 a mathematical assignment but no required claim-ID coverage, and `WORKER-PROTOCOL.md` allows search routes to propose new auxiliary claims and omits `covered_claim_ids` for search returns. The AU characterization of that sentence as conflicting with the return is therefore a clerical misreading. No source misconduct follows, and neither of U3's two mathematical dispositions changes here.

## Limits

This is an exact finite obstruction to one proposed local mechanism. It is not an all-tree proof or counterexample for the primary aggregate, a new search cycle, a formal Lean result, or an award. The independent recurrence is checked against the pinned T22 row and a separate polynomial formula; its evidence concerns this specified 91-vertex tree only. All statements and dispositions remain proposals to the controller.
