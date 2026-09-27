# Cycle 5 Neutral Synthesis

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 5, Stage 6 (neutral synthesis), 2026-09-27. Object:
(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, correctly weighted mixed-boundary transport for the remaining ordinary-tree
lower-region aggregate. This is the fifth of six cycles.

**Boot.** I am operating within VerityOS. I booted by reading exactly two VerityOS files, in this order: the root constitution
`verity.md` and the identity subsystem's `startup-protocol.md`. I loaded no other VerityOS subsystem (no memory, knowledge,
conversations, decisions, logs, modules or skills). The host placed the project `CLAUDE.md` and the user's auto-memory index into
my context at session start. I did not act on either. In particular I kept no conversation log, because the dispatch confines my
writes to this file and my scratch.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

**Dispatch.** `control/dispatch/c5-stage6/DISPATCH-SYNTHESIS.md`. I recomputed its SHA-256 as
`019dfda1842123e29a94f61fbdb53d03c6bca1f5edcd868ece2dc8a05512d1f4` before reading it, and it matches the pointer.

**Seals and digests.** All recomputed by me with `python3 -B` (`scratchpad/c5-S/verify_seal.py`, `verify_more.py`). Canonical
JSON throughout: without `seal_sha256`, `sort_keys`, separators `(",", ":")`, no trailing newline.

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Stage 6 dispatch capsule `control/C5-STAGE6-DISPATCH-MANIFEST.json`, inner seal | `9d5e84e250a46035e53926469dc2fcdb2e4b455ae71ab5e8038a67a953476bb0` | same | **match** |
| Its 12 members (bytes and SHA-256) | as listed | recomputed | **12/12 match** |
| Stage 5 packet manifest `control/C5-STAGE5-PACKET-MANIFEST.json`, inner seal | `ccfc7121339bbdd0079768cb5accde9cdfa7be508b02bf3cd370795bbb27f7df` | same | **match** |
| Its 69 members (bytes and SHA-256; see disclosure 2) | as listed | recomputed | **69/69 match** |
| `control/SOURCE-DIGESTS.json` (981 files under `sources/`) | as listed | recomputed | **981/981 match**, none missing |
| The five subtree digest records under `sources/` (`c1`–`c4-stage7-sources`, `heterogeneous-closure`) | 11 + 6 + 10 + 217 + 121 = 365 | recomputed | **365/365 match** |
| `control/PATH-CHECK-c5-stage6-dispatch.json` | 11 files scanned | read | 0 findings |

The three adjudications are at the capsule digests: T `df709e72…`, F `3e098eff…`, U `b641724e…`. Each adjudicator reports its
own capsule seal and the upstream seals. I cite these values and did not recompute them, because the capsule manifests are not
in my grant:
- capsule seals: T `ca02804a…`, F `a75ea8f8…`, U `784f4eef…`;
- upstream seals, identical in all three: Stage 2 `2e8e3d44…`, Stage 3 `01bf6099…`, Stage 4 `b7b0bced…`.

A file count under `sources/` gives 1,351 files. That is the 981 + 365 digested files plus the five subtree digest records.
CF-2's figure of 1,229 is the Stage 2 count, which excludes the 122 files of `sources/heterogeneous-closure/` frozen later; this is
consistent. No bytecode is present under `sources/`.

**Clone residue and record discrepancies (ruling 44).** None changes a mathematical conclusion.
1. `control/C5-SYNTHESIS-PROTOCOL.md` duty 4 proposes "`C5-LA1` (WID)". (WID) has been `formally_verified` since Cycle 1. I read
   this as clone residue and reuse the label `C5-LA1` for this cycle's first award group.
2. Duty 6 says "write the Cycle 5 portfolio", and the gloss of the continuation flag says a yes "means Cycle 5 runs". Both are clone residue
   for **Cycle 6**. I resolved them by the dispatch, which asks for the next-cycle portfolio.
3. The protocol says the stop gate has been ARMED "since the Cycle 1 close (C2 gate ruling 20)". `SOLUTION-CONTRACT.md` §5 says
   "ARMED from the Cycle 2 close per the unarmed-early rule". The allocation and the gate agree with the protocol. The difference
   is immaterial, because the gate is ARMED now under either reading.
4. The label `C5-LA1` collides lexically with the carried first-interior Lean namespace `C5LA1.*` (for example
   `C5LA1.crossingIndex`), which is a predecessor run's award label carried in the definition layer. Registry text must name this cycle's award by **key only** (ruling
   41), and the formalizer must not open a namespace `C5LA1` for new declarations.
5. Controller errata R30-E-j, R30-E-k, R30-E-m and R30-E-n are confirmed on the adjudicators' evidence. R30-E-m and R30-E-n are
   carried under *Registrations*.

**My read-boundary and process disclosures.**
1. I read the boot pair, the dispatch, the protocol, the 12 capsule members, and files under `sources/`. Under `sources/` I read
   `authority/CLAIM-IDENTITY.json` (the frozen 434 master, for the alias screen), `authority/`'s listing, and the metadata and
   file names of `c4-stage7-sources/SOURCE-DIGESTS.json`. I ran digest verification over everything under `sources/`, and a
   `find sources -type f` count and a depth-one listing of `sources/` and `sources/heterogeneous-closure/`. All of this is within
   the `sources/` grant.
2. **Disclosure.** To verify the Stage 5 packet seal, my script computed byte counts and SHA-256 digests of all 69 members of that
   manifest. Some of those files are outside my read list: the U2 return, Cycle 4 critiques and adjudications, the `SR-C4-*`
   second reads, the C3-LA1 run reports, controller facts per orientation, and the capsule manifests. I opened none of them. No
   content was displayed or used; the check compared digests only. This is the same class as C-T1-F's Cycle 5 digest-only item.
3. The harness saved the display of the controller-facts JSON to a tool-results file outside the run root, and I read it back from
   there. It is the same content as the capsule member (`dde51894…`); it is not a separate source.
4. I made no search rooted above my grant, used no network, installed nothing, and ran no Lean/lake. Every Python run was
   `python3 -B`, in the foreground. **I started no background job, so there was nothing to kill.**
5. The run-local registry `control/CLAIM-IDENTITY.run-local.json` is **not** in my grant. My alias screen therefore covers the
   frozen 434 master in full, but only the 14 of the 19 run-local keys whose names appear in my authorized files. The complete
   run-local screen is owed by the controller (see *Registrations*).

## Reconciliation

I reconcile the three admitted adjudications claim by claim. There is no majority vote, and no lower tier is consulted to settle
a disagreement. The controller's Stage 6 facts (CF-*, CF6-*) are one more instrument, never authority.

**R-1. Ruling 39, letter (b′), first half: whole-row (HALL) at `G(8^82, 7^2)` (T2).**
- *T position.* Retained at `computer_assisted`, STATED.
  - Four instruments: T2's exact LP; C-T2-F's DP plus a literal laboratory on the actual row; C-T2-U's convolution powers plus
    small literal labs; the adjudicator's affine path, convolution and 30/30 + 30/30 literal lab.
  - Conditional on E1-R's registered **load clause**, which no T instrument could audit, because the run-local registry was not in
    the T capsule (CF6-8, erratum R30-E-n).
- *F position.* F does not see T2's half and does not contest it.
- *U position.* U has no evidence on it.
- *Ruling.* No disagreement. The half stands at `computer_assisted`, STATED, **conditional on** (i) an isolated second read of the
  zero-slack certificate as data and (ii) confirmation of E1-R's load clause against the frozen registry snapshot.

**R-2. Ruling 39, letter (b′), second half: an infinite eligible family at `proved_informal`.**
- *F position.* F supplies E-1, critic C-F2-U's A7: deletion-arc (HALL) on the spider `S(1,2,3^k)` for every `p ≥ k+2` and every
  tag set `F ⊆ leaves`. ADJ-F verified it in full and discharged the de Bruijn–Tengbergen–Kruyswijk dependency by an explicit
  hook partition.
- *U position.* U rules (b′) "No" on U's own evidence: `G_k` is the family already of record, so GK-MONO widens its rank scope and
  is not a second family.
