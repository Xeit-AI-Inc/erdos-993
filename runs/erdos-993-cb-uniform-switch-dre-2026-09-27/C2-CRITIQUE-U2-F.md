# Critique

**Critic:** `C-U2-F`, r31 Cycle 2 Stage 4. Orientation F (falsify), cross-orientation critic of seat U2 (route `C2-U-02`,
mechanism `FORMAL-CB-SECTOR-COMPOSITION-INSTANTIATION`, orientation U). Date 2026-09-28 (by the clock, ~02:20 EDT).

**Boot.** I am operating within VerityOS. I booted with the dispatch's restricted boot and read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no other VerityOS
file outside this run's grant. The harness put the project `CLAUDE.md`, the user memory index and the user's email into my context
automatically. I did not fetch them with a tool and did not use them. I wrote no conversation log; the dispatch allows exactly one
deliverable file.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Dispatch** `control/dispatch/c2-stage4/DISPATCH-C-U2-F.md`: SHA-256 `fd7780867297d254172c38572e95c933f4364a86fe43bb21355407a6e2c8bdb5`. It matched before I read it.
- **Capsule seal** (`control/c2-critic-capsules/U2-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`, sort_keys, `(",",":")`, no trailing newline): recomputed `d83dc4704a9ec440e675db74008db846f0866fdf08ec78257295c2d327055619`, which equals the recorded seal. All 14 members match their listed SHA-256 and byte counts.
- **Stage 4 dispatch seal**: recomputed `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb`, which matches.
- **Stage 3 seal**: recomputed `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`, which matches.
- **Stage 2 seal**: recomputed `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`, which matches.
- **Return** `cycles/cycle-2/stage3/returns/U2/RETURN.md`: SHA-256 `39d877a15f9122bf9c6e38797a914471c49e81a63a0b6addfd7186aa84bd7cb4`, 22,427 bytes. This matches the capsule. The route ID and mechanism token appear verbatim.
- **Digests the return lists.** I recomputed each against its digest file, and all match:
  - C1-LA2 `Main.lean` `a906ec17…b5f3f` and C1-LA1 `Main.lean` `f0578ed7…9b78e`, against `sources/c1-results/SOURCE-DIGESTS.json`.
  - r30 C1-LA2 Snippets 0030 `e8c6b0d1…83fe` and 0031 `ec521065…a2ac2`, against `sources/SOURCE-DIGESTS.json`.
  - The scratch `Main.lean` `a03e15f3695f817ed0c02d16c4d4a258b897c78f8ee773246aa57475c8d81d2c` (2,942 lines), identical in the working copy and the replay copy.
  - The Mathlib pin: `sources/mathlib-binding/PIN.json` rev `905b95818eb32af7874a58b427f50c1711a5e96c`. This equals the lakefile `rev` and the shared checkout's `git rev-parse HEAD`. Toolchain `leanprover/lean4:v4.32.2`.
- **Carries, ruling 12.** I checked these byte for byte in my own copy:
  - Carry (1): the entire C1-LA2 `Main.lean` is the byte-exact prefix of U2's file (offset 0).
  - Carry (2): Snippets 0030 and 0031 are byte-exact substrings (offsets 84438 and 85369). The only other bytes in that stretch are two carry-comment lines.
  - Carry (3): C1-LA1's `Main.lean` is byte-exact from its `-- VERITYOS ENTRY 1 BEGIN` line to the end (offset 92246). Only its 166-byte header (`import Mathlib` plus the generator comment) is omitted, which it must be.
  - Receipts: `RECEIPTS/kernel-verification.json` of C1-LA1 and C1-LA2 bind those `Main.lean` digests, and each `VERIFICATION-REPORT.json` says `formally_verified`. r30 C1-LA2's `FORMALIZATION-STATE.json` lists 0030 and 0031 at exactly these digests.
- **Stage 3 disclosure index (U2).** The lakefile, manifest and toolchain were copied from C1-LA2 rather than from the shared Smoke project. I confirmed the pins are identical and the `.lake/packages` symlink points at the shared project. This does not affect the evidence.

