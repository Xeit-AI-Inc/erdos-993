# Second Read — SR-F (the τ = 12 census completion)

Isolated second reader `SR-F` of Cycle A1 of the r25 ADDENDUM
(`erdos-993-math-dre-20260922-r25-addendum`), commissioned under gate ruling 8 to read
the F adjudicator's completion of the τ = 12 thin-band census before it is registered.

**VerityOS boot acknowledgment.** Operating within VerityOS this session. The authorized
boot reads were EXACTLY the two files the dispatch names:
`/Users/ashtonsperry/VerityOS/verity.md` (root constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (startup sequence), both read in
full before any substantive work. No other file under the VerityOS root — no `memory/`,
`knowledge/`, `conversations/`, `modules/`, `skills/`, `logs/`, `decisions/`, `operations/`,
`projects/`, `inbox/`, `writing/` — was loaded; the startup protocol's own task-type map was
not followed this session, by the dispatch's explicit instruction. Subsystem loaded:
`experiments/` only, and within it only this run root and the paths the capsule and the
protocol enumerate. The controller has booted for the run.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter);
the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

**Child delegation:** forbidden and honoured — no `Agent`/Task tool was used at any point in
this second read.

## Identity and seal audit

**Capsule seal.** `control/a1-second-read/SR-F-PACKET-MANIFEST.json`, recomputed live with
`hashlib` as SHA-256 over the canonical JSON of the manifest minus its `seal_sha256` field
(`json.dumps(..., sort_keys=True, separators=(",",":"))`, UTF-8, no trailing newline):

> **`68f9536545fcd859d4f0493952bcd635c4211af555b37d066eb401e7b83b055a` — MATCH.**

`run_id erdos-993-math-dre-20260922-r25-addendum`; `stage cycle-A1-stage5-second-read-SR-F`;
`schema_version verityos.math-dre.packet-manifest.v1`; `file_count: 24`, and the `files` array
has exactly 24 entries. **Every one of the 24 members was independently hashed on both SHA-256
and byte count before any of it was read; all 24 matched exactly** (`gen_seal_audit.py`;
`all_members_match: true`, 0 failures; the per-member table is in `seal_audit.json`).

I did **not** recompute the Stage 2/3/4 packet seals: those manifests are not members of my
capsule and my grant does not name them. The adjudication's Finding S1
(`control/A1-STAGE3-AGENTS.json` grew 698 bytes after the Stage 3 seal) is therefore outside my
read boundary; **I make no finding on it** and note only that no figure I check below depends on
it, since every figure was recomputed from the shipped per-stratum payloads in the granted
scratch or from my own instruments.

**Route identity.** `cycles/cycle-A1/stage3/returns/F1/RETURN.md` carries SHA-256
`993904f9cf4304dba0e1d6aabe1cd0b379993e2a46744674bfaf4750668f6f1f` (39,892 bytes) in my capsule,
identical to the digest the Stage 5 controller-facts record and the adjudication both quote. The
two critiques carry `4d4fb2e84f618bbb69224b01a1e2feee192fce78912a59049a35117cca9ca711` (`C-F1-T`)
and `11d713638293a6d3c6da02ced870408d3ece1aaa3837792284e6d9f63f87f259` (`C-F1-U`); the
adjudication carries `180fc74996d5656090a6b862dd897e5dc71610a1e2c8f69bf4da5d0121ea271e`. All four
reproduce.

**Read boundary and replay.** The six granted scratch directories
(`scratchpad/a1-F1/`, `a1-crit-F1-T/`, `a1-crit-F1-T-replay/`, `a1-crit-F1-U/`,
`a1-crit-F1-U-replay/`, `a1-adj-F/`) were **copied out first** into
`scratchpad/sr-f-read/copy-*` and read only there. `control/CLAIM-IDENTITY.run-local.json` was
read as authorized run-root authority. No `find`/`grep`/`rg`/`ls -R` was ever rooted above a
granted directory; no network, no package install; Python standard library only; exact Python
`int` arithmetic in every file that computes a reported number, no floating point anywhere.

**Disclosure D1 (mine).** One shell redirect in a process-check command was typed as
`> /tmp_ps.txt` — a path at the filesystem root, outside my scratch. The filesystem refused it
(`read-only file system`); **nothing was written outside
`scratchpad/sr-f-read/` and the single deliverable path**. Disclosed on the same standard the
seat applied to its own harness anomaly.

**Disclosure D2 (the self-matching hazard, as the charter names it).** One `ps | grep -c` on a
generator name returned 2, which is the wrapper line matching itself. The direct re-check, run
inside Python over `ps -o pid,command` output with no shell pipeline, returns **0 generator
processes running**. That check was re-run before this file was written.

**Disclosure D3 (instrument dependency, deliberate).** For the residue replay I imported the
seat's `skeleton.py` (and through it `treegen.py`, `common.py`) from the copied-out scratch **as
the ordered enumerator of skeleton classes only**, because the adjudicator's start indices are
indices into that enumeration and mean nothing without it. Every mathematical quantity in that
replay — the matchable-`D` test, the materialisation, the acyclicity test, the independence
polynomial, `x`, `r_max`, the margins, the in-window predicate and the recovery predicate — is
computed by `sr_instrument.py`, which imports nothing at all. The enumeration itself is
separately validated: my own generator, with my own canonical form, reproduces the same class
counts cell for cell (below).

## The model and Lemmas A–C

**The model, re-derived from `SEMANTIC-CONTRACT.md` and the F1 return.** Fix τ = 12.
A *thin tree* `T` is a tree in which each vertex of a minimum vertex cover carries at most one
pendant leaf. `T` decomposes as a **skeleton** `K` on `C ∪ H` with `|C| = τ` and `|H| = h`
(`H` independent, every hub of skeleton-degree ≥ 2), plus **one pendant leaf on each vertex of
`A = C ∖ D`**, where `D ⊆ C` is matchable into `H` through the skeleton's own `C`–`H` edges.
Hence the final order is `n = (τ + h) + (τ − |D|)`, i.e. the **vacuity algebra**
`|D| = 2τ + h − n` with `0 ≤ |D| ≤ min(h, τ)`. The acceptance predicate is `|C| = τ = 12`
exactly, enforced structurally; `ν = τ` by König (forests are bipartite).

