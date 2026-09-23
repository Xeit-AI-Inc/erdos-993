# Cycle 4 Lean Gate Closeout (r25)

Date: 2026-09-21 (controller: Claude Fable 5.1). Final.

## Terminal Award State

Stage 7 attempted exactly the two award groups named by the admitted Cycle 4
synthesis (`cycles/cycle-4/stage6/SYNTHESIS.md`, SHA-256 `2c23c6eaef6e0cec4161274a1fc247633de68456417ee71d7806b1a5a849c05e`,
Stage 6 packet seal `057ebb8c4d466d3e8d3ca48e203055aaf0e047fa69ab01bdc4e4cc8df1371792`).
Both are `formally_verified`; each closed on the first attempt with 0 of 2
repairs used. Every conclusion the synthesis excluded stays excluded; nothing
was weakened to obtain a close.

### C4-LA1: `E993-R25-MATCHING-BOTTOM-RANK-UNIFORM-SIGN` (award group 1) — the run's first uniform-in-`d` formal theorem

Status: `formally_verified`

- Award capsule: `control/c4-stage7-capsules/C4-LA1-PACKET-MANIFEST.json`,
  seal `35afbd977270d08597d3c4ebbe744f5255de4be0628ebf93bb118d1d68c35f2f`
  (originating seat U4; route `U-C4-04`).
- Run: `runs/lean-2026-09-21-c4-bottom-rank-uniform-matching-sign` (canonical
  run id used from `init`).
- Declaration: `Erdos993G1.UniformMatching.bottomRank_delta_nonpos`:

  ```lean
  theorem bottomRank_delta_nonpos {X : Type u} [Finite X]
      (d : ℕ) (hd : 3 ≤ d) (G : SimpleGraph X)
      (hn : Nat.card X = 3 * d)
      (f : Fin ((3 * d + 1) / 2 - 1) × Bool → X) (hf : Function.Injective f)
      (he : ∀ i, G.Adj (f (i, false)) (f (i, true))) :
      Erdos993G1.delta G (d : ℤ) ≤ 0
  ```

  In words: for every `d ≥ 3`, every finite simple graph of order `3d` carrying
  a matching of size `m(d) = ⌈3d/2⌉−1` has `Δ_d(G) ≤ 0`. G1 definitions
  verbatim (fidelity reviewer: token-identical to the frozen sources).
- Exact scope and fences (lifted from the run's `INFORMAL-PROOF.md` §12, as the
  fidelity reviewer directs, because `theorem-contract/v1` has no scope field):
  rank `r = d` only; order `3d` only; uniform in `d`, no horizon; bare; all
  finite simple graphs. It is NOT the Tier 3a schema
  `E993-R25-MATCHING-BRANCH-UNIFORM-SIGN` (which stays OPEN); it says nothing
  about `d < r < K(d)` or `r ≥ K(d)`; no transfer to `x(G)`, forests, residuals,
  G1 tuples, Tier 1, Tier 2, the diagnostic band, FOREST, TREE, TRANSFER or
  Erdős #993; no sharpness claim; the terminal-margin literals `3/(d²−4)`,
  `1/(d−1)` are excluded from the award (no definition of record).
- Attribution: the generalised `(m,d)` incidence family is seat U4's; the
  `r = d` dual is critic-attributed (C-U4-T and C-U4-F, independently; identical
  on the even branch, two distinct feasible vectors on the odd branch).
- Route: the controller's bounded-width guidance was verified and used — at
  `r = d` only two (odd `d`) or three (even `d`) strata are live, so the general
  `(m,K,r)` summation chain the synthesis named as the single point of failure
  was avoided. Odd branch: a 4-term integer combination at multiplier `2e+2`
  (`nlinarith`); even branch (`e = e'+2`): a 5-term combination with polynomial
  weights, all six atom coefficients collecting to
  `D = 16e'³+96e'²+188e'+120 = 4e(2e−1)(2e+1)`. Both certificates are exact
  polynomial identities (informal auditor).
