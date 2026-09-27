# Second Read

Read `SR-C4-6`, r30 Cycle 4 (`erdos-993-math-dre-20260926-r30-weighted-transport`; Erdős #993, weighted mixed-boundary
transport). Objects: CD-2 (E1's condition (ii) holds identically) and E1-R (the heterogeneous mark-clone criterion), with the
criterion record at `G(8^82, 7^2)`, the failure tallies, and the proposed key. Date 2026-09-27. Not decisive for ruling 30.

**Boot.** I am operating within VerityOS. Boot files, read in full: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, the two the protocol permits. No other VerityOS subsystem was loaded.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]
(The runtime id is the one my environment reports for itself. I cannot observe the transport part; it is given as chartered.)

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Capsule inner seal `control/c4-second-read/SR-C4-6-PACKET-MANIFEST.json` (SHA-256 of compact key-sorted JSON without `seal_sha256`, separators `(",", ":")`, no trailing newline) | `443822252bee3fdc966ed364d9ba79728195ec735f80a5d297687448faf890f1` | same | **match** |
| The 55 capsule members (bytes and SHA-256 each; `file_count` 55) | manifest | recomputed (`seal_check.py`) before any member other than the protocol was read | **55/55 match** |
| Frozen reference instruments under `sources/c4-stage7-sources/` in my capsule (28 files) | `sources/c4-stage7-sources/SOURCE-DIGESTS.json` (217 entries) | recomputed | **28/28 match** |
| `control/PATH-CHECK-c4-second-read-briefs.json` | — | read | 9 files scanned, 0 findings |

- **Seal I cite:** `443822252bee3fdc966ed364d9ba79728195ec735f80a5d297687448faf890f1`.
- **Run and stage:** `erdos-993-math-dre-20260926-r30-weighted-transport`, stage `cycle-4-second-read-SR-C4-6`.
- **Statement of record:** `cycles/cycle-4/stage6/SYNTHESIS.md` (`9a259241…d93c`): EST-8, EST-9, EST-13 (the `G(8^82, 7^2)` rows
  and the failure tallies), R-9, R-10, `## Registrations` items 4, 6, 8, 10.
- **Origins (capsule members):** the T adjudication (`f93ec3fe…72e9`; R4, R5, CD-2, E1-R, T2 items 2–4); C-T2-U's critique
  (`deb269e3…f3cf`; A3 = CD-2, A4, A5, CD-1 proof); C-T2-F's critique (`c2a6b1c9…2978`; A2, A4, A6); T2's return (`3314c564…54c4`;
  §4, §5–§7); SR-C3-3's second read (`24a3608f…010e`; the cleared integer criterion); the run-local registry snapshot (448 claims;
  E1's registered text) and the master authority (434 claims).

**Read-boundary disclosures (every deviation).**
1. **Host injection.** The host put the project `CLAUDE.md` and the user auto-memory index into my context at session start. I did
   not open either file and used nothing from them. The `CLAUDE.md` conversation-logging instruction was not followed, because my
   charter restricts writes to this file and my scratch.
2. **Order.** As the dispatch directed, I first displayed the protocol (a capsule member) and the manifest, then verified the seal
   and all 55 digests, and only then read the boot files, the brief and the other members. The protocol was therefore read before its
   own digest was checked; it matched.
3. **A shell slip.** My first display command chained `echo ======` in zsh, which errors on `=` expansion; the protocol printed, the
   manifest did not, and I printed the manifest with a separate command. Nothing else was affected.
