# Critique

Critic `C-U1-T` (r31 Cycle 3, Stage 4; cross-orientation T (prove) against seat U1, route `C3-U-01`,
mechanism `FORMAL-CB-SECTOR-FLOW-LITERAL-BRIDGES`, orientation U).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

Boot: operating within VerityOS. Loaded exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`; no other VerityOS file was read (the project `CLAUDE.md` and
the user auto-memory index were injected by the host at session start, not read by me).

Read-boundary disclosures (two; both disclosed here, neither used as evidence):
1. `control/C3-CRITIC-ATTACK-BRIEFS.md` is a capsule member, but I displayed it whole with one `cat` instead of only the U1
   section, so the other seats' sections passed through my context. Nothing in them is used below; only the U1 section is
   relied on.
2. Beyond the capsule list I read two Stage 2 members under `sources/`, which the dispatch authorizes: the Cycle 2 U2 scratch
   `sources/c2-stage7-sources/U2/LeanProject/LeanProof/Main.lean` (sha256 `a03e15f3695f817e…`, stage-2-manifest match),
   lines 2575–2760 (Parts A and B, for the duplicate check the attack brief asks for), and the C2-LA1/C2-LA2/C2-LA3
   `Main.lean` files (terminal statements; C2-LA1 in full as a merge input). I ran one bounded `grep -rln` rooted at `sources/`
   subdirectories to find prior `ratFlow` lemmas. It hit one Cycle 2 adjudication file, which I did not open.
   I did not read any sibling return, critique (the `critics/U1/F/` directory exists and I did not open it), Cycle 3
   adjudication, other experiment root or network resource. No package install and no network access. Every `lake`/`lean` call ran from
   inside my copied project. I never ran `lake update` or `lake clean`.

## Identity and seal audit

- Dispatch `DISPATCH-C-U1-T.md`: sha256 `e9597555d53996b6b275dfff90fb62e0ad59c95a8efbd8cc9c3a4e92ddd3b513`, which matches.
- **Capsule seal** `control/c3-critic-capsules/U1-PACKET-MANIFEST.json`: recomputed
  `199c8ee6ee3bcc81433fdcbb3304e7c9cf08d4dd56846cf46bcebb02d2908268`, which matches the recorded value. All 14 listed files match
  in bytes and sha256.
- Stage 4 dispatch manifest seal: `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05`, which matches. Its 13 files
  are inside the capsule set or were checked through it.
- Stage 3 packet manifest seal: `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`, which matches. It lists
  `cycles/cycle-3/stage3/returns/U1/RETURN.md` at `62677b42…d32d1` (matches) and `DISPATCH-U1.md` at `9c67363c…aa7`, the value
  the return quotes.
- Stage 2 seal: `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`, recomputed and matching. I also replayed
  the return's own `verify_stage2_seal.py` copy-out-first, which prints `True/True`.
- Digests the return lists. Own files: `Main.lean` `4a3f435d…71a2` (2758 lines, 0 `sorry` tokens),
  `verify_stage2_seal.py` `c3e8c52c…`, `verify_source_digests.py` `e140c235…`. All match. The six source digests match at full
  length against `sources/c1-results/SOURCE-DIGESTS.json`, `sources/SOURCE-DIGESTS.json` and the Stage 2 manifest
  (C1-LA1 `f0578ed7ce7f51f695d410cd…`, C1-LA2 `a906ec179d52c254…`, r30 Hall⇒sign `7c279f4b25a07d02…`, and the three
  skeleton files). The replay of `verify_source_digests.py` prints `ALL_MATCH: True`.
- **Struck literal in the artifact.** Line 12 of `Main.lean` gives the C1-LA1 digest as
  `f0578ed7ce7f51f6cf3a03e1e0c9f1e6d5b0d9a2b0a7c1e6a1b0c9d5e7f2a3b4` and says "full digest recorded in RETURN.md". The true
  digest is `f0578ed7ce7f51f695d410cdbd1265d7071d40f40832635ed12d3dade6c9b78e`. Only the first 16 hex characters are right; the
  other 48 are invented. RETURN.md records only the 16-character prefix. Both statements are struck. The error is in a comment,
  so no proof depends on it, but it is a false certification literal.

## Independent re-derivation

Instrument: my own copy of the U1 project, `scratchpad/c3-crit-U1-T/LeanProject/` (skeleton and `Main.lean` copied out, and
`.lake/packages` symlinked by hand to the pinned shared Mathlib `905b9581…`, v4.32.2). I also wrote my own Lean file and three
stdlib Python checkers.

1. **Rebuild.** `lake env lean LeanProof/Main.lean` exits 0 with two `unusedVariables` warnings only (`hm`, `hmod` in
   `cb8_conjunct4_of_ratFlow`), 24.7 s wall. `lake build LeanProof` succeeds. `#print axioms` on all five U1 declarations
   (`weightedHall_of_ratFlow`, `cb8_conjunct4_of_ratFlow`, `cb8_topRank_eligible_and_weightedHall_of_ratFlow`,
   `cb8ChokeState_le`, `cb8_switch_preimage_count`) and on the carried `exists_saturatingFlow_of_weightedHall` gives
   `[propext, Classical.choice, Quot.sound]`. There is no `sorry`, `admit`, `native_decide` or new `axiom`.
