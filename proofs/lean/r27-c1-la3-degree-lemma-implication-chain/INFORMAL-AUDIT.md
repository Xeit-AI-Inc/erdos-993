---
type: proof-integrity-audit-evidence
status: passed
authority: skills/proof-integrity-audit/skill.md
producer_id: c1-la3-formalizer-opus-20260925
critic_id: c1-la3-fable-informal-20260925
attestation_id: c1-la3-informal-pass-20260925
claim_sha256: 8f30c1077e7f8765b19d179f76c328e0ba155e22a3ceef1bd5f37c2b998de074
---

# Informal Proof Integrity Audit

Round 2 (post-repair). The round-1 audit of the round-0 artifacts is preserved unchanged at
`scratchpad/c1-s7-informal-LA3/round-0/INFORMAL-AUDIT.md`, SHA-256
`b4e5d24230161fda1e4705066b2c7dba4ea6700d7d050889b72b09d536a09a05`; it returned **failed** on two
record defects (F1, F2) while finding the mathematics sound. This audit re-runs the whole brief
against the repaired artifacts; it does not merely spot-check the repair.

**VerityOS boot.** This seat is operating within VerityOS. Loaded: `verity.md`,
`identity/startup-protocol.md`, `skills/proof-integrity-audit/skill.md`, and — inside the read
boundary of the regenerated `control/C1-STAGE7-INFORMAL-AUDITOR-BRIEF-LA3.md` — the run root
`experiments/erdos-993-forest-degree-extension-dre-2026-09-24` (`SEMANTIC-CONTRACT.md`,
`SOLUTION-CONTRACT.md`, the sealed capsule `control/c1-stage7-capsules/C1-LA3-PACKET-MANIFEST.json`
and the capsule members named in the brief, `control/C1-STAGE7-FORMALIZER-BRIEF-LA3.md`, the Lean
run `runs/lean-2026-09-25-c1-la3-degree-lemma-implication-chain/` including the preserved round-0
artifacts under `RECEIPTS/superseded/round-0/` and `EVIDENCE/superseded/round-0/`, the frozen r25
award source, and `sources/c1-stage7-sources/` with `SOURCE-DIGESTS.json`). No other subsystem was
loaded; no network; no installs; no `find /`; no `lake`/`elan` invocation; no background job;
`sources/external/lean-source/` was never opened. No run artifact was created, edited or deleted
by this seat; I write only under `scratchpad/c1-s7-informal-LA3/`.

**Model disclosure.** The dispatch record charters this seat as **Claude Opus 5 at high reasoning
effort**. **This seat cannot self-inspect its runtime model or effort setting**; the model and
effort above are stated on dispatch-record authority, not on observation.

**Artifact identity.** Recomputed from the bytes and matching the regenerated brief:
`THEOREM-CONTRACT.yaml` `28f56fc6e2f346fd4085d125ae0337dfe31020d668bd574bcfaecaee939df09d`;
`INFORMAL-PROOF.md` `0c743db10683617a923e7f4eab95e73e7aba1860d09943a11977b2076d1410c4`;
`LeanProject/LeanProof/Main.lean` `23d9a1633c9d8f849be992f5f2f1cbe9b270092109903e98e51c903591017851`;
`RECEIPTS/kernel-verification.json` `d3c85ead997c3ebaa48837e05aa2492f466ba05770941642fad4382487614501`.
Capsule seal recomputed from the manifest bytes (compact key-sorted JSON minus `seal_sha256`, no
trailing newline) = `81ddfb721658febd780f9b9898779b27e55cabd3b9225fe0d0fec380cd6422c2`, matching;
46/46 members present with every byte count and digest reproducing.

**Claim digest.** Recomputed independently:
`" ".join(theorem.informal_statement.split())` hashes to
`8f30c1077e7f8765b19d179f76c328e0ba155e22a3ceef1bd5f37c2b998de074` — equal to the brief's value
and unchanged from round 0. I confirmed mechanically that `theorem.informal_statement` is
**byte-identical** to the round-0 contract's, so the claim under audit has not moved.

---

## Intended Claim

Unchanged from round 1, and verified again from the bytes. The claim is exactly
`theorem.informal_statement` of `THEOREM-CONTRACT.yaml`:

> Assume (DL): for every finite forest `G` on a finite vertex type `X` (quantified over the
> `Fintype`/`DecidableEq`/`DecidableRel` instances) and every natural `k`, the incident degree sum
> `D_k(G)` is at most `2k i_k(G)`. Then (EX) `n i_k ≤ (k+1) i_{k+1} + 3k i_k` for every finite
> forest and every `k`; (LB) `Δ_k(G) < 0` implies `n ≤ 4k`; (R5) `21 ≤ n` implies `0 ≤ Δ_5(G)`;
> and (XR) `x(G) < r` implies `n ≤ 4r − 4`. Each of the five statements is the corresponding
> frozen `SOLUTION-CONTRACT.md` §2 declaration, taken definitionally. The award is the
> IMPLICATION: none of (DL), (EX), (LB), (R5), (XR) is asserted.