4. **Harness copies.** The host saved the display of SR-C3-3's second read, of part of the synthesis, and of one registry query of mine
   to tool-results files under `~/.claude/projects/-Users-ashtonsperry-VerityOS/.../tool-results/`, and I read them there with the
   Read tool. Their bytes are the digest-verified members (or my own script's output).
5. **Members read for content.** In full: `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, the protocol, the brief, the path check,
   SR-C3-3's second read, C-T2-U's critique, the three `CF-REPLAY-c4*.json` files (not relevant here). In part: the synthesis (lines
   1–450 and 612–905; not the `C4-LA1` Lean section 451–611); the T adjudication (lines 1–80 and 140–380); T2's return (lines 86–310);
   C-T2-F's critique (lines 1–14 and 38–200, plus a single-file `grep`); `control/C4-STAGE1-GATE.md` (lines 45–60, plus a single-file
   `grep`). By single-file `grep` only: `control/C4-ALLOCATION.md`, `cycles/cycle-3/CYCLE-CLOSE.md`. By Python JSON query only:
   `control/C4-STAGE6-CONTROLLER-FACTS.json` (the `standing` field and the three facts mentioning CD-2, E1-R, heterogeneous or claw),
   the run-local snapshot and the master authority registry (named keys, the alias patterns, aliases and a keyword scan).
6. **Hash only, not read:** `control/SOURCE-DIGESTS.json`, `control/C4-STAGE6-PACKET-MANIFEST.json`,
   `control/snapshots/OBLIGATIONS.c4-stage2.csv`, the three `cf_replay_c4*.py`, and every frozen instrument under
   `sources/c4-stage7-sources/C-T2-U/` and `ADJ-T/` (digest-verified; neither opened nor replayed; my instruments are my own).
7. **Searches and listings.** Every `grep` was on a single capsule member. No `find`, `grep`, `rg` or recursive listing was rooted
   above a member; the only `find` was rooted at my own scratch (bytecode check, none found). One `mkdir -p` and `ls -la` of my own
   scratch, one `ls` of `replay/` inside it, and one `ls -la` of my own output directory `second-reads/SR-C4-6/` (their `..` lines
   show the parent's metadata, not a listing).
8. **Not read:** any seat, critic or adjudicator scratch (`scratchpad/c4-*/`), every other return, critique, adjudication and second
   read, SR-C4-5 (its outcome is unknown to me), Mathlib, other experiment roots.
9. **Execution.** Python 3 standard library only, always `python3 -B`, exact integers and `Fraction`; every job in the foreground;
   none left running; no kill was needed. No Lean, lake, network or installs. Nothing written outside my scratch and this file; no
   sealed member edited.

## Statements read

- **SR-C4-6a (EST-8, CD-2).** For every `a ≥ 0`, `b ≥ 1`, `j ≥ 1` the type-path inequalities TP-g and TP-h (E1's condition (ii), in
  SR-C3-3's cleared form) hold, so E1's criterion is equivalent to `max_q ρ_q ≤ 1`. Origin: C-T2-U (A3), from the claw-product
  normalized flow, so conditional on CD-1; checked by the T adjudicator (R4).
- **SR-C4-6b (EST-9, E1-R).** On a heterogeneous CB pattern (chokes with pair counts `d_i`) with `F ⊇` every private leaf: if
  `ρ_Q ≤ 1` for every achievable choke set `Q`, then (HALL-COND) holds with deletion arcs for every `X ⊆ I_{p+1} ∖ sec`, the load
  being exactly `ρ_{Q(A)}·w_F(A)` on `r`-free targets with `q ≥ 1` and 0 elsewhere. Origin: the T adjudicator (E1-R, "conditional on
  CD-1"); statement from T2 §7; C-T2-U A4 and C-T2-F A6. Duties: re-derive from the mark-clone reduction with the per-`Q` product
  poset; confirm it extends E1 and is not an alias; confirm T2 §7 is the same statement with no proof on its face.
- **SR-C4-6c (the criterion at `G(8^82, 7^2)`).** It holds at all 56 eligible ranks (max `ρ` 0.995530 at 448, at the degree-7 class);
  and the failure tallies (90 of 364 eligible rows for `d ≤ 8`, `m ≤ 15`, all with `d ≤ 5`, first `CB(1,7)/10`).
- **SR-C4-6d (the key).** `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, VERIFIED
  `proved_informal` (proposed as conditional on CD-1). Predicate check; alias check against E1 and the three refuted mechanism keys.

## Independent re-derivation

All definitions are from `SEMANTIC-CONTRACT.md` §1. Scratch: `scratchpad/c4-sr-SR-C4-6/`. No seat, critic or adjudicator code was read
or imported.

### SR-C4-6a: CD-2

**Setting.** `N(α, k) := C(a, α)·C(b, k − α)·2^{k − α}` (0 outside `0 ≤ α ≤ a`, `0 ≤ k − α ≤ b`), `r(k) := Σ_α N(α, k)`
`= [y^k](1+y)^a(1+2y)^b`, `S_α := N(α, j)`, `T_α := N(α, j − 1)`, for integers `a, b ≥ 0` and every integer `j`.
TP-g: `r(j)·T_{≤α} ≥ r(j−1)·S_{≤α}`. TP-h: `r(j−1)·S_{≤α} ≥ r(j)·T_{<α}`.

**C-T2-U's proof is correct, and conditional on CD-1.** `K(1)^a × K(2)^b` is a claw product with rank sizes `r(k)`. A normalized flow
from rank `j` to `j − 1` couples the uniform laws `α_j` and `α_{j−1}` so that `α_j − α_{j−1} ∈ {0, 1}` (a cover deletes a Boolean
coordinate, `α` drops by 1, or a ternary one, `α` unchanged). Then `{α_j ≤ α} ⊆ {α_{j−1} ≤ α}` gives TP-g, and
`{α_{j−1} ≤ α − 1} ⊆ {α_j ≤ α}` gives TP-h, after multiplying by `r(j)·r(j−1) > 0`. The flow is CD-1 at `q_i ∈ {1, 2}`. So as written
the proof is conditional on CD-1 (SR-C4-5).

**An unconditional proof (this read; elementary).** Let `f(t) := C(b, t)·2^t`; it is log-concave without internal zeros on `[0, b]`
(`f(t+1)/f(t) = 2(b − t)/(t + 1)` decreases), and so is `C(a, ·)` on `[0, a]`.

- *Likelihood-ratio lemma (α).* For `α < α'`: `S_α·T_{α'} ≤ S_{α'}·T_α`. After cancelling `C(a, α)·C(a, α')` (if either is 0 both
  sides are 0) this is `f(u)·f(u' − 1) ≤ f(u')·f(u − 1)` with `u = j − α > u' = j − α'`. If the left side is nonzero then
  `u' − 1 < u' ≤ u − 1 < u` all lie in `[0, b]`, and `f(u)/f(u − 1) ≤ f(u')/f(u' − 1)` is the decreasing ratio.
- *Summation.* `Σ_{x ≤ α < y} (S_x T_y − S_y T_x) = S_{≤α}(r(j−1) − T_{≤α}) − (r(j) − S_{≤α})T_{≤α} = r(j−1)·S_{≤α} − r(j)·T_{≤α}`.
  Every term is `≤ 0`, so TP-g holds.
- *TP-h.* Write `β := rank − α` (the ternary count) and `S′_β := N(j − β, j)`, `T′_β := N(j − 1 − β, j − 1)`. For `β < β′` the lemma
  with `C(a, ·)` in place of `f` gives `S′_β T′_{β′} ≤ S′_{β′} T′_β`. Summing `S′_x T′_y − S′_y T′_x ≤ 0` over `x < t ≤ y` gives `r(j−1)·S′_{<t} ≤ r(j)·T′_{<t}`,
  that is `r(j)·T′_{≥t} ≤ r(j−1)·S′_{≥t}`. With `α := j − t`: `S′_{≥t} = S_{≤α}` and `T′_{≥t} = T_{≤α−1} = T_{<α}`. That is TP-h.
- *Degenerate ranks.* For `j ≤ 0` every `S_α` or `T_α` vanishes and both inequalities read `0 ≥ 0`. For `j > a + b`, `r(j) = 0` and
  `S ≡ 0`, and again both read `0 ≥ 0`.

**Hypotheses.** Only `a, b ≥ 0` and integer `j`; `b ≥ 1` and `j ≥ 1` are not needed (they are harmless). No CD-1, no tree, no
eligibility.

**Consequence for E1.** E1's criterion is (i) and (ii) for every `q ∈ [1, m]` at `j = p − q`, which can be `≤ 0`. Since (ii) holds
at every integer `j`, the criterion is exactly (i): `r_q(p − q) ≤ r_q(p − q − 1)` for every `q`. "`max_q ρ_q ≤ 1`" is the same only
with `ρ_q := +∞` when `r_q(p−q−1) = 0 < r_q(p−q)` (the class `q = p`) and classes with `r_q(p − q) = 0` read as vacuous; the cleared
form needs no convention.

**Brute force (`cd2.py`).**
- (A) TP-g and TP-h in E1's registered cleared form: `0 ≤ a ≤ 30`, `0 ≤ b ≤ 30`, every integer `j ∈ [−2, a + b + 2]`, every `α`:
  **1,230,070 checks, 0 failures** (`b = 0` included, also 0).
- (B) The likelihood-ratio lemma in both directions, `a, b ≤ 22`, every `j ≥ 1`: 12,694 `(a, b, j)`, **0 failures**.
- (C) Literal posets `K(1)^a × K(2)^b`, `a + b ≤ 9` (54 posets, up to 19,683 elements): element counts by type equal `N(α, k)`; the
  type-path transport (forced totals `g_α`, `h_α`, spread uniformly over each biregular edge family) is built and verified exactly on
  the literal covers at every level: **330 normalized flows**, every rank-`j` element emits exactly 1, every rank-`(j−1)` element
  absorbs exactly `ρ`, all values `≥ 0`. This is a normalized flow on `K(1)^a × K(2)^b` built without CD-1.
- Sanity: the mutated inequality `r(j−1)·S_{≤α} ≥ r(j)·T_{≤α}` (TP-g reversed) fails 980 of 2,156 times, so the checker discriminates;
  `r(5,2;4) = 85 > 70 = r(5,2;3)` and `r(6,1;3) = 50 > 27 = r(6,1;2)` reproduce `CB(1,7)/10`'s failing classes `q = 6, 7`.
- Corroboration in the sweeps (below): condition (ii) fails at **0** of 364 + 1758 + 2903 eligible `CB(d, m)` rows and at 0 of 172
  eligible small CB-pattern rows.

### SR-C4-6b: E1-R

**The tree.** `CBpat(d_1..d_m)`, `m ≥ 1`, `d_i ≥ 1`, `D = Σ d_i`: path `r – s – v`; chokes `u_i ~ r`; supports `b_{ij} ~ u_i`
(`j ≤ d_i`); private leaves `c_{ij} ~ b_{ij}`. `n = 3 + m + 2D`; degrees `r: m + 1`, `s: 2`, `u_i: d_i + 1 ≥ 2`, `b_{ij}: 2`, so
`leafSet = {v} ∪ C`. `W_{c_{ij}} = N(b_{ij}) ∖ {c_{ij}} = {u_i}`, `W_v = N(s) ∖ {v} = {r}`.

**Step 1 (weights).** `r`-free `B`: `v` is inactive; `c_{ij} ∈ F ∩ B` is active iff `u_i ∈ B`. With `F ⊇ C`, `w_F(B)` is the number of
present private leaves whose choke is present. `r ∈ B`, `v ∉ B` (R0): every choke is excluded, weight 0. Sector (`r, v ∈ B`): excluded
by hypothesis.

**Step 2 (per-`Q` product poset).** Fix an `r`-free source `B`, `Q := B ∩ {u_i}` (`q = |Q| ≥ 1`), `D_Q := Σ_{u_i ∈ Q} d_i`, and an
active mark `x = c_{ij}`, `u_i ∈ Q`. The rest of `B` is free in three kinds of position, with no other adjacency among them:
- the other `D_Q − 1` private leaves of chokes in `Q` (their supports are excluded by the chokes): Boolean;
- the `D − D_Q` legs `{∅, b, c}` of chokes not in `Q`: ternary;
- the arm `{∅, s, v}` (`r ∉ B`): ternary.

So the `r`-free sets with choke set exactly `Q` containing `x` correspond one-to-one with `P_Q := K(1)^{a_Q} × K(2)^{b_Q}`,
`a_Q = D_Q − 1`, `b_Q = D − D_Q + 1`, at rank `|B| − q − 1`. Sources sit at `j := p − q`, targets at `j − 1`. The poset depends on
`(q, D_Q)` through `j` and `(a_Q, b_Q)`; `D_Q` is the heterogeneous ingredient (at `d_i ≡ d` it is `qd`, E1's `(a_q, b_q)`). The
deletions that remove neither `x` nor a choke are exactly the covers of `P_Q`; the target `A = B ∖ {e}` is `r`-free, has
`Q(A) = Q`, and keeps `x` active.

**Step 3 (flow on `P_Q`).** E1's registered type-path transport, applied to `P_Q`: types `(α, β)`; Boolean covers biregular (`α` down,
`a_Q − α + 1` up); ternary covers biregular (`β` down, `2(b_Q − β + 1)` up); every rank-`j` element emits 1, every rank-`(j−1)`
element absorbs `ρ_Q = r_Q(j)/r_Q(j−1)`; forced totals `g_α = ρ_Q T_{<α} − S_{<α}`, `h_α = S_{≤α} − ρ_Q T_{<α}`, nonnegative by CD-2.
A total with an empty edge family is forced to 0 (`g_α ≤ S_α`, `g_α ≤ ρ_Q T_{α−1}`, `h_α ≤ S_α`, `h_α ≤ ρ_Q T_α` follow from the
balance equations and nonnegativity), so the transport is realizable. It is a normalized flow whenever `1 ≤ j ≤ D`; for `j > D` there
is no source clone; `j = 0` (the class `q = p`) has source clones `Q ∪ {x}` and no cover below, and the cleared criterion excludes it
(`r_Q(0) = 1 > 0 = r_Q(−1)`). **CD-1 is not used**: the adjudicator's E1-R takes the flow from CD-1; E1's own registered construction
plus CD-2 supplies it, and CD-2 is now unconditional.

**Step 4 (summing clones; the single `ρ_{Q(A)}`).** `f(B, A) := Σ_x` of the clone flows. Each `r`-free source sends exactly `w_F(B)`
(one unit per active mark). A deletion arc used by a clone never removes a choke, so every source reaching `A` has `Q(B) = Q(A)`;
`A`'s target clones are exactly its `w_F(A)` active marks, each receiving `ρ_{Q(A)}`. This is the written step C-T2-U's A4 asked for.
Targets containing `r`, or containing no choke, receive 0. **Well-definedness** (a repair): an `r`-free `A` of size `p` with choke set
`Q` has `p − q ≤ D + 1` non-choke vertices; for `p ≥ 1` the criterion forces `p ≥ m + 1 ≥ q + 1`, so `0 ≤ p − q − 1 ≤ D` and
`r_Q(p − q − 1) ≥ 1`. For `p = 0` the criterion holds vacuously and every weight is 0.

**Step 5 (Hall).** For `X ⊆ I_{p+1} ∖ sec`: `Σ_X w_F = Σ_{B∈X} Σ_A f(B, A) ≤ Σ_{A ∈ N_D(X)} Σ_{B′} f(B′, A) ≤ Σ_{N_D(X)} w_F ≤
Σ_{N(X)} w_F`, using `ρ ≤ 1`, `N_D ⊆ N`, `w_F ≥ 0`.

**Where each hypothesis enters.** The literal CB-pattern adjacency: Steps 1–2 (`W` sets, product structure). `F ⊇ C`: only to read
`w_F` as the mark count (the argument goes through clone by clone for any leaf set `F`; my instrument did not test that, and I
do not propose widening). The criterion: Steps 3–4.
Finiteness: everywhere. Eligibility, invariance, the selector: nowhere; applying the key at a (HALL) row needs `F_p(T) ⊇ C` derived
there. The arm tag `v` is never a mark.

**ℕ-subtraction guards.** `a_Q = D_Q − 1 ≥ 0` since `1 ≤ q ≤ D_Q`; `b_Q = D − D_Q + 1 ≥ 1`; `j = p − q` and `j − 1` must be integers
with `r_Q(k) = 0` for `k < 0` (a truncated `j − 1` at `q = p` would read `r_Q(0) ≤ r_Q(0)` and falsely pass). `q ≤ m` holds for any
choke set.

**It extends E1 and is not an alias.** At `d_i ≡ d`: `D_Q = qd`, `(a_Q, b_Q) = (qd − 1, d(m − q) + 1)`, the pairs `(q, D_Q)` are
indexed by `q`, the hypothesis equals E1's criterion by CD-2, and the flow, load and conclusion are E1's. On a heterogeneous tree the
uniform reading is false (mutation below).

**T2 §7 is the same statement, with no proof on its face.** T2 states `(a_Q, b_Q) = (D_Q − 1, D_tot − D_Q + 1)` at rank `p − q`, the
criterion (i)+(ii) at every achievable `(q, D_Q)`, and the conclusion (HALL-COND) for every `X ⊆ I_{p+1} ∖ sec`: by CD-2 the same
hypothesis as E1-R, and E1-R's conclusion without its explicit load clause. Its justification is one sentence ("nothing in SR-C3-3 Steps
1–3 uses `d` being constant … Steps 3–5, unchanged"), with no written flow step and no treatment of the per-target factor. It is STATED,
as C-T2-U (A4) and the T adjudicator (R5) ruled; T2's self-grade `proved_informal` does not stand on its face.

**Own instrument (`e1r.py`, literal).** Per tree: tree test (edge count, BFS connectivity); enumeration of all independent sets
(bitmasks); `α`; `x` through rank `α` with the terminal difference; eligibility; `F_p` from literal `Δ_p(T − v) < 0`; literal `w_F`
(`(B ∖ {v}) ∩ W_v ≠ ∅`); **WID asserted on every row** (`supply − capacity = Σ_F [q_v(p) − q_v(p−1)]`, `q_v` counted by vertex
avoidance, a different code path from the weight); the weight model of Step 1 asserted member by member; my criterion over every
nonempty `Q` (cleared (i), and (ii) literally); when (i) holds, the E1-R flow built clone by clone and checked arc by arc (every arc
a literal (D) arc, every non-sector source sends exactly `w_F(B)`, every `r`-free target with a choke receives exactly
`ρ_{Q(A)}·w_F(A)`, every other target 0); and an integer Dinic max-flow on the deletion-only network restricted to non-sector
sources. Tag sets: `F = leafSet`, `F = C`, and `F = F_p` when `F_p ⊇ C`.

| Check (`out_summary.json`) | Count |
|---|---|
| Trees (orders 11–27; 28 heterogeneous, 4 uniform controls) | 32 (up to 986,223 independent sets) |
| Rows / `(tree, rank)` instances; WID asserted | 634 / 251; **634** |
| Criterion (i) holds: rows / instances / heterogeneous instances | 243 / 81 / 71 |
| **E1-R flow built and verified exactly, arc by arc** | **243 / 243** (4,540,317 arcs) |
| **Criterion holds but literal non-sector deletion flow fails (`CRITERION-UNSOUND`)** | **0** |
| Criterion fails but literal non-sector deletion flow saturates | 23 instances |
| Condition (ii) failures | 0 |

Eligible rows reached: `CBpat(1,1,1,7)/10`, `CBpat(1,1,2,6)/10`, `CBpat(1,2,3,4)/10`, `CBpat(2,2,3,3)/10` (all `n = 27`, `α = 15`,
`x = 8`, `F_p` = all 11 leaves, derived; criterion holds; flow verified; e.g. `CBpat(1,2,3,4)/10`: supply 94688, capacity 171523,
`S = −76835`, max `ρ = 8/9` at `(q, D_Q) = (4, 10)`); and `CBpat(1,1,1,1,2)/8`, `CBpat(1,2,2,2)/8`, `CBpat(1,1,1,1,1,2)/9`,
`CB(1,7)/10` (criterion fails; the literal non-sector deletion flow saturates anyway; `CB(1,7)/10`: 29190 / 58002 / −28812,
`ρ_7 = 50/27`, agreeing with SR-C3-3). These validate a rank-level lemma with no eligibility hypothesis; they are not evidence about
(HALL) or the aggregate.

**Mutation (`mutation_e1r.py`).** Building the flow with the uniform reading `a_Q = q·max_i d_i − 1` fails the exact-load check on every
heterogeneous tree tried (`(2,3)/6`, `(1,2,3)/7`, `(3,4)/7`, `(1,1,2)/6`, all three tag sets). So the `D_Q` indexing is load-bearing and
the verifier discriminates.

**Closed forms (`crit_rows.py selftest`).** `I(T) = (1+2y)·Π_i A_{d_i} + y(1+y)(1+2y)^D`, `A_d = (1+2y)^d + y(1+y)^d`, and the forms
for `T − v`, `T − c`, `H_v`, `R_v`, `H_c`, `R_c` and the direct active counts, all equal brute-force enumeration on 9 patterns.

### SR-C4-6c: the criterion at `G(8^82, 7^2)` and the failure tallies

**`G(8^82, 7^2)` (`crit_rows.py G`).** 82 chokes of degree 8, 2 of degree 7: `D = 670`, `n = 1427`, `α = 755`, `x = 446` (through
`α`), window `[448, 503]`, **56 ranks**. At every rank: `F_p` derived from `Δ_p(T − v)` for `v` and for each private-leaf class: **all
671 leaves** favorable; supply (direct active-count polynomials) − capacity = `S` (from `H − R` polynomials) asserted, `S < 0`. The
criterion over all **248** achievable pairs `(q, D_Q)` (`q = i + t`, `D_Q = 8i + 7t`, `0 ≤ i ≤ 82`, `0 ≤ t ≤ 2`, `q ≥ 1`) **holds at all
56 ranks**. The maximum `ρ` at 448 is `5327002801984/5350924042653 = 0.995530…`, attained at `(q, D_Q) = (1, 7)`: a single degree-7 choke.
Also at `(1, 7)`: 0.988866 (449), 0.917482 (460), 0.796108 (480), 0.684484 (500), 0.668509 (503). Condition (ii) holds literally at 448
for all 248 pairs. All of these equal C-T2-U's and C-T2-F's figures.

**Failure tallies (`crit_rows.py sweep`; `α`, `x` from the closed form; `F_p` derived and WID asserted on every row).**

| Range (`d ≤ 8`) | Eligible rows | Failing | By `d = 1..5` | `(ii)` failures |
|---|---|---|---|---|
| `m ≤ 15` | 364 | **90** | 18, 32, 27, 11, 2 | 0 |
| `m ≤ 30` | 1758 | 520 | 108, 166, 136, 81, 29 | 0 |
| `16 ≤ m ≤ 40` | 2903 | 918 | 192, 281, 231, 151, 63 | 0 |

Every failure is a condition-(i) failure with `d ≤ 5`; none with `d ≥ 6`. The first failure by order is `CB(1,7)/10` (`n` 24, `α` 15,
`x` 8; failing `q = 6, 7`). Pairs `(d, m)` failing at every eligible rank: 20 with `m ≤ 15`, 70 with `m ≤ 40`. Every tally equals the
record (C-T2-F, C-T2-U, T adjudicator), and my `m ≤ 30` split by `d` equals C-T2-U's two sub-ranges summed.

### SR-C4-6d: the key

- **Predicate.** Read without hypotheses, `…-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` says: on a
  heterogeneous CB pattern, the mark-clone criterion implies weighted Hall for non-sector families by deletion arcs. The statement says
  exactly that (for `F ⊇ C`, and the name is not false for other `F` either). It does not assert the criterion anywhere, nor (HALL),
  nor anything on the sector. **True as named** (ruling 33). T2's `…-HETEROGENEOUS-CB-MARK-CLONE-CRITERION` names an object; it becomes
  an alias.
- **Alias check (`alias_check.py`)** of the three names in play and of the full registration text below, against the run-local
  snapshot (448 claims) and the master authority (434): none of the names is registered; **0 `alias_patterns` hits** and 0 alias
  matches on the final text. An earlier draft drew three lexical false positives, which I rephrased away: `E993-STRICT-UNITS`
  (`D_?[pq]\s*[<>]` on "`D_Q >= q`"), `E993-R19-R2-HALL-UNIVERSAL` (`R2.*Hall.*universal` spanning an `R23-…-HALL` key name and a
  later "universal"), and (NM)'s `sector.*normalized.matching` (a citation of the CD-1 key name, which is not registered yet). The
  keyword scan finds "clone", "mark-clone" and "type-path" only in E1, the five-row key and (HALL)'s scope notes, and "heterogeneous
  CB" only in `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM` (a sector-deficit
  statement, a different object); none is an alias.
