# Cycle 1 close — r28 (the Hall/SDR route to the forest degree lemma), 2026-09-25

Controller: Claude Fable 5.1. Run id `erdos-993-math-dre-20260924-r28-degree-lemma-hall-sdr`. Topology 6 routes /
12 cross-orientation critics / 3 isolated adjudicators / 1 synthesis / governed Stage 7 / three isolated second reads
(concurrent with Stages 5–7). Models as chartered: Sonnet 5 xhigh routes; Opus 5 medium critics; Opus 5 high
adjudicators, synthesis, formalizers, reviewers and second readers.

## Stage record

| Stage | Seal | Outcome |
|---|---|---|
| 2 (packet) | `2eff91efcc2889ffcbbdc7e046adeb69e9a74e162d68a454afe94068e7af710b` | 83 members; lint 0/0; residue check run before the seal |
| 3 (routes) | dispatch `aadefb72…`; packet `56fa3b76…` | 6/6 admitted (F1, U2 interrupted by a host restart, resumed by SendMessage, disclosed) |
| 4 (critics) | dispatch `7ead4543…`; packet `4f654595…` | 12/12 retained_narrowed; (HS) REFUTED by C-F1-T and C-F1-U independently |
| 5 (adjudicators) | `aeb6d030…` | T refuted / F refuted / U refuted; material progress yes on every orientation |
| 6 (synthesis) | dispatch `3f8bbec3…`; packet `3f4edb7a…` | flags no/yes/no/no; §5(b) MET; run ENDS at the Cycle 1 close |
| second reads | SR-HS-REF `c6e02913…`, SR-PP `26d6eeac…`, SR-BTP `d205f715…` | 12/12 items confirmed (2 confirmed, 10 confirmed_with_repairs, 0 rejected) |
| 7 (awards) | capsules LA2 `803d725a…`, LA3 `cd079387…`, LA4 `d09c1c24…`, LA5 `0b676979…` | 4/4 funded groups `formally_verified` in one pass each (LA2, LA3, LA4, LA5); LA1 no award attempted (false) |

## Mathematical state at the close

**Refuted (the headline).** The leaf/slot dominance condition (HS) — for every finite tree, every `k`, every `t ≥ 1`,
`Σ_{v∈Br : c_v(k) ≥ t}(deg v − 2) ≤ #{ℓ ∈ L : c_ℓ(k) ≥ t}`; equivalently (Hall) an injection from branch slots to
leaves with `c_ℓ ≥ c_v` — is FALSE. Witness `T22 = R(3,2)_3`: a root joined to three hubs, each carrying two pendant
paths of three edges (branch tree `K_{1,3}`). At `k = 12`: `i_12 = 19`, `c_root = 18`, `c_hub = 0`, every leaf `17`;
at `t = 18` one slot, no leaf; also fails at `k = 11` (`t = 137..141`); (DL) holds on it at every `k`. Found
independently by two critics; reproduced by all three adjudicators and the controller; confirmed by the isolated
second read SR-HS-REF (2²² brute force, rerooting DP, deletion recursion), which also proved the infinite family
`U(d,m,r)` (shortfall `d − 2 → ∞`), found no failure at order ≤ 21 (two instruments) and exactly one at order 22
(all 5,623,756 trees; one instrument). Every sufficient condition the cycle proposed falls to `T22`, where `c_root` is
the strict maximum over all vertices. The SDR route to a second proof of (DL) on all forests is CLOSED as stated.

**Surviving, second-read-cleared.** The pendant-path leaf dominance lemma (six independent critic derivations, one
proof; any finite graph); Theorem BTP — (HS) on every tree whose branch tree has maximum degree ≤ 2, by the own-leaves
assignment, needing neither Hall nor the slot count, SHARP for every branch-degree bound `D ≥ 3`; the per-vertex
surplus identity `|own(v)| − (deg v − 2) = 2 − b(v)`; the SDR ⟺ threshold equivalence (all `t` on general graphs, `t ≥ 1`
on trees); the layer-cake reduction (HS at `t ≥ 1`) ⇒ (DL), graph-general; five refuted local mechanisms with
order-minimal witnesses; the (PW) witness corrected (order 9, `k = 5`, not the leaf-vs-leaf order-5 example); F2's
bipartite characterization struck (`T22` is bipartite with `|E| = n − 1`).

