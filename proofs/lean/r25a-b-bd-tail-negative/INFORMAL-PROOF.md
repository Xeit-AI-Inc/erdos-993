# Informal Proof — `ErdosR25AddBdTail.bdTailNegative_award`

Run: `lean-2026-09-22-b-bd-tail-negative` (lane B, seat `B-LA1`, r25 ADDENDUM).
Contract id: `b-la1-bd-tail-negative-v1`.

## 0. Scope and exclusions (brief §2, condition (ii))

This is the ASSEMBLED COMPOSITION of two r25 Cycle 6 critics' halves — C-U2-F's
step-sign/interior-peak development (Cycle 6 Dispatch 4, now `formally_verified`
as `ErdosR25C6U2.bdStepSign_interiorPeak_award`) and the C3 award's Catalan-gap
positivity (`Erdos993G1.U3.catalanGap_monotone_ratio_award`) — combined for the
first time in ONE Lean frame by this addendum run to prove the top-level `Bd`
tail statement. The r25 terminal Stage 7 explicitly declined to fund this
composition ("the two critics' completed halves sit in incompatible definitional
frames," `cycles/cycle-6/stage6/SYNTHESIS.md` "Not fundable"); this run is the
authorized successor route S-U-1 that lands it.

No graph object occurs anywhere in this proof; `Cz`, `D`, `MaR`, `BdRR` are
C-U2-F's integer functions, copied verbatim. This does **not** close the `d = 5`
band (`E993-R25-FOURTH-BAND-CLOSE-ALL-R` stays `proved_informal`); it supplies
one more formally verified input to that composition, and a count of formal
inputs is not a grade. This is **not** a sharpening of, and bears on, no tier,
no FOREST/TREE/TRANSFER claim, and no closure of the `d=5` band. Only the
`r ≥ 6` half of `E993-R25-BD-TAIL-NEGATIVE` is proved; the parenthetical
sharpness half (`Bd(r,r) ≥ 0` exactly at `r ∈ {2,3,4,5}`) is **not** established
by this run beyond the four fixed points `BdRR 4 = 48`, `BdRR 5 = 33` (which are
kernel-checked as isolated values but "≥ 0 exactly at" is a stronger universal
claim over all smaller `r` not attempted here) — this run records the fixed
points as validation evidence only, not as a second conjunct.

## 1. Definitions (exact, from the compiled sources named in the capsule)

All definitions below are copied verbatim from the read-only, digest-bound
source `sources/r25-terminal/lane-b-lean-sources/CriticF.lean` and
`CriticF2.lean` (C-U2-F), and from the two r25 award runs named in §3. Nothing
is altered from the source text; only the registrar's per-fragment wrapping
(`namespace ... end ...`) is added, and `open` statements are added at
non-namespace-scoped points as documented in §4.

```lean
-- ErdosR25C6U2 (imported, formally_verified elsewhere; re-registered
-- byte-identically here as import declarations, never re-proved)
def Cz (n k : ℤ) : ℤ := if 0 ≤ n ∧ 0 ≤ k then (Nat.choose n.toNat k.toNat : ℤ) else 0
def D (b m : ℤ) : ℤ := Cz b (m + 1) - 2 * Cz b m + Cz b (m - 1)
def N (m g : ℤ) : ℤ := g ^ 2 + g - 2 * m - 2

-- ErdosR25AddBdTail (this run, the addendum formalizer's own content)
noncomputable def MaR (a r : ℕ) : ℤ :=
  (Finset.range (2 * r - 1 - a + 1)).sup' (nonempty proof)
    (fun b => D (b : ℤ) ((r : ℤ) - (a : ℤ)))
noncomputable def BdRR (r : ℕ) : ℤ :=
  D (2 * (r : ℤ) - 1) (r : ℤ) + ∑ a ∈ Finset.Icc 1 6, (Nat.choose 6 a : ℤ) * max 0 (MaR a r)
def gc (m : ℕ) : ℕ := Nat.find (transitionExists m)   -- transitionExists : ∃ g, 2*m ≤ g^2 - g
```

`MaR`/`BdRR` are C-U2-F's integer-rank definitions of record verbatim
(`CriticF2.lean`): the inner rank is the INTEGER `(r:ℤ) - (a:ℤ)`, not the
ℕ-truncated `((r-a:ℕ):ℤ)`; the Hall range is
`Finset.range (2*r - 1 - a + 1)` (unconditionally nonempty). This is the
object that gives `BdRR 4 = 48` (NOT C-U2-T's ℕ-truncated `MaR0`, which gives
`42`).

`gc(m)` is `Nat.find` on the decidable ℕ predicate `2*m ≤ g^2 - g`, with
existence witnessed by `g = m+1` (`(m+1)^2 - (m+1) = (m+1)*m ≥ 2m` for every
`m`, proved without native evaluation). `gc` is never asserted to be a peak
independently of this witness; every bracket fact about it (`gc_le_self`,
`gc_hpass_int`, `gc_hfail_int`) is derived from `Nat.find_spec`/`Nat.find_min`/
`Nat.find_min'`.

## 2. Terminal declaration

```lean
theorem ErdosR25AddBdTail.bdTailNegative_award : ∀ r : ℕ, 6 ≤ r → BdRR r < 0
```

Proved by cases: `r ≤ 14` (the `[6,14]` layer, `layer_six_to_fourteen`, by
`decide`) and `r ≥ 15` (`BdRR_neg_ge15`, the assembly).

## 3. Proof architecture (nodes, matching brief §3; attribution per condition (i))

1. **Node 9, outer identity** (`D_outer_eq_neg_cat`, this run). `D(2r-1,r) =
   -Cat_r` for `r ≥ 1`: from `D_closed_form` (seat U2, node 1) at `g = 1`
   (`N(1) = -2r`), the Pascal-symmetry identity `C(2r,r) = 2*C(2r-1,r)`
   (`centralBinom_eq_two_mul_choose_pred`, this run, from
   `Nat.choose_succ_succ'` and `Nat.choose_symm`), and the standard
   `(r+1)*Cat_r = C(2r,r)` (`Nat.succ_mul_catalan_eq_centralBinom`,
   Mathlib). Two multiplicative cancellations (`r ≠ 0`, `r+1 ≠ 0`).

2. **Node 8, the full lift** (`D_range_le_cat`, this run, using `gc` as
   `Nat.find`). For `m ≥ 7`, every `g ≤ m`: `D(2m-g,m) ≤ Cat_{m-1}`. Proof:
   `D_mono_up`/`D_mono_down` (this run, re-proved on this frame; SHAPE only
   from C-U2-T's `D_mono_up`/`D_mono_down`/`D_argmax`, REFERENCE ONLY per the
   brief, never carried) walk every `g` to `gc(m)` using the imported
   `D_step_up`/`D_step_down` (C-U2-F, node 3), then `D_peak_le_cat`
   (this run) applies the imported `interior_peak_le_cat` (C-U2-F, node 8
   core) at `gc(m)`, with the two bracket facts supplied by `gc_hpass_int`/
   `gc_hfail_int` (this run, from `Nat.find_spec`/`Nat.find_min`) and
   `gc_le_self` (this run, from `Nat.find_min'` at witness `g = m`, valid for
   `m ≥ 3`). The maximiser is a witness of two inequalities, never asserted to
   exist independently — `D_unimodal_peak` (FALSE) appears in no form.

3. **The `b < m` region** (`D_blt_m_le_cat`, this run). `D(b,m) = C(b,m-1)`
   (`D_blt_m_eq`, the other two `Cz` terms vanish since `b < m` and
   `b < m+1`), so `D(b,m) ≤ 1 ≤ Cat_{m-1}` (`Cz_blt_m_le_one` +
   `catalan_ge_one`, this run — `catalan_ge_one` from
   `Nat.succ_mul_catalan_eq_centralBinom` and `Nat.choose_pos`).

4. **Node 9, the tail clause** (`D_tail_le_cat`, this run). For `m ≥ 9`,
   `j = 1..5` (i.e. the `a-1 ≤ 5` indices `b = 2m+j ∈ [2m+1, 2m+a-1]`,
   `a ≤ 6`): `D(2m+j,m) ≤ Cat_{m-1}`. Proof: the SAME closed-form derivation
   technique as `D_closed_form` (choose_ratio_up/choose_ratio_down, now at
   `b = 2m+j`, always in Pascal range since `m ≤ 2m+j`) gives
   `D(2m+j,m)*(m+1)*(m+j+1) = C(2m+j,m)*(j²-j-2m-2)` (`D_tail_closed_form`,
   this run); since `j ≤ 5` gives `j²-j ≤ 20 ≤ 2m+2` for `m ≥ 9`, the second
   factor is `≤ 0`, and `C(2m+j,m) ≥ 0`, so `D(2m+j,m) ≤ 0 ≤ Cat_{m-1}`. This
   is proved ONLY on `m ≥ 9`, `j = 1..5` — **not** a blanket non-positivity
   claim above `2m` (`D(100,1) = 4751 > 0`, reproduced in
   `EVIDENCE/generate_bd_tail_checks.py`).

5. **Node 10** (`MaR_le_cat`, this run). `MaR a r ≤ Cat_{r-1-a}` for
   `1 ≤ a ≤ 6`, `r ≥ 15`: `Finset.sup'_le` over the Hall range
   `[0, 2r-1-a] = [0, 2m+a-1]` (`m = r-a ≥ 9`), split into exactly the three
   cases above (`b < m`, `m ≤ b ≤ 2m`, `2m < b ≤ 2m+a-1`), which partition the
   range completely.

6. **Node 11** (`node11_bridge`, this run). `Cat_r - Σ_{a=1}^{6} C(6,a)
   Cat_{r-1-a} = Γ(6, r-1)`, a definitional bridge to the C3 award's
   `Erdos993G1.U3.Gamma 6 (r-1)`, via `Gamma_unfold` (C3 award, `τ ≤ k`
   hypothesis at `r ≥ 15` gives `k = r-1 ≥ 14 ≥ τ = 6`, so the zero-extension
   guard is inactive on this range and every branch is the plain `catalan`
   one).

7. **Assembly** (`BdRR_le_neg_gamma`, `BdRR_neg_ge15`, this run). Node 9's
   outer identity, node 10's bound summed via `Finset.sum_le_sum` (using
   `max 0 (MaR a r) ≤ Cat_{r-1-a}`, from node 10 and `Cat ≥ 0`), and node 11's
   bridge give `BdRR r ≤ -Γ(6,r-1)`. The imported `gamma_pos_6`
   (`Erdos993G1.U3.gamma_pos_6 : ∀ k, 12 ≤ k → 0 < Gamma 6 k`, the C3 award's
   own named lemma) at `k = r-1 ≥ 14 ≥ 12` gives `Γ(6,r-1) > 0`, so
   `BdRR r < 0`.

