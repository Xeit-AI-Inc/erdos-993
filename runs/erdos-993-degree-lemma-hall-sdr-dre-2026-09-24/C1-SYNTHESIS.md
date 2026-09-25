# Cycle 1 Neutral Synthesis

Stage 6 neutral synthesis, Cycle 1 of r28 (`erdos-993-math-dre-20260924-r28-degree-lemma-hall-sdr`; Erdős #993,
the Hall/SDR route to a second, structural proof of the forest degree lemma).

**Boot.** I am operating within VerityOS. For the boot I read exactly the constitution `verity.md` and the identity
subsystem's `identity/startup-protocol.md` in the VerityOS root. My first combined read failed to print the startup
protocol (a shell quirk in the separator), so I re-read that file alone. The terminal display of `verity.md` was
truncated in the middle, so I re-read the missing lines of the same file. I read no other VerityOS file outside the
run root. The governing subsystem is `experiments/`, under this run's sealed control files. The host harness placed
the repository `CLAUDE.md` and the user auto-memory index in my context without a read by me. I did not act on either
(in particular, I kept no conversation log: a sealed seat writes only its deliverable and scratch).

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

## Identity and seal audit

- **Dispatch capsule.** `control/C1-STAGE6-DISPATCH-MANIFEST.json`, stage `cycle-1-stage6-dispatch`, 12 members. I
  recomputed SHA-256 over the canonical JSON without `seal_sha256` (sort_keys, separators `(",",":")`, no trailing
  newline). The result is **`3f8bbec3bc7afe567a2b0f0882e63bf095da180a49d962ddb77d8c20cba9b18a`**, which equals both
  the recorded seal and the dispatch literal. **12/12 members match** on byte count and SHA-256:
  - `SEMANTIC-CONTRACT.md` `fa8dc971…`; `SOLUTION-CONTRACT.md` `5c3f3a0b…`;
  - `control/C1-ALLOCATION.md` `0a574348…`; `control/C1-STAGE1-GATE.md` `6bce9ff6…`;
  - `control/C1-STAGE5-PACKET-MANIFEST.json` `a31334d7…`;
  - `control/C1-STAGE6-CONTROLLER-FACTS.json` `0132e54e…`;
  - `control/C1-SYNTHESIS-PROTOCOL.md` `4afd00d0…`; `control/PATH-CHECK-c1-stage6-dispatch.json` `55ffd841…`
    (11 files scanned, 0 findings);
  - `control/SOURCE-DIGESTS.json` `25a5e17c…`;
  - the adjudications F `aaf310e3…` (38,511 B), T `b965fadc…` (39,785 B) and U `bcda2fab…` (33,467 B).
- **Stage 5 packet manifest.** Its inner seal recomputes to **`aeb6d03019af6158e7c5bd8edfda8f81f155e54fcba20b116ed15f28a007f91e`**
  and matches. It lists 31 members, including `second-reads/SR-HS-REF/SECOND-READ.md` (`30ce9094…`). That file is
  **not** in my capsule, so I did not open or hash it. What I say about SR-HS-REF, SR-PP and SR-BTP comes from the
  controller's Stage 6 facts record. I weigh that record as the controller's attestation, not as mathematics.
- **`control/SOURCE-DIGESTS.json`.** All **62/62** entries under `sources/` recompute, 0 SHA-256 and 0 byte-count
  mismatches. Among them are the r25 award source `…/c4-forest-descent-order-bound/LeanProject/LeanProof/Main.lean`
  (`736eb9df…`), the r27 C1-LA1 source `…/c1-la1-forest-degree-extension/LeanProject/LeanProof/Main.lean`
  (`b49ea82a…`) and the master registry `sources/authority/CLAIM-IDENTITY.json` (`b6bb42ca…`, 392 claims: 235
  VERIFIED, 89 REFUTED, 42 OPEN, 26 CONDITIONAL).
- **Adjudicator seals, as they report them.** T capsule `59927abc…`, F capsule `69f1965e…`, U capsule `5831bd72…`,
  each with 21/21 members. All three recompute the Stage 2/3/4 seals `2eff91ef…`, `56fa3b76…` and `4f654595…`. Their
  seal audits agree with one another. The drift they report (the corrected Stage 3 disclosure file, `r28_tool.py`,
  `RESIDUE-CHECK.json`, `C1-STAGE4-AGENTS.json`) is disclosed and touches no evidence file. Erratum R28-E-d records the
  `r28_tool.py` template residue.
- **My read boundary and process.**
  1. I read the capsule members above. From `sources/` (authorized) I read registry rows by key, using Python `json`
     lookups inside `sources/authority/CLAIM-IDENTITY.json`: the r27 reformulation, (DL), convolution, K1-criterion
     and equality rows; `E993-PAIR-R-LE-G-POINTWISE`, `E993-PAIR-GENERATION-THEOREM` and
     `E993-PAIR-EDGE-JOIN-COMPOSITION`; the fenced targets; and an alias scan by keyword for the proposed R28 keys.
     That scan found no existing R28 key and no alias collision. It found one related row, cross-referenced under
     Registrations.
  2. I read no raw return, critique, second read, scratch of another seat, other experiment root, or the Codex root.
     I ran no `find`, `grep`, `rg` or recursive listing, used no network, installed nothing, used no Lean, and
     delegated to no child agent.
  3. The harness saved its display of the T adjudication to its own tool-results store outside the run root, and I read
     the T adjudication through that byte copy of a capsule member. That is a harness fact, and I disclose it.
  4. My own spot-check instrument is under `scratchpad/c1-S/` (see Artifact inventory). It ran in the foreground only.
     I started no background job, and none is running at this write.

## Reconciliation

The three adjudications agree on every load-bearing point. I did not count votes. Where they differ, I resolve the
difference from the adjudications' own evidence, the contracts, the errata and the facts record's statement of the
completed second reads. I did not consult any lower tier.

