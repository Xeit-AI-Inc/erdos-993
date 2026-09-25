# Orientation Adjudication

Adjudicator of orientation **U** (formal/structural), Cycle 1, Stage 5, r28
(`erdos-993-math-dre-20260924-r28-degree-lemma-hall-sdr`). Portfolio: the returns of seats `U1`
(`C1-U-01 LEAN-DEFINITIONS-AND-LAYER-CAKE`) and `U2` (`C1-U-02 LEAN-FOREST-COMPOSITION-AND-HALL`), and
their four cross-orientation critiques `C-U1-T`, `C-U1-F`, `C-U2-T`, `C-U2-F`.

**VerityOS boot.** I am operating within VerityOS. For the boot I read exactly
`/Users/ashtonsperry/VerityOS/verity.md` (the constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the identity subsystem's startup protocol).
I read no other VerityOS subsystem. The host harness put the repository `CLAUDE.md` and the user memory
index into my context on its own. I did not act on either beyond the boot rule.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

## Identity and seal audit

**Capsule.** I recomputed the seal of `control/c1-adjudicator-capsules/U-PACKET-MANIFEST.json`. The
method is SHA-256 over the canonical JSON with `seal_sha256` removed: `sort_keys`, separators
`(",", ":")`, no trailing newline. The result is
**`5831bd725f55f835a0426fa9bea4706c269df06ed5e96ed32785c7ed171c87af`**, which matches. All 21 members
match on both byte count and SHA-256. That includes:

- `U1/RETURN.md` `9d782491…`;
- `U2/RETURN.md` `d3ac4de4…`;
- the four critiques `edf81c50…` (C-U1-T), `8ece74ff…` (C-U1-F), `0b66639…` (C-U2-T) and `db8e1360…`
  (C-U2-F);
- the controller facts record `7331fbf2…`.

**Protocol template residue.** `C1-ADJUDICATOR-PROTOCOL.md` speaks of "THREE returns … six critiques".
Under this run's topology (6 routes, `C1-ALLOCATION.md`), orientation U has **two** returns and **four**
critiques, and the capsule lists exactly those. I adjudicate the capsule as sealed.

**Stage manifests** (seals recomputed the same way):

| Manifest | Seal | Result |
|---|---|---|
| Stage 2 | `2eff91efcc2889ffcbbdc7e046adeb69e9a74e162d68a454afe94068e7af710b` | match |
| Stage 3 | `56fa3b76ba633b21aa40e58b554560bd59239322edf35375a3bdc668318b2be5` | match |
| Stage 4 | `4f6545959854f69e59bfa1cba137e1a56d20d46ba453774b13c49fa40a6e84d7` | match |

Every U return and U critique row matches every manifest that lists it. Four mutable controller files
have changed since the manifest that sealed them. None is a U evidence file:

- `control/RESIDUE-CHECK.json` (Stage 2).
- `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` (Stage 3). Its own note says it was corrected
  before the Stage 4 seal, and the Stage 4 row and the capsule row both match the current file.
- `control/r28_tool.py` (Stage 3 row differs; the Stage 4 row matches).
- `control/C1-STAGE4-AGENTS.json` (Stage 4).

I record this drift and assign it no evidentiary weight.

**Artifact digests.** Every digest the returns and critiques cite, and that I checked, reproduces:

- U1: `Main.lean` `74ab2108…` (16,007 B); `u1_verify_report.json` `cb56a86d…`. A copy-out replay in
  `scratchpad/c1-adj-U/replay-u1/` is byte-identical.
- U2: `Main.lean` `5d71c16b…` (483 lines); `AxiomCheck.lean` `ed030e48…`. The canonical axiom digest
  **`80c87cdc…`**, recomputed from my own build log, matches.
- C-U1-T: `CriticCheck.lean` `35b10eb0…`.
- C-U1-F: `Critic.lean` `7ae3f19e…`.
- C-U2-T: `CritU2T.lean` `46be4587…`.
- C-U2-F: `CritAdvance.lean` `824c7609…`.
- Seed project files are byte-identical across U1, U2 and my copies.

Every Lean check I ran used the pinned toolchain inside the project: `Lean (version 4.32.2, …, commit
f3b06c70…)`, with Mathlib bound by a **manual symlink** to the shared `.lake/packages`. I did not run
`lake update` or `lake clean`.

**Read-boundary and process disclosures (this adjudicator):**

1. **Unintended network fetch and toolchain install (against the standing rule).** Once, I ran
   `lake env lean` from `scratchpad/c1-adj-U/` instead of from inside a project directory. `elan`
   resolved the default "stable" channel, then downloaded and installed `leanprover/lean4 v4.34.1` into
   `/Users/ashtonsperry/.elan/toolchains/` (directory timestamp 2026-09-24 21:15). This is the same
   failure U1 disclosed, except that here the download succeeded.
   - I did not remove the toolchain, because an uninstall would be a further change to elan state. I
     leave that to the controller.
   - Nothing reported here depends on v4.34.1. Every build and check ran inside `P1/` or `P2/`, whose
     `lean-toolchain` pins v4.32.2.
2. **Seal checks.** I hashed, but did not display, the `control/` members of the Stage 2–4 manifests
   that fall outside my capsule (dispatches, agent records, `r28_tool.py`, attack briefs). I hashed no
   other seat's return or critique.
3. **Authorized reads.** I read the two registry rows `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`
   and `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION` from `sources/authority/CLAIM-IDENTITY.json`. I
   ran one `grep` for counts in `sources/r27/second-reads/SR-JOIN.md`, and read pinned Mathlib lines.
4. **Directory listings.** I ran non-recursive `ls` of the granted seat and critic scratch
   directories. One `ls` of `cycles/cycle-1/stage5/adjudicators/` showed the name `T` only; I opened
   nothing inside it.
5. **How the order-22 tree was constructed.** The controller facts record gave me two pointers: "order
   22" and the "branch tree maximum degree ≤ 2" class. I built my witness from those. I read nothing
   from the F portfolio, so I cannot say whether my tree is C-F1-T's tree.
6. **One background job.** A Lean `#eval` of the definitions of record on that tree ran past the tool
   timeout and was backgrounded by the harness.
   - I stopped it with the harness stop tool (task `b226k9p81`), not by literal PID, because I never
     saw its PID.
   - I then ran one own-uid `pgrep -f W22Eval.lean`, which found no survivor. That is a pattern query
     and I disclose it.
   - The job produced no output, and no result depends on it.
7. **No other background jobs** were started. Nothing is running at this write.

## Route-by-route decisions

### U1 — `C1-U-01 LEAN-DEFINITIONS-AND-LAYER-CAKE`: retained_narrowed

**Stands (replayed).**
- `Erdos993G1.dominance_implies_degree_lemma` compiles sorry-free. `#print axioms` gives
  `[propext, Classical.choice, Quot.sound]` on all 8 of U1's lemmas and theorems. This now rests on
  three independent rebuilds: C-U1-T, C-U1-F, and mine. My logs are **byte-identical** to both
  critics' logs (`7ace06d8…`, `465ef6ab…`).
- The elaborated type is the §2 statement, up to the `Erdos993G1.` qualification. C-U1-T's
  `critic_contract_literal` restates the literal §2 text and closes it with U1's theorem.
- `hT` is unused; the only warning is the unused-variable linter at `Main.lean:185:26`.
- `layerCake_subset` sums over `t ∈ Finset.Icc 1 N` with `N = i_k`. The proof therefore uses the
  hypothesis `h` only at `t ≥ 1`.
- The definitions `occ`, `slotsAtLeast` and `leavesAtLeast` are the §2 text. I checked the `#print`
  output.

**Narrowed (both critics agree, and I confirm each item):**
1. "`indepDegreeSum` carried byte-identically from r27 entry 7" is **struck**. U1 re-typed it with
   explicit binders. It is definitionally equal (`rfl`): C-U1-F's `Audit.lean` `example … := rfl`
   compiles in my build. Stage 7 carries the r27 entry text.
2. "Formally verified" becomes **kernel-checked in scratch, reproduced three times**. The grade is
   conferred only at Stage 7.
3. The "genuine generalization" (graph-general, with `hT` unused) is a correct Lean fact but **not new
   mathematics**. I read the registered scope of `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`
   myself: "The general weight identity 2k·i_k − D_k = Σ_v (2 − deg v)·c_v(k) holds for every finite
   graph". U1's own graph-general reading with `∀ t` is needlessly weak off trees (see Cross-route
   reconciliation, claim 3).
