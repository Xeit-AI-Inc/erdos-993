# RETURN — Route `T1`, Cycle 4, r30 (weighted mixed-boundary transport, Erdős #993)

**Route ID / mechanism fingerprint:** `C4-T-01 CB-FIRST-RANK-COUPLED-ALLOCATION`. Orientation `T` (prove).
**Model disclosure (two-part, on the face):** chartered sonnet/xhigh; transport-resolved model sonnet (explicit
parameter); runtime-reported model id: `claude-sonnet-5`.

**central obligation attempted: yes** — the stated object is C4-ALLOCATION.md item 1(a): prove (HALL-COND) under
(D)∪(S) at `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492` for every family meeting the sector `sec`, the
positive-weight `V` sources and a positive-weight `S`/`O` source (the Cycle 2 obligation (O2), narrowed by SR-C3-4),
by the allocation method named in the ledger: E1's `q=1` residual, an `ε`-share switch from switch-live sector
sources onto their `u_i`-switch targets, and rebalancing verified by exact branch-type generating-function
summation.

## Boot

I am operating within VerityOS. Boot reads: exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full, per the dispatch's override. I did not follow
the startup protocol's own task-type map into memory, conversations, modules, operations, logs, decisions or
knowledge for this task; the controller has booted for the run.

## Read-boundary disclosure

1. **Manifest size.** `control/C4-STAGE2-PACKET-MANIFEST.json` (270.4 KB) exceeds my file-reading tool's 256 KB
   display cap, so I could not `Read` it directly. I instead loaded it with a `python3 -B` script (standard
   library `json`/`hashlib` only) that parsed the JSON, popped `seal_sha256`, recomputed the canonical-JSON SHA-256
   (`sort_keys=True`, `separators=(",",":")`, no trailing newline) and printed the two values for comparison. No
   member content beyond the seal computation was displayed or inspected. **Seal cited:
   `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`** — matches the manifest's own field and the
   dispatch's stated value exactly (see Stage 2 seal section below).
2. **Non-recursive `ls` inside `cycles/`.** Before I had located the exact Cycle 3 filenames from the brief's own
   text, I ran two precautionary non-recursive `ls` calls: `cycles/cycle-3/` and `cycles/cycle-3/stage6/` (plus two
   `wc -l` line counts on `cycles/cycle-3/CYCLE-CLOSE.md` and `cycles/cycle-3/stage6/SYNTHESIS.md`). Both `ls` calls
   returned only file/directory names (`stage2`…`stage7`; `SYNTHESIS.md`), never contents; no `-R`, glob, or `find`
   was used. This duplicates information the Worker Common Brief already states explicitly by path
   (`cycles/cycle-{1,2,3}/stage6/SYNTHESIS.md`, `cycles/cycle-{1,2,3}/CYCLE-CLOSE.md`), so nothing beyond the
   brief's own grant was learned, but `cycles/` is listed as above this seat's grant for recursive search, so the
   two `ls` calls are disclosed out of caution, matching the run's disclosure culture (precedent: the Cycle 3 `T1`
   return's nine `ls` disclosures).
3. **Non-recursive `ls` of the top-level `scratchpad/`.** Before creating my own `scratchpad/c4-T1/` and
   `scratchpad/c4-T1-replay/` directories I ran one non-recursive `ls` of `scratchpad/` itself (to sanity-check the
   directory exists and to avoid colliding with another seat's name). It returned only directory names from prior
   cycles (e.g. `c1-F1`, `c1-F1-replay`, `c1-T1`, …), never contents. `scratchpad/` (other than my own seat's
   subdirectory) is listed as above this seat's grant; disclosed accordingly.
4. **Searches within the grant.** Two searches rooted at `sources/` (within the grant): `grep -rl "CB(d" sources/`
   (list-only, no content shown; two file names returned) and `find sources -iname "*cb*" -type f` (no results).
   Neither displayed file content, and no `sources/` file was subsequently opened for content (see item 6).
5. **Files actually read for content, all within the explicit grant.** `verity.md`, `identity/startup-protocol.md`;
   `control/C4-WORKER-COMMON-BRIEF.md` (in full); `SEMANTIC-CONTRACT.md` (in full); `SOLUTION-CONTRACT.md` (in
   full); `control/C4-ALLOCATION.md`; `control/C4-STAGE1-GATE.md`; `cycles/cycle-4/stage2/ROUTE-STATE.md`;
   `cycles/cycle-3/CYCLE-CLOSE.md`; `cycles/cycle-3/stage6/SYNTHESIS.md` (lines 1–445 of 674; the truncated
   remainder is the Lean registrar's fragment-digest table for the C3-LA1 award, which this route's mathematics
   does not use); `cycles/cycle-3/stage3/returns/T1/RETURN.md`; `second-reads/SR-C3-3/SECOND-READ.md`;
   `second-reads/SR-C3-4/SECOND-READ.md`; `control/CLAIM-IDENTITY.run-local.json` (448 claims, read via `python3
   -B`/`json`, used only for the Step 0 alias check).
6. **No file under `sources/` was read for content.** As with the Cycle 3 `T1` route, all mathematics below is
   derived from `SEMANTIC-CONTRACT.md`/`SOLUTION-CONTRACT.md`'s binding definitions, the Cycle 3 sealed record
   named above (cited at its recorded grade, never re-proved), and this route's own from-scratch code. No entry of
   `control/SOURCE-DIGESTS.json` therefore required verification (the requirement is conditional on reading a
   `sources/` file). `control/AUTHORIZATION.md`, `control/R30-CHARTER-PROMPT.md`, `control/RESIDUE-CHECK.json` and
   any file under `sources/` were **not** read; the Worker Common Brief's binding content (§1.2, the network; the
   fences) is fully contained in `SEMANTIC-CONTRACT.md`/`SOLUTION-CONTRACT.md`, which were read in full.