| # | Claim | T | F | U | Resolution |
|---|---|---|---|---|---|
| 1 | (HS) and (HS-SDR) universally | refuted (own DP, bitmask, naive enumeration; search steered by the facts record, disclosed) | refuted (literal `2^22` scan, separate DP, closed form; checked both critic proofs) | refuted (three instruments plus a hand count at `k = 12`) | **Concordant: REFUTED.** One witness: T's `H(1;3,3)`, F's `T22 = R(3,2) = T(3,1) = U(3,2,1)`, U's `W22` and the facts' `R(3,2)_3` are **the same labelled edge list**. Failing `k ∈ {11, 12}` exactly. |
| 2 | Discovery and instruments | credits C-F1-T per the facts; not a blind rediscovery | C-F1-T and C-F1-U, **independently**; F1 credited for pointing to the shape | read no F material | Discovery: C-F1-T and C-F1-U, in isolation from each other. These are the two instruments of §5(b). The three adjudicator replays and the controller's `r22_check.py` prior corroborate but are not the instruments of record. |
| 3 | Violating thresholds at `k = 11` | `t ∈ (136, 141]` | `t = 137..141` | reports `t = 141` | Same statement (leaves 136, `c_0 = 141`). The integer range is `t = 137..141`. |
| 4 | Order-21 horizon | own `K_{1,3}`-family search, 0 failures at 10–21 | **two** reconciled instruments (C-F1-T's own; F1's as run by C-F1-U); corrects the Stage 5 facts' "one instrument" | none | F prevails, and the Stage 6 facts record adopts it. Exhaustive to order 21 on two instruments; minimum counterexample order **22**. |
| 5 | Uniqueness at order 22 | 1 failing member among 213,490 in the `K_{1,3}` family | open (needs the 5,623,756-class census) | none | **Superseded by later evidence:** SR-HS-REF HR-3 reports `T22` as the unique failing tree among all 5,623,756 order-22 trees, **on one instrument**. Graded `bounded_computation`, one instrument. T's family search agrees inside its family. A second full instrument at order 22 is successor residue. |
| 6 | Family | proposes `H(1;a,b)` for odd `a, b ≥ 3` (bounded, `n ≤ 40`) | merged `U(d,m,r)`, `d ≥ 3, m ≥ 2, r ≥ 1`, proved (adjudicator-merged, STATED) | none | `R(d,m) = U(d,m,1)` is second-read-confirmed (SR-HS-REF HR-2). The `r ≥ 2` part of `U(d,m,r)` is F-adjudicator-merged and STATED: second read owed. T's mixed-leg `H(1;a,b)` is **conjecture** (bounded). My own check: see below. |
| 7 | "Failures sit near `α`" | suggests `k ≤ k_0(T)` as a strengthening | `k ≥ α−1` refuted; `k ≤ α−c` refuted for every `c ≤ 19` (`U(3,m,1)` fails at `k = 12`, `α = 6m+1`); `U(3,5,1)` fails at every `k = 12..30` | none | F's evidence answers T's candidate. No fixed-offset `k`-restriction survives. A tree-dependent `k_0(T)` is unformulated and gets no face. |
| 8 | Pendant-path leaf dominance | one canonical key; all positions; graph-general; four critics | same lemma; exact identity with `x^k` normalization; two F critics | not in portfolio | **Concordant.** The two identities are the same up to the index shift. With the base vertex `w` arbitrary, the identity covers every position `u_i`. SR-PP PP-1 confirmed. Canonical key `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`. |
| 9 | (HS) on branch-tree max degree ≤ 2 (BTP) | `proved_informal`, STATED, key `…HS-BRANCH-TREE-MAX-DEGREE-2`; Lean-ready after second read, multi-lemma | proved independently by C-F2-T and C-F2-U; not Lean-ready (definitions) | not ready (no informal proof in U portfolio) | **No conflict of substance.** U lacked the proof and T and F have it. SR-BTP confirmed it with repairs. Key name per SR-BTP: `E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`. Per SR-BTP the canonical proof needs neither Hall, nor the slot count, nor the surplus identity, and it holds at `t = 0`. Sharp in the branch-degree bound (the witness's branch tree is `K_{1,3}`). |
| 10 | SDR ⟺ threshold statement | graph-general, **∀ t incl. 0**, no tree hypothesis | T2 route plus C-F1-T's rank lemma with the corrected nested step | key face = tree form at `t ≥ 1` (C-U2-F), graph-general ∀ t as scope; `K_4`, `k = 2` shows `t ≥ 1` alone fails off trees | **Compatible, both carried.** The graph-general ∀ t form is the theorem; the tree `t ≥ 1` form is its composition with the tree `t = 0` lemma. The key face is the tree form, which matches the contract §1 row "(HS-SDR) ⟺ (HS)" with (HS) at `t ≥ 1`. SR-PP concurs ("needs all `t` on general graphs; `t ≥ 1` suffices on trees"). |
| 11 | (LC) quantifier | per-instance only now | true; no second proof of (DL) | §2 form compiled (`∀ t`, `hT` unused); graph-general `t ≥ 1` compiled by two critics | **Concordant.** Erratum R28-E-a governs: the §2 statement is carried with `∀ t` recorded on the face; the graph-general `t ≥ 1` form rides as a scope declaration. |
| 12 | (FC) statement | defers to U | R28-E-c applies | §2 hypothesis defective (`K_4 ⊔ K_4`, `k = 2`: `D_2 = 96 > 64` while each `K_4` has `i_2 = D_2 = 0`); corrected composition compiled twice | **Concordant.** Stage 7 face fixed below (R28-E-c). |
| 13 | r27 reformulation formal upgrade | — | — | carry as scope-note upgrade, not an award group | The facts record allows a small group. I **carry it inside C1-LA2** as companion declarations, so the r27 key gets a formal scope note and **no new key** (U's substance, the facts' mechanism). |
| 14 | Formal refutation of `T22` | admissibility of a kernel finite check is Stage 6's call | not ready (646,646 subsets; structural enumeration needed) | not ready; optional | **Ruled** under Lean awards: admissible in principle, not funded. |
| 15 | Surviving strengthening | (HS) on the BTP class (proved) | `P_1`, `P_2` prefix dominance (bounded, narrow, STATED) | — | Both recorded. The class result is proved; `P_1`/`P_2` are candidates that need a second read before any face (see Registrations). SR-BTP's bar on "sufficient conditions" concerns conditions **stronger** than (HS). `P_1`/`P_2` are **weaker** than (HS) (HS ⇒ `P_1` ⇒ `P_2` ⇒ (DL)), so that bar does not apply to them. |
| 16 | Controller Stage 5 facts wording | "46,977 instances" is a deficient-instance count, not a discrepancy | order-21 "one instrument" corrected | `Fintype.sum_equiv` location corrected to `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:722` | All adopted as record corrections (no sealed text edited). |

**My own spot-check** (a replay, never an instrument of record; own code, standard library, exact integers;
`scratchpad/c1-S/`):
- `T22`: independent-set backtracking and a forest-polynomial DP agree on every `i_k` and every `c_v(k)`.
  `i = [1,22,210,1144,3933,8907,13470,13529,8856,3691,975,171,19,1]`. The only failing `k` are 11 (`c_0 = 141`, hubs
  4, all leaves 136; row `t = 141`: 1 > 0) and 12 (`c_0 = 18`, hubs 0, all leaves 17; row `t = 18`: 1 > 0).
  `Σ_v c_v(k) = k·i_k` holds at every `k`.
- `U(d,m,r)`: for 18 members (`d ∈ {3,4,5}`, `m ∈ {2,3,4}`, `r ∈ {1,2,3}`, `n ≤ 67`) the closed forms hold. They are
  `α = 1 + dm(r+1)`, `c_o(k*) = dm·C(r+2,2)`, every leaf `c = (dm−1)·C(r+2,2) + C(r+1,2) + 1`, and hubs 0, with
  deficit exactly `d − 2` at `t = c_o(k*)`. I also re-derived the proof by hand. The leg is a path on `2r+1` vertices
  with a unique maximum independent set containing both ends. It has `C(r+2,2)` independent `r`-sets and `C(r+1,2)`
  of them through a fixed end. A set containing a hub has size at most `dm(r+1) − m + 1 < k*`. The r ≥ 2 part still
  needs an **isolated** second read: mine is not isolated.
- Free trees of orders 2–16 (leaf-extension generation, centre-AHU canonical form; counts equal A000055 through
  19,320 at order 16): 0 (HS) failures; 0 pendant-path failures (every vertex of every leaf's pendant path, every
  `k`); 0 failures of the own-leaf assignment on the BTP class; 0 failures at `k ≤ 2`. My instance counts follow my
  own convention and are not reconciled with any seat's. They are not load-bearing.
- Small witnesses reproduced:
  - (PW) branch-vs-leaf at order 9, `k = 5`: `c = (2,0,0,0,1,2,2,2,1)`.
  - `S(3,1,1)`, `k = 3`, along the pendant path: `(0,3,1,3)`.
  - `T22 + {0,3}`: row 2 > 1 at `k = 12` (`t = 17`) and at `k = 11` (`t = 126`).

## Exact established results

Grades follow `SOLUTION-CONTRACT.md` §4. "SR-cleared" means an isolated second read completed before Stage 6 confirmed
the item, as the Stage 6 facts record attests. "STATED" means the item was first made at a review stage and still needs
an isolated second read.

1. **(HS) is false.** `E993-R28-DOMINANCE-REFUTATION`, **REFUTED** (SR-HS-REF HR-1 confirmed).
   - *Witness* `T22` (aliases `R(3,2)_3`, `R(3,2)`, `T(3,1)`, `U(3,2,1)`, `H(1;3,3)`, `W22`). Edges
     `0–1,1–2,2–3,3–4,1–5,5–6,6–7,0–8,8–9,9–10,10–11,8–12,12–13,13–14,0–15,15–16,16–17,17–18,15–19,19–20,20–21`.
     Order 22, `IsTree` checked (connectivity and acyclicity separately). `Br = {0,1,8,15}`, all of degree 3, so 4
     slots. `L = {4,7,11,14,18,21}`. `α = 13`.
   - At `k = 12`, `t = 18`: `slots_{≥18} = 1 > 0 = leaves_{≥18}`. Also at `k = 11`, `t = 137..141`: 1 > 0. The maximum
     matching in `H_k` is 3 of 4 at both `k`.
   - Hand certificate: `c_0(12) = [x^{11}](1+3x+x^2)^6 = 18`. A leaf's count is `[x^{11}] (1+x)^2(1+3x+x^2)^5 = 17`,
     since sets through a hub have size at most 10.
   - (DL) holds at both `k` (`D_12 = 372 ≤ 456`, `D_11 = 3099 ≤ 3762`).
   - *Instruments of record:* C-F1-T and C-F1-U, independently.
   - *Family.* `R(d,m) = U(d,m,1)` (`d ≥ 3`, `m ≥ 2`): `proved_informal`, SR-cleared (HR-2). The deficit `d − 2` is
     unbounded.
   - *Minimality and uniqueness:* see item 9.
2. **`E993-R28-PENDANT-PATH-LEAF-DOMINANCE`. `proved_informal`, critic-attributed (C-T1-U, C-T1-F, C-T2-U, C-T2-F,
   C-F2-T, C-F2-U), SR-cleared (SR-PP PP-1).**
   - *Statement.* Let `G` be any finite simple graph and `w = u_0 – u_1 – … – u_m = ℓ` (`m ≥ 1`) a path with
     `deg u_i = 2` for `0 < i < m` and `deg ℓ = 1`. Then `c_w(k) ≤ c_ℓ(k)` for every `k`, with the exact identity
     `Σ_k (c_ℓ(k) − c_w(k)) x^k = x·(I(R − w) − I(R − N_R[w]))·I(P_{m−2})`, where `R = G − {u_1,…,u_m}` and
     `I(P_{−1}) = I(P_0) = 1`.
   - Since `w` is arbitrary, the statement holds at every `u_i` on the path.
   - *Hypotheses:* finiteness and the degree pattern only (no `IsTree`, no `n ≥ 2`).
   - `m = 1` is `E993-PAIR-R-LE-G-POINTWISE` (i) (VERIFIED).
   - It is not (PW): the vertex is compared only with the leaf at the end of its own pendant path.
3. **`E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2` (Theorem BTP). `proved_informal`, critic-attributed
   (C-T2-U; C-T2-F F2, C-F2-T Finding 2 and C-F2-U F-2 concordant and independent), SR-cleared with repairs
   (SR-BTP ×3).**
   - *Statement.* Let `T` be a finite tree in which every `v` with `deg v ≥ 3` has at most two neighbours `w` whose
     component of `T − v` contains a vertex of degree ≥ 3. Then for every `k` there is an injection from slots to
     leaves that sends each slot of `v` to one of `v`'s own pendant leaves `ℓ`, with `c_ℓ(k) ≥ c_v(k)`. Hence (HS)
     holds at every `t`, including `t = 0`.
   - *Hypotheses:* `IsTree` (connectivity makes each non-branch direction a pendant path; acyclicity makes the own-leaf
     sets disjoint) and finiteness.
   - *Sharpness:* for every branch-degree bound `D ≥ 3`, the class fails. `T22`'s branch tree is `K_{1,3}`.
   - *Composition:* with (LC) it gives (DL) on this class, `proved_informal`. That is a second proof on a subclass
     only.
4. **`E993-R28-BRANCH-TREE-SURPLUS-IDENTITY`. `proved_informal`, critic-attributed (C-T2-F; C-T1-U and C-T1-F
   concordant), SR-cleared with repairs (SR-PP).**
   - *Per vertex:* `p(v) − (deg v − 2) = 2 − btd(v)`, where `p(v)` is the number of pendant directions and `btd(v)` the
     branch-tree degree (F2: `p(v) = deg v − btd(v)`).
   - *Summed:* `Σ_{v∈Br}(p(v) − (deg v − 2)) = 2` when `Br ≠ ∅`.
   - *Corollary:* the own-pendant assignment is count-feasible iff every `btd ≤ 2`. The smallest infeasible tree is
     unique, at order 10 (H10, `α = 7`). T1 found it, T2 constructed it, and the critics proved minimality and
     uniqueness.
5. **`E993-R28-SDR-THRESHOLD-EQUIVALENCE`. `proved_informal`, seat-derived (T2, Lemma SAP; C-F1-T's rank lemma with
   the corrected nested step is a concordant critic proof). Compiled in scratch.**
   - *Graph-general form:* for every finite simple graph `G` and every `k`: (SDR) ⟺ `∀ t : ℕ, slots_{≥t} ≤ leaves_{≥t}`.
     U2's `sdr_iff_threshold`, via `nested_hall_iff_threshold`.
   - *Tree form:* on a finite tree, (SDR) ⟺ `∀ t ≥ 1, slots_{≥t} ≤ leaves_{≥t}`. C-U2-F's
     `sdr_iff_threshold_pos_of_tree`, using the tree `t = 0` lemma. The `t = 0` lemma was compiled twice,
     independently: C-U2-F `tree_slots_zero_le` and C-U1-F `tree_slots_le_leaves_zero`.
   - `t ≥ 1` alone is insufficient off trees: `K_4`, `k = 2`.
6. **`E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA` (LC). `proved_informal`, seat-derived (U1). Compiled sorry-free in
   scratch, rebuilt three times with byte-identical logs.**
   - The §2 statement: `∀ t` hypothesis, `hT` present but unused; only the `t ≥ 1` rows are consumed.
   - Graph-general form at `t ≥ 1`: critic-attributed (C-U1-T, C-U1-F), compiled.
   - It is an **instance-wise** implication. Its hypothesis fails at `(T22, 11)` and `(T22, 12)`, so it gives no route
     to (DL) on all trees.
7. **The r27 reformulation, compiled in full** (critic-attributed, C-U1-T and C-U1-F, independently).
   - Covers the identity, the biconditional, the slot count in ℤ, the general weight identity, and the exact
     leaf/branch identity with the isolated-vertex term.
   - This is a formal-evidence upgrade candidate for the registered r27 key, **not new mathematics**.
8. **(FC), corrected. The r27 consequence clause of `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION` (r27
   `proved_informal`), compiled.**
   - U2 compiled the two-piece convolution in ambient-degree, Finset-relative form.
   - C-U2-T compiled `bridge` and the end-to-end composition with the component hypothesis at **every `a ≤ k`**
     (R28-E-c). C-U2-F compiled an independent Finset-level core.
   - The §2 literal (single `k`) is **defective**: `K_4 ⊔ K_4`, `k = 2`.
9. **`E993-R28-DOMINANCE-CENSUS`. `bounded_computation`.**
   - The threshold form is exhaustive on every free tree to **order 21** on two reconciled instruments: C-F1-T's own,
     and F1's as run by C-F1-U. That is 2,144,505 classes at order 21, equal to A000055, with 0 failures.
   - Orders 2–20 are exhaustive on four instruments (F1, C-F1-T, C-F1-U, and the F adjudicator's third instrument):
     1,346,023 classes.
   - The matching form with a general matcher is exhaustive to order 20 on two critic instruments.
   - Tight instances: 5 at orders 19–20, 24 at order 21 (19 trees), none at order ≤ 18, and none at `t = min c_v`
     under the scoped definition.
   - At order 22, `T22` is the unique failing tree among 5,623,756, **on one instrument** (SR-HS-REF HR-3).
   - The minimum counterexample order is 22.
10. **Refuted local mechanisms** (minimal witnesses replayed by the adjudicators; grouped by SR-PP into one REFUTED
    record `E993-R28-HS-LOCAL-MECHANISMS`):
    - stepwise pendant-path monotonicity (`S(3,1,1)`, order 6, `k = 3`);
    - own-pendant self-sufficiency (order 10, exactly `btd ≥ 3`);
    - interior ≤ extremal branch vertex (order 8, `k = 3`);
    - per-direction domination (order 12, `k = 6`);
    - (PW) branch-vs-leaf (order 9, `k = 5`, unique at order 9 per F).

    The exact membership of the five is SR-PP's text.

## Refuted or narrowed mechanisms

- **(HS), (HS-SDR), `tree_leaf_slot_dominance`, `slot_leaf_sdr_exists`: FALSE.** The Hall/SDR route to a second proof
  of (DL) **on all trees and forests is closed**. The composed `forest_degree_lemma'` via (HS) is dead. U2's skeleton
  is a false statement closed by `sorry` (`Main.lean:470`). It must never be discharged or carried.
- **Every proposed sufficient condition for (HS) falls to `T22` by implication** (each ⇒ (HS-SDR) ⇒ (HS)). None may
  be registered as OPEN:
  - the local-first residual matching (RH / R-SDR / LFR, and C-F2-U's F-3 residual-Hall);
  - the rooted-export conjecture REC and its greedy (C-T2-U);
  - C-T1-F's rooted-subtree rule, for every root;
  - "(HS) on connected graphs with `|E| ≤ n`" (C-F2-T, C-F2-U).

  The order-15/16/17 supports of these conditions are superseded.
- **Relaxations refuted** (F adjudicator, replayed):
  - `k ≥ α − 1` (`T22` at `k = 12`);
  - `k ≤ α − c` for every `c ≤ 19` (`U(3,m,1)`);
  - the additive repair `+C` (`U(C+3,2,1)`);
  - weak majorization of ranked profiles, and the stop-loss / convex-order form (`T22`, 18 > 17);
  - the unicyclic form (`T22 + {0,3}`; STATED, see Registrations).
- **The bipartite-failure characterization is FALSE** (SR-PP): `T22` is bipartite with `|E| = n − 1` and fails. It is
  struck wherever a return states it.
- **Narrowed:**
  - T1's Part D "obstruction", narrowed to one-step peeling.
  - T1's "whole local family insufficient" (moot).
  - T2's "no per-direction rule can work" (struck: it works on the BTP class).
  - T2's "DM does not extend" (struck).
  - T2's "matching form strictly stronger" (struck: the forms are equivalent).
  - F1's evidential reading of its census (withdrawn) and its Hall step 5 (replaced by `S' = {c ≥ min_S c}`).
  - F2's "fractional relaxation = (DL)" (corrected: the fractional SDR equals (HS) by integrality; what collapses to
    (DL) is the `t`-sum).
  - U1's "generalizes one direction" (a weakening).
  - U2's "Lean-ready modulo one node" (the node is false).
- **(PW) witness of record corrected** (R28-E-b). The contract's order-5 `S(2,1,1)`, `k = 3` witness compares two
  leaves. The branch-vs-leaf form's smallest witness is order 9, edges `01,02,03,14,15,26,37,48`, `k = 5`,
  `c_0 = 2 > c_8 = 1`. The fence is unchanged.

## Headline verdicts

| Object | Verdict at the close of Stage 6 |
|---|---|
| (HS) `E993-R28-TREE-LEAF-SLOT-DOMINANCE` (Tier 1) | **REFUTED** (`T22`, `k = 12`, `t = 18`; two instruments C-F1-T and C-F1-U; SR-HS-REF confirmed). Lean target withdrawn. |
| (HS-SDR) | **REFUTED** (same witness; the maximum matching is 3 of 4 at `k = 11, 12`). |
| (LC) `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA` (Tier 1′) | `proved_informal` (U1); compiled in scratch; **Stage 7 award group C1-LA2**. True, and now instance-wise only. |
| (FC) `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES` (Tier 2) | §2 literal **defective** (R28-E-c). Corrected statement `proved_informal` (r27) and compiled in scratch; **C1-LA3**. |
| `E993-R28-SDR-THRESHOLD-EQUIVALENCE` (Tier 2) | `proved_informal` (T2); compiled; **C1-LA3**. |
| `E993-R28-DOMINANCE-CENSUS` (Tier 3) | `bounded_computation`: order 21 exhaustive on two instruments; order 22 unique failure on one. |
| `E993-R28-DOMINANCE-REFUTATION` (Tier 3, conditional) | **Triggered: REFUTED record**, witness, family and minimality graded clause by clause (Registrations R1). |
| Structural lemmas | pendant-path dominance `proved_informal`; BTP `proved_informal`; surplus identity `proved_informal`; local mechanisms REFUTED; recurrence `proved_informal` (a note, no key). |
| `E993-R27-FOREST-DEGREE-LEMMA` (input) | **`formally_verified`, unchanged.** It holds on `T22`, as it must. No re-registration. Scope note below. |
| `E993-R25-UNR-FOREST-WIDE` | OPEN, unchanged. No status transfer. |
| NR1 (via `E993-R25-NR1-DECOMPOSITION`), `E993-TGT-FOREST`, `E993-TGT-TREE`, `E993-TGT-TRANSFER` | Unchanged (FOREST, TREE and TRANSFER remain OPEN). No status transfer. |
| The aggregate `S(T,p)` at any rank, `E993-BETA-AGG`, `E993-G1WIDE-NO-SIZE-CAP` | Unchanged (OPEN). No status transfer. Nothing in this run is a no-recovery statement. |
| Erdős #993 | **Unchanged by construction.** This run's targets are counting statements on finite trees and forests. |

**Scope notes for r27 keys touched** (texts in Registrations):
- `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`: its scope says "the Hall/SDR sufficient condition (C-T2-U
  Step C) is OPEN". That condition is now REFUTED. The note also carries the (PW) witness correction, the formal
  upgrade if C1-LA2 awards, and the `(k,t) = (1,1)` cross-reference.
- `E993-R27-FOREST-DEGREE-LEMMA`: the SDR route is closed on all trees. (DL) is unaffected. BTP + (LC) is a second
  proof on the class `btd ≤ 2`.
- `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`: the formal consequence clause, if C1-LA3 awards.

## Lean awards

Common rules for every group:
- Pin Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`. Bind by manual symlink. Never `lake update`,
  `lake clean` or `elan`.
- Allowed axioms: `propext`, `Classical.choice`, `Quot.sound`. No `sorry`, `admit`, `native_decide` or `axiom`, and no
  `decide` over an enumeration for a universal step.
- Use **one definition layer**: the §2 text of `occ`, `slotsAtLeast` and `leavesAtLeast`, in one namespace.
  `Erdos993G1.indepCount` comes from the r25 award source (`736eb9df…`, entries 1 and 4) and
  `Erdos993G1.indepDegreeSum` from the r27 C1-LA1 source (`b49ea82a…`, entry 7). The registrar carries both
  byte-identically. U1's re-typed `indepDegreeSum` is **replaced** by the r27 entry text; C-U1-F's `Audit.lean` shows
  the two are equal by `rfl`.
- Compiled fragments travel by **declaration-level byte-identical transport only**. Before transport the formalizer
  verifies each source file's full SHA-256 against the prefix listed here and the adjudicator inventories.
- U2's `slot_leaf_sdr_exists` and `R28U2.tree_leaf_slot_dominance` are **never carried**.
- Attribution common to every face:
  - the mechanism: r27 critic `C-T2-U` (Finding 6, Steps A–D);
  - the `2 ≤ n` correction: the r27 T adjudicator;
  - the reformulation's second read: SR-JOIN (JN-3; JN-2 for the convolution);
  - the degree lemma: Fang–Lu–Nevo–Yao–Zheng 2026 §8 (formal (DL) of record: r27 C1-LA1);
  - Hall's theorem: classical, via Mathlib;
  - the r28 seats and critics named per group.

**C1-LA1 — (HS) `tree_leaf_slot_dominance`: `no award attempted`.** The statement is **false** (`T22`), so the
question of a closed DAG does not arise. The smallest obstruction is the witness itself, not an unproved lemma.

**C1-LA2 — (LC) and the r27 reformulation formal upgrade. FUNDED (carry and rebuild; every node compiled).**
- *Key:* `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA`.
- *Statement of record* (§2, exact):
  `theorem dominance_implies_degree_lemma {X : Type u} [Fintype X] [DecidableEq X] (G : SimpleGraph X) [DecidableRel G.Adj] (hT : G.IsTree) (k : ℕ) (h : ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t) : (Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k`.
  - The face records R28-E-a: the `∀ t` quantifier is harmless on trees (`tree_forall_t_of_ge_one`), and the proof
    consumes only `t ≥ 1`. `hT` is unused.
  - A tree `t ≥ 1` corollary may be added: the theorem composed with `tree_forall_t_of_ge_one`.
- *Scope declaration:* the graph-general form at `t ≥ 1` (`dominance_implies_degree_lemma_graph_general`, C-U1-T;
  `…_general`, C-U1-F). No acyclicity, no connectivity.
- *Companion declarations (formal scope note on the r27 key, no new key):* the r27 reformulation in full.
  - The weight identity `2k·i_k − D_k = Σ_v (2 − deg v)·c_v(k)` (any finite simple graph).
  - The exact leaf/branch identity with the `2·Σ_{deg 0} c_v` term, and its no-isolated-vertex form.
  - For `IsTree` with `2 ≤ card X`: the identity and the biconditional (connectivity only) and the slot count in ℤ
    (`IsTree.card_edgeFinset` and the handshake).
  - The tree `t = 0` lemma.
  - Declaration names are as in the compiled critic files; the formalizer records them.
- *Hypotheses:* `Fintype`, `DecidableEq`, `DecidableRel G.Adj`; no `k ≥ 1`, no `n ≥ 2` for (LC).
- *Carried fragments:*
  - U1 `LeanProof/Main.lean` (`74ab2108…`, 16,007 B; adjudicator copy-out `scratchpad/c1-adj-U/P1/LeanProof/Main.lean`),
    covering the theorem and `layerCake_subset`, `occ_le_card_indepSetFinset`,
    `sum_branch_slots_eq_sum_slotsAtLeast`, `sum_leaves_eq_sum_leavesAtLeast`,
    `indepDegreeSum_eq_sum_degree_mul_occ` and `sum_occ_eq_card_mul_indepSetFinset`;
  - C-U1-T `CriticCheck.lean` (`35b10eb0…`);
  - C-U1-F `Critic.lean` (`7ae3f19e…`) and `Audit.lean`;
  - C-U2-F's `tree_slots_zero_le`, if it is preferred for the `t = 0` lemma (see C1-LA3).
- *Attribution:* U1 (seat) for (LC); C-U1-T and C-U1-F for the graph-general form and the reformulation's Lean
  proofs; common attribution.
- *Fences and excluded conclusions:*
  - Not a proof of (DL) and not a second proof of (DL).
  - Its hypothesis fails at `(T22, 11)` and `(T22, 12)`.
  - No composition with `tree_leaf_slot_dominance`.
  - The reformulation upgrade is a **scope note on the r27 key**, never a new key, and it edits no r27 face.
  - No status transfer (SOLUTION-CONTRACT §3.1).
- *Repairs required by the adjudications:*
  - Strike "carried byte-identically" for U1's `indepDegreeSum`.
  - Strike U1's draft contract grade `formally_verified_conditional`, the false `def-occ` dependency, and the unfenced
    `informal_statement`.

**C1-LA3 — (FC) corrected and the SDR/threshold equivalence. FUNDED (carry and rebuild; every node compiled).** Two
keys; each registers independently if the other fails.
- *(FC) key* `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES`.
  - *Statement of record (R28-E-c; U's preferred face):* `forest_degree_lemma_of_tree_degree_lemma` — for
    `G : SimpleGraph X`, `hG : G.IsAcyclic`, `k : ℕ`, and the hypothesis "for every finite tree `T` (on any
    `Fintype` carrier in universe `u`) and every `a ≤ k`, `D_a(T) ≤ 2a·i_a(T)`", conclude
    `(Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k`.
  - Acyclicity is consumed only in `induce_supp_isTree`.
  - *Scope declarations:*
    - `degree_lemma_of_components`: every finite simple graph, with the component hypothesis at every `a ≤ k` on
      `G.induce C.supp`, no acyclicity;
    - `forest_degree_lemma_of_components_allk`, the contract-shaped face, in which `hG` is unused;
    - the two-piece convolutions `indepCountOn_union` and `indepDegreeSumOn_union` (ambient-degree, Finset-relative;
      `hsep` and `hdisj` both necessary);
    - `bridge` to the registered `deg_S` form on adjacency-closed sets.
- *SDR key* `E993-R28-SDR-THRESHOLD-EQUIVALENCE`.
  - *Statement of record:* `sdr_iff_threshold_pos_of_tree`. For `hT : G.IsTree` and `k : ℕ`: (∃ injective
    `f : Slot G → X` with `G.degree (f s) = 1` and `occ G s.1 k ≤ occ G (f s) k`) ↔
    `∀ t, 1 ≤ t → slotsAtLeast G k t ≤ leavesAtLeast G k t`. Here `Slot G := Σ v : {v // 3 ≤ G.degree v},
    Fin (G.degree v − 2)`, or U2's equivalent type recorded on the face.
  - *Scope declaration:* `sdr_iff_threshold`, the graph-general `∀ t : ℕ` form (no tree hypothesis), through
    `nested_hall_iff_threshold` and `sdr_iff_threshold_abstract`.
- *Carried fragments:*
  - U2 `LeanProof/Main.lean` (`5d71c16b…`; copy-out `scratchpad/c1-adj-U/P2/LeanProof/Main.lean`): the sorry-free
    declarations only (axiom log canonical digest `80c87cdc…`);
  - C-U2-T `CritU2T.lean` (`46be4587…`): `degree_lemma_on_union`, `bridge`, `degree_lemma_of_components`,
    `forest_degree_lemma_of_components_allk`, `induce_supp_isTree` and `forest_degree_lemma_of_tree_degree_lemma`;
  - C-U2-F `CritAdvance.lean` (`824c7609…`): `sdr_iff_threshold_pos_of_tree`, `tree_slots_zero_le`, `dl_union`,
    `dl_closed_of_components` and `degree_lemma_of_component_supports`, as an independent core.
- *Attribution:*
  - (FC): r27 `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION` (its r27 derivation and SR-JOIN JN-2); U2 (seat) for
    the convolution in Lean; C-U2-T (end-to-end, bridge) and C-U2-F (core) for the corrected composition.
  - SDR: T2 (seat, Lemma SAP, informal); C-F1-T (rank lemma, informal); Hall (classical, via Mathlib); U2 (seat,
    graph-general Lean); C-U2-F (tree form).
- *Fences and excluded conclusions:*
  - (FC) is never composed with r27's `forest_degree_lemma` to present a "second proof" of (DL) (fence §3.2). It is the
    formal consequence clause of the r27 convolution key, a scope note there.
  - The SDR equivalence is an equivalence per `(G, k)`. It is never evidence for either side. After the refutation it
    says that `T22`'s threshold failure is exactly a matching failure.
  - No status transfer.
- *Repairs:*
  - The §2 single-`k` `hcomp` is not used (R28-E-c).
  - U2's certification literals are struck: "all four" becomes three; the `Fintype.sum_equiv` location is corrected;
    "byte-identical" holds at declaration level only (entry 1 is `5484fc21…`, entry 4 is `4463e7ee…`); the SR-JOIN
    "841" becomes 5,625 for the convolution; `compiled` is not a grade.

**C1-LA4 — pendant-path leaf dominance. FUNDED as a BOUNDED ATTEMPT.**
- The mathematics is proved and SR-cleared, and the DAG is closed. There is no compiled fragment. Every open node is
  Lean engineering: the induced shift-by-two embedding, or the direct injection `J ∋ u_i ↦ φ(J ∖ {u_i}) ∪ {ℓ}`, plus
  independent-set monotonicity.
- *Key:* `E993-R28-PENDANT-PATH-LEAF-DOMINANCE`.
- *Statement* (T adjudicator's Lean form, graph-general):
  `∀ (G : SimpleGraph X) [Fintype X] [DecidableEq X] [DecidableRel G.Adj] (m : ℕ) (u : Fin (m+2) → X), Function.Injective u → (∀ i : Fin (m+1), G.Adj (u i.castSucc) (u i.succ)) → (∀ i : Fin (m+2), 0 < i.val → i.val < m+1 → G.degree (u i) = 2) → G.degree (u (Fin.last (m+1))) = 1 → ∀ (i : Fin (m+2)) (k : ℕ), occ G (u i) k ≤ occ G (u (Fin.last (m+1))) k`.
  The polynomial identity is optional.
- *Hypotheses:* degree pattern and finiteness; no `IsTree`.
- *Attribution:* C-T1-U, C-T1-F, C-T2-U, C-T2-F, C-F2-T and C-F2-U (independent derivations); T1 and F2 for the
  `m = 1` case (`E993-PAIR-R-LE-G-POINTWISE` (i), VERIFIED, cited as corroboration).
- *Fences:* not (PW); no comparison of a branch vertex with an arbitrary leaf; no status transfer.
- *Excluded:* stepwise monotonicity along the path, which is REFUTED (`S(3,1,1)`).
- *If it does not close:* record `no award` with the smallest open Lean node. There is no Cycle 2.

**C1-LA5 — BTP and its composition with (LC). FUNDED as a BOUNDED ATTEMPT, after C1-LA4 and C1-LA2.**
- The mathematics is SR-cleared with repairs. The DAG is closed and short (SR-BTP):
  - the pendant-direction count;
  - disjointness of the own-leaf sets;
  - the pendant-path lemma (C1-LA4);
  - an explicit injection.

  Every open node is Lean engineering.
- *Key:* `E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`.
- *Statement:* for `hT : G.IsTree` with
  `hB : ∀ v, 3 ≤ G.degree v → (Finset.univ.filter (fun w => G.Adj v w ∧ ∃ z, 3 ≤ G.degree z ∧ z ≠ v ∧ (G.induce {v}ᶜ).Reachable ⟨w, _⟩ ⟨z, _⟩)).card ≤ 2`
  (or an equivalent branch-direction predicate that the formalizer records on the face), and every `k`: the SDR of
  C1-LA3's `Slot G` exists, and hence `∀ t, slotsAtLeast G k t ≤ leavesAtLeast G k t`.
- *Composition:* `(Erdos993G1.indepDegreeSum G k : ℤ) ≤ 2 * k * Erdos993G1.indepCount G k` on the class, through
  C1-LA2. This is a byte-different second formal proof of (DL) **on that class only**. It registers as a scope note on
  `E993-R27-FOREST-DEGREE-LEMMA` (an alias distinction), never as a (DL) key.
- *Attribution:* C-T2-U (Theorem BTP); C-T2-F, C-F2-T and C-F2-U (independent proofs); SR-BTP (repairs); U
  adjudicator's route U-BTP-CLASS-FORMAL.
- *Fences:*
  - Not (HS) on all trees. It is sharp: `T22` is outside the class.
  - Not (DL) on all forests; (DL)'s key face is never edited.
- *If it does not close:* record `no award` with the smallest open node. The informal key still registers at
  `proved_informal`.

**Not funded.**
1. **A formal refutation of `tree_leaf_slot_dominance`.** *Ruling on T's question:* the contract bans `decide` over an
   enumeration for a **universal** step. A kernel-evaluated check of one explicit finite instance is not a universal
   step, so it is **admissible in principle** (kernel `decide`/`rfl`/`norm_num`; never `native_decide`). But the naive
   check over `C(22,12) = 646,646` subsets is infeasible, and the feasible route is a structural proof (U(d,m,r)-style
   uniqueness of the leg maxima). Stop gate §5(b) does not require it, and the REFUTED registration stands on two
   instruments and a second read. It is **not funded at Stage 7** and passes to successors.
2. **(HS) and anything composed with it**: false.
3. **`P_1`/`P_2`**: unproved.

**Stage 7 priority and budget rule.**
- Run C1-LA2 and C1-LA3 first; they are pure carry and rebuild.
- Then C1-LA4, then C1-LA5.
- A group not closed within the Stage 7 budget is recorded as open formal residue with its smallest open node. No
  cycle follows.

## Progress and stop-gate ruling

- **Material progress: yes.** The Tier 1 question is **decided**: (HS) is REFUTED, with a minimal-order witness, an
  infinite family of unbounded deficit, and the census horizon moved from the order-18 prior to exhaustive order 21 on
  two instruments. The cycle also proved the pendant-path lemma, Theorem BTP (sharp) and the surplus identity. It
  compiled (LC), the SDR equivalence and the corrected (FC).
- **Plateau: no.**
- **The mathematics of (HS) at the close of Stage 6:** **REFUTED.**
  - It is not `proved_informal`, and it is not open.
  - *Witness:* `T22`, `k = 12`, `t = 18` (also `k = 11`, `t = 137..141`).
  - *Two independent instruments:* C-F1-T (Kronecker DP plus a backtracking enumeration of all 54,929 independent sets)
    and C-F1-U (in/out DP plus a DP-free enumeration). Each critic worked in isolation from the other.
  - *Corroboration:* three adjudicator replays (T: DP, bitmask, naive enumeration; F: literal `2^22` scan plus DP plus
    closed form; U: DP, backtracking, literal `k`-subset enumeration) and the controller prior.
  - *Isolated second read:* SR-HS-REF, HR-1 confirmed.
- **Stop gate `SOLUTION-CONTRACT.md` §5:**
  - Event (a) is impossible.
  - **Event (b) is MET on the record**: an in-scope counterexample with exact counts (a finite tree; `k = 12 ≥ 1`;
    `t = 18 ≥ 1`; the threshold form exactly as §1 and §2 state it), confirmed by two independent instruments and an
    isolated second read.
  - The run **ENDS** at the Cycle 1 close. The refutation is registered (R1–R4). The weakest surviving strengthening is
    recorded:
    - proved on a class: (HS) on `btd ≤ 2` (BTP);
    - STATED and pending a second read: (HS) at `k ≤ 2` on all trees;
    - candidates on all trees: `P_1`/`P_2` prefix dominance, `bounded_computation`, STATED, not registered.
- **Is Cycle 2 needed if Stage 7 closes its groups?** No. It is not needed if Stage 7 fails either. Event (b) ends the
  run independently of Stage 7. Stage 7 is funded only for surviving true statements with closed DAGs.
- **The headline flag is `no` by the protocol's definition** (only a governed formal award sets it). The allocation's
  shared rule calls "(HS) … REFUTED with a second read" a headline event. That event has occurred at the informal
  grade, and it is what §5(b) consumes. I record the tension and follow the synthesis protocol for the flag.

```text
headline_resolved: no
material_progress: yes
plateau: no
continue: no
```

## Next-cycle portfolio

**No Cycle 2.** The stop gate ends the run (§5(b)). This moots the dispatch's "9 routes, 3 per orientation" by its
own "unless the stop gate ends the run" clause, and equally the protocol's "2 per orientation" conditional portfolio.
I note the discrepancy between the dispatch and the protocol for the controller; it is moot here.

**Successor inheritance.** These seeds are non-binding, for a successor run and not for r28. Each respects this run's
fences.
- **T (prove):**
  1. The failure-set theorem: prove the mixed odd-leg hubs `H(1;a,b)` (odd `a, b ≥ 3`; bounded to `n ≤ 40`) and the
     even-leg mechanism (order 24) fail, and characterize (HS)-failing trees beyond `U(d,m,r)`.
  2. Prove or refute `P_2`, then `P_1`, on all trees: the weakest surviving matching-type strengthening of (DL).
  3. Extend BTP past `btd ≤ 2` with a second parameter (leg length or parity), since branch degree alone is sharp.
- **F (falsify):**
  1. A second full instrument at order 22 (uniqueness of `T22`) and order 23 exhaustive.
  2. An adversarial attack on `P_1`/`P_2` over non-hub shapes (three-level hubs, several `btd ≥ 3` vertices, mixed
     legs).
  3. The unicyclic minimum counterexample order, now between 15 and 22.
- **U (formalize):**
  1. A formal refutation of `tree_leaf_slot_dominance` at `T22` by structural enumeration, with no `decide` over the
     enumeration.
  2. Any of C1-LA4 and C1-LA5 left open at Stage 7.
  3. A formal statement of the `U(d,m,r)` family, and of `P_2` if T proves it.

## Registrations

Every item below carries its grade and attribution on its face. The controller uses the second reads' own texts where
they exist (SR-HS-REF R1–R4, SR-PP, SR-BTP). My wording summarizes those texts and does not replace them.

**A. Register-ready at the close** (seat-derived and adjudicator-confirmed, or SR-cleared):
1. **R1 `E993-R28-DOMINANCE-REFUTATION`: REFUTED**, per SR-HS-REF R1, graded clause by clause:
   - witness `T22` with exact counts at `k = 11, 12` (REFUTED; C-F1-T and C-F1-U; F1 credited for the pointer);
   - family `R(d,m)` (`proved_informal`, HR-2);
   - minimum order 22 (`bounded_computation`, two instruments to order 21);
   - uniqueness at 22 (`bounded_computation`, one instrument, HR-3);
   - the fallen sufficient conditions as clauses (not OPEN);
   - the surviving-strengthening clause (BTP proved on its class; the rest per section B);
   - attribution: C-F1-T and C-F1-U (discovery); T, F and U adjudicators (replays); the controller prior; SR-HS-REF.
2. **R2 `E993-R28-TREE-LEAF-SLOT-DOMINANCE`: REFUTED**, with a scope note withdrawing the Lean target
   `tree_leaf_slot_dominance` and marking `slot_leaf_sdr_exists` false (SR-HS-REF R2). (HS-SDR) is refuted with it.
3. **R3, scope note on `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`** (SR-HS-REF R3). The note records:
   - "the Hall/SDR sufficient condition (C-T2-U Step C) is REFUTED (r28, `T22`); the reformulation itself is
     unaffected";
   - the (PW) witness correction (R28-E-b): C-T2-U Step D's order-5 witness is leaf-vs-leaf; the branch-vs-leaf form
     fails first at order 9, `k = 5`;
   - the formal upgrade, if C1-LA2 awards;
   - F2's `(k,t) = (1,1)` identity `Σ_{Br}(deg−2) = |L| + 2(|E| + Z − n)` as the `k = 1` instance of the in-scope
     general weight identity (C-F2-U's reading, F adjudicator), with a cross-reference to
     `E993-R27-DEGREE-LEMMA-K1-ACYCLICITY-CRITERION` (`Z` isolated vertices versus the component count).
4. **R4, the census-horizon note, `E993-R28-DOMINANCE-CENSUS`: `bounded_computation`**, as in Exact established results
   item 9. Attribution: F1, C-F1-T, C-F1-U, the F adjudicator, SR-HS-REF (order 22). The controller's order-18
   instrument is a prior.
5. **`E993-R28-PENDANT-PATH-LEAF-DOMINANCE`: `proved_informal`** (critic-attributed, six critics; SR-PP PP-1).
   `formally_verified` if C1-LA4 awards.
6. **`E993-R28-LEAF-SLOT-DOMINANCE-BRANCH-TREE-MAX-DEGREE-LE-2`: `proved_informal`** (C-T2-U, with C-T2-F, C-F2-T and
   C-F2-U; SR-BTP with repairs). Sharp. `formally_verified` if C1-LA5 awards.
7. **`E993-R28-BRANCH-TREE-SURPLUS-IDENTITY`: `proved_informal`** (C-T2-F; C-T1-U and C-T1-F concordant; SR-PP with
   repairs). It absorbs the order-10 local-failure record (H10: existence T1; construction T2; minimality and
   uniqueness critic-attributed; `α = 7`).
8. **`E993-R28-HS-LOCAL-MECHANISMS`: REFUTED** (SR-PP; membership per SR-PP's text; witnesses in Exact established
   results item 10).
9. **SR-PP's two scope notes replacing F2's fence candidates.** The bipartite characterization is struck as false. My
   reading of the two notes: the `(1,1)` identity note (item 3) and the unicyclic census bounded by the order-22
   unicyclic counterexample (section B). SR-PP's text governs.
10. **`E993-R28-SDR-THRESHOLD-EQUIVALENCE`: `proved_informal`** (T2 seat-derived; C-F1-T's rank lemma an attribution
    note). `formally_verified` if C1-LA3 awards.
11. **`E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA`: `proved_informal`** (U1 seat-derived). `formally_verified` if C1-LA2
    awards. It carries the graph-general `t ≥ 1` scope and the instance-wise fence.
12. **`E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES`.** Register only at `formally_verified`, if C1-LA3 awards, at the
    corrected statement. Otherwise its content stays the r27 consequence clause and gets no new informal key.
13. **Scope note on `E993-R27-FOREST-DEGREE-LEMMA`.** It records two things:
    - "r28: the Hall/SDR route (HS) is REFUTED (`T22`); (DL) holds there and is unaffected";
    - BTP + (LC) is a second proof on `btd ≤ 2` trees (`proved_informal`; `formally_verified` on that class if C1-LA5
      awards). The r27 award remains the (DL) of record.
14. **Scope note on `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`.** The formal consequence clause at the corrected
    all-`a ≤ k` hypothesis (if C1-LA3 awards). The Lean form is ambient-degree and Finset-relative, and `bridge` covers
    adjacency-closed sets. The §2 single-`k` defect is recorded with its witness (`K_4 ⊔ K_4`, `k = 2`).
15. **Corroboration note on `E993-PAIR-R-LE-G-POINTWISE`.** T1, T2 and F2 re-derived (i). It is the `m = 1` case of
    item 5.

**B. STATED: an isolated second read is owed before any registration.** At the close, list these as pending:
- the `r ≥ 2` part of `U(d,m,r)` (F adjudicator merge; my non-isolated check agrees on 18 members);
- (HS) at every `k ≤ 2` on every finite tree (F adjudicator);
- the unicyclic counterexample `T22 + {0,3}` and `E993-R28-DOMINANCE-UNICYCLIC-CENSUS` (the minimum lies between 15
  and 22; F adjudicator; 75 of 210 single-edge additions fail);
- the leaf-deletion / vertex-deletion recurrence, as a note under `E993-PAIR-GENERATION-THEOREM` (T1 leaf case; C-T1-U
  general form);
- the (PW) branch-vs-leaf minimality and uniqueness at order 9 (C-T1-U; replayed by the T and F adjudicators), unless
  SR-PP's text already covers it;
- the `P_1`/`P_2` prefix-dominance candidates (F adjudicator; `bounded_computation`; narrow evidence). They are
  candidates only and are not registered OPEN by this synthesis;
- T's `H(1;a,b)` odd-leg claim, which is `conjecture`-grade on bounded evidence.

**C. Synthesis-first items (STATED by me):**
- The cross-reference from `E993-R28-SDR-THRESHOLD-EQUIVALENCE` to `E993-EXCHANGE-LEMMA-SEQ` (VERIFIED; a
  sorted-domination ⟺ counting-form criterion against a strictly antitone ladder). They are related but **not
  aliases**: the objects differ (two arbitrary multisets versus a sequence against a ladder).
- The reading that SR-BTP's "no sufficient condition as OPEN" bar does not reach `P_1`/`P_2`.

Both need an isolated second read if the controller wants them on a face.

**D. Records (no face edits):**
- errata R28-E-a through R28-E-d bind the Stage 7 statements;
- the Stage 5 facts' "one instrument at order 21" is superseded;
- the `Fintype.sum_equiv` location is `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:722`;
- SR-JOIN "841" is the single-cross-edge table (5,625 for the convolution);
- H10 has `α = 7`;
- **incident R28-I-1** (the U adjudicator's stray `lake env lean` installed Lean v4.34.1 through elan over the
  network; no build depends on it) is for Ashton's decision.

**Excluded everywhere:**
- no registration re-registers (DL) or edits a sealed r25/r26/r27 face;
- no status transfer to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER,
  `E993-BETA-AGG`, the aggregate at any rank, `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE`, or Erdős #993;
- no mention of the Codex run's target beyond fence §3.1.

## Continuation ruling

**Stop gate §5(b) is MET, and I rule it met explicitly.** The in-scope counterexample `T22` has exact counts at
`k = 12`, `t = 18`. Two independent instruments confirm it (C-F1-T and C-F1-U, isolated from each other). Three
adjudicator replays reproduce it (T, F, U). The isolated second read SR-HS-REF confirms it (HR-1; HR-2 for the family;
HR-3 and HR-4 with repairs).

- **The run ENDS at the Cycle 1 close. Cycle 2 does not run.** Plateau: no. The controller checkpoint after Cycle 3
  does not arise.
- **Stage 7 is funded only for surviving true statements with closed DAGs:**
  - C1-LA2: (LC) plus the r27 reformulation formal upgrade; carry and rebuild.
  - C1-LA3: the corrected (FC) plus the SDR/threshold equivalence; carry and rebuild.
  - C1-LA4: pendant-path leaf dominance; bounded attempt.
  - C1-LA5: BTP and its composition with (LC); bounded attempt, after C1-LA4 and C1-LA2.
- C1-LA1 ((HS)): `no award attempted` (false).
- The optional formal refutation is not funded.
- Whatever Stage 7 does not close is recorded as open formal residue for a successor. It does not reopen r28.

## Artifact inventory

Written by this seat:
- `cycles/cycle-1/stage6/SYNTHESIS.md` (this file).
- Scratch under `scratchpad/c1-S/`. Standard library only, exact integers, foreground runs; SHA-256 values:

| File | SHA-256 | Role |
|---|---|---|
| `syn_check.py` | `a37c72753653400691ddd321b3bcb4639deed6352ed140172f3ad8a22b66fa57` | Own spot-check: `T22` by backtracking and by forest DP; the `U(d,m,r)` closed forms on 18 members; free-tree census (leaf extension, centre-AHU canonical form) with (HS), pendant-path, BTP own-leaf and `k ≤ 2` checks. `python3 syn_check.py N`. |
| `syn_check_13.out` | `7281e6f23ba6d66c7e3143db551f1029fbb784041a698a56cb94dee08b840b6d` | Run to order 13 (canonical result digest `cea2dc2d…`). |
| `syn_check_16.out` | `7c498fd297c876dd5527fefa1ef5c0b8c3594f6611a4b1030521ccc515c2c675` | Run to order 16 (canonical result digest `fa087787…`; 18.8 s). Tree counts equal A000055; 0 failures of every check. |
| `syn_small.py` | `0aa9e61b3fde3f7219b65d41329b424392c6b190bd23cc4e9868f699407911a8` | (PW) order-9 witness, `S(3,1,1)`, `T22 + {0,3}`. |
| `syn_small.out` | `1fe2d46e664924928ca3aa242aacd67527c073b551dd4a5dcac975c54dbf0206` | Its output. |

These are a synthesis replay and never an instrument of record. I started no background job, and none is running at
this write. I reread this file before close.
