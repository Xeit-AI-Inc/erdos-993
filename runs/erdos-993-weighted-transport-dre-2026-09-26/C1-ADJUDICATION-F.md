# Orientation Adjudication

Adjudicator of orientation F (falsify), Cycle 1 Stage 5, run r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`),
2026-09-26. Portfolio: returns `F1` (`C1-F-01 ADVERSARIAL-CUT-SEARCH`) and `F2` (`C1-F-02 FIDELITY-AND-MECHANISM-EQUIVALENCE`) and
their four cross-orientation critiques `C-F1-T`, `C-F1-U`, `C-F2-T`, `C-F2-U`.

**Boot acknowledgment.** Operating within VerityOS. Boot read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`; no other VerityOS file was opened. The harness placed the root
`CLAUDE.md` and a user auto-memory index into context automatically; nothing from them is used as evidence.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Capsule seal.** I recomputed the SHA-256 of `control/c1-adjudicator-capsules/F-PACKET-MANIFEST.json`. I removed `seal_sha256`,
  serialized with `sort_keys` and separators `(",", ":")`, and added no trailing newline. The result is
  **`bd7e09ee26bed9e24c5bff4761652f2d7a72ba5e5723778664d108db89016e6c`**, equal to the dispatch value. All 20 listed members match
  their `(bytes, sha256)`.
- **Packet seals, recomputed the same way.**
  - Stage 2 `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92`: matches.
  - Stage 3 `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac`: matches.
  - Stage 4 `94bd9f138c1bd3290bdeda9ab4edb2b4e95f704756f3ef21a300d910a83017bf`: matches.
  - The two returns and four critiques match their entries in the Stage 3 and Stage 4 manifests.
- **Admission.** The Stage 3 admission lists F1 and F2 as admitted with `headline_resolved: no` and no exceptions for either seat.
  The Stage 4 admission lists all four F-portfolio critiques as `retained_narrowed` with `headline_resolved: no`.
- **Scratch digests** (copy-out-first into `scratchpad/c1-adj-F/copy-F1/` and `copy-F2/`):
  - F1: `census_13_13.json` `7059b144…`, `census_14_14.json` `03ee099d…`, `census_15_18.json` `1c5ae3b0…` and
    `adversarial_results.json` `c72af73e…` all match the return.
  - F2: the byte digest of `F2-EVIDENCE.json` is `c5f86658…`. The return's `3c6226b1…` is the digest of the canonical
    serialization, not of the file bytes; both critics independently reproduced it by replay. The label is corrected per
    C-F2-U F-7.
- **Seat disclosures weighed** (`C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json`; controller facts CF-F-2 and CF-F-4):
  - F1: three full `ps aux` listings, a breach of the PID-only rule; unread brief files; four killed jobs with no evidence used.
  - F2: two non-recursive listings above the grant; one `__pycache__` written under `sources/` and deleted.
    The controller's re-digest (981/981) and both F2 critics' re-digests confirm that `sources/` is intact.
  - No reported number depends on any of these. They are recorded as seat deviations, not as defects in the mathematics.
- **Critic disclosures weighed.**
  - C-F1-T read the startup protocol after its computations (boot-ordering slip).
  - C-F2-T's `awk` printed about five lines of the T2 attack-brief section; the critic says it used none of them.
  - C-F1-U read the preamble of the attack brief.
  - None of these touches a number I rely on.
- **Controller facts** (`C1-STAGE5-CONTROLLER-FACTS-F.json`) are weighed as one more replay. CF-0's replay record
  `control/controller-facts/CF-REPLAY-c1.json` is not a capsule member, and I did not read it.
- **My own read-boundary statement.**
  - I read only capsule members, the scratch of F1, F2 and their four critics (listed non-recursively; F1/F2 files copied out),
    and frozen files under `sources/`:
    - `sources/authority/CLAIM-IDENTITY.json`, parsed for one key;
    - `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean` (digest `8d864da2…`, matching SEMANTIC-CONTRACT),
      entries 1–18 and 42.
  - Searches (`grep`) ran only inside `sources/…/LeanProject/` and my own copies.
  - No network, no installs, no Lean invocation.
  - One background job, PID 84795 (my census), was verified finished before the final write (see Artifact inventory).

## Route-by-route decisions

### F1 — `C1-F-01 ADVERSARIAL-CUT-SEARCH`: retained, narrowed (`bounded_evidence`)

**Fidelity: passes.** Both critics read F1's code line by line. I re-read the two load-bearing functions on my copy:
- `active_weight` tests `(B ∖ {v}) ∩ W_v ≠ ∅`. This is the correct test under erratum R30-E-b (CF-1b), not `|F ∩ B|`.
- `switch_targets` requires `u ∉ B` and `popcount(N(u) ∩ B) = 2`, then forms `(B ∖ N(u)) ∪ {u}`.

`F` is fixed at rank `p` on the original tree, `x` is scanned through `α`, and (WID) is asserted per row against an
independently computed `S`. No number is struck on fidelity grounds.

**Claim-by-claim rulings.** Both critics agree on every item unless noted. "Replay" marks my own check.

