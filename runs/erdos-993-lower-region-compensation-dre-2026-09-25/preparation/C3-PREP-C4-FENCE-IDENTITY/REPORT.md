# C3-PREP-C4-FENCE-IDENTITY — bounded independent review

**Authority:** worker proposal to the controller only. No registry, source, theorem, or status was changed. I read the exact brief first and verified all 11 listed SHA-256 values before analysis. I read only listed sources and this scratch. The replay is [REPLAY.py](REPLAY.py); its exact integer output is [INDEPENDENT-EVIDENCE.json](INDEPENDENT-EVIDENCE.json). No larger search, census, Lean run, or order-minimality check was attempted.

## Identity decision

The proposed keys have no exact key or statement match among the 418 existing registry entries; the 92 transitive-refuted entries are a subset of those 418. Exact textual absence alone does not justify a new canonical key. The mathematical distinctions and dispositions are:

| Proposed key | Exact disposition | Canonical handling proposed |
|---|---|---|
| `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` | **REFUTED** by an eligible original leaf of the order-91 T22 tree | A separate mechanism fence is warranted. The local linear-map assertion is stronger than the already refuted pointwise coefficient sign, and is neither the literal r23 Delete/Retag Hall relation nor an aggregate assertion. |
| `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION` | **REFUTED** by an eligible order-14 tree | A separate comparison fence is warranted. The inequality uses the unweighted mean at the *current* rank `p`; actual `CT_x` uses the first-descent rank `x`. |
| `E993-THIRD-SHELL-ALL-RANKS-COVER-SEVEN-THRESHOLD` | **REFUTED** by an eligible order-24 tree | An alias or precise tree-scope note under `E993-R25-COVER-DIAGONAL-D6-SIGN` suffices for the negative fence. That registered key already names the same tree and its cover-six, first-descent obstruction. |

The third comparison uses `r=p-1`: `|T|=2p+4=2r+6`, and `x+2<=p` means `x<r`. Thus the proposed `x<r => tau>=7` is contraposed by `tau<=6 => x>=r` on trees. The existing D6 row also phrases a stronger strict prehistory condition `Delta_k>0` for all `k<r` as “equivalently `x>=r`.” That parenthetical is not a literal equivalence if a pre-descent difference is zero. The **shared negative witness** has `Delta_8=-78`, so it refutes either version without relying on the parenthetical. A proposed alias should preserve that precision. The existing forest scope is broader; its certificate specifically uses this tree.

## Independent witness calculations

### 1. T22 local map, order 91

I reconstructed the graph from its complete 90-edge encoding. The original leaves are `2` with support `1`, and the 66 leaves in triples `c+1,c+2,c+3` with support `c`, for `c=3,7,...,87`. There are no other original leaves. The rooted forest recurrence independently gives

`I(T,z)=(1+2z)(1+4z+3z²+z³)^22+(z+z²)(1+z)^66`.

Its degree is `alpha=68`, and the first negative coefficient difference is `x=32`; every earlier difference is nonnegative. At `p=34`, `x+2=p` and `3p=102<137=2alpha+1`. The strict selector contains **all 67** original leaves: `Delta_34(T-2)=-24528898691191536776`, and each claw leaf has `Delta_34(T-v)=-22537233346124540898`.

For `v=2`, the original support is `1`, `H=T-{1,2}`, and the original witness set is `W=N_T(1)-{2}={0}`. A marked independent `j`-set of `H` must contain `0`; it then chooses `j-1` of the 66 claw leaves. Hence the closed formula is `q_j=C(66,j-1)`. The recurrence agrees:

| Dimension | Exact value |
|---|---:|
| `dim M_34=q_34=C(66,33)` | 7219428434016265740 |
| `dim M_33=q_33=C(66,32)` | 7007092303604022630 |
| source minus target | **212336130412243110** |

No rational linear map from this source to this target can be injective. This is a dimension obstruction to the **per-selected-leaf** deletion map; no entrywise or Hall analysis is needed. The 66 other selected leaves each contribute `-7560098737536570631`, so the complete fixed-selector sum is

`S=212336130412243110+66(-7560098737536570631)=-498754180547001418536`.

This negative full sum does not refute the registered aggregate. The local obstruction is consistent with the previously refuted governed beta pointwise/support signs, but this independent calculation concerns an ordinary tree and does not supply a governed semantic bridge. It also does not by itself identify a Hall relation or a failing Hall cut.

### 2. Same-rank weighted occupancy, order 14

I reconstructed all 13 edges from the encoded tree and enumerated all `2^14` vertex subsets independently of the polynomial recurrence. Its original leaves/supports are `6/5`, `8,9,10/7`, and `12,13/11`; all six satisfy the strict selector. The polynomial has `alpha=9`, first strict descent `x=4`, and at `p=6` the guards read `x+2=p` and `3p=18<19=2alpha+1`.

Literal independent `p`-sets give `Q=715` and `E=1905`, with `i_6=218`, `i_7=79`. The proposed same-rank inequality fails by

`i_6 E-7 i_7 Q=218·1905-7·79·715=19895>0`.

The same literal counts give the actual early-rank comparison `CT_x` gap

`i_4 E-5 i_5 Q=369·1905-5·361·715=-587630<0`.

Equivalently, `E/Q=381/143` exceeds the unweighted current mean `7i_7/i_6=553/218` but stays below the earlier mean `5i_5/i_4=1805/369`. The complete leaf sum is `-26+3(-80)+2(-56)=-378`. Thus this witness does not refute `CT_x`, the scalar aggregate, or the registered two-for-one weighted Hall candidate.

### 3. Third-shell cover, order 24 and `p=10`

The 23 encoded edges form one hub with six branch centers carrying leaf counts `3,3,3,3,3,2`. These are all 17 original leaves, with their original branch centers as supports. The recurrence agrees with the independent structural polynomial

`I(T,z)=((1+z)^3+z)^5((1+z)^2+z)+z(1+z)^17`.

It has `alpha=18`, `x=8`, `Delta_8=-78`, and `Delta_9=-15167`. With `p=10`, `|T|=24=2p+4`, `x+2=p`, and `3p=30<37=2alpha+1`. The six centers `{1,5,9,13,17,21}` cover every edge, so `tau<=6`. The six disjoint edges `(1,2),(5,6),(9,10),(13,14),(17,18),(21,22)` force `tau>=6`; therefore `tau=6` exactly. This contradicts the proposed all-ranks `tau>=7` threshold. Under `r=p-1=9`, it is exactly the tree described in the registered D6 cover-diagonal certificate.

All 17 leaves are strict favorable leaves. Fifteen contribute `-7537` and two contribute `-4875`, giving the complete sum `S=15(-7537)+2(-4875)=-122805`. This is a **negative** aggregate row. At `p=10`, the witness lies outside a proposed `p>=14` pointwise third-shell range. It does not disprove that high-rank candidate, prove a low-rank third-shell sign theorem, or settle any universal aggregate.

## Boundaries retained

The known witness orders here are 91, 14, and 24, respectively. I make no claim that they are minimum possible orders for these proposed keys. The T22 local map, the same-rank occupancy inequality, and the cover threshold are separate claims; their finite failures must not transfer status to the lower-region aggregate, `CT_x`, a different weighted Hall operator, or a governed RTree statement. The latter targets and the `p>=14` pointwise candidate remain blocked on the allowed evidence. Every disposition above is a proposal to the controller, not a formal award.
