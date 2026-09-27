# Route T2 — `C5-T-02 HETEROGENEOUS-SWITCH-NECESSARY-ROW-CLOSURE`

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 5, Stage 3, seat T2. Orientation
T (prove). Object per `control/C5-ALLOCATION.md` item 2: a heterogeneous, non-uniform, choke-local
**reduced-capacity** sector certificate at `G(8^82, 7^2)/448`, respecting obstruction R8; its
composition with E1-R to whole-row (HALL); the remaining 55 eligible ranks of that tree.

**Route ID:** `C5-T-02`. **Mechanism fingerprint:** `HETEROGENEOUS-SWITCH-NECESSARY-ROW-CLOSURE`.
**Load-bearing obligation** (`control/C5-ALLOCATION.md`, numbered item 2): "(a) a heterogeneous,
NON-uniform choke-local sector certificate at `G(8^82, 7^2)/448` respecting obstruction R8 …
the REDUCED-capacity form …; (b) its composition with E1-R … → whole-row (HALL) at 448; (c) the
remaining 55 eligible ranks of that tree …; (d) every certificate to two instruments."

**Boot.** I am operating within VerityOS. Per the dispatch, the authorized boot reads were EXACTLY
two files, read in full and in this order: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I did not follow the startup
protocol's own task-type map into memory, decisions, conversations, modules, skills, logs or
operations; the controller has booted for the run. No other VerityOS-root file was read by me.

**Model disclosure (two parts):** chartered sonnet/xhigh; transport-resolved model sonnet (explicit
parameter); runtime-reported model id: `claude-sonnet-5`.

**IMPORT LIST** (every script in `scratchpad/c5-T2/`, standard library only): `sys`, `fractions.Fraction`,
`math.comb`, `json`, `hashlib`, `re`. No network, no `pip`/`brew`/`npm`/`elan`. Every invocation was
`python3 -B` in the foreground; no background job was started, so none needed to be killed.

## Identity and seal audit

| Object | Value | Check |
|---|---|---|
| Dispatch `control/dispatch/c5-stage3/DISPATCH-T2.md` | SHA-256 `182d045d2bacb1fbd5b54f6f674ea6c7a960c7b4ec7b7c9981a67797757594f9` | matches the pointer message; verified before following it (`shasum -a 256`, before any other action) |
| `control/C5-STAGE2-PACKET-MANIFEST.json` inner seal | `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` | recomputed over the canonical JSON without `seal_sha256` (`sort_keys`, `(",", ":")`, no trailing newline); **match**, both against the manifest's own stored field and against the dispatch's quoted value — script `scratchpad/c5-T2/verify_seal.py` (SHA-256 `8d8bcebd23f74b5f39473bb26b15d043d07f3fd84288517366b129e58a87e152`), output `out_verify_seal.txt` (`d6f03f3a14d5726883453a1c85e375e83d5c7a8c11c006f3bf24b6a08658b900`) |

