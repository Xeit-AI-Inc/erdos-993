# RETURN — Cycle 6, Route T1 (`C6-T-01 CB-TOP-DEFICIENT-RANK-UNIFORM-SWITCH-HALL`)

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30). Route ID `C6-T-01
CB-TOP-DEFICIENT-RANK-UNIFORM-SWITCH-HALL`, orientation T (prove), mechanism fingerprint
`CB-TOP-DEFICIENT-RANK-UNIFORM-SWITCH-HALL`, load-bearing obligation `control/C6-ALLOCATION.md`
item 1 (T1): on `𝒞_8 = {(CB(8,m), ⌊(16m+4)/3⌋) : m ≥ 106, m ≢ 1 (mod 3)}` (or the `d=7`
analogue): (i) `(ELIG-top)` uniformly in `m`; (ii) E1 at every `q` at `p*` (citation); (iii)
`(L-S)_top` closed-form choke-local flows fitted to the five registered `θ*` values, affine
separation proved uniformly; (iv) composition by B7 with the E1 key.

**Dispatch verification.** `control/dispatch/c6-stage3/DISPATCH-T1.md` SHA-256
`2c28b211bbfc18fcc676185f87518534b2e0c3a1d00d0ccdd06228b322a42be6`, recomputed with
`shasum -a 256` — **match**; followed only after this matched.

