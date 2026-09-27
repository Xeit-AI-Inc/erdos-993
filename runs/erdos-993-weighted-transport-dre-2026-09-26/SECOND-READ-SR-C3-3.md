# Second Read

Read `SR-C3-3`, r30 Cycle 3 (`erdos-993-math-dre-20260926-r30-weighted-transport`; Erdős #993, weighted mixed-boundary
transport). Object: E1, the mark-clone reduction on the `CB` family (synthesis B1, B11, R4, the last paragraph of
`## Refuted or narrowed mechanisms`, registration item 8). Date 2026-09-27.

**Boot.** I am operating within VerityOS. Boot files: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, the two the protocol permits. No other VerityOS subsystem was
loaded.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]
(The runtime id is the one my environment reports. I cannot observe the transport part myself; it is given as chartered.)

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Capsule inner seal `control/c3-second-read/SR-C3-3-PACKET-MANIFEST.json` (SHA-256 of compact key-sorted JSON without `seal_sha256`, separators `(",", ":")`, no trailing newline) | `ad192325ecedfcbee3cbcc734e95ae22249491644cec5f5deb3a3f0f555d0d49` | same | **match** |
| The 18 capsule members (bytes and SHA-256 each) | manifest | recomputed before any member was read | **18/18 match** |
| `control/PATH-CHECK-c3-second-read-briefs.json` | — | read | 9 files scanned, 0 findings |

- **Seal I cite:** `ad192325ecedfcbee3cbcc734e95ae22249491644cec5f5deb3a3f0f555d0d49`.
- **Run and stage:** `erdos-993-math-dre-20260926-r30-weighted-transport`, stage `cycle-3-second-read-SR-C3-3`.
- **Statement of record:** `cycles/cycle-3/stage6/SYNTHESIS.md` (member digest `f3855716…c28`). Origins, all capsule members:
  - T1's return (`f7da309f…cc40`);
  - C-T1-F's critique (`88bce337…61aa`);
  - C-T1-U's critique (`f5c5b3eb…561f`);
  - the T adjudication (`b8a19aa2…7f41`).
- **Registries:** the Stage 2 snapshot (443 claims) and the master authority (434 claims). The three refuted keys named in the
  brief are byte-identical in both.

**Read-boundary disclosures.**
1. **Harness-injected context.** The host injected the project `CLAUDE.md` and the user auto-memory index into my context at
   session start. I did not open either file, and nothing below relies on them.
2. **Order.** I verified the seal and the 18 digests first. I then read the protocol and the brief, then the boot files, then
   the other members.
3. **Boot files, partial display.**
   - `verity.md`: I displayed its first 120 lines, plus a `grep` of the remainder for the experiments and logs rules.
   - `startup-protocol.md`: I displayed its first 80 lines.
   - These are the boot reads. They supply no mathematical input.
4. **Capsule members read for content.**
   - In full: `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, the protocol, the brief, the path check, `control/C3-STAGE1-GATE.md`,
     the T1 return, both T1 critiques.
   - In part: the synthesis (lines 1–300 and 585–end; not the C3-LA1 Lean section); the T adjudication (lines 81–200,
     330–360, 436–480, plus a single-file `grep` for E1 terms); `cycles/cycle-2/CYCLE-CLOSE.md` (first 120 lines).
   - By single-file `grep` only: `control/C3-ALLOCATION.md` and `control/C3-STAGE6-CONTROLLER-FACTS.json`.
   - By Python JSON queries: both registries. I queried the three refuted keys, the nine other refuted mechanism keys, near
     neighbours, and ran an alias-pattern and keyword scan.
   - Hash only, not read: `control/SOURCE-DIGESTS.json`, `control/C3-STAGE6-PACKET-MANIFEST.json`.
5. **Searches.** Every `grep` was on a single capsule member. No `find`, `grep` or `rg` was rooted above a member. The only
   `find` was on my own scratch, to check for `__pycache__`, and it found none.
6. **Directories.** One `mkdir -p` plus `ls -la` of my own scratch and output directories. That listing named no other entries.
7. **Not read:** any seat, critic or adjudicator scratch, including `scratchpad/c3-*/` (none is a member of my capsule); every
   other return, critique, adjudication and second read; `sources/` beyond the authority registry; other experiment roots;
   Mathlib.
8. **Execution limits.** No Lean, no network, no installs. Python ran as `python3 -B` with the standard library and exact
   integers or `Fraction`. Every job ran in the foreground and none was left running.

## Statements read

- **SR-C3-3a (B1, E1, the reduction).** The claim as stated at synthesis B1 and adjudication T1-A1:
  - On `CB(d,m)` with `F ⊇` all private leaves, suppose that at rank `p` and for every `q ∈ [1, m]`, `ρ_q ≤ 1` and the
    type-path inequalities hold.
  - Then a fractional flow saturates every `r`-free source, with target load `ρ_q·w_F(A)`.
  - Hence (HALL-COND) holds for every `X ⊆ I_{p+1} ∖ sec`, with deletion arcs only.
  - Hypotheses listed: the literal CB tree and finiteness; no eligibility and no invariance.
  - The duty includes R4's "single logical point" ruling.
- **SR-C3-3b (the distinctions).** The claim, from the synthesis's last paragraph of `## Refuted or narrowed mechanisms`:
  - E1 is a fractional clone transport with load `ρ_q·w_F(A) ≤ w_F(A)`.
  - It is not an injection, not a per-leaf unit map and not an own-support rule, and it never handles the arm tag `v`.
  - Checked against the registered texts of `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`,
    `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT` and `E993-R23-LITERAL-DELETE-ONLY-HALL`.