Terminal declaration `Erdos993G1.degree_lemma_implies_chain`:

```lean
theorem degree_lemma_implies_chain :
    DlHyp.{u} → ExHyp.{u} ∧ LbHyp.{u} ∧ R5Hyp.{u} ∧ XrHyp.{u}
```

`lean_binding.expected_statement` is byte-identical to the namespace-relative source slice from
`theorem` to (excluding) ` :=`; its SHA-256 recomputes to
`750393942ec05d16f2f40d6a733368f7ff6d0cfbe72eaf5ca00e4c3115527f96`, equal to the declared value
**and to round 0's**. One hypothesis, `DlHyp.{u}`; conclusion the four-fold conjunction at the
same universe; no `α`/`hyp-alpha` side condition, no rank restriction, no extra binder. Matches
the claim one-for-one.

**Statement-to-§2 fidelity** (re-checked binder by binder against the frozen `SOLUTION-CONTRACT.md`
§2 and `EVIDENCE/elaborated-types.txt`): `DlHyp`/`ExHyp`/`LbHyp`/`R5Hyp`/`XrHyp` are identical to
`forest_degree_lemma`, `forest_extension_inequality`, `forest_descent_linear_bound`,
`forest_rank5_ceiling_20`, `forest_descent_restriction` respectively, with `Fintype.card` in
(DL)/(EX), `Nat.card` in (LB)/(R5)/(XR), the `(5:ℤ)` literal in (R5) and truncated ℕ `4*r-4` in
(XR). `EVIDENCE/elaborated-types.txt` is **byte-identical to the round-0 file**
(`e38e821a6a2bd98af45995c2398c01d6d0b15f79e5da548acd73c6158789062a`), independent evidence that no
elaborated type moved. The five kernel-checked anti-drift `example`s are unchanged.

### What changed between round 0 and round 2 — established mechanically

| Artifact | Change | Evidence |
|---|---|---|
| `LeanProject/LeanProof/Main.lean` | **Two docstrings in registrar entry 14 only**, plus that entry's marker digest | `diff` against the preserved `RECEIPTS/superseded/round-0/Main.lean` shows exactly two hunks, both inside `/-- … -/` comments. **Decisive check:** with all comments and docstrings stripped, both files' code is **byte-identical** — 402 significant lines, SHA-256 `26203fad5b7e0d8bb6e9ed8dae6dce9c2c41a5e597a7060c0f19c037e3d0ba50` on **both**. No statement, no proof term, no binder changed. |
| `THEOREM-CONTRACT.yaml` | `conclusion.statement` (attribution + fences appended) and two `source_materials` digests | Structural comparison against `RECEIPTS/superseded/round-0/THEOREM-CONTRACT.yaml`: `theorem.informal_statement`, `lean_binding`, `definitions`, `hypotheses` and `dependency_graph` are each **byte-identical** to round 0; `source_materials` ids identical, exactly two digests changed (`source-informal-proof`, `source-fragment-0014`) and both reproduce from the files. |
| `INFORMAL-PROOF.md` | §5.2 rows for `pos_indepCount_of_delta_neg` and `firstDescent_spec`; §5.3 preamble and one added bullet | Section-by-section comparison against the round-0 text ledgered in my round-1 audit: §§0–4, 5.1, 6 and 7 are unchanged, including the whole mathematical argument, the hypothesis table, the ℕ/ℤ cast audit, the byte-identical carry table and the excluded-conclusions list. |
| `FORMALIZER-REPORT.md` | §5, §7(R3), §8–§10, new §11 repair record | Read in full; see the Scope and Fence Check. |
| Evidence | `axioms.txt`, `build.log` regenerated; `axioms-all-declarations.txt` and `elaborated-types.txt` regenerated **byte-identical to round 0** | Digests recomputed. |

So the round-2 mathematics is the round-0 mathematics, established at the byte level rather than
by reading.

---

## Claim Ledger

The ledger of round 1 (A1–A14 definitions, B1–B20 statements, C1–C6 inference steps, D the
ℕ-subtraction and cast audit) is carried forward **unchanged**, because the code it ranges over is
byte-identical. Every row was re-derived against the repaired source rather than copied: the
entry extraction, G1 comparison, carried-block search, cast audit and hypothesis-entry check below
were all re-run on `Main.lean` `23d9a163…`. The full ledger is in
`round-0/INFORMAL-AUDIT.md`; the re-verification is recorded here.

### A. Definitions — re-verified against the repaired source