- Theorem-contract SHA-256 `6f15b1aa61b511dd22d342da416d56d697b2a17bf67568c7fe33943201d71082`
  (receipt `7f76cc2c4edcb1ae64df29599f0f05ffd75d288aee3858904525dfe1adb36650`; contract id
  `c4-la1-bottom-rank-uniform-matching-sign-v1`).
- Informal proof SHA-256 `617db49f8e7745d28cdab0b35bbb71fb14e4dc7df76b3e729f080a7ae907ed3f`.
- Lean source SHA-256 `827a0c45190bde25bef16cd5362a6963a3995836c68eb940d78548fa18917cb6`
  (31 declarations: the verbatim G1 definitions and FirstWide structural
  lemmas, the twelve generalised incidence declarations, the two branch lemmas,
  one terminal theorem).
- Kernel receipt SHA-256 `96b6f74bf6efb76a654e995cf3abf1ee600d194f93c0faa705bd3ad48632a9e2`
  (`verified`; axioms exactly `propext`, `Classical.choice`, `Quot.sound`; no
  `sorry`, `admit`, `native_decide`).
- Independent informal proof-integrity audit (Claude Opus 5, high; reviewer
  `c4-la1-fable-informal-20260921`): `passed`; audit `4c4b26b2bac79479228870d3c6ea27d2b9e17e4aafc71082ac680d69bffbc686`,
  receipt `aeaeff22e6a328e5dc7bdbd0d0a3c6c23dcfd609887b3363005bcef1f1ec8259`. Both duals exactly feasible for
  `d = 3..400`; no hidden lower bound on `e`; zero violations over 15,033,173
  order-9 graphs (exhaustive in the sparse regime), 60,000,000 random graphs and
  hill-climbing; the order and matching-size hypotheses are load-bearing
  (order `3d+1`: `Δ₃ = +16`; `m(d)−1` edges: `Δ_d > 0` for `d = 3..120`);
  `3 ≤ d` is needed by the method, not by the truth (`d = 1, 2` settled
  exhaustively).
- Independent statement-fidelity review (Claude Opus 5, high; reviewer
  `c4-la1-fable-fidelity-20260921`): `passed`, verdict `match`, 27 checks
  passed, 0 failed, 2 warnings; contract projection
  `e3e2e51115f05312bbb9d2cef63cc6285852cfc7cd9745e925934abc0a0dbfee`, binding
  projection `d0f49a73f7e95404cc925d8e102e3f1c29930446180b9443346277f2902d840b`;
  fidelity input `6ede2a4ef15b149730f8d5c9c3d8f7bed591d82987805dcc83332398024ddf08` (controller-generated by the canonical
  projection, `0e249b22…` before the attestation; the reviewer re-ran the dry
  run and found it byte-identical); fidelity receipt
  `50f23e5dd6a899a1aec99e9226bc4a5a61b91a6886b8528ab3a7bf4edfe6add9`.
- Reviewer assignment receipt `e2df438c2e79a38048d6da90a0a615d14e04fc37884063af918cba6a67f700df`; formalization
  receipt `69561bf5542422f0a079fe3ad7112fbe7ae647f2fc6b35a426e348bee68c8aba`.
- Canonical verification report SHA-256 `bc2f50738a435b006727664201b9cf4df794cfa83cbbde3d20fd8943d1b43526`
  (`formally_verified`; claim boundary: Lean kernel validity plus independent
  statement fidelity, nothing broader).

Reviewer items carried on the record (none affects the theorem):

1. Fidelity warning — the contract's quantifier table binds `d` to the
   `Type u` domain (a clerical pointer; the schema declares no ℕ domain);
   `expected_statement`, `informal_statement` and both hypotheses type `d` as a
   natural and Lean agrees. Not corrected (a correction needs a new contract
   hash and a new bound attestation); noted for the contract template.
2. Fidelity warning — fences and attribution are carried by hash-bound
   reference (`INFORMAL-PROOF.md` §§10, 12), not inside the contract; the
   registry entry and this closeout quote them in full.
