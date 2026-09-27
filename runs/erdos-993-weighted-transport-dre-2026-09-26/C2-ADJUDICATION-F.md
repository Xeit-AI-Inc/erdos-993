# Orientation Adjudication

Stage 5 adjudicator for orientation **F (falsify)**, Cycle 2, r30 (Erdős #993: correctly weighted mixed-boundary transport
for the remaining ordinary-tree favorable-leaf aggregate). Run `erdos-993-math-dre-20260926-r30-weighted-transport`,
2026-09-26. Portfolio: the returns of `F1` (`C2-F-01 SWITCH-NECESSARY-REGIME-CUT-SEARCH`) and `F2`
(`C2-F-02 SELECTOR-BINDING-AND-UNREACHABLE-CAPACITY`) and their critiques `C-F1-T`, `C-F1-U`, `C-F2-T`, `C-F2-U`.

**Boot acknowledgment.** I am operating within VerityOS. The boot read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. As the dispatch requires, I followed no other VerityOS
subsystem: no memory, conversations, modules, skills, logs or decisions were read or written.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Dispatch.** `control/dispatch/c2-stage5/DISPATCH-ADJ-F.md` has SHA-256
  `3efdf9e6fb6d2938a3de00a1067f90d30b705f61808804cf6d65db1f4b0ad0e4`. I recomputed it with `shasum -a 256` before
  reading the file, and it matches the wrapper.
- **Capsule seal.** `control/c2-adjudicator-capsules/F-PACKET-MANIFEST.json`: the stored and recomputed values are both
  **`fa1087f3f5cf132a464c637e52a1c962357f0c771462a0dae63fc154e34d702b`** (canonical JSON without `seal_sha256`,
  `sort_keys`, separators `(",", ":")`, no trailing newline). All **20/20** members match on both SHA-256 and byte count.
  They include both returns (`fdc74dd1…`, `0ee92511…`), the four critiques (`f578e1f2…`, `41401154…`, `c8601012…`,
  `38df138d…`), `PATH-CHECK-F.json` (0 findings) and `C2-STAGE5-CONTROLLER-FACTS-F.json` (`b3abb2fb…`).
- **Nested seals, all recomputed canonically, all matching:**
  - Stage 2: `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da` (1026 files).
  - Stage 3: `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d` (35 files).
  - Stage 4 packet: `025bf11c94064441d2792f39513d96fc16dc12f39f6e1aac8df5c5e4d8fe45ff` (54 files).
- **Manifest agreement.** For every portfolio member, the digest in the Stage 3/4 manifests equals the capsule's and the
  admission reports'. The Stage 4 manifest's four F critic-dispatch digests (`5c601b17…`, `d17048bd…`, `4c624d4e…`,
  `50d8f737…`) equal the values each critic reports.
- **Scratch digests.** Every scratch digest cited by F1, F2 and the four critics was re-hashed. That covers 14 F1 files, the
  F2 files and `F2-EVIDENCE.json` `edf4fa62…`, 30 files of C-F1-T, 19 of C-F1-U `own/`, 11 of C-F2-T and 8 of C-F2-U `own/`.
  All match their cited prefixes.
- **Controller facts** CF-0…CF-F5 are weighed below as one more replay, never as authority. I did not open the replay
  records CF-0 cites under `control/controller-facts/`, because they are not capsule members.
- **Read-boundary disclosures (mine):**
  1. The harness injected the project `CLAUDE.md` and the user auto-memory index into my context at session start. I did
     not open either, used neither as evidence, and did not follow CLAUDE.md's conversation-logging instruction: the
     dispatch confines my writes to this file and my scratch.
  2. F1's return was too large for inline output. The harness saved a byte copy under `~/.claude/projects/…/tool-results/`,
     and I read that copy.
  3. I made a byte copy of F2's `RETURN.md` in the session scratchpad (`/private/tmp/claude-501/…/scratchpad/F2R.md`), which
     is outside `scratchpad/c2-adj-F/`, to page through it. It was a copy of a capsule member, and I deleted it before this
     write.
  4. I ran non-recursive `ls -la` on `scratchpad/c2-F1/`, `c2-F2/`, `c2-crit-F1-T/`, `c2-crit-F1-U/` (and `own/`),
     `c2-crit-F2-T/` and `c2-crit-F2-U/` (and `own/`), all within my grant.
  5. I ran non-recursive `grep` and `python3 -B -c` JSON loads in place on named files in `c2-F1/`. These were reads only,
     wrote nothing, and executed no seat code; `c2-F1/__pycache__` timestamps are unchanged (18:27–18:42).
  6. I ran no search above my grant, used no network, installed nothing and read no other orientation's material.
  7. The only process queries were `ps -o … -p <literal PID>` and `kill -0 <literal PID>` on my own two jobs.
- **Process record of the portfolio.** These were filed and self-disclosed, and none bears on any evidence:
  - forbidden `ps aux` listings: F1 twice, F2 once;
  - F2's "no `pgrep`/full process listing was used" line contradicts its own Disclosure 5 and is struck (both F2 critics);
  - F1's two non-recursive `ls` calls under `cycles/cycle-1/`;
  - F2's non-recursive `ls` above the grant and `os.walk` of `sources/`.

  The 12 unlisted files under `sources/c1-stage7-sources/` are a non-finding (CF-2; both F2 critics).

## Route-by-route decisions

### F1 — `C2-F-01 SWITCH-NECESSARY-REGIME-CUT-SEARCH`: `bounded_evidence`, retained narrowed

Both critics give `retained_narrowed`. The claims, resolved one by one:

1. **Fidelity: passes.** Both critics audited `flow_instrument.py`: the active test is `(B∖{v}) ∩ W_v ≠ ∅`, (S) requires
   exactly `|N(u)∩B| = 2` with `u ∉ B`, `F_p` is fixed on the original tree, and `x` runs through `α`. Their independent
   instruments reproduce every row they share with F1. Nothing is struck on fidelity grounds.
2. **Fixed points** (four; values correct). My instrument reproduces `K_{1,12}`/8 (1980/3960/−1980, saturating) and the
   double broom/6 (255/516/−261). The attribution "SEMANTIC-CONTRACT's list" is **struck** (both critics): the double broom
   and `CB(1,7)` come from the worker brief.
