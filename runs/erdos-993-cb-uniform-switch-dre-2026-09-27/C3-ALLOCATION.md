# Cycle 3 Allocation — r31 (a parameter-uniform switch-using Hall certificate on CB(8,m) at the top sector-deficient rank)

Controller: Claude Opus 5.5, 2026-09-28. Topology 9/18/3/1 (`AUTHORIZATION.md` §3). Routes chartered Claude Sonnet 5, **high** effort.
Binding with `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C3-STAGE1-GATE.md` (rulings 16–22 — read ruling 16, the
favorability index, BEFORE any computation) and `control/C3-WORKER-COMMON-BRIEF.md`. Source: the admitted Cycle 2 synthesis
`## Next-cycle portfolio`, reproduced verbatim below (object and "could close" per route), with the controller's route table.

**Where the target stands entering Cycle 3.** Tier 1 on the class is `proved_informal` (Darroch/Newton-free). Formally verified:
(L-S)_top at template level (C1-LA1); the CB(8,m) layer and the terminal's reduction to conjuncts 2 and 4 (C1-LA2); the block-descent
node (C1-LA3); (E) on the literal tree (C2-LA1); closed-form favorability for both leaf classes (C2-LA2); graph-level favorability
(C2-LA3, per the Cycle 2 close). **The one remaining formal obstruction to decisive event (a) is conjunct 4** (the saturating flow on
`cbGraph m` at `p*`). Cycle 3 is weighted to it: the literal sector flow and its bridges (U1, T3), the E1 flow over `cbGraph m` (U2, T1,
T2), terminal integration (U3), and adversaries of every formal statement and of the composed flow at rank (F1–F3).

## Routes (route ID — mechanism fingerprint token; each return must contain both verbatim)

| Seat | Route ID | Mechanism token | Orientation |
|---|---|---|---|
| T1 | `C3-T-01` | `E1-CLONE-QUOTIENT-IN-BALANCE` | T (prove) |
| T2 | `C3-T-02` | `E1-TYPE-PATH-RHO-BRIDGE-AND-ADAPTER` | T (prove) |
| T3 | `C3-T-03` | `SECTOR-LITERAL-ARC-ACCOUNTING-FORMAL-READY` | T (prove) |
| F1 | `C3-F-01` | `FORMAL-STATEMENT-FIDELITY-ADVERSARY` | F (falsify) |
| F2 | `C3-F-02` | `AT-RANK-COMPOSED-FLOW-ADVERSARY` | F (falsify) |
| F3 | `C3-F-03` | `E1-ARC-VALUE-ADAPTER-AND-LINK-ADVERSARY` | F (falsify) |
| U1 | `C3-U-01` | `FORMAL-CB-SECTOR-FLOW-LITERAL-BRIDGES` | U (formal / structural) |
| U2 | `C3-U-02` | `FORMAL-CB-E1-DELETION-FLOW-CONSTRUCTION` | U (formal / structural) |
| U3 | `C3-U-03` | `FORMAL-CB8-TERMINAL-INTEGRATION` | U (formal / structural) |

Every route that touches Lean carries byte-identically from the frozen governed runs (gate ruling 19) and names the exact declarations
it consumes; every route that computes follows gate ruling 18. Fresh rows: gate ruling 17.

## Route objects (the synthesis portfolio, verbatim)

**Orientation T (prove).**
1. **T1 — `E1-CLONE-QUOTIENT-IN-BALANCE`.** Object: T Group C nodes (a) the clone bijection `{B r-free, Q(B) = Q, x ∈ B, x active} ↔ P_q`
   at rank `|B| − q − 1` and (b) the two biregular double counts (`S_{α'+1}(α'+1) = T_{α'}(a−α')`, `S_{α'}·β = 2T_{α'}(b−β')`) and the
   in-balance `h_{α'} + g_{α'+1} = ρ_q·T_{α'}`, written at Lean granularity and compiled in scratch as stand-alone combinatorial
   theorems over the clone product. Could close: node (b), the smallest unproved formal lemma of the E1 flow, sorry-free.
2. **T2 — `E1-TYPE-PATH-RHO-BRIDGE-AND-ADAPTER`.** Object: Group C nodes (c) (ii-1)/(ii-2) as `Finset.sum` inequalities and (d)
   `ρ_q ≤ 1` for `1 ≤ q ≤ m` from carried C1-LA3 entry 20 plus entry 14; the `cb8R1` coefficient bridge (R-4); the zero-weight
   classification of non-sector sources; and the adapter lemma "`cb8E1Arc_spec_topRank` ⇒ U2's E1 hypothesis". Could close: every
   interface node compiled, so U2's hypothesis and T3's specification meet in Lean.