## Independent re-derivation

**Instrument 1: Lean rebuild (copy-out-first).**
- I copied U2's project into `scratchpad/c2-crit-U2-F/LeanProject/` and bound `.lake/packages` by manual symlink. I ran only `cd` into the project, then `lake env lean`; never `lake update` or `lake clean`.
- The pristine `Main.lean` (`a03e15f3…`) compiles with **no output and exit 0** in 21.4 s wall time.
- `#print axioms` on all six U2 theorems (the five the return names plus `sdiff_rv_eq_biUnion`) gives `[propext, Classical.choice, Quot.sound]`.
- There is no `sorry`, `admit`, `native_decide`, `decide` or `axiom` in the file.

**Instrument 2: my own Python, standard library only** (`py/cb_struct.py`).
- It uses the literal CB(d,m) with the r31 labelling (generalised to `d` only to test the structure), enumerates every independent set, and generates every literal (D) ∪ (S) arc from the source side.
- **Fidelity first.** At every rank `1 ≤ p < α` on CB(8,1), CB(3,2), CB(3,3), CB(4,2) and CB(2,4):
  - the selector `F_p` is derived by `Δ_p(T − v) < 0`;
  - `supply − capacity = S(T,p)` is asserted from independent sides: layer weights on one side, `Σ_{v∈F}(Δ_{p−1}(T−H_v) − Δ_{p−1}(T−R_v))` on the other. All 51 rows pass;
  - `x` is computed through `α`.
- These instances lie outside the class (`d ≠ 8` or `m < 107`). They test the structure of U2's lemmas, which do not depend on rank or size. **They are not evidence for the class, and nothing is claimed for `d ≠ 8`.**
- Fixed-point sanity check: `|I(CB(8,1))| = 33573` and `α = 10 = 9m+1`.

**Instrument 3: contract §5 fixed points by an independent tree DP** (no closed forms; `py/fixed_points.py`).

| Row | n | α | p* | x | θ | ρ_1 | Margin `(1−ρ_1)/θ` | `R_K/R_{K−1}` |
|---|---|---|---|---|---|---|---|---|
| CB(8,107) | 1822 | 964 | 572 | 570 | 96/766193 | not a contract fixed point | 34.9009 | 572/571 |
| CB(8,95) | 1618 | 856 | 508 | 506 | 96/604265 | 1354839571516225/1361543988640524 | not a contract fixed point | 508/507 |

- Every value the contract gives is reproduced exactly.
- `ρ_1` is computed as `r1(p*−1)/r1(p*−2)` with C1-LA1's `cb8R1` form. This confirms that C1-LA1's Residual uses the same `ρ_1` as the contract (`K = (16m+1)/3 = p*−1`).

**Re-derivation of each U2 claim.**

- **Part A (`weightedHall_of_ratFlow_bound`).** I re-derived it by hand. Take `g ≥ 0`, supported on `transportRel`, with row sums at least the source weight and column sums at most the target weight. For `X ⊆ I_{p+1}`:
  `Σ_X w ≤ Σ_X Σ_{I_p} g = Σ_X Σ_{N(X)} g = Σ_{N(X)} Σ_X g ≤ Σ_{N(X)} Σ_{I_{p+1}} g ≤ Σ_{N(X)} w`.
  - The second step uses the support, the fourth uses nonnegativity.
  - `N(X)` is exactly the carried `WeightedHall`'s filter: `(indepFamily G p).filter (∃ B ∈ X, transportRel G B A)`.
  - The statement is **correct and genuinely generic**: arbitrary `V`, `G`, `F`, `p`, with no CB-specific hypothesis.
