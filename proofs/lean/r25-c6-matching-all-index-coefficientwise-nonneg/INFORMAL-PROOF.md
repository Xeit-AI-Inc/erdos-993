# Informal proof — `ErdosR25.E1CoeffWise.Nj_nonneg_all_index`

Award group `C6-LA3` (`U-AWARD-MATCHING-ALL-INDEX-COEFFICIENTWISE`, **clause
(a) only** of `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`), the TERMINAL
Stage 7 dispatch of Cycle 6 (the charter's last cycle). Run
`erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`. Formalizer
seat: Claude Sonnet 5 (chartered effort `xhigh`; the Agent transport exposes
no effort parameter and this seat cannot self-inspect its runtime
model/effort — stated on dispatch-record authority). Governed run root
`runs/lean-2026-09-22-c6-matching-all-index-coefficientwise`.

This is a **faithful governed transcription** of already kernel-checked
material, re-elaborated and re-verified fragment by fragment in this
project's own pinned Lake project against pinned Mathlib alone. No new
mathematics is derived. The digest-bound sources are: seat U1's
`scratchpad/c6-U1/LeanProject/U1CoeffWise/Main.lean` (the apparatus and the
`j = m` assembly); the sixth award's checked `Main.lean`, imported
byte-identically as `scratchpad/c6-U1/LeanProject/U1CoeffWise/ScalarCoreImport.lean`;
and critic C-U1-F's `scratchpad/c6-crit-U1-F-replay/LeanProject/U1CoeffWise/CriticF.lean`
(PRIMARY source for the general-`j` lift, since its declarations are in the
same namespace and under the same names the synthesis and this brief bind
the terminal declaration to). Critic C-U1-T's independent
`scratchpad/c6-crit-U1-T/LeanProject/U1CoeffWise/CriticGeneralJ.lean` reaches
the identical general-`j` result by an independent proof in a different
namespace (`ErdosR25.E1CoeffWiseCriticT`); it is not registered in this
project (its content does not bind the required terminal declaration name),
but its independent, separately kernel-verified existence is why the
general-`j` lift is attributed jointly to both critics (condition (i) below).

## 1. Definitions, exactly as the compiled sources state them

`A_i(t)`, `B_i(t)` as `Polynomial ℤ`-valued objects (seat U1):

```lean
noncomputable def Afac (K i : ℕ) : Polynomial ℤ :=
  ∏ l ∈ Finset.range i, (X + C ((K : ℤ) + 1 - (l : ℤ)))

noncomputable def Bfac (j i : ℕ) : Polynomial ℤ :=
  ∏ l ∈ Finset.Ico (i + 1) (j + 1), (X + C (l : ℤ))
```

Hardness and the reflection partner (seat U1):

```lean
def IsHard (K i : ℕ) : Prop := K + 1 < 2 * i
def partner (K i : ℕ) : ℕ := K + 1 - i
```

The weight and the raw summand, and `N_j` itself (seat U1; the `j!` — more
precisely `(j+1)!` at index `j`, see §7 below — common factor of the informal
`W_i` dropped, a positive constant irrelevant to sign):

```lean
def Wcoef (m i : ℕ) : ℕ := 2 ^ i * Nat.choose m i

noncomputable def NjTerm (K m j i : ℕ) : Polynomial ℤ :=
  (((K : ℤ) + 1 - 2 * (i : ℤ)) * (Wcoef m i : ℤ)) • (Afac K i * Bfac j i)

noncomputable def Nj (K m j : ℕ) : Polynomial ℤ :=
  ∑ i ∈ Finset.range (j + 1), NjTerm K m j i
```

Coefficientwise nonnegativity of a `Polynomial ℤ` (seat U1; **RENAMED per
mandatory repair (1)**, see §2):

```lean
def CoeffNonneg (p : Polynomial ℤ) : Prop := ∀ n, 0 ≤ p.coeff n
```

`m` is the matching size, `d = 2m − K` the excess, both numerals in the
sense of `SOLUTION-CONTRACT.md`'s Tier language (arbitrary naturals, not
fixed constants). No `SimpleGraph`, `indepCount`, `delta`, or `firstDescent`
occurs **as Lean code** anywhere in this project (see §6 for the precise
`grep` accounting, including the one doc-comment exception).