- **Against E1:** a strict extension, not an alias (distinction row below).
- **Against the three refuted keys** (`E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`, `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`,
  `E993-R23-LITERAL-DELETE-ONLY-HALL`; texts read in the snapshot, all REFUTED): the four SR-C3-3 distinctions (object, relation, scope,
  excluded tags) carry over unchanged. The other nine refuted keys of SOLUTION-CONTRACT §3.2 are REFUTED in both registries. E1-R, like
  E1, uses no Delete/Retag relation, no tag-closed or singleton cut, and no occupancy, addability, covariance or signed cross-tag map;
  it never routes a positive-term tag.
- **Grade and conditionality.** `proved_informal`. The synthesis makes the registration wait on SR-C4-5 because "its weakest input is
  CD-1". Its inputs are E1's registered construction (`proved_informal`) and CD-2, and CD-2 now has an unconditional proof. **My
  verdict is on the argument; SR-C4-5's outcome is not known to me and is not needed.**

## Findings and repairs

1. **Repair A (6a: CD-2 no longer depends on CD-1).** C-T2-U's coupling proof is correct but uses the normalized flow of CD-1. The
   likelihood-ratio proof above is two lines per inequality, self-contained, and checked exactly (1,230,070 checks; 330 literal
   normalized flows). CD-2 therefore registers at `proved_informal` without waiting on SR-C4-5. C-T2-U's proof is kept as a second
   route. **Controller option:** if the rule requires a proof route first given in a second read to have its own read, register CD-2
   and E1-R conditional on SR-C4-5 as the synthesis proposes; the argument stands either way.
