# Cycle 5 Lean Gate Closeout (r25)

Date: 2026-09-22 (controller: Claude Fable 5.1). Final.

## Terminal Award State

Stage 7 attempted exactly the one award group the admitted Cycle 5 synthesis
funded at this close (`cycles/cycle-5/stage6/SYNTHESIS.md`, SHA-256
`dfa5bddc56d5ff37e9c6d7d894ced8cf0b37c5e4f28a42db0372d371a67f61af`, Stage 6
packet seal `fe1be52db8d7ce356ceb517cd256acefd1925747c12066ac11d401d6dfebacb8`):
AWARD GROUP A, `E993-R25-MATCHING-DUAL-SCALAR-CORE`. It is `formally_verified`;
closed on the first attempt with 0 of 2 repairs used. Every conclusion the
synthesis excluded stays excluded; nothing was weakened to obtain a close.

### C5-LA1: `E993-R25-MATCHING-DUAL-SCALAR-CORE` (AWARD GROUP A) — the run's sixth formal award

Status: `formally_verified`

- Award capsule: `control/c5-stage7-capsules/C5-LA1-PACKET-MANIFEST.json`,
  seal `ce9736a9bb93a43fe9d55627f8c98893f54e7790bf5a68e0426168ca498943bb`
  (originating seat U1; route `U-C5-01`).
- Run: `runs/lean-2026-09-22-c5-matching-dual-scalar-core` (canonical run id
  used from `init`).
- Declaration: `ErdosR25.E1ArithmeticCore.matchingDual_scalarCore_award`, the
  explicit conjunction of four parts, each the seat's registered lemma
  statement:

  ```lean
  theorem matchingDual_scalarCore_award :
      (∀ m d : ℤ, 9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 = 3 * (3 * d - 2 * (m + 1)) * (d + 2 * (m + 1))) ∧
      (∀ m d : ℤ, 0 ≤ m → 0 ≤ d → (9 * d ^ 2 + 12 * (m + 1) * d - 12 * (m + 1) ^ 2 ≤ 0 ↔ 3 * d ≤ 2 * m + 2)) ∧
      (∀ m d n : ℤ, 0 ≤ m → 0 ≤ d → 3 * d ≤ 2 * m + 2 →
          (n + 1) * ((2 * m - d) + 1 - n) ≥ 4 * (m + n - (2 * m - d)) * (m - n)) ∧
      (∀ m K : ℕ, (K : ℤ) ≤ 2 * (m : ℤ) → 3 * (2 * (m : ℤ) - (K : ℤ)) ≤ 2 * (m : ℤ) + 2 →
          ∀ n : ℕ, K + 1 < 2 * n → n ≤ m → PStatement m K n)
  ```

  with `PStatement m K n := Nat.descFactorial n (2*n − K − 1) ≥ 2^(2*n − K − 1) * Nat.descFactorial (m + n − K − 1) (2*n − K − 1)`.
  In words: (1) the discriminant factorisation `Δ = 3(3d − 2(m+1))(d + 2(m+1))`
  for `d = 2m − K`; (2) the two-sided characterisation `Δ ≤ 0 ⟺ 3d ≤ 2m+2` for
  `m, d ≥ 0`; (3) step (S) on the region; (4) inequality (P) at every hard index
  (`K+1 < 2n`, `n ≤ m`) on the region, for both parities of `K`.
- Exact scope and fences (synthesis AWARD GROUP A; on the contract and the
  terminal docstring): pure arithmetic of the stratified matching-incidence
  certificate's greedy dual; uniform in `(m, d)` on the region and in the index;
  no horizon; `m` and `d` are numerals. It is the SCALAR core and does NOT raise
  `E993-R25-MATCHING-ALL-INDEX-DUAL-POSITIVITY` (whose object is the
  coefficientwise-in-`t` nonnegativity of `N_j`); it is not the large-rank
  theorem and not the Tier 3a schema; no statement about any graph, forest, G1
  tuple, tier, FOREST, TREE, TRANSFER or Erdős #993; no `SimpleGraph`, `Δ_k` or
  `indepCount` occurs; no sharpness claim; no claim that a certificate exists for
  any particular graph. The sharpness of the region for (P) (exact for
  `m ≤ 120`; smallest off-region failure `(m,K,n) = (1,0,1)`) is recorded by the
  informal auditor as evidence and is NOT on the award's face.
- Hypotheses of part 4: exactly `(K : ℤ) ≤ 2m`, `3(2m − K) ≤ 2m + 2`,
  `K+1 < 2n`, `n ≤ m`. The synthesis's listed hypothesis `m ≤ K+1` is absent:
  the fidelity reviewer and the informal auditor each re-derived its redundancy
  (from the region and `K ≤ 2m`), so the formal statement is EQUIVALENT to the
  registered form — a sound strengthening, registered by both reviewers rather
  than absorbed silently.