3. **The CB(d,m) sweep.** The literals are backed (`configs_tested=4482`, 0 hits; replay byte-identical per both critics).
   Its scope is **narrowed**, as both critics found independently: `grid_search.py` tests only P8's inequality
   `3p < 2dm + 5`, the root-plus-arm sector. The established statement is therefore *"no eligible `CB(d,m)` with `n < 1465`
   has a deletion-deficient root-plus-arm sector"*. It is not "no deletion-deficient CB row". My own DP confirms the
   boundary: `CB(8,86)` has `n = 1465`, `α = 775`, `x = 458`, window `[460, 516]`, and a P8 hit at `p = 460` only.
   `CB(8,89)`/476 and `CB(8,92)`/492 are likewise single hits.
4. **Grade of P8.** F1's "STATED, needs an isolated second read" is **struck**. The critics agree it is stale:
   - C-F1-T cites the Cycle 1 close, `proved_informal` with second read SR-9 `confirmed_with_repairs`;
   - C-F1-U cites the allocation's `R30-CB-RECORD`.

   Within my capsule the allocation governs: P8 is a proved sector fact inside `R30-CB-RECORD`. C-F1-T's SR-9 detail is
   outside my boundary and is carried as that critic's report. F1's obligation 4 ("register P8") is moot.
