# Solution Contract: Uniform Residual No-Recovery (r25)

Frozen: 2026-09-20. Run `erdos-993-math-dre-20260920-r25-uniform-residual-no-recovery`.
Contract id `E993-R25-UNIFORM-NO-RECOVERY-20260920-v1`. `novelty_claimed: false`.

## 1. Objective

Extend the G1 matching/vertex-cover method (Cycle 3 of
`erdos-993-g1-large-residual-dre-2026-09-13`) beyond fixed values of the
excess `d = |V(F)| − 2r` into an argument uniform in `d`, or into a proved
reduction that confines every remaining counterexample configuration to a
substantially smaller, explicitly characterized class. Three targets, graded
by reach, in the definitions of `SEMANTIC-CONTRACT.md` (imported verbatim
from the G1 contracts: actual independent-set counts, integer zero
extension, `Δ_k = i_{k+1} − i_k`, `x(F)` the first strict descent):

**Tier 1 — uniform forest no-recovery (registered `E993-R25-UNR-FOREST-WIDE`).**
For every finite forest `F` and natural `r ≥ 1` with `|V(F)| ≥ 2r + 2` and
`x(F) < r`: `Δ_r(F) ≤ 0`. Stated plainly: this is `E993-TGT-FOREST` (weak
unimodality of every forest) restricted to the ranks `r ≤ (|V(F)| − 2)/2`,
i.e. the excess `d ≥ 2` region of the G1 residual. It is registered as a
proper subclaim of `E993-TGT-FOREST`; a proof of Tier 1 is a proof of forest
unimodality below half the order and receives the full falsification battery.
Any claimed proof must survive: exact first-descent checks, disconnected
forests, small ranks, neighbourhood overlap, and the registered failures of
edge-addition monotonicity.

**Tier 2 — uniform G1 residual theorem (registered `E993-G1WIDE-NO-SIZE-CAP`, OPEN).**
For every exact ordinary G1 tuple `(T, v, s, g, p)` satisfying the unchanged
ten-part guard conjunction `Erdos993G1.ordinaryG1Guards` (tree; leaf `v`;
degree-two support `s`; other neighbour `g ≠ v`; `p = x(T) + 1`; negative
Gamma `Δ_p(A) + Δ_{p−1}(H) < 0` with `A = T − N_T[v]`, `H = A − g`; width
`2p − 3 < |U|`; residual crossing `x(U) < p − 2`), with
`U = T − (N_T[v] ∪ N_T[g])` in original neighbourhoods:
`Δ_{p−2}(U) ≤ 0`, uniformly in `|U|`. The complete contract is imported; no
weaker surrogate replaces any guard.

**Tier 3 — a rigorous reduction isolating a smaller obstruction.** Proved
theorems of the form: (3a) a *matching-branch* theorem uniform in `d`: for
every finite simple graph `G` of order `2r + d` with a matching of size
`≥ m(d)` (explicit `m`), `Δ_r(G) ≤ 0`, bare or under `x(G) < r`; (3b) a
*cover-branch* theorem uniform in `d`: for every forest (or graph) with a
vertex cover of size `τ ≤ c(d)` (explicit `c`), `Δ_k > 0` for all `k < r`,
hence `x ≥ r`; and therefore (3c) the *window reduction*: every
counterexample to Tier 1 (respectively Tier 2) has matching number
`ν(F) ∈ [c(d) + 1, m(d) − 1]` together with `x(F) < r` — with `m(d) − c(d)`
stated exactly — plus any further reduction from the ambient G1 guards
(e.g. via `I(A) = I(H) + z·I(U)`, `I(T) = (1+z)·I(A) + z·I(H)`, which give
`Δ_p(A) = Δ_p(H) + Δ_{p−2}(U)`-type couplings between the residual and the
ambient first descent). A Tier 3 result is valuable only if the reduced class
is explicitly characterized and strictly smaller than the current necessary
region (`p ≥ 6`, `|U| ≥ 2p + 1`, `maxdeg(U) ≥ 3`, strict residual recovery).

**Diagnostic band (registered `E993-C3-FOREST-FOURTH-WIDE-CROSSING-SIGN`, OPEN).**
`|V(F)| = 2r + 5`, `x(F) < r ⟹ Δ_r(F) ≤ 0`. Useful as a test of any uniform
mechanism; a band theorem alone is a fixed-band result, graded as such. Every
successful step must explain how it extends beyond one fixed band, and must
identify exactly where matching size, cover size, excess, and the
earlier-descent hypothesis enter.

## 2. Source authority (frozen; digests in `control/C1-STAGE2-PACKET-MANIFEST.json`)

- Registry `sources/authority/CLAIM-IDENTITY.json` — 288 claims, SHA-256
  `8b464065d5845d12744472b6083523b914a34a8bb7f342dfd892cdcae8bfba20`
  (post-G1 merge, 2026-09-20); master `sources/authority/LEDGER.md`
  `728da6ab8e47a9829ff551c5ebf6b6f993e67269b48ef334031296800ab79af7`.
