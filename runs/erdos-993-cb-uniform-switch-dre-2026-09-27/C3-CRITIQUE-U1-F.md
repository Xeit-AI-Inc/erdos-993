# Critique

**Critic:** `C-U1-F`, Cycle 3 Stage 4, r31 (Erdős #993, CB(8,m) top sector-deficient rank). Cross-orientation F (falsify) on seat `U1`,
route `C3-U-01`, mechanism `FORMAL-CB-SECTOR-FLOW-LITERAL-BRIDGES`, orientation U.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the first 150 lines of the protocol, which cover the boot sequence and
steps 1 to 7). I read no other VerityOS file. The host put the project `CLAUDE.md` and the user memory index into my context before
my first action. I did not act on either beyond the boot the dispatch authorizes, and I created no conversation log, because the
dispatch confines my writes to this file and my own scratch directory.

**Read-boundary disclosures (every deviation).**
1. `control/C3-CRITIC-ATTACK-BRIEFS.md` is a capsule member, but I read it in full with a single `cat`, so I saw every seat's section
   and not only U1's. Only the U1 section shaped my work.
2. I ran recursive `grep -rln` searches rooted at `sources/c2-results`, `sources/c1-results`, `sources/c2-stage7-sources` and
   `sources/c1-stage7-sources`, all of which are inside my grant. The searches listed 10 file names. Two are Cycle 2 adjudication
   records: `c2-results/cycles/cycle-2/stage5/adjudicators/U/ADJUDICATION.md` and `…/SOURCE/governing/ADJUDICATION-U.md`. **I saw
   only their names and did not open them.** I opened `sources/c2-stage7-sources/U2/LeanProject/LeanProof/Main.lean` (the Cycle 2 U2
   scratch, lines 2580–2942) and `sources/c2-stage7-sources/U2-replay/replay_output.log`. Both are frozen Stage 2 sources.
3. I ran one process listing, `ps -o pid,command -u <uid> | grep … | grep c3-crit-U1-F`. It was filtered to my own scratch path, and
   no sibling process line was displayed.
4. I did not read `scratchpad/c3-U1-replay/`, which is the return's replay directory. It is not under the inventoried
   `scratchpad/c3-U1/`, so I rebuilt and replayed from a copy-out of `scratchpad/c3-U1/` instead.

No network. No package install. No `lake update` or `lake clean`. Every `lake`/`lean` call ran inside my scratch Lean project.

## Identity and seal audit

- **Dispatch** `DISPATCH-C-U1-F.md`: SHA-256 `c13c2b82…691e0`, recomputed, **match**.
- **Capsule seal** `U1-PACKET-MANIFEST.json`: `199c8ee6ee3bcc81433fdcbb3304e7c9cf08d4dd56846cf46bcebb02d2908268`, recomputed as compact
  key-sorted JSON without `seal_sha256`, **match**. All 14 listed files match on bytes and SHA-256.
- **Stage 2 seal** `f6b0f3fd…6b2b3`: recomputed, **match**. I also replayed U1's `verify_stage2_seal.py` copy-out-first and got
  `match_recorded_vs_recomputed: True`.
- **Stage 3 seal** `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`: recomputed, matches its own record. The
  manifest lists `RETURN.md` for U1 at `62677b42…32d1` (matches) and `DISPATCH-U1.md` at `9c67363c…4aa7`, which equals the digest
  the return cites.
- **Stage 4 dispatch seal** `cc9683b5…c6c0c05`: recomputed, **match**.
- **Return-listed digests.**
  - The frozen sources C1-LA1 `f0578ed7ce7f51f695d410cd…c9b78e`, C1-LA2 `a906ec17…b5f3f` and r30 C1-LA2 `7c279f4b…349f8` all match.
    So do the skeleton files, per U1's `verify_source_digests.py`, which I replayed copy-out-first with result `ALL_MATCH: True`.
  - C2-LA1 `986b5257…`, C2-LA2's path and C2-LA3 `7dab4388…` are present with these prefixes.
  - U1's own `Main.lean` is `4a3f435d92017b5d1eb00da168be233f215fec6bb706629fd846ff57ac4671a2`, 2758 lines, 0 `sorry`. I confirmed
    this on the copy.
  - The two generator digests match.