- **SR-C3-3c (the key).** The synthesis proposes `E993-R30-CB-MARK-CLONE-TYPE-PATH-DELETION-TRANSPORT`, VERIFIED
  `proved_informal`, with statement B1 at its exact scope. Duties:
  - check the attribution;
  - check the name is a predicate the statement satisfies;
  - run an alias check;
  - write the registration text and the (HALL) scope-note pointer.

## Independent re-derivation

All definitions are from `SEMANTIC-CONTRACT.md` §1.

**The tree.** `CB(d,m)` (`d, m ≥ 1`) has:
- the path `r – s – v`;
- chokes `u_1..u_m`, each adjacent to `r`;
- supports `b_{i1..id}`, each adjacent to `u_i`;
- one private leaf `c_{ij}` adjacent to each `b_{ij}`.

So `n = 3 + m(2d+1)`, and `leafSet = {v} ∪ C` with `C = {c_{ij}}` (`|C| = dm`). The other vertices have degree at least 2:
`deg r = m + 1`, `deg s = 2`, `deg u_i = d + 1`, `deg b_{ij} = 2`. It is a tree, checked in code by edge count `n − 1` and then
BFS connectivity. The witness sets are `W_{c_{ij}} = N(b_{ij}) ∖ {c_{ij}} = {u_i}` and `W_v = N(s) ∖ {v} = {r}`.

