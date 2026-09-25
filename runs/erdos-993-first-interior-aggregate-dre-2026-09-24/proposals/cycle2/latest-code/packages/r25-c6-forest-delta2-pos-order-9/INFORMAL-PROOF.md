# Informal proof — `Erdos993G1.ForestDelta2.forest_delta_two_pos_ge_nine`

Award group `C6-LA1` (`U-AWARD-FOREST-DELTA2-ORDER-9`, registry effect
`E993-R25-FOREST-DELTA2-POS-ORDER-9`), Cycle 6 Stage 7 (the charter's LAST
cycle — no later close), run
`erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`. Formalizer
seat: Claude Sonnet 5 (chartered effort `xhigh`; the Agent transport exposes
no effort parameter and this seat cannot self-inspect its runtime
model/effort — stated on dispatch-record authority). Governed run root
`runs/lean-2026-09-22-c6-forest-delta2-order-9`.

This award **builds on the frozen G1 project**
(`sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean`, SHA-256
`aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`). Per the
award statement's mandatory instruction, the consumed frozen entries are
transcribed byte-for-byte, with their content unchanged and their VERITYOS
ENTRY provenance recorded here; the only textual changes are the ones named
explicitly in §3 below (binder un-sugaring, never a change to a hypothesis,
conclusion, or proof term). `Erdos993G1.delta` is the G1 delta (integer
zero-extended `coeff`) transcribed as ENTRY 1-3 below, and the terminal
statement uses it directly — no re-definition.

## 1. Definitions (frozen ENTRIES 1-3, transcribed verbatim)

```lean
noncomputable def Erdos993G1.indepCount {V : Type u} (F : SimpleGraph V) (k : ℕ) : ℤ :=
  (Nat.card {S : Finset V // F.IsNIndepSet k S} : ℤ)

noncomputable def Erdos993G1.coeff {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  if 0 ≤ k then Erdos993G1.indepCount F k.toNat else 0

noncomputable def Erdos993G1.delta {V : Type u} (F : SimpleGraph V) (k : ℤ) : ℤ :=
  Erdos993G1.coeff F (k + 1) - Erdos993G1.coeff F k
```

`indepCount F k` is the actual count of independent `k`-subsets of `F`
(`i_k(F)`, `i_0 = 1` for every finite graph); `coeff` is the integer zero
extension (`coeff F k = 0` for `k < 0`); `Delta_k(F) = i_{k+1}(F) - i_k(F)`
for integer `k`, exactly `SEMANTIC-CONTRACT.md`'s conventions. These three
definitions are digest-bound to the frozen source (`sources/g1/`,
`SEMANTIC-CONTRACT.md`) and are re-registered, not re-defined.

## 2. The full dependency DAG, every node's status (frozen entries
transcribed, this award's two new declarations last)

All 25 frozen fragments below compile as re-registered, re-elaborated
transcriptions of the frozen G1 project's own already-kernel-checked
entries (digest-bound source: `scratchpad/c6-crit-U4-F/LeanCritic/LeanProof/Main.lean`,
byte-identical to `sources/g1/lean/g1-c3-third-wide/LeanProof/Main.lean`,
SHA-256 `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`).
No mathematical content — hypothesis, conclusion, or proof term — is
changed from the frozen source in any of them.

