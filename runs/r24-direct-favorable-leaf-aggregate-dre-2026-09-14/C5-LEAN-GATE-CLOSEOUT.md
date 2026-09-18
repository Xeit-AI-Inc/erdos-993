# Cycle 5 Lean Gate Closeout

Date: 2026-09-17 (controller: Claude Fable 5.1)

## Terminal Award State

Stage 7 attempted exactly the one award group named by the admitted Cycle 5
synthesis (`cycles/cycle-5/stage6/SYNTHESIS.md`, SHA-256
`1964a3086e5acde5221c5c68dd2b4e94e46acf386ea77f3c46f4e15cfa6ae74d`, Stage 6
packet seal `972557601b33b44c1839bccec6278c5e827d83607d3f18b2b50549696faaa842`).
It is formally verified at its exact contracted scope. Neither blocked Cycle 4
award was reopened; no arithmetic fragment or weakened theorem was substituted
for anything.

### C5-LA1: `TOP-RANK-RESIDUAL-IDENTITY` (F7 collapse ∘ `(RI)`)

Status: `formally_verified`

- Award capsule: `control/c5-stage7-capsules/C5-LA1-PACKET-MANIFEST.json`,
  seal `bf8fc6c041176f7a11c1d502cb45161e84b4878c87cb93a0efb47707b14df52e`.
- Run: `runs/lean-2026-09-17-c5-top-rank-residual-identity`.
- Declaration: `C5LA1.topRankResidualIdentity` (`theorem`).
- Exact scope: for every finite simple graph `G` on a finite vertex type with
  decidable equality and decidable adjacency, under the four hypotheses
  `G.IsTree`, `2 ≤ G.indepNum`, `crossingIndex G + 2 ≤ G.indepNum − 1`, and
  every leaf of `G` belongs to every maximum independent set of `G`, the
  literal top-rank aggregate satisfies the equality
  `aggregate G (G.indepNum − 1) = ℓ·M − Σ_{B ∈ I_{α−1}(G)} (|B ∩ L| − Σ_{s∈B} λ(s))`,
  with `L` the leaf set, `ℓ = |L|`, `M = i_α(G)`, and `λ(s)` the number of leaf
  neighbours of `s`. All definitions are the r23 literals (`sources/r23/SEMANTIC-CONTRACT.md`
  lines 30–48): leaf = unique neighbour; `H_v = G − {v, s_v}`; `R_v = G − N[s_v]`;
  `b_v = Δ_{p−1}(H_v)`; `B_v = Δ_{p−1}(R_v)`; `S = Σ_{v ∈ F}(b_v − B_v)` over the
  favorable filter of the leaf set; `x(G)` the least `k` with `Δ_k(G) < 0`;
  deleted-graph coefficients counted over the original vertex type (F7
  convention). F7 (`C4LA1.topRankSelectorCollapse`, reused digest-bound)
  discharges exactly the step `F = L`.
- Theorem-contract SHA-256:
  `750bc81b5af8c18c6c9766c5a419411e57213829d359843ac70493ec4ad12b00`
  (contract receipt `018a19fe55f53803d3a6eb8abf8109ffcb05c576dda76602fdb2d1ce92d1f109`,
  `valid_for_formalization`).
- Informal proof SHA-256:
  `dd0e4e774d75bfc567b47ebad48631148327b96da3a8ed4995072461b65df9a9`.
- Lean source SHA-256:
  `0933211d8f02acd867e91547d4a2b09d13fcc3ea178e192e385acc33b696b63b`
  (31 registered fragments: 8 reused F7 fragments, 10 new definitions, 12 new
  lemmas, 1 terminal theorem).
- Kernel receipt SHA-256:
  `0a44d69a1b5fe8a7ece1cc91d1f81de5afecc12f7d384a217f77cbaf28dc5df6`
  (`verified`; build, single-file, sorry/admit scan, axiom probe, source
  immutability, sandbox, shared-binding checks all passed).
- Reported and permitted axioms: `propext`, `Classical.choice`, `Quot.sound`.
  No `sorry`, `admit`, or `native_decide`.
