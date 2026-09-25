# Critique

Critic `C-F1-T` (orientation T, prove), r29 Cycle 1 Stage 4. Assigned return: seat `F1`, route `C1-F-01
HIGH-TAIL-FALSIFICATION-AND-BOUNDARY`, orientation F (falsify).

Boot: I am operating within VerityOS. I read `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` in full and no other VerityOS file. Disclosure: the harness
injected the repository `CLAUDE.md` and the user auto-memory index into my context unprompted. I did not open them and
nothing below depends on them.

Model disclosure: see the single disclosure line under `## Verdict`.

Read boundary (disclosures):
1. The dispatch grants F1's artifacts "under `scratchpad/c1-F1/`". That directory is empty. The return lists every
   artifact under `scratchpad/c1-F1-replay/`, which is the replay path the allocation's shared rules name. I ran one
   non-recursive `ls` of each directory, copied the artifacts out of `c1-F1-replay/` into my own scratch, and worked only
   from those copies. I read no other directory under `scratchpad/`.
2. The harness saved the return's text (34,844 bytes) to its own tool-results file, and I read it from there. The
   content is the capsule member `cycles/cycle-1/stage3/returns/F1/RETURN.md`.
3. `gen_reconcile.py` reads `control/controller-prerun/ht_report.json`. That file is not in my capsule, so I did not
   replay the script (see Certification audit).
4. I ran no `find`, no recursive `grep`/`rg`/`ls -R`, and no glob `cat` above my grant. I used no network and installed
   no packages. I did no Lean work, because this is not a Lean seat.

## Identity and seal audit

Every seal below was recomputed as SHA-256 over compact key-sorted JSON (separators `(",", ":")`, `seal_sha256` removed,
no trailing newline):

| Object | Recomputed | Stated | Match |
|---|---|---|---|
| Capsule `control/c1-critic-capsules/F1-PACKET-MANIFEST.json` | `0b798ce91295d49ca8cae16fad8120bf5f8bf8dfdb4e3f3a91a08ad9a7a692dc` | same | yes |
| Stage 4 dispatch manifest | `62f95191f0e3d8f8177493e94a7501a34a3909199b0d8a21e416b931a80d5058` | same | yes |
| Stage 3 packet manifest | `40561239862ea63cedfe37f877654bcc2d401b2dd52059139f0e2e37e18d8205` | same | yes |
| Stage 2 packet manifest | `58655e87760dd0b1ee753ab1432d1253fddd55aed6d7956bf6c1fd39c2156a6e` | same (protocol, common brief, return) | yes |

- All 14 capsule members match their listed byte counts and SHA-256.
- The return's digest (`44139def…6563`, 34,844 bytes) is the same in the capsule and the Stage 3 manifest.
- `C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` is a capsule member and I read it. F1's entry covers process only (two jobs
  moved to background by the harness, one `pgrep -f` whose result was not used, one failed write), and the controller
  ruled no penalty.
- `PATH-CHECK-F1.json` reports 0 findings.
- All seven script digests the return lists match the copied files byte for byte.
- Reports: five of the six stated report self-digests are reproduced by replay. See Certification audit for
  `adversarial_report.json`, and for `reconcile_report.json`, which I checked internally but did not replay.

Registry keys touched (names taken from the contracts; the registry file is outside my capsule, so I did not read it):
- Targets: `E993-BIPARTITE-TAGGED-SHADOW-BOUND` (TSB), `E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE` (HTP),
  `E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE` (HTA), `E993-INTERIOR-ELIGIBILITY-ALPHA-GE-SEVEN` (ELIG),
  `E993-R29-TOP-RANK-NONRESIDUAL-AGGREGATE` (TRN).
- Candidate record: `E993-R29-HIGH-TAIL-BOUNDARY-RECORD`.
- Refuted keys, fence context only: `E993-BETA-TARGET`, `E993-BETA-AGG-SUPPORT`,
  `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`.
- The three auxiliary keys keep their master names.

## Independent re-derivation

Instrument: `crit_lib.py` and `run_crit.py`, my own code written from SEMANTIC-CONTRACT §1. It does not use F1's
`f1lib.py`.
- Two counting engines: brute-force subset enumeration and a forest independence-polynomial DP. They agree with zero
  mismatches on every tree of order ≤ 10, both on the whole tree and after deleting `H_v` or `R_v`.
- Labelled bipartite graphs come from enumerating all `2^C(n,2)` edge sets and keeping those that pass a 2-colouring
  test.