4. "Generalizes one direction of the identity" is a **weakening**, not a direction. The exact identity
   and the slot count asked for by allocation item 5 were neither delivered nor listed as open. Both
   critics supplied them (critic-attributed).
5. The draft `THEOREM-CONTRACT.draft.yaml` has four defects, which I confirmed on the file:
   - `formally_verified_conditional` (line 10) is not a §4 grade;
   - its note says "`proved_informal`-for-the-implication";
   - `def-occ` lists the false dependency `def-indepdegreesum`;
   - `informal_statement` gives the unfenced graph-general `∀ t` reading.
6. The claim "worked throughout at highest reasoning effort" is **struck**.

U1's route verdict `proved` stands for the conditional (LC) only.

### U2 — `C1-U-02 LEAN-FOREST-COMPOSITION-AND-HALL`: retained_narrowed, with one correction beyond both critics

**Stands (replayed).** All of the following are sorry-free with the three permitted axioms, and my
axiom log `3d94e129…` is byte-identical to C-U2-T's:
- `indepCountOn_union` and `indepDegreeSumOn_union`, the two-piece convolution;
- `nested_hall_iff_threshold`, `sdr_iff_threshold_abstract` and `sdr_iff_threshold`;
- the helper lemmas.

The literal `sorry` occurs exactly once, at `Main.lean:470`, inside `slot_leaf_sdr_exists`, and
`sorryAx` is isolated to that declaration and `tree_leaf_slot_dominance`.

