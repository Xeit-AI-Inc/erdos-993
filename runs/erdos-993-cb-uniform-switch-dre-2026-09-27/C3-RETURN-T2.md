# Return — route T2, Cycle 3, r31 (a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank)

**Route ID:** `C3-T-02`. **Mechanism token:** `E1-TYPE-PATH-RHO-BRIDGE-AND-ADAPTER`. **Orientation:** T (prove).

**Model disclosure (two parts):** chartered sonnet/high; transport-resolved model sonnet (explicit parameter); runtime-reported
model id: `claude-sonnet-5` (the exact model ID my runtime reports for itself, per this session's system prompt; verbatim).

## Boot acknowledgment

I am operating within VerityOS. Boot files, read in full, and nothing else from VerityOS proper: `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. Per the dispatch, I did not follow the startup protocol's own
task-type map into memory, conversations, modules, skills, logs or decisions; the controller has booted for the run.

## Read-boundary disclosures (every deviation)

1. **Host injection.** The host placed the project `CLAUDE.md` and the user auto-memory index (`MEMORY.md`) into my context as
   system-reminders before my first action. I did not open either file myself and used nothing from them; I followed the
   dispatch's boot restriction (the two files above, nothing else), not `CLAUDE.md`'s own boot instructions.
2. **Two directory operations on `control/`.** I ran `find control -maxdepth 1 -iname "*OBLIGATIONS*"` and `ls control/ | grep -i
   "CLAIM-IDENTITY\|OBLIGATIONS"` to locate `OBLIGATIONS.csv`, which `C3-WORKER-COMMON-BRIEF.md` names among the run-local
   registry files to read. `control/` is not explicitly named as within the search grant (only `sources/`, the Mathlib package
   directory and my own scratch directory are), so recording this as a boundary item even though both commands were single,
   narrowly-scoped, non-recursive directory listings, not an open-ended search. Result: `OBLIGATIONS.csv` was not found at
   `control/OBLIGATIONS.csv`; I did not search further and proceeded without it (it is not load-bearing for this route's
   two-binomial-coefficient content).
3. **No other deviation.** Every other read was either an explicitly dispatched file, a file under `sources/` (in grant) reached
   by non-recursive `ls`/targeted `grep -r` rooted at `sources/` itself (in grant) or `grep` on named files, or a Mathlib source
   file under `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/mathlib` (explicitly
   authorized "for API meaning"). No `find`/`grep`/`ls -R` was rooted above `sources/`, `control/` (see item 2) or my own
   scratch. All writes: only under `scratchpad/c3-T2/` and `scratchpad/c3-T2-replay/`, plus this file and its directory.

## Stage 2 seal

Recomputed SHA-256 of the canonical JSON of `control/C3-STAGE2-PACKET-MANIFEST.json` without `seal_sha256` (`sort_keys=True`,
separators `(",", ":")`, no trailing newline): `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`. **Match** against
the manifest's declared `seal_sha256`.

Every carried Lean source fragment I use is digest-verified against `sources/c1-results/SOURCE-DIGESTS.json` (the per-file
digest map for the Cycle 1 record), not the run-root `sources/SOURCE-DIGESTS.json` (which is the earlier, 2026-09-27 ~22:10
authority-ledger snapshot and predates the Cycle 1/2 Lean runs, so it does not list them). All 24 carried files matched (see
"IMPORT LIST / carries" below).

## Route object (from `control/C3-ALLOCATION.md`, T2 row)

> Object: Group C nodes (c) (ii-1)/(ii-2) as `Finset.sum` inequalities and (d) `ρ_q ≤ 1` for `1 ≤ q ≤ m` from carried C1-LA3
> entry 20 plus entry 14; the `cb8R1` coefficient bridge (R-4); the zero-weight classification of non-sector sources; and the
> adapter lemma "`cb8E1Arc_spec_topRank` ⇒ U2's E1 hypothesis". Could close: every interface node compiled, so U2's hypothesis
> and T3's specification meet in Lean.

Load-bearing obligation: node (c)/(d) plus the `cb8R1` bridge (R-4), all named in Cycle 2's synthesis (`## Next-cycle portfolio`,
item T2) as the interface content between the E1 flow's two independently-authored Lean vocabularies (C1-LA3's `ℤ[X]`
coefficient form and C1-LA1's `cb8R1` finite sum).

