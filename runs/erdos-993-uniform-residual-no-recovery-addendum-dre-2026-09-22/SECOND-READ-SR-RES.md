# Second Read — SR-RES (the Γ-residue count by slack and s*(τ))

Isolated second reader `SR-RES`, lane C of the r25 ADDENDUM
(`erdos-993-math-dre-20260922-r25-addendum`), stage `lane-c-second-read-SR-RES`.
Object: the `τ ≤ 7` Γ-residue count by slack, with `s*(τ)` — r25 Cycle 6
Rulings 30, 30a, 30b and R2, held for an isolated second read under gate ruling 8.

**VerityOS boot acknowledgment.** Operating within VerityOS. Booted by reading, in
full, exactly the two files this seat's dispatch authorizes:
`/Users/ashtonsperry/VerityOS/verity.md` (root constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (startup sequence).
No other VerityOS file was read; I did not follow the startup protocol's own
task-type map into `memory/`, `conversations/`, `modules/`, `skills/`, `logs/`,
`decisions/` or `knowledge/`. Per the protocol's map this is controlled-experiment
work under `experiments/`; the subsystems loaded are `identity/` (startup
protocol) and this run root's sealed control surface. This second read is an
experiment artifact and proposes no durable VerityOS memory, decision, skill,
module, project or writing change. It registers nothing: the controller registers,
and registers only what this read confirms, at the grade it confirms.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit
parameter); the seat cannot self-inspect its runtime model/effort — stated on
dispatch-record authority.

**Child delegation:** none (forbidden by charter). Every derivation and every
computation below was performed directly by this seat.

---

## Identity and seal audit

**Capsule inner seal.** `control/lane-c/SR-RES-PACKET-MANIFEST.json`, recomputed
canonically as SHA-256 over the compact key-sorted JSON of the manifest with the
`seal_sha256` field removed (UTF-8, `sort_keys=True`, `separators=(",",":")`, no
trailing newline):

`c175c681e9a0f65b78b7413b034c17f4c5463452784916a3666ab2f28c91752b`

— **exact match** to the manifest's own `seal_sha256` field **and** to the value
named in this seat's dispatch. `file_count` field (52) equals the actual member
count (52). Generator: `seal_audit.py`, SHA-256
`57404c7de480b459ec439a1628a216f764179ba983994612b866c3dc0d342f42`, IMPORT LIST
`hashlib`, `json`, `os`, `sys`; output `SEAL-AUDIT.json`, SHA-256
`c089ba40c83df6c92fe997804c971748c92fd68f91bcbec637c2f587c7a76fbf`.

**Member digests.** Every member I opened was verified on SHA-256 **and** byte
length before it was read: **19/19 match, 0 mismatches, 0 missing**
(`SEAL-AUDIT.json`, field `all_verified_match: true`). The 19 are: this lane's
protocol and `control/lane-c/PATH-CHECK-SR-RES.json`; `SEMANTIC-CONTRACT.md`,
`SOLUTION-CONTRACT.md`, `SOLUTION-CONTRACT-ADDENDUM-1.md`;
`control/A1-STAGE1-GATE.md`; the five errata records (`C1-CENSUS-ERRATA.json`,
`C3-CENSUS-CONVENTION-RECONCILIATION.json`, `C3-CENSUS-ERRATA.json`,
`C4-CONTROLLER-ERRATA.json`, `C5-CONTROLLER-ERRATA.json`); the Stage 2 registry
snapshot `control/snapshots/CLAIM-IDENTITY.run-local.a1-stage2.json`;
`sources/authority/CLAIM-IDENTITY.json` and `sources/authority/LEDGER.md`; and the
five r25 inputs `sources/r25-terminal/C6-ADJUDICATION-F.md`,
`…/C6-SYNTHESIS.md`, `…/second-read-inputs/C6-F4-RETURN.md`,
`…/C6-F4-CRITIQUE-T.md`, `…/C6-F4-CRITIQUE-U.md`.

**Content actually read** (as distinct from digested): the protocol, the manifest,
`PATH-CHECK-SR-RES.json`, `SEMANTIC-CONTRACT.md`, `C6-F4-RETURN.md` and both
critiques in full; `C6-ADJUDICATION-F.md` and `C6-SYNTHESIS.md` by targeted line
ranges located within those two named member files (Rulings 30/30a/30b, R1/R2,
the registration items); the Stage 2 registry snapshot by programmatic claim-key
query and lexical sweep over its own 360 claim records; the five errata by
keyword count within each named member file. The remaining 33 members
(`AUTHORIZATION.md`, the `sources/g1/**` tree, the Stage 2 packet manifest) were
neither read nor digested — reading fewer members than granted is not a boundary
event, and none is load-bearing for this question.

**Read-boundary disclosures (mine, three).**

1. **`pgrep -f` / `pkill -f` with a self-matching pattern, once.** My first
   generator draft lacked memoization; the harness auto-backgrounded it at its
   120 s foreground timeout. In killing it I ran `pkill -f "gamma_residue.py"`
   and a `pgrep -d, -f gamma_residue` inside a `ps` pipeline. The protocol
   forbids `pgrep -f` on a self-matching pattern. Disclosed as a process-discipline
   deviation. **No figure in this report comes from that run**: it was killed
   before completion, wrote no output file, and every number below comes from a
   foreground run of the memoized generator (2.97 s wall) that completed and wrote
   its JSON.