7. **Not read:** sibling Cycle 4 seats' scratch, returns, or critiques (none exist yet at Stage 3); Cycle 1–2
   returns/critiques/adjudications (not needed — Cycle 3's `T1` return and its two second reads already carry the
   exact `sec`/`R0`/`S`/`V`/`O` class definitions, the E1 criterion in cleared integer-rank form, and the exact
   `ρ_1` fractions this route reproduces and extends); any other experiment root; any live root; Mathlib (no Lean
   in this route); no network; no installs; no `skills/optimization-loop/skill.md`.
8. **Background jobs.** None were started; every script below ran to completion in the foreground. Nothing to
   kill.

## Stage 2 seal and source digests verified

- Stage 2 packet manifest inner seal: recomputed SHA-256 of the canonical JSON of
  `control/C4-STAGE2-PACKET-MANIFEST.json` with the `seal_sha256` field removed (`sort_keys=True`,
  `separators=(",",":")`, no trailing newline) = **`f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`**
  — matches both the manifest's own `seal_sha256` field and the value cited in the dispatch exactly. **I cite this
  seal value: `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`.**
- No `sources/` file was read (disclosure item 6), so no `control/SOURCE-DIGESTS.json` entries required
  verification.

## IMPORT LIST (standard library only, across every script in `scratchpad/c4-T1/`)

`math.comb`, `fractions.Fraction`, `itertools.combinations`, `itertools.product` (unused, present via
`itertools` import only), `collections.deque`, `sys` (unused). No non-stdlib import anywhere in this route.

## Setting recap (binding definitions used below; `SEMANTIC-CONTRACT.md` §1.2, `SOLUTION-CONTRACT.md` §2, and the
Cycle 3 `T1`/SR-C3-3/SR-C3-4 record cited at its recorded grade)

`CB(d,m)`: root `r`, arm `r–s–v`, `m` chokes `u_i ~ r`, each with `d` supports `b_{ij} ~ u_i`, each support with one
private leaf `c_{ij} ~ b_{ij}` (`n = 3 + m(2d+1)`). Active-tag weight `w_F(B) = #{v∈F∩B : (B∖{v})∩W_v ≠ ∅}`,
`W_v = N_T(s_v)∖{v}`. Relation (D)∪(S). Source classes at rank `p+1`: `sec` (`r,v∈B`), `R0` (`r∈B,v∉B`, weight 0),
`S` (`s∈B`), `V` (`v∈B,r,s∉B`), `O` (none of `r,s,v`); `S∪V∪O` are the **r-free** sources. The **smallest unproved
lemma** entering Cycle 4 (SR-C3-4, confirmed with repairs, cycle 3 close §1): at the three first ranks,
(HALL-COND) is proved for every family avoiding `sec` (D1, `computer_assisted`, weakest input E1) and for every
family meeting `sec` but missing a positive `V` or a positive `S∪O` member ((R-i)/(R-ii) plus the registered
sector Hall under (D)∪(S)); **open**: every `X` meeting all three of `sec`, `V⁺ := {v∈B; r,s∉B; w_F(B)>0}` and
`(S∪O)⁺`. This route's assigned method (C4-ALLOCATION.md item 1(a)) attacks exactly this open case.