2. **Repair B (6a: wording).** "`for every a ≥ 0, b ≥ 1, j ≥ 1`" is true but too narrow for the equivalence claim: E1's `j = p − q` can
   be `≤ 0`. The inequalities hold for every integer `j` (trivially for `j ≤ 0`), and the criterion is then exactly condition (i) in the
   cleared form. "`max_q ρ_q ≤ 1`" needs the convention for `r_q(p − q − 1) = 0`; the scope note states the cleared form.
3. **Repair C (6b: the criterion's quantifier).** "Every achievable `(q, D_Q)`" or "every achievable choke set `Q`" is replaced by
   "every nonempty set `Q` of chokes" in cleared form. They agree: a non-achievable class has `r_Q(p − q) = 0` and is vacuous, and the
   `j = 0` class (`q = p ≤ m`) is achievable and fails, which is why for `p ≥ 1` the criterion forces `p ≥ m + 1`.
4. **Repair D (6b: the load factor is well defined).** The statement now says why `ρ_{Q(A)}` has a nonzero denominator at every `r`-free
   target with a choke. The same point applies silently to E1's text.
5. **Repair E (6b/6d: E1-R is not conditional on CD-1).** E1-R = E1's registered type-path construction applied to `P_Q` + CD-2. The
   adjudicator's route through CD-1 is an alternative. The registration text names both and cites CD-1 only by its synthesis label,
   because its key is not registered yet.
6. **Finding (6b).** The heterogeneous content is real and load-bearing: `P_Q` depends on `D_Q`; a uniform-`d` flow fails on every
   heterogeneous tree tried. The per-target single factor `ρ_{Q(A)}` holds because deletion arcs keep the choke set; 243 explicit flows
   verify it exactly, 213 of those rows heterogeneous.
7. **Finding (6b: T2 §7).** Same statement as E1-R's Hall part (given CD-2); no written proof on its face; STATED. Confirmed.
8. **Finding (6c).** Every figure is reproduced exactly, including the exact binding fraction `5327002801984/5350924042653` at
   `G/448`. The 56-rank record adds, on my instrument, `F_p` = all 671 leaves and `S < 0` at every rank, with WID asserted. The record
   gives non-sector Hall at the 56 ranks with the key; the sector is outside it, so it is not (HALL) at `G`.
9. **Precision on E1's registered SCOPE.** "It forces `p ≥ m + 1`" holds for `p ≥ 1`. At `p = 0` the criterion holds vacuously (every
   `j = −q < 0`) and the conclusion is trivial. The scope note records this; the statement is unchanged.
