# Critique

Critic `C-F2-T` (cross-orientation critic, orientation T, of seat `F2`, route `C4-F-02 GK-UNIFORM-HALL-OR-CUT-AND-THE-SATURATION-CONJECTURE`), r30 Cycle 4 Stage 4, 2026-09-27.

**Boot.** I am operating within VerityOS. Boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, read before anything else. The host injected the project `CLAUDE.md` and the user auto-memory index into context at session start (not opened, not acted on); no other VerityOS file was read.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: `claude-opus-5-5[1m]` (verbatim from the host's system context).

**Summary.** The return's bounded result replays byte-identically, and my independent instrument reproduces every one of its 86 orbit rows exactly. My main finding is a critic-derived, parameter-uniform, deletion-only saturating flow on `G_k` at `p = k+3` for EVERY `k ≥ 1` and EVERY tag set `F ⊆ leafSet(G_k)`: one injection per tag, taken from explicit symmetric chain decompositions (§ Independent re-derivation, Theorem CT-1). It settles the open core the return hands on ("a closed-form proof that the `G_k` orbit-quotient max-flow saturates for every `k`"). It also falsifies two of the return's literals: that no local context-free rule can work, and that no tested row is close to tight. It is STATED here and needs an isolated second read. The return has five fidelity and certification defects: no `supply − capacity = S` assertion in any shipped network code; `F_p` and eligibility are not derived in shipped code for the orbit rows `k = 41..60`; a false attribution of the `G_k` fixed points to `SEMANTIC-CONTRACT.md` §1.2; a conjecture search that silently skips every tree of order ≥ 18 (49 of 546 trees, including all 9 hand-built trees of order 18–29 that the return advertises); and 265 of its 1,509 rows that are vacuous and misreport capacity 0. None of these changes a number in the return's §3 table.

## Identity and seal audit

- Dispatch `control/dispatch/c4-stage4/DISPATCH-C-F2-T.md`: SHA-256 `4278bddd98e22e4303ed7b413ad447cd6fb9c3557bc7960a508215381905e9f0`, checked before reading. **Match.**
- Capsule `control/c4-critic-capsules/F2-PACKET-MANIFEST.json`: inner seal recomputed over canonical JSON without `seal_sha256` (`sort_keys`, separators `(",", ":")`, no trailing newline): `0fd0246169f5917587d93039f052316d69d229ea506aee89c42864e76d3551f5`. **Match.** All 14 listed members match their bytes and SHA-256.
- Stage 2 packet manifest seal `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`: recomputed, **match**. Stage 3 packet manifest seal `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`: recomputed, **match**. Its entry for `cycles/cycle-4/stage3/returns/F2/RETURN.md` is 30,570 bytes / `39d3170b…`, the same as the capsule entry and the file. Stage 4 dispatch manifest seal `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`: recomputed, **match**.
- Return artifact digests: all 11 inventoried files under `scratchpad/c4-F2/` (`model.py` … `conjecture_search_out.json`) were copied into `scratchpad/c4-crit-F2-T/replay/` and hashed. **All 11 match the return's table and `MANIFEST.json`.** `make_manifest.py` (`3de45d8e…`) is listed as self-referential and was not relied on.
- The return lists no `sources/` digests (it read no `sources/` file). I read no `sources/` file either.
- Read-boundary disclosures record (capsule member): F2's items are the host-injected context, one single-file grep on the run-local registry, and the `pkill -f` incident. I weigh them under § Certification audit.
- **Process disclosure (own).** One background job: `python3 -B quotient.py 41 60 D`, launched with `nohup` (PID 42931, recorded at launch), watched by `kill -0 42931` polling and a Monitor that I stopped, and terminated with `kill 42931` (literal PID) at `k = 56`. No pattern kill, no process listing. No other background job; none remains.
- **My own read boundary:** the two boot files; the dispatch; the protocol; the capsule and its listed members (for `C4-CRITIC-ATTACK-BRIEFS.md`, the preamble and my seat's F2 section only); the F2 return; F2's inventoried scratch files (copied out first, run only from my replay copy). No other return, critique, adjudication, `sources/` file, registry file, other experiment root or external source was read. No `find`, `grep`, `rg`, `ls -R` or glob search was run above my grant (the only listing was a non-recursive `ls` of my own scratch directory). No network, no installs, no Lean.

## Independent re-derivation

**Instrument (own, standard library, `python3 -B`, `scratchpad/c4-crit-F2-T/own/`).** I wrote `core.py` from `SEMANTIC-CONTRACT.md` §1.1–1.2. It has its own `G_k` labelling (arm `i` = `(5+i, 5+k+i, 5+2k+i)`), an edge-count plus BFS tree test, and an iterative forest independence-polynomial DP. `x` is the first strict descent searched through rank `α` inclusive. `F_p` is derived leaf by leaf from `Δ_p(T − v) < 0` on the original tree. `S` comes from the literal `H_v`/`R_v` deletion sets. `w_F` is literal (tag `v ∈ F ∩ B` with another neighbour of `s_v` in `B`). (D) and (S) are literal. Max-flow is my own Edmonds–Karp (greedy start plus shortest augmenting paths, exact integers), not F2's Dinic. `verify_flow` is an independent **arc-by-arc certificate check**: every positive arc is in the relation, every source row sums to its supply, every target column is at most its capacity. Every row asserts `supply − capacity = S`, with supply and capacity from the network and `S` from the per-leaf `H_v`/`R_v` polynomials (two computations).

1. **Fixed points (common brief), literal network (`literal.py`, `literal_out.json`).**
   - `K_{1,12}/8`: `n` 13, `α` 12, `x` 6, 12 favorable, 1980/3960, `S = −1980`, no switch arc, deletion-only saturates.
   - Path-star `(2,3,4)/7`: `n` 15, `α` 11, `x` 5, 10 favorable, 1483/2701/flow 1483, `S = −1218`, **2025** positive-to-positive arcs under (D)∪(S).
   - Path-star `(2,2,4,3)/8`: `n` 18, `α` 13, `x` 6, 12 favorable, 8033/13467/8033, `S = −5434`, **11691** arcs.

   All reproduced. (`CB(8,92)` and `T_m` are out of this instrument's literal reach and are not needed for `G_k`.)
2. **`G_k`, literal network, `k = 1..8`** (`literal_out.json`, `literal_k8_out.json`). Tree test passes, `x = k+1`, `α = 2k+3`, eligible exactly for `k ≥ 3`, and `F_p` derived equal to all `k+3` leaves at every `k`. `supply − capacity = S` asserted: 253/527/−274, 1542/2735/−1193, 8875/14196/−5321, 49422/73573/−24151, 269507/380552/−111045, 1448816/1964489/−515673 for `k = 3..8`. A verified saturating certificate exists under (D) and under (D)∪(S) at every `k = 1..8` (at `k = 8`: 4,270,680 / 5,364,368 positive arcs). `k = 8` is one step beyond F2's literal validation range.
3. **Orbit quotient, own encoding (`quotient.py`).** Types are enumerated independently. Each type's representative is a literal set, checked for independence and canonical class. The weight is computed literally on that representative. Arcs come from **literal (D)/(S) enumeration on the representative**, then canonicalized, so no hand-derived transition table is used. `Σ` orbit sizes equals `i_{p+1}` and `i_p` from the DP, asserted. Results:
   - `k = 1..40` under (D) and under (D)∪(S): every row eligible for `k ≥ 3`, `F_p` derived as all leaves, `supply − capacity = S` asserted, arc-by-arc verified saturating certificate (`quotient_1_12_DS.json`, `quotient_13_40_DS.json`).
   - `k = 41..55` under (D): same checks, all pass (`q41_60_D.log`, 15 rows). The run was launched for 41..60 and stopped by literal PID at `k = 56` because Theorem CT-1 makes the extension unnecessary. `k = 56..60` were not re-derived by my instrument; my WID check of F2's rows 56..60 (item 5) was done.
   - Under (D)∪(S) this reaches `k = 40` against F2's 30.
   - This quotient step is a max-flow on the full-`Aut` orbit quotient. Its passage to the original network is C3-LA1 (`formally_verified`, run award). The theorem below does not use it.
4. **F2's encoding cross-checked (`cmp_types.py`, `cmp_types_out.json`).** For `k = 1..30`, F2's `types_of_size`, `weight`, `orbit_size`, `deletion_targets` and `all_targets(…, use_switch=True)` agree exactly with my literal derivations at both ranks. The counts are 0 type-set, 0 weight, 0 orbit-size, 0 (D)-set and 0 (D)∪(S)-set mismatches. The orbits are those of `S_k × Z_2`, and that group is all of `Aut(G_k)`: `0` is the unique vertex of degree `k+2` for `k ≥ 2`, and its three leg types (leaf, cherry `2;3,4`, arm `a–b–c`) are pairwise non-isomorphic; for `k = 1` the two degree-3 vertices `0` and `2` have neighbour-degree multisets `{1,2,3}` and `{1,1,3}`. So the types are exactly the `Aut(G_k)`-orbits, supplies and capacities are orbit totals of the active weight with `F_p` derived, and the arc rule is existential. This is C3-LA1's hypothesis, not a coarser equitable partition.
5. **Every F2 orbit row checked against my `S` (`k = 3..60` (D), `3..30` (D)∪(S), 86 rows).** `total_supply − total_capacity = S(G_k, k+3)`, with `S` from my literal `H_v`/`R_v` aggregate, holds on all 86 rows. `max_flow = total_supply` on all 86. Supplies and capacities equal mine wherever both exist. So F2's numbers are right even though F2's shipped code never asserts WID (§ Attacks, A1).

**Theorem CT-1 (critic-derived, attributed to `C-F2-T`; STATED at Stage 4, needs an isolated second read).** Take `k ≥ 1`, `p = k+3`, and `F` any subset of the leaves of `G_k` (root `0`; leaf `1` on `0`; support `2` on `0` with leaves `3, 4`; `k` arms `0–a_i–b_i–c_i`). Then the network of `SEMANTIC-CONTRACT.md` §1.2 **with deletion arcs (D) only** has a saturating integral flow. So (HALL-COND) holds for every `X ⊆ I_{p+1}` under (D), and a fortiori under (D)∪(S).

With `F = F_p(G_k)` and the registered eligibility key `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` (`proved_informal`; `p = k+3` eligible for `k ≥ 3`), this gives **(HALL) on the infinite eligible family `{(G_k, k+3) : k ≥ 3}`**. For `k ≥ 4`, `n = 3k+5 ≥ 2p+3`, so these rows lie in the unresolved band; `k = 3` (`n = 14 = 2p+2`) is in the closed band.

*Proof.*
- **(0) No source contains `0`.** If `0 ∈ B` then `1, 2, a_j ∉ B`, and each arm contributes at most one of `b_j, c_j`, so `|B| ≤ 1 + 2 + k = k+3 < p+1`.
- **(1) Per-tag reduction.** For `τ ∈ F` let `U_τ(j)` be the sets of `I_j` in which `τ` is active. Suppose each `τ` has an injection `φ_τ : U_τ(p+1) → U_τ(p)` with `φ_τ(B) = B ∖ {q}` for some `q ∈ B`. Put `f(B, A) := #{τ ∈ F : τ active in B, φ_τ(B) = A}`. Then `f` is positive only on (D)-arcs, and the row sum at `B` is the number of tags of `F` active in `B`, which is `w_F(B)`. By injectivity the column sum at `A` is at most `#{τ ∈ F : τ active in A} = w_F(A)`.
- **(2) The three tag shapes, using (0).**
  - `τ = c_i` (active iff `a_i ∈ B`): `B = {a_i, c_i} ⊔ S` with `S` independent in `G_k − {0, a_i, b_i, c_i} = K_1 ⊔ k·P_3` (vertex `1`, cherry `3–2–4`, the other `k−1` arms), `|S| = k+2`. Targets are `{a_i, c_i} ⊔ S'` with `|S'| = k+1`, and deleting from `S` keeps `c_i` active.
  - `τ = 3` (and symmetrically `4`): by (0) activity at rank `p+1` forces `4 ∈ B`. So `B = {3, 4} ⊔ S` with `S` independent in `G_k − {0, 2, 3, 4} = K_1 ⊔ k·P_3`, `|S| = k+2`; the images `{3, 4} ⊔ S'` keep `3` active.
  - `τ = 1` (active iff `B ∩ {2, a_1..a_k} ≠ ∅`): `B = {1} ⊔ S` with `S` independent in `G_k − {0, 1} = (k+1)·P_3` (cherry `3–2–4` plus the `k` arms), `|S| = k+3`. Targets must have `S' ∩ W ≠ ∅`, `W = {2, a_j}`. Sets avoiding `W` have at most `2 + k` elements, so every `S` at level `k+3` meets `W`.
- **(3) Symmetric chains.** The face poset of the independence complex of a disjoint union is the product of the factors' face posets, and a cover is the deletion of one vertex.
  - `K_1` (vertex `v`): the single chain `∅ < {v}`, centre `1/2`.
  - `P_3` path `x–y–z` (faces `∅, x, y, z, xz`): the chains `∅ < {x} < {x,z}`, `{y}`, `{z}`, each saturated and centred at rank 1.
  - A product of two saturated chains `[0..m] × [0..n]` is partitioned by `L_i = {(s, i) : 0 ≤ s ≤ m−i} ∪ {(m−i, t) : i < t ≤ n}`, `0 ≤ i ≤ min(m, n)`. The point `(s, t)` lies in `L_t` if `t ≤ m−s` and in `L_{m−s}` otherwise; each `L_i` is saturated and runs from rank `i` to rank `m+n−i`. (This is the de Bruijn–Tengbergen–Kruyswijk decomposition, written out, so nothing is imported.)
  - Iterating over the factors gives a partition of the product into saturated chains, each symmetric about the sum of the factor centres: `k + 1/2` for `K_1 ⊔ k·P_3` and `k + 1` for `(k+1)·P_3`.
- **(4) Down-maps.** Let `φ` send an element to its predecessor in its chain.
  - For `c_i`, `3` and `4`: level `k+2` is above the centre `k + 1/2`. A chain through level `k+2` bottoms out at rank `≤ 2k+1 − (k+2) = k−1`, so `φ` is defined on all of level `k+2`, lands in level `k+1`, is a single deletion, and is injective (chains are disjoint).
  - For `1`: level `k+3` is above the centre `k+1`, so the same holds. Choose the cherry chains `∅ < {3} < {3,4}`, `{2}`, `{4}` and the arm chains `∅ < {a} < {a,c}`, `{b}`, `{c}`. A level-`(k+2)` set avoiding `W` is `{3,4} ∪ (one of b_j, c_j per arm)`. Each of its coordinates is the top of its factor chain, so it is the maximum of its box, hence the top of its chain, hence never a `φ`-image. So `φ` maps level `k+3` into `W`-meeting sets.
  - Composing with the fixed parts of (2) gives the injections `φ_τ` that (1) needs. ∎

*Evidence beyond the proof (bounded).* `scd_flow.py` builds exactly these chains and the flow `f` of step (1), and verifies it **literally** at `k = 1..8` (`scd_flow_out.json`, `scd_flow_k8_out.json`). At `k = 8`: 355,890 sources, 1,448,816 units sent, every unit on a deletion arc, the routed tag still active in every image, every source sending exactly `w_F(B)`, and **0 capacity violations**. Independently, `pertag.py` finds maximum matchings saturating every per-tag family for `k = 1..7` (`pertag_out.jsonl`), consistent with step (1).

*Scope remarks.*
- (i) Each per-tag injection forces `q_τ(p) ≤ q_τ(p−1)`, so the method can only work where every per-leaf summand is `≤ 0`. That holds on `G_k` at `k+3`: every summand is negative on F2's rows `k = 1..40`, and CT-1 itself implies it for every `k`. It is not a route to (HALL) on trees with a positive leaf term, which is the lower region's generic difficulty.
- (ii) Switch arcs are never needed on this family, uniformly in `k`.
- (iii) The theorem holds for every `F ⊆ leaves`, so it does not depend on deriving `F_p`, although `F_p` = all leaves on every row I computed.

**Bounded companion finding (critic-derived, `bounded_computation`).** I computed the exact Hall margin `ρ_k = min_X w(N(X))/w(X)` on the quotient by Dinkelbach iteration with my max-flow (`margin.py`, `sector_rho.py`, `sector_rho_out.json`).
- Under (D), for every `k = 3..25`: `ρ_k = W(k+3)/W(k+4)` exactly, with `W(j) = C(2k+2, j−1) − C(k+2, j−1) + (k+2)·C(2k+1, j−2)`. The minimizer is exactly the positive-weight part of `C(L, p+1)`, where `L = {1, 3, 4, a_i, c_i}` is the unique maximum independent set (`|L| = 2k+3 = α`).
  - `ρ_3 = 230/133`, `ρ_4 = 965/624`. `k(ρ_k − 1)` decreases from 2.188 (`k = 3`) to 2.064 (`k = 25`).
  - The closed form for this family's ratio is elementary counting. That it is the minimizer is bounded, `k ≤ 25`.
- Under (D)∪(S) (`k = 3..12`): the minimizer is the whole reachable layer, with ratio just below the whole-layer `capacity/supply`.
- So the binding family is the maximum-independent-set sector, the `G_k` analogue of the `CB` root-plus-arm sector, and the margin shrinks like `1 + ~2/k`.

## Attacks and findings

- **A1 — WID fidelity (protocol duty 2).** No shipped F2 network code asserts `supply − capacity = S`. `orbit_types.py` never computes `S`; `brute_validate.py` compares literal and quotient supplies with each other, not with `S`; `conjecture_search.py` reports `S`, supply and capacity without comparing them. The rule is binding ("every instrument asserts this equality on every instance before reporting anything else"). The numbers survive, because I checked all 86 orbit rows against my literal `S` (§ Re-derivation, item 5). But the failure is real in `conjecture_search.py`: on 265 of the 1,509 rows there is no positive-weight source, `literal_hall` returns `(True, 0, 0)` early, and the row carries capacity 0 with `S ≠ 0`. These values are not written to the shipped JSON, which stores only counts, so no false number reached the return. The 265 rows are vacuous: nothing needs routing. **Verdict on A1: a fidelity-process defect with no numeric consequence in the return's tables.**
- **A2 — `F_p` and eligibility derivation for the orbit rows `k = 41..60`.** `gk_direct_check.py` derives `F_p` and eligibility for `k = 1..40` only. `orbit_types.py` hard-codes the all-leaves weight formula for every `k`, so rows 41..60 of the deletion-only table rest on an underived `F`. "F_p must be derived" is binding. **Repaired by the critic:** my `quotient.py` derives `F_p` (= all leaves) and eligibility (true) at `k = 41..55`, and my item-5 check derives `F_p` and `S` literally at every `k = 3..60`. Theorem CT-1 also makes the question moot, since the flow exists for every `F ⊆ leaves`.
- **A3 — the (C3-LA1) reduction.** Correct use at its exact scope: full `Aut(G_k)`, orbit totals, existential arcs, `F = F_p` (A2 aside). F2 did not need (LIFT) or the equitable-lift key. Its transitions are right (A-check, item 4). One gap: `brute_validate.py`'s docstring promises "(ii) type constant on genuine `Aut(G_k)`-images … applied explicitly to a handful of sample sets", and no such code exists. The return's own list does not repeat the claim, but the docstring is unbacked (struck; § Certification audit).
- **A4 — "saturates" is a value certificate, not an arc-by-arc one.** F2's "Hall holds" is `max_flow == total_supply` from Dinic, and its literal and quotient comparison checks supplies, capacities and verdicts but not the flow values themselves (those are equal only because both sides saturate). That is acceptable as a max-flow/min-cut conclusion but weaker than a certificate. My instrument supplies the independent arc-by-arc certificates (item 3), and Theorem CT-1 supplies an explicit flow.
- **A5 — the negative finding (§4), reproduced and re-diagnosed.** My own implementation of the rule (`witness_rule.py`, `witness_rule_out.txt`) gives **13** violating targets at `k = 3`, each receiving 3 units against capacity 2, as F2 reports, and 121 at `k = 4`.
  - The composition of the violating inflow shows the defect is broader than "concentration of AC-upgrades". Every violating target receives units for tags that are **not active in it**. Deleting `4` to discharge leaf `3` deactivates `3` when `0 ∉ A`. "Delete `c_i`" deletes the tag itself: the rule's description says "never the tag itself" and then does exactly that for AC arms. Deleting the lone `a_i` deactivates leaf `1`. Those units consume capacity owned by other tags.
  - The failure proves that this rule fails. It does not prove that no local rule works. **The return's sentence "exactly the kind of load-balancing an algorithmic max-flow computes but a single local, context-free rule cannot" is false**: Theorem CT-1's flow is deterministic and tag-local, with each `(B, τ)` sent to its predecessor in one chain decomposition. The rule that works is the one that keeps each tag's unit on a target where the same tag stays active.
- **A6 — the conjecture search (§5): generator, range, instrument.**
  - Generator: 26 hand-built spiders and `G_k` variants, plus 520 Prüfer trees (seed 20260927) at orders 6–18.
  - **Actual order range ≤ 17.** `scan_tree(max_n_for_full_scan=17)` returns no rows for larger trees. My audit (`audit_conjecture.py`, `audit_conjecture_out.json`) shows **49 of 546 trees contribute nothing**: all 40 random order-18 trees and the 9 hand-built trees of orders 18, 18, 20, 20, 21, 22, 23, 24 and 29.
  - `except Exception: continue` would swallow errors silently (0 occurred on replay).
  - Rank range: every `1 ≤ p ≤ α` with `F_p ≠ ∅` and `S ≤ 0`.
  - Single instrument (F2's Dinic, one code path). It is sampling, not a closed-form test, so obligation (b) as chartered ("closed-form adversarial test") was not delivered.
  - The conjecture correctly stays at `conjecture`.
  - **The 13 eligible rows are not identified in the artifact** (only counted). I identified them: `(n, p)` = (14, 6) ×8 [spider `3,3,3,3,1`, `G_3`, 6 random], (17, 9) [spider `1^10,3,3`], (17, 7) [`G_4`], (13, 6) [random], (16, 7) ×2 [random]. Each has `S < 0` and saturates under (D) alone. Twelve lie in the closed band `n ≤ 2p+2`. The only unresolved-band row is `G_4/7`, a `G_k` repeat. Two rows (`G_3/6`, `G_4/7`) are repeats. They are saturation instances of record at `bounded_computation` (single instrument), not new evidence in the open band.
- **A7 — quantifiers, direction, circularity.** The return's central claim quantifies over every `X` through the max-flow equivalence, which is correct. Nothing assumes `S ≤ 0`, and there is no ℕ-subtraction issue (eligibility is tested as `x + 2 ≤ p` and `3p < 2α + 1`). The table's "capacity strictly larger throughout — no tested row is even close to tight" conflates `capacity/supply` with the Hall margin. The true margin is `ρ_k ≈ 1 + 2.06/k` (e.g. `ρ_25 ≈ 1.0826`, against whole-layer `capacity/supply ≈ 1.1056`, from my rows). **Struck as unbacked.**
- **A8 — misattribution.** The return cites the `G_k` fixed points `253/527/−274, …, 269507/380552/−111045` as "already on record in `SEMANTIC-CONTRACT.md` §1.2". That section contains no `G_k` row (I read it in full). **The attribution is struck.** The numbers themselves are right: I reproduced them literally.
- **A9 — process.** One `pkill -f` pattern kill (prohibited: literal PID only), disclosed. `ps aux | grep '[o]rbit_types'` twice: `ps aux` is a full process listing even when filtered, which the kill rule forbids; this is not disclosed as such. No evidence contamination is claimed or found; noted for the adjudicator.

## Mechanism-equivalence and fence check

- **F2's route** proposes no mechanism. It checks (HALL-COND) by max-flow, which is not one of the ten refuted keys. The witness-deletion rule is a failed candidate, correctly reported, not a revival. There is no RTree wording, no census value in a proof, and no reading of a live root. The controller prior is not used as evidence, apart from the misattributed consistency check (A8). GK-SIGN is re-confirmed, not re-proved as a contribution, which is correct. `k = 3` (`n = 14`) sits in the closed band; `k ≥ 4` is in the unresolved band.
- **Theorem CT-1 against the fences.**
  - Its method is a per-tag injection. That makes it adjacent to `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` (REFUTED) and to the predecessor's own-support unit-capacity rule (C6-F4). It is not a revival. It makes no universal claim: it is proved on one named family where every per-leaf term is negative. Its conclusion is a charter (HALL) flow with the literal `w_F` and (D) ⊆ (REL). The per-tag structure is used as a sufficient construction, and scope remark (i) records why it cannot extend to trees with a positive leaf term.
  - I could not read the registered text of the refuted key or of C6-F4, because the registry is not in my capsule. **The synthesis must alias-check CT-1 against both, mathematically and lexically, before registration.**
  - It does not use (LIFT), the equitable lift or `D, C ≥ 0`, and it re-proves no closed region: the aggregate on `G_k` is GK-SIGN's, and CT-1 is about (HALL), not `S`.
- **Registered keys touched.**
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN. CT-1 is a restricted-scope result and would be a separate key plus a scope note.
  - The primary aggregate: untouched.
  - GK-SIGN `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE`: re-confirmed numerically (both F2 and I), not re-proved.
  - `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`: CT-1 uses its eligibility clause.
  - C3-LA1 `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`: F2 uses it correctly; CT-1 does not need it.
- **Candidate key for CT-1** (a predicate, ruling 33): `E993-R30-GK-TREE-RANK-K-PLUS-3-DELETION-ARC-SATURATING-FLOW-FOR-EVERY-LEAF-TAG-SET`. It is true as named: at `p = k+3` on `G_k`, for every leaf tag set, a deletion-arc saturating flow exists. The (HALL) scope note would read "(HALL) holds at `(G_k, k+3)`, `k ≥ 3`". Lexically it is not a substring of, or a minor variant of, GK-SIGN or the `G_k` family key. Mathematically it differs from both: those are the aggregate sign and whole-layer (HALL-COND) plus eligibility, while CT-1 is a flow for every `X`. **The alias check against the full registry is the synthesis's job; I did not read the registry.** Alias-field hygiene per ruling 35: none proposed.
- **Plateau test (gate ruling 30), one line:** the RETURN supplies none of items (a)–(d) (its `G_k` result is finite in `k`; `G_k` is not switch-necessary; no cut; no Lean); this CRITIQUE supplies a candidate for item **(a)** (Theorem CT-1, a parameter-uniform restricted-scope (HALL) theorem on the infinite eligible family `{(G_k, k+3) : k ≥ 3}`, critic-derived, STATED, `proved_informal` only after its isolated second read).

## Certification audit

| Return literal | Status |
|---|---|
| Artifact SHA-256 table (11 files) | **Backed.** All match. `gk_direct_check`, `brute_validate`, `explicit_rule`, `orbit_types` (193 s) and `conjecture_search` (5.4 s) replayed from my copy with `python3 -B`, and each output is **byte-identical** to the shipped one. |
| Dispatch hash `4587844b…`, Stage 2 seal `f0b5a2a1…` | Stage 2 seal recomputed, **backed**. The dispatch hash is **backed** by the Stage 3 manifest entry (I did not reopen the Stage 3 dispatch). |
| GK-SIGN two instruments agree, `k = 1..40`; `F_p` = all leaves where eligible; every per-leaf summand negative | **Backed** (replay). My instrument agrees on `S`, `F_p`, `x`, `α` and eligibility for `k = 1..40` and beyond. |
| Frozen fixed points "on record in `SEMANTIC-CONTRACT.md` §1.2" | **Struck** (false attribution, A8). The values are correct. |
| Validation `k = 1..7`: 0 weight mismatches, 0 missing or extra type pairs both ways, literal and quotient agree on supply, capacity, **max-flow value** and verdict | **Backed**, except "max-flow value", which is compared only implicitly (both saturate). Narrowed to "supply, capacity and verdict". "Up to 68,600 sources and 121,336 targets at `k = 7`": 68,600 **backed** (my literal count and the SCD run). |
| `brute_validate.py` docstring (ii), the explicit `Aut`-image sample check | **Struck.** Not implemented. |
| Deletion-only Hall `k = 3..60` (58), (D)∪(S) `k = 3..30` (28), exact | **Backed** as `bounded_computation`: replay, independent certificates to `k = 40` in both modes and 41..55 in (D), all 86 rows WID-consistent. `F_p` for 41..60 is **unbacked in F2's code** (A2) and critic-repaired. **Superseded** in kind by Theorem CT-1 (all `k`). |
| "switch arcs were never needed" | **Backed.** Proved for all `k` by CT-1. |
| "7.5x extension"; types grow about cubically | **Backed** (60/8; my positive source-type counts 18,010 at `k = 30` and 42,680 at `k = 40`, ratio 2.37 ≈ (4/3)³). |
| "no tested row is even close to tight" | **Struck** (A7). |
| Witness rule fails at every `k = 3..7`, 13 violations at `k = 3` of 3 against 2 | **Backed** (replay and own re-implementation). |
| "a single local, context-free rule cannot" | **Struck.** Refuted by CT-1 (A5). |
| §5: "orders up to 29", "40 trees at each order `n = 6..18`", "546 trees … at every rank" | **Struck.** The effective order range is ≤ 17, and 49 trees are skipped (A6). |
| §5: 1,509 rows, 0 violations, 13 eligible, all `S < 0`, all saturating | **Backed** on replay, with narrowing: 265 rows are vacuous (zero supply, misreported capacity 0); the 13 eligible rows are not identified in the artifact (identified here); 12 are in the closed band. |
| "`orbit_types.py` and `conjecture_search.py` take a few minutes each" | Partly: 193 s and 5.4 s. Harmless. |
| Route verdict `bounded_evidence`; `headline_resolved: no` | **Backed** for the return as filed. |

## Verdict

verdict: retained_narrowed
headline_resolved: no

The return's central bounded computation is **retained**. It replays byte-identically, is re-derived exactly by an independent instrument (own types, literal arcs, own max-flow, arc-by-arc certificates, WID asserted against a literal `S`), and it strengthens in kind over the whole-layer Cycle 2/3 rows, at `bounded_computation`. It is **narrowed**:
- Strike the misattribution (A8), "not close to tight" (A7), "no local rule can" (A5), the §5 order-range literals (A6), and the docstring (ii) check (A3).
- Record the missing WID assertion (A1) and the underived `F_p` for `k = 41..60` (A2), both critic-repaired with no change to any number.
- The adversarial search is single-instrument sampling over orders ≤ 17, not a closed-form test.

**Theorem CT-1 (critic-derived, `C-F2-T`)** proves what the return left open. My judgment is that its mathematics is complete at `proved_informal` strength: self-contained, with the chain decomposition written out, and the explicit flow verified literally at `k = 1..8`. Under `SOLUTION-CONTRACT.md` §4 it is STATED until an isolated second read confirms it. It is a candidate for plateau item (a).

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

- **The return's `## Remaining obligation` is accurate for its own evidence, with these changes:**
  - Item 1(i), a closed-form proof for `G_k`, is now supplied by the critic, pending second read. Item 1(ii) and item 2 (push `k`; (D)∪(S) beyond 30) are moot for `G_k`.
  - Item 3 (`T(m,2)` premises by a local-limit bound at `λ₊`) stands, **unattempted**.
  - Item 4 stands. Its diagnosis should read "tag-deactivating deletions", not "load balancing" (A5).
  - Item 5 stands, and should add that the shipped search never reached order 18.
- **Exact obligations after this critique:**
  - (a) An isolated second read of Theorem CT-1: steps (0)–(4), especially the level and centre arithmetic, the box-maximum argument for tag `1`, and the claim that `F ⊆ leaves` is arbitrary.
  - (b) A registry alias check of the candidate key against `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`, the C6-F4 own-support rule, GK-SIGN and the `G_k` family key. Registration as a SEPARATE restricted-scope key with a scope note on (HALL). This is a natural Lean target: a per-tag injection lemma plus an explicit chain decomposition, with no enumeration.
  - (c) The synthesis's plateau ruling on item (a).
  - (d) Successor lemma template: the per-tag symmetric-chain method applies to any tree and rank where every tag's active family is a product of symmetric chain orders above its centre, with the tag's witness-avoiding sets at chain tops. It necessarily fails where a per-leaf term is positive or where switch arcs are needed (the `CB` first ranks). The `CB` coupled families remain T1's and U2's object.
  - (e) The conjecture "on trees, `S ≤ 0` ⇒ saturation" remains at `conjecture`. A decisive test must be exhaustive over a stated order range, with a second instrument.

## Artifact inventory

Scratch root `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-F2-T/`. All code is standard library, run with `python3 -B`. Digests are recorded in `MANIFEST.json` in that directory, and the table below is generated from it.

| File (relative to scratch root) | SHA-256 |
|---|---|
| `own/argmin.py` | `e872cb7db4bb629802a99107dc127e072cda059a1331fede031320d0d74bd51d` |
| `own/audit_conjecture.py` | `206b715ccecb024c381909d1f83fc00d525655c2680a2b5531b8fbc3683f0ecc` |
| `own/audit_conjecture_out.json` | `de61d67d7fcadede05f3a2d5aca79e4b3058eae742fad16b8256ca36e0121106` |
| `own/cmp_types.py` | `a559fbbd30660ab75a58a26b52063e13c2932ee7224b334cc563dceb0afbdb84` |
| `own/cmp_types_out.json` | `28216e3b25b59649aff4ae454e90c123b2c35fc6155eeb872cc1e0c9acb8c977` |
| `own/core.py` | `36f5c25034f490300333a43b37e38b9c07b78359fa79e6a0753ba4b8044beab1` |
| `own/literal.py` | `6477e05a76e4fcde76ce3e3832c270b13ad5c5d3d765b4afdc511ad2c9ae9aa7` |
| `own/literal_k8_out.json` | `56efbcaad764b3f9091866652dbc27ba174a265dc7da415e7f5b84fd7ea4ceef` |
| `own/literal_out.json` | `5ffb2541134cb44a556c64401b8ad1279f4ccc83aa0db4b6b78ca6b361381d3e` |
| `own/margin.py` | `e951dbb8353bfad8ec1340d81001aa99309de135e15425ccc5d5844da6e046ac` |
| `own/margin_DS_out.jsonl` | `4f48a568641ef6f855bdb3de0d388579dd2d849e1fc3e42a7d250d26598b4fe5` |
| `own/margin_D_out.jsonl` | `8ebf350084e9b3f0f9613198ac5a79cd504dd3b2efc8ed62431d5f83e4697964` |
| `own/pertag.py` | `d66b8f8e5f1818063906d95c783423be4ecb2b31168281e3d27037f0013afcf4` |
| `own/pertag_out.jsonl` | `c6183baeab58d175152b8268299114b53bae0d5386714511a33512879671fbd1` |
| `own/q41_60_D.log` | `93e65a0768b3388125b9fa64758296f86a054d8959a4da3896431cb291dec986` |
| `own/quotient.py` | `4d207a5213834abdd77e4a2b3c094004ce196a4a608cfdf65550dc06d46d61c0` |
| `own/quotient_13_40_DS.json` | `acbe40c6b38ca72c4d97d14925fdba71615a102c633e32364221a603dc2a2c98` |
| `own/quotient_1_12_DS.json` | `27f7a3ad9010e037ac9952c31a7e9932e30401b31f9ed142dfc720888b900089` |
| `own/rules.py` | `d557bb2dd39e50f37521d2865b245e9d953d2a94d95fb64bd7bb5a0df6b72fcb` |
| `own/scd_flow.py` | `d370a850443b4c018773df45fab922c7dcaa2c18a0b405d25b7c6c4b044175b6` |
| `own/scd_flow_k8_out.json` | `efe623bbf41b17ce3e437d865db20eb9d0551da9282988555e7045f84fedeb19` |
| `own/scd_flow_out.json` | `c3dd1cb57f7692f62871bd8e61b364ac79d79554ccc6e0282ef12539ebd2b8df` |
| `own/sector_rho.py` | `86bfcc922b2b0773a4ad2ccc899a82349dc4156897900bfbbb90f00c342264b4` |
| `own/sector_rho_out.json` | `e591e5863e6bfed8a97af4a76e838ef90f99166601ceb474bf86368aefd0bcec` |
| `own/witness_rule.py` | `d9be21096f6ca88e6cd3724ec9c0e9245272d738c7afaccd799d4b57dae29186` |
| `own/witness_rule_out.txt` | `c30c8e76fc34df867b507d8c6e724c761d9eee2f3c17ceeadd39ee6805349ef8` |
| `replay/MANIFEST.json` | `db6f7339a06a3459d941171a6559da36cf5a23e3eb5c858b422b62eba761a199` |
| `replay/brute_validate.py` | `10b4ef3d0f5fb619c9c87b8d31aeb2cd10dbad0b496e52fc780e1e1638e0db68` |
| `replay/brute_validate_out.json` | `c2ff2a75e19173d4a44c694e386e9953308eedd1c26bba2e6ea27f99817b0500` |
| `replay/conjecture_search.py` | `4c5d397879d22a4016771e0be968750ab1945a64c20f5fa369bf2e6c7d276ccf` |
| `replay/conjecture_search_out.json` | `e6b5c31238c7f23deec24ed9000f0eb02c8d1a1dc115d351c302f7b421e4beb1` |
| `replay/explicit_rule.py` | `7239893e2f7072e0d58d5846b39175d4e9a45062d53f125065dec8aa8017d7dc` |
| `replay/explicit_rule_out.json` | `ac6e275fe679b0d13d9ed2b0547b5b89b99836abc454755f662cba2d07764a23` |
| `replay/gk_direct_check.py` | `3540de8b09d46c77d9d0c1fe59d3f414d272e378f8262fbb7d398d3178289576` |
| `replay/gk_direct_check_out.json` | `51af99ae46af58146cd515c8d91224766cc5c22d351340cf6ee03573c5bef649` |
| `replay/make_manifest.py` | `3de45d8ec9d59b266dfafa128ea71592fcfe6cbee3c25915909dd147db08cdf8` |
| `replay/model.py` | `63385069cee40356d53e1d08528f404915f6ff70cf03148b6519a3154488379a` |
| `replay/orbit_types.py` | `af1a02648dbb984f94b063430c14fd6b9890f4ac8f4044b355d8f1d6aef62d67` |
| `replay/orbit_types_out.json` | `320536ac554397c8b0fc0821a4390b026534fa1586e4fb75563ad91ebdbdec3a` |
| `replay/orig/brute_validate_out.json` | `c2ff2a75e19173d4a44c694e386e9953308eedd1c26bba2e6ea27f99817b0500` |
| `replay/orig/conjecture_search_out.json` | `e6b5c31238c7f23deec24ed9000f0eb02c8d1a1dc115d351c302f7b421e4beb1` |
| `replay/orig/explicit_rule_out.json` | `ac6e275fe679b0d13d9ed2b0547b5b89b99836abc454755f662cba2d07764a23` |
| `replay/orig/gk_direct_check_out.json` | `51af99ae46af58146cd515c8d91224766cc5c22d351340cf6ee03573c5bef649` |
| `replay/orig/orbit_types_out.json` | `320536ac554397c8b0fc0821a4390b026534fa1586e4fb75563ad91ebdbdec3a` |

`replay/` holds F2's 11 inventoried files plus `make_manifest.py` and `MANIFEST.json`, copied out first. Their regenerated outputs are byte-identical to `replay/orig/` (the shipped copies). `CRITIQUE.draft.md` is my working draft of this file. No `__pycache__` was created (`python3 -B` throughout).