**Step 0: weights (B11, T1's model).** Let `B` be `r`-free. Then `v` is inactive, because `W_v = {r}`. A private tag `c_{ij} ∈ F ∩ B`
is active iff `u_i ∈ B`. So with `F ⊇ C`, `w_F(B)` is the number of present private leaves whose choke is present. On the other
classes:
- sector members (`r, v ∈ B`) have weight `[v ∈ F]`;
- `R0` members (`r ∈ B`, `v ∉ B`) have weight 0, because `r ∈ B` excludes every choke.

My literal instrument checks this member by member on every enumerated set: 18 trees, every rank, and the tag sets
`F = leafSet`, `F = C`, and the observation set below. **B11 confirmed** (`proved_informal`, elementary). It is a companion to E1
and carries no key.

**Step 1: what a clone is.** Fix an `r`-free source `B ∈ I_{p+1}`. Let `Q := B ∩ {u_1..u_m}` and `q := |Q|`. A **clone** is a pair
`(B, x)` with `x ∈ F ∩ C` active in `B`, that is, `x = c_{ij}` with `u_i ∈ Q`. By Step 0, `B` has exactly `w_F(B)` clones.

Given `(Q, x)`, the rest of `B` splits into three kinds of position:
- **Boolean positions:** the other `qd − 1` private leaves of in-chokes. Each is free (present or absent). The supports
  `b_{i'·}` of in-chokes are excluded, being adjacent to `u_{i'}`.
- **Out-legs:** the `d(m − q)` legs of out-chokes. Each is in state `{∅, b, c}`.
- **The arm:** in state `{∅, s, v}`. This uses `r ∉ B`, and `s ~ v`.

No other adjacency constrains these positions: `c ~ b` only; `u_{i'} ~ r, b_{i'·}`; `s ~ r, v`. So the `r`-free sets with choke set
`Q` that contain `x` correspond one-to-one with

`P_q := B_1^{a} × Λ^{b}`, where `a := qd − 1`, `b := d(m − q) + 1`, and `Λ` is the 2-atom claw.

The rank in `P_q` is `|B| − q − 1`. Sources therefore sit at rank `j := p − q` and targets at rank `j − 1`. The poset depends only
on `q`, not on `Q`, on `x`, or on `F`.

**Step 2: why a clone's deletion target keeps the tag active.** E1 routes clone `(B, x)` only along deletions `B → A = B ∖ {e}`
where `e` is neither `x` nor a choke. These are exactly the cover relations of `P_q`:
- delete another in-choke leaf (a Boolean position); or
- delete an out-leg element or `s` / `v` (a ternary position).

Then `A` is independent, `|A| = p`, and `A` is `r`-free. `A` has the same `Q`, and `u_i ∈ A`, so `x` is still active in `A`. Hence
`(A, x)` is a clone of the target, and `w_F(A) ≥ 1`. Conversely, every target clone `(A, x)` with choke set `Q` is a rank-`(j−1)`
element of the same `P_q`, so target clones of `A` correspond one-to-one with its `w_F(A)` active tags.

**Step 3: the type-path transport.** An element of `P_q` has type `(α, β)`: `α` present Boolean positions and `β` non-empty
ternary positions, with `α + β` its rank. The number of elements of that type is `N(α, β) = C(a,α)·C(b,β)·2^β`.

Covers between types form two biregular families:
- **Boolean edges** `(α,β) → (α−1,β)`: degree `α` down and `a − α + 1` up.
- **Ternary edges** `(α,β) → (α,β−1)`: degree `β` down and `2(b − β + 1)` up.

So a flow decided between types and spread uniformly over the edges of each family is constant per element on each side. At
source rank `j` write `S_α := N(α, j − α)`; at target rank `j − 1` write `T_α := N(α, j − 1 − α)`, with zero outside the ranges.
Also write `r_k := Σ_α N(α, k − α) = [y^k](1+y)^a(1+2y)^b`, with `r_k := 0` for `k < 0`.

Source type `α` feeds target types `α − 1` (Boolean) and `α` (ternary). The type graph is therefore a path. Require every source
element to send exactly 1 and every target element to receive exactly `ρ := r_j / r_{j−1}`; this balances, since
`Σ_α S_α = r_j = ρ·r_{j−1}`. The totals are then forced:
- `g_α` (Boolean, out of source type `α`) `= ρ·T_{<α} − S_{<α}`;
- `h_α` (ternary) `= S_{≤α} − ρ·T_{<α}`.

In particular `g_0 = 0`. And `h_α = 0` whenever `β = 0`: then `T_α = 0`, and `h_α + g_{α+1} = ρ·T_α = 0` with both nonnegative.

**The type-path inequalities, stated exactly.** Clearing denominators, for every `α ∈ [0, a]`:

`(TP-g)  r_j·T_{≤α} ≥ r_{j−1}·S_{≤α}`   (that is, `g_{α+1} ≥ 0`)
`(TP-h)  r_{j−1}·S_{≤α} ≥ r_j·T_{<α}`   (that is, `h_α ≥ 0`)

These are C-T1-F's two prefix conditions (critique F2), and the adjudicator's cleared forms. Together with `r_j ≤ r_{j−1}`
(that is, `ρ_q ≤ 1`), they are the criterion at `q`.

**Step 4: summing the clones.** Let `f(B, A) := Σ_x f((B, x), (A, x))`. Each clone sends exactly 1, so each `r`-free source sends
`w_F(B)`; weight-0 sources send 0.

Each target clone of an `r`-free target `A` with `q ≥ 1` receives exactly `ρ_q`. So the load on `A` is exactly `ρ_q·w_F(A)`, which
is at most `w_F(A)` iff `ρ_q ≤ 1`. The load is 0 on:
- sector targets and `R0` targets (`r ∈ A`, never produced by an `r`-preserving deletion);
- `q = 0` targets (weight 0; no clone class).

Every positive `f(B, A)` lies on a literal (D) arc.

**Step 5: saturation gives Hall.** Take any `X ⊆ I_{p+1} ∖ sec`. Its members are `r`-free sources and `R0` sources, and the `R0`
sources have weight 0. Then:

`Σ_{B∈X} w_F(B) = Σ_{B∈X} Σ_A f(B,A) ≤ Σ_{A∈N_D(X)} Σ_{B'} f(B',A) ≤ Σ_{A∈N_D(X)} w_F(A) ≤ Σ_{A∈N(X)} w_F(A)`.

Here `N_D` is the deletion neighbourhood and `N` the (D) ∪ (S) neighbourhood. The last step uses `N_D ⊆ N` and `w_F ≥ 0`. This
is (HALL-COND) for every non-sector family, witnessed by deletion arcs alone. A rational flow suffices; integrality is not
needed.

**Where each hypothesis enters.**
- **The literal CB tree:** Step 0 (`W_c = {u_i}`, `W_v = {r}`) and Step 1 (the product structure, from the adjacency list).
  `IsTree` is not used beyond this concrete structure.
- **`F ⊇ C`:** only to identify `w_F(B)` with the clone count. My observation run (below) shows the construction also works for
  `F ⊉ C`. That run is outside the statement, and I do not propose widening.
- **Finiteness:** all layers, sums and posets are finite.
- **The criterion:** in Steps 3–4.
- **Eligibility:** enters nowhere. B1 is right that the lemma is a rank-level statement. When E1 is applied to (HALL) at a row,
  `F = F_p(T) ⊇ C` must be derived at that row. That is a per-row fact outside E1: `bounded_computation` at the D1–D3 rows.
- **Invariance:** enters nowhere. E1 covers every `X`, invariant or not.
- **The arm tag `v`:** never a mark.

**ℕ-subtraction guards (found in this read).**
- `a = qd − 1` needs `q, d ≥ 1`.
- `b = d(m − q) + 1` needs `q ≤ m`.
- **`j = p − q` must be an integer, with `r_{−1} := 0`.** In ℕ with truncation, the class `q = p` (possible when `p ≤ m`) has
  `j = 0` and `j − 1` truncated to `0`. That gives `r_j = r_{j−1} = 1`, a spurious "`ρ = 1`" pass. The truth is that its source
  clones `(Q ∪ {x}, x)` have **no** mark- and choke-preserving deletion. With the integer convention the criterion correctly
  fails there, since `r_0 = 1 > 0 = r_{−1}`.
- Consequence: **the criterion forces `p ≥ m + 1`.**
- Also, `ρ_q` as written in B1 is undefined when `r_{j−1} = 0`. The cleared form `r_j ≤ r_{j−1}` covers every case uniformly: it
  is vacuous for empty classes (`r_j = 0`, or `q > p`) and fails for `j = 0`.
- Repair 1 below puts this on the face.

**Is it the same logical point in both critics (R4)?** **Yes for the reduction; no for the finite criteria.**
- **C-T1-U's (TL) is the same reduction.** It is `(B, c) ↦ B ∖ {u_i, c} ∈ I(G_c)`, with `c`- and `u_i`-preserving deletions, and
  "one unit per active tag of the target". That is the same clone step as C-T1-F's A1. After (BNM)'s block split by `J` (other
  chokes present, so `Q` is fixed), it routes along the same mark- and choke-preserving covers.
- **The two finite checks test different criteria.** C-T1-F's `crit.py` (with the adjudicator's `adj_clone_criterion.py`) tests
  (TP-g), (TP-h) and `ρ_q ≤ 1` on the arm-merged `P_q`. C-T1-U's `blocks.py` tests the rank monotonicity `N_{r−1} ≥ N_r` on the
  arm-fixed blocks `Λ^{d(m−q)} × B_1^{qd−1}`, separately for O and for S/V. That test is sufficient only through the
  Harper / Hsieh–Kleitman product theorem, cited from memory and not a run source. Its minimum ratios (1.0099 O, 1.0033 S/V)
  differ from C-T1-F's `1/ρ_1 ≈ 1.0055`.