## Registered claims touched (named before any computation is presented as evidence; SEMANTIC-CONTRACT.md §4)

- `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` (condition (i) at `p*`;
  `proved_informal` modulo Darroch on the `r_q`) — **cited, not re-proved.** My `cb8Rho_le_one`/`cb8Rho_lt_one` restate this
  key's conclusion in explicit ratio form, consuming the ALREADY-CARRIED, kernel-checked Lean instance
  (`cb8_E1_conditionI_topRank`, entry 20) plus positivity (`twoBinomCoeff_pos`, entry 14); no new proof of condition (i) itself.
- `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`) — **touched only by
  context**: my TP-g result is a Lean-level instance of one half of this key's condition (ii) dependency (CD-2); it does not
  discharge the key, which also needs TP-h and the graph-level (`cbGraph`) wiring owned by U1/U2/T3.
- `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (HALL, OPEN) and `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN) —
  **not touched**: nothing in this return bears on either aggregate key; my content is Tier 3 (carried-dependency) interface
  work only, per SOLUTION-CONTRACT.md §1.
- No other registered key is confirmed, re-derived, or relied upon beyond citation.

**No new claim is proposed for registration.** Everything below is `scratch`/no-grade compiled content (SOLUTION-CONTRACT.md §4,
last clause; `C3-WORKER-COMMON-BRIEF.md` point 8's closing sentence), consumed by name, not registered.

## Alias check (lexical and mathematical; a separate step, since no claim is proposed — a defensive check only)

- **Lexical.** None of my declaration names (`cb8R1_eq_coeffQ`, `cb8Rho_le_one`, `cb8Rho_lt_one`, `cb8Rho1_eq_cb8R1_ratio`,
  `Nterm`, `rr`, `rr_eq_coeff`, `fB`, `Sterm`, `Tterm`, `rz`, `likelihood_ratio`, `cb8_typePath_ii1`) match or resemble any
  `E993-*` key in `sources/authority/CLAIM-IDENTITY.json` or the run-local registry `control/CLAIM-IDENTITY.run-local.json`
  (checked by the grep of `sources/` for `cb8R1`/`type-path`/`X-9` above, which surfaces every file that names these objects;
  none is a registered-claim key, all are Lean declaration names or synthesis prose labels).
- **Mathematical.** None of my lemmas restates a FULL registered theorem in new words: `cb8R1_eq_coeffQ` is a vocabulary
  bridge between two carried, already-graded objects (not a new mathematical fact about `CB(8,m)`); `cb8Rho_le_one`/
  `cb8Rho_lt_one` are direct corollaries of one already-carried, already-graded lemma (`cb8_E1_conditionI_topRank`) plus
  positivity; `cb8_typePath_ii1` is new — it is a Lean formalization of TP-g/(ii-1), which is `proved_informal` STATED as part
  of X-9 in the Cycle 2 synthesis but has **no prior Lean compilation** anywhere in the frozen record I read (`sources/c2-stage7-sources/crit-T3-U/lean/LeanProject/LeanProof/*.lean` contains `CriticE1Explicit.lean`, `T3Skeleton.lean` — DRAFT scratch,
   never a carry — which I did not read in full and did not consume; my proof is independent, from the carried entry 15
  `twoBinomCoeffZ_strongLC` directly). No alias risk: this is new, narrowly-scoped scratch, not a claim.
- **Refuted-mechanism check (ruling 20).** T2's own two-binomial *ascent* tool (`G′`) is REFUTED; I use none of it. My
  machinery is entry 15's strong log-concavity (`twoBinomCoeffZ_strongLC`, a *descent*/two-by-two-minor fact, carried and
  already kernel-checked) plus the commutative binomial theorem (`Mathlib.add_pow`) and convolution (`Polynomial.coeff_mul`).

## Step-by-step derivation (where each hypothesis enters)

