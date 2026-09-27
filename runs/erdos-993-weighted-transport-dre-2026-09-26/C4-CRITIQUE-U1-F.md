# Critique

Critic `C-U1-F` (orientation F, falsify), r30 Cycle 4 Stage 4, of seat `U1`: route `C4-U-01 LEAN-GK-SIGN-AND-NM-ENCODING`, orientation U.
Return: `cycles/cycle-4/stage3/returns/U1/RETURN.md`.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. The host injected the project
`CLAUDE.md` and the memory index into my context at session start. I did not open or act on either.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Dispatch.** The SHA-256 of `control/dispatch/c4-stage4/DISPATCH-C-U1-F.md` is `e01268d72f9e0b088d99d14c211cf1c89d966f59db05b6e12b0af93defdcd9d3`. It matches the value the wrapper gave. I verified it before following the file.

## Identity and seal audit

- **Capsule seal.** For `control/c4-critic-capsules/U1-PACKET-MANIFEST.json` I recomputed the canonical seal: compact key-sorted JSON without `seal_sha256`, no trailing newline. The result is **`17caaa960aa81d4152a5e00b79677dde141a19e6681bffe5e1ad8c830fb36408`**, which matches the dispatch. All 14 members match their listed byte counts and SHA-256 values.
- **Other seals**, recomputed canonically the same way:
  - Stage 4 dispatch manifest: `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`. Matches.
  - Stage 3 manifest (a capsule member): `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`. Matches.
  - Stage 2 manifest: `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`. Matches.
- **`control/SOURCE-DIGESTS.json`.** I re-digested all 981 files under `sources/`. There were 0 mismatches and 0 missing files.
- **The return's digests**, re-hashed by me:
  - `C4U1.lean`: `2b9f09d8…5839b5`, 23,547 bytes.
  - `AxiomCheckC4U1.lean`: `eb5930be…ef03ab`, 1,164 bytes.
  - Seeded `Main.lean`: `22e3f81c487697912e3e94741eeb27e580324fd1bf3e06f52afaebc667e04a45`, 2,187 lines, 100,005 bytes.
  - The three copies under `scratchpad/c4-U1-replay/` have the same digests.
  - The seeded `Main.lean` has the same SHA-256 as C3-LA1's award `Main.lean`. I checked this with a digest-only `shasum`; see disclosures.
  - `lakefile.toml`, `lake-manifest.json` and `lean-toolchain` are byte-identical to C1-LA1's scaffold. `LeanProof.lean` differs by the disclosed `import LeanProof.C4U1` line.
  - The Mathlib revision in the manifest is `905b95818eb32af7874a58b427f50c1711a5e96c`, which equals `sources/mathlib-binding/PIN.json`.
  - `.lake/packages` is a symlink to the shared tree in both the development and replay copies.