## 2. Mandatory repair (1): the `Nonneg`/Mathlib collision, and the exact form of the rename

The adjudicator and both Stage 4 critiques record that the seat's
`ErdosR25.E1CoeffWise.Nonneg` and its dot-namespace lemmas
(`Nonneg.add`/`.zero`/`.sum`/`.mul`/`.one`/`.prod`/`.smul`) collide with
Mathlib's own root `Nonneg` namespace (Critique C-U1-T, finding F5:
`apply Nonneg.add` from outside the declaring namespace resolves to
Mathlib's `Nonneg.add : Add {x // 0 ≤ x}` and fails). This project renames
the base predicate `Nonneg → CoeffNonneg` throughout.

The seven dot-namespace lemmas are renamed to **flat, underscore-joined**
names (`CoeffNonneg_add`, `CoeffNonneg_zero`, `CoeffNonneg_sum`,
`CoeffNonneg_mul`, `CoeffNonneg_one`, `CoeffNonneg_prod`, `CoeffNonneg_smul`)
rather than kept as `CoeffNonneg.add` etc. This is a second, disclosed,
purely mechanical deviation from the most literal reading of "e.g.
`CoeffNonneg`": the governed formalization registrar
(`skills/lean-formalization/scripts/prepare_lean_formalization.py`,
`validate_source`) requires the exact text immediately after the
`lemma`/`theorem` keyword to equal the registered declaration's own final
dot-segment (its regex is `^\s*{kind}\s+{leaf}\b`, where `leaf =
name.split(".")[-1]`); a literal head line `lemma CoeffNonneg.add …` has
leaf-candidate text `CoeffNonneg.add`, not `add`, so it cannot be registered
under any name whose final segment is `add`. Flattening to
`CoeffNonneg_add` sidesteps this without reintroducing the Mathlib
collision (no other declaration anywhere in Mathlib or this project is
named `CoeffNonneg_add`) and without nesting a nontrivial nested-namespace
nametree purely to satisfy a tooling regex. Every call site
(`apply Nonneg.add`, `exact Nonneg.mul …`, `Nonneg.prod`, `Nonneg.one`, …) is
renamed identically and mechanically alongside the seven declarations; no
proof term, tactic, or hypothesis changed. `NonnegLinFac`, `NonnegBfacFn`,
`NonnegAfacFn`, `NonnegEasyTerm`, `NonnegPairedBlock` are **not** renamed:
they were never `Nonneg.xxx` dot-namespace members (they are flat
identifiers that merely contain "Nonneg" as a substring), so they do not
collide with Mathlib's `Nonneg` namespace and the adjudicator's repair does
not name them; only their *statements* change (`Nonneg (…) → CoeffNonneg
(…)`) to track the renamed predicate.

## 3. Mandatory repair (2): the `t = r − K` substitution, stated