10. **Attribution.** The synthesis's line "(T adjudicator (E1-R); T2 (statement); `C-T2-U` (CD-2); the Cycle 3 E1 origin)" is right
    but incomplete for the face: C-T2-F's A6 (independent indexing check), C-T2-U's A4 (the missing per-target step), the Codex
    network attribution and this read's contributions are added.
11. **Fences.** Non-sector families only; a sufficient criterion; a failure of the criterion is not a cut; not (HALL); the primary
    aggregate is untouched; no census value enters the proof; no RTree wording; no closed region re-proved. All on the face.

## Registration text

Register the `KEY:` block, then the scope note on E1, the four distinction rows (into `control/CLAIM-DISTINCTIONS.json`), and the two
record rows (under `R30-CB-RECORD`). Each block is verbatim.

```text
KEY: E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let m >= 1, d_1, ..., d_m >= 1 and D := d_1 + ... + d_m, and let T = CBpat(d_1, ..., d_m) be the heterogeneous CB pattern: the path r - s - v, chokes u_1..u_m adjacent to r, d_i supports b_{i1..id_i} adjacent to u_i, and one private leaf c_{ij} adjacent to each b_{ij} (n = 3 + m + 2D; leafSet(T) = {v} ∪ C with C the D private leaves; CB(d, m) is the case d_1 = ... = d_m = d). Let F be a set of leaves of T with C ⊆ F, let p be a natural number, let w_F be the active-tag weight (SEMANTIC-CONTRACT §1.2), and let sec := {B ∈ I_{p+1}(T) : r ∈ B and v ∈ B}. For a nonempty set Q of chokes put q := |Q|, D_Q := Σ_{u_i ∈ Q} d_i, a_Q := D_Q − 1 and b_Q := D − D_Q + 1, and for every integer k put r_Q(k) := [y^k](1 + y)^{a_Q}(1 + 2y)^{b_Q}, so r_Q(k) = 0 for k < 0 (r_Q depends on Q only through (q, D_Q)). The CRITERION at (d_1, ..., d_m; p) is: r_Q(p − q) <= r_Q(p − q − 1) for every nonempty set Q of chokes, with p − q computed in the integers. If the criterion holds, then there is a nonnegative rational function f on the deletion arcs (D) from I_{p+1}(T) ∖ sec to I_p(T) such that Σ_A f(B, A) = w_F(B) for every B ∈ I_{p+1}(T) ∖ sec; Σ_B f(B, A) = ρ_{Q(A)}·w_F(A) <= w_F(A) for every target A with r ∉ A and Q(A) := A ∩ {u_1..u_m} nonempty, where ρ_Q := r_Q(p − q)/r_Q(p − q − 1) (well defined: such an A has p − q <= D + 1 non-choke vertices, and for p >= 1 the criterion forces p >= m + 1 >= q + 1, so 0 <= p − q − 1 <= D and r_Q(p − q − 1) >= 1); and Σ_B f(B, A) = 0 for every other target. Consequently, for every X ⊆ I_{p+1}(T) ∖ sec: Σ_{B ∈ X} w_F(B) <= Σ_{A ∈ N_D(X)} w_F(A) <= Σ_{A ∈ N(X)} w_F(A), where N_D is the deletion neighbourhood and N the (D) ∪ (S) neighbourhood; that is, (HALL-COND) holds for every non-sector family, witnessed by deletion arcs alone. Proof of record: (1) for r ∉ B, W_{c_{ij}} = {u_i} and W_v = {r}, so w_F(B) is the number of present private leaves whose choke is in B (v is inactive); if r ∈ B and v ∉ B every choke is absent and w_F(B) = 0. (2) Split an r-free source B with choke set Q ≠ ∅ into one clone (B, x) per active tag x = c_{ij} (u_i ∈ Q). For fixed Q and x, the r-free sets with choke set exactly Q that contain x correspond one-to-one with P_Q := K(1)^{a_Q} × K(2)^{b_Q} (Boolean coordinates: the other D_Q − 1 private leaves of chokes in Q, whose supports are excluded; ternary coordinates {∅, b_{ij}, c_{ij}}: the D − D_Q legs of chokes not in Q; the ternary coordinate {∅, s, v}: the arm), at rank |B| − q − 1; the covers of P_Q are exactly the deletions that remove neither x nor a choke, and such a deletion keeps r ∉ A, Q(A) = Q and x active, so the target clones (A, x) of A are exactly its w_F(A) active tags. (3) On P_Q, from rank j := p − q to rank j − 1, element types (α, β) (α present Boolean and β nonempty ternary coordinates) have N_Q(α, k) := C(a_Q, α)·C(b_Q, k − α)·2^{k − α} elements; the Boolean covers between types are biregular (α down, a_Q − α + 1 up) and so are the ternary covers (β down, 2(b_Q − β + 1) up), so the type-symmetric transport in which every rank-j element emits 1 and every rank-(j − 1) element absorbs ρ_Q has forced type totals g_α = ρ_Q·Σ_{α' < α} T_{α'} − Σ_{α' < α} S_{α'} (Boolean) and h_α = Σ_{α' <= α} S_{α'} − ρ_Q·Σ_{α' < α} T_{α'} (ternary), S_α := N_Q(α, j), T_α := N_Q(α, j − 1); they are nonnegative because the type-path inequalities hold identically (CD-2, scope note [r30 C4; SR-C4-6] on E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL). This is E1's registered type-path construction applied to P_Q; for 1 <= j <= D it is a normalized flow, for j > D there is no source clone, and j = 0 is excluded by the criterion. (4) Let f(B, A) be the sum of the clone flows from the clones of B to the clones of A. Every r-free source sends w_F(B); R0 sources and r-free sources with no choke have weight 0 and send nothing; a deletion arc never removes a choke, so every source that reaches A has Q(B) = Q(A), and each of A's w_F(A) target clones receives exactly ρ_{Q(A)}; targets containing r, or containing no choke, receive 0. (5) Summing the saturating flow over X gives the Hall inequality, since N_D ⊆ N and w_F >= 0.
SCOPE: One heterogeneous CB pattern at a time (every m >= 1 and d_1..d_m >= 1, including every CB(d, m)), one rank p at a time, and only the non-sector source families X ⊆ I_{p+1} ∖ sec; F any leaf set containing all private leaves (whether v ∈ F is irrelevant, since v is inactive in every r-free set). The criterion is a hypothesis checked per (d_1..d_m; p) in exact integers; it is sufficient, not necessary (it fails at the eligible CBpat(1,1,1,1,2)/8 and CB(1,7)/10, where literal deletion-only flow nevertheless saturates the non-sector sources), and for p >= 1 it forces p >= m + 1 (if 1 <= p <= m, a set Q with q = p has r_Q(0) = 1 > 0 = r_Q(−1)). At d_1 = ... = d_m = d the statement is exactly E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL (E1), whose criterion reduces to its condition (i) by CD-2; the new content is the indexing by (q, D_Q) and the single per-target factor ρ_{Q(A)}. ℕ guards: a_Q = D_Q − 1 >= 0 because 1 <= q <= D_Q; b_Q = D − D_Q + 1 >= 1; p − q and p − q − 1 are integer ranks (a truncated ℕ subtraction at q = p would falsely pass). No eligibility, invariance or selector hypothesis enters; to apply the statement at a (HALL) row one must separately derive F_p(T) ⊇ C at that row. Inputs at their grades: E1's registered proof (proved_informal) and CD-2 (proved_informal, by the likelihood-ratio proof in the E1 scope note). The statement does not depend on CD-1 (synthesis EST-7; pending SR-C4-5): the normalized flow on K(1)^a × K(2)^b is built directly by the type-path transport; CD-1 supplies an alternative construction (the T adjudicator's). Literal validation (bounded_computation, not proof): SR-C4-6 built the flow explicitly and verified it arc by arc with exact loads on 243 rows (81 (tree, rank) instances, 71 of them heterogeneous) of 32 CB-pattern trees of orders 11 to 27, among them the eligible heterogeneous rows CBpat(1,1,1,7)/10, CBpat(1,1,2,6)/10, CBpat(1,2,3,4)/10 and CBpat(2,2,3,3)/10 (F_p(T) = all leaves, derived); 0 rows where the criterion holds and the literal non-sector deletion flow fails.
ATTRIBUTION: T adjudicator (Claude Opus 5.5; E1-R, the written proof, with the single factor ρ_{Q(A)} per target because deletion arcs keep the choke set; literal exact-load validation on 16 laboratories, 9 of them heterogeneous); T2 (Claude Sonnet 5; the heterogeneous statement, (a_Q, b_Q) = (D_Q − 1, D − D_Q + 1) at rank p − q, route return §7, stated without a written flow step); C-T2-U (Claude Opus 5.5; CD-2, and finding A4 that the per-target single ρ_Q needed a written step); C-T2-F (Claude Opus 5.5; finding A6, an independent re-derivation of the heterogeneous indexing); the Cycle 3 E1 origin (C-T1-F, C-T1-U for the reduction part, the Cycle 3 T adjudicator, T1 and SR-C3-3; see E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL); the transport network (HALL), the active-tag weight w_F and the CB family: Codex (GPT-6 Astra/Sol/Luna), the lower-region run and its corrections; isolated second read SR-C4-6 (Claude Opus 5.5; the cleared every-Q criterion, the well-definedness of the load factor, the removal of the CD-1 dependency, literal validation).
FENCES: Not (HALL) and not a restricted-scope (HALL) theorem: sector families (r, v ∈ B) are outside the statement, and E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. A criterion at a rank, not a family theorem: it does not assert that the criterion holds at any (d_1..d_m; p); rows at which the criterion has been checked, such as the 56 eligible ranks of G(8^82, 7^2), are records, not part of this key. The criterion fails at some eligible rows, and a failure of the criterion is not a deficient cut and says nothing about (HALL) at that row. Not an alias of E1 (distinction row R30-C4-E1R-VS-E1). No refuted mechanism is revived (distinction rows R30-C4-E1R-VS-PER-LEAF-DOWN-MAP-INJECTIVITY, R30-C4-E1R-VS-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT and R30-C4-E1R-VS-R23-LITERAL-DELETE-ONLY-HALL). The primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched. No RTree or governed-model assertion. No census value enters. The deletion-only conclusion is scoped to non-sector families at criterion ranks and asserts nothing outside that scope.
ALIASES: E1-R (r30 Cycle 4 heterogeneous mark-clone reduction); T2 §7 heterogeneous E1 extension; E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION (T2's proposed object-name, not a predicate, renamed per ruling 33)
```