- **A fabricated certification literal (strike).** Line 12 of U1's `Main.lean` gives the C1-LA1 digest as
  `f0578ed7ce7f51f6cf3a03e1e0c9f1e6d5b0d9a2b0a7c1e6a1b0c9d5e7f2a3b4` and says the full digest is recorded in RETURN.md.
  - The real digest is `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e`. Only the first 16 hex digits agree; the
    remaining 48 are invented.
  - RETURN.md records only the 16-hex prefix `f0578ed7ce7f51f6…`.
  - The header literal is therefore unbacked and is struck. It sits in a comment, so it does not affect compilation or any carry.
- **Claim identity.** No registry key is proposed, and no status changes. The keys touched are the (HALL) key (OPEN), the primary
  aggregate (OPEN) and the favorability key, cited at its grade. This matches `SEMANTIC-CONTRACT.md` §4. No `E993-R31-` candidate
  exists, so no registry alias check is due. The in-run alias failures are covered under Attacks F-1 and F-2.

## Independent re-derivation

**Instrument 1: Lean rebuild, copy-out-first.**
- I copied `scratchpad/c3-U1/LeanProject/{lakefile.toml, lake-manifest.json, lean-toolchain, LeanProof.lean, LeanProof/Main.lean}`
  into `scratchpad/c3-crit-U1-F/LeanProject/`.
- The toolchain is `v4.32.2`. `lake-manifest.json` is byte-identical to C1-LA1's, and its Mathlib rev is `905b9581…`, matching
  `PIN.json`.
- I bound `.lake/packages` by manual symlink to the shared project. `lake build LeanProof` succeeded (8657 jobs), with only the two
  disclosed unused-variable warnings (`hm`, `hmod` at line 2656).
- `#print axioms` on all five U1 declarations, plus the carried `exists_saturatingFlow_of_weightedHall` and
  `cb8_topRank_of_descent_and_flow`, gives only `[propext, Classical.choice, Quot.sound]`.
- There is no `sorry`, `admit`, `native_decide` or `axiom` anywhere in the file.

**Instrument 2: carry byte-compare (`carry_check.py`, standard library).**
- I parsed all 113 `VERITYOS ENTRY` blocks in U1's file: C1-LA1 1–33, C1-LA2 1–78, and r30 C1-LA2 30–31.
- Each block matches its origin `Main.lean` block (kind, name, hash and body) and its `Snippets/NNNN-*.lean.fragment` byte for byte.
  Result: **113/113, 0 mismatches.**
- The terminals are carried unedited as `theorem`. Ruling 19 permits only the edit `theorem` → `lemma`, and none was made.
- Outside the entry blocks, the only lines are banner comments and `import Mathlib`.

**Instrument 3: statement reading against the definitions of record.**
- U1's hypothesis bundle `(hnn, hsupp, hsrc, htgt)` is `IsSaturatingFlow` field for field, with the codomain changed from ℕ to ℚ and
  the row and column sums taken over `Finset.univ` instead of the layers. The support clause makes these the same sums.
- The CB statements use `favorableLeaves (cbGraph m) p*` (the derived selector), the literal `transportRel` ((D) ∪ (S)), and
  `indepFamily` at `p*+1` and `p*` with `p* = (16*m+4)/3`. There is no ℕ-subtraction and no index shift, so fidelity holds.
- `cb8_topRank_eligible_and_weightedHall_of_ratFlow`'s conclusion equals `SOLUTION-CONTRACT.md` §2's four conjuncts verbatim. Its
  hypotheses are `hm`, `hmod`, **`hE`**, and `g` with its four clauses.
- I checked the citations directly in the frozen sources:
  - C2-LA1's terminal `cb8_topRank_parentDescent_and_conjuncts_1_2_3 (m) (hm : 107 ≤ m) (hmod : m % 3 = 2)` has
    `crossingIndex (cbGraph m) + 2 ≤ (16*m+4)/3` as its third conjunct, unconditionally.
  - C2-LA3's `cb8_favorableLeaves_eq_leafSet_topRank` is unconditional on the class.
  - The two `sorry` hits in C2-LA1 are inside doc comments (lines 2298, 2347).
  - U1's citations are therefore accurate.