The statements the adjudication cites, restated exactly as I verified them:

- **Lemma A (completeness of the strip).** Every thin tree of cover number τ arises from this
  construction. *Proof sketch I re-derived:* strip the (at most one) pendant leaf on each cover
  vertex; the surviving non-cover vertices all have degree ≥ 2 in the strip, because their
  neighbours lie in `C` and none of `C` is stripped.
- **Lemma B (the acceptance predicate).** `τ(T) = τ` exactly when `D = C ∖ A` has a matching into
  `H` using only skeleton edges. *Re-derived:* `ν(T) = τ` forces a matching saturating `C`;
  `A`-vertices take their own leaves, and each `D`-vertex's partner must lie in `H` because it
  has no pendant leaf. Conversely such a matching plus the leaves gives `ν = τ = τ(T)`.
  Matchable sets form a transversal matroid on the `C` side, hence are downward closed, which is
  what licenses prefix pruning.
- **Lemma C (the reparameterisation).** Suppressing the degree-2 hubs of `K` (whose two
  neighbours both lie in `C`) yields a free tree `K*` of order `τ + t` on `C ∪ H₃`, where
  `H₃` is the independent set of hubs of degree ≥ 3; so `K` is obtained from a free tree `K*` of
  order `τ + t` by choosing an independent `t`-subset `H₃` of vertices of `K*`-degree ≥ 3 and
  subdividing `r = h − t` of `K*`'s `C`–`C` edges. Counting edges gives `3t ≤ τ + t − 1`, i.e.
  `t ≤ ⌊(τ−1)/2⌋ = 5`, and `h = t + r ≤ τ − t − 1 ≤ 11`.

**Grade, stated exactly as the adjudication does.** The route **cites** Lemmas A–C from the r25
record (where the adjudication records four independent re-derivations) and independently
*reimplements* them; neither the seat, nor either critic, nor the adjudicator re-proved them this
cycle, and the adjudication's registrable face carries them as *"Lemmas A–C (r25 record,
`proved_informal`)"*. **I cannot verify that grade label:** the r25 Cycle 6 lineage is outside my
grant, and there is no registered claim key for the decomposition in the 360-claim run-local
registry. What I can and did do is stronger than load-testing:

**Lemmas A–C VERIFIED EXHAUSTIVELY at small τ** (`gen_lemmas.py`, `sr_lemmas.json`). For
τ = 2, 3, 4, 5 and every order `n ∈ [2τ, 3τ−1]` I compared two sets of canonical forms:
the final trees produced by my own skeleton + matchable-`D` construction, and **all** free trees
of order `n` with `τ(T) = τ` admitting a cover `C` of that size with at most one pendant-leaf
neighbour per `C`-vertex, found by exhaustive subset search. **The two sets are identical in
every one of the 14 (τ, n) cells** — no tree missed (Lemma A), none spurious (Lemma B), the
reparameterisation exhaustive (Lemma C): (τ=2) 1, 1; (τ=3) 2, 3, 1; (τ=4) 5, 10, 6, 2;
(τ=5) 15, 37, 33, 14, 3. Every instance additionally passed `min_vertex_cover(T) = τ` computed by
a **separate** two-state cover DP, and the thinness test, inside the same loop.

At τ = 12 the decomposition remains a citation with an elementary re-derivation behind it, not a
re-proof. **The adjudication's Ruling 14 dependency stands exactly as written, and must travel on
the registry face.**

## Skeleton classes re-counted