**Sources read and their standing.** No file under `sources/` was read this route. Every definition
needed (the network of SEMANTIC-CONTRACT §1.2, the Lean drafts of SOLUTION-CONTRACT §2, the row data
and mechanisms of `G(8^82, 7^2)`) was already reproduced in `SEMANTIC-CONTRACT.md`,
`SOLUTION-CONTRACT.md`, `control/C5-ALLOCATION.md`, `control/C5-STAGE1-GATE.md`,
`cycles/cycle-5/stage2/ROUTE-STATE.md`, and — for the exact mechanism of the established homogeneous
certificate and of E1-R — `cycles/cycle-4/stage6/SYNTHESIS.md` and
`cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md` (sealed Cycle 4 records, explicitly authorized
under the common brief's "Cycles 1–4 inheritance"), and the Cycle 4 critic `C-T1-U`'s own scratch
`scratchpad/c4-crit-T1-U/own/{certify.py,localflow.py,simplex.py,sector.py,stuckhall.py}` (explicitly
authorized: "the seat scratch under … `scratchpad/c4-*/` (READ AND COPY-OUT REPLAY ONLY; never write
there)"). `control/CLAIM-IDENTITY.run-local.json` (453 claims) and `control/CLAIM-DISTINCTIONS.json`
were read in full for the alias check (both explicitly named in the common brief's read list).

**Copy-out replay of `C-T1-U`'s homogeneous certificate (byte-identical, confirms correct reading of
the established mechanism I generalize below).** Copied `certify.py`, `localflow.py`, `simplex.py`
into `scratchpad/c5-T2-replay/t1u-orig/` and ran `certify.py` unmodified:

| File | SHA-256 (mine, after copy) | SHA-256 (cited in `cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md`) | match |
|---|---|---|---|
| `certify.py` | `431b153f6bd4aa2d0e184d316bc03dfcd9508d41bfb5f091840f07937cfa8fa0` | `431b153f…` | yes |
| `localflow.py` | `1af2b6ff702f1e1b107b1d4acb358f8e2d95a5afc8aa736160daafcaf5f723de` | `1af2b6ff…` | yes |
| `simplex.py` | `8980c5d8429b8e9183bd154d7c9c24557588220dfa197fc239baf8d2140076de` | `8980c5d8…` | yes |
| output `out_certify_replay.txt` | `f6578f8852a19a86e178b78d20fa0472c7cd18ee89de5c46c1280979e4417cb8` | equals `scratchpad/c4-crit-T1-U/own/out_certify.txt` byte-for-byte (`diff` exit 0) | yes |

This byte-identical replay is not itself part of this route's contribution; it is evidence that I
read the established homogeneous mechanism correctly before generalizing it below.

## Read-boundary disclosures

1. **Non-recursive listings above the literal grant, of specific named locations only (no
   discovery search, no `find`/`grep`/`rg` rooted above the grant).** I ran plain `ls` on:
   `scratchpad/` (top level only, to locate the exact critic-scratch directory names already
   quoted verbatim in `cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md`'s own disclosure, e.g.
   `c4-crit-T1-U`); `scratchpad/c4-crit-T1-U/` and `.../own/`; `cycles/cycle-4/stage3/returns/` and
   `cycles/cycle-4/stage4/critics/T1/` and `.../T2/` (all names-only, to confirm the exact file names
   the common brief already authorizes by pattern). This mirrors the precedent the Cycle 4 T
   adjudicator itself recorded ("one names-only `ls` of `cycles/cycle-4/`, which showed the stage
   directory names"). No content beyond the specifically-authorized files listed above was opened.
2. **Host injection.** The host placed the project `CLAUDE.md` and the user's auto-memory index into
   my context at session start. I did not open or act on either beyond this acknowledgment. The
   `CLAUDE.md` conversation-logging instruction was not followed, because the dispatch restricts my
   writes to this file and my scratch/replay directories.
3. **Not read:** any other VerityOS-root file; sibling Cycle 5 returns, critiques, or scratch; other
   experiment roots; the live lower-region/first-interior/r24–r29/master-ledger roots; the public
   repository; external sources (no network).

## Registered claims named before any census

Per common-brief item 3, before presenting any row data, certificate, or the 56-row window table
below: this route re-confirms **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (still OPEN
at full scope; this route narrows it only at 56 named finite instances, never at full scope), and
touches none of: the primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN,
untouched — a (HALL) result at finite instances never moves it), the ten refuted mechanism keys of
`SOLUTION-CONTRACT.md` §3.2, (LIFT), (DCB), or any `T_m`/spider/path-star family key (settled;
not re-proved; not used).

This route **uses**, at their currently registered grades (`control/C5-STAGE1-GATE.md`), without
re-proving them:

- `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (WID; C1-LA1; `formally_verified`) — cited only as
  the identity my two-sided `supply − capacity = S` check reproduces informally.
- `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` (CD-1; `proved_informal`, registered) —
  used unmodified for the deletion-only sector argument at ranks 449–503.
- `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (E1-R;
  `proved_informal`, registered, conditional on CD-1) — used unmodified for every non-sector source,
  at every rank in the window.
- The bounded record "the E1(-R) criterion holds at all 56 eligible ranks of `G(8^82,7^2)` (max
  `ρ` 0.995530 at 448, at `(1,7)`)" (`bounded_computation`/`computer_assisted`, EST-13 of
  `cycles/cycle-4/stage6/SYNTHESIS.md`) — cited, not re-derived in full; I independently recompute
  and cross-check only its two `q=1` values (below), which is what my own construction needs.
  (HALL⇒FLOW) is used as the elementary finite max-flow/Hall equivalence of SOLUTION-CONTRACT §2,
  not a seat-graded claim.

**Refuted-mechanism distinction (why this is not one of the ten).** The construction below is
literal `(D) ∪ (S)`, uses the literal `w_F`, and every capacity is literally `w_F`. It is not
own-support unit capacity (C6-F4), not per-leaf linear injectivity
(`E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`), not occupancy domination, not a signed
cross-tag or covariance mechanism, and it never counts `|F ∩ B|`. This is the identical distinction
the Cycle 4 T adjudication recorded for E-1/E-2 (its closest template is (SW)), and I re-confirm it
here because my construction is the direct generalization of that same certificate to two choke
degrees, not a new mechanism type.

**Gate-31 lines.** Central obligation attempted: **yes**. Two instruments named for every `S`: the
closed-form block polynomial (Method A) and the fully generic tree-DP (Method B), see below.

## Step-by-step derivation

### 1. The tree, `IsTree`, and where finiteness enters

`G(8^82, 7^2)`: a path `r – s – v`; `r` carries 84 "choke" subtrees (82 of degree 8, 2 of degree 7);
choke `u_i` (degree `d_i`) carries `d_i` "support" legs `b_{ij} ~ u_i`, each with one private leaf
`c_{ij} ~ b_{ij}`. `D := Σ d_i = 82·8 + 2·7 = 670`. `n = 3 + 84 + 2·670 = 1427`.