All Lean line numbers refer to `scratchpad/c3-T2/LeanProject/LeanProof/Main.lean` (SHA-256
`c11f62aa26e237ecd3ab8fdbb7dc2c762a388c479d7a08b09e7577f1d4b5b9d0`), which compiles with `lake env lean` under the pinned
toolchain, zero errors, zero `sorry` (see "Axiom check" below).

### 1. The `cb8R1` coefficient bridge (R-4) — `cb8R1_eq_coeffQ`, line 564

**Target (Cycle 2 synthesis, R-4):** `(((1+X)^7·(1+2X)^(8m-7) : ℤ[X]).coeff k : ℚ) = (cb8R1 m k : ℚ)`, linking C1-LA3's `ℤ[X]`
coefficient vocabulary (used by `cb8_E1_conditionI_topRank`, condition (i)) to C1-LA1's `ℕ` finite-sum `cb8R1` (used by the
sector-template LP, `cb8_sectorTemplate_residual`). Before this bridge, "no carried declaration links them" (synthesis R-4).

**Derivation.**
1. `coeff_one_add_two_mul_X_pow` (line 537): `((1+2X)^b).coeff k = C(b,k)·2^k` in `ℤ[X]`, via the commutative binomial theorem
   (`Mathlib.add_pow`, applied at `x = 2X`, `y = 1`) plus `Polynomial.coeff_C_mul_X_pow`'s `if n = k` case split. This is a
   *new*, from-scratch Lean fact (not in Mathlib's own API for scaled linear factors — I checked
   `Mathlib.Algebra.Polynomial.Coeff` for a ready-made `coeff_one_add_cX_pow`; only `coeff_X_add_C_pow`/`coeff_one_add_X_pow`
   exist, for the *unscaled* linear factor).
2. `((1+X)^7·(1+2X)^(8m-7)).coeff k = Σ_{ij ∈ antidiagonal k} coeff((1+X)^7) i · coeff((1+2X)^(8m-7)) j`
   (`Polynomial.coeff_mul`), rewritten to a `range(k+1)` sum via `Finset.Nat.sum_antidiagonal_eq_sum_range_succ`.
3. Each term `i ∈ range(k+1)`: `coeff((1+X)^7) i = C(7,i)` (`Polynomial.coeff_one_add_X_pow`, Mathlib), `coeff((1+2X)^(8m-7))
   (k-i) = C(8m-7,k-i)·2^(k-i)` (step 1). Product `= C(7,i)·C(8m-7,k-i)·2^(k-i)`, matching `cb8R1`'s own summand exactly.
4. `cb8R1`'s sum ranges over `range(min 7 k + 1)`, not `range(k+1)`; `Finset.sum_subset` (extending the smaller range) closes
   the gap, using `Nat.choose_eq_zero_of_lt` to show the extra terms (`i > 7`) vanish.
5. Cast `ℤ → ℚ` (`exact_mod_cast`).

**Where hypotheses enter.** `m ≥ 107`, `m ≡ 2 (mod 3)` enter *nowhere*: the bridge holds for every `m, k : ℕ` (the shape
`8m − 7` needs no lower bound on `m` in `ℕ`, since `8*m - 7` truncates gracefully and both sides use the same expression). This
matches the Cycle 2 synthesis's description of R-4 as a pure vocabulary link.

**Numeric corroboration:** `scratchpad/c3-T2/verify_t2.py`, Part A — an independent convolution evaluator (loops over the
*other* binomial's index, not the same code path as the Lean proof or as `t3_twobinom.py`'s `r_coeff`), checked at
`m ∈ {95,107,110,113,116,119,122,137}`, `k ∈ [0,60)`: 480/480 match, 0 failures.

### 2. Node (d): `ρ_q ≤ 1` for `1 ≤ q ≤ m` — `cb8Rho_le_one`/`cb8Rho_lt_one`, lines 594/607; `cb8Rho1_eq_cb8R1_ratio`, line 622

