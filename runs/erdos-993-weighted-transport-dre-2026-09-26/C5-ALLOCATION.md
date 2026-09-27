# Cycle 5 Route Allocation — r30 (correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate)

Controller: Claude Fable 5.1, 2026-09-27. Topology unchanged: 6 routes / 12 critics / 3 adjudicators / 1 synthesis; routes Claude
Sonnet 5 xhigh, critics Claude Opus 5.5 medium, adjudicators/synthesis/Stage 7/second reads Claude Opus 5.5 high. The portfolio is
the admitted Cycle 4 synthesis's `## Next-cycle portfolio` (`cycles/cycle-4/stage6/SYNTHESIS.md`), narrowed here into binding route
text. Cycle 5 runs because BOTH letters of the pre-armed plateau test (C4 gate ruling 30) were confirmed by isolated second reads at
the Cycle 4 close: (a) (HALL) on the infinite eligible family `{(G_k, p) : k ≥ 3, p ≥ k + 3 eligible}` with deletion arcs alone
(`proved_informal`; SR-C4-1) and (b) full (HALL) with switch arcs load-bearing at the five sector-deficient CB first ranks
`CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, `CB(8,108)/577`, `CB(7,144)/673` (`computer_assisted`; SR-C4-3, SR-C4-4). The object
is unchanged: (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN at full scope. **Smallest unproved lemma** (SR-C4-3's repair
of the synthesis's item (iv)): the REDUCED-capacity sector flow at `G(8^82, 7^2)/448` — a choke-local flow saturating every sector
source with every switch image capped at `(1 − ρ_{Q(A)})·w_F(A)` — which composes with E1-R (criterion verified at all 56 eligible
ranks of that tree) to whole-row (HALL) at the only known switch-necessary eligible row without a certificate. Uniformly, the
smallest missing pair is (L-i) and (L-S) on an infinite CB class (T1 below). This is the FIFTH of six cycles.

| Seat | Route | Object |
|---|---|---|
| `T1` | `C5-T-01 CB-CLASS-UNIFORM-SWITCH-HALL` | A parameter-uniform (HALL) with switch arcs load-bearing on an infinite switch-necessary CB class (`CB(d,m)`, `d ≥ 6`, or `CB(8,m)` for `m ≥ m_0`) |
| `T2` | `C5-T-02 HETEROGENEOUS-SWITCH-NECESSARY-ROW-CLOSURE` | Whole-row (HALL) at `G(8^82, 7^2)/448` (reduced-capacity heterogeneous sector certificate + E1-R), then the other 55 eligible ranks of that tree |
| `F1` | `C5-F-01 CB-SMALL-SWITCH-CAPACITY-SECTOR-CUT-SEARCH` | The eligible row minimising switch capacity relative to the sector deletion deficit across the CB pattern; sector Hall decided there for every `Aut`-invariant `X ⊆ sec` with LITERAL neighbourhoods; any deficit to two instruments |
| `F2` | `C5-F-02 PER-TAG-INJECTION-FRONTIER` | Where the per-tag symmetric-chain method of CT-1 reaches on named families (`G_k` variants; `T(m,2)`); the smallest eligible row where every per-leaf summand is `≤ 0` but some tag's deletion injection fails |
| `U1` | `C5-U-01 LEAN-CLAW-NM-AND-GK-TREE-LAYER` | CD-1 in Lean; the `G_k` tree layer (`IsTree`, `indepNum = 2k+3`, `crossingIndex = k+1`) on C4-LA1's `gkGraph`; completing C4-LA1's DAG first if it did not close |
| `U2` | `C5-U-02 CB-PATTERN-THRESHOLD-REDUCTION` | The per-choke threshold form of a maximum-deficit `Aut`-invariant family on the CB pattern (supermodularity + run-additivity + per-choke suffix extremality), reducing (HALL) on the class to finitely many closed-form inequalities per rank |

## Standing state entering Cycle 5 (from the Cycle 4 close; `cycles/cycle-4/CYCLE-CLOSE.md` — read it for the grades of record)

- Formally verified this run (governed awards; run-local registry): (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (C1-LA1);
  `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (C1-LA2); `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`
  (C2-LA1; existential); `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR` (C3-LA1; an equivalence of Hall
  conditions at `Γ = Aut(G)`, `F = F_p`). The status of C4-LA1 (the `G_k` deletion-only flow theorem) is stated in the Cycle 4 close:
  if it closed, the key `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET` is
  `formally_verified` and its `gkGraph` is the definition of record for `G_k`; otherwise that key is `proved_informal` (SR-C4-1) and
  completing the Lean DAG is U1's first obligation. Definitions of record: C1-LA1's `Main.lean` (`86b59c6c…`), C1-LA2's (`7c279f4b…`),
  C2-LA1's (`a9cf3b81…`), C3-LA1's (`22e3f81c…`), all receipt-bound, carried byte-identically by every award, keyed by (origin award,
  entry, digest).
