# Orientation Adjudication

Adjudicator for orientation U (formal / structural), Cycle 2 Stage 5, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`;
Erdős #993, correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate). Date
2026-09-26. Portfolio: returns `U1` (`C2-U-01 LEAN-INV-AND-SECTOR-FORMALIZATION`) and `U2` (`C2-U-02
EQUITABLE-PARTITION-LIFT-AND-CB-SWITCH-NETWORK`), and their cross-orientation critiques `C-U1-T`, `C-U1-F`, `C-U2-T`, `C-U2-F`.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The harness put the root `CLAUDE.md` and
the user auto-memory index into my context at session start. I did not open either as a source, and nothing below relies on
them. I wrote no conversation log, because the dispatch confines writes to this file and to `scratchpad/c2-adj-U/`.

**Read boundary.** I read:
- the dispatch, after verifying its digest;
- the protocol, the capsule and its 20 members;
- the inventoried scratch of U1, U2 and the four critics, copied out first where I replayed it;
- frozen sources under `sources/`: `c1-stage7-sources/U2-Main.lean`, the first-interior `Main.lean`, `mathlib-binding/PIN.json`,
  and `lower-region/instruments/cb-switch-cut/RESULTS.json` (its digest was verified against `SOURCE-DIGESTS.json` before
  comparison);
- in the shared Mathlib project, only `lean-toolchain` and the `git rev-parse` of `.lake/packages/mathlib`.

My listings were non-recursive and confined to granted scratch directories. My `grep`s ran only on copies inside my own scratch.
I did not read:
- `runs/`, `second-reads/` or `cycles/cycle-1/`;
- any other orientation's returns, critiques or adjudication;
- any synthesis, any other experiment root, or any external source;
- the controller's `CF-REPLAY-*.json` files, which are not capsule members.

Read-boundary disclosures: none.

## Identity and seal audit

- Dispatch `control/dispatch/c2-stage5/DISPATCH-ADJ-U.md`: SHA-256 `400e5b9f…9886`. I verified it before reading, and it matches.
- **Capsule seal** (`control/c2-adjudicator-capsules/U-PACKET-MANIFEST.json`): I recomputed it canonically (key-sorted,
  `(",", ":")`, no `seal_sha256`, no trailing newline) and got **`c9bd8d28379ae51e13f8f5fbab176d878a81a05cd64b6be55631f952ce1ee374`**,
  which matches. All 20 members match on bytes and SHA-256.
- Stage manifest seals, all recomputed and matching their fields:
  - Stage 2: `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da` (1026 files).
  - Stage 3: `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d` (35).
  - Stage 4: `025bf11c94064441d2792f39513d96fc16dc12f39f6e1aac8df5c5e4d8fe45ff` (54).
  The two U returns and four U critiques match their entries in these manifests. The Stage 3 and Stage 4 admission reports admit
  them. Two cosmetic exceptions on the model-disclosure wording (U1 and U2) are accepted as filed.
- `PATH-CHECK-U.json`: 0 findings.
- **Carried Lean text.** U1's project, both critics' projects and my replay project carry the same
  `LeanProof/Main.lean`, SHA-256 `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` (45,610 B).
  - I cannot certify from inside my grant that this is C1-LA1's award file. The award's receipt is under `runs/`, and neither
    the Stage 2 manifest nor any capsule member carries that digest. Both U1 critics made the same observation.
  - What I did check: all 13 carried `def` header lines before `namespace E993Transport` occur verbatim in the frozen
    first-interior `Main.lean` (`8d864da2…`). All eight `E993Transport` definitions (`indepFamily`, `tagWitnesses`,
    `activeWeight`, `layerWeight`, `favorableLeaves`, `transportRel`, `IsSaturatingFlow`, `WeightedHall`) occur as verbatim
    blocks in the frozen `sources/c1-stage7-sources/U2-Main.lean` (`110c2751…`).
  - Stage 7 must bind `86b59c6c…` to the C1-LA1 receipt (ruling 14) before any award.
- **Pin.** The toolchain is `leanprover/lean4:v4.32.2`.
  `git -C <shared>/.lake/packages/mathlib rev-parse HEAD` gives `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals
  `PIN.json`. U1's recipe (`git -C <shared project> rev-parse HEAD`) fails as written. I strike the method, not the value,
  as both U1 critics did.
- **Model identities.** Routes report `claude-sonnet-5`; critics report `claude-opus-5-5[1m]`. Both are consistent with
  `C2-ALLOCATION.md` and CF-3.
- **Process record** (none of these bears on the mathematics):
  - U1 disclosed two pre-grant slips (a VerityOS-root `find` of names only, and `ls -la` of the run root).
  - U2 disclosed a `__pycache__` write under `sources/` (deleted; the controller re-hash found 981/981 intact, CF-2) and one
    digest verified after reading.
  - U2's shipped replay recipe (`python3 run_all.py`) would recreate the bytecode write, because `cb_common.py` puts
    `sources/lower-region/inputs` on `sys.path`. Both U2 critics found this. Its claim that "every module the entry point
    imports already sits beside it" is **struck**. Any replay instruction must use `python3 -B`; mine did, and
    `sources/lower-region/inputs/` holds only the `.py` afterwards.
  - C-U1-F listed `scratchpad/c2-U1-replay/` (names only), outside its grant, and disclosed it.
  - C-U1-T noted, correctly, that the Stage 3 read-boundary disclosures record was missing from its capsule. This was a
    controller lapse (CF-3). The record is in my capsule, and its U1/U2 entries agree with the returns' own disclosures.
- **Controller facts** CF-0 to CF-U4 are weighed as one more replay, never as authority. Each U-relevant fact (CF-U1, CF-U2,
  CF-U3, CF-U4) agrees with my own replay below.

## Route-by-route decisions

### U1 — `C2-U-01 LEAN-INV-AND-SECTOR-FORMALIZATION`: typed verdict `retained_narrowed` (route verdict `compiled` stands)

**My replay.** I built a copy-out project in `scratchpad/c2-adj-U/LeanProject/`. It holds U1's `Main.lean`/`INV.lean`
unchanged, plus both critics' advance files. Mathlib is bound by manual symlink. I ran `cd` into the project before
`lake build`, and did no `lake update` or `lake clean`.
- `lake build` completed (8659 jobs, EXIT 0). It rebuilt `LeanProof.Main`, `LeanProof.INV` and `LeanProof.CritINV` from
  source.