2. **One harness auto-backgrounding** (the same run, not a `nohup`/detach). Same
   species as the disclosures filed by C-F4-T (item 6) and C-F4-U (critic hygiene)
   in the inputs. Everything afterwards ran in the foreground with an explicit
   timeout.
3. **The r25 scratch grant was not exercised.** The protocol permits copy-out-first
   read-only replay of `scratchpad/c6-F4/`, `c6-crit-F4-T/`, `c6-crit-F4-U/`,
   `c6-adj-F/` at the r25 root. I copied out nothing and read nothing under the
   r25 root. My instrument is written from the definitions in this lane's protocol
   and `SEMANTIC-CONTRACT.md` alone, importing no prior seat's code — which is the
   stronger posture for an isolated second read, since it makes agreement with
   three prior instruments (C-F4-T, C-F4-U, adjudicator F) an independent
   convergence rather than a replay.

No `find`, `grep -r`, `rg`, `ls -R` or `cat` with a glob was run at any point, and
no recursive listing rooted above a granted directory. No network, no package
installs; Python standard library and exact integers only. Scratch is confined to
`<run root>/scratchpad/lane-c-SR-RES/` and the deliverable to
`<run root>/second-reads/SR-RES/`; no `/tmp`, `mktemp`, `TMPDIR` or session
scratchpad path was used, and nothing under `cycles/`, `scratchpad/a1-*` or any
other seat's directory was touched. No hashed artifact carries a wall-clock, PID
or host field (checked programmatically over both shipped JSONs: none present).
No background job of this seat was running at the time of this write (verified by
a `ps -u <uid> -o pid=,comm=` listing; the only Python processes on the host
belong to unrelated long-lived applications).

---

## Γ_n re-derived and the residue table

**Definitions, taken from the protocol and `SEMANTIC-CONTRACT.md`, not from any
seat's code.** `C(n,j)` is the binomial, zero-extended (`0` unless `0 ≤ j ≤ n`);
`Cat_m = C(2m,m)/(m+1)`, zero-extended (`Cat_m := 0` for `m < 0`);
`E(n,k) = C(n,k+1) − C(n,k)`;

```
Γ_n(τ,k,n) = E(n,k) − Σ_{a=1}^{τ} C(τ,a)·Cat_{k−a}
```

with `n = 2r+d−τ`. At the minimal admissible rank `r = k+1` and slack `s = d−τ`
this is `n = 2k+2+s`, so `s` is independent of `k` and `r`. The residue is
`R(τ,s) = { k ≥ 1 : Γ_n(τ,k,2k+2+s) ≤ 0 }`.

All arithmetic below is exact Python `int`; no float occurs anywhere. Generator:
`gamma_residue.py`, SHA-256
`3f26e444fd3eed360d4ffde53890f56322395c2e57d0ce3186c637be4049d43b`, IMPORT LIST
`json`, `math`, `sys` (Catalan numbers by the exact integer recurrence
`Cat_{m+1} = Cat_m·2(2m+1)//(m+2)`, binomials by `math.comb`); output
`G1-residue.json`, SHA-256
`415f3c090d256c9494606f8e725bdf6538bbf78848769a2033153f4be2256767`.

**Slack-0 specialization, checked.** `E(2k+2,k) = Cat_{k+1}` for every
`k = 0..1200` (`identity_E_2k2_k_eq_Cat_k1: true`), so `Γ_n` at slack 0 is
identically the registered award's `Γ(τ,k) = Cat_{k+1} − Σ_j C(τ,j) Cat_{k−j}`.

**The residue table.** Computed at the protocol's horizon `k = 1..max(K(τ),80)`
and again at a deeper horizon `k = 1..1200`; the two agree at every one of the
49 `(τ,s)` cells (`deep_equals_protocol: true`), so nothing re-emerges above the
scan.

| `τ` | `s=0` | `s=1` | `s=2` | `s=3..6` | `K(τ)` |
|---|---|---|---|---|---|
| 1 | **∅** | ∅ | ∅ | ∅ | 0 |
| 2 | `k=1` (1) | **∅** | ∅ | ∅ | 2 |
| 3 | `k=1,2` (2) | **∅** | ∅ | ∅ | 3 |
| 4 | `k=1,2,3` (3) | **∅** | ∅ | ∅ | 4 |
| 5 | `k=1..5` (5) | `k=1,2` (2) | **∅** | ∅ | 6 |
| 6 | `k=1..11` (11) | `k=1,2,3` (3) | **∅** | ∅ | 12 |
| 7 | `k=1..69` (69) | `k=1,2,3,4` (4) | `k=2` (1) | **∅** | 70 |

**This reproduces the protocol's table, C-F4-U's table, and adjudicator F's
Ruling 30b table cell for cell, with no discrepancy at any cell.** Attained
horizon: `k ≤ 1200` at every `(τ,s)` with `τ ≤ 7`, `s ≤ 6`.

**`s*(τ)`.** Writing `s*(τ)` for the least slack at which the residue is empty:

```
s*(1..7) = 0, 1, 1, 1, 2, 2, 3
```

and the step shape — "non-empty exactly when `s < s*(τ)`" — holds at all seven `τ`
(`s_star_step_shape_ok`: true at each). It is a **theorem, not an observation**:
`Γ_n(τ,k,2k+2+s)` is strictly increasing in `s` (below), so
`R(τ,s+1) ⊆ R(τ,s)` (`residue_nested_in_slack: true`), and a nested family cannot
re-emerge after it empties.

