# Informal Proof — C6-LA5: `U-AWARD-CARD5-JOINT-BUDGET-CELLS` + `U-AWARD-CARD5-COVER-CATALAN-BOUND`

Cycle 6 Stage 7, dispatch 5, the card-5 project. Governed run
`lean-2026-09-22-c6-card5-cells-and-cover-catalan`, **repair 1**, child run
root `lean-2026-09-22-c6-card5-cells-and-cover-catalan-repair-1`. Terminal
declaration: `Erdos993G1.ThirdWide.card5_cells_and_cover_catalan_award`.

## 0. Boot acknowledgment

Booted this session by reading exactly `verity.md`,
`identity/startup-protocol.md`, and `skills/lean-proof-workflow/skill.md` —
the three files the brief names as the sole authorized boot reads. No other
VerityOS subsystem file was read. Repair 1 continues under the same boot;
no new VerityOS file was read to perform it.

## 1. Definitions (exactly as the compiled sources state them)

All from `SEMANTIC-CONTRACT.md`, quoted verbatim from the frozen G1 source
(`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean`,
SHA-256 `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`):

```lean
noncomputable def Erdos993G1.indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)
noncomputable def Erdos993G1.coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0
noncomputable def Erdos993G1.delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k
def Erdos993G1.FirstWide.binomCoeff (n : ℕ) (k : ℤ) : ℤ :=
  if 0 ≤ k then (n.choose k.toNat : ℤ) else 0
```

`indepCount` counts actual independent `k`-subsets; `coeff` is the integer
zero-extension of `indepCount` (zero at negative index); `delta F k = coeff
F (k+1) - coeff F k`, the object every cell and the catalan-bound conclusion
is stated about, at an **integer** index. `binomCoeff` is the integer
zero-extended binomial coefficient (zero when `k < 0`, using `Nat.choose`
otherwise).

This seat's own new definitions:

```lean
def Erdos993G1.ThirdWide.fSingleton (n k d : ℕ) : ℤ :=
  Erdos993G1.FirstWide.binomCoeff (n - d) (k : ℤ) - Erdos993G1.FirstWide.binomCoeff (n - d) ((k : ℤ) - 1)
```

`fSingleton n k d` is the exact cover-fiber term at a singleton cover vertex
of cross-degree `d`, non-cover order `n`, rank `k`. ENTRY 174
(`cover_singleton_available`) makes `avail({a}) = n - crossdeg(a)` an
identity, so the actual singleton-fiber term equals `fSingleton n k
(crossdeg a)` exactly.

## 2. The two award statements (exact compiled forms; governing text)

**Statement (a), FIXED-CELL** (`Erdos993G1.ThirdWide.cell_9/11/13/15/17`, one
per `(r,k,order) ∈ {(2,1,9),(3,2,11),(4,3,13),(5,4,15),(6,5,17)}`):

```lean
theorem cell_9 (F : SimpleGraph X) [DecidableRel F.Adj] (hF : F.IsAcyclic)
    (hcard : Fintype.card X = 9) (C0 : Finset X) (hC0 : C0.card ≤ 5)
    (hcover0 : ∀ x y, F.Adj x y → x ∈ C0 ∨ y ∈ C0) :
    (9 : ℤ) ≤ delta F (1 : ℤ)
-- cell_11 / cell_13 / cell_15 / cell_17: identical shape at
-- order 11/13/15/17, C0.card ≤ 5, conclusion (5/9/21/42 : ℤ) ≤ delta F (2/3/4/5 : ℤ)
```

**Statement (b), parameterized in `(n,k)`**
(`Erdos993G1.ThirdWide.cover_catalan_bound_five`, registry key
`E993-R25-CARD5-COVER-CATALAN-BOUND`):

```lean
theorem cover_catalan_bound_five (F : SimpleGraph X) [DecidableRel F.Adj] (C : Finset X)
    (hC : C.card = 5) (hcover : ∀ x y, F.Adj x y → x ∈ C ∨ y ∈ C)
    (n k : ℕ) (hn : Fintype.card X = n+5) :
    (n.choose (k+1) : ℤ) - n.choose k -
      5*(if 1 ≤ k then (catalan (k-1) : ℤ) else 0) -
      10*(if 2 ≤ k then (catalan (k-2) : ℤ) else 0) -
      10*(if 3 ≤ k then (catalan (k-3) : ℤ) else 0) -
      5*(if 4 ≤ k then (catalan (k-4) : ℤ) else 0) -
      (if 5 ≤ k then (catalan (k-5) : ℤ) else 0) ≤ delta F (k : ℤ)
```

