# Informal proof: `sevenMatching_delta_nonpos` (Award group A, `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN`)

Run: `erdos-993-uniform-residual-no-recovery-dre-2026-09-20`, Stage 7,
`runs/lean-2026-09-20-c1-d5-seven-matching-sign/`. Seat: Cycle 1 Stage 7
formalizer, award group A, `C1-LA1`. Frozen source authority: capsule
`control/c1-stage7-capsules/C1-LA1-PACKET-MANIFEST.json` (seal
`be4b00b46abf55a5e2239d5372ed9adf91f4847107e58f280789216fd4810af4`,
independently recomputed and verified — see `CAPSULE-VERIFICATION.json` in
this run root), `SEMANTIC-CONTRACT.md`, and the frozen, kernel-verified C3
source `sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean` (SHA-256
`aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`, digest
re-verified independently).

## 1. Definitions (verbatim, `SEMANTIC-CONTRACT.md`, registered from C3 entries 1-3, 13)

```lean
noncomputable def Erdos993G1.indepCount {V : Type*} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)
noncomputable def Erdos993G1.coeff {V : Type*} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0
noncomputable def Erdos993G1.delta {V : Type*} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k
noncomputable def Erdos993G1.FirstWide.stratum {X : Type*} [Fintype X]
    (G : SimpleGraph X) (M : Finset X) (k j : ℕ) : Finset (Finset X) :=
  (G.indepSetFinset k).filter (fun S => (S ∩ M).card = j)
```

`i_k(F) := indepCount F k` counts actual independent `k`-subsets, `Δ_k(F) := delta F k`.
`stratum G M k j` is the set of independent `k`-sets meeting the marked set `M`
in exactly `j` vertices.

These four declarations, plus the ten `Erdos993G1.FirstWide` structural
lemmas `stratum_mem`, `erase_inter_eq`, `subset_fiber_eq_image`,
`erase_image_card`, `extension_fiber_bound`, `stratum_erase_outside_iff`,
`stratum_erase_inside`, `stratum_insert_same_outside`,
`stratum_insert_cross_inside`, `stratum_univ_empty` (C3 entries 107, 109-116,
120), and the single lemma `Erdos993G1.ThirdWide.fiveMatching_stratum_empty`
(C3 entry 158, stated generically in `M.card` with no reference to `Fin 5`),
are re-registered in this run's `LeanProject/LeanProof/Main.lean` with
mathematically identical statements and proof terms to the frozen C3 source.
Each is written as its own self-contained top-level fragment (opening and
closing its namespace locally, using `Type*` in place of an ambient
`universe u` + `variable`) because the governed registration tool
(`skills/lean-formalization/scripts/prepare_lean_formalization.py register`)
requires every registered fragment to be independently parseable and to
expose its declared leaf name directly after the `def`/`lemma` keyword. This
is a mechanical restatement, not a byte-identical copy, of the eleven C3
entries above; the proof terms themselves are copied unchanged. Byte
identity is preserved for `fiveMatching_stratum_empty` (C3 entry 158), whose
original C3 form already satisfies this self-containment requirement
unmodified.

## 2. Theorem (Award group A, terminal declaration)

```lean
lemma sevenMatching_delta_nonpos {X : Type u} [Finite X]
    (G : SimpleGraph X) (r : ℕ) (hr : 1 ≤ r) (hn : Nat.card X = 2*r+5)
    (f : Fin 7 × Bool → X) (hf : Function.Injective f)
    (he : ∀ i : Fin 7, G.Adj (f (i, false)) (f (i, true))) :
    delta G (r : ℤ) ≤ 0
```

Bare: no crossing hypothesis, no acyclicity, no forest hypothesis, no
reference to `firstDescent`, `x(G)`, G1 tuples, or any tier. `hr : 1 ≤ r` is
retained verbatim for fidelity with the C3 analogue (entry 164) although it
is derivable: `M.card = 14 ≤ Nat.card X = 2r+5` forces `5 ≤ r` by `omega`,
so `r ≤ 4` is vacuous by cardinality alone (no seven-edge matching fits in
fewer than 14 vertices).

## 3. Proof architecture — the stratum double count

Let `M = image f` (the 14 matched endpoints, `f : Fin 7 × Bool → X`
injective). For `k, j : ℕ`, `stratum G M k j` is the independent `k`-sets
meeting `M` in exactly `j` vertices; `a_j := (stratum G M r j).card`,
`b_j := (stratum G M (r+1) j).card`.