- `lake build LeanProof.CritAdvance` completed (8657 jobs, EXIT 0).
- `#print axioms` on U1's 30 proved declarations reproduces U1's table verbatim. 28 report
  `[propext, Classical.choice, Quot.sound]`; `isGraphLeaf_map_aut` and `map_map_symm_self` report `[propext, Quot.sound]`.
- There is no `sorry`, `admit`, `native_decide`, `decide` or `axiom` in `INV.lean`, `CritINV.lean` or `CritAdvance.lean`.
- The only warnings are linter warnings (unused section variables, unreferenced binders, `push_neg` deprecation).

| U1 claim | Decision | Evidence |
|---|---|---|
| Part (a): `favorableLeaves_map_aut` (a Finset equality at every `p`), `activeWeight_map_aut` (maps both `F` and `B`, under `hF`), `transportRel_map_aut` (a genuine iff; (S) transported literally), with 12 supporting lemmas | **retained, `compiled`** | My replay, plus both critics' replays. Statements read against SOLUTION-CONTRACT §2: `activeWeight` counts active tags (`¬Disjoint (B.erase v) W_v`), not `|F ∩ B|`; `transportRel` is (D) ∪ (S), neither wider nor narrower. |
| Part (b): `phi := supply − cov` in ℤ; `cov_submodular`, `supply_modular`, `phi_supermodular` (right direction), the maximizer lattice, `canonMin`/`canonMax` are maximizers | **retained, `compiled`** | Same. Supermodularity holds on all of `Finset (Finset V)`; the lattice is taken inside `domain = (I_{p+1}).powerset`. |
| "No `IsTree`, no eligibility" | **retained** | Checked on the file. INV's DAG needs neither. |
| Count literals: "11 lemmas + 1 theorem-labelled target", "16 declarations", "27 lemmas and 3 theorem-labelled targets", "30 declaration names" | **struck** | The file has 23 `lemma`, 7 `theorem` (30 proved) and 9 `def`, so 39 names. I re-counted, and this agrees with both critics. |
| "all proved" (two section headings); "proved for a completely general finite simple graph" | **struck as wording** | The correct word is `compiled`. U1's grade table already says `compiled`, so no grade moves. |
| `phi` docstring: "`WeightedHall` is `∀ X, φ(X) ≤ 0`" | **unproved in U1's file; closed critic-side** | `weightedHall_iff_phi_nonpos` (C-U1-T), compiled in my replay. |
| Draft-contract entry lists ("entries 1–13, 18, 42"; entries 1–6, 8, 13, 18 for `favorableLeaves_map_aut`) | **struck** | These mix first-interior and C1-LA1 numbering (both critics). Stage 7 re-derives the list in C1-LA1 numbering. |
| "per C1-LA4" (NM's informal source) | **struck** | No award C1-LA4 exists in r30. NM's informal proof is in the Cycle 1 route and critique record. |
| Remaining-obligation item 5: take `X := canonMax` as the witness | **refuted** | See the reconciliation below. The positive witness is `canonMin` (`X_min`). |
| Item (c) `exists_aut_invariant_deficient_of_not_weightedHall` and item (d) NM "not attempted" | **retained as an honest record** | (c) is now closed critic-side at `compiled` (both critics, independently). (d) has no Lean text anywhere. |

### U2 — `C2-U-02 EQUITABLE-PARTITION-LIFT-AND-CB-SWITCH-NETWORK`: typed verdict `retained_narrowed` (route verdict `bounded_evidence` stands)

**My replays.**
- U2's `run_all.py`, copied out and run with `-B`, reproduces the combined digest `218b5d3b…ba4c`. Its `run_all_RESULT.json` is
  byte-identical to the shipped file.
- My own instrument (`adj_inst.py`) is standard library with exact integers and shares no code with U2 or the critics:
  - a literal CB builder;
  - a tree test with acyclicity (union-find) and connectivity checked separately;
  - a generic forest DP for `i_k(T − D)`;
  - `x` through rank `α`;
  - the strict selector `Δ_p(T − v) < 0` on the original tree;
  - `S` from `q_v = i(H_v) − i(R_v)`;
  - supply and capacity from my own derivation of the active-weight GF and, on small rows, by literal enumeration with literal
    `w_F`;
  - the literal (D) ∪ (S) network with Dinic max-flow;
  - colour refinement from (side, `w_F`).
- The GF `W(x) = x²(1+2x)^{dm} + m·d·x²(1+x)^{d−1}(1+2x)·Br^{m−1}`, with `Br = (1+2x)^d + x(1+x)^d`, matches literal
  enumeration at every rank on CB(1,3), CB(1,4), CB(2,2), CB(2,3), CB(3,2) and CB(1,7). It is algebraically U2's `W` and
  both critics' `W`.
- `K_{1,12}` at `p = 8` reproduces: α 12, x 6, |F| 12, 1980 / 3960, `S = −1980`, flow 1980.

| U2 claim | Decision | Evidence |
|---|---|---|
| **Candidate 1** `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` (iff; finite bipartite relation; supply and capacity constant on classes; two-sided local regularity `r`, `r'`) | **retained: proof complete, verified by me; `proved_informal` STATED**, pending an isolated second read (ruling 18) | (⇒) is class summation. (⇐) is uniform averaging `F/(|C_s| r)`, using the double count `|C_s| r = |C_t| r'`; rows are exact and columns `≤ cap`. Integrality comes from integral max-flow or TU. Both critics re-proved it independently. |
| Candidate 1 "is **not** (LIFT) … a different task"; "(LIFT)'s proof needs supermodularity" | **corrected** | Every orbit partition of a group preserving the relation and the weights is equitable. So Candidate 1 **strictly generalizes (LIFT)'s lifting direction**, and (LIFT) is its orbit special case. The supermodular maximizer belongs to (INV) and the converse, not to (LIFT). Both critics independently. Attribution: (LIFT) is Codex's; the generalization is U2's. |
| Toy `C4 ⊔ C6`: 4 side-respecting Aut orbits, an equitable 2-class partition, `f ≡ 1/2`, a perfect matching | **retained** (`bounded_computation`) | Replayed by both critics and by my run of `run_all.py`. The wording "not unions of automorphism orbits" is corrected to "not the orbit partition of any automorphism group" (C-U2-F A2). |
| CB(2,2)/5 mechanism check (not eligible: `x = 4`, `α = 7`) | **retained as a mechanism check only** | My replay: 41 / 152 sets, supply 76, capacity 148, `S = −72` (q-side), mixed = deletion-only flow = 76. |
| **Candidate 2** "any equitable partition must resolve the per-arm `(a_i, b_i)` … 54 types are the genuine minimal granularity"; docstring "no partition strictly coarser than the … orbit histogram is equitable" | **struck**; narrowed to its exact witness | See the reconciliation below. The narrowed statement ("the marginal-totals partition of the full CB network is not equitable; configurations A and B on CB(5,2) are separated in every admissible equitable partition") is `bounded_computation`. Its witnesses have `w = 0`, so they sit off the flow-relevant network (C-U2-T). |
| Target rows CB(8,86)/460, CB(8,89)/476, CB(8,92)/492: supply, capacity, `S` | **retained** (`bounded_computation`) on independent evidence; **U2's own check struck** | U2's `cb_target_rows.py` line 49 sets `S = supply - capacity` and then "confirms" it (ruling 17). My instrument computes `S` on the q-side and matches U2's literals digit for digit, with both `supply − capacity = S` and layer-level `supply = Σ_F q_v(p)`, `capacity = Σ_F q_v(p−1)`. It also matches both critics. CB(8,92)/492's `S` equals the frozen `RESULTS.json` `aggregate` (`873cf922…`). |
| `|F|` = 689 / 713 / 737 (= `dm + 1`) | **values retained; U2's evidence struck** | U2 hard-codes `favorable_count = d*m + 1` (line 50). My selector: `v` and three `c_ij` representatives are strictly favorable; the `c_ij` form one `S_d ≀ S_m` orbit, and their `q` coincide exactly. C-U2-T checked leaf by leaf and C-U2-F by representatives. |
| CB(2,5)/10 supply `275920`, capacity `412400` (RETURN table) | **struck** | Correct: **259980 / 396460**, by my literal enumeration (88,506 sources, 185,256 targets), my GF, U2's own shipped JSON, both critics and CF-U1. `S = −136480` is right. The error is a transcription error in RETURN.md only. |
| "cross-checked against literal brute force on four small instances"; "tree-DP cross-check on CB(8,86)" | **struck as shipped evidence** | No shipped code performs these checks. The facts are true on critic and adjudicator evidence. |
| "a full scan of `d ≤ 4, m ≤ 5` found **no** eligible CB with `n ≤ 48`"; "zero eligible … `n ≤ 24`"; "the smallest eligible CB row is CB(2,5)/10" | **struck** | The smallest eligible CB row is **CB(1,7)/10** (`n = 24`, `α = 15`, `x = 8`, window [10, 10]). U2's `(2α−1)//3` drops the window top whenever `3 | α`, and would drop CB(1,7)/10 itself. The dropped top-of-window rows include CB(3,5)/14 and CB(4,4)/14. My scan, C-U2-F and CF-U2 all agree. |
| "orbit space has exact size `C(m+53, 53)`" | **struck as an orbit count** | The binomials are exact, but they count branch-type histograms over all ranks for one head, not orbits of a layer. Both critics independently give identical per-layer source-orbit counts (for example 32679711368341187783680131875634392813 at 86/460). I did not replay these, but two independent instruments agree digit for digit. "Out of reach" stands. |
| "switch arcs … load-bearing … first at CB(8,86)/460" | **narrowed** to "first within the CB family" | My closed-form scan (`P = x(1+x)(1+2x)^{dm} + (1+2x)Br^m`, validated against the DP; P8 record criterion `3p < 2dm + 5`) finds no sector-deficient eligible CB row for `d ≤ 6`, `m < 400`. The first rows are `d = 7`, `m = 109` (`n = 1638`, `p = 510`) and `d = 8`, `m = 86`. This agrees with C-U2-F A9. Over all trees, "first" is unsupported. |
| Obligation (c): a load-bearing-switch saturation, or a quotient deficit, on the three target rows | **not achieved** (U2's own statement is correct) | No certificate of either kind exists at any grade. |

## Cross-route reconciliation

**Paired-critic disagreements, claim by claim.** Verdicts are not averaged, and replays are weighed over self-reports.

1. **U1: which canonical maximizer is the invariant, positive deficient witness?**
   - C-U1-T and C-U1-F agree: `X_min` is the witness; `X_max` fails positivity.
   - I verify the structural argument:
     - If `B ∩ F = ∅`, then `w(B) = 0`, and every target of `B` is tag-free. A deletion target is a subset of `B`. A switch
       target inserts a vertex with two neighbours in `B`, which a degree-one tag cannot be.
     - Hence `φ(X ∪ {B}) = φ(X)` for every maximizer `X`.
     - So **`X_max` contains every tag-free source, always**. On CB(8,92) at 492 the 736 supports form such sources.
   - My replay on `P_3 ⊔ K_{6,3,3,3}` at `p = 4` agrees with both critics. This graph is not a tree and not eligible (`x = 3`,
     `α = 8`), so it is a structural instance only. Its data: `F = {0, 2}`, supply 46, capacity 48, `S = −2`, WID holds, max
     flow 36, `maxφ = 10`.
     - `X_min` has 20 members, 0 of weight 0, and `φ = 10`.
     - `X_max` has 71 members, 51 of weight 0 (all of the graph's weight-0 sources), and `φ = 10`.
   - **Resolved: `X_min`.** U1's item 5 is refuted.
2. **U1: the two critic advances.** These are not in disagreement. Both compile in my replay, both use `X_min`, and both prove
   invariance by "`γ·X_min` is a maximizer, so `X_min ⊆ γ·X_min`, then equal cardinality". Differences:
   - C-U1-T additionally proves `weightedHall_iff_phi_nonpos`, `canonMax_famMap` and `weightedHall_iff_invariant`.
   - The two files define colliding names (`map_symm_map_self`, `covered_mono`, `canonMin_pos`, the terminal theorem), so a
     Stage 7 carry takes **one** of them. I recommend C-U1-T's `CritINV.lean`, because it is strictly more complete.
   - Minor: C-U1-F's "`#print axioms` for all 10 new declarations" leaves out 2 of its 12 proved declarations
     (`liftAut_apply`, `map_symm_map_self`). That is harmless, since the terminal theorem's axiom list covers its dependencies.
3. **U2: does the equitable lift gain anything over orbits on CB networks?** This is a genuine disagreement.
   - **C-U2-T (C2)** says no: on the flow-relevant reduced networks, colour refinement equals the orbit partition on sources.
     It advises the successor "not to look for" a coarser equitable reduction.
   - **C-U2-F (A3)** says yes at `d = 1`: on the eligible CB(1,7)/10, CB(1,8)/11 and CB(1,9)/12 it finds 11 / 13 / 15 classes
     against 147 / 224 / 324 orbit classes. It reports equality with orbits only for `d ≥ 2`.
   - My replay:
     - CB(1,7)/10: colour refinement gives **5 source + 6 target classes (11)** against **57 + 90 (147)** orbits, and the
       partition is explicitly equitable with constant weights. Every source has positive weight, so the reduced network is
       the full network and the coarsening persists there (5 vs 57 on sources). The heads `s` and `v` merge. The quotient
       max-flow is 29190, equal to the supply and the original max-flow.
     - CB(1,4)/6: 17 / 37 against orbits 17 / 38, which is C-U2-T's datum.
     - CB(2,2)/5: 15 / 39 full (54 against 57 orbits) and 15 / 24 reduced, which agrees with both critics.
   - **Resolved:** both critics' raw data are right. C-U2-T's generalization is **narrowed** to "on the `d ≥ 2` instances
     tested, bounded". It is refuted at `d = 1` (C-U2-F, replayed). For the `d = 8` target rows, the bounded prior is that
     colour refinement equals orbits, but it is untested at `d ≥ 6`. U2's branch 1(i) is disfavoured, not refuted, at `d = 8`.
4. **U2: smallest eligible CB row.**
   - C-U2-T's certification table marks "smallest eligible CB row is CB(2,5)/10" as backed.
   - C-U2-F says CB(1,7)/10, and CF-U2 agrees.
   - **Resolved by replay: CB(1,7)/10 (`n = 24`).** C-U2-T's line is struck. U2's scan stopped at `m ≤ 5`, so it never reached
     `d = 1`, `m ≥ 7`.
5. **U2: "first exact full-network flow on an eligible CB row".**
   - C-U2-T (C3) computed CB(2,5)/10: 1,317,906 arcs, mixed = deletion-only = 259,980.
   - C-U2-F computed CB(1,7)/10 in the same stage.
   - My replays: CB(2,5)/10 mixed = deletion-only = 259,980, saturating (973,566 deletion arcs). CB(1,7)/10 has 8,673 sources,
     22,197 targets, 124,593 mixed arcs and 95,403 deletion arcs, supply 29190, capacity 58002, `S = −28812` (q-side), and
     mixed = deletion-only = 29190.
   - **Resolved:** "first" is struck as a priority claim; these were two concurrent critic computations. **Neither row has
     load-bearing switch arcs**. Both satisfy `3p ≥ 2dm + 5`, so by the P8 record the sector is not deletion-deficient.
     Neither meets U2's obligation (c).
6. **U2: the Hall-form converse for equitable quotients.** C-U2-T (C1) and C-U2-F (A1 strengthening) state it independently and
   identically, so there is no disagreement. I verify it:
   - For a union `X` of source classes, `N(X)` is exactly the union of the target classes joined to some class of `X`. The
     `⊇` direction uses `r > 0 ⇒ r' > 0`.
   - So the original deficit equals the quotient deficit with clone weights.
   - With Candidate 1 and max-flow/min-cut on the finite quotient: **(HALL-COND) for every `X` ⇔ (HALL-COND) on every union of
     equitable classes ⇔ quotient Hall**.
   - A quotient deficit then yields an exhibited class-union original cut with the same sums. This is exactly what ruling 16
     requires of an equitable-quotient deficit.
   - It is graded `proved_informal` STATED and is **critic-attributed to C-U2-T and C-U2-F jointly**. It needs its own
     isolated second read.

**How U1 and U2 meet.** The registered (INV) key has two halves:
- "Hall ⇔ Hall on `Aut`-invariant families". Its Lean text now exists: U1's parts (a) and (b) plus the critics' closing theorem.
- "⇔ quotient Hall". Its `(⇐)` direction is (LIFT) in Hall form.

An orbit partition is equitable, so item 6 above proves the quotient half in its **orbit special case**, and it does so without
(LIFT) or supermodularity: the class-union identity alone gives "invariant-family Hall ⇔ quotient Hall". Combined with the
compiled `weightedHall_iff_invariant`, this is a short, flow-free Lean route to the whole (INV) key. That is the next-route plan
below (adjudicator-derived, STATED).

**Controller facts.** CF-U1 (CB(2,5)/10 numbers), CF-U2 (window top; CB(1,7)/10), CF-U3 (the `X_min` point and the two scratch
compiles) and CF-U4 (Candidate 1 generalizes (LIFT); Candidate 2 overclaimed) all agree with my replays. None is used as
authority.

## Established results

**Fidelity first.** Every number that survives in this portfolio uses:
- the active weight `w_F` (a tag counts iff `(B ∖ {v}) ∩ W_v ≠ ∅`);
- the literal relation (D) ∪ (S);
- `F = F_p(T)` from `Δ_p(T − v) < 0` on the original tree at rank `p`;
- `x` through rank `α`;
- `supply − capacity = S`, asserted with `S` computed independently of the weight side.

U2's own `supply − capacity = S` assertion was non-falsifiable. That strike is on evidential standing; no surviving number
depends on it.

**Exact theorems (informal; hypotheses named)**
- (E1) **Invariant positive deficient cut.** Scope: any finite simple graph `G` (`[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`),
  every `p : ℕ`, `F = favorableLeaves G p`. If `¬ WeightedHall G F p`, then `X_min` (the least maximizer of `φ`) satisfies:
  - `X_min ⊆ I_{p+1}`;
  - `X_min` is invariant under every `γ : G ≃g G`;
  - every member of `X_min` has `w_F > 0`;
  - `Σ_{N(X_min)} w_F < Σ_{X_min} w_F`.

  Corollary: WeightedHall holds iff it holds on every `Aut(G)`-invariant family, hence on every `Γ`-invariant family for any
  `Γ ≤ Aut(G)`.
  - Hypotheses consumed: finiteness, through the instances. No `IsTree` (neither connectivity nor acyclicity), no eligibility,
    no `p ≥ 1`. Invariance enters as `F_p(G)` being `Aut`-invariant (`favorableLeaves_map_aut`), with the leaf guard `hF`
    load-bearing in `activeWeight_map_aut`.
  - Grade: the INV key's content at `proved_informal`, and **kernel-checked in scratch** (see the compiled declarations
    below).
  - Attribution: U1 for parts (a) and (b); C-U1-T and C-U1-F for the closing theorem (critic-attributed). The mathematics is
    the Cycle 1 (INV) record's.
- (E2) **Equitable-partition flow lift (Candidate 1).** Scope: finite `S`, `T`, relation `R`, integer supply and capacity
  constant on classes, and two-sided local regularity. A saturating integral flow exists iff a saturating quotient flow exists.
  - It strictly generalizes (LIFT)'s lifting direction.
  - Grade: `proved_informal`, **STATED** (first stated at Stage 3; not registrable until an isolated second read, ruling 18).
  - Attribution: U2. (LIFT) is Codex's.
- (E3) **Hall-form converse and class-union Hall** (item 6 of the reconciliation). Grade: `proved_informal`, **STATED**,
  critic-attributed (C-U2-T and C-U2-F).
- (E4) **`X_max` contains every tag-free source.** This holds for any graph, any `p`, and any tag set of degree-one vertices.
  Grade: `proved_informal`, STATED, critic-attributed (C-U1-F F-1 and C-U1-T finding 2), verified by me. It is a structural
  fact that decides which witness a formal statement may use.

**Conditional reductions.** None new. (FLOW⇒SIGN) and (HALL⇒FLOW) are Cycle 1 formal companions and are cited, not re-proved.

**Compiled scratch declarations** (sorry-free; axioms ⊆ `{propext, Classical.choice, Quot.sound}` per my `#print axioms`; no
grade until a governed award, R29-N-12):
- U1 `INV.lean` (`174d84c3…`): 30 proved declarations (23 `lemma`, 7 `theorem`) and 9 `def`. **Authored** in-run, on top of
  `Main.lean` (`86b59c6c…`), which is **carried byte-identically** from C1-LA1, subject to the receipt binding noted above.
- C-U1-T `CritINV.lean` (`e6cbd7e6…`): 20 proved declarations and 2 `def`, including
  `exists_aut_invariant_deficient_of_not_weightedHall`, `weightedHall_iff_invariant` and `weightedHall_iff_phi_nonpos`.
  Critic-authored.
- C-U1-F `CritAdvance.lean` (`f59126da…`): 12 proved declarations and 1 `def`, including the same terminal theorem with
  `liftAut`. Critic-authored.

**Bounded computations** (all `bounded_computation`, with the full relation (D) ∪ (S) and `w_F`, unless marked otherwise):

| row | n | α | x | p | eligible | |F| | i_p / i_{p+1} | supply | capacity | S | flows |
|---|---|---|---|---|---|---|---|---|---|---|---|
| CB(1,7)/10 | 24 | 15 | 8 | 10 | yes | 8 (all leaves) | 22197 / 8673 | 29190 | 58002 | −28812 | mixed = deletion-only = 29190 |
| CB(2,5)/10 | 28 | 16 | 8 | 10 | yes | 11 (all leaves) | 185256 / 88506 | 259980 | 396460 | −136480 | mixed = deletion-only = 259980 |
| CB(8,86)/460 | 1465 | 775 | 458 | 460 | yes | 689 (all leaves) | — | `5976491406…` (330 digits) | `6050726547…` (330 digits) | `−7423514084…` (328 digits) | not computed |
| CB(8,89)/476 | 1516 | 802 | 474 | 476 | yes | 713 (all leaves) | — | `1925986227…` (342 digits) | `1949561218…` (342 digits) | `−2357499070…` (340 digits) | not computed |
| CB(8,92)/492 | 1567 | 829 | 490 | 492 | yes | 737 (all leaves) | — | `6203194189…` (353 digits) | `6278075232…` (353 digits) | `−7488104307…` (351 digits) | not computed |

- The full integers are in `scratchpad/c2-adj-U/adj_run_RESULT_D.json`. They equal U2's RETURN and JSON literals exactly;
  CB(8,92)/492's `S` also equals the frozen `RESULTS.json` aggregate.
- Attribution: the CB(1,7)/10 row is C-U2-F's; the CB(2,5)/10 flows are C-U2-T's; both rows and the d = 8 aggregates were
  replayed by me. The d = 8 aggregates for 86 and 89 are new exact numbers from U2, now backed by three independent `S`-side
  instruments.
- Other bounded records:
  - the smallest eligible CB row is CB(1,7)/10;
  - the first sector-deficient eligible CB rows by `d` are `d = 7` / `m = 109` and `d = 8` / `m = 86`, with none for
    `d ≤ 6`, `m < 400`;
  - coarsest-equitable against orbit class counts (reconciliation item 3);
  - the narrowed Candidate 2 witness;
  - the CB(2,2)/5 mechanism check (not eligible);
  - the toy.
  None is a proof, and none enters one.

**Imported informal results used.** (LIFT) (`proved_informal`), cited only to place Candidate 1. (INV) and (NM) at their
registered `proved_informal` grades. (WID) and the C1-LA2 companions at `formally_verified`. (FLOW⇒SIGN) is not invoked.

**Record corrections.**
- CB(2,5)/10 supply and capacity are 259980 / 396460, not 275920 / 412400.
- The smallest eligible CB row is CB(1,7)/10.
- The CB eligibility window top is `⌊2α/3⌋`.
- Orbit counts per layer replace `C(m+53, 53)`.
- "C1-LA4" does not exist.
- U1's declaration counts are corrected as above.
- The Mathlib pin is recovered via `.lake/packages/mathlib`.

**Open bridges.** (INV)'s quotient clause has no Lean text. (NM) has no Lean text. The mixed-network Hall on the three
sector-deficient rows is uncertified either way.

## Rejected and narrowed mechanisms

- **Refuted:** U1's plan to take `X_max` as the positive invariant deficient witness. `X_max ⊇` all tag-free sources, always
  (E4). The instance with 51 weight-0 members of 71 was replayed.
- **Struck:** Candidate 2's headline ("any equitable partition must resolve the full `S_d ≀ S_m` histogram"; "genuine minimal
  granularity"; the docstring's "no strictly coarser partition is equitable"). It is refuted at `d = 1` by exact computation
  (CB(1,7)/10: 11 classes against 147 orbits) and irrelevant to lifting, because its witnesses have zero supply.
- **Narrowed:**
  - C-U2-T's "(C2) the equitable lift gains nothing over orbits on CB networks", to `d ≥ 2`, bounded.
  - "Switch arcs first load-bearing at CB(8,86)/460", to the CB family.
  - "First exact full-network flow", to a non-priority record.
- **Corrected framing:** Candidate 1 is a generalization of (LIFT), not "not (LIFT)". A registration must record (LIFT) and
  (INV)'s quotient clause as its orbit special case, a partial mathematical alias on that sub-case. The claim-distinction must
  say so.
- **No refuted mechanism is revived:**
  - Neither route states (HALL-COND) for any tree relation. The deletion-only flows (CB(1,7)/10, CB(2,5)/10, CB(2,2)/5) are
    diagnostics beside the mixed flows. They use the active weight and are not `E993-R23-LITERAL-DELETE-ONLY-HALL`.
  - (INV) and Candidate 1 are a symmetry/LP reduction of the Hall condition, not a transport mechanism. None of the ten
    §3.2 keys, and not the C6-F4 unit-capacity rule, applies.
- **Other fences:** no closed region is re-proved (the CB rows lie in the lower region, `2p + 3 ≤ n ≤ 4p − 8`); no census value
  enters a proof; there is no RTree wording; (LIFT) never supplies quotient feasibility; `D, C ≥ 0` is never used.

## Lean readiness

**(WID)** was awarded `formally_verified` in Cycle 1 (C1-LA1). Nothing in this portfolio alters it or re-awards it; U1 only
carries its definitions.

**Award group U-A: CONTRACT-READY.** It is a restricted-scope award: the **invariant-family half of (INV)**, not the whole
(INV) key.
- **Terminal theorem (recommended):** `E993Transport.exists_aut_invariant_deficient_of_not_weightedHall`, as elaborated in my
  replay:
  ```lean
  theorem exists_aut_invariant_deficient_of_not_weightedHall {V : Type*} [Fintype V] [DecidableEq V]
      (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ)
      (h : ¬ WeightedHall G (favorableLeaves G p) p) :
      ∃ X ⊆ indepFamily G (p + 1),
        (∀ γ : G ≃g G, famMap G γ X = X) ∧
        (∀ B ∈ X, 0 < activeWeight G (favorableLeaves G p) B) ∧
        ∑ A ∈ (indepFamily G p).filter (fun A => ∃ B ∈ X, transportRel G B A),
            activeWeight G (favorableLeaves G p) A <
          ∑ B ∈ X, activeWeight G (favorableLeaves G p) B
  ```
  Here `famMap G γ X := X.map ⟨fun s => s.map γ.toEquiv.toEmbedding, _⟩`.
- **Companion (no certificate):** `weightedHall_iff_invariant`, "WeightedHall for `F_p(G)` ⇔ Hall on every `Aut(G)`-invariant
  `X ⊆ I_{p+1}`". The synthesis may instead choose this iff as the terminal theorem, since it reads closer to the key's wording.
  The cut theorem is the node the allocation named, and it implies the iff.
- **Hypotheses:**
  - finiteness, through `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]` only;
  - no `IsTree` (neither connectivity nor acyclicity), no eligibility, no `p ≥ 1`;
  - `F` is the carried `favorableLeaves G p`, fixed at rank `p`;
  - no quotient step, so no invariance hypothesis is consumed beyond `γ` being a graph automorphism.
- **Fences for the face:**
  - graph-generic;
  - not a Hall theorem, a flow, or a cut;
  - no sign content, and nothing about `S(T, p)` or the primary aggregate;
  - it asserts nothing about whether deficient cuts exist;
  - (INV)'s quotient clause ("⇔ quotient Hall"; the (LIFT) direction) is **excluded** and stays `proved_informal`;
  - the award registers `formally_verified` only at this restricted scope. The synthesis names it as a scope note on
    `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`, or as a separate `E993-R30-…` key; it never closes the full (INV)
    statement.
- **Attribution:** U1 for parts (a) and (b); C-U1-T and C-U1-F for the closing theorem (critic-attributed; independently
  derived); Cycle 1 (INV) for the mathematics; the first-interior run and C1-LA1 for the definitions.
- **Carried fragments:**
  - C1-LA1 `Main.lean` `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb`, byte-identical. Stage 7 must bind
    this digest to the C1-LA1 receipt, and re-derive the needed-entry list in **C1-LA1 numbering**. Both critics indicate the
    leaf/support layer (their entries 1–4, 6, 18) plus the eight `E993Transport` definitions and entry 24
    (`isGraphLeaf_of_mem_favorableLeaves`).
- **New declarations:**
  - U1's `INV.lean` `174d84c3…`. The terminal theorem's cone includes part (a), `phi_supermodular` → `isMaximizer_inter` →
    `canonMin_isMaximizer`, and the domain/maximizer definitions.
  - C-U1-T's `CritINV.lean` `e6cbd7e6…`: `setEmb`, `famMap`, `mem_indepFamily_map`, `covered_famMap`,
    `activeWeight_map_of_invariant`, `supply/cov/phi_famMap`, `famMap_mem_domain/maximizers`, `canonMin_famMap`,
    `covered_mono`, `canonMin_pos`, `filter_eq_covered`, `weightedHall_iff_phi_nonpos`, and the two theorems.
  - C-U1-F's `CritAdvance.lean` `f59126da…` is an equivalent alternative. Do **not** carry both; their names collide.
  - Stage 7 may prune declarations outside the terminal theorem's cone (for example `canonMax_*`).
- **Stage 7 fidelity checks:**
  - Diff the binder text against the registered (INV) statement and the Cycle 1 Award-group-2 draft. These are outside my
    grant, and outside both critics' grants.
  - Confirm that the positivity conjunct is stated for `X_min`.
  - Confirm that the `filter` instance difference (`open Classical in` in `WeightedHall`, `open scoped Classical` in the new
    files) is bridged, as `filter_eq_covered` does instance-agnostically.
  - Confirm `#print axioms` on the terminal theorem against the build log.
- **Informal proof at statement granularity, with a closed DAG:** (a) equivariance of `I_j`, `F_p`, `w_F`, `N(·)` → `φ` is
  `Aut`-invariant; (b) `cov` submodular and `supply` modular → `φ` supermodular → maximizers closed under `∪`/`∩` → `X_min`
  is a maximizer; (c) `γ·X_min` is a maximizer, `X_min ⊆ γ·X_min`, equal cardinality → invariance; (d) deleting a weight-0
  member keeps `φ ≥`, contradicting leastness → positivity; (e) `¬Hall` → `maxφ > 0` → deficiency. Every node is compiled
  sorry-free, and there are no open nodes.

**NOT READY**
- **U-B: (INV)'s quotient clause.**
  - (a) Complete informal proof: yes. The orbit partition is equitable; reconciliation item 6 gives
    "invariant-family Hall ⇔ quotient Hall" by the class-union identity, and (LIFT) in Hall form is the flow version.
  - (b) Compiled fragments: none.
  - (c) Open nodes: an orbit-quotient definition on `E993Transport` (orbits of `Aut(G)` on `I_{p+1}` and `I_p`, quotient
    arcs, clone weights), and **`covered_orbitUnion`**: `N(⋃X_Q) = ⋃{C_t : ∃ C_s ∈ X_Q, an arc joins C_s and C_t}`.
    Its `⊇` direction follows from `transportRel_map_aut` and orbit transitivity. That, plus the sum identity, is the smallest
    unproved lemma.
- **U-C: (NM)** `sectorPairProductNormalizedMatching`.
  - (a) Complete informal proof: yes, in the Cycle 1 record (a biregular double count, `proved_informal`).
  - (b) Compiled fragments: none; no Lean text exists anywhere in the run.
  - (c) Open nodes: the sector definition for `Q` independent with `G − N[Q]` an induced perfect matching on `N` edges; the
    two degree lemmas (each `B ∈ S^Q_{|Q|+k}` has exactly `k` in-sector lower covers; each `A ∈ S^Q_{|Q|+k−1}` has exactly
    `2(N − k + 1)` upper covers); then `Finset.card_mul_le_card_mul`. **Smallest unproved lemma: the upper-cover count
    `2(N − k + 1)`**, which needs the matching structure of `G − N[Q]`.
- **U-D: Candidate 1** (equitable lift). The informal proof is complete (E2); there are no compiled fragments.
  - Open nodes: equitable-partition definitions; the fractional row/column identities; integrality.
  - An adjudicator-derived simplification (STATED) for the E993 network: a **rational** saturating flow implies
    `WeightedHall` for every `X` by summation (`Σ_X w = Σ_{B∈X} Σ_A f ≤ Σ_{A∈N(X)} Σ_B f ≤ Σ_{N(X)} w`), and the Cycle 1
    formal companion `exists_saturatingFlow_of_weightedHall`, re-carried against C1-LA1's definitions per ruling 14, then gives
    an integral flow. No total-unimodularity fact is needed.
  - The generic statement over arbitrary bipartite relations still needs a generic capacitated Hall ⇒ flow lemma.
  - It is not contract-ready, and it may not be awarded before its isolated second read.
- **U-E: class-union Hall corollary** (E3). The informal proof is complete; there are no compiled fragments; it is STATED and
  critic-attributed. Not ready.
- **No restricted-scope (HALL) theorem** exists in this portfolio, and no bounded result qualifies.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

- **Progress in this cycle, graded:**
  - The invariant-family half of (INV) is now fully kernel-checked in scratch and contract-ready (U-A). This is U1's
    authored work plus a critic-attributed closing theorem.
  - A new general lemma, the equitable-partition flow lift, generalizes (LIFT) (U2; `proved_informal`, STATED).
  - Its Hall-form converse, a class-union Hall reduction, is critic-attributed and STATED.
  - A structural correction decides the witness in the formal statement (`X_min`, not `X_max`).
  - A coarsening fact: at `d = 1` equitable quotients are far coarser than orbits; at the tested `d ≥ 2` rows they are not.
- **Not progress:**
  - No certificate on the three sector-deficient rows, and no advance on (HALL) itself.
  - The deletion-saturating CB(1,7)/10 and CB(2,5)/10 flows are new rows, but switch arcs are not load-bearing there. They
    are records, not evidence toward (HALL).
- **Stop gate:** no decisive event. (HALL) is not formally verified and no (CUT) is confirmed. Because a new lemma exists at
  `proved_informal` (STATED) and a formal award group is ready, this orientation is **not** on plateau.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at this orientation's evidence grade:
- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: still open. Nothing in U proves it or exhibits a deficient cut, and
  no (CUT) candidate arises.
- **(WID)**: `formally_verified` (Cycle 1); unchanged.
- **(INV)**:
  - The invariant-family half is proved (verified by me) and compiled sorry-free; it is award-ready as U-A.
  - The quotient clause is proved informally (orbit special case of E3); it is not formalized.
- **(NM)**: `proved_informal` (Cycle 1 record); no Lean text; not re-examined as mathematics in this cycle.
- **Candidate 1** (equitable lift) and **E3** (class-union Hall): proved (informal, verified by me), STATED; they need isolated
  second reads.
- **Candidate 2**: its headline is refuted; the narrowed witness is `bounded_computation`.
- The primary aggregate is untouched.

## Next-route allocation

**Exact remaining obligation for orientation U:**
1. Formal: (INV)'s quotient clause and (NM) have no Lean text. U-A awaits its Stage 7 contract.
2. Toward (HALL): on the full mixed networks of CB(8,86)/460, CB(8,89)/476 and CB(8,92)/492, produce either a saturating
   integral flow or an exhibited `Aut`-invariant or class-union deficient cut (`X`, `N(X)`, both sums). This must be done
   without materializing about 10^37–10^38 orbits per layer, and without a coarser equitable quotient, which the tested
   `d ≥ 2` evidence disfavours.

**Route U-R1 (formal completion of INV and NM; Lean).**
- Seed the project from C1-LA1's `Main.lean`, carried byte-identically, plus U1's `INV.lean` and C-U1-T's `CritINV.lean`.
- (i) Define the `Aut(G)`-orbit quotient of the transport network and prove `covered_orbitUnion` and the class-union deficit
  identity. With `weightedHall_iff_invariant`, this gives "WeightedHall ⇔ quotient Hall", so the **whole (INV) key** is
  covered without (LIFT) or flows.
- (ii) NM: the sector encoding, the two cover-degree lemmas, and the double count.
- Could close in one cycle: kernel-checked (INV) at its full registered statement, and (NM), both ready for Stage 7 awards.

**Route U-R2 (a product-form certificate on the three sector-deficient CB rows).**
- Build a non-equitable certificate that processes the `m` branches one at a time. Two forms:
  - an explicit **fractional** saturating flow in closed form over branch-type generating functions (the same product
    structure that makes `P(x)` and `W(x)` tractable);
  - an **LP-dual potential** certificating that no deficient set exists.
- Verify it exactly by summation. A rational saturating flow implies WeightedHall for every `X` (U-D's remark).
- Validate first on brute-forceable eligible rows. CB(1,7)/10, CB(2,5)/10, CB(3,5)/14 and CB(4,4)/14 are all eligible, but no
  small CB row is sector-deficient, so the load-bearing regime must be reached through the certificate itself.
- Could close in one cycle: the first exact saturation with switch arcs load-bearing on a whole tree (`bounded_computation`
  with an exact certificate), or a candidate `Aut`-invariant cut exhibited with sums for two-instrument confirmation (the stop
  gate's decisive event (b) only after a second read).

**Registration obligations (Stage 6 and the second reads):**
- Candidate 1: reworded as a generalization of (LIFT), with (LIFT) and INV's quotient clause as its orbit special case.
- E3: its own isolated second read.
- Candidate 2: only in narrowed form, or not at all.
- Instrument repairs before any reuse of U2's code:
  - compute `S` on the q-side;
  - derive `F_p` rather than hard-coding it;
  - use a window top of `⌊2α/3⌋`;
  - turn silent filters into assertions;
  - replay with `-B`.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-adj-U/`. Only the
standard library is used, and there is no network. Every Python run used `python3 -B`, so nothing was written under
`sources/`. Background jobs:
- the `lake` build chain (harness task `brp1i8elo`, exit 0);
- the part-D run (`D.log`, EXIT 0);
- the CB(2,5)/10 flow job (PID 48367, confirmed gone by `kill -0`).

All had exited before this write, so no job was running and none needed to be killed.

| file | role | SHA-256 |
|---|---|---|
| `LeanProject/LeanProof/Main.lean` | carried C1-LA1 text (copy) | `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb` |
| `LeanProject/LeanProof/INV.lean` | U1 (copy) | `174d84c3cd046f635ff5c2998d110128d6c4116f85dbd42784bb398d8da6f9f9` |
| `LeanProject/LeanProof/CritINV.lean` | C-U1-T advance (copy) | `e6cbd7e63093143e8b052bf4175b81aa865993c1cc4e2d6b3829794654924ceb` |
| `LeanProject/LeanProof/CritAdvance.lean` | C-U1-F advance (copy) | `f59126da1d3296c407f29c25fbfb7a9543755b80348d154315ebf5d9e896d697` |
| `LeanProject/LeanProof/{AxiomCheck,CritAxioms,CritAxiomsF}.lean` | axiom drivers (copies) | `5c135a8b…eeca`, `e7816d92…a1a9`, `dd446005…d092` |
| `LeanProject/LeanProof.lean` | root module (Main, INV, CritINV) | `9ef39334f1baba39449da7937fcad06f4f1e57049f1ddd68f3323dd8046196a4` |
| `LeanProject/.lake/packages` | manual symlink to the pinned shared Mathlib | (symlink) |
| `build-main.log` / `build-critF.log` | 8659 jobs / 8657 jobs, EXIT 0 | `83a490a9ad09f6df192c5e00e15f713f56d248b156948c5280971513833a181e` / `3c9b302a8dcbae32af9609ecfaeef59f4f5830c291061fcdbc2f3e8a75d7c918` |
| `axioms-U1.log` / `axioms-critT.log` / `axioms-critF.log` | `#print axioms` and `#check` output | `c1ffa2df0efb2c667a87336c62c4146fc8fbdda9f8f8f142add57382a20959d8` / `26ebb3659b9482f075898596850e9f5780c3c76be210ecd1bffcc3d53c28a2e5` / `70036212c37ea8eeb1e93784a212d1e7682c75dbee6377f3b7be4a270e8120bd` |
| `adj_inst.py` | independent instrument (tree test, forest DP, selector, q-side `S`, own `W`, literal network, Dinic, colour refinement, maximizers) | `9ad0e244e0c6d3745a9df6e58e76234cd114311579b98a5c855822ee83db6e2a` |
| `adj_run.py` | driver: A `W` validation, B `K_{1,12}`, C small rows and refinement, C25, D target rows, E `X_min`/`X_max` | `68a83ae58fae0d98b16d5302931422c1bf6713431b3938e77480aa5780d5fde6` |
| `adj_run_RESULT_A_B_E.json`, `_C.json`, `_C25.json`, `_D.json` | outputs | `f9e85814…cdc9cd`, `4df5c209…72062`, `2b173396…bca0`, `e17ee5cf…acad` |
| `adj_equit_check.py` | explicit equitability check on CB(1,7)/10 | `b48d5ecaf1b75c35d12752c9900745f64df56038713162593f58f3cbf4f24527` |
| `adj_scan_def.py` | closed-form CB scan (sector-deficient eligible rows) | `d6c20da8e16633f8dd849039ea7a6bff744b675bebaf7374f44f95cca0962507` |
| `adj_cb25_flow.py` / `adj_cb25_flow_RESULT.json` | CB(2,5)/10 mixed and deletion-only flows | `3ee0bb1f4037d08f2532d4d79eaa78de960699130099f9d5b701ee36434a757a` / `8c2ad55da8616a412cbcb75bafce89cafe34cb46daed7f1439c04f67fbcce88c` |
| `D.log`, `cb25flow.log` | run logs | `7eee00e4…83cb`, `3247fd36…9ceb` |
| `u2copy/` | U2's seven replay modules (unmodified bytes), `run_all_RESULT.shipped.json`, and my replay `run_all_RESULT.json` (byte-identical to the shipped file; combined digest `218b5d3b…ba4c`) | as in U2's return |
| `U2-RETURN.copy.md`, `C-U1-T.copy.md`, `C-U1-F.copy.md`, `C-U2-T.copy.md`, `C-U2-F.copy.md` | read copies of capsule members | as in the capsule |
