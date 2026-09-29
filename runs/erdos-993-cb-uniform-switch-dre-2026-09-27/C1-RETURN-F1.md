# RETURN — Route F1, Cycle 1, r31

**Route ID:** `C1-F-01`
**Mechanism token:** `LITERAL-NETWORK-FIDELITY-AND-SHARED-CAPACITY-AT-FRESH-ROWS`
**Orientation:** F (falsify)

## Boot acknowledgment

VerityOS booted for this seat by reading EXACTLY the two authorized files, in order, and nothing else:
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`.
The startup protocol's own task-type map, memory, conversations, modules, skills, logs and decisions were
NOT read (the controller has booted for the run; per `control/C1-WORKER-COMMON-BRIEF.md` this seat's boot
is scoped to those two files only).

## Read-boundary disclosure

Two items, both minor, disclosed for transparency:

1. Before creating this seat's own scratch directory I ran a non-recursive `ls` on the shared
   `experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/` directory (one level, not `-R`,
   no glob) to confirm the directory existed and to create `c1-F1` and `c1-F1-replay` under it. This
   revealed the *names* (not contents) of sibling seats' scratch subdirectories that already existed at
   that moment (`c1-F2`, `c1-T1`, `c1-U1`, `c1-U2`, `c1-U3`). No sibling file was opened, read, or
   referenced anywhere in this return. Flagged because the brief states scratch parents ("`scratchpad/` and
   `cycles/`") are above the per-seat grant even though the operation was a single-level, non-recursive
   listing rather than the explicitly named `find`/`grep`/`rg`/`ls -R`/glob-`cat`/recursive listing.
2. `control/OBLIGATIONS.csv`, named in `control/C1-WORKER-COMMON-BRIEF.md`'s reading list, does not exist
   at that path (`Read` returned "File does not exist"). Not a boundary violation — recorded as a gap in
   the brief's own reading list, not something this seat worked around by reading elsewhere.

No other file outside the dispatch's granted set (`control/`, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`,
`AUTHORIZATION.md`, `sources/` under the paths the brief names, this seat's own `cycles/cycle-1/stage3/returns/F1/`
and `scratchpad/c1-F1*`) was read. No `find`/`grep`/`rg`/`ls -R`/glob-`cat`/recursive listing was run at any point.

## Stage 2 seal and source digests

Recomputed SHA-256 of `control/C1-STAGE2-PACKET-MANIFEST.json`'s canonical JSON (all fields except
`seal_sha256`, `sort_keys=True`, `separators=(",", ":")`, no trailing newline):

```
recorded seal: e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc
recomputed:    e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc
MATCH
```

`control/DISPATCH-F1.md` itself verified against the digest given in the dispatch instruction:
`0315ada98f98c83031816a1b33d11277da547195e4a8f6be1d80202fac4a4987` (matched before any other action).

Every frozen source file this route actually reads was verified against `sources/SOURCE-DIGESTS.json`
before use (all `OK`): `sources/r30/instruments/c6/T2/inherited/{localflow,certify,sector,rowdata,simplex,
fixedpoints}.py`; `sources/r30/instruments/c6/C-T2-F/{crit_cert_tables,crit_extend_a,crit_extend_b}.json`;
`sources/r30/instruments/c6/C-T2-U/own/{CERT-TABLES.json,literal_lab.py}`; `sources/r30/instruments/c6/C-T2-F/crit_lab.py`;
`sources/r30/records/SEMANTIC-CONTRACT.md`. `crit_extend_b.json` re-checked a second time immediately
before the control-row comparison it feeds (`compare_control_row.py`), digest
`a22aa73b7ac43e7a7f5203da1e4e1679bdbdc288c470eed6ccf419d6c090cdaa`, matching `sources/SOURCE-DIGESTS.json`.

## Model disclosure

Chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id:
`claude-sonnet-5`.

## IMPORT LIST (this route's own code, all files under `scratchpad/c1-F1/` and `scratchpad/c1-F1-replay/`)

Python standard library only, across every script: `sys`, `json`, `hashlib`, `itertools`, `math` (`comb` not
actually used; only implicitly via own Pascal recursion), `fractions.Fraction`. No `pip`, no third-party
package, no network call anywhere. Every script begins `python3 -B` when run (no `.pyc` cache written).

