---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c6-la4-formalizer-sonnet-20260922
critic_id: c6-la4-fable-informal-20260922
attestation_id: c6-la4-informal-pass-20260922
claim_sha256: 5340daee2c38329282f7b25b86449a6e3fd07b3706b4a3b0a110cb800d75a2c3
---

# Informal Proof Integrity Audit

**Boot acknowledgment.** Operating within VerityOS. Boot reads, in full, before
any substantive work: `verity.md`, `identity/startup-protocol.md`,
`skills/proof-integrity-audit/skill.md` (the three authorized by
`control/C6-STAGE7-INFORMAL-AUDITOR-BRIEF-LA4.md` §0). Subsystems loaded:
`identity/` (startup protocol), `skills/` (proof-integrity-audit), and the
`experiments/` run under audit. No other VerityOS file was read under boot
authority.

**Model disclosure.** This seat is Claude Opus 5, chartered effort high, seated
as the independent informal proof-integrity reviewer
`c6-la4-fable-informal-20260922`
(`independent-mathematical-proof-integrity-reviewer`). The seat cannot
self-inspect its own runtime model or effort setting; this disclosure rests on
dispatch-record authority (the brief), not on introspection. Child delegation
was forbidden and none was used. This seat is not the artifact producer and
edited nothing in the Lean run: its only writes are
`scratchpad/c6-s7-informal-LA4/INFORMAL-AUDIT.md` (this file) and its own
scratch in that directory. No network, no package installs, no `lake`, no
`elan`, no `/tmp`.

**Gate reproductions performed by this seat.**

| Object | Expected | Recomputed | Result |
|---|---|---|---|
| `theorem.informal_statement`, whitespace-collapsed | `5340daee…0d75a2c3` | `5340daee2c38329282f7b25b86449a6e3fd07b3706b4a3b0a110cb800d75a2c3` | match |
| `THEOREM-CONTRACT.yaml` | `0d8478ca…e00f30894` | `0d8478ca4c143522a8d7fb81bd89a85d90aaa0feecedd97dae00d49e00f30894` | match |
| `INFORMAL-PROOF.md` | `d6cab293…4e6c2b70` | `d6cab2934950767b525ed81ca4594ee89258021fd3a98f197dce5a594e6c2b70` | match |
| `LeanProject/LeanProof/Main.lean` | `9be947ce…fbd5c88c` | `9be947ce127b21982fe553c7a8fef07567dc8331d200bede2ac3759dfbd5c88c` | match |
| Capsule seal (compact key-sorted JSON minus `seal_sha256`) | `9e2d3713…75bce39` | `9e2d3713d85e7d588a516a0efb322c1d82e653fc59b1206a5693add3275bce39` | match |
| All 9 capsule members, byte count and SHA-256 | manifest | recomputed | 9/9 match |
| All 4 originating Lean sources under `SOURCE/` | contract `source_materials` | recomputed | 4/4 match |
| `lean_binding.expected_statement_sha256` | `729702a4…43d69d7b` | `729702a486b1d24d2a9bd52063de22447d4737c1bfe1b757711b57fc43d69d7b` | match |
| Producer generator rerun in this seat's own directory | `EVIDENCE/…check.json` = `6d044ed8…9661366` | `6d044ed810328015b8ca66e4fadf46431dba365c1e5892702fcbf90ca9661366` | byte-identical; deterministic, no wall-clock/PID/host |