**unconditional** — no `hfloor` hypothesis (contrast the fallback conditional
form C-U3-T also proved independently, `scratchpad/c6-crit-U3-T/CriticGamma5.lean`,
not used here because C-U3-F's unconditional form is the object of record
per the U adjudication and synthesis).

The terminal declaration `card5_cells_and_cover_catalan_award` binds these
six conjuncts (five cells + the catalan bound) as ONE theorem, universe-
polymorphic in the single shared universe `u` of `{X : Type u}`. The
conjunction elaborated and compiled directly (no fallback needed); its
statement text is unchanged by repair 1 (SHA-256
`cee46ec8164f9bda5912ab51b66f0568e1844e2c40ee97631d2d996e596f09ff`, identical
to the parent run — repair 1 touches only the transcription of ENTRY 174,
not the terminal statement). See `LeanProject/LeanProof/Main.lean`, entry 52.

**Alias, in full (repair 1(3)):** statement (a) is the Lean formalisation, at
the stated five ranks, of the registered VERIFIED
**`E993-R25-CARD5-JOINT-BUDGET-CELLS`** (`proved_informal → formally_verified`,
a grade change, not a new claim); also naming
**`E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY`** (OPEN, the uniform-in-`d`
schema of which these cells are `d = 5` instances) and
**`E993-GRAPH-VERTEX-COVER-DELTA-PARTITION`** (the cover-fiber partition the
whole assembly rests on). Statement (b) takes the controller-assigned new
key **`E993-R25-CARD5-COVER-CATALAN-BOUND`**.

## 3. Hypotheses and where each enters

- **`F.IsAcyclic`** — enters at exactly **one** declaration in the whole
  development, `budget_bound` (registered entry 33), via the ENTRY 172 +
  58/59 chain (`cover_cross_edges_le`, `forest_card_edges_add_components`,
  `components_card_pos_of_card_pos`). Every other lemma is stated for an
  arbitrary `SimpleGraph X`. `cover_catalan_bound_five`'s own proof does not
  use acyclicity directly; it is built on `cover_rank_bound_five`, which
  likewise carries no acyclicity hypothesis — the catalan bound holds for
  an **arbitrary** graph with a card-5 cover, not only forests.
- **`Fintype.card X = <order>`** (statement (a)) / **`Fintype.card X = n+5`**
  (statement (b)) — fixes the ambient order; for (a) a concrete numeral, for
  (b) parameterized by `n`.
- **`C0.card ≤ 5` + the covering property** (statement (a)) — this is
  `τ(F) ≤ 5` stated directly (not a card-5 surrogate): `∀ C0, C0.card ≤ 5 →
  cover → …` is logically `(∃ C0, C0.card ≤ 5 ∧ cover) → …`. The padding to
  a cover of cardinality **exactly** 5 is proved, not assumed, by
  `exists_card_five_cover` (registered entry 27) via
  `Finset.exists_superset_card_eq`.
- **`C.card = 5` + the covering property** (statement (b)) — already exactly
  5, no padding needed (statement (b) is stated directly for a card-5 cover).
- **`x(F) < r`** — never a hypothesis anywhere in this development. Every
  theorem proves an unconditional `Δ_k` lower bound; `x(F) ≥ r` would follow
  as a corollary at that specific cell, never the reverse.
- **`ν(F)`** — never enters. König is never invoked.

## 4. Proof, node by node (dependency DAG; every node's status: compiled and
kernel-checked in `LeanProject/LeanProof/Main.lean`)

