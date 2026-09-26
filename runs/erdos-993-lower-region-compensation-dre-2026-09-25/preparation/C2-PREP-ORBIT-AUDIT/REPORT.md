# Proposed audit of the two orbit-flow instruments

**Status:** bounded audit complete; all findings are proposals to the controller. No source, registry, or governed claim was changed. No universal or formal award is proposed.

## Inputs and method

The exact `control/C2-PREP-ORBIT-AUDIT.json` brief was read first. SHA-256 matched for all 29 listed source files. I used only those files and this scratch directory. `audit.py` does not import either producer or the ordinary-tree evaluator. It independently derives the graph polynomials, checks every stored leaf vector and selector, enumerates each rank's orbit states and transitions, validates every saved positive-flow arc, and checks the exact deficient cuts. It also enumerates all independent sets and graph moves for `m=1,2,3`. Reproduce with `python3 audit.py` from this directory; it writes `independent-evidence.json` here. The command completed with all assertions passing. No producer max-flow solve was rerun.

## Exact coordinates and tree

For the original selector `F=F(T,p)`, hold `F` fixed at both ranks. Let `q_v(j)` count independent `j`-sets of `H_v=T-{v,s_v}` meeting `W_v=N_T(s_v)\{v}`. For each selected leaf `v`, the map `A -> B=A∪{v}` is a bijection onto independent `(j+1)`-sets `B` containing `v` for which `N_T(s_v)∩(B\{v})` is nonempty. Thus, with

`w_F(B)=#{v∈F∩B: N_T(s_v)∩(B\{v})≠∅}`,

`Σ_{v∈F}q_v(j)=Σ_{|B|=j+1}w_F(B)` and the complete aggregate is

`S(T,p)=Σ_{|B|=p+1}w_F(B)-Σ_{|B|=p}w_F(B)`.

This is exact for the fixed original selector. Changing to `F(T,p+1)` would change the identity. It supplies no sign argument by itself.

The graph `T_m` has root `0`, path `0-1-2`, and for `i=0,...,m-1` center `c_i=3+4i`, edges `0-c_i` and `c_i-(c_i+1,c_i+2,c_i+3)`. It has `4m+3` vertices. Its independence polynomial is

`I(T_m;z)=(1+2z)C(z)^m+z(1+z)^{3m+1}`, with `C(z)=1+4z+3z²+z³`.

The independent vector check used these separately derived deletion polynomials (`D=T-v`, `H=T-{v,s_v}`, `R=T-N[s_v]`):

| Leaf type | `I(D)` | `I(H)` | `I(R)` |
| --- | --- | --- | --- |
| distinguished `2` | `(1+z)C^m+z(1+z)^{3m}` | `C^m+z(1+z)^{3m}` | `C^m` |
| any claw leaf | `(1+2z)(1+3z+z²)C^{m-1}+z(1+z)^{3m}` | `(1+2z)(1+z)²C^{m-1}+z(1+z)^{3m}` | `(1+2z)C^{m-1}` |

Every stored edge, closed support neighborhood, original-leaf vector, and summand in `FULL-POLYNOMIALS.json` and both sets of `graph_row` data matched these calculations. All original leaves are strictly favorable in each case. The checks used `x(T)` as the first negative adjacent difference and `α(T)` as the polynomial degree. The lower-region guards `p≥x+2` and `3p<2α+1` hold.

| `m,p` | order | `x,α` | selected original leaves | complete aggregate |
| --- | ---: | ---: | ---: | ---: |
| `22,34` | 91 | `32,68` | 67 | `-498754180547001418536` |
| `60,90` | 243 | `87,182` | 181 | `-1058142362147652597702654588268394677176033202323316960380` |
| `66,98` | 267 | `96,200` | 199 | `-398505970713926379754668111540326337337661499382047494636407368` |

These are bounded instances of the **OPEN** registered ordinary lower-region favorable-leaf aggregate, `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`. They neither prove nor refute that universal statement. The governed `E993-BETA-AGG` is separately **OPEN**.

## Orbits, moves, primal flows, and cuts

An orbit state records `(root, distinguished, empty claws, center claws, one-leaf claws, two-leaf claws, three-leaf claws)`. Its multiplicity is `m!/(e!c!s!d!t!)·3^(s+d)`. The root-occupied states have no occupied claw center; their distinguished state is empty or leaf `2`. Independent orbit enumeration matched the saved state counts and the ordinary polynomial coefficients. Since all leaves are selected here, orbit weight is `1_{distinguished=2}+s+2d+3t` with root occupied and `2d+3t` with root absent. Its weighted layer totals matched the saved supply/capacity and their difference matched the complete aggregate.

Deletion transitions remove root, an occupied distinguished vertex, or one vertex of an occupied claw. For the two-for-one rule, insert an absent vertex `a` exactly when it has two neighbors in the upper set, deleting precisely those two neighbors. The exhaustive vertex-type analysis is:

1. Insert a claw center with root absent and exactly two of its leaves occupied: a two-leaf claw becomes a center claw.
2. Insert a claw center with root occupied and exactly one of its leaves occupied: root and that leaf disappear; the claw becomes a center claw.
3. Insert support `1` with root and distinguished leaf `2` occupied: both disappear; support `1` appears.
4. Insert root `0` when exactly two of its neighbors are occupied among support `1` and the claw centers: remove those two; all removed center claws become empty, and remove support `1` if occupied.