- **Carried fragments.** Each first-interior snippet fragment used by C1-LA1 appears byte-for-byte in the seeded `Main.lean`: entries 0001–0006, 0008–0013 and 0018 (`sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Snippets/`). Entries 0007 (`leafDegree`), 0014 (`crossingIndex`) and 0015–0017 are not carried. That was the award's choice, not U1's. Note for Stage 7: the §2 (HALL) draft names `C5LA1.crossingIndex`, so an award that states it must carry entry 0014.
- **Contract definitions.** The carried `E993Transport` definitions match `SOLUTION-CONTRACT.md` §2 textually: `indepFamily`, `tagWitnesses`, `activeWeight`, `layerWeight`, `favorableLeaves`, `transportRel` and `IsSaturatingFlow`. This covers the fidelity points for the weight (ACTIVE tags via `B.erase v` against `tagWitnesses`), the relation ((D) ∪ (S) with exactly two neighbours), and `F` fixed at `p` through `IsFavorableAt` (`i_{p+1}(G−v) − i_p(G−v) < 0`). U1 edits none of them.
- **Read-boundary disclosures (mine).** Each item below was in service of a duty the attack brief names.
  - (i) I read `control/C4-WORKER-COMMON-BRIEF.md` in full. It is a Stage 2 member, and the common brief says critics may read it.
  - (ii) With `json.load` I pulled the one entry `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` from `control/CLAIM-IDENTITY.run-local.json`. I first verified the file against its Stage 2 digest. I also ran a lexical alias scan of `claim_key`/`aliases` for my candidate names. This file is a Stage 2 member granted by the worker brief, but it is not a capsule member.
  - (iii) I ran digest-only and size-only commands (`shasum`, `wc -c`) on `runs/lean-2026-09-27-c3-la1-…/LeanProject/LeanProof/Main.lean` and `runs/lean-2026-09-26-c1-la1-…/LeanProject/LeanProof/Main.lean`, and `shasum` on C1-LA1's four scaffold files. I did not read their content.
  - (iv) I ran non-recursive `ls` on `sources/` and three of its subdirectories (within grant), and on the U1 scratch and replay project directories (the inventoried artifacts).
  - (v) I ran one `grep` over two files in `sources/c3-stage7-sources/` (within grant) to find the `Rdel` definition of record.
  - I read no sibling return, critique, adjudication, other experiment root or external source. I used no network and installed no packages. Every Python call used `python3 -B`. Every `lake`/`lean` call was made from inside my pinned copy.

## Independent re-derivation

**Lean rebuild, copy-out-first.**
- I copied the scaffold, `Main.lean`, `C4U1.lean` and `AxiomCheckC4U1.lean` from `scratchpad/c4-U1/LeanProject/` into `scratchpad/c4-crit-U1-F/LeanProject/`. I bound the shared Mathlib by a manual `.lake/packages` symlink. I did not copy U1's build cache.
- From inside the project, `lake build` succeeded from scratch (8658 jobs). The only diagnostics were two `unusedSimpArgs` linter warnings at `C4U1.lean:366`.
- `lake env lean LeanProof/AxiomCheckC4U1.lean` reproduced U1's shipped 18-line axiom output byte for byte. I diffed it against the return.
- **My own probe** (`CritAxU1F.lean`) covers all 25 declarations in `C4U1.lean`, including the seven that U1 did not probe:
  - `instDecidableRelSum`, the anonymous `instDecidableRelProdFinBoolAdjMatchingGraph`, `matchingGraph` and `encode`: `[propext, Quot.sound]`.
  - `IsSaturatingFlowQ`, `decode` and `rk`: `[propext, Classical.choice, Quot.sound]`.
  - The other 18 declarations give exactly what U1 printed.
- A token search of `C4U1.lean` finds `sorry`, `admit`, `native_decide` and `axiom` only in the header comment (lines 9–10). There is no `decide` anywhere.

**Statements read against their intent** (`#check`):
- **Part A.** `indepSetCount_sum_eq` states `C5LA1.indepSetCount (G ⊕g H) ∅ k = Σ_{i≤k} indepSetCount G ∅ i · indepSetCount H ∅ (k−i)`. `⊕g` is Mathlib's `SimpleGraph.sum`: the disjoint union on `V ⊕ W`, with no edges across summands (`not_adj_sum_inl_inr`). The identity is the one claimed.
- **Part B.** `IsSaturatingFlowQ` is SR-C3-7's B7 face exactly:
  - `f ≥ 0` everywhere;
  - positive flow only on `transportRel` arcs from `I_{p+1}` to `I_p`;
  - equality at every source;
  - `≤` at every target.

  The conclusion is `WeightedHall`, i.e. (HALL-COND) for every `X ⊆ I_{p+1}`. Both hypotheses SR-C3-7 showed load-bearing are present: nonnegativity, and support within the layers.
- **Part C.** `matchingGraph N` is literally `N` disjoint edges on `Fin N × Bool`.
- **Part D.** The statements are correct as written.