| F1 literal | ruling |
|---|---|
| Three fixed points reproduced (1980/3960/−1980; 1483/2701/−1218, 2025 arcs; 8033/13467/−5434, 11691 arcs) | **Backed.** Both critics, plus my own instrument (replay). |
| Free-tree counts match A000055 to order 18 | **Backed.** Critics' replay; my generator matches to order 18 (replay). |
| "Exhaustive to order 18" | **Struck; narrowed** to the 3,296 open-band (`n > 2p + 2`) rows at orders 15, 17 and 18. `census.py` skips every closed-band row, citing the order-band theorems. Those theorems close the aggregate sign, not flow existence (both critics; CF-3). My copy of F1's files gives 0 open rows at orders 13–14 and 47,351 closed-band rows skipped at orders 15–18 (replay). |
| "All 3,296 open rows saturate; (WID) never failed" | **Backed.** Both critics reconciled the multiset exactly with their own instruments. |
| Cumulative eligible counts 515/1043/3806 "digit for digit" from F1's own instrument | **Struck as F1 evidence.** F1's files start at order 13 and give 476/1004/3767. The values themselves are true: both critics and my census give 5 + 34 + 163 + 313 = 515, then 1043 and 3806 (replay). **Correction to controller fact CF-F-1:** its phrase "F1's independently derived cumulative … counts … match" is not supported by F1's shipped files. CF-4 already records the critics' finding, and my replay confirms it. |
| Orders 11–12 | **Never examined by F1.** F1 followed the contract's pre-erratum minimum (R30-E-a). My census: 5 eligible rows at order 11 and 34 at order 12, all saturating (replay). |
| `CB(1,7)` at `p = 10` (8673/22197/124593 arcs, 29190/58002, `S = −28812`, saturating) | **Struck as cited:** F1's `adversarial_results.json` records `"skipped": "too many sources"` (replay of the JSON). **Re-backed:** reproduced by C-F1-T (brute force and quotient), by C-F1-U (brute force and quotient), by the controller's CF-2, and by my instrument (replay: 124,593 arcs, 29,190 of them switch-only; deletion-only flow 29,190). |
| "`CB(2,7)` did not finish an 8 s test"; "`CB(5,7)` killed after 300 s" | **Struck.** The shipped run pre-filtered by size. C-F1-T also shows that the shipped `adversarial.py` (12:53) is not the script that produced the shipped JSON (12:43). The adversarial section is self-report checked for internal consistency only, and cannot be replayed from shipped code. |
| Smallest eligible double broom `(1,11)`, `n = 14` | **Struck.** F1's own JSON has eligible, saturating `(3,6)` and `(4,5)` at `n = 11`, `p = 6` (replay of the JSON). |
| "Caterpillars with pendant pairs" | **Relabelled.** The code attaches pendant *leaves* (replay of `adversarial.py` lines 62–71). The pendant-pair feature is untested by F1. C-F1-U found this; C-F1-T is silent, so the two critics do not conflict. |
| Test counts 153/12/35 "run" | **Corrected** to 87/9/10 run (and 10 caterpillar tests cover 8 configurations). The rest were skipped a priori, not timed out. |
| (WID) "on tens of thousands of instances" | **Struck.** F1 checked about 3,400. |
| Alias check "no collision with the run-local registry" | **Unbacked**, because F1 did not read the file. Harmless, since F1 registers nothing. |
| Grade `bounded_computation`; no cut; `headline_resolved: no` | **Backed.** |

**Allocation item 3(a) (deletion-only census) was not delivered by F1.** Both critics delivered it, and my census replays it
(see Established results).

### F2 — `C1-F-02 FIDELITY-AND-MECHANISM-EQUIVALENCE`: retained, narrowed (`bounded_evidence`, with `proved_informal` lemmas)

**Fidelity: passes.** `active_weight` is `(Bs − {v}) & tag_witnesses` with `W_v = N(s_v) ∖ {v}`. `relation_neighbors`
implements (D) ∪ (S) literally. I read both on my copy. The arc counts 2025 and 11691 are reproduced by both critics and by me.

**Claim-by-claim rulings.**