8. **Terminal** (`bdTailNegative_award`, this run). Cases on `r ≤ 14` (layer,
   `decide`) / `r ≥ 15` (assembly).

## 4. Import handling (brief §5 step 4; disclosure)

The kernel verifier's `unsafe_execution_scan` check requires the checked
source file to have an import surface of exactly `[]` or `["import Mathlib"]`
(`skills/lean-kernel-verification/scripts/verify_lean_kernel.py`,
`find_unsafe_execution_tokens`). A raw `import LeanProof.ImportedC6LA4`/
`ImportedC3LA1` (this run's first working draft) is therefore REJECTED at the
kernel gate as a "noncomputable import surface" regardless of what the
imported file contains. Consequently the two award declarations are not
brought in via a file-level `import`; instead every declaration from the two
award files' own non-terminal content (i.e. excluding each award's own
combined terminal theorem, `ErdosR25C6U2.bdStepSign_interiorPeak_award` and
`Erdos993G1.U3.catalanGap_monotone_ratio_award`, neither of which this proof
calls) is re-registered, byte-identically, as its own entry in this project,
through the governed `prepare_lean_formalization.py register` workflow — the
same "own files" mechanism the brief names, realized as per-declaration
snippet files rather than a raw file import (the two are equivalent as far as
"byte-identical, digest-bound, never re-proved" is concerned; only the
delivery mechanism differs, forced by the kernel gate's import-surface rule).

- `ErdosR25C6U2` (from
  `runs/lean-2026-09-22-c6-bd-step-sign-interior-peak/LeanProject/LeanProof/Main.lean`,
  SHA-256 `9be947ce127b21982fe553c7a8fef07567dc8331d200bede2ac3759dfbd5c88c`):
  all 29 non-terminal declarations (`Cz` through `interior_peak_le_cat`),
  registered in their original file order.
- `Erdos993G1.U3` (from
  `runs/lean-2026-09-21-c3-catalan-gap-monotone-ratio/LeanProject/LeanProof/Main.lean`,
  SHA-256 `f1243faf4e0d92753a5c90ed056a5885ed44a9c5f10568eac31f9423baff9031`):
  all 37 non-terminal declarations (`Gamma` through `gamma_min_7`), registered
  in their original file order.

Two structural additions, disclosed here (neither changes a single character
of the copied mathematical content):

(a) **`open` statements.** `ErdosR25C6U2`'s own Main.lean wraps every entry
in its own `namespace ErdosR25C6U2 ... end ErdosR25C6U2` block; this run adds
one `open ErdosR25C6U2` command, at top level (outside any namespace), placed
immediately after the re-registered `Cz` entry, so this run's own
`ErdosR25AddBdTail` code can reference `D`/`Cz`/`N`/`D_step_up`/
`interior_peak_le_cat`/etc. unqualified exactly as the brief's DAG (§3) states
them. `Erdos993G1.U3`'s own Main.lean instead opens its namespace ONCE, in its
first entry (`Gamma`), and closes it only in its own terminal theorem's entry
(entry 38, excluded here) — relying on 37 intervening BARE (unwrapped)
lemma declarations sitting inside that one still-open block. Since this run
registers each of those 37 as its own self-contained fragment, each is
individually re-wrapped in `namespace Erdos993G1.U3 ... end Erdos993G1.U3`
(content unchanged), and the `open Nat Finset` the source's `Gamma` entry
declared (which, in the source, stayed in scope for all 37 following
declarations by virtue of the still-open outer namespace) is re-declared once,
at top level, immediately after the `Gamma` entry's now-closed namespace, so
every subsequent self-contained entry keeps exactly the unqualified-name
resolution the source project had. This run's own code always refers to
`Erdos993G1.U3.Gamma`/`gamma_pos_6` fully qualified, so it does not itself
need `Erdos993G1.U3` opened.

(b) **Five relocated doc-comments.** Five of the 37 `Erdos993G1.U3` entries
(`catalan_strict_logConvex`→`catalan_cross_strict`,
`catalan_strict_two_step`→`gamma_one_pos`→`monotone_ratio`,
`catalan_cross_lower`→`binom_five_pow_split`,
`five_pow_ge`→`gamma_neg_of_ge_eight`) had a `/-- ... -/` DECLARATION
doc-comment for the FOLLOWING lemma trailing at the END of the PRECEDING
entry's registered content in the source project (valid there because entries
were concatenated bare, with nothing between them); once each entry is its
own self-contained `namespace ... end` block, such a trailing doc-comment
sits immediately before `end Erdos993G1.U3` with no declaration to attach to,
which Lean rejects (`unexpected token 'end'; expected 'lemma'`). Each such
doc-comment is moved, byte-for-byte, from the tail of its source entry to the
head of the following entry it was documenting (verified against the source
project's own line order — in every case the doc-comment's own prose names
the lemma it precedes). No `/-!` section/module comment (which needs no
attachment) was touched.