| Declaration | Check on `23d9a163…` | Verdict |
|---|---|---|
| `Erdos993G1.indepCount`, `coeff`, `delta` (registrar entries 1–3) | Extracted by marker from both the repaired source and the frozen r25 source `736eb9df…`: bodies **byte-identical**, and each body's SHA-256 reproduces its own marker digest (`5484fc21…`, `21190043…`, `bdb46014…`) | identical to r25; no G1 definition re-stated |
| `indepCount_eq_card_indepSetFinset`, `coeff_nat`, `delta_nat` (entries 10–12) | Same test against r25 entries 4–6 (`4463e7ee…`, `df2c5548…`, `c063c495…`) | byte-identical |
| `closedNbhdFinset`, `extensionFinset`, `e`, `indepDegreeSum` (entry 4) | `U3-Extension.lean` 16–37 found byte-identically at run line 48 | byte-identical; matches `SEMANTIC-CONTRACT.md` §1 |
| `firstDescent` (inside entry 9) | `U3-Extension.lean` 292–297 found byte-identically at run line 190 | byte-identical; row 19 proves U1 ≡ U3 by `rfl` |
| `exists_delta_neg` | re-derived in-run; body unchanged from round 0 | verified (B1 of round 1) |
| `DlHyp`, `ExHyp`, `LbHyp`, `R5Hyp`, `XrHyp` | unchanged; elaborated types byte-identical to round 0 | identical to §2 |

All nineteen registrar entries' marker digests reproduce from their own bodies — **zero
mismatches** — including the new entry 14 digest
`418beecfd5ca90332c61611e639d3741703da5bb1c8eba21f251b44e15450079`.

### B. Statements and C. Inference steps — re-verified

Carried bodies re-located byte-identically in the repaired source: `U3-Extension.lean` 16–37
(line 48), 39–244 (line 251), 292–297 (line 190), 299–302 (line 484); and
`C-U1-T-CriticAdvances.lean` 179–209 (line 528), 211–218 (line 571), 220–226 (line 591). The line
offsets moved by the docstring growth; the bytes did not.

C1 (DL⇒EX via the double count and the `e(J)` bound), C2 (EX⇒LB by cancelling the positive `i_k`,
`k = 0` included), C3 (LB⇒R5 at `k = 5` through the `((5:ℕ):ℤ) = (5:ℤ)` bridge), C4 (LB⇒XR at
`k = firstDescent G`, `r = 0` vacuous-hypothesis-sound), C5 (the chain) and C6 (acyclicity enters
exactly once, consumed only by the (DL) hypothesis) were each re-read on the repaired source and
re-confirmed. The `hG` binder is still consumed only at `hDL G hG k` / `hEX G hG k` /
`hLB G hG …`; `double_count` and `e_ge_sub` still carry **no** acyclicity binder.

### D. ℕ-subtraction and cast audit — re-verified

Unchanged and still sound: the only truncated ℕ subtraction is `4 * r - 4` in `XrHyp` /
`critic_xr_of_lb`, safe because `firstDescent G < r` forces `r ≥ 1` and vacuous at `r = 0`;
`indepCount G k - 1` is ℤ; `e_ge_sub` reaches ℤ subtraction from the subtraction-free ℕ form, never
by truncation; `J'.card - 1` is discharged by `omega` with `J'.card = k+1` in scope; `(k+1)` as a
coefficient is `(↑k + (1:ℤ))` while `indepCount G (k+1)` takes `k + (1:ℕ)`; `((5:ℕ):ℤ) = (5:ℤ)` is
an identity; `Nat.card`/`Fintype.card` is bridged once by `Nat.card_eq_fintype_card`. Every
equality used is an identity and was recomputed.

---

## Reproduced Mathematical Evidence

**Evaluator.** My own, written in round 1 and reused as the brief permits:
`scratchpad/c1-s7-informal-LA3/evaluate_chain.py`, SHA-256
`05fa9a3f7549c590ba31de9958b066dcb118c6aa9704a80fabcb9dfa33646750`. Standard library only
(`itertools`, `sys`, `typing`); no prior run evaluator imported; no wall-clock field, so the output
is byte-stable. Re-run in the foreground for this round; output
`scratchpad/c1-s7-informal-LA3/EVAL-OUTPUT-ROUND2.txt`
(`9b01ea034b941a5653127251945bf1e527398d9106e4151245a9f1a01dd9a3a7`), which `diff`s **identical**
to the round-1 output — the expected result, since the mathematics is byte-identical, and a check
that the evaluator is deterministic.

**Grid.** Every labelled simple graph on `n ≤ 6` vertices and every labelled forest on `n ≤ 7`,
over every `k ∈ [0, n+1]` and every `r ∈ [0, n+2]`. **5,399,978 integer checks, 0 failures**,
across sixteen families:

| Family | Class | Instances | Failures |
|---|---|---|---|
| `U1-double-count` `(k+1)·i_{k+1} = Σ_{J∈I_k} e(J)` | all graphs / forests | 243,980 / 358,418 | 0 / 0 |
| `U2-e-bound` `e(J)+|J|+Σdeg ≥ n` | all graphs / forests | 496,702 / 1,665,393 | 0 / 0 |
| `U3-summed` `n·i_k − k·i_k − D_k ≤ (k+1)i_{k+1}` | all graphs / forests | 243,980 / 358,418 | 0 / 0 |
| `P-positivity` `Δ_k<0 ⇒ 0<i_k` | all graphs / forests | 63,466 / 123,486 | 0 / 0 |
| `C-dl-implies-ex` (the C1 implication itself) | all graphs / forests | 196,181 / 358,418 | 0 / 0 |
| `L-ex-implies-lb` (the C2 implication itself) | all graphs / forests | 58,129 / 123,486 | 0 / 0 |
| `DL`, `EX` | forests | 358,418 each | 0 |
| `LB` | forests | 123,486 | 0 |
| `XR` (truncated ℕ subtraction, `r = 0` included) | forests | 269,599 | 0 |

The unconditional steps `U1`, `U2` and `U3` hold for **all** graphs, confirming that steps 1–4 of
`INFORMAL-PROOF.md` §2.1 are graph-general.

**Sharpness of the acyclicity hypothesis.** `K₄` at `k=1`: `D_1 = 12 > 8 = 2k·i_1` — (DL) false;
`16 > 12` — (EX) false. `K₅` at `k=1`: `D_1 = 20 > 10` — (DL) false; `25 > 15` — (EX) false;
`Δ_1 = −5 < 0` with `n = 5 > 4` — (LB) false. The (DL) hypothesis is load-bearing; the implication
is not vacuous in the trivial sense. `K₃` and `C₄` meet (DL) with equality at `k = 1`, so (DL)
alone does not characterise acyclicity — consistent with the excluded conclusions.

**Fixed points of `SEMANTIC-CONTRACT.md` §4**, recomputed: empty forest `i_0=1, Δ_0=−1, x=0`;
`K₁` `i = 1,1`, `Δ_0=0`, `Δ_1=−1`, `x=1`; `K_{1,4}` `i = 1,5,6,4,1,0`, `x=2`, `D_1 = 8 ≤ 10`; `P₄`
`i = 1,4,3,0,0`, `x=1`; edgeless `n=5` `D_k ≡ 0`. All agree.

**(R5) scope note**, as in round 1: no forest on the grid reaches `n ≥ 21`, so (R5) is not
exercised numerically. It is established formally by instantiating (LB) at `k = 5` and
contradicting `21 ≤ n` with `n ≤ 20`; I verified the derivation by hand and the cast identity by
recomputation. Not a gap — (R5) is a consequent of the implication, not an unconditional claim.

**Provenance and hygiene, re-run on the repaired artifacts.**

- Longest byte-identical contiguous block of each non-carried capsule file inside the repaired
  source: `ADJ-U-Reconcile.lean` **0** significant lines; `ADJ-U-Bridge.lean`, `ADJ-U-Prod.lean`,
  `C-U2-F-CriticU2F.lean`, `C-U2-T-Audit.lean` 1 each; `U2-Main.lean` 2 (the `import Mathlib`
  header); `C-U1-F-CritAdvance2.lean` 2; `C-U3-T-Audit.lean` 2 and `C-U3-F-Critic.lean` 3 (the
  `classical` / `letI := Fintype.ofFinite X` lines, which lie inside the carried row-10 block);
  `C-U1-F-CritAdvance.lean` 5 (its lines 42–46, identical to row 10's 214–218, i.e. explained by
  the carried row-10 body); `U1-Main.lean` 21 (its lines 1–39, the frozen r25 G1 prefix — not U1's
  own work). **Nothing marked "not a dependency" is a dependency**, and in particular no body of
  row 6 is carried, exactly as the repaired §5.2/§5.3 now say.
- Word-boundary scan of the repaired source for `sorry`, `admit`, `native_decide`, `axiom`,
  `decide`: **zero hits**. (A naive substring scan now hits `admit` once — inside the English word
  "admits" in the new entry-14 docstring, line 469. Recorded as observation O2.)
- External-vocabulary scan (`icoeff`, `Zgen`, `indepPoly`, `vpoly`, `Dpoly`, `Epoly`, `degDefect`,
  `indepCard`, `numExtensions`, `sum_degOn_le`, `prefix_ratio`, `indepFinsets`, `degOn`,
  `R27DegreeLemma`): **zero hits**. Row 8 unused, so the three renames have no application.
- `EVIDENCE/axioms-all-declarations.txt`: **39** declarations, every one at exactly
  `[propext, Classical.choice, Quot.sound]`; byte-identical to the round-0 file, corroborating that
  the declaration set did not change.
- Contract: all 24 `source_materials` digests reproduce from the files; `permitted_axioms` is
  exactly the three; the dependency graph is byte-identical to round 0 (21 nodes, 26 edges, closed
  and acyclic).