| F2 item | ruling |
|---|---|
| §A (WID), general `F` and the `F = F_p` form | **Proof verified** at full statement scope (my re-derivation below; concurred by both critics). Only "every `v ∈ F` has degree one" is used; `IsTree` is never used. Grade `proved_informal` (candidate; a governed award is Stage 7's). |
| §A (FLOW⇒SIGN) | **Verified**, `proved_informal`. |
| §A (HALL⇒FLOW) | **Verified**, `proved_informal`, once C-F2-U's missing sentence is added: a Hall violator on a partial clone set stays a violator when completed to whole clone classes, since completion keeps its neighbourhood and increases its size. Zero-weight targets contribute no clones. C-F2-T states the same argument in forward form. The two critics agree. |
| §B1: literal presence measures `Σ_v Δ_{p−1}(H_v)`, omitting exactly `Σ_v Δ_{p−1}(R_v)` | **Verified**, `proved_informal`. Both critics note that the allocation's suggested form `Σ_v Δ_{p−1}(T − v)` is false (−1715 against −1406 on path-star (2,3,4)). F2 silently corrected the prompt. |
| §B2: C6-F5 error localized (the original audit computed `S` correctly but used `w′ = |F ∩ B|` and never asserted supply − capacity = S) | **Backed.** The eight numbers were reproduced by both critics; C-F2-T located line 81 of the frozen `direct_audit.py`. CF-F-3 agrees. |
| §B3: 492/491 against the struck 493/491; shortfall `|R_490|/491` | **Backed** by exact fractions (both critics). My brute check of the sector sums on three small CB is below. |
| §C1 reachability lemma: `A` has no in-arc of (D) ∪ (S) iff `A` is maximal and no `u ∈ A` has two private neighbours | **Verified**, `proved_informal`. It holds on every triangle-free graph; on general graphs read "two non-adjacent private neighbours". The critics agree on this (C-F2-T states the general form; C-F2-U states triangle-free). Both checked it against brute force on every target of 3,806 eligible rows. |
| §C2 "open" | **Superseded:** answered YES by both critics (Established results E4). F2's remaining-obligation sentence ("a 'no' would make (HALL) exactly equivalent on positive targets to `S ≤ 0`") is **struck**. (HALL-COND) quantifies over every `X`, and a "no" would only reduce the single instance `X = I_{p+1}` (both critics). |
| D-table categorical distinctions (D1–D13) | **Stand.** Mechanism ≠ mechanism is sound for all thirteen. |
| D5 "hypothesis (zero Retag export) … refuted" | **Struck (inverted):** the registry has `zero_export: true` and a positive arm gap. The hypothesis holds; the conclusion fails (both critics). |
| D6 and D7 same-witness "concentration" narratives | **Struck.** D6's registered witness is a singleton support block (`g_v = 212336130412243110 > 0`, `P_s > 0 = N_s`); the 33-tags-on-11-supports witness is C6-F4's (D13). D7's registered witness is a dimension count. Both critics agree. |
| D11 "high-tail witness" | **Struck (inverted):** the registry scope note says the witnesses *fail* `3p ≥ 2α + 1`, so they lie outside the high tail (both critics). |
| D8 | **Categorical distinction stands; completed by the critics and by me.** Details below. |
| D12 naming collision (r28's order-22 "T22" against this program's `T_22` of order 91) | **Backed** (both critics; CF-F-3). |
| §E1–E4 literal-hypothesis probes | **Narrowed:** non-eligible (`K_{1,4}` at `p = 4` is in the high tail; the 6-vertex tree is below the window). They are semantic demonstrations, not statements about (HALL). §E2 does not realize "support of degree 2". Eligible replacements come from C-F2-U (`eligible_E.json`) and C-F2-T (`CB(1,7)`'s `c`, and `G_k`'s `c_i`). |
| §E5 top-of-window rank (`K_{1,12}`, `p = 8 = ⌊2α/3⌋`, margin 1) | **Backed.** |
| `T_22` scalar side (`n = 91`, `α = 68`, `x = 32`, `|F| = 67`, `S = −498754180547001418536`, `i_34`, `i_35`, summands) | **Backed** (both critics). The orbit-flow triple stays cited from C6-T5 (`bounded_computation`/LIFT); it was not re-derived. |

**D8 in detail.** Both critics read the registered statement literally, and each found it failing already at order 11.
- **Counts.** C-F2-T reports 4/5, 33/34, 161/163 and 310/313 rows at orders 11–14. C-F2-U reports 4/5 and 310/313.
- **My replay** (`adj_d8.py`) is a third instrument on orders 11–13. It gives 4/5, 33/34 and 161/163 exactly. It reproduces
  both critics' example inequalities: 134460 > 133644 on the (3,6) double broom, and 120960 > 120694 on the order-11 spider
  `0–{2..7}`, `0–1–8–{9,10}`.
- **The "discrepancy" is resolved without any registry correction.** The frozen registry entry of
  `E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION` states `"witness_minimality": "Not asserted or tested"`.
  An order-11 failure is therefore consistent with the registered order-14 witness. The critics' request to "adjudicate
  the D8 discrepancy" is closed.
- On every row where D8 fails, (HALL) saturates (replay, orders 11–14). This is the same-object separation D8 lacked.

### Paired-critic disagreements, resolved claim by claim

1. **The `p ≥ 1` guard.**
   - *C-F2-T:* "`p ≥ 1` is only a guard. At `p = 0` both sides vanish".
   - *C-F2-U:* in the contract's Lean form, `hp : 1 ≤ p` is load-bearing (`K_{1,3}`: 0 against 6).
   - *Ruling: C-F2-U is correct for the Lean statement of record.* C-F2-T's sentence is true only of the prose `q`-form
     under ℕ subtraction, where `q_v(0) − q_v(0) = 0`.
   - *Why.* The Lean right side is `Σ_v [Δ_{p−1}(H_v) − Δ_{p−1}(R_v)]`. At `p = 0` it becomes
     `Σ_v [i_1(H_v) − i_1(R_v)] = Σ_v |W_v|`. The `q`-form and the Δ-form agree only for `p ≥ 1`.
   - *My replay* (`adj_fixed.py`, `K_{1,3}`, `F` = all leaves): left side 0; Lean Δ-form right side 6; `q`-form 0.
   - *Consequence.* The guard and its reason go on the (WID) award's face.
2. **Unreachable-target family.** The critics exhibit different families: C-F2-T's `G_k` and C-F2-U's `T(m,k)`.
   - *They do not conflict.* I verified that `G_3` and `T(4,2)` are non-isomorphic (canonical forms differ). Both are among
     the 11 order-14 rows.
   - *Both unreachability proofs are correct* (my re-derivation from the §C1 lemma).
   - *Both families' eligibility is bounded only:* `k ≤ 1500` and `m ≤ 60` respectively.
3. **Census extent.** C-F1-T (orders 11–19) and C-F1-U (orders 11–18) agree row-count for row-count at orders 11–18. Their
   extreme-`S` statements agree: the maximum is −192 over orders 11–18, attained at order ≤ 17, and C-F1-U's −864 is the order-18
   maximum. My census reproduces these (see E3).
4. **`CB` quotient coverage.** C-F1-T has 162 rows (`d ≤ 4`, `n ≤ 93`); C-F1-U has 211 rows (`n ≤ 114`). These are different
   grids with the same verdict (deletion-only saturation). No conflict.
5. **Sector criterion `3p < 2dm + 5` and its smallest instance.** Both critics state it. It is critic-derived, first stated at
   a review stage (STATED), and needs an isolated second read. Both name `CB(8,86)`, `p = 460`, `n = 1465`. My replay
   confirms it (see E5).

## Cross-route reconciliation

- **F1 × F2.** Both instruments pass fidelity and agree on the fixed points. F2's (WID) proof is exactly the identity F1 asserts
  per row, so each route's (WID) assertion is a check of a statement the other proves. F2's §C1 lemma explains a fact from F1's
  census, completed by the critics: on a row where every positive target is reachable, (HALL-COND) at `X = I_{p+1}` is
  equivalent to `S ≤ 0`.
- **The central cross-route finding of this orientation (critic-attributed, replayed by me): the census tests only
  active-weight deletion-only transport.**
  - On every eligible tree of order ≤ 18 (51,162 rows; both F1 critics and my census) and order 19 (144,521 rows; C-F1-T),
    and on every `CB(d, m)` quotient row computed (`n ≤ 114`), the deletion arcs alone saturate.
  - No tested instance needs a switch arc.
  - F1's "zero deficient cuts" and every critic census are therefore silent on the two-for-one half of (HALL).
- **Where switches become necessary.** In the `CB` family this first happens at `CB(8,86)`, `p = 460`. The root-plus-arm sector
  there is an exact deletion-only deficient cut.
  - Its switch exits carry about 6,129 times the deletion deficit (replay), so the sector itself is not a (HALL) cut.
  - This is the first place where the mixed relation's truth is actually exercised. The next-route allocation targets it.
- **Controller prior.** The controller's order-16 deletion-only saturation (CF-3) is consistent with all of the above: a fourth
  instrument, but a prior. **CF-F-1** is corrected as stated under F1. CF-1 (R30-E-a), CF-1b (R30-E-b), CF-2, CF-3, CF-F-2,
  CF-F-3 and CF-F-4 agree with my replays or readings.

## Established results

Grades are those I certify at my evidence grade. "Critic-attributed" marks advances first made at Stage 4. Those are STATED and
need an isolated second read before registration, where the contract requires it.

**E1. (WID) — Tier 1′, `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: proof verified at full statement scope.**
- **Grade:** `proved_informal` (F2, concurred by both critics and re-derived by me).
- **Statement.** For every finite simple graph `G` (`[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`), every finite `F` of
  degree-one vertices, and every `p ≥ 1`:
  `Σ_{B ∈ I_{p+1}} w_F(B) − Σ_{A ∈ I_p} w_F(A) = Σ_{v ∈ F} [Δ_{p−1}(G − H_v) − Δ_{p−1}(G − R_v)]`.
- **Hypotheses consumed:**
  - `deg v = 1` for each `v ∈ F`, used twice: `s_v ∉ B` needs only `v ~ s_v`; the insertion `A ∪ {v}` needs `N(v) = {s_v}`.
  - `v ≠ s_v`, from looplessness.
  - Finiteness of `V`, so the layers are finite.
  - `p ≥ 1`, load-bearing for the Δ-form (see disagreement 1).
  - `IsTree` is not used, and neither is eligibility.
- **Specialization.** With `F = F_p(G)` the right side is `C5LA1.aggregate G p`, so supply − capacity = `S(G, p)` on every
  finite simple graph.
- **Numerical corroboration (not proof):**
  - asserted on every one of my census rows (orders 11–18) and on my fixed points;
  - on 336 general-graph rows (C-F2-U);
  - on 34 general-`F` rows (F2).

**E2. Companions and diagnostics, each `proved_informal`.**
- (FLOW⇒SIGN), which uses (HALL-COND) only at `X = I_{p+1}`, via Fubini on finite sums.
- (HALL⇒FLOW), clone expansion with the completion sentence.
- §B1, the literal-weight identity `Σ|F ∩ B| − Σ|F ∩ A| = Σ_v Δ_{p−1}(H_v)`.
- §C1, the reachability lemma, on triangle-free graphs.
- These are lemmas. None carries a certificate of its own (R29-N-12). §B1 and §C1 are registrable only at the synthesis's
  discretion, after its alias check. F2's lexical scan and C-F2-U's independent scan both found no collision.

**E3. Exhaustive census of eligible rows (bounded_computation; critic-attributed, replayed by me).**
- Every eligible `(T, p)` on free trees of orders 11–18: 5, 34, 163, 313, 528, 2,763, 10,061 and 37,295 rows (51,162 in all).
- Each row has nonempty `F` and an explicit (WID) assertion, and saturates with deletion arcs alone, hence also with (D) ∪ (S).
- Critics: C-F1-U and C-F1-T to order 18; C-F1-T also at order 19 (144,521 rows).
- My instrument (`adj_census.py`) is written from the contract alone. It uses leaf-extension trees with a centre-rooted AHU
  canonical form (A000055 asserted), bitmask layers, and Dinic flow. It reproduces every per-order count at orders 11–18.
- On every eligible row to order 18, `F_p(T)` is the whole leaf set: `F_eq_leaves` equals `eligible` at every order. This is a
  bounded observation (both F2 critics to order 16; mine to 18), not a theorem.
- Counts are of isomorphism classes of free trees, named as such.
- **No deficient cut of (HALL) exists on any eligible tree of order ≤ 18.** This is bounded_computation, with three
  instruments plus the controller prior.

**E4. Positive-weight targets unreachable by any arc exist on eligible rows (critic-attributed).**
- **Found by** C-F2-T and C-F2-U independently; resolves allocation item 4(b) as "exhibited".
- **Where they occur.**
  - First occurrence: order 14, on 11 of 313 rows; each row has a unique such target, of weight 2, and gap
    `Σ_{I_p} w − Σ_{N(I_{p+1})} w = 2`.
  - None at orders 11–13, 15 or 16 (both critics and my census). My census extends this (adjudicator replay, `bounded_computation`): 24 rows at order 17, each with gap 2; 43 rows at order 18, of which 24 have gap **3** and 19 have gap **1**. A gap-3 example is the order-18 tree `0–{1..6}`, `1–{7,8,9}`, `2–10–14`, `3–11–15`, `4–12–16`, `5–13–17` at `p = 8` (`α = 12`, `x = 6`, `|F| = 8`, `S = −2671`, supply/capacity 2325/4996, saturating). It is the `G_k` pattern with three leaves on the support. Every one of these 67 rows saturates.
- **Witness `G_3`** (C-F2-T; replay):
  - `n = 14`, `α = 9`, `x = 4`, `p = 6`, `|F| = 6`, `S = −274`, supply/capacity 253/527.
  - Target `A = {0, 3, 4, b_1, b_2, b_3}`: weight 2, not reached.
  - Flow 253 saturates with deletion arcs alone.
- **Witness `T(4,2)`** (C-F2-U; replay):
  - `n = 14`, `α = 9`, `x = 4`, `p = 6`, `|F| = 5`, `S = −252`, 202/454.
  - Target weight 2, not reached; saturates.
- **Order-17 members, all saturating with gap 2** (replay): `G_4` (`S = −1193`, 1542/2735) and `T(5,2)` (`S = −1094`, 1173/2267).
- **Proved for all parameters** (`proved_informal`; my re-derivation): the family targets are independent and maximal, and no
  member has two private neighbours. So by §C1 they are unreachable.
- **Bounded only:** eligibility and favourability, for `3 ≤ k ≤ 1500` (C-F2-T) and `4 ≤ m ≤ 60` (C-F2-U).
- **Necessary-structure lemma** (C-F2-T; STATED): an unreachable target on an eligible row forces `min(|P|, |M|) ≥ p/2`. My
  check of its argument: the private matching gives `ν ≥ |P|`; Hall on the forest gives `ν ≥ |M|`; König gives
  `α ≤ p + min(|P|, |M|)`. Candidate `proved_informal` after a second read.
- **Meaning.** On these rows, (HALL-COND) at `X = I_{p+1}` is strictly stronger than `S ≤ 0`, by the unreachable weight. This is
  not a cut, and it moves no key.

**E5. The `CB(d, m)` root-plus-arm sector criterion (critic-attributed; C-F1-T A3 = C-F1-U A3; STATED).**
- **Statement.** Take `v ∈ F_p` and `2 ≤ p ≤ dm + 1`, and let `X_sec = {B ∈ I_{p+1} : r, v ∈ B}`.
  - Every member of `X_sec` has weight 1.
  - `Σ_{X_sec} w = 2^{p−1} C(dm, p−1)`, and its positive-weight deletion shadow sums to `2^{p−2} C(dm, p−2)`.
  - So `X_sec` is a deletion-only deficient cut iff `3p < 2dm + 5`.
- **My check of the argument:** it is elementary and correct as stated.
- **My replays** (`adj_cb_sector.py`):
  - The closed forms `I = t(1+t)(1+2t)^{dm} + (1+2t)[(1+2t)^d + t(1+t)^d]^m` and `I(T − v)` equal brute enumeration on four
    small members.
  - The sector sums equal brute force on `CB(2,3)`, `CB(1,6)` and `CB(2,4)`.
- **Exact scan** of all 4,974 configurations with `n ≤ 1600`, with `x` through `α` and `v ∈ F_p` checked exactly. It finds exactly
  three rows:
  - `CB(8,86)`, `p = 460`, `n = 1465`, `α = 775`, `x = 458`, ratio 460/459;
  - `CB(8,89)`, `p = 476`;
  - `CB(8,92)`, `p = 492`, ratio 492/491, the recorded fixed point.
- **Consequences.**
  - `CB(8,86)` is the smallest `CB` instance of the criterion. This agrees with both critics, and the scan confirms uniqueness
    for `n ≤ 1465`.
  - The sector's switch exits (choke insertions when a branch holds exactly one support, weight = that branch's leaves present;
    the `s`-switch has weight 0) have exact total weight 6,128.8×, 6,563.1× and 7,012.3× the deletion deficit at the three rows
    (`adj_cb_switch.py`, brute-validated on three small CB). This replays C-F1-T's 6,129× and 7,012×.
  - So `X_sec` is not a (HALL) cut.
- **Grade.** The criterion is `proved_informal` after a second read. The scan is `bounded_computation`.
- **Scope.** This is a statement about the ACTIVE-weight deletion-only network. It is not the refuted
  `E993-R23-LITERAL-DELETE-ONLY-HALL`, which uses a different weight and a different sector object, so it is no revival.
- **Registration.** Recommended as a scope note on the Tier-3 `R30-CB-RECORD`, not as a new key.

**E6. Record corrections (bounded, backed by replay):** C6-F5's struck −1406/−6717 against the correct −1218/−5434, and C6-U5's
struck 493/491 against the correct 492/491, both localized. The D8 minimality question is closed (not asserted in the registry).
F1's struck literals and CF-F-1's phrase are as recorded above.

**Imported results used at their grades:**
- (LIFT) `proved_informal`, used only by the critics' quotient rows (C-F1-U grades these `computer_assisted`, conditional on
  LIFT; its five brute-validated configurations stand without it);
- the `T_22` orbit flow, cited at `bounded_computation`.

No census value enters any proof above.

## Rejected and narrowed mechanisms

- **No mechanism in this orientation is refuted, and none is revived.** The ten refuted keys, the two named exclusions and the
  C6-F4 rule are distinct from (HALL), and F2's D-table carries this at the categorical level once D5, D6, D7 and D11 are
  corrected.
- **"Deletion arcs suffice" (active weight, no switches) is narrowed.** It is not a registered key and is proposed by nobody.
  Anyone who reads the censuses as support for dropping (S) is answered by E5: it holds on every eligible tree of order ≤ 19 and
  on every computed `CB` quotient, and **fails** at `CB(8,86)`, `p = 460`. The switch arcs are necessary to the mechanism.
- **Narrowed readings of (HALL) versus the aggregate.** F2's "on positive targets, (HALL) ≡ `S ≤ 0`" is struck. Where (HALL) is
  strictly stronger than `S ≤ 0` now has two exhibited parts:
  - the subfamily quantifier over all `X` (always present);
  - unreachable positive capacity at `X = I_{p+1}` (E4; exhibited on eligible rows).
- **F1's horizon is narrowed** from "exhaustive to order 18" to the 3,296 open-band rows, and its adversarial families to the
  tested `(configuration, p)` pairs. Its caterpillar family is relabelled to pendant leaves.

## Lean readiness

This orientation shipped no Lean. No compiled declaration, build log or `#print axioms` output is in my capsule, so none is
confirmed, and no compiled coverage is credited to orientation F. U2's compiled skeleton lies outside my capsule; its
sorry-free status and axioms must be taken from the U adjudication.

**Award group W — (WID), Tier 1′, run-local key `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: CONTRACT-READY on the informal
side.**
- **(a) Complete informal proof** at statement-level granularity, with a closed DAG. Exact statement as in SOLUTION-CONTRACT §2:
  terminal `theorem activeWeightAggregateIdentity (G) [DecidableRel G.Adj] (p) (hp : 1 ≤ p)`, with face lemma
  `layerWeight_sub_eq_sum (F) (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v) (p) (hp : 1 ≤ p)`. DAG nodes:
  - N1. For `IsGraphLeaf G v`: `G.Adj v (support G v)` and uniqueness. Carried as the private helpers `support_adj` and
    `support_unique` inside entry 42 (`E993Interior.highTailAggregateFromShadow`, entry digest `972d0d90…` in the frozen
    `Main.lean` `8d864da2…`).
  - N2. `H G v ⊆ R G v`, since `v ∈ neighborFinset (support G v)` by symmetry of N1.
  - N3. Per-tag bijection, `Finset.card_bij` on `B ↦ B.erase v`:
    `#{B ∈ indepFamily G (j+1) | v ∈ B ∧ ¬Disjoint (B.erase v) (tagWitnesses G v)} = (taggedFamily G (univ \ H G v) (R G v) j).card`.
    - The inverse `A ↦ insert v A` is independent by the carried private `leaf_insert_indep` (entry 42).
    - The meets-condition transfer is `A ∩ R G v = A ∩ tagWitnesses G v` for `A ⊆ univ \ H G v`.
  - N4. Carried private `tagged_count_split` (entry 42) with `D = H G v`, `E = R G v`. This gives
    `card = indepSetCount G (H G v) j − indepSetCount G (R G v) j`, taken in additive form, so no ℕ subtraction arises.
  - N5. Double counting: `layerWeight G F j = Σ_{v ∈ F} #{B ∈ indepFamily G j | v ∈ B ∧ active}`, via `Finset.card_eq_sum_ones`
    and `Finset.sum_comm`.
  - N6. `indepFamily G j = C5LA1.indepSetsAvoiding G ∅ j`, since `univ \ ∅ = univ`.
  - N7. ℤ algebra at `p = (p−1)+1` under `hp`. This guard is load-bearing (K_{1,3}, `p = 0`: 0 against 6).
  - N8. Specialization: `favorableLeaves G p` equals `aggregate`'s summation set, and `hF` follows from `leafSet` membership.
    `aggregate` is written under `open Classical in` while the draft `favorableLeaves` is not, so the two filters may carry
    different `Decidable` instances. The node therefore needs a filter-congruence step (`Finset.filter_congr_decidable` or
    `convert`), not `rfl`.
- **(b) Compiled fragments covering named nodes.** None in orientation F. The carried entries 1–18 (definition layer; digests in
  `Main.lean` headers, e.g. entry 13 `aggregate` `d66e776c…`, entry 18 `taggedFamily` `cb43feeb…`) and entry 42's private helpers
  cover N1, N4 and half of N3. **Fence:** these helpers are `private`, so an award must carry entry 42's block byte-identically
  in the same file, or re-author them in `E993Transport` with a stated equivalence. They cannot be imported from another module.
- **(c) Open nodes** (formal only; each is closed informally): N3's `card_bij` obligations, N5, N7 and N8. None is mathematically
  open.
- **Fences on the face:**
  - `IsTree` is NOT a hypothesis. The identity is on all finite simple graphs.
  - The weight must be the active-tag weight: `activeWeight` must test `B.erase v` against `tagWitnesses`, not `|F ∩ B|`.
  - The guard must be stated with its reason.
  - One terminal `theorem`; the face lemma is a `lemma`.
  - Permitted axioms `propext`, `Classical.choice`, `Quot.sound`.
  - Attribution on the face: r30 F2 (Sonnet), both F2 critics, first-interior entries 1–18 and 42 (Codex).
- **New declarations required:** `indepFamily`, `tagWitnesses`, `activeWeight`, `layerWeight`, `favorableLeaves`, the lemma and
  the theorem.

**Companion (FLOW⇒SIGN), `aggregate_nonpos_of_saturatingFlow`: ready informally.**
- Depends on W plus `Finset.sum_comm` and `Finset.sum_le_sum`.
- It is a lemma and carries no certificate of its own.

**Companion (HALL⇒FLOW), `exists_saturatingFlow_of_weightedHall`: informal proof complete, formal node OPEN.**
- The smallest unproved formal lemma is "WeightedHall ⇒ Hall's condition for every finite set of source clones in the sigma-type
  expansion". It is the completion argument, feeding
  `Finset.all_card_le_biUnion_card_iff_exists_injective`.
- The remaining steps are the injective map ⇒ `f` and the capacity bound.
- Not contract-ready from this orientation's evidence.

**(HALL), Tier 1: NOT ready.**
- There is no informal proof. There is no restricted-scope Hall theorem in orientation F: every saturation result here is
  bounded, and a bounded result never qualifies.
- **Smallest unproved lemma that bears on it:** a switch-capacity (SW) lemma that covers the deletion deficit of every
  `X ⊆ I_{p+1}` whenever deletion-only Hall fails. Its first concrete instance is mixed (HALL-COND) at `CB(8,86)`, `p = 460`,
  for all `X ⊆ I_461`.

**Outcome-B candidates in orientation F: none contract-ready.**
- §C1 is a `proved_informal` lemma, suitable as a companion. It is not an award group.
- The E4 families are not ready. Their smallest unproved lemma is `x(G_k) = k + 1` and `Δ_{k+3}(G_k − 3) < 0` for all `k ≥ 3`
  (equivalently, for `T(m,2)`: `x ≤ m` and `ℓ_1, ℓ_2 ∈ F_{m+2}` for all `m ≥ 4`).
- E5 is a deletion-only scope note, not a Lean target.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

Neither decisive event occurred: (HALL) is not formally verified, and no deficient cut is confirmed. Material progress exists
at the grades the stop gate counts:
- a new lemma at `proved_informal`: (WID) with its companions (F2), plus §B1 and §C1;
- two new adversarial findings, both critic-attributed and replayed:
  - E4, eligible rows where (HALL) is strictly stronger than `S ≤ 0` at the whole-layer cut;
  - E5, the first instance where deletion-only fails and switch arcs become necessary;
- record corrections (E6).

The plateau evidence condition is not met. Much of the adversarial advance is critic-attributed; the routes themselves
delivered (WID)'s proof, the error localizations and a faithful but narrowed census.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at this orientation's evidence grade:
- **(HALL): still_open.** No deficient cut is known. The census and every quotient row saturate, but no instance tested so far
  exercises a switch arc. No informal proof exists.
- **(WID): proved** at full statement scope (informal; F2's proof, re-derived by me and both critics). It is not awarded; that is
  Stage 7's.
- **(FLOW⇒SIGN), (HALL⇒FLOW): proved** (informal).
- **The primary aggregate: untouched.** Mechanism ≠ aggregate.
- **Outcome-B candidates:**
  - §C1 is proved (informal).
  - The E4 families are proved for unreachability but open for uniform eligibility.
  - The E5 criterion is proved (informal, pending a second read) as a deletion-only statement.
  - None moves (HALL).

## Next-route allocation

**Exact remaining obligation of orientation F.** Either exhibit a (CUT) meeting every condition of SEMANTIC-CONTRACT §1.2, or
certify that none exists where switches are necessary. The first concrete target is mixed (HALL-COND) for all `X ⊆ I_{461}`
at `CB(8,86)`, `p = 460` (then `CB(8,89)`/476 and `CB(8,92)`/492). Every smaller tested instance is decided by deletion arcs alone.

**Route F-A — SWITCH-NECESSARY REGIME CUT SEARCH.**
- **Method.**
  - Build a coarser `Aut`-invariant quotient of `CB(8,86)` at `p = 460`: aggregate branch states by the counts
    (supports, leaves, choke) under `S_d ≀ S_m`.
  - Use the stated converse of (LIFT): a quotient deficit gives an invariant original deficient cut.
  - Validate the quotient against brute force on small members, and decide saturation or exhibit the invariant cut.
  - In parallel, search structured families for the smallest tree of ANY shape where active-weight deletion-only Hall fails
    (currently between order 20 and 1465). Candidates: sector generalizations with unequal branch sizes, several arms, and
    pendant-pair caterpillars (untested by F1).
- **Could close in one cycle:** a confirmed (CUT), which is decisive (two instruments plus a second read). Or a bounded record
  that switches suffice at the first deletion-deficient instance, which would feed T1's (SW) lemma.

**Route F-B — UNREACHABLE-CAPACITY AND (WID)-FACE FIDELITY.**
- **Method.**
  - Prove uniform eligibility and favourability for `G_k` (`k ≥ 3`) or `T(m,2)` (`m ≥ 4`); C-F2-T's sketch is the palindromic
    main term plus an exponentially smaller correction. This registers a parameter-uniform `E993-R30-…` family statement at
    `proved_informal`.
  - Give the necessary-structure lemma its second read.
  - Supply the (WID) award face: the `p ≥ 1` reason, the decidability-congruence node N8, and the private-fragment carry plan for
    entry 42.
- **Could close in one cycle:** one `proved_informal` family key and a Stage-7-ready (WID) contract text.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-adj-F/`.
- **Tooling:** standard library only, exact integers and `fractions`. No network, no installs, no Lean.
- **Copies:** `copy-F1/` and `copy-F2/` hold copy-out-first copies of F1's and F2's scripts and JSON, with digests as in the audit.
- **Replay:** run `python3 -B <script>` from the scratch root. The census takes arguments `1 14` and `15 18`.

| file | sha256 | content |
|---|---|---|
| `adj_lib.py` | `755da2b403117fc3f61962619eaff37eee1300139c096af2db1451dffd36ef7a` | instrument: trees, canonical form, bitmask layers, `w_F`, (D)/(S), `S`, Dinic |
| `adj_census.py` | `070ce62680dfa91d44981ce4c93d6643fba6e395eda1d9de8a3f809fd2a17975` | census driver ((WID) asserted first; deletion-only, then mixed; reachability gap) |
| `adj_census_1_14.json` | `463c1e4100d5a213b2211987158e2791ce7478dfd0bee67035f5baa894453257` | orders 1–14 (rows digest `874a5757…`) |
| `adj_census_15_18.json` / `.log` | `aa3b6d744c9061ad298acd86dcadc20b7dd7e219f7837eb2fefb51688f4f9c89` / `4ee41d7a2d55d6e8b1ce7ed06346bc03f402b282710018982bf3249e03444841` | orders 15–18 (rows digest `81e09806…`; 1,863 s) |
| `adj_fixed.py` / `adj_fixed.json` | `83d0ca32ea9a6c77f987188cf0fdad9a90c4c5c2189eb0679c88360e6f1444ec` / `e53fc899816f76ab19744cf46341a1af9e47dc24115942680fc925da94d42f27` | fixed points, `CB(1,7)`, `G_3`, `G_4`, `T(4,2)`, `T(5,2)`, the `p = 0` guard |
| `adj_cb_sector.py` / `adj_cb_sector_1600.json` | `aac80ca7db5219001872586b4ce464060a10db90a30a834c498293a5d38d7591` / `a25f9d6042699c29f92912f2a65d7e48497cc662563f354023f4e4f56955d70d` | closed-form validation, sector brute check, exact scan `n ≤ 1600` |
| `adj_cb_switch.py` / `adj_cb_switch.json` | `20d4b536d5507ee7e942c31841f148d0b7132b177075aa20de87d2fbfdbe1d02` / `f1e6df3d6bdf86ebd1e3919dd58b93f779b3ff4cbc71638e9b1450af5e523e09` | sector switch capacity against the deficit |
| `adj_d8.py` / `adj_d8.json` | `51884158647b66b214baeb2f717e2fb82366d839801840cf20c5ac48399c518a` / `4e6a64ef5a4e3a1a47ecd35aae9bd7adf4e6292fddec3b4408b55f035b5a6353` | literal D8 inequality, orders 11–13 |

**Background jobs:**
- The orders 15–18 census (PID 84795) exited normally after writing its output.
- `ps -p 84795` confirmed it was not running before this write.
- The wait loops and monitors I used have all exited.
- No kill was needed, and no process listing was used.

**Model:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]