The exact digest of the byte-identical inner content is not separately
recorded per-entry in this file (96 entries); `RECEIPTS/formalization.json`
and `FORMALIZATION-STATE.json` record the source SHA-256 of every registered
fragment (including the two documented additions above), and the two
originating award files' own full-file digests are cited above and verified
byte-for-byte in `CAPSULE-VERIFICATION.json`.

## 5. Attribution (condition (i), on the award's face)

- Seat **U2** (r25 Cycle 6): the frame (`Cz`, `D`, `N`), node 1
  (`D_closed_form`), node 2a (`L_sub_R`), and nodes 4–7 of the step-sign
  development.
- **C-U2-F**: `D_step_sign`, `D_step_up`/`D_step_down`, `interior_peak_le_cat`,
  the definitions of record (`MaR`/`BdRR`, integer inner rank), and the
  `[6,14]` layer's `decide` case — imported.
- **C-U2-T** (`CritT-Main.lean`, REFERENCE ONLY): the assembly SHAPE
  (`BdRR_le_of_pointwise`/`node11`/`BdRR_neg_of_high` and the
  `D_mono_up`/`D_mono_down`/`D_argmax` induction pattern) — every lemma taken
  from this shape is re-proved here on the `MaR`/`BdRR` frame of record, never
  carried, and `MaR0` is not used anywhere in this project.