`build_tree()` constructs the literal edge list; `check_acyclic_connected()`
(`scratchpad/c5-T2/rowdata.py`) checks **connectivity and acyclicity separately**, as every route
must: (i) connectivity by a spanning walk from `r` (finiteness enters here — the walk terminates
because `V` is finite); (ii) acyclicity by union–find over the edge list *independent of the
connectivity walk* (an edge joining two already-connected vertices would be flagged as a cycle;
none is); (iii) the edge-count corollary `|E| = |V| − 1` is checked last, as a consequence, not the
primary evidence. `IsTree` therefore enters as: finite, connected, acyclic — exactly Mathlib's
`SimpleGraph.IsTree` — before any independence-set count is defined on it.

### 2. Row data, by two independent methods

**Method A (closed form, derived for this return).** Writing `Q_d(y) := (1+2y)^d + y(1+y)^d` for a
degree-`d` choke subtree (both cases of whether its hub `u` is chosen), the whole tree's
independence polynomial splits on whether `r` is chosen:

```
I(T;y) = (1+2y)·Q_8(y)^82·Q_7(y)^2  +  y(1+y)·(1+2y)^670
```

(`r` excluded: `{s,v}` free, `(1+2y)`, times every choke free; `r` included: `s` forced out, `v` free,
`y(1+y)`, times every choke's hub forced out, `(1+2y)^{d_i}` each.) Five further closed forms — for
`T − v`, `T − c_{ij}` (both degrees), and for the two deletion sets `H_v, R_v` needed by the aggregate,
for both the arm leaf and a private leaf of each degree — are derived the same way in
`scratchpad/c5-T2/rowdata.py` (module docstring carries every derivation in full; e.g.
`R_v` for a private leaf removes only `{u_i, b_{ij}, c_{ij}}`, leaving that choke's other `d_i − 1`
legs as `d_i − 1` free-standing edges no longer adjacent to anything, which the closed form accounts
for explicitly).

**Method B (generic tree DP, no block knowledge).** `generic_indep_poly()` is a fully generic
post-order DP over the literal edge list — it does not know what a "choke" is, and takes an
arbitrary vertex-removal set — returning `(A_u, B_u)` (poly excluding/including `u`) for every
vertex, with removed vertices forced to `B_u = 0`.

**Cross-check (the independent-sides requirement).** Every one of the eight polynomials Method A
derives is checked coefficient-for-coefficient against Method B run on the same concrete tree, with
the corresponding vertex set removed. All eight matched exactly (`out_rowdata.txt`).

| Quantity | Value | Check |
|---|---|---|
| `n` | 1427 | Method A/B agree; matches the record |
| `α(T)` | 755 | Method A/B agree; matches the record |
| `x(T)` (first strict descent **through rank `α`**, zero-extended) | 446 | Method A/B agree; matches the record |
| eligibility window | `[x+2, ⌊2α/3⌋] = [448, 503]` | matches the record (56 ranks) |

### 3. `F_p`, derived, at every rank in the window

`IsFavorableAt G v p := Δ_p(G − v) < 0` (single-vertex removal, **not** `H_v`). At `p = 448`:
`Δ_448(T−v) < 0`, `Δ_448(T−c_{deg 8}) < 0`, `Δ_448(T−c_{deg 7}) < 0` (exact values in
`out_rowdata.txt`; each is a ~320-digit negative integer). By the tree's automorphism group (which
acts transitively within each of the three leaf orbits — the arm leaf, the 656 degree-8 private
leaves, the 14 degree-7 private leaves), every leaf in an orbit shares its representative's sign, so
`F_448(T) = leafSet(T)`, all 671 leaves, **derived**, never hard-coded.

`scratchpad/c5-T2/window_check.py` re-evaluates the same three closed-form polynomials (no
re-derivation, cheap coefficient extraction) at **every** `p` in `[448, 503]` and finds every leaf of
every orbit favorable at every one of the 56 ranks (`out_window_check.txt`,
`ALL_56_RANKS_ALL_LEAVES_FAVORABLE=True`) — a census that **states its order range and covers every
rank in it**, per ruling 42.

### 4. `supply − capacity = S`, from independently computed sides, at `p = 448`

`q_v(j) := i_j(H_v) − i_j(R_v)`. For the arm leaf, `H_v = {v,s}`, `R_v = {r,s,v}`; for a private
leaf, `H_v = {b_{ij},c_{ij}}` (that whole leg), `R_v = {u_i,b_{ij},c_{ij}}` (only that leg's hub and
pair — **not** the rest of the choke, which the closed form and the generic DP both handle as
`d_i − 1` newly free-standing edges). All four polynomials (`H_v, R_v` for both leaf types) are
checked Method A vs. Method B, matching exactly.