- Free trees come from leaf extension, deduplicated by a centre-rooted AHU canonical string. Every tree passes a
  connectivity test plus the `|E| = n − 1` acyclicity test.
- Vertex deletion is modelled as avoidance, and `Δ` is zero-extended above capacity.

Fixed points (`out_fixed.json`):
- `K_2`, `p = 1`: both leaf terms are 0, both leaves are favorable, so `S = 0`.
- `P_3` (`v = 0`): at `p = 2`, `Δ_1(H_v) = −1`, `Δ_1(R_v) = 0`, term `−1`. At `p = 1` the term is `+1`.
- `P_6` (`v = 0`) at `p = 2`: `H_v = P_4` has `(i_1, i_2) = (4, 3)`, so `Δ_1 = −1`. `R_v = P_3` has `(3, 1)`, so
  `Δ_1 = −2`. The term is `+1`, which confirms F1's minimal tree witness.
- `P_3 ⊔ K_2` at `p = 2`: the terms are `+1, +1` at the `P_3` leaves and `0, 0` at the `K_2` leaves.
- Bipartite labelled counts are 1, 2, 7, 41, 376, 5177 for orders 1–6 (5,604 in total). Free-tree counts match A000055
  at every order 1–16.
- **Contract erratum (critic finding).** The star fixed point `term(p) = C(m−1, p) − C(m−1, p−1)` in SEMANTIC-CONTRACT
  §2 and in the common brief is exact only for `p ≥ 2`. At `p = 1`, `R_v` is the empty graph with `Δ_0 = i_1 − i_0 = −1`,
  not 0. The true term is `m − 1 = deg(s) − 1`, while the formula gives `m − 2`. My instrument reproduces the formula at
  every `p ≥ 2` for `m = 2..8`, and gives `term(1) = m − 1` for every `m`. As a result, "nonpositive iff `p ≥ m/2`" fails
  at `m = 2, p = 1`: that is `P_3`, with term `+1`. This does not touch any in-guard statement, because `p = 1` is inside
  the guard only when `α ≤ 1`.

Re-derived counts, all with 0 failures:

| Check | Own instrument | F1 | Agreement |
|---|---|---|---|
| (TSB), all `W`, `1 ≤ k ≤ a` | cumulative triples to order 6: 2, 14, 134, 1830, 40070, **1,235,654** | same at every order (replayed log) | exact |
| (TSB) `k > a` (every `k` up to `n`) | 0 nonzero sides | `q_{a+1} = 0` only | own is stronger |
| identity `q_j = i_j(H) − i_j(H − W)` | 0 mismatches, every `H`, `W`, `j` to order 6 | 2,395,020 triples | agrees |
| (HTP)/(HTA) bipartite, `p ≤ n+1` | cumulative instances to order 6: **59,530**; `p = 1` guard instances **2** | same | exact |
| trees to order 16: (ELIG) eligible | **29,181** (per-order 5, 26, 71, 259, 978, 2784, 6440, 18618 for n = 9..16) | 29,181 | exact |
| (TRN) eligible | **32,364**; eligible with `α ≤ 3`: 0 | 32,364; 0 | exact |
| (HTP) on trees, `p ≤ n+1` | **2,504,091** instances | 2,504,091 | exact |
| per-`α` largest positive-term `p` (α = 2..15) | 1, 2, 2, 3, 4, 4, 5, 5, 6, 6, 6, 7, 7, 7 | same table | exact |
| smallest tree with a positive term at `3p = 2α` / `3p = 2α − 1` | 6 / 3 | 6 / 3 | exact |
| smallest bipartite graph with a positive term at `3p = 2α` / `3p = 2α − 1` | 5 (`P_3 ⊔ K_2`, disconnected) / 3 (`P_3`) | see Attacks A5 | exact |
| `α(H_v) = α(G) − 1` at every leaf | 0 exceptions (all bipartite graphs to order 6, all trees to order 16) | 0 in 25 samples | own is exhaustive |

Priors only, not evidence: my cumulative eligible counts to order 12 (361 for ELIG, 846 for TRN) equal the controller's
pre-run figures as the semantic contract quotes them.

The two halves of the (TSB) double count, checked exhaustively on all 5,604 labelled bipartite graphs of orders 1–6
(`out_mech.json`):
- (A) Every independent `k`-set has at most `2(a − k)` addable vertices. 0 failures, and the bound is attained at 11,950
  sets with `1 ≤ k < a`.