- *T position.* T has no second family.
- *Ruling.* These positions do not conflict. U's "No" concerns `G_k`. F's candidate is a different, non-isomorphic family:
  `S(1,2,3^k)` has `n = 3k+4` and a single cherry leaf at the support of the length-two leg, while `G_k` has `n = 3k+5` and a
  two-leaf cherry.
  - The allocation names "`G_k` variants with 1 or 3 cherry leaves" as F2's object.
  - Ruling 39 (b′) names "a second infinite eligible family at `proved_informal` (F2's object)".
  - So E-1 is by the controller's own letter a qualifying candidate.
- *My own check.* I verified the proof. My instrument `syn_check.py` also gives:
  - literal deletion-only max-flow saturates at every eligible rank for `k = 5, 6, 7`, with `F = F_p` derived and (WID) two-sided;
  - `x(S(1,2,3^k)) = k+1` for `5 ≤ k ≤ 120`.
- *Standing.* The candidate is STATED, and its registration awaits an isolated second read (SR-C5-2).
- *Synthesis observation.* The **minimal** (b′) statement does not need ADJ-F's N3b (`x = k+1`). Here is why:
  - The flow holds for every `p ≥ k+2`.
  - `α = 2k+2` (clique cover plus explicit set).
  - `x ≤ k+1` is **proved** for every `k`: by palindromy `e_{k+2} = e_{k−2}`, the descent identity reduces to
    `Δ_{k+1} = (e_{k−2} − e_k) − k·2^{k−1}`, and unimodality of `(1+3y+y²)^k` makes the bracket `≤ 0`.
  - So `{(S(1,2,3^k), k+3) : k ≥ 5}` is an infinite eligible family on which (HALL) holds.
  - N3b only upgrades this to "every eligible rank".

**R-3. The `G_k` scope of record (U versus controller fact CF-5).**
- *U position.* The registered eligibility key `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`
  states eligibility at the single rank `p = k+3`, which needs only `x(G_k) ≤ k+1`. The statement that no eligible rank lies below
  `k+3` needs `x(G_k) ≥ k+1`, which is of record only as a bounded census (`k ≤ 400`). The controller concurs (CF6-6, erratum
  R30-E-m).
- *Ruling.* I adopt it. The registered restricted scope is "(HALL) at every **eligible rank `p ≥ k+3`** of `G_k`, `k ≥ 3`". The
  widening to every eligible rank is new, and it is exactly GK-MONO. The confirmation against the key's face is owed by SR-C5-3,
  because the registry is outside every Stage 5 and Stage 6 capsule.

**R-4. The switch-necessary frontier (T, F, controller).**
- *T.* 54 uncertified rows lie in T1's rectangle. At 49 of them the first eligible rank is the top sector-deficient ("band") rank.
- *F.* 223 sector-deletion-deficient (switch-necessary) eligible CB rows exist for `d ≤ 13` in the census ranges, and 218 of them
  are uncertified. Every one sits at its **first** eligible rank.
- *Controller.* CF6-7 adds that from `m = 161` on, `CB(8,m)` has a **second** deficient rank, and only the top one, `p*`, is in the
  E1 band.
- *Ruling.* These agree. F's "always at the first eligible rank" holds within F's census horizon (`d = 8`, `m ≤ 160`). ADJ-T's
  band family `𝒞_8` coincides with first ranks for `106 ≤ m ≤ 160` and uses non-first ranks beyond that. The gate's "the one open
  switch-necessary eligible row on record is `G(8^82,7^2)/448`" was a statement about the **record**, not the class (CF-6).

**R-5. Allocation step (L-i) of T1.**
- *T position.* It is false at first eligible ranks: `CB(8,161)/859` is the first failure, and every switch-necessary `CB(8,m)`
  first rank past `m = 211` fails. The evidence is two critic instruments, the adjudicator's replay, and the failure half of
  C-T1-U's rank-threshold lemma.
- *T narrowing.* C-T1-F's "only a `d`-growing diagonal class" becomes "at first eligible ranks": at the top-deficient rank a
  fixed-`d` family exists (bounded to `m ≤ 300`).
- *F and U.* No contrary evidence.
- *Ruling.* I accept both.

**R-6. Sector analysis and competition (F and U).**
- *F position.* The CB full sector, and every tested invariant sector family, is non-deficient, with switch rescue at least
  4401.47 times the deletion deficit. F warns that sector non-deficiency is not a flow, because competition with non-sector sources
  is untested.
- *U position.* U supplies the laboratory showing why: at `CB(11,2)/16` (non-eligible, `S < 0`) the sector alone is Hall-feasible,
  but the whole network is deficient by 22,458,436. The unique maximizer mixes 268 sector orbits and 140 regime-3 orbits.
- *T position.* T's certified rows handle competition by composition: E1/E1-R is deletion-only, it loads `r`-free targets at
  `ρ·w`, and the sector's switch images are capped at `(1 − ρ)·w`.
- *Ruling.* Consistent. Certified rows are certified whole-network; uncertified rows are not certified by any sector-only test.
  This fixes where a (CUT) could live (F-R1 below).

**R-7. What F1 and F2 study (F, cross-route).** ADJ-F's identity: on `CB(d,m)`, sector supply minus sector deletion shadow equals
the arm leaf's own summand `q_v(p) − q_v(p−1)`. It is elementary and I re-derived it from `q_v(j) = 2^{j−1}·C(dm, j−1)`. So a CB
row is switch-necessary exactly when the arm tag has a positive summand. That is where per-tag deletion injection fails by
counting. No orientation disputes this.

**R-8. The per-tag mechanism against the refuted keys (F).** F2's return claimed that no refuted key concerns per-tag deletion
injection. ADJ-F byte-compared the claim against `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`: F2's per-tag bipartite graph
is the support graph of that key's map `d_p`, so the per-tag criterion is its weaker combinatorial shadow. A universal per-tag
statement is refuted by counting at `T_22/34` (C-F2-U A5). I adopt ADJ-F's corrected distinction. Family-scoped use (E-1, the
`G_k` flow) revives nothing.

**R-9. Minor paired disagreements, all resolved by adjudicator replay.**
- `n(CB(8,2))` is 37, not 35 (U).
- C-F1-T's surplus figure "about 3,000" is replaced by the exact 4401.4666 (F).
- The U1 axiom literal holds for 3 of 26 declarations, not all, and every declaration stays within the permitted three axioms (U).
- `Δ_{k+1}(G_k)` holds from `k = 0` (U).

## Exact established results

Grades follow `SOLUTION-CONTRACT.md` §4.
- "STATED" means first stated at a review stage (a critic, an adjudicator, or me). A STATED item needs an isolated second read
  before registration.
- A composition takes its weakest input's grade.
- "Seat" means a Claude Sonnet 5 route seat; "critic" means a Claude Opus 5.5 critic; "ADJ-X" means the Claude Opus 5.5
  adjudicator of orientation X.