3. **T3 — `SECTOR-LITERAL-ARC-ACCOUNTING-FORMAL-READY`.** Object: U-B's DAG at Lean granularity over C1-LA2's labels: the definition of
   `g_sec` on literal pairs, target distinctness across `(i, j, kind)` for the Out bridge, the In bridge with every zero-flow class
   (non-sector `u = r` two-for-one arcs, the `u = s` and `(1, 0)` switches), the `8 − γ` preimage count, and Lemma DF written as that
   DAG's proof paragraph. Could close: U-B's informal DAG closed at statement granularity with the Out bridge proved in scratch.

**Orientation F (falsify).**
1. **F1 — `FORMAL-STATEMENT-FIDELITY-ADVERSARY`.** Object: every frozen or proposed statement (C2-LA1..3 results as closed; T/U Cycle 3
   statements; the adapter shape): the index of record at `p*`, the contract's `G`, the ℕ-subtractions `m − 1`, `8m − 1`, `8m − 7`,
   `(16m+4)/3 − j`, the presence of `107 ≤ m`, no hypothesis encoding its conclusion (favorability, `ΣIn < 1`), and link targets that are
   literally `C5LA1.indepSetCount` / `vertexDeletionIndepSetCount` of `cbGraph m`. Could close: a signed fidelity audit of every
   Cycle 3 award statement before Stage 7 freezes it.
2. **F2 — `AT-RANK-COMPOSED-FLOW-ADVERSARY`.** Object: the actual composed rational flow (X-8's arc values plus C1-LA1's allocation after
   scaling) at the fresh rows on the literal network at rank `p*`; exact inflows on every target class (in-sector, one-choke switch
   images, one-choke non-images, `q ≥ 2`, weight 0) against literal active-tag capacities; the non-strict in-sector tightness; row sums
   per source; Hall sums over structured `X`. Could close: an end-to-end bounded confirmation of the composition (not the template),
   or an exact failure or cut.
3. **F3 — `E1-ARC-VALUE-ADAPTER-AND-LINK-ADVERSARY`.** Object: X-8's arc values at the edge cases (`α = 0`, `β = 0`, `q = m`, `w = 1`) on
   small literal `CB(8, m′)` and the clone quotient at the fresh rows; the `cb8R1` bridge and the zero-weight classification; node (N1)
   of C2-LA3 by brute force (`vertexDeletionIndepSetCount` of `CB(8,m) − c_ij` against the closed form at every `k` for small `m`, and
   literally at one class row) if C2-LA3 did not close. Could close: registration readiness of X-8 and a vetted adapter statement.

**Orientation U (formal / structural).**
1. **U1 — `FORMAL-CB-SECTOR-FLOW-LITERAL-BRIDGES`** (U-B). Object: `g_sec`, the Out arc-sum bridge (first), the In bridge, the `8 − γ`
   count, the doubly-fed capacity sum with C1-LA1's Switch and Residual, the rational-to-integral step (U2 Part A), and conjunct 4 from
   two named hypotheses (the E1 flow in the adapter shape; favorability or `favorableLeaves = leafSet`). Could close: "conjunct 4 ⇐ E1 ∧
   favorability" sorry-free, hence the §2 terminal conditional on the E1 flow alone once C2-LA1..3 close.
2. **U2 — `FORMAL-CB-E1-DELETION-FLOW-CONSTRUCTION`** (Group C). Object: the E1 flow as a literal `ℚ` function on `cbGraph m` with
   T3's clauses (named `f`, `0 ≤ f`, support, rows, columns, zeros), consuming T1/T2 nodes as named hypotheses where not yet compiled.
   Could close: `cb8E1Arc_spec_topRank` modulo named nodes, or outright.
3. **U3 — `FORMAL-CB8-TERMINAL-INTEGRATION`.** Object, conditional on Stage 7: if C2-LA3 did not close, the `I(cbGraph m − c_ij)` closed
   form and graph-level favorability (U-C; could close `favorableLeaves (cbGraph m) p* = leafSet`); if it did, the merged project
   carrying C1-LA1..3 and C2-LA1..3 byte-identically, the terminal `cb8_topRank_eligible_and_weightedHall` stated with conjunct 4 reduced
   to the E1 hypothesis alone, and the zero-weight classification lemma. Could close: the terminal conditional on exactly one named
   hypothesis.