3. Informal-audit finding F1 (evidence defect, non-mathematical) —
   `EVIDENCE/verify_bottom_rank_certificate.py` writes the live-window lower
   endpoints in as literals and never defines the order `n`, so it does not
   derive them; `INFORMAL-PROOF.md` §§4, 13 and the formalizer report overstate
   that artifact. The windows are correct (auditor-derived for `d = 3..400`,
   brute-forced on explicit graphs) and the Lean proof kernel-checks the
   emptiness facts; the award does not rest on the generator. **That generator
   is never to be cited as a derivation of the windows.**
4. Prose-versus-source: the odd branch closes by `nlinarith`, not `linarith`;
   the `Fintype.ofFinite` bridge sits in the two branch lemmas, not in the
   terminal theorem; `INFORMAL-PROOF.md` §12's "appear above" self-reference for
   the excluded margin literals is wrong and errs safe.

### C4-LA2: `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (award group 2)

Status: `formally_verified`

- Award capsule: `control/c4-stage7-capsules/C4-LA2-PACKET-MANIFEST.json`,
  seal `5a2bde9118fffb7903d5474d53eb5342df62cb755fabfb284cc8780afc549938`
  (originating seat T4; route `T-C4-04`).
- Run: `runs/lean-2026-09-21-c4-forest-descent-order-bound` (canonical run id
  used from `init`).
- Declaration: `Erdos993G1.ForestOrderBound.forest_descent_order_bound`:

  ```lean
  theorem forest_descent_order_bound {X : Type u} [Finite X]
      (G : SimpleGraph X) (hG : G.IsAcyclic) (k : ℕ) (hk : 1 ≤ k)
      (hneg : Erdos993G1.delta G (k : ℤ) < 0) :
      Nat.card X ≤ (k + 1) ^ 2
  ```

  In words: for every finite forest `G` on `n` vertices and every `k ≥ 1`,
  `Δ_k(G) < 0 ⟹ n ≤ (k+1)²`. G1 definitions token-identical to the frozen C3
  source (`aa517ebc…`); `G.IsAcyclic` is Mathlib's forest predicate
  (connectivity assumed nowhere).
- Exact scope and fences (the fidelity reviewer's warning: three of these sit
  in `INFORMAL-PROOF.md` §5 rather than the contract's statement; quoted here
  and in the registry in full): all finite forests including disconnected ones;
  every `k ≥ 1`; uniform, no horizon. No tightness claim beyond `k = 1` (true
  maxima `4, 8, 11` at `k = 1, 2, 3` confirmed conclusively; `15` at `k = 4`
  attained and unbeaten through order 20); no linear ceiling; NOT a no-recovery
  statement (its contrapositive yields `Δ_k ≥ 0`, the opposite sign — no Tier 1
  or NR1 content is derivable); no transfer to Tier 1, the `K₁`-addition target,
  NR1, FOREST, TREE, TRANSFER or Erdős #993; the `x ≤ 4` closure is not bundled.
- Attribution: the `k²+3k` form is seat T4's; the sharp `(k+1)²` form is
  critic-attributed jointly to C-T4-F and C-T4-U.
- Theorem-contract SHA-256 `abcb0e4384a4f78345d2c67c60f72a25cbebccd767b550091bbeb0c298487e10`
  (receipt `45cdb792585bd9ffa8ffe4dcddec9c93a9890b70ed864aecb7240428e3011c0d`; contract id
  `c4-la2-forest-descent-order-bound-v1`).
- Informal proof SHA-256 `019b4abf563cac0c3ae981e72351e560c3e9074c0bfe99b96a597dc71ec669c7`.
- Lean source SHA-256 `736eb9dfb6ba82b0e099fe70df9e4d7f780bccdbd24ca240f4ad1115cfe7dfe0`
  (17 declarations; the proof is division-free, stricter than the informal
  record it formalizes).
- Kernel receipt SHA-256 `28af1d80d207e3f8e6b3c59b783b5484b9831bd961c1c16dabefb3c2c44073f7`
  (`verified`; axioms exactly `propext`, `Classical.choice`, `Quot.sound` on
  all 17 declarations; no `sorry`, `admit`, `native_decide`).
