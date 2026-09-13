# THE COMPLETE LEAN PACKAGE MANIFEST — r20 Pair-Invariant DRE (Erdős #993)

**Compiled by:** `R20C9-T3`, Cycle 9 (TERMINAL RECONCILIATION), 2026-09-13.
**Scope:** every award-track Lean artifact of the run, C2→C8, plus this
cycle's clean re-ships (C9). Destination: the public repo's `proofs/`
tree, per `control/CYCLE9-ALLOCATION.md` seat T-3.
**Pin:** Lean `4.32.2` (`f3b06c705e6c85f5314019d5d3baab0fec5b580c`) /
Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`, verified by direct
`lean --version` / `lakefile.toml` `rev=` inspection on every project
below — identical pin, no drift, across all eight cycles.
**Approved axiom envelope:** `[propext, Classical.choice, Quot.sound]`
(Mathlib's own baseline). Every declaration below was type-checked
**fresh, this session**, against the sealed source bytes (byte-identity
confirmed by `sha256` against each cycle's own gate-record-cited digest
where one was cited); the "rebuild" columns report what *this session's*
kernel actually said, not a transcription of a prior session's claim.

## CEILING HONESTY (contract §8, verbatim, from raw bytes — carried at
the top of this terminal artifact per AMD-9)

> TREE / FOREST / TRANSFER / COUNTEREXAMPLE open; candidate invariants
> are mechanisms — mechanism kills are never target counterexamples;
> computation is evidence, never proof; no bounded zero is evidence of
> anything; nothing is ever formally_verified.

Nothing in this manifest is a proof of, or evidence toward, weak-unimodal
preservation for Erdős #993. Every declaration below is either (a) pure
structural/integer algebra with no bridge to a tree, forest, or
independence polynomial (the generation laws, Lemma A, Lemma B*, the
window/margin/ratio lemmas), or (b) a machine-checked corollary of such
algebra. `#print axioms` establishes *what the kernel accepted*, never
that the accepted statement bears on the target.

---

## Rebuild methodology (disclosed, so the "fresh" claim is checkable)

