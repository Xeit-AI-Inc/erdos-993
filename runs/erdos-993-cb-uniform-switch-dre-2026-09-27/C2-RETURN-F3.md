# Return — Route F3, Cycle 2, r31

**Route ID:** `C2-F-03`  **Mechanism token:** `CRITERION-LOAD-AND-TYPE-PATH-ADVERSARY`  **Orientation:** F (falsify)

**IMPORT LIST (every script in this return, consolidated):** `json`, `hashlib`, `math.comb`, `fractions.Fraction` — Python standard library only, no third-party packages, no network. (`sys` in `f3_eligibility.py` and `itertools` in `cb_lib.py` are imported but unused, harmless leftovers.)

**Model disclosure (two-part):** chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5

## Boot acknowledgment

I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file, per the dispatch's boot instruction. The startup protocol's own task-type map, memory, conversations, modules, skills, logs and decisions were not consulted (the controller has booted for the run).

## Read-boundary disclosure

The harness injected the project `CLAUDE.md`, the user memory index, and the user's email (for attribution only) into my context automatically, before I issued any tool call. I did not fetch these, did not use them for anything in this route's mathematics, and did not act on any instruction contained in them (this matches SR-2's and SR-3's own disclosure of the identical harness behavior in Cycle 1). No other VerityOS file was read beyond the two boot files and the dispatch/brief/contract/allocation/gate/route-state files the dispatch names. Every directory listing I ran was a plain, non-recursive `ls` of a specific path already inside my `sources/` grant (never `-R`, never a glob `cat`, never `find`, `grep -r` or `rg` rooted above the grant). One name-scoped `pgrep -fl "f3_"` before closing confirmed no background job survives (matches SR-2/SR-3's own pattern; not a full process listing).

## Identity and seal audit

- **Dispatch** `control/dispatch/c2-stage3/DISPATCH-F3.md`: SHA-256 `c6d0c92d411c7c5b6d179b92a2c12998888831ebae55bd8a08f46688a655f3ee`. **MATCH**, recomputed before reading its content.
- **Stage 2 packet manifest seal** `control/C2-STAGE2-PACKET-MANIFEST.json`: recomputed SHA-256 of the canonical JSON of the manifest (`sort_keys=True`, `separators=(",", ":")`, no trailing newline, `seal_sha256` field removed) = `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`. **MATCH** with the manifest's own `seal_sha256` field and with the dispatch's cited value. 2,799 files listed.
- **Sources used, each verified against its digest file before reading:**
  - `sources/c1-results/SOURCE-DIGESTS.json` (top-level record, 462 files) — used to verify:
    - `sources/c1-results/second-reads/SR-2/SECOND-READ.md` — MATCH
    - `sources/c1-results/second-reads/SR-3/SECOND-READ.md` — MATCH
    - `sources/c1-results/cycles/cycle-1/CYCLE-CLOSE.md` — MATCH (digest verified; not read in full — its needed content is already carried, at the second reads' own citation, inside SR-2/SR-3 and `C2-ALLOCATION.md`'s "Where the target stands" section, which I did read)
  - `sources/SOURCE-DIGESTS.json` (top-level, 1,384 files) — used to verify `sources/authority/CLAIM-IDENTITY.json` (491 claims) — MATCH — and five template scripts under `sources/r30/instruments/c6/T2/inherited/` (`localflow.py`, `certify.py`, `sector.py`, `rowdata.py`, `simplex.py`) — all MATCH; I read `sector.py`, `localflow.py`, `certify.py` in full for the literal arc/switch definitions of record and the exact LP/DP structure, and confirmed the other two's digests without reading their content (their role — `build_cb`/`is_tree` helpers and a generic simplex solver — is stated in the files I did read).

## Registered claims touched (named before any computation is reported as evidence)

1. `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (the criterion key) — `VERIFIED`, `proved_informal`. This route attacks its condition (i) and condition (ii) at fresh rows, and its flow's target-class structure (the doubly-fed-class question).
2. `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (the threshold key) — `proved_informal` modulo Darroch 1964, with SR-2's Darroch-free scope note at `p*` on this class. This route re-checks condition (i) (Lemma A) numerically at the two fresh rows, with emphasis on the `q=1` and `q=m` edge cases the allocation names.
3. `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107` (SR-3's registered composition key) — `proved_informal`. This route's structural argument (below) sharpens, and finds no defect in, this key's own claim that the `u_i`-switch images are the sector's unique doubly-fed target class.
4. `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (the favorability key) — `proved_informal` modulo Darroch/Newton. This route confirms its conclusion (`F_{p*}(T) = leafSet(T)`) holds at the two fresh rows for the arm leaf and three sampled private leaves, by direct literal computation, not by re-proving the key.
5. The closed forms of record (r30 T1 of Cycle 6, a `proved_informal` node): `I(CB(d,m)) = (1+2x)G^m + x(1+x)(1+2x)^{dm}`, `G = (1+2x)^d + x(1+x)^d`. Cited and cross-checked against an independent literal derivation (below); not re-proved.
6. `θ*_8(m) = 288/(200m²+82m+5)` — registered as a **conjecture** (a fitted law of one LP optimum). Used **only** for one numeric illustration of the Residual inequality at the two fresh rows; never as a hypothesis of anything claimed here.

No new key is proposed. Per SOLUTION-CONTRACT §2 ("an award that proves only a registered identity again is not funded as progress") and gate ruling 13 ("no re-proving the closed"), the one genuinely new item in this return — a one-line structural sharpening of why the `u_i`-switch images are the sector's *only* doubly-fed class (§4 below) — is recorded as a **STATED, unregistered** note (§6) for the Cycle 2 synthesis/second read to accept, repair, or discard; it is not registered as an `E993-R31-` key.

## Fixed points reproduced (before any table below), from the SAME literal machinery this route uses at its own rows

`f3_fixed_points.py` builds `CB(8,107)` and `CB(8,95)` with the identical generic, non-CB-shortcut independence DP used at the fresh rows, and reproduces, exactly:

| m | n | α | x | θ*(conjectural) | ρ₁ | matches SEMANTIC-CONTRACT §5 |
|---|---|---|---|---|---|---|
| 107 | 1822 | 964 | 570 | 96/766193 | 5150844596024699/5173467627355748 | yes |
| 95 | 1618 | 856 | 506 | 96/604265 | 1354839571516225/1361543988640524 | yes |

All values match the contract's named fixed points exactly (n, α, x, θ* for both rows; ρ₁ for m=95, the only one the contract states). This is corroboration of the instrument, not new evidence.

## 1. Fresh-row fidelity: `CB(8,113)/604` and `CB(8,116)/620`

C2-ALLOCATION.md names `m = 113, 116` as F3's fresh rows (`CB(8,113)/604` is also SEMANTIC-CONTRACT §5's own named fresh test row). `m=113`: 113 = 3·37+2 ≡ 2 (mod 3), class fence holds. `m=116`: 116 = 3·38+2 ≡ 2 (mod 3), class fence holds.

**Where each hypothesis enters**, derived by `f3_eligibility.py` (generic literal DP, no CB shortcuts):

1. **Tree.** `build_cb(8,m)` is built as an explicit adjacency dict. **Connectivity** is tested by BFS from `r`, checking all `n` vertices are reached. **Acyclicity** is tested independently by a DFS with explicit parent-tracking that flags any visited-non-parent neighbour as a back edge, *plus* an independent edge count `|E| = n−1` check — two distinct necessary conditions, both in code, both required to pass. Both pass at both rows (`n=1924`/`1975`, `|E|=1923`/`1974`, no back edge, full reachability).
2. **α(T) and x(T).** Computed by a *generic* bottom-up subset-convolution independence-counting DP that walks the literal adjacency dict with no hard-coded "choke"/"leg" shorthand (`independence_gf_generic`), giving the *entire* coefficient sequence `i_k(T)`, k=0..α, as exact big integers. `x(T)` is `first_strict_descent`: the least k with `i_{k+1} < i_k`, counting `i_{α+1} := 0` (SEMANTIC-CONTRACT §1: "counts zero above α, so the terminal difference `Δ_α = −i_α` counts").
   - Cross-checked, coefficient by coefficient through `k = α+1`, against the registered closed form `I(CB(8,m);x) = (1+2x)G^m + x(1+x)(1+2x)^{8m}` (cited at its grade `proved_informal`, not re-derived). **Finding and repair (my own instrument):** my first transcription of `G` swapped the contract's two terms (`G = (1+2x)^d + x(1+x)^d`) for `(1+x)^d + x(1+2x)^d`; this made `i_1(T)` mismatch (1020 vs. the trivially-correct `n`, since every single vertex is an independent set). I caught this from the literal DP disagreeing with the closed form at `k=1`, corrected `cb_lib.py`, and reran; every coefficient through `α+1` then matches exactly at both rows (`closed_form_cross_check_ok: true`). This is a defect in my own cross-check code, not in the registered closed form, which is confirmed correct once the transcription is fixed.

| m | n | α (literal DP) | x (literal DP, first strict descent, Δ_x=i_{x+1}−i_x<0) | closed-form cross-check |
|---|---|---|---|---|
| 113 | 1924 | 1018 | 602 | match through k=1019 |
| 116 | 1975 | 1045 | 618 | match through k=1046 |

**Eligibility (E):** `x(T)+2 ≤ p*` and `3p* < 2α(T)+1`.

| m | x+2 | p* | eligible(first) | 3p* | 2α+1 | eligible(second) |
|---|---|---|---|---|---|---|
| 113 | 604 | 604 | true (equality) | 1812 | 2037 | true |
| 116 | 620 | 620 | true (equality) | 1860 | 2091 | true |

Both rows are eligible; note `x(T) = p*−2` exactly at both (the same tight pattern the fixed points show at m=107,95,110).

**Favorability, derived (not assumed) for the arm leaf and three sampled private leaves**, by literally deleting the leaf, rerunning the same generic DP on the reduced graph, and checking `Δ_{p*}(T−t) = i_{p*}(T−t) − i_{p*−1}(T−t) < 0`:

| m | leaf | Δ_{p*} sign | favorable |
|---|---|---|---|
| 113 | v (arm) | negative | yes |
| 113 | c_(1,1) | negative | yes |
| 113 | c_(1,8) | negative | yes |
| 113 | c_(113,1) | negative | yes |
| 116 | v (arm) | negative | yes |
| 116 | c_(1,1) | negative | yes |
| 116 | c_(1,8) | negative | yes |
| 116 | c_(116,1) | negative | yes |

Samples were chosen at the two extreme legs of choke 1 and leg 1 of the last choke, to probe for an off-by-one at either boundary; none found. An explicit automorphism (choke 1 ↔ choke m, leg 1 ↔ leg d, checked by relabelling every edge and comparing the mapped edge set to the original **exactly**, not merely asserted) confirms every `c_ij` plays an identical structural role, so `F_{p*}(T) = leafSet(T)` at both rows (consistent with the favorability key's conclusion on this class, cited at its grade).

**WID scoping note.** This route's object is the non-sector (criterion) flow and the sector/switch interaction, not the whole-network aggregate `S(T,p*)`; F1 owns full whole-network (WID) fidelity at its own fresh rows (`m=116,119,137`). I satisfy shared rule 2 for the part of the network this route actually uses: §2 below asserts and checks, from two independent computations, that the criterion flow's per-class supply and capacity are equal (`ρ_q` is derived, not assumed, from `r_q` computed two ways — direct binomial-sum and, in `f3_condition_ii_stress.py`, via the same `N`/cumulative machinery used for condition (ii)).

**Generator / replay** (`f3_eligibility.py`, `f3_fixed_points.py`; library `cb_lib.py`):
SHA-256 `cb_lib.py` = `a326e704ae0a944ac8cbb776f65f9fd89a055761b838f6f2e6f8b9aa59af040b`;
`f3_eligibility.py` = `2c14fee47b58cdc940e03fbbd716dce1766974755b78d45b106a89a44c840f2b`, output `f3_eligibility.out.json` = `31d22d7f286e482c1b2353c643d9a727ad2c9332f8f6974770c5750735dd64bb`;
`f3_fixed_points.py` = `2ddb99e809be63de59ae7269dfe50a330025b10e48ad57bddef4ab7c4c03865c`, output `f3_fixed_points.out.json` = `7535a2ef7bfa65e0014290523f982ff544d268e08f681938a11eef01c4130f2a`.
Replay (foreground, ~2s each):
```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-F3-replay
python3 -B f3_eligibility.py
python3 -B f3_fixed_points.py
```

## 2. Condition (i) — Lemma A — at every q, both fresh rows, with the q=1 and q=m edge cases

For `q=1..m`: `a_q = 8q−1`, `b_q = 8(m−q)+1`, `j = p*−q` (computed in the integers; ℕ-guards: `q≥1,d≥1 ⇒ a_q≥0`; `q≤m ⇒ b_q≥1`), `r_q(k) = [y^k](1+y)^{a_q}(1+2y)^{b_q}`. Lemma A (SR-2, `proved_informal`, Darroch/Newton-free) asserts `r_q(p*−q) < r_q(p*−q−1)` strictly, i.e. the **difference index is q** and the gap is `Δ_q := r_q(j−1) − r_q(j) > 0`.

`f3_criterion.py` computes `r_q(j)` and `r_q(j−1)` exactly (big integers, `math.comb`) for **every** `q=1..m` at both rows — 113 and 116 checks, 229 total — and finds **condition (i) strict at every q, both rows, 0 exceptions**.

**Edge cases (the allocation's own naming, F3's obligation):**

| m | q | a_q | b_q | j=p*−q | Δ_q = r_q(j−1)−r_q(j) (sign, exact digit count) | relative margin (r_q(j−1)−r_q(j))/r_q(j−1) |
|---|---|---|---|---|---|---|
| 113 | 1 (smallest a_q=7) | 7 | 897 | 603 | positive, 427-digit integer | 0.0041411… (row minimum) |
| 113 | 113 (smallest b_q=1) | 903 | 1 | 491 | positive, 269-digit integer | 0.1562179… (not the minimum) |
| 116 | 1 (smallest a_q=7) | 7 | 921 | 619 | positive, 438-digit integer | 0.0040342… (row minimum) |
| 116 | 116 (smallest b_q=1) | 927 | 1 | 504 | positive, 276-digit integer | 0.1561568… (not the minimum) |

The minimum relative margin over all q occurs at `q=1` at both rows (matching SR-2's own finding at its own sampled rows, `q=1` is the only class at or near the mode `μ_q`), and it is still comfortably positive and strictly decreasing in `m` (0.0041411 at m=113 vs. 0.0040342 at m=116, continuing the trend SR-2 reported from m=107 to m=1001). The `q=m` boundary (`b_q=1`, the thinnest possible second factor) shows no pathology: its relative margin (≈0.156, both rows) is over 35× the row minimum and nowhere near a sign change. **No exact failure of condition (i) was found at either edge case or at any interior q.**

**Generator / replay** (`f3_criterion.py`): SHA-256 `f3_criterion.py` = `8461fa837c6c51970c0b72598a6c441125c86053c7d9126250f109224dcc3b89`, output `f3_criterion.out.json` = `776fff745c8928fc858ad02b15504c903a78d4c9f7bf03b09f61761f731149e7`.
```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-F3-replay
python3 -B f3_criterion.py
```
(~2.4s, foreground.)

## 3. Condition (ii) — the type-path inequalities — an adversarial attempt to break CD-2's "holds identically" claim

The criterion key's scope note CD-2 (SR-C4-6) claims condition (ii) — for `S_α := N(α,j)`, `T_α := N(α,j−1)`, `N(α,k)=C(a,α)C(b,k−α)2^{k−α}`:

```
r(j)·Σ_{α'≤α} T_{α'}  ≥  r(j−1)·Σ_{α'≤α} S_{α'}      for every α ∈ [0,a]
r(j−1)·Σ_{α'≤α} S_{α'}  ≥  r(j)·Σ_{α'<α} T_{α'}       for every α ∈ [0,a]
```

**holds identically: for all integers a≥0, b≥0 and every integer j** — no tree, no CB family, no relation to the specific (a_q,b_q,j) it will later be applied to. SR-C4-6's own grid checked `a,b ≤ 30`, every `j ∈ [−2,a+b+2]` (1,230,070 exact inequality checks, 0 failures). F3's obligation is to "try to break that claim exactly." `f3_condition_ii_stress.py` does three independent things, none of which replays SR-C4-6's own grid:

- **Part A — a larger general grid.** Every `a,b ∈ [0,80]` (a strict superset of SR-C4-6's `a,b≤30` box, both in range and, with `j_pad=3`, one step further past the support boundary on each side than SR-C4-6's `[−2,a+b+2]` window), every `j ∈ [−3,a+b+3]`: **570,807 (a,b,j) triples, 0 failures.**
- **Part B — asymmetric extremes SR-C4-6's box cannot reach.** `(a,b) ∈ {(900,1),(1,900),(927,1),(1,927),(7,921),(450,450),(2,998),(998,2),(0,1000),(1000,0),(1,1)}` (the last four pairs matching the exact *shape* of the q=1 and q=m edge cases at the fresh rows), sampled across each pair's full support at the boundaries, the interior, and a regular stride: **732 triples, 0 failures.**
- **Part C — the actual (a_q,b_q,j) triples of `CB(8,113)` and `CB(8,116)`**, every `q=1..m` at both rows (independently re-derived here, not copied from §2's tally), reaching `a_q` up to 927 — an order of magnitude past anything SR-C4-6 tested: **229 triples, 0 failures**, matching §2's own row-by-row `cond_ii_ok` tally exactly (cross-check between two independently written instruments in this same return).

**Total: 571,768 (a,b,j) triples across three genuinely new regions of the parameter space, 0 counterexamples.** Per SOLUTION-CONTRACT §4 ("exact sweeps discover and test; they never prove a universal statement"), this is **bounded confirmation**, not a proof that CD-2 holds for every a,b,j — but it is a substantially harder adversarial attempt than exists on the record, and it found nothing.

**Generator / replay** (`f3_condition_ii_stress.py`): SHA-256 = `4887490fa7e1fbb431a93437ce74b64cbe23dc3ac792f606572ebadfd89c7202`, output `f3_condition_ii_stress.out.json` = `22873a13a13a103e446bd7225645bdfa859d803ceb00e8b286b6ff86c064d503`.
```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-F3-replay
python3 -B f3_condition_ii_stress.py
```
(~12.5s, foreground, single process.)

## 4. The doubly-fed class: is `(ρ₁+θ)γ ≤ γ` the true binding constraint, or did SR-3 miss another?

SR-3's registered composition key asserts: in-sector targets receive only sector flow; `r`-free targets with two or more chokes receive only the criterion flow; `u_i`-switch images (`r`-free, exactly one choke, weight γ∈[1,7]) are the **one** class fed by both, bound by `(ρ_1+θ)γ ≤ γ`. This was established by SR-3 via explicit case enumeration over "which vertex can be inserted". F3's obligation is to attack this exactly.

**A structural argument, verified against the literal graph rather than only argued in prose** (`f3_doubly_fed.py`):

- **Fact 1** (checked literally on `CB(8,113)`, not assumed from the constructor): `adj[r]` equals exactly `{s} ∪ {every choke u_i}` — **confirmed** (`fact1_N_r_equals_s_union_chokes: true`).
- **Fact 2:** a sector source `B` has `r ∈ B`; independence forbids every neighbour of `r`; by Fact 1 that is every choke; so **every sector source has exactly zero choke vertices.**
- **Fact 3:** every deletion arc removes one leg vertex (never `r`, never `v`); its image therefore still contains `r,v` — zero chokes, not an r-free target at all (in-sector).
- **Fact 4:** a switch arc inserts exactly one new vertex `x` with `|N(x)∩B|=2`, replacing those two neighbours. Since `B` has zero chokes (Fact 2), the image has **at most one** choke — the one just inserted, if `x` is itself a choke.

**Consequence:** no arc out of any sector source can ever produce an r-free target with `q ≥ 2` chokes. This holds for *every* sector source, not a sample — it needs only Facts 1–4, which are definitional and already verified against the literal graph.

**This was then checked, not merely argued, three ways on `CB(8,113)`:**

1. A concrete sector source `B` (K=99 legs, size checked = K+2, weight checked = 1) was built exercising, at nine distinct chokes, every `(β,γ)` state `(1,0),(1,1),…,(1,7)` plus a `(2,3)` and a `(0,8)` choke. **Every** vertex `x ∉ B` in the whole graph (not just chokes) was tested for `|N(x)∩B|=2`; exactly 9 qualified — `s` and the eight `(1,γ)` chokes — confirming the switch rule is exactly "`s`, or a choke with `β=1`", not assumed. The `(2,3)` and `(0,8)` chokes correctly produced **no** switch. Every choke-switch image has `q=1` (checked, not assumed) and weight exactly γ (checked against the literal `w_F`, γ=0..7 exactly, matching the constructed states); the `s`-switch image has weight exactly 0 (checked).
2. Two concrete r-free targets with `q=2` (weight 8) and `q=3` (weight 12) were built directly. For **every** vertex `x` not already in the target (1,910 and 1,907 candidates respectively — the whole remaining graph, not a sample), `A∪{x}` was checked literally for sector-source membership (`r∈B` and `v∈B`); **zero** candidates qualified at either target. This is a literal, exhaustive (over all of `V∖A`, not sampled) confirmation of Fact 2–4's consequence at two concrete instances.
3. The binding-constraint algebra: `(ρ_1+θ)γ ≤ γ ⟺ θ ≤ 1−ρ_1` for `γ≥1` (trivially `0≤0` at `γ=0`) was checked **not just as the divided form** but at every `γ=0..7` directly, `(ρ_1+θ)·γ ≤ γ`, using `ρ_1` recomputed independently here (agreeing with §2's `q=1` value) and, **cited only as a numeric illustration, never as a hypothesis**, the conjectural `θ*_8(m)=288/(200m²+82m+5)`. Holds at every γ, both rows.

**No second doubly-fed class exists**, and `(ρ_1+θ)γ ≤ γ` (equivalently the Residual hypothesis `θ ≤ 1−ρ_1`) really is the tight statement of the shared-capacity constraint — there is no other target class for which an analogous inequality would even be meaningful, since Facts 1–4 rule out any other class receiving sector flow at all. This **sharpens, without contradicting**, SR-3's own (case-enumeration) argument for the same conclusion: the reason is exactly "`r` is adjacent to every choke, so a sector source has none, and one switch adds at most one." I record this as a **STATED, unregistered** one-line clarifying note for the synthesis (§6) — it does not merit a new key (SOLUTION-CONTRACT §2: an argument for an already-registered conclusion is not new progress), and per gate ruling 13 it is reported as a finding on SR-3's key, not a re-derivation around it.

**Generator / replay** (`f3_doubly_fed.py`): SHA-256 = `6f637dba934bcab56c4e2e5d6fe28586adbdad76fe31074f37d368882b0ed8f7`, output `f3_doubly_fed.out.json` = `2c4c747aa5555082777caf8c01a08bc6889e05b2446bf7a0c7a5dadc49d5d2f9`.
```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-F3-replay
python3 -B f3_doubly_fed.py
```
(~0.1s, foreground.)

## 5. Full replay bundle (copy-out-first)

All five scripts and `cb_lib.py` were copied into the replay directory and rerun there from a cold copy; every output's SHA-256 matched the original run's exactly (byte-identical, confirming no wall-clock/PID/host dependence and full determinism):

```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-F3-replay
python3 -B f3_eligibility.py
python3 -B f3_fixed_points.py
python3 -B f3_criterion.py
python3 -B f3_condition_ii_stress.py
python3 -B f3_doubly_fed.py
```

| file | SHA-256 | role |
|---|---|---|
| `cb_lib.py` | `a326e704ae0a944ac8cbb776f65f9fd89a055761b838f6f2e6f8b9aa59af040b` | shared literal graph builder, tree tests, generic independence DP, closed-form cross-check, `r_q`/`N` helpers |
| `f3_eligibility.py` | `2c14fee47b58cdc940e03fbbd716dce1766974755b78d45b106a89a44c840f2b` | fresh-row tree/α/x/eligibility/favorability, m=113,116 |
| `f3_eligibility.out.json` | `31d22d7f286e482c1b2353c643d9a727ad2c9332f8f6974770c5750735dd64bb` | output of the above |
| `f3_fixed_points.py` | `2ddb99e809be63de59ae7269dfe50a330025b10e48ad57bddef4ab7c4c03865c` | reproduces the m=107,95 fixed points of record |
| `f3_fixed_points.out.json` | `7535a2ef7bfa65e0014290523f982ff544d268e08f681938a11eef01c4130f2a` | output; `all_fixed_points_reproduced: true` |
| `f3_criterion.py` | `8461fa837c6c51970c0b72598a6c441125c86053c7d9126250f109224dcc3b89` | condition (i)+(ii) at every q, m=113,116 |
| `f3_criterion.out.json` | `776fff745c8928fc858ad02b15504c903a78d4c9f7bf03b09f61761f731149e7` | output; 0 failures, both rows |
| `f3_condition_ii_stress.py` | `4887490fa7e1fbb431a93437ce74b64cbe23dc3ac792f606572ebadfd89c7202` | general condition-(ii) stress test, Parts A/B/C |
| `f3_condition_ii_stress.out.json` | `22873a13a13a103e446bd7225645bdfa859d803ceb00e8b286b6ff86c064d503` | output; 571,768 triples, 0 failures |
| `f3_doubly_fed.py` | `6f637dba934bcab56c4e2e5d6fe28586adbdad76fe31074f37d368882b0ed8f7` | structural + literal doubly-fed-class check |
| `f3_doubly_fed.out.json` | `2c4c747aa5555082777caf8c01a08bc6889e05b2446bf7a0c7a5dadc49d5d2f9` | output; unique doubly-fed class confirmed |

No background job was ever started; every computation ran to completion in the foreground as `python3 -B`. A name-scoped `pgrep -fl "f3_"` before this return was finalized matched nothing.

## 6. Alias check (lexical and mathematical) for the one STATED clarifying note

No new `E993-R31-` key is proposed (see "Registered claims touched" above). The one STATED note — "a sector source has zero chokes (r is adjacent to every choke), and a switch inserts exactly one, so every switch image has q=1 and no target with q≥2 ever receives sector flow" — was checked:

- **Lexically**, by inspection against every `alias` and `alias_pattern` string of record: the criterion key and the threshold key, both queried directly from `sources/authority/CLAIM-IDENTITY.json` (criterion key: 4 aliases, `alias_patterns: []`; threshold key: 2 aliases — `C-T1-U A5 rank-threshold lemma`; the SR-C5-4 rename note — `alias_patterns: []`), and SR-3's registered composition key, whose own `ALIASES:` line I have directly from its registration text in `SECOND-READ.md` (that key postdates the frozen 491-claim master snapshot and lives only in the run-local registry, which I did not separately re-query as JSON). No match against any of them. The note also contains no working label (`E1`, `E1-R`, `B7`, "Lemma A", "coefficient descent").
- **Mathematically**, against SR-3's own registered STATEMENT/SCOPE text (quoted in full above from `CLAIM-IDENTITY.json`'s entry): SR-3's key already asserts this exact conclusion ("a `u_i`-switch image ... has exactly `8−γ` sector preimages ... every other target receives no sector flow") as part of its own proof; this note is a *repair/sharpening of the reason*, not a new statement, a new scope, or an extension. It is therefore not a candidate key at all — it is offered only as face-text the Cycle 2 synthesis or a second read may fold into SR-3's key's existing proof paragraph, exactly as SR-2 and SR-3 themselves added self-contained proof text to existing keys without renaming them.

## Findings and repairs

1. **My own instrument defect, found and fixed** (§1): the closed-form cross-check's `G` had its two terms transposed relative to `SEMANTIC-CONTRACT.md`'s `G = (1+2x)^d + x(1+x)^d`. Caught because the literal generic DP (which does not depend on the closed form at all) disagreed with it at `k=1` (1924 vs. 1020, where 1924 = n is trivially forced). Fixed in `cb_lib.py`; both independent derivations then agree exactly through `α+1` at both fresh rows. This is a defect in my own cross-check code, not in the registered closed form.
2. **No defect found** in condition (i) (Lemma A) at either fresh row, including the `q=1` and `q=m` edge cases named by the allocation.
3. **No defect found** in condition (ii) (CD-2/SR-C4-6's "holds identically" claim) across 571,768 exact triples spanning a materially larger and more asymmetric region of `(a,b,j)`-space than the existing record, including the actual `(a_q,b_q,j)` values of the fresh rows themselves (`a_q` up to 927).
4. **No second doubly-fed class found**; `(ρ_1+θ)γ ≤ γ` is confirmed the true, tight binding constraint, via a structural argument (Facts 1–4) checked against the literal graph plus two exhaustive-over-`V∖A` literal instances, not merely a sample.
5. **No cut candidate.** Fresh-row eligibility, favorability (sampled + automorphism), and the criterion's conditions (i)–(ii) all hold exactly at `m=113,116`; nothing here constitutes or points toward a deficient cut.

## Grades (unchanged by this route; nothing here is registered)

- Criterion key, threshold key, SR-3's composition key, the favorability key, the closed forms of record: unchanged, as cited above (their statements, grades and fences are r30/r31-Cycle-1 objects; this route neither re-proves nor upgrades any of them).
- This route's own outputs: `bounded_computation` (the two fresh-row checks, the condition-(ii) stress test, the fixed-point reproduction) and one **STATED, unregistered** structural note (§6), which itself would be `proved_informal` in form (a general, non-sampled argument) but carries no certificate of its own per SOLUTION-CONTRACT §4 ("a companion... on an award's face carries no certificate of its own") until a synthesis or second read accepts it onto SR-3's key.
- `θ*_8(m)` law: unchanged, `conjecture`, used only illustratively, never as a hypothesis.

## Gate lines (C2-STAGE1-GATE.md ruling 14)

`ELIG_formal: not_advanced`
`HALL_formal: not_advanced`
`FAV_darroch_free: not_advanced`
`cut_candidate: none`

(This route did no Lean work and did not touch the favorability key's Darroch/Newton dependency, which is T1/T2's assigned obligation; it is an adversarial-numeric route against the informal chain and found nothing to advance or strike.)

`headline_resolved: no`

**Route verdict: `bounded_evidence`**

## Remaining obligation

What a successor inherits from this route:

- Condition (i), condition (ii), and the doubly-fed-class characterization are now confirmed, by independent instruments, at `m=113,116` in addition to the previously-checked `m=107,110`. No adversarial defect has been found anywhere in the criterion-flow/sector-interaction chain at any tested row. A successor wanting to *further* stress this should either (a) push condition (ii)'s general grid past `a,b=80` and/or attempt a targeted search for near-tight instances (the smallest observed relative margins, both here and in SR-2's own record, cluster at `q=1`; a successor could search specifically near `t ≈ μ_q + 1/3` for a genuinely adversarial near-miss rather than a uniform grid), or (b) treat this chain as sufficiently stress-tested informally and redirect adversarial effort toward the parts of Tier 1 this route did not touch (the favorability Darroch/Newton removal, owned by T1/T2; the certificate-range boundary, owned by F2; the whole-network fidelity at F1's own fresh rows).
- The one STATED note in §6 (sector sources have zero chokes, hence a switch image has at most one, hence no `q≥2` target is ever doubly-fed) is offered as candidate face-text for SR-3's registered key. A synthesis or second read should decide whether to fold it in; it changes no statement, grade, or fence of that key either way.
- No cut candidate, no template failure, and no registration is left pending from this route.

---

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5
