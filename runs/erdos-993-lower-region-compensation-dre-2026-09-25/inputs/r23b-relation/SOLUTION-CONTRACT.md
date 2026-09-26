# SOLUTION CONTRACT — r23 actual-tree Delete/Retag construction and verification
## erdos-993-delete-retag-actual-dre-2026-09-13

Controller: Claude (Fable 5). Authorized 2026-09-13 (`AUTHORIZATION.md`).
Program: Erdős Problem #993 (weak unimodality of tree/forest
independence sequences). Master registry:
`../erdos-993-master-ledger-2026-09-04/CLAIM-IDENTITY.json` (79 claims,
sha `d09bd77dd75fa5006d618e2106186c421e8ed30a3debd172d6460844c95c8091`).

## 1. Assignment (from the authorized brief, binding)

Resolve the concrete construction and verification debt behind O14
(`E993-BETA-AGG`) and `E993-R19-FIXED-GAMMA-HALL`: determine exactly
whether the proposed fixed Delete/Retag relation measures the intended
complete favorable-leaf aggregate on actual trees. The five ordered work
items of the brief are the run's obligations:

- **OB-R23-RECOVER** — recover the LITERAL construction from its
  authoritative sources (admitted inputs, source/target occurrence sets,
  ranks, labels, active bases, Delete and Retag maps, neighborhoods,
  multiplicities, correction terms), with a source-to-definition map and
  a definitions/proved/assumed partition. Never fill a missing canonical
  definition with a guessed replacement silently.
- **OB-R23-EVAL** — an independent ordinary-tree evaluator (exact
  coefficients, crossing indices, leaf/support data, favorable summands,
  complete aggregate) validated against independent subset counting and
  independent closed formulas. Two wrappers around one recurrence are
  not independent.
- **OB-R23-ROWS** — instantiate the literal relation on actual rows
  (T,p); compute Hall deficiency and the aggregate independently; exact
  cut enumeration on small domains; flow/matching only after a proved
  equivalence; preserve any failing cut exactly.
- **OB-R23-CORRESPOND** — prove the actual coefficient correspondence:
  a universally quantified construction on the intended actual-tree
  domain and its exact occurrence/cardinality-to-coefficient identity;
  totality, rank/label behavior, multiplicities, boundary cases; no
  assumed `Identification`, Hall inequality, or coefficient equality.
- **OB-R23-BRIDGE** — state exactly what the formal mechanism implies:
  the conditional bridge from the actual relation to S(T,p) <= 0;
  all-cut Hall vs weaker complete-demand statements kept distinct; a
  deficient cut refutes the mechanism, not O14; a positive complete
  aggregate refutes O14. Both values reported on the same row, always.

Division of work: the mathematics agent attacks the global aggregate
inequality directly; another sibling owns G1 large residual components.
This run owns construction, semantic correspondence, and trustworthy
verification, and begins independently.

## 2. Ordinary-tree evaluation contract (conventions, binding on every face)

i_k(G) counts independent k-sets, zero outside supported nonnegative
ranks. Delta_k(G) = i_{k+1}(G) - i_k(G). x(T) = first k >= 0 with
Delta_k(T) < 0. For every ORIGINAL degree-one leaf v of T with support
s_v, at p >= x(T)+2:

    a_v  = Delta_p(T - v)
    b_v  = Delta_{p-1}(T - {v, s_v})
    B_{s_v} = Delta_{p-1}(T - N[s_v])
    F_p(T) = {original leaves v : a_v < 0}
    S(T,p) = sum_{v in F_p(T)} (b_v - B_{s_v})

Leaves counted separately even when supports coincide; empty favorable
set sums to zero. Any actual difference against the registered RTree
interface is RECORDED before use (OB-R23-RECOVER).

**The recovered fixed relation (r19 C7-T1 §2, the authoritative text;
pinned in `SEMANTIC-CONTRACT.md`):** H_v = T-{v,s_v};
W_v = N_T(s_v)\{v}; C_r(v) = {A in Ind_r(H_v) : A ∩ W_v ≠ ∅};
P = ⊔_{v∈F} {v}×C_p(v); N = ⊔_{v∈F} {v}×C_{p-1}(v);
Delete(q): (v,A)→(v,A\{q}) when A\{q} ∈ C_{p-1}(v);
Retag(w): (v,A)→(w,A\{w}) when w ∈ F ∩ A and A\{w} ∈ C_{p-1}(w).
Stage-0 verified: |C_r(v)| = i_r(H_v) - i_r(T-N[s_v]) and
|P| - |N| = S(T,p) (280 instances, orders 8-12;
`control/STAGE0-AUDIT-VERIFICATION-RESULTS.json`).

## 3. Topology (amended per the authorization)