**Correction (adjudicator; not in either critique, which predate the refutation).**
`R28U2.slot_leaf_sdr_exists` is **false**. So is its one-line consequence
`R28U2.tree_leaf_slot_dominance`, which is the §2 Tier 1 target itself. The order-22 tree `W22` (see
Established results) has no slot-to-leaf SDR at `k = 11` and at `k = 12`. The following return
descriptions are therefore superseded:
- "Lean-ready modulo that one node";
- "`bounded_computation` support";
- "the moment either route produces the assignment".

The file carries a false statement closed by `sorry`. It must never be discharged and must not be
carried into any Stage 7 file.

**Narrowed:**
1. **`sdr_iff_threshold` is the `∀ t` form.** The contract's key reads "(HS-SDR) ⟺ (HS)" with (HS) at
   `t ≥ 1`, which needs the tree lemma "total slots ≤ leaves" (C-U2-F Finding 1; resolved against
   C-U2-T below).
2. **The (FC) obligation is not "Lean bureaucracy"**: the literal §2 hypothesis cannot be consumed by
   the convolution (both critics; R28-E-c).
3. **The convolution is the ambient-degree, Finset-relative form**, not literally the registered
   `deg_S` form. The two agree on adjacency-closed pieces, via C-U2-T's `bridge`.
4. **Certification literals:**
   - "all four" names three declarations;
   - `Fintype.sum_equiv` is at `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:722`, which I
     verified at the pin (`lemma prod_equiv` inside `namespace Fintype`, lines 686–737);
   - "byte-identical" holds at the declaration level only, and `5484fc21…` is the digest of entry 1
     alone (entry 4 is `4463e7ee…`);
   - "841 arbitrary-graph joins" is misattributed. In SR-JOIN, 841 is the single-cross-edge
     (Z)/(D-REC)/(E-REC) table (line 179); the convolution figure is 5,625 (line 216). I checked both;
   - "All 83 … spot-checked" is self-contradictory;
   - `compiled` is not a §4 grade.
5. **Process.** U2's uid-scoped `ps` is disclosed in the return but missing from the Stage 3 disclosure
   record. It matches the tolerated F2 self-check. This is a record gap only, with no effect on any
   artifact.

## Cross-route reconciliation

Paired-critic disagreements, resolved claim by claim. Replays are weighed over self-reports.

| # | Claim | C-…-T | C-…-F | Ruling |
|---|---|---|---|---|
| 1 | U1's (LC) theorem is correct and does not encode (DL) | correct | correct | **Agree.** Confirmed by my rebuild and by reading the proof. |
| 2 | Status of the graph-general (LC) | a scope note on `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA`, not a new key | a separate STATED candidate at `t ≥ 1`, which the synthesis may register or not | **Not a new key** (C-U1-T upheld; see below). |
| 3 | The `t = 0` gap off trees | witness `K_{2,3}`, `k = 3` | witness: diamond `K_4 − e`, `k = 2`, called "smallest" | **All replay** (see below); "smallest" is a tie. |
| 4 | Exact leaf/branch identity | holds under "no isolated vertex"; `Σ(2 − deg) = 2` is not needed | same, plus the general form with `2·Σ_{deg 0} c_v` | **Agree.** Both compiled in my build. |
| 5 | `sdr_iff_threshold` delivers `E993-R28-SDR-THRESHOLD-EQUIVALENCE` | "delivered formally, more general than stated" | only the `∀ t` form; `t ≥ 1` needs a tree lemma | **C-U2-F upheld** (see below). |
| 6 | The literal §2 (FC) hypothesis is defective | `K_4 ⊔ K_4`, `k = 2` | same witness | **Agree.** Replayed: `D_2 = 96 > 64`, and each `K_4` has `i_2 = D_2 = 0`. |
| 7 | The corrected (FC) composition | end to end in `G.induce C.supp` form, including `bridge` (6 declarations) | Finset-level peel, 7 declarations; bridge not built | **Both compile** (see below). |
| 8 | Fidelity of the convolution to the registered identity | narrowed (bridge needed) | narrowed (ambient vs. piece degree) | **Agree.** C-U2-T's `bridge` closes the gap on adjacency-closed sets. |
| 9 | Certification literals | four struck or narrowed | eight struck or narrowed (a superset) | **Agree** on every shared item. C-U2-F's extra items (841, line ranges) are confirmed. |