**New restricted-scope (HALL) statements (all STATED).**
1. **Rank 448 of `G(8^82, 7^2)`, switch arcs load-bearing.** (HALL) at `G(8^82, 7^2)`, `p = 448`, with switch arcs load-bearing.
   - Grade: `computer_assisted`.
   - Tree data: `n = 1427`, `α = 755`, `x = 446` (through `α`), eligible window `[448, 503]`, `F_448` = all 671 leaves (derived).
   - Certificate: the reduced-capacity choke-local sector certificate, `θ*_7 = 0`, `θ*_8 = 384/1832557`, minimum outflow 1,
     maximum inflow 1 (zero slack). It is composed with E1-R
     (`E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, `proved_informal`, including its
     load clause) and the finite E1-R criterion (248 types × 56 ranks, 0 failures, maximum
     `ρ = 5327002801984/5350924042653`).
   - Integrality comes from (HALL⇒FLOW) (C1-LA2).
   - Attribution: T2 (seat); literal validation C-T2-F, C-T2-U; replay ADJ-T.
2. **Ranks 449–503 of `G(8^82, 7^2)`.** Deletion-only (HALL) at every rank in 449–503.
   - Grade: `computer_assisted`.
   - Inputs: CD-1 (`E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` at `q_i ≡ 2`, `M = 670`) and E1-R, plus finite checks.
     448 is the unique sector-deficient rank.
   - Attribution: T2; critics; ADJ-T.
   - Items 1 and 2 together give (HALL) at every eligible rank of `G(8^82, 7^2)`, the first non-CB tree with a switch-arc
     certificate. That conjunction is a scope note on (HALL), not a key.
3. **(E-1) Spider `S(1,2,3^k)`.** Deletion-arc (HALL) for every `k ≥ 1`, every `p ≥ k+2`, and every `F ⊆ leaves`.
   - Grade: `proved_informal`, STATED.
   - Tree: root 0, pendant leaf 1, pendant path `0–2–3`, and `k` pendant paths `0–a_i–b_i–c_i`.
   - Proof: per-tag chain-predecessor injections (hook partitions of chain products; tip, leaf-1 and cherry-leaf classes) and the
     per-tag sufficiency lemma E-2.
   - Companions on the face:
     - `α = 2k+2`;
     - `x ≤ k+1` for every `k` (proved; R-2);
     - eligibility of `p = k+3` for `k ≥ 5`;
     - `x = k+1` for `k ≥ 5` (N3b; ADJ-F; STATED);
     - hence (HALL) at every eligible rank for `k ≥ 5`.
   - The rows lie in the unresolved band: `2p+3 ≤ n = 3k+4 ≤ 4p−8` at `p = k+3`, `k ≥ 5`.
   - Attribution: the theorem to C-F2-U (critic); E-2 to F2 (seat); the hook discharge and N3b to ADJ-F; the pair-spider closed form
     `E993-PAIR-SPIDER-CLOSED-FORM` (VERIFIED) as an input.
   - My instrument agrees at `k = 5, 6, 7`. At `k = 5`, `p = 8`: supply 3125, capacity 6100, `S = −2975`, deletion-only max-flow
     3125.
4. **`G_k`, every eligible rank.** (HALL) at every eligible rank of every `G_k`, deletion arcs sufficing.
   - Grade: `proved_informal`, STATED; it is a composition.
   - Inputs:
     - C4-LA1 (`E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET`,
       `formally_verified`);
     - GK-MONO (item 5);
     - `favorableLeaves ⊆ leafSet`.
   - The eligible set is nonempty iff `k ≥ 3`, using `α(G_k) = 2k+3` (SR-C4-8).
   - Attribution: ADJ-U (composition); C-U1-F (Lean reduction, compiled scratch).

**New lemmas at `proved_informal` (STATED unless marked retained).**
5. **GK-MONO.** For every `k ≥ 0`, `i_0(G_k) ≤ … ≤ i_{k+1}(G_k)`, and `8·Δ_{k+1}(G_k) = −2^k(k²+3k−8)`. Hence `x(G_k) = k+1` for
   `k ≥ 2`.
   - Two distinct proofs: C-U1-T via Newton's inequalities (classical, named) and C-U1-F by an elementary binomial-row chain (the
     proof of record for Lean). ADJ-U compared them step by step.
   - My instrument confirms the inequalities and the formula for `k ≤ 120`.
6. **E1 rank-threshold lemma on `CB(d,m)`, `d ≥ 6`** (C-T1-U).
   - Statement: with `μ_1 = (4dm − d + 1)/6`, E1 condition (i) in cleared form holds for every `q ∈ [1, m]` at every
     `p ≥ ⌈μ_1⌉ + 2`, and fails at `q = 1` for `2 ≤ p ≤ ⌊μ_1⌋ + 1`. The single rank `⌈μ_1⌉ + 1` is undecided.
   - Grade: `proved_informal` **modulo Darroch (1964)**, a classical dependency not under `sources/`.
   - ADJ-T checked it step by step and against exact checks at 8 rows.
7. **Sector sufficiency for `d ≤ 6`** (C-T1-F). For `d ≤ 6`, `3x(CB(d,m)) ≥ 2dm`, so the sector is deletion-sufficient at every
   eligible rank. Grade: `proved_informal` modulo Darroch, at the grade of `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`.
8. **`α(CB(d,m)) = 1 + m(d+1)`, `m ≥ 1`** (C-T1-F, C-T1-U; two proofs). A companion fact; it needs no key unless a CB-class theorem
   cites it.
9. **Sector non-eligibility on `CB(1,m)`** (U2 structure plus the critics' proof). `CB(1,m)` has no eligible sector-deficient rank
   for any `m`: `x ≥ ⌊(2m+2)/3⌋ + 1` for `m ≥ 5`. Grade: `proved_informal` (sector only; not (HALL)). The unimodality of the
   log-concave symmetric `(1+3y+y²)^m` is named as a dependency.
10. **Retained records, not keys.**
    - New Lemma 1, the three-regime weight decomposition (U2; re-proved by both critics; `proved_informal`).
    - The sector `supply`/`cap_D`/`SW` closed forms at `1 ≤ K ≤ D` (U2; `proved_informal`, a record refining B9X).
    - The per-tag sufficiency lemma E-2 (elementary, companion).
    - The arm-summand identity of R-7 (ADJ-F; elementary).
    - The mean identity `2d/3 − μ(d) = 2^d(d−6)/(6(2^d+3^d))` (T1 critics; proved).

**Bounded records** (`bounded_computation`; never evidence in a proof; critic-attributed and replayed where stated).
11. **The switch-necessary CB frontier.**
    - 223 sector-deletion-deficient eligible CB rows for `d ≤ 13` in the census ranges: `d = 7…13` → 24, 52, 49, 30, 9, 49, 10;
      none for `d ≤ 6`.
    - Four instruments: C-F1-U, C-F1-T (the `d ≤ 11` part), ADJ-F, and CF-REPLAY-c5b.
    - 218 are uncertified. The smallest are `CB(8,95)/508` (`n = 1618`) and `CB(7,109)/510`.
    - Full-sector Hall holds on all 223, with switch/deficit at least 4401.4666 (minimum at `CB(9,112)/673`).
12. **The top-deficient-rank family** (ADJ-T; CF-REPLAY-c5d).
    - `𝒞_8 = {(CB(8,m), ⌊(16m+4)/3⌋) : m ≥ 106, m ≢ 1 (mod 3)}`. On it the rank is eligible, sector-deficient, all-leaves-favorable
      and E1-exact, checked to `m = 300`.
    - The `d = 7` analogue: `m ≥ 142`, `m ≢ 2 (mod 3)`.
    - Every certificate of record sits at this rank.
13. **The E1 first-rank failure frontier.** The first failure is `CB(8,161)/859`; the last `m` whose first rank satisfies E1 is 211
    for `d = 8` and 287 for `d = 7`.
14. **All free trees of orders 13–19, every eligible rank** (C-F2-U to 19; C-F2-T to 18; ADJ-F to 17).
    - Every per-tag deletion injection exists and no leaf summand is positive, so deletion-only (HALL) holds at every eligible row of
      order `≤ 19`.
    - Row counts per order: 163, 313, 528, 2,763, 10,061, 37,295, 144,521.
15. **Full (HALL) at the 169 eligible `CB(d,m)` rows with `d ≤ 5`** (C-U2-F; ADJ-U confirmed a 28-row subset). This includes
    `CB(1,7)/10`, where E1 fails.
16. **Laboratory records at non-eligible ranks.**
    - The whole-network deficiency at `CB(11,2)/16` (22,458,436; `S < 0`), a new instance against the refuted Cycle 3 conjecture.
    - `CB(10,2)/14` and `CB(9,2)/13`.
    - The non-product unique sector maximizers at `CB(10,2)/14` and `CB(12,2)/17`.
    - The `CB(9,1)/7` sector maximum 882.
    - C-F2-T's per-tag failures at orders 8, 10 and 13.
17. **(WID) fidelity.**
    - `G(8^82,7^2)` at all 56 ranks: three independent weight generating functions (C-T2-F, C-T2-U, ADJ-T).
    - `S(1,2,3^k)`, `k = 5, 6, 7`: mine, from literal `w_F` enumeration on one side and `C5LA1.aggregate` via the `H_v`/`R_v`
      deletion polynomials on the other.
    - This is a fidelity check of the `formally_verified` identity, not a new result.

## Refuted or narrowed mechanisms

- **Allocation step (L-i)**, "E1(i) at every eligible rank of `CB(8,m)`, `m ≥ m_0`": **false** at first eligible ranks (R-5). Any
  E1-based uniform switch-arc (HALL) must live at ranks `≥ ⌈μ_1⌉ + 2`, or must replace E1 below them.
- **Per-tag deletion injection as a route to full (HALL): refuted at universal scope.**
  - It fails by counting at every positive-summand eligible row: proved at `T_22/34`, and at the arm tag of all 223 switch-necessary
    CB rows.
  - It is the matching shadow of the REFUTED `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`. It is kept only as a family method.
- **Per-choke threshold (product) form of a maximum-deficit invariant family** (U2's central object): refuted in its product
  reading at `CB(10,2)/14` and `CB(12,2)/17` (non-eligible; bounded). The surviving joint-`j`-up-set conjecture (C-U2-T) is STATED
  only.
- **"Restricting to the root-plus-arm sector is without loss"**: refuted on the laboratory `CB(11,2)/16`.
- **"The whole-sector test certifies or searches for cuts"**: rejected. It is necessary, not sufficient; the true maximum exceeds it
  by a factor of 4.9 in the sector and 12.2 in the full network at `CB(10,2)/14`.
- **F1's small-`m` grid as switch-capacity evidence**: rejected. It contains no switch-necessary row.
- **Narrowed.**
  - T2's "retires the entire known instance frontier": it retires the one uncertified row **on record entering Cycle 5**.
  - "`d ∈ {7, 8}`": switch-necessary rows exist for every `d ∈ [7, 16]`.
  - "Five smallest": `CB(8,95)/508` and `CB(7,109)/510` precede two of the certified rows.
  - The allocation's "two-hop" R8 remedy: a one-hop state-dependent rule clears R8 at equality.
  - U2's "the deletion-only part is one closed-form inequality": this holds for the sector's deletion sub-network only.
- **The regular-bipartite lemma** (U2) is the registered CD-1 at `q ≡ 2`. It is not a new key.
- **Struck literals** of record in the adjudications. They are never to be cited.
  - T1: `F_p` derived, "independent `x`", the ratio match as evidence, "uniform proof".
  - T2: the two-sided `S` check (non-falsifiable), "each with two instruments", "up-degree exactly 448", "9 shared tokens of 9".
  - F1: "17 instances", "(4,2,4) non-deficient", "two empty `F_p`", the §7 exponents, "352-digit", "`S_m × S_d`", the graph field.
  - F2: "every summand strictly negative", "`n` up to 30", "0 matches".
  - U1: "CD-1 type-checks", "`crossingIndex` supplied informally", the axiom literal, the index labels.
  - U2: the hard-coded `1_v = 1_c = 1` as evidence, the exponents, "`cap_D` dwarfs supply", "(WID) asserted", the coverage and
    count literals.
- **Heuristics that stay conjectures**:
  - switch/deficit `≈ (dm)²(2/3)^d/(3(1+j))`;
  - "switch `≥ c·supply` uniformly";
  - "stranded witness needs `p ≤ x+1`";
  - "`x` ≈ mean" behind the `d ≥ 7` onset.
- **No refuted mechanism is revived** by any retained item. Capacities are literal `w_F`, never own-support unit capacity (C6-F4).
  The `G(8^82,7^2)` 449–503 flow and the family flows are restricted-scope deletion flows at the active weight, not
  `E993-R23-LITERAL-DELETE-ONLY-HALL`. There is no per-leaf injectivity (a flow is not linear injectivity), no occupancy, no signed
  cross-tag step and no covariance step. `|F ∩ B|` is never counted.

## Headline verdicts

headline_resolved: no

**(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`: still open at full scope.**
- There is no complete proof, and no deficient cut anywhere.
- Restricted scopes of record, each a SEPARATE key or scope note:
  - `G_k` at every eligible rank `p ≥ k+3` (C4-LA1 `formally_verified` composed with the eligibility key);
  - the five CB rows, every eligible rank (`computer_assisted`).
- New this cycle, STATED:
  - `G(8^82,7^2)` at all 56 eligible ranks (`computer_assisted`);
  - `S(1,2,3^k)` at every eligible rank, `k ≥ 5` (`proved_informal`);
  - `G_k` at every eligible rank (`proved_informal`).
- **Smallest unproved lemma.**
  - Uniform: `(L-S)_top`, closed-form choke-local flows in `m` on `𝒞_8`. Every sector source has outflow `≥ 1`, every in-sector
    target has inflow `≤ 1`, and `(8−γ)σ(γ) ≤ θγ` with `θ ≤ 1 − ρ_(1,8)(p*)`. Its companion is `(ELIG-top)`:
    `x(CB(8,m)) ≤ p* − 2` and all-leaf favorability at `p*`, uniformly in `m`.
  - Instance-level: the same sector certificate at `CB(8,95)/508`, the smallest uncertified switch-necessary eligible row. E1 holds
    there at every `q` by the threshold lemma, since 508 is the band rank.

**Other targets.**
- **(WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`**: VERIFIED, `formally_verified` (Cycle 1). Unchanged; fidelity re-checked
  (item 17).
- **Outcome-B lemmas this cycle.**
  - Proved, STATED: items 5–9.
  - Retained records: item 10.
  - Refuted or narrowed: (L-i); per-choke product form; sector WLOG; universal per-tag injection.
  - None proves a part of (HALL) at full scope. Items 3–4 are restricted-scope (HALL) statements.
- **(CUT)**: none. No eligible deficient cut, and no candidate, exists anywhere in the record.
  - CB sector surplus is at least 4401 times the deficit over all 223 switch-necessary rows.
  - There is no per-tag failure and no positive summand through order 19.
  - All tested invariant families are non-deficient.
- **`CB(8, 92)` record (`R30-CB-RECORD`)**: unchanged and consistent.
  - `S` and `P` at `CB(8,92)/492` re-match the frozen record (ADJ-F). `S` has 351 digits, correcting F1's "352".
  - Sector ratio `492/491`; the row is certified inside the five-row key.
  - Scope-note addition: the arm-summand identity (R-7) explains the sector deficit as the arm leaf's summand.
- **Primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE`**: OPEN and untouched.
  - A full-scope proof of (HALL) would imply it by the certificate C1-LA2
    (`E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`, `formally_verified`: FLOW⇒SIGN through (WID)).
  - That implication would be registered as a scope note with that separate certificate.
  - The restricted-scope flows give `S ≤ 0` on their own rows only. That is a corollary, not an aggregate contribution.
- **`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-BETA-AGG`, TREE, FOREST, TRANSFER**: unchanged.
- **Erdős #993**: unchanged **by construction**. Nothing in this run's tier structure can move it without the primary aggregate and
  the RTree bridge `E993-G1-ORDINARY-RTREE-TRANSPORT` (OPEN).

**Scope notes for keys this cycle touched** (for the controller at the close; each needs its second read where marked):
- (HALL): add the three new restricted scopes above, each as its own key or conjunction note. Needs SR-C5-1, SR-C5-2, SR-C5-3.
- C4-LA1's `G_k` flow key: "with GK-MONO, covers every eligible rank of `G_k`". Needs SR-C5-3.
- The `G_k` eligibility key: its face states eligibility at `p = k+3` only (R30-E-m). Confirmed by SR-C5-3.
- E1 key (`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`): where the criterion holds on `CB(d,m)`,
  `d ≥ 6` (item 6). Needs SR-C5-4.
- E1-R key: its load clause covers the one-choke switch-image targets containing `v`. Confirmed by SR-C5-1.
- CD-1 key: U2's regular-bipartite lemma is its `q ≡ 2` instance.
- CBstar key: the `d ≤ 6` sufficiency (SR-C5-5); the `d = 1` criterion coincidence; the `α(CB)` formula (SR-C5-4).
- Five-row switch-arcs key (`E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`): the five rows are
  5 of 223 switch-necessary eligible rows of record, all at the top sector-deficient rank.
- `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` (REFUTED): the per-tag matching is its combinatorial shadow, refuted by counting
  at `T_22/34`.

**Fidelity corrections to predecessor records made this cycle.**
- R30-E-m: CF-5 and CF-U1 overstated the `G_k` scope of record.
- R30-E-n: the run-local registry was not an adjudicator-capsule member.
- R30-E-j: stale seal literal in the critic protocol.
- R30-E-k: the `PIN.json` seed path.
- The Cycle 5 gate's "`G/448` alone" is a record statement, not a class statement (R30-N-75).
- The Cycle 4 standing state's `x(G_k) = k+1` "bounded" becomes proved (item 5).
- The allocation's (L-i) and "two-hop" requirements are corrected (above).
- F2's refuted-key paragraph is replaced by ADJ-F's distinction.
- The three clone-residue items of this synthesis's own protocol (*Identity and seal audit*).

## Lean awards

Rule applied: award only stable declarations with closed dependency DAGs at their exact scope. A companion lemma on an award's face
registers `proved_informal` (R29-N-12). A key that needs `formally_verified` gets its own group. Permitted axioms are `propext`,
`Classical.choice` and `Quot.sound`. Forbidden: `sorry`, `admit`, `native_decide`, `axiom`, and `decide` over an enumeration for a
universal step. Registry text names every award by key, never by these group labels (ruling 41; residue item 4).

### `C5-LA1`: (HALL) at every eligible rank of `G_k`. FUNDED as a BOUNDED Stage 7 attempt.

**Status.** The informal DAG is closed, pending SR-C5-3 of GK-MONO. The Lean DAG has exactly two open nodes, N4a and N4b. Both are
Lean-engineering nodes over mathematics proved informally by two independent critic proofs and verified step by step by ADJ-U, so
the protocol's bounded-attempt condition is met.
- Nothing else is open. N1 (`gkGraph_isTree` and 25 helpers, U1) and N2–N3 (C-U1-F's `gk_crossing_lower_iff`,
  `gk_weightedHall_flow_of_crossing_lower`) are compiled scratch, rebuilt sorry-free by ADJ-U within the permitted axioms.
- If N4 does not close within the Stage 7 bound, the controller records **`no award attempted` → attempt failed**, with smallest
  unproved lemma N4b, and the group passes to the Cycle 6 U1 route.
- SR-C5-3 may run concurrently with Stage 7. Registration waits for both.

**Proposed key:** `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK`.
- My screen: no master alias or pattern hit. The highest token overlap with a known run-local name is 4 of 11. The critic-proposed
  `…-GK-TREE-SATURATING-FLOW-AT-EVERY-ELIGIBLE-RANK` shares 7 of 17 tokens with the C4-LA1 key and is not preferred.

**Frozen `expected_statement` draft.** In namespace `E993Transport`; names of carried declarations are as in C4-LA1's text of
record.

```lean
theorem gk_lowerRegionWeightedHall_everyEligibleRank (k : ℕ) :
    (gkGraph k).IsTree ∧
    ∀ p : ℕ, C5LA1.crossingIndex (gkGraph k) + 2 ≤ p → 3 * p < 2 * (gkGraph k).indepNum + 1 →
      ∃ f, IsSaturatingFlow (gkGraph k) (favorableLeaves (gkGraph k) p) p f
```

**Hypotheses.**
- Only `crossingIndex + 2 ≤ p` (ℕ; no subtraction guard needed) is consumed.
- `hLow` is carried to match `SOLUTION-CONTRACT.md` §2's (HALL) signature. It is **unused**, and the face must say so.
- The tree face is certified in the conclusion: `IsTree` is Mathlib's structure, with connectivity and acyclicity carried
  separately.

**Carried fragments** (byte-identical transport only, keyed by origin award, entry and digest; ruling 40).
- **C4-LA1** `Main.lean` `66db6c73ad8f0dbe58dfdf31bf6a5d0b50e3f33459ca08f89ba372cc9ca979bf`, with its kernel receipt `dd9c21f7…`
  bound by the registrar.
  - Carry every entry **before** its terminal theorem, entry 113, because the registrar refuses an entry after a terminal theorem.
    The new terminal theorem calls the carried lemma entry 110 `gk_exists_deletionSupported_saturatingFlow`, following the
    entry-52 precedent.
  - The carried entries include `gkGraph`/`gkEdge` (22–23) and the block layer (39–41, 81–86). Through C4-LA1's own carry they also
    include C1-LA1's `activeWeight`, `layerWeight`, `favorableLeaves`, `transportRel` and `IsSaturatingFlow` (C1-LA1 `Main.lean`
    `86b59c6cc7f85590f387730718599ad3112ba607495ea08c1b4a2617a6e5e0cb`).
  - The registrar confirms the exact entry numbering against C4-LA1's table, which is outside my grant.
- **First-interior entry 14** `C5LA1.crossingIndex`, fragment digest `378868ab2e660af8…`, from source
  `8d864da290947d75ac0cb52644b8b5336a19076878fcb11eeed552e6a118d7a9`. Carried, never ported. It is not in C4-LA1's text. ADJ-U
  verified its byte identity in C-U1-F's draft.

**New declarations to author** (in-run, `E993Transport`; scratch texts are drafts, not carried fragments).
- N1: `gkGraph_isTree` and its helpers, with `theorem` changed to `lemma`.
- N2: `gk_crossing_lower_iff`, `k+1 ≤ crossingIndex (gkGraph k) ↔ ∀ j ≤ k, ¬ Δ_j < 0`.
- N3: `gk_weightedHall_flow_of_crossing_lower`.
- **N4a** (count bridge): `indepSetCount (gkGraph k) ∅ j = u_j + u_{j−1}`, with
  `u_m = Σ_i C(k+1,i)·C(2(k+1−i), m−i) + Σ_l C(k,l)·C(k−l+1, m−l−1)` in explicit binomial form (no `Polynomial`), by the root split
  and a block-state bijection that reuses C4-LA1's block layer.
- **N4b** (inequality): `u_m ≥ u_{m−2}` for `1 ≤ m ≤ k+1`, by C-U1-F's elementary chain in integer form. Newton's route is not
  used.
- N4: `gk_forwardDifference_nonneg : j ≤ k → 0 ≤ C5LA1.forwardDifferenceDel (gkGraph k) ∅ j`.
- The terminal theorem.
- *Optional companion* (G-U-B): `(gkGraph k).indepNum = 2 * k + 3`, for the non-vacuity statement. It is not required; without it,
  the face states non-vacuity for `k ≥ 3` informally (SR-C4-8).

**Fences on the face.**
- `G_k` only; flows are deletion-supported.
- Not (HALL) at full scope, and not "every tree".
- Nothing about the primary aggregate beyond `G_k`.
- Not an RTree statement.
- Not the strict form of GK-SIGN.
- Not a second family for ruling 39.
- The `k = 3` row (`n = 14`, `p = 6`) lies in the formally closed order band `n ≤ 2p+2`. The family theorem covers it without
  re-proving that band as a contribution.

**Attribution.**
- Mechanism and the lower-region run: Codex GPT-6.
- Definition layers: first-interior (Codex) entries 1–18; r26/r24/r25 for the carried layers; C1-LA1/C1-LA2 (r30).
- The `G_k` flow: C4-LA1 (r30, Cycle 4).
- `gkGraph_isTree`: U1 (Claude Sonnet 5).
- GK-MONO: C-U1-T and C-U1-F (Claude Opus 5.5).
- The Lean reduction: C-U1-F.
- The composition and DAG: ADJ-U.
- r29 high tail: not used.

**Excluded conclusions.**
- Any statement about trees other than `gkGraph k`.
- Any statement about switch arcs.
- Any status change of (HALL), of the primary aggregate, or of the refuted mechanism keys.
- `formally_verified` for GK-MONO as a key: it registers `proved_informal` as a companion.

**Repairs required.**
- U1's axiom literal is corrected: 3 of 26 declarations use all three permitted axioms.
- No `decide` over enumeration.
- The count bridge must not use truncated ℕ subtraction; `forwardDifferenceDel` is ℤ-valued.

### `C5-LA2`: (HALL) on `S(1,2,3^k)` (G-F-1). `no award attempted`.

- The informal DAG N1–N7 is closed (pending SR-C5-2). **No** Lean fragment exists, and no definition layer exists
  (`spiderOneTwoThrees`).
- Every node is open in Lean: the tree layer, `indepNum = 2k+2`, `crossingIndex` both halves, E-2 (possibly present in C4-LA1's
  DAG), the hook-product injection, the leaf-1 class disjointness, and the composition.
- **Smallest unproved Lean lemma: N5.** In cleared integer form: for a finite product of ranked posets, each partitioned into
  saturated chains with `2·centre ≤ c_i`, the chain-predecessor map is defined and injective at rank `r+1` whenever
  `2(r+1) ≥ Σ c_i + 1`.
- Not funded at this Stage 7, because this is not a bounded attempt; it is a Cycle 6 U1 target.
- Draft statements as in ADJ-F's *Lean readiness*. A terminal form at `p = k+3`, `5 ≤ k`, needs only `crossingIndex ≤ k+1` and
  `indepNum = 2k+2`.

### Other candidates: `no award attempted`.

- **CD-1 in Lean (G-U-C).** The smallest unproved item is the claw-product definition layer and statement text, with SR-C4-5's
  guards.
- **`G(8^82,7^2)` keys.** These are finite certificates over a 1,427-vertex instance. They would need E1-R and CD-1 formalized and a
  CB definition layer.
- **E1 threshold and `d ≤ 6` lemmas.** Darroch's mode theorem is not under `sources/`.
- **`α(CB(d,m))`.** A companion only. Its open node is the definition layer `cbGraph d m`.
- **(WID)**: nothing to do; it is already `formally_verified`. **(HALL) at full scope**: not ready.

## Progress and stop-gate ruling

material_progress: yes
plateau: no

**Material progress on (HALL)** (grades as in *Exact established results*).
- Three new restricted-scope (HALL) statements (items 1–4), one of them the first non-CB switch-arc certificate.
- Five new lemmas at `proved_informal` (items 5–9), two of them modulo Darroch.
- New adversarial findings:
  - the switch-necessary frontier widened to 223 rows (218 uncertified);
  - (L-i) false at first eligible ranks;
  - sector restriction not WLOG (`CB(11,2)/16`);
  - the per-choke product form refuted;
  - the per-tag mechanism proved strictly weaker than (HALL) (`T_22/34`);
  - no positive summand through order 19.

Most load-bearing items are critic-attributed or adjudicator-attributed and still STATED. The adversarial findings, the
`CB(1,m)` sector lemma and New Lemma 1 stand without further reads. **The plateau definition of `SOLUTION-CONTRACT.md` §5 is not
met.** I would not invoke the plateau clause.

**Stop gate (ARMED; ruled explicitly).**
- **Decisive event (a): no.** (HALL) is not `formally_verified`, and no uniform compensation theorem exists.
- **Decisive event (b): no.** There is no (CUT) and no candidate.
- **(HALL)**: still open, with the smallest unproved lemma `(L-S)_top` plus `(ELIG-top)` (uniform), or the sector certificate at
  `CB(8,95)/508` (instance).

**Terminal-close test, C5 gate ruling 39, letter by letter.**
- **(a′) not supplied.**
  - Decisive instruments: T1's return, which attempted neither (L-i) nor (L-S); C-T1-F F-4 and C-T1-U A4/A5 with ADJ-T's replay,
    which show the allocated form false.
  - No closed-form sector certificate exists at any grade. `𝒞_8` makes the object concrete but does not supply it.
- **(b′) supplied CONDITIONALLY: both halves are admitted by this synthesis at STATED grade.**
  - **First half:** whole-row (HALL) at `G(8^82,7^2)` (items 1–2), `computer_assisted`, credited to T2 with C-T2-F, C-T2-U and ADJ-T.
    Decisive read: **SR-C5-1**.
  - **Second half:** the infinite eligible family `{(S(1,2,3^k), p) : k ≥ 5, p eligible}` (item 3), `proved_informal`, credited to
    C-F2-U with F2 and ADJ-F. Decisive read: **SR-C5-2**.
  - Distinctness from the registered `G_k` scope is mathematical (non-isomorphic trees). The lexical part (the run-local `G_k` key's
    alias patterns) is owed by the controller's screen.
  - (b′) is supplied **only if both reads confirm**.
- **(c′) not supplied.**
  - Decisive instruments: ADJ-F's `cb_adj.py` scan and `cb_rows.py`, the replayed critic family scans, and C-F2-U's order-19 census.
  - No eligible deficient cut is known anywhere.
- **(d′) not supplied at Stage 6.**
  - `C5-LA1` is a (d′) instrument only through a closed Stage 7 award **together with** (a′)–(c′).
  - If `C5-LA1` closes and SR-C5-1/SR-C5-2 confirm, (d′) is also satisfied, but it adds nothing to the continuation ruling beyond
    (b′).

**The isolated second-read batch** (I name statements, origins, fences and grades; the controller funds and seats them).

- **SR-C5-1 (decisive; (b′) half one).** Whole-row (HALL) at `G(8^82, 7^2)`: at `p = 448` with switch arcs load-bearing, and
  deletion-only at 449–503. Origin: T2; C-T2-F; C-T2-U; ADJ-T. The read must confirm:
  - (i) the tree data, `x` through `α`, and `F_p` derived at all 56 ranks;
  - (ii) the zero-slack certificate **exactly**, from the shipped per-state table as data (C-T2-F `t2_cert.json` `7a6f4c66…`; ADJ-T
    `t2_cert_values_adj.json` `2c421fcc…`);
  - (iii) **E1-R's registered load clause against the frozen run-local registry snapshot in its capsule**: `Σ_B f(B,A) = ρ_{Q(A)}·w_F(A)`
    on every `r`-free target with `Q(A)` nonempty, including one-choke switch images containing `v`, and 0 elsewhere;
  - (iv) R8 inflow `≤ 1`;
  - (v) that the in-sector `r`-switch preimages are harmless to a deletion-only E1-R flow;
  - (vi) the CD-1 and E1-R criterion checks at 449–503;
  - (vii) (WID) two-sided at 56 ranks.

  Grade on confirmation: `computer_assisted`. Fences: one tree; finite; not universal.
- **SR-C5-2 (decisive; (b′) half two).** E-1 on `S(1,2,3^k)`, for every `p ≥ k+2` and every `F ⊆ leaves`. Origin: C-F2-U A7; F2
  (E-2); ADJ-F (hook discharge, N3b). The read must confirm:
  - (i) the per-tag classes: tip `c_i` (`c_max = k + ½`), leaf 1 (first-root split, `c_max = k`, disjoint class images), cherry
    leaf 3 (no sources);
  - (ii) the hook partition and its iteration;
  - (iii) E-2;
  - (iv) `α = 2k+2`, `x ≤ k+1` for all `k`, and eligibility of `p = k+3` for `k ≥ 5`. This is the minimal (b′) statement, which
    does not use N3b;
  - (v) N3b, `x = k+1` for `k ≥ 5`, for the "every eligible rank" form;
  - (vi) distinctness from `G_k`, plus the lexical screen against the run-local registry.

  Grade: `proved_informal`. Fences: family only; deletion arcs; not (HALL); not the aggregate; not a revival of the refuted
  per-leaf key.
- **SR-C5-3 (registration and `C5-LA1`).**
  - GK-MONO, with both proofs; C-U1-F's elementary chain is the proof of record.
  - The composition (HALL) at every eligible rank of `G_k`.
  - Confirmation against the registry that the `G_k` eligibility key's face states only `p = k+3` (R30-E-m).

  Origin: C-U1-T, C-U1-F, ADJ-U. Grade: `proved_informal`.
- **SR-C5-4 (registration only; non-decisive).** The E1 rank-threshold lemma (C-T1-U; modulo Darroch) and `α(CB(d,m)) = 1 + m(d+1)`
  (C-T1-F, C-T1-U). Grade: `proved_informal`.
- **SR-C5-5 (registration only; non-decisive; optional).** The `d ≤ 6` sector sufficiency (C-T1-F; modulo Darroch) and the `CB(1,m)`
  sector non-eligibility (U2 and critics). Grade: `proved_informal`.

## Next-cycle portfolio

**This portfolio is conditional.** It is the alternative the controller takes **only if SR-C5-1 and SR-C5-2 both confirm** (ruling
39 (b′)). Cycle 6 would be the **sixth and last** cycle (ceiling), so every route aims at an object closable in one cycle. There
are six routes, two per orientation. No target is closed.

| Seat | Route | Object | Could close in one cycle |
|---|---|---|---|
| `T1` | `C6-T-01 CB-TOP-DEFICIENT-RANK-UNIFORM-SWITCH-HALL` | On `𝒞_8` (or the `d = 7` analogue): (i) `(ELIG-top)`, a single-rank descent `i_{p*−1} < i_{p*−2}` plus the two deleted-tree descents, uniformly in `m`; (ii) E1 at every `q` at `p*` from the threshold lemma (SR-C5-4); (iii) `(L-S)_top`, fitting closed forms in `m` per residue class to the five registered `θ*` values (`96/495419`, `96/530501`, `96/566783`, `16/65097`, …) and to T2-method tables at the band rows, then proving the affine separation uniformly; (iv) composition by B7 with the E1 key. Every closed form validated against literal max-flow laboratories BEFORE any uniform claim. | The first parameter-uniform switch-arc restricted (HALL), `proved_informal` modulo Darroch, as a separate key. |
| `T2` | `C6-T-02 CB-BAND-ROW-CERTIFICATES` | T2's exact LP + DP + literal-lab method at the 49 uncertified band-rank rows of T1's rectangle (smallest `CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524`, `CB(7,112)/524`); an exact all-`q` E1 check first at the five non-band rows; per-state tables shipped as data for T1's fit. The Codex relative-margin mechanism (CF6-2) may be tried as an alternative certificate generator, at its own recorded grade only. | `computer_assisted` restricted (HALL) at dozens of new switch-necessary rows, and T1's fitting data. |
| `F1` | `C6-F-01 WHOLE-NETWORK-MIXED-FAMILY-CUT-SEARCH` | At `CB(9,112)/673` (smallest sector surplus) and `CB(8,95)/508`: `Aut`-invariant families that **mix** sector and regime-3 sources, seeded by the `CB(11,2)/16` maximizer shape; literal `N(X)` by generating functions; completeness over invariant families by C2-LA1 (formally verified); counting validated on literal laboratories including `CB(11,2)/16`; any deficit to two instruments. | A (CUT) candidate (decisive event (b) after its second read), or whole-row certificates at those rows. |
| `F2` | `C6-F-02 FIRST-POSITIVE-SUMMAND-ELIGIBLE-ROW` | A counts-only exhaustive census of **every** tree of orders 20–22 (every eligible `p`, `F_p` derived, summands by DP) until the first eligible row with a positive leaf summand, or a stated horizon; at that row, literal (HALL) by exact max-flow and by an (INV)-quotient flow, recording whether switch arcs are load-bearing. | The smallest eligible row where per-tag deletion must fail, the only kind of place a non-CB (CUT) can live; either (HALL) there or a (CUT) candidate. |
| `U1` | `C6-U-01 LEAN-GK-AND-SPIDER-FAMILY-AWARDS` | First, complete `C5-LA1` if its Stage 7 attempt did not close (N4a, N4b). Then `C5-LA2` on `S(1,2,3^k)`: the definition layer, tree layer, `indepNum`, `crossingIndex`, E-2 (carried from C4-LA1 if present), N5 (hook-product chain injection), leaf-1 disjointness, and composition. | `formally_verified` restricted-scope (HALL) on one or two infinite tree families with the tree face certified. |
| `U2` | `C6-U-02 COUPLED-CB-EXTREMAL-FAMILY` | U2's object restated over sector ∪ regime-3 with shared switch-image capacity: the STATED compression lemma ("`c → b` column replacement does not decrease the deficit"), validated first against the unique maximizers at `CB(11,2)/16`, `CB(10,2)/14`, `CB(12,2)/17`; `Aut`-orbit keys carrying each choke's degree. | A `proved_informal` outcome-B compression/up-set lemma on the CB pattern that feeds T1, or its refutation on the laboratories. |

Shared rules for every route: literal `w_F`, literal (D) ∪ (S), `F_p` derived, `x` through `α`, and (WID) two-sided from independent
sides. Nothing is re-proved of the closed regions or the registered families. A relaxed model certifies nothing. Census scope rules
follow ruling 42. The working labels (CD-1, CD-2, E1-R, R3, CT-1, R2′, L2, C1, A7, A5, F-3, GK-MONO, E-1, E-2, N1–N7) are never
keys or aliases. The vocabulary "deletion injection" never appears in an r30 key or alias.

**Successor inheritance.** This applies if either decisive read fails, in which case the run proceeds to its terminal close after
Cycle 5, and it applies after Cycle 6 in any case. A successor run (not this one) inherits:
- (HALL) OPEN at full scope, with its restricted scopes of record;
- `𝒞_8` with `(L-S)_top` and `(ELIG-top)` as the uniform switch-arc target;
- the 218 uncertified switch-necessary rows, smallest first (`CB(8,95)/508`);
- the two unsearched (CUT) sites: mixed sector/regime-3 families at uncertified CB rows, and the first positive-summand eligible rows
  of orders 20–90;
- the Lean targets `C5-LA1` (if not closed) and `C5-LA2` (N5 first);
- the Codex relative-margin mechanism as a named seed, at its own recorded grade;
- the additive rebase of r30's keys onto the 457-identity master (CF-3).

## Registrations

Each entry below states grade and attribution on its face. Every name listed was screened lexically by me against the frozen 434
master (aliases and alias patterns: no hit) and against the 14 run-local key names visible in my grant
(`scratchpad/c5-S/alias_screen_out.txt`). **The controller must repeat the screen against the full run-local registry (19 keys)**,
especially the `G_k` flow key's alias patterns. Nothing registers before its second read (run-local registry frozen until the
second-reads packet seal; ruling 43). Nothing is published before the terminal close.