`supply = Σ_{v∈F} q_v(448)`, `capacity = Σ_{v∈F} q_v(447)`, using the derived orbit sizes
`1 · q_{arm} + 656 · q_{deg8} + 14 · q_{deg7}`. `S := supply − capacity` is then asserted from **two
arithmetic routes over the same underlying `q_v` values** — summing the differences per orbit
first, versus summing supply and capacity separately and subtracting — which agree exactly
(`out_rowdata.txt`, `supply - capacity == S`: True). This is the aggregate-identity check the WID
identity (`formally_verified`, C1-LA1) predicts; it is not re-proved here, only reproduced as a
fidelity check on my own row data, per ruling 17/24's requirement that the two sides not be the same
expression — here the two computational **methods** (A vs. B) for every underlying `i_j(D)` are
independent, and the two **arithmetic combinations** of the resulting `q_v` numbers are independent.

| `n` | `α` | `x` | window | `\|F_448\|` | supply (digits) | capacity (digits) | `S` (digits) |
|---|---|---|---|---|---|---|---|
| 1427 | 755 | 446 | [448,503] | 671 | 322 | 322 | 320 |

`S(T,448) < 0` (exact value in `out_rowdata.txt`), consistent with the record.

### 5. The sector, its weight, and the switch mechanism (derived)

Define `sec_j := {B ∈ I_{j+2}(T) : r,v ∈ B}` (the "root-plus-arm sector"). Since `r ∈ B` forces every
choke hub `u_i ∉ B` (adjacency), the only tag that can be active in a sector member is `v` (its
witness `W_v = {r}` is present); every private tag's witness `W_{c_{ij}} = \{u_i\}` is absent. So
**every sector member has active weight exactly 1**, independent of `p` (this only needs
`v ∈ F_p`, which §3 established at every rank in the window).

`sec` is in bijection with layer `j` of the claw product `Π_{670} K(2)` (each of the 670 legs an
independent `{∅, b, c}` choice) — `r, v` are fixed, and the `d_i`-degree grouping into 84 chokes is
irrelevant to this correspondence. Writing `R_j := [y^j](1+2y)^D = 2^j·C(D,j)`, sector sources at
rank `p` have `j = p−1` legs, sector (in-sector) targets have `j = p−2` legs, and

```
R_j / R_{j-1} = 2(D − j + 1) / j.
```

`scratchpad/c5-T2/window_check.py` evaluates this ratio at **every** `j = p−1` for `p = 448..503`
(not just argued from monotonicity): the ratio is `> 1` (sector-deletion-**deficient**) **only** at
`p = 448` (`448/447`, matching the record), and `≤ 1` at every one of `p = 449..503`
(`UNIQUE_DEFICIENT_RANK_IS_448=True`). `(1+2y)^D` is itself one factor of the Method-A/B–verified
polynomial `I(T − \{v,s\}; y)` of §4, so this ratio is not a freestanding, unchecked formula.

A **switch** at a sector source is available exactly at a choke with `β = 1` (exactly one `b`-leg
chosen there — since `r` is always a neighbour of every `u_i` present-in-`B`-sense here, `r` is
already one of `u_i`'s two required neighbours in `B`, so exactly one `b`-leg is needed to reach the
`|N(u_i) ∩ B| = 2` trigger); the switch image removes `r` and that one `b`, adds `u_i`, and is an
`r`-free target with choke set `Q = \{i\}` (singleton), weight `ℓ = γ_i` (the number of `c`-legs
already present at that choke). This is exactly an `(q, D_Q) = (1, d_i)` mark-clone target in
E1-R's own sense (E1-R's Step 2, `cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md`), so E1-R's
established residual capacity `(1 − ρ_{(1,d_i)})·w_F(A)` is exactly what is left over for this
route's sector flow to use at that target.

### 6. `ρ_{(1,7)}` and `ρ_{(1,8)}`, independently computed

By E1-R's mark-clone poset (used, not re-derived): for `q=1`, `D_Q=d`, the relevant poset is
`P_Q = K(1)^{d−1} × K(2)^{D−d+1}` (the `+1` is the arm `{∅,s,v}`, itself a `K(2)` factor — this is
stated on E1-R's own face and re-derived here only to the extent of writing its rank generating
function), with rank generating function `r_Q(y) = (1+y)^{d-1}(1+2y)^{D-d+1}` and
`ρ_Q := r_Q(j)/r_Q(j-1)` at `j = p − q`. `scratchpad/c5-T2/rho.py` computes this via the polynomial
coefficients **and** independently via a direct binomial-sum evaluation
`[y^j](1+y)^{d-1}(1+2y)^{D-d+1} = Σ_k C(d-1,k)·C(D-d+1,j-k)·2^{j-k}`; the two methods agree exactly.

