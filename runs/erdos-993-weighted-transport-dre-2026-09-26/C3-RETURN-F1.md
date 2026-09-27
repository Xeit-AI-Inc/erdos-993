# Cycle 3 Stage 3 Return — Seat F1

Route `C3-F-01 INVARIANT-CLASS-UNION-CUT-SEARCH-ON-SWITCH-NECESSARY-ROWS`. Orientation F (falsify). Object: (HALL)
`E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN.

**Model disclosure (two-part):** chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter);
runtime-reported model id: `claude-sonnet-5` (per this session's environment declaration; the harness does not expose a
separate self-identifying string beyond this).

## Boot acknowledgment

Booted per the dispatch's restricted boot: read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and nothing else in VerityOS proper (no memory,
conversations, modules, skills, logs, decisions, or the startup protocol's own task-type map). No other VerityOS path
was read this session; there is no `## Read-boundary disclosure` item.

## Stage 2 seal verification

Recomputed SHA-256 over the canonical JSON of `control/C3-STAGE2-PACKET-MANIFEST.json` (the object with `seal_sha256`
removed, `sort_keys=True`, separators `(",", ":")`, no trailing newline):

- Claimed: `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`
- Recomputed: `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`
- **Match: yes.** `file_count` field (1051) equals the length of the listed `files` array (1051).

Every frozen source file this return depends on was digest-verified against `control/SOURCE-DIGESTS.json` before
reading (`shasum -a 256` against the recorded `sha256`): `sources/lower-region/inputs/ordinary_tree_checked.py`
(`a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d`), `sources/lower-region/instruments/cb-switch-cut/run.py`
(`94ced04667b1234844f13a681ec6a8a5cbd1ced813526fe856d4f9692b8a9d53`), `.../RESULTS.json`
(`873cf9229923153d7626c6d721ab40b8ace8488b51343c66a00b6cfb0449d5d5`), `.../PROTOCOL.md`
(`5b09a7f34df388e1052d046590a6dae23b93bcc3f9cbea23fbaadd55c69ad952`) — all matched.

## IMPORT LIST