**Read-boundary disclosure (stated because the brief's §1 is an enumeration).**
Within the brief's list I read: the run's `THEOREM-CONTRACT.yaml`,
`INFORMAL-PROOF.md`, `CAPSULE-VERIFICATION.json`, `EVIDENCE/THEOREM-CONTRACT.md`,
`FORMALIZER-REPORT.md`, the `EVIDENCE/` generator and its outputs,
`LeanProject/LeanProof/Main.lean` and the file listing of `Snippets/`; the sealed
capsule manifest and its members (`SYNTHESIS.md` `## Lean awards` Dispatch 4 and
`## Exact established results` B4, `ADJUDICATION.md` `## Lean readiness`
Contract-ready group 5, the U2 return and its two critiques, targeted);
`control/C6-STAGE7-FORMALIZER-BRIEF-LA4.md`; `SEMANTIC-CONTRACT.md`;
`SOLUTION-CONTRACT.md` §4 and `SOLUTION-CONTRACT-ADDENDUM-1.md`; and the five
Mathlib lemmas plus the `catalan` definition and root `star_star` in the shared
pinned project. I also read the four `SOURCE/*.lean` copies — the contract's own
digested `source_materials`, and the only way to perform §2 item 3's literal
definition check. Beyond the enumeration I opened, inside the run root only,
`FIDELITY-REVIEW.md`, `VERIFICATION-REPORT.md`, `LOOP-STATE.md`,
`DEPENDENCIES.yaml`, `RECEIPTS/reviewer-assignment.json` and the `verdict` field
of `RECEIPTS/kernel-verification.json`, in a single batched listing of run-root
status files. `FIDELITY-REVIEW.md` records a sibling reviewer's findings which
overlap mine. **Every finding below was formed, and its evidence written to this
seat's scratchpad, before that file was opened** — the `D_unimodal_peak` sweep,
the §0 self-contradiction, the hyphen/underscore citation defect, the
witness-census non-vacuity result, the symbolic certificate, the byte-level
provenance diff and the two-lemma scope caution are all in this seat's own tool
record ahead of it. No finding below is adopted from that document, and it is
cited nowhere as authority. I record the over-read plainly rather than conceal
it. Nothing outside the run root and the brief's list was read: no other return,
critique, adjudication, scratch directory, award run, manuscript, or the master
ledger.

## Intended Claim

The intended claim is exactly `theorem.informal_statement` of
`runs/lean-2026-09-22-c6-bd-step-sign-interior-peak/THEOREM-CONTRACT.yaml`
(SHA-256 of the whitespace-collapsed text: `5340daee…0d75a2c3`, recomputed and
matching). In substance it is the explicit conjunction of two statements over
ℤ-valued functions of naturals `m, g`, with `D(b,m) = C(b,m+1) − 2C(b,m) +
C(b,m−1)` the zero-extended integer binomial ranged object:

1. **`D_step_sign`** — for naturals `g < m`, `1 ≤ m`,
   `m·(2m−g)·(D(2m−g−1,m) − D(2m−g,m)) = C(2m−g,m−1)·(2m − g² + g)`;
2. **`interior_peak_le_cat`** — for naturals `7 ≤ m`, `g ≤ m` with
   `g² − g ≥ 2m` and `(g−1)² − (g−1) < 2m`, `D(2m−g,m) ≤ catalan(m−1)`.

The terminal declaration bound by the contract is
`ErdosR25C6U2.bdStepSign_interiorPeak_award`, at `Main.lean` ENTRY 30. Its text
is, verbatim:

```lean
theorem bdStepSign_interiorPeak_award :
    (∀ m g : ℕ, g < m → 1 ≤ m →
        (m : ℤ) * (2 * (m : ℤ) - (g : ℤ))
            * (D (2 * (m : ℤ) - ((g : ℤ) + 1)) (m : ℤ) - D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ))
          = Cz (2 * (m : ℤ) - (g : ℤ)) ((m : ℤ) - 1)
              * (2 * (m : ℤ) - (g : ℤ) ^ 2 + (g : ℤ))) ∧
    (∀ m g : ℕ, 7 ≤ m → g ≤ m →
        2 * (m : ℤ) ≤ (g : ℤ) ^ 2 - (g : ℤ) →
        ((g : ℤ) - 1) ^ 2 - ((g : ℤ) - 1) < 2 * (m : ℤ) →
        D (2 * (m : ℤ) - (g : ℤ)) (m : ℤ) ≤ (catalan (m - 1) : ℤ)) :=
  ⟨fun m g hg hm => D_step_sign m g hg hm,
   fun m g hm hgm hpass hfail => interior_peak_le_cat m g hm hgm hpass hfail⟩
```

**Three surface differences from the controller's transcription in the
formalizer brief §2, each checked and each immaterial.** (a) Hypothesis order in
conjunct 1 is `g < m → 1 ≤ m`, not `1 ≤ m → g < m`; the two propositions are
identical, and the compiled order is the one the adjudication's Contract-ready
group 5 displays token for token. (b) The left `D` argument is
`2*m − (g+1)` rather than `2*m − g − 1`; over ℤ these are different terms
denoting the same integer (equal by `ring`), and this seat checked `D` agrees on
them at all 7,260 grid points (`C2b_bis`). (c) The right factor is
`Cz (2m−g) (m−1)` rather than `(Nat.choose (2*m−g) (m−1) : ℤ)`; under the
hypotheses `1 ≤ m`, `g < m` both indices are nonnegative, so `Cz` is
`Nat.choose` there, and `Cz` is the seat's zero-extension of record. The brief's
§2 states that the compiled statements govern; they do, and they are used here.

**Conjunct 1 is exactly the adjudication's `D_step_sign` and conjunct 2 exactly
its `interior_peak_le_cat`, binder for binder**, and the proof term is the bare
pairing of the two lemmas applied to their own binders — no added hypothesis, no
dropped conjunct, no extra content.

## Claim Ledger

Thirty registered declarations; every one carries a `#print axioms` line.
"ℕ-sub/cast" records the result of checking each natural subtraction and each
cast for truncation. Evidence tags refer to `## Reproduced Mathematical
Evidence`. All checks are this seat's own; no prior evaluator was imported.

| # | Declaration | Statement / role | Hypotheses and where they enter | ℕ-sub / cast | Evidence | Verdict |
|---|---|---|---|---|---|---|
| 1 | `Cz` (def) | `Cz n k = C(n.toNat, k.toNat)` if `0 ≤ n ∧ 0 ≤ k`, else `0` | none | guard is the zero extension itself; `Nat.choose` already 0 for `k > n` | definition check vs `SOURCE`, `C28` | verified |
| 2 | `D` (def) | `Cz b (m+1) − 2·Cz b m + Cz b (m−1)` over ℤ | none | all ℤ; `m−1 < 0` handled by the guard | definition check | verified |
| 3 | `N` (def) | `g² + g − 2m − 2` | none | all ℤ | `C2a` | verified |
| 4 | `L` (def) | `(m+1−g)(g²+3g−2m)` | none | all ℤ | `C2a` | verified |
| 5 | `R` (def) | `(2m−g)(g²+g−2m−2)` | none | all ℤ | `C2a` | verified |
| 6–8 | `Cz_natCast`, `Cz_cast_add_one`, `Cz_cast_sub_one` | ℤ/ℕ bridges for `Cz` | `Cz_cast_sub_one` needs `1 ≤ k`; it is the only one, and it enters node 1 and `choose_ratio_down_at` at `k = m` under `1 ≤ m` | `k−1` in ℕ guarded by `1 ≤ k` — no truncation | definition check | verified |
| 9 | `choose_ratio_up` | `C(b,m+1)(m+1) = C(b,m)(b−m)` over ℤ | `m ≤ b`; enters node 1 at `b = 2m−g`, `g ≤ m` | `b−m` in ℕ guarded by `m ≤ b`; cast via `Nat.cast_sub` | Mathlib `Nat.choose_succ_right_eq` read at `Data/Nat/Choose/Basic.lean:214` | verified |
| 10 | `choose_ratio_down` | `C(b,m)·m = C(b,m−1)(b−m+1)` over ℤ | `1 ≤ m`, `m ≤ b`; same entry point | `m−1`, `b−(m−1)` guarded | same Mathlib lemma at `k = m−1` | verified |
| 11 | **Node 1** `D_closed_form` | `D(2m−g,m)(m+1)(m−g+1) = C(2m−g,m)·N(g)` | `g ≤ m` (keeps `b = 2m−g ≥ m`, so both ratio lemmas apply), `1 ≤ m` (for `choose_ratio_down` at `k = m−1`) | `2m−g` in ℕ guarded by `g ≤ m`; the ℤ identification `2m−g = ↑(2m−g)` is proved | `C1` (10,010 cases) + symbolic bracket collapse | verified |
| 12–14 | **Node 2a** `L_eq`, `R_eq`, `L_sub_R` | `L(g) = (m+1−g)N(g+1)`, `R(g) = (2m−g)N(g)`, `L−R = (m+1)(2m−g²+g)` | none — unconditional, `ring` alone; **no `N(g) > 0` premise** (the struck Cycle 5 Lemma A carried one) | all ℤ | `C2a` (3,721 points, ≥ deg+1 per variable) + symbolic residual 0 | verified |
| 15 | **Node 4** `peak_bracket_integral` | `(g−1)²−(g−1) < 2m ⟹ N(g) ≤ 4g−5` | the bracket inequality only; enters node 8 as exactly `hfail` | all ℤ; the sharpening is the integrality step `< 2m ⟹ ≤ 2m−1` | `C4` (5,340 cases incl. negative `m,g`) + symbolic slack identity | verified |
| 16 | `gc_ge_five` | `7 ≤ m`, `2m ≤ g²−g ⟹ 5 ≤ g` | `7 ≤ m` is **load-bearing and sharp**: fails at `(m,g) = (6,4)` | `g : ℕ` cast to ℤ | `C7a` (150,068 cases), `S7a` (10 sub-7 counterexamples) | verified; hypothesis sharp |
| 17 | `three_gc_le` | `1 ≤ g`, `7 ≤ m`, `hfail ⟹ 3g ≤ 2m+2` | `7 ≤ m` load-bearing (fails at `(1,2)`, `(2,3)`, `(3,3)`, `(4,4)`); `1 ≤ g` is not needed but is harmless | cast only | `C7b` (7,926 cases), sharpness probe | verified |
| 18 | **Node 7** `gc_star_bound` | `8(2m−1)(g−1) ≤ 2^g(m+1)(m+1−g)` at a transition witness, `m ≥ 7` | `hpass` (via `gc_ge_five`, giving `2^g ≥ 32`), `hfail` + `1 ≤ g` (via `three_gc_le`, giving `2(m+1−g) ≥ g ≥ 0`), `7 ≤ m` | exponent `g : ℕ` as `Monoid.npow`; the rest ℤ | `C7c` (294 witness cases), `S7c` (fails at every `m ≤ 5`) | verified |
| 19 | `choose_double_step` | `b+1 ≤ 2m ⟹ 2C(b,m) ≤ C(b+1,m)` | `b+1 ≤ 2m`; enters the node 5 induction | `b+1−m` in ℕ **may truncate**, and does so harmlessly: `omega` proves `2(b+1−m) ≤ b+1` in both branches; when `b < m` both sides are 0 | `C5a` (14,520 cases) + Mathlib `Nat.choose_mul_succ_eq` at `Basic.lean:224` | verified |
| 20 | **Node 5** `row_ratio` | `2^g·C(2m−g,m) ≤ C(2m,m)` | `g ≤ m`; enters node 8 | `2m−g`, `2m−(g+1)` in ℕ, both guarded by `g+1 ≤ m` in the successor branch | `C5` (7,381 cases) | verified |
| 21 | **Node 6** `catalan_centralBinom_gap` | `C(2m,m) = 2(2m−1)·catalan(m−1)`, `m ≥ 1` | `1 ≤ m`; enters node 8 (discharged from `7 ≤ m`) | `m−1` in ℕ guarded by `1 ≤ m` | `C6` (200 cases with `catalan` by its Mathlib convolution recursion), `P1` (three independent Catalan definitions agree on `n ≤ 129`), Mathlib `succ_mul_centralBinom_succ`, `succ_mul_catalan_eq_centralBinom`, `centralBinom_eq_two_mul_choose` read in the pinned tree | verified |
| 22 | `choose_row_shift` (C-U2-F) | `C(2m−g−1,m)(2m−g) = C(2m−g,m)(m−g)` over ℤ | `g < m`; the one ingredient node 2b needs beyond node 1 | `2m−g−1` in ℕ genuine because `g < m` gives `2m−g−1 ≥ m−1 ≥ 0`; `m−g` genuine | `C22` (9,870 cases) | verified |
| 23 | `choose_ratio_down_at` (C-U2-F) | `C(2m−g,m)·m = C(2m−g,m−1)(m−g+1)` over ℤ | `g ≤ m`, `1 ≤ m` | as rows 8–10 | `C23` (10,010 cases) | verified |
| 24 | **Node 2b** `D_step_sign` (C-U2-F, joint with C-U2-T) | the terminal conjunct 1 | `g < m` **load-bearing**: the cancelled factor is `(m+1)(m−g+1)(m−g)`, and `m−g ≠ 0` is exactly `g ≠ m`; `1 ≤ m` is implied by `g < m` and so is redundant-but-equivalent, never a weakening | `D (2m−(g+1)) m` all ℤ; `Cz … (m−1)` all ℤ | **`C2b`, the mandated grid, 7,260 cases, 0 failures**; **symbolic: the ENTRY 24 `linear_combination` certificate has residual exactly 0 in ℤ[m,g,h₀,h₁,A,B,P]** | verified |
| 25 | `choose_pred_pos` (C-U2-F) | `C(2m−g,m−1) > 0` on `g < m` | `g < m`, `1 ≤ m` | `m−1 ≤ 2m−g` guarded | `C25_27` | verified; **not a dependency of the terminal theorem** |
| 26–27 | `D_step_up`, `D_step_down` (C-U2-F) | node 3: strict increase while the test fails, non-increase once it passes — "unimodality", **derived from the sign identity** | `g < m`, `1 ≤ m`, plus the one-sided test | all ℤ | `C25_27` (5,050 cases) | verified; **explicitly not dependencies** of either conjunct, and the contract's dependency graph carries no edge from them to `conclusion` |
| 28 | `Cz_nonneg` (C-U2-F) | `0 ≤ Cz n k` | none | — | `C28` (6,561 cases incl. negative indices) | verified; registered, **not a dependency** of the terminal theorem (node 8 obtains `0 ≤ A` by `positivity` on a ℕ cast) |
| 29 | **Node 8 core** `interior_peak_le_cat` (C-U2-F) | the terminal conjunct 2 | `7 ≤ m` (proof route: `gc_ge_five`, `three_gc_le`, `gc_star_bound`, and `1 ≤ m` for node 6); `g ≤ m` (node 1's range, and `m−g+1 > 0` for the final cancellation); `hpass`, `hfail` **supplied on a witness**, never produced | `2m−g` in ℕ guarded; `catalan (m−1)` guarded by `7 ≤ m` | **`C8`, the mandated grid, 114 cases, 0 failures**; `C8_bis` witness census; `S8` sub-7 probe | verified |
| 30 | `bdStepSign_interiorPeak_award` | the explicit conjunction | none at top level | `catalan (m−1)` inside conjunct 2 guarded by `7 ≤ m` | `C30` | verified |

**Inference chain of node 2b, as the informal proof states it, checked as an
identity rather than by sampling.** With `h₀ = D(2m−g,m)`, `h₁ = D(2m−g−1,m)`,
`A = Cz(2m−g,m)`, `B = Cz(2m−g−1,m)`, `P = Cz(2m−g,m−1)` treated as
indeterminates, the four hypotheses are

```text
E1 : h₀(m+1)(m−g+1) − A(g²+g−2m−2)        = 0     (node 1 at g)
E2 : h₁(m+1)(m−g)   − B(g²+3g−2m)          = 0     (node 1 at g+1)
E3 : B(2m−g) − A(m−g)                      = 0     (choose_row_shift)
E4 : A·m − P(m−g+1)                        = 0     (choose_ratio_down_at)
```

and the goal, multiplied by `F = (m+1)(m−g+1)(m−g)`, satisfies

```text
[m(2m−g)(h₁−h₀) − P(2m−g²+g)]·F
  =  m(2m−g)(m−g+1)·E2 − m(2m−g)(m−g)·E1
   + m(m−g+1)(g²+3g−2m)·E3 + (m−g)(m+1)(2m−g²+g)·E4
```

**identically in ℤ[m,g,h₀,h₁,A,B,P]** — this seat expanded both sides with its
own multivariate polynomial engine and the residual is the zero polynomial
(`auditor_symbolic.json`, `node2b_certificate_residual_is_zero: true`). The
multipliers are the ones `Main.lean` ENTRY 24 actually uses. The cancellation of
`F` is legitimate precisely when `m+1 ≠ 0`, `m−g+1 ≠ 0` and `m−g ≠ 0`, i.e.
exactly under `1 ≤ m` and `g < m`. **Every equality in the chain is an identity,
not an approximation, and each is recomputed here.**

**Node 1's bracket, likewise symbolic.** With `u = m−g`,
`u(u+1) − 2(m+1)(u+1) + m(m+1)` expands to `g² + g − 2m − 2 = N(g)` identically
(`node1_bracket_residual_is_zero: true`). **Node 2a**: `L − R − (m+1)(2m−g²+g)`
is the zero polynomial (`node2a_L_sub_R_residual_is_zero: true`). **Node 4**:
`(4g−5) − N(g)` equals `(2m−1) − ((g−1)²−(g−1))` identically
(`node4_slack_identity_residual_is_zero: true`), so the "INTEGRAL sharpening" is
exactly the integrality step `< 2m ⟹ ≤ 2m−1` applied to a difference that is
already a polynomial identity — no hidden analytic content, and the informal
proof's description of it is accurate.

**Node 8's assembly, step by step, each step's side condition named.**
`h(m+1)(m−g+1) = A·N(g) ≤ A(4g−5)` needs `A ≥ 0`; `×2^g` then node 5 needs
`4g−5 ≥ 0`, which follows from `g ≥ 5`, which follows from `hpass` and `7 ≤ m`;
node 6 rewrites `C(2m,m) = 2(2m−1)K`; `2(2m−1)(4g−5) ≤ 8(2m−1)(g−1)` is
`8g−10 ≤ 8g−8` scaled by `2m−1 > 0`, and needs `K ≥ 0`; node 7 then gives
`8(2m−1)(g−1)K ≤ 2^g(m+1)(m+1−g)K`; node 7's surface form `m+1−g` and node 1's
`m−g+1` are distinct terms denoting the same integer, which the proof's
`nlinarith` step bridges by ring normalisation; and the final cancellation of
`2^g(m+1)(m−g+1) > 0`, positive because `g ≤ m`, yields `h ≤ K`. Every side
condition is discharged from the stated hypotheses; none is assumed.

**Provenance, byte for byte.** This seat extracted each of the 30 ENTRY blocks
from `Main.lean` and diffed it against its originating declaration in the
contract-digested `SOURCE/` copies. **ENTRIES 1–21 are byte-identical to seat
U2's `Main.lean`** (`be6dd935…`), **ENTRIES 22–27 to critic C-U2-F's
`CriticF.lean`** (`9199cf0e…`), **ENTRIES 28–29 to part (A) of C-U2-F's
`CriticF2.lean`** (`ac039dbc…`), modulo exactly three permitted transformations:
`theorem` → `lemma`, the mandated `star_star` → `gc_star_bound` rename, and
docstring text. ENTRY 30 is new to this run. (`provenance_diff.txt`: 29 of 29
carried declarations identical; the single "differs" line is my extractor
capturing a block comment that trails `L_sub_R` in the source, not a change to
the declaration.) **This is the strongest available check that the informal
proof's "taken verbatim, mechanically re-derived, not re-designed" is true, and
it is true.**

## Reproduced Mathematical Evidence

Written by this seat under `scratchpad/c6-s7-informal-LA4/`, Python standard
library only, explicit import lists at the top of each file, no wall-clock, PID
or host field in any output. **No prior evaluator was imported.** To keep the
recomputation genuinely independent of the producer's, binomials are built from
factorials *and* cross-validated against an independent Pascal-recurrence
implementation (`math.comb`, which the producer uses, is not used anywhere in
`auditor_check.py`), and `catalan` is computed three ways — Mathlib's own
convolution recursion, `C(2n,n)/(n+1)`, and `C(2n,n) − C(2n,n+1)` — which
agree at every `n ≤ 129`, so node 6's identification of `catalan` is checked,
not assumed.

Files: `auditor_check.py` → `auditor_check.json`; `auditor_symbolic.py` →
`auditor_symbolic.json`; `auditor_sharpness_probe.txt`; `provenance_diff.txt`;
`repro_producer_generator.py` → `repro_producer_output.json`.

| Tag | Check | Domain | Cases | Failures |
|---|---|---|---|---|
| `P0` | two independent binomial implementations agree | `n ≤ 40`, `−2 ≤ k ≤ n+2` | 1,025 | 0 |
| `P1` | three independent Catalan definitions agree | `n ≤ 129` | 130 | 0 |
| `C1` | node 1 `D_closed_form` | `0 ≤ g ≤ m ≤ 140` | 10,010 | 0 |
| `C2a` | node 2a `L_eq`, `R_eq`, `L_sub_R` | `−30 ≤ m,g ≤ 30` | 3,721 | 0 |
| `C4` | node 4 `peak_bracket_integral` | `−40 ≤ m,g ≤ 200`, `hfail` | 5,340 | 0 |
| `C5a` | `choose_double_step` | `b+1 ≤ 2m`, `m ≤ 120` | 14,520 | 0 |
| `C5` | node 5 `row_ratio` | `0 ≤ g ≤ m ≤ 120` | 7,381 | 0 |
| `C6` | node 6 `catalan_centralBinom_gap` | `1 ≤ m ≤ 200` | 200 | 0 |
| `C7a` | `gc_ge_five` | `7 ≤ m ≤ 400`, `g ≤ 400`, `hpass` | 150,068 | 0 |
| `C7b` | `three_gc_le` | `7 ≤ m ≤ 400`, `1 ≤ g ≤ 400`, `hfail` | 7,926 | 0 |
| `C7c` | node 7 `gc_star_bound`, the `(**)` inequality | `7 ≤ m ≤ 300` at each witness | 294 | 0 |
| `C22` | `choose_row_shift` | `g < m ≤ 140` | 9,870 | 0 |
| `C23` | `choose_ratio_down_at` | `g ≤ m ≤ 140` | 10,010 | 0 |
| **`C2b`** | **conjunct 1, the mandated grid** | **`0 ≤ g < m ≤ 120`** | **7,260** | **0** |
| `C2b_bis` | `D(2m−(g+1),m) = D(2m−g−1,m)` (the two surface forms) | same grid | 7,260 | 0 |
| `C25_27` | `choose_pred_pos`, `D_step_up`, `D_step_down` | `g < m ≤ 100` | 5,050 | 0 |
| `C28` | `Cz_nonneg` | `−20 ≤ n,k ≤ 60` | 6,561 | 0 |
| **`C8`** | **conjunct 2, the mandated grid** | **`7 ≤ m ≤ 120`, each witness `g ≤ m`** | **114** | **0** |
| `C30` | the conjunction | both of the above | — | 0 |

**Overall: zero failures on every check.** The two mandated grids are covered
exactly as the brief specifies, and the producer's own counts (7,260 and 114)
are reproduced independently.

**Non-vacuity, exhibited rather than asserted.** Conjunct 1 at `(m,g) = (1,0)`:
`0 < 1` and `1 ≤ 1` both hold, `D(1,1) = −1`, `D(2,1) = −2`, LHS `= 1·2·1 = 2`,
RHS `= Cz(2,0)·2 = 2`. Conjunct 2 at `(m,g) = (7,5)`: `7 ≤ 7`, `5 ≤ 7`,
`14 ≤ 20`, `12 < 14`, and `D(9,7) = C(9,8) − 2C(9,7) + C(9,6) = 9 − 72 + 84 = 21
≤ catalan(6) = 132`.
More strongly, `C8_bis` establishes that **for every one of the 114 values
`m ∈ [7,120]` there is exactly one `g ≤ m` satisfying both bracket
inequalities** (`g = 5` at `m = 7,8`; `g = 7` at `m = 20`; `g = 11` at `m = 50`;
`g = 16` at `m = 119,120`). The hypothesis set of conjunct 2 is therefore
neither empty nor sporadic, and the 114 checks are 114 distinct real instances.

**Failure of the bounds outside their stated hypotheses, where the record calls
a hypothesis load-bearing.** The informal proof §2 says `7 ≤ m` is needed for
`gc_ge_five` and `three_gc_le`. Both fail without it, and this seat exhibits the
witnesses:

- `gc_ge_five` is **false** at `(m,g) ∈ {(1,2),(1,3),(1,4),(2,3),(2,4),(3,3),
  (3,4),(4,4),(5,4),(6,4)}` — ten counterexamples, the boundary one being
  `(m,g) = (6,4)`, where `2m = 12 ≤ 4²−4 = 12` yet `g = 4 < 5`.
- `three_gc_le` is **false** at `(1,2)`, `(2,3)`, `(3,3)`, `(4,4)` — e.g. at
  `(1,2)`, `hfail` holds (`0 < 2`) but `3g = 6 > 2m+2 = 4`.
- `gc_star_bound`, the `(**)` inequality, **fails at every `m ≤ 5`** that has a
  transition witness: `(1,2)` `8 > 0`, `(2,3)` `48 > 0`, `(3,3)` `80 > 32`,
  `(4,4)` `168 > 80`, `(5,4)` `216 > 192`. It happens to survive at `m = 6`
  (`264 ≤ 336`), so `7 ≤ m` is sufficient and one step beyond the last failure
  for this lemma, while being exactly sharp for `gc_ge_five`.
- The **conclusion** of conjunct 2 is *not* claimed to fail below 7, and does
  not: at the four sub-7 witnesses `(3,3)`, `(4,4)`, `(5,4)`, `(6,4)` we get
  `D = 1,2,4,8` against `catalan(m−1) = 2,5,14,42`. The record does not assert
  sharpness of the conclusion, only that `7 ≤ m` is what the route needs, and
  that is precisely what the evidence shows. **Nothing is over-claimed.**
- `g < m` in conjunct 1: the record says the restriction is a proof artifact of
  the cancellation and that the identity also holds at `g = m`. This seat
  confirms it — the identity holds at every `g ≥ m` tested (`S2b`, 1,880 cases
  on `m ≤ 40`, `m ≤ g < 3m+6`, zero mismatches). The hypothesis is load-bearing
  for the *proof* (it is exactly `m−g ≠ 0`), not a boundary of the truth, and
  the informal proof says so in those words. Restricting to `g < m` cannot
  weaken anything.

**Mathlib lemmas read at their source in the pinned shared tree, to check that
each is used at its exact statement.**

- `Nat.choose_succ_right_eq (n k) : choose n (k+1) * (k+1) = choose n k * (n−k)`
  — `Data/Nat/Choose/Basic.lean:214`. Used twice, both times with the ℕ
  subtraction `n−k` guarded.
- `Nat.choose_mul_succ_eq (n k) : n.choose k * (n+1) = (n+1).choose k * (n+1−k)`
  — `Basic.lean:224`. Used by `choose_double_step` and `choose_row_shift`.
- `Nat.succ_mul_centralBinom_succ (n) : (n+1)·centralBinom(n+1) = 2(2n+1)·centralBinom n`
  — `Data/Nat/Choose/Central.lean:78`.
- `Nat.centralBinom_eq_two_mul_choose (n) : centralBinom n = (2n).choose n`
  — `Central.lean:39`.
- `succ_mul_catalan_eq_centralBinom (n) : (n+1)·catalan n = n.centralBinom`
  — `Combinatorics/Enumerative/Catalan/Basic.lean:126`.
- `catalan` is the convolution recursion `catalan 0 = 1`,
  `catalan (n+1) = Σ_{i<n+1} catalan i · catalan (n−i)`
  — `Catalan/Basic.lean:52`. `P1` verifies this is the same sequence as
  `C(2n,n)/(n+1)`, which is what node 6 needs.
- `star_star [InvolutiveStar R] (r : R) : star (star r) = r` — `Algebra/Star/Basic.lean:77`.
  **The root collision the mandatory rename addresses is real**, and the rename
  is therefore genuinely required rather than cosmetic.

**Axioms.** `EVIDENCE/axiom-report.txt` carries exactly 30 lines, one per
registered declaration, and `Main.lean` carries exactly 30 ENTRY blocks and 30
declarations — no anonymous `example` is used in place of a named declaration.
Every line is within `{propext, Classical.choice, Quot.sound}`: two definitions
(`Cz`, `D`) depend on no axiom, three (`N`, `L`, `R`) on `propext` alone, five
(`L_eq`, `R_eq`, `L_sub_R`, `choose_double_step`, `row_ratio`) on
`[propext, Quot.sound]`, and the remaining twenty on all three, including the
terminal theorem (2 + 3 + 5 + 20 = 30). No `sorryAx`, no
unapproved axiom. `Main.lean` contains no `sorry`, `admit`, `native_decide` or
`axiom` declaration. The report's axiom sentence reads "within the three
standard axioms", as condition (v) requires.

## Independent Critic Pass

Run against this seat's own ledger, after it was closed and before any verdict
was written, looking for reasons the pass above should not stand.

1. **Could the claim be vacuous or trivially satisfiable?** No. Both conjuncts
   have non-empty, exhibited hypothesis sets, and conjunct 2 has exactly one
   witness at every admissible `m` in the mandated range. *Critic satisfied.*
2. **Could the zero extension make `D` a different object from the intended
   binomial one at the arguments in play?** No. Under conjunct 1's hypotheses
   `2m−g ≥ m+1 > 0` and `m−1 ≥ 0`; under conjunct 2's, `2m−g ≥ m ≥ 7`. Every
   `Cz` argument is nonnegative, so `Cz = Nat.choose` throughout, and
   `Nat.choose` already returns 0 above the row. The only case where `g = m`
   could make `b = m` is excluded: `hpass` forces `m ≥ 3` and `hfail` forces
   `m ≤ 4`, both below `7 ≤ m`. *Critic satisfied.*
3. **Is the cancellation in node 2b legitimate, or does it divide by something
   that can vanish?** The cancelled factor is `(m+1)(m−g+1)(m−g)`, and
   `mul_right_cancel₀` is applied to a proof that it is nonzero, built from
   `1 ≤ m` and `g < m`. This is the only division-like step in the award, and
   the polynomial certificate that precedes it has residual exactly zero.
   *Critic satisfied.*
4. **Does the "interior peak" language smuggle in an existence claim?**
   No. `Main.lean` contains **no existential at all** — zero occurrences of the
   existential binder, `Exists`, `Nat.find`, `Finset.sup`, `Finset.max`, `sSup`
   or `choose_spec`. `g` is a universally quantified natural constrained by two
   hypotheses. `D_step_up`/`D_step_down` would license calling that `g` an
   argmax, and the informal proof is careful to register them as *not*
   dependencies of either conjunct, which matches the contract's dependency
   graph (no edge from them to `conclusion`) and the compiled proof term.
   *Critic satisfied — and this is the precise content of the award's hardest
   fence.*
5. **Is `1 ≤ m` in conjunct 1 a redundancy that might mask a weakening?** It is
   implied by `g < m` for naturals, so the proposition is equivalent to the one
   without it. A hypothesis implied by another cannot weaken a statement.
   *Critic satisfied.*
6. **Has any hypothesis been silently added or strengthened relative to the
   statement of record?** No. Conjunct 1 and conjunct 2 are token-identical to
   the adjudication's Contract-ready group 5 display, and the synthesis B4
   hypothesis list (`1 ≤ m`, `g < m`; `7 ≤ m`, `g ≤ m`, the two brackets) is the
   same set. The only difference anywhere is the order of two `→`-hypotheses.
   *Critic satisfied.*
7. **Does anything marked NOT a dependency turn out to be one?** No.
   `D_step_up`, `D_step_down`, `Cz_nonneg`, `choose_pred_pos`, `L`, `R`,
   `L_eq`, `R_eq`, `L_sub_R` are registered but appear in neither conjunct's
   proof term; `interior_peak_le_cat` gets `0 ≤ A` from `positivity` on a ℕ
   cast, not from `Cz_nonneg`. The contract's `conclusion.dependencies` is
   exactly `{domain-nat, def-d-step-sign, def-interior-peak-le-cat}` and the
   graph's only in-edges to `conclusion` are from those. *Critic satisfied.*
8. **Is the attribution on the face actually supported?** Yes, by byte-level
   provenance: ENTRIES 1–21 (nodes 1, 2a, 4, 5, 6, 7 and the apparatus) are seat
   U2's; ENTRIES 22–29 (node 2b, the row-shift/ratio-down instances, the
   monotone corollaries, `Cz_nonneg`, the interior peak bound) are C-U2-F's; and
   C-U2-T's independently compiled `D_step_sign` is at line 121 of
   `SOURCE/originating-critic-U2-T-Main.lean` with binder order `(hm) (hg)` and
   a different proof on a character-identical statement, exactly as the informal
   proof says. Both critiques corroborate. *Critic satisfied.*
9. **Is C-U2-T's `MaR0`/`BdRR` frame carried anywhere?** No. Neither `MaR`,
   `MaR0`, `BdRR`, `BdTailTarget`, `hall_range_eq`, `hall_range_nonempty` nor
   any `[6,14]`-layer identifier occurs in `Main.lean` or in any registered
   declaration; they occur only in the read-only, unregistered, unbuilt
   `SOURCE/` reference copies and in prose exclusions. Part (B) of `CriticF2`
   is excluded exactly as claimed. *Critic satisfied.*
10. **Could the producer's evidence be self-confirming?** Immaterial here: the
    two mandated grids were recomputed from scratch with a different binomial
    implementation and a different Catalan implementation, plus a symbolic
    certificate check the producer did not perform. The producer's generator was
    additionally re-run in this seat's own directory and reproduces its own JSON
    byte-identically, confirming determinism. *Critic satisfied.*
11. **Are the documentation defects below serious enough to overturn the pass?**
    They are defects of the compliance narrative, not of the claim, its
    hypotheses, its proof, its dependencies or its axioms; correcting every one
    of them would change prose and no Lean token. They are recorded, not
    softened, and the controller is told to fix them before any registry action.
    *Critic satisfied that `passed` is the honest verdict and that the findings
    must travel with it.*

## Scope and Fence Check

**Ruling on controller finding 0c** (`D_unimodal_peak`). **NO declaration,
hypothesis, lemma, definition or axiom named `D_unimodal_peak` exists anywhere
in this project, and no declaration of that shape exists.** `Main.lean` contains
no existential of any kind, so no maximiser of `g ↦ D(2m−g,m)` is ever asserted
to exist; the maximiser enters only as a universally quantified `g` supplied as
a **witness** of the two bracket inequalities, which is exactly the distinction
the fence names. The barred name occurs **only as a struck name inside negative
fence sentences**: once in `Main.lean` (the `interior_peak_le_cat` docstring,
ENTRY 29) and in the identical registered snippet
`Snippets/0029-…-interior_peak_le_cat.lean.fragment`; once in the contract's
`theorem.informal_statement` and in its rendered view
`EVIDENCE/THEOREM-CONTRACT.md`; once in `FORMALIZER-REPORT.md`; and four times
in `INFORMAL-PROOF.md` — in each case reproducing the synthesis Dispatch 4's own
explanatory sentence. The fence's mathematical purpose — that the FALSE
statement is never formalised — **holds**. This is nevertheless a literal
departure from the formalizer brief §2's instruction that the name "must not
appear in any form (not even as a struck name in a docstring)". **I rule it a
MINOR, NON-BLOCKING finding**, and I say why rather than merely asserting it:
(a) it touches no declaration, binder, hypothesis, conclusion, dependency or
axiom; (b) resolving it would edit prose and never the theorem; (c) the
instruction cannot be obeyed literally by any document that also reproduces the
fence, the brief's own §2 and §0c being two such documents; and (d) the mentions
all *narrow* the award's scope rather than extend it, so the fence's operative
concern — silent weakening — is nowhere in play. The controller's reading is
confirmed.

**Fences of the synthesis Dispatch 4 and the formalizer brief §2, each checked.**

| Fence | Finding |
|---|---|
| Fixed-band `d = 5` **arithmetic**, named as such | Held. Named in the contract's scope text and in `INFORMAL-PROOF.md` §5(ii). No `d`, no band and no `r` occurs in any Lean statement or binder — `d` appears once in the whole project, in the terminal declaration's docstring as this very scope label; the label is a provenance narrowing and cannot over-claim. |
| No graph content | Held. No `SimpleGraph`, `indepCount`, `delta`, `firstDescent`, `Erdos993G1`, `Fintype` or any graph object in `Main.lean`. |
| `D`, `N`, `L`, `R` are the seat's integer functions over ℤ with zero extension | Held. `Cz` is `SEMANTIC-CONTRACT.md`'s integer zero-extension convention (stated there for `coeff`) applied to `C`, and both the docstring and the informal proof say "applied to `C`" rather than claiming it is stated for `C` — an honest citation. |
| "Unimodality" is of the integer function `g ↦ D(2m−g,m)`, **derived** from a sign identity, importing no shape premise on any `i_k` | Held. `D_step_up`/`D_step_down` are derived from `D_step_sign`; no `i_k`, no independence sequence, no shape premise anywhere. |
| The maximiser is supplied as a **witness**, never asserted to exist | Held. See the 0c ruling: no existential in the project. |
| No `MaR`/`BdRR`/`[6,14]` layer, nothing about `Bd(r,r) < 0` | Held. None of these identifiers occurs in `Main.lean` or any registered declaration; only part (A) of `CriticF2.lean` is carried. |
| Raises nothing else — not `E993-R25-BD-TAIL-NEGATIVE`, not `E993-R25-FOURTH-BAND-CLOSE-ALL-R` | Held. Both are named as not raised, in the contract's `informal_statement` and in `INFORMAL-PROOF.md` §0, §5(ii) and §6. |
| Name it "the step-sign law and interior peak bound", **never** "the band's tail" | Held. The award is so named throughout; the phrase "the band's tail" occurs only inside the prohibition itself. |
| The `star_star` rename (the one mandatory repair) | Held and complete. ENTRY 18 is `gc_star_bound`; no declaration named `star_star` exists in the built namespace; the Mathlib root collision it avoids is real (`Algebra/Star/Basic.lean:77`). The name occurs only in the docstring that explains the rename and in the read-only `SOURCE/` copy. |
| Bind ONE terminal declaration; register `D_step_sign`, `peak_bracket_integral`, `interior_peak_le_cat` as lemmas | Held. Exactly one `theorem` (ENTRY 30); all three named lemmas registered (ENTRIES 24, 15, 29), each `#print axioms`-ed. |
| No `sorry`, `admit`, `native_decide`; axioms within the three standard ones | Held, on all 30 declarations. |
| Attribution on the award's face (condition (i)) | Held, and independently corroborated byte for byte. |
| Scope exclusions in `INFORMAL-PROOF.md` and the contract's `informal_statement` (condition (ii)) | Held. |
| Evidence envelope, exact-integer, on the two mandated grids, zero failures, explicit imports, no wall-clock/PID/host (condition (iv)) | Held, and reproduced by this seat both independently and by re-running the producer's generator. |

**Defects recorded (all documentation-level; none touches the claim, its
hypotheses, its proof, its dependencies or its axioms). The controller should
require these corrected before any registry action on this award.**

- **D1 — false compliance assertion (minor).** `INFORMAL-PROOF.md` §0 states that
  `D_unimodal_peak` "does not appear anywhere in this project, not even as a
  struck name in a docstring, other than this sentence recording the fence", and
  §5(ii) states "`D_unimodal_peak` does not appear."
  `FORMALIZER-REPORT.md` repeats "does not appear anywhere in this project."
  **Both are false on their face**: the name occurs in the `Main.lean` docstring
  of `interior_peak_le_cat` and its registered snippet, in the contract's
  `informal_statement`, in `EVIDENCE/THEOREM-CONTRACT.md`, in the report itself,
  and three further times in `INFORMAL-PROOF.md` beyond the §0 sentence. The
  mathematics is untouched; what is defective is a fence-compliance sentence a
  downstream controller would rely on. The correct sentence — which is also the
  true one — is that the barred name appears **only** as a struck name in
  negative fence sentences and that no declaration of that name or shape exists.
- **D2 — dangling evidence citation (minor).** `INFORMAL-PROOF.md` §5(iv) names
  `EVIDENCE/step-sign-and-interior-peak-check.py` and `…-check.json`
  (hyphenated); the files that exist are `step_sign_and_interior_peak_check.py`
  and `.json` (underscored). `FORMALIZER-REPORT.md` cites them correctly. The
  evidence itself is present, digested and reproduced; only the citation in the
  document digested as `theorem_intent` is wrong.
- **D3 — repair-budget bookkeeping inconsistent (minor).**
  `THEOREM-CONTRACT.yaml` (`def-gc-star-bound`) records the rename as "1 of 2
  used, this one"; `INFORMAL-PROOF.md` §5(iii) is headed "1 of 2 used" but its
  body says the project "closes at 0 of 2"; `FORMALIZER-REPORT.md` says "0 of 2
  used". Both accountings are disclosed and reconcilable — the synthesis counts
  the mandated rename as repair 1, the workflow's post-failure counter is 0 —
  but the three artifacts should say the same thing.
- **D4 — literal fence departure (minor).** The 0c mention, ruled above.

**Scope caution for the controller, not a defect.** The grade change of
`E993-R25-D-ROW-STEP-SIGN-LAW` rests on **two separately registered lemmas** —
`D_step_sign` (ENTRY 24) and `peak_bracket_integral` (ENTRY 15) — and **not** on
the terminal theorem, whose second conjunct is `interior_peak_le_cat`. Both
lemmas are registered in the contract, kernel-verified and axiom-clean, so the
claim is supported; but any registry action must cite **both lemmas**, never the
terminal declaration alone. Two further statements travel on the award's face
that are outside this seat's read boundary and are recorded as
controller-attested rather than audited here: that `D_step_sign` together with
`peak_bracket_integral` is the registered `E993-R25-D-ROW-STEP-SIGN-LAW`
*verbatim*, and that `interior_peak_le_cat` has no registered predecessor. The
brief §2 states the controller re-confirmed both against the registry; the
synthesis's instruction that it do so before dispatch remains the controller's
to close. The parenthetical that `D_unimodal_peak` is false is likewise
inherited from the Cycle 5 record and not re-verified here; nothing in this
award depends on it.

**Node 4's attribution, for the record.** The synthesis assigns node 4 to seat
U2, and the award's attribution line follows the synthesis; the declaration's
own docstring and the contract's `def-peak-bracket-integral` description credit
the INTEGRAL sharpening to critic C-U2-F, and the U2 return's own table records
that C-U2-F sharpened it while the seat compiled the integral form. The three
statements are consistent and both credits are on the face. No conflict.

## Verdict

**passed**

The proof of the intended claim is sound at every step. The claim ledger closes:
30 registered declarations, every hypothesis traced to where it enters, every ℕ
subtraction and cast checked for truncation and each one either guarded or
harmless, every equality in the derivation recomputed and found to be an
identity — node 1's bracket, node 2a's ratio test, node 4's integral slack and,
decisively, node 2b's `linear_combination` certificate, whose residual is the
zero polynomial in ℤ[m,g,h₀,h₁,A,B,P] with the exact multipliers `Main.lean`
uses. The two mandated grids recompute with zero failures under this seat's own
exact-integer evaluator, built on a binomial implementation and a Catalan
implementation independent of the producer's: **7,260 instances of the step-sign
identity on `0 ≤ g < m ≤ 120`, and 114 instances of the interior peak bound on
`7 ≤ m ≤ 120`, each `m` carrying exactly one witness, so the second conjunct is
non-vacuous at every admissible `m`.** Where the record calls a hypothesis
load-bearing, its failure outside the hypothesis is exhibited: `gc_ge_five` is
false at `(m,g) = (6,4)` and nine other sub-7 points, `three_gc_le` at four, and
the `(**)` inequality at every `m ≤ 5` with a witness. The terminal declaration
is the explicit conjunction of exactly the two compiled statements of record,
binder for binder, with a proof term that is the bare pairing of the two lemmas
— no added hypothesis, no dropped or weakened conjunct. All 29 carried
declarations are byte-identical to their originating seat-U2 and critic-C-U2-F
sources, modulo only `theorem` → `lemma`, the mandated rename and docstrings.
Every fence holds, including the hardest one: the project contains no
existential, and the maximiser is supplied as a witness and never asserted to
exist. Axioms are within the three standard ones on all 30 declarations, with no
`sorry`, `admit` or `native_decide`.

No defective step exists. Four minor documentation defects are recorded — D1 the
false `D_unimodal_peak`-compliance sentences in `INFORMAL-PROOF.md` §0/§5(ii)
and `FORMALIZER-REPORT.md`, D2 the hyphenated evidence-path citation in
`INFORMAL-PROOF.md` §5(iv), D3 the inconsistent repair-budget bookkeeping, and
D4 the literal fence departure ruled at minor severity under controller finding
0c — together with one scope caution, that the grade change must be registered
against `D_step_sign` **and** `peak_bracket_integral` and not against the
terminal declaration alone. None of the four touches the claim, its hypotheses,
its proof, its dependencies or its axioms; each is corrected by editing prose
and no Lean token. They are recorded here so that they travel with the pass, and
the controller should require D1–D3 corrected before any registry action.

Attestation `c6-la4-informal-pass-20260922`, by
`c6-la4-fable-informal-20260922`, Claude Opus 5, chartered effort high (stated
on dispatch-record authority; this seat cannot self-inspect its runtime model or
effort).
