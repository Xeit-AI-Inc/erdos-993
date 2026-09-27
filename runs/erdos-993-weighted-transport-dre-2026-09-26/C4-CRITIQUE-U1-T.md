# Critique

Critic `C-U1-T` (orientation T, prove) of route `C4-U-01 LEAN-GK-SIGN-AND-NM-ENCODING` (seat U1, orientation U), r30 Cycle 4 Stage 4.

Boot: I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Before that I verified the dispatch file `control/dispatch/c4-stage4/DISPATCH-C-U1-T.md` against its stated SHA-256 `9593223d1410df87fedff36461d04aa12cf7e9a78df1d1764b1d3528bedbc001` (match). I read no other VerityOS file. The host injected the project `CLAUDE.md` and the memory index into my context at start; I did not open or act on either.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Capsule** `control/c4-critic-capsules/U1-PACKET-MANIFEST.json`. I recomputed the seal canonically: `seal_sha256` removed, `sort_keys`, separators `(",", ":")`, no trailing newline. The result is `17caaa960aa81d4152a5e00b79677dde141a19e6681bffe5e1ad8c830fb36408`, which matches both the dispatch and the embedded field. All 14 members re-hashed, and SHA-256 and byte count match on every one. The members include `control/C4-STAGE3-READ-BOUNDARY-DISCLOSURES.json` and `PATH-CHECK-U1.json`, which reports 0 findings.
- **Stage 2 seal**: recomputed `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`, which matches the protocol, the common brief and the return.
- **Stage 3 seal** (`control/C4-STAGE3-PACKET-MANIFEST.json`, a capsule member): recomputed `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`, which equals the embedded value.
- **Stage 4 dispatch seal** (`control/C4-STAGE4-DISPATCH-MANIFEST.json`): recomputed `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`, which equals the embedded value.
- **Return digests.** I copied the files out of `scratchpad/c4-U1/LeanProject/` into my own scratch and re-hashed them:
  - `C4U1.lean` gives `2b9f09d8…5839b5` (23,547 B), as the return states.
  - `AxiomCheckC4U1.lean` gives `eb5930be…ef03ab` (1,164 B), as stated.
  - `Main.lean` gives `22e3f81c487697912e3e94741eeb27e580324fd1bf3e06f52afaebc667e04a45` (100,005 B). This matches the C3-LA1 digest of record in gate ruling 32 and the allocation (`22e3f81c…`).
  - Lean pin: toolchain `v4.32.2`, and the `lake-manifest.json` mathlib revision is `905b95818eb32af7874a58b427f50c1711a5e96c`. Both are identical to `sources/mathlib-binding/PIN.json`.
- **Byte-identity of the carried definitions** (protocol duty 2). In the seeded `Main.lean`, every carried definition block of entries 1–13 (`C4LA1.*`, `C5LA1.*` including `indepSetsAvoiding` and `indepSetCount`, and `E993Interior.taggedFamily`) occurs verbatim in `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean` (`8d864da2…`). I checked this with my own block-extraction script. The `E993Transport` entries 14–21 are in-run text. I read them against `SOLUTION-CONTRACT.md` §2 and they agree:
  - `activeWeight` counts `v ∈ F ∩ B` with `¬Disjoint (B.erase v) (tagWitnesses G v)`, and `tagWitnesses = N(s_v).erase v`. That is ACTIVE tags, not `|F ∩ B|`.
  - `transportRel` is exactly (D) ∪ (S), with `|N(u) ∩ B| = 2` and `u ∉ B`.
  - `IsSaturatingFlow` and `WeightedHall` are as §2 states.
- **The return's own identity.** The return discloses chartered sonnet/xhigh and runtime id `claude-sonnet-5`. It names the registered keys before any content. It carries the gate-31 line "central obligation attempted: yes (partial)".
- **Read-boundary disclosures (seat).** The seat disclosed:
  - one names-only `ls scratchpad/`;
  - two `find` calls rooted at authorized award directories;
  - an in-memory filter over the Stage 2 manifest;
  - a digest-verified registry load;
  - one OS-refused write to `/tmp_list1.txt`.

  None of these is mathematical. I note all of them and find no evidence contamination. There is no Python instrument, so there is no `S` or fixed point to contaminate.