`gen_census.py` regenerates the population with **my own free-tree generator** (iterated leaf
extension with canonical-form dedup — a different algorithm from the seat's centroid-decomposition
generator) and **my own colour-aware canonical form** (interned centroid-rooted AHU; a
bicentroidal tree is canonicalised by an explicit virtual vertex on the central edge, a different
device from the seat's lexicographic pair-of-halves). Every constructed skeleton passes my own
union-find + BFS acyclicity test before it is canonicalised.

Free trees, orders 1–17: `1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741, 19320,
48629` — **A000055 exactly at every order** (`fixtures.json`).

τ = 12, per-`h` histogram for `h = 0..11` (mine / the adjudication's / the seat's / both critics'):

| `h` | 0 | 1 | **2** | **3** | 4 | 5 | 6 | 7 | 8 | 9 | 10 | **11** |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| classes | 551 | 7,720 | **45,129** | **147,052** | 301,501 | 413,435 | 390,819 | 257,226 | 116,468 | 34,974 | 6,330 | **551** |

**Exact match in every one of the twelve cells**, total **1,721,756** (`census_tau12.json`). The
four cells the charter names — `h = 2` → 45,129, `h = 3` → 147,052, `h = 11` → 551 — are
confirmed, and so are the other nine. τ = 11 regenerated as a control:
`235, 2924, 14999, 42372, 74352, 85669, 66517, 34699, 11817, 2400, 235`, total **336,219** —
exact (`census_tau11.json`).

Two independent corroborations of the dedup itself:

- My raw (pre-dedup) construction count at `h = 2` is **67,380**, collapsing to 45,129 classes —
  the identical instrumented figure `C-F1-T` reported (its finding 4), reached by a different
  generator. Raw counts per `h`: `551, 9672, 67380, 250612, 561624, 806753, 766574, 486591,
  203951, 54163, 8257, 551` (total 2,216,677 → 1,721,756 classes).
- `h = 11` forces `t = 0, r = 11`: every edge of a free tree on 12 vertices is subdivided, so the
  stratum is in bijection with the free trees on 12 vertices. My generator gives **551** classes
  at `h = 11` and **551** free trees on 12 vertices, independently equal to A000055(12) — which is
  the adjudication's Ruling 4 observation, reproduced here.

## The residue closure and order 35, replayed

Instrument: `sr_instrument.py`, no imports at all. Every accepted instance is **materialised** —
each pendant leaf is a literal vertex with its own DP state, no analytic `(1 + z)` fold anywhere —
its acyclicity is tested by union-find + an independent BFS coverage check, its order is asserted
equal to the target order, and its independence polynomial is computed by my own two-state
post-order DP. `x` is the least `k` with `Δ_k < 0`; `r_max = ⌊(n−2)/2⌋` on the true order;
a log-concavity failure at `k` has margin `i_k² − i_{k−1}i_{k+1} < 0` and is in window iff
`x < k ≤ r_max`; a recovery at `r` is `x < r` and `Δ_r > 0`, evaluated directly and never inferred
from the failure predicate. Matchable `D`-sets are enumerated by my own Kuhn augmenting-path
matroid-pruned enumerator. The seat's `skeleton.py` supplies the ordered class list only
(Disclosure D3).

**The adjudicator's residue closure, replayed from its own start indices** (`gen_residue.py`;
`sr_h7_a/b.json`, `sr_h8_a/b.json`, `sr_h8_tail.json`; four PID-polled foreground processes and
one foreground run, none detached, all confirmed terminated):

| stratum | indices | classes | orders | accepted instances (mine) | adjudicator | lc / in-window / recoveries | acyclicity tests |
|---|---|---|---|---|---|---|---|
| `h=7` | 249,779 → 257,226 | 7,447 | 27–31 | **4,314,152** | 4,314,152 | 0 / 0 / 0 | 4,314,152, 0 fail |
| `h=8` | 110,117 → 116,191 | 6,074 | 27–32 | **7,140,647** | 7,140,647 | 0 / 0 / 0 | 7,140,647, 0 fail |
| `h=8` | 116,191 → 116,468 | 277 | 27–32 | **363,983** | 363,983 | 0 / 0 / 0 | 363,983, 0 fail |

Per-order, cell by cell, all exact: `h=7` → 2,465,477 / 1,312,581 / 442,357 / 86,290 / 7,447 at
orders 27–31; `h=8` main → 3,193,029 / 2,338,959 / 1,157,996 / 373,494 / 71,095 / 6,074 at 27–32;
`h=8` tail → 166,601 / 118,716 / 57,139 / 17,926 / 3,324 / 277. Combined **11,818,782** instances,
`suffix_complete: true` on both terminal suffixes, `residue_skeletons_after_this_run: 0`,
**0 order mismatches, 0 acyclicity failures, 0 log-concavity failures, 0 in-window failures,
0 recoveries**; `x` histogram `{8: 7,576,172, 9: 4,192,594, 10: 50,016}`.

**Order 35, replayed end to end on my own code only** (`gen_top_orders.py`, `sr_top_orders.json`
— my own skeletons, my own canonical form, no seat module): `h = 11` is the only hub count that
reaches it, with `|D| = 2·12 + 11 − 35 = 0`, so exactly one accepted instance per class.
**551 classes, 551 accepted instances, x = 11 on every instance, r_max = 16** (so the window
[12, 16] is non-empty and genuinely tested), **0 log-concavity failures, 0 in-window failures,
0 recoveries**, 551 acyclicity tests, 0 failures; a sampled separate cover DP returns `τ = 12` on
every tree checked. Identical to `adj_h11_independent.json`.

**Two further ground-truth cells, on my own code:**

- `h = 11`, order 26 (`|D| = 9`): **121,220** accepted instances, `x` histogram
  `{7: 10, 8: 121,064, 9: 146}` — the adjudicator's histogram to the unit — 0 failures,
  0 recoveries, 121,220 acyclicity tests, 0 failures.
- The whole `h = 11` column of the seat's own payload is independently confirmed in closed form:
  for a tree `K*` on 12 vertices every vertex subset of size ≤ 11 is matchable into the edge set,
  so the cell count must be `551·C(12, |D|)`. It is, at all nine of the seat's orders
  (121,220 / 272,745 / 436,392 / 509,124 / 436,392 / 272,745 / 121,220 / 36,366 / 6,612) and at
  order 35 (551).

**The two critic windows, replayed rather than inferred** (`sr_CF1U_window.json`,
`sr_CF1T_h7_o30.json`): `C-F1-U`'s `h = 8`, order-27 window `[69,182, 81,248)` reproduces
**4,489,714** accepted instances, 0 failures, remainder **35,220** — its own figure and the
adjudicator's replay, to the unit; `C-F1-T`'s whole `h = 7` window at order 30 reproduces
**976,643**, 0 failures, residue after 7,447. Both with acyclicity on every instance.

**Fixed points, rebuilt from the fixture prose by my own instrument** (`gen_fixtures.py`,
`fixtures.json`; every object passes `is_tree` first). `P_8`: `x = 2`, `Δ₃ = −15`.
`T(3,4,4)`: order 26, `α = 14`, `τ = 12` (separate cover DP), `x = 8`, `r_max = 12`, sole
log-concavity failure at difference index `k = 13`, margin **−378**, out of window, no recovery.
`W2`: order 26, `α = 14`, `τ = 12`, `x = 8`, `r_max = 12`, sole failure at `k = 13`, margin
**−68**, out of window, no recovery; independence sequence
`1, 26, 300, 2037, 9089, 28147, 62183, 98968, 112870, 90178, 48086, 15498, 2372, 48, 1`, digit for
digit. `T(3,4,5)/T(3,5,5)/T(3,5,6)/T(3,6,6)`: failures at `k = 14/15/16/17`, margins
−982/−3345/−6539/−16836. `T(4,4,4,4,4)`: order 46, `τ = 21`, `x = 14`, `r_max = 22`, **in-window**
failure at `k = 22`, margin −674,077,990, no recovery. Galvin `T_{5,5,1}`: order 56, `τ = 26`,
`x = 17`, `r_max = 27`, **in-window** failure at `k = 27`, margin −332,324,762,280, no recovery.
`T_{4,4,1}`: order 37, `τ = 17`, `x = 11`, `r_max = 17`, failure at `k = 18`, margin −2,028,736,
out of window. The `Δ_k` table for the two order-26 witnesses, with its difference index:

| `k` | `Δ_k(T(3,4,4))` | `Δ_k(W2)` |
|---|---|---|
| 8 (`= x`) | −21232 | −22692 |
| 9 | −44645 | −42092 |
| 10 | −36816 | −32588 |
| 11 | −15704 | −13126 |
| 12 | −2928 | −2324 |
| 13 | −50 | −47 |

Every `Δ_k` for `k ≥ x` is strictly negative on both: neither ever recovers.

**Total recomputed by my own instrument, end to end and not sampled: 17,406,910 accepted
instances, every one materialised and acyclicity-tested, 0 failures of any kind.**

## Band totals and tiling

`gen_band.py` reads **only** the shipped per-stratum JSON payloads (the seat's thirteen
`sweep_*.json`, `C-F1-T`'s two resume payloads, the adjudicator's three residue payloads and its
order-35 payload) — never a prose table — and reconciles them against **my own** census
populations.

**Reachable cells.** From `|D| = 2τ + h − n`, `0 ≤ |D| ≤ min(h, 12)`, the reachable cells over
orders 26–35 are exactly `n − 24 ≤ h ≤ 11`, i.e. 10 + 9 + … + 1 = **55 cells**. Confirmed. `h = 0`
and `h = 1` reach only orders 24 and 24–25, which is precisely why they are vacuous at order 26.

**Tiling.** For every one of the 55 cells the covered skeleton-index intervals were laid end to
end against the stratum population from my own census: **0 gaps, 0 double counts, 0 instances
reported at an unreachable cell, 0 incomplete cells.** `h = 2..6` and `h = 9..11` are single
intervals `[0, N_h)` owned by seat `F1` at every order; `h = 7` and `h = 8` at orders 27–32 tile as
`F1 [0, 159,095)` + `C-F1-T [159,095, 249,779)` + `adj-F [249,779, 257,226)` and
`F1 [0, 69,182)` + `C-F1-T [69,182, 110,117)` + `adj-F [110,117, 116,191)` +
`adj-F [116,191, 116,468)`; order 35 is `adj-F [0, 551)`. **`C-F1-U`'s `h = 8` window
`[69,182, 81,248)` at order 27 only is strictly nested inside `C-F1-T`'s `[69,182, 110,117)`** —
verified both by interval arithmetic and by replaying the window and reproducing its 4,489,714
instances — so it is a genuine, attributable, independently built critic advance that adds **no**
additional coverage, exactly as the adjudication rules.

**Per-order accepted instances**, recomputed from the payloads:

| order | 26 | 27 | 28 | 29 | 30 | 31 | 32 | 33 | 34 | 35 |
|---|---|---|---|---|---|---|---|---|---|---|
| instances | 189,012,829 | 167,330,526 | 106,967,555 | 51,245,794 | 18,621,942 | 5,103,517 | 1,029,876 | 145,458 | 12,942 | 551 |

**Grand total 539,470,990** — the adjudication's figure, to the unit.
Attribution split: seat `F1` **447,626,015**, critic `C-F1-T` **80,025,642** (critic-attributed),
the F adjudicator **11,819,333** (adjudicator-derived), plus `C-F1-U`'s **4,489,714** nested and
therefore not additional. 447,626,015 + 80,025,642 + 11,819,333 = 539,470,990.

**Failures, recoveries, checks.** Over the whole band the payloads carry **exactly two
log-concavity failures**, both at order 26, both with `x = 8` and difference index `k = 13`,
margins **−378** (in the `h = 3` stratum, `T(3,4,4)`) and **−68** (in the `h = 4` stratum, `W2`),
both **out of window** since `r_max = 12` at order 26. **0 in-window log-concavity failures,
0 recoveries at any rank, 0 in-window recoveries.** Spot checks total **124,073** with
**0 mismatches** (89,521 seat + 26,674 `C-F1-T` + 7,878 adjudicator), reconciled from the
payloads.

**Precision item P1 (wording, non-grade-moving).** The adjudication's E-F-1 says *"Exactly two
ranks in the entire band carry a log-concavity failure at all, both at order 26 and both at rank
13"* — internally inconsistent as written. The exact statement is: **exactly two accepted
instances** in the band carry a log-concavity failure, and both sit at the **same** difference
index `k = 13`. Given this run's own errata species on counts naming their population
(`C5-E-f`), the face should say "two accepted instances", not "two ranks".

**Precision item P2 (evidentiary composition, non-grade-moving).** The 124,073 spot checks are
not homogeneous. 89,521 of them are the seat's, run through `sweep.py::_direct_polynomial`, which
Ruling 5 correctly struck for sharing 100 % of its machinery with the path it audits; only 34,552
(`C-F1-T` 26,674 + adjudicator 7,878) were run by an independently authored instrument. The face
presents 124,073 as one homogeneous figure. The gap is now closed far past any residual concern —
`C-F1-T` 121,220, `C-F1-U` 2,139,238, the adjudicator 121,220 + 551 + 7,878, and this reader
**17,406,910** instances end to end by a fourth, independently authored instrument, with zero
discrepancies anywhere — but the face should split the figure rather than merge it.

## Conventions

**The window and `r_max`.** `SOLUTION-CONTRACT.md` Tier 1 is stated for
`|V(F)| ≥ 2r + 2` with `x(F) < r`, i.e. `r ≤ (n − 2)/2`, i.e. `r ≤ ⌊(n − 2)/2⌋ = r_max` for
integer `r`. `sources/fixtures/GALVIN-FIXTURES.md` restates it verbatim as the run's operating
convention: *"A rank `r` is IN WINDOW when `x < r` and `n ≥ 2r+2` (the Tier 1 hypothesis of
`SOLUTION-CONTRACT.md`); a RECOVERY is an in-window `r` with `Δ_r > 0`."* The route, the critics
and the adjudication all compute `r_max = ⌊(n − 2)/2⌋` on the **true order of the final tree**,
never on `α`; a failure at `k` is in-window iff `x < k ≤ r_max`; a recovery at `r` is `x < r` and
`Δ_r > 0`. `Δ_{−1} = 1`, `i_0 = 1`, integer zero extension, `x` = first **strict** descent — all
as `SEMANTIC-CONTRACT.md` fixes them. **Confirmed: these are the registered conventions**, and my
instrument implements them independently and reproduces every fixed point.