Detail on the rulings that go beyond "agree":

- **Claim 2.** The mathematics is the registered r27 weight identity plus U1's layer cake. It is
  recorded in its `t ≥ 1` form as a scope note on the Tier 1′ key, with a cross-reference inside the
  formal scope note of the r27 reformulation key. The controller's facts record says "scope note on the
  r27 reformulation key". I read that as the same no-new-key ruling, placed on the neighbouring face.
  The synthesis picks the face.
- **Claim 3.** In `py/small_witnesses.py`:
  - the diamond at `k = 2` gives `t = 0` row `2 > 0` and `t ≥ 1` rows `0 ≤ 0`, with (DL) `4 ≤ 4`;
  - `K_{2,3}` at `k = 3` gives the same pattern, with (DL) `6 ≤ 6`;
  - `K_4` at `k = 2` gives `t = 0` row `4 > 0` and (DL) `0 ≤ 0`.

  Order 4 is the minimum for any slot, and `K_4` at `k = 2` is another order-4 witness. So "smallest"
  is a tie, not unique.
- **Claim 5.** My replay of `K_4` at `k = 2`: every `c = 0`, 4 slots, 0 leaves. Every row at `t ≥ 1`
  reads `0 ≤ 0`, yet no injection from 4 slots into an empty set exists. The key's formal input is
  therefore `sdr_iff_threshold` composed with the tree `t = 0` lemma, i.e. C-U2-F's
  `sdr_iff_threshold_pos_of_tree`. The tree `t = 0` lemma is compiled twice, independently: C-U2-F's
  `tree_slots_zero_le` and C-U1-F's `tree_slots_le_leaves_zero`.
- **Claim 7.** C-U2-T's version is contract-shaped. C-U2-F's `dl_union` has the same statement as
  C-U2-T's `degree_lemma_on_union`, so the composition core now has two independent compilations.

**Checked against the controller facts record** (weighed as one more replay):
- The (LC) theorem, U2's sorry-free set, the single `sorry`, and "`hT` unused" are all confirmed.
- R28-E-a (`t = 0`) and R28-E-c (`hcomp`) are confirmed by my witness replays.
- "Fintype.sum_equiv is at Fintype/Defs.lean:722" is **itself imprecise**. `Mathlib/Data/Fintype/Defs.lean`
  has 291 lines at the pin. The correct location is
  `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:722`.

**U1 against U2 (definition layer).** Each seat typed `occ`, `slotsAtLeast` and `leavesAtLeast`
independently, in the §2 text: U1 in `Erdos993G1`, U2 in `R28U2` (U2 adds a type ascription). Neither
carries the r25 or r27 entries byte-identically. Stage 7 needs one definition text and
registrar-carried entries.

## Established results

Grades follow `SOLUTION-CONTRACT.md` §4. "Compiled" means kernel-checked sorry-free in scratch, with
permitted axioms only, and rebuilt by me. It is not an award. "Critic-attributed" follows protocol
check 2. Every item below is STATED at this stage and needs Stage 6/7 handling before registration.

**Exact theorems, compiled (with the hypotheses each consumes):**

- **E1 — (LC), tree form** (U1): `dominance_implies_degree_lemma`.
  - Consumes: `Fintype X`, `DecidableEq X`, `DecidableRel G.Adj`.
  - `hT : G.IsTree` sits on the face unused. The hypothesis is `∀ t`; it is used at `t ≥ 1` only.
  - Needs no `k ≥ 1` and no `n ≥ 2`.
- **E2 — (LC), graph-general at `t ≥ 1`** (critic-attributed; C-U1-T and C-U1-F independently):
  `dominance_implies_degree_lemma_graph_general` / `…_general`. No acyclicity and no connectivity.
- **E3 — weight identity** (critic-attributed): `2k·i_k − D_k = Σ_v (2 − deg v)·c_v(k)`, for every
  finite simple graph.
- **E4 — exact leaf/branch identity** (critic-attributed):
  - the general form, with the `2·Σ_{deg v = 0} c_v` term;
  - the form without isolated vertices (`∀ v, 1 ≤ deg v`).