**`n` versus the graph order (a labelling clarification, not a correction).** The
protocol names the `τ = 5` cells by "orders 9, 11, 13, 15, 17" at `s = 0` and
"10, 12" at `s = 1`. `n = 2k+2+s` is the **binomial parameter** (`|B|`), which at
those cells is 4, 6, 8, 10, 12 and 5, 7. The quoted orders are the **graph order**
`2r+d = 2(k+1)+(τ+s) = n+τ`, per `SEMANTIC-CONTRACT.md`'s `d(F,r) = |V| − 2r`. My
generator reports both: at `τ=5, s=0`, `order_2r_plus_d = 9, 11, 13, 15, 17`; at
`τ=5, s=1`, `= 10, 12`. **Exact match to the protocol, to Ruling 30's table and to
the registered scope of `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`** ("the finite
residue collapses to FIVE cells, all at tau = 5, all at r = k+1, at orders 9, 11,
13, 15, 17"). Since the registrable statement is arithmetic in `Γ_n`, both
labellings must be on its face or neither; I ask for `n` **and** the order to be
named, because the two differ by `τ` and the table is quoted by order.

**Three cells attain `Γ_n = 0` exactly — the load-bearing finding of this read.**
Scanning `τ = 1..7`, `s = 0..6`, `k = 1..1200` for `Γ_n = 0`
(`boundary_zero_cells`), there are exactly three:

| cell | `n` | order `2r+d` | `Γ_n` |
|---|---|---|---|
| `τ=2, s=0, k=1` (`r=2, d=2`) | 4 | 6 | **0** |
| `τ=5, s=1, k=1` (`r=2, d=6`) | 5 | 10 | **0** |
| `τ=7, s=2, k=2` (`r=3, d=9`) | 8 | 15 | **0** |

Each is in the residue **only** because the residue is defined with `≤ 0` rather
than `< 0`. Recomputing `s*` under the strict convention gives
`s*(1..7) = 0, 0, 1, 1, 2, 2, 2` — it changes at `τ = 2` and at `τ = 7`. The
`τ = 7` change is the consequential one: **the entire "no closed form" fence rests
on this single cell.** Under `< 0`, `s*(7)` would be 2 and `⌈(τ−1)/3⌉` would fit
`τ = 3..7` exactly (`closed_form_matches_strict_variant`: true at
`τ = 1,3,4,5,6,7`, false only at `τ = 2`). The fence as ruled is correct, but it
is one integer deep, and a downstream reader who writes `< 0` will derive a
different `s*` and a closed form. **This must be on the face of the registration.**

The third cell is not new to the record: C-F4-T's finding A9 names it exactly
("`(k = 2, r = 4)` — order 15, where `Γ_n(7,2,8) = 0` exactly"), in the course of
striking a different literal. I confirm it independently and additionally locate
the other two, which no input names. The `τ = 7, s = 2` cell and C-F4-T's
`(τ,d,k,r) = (7,7,2,4)` cell are the **same arithmetic point** reached by two
readings (`d=9, r=3` versus `d=7, r=4`; both give `n = 8`, order 15) — consistent,
and worth a scope note, since the slack index does not determine `(d,r)` uniquely.

**Why `≤ 0` is the right convention, and forced rather than chosen.** The bound is
`Δ_k ≥ Γ_n`. At `Γ_n = 0` the bound yields `Δ_k ≥ 0`, which does not establish the
target `Δ_k > 0` — the cell is genuinely inconclusive and belongs in the residue.
Independently: at slack 0 the residue is **exactly the complement of the registered
strict-positivity region**,

```
R(τ,0) = { 1, …, K(τ)−1 }     for every τ = 1..7
```

(`R_slack0_interval_all_tau: true`), which is an identity only under `≤ 0`. So the
convention of record is the one that makes the residue the exact complement of
`E993-R25-CATALAN-GAP-MONOTONE-RATIO`'s `Γ(τ,k) > 0 for k ≥ K(τ)`.

**A by-product worth registering alongside: `K(τ)` is sharp.** The registered award
carries the positivity direction only — its own statement labels
`Γ(τ,k) > 0 for k ≥ K(τ)` the "**sufficiency half**". My table supplies the
complement: `max R(τ,0) = K(τ)−1` for every `τ = 2..7` and `R(1,0) = ∅` with
`K(1) = 0` (`K_sharpness`, `K_equals_max_R_plus_1`: true at all seven). Witness
values at the boundary: `Γ(τ,K(τ)−1) = 0, −1, −4, −14, −1563,
−799363812466329793611557404284949737` for `τ = 2..7`, against
`Γ(τ,K(τ)) = 2, 4, 5, 18, 16848, 1327331792479871686755508212156357075`. So the
registered `K(1..7) = 0,2,3,4,6,12,70` are not merely valid thresholds but the
**least** ones — a fact the residue count establishes and the registered award
does not assert.

---

## Why each set is complete above the scan

Each set is complete for one reason above `K(τ)` and a different one below it.
Both are exact; neither is a scan of an unbounded range.

**(1) Above `K(τ)`, at slack 0 — registered and formally verified.**
`E993-R25-CATALAN-GAP-MONOTONE-RATIO` (status VERIFIED; certificate
*"Stage 7 governed lean-proof-workflow run
runs/lean-2026-09-21-c3-catalan-gap-monotone-ratio: formally_verified (kernel +
informal audit + fidelity match)"*) states, verbatim from the Stage 2 registry
snapshot: *"Let Gamma(tau,k) = Cat_{k+1} − sum_{j=1}^{tau} C(tau,j) Cat_{k−j} with
Cat_{k−j} := 0 for j > k (integer zero-extension convention of record). … Gamma(tau,k) > 0
for all k >= K(tau) with K(1..7) = 0,2,3,4,6,12,70 (sufficiency half)."* Because
`E(2k+2,k) = Cat_{k+1}` (checked, `k ≤ 1200`), `Γ_n` at slack 0 **is** that
`Γ(τ,k)` identically — not an analogue of it. So `R(τ,0) ⊆ {1,…,K(τ)−1}` is
registered, formally verified content.

**(2) From slack 0 to slack `s ≥ 1` — a one-line corollary of a second registered
claim; the step is supplied by me, and the corollary itself is not separately
registered.** `Γ_n(τ,k,n) = E(n,k) − Σ_a C(τ,a)Cat_{k−a}`, and the subtracted sum
does not depend on `n`. Hence for fixed `(τ,k)`, `Γ_n` inherits the monotonicity of
`E(·,k)` exactly. `E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING` (status VERIFIED,
alias "Lemma T", `proved_informal`) states verbatim: *"With E(n,k) = C(n,k+1) −
C(n,k) (zero-extended): for every k >= 0 and every n >= 2k+2, E(n,k) >= Cat_{k+1},
with equality exactly at n = 2k+2, and **E(.,k) strictly increasing on n >= 2k+2**."*
Since slack `s` means `n = 2k+2+s` with `2k+2+s ≥ 2k+2`, this gives directly

```
Γ_n(τ,k,2k+2+s)  >  Γ_n(τ,k,2k+2) = Γ(τ,k)     for every s ≥ 1,
```

so `Γ(τ,k) > 0 ⟹ Γ_n > 0` at **every** slack, and therefore
`R(τ,s) ⊆ R(τ,0) ⊆ {1,…,K(τ)−1}` for every `s ≥ 0`. **The registered range
`n ≥ 2k+2` is exactly the range the transfer needs**: I do not have to appeal to
the sharper `n ≥ 2k` refinement that lives only in the claim's *scope* note, nor
to any `τ ≤ d+3` sharpening. Verified numerically as a cross-check:
`Gamma_strictly_increasing_in_slack: true` over `τ = 1..7`, `k = 1..299`,
`s = 0..8`; the underlying Pascal identity `E(n+1,k) − E(n,k) = C(n,k) − C(n,k−1)`
(`E_increment_identity: true`, `k ≤ 59`) and `E_strictly_increasing_on_n_ge_2k:
true` (`k ≤ 199`).

**Status of this step, stated as the protocol requires.** The transfer is **not
itself a registered standalone claim**. It is a corollary of registered VERIFIED
content, and the adjudication's registration item 4 rules that the related
rank-isolation reduction is **not** to be registered as drafted ("a scope note on
`E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING` recording `(τ,d)`-uniformity with
hypothesis `τ ≤ d+3`, at most"). I therefore supply the step here, and the
registrable statement must carry it as a named derivation from
`-CATALAN-GAP-MONOTONE-RATIO` **and** `-BINOMIAL-DIFFERENCE-CATALAN-CEILING`,
not as an independent fact. The registered scope of
`E993-R25-COVER-DIAGONAL-D7-SIGN` uses the same transfer in the same direction
("positivity at r >= 71 follows from the registered Catalan dominance Gamma(7,k) > 0
for k >= K(7) = 70"), which corroborates that this is the run's own reading.

**(3) Below `K(τ)` — a finite exact check, `k ≤ 69` at worst.** With (1) and (2),
completeness reduces to deciding the sign of `Γ_n` at `k = 1..K(τ)−1` for each
slack — 0, 1, 2, 3, 5, 11 and 69 integers at `τ = 1..7`. My generator decides all
of them by exact integer arithmetic. The protocol's horizon `max(K(τ),80)` covers
every `τ ≤ 7` (`K(7) = 70 ≤ 80`), and the `k ≤ 1200` run confirms no re-emergence.
`all_residues_strictly_below_K: true`.

**So "established, not scanned" is sustained**, with one precision the inputs do
not state: the establishment is a *two-source* composition — a formally verified
award for the slack-0 tail, plus a `proved_informal` registered claim for the
slack transfer. The composite therefore grades at `proved_informal`, which is the
grade the adjudication proposes. It cannot be quoted as formally verified.

**`τ ≥ 8` is correctly excluded.** No registered `K(τ)` covers `τ ≥ 8`; C-F4-U's
scan puts `K(8..10)` beyond `k = 6,000`. I did not scan there and report nothing
there. The registered award's own final clause — *"and Gamma(tau,k) < 0 for all
tau >= 8, k >= tau"* — makes the exclusion structural rather than merely
budgetary: at `τ ≥ 8` the slack-0 gap is negative for **all** `k ≥ τ`, so there is
no `K(τ)` to be had and the residue is not a finite set at slack 0 at all. The
fence should say this, not only "out of reach".

---

## Conventions: τ = 1, k ≥ 1, zero extension

**(a) The `τ = 1` row, which the protocol's table omits.** `R(1,s) = ∅ for every
s = 0..6`, hence `s*(1) = 0`, consistent with the quoted `s*(1..7)` tuple. At slack
0 it has a closed form: `Γ_n(1,k,2k+2) = Cat_{k+1} − Cat_{k−1}` (verified as an
identity for `k = 0..1200`), which is `> 0` for every `k ≥ 1` because Catalan is
strictly increasing from index 1 and `Cat_{k+1} > Cat_{k−1}` (verified,
`k = 1..1200`); at `k = 0` it is `Cat_1 − Cat_{−1} = 1 > 0`. This matches the
registered `K(1) = 0` exactly, and by the slack transfer the whole row is empty.
The step-shape phrasing "non-empty exactly when `s < s*(τ)`" is vacuously true at
`τ = 1` (`s*(1) = 0`), which is why the row can be omitted from a table without
error — but it should be **stated**, since `s*(1) = 0` is quoted in the tuple and
a reader who reconstructs the table from the tuple alone cannot tell whether
`τ = 1` was checked or assumed. It was checked.

**(b) `k ≥ 1` versus `k ≥ 0` — immaterial, and provably so.** The protocol defines
`R(τ,s)` over `k ≥ 1`; C-F4-U and adjudicator F both define it over `k ≥ 0`
(Ruling 30: *"`R(d,τ) = { k ≥ 0 : Γ_n(τ,k,2k+2+(d−τ)) ≤ 0 }`"*). The two agree,
because `k = 0` is never in the residue:

```
Γ_n(τ,0,n) = E(n,0) − Σ_{a≥1} C(τ,a)·Cat_{−a} = (n − 1) − 0 = n − 1,
```

so at `n = 2+s` it is `s+1 ≥ 1 > 0` for every `τ` and every `s ≥ 0`
(`k0_in_residue_cells: []` over `τ = 1..7`, `s = 0..6`; `R_including_k0` equals the
`k ≥ 1` table at all 49 cells). C-F4-U's finding 9 states the same fact. **No cell
of the table and no value of `s*` depends on the choice.** Recommended: pin one
range in the registered text (`k ≥ 1` is the protocol's and yields the same sets)
and note the equivalence, so that the two published definitions cannot be read as
a discrepancy.

**(c) The zero-extension convention `Cat_{k−a} := 0` for `a > k` is load-bearing.**
Two checks.

*It is equivalent to truncation, as intended.* Summing `a = 1..τ` with zero
extension gives the same integer as truncating the sum at `a = min(τ,k)`
(`zero_extension_equals_truncation: true`, `τ = 1..7`, `s = 0..6`, `k = 1..199`) —
so the convention adds no terms, it only makes the formula total. This matches the
registered award's own wording (*"with Cat_{k−j} := 0 for j > k (integer
zero-extension convention of record)"*) and `SEMANTIC-CONTRACT.md`'s integer zero
extension for `coeff`.

*A different extension destroys the table.* Substituting the plausible wrong
convention `Cat_{k−a} := Cat_0 = 1` for `a > k` flips the sign predicate at **26**
cells in the window `τ ≤ 7`, `s ≤ 6`, `k ≤ 11`, and yields
`s*(1..7) = 0, 1, 2, 4, 6, —, —` (undefined at `τ = 6,7`: the residue is still
non-empty at `s = 6`). So the count is not robust to the convention, and the
convention must be quoted **with** the count. The same applies to `Cat_m := 0` for
`m < 0` inside `E(b,j)`'s floor, which is the registered
`E993-BINOMIAL-DIFFERENCE-CATALAN-FLOOR`'s own endpoint convention (*"At integer
j = −1 the difference is 1; at j <= −2 it is 0 under integer zero extension"*).

**(d) `≤ 0` versus `< 0`.** Covered above; the third convention that must be on the
face, and the only one that changes `s*`.

---

## Alias check

**Lexical**, over all **360** claim records of the run-local registry of record
(`control/snapshots/CLAIM-IDENTITY.run-local.a1-stage2.json`, digest verified;
`schema_version verityos.math.claim-identity.v1`), sweeping `claim_key`,
`aliases` and `alias_patterns`: `S-STAR` — none; `SSTAR` — none; `ISOLATION` —
none; `INCONCLUSIVE` — none; `AMBIG` — none. `RESIDUE` matches exactly two keys,
`E993-R25-COVER-DIAGONAL-D6-RESIDUE-COMPLETE` and
`E993-R25-MATCHING-BAND-ABSORBING-RESIDUE` (a matching-branch object, unrelated).
A further sweep of every claim's `statement`, `scope`, `certificate` and `aliases`
text for `s*`, "slack threshold", "residue count" and the literal `0,1,1,1,2,2,3`
returns exactly **one** substantive hit, which is decisive:

> `E993-R25-COVER-DIAGONAL-D6-RESIDUE-COMPLETE` (VERIFIED), scope: *"The tau <= 5
> Gamma-residue count by excess with s\*(tau) and Lemma H's uniqueness half are
> **STATED by the synthesis and NOT registered (they await an isolated second
> read)**."*

**The registry itself records this object as unregistered and awaiting exactly this
read.** The namespace is clean: registering the count additively creates no
duplicate and re-names no existing claim.

**Mathematical**, against the five claims the protocol names.

- **`E993-R25-CATALAN-GAP-MONOTONE-RATIO`** (VERIFIED, formally verified). **Not an
  alias; a dependency, and a proper one.** It supplies the slack-0 tail
  (`Γ(τ,k) > 0` for `k ≥ K(τ)`, `K(1..7) = 0,2,3,4,6,12,70`) and the `τ ≥ 8` fence
  (`Γ(τ,k) < 0` for `τ ≥ 8`, `k ≥ τ`). Its own statement labels the positivity
  direction the "sufficiency half"; the residue count adds the **complement** —
  the exact membership below `K(τ)`, the sharpness `max R(τ,0) = K(τ)−1`, and the
  behaviour at every slack `s ≥ 1`, none of which that claim asserts. Its scope
  fence (*"NOT a graph theorem, NOT fixed-band, not uniform in d (d absent) … no
  transfer to forests, covers, matchings, Delta_k, x(F), any tier"*) is respected
  by keeping the registrable statement arithmetic.
- **`E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING`** (VERIFIED, `proved_informal`,
  alias "Lemma T"). **Not an alias; the second dependency**, supplying the slack
  transfer via *"E(.,k) strictly increasing on n >= 2k+2"*. The residue count is
  not an instance of it: that claim is about one `E(·,k)` at varying `n` and
  carries no `τ`, no Catalan sum and no count.
- **`E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`** (VERIFIED). **Not an alias;
  calibration and the forest-side boundary.** Its scope names the five `τ = 5`
  cells — *"all at tau = 5, all at r = k+1, at orders 9, 11, 13, 15, 17"* — which
  my independently built instrument reproduces cell for cell as `R(5,0)` with
  `order_2r_plus_d = 9,11,13,15,17`. This is the calibration that makes the rest
  of the table credible. It is a **forest** theorem; the residue count is an
  **arithmetic** statement, related to it only through the already-registered
  `Δ_k ≥ Γ_n` bound at the cover hypothesis, which that scope also carries
  (*"the reduction is exact, not merely sufficient"*). Registering the count does
  not restate it and raises no status on it.
- **`E993-R25-CARD5-JOINT-BUDGET-CELLS`** (VERIFIED, formally verified). **Not an
  alias; an independent corroboration of one row.** Its scope carries the ballot
  identity verbatim: *"the size-only card-5 bound at the top-rank cell IS Gamma(5,k)
  identically, so K(5) = 6 and 'size-only closes from order 19 up' are one fact and
  the small-rank list is exactly k in {1..5}."* That is `R(5,0) = {1,…,5}` and
  `K(5) = 6` reached by a different route, agreeing with my computation exactly
  (order 19 = `2(k+1)+5` at `k = 6 = K(5)`, the first closed rank). Its own
  FIXED-CELL fence is not disturbed: the residue count asserts nothing about any
  `Δ_k` value.
- **`E993-R25-COVER-DIAGONAL-D6-SIGN` / `-D7-SIGN`** (both REFUTED). **Not aliases,
  and — the important direction — not contradicted.** These are forest statements
  at the diagonal `τ = d` (slack 0) that are false at `r = 9,10` and `r = 8..33`
  respectively. The residue count says only where the `Γ` bound is inconclusive,
  never where a statement is false; the two are compatible by construction, since
  every refuted cell lies inside the slack-0 residue (`k = r−1 ≤ K(τ)−1`) where the
  bound decides nothing. `-D7-SIGN`'s scope uses my transfer in the same direction
  and confirms `K(7) = 70` against my `max R(7,0) = 69`. **REFUTED never regresses
  to OPEN**, and nothing here touches either status.

**Errata.** All five errata records in the capsule were checked for bearing on the
residue, the five cells, the zero-extension convention and `s*`: no erratum bears
on this object. `C5-E-b` (the "FIVE cells" correction) is present and is the
erratum whose species both critics invoke against the return's struck "order 9
vacuous" literal; it corroborates the five-cell reading my table reproduces and
contradicts nothing here.

---

## Verdict and the exact registrable statement

The table is exact. I rebuilt `Γ_n` from the definitions, in an instrument written
for this read that imports no prior seat's code and never read the r25 scratch,
and reproduced all 49 `(τ,s)` cells, all seven `s*` values and all five `τ = 5`
orders in agreement with C-F4-U, C-F4-T's A9 and adjudicator F's Ruling 30b, with
**zero discrepancies**. Each `s*(τ)` is established, not scanned: the slack-0 tail
by a formally verified award, the slack transfer by a one-line corollary of a
second registered VERIFIED claim, the remainder by a finite exact check of at most
69 integers. The fences ruled — `τ ≥ 8` excluded, no closed form, not a falsity
criterion — are all correct as ruled.

Three repairs are required before the text is registered, none of which changes a
single cell of the table. (i) The residue convention `Γ_n ≤ 0` must be declared on
the face, together with the three cells that attain `Γ_n = 0` exactly
(`(τ,s,k) = (2,0,1), (5,1,1), (7,2,2)`), because `s*(2)` and `s*(7)` both flip
under `< 0` and **the "no closed form" fence rests entirely on the single cell
`(7,2,2)`** — under `< 0`, `⌈(τ−1)/3⌉` would fit `τ = 3..7`. (ii) The `k`-range
must be pinned (`k ≥ 1`, with the note that `k ≥ 0` gives the same sets because
`Γ_n(τ,0,2+s) = s+1 > 0`), since the protocol and Ruling 30 publish different
ranges. (iii) The slack transfer must be named as a derivation from
`E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING` rather than carried silently, and
the composite grade must be `proved_informal` — **not** formally verified, since
only the slack-0 tail is. One narrowing is offered as a gain, not a defect: the
count establishes that the registered `K(1..7)` are the **least** thresholds, which
the award's "sufficiency half" does not assert, and which is worth putting on the
face.

verdict: confirmed_with_repairs

**The exact registrable statement** (arithmetic; `proved_informal`;
critic-attributed to C-F4-U for the threshold and to C-F4-T and C-F4-U for the
`τ = 5` table, confirmed by adjudicator F and by this isolated second read):

> **Conventions of record.** `C(n,j)` is zero-extended (`0` unless `0 ≤ j ≤ n`);
> `Cat_m = C(2m,m)/(m+1)` with the integer zero extension `Cat_m := 0` for `m < 0`,
> so that `Cat_{k−a} := 0` for `a > k`; `E(n,k) = C(n,k+1) − C(n,k)`;
> `Γ_n(τ,k,n) = E(n,k) − Σ_{a=1}^{τ} C(τ,a)·Cat_{k−a}`. With `n = 2r+d−τ` evaluated
> at the minimal admissible rank `r = k+1` and slack `s = d−τ`, so that
> `n = 2k+2+s`, define the **residue** `R(τ,s) = { k ≥ 1 : Γ_n(τ,k,2k+2+s) ≤ 0 }`
> — **non-strict**: `Γ_n = 0` is inconclusive for `Δ_k > 0` and is in the residue.
> (`k ≥ 0` gives the same sets: `Γ_n(τ,0,2+s) = s+1 > 0`.) The graph order of a cell
> is `2r+d = n+τ`.
>
> **Statement.** For `τ = 1..7`, `R(τ,s)` is: `τ=1`: empty at every `s ≥ 0`;
> `τ=2`: `{1}` at `s=0`; `τ=3`: `{1,2}` at `s=0`; `τ=4`: `{1,2,3}` at `s=0`;
> `τ=5`: `{1,…,5}` at `s=0` (orders 9, 11, 13, 15, 17) and `{1,2}` at `s=1`
> (orders 10, 12); `τ=6`: `{1,…,11}` at `s=0` and `{1,2,3}` at `s=1`;
> `τ=7`: `{1,…,69}` at `s=0`, `{1,2,3,4}` at `s=1`, `{2}` at `s=2` (`n=8`,
> order 15, `Γ_n = 0` exactly); and empty at every larger slack. Equivalently
> `R(τ,0) = {1,…,K(τ)−1}` with the registered `K(1..7) = 0,2,3,4,6,12,70`, and
> `R(τ,s+1) ⊆ R(τ,s)`, so the residue is non-empty **exactly** when `s < s*(τ)`,
> with the **slack threshold**
>
> ```
> s*(1..7) = 0, 1, 1, 1, 2, 2, 3
> ```
>
> The three cells attaining `Γ_n = 0` exactly are `(τ,s,k) = (2,0,1)` (order 6),
> `(5,1,1)` (order 10) and `(7,2,2)` (order 15); under a strict (`< 0`) residue
> convention `s*` would read `0,0,1,1,2,2,2`.
>
> **Establishment.** Each value is established, not scanned. For `k ≥ K(τ)` at
> slack 0, positivity is the formally verified
> `E993-R25-CATALAN-GAP-MONOTONE-RATIO` (`Γ_n` at slack 0 is that claim's
> `Γ(τ,k)` identically, since `E(2k+2,k) = Cat_{k+1}`). Positivity transfers to
> every slack `s ≥ 1` because the subtracted sum is independent of `n` and
> `E(·,k)` is strictly increasing on `n ≥ 2k+2` — the registered VERIFIED
> `E993-R25-BINOMIAL-DIFFERENCE-CATALAN-CEILING`; **this transfer is a derivation
> from that claim, not an independently registered fact.** Below `K(τ)` it is a
> finite exact check over at most 69 integers per slack. The composite grade is
> `proved_informal`; only the slack-0 tail is formally verified.
>
> **Corollary (registrable with it).** `K(1..7) = 0,2,3,4,6,12,70` are the
> **least** such thresholds: `max R(τ,0) = K(τ)−1` for `τ = 2..7`, with
> `Γ(τ,K(τ)−1) ≤ 0` witnessed at `0, −1, −4, −14, −1563,
> −799363812466329793611557404284949737`. The registered award carries only the
> sufficiency half.
>
> **Fences.** `τ ≥ 8` is **not** covered: no registered `K(τ)` exists there, and
> the registered award's own clause `Γ(τ,k) < 0 for all τ ≥ 8, k ≥ τ` makes the
> slack-0 residue infinite there rather than merely unscanned. **No closed form
> for `s*` may be quoted**: `⌈(τ−1)/3⌉` matches `τ = 1..6` and breaks at `τ = 7`
> (giving 2 against the true 3), and that break is carried by the single cell
> `(7,2,2)` where `Γ_n = 0`. The transfer to forests is only the
> already-registered `Δ_k ≥ Γ_n` bound at the cover hypothesis `τ(F) ≤ τ`.

---

## What it is not

- **Not a falsity criterion.** `R(τ,s)` marks where the `Γ` bound is
  **inconclusive**, never where any statement is false. At slack 0 a residue cell
  may be true or false: 0 of 5 are false at `τ = 5`, 2 of 10 at `τ = 6`, at least
  26 of 67 at `τ = 7` — those falsities are the separately registered REFUTED
  `E993-R25-COVER-DIAGONAL-D6-SIGN` and `-D7-SIGN`, and they are **not** evidence
  supplied by this count. Conversely, emptiness of `R(τ,s)` certifies positivity of
  the bound, hence of `Δ_k`, only through the already-registered `Δ_k ≥ Γ_n` step.
- **Not new evidence for any cell's sign.** No `Δ_k` value, no census, no forest is
  computed anywhere in this read. The five `τ = 5` cell minima (19, 39, 56, 56, 43)
  and the `d = 6` minima (+26, +66) are registered elsewhere and are cited here
  only as calibration of the cell *identities*, never re-derived.
- **Not `c(d)`, and not a claim about `c(d) = min(d,5)`.** `d` enters only through
  the slack `s = d−τ`. The statement is uniform in `d` in the sense that it depends
  on `d` and `τ` only through their difference — which is precisely why it is an
  arithmetic statement and not a fixed-band one.
- **Not a tier statement.** It touches no Tier 1 (`E993-R25-UNR-FOREST-WIDE`), no
  Tier 2 (`E993-G1WIDE-NO-SIZE-CAP`), no `OB-G1`/G1wide object, no
  FOREST/TREE/TRANSFER statement, and not Erdős #993.
- **Not a graph theorem.** It quantifies over integers `(τ,k,s)`, not over forests.
  Acyclicity, `ν`, König, `x(F)` and the first-descent convention appear nowhere in
  it. In particular the forest-level vacuity of a cell (order `< 2τ`) is irrelevant
  to the arithmetic count, and the count must not be read as asserting that any
  such cell is populated.
- **Not a status change to anything.** No registered claim is strengthened,
  weakened or re-graded by it; `-D6-SIGN` and `-D7-SIGN` remain REFUTED, and the
  two dependency claims remain VERIFIED at their existing certificates. This seat
  registers nothing.
- **Not formally verified.** Only the slack-0 tail rests on a formally verified
  award; the slack transfer is `proved_informal` and the composite inherits that.
- **Not extensible as written.** The `τ = 1..7` range is a hard boundary set by the
  registered `K(τ)`, not a budget; nothing here licenses interpolation to `τ ≥ 8`.

---

## Artifact inventory

All under the absolute path
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-uniform-residual-no-recovery-addendum-dre-2026-09-22/scratchpad/lane-c-SR-RES/`.
Python standard library only, exact integers throughout; no network, no installs,
no `/tmp`, `mktemp`, `TMPDIR` or session scratchpad; no wall-clock, PID or host
field in any hashed payload (verified programmatically over both JSONs). Both
generators ran in the **foreground** to completion.

| file | SHA-256 | import list | purpose |
|---|---|---|---|
| `seal_audit.py` | `57404c7de480b459ec439a1628a216f764179ba983994612b866c3dc0d342f42` | `hashlib`, `json`, `os`, `sys` | canonical recomputation of the capsule inner seal (sort_keys, `separators=(",",":")`, `seal_sha256` removed) and SHA-256 + byte-length verification of every member read |
| `SEAL-AUDIT.json` | `c089ba40c83df6c92fe997804c971748c92fd68f91bcbec637c2f587c7a76fbf` | — | its results: seal match, 52/52 file count, 19/19 members verified, 0 mismatches |
| `gamma_residue.py` | `3f26e444fd3eed360d4ffde53890f56322395c2e57d0ce3186c637be4049d43b` | `json`, `math`, `sys` | `Γ_n` re-derived from the definitions; the residue table at both horizons; `s*(τ)` and its step shape; the slack-transfer identities; the three boundary zeros and the strict-convention variant; `K(τ)` sharpness; the `τ = 1` row; the `k ≥ 0` and zero-extension dependency checks; cell orders `2r+d = n+τ` |
| `G1-residue.json` | `415f3c090d256c9494606f8e725bdf6538bbf78848769a2033153f4be2256767` | — | its results; every numeric claim in this report is a named field of this file |

**Replay** (foreground, from the directory above):
`python3 gamma_residue.py > G1-residue.json` and
`python3 seal_audit.py <the 19 member paths, relative to the run root> > SEAL-AUDIT.json`.
`gamma_residue.py` completes in ≈3 s.

**Field map for the numeric claims above.** Residue table —
`table_protocol_horizon`, `table_deep_horizon`, `deep_equals_protocol`;
`s*` — `s_star`, `s_star_tuple_1_to_7`, `s_star_step_shape_ok`,
`residue_nested_in_slack`; boundary zeros — `boundary_zero_cells`,
`s_star_nonstrict_le0`, `s_star_strict_lt0`,
`closed_form_matches_strict_variant`, `closed_form_ceil_tau_minus_1_over_3`,
`closed_form_first_failure_tau`; slack-0 identity — `identity_E_2k2_k_eq_Cat_k1`;
transfer — `E_increment_identity`, `E_strictly_increasing_on_n_ge_2k`,
`Gamma_strictly_increasing_in_slack`; completeness above the scan —
`all_residues_strictly_below_K`, `residue_below_K`,
`R_slack0_equals_interval_1_to_K_minus_1`, `R_slack0_interval_all_tau`,
`K_sharpness`; conventions — `tau1_row`, `k0_Gamma_by_tau_slack`,
`R_including_k0`, `k0_in_residue_cells`, `zero_extension_equals_truncation`,
`cells_where_wrong_extension_flips_sign`, `wrong_extension_s_star`; orders —
`order_convention`, `tau5_orders`, `all_residue_cells_with_orders`.

**Reread before close.** This file was reread in full against the protocol's
required headings, the one-`verdict:`-line rule, the model-disclosure line, the
digested-generator-with-import-list rule and the closing-line rule before the
final write. No background job of this seat was running at the time of the write.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit
parameter); the seat cannot self-inspect its runtime model/effort — stated on
dispatch-record authority.

headline_resolved: no