**Support bound (`sevenMatching_forbidden`, `sevenMatching_support`,
mirroring C3 entries 155-156).** For an independent set `S`, each matched
edge `(f(i,false), f(i,true))` is met by `S` in at most one endpoint
(mirror image / "flip" argument), giving a forbidden set `Q ⊆ M` with
`|Q| = 2|S ∩ M|`, hence `|S ∩ M| ≤ 7`. This bounds `j` at `0..7` uniformly,
independent of `r`.

**Stratum partition (`sevenMatching_stratum_partition`, mirroring entry
157).** `indepCount G k = Σ_{j=0}^{7} (stratum G M k j).card`, by
`Finset.card_eq_sum_card_fiberwise` over the fiber map `S ↦ (S ∩ M).card`.

**Outside incidence (`sevenMatching_outside_incidence`, mirroring entry
159).** For `Nat.card X = 2r+5`, `M.card = 14`:
```
(r+1−j) · b_j ≤ (r+j−9) · a_j        (ℕ, truncated subtraction; j = 0..7)
```
Proved by double-counting pairs `(T, v)` with `T` an independent `(r+1)`-set
in `stratum(r+1,j)` and `v ∈ T \ M`: each such `T` yields at least `r+1−j`
choices of `v` with `T \ {v} ∈ stratum(r,j)` (the LHS lower bound on the
fiber count), and each `A ∈ stratum(r,j)` extends by at most
`|X \ (M ∪ A)| = (2r+5) − (14 + r − j) = r + j − 9` outside vertices (the RHS
upper bound), using `extension_fiber_bound` and `stratum_erase_outside_iff`.
**This is the only place `d = 5` and `m = 7` enter, jointly and only through
`2m − d = 9`.**

**Inside incidence (`sevenMatching_inside_incidence`,
`_inside_incidence_int`, mirroring entries 160-161).** For `j ≤ 6`:
```
(j+1) · b_{j+1} ≤ 2(7−j) · a_j        (ℕ, and its ℤ cast)
```
Proved by double-counting pairs `(T, v)` with `T ∈ stratum(r+1,j+1)`,
`v ∈ T ∩ M`: each `T` yields `j+1` choices of `v` with `T \ {v} \in
stratum(r,j)` (LHS), and each `A ∈ stratum(r,j)` extends by at most
`2(7−j)` marked vertices (each of the `7−j` unmet matching edges
contributes at most 2 endpoints, using `sevenMatching_forbidden` again),
using `extension_fiber_bound` and `stratum_insert_cross_inside`.