**Instrument 4: exact numerics (my own code, standard library, exact integers).**
- **Literal generic forest DP.** I used Kronecker-substituted big integers with the labels of C1-LA2's `cbEdge`.
  - It reproduces the contract's closed form `I(CB) = (1+2x)G^m + x(1+x)(1+2x)^{8m}` with the contract's `G`, coefficient for
    coefficient, at m = 107, 110, 113, 116, 119, 122, 125, 128, 140.
  - Fixed points: CB(8,107) has n = 1822, α = 964, x = 570; CB(8,95) has n = 1618, α = 856, x = 506. I computed x as the first
    strict descent scanned through α, with counts zero above α. Both rows match §5.
  - I did not reproduce θ*, ρ_1 or σ, because this Lean seat reports none of them.
- **Selector derived at the fresh rows 125, 128, 140 and the controls 107–122, using ruling 16's index.** Every representative leaf
  satisfies `i_{p*+1}(T−w) < i_{p*}(T−w)`. The representatives are `v` and the private leaves `c_{0,0}`, `c_{0,7}`, `c_{m−1,0}`,
  `c_{m−1,7}`; the other private leaves follow by the automorphisms of CB. Hence `F_{p*} = leafSet` on those rows, which agrees with
  the formal C2-LA3 award.
- **(WID) is not asserted.** My instrument checks a local arc count, not a network sum, so no supply−capacity claim is made or used.

## Attacks and findings

**F-1 (strong). `weightedHall_of_ratFlow` is a special case of a Cycle 2 in-run lemma. The return does not acknowledge this.**
- `sources/c2-stage7-sources/U2/LeanProject/LeanProof/Main.lean` ("Part A", lines 2598–2671) already compiles
  `weightedHall_of_ratFlow_bound` and `exists_saturatingFlow_of_ratFlow_bound`. U2's Cycle 2 replay log shows these with the same
  three axioms.
- U2's hypotheses are weaker than U1's:
  - Out is `≥` rather than U1's exact `=`.
  - Support is only `¬ transportRel → g = 0`; U1 additionally demands layer membership.
- I proved in Lean that U1's bundle implies U2's: `critic_U1_ratFlow_is_special_case_of_U2`, sorry-free, standard axioms. It
  instantiates a verbatim copy of U2's lemma.
- `control/C3-ALLOCATION.md` names this object for U1 as "the rational-to-integral step (U2 Part A)". The route re-proved a narrower
  version instead of adopting it.
- Consequences:
  - Remaining-obligation item 3, "The rational-to-integral step is CLOSED, generically, by this file", is **struck as a novelty
    claim**. It was closed, in stronger form, in Cycle 2 scratch.
  - The integrality itself is r30's carried `exists_saturatingFlow_of_weightedHall` in both versions.
  - U1's "mathematical alias check", which calls the lemma "a strict generalization … non-aliased", missed the in-run duplicate. That
    check fails.

**F-2 (strong). `cb8ChokeState_le` restates a Cycle 2 in-run theorem.**
- U2 Cycle 2 compiles `chokeBeta_add_chokeGamma_le (m) (B) (hB : (cbGraph m).IsIndepSet ↑B) (i) (hi : i < m) :
  chokeBeta m B i + chokeGamma m B i ≤ 8`.
- Its `chokeBeta` and `chokeGamma` use the identical filters `cbVertex m (3+17i+1+2j) ∈ B` and `cbVertex m (3+17i+2+2j) ∈ B` over
  `range 8`.
- U1's `cb8ChokeState` packs the same two cardinalities into a pair. The statement is the same up to projection, and the proof is
  essentially the same.
- The return's claim of "new literal facts" is **struck** for this declaration.
- U2 Cycle 2 also went further on the sector (`legVerticesAt`, `sector_legCount_eq_card_sub_two`, `sector_out_ge_one`); U1 does not
  engage with any of it.

**F-3 (strong). `cb8_switch_preimage_count` is not the literal preimage count.**
- Its statement is `∀ C : Finset (Fin 8), (univ \ C).card = 8 − C.card`. That is a cardinality fact about `Fin 8`. It does not
  mention `cbGraph`, `transportRel`, the sector, a switch or a preimage.