Standard library only, `python3 -B` throughout: `dataclasses` (not used in the end), `itertools.combinations`,
`math.comb`, `pathlib.Path`, `sys`, `json`, `hashlib`, `time`, `fractions.Fraction`, `importlib.util` (to import the
frozen `run.py`'s `calculate` function read-only, without executing its `__main__` file-write). No network, no `pip`.

## 1. Route obligation, restated

Allocation item 3 (`control/C3-ALLOCATION.md`): adversarial class-union cut search at `CB(8,86)/460`,
`CB(8,89)/476`, `CB(8,92)/492`, restricted to families mixing the root-plus-arm sector with positive-weight
non-sector sources, computed exactly via branch-type generating functions (no orbit materialization); construct the
smallest non-CB switch-necessary tree by closed form (part (c)) if reachable.

## 2. Derivation, step by step, with every hypothesis named

**Object of record.** `CB(d, m)`: path `r(0)–s(1)–v(2)`; `r` additionally carries `m` "choke" branches; choke `u_i`
carries `d` "supports" `b_{i,j}`; each support carries one private leaf `c_{i,j}` (`SEMANTIC-CONTRACT.md` §1.2, the
`CB(8,92)` fixed point). `IsTree` is never assumed: `check_tree` in `lib_transport.py` verifies **connectivity** (BFS
from vertex 0 reaches all `n` vertices) and **acyclicity** (BFS never revisits a non-parent vertex; also
`|E| = n − 1`) as three *separate* boolean checks, asserted true for all three rows before any polynomial is built.

**Finiteness** is immediate (`n = 3 + m + 2dm` is a fixed natural number per row: 1465, 1516, 1567).

**Active-tag weight, derived from first principles for this graph shape** (not assumed): a private leaf `c_{i,j}`
has support `b_{i,j}`; its tag witnesses `W_{c_{i,j}} = N(b_{i,j}) \ {c_{i,j}} = {u_i}` — so `c_{i,j}` is active in `B`
iff `c_{i,j} ∈ B` **and** `u_i ∈ B` (the erratum R30-E-b form: *another* neighbour of the support, not `B ∩ N(s_v)`
naively, though here the two coincide because `s_v`'s only other neighbour is `u_i`). The arm tip `v`'s support is
`s`; `W_v = N(s) \ {v} = {r}`; `v` is active iff `v ∈ B` and `r ∈ B`.

**Closed-form branch-type bivariate generating function**, `T(x,y) = Σ_{B independent} x^{|B|} y^{w_F(B)}` with
`F` = all leaves (checked, not assumed — §3 below), split on the root `r`'s membership (the only hypothesis the
active-tag weight of *either* leaf orbit depends on two hops away, so it must be the top-level DP split):

```
T(x,y) = x·(1+2x)^(dm)·(1+xy)                          [ r ∈ B: s forced out, all chokes forced out, v free & active if present ]
       + (1+2x)·[ (1+2x)^d + x·(1+xy)^d ]^m             [ r ∉ B: each choke free; s free, v inert since its witness r is absent ]
```

Per-branch factors used inside this: one (support, leaf) pair contributes `(1 + x·y)` when its choke `u_i ∈ B`
(support forced out, leaf free-and-active) and `(1 + 2x)` when `u_i ∉ B` (three weight-blind states). This is the
derivation named in the allocation as "branch-type generating functions... no orbit materialization" — no independent
set of `T` (there are order-`10^{100}`-scale families at these sizes) is ever enumerated.

**Layer weight via differentiation before expansion.** `Σ_B x^{|B|}·w_F(B) = ∂T/∂y |_{y=1}` (since
`∂/∂y[y^k]|_{y=1} = k`). Differentiating the closed form symbolically (product/chain rule) and setting `y=1` gives a
**pure `x`-polynomial** — the differentiation is done at the algebra level, never by building the bivariate array:

```
W(x) = x²·(1+2x)^(dm)  +  (1+2x)·m·d·x²·(1+x)^(d−1)·[ (1+2x)^d + x·(1+x)^d ]^(m−1)
```

`supply = [x^{p+1}] W(x)`, `capacity = [x^p] W(x)`, `S = supply − capacity` (this is exactly (WID), already
`formally_verified` this run as `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — I use it, I do not re-prove it).

**Eligibility and `x` through rank `α`.** `α = deg P`, `P(x) = T(x,1)`. `x(T)` is computed by an explicit scan
`k = 0, …, α` of `Δ_k = i_{k+1}(T) − i_k(T)` with zero-extension (`first_strict_descent_through_alpha` in
`lib_transport.py`), covering the terminal difference `Δ_α = −i_α` explicitly rather than trusting any library's
internal loop bound — the worker brief flags `ordinary_tree_checked.py`'s `first_strict_descent` as omitting this
case; on direct reading of that function I could not reproduce the omission for this polynomial representation
(`coefficient()` zero-extends and `range(len(poly))` does reach `rank = α`), but I computed `x` independently anyway,
as instructed, rather than relying on that reading.

## 3. Two-instrument (and where reachable, three-instrument) validation, including two caught bugs

`run_validate.py` checked the closed form against (a) a from-scratch tree-DP (`tree_dp_independence_poly`, a second,
structurally different algorithm: subtree convolution on the literal edge list) and (b) exact brute-force enumeration
(`brute_bivariate`, tracking both size and active-tag weight over every subset by mask) on eight small `(d,m)` pairs
up to `n=18`. All three agree exactly on `P(x)` and `W(x)` in every case (`run_validate.py` output: `ALL_OK: True`).

Building the full bivariate array for the record-scale rows (`d=8, m∈{86,89,92}`) is combinatorially infeasible — its
`y`-degree can reach `d·m ≈ 700`, and an attempt at it was killed by literal PID (`kill -9 72145`, confirmed via
`ps -p` showing no such process, and the backgrounded shell itself reported exit code 137) after it exceeded a bounded
time budget; the fix was to differentiate symbolically at the closed-form level first (§2's `W(x)`, which needs only
`x`-arithmetic), verified equivalent to the slow bivariate-then-differentiate route on 8 small cases before being
trusted at scale. This is disclosed because it is exactly the "no detached background job" and "own tool's failure
costs a turn" discipline the worker brief names — the corrected version is what every number below uses.

A second, independent bug was caught the same way: an initial implementation of `q_v(p) − q_v(p−1)` (the C5LA1-style
unweighted aggregate, computed via `H_v`/`R_v` polynomials from vertex-deleted subgraphs) disagreed with the frozen
`cb-switch-cut/run.py`'s own per-orbit `g` values (`g_arm` computed as `−5397` against their `0`). Root cause: `H_v`
and especially `R_v` are frequently **forests**, not trees — removing the closed neighbourhood of the arm's support
`s` disconnects all `m` choke branches from each other — and an earlier `tree_dp_independence_poly` silently visited
only the component containing vertex 0, dropping every other component instead of multiplying across them (a
disjoint union's generating function is a *product*, per the authorized evaluator's own
`forest_independence_polynomial`). Fixed to loop over every unvisited root and multiply. After the fix, `g_arm = 0`
and `g_priv = −4116` for the hand-traceable `CB(1,7)@10` case, exactly matching the frozen instrument's own reported
per-orbit values, and `Σ multiplicity·g = 1·0 + 7·(−4116) = −28812`, matching the cited fixed point exactly.

**Every reported row below carries three independent confirmations of `α`, `x`, and `S`:**

1. my closed form vs. my own from-scratch tree-DP on the whole tree (`P_closed_eq_P_dp: true`, all three rows);
2. against two previously-registered fixed points from `C3-WORKER-COMMON-BRIEF.md` (frozen, external to this route):
   `CB(1,7)@10`: my `(supply, capacity, S) = (29190, 58002, −28812)` — exact match. `CB(2,5)@10`:
   `(n,α,x) = (28,16,8)`, `(supply,capacity,S) = (259980, 396460, −136480)` — exact match;
3. against the frozen `sources/.../cb-switch-cut/run.py` `calculate(8,92,492)` (imported read-only, its file NOT
   executed as `__main__`, no write under `sources/`): `alpha=829`, `x=490`, `aggregate = S`, `favorable_count=737` —
   all four match my independently-derived values exactly (`CROSS_CHECK_VS_FROZEN_INSTRUMENT` in the replay output).

`supply − capacity = S` was checked from **independently computed sides** on every row: `S_via_WID` (from `W(x)`,
the layer-weight closed form) against `S_via_C5LA1_aggregate` (from `H_v`, `R_v` deleted-graph polynomials via the
from-scratch tree-DP, with orbit multiplicities `1` and `d·m`) — a genuinely different computational path, not a
restatement of the same polynomials (Cycle 2 ruling 17). All three rows: `WID_matches_aggregate: true`.

## 4. Registered claims named before any census or flow is reported

Before presenting the numbers in §5–§6: this route **does not** touch, re-confirm, or attempt (HALL) itself, the
primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, (LIFT), (DCB), or the `T_m`/spider/path-star
family keys (none is cited as evidence; none is re-proved). It **uses** (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`
(already `formally_verified`, C1-LA1) as the identity underlying `S = supply − capacity`, without re-proving it. It
is **distinct from** all ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2: this route never claims a
universal Hall mechanism, deletion-only relation, or fixed-`γ` structure — it reports exact finite numbers on three
named graphs plus one bounded structural lemma, nothing universal. It is distinct from
`E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE` (checked directly against the run-local registry,
`control/CLAIM-IDENTITY.run-local.json`): that claim concerns the old-style (non-active-tag) aggregate at two
*different* ranks (`p=491,492`) and a "G1 rank" sibling comparison; mine is the active-tag weighted **global
supply/capacity of the full transport network** at the single record rank, decomposed by choke-count class — a
different object, not previously registered under any alias I could find by lexical search (`supply`, `capacity`,
`choke`, `branch-type`, `q-class`, `CB(8`, `zero-weight`, `positive-weight`) against all 443 run-local claims.

## 5. Exact results — the three record rows

All values are `python3 -B` exact integers, reproduced in full below and also on disk at
`scratchpad/c3-F1/rows_output.json` (file `sha256`: `ba0e5848d1682863d199535e67b05cfd0b2e4cfaac14500a31b43df71b820ced`;
internal `PAYLOAD_SHA256` field inside that file: `6a1ae339063755984bef70a6f0f12ca4bd22acabcfdcd2f59aeb86ba730065fe`
— this is the post-bugfix run described in §3; an earlier pre-bugfix payload hash,
`e8a45806a4529f458e142ea4c466451d90f2c77d47b50e032e221269fc58ddce`, appeared transiently during debugging and is
superseded, not present in any file on disk). Every row: `n`, `α`, `x` (through rank `α`), `p`, `|F|`, `supply`,
`capacity`, `S`, eligibility, and the tree check, all present.

| `T = CB(8,m)` | `n` | `α` | `x` | `p` | eligible | `\|F\|` | margin `(capacity/supply − 1)` |
|---|---|---|---|---|---|---|---|
| `m=86` | 1465 | 775 | 458 | 460 | yes | 689 | `+0.0124212…` |
| `m=89` | 1516 | 802 | 474 | 476 | yes | 713 | `+0.0122405…` |
| `m=92` | 1567 | 829 | 490 | 492 | yes | 737 | `+0.0120714…` (matches the frozen instrument's `aggregate` exactly) |

Exact `supply`, `capacity`, `S = supply − capacity` (each independently a ~340–~450-digit exact integer; `Δ_x(T) < 0 ≤ Δ_{x-1}(T)` is the strict-descent witness underlying `x` in every row, confirmed by the scan in §2):

```
CB(8,86)@460:
  S        = -7423514084338904772945782649306600231084428589459707000679816605657952462853088442871420100810939511290559313650680058157971303198303871511216822372566401910232110339740651487837322006741841963257328634191698244788454333698693071436562973935299738822332367280408382406245712212760750076329149967051645944725546118926126716820864
  supply   = 597649140640340058816272224126096340367854389549981798763755296965114036651543127299781744288032462458962646060438439715924276618608643787166793161317435611066466753461623003461791641558117238568582936930714825975689159314721964588635308223361422630450566459976683059648624542885618997264103923656759458780549486161387212893389440
  capacity = 605072654724678963589218006775402940598938818139441505764435113570771989114396215742653164388843401970253205374089119774082247921806947658678009983690002012976698863801363654949628963564859080531840265564906524220477613648420657660071871197296722369272898827257091442054870255098379747340433073623811104725275032280313339610210304

CB(8,89)@476:
  S        = -2357499070237514535922821447457333354870165541979183549652585524960547420086522894529974849403245811642788858318679050476048694499230880815905457428105764707443247599635421815004766448998191449856771656737180653831274793086719710879189841116952616014907012229242645827372244591286894128916745713102530400096545222695224614796633000549529824
  supply   = 192598622793704670579044008538375139949312376423856776238412381955113692035572910058298561686887698733741013328193808828311204167015302274203255968180001674317081353774682637601478569792780960950969904922403883248304931737744189075832096862180442900666816159607406262541630987148157796487462801551928640981934534282033416290760079950419710032
  capacity = 194956121863942185114966829985832473304182541965835959788064967480074239455659432952828536536290944545383802186512487878787252861514533155019161425608107439024524601374318059416483336241779152400826676579141063902136206530830908786711286703297395516681723171836648908369003231739444690616379547265031171382031079504728640905556712950969239856

CB(8,92)@492:
  S        = -748810430710227858618987651910033216703683417838216925198717803643429976026528835780589934131455008160734961984872181554253955973926828360343593801420958157569217597856332648092871718535396544094741662493496052937502544011852450401845369604971012815876222562893394568771491235318210974656559260615999226971281962526260215590753741136119108496073557120
  supply   = 62031941894610803248957997045199884429925272108147816974309861930145090198717921173127929234999425856328302835494615693167412563840410553513501639892490666441124945207676886246547407161757814853229462815647229482305010202466850824209717304359078926957115854494263862115286196227204319420671485182536340436446860541979205473599967039631744513842937119296
  capacity = 62780752325321031107576984697109917646628955525986033899508579733788520174744450008908519169130880864489037797479487874721666519814337381873845233693911624598694162805533218894640278880293211397324204478140725535242512746478703274611562673964049939772992077057157256684057687462522530395328044443152339663418142504505465689190720780767863622339010676416
```

`n, α, x` reproduce the worker-brief-cited fixed points for all three rows exactly. `|F|` was **derived**, not
assumed: both leaf orbits (arm tip; a representative private leaf) were checked favorable via
`Δ_p(T−v) < 0`, computed by the from-scratch tree-DP on the literal vertex-deleted graph, giving
`F = all leaves` organically, matching `|F| = 1 + d·m` for each row.

**New finding — exact global supply and capacity** (not previously computed for these three rows in the granted
sources; `cb-switch-cut/run.py` computes only `S`, plus one *conservative upper-envelope* "test cut" explicitly
marked `'note': 'Nonpositive lower bound on deficit is inconclusive'`, never the exact global supply/capacity): the
full-layer margin is a comfortable but not huge `≈1.2%` at all three rows (capacity exceeds supply by about 1 part in
80), consistent with — but a materially tighter, exact, first-time-computed number alongside — the Cycle 2
`computer_assisted` finding that the whole network saturates with room to spare.

## 6. New finding — exact choke-count (`q`) class decomposition of supply

`run_classes.py` (`sha256`: `354b4a1aa3e02de489a6fd33b278653f89dd252767db6fc729edf4d1f708f192`; output
`class_output.json` `sha256`: `eb94a8d41f0d3e799bbdd23e845f1dcc5a8f0c435394b5bfd668dd6fb1a20042`) derives, for each
`q = 0,…,m` (number of chokes present in a source `B`), the exact weight
generating polynomial `W_q(x) = C(m,q)·d·q·x^{q+1}·(1+2x)^{1+d(m−q)}·(1+x)^{dq−1}` (for `q≥1`) — differentiated
symbolically from the same per-branch factors, verified to sum (together with the sector's own polynomial) to the
full `W(x)` exactly on 7 small cases before being trusted at scale (`run_classes.py`'s embedded validation, all
`match: True`). At all three record rows, **weight concentrates most heavily at exactly `q = 4` chosen chokes**
(≈22–23% of total supply at each row: 0.2270, 0.2250, 0.2222 for `m=86,89,92` respectively) — not at `q=1` (the
class named as "thinnest" for the *choke-forest Hall margin* in T1's allocation note, a different quantity) and not
at `q=m`. This is a genuinely new structural fact about where the network's weight actually lives, not previously
reported in the granted sources, and is handed to T1/U2 as a concrete place to look first for either an explicit flow
or a cut.

## 7. A proved reduction lemma for the adversarial search (small, but load-bearing for scope)

**Lemma (WLOG restriction to positive-weight sources).** If `X ⊆ I_{p+1}` is a deficient cut
(`Σ_X w_F > Σ_{N(X)} w_F`), then `X' := X ∩ {B : w_F(B) > 0}` is *at least as deficient*: `Σ_{X'} w_F = Σ_X w_F`
(the dropped members contribute `0`), while `N(X') ⊆ N(X)` gives `Σ_{N(X')} w_F ≤ Σ_{N(X)} w_F`. Hence
`Σ_{X'} w_F − Σ_{N(X')} w_F ≥ Σ_X w_F − Σ_{N(X)} w_F > 0`. **Consequence:** the adversarial search for a class-union
cut may be restricted, without loss of generality, to unions of *positive-weight* classes only — exactly the
"positive-weight V" / "positive-weight S/O" framing the allocation uses, now justified directly rather than only by
convention. This is distinct from (INV)'s automorphism-orbit reduction (which uses group invariance and
supermodularity); this lemma uses neither — it is a plain monotonicity argument, unconditional on any group action.
Grade: `proved` (elementary, given in full above; not registered as a run-local key since it is a search-scope
reduction, not a Hall/cut statement about a stated tree class — offered to the synthesis to register if it judges it
worth a key).

**Consequence used in my own class decomposition:** classes `Rclass` (`r=1,v=0`) and the `q=0` classes (`r=0, q=0`,
either `v` state) are all identically weight-`0` (established in §2) and were excluded from the adversarial search by
this lemma, with no loss of generality — only the sector (`r=1,v=1`, weight exactly `1` on every member, confirmed
via `sector_poly` matching `layer_weight_poly_closed` after subtracting all `q≥1` classes, all 7 small-case checks)
and the `q≥1` classes needed to be searched.

## 8. What was NOT resolved — the honest boundary of this route's result

I did **not** find a deficient cut, and I did **not** prove weighted Hall for the coupled sector/`V`/`S`/`O` families
at any of the three rows. The obstruction is structural: a decisive class-union verdict requires the exact image of
a candidate `X` under the **switch relation (S)** (`∃u∉B` with exactly two neighbours in `B`), not just the deletion
relation, and I was not able to derive a closed form for `N_S(X)` for a general mixed union `X` (sector ∪ one or more
`q`-classes) within this route's time budget — the switch relation's neighbourhood structure depends on which
*specific* vertex `u` outside `B` has exactly two neighbours inside `B`, which is not a simple function of the
`(r,v,q)` class alone (it depends on finer per-choke occupancy patterns). This is the same gap the allocation names:
"the open part of (HALL) at the three rows is exactly the families mixing `sec` with positive-weight V and
positive-weight S/O sources." Part (c) of the route (smallest non-CB switch-necessary tree by closed form) was not
attempted beyond this point: the "t"/"M" notation naming it in the allocation belongs to a sibling route's (T1/T2)
CBstar-family vocabulary that I do not have granted access to (the worker brief excludes sibling returns), and I
judged it unsound to guess at that notation's exact meaning rather than either use it correctly or state plainly
that I did not reach it — I did not reach it.

## 9. Grades

- `α, x, |F|, S, supply, capacity` for the three named rows: **bounded_computation**, exact-integer, triple/quadruple
  cross-validated as described in §3; not a proof of anything universal.
- The `q`-class weight decomposition and the `q=4` concentration finding: **bounded_computation**, exact, validated
  on 7 small cases before being trusted at the record scale.
- The WLOG positive-weight-restriction lemma (§7): **proved** (elementary, self-contained, given in full).
- (HALL) at these three rows, and the general coupled-family question: **unresolved** (not proved, not refuted,
  not conjectured one way or the other by this route — no new information bearing on its truth value beyond the
  already-`computer_assisted` Cycle 2 margins is reported here as if it were).
- No conjecture, refutation, or record correction is issued by this route.

## 10. `headline_resolved` and route verdict

`headline_resolved: no`

**Route verdict: `bounded_evidence`.** Rationale: this route produced exact, multiply-cross-validated bounded
computational evidence (new global supply/capacity figures, a new structural decomposition, one proved small lemma)
but did not resolve — proved, refuted, or exhibited a cut for — the route's chartered adversarial question.

## Remaining obligation (successor inheritance)

1. The class-union cut search for the coupled sector/`V`/`S`/`O` families at the three `CB(8,·)` rows is still open.
   A successor should compute the **switch-relation image** of the `q`-classes derived here (§6) — the generating
   functions in `lib_transport.py`/`run_classes.py` give exact `Σ_X w` for any union of `(r,v,q)` classes "for free";
   the missing piece is an exact (or exactly-bounded) `Σ_{N_S(X)} w` for such unions under the two-for-one switch,
   not just deletion.
2. The `q=4` concentration (§6, ≈22–23% of supply at all three rows) is a concrete place to start: check whether the
   switch relation's targets for `q=4` sources are unusually constrained relative to their weight share.
3. Part (c) (smallest non-CB switch-necessary tree by closed form) was not attempted; it needs either the sibling
   route's "t"/"M" notation supplied explicitly, or a self-contained restatement of the target in this run's own
   vocabulary.
4. The WLOG lemma (§7) is offered for registration if the synthesis judges it useful; it is not itself a Hall/cut
   statement and I have not registered it as an `E993-R30-…` key.
5. `lib_transport.py`'s validated closed-form machinery (three-way cross-checked, and now bug-fixed for the
   forest-vs-tree distinction in `H_v`/`R_v`) is reusable as-is for any future exact `CB(d,m)` computation at this
   scale; the forest-handling fix (§3) is worth propagating to any sibling code that computes `H_v`/`R_v` via a
   single-component tree-DP, since the same silent-drop bug would recur there.

## Replay

Copy-out-first replay (never `/tmp`; the in-root replay directory):

```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-F1-replay/*.py /path/to/scratch/
cd /path/to/scratch
python3 -B run_validate.py        # 8 small-case cross-checks (closed form vs tree-DP vs brute force)
python3 -B run_rows.py            # the three record rows; writes rows_output.json with its own SHA-256
python3 -B run_classes.py         # the q-class decomposition; writes class_output.json with its own SHA-256
```

Files present in `scratchpad/c3-F1-replay/`: `lib_transport.py`, `run_validate.py`, `run_rows.py`, `run_classes.py`
(byte-identical copies of the versions used to produce every number in this return). No `sources/` file was written
to; no background job was left running (the one background job started during debugging, PID 72145, was killed by
literal PID and confirmed dead via `ps -p`).