- **Does Part A duplicate r30's formally verified companion?** It does not.
  - I searched every frozen Lean award under `sources/` (`r30/lean/*`, `first-interior/c2-primary-v2`, `c1-results/runs/*`). None contains any `ℚ` or `ℝ` except C1-LA1's intercept table. So no rational-flow-to-Hall lemma exists on record.
  - r30's `exists_saturatingFlow_of_weightedHall` (0031) goes from Hall to an integral flow. Its `weightedHall_of_saturatingFlow` (0033) goes from an integral flow to Hall.
  - U2's `exists_saturatingFlow_of_ratFlow_bound` is the new rational-to-Hall step composed in one line with 0031. The *rational-to-integral* step itself is 0031, carried rather than re-proved. The return is accurate on this point.
- **Part B (leg exclusivity, `β_i + γ_i ≤ 8`).** Correct. `b_ij ~ c_ij` enters through the carried `cbGraph_adj_support_leaf`. My instrument confirms it on every sector set.
- **Part C ("Lemma 0", `Σ_i(β_i+γ_i) = |B| − 2`).** I checked it against the literal definition:
  - `IsSectorSource m B := IsIndepSet ∧ cbVertex m 0 ∈ B ∧ cbVertex m 2 ∈ B`.
  - C1-LA2's frozen labelling is `0 = r`, `1 = s`, `2 = v`. So this is literally `r, v ∈ B`, with no size restriction. It therefore covers both layers.
  - It is **not vacuous**: I proved `critic_isSectorSource_pair` (the pair `{r, v}`) in Lean.
  - The case split is exhaustive: `cb_val_cases` has six label shapes, `s` and `u_i` are excluded by adjacency to `r`, and choke ranges are disjoint by the 17-spacing.
  - My instrument confirms the identity on every sector set of every instance.
- **Part D (`sector_out_ge_one`).** Is this the literal Out over every assignment, as C1-LA1 states it? C1-LA1's Out conjunct and `cb8_sum_out` quantify over **every** `c : Fin m → State8` with leg total `(16m+1)/3`. `sector_out_ge_one` instantiates `c := chokeState m B hsec` and discharges the leg-total hypothesis with Part C and `hcard`.
  - So it is a correct instance of C1-LA1's universally quantified Out. But it is **the template's per-state Out evaluated at the literal state vector. It is not the outflow of any flow on the literal network.** See the narrowing in the Verdict.

## Attacks and findings

1. **F-1 (certification literal, false attribution of a hypothesis).**
   - The return says that in Part D "`m ≥ 107`, `m ≡ 2 (mod 3)`" enters "via C1-LA1's `cb8_sum_out m hm3`". That is wrong: `cb8_sum_out` takes only `hm3 : m % 3 = 2` (entry 23 of C1-LA1). In `sector_out_ge_one`, `hm : 107 ≤ m` is used only to supply `0 < m` to Part C.
   - The template's Out inequality holds for every `m ≡ 2 (mod 3)`, `m ≥ 1`.
   - Where `m ≥ 107` really enters the composition is C1-LA1's Residual (entry 32) and the nonnegativity conjunct (entry 27), which is not yet used on the literal network. Part A's `hg_nonneg` will need nonnegativity.
   - The return's text should be corrected. The Lean is unaffected.
2. **F-2 (certification literal, carried layer).**
   - The return says r30 C1-LA2's entries "0001–0021, is the *same* carried layer already in C1-LA2 above". By digest this holds only for 0001–0013. For **0014–0021** (`indepFamily`, `tagWitnesses`, `activeWeight`, `layerWeight`, `favorableLeaves`, `transportRel`, `IsSaturatingFlow`, `WeightedHall`) the r30 C1-LA2 digests (`44216498…`, …, `972d0d90…`) **differ** from r31 C1-LA2's (`73df20a8…`, …, `63534ffb…`).
   - I diffed 0014, 0019, 0020 and 0021. The differences are in the wrapper only: `open scoped Classical` became `open Classical in` on two definitions, plus doc comments. C1-LA2's own header records a `pp.all` term-identity check.
   - So Snippets 0030 and 0031 are re-elaborated here against r31 C1-LA2's definitions, not the ones r30's kernel receipt covered.
   - The evidence for the carried companion **in this file** is therefore the kernel re-check in scratch, not r30's receipt. U2's build and my rebuild both pass. The claim should be restated.
   - This does not violate ruling 12: U2 did not carry r30 0014–0021.