**Own numeric instrument** (`crit_check.py`, stdlib only, exact integers, fixed seed; output digest `sha256(output-json)=5a1775eb…c521a2`):
- **Part A convolution.** 1,589 random `(G, H, k)` instances, 0 failures.
- **Part C.** For `N = 0..5`:
  - the rank-`k` independent-set counts equal `C(N,k)·2^k`;
  - encode and decode are mutually inverse on all `3^N` states and all independent sets;
  - rank equals cardinality;
  - erase⇒update holds.

  The **converse** also holds: every `Rdel` step from `encode B` is realised by an erase. That is true, but U1 does not state it; see Attacks.
- **Weight code validated on the fixed points** (with `F_p` derived from `i_{p+1}(T−v) − i_p(T−v) < 0`, each object checked to be a tree):
  - `K_{1,12}` at `p = 8`: `|F| = 12`, supply 1980, capacity 3960, supply − capacity −1980.
  - Path-star `(2,3,4)` at `p = 7`: `n = 15`, `|F| = 10`, supply 1483, capacity 2701.

  These check only my weight implementation. U1 ships no numeric claim, so no `S` or (WID) assertion is at stake in this return, and I make none.
- **`CB(d,m)` root-plus-arm sector** (`Q = {r, v}`), on `(1,1)`, `(1,3)`, `(2,2)`, `(3,2)` and `(2,3)`:
  - every sector member has active weight exactly 1 for `F` = all leaves and for every tested `F ∋ v`;
  - the weight is 0 for `F ∌ v`;
  - `|R_j| = 2^j·C(dm, j)`;
  - the hypotheses of my lemma below hold: `r ∈ W_v`, and `W_{c_ij} = {u_i} ⊆ N[Q]∖Q`.

  I also report the derived ranks where `v ∈ F_p` (for example `CB(2,2)`: `p ∈ {4..7}`). All of this is `bounded_computation`.

## Attacks and findings

1. **Part A is correct but, as shipped, sits beside GK-SIGN's path.** The attack brief asked whether U1 states the bridge from its lemma to a cut-vertex deletion. It does not.
   - The carried counter `C5LA1.indepSetCount G D k` counts independent `k`-sets of the **ambient** type that avoid a deletion set `D`. GK-SIGN's `H_v` and `R_v` are exactly such avoiding-set counts on `G_k`.
   - Part A applies only to `D = ∅` on a `SimpleGraph.sum` type.
   - Using it at a deletion takes three missing bridges:
     - (a) `indepSetCount G D k = indepSetCount (G.induce Dᶜ) ∅ k`;
     - (b) a graph isomorphism from the induced graph onto a `SimpleGraph.sum`, with `indepSetCount` invariant under it;
     - (c) nested `Sum` types for the `k+1` pieces of `H_1`.
   - None of these is stated. The return's phrase "the Vandermonde convolution GK-SIGN's derivation uses implicitly at every cut-vertex deletion" describes the mathematics, not the compiled statement.
   - **Critic-derived advance 1** below closes this gap directly in the ambient type.
2. **Part B is faithful, and it is a ℚ-retyping.**
   - Its proof is the ℕ companion's three-step chain, with `sum_le_sum_of_subset_of_nonneg` replacing ℕ monotonicity. This is new vocabulary (`IsSaturatingFlowQ`), not new mathematics.
   - I compiled (`CritInstDriftU1F.lean`) that every ℕ `IsSaturatingFlow` casts to an `IsSaturatingFlowQ`. B7 therefore subsumes the ℕ companion's hypothesis.
   - I also compiled that the restricted form with `Y` = the whole layer yields `WeightedHall` by plain `exact`. So there is no decidability-instance drift in the filter, even though the section has `open scoped Classical`.
   - **Falsification point.** In `weightedHall_on_of_saturatingFlowQ_restricted`, the capacity hypothesis sums only over sources in `Y`. A per-class certificate therefore ignores competition for target capacity from sources outside `Y`. Class-wise certificates do **not** compose to (HALL) unless one global capacity constraint is checked. The return's sentence "this is the shape a coupled per-class certificate … would actually ship" must carry that fence. A restricted certificate proves (HALL-COND) only for `X ⊆ Y`, which is a family statement and not (HALL).