**`E993-R25-RECOVERY-LOGCONCAVITY-NECESSARY`** (VERIFIED in both the sealed Stage 2 snapshot and
the live run-local registry, 360 claims in each, identical key sets): *"For every finite graph F:
if x(F) < r and Delta_r(F) > 0 then the independence sequence of F has a log-concavity failure at
some rank k in (x(F), r]."* Its scope note carries the standing minimum: *"every in-window failure
found in the multi-arm Kadrawi-Levit-type family sits at tau >= 21"* — family-scoped, as recorded.
**The band supplies no candidate below it** (zero in-window failures anywhere), so **τ = 21 is
unchanged**; my own `T(4,4,4,4,4)` control reproduces the record exactly (in-window failure at
`k = 22`, margin −674,077,990) and `T_{5,5,1}` fires a genuine in-window failure at `k = 27`, so
the in-window machinery is demonstrably not vacuously silent.

**Alias check, independently re-run by exact key.** No key containing `TAU-LE-12`, `TAU-12` or
`TAU12` exists in either the sealed snapshot or the live registry;
`E993-R25-THIN-TREE-LOGCONCAVE-TAU-LE-12` and `E993-R25-THIN-FOREST-NO-RECOVERY-TAU-LE-12` are
both **absent**, so the "genuinely unregistered extension" claim holds.
`E993-R25-D3-LOW-COVER-WEAK-NONDECREASE` is **absent**, as gate ruling 5 requires.
Statuses confirmed per family: `E993-UNIV-TREE-TRS2` REFUTED;
`E993-R25-THIN-TREE-TOP-ORDER-CLASSIFICATION` VERIFIED;
`E993-R25-THIN-TREE-LOGCONCAVE-TAU-LE-9` VERIFIED, `-TAU-LE-10` **CONDITIONAL**, `-TAU-LE-11`
**CONDITIONAL**; `E993-R25-THIN-FOREST-NO-RECOVERY-TAU-LE-10` VERIFIED, `-TAU-LE-11` VERIFIED;
`E993-TRS2-CONVOLUTION-CLOSURE` VERIFIED; `E993-TRANSFER-TO-FOREST` CONDITIONAL;
`E993-R25-STRATUM-DEPTH-COROLLARY-F` VERIFIED and a genuinely different object. Ruling 9 is
confirmed, including its correction to `C-F1-T`'s abbreviated list.