## Registered claims this route touches or re-confirms (named before any table below)

Named before presenting any computation as evidence, per obligation 3 of `control/C1-WORKER-COMMON-BRIEF.md`:

- `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (favorability
  of every leaf at `p*`; `proved_informal` modulo Darroch/Newton on products of linear factors) — **re-confirmed
  by direct literal computation** (no Darroch/Newton invoked) at `m = 95, 107, 110, 113`, distinct from re-proving it.
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (E1; `proved_informal`) — its
  `ρ_1` coefficient-ratio **re-derived and spot-checked** against the recorded fixed point at `m=95` and computed
  fresh at `m=107,110,113`; condition (i) checked only at `q=1` (the largest ratio, the one load-bearing for
  shared-capacity at switch images) — **not** swept over all `q`, which remains this cycle's other routes' scope.
- `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (`proved_informal`
  modulo Darroch) — cited, not independently re-derived (this route did not touch the mean-threshold argument).
- `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`
  (`computer_assisted`; the class's first member `m=107` certified there) — this route's `m=107` result is an
  **independent reproduction** of that certificate's exact numbers (theta, all 7 σ(γ), all 36 `pb`, all 36
  `pc` states — see "Control-row exact reproduction" below), not a new claim on its own.
- `E993-TREE-REAL-ROOTED` (REFUTED, witness order 4 per the 2026-09-27 joint reconciliation correction) —
  respected: this route invokes **no** Darroch/Newton step anywhere (see "Darroch/Newton hygiene" below), so
  the refuted mechanism is not at risk of being reused here.
- (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` and the primary aggregate
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` — both OPEN; nothing in this return changes either
  (fence 1 of `SOLUTION-CONTRACT.md`: a family theorem, let alone a 3-row instance check, transfers no status
  to either aggregate key).
- **New candidate** (alias-checked below): `E993-R31-CB-8-M-110-AND-113-CHOKE-LOCAL-SECTOR-CERTIFICATE-EXACT-FEASIBILITY-AT-RANK-16M-PLUS-4-OVER-3`.

## Step-by-step derivation, naming where each hypothesis enters

This route builds its own instruments rather than trusting the frozen ones, then cross-checks. Full code
is in `scratchpad/c1-F1/` (copied byte-identically into `scratchpad/c1-F1-replay/`); replay commands are
listed per-artifact below.

**Step 1 — literal graph and two independent tree tests.** `treelib.build_cb(d,m)` constructs `CB(d,m)`
directly from the definition of record (`SEMANTIC-CONTRACT.md` §2 / `R30-CB-RECORD`): path `r–s–v`; `m`
chokes `u_i` adjacent to `r`; `d` supports `b_{ij}` adjacent to `u_i`; one private leaf `c_{ij}` adjacent to
`b_{ij}`. Own vertex numbering, independent of any frozen source's. **Acyclicity-and-connectivity tests in
code, two independent methods** (`treelib.is_tree_bfs_edgecount`: `|E|=|V|-1` AND single-component BFS;
`treelib.is_tree_dfs_parent_cycle`: parent-tracking DFS, a back-edge to a non-parent visited vertex is a
cycle, plus full-visitation connectivity) — both `True` at `m=95,107,110,113` (`row_check_out.json`).

**Step 2 — independence polynomial, two instruments.** Instrument A (`treelib.generic_indep_poly`): a
generic (non-CB-aware) rooted post-order tree DP on the literal adjacency, computed to the FULL degree `α`
(no truncation — a truncated search could hide a late descent and falsely certify eligibility). Instrument
B (`closed_forms.py`): closed forms derived by hand for this return (not copied from any frozen file) by
rooting the tree at `r` and using the standard "root free / root forced absent" pendant-subtree recursion:
- One choke arm (root `u`, `d` support–leaf legs), `u` free: `G = (1+2y)^d + y(1+y)^d`. `u` forced absent:
  `(1+2y)^d` (each leg free).
- `I(CB(d,m)) = (1+2y)·G^m + y(1+y)(1+2y)^{dm}` (r excluded: `s`-arm free `(1+2y)` times `m` free choke arms;
  r included: `s` forced present with `v` free `(1+y)`... — worked out in full as: r excluded contributes
  `O_s·G^m` with `O_s=(1+2y)` the 2-path `s–v` free-poly; r included contributes `y·O'_s·(O'_choke)^m` with
  `O'_s=(1+y)` (v alone, s forced absent) and `O'_choke=(1+2y)^d`). This is the SEMANTIC-CONTRACT §2 formula,
  re-derived, not assumed.
- `I(CB−v)`: v gone turns the s-arm into a bare vertex; `I(CB−v) = (1+y)·G^m + y·(1+2y)^{dm}` (r included now
  forces `s` absent with nothing left, contributing plain `y`, not `y(1+y)`).
- `I(CB−c)` for one private leaf: that leg's support becomes bare (`Gc = (1+2y)^{d-1}(1+y) + y(1+y)^{d-1}`
  replaces `G` at that one choke): `I(CB−c) = (1+2y)·Gc·G^{m-1} + y(1+y)^2(1+2y)^{dm-1}`.