- (B) Every tagged `(k+1)`-set has at least `k` deletions that keep it tagged. 0 failures.

## Attacks and findings

**A1. Critic-derived advance: the guard `3p ≥ 2α + 1` is sharp on trees for every `α ≥ 2`.** This settles F1's open
item 1.
- The family: for `m ≥ 1`, let `T_m` be the tree with a centre `s`, one pendant leaf `v`, and `m` legs `s–w_i–u_i`.
- Basic facts: `n = 2m + 2`. `α(T_m) = m + 1`, because the `m + 1` edges `{v, s}` and `{w_i, u_i}` partition the vertex
  set, and `{v, u_1, …, u_m}` is independent.
- Deletions: `H_v = T_m − {v, s}` is `mK_2`, so `i_j = C(m, j)·2^j`. `R_v = T_m − N[s]` is `m` isolated vertices, so
  `i_j = C(m, j)`.
- Closed form, valid for every `p ≥ 1`:
  - `term(p) = C(m, p)(2^p − 1) − C(m, p−1)(2^{p−1} − 1)`.
  - For `1 ≤ p ≤ m`, put `α = m + 1` and `t = 2α − 3p`. Then `term(p) = (C(m, p−1)/p)·[t(2^{p−1} − ½) + p/2]`.
- If `t ≥ 0` (that is, `3p ≤ 2α`), the bracket is at least `p/2 > 0`.
- If `t ≤ −1`, the bracket is at most `(p + 1)/2 − 2^{p−1} ≤ 0`. For `p = m + 1` the term is `−(2^m − 1) < 0`, and above
  that it is 0.
- The upper end of the positive range is `⌊2α/3⌋`, which is at most `m` whenever `α ≥ 2`.
- Conclusion: the leaf term of `T_m` is **positive exactly for `1 ≤ p ≤ ⌊2α/3⌋ = p_guard(α) − 1`** and nonpositive for
  every `p ≥ p_guard(α) = ⌈(2α + 1)/3⌉`. At `3p = 2α` the term equals `C(m, p−1)/2`.

Checks (`out_spider.json`, `all_ok: true`):
- The DP matches the closed form, and the sign changes exactly at the guard, for every `m = 1..200` (α up to 201).
- Brute force agrees with the DP for `m ≤ 7`.
- Examples: α = 9 gives order 18 and `p = 6`, term 28. α = 12 gives order 24 and `p = 8`, term 165.

Consequences:
- F1's reading that the gap is exactly 1 for α = 2..8 and wider for α ≥ 9 only because of the census horizon is
  **confirmed and explained**. `T_m` has order `2α`, so for α ≥ 9 it lies beyond the order-16 census.
- The family also confirms (HTP) on itself: no positive term at or above the guard.

Grade:
- The existence of a positive term at `p_guard(α) − 1` for every α ≥ 2 is **STATED at review stage**, with a
  `proved_informal` candidate argument (the closed form above). Per SOLUTION-CONTRACT §4 it needs an isolated second
  read.
- "The largest positive-term `p` on trees equals `p_guard(α) − 1`" is **conditional on (HTP)**.
- At α = 1 the claim is vacuous: the only case is `K_2`, where `p_guard = 1`.
- These positive terms are boundary records below the guard. They refute nothing in scope. I computed no aggregate
  below the guard (fence §3.3).

**A2. Critic-derived advance: `α(G − {v, s}) = α(G) − 1` for every leaf `v` of every finite simple graph.** This settles
F1's open item 2.
- Upper bound: `v` extends every independent set of `H_v`, because its only neighbour `s` has been deleted.
- Lower bound: let `I` be a maximum independent set of `G`. `I` cannot miss both `v` and `s`, or `I ∪ {v}` would be a
  larger independent set. Since `v` and `s` are adjacent, `I` contains exactly one of them, so `I ∖ {v, s}` is an
  independent set of `H_v` with `α − 1` elements.
- Hypotheses used: neither bipartiteness nor connectivity. Only that `v` has exactly one neighbour.
- Evidence: exhaustive, with 0 exceptions (all leaves of all bipartite graphs to order 6, all leaves of all trees to
  order 16).
- Grade: STATED, with a `proved_informal` candidate. It is a Tier 3 companion if the synthesis wants one. It also shows
  that `leaf_indep_cap` is tight, which is why (TSB) with `a = α(G) − 1` is exactly the right input.

**A3. The `p = 1` endpoint needs no bipartiteness.**
- If `v` is a leaf and `n ≥ 3`, pick any `u ∉ {v, s}`. Then `u` is not adjacent to `v`, so `{v, u}` is independent and
  `α ≥ 2`.