**No forest (multi-component) claim is made anywhere in the evidence.** Every sweep, every
critique replay and the adjudicator's own closure operate on single trees; no convolution enters
any computation; `E993-TRS2-CONVOLUTION-CLOSURE` and `E993-TRANSFER-TO-FOREST` are cited only as
what the route does *not* attempt. **Confirmed.** As a bounded probe of that limit I recomputed
the registry's own forest evidence on the convolved sequence, with `r_max` taken on the whole
forest's order: `T(3,4,4)` and `W2` padded with `j` isolated vertices (`j = 0..40`), with `j` `K₂`
blocks (`j = 1..20`), and with each other and themselves — **0 in-window failures, 0 recoveries**
in all 126 forests. The failure rank moves *up* faster than `r_max` under `K₁` padding
(order 26 → 27 → 28 gives failure rank 13 → 14 → 15 against `r_max` 12 → 12 → 13), so the gap
widens in that direction. **That is two trees padded, not a class**, and it settles nothing about
the forest form.

## Verdict and the exact registrable statement

The census is **complete and correct as the adjudicator states it**. Every figure I could reach
reproduced to the unit under instruments I wrote: the population in all twelve cells, the residue
closure in all seventeen (stratum, order) cells, order 35 end to end, the two critic windows, the
`x` histograms, the two witnesses with their margins and difference index, the per-order table,
the grand total, the attribution split, the 55-cell tiling with no gap and no double count, the
conventions and the alias check. Nothing is overturned; nothing found lowers `τ = 21`.

**But the two keys as named cannot be registered without repair**, and that is precisely the
question gate ruling 8 put to this seat.

**Repair R1 (blocking for the tree key).** The `-TAU-LE-*` families are **cumulative** and their
registered statements are log-concavity statements:
`-TAU-LE-9` — *"No thin tree … with cover number tau <= 9 has a log-concavity failure at any
rank"*; `-TAU-LE-10` — *"… tau <= 10 …"*; `-TAU-LE-11` — *"… tau <= 11 …"*. A key named
`E993-R25-THIN-TREE-LOGCONCAVE-TAU-LE-12` in that family therefore reads as *"No thin tree with
cover number τ ≤ 12 has a log-concavity failure at any rank"* — **which is FALSE, and is refuted
by this very census**: `T(3,4,4)` and `W2` are thin trees with `τ = 12` (confirmed here by a
separate cover DP) and each has a log-concavity failure at `k = 13`. The adjudication's proposed
*face* is true; the *key name* asserts the opposite of what the band shows, and a later reader
expanding the family pattern — the exact hazard Ruling 9 itself guards against in the other
direction — would expand it wrongly. **Repair:** register under a key that names the predicate
actually established and state non-inheritance explicitly, e.g.
`E993-R25-THIN-TREE-TAU-12-NO-IN-WINDOW-FAILURE-NO-RECOVERY-ORDERS-26-35`, with an on-face clause:
*"NOT a successor of the `-LOGCONCAVE-TAU-LE-*` family; the family's log-concavity predicate is
refuted at τ = 12 by the two registered order-26 witnesses."*

**Repair R2 (blocking for the forest key).** `E993-R25-THIN-FOREST-NO-RECOVERY-TAU-LE-11` reads
*"Every forest all of whose components are thin trees with tau <= 11 is log-concave at every rank
and has no recovery at any rank"*, and its registered scope derives it *via* `E993-TRS2-IFF-ALC`
and `E993-TRS2-CONVOLUTION-CLOSURE` — i.e. no-recovery is obtained **from** per-component
log-concavity. At τ = 12 that derivation is **blocked at its first step**, because the band is not
log-concave. A `-TAU-LE-12` forest key would therefore (i) assert a first conjunct that is false,
and (ii) have **no forest evidence at all** behind it — the entire census is single-component. The
adjudication's own limit ("the forest key must carry that limitation on its face and not be read
as covering multi-component forests") is correct but insufficient: a forest key with zero forest
evidence and a refuted derivation route should **not be registered** until the convolved-sequence
window instrument exists. **Repair:** withhold the forest key; register one tree-scope key only.