- The C3 award (r25 Cycle 3, seat U3 with its critics; `Erdos993G1.U3.Gamma`,
  `gamma_pos_6`, `catalanGap_monotone_ratio_award`): `Γ(6,k) > 0` for
  `k ≥ 12` — imported, the ONLY non-elementary input.
- **The addendum formalizer** (this run): the node 8 lift via `gc` as
  `Nat.find` (`gc_le_self`/`gc_hpass_int`/`gc_hfail_int`/`D_peak_le_cat`/
  `D_mono_up`/`D_mono_down`/`below_gc_fails`/`sq_sub_self_mono`/
  `D_range_le_cat`), the `b < m` region (`D_blt_m_eq`/`Cz_blt_m_le_one`/
  `D_blt_m_le_cat`/`catalan_ge_one`), the tail clause
  (`D_tail_closed_form`/`D_tail_le_cat`), node 9's outer identity
  (`centralBinom_eq_two_mul_choose_pred`/`D_outer_eq_neg_cat`), node 10
  (`MaR_le_cat`), node 11's bridge (`node11_bridge`), the assembly
  (`BdRR_le_neg_gamma`/`BdRR_neg_ge15`), the layer (`layer_fixed_points`/
  `layer_six_to_fourteen`), and the terminal composition
  (`bdTailNegative_award`).