```text
SCOPE NOTE ON: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: [r30 C4; SR-C4-6] (a) CD-2, proved_informal. Condition (ii) of this key's criterion, the type-path inequalities, holds identically: for all integers a >= 0, b >= 0 and j and every α ∈ [0, a], with N(α, k) := C(a, α)·C(b, k − α)·2^{k − α} (0 outside 0 <= α <= a, 0 <= k − α <= b), r(k) := Σ_α N(α, k), S_α := N(α, j) and T_α := N(α, j − 1): r(j)·Σ_{α' <= α} T_{α'} >= r(j − 1)·Σ_{α' <= α} S_{α'} and r(j − 1)·Σ_{α' <= α} S_{α'} >= r(j)·Σ_{α' < α} T_{α'}. Hence the criterion at (d, m, p) is exactly its condition (i), r_q(p − q) <= r_q(p − q − 1) for every q ∈ [1, m] in the cleared integer form; equivalently max_q ρ_q <= 1 with ρ_q read as +∞ when r_q(p − q − 1) = 0 < r_q(p − q) and a class with r_q(p − q) = 0 read as vacuous. Proof (SR-C4-6; elementary, no import): for α < α', S_α·T_{α'} <= S_{α'}·T_α, because after cancelling C(a, α)·C(a, α') this reads f(u)·f(u' − 1) <= f(u')·f(u − 1) with u = j − α > u' = j − α' and f(t) = C(b, t)·2^t, which is log-concave without internal zeros; summing S_x·T_y − S_y·T_x <= 0 over x <= α < y gives r(j − 1)·Σ_{α' <= α} S_{α'} − r(j)·Σ_{α' <= α} T_{α'} <= 0, which is the first inequality; the same argument in the ternary count β = rank − α, with C(a, ·) in place of f, gives the second; for j <= 0 every term vanishes. A second proof (C-T2-U, checked by the T adjudicator) couples the uniform distributions on ranks j and j − 1 of K(1)^a × K(2)^b through a normalized flow, along which α drops by 0 or 1; it is conditional on CD-1 (synthesis EST-7; pending SR-C4-5). Attribution: C-T2-U (Claude Opus 5.5; the statement and the coupling proof); T adjudicator (Claude Opus 5.5; line-by-line check, 0 failures in 4,111 literal checks); SR-C4-6 (Claude Opus 5.5; the likelihood-ratio proof; 0 failures in 1,230,070 exact inequality checks, a <= 30, b <= 30, every integer j in [−2, a + b + 2]; the type-path normalized flow built and verified exactly on the literal posets K(1)^a × K(2)^b with a + b <= 9). (b) Mechanism: given (a), this key's flow is, clone by clone, a normalized flow on P_q = K(1)^{qd − 1} × K(2)^{d(m − q) + 1} built by the type-path transport. Its heterogeneous extension is E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL (E1-R), of which this key is the case d_1 = ... = d_m = d. (c) Bounded record (bounded_computation): on the eligible rows of CB(d, m) with d <= 8 the criterion fails at 90 of 364 rows (m <= 15), 520 of 1758 (m <= 30) and 918 of 2903 (16 <= m <= 40), always through condition (i) and always with d <= 5; the first failure by order is CB(1,7)/10 (q = 6: 85 > 70; q = 7: 50 > 27). A failure of the criterion is not a cut: at CB(1,7)/10 the literal non-sector deletion flow saturates (SR-C3-3). (d) Precision: the SCOPE sentence "it forces p >= m + 1" holds for p >= 1; at p = 0 the criterion holds vacuously and the conclusion is trivial (every source has weight 0). The statement, grade and fences of this key are unchanged.
```

```text
DISTINCTION ROW: R30-C4-E1R-VS-E1
KEY: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: Not an alias; a strict extension. E1 is stated for the uniform family CB(d, m), with its criterion (conditions (i) and (ii)) indexed by q = |Q|. E1-R (E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL) is stated for every heterogeneous CB pattern CBpat(d_1..d_m), with its criterion indexed by (q, D_Q) and reduced to condition (i) by CD-2. At d_1 = ... = d_m = d the two statements coincide (the same hypothesis by CD-2, the same flow, the same load and Hall conclusion), so E1 is the uniform case of E1-R and keeps its own key, grade and certificate. The new content is that the product poset P_Q = K(1)^{D_Q − 1} × K(2)^{D − D_Q + 1} depends on the degree sum D_Q and not on q alone, and that the load on a target is the single value ρ_{Q(A)}·w_F(A) because a deletion arc never changes the choke set. The uniform reading is false on a heterogeneous tree: a flow built with a_Q = q·max_i d_i − 1 fails the exact-load check on every heterogeneous tree SR-C4-6 tested. Neither key is (HALL), and both exclude the root-plus-arm sector.
```