3. **Part C supplies less than "closes node (N1)".**
   - (a) `erase_iff_Rdel` is an equation, erase ⇒ `update … none`. It is not an iff, and the converse is not stated. My instrument shows the converse holds. Under ruling 33 ("key names are predicates"), the draft-contract name is false as a predicate and should be renamed, for example `encode_erase_eq_update`, or the converse proved.
   - (b) `Rdel` is not defined or referenced in `C4U1.lean`. The abstract-poset half of record (`down_card`, `up_card`, `rk_of_Rdel`, `shadow_degree_bound`) lives in C-U1-T's scratch under namespace `E993TransportCrit`. U1's `E993Transport.rk` duplicates `E993TransportCrit.rk` under another name, and nothing links the two.
   - (c) **Binder diff against the registered (NM) text**, which I read (disclosure ii). The key quantifies over an arbitrary `G`, an independent `Q`, "`G − N_G[Q]` a perfect matching on `N` edges", `S^Q_{|Q|+k}` and `∂_Q X := {B ∖ {y} : y ∈ B ∖ Q}`. U1's (N1) covers only the abstract matching ↔ states step. It leaves out:
     - the `G`-side sector map `S^Q_{|Q|+k} → I_k(G − N[Q])`, `B ↦ B ∖ Q`, together with `∂_Q ↔` deletion;
     - the isomorphism from `G − N[Q]` onto `matchingGraph N`.

     So (N1) is **partially** supplied: its bijection is compiled, its connection to the key is not. (N2) is untouched in the key's own sense, and (N3) is not attempted. U1's table does say that (N2) is partial and (N3) is untouched. The one overstatement is "closes node (N1)".
4. **Part D's scope is misattributed.** The registered (NM) key is **unweighted**. Its fences say: "No tree, weight, selector or eligibility hypothesis". The weighted CB reading (`w_F ≡ [v ∈ F]` on the `(r, v)` sector) is a scope note on `R30-CB-RECORD` and "not part of this key".
   - Part D's `not_active_…` lemmas and the "weight exactly one" half therefore belong to the CB record, not to (NM)'s (N2).
   - Of Part D, only `disjoint_of_indep_shell` is an (NM) ingredient: it is the `B ∩ (N[Q]∖Q) = ∅` step of the unweighted sector map.
   - The allocation's wording, "(N2) the sector correspondence with weight one", conflates the two. U1 inherited that wording, and the synthesis should separate them.
   - Separately, the docstring of `disjoint_of_indep_shell` says "If `Q` is independent", but that hypothesis is absent from the statement and not needed. This is harmless.
5. **Central obligation.** GK-SIGN's DAG is not attempted: the explicit `G_k` on `Fin (3k+5)`, `IsTree` (connectivity and acyclicity), Lemma M, and the aggregate identity `S(G_k, k+3) < −2`. "Yes (partial)" is accurate only in the sense that one ingredient (Part A) was compiled, and that ingredient needs the bridges in item 1 before GK-SIGN can use it.
   - **No draft contract coincides with a registered or synthesis-proposed key at exact scope.** Contract 1 is general graph infrastructure. Contract 2 (B7) is an unregistered record. Contract 3 ((N1)) is a sub-step of (NM)'s formalization, not (NM).
   - **No Cycle 4 award group comes from U1.** Under R29-N-12, any of these could at most be registered as a companion (`proved_informal`), and only after an isolated second read.
6. **Ruling 30 (plateau test).** The return supplies none of items (a)–(d). It has no Hall theorem on an infinite family, no switch-load-bearing full (HALL), no (CUT), and no Lean award.
7. **Quantifiers, directions and ℕ-subtraction.**
   - Part A's `k − i` is guarded by `i ∈ range (k+1)`.
   - B7's final cast is sound, since both sides are casts of ℕ sums.
   - There is no circularity: B7 assumes a flow and never uses `S ≤ 0`.
   - I found no hypothesis that encodes its conclusion.

## Mechanism-equivalence and fence check