For each cycle's canonical Lean project, this seat: (1) copied the sealed
`.lean` sources verbatim into an isolated build directory under this
seat's own scratchpad (`scratchpad/R20C9-T3/rebuilds/R20C<n>/`); (2)
verified `sha256` against the digest already cited in that cycle's own
gate record wherever one exists; (3) symlinked `.lake` to the run's
shared, pre-fetched Mathlib `905b9581` build cache
(`~/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake` — the same
cache every prior cycle's route and critic seats used); (4) ran
`lake build <Check-target>`, capturing every `#print axioms` line; (5)
deleted only this project's own four-to-nine `.olean`/`.ilean`/`.trace`
outputs (never Mathlib's) and rebuilt a second time from clean, diffing
the two `#print axioms` transcripts and the two sets of `.olean`
`sha256`s for byte-identity.

**Two independent clean rebuilds, byte-identical both times:** C2, C3,
C4, C5, C6, C7 (this seat's own fresh verification of the C2–C7 award
lineage), the C8-sealed-original bytes (unedited, re-verified against
the C9 clean re-ship for content-identity — see §C8/C9 below), and the
three C9 clean re-ships themselves.
**One rebuild only (disclosed, not doubled):** the C2 Tier-B repaired
form (`AdjT.phistar_soundness_registered_exact`), checked via a direct
`lake env lean` probe rather than a full second from-clean rebuild —
scope-limited honestly rather than silently claimed as double-checked.

---

## C2 — Window-theorem chain (`cycles/cycle-2/C2-GATE-RECORD.md` §1)

| path | sha256 | declarations | axiom receipt (this session, fresh) | award standing |
|---|---|---|---|---|
| `scratchpad/R20C2-T3/LeanProject/R20C2T3.lean` | `a5c8892f8fce7ebf0d89f6a4b67a066f9337199721628090dfb0b73b87438e9f` (matches the gate's own `a5c8892f…` cite exactly) | 16: `chain_le_of_step_le`, `chain_ge_of_step_ge`, `exists_fall_step_of_not_le`, `exists_rise_step_of_not_ge`, `isMaximizer_of_unimodal_witness`, `step_sign`, `noFallBeforeRise_of_unimodal`, `no_fall_before_max`, `no_rise_after_max`, `unimodal_of_noFallBeforeRise_of_isMaximizer`, `exists_isMaximizer`, `unimodal_iff_noFallBeforeRise`, `unimodalOn_of_unimodal`, `window_theorem`, `no_local_dip_of_unimodal`, `phistar_soundness` | 16/16 within `[propext, Classical.choice, Quot.sound]` (2 use only `[propext, Quot.sound]`); 0 `sorryAx`; two clean rebuilds, byte-identical `.olean` both times | **TIER A — AWARDED, RG**: `unimodal_iff_noFallBeforeRise`, `step_sign`, `window_theorem` + eight supporting lemmas (11 of the 16). **TIER B — `phistar_soundness` REJECTED AS SHIPPED** (strictly weaker than registered Φ* on two axes) — award moves to the repaired form below. |
| `scratchpad/R20C2-ADJ-T/LeanProject/AdjT.lean` | `f68ee166783ca86478d91571e525f862dd3b606b5308af9668b70cac053c129d` | 5: `exists_isMaximizer_of_zeroPoint`, `finsupp_shiftSum`, `phistar_soundness_registered_exact`, `repair_follows_from_registered_exact`, `route_form_follows_from_registered_exact` | 5/5 within `[propext, Classical.choice, Quot.sound]`; 0 `sorryAx`; one fresh rebuild (`lake env lean` probe, disclosed as single, not doubled) | **TIER B — AWARDED, RG, AT THE REPAIRED EXACT FORM ONLY**: the award attaches to `AdjT.phistar_soundness_registered_exact` (`f`-hypothesis exactly `0 ≤ f 0`; antecedent exactly `[0, m−1]`), not to the route's own `phistar_soundness` above. |

## C3 — Tier C (`cycles/cycle-3/C3-GATE-RECORD.md` §1)

| path | sha256 | declarations | axiom receipt (fresh) | award standing |
|---|---|---|---|---|
| `scratchpad/R20C3-T3/LeanProject/TierC.lean` | `69c29ab620b8a75c47930fa40714c46aed28b126346e61076f5e3c6ba11e9208` | 7: `gap_identity_raw`, `gap_identity_abs`, `window_span_eq_gap`, `gap_le_two`, `mf_le_mg_succ`, `gap_eq_two_iff`, `safe_strata` | 7/7 clean (some `[propext]` alone, up to the full triple); 0 `sorryAx`; two clean rebuilds, byte-identical | **Tier C AWARDED, RG, DECOUPLED** — the safe-strata/gap-identity bundle, with both mandatory certificate conditions executed (non-minimality note; target-implying-premise flag). |
| `scratchpad/R20C3-T3/LeanProject/ClosureStep.lean` | `312378c23a846b7b012db69ef837e2fc1f5aa210af8c25cd6e1bcf63e5a26299` | 2: `closure_step`, `closure_step_window_localized` | 2/2 clean; 0 `sorryAx`; two clean rebuilds | **`closure_step` REFUSED** — strictly weaker than the C2 Tier-B award on the same axis the C2 precedent rejects; **recorded as an INTEGRATION ARTIFACT, no row**, despite compiling clean. Compiling ≠ awarded. |

## C4 — gap lemmas (in `control/CYCLE9-ALLOCATION.md`'s own "C2→C8" range; omitted from the seat-charge's illustrative parenthetical — flagged here as an honest completion, not silently dropped) (`cycles/cycle-4/C4-GATE-RECORD.md` §2)

| path | sha256 | declarations | axiom receipt (fresh) | award standing |
|---|---|---|---|---|
| `scratchpad/R20C4-T3/LeanProject/R20C4T3.lean` | `ac1106321829ae08f2bfa3ea84108a1d31a99de13b001bab217eec9185ac4289` | 5: `firstArgmax_strict_before`, `theorem_NR`, `theorem_R1`, `gap_iff_lemma`, `gap_eq_R2_or_R2'` | 5/5 clean; 0 `sorryAx`; two clean rebuilds | `gap_iff_lemma` **RG AWARDED as shipped**. `theorem_R1` **RG AWARDED with the mandatory NON-MINIMALITY NOTE**. `theorem_NR` **NOT AWARDED as shipped** (counter-model `f = δ_0`; repair deferred to C5 — fulfilled below). `gap_eq_R2_or_R2'` **NOT AWARDED as shipped** (hypothesis-free tautology). |
| `scratchpad/R20C4-T3/LeanProject/Skeleton.lean` | `97f3865daae00dae0cd3063580e4af9429ba43a948606ae8d924b9f42e4d5a7c` | 3: `left_step_to_range`, `right_step_to_range`, `scheme_closure_implies_unimodal` | 3/3 clean; two clean rebuilds | **NO AWARD, NO ROW — INTEGRATION ARTIFACT.** The companion `GraphLaws` skeleton is VACUOUS (`graphLaws_inconsistent`); repair re-ordered for C5 (`mode_spec_on_i`). |

## C5 — sum-algebra awards (`cycles/cycle-5/C5-GATE-RECORD.md` §2)

| path | sha256 | declarations | axiom receipt (fresh) | award standing |
|---|---|---|---|---|
| `scratchpad/R20C5-T3/LeanProject/R20C5T3.lean` | `9c9db7b93fd25e6ee074e94d9298083f0423cb7365651305e5d3ba14069f11c7` | 8: `IsFirstArgmax`, `firstArgmax_strict_before`, `isMaximizer_of_eq_max`, `theorem_NR_as_registered`, `theorem_R1_as_registered`, `gap_iff_lemma`, `gap_eq_R2_or_R2'`, `gap_eq_R2_or_R2'_composed` | 8/8 clean (2 need no axioms at all); 0 `sorryAx`; two clean rebuilds | `theorem_NR_as_registered` **RG AWARDED** — the C4-deferred award now granted under route custody, two mandatory certificate notes. `gap_eq_R2_or_R2'_composed` **RG AWARDED** — the C4 "composed by the reader" defect cured. |
| `scratchpad/R20C5-T3/LeanProject/Skeleton.lean` | `2d035198ead5df9620823028a05092bd35470d46fe03dcf9412bd4a76106638d` | 4: `scheme_closure_implies_unimodal`, `toyGraphLaws_nonempty`, `toyClosureHyp`, `toy_edge_unimodal` | 4/4 clean; two clean rebuilds | **NO AWARD, NO ROW — INTEGRATION ARTIFACT** (unchanged from C4), but the C4 "no model exhibited" gap is DISCHARGED (consistency settled by exhibited 3-forest model). |
| `scratchpad/R20C5-T3/LeanProject/NetzeroCap.lean` | `00d41b8578917d331ddbf22505bdb85416cf6928497ed760f55b54507897a2b2` | 3: `indepCount_le_choose`, `indepCount_one_eq_card_V`, `indepCount_one_eq_choose_one` | 3/3 clean; two clean rebuilds | **NOT AWARDED as shipped** — the "statement-faithful" claim FALSE and STRUCK (the certificate's `i_k ≤ C(i₁,k)` never actually stated in Lean); eligible on a one-line re-ship — **fulfilled at C6, item (a) below.** |

## C6 — cap / FM / R-ratio / margin artifacts (`cycles/cycle-6/C6-GATE-RECORD.md` §2)

Gate record's own custody note: "reproduced twice at the pin (8,665 jobs
exit 0, 9/9 axiom lines byte-identical)" — this session's independent
rebuild, run six days later from the same sealed bytes, reproduces the
same 9/9 count and the same axiom set, clean.

| path | sha256 | declarations | axiom receipt (fresh) | award standing |
|---|---|---|---|---|
| `scratchpad/R20C6-T3/LeanProject/NetzeroCap.lean` | `4ffdc7aa56e6619e64b6c08c7f3264152f984842d12262311820282ceb7fad7d` | 5: `indepCount_le_choose`, `indepCount_one_eq_card_V`, `indepCount_one_eq_choose_one`, `indepCount_le_choose_own_n`, `indepCount_is_adequate` | 5/5 clean; two clean rebuilds | (a) **RG AWARDED** — the C5 fidelity gap closed; X7's three mandatory notes executed. |
| `scratchpad/R20C6-T3/LeanProject/FMLemma.lean` | `27160e0e84a84e3a87b88144efb54df705910d173bbce9bd069e6a3876df3c56` | 1: `lemma_FM` | 1/1 clean; two clean rebuilds | (b) **RG AWARDED** — `IsMaximizer` correctly the unqualified any-argmax notion. |
| `scratchpad/R20C6-T3/LeanProject/RRatioBound.lean` | `63cab068b8164aac0bdea22ade5e5c85cfe81a4117baaf1b6a309928b362057c` | 1: `r_logconcave_ratio_bound` | 1/1 clean; two clean rebuilds | (c) **HELD — NOT AWARDED.** The mandatory "does NOT imply T1" line is carried nowhere on the shipped face. Awaits a successor re-ship — **fulfilled at C7 below.** |
| `scratchpad/R20C6-T3/LeanProject/MarginIdentities.lean` | `4f1b449ab506031aaaaf157045236b9b07aeae29a7131432bf3e428fcc2d8ccb` | 2: `marginB_eq_deltaF_add_one`, `marginA_eq_one_sub_deltaF_sub_plateauSpan` | 2/2 clean; two clean rebuilds | (d) **RG AWARDED with X5 executed** — "STRICT GENERALIZATION" STRUCK (`mode_first`/`last_mode` have zero Lean declarations); ADJ-T's honest restatements carried. |

## C7 — re-ship (`cycles/cycle-7/C7-GATE-RECORD.md` §2)

| path | sha256 | declarations | axiom receipt (fresh) | award standing |
|---|---|---|---|---|
| `scratchpad/R20C7-T3/LeanProject/RRatioBound.lean` | `5c73aac684cfa1bf6e87159b6fc3574ff2a06366f8d436f3637af9b5c7748aad` | 2: `r_logconcave_ratio_bound`, `mandatory_degeneracy_witness` | 2/2 clean; two clean rebuilds | **THE HELD C6 AWARD RELEASES — RG AWARDED** (mandatory line greps exit 0 at both sites; statement fidelity byte-identical). Certificate note carried: a fabricated-charter-quotation MAJOR (see C8/C9 below — this is the FIRST instance of the species, on a receipt copy, not a shipped artifact). |
| `scratchpad/R20C7-T3/LeanProject/GenerationLaws.lean` | `ed9a69659d82d08f728ecd28d4b4cd37e6f105200dac6222fbf1bbb78517fe13` | 2: `disjoint_union_law`, `edge_join_law` | 2/2 clean; two clean rebuilds | **HELD, NOT REFUSED.** REF-4 ruled here (the `IndepUniv` class is distinguished from the C4/C5 skeleton precedent). Three release conditions remain (mandatory lines/truncation; false docstring; struck vacuity sentence) — release path C8/C9, **completed at C8 (RG AWARDED) and cleaned at C9 (this seat)**, see below. |
| `scratchpad/R20C7-T3/LeanProject/LeafFreedom.lean` | `750d75a3b660ed3f2cfa57a04c5470af29d42c633f30d970385fab38c7958f7c` | 1: `leaf_freedom_reduction` | 1/1 clean; two clean rebuilds | **NOT AWARDED — INTEGRATION ARTIFACT, NO ROW** (congrArg-tier; the (⇐)-as-registered block undisclosed). |

## C8 — Lemma A / Lemma B* / the generation-laws release (`cycles/cycle-8/C8-GATE-RECORD.md` §2) — SEALED ORIGINALS, superseded in provenance-text only by the C9 clean re-ships

These three sealed files carry the two struck-of-record defects this
seat's charge (1) removes. They are listed here for the historical
record and because the C8 gate record's awards attach to *this exact
mathematical content* — the C9 re-ship changes not one theorem, def, or
proof term.

| path | sha256 | declarations | axiom receipt (fresh) | award standing |
|---|---|---|---|---|
| `scratchpad/R20C8-T3/LeanProject/GenerationLaws.lean` | `a20eecadab91e42da77761abcd995b00b457b94a1d4964669516be3e57bedf69` | 6: `object_class_remark`, `disjoint_union_law`, `edge_join_law`, `proof_not_computation_remark`, `pendant_not_primitive_remark`, `mechanism_tier_remark` | (part of 26/26, see `Check.lean` row below); two clean rebuilds this session, both on the untouched sealed bytes | **RG AWARDED** (the held C7 award releases; all four R-45 conditions discharged; custody sound on four independent rebuilds). **Carries 1 of the 3 struck-of-record fabricated charter attributions** (lines ~112–119: mis-attributes a `C7-GATE-RECORD.md` §2 sentence to `CYCLE8-ALLOCATION.md`) — struck per `R20C8-ADJ-T` RULING R-T3-06. **Superseded by the C9 clean re-ship.** |
| `scratchpad/R20C8-T3/LeanProject/LemmaA.lean` | `b1207cc81148917724903a177b4bad5ebba38ec912972fd398301eb80212621b` | 8: `choose_strict_mono`, `choose_mono_of_le`, `lemma_A_core`, `convCoeff_eq_poly_coeff`, `lemma_A`, `lemma_A_mono_to_half`, `lemma_A_no_early_argmax`, `negControl_hypothesis_needed` | (part of 26/26); two clean rebuilds | **RG AWARDED without qualification** ("the cleanest object in the whole C8 T-portfolio"). **Carries 1 of the 3 struck-of-record fabricated charter attributions** (lines 5–8) — struck per R-T3-06. **Superseded by the C9 clean re-ship.** |
| `scratchpad/R20C8-T3/LeanProject/LemmaBStar.lean` | `c431f6c7caed0fbb688f80e48db79af0a7f34c5e0c71bf40ed6ece50242456e9` | 12: `IsFirstArgmax`, `WeaklyUnimodal`, `shiftAdd`, `mono_of_adjacent_le`, `anti_of_adjacent_le_offset`, `anti_of_adjacent_le`, `shiftAdd_zero`, `shiftAdd_succ`, `firstArgmax_le_turningPoint`, `lemma_B_star`, `counterA`/witness lemmas (`counterA_isFirstArgmax`, `counterB_isFirstArgmax`, `counterA_not_weaklyUnimodal`, `counterA_nonneg`), `hypothesis_load_bearing` | (part of 26/26; only the 12 that are `theorem`/proof-carrying are counted in the 26 — see note below); two clean rebuilds | **Lemma B\* (restricted): machine-check recorded on the BROOM certificate** — convention-pinning by re-execution ruled SOUND and FORCED. **Carries BOTH struck-of-record defects**: the false convention-coincidence docstring (`R-T3-04`, lines 26–28: "these COINCIDE whenever `a` is weakly unimodal" — FALSE, refuted on 202/790 exhaustive weakly-unimodal witnesses) **and** 1 of the 3 fabricated charter attributions (lines 5–9) — both struck per `R20C8-ADJ-T`. **Superseded by the C9 clean re-ship.** |
| `scratchpad/R20C8-T3/LeanProject/Check.lean` | `1063213bed163e2221670a9adc7bddd9a784349ff7622b013f41d94bb7a0ba8d` | 26 `#print axioms` lines (6+8+12) across the three files above | **26/26 within `[propext, Classical.choice, Quot.sound]`, 0 `sorryAx`, two clean rebuilds, byte-identical `.olean` both times** — corrects the C8 face's own certification of "24" declarations (`R20C8-CRIT-T3-U` MODERATE-1, confirmed independently by this seat's fresh recount) | Unchanged; identical byte-for-byte to the C9 `Check.lean` below (this file needed no repair — the two struck defects live only in comment blocks of the other three files). |

**Note on the 26 vs. the declaration lists above:** `Check.lean` issues
`#print axioms` on 26 `theorem`s/proof terms; `LemmaBStar.lean`'s
`counterA` (a `def`, not a theorem) and `IsFirstArgmax`/`WeaklyUnimodal`/
`shiftAdd` (also `def`s, in `LemmaBStar.lean`) are not axiom-checked
(defs have no proof obligation) — this reconciles the "12 declarations
listed" against "26 total `#print axioms` lines," matching
`R20C8-CRIT-T3-U`'s own MODERATE-1 finding exactly (26 `theorem`s
covered, 6 `def`s + 1 `structure` not).

## C9 — THE CLEAN RE-SHIPS (this seat, this cycle)

Byte-diff vs. the sealed C8 originals confined entirely to comment text
inside each file's opening `/- … -/` block — confirmed by diff inspection
(every changed line precedes the file's first `structure`/`theorem`/`def`)
and by identical axiom receipts (below) to the sealed C8 originals.

| path | sha256 | declarations | axiom receipt (fresh) | what changed |
|---|---|---|---|---|
| `scratchpad/R20C9-T3/LeanProject/GenerationLaws.lean` | `a9259b7627858581e941111dbda244beb16caece0b965fc4b49ccd270a0a9acd` | same 6 as C8 | 6/6 clean; **two independent clean rebuilds, byte-identical `.olean` both times** | The fabricated `CYCLE8-ALLOCATION.md` attribution (lines ~112–119) replaced with a plain provenance comment naming the sentence's real source (`C7-GATE-RECORD.md` §2) and the allocation's actual instruction ("cite it"). |
| `scratchpad/R20C9-T3/LeanProject/LemmaA.lean` | `46def0e9a96b1c320fe6725405e6d0404d1adef2ebae1b6d8f33d3056211aa8d` | same 8 as C8 | 8/8 clean; two clean rebuilds, byte-identical | The fabricated charter quotation (lines 5–8) replaced with the allocation's actual T-3 cell text, quoted in full, plus a plain note that the formula is this seat's own restatement of the registry text (quoted separately, correctly, below it). |
| `scratchpad/R20C9-T3/LeanProject/LemmaBStar.lean` | `f8fe20c589a3bdf6eaca2f0090a4871b5d99d91318cd1785aa70d863fe6a9a61` | same 12 as C8 | 12/12 clean; two clean rebuilds, byte-identical | (i) The fabricated charter quotation (lines 5–9) replaced, same pattern as `LemmaA.lean`. (ii) The false convention-coincidence claim struck and replaced with the honest sentence: **the two conventions diverge on plateau-before-mode sequences** (`R20C8-ADJ-T` NC-ADJT-1; 202/790 exhaustive weakly-unimodal witnesses; minimal witness `[1,1,2]`) — and the further misdescription of `firstArgmax_le_turningPoint` ("records the direction that matters") corrected per `R20C8-ADJ-T` item (d). |
| `scratchpad/R20C9-T3/LeanProject/Check.lean` | `1063213bed163e2221670a9adc7bddd9a784349ff7622b013f41d94bb7a0ba8d` | same 26 lines | 26/26 clean; two clean rebuilds | **Byte-identical to the C8 file** — `diff -q` confirms; no repair needed. |

**Fresh-rebuild cross-check (the load-bearing claim of this seat's
Object (1)):** this session also rebuilt the **untouched sealed C8
originals** once more, independently, in a separate directory
(`scratchpad/R20C9-T3/rebuilds/R20C8-sealed-original/`), and diffed its
26-line `#print axioms` transcript against the C9 clean re-ship's: **the
two transcripts are line-for-line identical.** The repair touched
provenance prose only; the mathematics — every theorem, every proof term,
every axiom dependency — is unchanged.

---

## Honest gaps and scope notes (named, not silently absorbed)

1. **This seat's charge text (the orchestrator's Object (1)) named
   `GenerationLaws.lean` as carrying both the false convention-
   coincidence docstring *and* the fabricated attributions.** Raw-byte
   verification this session finds the false convention-coincidence
   docstring in `LemmaBStar.lean`, not `GenerationLaws.lean`; the three
   fabricated attributions are spread across `LemmaA.lean` (1),
   `LemmaBStar.lean` (1), and `GenerationLaws.lean` (1) — three files
   carry struck-of-record text, not two. All three are repaired above.
   `CYCLE9-ALLOCATION.md`'s own T-3 cell text ("clean re-ships of the
   two artifacts carrying struck-of-record text (the generation-laws
   docstring; the fabricated attributions)") is read here as naming the
   two **defect types**, not a claim that exactly two files are
   involved — the sealed adjudication (`R20C8-ADJ-T` RULING R-T3-04/
   R-T3-06, `CRIT-T3-U` MAJOR-1) is the authority actually followed.
2. **C4 is included** even though the seat charge's illustrative list
   (C2, C3, C5, C6, C7, C8, C9) omits it; `CYCLE9-ALLOCATION.md`'s own
   instruction is "every award-track artifact **C2→C8**", which is a
   range, and C4 genuinely shipped two RG-AWARDED declarations
   (`gap_iff_lemma`, `theorem_R1`). Omitting it would have been a silent
   gap, not a scope decision.
3. **Rebuild depth is not uniform**, disclosed above: two independent
   clean rebuilds for every canonical T-3 project C2–C7 plus the C8
   sealed originals plus the three C9 re-ships; one rebuild only for the
   C2 Tier-B repaired form (`AdjT.lean`), via a direct `lake env lean`
   probe rather than a package-target rebuild-from-clean cycle.
4. **This manifest does not re-audit** any cycle's critic/adjudicator
   rebuild copies (`*-CRIT-T3-*`, `*-ADJ-*` directories other than the
   one C2 Tier-B file above) — those already carry their own cycle's
   independent-custody chain (2–4 rebuilds each, per that cycle's gate
   record), and re-litigating them is outside this seat's charge
   (LEAN COMPLETION + PACKAGE MANIFEST, not a fresh audit pass).
5. **No claim of `formally_verified`** attaches to anything in this
   manifest, per contract §8 and per every gate record cited above,
   verbatim, without exception.
