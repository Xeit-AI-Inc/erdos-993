---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: b-la1-formalizer-sonnet-20260922
critic_id: b-la1-fable-informal-20260922
attestation_id: b-la1-informal-pass-20260922
claim_sha256: 55472e9678d56dec6e32e5fc552f9a282895b40023ae169c596d35b318e6aa3a
---

# Informal Proof Integrity Audit

Operating within VerityOS. Booted this session by reading exactly `verity.md`,
`identity/startup-protocol.md` and `skills/proof-integrity-audit/skill.md`, then
the binding seat brief `control/lane-b/INFORMAL-AUDITOR-BRIEF.md`. No other
VerityOS subsystem (memory, conversations, modules, logs, decisions, writing)
was loaded. Seat: independent informal proof-integrity reviewer for lane B award
`B-LA1`, and — per the brief's §2 item 5 — the isolated second reader that r25
gate ruling 8 requires for this assembled composition. No child agent was
delegated to. Nothing in the run was written outside
`scratchpad/lane-b-informal/`; no contract, Lean source, informal proof or
receipt was edited.

Model / effort disclosure (dispatch-record authority): chartered Claude Opus 5,
effort high. **This seat cannot self-inspect its runtime model or effort
setting**; the line above is stated on the dispatch record's authority, not on
introspection.

Read boundary honored: the Lean run's own artifacts, the sealed capsule and its
22 members, the two named r25 award runs (read-only), and pinned Mathlib sources
for the meaning of the Mathlib lemmas used. No network, no package installs, no
`find`/`grep` rooted above those paths, no Lean build, no `lake clean`/`lake
update`/`elan`. All computations ran in the foreground, Python standard library
only, exact integers throughout.

## Intended Claim

The intended claim is exactly `THEOREM-CONTRACT.yaml`'s
`theorem.informal_statement`. Recomputed independently with whitespace collapsed
(`" ".join(s.split())`, 521 characters):

```text
claim_sha256 = 55472e9678d56dec6e32e5fc552f9a282895b40023ae169c596d35b318e6aa3a
```

which equals the digest the brief names. The three files the brief pins also
hash as expected: `THEOREM-CONTRACT.yaml`
`92ff817bfc020da51f59b0b176067a13e9f62989ed976e776780bd48be695163`,
`INFORMAL-PROOF.md`
`7447d0d3eec4dbc4605a59868a22147215a5feecb4ef7ebe732c55d56a2467fe`,
`LeanProject/LeanProof/Main.lean`
`2791103a374f6737787d405903aaf3ea241e114864367668c1908f3883627da9`.