**New keys** (STATED; each registers only after its isolated second read).
1. `E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`
   - Grade: `computer_assisted`. Attribution: T2 (Claude Sonnet 5); C-T2-F, C-T2-U (Claude Opus 5.5); ADJ-T. Inputs: E1-R, C1-LA2.
   - Needs SR-C5-1. C-T2-F's rename.
   - Screen note: it shares 7 of 12 tokens with the five-row switch-arcs key. The distinguishing tokens name the one tree, but the
     controller rules on the threshold.
2. `E993-R30-CHOKE-TREE-8POW82-7POW2-RANKS-449-TO-503-DELETION-ONLY-WEIGHTED-HALL`
   - Grade: `computer_assisted`. Same attribution, plus CD-1.
   - Needs SR-C5-1.
   - Whole-row conjunction: a scope note on (HALL).
3. `E993-R30-SPIDER-LEGS-1-2-AND-K-OF-LENGTH-3-SATURATES-BY-VERTEX-DELETIONS-FROM-RANK-K-PLUS-2`
   - Grade: `proved_informal`. Attribution: C-F2-U (theorem); F2 (E-2); ADJ-F (hook discharge; N3b).
   - Face companions: `α = 2k+2`, `x = k+1` for `k ≥ 5`, eligibility, and the every-eligible-rank corollary.
   - Needs SR-C5-2.
   - **Name first stated by me.** The critic's name shares **14 of 17 tokens** with the registered `G_k` flow key, a lexical alias
     hit at T2's own threshold, so I rejected it. My name shares at most 4 of 17 with it.
