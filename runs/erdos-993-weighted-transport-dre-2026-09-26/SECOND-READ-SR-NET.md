# Second Read

Run r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Erdős #993, Cycle 1, isolated second read `SR-NET`: the
network interface (flow, Hall, sign). Date 2026-09-26.

**Boot.** I am operating within VerityOS. I read the constitution `verity.md` and the startup protocol
`identity/startup-protocol.md`. The only subsystem loaded is `experiments/`, limited to this run's sealed SR-NET capsule. The
harness put the root `CLAUDE.md` and the user auto-memory index into context at session start. I did not open either as a
source, and nothing below relies on them.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Protocol and brief.** I read `control/C1-SECOND-READ-PROTOCOL.md` first, then `control/C1-SECOND-READ-BRIEF-SR-NET.md`.
  Both are capsule members, and their digests are verified below.
- **Capsule seal.** For `control/c1-second-read/SR-NET-PACKET-MANIFEST.json` I recomputed SHA-256 over the canonical JSON
  without `seal_sha256` (`sort_keys`, separators `(",", ":")`, no trailing newline). The result is
  **`ee4802e8ac1429e9525e8e277263be33446a2c946f1a7d0ee3efb40ccd6fc2f3`**. It equals the recorded seal and has the dispatched
  prefix `ee4802e8ac1429e9`. Instrument: `scratchpad/c1-sr-SR-NET/seal.py`.
- **Members.** All **31/31** listed members match both SHA-256 and byte count, with 0 mismatches. `file_count` is 31. The
  members include the two contracts, `C1-STAGE6-CONTROLLER-FACTS.json` (`91546889…`), the synthesis (`339a208e…`), the F2 and
  U2 returns, their four critiques, the F and U adjudications, and the 12 frozen `sources/c1-stage7-sources/` files
  (`U2-Main.lean` `110c2751…`).
- **Read boundary.**
  - I read the capsule members, the two boot files, and the pinned Mathlib source
    `Mathlib/Combinatorics/Hall/Basic.lean`. The pin is checked: `git rev-parse HEAD` in the shared `.lake/packages/mathlib`
    gives `905b95818eb32af7874a58b427f50c1711a5e96c`.
  - I read the capsule members in full or by targeted `grep`/`sed` inside them. For the two registries (`CLAIM-IDENTITY*.json`)
    I only ran a key/alias search.
- **Disclosures.**
  1. To find the Mathlib path I ran a non-recursive `ls -la` of the shared project root and of its `.lake/packages`, plus
     `which lean lake elan` and `ls ~/.elan/toolchains`. After the Lean runs I ran a read-only `git status --short` in the shared
     project root. Nothing there was written. Its untracked files predate this session (Aug/Sep timestamps).
  2. I ran `lake env lean` three times on files in my scratch directory, each time after `cd` into the pinned shared project.
     This is elaboration only: no `-o`, no build, and no write to the shared tree.
  3. The harness saved the oversized `SYNTHESIS.md` output in its session tool-results store, and I read it from there. The
     content is the capsule member.
- **Not read:** any other return, critique, adjudication or scratch directory. I also did not read `sources/mathlib-binding/PIN.json`
  or any other experiment root.
- **Process:** no network, no installs, no background job, no `find`, and no search rooted above the capsule members.
  Instruments use the Python standard library with exact integers.

## Statements read

Statements of record: `cycles/cycle-1/stage6/SYNTHESIS.md` (P1–P3, P13; C1-LA1, C1-LA2; Registrations 1–2). Definitions come
from `SEMANTIC-CONTRACT.md` §1, with errata R30-E-a/b (CF6-1).

- **SR-1 (P2, FLOW⇒SIGN).** On every finite simple graph `G` and every `p ≥ 1`, a saturating integral flow at rank `p` with
  `F = F_p(G)` implies `S(G, p) ≤ 0`. The record says it uses (HALL-COND) only at `X = I_{p+1}`.
- **SR-2 (P3 and the C1-LA2 key).** This covers four things:
  - (HALL-COND) for every `X` ⇔ a saturating integral flow exists;
  - both arc types land in `I_p`;
  - the proposed key `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`: "for every finite simple graph `G` and
    `p ≥ 1`, `WeightedHall G (favorableLeaves G p) p → C5LA1.aggregate G p ≤ 0`";
  - the face claim that the converse is false as a statement.
- **SR-3 (P13).** `Σ_{I_{p+1}} |F ∩ B| − Σ_{I_p} |F ∩ A| = Σ_{v∈F} Δ_{p−1}(H_v)`, so the struck weight omits exactly
  `Σ_v Δ_{p−1}(R_v)`. It comes with the four predecessor numbers and the falsity of `Σ_v Δ_{p−1}(T − v)` (−1715 against −1406).
- **SR-4.** This covers three things:
  - the (WID) registration text for `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, pending C1-LA1;
  - the scope note on the `p ≥ 1` guard;
  - the corrected active-tag wording (R30-E-b).

## Independent re-derivation

### D0. Frozen Lean definitions against SEMANTIC-CONTRACT §1.2 (fidelity; any drift?)

I read `U2-Main.lean` lines 1494–1901 (the 18 `E993Transport` declarations after entry 45) and entries 1–14 and 18. Each
definition against its prose:

- `indepFamily G j`: the `j`-subsets of `univ` filtered by `IsIndepSet`. This is `I_j(G)` literally, and it equals
  `indepSetsAvoiding G ∅ j` (the `indepFamily_eq_indepSetsAvoiding` lemma).
- `tagWitnesses G v = (G.neighborFinset (C5LA1.support G v)).erase v`. This is `W_v = N(s_v) ∖ {v}`. On a leaf, `support` is
  the unique neighbour (entry 5 `Classical.choose` spec).
- `activeWeight G F B = #((F ∩ B).filter (¬ Disjoint (B.erase v) (tagWitnesses G v)))`. This is `w_F(B)` of §1.2 literally.
  - It counts active tags, not `|F ∩ B|`.
  - It tests `(B ∖ {v}) ∩ W_v ≠ ∅`, which equals `B ∩ W_v ≠ ∅` since `v ∉ W_v`. It does not use the erroneous shortcut
    `B ∩ N(s_v) ≠ ∅`.
  - C-U2-F's `active_iff_other_neighbour` makes "another neighbour of `s_v`" formal.