**Option N1 (not a defect).** Ruling 13's orders 24–25 boundary is confirmed: `|D| = 24 + h − n`
makes orders 24 and 25 reachable at τ = 12 (23 further cells, `h = 0..11` and `h = 1..11`), and
nobody swept them. The registered family convention is *"order in [2tau, 3tau-1] exactly"*, so the
τ = 12 band is 24–35 and the census covers 26–35. The predecessors discharged orders ≤ 25 by
**citing** the registered order-≤ 25 census (`E993-UNIV-TREE-TRS2`, `smallest_witness_order: 26`),
which is exactly why `-TAU-LE-10` and `-TAU-LE-11` are CONDITIONAL. The controller may therefore
either (a) keep the adjudication's face, with orders 24–25 as a stated limit and the grade
`bounded_computation` (complete census over 26–35), or (b) extend to the whole band by that
citation, at the cost of the key becoming CONDITIONAL. Sweeping them outright — the adjudication's
"cheap completion item" — is a few minutes of the same machinery and is the cleanest of the three.

verdict: confirmed_with_repairs

**The exact registrable statement (one key), for the controller's decision.** Registration is the
controller's (gate ruling 5); I propose none and state the honest face:

> **`E993-R25-THIN-TREE-TAU-12-NO-IN-WINDOW-FAILURE-NO-RECOVERY-ORDERS-26-35`** (name per repair
> R1) — grade **`bounded_computation` (complete census)**; not VERIFIED, not CONDITIONAL, not
> `proved_informal`.
>
> *Face.* Let `T` be a thin tree — a tree in which each vertex of the minimum vertex cover carries
> at most one pendant leaf — with `τ(T) = ν(T) = 12` and `26 ≤ |V(T)| ≤ 35`, i.e. excess
> `d = |V(T)| − 24 ∈ [2, 11]`. Then `T` has **no log-concavity failure at any rank `k` with
> `x(T) < k ≤ ⌊(|V(T)| − 2)/2⌋`** and **no recovery at any rank** (no `r` with `x(T) < r` and
> `Δ_r(T) > 0`). Exactly **two accepted instances** in the whole band carry a log-concavity
> failure at all: `T(3,4,4)` (hub count `h = 3`, `x = 8`, difference index `k = 13`,
> `margin = i₁₃² − i₁₂·i₁₄ = −378`) and `W2` (`h = 4`, `x = 8`, `k = 13`, margin `−68`), both at
> order 26 and both **out of window**, since `r_max = 12` there. Evidence: a complete census of
> **539,470,990 accepted `(skeleton, D)` instances** over all **1,721,756** colour-aware
> canonical-form τ = 12 skeleton classes and all **55 reachable `(order, h)` cells`**, tiling with
> no gap and no double count; per order 189,012,829 / 167,330,526 / 106,967,555 / 51,245,794 /
> 18,621,942 / 5,103,517 / 1,029,876 / 145,458 / 12,942 / 551 at orders 26–35; exact integers, no
> floating point. Spot checks 124,073 with 0 mismatches, of which 34,552 were run by an instrument
> independent of the sweep (per P2), plus 17,406,910 instances recomputed end to end and
> materialised by this second read's own instrument, 0 discrepancies.
>
> *Limits on the face (four).* (i) **Orders 24–25 (`d ≤ 1`) are outside the census** — 23 further
> reachable cells, swept by nobody. (ii) **Completeness over the CLASS, as opposed to over the
> construction, rests on Lemmas A–C**, cited from the r25 record at that record's informal grade
> and independently reimplemented but not re-proved; verified exhaustively here only at
> τ = 2, 3, 4, 5. (iii) **The forest form is unbuilt** — the convolved-sequence window instrument
> does not exist; `r_max` is a property of the whole forest's order and convolution moves ranks,
> so no single-component evidence settles it. (iv) **This is not the `-LOGCONCAVE-TAU-LE-*`
> family's cumulative predicate**, which is refuted at τ = 12 by the two order-26 witnesses above.
>
> *Attribution, layered.* Seat `F1`: order 26 in its entirety at every hub count (including the
> chartered `h ∈ {6,7,8}` residue, 764,513 classes / 141,263,643 instances), orders 33 and 34,
> every fully covered stratum of orders 27–32, and the `h = 7`/`h = 8` prefixes to indices
> 159,095/69,182 — **447,626,015** instances. Critic `C-F1-T` (critic-attributed): `h = 7` to
> 249,779 and `h = 8` to 110,117 at orders 27–32 — **80,025,642** instances. Critic `C-F1-U`
> (critic-attributed): `h = 8`, order 27 only, indices `[69,182, 81,248)` — **4,489,714**
> instances, strictly nested inside `C-F1-T`'s window and therefore **not additional coverage**.
> The F adjudicator (adjudicator-derived): the `h = 7` suffix `[249,779, 257,226)`, the `h = 8`
> suffixes `[110,117, 116,191)` and `[116,191, 116,468)`, and order 35 — **11,819,333** instances.
>
> *Standing minimum.* `τ = 21` is **unchanged**; this band supplies no candidate below it.

**The second key (forest) is withheld** pending the convolved-sequence window instrument
(repair R2).

## What it is not

- **Not a theorem.** It is a null search over a finite class. `SOLUTION-CONTRACT.md` §4:
  *"computation is bounded evidence at its stated finite horizon and never universal proof; a null
  census is insufficient for any tier."* The adjudication's Lean-readiness ruling — nothing in
  orientation F is contract-ready, no award group, the dependency DAG is not closed while Lemmas
  A–C sit at an informal grade — is **confirmed**.
- **Not VERIFIED and not CONDITIONAL.** It is `bounded_computation` at complete-census grade over
  orders 26–35 only.
- **Not uniform** in τ, in `d`, or in the order. τ = 12 is fixed; `d ∈ {2, …, 11}` is a finite
  enumerated set realised by `|D| = 2τ + h − n`; the order range is ten fixed values.
- **Not a forest statement.** Every instance in the census is a single tree. The forest form —
  the `-THIN-FOREST-NO-RECOVERY-TAU-LE-12` key — is unbuilt, and its predecessors' derivation
  route (per-component log-concavity plus TRS2 convolution closure) is **blocked at τ = 12**
  because log-concavity itself fails there.
- **Not the family's cumulative log-concavity claim.** *"No thin tree with τ ≤ 12 has a
  log-concavity failure at any rank"* is FALSE (repair R1).
- **Not complete over the whole τ = 12 band.** Orders 24 and 25 (23 reachable cells) are outside
  the census.
- **Not isomorphism-class counts of final trees.** 539,470,990 is a construction count of
  `(skeleton, D)` pairs, orbit-free by design; 1,721,756 is the class count of skeletons. The
  direction is favourable — duplication can never cause an omission, so a null result over the
  instances is a null result over the classes — and the record labels both populations correctly.
- **Not a run headline.** Tier 1, Tier 2, Tier 3 and the diagnostic band are untouched; a route
  object is not a run headline; no status transfers from `U1`'s `Δ₃` theorem (a single fixed rank,
  far below every `x` in this band, which runs 7–11) or from `T1`'s bare-matching work.
- **Not a change to the standing minimum.** `τ = 21` is unchanged.
- **Not a ruling on Finding S1.** `control/A1-STAGE3-AGENTS.json` is outside my grant; I read
  neither it nor the Stage 2/3/4 manifests, and I draw no conclusion about them.
- **Not a verification of the r25 grade label for Lemmas A–C.** The r25 Cycle 6 lineage is outside
  my grant and no registry key carries the decomposition; the label `proved_informal` is carried
  on the adjudication's authority, not on mine.

## Artifact inventory

All paths relative to the run root. Scratch:
`scratchpad/sr-f-read/` (never `/tmp`, `mktemp` or `TMPDIR`; copy-out-first replay of the six
granted scratch directories into `copy-a1-F1/`, `copy-a1-crit-F1-T/`, `copy-a1-crit-F1-T-replay/`,
`copy-a1-crit-F1-U/`, `copy-a1-crit-F1-U-replay/`, `copy-a1-adj-F/`). Raw SHA-256. **Standard
library only; no network, no package installs; exact Python `int` arithmetic everywhere; no
wall-clock, PID or host field appears in any emitted JSON (machine-checked).**

| Artifact | SHA-256 | Role |
|---|---|---|
| `scratchpad/sr-f-read/sr_instrument.py` | `4d1774efdf308d4a05fb64b7abf9b819e068d33dfade5818302040f70d4b7d56` | this reader's instrument: union-find + BFS acyclicity, interned centroid-rooted AHU canonical form with a virtual central vertex, free trees by iterated leaf extension, Lemma C skeletons, Kuhn matchable-`D` enumerator, materialised two-state independence-polynomial DP, `x`/`r_max`/window/recovery analysis, separate minimum-vertex-cover DP |
| `scratchpad/sr-f-read/gen_seal_audit.py` | `d85710ae4a164afdf2a73da3fd3e6f03d52ae9594161d7c3d83b2ef6c15f087f` | capsule inner seal + all 24 member digests and byte counts |
| `scratchpad/sr-f-read/gen_fixtures.py` | `8831ac973219e721e43038e71dbe660faad7469648efe387de12c7b3c85bf157` | free-tree counts vs A000055; ten fixed points rebuilt from fixture prose with `x`, `r_max`, every `Δ_k` for `k ≥ x`, every margin with its difference index, and `τ` by the separate cover DP |
| `scratchpad/sr-f-read/gen_census.py` | `c1e73c6d5d83a6fc9649f88676ade821fc88ac5321c2e81ac04546484231821e` | independent τ = 11 and τ = 12 skeleton census, full per-`h` histogram plus raw pre-dedup construction counts |
| `scratchpad/sr-f-read/gen_residue.py` | `9856932d5efec84036ce69f9c450fe09f74b3b10113e90470d4c4670b56adec9` | residue-suffix and critic-window replay driver; seat `skeleton.py` as ordered enumerator only, every mathematical quantity from `sr_instrument` |
| `scratchpad/sr-f-read/gen_top_orders.py` | `17aa7131245ff8dc12db7eac7b27dbab16623c12cccb77a581a0ba81740e01f4` | order 35 end to end and the `h = 11`/order-26 cell, on this reader's code only |
| `scratchpad/sr-f-read/gen_band.py` | `f6c6ff457faef5178f2a81938124e8bd9baa80c602fe1c7c0aaab0fb57980a8c` | 55-cell reachability, interval tiling (gaps / double counts / unreachable hits), per-order and grand totals, attribution split, spot-check reconciliation — from shipped payloads only |
| `scratchpad/sr-f-read/gen_registry.py` | `430027ff5ef2d30be2d8085daf7b427c77d8911fd1d79a333034835e939e86b9` | exact-key registry query on the sealed Stage 2 snapshot and the live run-local registry: statuses per family, alias scan, absence checks |
| `scratchpad/sr-f-read/gen_lemmas.py` | `44494ab36b8647708c0410001136b84e4e58d1570fd7199ae94913ae72acc1d4` | Lemmas A–C verified exhaustively at τ = 2..5 against all free trees; bounded convolved-forest probe of the two witnesses |
| `scratchpad/sr-f-read/seal_audit.json` | `3b1404f54a44e2cea9910c8bf13b652fdbd07fc655dccc992d7c9f6b1f541bf7` | seal MATCH; 24/24 members match on digest and byte count |
| `scratchpad/sr-f-read/fixtures.json` | `e08d490da52687f83d3359a06360e2a87909534b5467e899b5ec37db89cd21e3` | A000055 exact to order 17; ten fixed points exact |
| `scratchpad/sr-f-read/census_tau11.json` | `ec0a5195cdb97abb2c469df1b09ddc406f4baf2ac239c4657549bfffeb0172c5` | τ = 11: 336,219 with the full 11-value histogram, exact |
| `scratchpad/sr-f-read/census_tau12.json` | `283872e02c2ec7da4fb5584d32b155a2818b6ef18b8872eec5722591f521b770` | τ = 12: 1,721,756 with the full 12-value histogram, exact in every cell; raw construction counts |
| `scratchpad/sr-f-read/sr_h7_a.json` | `337a29812fc6cf3fa74f5da6b1e7c03bbb2c80c2151cbc178415fb386821522e` | `h = 7` 249,779→253,500: 2,118,816 instances, 0 failures |
| `scratchpad/sr-f-read/sr_h7_b.json` | `e8bb0c65f46c51163d326eb562aad8ae437ddb6d97c26c910d22799839ce138d` | `h = 7` 253,500→257,226: 2,195,336 instances, 0 failures, `suffix_complete: true` |
| `scratchpad/sr-f-read/sr_h8_a.json` | `4813f231d079261b70505b02018bc3e321e16aafbd03093459ef48312a727bf4` | `h = 8` 110,117→113,150: 3,386,895 instances, 0 failures |
| `scratchpad/sr-f-read/sr_h8_b.json` | `5f10650f4743824e8ee59cc1e9db23313520fdf789fea97e36515b599f866e99` | `h = 8` 113,150→116,191: 3,753,752 instances, 0 failures |
| `scratchpad/sr-f-read/sr_h8_tail.json` | `ae8533589ff5897567e9628ff19b95fcd26e0311a623673d21aaaf3d7630685b` | `h = 8` 116,191→116,468: 363,983 instances, 0 failures, `suffix_complete: true`, residue 0 |
| `scratchpad/sr-f-read/sr_top_orders.json` | `7c2e087fbee4a76a3ac2199642ee1e0f819e7132be2a4983d961b0b963156f0f` | order 35: 551 classes / 551 instances, `x = 11` on all, `r_max = 16`, 0 failures; order 26 `h = 11`: 121,220 instances, `x` histogram `{7:10, 8:121064, 9:146}` |
| `scratchpad/sr-f-read/sr_CF1U_window.json` | `2565772dc053dc211998526cff68203056edbfc98d4bbb53c80487cd10fe19d5` | replay of `C-F1-U`'s window `[69,182, 81,248)` at order 27: 4,489,714 instances, exact, remainder 35,220 |
| `scratchpad/sr-f-read/sr_CF1T_h7_o30.json` | `2a1e5bc37e42089cacfeb779c802f07e63e6d3d850c20371047478d90298443c` | replay of `C-F1-T`'s whole `h = 7` window at order 30: 976,643 instances, exact |
| `scratchpad/sr-f-read/sr_band.json` | `683a1e8265c9099fdd7e1249ae995016bf6ffc9f312db69d56d6c1425d9d5ed4` | 55 reachable cells, 0 gaps, 0 double counts, per-order table, 539,470,990, attribution split, 124,073 spot checks / 0 mismatches |
| `scratchpad/sr-f-read/sr_registry.json` | `72369333235853b6ffc8b76056f58411bda7310b2771a9d0c3a4ad9804bf5ca9` | 360 claims in snapshot and live, identical key sets; family statuses; zero `TAU-LE-12`/`TAU-12` hits; `E993-R25-D3-LOW-COVER-WEAK-NONDECREASE` absent |
| `scratchpad/sr-f-read/sr_lemmas.json` | `46c82d2be68bab125d46939e25a8e246cfad692e2a9af1163918437a0895cf77` | Lemmas A–C: 14 (τ, order) cells at τ = 2..5, construction set == exhaustive search set in every one; forest probe: 126 forests, 0 in-window failures, 0 recoveries |

**Import lists (every generator).** `sr_instrument.py` — **none** (pure builtins).
`gen_seal_audit.py` — `hashlib`, `json`, `os`. `gen_registry.py` — `hashlib`, `json`.
`gen_fixtures.py` — `json`, `sys`, plus local `sr_instrument`. `gen_census.py`,
`gen_top_orders.py` — `json`, `sys`, plus local `sr_instrument`. `gen_lemmas.py` — `json`, `sys`,
plus local `sr_instrument` and `gen_fixtures`. `gen_band.py` — `glob`, `json`, `os`.
`gen_residue.py` — `argparse`, `json`, `sys`, `time`, plus local `sr_instrument` and the seat's
copied-out `skeleton` (ordered enumerator only; see Disclosure D3).

**Populations and their names, for the record.** 1,721,756 colour-aware canonical-form skeleton
CLASSES at τ = 12 (regenerated here in full with my own canonical form, every cell) and 336,219 at
τ = 11; free trees matching A000055 exactly to order 17; 55 reachable `(order, h)` cells over
orders 26–35, every one verified covered to its full stratum population with no gap and no double
count; 539,470,990 accepted `(skeleton, D)` INSTANCES over the band — 447,626,015 seat-derived,
80,025,642 critic-derived (`C-F1-T`), 11,819,333 adjudicator-derived, plus `C-F1-U`'s 4,489,714
nested inside `C-F1-T`'s window and therefore not additional coverage; **17,406,910 instances
recomputed end to end by this second read's own materialised instrument, every one acyclicity-
tested, 0 failures and 0 discrepancies**; 124,073 spot checks in the record with 0 mismatches
(split per precision item P2); 2 accepted instances in the whole band with a log-concavity failure,
both at order 26, both at difference index `k = 13`, both with `x = 8`, margins −378 and −68, both
out of window; 0 in-window log-concavity failures; 0 recoveries at any rank; 10 fixed points and
controls placed exactly by a fourth independently authored instrument; 14 (τ, order) cells of
Lemmas A–C verified exhaustively; 126 convolved forests probed; 1 capsule seal and 24 member
digests verified. All arithmetic exact Python `int`; no floating point in any reported number.
**No background job was left running** (checked without a self-matching pattern immediately before
this write).

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); the
seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

headline_resolved: no