- `CAPSULE-VERIFICATION.json` is unchanged (`95a15425…`) and the contract still digests it at that
  value.

**Axioms-before-receipt check (asked for explicitly).**

| Fact | Value | Source |
|---|---|---|
| `EVIDENCE/build.log` mtime | 17:00:39.634921 | filesystem |
| `EVIDENCE/axioms.txt` mtime | 17:00:39.635518 | filesystem |
| `RECEIPTS/kernel-verification.json` mtime | 17:00:39.636011 | filesystem |
| receipt `axioms_log_sha256` | `8c53abd4f1e96d66e3e4fd48f1cdfc208c32281f2f9e13463665d94a32263dc1` | receipt |
| `EVIDENCE/axioms.txt` recomputed | `8c53abd4f1e96d66e3e4fd48f1cdfc208c32281f2f9e13463665d94a32263dc1` | this seat |
| receipt `source_sha256_before` / `_after` | `23d9a1633c9d…` / `23d9a1633c9d…`, equal to the source on disk | receipt |

The axioms log is written **before** the receipt within the same verifier invocation, and its
bytes still hash to what the receipt recorded, so it has **not** been edited after the receipt.
The file is freshly generated against the repaired source, not stale: its probe line number is 575
(round 0's was 564), the shift the two added docstrings produce.

I also checked the one digest in the repair record that did not match the file. `FORMALIZER-REPORT.md`
§8/§11 give the pre-verification axioms bytes as
`110948b860d49a17b8512e58b0518e8cefd16267d9659f897556e5918da32432` while §10's hash table gives the
file as `8c53abd4…`. This is **not** a discrepancy: §9 discloses that the verifier regenerates
`axioms.txt` as its own step-7 evidence and that its final bytes contain the pre-verification line
verbatim preceded by the `push_neg` deprecation warning. I verified this exactly — the SHA-256 of
the bare line `'Erdos993G1.degree_lemma_implies_chain' depends on axioms: [propext, Classical.choice, Quot.sound]\n`
**is** `110948b8…`, and that line appears verbatim in the final file. The record is precise, not loose.

**Formalizer report hash table.** I recomputed all 86 rows of §10. Every row reproduces except
four, all of which are the *fidelity reviewer's* artifacts, not the formalizer's and not part of
the proof record: `EVIDENCE/fidelity-audit-input.json`, `FIDELITY-REVIEW.md`,
`RECEIPTS/fidelity-audit.json` and `FIDELITY-REVIEWER-NOTES.md`. Those files are being written by
the parallel fidelity seat (timestamps 17:03, after the report's 17:02 snapshot), so the table is
simply a point-in-time snapshot for them. Recorded as observation O3; every artifact the award's
proof record depends on — contract, source, informal proof, receipts, axioms and evidence logs,
fragments, carry sources — reproduces exactly.

---

## Independent Critic Pass

Run over my own ledger and over the repair, against the unchanged artifacts, before closing.

1. **Is the repair really confined to comments?** I did not take the `diff` at face value. Stripping
   every `--` line comment and every `/- … -/` block (nesting-aware) from both the preserved
   round-0 source and the repaired source yields the **same 402-line, identical-SHA-256** text.
   A hidden change to a statement, a binder or a proof term is excluded by construction.
2. **Could the repair have changed the claim?** No: `theorem.informal_statement` is byte-identical
   to round 0's, `lean_binding` (including `expected_statement` and its SHA-256) is byte-identical,
   and the claim digest recomputes to the same value. `definitions`, `hypotheses` and
   `dependency_graph` are byte-identical too.
3. **Is F1's replacement text true?** Checked clause by clause against the artifacts, not against
   the report: (a) row 6's file `sources/c1-stage7-sources/U1-Main.lean` is 27,328 bytes with
   SHA-256 `8cc381f413e6b5533995a362f4f38f4930d99119e8eece9a5f1cc323a62dea0d` — **verified from
   the bytes**, and that exact record appears in the manifest and with `"match": true` in
   `CAPSULE-VERIFICATION.json`; (b) it "IS a member of this capsule" — **true**; (c) it "was read"
   — permitted by the formalizer brief §1, which grants `sources/c1-stage7-sources/`, so this is a
   disclosure, not a boundary breach; (d) "Row 6 is NOT on the brief's byte-identical carry list,
   which names rows 9, 10, 11, 12, 15, 16 and 19" — **true**, that is R7 verbatim; (e) "U1's own
   body is stated at `{V : Type v}` with no finiteness binder" — **true**, `U1-Main.lean:481`;
   (f) for `firstDescent_spec`, "U1's body there is `Nat.find_spec (Erdos993G1.firstDescent_exists G)`,
   against U1's own `firstDescent` and `firstDescent_exists`, neither of which this run registers"
   — **true**, `U1-Main.lean:495–531` versus this run's registrar, which carries row 9's
   `firstDescent` and re-derives `exists_delta_neg`.
4. **Is the "first stated" claim in the new §5.3 bullet true?** Within the capsule,
   `pos_indepCount_of_delta_neg` is declared only at `U1-Main.lean:481` and `firstDescent_spec`
   only at `U1-Main.lean:529`; `C-U1-T` and `C-U1-F` merely call them. True.
5. **Did the repair turn a labelled re-derivation into a disguised carry?** No. The two bodies are
   unchanged from round 0 (the code-only hash proves it) and I had already compared them against
   U1's: the run's `pos_indepCount_of_delta_neg` adds `[Finite X]` and `letI := Fintype.ofFinite X`
   and routes through `indepCount_eq_card_indepSetFinset`, where U1's needs no finiteness and uses
   `unfold`. Genuine re-derivations, correctly labelled, now correctly sourced by digest.
6. **Is F2's replacement text true, and complete against what the brief requires?** Every
   attributee the synthesis and the formalizer brief §2 name is now on the contract face — FLNYZ
   2026 §8, the literature map (FRESH-LEAD, lane 11), seat U3, critics `C-U1-T`, `C-U3-T`,
   `C-U3-F`, `C-U1-F`, rows 10–16 critic-attributed and 17–19 adjudicator-attributed, the U
   adjudicator for row 19, and Gate ruling 3 — together with six fences including the two that were
   missing. I checked each against `SOLUTION-CONTRACT.md` §3/§3.7 and the synthesis; all are
   accurate. The rendered `EVIDENCE/THEOREM-CONTRACT.md` carries the same text.
7. **Did adding text to the contract's conclusion break its structure?** No: the validator receipt
   is `valid_for_formalization` with `errors: []`, the node/edge sets are byte-identical to round 0,
   and all 24 source materials reproduce.
8. **Does anything in the repair contradict anything else in the record?** One imprecision, not a
   contradiction — see observation O1.
9. **Does the grid still support the record?** Yes: identical output, 5,399,978 checks, 0 failures,
   and the `K₄`/`K₅` exhibitions stand.
10. **Am I applying the same standard as in round 1?** Stated explicitly: a **defect** is a
    statement that is false as a verifiable fact about the artifacts, or an error or gap in the
    mathematics; an **observation** is an imprecision that misstates no fact about the artifacts'
    content or availability and changes no conclusion. F1 was a defect under that standard — the
    run's own gate record refuted it. O1 below is not.

---

## Scope and Fence Check

**Nothing fenced is asserted.** The terminal declaration is an implication with a single
hypothesis; its elaborated type and `#print axioms` line are byte-identical to round 0's. Every
excluded conclusion of the synthesis dispatch and of the formalizer brief §2 was re-checked:

| Fence | Asserted? | On which faces |
|---|---|---|
| No no-recovery reading; no status transfer to `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, `E993-BETA-AGG`, Erdős #993 | no | `INFORMAL-PROOF.md` §6.1; **now also** the contract conclusion, fence (1) |
| (XR) is not a uniform bound on `d`; the `r = 0` truncation is vacuous-hypothesis-sound, not arithmetic | no | §6.4 and §4.6; `def-xrhyp`; **now also** the contract conclusion, fence (2) |
| The implication is the award; the targets are not; the four consequents stay `conditional` until `C1-LA1` | correctly fenced | §0, §6.6; terminal docstring; contract conclusion (unchanged text plus fence (3)) |
| (DL) is an average over `I_k`; no pointwise degree statement | no | §6.3; **now also** fence (4) |
| Nothing asymptotic (`N₀`, CLT, unimodality) | no | §6.2; **now also** fence (5) |
| No tightness claim; the r25 `(k+1)²` award stays at its own statement; `4k ≤ (k+1)²` is a comparison | no | §6.5; **now also** fence (6) |
| Sealed r25/r26 records never edited | respected | §6.7; the r25 source digest still reproduces, and the repair wrote only inside this run root |
| `E993-R25-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` (REFUTED) is not a premise | no | §6.8; absent from the dependency set |
| `C-U3-F`'s instance caveat | carried | `INFORMAL-PROOF.md` §0, terminal docstring, contract `hyp-instances`, and the instance binders in `elaborated-types.txt` |

**Attribution now travels on every face the brief names.** `INFORMAL-PROOF.md` §6 (unchanged), the
terminal declaration's docstring (unchanged), `FORMALIZER-REPORT.md` §5, and — the round-1 gap —
the contract's scope text.

### F1 — REPAIRED, truthfully, on all three faces

The round-1 defect was the clause "carry row 6 … is **not** a member of this capsule", which the
run's own `CAPSULE-VERIFICATION.json` refuted. It is gone from all three faces and replaced by a
statement that I verified independently against the manifest, `SOURCE-DIGESTS.json`,
`CAPSULE-VERIFICATION.json`, `U1-Main.lean`'s bytes and R7:

| Face | Repaired text | Verified |
|---|---|---|
| `LeanProject/LeanProof/Main.lean` entry 14 (two docstrings) | row 6 "IS a member of this capsule and was read", cited by digest `8cc381f4…a62dea0d`; not on R7's carry list; the NAME is row 6's and the BODY is written in-run; plus the independent second reason for `firstDescent_spec` | yes, clause by clause (critic pass 3) |
| `INFORMAL-PROOF.md` §5.2 | same, with the digest inline | yes |
| `FORMALIZER-REPORT.md` §5, and §11 which states plainly "the audit is right and my round-0 record was wrong" | same | yes |

`INFORMAL-PROOF.md` §5.3 additionally lists row 6 among the capsule members whose bodies are
unused, removing the round-1 internal inconsistency, and adds a bullet recording that row 6 is
where the two names were first stated. I confirmed no body of row 6 is carried (the longest
byte-identical block from `U1-Main.lean` is the frozen r25 G1 prefix).

### F2 — REPAIRED on the contract face

`THEOREM-CONTRACT.yaml`'s `conclusion.statement` now carries the full attribution and six fences,
quoted in the Scope table above and reproduced in `EVIDENCE/THEOREM-CONTRACT.md`. Token counts in
the contract: `Fang` 1, `FRESH-LEAD` 1, `C-U1-T` 2, `C-U3-T` 1, `C-U3-F` 2, `C-U1-F` 1, `seat U3`
1, `adjudicator` 3, `NO NO-RECOVERY` 1, `UNIFORM BOUND` 1 — every previously missing item present,
and each checked for accuracy against `SOLUTION-CONTRACT.md` §3/§3.7 and the synthesis.

### F3 — carried forward as an advisory, unrepaired by the controller's choice

The run still declares `Erdos993G1.forest_extension_inequality` with the §2 target's exact name but
a conditional type (explicit `hDL`, no acyclicity binder), so it asserts nothing fenced.
`FORMALIZER-REPORT.md` §11 records that the controller left this out of the repair scope and notes
that it is carry row 9's own name. I agree it is not a defect; the alias distinction is worth a
line on the award face if the controller wants it.

### Observations (none is a defect; none blocks the pass)

**O1 — one loose paraphrase of carry condition (i).** Four places — the entry-14 docstring,
`INFORMAL-PROOF.md` §5.2, and `FORMALIZER-REPORT.md` §5 and §11 — say the synthesis's carry
condition (i) "admits **U1's file** as statements of record only". Condition (i) reads, verbatim:
"U1's five `sorry`'d targets are carried **as statements of record only**; they are not theorems
and no grade attaches." Its subject is the five targets, not the whole file — and indeed U1's file
also holds proved lemmas, including the `pos_indepCount_of_delta_neg` under discussion. This is an
over-broad paraphrase, not a false statement about the artifacts: the operative and sufficient
reason (row 6 is not on R7's byte-identical carry list) is stated first in every one of the four
places and is exactly true; `INFORMAL-PROOF.md` §5.3 states the accurate form ("carry condition (i)
admits **its five targets** as statements of record only"); and the same §5.2 row tells the reader
outright that U1 has a body there ("U1's own body is stated at `{V : Type v}`…"), which forecloses
the misreading. The costless correction, if a future touch of these files occurs, is "U1's file" →
"U1's five `sorry`'d targets". I am explicitly **not** failing on this, under the standard in
critic-pass item 10.

**O2 — a substring-scan snag.** The new docstring contains the English word "admits", so a naive
substring search for the forbidden `admit` token now hits `Main.lean:469`. The word-boundary scan
is clean and the verifier's own `incomplete_proof_scan` passed. Worth knowing for any downstream
grep-based gate.

**O3 — four stale rows in the report's artifact hash table.** Of the 86 rows in
`FORMALIZER-REPORT.md` §10, four do not reproduce: `EVIDENCE/fidelity-audit-input.json`,
`FIDELITY-REVIEW.md`, `RECEIPTS/fidelity-audit.json` and `FIDELITY-REVIEWER-NOTES.md`. All four
belong to the parallel fidelity-review seat and were written after the report's snapshot; none is
part of the proof record, and all 82 remaining rows reproduce exactly.

**O4 — round-0 `INFORMAL-PROOF.md` is not preserved.** `RECEIPTS/superseded/round-0/` and
`EVIDENCE/superseded/round-0/` preserve the round-0 source, contract, receipts and evidence logs,
but no copy of the round-0 `INFORMAL-PROOF.md` exists on disk. My §§0–4/5.1/6/7 comparison for that
file therefore rests on the round-0 text I read and ledgered in round 1 rather than on a
byte-level `diff` — the only check in this audit not reducible to a hash. The Lean code-only
identity and the byte-identical `elaborated-types.txt` and `axioms-all-declarations.txt`
independently confirm that no mathematics moved, so nothing turns on it; preserving the superseded
informal proof alongside the other round-0 artifacts would close the gap for future rounds.

### The brief's conditions, re-checked end to end

R1 (single-source project; G1 entries 1–6 byte-identical to the frozen r25 source with their
digests reproducing; no G1 definition re-stated; matches recorded in `CAPSULE-VERIFICATION.json`) —
**met**, independently reproduced. R2 (carry discipline; every carried body byte-identical at the
declaration level or re-derived; every origin and full SHA-256 cited in `FORMALIZER-REPORT.md` and
`INFORMAL-PROOF.md`; rows 10–16 critic-attributed and 17–19 adjudicator-attributed on every face;
no external Lean text; row 8 unused so the three renames do not apply) — **met**, and the round-1
exception is repaired. R3 (contract schema; every definition by exact `lean_name` including
`indepDegreeSum`, `e` and `firstDescent` with their Lean text; hypotheses; closed acyclic
dependency graph; permitted axioms exactly the three; exact `expected_statement`; `source_materials`
digesting the informal proof, the capsule verification, the frozen r25 source and every carried
fragment) — **met**, and the scope text now carries the attribution and fences. R4 (axioms; the
fresh `axioms.txt` written before the kernel run and unedited since the receipt; the per-declaration
list; no `sorry`/`admit`/`native_decide`/`axiom`; no `decide` standing in for a universal step) —
**met**. R5 (informal proof at statement-level granularity; every hypothesis named where it enters,
acyclicity exactly once through (DL) and finiteness everywhere; the ℕ/ℤ cast audit; the §2
attributions and excluded conclusions; the carry table) — **met**. R6 — not triggered. R7 (rows
carried byte-identically where used; the `Prop` abbreviations elaborate to the §2 texts, with the
five kernel-checked anti-drift `example`s; `firstDescent` is row 9's definition, reconciled with
U1's by row 19's `rfl`) — **met**.

---

## Verdict

**passed.**

Both round-1 defects are repaired, and repaired truthfully rather than papered over. **F1**: the
false capsule-membership clause is gone from all three faces and replaced by a statement each of
whose clauses I verified against the manifest, `SOURCE-DIGESTS.json`, `CAPSULE-VERIFICATION.json`,
`U1-Main.lean`'s own bytes and R7 — row 6 is a capsule member, it was read, it is not on the
byte-identical carry list, the two names come from it and are cited by digest, the bodies are
written in-run, and `firstDescent_spec` carries an independent second reason that also checks out.
`FORMALIZER-REPORT.md` §11 states the correction plainly. **F2**: the contract's scope text now
carries the FLNYZ 2026 §8 and literature-map attribution, seat U3, all four critics, the
row-10–16/17–19 critic/adjudicator split, the U adjudicator, Gate ruling 3, and six fences
including the two that were missing — every item accurate against `SOLUTION-CONTRACT.md` §3/§3.7
and the synthesis, and reproduced in the rendered view.

**Nothing else changed, and the mathematics is unchanged and sound.** With comments and docstrings
stripped, the round-0 and round-2 Lean sources are byte-identical (402 lines, SHA-256
`26203fad5b7e0d8bb6e9ed8dae6dce9c2c41a5e597a7060c0f19c037e3d0ba50` on both);
`theorem.informal_statement`, `lean_binding`, `definitions`, `hypotheses` and `dependency_graph`
are byte-identical to round 0; `elaborated-types.txt` and `axioms-all-declarations.txt` are
byte-identical to round 0; the claim digest recomputes to
`8f30c1077e7f8765b19d179f76c328e0ba155e22a3ceef1bd5f37c2b998de074`. Re-verified on the repaired
artifacts: every definition matches `SOLUTION-CONTRACT.md` §2 literally; the terminal hypotheses
match the claim one-for-one; steps C1–C6 verify; every equality used is an identity, recomputed;
every ℕ-subtraction and cast is safe, with the `r = 0` truncation vacuous-hypothesis-sound;
acyclicity enters exactly once, through the (DL) hypothesis; nothing fenced is asserted; all
nineteen registrar entry digests reproduce from their own bodies; the G1 entries and all seven
carried blocks are byte-identical to their frozen origins; nothing marked "not a dependency" is
one; all 39 declarations sit at exactly `[propext, Classical.choice, Quot.sound]`; the fresh
`axioms.txt` was written before the new receipt and matches what that receipt recorded; and my
evaluator's 5,399,978 exact-integer checks return **zero** failures, with `K₄` and `K₅` exhibiting
the expected failure of (DL)/(EX)/(LB) outside acyclicity.

Four observations (O1–O4) and the carried-forward advisory F3 are recorded above. None is a false
statement about the artifacts and none affects any conclusion, so none is a defect and none
withholds the pass.

Attestation `c1-la3-informal-pass-20260925` is issued for this round. I repaired nothing myself,
and no run artifact was created, edited or deleted by this seat.
