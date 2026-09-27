# Route T2 — `C6-T-02 CB-BAND-ROW-CERTIFICATES`

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 6 (sixth and last), Stage 3, seat
T2. Orientation T (prove). Route ID **`C6-T-02`**. Mechanism fingerprint **`CB-BAND-ROW-CERTIFICATES`**.
Load-bearing obligation (`control/C6-ALLOCATION.md`, numbered item 2): "T2's exact LP + DP + literal-
laboratory method at the uncertified band-rank rows of Cycle 5's census rectangle, smallest first
(`CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524`, `CB(7,112)/524`, …); an exact all-`q` E1 check first at
every row; per-state certificate tables shipped as DATA for T1's fit; the Codex relative-margin
mechanism … may be tried as an alternative certificate generator at its own recorded grade only."

**Boot.** I am operating within VerityOS. Per the dispatch, the authorized boot reads were EXACTLY two
files, read in full and in this order: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I did not follow the startup protocol's
own task-type map into memory, decisions, conversations, modules, skills, logs or operations; the
controller has booted for the run. No other VerityOS-root file was read by me.

**Model disclosure (two parts):** chartered sonnet/xhigh; transport-resolved model sonnet (explicit
parameter); runtime-reported model id: `claude-sonnet-5`.

**IMPORT LIST** (every script under `scratchpad/c6-T2/` and `scratchpad/c6-T2/inherited/`, standard
library only): `sys`, `os`, `json`, `hashlib`, `re`, `itertools`, `math.comb`, `fractions.Fraction`. No
network, no `pip`/`brew`/`npm`/`elan`. Every invocation was `python3 -B` in the foreground; no
background job was ever started, so none needed to be killed; no full process listing was run.

## Identity and seal audit

| Object | Value | Check |
|---|---|---|
| Dispatch `control/dispatch/c6-stage3/DISPATCH-T2.md` | SHA-256 `14e65fd5f6f4761f8bfda484995973070e7a2811b5229fe0dbd05c6d5eb1d4d2` | matches the pointer message; verified with `shasum -a 256` before following it, before any other action |
| `control/C6-STAGE2-PACKET-MANIFEST.json` inner seal | `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611` | recomputed over the canonical JSON without `seal_sha256` (`sort_keys`, `(",", ":")`, no trailing newline) — **match**; script `scratchpad/c6-T2/verify_seal.py`, output `out_verify_seal.txt` reproduced in the copy-out replay |

**Sources read and their standing.** No file under `sources/` was read this route: every definition
needed (the network of `SEMANTIC-CONTRACT.md` §1.2, the Lean drafts of `SOLUTION-CONTRACT.md` §2, the
row census and the homogeneous CB(d,m) mechanism) was already reproduced in `SEMANTIC-CONTRACT.md`,
`SOLUTION-CONTRACT.md`, `control/C6-ALLOCATION.md`, `control/C6-STAGE1-GATE.md`,
`cycles/cycle-6/stage2/ROUTE-STATE.md`, and — for the exact, already-tested LP+DP sector method and the
row-data two-instrument method — `cycles/cycle-5/stage3/returns/T2/RETURN.md` (the sealed Cycle 5 T2
return; explicitly authorized under the common brief's "Cycles 1–4 inheritance" clause, which also
covers Cycle 5's own sealed returns) and the Cycle 4 critic `C-T1-U`'s own scratch
`scratchpad/c4-crit-T1-U/own/{rowdata.py,fixedpoints.py,localflow.py,simplex.py,certify.py,sector.py}`
(explicitly authorized: "the seat scratch under … `scratchpad/c4-*/` READ AND COPY-OUT REPLAY ONLY;
never write there"). `control/CLAIM-IDENTITY.run-local.json` (460 claims) was read in full (via script,
not by eye) for the alias check.

**Copy-out replay of `C-T1-U`'s homogeneous instruments (byte-identical, confirms correct reading
before reusing them below).** Copied into `scratchpad/c6-T2/inherited/`:

| File | SHA-256 (mine, after copy) | Role |
|---|---|---|
| `rowdata.py` | `776f8061798733d1f6831bef47acd37be380adacf80dc806fe7fce1c41d9a656` | Instrument A (generic tree DP, any tree, any vertex removal) + Instrument B (CB(d,m) closed form); `rowA`/`rowB` |
| `fixedpoints.py` | `535922f81ac477666bf03eb5aecdf8d24a1a78d3ec8e5df6a7cce4c49bda194f` | sanity re-run against the semantic contract's `K_{1,12}` / path-star fixed points |
| `localflow.py` | `1af2b6ff702f1e1b107b1d4acb358f8e2d95a5afc8aa736160daafcaf5f723de` | builds the choke-local affine-separation LP for the root-plus-arm sector at `(d,m,p)` |
| `simplex.py` | `8980c5d8429b8e9183bd154d7c9c24557588220dfa197fc239baf8d2140076de` | exact two-phase simplex over `Fraction` |
| `certify.py` | `431b153f6bd4aa2d0e184d316bc03dfcd9508d41bfb5f091840f07937cfa8fa0` | Instrument 1 (LP) + Instrument 2 (independent min-plus/max-plus DP re-verification); `certify`, `rho1` |
| `sector.py` | `90cea707374c3556ed2d53837191a3484755fc613232d4e9023c36d997f7346e` | per-choke state generating function vs. literal brute-force enumeration on small CB(d,m) laboratories |