- **E5 — the r27 reformulation, in full** (critic-attributed; compiled twice independently): the
  identity, the iff, and the slot count in ℤ.
  - Consumes: `IsTree` and `2 ≤ card X`.
  - The identity and the iff use **connectivity only**, through "no isolated vertex when `n ≥ 2`".
  - The slot count uses connectivity plus acyclicity, through `IsTree.card_edgeFinset` and the
    handshake.
- **E6 — the `t = 0` row on trees** (critic-attributed; C-U1-F and C-U2-F): `slotsAtLeast k 0 ≤
  leavesAtLeast k 0`.
  - Consumes `IsTree`: both halves (at most one isolated vertex, and `|E| = n − 1`). No `n ≥ 2` is
    needed.
  - Corollary `tree_forall_t_of_ge_one`: on trees, the §2 `∀ t` hypothesis follows from `t ≥ 1`.
- **E7 — the two-piece convolution** (U2), ambient-degree, Finset-relative.
  - Consumes `hsep` and `hdisj`, both necessary (with `S = T = {x}`, 1 ≠ 2).
  - No acyclicity; every `k`, including 0.
- **E8 — nested Hall and SDR/threshold** (U2): graph-general, `∀ t` form.
  - **E8′ — the tree form at `t ≥ 1`** (critic-attributed, C-U2-F): `sdr_iff_threshold_pos_of_tree`.
- **E9 — the corrected forest composition** (critic-attributed):
  - C-U2-T: `degree_lemma_on_union`, `bridge`, `degree_lemma_of_components` (every finite simple
    graph, with the component hypothesis at every `a ≤ k`), `forest_degree_lemma_of_components_allk`,
    `induce_supp_isTree` (the **only** place acyclicity enters), and
    `forest_degree_lemma_of_tree_degree_lemma`;
  - C-U2-F: `dl_union`, `dl_closed_of_components`, `degree_lemma_of_component_supports` (Finset-level
    hypotheses).

**Refutation of (HS): adjudicator replay.** A decisive registration remains the job of the stop gate's
two-instrument-plus-isolated-second-read procedure on the F side.

- **The tree `W22`, order 22.** A centre `v` is adjacent to `u_1, u_2, u_3`. Each `u_i` carries two
  pendant paths of length 3 (`u_i–a–b–ℓ`).
  - Edges: `0-1, 1-2, 2-3, 3-4, 1-5, 5-6, 6-7, 0-8, 8-9, 9-10, 10-11, 8-12, 12-13, 13-14, 0-15, 15-16,
    16-17, 17-18, 15-19, 19-20, 20-21`.
  - `α = 13`. Branch vertices: `v`, `u_1`, `u_2`, `u_3`, each of degree 3 with 1 slot, so 4 slots.
    There are 6 leaves. It passes the tree test (connected, `|E| = n − 1`). Its branch tree is a star
    `K_{1,3}`.
- **At `k = 12`:** `c_v(12) = 18`, each `c_{u_i}(12) = 0`, and every leaf has `c_ℓ(12) = 17`
  (`i_12 = 19`). At `t = 18`, `slots_{≥18} = 1 > 0 = leaves_{≥18}`.
- **At `k = 11`:** `c_v = 141`, `c_{u_i} = 4`, every leaf 136 (`i_11 = 171`). At `t = 141`, the row is
  `1 > 0`.
- **The matching form fails** at exactly `k ∈ {11, 12}`.
- **(DL) holds at both, as it must.** At `k = 12`: `Σ_Br = 18 ≤ 102 = Σ_L`, and `D_12 = 372 ≤ 456`.
  At `k = 11`: `153 ≤ 816`, and `3099 ≤ 3762`.
- **Instruments.** Three independent computations of `c` agree:
  - (A) a forest independence-polynomial DP on `T − N[v]`;
  - (B) backtracking enumeration of independent sets;
  - (C) direct enumeration of all `k`-subsets by the literal definition (`py/w22_direct.py`).

  The explicit augmenting-path matching confirms that no SDR exists. The report digest is `1238933…`.
- **By hand, at `k = 12`:**
  - `T − N[v]` is six disjoint `P_3`s, so `c_v(12) = [x^{11}](1 + 3x + x^2)^6 = 6·3 = 18`.
  - `T − {ℓ, b}` with every `u_i` excluded has polynomial `(1 + x)^2 (1 + 3x + x^2)^5`, whose `x^{11}`
    coefficient is `2·1 + 1·15 = 17`.
  - Any independent set containing some `u_i` has at most 10 elements.
  - All six leaves are equivalent under automorphisms.

  So **(HS), (HS-SDR), `slot_leaf_sdr_exists` and `tree_leaf_slot_dominance` are false.** The instance
  also refutes the branch-vs-leaf pointwise form (PW), and the weaker "top branch value ≤ top leaf
  value": `18 > 17`.

