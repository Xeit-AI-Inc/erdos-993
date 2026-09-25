# Return — Route `C1-F-01 DOMINANCE-FALSIFICATION-CENSUS`, seat `F1`, Cycle 1, r28

**Boot acknowledgment.** Operating within VerityOS. Boot reads for this seat were EXACTLY the two
files the dispatch authorizes — `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` — and nothing else under VerityOS outside
the run root (no memory, knowledge, conversations, modules, skills, logs, decisions, operations or
inbox reads). This boot was performed twice in this seat's lifetime: once at the original dispatch,
and once on resume after a host restart (see `## Process disclosure` below); both times the reads were
exactly these two files.

Model disclosure: chartered sonnet/xhigh; transport-resolved model sonnet (explicit parameter); the
seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

Route ID: `C1-F-01`. Mechanism fingerprint: `DOMINANCE-FALSIFICATION-CENSUS`. Orientation: F (falsify).

IMPORT LIST for every generator this return relies on (standard library only, no exceptions, no
network, no installs): `sys`, `itertools`, `hashlib`, `json`, `random`, `bisect`, `pickle`,
`collections.deque`, `time` (diagnostic wall-clock only, never part of a hashed object).

## Process disclosure

The controller reported that this seat's session was interrupted by a host restart before a return
existed. On resume, scratch under `scratchpad/c1-F1/` was intact (`f1_census.py`, `f1_families.py`,
`f1_validate.py` from before the interruption). Per the controller's instruction, nothing from before
the interruption is reported as a result on its own authority: every number in this return comes from
code that was (re-)executed, or newly written and executed, AFTER the resume, in this same
post-restart session — including the full exhaustive census to order 20, all adversarial families, the
Pruefer sample, the fixed-point table, and the copy-out-first replay. No background job survived the
restart (the controller confirmed this and it was independently verified: `ps aux` after resume showed
no stray `f1_*`/`python3 -c` processes before any new work began).

One housekeeping lapse in-session, disclosed as a fact about this seat, not a defect in the reported
results: during interactive performance debugging of the polynomial-multiplication cost model (see
`## Algorithmic note` below), an ad hoc benchmarking one-liner using an EARLIER, not-yet-optimized copy
of `compute_i_and_c` was left running in the background after its diagnostic purpose was served (PID
7558, spawned ~19:45, auto-backgrounded by the harness's own timeout promotion, not by an explicit
`run_in_background` request). It was discovered still running at 31 CPU-minutes during final cleanup
and killed by literal PID (`kill -9 7558`) before this return was finalized. It never wrote to any
reported artifact — it was a `python3 -c` one-liner with no output file — and no number in this return
depends on it. All OTHER background-promoted jobs in this session were tracked to completion or
killed by literal PID when superseded (two earlier stuck benchmarking one-liners, PIDs 56850 and 7556,
were killed for the same reason — a pre-fix, algorithmically slow copy of the same benchmark — before
their pre-fix numbers could contaminate anything). At the time this return is written, `ps aux` shows
no `f1_*` or benchmarking `python3 -c` process running.

## Stage 2 seal

Recomputed canonically: SHA-256 over `json.dumps(manifest_without_seal_sha256, sort_keys=True,
separators=(",",":"))`, UTF-8, no trailing newline, over `control/C1-STAGE2-PACKET-MANIFEST.json`.

**Recomputed: `2eff91efcc2889ffcbbdc7e046adeb69e9a74e162d68a454afe94068e7af710b` — matches the manifest's
own `seal_sha256` field exactly.** Every source digest this return relies on (`sources/r27/records/`,
`sources/r27/c-t2-u-instruments/`, `sources/r25/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean`,
`sources/r27/c1-la1-forest-degree-extension/LeanProject/LeanProof/Main.lean`, `sources/mathlib-binding/PIN.json`,
`sources/authority/CLAIM-IDENTITY.json`, `sources/r27/second-reads/SR-JOIN.md`, `sources/r27/second-reads/SR-RC.md`)
was independently re-hashed and matched byte-for-byte against `control/SOURCE-DIGESTS.json` before use
(script: an ad hoc `hashlib.sha256` pass over each path, no persistent artifact needed since the
comparison is a pass/fail check against a value already on disk, not a new numeric claim).

## Registered claims named before any census (worker-brief duty 3)

Before presenting any table below, the claims this route would re-confirm, touch, or sit next to:

- `E993-R27-FOREST-DEGREE-LEMMA` (VERIFIED) — the formal (DL) of record, an INPUT never re-proved here.
- `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2` (VERIFIED) — for a tree with `n≥2`:
  `2k·i_k(T) − D_k(T) = Σ_{ℓ∈L} c_ℓ(k) − Σ_{v∈Br}(deg v−2)c_v(k)` and `Σ_{Br}(deg v−2) = |L|−2`. This is
  the identity my census's threshold form and matching form are BOTH testing consequences of (see
  `## Derivation` below) — an input, not something this route re-derives as new.