4. `E993-R30-GK-TREE-INDEPENDENCE-COUNTS-NONDECREASING-THROUGH-RANK-K-PLUS-ONE` (GK-MONO)
   - Grade: `proved_informal`. Attribution: C-U1-T, C-U1-F; ADJ-U.
   - Face companion: `x(G_k) = k+1`, `k ≥ 2`.
   - Needs SR-C5-3.
5. `E993-R30-GK-TREE-WEIGHTED-HALL-AT-EVERY-ELIGIBLE-RANK`
   - Grade: `proved_informal` (a composition first stated by ADJ-U), and `formally_verified` if `C5-LA1` closes.
   - Needs SR-C5-3.
   - A SEPARATE key from C4-LA1's.
6. `E993-R30-CB-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`
   - Grade: `proved_informal` modulo Darroch (named on the face). Attribution: C-T1-U; ADJ-T's name.
   - The failure half is on its face.
   - Needs SR-C5-4.
7. `E993-R30-CB-CHOKE-DEGREE-AT-MOST-SIX-SECTOR-DELETION-SUFFICIENT-AT-EVERY-ELIGIBLE-RANK`
   - Grade: `proved_informal` modulo Darroch, at CBstar's grade. Attribution: C-T1-F.
   - Needs SR-C5-5.
   - Screen note: 3 of 5 tokens shared with `E993-GRAPH-SINGLE-RANK-DELETION-SUFFICIENT`. The controller rules; the alternative is
     to record it as a scope note on the CBstar key.

