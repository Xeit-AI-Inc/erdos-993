# Orientation Adjudication

Stage 5 adjudicator, orientation **T (prove)**, Cycle 1, run r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`),
Erdős #993, correctly weighted mixed-boundary transport. Portfolio: returns `T1` (`C1-T-01 WEIGHTED-SHADOW-NORMALIZED-MATCHING`)
and `T2` (`C1-T-02 DEFICIT-BUDGET-AND-ROOTED-RECURRENCE`), with critiques `C-T1-F`, `C-T1-U`, `C-T2-F` and `C-T2-U`. Date 2026-09-26.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the dispatch directs. The subsystem I loaded is `experiments/`,
limited to this run's sealed capsule. I read no other VerityOS file. The host injected the root `CLAUDE.md` and the auto-memory
index at session start; I did not read them as sources and nothing below relies on them.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

**Capsule seal.** For `control/c1-adjudicator-capsules/T-PACKET-MANIFEST.json` I recomputed SHA-256 over the canonical JSON
without `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline). The result is
**`f12bc8b825a4f32abc0eb8e48ac034c89a1aad6823f05dd9297bab70d8758d73`**, equal to the dispatched and recorded value. All 20 listed
members match their sha256 and byte counts on my own recomputation. They are:
- the protocol, both contracts, the allocation and the Stage 1 gate;
- `SOURCE-DIGESTS.json`;
- the Stage 2, 3 and 4 manifests and the Stage 3 and 4 admissions;
- the Stage 3 read-boundary disclosures;
- `C1-STAGE5-CONTROLLER-FACTS-T.json` and `PATH-CHECK-T.json`;
- the two returns and the four critiques.

**Upstream seals.** All were recomputed canonically and all match.

| Manifest | Seal | Members | Portfolio entries |
|---|---|---|---|
| Stage 2 | `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92` | 1006 | — |
| Stage 3 | `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac` | 36 | `T1/RETURN.md` `99856702…9013` (27,885 B) and `T2/RETURN.md` `f6a0dec8…3215` (32,776 B) match |
| Stage 4 | `94bd9f138c1bd3290bdeda9ab4edb2b4e95f704756f3ef21a300d910a83017bf` | 53 | the four T critiques match (`c086c7ef…`, `472eb6a0…`, `06f75b0e…`, `91d1d496…`) |

The Stage 3 admission lists both T returns with the headline flag `no` and read-boundary disclosures filed. The Stage 4 admission
lists all four T critiques as `retained_narrowed` with the headline flag `no`. `control/SOURCE-DIGESTS.json` has 981 entries, and
all 981 were re-hashed with **0 mismatches**.

**Seat and critic identities.** Both seats disclose chartered Sonnet/xhigh with runtime id `claude-sonnet-5`. All four critics
disclose chartered opus/medium with runtime id `claude-opus-5-5[1m]`. This agrees with `C1-ALLOCATION.md`.

**Read-boundary record** (my own, and those of the portfolio):
- **Mine.**
  - I read the capsule members and `sources/`. I did not read `control/controller-facts/CF-REPLAY-c1.json`, which is cited by
    CF-0 but is not a capsule member.
  - I copied out and read these portfolio scratch files: `scratchpad/c1-T1/t1_instrument.py`, `scratchpad/c1-T2/t2_instrument.py`,
    `t2_run.py` and `out.json`, all into `scratchpad/c1-adj-T/copy-T*/`. Their digests equal the returns' tables.
  - I ran no `find`/`grep`/`rg`/recursive listing above the grant. `grep` ran only on my own copies.
  - **One disclosure:** the seal script hashed the bytes of the Stage 3 member `control/C1-STAGE3-ADMISSION-EXCEPTIONS.json`
    because its path matched a substring filter. The file is not a capsule member. It was hashed only; its content was not
    displayed or used.
  - No network, no installs, no Lean. No background job was started.
- **Seats.** T1 files none. T2 made one non-recursive `ls` of `scratchpad/` and saw names only. I confirmed that T2's scripts do
  no file I/O.
- **Critics.**
  - C-T1-F: one `ls` of `c1-T1/`, and background jobs checked by literal PID.
  - C-T1-U: none.
  - C-T2-F: one `pgrep -f`, a pattern lookup that is a PID-rule breach, disclosed, with kills by literal PID; and two `grep -rl`
    searches inside `sources/`.
  - C-T2-U: hash-only reads of the Stage 3 members, and one `ls` of its own critic directory.

  None of these touches a number I rely on.

## Route-by-route decisions

### T1 — `WEIGHTED-SHADOW-NORMALIZED-MATCHING` (route verdict `bounded_evidence`; ruling: **retained_narrowed**)

**Fidelity** (checked in code, per CF-1b):
- `active_weight` (t1_instrument.py:155) tests `(B ∖ {v}) ∩ (N(s_v) ∖ {v}) ≠ ∅`. That is the active-tag weight, not `|F ∩ B|`.
- `transport_targets` is literally (D) ∪ (S).
- `F` is taken from `Δ_p(T − w)` on the original tree.

**Two defects in T1's code:**
1. At `K_{1,12}` the script sets `S_value = supply − capacity` and then asserts equality with itself (lines 438–441), which is a
   tautology.
2. Its two small CB instances `(d, m) = (2, 3), (3, 2)` are **not eligible**, contrary to SEMANTIC-CONTRACT §1.1's rule that every
   reported instance be eligible.

**Claim-by-claim:**