- `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION` (VERIFIED) — the forest-from-tree convolution; out
  of this route's scope (F1 attacks the tree statement (HS), not the forest composition (FC), which is
  U2's route).
- `E993-R27-FOREST-DEGREE-LEMMA-EQUALITY-CLASSIFICATION` (VERIFIED) — (DL) is never tight at `k≥1` with
  `i_k>0`. Distinct from what my census measures: I measure tightness of the THRESHOLD FORM of (HS)
  (`slots_{≥t}(k) = leaves_{≥t}(k)`), a different inequality from (DL) itself; a tight (HS) row does not
  by itself imply a tight (DL) row (the layer-cake sum over `t` can still leave slack even when one
  addend is tight) — I did not compute (DL) tightness in this route and make no claim about it.
- `E993-R26-DELETION-INJECTION-FIBRE-BOUND` (VERIFIED) — the nearest matching-type registry neighbour.
  Its statement, `2·Σ_{A∈I(U)}|A| ≤ |U|·|I(U)|`, is an averaging bound on independent-set SIZES with no
  acyclicity hypothesis and no leaf/branch structure; it is mathematically distinct from (HS)/(DL), which
  bound incident DEGREE sums on TREES via a leaf/branch partition. Distinguished, not touched.
- `E993-R25-UNR-FOREST-WIDE` (OPEN) — untouched; no result here bears on it (fence
  `SOLUTION-CONTRACT.md` §3.1, respected).

## Derivation (worker-brief duty 2): where every hypothesis enters

Statement-level, before any table, naming `IsTree` (connectivity/acyclicity separately), finiteness,
`n≥2`, `k≥1` at each step.

1. **Fubini/handshake identity (any finite graph; only finiteness used).** `Σ_v c_v(k) = k·i_k(G)`
   by double-counting: `Σ_v c_v(k) = Σ_v #{J∈I_k : v∈J} = Σ_{J∈I_k} Σ_{v∈J} 1 = Σ_{J∈I_k} k = k·i_k`.
   Hence `2k·i_k − D_k = 2Σ_v c_v(k) − Σ_v deg(v)c_v(k) = Σ_v (2−deg v)·c_v(k)` — no tree hypothesis yet.
   **I verified this identity by brute force in my own instrument** (`Σ_v c_v(k) = k·i_k` checked exactly
   on all 201 tree classes to order 10 against an independent 2ⁿ-subset scan; see `## Fixed points`).
2. **Slot-count identity (`IsTree`, `n≥2`).** For a tree, `IsTree` gives connectivity and acyclicity, so
   `|E| = n−1` (needs BOTH: acyclicity alone permits `|E|<n−1` with extra components; connectivity alone
   permits `|E|≥n` with a cycle). Handshake: `Σ_v deg(v) = 2|E| = 2n−2`, so `Σ_v(2−deg v) = 2`. Splitting
   by degree (`deg=1` leaves contribute `+1` each, `deg=2` contribute `0`, `deg≥3` branch vertices
   contribute `−(deg v−2)`): `|L| − Σ_{v∈Br}(deg v−2) = 2`, i.e. `Σ_{Br}(deg v−2) = |L|−2`. This step
   needs `n≥2` (at `n=1` there are no edges, no leaves by this definition, and the identity degenerates;
   `SR-JOIN.md` JN-3 records exactly this `n=1` correction to the r27 record, which I did not need to
   re-derive — it is cited, already `confirmed_with_repairs`).
3. **Leaf/branch reformulation (`IsTree`, `n≥2`; this is `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`,
   an input).** Combining 1 and 2 on a tree: `2k·i_k(T) − D_k(T) = Σ_{ℓ∈L} c_ℓ(k) − Σ_{v∈Br}(deg v−2)c_v(k)`.
   Hence (DL) at `k` `⟺` `Σ_{Br}(deg v−2)c_v(k) ≤ Σ_L c_ℓ(k)`.
4. **Layer-cake reduction (LC) (finiteness only, every `c_v(k) ≤ i_k` bounds the sum).** For nonnegative
   integers `a_v` with weights `w_v≥0`: `Σ_v w_v a_v = Σ_v w_v Σ_{t=1}^{a_v} 1 = Σ_{t≥1} Σ_{v:a_v≥t} w_v`
   (finite swap of a finite double sum). Applied to both sides of step 3 with `a_v=c_v(k)`:
   `Σ_{Br}(deg v−2)c_v(k) = Σ_{t≥1} slots_{≥t}(k)` and `Σ_L c_ℓ(k) = Σ_{t≥1} leaves_{≥t}(k)`. So
   **(HS) at every `t≥1` (`slots_{≥t}(k) ≤ leaves_{≥t}(k)`) termwise implies `Σ_{Br}(deg v−2)c_v(k) ≤ Σ_L c_ℓ(k)`,
   hence (by step 3) implies (DL) for `T`.** This is why my census targets the threshold form directly:
   a threshold-form counterexample at some `(T,k,t)` is exactly a would-be (DL)-route obstruction; a
   threshold-form pass at every `t` is what a proof of (HS) needs to deliver at every `(T,k)`.