**Bounded computations (priors, never grades):**
- The critics' censuses: trees to order 12 or 13; all labelled graphs to order 6.
- My seeded random families (`py/btp_probe.py`, `py/leg3_probe.py`, orders up to 40):
  - 0 violations in about 3,000 instances whose branch tree is a path;
  - violations only when the branch tree has a vertex of branch-degree 3 and pendant lengths are 3 or 5;
  - the smallest violation found is `W22` again.

  This is consistent with the controller's BTP narrowing, and it is a prior only.

**Record corrections:**
- `indepDegreeSum` byte-identity (U1 and U2).
- The digest of entry 4 (U2).
- The `Fintype.sum_equiv` location, in U2 and in the controller facts record.
- The SR-JOIN 841 attribution (U2).
- "four" → three (U2).
- The draft contract's grade and dependency (U1).
- The U2 skeleton's support claim, now false.

## Rejected and narrowed mechanisms

- **(HS) as the Tier 1 target: REFUTED** (`W22`). The Hall/SDR route cannot give a second proof of
  (DL) on all trees or forests. The composed `forest_degree_lemma'` via (HS) is dead. U2's skeleton is
  a false statement closed by `sorry`.
- **(LC) with `∀ t` read graph-generally:** narrowed to `t ≥ 1`.
- **`sdr_iff_threshold` as the `t ≥ 1` key without a tree lemma:** narrowed (the `K_4`, `k = 2`
  mismatch).
- **§2 `forest_degree_lemma_of_components` with `hcomp` at the single `k`:** defective (R28-E-c; the
  `K_4 ⊔ K_4` witness). As signed, it is provable on forests only by citing r27's (DL), which fence 2
  forbids.
- **"(a) is exactly the registered convolution":** narrowed to the ambient-degree form.
- **"one direction of the identity":** a weakening.
- **(PW):** still not a premise anywhere in the portfolio. `W22` at `k = 12` is an order-22
  branch-vs-leaf witness. The smaller order-9 witness (R28-E-b, C-T1-U) is outside my portfolio, and I
  do not rule on it.

## Lean readiness

This ruling is scoped by the refutation to what remains true. For each group:
- (a) is there an informal proof with a closed DAG?
- (b) are the DAG nodes compiled sorry-free?
- (c) which nodes are open?

**NOT READY: (HS) `tree_leaf_slot_dominance` and (HS-SDR) `slot_leaf_sdr_exists`. These are FALSE.**
- (a) There is no proof, because the statement is refuted.
- (b) The only compiled node is a `sorry`ed false statement.
- (c) No node is open; the node is refuted.

Neither may be carried or discharged. The stop-gate route to a formal (HS) is closed.

**Contract-ready award groups (three):**

1. **G-LC — `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA`.**
   - **Statement.** §2 `dominance_implies_degree_lemma` exactly: `G.IsTree`, `k : ℕ`,
     `h : ∀ t : ℕ, slotsAtLeast G k t ≤ leavesAtLeast G k t`, concluding
     `(indepDegreeSum G k : ℤ) ≤ 2 * k * indepCount G k`.
   - **Quantifier.** The formalizer records the `∀ t` choice on the face (R28-E-a). It is harmless on
     trees, by `tree_forall_t_of_ge_one`.
   - **Scope note.** The graph-general `t ≥ 1` form, E2.
   - (a) Complete: layer cake plus the double counts plus a nonnegative remainder.
   - (b) Every node is compiled: `layerCake_subset`, `occ_le_card_indepSetFinset`,
     `sum_branch_slots_eq_sum_slotsAtLeast`, `sum_leaves_eq_sum_leavesAtLeast`,
     `indepDegreeSum_eq_sum_degree_mul_occ`, `sum_occ_eq_card_mul_indepSetFinset`, and the theorem.
   - (c) None open.
   - **Carry.** r25 entries 1 and 4 and r27 entry 7 are carried through the registrar verbatim; the
     `Erdos993G1.` qualification is kept as §2 writes it.
   - **Fence, after the refutation.** This is an instance-wise implication. It is not a route to (DL):
     its hypothesis fails at `(W22, 11)` and `(W22, 12)`.
2. **G-SDR — `E993-R28-SDR-THRESHOLD-EQUIVALENCE`.**
   - **Statement.** For every finite tree and every `k`: (∃ injective `f : Slot G → LeafT G` with
     `occ v ≤ occ (f s)`) ⟺ `∀ t ≥ 1, slotsAtLeast ≤ leavesAtLeast`.
   - **Inputs.** `sdr_iff_threshold` (U2; graph-general, `∀ t`) and the tree `t = 0` lemma (E6).
   - **Scope note.** The graph-general `∀ t` version.
   - (a), (b) and (c) are all complete.
   - **Fence.** An equivalence, never evidence for either side. After the refutation it says the
     threshold failure at `W22` is exactly a matching failure.