**Derivation.** Direct: `cb8_E1_conditionI_topRank m q hm hmod hq1 hqm` (entry 20, carried byte-identical, already
kernel-checked in C1-LA3) gives the strict coefficient descent `r_q(p*−q) < r_q(p*−q−1)` in `ℤ[X]` form. `twoBinomCoeff_pos
(8q−1) (8(m−q)+1) (p*−q−1) (by omega)` (entry 14, carried) gives positivity of the denominator, needing `p*−q−1 ≤ (8q−1)+(8(m−q)+1)
= 8m`, closed by `omega` from `hm : 107 ≤ m`, `hq1 : 1 ≤ q`, `hqm : q ≤ m` (the *only* place these three hypotheses enter this
lemma: bounding the index, not the arithmetic of the ratio itself). `div_lt_one`/`div_le_one` (Mathlib, needing the positive
denominator) convert the coefficient inequality to the ratio form. `cb8Rho1_eq_cb8R1_ratio` specializes to `q = 1` and rewrites
both sides through the R-4 bridge, giving `ρ_1` literally as `cb8R1 m K / cb8R1 m (K−1)`, `K = p*−1` — the exact phrasing of
Cycle 2's synthesis R-4 paragraph.

**Numeric corroboration:** Part B — `ρ_1` at `m = 107` and `m = 95` matches the two fixed points of record
(`SEMANTIC-CONTRACT.md` §5) exactly: `5150844596024699/5173467627355748` and `1354839571516225/1361543988640524`. The strict
form checked for every `1 ≤ q ≤ m` at the three named fresh/control rows `m ∈ {107, 110, 113}` (gate ruling 17's control rows):
0 failures across `107+110+113 = 330` checks.

### 3. Node (c), TP-g / (ii-1) — `likelihood_ratio` (line 724), `cb8_typePath_ii1` (line 745)

**Target:** for every `α ≤ a`, `r(j)·T_{≤α} ≥ r(j−1)·S_{≤α}` (`S_α := N(a,b,α,j)`, `T_α := N(a,b,α,j−1)`, `r(k) :=
((1+X)^a(1+2X)^b).coeff k`), as a `Finset.sum` inequality over `Finset.range(α+1)`.

**Derivation, following SR-C4-6's elementary (unconditional, unproved-in-Lean-until-now) proof.**
1. **Likelihood-ratio lemma** (`for x < y: S_x·T_y ≤ S_y·T_x`): derived, *not reproved*, from the ALREADY-CARRIED entry 15
   (`twoBinomCoeffZ_strongLC`), specialized at `a = 0`. At `a = 0`, `(1+X)^0·(1+2X)^b` degenerates to the pure `(1+2X)^b`
   sequence (`fB b`, matching `f` in SR-C4-6), so entry 15's general strong log-concavity (`∀ i ≤ j: polyCoeffZ(i−1)·polyCoeffZ(j+1)
   ≤ polyCoeffZ(i)·polyCoeffZ(j)`) instantiated at `i := j−y`, `j' := j−1−x` (valid since `i ≤ j'` reduces to `x+1 ≤ y`, i.e.
   `x < y`) gives exactly `f(j−1−y)·f(j−x) ≤ f(j−y)·f(j−1−x)`, i.e. `S_x·T_y ≤ S_y·T_x` after multiplying by the common
   nonnegative factor `C(a,x)·C(a,y)`. **No new log-concavity argument was written**; this is entirely a specialization of
   already-carried, already-kernel-checked content — the shortest path I found once I recognized entry 15's statement is
   already the "strong" (non-adjacent) form SR-C4-6 had to build from adjacency by hand.
2. **Telescoping sum.** `Σ_{range(a+1)} S = r(j)`, `Σ_{range(a+1)} T = r(j−1)` (`sum_Sterm`/`sum_Tterm`, via `Sterm_eq_Nterm`/
   `Tterm_eq_Nterm` bridging to the general convolution identity `rr_eq_coeff`, itself the `cb8R1` bridge's proof generalized
   from `a = 7` to every `a`). Splitting each total sum at `α` (`Finset.sum_range_add_sum_Ico`) and algebraically reducing
   (`goal_eq`, closed by `ring` after substitution) shows the target inequality is *equivalent* to `S_{>α}·T_{≤α} ≥
   T_{>α}·S_{≤α}`, i.e. a double-sum comparison over the "cross" pairs `x ≤ α < y`, each termwise bounded by step 1
   (`Finset.sum_mul_sum` + `Finset.sum_le_sum`, nested).
3. **Degenerate case `j = 0`.** Handled separately (`by_cases hj : 1 ≤ j`): `T_α ≡ 0` for every `α` (its index `j−1−α = −1−α
   < 0` always) and `r(j−1) = r(−1) = 0` (`polyCoeffZ_of_neg`), so both sides of the target are `0`.

**Where hypotheses enter.** Only `α ≤ a` (bounding the split point inside the sum range) and, internally, `x < y` in the
likelihood-ratio step. `m ≥ 107`, `m ≡ 2 (mod 3)` do not enter at all — like SR-C4-6 found, TP-g holds for *every* `a, b ≥ 0`
and every `j : ℕ`, independent of the CB(8,m) class. This lemma is stated and proved at that generality (not specialized to
`(8q−1, 8(m−q)+1, p*−q)`), matching X-9's own registered generality ("for all `a, b ≥ 0`, every `j`").

**Numeric corroboration:** Part C — grid `a,b ∈ [0,25)`, `j ∈ [−2,a+b+3)`, plus the three class rows `m ∈ {107,110,113}` at
every `1 ≤ q ≤ m`: **18,455 `(a,b,j)` checks total** (each scanning every `α ≤ a` internally), **0 failures**.

**Axiom check** (`#print axioms`, run against a scratch copy with the four `#print axioms` lines appended, then discarded —
not part of the shipped `Main.lean`): `cb8R1_eq_coeffQ`, `cb8Rho_le_one`, `cb8Rho_lt_one`, `cb8Rho1_eq_cb8R1_ratio`,
`likelihood_ratio`, `cb8_typePath_ii1` each depend only on `[propext, Classical.choice, Quot.sound]` — the three standard
Mathlib axioms, **no `sorryAx`**. Every declaration in `Main.lean` is sorry-free (confirmed also by the plain `lake env lean`
compile producing zero errors and zero `sorry`-use warnings).