```
Mathlib (pinned 905b95818eb32af7874a58b427f50c1711a5e96c)
 ├─ Erdos993G1.indepCount, .coeff, .delta                         [def, entries 1-3]
 ├─ Erdos993G1.FirstWide.binomCoeff                                [def, entry 4]
 ├─ Erdos993G1.ThirdWide.fSingleton                                [def, entry 5]
 ├─ FirstWide.binomCoeff_nat/_neg/_nat_add_one,
 │  choose_step_strict/choose_step_nonpos (frozen ENTRIES 82,83,84,86,87) [entries 6-10]
 ├─ Erdos993G1.indepCount_eq_card_indepSetFinset/.coeff_nat/.delta_nat,
 │  forest_card_edges_add_components, components_card_pos_of_card_pos
 │  (frozen ENTRIES 17,23,25,58,59)                                [entries 11-15]
 ├─ ThirdWide.cover_fiber_count/.cover_indepCount_partition/
 │  .cover_delta_partition/.cover_sum_bound/.cover_cross_edges_le
 │  (frozen ENTRIES 165-168, 172)                                  [entries 16-20]
 ├─ ThirdWide.cover_singleton_available (frozen ENTRY 174,
 │  spans frozen lines 3743-3765; body content line
 │  `simp only [mem_singleton,forall_eq]` REPAIRED in repair 1 to
 │  carry the frozen source's own trailing space, verified
 │  byte-for-byte -- see §5)                                       [entry 21]
 ├─ ThirdWide.cover_available_empty (frozen ENTRY 178,
 │  spans frozen lines 3844-3861)                                  [entry 22]
 ├─ powerset_five_sum, cover_rank_bound_five (RENAMED, done first),
 │  cover_five_sparse_vertex                                       [entries 23-25]
 ├─ avail_le, exists_card_five_cover (padding lemma)                [entries 26-27]
 ├─ joint_cert (Fin 5 reference form), sum_powersetCard_one_eq      [entries 28-29]
 ├─ cover_rank_bound_five_singletons (the joint singleton refinement) [entry 30]
 ├─ joint_cert_finset, crossdeg_le                                  [entries 31-32]
 ├─ budget_bound  <-- THE SOLE POINT WHERE ACYCLICITY ENTERS        [entry 33]
 ├─ cell_bound (generic per-cell closer)                            [entry 34]
 ├─ cell_9, cell_11, cell_13, cell_15, cell_17                      [entries 35-39]
 ├─ binomDelta_pascal/_step_up/_step_down/_mono_center/_mono/
 │  _antitone/_central/_floor (frozen ENTRIES 136-143)              [entries 40-47]
 ├─ binom_shift_floor (frozen ENTRY 177)                            [entry 48]
 ├─ cover_catalan_bound_five                                        [entry 49]
 ├─ catalan_recurrence_int (frozen ENTRY 147)                       [entry 50]
 ├─ catalan_gap5_identity (the ENTRY-148 card-5 analogue; carried
 │  as a supporting lemma, NOT a conjunct of the terminal theorem)  [entry 51]
 └─ card5_cells_and_cover_catalan_award (TERMINAL, entries 35-39 + 49) [entry 52]
```

No open node. Every entry above is registered, compiled, and kernel-checked
in this repair run (`RECEIPTS/kernel-verification.json`,
`verdict.verified: true`). `#print axioms` on all 52 named declarations:
`EVIDENCE/axioms-all-52-declarations.txt`, every one within
`[propext, Classical.choice, Quot.sound]` (two — `FirstWide.binomCoeff`,
`fSingleton` — depend on no axioms at all, being plain `def`s). Identical
axiom footprint to the parent run at all 52 declarations; only entry 21's
own registrar fragment digest changed (see §5).

`catalan_gap5_pos` (`Γ(5,k) > 0` for `k ≥ 6`) is **deliberately not
registered** in this run: it is an instance of the already **formally
verified** `E993-R25-CATALAN-GAP-MONOTONE-RATIO` at `τ = 5`, and the
mandatory disclosure below forbids registering it as new. `catalan_gap5_identity`
IS carried (as a supporting lemma, compiled and axiom-clean), matching the
synthesis's own framing ("together with the card-5 ENTRY-148 analogue
`catalan_gap5_identity`"), but it is **not** a conjunct of the terminal
theorem — the terminal theorem binds exactly the six parts the brief's §2
names (the five cells and `cover_catalan_bound_five`).

## 5. Transcription and byte-fidelity (repair 1; this section supersedes the
parent run's §5, which the fidelity reviewer found FALSE — see below)

