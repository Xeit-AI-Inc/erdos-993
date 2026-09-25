# Cycle 1 Close — r29 (certify the uniform high-tail mechanism and its non-residual top-rank consequence)

Controller: Claude Fable 5.1, 2026-09-25. Run id `erdos-993-math-dre-20260925-r29-high-tail-certification`; charter:
Codex's prompt (`control/R29-CHARTER-PROMPT.md`), authorized by Ashton ("do 6 cycles max with our DRE + Lean flow";
"continue without needing any permission"). Seating 4/8/3/1; routes Sonnet 5 xhigh; critics Opus 5.5 medium;
adjudicators, synthesis, Stage 7 seats and second readers Opus 5.5 high (every Opus seat's runtime reported
`claude-opus-5-5[1m]`; routes `claude-sonnet-5`).

## Seals

Stage 2 `58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e` (169 members); Stage 3 dispatch `af840132…`,
packet `40561239…`; Stage 4 dispatch `62f95191…`, packet `f5a61035…`; Stage 5 `ac2875c9…`; Stage 6 dispatch `b090798b…`,
packet `8338f465…`; award capsules LA1 `52257003…`, LA2 `3967f4ca…`, LA3 `1a6739e6…`, LA4 `d1cd2b85…`; second-read capsules
SR-MECH `f5030554…`, SR-TRN `8c9b7f48…`, SR-BOUNDARY `9d9a8f20…`; Stage 7 packet `d7fafedc…` (416 members); second-reads packet `001ecb05…` (17 members).

## Result

**RUN COMPLETE — stop-gate (a) met in Cycle 1.** All four targets `formally_verified` under their own governed awards: C1-LA1 (TSB; VR `b21597ab…`), C1-LA2 (HTP with the (HTA) companion; VR `47910b50…`), C1-LA3 (ELIG; VR `2f5cee60…`), C1-LA4 (TRN; VR `f7504a69…`); every kernel receipt at exactly `[propext, Classical.choice, Quot.sound]`; every informal audit `passed`; every fidelity review `match`; zero repair rounds. Nine second-read items confirmed (five with wording repairs, adopted), zero rejected. The three auxiliary registry keys move OPEN → VERIFIED `formally_verified` by their own certificates; two new keys registered (TRN `formally_verified`; HTA `proved_informal` — ruling R29-N-12); one Tier 2 record; scope notes on six prior keys; statuses of every other object unchanged.

## What the cycle established (grades of record)

- **(TSB) `E993-BIPARTITE-TAGGED-SHADOW-BOUND` — formally_verified (C1-LA1).** `k·q_{k+1} ≤ 2(α − k)·q_k` in ℤ on every
  finite bipartite graph, any tag set, `1 ≤ k ≤ α`. Scope notes: holds for every `k ≥ 0` (SR-3); tight at every `k`
  (`mK_2` with one tag; SR-4); bipartiteness load-bearing (`K_1 ⊔ K_5`; SR-9); `hk` statement scope.
- **(HTP) `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` — formally_verified (C1-LA2).** Every original leaf term `≤ 0` at
  every `p ≥ 1` with `3p ≥ 2α + 1`; the `p = 1` endpoint NEW and bipartite-free (the guard forces `N(s) = {v}`; SR-1);
  `α(G − {v, s}) = α(G) − 1` (SR-2); bipartiteness load-bearing exactly for `3 ≤ p ≤ α − 1` (SR-9, repaired).
- **(HTA) `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` — VERIFIED at proved_informal** (kernel-checked companion inside
  C1-LA2; not separately receipt-bound — controller ruling R29-N-12): `S(G, p) ≤ 0` on every bipartite graph in the
  region; closes the high-tail region of the OPEN all-rank key; the open remainder is exactly `x + 2 ≤ p ≤ ⌊2α/3⌋`.
- **(ELIG) `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` — formally_verified (C1-LA3).** Codex's guard proof under its own
  certificate; acyclicity in all three `Δ₂` branches, connectivity through the edge count.
- **(TRN) `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` — formally_verified (C1-LA4).** `x + 2 ≤ α − 1 ⇒ S(T, α − 1) ≤ 0` with no
  residual hypothesis; eligibility forces `α ≥ 4` on any graph (SR-5) and `α ≥ 5` on trees and bipartite graphs (SR-6);
  the conclusion holds on every bipartite graph (SR-7; `proved_informal`, graded separately; no strict form); r26's
  residual award is not widened.
- **Boundary record `E993-R29-HIGH-TAIL-BOUNDARY-RECORD` — proved_informal / bounded_computation (SR-8a/b/c, SR-9).**
  The guard is exactly sharp on trees at every `α ≥ 2` (two families of order `2α`; largest positive rank `⌊2α/3⌋`);
  minima `P_6`, `S(1,2,2)`, `P_3`, `P_3 ⊔ K_2`; hypothesis-necessity witnesses `K_1 ⊔ K_5`, `P_3 ⊔ 2K_3`.

## Errata and incidents (records; sealed text unchanged)

R29-E-a (987 not 976 classes to order 12); R29-E-b (no `E993-R24-` registry key; the r24 C4-LA1 award has no claim
identity); R29-E-c (star fixed point valid for `p ≥ 2` only); R29-E-d (bipartiteness sufficient, not needed, at
`p = 1`); R29-E-e (entries 15–17 token-, not byte-identical to r25). R29-I-1 (a Stage 2 member edited by the
controller; restored byte-exact within minutes); R29-I-2 (the living `CONTROLLER-NOTES.json` listed as a second-read
capsule member; drift declared expected; readers verified digests at their start).

## Successor inheritance (REQUIRES NEW AUTHORIZATION)

- (HTA)'s standalone governed award (same carry as C1-LA2; body ready) — a certificate exercise.
- Registering the r24 C4-LA1 fact (every leaf favorable at `p = α − 1` for `α ≥ 2`) under a claim identity.
- The lower region `x + 2 ≤ p ≤ ⌊2α/3⌋`: Codex/Astra's compensation experiment (fenced from r29).
- Tooling: a companion-statement field in the theorem contract; a run-id option on `init`; the capsule builder refusing
  living files; the registrar's stdout discipline (seats redirected to `/tmp` once each).