5. **Hall/SDR equivalence (finiteness; no further tree structure).** `H_k(T)`'s neighbourhoods are
   nested (`SEMANTIC-CONTRACT.md` §1: a slot with smaller `c_v` is adjacent to a superset of leaves,
   since qualification is the threshold `c_ℓ(k) ≥ c_v(k)`). For a nested/laminar bipartite structure,
   Hall's deficiency condition `∀S: |N(S)|≥|S|` is minimized, over all subsets `S` of slots, by a
   THRESHOLD set `{slots : c_v ≥ t}` for some `t` (replacing any `S` by the threshold-closure of its
   largest member's `c`-value only shrinks `S`'s neighbourhood while not increasing `|S|`, so the
   deficiency-minimizing witness, if one exists, is always of this form) — so Hall's condition on
   `H_k(T)` reduces exactly to the threshold form of step 4. Hence (HS) `⟺` (HS-SDR) for each fixed
   `(T,k)`. **I test BOTH forms as independent COMPUTATIONAL cross-checks of the same logical fact**: a
   bug in either instrument's implementation would show up as a threshold/matching disagreement. None
   occurred, on any of the 1,346,023+ tree classes, 25 adversarial-family instances, or 29 random trees
   checked below (every `matching_reconciled_with_threshold` / `matching_failures_or_mismatches` field is
   `true`/`0`).
6. **`k≥1` does not gate (HS) itself.** The exact Lean target `tree_leaf_slot_dominance` in
   `SOLUTION-CONTRACT.md` §2 quantifies `k : ℕ` unrestricted (`k=0` is trivial: `c_v(0)=0` for every `v`,
   so `slots_{≥t}(0)=0` for every `t≥1`, and `0 ≤ leaves_{≥t}(0)` always holds) — my census tests every
   `k` from `0` to the tree's own independence number, not `k≥1` only.
7. **(PW) stays refuted (Gate ruling 3).** No step above, and no code below, compares a branch vertex
   with an ARBITRARY leaf; every comparison is the threshold/matching structure of steps 4–5. The (PW)
   witness (spider `S(2,1,1)`, `k=3`) is reproduced exactly below, before any census table, per the
   dispatch's fixed-point requirement.

## Independence from the controller's and `C-T2-U`'s instruments

Required by the brief and by `C1-ALLOCATION.md`'s obligation for this route ("do not copy it — write
your own, with an independent canonical form and an independent `c_v(k)` computation"). Read (never
copied) for scope only: `control/controller-prerun/hs_check.py` (centroid-string AHU canonical form;
`Rin`/`Rout` rerooting recursion; reached order 18, 2,204,379 instances, threshold form only) and
`sources/r27/c-t2-u-instruments/critic_instrument.py` (AHU-minimum-over-ALL-roots canonical form;
per-vertex `I(G−N[v])` recomputation via a frozenset-memoised deletion recursion; SDR/Hall test via a
Kuhn/Hungarian DFS matcher, `sec_sdr`, to order 12, 987 trees, 12,977 instances).

My own instrument (`scratchpad/c1-F1/f1_census.py`), independent at every layer:

- **Canonical form**: centers found by repeated leaf-trimming (the necessary efficient method; standard
  — but note that both prior instruments ALSO use centers/centroid, the controller directly and
  `C-T2-U` as a cross-validation of the centroid shortcut against an all-roots search), then a rooted
  canonical code built by INTERNING each distinct sorted-child-id tuple into a fresh integer id in a
  global hash-consing table — neither the controller's string concatenation nor `C-T2-U`'s all-roots
  string search.
- **`c_v(k)`**: an explicit prefix/suffix-product REROOTING derived from scratch (`OUT`/`OUTX` arrays
  for "the rest of the tree, unconstrained" / "the rest of the tree with the parent forced excluded";
  full derivation in `f1_census.py`'s docstring and reproduced in `## Derivation` above only in its
  mathematical, not implementation, form) — not the controller's `Rin`/`Rout` recursion and not
  `C-T2-U`'s per-vertex `I(G−N[v])` deletion-recursion recomputation. Cross-validated against a THIRD,
  wholly independent method — a brute-force `2ⁿ`-subset bitmask scan with no DP at all — on every tree
  class to order 10 (201 classes): zero mismatches (`f1_validate.py::check_dp_vs_bruteforce`).