**The reviewer's finding (accurate, adopted in full).** Frozen line 3761 of
`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean` is
`  simp only [mem_singleton,forall_eq] ` **with a trailing space**. The
parent run's registered entry 21 (`cover_singleton_available`, frozen
ENTRY 174, frozen span lines **3743–3765**) — despite the parent run's
`Main.lean` comment, `INFORMAL-PROOF.md` §4/§5, and `FORMALIZER-REPORT.md`
all asserting the byte had been restored — in fact **dropped** the trailing
space: the parent run's `LeanProject/LeanProof/Main.lean` had **no
trailing-whitespace line anywhere** (confirmed by the fidelity reviewer and
independently re-confirmed here by grepping the parent's built `Main.lean`
before any repair-1 edit was made). The claimed restoration did not
happen; the written record was false. **This was a good-faith drafting
error** (the trailing space was almost certainly lost when the parent run's
draft file was composed through this seat's file-writing tool, which
appears to have stripped it, contrary to the deliberate intent recorded in
the comment) **— it was not noticed before the parent report was written,
and the report's own claim was therefore false, not merely imprecise.**

**Repair applied.** The byte is **restored**, not merely disclosed as a
deviation (the brief's repair rule offered either option; restoration is
what is done here — this section does not also claim the deviation was
"stated instead"). Registered entry 21's source fragment
(`DRAFTS/fragments/021-lemma-Erdos993G1_ThirdWide_cover_singleton_available.lean`)
now contains `  simp only [mem_singleton,forall_eq] ` with the trailing
space present, and this was verified **byte-for-byte**, three ways, by
`EVIDENCE/verify_frozen_entry_tags.py` (imports: `hashlib, re` — standard
library only; output `EVIDENCE/verify_frozen_entry_tags_output.txt`):

1. the frozen source's own line 3761 has the trailing space (re-confirmed
   fresh, independent of the reviewer's report);
2. this run's `DRAFTS/fragments/021-…lean` source fragment's corresponding
   line is now byte-identical to frozen line 3761;
3. the registrar-built `LeanProject/LeanProof/Main.lean`'s corresponding
   line (inside registered entry 21, which the kernel actually compiled) is
   also byte-identical to frozen line 3761.

**What "byte-identical" does and does not mean here.** The one **content**
line the fidelity reviewer flagged is now byte-identical to the frozen
source. The **scaffolding** around it (this run groups
`cover_singleton_available` under this file's shared
`namespace Erdos993G1.ThirdWide … open Finset … variable {X …}` block,
opened once at registered entry 16 and closed at the terminal theorem,
rather than the frozen source's own per-entry `namespace … open … end`
wrapping around ENTRY 174 individually) is **unchanged** from the parent
run and is **not** claimed to be byte-identical — that scaffolding
difference was already disclosed in the parent run and both Cycle 6
critiques (C-U3-T finding F4, C-U3-F item 2) already ruled it semantically
inert; repair 1 does not revisit it and does not claim it is now
byte-identical either. **Do not read this section as claiming full-body
byte identity including scaffolding — only the one flagged content line is
claimed, and that claim is now true and independently verified.**