3. **F-3 (replay transcript).**
   - `replay.sh` appends a `#print axioms` block to the very `Main.lean` whose digest it prints, so it edits the replay copy in place.
   - `replay_output.log` shows the five-line axiom block **twice**. A single run of the script on a pristine file cannot produce that.
   - The replay copy's current digest is `a03e15f3…`, so it was restored at some point. The log is not a clean single-run transcript.
   - The axioms are genuine: my independent `#print axioms` on a separate file (`Critic.lean`, whose byte prefix equals `Main.lean`) reproduces them. The certification literal "executed replay … confirming" stands only because of my rebuild.
4. **F-4 (struck analogy).** The return calls the in-proof equality of `B.card − 2` with `Σ(β+γ)` "the formal analogue of the brief's 'asserts supply − capacity = S from independent sides'". That is not a (WID) check.
   - U2 asserted no (WID), which is acceptable for a proof-only route that builds no numeric network.
   - The analogy is struck as a fidelity claim. My Instrument 2 supplies the (WID) check for the network shapes involved.
5. **F-5 (the remaining obligation is not exact: nodes it omits).** My source-driven arc census on the literal networks (Instrument 2; all ranks, five instances) shows:
   - **(a) In-sector targets have literal in-arcs from non-sector sources.** These are two-for-one arcs inserting `u = r` from sources holding `v` and two chokes. They exist for every `m ≥ 2`; for example, CB(3,3) has 5,184 such arcs.
     - The template's `cb8In` counts only sector deletion in-arcs. E1 is deletion-only, and deleting from a source without `r` or without `v` never produces an in-sector set.
     - So the literal `g` must be shown to be **zero** on these arcs. The same holds for the sector sources' `u = s` switches, for the `u_i`-switches at state `(1, 0)` (weight-0 images), and for the non-sector `u = choke` and `u = b` switches into switch-image targets.
     - U2's item 2 mentions only "`0` otherwise". The target case split must carry these classes explicitly, because Part A's `hIn` sums over **all** of `I_{p+1}`.
   - **(b) Weight identifications, not listed anywhere in the obligation.** Part A's `hOut`/`hIn` compare against `activeWeight` with `F = favorableLeaves (cbGraph m) p*`. The composition needs:
     - `w(sector source) = 1`;
     - `w(in-sector target) = 1`;
     - `w(u_i-switch image) = γ_i`;
     - the rewrite `favorableLeaves = leafSet` under the favorability hypothesis, through the carried `favorableLeaves_eq_leafSet_of_all`.
     
     My instrument confirms the general weight law `w(A) = [r, v ∈ A] + Σ_{u_k ∈ A} γ_k(A)` on every independent set of all five instances.
   - **(c) The arc-sum identities.** These are `Σ_{A∈I_{p*}} g(B,A) = Σ_i cb8Out(chokeState B i)` for a sector `B`, and `Σ_B g(B,A) = Σ_i cb8In(chokeState A i)` for an in-sector `A`.
     - Both need distinct targets per source (confirmed: every source's (D) ∪ (S) targets are pairwise distinct in all instances) and a biUnion/card argument over leg vertices.
     - Without them, `sector_out_ge_one` does not reach `hOut`.
   - **(d) The E1 hypothesis's exact shape** (see "T3 question" below).
   - The return's item 4 (the `8 − γ` preimage count) is correctly named. My instrument confirms it on every switch-image-shaped target (254 on CB(8,1), 15,309 on CB(3,3)). This is bounded evidence only.
6. **Attack on Out and In and their loads: no defect.**
   - At a state `(β, γ)`, `cb8In` is `(8−β−γ)·(pb(β+1,γ) + pc(β,γ+1))`. This is exactly the literal inflow from the two sector sources per empty leg (add `b_ij`, or add `c_ij`), each evaluated at the *source's* state.
   - `cb8Out` is `β·pb + γ·pc + [β = 1 ∧ γ ≥ 1]·σ(γ)`. This is exactly the literal outflow once (c) is proved.
   - Deletions of `r` or `v` land on weight-0 targets, which is consistent.
   - The only doubly-fed class my census finds is the switch-image shape: sector `u_i`-switches plus non-sector deletions. Every other target class with positive weight receives no sector arc.
7. **Attack on the hypotheses of Part A.** These are fine.
   - `hg_supp` requires `g = 0` off `transportRel`, which is enough. The sums run over the layer families, so `g` outside `I_{p+1} × I_p` is irrelevant.
   - `hOut` is stated as `≤` rather than `=`. That is fine, because 0031 produces exact saturation from Hall.
   - No hypothesis encodes the conclusion.
8. **Hygiene note for a future award.** The merged `Main.lean` has duplicate `VERITYOS ENTRY n BEGIN` markers, because C1-LA2 and C1-LA1 both number from 1. The (origin, entry, digest) triple still disambiguates. A governed award should re-key the markers through the helper rather than inherit a file with colliding markers.
9. **Cut search.** Not applicable (orientation U return; no network rows). My arc census found no class that the contract's target case split misses. **No cut candidate.**

**Critic-derived advance (attributed to critic C-U2-F; scratch, no grade; SOLUTION-CONTRACT §4).** I attempted U2's open nodes. The following compile sorry-free against the pinned Mathlib, appended after U2's unchanged `Main.lean` bytes in `scratchpad/c2-crit-U2-F/LeanProject/LeanProof/Critic.lean` (SHA-256 `7d174e18…58fdb3`; additions alone in `CriticAdditions.lean.part`, 229 lines, `082b9be6…0c61`). Each has axioms `[propext, Classical.choice, Quot.sound]`; the build takes 29–30 s with exit 0, no errors and no warnings.

- `critic_sector_in_le_one`: for an in-sector `A` with `A.card = p*`, `Σ_i cb8In(chokeState A i) ≤ 1`. **This closes U2's remaining obligation 1.**
- `critic_sector_activeWeight_eq_one`: every sector set has `activeWeight (cbGraph m) (leafSet) B = 1`. The only active tag is `v`, with witness `r`; a `c_ij` would need `u_i ∈ B`, which is impossible next to `r`. This proves the `w = 1` node of F-5(b) for sources and for in-sector targets alike.
- `critic_switch_mem_transportRel`: at a choke with `b_ij ∈ B` and `chokeBeta m B i = 1`, the `u_i`-switch `insert u_i (B \ N(u_i))` is a literal `transportRel` arc (`u_i ∉ B` and `N(u_i) ∩ B = {r, b_ij}`, card 2). This proves the switch half of U2's item 2(b).
- `critic_switch_image_activeWeight`: the `u_i`-switch image of a sector set has active weight exactly `chokeGamma m B i`. This proves the `w = γ` node of F-5(b).
- `critic_isSectorSource_pair`: non-vacuity of `IsSectorSource`.

Still open after this advance:
- the `8 − γ` preimage count (formal);
- the literal `g` and its two arc-sum identities (F-5(c));
- the zero-flow target case split (F-5(a));
- the E1 hypothesis;
- the `favorableLeaves` rewrite at the terminal.

**T3 question: can U2's open node take T3's explicit flow statement as a hypothesis as stated?** I cannot adjudicate T3's text: T3's return is outside my read boundary, and the attack brief is a pointer, not evidence. What I can state exactly is the shape Part A must receive for the E1 part. The controller or the synthesis should check T3's statement against it.

- `gE1 : Finset V → Finset V → ℚ`, with `gE1 ≥ 0`.
- `gE1` is supported on the **first** disjunct of `transportRel` (deletions), with sector rows equal to 0.
- For every non-sector `B ∈ I_{p*+1}`: `Σ_A gE1 B A ≥ activeWeight (favorableLeaves p*) B`.
- Columns:
  - `= 0` on in-sector targets (automatic for deletions from non-sector sources);
  - `≤ ρ_1·γ` on `u_i`-switch images, where `ρ_1` must be stated **literally as** `cb8R1 m K / cb8R1 m (K−1)` with `K = (16m+1)/3`, the form in which C1-LA1's Residual is proved. Otherwise a bridging identity to the `r_q` coefficient form is a further node;
  - `≤ activeWeight` on every other target.
- A statement given only as "every non-sector source is saturated and loads are within capacity", without per-arc values and without `ρ_1` in the `cb8R1` form, cannot be consumed as is.

## Mechanism-equivalence and fence check

- **One rank, the class only.**
  - `sector_out_ge_one` and my `critic_sector_in_le_one` are at `p*` with `m % 3 = 2` and `m ≥ 107`.
  - Parts A–C and my weight and arc lemmas are rank-free structural facts about `cbGraph m`, or generic graph facts. They claim nothing at other ranks for the target.
  - My small-instance census (d ∈ {2, 3, 4, 8}, m ≤ 4) is a structural test only, and no claim is made there.
- **No refuted mechanism is revived.** The route is a composition of C1-LA1's closed-form template with the literal network, the r30 mechanism of record. It is not the `m`-independent per-choke certificate (the pb/pc/σ/θ are `m`-dependent), not a compression lemma, and not real-rootedness.
- **Darroch/Newton: none.**
- **The `θ*` law is never a hypothesis.** `cb8Theta = 288/(200m²+82m+5)` enters only as a template value whose feasibility C1-LA1 proves; optimality is never used.
- **No status transfer.** Nothing in this route or this critique touches `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN) or `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN). The r30 bounded record is not used.
- **Claim identity.** U2 proposes no key, and neither do I.
  - The critic lemmas are nodes of the composition, registered as the run-local composition key (R-2, `proved_informal`).
  - Registering any of them as a separate `E993-R31-` key would **alias** that composition node. They should enter only through a governed award's face.
  - Keys touched: `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (formally verified, companion carried), `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` (sector shape, not re-graded), C1-LA1, C1-LA2.
- **Attribution.** The network, weight and relation belong to Codex GPT-6's lower-region run and r30. The template is C1-LA1's; the CB layer is C1-LA2's. Parts A–D are U2's (r31 Cycle 2, Claude Sonnet 5). The five `critic_*` lemmas are C-U2-F's (r31 Cycle 2 Stage 4, Claude Opus 5.5).

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| "compiles with zero errors" | My pristine rebuild: exit 0, no output | **Backed** |
| "sorry-free", "`grep -c sorry` → 0" | Checked; also no `admit`/`native_decide`/`axiom` | **Backed** |
| axioms `[propext, Classical.choice, Quot.sound]` on the five theorems | Reproduced independently (six theorems) | **Backed**, by my rebuild; the shipped log is not a clean single-run transcript (F-3) |
| "carried byte-identically" (C1-LA2, C1-LA1, 0030/0031) | Byte offsets verified; C1-LA1 minus its 166-byte header | **Backed** |
| "0001–0021 … the *same* carried layer" | 0014–0021 digests differ (wrapper-level) | **Struck as stated**; restate as "0001–0013 identical; 0014–0021 term-identical per C1-LA2's pp.all record" (F-2) |
| "rational-to-integral step fully discharged, unconditionally" | Part A plus 0031 re-checked in scratch | **Backed** at scratch level (no grade) |
| "m ≥ 107 … enters via `cb8_sum_out m hm3`" | `cb8_sum_out` has no `107` hypothesis | **Struck** (F-1) |
| "formal analogue of … supply − capacity = S" | Not a (WID) check | **Struck** (F-4) |
| "for the first time proved about an actual vertex set" (Part D) | True of the template's Out at the literal state vector | **Narrowed**: not the literal outflow of any flow |
| "≈24s" compile | Mine: 21.4 s | Informational, not a claim |
| `headline_resolved: no`, gate lines | Consistent | **Backed** |
| "Once (1)–(4) close … discharges conjunct 4 in one line" | Omits F-5(a)(b)(c) and the `favorableLeaves` rewrite | **Struck as stated** |

The `## Remaining obligation` is **not exact**: it omits F-5(a)–(d). Item 1 is now closed by the critic lemma. The corrected list is under `## Remaining obligation` below.