3. **G-FC — `E993-R28-FOREST-DEGREE-LEMMA-FROM-TREES`, at the corrected statement** (critic-attributed,
   C-U2-T, with the core independently compiled by C-U2-F).
   - **Preferred face.** `forest_degree_lemma_of_tree_degree_lemma`: `G.IsAcyclic`, `k`, and "(DL) at
     every `a` on every finite tree" ⇒ (DL) on `G`. Acyclicity is consumed in `induce_supp_isTree`.
   - **Alternative face.** `forest_degree_lemma_of_components_allk`, with
     `hcomp : ∀ C, ∀ a ≤ k, D_a(G.induce C.supp) ≤ 2a·i_a(G.induce C.supp)`. On this face `hG` is
     unused, and the graph-general `degree_lemma_of_components` should be its scope note.
   - **Inputs.** U2's convolution identities, C-U2-T's `bridge`, and the peel over components.
   - (a), (b) and (c) are all complete.
   - **Fences.**
     - Never compose it with r27's `forest_degree_lemma` to present a "second proof" of (DL) (fence 2).
     - Its value as part of a Hall/SDR second proof is now void for general forests. It stands as the
       formal consequence clause of `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`, which receives a
       scope note.

**Carry candidate (a scope-note upgrade, not a new award key).** The full statement of
`E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2` (E5), compiled twice independently by C-U1-T and
C-U1-F, may upgrade that key's evidence by formal scope note at Stage 7. By itself it is a repackaged
registered identity, so it is not an award group.

**Not ready: the new candidate, (HS) on trees whose branch tree has maximum degree ≤ 2 (Theorem BTP),
composed with (LC).**
- (a) No informal proof is in my portfolio; Theorem BTP is T-side, per the controller.
- (b) Nothing is compiled.
- (c) The smallest unproved lemma is BTP itself.

The Lean predicate for the class, "every branch vertex has at most two directions that reach another
branch vertex", is not yet defined. Even if proved, the composed result is (DL) on a subclass, which is
strictly weaker than the r27 (DL) of record.

**Not ready: a formal refutation `¬ ∀ T k t, …`.** A kernel `decide` over `C(22,12)` subsets is
infeasible, and `native_decide` is forbidden. A structured proof is feasible:
- `c_v(12) = i_11(6·P_3)` through U2's convolution identities;
- `c_ℓ(12) = 17` through the case split above.

It is optional: stop gate (b) does not require a formal refutation.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Why this is material progress.** The orientation's Lean deliverables for (LC), the SDR/threshold
equivalence and the corrected (FC) are complete and sorry-free at the corrected statements. The critics
formalized the full r27 reformulation twice. The orientation also produced two contract-level
corrections that bind Stage 7: R28-E-a and R28-E-c. The Tier 1 formal target turned out to be false.
That removes the orientation's central open node rather than leaving it open.

**The stop gate.**
- Event (a), (HS) formally verified, is now impossible.
- Event (b), an in-scope counterexample confirmed by two instruments and an isolated second read,
  **bears directly**. My three-instrument replay and hand check of `W22` corroborate it, but do not
  substitute for the F-side second read.
- If (b) fires at Stage 6/7, the run ENDS. The U residue is then the Stage 7 carry of the three
  contract-ready groups, plus the reformulation scope note, within the budget.

## Headline assessment

headline_resolved: no
status: refuted

"Refuted" is stated at this orientation's evidence grade. It rests on the adjudicator's own replay:
- the order-22 tree `W22`;
- three independent `c` instruments, plus a matching check;
- a hand computation at `k = 12`: `c_v = 18 > 17 = c_ℓ` for every leaf, while `v` is the only branch
  vertex with `c ≥ 18`.

No U seat or U critic produced a refutation; the controller facts record points to C-F1-T's order-22
counterexample, which I did not read. The formal and registered status is decided by the stop gate's
second-read procedure, not by this adjudication. No status transfers to any no-recovery claim, the
aggregate, TREE/FOREST or Erdős #993. (DL) remains the r27 award and is untouched.

## Next-route allocation

**Exact remaining obligation for U.** Two items:
1. The Stage 7 carry of G-LC, G-SDR and G-FC, plus the E5 scope note, in one file with:
   - a single definition layer;
   - r25 entries 1 and 4 and r27 entry 7 carried by the registrar;
   - the corrected quantifiers (R28-E-a recorded; R28-E-c applied);
   - U2's false skeleton removed.