## What is NOT done (node (c) TP-h, the zero-weight classification, the adapter lemma)

**TP-h / (ii-2)** — **not proved.** Target: `r(j−1)·S_{≤α} ≥ r(j)·T_{<α}`. I reduced it (by the same total-sum-splitting
algebra as TP-g) to `S_{>α}·T_{<α} ≤ S_{≤α}·T_{≥α}`, but this does **not** follow from the same `x < y` likelihood-ratio lemma
by the same double-sum argument: the "cross pairs" on the two sides of this reduced inequality are `S_y·T_x` (`x < α < y`,
matched against the LIKELIHOOD-RATIO's *larger* side) versus `S_x·T_y` for `x ≤ α ≤ y` (a strictly larger, overlapping index
set including the diagonal `x = y = α`), so a naive termwise pairing bounds the wrong direction — I verified this by hand
(worked the algebra through twice) before stopping, rather than shipping an incorrect lemma. SR-C4-6's own elementary proof of
TP-h needs a *second*, structurally different likelihood-ratio lemma (their β-substitution: reindex by `β := a − α`, apply the
log-concavity lemma with `C(a,·)` as the "without-internal-zeros" factor instead of `f`, i.e. specialize entry 15 at `b = 0`
instead of `a = 0`, then reconcile the reindexed sum back to the `α`-indexed one). I did not find a shortcut through
already-carried content the way I did for TP-g, and building the β-substitution machinery from scratch was not something I
could responsibly complete and verify (compile + hand-check the reduction) to the same standard as the rest of this return
inside this dispatch. **This is the smallest remaining node of (c).** I numerically corroborated (Part D of
`verify_t2.py`, same grid and class rows as Part C: 18,455 checks) both TP-h itself and my algebraic reduction: 0 failures on
either — so the target is true and the reduction is a valid intermediate step; only its formal proof is open.