- **Critic's own disclosures.**
  1. One erroneous shell fragment (`cat > /tmp/dummy_never 2>/dev/null`) created a zero-byte file outside my grant, `/tmp/dummy_never`. I removed it at once by literal path. No content was written or read.
  2. I did not open `scratchpad/c4-U1-replay/`, because the dispatch grants only `scratchpad/c4-U1/`. The seat's replay self-report is therefore unverified by me, and I replaced it with my own rebuild.
  3. I did not read `control/CLAIM-IDENTITY.run-local.json`, SR-C3-7, C1-LA2's face or the award directories under `runs/`, because none is a capsule member. Registry-text and SR-C3-7 comparisons below are therefore against the text quoted in my attack brief, the allocation and the return. I say so wherever it matters.
  4. No `find`, `grep -r`, `rg` or `ls -R` above my grant was run. `ls` was used only on `scratchpad/c4-U1/` (granted) and on my own scratch.
  5. No network access and no installs. No background jobs were run; every command ran in the foreground.

## Independent re-derivation

**Instrument 1, Lean rebuild, copy-out-first** (`scratchpad/c4-crit-U1-T/LeanProject/`):
- The scaffold and the three `.lean` files were byte-copied. `.lake/packages` was bound by manual symlink to the pinned shared tree. I ran `cd` into the project before every `lake`/`lean` call and never ran `lake update` or `lake clean`.
- `lake build` completed successfully (8658 jobs). The only warnings were linter warnings: unused simp args at `C4U1.lean:366` and `<;>` style at line 311.
- I ran `#print axioms` on all 25 declarations of `C4U1.lean`, not only the 18 the seat probed. The additional seven are:
  - `instDecidableRelSum`, `matchingGraph`, `encode` and the anonymous `instDecidableRelProdFinBoolAdjMatchingGraph`, each `[propext, Quot.sound]`;
  - `IsSaturatingFlowQ`, `decode` and `rk`, each `[propext, Classical.choice, Quot.sound]`.

  All 25 lie within the permitted set. The seat's 18 printed lines reproduce exactly (log: `crit-axioms.log`).
- A token scan of my copy of `C4U1.lean` finds `sorry`, `admit`, `native_decide`, `axiom`, `decide`, `set_option`, `unsafe`, `opaque` and `implemented_by` only in the header comment (lines 9–10).

**Statements read against their claimed meaning:**
- **Part A.** `indepSetCount_sum_eq : C5LA1.indepSetCount (G ⊕g H) ∅ k = Σ_{i ∈ range(k+1)} i_G(i)·i_H(k−i)`.
  - `⊕g` is Mathlib's `SimpleGraph.sum`, the disjoint sum on `V ⊕ W` with no cross edges. `SimpleGraph.not_adj_sum_inl_inr` is used, and `#check` confirms the elaborated statement.
  - The ℕ subtraction `k − i` is guarded by `i ∈ range (k+1)`. There is no hidden hypothesis.
  - This is the convolution identity, correctly stated.
- **Part B.** `IsSaturatingFlowQ` has four conjuncts: `0 ≤ f`; support only on `transportRel` arcs from `I_{p+1}` to `I_p`; `Σ_A f(B,A) = w_F(B)` for every source; and `Σ_B f(B,A) ≤ w_F(A)` for every target.
  - This matches the B7 face quoted in my brief. Both load-bearing hypotheses (nonnegativity and arc support) are in the definition.
  - The conclusion is the frozen `WeightedHall G F p`, that is (HALL-COND) for every `X ⊆ I_{p+1}`. It is not a scalar or whole-layer inequality.
  - The proof is the ℕ companion's three-step chain retyped to ℚ. The new ingredient is the nonnegativity conjunct, used via `sum_le_sum_of_subset_of_nonneg`. The `open scoped Classical` section does not cause an instance drift; my K1 and K2 below close by `exact`.