- Attribution (on the award's face): the definitions, the discriminant lemmas,
  (S) and both base cases are seat U1's; the induction step and the induction
  principle are CRITIC-ATTRIBUTED — C-U1-F (toolkit-free proof, the primary)
  and C-U1-T (independently; `P_holds_critic'`, renamed
  `P_holds_critic_general` by the registrar). The seat's `descProd` toolkit is
  absent from the award project entirely.
- Theorem-contract SHA-256 `5a6ad44c2c59d95c378c3e60e3b4a37d539dbfb2c8c0df719d663efd1210663c`
  (receipt `09f1d6d59b7b2f8bd8a7c71ece877b7e08772058765cbc9e2494fb11d64e4aae`; contract id
  `c5-la1-matching-dual-scalar-core-v1`).
- Informal proof SHA-256 `f1e0d57ed35141aad5fa3b5d10a01b063b885964357eaa50be12b73b782320d9`.
- Lean source SHA-256 `55d57358e046e0159a8e890bc1725b11fd4aba12e405453ad2eda41cc6c974e3`
  (the definition, the discriminant lemmas, (S), both bases, the critic-attributed
  induction step and principle, one terminal theorem).
- Kernel receipt SHA-256 `76e9e48ac4719b22b3ffae8c0d021f62dbaf0f37dd835ea32fee100888813731`
  (`verified`; 8657 jobs; axioms exactly `propext`, `Classical.choice`,
  `Quot.sound`; no `sorry`, `admit`, `native_decide`).
- Independent informal proof-integrity audit (Claude Opus 5, high; reviewer
  `c5-la1-fable-informal-20260922`): `passed`; audit `5fbee1d99f8a9ae054f855e5239e4b3382c47a4d076076dd9926d7495e96b7f8`,
  receipt `ff066015298617ba4508a2735ec1dcbfc07cd78e931031a81e8d2e75e4494ecb`. Ledger 40 rows / 40 verified with
  independently reproduced evidence; every ℕ-subtraction verified untruncated
  on 11,638 rows (including the index identity `n − (2n−K−1) = K+1−n`); the
  region is exactly sharp for (P) over `m ≤ 120` (zero mismatches either way).
  One non-mathematical literal corrected (a `grep -c` line count).
- Independent statement-fidelity review (Claude Opus 5, high; reviewer
  `c5-la1-fable-fidelity-20260922`): `passed`, verdict `match`, 19 checks
  passed, 0 failed, 0 warnings; contract projection
  `6243a9f4144e917d85e07aa15436c842836560c5c0b7229bbaff17af8e977614`, binding
  projection `a3786a0b20076c5e06df14e5cdda20bd7bf33058f8c04a4dd60a8128dcee2293`;
  fidelity input `1dcfa80f312ef4cbc3ba1e94a810cbf852be7ef9c01fc83fd29a4f6a9253606f` (controller-generated by the
  canonical projection, `c8438866…` before the attestation; the reviewer's
  dry-run regeneration was byte-identical); fidelity receipt
  `69d25554ecdb52457202e93eeda8cef7d1c719eb3d3a9e30b89d58ed8d5acec4`. Non-vacuity: 19,683 in-region hard rows
  for `m ≤ 80`, zero failures.
- Reviewer assignment receipt `3d1aab3dba2f603f17e22058e0ae3d01e7b2f6d2c5e69e07fd3585c0c68d9077`; formalization
  receipt `45bba4e95222143fa11851cf2d4ec0e8fc23ee7216fa547f1378d7c3f19f0148`.
- Canonical verification report SHA-256 `f6d24bb9d1a878b652c23790824f9f277819abaee73b337b2129af33fd626dec`
  (`formally_verified`; claim boundary: Lean kernel validity plus independent
  statement fidelity, nothing broader). Repair attempts used: 0 of 2.
- Lean pin `leanprover/lean4:v4.32.2`; Mathlib
  `905b95818eb32af7874a58b427f50c1711a5e96c`; shared packages bound by symlink
  and WRITE-PROTECTED (`verify-shared-binding` reports
  `write_protected: true`); the shared cache intact throughout (8,265 oleans).

Deviations disclosed by the formalizer (none affects the theorem): the
controller's brief carried a stale `--date 2026-09-21` annotation in one
command (resolved in favour of the literal run id); `P_holds_critic'` was renamed
`P_holds_critic_general` because the registrar's regex rejects a trailing prime;
transient `/tmp` redirects of registrar output during interactive `register`
calls, deleted afterwards (not artifacts; a brief-rule breach, disclosed).
Controller brief erratum found by the fidelity reviewer: the brief cited
`cycles/cycle-4/stage6/SYNTHESIS.md` for AWARD GROUP A (clone residue); the
reviewer read the correct Cycle 5 synthesis, which the contract itself cites.

## Cycle 6 terminal Stage 7 candidates (named by the synthesis; not funded at this close)

B — the `Bd` tail via the Catalan gap, in its CORRECTED form
(`E993-R25-D-ROW-STEP-SIGN-LAW`, never the seat's false `D_unimodal_peak`):
`Bd(r,r) < 0` for every `r ≥ 6`, with the formally verified `Γ(6,k) > 0` as the
only non-elementary input and 900 exact evaluations at `r ∈ [6,14]` — the
flagship (`U-C6-02`). C — the cover-fiber/Hall carry step standalone
(`E993-R25-BAND-CARRY-STEP-HALL`; `F-C6-03`; zero Lean today). D — the
sharpened uniform forest order bound `k² + k + 3` (`T-C6-02`; one exact step
open). E — the `τ = 5` small-rank closure (`E993-R25-CARD5-JOINT-BUDGET-CELLS`;
`U-C6-03`; the LP-dual certificate formalised twice; assembly plumbing remains;
the `cover_rank_bound` name collision with frozen ENTRY 170 to be repaired).

## Refused this cycle (synthesis rulings, unchanged)

Extended Corollary F as a whole and its arithmetic spine; Theorem C (the
thin-tree top-order classification); the `Δ₃` forest threshold (an open
base-case design question); F2's refutation (registered, not formalised).

## Registry

`E993-R25-MATCHING-DUAL-SCALAR-CORE` registered run-locally as VERIFIED
(`formally_verified`) with the scope, fences and attribution above; the
remaining Cycle 5 registrations and updates are made by
`control/register_c5_close.py` (345 claims); master registry unchanged.