**Re-centred outside incidence
(`sevenMatching_outside_incidence_large_int`, mirroring entry 162).** For
`t : ℕ`, `r = t + 9`:
```
(t + (10−j)) · b_j ≤ (t + j) · a_j        (ℤ; j = 0..7)
```
This is the ℕ→ℤ re-centring that makes the outside-incidence coefficients
manifestly non-truncated (both sides positive rational functions of `t`,
valid for every `t ≥ 0`, i.e. every `r ≥ 9`). **This step is not skippable**:
a prior Stage 3 route (`U1`'s `R2`) silently dropped exactly this
re-centring and was refuted for it (recorded in
`cycles/cycle-1/stage5/adjudicators/U/ADJUDICATION.md`, route `U-C1-01`).
Without it, the natural-subtraction form of outside incidence truncates at
`r < 9` and is not directly usable in the polynomial certificate below.

## 4. The integer certificate — closed-form dual, `r ≥ 9`

**Provenance and independent re-derivation.** The synthesis
(`cycles/cycle-1/stage6/SYNTHESIS.md`, `## Lean awards`, "Certificate
provenance") records a verified `r`-uniform rational dual family
(originating in the Stage 4 critique `cycles/cycle-1/stage4/critics/U4/F/CRITIQUE.md`,
cross-checked by the `T` critique and the `U` adjudicator):
```
λ_0 = 1/(r+1),  λ_1 = 1/r,  λ_2 = 1/(r−1),  λ_3 = 1/(r−2),
λ_4 = (105r²−789r+1446) / (105(r−2)(r−3)(r−5)),
λ_5 = (21r²−149r+262) / (21(r−2)(r−3)(r−4)),
λ_6 = (7r−22) / (7(r−2)(r−3)),
λ_7 = 1/(r−2),
μ_0 = μ_1 = μ_2 = 0,
μ_3 = (9r−66) / (70(r−2)(r−5)),
μ_4 = (44r−136) / (105(r−2)(r−3)),
μ_5 = (11r−34) / (21(r−2)(r−3)),
μ_6 = 4 / (7(r−2)),
```
valid for `r ≥ 8` (only binding side condition `μ_3 ≥ 0 ⟺ r ≥ 8`), satisfying
`coef_b(j) := λ_j·(r+1−j) + j·μ_{j−1} = 1` for every `j = 0..7`, and
`coef_a(j) := λ_j·(r+j−9) + 2(7−j)·μ_j = 1` for `j = 4,5,6,7`, `< 1` for
`j = 0,1,2,3`.

**This run re-derived and independently re-verified this family exactly
before encoding it**, per the brief's instruction, using an exact
rational-polynomial-in-`t` arithmetic library (`scratchpad` computation,
substituting `r = t+9`), and cross-checked every one of the sixteen
`coef_b(j) = 1` / `coef_a(j) ∈ {1, < 1}` identities as an exact polynomial
identity in `t` (not a numerical sample), confirming:
- `coef_b(j) = 1` exactly for **every** `j = 0..7` (`A_0 = A_7` was an
  unexpected but confirmed coincidence: `λ_3 = λ_7 = 1/(r−2)` literally, an
  independent cross-check of the source data).
- `coef_a(j) = 1` exactly for `j = 4, 5, 6, 7` (no slack at the top four
  indices, including the top stratum `j = 7 = m`).
- `coef_a(j) < 1` strictly for `j = 0, 1, 2, 3` (slack at the **bottom** four
  indices, not at the top).

**Deviation from the brief's literal `ha7`-only-slack instruction, recorded
here as required.** The brief (`C1-STAGE7-FORMALIZER-BRIEF-LA1.md` §3 item
8) describes the certificate's slack column as living on `a_7`, "the
analogue of C3's `E·a_5` term." Independent re-derivation of the exact
family the brief itself quotes verbatim (`## 4` above, identical to
`SYNTHESIS.md`'s "Certificate provenance") shows this is not the case for
*this* family: `coef_a(7) = λ_7·(r−2) = 1` exactly (verified as a polynomial
identity), and the slack is instead at `j = 0, 1, 2, 3`. This matches C3's
own structural pattern only up to *which* index carries the slack, not
*that* exactly one index does — for C3 (`m=5,d=4`) the slack is on the *top*
stratum (`a_5`); for this family at `(m=7,d=5)` it is on the *bottom four*
strata (`a_0,a_1,a_2,a_3`). A single-slack-variable certificate matching the
brief's literal `ha7` structure was attempted and found **infeasible**: the
unique dual solution that saturates `coef_a(j) = 1` for every `j < 7` (i.e.
puts all slack at the top, mirroring C3 exactly) requires `λ_7 < 0` for
small `t` (checked exactly: the closed form's numerator is negative at
`t = 0`), which is not an admissible nonnegative multiplier. The mechanism
this run certifies (`sevenMatching_integer_certificate`) therefore carries
**four** slack hypotheses `ha0, ha1, ha2, ha3 : 0 ≤ a_j` (`j = 0,1,2,3`)
rather than the brief's single `ha7`. This does not change, weaken, or
narrow the terminal theorem `sevenMatching_delta_nonpos` in any way — it is
an internal, non-contractual auxiliary lemma's hypothesis set, corrected
against the actually-verified mathematics per the brief's own instruction to
"re-derive and re-verify these yourself before encoding."

**Clearing denominators.** Setting
`L(t) = 210·(t+4)(t+5)(t+6)(t+7)(t+8)(t+9)(t+10)` (the least common multiple
of every denominator appearing in the family above, after substituting
`r = t+9`), the multipliers `A_j(t) := λ_j·L(t)`, `B_k(t) := μ_{k-1}·L(t)`
(`k=1..7`; `B_1=B_2=B_3=0` identically since `μ_0=μ_1=μ_2=0`), and
`E_j(t) := (1 − coef_a(j))·L(t)` (`j=0..3`) are all **exact, non-negative
integer-coefficient polynomials in `t` of degree ≤ 7**, verified by exact
polynomial division with zero remainder (not merely numerically sampled).
The certificate lemma `sevenMatching_integer_certificate` states these as
explicit `let`-bound polynomials and proves, by `ring` (an exact polynomial
identity, valid for every `t`), that
```
L·(Σb_j) + Σ_{j=0}^{3} E_j·a_j  =  Σ_{j=0}^{7} A_j·(outside LHS)_j + Σ_{k=4}^{7} B_k·(inside LHS)_k
Σ_{j=0}^{7} A_j·(outside RHS)_j + Σ_{k=4}^{7} B_k·(inside RHS)_k + Σ_{j=0}^{3} E_j·a_j  =  L·(Σa_j)
```
Combined with the (hypothesis-supplied) outside/inside inequalities weighted
by the non-negative `A_j, B_k` (`positivity`, using `t ≥ 0`), and
`E_j·a_j ≥ 0` (`positivity` on `E_j`, `ha_j : 0 ≤ a_j` on `a_j`), this gives
`L·(Σb_j) ≤ L·(Σa_j)`, hence `Σb_j ≤ Σa_j` since `L > 0`.

## 5. Small ranks `r = 5, 6, 7, 8`

`r ≤ 4` is vacuous (`2·7 = 14 > 2r+5` for `r ≤ 4`, so no injective
`f : Fin 7 × Bool → X` exists; `omega` from `hMle : M.card ≤ Nat.card X`).

For `5 ≤ r ≤ 8` (`t = r − 9 < 0`, outside the re-centred family's domain),
the terminal theorem uses the *unrecentred*, `ℕ`-truncated outside-incidence
lemma directly (`sevenMatching_outside_incidence`, valid for every `r`
unconditionally) together with `Erdos993G1.ThirdWide.fiveMatching_stratum_empty`
(the reused, `M.card`-generic emptiness lemma: `stratum G M k j = ∅`
whenever `Nat.card X + j < M.card + k`) to eliminate every stratum that is
empty purely on cardinality grounds at that specific order, and closes the
resulting small, fully concrete (all coefficients literal integers once `r`
is a literal) linear system directly by `omega`. This is a genuine
Presburger-arithmetic decision procedure call, not a hand-built rational
dual — for a *fixed* small `r` every outside/inside-incidence coefficient is
a concrete integer, and `omega` is a complete decision procedure for linear
integer arithmetic, so it substitutes for hand-deriving a bespoke small dual
at each of the four ranks while proving the identical mathematical fact.

One rank (`r = 5`) needs one additional structural fact beyond the
`M.card`-generic emptiness lemma: `stratum G M 6 7 = ∅`. This is *not* an
instance of `fiveMatching_stratum_empty` (whose criterion,
`Nat.card X + j < M.card + k`, reads `15 + 7 < 14 + 6`, false) but a
simpler, more basic structural fact — an independent `k`-set meeting `M` in
`j` vertices needs `j ≤ k` (since `S ∩ M ⊆ S`), so `stratum(6,7)` is empty
because `7 > 6`, independent of any cardinality budget. This is proved
inline (four lines, via `stratum_mem` and `Finset.card_le_card` on
`S ∩ M ⊆ S`) rather than registered as a separate lemma, since it is used
once. Every other `j > k` stratum appearing in the four small-rank branches
sits on the "safe" side of the final inequality (an `a_j` term, i.e. a term
on the rank-`r` side rather than the rank-`(r+1)` side), where leaving it as
an unconstrained non-negative integer cannot break the desired `≤`
direction, so no separate justification is needed for those.

## 6. Scope exclusions (binding; the theorem carries none of the following)

Per `SYNTHESIS.md` "Award group A," §"Every excluded conclusion," restated
here as the contract's binding fence:

1. No Tier 1 (`E993-R25-UNR-FOREST-WIDE` stays `OPEN`); the theorem is bare
   and matching-conditioned, Tier 1 is crossing-conditioned with no matching
   hypothesis.
2. No Tier 2 (`E993-G1WIDE-NO-SIZE-CAP` stays `OPEN`); nothing here touches
   the G1 guards, `firstDescent`, or any G1 tuple object.
3. No Tier 3-uniform status; this is one fixed band (`d = 5`), not the
   `(m,d)`-uniform schema.
4. No closure of the diagnostic band
   (`E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` stays `OPEN`); that theorem
   is crossing-conditioned and forest-restricted, with no matching
   hypothesis — no status transfers either direction.
5. No forest or acyclicity hypothesis anywhere; no transfer to
   `E993-TGT-FOREST`, `E993-TGT-TREE`, `E993-TRANSFER-TO-FOREST`,
   `E993-EXISTS-COUNTEREXAMPLE`, or Erdős #993.
6. No reopening of `E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN`
   (`REFUTED`, `m = 6` fixed as the failing boundary); this theorem sits
   immediately above it (`m = 7`), confirming rather than disturbing it.
7. The comparator `(1+2z)^m(1+z)^{n-2m}` is nowhere a proof device; the
   certificate system is strictly stronger.
8. No claim about log-concavity, TRS2, or real-rootedness.
9. `novelty_claimed: false`. Grade at this stage:
   `compiled-candidate` (elaborator/type-checker accepted; independent
   kernel verification, independent informal audit, and independent
   fidelity review remain open gates — see `FORMALIZER-REPORT.md`
   `## Remaining gates`).