5. **"Compared term-by-term: identical"** (against the Cycle 1 critic's formula): **struck** as unbacked (both critics).
6. **"WID … checked on 4 fixed points + 23 own-instrument rows"**: "23" is **struck** (C-F1-U). I confirmed from F1's
   scripts that `deletion_only_check.py` asserts no WID and that the sweeps assert WID only on completed rows. The backed
   count is 4 + 9 = 13. C-F1-T did not address this; there is no disagreement.
7. **Bare-leaf caterpillar table** (9 rows). Backed: C-F1-U reproduced all 9 rows and C-F1-T 4 of them.
   - The shipped `caterpillar_sweep.json` digest is not replay-reproducible because it hashes a wall-clock `elapsed_s`
     (C-F1-T). The content is identical (C-F1-U). The critics do not disagree: the digest is struck as a certification, and
     the content stands.
   - The claim "extends … from `n = 12` to `n = 24`" is **narrowed** (C-F1-U A5, uncontested). Only `n = 20, 21, 24` are
     new, because orders ≤ 19 repeat the Cycle 1 census. Every row was also tested at the first eligible `p` only.
8. **Pendant-pair caterpillar PPC(L,k)** (F1's one new artifact: closed form plus eligibility scan).
   - **"Every eligible (L,k)" and "297 further".** The critics differ only in frame, and my scan settles it. On F1's stated
     domain (`2 ≤ L < 60`, `1 ≤ k < 20`, `n ≤ 300`) there are **298** eligible pairs, as C-F1-T and C-F1-U both reproduce.
     Over all `L, k ≥ 1` with `n ≤ 300` there are **352** pairs (1,530 rows), as C-F1-U says. "Every eligible `(L,k)` with
     `n ≤ 300`" is struck. "298 on the stated domain" stands on the critics' and my artifacts, since F1 shipped no generator.
   - The smallest eligible instance is `PPC(7,2)`: `n = 35`, `α = 18`, `x = 10`, single `p = 12` (my scan).
   - The timings "<2ms" and "10.2s" are struck.
   - "No eligible instance below `n = 35`" is true, but the cited `pendant_pair_sweep.json` does not back it (C-F1-U A8).
9. **Heterogeneous chokes.** Both critics establish that 8 of the 14 degree lists are uniform `CB(d,m)`, and that the one
   eligible configuration, `[4,4,4,4]`, is `CB(4,4)`. The family therefore contributed **no eligible heterogeneous row**.
   - **Adjudicator correction.** F1's JSON (`heterogeneous_cb_sweep.json`, `e9527022…`) records 10 `not_eligible`, 3
     `n_too_large_skipped` (`[20]`, `[30]`, `[16,2]`) and 1 `timeout_flow`. The prose's "11 … no eligible p, 2 … skipped" is
     **struck**; C-F1-U's "Backed" on that literal is overruled.
   - The 3 skipped configurations were never tested for eligibility.
10. **Parts (b) and (c).** No deletion-deficient row and no switch-necessary row were found. This stands as a report of the
    searched set only. The general-tree gap between orders 20 and 1464 is **unchanged** (both critics; F1's own closing
    sentence agrees).
11. **Ruling 15 wording.** F1 separates its deletion-only screen from `E993-R23-LITERAL-DELETE-ONLY-HALL` "by relation". C-F1-T
    calls this a wording defect, since the screen's relation is exactly (D), and C-F1-U calls it "adequate". I rule it a
    wording defect, not a revival: the governing distinction is the **active-tag weight** (and, for P8, the sector object),
    which F1's preamble names. No deletion-only result was reported as a (CUT).

**Critic-derived advances on F1.** All are graded `bounded_computation` unless stated, and attributed as shown.

- **A-F1-1 (C-F1-T, C-F1-U).** `PPC(7,2)` at `p = 12`:

  | Quantity | Value |
  |---|---|
  | Orbits under `(S_2)^7` (sources / targets) | 249,153 / 394,553 |
  | `\|I_13\|` / `\|I_12\|` | 3,070,508 / 5,669,905 |
  | `\|F\|` | 14 = all leaves |
  | Supply / capacity | 7,801,728 / 11,469,576 |
  | `S` | −3,667,848 |

  It **saturates with deletion arcs alone** and with (D) ∪ (S).
  - **Instruments.** Four agree: C-F1-T's two quotients (`pp_quotient.py`, `pair_quotient.py`), C-F1-U's `ppc_quot.py`, and
    **my own** (`adj_ppc.py`). Mine generates arcs by applying the literal (D) ∪ (S) to a representative and canonicalising;
    it has no hand-coded transition rules. It was validated against brute force: 176 comparisons, 78 of them deficient,
    0 mismatches. The controller's CF-F4 agrees on supply and capacity.
  - **Paired disagreement: quotient arc counts, resolved.** C-F1-T reports 2,124,714 (D) and 2,770,437 (D ∪ S); C-F1-U
    reports 2,388,855 and 3,181,944. My instrument reproduces **all four** numbers: C-F1-U counts every orbit arc, while
    C-F1-T keeps only arcs whose source supply and target capacity are both positive. This is a counting convention, not a
    mathematical conflict, and the flow values agree.
  - **Exactness.** C-F1-T's value-exactness argument makes the quotient deficit/flow value equal to the original's: the
    min-cut function is submodular, the group permutes its minimisers, and the union of all minimisers is an invariant
    minimiser. This is the value form of the registered (INV) key plus (LIFT)'s converse. I verified the argument and used it
    myself. C-F1-U used (LIFT) only to lift a saturating quotient flow, which is also valid.
- **A-F1-2 (C-F1-T).** `CB(4,4)`/14: `n = 39`, `α = 21`, `x = 12`, `|F| = 17`, supply 33,933,216, capacity 59,268,576,
  `S = −25,335,360` (CF-F5 agrees). It saturates with deletion arcs alone. This now has **two instruments**: C-F1-T's
  `pair_quotient.py` and my `adj_pairq.py` (validated by 132 brute comparisons, 54 deficient, 0 mismatches). They agree on
  orbit counts (45,848 / 65,906), positive-arc counts (215,720 / 261,872) and flow.
- **A-F1-3 (C-F1-T, C-F1-U).** `CB(1,7)`/10: 29190 / 58002 / −28812, `|F| = 8`, saturating with deletion arcs alone. My
  instrument reproduces this, so there are three instruments.
- **A-F1-4 (C-F1-U only; single instrument).** The four untested second eligible ranks of F1's caterpillars, and 53 further
  bare-caterpillar rows up to `n = 42` at every eligible `p` (`(S_t)^L` quotient, validated in 78 cases). All saturate with
  deletion arcs alone. I did not replay this.
- **A-F1-5 (C-F1-T; STATED; `proved_informal` for the comparison).** The `{u_i, c_i1}` sector of `CB(d,m)` is
  deletion-deficient iff `3p < 2d(m−1) + 7`. That threshold never exceeds P8's.
  - My check: the argument holds for the sub-family with `u_i, c_i1 ∈ B`, `r ∉ B`, `u_j ∉ B` (`j ≠ i`) and `c_ij ∉ B`
    (`j ≥ 2`), whose free part is the `d(m−1)+1` induced pairs. On the face, the family must be defined with these
    exclusions: `T − N[Q]` is **not** an induced perfect matching, because it keeps the other chokes and the `c_ij` as
    non-pair components.
  - With that definition, every member has weight exactly 1, and the P8 computation applies.
- **A-F1-6 (C-F1-T; STATED).** The PPC weight-one sector `{s_i, c_i1} ∪ M` is deletion-deficient iff `3p < 2k(L−1) + 5`. The
  screen to `n ≤ 600` finds 0 hits with minimum margin **+7**, attained at `PPC(7,2)` (`36 − 29`, which I recomputed).

### F2 — `C2-F-02 SELECTOR-BINDING-AND-UNREACHABLE-CAPACITY`: `bounded_evidence` retained, principal theorem `proved_informal`

Both critics give `retained_narrowed`.

1. **A1 / B1 (`α`).** `α(G_k) = 2k+3` and `α(T(m,k)) = 2m+k−1` are `proved_informal`. Both critics and I confirm them:
   - my DP gives `α(G_k) = 2k+3` for `k = 0..160`;
   - the upper bound needs no König argument, because an independent set meets each edge of the size-`(k+2)` matching at most
     once.
2. **A2 (closed forms)** `I(G_k) = (1+y)(1+3y+y²)^{k+1} + y(1+y)²(1+2y)^k` and `I(G_k − 3)` are `proved_informal`. I
   re-derived them by conditioning on vertex 0 and checked them against the tree DP for `k = 0..40`.
3. **A3 (`x(G_k) ≤ k+1` for every `k ≥ 2`): `proved_informal`, F2's principal new result.**
   - Both critics re-derived it line by line. I verified the exact identity `8·Δ_{k+1}(I(G_k)) = −2^k(k²+3k−8)` from the tree
     DP (not the closed form) for `k = 2..160`.
   - The Newton paragraph is correct but not load-bearing (both critics).
   - **Struck** (both critics, F2's own JSON, and my DP): "`x(G_k) = k+1` exactly on every one of these 305 instances
     (`k = 0..304`)". In fact `x(G_0) = 2` and `x(G_1) = 3`. The bounded statement is `x(G_k) = k+1` for `2 ≤ k ≤ 304`
     (my DP: `2 ≤ k ≤ 160`; C-F2-U: to 400). The `f2_main.py` docstring "for every `k ≥ 0`" is also false.
4. **A4 ("`(G_k, k+3)` eligible iff `k ≥ 3`", both directions): `proved_informal`.** Both critics confirm it; my DP gives it
   for `k = 0..160`, and CF-F1 agrees.
5. **A5 (favorability of 3 and 4 in `G_k`).** It is `bounded_computation` as shipped and raised to `proved_informal` by the
   critic-derived Lemma F (below).
6. **B2 (upper eligibility bound for `T(m,2)`, `m ≥ 4`): `proved_informal`.**
7. **B3 (`x(T(m,2)) ≤ m`) and B4 (favorability of `ℓ_1, ℓ_2`): `bounded_computation`, correctly graded.**
   - **Paired "disagreement" on tightness, resolved.** The critics do not conflict:
     - C-F2-T's F-9 says `x = m` for `3 ≤ m ≤ 13` and `x(T(304,2)) = 288`;
     - C-F2-U says `x = m` exactly for `4 ≤ m ≤ 18` and `x(T(400,2)) = 379`;
     - my DP gives `x = m` for `3 ≤ m ≤ 18`, `x(T(19,2)) = 18`, `x(T(304,2)) = 288` and `x(T(400,2)) = 379`;
     - CF-F2 agrees on `4..18`.

     The bound is tight (zero slack) for `4 ≤ m ≤ 18` and slack beyond that. I also confirm `Δ_{m+2}(T(m,1)) < 0` for
     `m = 4..80` and `m ∈ {150, 200, 304, 400}`.
   - The isomorphism `T(m,2) − ℓ_1 ≅ T(m,1)` rises to **`proved_informal`** (both critics; it holds by construction, and my
     builder gives identical polynomials).
8. **§C rows.** `G_3`/6 and `T(4,2)`/6 are reproduced digit for digit by both critics and by me:
   - `G_3`: 253/527/253, `S = −274`, gap 2;
   - `T(4,2)`: 202/454/202, `S = −252`, `|F| = 5`, gap 2.

   The gap identity `Σ_{I_p} w − Σ_{N(I_{p+1})} w = Σ_{unreachable} w` holds by definition (C-F2-T F-10). F2 graded
   "gap = 2 for general `k`" as `proved_informal`, but as shipped it rested on brute-forced uniqueness at order 14 only. It
   is **over-graded as shipped** (C-F2-U Finding 2) and is repaired by the critic-derived Lemma U (below).
9. **Item (a), the selector.** "Not proved, not refuted" stands. The Part D literals are narrowed:
   - "1,143 eligible rows" becomes **1,143 evaluations = 588 isomorphism classes of `(tree, p)` rows on 539 non-isomorphic
     trees**;
   - "up to order ~44" becomes **orders 11–37**.

   Both critics agree, and my copy-out replay of C-F2-T's audit on F2's generator reproduces `1143 / 588 / 37 / 11`.
   Part D ships no per-row data, contrary to the full-row-data rule (both critics).
10. **(WID) status misreport, struck.** F2 wrote "OPEN at Stage 1 … `proved_informal`". Entering Cycle 2 the key is VERIFIED
    `formally_verified` (C1-LA1), per the gate and the allocation (both critics).
11. **The Cycle 1 selector horizon (C-F2-U's tension note).** The allocation records "on every computed eligible row
    `F_p(T)` is the whole leaf set", which covers the 195,683 order-11–19 rows. F2 reports that SR-REACH did not rerun the
    whole-leaf-set check at orders 17–18.
    - My ruling: the allocation's standing statement governs as the record. F2's statement concerns SR-REACH's own text,
      which is outside my boundary. Neither changes any grade.
    - CF-F3 (515 eligible rows to order 14, every leaf favorable) is consistent.

**Critic-derived advances on F2.** All are STATED at Stage 4 and need an isolated second read before registration.

- **Lemma F** (C-F2-U Lemma F ≡ C-F2-T F-6, two independent proofs): `Δ_{k+3}(G_k − 3) < 0` for every `k ≥ 1`, and likewise
  for leaf 4. Hence `{3, 4} ⊆ F_{k+3}(G_k)`. **`proved_informal`.**
  - *My check.* I verified the decomposition `I(G_k − 3) = (1+3y+2y²)M + y(1+y)(1+2y)^k`, with `M = (1+3y+y²)^k`, from
    the tree DP. The correction term has degree `k+2`. `M` is strictly decreasing on indices `k..2k`. So
    `R_{k+4} − R_{k+3} < 0` for `k = 1..160`, and favorability holds for `k = 1..160`.
  - My first scripted check reported a false negative, caused by a trailing zero in my own test polynomial. I fixed it; the
    fix is recorded in `adj_f2.py`.
- **Lemma U** (C-F2-U ≡ C-F2-T F-7). A target `A ∈ I_p` has an in-arc of (D) ∪ (S) iff either `A` is not maximal, or some
  `u ∈ A` has two non-adjacent neighbours whose only neighbour in `A` is `u`. This is a re-derivation of the
  second-read-confirmed P10. Applied to the families:
  - `A_k = {0, 3, 4, b_1, …, b_k}` is the **unique** no-in-arc target of `I_{k+3}(G_k)` for every `k ≥ 1`;
  - `{c_1, …, c_m, ℓ_1, ℓ_2}` is the unique one of `I_{m+2}(T(m,2))` for every `m ≥ 2`.

  **`proved_informal`.**
  - *My check.* I read both case analyses (0 ∈ A / 0 ∉ A for `G_k`; s ∈ A / the extra-vertex case split for `T(m,2)`) and
    re-derived them independently of the critics' text. I found no gap.
  - Brute force for `G_1..G_6` and `T(2..6,2)`, with the Lemma U predicate cross-checked against the literal in-arc scan on
    **every** target (35,669 targets: 31,148 in `G_1..G_6`, 4,521 in `T(2..6,2)`), finds exactly one unreachable target, equal to the stated set.
- **Corollary G** (both critics; composed from F2's A1/A3/A4 with Lemmas F and U). For every `k ≥ 3`, with `p = k+3` and
  `F = F_p(G_k)`:
  - `(G_k, p)` is eligible;
  - `{3, 4} ⊆ F`;
  - `A_k` is the unique target with no in-arc;
  - `Σ_{I_p} w_F − Σ_{N(I_{p+1})} w_F = 2` **exactly**.

  **`proved_informal`, critic-attributed**; I verified it at full scope. My rows `G_3`, `G_4`, `G_5` give gap 2, unique
  unreachable weight [2], and saturation both with deletion arcs alone and mixed, matching both critics:
  - `G_4`: 1542/2735, `S = −1193`;
  - `G_5`: 8875/14196, `S = −5321`.

  **Scope wording.** "Strictly stronger" means only that the (HALL-COND) right-hand side at `X = I_{p+1}` is 2 below the
  scalar target's. No tree row is known where `S ≤ 0` holds and Hall fails, and every `G_k` row computed saturates.
- **`T(m,2)` analogue: conditional.** The gap `= |{ℓ_1, ℓ_2} ∩ F|` (`= 2` when both are favorable) is proved for every
  `m ≥ 2`. It is conditional on two bounded facts: `x(T(m,2)) ≤ m` and `Δ_{m+2}(T(m,1)) < 0` for every `m ≥ 4`.
- **Selector reduction** (C-F2-U Finding 6, sharper; C-F2-T F-5, same substance; elementary, `proved_informal`). A
  selector-binding eligible row `(T, p, v)` forces one of two cases:
  - (i) `x(T − v) ≥ x(T) + 3`; or
  - (ii) the tree `T − v` has a strict descent before `p` and `Δ_p(T − v) ≥ 0`. With `Δ_p > 0`, `T − v` would be a
    **non-unimodal tree**.

  So the brief's route "`x(T−v) ≤ x(T)+1` plus eligibility gives favorability" is insufficient, and a proof of the selector
  lemma must contain strict decrease of arbitrary trees on a lower-region window. I checked the case logic.
  - The critics' bounded side results agree: shifts `x(T−v) − x(T) ∈ {0, −1}` (C-F2-T: 5,446 free trees of order ≤ 14;
    C-F2-U: 376,463 rooted trees of order ≤ 16, with rows counted with multiplicity over rooted labellings, not isomorphism
    classes; CF-F3: free trees of orders 4–14).
- **Proposed key names.** I recommend C-F2-U's
  `E993-R30-GK-TREE-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` over C-F2-T's shorter variant,
  because it names the rank in the predicate. The lexical and mathematical alias check against the run-local registry is
  **owed by the synthesis**: the registry is outside every F capsule, including mine.

## Cross-route reconciliation

- **F1 and F2 do not conflict.** F1 searches for failures of Hall-type conditions on arbitrary subfamilies. F2 studies
  `X = I_{p+1}` and the selector. Every row either route or its critics computed saturates, and every one saturates with
  **deletion arcs alone**. That includes `G_3..G_5`, `T(4..6,2)`, `PPC(7,2)/12`, `CB(4,4)/14`, `CB(1,7)/10`, the bare
  caterpillars and the fixed points.
- **Switch arcs have not been load-bearing on any computed tree row**, in the F portfolio or in the Cycle 1 record as the
  allocation carries it.
- **What the combined record shows.**
  - F2's Corollary G shows that on infinitely many eligible rows the full-family Hall condition has strictly less room than
    the scalar target.
  - F1's record shows that deletion-only Hall has not failed on any computed tree row below `CB(8,86)`.
  - Together they locate the adversary's only live ground: subfamilies `X ⊄ X_sec` of the three sector-deficient `CB` rows
    (T1/U2 territory), and untested general trees of orders 20–1464.
- **The selector question (F2 item (a)) is an F object no longer.** By the reduction, a selector-binding row of type (ii)
  with `Δ_p > 0` would be a non-unimodal tree, which is a far larger event than a transport finding. A proof of the selector
  lemma needs lower-window strict decrease for arbitrary trees. The selector should therefore stay explicit in every (HALL)
  statement, as the contract already fixes it, and not be removed by a lemma.
- **Controller prior (CF-F1…CF-F5), weighed as one more replay.** Every controller value I could compare agrees with my
  instrument and the critics:
  - `G_k` eligibility iff `k ≥ 3`;
  - `x(T(m,2)) = m` on `4..18`;
  - PPC(7,2)/12 supply and capacity;
  - CB(4,4)/14 supply and capacity.

  CF-F4 states that the controller did not compute the PPC flow; that flow is carried by the four instruments listed above.

## Established results

Grades follow `SOLUTION-CONTRACT.md` §4. Attribution: r30 Cycle 2 seats and critics as named. The frozen definitions of
record are from the first-interior run (Codex) and r26/r24/r25. (WID) is from C1-LA1. The weight, the relation and the
mechanism are Codex (GPT-6 Astra/Sol/Luna). (LIFT) and (INV) are as registered.

**Exact theorems (`proved_informal`).** Every item here is finite, and every instance is a finite ordinary tree: connected
through vertex 0 or the spine, with `n − 1` edges, and each instance also tested for acyclicity and connectivity separately
in code. None uses a census value, a quotient step or (LIFT).

| # | Statement | Hypotheses consumed | Attribution / status |
|---|---|---|---|
| E1 | `x(G_k) ≤ k+1` for every `k ≥ 2` | the closed form of `I(G_k)`; palindromicity of `(1+y)(1+3y+y²)^{k+1}`; the exact convolution `q_{k+1} − q_k = −2^{k−3}(k²+3k−8)` | F2 (seat); confirmed by both critics and my replay |
| E2 | `(G_k, k+3)` eligible ⟺ `k ≥ 3` | E1 and `α(G_k) = 2k+3`; eligibility in ℕ, no subtraction | F2 |
| E3 | `α(G_k) = 2k+3`; `α(T(m,k)) = 2m+k−1` (`m, k ≥ 1`) | matching and cover | F2 (re-derivation of SR-REACH's) |
| E4 | `{3, 4} ⊆ F_{k+3}(G_k)` for every `k ≥ 1` | `I(G_k−3)` decomposition; degree of the correction term; strict decrease of `(1+3y+y²)^k` past its centre (Newton, or real-rootedness) | C-F2-U Lemma F / C-F2-T F-6; STATED |
| E5 | Lemma U; unique no-in-arc targets in `G_k` (`k ≥ 1`, `p = k+3`) and `T(m,2)` (`m ≥ 2`, `p = m+2`) | tree (so private pairs are non-adjacent); maximality case analysis | C-F2-U / C-F2-T; STATED (the general criterion re-derives the confirmed P10) |
| E6 | **Corollary G:** for `k ≥ 3`, eligible, `{3,4} ⊆ F`, unique unreachable target `A_k` with `w_F(A_k) = 2`, and `Σ_{I_p} w_F − Σ_{N(I_{p+1})} w_F = 2` | E1–E5 | critic-attributed composition; STATED; isolated second read and alias check owed |
| E7 | `T(m,2) − ℓ_1 ≅ T(m,1)` | construction | both critics; STATED |
| E8 | Selector reduction (cases (i)/(ii)) | definitions; leaf deletion keeps a tree | C-F2-U / C-F2-T; STATED |

**Conditional reduction.** `T(m,2)`, `m ≥ 4`: gap `= 2` ⇐ [`x(T(m,2)) ≤ m` and `Δ_{m+2}(T(m,1)) < 0`]. By E5 and E7, both
premises are bounded only.

**Bounded computations** (`bounded_computation`; relation (D) ∪ (S) and deletion-only as stated; weight `w_F` literal; `F`
fixed at `p`; `x` through `α`; WID asserted from independent sides on every flow row):

| Row | Supply / capacity / `S` | Mixed flow | Deletion-only | Instruments |
|---|---|---|---|---|
| `PPC(7,2)/12` | 7,801,728 / 11,469,576 / −3,667,848 | saturates | saturates | 4 |
| `CB(4,4)/14` | 33,933,216 / 59,268,576 / −25,335,360 | saturates | saturates | 2 |
| `CB(1,7)/10` | 29190 / 58002 / −28812 | saturates | saturates | 3 |
| `G_3/6`, `G_4/7`, `G_5/8` | see F2 section | saturate | saturate | 4 (`G_3`: F2, both critics, mine); 3 (`G_4`, `G_5`: both critics, mine) |
| `T(4,2)/6`, `T(5,2)/7`, `T(6,2)/8` (`T(6,2)`: 6350 / 11155 / −4805) | see F2 section | saturate | saturate | 4 (`T(4,2)`); 3 (`T(5,2)`); 2 (`T(6,2)`: C-F2-U, mine) |
| 9 bare-leaf caterpillars (`n ≤ 24`, first eligible `p`) | per F1's table | saturate | saturate | F1 + C-F1-U; 4 rows also C-F1-T |
| 4 second ranks and 53 further caterpillar rows to `n = 42` | — | saturate | saturate | C-F1-U only |

Further bounded facts:
- **P8 screen.** Exactly three `CB` hits with `n ≤ 1600` (`CB(8,86)`/460, `CB(8,89)`/476, `CB(8,92)`/492) and none with
  `n < 1465`: three instruments, plus my parameter replay of the three rows.
- **PPC eligibility.** 298 pairs on F1's domain; 352 pairs (1,530 rows) over all `L, k` with `n ≤ 300`; smallest
  `PPC(7,2)` (C-F1-T, C-F1-U, mine).
- **PPC sector screen.** Minimum margin +7 up to `n ≤ 600` (C-F1-T only).
- **Selector.** Every leaf is favorable on:
  - the 515 eligible rows to order 14 (CF-F3, C-F2-T);
  - the 588 isomorphism-class rows of F2's gadget family, orders 11–37;
  - the rows of C-F2-U's rooted-tree exploration to order 16, counted with multiplicity.

  The shifts `x(T−v) − x(T)` are never positive.
- **`G_k` and `T(m,2)` ranges.**
  - `x(G_k) = k+1` for `2 ≤ k ≤ 160` (mine; C-F2-U to 400).
  - `x(T(m,2)) ≤ m` and `Δ_{m+2}(T(m,1)) < 0` for `4 ≤ m ≤ 80` plus four spot values (mine; F2 to 304; C-F2-U to 400).

**Imported results at their grades.**
- (WID), `formally_verified` (C1-LA1): used only as the per-instance assertion.
- The value form of (INV) (`proved_informal`, registered) with (LIFT)'s converse: used by C-F1-T and by me for quotient
  flow values.
- (LIFT) (`proved_informal`): used by C-F1-U to lift a saturating quotient flow only.
- P10 (confirmed by SR-REACH): re-derived as Lemma U.
- No (DCB) or (TSB) is used, and no closed region is re-proved.

**Compiled scratch declarations.** None exist in orientation F. There is no Lean artifact and no `#print axioms` output to
confirm.

**Refuted steps.** None. No mechanism was proposed, so none was refuted.

**Record corrections** (carried to the synthesis):
- P8's grade (F1);
- the fixed-point provenance (F1);
- the "23 WID rows" (F1);
- the caterpillar-sweep digest, which is non-reproducible (F1);
- the heterogeneous-choke counts 10/3/1 (F1; adjudicator);
- "every eligible `(L,k)`" (F1);
- `x(G_k) = k+1` "305 instances" (F2);
- the Part D row count and order range (F2);
- the (WID) status (F2);
- the process literal (F2);
- the stale `f2_lib.py` docstring and the §C import list (F2; cosmetic).

**Open bridges.**
- The `T(m,2)` premises.
- The reverse inequality `x(G_k) ≥ k+1`, which is not needed.
- `S(G_k, k+3) ≤ −2` on the whole family, which is optional and would make Corollary G's two inequalities comparable.
- The selector lemma, now reduced to lower-window strict decrease.

## Rejected and narrowed mechanisms

- **No mechanism was proposed in orientation F.** No refuted key of `SOLUTION-CONTRACT.md` §3.2 is revived, including the
  deletion-only Hall key (distinguished by the active weight) and the C6-F4 unit-capacity rule. No `|F ∩ B|` counting was
  found in any instrument.
- **Narrowed.**
  - F1's CB claim is narrowed to the root-plus-arm sector.
  - F1's "heterogeneous" family is narrowed to zero heterogeneous eligible rows.
  - F1's caterpillar extension is narrowed to `n = 20, 21, 24` at the first `p` (and further by C-F1-U's rows).
  - F2's gap grade as shipped is narrowed to bounded; it is lifted only through the critics' Lemma U.
  - F2's Part D scope is narrowed to 588 classes, orders ≤ 37.
- **Rejected as a proof route.** The brief's selector implication, "`x(T−v) ≤ x(T)+1` with eligibility gives
  `Δ_p(T−v) < 0`", is rejected: it lacks descent persistence (E8).
- **Adversarial record ruling (protocol item 7).**
  - *Horizons.* General trees are exhaustive to order 19 (Cycle 1; order 19 by one critic).
  - *Families.* `CB` by the P8 screen to `n ≤ 1600`. Full-row flows: `CB` quotient rows to `n ≤ 114` (Cycle 1),
    `CB(1,7)/10` and `CB(4,4)/14`. `PPC(7,2)/12`. Bare caterpillars to `n = 42`. `G_k` and `T(m,2)` to `n = 20`.
  - *Candidates.* No candidate deficient cut, deletion-only or mixed, exists in the portfolio. Therefore **no tuple
    `(T, p, X)` satisfies the conditions of SEMANTIC-CONTRACT §1.2 (CUT)**. My replays found no deficit on any eligible row I
    computed. Deficits appeared only at non-eligible validation ranks, where they are expected and prove nothing.
- **Fidelity record ruling.**
  - All six portfolio instruments (F1, F2 and the four critics) and mine use literal `w_F` with `W_v = N(s_v)∖{v}`,
    literal (D) ∪ (S), `F` fixed at `p` on the original tree, and `x` through `α`.
  - Supply − capacity = `S` is asserted from independently computed sides on every flow row. F1's `deletion_only_check`
    re-runs rows already asserted.
  - No number is struck on fidelity grounds.
  - This cycle's F portfolio reconstructs no predecessor errors, and F2 did no mechanism-equivalence table (it was Cycle 1's
    object). The Cycle 1 table stands as sealed.

## Lean readiness

**(WID)** at `SOLUTION-CONTRACT.md` §2 is already VERIFIED `formally_verified` (C1-LA1,
`E993Transport.activeWeightAggregateIdentity`). Nothing in orientation F bears on it, beyond every instrument's assertion
holding.

**(HALL)** (`lowerRegionTwoForOneWeightedHall`) is **NOT ready**, on all three criteria:
- (a) There is no informal proof at any scope. Orientation F contributes only adversarial evidence.
- (b) There are no compiled fragments.
- (c) Open nodes, as seen from F:
  - the smallest unproved lemma, as named at intake: a switch-capacity statement for every source subfamily
    `X ⊄ X_sec` where deletion-only Hall fails, first instance `CB(8,86)` at `p = 460`;
  - the unknown smallest deletion-deficient general tree (orders 20–1464).

  A bounded result never qualifies.

**Outcome-B / family candidates in orientation F.** No Tier-2 template lemma (NMP/SW/INV/REC/BUD) and no restricted-scope
Hall theorem was produced. One family statement is informally complete:

- **Award group F-G ("Corollary G").** It is **NOT contract-ready for Cycle 2 Stage 7.**
  - (a) The informal proof is complete at statement level, and the DAG closes:

    `N1 α(G_k)` → `N2 closed form I(G_k)` → `N3 palindromic plateau` + `N4 convolution` → `N5 x ≤ k+1` → `N6 eligibility`;
    `N7 I(G_k−3) decomposition` → `N8 strict decrease of (1+3y+y²)^k past its centre` → `N9 favorability of 3, 4`;
    `N10 Lemma U (general)` → `N11 case analysis of maximal (k+3)-sets` → `N12 w_F(A_k) = 2` → `N13 gap = 2`.

    It is critic-attributed, STATED, with the isolated second read and the alias check pending.
  - (b) **Zero** compiled fragments cover any node.
  - (c) The nodes that are open *for Lean* are:
    - N2/N7, the count identities for `C5LA1.indepSetCount` on a parametric `Fin (3k+5)` tree;
    - N8, for which Mathlib has no Newton-inequality or real-rootedness lemma, so a direct log-concavity or convolution
      proof is needed;
    - N11.
  - **Smallest unproved Lean node on the frozen definitions:** N10 (Lemma U / P10), stated for any finite simple graph with
    the non-adjacency made explicit. Its draft statement:

    ```lean
    lemma exists_transportRel_iff (G : SimpleGraph V) [DecidableRel G.Adj] {p : ℕ} {A : Finset V}
        (hA : A ∈ indepFamily G p) :
        (∃ B ∈ indepFamily G (p + 1), transportRel G B A) ↔
          (∃ q ∉ A, ∀ a ∈ A, ¬ G.Adj q a) ∨
          (∃ u ∈ A, ∃ y z, y ≠ z ∧ ¬ G.Adj y z ∧ G.Adj u y ∧ G.Adj u z ∧
            (∀ a ∈ A, G.Adj y a → a = u) ∧ (∀ a ∈ A, G.Adj z a → a = u))
    ```

    It uses C1-LA1's frozen `indepFamily` and `transportRel` byte-identically. It is new in `E993Transport`, is a `lemma`
    with no certificate of its own (R29-N-12), and depends on nothing except the frozen definitions.
  - **Draft terminal statement for a later cycle** (sketch only, not a contract). With `gk k : SimpleGraph (Fin (3*k+5))`
    the explicit tree, and `hT : (gk k).IsTree` proved as a separate lemma (connectivity and acyclicity):

    `theorem gkUnreachableGapTwo (k : ℕ) (hk : 3 ≤ k) : C5LA1.crossingIndex (gk k) + 2 ≤ k + 3 ∧ 3 * (k + 3) < 2 * (gk k).indepNum + 1 ∧ (∑ A ∈ indepFamily (gk k) (k+3), (activeWeight (gk k) (favorableLeaves (gk k) (k+3)) A : ℤ)) − ∑ A ∈ (indepFamily (gk k) (k+3)).filter (fun A => ∃ B ∈ indepFamily (gk k) (k+4), transportRel (gk k) B A), (activeWeight (gk k) (favorableLeaves (gk k) (k+3)) A : ℤ) = 2`

    **Fences:** a family scope note on (HALL), not (HALL); mechanism ≠ aggregate; it asserts nothing about the sign of
    `S(G_k, k+3)`; no RTree wording. **Carried fragments:** entries 1–14 (`C4LA1.*`, `C5LA1.*`) and
    C1-LA1's eight `E993Transport` definitions. No new award this cycle.

**Contract-ready award groups in orientation F: none.**

## Progress and plateau assessment

material_progress: yes

orientation_plateau: no

- **The progress is real but narrow.**
  - A new seat theorem at `proved_informal`: E1–E2, `x(G_k) ≤ k+1` and exact eligibility of `(G_k, k+3)`.
  - A critic-attributed, fully proved family statement (Corollary G). It closes the Cycle 1-named item (b) for `G_k`: on
    infinitely many eligible rows, the (HALL-COND) right-hand side at `X = I_{p+1}` is exactly 2 below the scalar target's.
  - A structural reduction of the selector question to lower-window strict decrease (E8).
  - New adversarial findings that narrow the search:
    - `PPC(7,2)/12` and `CB(4,4)/14` saturate with deletion arcs alone;
    - the P8 screen is a one-sector statement;
    - the heterogeneous family was never tested at an eligible row;
    - the pendant-pair sector margin is at least +7 to `n ≤ 600`.
- **None of this moves (HALL).** No decisive event is in view from F: there is no confirmed (CUT) and no candidate, and
  (HALL) is not formally verified. Under `SOLUTION-CONTRACT.md` §5, the plateau test (no material progress, no new
  `proved_informal` lemma, no new adversarial finding) fails on all three counts for F. So orientation F is not on plateau
  this cycle.
- **Caution for the synthesis.** F's two routes are converging on "saturates with deletion arcs alone" everywhere
  computable. A third cycle of the same searches without a coarser proved lift would be repeated-census evidence under fence
  §3.4 and ruling 13.

## Headline assessment

headline_resolved: no

status: still_open

Per statement, at orientation F's evidence grade:

| Statement | Status | Reason |
|---|---|---|
| (HALL) | `still_open` | No informal proof at any scope in the portfolio, and no deficient cut that I have replayed. Every row I replayed saturates. |
| (WID) | VERIFIED `formally_verified` (C1-LA1) | Not re-adjudicated. Every F instrument's assertion holds. |
| (HALL-COND) at `X = I_{p+1}` on `G_k` | proved (informal) | Corollary G: the right-hand side is exactly `capacity − 2`. I verified the proof at full scope; critic-attributed, second read owed. Whether it holds on the family, i.e. `S(G_k, k+3) ≤ −2`, is `still_open` in general and bounded true on `G_3..G_5`. |
| `T(m,2)` analogue | conditional | Premises bounded. |
| Selector lemma "`F_p(T)` = all leaves" | `still_open` | Reduced by E8. |
| Outcome-B templates (NMP/SW/INV/REC/BUD) | none in F | — |

The primary aggregate is untouched.

## Next-route allocation

**Exact remaining obligation (orientation F).** Either exhibit a tuple `(T, p, X)` meeting every condition of
SEMANTIC-CONTRACT §1.2 (CUT) with a mixed-relation deficit, or show the deficit cannot occur where it is first possible. The
first possible place is the subfamilies `X ⊄ X_sec` of `CB(8,86)`/460 (then `CB(8,89)`/476 and `CB(8,92)`/492) under
(D) ∪ (S), together with the unknown smallest eligible general tree of order 20–1464 carrying a deletion-deficient
subfamily.

1. **`C3-F-01 FULL-ROW MIXED-FLOW ADVERSARY ON THE SECTOR-DEFICIENT CB ROWS`** (F, with U2's lift). Compute the exact
   max-flow of the full (D) ∪ (S) network, all arm states and all subfamilies, at `CB(8,86)`/460, then 476 and 492. Use a
   quotient admissible under ruling 16:
   - U2's equitable-partition lift, if Cycle 2 admits it at `proved_informal`; or
   - `S_d ≀ S_m` orbits via (INV)'s value form, as validated here.

   On any quotient deficit, exhibit the invariant original cut (`X`, `N(X)`, both sums) with two instruments. Also test
   deletion-only full rows at `CB` sizes `114 < n < 1465` for sectors other than root-plus-arm.

   *Could close in one cycle:* a (CUT) candidate (decisive after a second read), or the first exact row where switch arcs are
   load-bearing and saturate, the object that neither Cycle 1 nor Cycle 2 has delivered.
2. **`C3-F-02 FAMILY-SEPARATION CLOSURE AND REGISTRATION PACKAGE`.**
   - Isolated second read of Lemma F, Lemma U and Corollary G as written in C-F2-U and C-F2-T.
   - Alias check against `control/CLAIM-IDENTITY.run-local.json`; register the predicate-form `G_k` key.
   - Prove the two `T(m,2)` premises through the block recurrence `P_{j+1} = (1+3y+y²)P_j − y²(1+y)P_{j−1}`, with a mode or
     mean estimate plus a finite check, since the bound is tight for `m ≤ 18` and slack after.
   - Optionally, prove `S(G_k, k+3) ≤ −2`.
   - Retire the selector item (a) as a route object, recording E8. A refutation would be a non-unimodal tree, and a proof
     needs lower-window strict decrease.
   - Lean-minded seats could compile N10 (the `exists_transportRel_iff` draft) against C1-LA1's frozen definitions.

   *Could close in one cycle:* one or two registered `proved_informal` family keys (the `G_k` key, and the `T(m,2)` key if
   its premises close), plus a sorry-free companion lemma.

## Artifact inventory

All files are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-adj-F/`.
- Standard library only; exact integers; `sys.dont_write_bytecode` throughout, and no `__pycache__` was written.
- No network and no install.
- No seat or critic code was imported. The Part D audit was copied out and run in `replay_partd/`.
- Two background jobs ran (PIDs 48053 and 48479, via `nohup`). Both completed, and `kill -0` reports "no such process" for
  each. No job is running at this write.

| File | SHA-256 | Role |
|---|---|---|
| `adj_core.py` | `b3d9d8043c9e3b4aa4e114eaf0a3577092829aad67593bfc012f463afb89999c` | own instrument: tree test, forest DP, `x` through `α`, `F_p`, `S` via `H_v`/`R_v`, `w_F`, (D) ∪ (S), Dinic |
| `adj_validate.py` / `adj_validate.json` | `7b47324b85256648efeb104ae478b3a06fce464cb0a0ea6941c51bb6f1d0b925` / `9dc2465ffd02373c7362408083e96282fe4203de051f474d0ebd987d983816a2` | fixed points; Dinic against brute min-cut (1,484 comparisons, 572 deficient, 0 mismatches) |
| `adj_f2.py` / `adj_f2.json` | `78a55f5dca6b44099a0da28880aae685676f3d2825855ce8fa04ab2f90f57d67` / `1c927fb76647ba80525d684d76012bd162b85e2974511111037b32748b89d40f` | `G_k`/`T(m,2)` rows, unique unreachable targets, A1–A4, Lemma F, `T(m,2)` ranges |
| `adj_ppc.py` / `adj_ppc_validate.json` / `adj_ppc_L7_k2_p12.json` / `run_ppc72_p12.log` | `d945aac6c357215e9be77e34c33ef2e5a769e86c331131d766f8ab0c6fd3414e` / `bb9eede2e7a86e778bc77a2be2fb746f23f283ca9ed0d1808b8358336c5bdeb6` / `7739129cf44b3fc111cdd916355d0e093401a9eec4f383fc7ddeb7e2ba7610fb` / `72dc3f70aa49386d3764c9d2db04dc4ec5d9546761b80cb61cdf53c2b75b3003` | PPC orbit quotient (literal-relation arcs); 176 brute comparisons; `PPC(7,2)/12` result (`python3 adj_ppc.py row 7 2 12`) |
| `adj_pairq.py` / `adj_pairq_validate.json` / `adj_CB_4_4_p14.json` / `run_cb44_p14.log` | `8cd45b0c4b112156c659dbcb4acba7a8ad7d18da7a926f501862a3511e392872` / `37c43eca44a4a4739f950e6cfa789fbede9971751c813bc29ea385c6dd86aa54` / `72576d72d5a0441dcf397b3c2b766d1155d6e198d80e6990f0e7de6bc1d7fe09` / `809f1a44ea80cc9a3730ad23c6c9f16f96ebe55a2dee0491b5421accc5ab6a14` | generic pair-group quotient; 132 brute comparisons on CB; `CB(4,4)/14` result (`python3 adj_pairq.py row 4 4 14`) |
| `adj_cb_boundary.py` / `adj_cb_params.txt` / `adj_cb17_p10.txt` | `5efd0ac602250abe5e1f923d6beccb6f117c7570047b458dcdc1437024877149` / `397236fb01b69367639e1a59ec246b4d213b8f88cd55419b330b5e436256cf1b` / `385e150c4c1153e496807c69d64db22d2e686c206e9d8981fd0afbda9eea1a56` | `CB(8,86/89/92)` parameters and P8 hits; `CB(1,7)/10` row |
| `replay_partd/` (`crit_partd_audit.py`, `f2_lib.py`, `f2_part4.py`, `f2_families.py`) | `c4e4fffc…`, `cf304f18…`, `8a7f4d3c…`, `eb456ce4…` (identical to their sources) | copy-out replay of the Part D dedup: `1143 / 588 / max 37 / min 11` |

Replay: `cd` into the directory above, then run
`python3 adj_validate.py && python3 adj_f2.py && python3 adj_ppc.py validate && python3 adj_ppc.py row 7 2 12 && python3 adj_pairq.py validate && python3 adj_pairq.py row 4 4 14 && python3 adj_cb_boundary.py params && python3 adj_cb_boundary.py row`
(well under ten minutes in total). Wall-clock values are not part of any hashed JSON payload.