**Formal (Stage 7, four awards, kernel-checked at the three axioms, two independent reviews each).** The layer-cake
reduction `(HS at t ≥ 1) ⇒ (DL)` with the r27 leaf/branch reformulation formalized in full (C1-LA2, 33 declarations);
the corrected forest composition — the tree degree lemma at every `a ≤ k` ⇒ (DL) on the forest — and the SDR/threshold
equivalence (C1-LA3, 51); the pendant-path leaf dominance lemma, graph-general (C1-LA4, 12); Theorem BTP and its
composition into a SECOND FORMAL PROOF of the degree lemma on the class of trees whose branch tree has maximum degree
≤ 2 (C1-LA5, 31) — a scope note on the r27 (DL) award, which remains the proof of record on all forests. Every Stage 7
seat's runtime reported `claude-opus-5-5[1m]`.

## Registry and ledger

Run-local registry 392 → 402 identities (242 V / 92 R / 26 C / 42 O): 10 `E993-R28-*` keys — 2 REFUTED (the Tier 1
target (HS) with its refutation record; five local mechanisms as one record), 5 on formal awards (the reduction, the
forest composition, the SDR/threshold equivalence, the pendant-path lemma, Theorem BTP), 1 `proved_informal` (the
surplus identity), 1 `bounded_computation` (the census); scope notes on `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`,
`E993-R27-FOREST-DEGREE-LEMMA`, `E993-R27-POTENTIAL-SEPARATED-UNION-CONVOLUTION`, `E993-R27-DEGREE-LEMMA-K1-ACYCLICITY-CRITERION`
and `E993-PAIR-R-LE-G-POINTWISE` (statuses unchanged). Lint 0 findings. Ledger `OBLIGATIONS.csv` 312 rows (11 `R28-*`).
Nothing registered for `E993-R25-UNR-FOREST-WIDE`, `E993-G1WIDE-NO-SIZE-CAP`, NR1, FOREST, TREE, TRANSFER, the aggregates
or Erdős #993 (fence §3.1).

## Process record

- Seats 6 + 12 + 3 + 1 + formalizers and reviewer seats (4 formalizers + 10 reviewer seats) + 3 second readers. Second reads ran
  concurrently with Stage 5 (SR-HS-REF) and Stage 5–7 (SR-PP, SR-BTP); all twelve items confirmed before the
  synthesis, so the synthesis registered nothing blind.
- A host restart interrupted F1 and U2 at Stage 3; both resumed by SendMessage (never re-spawned), all numbers
  post-restart, disclosed.
- Controller facts conveyed mid-run only as replays, never evidence; the adjudicators were pointed at the
  counterexample by the facts record and reproduced it on their own instruments.
- Errata R28-E-a…f (`control/CONTROLLER-NOTES.json`); incident R28-I-1 (a stray `lake env lean` outside the pinned
  project let `elan` install Lean v4.34.1 — network; no build depends on it; left for Ashton's decision); residue
  check run before the Stage 2 seal (one true residue caught); one template residue caught by critics (R28-E-d).
- Disclosures: T2 `ps -u` listing; F1 two `ps aux`; SR-HS-REF `pgrep -f` listing; several critics printed the whole
  attack-brief file; harness-injected CLAUDE.md/memory disclosed by several seats; one adjudicator's copy of a
  return placed in the session scratchpad and deleted.

## Successor inheritance (open decisions for Ashton)

1. The weakest matching-type strengthening of (DL) that holds on ALL finite trees, if any: every candidate fails on
   `T22`, where the root's occupancy is the strict maximum; the F adjudicator's prefix-dominance forms `P_1`/`P_2`
   survive on narrow evidence (`P_2` at full length is the leaf/branch form of (DL) itself) — a conjecture-grade seed.
2. Second reads OWED before registration: the `r ≥ 2` part of `U(d,m,r)`; (HS) at every `k ≤ 2`; the unicyclic
   counterexample `T22 + {0,3}` and a unicyclic census (minimum between 15 and 22); the deletion recurrence note; the
   (PW) order-9 minimality; `P_1`/`P_2`; the `E993-EXCHANGE-LEMMA-SEQ` cross-reference.
3. A formal (kernel) refutation of (HS) at `T22` by a structural proof (admissible in principle — a single-instance
   check is not a universal step — but infeasible by naive `decide`); not funded here.
4. Stage 7 left nothing open: all four funded groups closed. The only formal object not attempted is the kernel
   refutation of (HS) at `T22` (item 3).
5. The p = α − 2 interior-rank experiment continues on Codex; r28 touched nothing of it.
