# Cycle 4 Stage 3 Return — Seat U2

**Route ID:** `C4-U-02`. **Mechanism token:** `WEIGHT-FORMULA-AND-PER-CLASS-COMPOSITION`. **Orientation:** U (formal / structural). **Frozen nodes owned:** N6, N7.

## Boot

Restricted boot per the dispatch: read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file outside
the run root (the controller has booted for the run; the startup protocol's own task-type map,
memory, conversations, modules, skills, logs and decisions were NOT loaded). Boot acknowledged at
the top of this return, as required.

## Dispatch digest verification

`control/dispatch/c4-stage3/DISPATCH-U2.md` SHA-256 verified before reading:
`ac296057e45d65c07153ee1801da6ef9a8f8d289f9efc2af4dca1c4b2681eb5b` (matched).

## Stage 2 seal

Recomputed SHA-256 of the canonical JSON of `control/C4-STAGE2-PACKET-MANIFEST.json` without its
`seal_sha256` field (`sort_keys=True`, separators `(",", ":")`, no trailing newline):
`226555ee1fc5b7db4b723c59967b2142522b57b4e4344c078f251156110f7387` — **matched** the manifest's
recorded `seal_sha256`.

## Digests verified before reading

- `control/C4-FROZEN-STATEMENTS.lean`: `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1` (matches gate ruling 23 and `sources/c4-base/LeanProject/LeanProof/Statements.lean`).
- `control/C4-FROZEN-STATEMENTS.md`: `6aa6dfe5971a187be2be41cc1e350db4beff187ca5b648cdb9aec2edc5eca54b` (matches gate ruling 23).
- Every file in `sources/c4-base/SOURCE-DIGESTS.json` (12 files: `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`, `LeanProof.lean`, `Main.lean`, `ChokeState.lean`, `E1FlowConstruction.lean`, `C3LA1.lean`, `Statements.lean`, `build-c3la1.log`, `build-root.log`, `axioms-base.log`) recomputed with `shasum -a 256` and matched exactly.
- `sources/mathlib-binding/PIN.json`: toolchain `leanprover/lean4:v4.32.2`, Mathlib rev `905b95818eb32af7874a58b427f50c1711a5e96c` (matches the scratch project's own `lean-toolchain`/`lake-manifest.json`, copied byte-identically from `sources/c4-base/LeanProject`).
- `sources/c3-scratch-lean/c3-U3/LeanProject/LeanProof/Main.lean` entry 608 (`cb8_activeWeight_leafSet_zero_iff`), read under the common brief's explicit grant of `sources/c3-scratch-lean/`, used as a DRAFT technique source only (never carried; not graded).

## Registered claims named before any census (obligation 3)

This route's objects, N6 (`E993Transport.cb8_activeWeight_leafSet_eq`) and N7
(`E993Transport.cb8Rho_one_eq_cb8R1_ratio`, `E993Transport.cb8_flowBundle_of_arcSpecs`), are gate
ruling 23 frozen leaf statements, not registered claims in `sources/authority/CLAIM-IDENTITY.json`.
No entry in `CLAIM-IDENTITY.json` is re-confirmed, touched, or affected by this return: this route
neither computes nor reports any instance of (HALL), the primary aggregate
`E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, or any of the r30/r31 keys listed in
`SEMANTIC-CONTRACT.md` §4. The numeric work below (an independent Python check of N6's formula and
the N7 companion's value identity) is evidence about two FROZEN LEAF STATEMENT CANDIDATES, not
about any registered key, and is reported as such.

## IMPORT LIST (Python instrument; standard library only)

```
import itertools
import random
import hashlib
import json
from fractions import Fraction
from math import comb
```//
(`itertools` is imported by the script but unused in the final version; harmless.)

## Derivation

### N6 — `cb8_activeWeight_leafSet_eq`

**Statement** (frozen, byte-identical to `control/C4-FROZEN-STATEMENTS.lean` lines 251–256):
for `m : ℕ`, `0 < m`, and every `B : Finset (Fin (17*m+3))`,
`activeWeight (cbGraph m) (leafSet (cbGraph m)) B = [v ∈ B ∧ r ∈ B] + Σ_{i<m} [u_i ∈ B]·chokeGamma m B i`.

**Where each object enters.** `activeWeight G F B := ((F ∩ B).filter fun z => ¬Disjoint (B.erase z)
(tagWitnesses G z)).card` (Main.lean entry 16). `tagWitnesses (cbGraph m) v = {w : w.val = 0}` (entry
69, `W_v = {r}`) and `tagWitnesses (cbGraph m) c_ij = {w : w.val = 3+17i}` (entry 70, `W_{c_ij} =
{u_i}`). `leafSet (cbGraph m) = {τ : τ.val = 2 ∨ ∃i<m,j<8, τ.val = 3+17i+2+2j}` (entry 60). The
hypothesis `0 < m` enters exactly where entry 60/608 need it (the leaf classification is vacuous or
ill-typed at `m = 0`; SR-C3-3's own note, "the formula fails at `m=0`").

**Step 1 (element-wise classification).** For `τ ∈ (F∩B)` satisfying the active-tag predicate,
case on `mem_leafSet_cbGraph_iff`:
- `τ.val = 2`: `τ = cbVertex m 2 = v` (`eq_cbVertex_iff`). The predicate `¬Disjoint(B.erase v)
  (tagWitnesses G v)` unfolds via `Finset.not_disjoint_iff` to `∃w, w∈B.erase v ∧ w.val=0`; the
  unique such `w` is `cbVertex m 0 = r` (`eq_cbVertex_iff` again), and `r ≠ v` is immediate (vals
  `0≠2`, closed by `omega` after `cbVertex_val`). So the predicate holds at `v` exactly when
  `r ∈ B` (given `v ∈ B` already, from `τ ∈ F∩B`).
- `τ.val = 3+17i+2+2j` for some `i<m,j<8`: symmetric, with witness `u_i = cbVertex m (3+17i)`; the
  predicate holds at `c_ij` exactly when `u_i ∈ B` (given `c_ij ∈ B`).

**Step 2 (disjoint decomposition and cardinality).** The active-tag filtered set therefore equals
`(if v∈B∧r∈B then {v} else ∅) ∪ (range m).biUnion (fun i => if u_i∈B then
((range 8).filter (fun j => c_ij∈B)).image (fun j => c_ij) else ∅)`, proved by `Finset.ext` using
exactly the four carried lemmas above plus `Finset.not_disjoint_iff`/`Finset.mem_erase` (the same
idioms C1-LA2's entry 608 already uses for the `= 0` case; this proof generalizes 608's argument
from an iff to an exact count). The `{v}`-branch is disjoint from the `biUnion` branch (val `2`
never equals `3+17i+2+2j`, `omega`). The `biUnion` is over `PairwiseDisjoint` branches (`j↦c_ij` is
injective in `j` for fixed `i`, and the label ranges for `i≠i'` cannot collide: `17(i-i') =
2(j'-j)` with `|j'-j|≤7` forces `i=i'`, both by `omega`). `Finset.card_union_of_disjoint`,
`Finset.card_biUnion`, and `Finset.card_image_of_injOn` then give exactly the RHS, with the
innermost `.card` closing by `rfl` against `chokeGamma`'s own definition (`ChokeState.lean`).

**Lean text.** Written in full in `scratchpad/c4-U2/LeanProject/LeanProof/Statements.lean` (this
route's copy), replacing N6's `sorry` body byte-for-byte at the frozen signature. **BUILD-CONFIRMED**
(update, this route's third session): `lake build LeanProof` exits 0 with 0 errors and N6 carries
NO `declaration uses sorry` warning; `#print axioms E993Transport.cb8_activeWeight_leafSet_eq`
reports `[propext, Classical.choice, Quot.sound]` only (no `sorryAx`). See "Lean build status"
below for the full build/axiom report. This is a compiled, sorry-free scratch declaration on the
Cycle 4 base; it is not itself a governed award (Solution Contract §4: "a compiled scratch
declaration has no grade until its governed award closes") but it DOES discharge the frozen node
N6 in the sense of gate ruling 25/32 ("a route closes a node when the frozen declaration compiles
sorry-free on the Cycle 4 base with axioms `propext, Classical.choice, Quot.sound` only") — reported
on the `FROZEN_NODES_CLOSED` gate line below.

### N7 companion — `cb8Rho_one_eq_cb8R1_ratio`

**Statement** (frozen): `cb8Rho(8·1−1, 8(m−1)+1, ((p*−1:ℕ):ℤ)) = cb8R1(m,K)/cb8R1(m,K−1)`, `K =
(16m+1)/3`, for `107 ≤ m`, `m%3=2`.

**Where each hypothesis enters.** C3-LA1's ALREADY FORMALLY VERIFIED entry 37
(`e1Rho_one_eq_cb8R1_ratio`, `sources/c4-base/LeanProject/LeanProof/C3LA1.lean` lines 295–311)
states the IDENTICAL value identity in `e1Rho`'s ℕ-indexed vocabulary: `e1Rho(7, 8(m−1)+1,
(16m+4)/3−1) = cb8R1(m,K)/cb8R1(m,K−1)`, needing only `1 ≤ m` (weaker than N7's `107 ≤ m`). The
bridge from `cb8Rho` (E1FlowConstruction.lean, ℤ-indexed, `= cb8R a b j / cb8R a b (j−1)`) to
`e1Rho` (C3LA1.lean, ℕ-indexed, defined as a ratio of clone-total sums) is exactly `cb8R_natCast_eq_coeff`
(both reduce to the same polynomial-coefficient ratio) composed with C3-LA1's own
`e1Rho_eq_coeff_ratio` (entry 33, needs `1 ≤ j`, discharged by `omega` from `107 ≤ m`). The index
identity `((p*−1:ℕ):ℤ) − 1 = ((p*−2:ℕ):ℤ)` is a pure `omega` fact given `p* − 1 ≥ 1` (from
`107 ≤ m`).

**Lean text.** Complete four-line proof (`hbridge` + `rw`/`exact`), added to the scratch
`Statements.lean`, citing only `cb8R_natCast_eq_coeff` (E1FlowConstruction.lean, carried),
`e1Rho_eq_coeff_ratio` and `e1Rho_one_eq_cb8R1_ratio` (C3LA1.lean, carried, formally verified at
their own scope). **This route's own scratch copy of `Statements.lean` had to add
`import LeanProof.C3LA1`**, absent from the frozen file's import list (which needed C3LA1 only for
no declaration at all — the frozen statement's TYPE uses only `cb8Rho`/`cb8R1`, both already
imported; only a PROOF BODY needs C3LA1's lemmas). The frozen theorem's name and type are untouched;
only the import line and the `sorry` bodies differ, as gate ruling 23 permits ("a route engineers a
proof of the frozen text, byte for byte" — the text is the declaration, not the file's import list).
**BUILD-CONFIRMED** (update, this route's third session): `lake build LeanProof` exits 0 with 0
errors and the N7 companion carries NO `declaration uses sorry` warning; `#print axioms
E993Transport.cb8Rho_one_eq_cb8R1_ratio` reports `[propext, Classical.choice, Quot.sound]` only.
Closes the N7 companion node in the sense of gate ruling 25/32.

### N7 main — `cb8_flowBundle_of_arcSpecs`

**Clause (1), nonnegativity.** Immediate: `add_nonneg (hE1.1 B A) (hSec.1 B A)`. **Proved and added
to the scratch file** (this clause type-checks against the stated hypotheses by construction; not
independently build-confirmed, see below).

**Clause (2), support.** `hE1.2` (the E1 spec's clause 2) gives `f B A ≠ 0 → ... ∧ ∃x∈B, A=B.erase
x`; the existential is exactly the LEFT disjunct of `transportRel`'s definition (`(∃q∈B,
A=B.erase q) ∨ (switch)`, Main.lean entry 19), so `f B A ≠ 0 → transportRel B A` by `Or.inl`.
Contrapositive: `¬transportRel B A → f B A = 0`. Combined with `hSec.2` (`¬transportRel B A →
cb8GSec B A = 0`) directly, `g B A = f B A + cb8GSec B A = 0 + 0 = 0`. **Proved and added.**

**Clause (3), Out (`w(B) ≤ Σ_A g(B,A)`) — complete informal derivation, NOT Lean-encoded this
route** (see "Remaining obligation"). Case split on `B ∈ indepFamily(p+1)`:
- **`r ∉ B`.** `hE1.3` (E1 spec clause 3) gives `Σ_A f(B,A) = w(B)` exactly. `¬(r∈B∧v∈B)` (since
  `r∉B`), so `hZero.1` gives `Σ_A cb8GSec(B,A) = 0`. Total `= w(B) ≥ w(B)`.
- **`r ∈ B ∧ v ∈ B`** (sector source). `B ∈ indepFamily(p+1)` unfolds (as in `cb8E1Arc_shape`'s own
  proof, `Finset.mem_filter`/`Finset.mem_powersetCard`) to `IsIndepSet B`; since `r ~ u_i` for every
  `i<m` (`cbGraph_adj_r_choke`, entry 40) and `B` is independent, `u_i ∉ B` for every `i`. By N6
  (`hW`), `w(B) = [v∈B∧r∈B]·1 + Σ_i[u_i∈B]·γ_i(B) = 1 + 0 = 1`. `f`'s row is `0` (any nonzero `f`
  forces `r∉B` by clause (2)'s contrapositive, contradicting `r∈B`). `hOut` gives `Σ_A
  cb8GSec(B,A) ≥ 1`. Total `≥ 0+1 = 1 = w(B)`.
- **`r ∈ B ∧ v ∉ B`.** By the same independence argument, `u_i∉B` for every `i`, so by N6 `w(B) =
  0+0 = 0 ≤ Σ_A g(B,A)` trivially (each `g(B,A) ≥ 0` by clause (1)).

**Clause (4), In (`Σ_B g(B,A) ≤ w(A)`) — complete informal derivation, NOT Lean-encoded this
route.** Case split on `A ∈ indepFamily(p)`, matching the checkpoint's named split exactly
("in-sector; one-choke with `v`; other `r`-free `q≥1`; weight 0", `control/CHECKPOINT-ANALYSIS-C3.md`
line 192, quoted in `control/C4-FROZEN-STATEMENTS.md` lines 739 and 750–755):
- **`r ∈ A ∧ v ∈ A`** (sector target, any `q`). `f`'s column is `0` (`hE1.5`, the `r∈A` branch).
  `hIn` gives `Σ_B cb8GSec(B,A) ≤ 1`. By the independence argument above (`r∈A ⟹ ∀i, u_i∉A`), N6
  gives `w(A) = 1`. Total `≤ 0+1 = 1 = w(A)`.
- **`r ∉ A ∧ v ∈ A ∧ q(A)=1`** (one-choke-with-`v` target). Let `i` be the unique choke with
  `u_i∈A` (from `cbOpenChokeCount m A = 1`, i.e. the defining filter of `cbOpenChokeCount` has
  card 1, so it is a nonempty singleton — extracted via `Finset.card_eq_one`), `γ := chokeGamma m A
  i`. `hE1.4` (E1 spec clause 4, at `q=1`) gives the exact `f`-column `ρ_1·w(A)` with `ρ_1 :=
  cb8Rho(8·1−1, 8(m−1)+1, ((p*−1:ℕ):ℤ))`. `hSw.1` gives the exact `cb8GSec`-column `(8−γ)·σ(γ)`.
  By N6, `w(A) = [v,r∈A](=0) + γ = γ` (every OTHER choke term is `0` since `q(A)=1` forces no other
  `u_{i'}∈A`). Need: `ρ_1·γ + (8−γ)·σ(γ) ≤ γ`.
  - **`γ ∈ [1,7]`.** C1-LA1's terminal (`cb8_topRank_sectorTemplate_feasible`) conclusion (iv)
    (Switch) gives `(8−γ:ℚ)·cb8Sigma m γ ≤ cb8Theta m · γ`; conclusion (v) (Residual) gives
    `cb8Theta m ≤ 1 − cb8R1-ratio`. The N7 companion (above) gives `ρ_1 = cb8R1`-ratio exactly, so
    `ρ_1 ≤ 1 − cb8Theta m`, i.e. `ρ_1·γ ≤ (1−cb8Theta m)·γ` (multiplying by `γ ≥ 0`). Adding the
    two inequalities: `ρ_1γ + (8−γ)σ(γ) ≤ (1−Θ)γ + Θγ = γ`. (`σ(γ) = cb8Sigma m γ`.)
  - **`γ = 0`.** `cb8CGamma 0 = 0` by definition (Main.lean entry 82, the `| _ => 0` branch), so
    `cb8Sigma m 0 = 0` exactly (entry 86); both sides of the target inequality are `0` (`ρ_1·0 = 0`,
    `(8−0)·0 = 0`), closed by `norm_num`/`rfl` on `cb8CGamma`, with no need for the Switch/Residual
    clauses at all.
  - **`γ = 8`.** Symmetrically `cb8CGamma 8 = 0` (same `| _ => 0` branch, `8` matches no listed
    pattern `1..7`), so `cb8Sigma m 8 = 0`; the inequality reduces to `8·ρ_1 ≤ 8`, i.e. `ρ_1 ≤ 1`,
    which is `cb8Rho_lt_one_topRank m 1 hm hres (le_refl 1) (by omega)` directly (no Residual
    needed).
- **Every other `A`** (`q(A)=0`, or `q(A)≥2`, or (`q(A)=1 ∧ v∉A`)). `hE1.5` gives `f`'s column `0`
  whenever `r∈A ∨ q(A)=0`; `hSw.2` gives `cb8GSec`'s column `0` whenever `2≤q(A)` or
  (`q(A)=1∧v∉A`). The remaining sub-case, `r∉A ∧ q(A)=0` (so `f`'s column is `0` by `hE1.5`'s
  `q(A)=0` disjunct) needs `cb8GSec`'s column `= 0` too: this is exactly `hZero.2` (weight-zero
  targets receive nothing) composed with N6 (`hW`), since `r∉A∧q(A)=0` forces, by N6, `w(A) =
  [v,r∈A](=0, as `r∉A`) + Σ_i[u_i∈A]γ_i(A)`, and `q(A)=0` means NO `u_i∈A`, so every summand is
  `0`, i.e. `w(A)=0`. Total `= 0+0 = 0 ≤ w(A) = 0`.

**Why this case split is exhaustive and each branch's hypothesis set is exactly as stated**: every
`A` satisfies exactly one of {`r∈A∧v∈A`}, {`r∉A∧v∈A∧q(A)=1`}, {the rest}, and within "the rest"
every sub-case is covered by `hE1.5 ∨ hZero.2` for the `f`/`cb8GSec` column respectively — no case
is assumed vacuous without a cited hypothesis.

## Grades

**Update (this route's third session, after the controller supplied the base cache CF-C4-S3-1).**
Both N6 and the N7 companion are now **BUILD-CONFIRMED, sorry-free, kernel-checked**: `lake build
LeanProof` on the Cycle 4 base exits 0 with 0 errors, neither declaration carries a `declaration
uses sorry` warning, and `#print axioms` on each reports exactly `[propext, Classical.choice,
Quot.sound]` (no `sorryAx`) — see "Lean build status" for the full report. This is a **compiled
scratch declaration** on the Cycle 4 base (Solution Contract §4: "a compiled scratch declaration has
no grade until its governed award closes" — so neither N6 nor the N7 companion is itself
`formally_verified`; that grade belongs only to a governed award closing at Stage 7). Both also
discharge their frozen node per gate ruling 25's compile criterion, reported on
`FROZEN_NODES_CLOSED` below. Independently, both are further corroborated by the Python instrument
below (0 failures: N6 1,058,596 checks across `m∈{1,2,107,110,113,158}`, `m=1` exhaustive; N7
companion an exact rational identity at 20 rows, `m=107..2393`; two mutation controls both caught) —
this Python check was written and run BEFORE the successful build (across the interruptions) and is
kept as the second, independent instrument (see "Instrument sides"), not as a substitute for the
kernel check now obtained. Grade: **`compiled`** for both, backed by
`scratchpad/c4-U2/build-kernelcheck2.log` and `scratchpad/c4-U2/LeanProject/work/axioms.log`
(digests below); never labeled `formally_verified` (that label is reserved for a governed award).

N7 main clauses (1)-(2): **BUILD-CONFIRMED** as part of the same successful `lake build LeanProof`
(these two conjuncts' proof terms carry no `sorry`; only clauses (3)-(4), inside the same
declaration, do — so the WHOLE declaration `cb8_flowBundle_of_arcSpecs` still shows one
`declaration uses sorry` warning at its own line, and the declaration as a whole is not closed, but
clauses (1)-(2) individually are genuinely sorry-free proof terms, kernel-checkable in isolation).
Clauses (3)-(4): complete, hypothesis-by-hypothesis informal derivation above (not yet Lean text) —
`bounded_evidence` at the informal-derivation level, explicitly NOT `compiled` and NOT
`proved_informal` (this route does not register a key).

## Alias check

No new claim is proposed in the `E993-R31-` namespace by this route: N6 and N7 are pre-existing
gate ruling 23 frozen leaf statements (drafted 2026-09-28, sealed before this dispatch), not fresh
propositions. Lexical check: the names `cb8_activeWeight_leafSet_eq`, `cb8Rho_one_eq_cb8R1_ratio`,
`cb8_flowBundle_of_arcSpecs` were not altered and are not aliases of any REFUTED key (Solution
Contract §3 fence 6 list; the reserved terminal name `cb8_topRank_eligible_and_weightedHall` occurs
0 times in this route's scratch files, confirmed by inspection while writing them). Mathematical
check: N7's conclusion is, per gate ruling 26, explicitly NOT an alias of the struck
R-9/R-10 "trivial reduction" pattern (its hypotheses are the per-arc conclusions of N2–N6, not a
flow's existence), a status this return did not re-litigate, only relied on.

## Instrument sides

| Row / claim | Side 1 | Side 2 | Difference index |
|---|---|---|---|
| N6 formula, all rows | Direct definitional Python computation (`active_weight`, literally following `activeWeight`'s VerityOS definition — entry 16 — and `tagWitnesses` — entries 69/70) | Lean proof, kernel-checked: `lake build LeanProof` exit 0, sorry-free, axioms `[propext, Classical.choice, Quot.sound]` (`build-kernelcheck2.log`, `work/axioms.log`) | none: an identity, not a layer-indexed flow quantity — no `i_{p+1}−i_p` applies |
| N7 companion, all rows | Direct exact-rational polynomial-coefficient computation (`cb8Rho`/`cb8R1` via `coeff_binom_poly`, independent of any Lean vocabulary) | C3-LA1's formally verified `e1Rho_one_eq_cb8R1_ratio` (entry 37) via the bridge proof, now itself kernel-checked (same build/axiom logs as N6) | none: a value identity, not a flow quantity |
| N7 main clauses (3)/(4) | Informal derivation above, citing C1-LA1's formally verified terminal (conclusions iv/v) and the N7 companion | none: no independent second computation was run for the Out/In bound derivation itself (it is a proof, not a numeric table) | none: no numeric claim is reported for clauses (3)/(4) beyond the arithmetic identity `ρ_1γ+(8−γ)σ(γ)≤γ`, which is a corollary of already-cited formally verified facts, not a fresh computed row |

`x` and `Δ_k` (obligation 9's difference-index convention): **none — no numeric claim in this
route concerns the first-descent index `x` or a layer difference `Δ_k`.** This route's objects are
a `Finset.card` identity (N6) and a rational value identity (N7 companion); neither is a
layer-indexed independence-polynomial quantity.

Acyclicity-and-connectivity tests in code: **none — not applicable.** This route does not construct
or certify a flow network instance; N6 is a cardinality identity and N7 composes per-arc
specifications into a bundle (Out-`≥`/In-`≤` inequalities), never asserting or needing a
graph-theoretic acyclicity or connectivity property on its own account (those properties, if
needed at all, belong to N8/U3's flow-existence step, `exists_saturatingFlow_of_weightedHall`, not
to this route).

## Numeric claims: deterministic generator, digest, replay

**Generator:** `scratchpad/c4-U2/work/check_n6_n7companion.py` (also see the copy-out-first replay
below). SHA-256 of the script: `aa3adc83d2dd0cc27847dc83150cd47b9f473e762f15584848cbce4afa1eb611`.
Invocation: `python3 -B check_n6_n7companion.py` (no wall-clock, PID or host field enters the
hashed output; the RNG seed is a fixed literal, `20260928`/`31337`).

**Result (work copy):** `scratchpad/c4-U2/work/run2.out.json`, SHA-256
`774857c8b4c836d889a857876a1a8b8f65d3c3aff7429961c98aa0dd5253eda7`. `total_failures: 0`. Internal
canonical-JSON digest of the results object (embedded field `sha256_of_results`, computed over the
results dict alone, `sort_keys`, separators `(",", ":")`, distinct from the whole-file digest
above): `13dc6e211f57949778a398827448419d4e3c95612e929044af9364a312c4c477`.

**Mutation controls** (both caught, confirming the checker discriminates): "N6 without the `[v,r]`
term" — 500 checks, 15 failures detected (caught); "N7 companion with `j=p*` instead of `p*−1`" —
3 rows, 3 failures detected (caught).

**Copy-out-first replay** (target `scratchpad/c4-U2-replay/`, never `/tmp`):
```
cp scratchpad/c4-U2/work/check_n6_n7companion.py scratchpad/c4-U2-replay/
cd scratchpad/c4-U2-replay && python3 -B check_n6_n7companion.py > replay1.out.json 2> replay1.err.log
```
Replay result: `scratchpad/c4-U2-replay/replay1.out.json`, SHA-256
`774857c8b4c836d889a857876a1a8b8f65d3c3aff7429961c98aa0dd5253eda7` — **byte-identical** to the work
copy's result (confirmed by `diff`), `replay1.err.log` empty (exit 0). Script copy SHA-256 in the
replay directory: `aa3adc83d2dd0cc27847dc83150cd47b9f473e762f15584848cbce4afa1eb611` (identical to
the work copy, confirmed by `diff`).

## Lean build status (SUCCESSFUL as of this route's third session)

The scratch project `scratchpad/c4-U2/LeanProject/` was assembled exactly per the dispatch: the
five `sources/c4-base/LeanProject/LeanProof/*.lean` files copied byte-identically (digests
re-verified: `Main.lean` `385af1bf529a6c8e9e136ce87472b9fd6cd51f24ec4976265dbbf7160d62ea3f`,
`Statements.lean` `0fc723d787e75d1100b6b24c33b9e85a64f96a0c3d30d34c9e80414cae39ede1` before any
edit), the project shell (`lakefile.toml`, `lake-manifest.json`, `lean-toolchain`) copied
byte-identically, and Mathlib bound by manual symlink (`ln -s
/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages
LeanProject/.lake/packages`; never copied; `.lake/packages` itself untouched throughout).

**Attempts 1–5 (across the first two sessions) did not reach a successful build** — recorded here
for the process record, since they informed the diagnosis the controller then corrected:

| Attempt | Command | PID | Outcome | Log digest / size |
|---|---|---|---|---|
| 1 | `lake build LeanProof.Main` (background) | 41999 | No output after ~5.5 min elapsed; killed after the first host interruption found it dead | `build-main.log`, 0 bytes, `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` |
| 2 | `lake --no-cache build LeanProof.Main` (background) | 44370 | Real CPU progress (setup phase) but no `.olean` output before the first interruption found it dead | `build-main2.log`, 0 bytes, same empty-file digest |
| 3 | `lake --no-cache build LeanProof.Main` (background, post-resumption 1) | 15519 | Died silently before the second interruption; log empty | `build-main3.log`, 0 bytes, same empty-file digest |
| 4 | `lake --no-cache -v build LeanProof.Main` (background, post-resumption 1) | 16544 | Ran ~6 minutes with real, visible progress, but was actively recompiling previously-uncached Mathlib source files (e.g. `Mathlib/Topology/Separation/Lemmas.lean`); died/reaped across the second interruption | `build-main4.log`, 18,084,133 bytes, `c1f08f9f8dad141eab7654244b361173c4583692a51a30cde362951b3b3cd1ef` |
| 5 | `timeout 290 lake build LeanProof` (foreground, post-resumption 2) | none captured (ran synchronously; exit 124) | Zero bytes of output after 290 s | `build-final.log`, 0 bytes, same empty-file digest |

**Controller fact CF-C4-S3-1 (R31-N-26), received at this route's third resumption**: the stalls
were not network stalls; a cold copy of the base must elaborate the 2.4 MB `Main.lean` from
scratch (several minutes with no output until done), and `--no-cache` made this worse by also
discarding the locally valid Mathlib build. The controller supplied a pre-built cache at
`scratchpad/c4-base/LeanProject/.lake/build` (built from bytes identical to `sources/c4-base`).
This route verified byte-identity of its own (unmodified) `Main.lean`, `ChokeState.lean`,
`E1FlowConstruction.lean`, `C3LA1.lean` against `sources/c4-base/LeanProject/LeanProof/*` (all four
matched exactly), removed its own stale `.lake/build`, and copied the controller's cache in
(`cp -R scratchpad/c4-base/LeanProject/.lake/build scratchpad/c4-U2/LeanProject/.lake/build`;
`.lake/packages` symlink untouched).

**Attempt 6 — `lake build LeanProof` (foreground, no `--no-cache`), with the controller's cache in
place:**
```
cd scratchpad/c4-U2/LeanProject && lake build LeanProof > ../build-kernelcheck.log 2>&1
```
First run: exit 1 (real base replay in ~13s total wall time — "[8659/8661] Building
LeanProof.Statements" — confirming the cache eliminated the cold-elaboration cost exactly as the
controller predicted), but with **5 genuine `omega` failures inside this route's own N6 proof**
(`build-kernelcheck.log`, 162 lines, SHA-256 `8067cd673e6ac7e607a856fd706aa9d1d143d05f69a5cea98e8fd481085e0baa`):
every failure was the same class of bug — a bound (`i < m` or `j < 8`) discarded via `intro x _`/
`obtain ⟨x, _, h⟩` instead of kept and extracted, at `Statements.lean` lines 357, 388, 389, 408, 409
(pre-fix line numbers). Fixed by naming and extracting each discarded membership witness
(`Finset.mem_range.mp`, `Finset.mem_coe.mp`, `Finset.mem_filter.mp` composed as needed) at five
sites in the `hdisjUV`, `hpwd`, and `hcardC` sub-proofs of N6.

**Attempt 7 — rebuild after the fix:**
```
cd scratchpad/c4-U2/LeanProject && lake build LeanProof > ../build-kernelcheck2.log 2>&1
```
**Exit 0. `Build completed successfully (8661 jobs)`, 0 `error:` occurrences, wall time ~12s.**
(`build-kernelcheck2.log`, 86 lines, SHA-256
`02dfe1241988e7141405a8ee7e5524d2cf85a88efda8b425a723b89e300b2e44`.) The only `declaration uses
sorry` warnings remaining are at `Statements.lean` lines 31, 41, 64, 81, 94, 104, 147, 156, 170,
177, 185, 193, 201, 210, 226, 244 (N1, N2, N3, N4, N5 — not this route's nodes, untouched, exactly
as frozen), 456 (N7 main, clauses (3)-(4) only) and 553 (N8 — not this route's node, untouched).
**Neither N6 (`cb8_activeWeight_leafSet_eq`, no sorry warning) nor the N7 companion
(`cb8Rho_one_eq_cb8R1_ratio`, no sorry warning) appears in that list.** The reserved terminal name
`cb8_topRank_eligible_and_weightedHall` occurs 0 times in the final `Statements.lean` (checked by
`grep -c`, this route's own file).

**Axiom check:**
```
cat > scratchpad/c4-U2/LeanProject/work/AxiomCheck.lean <<'EOF'
import LeanProof.Statements
#print axioms E993Transport.cb8_activeWeight_leafSet_eq
#print axioms E993Transport.cb8Rho_one_eq_cb8R1_ratio
EOF
cd scratchpad/c4-U2/LeanProject && lake env lean work/AxiomCheck.lean > work/axioms.log 2> work/axioms.err.log
```
Exit 0. `work/axioms.log` (SHA-256 `7c6b671fd8b2e65e30c7d63214fcd02609ae0e47edaef7f03d2f871c91ce19e4`):
```
'E993Transport.cb8_activeWeight_leafSet_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'E993Transport.cb8Rho_one_eq_cb8R1_ratio' depends on axioms: [propext, Classical.choice, Quot.sound]
```
`work/axioms.err.log` empty. `work/AxiomCheck.lean` SHA-256:
`ba74f04194e557369f4e29604542b83475d5882a652a11bfbeb928cd8e28c136`. Final
`Statements.lean` SHA-256 (post-fix): `2c1ee236fbbb10fdfd22225ff6108afe98c3c6bf6df09e131ba0d3c3d4c174d0`
(568 lines).

**No axiom beyond `propext, Classical.choice, Quot.sound` — no `sorryAx` — for either declaration.**
This matches the axiom profile gate ruling 25 requires of the Cycle 4 base itself.

**Diagnosis record (superseded by CF-C4-S3-1, kept for the successor's benefit):** this route's
own earlier hypothesis (network stall on plain `lake build`; slow Mathlib rebuild under
`--no-cache`) is now known to be incomplete/wrong per the controller's fact: the true cause of
attempts 1, 3 and 5's silence was cold elaboration of the 2.4 MB `Main.lean` with no output until
done (not network), and attempt 4's slow progress under `--no-cache` was that flag actively
discarding the locally-valid Mathlib cache (not a genuine uncached-Mathlib-subset requirement). The
fix was solely to use a pre-built `.lake/build` (never `--no-cache`) and to run in the foreground
long enough for the (now fast, ~10–20s) replay-plus-recompile to finish.

## `## Instrument sides` heading requirement

Satisfied above (the table under "Instrument sides").

## Two-part model disclosure

chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported model
id: claude-sonnet-5.

## `## Read-boundary disclosure`

None beyond what the common brief and this route's own dispatch explicitly authorize. Every file
read is one of: the two restricted-boot files; the dispatch itself; the six control files named in
the dispatch's reading order (`C4-WORKER-COMMON-BRIEF.md`, `C4-STAGE2-PACKET-MANIFEST.json`,
`SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `C4-ALLOCATION.md`, `C4-STAGE1-GATE.md`,
`ROUTE-STATE.md`); `control/C4-FROZEN-STATEMENTS.lean`/`.md` (digest-verified, explicitly named by
the dispatch); `sources/c4-base/**` (digest-verified against its own `SOURCE-DIGESTS.json`);
`sources/c3-scratch-lean/c3-U3/LeanProject/LeanProof/Main.lean` (entry 608 only, explicitly listed
in the common brief's `sources/` grant); Mathlib sources under
`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project` (explicitly authorized
"for API meaning" — used only to look up `Finset.filter_product`/`card_biUnion`/`filter_filter`
signatures while planning N6's proof; none of that lookup materially changed the plan actually
used). No sibling return, critic file, adjudicator file, other experiment root, or any VerityOS
file outside the run root and the two boot files was read. No recursive listing or glob search was
issued rooted above this route's grant (`sources/`, `scratchpad/c4-U2/`,
`scratchpad/c4-U2-replay/`, and the Mathlib package directory); every `grep`/`find` call was scoped
to one of those directories or to specific named files under `sources/c4-base` and
`sources/c3-scratch-lean/c3-U3/…/Main.lean`. As with the frozen-statements drafter's own disclosure
(`control/C4-FROZEN-STATEMENTS.md` §Process disclosures item 4), the harness placed the project
`CLAUDE.md`, the user's auto-memory index and the user's e-mail into context before the first tool
call; none of that was opened, cited, or acted on — the dispatch's restricted boot and single
write-location instruction supersede it.

## Process and interruption disclosures

**First host interruption.** The controller session was interrupted at approximately 08:55 EDT
2026-09-28, mid-way through drafting the N6 Lean proof text (the file edit adding the `import
LeanProof.C3LA1` line had just completed). On resumption, this route verified that both prior build
PIDs (41999, 44370) no longer existed, that the deliverable `RETURN.md` had not yet been written,
and that no scratch write had occurred outside the assigned directories, then continued: it
completed the N6/N7-companion Python verification run that had been left mid-flight (an empty
`run2.out.json`/`run2.err.log` pair from before the interruption was overwritten by a completed
run), copied the script and its result to the replay directory, restarted the Lean base build
(PID 15519), and proceeded to draft the N7-main partial proof.

**Second host interruption.** The controller session ended at approximately 10:02 EDT 2026-09-28
and resumed at approximately 22:46 EDT 2026-09-28, again before `RETURN.md` was written. On
resumption, this route verified that PIDs 15519 and 16544 no longer existed (both build attempts
had died, or been reaped by the host, without completing), reset this route's own (never the
shared Mathlib project's) `.lake/build` directory to clear a partial, `--no-cache`-triggered
Mathlib rebuild, and made one further FOREGROUND build attempt (`timeout 290 lake build LeanProof`,
per the coordinator's explicit instruction to rerun in the foreground this time), which produced no
output before the bound elapsed. This route then stopped attempting further builds and wrote this
RETURN.md (first version: verdict `bounded_evidence`, `FROZEN_NODES_CLOSED: none`).

**Third resumption (same wall-clock session as the second interruption's resumption; no further
host interruption occurred).** The coordinator sent controller fact CF-C4-S3-1 (R31-N-26):
Stage 3 was not yet sealed, so this RETURN.md could be updated; the build stalls were diagnosed by
the controller as cold-elaboration cost (not network), and `--no-cache` was identified as
counter-productive (it discards the valid local Mathlib cache). The coordinator supplied a
pre-built cache at `scratchpad/c4-base/LeanProject/.lake/build` (built from bytes identical to
`sources/c4-base`) and instructed: verify byte-identity of the four unmodified `.lean` files, copy
the cache in, run `lake build LeanProof` in the foreground (never `--no-cache`), kernel-check with
`#print axioms`, and update this RETURN.md with the actual outcome. This route did exactly that:
verified byte-identity (all four files matched `sources/c4-base` exactly), removed its own stale
`.lake/build` and replaced it with the controller's copy (`.lake/packages` symlink untouched), ran
`lake build LeanProof` in the foreground (attempt 6: exit 1, five genuine `omega` failures in this
route's own N6 proof, all the same class of bug — a discarded finite-range bound — fixed at five
sites; attempt 7: exit 0, `Build completed successfully (8661 jobs)`), ran the axiom check (both N6
and the N7 companion: `[propext, Classical.choice, Quot.sound]`, no `sorryAx`), and rewrote the
affected sections of this RETURN.md (Grades, Lean build status, `FROZEN_NODES_CLOSED`, Gate lines,
Route verdict, Remaining obligation, Instrument sides) to report the actual, now-successful
outcome. No further Lean work (N7 main clauses (3)-(4)) was attempted after the successful build,
given the time already spent on this route's build-tooling detour across three sessions; this is
disclosed, not concealed, in "Remaining obligation."

**PID discipline.** Every Lean build was started with a literal PID captured at launch
(`echo "PID=$!" > …pid`) and polled only via `kill -0 <PID>`/`ps -p <PID>` on that literal PID —
never a full process listing (`ps aux`, `ps -ef`, `pgrep -f`, `pgrep -l`, `top`) at any point in
this route, across either interruption. The one `kill <PID>` issued (against PID 15519, itself
already dead by the time of the second resumption) targeted only a PID this route itself had
started. The final build attempt (attempt 5) ran synchronously under `timeout`, which returned
control to this route after its bound; no PID was captured for it because it was never
backgrounded, and this route accordingly cannot issue a further literal-PID check against it — this
is disclosed rather than worked around by a name-based search, which the dispatch forbids. Every
background job this route itself started and tracked by PID was, by the time this return was
written, confirmed no longer running via its own literal PID. Attempts 6 and 7 (the successful
kernel-check builds) and the axiom-check invocation likewise ran synchronously in the foreground
(no `&`/`nohup`, per the coordinator's instruction), completed to their own exit codes within
seconds, and left no background process; no literal PID was captured or needed for them since they
were never backgrounded and returned control on their own. `--no-cache` was never used again after
the coordinator's fact; every build in this third resumption used plain `lake build`/`lake env
lean`.

**One out-of-location write, corrected in-session (first session, before either interruption).**
None — no such event occurred in this route (unlike the frozen-statements drafter's own disclosed
incident); all scratch writes were made directly under `scratchpad/c4-U2/` and
`scratchpad/c4-U2-replay/` from the first command onward.

## Route object status: `FROZEN_NODES_CLOSED`

`FROZEN_NODES_CLOSED: N6, N7-companion` — i.e. `E993Transport.cb8_activeWeight_leafSet_eq` and
`E993Transport.cb8Rho_one_eq_cb8R1_ratio` both compile sorry-free on the Cycle 4 base
(`sources/c4-base/` plus the controller-supplied build cache, itself built from bytes identical to
`sources/c4-base`) with axioms `propext, Classical.choice, Quot.sound` only (`work/axioms.log`,
verified above) — exactly gate ruling 25/32's compile criterion. N7's third declaration,
`cb8_flowBundle_of_arcSpecs`, is NOT closed: clauses (1)-(2) compile sorry-free (part of the same
successful `lake build LeanProof` run) but clauses (3)-(4) remain `sorry`, so the declaration as a
whole still carries a `declaration uses sorry` warning and does not close its node. Final
`Statements.lean` SHA-256: `2c1ee236fbbb10fdfd22225ff6108afe98c3c6bf6df09e131ba0d3c3d4c174d0`
(568 lines).

## Gate lines (ruling 32)

- `COND4_formal: partial — N6 and the N7 companion closed sorry-free this cycle; N7's third
  declaration (the Out/In bundle) is not closed` — conjunct 4 (Tier 1's one open formal node) is
  still not closed overall (N1, N3, N4, N5, N8 remain `sorry`, owned by other seats), but two of
  its eight frozen leaves are now build-confirmed closed by this route.
- `E1_formal: not this route's object` — the E1 half (N1/N2) is T1's/U1's remit; this route did not
  touch N1's or N2's proof obligations (only cited N2's already-frozen clause text as a hypothesis
  of N7, unchanged; N2 itself is still `sorry` in this build).
- `TERMINAL_integration: not this route's object` — the terminal stitch (N8, U3's remit) is
  untouched and still `sorry`; this route's N7 conclusion is exactly N8's hypothesis, unchanged
  from the frozen text.
- `cut_candidate: none` — this route (orientation U, not F) did not search for and did not find any
  deficient cut; nothing here is evidence toward or against outcome C.
- `FROZEN_NODES_CLOSED: N6, N7-companion` — see above (the precise declaration names:
  `cb8_activeWeight_leafSet_eq`, `cb8Rho_one_eq_cb8R1_ratio`).

## `headline_resolved`

`headline_resolved: no` — per the dispatch, a route answer is never `yes` (the headline is Tier 1
`formally_verified` at Stage 7, or a confirmed eligible cut after two instruments and an isolated
second read; neither is this route's product, and a compiled scratch declaration is explicitly not
`formally_verified` until its governed award closes, Solution Contract §4).

## Route verdict

`compiled` — two of this route's three frozen-node declarations (N6, the N7 companion) compile
sorry-free on the Cycle 4 base with axioms `propext, Classical.choice, Quot.sound` only, backed by
a build log (`build-kernelcheck2.log`, exit 0, `Build completed successfully (8661 jobs)`, 0
`error:` occurrences) and an axiom log (`work/axioms.log`), per Solution-Contract §4 / obligation
11. This verdict is `compiled`, never `formally_verified` (reserved for a governed award at Stage
7) and never `proved`/`proved_informal` (this route does not hold registration authority over a
gate leaf statement). The third declaration, N7 main (`cb8_flowBundle_of_arcSpecs`), is only
partially compiled (clauses (1)-(2) sorry-free; clauses (3)-(4) `sorry`, with a complete
hypothesis-by-hypothesis informal derivation on record above) and does not by itself upgrade or
downgrade the route's overall `compiled` verdict, which is reported at the level of "at least one
frozen node closed sorry-free, backed by build+axiom logs, with the remainder honestly disclosed as
open."

## Remaining obligation (successor inheritance)

1. **N7 main** (`cb8_flowBundle_of_arcSpecs`), clauses (3)-(4): the ONLY remaining Lean work this
   route did not finish. The complete, hypothesis-by-hypothesis informal derivation is above
   ("Derivation" §N7 main); it needs to be turned into Lean tactics against the NOW WORKING build
   (`scratchpad/c4-U2/LeanProject`, with the controller's cache already in place — see "Lean build
   status" — so a successor's edit-compile loop should take seconds per iteration, not minutes,
   exactly as attempts 6-7 demonstrated). The two genuinely new pieces of mathematical content a
   successor needs are (a) the independence-extraction step "`r ∈ B` (or `A`), `B` (or `A`)
   independent `⟹ ∀i<m, u_i ∉ B`" (one line via `cbGraph_adj_r_choke` plus the `IsIndepSet`
   extracted from `indepFamily` membership, exactly as `cb8E1Arc_shape`'s own proof does inline in
   `E1FlowConstruction.lean` — worth a named companion lemma if more than one route needs it) and
   (b) the boundary-case closure of the Switch/Residual arithmetic at `γ∈{0,8}` via `cb8CGamma`'s
   `| _ => 0` fallback (Main.lean entry 82; not previously named anywhere in the Cycle 3/4 record
   this route read).
2. **Build tooling, now resolved — the correct recipe for any future Cycle 4 seat**: copy
   `scratchpad/c4-base/LeanProject/.lake/build` into a fresh scratch project's `.lake/build`
   (`.lake/packages` remains the manual symlink to the shared Mathlib project), verify the four
   unmodified `.lean` files (`Main`, `ChokeState`, `E1FlowConstruction`, `C3LA1`) are byte-identical
   to `sources/c4-base/LeanProject/LeanProof/*` first, then run plain `lake build LeanProof` in the
   FOREGROUND (no `--no-cache`, ever — it discards the valid local cache and forces a slow
   Mathlib-subset rebuild, as this route's attempt 4 demonstrated). Expect ~10-20 seconds total.
3. **A genuine second (independent, sampled/literal) instrument for N7 main's clauses (3)/(4)** is
   still owed beyond this route's Python check (which covers N6 and the N7 companion only): an
   exhaustive/sampled literal check of the full Out/In bundle bound is explicitly F2's mandatory
   object, `COMPOSED-FLOW-PER-TARGET-AT-FRESH-ROWS`, not this route's.
4. **This route's compiled declarations are scratch, not a governed award** (Solution Contract §4):
   Stage 7 should fund an award whose terminal is N6 and/or the N7 companion (or their conjunction
   with N7's other clauses once closed) if the synthesis judges them Stage-7-worthy, per gate ruling
   31's list of expected candidates (which already names "the weight formula (N6)" as an expected
   candidate).

## IMPORT LIST duplication (top-of-return, restated per obligation 7)

```
import itertools
import random
import hashlib
import json
from fractions import Fraction
from math import comb
```