**The digest claim, corrected.** The parent run's §5 stated: "verified
independently before registration … confirming `sha256(frozen_body + "\n")`
recomputes to the frozen tag digest `5077d1d2…` for that span once the byte
is restored." **This was also false and is retracted, not repeated.**
Registered entry 21's own digest is the **registrar's fragment digest**
(computed over this run's transcription, scaffolding included/excluded as
this run structures it — not over the frozen source's own tagged span):
in this repair run, `f72c64b6534ede23e1ec198087f52887b121e91f3e84ad0ccf0b53bd642010b9`
(see `LeanProject/LeanProof/Main.lean`, the `VERITYOS ENTRY 21 BEGIN` line).
Frozen identity — i.e. that this content really does trace to frozen ENTRY
174 and not a different or mislabeled entry — is carried instead by the
**source copy**: `EVIDENCE/originating-sources/frozen-g1-thirdwide-main.lean`
is a byte-for-byte copy of the frozen file (SHA-256
`aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`, matching
the digest named in the C6-LA5 capsule and `CAPSULE-VERIFICATION.json`), and
`EVIDENCE/verify_frozen_entry_tags.py` independently recomputes the frozen
tag digest `5077d1d2…` **from that copy's own ENTRY 174 span** and confirms
it is authentic (i.e., correctly labeled, not swapped with another entry) —
it does **not** and could not recompute over the registrar's differently-
scaffolded fragment. The registrar's fragment digest and the frozen tag
digest are two different, non-comparable objects; the parent run's report
conflated them.

**Provenance, not claimed evidence.** The parent run's `INFORMAL-PROOF.md`
§5 cited a check at a path under `/private/tmp/…` as evidence. **That
citation is removed and not repeated here** — nothing under `/tmp` is
evidence of anything this run can stand behind (it is outside every run
root, unauditable, and not preserved). The equivalent check now lives,
in full, under this run's own `EVIDENCE/verify_frozen_entry_tags.py`, with
its output saved at `EVIDENCE/verify_frozen_entry_tags_output.txt`, exactly
as required.

**Other declarations' transcription, unaffected.** Every other transcribed
entry (1,2,3,14,17,23,25,58,59,82,83,84,86,87,136-143,165-168,172,177,178)
is unchanged from the parent run; `EVIDENCE/verify_frozen_entry_tags.py`
independently re-verifies all 30 of the frozen tag digests this run's
provenance cites — every one authentic (matches the frozen source's own
same-numbered tag), confirming no entry is mislabeled or swapped anywhere
in this project, before and after the repair.

## 6. Attribution (condition (i), on the award's face)

- **Seat U3** (Cycle 6 Stage 3, route `U-C6-03 CARD5-COVER-ASSEMBLY`): the
  cells' Lean assembly (`cover_rank_bound_five_singletons`, `cell_bound`,
  `cell_9..cell_17`, `avail_le`, `budget_bound`, `crossdeg_le`,
  `joint_cert_finset`) and the padding lemma (`exists_card_five_cover`).
- **Critic-derived in Cycle 5** (credited by both Cycle 6 critiques and the
  U adjudication): the LP-dual certificate `f(d) ≥ 42 − 14d` and the finding
  that the joint-singleton-refinement method reaches all five registered
  small-rank cells, not only the two chartered ones.
- **C-U3-F** (Cycle 6 Stage 4 critique, orientation F): the unconditional
  `cover_catalan_bound_five` and the ENTRY 136–143 + `FirstWide` 84/86/87 +
  177 transcription closure it rests on (this run's registered entries
  6–10, 40–48 reproduce that closure); **and, on the falsifying side, the
  fidelity-review finding this repair discharges** (the ENTRY-174
  trailing-space byte the parent run falsely claimed to have restored).
- **C-U3-T** (Cycle 6 Stage 4 critique, orientation T): independently, the
  card-5 `catalan_gap5_identity`/`catalan_gap_five_pos` and a
  **conditional** form of the catalan bound (carrying an `hfloor`
  hypothesis) — not the object of record here; C-U3-F's unconditional form
  is used, per the U adjudication's ruling ("C-U3-T's stated seven-entry
  residue is discharged by C-U3-F… the unconditional form is the object of
  record").
- **Formalizer** (this run, `c6-la5-formalizer-sonnet-20260922`): re-derivation
  fragment by fragment from the frozen/critic sources into a fresh, governed,
  single terminal-theorem project; the universe-polymorphic six-conjunct
  terminal statement; the independent tag-digest verification and (in
  repair 1) the corrected, verified byte-restoration; the exact-integer
  evidence generator (`EVIDENCE/generate_card5_evidence.py`).

## 7. Scope exclusions (condition (ii), on the award's face)

- Statement (a) is **FIXED-CELL** — one `(r,k,order)` triple each, **not**
  uniform in `d`, in the order, or in `r`.
- Statement (b) is **parameterized** in `(n,k)` but is a bound on
  `delta F (k:ℤ)` for an **arbitrary** graph with a card-5 cover — it does
  not by itself establish any forest-specific or `d`-uniform statement.
- `x(F) < r` is **never** a hypothesis anywhere in this award group.
- **`cell_9`'s registered positivity content is already frozen ENTRY 175**
  (`forest_delta_one_pos`: `0 < delta F 1` for every finite forest of order
  `≥ 6`, unconditionally, no cover hypothesis, no fixed order) —
  **the delivered novelty is FOUR cells, not five.** `cell_9` itself is a
  numerically stronger (but strictly narrower-domain) re-derivation at the
  single order 9, still compiled and registered here for completeness of
  the registered claim's finite scope, but it does not add new positivity
  content beyond what ENTRY 175 already establishes more generally.