| Registered name | Frozen ENTRY | Role |
|---|---|---|
| `Erdos993G1.indepCount` | 1 | definition |
| `Erdos993G1.coeff` | 2 | definition |
| `Erdos993G1.delta` | 3 | definition |
| `Erdos993G1.indepCount_eq_card_indepSetFinset` | 17 | `indepCount` via the computable `Finset`-indexed witness |
| `Erdos993G1.coeff_nat` | 23 | `coeff` at a natural index |
| `Erdos993G1.delta_nat` | 25 | `delta F k = i_{k+1} - i_k` at a natural `k` |
| `Erdos993G1.isNIndepSet_pair_iff` | 41 | pair independence iff non-adjacent |
| `Erdos993G1.sym2_toFinset_injective` | 42 | `Sym2.toFinset` injectivity |
| `Erdos993G1.indepSetFinset_two_eq` | 43 | independent pairs = complement edges |
| `Erdos993G1.indepCount_two_add_edges` | 44 | **`i_2(F) + \|E(F)\| = C(n,2)`** |
| `Erdos993G1.indepSetFinset_eq_filter_powersetCard` | 45 | independent sets as a `powersetCard` filter |
| `Erdos993G1.card_nonindep_pairs` | 46 | non-independent pair count = edge count |
| `Erdos993G1.sum_card_filter_swap` | 47 | double-counting swap identity |
| `Erdos993G1.sum_nonindep_pair_incidence` | 48 | non-independent-pair incidence over triples |
| `Erdos993G1.sum_indep_indicator` | 49 | independence indicator sum = independent-set count |
| `Erdos993G1.triple_local_identity` | 50 | local triangle-free (acyclic) triple identity |
| `Erdos993G1.indepSetFinset_three_incidence` | 51 | triple incidence identity, `Finset`-counted |
| `Erdos993G1.sum_triple_centered_neighbor_pairs` | 53 | re-indexing to a per-vertex degree-choose-2 sum |
| `Erdos993G1.indepCount_three_add_edge_incidence` | 54 | **`i_3(F) + \|E\|·(n-2) = C(n,3) + Σ_v C(deg v,2)`** |
| `Erdos993G1.forest_card_edges_add_components` | 58 | **`\|E(F)\| + c(F) = n`** (forest edge-count identity) |
| `Erdos993G1.components_card_pos_of_card_pos` | 59 | `c(F) ≥ 1` when `n ≥ 1` |
| `Erdos993G1.degreeDefect_nonneg` | 66 | `C(d,2) - d + 1 ≥ 0` termwise |
| `Erdos993G1.degreeChoose_sum_lower` | 68 | **`Σ_v deg(v) - n ≤ Σ_v C(deg v,2)`** (the convexity step) |
| `Erdos993G1.scaledChooseTwo` | 70 | `2·C(n,2) = n(n-1)` |
| `Erdos993G1.scaledChooseThree` | 71 | `6·C(n,3) = n(n-1)(n-2)` |
| `Erdos993G1.ForestDelta2.forest_delta_two_lower` | — (new) | the uniform closed-form quantitative bound |
| `Erdos993G1.ForestDelta2.forest_delta_two_pos_ge_nine` | — (new, **TERMINAL**) | the award's statement |

The transcription is textually identical except for the un-sugaring named in
§3. **No open node**: every one of the 27 declarations above compiles,
`lake build` passes (8657/8657 jobs, foreground, no detach), and
`#print axioms` on every one of the 27 (not only the terminal declaration —
condition (v)) reports exactly `[propext, Classical.choice, Quot.sound]`,
zero `sorryAx`, zero `native_decide`, zero `admit`
(`EVIDENCE/axiom-check-all-declarations.txt`,
`RECEIPTS/kernel-verification.json`).

## 3. Binder un-sugaring (the only textual change from the frozen source;
never a hypothesis, conclusion, or proof-term change)

Several frozen entries are stated inside the frozen file's own ambient
`namespace Erdos993G1 \n variable {V : Type u} (F : SimpleGraph V)` block and
therefore do not restate `{V : Type u}`/`(F : SimpleGraph V)` in their own
signature line. Re-registering each entry as an independent fragment (the
governed `register` command assembles one fragment per declaration; there is
no cross-fragment `variable` scope) requires restating those two
auto-bound binders explicitly on the entries that used them: ENTRIES 17, 23,
25, 41, 43, 44, 45, 46, 48, 49, 50, 51 gained an explicit
`{V : Type u} (F : SimpleGraph V)` (ENTRY 42 gained `{V : Type u}` only,
since its statement never mentions `F`); ENTRIES 47, 53, 54, 58, 59 already
stated their own binders and needed no change. ENTRIES 66, 68, 70, 71 used
the frozen file's fully-qualified top-level form
(`lemma Erdos993G1.<name> ...`); the governed registrar's source-declaration
check requires the *unqualified* leaf identifier to appear immediately after
the `lemma`/`def` keyword (the same requirement that forced the Cycle 5
formalizer's `P_holds_critic_general` rename, and the Cycle 4 formalizer's
`noncomputable`-on-its-own-line convention for ENTRIES 1-3), so these four —
and ENTRIES 1-3 themselves — are re-wrapped in `namespace Erdos993G1 ... end
Erdos993G1` with the unqualified name, exactly the Cycle 4 formalizer's own
precedent for the same three definitions. Every un-sugared binder was
already an auto-bound implicit/explicit argument of the *elaborated* frozen
declaration; restating it explicitly changes no type, no hypothesis, and no
proof term — `lake build`'s clean pass and the unchanged axiom sentence
(§2 above) are the check that this is so.

## 4. The two new declarations, node by node

### 4a. `forest_delta_two_lower` (lemma; the quantitative closed-form bound)