- **Part C.** `matchingGraph N` on `Fin N × Bool`, with `Adj p q := p.1 = q.1 ∧ p.2 ≠ q.2`, is literally a perfect matching on `N` edges.
  - `decode_encode` needs independence; `encode_decode` needs none; together with `card_decode` they give the bijection with rank equal to cardinality.
  - `erase_iff_Rdel` proves one direction only: erasing `(i,b) ∈ B` corresponds to `update (encode B) i none`.
- **Part D.** `disjoint_of_indep_shell`, `not_active_of_witnesses_subset_shell` and `notMem_activeFilter_…` are correct as stated. Their hypotheses are weaker than the docstring's: `Q` need not be independent.

**Instrument 2, Python** (`py/crit_instr.py`, `python3 -B`, stdlib, exact integers; built from `SEMANTIC-CONTRACT.md` and not from any seat code; output in `py/crit_instr.out`):
- **Fixed points.** The tree test (acyclicity and connectivity) passed. `x` is computed through rank `α`, and `F_p` is derived from `Δ_p(T − v)` on the original tree. Supply and capacity come from the literal active weight; `S` comes independently from `q_v = i(H_v) − i(R_v)`. The two sides are asserted equal.
  - `K_{1,12}/8` gives `n` 13, `α` 12, `x` 6, eligible, `|F|` 12, 1980 / 3960, `S = −1980`.
  - Path-star `(2,3,4)/7` gives `n` 15, `α` 11, `x` 5, eligible, `|F|` 10, 1483 / 2701, `S = −1218`.
  - Both reproduce the charter. This is `bounded_computation`, used only to trust the instrument.
- **Part A (independent).** The convolution identity holds on 300 random disjoint-union pairs of orders 0–14.
- **Part C (independent).**
  - For `N = 0..6`, `i_k = 2^k·C(N,k)`, and there are exactly `3^N` encoded states.
  - The set of deletion arcs `B → B − x` maps onto exactly the set of `Rdel` arcs, as sets. This includes the converse direction that U1 did not state.
- **Part D (independent).** On `CB(1,3)`, `CB(2,3)`, `CB(3,2)` and `CB(2,4)`, with `Q = {r, v}` and `F` = all leaves, every sector member has active weight exactly 1. This is a laboratory check of the (N2) target shape only. These rows are not eligible and are not evidence for any key.

## Attacks and findings

1. **The Part A bridge is missing, which my brief asked me to check.** U1 proves the lemma for `G ⊕g H` on the carrier `V ⊕ W`. It never states the bridge to what GK-SIGN actually uses: `i_k(G − D)` on the original carrier, where a cut-vertex deletion splits `V ∖ D` into edge-free parts. Using Part A as stated would also need an `induce` lemma and graph-isomorphism invariance of `indepSetCount`, and neither is present. So Part A is beside the path as shipped, not on it.
   - **Critic-derived advance K6** (`CritU1T.indepSetCount_split`, compiled, axioms `[propext, Classical.choice, Quot.sound]`). Suppose `P₁ ∩ P₂ = ∅`, every `x ∉ D` lies in `P₁ ∪ P₂`, and there is no edge between `P₁` and `P₂`. Then `C5LA1.indepSetCount G D k = Σ_{i ≤ k} indepSetCount G (D ∪ P₂) i · indepSetCount G (D ∪ P₁) (k−i)`.
   - K6 stays on the original carrier, with no sum graph, no `induce` and no isomorphism. It is the form GK-SIGN's `H_1`, `R_1` factorizations need. It does not use Part A, so Part A is not required for GK-SIGN's DAG.
