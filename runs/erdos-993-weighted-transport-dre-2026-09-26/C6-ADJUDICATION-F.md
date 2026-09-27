# Orientation Adjudication

Stage 5 adjudicator, orientation F (falsify), Cycle 6 of r30 (Erdős #993: correctly weighted mixed-boundary transport for the
remaining ordinary-tree lower-region aggregate). Portfolio: returns `F1` (`C6-F-01 WHOLE-NETWORK-MIXED-FAMILY-CUT-SEARCH`) and `F2`
(`C6-F-02 FIRST-POSITIVE-SUMMAND-ELIGIBLE-ROW`), and their critiques `C-F1-T`, `C-F1-U`, `C-F2-T`, `C-F2-U`. Date 2026-09-27.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the dispatch directs. I loaded no other VerityOS subsystem (no memory,
knowledge, conversations, modules, skills, logs, decisions or operations file). The host placed the project `CLAUDE.md` and the user's
auto-memory index in my context at session start. I did not act on either beyond this acknowledgment. I kept no conversation log,
because the dispatch confines my writes to this file and my scratch directory.

Model disclosure: chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Dispatch.** `control/dispatch/c6-stage5/DISPATCH-ADJ-F.md`: `shasum -a 256` gives
  `4b8a5bfb351b34f3fc2624558bed22a59e4178a8c6b0bf1bb3a223da0245b1c8`, equal to the digest I was given. I verified it before following it.
- **Capsule seal.** `control/c6-adjudicator-capsules/F-PACKET-MANIFEST.json`, recomputed as SHA-256 over canonical JSON without
  `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline): **`92f832bd3500b303483d7cd23096de0a349b4271b504b32fb301831cf87c70ab`**,
  equal to the recorded value and to the dispatch's value. All 21 members match their recorded SHA-256 and byte counts (the protocol
  `a57e32d2…`, both contracts, the allocation, the gate, `SOURCE-DIGESTS.json`, the Stage 2/3/4 manifests, both admissions, both
  disclosure records, the controller facts `43389e5b…`, `PATH-CHECK-F.json` (0 findings), the returns `F1` `9c0b4c89…af96` and `F2`
  `0f47c145…aded`, the critiques `C-F1-T` `2b249154…`, `C-F1-U` `3b0f4543…`, `C-F2-T` `4f517c6d…`, `C-F2-U` `18401967…`).
- **Stage seals recomputed.** Stage 2 `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611` (2,011 members); Stage 3
  `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd` (65); Stage 4 packet manifest
  `0e5fc7b47a1c90fb8ac25b800585321a8ef7f2d8a52e40654f85c3a45b70be5c` (85). Each matches its own `seal_sha256`. The Stage 3 and Stage 4
  admission records (`admit`, 6/6 and 12/12, zero findings) list the same digests for the six F files. The "Stage 4 dispatch seal"
  `74be1845…` that all four critics quote belongs to the Stage 4 dispatch manifest, which is not in my capsule; I did not verify it.
- **Shipped scratch.** The six F1 artifacts in `scratchpad/c6-F1/` match F1's inventory byte for byte (`copied_adj_quot.py` `e36e50dc…`,
  `copied_adj_shape.py` `b04130d0…`, `tree_check.py` `b874c8ad…`, `gf_lib.py` `640f8201…`, `f1_main.py` `0510341d…`,
  `f1_main_output.json` `b15d3069…`). F2's `census_f2.py` `ed819310…7d55` and `hall_check.py` `83f17848…4be5` match. `C-F2-U`'s
  `crit_inst.py` `4c40ac0b…6091424` matches its inventory. The upstream Cycle 5 `scratchpad/c5-adj-U/own/` originals of F1's copied
  instrument are outside my grant; F1's byte-identity claim rests on F1 alone (both F1 critics say the same).
- **Claim identity.** Keys touched by the portfolio, all cited by key: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN at full scope;
  untouched); `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (formally verified; used as the fidelity assertion only);
  `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (cited);
  `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY` (cited as the completeness reduction);
  `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT` (converse cited); the primary aggregate
  `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (OPEN; untouched). Neither return proposes a key. The critics float two candidate
  names (see Lean readiness); the run-local registry is in no Stage 4 or Stage 5 F capsule, so the alias check against it is owed by the
  synthesis.
- **Process record (weighed, no penalty).** F1: two non-recursive `ls` of the bare `scratchpad/` (sibling names only); no background
  jobs. F2: a bounded `find -maxdepth 1` and `ls` inside the run root and `control/`; three background jobs by literal PID (58470, 60746,
  64096), exited. `C-F1-T`: targeted string searches over the worker common brief (not a capsule member). `C-F1-U`: a digest loop that
  read the bytes of all 65 Stage 3 files (only F1 results printed). `C-F2-T`: one harness-backgrounded job stopped through task control
  (no PID exposed); own job 76556 exited. `C-F2-U`: seven background jobs confirmed exited by literal PID. All four critics saw other
  seats' section headings in the attack briefs. The controller facts (CF-2) agree. None of these reads touched a number I rely on.