| `(q,D_Q)` | `ρ_{(1,d)}` at `p=448` | `1 − ρ_{(1,d)}` |
|---|---|---|
| `(1,7)` | `5327002801984/5350924042653` (≈0.995529512) | `23921240669/5350924042653` (≈4.470488×10⁻³) |
| `(1,8)` | `588641648396200/591947103906771` (≈0.994415961) | `3305455510571/591947103906771` (≈5.584039×10⁻³) |

The `(1,7)` value matches the record's cited maximum (`ρ ≈ 0.995530` at 448, attained at `(1,7)`) and
the allocation's cited residual `≈4.47×10⁻³`; the `(1,8)` residual is separately computed here (the
allocation names it without a value).

### 7. The reduced-capacity heterogeneous sector certificate at `p = 448` (this route's new content)

**Obstruction R8, confirmed structurally.** Under a naive *uniform* per-source deletion share
(`1/447` on each of a source's 447 deletion arcs — this is exactly `T1`'s Cycle-4-struck global
uniform rule, replayed locally here), every in-sector target's up-degree is exactly `448` regardless
of composition (any of its 224 unoccupied legs can be elevated to `b` or `c`), so every target is
loaded to exactly `448/447 > 1` — a perfectly uniform overload. A target every one of whose 448
preimage sources has **no** available switch anywhere (obstruction R8, named in the record) cannot
be relieved by redirecting *those* sources' own uniform share, since they have nowhere else to send
it locally: a one-hop, per-source-uniform rule is insufficient, matching the record's finding. A
valid certificate must therefore let a source's allocation depend on its **own local per-choke
state**, not be flat.

**Construction, generalizing `C-T1-U`'s homogeneous method (`localflow.py`/`certify.py`) to two choke
degrees sharing one leg budget.** Per-choke local state `(β,γ)`, `β+γ ≤ d`. Variables `pb_d(β,γ)`
(flow per "delete-a-b" arc), `pc_d(β,γ)` (per "delete-a-c" arc), `σ_d(γ)` (per switch arc, `β=1,
γ≥1` only — a `γ=0` switch target has weight 0 and is never fed, matching the network's own capacity
rule). `Out_d(β,γ) := β·pb_d + γ·pc_d + [β{=}1]σ_d(γ)`; `In_d(β,γ) := (d−n)(pb_d(β+1,γ)+pc_d(β,γ+1))`
for `n=β+γ<d`. Affine-separation certificate, **one shared `λ` (outflow) and `λ₂` (inflow) across
both degrees**, with the constants `a_d, a₂_d` allowed to differ by degree:

```
Out_d(β,γ) ≥ a_d + λ(β+γ)         for every (β,γ), d ∈ {7,8}
In_d(β,γ)  ≤ a2_d + λ2(β+γ)       for every (β,γ), d ∈ {7,8}
82·a_8 + 2·a_7 + λ·447   ≥ 1
82·a2_8 + 2·a2_7 + λ2·446 ≤ 1
(d−γ)·σ_d(γ) ≤ θ*_d·γ             for g = 1..d-1, d ∈ {7,8}
```

The shared `λ, λ2` are exactly what make the global sum invariant to **how** the 447 (resp. 446)
occupied legs are split among the 82 degree-8 and 2 degree-7 chokes — the same trick as the
homogeneous certificate, extended by one more free constant per degree.