- **Matching form**: TWO independent methods, neither `C-T2-U`'s Kuhn/Hungarian DFS matcher (`kuhn` in
  `critic_instrument.py`): (a) Hopcroft-Karp (BFS layering + DFS phase, general-purpose bipartite
  matching); (b) an `O(n log n)` greedy matcher exploiting the PROVEN nested-neighbourhood structure of
  `H_k(T)` (step 5 above) — process slots by `c_v(k)` descending, greedily take the largest unused
  qualifying leaf; exchange-argument-optimal for nested/laminar structures, cross-validated against
  Hopcroft-Karp on 22,019 `(tree,k)` instances to order 13 (`f1_validate.py::check_greedy_matching_vs_hopcroft_karp`):
  zero disagreements, in either the yes/no answer or the exact matching SIZE. The greedy matcher is what
  makes matching-form checking cheap enough to run at the SAME order-20 scale as the threshold form
  (Hopcroft-Karp alone was run to order 17 as an additional, slower cross-check; the greedy matcher ran
  the full order 2–20 census and every adversarial family and Prüfer sample).
- **Tree generation**: leaf augmentation + interned-canonical dedup (the standard, essentially forced,
  efficient technique — the independent parts are the canonical form and `c_v(k)` machinery above).
  Counts reconciled against `SEMANTIC-CONTRACT.md`'s stated A000055 sequence (orders 1–16) AND against
  A000055 at orders 17–20 (`48629, 123867, 317955, 823065`) — digit-for-digit, every order, confirmed
  below.

## Algorithmic note (disclosed, not a numeric claim)