**The zero-weight classification** ("a non-sector source of positive weight is `r`-free with `q ≥ 1`") and **the adapter lemma**
("`cb8E1Arc_spec_topRank` ⇒ U2's E1 hypothesis") are both statements about the **literal graph** `cbGraph m` (vertices, edges,
`leafSet`, active-tag weight, independent sets) — C1-LA2's definition layer, which I did not carry into this project. My
carries are exactly C1-LA3 (the two-binomial polynomial machinery) and C1-LA1's `cb8R1`/`cb8R1_expand_top`/`cb8R1_expand_sub`
(a `ℕ` finite sum with no graph dependency); neither the dispatch nor the common brief directed me to carry C1-LA2, and doing so
responsibly (byte-identical carry, digest-verified, plus re-deriving or importing `favorableLeaves`, `IsSaturatingFlow`, the
literal (D)/(S) arc relations) is a substantially larger undertaking that overlaps directly with U1/U2/T3's own Cycle 3
objects. I judged it out of scope for this route within this dispatch and did not attempt a partial/unverified version of it.
Both are named in `## Remaining obligation` below.

## Grades

- `cb8R1_eq_coeffQ`, `cb8Rho_le_one`, `cb8Rho_lt_one`, `cb8Rho1_eq_cb8R1_ratio`, `likelihood_ratio`, `cb8_typePath_ii1` (TP-g):
  **compiled** (sorry-free Lean, kernel-elaborated; no grade of their own per SOLUTION-CONTRACT.md §4 until a governed award
  closes around them — they are scratch infrastructure, not a registered or registrable claim).
- TP-h / (ii-2): **not compiled** (open node; numerically `bounded_computation`-level corroboration only, via
  `verify_t2.py` Part D, itself uncertified as a proof).
- Zero-weight classification, adapter lemma: **not attempted** (blocked on the `cbGraph` carry; see above).
- Every input this return cites (`twoBinomCoeffZ_strongLC`, `cb8_E1_conditionI_topRank`, `twoBinomCoeff_pos`, `cb8R1`,
  `cb8R1_expand_top/sub`) keeps its own grade unchanged: the carried entries are kernel-checked scratch inside their own
  (still-open, not-yet-Stage-7-closed) runs C1-LA3/C1-LA1; nothing here upgrades them.

## IMPORT LIST