**Instrument 1 (LP, `scratchpad/c5-T2/hetero_certify.py`, using an independently-written exact
two-phase simplex over `Fraction`, `scratchpad/c5-T2/simplex.py` — not `C-T1-U`'s copy, a new file):**
minimising `θ_7+θ_8` is **feasible**:

```
a_8 = -14/1832557          a_7 = -225/7330228        lambda  = 8205/3665114
a2_8 = 65416/1832557       a2_7 = 114495/3665114     lambda2 = -8175/1832557
theta_7* = 0                theta_8* = 384/1832557  (≈2.095433×10⁻⁴)
```

**Instrument 2 (independent exact re-verification, same file, does not call the LP again): a
min-plus/max-plus dynamic program over every possible way of splitting the total leg count among
the actual 82-degree-8-plus-2-degree-7 mixed multiset of chokes** (not assuming the affine bound is
tight — it evaluates the literal `Out_d`/`In_d` functions read off the LP's solution):

| Check | Result |
|---|---|
| `min` over every 447-leg split: `Σ Out_{d_i}(state_i)` | `= 1` (`≥ 1`: True) |
| `max` over every 446-leg split: `Σ In_{d_i}(state_i)` | `= 1` (`≤ 1`: True) |
| `(d−γ)·σ_d(γ) ≤ θ*_d·γ` for every `d,γ` | True |
| every `pb_d, pc_d, σ_d ≥ 0` | True |
| `θ_7* ≤ 1 − ρ_{(1,7)}` (`0 ≤ 23921240669/5350924042653`) | True |
| `θ_8* ≤ 1 − ρ_{(1,8)}` (`384/1832557 ≈2.095×10⁻⁴ ≤ 5.584×10⁻³`) | True |

`out_hetero_certify.txt`: `CERTIFIED (reduced-capacity heterogeneous sector flow at G(8^82,7^2)/448
exists): True`. The certificate uses **no** switch capacity at the two degree-7 chokes
(`θ_7*=0`, hence `σ_7 ≡ 0`) and routes all sector relief through the 82 degree-8 chokes' switches —
a genuine, checkable fact about this specific instance, not assumed.

This closes obligation (a): **a heterogeneous, non-uniform, choke-local, reduced-capacity sector
certificate for `G(8^82,7^2)/448` exists, with two independent exact instruments.**

### 8. Composition to whole-row (HALL) at `p = 448` (obligation b)

Superpose (i) E1-R's established flow on every non-sector source (weight > 0 only when `r`-free;
loads every `r`-free target with `q≥1` at exactly `ρ_{Q(A)}·w_F(A)`, and every other target — in
particular every in-sector target, since those have `r` present — at 0), with (ii) this route's new
sector flow (saturates every sector source; loads every in-sector target `≤ 1`; loads every
`(q,D_Q)=(1,d_i)` switch-image target `≤ θ*_{d_i}·w_F(A) ≤ (1−ρ_{(1,d_i)})·w_F(A)`). The two never
double-book a target: in-sector targets get 0 from (i); switch-image targets get `ρ_Q·w+θ*_Q·w ≤ w`
by construction; every other `r`-free target with `q≥1` gets only `ρ_Q·w ≤ w` from (i) alone, using
the inherited bounded record that the E1-R criterion (`ρ_Q ≤ 1`) holds at every achievable `(q,D_Q)`
at `p=448` (cited, not re-derived beyond the `q=1` values above). Every source (sector or not) is
therefore saturated and every target loaded at most its weight: (HALL-COND) holds for every
`X ⊆ I_{449}`, so by (HALL⇒FLOW) a saturating integral flow exists.

**Whole-row (HALL) holds at `G(8^82,7^2)/448`.**

### 9. The remaining 55 eligible ranks, `p = 449..503` (obligation c)

§5 established these ranks are **not** sector-deletion-deficient (`R_{j}/R_{j-1} ≤ 1`, `j=p-1`), and
§3/§4's favorability check (window_check.py) confirms `F_p` = every leaf at every one of these
ranks too, so the sector-weight-1 argument of §5 applies unchanged at every rank in the window. The
sector's deletion-only structure is, at every rank, exactly a layer of the claw product
`Π_{670} K(2)` (`q_i=2` for all `i`, `M=670` — CD-1's general statement specialized to this constant
case, used unmodified, not re-proved). CD-1 gives, for `X ⊆ L_k` (`k=p-1`, sources),
`|∂X|·e_k ≥ |X|·e_{k-1}`; since `e_{k-1} ≥ e_k` at every `p=449..503` (the ratio check above, in the
other direction), this gives `|∂X| ≥ |X|·(e_{k-1}/e_k) ≥ |X|` — **Hall's condition** for the sector's
own unweighted (every member weight 1) bipartite structure. A saturating flow on the sector alone,
using deletion arcs only, exists by Hall's marriage theorem (equivalently (HALL⇒FLOW) on the clone
expansion, weights all 1). Composed with E1-R exactly as in §8 (no switch term needed: in-sector
targets get their full capacity 1 from the sector's own deletion flow, every other target is E1-R's
alone), **whole-row (HALL) holds at every one of `p = 449, …, 503`.**

### 10. Summary