- `transportRel`: (D) `∃ q ∈ B, A = B.erase q`, or (S) `∃ u, u ∉ B ∧ |N(u) ∩ B| = 2 ∧ A = insert u (B ∖ N(u))`.
  - This is (REL) literally: exactly two neighbours, `u ∉ B`. It is neither wider (no "two arbitrary deletions") nor narrower.
  - The relation is stated on all finsets. The layers are imposed by `IsSaturatingFlow`'s support clause and by `WeightedHall`'s
    `X ⊆ I_{p+1}` and its `indepFamily G p` target filter.
  - By `transportRel_mem_indepFamily` that target filter is redundant for layer sources.
- `IsSaturatingFlow`: `f : Finset V → Finset V → ℕ` with three clauses:
  - positive only on (layer, layer, arc) triples;
  - `Σ_{A∈I_p} f(B,A) = w(B)` on `I_{p+1}`;
  - `Σ_{B∈I_{p+1}} f(B,A) ≤ w(A)` on `I_p`.

  This is §1.2 literally. The total function with a support clause is the standard encoding of `f : I_{p+1} × I_p → ℕ`.
- `WeightedHall`: `∀ X ⊆ I_{p+1}, Σ_X w ≤ Σ_{A ∈ I_p, ∃ B ∈ X, rel B A} w`. This is (HALL-COND) literally.
- `favorableLeaves G p = leafSet.filter (IsFavorableAt · p)`. This is `F_p(G)` at the original rank, strict (`Δ_p(G − v) < 0`,
  entry 3).
- `C5LA1.aggregate` sums the Δ-form over the same filter, and `forwardDifferenceDel` is `i_{k+1} − i_k` on the original carrier.

**No mathematical drift.** The only deviation is the administrative one already on record: the §2 draft does not compile
verbatim. I replayed both probes:

- `SRNETContractVerbatim.lean` (C-U2-F's verbatim probe after U2's `Main.lean`) gives exactly 4 errors: two
  `dependsOnNoncomputable` (`tagWitnesses`, `activeWeight`) and two `synthInstanceFailed` (`favorableLeaves`, `WeightedHall`).
- `SRNETContractDraft.lean` (C-U2-T's draft with `noncomputable section` and `open Classical in`) gives 0 errors. Its
  `rfl`/`congr`/`Iff.rfl` equivalences to U2's definitions and its four signature `example`s all elaborate.

### D1. Kernel replay (scratch; no grade)

I built `SRNETCheck.lean`: U2's `Main.lean` verbatim, then C-U2-T's `CriticAdvance` body, then C-U2-F's `Critic` body, then two
declarations of my own. I elaborated it from the pinned project (Lean v4.32.2, Mathlib `905b9581…`).

- Result: **0 errors**. Every `#print axioms` gives exactly `[propext, Classical.choice, Quot.sound]`. That covers:
  - all 18 U2 declarations;
  - C-U2-T's `transportRel_mem_indepFamily`, `weightedHall_of_saturatingFlow`, `weightedHall_iff_exists_saturatingFlow`,
    `aggregate_nonpos_of_weightedHall` and `layerWeight_zero_one`;
  - C-U2-F's nine declarations, including `favorableLeaves_zero` and `activeWeightAggregateIdentity_unguarded`;
  - my own `SRNET.aggregate_nonpos_of_wholeLayerHall`.
- The file contains no `sorry`, `admit`, `native_decide` or `axiom`.
- The unused simp argument `hpk2` warning appears at line 1704, as recorded.
- My two declarations:
  1. an `example` stating the proposed C1-LA2 key text verbatim, discharged by `aggregate_nonpos_of_weightedHall`;
  2. `aggregate_nonpos_of_wholeLayerHall`, which takes only the scalar hypothesis `Σ_{I_{p+1}} w ≤ Σ_{I_p} w` at `F_p` and
     concludes `aggregate ≤ 0`.

This is a replay only. A compiled scratch declaration has no grade until its governed award closes (SOLUTION-CONTRACT §4).

### D2. SR-1: FLOW⇒SIGN

Let `f` be saturating at `(F_p(G), p)`, with `p ≥ 1`. Then

`Σ_{B∈I_{p+1}} w(B) = Σ_B Σ_{A∈I_p} f(B,A) = Σ_A Σ_B f(B,A) ≤ Σ_{A∈I_p} w(A)`.

- The first step is the saturation clause, summed. The middle step is Fubini on a finite double sum. The last step is the
  capacity clause, summed over all `A ∈ I_p`.
- By (WID) (P1; `activeWeightAggregateIdentity`, hypothesis `hp` enters here only), `S = supply − capacity ≤ 0`.
- No ℕ-subtraction occurs: the comparison is made in ℕ and then cast to ℤ.

**Where (HALL-COND) is used.** The flow form uses **no** Hall condition at all. It also does not use the flow's arc-support
clause: U2's proof discards it (`obtain ⟨-, hsat, hcap⟩`). Along the route HALL ⇒ FLOW ⇒ SIGN, and in the direct composition, the
sign needs (HALL-COND) only at `X = I_{p+1}`, and there only through the scalar chain

`Σ_{I_{p+1}} w ≤ Σ_{N(I_{p+1})} w ≤ Σ_{I_p} w`

(`N(I_{p+1}) ⊆ I_p`, weights `≥ 0`). The final scalar inequality is **equivalent** to `S ≤ 0` by (WID).
`SRNET.aggregate_nonpos_of_wholeLayerHall` compiles from that scalar hypothesis alone.

So the record's "uses (HALL-COND) only at `X = I_{p+1}`" is correct for the Hall-to-sign composition. For P2 as worded (a flow
hypothesis) it should read "uses only the flow's row and column sums".

