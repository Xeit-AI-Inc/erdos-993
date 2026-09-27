# Second Read

Read `SR-C3-6`, Cycle 3 of r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`). Date 2026-09-27. Isolated second reader
under `control/C3-SECOND-READ-PROTOCOL.md` and `control/C3-SECOND-READ-BRIEF-SR-C3-6.md`.

**Boot.** I am operating within VerityOS. For the boot I read exactly the two files the protocol grants,
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full, and loaded no
other VerityOS subsystem (memory, decisions, logs, conversations, operations, modules, skills). Order: I verified the capsule seal
and read the protocol first (the wrapper required the seal check before any reading), then booted, then read the brief and the
remaining members. No conclusion depends on that order.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Capsule inner seal `control/c3-second-read/SR-C3-6-PACKET-MANIFEST.json` (SHA-256 of the canonical JSON without `seal_sha256`: `sort_keys`, separators `(",", ":")`, no trailing newline) | `d88836574c144caca0c854f7373a7837eed9568b0066bc44edb8c8d7dde67330` | `d88836574c144caca0c854f7373a7837eed9568b0066bc44edb8c8d7dde67330` | **match** |
| The 20 listed members (bytes and SHA-256 each) | manifest | recomputed | **20/20 match** |
| `control/PATH-CHECK-c3-second-read-briefs.json` (member) | — | read | 9 files scanned, 0 findings |

The seal and every digest were verified before any member was read.

**Read-boundary disclosures.**
1. The host injected the project `CLAUDE.md` and the user auto-memory index into my context at session start. I did not open
   either file, and nothing here relies on them.
2. **Slip, disclosed.** One `grep` for a row-id convention used the glob `control/*.md`, so it also matched the other readers'
   brief files `control/C3-SECOND-READ-BRIEF-SR-C3-{1,2,3,4,5,7}.md`, which are not members of my capsule. The output showed only
   single-line fragments of their output-format templates (`SCOPE NOTE ON: <key> / TEXT: …`, `DISTINCTION ROW: …`). I read
   nothing else from them, and nothing here depends on them.
3. Every other read was a capsule member: the protocol, the brief, both contracts, the allocation, the Stage 1 gate, the Stage 6
   controller facts (context only, never evidence), the Cycle 2 close, the F1 return, the C-F1-T, C-F1-U and C-U2-F critiques,
   the F and U adjudications, the Stage 6 synthesis, and both claim registries (the run-local Stage 2 snapshot, read for the
   registered texts of (HALL) and `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`). I listed `second-reads/` non-recursively
   (names only) to place my output.
4. **Enumeration scope.** The brief says "enumeration only on the order-8 and `CB(4,1)` trees". I read that as a limit on
   evidence: no census, and no enumeration standing in for the DP on large trees. Every row claim below rests on the DP
   (large trees) or on enumeration of those two trees only. Separately, to validate my own instruments, I brute-forced
   (a) 300 seeded random trees of order ≤ 13 (the forest DP and the active-weight DP against literal counts) and (b) 10 small
   generalized-choke trees of order ≤ 18 (my sector and switch-image formulas against the literal (D) ∪ (S) relation). These
   runs are instrument validation only: they are not a census and are cited as evidence for nothing else. If the controller
   reads the brief strictly, they are a disclosed deviation.
5. No Lean, no network, no installs, no background job. I ran `python3 -B` with the standard library and exact integers only
   (`fractions`/`math.comb`; I format decimals by integer floor division, with no float anywhere), in my scratch directory only.
   The only file I wrote outside scratch is this one. One shell `echo =====` failed under zsh `=`-expansion; that is harmless.
6. The controller's replays (`CF-REPLAY-c3d`, `CF-REPLAY-c3e`) are not in my capsule. Where the synthesis cites them I report
   that citation, and I never use them as evidence.

## Statements read

- **SR-C3-6a (E-a).** Statement of record: `SYNTHESIS.md` `## Exact established results` E-a; `## Reconciliation` R2 and R5;
  `## Headline verdicts` fidelity correction 2; origin C-F1-U critique item 8 (`G(8^82, 7^2)` and its scan); F adjudication
  finding 4 and E2 (`sector.py`).
- **SR-C3-6b (R2's replacement sentence).** `SYNTHESIS.md` R2; `## Headline verdicts` fidelity correction 1; `## Registrations`
  correction 1 and item 11; E-f (the order-8 tree at `p = 3`, `CB(4,1)/4`); origin C-U2-F critique items 2, 5 and "Remaining
  obligation" 2; the U adjudication.
- **SR-C3-6c (R3's rows).** `SYNTHESIS.md` R3 and E-h (`CB(8,108)/577` at `289/288`, `CB(7,144)/673` at `337/336`, both at
  `3p = 2M + 3`); F's pattern (F adjudication E2, last bullet).

## Independent re-derivation

**Instrument (own code, `scratchpad/c3-sr-SR-C3-6/`).**
- `sr6lib.py` implements the SEMANTIC-CONTRACT definitions literally:
  - a generic rooted DP for the independence polynomial of any induced forest `T − D` on the literal edge list;
  - `x` scanned through rank `α`, including `Δ_α = −i_α`;
  - `F_p` derived from `Δ_p(T − v) < 0`;
  - `S` from the deletion sets `H_v = {v, s_v}` and `R_v = N[s_v]` (C5LA1's), summed over `F_p`;
  - for small graphs, brute-force independent sets, the literal `w_F`, the literal (D) and (S) relations, and an exact-integer
    Dinic max-flow. Each flow is verified arc by arc, and each non-saturating flow yields a deficient family, read off the
    residual graph and re-summed directly.
- **Independent supply side.** `active_weight_layers` is a rooted DP that tracks tag activity directly, carrying a first moment
  (dual numbers) through the states "support out, parent in" and "support out, parent out". It never forms `H_v` or `R_v`. So
  `supply − capacity = S` is checked between two genuinely different computations: literal weights on one side, deletion
  polynomials on the other. `validate_lib.py` checks both DPs against brute force on 300 seeded random trees (0 failures).
- **Sector formulas.** `sector_formulas.py` computes the switch-image weight by a generating function of my own:
  `[y^p] y²·g_d(y)·(1+2y)^{M−d}`, with `g_d = d·y(1+y)^{d−1} − d·y^d`. This counts the distinct targets `(B ∖ {r, b}) ∪ {u_i}`
  by the number of active tags under `u_i`. `sector_validate.py` brute-forces 52 (tree, rank) rows on 10 small
  generalized-choke trees, one of them with a `d_i = 0` choke, using literal (D) ∪ (S) and literal weights. On every row, 0 failures:
  - every sector source has weight 1;
  - the positive-weight deletion image is exactly `{A ∈ I_p : r, v ∈ A}`, each of weight 1;
  - the (D) and (S) images are disjoint;
  - the (S)-only image weight equals my generating function, its full-polynomial variant, and C-F1-U's printed double sum.

**SR-C3-6a: `G(8^82, 7^2)` at `p = 448` (`big_rows.py G`).**
- **Tree.** Path `r–s–v`, 84 chokes `u_i ~ r` (82 with 8 pendant paths `u_i–b–c`, 2 with 7). The tree check passes.
  `n = 3 + 84 + 2·670 = 1427`, `M = N = 670` pairs. `I(T)` from the generic DP equals my closed form
  `x(1+x)(1+2x)^M + (1+2x)·Π_i[(1+2x)^{d_i} + x(1+x)^{d_i}]`.
- **Descent and window.** `α = 755`. `Δ_k ≥ 0` for `k < 446`; `Δ_445 = 800977311478…` (318 digits, ≥ 0);
  `Δ_446 = −20429764138…` (317 digits, < 0). So `x = 446`. The eligible window `x + 2 ≤ p`, `3p < 2α + 1 = 1511` is **`[448, 503]`**.
  The row lies in the unresolved band `2p + 3 ≤ n ≤ 4p − 8` (`899 ≤ 1427 ≤ 1784`).
- **Selector.** There are three leaf orbits: `v` (1), `c` under an 8-choke (656) and `c` under a 7-choke (14), for 671 leaves in
  all. Permuting equal-`d` chokes with their branches, and pendant paths within a choke, are automorphisms of `T`. So
  `Δ_p(T − c)` and each per-leaf summand of `S` are constant on an orbit. I computed `Δ_448(T − ·)` on the literal vertex-deleted
  tree for each orbit representative, plus 3 random further members of each large orbit (all equal):
  - `v`: `−1153038…`;
  - `c`(8): `−1143204…`;
  - `c`(7): `−1140802…`;
  - each 320 digits, each `< 0`.

  **`F_448` = all 671 leaves**, derived. The same holds at every rank of the window.
- **WID from independent sides.**
  - Supply `W_449` and capacity `W_448` come from the active-weight DP with `F = F_448` (322 digits each).
  - `S` comes from the `H_v`/`R_v` deletion polynomials, as orbit representative times multiplicity (320 digits), with one more
    orbit member checked per large orbit.
  - `supply − capacity = S` exactly. My `S` equals C-F1-U's printed `S(G, 448)` digit for digit.
- **Sector (pair-poset counts).**
  - Sector supply: `i_447` of the forest `T − N[r] − N[v]` (670 disjoint edges), computed by the DP.
  - Deletion image: `i_446` of the same forest.
  - Both equal the binomial counts `R_j = 2^j·C(670, j)` at `j = 447` and `j = 446`.
  - Supply/deletion image = `R_447/R_446 = 2(N − 446)/447 =` **`448/447`** exactly.
  - Deficit `R_447 − R_446` (316 digits).
  - Sector supply, deletion image and deficit each equal C-F1-U's printed integers digit for digit.
  - A third route agrees: the arm tag's own summand `Δ_447(T − H_v) − Δ_447(T − R_v)`, computed by deletion polynomials, equals
    the sector deficit exactly (see finding 5).
- **Switch image.** Weight by my generating function: `20093217471726111100…` (320 digits); it equals C-F1-U's double sum.
  - Switch image/supply = **`13.107470205…`** (the synthesis's 13.107×).
  - Whole (D) ∪ (S) neighbourhood of `X_sec`/supply = `14.105238063…`.

  So `X_sec` is not deficient under (D) ∪ (S): **not a cut**.
- **Criterion.** `3p < 2N + 5 = 1345` iff `p ≤ 448`. With `x = 446`, **`p = 448` is the only eligible rank** at which the sector
  is deletion-deficient (`3·448 = 1344 = 2N + 4`).
- **ℕ-subtractions and hypotheses.**
  - `p − 1 ≥ 1`, `p − 2 ≥ 0`; `M − p + 2 = 224 ≥ 0`; `C(M, p − 2)` needs `p ≥ 2`.
  - The positive deletion image is all of `{A ∈ I_p : r, v ∈ A}` because every such `A` has an empty pair (`M − (p − 2) ≥ 1`),
    so it extends to a sector source.
  - Weight one needs `v ∈ F_p` (derived). Private tags are inactive because `r ∈ B` excludes every `u_i`.
  - The residual `T − N[r] − N[v]` is `M` disjoint edges because `N(s) = {r, v}`.
- **Novelty.** The registered (HALL) scope (C1 note) says deletion-only transport first fails in the `CB` family at
  `CB(8,86)/460` and that "trees of other shapes at orders 20–1464 are untested". The C2 note names the three `CB(8,·)` rows as
  the only eligible sector-deficient `CB` rows with `n ≤ 1600`. `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` covers only
  uniform-`d` `CBstar(d,m,t)`, and `G(8^82, 7^2)` has non-uniform `d`. So an eligibly deletion-deficient sector on a non-CB tree
  is **new to the record**: the first on record outside the CB family, and the first on record below order 1465.
- **"Not a proved minimum."** Minimality rests only on C-F1-U's bounded two- and three-type scan, which I did not replay. Only
  "smallest found" is supportable.

**SR-C3-6b: R2's replacement sentence.**
- **Clause 1** (deletion-only Hall fails at six eligible rows, each via the root-plus-arm sector). I recomputed all six rows
  with the same instrument; all six sit in the unresolved band.

  | Row | `n` | `M` | `α` | `x` | window | `p` | `3p − 2M` | `F_p` | sector supply/deletion image | switch image/supply | (D)∪(S) nbhd/supply | WID sides |
  |---|---|---|---|---|---|---|---|---|---|---|---|---|
  | `CB(8,86)` | 1465 | 688 | 775 | 458 | [460, 516] | 460 | 4 | all 689 | `460/459` | 13.323464548 | 14.321290635 | equal |
  | `CB(8,89)` | 1516 | 712 | 802 | 474 | [476, 534] | 476 | 4 | all 713 | `476/475` | 13.788029163 | 14.785928322 | equal |
  | `CB(8,92)` | 1567 | 736 | 829 | 490 | [492, 552] | 492 | 4 | all 737 | `492/491` | 14.252593693 | 15.250561173 | equal |
  | `CB(8,108)` | 1839 | 864 | 973 | 575 | [577, 648] | 577 | 3 | all 865 | `289/288` | 16.726259891 | 17.722799683 | equal |
  | `CB(7,144)` | 2163 | 1008 | 1153 | 671 | [673, 768] | 673 | 3 | all 1009 | `337/336` | 29.037039076 | 30.034071717 | equal |
  | `G(8^82,7^2)` | 1427 | 670 | 755 | 446 | [448, 503] | 448 | 4 | all 671 | `448/447` | 13.107470205 | 14.105238063 | equal |

  - On each row the whole-sector family `X_sec` is a deletion-only deficient family of the full network (its deletion
    neighbourhood is computed in `I_p`). So (HALL-COND) with (D) arcs alone fails, and no deletion-only saturating flow exists.
  - At `CB(8,86/89/92)` my supply, capacity and `S` equal F1's printed integers digit for digit.
  - **Clause 1 is exact.** It is also a direct instance of the registered `CBSTAR` key at `t = 1` (`CB(d,m) = CBstar(d,m,1)`,
    `F_p = leafSet` derived) for the five CB rows. The non-uniform row is re-derived (6a).
- **Clause 2** (whole-tree saturation needing switch arcs exhibited only at non-eligible ranks). I brute-forced both named trees
  at every rank (`small_rows.py`), with `F_p` derived leaf by leaf and `S` from `H_v`/`R_v`:
  - **Order-8 tree** (edges `0–1, 1–2, 2–3, 2–6, 2–7, 3–4, 3–5`): `i = (1, 8, 21, 24, 12, 2)`, `α = 5`, `x = 3`.
    - The eligible window is empty: `x + 2 = 5 > ⌊2α/3⌋ = 3`.
    - At `p = 3`: `F_3` = all 5 leaves; supply 29, capacity 32, `S = −3` (WID from independent sides).
    - Deletion-only max-flow 27. The residual-graph family has 9 members, `Σ w = 22` and `Σ_{N_D} w = 20` (deficit 2 = 29 − 27).
    - (D) ∪ (S) max-flow 29, saturating; the flow was verified.
    - At `p = 2` both relations fail (`S = +21`); at `p = 4` both saturate.
  - **`CB(4,1)`** (`n = 12`): `i = (1, 12, 55, 126, 152, 89, 18)`, `α = 6`, `x = 4`.
    - The window is empty: `x + 2 = 6 > ⌊2α/3⌋ = 4`.
    - At `p = 4`: `F_4` = all 5 leaves; supply 60, capacity 60, `S = 0`.
    - Deletion-only max-flow 52. The deficient family is the whole sector: 32 members of weight 1 against a deletion image of
      weight 24 (`2^3·C(4,3)` and `2^2·C(4,2)`).
    - (D) ∪ (S) max-flow 60, saturating.

  Both rows are exactly as stated (29/32/−3, mixed 29, deletion-only 27; 60/60/0, deletion-only 52, mixed 60). On the capsule's
  record, no eligible row has been exhibited on which switch arcs are needed for whole-network saturation:
  - D2/D3 and E-g saturate with deletion arcs;
  - E-c rows saturate with deletion arcs alone as well;
  - the registered (HALL) notes say every computed eligible full-network row saturates with deletion arcs alone;
  - C-U2-F's 1,292 switch-load-bearing rows through order 15 are all at `p ∈ {x, x+1}` (single instrument; not replayed).

  **Clause 2 is exact as a statement of the record, but its parenthetical names two of many rows** (repair R-b2).
- **Clause 3** (no eligible row has proved saturation with switch arcs where deletion alone fails). This holds on the record:
  - at each of the six rows above, full-network saturation is open;
  - D2/D3 cover only the non-first ranks, where deletion suffices.

  One possible misreading needs a guard. The registered C2 note records sector Hall under (D) ∪ (S) at `CB(8,86)/460`,
  `CB(8,89)/476` and `CB(8,92)/492`, at ranks where deletion alone fails. That is Hall on sector subfamilies, not saturation
  (repair R-b3).
- **Replaced sentence.** "Switch arcs have never been load-bearing on any computed tree row" is false on the record: at the
  order-8 tree (`p = 3`) and at `CB(4,1)/4`, whole-network saturation needs the switch arcs. The replacement is warranted.
- **Fences.** The sentence claims no cut and no sector Hall at the three newer rows. It transfers no status, and it revives no
  refuted key: `E993-R23-LITERAL-DELETE-ONLY-HALL` is a different mechanism, lacking the active weight and the (S) arcs, and
  the deficits here are the objects that make (S) necessary.

**SR-C3-6c: R3's rows.**
- **Formula.** For `CB(d,m)` (and the generalized class) with `v ∈ F_p`: sector supply/deletion image
  `= R_{p−1}/R_{p−2} = 2(M − p + 2)/(p − 1)`, deficient iff `3p < 2M + 5`.
  - At `3p = 2M + 4` the ratio is `p/(p − 1)`: `460/459`, `476/475`, `492/491`, `448/447`.
  - At `3p = 2M + 3` it is `(p + 1)/(p − 1)`:
    - `CB(8,108)/577`: `M = 864`, `3·577 = 1731 = 2·864 + 3`, `2·289/576 = 578/576 =` **`289/288`**;
    - `CB(7,144)/673`: `M = 1008`, `3·673 = 2019 = 2·1008 + 3`, `2·337/672 = 674/672 =` **`337/336`**.
  - Both exact fractions come out of my instrument, from the forest DP and the binomials.
- **Eligibility.** I computed `α` and `x` from the polynomials.
  - `CB(8,108)`: `α = 973`, `x = 575` (`Δ_574 ≥ 0`, `Δ_575 < 0`), window **`[577, 648]`**.
  - `CB(7,144)`: `α = 1153`, `x = 671`, window **`[673, 768]`**.
  - Both first ranks are eligible, and each is the only rank in its window with `3p < 2M + 5`. `F_p` is derived as all leaves.
  - Supply − capacity = `S` from independent sides (supply/capacity 415 and 485 digits; `S` 413 and 483 digits).
  - Both windows agree with D3's ranges (`[578, 648]` and `[674, 768]` beyond the first ranks).
- **Ruling.** F's pattern ("every sector-deficient row found sits at `3p = 2M + 4`") holds only on the four rows F examined.
  R3's narrowing is exact.

**Exact integers of the three rows first recorded in Cycle 3** (`big_rows_{G,CB8_108,CB7_144}.json`; each `S` also equals the
arm-tag summand plus the private-leaf orbit sums):

```
G(8^82,7^2) @ p = 448
 supply   1478180094337546101844391296483023612531305990179532942758596512042432567889818086593628013517689898572411590677265779281056552318044429945673140104799410393588711789381638089607699075938853605767036223709332567031691452736598689928027198737060580818867416135131263712539093348110533880469365384908113380428441758306098644
 capacity 1496670835682832122718658209813219639158176823364216291370192991096770571937674095872516724327914547289264026670682042763706806724206834083297243227403326828137872654186821661784386204022480480449771104603448350721682019541124355317299142408813157536569468681202002743654158176389200121202050234472822629511865376600285652
 S        -18490741345286020874266913330196026626870833184683348611596479054338004047856009278888710810224648716852435993416263482650254406162404137624103122603916434549160864805183572176687128083626874682734880894115783689990566804525665389271943671752576717702052546070739031115064828278666240732684849564709249083423618294187008
 sector deficit 3421784001925350537063960448454359704371831077922941039026427221231897161834787240629546039260721494446858585098374972977603497576439968709482050963681485754712033477518558153038889316495719514271544447027504726262814099318978172875179531119018580108968910706716130697933444089667508620912608598056200307694632960000
CB(8,108) @ p = 577
 supply   1468018366407356180832951450355690735514125141727761184574325340013761676127112087606063192486174720221332343612957982265234574365888274562761163914521044629314805084625392111758224466390722363353928053668028903375932112898739675223448037677129598595889374169975396056861350852544302247411368561269437674044512043568798302291459985644261894056136324053614784778200340409386877185130193016288387572093619297690219424
 capacity 1482084919186270485657093287203635928760899005676598088021155810672248083744339066017176284879776140002922472029633840024915013215965036831916920670862249941691950702530376376896429506900632103148032383230774263407364633033180505427415598071904144019728331396406987330422694218557144093508513203182986882910001895529451532534642114344715781421470619934254701292688981118028809747377360738521424213636667305825680896
 S        -14066552778914304824141836847945193246773863948836903446830470658486407617226978411113092393601419781590128416675857759680438850076762269155756756341205312377145617904984265138205040509909739794104329562745360031432520134440830203967560394774545423838957226431591273561343366012841846097144641913549208865489851960653230243182128700453887365334295880639916514488640708641932562247167722233036641543048008135461472
CB(7,144) @ p = 673
 supply   68692312799954333963704122119190844921114436342163420927057314497896923204639078992786320353627984896888534541373827276464676921692144483745069349052308084962210820531339708940542531227815726299638690921177746616171918004690744062585095537554262005368088430663634275197642061563337769232758788428149445005614038061227305758233769818041613871422002391030305128492658587398994724245648696382032904445642375712896248501485597740869880800326409262607903922403683831615732544229850653978416
 capacity 69199277486629509528955823661678198617553637745783220440978025057671410451581018585075814215815660164374804891980154457671765385469361367527123014293746390082930320383591949968752773801094473849410086525048769484858182160030130941211882159457159461119085028298053093650958527207740601431014385220131215294732103674379274838635300357311794535150722381800931978063122569838577702406177078067801126354097376764472015098269610165017904036091746607557260839823311107388310716887807676347360
 S        -506964686675175565251701542487353696439201403619799513920710559774487246941939592289493862187675267486270350606327181207088463777216883782053665241438305120719499852252241028210242573278747549771395603871022868686264155339386878626786621902897455750996597634418818453316465644402832198255596791981770289118065613151969080401530539270180663728719990770626849570463982439582978160528381685768221908455001051575766596784012424148023235765337344949356917419627275772578172657957022368944
```

## Findings and repairs

1. **E-a is exact.** Every number reproduces on my instrument, with integers equal to C-F1-U's digit for digit: `n`, `N`, `α`,
   `x`, the window, `F_448`, `448/447`, the deficit, 13.107×, and "only eligible rank". The row is also new to the record. With
   my read, three instruments now agree: C-F1-U, the F adjudicator's forest DP, and this read's DP together with the H/R route.
   I did not rely on the controller's replay. No repair to the statement is needed. On the registered face, two things must
   travel:
   - (i) "switch-necessary" means only that deletion-only transport fails at an eligible rank, so any saturating flow must use
     switch arcs; whether the mixed network saturates there is OPEN;
   - (ii) the counting identity is the `t = 1` sector count re-derived for the non-uniform class. `G(8^82, 7^2)` is not a
     `CBstar(d,m,t)` member (non-uniform `d`), so the F adjudicator's phrase "is the registered
     `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` at `t = 1`" must not be read as that key covering this tree. The key's
     scope is not extended.
2. **R-b1 (clause 1: scope marker).** In "`CB(7,144)/673` (sector) and `G(8^82, 7^2)/448`" the parenthetical can be read as
   attaching to one row. All six failures are exhibited by the same family, the root-plus-arm sector. Repair: state the family
   once, for all six rows.
3. **R-b2 (clause 2: the parenthetical is non-exhaustive).** The order-8 tree and `CB(4,1)/4` are two of C-U2-F's 1,292
   switch-load-bearing rows through order 15, all at `p ∈ {x, x+1}`, and that census is single-instrument. Repair: say "for
   example", and cite the census at its single-instrument standing.
4. **R-b3 (clause 3: guard against the sector-Hall misreading).** Add that the Cycle 2 sector Hall under (D) ∪ (S) at the three
   `CB(8,·)` first ranks concerns sector subfamilies only. Also write "exhibited or proved" in place of "proved", so that the
   clause covers computation too.
5. **Observation (this read; elementary; offered for the record, not as a key).** On the generalized choke class with
   `v ∈ F_p`:
   - `W_v = {r}`, so the sector sources are exactly the `(p+1)`-sets in which the arm tag `v` is active;
   - by the (WID) bijection, sector supply `= q_v(p)`, and the positive-weight deletion image `{A : r, v ∈ A}` has size
     `q_v(p − 1)`;
   - so **the sector deletion deficit equals the arm tag's own summand `q_v(p) − q_v(p − 1)` of `S`**.

   My instrument confirms this equality exactly on all six rows. There the arm summand is positive, and the private-leaf
   summands carry `S < 0`.
6. **Label slip elsewhere in the record (advisory; outside my three statements; not a registration block).** The synthesis's
   `R30-CB-RECORD` paragraph under `## Headline verdicts` calls 15.25 the "switch-image ratio" at `CB(8,92)/492`. 15.25 is the
   ratio of the whole (D) ∪ (S) neighbourhood of the sector to the sector supply (my `15.250561173`). The switch image alone is
   `14.252593693`. E-b's "with (S) ratio 14.32 / 14.79 / 15.25" is the whole-neighbourhood ratio and is correct as labelled.
   E-a's 13.107× is the switch image alone and is correct as labelled. Suggested wording for whoever registers the `CB(8,92)`
   paragraph: "(D) ∪ (S) sector-neighbourhood ratio 15.25 (switch image alone 14.25)". SR-C3-6 does not register it.
7. **R3's closed form.** At `3p = 2M + 3` the ratio is `(p + 1)/(p − 1)`, and at `3p = 2M + 4` it is `p/(p − 1)`. I include
   this in the record text as arithmetic, not as a new claim.
8. **Single-instrument items stay so.** C-U2-F's 1,292-row census and C-F1-U's minimality scan were not replayed.

## Registration text

The row ids below are proposed. The controller assigns final ids, and changing an id does not change the text.

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL / TEXT: [r30 C3; SR-C3-6] Switch arcs on computed rows (replaces the Cycle 2 standing-state sentence "switch arcs have never been load-bearing on any computed tree row"). Deletion-only Hall ((HALL-COND) with the (D) arcs alone) fails at the eligible ranks CB(8,86)/460, CB(8,89)/476, CB(8,92)/492, CB(8,108)/577, CB(7,144)/673 and G(8^82, 7^2)/448, in each case on the root-plus-arm sector X_sec = {B in I_{p+1} : r, v in B} (F_p(T) = all leaves, derived; every member of X_sec has active weight 1; sector supply / positive-weight deletion image = 2(M - p + 2)/(p - 1), M the number of pendant pairs: 460/459, 476/475, 492/491, 289/288, 337/336, 448/447), so any saturating flow at those rows must use switch arcs; whole-tree saturation that needs switch arcs (deletion-only max-flow below the supply, (D) ∪ (S) max-flow equal to it) has been exhibited only at non-eligible ranks, for example the order-8 tree (edges 0-1, 1-2, 2-3, 2-6, 2-7, 3-4, 3-5) at p = 3 (supply 29, capacity 32, S = -3; deletion-only 27, mixed 29) and CB(4,1) at p = 4 (60 / 60 / 0; deletion-only 52, mixed 60), both trees with an empty eligible window, and C-U2-F's census of 1,292 such rows through order 15, all at p in {x, x+1} (single instrument); at no eligible row has saturation of the whole network with switch arcs been exhibited or proved where deletion alone fails (the Cycle 2 sector Hall under (D) ∪ (S) at CB(8,86)/460, CB(8,89)/476 and CB(8,92)/492 concerns sector subfamilies only, not saturation). G(8^82, 7^2) (order 1427) is the first tree on record outside the CB family, and the first on record below order 1465, with a deletion-deficient sector at an eligible rank; it answers the Cycle 3 Stage 1 gate's question whether any tree of order 20-1464 is switch-necessary (deletion-only transport fails at an eligible rank) in the affirmative; it is the smallest found by a bounded two- and three-type scan, not a proved minimum. Open at these rows: sector Hall under (D) ∪ (S) at CB(8,108)/577, CB(7,144)/673 and G(8^82, 7^2)/448, and whole-network saturation at all six first ranks. The pattern "every sector-deficient row sits at 3p = 2M + 4" holds only for CB(8,86)/460, CB(8,89)/476, CB(8,92)/492 and G(8^82, 7^2)/448 (ratio p/(p - 1)); CB(8,108)/577 and CB(7,144)/673 sit at 3p = 2M + 3 (ratio (p + 1)/(p - 1)). Grades: the rows bounded_computation; the weight-one and counting facts elementary (proved_informal): for CB(d,m) the t = 1 instance of E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT, for G(8^82, 7^2) re-derived for the non-uniform class (that key's scope is not extended). Fences: no (CUT) (X_sec is not deficient under (D) ∪ (S) on any of the six rows); a deletion-only deficit is not a refutation of (HALL) and revives no refuted key (E993-R23-LITERAL-DELETE-ONLY-HALL differs by the active weight and the (S) arcs); (HALL) stays OPEN; no status transfer to E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG or Erdős #993. Attribution: C-F1-U (Claude Opus 5.5; the order-1427 tree, its closed forms and the bounded scan); r30 F adjudicator (Claude Opus 5.5; second instrument, forest-DP sector counts); C-U2-F (Claude Opus 5.5; the order-8 and CB(4,1) rows and the 1,292-row census); r30 U adjudicator (Claude Opus 5.5); r30 Cycle 3 Stage 6 synthesis (Claude Opus 5.5; the replacement sentence and the 3p = 2M + 3 arithmetic); the Cycle 3 allocation's (O3) item (controller, Claude Fable 5.1) for the rows CB(8,108)/577 and CB(7,144)/673; C-T2-U and T2 for the registered t = 1 sector count; isolated second read SR-C3-6 (Claude Opus 5.5; independent third instrument, both small rows brute-forced); Codex (GPT-6 Astra/Sol/Luna) for the transport mechanism, the active-tag weight and the relation; the first-interior run (Codex) for the definition layer, entries 1-18.
```

```text
RECORD: R30-CB-RECORD-C3-EA-G8x82-7x2-P448 / CLAIM: G(8^82, 7^2): path r-s-v, 84 chokes u_i ~ r, 82 carrying 8 pendant paths u_i-b-c and 2 carrying 7; n = 1427, N = 670 pairs; tree check passed. alpha = 755, x = 446 (Delta_445 >= 0 > Delta_446, computed through rank alpha), eligible window [448, 503]; at p = 448, F_448 = all 671 leaves (derived from Delta_448(T - v) < 0 per leaf orbit; the same at every rank of the window); supply (322 digits) - capacity (322 digits) = S(G, 448) (320 digits, negative) from independent sides. The root-plus-arm sector X_sec = {B in I_449 : r, v in B} has every member of active weight 1; its supply R_447 = 2^447 C(670, 447) against the positive-weight deletion image R_446 = 2^446 C(670, 446) gives the ratio R_447/R_446 = 2(N - 446)/447 = 448/447 exactly, a deletion deficit of 316 digits (equal to the arm tag's own summand q_v(448) - q_v(447) of S), so deletion-only transport fails at this eligible rank; p = 448 is the only eligible rank with 3p < 2N + 5. With (S), the switch image of X_sec (the distinct targets (B - {r, b}) + {u_i}) weighs 13.107470... times the sector supply and the whole (D) ∪ (S) neighbourhood 14.105238... times, so X_sec is not a deficient cut; sector Hall under (D) ∪ (S) and whole-network saturation at this row are OPEN. Smallest found by a bounded two- and three-type scan of the generalized-choke class, not a proved minimum; the first eligibly deletion-deficient sector on record outside the CB family. / STATUS: bounded_computation / PROVENANCE: C-F1-U (Claude Opus 5.5; verify1427.py, closed forms, scan); r30 F adjudicator (Claude Opus 5.5; sector.py forest DP, 36 small-tree brute-force checks); isolated second read SR-C3-6 (Claude Opus 5.5; own generic tree DP, independent active-weight DP for supply and capacity, H_v/R_v deletion polynomials for S, own switch-image generating function validated by literal (D) ∪ (S) brute force on 52 small rows; integers equal to C-F1-U's digit for digit; scratchpad/c3-sr-SR-C3-6/big_rows_G.json sha256 780eca94002a5cba80fc8a95824cdc651a2e2e8896a756b2029c21946bc4424c); sector count: t = 1 count of E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT re-derived for non-uniform d (key scope not extended); Codex (GPT-6) for the mechanism and weight. Fences: not a (CUT); (HALL) OPEN; the primary aggregate untouched.
```

```text
RECORD: R30-CB-RECORD-C3-R3-CB8x108-P577 / CLAIM: CB(8,108): n = 1839, M = 864, alpha = 973, x = 575 (through rank alpha), eligible window [577, 648]; at p = 577, F_577 = all 865 leaves (derived); supply (415 digits) - capacity (415 digits) = S (413 digits, negative) from independent sides. The root-plus-arm sector is deletion-deficient: sector supply / positive-weight deletion image = 2(M - p + 2)/(p - 1) = 578/576 = 289/288 exactly, at 3p = 1731 = 2M + 3 (ratio (p + 1)/(p - 1)); p = 577 is the only eligible rank with 3p < 2M + 5. With (S) the switch image is 16.726259... times the sector supply and the whole (D) ∪ (S) neighbourhood 17.722799... times (not a cut); sector Hall under (D) ∪ (S) and whole-network saturation at p = 577 OPEN. / STATUS: bounded_computation / PROVENANCE: rows named in the r30 Cycle 3 allocation (O3) (controller, Claude Fable 5.1); ratio and 3p = 2M + 3 placement stated by the r30 Cycle 3 Stage 6 synthesis (Claude Opus 5.5); isolated second read SR-C3-6 (Claude Opus 5.5; own DP; scratchpad/c3-sr-SR-C3-6/big_rows_CB8_108.json sha256 56dd10d3081d79c63ec778f2588d5339dd14382882a4485fe17e3133438c0146); the deficiency criterion is the t = 1 instance of E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT (C-T2-U, T2). Fences: not a (CUT); (HALL) OPEN.
```

```text
RECORD: R30-CB-RECORD-C3-R3-CB7x144-P673 / CLAIM: CB(7,144): n = 2163, M = 1008, alpha = 1153, x = 671 (through rank alpha), eligible window [673, 768]; at p = 673, F_673 = all 1009 leaves (derived); supply (485 digits) - capacity (485 digits) = S (483 digits, negative) from independent sides. The root-plus-arm sector is deletion-deficient: sector supply / positive-weight deletion image = 2(M - p + 2)/(p - 1) = 674/672 = 337/336 exactly, at 3p = 2019 = 2M + 3 (ratio (p + 1)/(p - 1)); p = 673 is the only eligible rank with 3p < 2M + 5. With (S) the switch image is 29.037039... times the sector supply and the whole (D) ∪ (S) neighbourhood 30.034071... times (not a cut); sector Hall under (D) ∪ (S) and whole-network saturation at p = 673 OPEN. / STATUS: bounded_computation / PROVENANCE: rows named in the r30 Cycle 3 allocation (O3) (controller, Claude Fable 5.1); ratio and 3p = 2M + 3 placement stated by the r30 Cycle 3 Stage 6 synthesis (Claude Opus 5.5); isolated second read SR-C3-6 (Claude Opus 5.5; own DP; scratchpad/c3-sr-SR-C3-6/big_rows_CB7_144.json sha256 292f4e6f7384aeb6c5b18a3b810f39557928c8007edcbef48ed760a8ece14810); the deficiency criterion is the t = 1 instance of E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT (C-T2-U, T2). Fences: not a (CUT); (HALL) OPEN.
```

```text
RECORD: R30-CB-RECORD-C3-EF-ORDER8-P3 / CLAIM: The order-8 tree with edges 0-1, 1-2, 2-3, 2-6, 2-7, 3-4, 3-5: i = (1, 8, 21, 24, 12, 2), alpha = 5, x = 3, eligible window empty (x + 2 = 5 > floor(2 alpha/3) = 3). At the non-eligible rank p = 3, F_3 = all 5 leaves (derived), supply 29, capacity 32, S = -3 (independent sides); the deletion-only network has max-flow 27 (a deficient family of 9 sources, weight 22 against a deletion neighbourhood of weight 20), and the (D) ∪ (S) network saturates at 29 (flow verified arc by arc). Switch arcs are load-bearing for whole-network saturation at a non-eligible rank; this bears on no eligible row. / STATUS: bounded_computation / PROVENANCE: C-U2-F (Claude Opus 5.5; switch_search.py, n8_bruteforce_hall.py); r30 U and F adjudicators (Claude Opus 5.5); isolated second read SR-C3-6 (Claude Opus 5.5; own brute force and exact Dinic; scratchpad/c3-sr-SR-C3-6/small_rows_out.json sha256 63662ca39bdc025d37f6c2e1d955a36b56591c2ce7590c95dc9a794c14dc358a). Fences: non-eligible; not (HALL); no status transfer.
```

```text
RECORD: R30-CB-RECORD-C3-EF-CB4x1-P4 / CLAIM: CB(4,1) (n = 12): i = (1, 12, 55, 126, 152, 89, 18), alpha = 6, x = 4, eligible window empty (x + 2 = 6 > floor(2 alpha/3) = 4). At the non-eligible rank p = 4, F_4 = all 5 leaves (derived), supply 60, capacity 60, S = 0 (independent sides); the deletion-only network has max-flow 52 (the root-plus-arm sector, 32 sources of weight 1 against a deletion neighbourhood of weight 24, is the deficient family), and the (D) ∪ (S) network saturates at 60 (flow verified arc by arc). Switch arcs are load-bearing for whole-network saturation at a non-eligible rank; this bears on no eligible row. / STATUS: bounded_computation / PROVENANCE: C-U2-F (Claude Opus 5.5; sector_sweep.py, switch_search.py); r30 U and F adjudicators (Claude Opus 5.5); isolated second read SR-C3-6 (Claude Opus 5.5; own brute force and exact Dinic; scratchpad/c3-sr-SR-C3-6/small_rows_out.json sha256 63662ca39bdc025d37f6c2e1d955a36b56591c2ce7590c95dc9a794c14dc358a). Fences: non-eligible; not (HALL); no status transfer.
```

No new key is proposed, so there is no key name for the predicate check. The scope note and the records assert nothing beyond
what was recomputed above. The single-instrument census and the minimality scan are cited at their standing.

## Verdicts

verdict[SR-C3-6a]: confirmed
verdict[SR-C3-6b]: confirmed_with_repairs
verdict[SR-C3-6c]: confirmed

- 6a: every claim reproduces exactly: `α`, `x`, the window, `F_448`, `448/447`, the deficit, 13.107×, "only eligible rank",
  "not a cut" and "not a proved minimum". The row is new to the record. The two face conditions of finding 1 are carried in
  the record text.
- 6b: all three clauses are true on the record, and both small rows reproduce exactly. The repairs R-b1 to R-b3 (scope marker;
  non-exhaustive parenthetical with the census at its standing; the sector-Hall guard and "exhibited or proved") are
  incorporated in the scope-note text above.
- 6c: `289/288` and `337/336` at `3p = 2M + 3`, eligibility, and `F` derived. F's pattern is narrowed exactly as R3 rules.

## Artifact inventory

Scratch directory `scratchpad/c3-sr-SR-C3-6/` (run root). Everything ran in the foreground with `python3 -B` (stdlib, exact
integers), and no background job was started. Replay from that directory, about 12 s in total:
`python3 -B validate_lib.py; python3 -B sector_validate.py; python3 -B small_rows.py; python3 -B big_rows.py`.

| File | SHA-256 | Purpose |
|---|---|---|
| `sr6lib.py` | `1e4a1d7fc7512ca14560a27af8fb360f8953ca946da409f0edc2a18f6a5074c2` | Definitions; forest DP; independent active-weight DP; brute force; exact Dinic with verification and cut extraction |
| `gclass.py` | `2f0d86d981905ec9f4f18c7c9182b868c830c3d5608cd27d66c1d53afce7f3ff` | Builder for `G(d_1..d_m)` and `CB(d,m)` |
| `sector_formulas.py` | `d6f20293a88f97e855b06e9bbdac3a21c7cc1a9cf7f3f0ac2fc46888e19bd17b` | Sector counts; own switch-image generating function; C-F1-U's double sum (formula comparison only) |
| `validate_lib.py` | `036cc2c7f1a3e5b64f235332fa43193236c6ffabaca716d74ed194443fbab057` | Instrument validation: 300 seeded random trees |
| `validate_lib_out.json` | `e7198a8d4cd70b8ba6a3922ec31b0b1cf5e967d13d577ce8130b3383571d8554` | Its output |
| `sector_validate.py` | `790c3835874beda8f681344ba1212edb24ae2a24167c377966918d4ba285e910` | Instrument validation: literal (D) ∪ (S) on 10 small generalized-choke trees (52 rows) |
| `sector_validate_out.json` | `4c75f45fc5a9146be34147a5ef7cef6d452aabb327b604b2fb3ebd20d6303090` | Its output (0 failures) |
| `small_rows.py` | `845458ec2456f4d12f75473706af09a322cf3f10421bc7ac3053dfe4691d601a` | 6b: the order-8 tree and `CB(4,1)` at every rank |
| `small_rows_out.json` | `63662ca39bdc025d37f6c2e1d955a36b56591c2ce7590c95dc9a794c14dc358a` | Its output |
| `big_rows.py` | `ae393b7e90d0f62b0c8f9b33f9f328d8f299e33c60a6e23d346f6ce22ba1f052` | 6a/6b/6c: the six large rows |
| `big_rows_G.json` | `780eca94002a5cba80fc8a95824cdc651a2e2e8896a756b2029c21946bc4424c` | `G(8^82,7^2)/448` |
| `big_rows_CB8_108.json` | `56dd10d3081d79c63ec778f2588d5339dd14382882a4485fe17e3133438c0146` | `CB(8,108)/577` |
| `big_rows_CB7_144.json` | `292f4e6f7384aeb6c5b18a3b810f39557928c8007edcbef48ed760a8ece14810` | `CB(7,144)/673` |
| `big_rows_CB8_86.json` | `0ca4e874a6e874ae61ce8265dd7375575b6b89cd45c595bf3ca3b71e20004eff` | `CB(8,86)/460` |
| `big_rows_CB8_89.json` | `4ec699f02c383b4152772ef0a1ff2e18bbedb6f1b34d5d0a5511fa5ceccb8c7f` | `CB(8,89)/476` |
| `big_rows_CB8_92.json` | `3ca1a32ac511426a39bef7fdeb87036e5377d0b29f4faad752087e4f73a9376d` | `CB(8,92)/492` |

Deliverable: `second-reads/SR-C3-6/SECOND-READ.md` (this file). No sealed member was edited, and nothing was written under
`sources/`, `control/` or `cycles/`.
