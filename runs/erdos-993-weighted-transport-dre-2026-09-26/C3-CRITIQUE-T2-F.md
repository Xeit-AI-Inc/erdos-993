# Critique

Critic `C-T2-F` (orientation F, falsify) of seat `T2`, route `C3-T-02 GENERAL-SECTOR-SELF-COVERING` (orientation T), Cycle 3,
r30 (Erdős #993, weighted mixed-boundary transport). Date 2026-09-26.

**Boot.** Operating within VerityOS. Boot reads, exactly and only: `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full. No other VerityOS file was opened (the harness put the
wrapper session's `CLAUDE.md` and the user auto-memory index into context before the dispatch was read; neither was opened or
used as a source; see the read-boundary disclosure under `## Identity and seal audit`).

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-T2-F/` only.
Python standard library only, exact integers and `fractions`, `python3 -B`. No network, no installs, no Lean, no background jobs.

## Identity and seal audit

- **Dispatch file** `control/dispatch/c3-stage4/DISPATCH-C-T2-F.md`: SHA-256 `668eb972f4ff2e51b99dd9fcd14adb065cdd6152d57044ee6ee57ca3e38ac23e`,
  recomputed before reading. **MATCH.**
- **Capsule** `control/c3-critic-capsules/T2-PACKET-MANIFEST.json`: inner seal recomputed as SHA-256 of the canonical JSON
  without `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline):
  `083892f8a68c26f59c23f1fda93341f411ef3f2655eabc05d156d62cd840c9eb`. **MATCH.** All 14 member digests and byte counts
  recomputed: **14/14 MATCH**.
- **Stage 4 dispatch manifest** seal `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7`: **MATCH**.
- **Stage 3 packet manifest** seal `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797`: **MATCH**.
- **Stage 2 packet manifest** seal `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`: **MATCH** (1,051 members;
  canonical JSON 229,980 bytes, reproduced; T2's `verify_seal.py` replayed and agrees).
- **Digests the return lists.** The 13 inventoried scratch files (8 scripts, 5 outputs) under `scratchpad/c3-T2/`: **13/13 MATCH**
  against the return's table. The Stage 2 members the return quotes by prefix (`CLAIM-DISTINCTIONS.json` 18,209 B `7327b0ae…`,
  `CLAIM-IDENTITY.run-local.json` 2,469,806 B `b8f3c2a1…`, `RESIDUE-CHECK.json` 1,182 B `281ddd08…`, `SOURCE-DIGESTS.json`
  232,777 B `e82494df…`, `C3-ALLOCATION.md`, `C3-STAGE1-GATE.md`) agree with the Stage 2 manifest's entries (checked against the
  manifest; the three registry/distinction files themselves are not capsule members and were not opened).
  `sources/authority/CLAIM-IDENTITY.json` (read for the alias check; a `sources/` member) digest `eba20be3…` matches
  `SOURCE-DIGESTS.json`.
- **Stage 3 read-boundary record.** `C3-STAGE3-READ-BOUNDARY-DISCLOSURES.json` lists for T2 exactly "one non-recursive ls
  scratchpad/ (names only)", consistent with the return's own disclosure.
- **Replay parity.** Copied out by explicit file name into `scratchpad/c3-crit-T2-F/replay/` (byte-identical to the inventory),
  then run from `scratchpad/c3-crit-T2-F/run/`. T2's scripts hard-code `sys.path.insert(0, …/scratchpad/c3-T2)`, so T2's own
  "copy-out-first" replay in `c3-T2-replay/` imported `gsc_lib` and `theorem_g1_check` from the ORIGINAL directory, not from the
  copy (process finding; harmless here because the files are identical). I patched the path to my copy; all five outputs
  reproduce **byte-identically** (`cmp`).
- **Critic read-boundary disclosure.** (a) Harness ordering: `CLAUDE.md` and the user auto-memory index were injected before the
  dispatch; not opened, not used. (b) Two non-recursive listings above my grant, names only, no content read:
  `ls cycles/cycle-3/stage4/` (output: `critics`) and `ls cycles/cycle-3/stage4/critics` (output: `F2 U1 U2`), run while
  checking whether my output directory existed. (c) `ls sources/` (non-recursive; within grant). (d) One read in place of T2's
  original `scratchpad/c3-T2/o3_shadow_experiment_output.json` (read-only, after the copy but before switching to the copy):
  a copy-out-first ordering deviation. (e) `grep` over the single file `RETURN.md` (capsule member) and over my own replay copies.
  No other return, critique, adjudication, second read, experiment root or external source was read.

