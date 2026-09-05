# Verification Record — r14 Export (2026-09-05)

Binds the three `proofs/lean/r14-*` packages and
`experiments/r14-ambient-target.md` to the sealed r14 run (closed and
sealed 2026-09-05, internal archive).

## Source bindings (sha256)

| Artifact | Digest |
|---|---|
| CLOSING-RECORD.md | `25698fb013bdc7944ff25170329532fde4682c86a3ea1fe86f045b4e4a87b913` |
| SOLUTION-CONTRACT.md (amended) | `88e77864704fc0281886aafe05aead25ce9becf06fdeacb0036843492fe84778` |
| STUDY-INTERLUDE-1.md | `ce7acb92321cbea068e5b64d6c762a36786d130924a73f672511b8f9a049cc12` |
| STUDY-INTERLUDE-2.md | `9b499f70ce41e4db4c39ef660458ed0881775c37b7ec44dae8866c333c593a63` |
| C4-GATES.md (band award + G2wide adoption) | `7f12aebc61646fdd654732adea1c0b23912eb10cb4fa003bcb36fb3bf04c90c3` |
| C5-GATES.md (dual rebuilds MATCH) | `f740d7d2762473b0e6c40292a1cca4624e3b0de057cc0043d4041235290de068` |

## Package verification

All three packages: sources byte-identical to gated artifacts (cmp +
sha256, zero import adjustments; the r11/r12 dependency chain vendored
byte-identically, cross-verified against the published
`r12-deg2-reduction` bytes); built at the pin (Lean 4.32.2 f3b06c70,
Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`, cache manifest
`52a4d73cb6d885abcc2669f7eb652c81ce369a8a93ce211894a6e6b9f7d46c7c`
verified before/after each build); exit 0, zero repairs; 75/75 checked
declarations at exactly `[propext, Classical.choice, Quot.sound]`; zero
live `sorry`. The band theorem carries seven registered elaborations
across four parties inside the source run (route dual legs, an
independent critic proof chain, the adjudicator, rebuild legs A/B, and
the controller's own cold leg).

## Claim boundary

Nothing in this export proves or refutes TREE, FOREST, or TRANSFER;
exhibits a counterexample; or establishes independence. `AmbientTargetDeg2`
remains OPEN with its obligation narrowed to `G2 ∧ |U| ≥ 2p−2`; Premise-K
statements carry their external premise on their face; every zero-hit
search cited is bounded evidence and never universal. Grades are the
source run's rubric grades; nothing is `formally_verified`.