- G1 evidence `sources/g1/`: report, continuation handoff, final
  reconciliation, terminal ledger (288 rows), final obligations; the three
  contracts and verification reports; the three registered Lean sources
  (C3 `Main.lean` `aa517ebc678c552e4533ddd4c37e8b57bc3db0d58cdc91ef08f4e94c9fda1ca4`,
  187 entries: 14 definitions, 172 lemmas, 1 theorem).
- Public docs `sources/public-docs/`: the 2026-09-20 assessment, the G1
  experiment page, the G1 verification record.
- Predecessor ledgers `sources/predecessor-ledgers/` (r24 and the nine it
  inherited, plus the G1 terminal ledger projected to the program schema).
- Public continuity commit `42a291b7be9b423cf5570d8c082a6348ae40afe6`
  (checked current at freeze; no later commit).

## 3. Fixed points, controls, and fences

Fixed points every proposed uniform statement must specialize to correctly:
C2 (`d = 2`, all graphs: `Δ_r > 0 ⟺ ≤ 1 edge`); C3 (`d = 4`, forests: five
disjoint edges or a cover `≤ 4`); C1 (`p ≤ 5` forces `P_8`, `Δ_3 = −15`).
Controls every route touching literal data must reproduce: the C3 dichotomy
on concrete forests; `P_8`; the second band `d = 3` informal exclusion at its
grade. Registered refutations that fence mechanisms (never reopened):
`E993-FOREST-D3-BARE-MATCHING2-SIGN`, `E993-FOREST-D3-BARE-MATCHING3-SIGN`
(at `d = 3`, matching ≥ 3 does not by itself give the sign);
`E993-GRAPH-D3-BARE-COVER3-SIGN`, `E993-GRAPH-COVER3-STRICT-PRE-R-INCREASE`
(cover ≤ 3 at `d = 3` does not force pre-`r` increase);
`E993-C3-FOURTH-BAND-SIX-EDGE-COMPARATOR-SIGN` (`6K₂ ∪ (2r−7)K₁` has
`Δ_r > 0` at `d = 5`); `E993-G1-MAXMATCHING-COMPARATOR-NONPOSITIVE`;
`E993-C3-G1-POINTWISE-ADDABILITY-BOUND`; `E993-C3-FOREST-WIDE-EARLIER-EVERY-VERTEX-SR2`;
`E993-G1-ALL-VERTEX-ALIGN`; `E993-G1-GUARDS-IMPLY-BG-COVER`;
`E993-C3-DIAMETER-ONLY-SR2-SELECTOR`; raw edge-addition monotonicity; the
factor-two margin bound; `E993-UNIV-TREE-TRS2` (Kadrawi–Levit order 26) and
Galvin's non-log-concave trees (no log-concavity premise, ever);
`E993-TRANSFER-TO-FOREST` (no convolution closure of unimodal sequences).
A comparator failure is never a counterexample to a crossing theorem; a
recovering forest and a valid G1 tree wrapper are separate achievements,
verified separately; a proposed counterexample must be an actual graph with
every hypothesis reproduced by exact counts.

## 4. Evidence grades and the Lean gate

`formally_verified` only through the governed `lean-proof-workflow`
(frozen theorem contract, independent informal audit, kernel/axiom receipt,
independent fidelity attestation, canonical close) at Lean 4.32.2 / Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`, axioms exactly `propext`,
`Classical.choice`, `Quot.sound`; no `sorry`/`admit`/`native_decide`; shared
Mathlib bound by symlink, never copied; repair limit 2 per candidate.
Informal exact theorems are `proved_informal` with their dependencies named;
critic-derived results carry attribution; computation is bounded evidence at
its stated finite horizon and never universal proof; a null census is
insufficient for any tier.

## 5. Deliverables (terminal)

An exact target statement (per tier); the strongest established result with
its grade; independently checked evidence (every figure reproduced by an
instrument independent of its author); the remaining obstruction stated
exactly; justified claim updates registered (run-local registry merged at
the close); and a closeout that says which of the four outcomes the
experiment achieved — a uniform advance, a proved structural reduction,
another fixed-band result, or a refutation — with no claim that closing G1
alone solves Erdős #993.

## 6. Stop rules

Ceiling 6 cycles; early finish on a real result (see `AUTHORIZATION.md`).
Stop gate armed from the Cycle 1 close: continue while the adjudicated
evidence supplies (a) a new actual-graph uniform mechanism whose unresolved
dependency is strictly weaker than Tier 1 and survives its fresh falsifier,
(b) a new proved reduction of the remaining class, or (c) a candidate ready
for the Lean gate; a plateau requires evidence of no material progress over
two consecutive cycles. Controller reviews at the Cycle 3 and Cycle 6 closes.
