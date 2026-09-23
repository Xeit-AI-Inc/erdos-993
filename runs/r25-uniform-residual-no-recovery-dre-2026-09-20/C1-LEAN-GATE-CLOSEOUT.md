# Cycle 1 Lean Gate Closeout (r25)

Date: 2026-09-20 / 2026-09-21 (controller: Claude Fable 5.1). Final.

## Terminal Award State

Stage 7 attempted exactly the two award groups named by the admitted Cycle 1
synthesis (`cycles/cycle-1/stage6/SYNTHESIS.md`, SHA-256
`b7cc57b1b2dda1c8d433c2436e7f3586b5282844700b0b1bda84b0fd8f48bae3`, Stage 6
packet seal `5a6ee227a1bbfac5d730aa2cc291aeff8ca1bc990674a4358c571762d0422da9`):
group A, the fixed-band `d = 5` seven-matching sign theorem, and group B, the
perfect-matching companion. Every other conclusion the synthesis excluded stays
excluded; nothing was weakened to obtain a close.

### C1-LA2: `E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN` (award group B, companion)

Status: `formally_verified`

- Award capsule: `control/c1-stage7-capsules/C1-LA2-PACKET-MANIFEST.json`,
  seal `c9c57e52d812166a1eb905874f38963b1972815800dcb17469b0f0dfd35aecd7`
  (originating seat U2; the proof was supplied by its F critique).
- Run: `runs/lean-2026-09-20-c1-perfect-matching-uniform-sign`.
- Declaration: `Erdos993G1.C1LA2.perfectMatching_delta_nonpos` (`theorem`).
- Exact scope: for every finite simple graph `G` on a vertex type `X` with
  `[Finite X]`, `Nat.card X = 2m`, an injective `f : Fin m × Bool → X` with
  `G.Adj (f (i,false)) (f (i,true))` for every `i`, and every natural `r` with
  `2m ≤ 3r+1`, `Erdos993G1.delta G (r : ℤ) ≤ 0`. Definitions are the G1
  literals (`indepCount`, `coeff`, `delta`) re-declared inside `namespace
  Erdos993G1` blocks with bodies textually identical to the frozen C2/C3
  sources (verified by the controller and by the fidelity reviewer in nine
  comparisons). Uniform over EVEN excess only (the hypothesis forces
  `d = 2(m−r)`); not Tier 3a; no sharpness claim; no transfer to `x(G)`,
  forests, residuals, G1 tuples, Tier 1, Tier 2, the diagnostic band, FOREST,
  TREE, TRANSFER, `E993-BETA-AGG` or Erdős #993. Claim identity:
  `E993-G1-MATCHING-COMPARATOR-SUFFICIENT` stays CONDITIONAL; this theorem does
  not instantiate it.
- Theorem-contract SHA-256:
  `227b4260591267942d3ba6a73ad15326aa831336989e7f777a1365bd646fa425`
  (contract receipt `b3d7a634a45c9f79c820b617ef92bdc795af02fe383d96d054d3a5889bb56b81`,
  `valid_for_formalization`). The formalizer's original contract
  (`79c31cd6…`) is preserved under `EVIDENCE/superseded-contract-1/`; the only
  change is `lean_binding.expected_statement`, now the exact namespace-relative
  source text (the name prefix), with `declaration_name` unchanged.
- Informal proof SHA-256:
  `93366e7c81065578d6fa5749172832404fac1cbe2805b00e330c93b371e20667`.
- Lean source SHA-256:
  `15c8f7f19e9754f71cf96d7b92935e78b8768db54646798d9552dd1eec81ffd0`
  (18 registered fragments: 3 definitions, 14 lemmas, 1 terminal theorem;
  the two synthesis-named lemmas `perfectMatching_containment` and
  `perfectMatching_threshold_arith` present; the `r ≥ m` case handled by
  `perfectMatching_indepCount_eq_zero`).