The claim, in full: with `D(b,m) = C(b,m+1) − 2C(b,m) + C(b,m−1)` over
zero-extended integer binomials and the RANGED
`Bd(r,r) = D(2r−1,r) + Σ_{a=1}^{6} C(6,a)·max(0, max_{0≤b≤2r−1−a} D(b,r−a))`
(C-U2-F's integer-rank `MaR`/`BdRR` of record, `CriticF2.lean` verbatim):
`Bd(r,r) < 0` for every integer `r ≥ 6`. The sharpness half is declared out of
scope; no graph object occurs.

**Statement/claim correspondence, one for one.** The bound declaration is
`ErdosR25AddBdTail.bdTailNegative_award : ∀ r : ℕ, 6 ≤ r → BdRR r < 0`
(`expected_statement_sha256`
`6ea44d128e32c813684f5d897f69dc2c59ff8593a320b18b30dd94c0f3710b85`, recomputed
and matching; present verbatim at `Main.lean:1876`). It carries exactly one
hypothesis, `6 ≤ r`, matching the contract's sole `hyp-r6`; its conclusion is
the contract's `conclusion`; its definitional closure is
`BdRR → MaR → D → Cz`, matching the contract's four `definitions` and its
`dependency_graph` edges exactly. There is no second conjunct, no extra
hypothesis, and no weakening. The quantifier binds `r : ℕ`, which is the
contract's declared `domain-r`.

**Definitions of record, checked literally.** `MaR` and `BdRR` in `Main.lean`
(entries 7–8) are character-for-character the definitions in
`SOURCE/CU2-CriticF2.lean` lines 130–138 — the integer inner rank `(r:ℤ)−(a:ℤ)`
(not `((r−a:ℕ):ℤ)`), the unconditionally nonempty `Finset.range (2*r−1−a+1)`,
and the `max 0 (MaR a r)` summand. The only deviations are the `noncomputable`
modifier placed on its own line and an extended doc-comment; neither alters the
definition. The discrimination test holds: this object gives `BdRR 4 = 48`, and
the rejected ℕ-truncated frame gives `42` (both recomputed below). `Cz`, `D` and
`N` are byte-identical to the C6-LA4 award.

## Claim Ledger

Ledger granularity: one row per definition, lemma and load-bearing inference
step. 96 registered declarations — 66 imported byte-identically from the two r25
awards, 30 this run's own. Every hypothesis is recorded with the point at which
it enters. "V" = verified with independently reproduced evidence.

### A. Imported, byte-identical, never re-proved (66)

| # | Declaration | Registered scope | Where it enters | Verdict |
|---|---|---|---|---|
| A1 | `ErdosR25C6U2.Cz` / `.D` / `.N` / `.L` / `.R` | definitions | the frame | V (byte-identical) |
| A2 | `Cz_natCast` / `Cz_cast_add_one` / `Cz_cast_sub_one` | `1 ≤ k` on the last | cast plumbing | V |
| A3 | `choose_ratio_up` / `choose_ratio_down` | `m ≤ b`; `1 ≤ m` | both closed forms | V |
| A4 | `D_closed_form` (node 1, seat U2) | `g ≤ m`, `1 ≤ m` | nodes 8, 9 | V |
| A5 | `L_eq` / `R_eq` / `L_sub_R` (node 2a) | none | ratio-test frame | V (unused downstream) |
| A6 | `peak_bracket_integral` (node 4) | `(g−1)²−(g−1) < 2m` | inside A12 | V |
| A7 | `gc_ge_five` / `three_gc_le` | `7 ≤ m` (+ pass/fail) | inside A8, A12 | V |
| A8 | `gc_star_bound` (node 7; the mandated rename of `star_star`) | `7 ≤ m`, pass, `1 ≤ g`, fail | inside A12 | V |
| A9 | `choose_double_step` / `row_ratio` (node 5) | `b+1 ≤ 2m`; `g ≤ m` | inside A12 | V |
| A10 | `catalan_centralBinom_gap` (node 6) | `1 ≤ m` | inside A12 | V |
| A11 | `choose_row_shift` / `choose_ratio_down_at` / `choose_pred_pos` / `Cz_nonneg` | `g < m` / `g ≤ m`, `1 ≤ m` | node 2b, tail | V |
| A12 | `D_step_sign` (node 2b), `D_step_up`, `D_step_down` | `g < m`, `1 ≤ m` (+ sign test) | node-8 walk | V |
| A13 | `interior_peak_le_cat` (node 8 core) | `7 ≤ m`, `g ≤ m`, pass, fail | B10 | V |
| A14 | `Erdos993G1.U3.Gamma` + 36 lemmas through `gamma_min_7` | per lemma | node 11 / assembly | V |
| A15 | `Erdos993G1.U3.Gamma_unfold` | `τ ≤ k` | B24 | V |
| A16 | `Erdos993G1.U3.gamma_pos_6` | `12 ≤ k` | B26 | V |

Byte-identity was established mechanically, not by eye
(`scratchpad/lane-b-informal/extract_entries.py`,
`reconstruct_check.py`). Of the 29 `ErdosR25C6U2` fragments, 28 carry a
registrar digest line identical to the source award's; the single exception is
the `Cz` entry, whose difference is entirely *after* its `end ErdosR25C6U2` (the
disclosed `open`). For the 37 `Erdos993G1.U3` fragments the wrapper differs by
construction. Stripping exactly the disclosed additions — the per-fragment
`namespace`/`end` re-wrapping and the two top-level `open` blocks — and nothing
else, the two declaration streams reconstruct **byte-identically** to their
sources: 352 non-blank lines for `ErdosR25C6U2`, 442 for `Erdos993G1.U3`, zero
diff. Re-registration order is the source order in both cases. The two award
terminal theorems (`bdStepSign_interiorPeak_award`,
`catalanGap_monotone_ratio_award`) are **not** re-registered and are referenced
nowhere (grep count 0 each).

### B. This run's own content (30)

| # | Declaration | Hypotheses (where they enter) | ℕ-sub / cast audit | Verdict |
|---|---|---|---|---|
| B1 | `MaR` (def) | — | range `2r−1−a+1` is ℕ; non-truncating at `r ≥ 15, a ≤ 6`; nonempty proof is unconditional | V |
| B2 | `BdRR` (def) | — | `2·(r:ℤ)−1` is ℤ | V |
| B3 | `transitionExists` (def) | — | `g²−g` in ℕ; witness `g = m+1`, guarded by `Nat.le_sub_iff_add_le hle` | V |
| B4 | `gc` (def) | — | `Nat.find` on the decidable ℕ predicate `2m ≤ g²−g` | V |
| B5 | `sq_ge_self` | — | **the anti-truncation lemma**: `g ≤ g²`, so `g²−g` never truncates | V |
| B6 | `gc_le_self` | `3 ≤ m` (from `7 ≤ m` at B10/B16) | `Nat.find_min'` at witness `g = m` | V |
| B7 | `gc_hpass_int` | none | `Nat.cast_sub` guarded by B5 | V |
| B8 | `gc_pos` | `1 ≤ m` | by contradiction from B7 at `gc = 0` | V |
| B9 | `gc_hfail_int` | `1 ≤ m` (via B8) | `gc m − 1` guarded by B8; square guarded by B5 | V |
| B10 | `D_peak_le_cat` | `7 ≤ m` | applies A13 at `g = gc m` with B6/B7/B9 | V |
| B11 | `D_mono_up` | `1 ≤ m`, `g ≤ j ≤ m`, test fails on `[g,j)` | step applied only at `n < m` | V |
| B12 | `D_mono_down` | `1 ≤ m`, `gcc ≤ j ≤ m`, test passes on `[gcc,j)` | ditto | V |
| B13 | `below_gc_fails` | `i < gc m` | `Nat.find_min`; cast guarded by B5 | V |
| B14 | `sq_sub_self_mono` | `0 ≤ a ≤ b` (ℤ) | pure ℤ | V |
| B15 | `catalan_ge_one` | — | from `succ_mul_catalan_eq_centralBinom` + `Nat.choose_pos` | V |
| B16 | `D_range_le_cat` (**node 8 lift**) | `7 ≤ m`, `g ≤ m` | walks `g` to `gc m` by B11/B12, then B10 | V |
| B17 | `D_blt_m_eq` | `b < m` | `Cz b (m+1) = Cz b m = 0` by `Nat.choose_eq_zero_of_lt` | V |
| B18 | `Cz_blt_m_le_one` | `b < m` | `(m:ℤ)−1 = ((m−1:ℕ):ℤ)` valid as `m ≥ 1` | V |
| B19 | `D_blt_m_le_cat` (**`b < m` region**) | `b < m` | `D ≤ 1 ≤ Cat_{m−1}` | V |
| B20 | `D_tail_closed_form` | `1 ≤ m` | `b = 2m+j`, always `m ≤ b`, so no ℕ-sub | V |
| B21 | `D_tail_le_cat` (**node 9 tail clause**) | `9 ≤ m`, `1 ≤ j ≤ 5` | sign factor `j²−j−2m−2 ≤ 0` exactly on this window | V |
| B22 | `centralBinom_eq_two_mul_choose_pred` | `1 ≤ r` | `Nat.choose_succ_succ'` + `Nat.choose_symm`; `(2r−1)−r = r−1` needs `r ≥ 1` | V |
| B23 | `D_outer_eq_neg_cat` (**node 9 outer**) | `1 ≤ r` | two cancellations, `r ≠ 0`, `r+1 ≠ 0` | V |
| B24 | `MaR_le_cat` (**node 10**) | `1 ≤ a ≤ 6`, `15 ≤ r` | `m = r−a ≥ 9`; `r−1−a = m−1`; three-case split | V |
| B25 | `node11_bridge` (**node 11**) | `7 ≤ r` | `Gamma_unfold` at `6 ≤ r−1`; `r−1+1 = r` | V (and `7 ≤ r` is **sharp**) |
| B26 | `BdRR_le_neg_gamma` (**assembly**) | `15 ≤ r` | `Finset.sum_le_sum`, `max_le` with `Cat ≥ 0` | V |
| B27 | `BdRR_neg_ge15` | `15 ≤ r` | `gamma_pos_6` at `k = r−1 ≥ 14` | V |
| B28 | `layer_fixed_points` | — | `decide`; **unused downstream**, validation only | V |
| B29 | `layer_six_to_fourteen` (**the layer**) | `6 ≤ r ≤ 14` | `interval_cases` + `decide`, `maxRecDepth 8000` | V |
| B30 | `bdTailNegative_award` (**terminal**) | `6 ≤ r` | `by_cases r ≤ 14`: B29 / B27 — exhaustive | V |

**ℕ-subtraction and cast audit (brief §2 item 1).** Thirteen distinct ℕ
subtractions occur in the run's own content. Each is either provably
non-truncating under the hypotheses in force or discharged by `omega`, which
reasons soundly about ℕ truncation: `g²−g` and `(gc m −1)²−(gc m −1)` are
guarded by `sq_ge_self` (B5); `gc m − 1` by `gc_pos`; `m−1` in `catalan (m−1)`
by `m ≥ 1` at every call site (`b < m`, `m ≥ 7`, `m ≥ 9`); `2m−g` by `g ≤ m`;
`2r−1−a` and `2m+a−1` by `r ≥ 15, 1 ≤ a ≤ 6`; `r−1−a` by `r ≥ 15`; `2r−1` by
`r ≥ 1`; `(2r−1)−r` by `r ≥ 1`; `b−2m` and `2m−b` by their case hypotheses.
Every ℤ-cast of a ℕ subtraction is performed by `Nat.cast_sub` under an
explicitly supplied inequality, never by `push_cast` alone. **No truncation
defect found.** My evaluator models the truncation faithfully (`nat_sub`) and
reproduces the kernel-checked values, which is a second, independent confirmation
that no truncation is silently changing the object.

**Nothing marked NOT a dependency is a dependency.** `SOURCE/CritT-Main.lean` is
role `reference` in the contract; C-U2-T's ℕ-truncated `MaR0` appears **zero**
times in `Main.lean`, as do `BdRR_le_of_pointwise`, `node11`, `BdRR_neg_of_high`
and `D_argmax` — the shape is re-proved (B11/B12/B24/B25/B26), never carried.
The two excluded award terminals are absent. `star_star` occurs once, only in
the `gc_star_bound` docstring that records the mandated rename; no `star_star`
identifier exists.

## Reproduced Mathematical Evidence

Recomputed, not read off the prose, with my own exact-integer evaluator written
from the contract and Lean definitions alone
(`scratchpad/lane-b-informal/audit_eval.py`, `audit_probe.py`; transcripts
`audit_eval_output.txt`, `audit_probe_output.txt`). No prior evaluator was
imported; the shipped `EVIDENCE/generate_bd_tail_checks.py` was read only
afterwards, to audit it. Standard library only, explicit import lists, no
wall-clock/PID/host field.

**Definition of record and fixed points.** `BdRR 4 = 48`, `BdRR 5 = 33`,
`BdRR 6 = −16`, `BdRR 10 = −14406` — all four reproduced. The rejected
ℕ-truncated frame gives `BdRR₀ 4 = 42`, confirming the project holds the right
object.

**The record table, `r = 2..15`,** reproduced exactly:
`24, 31, 48, 33, −16, −210, −963, −3810, −14406, −52630, −191305, −695243,
−2535952, −9294964`.

**The conclusion.** `BdRR r < 0` for every `r ∈ [6,120]` (115 values, zero
failures); `BdRR r ≥ 0` for `r ∈ {2,3,4,5}` (the sharpness half — observed, not
claimed by this award).

**Node 9, outer identity.** `D(2r−1,r) = −Cat_r` for `r = 1..80`, zero failures;
`C(2r,r) = 2·C(2r−1,r)` likewise.

**Closed forms, as exact integer identities.** `D(2m−g,m)·(m+1)·(m−g+1) =
C(2m−g,m)·N(m,g)` over `m ≤ 60, g ≤ m` (1,890 cells, zero failures);
`D(2m+j,m)·(m+1)·(m+j+1) = C(2m+j,m)·(j²−j−2m−2)` over `m ≤ 60, j ≤ 40` (2,460
cells, zero failures). Both are the *same* algebra, the tail form being the
closed form at formal `g = −j`; I re-derived the bracket by hand and it collapses
to `j²−j−2m−2` and to `N(m,g) = g²+g−2m−2` respectively. `peak_bracket_integral`
verified on every cell where its hypothesis holds.

**The `b < m` region.** `D(b,m) = C(b,m−1)` and `D(b,m) ≤ 1` for every `b < m`,
`m ≤ 60`, zero failures; `Cat_n ≥ 1` for `n ≤ 80`.

**Node 8.** The `gc(m)` brackets (pass at `gc`, fail at `gc−1`) hold for
`m = 1..60`; `gc(m) ≤ m` for `m ≥ 3`; `gc(m) ≥ 5` for `m ≥ 7`. The step-sign
identity and both step lemmas hold on `m ≤ 40, g < m`. The interior-peak bound at
the witness and the **full lift** `D(2m−g,m) ≤ Cat_{m−1}` for every `g ≤ m` hold
for `m = 7..120`, zero failures. As a structural cross-check only — never as a
premise — the argmax of `g ↦ D(2m−g,m)` over `[0,m]` does coincide with `gc(m)`
for `m = 7..40`; the proof does not use this and does not need it.

**Node 9, tail clause, and its rank floor.** `D(2m+j,m) ≤ 0 ≤ Cat_{m−1}` for
`m = 9..120, j = 1..5`, zero failures. Both fences are load-bearing and I
exhibited the failures outside the stated hypotheses, as the brief requires:
`D(100,1) = 4751 > 0` (so there is no blanket non-positivity above `2m`), and at
the rank floor `D(21,8) = 3230 > Cat_7 = 429` with the sign factor
`j²−j−2m−2 = +2` at `(m,j) = (8,5)` — so `m ≥ 9` is exactly what the argument
needs, and `r ≥ 15` is precisely `m = r−6 ≥ 9`.

**Node 10.** `MaR a r ≤ Cat_{r−1−a}` for `r = 15..120, a = 1..6`: **zero
failures** (636 cells). The Hall range top is `2r−1−a = 2m+a−1` with `m = r−a`,
and the three-case split `{b<m} ∪ {m≤b≤2m} ∪ {2m<b≤2m+a−1}` partitions
`[0, 2m+a−1]` exactly, with no gap and no overlap — checked cell by cell.

**Node 11 and the imported positivity.** `Cat_r − Σ_{a=1}^{6} C(6,a)Cat_{r−1−a}
= Γ(6,r−1)` for `r = 7..200` under Lean's ℕ-truncating index, zero failures —
**and the hypothesis `7 ≤ r` is exactly sharp**: at `r = 6` the two sides differ
by 1 (`−89` vs `−88`), because ℕ truncation sends `5−6` to `catalan 0 = 1` while
`Γ`'s guard sends it to `0`. `Γ(6,k) > 0` for `k = 12..120`, zero failures;
`Γ(6,11) = −1563 < 0` and `Γ(6,12) = 16848 > 0`, so the imported lemma's
registered floor `k ≥ 12` is sharp and the proof uses it only at `k = r−1 ≥ 14`.

**Assembly.** `BdRR r ≤ −Γ(6,r−1) < 0` for `r = 15..120`, zero failures
(e.g. `r = 15`: `−9294964 ≤ −659003`).

**Why the layer cannot be folded in** (the fence's substance): inside `[6,14]`,
node 10 *fails* at `a ∈ {5,6}` for every single `r` — 13 failing `(a,r)` pairs —
and the imported `Γ(6,k) > 0` is simply false on `k = 5..11`, i.e. for
`r = 6..12`. The general argument therefore cannot reach the layer at all, and
`layer_six_to_fourteen` is correctly a separate `decide` case.

**Capsule and provenance.** All 22 sealed-capsule members verified byte-for-byte
against their declared digests and sizes; the manifest's `seal_sha256` was
recomputed independently (compact key-sorted JSON of the manifest minus the seal
field) and equals `c64e6393c628a330cfb7b142297fbdc004587d5fe3b3ff26c916e71cfd8425bd`,
the value the brief names. All seven `SOURCE-DIGESTS.json` entries match, and
`SOURCE/C6LA4-award-Main.lean` / `SOURCE/C3LA1-award-Main.lean` are bit-identical
to the live `Main.lean` of the two r25 award runs. Pinned Mathlib statements were
read at the pinned revision `905b9581…` and are as the proof uses them:
`Nat.choose_succ_right_eq`, `Nat.choose_mul_succ_eq`, `Nat.choose_symm`,
`Nat.choose_succ_succ'`, `Nat.centralBinom_eq_two_mul_choose`,
`Nat.succ_mul_centralBinom_succ`. The kernel receipt reads
`verdict.code = "verified"` with every check passed and
`source_sha256_before == source_sha256_after == 2791103a…`; the build log shows
`Build completed successfully (8657 jobs)` and zero errors. `#print axioms`
over all 96 declarations reports exactly `{propext, Classical.choice,
Quot.sound}` and nothing else — no `sorryAx`. Grep counts in `Main.lean`:
`sorry` 0, `admit` 0, `native_decide` 0, `axiom` 0, graph vocabulary 0.

## Independent Critic Pass

A separate adversarial pass over my own ledger, hunting for the ways this
composition could be unsound. Twelve attacks, all repelled:

1. **Gap at `g = m` in the walk.** `D_step_up`/`D_step_down` require `g < m`.
   In B11/B12 the step is applied only at `n` with `n+1 ≤ m`, so `n < m`; the
   endpoint `j = m` is reached by the induction, never by a step at `m`. No gap.
2. **`gc m` escaping `[0,m]`.** `D_mono_up` needs `gc m ≤ m`; supplied by B6,
   which needs `m ≥ 3`, available from `m ≥ 7`. `D_mono_down` needs `g ≤ m`,
   which is `D_range_le_cat`'s own hypothesis.
3. **`interior_peak_le_cat` applied off-scope.** It is invoked once, in B10, at
   `7 ≤ m` and `g = gc m ≤ m` with both bracket inequalities discharged from
   `Nat.find_spec`/`Nat.find_min`. Registered scope respected exactly.
4. **An empty `Finset.sup'`.** `MaR`'s nonempty obligation is
   `Finset.range (2r−1−a+1)` with `x+1 ≠ 0` — unconditional. No hidden
   side-condition.
5. **ℕ truncation in `MaR`'s range at small `r`.** Truncation could only bite at
   `a > 2r−1`; node 10 carries `r ≥ 15, a ≤ 6`, and `omega` derives
   `b ≤ 2m+a−1` soundly through the truncation. The layer, where truncation
   could matter, is a separate `decide` over the assembled object itself.
6. **A non-exhaustive case split in node 10.** Checked cell by cell for
   `m = 9..19, a = 1..6`: the three cases partition `[0, 2m+a−1]` with no gap and
   no double count.
7. **A non-exhaustive terminal split.** `by_cases r ≤ 14` under `6 ≤ r` gives
   `6 ≤ r ≤ 14` and `r ≥ 15`; both branches are discharged and `omega` supplies
   `15 ≤ r` in the second.
8. **The peak asserted rather than witnessed.** `gc` is `Nat.find` on the
   *arithmetic* predicate `2m ≤ g²−g`, whose existence witness is `g = m+1`.
   Nothing anywhere asserts that `g ↦ D(2m−g,m)` attains a maximum. The lift is
   obtained by walking, not by extremality. (My argmax cross-check in the
   evidence section is an observation of mine, not an input to the proof.)
9. **Circularity or a cross-frame dependency between the two imports.** The
   `Erdos993G1.U3` region references **no** `ErdosR25C6U2` name (checked for all
   29 exported names), and vice versa; each block is byte-identical to a project
   that compiled standalone. The dependency order is
   Mathlib → {C6U2, U3} → AddBdTail → terminal. Acyclic.
10. **Silent capture by the two added `open`s.** This is the only way an `open`
    could change mathematics, so I checked it directly: across *all* 96
    declaration **statements**, the only non-local identifiers are `Nat.choose`,
    `Finset.Icc`, `Erdos993G1.U3.Gamma` (all fully qualified) and root-namespace
    `catalan`. There is no `Nat.catalan` or `Finset.catalan` to capture it. A
    capture inside a *proof body* could only produce an elaboration error, never
    a different theorem, because the kernel checks each proof against its stated
    proposition — and the build is clean.
11. **The sharpness half smuggled in.** The terminal has no second conjunct.
    `layer_fixed_points` states four *equalities* (not "≥ 0 exactly at"), is
    **used by nothing**, and is labelled validation evidence in
    `INFORMAL-PROOF.md` §0. The award is the `r ≥ 6` half alone.
12. **`decide` doing something it shouldn't.** The layer uses plain `decide`
    with `set_option maxRecDepth 8000 in` scoped to the declaration — matching
    the r25 record's own `≈ 8000 at r = 13, 14` — and the axiom probe shows no
    `native_decide` and no extra axiom. `noncomputable` on `MaR`/`BdRR` blocks
    compilation, not kernel reduction, so `decide` remains kernel-checked.

**Re-read before close.** I re-read `INFORMAL-PROOF.md` §§0–7, the terminal
declaration and its three-lemma closure, `THEOREM-CONTRACT.yaml`'s
`theorem`/`hypotheses`/`conclusion`/`lean_binding`, and the brief's §2 fence list
after completing the evidence, and re-ran both evaluators. No verdict changed.

## Scope and Fence Check

Every fence of the formalizer brief §2, and the excluded conclusions of the
synthesis dispatch:

- **Binomial-integer arithmetic; no graph content.** Honored. Zero occurrences
  of any graph vocabulary in `Main.lean`; `Cz`/`D`/`MaR`/`BdRR` are C-U2-F's
  integer functions. Stated on the claim's face.
- **NOT the `d = 5` band's closure.** The claim asserts nothing about the band.
  `INFORMAL-PROOF.md` §0 states the non-effect explicitly, including "a count of
  formal inputs is not a grade". See observation O3 on the contract text.
- **`D_unimodal_peak` must not appear in any form.** Ruled on below (finding a).
- **The maximiser is a witness, never asserted to exist.** Honored; see critic
  attack 8.
- **`g_c(m)` is `Nat.find` on `g²−g ≥ 2m`.** Honored, with the brackets from
  `Nat.find_spec`/`Nat.find_min`/`Nat.find_min'`. The brief names
  `Nat.lt_find_iff`; `Nat.find_min` is the equivalent minimality lemma and the
  substitution is immaterial.
- **The tail clause only on the `a−1 ≤ 5` indices.** Honored exactly:
  `D_tail_le_cat` carries `9 ≤ m`, `1 ≤ j`, `j ≤ 5`. Both fence witnesses
  reproduced (`D(100,1) = 4751`; `D(21,8) = 3230 > Cat_7`).
- **The `[6,14]` layer stays a separate `decide` case.** Honored; and I
  established that folding it in is impossible, not merely disallowed.
- **No `sorry`/`admit`/`native_decide`; axioms within the three standard ones.**
  Honored, verified three ways (grep, kernel receipt, 96-way axiom probe).
- **Sharpness half out of scope.** Honored on the contract's face and in
  `INFORMAL-PROOF.md` §0.
- **Attribution (condition i).** `INFORMAL-PROOF.md` §5 carries seat U2, C-U2-F,
  C-U2-T (reference only), the C3 award and the addendum formalizer, node by
  node, matching the synthesis's Dispatch 4 and B4/B5. See observation O4.

### Ruling on finding (a) — the barred name `D_unimodal_peak`

**Ruling: no declaration, hypothesis, or asserted shape of `D_unimodal_peak`
exists anywhere in this project. The fence's substance is honored. This is not a
defect.**

The identifier occurs exactly once in the 1,884-line `Main.lean`, at line 598,
inside the doc-comment of the imported `ErdosR25C6U2.interior_peak_le_cat`, in
the negative fence sentence "…`g_c` entering only as a WITNESS of these two
inequalities, never asserted to exist: precisely the distinction that makes
`D_unimodal_peak` false and this true". I searched for any declaration,
hypothesis, existential, or premise of that shape and found none: there is no
`def`/`lemma`/`theorem` of that name, no hypothesis asserting that
`g ↦ D(2m−g,m)` attains a maximum, and no argument that relies on such a thing —
the lift is obtained by walking every `g` to the `Nat.find` witness, and the
witness is a witness of two *arithmetic* inequalities about `g²−g`, not of any
extremal property of `D`.

Three further facts settle the literal-text tension in the fence's wording
("not even as a struck name"):

1. The sentence is inside a fragment that is **byte-identical** to the C6-LA4
   award — I verified this mechanically, digest line and body both. Removing the
   token would break the byte-identity that the brief requires of every
   re-registered fragment and would alter content the record forbids altering.
   The two requirements cannot both be met literally; byte-identity governs,
   because it is the one that protects mathematical content.
2. That exact sentence is **the governing text's own wording**: the r25 terminal
   synthesis writes it verbatim in Dispatch 4 (`C6-SYNTHESIS.md` line 1076) —
   and then, twenty-three lines later (line 1099), states the fence
   "`D_unimodal_peak` must not appear in any form". The fence's own author used
   the struck name in exactly this negative-fence way in the same dispatch.
   Reading the fence to bar the token would make the governing text violate
   itself. It bars the *object*, not the *string*.
3. The C6-LA4 award's own fidelity review identified and accepted this same
   occurrence on the same grounds; this run inherits that ruling rather than
   reopening it.

I record the occurrence as a disclosed, non-blocking inheritance, correctly
reported by the producer in `INFORMAL-PROOF.md` §7.

### Ruling on finding (b) — the structural additions and the `def` registration

**Ruling: none of the three changes mathematical content. Established
mechanically, not by assertion.**

- **Two top-level `open` statements** (`open ErdosR25C6U2` after the `Cz` entry;
  `open Nat Finset` after the `Gamma` entry). Both sit *outside* every copied
  `namespace … end` block; no character inside any copied declaration changed.
  An `open` alters name resolution only — it introduces no definition, no axiom
  and no proposition. I verified the one path by which it could still matter:
  across all 96 declaration statements the only non-local identifiers are
  `Nat.choose`, `Finset.Icc` and `Erdos993G1.U3.Gamma` (fully qualified) plus
  root-namespace `catalan`, which neither `Nat` nor `Finset` can capture; and
  the `Erdos993G1.U3` region references no `ErdosR25C6U2` name at all, so
  `open ErdosR25C6U2` cannot reach it. Note that the `open Nat Finset` genuinely
  widens the scope the C6-LA4 source had (that file opens nothing), so this was
  the right thing to check rather than assume. Inside a proof body, a capture
  could only cause an elaboration failure; it could never change the proposition
  the kernel checks. **No content change.**
- **Five relocated doc-comments.** Each moves a `/-- … -/` declaration
  doc-comment from the tail of one `Erdos993G1.U3` entry to the head of the
  adjacent entry it documents (`catalan_cross_strict`, `gamma_one_pos`,
  `monotone_ratio`, `binom_five_pow_split`, `gamma_neg_of_ge_eight`); in every
  case the comment's own prose names the lemma it now precedes. Doc-comments are
  metadata and carry no mathematical force. The reconstruction check proves the
  moves are *pure*: after stripping only the wrapper and the two `open` blocks,
  the whole 442-line `Erdos993G1.U3` declaration stream matches the source
  byte-for-byte, so nothing was added, deleted, reworded or reordered — only
  carried across an entry boundary. **No content change.**
- **`transitionExists` registered as a `def`.** The declaration is a proof of
  the proposition `∃ g : ℕ, 2*m ≤ g^2 − g`. The keyword affects storage and
  elaborator reducibility, not the proposition, and by Lean's definitional proof
  irrelevance `Nat.find` returns the same value whichever proof it is handed, so
  `gc` is well defined and independent of the choice. The ℕ subtraction in the
  predicate never truncates (`sq_ge_self`), and the project proves the ℤ-cast
  brackets separately. Lean's `defProp` linter flags it as style; the producer
  disclosed both the flag and the reason (the registrar requires all
  `definition`-kind entries before any `lemma`-kind entry, and `gc` is itself a
  definition that consumes this proof). `gc` is never `decide`d, so the
  reducibility difference has no consequence either.
  **Registrational, not mathematical. No content change.**

### Observations (non-blocking; none is a defect in the proof)

**O1 — the record's "19 failures at `r ≤ 14`" does not reproduce.** The r25
terminal synthesis's successor route S-U-1 (and the formalizer brief's fence
quoting it) warns that `M_a(r) ≤ Cat_{r−1−a}` "has 19 failures at `r ≤ 14`". On
my own instrument the count is **14** over `r ∈ [1,14], a ∈ [1,6]` — namely
`(5,5), (5,6), (6,6), (5,7), (6,7), (5,8), (6,8), (5,9), (6,9), (6,10), (6,11),
(6,12), (6,13), (6,14)` — of which **13** lie in the layer `r ∈ [6,14]`. I tried
nine enumeration conventions (including `r` from 0 or 2, skipping negative
Catalan indices, and the ℕ-truncated `MaR0` frame); none yields 19. The only
variant that overshoots is extending to `a ≤ 7`, which gives 22 and is not the
award's range. This is a parenthetical carried in the *record*, not a claim of
the artifact under audit: neither `THEOREM-CONTRACT.yaml` nor
`INFORMAL-PROOF.md` nor `Main.lean` asserts any failure count, and the fence's
substance — keep the layer separate — is confirmed with margin. Flagged for the
controller as a record-hygiene item.

**O2 — `EVIDENCE/axioms.txt` is not in condition (v)'s "one axiom per line"
form.** The file is the raw probe stdout: four benign Lean linter/deprecation
warnings followed by the single line `'ErdosR25AddBdTail.bdTailNegative_award'
depends on axioms: [propext, Classical.choice, Quot.sound]`. The axiom content is
correct and within the allowlist, and the 96-way probe file is complete and
clean; only the format deviates from what condition (v) specifies. A downstream
consumer parsing one-axiom-per-line would misparse this file.

**O3 — two condition-(ii)/(v) completeness gaps, both documentation-level.**
(a) The contract's `informal_statement` carries the sharpness exclusion and the
no-graph fence but not the "does not close the `d = 5` band" non-effect, which
appears only in `INFORMAL-PROOF.md` §0. The claim nonetheless *asserts* nothing
fenced, which is the substantive requirement. (b) The `FORMALIZER-REPORT.md`
hash table predates the report's own pre-review correction: four of its twelve
rows are stale (`THEOREM-CONTRACT.yaml`, `RECEIPTS/kernel-verification.json`,
`RECEIPTS/theorem-contract.json`, `EVIDENCE/axioms.txt`). The corrected digests
are stated correctly elsewhere in the same report and in the kernel receipt, and
I verified the live files against those corrected values; no binding digest is
wrong, the table is simply not regenerated.

**O4 — node 2b's joint attribution travels on the Lean face but not in
`INFORMAL-PROOF.md`.** Condition (i) requires C-U2-T to receive joint credit on
node 2b. `Main.lean:473` carries it verbatim in the imported `D_step_sign`
docstring ("NODE 2b (critic C-U2-F, PRIMARY; independently compiled by critic
C-U2-T, FALLBACK — joint attribution on this node)"), so it is on the award's
face; but `INFORMAL-PROOF.md` §5 lists `D_step_sign` under C-U2-F alone and
credits C-U2-T only for the assembly shape. A one-line addition would close it.

**O5 — the shipped generator's node-11 check is less discriminating than the
Lean lemma.** `EVIDENCE/generate_bd_tail_checks.py` reports the bridge identity
with "0 mismatches, r = 1..60", but its `catalan(n)` returns `0` for `n < 0`,
which is `Γ`'s own zero-extension guard — so its two sides agree by construction
and the check is vacuous below `r = 7`. Lean's `node11_bridge` instead uses
ℕ-truncating `catalan (r−1−a)` (`catalan 0 = 1` on underflow), and under *that*
convention the identity is false at `r = 6` and true from `r = 7`. The Lean
lemma's hypothesis `7 ≤ r` is therefore exactly right and exactly sharp, and it
is invoked only at `r ≥ 15`; I verified the Lean-faithful version myself for
`r = 7..200`. No consequence for the award — recorded so the evidence file is not
mistaken for a test of the hypothesis.

**O6 — `layer_fixed_points` is registered as entry 94, not first.** The brief
asks for the four fixed points "by `decide` BEFORE anything else". They are
present and kernel-checked, and the lemma depends on nothing but `BdRR`, so its
file position has no logical consequence; `INFORMAL-PROOF.md` §7 states the
position honestly rather than papering over it. Recorded for completeness.

## Composition ruling

This is the GATE-RULING-8 isolated second read. The r25 terminal synthesis
declined to fund this composition for two stated reasons — open nodes, and that
"the two critics' completed halves sit in **incompatible definitional frames**,
so assembling them is a *new composition* that gate ruling 8 would subject to an
isolated second read the terminal cycle cannot afford". I rule on each limb.

**1. Is the composition sound on ONE frame, with no hidden dependency? Yes.**

The frame incompatibility was between C-U2-F's integer-rank `MaR`/`BdRR`
(`BdRR 4 = 48`) and C-U2-T's ℕ-truncated `MaR0` (`42`), which additionally omits
the `max 0` on each summand. This run resolves it in the only admissible
direction: it adopts **C-U2-F's frame of record, character for character**, and
uses C-U2-T only as a *shape*, re-proving `MaR_le_cat`, `node11_bridge`,
`BdRR_le_neg_gamma` and `BdRR_neg_ge15` on the frame of record. `MaR0` and every
C-U2-T lemma name appear zero times. The fixed-point discrimination test is
kernel-checked inside the project (`BdRR 4 = 48`) and independently reproduced by
me, together with the `42` that the rejected frame would give — so the object is
demonstrably the right one, not merely asserted to be.

There is exactly one frame in the assembled project. `Cz`/`D`/`N` are the
C6-LA4 definitions; `MaR`/`BdRR` are the `CriticF2.lean` definitions expressed in
those same `Cz`/`D`; `Γ` is the C3 award's own definition and enters only through
`node11_bridge`, a *definitional* identity between a `Γ`-shaped expression in
`catalan` and `Erdos993G1.U3.Gamma 6 (r−1)`, proved by `Gamma_unfold` — no
translation layer, no re-axiomatisation, no second copy of any object.

No hidden dependency exists. The dependency order is
Mathlib → {`ErdosR25C6U2`, `Erdos993G1.U3`} → `ErdosR25AddBdTail` → terminal, and
it is acyclic: the `Erdos993G1.U3` block references no `ErdosR25C6U2` name and
vice versa (checked name by name), each block is byte-identical to a project that
compiled standalone, and the only additions — two `open`s and five doc-comment
relocations — are scope and metadata, proved content-free by the byte-identical
reconstruction of both declaration streams. The two award terminal theorems are
not re-registered and are called nowhere, so the composition rests on the awards'
*fragments* at their own registered scopes rather than on their headline claims.
Nothing is imported that the contract does not account for, and nothing marked
reference-only is load-bearing.

The five nodes the synthesis listed as open are all closed here, and I verified
each independently: node 8's lift from the interior peak to the whole
`Finset.sup'` (B16, via the walk, `m ≥ 7`); the `b < m` region (B19); node 9's
tail clause on the `a−1 ≤ 5` indices (B21, `m ≥ 9`, `1 ≤ j ≤ 5`); node 10
`M_a ≤ Cat` at `r ≥ 15` (B24); and `g_c` as `Nat.find` (B4, with B6–B9, B13).
The split point `r ≥ 15` is not arbitrary: it is exactly `m = r − 6 ≥ 9`, the
rank floor the tail clause needs, and it comfortably clears the `r − 1 ≥ 12` the
imported `Γ` positivity needs.

**2. Is every imported fact used at its registered scope? Yes — exactly, with
margin, and never at the boundary by accident.**

- The C3 award's `Γ(6,k) > 0` is registered for `k ≥ 12`. It is invoked once, at
  `k = r − 1` under `r ≥ 15`, i.e. `k ≥ 14`. I confirmed the floor is sharp
  (`Γ(6,11) = −1563 < 0 < 16848 = Γ(6,12)`), so the two-step margin is real and
  the lemma is never used below its base.
- The C6-LA4 award's `interior_peak_le_cat` is registered for `7 ≤ m`, `g ≤ m`
  and the two bracket inequalities. It is invoked once, in `D_peak_le_cat`, at
  `m ≥ 7` with `g = gc m`, `gc m ≤ m` from `Nat.find_min'`, and both brackets
  from `Nat.find_spec`/`Nat.find_min`. No hypothesis is dropped or weakened.
- The step-sign law and `D_step_up`/`D_step_down` are registered for `g < m`,
  `1 ≤ m` plus the sign test; the induction applies them only at indices
  strictly below `m`, with the sign test supplied pointwise from
  `below_gc_fails` (ascending) and from `gc_hpass_int` + `sq_sub_self_mono`
  (descending).
- `Gamma_unfold` is registered for `τ ≤ k` and used at `6 ≤ r − 1`, i.e.
  `r ≥ 7`, inside a lemma invoked only at `r ≥ 15`. I confirmed that `7 ≤ r` is
  the exact threshold at which the ℕ-truncating bridge becomes true.

**3. Is the `[6,14]` layer kept separate? Yes, and necessarily so.**

`layer_six_to_fourteen` is a standalone `decide` case; `MaR_le_cat` carries
`15 ≤ r` in its own statement; the sole join is the terminal theorem's
`by_cases h : r ≤ 14`. This is not a stylistic separation. Inside `[6,14]`,
node 10 *fails* at `a ∈ {5,6}` for every `r` (13 failing pairs, listed in O1),
and the imported `Γ(6,r−1) > 0` is false for `r = 6..12`. The general argument
is unavailable on the layer on two independent counts, so folding it in is
impossible, not merely forbidden — and the artifact does not attempt it.

**Composition ruling: the assembled composition is SOUND on one frame, with no
hidden dependency; every imported fact is used strictly within its registered
scope; and the `[6,14]` layer is kept properly separate.** The reason r25 gave
for declining to fund it — incompatible frames plus an unavailable isolated
second read — is discharged: the frames were reconciled onto C-U2-F's object of
record with a kernel-checked discrimination test, and this audit is the isolated
second read. Registration of the `r ≥ 6` half is supported on the composition
limb of gate ruling 8.

## Verdict

**passed**

The informal proof in `INFORMAL-PROOF.md` is a correct, complete and honestly
scoped proof of exactly the contract's `informal_statement` — `Bd(r,r) < 0` for
every integer `r ≥ 6`, on C-U2-F's integer-rank `MaR`/`BdRR` of record. Every
definition matches its source literally; every hypothesis is accounted for at the
point it enters; every ℕ-subtraction and cast is non-truncating or soundly
discharged; every numeric claim was recomputed independently with exact integers
and reproduced; every equality used as an identity was recomputed rather than
read; every imported fact is used inside its registered scope; and every fence of
the formalizer brief §2 is honored. The two routed findings are ruled **not
defects**: the single `D_unimodal_peak` token is a struck name in a byte-identical
imported doc-comment whose wording is the governing text's own, with no
declaration, hypothesis or asserted shape of it anywhere; and the two `open`
statements, five doc-comment relocations and the `def` registration of
`transitionExists` are scope, metadata and registration respectively, proved
content-free by a byte-identical reconstruction of both imported declaration
streams. No defective step was found, and no defect was softened. The six
observations O1–O6 are record-hygiene, evidence-format and documentation items;
none touches the mathematics, and none is a ground for withholding the pass.

Attestation `b-la1-informal-pass-20260922`, reviewer
`b-la1-fable-informal-20260922`, over producer
`b-la1-formalizer-sonnet-20260922`'s artifact at `Main.lean`
`2791103a374f6737787d405903aaf3ea241e114864367668c1908f3883627da9`.