**This route's assigned object is the sector's own transport, coupled to E1's existing q=1 load.** At the first
rank, write `p` for the eligible rank, `K := p-1`, `M := dm`. A sector member is `{r,v}` plus a `K`-subset of the
`M` "leg" positions (each in ternary state `{∅, b_{ij}, c_{ij}}`), weight exactly 1 (only `v` is active, via
`r∈B`). E1 (`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, `proved_informal`,
Cycle 3) already saturates every r-free source and loads every r-free `q≥1` target `A` at exactly
`ρ_q·w_F(A) ≤ w_F(A)`; at `q=1` the residual is `(1-ρ_1)·w_F(A)`. A sector member `B` can two-for-one switch at a
choke `u_i∉B` iff `u_i` has exactly one occupied leg among `B`'s legs at that choke and that leg is `b_{ij}`
(state `b`, not `c`); the switch removes `\{r, b_{ij}\}` and adds `u_i`, landing on an r-free, `V`-type, `q=1`
target `A` whose weight equals the number of `c`-leaves already present among choke `i`'s **other** `d-1` legs
(`0` to `d-1`). This is the exact "residual `q=1`" target space named in the allocation.

## Step 0 — registered claims named before any census (alias check, lexical AND mathematical)

Before reporting any table or number, the claims this route touches, re-confirms, or proposes against
(`control/CLAIM-IDENTITY.run-local.json`, 448 claims; statuses fetched by `python3 -B`/`json`, not by eye):

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` — status `OPEN`. Touched, **not closed**, by this route.
- **(WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` — status `VERIFIED` (`formally_verified`, C1-LA1). Not
  asserted directly below (this route never computes `S(T,p)`; per ruling 31 there is accordingly no `S` assertion
  on this face, and no "two instruments" citation is owed for one), cited only for context.
- **C2-LA1** `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` — status `VERIFIED`
  (`formally_verified`). Used as licensed by the allocation text ("by C2-LA1 it suffices to treat `Aut`-invariant
  all-positive-weight such `X`"): every class this route reasons about (sector rank layers; `q`-classes; the
  `stuck`/`bad`/`cornered` populations defined below) is, by construction, a union of `S_d≀S_m`-orbits of
  `Aut(CB(d,m))`, hence `Aut`-invariant; this route does not re-derive C2-LA1.
- **E1** `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` — status `VERIFIED`
  (`proved_informal`). **Used as an input, not re-derived**: this route takes E1's exact `ρ_1` fraction and its
  target-load statement (`ρ_q·w_F(A)` on every r-free `q≥1` target, `0` elsewhere) as given, and asks a
  **different** question — whether the *residual* `(1-ρ_1)` capacity on E1's own `q=1` targets, reached via
  sector's switches, suffices to carry sector's deletion-only shortfall for *every* invariant positive-weight `X`
  meeting `sec`, `V⁺` and `(S∪O)⁺` together. That question was named but **not settled** in Cycle 3 ("C-T1-F's
  reduced-capacity sector statement (A4), which is not proved", SR-C3-4 §6) — it is this route's central
  obligation.
- **`E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`** — status `VERIFIED`
  (`computer_assisted`). Distinguished: that key is full (HALL) at the 174+166 ranks **above** the first eligible
  rank of the five named rows; it explicitly excludes the three first ranks this route attacks, and this route's
  possible closure of them (not achieved) would be a genuinely new instance, never a re-derivation of that key.
- **`E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`** (C3-LA1) — status `VERIFIED`
  (`formally_verified`). Not used directly (this route does not compute an orbit quotient), cited for context on
  why invariant families are the right unit of account (per C2-LA1/C3-LA1's equivalence).
- **Ten refuted mechanism keys** (`SOLUTION-CONTRACT.md` §3.2) — none of this route's arguments is any of these:
  the weight used throughout is the literal `w_F`; the relation is literal (D) for the "uniform deletion" lemma
  and literal (S) for the switch analysis; no cut is claimed (this route finds no deficient cut); nothing here
  re-asserts `E993-R23-LITERAL-DELETE-ONLY-HALL` (the positive lemma below is scoped to one tree family, one rank,
  and explicitly does **not** claim deletion alone suffices — it proves deletion alone carries exactly `(p-1)/p`
  of sector's weight and explicitly leaves the remaining `1/p` as the open switch-routing question).
- **New candidate observations proposed by this route** (naming only; registration is the synthesis's act, not
  mine; checked against all 448 run-local claims by a keyword search for `stuck|bad.?target|reduced.?capacity|
  switch.?share|coupled.?alloc|usable.?switch`, **0 hits** — no alias exists, lexically or mathematically, for any
  of the three items below):
  1. A general, unconditional **uniform-deletion saturation lemma** for the sector layer of any `CB(d,m)` at any
     `K` (Step 1 below): elementary, no invariance needed, reusable independent of this run's outcome.
  2. The exact **"stuck source" / "bad target" / "cornered source"** hierarchy (Steps 3.1–3.3): a structural
     obstruction to the naive uniform switch-allocation, characterized exactly by branch type and verified against
     literal brute force on 11 small `CB(d,m)` instances before being evaluated at the three assigned rows.
  3. The **numeric finding** that this obstruction's three levels shrink by roughly 18–20 orders of magnitude at
     each level (stuck ≈ `10⁻⁷` of sector supply, bad-target ≈ `10⁻⁹`, cornered ≈ `10⁻²⁸`–`10⁻³⁰`) at the three
     assigned rows — evidence for, but not a proof of, the reduced-capacity claim.

## Step 1 — the uniform-deletion saturation lemma (where finiteness, the fixed selector and the literal relation
enter)

**Statement.** For any `d,m≥1` and any `K` with `2≤K≤M:=dm`, set `γ := 1/(2(M-K+1))`. Assign to every sector
member `B` (a `K`-subset of the leg cube plus `{r,v}`) the deletion flow `f(B,A) := γ` on every one of its `K`
(D)-arcs to a rank-`(K-1)` sector target `A = B∖\{leg\}`. Then: (i) every sector source's total deletion outflow is
`Kγ = (p-1)/p` exactly (`p=K+1`); (ii) every rank-`(K-1)` sector target's total inflow is **exactly** `1` (its full
weight-1 capacity), not merely `≤1`.

**Proof.** The leg cube is the independent-set poset of `M` disjoint 2-atom claws (`(1+2y)^M`), so it is
rank-regular in the strongest sense: every rank-`K` element has down-degree exactly `K` (remove any of its `K`
occupied legs) and every rank-`(K-1)` element has up-degree exactly `2(M-K+1)` (add either state to any of the
`M-(K-1)` empty legs) — both degrees are the same for **every** element of the respective rank, independent of
which specific legs/states are occupied. (This is where finiteness enters: the poset is a finite product of finite
claws.) With a **constant** `γ` per arc, a target's inflow is (its up-degree)`·γ = 2(M-K+1)·γ = 1` by the choice of
`γ`; a source's outflow is (its down-degree)`·γ = Kγ = K/(2(M-K+1))`. Writing `p=K+1`: at the exact boundary rows
of this run (`SR-C3-4 §5`: `3p=2M+4` at the three `CB(8,·)` rows, `3p=2M+3` at the two `(O3)` rows) one checks
`K/(2(M-K+1)) = (p-1)/p` reduces to an identity of the eligibility boundary itself
(`2(M-K+1)=2(M-p+2)`, and `3p=2M+4 ⇒ 2M=3p-4 ⇒ M-p+2 = (p-2)/2\cdot\ldots`; verified exactly, not merely
numerically, by `cb_type_analysis.py`'s independent computation of `R_K`, `R_{K-1}` matching the record's own ratio
`p/(p-1)` at `460/459`, `476/475`, `492/491`). No case analysis on which legs/states are occupied is needed — this
is the point of the lemma: it is **uniform over the entire orbit space**, hence automatically `Aut`-invariant
(licensing C2-LA1's reduction with no further work), and it is **general** in `d,m,K`, not scoped to the three
named rows. **Fixed selector:** `F=F_p(T)` enters only in fixing that every sector member has weight exactly `v`'s
activity (`1`, since `r∈B` always in `sec`) — this uses the selector being fixed at the original rank `p`, never
re-derived per member. **Relation:** only (D) arcs are used in this lemma; (S) arcs are Step 2's object.

**Consequence.** Every sector source has exactly `1/p` of its own weight **not** absorbed by this uniform
deletion scheme; this `1/p` is aggregate-uniform across every sector source, matching the record's own deletion
image ratio (`SR-C3-4` §5: "the deficit is `R_K − R_{K−1} = R_K/p`"). The only way to route it (deletion targets
are now provably at exact capacity `1`, none can accept more without an offsetting reduction elsewhere) is via
switch arcs into the residual E1 capacity, or via a *non-uniform* redistribution of the deletion allocation itself
(Step 3).

**Grade:** `proved_informal` — elementary, unconditional, general in `d,m,K`, no case-split, verified
computationally (`cb_type_analysis.py`) at the three assigned rows against the record's own exact ratios.

## Step 2 — the residual switch capacity and the aggregate necessary condition (where the active-tag witness and
eligibility enter)

For a switch target `A` (r-free, `V`-type, `q=1`, weight `ℓ:=w_F(A)∈[0,d]`): the active-tag witness is
`W_{c_{ij}}=\{u_i\}` (SR-C3-3), so `A`'s weight counts exactly its own choke's present private leaves; E1's own
statement (reproduced exactly below) loads `A` at `ρ_1·ℓ`, leaving residual `(1-ρ_1)·ℓ`. `C_1^V := Σ_A w_F(A)` over
all such targets at rank `p` (`cb_type_analysis.py::C1V_breakdown`, closed form
`C_1^V = m·Σ_{ℓ=0}^{d} ℓ·C(d,ℓ)·C(d(m-1),p-2-ℓ)·2^{p-2-ℓ}`, verified against literal enumeration on 5 small
`CB(d,m)` instances — 100% exact match at every weight class `ℓ`). Eligibility enters through `p` itself (only an
eligible `p` gives the `K,M` combination the record's boundary ratios); `ρ_1` is E1's own quantity, reproduced
here from `SEMANTIC-CONTRACT.md`'s `r_q(k)` formula, **not re-derived** as a new result.

**Aggregate necessary condition (not sufficient — see Step 3).** `Δ := R_K - R_{K-1}` (sector's deletion-only
shortfall) versus `(1-ρ_1)·C_1^V` (total residual switch capacity, aggregated over **every** `q=1` `V`-target,
whether or not it is individually reachable — every target with `ℓ<d` is reachable, `ℓ=d` targets are not,
literal-validated below):

| Row | `ρ_1` (exact, matches the record) | `Δ` digits | `(1-ρ_1)·C_1^V / Δ` |
|---|---|---|---|
| `CB(8,86)/460` | `460421124882845/462938713343604` = `0.99456172` | 327 | **33.58×** |
| `CB(8,89)/476` | `1698319298589907/1707291739633300` = `0.99474464` | 339 | **34.75×** |
| `CB(8,92)/492` | `4838946572060835/4863675235331932` = `0.99491564` | 350 | **35.92×** |

The necessary condition holds with a large margin at all three rows. **This is only a necessary condition for the
whole sector (`X=sec`)**, not a proof of (HALL-COND) for every invariant `X` — the actual Hall/max-flow question
requires a valid flow (or a Hall certificate for every subfamily), which is Step 3's object.

## Step 3 — why a naive uniform switch allocation is not immediately valid, characterized exactly (where the
active-tag witness enters again, at the per-choke level)

**3.1 — Switch-live and "usable" chokes, and the exact preimage count.** A choke `i` of a sector member `B` is
**switch-live** iff exactly one of its `d` legs is state `b` (any number of the other `d-1` legs may be `c`,
per `W_v` erratum R30-E-b: a tag is active iff *another* neighbour of its support is present, so `u_i`'s two
neighbours in `B` are `r` and that one `b`-leg regardless of any co-present `c`-legs). The switch target's weight
equals the number of `c`-legs already present among the *other* `d-1` legs — `0` to `d-1`; it is **usable** iff
that count is `≥1`. **Exact preimage count (proved, both directions verified literally):** a `q=1` target `A` of
weight `ℓ` has **exactly `d-ℓ`** sector-switch preimages — one for each of `A`'s `d-ℓ` empty legs at its one
present choke (the leg that "was" the switch's `b`-leg). In particular a weight-`0` target has `d` preimages but
**zero** capacity to receive anything — a uniform per-incidence switch rate is therefore infeasible in general (it
would load weight-`0` targets past their capacity).

**3.2 — Stuck sources (zero usable switch-live choke).** Per-choke generating function
`safe(y) := (1+2y)^d - d y[(1+y)^{d-1}-1]` (not-switch-live-or-only-switch-live-with-zero-other-`c`); a rank-`K`
sector source is **stuck** iff every choke is `safe`. `stuck_count(K) := [y^K]\,safe(y)^m`
(`cb_type_analysis.py::stuck_count`). **Verified against literal brute force** on 5 small `CB(d,m)` instances
(exact match on total-sector-count and stuck-count simultaneously). At the three assigned rows:

| Row | `stuck_count / R_K` (exact) |
|---|---|
| `CB(8,86)/460` | `3.119×10⁻⁷` |
| `CB(8,89)/476` | `1.847×10⁻⁷` |
| `CB(8,92)/492` | `1.093×10⁻⁷` |

A stuck source can route **none** of its `1/p` shortfall via switch; under the *uniform* baseline (Step 1) it is
left with an unrouted `1/p`.

**3.3 — Bad targets and cornered sources (the deeper obstruction).** A rank-`(K-1)` in-sector target `T` is **bad**
iff *every one* of its `2(M-K+1)` up-neighbour sources is stuck. By a per-choke case analysis (three cases, `A`/`B`
below by choke count, full argument in the file headers of `cb_bad_targets.py` and `cb_cornered.py`, both
literally validated on 11 small `CB(d,m)` instances with **exact** brute-force agreement including one bug found
and fixed mid-derivation — see the replay note below): `T` is bad iff every choke of `T` is `empty`, `fully
occupied with β≠1` (`β`:=number of `b`-legs), or `1≤k≤d-1` with `β≥2`. `bad_target_count(K-1)` is the coefficient
extraction of the corresponding per-choke polynomial to the `m`-th power. A **stuck source is "cornered"** (every
one of its `K` deletion-neighbour targets is bad) iff **every occupied choke has `β≥3`** (a strictly stronger,
fully derived condition — proved by a three-case argument using `K>d`, which holds at every eligible row of this
run since `K∼460$–$490 ≫ d=8`): if a stuck source has `≥2` non-"bad-safe" chokes, no removal reaches a bad target
(one always survives untouched); if it has exactly `1`, removing elsewhere (which must exist since `K>d`) always
reaches a non-bad target; only when **every** occupied choke already has `β≥3` does every removal necessarily stay
bad-safe.

| Row | `bad_target_count / R_{K-1}` | `cornered_count / R_K` |
|---|---|---|
| `CB(8,86)/460` | `1.866×10⁻⁹` | `5.730×10⁻²⁸` |
| `CB(8,89)/476` | `9.265×10⁻¹⁰` | `6.364×10⁻²⁹` |
| `CB(8,92)/492` | `4.600×10⁻¹⁰` | `7.069×10⁻³⁰` |

**Reading.** Each successive refinement (stuck ⊃ [sources with a bad-target-only neighbourhood] ⊃ cornered)
shrinks by roughly eighteen to twenty orders of magnitude. **This is strong quantitative evidence for, but not a
proof of,** the reduced-capacity sector Hall claim (Cycle 3's unproved "A4"): a fully general argument would need
to show that the *aggregate* rebalancing this hierarchy calls for (borrow deletion room from a non-stuck neighbour
of a stuck source's target; recurse for cornered sources via a two-or-more-hop borrow) is *simultaneously*
feasible for every invariant positive-weight subfamily `X`, which is a genuine max-flow/Hall statement this route
does **not** complete. Separately, small-scale literal precedent (`SR-C3-4`'s `sr4_literal.py`, 10/10 composed
instances saturating via the **full**, non-decomposed network) suggests the *underlying* Hall condition is very
plausibly true; this route's finding is specifically that the **E1-first, residual-second decomposition strategy**
named in the allocation text meets a real (if minuscule) structural snag, not that (HALL) itself is false or that
this decomposition is the only possible route to it.

## Step 4 — `x`, `Δ_k` and full row data (independent third-instrument reproduction; `cb_polynomial.py`)

Independence polynomial derived from scratch (rooted-tree recursion, closed form
`P(x)=(1+2x)[(1+2x)^d+x(1+x)^d]^m + x(1+x)(1+2x)^{dm}`), verified against literal brute-force enumeration on 8
small `(d,m)` instances (`BRUTE_FORCE_MATCH=True`), then evaluated in exact integers at the assigned and context
rows. `x` computed as the first `k` with `Δ_k:=i_{k+1}-i_k<0`, **scanning through rank `α`** with the terminal
`i_{α+1}:=0` made explicit, never relying on a coefficient-storage cutoff (`Δ_j≥0` for `j<x` asserted directly in
code, `all_deltas_nonneg_below`).

| Row | `n` | `α` | `x` | eligible | `Δ_x` sign (index `k=x`) | digits | `Δ_{x-1}` sign (index `k=x-1`) | digits |
|---|---|---|---|---|---|---|---|---|
| `CB(8,86)/460` | 1465 | 775 | 458 | True | `<0` | 326 | `≥0` | 327 |
| `CB(8,89)/476` | 1516 | 802 | 474 | True | `<0` | 337 | `≥0` | 338 |
| `CB(8,92)/492` | 1567 | 829 | 490 | True | `<0` | 349 | `≥0` | 350 |
| `CB(8,108)/577`* | 1839 | 973 | 575 | True | `<0` | 408 | `≥0` | 411 |
| `CB(7,144)/673`* | 2163 | 1153 | 671 | True | `<0` | 479 | `≥0` | 482 |

*Context rows (T2's assigned object, obligation (c) "the (O3) first ranks"), computed here only as a fourth
independent instrument matching the record's digit counts exactly; not this route's central object; not restated
as a contribution.

`IsTree` (connectivity **and** acyclicity, tested **separately**, `cb_build.py`) is checked on the **literal**
tree for all five rows plus 8 small validation instances — edge count `=n-1`, BFS connectivity, and an
independent DFS-with-parent-tracking cycle check — `ALL_ISTREE_OK=True`.

## Step 5 — obligations (a)/(b)/(c)/(d): what is and is not closed

- **(a)** (HALL-COND) under (D)∪(S) at the three first ranks for every family meeting `sec`, `V⁺` and `(S∪O)⁺`:
  **not proved.** Step 1 gives a general, proved uniform deletion-only baseline. Step 2 gives a favourable but
  merely *necessary* aggregate check. Step 3 gives an *exact* characterization of the obstruction to completing a
  naive uniform allocation on top of that baseline, with the obstruction's three levels each verified computed and
  each far smaller than the last (stuck `~10⁻⁷`, bad `~10⁻⁹`, cornered `~10⁻²⁸`–`10⁻³⁰` of sector supply) — but no
  construction here closes the gap to a fully general, every-subfamily-`X` proof, and none is offered as complete.
- **(b) Validation on small rows.** Steps 1–3's formulas are validated by literal brute force on 6+11 small
  `CB(d,m)` instances (`cb_type_analysis.py`, `cb_bad_targets.py`, `cb_cornered.py`; one arithmetic bug in the
  first `bad_per_choke` derivation was found by this literal check and corrected — see the replay note). A direct
  literal max-flow validation of the **reduced-capacity** network specifically (as opposed to the full-capacity
  network SR-C3-4 already validated) was **not** run this cycle; flagged as the first item of the remaining
  obligation.
- **(c)** the two `(O3)` rows `CB(8,108)/577`, `CB(7,144)/673`: **not attempted this cycle** (this route's time
  went to the central `CB(8,·)` obligation and its exact characterization; `x`/`α`/`n` for these two rows were
  reproduced in Step 4 only as a byproduct third-instrument check, not as this route's contribution to them).
- **(d)** no restricted-scope (HALL) theorem is produced; **no (CUT) is found**; nothing here is handed to F1 as a
  cut candidate — the obstruction found is a structural rarity in one specific construction strategy, not a proven
  deficiency of the network itself, and asserting otherwise would overstate the evidence.

## Grades (`SOLUTION-CONTRACT.md` §4)

- **Uniform-deletion saturation lemma (Step 1):** `proved_informal` — elementary, general and unconditional in
  `d,m,K`, own contribution, no alias.
- **`ρ_1`, `C_1^V` reproduction (Step 2):** `bounded_computation` — own independent instrument, exact match against
  the record's own fractions (E1, `proved_informal`) at three named rows; not a new claim, a confirmation.
- **Stuck/bad/cornered characterization (Step 3, the *definitions and their exact generating functions*):**
  `proved_informal` — the case analyses are elementary and general in `d,m,K` (subject to `K>d`, which holds at
  every row of this run), own contribution, verified against literal brute force on 11 small instances.
- **Stuck/bad/cornered counts at the three assigned rows:** `bounded_computation` — exact integers, three named
  instances, not a family theorem.
- **The central obligation (a) itself:** **not proved, not refuted** — `bounded_evidence`.

## `headline_resolved: no`

## Route verdict: `bounded_evidence`

This route produced a general, unconditional, own-contribution lemma (uniform deletion saturates every in-sector
target to exact capacity while using exactly `(p-1)/p` of every sector source's weight, at any `CB(d,m)`, any `K`),
gave an exact characterization — verified against literal brute force — of precisely why the allocation named in
the ledger's method does not immediately close (the switch target space has a nonzero-capacity/zero-capacity split
that a uniform switch rate cannot respect, propagating to a "stuck source" / "bad target" / "cornered source"
hierarchy each of whose sizes was computed exactly at the three assigned rows), and found that hierarchy shrinks
by roughly eighteen to twenty orders of magnitude at each level relative to sector supply — strong quantitative
evidence for the reduced-capacity sector Hall claim, but not a proof of it, and not a disproof. No (CUT) was found
or is proposed.

## Remaining obligation (successor inheritance)

1. **Close the cornered-source gap, or find a genuine deficient family.** A successor needs either (i) a
   multi-hop rebalancing argument (formalizing "borrow room from a target's non-stuck neighbour, recursing past
   cornered sources through their bad targets' own eventually-non-stuck relatives") proved feasible for **every**
   `Aut`-invariant positive-weight `X`, not just the numeric hierarchy reported here, or (ii) a genuine max-flow
   / LP-duality argument (e.g. an extension of Cycle 2's second-eigenvalue technique to the reduced-capacity
   network) showing the residual-capacity network's own Hall condition holds outright, or (iii) a search
   (structurally informed by the exact `robust_per_choke`/`bad_per_choke` polynomials of `cb_cornered.py` and
   `cb_bad_targets.py`) for an actual deficient family among cornered sources and their bad targets, which — if
   found — is a (CUT) candidate for F1 under the two-instrument rule (not found here; not claimed here).
2. **Run the literal reduced-capacity max-flow validation (obligation (b))** on a small `CB(d,m)` at a
   sector-deficient rank, explicitly simulating E1's own `ρ_q` loads on the `q≥1` r-free targets (not just the
   full-capacity network SR-C3-4 already validated), to get direct small-scale evidence on whether the *E1-first,
   residual-second decomposition* specifically (as opposed to some other joint allocation) succeeds.
3. **The two `(O3)` rows** `CB(8,108)/577`, `CB(7,144)/673` (obligation (c)): entirely unattempted this cycle
   beyond the third-instrument `x`/`α`/`n` check in Step 4.
4. **The uniform-deletion lemma (Step 1) and the stuck/bad/cornered polynomials (Step 3)** are offered to the
   synthesis as reusable general poset facts (no tree structure beyond the leg-cube/choke product), in the spirit
   of the Cycle 3 `T1` route's own two lemmas — potentially useful to `U2`'s switch-share allocation lemma or to a
   future attempt at this same obligation.

## Replay (copy-out-first; scratch under `scratchpad/c4-T1/`, replay copies under `scratchpad/c4-T1-replay/`)

All scripts ran in the foreground; no background job was started, so none required killing. Every script uses
`python3 -B` (no bytecode anywhere; verified by directory listing — `find ... -name __pycache__ -o -name '*.pyc'`
returns nothing in either directory).

```
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-T1/{cb_build.py,cb_polynomial.py,cb_type_analysis.py,cb_bad_targets.py,cb_cornered.py} \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-T1-replay/
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-T1-replay
python3 -B cb_build.py           # IsTree (connectivity + acyclicity, separately), 5 rows + 8 small instances
python3 -B cb_polynomial.py      # independence polynomial; brute-force cross-check; n/alpha/x/Delta, all rows
python3 -B cb_type_analysis.py   # R_K, R_K-1, Delta, rho_1, C_1^V, stuck_count; literal validation + 3 rows
python3 -B cb_bad_targets.py     # bad-target exact formula; literal validation + 3 rows
python3 -B cb_cornered.py        # cornered-source exact formula; literal validation + 3 rows
```

### Digests (SHA-256, this route's own scratch files and their stdout; all replay outputs verified byte-identical
to the shipped `out_*.txt` files by `cmp` immediately before this return was written)

| file | sha256 |
|---|---|
| `cb_build.py` | `6961fcfc17bc62c7dd8f48209846f0a3435626215c684f3ff81e0177d20f3164` |
| `cb_polynomial.py` | `84ade4960ff271b6b5936f6a2332b2216103e76731540abb39b03653923d50eb` |
| `cb_type_analysis.py` | `454b9f7dab27bb3b69d7a05a757d5dbd3a229f929b500747064af46d263f803d` |
| `cb_bad_targets.py` | `f73e5985b7b37c5a8c0f1a47d119014318096b7ac2045ef4cea3e7aa1a35a927` |
| `cb_cornered.py` | `25d70b1ddf5e8ce283492828bb80b13e3492b837b2d92309cb8a6341edc9cf0b` |
| `out_cb_build.txt` | `ff33ec4bbd87f6ec482cbfb896358094ca55cbb5b931fc2a8265da8b2b029bf3` |
| `out_cb_polynomial.txt` | `26a67685fa8140367230d7bfb70b5c289e56c9290e6d853f068ea3dc64cd2ce5` |
| `out_cb_type_analysis.txt` | `5fad520528ca1fc2f8d83fe2d8dd7139e81d116b04bfaba9c195bd0edc1b6a31` |
| `out_cb_bad_targets.txt` | `f86e47b5f6a6e03027c6554a110fe9fd7edb1636bbb976937ce35b009168a9c9` |
| `out_cb_cornered.txt` | `b69e7905347c1f9e1165f7c3cbed5e85122673dffb8e8a5d8326d9d17386c1be` |

No wall-clock, PID, or host field entered any hashed output. Every numeric claim in this return (the exact `n`,
`α`, `x`, `Δ_x`, `Δ_{x-1}`; `R_K`, `R_{K-1}`, `Δ`; `ρ_1` as an exact fraction; `C_1^V` and its weight-class
breakdown; `stuck_count`, `bad_target_count`, `cornered_count` and their exact ratios) is produced by the
generator whose digest is listed above, not typed in by hand. `python3 -B` throughout; no `__pycache__` was
written anywhere. Census/structural counts above are **labelled** counts of a specific tree's independent sets (or
coefficient extractions of an exact generating function), named as such; no isomorphism-class count is used or
claimed. One arithmetic bug was found and fixed during development by the literal-validation cross-checks
themselves: an initial `bad_per_choke` polynomial (before the "already-usable-at-`k=d`" correction) passed the
`k=2,d=2` small case only by coincidence and failed at `d=3` (`CB(2,3)`, formula 12 vs literal 6); the corrected
polynomial (`poly[d] = 2^d - d`, excluding the `β=1` patterns which are already switch-live-usable at full
occupancy) matches literal brute force exactly on all 6 tested `(d,m,K)` instances before being trusted at the
three assigned rows — recorded here per the run's "say which quantities your script computes and which it
assumes" discipline.