- **Precision on the brief's wording.** The two *critics'* finite checks are therefore two codes on two *different* criteria,
  downstream of one reduction. R4 as written in the synthesis is exact: "two independent codes on one criterion" there means
  C-T1-F and the T adjudicator. The brief's paraphrase is looser.
- **Consequence.** Neither pair is two independent instruments *for the reduction*. The reduction stands on its proof, which I
  have re-derived above, and on literal validation. The two-instrument rule governs cuts; this is a positive record.
- **R4's ruling stands:** E1 is a single logical point, and it is the weakest input of D1–D3.

**Own instrument (numeric checks).** Scratch: `scratchpad/c3-sr-SR-C3-3/`. The instrument was written from the contract, and no
seat, critic or adjudicator code was read.

`sr3.py` works on 18 literal trees: `CB(1,1..7)`, `CB(2,1..4)`, `CB(3,1..3)`, `CB(4,1..2)`, `CB(5,1)`, `CB(6,1)`, orders 6–24, up
to 238,749 independent sets. At every rank `1 ≤ p ≤ α` it:
- tests the tree;
- enumerates independent sets;
- computes `α` and `x` through rank `α` (terminal difference explicit), and eligibility;
- derives `F_p` from literal `Δ_p(T − v)`;
- computes `q_v` literally;
- **asserts WID** in general-`F` form (`supply − capacity = Σ_{v∈F}[q_v(p) − q_v(p−1)]`) on every row;
- evaluates my own criterion implementation;
- when the criterion holds, **builds the E1 clone flow explicitly on the literal network and verifies it arc by arc**:
  - every arc a literal (D) arc;
  - every non-sector source sends exactly `w_F(B)`;
  - every `r`-free `q ≥ 1` target receives exactly `ρ_q·w_F(A)`;
  - all other targets receive 0;
- runs **literal integer Dinic max-flow** on the deletion-only network restricted to sources in `I_{p+1} ∖ sec`. Saturation there
  is equivalent to deletion-neighbourhood (HALL-COND) for every non-sector `X`.

Tag sets: `F = leafSet` and `F = C` (in scope), and `F = C` minus one leaf (labelled `OBS`, outside the hypothesis).

Every row reports `n`, `α`, `x`, `p`, eligibility, `|F|`, supply, capacity and `S` (`out_sr3.json`).

| Check (`out_summary.json`) | Count |
|---|---|
| In-scope rows (156 ranks × 2 tag sets) / WID asserted | 312 / all 465 rows including `OBS` |
| Criterion holds with positive non-sector supply | 41 `(tree, p)` instances (82 rows) |
| **E1 flow built and verified literally** | **82/82** (plus 41 `OBS` rows) |
| **Criterion holds but literal restricted flow fails (`CRITERION-UNSOUND`)** | **0** |
| Criterion fails (some `ρ_q > 1`) but literal flow saturates | 12 instances (24 rows) |
| Criterion fails and literal flow fails | 85 instances (170 rows), all non-eligible low ranks |
| `ρ_q ≤ 1` but a type-path inequality fails (rows) | 0 |

The **eligible** row: `CB(1,7)/10` (`n 24`, `α 15`, `x 8`; `|F_p| = 8`, the whole leaf set; supply `29190`, capacity `58002`,
`S = −28812`). There the criterion **fails**: `ρ_7 = 50/27` and `ρ_6 > 1`. Yet literal deletion-only flow saturates the non-sector
sources. So the criterion is sufficient and not necessary, which is how B1 states it. Every other small-tree row is at a
non-eligible rank. Those rows validate a rank-level lemma that has no eligibility hypothesis. They are not evidence about
(HALL) or about the aggregate.

`crit_rows.py` is criterion arithmetic only. It does not derive `F_p`, does not assert WID, and is not a network row:
- `n`, `α`, `x` come from the closed-form polynomial `(1+2y)[(1+2y)^d + y(1+y)^d]^m + y(1+y)(1+2y)^{dm}`, whose parts are checked
  against enumeration on the 18 trees.