Per cycle: **18 orientation-protected routes** (6 T / 6 F / 6 U) →
**9 cross-orientation critics** (each critic audits two route returns,
both from orientations other than the critic's own protected stance) →
**3 portfolio adjudicators** (T/F/U) → **1 neutral synthesis** →
controller gate record + cycle seal. SHA-256 manifest sealing between
every stage (canonical JSON preimage:
`json.dumps(files, ensure_ascii=False, separators=(",",":"),
sort_keys=True)`). Worker isolation, sealed-brief + pointer-prompt
dispatch, in-root scratch (`scratchpad/<worker-id>/`), and the
no-external-paths rule all per the controller skill.

## 4. Model schedule (amended per the authorization)

- Routes: **Sonnet 5, xhigh** (18 seats/cycle).
- Critics, adjudicators, synthesis: **Opus 5, high**.
- Registrar re-verification instruments, schema/lint utility seats, and
  other narrow mechanical verification seats: **Opus 5, med** (the "few
  places where appropriate").
- Controller: Fable 5.
- **Mid-run check: after the Cycle 3 close, ONE independent Fable 5.1
  (high) audit seat** reviews the run's first half (gate records, seals,
  registrations, correspondence state) and reports before C4 dispatch.
- AMD-9 on every face: dispatched model string + chartered effort, with
  the not-self-inspectable disclosure (RUL-R20-C5-13 convention).

## 5. Cycle plan (6 cycles; indicative, gates may re-aim)

- **C1** — source recovery (OB-R23-RECOVER) + independent evaluator
  (OB-R23-EVAL) + the mandatory control battery; first literal-relation
  instantiations on small actual rows.
- **C2** — actual-row Hall evaluation at scale-appropriate scope
  (OB-R23-ROWS): exact cut enumeration, proved matching/flow
  equivalence where used; rank-two filter source trace; failing-cut
  preservation.
- **C3** — the correspondence theorem work (OB-R23-CORRESPOND) and the
  first Lean correspondence package. Then the Fable 5.1 check.
- **C4–C5** — the conditional bridge (OB-R23-BRIDGE); repairs; the
  weakest-sufficient-cut analysis; formalization of surviving results.
- **C6** — terminal reconciliation: deliverables, proposed claim
  corrections, handoff to the mathematics agent, terminal seal.

## 6. Mandatory controls (every relevant instrument, before proof search)

Paths, stars, empty residuals, shared-support leaves, coefficient
tails, rank boundaries; the known order-26 non-LC trees (never rejected
by a universal-LC assumption); the order-91 and order-243 beta
witnesses (order-91: 67 favorable leaves, aggregate
-498754180547001418536 at p=34, positive marked gap — Stage-0
reproduced); P30 with v=0, s=1, g=2 (residual P26; satisfies the
displayed r16 G1 conditions at p=10 — never excluded by a size-25
assumption); K_{1,3} regression f=(1,3,1), g=(1,2,1), corrected
g_2 = C(n-3,2) + deg_T(s_v) - 2 (Stage-0: 999,736/999,736 labeled-tree
leaf pairs, orders 3–8). Hashes establish byte identity only — never
graphhood, coefficient correctness, or theorem truth.

## 7. Claim-ledger controls

The full controller-skill battery applies: canonical claim identity;
monotone refutation precedence; transitive rejected-mechanism import
(fences: `E993-BETA-TARGET` REFUTED, `E993-BETA-AGG-SUPPORT` REFUTED,
the residual-token cap `cap(y)=D-d_minus(y)` excluded, fixed-window
certificates refuted, universal LC/TRS2 refuted at order 26); capsule
coverage audits; the universal-claim counterexample gate; lint
(`lint_claim_status.py`) at every gate, exit 0 required. **This run
edits no predecessor bytes and no master-registry rows; corrections are
PROPOSED in `proposed/`** (the audit's warranted corrections included:
the `E993-PAIR-RANK2-EXACT` row, the r16 global `hKSCOPE` premise, the
(1,1)-cell open-hypotheses restoration). CLAIM-DISTINCTIONS moves stay
Ashton-gated.

## 8. Budget and stopping (per the brief + skill stop-gate discipline)

Bounded implementation/correspondence assignment, not a generic Hall
proof-search campaign. Stop the affected branch immediately on a
decisive scope mismatch or counterexample, preserving evidence and the
exact consequence. If a correspondence cannot be completed, return the
earliest precise unproved lemma. No census expansion, no unrelated
build repairs, no inventories of generic identities. Stop-tests may be
recorded any time, ARMED from the C2 close (six-cycle rule); the
serendipity clause applies. Two consecutive cycles producing only
equivalent reformulations, conditional wrappers, or unchanged finite
zeros trigger the stop-test evaluation at the next interlude. Decisive
events halt and report at any cycle.

## 9. Deliverables (terminal)

`SEMANTIC-CONTRACT.md` (complete definitions, source versions, domain,
exact intended theorems); executable exact evaluators with an
independent validation suite and a single reproducible entry point; at
least one fully inspectable actual row + the mandatory controls (edges,
coefficients, favorable-leaf list, signed summands, relation data, any
failing cut); a Lean correspondence package at the pinned toolchain
(Lean 4.32.2 / Mathlib 905b95818eb32af7874a58b427f50c1711a5e96c, shared
binding per skill §Pre-dispatch 6) with honest fidelity labels; the
rank-two filter finding; the handoff to the mathematics agent
(established graph-derived identities, weakest remaining compensation
inequality, structural obstructions); proposed claim corrections; final
status distinguishing construction proved / construction contradicted /
specific unresolved correspondence debt.

## 10. Ceiling honesty (verbatim, on every face)

TREE / FOREST / TRANSFER / COUNTEREXAMPLE open; candidate invariants
are mechanisms — mechanism kills are never target counterexamples;
computation is evidence, never proof; no bounded zero is evidence of
anything; nothing is ever formally_verified.

## AMENDMENT S1 (2026-09-14; AUTHORIZATION addendum)

§3 topology, effective C3: 18 routes → **36 cross-orientation critics
(2 per route, each from a different foreign orientation)** → 3
portfolio adjudicators → 1 neutral synthesis = 58 faces/cycle. C1–C2
ran 18/9/3/1 = 31 faces under the pre-correction reading (recorded).

## AMENDMENT S2 (2026-09-14; AUTHORIZATION Addendum 2)

§3 topology, effective C5 and C6: 9 routes (3T/3F/3U) → 18 critics →
3 adjudicators → 1 synthesis = 31 faces/cycle (the traditional form).
C4 runs to completion at S1's 18/36/3/1.