**Scope notes and corrections.** Grades are those of the underlying items.
- **(HALL).** Add the three new restricted scopes (after SR-C5-1, SR-C5-2, SR-C5-3). The whole-row `G(8^82,7^2)` conjunction goes
  here, not as a key.
- **C4-LA1 `G_k` flow key.** "Every eligible rank, with GK-MONO" (after SR-C5-3).
- **`G_k` eligibility key.** Correction R30-E-m: its face states eligibility at `p = k+3` only. Adjudicator-found and
  controller-confirmed (CF6-6); confirmed against the face by SR-C5-3.
- **E1-R key.** Its load clause covers the one-choke switch images containing `v` (SR-C5-1).
- **E1 key.** The rank-threshold domain (after SR-C5-4).
- **CD-1 key.** U2's regular-bipartite lemma is its `q ≡ 2` instance. Not a new key; C-U2-T, C-U2-F, ADJ-U.
- **CBstar key.**
  - The `d = 1` criterion coincidence (ADJ-U).
  - `α(CB(d,m)) = 1 + m(d+1)` (SR-C5-4).
  - The `CB(1,m)` sector non-eligibility, `proved_informal` (SR-C5-5).
- **Five-row switch-arcs key.** The frontier note: 5 of 223 switch-necessary eligible rows (`d ≤ 13`, census ranges), all at the top
  sector-deficient rank. `bounded_computation`; C-F1-U, C-F1-T, ADJ-F, ADJ-T.