- So the guard at `p = 1` (`α ≤ 1`) forces `V = {v, s}`, `G = K_2`, and the term is `deg(s) − 1 = 0`.
- This is simpler than the contract's colour-class argument and is valid on every finite simple graph.
- I checked the general `p = 1` formula `term = deg(s) − 1` at every leaf of every bipartite graph to order 6: 0
  mismatches.
- The observation matters to the Lean seat, because the `indepNum = 1 ∧ IsBipartite ⇒ card V ≤ 2` lemma can be replaced
  by this leaf argument. It also confirms F1's count of exactly 2 `p = 1` guard instances (only the labelled `K_2`) by
  proof, not only by enumeration.

**A4. Support of degree 1.** If `deg s = 1`, then `N[s] = {v, s}`, so `C5LA1.R G v = insert s (neighborFinset s) =
{s, v} = C5LA1.H G v` as Finsets, and the term is 0 at every `p`.
- Exhaustive check to order 6: 0 nonzero terms.
- F1's literal attack 1 is correct. At `p = 1` this matches `deg(s) − 1 = 0`.

**A5. F1 under-cites its own evidence and misstates the conclusion.**
- The return says the order-5 bipartite witness `P_3 ⊔ K_2` is "inherited context from the controller's own prior".
  But F1's own `htp_report_n8.json` records it as its first `3p = 2α` witness (`adj [24,4,2,1,1]`, `n = 5`, `p = 2`,
  term `+1`, 1,500 such positive instances through order 8), and my instrument confirms 5 is the minimal order.
- The return then says the guard "is **not sharp** for disconnected instances". That is backwards. A positive term at
  `3p = 2α` means the guard **is** sharp at α = 3 on bipartite graphs. Strike "not sharp".

**A6. The minimal order-6 tree witness is not unique.**
- Up to isomorphism there are exactly two order-6 trees with a positive term at `3p = 2α`: `P_6` (at either end) and the
  spider `T_2` (`out_mech.json`).
- The boundary record should name both, or name the order only.
- `P_3` at `3p = 2α − 1` is the unique order-3 witness.

**A7. F1's distinction between (TSB) and `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` misreads `r`.**
- The fence wording is "at most `r` addable vertices for every independent `r`-set", so `r` is the **size of the set**.
- F1 compares `2(a − k)` with "a plausible `r = a − k`-style bound" and concludes that (TSB) is "the weaker, more
  permissive one". The premise is wrong and so is the conclusion.
- `2(a − k)` and `k` are incomparable: `2(a − k) < k` whenever `3k > 2a`.
- The exhibit the allocation asked for (F1.e), in the plain bipartite reading:
  - In `mK_2`, every independent `k`-set has exactly `2(m − k) = 2(a − k)` addable vertices. For `m = 2, k = 1` that is
    2 addable vertices, which exceeds `r = 1`.
  - With a single tag `W = {w}`, (TSB) holds **with equality** for every `1 ≤ k ≤ m`, since
    `q_j = C(m−1, j−1)·2^{j−1}` (`out_tsb_matching.json`, brute force for `m ≤ 7`).
  - So (TSB)'s constants `k` and `2(a − k)` are exactly tight, and it bounds a different quantity from the refuted key.
    This is a critic-derived exhibit. The refuted key lives in the G1-tuple model, so the comparison is structural and
    does not transfer status.
- F1 also cites its exhaustive (TSB) results as evidence for the per-set `2(a − k)` bound. That conflates the aggregate
  inequality with the per-set lemma. My check A in `out_mech.json` tests the per-set lemma directly.

**A8. The roles of `1 ≤ k` and `k ≤ a` are misattributed.**
- F1 says `1 ≤ k` "bounds the natural subtraction `a − k` from going negative". That is the job of `k ≤ a`.
- Neither hypothesis is needed for truth:
  - At `k = 0`, `q_0 = 0` because the empty set meets no `W`, so both sides are 0.
  - For `k > a`, both sides vanish (checked to order 6 for every `k ≤ n`).
- The ℕ form with truncated `a − k` holds for every `k ∈ ℕ`. The registered hypotheses are harmless but dispensable.

**A9. The (TRN) smallest-tree row is not unique.** At `n = 7, α = 5` there are three eligible trees, with `x = 2` and
`S ∈ {−16, −14, −12}`. F1 reports "`S = −14`" as if it were the only one. The rows for α = 6..10 (−24, −35, −48, −63,
−80) match mine.