Leaves have degree one, so they cannot be inserted by this rule. Each listed move preserves independence and decreases cardinality by one. Literal graph enumeration at `m=1,2,3` gave respectively `43,371,3211` independent sets and `23,65,145` orbits; every observed move orbit and multiplicity matched the independently coded formulas. For the three production cases, every proposed orbit transition was checked to land in the correct lower layer, the complete orbit adjacency count matched, and every emitted positive arc was rechecked against that adjacency. The validator separately summed all incoming/outgoing flows and tested every orbit supply and capacity.

| `m,p` | deletion arcs | deletion positive arcs | deletion flow deficit | deletion cut upper/lower orbits | switch arcs | switch positive arcs | switch flow deficit |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| `22,34` | 7,135 | 2,820 | `14226520737620288370` | `359/360` | 8,907 | 2,967 | 0 |
| `60,90` | 124,057 | 46,830 | `2484429454702439631214528481545445496575478415088191800` | `3,798/3,796` | 152,406 | 48,532 | 0 |
| `66,98` | 165,317 | 60,809 | `9792891083754740157383733153470112445673000768114042172774060` | `7,790/7,786` | 202,870 | 65,762 | 0 |

For each deletion cut, the validator recomputed its **entire** lower neighborhood, its weighted source sum, and its weighted neighbor capacity. The difference equals the displayed deficit and equals total supply minus the saved primal flow. Thus primal feasibility plus this cut proves the saved flow is maximum in each exact quotient network. The cut-state hashes and exact sums are in `independent-evidence.json`; full cut state lists remain in the hashed source artifacts. The `m=22` cut contains exactly all center-free upper orbits; the `m=60` cut has at most one center and the `m=66` cut at most three. For the switch network, all three saved feasible flows equal total upper supply, so each is a finite saturation certificate; no positive deficient cut remains.

## Center-free polynomial and the prior r23 verdict

Let `X` contain all rank-`p+1` independent sets with no claw center. For ordinary deletion, its lower neighbors are exactly the rank-`p` center-free sets when `p<3m`: deletion preserves center absence, and any lower center-free set can add an unoccupied claw leaf. On this class the selected-all-leaves weighted generating polynomial is

`W₀(z)=m(6z²+3z³)(1+z)^{3m-3}(1+2z)+(3m+1)z²(1+z)^{3m}`.

The first term counts the weighted occupied leaves in a two- or three-leaf claw with root absent. The second counts occupied selected leaves when root is present. At `m=22,p=34`, the first-term rank difference cancels because `3m-3=63` and binomial symmetry pairs the `6,15,6` coefficients. The remaining difference is

`67( binom(66,33)-binom(66,32) ) = 67·Cat₃₃ = 14226520737620288370`.

The exact weighted source and lower-neighborhood counts are `1020660578375268831042` and `1006434057637648542672`. The **already REFUTED** `E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL` records a source set of the first size whose literal tagged neighborhood is **contained in** a set `Y` of the second size. Thus the same numerical excess is a certified obstruction there, but the registry does not state that its actual neighborhood equals `Y`. The present center-free cut rediscovers that obstruction in weighted coordinates; it is **not a new refutation**. The old literal tagged relation and the anonymous weighted relation have not been proved equivalent on all edges, so this audit makes no whole-relation equivalence claim. The separate governed `E993-R19-FIXED-GAMMA-HALL` remains **OPEN**.

The same center-free calculation gives positive deficits for `m=60,p=90` and `m=66,p=98` (exact values in `independent-evidence.json`), but their saved minimum deletion cuts are larger than the center-free cuts. All three complete aggregates remain negative.

## Symmetry lift: valid for these exact networks

Let `G` permute the `m` claws and independently permute the three leaves within each claw, fixing `0,1,2`. It preserves the tree, the all-leaf selector, each vertex-set weight, and both move relations. For any adjacent pair of upper/lower orbits `U,L`, the graph of actual set edges between them is biregular: transitivity of `G` on each side makes degrees constant. If the saved quotient sends `f(U,L)` units along that orbit pair, distribute `f(U,L)/|E(U,L)|` over every actual edge in the pair. Each actual upper set receives outgoing `f(U,L)/|U|`; each actual lower set receives incoming `f(U,L)/|L|`. Summing over orbit pairs divides the quotient supply and capacity inequalities by the corresponding orbit size. This gives a feasible fractional flow on the **actual** weighted-set network. All source/sink capacities `w_F(B)` are nonnegative integers; finite-network flow integrality therefore supplies an integral flow of the same value. The quotient deficiency likewise lifts to the union of its upper orbits, whose actual lower neighborhood is precisely the union of the adjacent lower orbits.

This proves the lift for the three validated tree/rank instances and the stated deletion or two-for-one relation, conditional only on the standard finite integral-flow theorem. It does not identify the anonymous relation with every edge of the historical tagged relation, prove a general tree theorem, or change any registered status.

## Stop and limits

The bounded certificate audit is complete. No second model-family pass or Lean build was run, as the brief forbids extra agents and Lean builds. The script independently validates the saved flows rather than recomputing max flow. `RESULTS.json`, `LEDGER.csv`, and `ESCALATIONS.md` distinguish these finite results from the remaining universal and relation-identification gaps. Every new local-switch claim stays proposed pending controller intake.