## Verdict

U2's four parts are correct as Lean mathematics. They compile, they are sorry-free, and their axioms are standard. Part A is a genuine, generic and new rational-flow-to-(HALL) lemma. Parts B and C are faithful literal readings of the sector shape. Part D is a correct instantiation of C1-LA1's universally quantified Out.

The verdict narrows the return's descriptions:
- Part D is the template's Out at the literal state vector, not a literal outflow (Attack 1, "Part D" above).
- Strike the `m ≥ 107` attribution (F-1), the "same carried layer" statement (F-2) and the (WID) analogy (F-4).
- The replay log is not a clean transcript (F-3).
- The remaining obligation is incomplete (F-5).

No defect touches the evidence. Grade: scratch, no grade (SOLUTION-CONTRACT §4). The composition stays at its entering grade, `proved_informal` (R-2).

verdict: retained_narrowed
headline_resolved: no

ELIG_formal: not_advanced
HALL_formal: advanced
FAV_darroch_free: not_advanced
cut_candidate: none

## Remaining obligation

This is what a successor inherits for terminal conjunct 4 under the favorability hypothesis, in dependency order. Items marked DONE are closed in scratch by U2 or by this critic, with no grade.

1. DONE (U2): the rational flow gives (HALL), which gives an integral flow (`exists_saturatingFlow_of_ratFlow_bound`).
2. DONE (U2): choke-state extraction and the literal leg count `Σ(β+γ) = |B| − 2`.
3. DONE (U2): template Out at the literal state vector, for sector sources with `|B| = p*+1`.
4. DONE (C-U2-F): template In at the literal state vector, for in-sector targets with `|A| = p*` (`critic_sector_in_le_one`).
5. DONE (C-U2-F): `w(sector set) = 1` and `w(u_i-switch image) = γ_i` with `F = leafSet`; the `u_i`-switch at `β_i = 1` is a literal `transportRel` arc.
6. OPEN: define the literal sector `g_sec : Finset → Finset → ℚ`:
   - `pb(state_i(B))` on `B → B.erase b_ij`;
   - `pc(state_i(B))` on `B → B.erase c_ij`;
   - `σ(γ_i)` on the `u_i`-switch when `β_i = 1 ∧ γ_i ≥ 1`;
   - `0` on every other pair.
   
   Then prove (a) that its support lies in `transportRel`, with the deletion half immediate and the switch half from item 5, and (b) the two arc-sum identities `Σ_A g_sec(B,A) = Σ_i cb8Out` and `Σ_B g_sec(B,A) = Σ_i cb8In`. These need a biUnion/card argument over the leg vertices keyed by choke state, together with target distinctness.