- **The cover hypothesis is VACUOUS at orders 9 and 11.** For any forest,
  `τ(F) = ν(F) ≤ ⌊|V|/2⌋` (König, bipartite), so `τ ≤ 4` at order 9 and
  `τ ≤ 5` at order 11 automatically. `cell_9` and `cell_11` are therefore
  unconditional order-9/order-11 forest statements wearing a decorative
  cover hypothesis; the hypothesis is cover-**essential** only at orders 13,
  15, 17 (and genuinely essential, in the sense of excluding real
  counterexamples, only at 15 and 17 per the registry's `cycle4_note`).
- **`catalan_gap5_pos` (`Γ(5,k) > 0` for `k ≥ 6`) is an instance of the
  already formally verified `E993-R25-CATALAN-GAP-MONOTONE-RATIO` at
  `τ = 5` and is NOT new** — it is not registered in this run.
- The group is **never** `c(d) = min(d,5)` in Lean and **never** a tier
  statement.
- This group does **not** discharge `E993-R25-COVER-THRESHOLD-MIN-D-5-FOREST`:
  each `cell_n` proves **one** rank (`k = r−1`), while that registered claim
  asks for `Δ_k(F) > 0` at **every** `k < r`. **No Lean object in this run
  discharges the lower ranks.**
- The bounds are **far from sharp** at four of five cells: the true minima
  over each cell's admissible forest population are `19 / 39 / 56 / 56 / 43`
  against the proved `9 / 5 / 9 / 21 / 42` (Cycle 6 critic C-U3-F's
  exhaustive enumeration, confirmed by the U adjudicator); only order 17 is
  essentially sharp (slack 1).
- The population figure is **3,073** at order 13 (the `τ ≤ 5` population),
  **not** 3,658 (the TOTAL order-13 forest isomorphism-class count,
  A005195(13)) — the adjudication's own finding (item 4 of the U3 route
  decision), corrected here rather than repeated.
- The gate's "(13 vertices, `τ = 5`, `Δ₃ = −8`)" figure is a **witness**
  value, not a cell minimum; `τ = 5` general graphs at `Δ₃ = −9` and `−10`
  exist (C-U3-F finding F5).
- **Frozen line spans (repair 1(4), independently re-verified against
  `sources/g1/` before writing, `EVIDENCE/verify_frozen_entry_tags_output.txt`):**
  ENTRY 174 (`cover_singleton_available`) spans frozen lines **3743–3765**
  (BEGIN tag at 3743, END tag at 3765); ENTRY 178 (`cover_available_empty`)
  spans frozen lines **3844–3861** (BEGIN tag at 3844, END tag at 3861).
- **Alias, in full:** statement (a) is the Lean formalisation, at the stated
  five ranks, of the registered VERIFIED `E993-R25-CARD5-JOINT-BUDGET-CELLS`
  (`proved_informal → formally_verified`, a **grade change**, not a new
  claim), also naming `E993-R25-COVER-BRANCH-UNIFORM-PREHISTORY` (OPEN, the
  uniform-in-`d` schema of which these cells are `d = 5` instances) and
  `E993-GRAPH-VERTEX-COVER-DELTA-PARTITION` (the cover-fiber partition the
  whole assembly rests on). Statement (b) takes the controller-assigned new
  key `E993-R25-CARD5-COVER-CATALAN-BOUND`.

## 8. What this run does NOT claim

No claim of mathematical truth, novelty, or publication readiness beyond
the exact audited contract. No claim about Tier 1, Tier 2, the `d = 5`
matching half, or any FOREST/TREE/TRANSFER/Erdős #993 statement. No
`sorry`, `admit`, `native_decide`, or axiom beyond `propext`,
`Classical.choice`, `Quot.sound` anywhere in this project (verified by
`grep` and by `#print axioms` on every registered declaration). Bounded
repair limit 2; **1 of 2 used** (this repair). No claim that this repair's
`EVIDENCE/verify_frozen_entry_tags.py` or `generate_card5_evidence.py`
constitute the independent fidelity review — that review remains the
controller's to obtain; this repair only corrects this run's own false
prose against a fidelity reviewer's finding on the same object.