2. If the run continues past the stop gate, a formal target for whatever narrowed statement the
   synthesis adopts.

**Routes, if a Cycle 2 occurs** (Cycle 2 keeps 2; I recommend the first two):

1. **`U-CARRY-PACKAGE`.** Assemble and rebuild the three groups and the scope note as one
   registrar-shaped file. Every node is already compiled, so this closes in one cycle.
2. **`U-FORMAL-REFUTATION-W22`.** Prove in Lean, without `decide` over the enumeration, that `W22`
   violates the threshold form at `(k, t) = (12, 18)`. The inputs are U2's convolution identities for
   `c_v` and an explicit count for `c_ℓ`. This yields `¬` of the §2 Tier 1 statement formally. It could
   close in one cycle.
3. **`U-BTP-CLASS-FORMAL`** (only if the synthesis admits T's Theorem BTP with a closed DAG). Define
   the branch-tree-degree predicate, then write the class-restricted (HS) with its open nodes named as
   in T's DAG, composed with G-LC. It closes only if the informal DAG is closed.

## Artifact inventory

All paths are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/scratchpad/c1-adj-U/`.

**Lean projects.**
- `P1/` is the copy-out of U1's project. Its seed files are byte-identical to the r25 seed;
  `.lake/packages` is a manual symlink to the shared pinned Mathlib.
  - It contains `LeanProof/Main.lean` (`74ab2108…`), `LeanProof/CriticCheck.lean` (`35b10eb0…`), and
    `Critic.lean` and `Audit.lean` (C-U1-F).
  - My statement checks: `AdjCheck.lean` `edf2bbec…`, `AdjCheckT.lean` `7da5410c…`, `AdjCheckF.lean`
    `2b5cb9ff…`.
  - `W22Eval.lean` `9e9bcbc9…`: the `#eval` attempt, stopped with no output, and not evidence.
- `P2/` is the copy-out of U2's project.
  - It contains `LeanProof/Main.lean` (`5d71c16b…`), `AxiomCheck.lean`, `CritU2T.lean` (`46be4587…`),
    `CritAxioms.lean`, `CritAdvance.lean` (`824c7609…`) and `CritAxiomsF.lean`.
  - My statement check: `AdjCheck2.lean` `a89458a5…`.

**Build logs.** Each log below is byte-identical to the corresponding critic log where one exists:

| Log | SHA-256 | Critic log it matches |
|---|---|---|
| `p1_criticcheck.log` | `7ace06d8…` | C-U1-T |
| `p1_critic_f.log` | `ef861720…` | C-U1-F |
| `p1_audit.log` | `465ef6ab…` | C-U1-F |
| `p2_axiomcheck.log` | `3d94e129…` | C-U2-T `axioms1.log`; canonical digest `80c87cdc…` |
| `p2_critu2t_axioms.log` | `8941e18c…` | C-U2-T |
| `p2_critadvance.log` | `a12b95e1…` | C-U2-F |
| `p2_critaxiomsF.log` | `52f94f94…` | C-U2-F |
| `p2_critu2t_build.log` | `f55683a7…` | — |

**U1 replay.** `replay-u1/`: U1's `u1_verify.py` and `Main.lean`, plus `u1_verify_report.json`
(`cb56a86d…`, byte-identical to U1's).

**Instruments** (`py/`; standard library only, exact integers):

| File | SHA-256 | Role |
|---|---|---|
| `hs_core.py` | `815ff1cf…` | DP and backtracking `c`; (HS) rows; augmenting-path SDR |
| `probe1.py` | `cb5d3a81…` | fixed points (S(2,1,1) `k = 3` → `(0,1,2,2,1)`; `K_{1,5}`); the spider-of-spiders family |
| `witness22.py` | `4070a344…` | full `W22` report |
| `witness22.out` | `0ca5d482…` | its output; report digest `1238933207ccb85c3aab4424b18d09d12ed285a87c4ee1ac36baea53aff687d3` |
| `w22_direct.py` | `6bf79af4…` | third instrument, direct `k`-subset enumeration |
| `w22_direct.out` | `c206bf36…` | its output |
| `small_witnesses.py` | `d18d2151…` | diamond, `K_{2,3}`, `K_4`, `K_4 ⊔ K_4` |
| `small_witnesses.out` | `e3e51d36…` | its output; digest `9508057…` |
| `btp_probe.py` | `7215d317…` | branch-tree-class random prior (seeds 28051 / 2803) |
| `leg3_probe.py` | `80ca309d…` | pendant-length families |

To replay: run `python3 <file>` in `py/`, and `lake env lean <file>` inside `P1/` or `P2/`, which is
always inside the project.