```lean
lemma forest_delta_two_lower {X : Type u} [Finite X]
    (F : SimpleGraph X) (hF : F.IsAcyclic) (hn : 5 ≤ Nat.card X) :
    (Nat.card X : ℤ) ^ 3 - 12 * (Nat.card X : ℤ) ^ 2 + 35 * (Nat.card X : ℤ) - 30
      ≤ 6 * Erdos993G1.delta F 2
```

**Hypotheses and where each enters.** `[Finite X]` — the minimal instance
burden (matches the contract form; `Erdos993G1.delta` is `noncomputable`, so
no `Fintype`/`DecidableEq`/`DecidableRel` is needed for the *statement*; the
proof introduces `Fintype.ofFinite X` and `classical` locally to invoke the
frozen entries, which is standard and does not change the statement).
`hF : F.IsAcyclic` — enters twice: through
`forest_card_edges_add_components` (`|E| + c = n`, ENTRY 58, forest-only)
and through `indepCount_three_add_edge_incidence` (ENTRY 54, whose own proof
uses acyclicity through `triple_local_identity`'s `cliqueFree 3` argument —
a forest contains no triangle). `hn : 5 ≤ Nat.card X` — enters as the
closing `nlinarith` hypothesis; the bound is genuinely false below `n = 5`
(C-U4-T's critique records `B(4) = -3` against the true minimum `-4`), so
this hypothesis is load-bearing, not decoration.

**Method (transcribed from the frozen project's own ENTRY 176 argument,
made uniform in `n`).** The frozen project already proves `0 < delta F 2` at
the *single* order `Nat.card X = 10` (ENTRY 176,
`Erdos993G1.ThirdWide.forest_delta_two_ten_pos`) by a closed-form,
non-inductive argument; every ingredient is order-agnostic, and carrying `n`
symbolically instead of substituting the numeral 10 gives the quantitative
bound uniformly, for every `n ≥ 5`:

```
6 * Delta_2(F) = n(n-1)(n-5) - 6(n-c)(n-3) + 6S            [ENTRY 44, 54, 70, 71]
              ≥ n(n-1)(n-5) - 6(n-1)(n-3) + 6(n - 2)        [ENTRY 68: S ≥ n - 2c; ENTRY 59: c ≥ 1, ENTRY 58: n-c = |E| ≤ n-1]
              = n^3 - 12n^2 + 35n - 30
```

writing `c = |ConnectedComponent(F)|`, `S = Σ_v C(deg v, 2)`. Node by node,
exactly as the Lean proof runs:

1. `components_card_pos_of_card_pos F (…)` (ENTRY 59) — `c ≥ 1` (needs
   `Nat.card X > 0`, from `hn`).
2. `forest_card_edges_add_components F hF` (ENTRY 58) — `|E| + c = n`;
   combined with step 1, `|E| ≤ n - 1` (this is where acyclicity enters for
   the edge bound).
3. `indepCount_two_add_edges F` (ENTRY 44) — `i_2 + |E| = C(n,2)`.
4. `indepCount_three_add_edge_incidence F hF` (ENTRY 54) — `i_3 + |E|(n-2) =
   C(n,3) + S` (this is where acyclicity enters a second time, through
   ENTRY 54's own internal triangle-freeness argument).
5. `Erdos993G1.degreeChoose_sum_lower (fun x => F.degree x)` (ENTRY 68) —
   `Σ deg(v) - n ≤ S`, i.e. `2|E| - n ≤ S` after the handshake identity
   (`SimpleGraph.sum_degrees_eq_twice_card_edges`, Mathlib).
6. **Natural-versus-integer subtraction (the adjudicator's formalizer
   caution, condition (iii)):** step 4's raw statement carries
   `((Nat.card X - 2 : ℕ) : ℤ)`. This is converted explicitly,
   `have hsub : ((Nat.card X - 2 : ℕ) : ℤ) = (Nat.card X : ℤ) - 2 := by omega`,
   before the closing arithmetic step — exactly the caution the adjudication
   names ("the proof fails until … is converted … `nlinarith` fails
   silently otherwise"). Confirmed here: omitting this `rw` and feeding the
   raw natural-subtraction form to the closing `nlinarith` call fails
   silently (no error is raised by the cast itself; the arithmetic goal
   simply does not close), exactly as described.
7. `scaledChooseTwo`, `scaledChooseThree` (ENTRIES 70, 71) — `2C(n,2) =
   n(n-1)`, `6C(n,3) = n(n-1)(n-2)`, clearing the binomial coefficients to
   polynomial form.
8. `delta_nat` (ENTRY 25) rewrites `delta F 2` to `i_3 - i_2`.
9. A single closing `nlinarith` call combines steps 1-8 (as exact integer
   hypotheses, plus the one product hint
   `mul_nonneg (sub_nonneg.mpr hnz) (sub_nonneg.mpr hmz)` bounding
   `(n-5)(n - |E| - 1) ≥ 0`) to close the polynomial inequality.

This needs **no induction, no leaf case, no edgeless clause, and no
enumeration at any order** — every one of the nine steps is either an
already-transcribed frozen fact or ordinary integer arithmetic.

### 4b. `forest_delta_two_pos_ge_nine` (theorem; **the TERMINAL declaration**)

```lean
theorem forest_delta_two_pos_ge_nine {X : Type u} [Finite X] (F : SimpleGraph X)
    (hF : F.IsAcyclic) (hn : 9 ≤ Nat.card X) : 0 < Erdos993G1.delta F 2
```

From `forest_delta_two_lower F hF (by omega : 5 ≤ Nat.card X)` (using
`9 ≤ Nat.card X` to discharge `5 ≤ Nat.card X`) and the positivity of
`n^3 - 12n^2 + 35n - 30` for `n ≥ 9` (the identity
`n^3 - 12n^2 + 35n - 30 = (n-9)^3 + 15(n-9)^2 + 62(n-9) + 42`, closed by
`nlinarith` with the hint `sq_nonneg ((Nat.card X : ℤ) - 9)`), a single
`nlinarith` call closes `0 < 6 * Erdos993G1.delta F 2`, hence
`0 < Erdos993G1.delta F 2`.

## 5. Attributions (condition (i), restated on the declarations' own faces
per §3 of the brief)

Critic-attributed jointly to **C-U4-T** (this exact `[Finite X]` contract
form and the quantitative cubic `forest_delta_two_lower`,
`scratchpad/c6-crit-U4-T-replay/g1copy/LeanProof/CritU4T.lean`, SHA-256
`74b78e9bbcb9aa5f7593d0c846e311280406e46cf766e780d95d3ef6f98a0f9b`) and
**C-U4-F** (the independent second implementation carrying the
component-corrected bound and the `entry176_is_an_instance` disclosure,
`scratchpad/c6-crit-U4-F/LeanCritic/LeanProof/CriticUC604F.lean`, SHA-256
`834702bb27d33c1936163f0cf7fe7763e11c8383a683db9dffdfd427557093ad`), on the
frozen G1 project's own compiled lemmas. Seat **U4**'s route
(`U-C6-04 FOREST-DELTA3-BASE-ENCODING`) framed the base-case question and
settled, by direct measurement, whether plain kernel `decide` reaches a
76-class order-8 enumeration; the critics then jointly found — independently
of each other — the enumeration-free closed form used throughout this
project, which needs no such base at all. This declaration in this run is a
**faithful governed transcription**: the formalizer's own new mathematical
work is nil beyond binder un-sugaring (§3); the exact same proof strategy,
in the exact same order of steps, discharges `forest_delta_two_lower` here
as in C-U4-T's `CritU4T.lean`.

## 6. Scope exclusions (condition (ii); mandatory fences, restated verbatim
from the award statement and `control/C6-STAGE7-PROTOCOL.md`)

Uniform in the order, **no horizon, no enumeration at any order**; `ν`
(matching number), `τ` (vertex-cover number), the excess `d`, and
`x(F) < r` (first strict descent) enter **nowhere** in either declaration —
`grep` inside this project's own `LeanProject/LeanProof/Main.lean` for
`ν`/`nu`/`tau`/`x(F)` as Lean identifiers returns zero matches outside
doc-comments stating these very fences in prose. `Delta_2 > 0` is a
**POSITIVITY** statement — the **opposite sign** from a no-recovery
statement (`Delta_r(F) ≤ 0`); this project makes no no-recovery claim of any
kind. This is a forest **THRESHOLD** theorem, **never** "the run's first
unconditional forest theorem" (per `control/C6-STAGE1-GATE.md`/erratum
C6-E-e, already registered by Stage 1 as
`E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP`). It does **not** sharpen
`E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (an order bound — "`Δ_k(G) < 0 ⟹
n ≤ (k+1)²`" — is a different object from a threshold on `Δ_2` itself). It
is **not** `E993-R25-FOREST-DELTA3-THRESHOLD-ORDER-12` (the rank-3 threshold
is a disjoint, unattempted object in this project). It bears on **no** tier
(Tier 1/2/3 of `SOLUTION-CONTRACT.md` §1), on FOREST/TREE/TRANSFER, or on
Erdős #993 — this project is entirely inside the frozen G1 definitions'
forest-only object, and no claim about the G1 residual, the matching
branch, the cover branch, or any `d`-band is made or implied anywhere in
this run.

**Alias line (mandatory on the award's face):** this is the registered
VERIFIED claim `E993-R25-FOREST-DELTA2-POS-ORDER-9`
(`proved_informal → formally_verified` — a **grade change**, not a new
claim); it strictly generalises frozen **ENTRY 176**
(`Erdos993G1.ThirdWide.forest_delta_two_ten_pos`, single order
`Nat.card X = 10`) to every `n ≥ 9`; and its quantitative form
`forest_delta_two_lower` is a `max(n-2c,0) ≥ n-2c` weakening of the
registered VERIFIED `E993-PAIR-RANK3-FOREST-MIN` composed with
`indepCount_two_add_edges`, per C-U4-F's own alias discipline.

## 7. Condition (iii): repairs, the formalizer caution, and the terminal
binding

**Repairs named by the adjudicator/synthesis: none mathematical (0 of 2
repair-limit uses).** The one formalizer caution from the adjudication —
"the proof fails until `((Nat.card X − 2 : ℕ) : ℤ)` is converted to
`(Nat.card X : ℤ) − 2`; `nlinarith` fails silently otherwise" — was applied
exactly as directed, at the point named §4a step 6 above; no repair round
was entered (this project compiled clean on the first `lake build`,
8657/8657 jobs). **Exactly ONE terminal declaration is bound**:
`forest_delta_two_pos_ge_nine` (a `theorem`); `forest_delta_two_lower` is
registered as a **lemma**, per the synthesis's explicit instruction.

## 8. Condition (iv): exact-integer generator and instance check

`EVIDENCE/verify_forest_delta2_cubic_bound.py` (Python standard library
only — `hashlib`, `itertools`, `json`, `sys`, `functools`; deterministic; no
wall-clock/PID/host field in its output) is a from-scratch, independent
exact-integer census, sharing no code with any prior seat's or critic's
generator (none of those Python files are inside this seat's read
boundary): it enumerates every finite forest of order `n`, up to
isomorphism, for `n = 5..14`, via (1) canonical rooted trees generated by a
pool-based multiset-selection recursion that advances strictly by distinct
size (bounded recursion depth, no `count = 0` same-index re-recursion — the
defect the run's own hygiene record names as `C5-E-f`), (2) free trees
recovered by re-rooting every candidate at every vertex and keeping only the
lexicographically-minimal rooting, and (3) forests as multisets of free
trees (same size-bounded recursion as (1)); independence polynomials are
computed by the standard root-invariant two-function tree recursion
(`A(t) = Π Ind(child)`, `B(t) = z·Π A(child)`, `Ind(t) = A(t)+B(t)`), and a
forest's polynomial is the product of its components'. The check: for every
`n = 5..14`, **`6 * min_Delta_2(n) == n^3 - 12n^2 + 35n - 30`, exactly**
(integer equality, no floats, no division) — the exact claim this project's
`forest_delta_two_lower` docstring makes ("sharp: `B(n) = min Delta_2(F)`
… exactly, for every `n` from 5 to 14"). Output
`EVIDENCE/forest-delta2-cubic-bound-check.out.json`:
`"all_checks_passed": true`. Sanity cross-checks recorded in the same
output (not part of the pass/fail condition): rooted-tree counts match
OEIS A000081 exactly at every `n = 1..14`; free-tree counts match OEIS
A000055 exactly at every `n = 1..14`; forest-class counts match OEIS
A005195 exactly at every `n = 5..14` (`10, 20, 37, 76, 153, 329, 710, 1601,
3658, 8599`); the per-order `min_Delta_2` values are
`-5, -6, -5, -1, 7, 20, 39, 65, 99, 142` for `n = 5..14`, matching both
critics' independently reported tables exactly.

## 9. Condition (v): `#print axioms` on every named declaration

See §2 above and `EVIDENCE/axiom-check-all-declarations.txt`: all 27
registered declarations (25 transcribed frozen entries + the 2 new
declarations of this award) report exactly
`[propext, Classical.choice, Quot.sound]` — **within the three standard
axioms** — with zero `sorryAx` anywhere. Anonymous `example`s were not used
anywhere in this project (every declaration named in the axiom check is a
named, registered `definition`/`lemma`/`theorem`).

(Exact SHA-256 values of this file, `THEOREM-CONTRACT.yaml`,
`LeanProject/LeanProof/Main.lean`, and `RECEIPTS/kernel-verification.json`
are reported in `FORMALIZER-REPORT.md` and the final message.)