- At the first ranks it reproduces `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492` (`n` 1465/1516/1567, `α` 775/802/829, `x`
  458/474/490). The criterion holds for every `q`, `argmax ρ` is at `q = 1`, and **`ρ_1` equals the record's exact fractions**:
  - `460421124882845/462938713343604`
  - `1698319298589907/1707291739633300`
  - `4838946572060835/4863675235331932`
  - decimals 0.99456172 / 0.99474464 / 0.99491564.
- So my code evaluates the *same* criterion as C-T1-F and the T adjudicator.
- The other 174 ranks, `F_p` and WID at these rows are SR-C3-4's object; I did not check them.
- Small eligible rows, criterion only: it holds at `CB(3,5)/14`, `CB(4,4)/14`, `CB(3,6)/16`, `CB(4,6)/19, 20`. It fails at
  `CB(1,7)/10`, `CB(1,8)/11`, `CB(1,9)/12`, `CB(2,5)/10`, `CB(2,6)/12`, `CB(3,5)/13` and `CB(3,6)/15`, each time at the largest
  `q` values.

`summarize.py` also runs a criterion-only sweep (`d ≤ 6`, `m ≤ 12`, every rank, every non-vacuous `q`): 14,118 evaluations and
5,717 with `ρ_q ≤ 1`. In none of those does a type-path inequality fail.

This fits a structural fact. By symmetrizing over `S_a × (S_2 ≀ S_b)`, which is transitive on each edge family, the type-path
inequalities at `(j, j−1)` are equivalent to normalized matching of `P_q` between those ranks. The product theorem C-T1-U cites
would make them automatic. **Observation only:** E1 checks them directly and imports nothing, which is to its credit.

## Findings and repairs