All three closed forms matched Instrument A **exactly** on 7 small `(d,m)` pairs before being trusted on the
target rows (`cross_check_small.py`, `ALL_OK = True`), and matched again at `m=95,107,110,113`
(`row_check.py` asserts `PA==PB` etc.; would raise `AssertionError` on any mismatch — none occurred).

**Step 3 — the forward-difference aggregate `q_v`, `q_c`, and (WID) from independent sides.** `s_v` ("the
original support", `SEMANTIC-CONTRACT.md` §1) is `s` for leaf `v` and `b_{ij}` for leaf `c_{ij}` — the
tree-PARENT, distinct from the network witness set `W_v = N(s_v)\{v}` (`{r}` for `v`, `{u_i}` for `c_{ij}`,
confirmed to be exactly `N(s_v)\{v}` by direct computation, resolving what could otherwise read as two
unrelated concepts). `q_v(j) := i_j(H_v) − i_j(R_v)`, `H_v = T−{v,s_v}`, `R_v = T−N[s_v]`.
- For `v`: `H_v = T−{v,s}` = `r` plus `m` free choke arms = `G^m + y(1+2y)^{dm}` (r excluded: arms free `G^m`;
  r included: each choke top forced absent, `(1+2y)^{dm}`). `R_v = T−{r,s,v}` = `m` DISCONNECTED choke arms
  = `G^m`. **`H_v − R_v = y(1+2y)^{dm}` exactly** (the `G^m` terms cancel identically) — matches the frozen
  `qa` closed form.
- For `c_{ij}`: `H_c = T−{c,b}` (whole leg gone) = `(1+2y)·G_{d-1}·G^{m-1} + y(1+y)(1+2y)^{dm-1}` where
  `G_{d-1}` is `G` at arity `d-1` (that choke now has `d-1` full legs). `R_c = T−N[b] = T−{u_i,b,c}` removes
  the connecting vertex, so the choke's OTHER `d-1` legs become `d-1` disconnected support–leaf pairs:
  `R_c = [(1+2y)G^{m-1} + y(1+y)(1+2y)^{d(m-1)}]·(1+2y)^{d-1}`. Subtracting: the `y(1+y)(1+2y)^{dm-1}` terms
  from both sides share the SAME exponent `dm-1` and cancel identically, and `G_{d-1} − (1+2y)^{d-1} =
  y(1+y)^{d-1}` (direct from `G_{d-1}`'s own definition), leaving **`H_c − R_c = y(1+y)^{d-1}(1+2y)·G^{m-1}`
  exactly** — matches the frozen `qc` closed form.

Both derivations were verified twice: algebraically above, and computationally (`q_literal` in
`row_check.py`/`cross_check_small.py` builds `H`, `R` on the ACTUAL graph via Instrument A and compares
coefficient-by-coefficient against the closed forms of Step 3 — exact match at every tested `(d,m)`, including
a leaf-symmetry spot-check across two different chokes/leg-indices). **(WID) asserted from independent
sides**: `supply = Σ_{leaf∈F} q_leaf(p)`, `capacity = Σ_{leaf∈F} q_leaf(p-1)`, `S = supply − capacity`
computed BOTH as `Σ(q(p)-q(p-1))` directly and by the two-instrument recombination; `row_check.py` asserts
equality before printing anything (an `AssertionError` would fire on any drift — none occurred).

**Step 4 — `x` through `α`, eligibility, `F_{p*}` DERIVED.** `x_through_alpha` scans the FULL polynomial
`0..α` (not a truncated window) for the first `k` with `Δ_k := i_{k+1} − i_k < 0`; `x` is this `k`, reported
with its own difference index on every row below. Eligibility `x+2 ≤ p*` and `3p* < 2α+1` is CHECKED, not
assumed, on the actual computed `x,α`. `F_{p*}` is DERIVED (not asserted from the registered key) by testing
`Δ_p(T−ℓ) := i_{p+1}(T−ℓ) − i_p(T−ℓ) < 0` for a `v`-representative and THREE `c`-representatives at different
chokes/leg-indices (symmetry spot-check), cross-checked against the closed-form `I(CB−c)`.

**Darroch/Newton hygiene.** This route invokes Newton's inequalities or Darroch's mode theorem **nowhere**.
Every coefficient used (`I`, `I−v`, `I−c`, `q_v`, `q_c`, `ρ_q`, favorability, eligibility) is read off an
exact polynomial by direct coefficient extraction (Pascal-recursion binomials, exact convolution, or literal
tree DP) — never by locating a mode or bounding via log-concavity. The struck real-rootedness argument
(`E993-TREE-REAL-ROOTED`, REFUTED) is not reachable from anything in this return.

**ℕ-subtractions and casts.** All quantities handled (`p*`, `K=p*-1`, `x`, `α-x`, `d-γ`, `n=β+γ`, `d-n`)
are nonnegative by construction at every row tested (`K≥571>0`, `x≥506>0`, `d-γ≥1` for `γ≤d-1=7`, `n≤d`
enforced by the state space `{(β,γ): β+γ≤d}`); no subtraction underflow occurs; Python's arbitrary-precision
`int` is used throughout (no fixed-width cast anywhere).

## Row results (control `m=107`, fresh `m=110,113`, plus the recorded fixed point `m=95` reproduced as an
extra check)

Generator: `scratchpad/c1-F1/row_check.py`. Replay (copy-out-first):
```
cp scratchpad/c1-F1/{treelib.py,closed_forms.py,row_check.py} scratchpad/c1-F1-replay/
cd scratchpad/c1-F1-replay && python3 -B row_check.py
```
Output digest: `row_check_out.json` sha256 `062addafb3efaaa7031c7bbfebc453e38215a0040b470c86012749fd9b9be82a`
(reproduced identically from the replay copy).

| m | n | α | x | Δ_x<0 | Δ_{x-1}≥0 | p* | p*−x | eligible | F_all_leaves | \|F\| |
|---|---|---|---|---|---|---|---|---|---|---|
| 95 (record) | 1618 | 856 | 506 | yes | yes | 508 | 2 | True | True | 761 |
| 107 (control) | 1822 | 964 | 570 | yes | yes | 572 | 2 | True | True | 857 |
| 110 (fresh) | 1873 | 991 | 586 | yes | yes | 588 | 2 | True | True | 881 |
| 113 (fresh) | 1924 | 1018 | 602 | yes | yes | 604 | 2 | True | True | 905 |

`n=1618,α=856,x=506` at `m=95` and `n=1822,α=964,x=570` at `m=107` match `SEMANTIC-CONTRACT.md` §5's fixed
points exactly. `S(T,p*)` is negative at every row (365–434 decimal digits; exact values in
`row_check_out.json`), consistent with `FLOW ⇒ SIGN`.

**Finding (fidelity observation, not this route's headline).** At all four tested rows `p*−x = 2` exactly
— eligibility holds with the smallest possible margin permitted by `(ELIG-top)(a)`'s companion condition
`x+2≤p*` (equality, not slack). This is consistent with the brief's own note that `p*−x` grows like
`256m/20451` (≈1.3 at `m=107`, ≈1.4 at `m=113` — too small yet to move the integer floor past 2). Flagged
because a route whose job is fidelity/falsification should not let a tight-equality boundary condition pass
unremarked, even though it does NOT indicate any actual failure of eligibility here, and the general
`m→∞` behavior of `p*-x` is F3/T3's obligation, not re-derived here.

## E1 flow: `ρ_1` and the fixed-point cross-check

Generator: `scratchpad/c1-F1/e1_flow.py` (own exact binomial-coefficient extraction, no Darroch/Newton).
Replay: `cd scratchpad/c1-F1-replay && python3 -B e1_flow.py`.

`ρ_1(8,95,508) = 1354839571516225/1361543988640524`, matching `SEMANTIC-CONTRACT.md` §5's recorded fixed
point exactly (assertion in the script; would raise on mismatch).

| m | ρ_1 | 1−ρ_1 |
|---|---|---|
| 107 | 5150844596024699/5173467627355748 | 22623031331049/5173467627355748 |
| 110 | 2027991913051965/2036655530990516 | 8663617938551/2036655530990516 |
| 113 | 27820794945950193/27936482886870172 | 115687940919979/27936482886870172 |

## Sector LP + exact DP certification (own solver, obligations (i)/(ii))

Own simplex (`mysimplex.py`, two-phase, dense tableau, Bland's rule — a fresh implementation, not the
frozen `simplex.py`) and own LP construction (`sector_lp.py`, same mathematical object as
`SEMANTIC-CONTRACT.md` §2's affine-separation search device, own variable/constraint scheme). Solved for
`θ*(m)` and the full `pb,pc,σ` table at `m=107,110,113`. Then **exact min-plus/max-plus DP re-verification**
(`dp_certify.py`, own code — NOT the frozen `certify.py`) over every possible splitting of `K` (resp. `K-1`)
legs among the `m` chokes, i.e. without trusting the affine relaxation at all.

Replay:
```
cp scratchpad/c1-F1/{treelib.py,closed_forms.py,e1_flow.py,mysimplex.py,sector_lp.py,dp_certify.py} scratchpad/c1-F1-replay/
cd scratchpad/c1-F1-replay && python3 -B dp_certify.py
```

| m | θ* | 288/(200m²+82m+5) | matches conjectured law | min_out (DP) | max_in (DP) | switch_ok | residual_ok | margin (1−ρ_1)/θ* |
|---|---|---|---|---|---|---|---|---|
| 107 (control) | 96/766193 | 96/766193 | **exact** | 1 (≥1 ✓) | 1 (≤1 ✓) | True | True | 34.901 |
| 110 (fresh) | 96/809675 | 96/809675 | **exact** | 1 (≥1 ✓) | 1 (≤1 ✓) | True | True | 35.877 |
| 113 (fresh) | 96/854357 | 96/854357 | **exact** | 1 (≥1 ✓) | 1 (≤1 ✓) | True | True | 36.854 |

**No template failure found at either fresh row.** Per Gate ruling 2 ("no universal argument for (L-S)_top
is admissible unless its closed forms were first tested at m=110 and m=113 with exact arithmetic and an
independent verifier"): this route IS that independent verifier, built from scratch, and the test PASSES at
both fresh rows, with the conjectured closed form `θ*_8(m)=288/(200m²+82m+5)` reproduced EXACTLY (not
approximately) at `m=110` and `m=113` — a genuinely new confirmation, since only `m=107` was previously
certified (`control/C1-STAGE1-GATE.md`: "every other member uncertified"). This does **not** establish the
law's optimality or necessity for arbitrary flows (fence 4 of `SOLUTION-CONTRACT.md`) — only that the
template LP, solved independently, is feasible and gives this exact value at these three specific rows.

**Control-row exact reproduction.** `scratchpad/c1-F1/compare_control_row.py` (digest-verifies
`sources/r30/instruments/c6/C-T2-F/crit_extend_b.json` = `a22aa73b7ac43e7a7f5203da1e4e1679bdbdc288c470eed6ccf419d6c090cdaa`
against `sources/SOURCE-DIGESTS.json` before trusting it) compares this route's own LP solution at
`CB(8,107)/572` against r30's FROZEN certificate table entry-by-entry: **theta, all 7 `σ(γ)`, all 36 `pb`
states, and all 36 `pc` states match EXACTLY**, not merely the objective value. Replay:
`cd scratchpad/c1-F1-replay && python3 -B compare_control_row.py` (reproduced identically).

## Shared-capacity competition (obligation iv)

Generator: `scratchpad/c1-F1/shared_capacity.py`. Replay:
`cd scratchpad/c1-F1-replay && python3 -B shared_capacity.py`. Output digest: `shared_capacity_out.json`
sha256 `4f9da57a2eb4eae653210ba361cb5b4ddefb5794ac50def2db5a13883ad7a995`.

The ONLY target class receiving flow from BOTH mechanisms is the switch image (weight `γ`, one choke):
sector contributes `(d−γ)·σ(γ)` (its `d-γ` preimages each sending `σ(γ)`), E1 contributes `ρ_1·γ`
(q=1, `w_F=γ`). Checked for every `γ=1..7` at all three rows: **`(d−γ)σ(γ) + ρ_1γ ≤ γ` holds with positive
margin in every one of the 21 cases** (7 γ-values × 3 rows; exact fractions in `shared_capacity_out.json`).
This numerically confirms the algebraic identity `Switch ∧ Residual ⟹ (d−γ)σ(γ)+ρ_1γ ≤ θγ+(1−θ)γ = γ`
holds with room to spare (not merely at the boundary) at every tested row.

Other target classes, checked structurally rather than numerically (no computation needed): a target from
deleting `r` or `v` from a sector member has weight 0 (the sector member's ONLY active tag is `v`, whose
witness is `{r}`; removing `r` kills it, removing `v` removes the tag itself, and no other tag can be active
since no `u_i` is present in ANY sector member by independence) — confirmed on 200 sampled sector members in
`literal_lab.py`'s exhaustive small cases (`zero_ok=True`) and asserted structurally here for the large rows;
`r`-free targets with ≥2 chokes receive no sector flow by construction (the switch relation always inserts
exactly one `u_i`, producing exactly one choke — a fact of the (S) relation's definition, not a per-row
computation); in-sector targets' capacity-1 check IS the `max_in≤1` DP result above, already exact.

## Sampled literal laboratory (obligation iii)

Generator: `scratchpad/c1-F1/literal_lab.py`. Replay: `cd scratchpad/c1-F1-replay && python3 -B literal_lab.py`.
Output digest: `literal_lab_out.json` sha256 `885a5e8741dfff375d83d60af8d4c5dc93ba9249a2060b0cfc3536bb80f90142`.

**Part 1 (exhaustive, small `CB(d,m)`, own code, full enumeration — not sampled):** `CB(2,3)`, `CB(3,2)`,
`CB(3,3)`, `CB(2,4)` at representative `K`. Confirms `R_K = 2^K·C(dm,K)` exactly; **every sector member has
weight exactly 1** (all of them, exhaustively, not a sample); every switch image of weight `γ` has EXACTLY
`d−γ` sector preimages (exhaustively verified over 432–4608 images per case); deleting `r` or `v` from a
sector member always yields weight 0.

**Part 2 (concrete, on the ACTUAL large trees, control `m=107` and fresh `m=110,113`):** one explicit
vertex set `B` built directly on the real graph with a deliberately mixed choke-state pattern (`(1,3),(1,5),
(0,4),(2,2),(1,0),(0,0),(1,7),(3,1)` cycled, then filled) — literal independence (`is_indep` on the real
adjacency), `|B|=p*+1`, literal weight exactly 1 via the literal weight formula; a literal deletion arc
(remove one `c`-leg) checked independent, size `p*`, `r,v` retained; a literal switch performed at a genuine
`(1,γ=3)` choke — image checked independent, `r`-free, size `p*`, weight exactly `γ=3` matching theory. All
pass at all three rows.

## New claim proposal (alias-checked lexically AND mathematically)

**Candidate key:** `E993-R31-CB-8-M-110-AND-113-CHOKE-LOCAL-SECTOR-CERTIFICATE-EXACT-FEASIBILITY-AT-RANK-16M-PLUS-4-OVER-3`

**Statement (as a predicate):** "At `CB(8,110)/588` and `CB(8,113)/604`, the r30 choke-local sector-certificate
template (`SEMANTIC-CONTRACT.md` §2: nonnegative `pb,pc,σ` and `θ`, subject to Out/In/Switch/Residual) is
exactly feasible, via an independently constructed LP and exact min-plus/max-plus DP re-verification
(neither trusting nor reusing the frozen solver code), with `θ*(m)` equal to `288/(200m²+82m+5)` exactly at
both rows, and the switch-image shared-capacity sum `(d−γ)σ(γ)+ρ_1(m)γ ≤ γ` strictly satisfied for every
`γ=1..7` at both rows."

**Grade:** `computer_assisted` (a finite exact instance verification of TEMPLATE feasibility at two named
rows; it is NOT a claim that the literal network's per-state reduction is proved — that is `U2`'s pending
lemma this cycle, cited at the r30 STATED grade per `control/C1-STAGE1-GATE.md` ruling 4 — and it is NOT a
claim about the full network HALL condition beyond the sector, which also needs E1's condition (i) at every
`q` (only `q=1` checked here) and the ≥2-choke target classes (argued structurally, not exhaustively
verified here).

**Alias check — lexical:** searched `control/CLAIM-IDENTITY.run-local.json`'s 491 `claim_key` entries (loaded
programmatically, not via a directory-wide grep) for `CB-8-M-110`, `CB-8-M-113`, `110-AND-113`, `FRESH-ROW`,
`SECTOR-CERTIFICATE-EXACT`, `CHOKE-LOCAL-SECTOR`, and any key containing the literal substrings `-110-` or
`-113-`: **zero hits** on all patterns. The only lexically related key is
`E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`,
which stops at `m=107` (its own name says so, and `control/C1-STAGE1-GATE.md`'s current-state check confirms
"every other member uncertified").

**Alias check — mathematical:** the existing `CB-8-M-95-TO-107` key asserts full WEIGHTED-HALL (not merely
template feasibility) at `m∈{95,98,101,104,107}` via r30's own solver; my candidate is narrower in scope
(template feasibility + shared-capacity only, not full network HALL) and disjoint in row coverage
(`{110,113}` vs `{95,98,101,104,107}`) — no overlap, no conflict, no duplicate claim under a different name.

## Grades (never upgraded by use)

- The literal-graph construction and both independence-polynomial instruments (this route, own code):
  `computer_assisted`, cross-validated on 7 small cases plus 4 target-family rows.
- `q_v`, `q_c` closed forms and their algebraic derivation (this route): the ALGEBRA is an ordinary finite
  computation (not a new theorem worth registering — it reproduces, via an independent derivation, forms
  already implicit in the frozen `SEMANTIC-CONTRACT.md`/`rowdata.py`); the NUMERIC instances are
  `computer_assisted`.
- `ρ_1(m)` at `m=107,110,113`: `computer_assisted`, cross-validated against the `m=95` fixed point.
- The sector LP+DP certification at `m=107,110,113` and the control-row exact reproduction: `computer_assisted`
  (finite, exact, named rows only — never promoted to a universal statement about `L-S_top`).
- The proposed new claim above: `computer_assisted`, as stated.
- All CARRIED inputs (favorability key, E1 threshold key, criterion key, the r30 row key, the closed forms,
  the `θ*` law) keep their registered grades from `SEMANTIC-CONTRACT.md` §3 (`proved_informal` /
  `computer_assisted` / `conjecture` as recorded there) — this route neither upgrades nor downgrades any of
  them; it independently CONFIRMS several of their numeric instances at named rows.

## Gate lines (`control/C1-STAGE1-GATE.md` ruling 6)

`LS_top: advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

(`LS_top: advanced` because this route performed exactly the fresh-row independent-verifier test Gate
ruling 2 requires before any universal `L-S_top` argument is admissible, and the test passed at both
`m=110` and `m=113` with an exact match to the conjectured `θ*` law — unblocking, though not itself
constituting, a universal proof attempt. `ELIG_top: not_advanced` because this route did not attack the
`(ELIG-top)(a)` block-mixture argument itself, only confirmed eligibility holds — with the minimal possible
margin — at the four rows it directly computed.)

`headline_resolved: no`

## Route verdict

**`bounded_evidence`** — an exact, finite, reproducible verification at three named rows (`m=107` control,
`m=110,113` fresh), built with an independent solver stack, finding no template failure and no deficient
cut. Not `proved`/`proved_conditional` (no universal argument attempted or claimed), not `refuted` (nothing
here contradicts the target), not `compiled` (no Lean), not `blocked` (nothing stopped this route from
completing its full obligation).

## Remaining obligation (successor inheritance)

What this route did NOT do, that a successor (T1/T2's universal `(L-S)_top` proof, or a future F/U seat)
should not assume was already covered:

1. **Only `q=1` of E1's condition (i) was checked** at `p*` for `m=107,110,113`. The full criterion sweeps
   `q∈[1,m]`; this route trusted the registered `proved_informal` key for `q>1` without independent
   re-verification. A route auditing E1 fully should sweep all `q` at the fresh rows too.
2. **The ≥2-choke, `r`-free target class was argued structurally, not exhaustively verified**, that it
   receives no sector flow (true by construction of the (S) relation) and is served only by E1 (inherited,
   not re-derived here). No numeric check of E1's capacity sufficiency there was performed by this route.
3. **The literal-network-reduction lemma itself (U2's this cycle) was not proved or re-derived here** — this
   route's LP/DP results are about the TEMPLATE (the abstract per-choke-state allocation), matched to the
   literal network only via the concrete spot-checks of `literal_lab.py` Part 2 (single explicit
   configurations per row, not a proof that EVERY literal configuration reduces to its abstract state
   correctly). The exhaustive Part 1 laboratory establishes this reduction rigorously only for the SMALL
   cases tested, not for `d=8` at scale.
4. **No universal argument, no `M_0`, no proof for `m` outside `{95,107,110,113}`** was attempted — by
   design (this is an adversarial/fidelity route, not T1/T2's route) — but a successor should not read
   "`LS_top: advanced`" above as meaning more than "the required fresh-row test passed."
5. **The `p*−x=2` tight-margin observation** (row results table) is unexplained beyond noting the brief's
   own `256m/20451` growth estimate is still sub-1 at these `m`; a successor proving `(ELIG-top)(a)` for
   large `m` should confirm this margin eventually exceeds 2 (and stays there) as part of its own explicit
   `M_0`/remainder bookkeeping — this route did not attempt that.
6. **Extending the exact verification beyond `m=113`** (e.g. `m=116,119,...` "as far as exact arithmetic
   allows in the foreground") was left to F2's inherited scope (`cycles/cycle-1/stage2/ROUTE-STATE.md`:
   F2 inherits "the recorded θ* values; the margin growth ≈ m/3") rather than duplicated here, to avoid
   scope creep into a sibling route's obligation; the pipeline built here (`sector_lp.py`+`dp_certify.py`,
   ~5s LP + ~14s DP per row at `m≈110`) is reusable for that purpose if a successor wants it.

## Background jobs / foreground discipline

No background job was started at any point in this route. Every script (`row_check.py`, `e1_flow.py`,
`sector_lp.py`, `dp_certify.py`, `literal_lab.py`, `shared_capacity.py`, `compare_control_row.py`,
`cross_check_small.py`) was run synchronously in the foreground to completion (longest single run:
`dp_certify.py`, ~44s for all three rows). No process was detached, polled by PID, or left running; there
is nothing to kill before this return is final.

## Files (all under this run's granted paths; nothing written elsewhere)

- Scratch (working): `scratchpad/c1-F1/` — `treelib.py`, `closed_forms.py`, `cross_check_small.py`,
  `row_check.py`, `e1_flow.py`, `mysimplex.py`, `sector_lp.py`, `dp_certify.py`, `literal_lab.py`,
  `shared_capacity.py`, `compare_control_row.py`, plus `row_check_out.json`, `literal_lab_out.json`,
  `shared_capacity_out.json`.
- Replay (copy-out-first, byte-identical, re-run and re-verified from this copy):
  `scratchpad/c1-F1-replay/` — same files, plus `replay_row_check.log`, `replay_literal_lab.log`,
  `replay_shared_capacity.log` capturing the replay runs.
- This file: `cycles/cycle-1/stage3/returns/F1/RETURN.md` (the only file written outside `scratchpad/`).

No source under `sources/` was mutated. No file was written under any other experiment root, under `/tmp`,
or outside the two directories named in the dispatch.