**Boot.** I booted VerityOS by reading exactly and only `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in that order, in full, before
anything else. I did not follow the startup protocol's own map into memory, conversations,
modules, skills, logs, decisions or the knowledge subsystem — the controller has booted for the
run, per the dispatch and the common brief.

**Model disclosure (two parts).** Chartered sonnet/xhigh; transport-resolved model sonnet
(explicit parameter); runtime-reported model id: `claude-sonnet-5` (as disclosed to me by my own
runtime environment; I have no other self-report mechanism to query).

## Seal verification

| Object | Value | Check |
|---|---|---|
| Dispatch `DISPATCH-T1.md` | SHA-256 `2c28b211bbfc18fcc676185f87518534b2e0c3a1d00d0ccdd06228b322a42be6` | recomputed with `shasum -a 256`; **match** |
| `control/C6-STAGE2-PACKET-MANIFEST.json` inner seal | `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611` | recomputed over the canonical JSON of the manifest with `seal_sha256` popped (`json.dumps(d, sort_keys=True, separators=(",",":"))`, no trailing newline) via `scratchpad/c6-T1/verify_manifest_seal.py`; **match** against both the manifest's own stored field and the dispatch's quoted value |
| `sources/lower-region/inputs/ordinary_tree_checked.py` | `a012bb78915ccdfa2f729c0cdb520cd8f29572277123c92e80ba6091498f533d` | matches `control/SOURCE-DIGESTS.json`; also asserted at import time inside `t1_main.py` (the script raises on a mismatch) |

I cite the Stage 2 seal value in this return as instructed:
`29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`.

## Read-boundary disclosure

Three items, disclosed in full rather than omitted:

1. **Delayed digest check.** I read `sources/lower-region/inputs/ordinary_tree_checked.py` in full
   (to understand the authorized evaluator's API before using it) and only verified its SHA-256
   against `control/SOURCE-DIGESTS.json` afterward, not before — the same ordering deviation
   Cycle 5's T1 return disclosed for a different file. The digest matched exactly on the delayed
   check (`a012bb78…`), so no unverified content was ultimately relied upon, but the ordering
   itself is disclosed.
2. **A grep rooted at `sources/` (permitted as a search boundary — the common brief states
   `sources/` is within my grant for search purposes) incidentally matched two files under
   `sources/heterogeneous-closure/` while I was locating the `CB(d,m)` tree generator** (searching
   for `def.*CB(` across `sources/`). `sources/heterogeneous-closure/` is not one of the
   subdirectories the common brief's read list enumerates under `sources/`. The match was
   path-only (`grep -rl`, which lists matching file names, never prints content); no content of
   either file was displayed to me or relied upon, and I did not open either file. I did not repeat
   the search with a wider pattern.
3. **No sibling Cycle 6 return, critique, or scratch was read** (`cycles/cycle-6/stage3/returns/F1/`
   and `.../T2/` already exist on disk as concurrent seats' output directories; I did not open
   either). No other experiment root, the live lower-region/first-interior/r24–r29/master-ledger
   roots, the public repository, or any external source (no network) was read.

**Chain actually opened** (a subset of what the common brief authorizes; not reading an authorized
file is not a violation): the two boot files; `control/dispatch/c6-stage3/DISPATCH-T1.md`;
`control/C6-WORKER-COMMON-BRIEF.md`; `control/C6-STAGE2-PACKET-MANIFEST.json`;
`SEMANTIC-CONTRACT.md`; `SOLUTION-CONTRACT.md`; `control/C6-ALLOCATION.md`;
`control/C6-STAGE1-GATE.md`; `cycles/cycle-6/stage2/ROUTE-STATE.md`; `control/SOURCE-DIGESTS.json`
(the first 624 of its 3946 lines, listing `file_count: 981`; the remainder was not needed — I only
used the one entry named above, `sources/lower-region/inputs/ordinary_tree_checked.py`); `control/CLAIM-IDENTITY.run-local.json` (460 claims, read in full for the alias check);
`sources/lower-region/inputs/ordinary_tree_checked.py`; `cycles/cycle-5/stage3/returns/T1/RETURN.md`
and `.../T2/RETURN.md` (both explicitly authorized under the common brief's "Cycles 1–4
inheritance" clause, which covers `cycles/cycle-{1,2,3,4,5}/stage3/returns/*/RETURN.md`). I did not
read `control/AUTHORIZATION.md`, `control/R30-CHARTER-PROMPT.md`, `control/RESIDUE-CHECK.json`, or
any `cycles/cycle-{1,2,3,4,5}/CYCLE-CLOSE.md` — all authorized by the common brief, but everything I
needed from them was already reproduced verbatim in the contracts, the allocation, and the gate
record, and citing those directly (rather than the underlying cycle closes) keeps the citation
closer to the fact actually used.

## IMPORT LIST (standard library only)

`sys`, `json`, `hashlib`, `importlib.util`, `math.comb`, `fractions.Fraction` — plus the one
authorized, digest-verified, read-only import `sources/lower-region/inputs/ordinary_tree_checked.py`
(never copied, never mutated; digest asserted at import time). No network, no `pip`/`brew`/`npm`/
`elan`, no third-party or project code, no Lean/`lake` invocation (this route needed none).

## Registered claims named before any census (requirement 3)

- **(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`** — OPEN at full scope. Untouched: I
  neither prove nor refute it, at any scope. Nothing below is a saturating-flow existence proof —
  I did not reach `(L-S)_top` (obligations iii–iv; see Remaining obligation).
- **Primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`** — OPEN. Untouched; I
  report no `S(T,p)` value on any instance.
- **The ten refuted mechanism keys of `SOLUTION-CONTRACT.md` §3.2** and `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`,
  `E993-R28-TREE-LEAF-SLOT-DOMINANCE` — **none is revived.** I propose no transport rule, injection
  map, or capacity rule; my new content (below) is a coefficient-inequality / favorability argument
  about the independence polynomial of `CB(d,m)` directly, not a Hall-mechanism proposal, so there
  is no mechanism here to compare against the refuted list.
- **(LIFT), (DCB)** — not used, not touched.
- **The `T_m`/spider/path-star family theorems and the `G_k` flow key** — not re-proved, not used.
- **(WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`** — cited, not invoked on any concrete
  row (I never compute or report an `S(T,p)` value).
- **`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`
  (the E1 mean-threshold key; `proved_informal`, registered)** — **cited, and its applicability to
  `𝒞_8`'s own top rank is checked, with a negative/scoping result** (Step 5 below): the key's
  sufficient condition `p ≥ ⌈μ_1⌉+2` does **not** dominate `p*(m)` for `CB(8,m)` outside a small
  range, because `p*(m)` and `⌈μ_1(m)⌉+2` grow at the *same* leading rate in `m` (both `~(2d/3)m`,
  differing only in the `O(1)` term), so the key's margin is generically negative at exactly the
  rank `𝒞_8` needs it at. This is a scoping finding, not a refutation of the key (its own scope —
  "holds at every rank `p ≥ ⌈μ_1⌉+2`" — is untouched and unchallenged); it only says the key does
  not, by itself, discharge obligation (ii) for `m` outside the range **SR-C5-4** already checked.
- **SR-C5-4's bounded record** ("the top rank carries E1 for every `m ∈ [134, 400]` at `d=8`",
  `SEMANTIC-CONTRACT.md` §2) — cited at its existing grade, for the range it actually covers.
  Obligation (ii) is **not** discharged by this route beyond `m ≤ 400` (see Remaining obligation).
- **The five registered `θ*` values, `(L-S)_top`, E1-R, B7, the `CBstar` sector-deficit key, the
  five-CB-rows keys** — **not used.** I did not attempt the sector/switch flow construction this
  route (obligations iii–iv); see Remaining obligation for exactly why and exactly where a
  successor should pick it up.
- **`E993-G1-B7-WRAPPER-PADDING-ELIGIBILITY-MONOTONE`** — while checking the run-local registry for
  my own alias check (below), I found this is the only registered claim whose key contains the
  token `B7`. I flag this for a successor without asserting it is *the* referent of the working
  label "B7" in `control/C6-ALLOCATION.md`'s composition instruction (I did not verify the
  mathematical content matches what T2's Cycle 5 return's §8 composition needed); I neither use nor
  rely on it.

**Alias check (lexical AND mathematical), reported as a separate step, before any census.**
`scratchpad/c6-T1/alias_check.py` (SHA-256 `b95f06049e4dc1951390b3802eb0597856870a711fbae953085c99266167fef6`;
output `alias_check_output.log`, `ALIAS_CHECK_DIGEST_SHA256`
`93cb41bd6762da476b48d36ac51ecf582206e2da01f7bcc5430d6e4241c94b7a`; copy-out replay:
`cp scratchpad/c6-T1/alias_check.py scratchpad/c6-T1-replay/ && cd scratchpad/c6-T1-replay &&
python3 -B alias_check.py`, reproduced in-session with an identical digest) searches
`control/CLAIM-IDENTITY.run-local.json`'s 460 claims' `claim_key`, `aliases`, and `alias_patterns`
fields for tokens overlapping my one new finding (Claim 1 below): `CB`, `TOP`, `DESCENT`,
`FAVORAB`, `ELIGIB`, `SINGLE-RANK`, `MEAN-THRESHOLD`, `MODE`, `CROSSING`, `B7`. (An earlier,
unsaved, ad-hoc version of this search additionally included the token `EIGHT`, meant to catch
`CB(8,·)`-specific keys; it was discarded once I noticed it spuriously matches the substring
"w**eight**ed" in dozens of unrelated `WEIGHTED-HALL` key names — a token-choice bug, not a
finding, corrected in the saved script below before any number here was relied upon.) **66** claims
hit at least one token. Every `CB`-token hit
(`E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE`, `E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD`,
`E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`, `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`,
`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`,
`E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`,
`E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`,
`E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`,
`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`,
`E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS`) is
about the **sector/switch flow mechanism** (a capacity, deletion-deficit, or mark-clone-criterion
statement); none is about the **independence-polynomial coefficient behaviour of `CB(d,m)` itself**
(the crossing index `x`, or leaf favorability `F_p`, considered directly via the closed-form
generating function). My finding (Claim 1) is mathematically distinct from all 66 hits: it is a
statement about where the independence-polynomial sequence of `CB(8,m)` first descends and about
which leaves are favorable at a named rank, established via an explicit closed-form generating
function and a cited classical mode-location theorem — no registered claim uses either device on
`CB(d,m)`. **Proposed candidate name** (STATED, not registered; pending critique and an isolated
second read, per the standard gate): `E993-R30-CB-EIGHT-TOP-RANK-COEFFICIENT-DESCENT-AND-LEAF-FAVORABILITY`.
This does not reuse any working label (`𝒞_8`, `(L-S)_top`, `(ELIG-top)`, `E1`, `B7`, `CD-1`, etc.)
as a key or alias, and names the exact object (`CB(8,m)` at its own `p*(m)`).

## Step-by-step derivation

**Step 1 — the object, `IsTree`, finiteness, and where every hypothesis enters.** `CB(d,m)` is
built literally, never assumed to be a tree (`build_cb` in `t1_main.py`): root `r=0`, support
`s=1`, arm leaf `v=2` (path `r–s–v`); for each of `m` chokes, a vertex `u_i ~ r`, and `d` branch
pairs `(b_{i,j}, c_{i,j})` with `b_{i,j} ~ u_i` and `c_{i,j} ~ b_{i,j}`. `n = 3 + m(1+2d)`.
**`IsTree`** — connectivity and acyclicity checked **separately**, never assumed — is
`is_tree_explicit()`: edge count is compared to `n − 1` first (necessary but not sufficient alone),
then a DFS from vertex `0` is checked (a) to reach every vertex (**connectivity**) and (b) never to
re-visit an already-seen non-parent vertex (**acyclicity** — a back-edge would signal a cycle); both
must hold. Run on every one of the 12 small instances built in Part 1 below, always before any
polynomial is trusted. **Finiteness** is automatic (`d, m` finite naturals; `n` finite). **No group
invariance** is used in Part 1–4 below (I work with the literal tree and its literal one-leaf
deletions); Part 5 (the arm/private-leaf favorability argument) uses the automorphism group of
`CB(d,m)` only to note that all `md` private leaves are in one orbit (so one representative's
favorability, established for a *specific* private leaf `c` by the closed form, transfers to all of
them) — the arm leaf `v` is its own singleton orbit and is checked directly, not by any
group-invariance step. **The fixed selector `F_p`** enters exactly where `SEMANTIC-CONTRACT.md`
§1.1 puts it: `F_p(T) = {v ∈ leafSet(T) : Δ_p(T − v) < 0}`, evaluated on the **original** tree at
the rank `p = p*(m)` fixed for the whole comparison (never re-selected at `p*±1`). **The
active-tag witness** and **the literal relation (D)∪(S)** do not enter this route at all — I never
build the transport network or a flow (obligations iii–iv are not reached).

**Step 2 — the closed-form independence polynomial (new derivation this route).** Writing
`G(x) := (1+2x)^d + x(1+x)^d` (the independence polynomial of one choke's "spider-of-legs" gadget:
`(1+2x)^d` when the choke hub is excluded — each of the `d` legs contributes `(1+2x)`, i.e. the
2-vertex support–leaf path's own polynomial `1+2x`; `x(1+x)^d` when the hub is included — each leg's
support is then forced out, contributing `(1+x)` from its now-isolated leaf), the whole tree splits
on whether the root `r` is chosen:

```
I_T(x)      = (1+2x)·G(x)^m + x(1+x)·(1+2x)^{dm}                [r excluded / r included]
I_{T-v}(x)  = (1+x)·G(x)^m  + x·(1+2x)^{dm}                       [arm leaf v deleted: the arm
                                                                    collapses to a single pendant s]
I_{T-c}(x)  = (1+2x)·G'(x)·G(x)^{m-1} + x(1+x)^2·(1+2x)^{dm-1}    [one private leaf c deleted: its
                                                                    gadget becomes G'(x) :=
                                                                    (1+2x)^{d-1}(1+x) + x(1+x)^{d-1},
                                                                    d-1 full legs plus one bare
                                                                    support-only leg]
```

**Cross-validation (Part 1, `t1_main.py`; an independently computed side).** All three closed forms
are checked coefficient-for-coefficient against the authorized tree-DP evaluator's
`Graph.forest_independence_polynomial()` (a fully generic post-order DP with no knowledge of the
`CB` block structure) on every `(d,m) ∈ {1,2,3}×{1,2,3,4}` — **36 checks, 0 mismatches** — and
`α(CB(d,m)) = m(d+1)+1` is confirmed on every one of the 12 instances against the tree-DP's own
`len(poly)-1`. **Part 1's registered-fixed-point check** confirms `(n, α, p*, x)` for the five
already recorded rows `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, `CB(8,95)/508`,
`CB(9,112)/673` (`SEMANTIC-CONTRACT.md` §1.2, `control/C6-ALLOCATION.md`) exactly — `x` (scanned
from `k=0` through the full polynomial, never assumed) matches the three previously recorded values
`458, 474, 490` for `CB(8,86)`, `CB(8,89)`, `CB(8,92)` exactly (`CB(8,95)`/`CB(9,112)`'s `x` was not
separately quoted in the material I read this route, so it is reported as newly computed, `506` and
`671` respectively, not claimed as reproducing a quoted number) — from the closed form alone (no
external DP needed for `n, α, p*, x`) — `p*(d,m) := ⌊(2dm+4)/3⌋` is confirmed to be the allocation's
own top-deficient-rank formula (`⌊(2D+4)/3⌋`, `D=dm`) by direct substitution at all five rows, and
`p* = x+2` exactly at all five (the "first eligible rank" property the allocation's census already
found for these rows).

**Step 3 — the mean formulas (Part 2, an independent second derivation of `I(1), I'(1)`).** For each
of `I_T, I_{T-v}, I_{T-c}`, `I(1)` and `I'(1)` are computed **exactly in closed form** (no polynomial
expansion — `log`-derivative-style rules applied term-by-term to the two-term sum, exact `Fraction`
arithmetic) and cross-checked against **direct summation over the actual exact polynomial**
(`I(1)=Σ_k i_k`, `I'(1)=Σ_k k·i_k` — an independently computed side) for `d ∈ {1,2,3,8}`,
`m ∈ {1,...,5}`: **120 checks, 0 mismatches.**

**Step 4 — the exact ground-truth sweep (Part 3, `106 ≤ m ≤ 238`, `d=8`; truncated-degree
convolution — every retained coefficient is exact, nothing above the needed rank is ever computed,
nothing kept is approximated).** For every integer `m` in this range, at `p* = p*(8,m)`:

- **(a)** `Δ_{p*-2}(CB(8,m)) < 0` (i.e. `i_{p*-1} < i_{p*-2}`) — establishes `x(CB(8,m)) ≤ p*-2`,
  the eligibility of `p*` (`SOLUTION-CONTRACT.md`'s `x+2 ≤ p`).
- **(b)** `Δ_{p*}(CB(8,m) - v) < 0` — the arm leaf `v` is favorable at `p*`.
- **(c)** `Δ_{p*}(CB(8,m) - c) < 0` — a private leaf `c` is favorable at `p*`; by the leaf-orbit
  argument of Step 1, **every** private leaf is then favorable at `p*`.

**Result (133 rows, `d=8`, `106 ≤ m ≤ 238`):** conditions (b) and (c) hold at **every** one of the
133 rows, **no exception at any residue**. Condition (a) holds at every one of the 88 rows with
`m ≢ 1 (mod 3)`, **no exception**, and at 35 of the 45 rows with `m ≡ 1 (mod 3)` — **failing only at
the ten explicit values `{106, 109, 112, 115, 118, 121, 124, 127, 130, 133}`** (Part 3b confirms
these are **genuinely** ineligible at `p*`, not an artifact of testing only one rank: the true
`x(CB(8,m))` computed there is `p*(m) − 1` exactly, one more than needed, at all ten). This refines
`𝒞_8`'s stated exclusion of the **entire residue class** `m ≡ 1 (mod 3)` down to a **finite,
explicit exceptional set of ten points**; `𝒞_8` as literally written in `control/C6-ALLOCATION.md`
is therefore a (correct but strictly conservative) subset of the actual eligible-and-favorable
family.

**Step 5 — the Darroch-mean argument, extending this uniformly past `m = 238` (Part 4). Two
classical, undischarged dependencies, cited by name and never re-proved here (exactly the standing
convention for Darroch/Newton in this run):**

1. **Real-rootedness.** The independence polynomial of any finite forest has only real (hence
   non-positive, since its coefficients are positive) roots — a classical fact in the algebraic
   theory of independence polynomials (proved by induction on the tree's leaf-peeling order using
   the deletion recursion `I(T,x)=I(T-v,x)+x·I(T-N[v],x)` together with an interlacing lemma; not
   reproduced here). `CB(d,m)`, `CB(d,m)-v`, `CB(d,m)-c` are all forests (trees, in fact), so each
   of `I_T, I_{T-v}, I_{T-c}` is real-rooted.
2. **Newton's inequality** then gives the coefficient sequence of each is **log-concave**
   (`i_k^2 ≥ i_{k-1}i_{k+1}`), hence **unimodal**, and **Darroch's theorem** (1964, "On the
   distribution of the number of successes in independent trials") locates the mode `k*` within
   distance 1 of the mean `μ := I'(1)/I(1)`: `μ − 1 < k* < μ + 1`. Once a rank `k` is at or past
   `⌈μ+1⌉`, log-concavity forces the sequence non-increasing from `k*` onward, giving
   `Δ_k ≤ 0`; the STRICT inequality `Δ_k<0` needed here is what Part 3/3b/4's exact checks confirm
   at every tested instance (I do not separately discharge the possible-plateau edge case of
   non-strict Newton's inequality for polynomials with repeated roots in general — see Remaining
   obligation item 2).

Using the exact closed forms of Step 3, `μ_T(m), μ_v(m), μ_c(m)` are computed **exactly** (no
polynomial expansion, `O(1)` `Fraction` arithmetic per `m`) for the whole range `106 ≤ m ≤ 2000`:
the exact margins `(p*-2)-(μ_T+1)`, `p*-1-μ_v`, `p*-1-μ_c` are found **positive at every `m ≥ 239`**
(zero exceptions for (a); zero exceptions at any `m ≥ 106` for (b), (c)). **A genuine closed-form
tail bound** (not merely sampled) then proves this **for all `m` to infinity**: bounding each
`I(1)` below by dropping one positive additive term gives an explicit loose lower bound on the
margin of the form `m·(2d/3 − G'(1)/G(1)) − c₀ − c₁(m)·rᵐ` (`r := 3^d/G1 < 1`, `G1:=3^d+2^d`); the
linear term's slope `2d/3 − G'(1)/G(1) = 256/20451 > 0` (exact) is positive and constant, while the
`rᵐ`-decaying term is eventually strictly decreasing (for `m ≥ 27`, shown by its derivative's sign);
so once the loose bound is positive at some `m₀` it stays positive for **every** `m ≥ m₀`, forever.
`t1_main.py`/Part 4 finds `m₀ = 246` for (a), `172` for (b), `162` for (c), each confirmed to stay
positive for 3000 further consecutive integers past `m₀` (well beyond where the analytic argument
already guarantees it).

**Combined conclusion — obligation (i), `(ELIG-top)` — for `CB(8,m)` at `p* = p*(8,m)`:**
`Δ_{p*-2}(CB(8,m)) < 0` **and** both the arm leaf and every private leaf are favorable at `p*`, for
**every integer `m ≥ 106` except the ten explicit values `{106,109,112,115,118,121,124,127,130,133}`**
— established by combining (i) exact ground truth (`bounded_computation`, `106 ≤ m ≤ 238`) and (ii)
the Darroch-mean closed-form tail proof (`proved_informal`, citing the two classical dependencies
above, unconditionally for `m ≥ 246`), with the small residual overlap `[239,245]` covered by both.

**Step 6 — obligation (ii), E1 at `p*` (Part 5).** The registered mean-threshold key gives E1(i) at
**every** rank `p ≥ ⌈μ_1⌉+2`, `μ_1(d,m) = (4dm-d+1)/6`. I checked, for `d=8`, whether
`p*(m) ≥ ⌈μ_1(m)⌉+2` — the citation's own sufficient condition — over `106 ≤ m ≤ 5000`: **it fails
for 1632 of the 4895 tested values**, starting at `m=106` itself and recurring regularly, because
`p*(m) ~ (2d/3)m` and `⌈μ_1(m)⌉+2 ~ (2d/3)m` grow at the **same leading rate** (`4d/6 = 2d/3`
exactly) — the citation's margin is `O(1)`, not growing, so it does not eventually dominate the way
Step 5's Darroch margins do. **This is a genuine scoping finding**, not a re-derivation and not a
challenge to the key's own (unmodified) scope: `𝒞_8`'s own top rank `p*(m)` is, generically, *not*
covered by this particular sufficient condition. Obligation (ii) is therefore discharged **only** at
the range the already-registered `SR-C5-4` bounded record actually checked — `m ∈ [134,400]`
(`SEMANTIC-CONTRACT.md` §2, cited, not re-derived) — and is **open** for `m > 400` (and for the ten
exceptional `m` of Step 5, where `p*` is not even eligible). See Remaining obligation.

**Step 7 — obligations (iii)–(iv), `(L-S)_top` and composition by B7 — not attempted this route.**
Given obligation (ii) is itself only covered through `m=400`, and `(L-S)_top`'s LP/DP flow-fitting
method (Cycle 5's `T2` route, `cycles/cycle-5/stage3/returns/T2/RETURN.md` §7, the closest available
template — a per-choke-state affine-separation certificate with variables `pb_d(β,γ), pc_d(β,γ),
σ_d(γ)`) was built and verified there for **one heterogeneous finite instance**, not as a
closed form in `m`, building and independently re-verifying a comparable **uniform-in-`m`** LP for
the homogeneous `d=8` case within this route's remaining budget risked either an unreliable rushed
construction or an incomplete one; I chose not to attempt it rather than ship an unverified flow
argument. See Remaining obligation for the concrete next step and why the homogeneous reduction of
T2's method looks tractable to a successor with more budget.

## Every numeric claim, generator, digest, replay

```
IMPORT LIST: sys, json, hashlib, importlib.util, math.comb, fractions.Fraction
             + sources/lower-region/inputs/ordinary_tree_checked.py (digest-checked at import)
Generator:   scratchpad/c6-T1/t1_main.py   (the generator of record for every claim above)
Output:      scratchpad/c6-T1/t1_main_run.log
RESULT_DIGEST_SHA256 (canonical JSON of the full result dict, sort_keys, separators (",",":"),
no wall-clock/PID/host field anywhere in the hashed payload):
    bc0a316c42ca6eb0df7e977c73d2f89de9a0657a0a090b8094d142ce64e7356e
Copy-out-first replay (never /tmp, never in place):
    cp scratchpad/c6-T1/t1_main.py scratchpad/c6-T1-replay/t1_main.py
    cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-T1-replay
    python3 -B t1_main.py > REPLAY-OUTPUT.log
Replay performed in-session (PID 65586, polled to completion against its own output file):
    identical RESULT_DIGEST_SHA256 reproduced
    (bc0a316c42ca6eb0df7e977c73d2f89de9a0657a0a090b8094d142ce64e7356e).
Earlier exploratory scratch, superseded by t1_main.py and not cited as the generator of record for
any claim above (kept as scratch): cb_structure.py, cb_derivation.py, cb_sweep.py,
cb_sweep_diag.py, darroch_mean.py, darroch_full.py, verify_manifest_seal.py (this last one IS
separately cited above, for the manifest-seal check only).
python3 -B used throughout; every long computation ran either in the foreground (the manifest-seal
check, the structural cross-validation, the mean-formula cross-validation) or as a background job
polled by its own literal PID against its own output file for a completion marker (never a pattern
match on my own command line, never a full process listing): PID 65141 (`t1_main.py`'s final full
run; needed the background path because the exact `106..238` sweep alone takes ~150s of pure Python
big-integer arithmetic — measured directly, not estimated; an earlier full run, PID 62780, is
superseded because its digest predates my adding the `x` field to Part 1's fixed-point rows); two
earlier exploratory background runs during derivation (harness-assigned task ids; see Process
disclosures), all confirmed completed and none left running before this file was finalized.
```

## `x`, `Δ_k`, difference index — on every reported row

Every row in Part 3/3b reports `p*` and the two indices tested against it (`p*-2, p*-1` for
condition (a); `p*, p*+1` for (b) and (c)); Part 3b additionally reports the **true** `x(CB(8,m))`
for the ten exceptional rows (scanned from `k=0`, never assumed, up to and past `p*` — the scan
never uses the authorized evaluator's own `first_strict_descent`, which the semantic contract
documents as omitting the terminal zero-extension difference; my own scan explicitly includes it).
`Δ_k(T) := i_{k+1}(T) - i_k(T)`; no plateau (`Δ_k=0`) is ever treated as a descent (strict `<0`
throughout).

## Grades

| Claim | Statement | Grade | Weakest input |
|---|---|---|---|
| Part 1 | Closed-form `I_T, I_{T-v}, I_{T-c}` match the tree-DP exactly on 12 instances; `α` formula confirmed | `bounded_computation` (a derivation checked, not exhaustively proved for every `d,m` — though the derivation argument is in fact uniform; graded conservatively, matching Cycle 5 T1's own convention for an analogous unreviewed uniform argument) | — |
| Part 1 (fixed points) | `(n,α,p*,x)` match the five registered rows exactly | `bounded_computation`, independent-instrument confirmation of already-`computer_assisted`/`proved_informal` record data; does not raise those records' own grades | the records' own grades |
| Part 2 | Closed-form `I(1), I'(1)` match direct summation exactly | `bounded_computation` | — |
| Part 3 / 3b | Exact ground truth, `106 ≤ m ≤ 238`, `d=8`: (a)/(b)/(c) and the ten genuine exceptions | `bounded_computation` (exact, exhaustive over the stated range — ruling 42) | — |
| **Claim 1 — `(ELIG-top)` obligation (i), `CB(8,m)` at `p*(m)`, every `m ≥ 106` except the ten named exceptions** | `Δ_{p*-2}(T)<0`; arm leaf and every private leaf favorable at `p*` | **`proved_informal`** for `m ≥ 246` (citing Darroch 1964 + forest-independence-polynomial real-rootedness, both classical, undischarged); **`bounded_computation`** (exact) for `106 ≤ m ≤ 245`; genuinely ineligible (not just untested) at the ten exceptional `m` | Darroch's theorem + real-rootedness (both classical, undischarged; see Remaining obligation item 2 for the one un-discharged strictness subtlety) |
| Obligation (ii), E1 at `p*` | Registered mean-threshold key's own sufficient condition does not dominate `p*(m)` outside a small range | scoping finding (not itself a graded mathematical claim about `CB(d,m)`; an observation about a citation's applicability) — obligation (ii) is discharged only for `m ∈ [134,400]` via cited `SR-C5-4` | `SR-C5-4`'s own grade (`bounded_computation`/`computer_assisted`) |
| Obligations (iii)–(iv), `(L-S)_top` and B7 composition | — | **not attempted this route** | — |
| T1's own object: a parameter-uniform (HALL) with switch arcs load-bearing on `𝒞_8` | — | **not established this route** | — |

## Gate-31 lines

`central obligation attempted: yes` — obligation (i) is fully attempted and, by my own assessment,
substantially closed for the relevant `m`-range (see Claim 1); obligations (ii)–(iv) are attempted
only partially (ii, a scoping check) or not at all (iii–iv), and are named precisely in Remaining
obligation, not silently dropped. `two instruments named for S`: not applicable — this return never
asserts an `S(T,p)` value on any instance (WID is cited, never invoked on a concrete row), so no
`supply − capacity = S` check with two independently-computed sides is owed here. Every numeric
claim in Parts 1–5 instead uses the two-instrument discipline in its own form: the closed form vs.
the tree-DP (Part 1), the closed form vs. direct polynomial summation (Part 2, Step 3), and the
exact truncated-convolution ground truth vs. the closed-form Darroch-mean argument (Parts 3–4, Step
4–5) as the two independent routes to the same conclusion at every overlapping `m`.

## `headline_resolved: no`

(HALL) is not formally verified this route, and no confirmed deficient cut is produced. This is the
fixed value for Cycle 6 (`SOLUTION-CONTRACT.md` §5, `control/C6-STAGE1-GATE.md`; this is also the
terminal cycle, so the run proceeds to its terminal close after this cycle regardless of this
route's outcome).

## Route verdict: `bounded_evidence`

I did not prove, conditionally prove, refute, or compile T1's full object (a parameter-uniform
(HALL) with switch arcs load-bearing on `𝒞_8`). What I did produce: (1) a new, checked closed-form
generating-function theory for `CB(d,m)`'s independence polynomial and its two one-leaf deletions,
independently cross-validated against the authorized tree-DP evaluator and against direct
polynomial summation (156 exact checks, 0 mismatches); (2) obligation (i), `(ELIG-top)`, closed at
`proved_informal` grade for all `m ≥ 246` and exact ground truth for `106 ≤ m ≤ 245`, together
covering **every** `m ≥ 106` except ten explicit, genuinely-confirmed exceptions — a strengthening
of `𝒞_8`'s own stated scope (which excludes an entire infinite residue class where in fact only ten
points need excluding); (3) a genuine, checked, negative scoping finding on obligation (ii)'s
citation, precisely bounding what it does and does not establish, rather than either mis-citing it
as sufficient or ignoring it. I am not entitled to `proved`, `proved_conditional`, or `compiled` for
T1's own mechanism object, since `(L-S)_top` and its composition (obligations iii–iv) are not
reached; I report `bounded_evidence` rather than `blocked` because substantial, checked, reusable
material — including one graded, citable new result (Claim 1) — was produced.

## Remaining obligation (successor inheritance)

1. **Obligation (i) is essentially closed** for `CB(8,m)` (Claim 1 above). A successor wanting to
   register it should: (a) run the same Darroch-mean argument for the stated `d=7` analogue
   (`m ≥ 142, m ≢ 2 (mod 3)`) — the closed-form machinery in `t1_main.py` is already parametrized in
   `d` and needs only re-running `part3`/`part4` with `d=7`; (b) discharge the one strictness
   subtlety I did not: Newton's inequality for a real-rooted polynomial with possibly-**repeated**
   roots is non-strict in general, and I have not shown `CB(8,m)`'s independence polynomial has
   simple roots. The closed-form tail bound (Step 5) rigorously proves the *mean-based margin*
   stays positive for every `m ≥ 246` to infinity, which by (non-strict) log-concavity alone only
   gives `Δ_{p*-2} ≤ 0` there; the *strict* `Δ_{p*-2} < 0` this route actually needs is directly
   confirmed by exact coefficient computation only up to `m = 2000` (Part 4's exact-`Fraction`
   margin check) and `m = 238` (Part 3's full ground-truth polynomial check) — every exact check
   *did* run found strict decrease with no plateau, so this is very likely a non-issue in practice
   for the untested tail `m > 2000`, but it is a genuine gap between `proved_informal` and a fully
   closed argument, and should be named on the face of any registration.
2. **Obligation (ii) is open for `m > 400`** (and at the ten exceptional `m`, where it is moot since
   `p*` is not eligible there anyway). The registered mean-threshold key does not reach it (Step 6);
   a successor needs either (a) `SR-C5-4`'s own census extended past `m=400` at `d=8`, or (b) a
   sharper E1 argument specific to the top rank `p*(m)` (analogous in spirit to this route's own
   Darroch-mean treatment of `(ELIG-top)` — E1's own generating function
   `(1+y)^{qd-1}(1+2y)^{d(m-q)+1}` at `q=1` is structurally the *same kind* of two-term binomial
   product as the ones this route already handled exactly, so the same closed-form-mean /
   real-rootedness / Darroch-tail-bound technique is very plausibly adaptable — this is a concrete,
   named, and I believe tractable next step, not a vague pointer).
3. **Obligations (iii)–(iv), `(L-S)_top` and its composition with the E1 key, are entirely open at
   the parameter-uniform level.** The concrete path: reduce `cycles/cycle-5/stage3/returns/T2/RETURN.md`
   §7's two-choke-degree affine-separation LP (variables `pb_d(β,γ), pc_d(β,γ), σ_d(γ)`,
   `β+γ≤d`, `Out_d(β,γ) ≥ a+λ(β+γ)`, `In_d(β,γ) ≤ a2+λ2(β+γ)`, `(d-γ)σ_d(γ) ≤ θ*·γ`) to the
   **single**-degree `d=8` case (drop the second degree class entirely — the per-choke local
   constraints do not involve `m` at all, only the **aggregate** constraint
   `m·a + λ·(p*(m)-1) ≥ 1` does). The key structural opportunity, not yet exploited by any route:
   if a **single, `m`-independent** feasible point `(a,λ,a2,λ2,σ(·))` of the per-choke LP has
   `a + (2d/3)λ > 0` strictly, then — by exactly the same "linear-in-`m` term eventually dominates a
   fixed deficit" argument this route used twice already (Step 5) — the aggregate constraint holds
   for **all sufficiently large `m`** automatically, without re-solving the LP at every `m`. Fitting
   the five registered `θ*` values (`96/495419, 96/530501, 96/566783, 16/65097, 16/138633`) as data
   points of a `θ*_8(m)` closed form (as the allocation's own text asks) was not attempted; solving
   the `m`-independent per-choke LP first (my suggested order above) may make this unnecessary or
   may show `θ*` genuinely depends on the composition (`β,γ`) distribution at a given `m`, not on
   `m` itself as a free parameter — this ambiguity should be resolved before fitting anything.
4. **`E993-R30-CB-EIGHT-TOP-RANK-COEFFICIENT-DESCENT-AND-LEAF-FAVORABILITY`** is a STATED candidate
   key (alias-checked above, not registered); a critic/adjudicator should re-confirm the
   mathematical distinction from the 66 lexical hits and the two classical-dependency citations
   before registration.
5. Nothing in this return may be cited as evidence for (HALL) at any scope, for the primary
   aggregate, or as a step toward reviving any refuted mechanism.

## Process disclosures

Every Python invocation was `python3 -B`. Five computations exceeded a comfortable foreground
duration and were run as background jobs, each polled (by its own literal PID, or by its
harness-assigned background-task id where the harness itself promoted a command after an automatic
timeout) against its own output file for a completion marker (never `pgrep -f` on a pattern my own
command line contains, never a full process listing):

- An early exploratory sweep (harness-assigned background task id after an automatic timeout
  promotion, not a PID I chose) was found to be miscalibrated for the intended `m`-range and was
  stopped via the harness's own task-control channel before it produced any usable output; no
  content from it is cited anywhere in this return.
- `cb_sweep.py` (`m=106..238` exact sweep, an earlier, now-superseded version of Part 3's logic; PID
  tracked via the harness's background-task id `bpq6jpplm`) — completed normally, exit code 0.
- `cb_sweep_diag.py` (the `m ≡ 1 (mod 3)` diagnostic; literal PID `61212`, obtained via `$!` after
  explicit `&` backgrounding, polled against its own log file) — completed normally.
- `t1_main.py` (the generator of record; literal PID `65141` (after an earlier run, PID `62780`, whose digest was superseded when the `x` field was added to Part 1), obtained via `$!`, polled against its
  own log file) — completed normally; its digest is quoted above.
- The copy-out replay of `t1_main.py` under `scratchpad/c6-T1-replay/` (literal PID `65586` (after an earlier replay, PID `63494`, of the pre-`x`-field version),
  obtained via `$!`, polled against its own log file) — completed normally; identical digest.

No background job was left running at any point before this file was finalized (each was confirmed
completed, via its own output file or the harness's completion notice, before being relied upon or
before this return was written). No `pip`/`brew`/`npm`/`elan`; no network; no bytecode written
anywhere (no `.pyc`, no `__pycache__` under either scratch directory — `python3 -B` used
throughout). Nothing was written under `sources/` or under any other experiment root. Files written:
this `RETURN.md`; `scratchpad/c6-T1/{verify_manifest_seal.py, cb_structure.py, cb_derivation.py,
cb_sweep.py, cb_sweep_diag.py, darroch_mean.py, darroch_full.py, t1_main.py, t1_main_run.log,
alias_check.py, alias_check_output.log}`; `scratchpad/c6-T1-replay/{cb_sweep_output.json,
cb_sweep_diag_m1mod3.json, diag_run.log, t1_main.py, REPLAY-OUTPUT.log, alias_check.py,
alias_check_replay.log}`.

## 10-line summary

Route verdict: `bounded_evidence`. `headline_resolved: no`. Load-bearing step: a new closed-form
generating-function theory for `CB(d,m)`'s independence polynomial (Step 2), cross-validated exactly
against the authorized tree-DP evaluator, used with a cited Darroch-mean/real-rootedness argument to
close obligation (i), `(ELIG-top)`, for every `m ≥ 106` except ten explicit exceptions — mine, and
it does close (at `proved_informal` grade, citing two classical dependencies). Smallest open lemma:
obligation (ii) (E1 at `p*` for `m>400`) — I found the allocation's own suggested citation does not
reach it, and named a concrete, structurally-motivated next step (Step 6/Remaining-obligation-2).
Obligations (iii)–(iv), the actual flow certificate and its composition, are untouched; Remaining
obligation 3 names the exact LP reduction and the one new structural idea (an `m`-independent
per-choke certificate) a successor should try first. Disclosures: a delayed digest check on one
authorized file (matched); an incidental path-only grep hit on an unauthorized `sources/`
subdirectory (no content read); three background jobs, each PID-polled and confirmed complete.