- U1 proposes no transport mechanism. None of its 25 declarations restates any of the ten refuted keys:
  - there is no deletion-only Hall;
  - there is no Delete/Retag relation;
  - B7 is stated on the literal (D) ∪ (S) relation with the active-tag weight.
- It re-proves no closed region or settled family theorem. It uses no census value, no RTree wording and no controller prior.
- (LIFT), (DCB), `D, C ≥ 0` and the budget are not invoked.
- Part D's "exactly the reason … are inactive" claim for CB private leaves is consistent with the frozen CB description in `SEMANTIC-CONTRACT.md` §1.2 (`W_{c_ij} = {u_i}`, the choke). It is also consistent with my instrument.
- Fence breach found: none. Scope misattribution: finding 4.

## Certification audit

Struck or narrowed:
- **"formally_verified-grade proof text"** (grades table, all four rows): **struck**. `SOLUTION-CONTRACT.md` §4 says "a compiled scratch declaration has no grade until its governed award closes". The correct wording is "compiled scratch, no grade".
- **"Eighteen new declarations" / "all 18 declarations"** (route verdict, grades, alias check, dependency diagram): **corrected**. `C4U1.lean` has **25** declarations: 24 named plus the anonymous `DecidableRel (matchingGraph N).Adj` instance. U1's probe covered 18 of them. My probe covers all 25, and every one is within `{propext, Classical.choice, Quot.sound}`.
- **C1-LA1 row "61,296 (unchanged from the first-interior award)"**: **struck**.
  - C1-LA1's `Main.lean` is **45,610** bytes, with digest `86b59c6c…` (the digest U1 cites, which is correct).
  - 61,296 bytes is the first-interior `Main.lean` (`8d864da2…`), a different file.
  - So the byte figure and the "unchanged" parenthetical are both false. The digest is correct.
- **"closes node (N1)" / "completes (N1) of (b) in full"**: narrowed to "the matching ↔ states bijection and the erase ⇒ update direction". The `G`-side sector map, the matching isomorphism and the link to `Rdel` of record are absent.
- **"erase_iff_Rdel … the deletion correspondence"**: narrowed. It is one direction, and the name is not a true predicate.
- **"one general half of (N2)"** (Part D): re-scoped as a `R30-CB-RECORD` weight-reading ingredient, not (NM)'s (N2).
- **"replayed byte-identically"**: backed. The digests match, and my fresh build reproduced the 18-line output byte for byte.
- **Axiom output**: backed for the 18 lines shown.
- **"no `sorry`/`admit`/`native_decide`/`axiom`"**: backed.
- **"Main.lean … 2,187 lines, 22e3f81c…"**: backed.
- **The Mathlib pin**: backed.
- **Alias check "448 claims"**: the count is backed (448 entries). I did not re-run U1's lexical term list. My own scan of my candidate names found one unrelated hit (`E993-C2-F3-K25-G1-LC-RANK-SEPARATION`, a log-concavity rank statement).

## Verdict

verdict: retained_narrowed
headline_resolved: no

What survives is 25 kernel-clean scratch declarations with no grade, forming three correct, general and mutually independent pieces:
- the disjoint-sum convolution;
- B7 as a ℚ companion faithful to SR-C3-7's face;
- the matching ↔ `Option Bool` bijection with erase ⇒ update.

Also retained: Part D's shell lemmas, as a CB weight-record ingredient.

The narrowings are those in `## Certification audit`, the misattribution of Part D's scope, and the fact that B7's restricted form proves nothing about (HALL) across classes. GK-SIGN's DAG, the route's first-named object, is not attempted. No U1 statement is award-ready at a registered key's exact scope, so no Cycle 4 award group comes from U1. Ruling 30: none of (a)–(d).