These six digests are identical to the files at `scratchpad/c4-crit-T1-U/own/` (`shasum -a 256`
comparison run both ways; `localflow.py`/`simplex.py`/`certify.py` are also byte-identical to the three
files C5-T2 cited under those same three hashes). These files are **run unmodified** on the Cycle 6
target rows below (function calls only; no edits) — this route's Cycle 6 rows are all single-choke-
degree `CB(d,m)`, so the *homogeneous* method applies directly, with no generalization needed (unlike
C5-T2's mixed-degree `G(8^82,7^2)`, which generalized this same method to two choke degrees).

## Read-boundary disclosures

1. **Non-recursive listings/greps of specific named, already-authorized locations (no discovery
   search).** `ls -la` on `scratchpad/c4-crit-T1-U/own/` (to see the exact file names before reading
   files the common brief already authorizes by pattern) and on
   `cycles/cycle-5/stage3/returns/T2/` (to confirm the sealed return's existence before reading it);
   `wc -l`/`ls -la` on `control/SOURCE-DIGESTS.json` and `control/CLAIM-IDENTITY.run-local.json` (size
   checks on single named authorized files, not a directory search); `grep -n` for two literal
   filenames inside the single file `control/SOURCE-DIGESTS.json` (to find their digest entries; I
   ultimately did not read either file — `ordinary_tree_checked.py` and `cb-switch-cut/RESULTS.json`
   were not needed since every definition was already reproduced in the contracts, so **zero files
   under `sources/` were opened this route**); `grep -rn "B7"` over two specific named, authorized
   files (`cycles/cycle-5/stage6/SYNTHESIS.md`, `cycles/cycle-4/stage6/SYNTHESIS.md`) and one specific
   named, authorized file (`cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md`), to find where the
   composition principle `B7` (`AG-U-B7`, `weightedHall_of_saturatingFlowQ`) is named, since
   `control/C6-ALLOCATION.md` cites it by that short name without restating it. This mirrors the
   precedent the sealed Cycle 5 T2 return itself recorded for the identical purpose. No content beyond
   the specifically-authorized files above was opened.
2. **`find`, scoped strictly to my own two granted directories.** `find scratchpad/c6-T2
   scratchpad/c6-T2-replay -iname '*.pyc' -o -iname '__pycache__'` (empty result) to confirm no
   bytecode exists anywhere under either directory I am granted to write in; never rooted above the
   grant.
3. **Host injection.** The host placed the project `CLAUDE.md` and the user's auto-memory index into
   my context at session start. I did not open or act on either beyond this acknowledgment; the
   `CLAUDE.md` conversation-logging instruction was not followed because the dispatch restricts my
   writes to this file and my two scratch/replay directories.
4. **Not read:** any other VerityOS-root file; sibling Cycle 6 returns, critiques, or scratch; other
   experiment roots; the live lower-region/first-interior/r24–r29/master-ledger roots; the public
   repository; external sources (no network); any file under `sources/` (none was needed).

## Registered claims named before any census

Per common-brief item 3, before presenting any row data, certificate, or table below: this route
re-confirms **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (still OPEN at full scope; this
route narrows it only at four named finite `(T,p)` instances, never at full scope), and touches none
of: the primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN, untouched — a
(HALL) result at finite instances never moves it), the ten refuted mechanism keys of
`SOLUTION-CONTRACT.md` §3.2, (LIFT), (DCB), or any `T_m`/spider/path-star family key (settled; not
re-proved, not used).

This route **uses**, at their currently registered grades (`control/C6-STAGE1-GATE.md`), without
re-proving them:

- `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID; `formally_verified`) — cited only as the
  identity the two-sided `supply − capacity = S` check below reproduces, on new instances, by two
  genuinely independent computational routes (never as a self-check on one route's own numbers).
- `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (E1-R;
  `proved_informal`, registered, conditional on CD-1) — used unmodified for every non-sector (`r`-free)
  source/target at each of the four rows below.
- `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (the E1
  rank-threshold key; `proved_informal`, registered, modulo Darroch) — cited for "E1(i) holds at every
  `q`" at each row's rank, via the arithmetic check `p ≥ ⌈μ₁⌉ + 2` (below); not re-derived.
- The composition principle named `B7` (`AG-U-B7`, `weightedHall_of_saturatingFlowQ` in
  `cycles/cycle-4/stage6/SYNTHESIS.md`) — an elementary fact (a flow that saturates every source and
  never overloads a target directly implies weighted Hall for every subfamily, by summing flow
  conservation over the subfamily); used as an elementary logical step, not a seat-graded claim, the
  same treatment C5-T2 gave `(HALL⇒FLOW)`.
- `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` (registered,
  `computer_assisted`) — the already-closed sibling rows `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`,
  `CB(8,108)/577`, `CB(7,144)/673`, cited only to confirm my four NEW rows are disjoint from it (alias
  check, below); not re-verified as evidence (`sector.py`'s own `__main__` re-runs its three small rows
  unmodified, which is a re-confirmation of the METHOD, not a re-proof of that key).

**Refuted-mechanism distinction (why this is not one of the ten).** The construction below is literal
`(D) ∪ (S)`; every weight is literally `w_F` of §1.2 (never `|F ∩ B|`); every capacity is literally
`w_F(A)`. It is not own-support unit capacity (C6-F4), not per-leaf linear injectivity, not occupancy
domination, not a signed cross-tag or covariance mechanism. This is the identical homogeneous
mechanism `C-T1-U` established in Cycle 4 (already distinguished there and re-confirmed by the Cycle 5
T adjudication), applied unmodified to four new `(d,m,p)` triples — not a new mechanism type.

**Gate-31 lines.** Central obligation attempted: **yes**. Two instruments named for every numeric claim
below (Instrument A/B for row data; LP/DP for the sector certificate; two formulas for `ρ_{(1,d)}`;
literal enumeration for the network-dual weight generating function).

## Step-by-step derivation

### 1. The tree, `IsTree`, and where finiteness enters

`CB(d,m)`: path `r–s–v` (`0–1–2`), `m` chokes `u_i ~ r`, each choke `d` supports `b_{ij} ~ u_i`, each
support one private leaf `c_{ij} ~ b_{ij}`. `n = 3 + m(2d+1)`. `is_tree()` (`inherited/rowdata.py`)
checks connectivity and acyclicity **separately**: (i) connectivity by a spanning walk from `r=0` —
finiteness enters here, the walk terminates because `V` is finite; (ii) acyclicity by an independent
parent-tracking DFS that flags any edge to an already-visited non-parent vertex; (iii) the edge-count
corollary `|E| = |V| − 1` is checked as a consequence, not primary evidence. `myrows_basic.py` runs this
on all four target trees before anything else:

```
CB(8,95): n=1618 IsTree=True
CB(7,109): n=1638 IsTree=True
CB(8,98): n=1669 IsTree=True
CB(7,112): n=1683 IsTree=True
```

`IsTree` therefore enters as finite, connected, acyclic — Mathlib's `SimpleGraph.IsTree` — before any
independence-set count is defined.

### 2. Row data, by two independent methods, all four rows

**Instrument A** (`rowA`, `inherited/rowdata.py`): a fully generic post-order tree DP on the literal
adjacency — it does not know what a "choke" is, and accepts an arbitrary vertex-removal set. **Instrument
B** (`rowB`, same file): the CB(d,m) closed form `Q_d(y) := (1+2y)^d + y(1+y)^d`,
`I(T;y) = (1+2y)·Q_d(y)^m + y(1+y)·(1+2y)^{dm}` (splitting on whether `r` is chosen; `r` excluded: `s,v`
free times every choke free; `r` included: `s` forced out, `v` free, every choke's hub forced out), with
the five further closed forms for `T−v`, `T−c`, `H_v`, `R_v` (both leaf types) derived the same way.

`myrows_basic.py` asserts `A['n']==B['n']`, `A['alpha']==B['alpha']`, `A['x']==B['x']`, `A['F']==B['F']`,
`A['S']==B['S']` for every row (`out_myrows_basic.txt`):

| Row | `n` | `α` | `x` (first strict descent, through rank `α`) | `Δ_x<0` | `Δ_{x−1}≥0` | window `[x+2, ⌊2α/3⌋]` | leaves | `\|F_p\|` | `S<0` | instrA==instrB |
|---|---|---|---|---|---|---|---|---|---|---|
| `CB(8,95)/508` | 1618 | 856 | 506 | True | True | `[508,570]` | 761 | 761 | True | True |
| `CB(7,109)/510` | 1638 | 873 | 508 | True | True | `[510,582]` | 764 | 764 | True | True |
| `CB(8,98)/524` | 1669 | 883 | 522 | True | True | `[524,588]` | 785 | 785 | True | True |
| `CB(7,112)/524` | 1683 | 897 | 522 | True | True | `[524,598]` | 785 | 785 | True | True |

`CB(8,95)/508`'s window `[508,570]` matches the record cited in `control/C6-ALLOCATION.md`. Every row's
target rank `p` equals `x+2` (the first eligible rank) exactly (`p_at_first_eligible=True` in
`out_myrows_basic.txt`), and — checked below — equals the sector-deficient rank `⌊(2dm+4)/3⌋` too. `F_p`
is **derived** at every row (never hard-coded): `|F_p|` equals the total leaf count at every row, i.e.
every original leaf (the arm leaf `v` and every private leaf `c_{ij}`) is favorable — confirmed by
`Δ_p(T−v)<0` and `Δ_p(T−c)<0` computed by both instruments, not assumed.

`S(T,p)` for each row (exact, 363–376 digit integers; full values in `out_myrows_basic.txt`), all
negative:

```
S(CB(8,95),508)  = -237881982694643918302571210326119962842749197995277576746770635242249421092379592271873108559155417125643349300466770374033143378883473452981299090798416256734954427691868456540216334500040895967219435392962629061241160007598943574809610660933864959207100317017805045672052239049873464509946281810398023294086729803136548006454356819100776381312361400212629114720
S(CB(7,109),510) = -101844249697249151902234339370102599966464142017207964059842435136243322598684376776286524964959064119239307778772120120445923822988466643980008354877661252855639199031607829739320843917396991064607632834952239010899614947568691475387460401755771708775630707337665756082743880298513857113575086235141951256047314835108830826498155146055482866596088214762152240735901
S(CB(8,98),524)  = -75580978428495827957866668784103185774669782171151467738770900090307833029879625759000595277653659601155275946122536275952149902204710072321536008565783055196370411743159038316618438566674572519339780877895264232964086457549435525207994005875503655709203105240302522285054730277391034258003577813651572513019203765765301806611452740507647189583894035238737647328773169702144
S(CB(7,112),524) = -1267135235341656447058894554462131056782995823891655437614527181382844317155741359613898835466334166537252860259797620764601766692560088218533013529574339539307376352085972239073536888105889835658562570541396935296722529892712748606112753191358064432015629060013258507773902542457296516755783835653400269565989634555540850102984869793990176885803167772923816299518269330979504
```

### 3. `supply − capacity = S`, from **independently derived** sides (avoiding the exact self-check Cycle 5 struck)

Cycle 5's synthesis struck "T2's `supply − capacity = S` self-check". Reading that Cycle 5 return
(`inherited/rowdata.py`'s own `rowA`), `supply`/`capacity` there are DEFINED as
`narm·qa[p]+npriv·qc[p]` and `narm·qa[p-1]+npriv·qc[p-1]` — the exact same `q_v` numbers that already
make up `S = narm·(qa[p]-qa[p-1])+npriv·(qc[p]-qc[p-1])` by distributing a subtraction; asserting they
subtract to `S` is true by algebra, not evidence (ruling 17/24). **This route does not repeat that.**
Instead `network_dual.py` (new this route) computes `supply` and `capacity` from the WHOLE-NETWORK
active-weight generating function of `SEMANTIC-CONTRACT.md` §1.2 directly — a formula with no algebraic
relation to the leaf-aggregate `q_v` route:

- Per choke: exclude-branch `((1+2x)^d, 0)`; include-branch `(x(1+x)^d, d·x²(1+x)^{d-1})` — a "dual
  number" pair `(value, ∂/∂w at w=1)` for the bivariate `w_F`-tracking generating function, combined
  by the product rule `(A,A')·(B,B') = (AB, A'B+AB')` so no 2-D array is ever built (both stay ordinary
  integer polynomials in `x`). `r` excluded: `(1+2x,0)` times the `m`-th dual power of the per-choke
  total; `r` included: `x(1+2x)^{dm}` times the `v`-term `(1+x, x)` (since `v`'s sole witness is `r`,
  present in this branch).
- `Φ(x) =` the resulting value polynomial (the ordinary independence polynomial — a THIRD cross-check
  against Instrument A/B's `α`, below); `Ψ(x) =` the derivative polynomial, `[x^k]Ψ = Σ_{|A|=k} w_F(A)`.
  `supply := [x^{p+1}]Ψ`, `capacity := [x^p]Ψ`.
- **Literal brute-force validation** (`network_dual.py`'s `brute_force_check`, before trusting the
  closed form on the large rows): builds the actual small graph, enumerates every subset by
  `itertools.combinations`, filters independence, computes `w_F(B)` by the literal §1.2 definition
  `#{v∈F∩B : (B∖{v})∩W_v ≠ ∅}`, and compares the exact per-size totals against `Ψ`'s coefficients:

```
CB(2,2) sizes 0..6: literal=[0,0,5,40,116,148,76,8]     network_dual=[0,0,5,40,116,148,76,8]     match=True
CB(3,2) sizes 0..7: literal=[0,0,7,78,348,808,1044,726,226] network_dual=[same]                   match=True
CB(2,3) sizes 0..6: literal=[0,0,7,90,474,1318,2076,1836]   network_dual=[same]                   match=True
```

At the four target rows (`out_network_dual.txt`), `supply − capacity` computed this way **equals `S`
from §2, exactly, in every one of the 363–376 digits**, for all four rows. This is now a genuine,
falsifiable cross-check: the whole-network dual-number route and the leaf-aggregate `q_v` route are
structurally unrelated formulas, both independently validated (the former against literal enumeration
on three small graphs; the latter as Instrument A vs. B), and they agree.

| Row | supply (digits) | capacity (digits) | `supply−capacity == S` |
|---|---|---|---|
| `CB(8,95)/508` | 365 | 365 | True |
| `CB(7,109)/510` | 368 | 368 | True |
| `CB(8,98)/524` | 376 | 376 | True |
| `CB(7,112)/524` | 378 | 378 | True |

### 4. E1(i) at every `q`, cited from the registered threshold key, all four rows

The E1 rank-threshold key states E1(i) holds for every `q` iff `p ≥ ⌈μ₁⌉+2`, `μ₁ = (4dm−d+1)/6`, `d≥6`
(cited, not re-derived). All four rows have `d∈{7,8}≥6`. `myrows_basic.py` computes `μ₁` exactly
(`Fraction`) and checks `p = ⌈μ₁⌉+2`:

| Row | `d` | `m` | `μ₁` | `⌈μ₁⌉` | `⌈μ₁⌉+2` | `p` | equal |
|---|---|---|---|---|---|---|---|
| `CB(8,95)/508` | 8 | 95 | `1011/2` | 506 | 508 | 508 | True |
| `CB(7,109)/510` | 7 | 109 | `1523/3` | 508 | 510 | 510 | True |
| `CB(8,98)/524` | 8 | 98 | `1043/2` | 522 | 524 | 524 | True |
| `CB(7,112)/524` | 7 | 112 | `1565/3` | 522 | 524 | 524 | True |

Every row sits **exactly** at the E1 threshold rank — E1(i) holds for every `q` at each of these four
`p`'s, by direct citation of the registered key's arithmetic condition. This also equals the
sector-deficient rank `⌊(2dm+4)/3⌋` in every case (508, 510, 524, 524 respectively) — the "top
sector-deficient rank" and the "first eligible rank" coincide for exactly these four `(d,m)` pairs,
which is why they are the smallest members of the 218-row uncertified census.

### 5. The sector, its deficiency ratio, and `ρ_{(1,d)}` by two independent formulas

`sec_j := {B ∈ I_{j+2}(T) : r,v∈B}`. Since `r∈B` forces every choke hub `u_i∉B`, the only tag that can
be active in a sector member is `v` (witness `{r}`, present); every private tag's witness `{u_i}` is
absent — **every sector member has active weight exactly 1** (needs only `v∈F_p`, established in §2).
`sec` is in bijection with a layer of the claw product `Π_{dm} K(2)`; writing `R_j := [y^j](1+2y)^{dm}`,
`myrows_sector_rho.py` calls `inherited/sector.py`'s unmodified `counts()` (already validated against
literal enumeration on eight small CB(d,m) laboratories, `out_inherited_sector.txt`, reconfirmed
byte-identically this route) at each row's `K=p−1`:

| Row | `R_K/R_{K−1}` | `=p/(p−1)`? | sector deficient |
|---|---|---|---|
| `CB(8,95)/508` | `508/507` | True | True |
| `CB(7,109)/510` | `510/509` | True | True |
| `CB(8,98)/524` | `524/523` | True | True |
| `CB(7,112)/524` | `524/523` | True | True |

`ρ_{(1,d)}` (the `E1-R` mark-clone ratio this route's certificate must beat) is computed by TWO
independent formulas in `myrows_sector_rho.py`: (a) `inherited/certify.py`'s `rho1` — polynomial
convolution of `(1+y)^{d-1}` and `(1+2y)^{d(m-1)+1}`, coefficient ratio at `p−1` over `p−2`; (b) a direct
binomial-sum evaluation `[y^j](1+y)^{d-1}(1+2y)^{D-d+1} = Σ_k C(d-1,k)·C(D-d+1,j-k)·2^{j-k}`. Both agree
exactly at every row (`out_myrows_sector_rho.txt`):

| Row | `ρ_{(1,d)}` | `1−ρ_{(1,d)}` (≈) |
|---|---|---|
| `CB(8,95)/508` | `1354839571516225/1361543988640524` | `6704417124299/1361543988640524` (≈4.9241×10⁻³) |
| `CB(7,109)/510` | `2982099946725/2993854889462` | `11754942737/2993854889462` (≈3.9264×10⁻³) |
| `CB(8,98)/524` | `5057315892440097/5081573746706788` | `24257854266691/5081573746706788` (≈4.7737×10⁻³) |
| `CB(7,112)/524` | `136682886311740/137207200323159` | `524314011419/137207200323159` (≈3.8213×10⁻³) |

### 6. The homogeneous reduced-capacity sector certificate, unmodified LP+DP, all four rows

`myrows_certify.py` runs `inherited/certify.py`'s `certify(d,m,p)` unmodified — Instrument 1 (the exact
`Fraction` LP of `inherited/localflow.py`, minimising `θ`) and Instrument 2 (an independent exact
min-plus/max-plus DP over every possible way of splitting the total leg count `K`/`K−1` among the `m`
identical chokes — it does NOT assume the LP's affine bound is tight; it evaluates the literal
`Out_d`/`In_d` functions read off the LP's own solution). Results (`out_myrows_certify.txt`):

| Row | `θ*` | `1−ρ_{(1,d)}` | ratio `(1−ρ)/θ*` | min source outflow `≥1` | max in-sector target inflow `≤1` | `(d−γ)σ(γ)≤θ*γ` ∀γ | `CERTIFIED` |
|---|---|---|---|---|---|---|---|
| `CB(8,95)/508` | `96/604265` (≈1.5887×10⁻⁴) | `6704417124299/1361543988640524` | 30.99 | True | True | True | **True** |
| `CB(7,109)/510` | `32/317857` (≈1.0067×10⁻⁴) | `11754942737/2993854889462` | 39.00 | True | True | True | **True** |
| `CB(8,98)/524` | `96/642947` (≈1.4931×10⁻⁴) | `24257854266691/5081573746706788` | 31.97 | True | True | True | **True** |
| `CB(7,112)/524` | `8/83889` (≈9.5364×10⁻⁵) | `524314011419/137207200323159` | 40.07 | True | True | True | **True** |

`σ(γ)` per-state tables (`out_myrows_certify.txt`; these are the per-state tables shipped as DATA for
T1's fit, per the allocation): e.g. `CB(8,95)/508`: `σ(1..7) = 96/4229855, 32/604265, 288/3021325,
96/604265, 32/120853, 288/604265, 336/604265`. Every `θ*` is a NEW value, distinct from the five already
registered (`96/495419, 96/530501, 96/566783, 16/65097, 16/138633`) — these four rows extend the census
rectangle, not repeat it.

### 7. Composition to whole-row (HALL), all four rows

Superpose (i) `E1-R`'s established flow on every non-sector (`r`-free) source, loading every `r`-free
target with `q≥1` at `ρ_{Q(A)}·w_F(A) ≤ w_F(A)` and every other target at 0 — using E1(i) at every `q`
(§4, cited) — with (ii) this route's certified sector flow (§6: saturates every sector source; loads
every in-sector target ≤1 = its full weight; loads every `(1,d)`-type switch-image target ≤
`θ*·w_F(A) ≤ (1−ρ_{(1,d)})·w_F(A)`, by construction). The two never double-book a target: in-sector
targets (contain `r`) get 0 from (i), their full capacity from (ii) alone; switch-image targets (a
switch removes `r`, so these ARE `r`-free) get `ρ_{(1,d)}·w + θ*·w ≤ w` because `θ* ≤ 1−ρ_{(1,d)}` (§6,
verified with margin ≥31× at every row); every other `r`-free target with `q≥1` gets only `ρ_Q·w ≤ w`
from (i) alone. Every source is therefore saturated and every target loaded at most its weight:
(HALL-COND) holds for every `X ⊆ I_{p+1}` at each row, so by `B7` (an elementary consequence of summing
flow conservation over `X`, §"Registered claims" above) a saturating integral flow exists.

**Whole-row (HALL) holds at `CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524`, `CB(7,112)/524`.**

This closes, at four new instances, exactly the same load-bearing step the already-registered
`FIVE-CB-FIRST-ELIGIBLE-RANKS-…` key closed at its five rows, and retires four of the 218 uncertified
switch-necessary rows named to this seat (214 remain, per the census of record; this route did not
attempt to close all of them — see Remaining obligation).

**Codex relative-margin mechanism.** `sources/heterogeneous-closure/` was NOT read or tried this route
(it is authorized "at its own recorded grade only" as an alternative generator; the homogeneous LP+DP
already certified all four target rows on the first attempt, so trying a second generator was not
needed to meet this route's obligation and would not have changed the verdict).

## Alias check (lexical AND mathematical)

`alias_check.py` checks one candidate name against every `claim_key`/`aliases`/`alias_patterns` entry
of the 460-claim run-local registry (`out_alias_check.txt`):

**`E993-R30-FOUR-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`** — statement: at
each of `CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524`, `CB(7,112)/524` (each row's own first eligible
rank), (HALL) holds with the two-for-one switch arcs load-bearing. **No exact `claim_key` match.**
**Lexical overlap found** (expected): 13/14 tokens shared with the already-registered
`E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` (differs only in
the cardinal, `FOUR` vs `FIVE`); 9/14 tokens shared with
`E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`; 7/14 with
`E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`. No `alias_pattern` regex
of any registered claim matched the candidate's statement text. **Mathematical distinction:** the four
`(d,m,p)` triples here (`(8,95,508)`, `(7,109,510)`, `(8,98,524)`, `(7,112,524)`) are DISJOINT from the
five already-registered rows (`(8,86,460)`, `(8,89,476)`, `(8,92,492)`, `(8,108,577)`, `(7,144,673)`) —
a distinct, non-overlapping instance set of the same theorem TYPE (homogeneous CB(d,m), first eligible
rank, switch arcs load-bearing), not a restatement or a strengthening of the existing key. **Naming
recommendation (not this route's decision):** given the 13/14-token overlap, I recommend the synthesis
consider MERGING these four rows into the existing `FIVE-CB-…` key's scope (e.g. renaming it to name
all nine rows, or a `NINE-CB-…` successor key) rather than keeping two near-identical parallel keys —
this is the ruling-48 naming-discipline call, deliberately left to the synthesis/critics, not decided
here. Neither this candidate nor any alternative is registered by this return; it is proposed at
**STATED** grade, pending critique and an isolated second read, per the standard registration gate.

## Grades

- **This route's own new content** — the network-dual whole-network supply/capacity computation (§3,
  a genuinely new, non-circular `supply−capacity=S` check on four new instances) and the composed
  whole-row (HALL) verdict at the four target rows (§7, built by applying `C-T1-U`'s unmodified
  homogeneous LP+DP method — no generalization was needed — to four new `(d,m,p)` triples, both
  instruments CERTIFIED at every row): **`computer_assisted`**, STATED (first stated at this review
  stage). The composed grade is bounded by its weakest input, exactly as Cycle 5's precedent: the
  already-`proved_informal` `E1-R` and the E1 rank-threshold key are cited, not re-derived, and the
  certificate itself is a finite-instance LP/DP result, not a parameter-uniform theorem.
- **Inherited unchanged:** WID (`formally_verified`); E1-R and the E1 rank-threshold key
  (`proved_informal`, registered, modulo Darroch where the threshold key states so).
- **Never strengthened:** no claim here is presented as `proved_informal` or better; four specific
  finite `(T,p)` certificates, not a family theorem — `θ*` is reported at each instance, never fitted
  to a closed form in `m` (that is T1's object, and this return's tables are explicitly the DATA T1
  needs, not an attempt at T1's uniform claim).

## Verdicts

headline_resolved: no

**headline_resolved: no** — `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` remains OPEN at full scope;
nothing in this return is a governed formal award or a confirmed refutation, and no route's product
resolves the headline by itself this cycle (`control/C6-ALLOCATION.md`'s own rule).

**Route verdict: `proved_conditional`.** Proved: whole-row (HALL) at four specific finite instances —
`CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524`, `CB(7,112)/524` — by an explicit, two-instrument-
verified sector certificate composed with the already-registered `E1-R`. Conditional on: the
already-registered `proved_informal` grades of `E1-R` and the E1 rank-threshold key (not re-proved
here, and the latter is itself modulo Darroch).

## Remaining obligation (successor inheritance)

**On this route's own object:** the census of uncertified switch-necessary rows named to T2 has 218
members (`control/C6-ALLOCATION.md`); this return certifies the smallest 4 by the exact method the
allocation names ("smallest first"). **214 rows remain uncertified** by this method; nothing in this
return's construction suggests the homogeneous LP+DP will fail on any of them (every row tried this
cycle certified on the first attempt, with `θ*` margins ≥31× over `1−ρ_{(1,d)}`), but that is an
observation about four data points, not a proof — a successor should run `certify(d,m,p)` (unmodified;
`scratchpad/c4-crit-T1-U/own/certify.py` or this route's `inherited/certify.py`, byte-identical) down
the remaining 214-row list, smallest first, exactly as this route did.

**At the run level, a successor should know:**

1. T1's object (a single parameter-uniform certificate fitted in `m`, `(L-S)_top`) needs the `θ*`
   values this and future T2-style passes produce as fitting data; this return supplies four new
   points (§6's table) beyond the five already registered.
2. The alias-check naming tension (above): whether to register a fresh `FOUR-CB-…` key alongside the
   existing `FIVE-CB-…` key, or to have the synthesis rename/merge them into one key covering all nine
   rows certified to date, is a decision for the synthesis/critics, not resolved here.
3. **Genuine dependency to flag:** this return's whole-row conclusion inherits `E1-R` and the E1
   rank-threshold key at their current registered grades; if either were later narrowed or corrected
   (in particular the threshold key's "modulo Darroch" qualifier), §7's composition would need
   revisiting — the sector certificate of §6 itself does not depend on either and would stand on its
   own as a `computer_assisted` fact about the sector alone.
4. The Codex relative-margin mechanism (`sources/heterogeneous-closure/`) was never tried; a successor
   who wants a second certificate generator for cross-validation, or who finds a row where the
   homogeneous LP+DP fails, has that alternative available at its own recorded grade.

## Artifact inventory

**Deliverable:** this file only, `cycles/cycle-6/stage3/returns/T2/RETURN.md`.

**Scratch** (`scratchpad/c6-T2/`), everything `python3 -B`, exact `int`/`Fraction`, no bytecode
(confirmed by `find`, scoped to my own two granted directories, see disclosure 2), no background job:

| File | SHA-256 | Role |
|---|---|---|
| `verify_seal.py` | `a94c72ae5ecf883c4d8c40f3b66459f183d767a59a1caff5f160ffe413d978f1` | Stage 2 packet manifest seal recomputation |
| `out_verify_seal.txt` | `87e7340ce939b0e2b643c4bf8e634876594c9dbd2e6eff331875b7cb8359a205` | its output (`match: True`); byte-identical in `scratchpad/c6-T2/` and the `-replay/` copy |
| `myrows_basic.py` | `c8fbd8b0191b83ad8f678614cf05308143864a2c2b3566c8cfa43d788a13da57` | calls inherited `rowA`/`rowB` on the four target rows; `IsTree`; `n,α,x,Δ_x,Δ_{x-1}`, window, `F_p`, `S`; E1-threshold arithmetic |
| `out_myrows_basic.txt` | `cc8f5e5fc76b8b5e5459bbdf78f4084b3edddc8af3d8c03f31573574bcbc8309` | its output (`ALL_OK=True`) |
| `network_dual.py` | `0b1797671ce7fb066e3863ade95dc4a10a5ced83b47c030320df1fc33958d84f` | NEW: dual-number whole-network `supply`/`capacity`, validated by literal brute force on 3 small CB(d,m) |
| `out_network_dual.txt` | `82e7d145da15c2ccc06037c2b3d2002bde382d770515811c1a5cfcef2b021378` | its output (`DONE=True`, brute-force matches) |
| `myrows_certify.py` | `2eda7a9655ef74c32315270b67667dd1fc607aa7abdbd1f05c2b8561c3099dc4` | calls inherited `certify()` (LP + independent DP) on the four target rows |
| `out_myrows_certify.txt` | `b9f54e77467bc0d21db59a1c65dd5d88b16cffff54162d65dd8850f1c99b65df` | its output (`ALL_FOUR_ROWS_CERTIFIED=True`) |
| `myrows_sector_rho.py` | `93f09a00f3e40e5ccf395d02a38ffc099ae23af392a0edbb86402cffced2a861` | sector deficiency ratio (inherited `counts()`); `ρ_{(1,d)}` by two independent formulas |
| `out_myrows_sector_rho.txt` | `9b36892050600aa19b2a7a980f24eb02110038a6c8e66e9674eeac217dd3ea39` | its output (`ALL_OK=True`) |
| `alias_check.py` | `4bb483410f90d00dac215f08846ba65c561b639393b8c83d87af062d623c1e1c` | registry alias/pattern check for the one proposed name |
| `out_alias_check.txt` | `0f6f926b3d19ec38ef35e7549fa45df4d09ee87a07dc287a859a27d87811b8a9` | its output (`REGISTERED_TODAY: False`) |
| `inherited/rowdata.py` | `776f8061798733d1f6831bef47acd37be380adacf80dc806fe7fce1c41d9a656` | copy-out of `scratchpad/c4-crit-T1-U/own/rowdata.py` |
| `inherited/fixedpoints.py` | `535922f81ac477666bf03eb5aecdf8d24a1a78d3ec8e5df6a7cce4c49bda194f` | copy-out; re-run reproduces the semantic contract's `K_{1,12}`/path-star fixed points exactly |
| `out_inherited_fixedpoints.txt` | `fd795f4c6bf794b667397e66cf3e155acddfca97b1b2d0b249d3cf57d4def9ee` | `K_{1,12} p=8: (13,12,6,12,1980,3960,-1980)` etc., matching `SEMANTIC-CONTRACT.md` §1.2 |
| `inherited/localflow.py` | `1af2b6ff702f1e1b107b1d4acb358f8e2d95a5afc8aa736160daafcaf5f723de` | copy-out |
| `inherited/simplex.py` | `8980c5d8429b8e9183bd154d7c9c24557588220dfa197fc239baf8d2140076de` | copy-out |
| `inherited/certify.py` | `431b153f6bd4aa2d0e184d316bc03dfcd9508d41bfb5f091840f07937cfa8fa0` | copy-out |
| `inherited/sector.py` | `90cea707374c3556ed2d53837191a3484755fc613232d4e9023c36d997f7346e` | copy-out |
| `out_inherited_sector.txt` | `076e0cdeffcda6aedaca1372fe40aacb91440c35c1246f490ea2a73075f7e9f3` | unmodified re-run: 8 small literal-vs-GF laboratories + the 3 already-registered rows, all match |

**Replay** (copy-out-first, target `scratchpad/c6-T2-replay/`, never `/tmp`):

```
mkdir -p scratchpad/c6-T2-replay/inherited
cp scratchpad/c6-T2/{verify_seal.py,myrows_basic.py,network_dual.py,myrows_certify.py,myrows_sector_rho.py,alias_check.py} scratchpad/c6-T2-replay/
cp scratchpad/c6-T2/inherited/*.py scratchpad/c6-T2-replay/inherited/
cd scratchpad/c6-T2-replay
python3 -B verify_seal.py          # <1s
python3 -B myrows_basic.py         # ~4s
python3 -B network_dual.py         # ~4s
python3 -B myrows_certify.py       # ~40s (the four LP solves + DP re-verifications)
python3 -B myrows_sector_rho.py    # ~3s
python3 -B alias_check.py          # <1s
cd inherited && python3 -B fixedpoints.py && python3 -B sector.py
```

Already run once in `scratchpad/c6-T2-replay/` at return time; every result above reproduced
byte-for-byte. No background job was ever started in this route; nothing needed to be killed. No
bytecode (`__pycache__`/`.pyc`) exists anywhere under either scratch directory (checked with `find`,
scoped to my own two granted directories only, per disclosure 2).

## 10-line summary

(Verdict and headline flag are declared once, above, under `## Verdicts`; not repeated as formal lines
here.) Load-bearing step: the homogeneous
choke-local reduced-capacity sector LP+DP certificate (`C-T1-U`'s Cycle 4 method, `inherited/{localflow,
simplex,certify}.py`, run unmodified — no generalization was needed since all four rows are
single-degree `CB(d,m)`) — CERTIFIED at all four new rows with `θ*` margins ≥31× over `1−ρ_{(1,d)}`;
this is inherited machinery applied to new instances, not this route's own invention, but the
composition to whole-row (HALL) via `E1-R`+`B7` (§7) and the new non-circular network-dual
`supply−capacity=S` check (§3, validated by literal brute force, deliberately avoiding the exact
self-check Cycle 5 struck) are this route's own content. Smallest open lemma, at the run level: the
same 214 remaining uncertified rows of the census, plus T1's own parameter-uniform object (untouched
by this route) and the naming-merge question for the `FOUR-CB-…`/`FIVE-CB-…` keys. Disclosures:
non-recursive named-location `ls`/`grep`/`wc -l` only (listed above), zero `sources/` files opened,
`find` scoped to my own two granted directories, host-injected `CLAUDE.md`/memory not acted on.
