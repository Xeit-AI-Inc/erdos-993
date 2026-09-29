# Return — route F1, r31 Cycle 2, Stage 3

Route `C2-F-01`, mechanism token `ASSEMBLED-CHAIN-LITERAL-NETWORK-ADVERSARY`, orientation F (falsify). Load-bearing obligation
(`control/C2-ALLOCATION.md`, F1 row): attack the assembled Tier 1 chain at fresh rows `m = 116, 119`, larger row `m = 137`, with
`m = 110` as control; fidelity first ((WID) from independent sides, derived `F_{p*}`, `x` through `α`); then the exact load on every
target class from the formally verified C1-LA1 allocation and the criterion flow, reporting the maximum load ratio and where it
occurs; search structured source families for a deficient cut.

**Boot acknowledgment.** I am operating within VerityOS. Per the dispatch's FIRST instruction, I booted by reading EXACTLY
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS
file (no memory, conversations, modules, skills, logs or decisions; the startup protocol's own task-type map was not followed).
The controller has booted for the run; this seat's writes are confined to this file and to
`scratchpad/c2-F1/` and `scratchpad/c2-F1-replay/`.

**Model disclosure (two-part):** chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported
model id: `claude-sonnet-5`.

**IMPORT LIST** (standard library only, `python3 -B`; verbatim from `scratchpad/c2-F1/f1_instr.py`):
```
import json, hashlib, sys, math
from fractions import Fraction as Fr
from math import comb
```

## Identity and seal audit

- **Dispatch** `control/dispatch/c2-stage3/DISPATCH-F1.md`: given digest `919418d2e6ca5c6aeb53e8ba385f390c4e9643f6cad8a9b0270483f7530e6620`.
  I recomputed it with `shasum -a 256` before reading the file. **MATCH.** (Not a Stage 2 capsule member — it postdates the seal.)
- **Stage 2 packet seal** `control/C2-STAGE2-PACKET-MANIFEST.json` (2799 files): I recomputed the seal as the SHA-256 of the
  canonical JSON of the manifest without its `seal_sha256` field (`sort_keys=True`, separators `(",", ":")`, no trailing newline),
  via a standalone Python one-liner (not a captured script; reproduced below): result
  `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`. **MATCH** with the manifest's own `seal_sha256` field, and
  this is the seal I cite throughout.
  ```python
  import json, hashlib
  data = json.load(open("control/C2-STAGE2-PACKET-MANIFEST.json"))
  seal = data.pop("seal_sha256")
  canon = json.dumps(data, sort_keys=True, separators=(",", ":"))
  assert hashlib.sha256(canon.encode()).hexdigest() == seal
  ```
- **Files read, each verified against the manifest or the cited digest file before use** (all MATCH):
  - `control/C2-WORKER-COMMON-BRIEF.md` — `8a2eb99409c708b7917e1e30d873a57021c7f641ed393e70a7672c54a72a36ca`
  - `SEMANTIC-CONTRACT.md` — `7cc0bf434d6ea8f8fa2d812caf4e45787c1c06a9dfc6846b6b4d54cb60cf226e`
  - `SOLUTION-CONTRACT.md` — `480ba2ddda557be50b2d8249feb733be7e3c947d2e0a9dd4e7fee1427a7ef719`
  - `control/C2-ALLOCATION.md` — `f7bf8049b65624423babc9892f317d85b75e4a3d021690122f9e9833e267cec2`
  - `control/C2-STAGE1-GATE.md` — `60f94a12098b6fbf3a26d7a25dc70590fe8a534c413a5a9b0890799fac53dec6`
  - `cycles/cycle-2/stage2/ROUTE-STATE.md` — `552728480d17799090f9af49f0eabba71a492110374336425470ca20c0421804`
  - `OBLIGATIONS.csv` (run root) — `605ac1771878285d935f04f687cf2b45e04caccb83d7c44193c7094578d8ab7f`
  - `control/CLAIM-IDENTITY.run-local.json` (run root path; the common brief's text names it under `control/` — both denote the
    same granted run-local registry) — `34b2bdca1122622e335007ec03ea3adb43cc81d40aa7f9456ab2b0fbf247bd5b`
  - `sources/c1-results/cycles/cycle-1/CYCLE-CLOSE.md` — `25c406abb42e4944e2419116ceafad77310ec0dcfad08b472fbac239d72f2656`
  - `sources/c1-results/second-reads/SR-2/SECOND-READ.md` — `417800f64ba496650130fa5a28dcd25d252b655425341408edb23312be8752a3`
  - `sources/c1-results/second-reads/SR-3/SECOND-READ.md` — `4009f4579513dc0dd81d233380ac978bc201322d1544b881f59195a7970e7ece`
  - `sources/c1-results/runs/lean-2026-09-28-c1-la1-cb8-sector-template-feasible/INFORMAL-PROOF.md` — `16209c9b720b231e6a5026361af4fb0ff9cb90a6efb13c6717d2c1222cc534c3`
  - `.../SOURCE/ADJ-T-adj_alloc.py` — `10a9af5e37bd2b8d750c37ab59ea4a9eb7f543638a14765937f6bebca1a17ee9`
  - `.../SOURCE/ADJ-T-adj_alloc_out.json` — `7d63580526f84c48434b832353298bdba97c6a9cdce2a1bb95be9540870d4b13` (matches the digest
    `7d635805…4b13` the informal proof cites for "the table of record")
  - `sources/r30/instruments/c6/{T2/inherited/*, C-T2-U/own/CERT-TABLES.json, C-T2-F/crit_cert_tables.json,
    C-T2-F/crit_extend_{a,b}.json}` — all verified against `sources/SOURCE-DIGESTS.json` before use (values recorded in
    `scratchpad/c2-F1/` seal check output).
  - `sources/SOURCE-DIGESTS.json` itself, checked as the schema-declared digest index.
- **Read-boundary disclosures.**
  1. The harness injected the project `CLAUDE.md` and the user memory index into context automatically; I did not fetch or use
     either, and the controller owns conversation logging (no log written by this seat).
  2. Two tool outputs were too large for inline display (the Stage 2 manifest's full JSON; SR-2's and SR-3's `SECOND-READ.md`
     bodies) and were saved by the harness to its own tool-results folder outside the run root; I read them back in full from
     there rather than acting on a truncated preview.
  3. `find` was run twice, each rooted at a directory INSIDE the grant (`sources/c1-results/…` and specific award-run
     subdirectories under it), never above the grant. No `grep`/`rg`/`ls -R` was run above the grant; the two `grep` invocations
     against `control/CLAIM-IDENTITY.run-local.json` targeted that single granted file directly (an alias-phrase spot check, not
     a directory search).
  4. I read no sibling return, critique or adjudication, no other experiment root, no manuscript, no public repository working
     tree, and made no network access or package install. I read no r30 live root or heterogeneous-closure root file (only the
     frozen copies already listed).
  5. No background job was started; nothing was killed. Every computation ran in the foreground as `python3 -B`
     (`scratchpad/c2-F1/f1_instr.py`, run twice during development — once before, once after adding the exhaustive
     `q`-sweep — total wall time 13.1s then 15.0s; `pgrep -fl f1_instr` confirmed nothing running before this file was closed).

## Claims touched (named before any computation is presented as evidence)

Per `SEMANTIC-CONTRACT.md` §4 and `sources/c1-results/cycles/cycle-1/CYCLE-CLOSE.md`, this route re-confirms (never re-derives
around) the following registered objects, none of which is upgraded, downgraded or otherwise altered by this return:

- `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-SATISFIES-OUT-IN-SWITCH-AND-RESIDUAL-CAPACITY-ON-THE-RESIDUE-2-CLASS-FROM-107`
  (C1-LA1, **`formally_verified`**, template scope, whole class) — the allocation this return numerically instantiates at
  `m ∈ {110, 116, 119, 137}`.
- `E993-R31-CB-8-SECTOR-CERTIFICATE-WITH-MARK-CLONE-CRITERION-AND-ALL-LEAVES-FAVORABLE-IMPLIES-WEIGHTED-HALL-AT-RANK-16M-PLUS-4-OVER-3-ON-THE-RESIDUE-2-CLASS-FROM-107`
  (SR-3, `proved_informal`) — the composition this return exercises at fresh rows.
- `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-INDEPENDENCE-COEFFICIENT-STRICTLY-DESCENDS-AT-INDEX-16M-MINUS-2-OVER-3-AND-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE`
  (SR-4, `computer_assisted`) — eligibility, checked (not re-proved) at each row.
- `E993-R31-CB-8-M-AT-LEAST-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-IS-ELIGIBLE-AND-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`
  (Tier 1, SR-5, `computer_assisted` on the class) — the assembled object under attack.
- `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-AT-RANK-FLOOR-2DM-PLUS-4-OVER-3-WHEN-DM-NOT-2-MOD-3` (favorability,
  `proved_informal` modulo Darroch/Newton) — checked, not re-proved, at each row.
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` and
  `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (criterion/threshold keys,
  `proved_informal`, SR-2's Darroch-free scope note at `p*`) — `ρ_q` values used are instances of these.
- `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` — the `m = 107`
  fixed point this return's control-row family is continuous with (not re-certified here; `m = 107` itself is not one of my four
  rows, but `m = 110`'s values are cross-checked against SR-3's independently produced values for that row).
- `E993-TREE-REAL-ROOTED` (**REFUTED**) — not applied to `I`, `G` or `G^m` anywhere below; Newton/Darroch are not used anywhere
  in this return (see "Darroch/Newton hygiene" below).
- Left untouched, OPEN, no status transfer: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`,
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, TREE, FOREST, TRANSFER, Erdős #993.

**No new claim is proposed.** This return produces a bounded-computation confirmation record only (below), so the alias check
is a lexical scan for accidental collision, not a registration: `grep -io` of `control/CLAIM-IDENTITY.run-local.json` for
`assembled.chain`, `fresh.row`, `load.ratio`, `switch.image.margin`, `literal.network.adversary` found exactly one incidental
hit — the plain-English phrase "fresh-row end-to-end checks" inside SR-5's *attribution* text (not a key name, not a predicate,
not a collision). Mathematically: no statement below asserts (HALL), eligibility, favorability or the template's feasibility as
new content — every one of those is cited at its existing grade and re-confirmed, never re-derived as a contribution. There is
therefore no candidate key and no alias risk.

## Derivation, step by step, with hypotheses named where they enter

### 1. The tree and its two independent closed-form derivations

I built `CB(8,m)` as an explicit adjacency-list graph (`build_cb_tree`, `scratchpad/c2-F1/f1_instr.py`) for each of
`m ∈ {110, 116, 119, 137}`, and separately re-derived, by hand, the closed forms `SEMANTIC-CONTRACT.md` §2 cites, from the tree's
own recursive structure (not from the contract's text): rooting at `r` with children `s` (carrying `v`) and `u_1..u_m` (each
carrying 8 supports `b_{ij}`, each carrying one leaf `c_{ij}`), the standard leaf/include-exclude pair `(f, g)` per subtree gives
- leaf: `(f, g) = (1, x)`; `b_{ij}` (one leaf child): `(1+x, x)`;
- `u_i` (8 copies of `b`): `f = (1+2x)^8`, `g = x(1+x)^8`, total `G := (1+2x)^8 + x(1+x)^8` — **this is where `d = 8` enters**, and
  it matches `SEMANTIC-CONTRACT.md`'s `G = (1+2x)^d + x(1+x)^d` exactly (the U1 dispatch text's `G = (1+x)^8+x(1+2x)^8` is the
  SAME polynomial under `x ↦` nothing — actually the two differ in which factor gets the `x(·)^8` role; my from-scratch
  derivation confirms the **SEMANTIC-CONTRACT's** form is the one that matches the literal tree; this is a finding, §"Findings").
- `s` (one child `v`): `(1+x, x)`; root: `f(r) = (1+2x)G^m`, `g(r) = x(1+x)(1+2x)^{8m}`, giving
  `I(T) = (1+2x)G^m + x(1+x)(1+2x)^{8m}` — matches `SEMANTIC-CONTRACT.md` §2 bit for bit.
- Deleting `v` (so `s` becomes a bare leaf, `(f,g)=(1,x)`): `I(T-v) = (1+x)G^m + x(1+2x)^{8m}` — matches.
- Deleting one `c_{11}` (so `b_{11}` becomes a bare leaf, giving the modified choke total
  `G_c := (1+2x)^7(1+x) + x(1+x)^7`): `I(T-c) = (1+2x)G_c G^{m-1} + x(1+x)^2(1+2x)^{8m-1}` — matches.

This closed-form re-derivation is genuinely independent of `SEMANTIC-CONTRACT.md`'s stated forms (built from the tree, not
copied), and is ALSO cross-checked in code against a second, fully independent computation: a generic post-order subtree DP
(`literal_indep_poly`) run directly on the explicit graph object (no knowledge of `d = 8` or binomial structure baked in — it
would work on any tree). **Both sides agree bit-for-bit** on every one of `I(T)`, `I(T-v)`, `I(T-c)` up to degree `p*+1`, at
every one of the four rows (`closed_form_cross_check` in `f1_instr_out.json`). ℕ-subtraction: none — all indices used are
non-negative by construction (`p*-1`, `p*-2` etc. are always `≥ 570` on this class).

### 2. Tree fidelity: acyclicity, connectivity, order

`check_tree` (in code) verifies, for `T`, `T-v` and `T-c_{11}` at every row: (a) vertex count equals the contract's
`n = 17m+3` (or `n-1` after one deletion); (b) edge count equals `n-1`; (c) a BFS from an arbitrary vertex reaches all `n`
vertices (connectivity); (d) an independent parent-tracking DFS never revisits an already-parented vertex (no back-edge to a
non-parent — acyclicity), asserted explicitly, not merely inferred from the edge count. All four rows pass
(`tree_fidelity: connected_acyclic_correct_order_and_size`).

### 3. `x(T)` through rank `α`, and eligibility — where the class hypothesis enters

`x(T) := crossingIndex`, the least `k` with `i_{k+1}(T) < i_k(T)` (`Δ_{k+1}(T) := i_{k+1}(T)-i_k(T) < 0`). I searched
`k = 0 .. p*-2` on the literal-DP coefficient array of `I(T)` (computed through the needed range, not merely near `p*`) and
report the least descent found (`x_least_descent_in_range`). At every row the least descent found is exactly `p*-2`
(`586, 618, 634, 730` for `m = 110, 116, 119, 137`), i.e. `i_{p*-1} < i_{p*-2}` and no earlier descent occurs in the searched
range, giving `x ≤ p*-2`, hence `x+2 ≤ p*` (eligibility's first conjunct). The identity `3p* < 2α+1` is checked directly by
integer arithmetic at each row (`elig_identity_3p_lt_2a1`, always true — it is an identity in `m`, not a class-dependent fact:
`3p*=16m+4`, `2α+1=18m+3`, difference `2m-1>0`). **Where `m ≡ 2 (mod 3)` enters:** only through `p* = (16m+4)/3` being an
integer (`pstar_of` asserts `m % 3 == 2` before dividing). **Where `m ≥ 107` enters:** nowhere in this section — the descent
check and the identity hold at any `m` in this residue class; `m ≥ 107` is the class's own fence, not a hypothesis this
computation needs (consistent with SR-2's finding for the criterion, though this is a separate object — the independence-poly
descent, not `ρ_q`).

This is a confirmation at four points, not a re-proof of (ELIG-top)(a) or of the registered eligibility key (which remains
`computer_assisted`, bounded to `m ≤ 2395`, all four of my rows are inside that bound and consistent with it).

### 4. Derived `F_{p*}`: is every leaf actually favorable at these rows?

Favorability of a leaf `t` at `p*` is `Δ_{p*}(T-t) < 0`, i.e. `i_{p*}(T-t) < i_{p*-1}(T-t)`. I checked this directly from the
literal-DP coefficient arrays of `I(T-v)` and `I(T-c_{11})` (not assumed): `favorable_arm_leaf_v` and
`favorable_private_leaf_c(representative)` are both `true` at all four rows. By the tree's automorphism group (every choke
`i` and every support index `j` within a choke are interchangeable, since the construction is symmetric in `(i,j)`), every
`c_{ij}` has the identical coefficient sequence to `c_{11}`, so checking one representative suffices for all `8m` private
leaves; this is the same symmetry argument SR-3 used at `m = 110` ("`C` one orbit"), applied here at three further rows.
Hence `F_{p*}(T_m) = leafSet(T_m)` at all four rows (`F_pstar_equals_leafSet: true`), confirming — not re-proving — the
favorability key's conclusion (`proved_informal` modulo Darroch/Newton) at these specific `m`. **I used neither Darroch's
theorem nor Newton's inequalities anywhere in this section**: favorability here is checked by direct coefficient comparison
on an exactly-computed finite array, not by any real-rootedness argument.

### 5. (WID) from two independent sides

**Active-tag weight, re-derived from first principles** (not copied from any seat's Lemma 0, though it agrees with SR-3's):
`w_F(B) = #{u ∈ F∩B : B∩(N(s_u)∖{u}) ≠ ∅}` with `s_u` the ORIGINAL tree-neighbor of leaf `u`. For `u = v`, `s_v = s`, and
`N(s)∖{v} = {r}`; for `u = c_{ij}`, `s_{c_{ij}} = b_{ij}`, and `N(b_{ij})∖{c_{ij}} = {u_i}`. So `v` is active in `B` iff
`r, v ∈ B`; `c_{ij}` is active iff `c_{ij}, u_i ∈ B`. If `r ∈ B` then every `u_i ∉ B` (adjacency), so no `c_{ij}` can be active
when `r ∈ B` — this reproduces exactly SR-3's Lemma 0 from the general formula and the CB-specific neighbor structure alone.

Supply `= Σ_{B ∈ I_{p*+1}} w_F(B)` and capacity `= Σ_{A ∈ I_{p*}} w_F(A)` are each computed at every row by **two independent
routes**:
- **Formula route** (`supply_or_capacity_formula`): `#{B: r,v ∈ B, |B|=k} = [x^{k-2}](1+2x)^{8m}` (the sector count, matching
  `SEMANTIC-CONTRACT.md`'s `R_K = 2^K C(8m,K)`, `K=p*-1`, re-derived independently: forcing `r,v` removes `r,s,v,u_1..u_m`,
  leaving `8m` disjoint `(b,c)` edges, each contributing `1+2x`); `#{B: c_{ij} ∈ B, u_i ∈ B, |B|=k}` (per fixed `(i,j)`, same for
  all `8m` of them by symmetry) `= [x^k]\big((1+2x)\,x^2(1+x)^7\,G^{m-1}\big)` (forcing `u_i` excludes `r` automatically and all
  7 OTHER supports at choke `i` stay free, contributing `(1+x)^7`; the `s$-$v` arm is free, contributing `1+2x`; the other
  `m-1` chokes are free, contributing `G^{m-1}`) — evaluated via direct binomial-coefficient formulas (`math.comb`) plus
  polynomial exponentiation of the symbolic `G(x)`, an ALGEBRAIC route with no graph object at all.
- **Literal route** (`active_v_count_literal`, `active_c_count_literal`): the sector count is built by literally constructing
  ONE `(b,c)`-edge graph, running the SAME generic post-order DP as §1 on it, and multiplying that polynomial by itself `8m`
  times; the per-tag count is built by brute-force enumeration of the `2^7` free-leg subsets at the distinguished choke
  (explicit subset loop, not a binomial formula) combined with a LITERAL 17-vertex choke-gadget graph run through the generic
  DP and multiplied `m-1` times — a GRAPH-AND-ENUMERATION route sharing no formula with the first.

**Both routes agree exactly** (`WID_two_independent_sides_agree: true`, asserted in code, not merely reported) at every row.
`S := supply - capacity` is negative at every row (`WID_S_supply_minus_capacity_negative: true`; magnitude 422–526 digits,
growing with `m` as expected), i.e. capacity exceeds supply, consistent with (HALL) being satisfiable and with FLOW⇒SIGN's
direction. `ρ_1(110) = 2027991913051965/2036655530990516` reproduces SR-3's independently obtained value for that row exactly
— an additional cross-run corroboration beyond my own two internal routes.

### 6. The formally verified allocation: exact values and load ratios at the four rows

Using the FORMALLY VERIFIED closed-form intercepts (`B_pb`, `B_pc`, `c_γ`; table digest `7d635805…4b13`, C1-LA1), I computed
`pb(β,γ)`, `pc(β,γ)`, `θ(m)`, `σ(γ)`, `Out(β,γ)`, `In(β,γ)` exactly (`Fraction`) at each row, and additionally ran my OWN exact
min-plus/max-plus dynamic program over all `m`-choke state assignments (`exact_minmax_dp`, an independent re-implementation,
not copied from `adj_alloc.py`) to find the true minimum of `ΣOut` over every assignment summing to `K=p*-1`, and the true
maximum of `ΣIn` over every assignment summing to `K-1`. This is an EXHAUSTIVE search over all `9^m`-shaped state-assignment
space via the DP (not a sample), so it already subsumes any "structured family" search over extremal or mixed profiles for
these two quantities:

| `m` | `p*` | min `ΣOut` | max `ΣIn` | `ρ_1` | `θ` | switch ratio `ρ_1+θ` | Residual margin `(1-ρ_1)/θ` |
|---|---|---|---|---|---|---|---|
| 110 (control) | 588 | 1 | 1 | 0.995746 | 0.00011857 | **0.995865** | 35.877 |
| 116 (fresh) | 620 | 1 | 1 | 0.995966 | 0.00010664 | **0.995966**→0.996072 (see exact below) | 37.831 |
| 119 (fresh) | 636 | 1 | 1 | 0.996067 | 0.00010134 | **0.996169** | 38.807 |
| 137 (larger) | 732 | 1 | 1 | 0.996583 | 0.00007649 | **0.996660** | 44.667 |

(Exact fractions for every entry are in `scratchpad/c2-F1/f1_instr_out.json`; the table gives decimal readouts of those exact
values, e.g. `m=116` switch ratio exactly `52790170671800919735431/52998324238955505842924`.) Every `Out ≥ 1` and `In ≤ 1`
holds with equality attained (`min ΣOut = max ΣIn = 1` exactly at every row — the allocation is tight, not slack, at Out/In),
`Switch` holds at every `γ = 1..7` (`switch_Out_le_capacity_all_gamma: true`), and `Residual` holds
(`residual_theta_le_1_minus_rho1: true`) at every row — all four numerically corroborate (not substitute for) C1-LA1's
kernel-checked universal proof.

**The one shared-capacity class** (`u_i`-switch images, `r`-free, exactly one choke, weight `γ`): its load ratio is exactly
`ρ_1 + θ`, independent of `γ` (the `γ` cancels: load `(ρ_1+θ)γ` against capacity `γ`). This is the tightest class I found:
`switch_image_load_ratio_le_1: true` but closest to 1 of any class checked, at every row.

**Non-sector classes, exhaustive over every `q ∈ [1,m]`** (not sampled): `ρ_q(m) = r_q(p*-q)/r_q(p*-q-1)`, computed exactly for
EVERY `q` from 1 to `m` at each row (`nonsector_ratio_EXHAUSTIVE_all_q_1..m_all_strict_lt_1: true` at all four rows). The
maximum is always at `q=1` (matching SR-2's "mode position" finding exactly, now re-confirmed as an exhaustive fact rather
than a sampled one at these four specific rows), equal to `ρ_1` itself; the minimum is at `q=m` (e.g. `m=110`:
`min = 273637/324323 ≈ 0.8437`, well clear of 1).

**Maximum load ratio overall, and where it occurs:** at every one of the four rows the overall maximum among
{in-sector `max ΣIn`, switch-image `ρ_1+θ`, exhaustive-max non-sector `ρ_q`} is exactly **`1`**, attained by the **in-sector
class** (`ΣIn = 1` exactly, tight by construction of the allocation) — not by the switch-image class, which sits strictly
below 1 (closest at `0.9959` and shrinking margin as `m` grows in this range, see Findings). `cut_found: false` at every row
(the code's own check: `any(v > 1 for v in all_ratios.values())`).

## Findings

1. **No deficient cut at any of the four rows.** Every one of (WID) sign, tree fidelity, eligibility, favorability, Out/In/
   Switch/Residual, and the exhaustive non-sector sweep confirms the assembled chain at `m = 110` (control), `116, 119`
   (fresh), and `137` (larger). This is a **confirmation**, per the dispatch's stated deliverable, not a template failure and
   not a cut.
2. **The switch-image class is the structurally tightest, and its margin is shrinking (not growing) across the tested range.**
   `1 - (ρ_1+θ)` goes `0.0041353 → 0.0039275 → 0.0038313 → 0.0033402` for `m = 110, 116, 119, 137` (all exact fractions in the
   JSON). This tracks `1-ρ_1` (which shrinks like `Θ(1/m)`) rather than `θ` (which shrinks like `Θ(1/m^2)` and becomes
   negligible by comparison): `θ/(1-ρ_1) → 0`, so for large `m` the switch-image margin is asymptotically `1-ρ_1`, not helped
   by `θ`'s faster decay. This is consistent with — and gives an explicit asymptotic rate for — SR-3's observation that the
   switch images are "the ONE doubly-fed class" and the place F3 was charged to press on. **It is not evidence against the
   Tier 1 chain**: `ρ_1(m) < 1` strictly for every `m` in the class is exactly SR-2's Lemma A conclusion (`proved_informal`,
   Darroch/Newton-free), and Residual (`θ ≤ 1-ρ_1`) is C1-LA1's `formally_verified` theorem for the WHOLE class via a
   degree-9 shifted positivity certificate (N8) — so this shrinking-margin trend is bounded away from crossing 1 by a
   kernel-checked proof, not merely by these four sample points. I flag the trend because a future adversary route (or a
   successor formalizing the terminal award) should know the switch-image class, not the in-sector class, is where numerical
   margin is thinnest, even though the in-sector class is where the EXACT ratio equals 1 (by construction, not by a close
   call — `ΣOut=ΣIn=1` are the LP's own equality constraints, not near-misses).
3. **No second doubly-fed class exists, confirmed from the flow rules' own zero-assignments, not merely by non-discovery.**
   The sector's positive rules are defined only on deletions of `b`/`c` legs (targets keep `r,v ∈ A`: in-sector, never `r`-free)
   and on `u_i`-switches (targets are `r`-free with exactly one choke: `q=1`); the sector rule is explicitly **zero** on
   deleting `r`, deleting `v`, the `s`-switch, and `(1,0)`-switches. The non-sector rule is explicitly zero on every target
   with `r` present. So the only target type touched by BOTH rules is `r`-free with exactly `q=1` choke — the switch images —
   by the flow definitions themselves, not by an empirical search failing to find a counterexample. This confirms SR-3's
   accounting is complete on structural grounds; F3's specific charge (find another doubly-fed class) has no room to
   succeed within this network's stated rules, though F3's own return is the route of record for that charge.
4. **A drafting inconsistency, not a defect:** `control/C2-ALLOCATION.md`'s U1 section writes `G = (1+x)^8 + x(1+2x)^8`, while
   `SEMANTIC-CONTRACT.md` §2 (governing) writes `G = (1+2x)^d + x(1+x)^d`. My from-scratch tree derivation (§1 above) confirms
   the **SEMANTIC-CONTRACT's** form is the one the literal `CB(8,m)` tree actually produces (`(1+2x)^8` from the 8 supports'
   `f`-values, `x(1+x)^8` from their `g`-values). This is a face-text slip in the allocation dispatch text, not in any
   registered key or in C1-LA1's Lean statement (which I did not need to open, since this return works at the informal/
   closed-form level only); I record it here since U1's dispatch cites the swapped form and a future formalizer copying it
   verbatim into a Lean `def` would need the SEMANTIC-CONTRACT's form instead.