2. **(N1) holds one direction only, and the name is not a predicate (ruling 33).** `erase_iff_Rdel` is an equation (deletion implies `Rdel`), not an iff. The claim "deletion ↔ `Rdel`" and "(N1) in full" needs the converse: every `Rdel` step out of `encode B` is realized by a graph deletion.
   - **Critic-derived advance K3** (`CritU1T.Rdel_realised_by_erase`) supplies the converse. **K4** (`CritU1T.rk_encode`) gives `rk (encode B) = B.card`. With these, the arc correspondence is two-sided in Lean.
   - My Python check confirms that the arc sets are equal for `N ≤ 6`.
   - The name `erase_iff_Rdel` should be renamed (for example `encode_erase_eq_update_none`) before any contract.
3. **(N1) is about the abstract matching, not the key's sector.** `matchingGraph N` is the abstract induced matching. The (NM) key's object is the sector `{B ⊇ Q independent}` of a graph `G` with `G − N_G[Q]` a perfect matching; I have this from the return's quotation, not the registry. Two bridges are absent:
   - (i) `B ↦ B ∖ Q` from the rank-`|Q|+k` sector onto `indepSetsAvoiding G N[Q] k`, with in-sector deletions ↔ erasures;
   - (ii) an isomorphism `G − N[Q] ≅ matchingGraph N`.

   These belong to (N2) as the allocation splits the work. U1's own table correctly says (N2) is partial and (N3) untouched, and no grade above `compiled` is claimed in the route verdict. However, the grades table's "`formally_verified`-grade proof text" wording breaches §4 (see Certification audit).
4. **(N2) is half done, and the complementary half is now compiled at hypothesis level.**
   - **Critic-derived advance K5** (`CritU1T.activeWeight_eq_one_of_sector`) assumes:
     - `Q ⊆ B`, and `B` independent;
     - a tag `v ∈ F ∩ Q` whose witnesses meet `Q.erase v`;
     - every other tag `w ∈ F ∩ B` has `tagWitnesses G w ⊆ N[Q] ∖ Q`.

     It concludes `activeWeight G F B = 1`.
   - On `CB(d,m)` with `Q = {r, v}` the hypotheses hold: `W_v = {r}`; private leaf `c_ij` has `W = {u_i} ⊆ N[r] ∖ Q`; `b_ij` and `r` are not leaves. `v ∈ F_p` remains a per-row hypothesis, because `F_p` must be derived.
   - The remaining (N2) work is to instantiate K5 on a literal `CB(d,m)` graph and to supply bridges (i) and (ii) above.
5. **Part B's restricted-form gloss is unsafe.** The theorem `weightedHall_on_of_saturatingFlowQ_restricted` is sound: it routes sources of `Y` only, bounds capacity over `Y` only, and concludes Hall for every `X ⊆ Y`. The return's prose, however, calls this "the shape a coupled per-class certificate … would actually ship". Per-class certificates on a partition `Y₁ ⊔ Y₂` do not compose: Hall for `X ⊆ Y₁` and for `X ⊆ Y₂` says nothing about `X` meeting both, because the classes compete for target capacity (protocol duty 3). Only `Y = I_{p+1}`, or a single flow over the union, yields `WeightedHall`. The gloss must not be read as a route to (HALL) from class-wise certificates.
   - **Critic check K1** (`CritU1T.satQ_of_sat`): every frozen ℕ `IsSaturatingFlow` casts to an `IsSaturatingFlowQ`, so the ℚ predicate is a conservative generalization.
   - **Critic check K2** (`CritU1T.weightedHall_via_restricted`): the restricted form at `Y = I_{p+1}` closes the frozen `WeightedHall` by `exact`, so there is no decidability-instance drift.