**Critic-derived advances.** These are by C-U1-F, Claude Opus 5.5. All are compiled scratch with no grade, in `scratchpad/c4-crit-U1-F/LeanProject/LeanProof/CritAdvU1F.lean`. Every axiom print is `[propext, Classical.choice, Quot.sound]`. There is no `sorry`, `admit`, `native_decide`, `axiom` or `decide`.
- **A1, the separation bridge for the carried counter:** `critU1F_indepSetCount_split`, with lemmas `critU1F_mem_avoid`, `critU1F_parts` and `critU1F_avoid_split`.
  - Statement: if no edge joins `P ∖ D` to `(P ∪ D)ᶜ`, then `C5LA1.indepSetCount G D k = Σ_{i≤k} indepSetCount G (D ∪ Pᶜ) i · indepSetCount G (D ∪ P) (k−i)`.
  - It is stated in the ambient type on the frozen `C5LA1` definitions, and it iterates by growing `D`.
  - This is the form GK-SIGN's `H_v`/`R_v` factorisations need. For example, `H_1 = (1+3y+y²)^{k+1}` follows by peeling one piece at a time. It needs none of the `induce`/isomorphism/`Sum` bridges.
  - My instrument checks it on 2,152 instances with 0 failures. The separation hypothesis is load-bearing: the identity failed on all 168 violating `P`.
  - Mathematically it is `proved_informal`-grade content (a bijection `s ↦ (s ∩ P, s ∖ P)`). Its compile is scratch.
- **A2, the complementary half of the weight-one reading:** `critU1F_activeWeight_eq_one`.
  - Hypotheses: `Q ⊆ B` independent; a designated `v₀ ∈ F ∩ Q` with a witness `w ∈ Q ∖ {v₀}`; every other tag in `F ∩ B` has all its witnesses in `N[Q]∖Q`.
  - Conclusion: `activeWeight G F B = 1`.
  - On `CB(d,m)` with `Q = {r, v}` the hypotheses hold for every `d, m` and every `F ∋ v` with `F ⊆` leaves. The reason: `W_v = N(s)∖{v} = {r}` and `W_{c_ij} = {u_i} ⊆ N(r)`, and `r` is not a leaf when `m ≥ 1`. This hand check is `proved_informal`, and my instrument confirms it on five rows.
  - Together with U1's `notMem_activeFilter_…`, this settles the "weight exactly one" statement of the CB record as a general lemma. Its home is `R30-CB-RECORD`'s scope note, not (NM).