1. **Repair 1 (3a: the criterion's exact form; ℕ guard; load scope).** B1 leaves three things implicit:
   - the type-path inequalities are not stated;
   - `ρ_q` is undefined when `r_{j−1} = 0`;
   - the target load `ρ_q·w_F(A)` holds only for `r`-free targets with `q ≥ 1`, and is 0 elsewhere.

   The registration text below states the criterion in cleared, integer-rank form, (TP-g) and (TP-h) with `r_q(k) := 0` for
   `k < 0`. It records that the criterion forces `p ≥ m + 1`. It states the load exactly, and writes the conclusion as the
   deletion-neighbourhood inequality, which implies (HALL-COND). None of this changes the mathematics, which I confirm.
2. **Finding (R4, 3a).** The reduction is one logical point, so R4 is confirmed. The two critics' finite checks are on
   *different* criteria, not "two codes on one criterion". The one-criterion replication is C-T1-F plus the T adjudicator, and
   now my code at the three first ranks. None of these is an independent instrument for the reduction; the proof is. C-T1-U's
   (BNM) route rests on an uncarried import and **is not part of this key**. At most it corroborates the finite rows
   conditionally, as the synthesis already says.
3. **Finding (3b).** E1 *is* tag-preserving clone by clone: `(B, x)` only ever reaches `(A, x)`. The honest distinction from
   the per-leaf and support-preserving refuted mechanisms is therefore not "E1 is not per-tag". It rests on four points:
   - (i) object: a weighted fractional flow on the (D) network with capacities `w_F`, not a linear injectivity statement and
     not an aggregate-token injection;
   - (ii) relation: mark- *and every-choke*-preserving deletions only;
   - (iii) scope: one tree family, one rank, conditional on the criterion, never universal;
   - (iv) the positive-term tag `v` and the sector are **excluded by hypothesis**, so the obstructions that refuted those keys
     (a positive tag or support block) are outside E1's scope rather than overcome.

   The three distinction rows say this.
4. **Repair 2 (3c: the key name is not a predicate the statement satisfies).** Read as a predicate,
   `…-CB-MARK-CLONE-TYPE-PATH-DELETION-TRANSPORT` says "on `CB` there is a mark-clone type-path deletion transport". That is
   stronger than B1 in two ways:
   - the transport exists only where the criterion holds (it fails at the eligible `CB(1,7)/10`, where `ρ_7 = 50/27`);
   - it serves only non-sector sources (sector deletion transport fails at `CB(8,·)`'s first ranks).

   Renamed to **`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`**, which states the implication, the
   scope and the relation. The synthesis's name is kept as an alias. **Controller action:** registration item 9 (D1–D3) names
   "weakest input key 8"; point it at the renamed key.
5. **Alias check (3c).**
   - The proposed key and its rename are absent from both registries.
   - 0 `alias_patterns` match the name or its key terms; no `aliases` entry matches.
   - No claim mentions clone, type-path or tag-lift.
   - Nearest neighbours, all distinct:
     - (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`: an unweighted sector shadow over an induced perfect
       matching; E1 excludes the sector.
     - `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT`: a quotient lift that asserts no feasibility.
     - `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`: a sector-only deficit formula.
     - `E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD`: the arm tag's r23 Delete/Retag neighbourhood.
     - `E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE`: one graph, the arm cut.
   - **No alias.**
6. **Attribution (3c).** The synthesis's line "C-T1-F, C-T1-U; T adjudicator" is right but incomplete for the face.
   - T1 (Claude Sonnet 5) supplies the choke-forest weight model (B11) and the `q`-class structure the clone poset refines.
   - The network (HALL), the active-tag weight and the `CB` family come from the Codex lower-region run
     (SEMANTIC-CONTRACT §3).
   - C-T1-U's (TL) is concordant for the reduction only; its (BNM) certification is excluded.
   - The registration text carries all of this.
7. **Other refuted keys (fence §3.2).** I read the other nine refuted mechanism statements in the snapshot:
   `…-FIXED-GAMMA-HALL`, `…-TAG-CLOSED-CUT-HALL`, `…-HOT-TAG-SINGLETON-HALL`, `…-ZERO-RETAG-EXPORT-…`,
   `…-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION`, `…-C4-T4-SIGNED-CROSS-TAG-INJECTIVITY`, `…-LOCAL-MARKED-ADDABILITY-…`,
   `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` and `E993-R28-TREE-LEAF-SLOT-DOMINANCE`.
   - None is revived. E1 uses neither the literal Delete/Retag relation nor tag-closed or singleton cuts.
   - It uses no occupancy, addability or covariance inequality, and no signed cross-tag linear map.
   - It never touches a tag with a positive term. Specifically, `…-HOT-TAG-SINGLETON-HALL` concerns tags with `g_v > 0`, and E1
     never cuts or routes such a tag.
8. **No repair to B11 or R4.** B11 (`proved_informal`, companion, no key) is confirmed. The synthesis's R4 text is confirmed as
   written.

## Registration text

```text
KEY: E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: Let d, m >= 1 and T = CB(d,m): the path r - s - v, m chokes u_1..u_m adjacent to r, d supports b_{i1..id} adjacent to each u_i, and one private leaf c_{ij} adjacent to each b_{ij} (n = 3 + m(2d+1); leafSet(T) = {v} ∪ C with C the dm private leaves). Let F be a set of leaves of T with C ⊆ F, let p be a natural number, let w_F be the active-tag weight (SEMANTIC-CONTRACT §1.2), and let sec := {B ∈ I_{p+1}(T) : r ∈ B and v ∈ B}. For 1 <= q <= m put a_q := qd − 1 and b_q := d(m − q) + 1; for integers α, k put N_q(α, k) := C(a_q, α)·C(b_q, k − α)·2^{k − α} when 0 <= α <= a_q and 0 <= k − α <= b_q, and 0 otherwise; put r_q(k) := Σ_α N_q(α, k) = [y^k](1 + y)^{a_q}(1 + 2y)^{b_q}, so r_q(k) = 0 for k < 0. With j := p − q computed in the integers, S_α := N_q(α, j) and T_α := N_q(α, j − 1), the CRITERION at (d, m, p) is: for every q ∈ [1, m], (i) r_q(j) <= r_q(j − 1), and (ii) for every α ∈ [0, a_q], r_q(j)·Σ_{α' <= α} T_{α'} >= r_q(j − 1)·Σ_{α' <= α} S_{α'} and r_q(j − 1)·Σ_{α' <= α} S_{α'} >= r_q(j)·Σ_{α' < α} T_{α'} (the type-path inequalities). If the criterion holds, then there is a nonnegative rational function f on the deletion arcs (D) from I_{p+1}(T) ∖ sec to I_p(T) such that Σ_A f(B, A) = w_F(B) for every B ∈ I_{p+1}(T) ∖ sec; Σ_B f(B, A) = ρ_q·w_F(A) <= w_F(A) for every target A with r ∉ A and q := |A ∩ {u_1..u_m}| >= 1, where ρ_q := r_q(p − q)/r_q(p − q − 1); and Σ_B f(B, A) = 0 for every other target. Consequently, for every X ⊆ I_{p+1}(T) ∖ sec: Σ_{B ∈ X} w_F(B) <= Σ_{A ∈ N_D(X)} w_F(A) <= Σ_{A ∈ N(X)} w_F(A), where N_D is the deletion neighbourhood and N the (D) ∪ (S) neighbourhood; that is, (HALL-COND) holds for every non-sector family, witnessed by deletion arcs alone. Proof of record: for r ∉ B, W_{c_{ij}} = {u_i} and W_v = {r}, so w_F(B) is the number of present private leaves whose choke is in B; split B into one clone (B, x) per such active tag x; for fixed choke set Q (|Q| = q) and mark x, the r-free sets with choke set Q containing x correspond one-to-one with P_q = B_1^{a_q} × Λ^{b_q} (the other in-choke leaves are Boolean; each out-leg is {∅, b, c}; the arm is {∅, s, v}), at rank |B| − q − 1, and the deletions of neither x nor any choke are exactly its covers, so every target clone (A, x) keeps x active and the target clones of A are its w_F(A) active tags; covers between element types (α, β) are biregular (Boolean: α down, a_q − α + 1 up; ternary: β down, 2(b_q − β + 1) up), so the type-symmetric transport from rank j to rank j − 1 in which every source clone sends 1 and every target clone receives ρ_q is a transport on a path whose forced flows are nonnegative exactly under (ii); summing clones gives f, and a saturating rational flow gives the Hall inequality.
SCOPE: One tree family CB(d,m), one rank p at a time, and only the non-sector source families X ⊆ I_{p+1} ∖ sec; F any leaf set containing all private leaves (whether v ∈ F is irrelevant, since v is inactive in every r-free set). The criterion is a hypothesis checked per (d, m, p) in exact integers; it is sufficient, not necessary (at the eligible CB(1,7), p = 10, it fails with ρ_7 = 50/27 while literal deletion-only flow saturates the non-sector sources), and it forces p >= m + 1 (for p <= m the class q = p has j = 0, and r_q(0) = 1 > 0 = r_q(−1)). ℕ guards: q >= 1 and d >= 1 give a_q >= 0; q <= m gives b_q >= 1; j and j − 1 are integer ranks (a truncated ℕ subtraction at q = p would falsely pass). No eligibility, invariance or selector hypothesis enters; to apply the statement at a (HALL) row one must separately derive F_p(T) ⊇ C at that row (bounded_computation at the rows where it has been used). The arm tag v is never a mark, and sector families are outside the statement.
ATTRIBUTION: C-T1-F (Claude Opus 5.5; A1: the mark-clone product-poset reduction and the explicit type-path criterion, arm merged); C-T1-U (Claude Opus 5.5; (TL) tag-lifting: the same reduction derived independently; its (BNM) certification via the Harper / Hsieh–Kleitman product theorem, cited from memory, is not part of this key); T adjudicator (Claude Opus 5.5; hand check of the bijection, biregular degrees and path conditions; independent criterion code); T1 (Claude Sonnet 5; the choke-forest weight model and the q-class structure, B11); the transport network (HALL), the active-tag weight w_F and the CB family: Codex (GPT-6 Astra/Sol/Luna), the lower-region run and its corrections; isolated second read SR-C3-3 (Claude Opus 5.5; the cleared integer-rank criterion, the ℕ guard and p >= m + 1, the load scope, the rename; literal validation on 18 CB trees, 82 explicit E1 flows verified arc by arc, 0 unsound).
FENCES: Not (HALL) and not a restricted-scope (HALL) theorem: sector families (r, v ∈ B) are outside the statement, and E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. A criterion at a rank, not a family theorem: it does not assert that the criterion holds at any (d, m, p); the uniform statement (the criterion at every eligible p of every CB(d, m)) is OPEN. Finite rows at which the criterion has been verified register separately (D1–D3, computer_assisted, SR-C3-4), with this key as their weakest input. No refuted mechanism is revived (distinction rows R30-C3-E1-VS-PER-LEAF-DOWN-MAP-INJECTIVITY, R30-C3-E1-VS-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT and R30-C3-E1-VS-R23-LITERAL-DELETE-ONLY-HALL). The primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched. No RTree or governed-model assertion. No census value enters. The deletion-only conclusion is scoped to non-sector families at criterion ranks and is never a universal deletion-only claim.
ALIASES: E1 (r30 Cycle 3 mark-clone reduction); C-T1-F A1; C-T1-U (TL) tag-lifting, reduction part only; E993-R30-CB-MARK-CLONE-TYPE-PATH-DELETION-TRANSPORT (name proposed at Stage 6, superseded by this read because as a predicate it asserts the transport unconditionally)
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r30 C3; SR-C3-3] On CB(d,m) with a leaf set F containing every private leaf, if the mark-clone criterion (key E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL: ρ_q <= 1 and the type-path inequalities for every q ∈ [1, m], in cleared integer-rank form) holds at rank p, then (HALL-COND) holds for every source family avoiding the root-plus-arm sector, with deletion arcs alone (proved_informal). The statement is a criterion at a rank, not a family theorem. Sector families, where the arm tag's term is positive at the first eligible ranks of CB(8,86), CB(8,89) and CB(8,92), are outside it. Applying it at an eligible row needs F_p(T) ⊇ C derived at that row. The finite rows register under the D1–D3 key (computer_assisted; SR-C3-4). This key stays OPEN.
```

```text
DISTINCTION ROW: R30-C3-E1-VS-PER-LEAF-DOWN-MAP-INJECTIVITY
KEY: E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY
TEXT: The refuted key asserts, for every eligible ordinary tree and every favorable leaf v, that the linear map d_p (marked independent p-sets of H_v to marked (p−1)-sets, each basis set sent to the sum of its one-vertex deletions still meeting W_v) is injective; it is refuted on an order-91 tree. E1 (E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL) differs in four ways. Object: E1 is a weighted fractional flow with target loads ρ_q·w_F(A) <= w_F(A) and a Hall conclusion; it asserts nothing about the linear rank of any map. Relation: E1 uses only deletions that preserve the mark and every choke, a strict sub-relation of the support of d_p. Scope: one tree family CB(d,m), at one rank, conditional on an exact criterion; no universal claim over trees, ranks or leaves. Tags: E1 is tag-preserving clone by clone, but it is applied only to the private tags (the arm tag v is never a mark, and sector families are excluded), so a leaf with a positive term is outside its scope by hypothesis rather than overcome. The refuted statement is not revived.
```

```text
DISTINCTION ROW: R30-C3-E1-VS-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT
KEY: E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT
TEXT: The refuted key asserts, on every governed base-rank row, an exact support-label-preserving unit-token injection from positive to negative favorable-leaf tokens of the aggregate encoding; it is refuted by a singleton favorable support block with a positive term (T_22, order 91). E1 (E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL) moves no aggregate tokens and matches no positive to negative terms. It is a fractional flow between independent-set layers I_{p+1} and I_p of the ordinary tree CB(d,m) along literal deletion arcs, with capacities w_F(A) (not unit), and it is not an injection. It makes no governed-model (RTree) assertion. It holds at one rank, conditional on an exact criterion, and only for non-sector families. Its clones preserve their tag, but it is never applied to a tag with a positive term: the arm tag v and the sector, the analogue of the obstruction that refuted this key, are excluded by hypothesis. The refuted statement is not revived.
```

```text
DISTINCTION ROW: R30-C3-E1-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key asserts, for every finite ordinary tree and every p >= x(T) + 2 under the r23 literal contract, unweighted deletion-only Hall |X| <= |Gamma_Delete(X)| for every X in the complete tagged top side; it is refuted at CB(8,92) by the full arm-tag top cut. E1 (E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL) differs in scope and weight. Weight: the active-tag weight w_F with capacities w_F(A), under the (D) arcs of the r30 network. Scope: one tree family CB(d,m), one rank, conditional on an exact criterion, and only source families avoiding the root-plus-arm sector, which is where the arm tag's deletion deficit and the r23 witness live. The deletion-only conclusion is never universal: at the first eligible ranks of CB(8,86), CB(8,89) and CB(8,92) the sector is deletion-deficient, and E1 says nothing there. The refuted statement is not revived.
```

## Verdicts

verdict[SR-C3-3a]: confirmed_with_repairs
verdict[SR-C3-3b]: confirmed
verdict[SR-C3-3c]: confirmed_with_repairs

- **SR-C3-3a.** The reduction is correct at `proved_informal`. I re-derived it step by step and validated it literally: 82
  explicit E1 flows built and verified arc by arc on 18 `CB` trees, and 0 `CRITERION-UNSOUND` in 312 in-scope rows. My criterion
  code reproduces the record's first-rank `ρ_1` fractions exactly.
  - Repairs: the criterion is stated in cleared integer-rank form, with the type-path inequalities written out; the ℕ guard is
    named, and with it `p ≥ m + 1`; the load equality is scoped to `r`-free `q ≥ 1` targets.
  - Eligibility does not enter. B11 is confirmed. R4 is confirmed: one logical point, with the two critics' finite checks on
    different criteria.
- **SR-C3-3b.** The synthesis's distinction holds against all three registered texts. The rows above add the precision that E1
  is tag-preserving clone by clone, and that the positive-term tag is excluded by hypothesis.
- **SR-C3-3c.** `proved_informal` is confirmed. No alias exists.
  - Repair: the name is replaced by a predicate the statement satisfies,
    `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, with the old name kept as an alias.
  - The attribution is completed.
  - Register the `KEY:` block, then the scope note and the three distinction rows. Repoint registration item 9's
    weakest-input reference to the new name.

## Artifact inventory

All scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-sr-SR-C3-3/`.
- Standard library only, run with `python3 -B`; no `__pycache__`.
- Exact integers and `Fraction` throughout.
- Every job ran in the foreground; none is running.
- Nothing was written outside this scratch directory and this file.
- No sealed member was edited.

| File | SHA-256 | Purpose |
|---|---|---|
| `sr3.py` | `86b9ccb361d89f10bcfb6137c55a7affc7ab56a99d050948b6b1d824146def55` | Literal instrument: tree test; enumeration; `α`, `x` through `α`; eligibility; derived `F_p`; literal `q_v`; WID assertion; own E1 criterion; explicit E1 clone flow built and verified; literal Dinic on the non-sector deletion network |
| `crit_rows.py` | `8f879e223f87a05686522cae3107acfdfe37d20e7241be0980f0346825912245` | Criterion arithmetic (closed-form `n`, `α`, `x`): small eligible rows; the first ranks of the three `CB(8,·)` rows against the record's `ρ_1` fractions |
| `summarize.py` | `87e5efe0e3ecac9700b8b26a41082b4068490c654e106c5c0bbcb148026a4a8d` | Summary counts; criterion-only redundancy sweep (`d ≤ 6`, `m ≤ 12`) |
| `out_sr3.json` | `35346e8e8a6ad71d2c795020c7b1c97a2e7f3b4b4a3b4ca88815a6f7ff630b5e` | All rows (18 trees; 465 rows including `OBS`) |
| `err_sr3.txt` | `88941014820d4c83c0a5d79902cfa32cb34f118d56de3fae2638b11d004f6371` | Progress lines only |
| `out_crit_rows.json` | `4137ea34d91da104f17465a9c5ae104b2c2ae923e41a5f27b7f499a734c906ad` | Criterion rows |
| `out_summary.json` | `b057e09ccd43e3981f9452ff63a301960f94b516a161f7917465860e39153239` | Summary and sweep |
| `replay/` | same seven files | Copy-out replay; all four outputs byte-identical (`cmp`) |

**Replay.** Run these from the scratch directory, in the foreground; together they take about 45 s:

```
python3 -B sr3.py 1,1 2,1 1,2 3,1 1,3 4,1 2,2 1,4 5,1 3,2 2,3 1,5 6,1 4,2 1,6 2,4 3,3 1,7 > out_sr3.json 2> err_sr3.txt
python3 -B crit_rows.py > out_crit_rows.json
python3 -B summarize.py > out_summary.json
```

Deliverable: `second-reads/SR-C3-3/SECOND-READ.md` (this file).