7. OPEN: the switch-image load: exactly `8 − γ` sector preimages, so the `g_sec` column at an image equals `(8−γ)σ(γ) ≤ θγ` (C1-LA1 Switch).
8. OPEN: the E1 part as a named hypothesis, in exactly the shape given under "T3 question" above, with `ρ_1` in C1-LA1's `cb8R1` form. Then the Residual gives `ρ_1γ + θγ ≤ γ` at images.
9. OPEN: the target case split for `hIn` over **all** of `I_{p*+1}`, with zero flow on:
   - the non-sector `u = r` two-for-one arcs into in-sector targets;
   - the sector `u = s` switches and `(1, 0)` switches;
   - the non-sector switches into images;
   - the weight-0, one-choke-other and two-or-more-choke classes, which receive E1 only.
10. OPEN: the terminal: rewrite `favorableLeaves (cbGraph m) p* = leafSet` by `favorableLeaves_eq_leafSet_of_all` from the favorability hypothesis, then apply item 1 to `g_sec + gE1`.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-U2-F/` (SHA-256).

| File | SHA-256 | Contents |
|---|---|---|
| `LeanProject/LeanProof/Main.lean` | `a03e15f3695f817ed0c02d16c4d4a258b897c78f8ee773246aa57475c8d81d2c` | U2's file, copied out, unmodified |
| `LeanProject/LeanProof/Critic.lean` | `7d174e185e4437a2a018032933cdfddf2ae9b51a4909b6c30449aa079d58fdb3` | `Main.lean` bytes plus the critic additions and `#print axioms` |
| `LeanProject/LeanProof/CriticAdditions.lean.part` | `082b9be6487f1bcd861308b1e83f62b16d1c3bdf8b8169b5c4489bd309f30c61` | Critic additions alone |
| `build_pristine.log` | `1c1d1b3d83fda6561b69496e482058ab3b26d25cbfcde838a3fed344c5c4ae3f` | Pristine build: timing only, no diagnostics |
| `critic_build.log` | `58f7004cdae4eacef62ae7b73c71c024c84ad4f49bc9636c3d1100571247f3f8` | Axioms of 5 critic plus 6 U2 theorems |
| `py/cb_struct.py` | `2c49d64bb07fd9fbcd13de4bec2471e6e427e9ae93ce8f0a00797c0a75f4b26d` | Instrument 2 script |
| `py/cb_struct.out` | `99c89f31bd53e14a58267e2d82cc5d6b668ac5c0096489b0785087cb3326022c` | Instrument 2 output |
| `py/fixed_points.py` | `c89617f22c68482ddbd05c1799d90664fc59bf1578094c5a94ba6d167e1ae889` | Instrument 3 script |
| `py/fixed_points.out` | `03cf467a347cbb8e1b5f609f4b362a0dade881c8fc0ea9c5d4a9e7943ed4f825` | Instrument 3 output |
| `replay.sh` | `5b7da3910c5fd5dfa2739d44a0a2306a5de3958b0ab985087395f5452a58641f` | Copy of U2's evidence, for the F-3 audit |
| `replay_output.log` | `4438a5fe983ffd0b8f24f7fb2c012cc5ee84904ce16479a1a568fdf990de9741` | Copy of U2's evidence, for the F-3 audit |
| `build_axioms.log` | `ca5e9a30d812cc08ba5ca26a6103222c6dff85398fee57e8a971947aeb324fa1` | Copy of U2's evidence, for the F-3 audit |