- Independent informal proof-integrity audit (reviewer
  `c4-la2-fable-informal-20260921`): `passed`; audit `d1bb582269a97c3651cd3db4858d4c7026ae574101c90c58577c6372fe8e5e91`,
  receipt `ebb955c4b7714bf6714af5e62abb64f59fa1922c2212fad3e195d27fc25b85ae`. 44 ledger rows closed; the quadratic
  identities are exact; the method's inequality fails at `n = (k+1)²` for every
  `k = 1..200`, so the constant is neither over- nor under-stated; own
  exhaustive instrument over all 3,269,194 unlabeled forests of order ≤ 20:
  zero violations; `1 ≤ k` is a proof-route hypothesis (the statement is true at
  `k = 0` with `n = 0`), so the theorem only under-claims. Four prose
  imprecisions recorded, none mathematical (including §3.2's "byte-for-byte"
  for a re-registration of frozen entry 58 that differs in namespace wrapping
  only).
- Independent statement-fidelity review (reviewer
  `c4-la2-fable-fidelity-20260921`): `passed`, verdict `match`, 19 checks
  passed, 0 failed, 1 warning (the scope-carrier item above); contract
  projection `9431699265b28a915f40675aef257a065f93e3fa3f3e76296313d13bfc89e375`,
  binding projection `2f376a55effba2d8df176bb23b672decd2804c2c1acd357b06d84b48e012b57e`;
  fidelity input `eead689b82676b9c2cf482fde34c3a32474128548cb45c5e9c1d9372b876a05c` (`8cc0dcd1…` before the attestation;
  byte-identical to the canonical projection); fidelity receipt
  `742a0f3593812fdace7d9794ee5da97acb82a265a7d8773ea141701b74bf71d8`.
- Reviewer assignment receipt `523c6b3ac097547b28bbe937950b2d80e9845ea299f38b1be81668127f81ad3c`; formalization
  receipt `d189bbddd790d58b1d6c5cc0c295fac4e30603514a0fa9a97b44a8b4aec1dfff`.
- Canonical verification report SHA-256 `4d9e29bb5a030d0dfb3a144f34baa1ce92f67957a6409f581dc0a8ad5f70ca44`
  (`formally_verified`; same claim boundary).

Both runs: Lean pin `leanprover/lean4:v4.32.2`; Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`; shared packages symlinked, not
copied; `verify-shared-binding` ok before each close; the shared Mathlib cache
intact throughout (8,265 oleans); the two formalizers ran concurrently without
interference.

## Incident (operational; no statement affected)

The C4-LA1 formalizer ran `pip3 install sympy` before any contract or Lean work;
the command reached the network (prohibited by the brief) and added the package
to the machine's system Python. The seat stopped on its own, redid the check
with the standard library, and disclosed the deviation prominently. No artifact
depends on the package (controller-checked; the informal auditor's verdict rests
on no producer script). The package was left in place and reported to Ashton
with the removal command. Recorded in `logs/incident-log.md` and
`control/C4-STAGE7-AGENTS.json`; every later seat prompt states "no network, no
package installs" in the prompt itself.

## Not awarded (synthesis rulings, unchanged)

`Bd(r,r) < 0` for `r ≥ 6` (zero Lean; 13,596 kernel evaluations at ~10²⁶ without
`native_decide`; the alias bridge `M_a(r) ≤ Cat_{r−1−a}` is a Cycle 5 route);
extended Corollary F (the Cycle 5 Stage 7 candidate; its finite check is not yet
Lean-shaped); the large-rank matching sign E2 and the positivity lemma E1
(`(P)` a Cycle 5 sub-target); the `x ≤ 4` closure (undischarged external
dependency); the `d = 5` diagnostic band (closed informally for every `r`; no
input beyond the matching half is formalised).

## Registry

`E993-R25-MATCHING-BOTTOM-RANK-UNIFORM-SIGN` (CONDITIONAL → VERIFIED,
`formally_verified`) and `E993-R25-FOREST-DESCENT-ORDER-BOUND-SHARP` (new,
VERIFIED, `formally_verified`) registered run-locally by
`control/register_c4_close.py` with the scopes and fences above; master
registry unchanged.