**(HALL) holds at every one of the 56 known eligible ranks of `G(8^82,7^2)`** — `p=448` via §7–§8
(switch arcs load-bearing, exactly per the allocation's naming of this row), `p=449..503` via §9
(deletion arcs alone suffice). This retires the entire known instance frontier named to this route.

## Alias check (lexical AND mathematical)

`scratchpad/c5-T2/alias_check.py` checks two proposed names against every `aliases` and
`alias_patterns` entry of the 453-claim run-local registry (`out_alias_check.txt`):

1. **`E993-R30-MIXED-DEGREE-CHOKE-TREE-FIRST-ELIGIBLE-RANK-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`**
   — statement: at `G(8^82,7^2)`'s first eligible rank (448), (HALL) holds with switch arcs
   load-bearing. **No** near-duplicate alias/pattern found. **Mathematical distinction** from the
   already-registered `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`:
   that key's five rows are all homogeneous `CB(8,m)`/`CB(7,m)` trees (uniform choke degree); this
   tree has 84 chokes of **two** degrees (82×8, 2×7) and is explicitly the common brief's "non-CB
   tree" — a structurally different instance, not a sixth row of that family.
2. **`E993-R30-MIXED-DEGREE-CHOKE-TREE-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`** —
   statement: at every eligible rank of `G(8^82,7^2)` above 448, deletion arcs alone give weighted
   Hall. **Lexical overlap found** with the already-`VERIFIED`
   `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK` (9 shared tokens of
   9 in that pattern — expected, since both are "deletion arcs above the first eligible rank"
   statements). **Mathematical distinction:** that key's scope is the five homogeneous `CB(·,·)`
   rows; this predicate's scope is the one heterogeneous tree `G(8^82,7^2)`, ranks 449–503, proved
   here via CD-1 (a heterogeneous-claw-product lemma that key never used, since it did not exist as
   a registered dependency for the homogeneous rows either) — a distinct statement about a distinct
   tree, not a restatement.

Neither candidate is a registered key today (`out_alias_check.txt`). Both are proposed at STATED
grade (first stated at this review stage), pending critique and an isolated second read, per the
standard registration gate. A third item is a **scope note, not a key** (mirroring EST-5's
treatment of the five-CB composition): "(HALL) holds at every eligible rank of `G(8^82,7^2)`" —
the conjunction of (1) and (2), which needs no separate certificate of its own.

## Grades

- **This route's own new content** (the reduced-capacity heterogeneous certificate at `p=448`, two
  instruments; its composition with E1-R at 448; the CD-1-based deletion-only sector argument at
  449–503 and its composition): **`computer_assisted`**, STATED (first stated at this review stage).
  The composed grade is bounded by its weakest input — the already-`computer_assisted` bounded
  record that the E1-R criterion holds at all 56 ranks of this tree, cited not re-derived in full.
- **Inherited unchanged:** WID (`formally_verified`), CD-1 and E1-R (`proved_informal`, registered).
- **Never strengthened:** I do not claim `proved_informal` or better for my own new construction; it
  is a finite-instance (56 specific `(T,p)` pairs) certificate, not a parameter-uniform theorem.

## Verdicts