## Independent re-derivation

**Own instrument** (`crit_lib.py`, SHA-256 `eefdd628…`; shares no code with T2): trees checked for connectivity and acyclicity
separately; independence polynomials of `T − D` by forest DP; `x` through rank `α` (terminal difference included); eligibility
`x + 2 ≤ p`, `3p < 2α + 1` literally; `F_p(T)` DERIVED from `Δ_p(T − v) < 0` on the original tree; `S(T, p)` from
`q_v(j) = i_j(T − H_v) − i_j(T − R_v)` (polynomials only); supply and capacity from brute-force enumeration of `I_{p+1}`, `I_p`
with the literal active weight; `supply − capacity = S` asserted from these independent sides on every full row; (D) ∪ (S)
literal; Dinic max-flow on clone-expanded networks.

**Fixed points** (`fixed_points.py`): `K_{1,12}`, `p = 8`: `n = 13`, `α = 12`, `x = 6`, eligible `{8}`, 12 favorable, supply
1980, capacity 3960, `S = −1980` (asserted), 0 switches, max-flow 1980. `CB(8,92)`: `n = 1567`, `α = 829`, `x = 490`, `p = 492`
eligible, 737 leaves, `v` and a private leaf favorable, `R_491/R_490 = 492/491`. (T2's instrument reproduced none of the common
brief's fixed points before use; process finding.)

**Fidelity of T2's generators (checked first, protocol duty 2).**
- Weight: `gsc_lib.w_F` is literal (active tags, `W_v = N(s_v) ∖ {v}` computed generically). **Pass.**
- Relation: `switch_targets` is literal (S); the G1/G3 flows use (D) only, as stated. **Pass.**
- `F`: **hard-coded** in every generator as `P ∪ F_extra` (all star leaves plus `v`, i.e. all leaves), never derived from
  `Δ_p(T − v)`. Shared rule ("`F_p` DERIVED … never hard-coded 'all leaves'") **violated**.
- Eligibility: `theorem_g1_check.py` checks none. My eligibility table (`g3_instance_crit.py`): `cbstar_d2m2t2` (`n = 17`, `x = 5`,
  eligible `{7}`) — of the charter ranks T2 evaluated (`3..7`; T2's "`p`" is the SOURCE size `= p + 1`) only `p = 7` is eligible,
  where the deficit is 0; `hetero_223v4` (`n = 17`, `x = 6`, eligible `{8}`) — none of the evaluated ranks `2..7` is eligible;
  `mutual_witness_Q3` (`n = 11`) — no eligible rank at all. **Every positive deficit T2 reports in §1 (42, 54; 11, 35, 13) is
  at an ineligible rank.**
- WID: **no generator computes `S` or asserts `supply − capacity = S`** anywhere (no aggregate, no `q_v`). The return's claim
  that (WID) is "asserted on every generator's own instances … independently on both sides" is unbacked (cf. ruling 24, which
  named exactly this T2 omission in Cycle 2).
- `x`: `first_strict_descent_and_alpha` appends `i_{α+1} = 0` and scans through `α`. **Pass.**

Consequence: T2's numbers are struck as evidence about the charter object `(T, p, F_p(T))`; they survive only as checks of the
algebraic identities of Propositions 1–2 and Theorem G1 for the stated `F` (which those statements permit). The charter-object
evidence below is mine.

**End-to-end on actual trees, F derived, eligible ranks only** (`search_elig.py`, `tree_endtoend.py`): exhaustive over
heterogeneous CB-pattern trees (path `r–s–v`, chokes `u_i ~ r`, star centres `b_ij ~ u_i`, `t_ij ≥ 1` leaves; up to 4 chokes,
≤ 3 stars per choke, `t ≤ 4`, `n ≤ 26`): 2,237 shapes with a nonempty eligible window (304 with `t_min ≥ 2`). On 38 rows (all
26 shapes where the residual layer is nonempty at an eligible rank, plus 12 random others), at every eligible `p`: WID asserted
and held (38/38); `P ⊆ F_p` (38/38); (A4) (38/38); Proposition 1 on every sector member (38/38); Proposition 2 for both
`q ∈ Q` on every sector member (38/38); the exact sector deletion-only max deficit by max-flow equals the critic closed form
of `## Attacks and findings` CD-2 (38/38; all values 0 at these orders); the (D) ∪ (S) sector max deficit also recorded.
Sample: `[[1],[1,1,1],[1,1,2]]`, `p = 8`: `S = −5685`.

**Theorem G1 identity** (`g1_g2b_crit.py`): `φ(X) = Σ_X[(1 − |Q|)w + K] − w(∂_sec X)` on 240 random sector subfamilies (including
members of weight `> β`) of four trees at eligible `p`, `F` derived: **0 failures**. **G2b**: 800 random subfamilies of
heterogeneous claw products `(2,3,5)`, `(2,2,4,6)`, `(3,3,4)`, every `k`: **0 violations**. G2 re-proved by hand (below).

**§5 third instrument** (`o3_rows_crit.py`; own DP; own enumeration of good per-choke states raised to the `m`-th power, not via
the `g_d` closed form, cross-checked against `g_d` for `d = 1..10`):

| Row | `n` | `α` | `x` | `p` eligible | `k` | `Z′ = dm − k + 1` | `δ` | `λ₂` | `k²` | `x₀` | `|X″|` digits | `|X″|/R_k` |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `CB(8,108)` | 1839 | 973 | 575 | 577 yes | 576 | 289 | 288/289 | 332,350 | 331,776 | −287/289 | 403 | 6.4818317×10⁻⁹ |
| `CB(7,144)` | 2163 | 1153 | 671 | 673 yes | 672 | 337 | 336/337 | 452,254 | 451,584 | −335/337 | 465 | 2.5595635×10⁻¹⁵ |

Every entry of T2's §5 table is reproduced. The definitions of `Z′`, `λ₂`, `x₀` are taken from T2's text/experiment (their
provenance, T1 Cycle 2 and SR-SECTOR Registration 4, is outside my read boundary; the "digit-for-digit match with Registration 4"
is therefore not checkable by me — not struck, not confirmed).

## Attacks and findings

**Theorem G1 (self-covering reduction).** The per-`q` exit identity and the decomposition of `φ` are correct; I re-derived them:
for `X` in the sector, `N_D(X) = ∂_sec(X) ⊔ ⨆_q {B ∖ {q}}` (deleting a non-`Q` vertex keeps `Q`; the `q`-exits lack exactly `q`),
and `w(B ∖ {q}) = w(B) − κ_q` because `B ⊆ Q ∪ (star forest)` and star-forest witnesses lie outside `Q`. The removal argument for
`w(B_0) ≥ W*` is sound (both brackets `≥ 0`). Findings:

- **F-1 (major, scope; critic-derived lemma CD-1).** The "arbitrary `Q`, general `β`, `K`" generality is empty. Under §0's own
  hypotheses ((A4), (H-attach), all `t_i ≥ 1`, `M ≥ 1`):
  (i) every leaf of `T` outside `P` lies in `Q ∪ N(Q)` (a centre has degree `≥ 2`); a leaf `v ∈ N(Q)` has its support in `Q`, so
  `W_v = N(s_v) ∖ {v}` is disjoint from the independent `Q` and (A4) forces `W_v = ∅`, i.e. `T = K_2`; hence `F_Q ⊆ Q`.
  (ii) `K = β + #{v ∈ F_Q : |W_v| = 1} ≤ 2β`.
  (iii) So `c := K − (|Q| − 1)β ≤ 0` whenever `|Q| ≥ 3`; and for `|Q| = 2`, `β = 2` forces both `Q`-vertices to be leaves on a
  common support of degree 2, i.e. `T = P_3`, contradicting `M ≥ 1`. For `|Q| = 1`, (A4) gives `β = K = 0`.
  (iv) Since every sector member has `w ≥ β`, `φ(X) ≤ c|X| ≤ 0` for every sector `X` whenever `c ≤ 0`.
  Therefore **a positive sector deletion deficit is possible only when `|Q| = 2`, `β = 1`, `K = 2`**: `Q = {r, v}`, `v` a leaf
  whose support `s` has `N(s) = {v, r}`, and `T − N[Q]` a star forest attached at centres to the vertices of `N(r) ∖ {s}` — the CB
  pattern with heterogeneous branching `d_i` and star sizes `t_ij`. There `c = β = 1`, `W* = 2`, and `R*` is exactly the weight-1
  stratum. (Grade: `proved_informal`, critic-derived, STATED — needs an isolated second read.)
- **F-2 (moderate, formula).** The corollary's general formula `(K − (|Q|−1)β)·[e_k − e_{k−1}]` is not the maximum when
  `0 < c ≠ β` (on `R*`, `φ(X) = c|X| − β|∂X|`, so the full-layer value is `c·e_k − β·e_{k−1}`); by F-1 such parameters are
  unrealizable, so no reported number is wrong, but "fully closed … any `|Q|`, any `β`, any `K`" is struck as an overstatement.
  **Negative coefficient (attack-brief question):** `φ` remains an identity; `c < 0` means every nonempty sector family is
  strictly self-covered by its own exits (`φ(X) ≤ c|X| < 0`). The corollary's claim "`R* = {w = β}` exactly" is false there
  (`W* = 1 < β = 2`, so `R* = ∅`); the printed value 0 is right only because of the `max(0, ·)` wrapper. The `|Q| = 3` fixed point
  therefore tests a trivial case (and its tree, `n = 11`, has no eligible rank).
- **F-3 (moderate, missing hypothesis).** Proposition 1 needs **`P ⊆ F`** (every star leaf favorable); §0 never states it and the
  generators hard-code it. If a star's leaves are unfavorable (favorability is uniform per star by leaf symmetry), that star
  contributes weight 0 in every state and the residual is not a claw product. On all 38 eligible rows I tested, `P ⊆ F_p` held
  (`bounded_computation`).
- **F-4 (minor).** §0's "standard fact" that a connected subgraph of a tree meets the rest in exactly one edge is false in general
  (path `a–x–c–y–b`, `Q = {a, b}`: `{c}` meets `N[Q]` in two edges). Harmless in the CB pattern (`N[Q]` connected). Proposition 1's
  justification that the attachment vertex is never in `B` is garbled; the correct one-line reason is that it lies in `N(Q)`.
- **F-5 (minor, wording).** The `Q`-exits are private only WITHIN the sector: each exit `B ∖ {q}` is also a deletion target of
  non-sector sources `B ∖ {q} ∪ {y}`. G1 says nothing about families mixing sector and non-sector sources (the open part of
  (HALL) per the allocation). The return limits its scope correctly; the word "private" should carry "within the sector".

**Theorems G2 / G2b.** G2 is correct (re-proved: chains through a rank-`k` element `x` number `k!(M−k)!∏_{i∉E(x)} q_i`, out of
`M!∏q_i`). **F-6:** it is the generic chain-measure LYM inequality (valid in any product of claws by chain counting), not a
normalized-matching statement; it is **not used** by G2b or G3 (G2b is an independent edge double count — the grade table's
"crude … bound from G2" is wrong); T2's `check_G2` evaluates only the full layer (the equality case), not the "several proper
subfamilies" its docstring claims. G2b is correct and one-directional, never claimed sharp (confirmed). **F-7:** the "hundreds of
random and extremal subfamilies" are **114** in the shipped output.

**Theorem G3.**
- **F-8 (major, proof error; critic repair).** The algebra is wrong. From `4k ≥ |Q| + Q_tot` the sufficient condition
  `k(1 + q) ≥ Q_tot + q` reduces to `|Q|(1 + q) − 4q ≥ Q_tot(3 − q)`, not `|Q|(1 + q) + 4 ≥ Q_tot(3 − q)`. At `|Q| = 2`, `q = 3`
  (exactly the `t = 2` case) the correct form reads `−4 ≥ 0`: false. Witness: `Q_tot = 30`, `k = 8` satisfy `4k = 32 ≥ 2 + 30`
  but `4k = 32 < Q_tot + q = 33`. So the proof as written does not cover `q_min = 3`. **Repair (critic):** in the only nontrivial
  case (F-1) `N[Q] ⊇ {r, s, v, u}` so `n ≥ Q_tot + 4`, giving `(Q_tot + 4)(1 + q) ≥ 4(Q_tot + q) ⟺ Q_tot(q − 3) + 4 ≥ 0`, true for
  `q ≥ 3`; alternatively use `k = p − 1 ≥ x + 1`, which the return discards.
- **F-9 (moderate).** "`k = p − 1`" holds only for `|Q| = 2`; in general `k = p + 1 − |Q|`. The `|Q| ≠ 2` cases are rescued by
  F-1 (trivially non-deficient), not by the stated proof.
- **F-10 (major, certification).** The end-to-end check is at the **wrong rank**: `g3_main` enumerates sources of size
  `p_elig = x + 2 = 10`, i.e. charter `p = 9 = x + 1`, which is **not eligible**. At the true eligible `p = 10` (my instrument, `F`
  derived, 13 favorable = all leaves, WID asserted: supply 74,154, capacity 127,390, `S = −53,236`): the sector has 404 members,
  supply 3,368, deletion deficit 0, and **zero weight-1 members** (`k = 9 > M = 5`, so `R*` is empty). T2's own output records
  `crude_ratio = None`, `crude_predicts_non_deficient = false`. The check is vacuous and mis-ranked; struck.
- **F-11 (major, content; critic-derived bounded finding CD-4).** G3 appears to be **vacuous**. The residual `R*_k` is nonempty
  only if `k = p − 1 ≤ M`, i.e. `x ≤ M − 1`. Exhaustively over the 304 `t_min ≥ 2` shapes with an eligible window (`n ≤ 26`) and
  over 74 larger family rows (1–10 chokes, 5–80 stars per choke, `t` mixes `{2}`, `{2,2,2,3}`, `{2,3}`), **`x ≥ M + 1` on every
  row**, so `R*` is empty at every eligible rank (minimum `x − M = 1`). At the row T2 cites for "real margin", `CBstar(8,86,2)`,
  my DP gives `n = 2153`, `α = 1463`, `x = 701` (T2's value reproduced), eligible `p ∈ [703, 975]`, so `k ≥ 702 > M = 688`: the
  layer is empty and the "517 vs 701" comparison (which conflates `k` with `x`) shows nothing about G2b. `bounded_computation`;
  the general statement `x(T) ≥ M` for the `t_min ≥ 2` CB pattern is an open question I pass on.
- On quantifiers (attack brief): G3 is stated for every sector subfamily (not only the whole sector) and at every eligible `p`
  (monotone in `k`); it is not weaker than the registered `CBstar` corollary in quantifier, only in that its content is (so far)
  empty.

**Critic-derived advance CD-2 (the step the return leaves open — its Remaining obligation 2).** *Exact heterogeneous sector
deletion deficit.* In the CB pattern of F-1 with `P ⊆ F`, `q_i = t_i + 1`, `k = p − 1`, and `e_j` the elementary symmetric
polynomial:

```text
max over X ⊆ S^Q_{p+1} of [ Σ_X w_F − Σ_{N_D(X)} w_F ]  =  max(0, e_k(q_1,…,q_M) − e_{k−1}(q_1,…,q_M)).
```

*Proof.* By G1 and F-1 the maximum is over `X ⊆ R*_k`, the rank-`k` layer of the product of claws, where `φ(X) = |X| − |∂X|`
(`c = β = 1`; in-sector shadow members have weight 1). The product of claws is a normalized-matching poset: each claw (ranks
`1, q_i`) is trivially normalized matching with log-concave rank numbers, and the classical product theorem of Harper and of
Hsieh–Kleitman (products of normalized-matching posets with log-concave Whitney numbers are again such) applies. Hence
`|∂X|/e_{k−1} ≥ |X|/e_k`, so `φ(X) ≤ |X|(1 − e_{k−1}/e_k) ≤ max(0, e_k − e_{k−1})`, with equality at `X = R*_k` or `X = ∅`. ∎
At uniform `t` this is the registered `CBstar` formula; at `q ≡ 2`, `M = 736`, `k = 491` it gives `R_491 − R_490 = |R_490|/491`,
the contract's `CB(8,92)` shortfall; at `q = (3,4,5)` it gives 11, 35, 13 — exactly T2's heterogeneous fixed point 2, which the
return says has "no closed form yet". Corroboration: 81 abstract `(q, k)` rows by exact max-flow (`hetero_maxdef.py`, 0
mismatches; the full layer is always optimal) and 38 tree rows at eligible ranks (all 0 there). Consequence: the exact
non-deficiency criterion is `e_{p−1}(q) ≤ e_{p−2}(q)`; G2b/G3 are sufficient conditions for it and are superseded. **Grade:
`conditional`** on the classical product theorem (cited from the critic's own knowledge; not a run source; the synthesis may
accept it as a classical import or require a self-contained proof), STATED, needs an isolated second read.

**§6 / O3.**
- The switch-dead reading of `X″` is correct (re-derived: in the root-plus-arm sector a choke `u_i` has exactly two neighbours in
  `B` iff exactly one of its supports is present; the switch target activates the private leaves present in that choke and
  deactivates `v`; `s` also admits a switch, to a weight-0 target). `g_d` confirmed by my own enumeration for `d = 1..10`.
- **F-12 (certification) / CD-3 (critic-proved).** "No dead end for `d = 1..8` (own exhaustive search)" is **unbacked**: no shipped
  code performs it (`o3_structure.py` checks only `g_d` for `d = 1..6`; `o3_shadow_experiment.py`'s docstring claims the check but
  the code has none; `classify_states` is never called). Struck as a computation. The fact is true for **every** `d`, with a
  two-line proof: a good state with an empty branch and `#S = 0` extends by `L`; with `#S ≥ 2` by anything; with `#S = 1` it has
  `#L = 0` (else bad) and extends by `S`. (`proved_informal`, critic-derived; my check `d = 1..10` agrees.)
- The shadow experiment (9/9 strictly above `δ`; 2 of 9 below 1) is backed by the shipped output; T2 never presents it as
  target-scale evidence (confirmed). By CD-2 at uniform `t = 1` (the registered key), the deletion residual at `CB(8,108)/577` and
  `CB(7,144)/673` is positive (`R_k/R_{k−1} = 2Z′/k = 578/576` and `674/672`), so switch arcs are necessary there; O3 is unchanged.

## Mechanism-equivalence and fence check

- **Not a refuted key.** G1/G3/CD-2 are deletion-only statements about one source family (a sector) under the literal active
  weight, diagnostic, never proposed as the transport mechanism: distinct from `E993-R23-LITERAL-DELETE-ONLY-HALL` (REFUTED;
  unweighted cardinality Hall over the whole r23 tagged top side on every tree — verified against the master registry text in
  `sources/authority/CLAIM-IDENTITY.json`) in scope, weight and role. Not own-support unit capacity, per-leaf injectivity,
  occupancy domination, signed cross-tag or covariance. `E993-R28-TREE-LEAF-SLOT-DOMINANCE` is a different object (confirmed).
- **Closed region / settled family.** At uniform `t` (and uniform `d`) G1's corollary **is** the registered
  `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` restated (the allocation's record of that key already includes the `t ≥ 2`
  every-subfamily corollary via (LB)); it registers nothing new at that scope. **Exact increment of the return:** heterogeneous
  `d_i` (immaterial to the residual, which depends only on the multiset of star sizes) and heterogeneous `t_i` in the reduction
  (Propositions 1–2 and the `R*` reduction), plus G3's heterogeneous sufficient condition (repaired; empty on every tested row).
  The "arbitrary `Q`, arbitrary tree" increment is nil (F-1). With CD-2 the heterogeneous residual becomes exact.
- **(LB)** is cited at its exact registered statement (verified: `E993-R27-FOREST-DESCENT-LINEAR-BOUND`, VERIFIED,
  `formally_verified`, award C1-LA4). No census value enters a proof step (§4's `x = 701` is used as illustration only; F-11
  shows it illustrates an empty layer). No RTree wording. No quotient, (LIFT) or (INV) use. Sector Hall is never called (HALL);
  the primary aggregate is untouched. Fences hold.
- **Alias check.** The return proposes **no** `E993-R30-…` names, so the "names are predicates" question is moot; the synthesis
  must name anything it registers. Lexical check against the master registry (434 keys; `sources/authority`): no key contains
  CLAW, SELF-COVER, STAR-FOREST, PRODUCT, HETEROGEN, WEIGHT-INERT, LYM or SECTOR; the two `…-NORMALIZED-COMPARISON` keys are
  unrelated objects. The run-local registry is not a capsule member, so G1/G3/CD-2 were compared with the `CBstar` key only
  through the allocation's record of its statement. Mathematically: CD-2 strictly generalizes the `CBstar` formula (uniform
  `q` ⇒ `e_k = C(M,k)q^k`); G3 generalizes its `t ≥ 2` corollary. Suggested predicate name if registered:
  `E993-R30-STAR-FOREST-SECTOR-DELETION-DEFICIT-EQUALS-ELEMENTARY-SYMMETRIC-GAP`.

## Certification audit

Struck (unbacked by the shipped evidence):
1. "(WID) … asserted on every generator's own instances … independently on both sides" — no generator computes `S`.
2. "Fix a rank `p` and `F := F_p(T)`" as a description of the instruments — `F` is hard-coded in every generator.
3. G3 end-to-end "At the smallest eligible `p = x + 2 = 10`: … supply 7,306 = max-flow 7,306 … 1,066 sector members" and
   "Theorem G3 confirmed on this instance" — computed at charter `p = 9`, not eligible (F-10).
4. "confirming this theorem … has real margin at the actual scale that matters" — the layer is empty there (F-11).
5. "no dead end … for `d = 1..8` (own exhaustive search)" — no such computation is shipped (F-12); the fact itself is now proved.
6. "G2 … exact equality/inequality verified on 5 … configurations" — equality at the full layer only; no proper subfamily.
7. "hundreds of random and extremal … subfamilies" — 114.
8. "fully closed for uniform `t` (any `|Q|`, any `β`, any `K`)" — only `c ≤ 0` (trivial) or `c = β = 1` occur (F-1, F-2).
9. "every reported computation was verified by an explicit copy-out-first replay" — the replay imported the original modules
   via the hard-coded `sys.path` (outputs nonetheless reproduce byte-identically under my corrected replay).

Backed (retained as stated): the 13 script/output digests; Stage 2 seal and member count; Propositions 1–2 (`ALL_OK`, and my
38 eligible rows); the §1 max-flow values at the ranks T2 evaluated (as identity checks only); the §5 table (my third instrument);
`g_d` for `d = 1..6`; the 9-row shadow experiment; "`x` through rank `α`".

Not checkable within my boundary: the digit-for-digit agreement with SR-SECTOR Registration 4 and T1's Cycle 2 numbers.

## Verdict

verdict: retained_narrowed
headline_resolved: no

Narrowed statement of what survives. **G1** (Propositions 1–2, the `R*` reduction) is correct, `proved_informal`, with the added
hypothesis `P ⊆ F` and the scope made exact by CD-1: its only nontrivial instance is the heterogeneous CB pattern
(`Q = {r, v}`, `β = 1`, `K = 2`); all other `(Q, β, K)` are trivially non-deficient. Its uniform-`t` corollary is the registered
`CBstar` key restated. **G2** is correct but a generic chain-count LYM, unused downstream; **G2b** is correct and non-sharp.
**G3** is true only with the critic's repair of its algebra (F-8) and is so far vacuous (F-11). The §5 reproduction stands at
`bounded_computation`. O3 is not advanced beyond T2's honest diagnosis. Every number from T2's generators is struck as evidence
about `(T, p, F_p(T))` (hard-coded `F`, no WID assertion, ineligible ranks) and survives only as an identity check. The
mathematics of G1 (with `P ⊆ F`) and of CD-1 is complete at `proved_informal`; CD-2 is complete modulo the classical product
theorem.

## Remaining obligation

1. **Second read** of CD-1 (`proved_informal`) and CD-2 (`conditional`), and a ruling on CD-2's classical import (the
   Harper / Hsieh–Kleitman normalized-matching product theorem) or a self-contained proof that the product of claws with
   heterogeneous `q_i` is normalized matching between consecutive ranks. With it, the exact sector deletion deficit on every
   star-forest sector satisfying (A4), (H-attach), `P ⊆ F` is `max(0, e_{p−1}(q) − e_{p−2}(q))` in the CB pattern and 0 otherwise.
2. **Vacuity of G3:** prove `x(T) ≥ M` (equivalently `R*_{p−1} = ∅` at every eligible `p`) for CB-pattern trees with `t_min ≥ 2`,
   or exhibit a row with `x ≤ M − 1`; until then G3 registers nothing beyond an empty-layer observation.
3. **O3 unchanged:** (D) ∪ (S) sector Hall at `CB(8,108)/577` and `CB(7,144)/673`, where the deletion residual is positive.
4. **Mixed families:** the Hall condition for families mixing sector and non-sector sources that share the `Q`-exits is untouched.
5. (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` OPEN; the primary aggregate untouched.

T2's own Remaining obligation is exact on items 1, 4, 5; item 2 is answered conditionally by CD-2; item 3 is superseded by
CD-2; it omits the `P ⊆ F` hypothesis and the vacuity question.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-T2-F/`
(`python3 -B`, standard library only; every script run in the foreground to completion; no background job was started).

| file | SHA-256 |
|---|---|
| `crit_lib.py` | `eefdd628439899efef070fe618bb3a596049628bb1bbce5fd14bb8fe8e1d0422` |
| `fixed_points.py` / `fixed_points_output.json` | `c91ee48ec16cf8a0decff2c8b29ff673d0fc42fe4e4ff616502bd0a8509137a3` / `94463998bab797fd224ca78cc9bb42244986f08f57031bbed5503cc8cc250df8` |
| `search_elig.py` / `search_elig_output.json` | `02d896ffe0b615924ada8e70890ebb5394ad7cbc7537313623d70b776a9e0412` / `7e1a22019b86563d499b1794f88ecc55015bc77ca720d5dc6f0f3ad15131209f` |
| `vacuity.py` / `vacuity_output.json` | `75b4f0a748b54fece2320eeab86457d7cdc4646396fac3ea6e8699cfc69a246d` / `273dc12d9a4b09dec2f6f8c066d045ce8409be75eecc02b04f4795f7143e3f66` |
| `hetero_maxdef.py` / `hetero_maxdef_output.json` | `4e2bdaf5b7821332a346e0d447262ac68bca3f6c6895626644387fc8d7d9b5f7` / `5e1176c10bb0179d3b7e7530bf5bfd36a072882f17aae292c579a3cdabd77ded` |
| `tree_endtoend.py` / `tree_endtoend_output.json` | `66aa36838d70d69a509617102a47ca3adced6f3a7d0e3a540b7729b88df2b743` / `47afdf240cfb6ba2f29ed1bda8ee86f0285bac66ed9d98a065dc17f6e4220951` |
| `g1_g2b_crit.py` / `g1_g2b_crit_output.json` | `1498a0be4c58665b0568e221575d628f0e6a32367f2ff5ff169869e7fcbefc0a` / `14e6d6d46967859161192bd5c482d6dfe080944664be9b1e7bca9bc54f771f49` |
| `g3_instance_crit.py` / `g3_instance_crit_output.json` | `a6654c6dc52b48867f8c9bed8682caebfe29c02261f617ba9e8099f1ed87535d` / `ab0b597b5a8c4277885d37b226b968e0348e14eaface98d322d9321b3ef853ae` |
| `cbstar_t2.py` / `cbstar_t2_output.json` | `30f8ddbddc19d9cfd4a5b298b95f1474ad74fc4e6b68cbe54b83e6d126fa7952` / `0653155fb7004832e07af92cc4560ca270abf215f74a1ce32f6f7719336542b5` |
| `o3_rows_crit.py` / `o3_rows_crit_output.json` | `2a756977d354b1f82fcdba1ec55007bc6d13d4462392b41a2a77466a483e0389` / `67893f05698e0379f698c66a9348b240baf17c6112dbe2b6c91f619fa0a21205` |
| `replay/` | byte-identical copies of T2's 13 inventoried files (digests as in the return) |
| `run/` | T2's scripts with `sys.path` repointed to `run/`; outputs byte-identical to T2's five inventoried outputs |