- **`E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` (REFUTED).**
  - The per-tag matching is its combinatorial shadow. The universal per-tag statement is refuted by counting at `T_22/34` (C-F2-U
    A5, proved on the face; ADJ-F's distinction).
  - Family-scoped use is not a revival.
- **`R30-CB-RECORD` (records, `bounded_computation`).**
  - The 223-row census and the 4401.47 surplus.
  - The top-deficient-rank family `𝒞_8` (ADJ-T; STATED).
  - The E1 first-rank failure frontier.
  - The arm-summand identity (ADJ-F; elementary; STATED).
  - The sector closed forms and New Lemma 1 (U2; `proved_informal` records).
  - The `CB(11,2)/16` whole-network laboratory and the non-product maximizers.
- **Run records (`bounded_computation`).**
  - The order-13–19 all-trees census.
  - The 169 `d ≤ 5` eligible CB rows.
  - The Cycle 3 conjecture's new non-eligible instances.
- **Errata:**
  - R30-E-m (CF-5/CF-U1 scope);
  - R30-E-n (registry not a capsule member);
  - R30-E-j and R30-E-k (standing);
  - this synthesis's clone-residue items 1–4 (a controller lapse to record, with the rule that a cloned protocol's cycle numbers and
    award-group proposals are re-derived at clone time).