- The return calls it "the literal 8 − γ preimage count" and one of "two literal pieces of the `g_sec` object". The word "literal" is
  **struck**; the lemma is abstract combinatorics.
- The ℕ-subtraction `8 − C.card` does not truncate, as the return says.
- I attempted the literal statement myself; see "Critic-derived advance A2" below.

**F-4 (the brief's central question). U1's one hypothesis is equivalent to conjunct 4.**
- I proved `critic_ratFlow_of_saturatingFlow`: any ℕ-valued saturating flow, cast to ℚ, satisfies all four of U1's clauses.
- I also proved `critic_cb8_ratFlow_iff_conjunct4 (m)`: for every `m`, (∃ g with U1's four clauses at `cbGraph m`, `p*`, derived
  selector) ↔ `∃ f, IsSaturatingFlow (cbGraph m) (favorableLeaves …) p* f`. Both are sorry-free with standard axioms.
- So the hypothesis is not a strictly weaker or separately checkable object. It is conjunct 4's ℚ-relaxation, which is logically
  equivalent to conjunct 4 given the carried integrality lemma.
- The conditional terminal is therefore "terminal ⇐ (hE ∧ conjunct 4 stated over ℚ)". That is correct and not literally
  "conjunct 4 ⇒ conjunct 4", but it reduces no mathematical content: building the flow remains the entire open problem.
- Its real value is the form it gives. A builder of `g` can work with rational values (ρ_q, σ(γ), `cb8Pb`/`cb8Pc`) directly. That
  form was already available from U2 Part A with the easier Out `≥`.
- On U3: U3's return is outside my grant, so I cannot compare its terminal directly. By F-4, any terminal whose one hypothesis is
  literally conjunct 4 and U1's terminal are interderivable in two lines through my iff lemma. The adjudicator should confirm this
  against U3's text.

**F-5 (moderate). The TERMINAL_integration gate line overstates what the theorem shows.**
- The gate line says the chain closes the terminal "conditional on `g` alone".
- The Lean theorem `cb8_topRank_eligible_and_weightedHall_of_ratFlow` also takes `hE` as an explicit hypothesis. It does not import
  C2-LA1 or C2-LA3.
- The discharge of `hE` is available (Instrument 3) but is not done in the file. "Conditional on `g` alone" is **struck**; the
  correct wording is "conditional on `hE` and `g`, with `hE` citable from C2-LA1".
- The composition itself takes two lines on top of C1-LA1/C1-LA2 and the U2 Part A shape.

**F-6 (minor).**
1. Step 7 says the choke-state labels come "from C1-LA2's `cbParentVal_at_support`/`cbParentVal_at_leaf`". The declaration uses
   neither. The labels match `cbEdge` directly, which I checked, so the claim is harmless but inaccurate.
2. The disclosed `/tmp` staging writes violate the worker brief; nothing depends on them.
3. The process listing that showed a sibling `c3-U3` build is described under "No read-boundary disclosure otherwise". A process
   listing that shows sibling lines is itself a disclosure item; T1's was recorded as forbidden in the controller summary.
4. The replay directory `scratchpad/c3-U1-replay/` lies outside the inventoried artifact path.

**Checks that stood.**
- All five declarations compile, and their axioms are standard.
- The carries are byte-exact.
- Fidelity holds: literal `transportRel`, the derived `favorableLeaves`, the index `p*` and no ℕ-subtraction.
- `cb8ChokeState_le` is mathematically correct: the support/leaf adjacency is `cbGraph_adj_support_leaf`.
- No Newton or Darroch argument, asymptotic step or census appears, so fences 3, 5 and 7 are vacuous here.
- The fresh-row test of ruling 17 does not apply to U1's own claims, which are kernel-checked universal statements with no fitted
  formula. I ran it anyway for my own advance A2.

**Critic-derived advance A1 (C-U1-F, formal, compiled scratch, no grade under fence 8).** Three declarations in
`scratchpad/c3-crit-U1-F/LeanProject/LeanProof/CriticF.lean`, all sorry-free with axioms `[propext, Classical.choice, Quot.sound]`:
- `critic_ratFlow_of_saturatingFlow` (the converse direction);
- `critic_cb8_ratFlow_iff_conjunct4` (U1's hypothesis ↔ conjunct 4, for every `m`);
- `critic_U1_ratFlow_is_special_case_of_U2` (U1's bridge follows from U2 Cycle 2 Part A).

**Critic-derived advance A2 (C-U1-F, STATED; needs an isolated second read; candidate `proved_informal`). The literal switch
preimage count on the network.**

Setting: `T = CB(8,m)`, any rank `p`, `F = leafSet`. Let `A ∈ I_p(T)` with `u_i ∈ A`, `v ∈ A`, `r, s ∉ A`, and no other choke in `A`.
Let `γ = #{j : c_ij ∈ A}`. Then:
- (a) the sector sources `B ∈ I_{p+1}` with `r, v ∈ B` and `transportRel B A` are exactly `B_j = (A ∖ {u_i}) ∪ {r, b_ij}` for the
  `8 − γ` legs `j` with `c_ij ∉ A`, and they are pairwise distinct;
- (b) `activeWeight(A) = γ`;
- (c) an `A` with two or more chokes has no sector preimage.

Proof.
1. **Only the switch at `u_i` can reach `A`.** A sector `B` contains `r`, so it contains no choke. A deletion arc would need
   `u_i ∈ B`, which is impossible. For an (S) arc `A = insert u (B ∖ N(u))`, the fact `u_i ∈ A ∖ B` forces `u = u_i`.
2. **The shape of `B`.** Then `|N(u_i) ∩ B| = 2` with `r ∈ B` forces `B ∩ N(u_i) = {r, b_ij}` for exactly one `j`. Hence
   `B = (A ∖ {u_i}) ∪ {r, b_ij}`.
3. **Independence of `B`.**
   - `r`'s neighbours are `s` and the chokes, and none is in `A ∖ {u_i}`.
   - `b_ij`'s neighbours are `u_i`, which was removed, and `c_ij`, so `c_ij ∉ A` is necessary and sufficient.
   - Since `v ∈ A`, `B` is a sector source, and `|B| = p + 1`.
   - The `B_j` are distinct because they differ in `b_ij`.
4. **Weight of `A`.** The witness set of `v` is `N(s) ∖ {v} = {r}`, which `A` avoids, so `v` is inactive. The witness set of `c_kl`
   is `N(b_kl) ∖ {c_kl} = {u_k}`, which meets `A` exactly when `k = i`. So the active tags are the `γ` leaves at choke `i`.
5. **Two or more chokes.** A single (S) step at `u` removes only `N(u) ∩ B` and inserts one vertex. From a choke-free `B`, the image
   has at most one choke. ∎

Evidence (bounded, exact, my own instruments):
- **Exhaustive** at every rank, using the d-leg analogue "d − γ", on CB(8,1), CB(3,2), CB(3,3) and CB(4,2): 255, 378, 15,309 and
  2,430 images respectively, **0 failures**. The instrument's independent-set totals reproduce the closed form (33,573 for
  CB(8,1); 167,991 for CB(3,3)).
- **Literal inversion of (D) and (S) at `p*`** on rows 107–122 and the fresh rows 125, 128, 140: 60 sampled images per row, 12 of
  them two-choke controls. Result: **0 failures**; every control had 0 sector preimages. This uses the derived selector.
- This is what U1's `cb8_switch_preimage_count` names but does not prove. It removes one "literal" gap of the doubly-fed capacity
  sum; no claim of formal status is made.

## Mechanism-equivalence and fence check

The mechanism `FORMAL-CB-SECTOR-FLOW-LITERAL-BRIDGES` matches the allocation.

The return does not deliver the mechanism's defining content:
- `g_sec` is not defined;
- the Out and In arc-sum bridges are absent;
- the doubly-fed capacity sum is not reached.

Its compiled content is a CB instantiation of U2 Cycle 2 Part A (F-1), an alias of U2's leg-exclusivity theorem (F-2), and an
abstract `Fin 8` identity (F-3).

Fences:
- **Fence 1:** one rank and the class only; no status transfer. Respected.
- **Fence 2:** the selector is derived and the relation and weight are of record. Respected.
- **Fences 3, 5 and 7:** vacuous, since there is no Newton or Darroch argument, no asymptotic step and no census.
- **Fence 4:** vacuous for U1's own content, since no template-to-network reduction is claimed. The return says so correctly.
- **Fence 6:** no refuted mechanism is revived, and G′ (ruling 20) is not used.
- **Fence 8:** no sealed root was edited, so this is respected. Fence 8's grading rule also stands: scratch declarations carry no
  grade, and the return's grade table respects this.
- **Fence 9 (attribution):** incomplete. The return credits its bridge to itself, with no attribution to U2 Cycle 2 Part A, from
  which the object was allocated.

## Certification audit

| Literal in the return / file | Backed? | Ruling |
|---|---|---|
| "sorry-free", axioms `[propext, Classical.choice, Quot.sound]` (all five) | yes (rebuild + `#print axioms`) | stands |
| `Main.lean` sha256 `4a3f435d…`, 2758 lines, 0 `sorry` | yes | stands |
| carries "byte-identical" | yes, 113/113 (gate ruling 19) | stands |
| Stage 2 seal / six source digests | yes (replayed) | stands |
| header "C1-LA1 sha256 `f0578ed7ce7f51f6cf3a03e1e0c9f1e6d5b0d9a2b0a7c1e6a1b0c9d5e7f2a3b4`" / "full digest recorded in RETURN.md" | **no** (true digest `…f695d410cd…`; RETURN records only 16 hex) | **struck** |
| "rational-to-integral step is CLOSED, generically, by this file" | no: prior stronger in-run lemma (F-1) | **struck** (novelty); reattributed to U2 Cycle 2 Part A plus r30 |
| "`weightedHall_of_ratFlow` … strict generalization … non-aliased" | incomplete (in-run alias, F-1) | **narrowed** |
| "`cb8ChokeState_le` … new literal fact" | no (alias of U2 C2 `chokeBeta_add_chokeGamma_le`, F-2) | **struck** |
| "the literal 8 − γ preimage count" (`cb8_switch_preimage_count`) | no (`Fin 8` identity, F-3) | **struck** ("literal") |
| "TERMINAL … conditional on `g` alone" | no (`hE` is also a hypothesis, F-5) | **struck** |
| "COND4_formal: advanced … reduced … to exactly one hypothesis" | the one hypothesis is ↔ conjunct 4 (F-4), and the reduction existed in Cycle 2 scratch | **struck** (see gate lines) |
| `hE` and favorability unconditional via C2-LA1 / C2-LA3 | yes (read in frozen sources) | stands |
| "`lake build` … exit 0, two linter warnings" | yes | stands |

## Verdict

verdict: retained_narrowed
headline_resolved: no

- COND4_formal: not_advanced
- E1_formal: not_advanced
- TERMINAL_integration: not_advanced
- cut_candidate: none

**What is retained, as compiled scratch with no grade:**
- all five declarations, which are correct, sorry-free and kernel-checked;
- the CB instantiation `cb8_conjunct4_of_ratFlow`;
- the two-line composition `cb8_topRank_eligible_and_weightedHall_of_ratFlow`, which is conditional on `hE` and a ℚ-valued saturating
  flow `g`.

**What is struck or narrowed:**
- `weightedHall_of_ratFlow` is narrowed to a special case of U2 Cycle 2 Part A (F-1).
- `cb8ChokeState_le` is an alias of U2 Cycle 2's `chokeBeta_add_chokeGamma_le` (F-2).
- `cb8_switch_preimage_count` is an abstract `Fin 8` identity, not the literal count (F-3).
- The COND4 "advance" is struck, because the one hypothesis is formally equivalent to conjunct 4 (critic A1, F-4).
- "Conditional on `g` alone" is struck (F-5).
- The fabricated header digest is struck.

The route's mathematics is sound, and nothing in it is refuted. The narrowing concerns novelty and wording: what the return presents as
new progress was either already in the run or is weaker than described.

**Critic-derived advances:**
- **A1 (formal scratch):** U1's hypothesis ↔ conjunct 4; the converse lemma; U1's bridge as a special case of U2 Part A.
- **A2 (STATED, candidate `proved_informal`, pending an isolated second read):** the literal sector-switch preimage count `8 − γ`,
  the image weight `γ`, and zero sector preimages for images with two or more chokes, on the literal network. It is checked
  exhaustively on small CB instances and by literal inversion at `p*` on rows 107–140, including the fresh rows 125, 128 and 140.

## Remaining obligation

Conjunct 4 on the literal `cbGraph m` at `p*` is still fully open. U1 moved no mathematical content towards it; by F-4, its hypothesis
is conjunct 4. Exactly what is needed:

1. **Define `g_sec`.** Build `g_sec : Finset (Fin (17m+3)) → Finset (Fin (17m+3)) → ℚ` on literal pairs from C1-LA1's `cb8Pb`,
   `cb8Pc` and `cb8Sigma`, read through the choke state. Use U2 Cycle 2's `chokeBeta`/`chokeGamma`/`chokeState`, not a fourth copy.
2. **Prove the Out bridge.** Show `Σ_A g_sec(B, A) = Σ_i cb8Out m (state_i B)` with target distinctness across `(i, j, kind)`.
3. **Prove the In bridge** with every zero-flow class included.
4. **Formalize the literal preimage count A2** as a Lean lemma over `transportRel (cbGraph m)`.
5. **Prove the doubly-fed capacity bound.** At a switch image, E1's `ρ_1 γ` plus `(8 − γ)σ(γ) ≤ γ`, citing C1-LA1's
   `cb8_sectorTemplate_nonneg_out_in_switch` and `cb8_sectorTemplate_residual`.
6. **Construct the E1 flow** (U2 and T1/T2's object) and prove that the sum of the two flows satisfies Out `≥` and In `≤`. This is the
   form of U2 Part A, which is weaker than U1's exact `=`.
7. **Discharge `hE` by import.** Import C2-LA1 (and C2-LA3 for `activeWeight` with `F = leafSet`) so that `hE` is discharged, not
   assumed.

Item 4 has the informal proof above. Items 1–3 and 5–7 are unstarted in U1's file.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-U1-F/`.

| Path | SHA-256 | Role |
|---|---|---|
| `LeanProject/LeanProof/Main.lean` | `4a3f435d92017b5d1eb00da168be233f215fec6bb706629fd846ff57ac4671a2` | copy-out of U1's file (unchanged) |
| `LeanProject/{lakefile.toml,lake-manifest.json,lean-toolchain,LeanProof.lean}` | as U1's (manifest byte-identical to C1-LA1's) | skeleton; `.lake/packages` symlink to shared project |
| `LeanProject/LeanProof/CriticF.lean` | `ede05a5378b397ff69f1fe41e3a3440d4c3988db02eb14a7c70b72003a657840` | A1 lemmas and `#print axioms` for all U1 declarations |
| `CriticF.axioms.out.txt` | `2b1b8b1a4027af6b43688c9332419da15f6f91dfd106be026360b1dcb5a94c9a` | axioms output, exit 0 |
| `carry_check.py` / `.out.txt` | `467f36b2…fe06` / `198cbffd…f30` | 113/113 carry byte-compare |
| `preimage_check.py` / `.out.txt` | `f7c9fe84…c2f9` / `036a704b…cfe6` | A2 exhaustive small-instance check |
| `freshrow_check.py` / `.out.txt` | `3b8973cf…c1c0` / `5fdbdb14…7e` | closed-form match, derived selector, A2 literal inversion at `p*`, rows 107–140 |
| `fixedpoint_x.py` / `.out.txt` | `cfe38678…2496` / `b97f134b…c9ba` | §5 fixed points n, α, x at CB(8,95) and CB(8,107) |
| `verify_stage2_seal.py`, `verify_source_digests.py` (+ U1's `.out.txt`) | `c3e8c52c…c9b`, `e140c235…89ce` | U1's generators, replayed copy-out-first (outputs matched on screen) |

Import list for every script: `re`, `hashlib`, `os`, `random`, `sys`, `collections`, all standard library. No background
job was launched; every command ran in the foreground and has returned.