**A10. Instance counts depend on a cutoff.** The totals 37,561,316, 59,530 and 2,504,091 count `p` from the guard up to
`n + 1`, a cutoff the return never states. Above `α + 1` the terms are identically 0. The numbers replay exactly under
that cutoff and should carry it.

**A11. Mechanism-equivalence against `E993-BETA-TARGET` is a logical point, not a data check.**
- If (HTP) holds, every positive ordinary leaf term lies in `3p < 2α + 1`. Any witness refuting the unrestricted
  pointwise sign on an ordinary bipartite graph therefore sits below the guard by theorem.
- (β) is stated in the governed RTree model, and relating it to an ordinary tree needs a bridge that is never attempted.
  So F1's cited `T_22`/`T_60` arithmetic (`102 < 135`, `270 < 361`) is at most registry-text consistency. It is neither
  evidence nor needed.
- F1's open item 3 should be closed as unnecessary, not left for a successor to re-fetch fenced roots.

## Mechanism-equivalence and fence check

- F1 uses no no-recovery wording. The two existing awards are named as inputs only. The compiled internal entries 41–44
  are cited as "compiled internal, unawarded".
- No census value, root correction or Hall/SDR step appears.
- The lower region: F1's below-guard computations (the boundary table) are pointwise terms, which Tier 2 permits. It
  proposes no compensation mechanism. My additions A1 and A6 stay within the same limit (pointwise terms, no
  below-guard aggregate).
- (HTP) versus `E993-BETA-TARGET`: F1 says why they differ (a guarded ordinary statement versus the governed all-window
  one), but its support is a citation. A11 gives the correct reason.
- (TSB) versus `E993-C3-G1-POINTWISE-ADDABILITY-BOUND`: F1 says they differ, but for the wrong reason. A7 corrects it.
- F1 grades nothing above `bounded_computation`. F1 presents nothing as awarded.

## Certification audit

Replayed copy-out-first in `scratchpad/c1-crit-F1-T/replay/`, running each script to completion. The PIDs were checked
dead afterwards.
- `tsb_report_n7.json`, `htp_report_n8.json`, `trees_report_n16.json` and `literal_attacks_report.json` all
  **reproduce their stated self-digests**, and the replayed files are byte-identical to the shipped ones.
- `adversarial_report.json`: the replay digest is `d3311a37…`, not the stated `201d3ab8…`. The report hashes the
  wall-clock fields `elapsed_seconds` and per-family `seconds`. With those fields removed, the shipped and replayed
  bodies agree (`1e3c4835…`).
  - **Strike** "no wall-clock/PID/host fields hashed into any report body".
  - The adversarial numbers stand. The stated digest does not reproduce.
- `reconcile_report.json`: not replayed (see disclosure 3). Its stated digest checks against its own body once JSON's
  integer keys are restored. It reconciles only graph and tree class counts and failure totals, not the eligible
  counts.
- Every number the return reports comes from a job that ran to completion. Sampled families carry `sampled` or
  `sampled_not_exhaustive_over_leaves: true` in the JSON and in the return's table.

Literals to strike or narrow:
- (i) "Star … exact formula, no sampling … every `p = 1..m+1`" and "crossover … always at or below `⌈m/2⌉`, strictly
  below the guard floor for every `m` tested". The formula is wrong at `p = 1` (the inherited contract erratum above).
  At `m = 2` the true crossover is `p = 2 = p_guard`, not 1. That is neither "at or below `⌈m/2⌉ = 1`" nor "strictly
  below the guard". No in-guard check is affected.
- (ii) "not sharp for disconnected instances" (A5).
- (iii) "inherited context … never used as evidence" for `P_3 ⊔ K_2`. F1's own report backs it.
- (iv) "`r = a − k`-style … weaker, more permissive" (A7).
- (v) "`1 ≤ k` bounds the natural subtraction" (A8).
- (vi) the unqualified "smallest eligible-TRN tree … `S = −14`" (A9).
- (vii) "Guard sharpness on trees, `α ≥ 9` … unresolved". A1 now resolves it, pending a second read.

Literals confirmed by replay and by my own instrument:
- "exhaustive to order 7/8/16": the (TSB) and (HTP) orders ≤ 6 and all tree counts were independently reproduced.
  Orders 7–8 were replayed with F1's generators only.
- "0 failures", "exactly 2 `p = 1` guard instances", "A000055 exact", "1, 2, 7, 41, 376, 5177, 103237, 2922446".

