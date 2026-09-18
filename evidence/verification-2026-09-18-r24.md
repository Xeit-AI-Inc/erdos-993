# Verification Record: r24 Direct Favorable-Leaf Aggregate DRE (2026-09-18)

## Terminal Binding
Internal run `erdos-993-direct-favorable-leaf-aggregate-dre-2026-09-14`, six
cycles (Codex C1–C4; Claude Fable 5.1 C5–C6), run-terminal manifest
`36335bc4fd7194dc9b1b3aab78c7cd81bb4553f786a527e45c42d65ec390e939` (23 members,
path-hygiene clean). Cycle terminal manifests: C4 `510982c0…` (verified
drift-free at the 2026-09-17 handover), C5 `c47dcbe9…`, C6 `9e48f3d5…`. Every
stage of Cycles 5–6 sealed by canonical-JSON SHA-256 manifests (C5: Stage 2
`834f61b2…`, 3 `6f864ef1…`, 4 `a7f41dab…`, 5 `7152b42d…`, 6 `97255760…`, 7
`1d6b11a0…`; C6: 2 `77ee7f12…`, 3 `0916440d…`, 4 `f761599e…`, 5 `b4f8b342…`,
6 `d1fd8755…`, 7 `ed137c1e…`). Three controller-caused post-seal edits of
sealed members and two late critic amendments were reconstructed byte-exactly
from the sealed digests and preserved; no seal was re-issued.

## Exact Witness Evidence
- T22 (`T_m`, m = 22, order 91), `p = 34`: 67 favorable original leaves,
  `S = −498754180547001418536`, unique positive summand `+212336130412243110`;
  at top rank `p = 67`: `S = −4487`.
- T60 (m = 60, order 243), `p = 90`: 181 favorable,
  `S = −1058142362147652597702654588268394677176033202323316960380`; at top
  rank `p = 181`: `S = −32759`.
- Closed form `S(T_m, α−1) = −9m² − 6m + 1`: reproduced by two critics
  independently and by the controller against the frozen evaluator at
  m = 22, 60 (`CONTROLLER-TERMINAL-CHECK.txt`).
- `T_m` band: empty exactly for `m ≤ 21` and `m ∈ {23,25,27,29}`; non-empty for
  every `m ≥ 30`; width 2 at `m = 38`; reproduced by three critics and the
  controller; sealed Cycle 5 in-band row counts 948 / 1417 / 3719 consistent
  only with this.
- Exhaustive orders 15–16: 7,741 and 19,320 non-isomorphic trees (A000055),
  71,075 eligible rows, zero positive aggregates, maximum individual summand
  exactly 0; reproduced end to end by two critics with independent enumerators.
- Eligible top-rank residual class, orders 4–17: 16,424 trees (81,134 total),
  290 flat, 16,134 non-flat, zero violations; reproduced by four instruments.
- `(RI)` census (labelled trees n ≤ 8): 280,391 / 87,833 residual (all hold) /
  192,558 non-residual (all fail) / 8,345 eligible-residual; reproduced by the
  informal auditor and by F3's critics.
- `K_{1,2}` at `p = 1`: `S = +2` outside the live window (eligibility false) —
  the witness that the unqualified `(RC)` equivalence is false.

## Lean Binding
Lean 4.32.2 / Mathlib `905b95818eb32af7874a58b427f50c1711a5e96c`; shared
package tree bound by symlink, never copied; axioms exactly
`[propext, Classical.choice, Quot.sound]`; no `sorry`/`admit`/`native_decide`.
- `C4LA1.topRankSelectorCollapse`: source `e2bc48690fe44b769687461ac8bfad867b6710cca93c6de81bd1ac7ad05d253a`,
  contract `9faa81ad…`, kernel receipt `760881ac…`, fidelity receipt
  `9f5b6985…`, report `formally_verified`.
- `C5LA1.topRankResidualIdentity`: source `0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b`
  (31 registered fragments: 8 reused from C4LA1 by digest, 10 definitions, 12
  lemmas, 1 theorem), contract `750bc81b…`, informal audit `9dde0716…`
  (`passed`; auditor's own evaluator 163/163 residual trees hold, 271/271
  non-residual fail, 26,239/26,239 residual non-tree graphs hold), kernel
  receipt `0a44d69a…`, fidelity receipt `1da6c5e8…` (`passed`, 32 checks; a
  first close was rejected for a paraphrased review input and repaired by
  regenerating the projection verbatim from the contract), verification report
  `1af6188a…` (`formally_verified`; a first close was blocked on a short
  formalization run id and repaired by the supported rebind without touching
  source). Re-verified in Cycle 6: rebuild (8,657 jobs) on the unchanged
  source; axiom probe identical; 19,792-instance evaluator replay zero
  mismatches; T22/T60 satisfy all four hypotheses at top rank and the identity
  holds exactly.
Published as `verified`; the internal governed grade is `formally_verified`.
Sources: `proofs/lean/r24-c4-top-rank-selector-collapse/`,
`proofs/lean/r24-c5-top-rank-residual-identity/`.

## Claim Boundary
Nothing here proves the literal aggregate sign, `(RC)`, transport, governed
`E993-BETA-AGG`, or Erdős #993. The critic-attributed theorems (the `T_m`
closed form; the `K₂`/`P₃` stratum sign; the three-family expansion; the `T_m`
reduction and width law) are exact at their stated scopes, adjudicator-
replayed, and not independently re-proved; they are published with that
attribution and grade. The 81-claim registry is unchanged; the four REFUTED
claims remain REFUTED.