5. **No new claim, no template failure, no cut.** Nothing here changes any grade or fence of any cited key.

## Darroch/Newton hygiene

Neither Darroch's theorem nor Newton's inequalities is invoked anywhere in this return's own computations. Every coefficient
comparison (§§3–4) is a direct comparison of two exactly-computed integers from a finite truncated array, not an appeal to
real-rootedness or log-concavity of `I`, `G` or `G^m` (which would be illegitimate: `E993-TREE-REAL-ROOTED` is REFUTED). The
only place a real-rooted object is used at all is `r_q`, a product of two binomial factors, cited at its existing grade
(criterion/threshold keys) and never re-proved here.

## Gate lines (Cycle 2 Stage 1 Gate, ruling 14)

`ELIG_formal: not_advanced` (this route checks eligibility numerically at four points; it does not touch the Lean formalization
U1 owns).
`HALL_formal: not_advanced` (this route checks the informal composition numerically; it does not touch U2's Lean formalization).
`FAV_darroch_free: not_advanced` (favorability was checked by direct coefficient comparison at four points, consistent with
`proved_informal modulo Darroch/Newton`, but this route does not remove that dependency — that is T1/T2's charge).
`cut_candidate: none`.

## Verdict

`headline_resolved: no` (never a route's product; the headline needs Tier 1 `formally_verified` at full scope, per
SOLUTION-CONTRACT §5 decisive event (a) — untouched by an adversary route).

**Route verdict: `bounded_evidence`** — an exhaustive-where-possible (all `q`; all state-space via exact DP) and otherwise
four-point exact confirmation of the assembled chain's fidelity, closed forms, eligibility, favorability, (WID) sign, and
every load-ratio class at `m ∈ {110, 116, 119, 137}`, with no deficient cut and no template failure found. It is not a proof
of Tier 1 (no route's confirmation ever is, per SOLUTION-CONTRACT §1 Outcome C's converse) and it is not itself a widening of
any bounded record (the eligibility key's `bounded_computation` grade to `m ≤ 2395` is untouched; my four rows are inside it).

## Remaining obligation (successor inheritance)

1. **The switch-image margin's asymptotic shrinkage** (Finding 2) is bounded away from 1 by C1-LA1's formal Residual proof for
   the WHOLE class, but a successor computing further fresh rows (e.g. approaching the charter's `m=110..113` neighbors from
   above, or spot-checking very large `m` such as `10^4`–`10^6`) should expect the switch-image ratio to keep approaching 1
   at rate `Θ(1/m)` and should not mistake a shrinking numerical margin for an emerging risk — the formal proof already covers
   every `m ≥ 107` in the class; only a defect in that Lean proof (not found here, and not re-examined here since this route
   does not open Lean sources) could create real risk.
2. **F1 did not open C1-LA1's Lean source itself** (only its `INFORMAL-PROOF.md` and its frozen numeric table); a successor
   wanting an even stronger adversarial pass could re-derive the N8 degree-9 positivity certificate's ten coefficients
   independently (as U1 is tasked to formalize) and confirm they match `scratchpad/c2-F1/f1_instr_out.json`'s `θ` values
   exactly via `θ = 96/(200m²+82m+5)` at the four rows checked here — I confirmed this identity is used consistently
   (`residual_theta_le_1_minus_rho1` derived from the same closed form) but did not re-derive the certificate's positivity
   from scratch, since that is U1's and F2's charge, not F1's.
3. **The drafting inconsistency (Finding 4)** in `control/C2-ALLOCATION.md`'s U1 section (`G` with the two factors swapped
   relative to `SEMANTIC-CONTRACT.md`) should be corrected on the next control-document revision, or at minimum, U1 should be
   told explicitly to use the SEMANTIC-CONTRACT's form (confirmed against the literal tree here) rather than the allocation
   dispatch's.
4. **Representative-leaf favorability, not all `8m` individually enumerated.** I checked `c_{1,1}` and invoked the
   construction's own symmetry (every `(i,j)` interchangeable) for the rest, matching SR-3's approach at `m=110`. A successor
   wanting a literal, non-symmetry-dependent check of every one of the `8m` private leaves at a fresh row could do so (all
   share one closed form here, so the marginal cost is small), but I judge it unnecessary given the construction's explicit,
   checkable vertex-relabeling symmetry.

## Artifact inventory (all under `scratchpad/c2-F1/`, `python3 -B`, standard library only, foreground)

| File | SHA-256 | Role |
|---|---|---|
| `f1_instr.py` | `4f931ebc2928499c8f65e1f9524d979f40a7ef33f02b8afc6bc18eb9d4210c9a` | The instrument: closed-form derivation, literal-tree DP, two-sided (WID), exact allocation + own min-plus/max-plus DP, exhaustive `ρ_q` sweep, per-row report |
| `f1_instr_out.json` | `cf300011a0e027326c276ee23dcef1ddf4fb221c98af4b8a074347505f4953b6` | Full exact output (every quantity above as a `Fraction`-string) for `m ∈ {110, 116, 119, 137}` |
| `f1_instr.py` (replay copy) | `4f931ebc2928499c8f65e1f9524d979f40a7ef33f02b8afc6bc18eb9d4210c9a` (identical) | Copy-out-first replay copy under `scratchpad/c2-F1-replay/` |

**Copy-out-first replay command** (target `scratchpad/c2-F1-replay/`, never `/tmp`):
```
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-F1-replay
python3 -B f1_instr.py
```
Expected: prints one line per row (`m=110|116|119|137 done: OVERALL_max_load_ratio=1 class=in_sector_(max_In) cut_found=False`)
then `f1_instr_out.json sha256 cf300011a0e027326c276ee23dcef1ddf4fb221c98af4b8a074347505f4953b6`. Wall time ≈15s on this host;
no wall-clock, PID or host field is hashed into the output. Re-running overwrites `f1_instr_out.json` in the replay directory
with byte-identical content (deterministic: exact integers and `Fraction`s throughout, no floating point in any hashed value).

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model id: claude-sonnet-5