## Verdict

F1's census numbers replay exactly and match an independent instrument. It over-claims no grade and finds no
counterexample. The return is narrowed by the struck literals above (the star formula at `p = 1`, the "not sharp"
misstatement, the misread `r`, the misattributed `1 ≤ k`, the non-reproducible adversarial digest, and the non-unique
minimal witnesses). Its open boundary question is now answered by a critic-derived closed-form family (A1). The route's
evidence stands at `bounded_computation`.

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **Isolated second read of A1**: for every α ≥ 2, the leaf term of `T_{α−1}` is positive exactly on
   `1 ≤ p ≤ ⌊2α/3⌋`. After that read, the boundary record's predicate should read:
   - "the guard `3p ≥ 2α + 1` is sharp on trees (hence on bipartite graphs) for every α ≥ 2, by `T_{α−1}`";
   - minimal orders: trees 3 at `3p = 2α − 1` (`P_3`) and 6 at `3p = 2α` (`P_6` and `T_2`); bipartite graphs 3 and 5
     (`P_3 ⊔ K_2`);
   - replacing "sharp for α = 2..8 to order 16".
   The statement "the threshold is exact" stays conditional on (HTP).
2. **Isolated second read of A2** (`α(G − {v, s}) = α(G) − 1` for every leaf of every finite simple graph) and of A3
   (the `p = 1` endpoint without bipartiteness). The synthesis then decides whether to register either as a Tier 3
   companion (critic-attributed) or keep it on an award's face.
3. **Controller erratum**: SEMANTIC-CONTRACT §2 and the common brief state the star formula for all `p`. It holds only
   for `p ≥ 2`, and `term(1) = m − 1`.
4. F1's open items 3 (re-fetching `T_22`/`T_60`) and 4 (a G1 witness) are unnecessary for this run's scope (A11, A7).
   Item 6 (order-8 (TSB), order-9 (HTP)) would add only `bounded_computation` and is not needed for any award.
5. Nothing in F1 advances any target past `bounded_computation`. The four targets' formal awards remain Stage 7's.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-high-tail-certification-dre-2026-09-25/scratchpad/c1-crit-F1-T/`
(SHA-256):

- `crit_lib.py` `a09fc29525f11168163a36a283bc7b7b4bb382d3062d21e18be43851e003d275`: own instrument (BF + forest DP,
  generators, `T_m`).
- `run_crit.py` `27757fcaa1ce9aff7b8e4e66e8c292daf728daa0713c6d5da5301ef40cc2159a`: sections `fixed`, `bip 6`,
  `trees 16`, `spider 200`.
- `tsb_matching.py` `eeec715589875c0d4994147166aeb2c10cee7c83cfd0ee60f4b80b29b3b3b590`: (TSB) equality on `mK_2`.
- `mech_check.py` `2e2a83331b18e987e2284a25a148903e38e2ec373c0774e65a3d7d1fca77e5a4`: (TSB) halves A/B and order-6
  witnesses.
- Outputs:
  - `out_fixed.json` `4024081a523ff26920cc90591b721ed69cd90e619759e91ab0ce2b4921a31106`
  - `out_bip.json` `96d76396f22669318e3bfd79a3f689d4a2d5b8c5646c7b8d934d0600ce4cf9df`
  - `out_trees.json` `3dd4a83c0df1a41eec7351a28316edbcaa77312d9ed9f08a2cf3db5c81d64718`
  - `out_spider.json` `78fd0262150ca07d4b8f9e6748f2cc241f6642ba3b1ef1937726f7ed554fc555`
  - `out_tsb_matching.json` `cff003fbf4127910def2cd1af0ef8a533872c8194c8b1a6c7a30bc62b37aa143`
  - `out_mech.json` `6c483a0ea412269c322b58fa51306d9047f36970de9a2943c08376c64006fcef`
- `replay/`: copies of F1's seven scripts and six reports (digests as the return lists).
- `replay/out/`: replay outputs.
  - `tsb_report_n7.json` `b30fd86c…`, `htp_report_n8.json` `dd8b23c3…`, `trees_report_n16.json` `3c0e01f6…` and
    `literal_attacks_report.json` `e42bc552…` are byte-identical to the shipped files.
  - `adversarial_report.json` `fb3982e9…` agrees with the shipped file except for the timing fields.

All background jobs were run to completion and confirmed dead by literal PID (90753–90757, 92190, 92191, 93221, 93222)
before this file was written.