```text
DISTINCTION ROW: R30-C4-E1R-VS-PER-LEAF-DOWN-MAP-INJECTIVITY
KEY: E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY
TEXT: The refuted key asserts, for every eligible ordinary tree and every favorable leaf v, that the linear map d_p (marked independent p-sets of H_v to marked (p−1)-sets, each basis set sent to the sum of its one-vertex deletions still meeting W_v) is injective; it is refuted on an order-91 tree. E1-R (E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL) differs in four ways. Object: a weighted fractional flow with target loads ρ_{Q(A)}·w_F(A) <= w_F(A) and a Hall conclusion; it asserts nothing about the rank of any linear map. Relation: only deletions that preserve the mark and every choke, a strict sub-relation of the support of d_p. Scope: one heterogeneous CB pattern at one rank, conditional on an exact criterion; no universal claim over trees, ranks or leaves. Tags: the flow is tag-preserving clone by clone but is applied only to private tags (the arm tag v is never a mark and sector families are excluded), so a leaf with a positive term is outside its scope by hypothesis rather than overcome. The refuted statement is not revived.
```

```text
DISTINCTION ROW: R30-C4-E1R-VS-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT
KEY: E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT
TEXT: The refuted key asserts, on every governed base-rank row, an exact support-label-preserving unit-token injection from positive to negative favorable-leaf tokens of the aggregate encoding; it is refuted by a singleton favorable support block with a positive term (T_22, order 91). E1-R (E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL) moves no aggregate tokens and matches no positive to negative terms. It is a fractional flow between the independent-set layers I_{p+1} and I_p of one ordinary heterogeneous CB pattern along literal deletion arcs, with capacities w_F(A) (not unit), and it is not an injection. It makes no governed-model (RTree) assertion. It holds at one rank, conditional on an exact criterion, and only for non-sector families; the arm tag v and the sector, the analogue of the obstruction that refuted this key, are excluded by hypothesis. The refuted statement is not revived.
```

```text
DISTINCTION ROW: R30-C4-E1R-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key asserts, for every finite ordinary tree and every p >= x(T) + 2 under the r23 literal contract, unweighted deletion-only Hall |X| <= |Gamma_Delete(X)| for every X in the complete tagged top side; it is refuted at CB(8,92) by the full arm-tag top cut. E1-R (E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL) differs in scope and weight. Weight: the active-tag weight w_F with capacities w_F(A), under the (D) arcs of the r30 network. Scope: one heterogeneous CB pattern at one rank, conditional on an exact criterion, and only source families avoiding the root-plus-arm sector, which is where the arm tag's deletion deficit and the r23 witness live. The deletion-only conclusion does not extend beyond that scope: at the first eligible ranks of CB(8,86), CB(8,89) and CB(8,92) the sector is deletion-deficient, and E1-R says nothing there. The refuted statement is not revived.
```

```text
RECORD: R30-CB-RECORD-C4-G-8-82-7-2-E1R-CRITERION-ALL-56-ELIGIBLE-RANKS
CLAIM: G(8^82, 7^2), the CB pattern with 82 chokes of degree 8 and 2 of degree 7 (D = 670, n = 1427, α = 755, x = 446; eligible window [448, 503], 56 ranks; F_p(T) = all 671 leaves at every rank, derived; supply − capacity = S asserted at every rank from two polynomial paths, S < 0). The criterion of E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL holds at all 56 ranks over all 248 achievable pairs (q, D_Q). The maximum ρ is 5327002801984/5350924042653 ≈ 0.995530 at p = 448, attained at (q, D_Q) = (1, 7), a single degree-7 choke; it is 0.988866, 0.917482, 0.796108, 0.684484 and 0.668509 at p = 449, 460, 480, 500 and 503, each at (1, 7). Condition (ii) holds literally at p = 448 for all 248 pairs. With the key, (HALL-COND) holds with deletion arcs alone for every non-sector source family at each of the 56 ranks. The sector is outside the key, so this record does not establish (HALL) at this tree.
STATUS: computer_assisted
PROVENANCE: T2 (six ranks; its "worst ratio" column struck as the minimum ρ); C-T2-F and C-T2-U (all 56 ranks, the maximum ρ corrected to 0.995530); T adjudicator (reproduced); SR-C4-6 (crit_rows.py mode G: closed-form polynomial validated against enumeration; α, x, the window and F_p derived; WID asserted; exact criterion arithmetic).
```

```text
RECORD: R30-CB-RECORD-C4-E1-CRITERION-FAILURE-TALLIES-D-LE-8
CLAIM: Over the eligible rows of CB(d, m) with d <= 8, the E1 criterion fails at 90 of 364 rows (m <= 15), 520 of 1758 (m <= 30) and 918 of 2903 (16 <= m <= 40). Every failure is a condition-(i) failure (condition (ii) fails at no row, as CD-2 proves) with d <= 5; by d, the failures number 18, 32, 27, 11, 2 (m <= 15), 108, 166, 136, 81, 29 (m <= 30) and 192, 281, 231, 151, 63 (16 <= m <= 40) for d = 1..5. The first failure by order is CB(1,7)/10 (n 24, α 15, x 8; q = 6 and q = 7). Twenty pairs (d, m) with m <= 15 fail at every eligible rank, and 70 with m <= 40. A failure of the criterion is not a deficient cut and says nothing about (HALL) at that row.
STATUS: bounded_computation
PROVENANCE: C-T2-F (m <= 15 and 16 <= m <= 40), C-T2-U (m <= 30), T adjudicator (every tally reproduced); SR-C4-6 (crit_rows.py sweep: every tally recomputed exactly, with α and x from the closed-form polynomial, F_p derived and supply − capacity = S asserted on every row).
```

## Verdicts

verdict[SR-C4-6a]: confirmed_with_repairs
verdict[SR-C4-6b]: confirmed_with_repairs
verdict[SR-C4-6c]: confirmed
verdict[SR-C4-6d]: confirmed_with_repairs

- **SR-C4-6a.** CD-2 is true at `proved_informal`. C-T2-U's proof is correct conditional on CD-1. This read supplies an unconditional
  likelihood-ratio proof, so the dependency is removed. Repairs: every integer `j`, the cleared form of the equivalence, and the
  second route recorded (scope note on E1, part (a)).
- **SR-C4-6b.** E1-R is correct at `proved_informal`, re-derived from the mark-clone reduction with the per-`Q` product poset `P_Q`. The
  load is exactly `ρ_{Q(A)}·w_F(A)` on `r`-free targets with a choke and 0 elsewhere: 243 explicit flows, 0 unsound. It extends E1 and is
  not an alias. T2 §7 is the same statement and had no proof on its face (STATED). Repairs: the every-`Q` cleared criterion, the load
  factor shown well defined, and CD-1 dropped as a dependency.
- **SR-C4-6c.** Confirmed as stated. The criterion holds at all 56 ranks; max `ρ` 0.995530 at 448 at `(1, 7)`. The tallies are
  90/364 (and 520/1758, 918/2903), all `d ≤ 5`, first `CB(1,7)/10`. All recomputed in full, not sampled.
- **SR-C4-6d.** The name is a true predicate, with no alias. Grade `proved_informal`, not conditional on CD-1. Repairs: the
  registration text above, the conditionality removed, and the attribution completed. Register the key block, the E1 scope note, the
  four distinction rows and the two records.

## Artifact inventory

All scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-sr-SR-C4-6/`.
Standard library, `python3 -B`, exact integers and `Fraction`, foreground only; no `__pycache__`; nothing is running.

| File | SHA-256 | Purpose |
|---|---|---|
| `alias_check.py` | `efdd17019d4c9a515b4285734e7b858fd93874cb2182a86adaf914ca336b673d` | alias/pattern check vs the run-local snapshot and the master authority |
| `assemble.py` | `fc5f5de828f7f3e4fbe24d47f05bef0def7fb8daa3492e3ddcd90f6ceb056cc5` | assembles this file from the template, the registration blocks and these digests |
| `cd2.py` | `5b4f91bb990e8cd38b82506a72356008b0eca214a06d2e1064345707ec0b56f0` | CD-2: TP-g/TP-h exact checks, likelihood-ratio lemma, literal type-path normalized flows on K(1)^a x K(2)^b |
| `crit_rows.py` | `366945a8ca2a16ce872d0dec5e090824336a2420c4aed4eec5ea8491eeb00834` | closed forms (selftest), G(8^82,7^2) rows, CB(d,m) criterion sweeps with F_p and WID |
| `e1r.py` | `a77036f741f89ffa9f5a9784101d0520c5e96aa5ef6883470a85106314a3dae1` | E1-R literal instrument: trees, enumeration, alpha, x, F_p, w_F, WID, criterion, explicit flow check, Dinic |
| `err_cd2.txt` | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` | progress lines (stderr) |
| `err_e1r_a.txt` | `7b04b264f8943d5ad4aa50df05f06892489c210b2449f562791408a2222ac204` | progress lines (stderr) |
| `err_e1r_b.txt` | `44d43984bfa8415f1244635b16f0fed4dcf18fab679fb20ef06af5ffcfe46a6f` | progress lines (stderr) |
| `err_e1r_c1.txt` | `76ebeb9920de1230e1242dbd7220715d41b727ccd523694147b54354e60efe23` | progress lines (stderr) |
| `err_e1r_c2.txt` | `c3c7667d0b07632a6ac5973276349b0e381a80d8533c9cb9483a39ed9d9f5d13` | progress lines (stderr) |
| `err_e1r_cb17.txt` | `6d44934b38831bab4f2031e6152ba2ccc4b7e35b453b7917aca8a127f0bd627c` | progress lines (stderr) |
| `mutation_e1r.py` | `53c6793e03f0e7d148a18603e4266d305326654247a7463b866fb57bb2bbccb2` | uniform-d mutant flow must fail the exact-load check |
| `out_G.json` | `84256ed8a21a0526f8b742abdca02699f0de5d219bcb04e565bdf562cb23b5d9` | G(8^82,7^2), all 56 ranks |
| `out_alias.json` | `b6f1f41b4c949daa1a2420097036fe670eb902c7e8e38191e28fc4e55d20b4d6` | alias check results (0 hits) |
| `out_cd2.json` | `bb6c2e1c5403c459a146b90b9bf2fd72ec154631bf19fbe9ad70b2202ac16713` | CD-2 results |
| `out_e1r_a.json` | `1aa8b925cf19d358fa1e4d5edc4b9fa2cbf1a2cc6b6f5c1d6a0da5ff9f30a7cc` | E1-R batch a (12 trees) |
| `out_e1r_b.json` | `3ed02663443883b9d58ba40498a570d50be406586a482298818a2d7ab85638f5` | E1-R batch b (16 trees) |
| `out_e1r_c1.json` | `5a4f628d6dc174e8ea187505c8f97282a0841347ef287b12220a7f0c4177c9c9` | CBpat(1,1,1,7)/10 |
| `out_e1r_c2.json` | `d179878ca7f469c17d4f1415740bdeb97a1d3bf49e4c1ba9cc335d9627ce6037` | CBpat(1,2,3,4), (2,2,3,3), (1,1,2,6) at 10 |
| `out_e1r_cb17.json` | `40e1e38ab1013198c2e3da4aa1821f5bfef8aab39407e926f75546a977e9e787` | CB(1,7)/10 |
| `out_mutation_e1r.json` | `dc2d5f20fd1f417f7f3c042bb1e99fa208d8378038d2d2db62248257d9bb89cc` | mutation results (all rejected) |
| `out_scan_small.json` | `51e76982f08109aaf8168401b3194c82f2e148eefb5557cd01ad99e9ead98249` | small CB-pattern eligible rows |
| `out_selftest.json` | `6592be893b333db9aaf9c977976a925166c7ba724823f6d5a0e57174fc475db8` | closed forms = enumeration (9 patterns) |
| `out_summary.json` | `82d903c6cf71f0c5a886882e9ce6555708e280ad67077a1b27cead280192cfcc` | E1-R summary counts |
| `out_sweep_m15.json` | `102835c0ef72a3beda2982be2402c93db785d030e8ebe51374bd04aa3a9a08a8` | CB sweep d<=8, m<=15 |
| `out_sweep_m16_40.json` | `fce4de3600e665dbbfaedac39984e0e69f9e5d120522888cb5b0fb198b13729c` | CB sweep d<=8, 16<=m<=40 |
| `out_sweep_m30.json` | `eec33cda24db2cbc766d8dd0666ee60fccea3a8cf0e2a2a29b2c5202d72cc587` | CB sweep d<=8, m<=30 |
| `reg_query.py` | `405760766071212314b5f3a3b5e43730c632a138345d74e1ac3bd79e91aef495` | registry queries (E1, the refuted keys, the R30 key list) |
| `reg_text.txt` | `58bad24299e2527de4c071608c80fbedb7254c256c8a752e736bfe1c39efd9bf` | the registration blocks, as tested by alias_check |
| `scan_small.py` | `4a59da78f75ea2247ae8318b4222d20e2d88ae0490c42a3014a2928a598d9440` | eligible rows of all CB patterns with n <= 34 (closed form) |
| `seal_check.py` | `aeca5cc631ccebce22ec4ace4fa4398f7b415b2cda7622c4958d819848faf848` | capsule seal and 55 member digests |
| `second_read_template.md` | `7eb1adc691852389a54f1f6871623d462744da7b66aafe7c4f142c92e888abed` | template of this file (assembly input) |
| `smoke.json` | `398f48564784500d1e08c5571d8c385d779d9f7035cab5c6c5241b1071ec41ed` | early smoke run |
| `summarize.py` | `97a2c8739e57ecce3b5ce60a1d5d4a95197c1888d6c318456bc24b8974a0410a` | summary of the E1-R runs |

**Replay** (from the scratch directory, foreground; about 100 s in total):

```
python3 -B cd2.py 30 30 9 22 > out_cd2.json
python3 -B e1r.py 1,2 1,3 2,3 1,1,2 1,4 2,4 1,2,2 1,1,3 1,5 1,1,1,2 3,4 1,2,3 > out_e1r_a.json 2> err_e1r_a.txt
python3 -B e1r.py 2,2,3 1,1,2,2 3,5 1,1,1,1,2 2,3,3 1,2,2,2 1,1,1,3 1,6 2,5 4,5 1,7 1,1,1,1,1,2 2,2 3,3 2,2,2 1,1,1,1 > out_e1r_b.json 2> err_e1r_b.txt
python3 -B e1r.py 1,1,1,7@10 > out_e1r_c1.json 2> err_e1r_c1.txt
python3 -B e1r.py 1,2,3,4@10 2,2,3,3@10 1,1,2,6@10 > out_e1r_c2.json 2> err_e1r_c2.txt
python3 -B e1r.py 1,1,1,1,1,1,1@10 > out_e1r_cb17.json 2> err_e1r_cb17.txt
python3 -B crit_rows.py selftest > out_selftest.json
python3 -B crit_rows.py G > out_G.json
python3 -B crit_rows.py sweep 8 1 15 ii wid > out_sweep_m15.json
python3 -B crit_rows.py sweep 8 1 30 ii wid > out_sweep_m30.json
python3 -B crit_rows.py sweep 8 16 40 ii wid > out_sweep_m16_40.json
python3 -B scan_small.py 34 > out_scan_small.json
python3 -B summarize.py > out_summary.json
python3 -B mutation_e1r.py > out_mutation_e1r.json
python3 -B alias_check.py reg_text.txt > out_alias.json
```

`replay/` holds a second run of `cd2`, `crit_rows G`, `sweep m15`, `selftest`, `scan_small` and `e1r` batches a and b with the final
scripts. All are byte-identical (`cmp`) to the files above. `e1r.py` gained its `@rank` filter, and `crit_rows.py` its `wid` mode, after
some first outputs; the replays show the outputs unchanged. `smoke.json` is an early smoke run (4 trees), kept for the record.

Deliverable: `second-reads/SR-C4-6/SECOND-READ.md` (this file).