## 6. Repairs (condition (iii))

- `star_star` renamed before anything else: the imported `ErdosR25C6U2`
  content already carries the mandatory rename (`gc_star_bound`, per the
  Cycle 6 synthesis Dispatch 4 and the C6-LA4 award's own repair record); this
  run introduces no `star_star` identifier anywhere.
- The integer-rank `MaR`/`BdRR` (C-U2-F's frame) are used throughout; C-U2-T's
  ℕ-truncated `MaR0` is not used, referenced, or carried in any form.
- The `[6,14]` layer (`layer_six_to_fourteen`) is a separate `decide` case,
  never folded into the `r ≥ 15` general argument (`BdRR_neg_ge15`); the
  terminal theorem's only join point is the `by_cases h : r ≤ 14` in
  `bdTailNegative_award`.

## 7. Fence compliance summary

- `BdRR 4 = 48`, `BdRR 5 = 33`, `BdRR 6 = -16`, `BdRR 10 = -14406`: proved by
  `decide` in `layer_fixed_points`, BEFORE the `[6,14]` layer and the general
  argument (both depend on nothing upstream of this check; it is listed first
  among this run's own lemmas after the node-8 apparatus for narrative
  clarity, and is independently reproduced in
  `EVIDENCE/generate_bd_tail_checks.py`).
- `star_star` renamed: confirmed, §6.
- The `[6,14]` layer is a separate `decide` case: confirmed, §6.
- `gc` is `Nat.find`: confirmed, §1.
- The tail clause is proved only on `a-1 ≤ 5` indices, never as a blanket
  non-positivity: confirmed, §3 node 4, with the `D(100,1) = 4751 > 0`
  witness reproduced in evidence.
- `D_unimodal_peak` appears in no form (as declaration, hypothesis or
  asserted shape): confirmed. The identifier occurs exactly once in the
  full 96-entry `Main.lean`, at line 598, inside the imported
  `interior_peak_le_cat` doc-comment's negative fence sentence ("...precisely
  the distinction that makes `D_unimodal_peak` false and this true") —
  byte-identical to the C6-LA4 award source, whose own fidelity review
  identified and accepted this exact occurrence on the same grounds ("the
  barred name `D_unimodal_peak` occurs ONLY as the struck name inside the
  negative fence sentence — no declaration, hypothesis or shape of it exists").
  No `def`, `lemma`, `theorem`, hypothesis, or existential shaped like it
  occurs anywhere.
- No `sorry`, `admit`, or `native_decide`: confirmed by the kernel receipt's
  `incomplete_proof_scan` (passed) and `unsafe_execution_scan` (passed, no
  `native_decide` pattern).
- Axioms exactly within `propext`, `Classical.choice`, `Quot.sound`: confirmed
  for the terminal declaration (`EVIDENCE/axioms.txt`) and independently for
  every one of the 96 registered declarations
  (`EVIDENCE/all-96-declarations-axioms.txt`).