**The guard.** `hp` is not load-bearing at `F = F_p`. By `favorableLeaves_zero`, `F_0(G) = ∅`, so the aggregate is 0 at `p = 0`.
It is kept for uniformity with SOLUTION-CONTRACT §2.

### D3. SR-2: (HALL⇒FLOW), its converse, layer closure, the key

**(HALL⇒FLOW), clone expansion.**
- Form `w(B)` clones of each `B ∈ I_{p+1}` and `w(A)` clones of each `A ∈ I_p`. Non-layer sets get 0 clones; in Lean,
  `wSrc`/`wTgt` are `if … then activeWeight else 0`. Join clones whose bases satisfy (REL).
- For a clone set `C`, let `X` be its set of bases. Then `|C| ≤ Σ_X w ≤ Σ_{N(X)} w`, by (HALL-COND) at `X ⊆ I_{p+1}`. The right
  side is the number of target clones joined to `C`. So Hall's marriage condition holds.
- Mathlib `Fintype.all_card_le_filter_rel_iff_exists_injective` (pinned `Hall/Basic.lean:196`) then gives an injection `φ` from
  source clones to target clones, with every clone related to its image. I read the source: the statement quantifies over every
  `Finset α` and needs `[Fintype β]` only.
- Define `f(B,A) := #{source clones of B mapped to clones of A}`. Then:
  - `f > 0` forces a clone of `B` and a clone of `A`, so both are in their layers, and the relation holds;
  - `Σ_A f(B,A) = w(B)`, because `φ` is total and every image lies in a layer;
  - `Σ_B f(B,A) ≤ w(A)`, by injectivity.
- Hypotheses: finiteness (`Fintype V` makes every layer finite) and ℕ weights. No ℕ-subtraction occurs.

**Converse (FLOW⇒HALL).** For `X ⊆ I_{p+1}`:

`Σ_X w = Σ_{B∈X} Σ_{A∈I_p} f(B,A) = Σ_{B∈X} Σ_{A∈N(X)} f(B,A) ≤ Σ_{A∈N(X)} Σ_{B∈I_{p+1}} f(B,A) ≤ Σ_{N(X)} w`.

The second step uses the support clause (`f(B,A) > 0` means `A ∈ N(X)`). The inequality uses `X ⊆ I_{p+1}` and `f ≥ 0`.

**The iff is wider than the brief's wording.** It holds for **every** `F : Finset V`, not only sets of degree-one vertices.
Weights are nonnegative integers whatever `F` is.

**Layer closure.**
- (D): `B ∖ {q}` is independent of size `p`.
- (S): `|B ∖ N(u)| = (p+1) − 2`, and `u ∉ B ∖ N(u)`, so `|A| = p`. `A` is independent because `u` has no neighbour left in
  `B ∖ N(u)`.
- The ℕ-subtraction `(p+1) − 2` is guarded by `|N(u) ∩ B| = 2 ≤ |B|`. In Lean this is `card_sdiff_add_card_inter` plus
  `omega`, with no truncation.

**Key composition.** `WeightedHall G F_p p` ⇒ a flow (HALL⇒FLOW) ⇒ `S ≤ 0` (D2). Only `X = I_{p+1}` is needed, as in D2.

**The converse `S ≤ 0 ⇒ WeightedHall` is false as a graph-generic statement. Exhibited here** (own instrument
`sr_converse_witness.py`; checkable by hand):

- **Witness W1.** `G = P_3 ⊔ K_{6,3,3,3}`, 18 vertices:
  - the path `v – s – w` on vertices 0–1–2;
  - `K` complete multipartite on vertices 3–17, with parts `{3..8}`, `{9,10,11}`, `{12,13,14}` and `{15,16,17}`;
  - `p = 4`; `α = 8`. It is not a tree and not bipartite, and no eligibility is claimed.
- **Independence numbers of `K`:** `i_j(K) = 1, 15, 24, 23, 15, 6, 1` for `j = 0..6`. For `j ≥ 1`, independent sets lie inside
  one part.
- **The selector.** `G − v = (s–w) ⊔ K`, so `Δ_4(G − v) = Δ_4(K) + 2Δ_3(K) = −9 + 2(−8) = −25 < 0`. By symmetry `w` is also
  favorable, so `F_4(G) = {v, w}`, and `K` has no leaves.
- **The aggregate.** `H_v = {w} ⊔ K` and `R_v = K`, so `q_v(j) = i_{j−1}(K)`. Hence
  `S = 2(i_3(K) − i_2(K)) = 2(23 − 24) = −2 < 0`. The instrument gets supply 46 and capacity 48, and asserts
  `supply − capacity = S` before any other output.