- Kernel receipt SHA-256:
  `7b8637f8000216d464c94824be9572c248490adb412d1b8b00275dfc03e7ef46`
  (`verified`; build, single-file, sorry/admit scan, axiom probe, source
  immutability, sandbox, shared-binding checks all passed).
- Reported and permitted axioms: `propext`, `Classical.choice`, `Quot.sound`.
  No `sorry`, `admit`, or `native_decide`.
- Independent informal proof-integrity audit (Claude Opus 5, high; reviewer
  `c1-la2-fable-informal-20260920`): `passed`; audit
  `82867101604d32fe38f4b4ca453c50021468f8207f9dcf6ee1093f7c268486ce`, receipt
  `6cd7aa946527e164f8201983aead814aff46ebb918deff8156f6445f821a7a04`. The
  auditor's own two evaluators found zero violations of the theorem and of
  every ledger step across all 16,781,328 perfect-matching graphs on 4, 6 and
  8 vertices plus 2.5 million sampled at orders 10 and 12; relaxing the
  threshold by one (`2m ≤ 3r+2`) produces 933 violations at order 8, the first
  being `4K₂`, so the constant is exact and the hypothesis load-bearing.
- Independent statement-fidelity review (Claude Opus 5, high; reviewer
  `c1-la2-fable-fidelity-20260920`): second dispatch `passed`, verdict `match`,
  29 deterministic checks passed, 10 notes, no warnings or errors; contract
  projection `ce710c0c7dd66538dce662df874c354eb833db760cbdf4845f5c6ebc1360518e`,
  binding projection `f034d0a8fc2b86d6a20bbf914adca56531e40c48e6eddfe6e4e7a399dafa8ba7`,
  fidelity receipt `0b1628660ff47987b4f33fa8e986a07a639df8e46943e4f97897eff3b5cf7ed4`.
  The reviewer rebuilt the canonical projection independently and found it
  byte-identical to the controller-regenerated input.
- Canonical verification report SHA-256:
  `88b1557596b0f1f94ea3201d828177bb5cd8202bd9c63f6d8e18b0391ca12144`
  (`formally_verified`; claim boundary: Lean kernel validity plus independent
  statement fidelity, nothing broader). Repair attempts used: 0 of 2.
- Lean pin `leanprover/lean4:v4.32.2`; Mathlib
  `905b95818eb32af7874a58b427f50c1711a5e96c`; shared packages symlinked, not
  copied.

Preserved rejections and repairs (process faults; Lean source never changed):