`Main.lean`: `import Mathlib` (the pinned Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`, bound read-only by manual symlink,
verified against `sources/mathlib-binding/PIN.json`). No other import. `verify_t2.py`: `json`, `math.comb`, `fractions.Fraction`
— Python standard library only, `python3 -B` throughout, exact integers and `Fraction`.

## Carries (byte-identical; digest-verified against `sources/c1-results/SOURCE-DIGESTS.json` before use)

C1-LA3 (`lean-2026-09-28-c1-la3-two-binomial-descent`), entries 1–21 (all 21, `polyCoeffZ` through `cb8_block_descent_topRank`).
C1-LA1 (`lean-2026-09-28-c1-la1-cb8-sector-template-feasible`), entries 11 (`cb8R1`), 29 (`cb8R1_expand_top`), 30
(`cb8R1_expand_sub`). Every one of the 24 files matched its recorded SHA-256 (script output in-session; not re-shown here to
keep this return short — re-run the digest check with the command under "Replay" below).

## Lean / project setup

`scratchpad/c3-T2/LeanProject` created from the pinned shared project's `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`
(byte-copied from `sources/c1-results/runs/lean-2026-09-28-c1-la3-two-binomial-descent/LeanProject/`, itself matching the
pinned shared project's toolchain `leanprover/lean4:v4.32.2`). Mathlib bound by manual symlink:
`ln -s /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages LeanProject/.lake/packages`; never
copied, never `lake update`/`lake clean`. Mathlib revision verified: `905b95818eb32af7874a58b427f50c1711a5e96c` (matches
`sources/mathlib-binding/PIN.json`). No `lake update`/`elan` was run. No network. No package installs.

## Replay (copy-out-first; target `scratchpad/c3-T2-replay/`, never `/tmp`)

```
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2-replay/LeanProject/LeanProof
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2/LeanProject/{lakefile.toml,lake-manifest.json,lean-toolchain,LeanProof.lean} \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2-replay/LeanProject/
cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2/LeanProject/LeanProof/Main.lean \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2-replay/LeanProject/LeanProof/Main.lean
mkdir -p /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2-replay/LeanProject/.lake
ln -sf /Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2-replay/LeanProject/.lake/packages
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2-replay/LeanProject
lake env lean LeanProof/Main.lean   # exit 0, 0 errors (already re-run in-session; digest of Main.lean: c11f62aa26e237ecd3ab8fdbb7dc2c762a388c479d7a08b09e7577f1d4b5b9d0)

cp /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2/verify_t2.py \
   /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2-replay/verify_t2.py
cd /Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-T2-replay
python3 -B verify_t2.py    # already re-run in-session, output byte-identical to the original (SHA-256 82c2623dc9b46bdf03e867d32d1312493da8c9c6fd9c264efe6c425b4a438eb0)
```

Both replays were executed in this session (not merely written): `lake env lean` exit 0 in the replay directory, and
`verify_t2.py`'s replay output is byte-identical to the original (diff empty). No wall-clock, PID or host field is in any
hashed output. Every job ran in the foreground; nothing was left running; nothing needed to be killed.

## Numeric claims, generators and digests

| Claim | Generator | SHA-256 | Replay command |
|---|---|---|---|
| `cb8R1` bridge, `ρ_1` fixed points, `ρ_q < 1` sweep, TP-g grid+class-row sweep, TP-h+reduction grid+class-row sweep | `scratchpad/c3-T2/verify_t2.py` | py: `04f84da579df307e24b17a44225d393a14c121849016c1e86068ce404328f8db`; out.json: `82c2623dc9b46bdf03e867d32d1312493da8c9c6fd9c264efe6c425b4a438eb0` | `cd scratchpad/c3-T2-replay && python3 -B verify_t2.py` |
| All six Lean declarations compile, sorry-free | `scratchpad/c3-T2/LeanProject/LeanProof/Main.lean` | `c11f62aa26e237ecd3ab8fdbb7dc2c762a388c479d7a08b09e7577f1d4b5b9d0` | `cd scratchpad/c3-T2-replay/LeanProject && lake env lean LeanProof/Main.lean` |

## `x`/`Δ_k` rows, acyclicity/connectivity tests

Not applicable to this route: I built no favorability table (no `x`, `Δ_k` rows reported) and no literal graph (no
acyclicity/connectivity test needed) — my object is the two-binomial polynomial coefficient machinery only, never `cbGraph`
itself. I did reproduce, as a corroboration (not a table), the two named fixed points of `SEMANTIC-CONTRACT.md` §5 that my work
reaches (`CB(8,107)/572`'s and `CB(8,95)/508`'s `ρ_1`), both matching the record exactly (see "Numeric corroboration" under
node (d) above).

## Gate lines (ruling 21 of `control/C3-STAGE1-GATE.md`, which explicitly replaces ruling 14; the common brief's reference to
"gate ruling 6" appears to be inherited template text from an earlier cycle's brief — ruling 21 is what is actually binding
for Cycle 3, and I use its names)

- `COND4_formal: not_advanced` — conjunct 4's own graph-level Lean statement (`IsSaturatingFlow (cbGraph m) ...`) was not
  touched; my content is polynomial-level infrastructure that a successor consuming the `cbGraph` layer would need.
- `E1_formal: not_advanced` — by the same reasoning; the E1 flow's own Lean construction (`cb8E1Arc_spec_topRank` and its
  graph-level realization) was not built. What *is* new and reusable: the named interface gap between C1-LA3's and C1-LA1's
  vocabularies (Cycle 2 synthesis R-4) is now closed in scratch, and TP-g is now compiled where it was previously only
  `proved_informal` STATED prose — both are preconditions for, not instances of, `E1_formal` advancing.
- `TERMINAL_integration: not_advanced` — U3's object was not touched.
- `cut_candidate: none` — no obstruction, counterexample or template failure was found on any instrument; every numeric check
  (Part A 480, Part B 2 fixed points + 330 sweep, Part C 18,455, Part D 18,455×2) passed with 0 failures.

`headline_resolved: no`

**Route verdict: `compiled`.** Real, reusable, sorry-free Lean content was produced (the `cb8R1` bridge, both forms of node
(d), and TP-g of node (c), all newly compiled this cycle from already-carried, already-graded inputs), but the route's full
allocated object ("every interface node compiled, so U2's hypothesis and T3's specification meet in Lean") was not reached:
TP-h, the zero-weight classification and the adapter lemma remain open. This is not `proved` (the object is not fully closed),
not `blocked` (substantial, unstuck progress was made and nothing failed), and not `bounded_evidence` (the compiled content is
exact Lean, not a finite numeric sweep standing in for a universal claim) — `compiled` is the accurate label.

## Remaining obligation (successor inheritance)

1. **TP-h / (ii-2), formally.** Target: `r(j−1)·S_{≤α} ≥ r(j)·T_{<α}` (`Finset.sum` form, matching `cb8_typePath_ii1`'s
   shape with `range(α+1)` replaced by `range α` on the `T` side). The algebraic reduction to `S_{>α}·T_{<α} ≤ S_{≤α}·T_{≥α}`
   is done (see above) and numerically confirmed (`verify_t2.py` Part D, 0 failures on the same grid as TP-g). What is missing
   is a SECOND likelihood-ratio-type lemma, structurally distinct from `likelihood_ratio` in this return: SR-C4-6's route
   specializes entry 15 (`twoBinomCoeffZ_strongLC`) at `b = 0` instead of `a = 0` (making `C(a,·)` the "without-internal-zeros"
   factor) and reindexes by `β := a − α`, then reconciles the reindexed telescoping sum back to the `α`-indexed target. I
   worked out that the NAIVE termwise pairing over the SAME cross-index set as TP-g bounds the wrong direction (documented
   above); a successor should start from SR-C4-6's own text (`sources/r30/second-reads/SR-C4-6.md`, the "TP-h" paragraph) and
   build the β-indexed sequences (`S'_β`, `T'_β`) explicitly rather than trying to reuse `Sterm`/`Tterm` under a substitution.
2. **The zero-weight classification** ("a non-sector source of positive weight is `r`-free with `q ≥ 1`") — needs the
   `cbGraph` literal definition layer (C1-LA2's carry: vertices, edges, `leafSet`, active-tag weight `w_F`, the witness-support
   relation) plus the sector/non-sector case split over independent sets. Natural next step for whichever seat (T3/U1/U2) is
   already carrying C1-LA2: state and prove it as a standalone lemma consuming only C1-LA2's carried vocabulary, independent of
   this return's polynomial-level content (this return's `Sterm`/`Tterm`/`cb8Rho_le_one` etc. are ready to be cited by name
   once that seat needs `ρ_q ≤ 1` or the `cb8R1` bridge at the graph level).
3. **The adapter lemma** ("`cb8E1Arc_spec_topRank` ⇒ U2's E1 hypothesis") — per the Cycle 2 synthesis R-4 paragraph, its
   remaining content (beyond the now-closed `cb8R1` bridge and `ρ_q ≤ 1`) is exactly item 2 above (the zero-weight
   classification) plus the switch-image clause (`C-U2-F`'s `critic_switch_image_activeWeight`, cited but not carried here).
   Once both are in hand, the adapter should follow by the clause-by-clause matching the synthesis already worked out (R-4
   paragraph, "They fit, clause by clause") — mechanical Lean engineering over the graph vocabulary, not new mathematics.
4. **This return's own content is ready to be cited** by name (`cb8R1_eq_coeffQ`, `cb8Rho_le_one`, `cb8Rho_lt_one`,
   `cb8Rho1_eq_cb8R1_ratio`, `cb8_typePath_ii1`, `likelihood_ratio`) by any successor route working on U2's E1 flow
   construction or T1's in-balance double count (T1's node (b) is a different, harder piece — the clone-product biregular
   double counts — which this return does not touch).