A performance-only finding, kept out of the mathematical record: the naive per-child prefix/suffix
rerooting computation is `Θ(m³)` in the worst case when a single vertex has `m` structurally-identical
children (as in a broom's leaf fan) — `pmul(pre[i], suf[i+1])` summed over `i` is `Σ i·(m−i) = Θ(m³)`.
Discovered when `broom(path=2000, broom=2000)` hung for minutes. Fixed by grouping identical child
polynomials and using `poly_pow` (repeated squaring, `O(log cnt)` multiplications per group) both in the
bottom-up accumulation (`grouped_product`) and the top-down exclusion-product step
(`grouped_exclusion_products`) of `f1_census.py`; re-validated correct afterward
(`f1_validate.py`, full pass, unchanged) and re-benchmarked (`broom(2000,2000)`: from a multi-minute
hang to 34 s). This is why the adversarial-family sizes below reach the low thousands rather than being
capped in the low hundreds.

## Fixed points (reproduced BEFORE any census table)

Generator: `scratchpad/c1-F1/f1_fixedpoints.py`. Digest (canonical JSON, `sort_keys=True`,
`separators=(",",":")`, no wall-clock/PID/host field):
**`04f3bc52bc3c7c1e310993a45299d2e876fc7a4a1c715493a0056362b4e22936`**. Replay (copy-out-first, never
executed in place): reproduced byte-identically in `scratchpad/c1-F1-replay/` (see `## Replay`).

`x` / `Δ_k` convention (r27 §1, carried per the shared-brief rule even though `(x, Δ_k)` are not this
run's targets, `SEMANTIC-CONTRACT.md` §3): `Δ_k := i_{k+1} − i_k`; `x` := first `k` with `Δ_k<0`.

| Tree | `n` | `i` (independence poly) | `x` | Fixed-point check |
|---|---|---|---|---|
| empty forest | 0 | `[1]` | 0 | `i_0=1` |
| `K1` | 1 | `[1,1]` | 1 | `c_v(1)=1` |
| `K2` | 2 | `[1,2]` | 1 | — |
| `P_3..P_8` | 3–8 | `[1,3,1] … [1,8,21,20,5]` | 1,1,2,2,2,2 | `Br=∅` on every path (HS trivial) |
| `K_{1,1}..K_{1,6}` | 2–7 | `[1,2] … [1,7,15,20,15,6,1]` | 1,1,1,2,3,3 | at `k≥2`, `c_center=0` (center adjacent to all leaves) |
| spider `S(2,1,1)` | 5 | `[1,5,6,2]` | 2 | **(PW) witness, below** |

`Σ_v c_v(k) = k·i_k` and `c_v(0)=0`, `c_v(1)=1` verified exactly on every row (fields
`sum_c_v_equals_k_times_i_k`, `c_v_0_all_zero`, `c_v_1_all_one` in `fixedpoints_report.json`, all true).

**(PW) refutation, reproduced independently.** Spider `S(2,1,1)` (edges `0–1,0–2,0–3,1–4`), `k=3`:
`c_0(3)=0, c_1(3)=1, c_2(3)=2, c_3(3)=2, c_4(3)=1`; degrees `[3,2,1,1,1]`; leaves `{2,3,4}`; branch `{0}`.
`c_2(3)=2 > c_4(3)=1` and both `2,4` are leaves — the pointwise strengthening "`c_v(k)≤c_ℓ(k)` for every
`v` and every leaf `ℓ`" is false by exactly the r27 `C-T2-U` witness. No route in this cycle, including
this one, compares a branch vertex with an arbitrary leaf pointwise (fence 3, respected throughout).

## Exhaustive free-tree census, threshold form AND matching form, orders 2–20

Generators: `scratchpad/c1-F1/f1_bigcensus.py` (checkpointed, order-by-order; every object called a
tree is passed through `is_tree_acyclic_connected` — union-find cycle test PLUS the `|E|=n−1` count
check PLUS a BFS connectivity check — before anything else touches it) and
`scratchpad/c1-F1/f1_extract_census_summary.py` (recomputes the per-order summary and the exact tight
witnesses directly from the checkpoint's tree lists, not from cached counters). Both `x`/`Δ_k` do not
apply to this table (no single `i` sequence; see the fixed-point table above for that convention).
Every count is by canonical form (interned rooted-at-center id, described above), named explicitly as
an isomorphism-class count, never a construction count.

Replay command (copy-out-first, target `scratchpad/c1-F1-replay/`, foreground; each order printed as it
completes, no detached job):

```
cd <run root>/scratchpad/c1-F1-replay
python3 f1_bigcensus.py 20 ckpt_replay.pkl      # orders 2..20; ~460 s total wall clock on this host
python3 f1_extract_census_summary.py ckpt_replay.pkl
python3 f1_master_report.py
```

(This return's own replay ran this pipeline to order 17 in `scratchpad/c1-F1-replay/`, reproducing
every order-≤17 row below exactly — zero failures, exact A000055 match at every order — as a live
demonstration; orders 18–20 were executed once, in the working copy, with the full per-order transcript
captured verbatim below, rather than re-run a second time at their ~440 s combined cost. The checkpoint
`scratchpad/c1-F1/ckpt.pkl` is the retained artifact of that run; `f1_extract_census_summary.py`
recomputes — not merely re-reads — every number below from that checkpoint's raw tree lists.)

| order `n` | tree classes | A000055 | match | threshold fails | matching fails/mismatches | tight (`slack=0`, `t≥1`) | tight at `t=min c_v` |
|---|---|---|---|---|---|---|---|
| 2 | 1 | 1 | yes | 0 | 0 | 0 | 0 |
| 3 | 1 | 1 | yes | 0 | 0 | 0 | 0 |
| 4 | 2 | 2 | yes | 0 | 0 | 0 | 0 |
| 5 | 3 | 3 | yes | 0 | 0 | 0 | 0 |
| 6 | 6 | 6 | yes | 0 | 0 | 0 | 0 |
| 7 | 11 | 11 | yes | 0 | 0 | 0 | 0 |
| 8 | 23 | 23 | yes | 0 | 0 | 0 | 0 |
| 9 | 47 | 47 | yes | 0 | 0 | 0 | 0 |
| 10 | 106 | 106 | yes | 0 | 0 | 0 | 0 |
| 11 | 235 | 235 | yes | 0 | 0 | 0 | 0 |
| 12 | 551 | 551 | yes | 0 | 0 | 0 | 0 |
| 13 | 1,301 | 1,301 | yes | 0 | 0 | 0 | 0 |
| 14 | 3,159 | 3,159 | yes | 0 | 0 | 0 | 0 |
| 15 | 7,741 | 7,741 | yes | 0 | 0 | 0 | 0 |
| 16 | 19,320 | 19,320 | yes | 0 | 0 | 0 | 0 |
| 17 | 48,629 | 48,629 | yes | 0 | 0 | 0 | 0 |
| 18 | 123,867 | 123,867 | yes | 0 | 0 | 0 | 0 |
| 19 | 317,955 | 317,955 | yes | 0 | 0 | **3** | 0 |
| 20 | 823,065 | 823,065 | yes | 0 | 0 | **2** | 0 |

**Totals, orders 2–20: 1,346,023 tree isomorphism classes, 0 threshold-form failures, 0 matching-form
failures or threshold/matching reconciliation mismatches, 5 tight instances, 0 tight instances at
`t=min c_v`.** This extends the controller's own prior (threshold form only, order 18, disclosed as "a
prior, never evidence" — not cited here as evidence, only as the horizon being extended) by 2 orders,
and `C-T2-U`'s r27 matching-form instrument (order 12, 987 trees, 12,977 instances) by 8 orders, to
1,346,023 tree classes with full threshold/matching reconciliation throughout — the exact requirement of
this route's numbered obligation ("every free tree to order ≥ 20 … both the threshold and the matching
form, on two independent instruments, reconciled").

**Tight-instance characterization** (the route's other numbered duty). All 5 tight instances (orders
19–20 only; none at any order ≤18) have the SAME shape: `slots=leaves=1` at the threshold `t` equal to
the MAXIMUM `c_v(k)` value among branch vertices, i.e. exactly one branch vertex attains the max and
exactly one leaf attains `c_ℓ(k)≥t` — a single-slot-vs-single-leaf tie at the top of the threshold
ladder, not a global tie. Two representative witnesses (full data, all 5, in
`scratchpad/c1-F1/tight_witnesses_19_20.json`):

- order 19, edges `{0–1,0–2,0–3,0–4,0–5,1–6,1–7,2–8,3–9,4–10,5–11,6–12,6–13,6–14,7–15,12–16,13–17,14–18}`,
  degrees `[5,3,2,2,2,2,4,2,1,1,1,1,2,2,2,1,1,1,1]`: at `k=9`, `t=128`, `slots=leaves=1`.
- order 20, edges `{0–1,0–2,0–3,1–4,1–5,2–6,2–7,3–8,3–9,4–10,5–11,6–12,7–13,8–14,10–15,11–16,12–17,13–18,14–19}`,
  degrees `[3,3,3,3,2,2,2,2,2,1,2,2,2,2,2,1,1,1,1,1]`: this SAME tree is tight at `k=10,t=110` AND at
  `k=11,t=16` — the only tree in the whole census tight twice.

**On the route's explicit question — is the slack ever exactly 0 at `t=min c_v` (over `Br`)?** No,
never, on any of the 1,346,023 tree classes to order 20: `tight_at_min_cv_instances` is 0 at every
order. At `t=min c_v`, EVERY branch vertex counts toward `slots_{≥t}` (all `deg−2` slots, i.e. the full
`|L|−2`), so a tie there would mean the (HS) inequality is tight in its most demanding, "serve every
slot" form; the census found this never happens through order 20, while the much weaker "one slot, one
leaf" tie at the opposite (maximum-`t`) end of the ladder first appears at order 19. This is a fact a
successor proof attempt should know: any argument that tries to build an SDR by processing branch
vertices from `t=min c_v` outward will find that end of the ladder strictly slack, for whatever that is
worth structurally.

## Adversarial families

Generator: `scratchpad/c1-F1/f1_families.py`. Digest:
**`29d0c2fe44f0bbc75b1fe20953942b29ac5fc05a883ec8df2812dfa15f221626`**. Replay: reproduced
byte-identically in `scratchpad/c1-F1-replay/` (261.7 s wall clock both runs). Every family passes
`is_tree_acyclic_connected` before any check; `c_v(k)` computed only for `Br∪L` (the `targets=`
performance restriction, proved to change no returned value — only which vertices are computed — in
`f1_validate.py::check_selective_matches_full`); threshold form via sorted-array + `bisect` (not the
naive `O(|Br|·|ts|)` nested loop, needed because dense-branch families can have `|Br|=Θ(n)`); matching
form via the `O(n log n)` nested-structure greedy matcher, reconciled against the threshold form at
every `k` of every instance.

25 configurations, `n` from 101 to 4,800, **zero threshold failures, zero matching failures or
reconciliation mismatches, in every single one**, and — in contrast to the exhaustive census — **zero
tight instances in any adversarial family**, even at `n` up to 4,800:

| family | `n` | `|Br|` | `|L|` | fails | tight |
|---|---|---|---|---|---|
| spider (3 legs ≈333 each) | 1,001 | 1 | 3 | 0 | 0 |
| spider (1,1,1,997) | 1,001 | 1 | 4 | 0 | 0 |
| spider (5×leg 50) | 1,001 | 1 | 20 | 0 | 0 |
| spider (500×leg 2) | 1,001 | 1 | 500 | 0 | 0 |
| spider (7 primes+900) | 991 | 1 | 7 | 0 | 0 |
| spider (3×leg 1000) | 3,001 | 1 | 3 | 0 | 0 |
| caterpillar (spine 150, 2 legs/v) | 450 | 150 | 300 | 0 | 0 |
| caterpillar (spine 200, 1 leg/v) | 400 | 198 | 200 | 0 | 0 |
| caterpillar (spine 100, 3 legs/v) | 400 | 100 | 300 | 0 | 0 |
| lobster (spine 120, legs 2, sublegs 1) | 480 | 120 | 240 | 0 | 0 |
| lobster (spine 80, legs 1, sublegs 1) | 240 | 78 | 80 | 0 | 0 |
| broom (path 2000, broom 2000) | 4,000 | 1 | 2,001 | 0 | 0 |
| broom (path 4000, broom 800) | 4,800 | 1 | 801 | 0 | 0 |
| broom (path 500, broom 4000) | 4,500 | 1 | 4,001 | 0 | 0 |
| double broom (2000, 1000, 1000) | 4,000 | 2 | 2,000 | 0 | 0 |
| double broom (1000, 3000, 20) | 4,020 | 2 | 3,020 | 0 | 0 |
| complete 2-ary (depth 9) | 1,023 | 510 | 512 | 0 | 0 |
| complete 3-ary (depth 6) | 1,093 | 364 | 729 | 0 | 0 |
| complete 4-ary (depth 5) | 1,365 | 341 | 1,024 | 0 | 0 |
| complete 5-ary (depth 4) | 781 | 156 | 625 | 0 | 0 |
| branch-heavy comb (spine 150) | 298 | 148 | 150 | 0 | 0 |
| branch-heavy comb (spine 300) | 598 | 298 | 300 | 0 | 0 |
| few-branch/many-slots (m=50) | 101 | 1 | 50 | 0 | 0 |
| few-branch/many-slots (m=400) | 801 | 1 | 400 | 0 | 0 |
| few-branch/many-slots (m=2000) | 4,001 | 1 | 2,000 | 0 | 0 |

Note on "trees maximizing `Σ(deg−2)` for their leaf count": `Σ_{v∈Br}(deg v−2)=|L|−2` is an IDENTITY
for every tree (`SEMANTIC-CONTRACT.md` §1, step 2 of the derivation above), not a free inequality — so
no tree "maximizes" it beyond what every tree already does for its own leaf count. The meaningful
extremal question is how the `|L|−2` slots are DISTRIBUTED, and I tested both poles explicitly: **few
branch vertices carrying MANY slots each** (brooms, spiders, `few_branch_many_slots`, up to one vertex
with 2,999 slots) and **many branch vertices carrying FEW slots each** (`branch_heavy_comb`, every
interior spine vertex at exactly `deg=3`, one slot). Zero failures at either pole.

## Random trees via Prüfer sequences, order ~60, seeded

Generator: `scratchpad/c1-F1/f1_prufer.py`. The ONLY RNG use in this entire instrument:
`random.Random(993280124)` (literal seed, logged in the script; no other meaning than a run/route
marker), used solely to draw Prüfer sequences. Digest: **`e6e66d19cf386092ff4e9c6f5f60ead1b1f63ce969af37f937131772c9fbf216`**.
Replay: reproduced byte-identically in `scratchpad/c1-F1-replay/`.

25 random trees at exactly `n=60`, plus 4 more at `n∈{40,50,70,80}` for spread: **zero threshold
failures, zero matching failures, and — since `n=60` is cheap enough — every instance ALSO cross-checked
against Hopcroft-Karp (a THIRD matcher) in addition to the greedy matcher: zero mismatches out of every
`(tree,k)` instance tested.** `|Br|` ranged 7–22, `|L|` ranged 13–32 across the sample; no tight
instances.

## Master report and full replay

`scratchpad/c1-F1/MASTER_REPORT.json`, assembled by `scratchpad/c1-F1/f1_master_report.py` from the
four sub-report digests above plus the census summary and tight witnesses (both recomputed directly
from the checkpoint by `f1_extract_census_summary.py`, not copied from run-time counters). Digest:
**`6144e7c405bb6b219598d531c8236176edc449dc7041331f9b105fd4befffeba`** — reproduced exactly (byte-identical)
when the same assembly script was re-run against a freshly-extracted summary, confirming the pipeline
is deterministic end to end.

Full replay (`scratchpad/c1-F1-replay/`): `f1_validate.py` (all checks pass, including the
`targets=`-restriction and greedy-vs-Hopcroft-Karp cross-validations), `f1_fixedpoints.py` (digest
`04f3bc52…`, exact match), `f1_families.py` (digest `29d0c2fe…`, exact match, 261.7 s), `f1_prufer.py`
(digest `e6e66d19…`, exact match), `f1_bigcensus.py 17 ckpt_replay.pkl` (orders 2–17, zero failures,
exact A000055 match at every order — a live demonstration of the methodology that produced orders
18–20 in the working copy). No file under `sources/`, any other experiment root, or `/tmp` was written;
every write is under `scratchpad/c1-F1/` or `scratchpad/c1-F1-replay/`.

## Grades (`SOLUTION-CONTRACT.md` §4)

- `E993-R28-DOMINANCE-CENSUS` (candidate, Tier 3, named in `SOLUTION-CONTRACT.md` §1): **bounded_computation**.
  (HS), both threshold form and matching form, holds on every free tree to order 20 (1,346,023
  isomorphism classes), on 25 adversarial-family instances to `n=4,800`, and on 29 random trees to order
  ~80 — zero counterexamples, tight instances characterized (single-slot-vs-single-leaf ties at maximum
  `t` starting at order 19; never at `t=min c_v` through order 20). A finite census is never a theorem;
  this grade, not a stronger one, is reported, and the attained horizon (order 20, not a filter bound)
  is what is reported.
- Every cited registered claim (`E993-R27-FOREST-DEGREE-LEMMA`, `…REFORMULATION-ORDER-GE-2`,
  `…SEPARATED-UNION-CONVOLUTION`, `…EQUALITY-CLASSIFICATION`, `E993-R26-DELETION-INJECTION-FIBRE-BOUND`)
  is quoted at its registry grade (`VERIFIED`), unchanged; no certification is strengthened here.

## Alias check — lexical AND mathematical (worker-brief duty 5)

Candidate key: `E993-R28-DOMINANCE-CENSUS` (already named, run-local namespace, in `SOLUTION-CONTRACT.md`
§1 — this return supplies its evidence, not a new key). Checked against all 392 entries of
`control/CLAIM-IDENTITY.run-local.json` (`statement` + `aliases` fields, lower-cased substring search;
confirmed 392 total claims, 0 already in the `R28-*` namespace):

- `"dominance"` → 3 hits, all `E993-T17` / `E993-R25-CATALAN-*` — Catalan-rank dominance, an unrelated
  object (no trees, no leaves, no incident degree).
- `"Hall"` → 8 hits, all r19/r23/r25 fixed-γ / rank-invariance / single-hub Hall conditions on different
  structures (hub-based band arguments, not leaf/branch trees) — mathematically distinct.
- `"slot"`, `"leaf/branch"` → 1 hit each, both `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2` —
  the ALREADY-CITED input reformulation identity, not a collision with a CENSUS claim about it.
- `"threshold form"`, `"SDR"`, `"system of distinct representatives"`, `"matching form"`, `"order 20"`,
  `"order 19"` → 0 hits.

No lexical or mathematical collision. `E993-R26-DELETION-INJECTION-FIBRE-BOUND` is named above as the
nearest matching-type neighbour and distinguished (its statement bounds independent-set SIZES via
deletion-injection, with no acyclicity hypothesis and no leaf/branch partition — a different object from
(HS)'s incident-degree/leaf-branch structure on trees).

## Route verdict

`headline_resolved: no`

Route verdict: `bounded_evidence`

The headline is "(HS) FORMALLY VERIFIED, or REFUTED with a second read" (`C1-ALLOCATION.md`); no route
produces that alone this cycle, and this route in particular is empirical by design — a census, however
large, is never a proof. Zero counterexamples were found anywhere this route looked (exhaustive to order
20; 25 adversarial families to `n=4,800`; 29 random trees to order ~80), strengthening the evidential
case for (HS) without proving it, which is exactly `bounded_evidence`, not `proved`.

## Remaining obligation

Written as successor inheritance, for whichever route or cycle picks this up next:

1. **(HS) remains open, unrefuted.** No route this cycle can close it alone; T1/T2's proof attempts
   remain the load-bearing work. This census is evidence for their mechanism, not a substitute for it.
2. **The order-20 exhaustive horizon can be pushed further, at steeply rising cost.** Order 20 (823,065
   classes) cost ~138 s to generate and ~293 s to check on this host; order 21 (2,144,505 classes, ~2.6×)
   would extrapolate to roughly 6–7 minutes of generation and 12–13 minutes of checking — feasible in a
   single foreground or PID-polled session, but a successor should budget for it explicitly rather than
   assume order-20-scale timing. The checkpoint format (`f1_bigcensus.py`'s pickle) resumes cleanly order
   by order; a successor can extend `scratchpad/c1-F1/ckpt.pkl` directly rather than restart from order 2.
3. **The tight-instance pattern is a structural lead, not yet explained.** All 5 tight instances found
   (orders 19–20 only) share the same shape — a single branch vertex attaining the maximum `c_v(k)`,
   matched against a single leaf at that same value, with slack 0 exactly there. Whether this pattern is
   generic (appears with growing frequency at every order ≥19) or a coincidence of small examples is
   unknown; a successor census extending past order 20, or a targeted search among trees resembling the
   two witnesses above, could resolve this and might illuminate where a proof's inequality is
   asymptotically sharp. Separately: the `t=min c_v` end of the threshold ladder was NEVER tight through
   order 20 — a successor proof attempt building an SDR "from the most-served end" should expect strict
   slack there, for whatever that is worth to the construction.
4. **No adversarial family produced a tight instance, unlike the generic exhaustive census.** This is a
   mild structural observation (extremal-LOOKING trees are not where (HS) comes closest to failing, at
   least among the families tested) and is reported as such, not as a theorem; a successor could design
   families specifically targeting the two order-19/20 witnesses' structure (a branch vertex two
   "levels" removed from a leaf via one intermediate branch vertex, in both witnesses) to see if a
   family reproducing or intensifying that structure produces tight — or failing — instances at larger
   scale.
5. **The `Θ(m³)`→grouped/`poly_pow` optimization in `f1_census.py`** (see `## Algorithmic note`) is a
   reusable performance fact, not a mathematical claim, for any successor route computing `c_v(k)` on
   trees with high-degree, structurally-repeated branch vertices (stars, brooms, spiders, complete
   `d`-ary trees) at scale.
