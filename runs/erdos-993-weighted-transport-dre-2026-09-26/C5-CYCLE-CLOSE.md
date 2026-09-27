# Cycle 5 Close — r30 (controller record, 2026-09-27)

Run `erdos-993-math-dre-20260926-r30-weighted-transport`. Controller: Claude Fable 5.1. This record closes Cycle 5, the fifth of six.
Every grade below is the grade of record as fixed by the sealed synthesis (`cycles/cycle-5/stage6/SYNTHESIS.md`), the governed Stage 7
close (`cycles/cycle-5/stage7/LEAN-GATE-CLOSEOUT.md`) and the five isolated second reads (`second-reads/SR-C5-*/SECOND-READ.md`).
Where a second read repaired a statement or a name, the repaired text is the text of record.

## 1. Headline

- **(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: OPEN at full scope, unchanged.** Not proved at full scope; not refuted (no
  deficient cut at any eligible row anywhere on record). Three NEW restricted scopes are of record as SEPARATE keys:
  - whole-row (HALL) at `G(8^82, 7^2)` — `p = 448` with switch arcs load-bearing (the zero-slack reduced-capacity choke-local sector
    certificate composed with the registered E1-R flow) and `449–503` with deletion arcs alone (CD-1 at `q ≡ 2` + E1-R): keys
    `E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` and
    `E993-R30-CHOKE-TREE-8POW82-7POW2-RANKS-449-TO-503-DELETION-ONLY-WEIGHTED-HALL` (`computer_assisted`; SR-C5-1) — the first non-CB
    tree with a switch-arc certificate; six trees are now closed as rows;
  - deletion-arc (HALL) on the infinite eligible spider family `{(S(1,2,3^k), p) : k ≥ 5, p eligible}` (every `p ≥ k+2`, every tag set;
    `α = 2k+2`, `x = k+1` for `k ≥ 5`): key `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2`
    (`proved_informal`; SR-C5-2; the hook partition is constructed on the face — no classical dependency);
  - (HALL) at EVERY eligible rank of every `G_k`, `k ≥ 3` (the C4 flow key composed with GK-MONO `x(G_k) = k+1`): key
    `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK` — grade stated in §3 (`formally_verified` if the C5-LA1 award closed;
    else `proved_informal`, SR-C5-3). The registered `G_k` eligibility key states eligibility at `p = k+3` only (erratum R30-E-m), so the
    lower bound `x(G_k) ≥ k+1` was NEW this cycle.
- **Terminal-close test (C5 gate ruling 39) — DECIDED mechanically from the decisive reads: letter (b′) SUPPLIED** (SR-C5-1 and SR-C5-2
  both confirmed). **Cycle 6 — the sixth and LAST — runs** with the synthesis's portfolio (§8); the run proceeds to its terminal
  close after it regardless of outcome. Letters (a′), (c′), (d′) were not supplied.
- **Frontier of record.** The switch-necessary eligible CB frontier is 223 rows for `d ≤ 13` in the census ranges (`d = 7…13` →
  24, 52, 49, 30, 9, 49, 10), all at the FIRST eligible rank; 5 certified (the five-row key), 218 not (smallest `CB(8,95)/508`,
  `CB(7,109)/510`); full-sector Hall holds on all 223 with switch surplus ≥ 4401.47× the deficit (`CB(9,112)/673`). Every certificate of
  record sits at the TOP sector-deficient rank; E1's condition (i) holds there for `d = 8` at every `m ≥ 106` (the family `𝒞_8`; SR-C5-4:
  also for `m ≡ 1 (mod 3)` from `m = 134`, to `m = 400`) but FAILS at the first eligible rank from `CB(8,161)/859` — a uniform
  switch-arc class through E1 lives at the top rank, not at first ranks. The per-tag method is strictly weaker than (HALL) (it fails at
  the eligible `T_22/34`, where (HALL) holds); no free-tree row of order `≤ 19` needs cross-tag routing (all-trees censuses). A sector-only
  argument is not a reduction of (HALL) (`CB(11,2)/16`). **Smallest unproved lemma:** uniformly, `(L-S)_top` + `(ELIG-top)` on `𝒞_8`; at
  instance level, the sector certificate at `CB(8,95)/508`.
