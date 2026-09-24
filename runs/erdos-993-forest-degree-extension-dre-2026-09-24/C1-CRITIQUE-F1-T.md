# Critique

Critic `C-F1-T` (orientation T, prove) of seat `F1`, route `C1-F-01 DEGREE-EXTENSION-FALSIFICATION-CENSUS`
(orientation F), Cycle 1 of r27.

**Boot acknowledgment.** Operating within VerityOS. Booted by reading EXACTLY the two files the dispatch
names — `/Users/ashtonsperry/VerityOS/verity.md` (root constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (identity subsystem, startup protocol) — and no
other VerityOS file. The startup protocol's task-type map was NOT followed into
`memory/`, `knowledge/`, `decisions/`, `operations/`, `logs/`, `conversations/`, `modules/` or `skills/`
(the controller booted for the run). No read-boundary disclosure arises from the boot.

## Identity and seal audit

- **Capsule seal (reported as required).** `control/c1-critic-capsules/F1-PACKET-MANIFEST.json`:
  recomputed SHA-256 over the canonical JSON minus `seal_sha256` (`sort_keys=True`,
  `separators=(",", ":")`, no trailing newline) =
  `386c298501234154228ed648a714efb9fb321d0e7604b5b8177c7072aeadf539` = the declared inner seal. **MATCH.**
  All 14 members verified by digest AND byte count: all match.
- **Stage 2 seal.** `control/C1-STAGE2-PACKET-MANIFEST.json` recomputes to
  `64d142ed1a3beb3dec7eaaa941d5c862c0bd3381ee678f6aa27c5c43850828e7` — equal to the declared seal and to the
  value the critic protocol quotes, and to the value the return quotes. **MATCH.**
- **Stage 3 seal.** `control/C1-STAGE3-PACKET-MANIFEST.json` recomputes to
  `8e78cf1f781381b34db629d8e596e36891df1d2346b54b5b805a18e0a1c0164d` = declared. **MATCH.** It lists
  `cycles/cycle-1/stage3/returns/F1/RETURN.md` at `1ae3048330bafafc74489bad3fc2396ded8849a0c0d4c21f89a01336f835f370`
  / 27,737 bytes — identical to the capsule's entry and to the file on disk.
- **Stage 4 dispatch seal.** `control/C1-STAGE4-DISPATCH-MANIFEST.json` recomputes to
  `dc9daaa2da71b5d23a1da210be4ff48bca13ba620e0a10307c9a90baf657fb6e` = declared. **MATCH.**
- **Read-boundary disclosures.** `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` records items for T1, F2,
  U1, U3; **no item for F1**, consistent with the return's claim that none is needed.
- **Route identity.** The return quotes route ID and mechanism token verbatim from `control/C1-ALLOCATION.md`
  ("falsify (DL)/(EX) on every forest to order ≥ 14 and adversarial families; certify acyclicity is
  load-bearing") and executes allocation item 4 clause by clause. Stage 3 admission items all present:
  boot acknowledgment naming exactly two reads; Stage 2 seal; IMPORT LIST (stdlib only); one typed route
  verdict (`bounded_evidence`); exactly one `headline_resolved: no`; `## Remaining obligation` as successor
  inheritance; model disclosure in the mandated wording.
- **Registry literal.** The return states it verified `control/CLAIM-IDENTITY.run-local.json` at
  `47697cba1e11d5898000d66c4d3d4502278af59e380ef0e952da3197d13e7fa2` / 2,407,492 bytes before reading it.
  I confirmed that literal against two sealed sources inside my grant: `control/SOURCE-DIGESTS.json`
  (`sources/authority/CLAIM-IDENTITY.json`) and the Stage 2 manifest (three entries, all that digest and
  byte count). The registry file itself is **not** a member of my capsule and was not read by me; F1's
  per-key status lookups are therefore attested but not independently re-read here.

## Independent re-derivation

I built my own instrument (`scratchpad/c1-crit-F1-T/critlib_t.py`, stdlib only) by a deliberately different
method from the seat's: trees by **leaf addition** (every order-`n` tree is an order-`(n−1)` tree plus a
pendant vertex), deduplicated by a centroid-minimal AHU string; forests as index-monotone multisets over the
globally ordered tree catalogue; and — the substantive difference — the counts obtained from **vertex
incidence numbers**

  `a_v(k) := #{J ∈ I_k(G) : v ∈ J} = i_{k−1}(G − N[v])`,  `i_k` from one polynomial,
  `D_k = Σ_v deg(v)·a_v(k)`,

so the seat's degree-weighted polynomial DP (the one that carried its disclosed bug) is nowhere in my path.

1. **Counts, checked analytically as well as by enumeration.** Independent of any enumerator I computed
   rooted trees by Otter's recurrence (1, 1, 2, 4, 9, 20, 48, 115, 286, 719, 1842, 4766, 12486, 32973),
   free trees by Otter's formula (1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741) and forest
   classes by the Euler transform: **1, 1, 2, 3, 6, 10, 20, 37, 76, 153, 329, 710, 1601, 3658, 8599, 20514**
   for orders 0–15. My enumeration reproduces orders 0–14 exactly; total **15,206**; the analytic order-15
   figure **20,514** independently confirms the seat's feasibility probe.
2. **Fixed points (`SEMANTIC-CONTRACT.md` §4), before any table.** Empty forest `i = [1]`, `Δ_0 = −1`,
   `x = 0`; `K₁` `i = [1,1]`, `x = 1`; `K₂` `i = [1,2]`, `D_1 = 2`; `P_5` `i = [1,5,6,1]`, `D = [0,8,18,4]`;
   `K_{1,5}` `i = [1,6,10,10,5,1]` (`i_1 = m+1`, `i_k = C(5,k)` for `k ≥ 2`); edgeless order 6 `D_k = 0`.
   All agree with the contract and with the seat's reported values.
3. **Instrument vs brute force.** On all 156 forests of order ≤ 8, full subset enumeration reproduces my
   `i_k` and `D_k`, the identity `Σ_v a_v(k) = k·i_k`, and the double count `(k+1)i_{k+1} = Σ_{J∈I_k} e(J)`
   with the right side brute-forced set by set: **0 failures**.
4. **Full census, orders 0–14, all 15,206 classes, every `k`** (`t_census.py`; payload
   `20491708320a930cc1610a31c4bf71bfdd73bb64ebcd799c9b12b8d5ea02a2d0`, rows
   `ead09c69d290720169e1c01e08942aa12368246168f5d3d9d34507f8b05ec6a5`): **(DL) 0 violations, (EX) 0,
   (LB) 0, (XR) 0, double count 0**, and **0 nontrivial tight cases** of (DL) or (EX) (`k ≥ 1`, `i_k > 0`).
   Minimum (DL) slack over those `k` is exactly **2**.
5. **Per-`J` extension bound.** `e(J) ≥ n − k − Σ_{v∈J} deg(v)` brute-forced over all 638 forests of order
   ≤ 10 and all 114,615 independent sets: **0 violations** (the seat's 638-forest figure is exact).
6. **My own adversarial families** (`t_families.py`): 59 instances — stars to `K_{1,119}`, paths to `P_121`,
   double stars, spiders, caterpillars, combs, brooms, complete binary trees to depth 6, edgeless and
   `K₂`-union forests, mixed unions, and four deterministic LCG-generated random forests at orders 25/60/111
   — maximum order **127**, **46** instances with `n ≥ 21` for (R5): **(DL)/(EX)/(LB)/(XR)/(R5) 0 violations,
   0 nontrivial tight cases**. This extends the seat's sweep (45 instances, max 120, 29 (R5) checks).
7. **Non-forests.** 45 graphs (`C_3..C_20`, `K_3..K_9`, `K_{a,b}` for `a ≤ 5`, `b ≤ 6`): smallest (DL) and
   (EX) failure is **`K₄` (n = 4, |E| = 6) at `k = 1`**, next `K_{2,3}` (n = 5) — the seat's finding, exactly.
   In this sweep (DL) fails **iff `|E| > n`**, and every failing graph fails first at `k = 1`. The seat's two
   extra excess-2 witnesses reproduce: bowtie `D_1 = 12 > 10` (only `k = 1`); theta `D_1 = 12 > 10` and
   `D_2 = 18 > 16`.
8. **Exhaustive unicyclic sweep (new).** Every tree-plus-one-edge graph to order 12 — **46,745 graphs** —
   checked at every `k`: **0 (DL) failures, 0 (EX) failures**. This replaces the seat's 12 shaped instances
   with an exhaustive horizon.
9. **Replay of the seat's own generators, copy-out-first.** The eight scripts and four reports were copied
   into `scratchpad/c1-crit-F1-T/replay-F1/` and re-executed. All four JSON reports came back
   **byte-identical** to the shipped ones; `run_census_full.py` took 13.7 s (the return says 13.8 s).

## Attacks and findings

### Finding 1 (principal, critic-derived): the seat's null result is a theorem, and it comes with a complete elementary proof of (DL)

The seat graded "(DL)/(EX) for `k ≥ 2` on forests" as `bounded_computation` and left "is there a nontrivial
tight case at order > 14?" open. Attacking that question (attack brief item 2 for this seat) produced a proof
of the *root-corrected* degree lemma — the strengthened statement the paper obtains from its two-potential
polynomial induction — by a direct injection, with no polynomial machinery and no external text.

**Setup.** `G` a finite forest on `n` vertices, `k ∈ ℕ`, `a_v := a_v(k) = #{J ∈ I_k(G) : v ∈ J}`. Then
`Σ_v a_v = k·i_k` (count incidences `(v, J)`) and

  `D_k = Σ_{J∈I_k} Σ_{v∈J} deg(v) = Σ_v deg(v)·a_v = Σ_{uv ∈ E} (a_u + a_v)`.

Root every component (any choice); let `p` be the parent map. **Acyclicity enters here twice**: the edges are
in bijection with the non-root vertices (`|E| = n − c`, each edge is `{v, p(v)}` for exactly one non-root `v`),
and the neighbours of any `v` are exactly `p(v)` together with the children of `v`. Hence

  `D_k = Σ_{v non-root} (a_v + a_{p(v)})`.

**Claim.** `Σ_{v non-root} a_{p(v)} ≤ Σ_{v non-root} a_v`.

*Proof.* Let `S = {(v, J) : v non-root, J ∈ I_k, p(v) ∈ J}` (so `|S| = Σ_{v non-root} a_{p(v)}`) and
`T = {(u, K) : u non-root, K ∈ I_k, u ∈ K}` (so `|T| = Σ_{v non-root} a_v`). Define `Φ : S → T` by

  `Φ(v, J) = (v, (J ∖ {p(v)}) ∪ {v})` if no child of `v` lies in `J`  (type A),
  `Φ(v, J) = (w, J)`, `w` the least child of `v` lying in `J`, otherwise  (type B).

*Well defined.* In type A, `v ∉ J` (it is adjacent to `p(v) ∈ J`), so the new set has size `k`; its only new
adjacency risk is at `v`, whose neighbours are `p(v)` (deleted) and its children (none in `J` by the case
hypothesis); `v` is a non-root. In type B, `w ∈ J` and `w` has the parent `v`, so `w` is a non-root.

*Injective.* Let `(u, K)` be an image. If `p(p(u))` exists and lies in `K`, the image cannot be type A: a
type-A image has `K = (J ∖ {p(u)}) ∪ {u}` with `p(u) ∈ J`, and `J` independent forces `p(p(u)) ∉ J`, hence
`p(p(u)) ∉ K`. So it is type B, and then the source is forced: `v = p(u)`, `J = K`. Otherwise the image must
be type A, and the source is again forced: `v = u`, `J = (K ∖ {u}) ∪ {p(u)}`. ∎

**Consequence (root-corrected degree lemma).** For every finite forest, every `k`, and every choice of one
root `r_i` per component,

  `D_k(G) + 2·Σ_i a_{r_i}(k) ≤ 2k·i_k(G)`,  hence in particular **(DL)**: `D_k ≤ 2k·i_k`.

This is exactly the statement `Σ_{J∈I_k} (2|J| − Σ_{v∈J} deg(v) − 2·#{roots in J}) ≥ 0` that
`control/C1-ALLOCATION.md` item 1 asks T1 to reach by coefficient extraction from `D_T`; here it is obtained
directly, per coefficient, in three lines. It is an **average** statement (a sum over `I_k`); no pointwise
degree claim is made or implied.

**Consequence (the seat's null result, as a theorem).** If `k ≥ 1` and `i_k > 0`, pick `J₀ ∈ I_k` and
`v₀ ∈ J₀` and root `v₀`'s component at `v₀`: then `a_{v₀}(k) ≥ 1` and

  `D_k ≤ 2k·i_k − 2·Σ_i max_{v ∈ comp i} a_v(k) ≤ 2k·i_k − 2`.

So **(DL) is never tight on any finite forest at any `k ≥ 1` with `i_k > 0`** — the seat's order-≤14 /
order-≤120 null is not an accident of the horizon, and the bound 2 is sharp (any tree at `k = 1`:
slack `= 2n − 2|E| = 2c = 2`), which my census independently attains as its minimum slack.

**Consequence (strict (EX)).** With the double count and the universal bound `e(J) ≥ n − k − Σ_{v∈J} deg(v)`:
`(k+1)i_{k+1} = Σ_{J} e(J) ≥ (n−k)i_k − D_k ≥ (n − 3k)i_k + 2` for `k ≥ 1`, `i_k > 0`. So (EX) too is never
tight there — the seat's second null result, also as a theorem.

**Corroboration.** `t_injection.py` machine-checks the injection itself (not the inequality it implies): every
forest of order ≤ 10, every `k`, 2,056 root choices (all choices to order 8), **356,703 source pairs mapped,
0 illegal targets, 0 collisions, 0 inequality failures**. The root-corrected inequality also holds at every
root choice on every forest to order 14 in my census (`0` violations).

**Grade and attribution.** `proved_informal` (elementary, unconditional, all `k`, all finite forests,
disconnected and empty included). Per `SOLUTION-CONTRACT.md` §4 this is a statement first made at a review
stage: it is STATED here and requires an isolated second read before registration. The mathematics of (DL)
and (EX) is attributed to Fang–Lu–Nevo–Yao–Zheng 2026 §8; this *proof* is derived in-run by critic `C-F1-T`
and uses no external Lean text and no text from the paper (the paper was not read by this critic).

### Finding 2: the seat's own `proved` grades hold up

- "(DL) at `k = 1` for every finite forest, with slack ≥ 2": correct. `D_1 = 2|E|`, `i_1 = n`, so (DL) at
  `k = 1` is `|E| ≤ n`, and a forest has `|E| = n − c`; slack `= 2c ≥ 2` for a nonempty forest. (My Finding 1
  generalises exactly this to every `k`.)
- "`e(J) ≥ n − k − Σ_{v∈J} deg(v)` for every graph": correct union-bound argument
  (`N[J] ⊆ J ∪ ⋃_{v∈J} N(v)`), and verified per set to order 10.

### Finding 3: edge cases and circularity

Checked in my own census rather than accepted: `k = 0` (both sides 0 for (DL); (EX) tight at `k = 0` for every
graph, which is why the seat's tight-case table has `k = 0` entries); `k > α` (all quantities 0 — the other
source of trivial "tight" entries); the empty forest (`x = 0`, `Δ_0 = −1`, (LB) at `k = 0` gives `n ≤ 0`,
consistent); disconnected forests (all component counts present in the enumeration — the analytic Euler
transform confirms the population is complete, not merely large). No step of the seat's pipeline assumes
(DL), (EX), (LB) or (XR): the DP computes independent-set data from first principles and the inequalities are
applied only as tests. The seat's disclosed DP bug (convolution where addition was needed) is corroborated as
fixed: my independent instrument agrees with the shipped code on every one of the 15,206 classes.

### Finding 4: narrow corrections to the return's prose (no number affected)

- The non-forest family is described as "complete bipartite `K_{a,b}` for `a,b ≥ 2` up to `K_{4,4}`"; the
  shipped list also contains `K_{2,5}` and `K_{3,5}`. Eight bipartite graphs, seven failures — the report's
  `dl_failures_count = 13` (7 bipartite + 6 complete `K_n`, `n ≥ 4`) is right.
- "12 unicyclic graphs — one cycle plus pendant trees": three of the twelve are pure cycles (`C_3`, `C_7`,
  `C_10`), duplicating members of the cycle family; the distinct cycle-plus-pendant shapes number nine. The
  totals (41 graphs, 13 failures) are unaffected.
- `K_{2,3}` fails (DL) at `k = 2` as well as `k = 1`; the return reports only the smallest failure, which is
  accurate as stated but understates that graph's failure set.

### Finding 5: the instrument-independence choice

The seat read nothing under `sources/` to keep its enumerator uncontaminated. I judge this acceptable and, on
the evidence, correct: (a) every fixed point of `SEMANTIC-CONTRACT.md` §4 that is computable was computed and
matches; (b) the one §4 item that is a *citation* (the r25 rank-5 margins at `n = 22..29`) is never cited by
the return, so no unbacked citation exists; (c) the registered-claim requirement was met from the authorized
run-local registry copy whose digest the return verified against two sealed manifests — a literal I confirmed
independently. The cost is that F1 contributes nothing to the r25 lineage reconstruction, which is F3's seat.

## Mechanism-equivalence and fence check

- **No no-recovery wording.** The return names `E993-R25-UNR-FOREST-WIDE` as OPEN and untouched, performs no
  status transfer, and derives no no-recovery statement from (LB)/(XR)/(R5). My own advance is likewise an
  average/counting statement and transfers nothing to NR1, FOREST, TREE, TRANSFER,
  `E993-G1WIDE-NO-SIZE-CAP` or Erdős #993.
- **No `N₀`, no asymptotics, no unimodality claim** anywhere in the return or in this critique.
- **No pointwise degree claim.** (DL) and its root-corrected strengthening are sums over `I_k`; the return's
  `k = 1` statement is likewise the average statement at `k = 1`.
- **No formal grade on a composition.** The return composes nothing with the r25 census or an informal r25
  claim; my advance is graded `proved_informal`, never `formally_verified`, and the run's headline flag stays
  `no`.
- **No external Lean text.** F1 read none (it read nothing under `sources/`); this critic read none and
  copied none. Gate ruling 3 intact.
- **Refuted mechanisms.** `E993-R25-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` is not used, cited or reopened;
  the first-STRICT-descent convention (`Δ_k = 0` is not a descent) is what both instruments implement — I
  verified my `x` against that convention at the fixed points.
- **Erratum R27-E-a.** The return uses the r27 contracts' hypotheses (acyclicity, finiteness) and registers
  nothing under any namespace; the r26 residue in the sealed worker brief did not propagate. Not penalized.
- **Erratum R27-E-b.** The return does **not** repeat the semantic contract's mislabelling of edgeless forests
  and single edges as (DL) "tight cases"; it lists them as fixed points with `D_k = 0` and `D_1 = 2`. Finding 1
  sharpens the erratum: at `k ≥ 1` with `i_k > 0` **no** finite forest is a tight case of (DL), so that line of
  §4 has no instances at all, and the same holds for (EX).

## Certification audit

Every certification literal in the return, audited against shipped evidence:

| Literal | Status |
|---|---|
| Stage 2 seal `64d142ed…` recomputed by the seat | **backed** (I recompute the same) |
| Registry digest `47697cba…`, 2,407,492 bytes | **backed** by `SOURCE-DIGESTS.json` and the Stage 2 manifest |
| `forestlib_f1.py` `abce3e03…` (21,980 B), `families.py` `d7a672b4…`, `run_census_full.py` `8bcb21df…`, `run_adversarial.py` `3af5610c…`, `run_nonforest.py` `944ba4ea…` | **backed** (all five recomputed identically) |
| `census_full_report.json` payload `36409000…`; rows `866b6310…`, 15,206 rows | **backed**; both reproduced by re-execution (the rows digest is over an in-script payload, not a shipped file — it is backed by reproduction, not by a separate artifact) |
| `tight_nontrivial_report.json` `47572324…`; `adversarial_report.json` `0f03fb87…`; `nonforest_report.json` `ddea4d51…` | **backed** (reports byte-identical on replay) |
| 15,206 forests of order 0–14; class counts 1,1,2,3,6,10,20,37,76,153,329,710,1601,3658,8599 | **backed**, and independently confirmed analytically (Otter + Euler transform) |
| "0 violations" for (DL), (EX), (LB), (XR), double count over the census | **backed** and independently reproduced |
| "all recorded tight hits are trivial" | **backed**: every recorded (DL) hit has `D_k = 2k i_k = 0` at `k > α`; every recorded (EX) hit is `k = 0` or `k > α` |
| "0 nontrivial tight cases" (separate pass) | **backed**, and now upgraded to a theorem (Finding 1) |
| per-`J` bound exhaustive for orders 0–10, 638 forests | **backed** (114,615 independent sets, 0 violations) |
| 45 adversarial instances, max order 120, 29 with `n ≥ 21` for (R5) | **backed** (report rows counted) |
| 41 non-forest graphs, 13 (DL) failures, smallest `K₄` then `K_{2,3}`; bowtie/theta values | **backed** and reproduced |
| "every instance certified `is_forest()`; every non-forest required to fail it" | **backed**: the assertions are in the shipped code in both directions |
| IMPORT LIST stdlib-only, no network, no installs | **backed** by the shipped scripts' imports (`itertools`, `json`, `hashlib`, `sys`) |
| Runtime 13.8 s for the census; "no background job; nothing detached" | **backed** (13.7 s on replay; no hashed payload carries wall-clock, PID or host fields) |
| order-15 probe "20,514 classes, not a checked census" | **backed**: 20,514 confirmed analytically; correctly disclosed as a probe |
| "8,599 order-14 forests not brute-forced per `J`" | **honest disclosure**, not a claim |

**Nothing is struck.** One item lies outside my grant: the byte-identity of the copies in
`scratchpad/c1-F1-replay/` (a directory my capsule does not name). I did not read it; my own copy-out-first
replay from `scratchpad/c1-F1/` supersedes that claim and confirms the same digests.

## Verdict

The return is accurate, honestly bounded and fully reproducible; its two disclosed bugs were caught by its own
cross-checks and are corroborated as fixed by an independent instrument; every certification literal is backed.
Its central result — zero counterexamples to (DL)/(EX) on forests, smallest non-forest failures `K₄` and
`K_{2,3}`, acyclicity load-bearing through `|E| ≤ n − 1` — stands as stated, and I strengthen rather than
narrow it: the two null results it grades `bounded_computation` are theorems (Finding 1), and with them (DL)
and (EX) are proved for every finite forest and every `k` by an elementary injection derived in this critique.
In prose, as the protocol requires rather than through the flag: **the mathematics of (DL), (EX), and hence
(LB), (R5) and (XR), is now complete informally, grade `proved_informal`, pending the isolated second read of
this proof.** The headline — (DL)+(EX) FORMALLY VERIFIED — is not produced by any route this cycle.

verdict: retained
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority

## Remaining obligation

1. **Isolated second read of Finding 1** (the injection `Φ` and the root-corrected degree lemma) before any
   registration, per `SOLUTION-CONTRACT.md` §4. I could not run the registry alias check (lexical or
   mathematical) because `control/CLAIM-IDENTITY.run-local.json` is not a member of my capsule; the synthesis
   must alias-check any candidate key (`E993-R27-FOREST-DEGREE-LEMMA` and a strictness/root-corrected
   companion) before it is registered.
2. **Lean route (hand-off to U2 / Stage 7).** The injection is `Finset`-native and avoids the two-potential
   induction entirely: it needs (i) a rooting of a finite acyclic graph with a parent map and the edge ↔
   non-root bijection, (ii) `N(v) = {p(v)} ∪ children(v)` from acyclicity, (iii) one `Finset.card_le_card_of_injOn`
   over `Σ_{v non-root} I_k`, with the type-A/type-B case split and the invariant "`p(p(u)) ∈ K`" for
   injectivity. If it formalizes, the long pole of this run (`C1-U-02`) shortens to bookkeeping. The identity
   `D_k = Σ_v deg(v)·a_v = Σ_{uv∈E}(a_u + a_v)` is the only algebraic prerequisite.
3. **Unicyclic graphs.** Now exhaustive to order 12 (46,745 graphs, zero failures) rather than 12 shaped
   instances. Still not a theorem, and my proof states exactly why: deleting the cycle-closing edge `xy` and
   rooting at `x` leaves the injection valid except at `y` (whose neighbour set gains `x`), and closing the
   argument would require `a_y ≤ a_x`, which is not available in general. That is the precise obstruction a
   successor should attack or exploit.
4. **Census horizon.** Order 15 (20,514 classes, confirmed analytically) is still an unchecked census; my
   instrument would need roughly the seat's runtime again. Not attempted here.
5. **The seat's own inheritance items.** Item 1 (the general proof of (DL)/(EX) for `k ≥ 2`) is **discharged**
   by Finding 1, at grade `proved_informal`. Item 3 is narrowed by the exhaustive unicyclic sweep. Items 2, 4
   and 5 stand; the candidate observations F1 flags (the non-forest `|E| > n` boundary; the tight-case null,
   now a theorem) remain synthesis decisions.

## Artifact inventory

Scratch (all under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-forest-degree-extension-dre-2026-09-24/scratchpad/c1-crit-F1-T/`; nothing written anywhere else except this critique):

| File | SHA-256 |
|---|---|
| `critlib_t.py` (own instrument) | `9aa1b89d9f37864c0f9ebadbfc05c60bf4910d3f13c78acb72df1483e90770df` |
| `t_validate.py` (analytic + brute-force validation) | `1fc7496aab6c1f3b358d5ba11a930ac94ce6591f9bdac8667ce164a2f7310c40` |
| `t_census.py` (orders 0–14 census) | `93fe51ebcf93a56a567d13acd8ee0ce815819d4e67c0731d9a69bb861d0e7c63` |
| `t_injection.py` (machine check of the injection) | `210232603f8a92da10b2d176d69086a05b4272a8f8d61dff000b3431d8bcf1b7` |
| `t_families.py` (adversarial + non-forest + unicyclic) | `1e55156b2b28647cccb8cd93f0f9a6921191613d6db61a5812e188a2aa5572e8` |
| `t_census_report.json` | `4ed9f84647b21e3424d1e1aaf25042c10ac4d83954269891113ba8a4e20b8a03` |
| `t_injection_report.json` | `83b790326eb5b18ca3ddc383a9639a2bda3d54ebfd05403104de45bf2db7cbeb` |
| `t_families_report.json` | `0fefde5159fb65209c02f8daf0ccd315ed62bdb59b2eab7dfed98a39c3906c07` |
| `t_nonforest_report.json` | `347f6d547408c74f5a4553527a8027ac4c9ac440adcf1ae4367529a523b4cf09` |
| `replay-F1/` | copy-out-first copies of the seat's eight scripts and four reports, plus `orig/` and this replay's stdout/stderr |

IMPORT LIST (every script of this critique): `itertools`, `json`, `hashlib` — Python standard library only.
No network, no package installs, no `pip`/`brew`/`npm`/`elan`, no Lean build (this seat's return builds none).

**Reads.** The two boot files; the 14 capsule members (protocol, common brief, my own `F1` section of the
attack briefs, `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `control/C1-ALLOCATION.md`,
`control/C1-STAGE1-GATE.md`, `control/SOURCE-DIGESTS.json`, the Stage 2/3/4 manifests, the Stage 3
read-boundary disclosures, `PATH-CHECK-F1.json`, the F1 return); and the seat's inventoried artifacts under
`scratchpad/c1-F1/`, copied out before use. I did **not** read another return, a paired critique, an
adjudication, `sources/`, the registry, `scratchpad/c1-F1-replay/`, or anything outside this run root.

**Disclosures.** (a) One non-recursive `ls` of `scratchpad/c1-F1/` (a directory inside my grant, listing the
artifacts I was authorized to replay) and `grep` runs confined to my own scratch copies; no search was rooted
above the grant — no `find`, no `rg`, no recursive listing, at any point. (b) `scratchpad/c1-F1-replay/`, which
the return inventories, is not named in my dispatch's read grant, so I left it unread and replayed from
`scratchpad/c1-F1/` instead. (c) No background job was started at any point in this critique; every script ran
in the foreground to completion, so no kill was required (and no pattern kill or process listing was ever
used). (d) The registry alias check for my own advance could not be run from my grant (see obligation 1).
(e) This critique was reread in full before the final write.