- `proved_informal`, registered: (INV); (NM); the second-eigenvalue theorem; the `CBstar` sector deficit (exact formula at every
  `p ≥ 2`); the `G_k` eligibility key; the equitable-partition lift; GK-SIGN; E1 `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`
  (SUFFICIENT criterion; by CD-2 it is exactly condition (i) in cleared form `r_q(p−q) ≤ r_q(p−q−1)` — SR-C4-6); E4+G1
  `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM`; and from Cycle 4 —
  `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` (CD-1: for `q_i ≥ 1` a normalized flow on the covers `L_k → L_{k−1}` of the
  claw product `Π K(q_i)`, so `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)`; two critic proofs = one construction, SR-C4-5),
  `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (E1-R: heterogeneous chokes; product poset
  per choke set `Q`; load `ρ_{Q(A)}·w_F(A)` on `r`-free targets; SR-C4-6),
  `E993-R30-ACTIVE-WEIGHT-DELETION-HALL-HOLDS-WHEN-EVERY-TARGET-HAS-AT-MOST-P-MINUS-1-SOURCES-ABOVE` (R3: `(p−1)·Σ_X w_F ≤ d·Σ_{N_D(X)} w_F`
  when every target has ≤ `d` members of `X` above it; sharp; SR-C4-8), and the `G_k` flow key at its Cycle 4 close grade. C1 (the exact
  heterogeneous sector deletion deficit `max(0, e_{p−1}(q) − e_{p−2}(q))`, `q_i = t_i + 1`, `p ≥ 2`) is a `proved_informal` RECORD.
- `computer_assisted`, restricted scope: `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` — full (HALL)
  at the five sector-deficient CB first ranks (C-T1-U's choke-local sector certificate with `θ* = 96/495419, 96/530501, 96/566783,
  16/65097, 16/138633` composed with the registered E1 flow; SR-C4-3/4); with the registered D2/D3 parts of
  `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`, (HALL) at EVERY eligible rank of those five trees
  (177 + 168 ranks). The five CB rows are therefore CLOSED as rows; the open switch-necessary eligible row on record is
  `G(8^82, 7^2)/448` alone.
- Bounded facts of record (`R30-CB-RECORD` and run records): the six switch-necessary rows (ratios `460/459 … 337/336`, `448/447`); on
  `G_k` full (HALL) for every `X` at `p = k+3` for `k ≤ 60` (deletion) / `k ≤ 30` (mixed) — superseded in kind by the `G_k` flow key;
  the tight family on `G_k` is `C(L′, p+1)` (`L′` the unique maximum independent set) with Hall margin `W(p)/W(p+1) ≈ 1 + 2/k`;
  `x(G_k) = k+1` for `k = 2..400` (bounded; `α(G_k) = 2k+3` PROVED for every `k` by SR-C4-8); the E1 criterion holds at all 56 eligible
  ranks of `G(8^82, 7^2)` (max `ρ` 0.995530 at 448) and fails at eligible rows with `d ≤ 5` (first `CB(1,7)/10`; 90 of 364 for
  `d ≤ 8`, `m ≤ 15`); obstruction R8 at `G/448` (some sector targets have all 448 preimages switch-dead — no uniform one-hop share
  rule certifies sector Hall there); the Cycle 3 conjecture "on trees `S ≤ 0` ⇒ saturation" is REFUTED at the non-eligible `CB(7,1)/6`
  (`S = −21`, max-flow 903 of 924); `CB(d,1)`: the three-term sector identity (extension of B9; switch factor `1_c`), the corrected
  suffix-extremality theorem (record; no eligible rank for `d ≤ 300`), `m = 2` sector deficiencies at non-eligible rows with `S > 0`.
- Struck in Cycle 4 (never cite as evidence): T1's uniform-deletion lemma (true only at `3p = 2M+4`, then restates (NM)) and its
  stuck/bad/cornered hierarchy as Hall evidence; T2's chain-product theorems as a discharge of C1 and its "E1 at every eligible rank";
  F1's relaxed-class-model "saturation" (certifies nothing) and its "exact arcs" claim; F2's "no local rule can work" and "not close
  to tight"; U1's "(N1) in full" and "18 declarations"; U2's unclamped `j`-threshold statement and any "DEFICIENT-CUT" name; the
  labels CD-1, CD-2, L2, C1 as aliases of anything (they are working labels; CD-1 is already an alias of the E4 key).
- Errata R30-E-a … R30-E-i (see the cycle closes; R30-E-h: clone residue in the Cycle 4 protocols — resolved by every seat; R30-E-i:
  registry alias-field defects repaired at the Cycle 4 close). Registry text rules: name r30 awards by KEY, never "C1-LA1"/"C1-LA2"
  (aliases of r25 keys); never write the phrase "favorable-leaf aggregate" or the token "4k" in registry text (alias patterns of
  other keys). Stop gate ARMED (since the Cycle 1 close); the six-cycle ceiling stands — Cycle 6, if any, is the last.

## Mechanism fingerprints and load-bearing obligations

1. **T1 `CB-CLASS-UNIFORM-SWITCH-HALL`.** Object: a parameter-uniform (HALL) with switch arcs load-bearing on an infinite
   switch-necessary CB class (`CB(d,m)` with `d ≥ 6`, or `CB(8,m)` for every `m ≥ m_0`). Four steps: (L-i) a PROVED mode bound placing
   `p − q` at or above the mode of `(1+y)^{qd−1}(1+2y)^{d(m−q)+1}` for every `q ∈ [1, m]` at every eligible `p` of the class (E1's
   criterion is exactly this condition (i), SR-C4-6); (L-S) a CLOSED-FORM choke-local sector certificate `φ_b, φ_c, σ` as functions of
   `(d, M, K)` with the affine separation of the five Cycle 4 certificates and `θ ≤ 1 − ρ_1` at every sector-deficient eligible rank
   (`3p ≤ 2dm + 4`), the five certificates as DATA to fit and then prove; the biregular (NM) bound at the other ranks; composition via
   E1 (or E1-R) and B7. Validate every closed form against the five registered certificate values and literal max-flow on small
   laboratories BEFORE any uniform claim. Could close: the first parameter-uniform restricted (HALL) with switch arcs load-bearing,
   `proved_informal`, as a SEPARATE key and a Cycle 6 Lean target (ruling-30-style letter (a) with switch arcs).
2. **T2 `HETEROGENEOUS-SWITCH-NECESSARY-ROW-CLOSURE`.** Object: (a) a heterogeneous, NON-uniform choke-local sector certificate at
   `G(8^82, 7^2)/448` respecting obstruction R8 (two-hop where a target's preimages are all switch-dead), with residuals
   `1 − ρ_{(1,7)} ≈ 4.47×10⁻³` at the degree-7 chokes and `1 − ρ_{(1,8)}` at the degree-8 chokes — the REDUCED-capacity form (switch images
   capped at `(1 − ρ_{Q(A)})·w`); (b) its composition with E1-R (criterion verified at all 56 ranks; SR-C4-6) by B7 → whole-row (HALL)
   at 448; (c) the remaining 55 eligible ranks of that tree (D3-style deletion-only where the criterion suffices; the sector part
   where it does not); (d) every certificate to two instruments (an exact LP/DP and a literal laboratory validation). Could close:
   (HALL) at every known switch-necessary eligible row, `computer_assisted`, incl. the first non-CB tree — the retirement of the
   instance frontier.
3. **F1 `CB-SMALL-SWITCH-CAPACITY-SECTOR-CUT-SEARCH`.** Object: (a) across the homogeneous and heterogeneous CB pattern, a closed-form
   enumeration of the sector-deletion-deficient ELIGIBLE ranks with the literal weight of the switch image and its overlap at each;
   (b) the row minimising switch capacity relative to the sector deletion deficit — the eligible analogue of the `CB(7,1)/6` mechanism
   (where `S ≤ 0` and the sector's switch rescue was too small); (c) at that row, sector Hall decided for every `Aut`-invariant
   `X ⊆ sec` by LITERAL-`N(X)` generating-function counting (a relaxation never excludes a cut — Cycle 4's F1 lesson); (d) any deficit to
   two instruments; the route flag stays `headline_resolved: no` until the second read. Could close: a (CUT) candidate (decisive event
   (b) after its second read), or a proved lower bound on the switch/deficit ratio over the CB pattern handed to T1's (L-S).
4. **F2 `PER-TAG-INJECTION-FRONTIER`.** Object: (a) map where CT-1's per-tag symmetric-chain method reaches on named families — `G_k`
   variants with 1 or 3 cherry leaves, mixed arm lengths, and `T(m, 2)` (absorbing Cycle 4 F2's untouched obligation (c)); the (HALL)
   mechanism is studied on these families, their closed aggregate theorems are NOT re-proved; (b) the smallest eligible `(T, p)` at
   which every per-leaf summand is `≤ 0` but some tag's deletion injection fails, by an exhaustive census over a STATED order range
   (trees of every order in the range — Cycle 4 F2 silently skipped orders ≥ 18); literal (HALL) there with two instruments. Could
   close: a second infinite eligible family with (HALL) at `proved_informal`; or the sharp frontier where coupled multi-tag routing
   without switches is needed — where any cut not caused by switch necessity must live.
5. **U1 `LEAN-CLAW-NM-AND-GK-TREE-LAYER`.** Seed from C1-LA1, C1-LA2, C2-LA1, C3-LA1 and (if closed) C4-LA1 byte-identically. (a) If
   C4-LA1 did NOT close, completing its DAG (the frozen statement of `control/C4-STAGE7-FORMALIZER-BRIEF-LA1.md` §2; the blocked node
   named in its report) is the FIRST obligation. (b) CD-1 in Lean at the T adjudicator's draft statement (`clawProduct_normalizedMatching`
   with the claw-layer and shadow definition layer), by the product-step induction, with SR-C4-5's guards (`N_{k−2} = 0` at `k = 1`; no
   truncated ℕ subtraction — use `2ℓ > R` forms). (c) The `G_k` tree layer on `gkGraph`: `IsTree`, `indepNum = 2k+3` (SR-C4-8's proof),
   `crossingIndex = k+1` (informal proof first — U1 supplies it; bounded `k ≤ 400`), lifting the flow theorem to a Lean (HALL)-shaped
   statement at every eligible rank of `G_k`. `#print axioms` on everything; exact dependency diagram; draft contracts. Could close:
   CD-1 and the `G_k` (HALL) corollary contract-ready for the Cycle 5 Stage 7.