- First fidelity dispatch withheld attestation (correctly): the
  formalizer-drafted review input was not the workflow's canonical projection
  (17 deterministic mismatches in the reviewer's dry run) and the contract's
  statement text carried the fully qualified name. The controller repaired
  both with `control/fix_contract_statement.py` and
  `control/regenerate_fidelity_input.py`; the superseded files are preserved
  under `EVIDENCE/superseded-contract-1/` and `EVIDENCE/superseded-fidelity-input-1/`.
- `EVIDENCE/blocked-close-1/`: the first governed close returned `blocked`
  because the formalization receipt carried the short run id
  `c1-la2-perfect-matching-uniform-sign` (instructed by the controller's brief,
  inherited from the r24 brief that produced the identical block). Repaired
  with the supported `rebind-run-id` operation; the second close passed.

### C1-LA1: `E993-R25-FOURTH-BAND-SEVEN-EDGE-MATCHING-SIGN` (award group A)

Status: `formally_verified` (fixed-band `d = 5`, named as fixed-band)

- Award capsule: `control/c1-stage7-capsules/C1-LA1-PACKET-MANIFEST.json`,
  seal `be4b00b46abf55a5e2239d5372ed9adf91f4847107e58f280789216fd4810af4`
  (originating seat U4; both U4 critiques supplied the `r`-uniform dual).
- Run: `runs/lean-2026-09-20-c1-d5-seven-matching-sign`.
- Declaration: `Erdos993G1.FourthWideMatching.sevenMatching_delta_nonpos`
  (`theorem`).
- Exact scope: for every finite simple graph `G` on a vertex type `X` with
  `[Finite X]`, `hr : 1 ≤ r`, `Nat.card X = 2r+5`, an injective
  `f : Fin 7 × Bool → X` with `G.Adj (f (i,false)) (f (i,true))` for every
  `i : Fin 7`, `Erdos993G1.delta G (r : ℤ) ≤ 0`. Bare: no crossing
  hypothesis, no acyclicity, no forest hypothesis. Definitions are the G1
  literals (`indepCount`, `coeff`, `delta`, `FirstWide.stratum`) re-declared
  in namespace blocks with bodies identical to the frozen C2/C3 sources. The
  nine new lemmas mirror C3 entries 154–164 (`Fin 5 → Fin 7`, `M.card = 14`,
  order `2r+5`, re-centring `t = r−9`); the terminal assembly is a thin
  combination of `_ge9` (`r ≥ 9`, integer certificate) and `_small`
  (`r = 5..8`, exact duals) with `r ≤ 4` vacuous by cardinality.
  Exclusions (all stated in the registration record, since the contract
  schema has no exclusions field): no Tier 1 / Tier 2 / Tier 3-uniform
  status; the diagnostic band `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`
  (crossing-conditioned) is NOT closed; no forest status transfer; nothing to
  FOREST, TREE, TRANSFER, `E993-BETA-AGG`, Erdős #993; no sharpness claim
  (the `m = 6` fence is confirmed, not disturbed); not the refuted comparator
  (`E993-G1-MATCHING-COMPARATOR-SUFFICIENT` stays CONDITIONAL); no claim about
  log-concavity, TRS2 or real-rootedness; `novelty_claimed: false`.
- Theorem-contract SHA-256:
  `2479fc1af6b2bf38659922b7a51cdef8f25779010382b9f2c6374bd38b85961b`
  (contract receipt `b5efe3cd0ca7b642101a3d27556329a70c09f86d8dc219459f9a2c12fb64a199`,
  `valid_for_formalization`; the statement text was written namespace-relative
  by the formalizer, so no contract repair was needed).
- Informal proof SHA-256:
  `be5d93c2c05b9515a2caa078a58b74c80ba472fdbf480b23b63e1fc9de44c44c`.
- Lean source SHA-256:
  `c1061ca67ff78acd477769e56e94a054646e7d7f18b207cf5c0a0b8e6c56b5dc`
  (27 registered fragments: 4 definitions, 22 lemmas, 1 terminal theorem).
- Kernel receipt SHA-256:
  `3e395701178f2136d8f3d0f9566568d7446563dc4184cf2ec9f1892883f03b36`
  (`verified`; build, single-file, sorry/admit scan, axiom probe, source
  immutability, sandbox, shared-binding checks all passed).
- Reported and permitted axioms: `propext`, `Classical.choice`, `Quot.sound`.
  No `sorry`, `admit`, or `native_decide`.
- Independent informal proof-integrity audit (Claude Opus 5, high; reviewer
  `c1-la1-fable-informal-20260920`): `passed`; audit
  `7779df57145cdbd385d1cfa5233fb189e5514662bdc6e3cd94ea74ad34ebd913`, receipt
  `61652730bfc76dfc723d776dc811c8dff1f2d7d17d1c747a11454bf66650dcf4`. The
  auditor verified all sixteen dual identities of the integer certificate as
  exact polynomial identities in `t`, the four small-rank systems (exact LP
  optimum 0), and about 1.84 million exactly evaluated graphs of order `2r+5`
  with a 7-matching (the comparator `7K₂ ∪ (2r−9)K₁` for `r = 5..30`, 4,852
  exhaustive small-edge additions at `r = 5`, 1.78 million random and
  structured supergraphs at `r = 5..7` and `9..12`, and the complete forest
  censuses of orders 15 and 17 restricted to `ν ≥ 7`) with zero violations;
  the registered six-edge fence `6K₂ ∪ (2r−7)K₁` has `Δ_r > 0` at every one of
  those ranks, so the checker is non-vacuous and seven is the threshold.
- Independent statement-fidelity review (Claude Opus 5, high; reviewer
  `c1-la1-fable-fidelity-20260920`): `passed`, verdict `match`, 33
  deterministic checks passed, 1 informational warning (the contract's
  declared dependency list is not the full closure; all 27 entries live in the
  one kernel-bound file), 9 notes; contract projection
  `9ebbf235b88557446d573a03f3d17ed61777a483803378a7d4e05b26c5f3cdd4`, binding
  projection `1bc68ef557c37173d3918ee2b122a1da863199805b086803eacb7306b7b93f7f`,
  fidelity receipt `00b1804fe0f0a1a20ff226f52cdc4f4b5afe021de58238492b9f1d71b14c41cc`.
  The reviewer reproduced the controller-generated canonical review input
  byte for byte.
- Canonical verification report SHA-256:
  `dbd8c612d25ee109dbfc83dd70ec03bb2069856fdc75ac911c4037ac31c70807`
  (`formally_verified`; claim boundary: Lean kernel validity plus independent
  statement fidelity, nothing broader). Repair attempts used: 0 of 2; the
  close passed at the first attempt after the controller rebound the
  formalization receipt to the canonical run id beforehand.
- Lean pin `leanprover/lean4:v4.32.2`; Mathlib
  `905b95818eb32af7874a58b427f50c1711a5e96c`; shared packages symlinked, not
  copied.

Reviewer notes carried into the record, changing nothing:

- The synthesis and the U adjudication described the certificate's slack
  column as sitting on the top stratum `a_7`; the verified dual family puts
  the slack on the low strata `a_0..a_3` (the `a_7`-only alternative is
  infeasible: it forces a negative multiplier at `r = 9`). The formalizer's
  certificate lemma carries `ha0..ha3 : 0 ≤ a_j`, each discharged at the
  single call site by cardinality nonnegativity; the terminal statement is
  unaffected. The clearing constant is `210·(t+4)···(t+10)`, not the
  synthesis's `105·(r+1)···(r−5)`, which does not clear one denominator.
- `INFORMAL-PROOF.md` §4 has a display defect (the first displayed identity
  carries the slack block on one side only) and two typos (`Type u` versus
  `Type*` in the byte-identity claim for entry 158; `A_0 = A_7` should read
  `A_3 = A_7`). The Lean proof and the adjoining prose are correct and the
  auditor passed the proof; the controller did not reissue the audited
  artifact (a reissue would change the informal-proof hash, the contract and
  the fidelity input for a display typo). The erratum is recorded here.
- `hr : 1 ≤ r` is retained for fidelity with the C3 analogue and is redundant
  (`14 ≤ 2r+5` forces `5 ≤ r`); the `{X : Type*}` binder is
  universe-polymorphic and narrows nothing.

Process record for this award: the formalizer's brief instructed a short
formalization run id (inherited from the r24 brief); the controller rebound
it to the canonical id before dispatching reviewers, and generated the
fidelity review input canonically before dispatch, so no close was blocked.

## Non-Conclusions

Stage 7 proves nothing about Tier 1 (`E993-R25-UNR-FOREST-WIDE`), Tier 2
(`E993-G1WIDE-NO-SIZE-CAP`), the Tier 3 uniform schemas, the diagnostic band
`E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN` (crossing-conditioned; the
group A theorem is bare and matching-conditioned), FOREST, TREE, TRANSFER,
`E993-BETA-AGG`, or Erdős #993. No fence is reopened; the six-edge comparator
refutation at `d = 5` is confirmed, not disturbed.

## Stage Verdict

The Stage 7 gate is terminal and fail-closed: `2 formally_verified`
(C1-LA1 fixed-band `d = 5` seven-matching sign; C1-LA2 perfect-matching
even-excess sign), `0 blocked`, `0 silently weakened`. Both are registered
run-locally as VERIFIED (`control/CLAIM-IDENTITY.run-local.json`) with
ledger rows `R25-LA1-…` and `R25-LA2-…` in `OBLIGATIONS.csv`; the master
registry is unchanged.