- **Vocabulary rule.** "deletion injection" is an alias of `E993-R26-DELETION-INJECTION-FIBRE-BOUND` and never appears in r30 key or
  alias text.

**Which items are STATED by an adjudicator or by me and need an isolated second read before registration:**
- ADJ-F's N3b and hook discharge;
- ADJ-U's `G_k` composition;
- ADJ-T's `𝒞_8` family, as a record;
- ADJ-F's arm-summand identity, as a record;
- my observation that the minimal (b′) statement needs no N3b;
- my rename of the spider key.

Every critic-derived statement above (items 3–7) is STATED as well.

## Continuation ruling

continue: yes

**What the flag means.**
- *Stop gate.* The stop gate proper finds no decisive event and no plateau.
- *Ruling 39.* Under the terminal-close test, this synthesis **admits letter (b′)**, both halves at STATED grade, and supplies no
  other letter.
- *Default.* The controller's pre-committed default, used if the reads do not confirm, is **terminal close after Cycle 5**.
- *Flag.* The flag therefore records the synthesis's admission. It is conditional and is superseded mechanically at the close by
  the decisive reads:
  - if **SR-C5-1 and SR-C5-2 both confirm**, Cycle 6 (the sixth and last) runs with the portfolio above;
  - if **either fails**, (b′) is not supplied, no other letter is available ((d′) needs (a′)–(c′)), and the run proceeds to its
    terminal close with the successor inheritance above.
- *Stage 7.* `C5-LA1` is funded as a bounded attempt either way. Its outcome does not change the continuation ruling.

**Substantive note for the controller's judgement.** (b′) is satisfied by its letter, but both halves are restricted-scope
results. One is a single-tree certificate. The other is a deletion-only family theorem proved by the per-tag method, which is
proved strictly weaker than (HALL). Neither advances the uniform switch-necessary frontier. That frontier's concrete object,
`(L-S)_top` on `𝒞_8`, is new this cycle, and it is the best-defined target the run has had.

## Artifact inventory

**Deliverable:** this file only,
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/cycles/cycle-5/stage6/SYNTHESIS.md`.

**Scratch:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-S/`. Everything
ran under `python3 -B`, in the foreground, with the standard library and exact integers. There is no bytecode and no background
job.

| File | SHA-256 | Role |
|---|---|---|
| `verify_seal.py` | `b1a979dc98e616a334ff836b553b22af56acf0c4597a84dcf1c5ffb3c168244a` | Stage 6 capsule seal and its 12 member digests |
| `verify_more.py` | `0b349c1c723b0fb7a386c59cdf63a36597dc7e542bb205af2135c5d11672b9a8` | Stage 5 packet seal, 69 member digests, 981 source digests |
| `syn_check.py` | `3c5d4cd238bd8cecab123ad317c087b49684d80213e00234ef9a61c49e961126` | `G_k` and `S(1,2,3^k)` literal trees and DP; GK-MONO and `Δ_{k+1}` formula (`k ≤ 120`); `x(S(1,2,3^k)) = k+1` (`5 ≤ k ≤ 120`); literal deletion-only max-flow at every eligible rank for `k = 5, 6, 7` with `F_p` derived and (WID) two-sided |
| `syn_check_out.txt` | `dbb124e0be3b271a11c0d7354785518744dda2df5a444c58196117b74dcfc939` | its output (result digest `18e5797fa61341cd0b4f437fa13126b4c93e3fd384a099cf99b7141b415dea02`; `gkmono_fail []`, `spider_x_fail []`, 3/3 rows saturate) |
| `alias_screen.py` | `bd3071c99691c98d5bde4ca34ef006932b44625f6709b28c1179be131c693c8a` | lexical screen of the proposed names against the frozen 434 master and the 14 known run-local names |
| `alias_screen_out.txt` | `2a7504cdffbfded4a2e12f4cf9fe2662ebb5804c59e84460e6b0c656579ffb8f` | its output (result digest `c63a3783abedefa1a8da738fe6d2f59ee3e8ef649e3f359a69109447de8ce689`) |

Replay: `cd` into the scratch directory, then run `python3 -B verify_seal.py`, `python3 -B verify_more.py`,
`python3 -B syn_check.py 120` and `python3 -B alias_screen.py`. The subtree source-digest verification was a one-off inline run of
the same logic over `sources/*/SOURCE-DIGESTS.json` (365/365).

I reread this synthesis before closing.