- **A3, the unweighted sector correspondence** (the `G`-side piece (NM)'s binders actually need): `critU1F_sector_card` and `critU1F_sector_erase`.
  - For independent `Q`: `|{B ∈ I_{|Q|+k}(G) : Q ⊆ B}| = indepSetCount G N[Q] k`, via `B ↦ B ∖ Q` with inverse `A ↦ A ∪ Q`.
  - `(B.erase y) ∖ Q = (B ∖ Q).erase y` carries `∂_Q` to plain deletion.
  - With U1's Part C and one more isomorphism ("`G − N[Q]` is a perfect matching" ≅ `matchingGraph N`), (NM) reduces to C-U1-T's `shadow_degree_bound`.

I propose no new key. A1 and A3 are formalization steps toward registered keys (GK-SIGN; (NM)), and A2 is a record lemma. A lexical alias scan found no collision. Mathematically, none of the three states a registered claim.

## Remaining obligation

What a successor inherits, in order:

1. **GK-SIGN in Lean.**
   - Define `G_k : SimpleGraph (Fin (3k+5))` and prove `IsTree`, connectivity and acyclicity separately.
   - Derive `H_1`, `R_1` and every deleted-graph count needed by repeated A1 (`critU1F_indepSetCount_split`), not by U1's Part A.
   - Prove Lemma M (the coefficient recurrences, `h(N) ≥ 2^N`, `g(N) ≥ 3^{N−1}`), then the aggregate `S(G_k, k+3) < −2` as `C5LA1.aggregate` for every `k ≥ 1`.
   - The award must carry entry 0014 (`crossingIndex`) if eligibility is stated.
2. **(NM) in Lean at the registered statement.**
   - Formalise "`G − N_G[Q]` is a perfect matching on `N` edges" as an isomorphism of the graph induced on `(N[Q])ᶜ` with `matchingGraph N`, and transport `indepSetCount` along it.
   - Compose A3 with U1's `decode`/`encode`/`card_decode` and the forward and converse erase correspondence (rename or complete `erase_iff_Rdel`).
   - Link to `E993TransportCrit.Rdel`/`shadow_degree_bound`, or re-author them in `E993Transport`.
   - Conclude `k·|X| ≤ 2(N−k+1)·|∂_Q X|` for every `X ⊆ S^Q_{|Q|+k}`. Then do (N3), the binder diff sentence by sentence.
3. **B7 as a companion.** It is award-ready as a `lemma` if the synthesis wants it. The restricted form must carry a fence on its face: (HALL-COND) only for `X ⊆ Y`, with capacity checked against `Y`'s sources only, so it is not (HALL) and does not compose across classes without a global capacity check.
4. An isolated second read of U1's declarations and of A1–A3 is needed before any registration. None of them has a grade today.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-U1-F/`. Nothing was written elsewhere except this `CRITIQUE.md`.

| File | SHA-256 | Role |
|---|---|---|
| `LeanProject/LeanProof/Main.lean` | `22e3f81c487697912e3e94741eeb27e580324fd1bf3e06f52afaebc667e04a45` | copied from U1 (= C3-LA1) |
| `LeanProject/LeanProof/C4U1.lean` | `2b9f09d8518c63b78f7139dfa60dbeeab0fcce369d819dd0ea590a12bd5839b5` | copied from U1 |
| `LeanProject/LeanProof/AxiomCheckC4U1.lean` | `eb5930be64f7392868a36b3dcff42cc64d8920adfaab7018b9286f27d9ef03ab` | copied from U1 (replayed) |
| `LeanProject/LeanProof/CritAxU1F.lean` | `ba9db074a9b90afa31671f59af364c235f2d33125b73c974d0f30ac2f17e42ce` | my axiom probe, all 25 declarations |
| `LeanProject/LeanProof/CritInstU1F.lean` | `db928442ca2ca09a6bc9a38e302698a42c04507c94a64e8e3ef8acc90670cdd4` | anonymous-instance name lookup |
| `LeanProject/LeanProof/CritInstDriftU1F.lean` | `b13763ea5b20ec65c97c20b45f4636e633868482cd7e6aa9ecb56e86a7476778` | restricted ⇒ `WeightedHall` by `exact`; ℕ-flow ⇒ ℚ-flow |
| `LeanProject/LeanProof/CritAdvU1F.lean` | `4ea7ea2fe5d9680e98ccd4c34fab528aab4d28648b2c1bc85e6cd6fa583d270c` | critic advances A1–A3 (11,450 bytes) |
| `critax-output.txt`, `u1-axiomcheck-replay.txt` | — | probe outputs (no host fields) |
| `crit_check.py` | `d8b3bc14b938ee89d181975e1b608305c14b44bd7e1dad3fde10c0d3925d2624` | numeric instrument (stdlib: itertools, random, math, hashlib, json) |
| `crit_check.out` | `48ce9d3a96702d20921adc140f60b0ff49a322f0348dff53d29a70fa5ed71cb6` | its output; inner JSON digest `5a1775eb46e4fba5d8f841d17ecf39e5034ad677ddb52d1ccb32e07834c521a2` |

`LeanProject/` also holds the byte-copied `lakefile.toml`, `lake-manifest.json`, `lean-toolchain` and `LeanProof.lean`, the `.lake/packages` symlink to the shared Mathlib, and its own `.lake/build`.

Replay commands:
- Lean: `cd <scratch>/LeanProject && lake build && lake env lean LeanProof/CritAxU1F.lean && lake env lean LeanProof/CritAdvU1F.lean && lake env lean LeanProof/CritInstDriftU1F.lean`
- Python: `cd <scratch> && python3 -B crit_check.py`

Background jobs: none were started. Every command ran in the foreground. No `lake update`, `lake clean` or `elan` was used, and there was no process listing.