- **The deficient family.** `X = {{v,w} ∪ T : T a 3-subset of {3..8}}`: 20 sources of weight 2, total 40.
- **Its neighbourhood `N(X)`**, 75 targets:
  - deleting `v` or `w` gives 40 targets of weight 0;
  - deleting a vertex of `T` gives the 15 sets `{v,w} ∪ pair`, of weight 2;
  - switching at `u = s` (exactly the two neighbours `v, w`) gives `{s} ∪ T`, 20 targets of weight 0;
  - no vertex of `K` has exactly two neighbours in a member of `X`, since every vertex of another part sees all 3 of `T`.

  So `Σ_{N(X)} w = 30 < 40`: deficiency 10.
- **Flow and whole layer.** Max-flow is 36 < 46 (Dinic, exact integers), so no saturating flow exists. The whole-layer instance
  holds (`46 ≤ 48`, every positive target reachable). The separation here comes from the **subfamily quantifier alone**.
- **Witness W2.** `P_3 ⊔ K_{6,3,3,2}`, `p = 4`, gives `S = 0` (supply = capacity = 44). There even the whole-layer instance
  `X = I_5` fails: reachable capacity is 42 < 44, because of the one unreachable positive target `{v,w} ∪ (the 2-part)`. The
  same block family `X` has deficiency 10.
- **Search record** (`bounded_computation`, never proof). Random and exhaustive searches found **no** separating instance in:
  - trees and forests to order 13 (10,489 rows);
  - all labelled graphs with a leaf on ≤ 6 vertices, plus random graphs on 7–10 vertices;
  - `K_{1,r} ⊔ K` for every labelled `K` on ≤ 6 vertices (215,783 rows).

  Separation needs a non-LYM block like the one above. On finite ordinary trees and on eligible rows, no separating instance is
  known. The synthesis R5 ruling stands at that scope.
- **What `p = 1` shows.** At `p = 1`, all capacities vanish (`layerWeight_one`), so `S = supply ≥ 0`, and `S ≤ 0` forces
  supply 0 and hence Hall. The converse therefore holds at `p = 1`. Every separating instance has `p ≥ 2`. By the singleton
  count `Σ_q w(B ∖ q) ≥ (p − 1)·w(B)`, singleton families never separate at `p ≥ 2`.

**The key name.** `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` is a predicate that the statement satisfies.
It names an implication from (HALL-COND) on the transport network to a nonpositive aggregate. It asserts neither that (HALL)
holds nor that the aggregate is nonpositive, and it claims no converse or equivalence. The registry search found no alias:

- no run-local or master key matches `HALL.*(IMPLIES|NONPOS)` or `NONPOSITIVE-AGGREGATE`;
- the only lexical neighbour is `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG` (REFUTED), a different object (Retag
  edges, per-tag sign).

A `CLAIM-DISTINCTIONS` row against that key and against (HALL) is advisable.

### D4. SR-3: the literal-weight identity (P13)

For `v` of degree one and `j ≥ 1`, `B ↦ B ∖ {v}` is a bijection from `{B ∈ I_j(G) : v ∈ B}` onto `I_{j−1}(H_v)`:

- `v ∈ B` forces `s_v ∉ B`;
- conversely `A ∪ {v}` is independent, since `N(v) = {s_v}` and `s_v ∉ A`.

So `Σ_{B∈I_j} |F ∩ B| = Σ_{v∈F} i_{j−1}(H_v)`. Taking `j = p+1` and `j = p` needs **`p ≥ 1`** for the second. Subtracting gives
`Σ_v Δ_{p−1}(H_v)`. By (WID) the active difference is `Σ_v [Δ_{p−1}(H_v) − Δ_{p−1}(R_v)]`, so
**literal − active = `Σ_{v∈F} Δ_{p−1}(R_v)`** for every `F`. At `F = F_p`, the active difference is `S`.