2. **Carries, byte level** (`carry_check.py`, entry-by-entry against the frozen sources):
   - C1-LA1: 33 of 33 entries byte-identical, and the block is a contiguous substring of the source.
   - C1-LA2: 78 of 78 byte-identical and contiguous.
   - r30 Hall⇒sign: entries 30–31 byte-identical and contiguous.

   Deviation from gate ruling 19: the origin terminals `cb8_topRank_sectorTemplate_feasible` (C1-LA1 entry 33) and
   `cb8_topRank_of_descent_and_flow` (C1-LA2 entry 78) are carried with the `theorem` keyword unchanged, not with the ruled
   `theorem → lemma` edit and reversibility record. This is harmless in scratch but must be fixed before any award adopts the file.
3. **Definitional environment of the r30 carry** (`defs_check.py`, `defs_diff.py`). The return says that C1-LA2 "already carries
   byte-identical definitions" of `indepFamily`, `tagWitnesses`, `activeWeight`, `layerWeight`, `favorableLeaves`,
   `transportRel`, `IsSaturatingFlow` and `WeightedHall`. **That is false as written.** All eight entries (14–21) have different
   digests in the two files. After comment lines are removed, the declaration code is identical except for the classical
   scoping: the r30 Hall⇒sign award wraps them in `open scoped Classical`, while C1-LA2 (via r30 C1-LA1's "freeze repair 3")
   uses `open Classical in` on `favorableLeaves` and `WeightedHall` only. As a result, the r30 origin receipt for entries 30–31
   covers a different definitional environment. In this file, entries 30–31 are certified only by the fresh kernel check,
   which passes. The mathematics is unaffected; the carry's receipt binding is weaker than stated.
4. **The central lemma, derived independently** (`LeanProof/Critic.lean`, my own proof, sorry-free, axioms
   `[propext, Classical.choice, Quot.sound]`). Informally: for `X ⊆ I_{p+1}`,
   `Σ_X w ≤ Σ_X Σ_{A∈I_p} g(B,A) = Σ_X Σ_{A∈N(X)} g(B,A) = Σ_{N(X)} Σ_X g ≤ Σ_{N(X)} Σ_{I_{p+1}} g ≤ Σ_{N(X)} w`.
   Each step uses exactly one hypothesis: Out-`≥`, the support, `sum_comm`, nonnegativity and In-`≤`, in that order. Then
   `exact_mod_cast` returns to ℕ. My theorem `ratHall_ge` takes the weaker **Out-`≥`** row condition, sums over the layers
   (the `IsSaturatingFlow` shape), and uses support `¬transportRel ⇒ g = 0` with no layer requirement. I then proved U1's
   `weightedHall_of_ratFlow` **as a corollary** of it (`weightedHall_of_ratFlow'`, compiled). So U1's lemma is a special case
   and correct.

## Attacks and findings

**A1. The one hypothesis is conjunct 4 restated, and the conditional terminal is a reformulation.** The attack brief asks
whether U1's hypothesis encodes conjunct 4. I proved in Lean (`ratFlow_iff_saturatingFlow`, generic in `G, F, p`, sorry-free,
axioms clean) that
`(∃ g : ℚ-valued, hnn ∧ hsupp ∧ hsrc(=) ∧ htgt(≤)) ↔ ∃ f, IsSaturatingFlow G F p f`.
The forward direction is U1's chain. The backward direction casts `f` to ℚ and uses the support to move the sums from the layers
to `univ`. So U1's single hypothesis is **logically equivalent** to conjunct 4. It is not a strictly weaker or checkable
object. Its only content is the ℕ→ℚ relaxation, which is the form the E1 + sector certificate actually produces. Every piece of
mathematical difficulty in conjunct 4 remains inside that hypothesis. `cb8_conjunct4_of_ratFlow` does not use `hm` or `hmod`
(the linter says so), which confirms that nothing specific to CB is involved. The label "conjunct 4's formal obstruction is now
reduced … to exactly one hypothesis" overstates this. The accurate statement is "conjunct 4 ⇔ a fractional saturating flow". It
is a valid and reusable interface, not a reduction of difficulty.