The project `LeanProject/` has `lakefile.toml`, `lake-manifest.json`, `lean-toolchain` and `LeanProof.lean` copied from U2, and `.lake/packages` symlinked to the shared pinned project.

**Read-boundary and process disclosures.**
- **Searches within the grant.** I ran one `grep -rn --include=Main.lean` and one `grep -c` loop over `sources/r30/lean`, `sources/c1-results/runs` and `sources/first-interior`, all under `sources/`. I ran non-recursive `ls` of `sources/` subdirectories, of `scratchpad/c2-U2/` and `scratchpad/c2-U2-replay/`, and of `cycles/cycle-2/stage4/critics/U2` to create my output directory. That last listing showed a sibling orientation directory by name only; I did not open it.
- **Pin check.** I read `lean-toolchain` of the shared pinned project and ran `git rev-parse HEAD` on its Mathlib checkout.
- **Process listings (system-wide).**
  - To find my own background job I ran `ps -ax | grep cb_struct.py` and later `pgrep -fl 'lean|cb_struct'`.
  - The second listing displayed other critics' processes (command lines naming `scratchpad/c2-crit-U1-F` and `scratchpad/c2-crit-U1-T`). These are names only. I did not use them and did not touch those processes.
- **Background job.**
  - The first version of Instrument 2 exceeded the 600 s foreground budget, and the harness moved it to the background.
  - I killed it by literal PID 29275; its parent shell, 29266, had already exited.
  - The rewritten, source-driven instrument ran in the foreground in 15 s. No job of mine is running at this write.
- **Nothing else.** No network access, no installs, no `lake update` or `lake clean`. I read no sibling return, critique or adjudication.