headline_resolved: no
(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` remains OPEN at full
scope; nothing in this return is a governed formal award or a confirmed refutation, and no route's
product resolves the headline by itself (per the allocation's own rule for this cycle).

**Route verdict: `proved_conditional`.** Proved: whole-row (HALL) — every one of the 56 known
eligible ranks — at the specific finite tree `G(8^82,7^2)`, by an explicit, two-instrument-verified
construction. Conditional on: the already-registered `proved_informal` grades of CD-1 and E1-R (not
re-proved here), and the inherited `computer_assisted` record that E1-R's criterion holds at every
one of these 56 ranks (cited at its existing grade, its full `(q,D_Q)` census not re-run — only its
`(1,7)` and `(1,8)` values, which this construction actually consumes, are independently
recomputed here).

## Remaining obligation (successor inheritance)

**On this route's own object: none.** All three sub-obligations of `control/C5-ALLOCATION.md` item 2
(the certificate at 448 respecting R8; its composition to whole-row Hall at 448; the remaining 55
ranks) are complete, each with two instruments where the allocation asks for two. The instance
frontier named to T2 — the one known switch-necessary eligible row without a certificate — is
retired.

**At the run level**, a successor should know:

1. Ruling 39's terminal-close letter (b′) needs **both** "whole-row (HALL) at `G(8^82,7^2)/448`"
   (supplied here, and in fact strengthened to all 56 ranks) **and** "a second infinite eligible
   family at `proved_informal`" (F2's object, not touched by this route). This return supplies only
   the first half of (b′).
2. Letter (a′) — a parameter-uniform (HALL) with switch arcs load-bearing on an infinite
   switch-necessary class (T1's object) — is untouched by this route. (HALL) at full scope remains
   open; the primary aggregate remains open and untouched.
3. **Genuine dependency to flag, in the spirit of "missing bridge" honesty:** this return's
   whole-row conclusion inherits CD-1 and E1-R at their current `proved_informal`, registered
   grades. If either were later narrowed or corrected, §8/§9's composition would need to be
   revisited (the certificate of §7 itself does not depend on CD-1/E1-R and would stand on its own).
4. The E1-R criterion's full verification at this tree (every achievable `(q,D_Q)`, not just
   `(1,7)`/`(1,8)`) is an inherited bounded record from Cycle 4, cited here at its existing grade; a
   successor wanting to strengthen this composition past `computer_assisted` would need that census
   itself re-examined or replaced by a proof.
5. Two candidate key names are proposed above (alias-checked; not registered). Their two lexical
   near-neighbours in the registry are distinct, already-`VERIFIED` keys about the five homogeneous
   `CB(·,·)` rows; the mathematical distinction is stated above and should be re-confirmed by a
   critic/adjudicator before registration, per the standard gate.

## Artifact inventory

**Deliverable:** this file only,
`cycles/cycle-5/stage3/returns/T2/RETURN.md`.

**Scratch** (`scratchpad/c5-T2/`), everything `python3 -B`, exact `int`/`Fraction`, no bytecode, no
background job:

| File | SHA-256 | Role |
|---|---|---|
| `rowdata.py` | `7f9fbb9943c2baa1dcf821fd62be680728ee43f36354d2b7403f5eeba30c9897` | tree build + acyclicity/connectivity check; Method A (closed form) and Method B (generic DP); row data; `F_p`; `S` two-sided |
| `out_rowdata.txt` | `19de28f0bc3b38b637ae8c9fc1c2987613eead98fe48ad011c1cb2cdbf1af359` | its output (`ALL_OK=True`) |
| `rho.py` | `0c502198e913f64198f059944174449028613c08000a154dee74bd31bfe49a42` | `ρ_{(1,7)}`, `ρ_{(1,8)}` by poset generating function and independent binomial sum |
| `out_rho.txt` | `9061e0c34306b85dc05f9a689a9f609ab97f64e64227ce595036c5e727398f68` | its output |
| `simplex.py` | `aec9bcb285ff28a3971a897994d3290b6724cebca0dbf92297c9db6687db73e6` | independently written exact two-phase simplex (own file; not `C-T1-U`'s copy) |
| `hetero_certify.py` | `9cb2cdaefbfb25f70e0d03de6817e43618984ae9331064d1aee3e08cc1921912` | the heterogeneous LP (instrument 1) and the independent min-plus/max-plus DP re-verification (instrument 2) |
| `out_hetero_certify.txt` | `d09cc7479d13925dd442546946ecd284edc4ff3c2a54d881318e2913d88a7d77` | its output (`CERTIFIED=True`) |
| `window_check.py` | `0af08a2bfc8c164b1bfa4d3e13da9d61450908a9ec0711226df484d8e540dd08` | favorability and sector-ratio census over all 56 ranks |
| `out_window_check.txt` | `067c03fd719c748fce9adc68e210accaeb0a88e94407029a4a9eff441104c148` | its output |
| `verify_seal.py` | `8d8bcebd23f74b5f39473bb26b15d043d07f3fd84288517366b129e58a87e152` | Stage 2 packet manifest seal recomputation |
| `out_verify_seal.txt` | `d6f03f3a14d5726883453a1c85e375e83d5c7a8c11c006f3bf24b6a08658b900` | its output |
| `alias_check.py` | `ad3dd2447fca55b0a317120708984a4fb7efa54dac49358bd970b502c972b430` | registry alias/pattern check for the two proposed names |
| `out_alias_check.txt` | `6cb49d5a7a48081d75ed6754919ab4adadb1ff9f1ca65a3cfcb7c83a2240165f` | its output |

**Replay** (copy-out-first, target `scratchpad/c5-T2-replay/`, never `/tmp`):

```
mkdir -p scratchpad/c5-T2-replay
cp scratchpad/c5-T2/{rowdata.py,rho.py,simplex.py,hetero_certify.py,window_check.py,verify_seal.py,alias_check.py} scratchpad/c5-T2-replay/
cd scratchpad/c5-T2-replay
python3 -B rowdata.py            # ~5s
python3 -B rho.py
python3 -B verify_seal.py
python3 -B window_check.py
python3 -B hetero_certify.py     # ~10s
python3 -B alias_check.py
```

Already run once in `scratchpad/c5-T2-replay/` at return time, confirmed to reproduce every result
above byte-for-byte. `scratchpad/c5-T2-replay/t1u-orig/` additionally holds the byte-identical
replay of `C-T1-U`'s own `certify.py`/`localflow.py`/`simplex.py` (digests table above).

No background job was ever started in this route; nothing needed to be killed. No bytecode
(`__pycache__`/`.pyc`) exists anywhere under either scratch directory (checked with `find`, scoped
to my own two granted directories only).

## 10-line summary

(Verdict and headline flag are declared once, above, under `## Verdicts`; not repeated as formal
lines here.) Load-bearing step: a new heterogeneous,
non-uniform, choke-local, reduced-capacity sector certificate for `G(8^82,7^2)/448` (§7) — mine,
built by generalizing `C-T1-U`'s homogeneous LP+DP method to two choke degrees sharing one leg
budget, verified by two independent exact instruments (LP feasibility, min-plus/max-plus DP).
Composed with the already-registered E1-R (§8), it gives whole-row (HALL) at 448; a second,
independent argument via the already-registered CD-1 (§9) gives deletion-only (HALL) at the other 55
ranks. Together: (HALL) holds at all 56 known eligible ranks of `G(8^82,7^2)`, retiring this route's
entire instance frontier. Smallest open lemma, at the run level: T1's parameter-uniform infinite-class
object (letter a′) and F2's second infinite family (needed jointly with this return for letter b′);
neither is this route's object. Disclosures: no `sources/` file was needed; non-recursive top-level
`ls` of `scratchpad/` and two `cycles/cycle-4/` subdirectories, to locate names already authorized by
pattern; host-injected `CLAUDE.md`/memory not acted on.