- **My own read boundary.** Beyond the two boot files, I read the protocol, the capsule manifest and its 21 members. I ran non-recursive
  `ls` on the granted directories `scratchpad/c6-F1/`, `scratchpad/c6-F2/`, `scratchpad/c6-crit-F1-T/` (and its `own/`),
  `scratchpad/c6-crit-F1-U/` (and `own/`), `scratchpad/c6-crit-F2-T/` (and `own/`) and `scratchpad/c6-crit-F2-U/`, and I read small
  result files there (the critics' census JSONs and logs, the shipped famclass and window outputs for comparison). I copied the scripts
  out into `scratchpad/c6-adj-F/` before running anything. One `grep -n` for imports and paths ran over my own copies. I edited two
  copied scripts only to rebind a hard-coded `sys.path` to my copy directory (`cF1T/maximizer_arms.py`, `cF2U/census.py`). I did not read
  `scratchpad/c6-F1-replay/`, `scratchpad/c6-F2-replay/`, F2's `RETURN-draft.md`, any `sources/` file, any other orientation's material,
  prior syntheses, other roots or the network. No `find`, recursive `grep`, `rg` or `ls -R` ran above my grant. No installs, no Lean.
  Background jobs: two, by literal PID (90444 F2's order-20 census replay, exited; 90446 `C-F2-U`'s order-23 census replay, exited; both
  confirmed exited by `kill -0` on the literal PID before this write). I ran no process listing and no pattern kill. Every Python run used `python3 -B`.

## Route-by-route decisions

### F1 — `C6-F-01 WHOLE-NETWORK-MIXED-FAMILY-CUT-SEARCH`: route verdict `blocked` NARROWED to `not_completed`; retained at `bounded_computation`

**Replay.** Copy-out `python3 -B f1_main.py` (6.4 s) reproduces `RESULT_SHA256 e2c9e99f…55bb` and `f1_main_output.json` `b15d3069…0f42`
byte for byte.

**Fidelity (protocol check 3): PASS at both target rows**, on three instruments, each replayed copy-out by me: F1's `f1_main.py`;
`C-F1-U`'s `targets.py` (literal tree, own DP, own closed forms; `RESULT_SHA256 1c11b4b5…` reproduced; its `S` hashes
`96805b76…` and `825a6002…` equal the SHA-256 of F1's `S` integers); `C-F1-T`'s closed-form `sfree.py` (which asserts its regime
decomposition against an independent bivariate GF). My own literal instrument is brute force and reaches only small `CB` rows.

| Row | `n` | `IsTree` | `α` | `x` (through `α`) | window | `|F_p|` | `supply − capacity = S` | `S` |
|---|---|---|---|---|---|---|---|---|
| `CB(9,112)/673` | 2131 | yes | 1121 | 671 | `[673, 747]` | 1009 = every leaf | two independently coded sides agree | negative, 481 digits |
| `CB(8,95)/508` | 1618 | yes | 856 | 506 | `[508, 570]` | 761 = every leaf | two independently coded sides agree | negative, 363 digits |

The weight counts active tags only (`(adj[s_v] − {v}) ∩ B`), the relation is (D) ∪ (S) with `|N(u) ∩ B| = 2` and `u ∉ B`, `F` is derived
from `Δ_p(T − v) < 0` on the original tree at rank `p`. One latent defect stands (both critics): F1's aggregate side does not condition on
`F` (correct here only because every leaf is favorable at both rows).

**Retained (`bounded_computation`, backed by replay and by independent instruments):** the rows above; the whole-sector ratios
`SW / (sector deletion deficit)` = **4401.466603449473** at `CB(9,112)/673` and **7476.316339192683** at `CB(8,95)/508`; regime-3 total
supply over `SW` = 51.14 and 107.93; the four laboratory values (`maxdef` 22,458,436 / 86,940,920 / 3,573,432,896 / 4,204,932; sector-only
0 / 34,893,540 / 2,159,869,129 / 0; `S` −111,739,804 / +80,747,320 / +2,900,105,120 / +2,424,264 at `CB(11,2)/16`, `CB(10,2)/14`,
`CB(12,2)/17`, `CB(9,2)/13`). Both whole-sector ratios bound `N(Sector)` against the sector alone; they protect no subfamily and no mixed
family.

**Struck or corrected (claim by claim; every item replayed):**

1. §9 "`≈ 7.90 × 10^{49}`" → **7.899 × 10^48** (49 digits; my `math.comb` recomputation, both critics, CF-REPLAY-c6a). "`~10^{41}` to
   `~10^{49}`" and "infeasible by roughly 41 to 49 orders of magnitude" are struck: they are digit counts. The size-filtered source-orbit
   counts are **2.130 × 10^47** (`CB(9,112)/673`) and **1.880 × 10^39** (`CB(8,95)/508`); my replay of `C-F1-T`'s `orbit_counts.py`
   reproduces both.
2. §6 "`Δ_x` negative (481-digit)" / "(363-digit)" → **477 and 361 digits**; 481 and 363 are the digit counts of `S`.
3. §8 "the 268 sector orbits are NOT the whole sector level" is **false** and struck (see Cross-route reconciliation, item R1): 268 is the
   exact number of sector source-orbit types at `CB(11,2)/16`, and the minimal maximizer contains all of them.
4. §8 "no simple per-choke threshold predicate" is superseded: at all four laboratories the minimal maximizer is exactly the set of
   positive-weight sources avoiding `s`.
5. §5 "verified, not assumed, by the WID two-sided check" is struck (circular: both sides use the same multiplicity). The
   `Aut(CB(d,m))`-transitivity argument on private leaves is sound and suffices; both critics checked three private leaves in
   distinct chokes literally (my replay of `C-F1-U`'s `targets.py` reruns that check).
6. §7 "cross-checked against `gf_lib`'s independent `sector_supply_gf`" is struck (no such call in `f1_main.py`). The closed forms stand on
   `C-F1-U`'s literal validation at 20 small rows.
7. §8 "third independent confirmation … two structurally unrelated algorithms agree", as applied to `maxdef`, is struck: the `maxdef`
   values are a replay of one instrument (ADJ-U's orbit max-flow). The supply/capacity totals are two-instrument. The `maxdef` values now
   also have an independent LOWER bound that meets them exactly (`C-F1-T`'s Identity 3 closed form; below); optimality remains
   single-instrument.
8. §9/§12 "proven combinatorial obstruction" and the verdict `blocked` are narrowed: exhaustive invariant-family enumeration is infeasible
   at both rows; the seeded, structured generating-function search the obligation named was feasible (both critics ran one in seconds)
   and F1 did not attempt it. Typed verdict of record: `not_completed`.
9. §10 "finding" is narrowed to a laboratory record: every row sits at `p = x` (non-eligible) and records `maxdef = max(0, S(T, x))`; the
   "other/sector ratio grows in `m`" is the growth of positive orbit-type counts. My own literal max-flow gives `maxdef = S` = 9, 236 and
   1712 at `CB(3,1)/3`, `CB(3,2)/5`, `CB(4,2)/6`. Nothing in §10 bears on an eligible row.
10. §8 "unique maximizer", "126/128", "227/229" stand as citations of the Cycle 5 record only.

**Obligation status.** Not completed at either site. No cut found; none ruled out for the unrestricted quantifier.

### F2 — `C6-F-02 FIRST-POSITIVE-SUMMAND-ELIGIBLE-ROW`: route verdict `bounded_evidence` RETAINED, narrowed

**The census stands** as a `bounded_computation` record: every free tree of orders 20, 21 and 22 (823,065 / 2,144,505 / 5,623,756),
every eligible `p`, `F_p` derived, per-leaf summand `q_v(p) − q_v(p−1)` on original `H_v`, `R_v`: 8,591,326 trees; 406,262 / 880,489 /
2,959,314 eligible rows; 3,992,600 / 9,557,583 / 34,332,403 leaf-summand rows; maximum 0; minimum −13,260 / −25,194 / −48,450; zero
positive. Evidence:

- F2's own code, replayed by me copy-out at order 20 (PID 90444, 487.6 s): digest `0661a79e…ca47f`, identical to the return.
- `C-F2-T` (WROM generator, own DP) and `C-F2-U` (WROM generator, Kronecker-packed DP, per-support decomposition): each reproduces all six
  numbers at orders 20–22. `C-F2-T` also shows set equality of isomorphism classes with F2's generator at orders 16–20.
- My own instrument (leaf-extension generator with AHU centre canonical forms; own DP; `own/census_small.py`) reproduces the counts of
  orders 13–19 exactly as `C-F2-T` records them (e.g. order 19: 317,955 trees, 143,171 eligible trees, 144,521 rows, 1,419,692 leaf rows,
  925 zero rows, min −7,072; order 16 also equals `C-F2-U`'s `c16.json`).

The order/count erratum R30-E-p is confirmed (A000055: 19 → 317,955; 20 → 823,065; 21 → 2,144,505; 22 → 5,623,756).

**The controller's T_22/34 worry (CF-6) is resolved** by my own instrument: `T_22` is the `T_m` family at `m = 22`, order 91 (`α = 68`,
`x = 32`, window `[34, 45]`, `|F_34| = 67`, `S = −498754180547001418536`); its arm leaf has the unique positive summand, at `p = 34`,
equal to `C(66,33) − C(66,32) = 212336130412243110`; no other favorable leaf of `T_22` has a positive summand at any eligible rank. It is
outside orders 20–22. `C-F2-U`'s positive control shows F2's own `analyze_tree` finds this value when given the tree.

**Struck or narrowed (claim by claim):**

1. "self-test … `count_free_trees(n)` for `n = 1..18` … digest `e21e70e4…`": unbacked by shipped code (`census_f2.py` has no
   `count_free_trees`); `selftest-result.json` is in `c6-F2-replay/`, outside every grant. The fact is true (three independent
   generators).
2. "Every row above carries `x`, `Δ_k`, `α`, `p`, `|F_p|` … and the graph" and "ledger of record … bit-for-bit": struck. The digests
   cover 11–12 summary fields; no per-row ledger exists. Gate-31 row data are met for the witness only. This is the counts-only census the
   allocation asked for.
3. "Leaf 19 is the row with summand exactly 0 … the closest any row … comes to positive": struck. There are 2,955 / 7,679 / 19,926 zero
   rows at orders 20–22, every one trivial (`q_v(p) = q_v(p−1) = 0`, `C-F2-T` R2), and the witness is the degenerate member of the `T_m`
   arm-tag shape (`C-F2-U` F-5). On the ratio scale the nearest non-trivial row at order 22 is `29/36`.
4. "the ready, self-tested `hall_check.py` literal max-flow / (INV)-quotient-flow instrument": "(INV)-quotient-flow" struck (no quotient
   code exists) and the docstring's "asserts supply − capacity = S" struck (not implemented). The literal max-flow is sound (replayed by
   both critics on `K_{1,12}` and the two path-stars; cross-validated on 1,499 instances by `C-F2-U`).
5. Successor hint "two or more such pendant paths, or a longer pendant path": corrected. By the arm-tag identity (below) pendant paths off
   a hub cannot make an arm summand positive; the productive direction is claw-centre hub neighbours.
6. "a successor's horizon starts at order 23": superseded by `C-F2-U`'s order-23 census (critic-attributed; see Established results).
7. "exact integer arithmetic throughout": true for the census; `hall_check.py` passes `float("inf")` as a DFS bound (harmless).

**Scope ruling (F-4 of `C-F2-U`, agreed).** A sign census certifies nothing about (HALL). Its relevance to (CUT) search rests on the
unproved implication "all per-leaf summands ≤ 0 at `(T, p)` ⇒ (HALL-COND) at `(T, p)`". A nonpositive summand is necessary for a per-tag
deletion transport, not sufficient; per-tag transport is the refuted `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`. Using the sign as a
search filter is not a revival.

## Cross-route reconciliation

Paired-critic disagreements, resolved claim by claim (no averaging; replays weighed over self-reports).

**R1 — the `CB(11,2)/16` maximizer's sector part.** `C-F1-T`: the minimal maximizer is exactly the positive-weight `s`-free layer, and
its 268 sector orbits are the whole sector. `C-F1-U` (F-8): "the sector part is a proper subset, which is F1's point, and it stands".
**Ruling: `C-F1-T`.** Evidence, three ways: (i) my copy-out replay of `C-F1-T`'s `maximizer_arms.py` on the copied ADJ-U instrument gives,
at all four laboratories, `Xmin` sector orbits = all sector source orbits (268, 204, 339, 161), `Xmin` = every positive source except those
with arm state `{s}`, and `def(Xmin) = maxdef`; (ii) a hand count: sector sources at `CB(11,2)/16` are `{r, v}` plus 15 column vertices
(each `b` or `c`), so orbit types are unordered pairs of per-choke totals `k₁ + k₂ = 15`, `k ≤ 11`, giving `Σ_{k=4}^{11}(k+1)(16−k)/2 = 268`;
F1's comparison was with LABELLED sets `C(22,15)·2^15`, not orbit types; (iii) my replay of `C-F1-T`'s `orbit_counts.py` reports
`sector_src_orbits = 268`. `C-F1-U`'s regime-3 description ("arm-`{v}` with one U-choke of `γ ≥ g_v`; arm-`∅` with `γ ≥ g_v + 1`; every
two-U-choke source") is correct but not a restriction: `g_v = p − 1 − d` is the size-forced minimum (4, 3, 3, 4 at `d = 11, 9, 10, 12`),
so it describes every positive regime-3 source of those arm states. `C-F1-U`'s sector sentence is struck; `C-F1-U`'s A-2 class misses the
maximizer because it omits the two-U-choke strata (its calibration 69%–99% is consistent with that).

**R2 — F1's verdict.** Both critics narrow `blocked` to "exhaustive search infeasible; seeded search not attempted". Concordant; adopted.

**R3 — §9 and §6 literals.** Concordant (7.899 × 10^48; 477/361 digits); CF-REPLAY-c6a agrees on the integers; my recomputation agrees.

**R4 — `maxdef` independence.** `C-F1-U` strikes "third independent confirmation" for `maxdef`; `C-F1-T` lists the laboratory values as
backed by its own instruments. **Ruling:** both are right about different halves. `C-F1-T`'s Identity 3 is an independent closed form for
the deficiency of one family (`X*`) and equals the orbit `maxdef` at all four laboratories (my replay of `sfree.py`), so the laboratory
values are two-instrument as LOWER bounds; their optimality rests on one instrument (the orbit max-flow). F1's wording stays struck.

**R5 — Lemma 2 (`C-F1-T`) versus A-1 (`C-F1-U`).** Concordant; A-1 is strictly more general (members with `r ∈ B, v ∉ B` allowed; an
`s`-version). Adopted in A-1's form with Lemma 2 as its special case, attributed to both.

**R6 — two structured-class exclusions.** `C-F1-T`'s class `X(σ, arms, [t₀, t₁])` (0 deficient of 63,841 / 88,593 / 59,893 families at
`CB(8,95)/508`, `CB(9,112)/673`, `CB(8,92)/492`) and `C-F1-U`'s class `X(h, g_v, g₀)` (every member negative: 729 and 1,000 members) are
different classes with a concordant conclusion. `C-F1-T`'s class contains every laboratory maximizer (its best member equals `maxdef` at
all four laboratories); `C-F1-U`'s class carries per-choke sector thresholds that `C-F1-T`'s does not. Both replayed (below).

**R7 — "(HALL) has not been tested literally at any row of order ≥ 20" (`C-F2-U`, remaining obligation (b)) versus `C-F2-T` R1.**
**Ruling:** `C-F2-T` ran literal (HALL) at the order-20 witness rows (`p = 11`: 30,940 sources, supply 346,528, capacity 525,096, flow
346,528; `p = 12`: 14,756 sources, supply 179,452, capacity 346,528, flow 179,452; deletion arcs only, no switch arc exists; supply −
capacity equals `S` on both). My copy-out replay of `flow_crit.py` reproduces `witness_flow.json` byte for byte (`76c5282b…`). So two
order-20 rows are literally saturated (critic-attributed, bounded). `C-F2-U`'s statement is narrowed: no ALL-TREES literal (HALL) census
exists above order 19.

**R8 — the successor direction for F2.** Concordant: hubs with arity-3 claws (the `T_m` arm-tag mechanism), not pendant paths.

**Cross-route (F1 × F2).** The two routes meet at one structural point: the only known positive favorable-leaf summands at eligible ranks
come from the `T_m`-type arm tag, and every refuting non-eligible `CB` laboratory (`CB(7,1)/6`, `CB(11,2)/16`) also has a positive arm
summand (`C-F2-U` F-4). My own literal check of `CB(7,1)/6` gives `S = −21`, supply 924, capacity 945, `maxdef = 21`, confirming it
refutes "`S ≤ 0` ⇒ saturation" at a non-eligible rank; `CB(9,2)/13`, `CB(10,2)/14`, `CB(12,2)/17` have `S > 0` and refute nothing of
that form (erratum R30-E-r stands and extends to the latter two).

**Controller facts weighed as one more replay.** CF-0 (orbit spaces), CF-1 (R30-E-p, R30-E-r), CF-6 (naming confusion) and CF-F1/CF-F2
all agree with my replays. I found no controller fact contradicted.

## Established results

Grades are the evidence grades of `SOLUTION-CONTRACT.md` §4. "STATED" means first stated at a review stage: it needs an isolated
second read before registration. Every critic-derived item is critic-attributed.

**Critic-attributed statements with complete informal proofs on the face (STATED; second-read candidates).** I checked each proof
line by line and replayed its validation. Notation: `CB(d,m)` has root `r`, arm support `s`, arm leaf `v`, chokes `u_i ~ r`, supports
`b_ij ~ u_i`, private leaves `c_ij ~ b_ij`; `W_v = {r}`, `W_{c_ij} = {u_i}`; the literal network of SEMANTIC-CONTRACT §1.2.

- **L1 (s-isolation; `C-F1-T` Lemma 1).** On `CB(d,m)`, any `p ≥ 1`, any tag set `F` of original leaves: every positive-weight target
  containing `s` is joined only to sources containing `s`. (Proof: (D) cannot create `s`; (S) at `u = s` needs `r, v ∈ B` and yields
  `B ∖ {r, v} ∪ {s}`, which has no `v` and no `u_i`, so weight 0.) Hypotheses consumed: the `CB` adjacency only; no `IsTree`,
  eligibility or favorability. (The same holds for A1, ID3 and A3 below: none consumes eligibility, `IsTree` or any invariance or
  quotient step; finiteness enters only through the finite layers; ID3 and A3 consume `F` = every leaf, which holds at both eligible
  sites by the literal selector.) My literal check: holds on all 80 (row, `p`, `F`-mode) instances of `own/cb_lit.py`
  (`CB(2,1)`…`CB(4,2)`, every `p ∈ [1, α−1]`, `F` derived and `F` = every leaf).
- **A1 (arm-leaf and arm-support shift; `C-F1-U` A-1, containing `C-F1-T` Lemma 2).** On `CB(d,m)`, any `p ≥ 1`, any tag set `F` of
  original leaves, `Sec = {B : r, v ∈ B}`: if every member `B` of `X ⊆ I_{p+1}` with `r ∉ B` contains `v`, then
  `Σ_X w_F − w_F(N(X)) ≤ Σ_{X∩Sec} w_F − w_F(N(X∩Sec))`; likewise with `s` in place of `v`. (Proof: members with `r ∈ B`, `v ∉ B` have
  weight 0; `B ↦ B ∖ {v}` (resp. `∖ {s}`) is an injective, weight-preserving (D)-arc on the root-free members whose images avoid `r, s, v`,
  while every positive target of `N(X ∩ Sec)` contains `r`, `v` or `s`.) **Corollary:** where every sector subfamily is Hall, a deficient
  family (zero-weight members pruned) contains a root-free member without `v` and a root-free member without `s`. Validation:
  `C-F1-U`'s restricted max-flow at 80 instances (my replay reproduces `RESULT_SHA256 e29d79c5…`; 27 instances non-vacuous) and my own
  check of 6,560 families (random families plus the extremal family, 82 per instance) on 80 instances, 0 failures.
  The use of `B ↦ B ∖ {v}` is a lower bound on `w(N(X))` for a family, not a per-leaf transport; this is not the refuted per-leaf key.
- **ID3 (the `s`-free family; `C-F1-T` Identity 3).** On `CB(d,m)` with every original leaf in `F` and `2 ≤ p ≤ dm`, the family
  `X* = {B ∈ I_{p+1} : w_F(B) > 0, s ∉ B}` has `N(X*) ∩ {w_F > 0}` = every positive `s`-free target, so
  `def(X*) = S(T,p) − Σ_{B ∈ I_{p+1}, s ∈ B} w_F(B) + Σ_{A ∈ I_p, s ∈ A} w_F(A) = S + W_C[p−1] − W_C[p]`,
  `W_C(x) = m d x²(1+x)^{d−1}[(1+2x)^d + x(1+x)^d]^{m−1}`. (Proof: L1 for exclusion; sector targets by adding a column vertex; arm-`{v}`
  targets by adding a vertex, which exists because a maximal root-free configuration has size at least `dm` while the target's has
  `p − 1 < dm`; arm-`∅` targets by adding `v`; activity is monotone under adding vertices.) The hypothesis `p ≤ dm` is load-bearing: my
  literal check finds the identity on every instance with `p ≤ dm`, and its only failures are ten instances with `p > dm`
  (`CB(2,2)/6`, `CB(3,2)/8`, `CB(2,3)/8`, `CB(2,3)/9`, `CB(4,2)/10`, each for both `F`-modes).
- **A3 (the within-stratum criterion; `C-F1-U` A-3).** On `CB(d,m)` with every original leaf in `F`, fix a root-free configuration `σ`
  (its `t` U-chokes and `g` private leaves in them); with `D″ = d(m−t) + 1` and `R = p − t − g`, the within-`σ` deletion network (every
  source and target of weight `g`) is Hall for every subfamily **iff** `3R + 1 ≥ 2D″`. (Proof: the two ranks are ranks `R+1`, `R` of a
  product of `D″` three-element stars; the bipartite shadow graph is biregular (`R+1` down, `2(D″−R)` up), so it has the normalized
  matching property, and the level-size comparison `2(D″ − R) ≤ R + 1` decides.) The normalized matching property of a biregular
  bipartite graph is an elementary double count and must be written on the face at the second read.
- **AT (the arm-tag identity; `C-F2-U` F-5).** On any finite simple graph, if `v` is a leaf whose support `s` has degree 2 with
  `N(s) = {v, r}`, then `q_v(j) = i_{j−1}(G − N_G[r] − v)` for every `j ≥ 1`, so the summand is `Δ_{p−2}(G − N_G[r] − v)`. (Proof: `W_v =
  {r}`; the independent `j`-sets of `H_v` meeting `W_v` are `{r}` plus an independent `(j−1)`-set avoiding `N[r] ∋ s` and `v`.) My check:
  18,979 identities on every free tree of order ≤ 12, 0 failures (`C-F2-U`: 109,982 on order ≤ 14).

**Bounded records (`bounded_computation`; never evidence in a proof).**

- F1 fidelity rows, whole-sector ratios and laboratory reproductions (F1 route decision).
- **The laboratory-maximizer shape is not a cut at eligible rows (critic-attributed, `C-F1-T`).** ID3's closed form gives
  `def(X*) = −0.720274·|S|` at `CB(8,95)/508`, `−0.718881·|S|` at `CB(9,112)/673`, `−0.721292·|S|` at `CB(8,92)/492`, and at most
  `−0.627007·|S|` and `−0.631791·|S|` over the full windows (63 and 75 ranks; every leaf favorable and `S < 0` at every rank). My replays:
  `sfree.py` (also asserting the regime decomposition against an independent bivariate GF), `window_sweep.py` (output identical to the
  shipped file except the timing fields).
- **Structured classes excluded at the eligible sites (critic-attributed).** `C-F1-T`: 0 deficient of 63,841 / 88,593 / 59,893 families
  (also at ranks 509, 510, 570 and 674, 675, 747); literal validation 696 evaluations; my replay adds 372 literal evaluations on a
  different row set (0 mismatches). `C-F1-U`: every one of 729 / 1,000 members negative, maximum at the switch-free sector subfamily
  (`w(N)/w(X)` = 18.37 / 15.88); literal validation 2,628 evaluations, my replay reproduces `RESULT_SHA256 2a0fa83a…`. `C-F1-U`'s
  `famclass_run` `RESULT_SHA256` (`8b975dd8…`) hashes a timing field and is not reproducible by construction; every mathematical field of
  my replay equals the shipped `famclass_out.json`.
- **Strata at the eligible sites (critic-attributed, `C-F1-U`).** Strata failing A3's criterion: 9,793 (23.9% of regime-3 supply) at
  `CB(8,95)/508` and 15,097 (26.9%) at `CB(9,112)/673`, smallest failing `g` for `t = 1..4`: 6, 10, 15, 19 and 6, 11, 16, 21; every whole
  `t`-stratum has negative deficiency, thinnest at `t = 1` (capacity/supply 1.00495 at `CB(8,95)/508`, 1.00298 at `CB(9,112)/673`).
  Replayed (`a75a1375…`, `ab90c249…`).
- **Census, orders 20–22** (F2; three instruments plus my order-20 replay and my orders-13–19 instrument). **Order 23** (critic-attributed,
  `C-F2-U`): 14,828,074 trees; 9,327,580 eligible trees; 10,107,371 rows; 116,670,944 leaf rows; max 0; min −90,440; zero positive.
  My copy-out replay of `C-F2-U`'s `census.py` (PID 90446, 1,079 s) reproduces the summary digest `8c29bd19…47b3` exactly. This is a replay of ONE instrument;
  order 23 has no second instrument.
- **Literal (HALL) at the two order-20 witness rows** (critic-attributed, `C-F2-T` R1; replayed byte for byte).
- **Smallest positive-summand rows in searched families** (critic-attributed): among path-stars with arities 1–7 and `n ≤ 91`, and in
  `C-F2-U`'s hub families (orders 24–93) and radius-2 trees (`n ≤ 34`; branch sizes ≤ 5 to `n ≤ 74`), the first positive eligible row is
  `T_22/34` at `n = 91`. Not replayed by me; single-instrument per family.
- **"All summands ≤ 0 ⇒ (HALL-COND)" holds on every free tree of order ≤ 14 at every rank with nonempty `F_p`** (critic-attributed,
  `C-F2-U`): 23,728 instances, 6,194 literal (HALL) failures, all with a positive summand. My own instrument (own generator, own DP, own
  Dinic, `supply − capacity = S` asserted from independent sides) reproduces exactly 23,728 / 6,194 / 0 (`own/nonpos14_adj.txt`). This is
  support for a conjecture, not a theorem; most of these ranks are non-eligible.

**Conditional reductions, compiled declarations, imported results.** None in this portfolio. No Lean was built; no `#print axioms` output
exists to confirm. (LIFT) and the completeness key are used only to read orbit `maxdef` as the global maximum; neither supplies
feasibility.

## Rejected and narrowed mechanisms

- **No refuted mechanism is revived.** F1 computes the literal min-cut of the literal network; F2 computes a scalar; L1, A1, ID3 and A3
  are statements about family deficiencies in the literal network, and A1's deletion map is a lower bound for one family's neighbourhood,
  not a transport rule. No closed region is re-proved; no census value enters a proof; no RTree wording; the primary aggregate is
  untouched.
- **The `CB(11,2)/16` maximizer shape as a cut at eligible rows: excluded** at `CB(8,95)/508`, `CB(9,112)/673`, `CB(8,92)/492` and across
  both windows (bounded, via ID3's closed form).
- **"Deficient mixed families can be built from sector plus arm-`{v}` sources": refuted** by A1 (STATED); any cut must use root-free
  members lacking `v` and lacking `s` (e.g. arm-`∅`), wherever the sector is Hall.
- **F1's "blocked by a proven obstruction": narrowed** to a method limit of exhaustive enumeration.
- **F2's pendant-path successor hint: rejected** (AT).
- **"All per-leaf summands ≤ 0 ⇒ (HALL-COND)": not established.** Bounded support to order 14 only; it may not be used to extend any
  literal saturation record.
- **Deficient cut record (protocol check 7).** Horizons attained: F1 — none for the unrestricted quantifier; two structured classes
  exhaustively evaluated at the two sites (critic-attributed). F2 — sign census to order 22 (seat) and 23 (critic); literal (HALL) at two
  order-20 rows. **No candidate deficient cut satisfies SEMANTIC-CONTRACT §1.2 anywhere in this portfolio.** The fidelity record is clean
  (weight `w_F`, relation (D) ∪ (S), `F` fixed at rank `p`, `x` through `α`, `supply − capacity = S` asserted from independent sides) for
  every transport number I rely on; F2's census numbers are summand data, which is all they claim.

## Lean readiness

- **(WID) at SOLUTION-CONTRACT §2's statement** is already `formally_verified` (its own governed award in Cycle 1); nothing in this
  portfolio touches it, and no F item re-proves it.
- **No restricted-scope Hall theorem exists in the F portfolio.** F1 and F2 produced bounded records only.
- **Outcome-B candidates (critic-attributed).** For each: (a) a complete informal proof at statement level with a closed dependency DAG —
  yes for L1, A1, ID3 (with `2 ≤ p ≤ dm`, every leaf in `F`), A3 (with the normalized-matching step written out) and AT; (b) compiled
  fragments — none; (c) open nodes — the isolated second read (all five are STATED); for L1, A1, ID3, A3 a Lean definition layer for
  `CB(d,m)` (none exists among the carried award texts, which define `G_k` and the first-interior layer); for AT none beyond the carried
  entries 10–18 (`indepSetCount`, `taggedFamily`, leaves and supports).
- **Ruling: no award group of orientation F is contract-ready for the terminal Stage 7.** L1, A1, ID3 and A3 are reductions that confine
  where a cut can live; none closes a clearly identified part of (HALL) by itself, so none meets the Tier 2 bar of SOLUTION-CONTRACT §1
  in this cycle. AT is Lean-feasible now at the statement
  `∀ j ≥ 1, (taggedFamily G (univ ∖ H G v) (R G v) j).card = indepSetCount G (insert v (insert r (G.neighborFinset r))) (j − 1)` under
  `IsGraphLeaf G v`, `support G v = s`, `G.neighborFinset s = {v, r}` (guarded ℕ form; `j − 1` with `j ≥ 1`), but it is an elementary
  identity that signs nothing; I do not recommend spending a terminal Stage 7 slot on it. A bounded result never qualifies.
- **Key-name notes for the synthesis (if any item is registered after its second read).** `C-F1-T`'s candidate
  `E993-R30-CB-EVERY-LEAF-FAVORABLE-S-FREE-POSITIVE-SOURCE-FAMILY-DEFICIENCY-IDENTITY` names a kind, not a predicate (ruling 48); a
  predicate form would read, e.g., `E993-R30-CB-ARM-SUPPORT-FREE-POSITIVE-SOURCE-FAMILY-DEFICIENCY-EQUALS-AGGREGATE-PLUS-ARM-SUPPORT-LAYER-WEIGHT-DROP`.
  `C-F1-U`'s candidate for A1 is predicate-shaped. Registry text must avoid the alias patterns of ruling 48 (in particular the phrase
  "deletion injection", which A1's proof tempts). The run-local alias check is owed.
- **Smallest unproved lemma for the F object** (the mixed-family question at the switch-necessary rows): `C-F1-T`'s reduction
  `def(X) ≤ def(X ∩ Sec) + def_C(X ∖ Sec)` on `CB(d,m)` up to the two coupling channels (the sector switch image, and the `r`-switch from
  arm-`{v}` sources with two U-chokes), together with Hall of the root-free configuration network at levels `p+1 → p` and `p → p−1`. With a
  sector certificate at a row, this would give whole-row (HALL) there. It is a proposal (STATED as an object), with no proof on any face.

## Progress and plateau assessment

material_progress: yes

orientation_plateau: no

The seats alone delivered bounded records (F1 did not run its central search; F2 completed its census with zero positives). The
orientation's progress is critic-attributed and real at the adversarial level: (i) the one mixed-family shape that was known to be
deficient on non-eligible laboratories is identified (bounded replay at four laboratories) as the whole positive `s`-free layer, whose
deficiency ID3 (STATED) gives in closed form; that family is non-deficient, by about 72% of `|S|`, at both uncertified eligible sites and
across their windows; (ii) A1 and L1 (STATED) confine any cut at a row with a
sector certificate to families that use root-free members lacking `v` and lacking `s`; (iii) A3 locates the root-free strata (about a
quarter of regime-3 supply) where a cut would need outlets; (iv) the positive-summand horizon is order 23 and the only known eligible
positive summand sits at order 91, with AT explaining why. These are new adversarial findings and new lemmas that reach
`proved_informal` if their second reads confirm them, so the plateau condition of SOLUTION-CONTRACT §5 is not met. No decisive event: no
(HALL) award and no (CUT). The stop gate does not bear further; this is the last cycle under the ceiling.

## Headline assessment

headline_resolved: no

status: still_open

Per statement, at this orientation's evidence grade:

- **(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: still_open at full scope. No deficient cut replayed; no complete proof.
- **(WID)**: already `formally_verified`; unchanged by this portfolio.
- **Outcome-B candidates:** L1, A1, ID3 (at `2 ≤ p ≤ dm`, every leaf in `F`), A3 and AT: proofs checked by me at statement level and
  validated literally; grade STATED until an isolated second read, then `proved_informal`. None is a (HALL) statement.
- **"All summands ≤ 0 ⇒ (HALL-COND)"**: conjecture; bounded support to order 14.
- The primary aggregate is untouched.

## Next-route allocation

**Exact remaining obligation (orientation F).** (HALL-COND) for EVERY `X ⊆ I_{p+1}` at the uncertified switch-necessary eligible `CB` rows
(218 entering Cycle 6, fewer if the T orientation's Cycle 6 certificates are confirmed — not in my capsule), in particular at
`CB(8,95)/508` and `CB(9,112)/673`; by the completeness key, equivalently for every `Aut`-invariant family of positive-weight sources.
Given a sector certificate at a row, A1 (after its second read) restricts the search to families containing root-free members that lack
`v` and lack `s`. Outside `CB`, the smallest eligible row with a positive per-leaf summand is unknown in orders 24–90; `T_22/34` (order 91)
is the smallest known, and (HALL) there rests on the frozen quotient-flow record.

Successor routes (the run proceeds to its terminal close; these are inheritance, not a Cycle 7):

1. **Per-choke-state mixed-family search at the two sites, with a reduction attempt.** Extend `C-F1-T`'s per-choke GF evaluator with
   marked per-choke state polynomials so families may select individual states inside an (arm, `t`) class: sector subfamilies with
   per-choke thresholds jointly with cascade-closed root-free strata that fail A3's criterion, validated literally on small rows first.
   Could close in one cycle: either a (CUT) candidate at `CB(8,95)/508` or `CB(9,112)/673` (then two instruments and a second read), or a
   proof of the coupling-channel reduction plus configuration-network Hall, which with a sector certificate yields whole-row (HALL) at
   those rows.
2. **Targeted positive-summand search in orders 24–90 by the arm-tag identity.** Enumerate trees having a leaf with a degree-2 support
   whose other neighbour `r` has neighbours whose removal frees many vertices (claw centres and their generalizations, several arms,
   mixed side branches), testing every favorable leaf; at the first hit, literal max-flow AND a written (INV)-quotient flow, recording
   whether switch arcs are load-bearing; run the literal (HALL) check at `T_22/34` itself as the first positive control. Could close in
   one cycle: the first non-`T_m` positive-summand eligible row and (HALL) there, or a (CUT) candidate; either one also tests the
   conjecture "all summands ≤ 0 ⇒ (HALL-COND)" where it matters.

## Artifact inventory

Deliverable: this file, `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/cycles/cycle-6/stage5/adjudicators/F/ADJUDICATION.md`.

Scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-adj-F/`. All runs used
`python3 -B`; no bytecode written.

| Path (under the scratch root) | SHA-256 | Role |
|---|---|---|
| `own/cb_lit.py` | `da6366e448391cd3…` | own literal CB instrument (L1, ID3, A1, literal max-flow); RESULT 479641fe… |
| `own/cb_lit_out.txt` | `4aa854820fa9939e…` | its output (80 instances) |
| `own/trees.py` | `322b8c967984d094…` | own tree instrument (generator, DP, rows) |
| `own/census_small.py` | `665db654ef7d8d08…` | own census driver |
| `own/census_small19.txt` | `cf0375145a297348…` | orders 13–19 census; RESULT aae4ffa7… |
| `own/checks_f2.py` | `9a4bf741b496a40f…` | T_22/34 positive control, witness, arm-tag identity; RESULT 54cd1e62… |
| `own/nonpos_small.py` | `0ba5c793afc9a2e4…` | own literal (HALL) sweep with summand signs |
| `own/nonpos14_adj.txt` | `7ae6e44df8baff5f…` | n ≤ 14: 23,728 / 6,194 / 0; RESULT ab0902ef… |
| `runs/f2_order20.json` | `9e86669bdf90e8df…` | F2 order-20 replay (digest 0661a79e…) |
| `runs/cF2U_c23.json` | `999b8e936d06e92c…` | C-F2-U order-23 replay (digest 8c29bd19…) |
| `runs/cF2U_c23.log` | `bf590e7f1f3c9f15…` | its log |
| `f1/f1_main_output.json` | `b15d3069083e63c9…` | F1 replay output (= shipped b15d3069…) |
| `cF1T/sfree_out.json` | `82c7799e268528f2…` | ID3 at labs and eligible rows; RESULT ee954819… |
| `cF1T/maximizer_arms_adj.txt` | `b71ddbb1b8987931…` | Xmin arm split at four labs; RESULT f265b7c9… |
| `cF1T/famclass_out_adj.json` | `c307535a8bedd2b7…` | C-F1-T class scan; RESULT ff0fa2c5… |
| `cF1T/window_sweep_out.json` | `703ceb47e48ddf13…` | window sweep (differs from shipped only in timing fields) |
| `cF1U/famclass_out.json` | `6f498e827075b542…` | C-F1-U class scan (differs from shipped only in timing fields) |
| `cF2T/witness_flow.json` | `76c5282b91b6b9f7…` | C-F2-T witness flows (= shipped 76c5282b…) |
| `f1/`, `cF1T/`, `cF1U/`, `f2/`, `cF2T/`, `cF2U/` | as shipped | copy-out replays of the seat and critic scripts (two `sys.path` lines rebound) |
| `runs/*.pid`, `runs/f2_order20.log` | — | literal PIDs 90444 and 90446 and the order-20 log |
| `ADJUDICATION.draft.md` | — | working draft of this file |

Other replay results (stdout only): `f1_main.py` `e2c9e99f…`; `vshift_validate.py` `e29d79c5…`; `C-F1-U` `famclass_validate.py`
`2a0fa83a…`; `C-F1-T` `famclass_validate.py` on my row set `943b66d4…` (372 checks, 0 mismatches); `strata.py` `a75a1375…`;
`tlevels.py` `ab90c249…`; `targets.py` `1c11b4b5…`; `orbit_counts.py` `9f196c09…`. Background jobs: none running at this write.