**The guard is needed.** With ℕ-truncated `p − 1` (the contract's convention), P13 fails at `p = 0`:
- `K_{1,4}`: left side 4, right side 8;
- `K_{1,5}`: 5 against 15.

With integer rank `−1` and zero extension, it holds at `p = 0` (`sr3_p0_guard.py`). The synthesis row P13 omits `p ≥ 1`. F2's
§B1 inherits it from §A ("an integer `p ≥ 1`"), so this is a transcription repair.

**Own recomputation** (`sr3_pathstar.py`). I built the trees from the prose recipe: path `0–1–2`, one centre per profile entry
attached to `0`, and private tips on each centre. Each tree passes separate edge-count and connectivity tests. `x` is computed
through rank `α` including the terminal difference, and eligibility is asserted. I asserted `supply − capacity = S` first.

| profile | n | α | x | eligible p | \|F\| (= all leaves) | S | active sup/cap/max-flow | arcs | literal sup/cap | literal diff = Σ Δ_{p−1}(H_v) | Σ Δ_{p−1}(R_v) | Σ Δ_{p−1}(T−v) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| (2,3,4) | 15 | 11 | 5 | {7} | 10 | **−1218** | 1483 / 2701 / 1483 | 2025 | 1563 / 2969 | **−1406** | −188 | **−1715** |
| (2,2,4,3) | 18 | 13 | 6 | {8} | 12 | **−5434** | 8033 / 13467 / 8033 | 11691 | 8751 / 15468 | **−6717** | −1283 | −8497 |

- All four predecessor numbers are reproduced. Both active networks saturate, and so do the literal ones (1563 and 8751).
- `literal − S` is −188 and −1283 respectively, which equals `Σ_v Δ_{p−1}(R_v)` exactly.
- The allocation's `Σ_v Δ_{p−1}(T − v)` is false. It gives −1715 against −1406, which is C-F2-T's number, reproduced. The
  second profile gives −8497 against −6717, new here.

**Generic check** (`sr_generic.py`, 700 random graphs with pendant vertices and random degree-one `F`). The results:
- P13 holds on 3,022 `(G, F, p ≥ 1)` rows;
- (WID) in its general form holds on 3,022 rows, and at `F_p` on 3,722 rows;
- at `p = 0`, `F_0 = ∅` in 700/700 instances;
- the ℕ-truncated general right side at `p = 0` equals `Σ_{v∈F} |W_v|` in 700/700 instances;
- HALL⇔FLOW agrees on 2,615 rows, checked by brute force over every `X ⊆ I_{p+1}` against Dinic max-flow, with 0 disagreements;
- no row saturates while `S > 0`.

### D5. SR-4: (WID) scope and R30-E-b

**(WID) proof.** I checked the frozen bijection (`card_active_eq_tagged`) against the §1.2 proof of record.
- Forward direction: `B ∋ v`, independent, `v` active. `B ∖ {v}` avoids `v` and `s_v` (independence and `s_v ~ v`), and it meets
  `W_v ⊆ R_v`, so it is in `taggedFamily G (univ ∖ H_v) R_v (j−1)`.
- Backward direction: `insert v A` is independent (`leaf_insert_indep`). It meets `W_v` because `A` avoids `s_v`, so `A ∩ R_v`
  lies in `N(s_v) ∖ {v}`.
- `tagged_count_split` turns the tagged counts into `i(H_v) − i(R_v)`. The ℕ-subtraction `p + 1 − 1 = p` is exact, and `p − 1`
  is exact under `hp`.
- The general form therefore holds for every finite simple graph, every finite set `F` of degree-one vertices, and every `p ≥ 1`.

**The guard, precisely.** Two facts, checked on `K_{1,3}` at `p = 0`:
- (a) The general-`F` form **as written in Δ-form with ℕ-truncated `p − 1`** (Lean `layerWeight_sub_eq_sum`) fails at
  `p = 0`. The left side is `0 − 0 = 0` (`layerWeight_zero_one`). The right side is `Σ_v [Δ_0(H_v) − Δ_0(R_v)] = 3·(1 − (−1)) = 6`.
  In general the right side at `p = 0` is `Σ_{v∈F} |W_v|`.
- (b) The `F_p` form holds at `p = 0`. `Δ_0(G − v) = i_1(G − v) − i_0 = (n − 1) − 1 = n − 2 ≥ 0`, because a leaf forces
  `n ≥ 2`. So `F_0 = ∅` and both sides are 0. This is compiled as `activeWeightAggregateIdentity_unguarded` (C-U2-F). My
  instrument shows `Δ_0(K_{1,3} − v) = 2` for every leaf and `aggregate = 0`.
- **Precision repair.** In the registry's own **q-form with integer ranks**, `q_v(0) − q_v(−1) = (1 − 1) − 0 = 0`, so the
  general identity also holds at `p = 0` (`K_{1,3}`: 0 = 0; `K_{1,4}`, `K_{1,5}`: 0 = 0). "Load-bearing" is therefore a
  property of the ℕ-truncated Δ-form, and the note must say so.

**R30-E-b.**
- `(B ∖ {v}) ∩ W_v = B ∩ W_v`, because `v ∉ W_v`. This equals `(B ∩ N(s_v)) ∖ {v}`, not `B ∩ N(s_v)`: `v ∈ B ∩ N(s_v)`
  always, which is C-U2-F's `prose_test_always_true`.
- The correct test is "`B` contains another neighbour of `s_v`", that is `B ∩ W_v ≠ ∅`. The §1.2 English sentence and the
  registry statement already use it. The §1.2 shortcut sentence and the §3 "Active tag" gloss are the erroneous ones.
- Every instrument here implements the correct test, as do U2's `activeWeight` and the registry's WID statement text.

## Findings and repairs

1. **SR-1, wording.** The flow form uses no Hall condition and not the arc-support clause, only the row and column sums. "Only
   at `X = I_{p+1}`" belongs to the Hall ⇒ sign composition, and there the used content is the scalar `supply ≤ capacity`,
   which is equivalent to `S ≤ 0` by (WID). `hp` is not load-bearing at `F_p`. Repair: the record text below.
2. **SR-2, the converse-falsity face claim was unsupported as recorded; now supported.**
   - The synthesis cites R5 for "the converse is false as a statement". R5 says only that no separating instance is known on
     eligible rows. Being "strictly stronger as a statement" is not falsity of the converse.
   - This read supplies the missing witness on general graphs: W1 (`S = −2`, deficiency 10) and W2 (`S = 0`).
   - The face must carry the witness and must say that on trees and eligible rows no separating instance is known.
3. **SR-2, attribution.** The composed statement `aggregate_nonpos_of_weightedHall` was first compiled by **C-U2-T**
   (`C-U2-T-CriticAdvance.lean`, CA-4). C-U2-F compiled the converse, the iff and the layer closure independently, but not the
   composition. Both facts travel on the face.
4. **SR-2, scope precision.** The iff and the layer closure hold for every `F : Finset V`. The key itself is at `F = F_p(G)`.
5. **SR-2, registration branch conflict (controller decision, flagged, not decided here).**
   - Synthesis Registration 2: if C1-LA2 does not close, "do not register; it rides as companions".
   - Brief SR-2 and CF6-5(i): a kernel-checked companion "registers `proved_informal`".
   - I give both texts. If the controller follows the synthesis, the `proved_informal` text serves as the companion record on
     C1-LA1's face.
6. **SR-3, missing guard.** P13 needs `p ≥ 1` under the ℕ convention (`K_{1,4}`, `p = 0`: 4 against 8). It is restored in the
   record text. The four numbers are confirmed. The two `Σ Δ_{p−1}(R_v)` values (−188, −1283) and the second `T − v` value
   (−8497) are new here.
7. **SR-4, guard note precision.** Load-bearing only for the ℕ-truncated Δ-form. The q-form with integer ranks holds at `p = 0`.
   The corrected active-tag wording is confirmed.
8. **Fences checked on every text below.**
   - Mechanism ≠ aggregate: no text moves the primary aggregate, and none states (HALL) or any tree instance of (HALL-COND).
   - The W1/W2 witnesses are non-tree general graphs and say nothing about (HALL) on trees.
   - No RTree wording.
   - No refuted key is revived. The network facts are generic and are not a transport mechanism.
   - No census value enters a proof.

## Registration text

### SR-2 — key `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (new)

**Branch A (only if award C1-LA2 closes under governance):**

```text
key: E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE
status: VERIFIED
grade: formally_verified (award C1-LA2; terminal theorem E993Transport.aggregate_nonpos_of_weightedHall)
statement: For every finite simple graph G and every natural p >= 1: if the weighted Hall condition of the r30
  transport network holds at rank p with the fixed original strict selector F = F_p(G) (the leaves v of G with
  Delta_p(G - v) < 0) -- that is, for every family X of independent (p+1)-sets,
  sum_{B in X} w_F(B) <= sum_{A in N(X)} w_F(A), where w_F(B) counts the tags v in F ∩ B for which B contains another
  neighbour of v's support s_v (B ∩ W_v ≠ ∅, W_v = N_G(s_v) \ {v}), and N(X) is the set of independent p-sets joined to
  some member of X by a deletion (A = B \ {q}, q in B) or a two-for-one switch (u not in B, |N_G(u) ∩ B| = 2,
  A = (B \ N_G(u)) ∪ {u}) -- then S(G, p) = C5LA1.aggregate G p <= 0.
  Lean: aggregate_nonpos_of_weightedHall (G) [DecidableRel G.Adj] (p) (hp : 1 <= p)
        (h : WeightedHall G (favorableLeaves G p) p) : C5LA1.aggregate G p <= 0.
scope: Graph-generic (no IsTree, bipartiteness or eligibility). An implication only: the hypothesis quantifies over
  every X, but the proof uses (HALL-COND) only at X = I_{p+1}, and there only through
  sum_{I_{p+1}} w_F <= sum_{N(I_{p+1})} w_F <= sum_{I_p} w_F, which by (WID) is S(G, p) <= 0 itself. The converse
  (S(G, p) <= 0 implies WeightedHall G F_p(G) p) is FALSE on finite simple graphs: G = P_3 ⊔ K_{6,3,3,3}
  (path v-s-w; K complete multipartite with parts of sizes 6,3,3,3), p = 4, F_4(G) = {v, w}, supply 46,
  capacity 48, S = -2, while X = {{v,w} ∪ T : T a 3-subset of the 6-part} has weight 40 and neighbourhood weight 30
  (deficiency 10; max-flow 36 < 46); with parts 6,3,3,2, S = 0 and X = I_5 itself is deficient (44 > 42). Both are
  non-bipartite, non-tree graphs; on finite ordinary trees and on eligible rows no separating instance is known (none
  claimed). At p = 1 the converse holds (all capacities vanish). The guard p >= 1 is not load-bearing here
  (F_0(G) = ∅); it is kept for uniformity. Companions on the face (no certificates, R29-N-12):
  aggregate_nonpos_of_saturatingFlow, exists_saturatingFlow_of_weightedHall, card_sigma_fiber_filter,
  weightedHall_of_saturatingFlow, weightedHall_iff_exists_saturatingFlow (any finite F, any p),
  transportRel_mem_indepFamily (both arc types land in I_p).
excluded: (HALL) E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL itself; any tree or eligible-row instance of
  (HALL-COND); E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE (moves only when a (HALL) award composes with this
  implication under its own certificate); E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER,
  E993-BETA-AGG, Erdős #993; any governed-model (RTree) statement.
fences: mechanism != aggregate; w_F is the active-tag weight (never |F ∩ B|); transportRel is (D) ∪ (S) literally
  (exactly two neighbours, u not in B); F fixed at the original rank p; no refuted key revived.
distinctions: not E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL (the OPEN mechanism; this key assumes it);
  not E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG (REFUTED; literal Retag relation, per-tag sign).
aliases: "(HALL-COND) implies S <= 0", "weighted Hall implies nonpositive aggregate", "E993-R30-HALL-SIGN";
  alias_patterns: "weighted.hall.*(implies|=>).*(aggregate|S <= 0)".
attribution: transport network, active-tag weight and relation: Codex (GPT-6 Astra/Sol/Luna), lower-region run;
  FLOW=>SIGN and HALL=>FLOW as stated consequences: SEMANTIC-CONTRACT §1.2 (r30 controller); informal proofs: r30 F2
  (Claude Sonnet 5); Lean proofs of (WID), FLOW=>SIGN, HALL=>FLOW: r30 U2 (Claude Sonnet 5); the composed statement
  first compiled by critic C-U2-T; converse, iff and layer closure: C-U2-T and C-U2-F (independently; Claude Opus 5.5);
  definitions of record (entries 1-18, 42): first-interior run (Codex) on the r24/r25/r26 C4LA1/C5LA1 layers;
  converse-falsity witnesses: r30 second read SR-NET (Claude Opus 5.5); reconciliation: T/F/U adjudicators and the
  Stage 6 synthesis.
```

**Branch B (C1-LA2 does not close):** use the Branch A text with these three changes.
- Replace `status`/`grade` with: `status: VERIFIED; grade: proved_informal (kernel-checked in scratch by U2 and C-U2-T,
  replayed by SR-NET; no award)`.
- Drop the "Lean:" line's certificate claim, keeping the Lean text as a pointer to scratch.
- Leave the rest unchanged.

Under the synthesis's own ruling (Registrations 2), no key is registered in Branch B. The same text then serves as the
companion record on C1-LA1's face at `proved_informal`. That choice belongs to the controller (Finding 5).

### SR-4 — key `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (registered OPEN; changes only on C1-LA1)

```text
key: E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY
status: VERIFIED only on award C1-LA1's governed close (formally_verified; terminal theorem
  E993Transport.activeWeightAggregateIdentity); until then status stays OPEN with scope note
  "proved_informal (r30 F2; T/F/U adjudicators; SR-NET re-derivation); kernel-checked in scratch (U2; replayed by
  SR-NET), no grade until C1-LA1".
statement: (WID) For every finite simple graph G, every finite set F of degree-one vertices of G (each v in F with its
  unique neighbour s_v), and every integer p >= 1, with W_v = N_G(s_v) \ {v} and the active-tag weight
  w_F(B) = #{v in F ∩ B : B contains another neighbour of s_v} = #{v in F ∩ B : (B \ {v}) ∩ W_v ≠ ∅}:
  sum_{B independent, |B| = p+1} w_F(B) - sum_{A independent, |A| = p} w_F(A) = sum_{v in F} [q_v(p) - q_v(p-1)],
  q_v(j) = i_j(G - {v, s_v}) - i_j(G - N_G[s_v]). With F = F_p(G): supply - capacity = S(G, p) = C5LA1.aggregate G p.
scope: graph-generic; no sign content (nothing about S <= 0, any flow, or any Hall condition). The guard p >= 1 is
  load-bearing for the general-F identity in its Delta-form with natural-number (truncated) p - 1 (Lean
  layerWeight_sub_eq_sum): K_{1,3}, p = 0 gives 0 against 6, and in general the truncated right side at p = 0 is
  sum_{v in F} |W_v|; in the q-form above with integer ranks and zero extension both sides vanish at p = 0. It is not
  load-bearing for the F_p form: no leaf is favorable at p = 0 (Delta_0(G - v) = n - 2 >= 0), so F_0(G) = ∅ and both
  sides are 0 (activeWeightAggregateIdentity_unguarded, C-U2-F). Erratum R30-E-b: the active test is B ∩ W_v ≠ ∅; the
  shortcut "(B \ {v}) ∩ W_v = B ∩ N(s_v)" and the gloss "B ∩ N_T(s_v) ≠ ∅" are wrong (v lies in B ∩ N(s_v) always).
excluded: (HALL); the sign of S; E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE; any tree-only statement; RTree.
fences: w_F is the active-tag weight, never |F ∩ B| (which measures sum_v Delta_{p-1}(H_v) instead, P13);
  F fixed at the original rank p; graph-generic.
attribution: active-tag weight and mechanism, and their corrections: Codex (GPT-6 Astra/Sol/Luna), lower-region run
  (C6-U6 bijection, C6-AF); definitions of record: first-interior run (Codex), entries 1-18 and 42, on the
  r24/r25/r26 definition layers; informal proof: r30 F2 (Claude Sonnet 5); Lean: r30 U2 (Claude Sonnet 5);
  guard analysis and unguarded form: C-F2-U, C-U2-T, C-U2-F (Claude Opus 5.5); R30-E-b: C-U2-F; second read: SR-NET.
```

### SR-1 — record text (P2; companion, no key)

```text
record: P2 (FLOW=>SIGN). For every finite simple graph G and every natural p >= 1: if f is a saturating integral flow
  of the r30 transport network at rank p with F = F_p(G) (f natural-valued, positive only on (D) ∪ (S) arcs from
  I_{p+1} to I_p, sum_A f(B,A) = w_F(B) for every B in I_{p+1}, sum_B f(B,A) <= w_F(A) for every A in I_p), then
  S(G, p) <= 0. Proof: sum_{I_{p+1}} w_F = sum_B sum_A f = sum_A sum_B f <= sum_{I_p} w_F, then (WID). The proof uses
  only the flow's row and column sums (not the arc-support clause, and no Hall condition); along HALL => FLOW => SIGN,
  (HALL-COND) is used only at X = I_{p+1}, and there only through supply <= capacity, which by (WID) is S <= 0 itself.
  p >= 1 enters only through (WID) and is not load-bearing at F_p (F_0 = ∅).
grade: proved_informal; kernel-checked in scratch (U2 aggregate_nonpos_of_saturatingFlow; SR-NET replay and
  SRNET.aggregate_nonpos_of_wholeLayerHall); no certificate of its own (R29-N-12).
attribution: statement: SEMANTIC-CONTRACT §1.2 (r30 controller) on the Codex lower-region network; informal proof r30 F2;
  Lean r30 U2; whole-layer precision: SR-NET.
fences: graph-generic; says nothing about whether any flow exists on any tree; mechanism != aggregate.
```

### SR-3 — record text (P13; record correction, no key)

```text
record: P13 (literal-presence identity). For every finite simple graph G, every finite set F of degree-one vertices and
  every p >= 1: sum_{B in I_{p+1}} |F ∩ B| - sum_{A in I_p} |F ∩ A| = sum_{v in F} Delta_{p-1}(H_v),
  H_v = G - {v, s_v}; hence (literal difference) - (active difference) = sum_{v in F} Delta_{p-1}(R_v),
  R_v = G - N_G[s_v], and at F = F_p(G) the struck literal weight omits exactly sum_v Delta_{p-1}(R_v) from S(G, p).
  (The guard p >= 1 is needed with natural-number p - 1: K_{1,4}, p = 0 gives 4 against 8.) The allocation's suggested
  form sum_v Delta_{p-1}(T - v) is false. Path-star (2,3,4), p = 7: S = -1218, literal -1406 = sum Delta_6(H_v),
  sum Delta_6(R_v) = -188, sum Delta_6(T - v) = -1715; path-star (2,2,4,3), p = 8: S = -5434, literal -6717,
  sum Delta_7(R_v) = -1283, sum Delta_7(T - v) = -8497 (bounded_computation; F = all leaves; eligible).
grade: proved_informal (identity); bounded_computation (numbers).
attribution: identity r30 F2 (§B1); T - v refutation C-F2-T; replays C-F2-U, F adjudicator, SR-NET; C6-F5 localization:
  lower-region C6-F5 root correction (Codex), C6-AF.
fences: record correction only; the literal weight is struck; nothing about (HALL) or the sign of S.
```

## Verdicts

verdict[SR-1]: confirmed_with_repairs
verdict[SR-2]: confirmed_with_repairs
verdict[SR-3]: confirmed_with_repairs
verdict[SR-4]: confirmed_with_repairs

- SR-1: the mathematics is confirmed. The wording is repaired: no Hall condition is used in the flow form, and the whole-layer
  instance is the used content of the composition.
- SR-2: the implication, the iff, the layer closure and the key predicate are confirmed. The converse-falsity claim was
  unsupported as cited and is now supported by witnesses W1/W2. The attribution of the composition to C-U2-T is added. The
  grade stays conditional on C1-LA2.
- SR-3: the identity and all four numbers are confirmed. The `p ≥ 1` guard is restored.
- SR-4: the registration text is confirmed. The guard note is made precise (ℕ Δ-form only), and R30-E-b is confirmed.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-sr-SR-NET/`
(Python standard library, exact integers; Lean v4.32.2 / Mathlib `905b9581…`, elaboration only).

| file | sha256 | role |
|---|---|---|
| `seal.py` | `2178a29e3c6880ec42c8fee91b509c19cd0bdeefacce83f941c2f98e3c33bab5` | capsule seal and 31 member digests |
| `srnet_lib.py` | `dd0b6c5e951a8870661022d685c92616f536c7f9ba121b9055c536b2e6ace601` | own instrument: layers, Δ, `F_p`, aggregate, active and literal weights, (D) ∪ (S), Dinic |
| `sr3_pathstar.py` / `.json` | `8b1008b4…aebd9` / `05e6cec3…c2e0` | SR-3 path-star numbers, flows, arcs |
| `sr3_p0_guard.py` / `.json` | `6c58c892…31b3` / `843d53d1…c599` | `p = 0` behaviour of P13 and (WID) |
| `sr_generic.py` / `.json` | `3b08740b…d9fd` / `ac3337f7…e5` | WID/P13/guard/iff/FLOW⇒SIGN on random graphs |
| `sr_rowcheck.py` | `010db3df…b1d3` | shared row checker |
| `sr_converse_search.py` / `.json` | `d7ea7006…fdc4` / `4f53cda1…945` | trees/forests search (none) |
| `sr_converse_exhaustive.py` / `.json` | `042bfe6e…9d15` / `7804925d…c94` | exhaustive ≤ 6 and random 7–10 (none) |
| `sr_converse_union.py` / `.json` | `4e58110474c3…227e` / `7aa3dc7e…86fd` | `K_{1,r} ⊔ K` search (none) |
| `sr_converse_witness.py` / `.json` | `64b37577ce382e5c484dc0a11e5009af8ce4c330ffcabb7c92cba185b577fb97` / `0e8ba06fffb31ff387947fc492b7b945933abe757f1cc551e87677fa27e9bcf1` | converse witnesses W1 and W2 |
| `sr_k13_and_wholelayer.py` / `.json` | `0b00e687…aa0e` / `0a5f7ec6…e01e` | `K_{1,3}` guard (0 vs 6; `F_0 = ∅`); whole-layer reachability of W1/W2 |
| `SRNETCheck.lean` / `.log` | `72af8be3b44018cc3827e29a6a3568768cf80070455eb0a1717ad27626bc0bdd` / `2ae0b06c957e2bbb6e5671016461d2bb55596ba9fcbb48da95c8b59bc9644387` | kernel replay: U2 + C-U2-T + C-U2-F + SRNET, 0 errors |
| `SRNETContractDraft.lean` / `.log` | `8072fd60…97e5` / `763be8fa…292c` | C-U2-T draft-equivalence replay, 0 errors |
| `SRNETContractVerbatim.lean` / `.log` | `55a37a8f…0d82` / `48aac119…1e3d` | C-U2-F verbatim probe, 4 expected errors |

- Replay: `cd` into the scratch root and run `python3 -B <script>`. For the Lean files, `cd` into
  `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project` and run `lake env lean <scratch>/<file>.lean`.
- No sealed member was edited, and no background job was started.
- Deliverable: `second-reads/SR-NET/SECOND-READ.md` (this file).