- The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` OPEN (unchanged); the ten refuted mechanism keys REFUTED
  (unchanged); the Cycle 3 conjecture "on trees `S ≤ 0` ⇒ saturation" gains new non-eligible refuting instances (`CB(11,2)/16`,
  `CB(9,2)/13`; records).

## 2. Seals of record

| Stage | Seal (SHA-256) | Members |
|---|---|---|
| Stage 2 packet | `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` | 1400 |
| Stage 3 dispatch | `66d105920cf5558ed8c14bcd37dd0ceaa582fa1b6112fec200da98f7dc7ec761` | 7 |
| Stage 3 packet | `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58` | 63 |
| Stage 4 dispatch | `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d` | 13 |
| Stage 4 packet | `b7b0bcedfb6117021fe99bdf065b24d5a45509f10bdf5dbe1bd48cd0feb47169` | 83 |
| Stage 5 packet | `ccfc7121339bbdd0079768cb5accde9cdfa7be508b02bf3cd370795bbb27f7df` | 69 |
| Stage 6 dispatch | `9d5e84e250a46035e53926469dc2fcdb2e4b455ae71ab5e8038a67a953476bb0` | 12 |
| Stage 6 packet | `57a7a36725940a84d0898870b00c8a3fe853489be7954095eaba74dde376de8f` | 57 |
| Award capsule C5-LA1 | `1801bdc7846d11f6214cb066a6d7d7e57782534bd8e5a0bb6593f779887b18bf` | 647 |
| Critic capsules | T1 `ebc5a0bb…`, T2 `3f58173d…`, F1 `9fb580a5…`, F2 `0a628530…`, U1 `79e10b94…`, U2 `cdeb272e…` | — |
| Adjudicator capsules | T `ca02804a…`, F `a75ea8f8…`, U `784f4eef…` (`control/c5-adjudicator-capsules/SEALS.json`) | — |
| Second-read capsules | SR-C5-1 `824f3741…`, SR-C5-2 `aed54123…`, SR-C5-3 `097f8a3b…`, SR-C5-4 `e3d414ce…`, SR-C5-5 `f1ed9355…` (`control/c5-second-read/SEALS.json`; sealed three times before any dispatch — R30-E-o) | — |
| Stage 7 packet | `24749c40f0e744e400661e08d356dbcee890072b4bc0788a61be9c13c0ff68bd` | 904 |
| Second-reads packet | `84cdb34a45c96784e1a3508ab4285021cd14c072b8536b0a722161e2cc1bb2ed` | 28 |

Every seal this cycle ran with an explicit exit test on its path check (rule R30-I-3); no superseded manifest; one path-literal
quotation record for the second reads (SR-C5-2's harness-copy disclosure).

## 3. Lean award (governed `lean-proof-workflow`; `formally_verified`)

C5-LA1 CLOSED `formally_verified` with zero repair rounds (`cycles/cycle-5/stage7/LEAN-GATE-CLOSEOUT.md`): key
`E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK`; terminal `E993Transport.gk_lowerRegionWeightedHall_everyEligibleRank (k : ℕ) :
(gkGraph k).IsTree ∧ ∀ p, C5LA1.crossingIndex (gkGraph k) + 2 ≤ p → 3 * p < 2 * (gkGraph k).indepNum + 1 → ∃ f, IsSaturatingFlow (gkGraph k)
(favorableLeaves (gkGraph k) p) p f`; run `runs/lean-2026-09-27-c5-la1-gk-weighted-hall-every-eligible-rank`; `Main.lean` `e24ba9dd…`;
contract `3acc3c90…`; kernel receipt `6fe8cea0…` verified (receipt id `71526dad…`; axioms exactly the three; no `sorryAx` across 183
declarations); informal audit passed (`3e8627b1…`; receipt `b41422e7…`); fidelity `match` 36/36 (`c274b6f6…`); `VERIFICATION-REPORT.md`
`f9ad374c…`. Carry: C4-LA1 entries 1–112 and first-interior entry 14, byte-identical, receipt-bound (three bindings). New Lean content:
`gkGraph_isTree`; the guarded count bridge (`gkHalfCount`, fibre count); the binomial-row inequality with an integer closing step;
`gk_forwardDifference_nonneg` (GK-MONO in Lean — its key registers `proved_informal` as a companion, R29-N-12); the reduction
`gk_crossing_lower_iff`; the composition calling carried lemma 110. Fidelity caution on the face: the conclusion asserts a saturating
flow over the network's arcs; deletion support is the C4-LA1 award's certificate, not this key's. The award widens the `G_k` (HALL)
scope from "every rank `p ≥ k+3` that is eligible" to EVERY eligible rank (no eligible rank lies below `k+3`); it is not a second family
for ruling 39.
## 4. Registrations applied (run-local registry only; master untouched until the terminal close)

Applied by `control/register_c5_close.py` from `control/C5-CLOSE-CONFIG.json` after the second-reads packet seal (ruling 43), then
`control/c5_close_field_normalize.py` (bare grade tokens; qualifiers moved to scope/provenance). Run-local registry **453 → 460 claims**;
ledger 376 → 388 rows; distinction rows 56 → 75 (19 new). Master lint (434 identities): 0 findings, 0 warnings
(`control/CLAIM-STATUS-LINT-c5-close.json`). Run-local lint: 460 claims, 1 findings, 0 warnings — VERIFIED_REGRESSED (`control/CLAIM-STATUS-LINT-c5-close.run-local.json`; the one finding is the inherited R21-C1-T6 alias-pattern false match against the (INV) key's alias pattern, noted at the Cycle 4 close — not a regression; the pattern is narrowed at the terminal close).
Snapshots: `control/snapshots/CLAIM-IDENTITY.run-local.c5-pre-close.json` / `.c5-close.json`, `OBLIGATIONS.c5-pre-close.csv` / `.c5-close.csv`.

New keys (7), all VERIFIED, each from its read's confirmed KEY block (repaired text is the text of record):
1. `E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` — `computer_assisted` (SR-C5-1).
2. `E993-R30-CHOKE-TREE-8POW82-7POW2-RANKS-449-TO-503-DELETION-ONLY-WEIGHTED-HALL` — `computer_assisted` (SR-C5-1).
3. `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2` — `proved_informal` (SR-C5-2).
4. `E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE` — `proved_informal` (SR-C5-3; GK-MONO).
5. `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK` — `formally_verified` (award C5-LA1; SR-C5-3's block as supplement).
6. `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD` — `proved_informal` modulo Darroch
   (SR-C5-4; renamed from the synthesis's proposal, which omitted `d ≥ 6`; the proposal is its alias).
7. `E993-R30-CB-AT-MOST-SIX-SUPPORTS-PER-CHOKE-SECTOR-NEVER-DELETION-DEFICIENT-AT-ELIGIBLE-RANKS` — `proved_informal` modulo Darroch
   (SR-C5-5; renamed from the synthesis's "choke-degree" name; the proposal is its alias).

Scope notes on: (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (the three new restricted scopes; SR-C5-1, SR-C5-2, SR-C5-3, C5-LA1);
E1-R (its load clause covers the one-choke switch images containing `v`; SR-C5-1); the C4 `G_k` flow key ("every eligible rank, with GK-MONO";
SR-C5-3); the `G_k` eligibility key (correction R30-E-m: its face states `p = k+3` only; SR-C5-3); GK-SIGN (SR-C5-3); E1 (its
rank-threshold domain; SR-C5-4); the CBstar key (the `d ≤ 6` corollary; `CB(1,m)` sector non-eligibility, Darroch-free; `α(CB(d,m))`;
SR-C5-4, SR-C5-5). Distinction rows: 19 (vs the five-row keys, the refuted `E993-R23-LITERAL-DELETE-ONLY-HALL` and per-leaf keys, the
`G_k` keys, the INDEPENDENCE-* master keys, `E993-GRAPH-SINGLE-RANK-DELETION-SUFFICIENT`, `E993-R28-SDR-THRESHOLD-EQUIVALENCE`, E1/E1-R,
CBstar). Ledger rows (12): the `G/448` per-state certificate table; the E1 first-rank failure frontier; the condition-(i)/sector-deficiency
band; the `CB(8,m)` top-deficient-rank family; the `d ≤ 6` descent census; a `G_k` record (SR-C5-3-R1); the award row R30-C5-LA1; five
per-read rows. Normalizer note: seven inherited ledger rows whose status column carried a parenthetical qualifier (four R25 rows,
`R30-CB-RECORD`, `R30-C2-TM2-CONDITIONAL`, `R30-C2-S12-XMAX`) were normalised to the bare grade token with the qualifier moved to the
provenance column as STATUS NOTE (content preserved; originals in the pre-close snapshot; R30-N-82).
## 5. Isolated second reads (five Opus 5.5 high seats; 24 statements)

| Read | Statements | Verdicts | Decisive for |
|---|---|---|---|
| SR-C5-1 | 1a–1g: `G(8^82,7^2)` tree data and derived selector; the zero-slack certificate from the shipped per-state table; E1-R's registered load clause AGAINST THE REGISTRY SNAPSHOT; the composition at 448; ranks 449–503; (WID) two-sided at 56 ranks; the two keys | 1a/1b/1c/1f confirmed; 1d/1e/1g confirmed_with_repairs (registry-side: input lists must name keys — "CD-1" and "C1-LA2" are aliases of other keys; (HALL⇒FLOW) is a companion lemma, not a separate award; E1-R does not depend on CD-1; the R8 family description omits the `(0,d)` state) | ruling 39 (b′) FIRST HALF — CONFIRMED |
| SR-C5-2 | 2a–2e: the spider theorem E-1; `α`, `x ≤ k+1`, eligibility; N3b `x = k+1` for `k ≥ 5`; distinctness from `G_k` and fences; the key | 2a/2b/2d/2e confirmed; 2c confirmed_with_repairs (an explicit base case and ratio step replace "grows faster"; Newton named there) | ruling 39 (b′) SECOND HALF — CONFIRMED |
| SR-C5-3 | 3a–3e: GK-MONO (both proofs); the every-eligible-rank composition; the eligibility key's face (R30-E-m); the two keys; the C5-LA1 frozen statement and count bridge | 3a/3c confirmed; 3b/3d/3e confirmed_with_repairs (only `x ≥ k+1` is new; "nonempty iff k ≥ 3" needs `x = k+1`; N3 calls entry 110; the N4a display is wrong in literal ℕ — guarded form supplied) | the C5-LA1 award's informal input — CLEARED |
| SR-C5-4 | 4a–4d: the E1 rank-threshold lemma; its consequences; `α(CB(d,m)) = 1 + m(d+1)`; the key | 4a/4b/4d confirmed_with_repairs (key renamed to carry `d ≥ 6` — the hold half fails for `d ≤ 5`; the undecided rank can carry both E1 and deficiency: `𝒞_8` extends to `m ≡ 1 (mod 3)` from `m = 134`; "E1 fails for large m" is a bounded record); 4c confirmed | non-decisive |
| SR-C5-5 | 5a–5c: sector sufficiency for `d ≤ 6`; `CB(1,m)` sector non-eligibility; names and placement | all three confirmed_with_repairs (sharper bound `x ≥ ⌊(2dm+2)/3⌋` on the face; the CBstar key's `F` domain gap closed on the face; key renamed to name supports per choke; 5b a scope note) | non-decisive |

24 statements: 10 confirmed, 14 confirmed_with_repairs, 0 rejected. Every reader recomputed its capsule seal and every member digest,
built its own instrument, and reported the two-part model disclosure (all runtime `claude-opus-5-5[1m]`).

## 6. Standing facts of record entering Cycle 6

- `formally_verified`: C1-LA1, C1-LA2, C2-LA1, C3-LA1, C4-LA1 (and C5-LA1 if closed — §3). `proved_informal`: (INV), (NM), the
  second-eigenvalue theorem, the CBstar deficit, the `G_k` eligibility key (rank `k+3` only), the equitable lift, GK-SIGN, E1, E4+G1,
  CD-1, E1-R, R3, the spider family theorem, GK-MONO, the E1 rank-threshold key (`d ≥ 6`; modulo Darroch), the `d ≤ 6` sector key
  (modulo Darroch), the `CB(1,m)` sector non-eligibility (CBstar scope note; Darroch-free). `computer_assisted`: the five-row deletion
  key, the five-row switch-arcs key, the two `G(8^82,7^2)` keys.
- Struck this cycle (never evidence): T1's (L-i) at every eligible rank of `CB(8,m)`; the `d ∈ {7,8}` class reading; T2's `S`
  self-check; F1's "tightest row" and trend (its grid never tested the switch); F2's "strictly negative" and "n up to 30"; U1's "CD-1
  type-checks" and "crossingIndex = k+1 supplied informally"; U2's regular-bipartite lemma as a new key (= CD-1 at `q ≡ 2`), its
  hard-coded selector, its magnitudes and its per-choke threshold reduction; the synthesis's N4a count-bridge display in literal ℕ;
  "the composition is unavailable below the E1 band" (too strong at the undecided rank).
- Records (`bounded_computation`): the 223-row switch-necessary frontier; `𝒞_8`; the E1 first-rank failure frontier; the all-trees
  censuses of orders 13–19; the 169 eligible `CB(d,m)` rows with `d ≤ 5`; the laboratory rows at non-eligible ranks; the
  `G(8^82,7^2)/448` per-state certificate table; the controller replays CF-REPLAY-c5a..d (the c5b census reproduces C-F1-U's 223 rows
  exactly; c5d reproduces the T adjudicator's band family).

## 7. Errata, incidents and process record

- **Errata this cycle.** R30-E-j (the sealed C5 critic protocol quotes the Cycle 4 Stage 2 seal — every critic resolved it by
  recomputation); R30-E-k (`sources/mathlib-binding/PIN.json` names a missing seed path — informational field only); R30-E-l (the sealed
  C5 adjudicator protocol names the Cycle 3 capsule folder); R30-E-m (sealed Stage 5 fact CF-5 wrongly called `x(G_k) = k+1`
  `proved_informal` — corrected in CF6-6, confirmed by SR-C5-3); R30-E-n (sealed Stage 5 fact CF-T1 wrongly placed the registry in the
  adjudicator capsule — corrected in CF6-8; E1-R's load clause verified by SR-C5-1 against the snapshot); R30-E-o (path-check record
  naming: the `path_check` fields of the sealed Stage 4 and Stage 5 agents records name non-existent `PATH-CHECK-…` files — the records
  are `control/c5-stage4-critique-<S>-<O>.json` and `control/c5-stage5-adjudication-<O>.json`; the second-read capsules were sealed
  three times before any dispatch). The synthesis's own clone-residue items (cycle numbers and award-group proposals in its cloned
  protocol) are a controller lapse of the same class.
- **Process.** 12/12 critiques concordant `retained_narrowed` (60 critiques in five cycles without a discordant pair); 3/3 adjudications
  still_open / progress yes / plateau no; seat process flags: U2's full process listing (Stage 3 addendum, R30-N-74), F1's self-disclosed
  `ps aux`, F2's failed temp redirect; six critics ran one seal-string grep above grant while tracing R30-E-j; harness auto-backgrounded
  jobs handled by literal PID or task control throughout; no rewrite after a seal; no registry write under live capsules; every seal
  with an explicit exit test. Controller lapses: R30-N-74 (disclosure transcription), R30-N-75 ("of record" wording), a facts-generator
  slicing slip caught before use, the review-brief generator's generic template rewritten by hand (R30-N-81).
- **Controller replays as third instruments:** CF-REPLAY-c5a (first-rank census `d ≤ 16`, `m ≤ 89`), c5b (the 223 rows), c5c (`CB(8,m)`
  first ranks vs the E1 threshold: 52 hold / 79 gap / 61 fail to `m = 300`), c5d (the band family).

## 8. Cycle 6 portfolio (binding text in `control/C6-ALLOCATION.md`; C6 gate rulings 45–52; the LAST cycle)

| Seat | Route | Object |
|---|---|---|
| T1 | `C6-T-01 CB-TOP-DEFICIENT-RANK-UNIFORM-SWITCH-HALL` | `(ELIG-top)` + `(L-S)_top` on `𝒞_8` (or the `d = 7` analogue), composed with the registered E1 threshold key by B7 |
| T2 | `C6-T-02 CB-BAND-ROW-CERTIFICATES` | exact certificates at the uncertified band rows, smallest first (`CB(8,95)/508`); per-state tables as data |
| F1 | `C6-F-01 WHOLE-NETWORK-MIXED-FAMILY-CUT-SEARCH` | mixed sector/regime-3 invariant families at `CB(9,112)/673` and `CB(8,95)/508` |
| F2 | `C6-F-02 FIRST-POSITIVE-SUMMAND-ELIGIBLE-ROW` | all-trees counts census of orders 20–22; literal (HALL) at the first positive-summand row |
| U1 | `C6-U-01 LEAN-GK-AND-SPIDER-FAMILY-AWARDS` | complete C5-LA1 if open; the spider award (N5 first) |
| U2 | `C6-U-02 COUPLED-CB-EXTREMAL-FAMILY` | the compression lemma over sector ∪ regime-3, validated on the `m = 2` maximizers |

Successor inheritance (applies after Cycle 6 in any case): (HALL) OPEN with its restricted scopes; `𝒞_8` with `(L-S)_top` and
`(ELIG-top)`; the 218 uncertified rows; the two unsearched (CUT) sites; the Lean targets C5-LA1 (if open) and C5-LA2 (N5 first); the
Codex relative-margin mechanism as a named seed; the additive rebase of r30's keys onto the 457-identity master.