- Independent informal proof-integrity audit (Claude Opus 5, high; reviewer
  `c5-la1-fable-informal-20260917`): `passed`; audit
  `9dde071694636e5a7e96fd57b3ac6216e17b690e362e05b5ccf47b345580c50a`, receipt
  `b9bad4fae6d989da47b1eb09396638c95ad72a844aac7ec2a940d7d72ef54dc3`. The
  auditor's own evaluator reproduced the identity on 163/163 residual
  non-isomorphic trees (`n ≤ 11`) and 26,239/26,239 residual labelled non-tree
  graphs (`n ≤ 6`), and observed failure on 271/271 non-residual trees and
  6,182/6,182 non-residual graphs; `K_{1,2}` at `p = 1` confirms
  `hyp-eligible` is unused by the derivation and mandatory in the statement.
- Independent statement-fidelity review (Claude Opus 5, high; reviewer
  `c5-la1-fable-fidelity-20260917`): `passed`, verdict `match`; contract
  projection `6d087403cc93aa92c02fd9293f3dae7acff6238b4fe094b2000d97a27582e0cd`,
  binding projection `6f6e96386334d05300f12ca995db51856f05ac7b57784f75bbee3d5273e10ddf`,
  fidelity receipt `1da6c5e80b0e632c33f0a95db69945c5788dc39da435654951f5981453ca1995`
  (32 deterministic checks passed, 11 semantic findings, all notes).
- Canonical verification report SHA-256:
  `1af6188a60f8a570015912931f79b8071bd2e64867398a7bc76293a203bf20cb`
  (`formally_verified`; claim boundary: Lean kernel validity plus independent
  statement fidelity, nothing broader).
- Lean pin `leanprover/lean4:v4.32.2`; Mathlib
  `905b95818eb32af7874a58b427f50c1711a5e96c`; shared packages symlinked, not
  copied.

Hypothesis notes carried by the reviewers, changing nothing: `hEligible` is
retained unused (mandatory scope fence, controller ruling); `hTree` is used
only through the F7 reuse and was not needed anywhere in the auditor's census
(a finite census proves no removability; the declaration retains it). The
reused F7 declaration was re-registered with keyword `lemma` (a Lean 4 macro
for `theorem`; kind, elaborated type and kernel term unchanged), ratified.

### Preserved rejections

Two closes were rejected before the canonical close and are preserved intact:

- `EVIDENCE/rejected-fidelity-close-1/`: the first fidelity review returned
  `blocked_reviewer_uncertain` because the formalizer-drafted review input
  paraphrased or truncated seven canonical contract strings (F7's own
  first-close failure mode). The controller regenerated the input verbatim
  from the contract by the workflow's canonical projection rule; a fresh
  attestation on the new projection hashes passed. The reviewer's
  `domain-vertex` objection was withdrawn on the rule: the projection derives
  domains from top-level quantifiers and `v` is not a top-level binder here.
- `EVIDENCE/blocked-close-1/`: the first workflow close returned `blocked`
  because the formalization receipt carried the short run id
  `c5-la1-top-rank-residual-identity`; the supported `rebind-run-id`
  operation repaired the receipt (now
  `b5478eb375aa02e60ba6e62d48273b8332d7b67246e06f97a52aa7657f9978bd`)
  without changing Lean source, and the second close passed.

### C4-LA2 and C4-LA3

Not reopened, both remain `blocked` (synthesis ruling: U1's `T_m` bridge is
informal, incomplete, conditional, and unshipped; U2 supplies item 2 of the
C4-LA3 block mathematically but the frozen guarded PSC relation and the
canonical literal-tree representation have no source authority in scope).

## Non-Conclusions

Stage 7 does not prove `(RC)`, any sign or nonpositivity of `S`, the eligible
top-rank residual obligation, the full literal interior-window aggregate,
semantic transport, governed `E993-BETA-AGG`, or Erdős #993. The identity is
an exact reformulation of the top-rank residual aggregate, not a bound on it.

## Stage Verdict

The Stage 7 gate is terminal and fail-closed: `1 formally_verified`,
`0 blocked`, `0 silently weakened`; the two Cycle 4 blocks stand unchanged.