6. **U2 `CB-PATTERN-THRESHOLD-REDUCTION`.** Object: lift the corrected suffix-extremality theorem (SR-C4-9; `CB(d,1)`) to `CB(d,m)` and
   the heterogeneous pattern under the FULL automorphism group with the V and S/O sources included: supermodularity (C2-LA1),
   run-additivity along each choke's class chain, per-choke suffix extremality PROVED (C-U2-F's `m = 2` deficiencies show it is not
   automatic). Goal: a maximum-deficit `Aut`-invariant family has per-choke threshold form, so (HALL) on the class reduces to finitely
   many closed-form inequalities per rank; evaluate them exactly at the five first ranks and at `G/448`. Could close: an (INV)/(SW)
   outcome-B reduction at `proved_informal` on the CB pattern (an independent second proof of the five-row key and T2's certificate,
   feeding T1's uniform proof), or an explicit deficient invariant family handed to F1.

## Shared rules (binding on every route; Cycles 1–4 lessons included)

- `w_F` literal (active tags: `B ∩ W_v ≠ ∅`, `W_v = N(s_v) ∖ {v}`); (D) ∪ (S) literal; `F_p` DERIVED at rank `p` on every row (never
  hard-coded "all leaves" — routes were struck for it in Cycles 3 AND 4); `x` through rank `α`; `supply − capacity = S` asserted on every
  instance from INDEPENDENTLY computed sides (a balancing check is struck — ruling 17/24); every eligible row reported with full row
  data; the gate-31 lines (`central obligation attempted: yes|no`; two instruments named for `S`); replay with `python3 -B`; nothing
  written under `sources/`; "validated on N cases" is written only when the shipped code runs those cases; a census states its order
  range and covers EVERY tree in it.
- The Cycle 1–4 sealed records are sources at their recorded grades; nothing in them is re-proved as a contribution; every Cycle 5
  claim is graded on its own evidence; STATED items are cited as STATED; classical theorems not under `sources/` are undischarged
  dependencies named on the face; a RELAXED model (class credited whole) certifies nothing about the literal network and excludes no
  cut.
- Fences §3.1–3.7 of `SOLUTION-CONTRACT.md`: mechanism ≠ aggregate; finite ≠ universal; no refuted mechanism revived; no closed region
  re-proved; no census value in a proof; no RTree wording; sealed roots untouched. A sector, family or finite-instance statement is
  not (HALL); a deletion-only deficit is not a (CUT); a non-eligible rank is a laboratory, not evidence.
- `headline_resolved: no` unless a route exhibits a (CUT) candidate (then say so in prose; the flag stays `no` until two instruments
  and a second read agree); one typed route verdict; a key name proposed by a route must be a predicate of the statement without its
  hypotheses (ruling 33) and must not reuse a working label (CD-1, CD-2, L2, C1, E1-R, R3, CT-1) as a key or alias.