6. **The central obligation (GK-SIGN's DAG) was not attempted.** The explicit `G_k` on `Fin (3k+5)`, its `IsTree` proof, Lemma M and the aggregate identity `S(G_k, k+3) < −2` are all absent. Of the route's first-named object (a), only the convolution ingredient exists, and it is off-path until bridged (finding 1). "Central obligation attempted: yes (partial)" is accurate only as "(c) done; (b) partial; (a) infrastructure only".
7. **Award readiness.** None of the three draft contracts coincides at exact scope with a registered key or a synthesis-proposed key.
   - Part A and B7 are companions under R29-N-12: compiled, no certificate.
   - (N1) is a node of (NM)'s formalization, not (NM)'s statement.
   - So no Cycle 4 award group comes from U1 as returned. With K3, K5 and K6 added, the (NM) package (N1) plus half of (N2) is closer, but it is still not contract-ready at (NM)'s exact scope (bridges (i) and (ii), then (N3)).
8. **Gate ruling 30 line:** U1 supplies none of items (a)–(d). There is no parameter-uniform Hall theorem, no full (HALL) at a switch-necessary row and no (CUT). Item (d) requires an award together with one of (a)–(c), and neither is present.
9. **Process.** The seat's `find` calls, its `ls scratchpad/` and the refused `/tmp_list1.txt` write are noted, with no mathematical effect.

## Mechanism-equivalence and fence check

- U1 proposes no transport mechanism, so none of the ten refuted keys (deletion-only Hall, Delete/Retag, own-support unit capacity, per-leaf injectivity, occupancy domination, signed cross-tag, covariance) is revived.
- Part B is a certificate check. It is not (HALL) and not evidence for it.
- Nothing re-proves a closed region, the high tail, the order bands or a family theorem.
- No census value enters any statement, and there is no RTree wording.
- (LIFT) is not used, and `D, C ≥ 0` is not used.
- Part D and K5 concern the sector weight identity. That is a structural fact about `w_F`, not a Hall claim, and it does not revive `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT`: no capacity rule is proposed.
- (WID) is used as frozen and is not re-proved.
- Registry keys touched:
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN, untouched.
  - (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: definitions used only.
  - `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` and `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`: grades unchanged.
  - `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (NM): `proved_informal`, unchanged.
  - Record `R30-C3-B7-RATIONAL-FLOW-VERIFICATION-LEMMA`: first Lean text, compiled.
- **Alias check.** The seat's lexical explanation for its one "rational flow" hit is incoherent as written: the phrase "rational flow" cannot be a substring match inside "criterion implies". I could not re-run the check because the registry is not a capsule member. Mathematically, E1 (a sufficient Hall criterion on `CB(d,m)`) is distinct from a flow-verification lemma, so I find no collision. The lexical sentence is struck as unbacked.
- I have no `E993-R30-…` candidate to alias-check. My K3–K6 are compiled scratch, and none is proposed as a key.

## Certification audit

Struck, or corrected against the shipped evidence:
- **"eighteen new declarations"** (in several places) and "`#print axioms` on every one of the 18 new declarations". This is struck: `C4U1.lean` has **25** declarations. The seat probed 18, and I probed all 25, all within the permitted set.
- "two declarations use only `[propext, Quot.sound]`" is true of the 18 probed; across all 25 declarations the count is five.
- **"`formally_verified`-grade proof text"** (grades table, all four Part rows). This is struck. A compiled scratch declaration has no grade (`SOLUTION-CONTRACT.md` §4; R29-N-12), and the correct literal is `compiled`. The route verdict `compiled` stands.
- **"completes (N1) in full" / "closes node (N1)"**: narrowed to one direction (finding 2). The converse is critic-supplied (K3).
- **"`61,296` (unchanged from the first-interior award)"** for C1-LA1's `Main.lean` (`86b59c6c…`). This is struck as internally inconsistent: the first-interior `Main.lean` is 61,296 B with digest `8d864da2…`, so a file "unchanged" from it could not have digest `86b59c6c…`. The `86b59c6c…` digest itself agrees with gate ruling 32's prefix.
- **"replayed byte-identically in a fresh copy … byte for byte"** (`c4-U1-replay`): not verified by me, because it is outside my grant. My own copy-out rebuild reproduces the build and the 18 axiom lines, and this reproduction replaces the self-report as evidence.
- **"full `lake build` … under 6 seconds"**: this timing is unbacked and immaterial. My rebuild took about 17 s wall time including `Main`.
- **Alias-check "rational flow" explanation**: struck (see above).
- **"genuinely new … not a re-derivation of anything already compiled"**: narrowed for Part B. The ℚ predicate is new, but the proof is C1-LA2's ℕ chain retyped, with the nonnegativity step added.

Backed: every return digest, the Stage 2 seal, the Mathlib pin, zero forbidden tokens, the 18 printed axiom lines, and the build success.

## Verdict

verdict: retained_narrowed
headline_resolved: no

What is retained: 25 compiled scratch declarations, all correct as stated.
- Part A is a correct general convolution lemma. It is off-path for GK-SIGN until bridged, and the bridge K6 is critic-derived.
- Part B, B7 in ℚ, is sound and conservative over the ℕ flow (K1, K2). It is a companion, and its per-class gloss is struck.
- Part C, (N1), holds one direction; the converse is critic-derived (K3, K4).
- Part D is half of (N2); the other half is critic-derived at hypothesis level (K5).

Every grade is `compiled`, with no key and no award group. The central object (a), GK-SIGN's DAG, is unattempted beyond infrastructure. I judge the mathematics of Parts A–D and of K1–K6 complete as stated; it is kernel-checked, so `proved_informal`-level confidence is appropriate for each as a companion. None is a registered key's statement.

## Remaining obligation

Exact:
1. **GK-SIGN in Lean.**
   - A literal `G_k : SimpleGraph (Fin (3k+5))`, with `IsTree` proved (connectivity and acyclicity separately).
   - `H_1`, `R_1` factorizations via K6, which is carrier-native, rather than via Part A.
   - Lemma M (the coefficient recurrence, with `h(N) ≥ 2^N` and `g(N) ≥ 3^{N−1}`).
   - `C5LA1.aggregate G_k (k+3) < −2` for every `k ≥ 1`, including `favorableLeaves` = all leaves, derived.
2. **(NM) completion.**
   - Bridge (i): sector rank `|Q|+k` ↔ `indepSetsAvoiding G (closedNbhdSet G Q) k`, with in-sector deletions ↔ erasures.
   - Bridge (ii): `G − N[Q] ≅ matchingGraph N` under a perfect-matching hypothesis.
   - K5 instantiated with its hypotheses discharged on a literal `CB(d,m)`, with `v ∈ F` as a named hypothesis.
   - Then (N3), the binder diff against (NM)'s registered text, by a reader with registry access.
3. **Renaming.** Rename `erase_iff_Rdel` (ruling 33), and package the bijection as an `Equiv` if it is contracted.
4. **Second read.** An isolated second read of `C4U1.lean` and of K3–K6 is needed before any companion is registered.

Nothing here moves (HALL).

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-U1-T/`.

| File | SHA-256 | Bytes |
|---|---|---:|
| `LeanProject/LeanProof/CritU1T.lean` (K1–K6) | `d7cdd55bd87efedf6174fc0d9a2f68fa2a58530b050a2a8ef60a29a37c2001aa` | 11,031 |
| `LeanProject/LeanProof/CritAxioms.lean` (31 probes) | `e6bd86a1aa38472f3bff86a88cdbb02eabe266a58ea5e84d2fc7bc31fe4d0c04` | 1,635 |
| `crit-axioms.log` | `409989750a6643e1173b4f9073ef9822b51648be591e31f553862dbdfa3e83e2` | 3,684 |
| `py/crit_instr.py` | `7b0661769e51b5ba86c2f70381b6f665d8973865968e1bcc020c130e09dc8415` | 5,102 |
| `py/crit_instr.out` | `694dc6cdf29a6c20251b26b5cc78ac31a679d1cb5dba54abc72be28fe2040371` | — |
| copied-out seat files `C4U1.lean`, `AxiomCheckC4U1.lean`, `Main.lean` plus scaffold | as listed in the seal audit | — |

- **Replay.** Run `cd …/scratchpad/c4-crit-U1-T/LeanProject && lake build && lake build LeanProof.CritU1T && lake env lean LeanProof/CritAxioms.lean`, then `python3 -B py/crit_instr.py`.
- `.lake/packages` is a symlink to the pinned shared tree. No `lake update` or `lake clean` was run.
- No background jobs were launched, so none were left running.