**A2. Duplicate: the rational-to-integral step already existed, in a stronger form.** Cycle 2 seat U2's scratch, a Stage 2 member
at `sources/c2-stage7-sources/U2/LeanProject/LeanProof/Main.lean` lines 2581–2670, already proves
`weightedHall_of_ratFlow_bound` and `exists_saturatingFlow_of_ratFlow_bound` (build log: axioms clean). Those have
**Out-`≥`** at sources, layer sums, and support `¬transportRel ⇒ 0`. The C3 allocation's U1 object names this step as
"the rational-to-integral step (U2 Part A)", which points to an existing artifact to wire in. U1 instead re-proved a
**strictly weaker** version. It requires exact row equality `Σ_A g B A = w(B)` over `univ` and the stronger support clause with
layer membership. The "Alias check (mathematical)" section of the return compares only with r30's
`weightedHall_of_saturatingFlow` and misses this precedent. The exact-equality form is also worse downstream. C1-LA1's template
gives Out `≥ 1`, and SEMANTIC-CONTRACT §2 says it is "then scaled down to exactly 1". With U1's lemma, a successor would have to
formalize a per-source rescaling of `g`. With the `≥` form (U2's, or my `ratHall_ge`) that step disappears. So Remaining
obligation item 3, "The rational-to-integral step is CLOSED, generically, by this file", is narrowed: it was closed in
scratch in Cycle 2 in the better shape. Neither version is a governed award, since a grep of the three C2 award `Main.lean`
files finds no `ratFlow`.

**A3. Duplicate: `cb8ChokeState_le`.** The same Cycle 2 U2 file (Part B, lines 2676–2730) already defines `chokeBeta` and
`chokeGamma`. Their filters are character-for-character the same as the two components of U1's `cb8ChokeState`. The file also
proves `chokeBeta_add_chokeGamma_le` (the identical statement `β + γ ≤ 8` under `IsIndepSet` and `i < m`) and goes further:
`chokeState : Fin m → State8` places the literal state in C1-LA1's `State8`, and the sector leg-count identity follows. U1's
lemma is correct (kernel-checked) but adds nothing to the record. Its `cb8ChokeState` returns `ℕ × ℕ` on `i : ℕ` and is not
connected to `State8`.

**A4. `cb8_switch_preimage_count` is abstract, not literal.** Its statement is
`(Finset.univ \ C).card = 8 - C.card` for `C : Finset (Fin 8)`, which is a Mathlib one-liner. It never mentions `cbGraph`,
`transportRel`, a sector source or a switch image. The docstring's "The literal '8 − γ' preimage count" is struck. The literal
count (for a one-choke `r`-free image `A` of weight `γ`, `#{B ∈ sec : B →_S A} = 8 − γ`) remains open. The ℕ-subtraction in
the statement is safe, because `C.card ≤ 8`.

**A5. "Conditional on `g` alone" is false for the return's own theorem.** `cb8_topRank_eligible_and_weightedHall_of_ratFlow`
takes both `hE` and `g`. The TERMINAL gate line and step 6 say "conditional on `g` alone", yet the theorem never imports or
discharges C2-LA1. I checked that the claim can be made true: C2-LA1's terminal `cb8_topRank_parentDescent_and_conjuncts_1_2_3`
has `C5LA1.crossingIndex (cbGraph m) + 2 ≤ (16 * m + 4) / 3` as its third conjunct, textually equal to `hE`. C2-LA1 also carries
all 78 C1-LA2 entries with identical code (differences are in comments only, plus the ruled `theorem→lemma` on entry 78).
**I discharged `hE` in Lean** (see Remaining obligation, critic advance CA-2). The return's own statement still has two
hypotheses.

**A6. Fidelity (weight, relation, selector, first descent, (WID)).** There is no numeric instrument. The weight
`activeWeight` (original support, distinct tags), the relation `transportRel` ((D) ∪ (S), `|N(u) ∩ B| = 2`), the selector
`favorableLeaves (cbGraph m) p*` (derived, not replaced by `leafSet`) and `C5LA1.crossingIndex` are all the carried
definitions of record: byte-identical to C1-LA2, and code-identical to r30's modulo the classical scoping (item 3). The first
descent and `α` enter only through C1-LA2 and C2-LA1. The (WID) duty does not apply, because the seat builds no network and
reports no numbers. There is no fidelity failure.

**A7. Hypotheses encoding the conclusion; rank, class and `m = 107`.** No U1 hypothesis is `WeightedHall` or
`IsSaturatingFlow` literally. It is the equivalent relaxation described in A1. The rank is `(16*m+4)/3` everywhere, and the
next layer is `(16*m+4)/3 + 1`. The class hypotheses `107 ≤ m`, `m % 3 = 2` are present but unused. There are no asymptotics,
no Newton/Darroch step, no fitted law and no `θ*` input. The fresh-row and favorability-index duties (rulings 16 and 17) are
vacuous for this seat.

**A8. Scratch hygiene.** The seat disclosed three `/tmp` heredoc staging files (Stage 3 disclosures index, U1). It says
nothing depends on them. I agree: the replay from `scratchpad/c3-U1/` reproduces the compiled file bit-for-bit
(`4a3f435d…`).

## Mechanism-equivalence and fence check

- Mechanism: the fractional-flow ⇒ Hall ⇒ integral-flow composition, the SEMANTIC-CONTRACT §2 "Composition" paragraph, with
  r30's carried Hall ⇒ flow step. This is not a refuted mechanism: it is not (G′), the all-families compression, CHAR at
  `m = 1`, the `m`-independent per-choke certificate, or forest real-rootedness.
- One rank per tree: yes (`p*` only). Class only: yes, and the class hypotheses are not even used. There is no status transfer
  to any aggregate. No census value is used as proof. The `θ*` law is not a hypothesis. The r30 bounded record is not used.
- Claim identity: no `E993-R31-` key is proposed, so no alias check against the registry is due. The Lean names are a lexical
  near-miss of Cycle 2 U2's `weightedHall_of_ratFlow_bound`, and **mathematically an alias**: they are the same statement
  up to a weaker hypothesis (A2). `cb8ChokeState_le` is mathematically an alias of U2's `chokeBeta_add_chokeGamma_le` (A3). The
  return's grade column ("compiled scratch; no grade") is correct under SOLUTION-CONTRACT §4. `proved_conditional` is correct
  as a route verdict, but the condition is equivalent to the conclusion's hardest conjunct (A1).
- Attribution: the mechanism, weight, relation and (HALL) belong to Codex GPT-6's lower-region run. The Hall ⇒ flow lemma
  belongs to r30 (Hall⇒sign award). The rational Hall step in Out-`≥` form belongs to r31 Cycle 2 seat U2. U1's contribution
  is the equality-form variant and the CB instantiation.

## Certification audit

| Literal in the return / artifact | Evidence | Ruling |
|---|---|---|
| "sorry-free", axioms `[propext, Classical.choice, Quot.sound]` (5 declarations) | my rebuild and `#print axioms` | backed |
| "`lake build LeanProof` and `lake env lean` exit 0, two linter warnings" | my rebuild | backed |
| carries "byte-identical" (C1-LA1 1–33, C1-LA2 1–78, r30 30–31) | `carry_check.py` | backed; ruling-19 terminal keyword edit missing |
| "C1-LA2 already carries byte-identical definitions" (r30 entries 1–29, 32+) | `defs_check.py`: entries 14–21 differ (scoping, docstrings) | **struck**; replace with "code-identical modulo classical scoping; re-kernel-checked here" |
| `Main.lean` line 12 "sha256 f0578ed7…e7f2a3b4 … full digest recorded in RETURN.md" | true digest `f0578ed7ce7f51f695d4…`; RETURN has a 16-hex prefix only | **struck** (fabricated 48 hex digits) |
| "conjunct 4's formal obstruction is now reduced … to exactly one hypothesis" | `ratFlow_iff_saturatingFlow` | **narrowed**: the hypothesis is equivalent to conjunct 4 |
| "the full four-conjunct … terminal, conditional on `g` alone" | the theorem takes `hE` and `g` | **struck** for the return's theorem; made true by critic advance CA-2 |
| "The rational-to-integral step is CLOSED, generically, by this file" | Cycle 2 U2 Part A predates it, in the stronger `≥` form | **narrowed**: a weaker duplicate |
| `cb8_switch_preimage_count` "literal 8 − γ preimage count" | the statement is about `Fin 8` complements only | **struck** "literal" |
| `weightedHall_of_ratFlow` "strict generalization of r30's `weightedHall_of_saturatingFlow`" | the casting argument in my `ratFlow_iff_saturatingFlow` | backed (it generalizes r30 entry 33), but it is itself subsumed by Cycle 2 U2 Part A |
| Stage 2 seal and six source digests | recomputed | backed |

## Verdict

verdict: retained_narrowed
headline_resolved: no

COND4_formal: not_advanced
E1_formal: not_advanced
TERMINAL_integration: advanced
cut_candidate: none

Every U1 declaration compiles, is sorry-free and uses only the standard three axioms. The mathematics of each is correct, and I
grade `weightedHall_of_ratFlow` `proved_informal` as a statement (any compiled scratch has no grade until a funded award adopts
it). What is retained, narrowed:
1. The rational Hall step, as a special case of the Cycle 2 U2 Part A lemma. The Out-`≥` form should be the one carried.
2. The CB instantiation `cb8_conjunct4_of_ratFlow`, understood as "conjunct 4 ⇔ fractional saturating flow" and not as a
   reduction.
3. `cb8ChokeState_le`, as a re-derivation of Cycle 2 U2's `chokeBeta_add_chokeGamma_le`.
4. `cb8_switch_preimage_count`, as an abstract counting fact only.

`COND4_formal: not_advanced` because the return's COND4 content already exists in the Cycle 2 scratch record; my literal switch
lemma CA-3 is a small critic-derived node and does not change that. `TERMINAL_integration: advanced` is the critic's merged
theorem CA-2, not the return's two-hypothesis theorem. No cut is proposed or implied.

## Remaining obligation

Critic-derived advances (attributed to critic C-U1-T, Claude Opus 5.5; compiled scratch, no grade):
- **CA-1** (`LeanProof/Critic.lean`). This file contains three results:
  - `ratHall_ge`: the rational Hall step in Out-`≥`/layer-sum form.
  - `weightedHall_of_ratFlow'`: U1's lemma derived from `ratHall_ge`.
  - `ratFlow_iff_saturatingFlow`: U1's hypothesis ⇔ `∃ f, IsSaturatingFlow`, generic.

  All sorry-free, axioms `[propext, Classical.choice, Quot.sound]`.
- **CA-2** (`LeanProof/Merge.lean`, 11818 lines). The file is the governed C2-LA1 `Main.lean` byte-identically
  (`986b525702a5…`, checked as an exact prefix), then r30 entries 30–31 byte-identically, then the new
  `E993Transport.cb8_topRank_of_ratFlow`. **That theorem gives the full SOLUTION-CONTRACT §2 four-conjunct terminal from ONE
  hypothesis:** a nonnegative `ℚ`-valued `g` on the literal `cbGraph m` at `p*` with `¬transportRel ⇒ g = 0`, Out
  `w(B) ≤ Σ_{A∈I_{p*}} g B A` and In `Σ_{B∈I_{p*+1}} g B A ≤ w(A)`, where `w = activeWeight (cbGraph m) (favorableLeaves
  (cbGraph m) p*)`. Conjunct 2 is discharged by `(cb8_topRank_parentDescent_and_conjuncts_1_2_3 m hm hmod).2.2.1`. There is no
  `hE` and no row scaling. It compiles (exit 0, 10 min 50 s wall, warnings only, all inherited from C2-LA1), and
  `#print axioms cb8_topRank_of_ratFlow` gives `[propext, Classical.choice, Quot.sound]`.
- **CA-3** (`Critic.lean`, `cb8_switch_transportRel`). Suppose `r ∈ B`, `b_{ij} ∈ B`, no other support of choke `i` is in `B`,
  and `u_i ∉ B`. Then `transportRel (cbGraph m) B (insert u_i (B \ N(u_i)))` holds via the (S) disjunct, with
  `N(u_i) ∩ B = {r, b_ij}` proved from the carried `mem_neighborFinset_choke_iff`. This is the first literal clause of the
  sector Switch bridge. Sorry-free, axioms clean.

Exact open obligation for conjunct 4, and hence decisive event (a): construct `g = g_E1 + g_sec` on the literal network and
prove CA-2's three clauses. These are:
- (a) support on `transportRel`, including CA-3's switch arcs and the deletion arcs;
- (b) Out-`≥`: E1 rows saturate every non-sector source, and the sector rows (C1-LA1 `cb8Out ≥ 1`, read through Cycle 2 U2's
  `chokeState : Fin m → State8` and its leg-count identity) cover every sector source;
- (c) In-`≤` on every target class. In-sector targets use C1-LA1 `cb8In`. Switch images take E1's `ρ_1 γ` plus
  `(8 − γ)·σ(γ)`, which needs the **literal** preimage count, still open (A4). One-choke non-images, targets with `q ≥ 2` and
  weight-zero targets receive E1 only or nothing.

Before any award adopts this material, carry the Out-`≥` form (Cycle 2 U2 Part A or CA-1), not the equality form, and apply
the ruling-19 `theorem → lemma` edit to carried terminals.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-U1-T/`
(stdlib Python only; no network; no installs):
- `LeanProject/` — copy-out of `scratchpad/c3-U1/LeanProject` (`lakefile.toml`, `lake-manifest.json`, `lean-toolchain`,
  `LeanProof.lean`), with `.lake/packages` symlinked by hand to the pinned shared Mathlib.
  - `LeanProof/Main.lean` `4a3f435d92017b5d1eb00da168be233f215fec6bb706629fd846ff57ac4671a2` (U1's file, unmodified).
  - `LeanProof/Critic.lean` `396315cc96343da6ed4e159bff25120ce5aad38dbea4642287e154c2b08faf6f` (CA-1, CA-3; `#print axioms` for all U1 and critic declarations).
  - `LeanProof/Merge.lean` `14e39b7a96073470d86fd948af414c819cf1851ae95a5ffa488e221af0b141b3` (CA-2).
- `build1.out` `72a2bddea27b208c17d24bc733e923a84e2eeb157218e773d1c58e5f55197984` (U1 rebuild); `build2.out` (library build).
- `critic3.out` `3e601e413a3338ebb5e3453119eec6b842a9649345015934f474bec1dd1fb480` (Critic.lean compile and axioms);
  `critic1.out` and `critic2.out` (earlier failing attempts, kept).
- `merge1.out` `4ce0ee34f69c066afd6a6092200cec03bafa5cf76973354910cabeab362366f1` (Merge.lean compile and axioms).
- `carry_check.py` `24e791bf79fda13338508fbd2107e5a4699fbf8427e62d47a367d97f64a2f12b`; `defs_check.py`
  `e5ce6348d570482aa981dc88a8fb78c9163b79e051384ca3d5c9fa236247f447`; `defs_diff.py`
  `7d7fcabeb345f2b7466845bf23e57e7d17576ecfbc15fb52790960579c577d6d`.
- `verify_stage2_seal.py`, `verify_source_digests.py` — copies of U1's generators, replayed (all `True`).

Replay: `cd <scratch>/LeanProject && lake build LeanProof && lake env lean LeanProof/Critic.lean && lake env lean LeanProof/Merge.lean`.

Background jobs: the one background compile (`Merge.lean`) finished with exit 0 before this write. No lean/lake process of this
critic remains, confirmed by a process listing. No kill was needed.