No Lean identifier in this project, the seat's, or either critic's file
mentions `r`. The registered claim `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`
and its companion `E993-R25-CLAMPED-DUAL-DOMINATION` are stated over the
rank `r`, with `t = r − K` (equivalently `r = t + K`) and the standing
condition `r ≥ m − 1`. The Lean object `Nj K m j` is a formal `Polynomial ℤ`
in an indeterminate `X` (informally `t`); `CoeffNonneg` (coefficientwise
nonnegativity) is a *substitution-free* property, so it implies
`0 ≤ (Nj K m j).eval t` for every integer `t ≥ 0` (a corollary this project
does not formalize — it belongs to clause (b), §6 below), and in particular
at `t = r − K` for every `r ≥ K`. On the chartered region `3d ≤ 2m+2`,
`region_le` gives `m ≤ K + 1`, so `t = r − K ≥ 0` (i.e. `r ≥ K`) already
implies the standing condition `r ≥ m − 1`: the coefficientwise statement,
via this substitution, covers the whole range the dual side needs, with no
further hypothesis. This is exactly the repair the adjudicator and both
Stage 4 critiques name as missing from the return; it is recorded here in
the contract's `informal_statement` and is deliberately **not** encoded as
a Lean identifier (per the adjudication: "no Lean identifier mentions `r`"
is not itself a defect — the substitution is a fact about the *use* of a
substitution-free `Polynomial ℤ` statement, not a further Lean declaration
this award's clause (a) is chartered to produce).

## 4. Proof, node by node

**`Afac_split` / `Bfac_split` / `extra_eq`** (seat U1): splitting `Afac`
and `Bfac` at an intermediate index via `Finset.prod_Ico_consecutive`, and
showing the two "extra factor" blocks produced by a hard/easy split
coincide as polynomials via the reindexing `l ↦ K+1−l`
(`Finset.prod_Ico_reflect`, instantiated at `n := K+1`), with the natural-to-integer
cast `(K:ℤ)+1−(l:ℤ) = ((K+1−l:ℕ):ℤ)` guarded by `l ≤ K+1`.

**`reflection_identity_poly`** (seat U1; **the reflection identity, as a
genuine `Polynomial ℤ` equation**, not merely pointwise-in-`t`): for a
hard/easy pair `i + i' = K+1` with `i' ≤ i ≤ j`, `A_i(t)B_i(t) =
A_{i'}(t)B_{i'}(t)` as polynomials, from `Afac_split`, `Bfac_split`,
`extra_eq` and `ring`.

**`region_le`** (seat U1; **the region fact, derived not assumed**): from
`K + d = 2m` and `3d ≤ 2m+2`, `m ≤ K+1` by `omega` — proved once and used
wherever the pairing needs it, never re-postulated as a side hypothesis.

**`partner_spec`** (seat U1; **the pairing bijection's defining
properties**): for a hard index `i ≤ m`, `partner K i = K+1−i` satisfies
`partner K i < i`, `partner K i ≤ m`, `¬IsHard K (partner K i)`, and
`i + partner K i = K+1` — all four by `omega` from the region fact
(`region_le`) plus hardness. **`partner_injOn`** (seat U1): `partner K` is
injective on hard indices, both bounded by `K+1` (`omega`).

**`term_sign`** (seat U1; **the term-sign lemma**): on a hard/easy pair,
`W_i ≤ W_{i'}`, by algebraically repackaging the imported award's
`PStatement m K i` (never re-derived) via
`Nat.descFactorial_eq_factorial_mul_choose` and
`Nat.descFactorial_mul_descFactorial` — pure bookkeeping, no new arithmetic
content beyond the sixth award.

**`CoeffNonneg_add`/`_zero`/`_sum`/`_mul`/`_one`/`_prod`/`_smul`** (seat U1;
closure lemmas, renamed per §2): each proved directly from
`Polynomial.coeff_add`/`coeff_mul`/`finsetSum_coeff`/`coeff_smul`/`coeff_one`
and `Finset.prod_induction`.

**`NonnegLinFac`/`NonnegBfacFn`/`NonnegAfacFn`** (seat U1): `X + C x` is
`CoeffNonneg` for `x : ℕ`; hence `Bfac j i` is always `CoeffNonneg`, and
`Afac K i` is `CoeffNonneg` whenever `i ≤ K+1`.

**`NonnegEasyTerm`** (seat U1): each unpaired easy term (`i ≤ K+1`, so
`K+1−2i ≥ 0`) is `CoeffNonneg` outright, via `CoeffNonneg_smul`.

**`NonnegPairedBlock`** (seat U1; **the term-sign lemma made polynomial**):
each paired hard/easy block `term(i) + term(i')` collapses, via the
reflection identity, to `(i−i')·(W_{i'}−W_i) • (A_{i'}B_{i'})` — a nonneg
scalar (term-sign lemma) times a `CoeffNonneg` polynomial (`module`/`ring`
bookkeeping plus `CoeffNonneg_smul`/`_mul`).

**`Nj_nonneg`** (seat U1; **the `j = m` assembly**): splitting
`Finset.range(m+1)` into hard/easy
(`Finset.sum_filter_add_sum_filter_not`), the easy part further into "hit
by a partner" and not (`Finset.sum_sdiff`), reindexing the partner-image
part back onto the hard indices (`Finset.sum_image`, using `partner_injOn`),
and regrouping (`Finset.sum_add_distrib`, `abel`), `Nj K m m` is expressed
as a sum of `CoeffNonneg` pieces only (`NonnegEasyTerm` on the unpaired
easy part, `NonnegPairedBlock` on the paired hard/easy blocks, importing
`P_holds_critic_general` at each hard index).

**`partner_mem_range`** (**critic-attributed jointly to C-U1-T and
C-U1-F**, PRIMARY text from C-U1-F's `CriticF.lean`): for a hard index
`i ≤ j`, `partner K i < j+1` unconditionally — no `j`-specific hypothesis
beyond `i ≤ j` and the region, since `partner_spec`'s own first conclusion
already gives `partner K i < i ≤ j`. This is the step the seat's return
believed needed a further, possibly-unavailable hypothesis (its "Scope,
precisely" section); both critics independently show the seat's own
`partner_spec` already supplies it.

**`Nj_nonneg_general`** (**critic-attributed jointly to C-U1-T and
C-U1-F**): `CoeffNonneg (Nj K m j)` for every `j ≤ m` on the region — the
seat's own `Nj_nonneg` assembly verbatim with `Finset.range (m+1) ↦
Finset.range (j+1)` and `h ≤ m ↦ h ≤ j ≤ m` (via `le_trans`) at the two
points the seat's proof used `h ≤ m` where `h ≤ j` now also holds. No new
lemma, no extra hypothesis, no change to any of the seat's declarations.

**`Nj_nonneg_is_instance`**: the seat's `j = m` theorem, `CoeffNonneg (Nj K
m m)`, recovered as the `j := m` instance of `Nj_nonneg_general` (proof
term `Nj_nonneg_general hKd hregion (le_refl m)`). **One disclosed,
non-mathematical reordering relative to `CriticF.lean`**: in the digest-bound
source, `Nj_nonneg_is_instance` is proved *from* `Nj_nonneg_all_index`
(`Nj_nonneg_all_index hKd hregion m le_rfl`); since this project's governed
registrar allows registering entries only up to and including exactly one
terminal `theorem`, with nothing after it, and `Nj_nonneg_all_index` is
this run's terminal declaration, `Nj_nonneg_is_instance` is instead derived
directly from `Nj_nonneg_general` here. The value is identical either way
— `Nj_nonneg_all_index` is itself nothing more than `Nj_nonneg_general`
re-packaged as a `∀ j ≤ m` statement (see the terminal declaration below) —
so this is a reordering of two siblings, not a change of content.

## 5. The terminal declaration

```lean
theorem Nj_nonneg_all_index {m K d : ℕ} (hKd : K + d = 2 * m)
    (hregion : 3 * d ≤ 2 * m + 2) :
    ∀ j ≤ m, CoeffNonneg (Nj K m j) :=
  fun _ hjm => Nj_nonneg_general hKd hregion hjm
```

fully qualified `ErdosR25.E1CoeffWise.Nj_nonneg_all_index`, exactly as
`CriticF.lean` states it (with `Nonneg → CoeffNonneg` per repair (1)). This
is the full registered statement of clause (a) of
`E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`: coefficientwise
nonnegativity of `N_j` for **every** `j ≤ m`, uniform in `d`, `m`, and `j`,
with no horizon and no census.

## 6. Scope exclusions (condition (ii); mandatory fences, restated verbatim from the award statement)

No `SimpleGraph`, `indepCount`, `delta`, or `firstDescent` occurs **as Lean
code** anywhere in this project. `grep -c` over
`LeanProject/LeanProof/Main.lean` gives `delta`: 0, `firstDescent`: 0, and
`SimpleGraph`: 1, `indepCount`: 1, `Δ_k`: 1 — all three of the last group
are the **same single line**, the imported sixth award's own docstring on
`matchingDual_scalarCore_award` (entry 21), reproduced byte-identically
from `ScalarCoreImport.lean`/`Main.lean` of the granted Cycle 5 award:
*"no statement about any graph, forest, G1 tuple, tier, FOREST, TREE,
TRANSFER or Erdős #993; no `SimpleGraph`, `Δ_k`, `indepCount` occurs…"* —
prose *stating* the fence inside a `/-- … -/` comment, not a Lean
identifier reference, import, type ascription, or code use of any of the
three. No declaration in this project is typed over `SimpleGraph`, and no
`Erdos993G1.*` identifier is defined, imported, or applied anywhere. This
discharges **clause (a) only** of
`E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY` (coefficientwise
nonnegativity of `N_j` for every `j ≤ m` on the region). **Clause (b)**
("consequently `μ_j^g(t) ≥ 0` for every `j = 0..m−1` and every real `t ≥ 0`,
for the unclamped chain and, via clamp persistence, for the true clamped
chain") **is formalised nowhere** in this project — not the evaluation
corollary `CoeffNonneg p → 0 ≤ p.eval t`, not the positivity of the
denominators `2^{j+1}·C(m,j+1)·A_{j+1}(t)` on `t ≥ 0` (elementary; not
formalized here), and not the clamp-persistence transfer (which belongs to
`E993-R25-CLAMPED-DUAL-DOMINATION`). **The registered claim as a whole
therefore stays `proved_informal`**; "the coefficientwise positivity lemma
is formal" must never be shortened to "the all-index dual positivity claim
is formal."

The `j = m` instance **is** the sufficiency ("if") half of the separately
registered `E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`
(`Q_{m,d}(t) = m!·N_m(t)`, established independently by both Stage 4
critiques via three convergent checks each: the clearing computation, the
registry's stated leading coefficient `m!·3^{m−1}(2m−3d+3)`, and the
registry's boundary-family coefficient `[t^{m−1}]Q = −4m·m!·3^{m−3}` at
`3d = 2m+3`). This award's terminal theorem therefore lands on **two**
registry keys, not one: `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY`
(clause (a)) and, at its `j = m` instance, the sufficiency half of
`E993-R25-MATCHING-CERTIFICATE-POSITIVITY-IFF`. The **converse** half of
that `iff` (coefficientwise nonnegativity ⟹ `3d ≤ 2m+2`, from the negative
leading coefficient off the region) is **not** formalized by this project
and is not claimed. This award **bears not at all** on
`E993-R25-MATCHING-BRANCH-UNIFORM-SIGN`, which **stays OPEN** — nothing
here shortens the distance to certificate existence, which still needs a
separate dual-sign lemma.

The region `3d ≤ 2m+2` is **exactly sharp**: the off-region witness
`(m,d) = (1,2)` (`K = 0`) gives `N_1(t) = −t−1`, confirmed both by direct
Lean computation implicit in the theorem's own hypotheses and by the
independent exact-integer generator (§8 below, `all_checks_passed: true`,
`off_region_witness.has_a_negative_coefficient: true`). This sharpness fact
is evidence recorded here, in `EVIDENCE/`, and in this report — it is
**not** placed on the terminal declaration's own face (the theorem states
only the `3d ≤ 2m+2 →` direction, correctly; sharpness is a separate,
unformalized fact about what fails off the region).

No fixed point from `SOLUTION-CONTRACT.md` §3 is exhibited or could be
contradicted by this project: `m` (matching size) and `d`/`K` (excess)
enter only as the integer parameters of a pure arithmetic/polynomial
statement; no matching, cover, `x(F) < r`, or graph object of any kind
occurs.

## 7. Corrected literal (minor, carried from the Stage 4 critique)

The dropped common positive constant in `W_i := 2^i·C(m,i)` (relative to
the fully explicit combinatorial weight) is `(j+1)!` at index `j`
(equivalently `m!` at `j = m`, per the alias above) — not "the `j!` common
factor" as an earlier draft said. Positive and independent of `i` and `t`,
so the sign reasoning throughout §4 is unaffected; the literal is corrected
here for the record, per Stage 4 critique finding F5 (C-U1-F).

## 8. Condition (iv): exact-integer generator and instance check

`EVIDENCE/verify_nj_coefficientwise_nonneg.py` (Python standard library
only — `math.comb`, `json`, `hashlib`; deterministic; no
wall-clock/PID/host field in its JSON output; explicit import list at the
top) reproduces `Afac`, `Bfac`, `Wcoef`, `NjTerm`, `Nj` purely
arithmetically (as exact-integer polynomials, represented as plain Python
lists of coefficients, never by trusting the Lean elaborator) and checks
coefficientwise nonnegativity:

- over every in-region `(m, K, j)` cell with `K + d = 2m`, `3d ≤ 2m+2`,
  `1 ≤ m ≤ 45`, `0 ≤ j ≤ m` — **23,055 cells** (matching the figure
  `control/C6-ALLOCATION.md` item 9 and the Stage 4 critique already
  record), **zero failures**;
- the off-region sharpness witness `(m,d) = (1,2)` (`K = 0`, `j = m = 1`):
  `N_1(t) = −t−1` exactly (`polynomial_coeffs_low_to_high: [-1, -1]`),
  confirming the region is genuinely load-bearing and exactly sharp at this
  witness.

Output `EVIDENCE/nj-coefficientwise-nonneg-check.out.json`:
`all_checks_passed: true`.

## 9. Condition (v): `#print axioms` on every registered declaration

`EVIDENCE/axiom-check-all-declarations.txt` records `#print axioms` on all
**46** declarations registered in this project (the sixth award's 13,
seat U1's 29, and the critic's 4 — `partner_mem_range`,
`Nj_nonneg_general`, `Nj_nonneg_is_instance`, `Nj_nonneg_all_index`). Every
one depends on a subset of exactly `[propext, Classical.choice,
Quot.sound]` — the axiom sentence reads **"within the three standard
axioms"**; `IsHard` and `partner` (pure `ℕ` definitions) depend on no
axioms at all; `PStatement`, `Wcoef` (definitions) and
`discriminant_factorization`, `discriminant_in_K_matches_in_d`,
`P_base_s1`, `region_le`, `partner_spec`, `partner_injOn`,
`partner_mem_range` on `propext`/`[propext, Quot.sound]` only; every other
declaration, including the terminal theorem, on the full
`[propext, Classical.choice, Quot.sound]`. **No `sorryAx` anywhere.**
`grep -c 'sorry\|admit\|native_decide'` over
`LeanProject/LeanProof/Main.lean` returns `0`.

## 10. Attributions (condition (i))

- **Seat U1's**: the apparatus (`Afac`, `Bfac`, `Afac_split`, `Bfac_split`,
  `extra_eq`, `reflection_identity_poly`, `region_le`, `IsHard`, `partner`,
  `partner_spec`, `partner_injOn`, `Wcoef`, `term_sign`, `NjTerm`, `Nj`,
  `CoeffNonneg` and its seven closure lemmas, `NonnegLinFac`,
  `NonnegBfacFn`, `NonnegAfacFn`, `NonnegEasyTerm`, `NonnegPairedBlock`) and
  the `j = m` assembly (`Nj_nonneg`).
- **CRITIC-ATTRIBUTED, jointly to C-U1-T and C-U1-F**: the general-`j` lift
  (`partner_mem_range`, `Nj_nonneg_general`, and — this project's terminal
  declaration, which is definitionally the same content — the `∀ j ≤ m`
  packaging `Nj_nonneg_all_index`), each critic having reached it by an
  independent, separately kernel-verified proof (C-U1-F's `CriticF.lean`,
  registered here as PRIMARY since its declarations sit in the
  `ErdosR25.E1CoeffWise` namespace this award's terminal binding requires;
  C-U1-T's `CriticGeneralJ.lean`, an independent cross-check in a different
  namespace, not registered in this project but digest-verified in the
  sealed capsule).
- **The imported sixth award's induction step is CRITIC-ATTRIBUTED to
  C-U1-F and C-U1-T of Cycle 5** (already on that award's own face, per its
  `matchingDual_scalarCore_award` docstring, reproduced unchanged in
  `ScalarCoreImport.lean`'s entry 13 / this project's entry 21): the
  toolkit-free induction step (`P_induction_step_critic`) is C-U1-F's,
  PRIMARY per that award's own fence; the induction-principle scaffold
  (`P_holds_critic`) is C-U1-T's; both imported byte-identically (modulo
  the mechanical `theorem → lemma` demotion of §11) and never re-derived.

## 11. Disclosed mechanical deviations (none mathematical, none weakens the award)

1. **`theorem → lemma` keyword demotion on every non-terminal declaration
   that was originally a `theorem`.** The governed registrar accepts
   exactly one `theorem`-kind entry per project (the terminal declaration);
   every other proved statement — including the sixth award's own
   `matchingDual_scalarCore_award` conjunction, and every seat/critic
   `theorem` other than `Nj_nonneg_all_index` — is registered under
   `--kind lemma`, requiring its head keyword to read `lemma` rather than
   `theorem`. In Lean 4 + Mathlib, `lemma` is a macro-level synonym for
   `theorem`; this changes no type, no proof term, and no elaboration
   behaviour. The exact same treatment is recorded in the sixth award's own
   `FORMALIZER-REPORT.md` (Cycle 5, `runs/lean-2026-09-22-c5-matching-dual-scalar-core/`)
   for the identical reason.
2. **`noncomputable def X` split onto two lines (`noncomputable` / `def
   X …`).** The registrar's source-declaration regex requires the kind
   keyword to begin the line (`^\s*def\s+X\b`); `noncomputable def X` fails
   this since `noncomputable` precedes `def` on the same line. Lean 4
   parses a declaration modifier on its own line identically to one on the
   same line as the keyword it modifies. The same fix is precedented
   elsewhere in this run root, e.g.
   `runs/lean-2026-09-20-c1-d5-seven-matching-sign/DRAFTS/01-def-indepCount.lean`.
   Applies to `Afac`, `Bfac`, `NjTerm`, `Nj` (all four originally
   `noncomputable def` in the seat's source).
3. **`Nj_nonneg_is_instance` reordered** to derive from `Nj_nonneg_general`
   rather than from `Nj_nonneg_all_index` — see §4 above (forced by the
   "exactly one terminal theorem, nothing registered after it" rule; the
   two proof terms denote the same value).
4. **The seven `Nonneg.*` dot-namespace lemmas flattened to
   `CoeffNonneg_*`** rather than kept as `CoeffNonneg.xxx` — see §2 above
   (forced by the registrar's leaf-matching regex; still satisfies the
   adjudicator's repair, which names the *collision* to fix, not a specific
   spelling).

None of these four deviations changes a hypothesis, a conclusion, a proof
term, or the intended theorem. Each is disclosed here and in
`FORMALIZER-REPORT.md` rather than left implicit.

(Exact SHA-256 values of this file, `THEOREM-CONTRACT.yaml`,
`LeanProject/LeanProof/Main.lean`, and `RECEIPTS/kernel-verification.json`
are reported in `FORMALIZER-REPORT.md` and the final message.)