| T1 claim | Paired critics | Adjudicator replay | Ruling |
|---|---|---|---|
| Lemma 1: transitive action on two consecutive ranks gives normalized matching | C-T1-F: correct and complete. C-T1-U: correct and complete. | Checked. The group is not needed: the cover graph between the sector ranks is biregular by direct counting (see Lean readiness). | **Retained, `proved_informal`** (T1) |
| CB sector instantiation: `\|∂X\| ≥ \|X\|·491/492` for every `X ⊆ S_493` of `CB(8, 92)` | Both: correct, provided the symmetry named is the ABSTRACT poset symmetry `S_N ≀ (ℤ/2)^N`, not `Aut(T)` | `R_491·491 = R_490·492` and deficit `= R_490/491` re-verified exactly (`cb_replay.out`) | **Retained, `proved_informal`**, sector-deletion scope |
| Switch-image weight `w_F(A) = ℓ_i(B)` | Both: verified literally. Both note that T1 omits the weight-0 `s`-switch and the deletions of `r`/`v`. | — | **Retained**; the omission is harmless and is recorded |
| §3 whole-sector switch total `7.003…×10^348`, combined `5.211…×10^349`, `⌊switch/deficit⌋ = 76` | Both independently: the prose formula is right, but the code omits the factor `m` (line 490); true values are `6.4423…×10^350` and **7012** | **Replayed** (`cb_replay.out`): without `m`, 349 digits, lead `70025`, ratio 76; with `m`, 351 digits, lead `64423`, ratio **7012** | **Numbers struck and corrected.** The conclusion `R_491 ≤ combined` survives. Critic-attributed (both; also CF-T-1). |
| §3 margin as evidence for sector Hall | Both: one extremal `X` says nothing about arbitrary `X`. C-T1-U exhibits sector-Hall failures with a positive whole-sector margin. | **Replayed** the abstract sector network at `(d, m, k) = (7, 1, 5)`: 672 sources, deletion capacity 560, switch capacity 140, **max-flow 651, deficiency 21** (`sector_flow_71.out`). `CB(7, 1)` has an empty eligible window (`α = 9`, `x = 6`), so this is not a (HALL) cut. | **Struck as evidence**; demoted to a single-`X` record |
| §4 candidate `E993-R30-CB-SECTOR-DELETION-NORMALIZED-MATCHING` under `H ≤ Aut(T)` swapping `b_i ↔ c_i` | Both: the hypothesis is unsatisfiable, since `deg b_i ≥ 2 > 1 = deg c_i`; "transitive within each choke class" also fails with several classes | Agreed (CF-T-2) | **§4 as stated is struck (vacuous).** It is re-stated under the corrected hypothesis (next row). |
| Corrected hypothesis (critic-stated, Stage 4) | C-T1-F: `Q` independent and `T − N_T[Q]` a disjoint union of `N` edges. C-T1-U: an equivalent induced-matching form. | The two forms are equivalent. The proof holds by biregular double counting. | **Adopted.** STATED at a review stage; the wording needs its isolated second read. |
| (WID) "reconfirmed on three literal instances by two routes" | Both: two instances (`K_{1,12}` is tautological), both non-eligible | Code inspected; agreed | **Struck to**: "(WID) held on two non-eligible literal instances". The `K_{1,12}` numbers themselves are correct (both critics' instruments). |
| `CB(8, 92)`: `n = 1567` "own construction", `α = 829`, `x = 490`, `\|F\| = 737` | Both: T1 never built the tree; the values are cited. The values are correct (both critics). | **Replayed** by literal generic DP: `n = 1567`, `α = 829`, `x = 490` through `α`, window `[492, 552]` (61 ranks); `v` and private leaves favorable at every eligible `p` (`cb_replay.out`) | Values backed by the critics and the adjudicator, not by T1 |
| Remaining obligation 2: "tightest near `3p = 2α + 1`" | C-T1-U: reversed, since `R_{k−1}/R_k = k/(2(N−k+1))` increases with `k` | Agreed | **Struck** |

### T2 — `DEFICIT-BUDGET-AND-ROOTED-RECURRENCE` (route verdict `bounded_evidence`; ruling: **retained_narrowed**)

**Fidelity** (checked in code):
- `active_weight` (t2_instrument.py:354) uses `W_v = N(s_v) ∖ {v}` and tests `(B ∖ {v}) ∩ W_v`. Correct.
- `F` is fixed at `p` for both `Q` sums.
- `x` is taken through `α`.
- T2 builds no relation, so (D) ∪ (S) does not enter its numbers.

**Procedural lapse:** `identity_holds` is recorded, not asserted before other output (SOLUTION-CONTRACT §3.3). Every recorded
value is true, and two critics replayed `out.json` byte-identically. The numbers are retained and the lapse is recorded.

**Claim-by-claim:**

| T2 claim | Paired critics | Adjudicator replay | Ruling |
|---|---|---|---|
| Step 5 hierarchy: budget ⟺ `Q_p ≤ Q_{p−1}` ⟺ `S ≤ 0` (for `k = p − 1 ≥ 1`) | Both: correct and elementary. (2)⟺(3) is definitional, given the same `F_p` in both sums. | Checked | **Retained, `proved_informal`**. It carries no independent mathematical weight: the budget IS the primary aggregate, instance by instance (`D + C − (2α+1−3p)Q = −kS`). |
| "(HALL) strictly stronger in general" | C-T2-U: struck, since no separating instance is exhibited. C-T2-F: passes the direction checks and does not address strictness. | No separating eligible instance exists in my portfolio | **Resolved for C-T2-U.** The wording becomes "(HALL) ⇒ `S ≤ 0`; not known to be equivalent". Separation is an open question shared with F2 (CF-T-4). |
| DCB re-derivation, "confirmed on 1,060 instances" | Both independently: `D_v` is the residual (line 458), so the check is a tautology apart from `α(H_v) = α − 1` in aggregate, and `budget_holds` is `S ≤ 0` restated | Code inspected: confirmed | **The certification is struck.** The prose re-derivation stands as a re-proof of the VERIFIED DCB. Both critics supply the missing direct check: the per-set `e_v(A)`, the double count, `D ≥ 0` and the identity with directly computed `D` on all 515 eligible rows of orders 11–14 (critic-attributed, `bounded_computation`). |
| `α(H_v) = α − 1`, and `D ≥ 0` via bipartiteness | Both prove it on the face. C-T2-U also derives the König form `d_v(A) = (n_v − 2ν_v) + \|N(A)\| − k`, which T2 omitted. | Checked | **`proved_informal`, critic-attributed** (a re-proof of a VERIFIED key; nothing new registered) |
| `C_v` inclusion–exclusion, "checked for `m ≤ 4`" | Both: proved for all `m`; the unnamed hypothesis that `W_v` is independent must be named (true in a tree by acyclicity) | Checked | **Retained**, with the hypothesis named |
| deg-2 collapse, `q_v(j) = i_{j−1}(H_v ∖ N[g])` with `C_v = 0`, "the same statement" as `E993-ORDINARY-DEG2-SIBLING-G1-COEFFICIENT-IDENTIFICATION` | C-T2-F: a corollary of one conjunct, not the same statement. C-T2-U: a genuine alias (coefficient extraction). | The registered key is a four-part package; T2's collapse is the coefficient form of its second conjunct | **Disagreement resolved: relation `subclaim_of` (corollary).** Both critics agree on substance; nothing new is registered. |
| deg-2 check covers "every claw-leaf tag of `T_m`" | Both: false; claw supports have degree 4 | — | **Struck** |
| WID "direct definition on 1,060+ instances", "four named fixed points" | Both: 1,047 rows, three fixed points; `T_22` supply and capacity are read through (WID) | — | **Corrected to 1,047.** The `T_22` columns are relabelled `Σ q_v(p)` / `Σ q_v(p−1)`. |
| `x` self-check on "every tree on 6 vertices (625 labelled)" | Both: 625 of 1296 | — | **Struck** to "625 of 1296" |
| "3,973 iso-classes" in orders 1–15 | not caught by either critic | The A000055 partial sum for orders 1–15 is **13,188** (the partial sums are 5,447 through 14 and 13,188 through 15; 3,973 matches none) | **Struck (adjudicator correction)**. The eligible-row count 1,043 is unaffected (5 + 34 + 163 + 313 + 528). |
| Smallest eligible order is 11 (R30-E-a) | Both confirm, by independent census and by `D`, `C` computed directly | **Replayed** (`broom11.out`): the double broom has `α = 9`, `x = 4`, only `p = 6`, `\|F\| = 9`, `\|I_7\| = 37`, `\|I_6\| = 90`, supply 255, capacity 516, `S = −261` asserted, mixed max-flow 255 and deletion-only max-flow 255. My own free-tree probe gives eligible rows 5/34/163/313 at orders 11–14 (`selector_probe.out`). | **Retained, `bounded_computation`** (exact finite witness; T2 original, critic-confirmed). Erratum R30-E-a stands. |
| `Q_j` lead: `Q_{k−1} ≥ Q_k ≥ Q_{k+1}` and `Q_k² ≥ Q_{k−1}Q_{k+1}` on 1,060 rows | C-T2-F: the lead contains `S ≤ 0`; (M1) ∧ (LC) is strictly sufficient, and the (M1) slack tends to 0 on `T_m` and cherry-hub families. C-T2-U: TMX (mode of `Q` in `{x−1, x}`), a family indexed by rank, with no independent handle. | CF-T-3's controller replication is consistent | **Narrowed.** Both critics agree it is no reduction. `bounded_computation`; not registrable; demoted as a proof route (vanishing slack, per C-T2-F). |
| Remaining obligation 2: induct through the deg-2 collapse | C-T2-U: refuted as a tag-by-tag route. For the `T_22` marked arm, `q_v(j) = C(66, j−1)` and the per-leaf term is `+212336130412243110`. | The term is replayed, `C(66,33) − C(66,32) = 212336130412243110` (`broom11.out`) | **Struck as a route.** Any scalar induction must carry cross-tag compensation. Critic-attributed (C-T2-U), `proved_informal`. |

## Cross-route reconciliation

1. **The two routes are orthogonal, and one of them does not reach (HALL).** T2's scalar target is, per instance, exactly the
   primary aggregate (T2 Step 5, sharpened by C-T2-U). Proving it would be outcome A′, the aggregate at its own key, and would
   leave (HALL) untouched. The implication (HALL) ⇒ `S ≤ 0` uses (HALL-COND) only at `X = I_{p+1}`, and nothing in the portfolio
   gives a converse. Only T1's line works on (HALL-COND) for proper subfamilies `X`.
2. **Paired-critic disagreement on T1, resolved.** C-T1-U's Remaining obligation treats sector Hall at `CB(8, 92)`, `p = 492`, as
   open and reduces it to a "dead-core" inequality. C-T1-F's Lemma C closes it. The two are **consistent, not contradictory**:
   C-T1-U did not have Lemma C, and Lemma C's hypotheses **fail** on every one of C-T1-U's sector-Hall failure rows.
   - My replay `lemmaC_check.out` gives, at the balanced ranks:
     - `(7, 1)`: `(d−1)(1−δ) = 1`;
     - `(10, 1)`: `9/8`;
     - `(14, 2)`, `(17, 2)` and `(20, 2)`: the required margin is 0.018, 0.014 and 0.012, all below 1.
   - At `CB(8, 92)`, `p = 492`, the margin is **18,328.28** (`|X''|/R_491 = 1.0932×10^{−7}`). This reproduces C-T1-F's 18,328.
   - So Lemma C supersedes C-T1-U's open item at `CB(8, 92)`, and C-T1-U's A2 (the dead-core reduction) stays live for the rows
     Lemma C does not cover.
3. **The critics agree on the whole sector window.** C-T1-U A1 and C-T1-F Lemma C (i) are the same statement: sector Hall by
   deletion alone whenever `3p ≥ 2dm + 5`, equivalently `δ = R_{k−1}/R_k ≥ 1`. The derivation is
   `R_{k−1}/R_k = k/(2(N−k+1)) ≥ 1` iff `3p ≥ 2N + 5`.
4. **The CB coverage boundary was replayed** (`cb_coverage.out`, literal DP):
   - `CB(8, 85)` has no deficit row.
   - `CB(8, 86)` has exactly one, at `p = 460 = x + 2`, covered by Lemma C (ii). This is the smallest `d = 8` deficit tree, as
     CF-4 states.
   - `CB(8, 107)` at `p = 572` is covered by (ii).
   - `CB(8, 108)` at `p = 577`, and `CB(7, 144)` at `p = 673`, have `x₀ ≤ 0` and are **not covered**. These are the first
     uncovered rows C-T1-F reports.
   - In every replayed tree, `v` and the private leaves are favorable at every eligible `p`.
5. **The selector never binds.** C-T2-U reports that `F_p(T)` equals the full leaf set on 13,867 census rows and 27,824 family
   rows. My probe (orders 11–14, 515 rows, 0 binding) and `CB(8, 92)` (all 737 leaves) agree. So no instrument in this
   orientation has exercised the fixed-selector rule. This is a coverage fact, not a theorem.
6. **The controller facts were weighed as one more replay each.**
   - CF-T-1 (the factor `m`) was found by both critics and by me.
   - CF-T-2 (the `§4` hypothesis) was found by both critics.
   - CF-T-3 (the `Q` probe) is consistent.
   - CF-T-4 (separation) is an open question.
   - CF-1 (smallest order 11) is consistent.
   - CF-1b: both T instruments implement the correct active test. T2's prose `(B ∖ {v}) ∩ N(s_v)` is also correct, because
     removing `v` is exactly what makes it equal `B ∩ W_v`.
   - CF-4's report of eligible positive-weight arc-unreachable targets comes from F-portfolio critiques I did not read. I note it
     only as a controller reading. It shows the scalar gap `Σ_{I_p} w − Σ_{N(I_{p+1})} w > 0` can occur, but it does not separate
     (HALL) from `S ≤ 0`.

## Established results

The table separates the kinds of result. Proof results are distinct from bounded computation, and each row names the hypotheses
it consumes.

| # | Statement (exact scope) | Hypotheses consumed | Grade | Attribution |
|---|---|---|---|---|
| E1 | **Sector pair-product normalized matching.** Take `G` a finite simple graph and `Q ⊆ V` independent, such that `G − N_G[Q]` is a disjoint union of `N` edges (an induced perfect matching). Let `S^Q_j := {B ∈ I_j(G) : Q ⊆ B}` and `k ≥ 1`. For every `X ⊆ S^Q_{\|Q\|+k}`, let `∂_Q X` be the set of `B ∖ {y}` with `B ∈ X` and `y ∈ B ∖ Q`. Then `k·\|X\| ≤ 2(N − k + 1)·\|∂_Q X\|`, equivalently `\|∂_Q X\|·R_k ≥ \|X\|·R_{k−1}` with `R_k = C(N,k)2^k`. | Finiteness; independence of `Q`; the induced-matching hypothesis. It needs no `IsTree`, no `Aut(T)`, no weight and no eligibility. | `proved_informal` (T1's Lemma 1 plus the corrected hypothesis). The corrected wording is STATED at Stage 4 and needs an isolated second read. | T1 (Lemma 1, the NM bound); C-T1-F and C-T1-U (corrected hypothesis) |
| E1w | Weighted reading on `CB(d, m)` with `Q = {r, v}`: `w_F ≡ [v ∈ F]` on the sector, so E1 is the weighted sector bound. At `CB(8, 92)`, `p = 492`, the deletion deficit is at most `\|X\|/492` for every `X ⊆ S_493`. | `IsTree` (literal construction, with connectivity and acyclicity checked separately); `F = F_p` on the original tree | `proved_informal` for the weight constancy. The `CB(8, 92)` parameters are `bounded_computation`, replayed. | T1; Codex (corrected sector facts) |
| E2 | Switch-image weight: a choke switch from a sector source gives `A = B ∖ {r, b_{ij0}} ∪ {u_i}` with `w_F(A) = ℓ_i(B)` when the private leaves are in `F`. Each such target has exactly `d − ℓ` sector preimages. The `s`-switch and the deletions of `r`/`v` give weight-0 targets. | The literal (S); `F` fixed | `proved_informal` | T1 (formula); both critics (completion) |
| E3 | **Lemma C (conditional; critic).** On the `CB(d, m)` root-plus-arm sector with `k = p − 1`, `Z' = N − k + 1` and `δ = k/(2Z')`, (HALL-COND) holds for every `X ⊆ S_{p+1}` if either: (i) `δ ≥ 1`; or (ii) `δ < 1`, `x₀ := (k² − 2(k−1)Z')/(2Z') > 0`, the private leaves are in `F_p`, `(d−1)(1−δ) < 1`, and `x₀R_k(1 − (d−1)(1−δ)) ≥ \|X''\|`, where `X''` is the switch-dead family. | `v ∈ F_p` (for weight 1); the private leaves in `F_p` (for (ii)); the literal (D) ∪ (S) | `proved_informal`, STATED at Stage 4, **critic-attributed**. One cited classical node: the Boolean-lattice `UD` spectrum. My exact replay of the second-eigenvalue bound (rational LDLᵀ PSD test of `λ₂²I − BBᵀ + ((λ₁−λ₂²)/R_k)J`, and its sharpness) passes on 13 `(N, k)` pairs (`spectral_psd.out`); the brute-force Tanner inequality passes over all subsets on 5 small layers. | C-T1-F |
| E4 | **Sector Hall at `CB(8, 92)`, every eligible `p ∈ [492, 552]`.** Every source subfamily INSIDE the root-plus-arm sector satisfies (HALL-COND). This is E3 (i) for `p ≥ 493` and E3 (ii) for `p = 492`, with margin 18,328. | As in E3; all 737 leaves favorable at every eligible `p` (replayed) | `p ≥ 493`: `proved_informal` (E1 plus weight constancy). `p = 492`: `computer_assisted` (one exact GF coefficient `\|X''\|`, replayed). STATED; needs an isolated second read. **Sector subfamilies only; not (HALL) on `CB(8, 92)`.** | C-T1-F; C-T1-U (A1, same content for `p ≥ 493`) |
| E5 | Dead-core reduction at balanced ranks `3k = 2dm + 1`: `k(Σ_X w − Σ_{N(X)} w) ≤ \|U_dead(X)\| − Σ_{∂X∖U(X)} (k − e(X, A))` | As in C-T1-U A2 | STATED. The exact double-count part is checked by the adjudicator. The live-charging bound is **not independently verified** (C-T1-U has a randomized check only). | C-T1-U |
| E6 | Hierarchy: for eligible `(T, p)`, `D + C − (2α+1−3p)Q_{p−1} = −(p−1)S`, so budget ⟺ `Q_p ≤ Q_{p−1}` ⟺ `S ≤ 0`; and (HALL) ⇒ `S ≤ 0` | `h_v = α − 1` for every leaf (proved); `k ≥ 1` from eligibility; the same `F_p` in both sums; DCB (`proved_informal`, VERIFIED) | `proved_informal` | T2; C-T2-U (the identity form) |
| E7 | Implication chain among the existing OPEN keys: `CT_x` ⇒ FLAT ⇒ CURRENT-RANK ⇒ budget, with CURRENT-RANK ⟺ `kS ≤ −C` | Eligibility (`x + 1 ≤ p − 1`); `i_{x+1} < i_x` | `proved_informal`, STATED (a relation among existing keys; alias check required) | C-T2-U |
| E8 | No tag-by-tag induction through the deg-2 collapse can give `Q_p ≤ Q_{p−1}` (witness: the `T_22` arm, `q_v(j) = C(66, j−1)`) | — | `proved_informal` (explicit witness; term replayed) | C-T2-U |
| E9 | `α(H_v) = α(T) − 1` for every original leaf; `D ≥ 0` (bipartite bound); the indicator identity for all `m` (with `W_v` independent) | Degree one; bipartiteness; acyclicity | `proved_informal` (re-proofs, supporting DCB) | C-T2-F, C-T2-U |
| B1 | The order-11 double broom is eligible (R30-E-a); there are 0 eligible rows at orders ≤ 10; eligible rows at orders 11–17 are 5/34/163/313/528/2763/10061 (tree isomorphism classes × `p`) | — | `bounded_computation` (T2 through 15; both T2 critics through 17; adjudicator through 14) | T2; C-T2-F; C-T2-U |
| B2 | Mixed-relation max-flow saturates on all 515 eligible rows of orders 11–14, and on the double broom (deletion arcs alone also saturate) | The literal network | `bounded_computation` | C-T2-F, C-T2-U; adjudicator (double broom) |
| B3 | The `CB` coverage sweep (`d ≤ 12`, `m ≤ 400`) splits as: 551,129 rows in class (i), 391 in class (ii), 2,724 uncovered, the first at `CB(7, 144)`, `p = 673`. In the swept range no deficit row has an unfavorable private leaf. | — | `bounded_computation` (critic). The boundary rows are replayed by the adjudicator. | C-T1-F |

Nothing in this orientation is a compiled Lean declaration, so there are no `#print axioms` outputs to confirm. No imported
result is used above its grade: DCB is used only for the identity, never as the budget; (LIFT) is not used; (TSB) appears only as
the closed high tail.

## Rejected and narrowed mechanisms

- **T1 §4 under `Aut(T)`**: struck as vacuous. It is re-stated as E1.
- **T1 §3 as evidence for arbitrary `X`**: struck. The counterexample, replayed, is the non-eligible abstract sector
  `(7, 1, 5)` with deficiency 21 despite a positive whole-sector margin.
- **T2's scalar budget as a route to (HALL)**: rejected. It is the primary aggregate itself, with no reduction.
- **The `Q_j` lead**: narrowed to a strictly stronger sufficient condition whose (M1) slack vanishes on explicit families.
  Demoted as a proof route.
- **A tag-by-tag deg-2 induction**: rejected (E8).
- **Weighted deletion-only transport at `CB(8, 92)`, `p = 492`**: the root-plus-arm sector `X = S_493` is a deletion-only
  deficit of `R_490/491` under the ACTIVE weight. So weighted deletion-only Hall fails at an eligible row, and the switch arcs
  (S) are necessary there. This is the recorded C6-U5 fact, restated. It is not a (HALL) cut: E4 shows the mixed relation
  covers every sector subfamily.
- **Not revivals.** Both critics, and I, rule that no refuted key of SOLUTION-CONTRACT §3.2 is revived:
  - E1 is a shadow bound with an explicit deficit, not `E993-R23-LITERAL-DELETE-ONLY-HALL`.
  - E3 (ii) uses (S) and the active weight.
  - E3 (i) is deletion-only Hall on a restricted family (sector subfamilies of one tree family where `δ ≥ 1`) under the active
    weight. That is a scoped statement, not the refuted universal literal key.
  - No per-leaf injectivity, domination, covariance or own-support unit capacity appears.
- **Fences.** No closed region is re-proved: `CB(d, m)` is not a settled family, and the `T_m` rows are self-checks only. There
  is no census value in a proof: E4 at `p = 492` uses one exact coefficient as a numeric certificate and is graded
  `computer_assisted` accordingly. There is no RTree wording, and mechanism is kept separate from the aggregate.

## Lean readiness

The central ruling for orientation T. No seat in this orientation built Lean. There are no compiled fragments, and no carried
entries were exercised.

**(WID), at the exact statement of SOLUTION-CONTRACT §2** (`layerWeight_sub_eq_sum`, `activeWeightAggregateIdentity`):
- **(a) Informal proof: complete.** The proof of record (SEMANTIC-CONTRACT §1.2) was re-verified here at statement level, with a
  closed DAG:
  1. the bijection `B ↦ B ∖ {v}` from `{B ∈ I_j : v ∈ B, (B∖{v}) ∩ W_v ≠ ∅}` onto the `(j−1)`-sets of `H_v` meeting `W_v`. It
     uses `N(v) = {s_v}` and `s_v ∉ B`.
  2. the swap `Σ_B w_F(B) = Σ_{v∈F} q_v(j−1)`.
  3. `q_v(j) = i_j(H_v) − i_j(R_v)`, since `R_v = H_v − W_v` (entry-18 `tagged_count_split`).
  4. `Δ_{p−1}(H_v) − Δ_{p−1}(R_v) = q_v(p) − q_v(p−1)`, using `p ≥ 1`.
- **(b)** Orientation T carries no compiled fragments. The U orientation owns the build.
- **(c)** No mathematical open node. The T portfolio's contribution to (WID) is bounded rechecks only (1,047 rows by T2 after
  correction; two non-eligible instances by T1).

**Award groups originating in orientation T:**

1. **G-T-NM — sector pair-product normalized matching (E1). CONTRACT-READY** (informal; Lean-feasible), conditional on the
   isolated second read of the corrected-hypothesis wording.
   - *Exact statement (draft):*
     ```lean
     def sectorFamily (G) [DecidableRel G.Adj] (Q : Finset V) (j : ℕ) : Finset (Finset V) :=
       (indepFamily G j).filter (Q ⊆ ·)
     def sectorShadow (G) [DecidableRel G.Adj] (Q : Finset V) (j : ℕ) (X : Finset (Finset V)) :=
       (sectorFamily G Q j).filter (fun A => ∃ B ∈ X, ∃ y ∈ B \ Q, A = B.erase y)
     theorem sectorPairProductNormalizedMatching (G) [DecidableRel G.Adj] (Q : Finset V)
         (hQ : G.IsIndepSet (Q : Set V))
         (hM : ∀ x, x ∉ Q → (∀ q ∈ Q, ¬ G.Adj q x) →
              ((G.neighborFinset x).filter (fun y => y ∉ Q ∧ ∀ q ∈ Q, ¬ G.Adj q y)).card = 1)
         (N : ℕ) (hN : 2 * N = (univ.filter (fun x => x ∉ Q ∧ ∀ q ∈ Q, ¬ G.Adj q x)).card)
         (k : ℕ) (hk : 1 ≤ k) (X) (hX : X ⊆ sectorFamily G Q (Q.card + k)) :
         k * X.card ≤ 2 * (N - k + 1) * (sectorShadow G Q (Q.card + k - 1) X).card
     ```
     `N − k + 1` needs no guard: if `k > N` the sector is empty and both sides are 0. Here `Q.card + k − 1 = Q.card + (k − 1)` by
     `hk`.
   - *Informal DAG, closed, statement-level:*
     1. every `B` in the sector at rank `k` has exactly `k` sector down-neighbours (`|B ∖ Q| = k`; independence is inherited);
     2. every `A` at rank `k − 1` has at most `2(N − k + 1)` sector up-neighbours: `y ∉ N[Q]`, `y`'s partner is not in `A`, the
        induced matching gives no other outside neighbours, and `A ∖ Q` meets `k − 1` distinct pairs;
     3. double counting.
   - *Mathlib:* `Finset.card_mul_le_card_mul` (Mathlib.Combinatorics.DoubleCounting). The pinned file:line is for the Lean seat
     to bind against `sources/mathlib-binding/PIN.json`. I did not open Mathlib.
   - *Carried fragments:* none required. Only `E993Transport.indepFamily` (SOLUTION-CONTRACT §2 draft) and the two new
     definitions above; no entries 1–45 are needed.
   - *Fences on the face:* unweighted; sector-only; not (HALL), not HALL-COND for any `X` outside one sector, and not
     deletion-only Hall. The weighted CB reading E1w is NOT in the Lean statement: `F_p` membership at `n = 1567` is a numeric
     fact with no kernel route (no `decide` over enumerations).
   - *Priority:* low relative to (WID) and its companions. C-T1-U calls it a "textbook lemma in new clothing", and I concur.
2. **G-T-LC — Lemma C / sector Hall at `CB(8, 92)` (E3, E4). NOT READY.**
   - Informal: E3 is complete modulo one cited classical node (the Johnson/Boolean `UD` spectrum inside Fact C). E4 at `p = 492`
     rests on a 350-digit coefficient.
   - Open nodes for formalization:
     - (n1) the second-eigenvalue bound `λ₂(BBᵀ) = 2(k−1)(N−k+1)` on the rank-`k` layer of `{0,1,2}^N`. This is the smallest
       unproved formal node, and a Mathlib spectral development would be needed.
     - (n2) a kernel-checkable certificate for `|X''| ≤ x₀R_k(1 − (d−1)(1−δ))` at `N = 736`.
     - (n3) `F_{492}(CB(8, 92))` = all 737 leaves.
   - Not an award this cycle.
3. **G-T-H — hierarchy (E6) and chain (E7). NOT AN AWARD GROUP.**
   - (2)⟺(3) of E6 is the unfolding of `C5LA1.aggregate`. It is already exposed by the right-hand side of `layerWeight_sub_eq_sum`,
     so I recommend it as a companion `lemma` inside the WID award if at all.
   - (1)⟺(3) and E7 need DCB formalized, which it is not (DCB is `proved_informal`).

**No restricted-scope Hall theorem exists in this portfolio.** E4 covers sector subfamilies of one tree and is bounded in scope.
A bounded result never qualifies.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

Progress here is real but narrow. The plateau test (SOLUTION-CONTRACT §5) asks for a new lemma at `proved_informal` or better, or
a new adversarial finding. This orientation has both:
- **New lemmas:**
  - E1, the first proved expansion inequality for the corrected CB sector;
  - E3 and E4, the first argument that makes the switch arcs (S) pay for a deletion deficit on arbitrary sector subfamilies,
    closing T1's open item at its fixed point (critic-attributed, STATED);
  - E6 and E8, which close off the scalar route as a HALL route.
- **New adversarial findings:** the non-eligible sector-Hall failures at balanced ranks with `m ≤ 2`, which show that any sector
  lemma must use `m` and eligibility; and the asymptotic tightness of (M1).

Neither decisive event of the stop gate occurred: there is no (HALL) formal award and no confirmed (CUT). The gate is armed only
from the Cycle 2 close.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at orientation T's evidence grade:
- **(HALL) is still open.** No complete proof and no deficient cut exist in this portfolio. Every eligible row checked saturates:
  515 rows by two critics, and the double broom by me.
- **(WID) is proved informally at statement level** by the contract's proof of record, which I verified. Orientation T adds only
  bounded rechecks, and its Lean award belongs to U.
- **Outcome-B candidates:**
  - E1 is proved (`proved_informal`, with the corrected-wording second read pending).
  - E3 is proved in conditional form (`proved_informal`, STATED, critic).
  - E4 is proved for `p ≥ 493` (`proved_informal`) and `computer_assisted` for `p = 492`, sector-only, STATED.
  - E5 is still open as a reduction; its charging bound is unverified by me.
  - The budget / `Q_p ≤ Q_{p−1}` is still open, and it is the primary aggregate itself.
  - The primary aggregate is untouched: it is still open.

## Next-route allocation

**Exact remaining obligation for orientation T:** (HALL-COND) for every `X ⊆ I_{p+1}` on every eligible tree. At this
orientation's frontier, the smallest unproved statements are:
- **(O1)** sector Hall on the eligible `CB(d, m)` rows with `x₀ ≤ 0`, the first being `CB(7, 144)` at `p = 673` and `CB(8, 108)`
  at `p = 577`. Equivalently, the dead-core inequality `|U_dead(X)| ≤ Σ_{∂X∖U(X)} (k − e(X, A))` (E5), or a vertex-expansion
  bound `|∂Y| ≥ |Y|` for `Y` inside the switch-dead family, at those parameters.
- **(O2)** (HALL-COND) on `CB(8, 92)`, `p = 492`, for `X` NOT contained in the root-plus-arm sector: the sources with `r ∉ B`
  compete for the same choke-switch targets E4 uses.

**Route 1 — `C2-T-01 CB-FAMILY-FULL-NETWORK-HALL`** (continues T1, C-T1-F and C-T1-U; prove):
1. Close (O1) for every eligible `CB(d, m)`. Replace the spectral bound, which is vacuous at `x₀ ≤ 0`, by an expansion bound on
   the switch-dead family. `|X''|/R_k` is about `10^{−7}` at the fixed point, so the room is large.
2. Attack (O2) by the invariant-cut reduction (U's `INV` template, if the synthesis registers it) to `S_d ≀ S_m`-invariant
   families. Those are product families over group-type counts, where E1/E3-type bounds apply sector by sector with the
   competition counted exactly.

*Closable in one cycle:* the outcome-B lemma "sector Hall for every eligible `(CB(d, m), p)`" at `proved_informal`, and either a
statement-level plan for full (HALL) on the CB family (a restricted-scope key) with named open nodes, or a CB deficient cut
(outcome C: two instruments and a second read).

**Route 2 — `C2-T-02 WEIGHTED-SECTOR-LYM-BEYOND-PAIRS`** (replaces T2's scalar route, which is closed as a (HALL) route by E6 and
E8; prove):
1. Generalize E1 from induced perfect matchings to sectors where `T − N[Q]` is an arbitrary forest (star components first),
   under the ACTIVE weight. Prove a weighted normalized-matching / product theorem on the face (Harper / Hsieh–Kleitman for
   log-concave LYM factors, proved and not cited).
2. Characterise exactly which sectors are deletion-deficient under `w_F` on eligible trees. The CB-type criterion is
   `3p < 2N + 5`.
3. State the restricted-scope theorem "(HALL-COND) holds with deletion arcs alone on eligible trees none of whose sectors is
   deletion-deficient". Any such statement must say why it is not `E993-R23-LITERAL-DELETE-ONLY-HALL`, which differs in weight
   and in scope.

The route must be cross-tag: tag-preserving flows fail, as the `T_22` arm shows (E8). It must also test the fixed selector on
rows where `F_p ≠ L(T)`, if any exist; none has been found.

*Closable in one cycle:* the forest-sector weighted LYM lemma for star-forest sectors at `proved_informal`, and the exact
deficient-sector characterisation.

## Artifact inventory

All adjudicator scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-adj-T/`.
Everything uses the standard library and exact integers/`fractions`, and ran in the foreground. No background job was started, so
none remains. Replay any file with `python3 -B <script>` in that directory; `selector_probe.py` takes the argument `14`.

| File | SHA-256 | Role |
|---|---|---|
| `lemmaC_check.py` / `.out` | `4993b2d9…8ce18` / `037537ec…ddb` | Lemma C conditions on C-T1-U's failure rows and at `CB(8, 92)` (margin 18,328.28) |
| `spectral_psd.py` / `.out` | `bb67bb7c…d47e` / `e3bf1168…147` | exact PSD and sharpness of the second-eigenvalue bound on 13 `(N, k)`; brute-force Tanner inequality |
| `cb_replay.py` / `.out` | `094a54c3…485` / `677da669…ccf7` | literal `CB(1, 7)` and `CB(8, 92)` DP: `α`, `x`, window, favorability; T1's factor `m` (76 vs 7012) |
| `cb_coverage.py` / `.out` | `f5db7dc0…768` / `2b44d773…f6c5` | CB deficit and coverage boundary rows |
| `broom11.py` / `.out` | `4878f944…251` / `b654f0f6…98a2` | order-11 double broom (WID asserted, mixed and deletion-only max-flow); `T_22` arm term |
| `sector_flow_71.py` / `.out` | `71e02ba5…0b0` / `38327d26…b065` | abstract sector max-flow at `(7, 1, 5)`: deficiency 21 |
| `selector_probe.py` / `.out` | `6fcc7347…a3a` / `7603aeab…565` | free trees 11–14: eligible rows 5/34/163/313; `F_p` = the full leaf set on every row |
| `scan_small.py` | `24bee60b…f089e` | small-parameter scan of Lemma C applicability (exploratory; no output retained) |
| `copy-T1/t1_instrument.py` | `5bae3eed7d104d2bc20d995bc8e31179784cc4c8d05b7898fffcb6b081497de1` | copy-out of T1, for code inspection |
| `copy-T2/t2_instrument.py`, `t2_run.py`, `out.json` | `877fdbf2…2c3d`, `763939bd…2e2d`, `b6e69862…a1ab` | copy-out of T2, for code inspection (not re-run; two critics replayed it byte-identically) |

Full digests, as printed by `shasum -a 256` at close: broom11.py `4878f94485c07801fc38038049a4b999a9988410d7729d42b7d87d14dfbad251`; cb_coverage.py
`f5db7dc067f08f2cd408f6a307a664e99ce76631461b43cf21169f544deaf768`; cb_replay.py
`094a54c38796385c207d3e16fa68adf0407d665c6a83611f3ecbbc5f5ebfc485`; lemmaC_check.py
`4993b2d940561241a65ae101a84e802f0f27a99225292086506b360f2bc8ce18`; scan_small.py
`24bee60bd96c8b6a7c2899e3c047935c0283640f34869102eff0dcac3d0f089e`; sector_flow_71.py
`71e02ba5f36a99fadcb81cf87ee1d3cade1fdb5a6cceae5a17e3c81a090506b0`; selector_probe.py
`6fcc7347b5a404eb3332e0869fcc0da5d878a9848dcdac8fe8f0f15dfc290a3a`; spectral_psd.py
`bb67bb7c2a7270a7a7ce79a9767ecf846f65ee385ac3ebf06eecc52e994ad47e`; broom11.out
`b654f0f6a27c024be250b032f5f7160884bc6a00c35d4ec92dea6616d60898a2`; cb_coverage.out
`2b44d773cc6cc84df1023844cb5df5c15f4e902ad59bcde24525f92e2c22f6c5`; cb_replay.out
`677da669a7eda92941b3e37b998eb3bd0f3a92ee4c62c161e1958a3b591dccf7`; lemmaC_check.out
`037537ec3c6dee747ac145c3dbebefd3c4b8310767aafb89918dfc7cb043addb`; sector_flow_71.out
`38327d2671cd0801a8d169c5b96079cecfc0d2968a950c134fa84a08dc9eb065`; selector_probe.out
`7603aeab263c3bdc29e92e2310f650c75a86088c65db32cbb1451ed6eaa28565`; spectral_psd.out
`e3bf11685e6373e761a52d9c8532a916b286983833b11b0938d7cc4c1956b147`.

Sealed inputs relied on: the capsule (seal `f12bc8b8…d73`) and the 981 frozen `sources/` digests (0 mismatches). Critic
artifacts are cited by the digests in their own inventories and were not re-hashed here.
