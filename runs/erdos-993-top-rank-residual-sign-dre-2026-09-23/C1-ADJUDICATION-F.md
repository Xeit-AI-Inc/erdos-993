# Orientation Adjudication

Stage 5, orientation **F** (falsify), Cycle 1 of r26 (`E993-R26-TOP-RANK-RESIDUAL-SIGN`).
Portfolio: returns `F1`, `F2`, `F3` and their six cross-orientation critiques
(`C-F1-T`, `C-F1-U`, `C-F2-T`, `C-F2-U`, `C-F3-T`, `C-F3-U`).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading EXACTLY
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`,
and nothing else in VerityOS proper (no memory, knowledge, conversations, modules, skills, logs,
decisions, operations, inbox or writing file was read — the controller has booted for the run).
Subsystems loaded: the root constitution and the identity startup protocol only; everything else is
this run's sealed capsule, the run-root authority under `sources/`, and my own scratch. This run is a
bounded, reversible laboratory workspace under `experiments/` per `verity.md`; nothing here is a
durable VerityOS record.

**Read-boundary disclosure (mine).** None. Every file I opened is a member of
`control/c1-adjudicator-capsules/F-PACKET-MANIFEST.json`, a digest-verified file under `sources/`
(`sources/authority/CLAIM-IDENTITY.json`, read by script for counts and statuses only), or my own
scratch under `scratchpad/c1-adj-F/`. I read no other orientation's returns or critiques, no other
adjudication, no prior synthesis, no other experiment root, no research-packet directory, no
`control/controller-prerun/` file, and no external source. I ran no `find`, `grep`, `rg`, `ls -R`,
globbed `cat` or recursive listing at any point; every file was opened by explicit path and every
digest loop iterated a manifest's own listed paths. No network, no package installs; Python standard
library and exact integers only. I replayed no seat scratch: every number I report below is from my
own instrument, written from `SEMANTIC-CONTRACT.md` alone.

Chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

## Identity and seal audit

**Capsule seal, recomputed** (SHA-256 of `json.dumps(manifest_without_seal, sort_keys=True,
separators=(",",":"))`, no trailing newline):

```
7cfac90a445e5bae388fda099d8bee29e764264535488ff47cc5697b8959d215
```

— identical to the capsule's declared `seal_sha256`. **Seal verified.**
All **24** listed members match both their `sha256` and their `bytes`: 24/24, zero failures.

Inner seals of the three packet manifests the capsule carries for recomputation:

| Object | Declared | Recomputed | Members | Result |
|---|---|---|---|---|
| `control/C1-STAGE2-PACKET-MANIFEST.json` | `c97e121561a7b63c…` | identical | 96 | verified |
| `control/C1-STAGE3-PACKET-MANIFEST.json` | `86571d275c1b1587…` | identical | 32 | verified |
| `control/C1-STAGE4-PACKET-MANIFEST.json` | `7169114907fdb1f2…` | identical | 57 | verified |

The Stage 2 value is exactly the seal all three of my returns cite, and all six of my critics.
(The `92d35e15…` value the six critics report is the Stage 4 **dispatch** manifest, a different
object, not a member of my capsule; I do not re-derive it and nothing in my portfolio depends on it.)
`control/c1-adjudicator-capsules/PATH-CHECK-F.json` carries counts only — `files_with_findings` and
`finding_count` are zero — consistent with the controller's own capsule note.

**Frozen sources.** All **79** entries of `control/SOURCE-DIGESTS.json` re-hash to their declared
values: 79/79, zero mismatches. This discharges `SOLUTION-CONTRACT.md` §3.5 for the whole
orientation: **no sealed r24 file was edited by any F seat or critic.**

**Claim identity, re-derived by me from the frozen registry** (not from any return).
`sources/authority/CLAIM-IDENTITY.json`, 2,383,262 bytes, **363** identities.
`E993-R26-TOP-RANK-RESIDUAL-SIGN` **absent** (run-local candidate, correct);
`E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION` **absent** (fresh key, correct);
`E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE` **OPEN**; `E993-BETA-AGG` **OPEN**;
`E993-FIRST-STRICT-DESCENT-IS-FIRST-MAXIMIZER` **REFUTED**. Alias sweep: statements with `residual`
and `top` co-occurring — **0**; aliases containing `top-rank`/`top rank` — **0**. The alias checks of
F1, F2, F3, `C-F1-T`, `C-F2-T` and `C-F2-U` are confirmed. No F seat and no F critic registers a key,
and none needs one.

**Admission records.** `control/C1-STAGE3-ADMISSION.json` admits all nine returns, 0 findings;
`control/C1-STAGE4-ADMISSION.json` admits all eighteen critiques, 0 findings, every one
`retained_narrowed`, every one `headline_resolved: no`. One record-accuracy item: the Stage 3
admission sets `read_boundary_disclosure: true` for **F1** and **F2**, but both returns state in
terms that they filed none, and `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` lists only F3, U2
and U1. The flag is misleading; the disclosures file is right. No consequence.

**Read-boundary rulings for my orientation (the controller's Stage 4 file records none of my six
critics, although four of them filed disclosures in their critiques — a controller record gap I flag;
I re-rule here under the protocol's leave).**

| Critic | Disclosed | Ruling |
|---|---|---|
| `C-F1-T` | none filed | Consistent; its two searches were a `grep` on one granted frozen file and on its own replay copies. **No breach.** |
| `C-F1-U` | verified the Stage 3 seal **mechanically** (script printed a boolean; contents never entered context) because the manifest is not a critic-capsule member | Duty 1 versus capsule scope — the controller's own defect (`capsule_design_notes`). The handling is the most conservative available. **No breach.** |
| `C-F2-T` | (1) parsed the Stage 3 manifest for its seal; (2) read `sources/r24/adjudicator-scratch/{adj_engine.py, scan.py, scan_4_17.json}` and line ranges of three r24 records; (3) F2's inventoried scratch, copy-out-first | (2) is run-root authority under `sources/` and is F2's literal object; (1) and (3) are duty 1 and the replay grant. It correctly declined to open `scratchpad/c1-F2-replay/` (above a critic's grant). **No breach.** |
| `C-F2-U` | byte digest of the Stage 3 manifest only (never parsed); one non-recursive `ls -l` of the granted `scratchpad/c1-F2/` | Stricter than `C-F2-T`'s handling of the same duty. **No breach.** |
| `C-F3-T` | two `grep -n` calls, each rooted at a single granted file; one non-recursive `ls` of the granted `scratchpad/c1-F3/` | The ban is on searches **rooted above** a granted directory; a grep on one granted file is not one. **No breach.** |
| `C-F3-U` | none filed; single `ls` inside its grant | **No breach.** |

**F3's own Stage 3 disclosure** (one non-recursive `ls` of the run root's `scratchpad/` parent,
exposing sibling directory *names* only). I concur with the controller's ruling and with `C-F3-T`'s
reasoning: the nine seat identifiers and their routes are printed in `control/C1-ALLOCATION.md`, a
Stage 2 member inside F3's own grant, so the information content of the listing is **zero**. No
breach, no penalty, no contamination, and F3's independence is unaffected — every figure in its
return reproduces from its own generators on two critics' replays and on mine.

**My own instrument.** `scratchpad/c1-adj-F/adjF_lib.py` plus four drivers, written from
`SEMANTIC-CONTRACT.md` §1–5 alone: own free-tree generator by leaf attachment with a centre-rooted
AHU canonical form, own explicit DFS back-edge acyclicity and BFS connectivity tests (never the
`|E| = n−1` shortcut), own forest independence-polynomial DP on induced deletion sets, and the C5-LA1
predicates read literally — `IsGraphLeaf` as exactly one neighbour, `indepNum` as polynomial degree,
`crossingIndex` as the first **strict** descent searched past `α`, `hyp-eligible` as a plain integer
inequality, `(★)` both as `i_α(G−v) = 0` on every leaf **and** by literal enumeration of every
maximum independent set, and `aggregate` through the favorable filter `Δ_p(G−v) < 0` and the literal
deletion sets `H_v = {v, s_v}`, `R_v = N[s_v]`. **(RI) is never used to compute `S`; it is checked.**
Validation before any table: free-tree classes reproduce A000055 at every order 1–14 (5,447 trees);
the `(★)` shortcut agrees with literal enumeration on all 434 trees of orders ≤ 11 with `α ≥ 2`, zero
disagreements; `T_1` and `T_2` are located **uniquely** by their published i-vectors over my own
enumeration and give `S = −14` and `S = −47` exactly.

## Route-by-route decisions

### F1 — `C1-F-01 RC-EXACT-PREDICATE-CENSUS-AND-ADVERSARIAL-FAMILIES`

Route verdict `bounded_evidence`. **Retained, narrowed on three counts, with one allocation
obligation ruled UNDISCHARGED.** Both critics returned `retained_narrowed`; they agree on every
material point, and I resolve the one place their wording differs.

**Decision 1 (the cycle's strongest correction at this orientation) — the family-(III) fibre check is
VACUOUS as run, and `C1-ALLOCATION.md` item 4's fibre obligation is NOT discharged by the return.**
`C-F1-T` and `C-F1-U` found this independently and measured it identically. `phase3_structure.py`
indexes `U(J)` and `W_III(J)` over the **maximum** independent subsets `J ⊆ D`; but the
forced-neighbour lemma — which the same loop verifies four lines earlier with zero failures — makes
`U(J) = ∅` identically there, so the row asserts `ℓ ≥ 0`. Family (III) is defined by `|A_D| = a − 1`
and its fibres are indexed by `J' ∈ I_{a−1}(D)`.

I reran both scopes on my own instrument over every eligible residual tree of orders 7–14 (1,469
trees):

| Index set | fibres | with `U ≠ ∅` | max `|U|` | negative individual `ℓ−2|A|` terms | fibre sums `< 0` | min fibre | min slack `W_III(J') − (ℓ−|U|)·|I(U)|` |
|---|---:|---:|---:|---:|---:|---:|---:|
| the return's (`J` maximum in `D`) | 1,739 | **0** | 0 | 0 | 0 (vacuously) | `ℓ` | — |
| family (III)'s (`J' ∈ I_{a−1}(D)`) | 4,118 | **2,435** | 6 | **207** | **0** (substantively) | **0** | **0** |

The pattern is exactly the two critics' at orders ≤ 17 (their 20,797 / 0 and 65,846 / 37,074 /
2,039 / 0, `max |U| = 8`, min fibre 0, min slack 0). **The row "fibre `W_III(J) ≥ 0` for every max
`J ⊆ D` — 0 failures" is struck as a certification of the family-(III) fibre inequality.** The
inequality itself holds at the correct index set, and is **tight** (minimum fibre value 0, minimum
deletion-injection slack 0) — so it is genuinely load-bearing, and the return saw none of it. The
discharge is **critic-attributed** to `C-F1-T` and `C-F1-U` jointly (two independent instruments,
identical counts), at `bounded_computation`, orders ≤ 17; I confirm it independently at orders ≤ 14.
`C-F1-U`'s second reason for vacuity is also correct and I confirm it: a flat residual tree never has
a `λ = 1` support (a one-line corollary of forced neighbour with `D = ∅`), so the `a = 0` branch is
vacuous too.

**Decision 2 — "one disagreement, exactly `K_1`" is STRUCK; there are two.** Both critics replayed
`validate_predicates.py` unmodified and both report its own output `reference-evaluator mismatches: 2`,
the script printing only the first. The frozen `first_strict_descent` loops
`range(max(0, len(poly) − 1))` and so never reaches the pair `(α, α+1)`; it returns `None` on `K_1`
(`i = [1,1]`) **and** on `K_2` (`i = [1,2]`), where the literal `crossingIndex` is 1. The backed
statement is "two disagreements, `K_1` and `K_2`, both with `α = 1` and therefore outside
`hyp-alpha`". **The mechanism diagnosis is correct and well made and the conclusion is untouched** —
no r23/r24/r25 result that used an `α ≥ 2` tree is affected. This is a note for the controller, not a
correction record, and no sealed file is edited.

**Decision 3 — "(7,247+ witnesses)" is unreconciled; the two critics describe different populations
and both are right.** `C-F1-T` gives 7,265 = trees of orders ≤ 16 with `α ≥ 2` satisfying `(★)`;
`C-F1-U` gives 32,364 = the trees the comparison actually ran on (eligible trees of orders ≤ 16), and
observes that 7,247 is the eligible-**residual** count at orders 7–16. Both figures are exact and
mutually consistent: from my own census, eligible residual orders 7–17 totals 16,424 with 9,177 at
order 17, giving 7,247 at orders 7–16; residual with `α ≥ 2` totals 16,442, giving 7,265; the
difference is the 18 ineligible residual trees; and the per-order `hyp-eligible` column 4, 6, 27, 90,
217, 502, 1301, 3156, 7741, 19320 sums to 32,364. **There is no disagreement to resolve — restate the
sentence with the exact population.** The conclusion survives without any census, on `C-F1-U`'s
definitional ground, which I endorse: `i_α(G−v)` counts the independent `α`-subsets avoiding `v`, so
`(★) ⟺ ∀ v ∈ L, i_α(G−v) = 0` identically. I verified the two tests agree on all 434 `α ≥ 2` trees of
orders ≤ 11 by literal enumeration. The DP substitution at order 17 and at orders ≥ 40 is sound and
its disclosure is honest.

**Decision 4 — "every family-(I) `B` has `A_C = ∅` … CONFIRMED, not merely un-falsified" is
NARROWED, and superseded.** A finite census cannot confirm a universal (fence 3). The return is
scoped in the same sentence to orders ≤ 17, so it does not cross the fence, but the word must go. It
is moot: the statement is a **theorem**, proved four times over in this portfolio (see
`## Established results`). The return must not inherit the proof; the census stands as corroboration.
`C-F1-U`'s companion narrowing of "re-derives … the same fact the formally-verified lemma states"
(of `topRankSelectorCollapse`) to "corroborates on orders ≤ 17" is correct and I adopt it.

**Decision 5 — "Every count above is reproduced by one consolidated script" is NARROWED.**
`run_all.py` imports `phase2_order17_only`, not `phase2_order17_crosscheck`, so the 2,501-tree
order-17 cross-check sits outside the digest `632a433b…`. `C-F1-U` replayed the omitted script
separately (2,501 checked, 0 mismatches). The figure is right; the word "every" is not.

**Decision 6 — `comb_of_spiders` is a THEOREM about the family, not an empirical dead end; the return
under-claims it.** Both critics give the same one-line proof and I verify it: in
`comb_of_spiders(k)` each `λ = 1` support has exactly one interior neighbour, its own hub, so forced
neighbour requires every maximum independent `J ⊆ D` to contain **every** hub; the hubs form a path,
so for `k ≥ 2` they are not independent. `(★)` fails necessarily, at every size. Retire the family
from the adversarial catalogue with that reason.

**Decision 7 — the return's own open obligation ("a successor wanting an order ≥ 40 witness with
`M > 1` should look for a DIFFERENT construction") is CLOSED, critic-attributed.** `C-F1-T`
(`comb([2]×(t+1))`) and `C-F1-U` (`comb_pairs(k)`) independently constructed the **same** family:
`k+1` supports each with two pendant leaves, chained by `k` disjoint interior edges; order `5k+3`,
`ℓ = 2(k+1)`, `a = k`, `C_1 = ∅`, `M = 2^k`. Both verified it at order 43 with `M = 256`,
`S = −102,016`, `N_2 = 704`, `W_III = 18,432` and the exact identity closing to the digit — two
instruments, identical numbers. I verified the family's structure at `k = 1, 2, 3` (orders 8, 13, 18):
`n = 5k+3`, `M = 2^k`, `C_1 = ∅`, `(★)` holds throughout, eligible from `k = 2`, sign holds, and
`−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III` closes exactly at every `k`; `N_2` matches `C-F1-T`'s predicted
`2·2^{k−1} + (k−1)·2^{k−2}` at `k = 2` (5) and `k = 3` (12). **Grade `bounded_computation`,
critic-attributed.** The open adversarial direction that remains — a high-order witness with `M > 1`
**and** `C_1 ≠ ∅` — is genuinely open; `C-F1-T`'s mixed-λ variants are all eligible and all fail `(★)`.

**Everything else in F1 is retained as backed.** Both critics rebuilt the instrument independently
(centroid decomposition vs pendant-extension with a centre-rooted AHU form vs a bitmask forest DP)
and reproduced every count: 81,137 tree classes, 81,135 with `α ≥ 2`, the `hyp-eligible` column
including the non-monotone 3,156 at order 14, the eligible-residual column and its 16,424 total, 312
at orders 7–12 and 3,244 at 7–15, max `M = 9` at order 17 (`a = 4`, `ℓ = 6`, edge list held by
`C-F1-T`), 295 flat-residual trees, the five fixed points, the whole Phase-3 battery at zero failures,
and a **byte-identical** consolidated digest `632a433b93945a61d5d7dabe25ee948de55231ccd86f5f403380164a36c8e103`
on a full unmodified replay. My own census reproduces every one of these figures inside orders ≤ 14.
The single most important thing this route could get wrong, it gets right: the aggregate is computed
literally through `H_v`, `R_v` and the favorable filter, and (RI) is **checked**, never assumed — the
10 (RI) failures among non-`(★)` constructions are what a genuinely falsifiable identity check looks
like. The `P_7` correction is right and the controller's brief is wrong (erratum **R26-E-b**,
independently confirmed by both F1 critics, by F3, by both F3 critics, by `C-F2-T`, by `C-F2-U`, and
by me: `P_7` has `α = 4`, `x = 2`, so `x + 2 = 4 > α − 1 = 3`).

### F2 — `C1-F-02 C6-B3-DISCREPANCY-REPLAY`

Route verdict `refuted`. **Retained; the refutation is correct and is now stronger than the return
claims; the correction record is widened on five points and three certification literals are struck.**
Both critics returned `retained_narrowed` and agree on every substantive finding.

**Decision 8 — the object refuted is precisely the REALIZATION statement, and the refutation is
UNIVERSAL, not bounded.** The r24 C6 record (T adjudication Ruling 2 narrative and inventory item 6;
synthesis B3; TD-6) says family-(I) weights `ℓ−1−2|A_S|` "flip … realized by 1,420 eligible residual
trees of orders 7–16, first at order 9". Taken literally — as a claim about membership of
`I_{α−1}(G)` — it is **false**. F2's exhaustive replay finds `P_c = P_d = 0` on all 7,247 eligible
residual trees of orders 7–16 (128,908 shell members, 0 unclassified); `C-F2-T` and `C-F2-U`
reproduce every cell on two further independent instruments; I reproduce `P_c = P_d = 0` on orders
7–14. `C-F2-T` adds the sharpening I adopt: because the r24 sentence is itself **range-bounded**,
exhaustion of exactly that range is a *complete* refutation of it, not bounded evidence about it, and
the return's grade line blurs this. **And both critics then removed even that dependence**: family-(I)
`A_C = ∅` is a theorem (see `## Established results`), so the realization is **structurally
impossible** at every order, not merely absent from a census. `REFUTED` stands and does not regress.

**Decision 9 — `P_b` is the predicate that reproduces 1,420, first at order 9. Established by four
independent instruments.** F2, `C-F2-T` and `C-F2-U` each give 1,486 (`P_a`) / **1,420** (`P_b`) /
0 (`P_c`) / 0 (`P_d`) over orders 7–16, agreeing at **every order**; the controller's withheld pre-run
replay (weighed as one more replay, not as authority) gives the same 1,420 and 1,486 with the same
order-9 first occurrence. My own instrument reproduces the per-order `P_a`/`P_b` table exactly at
orders 7–14 (0, 0, 2, 11, 20, 42, 85, 170 and 0, 0, 2, 11, 19, 41, 83, 164). `P_b` — "the induced
graph on the multiplicity-1 supports has an independent set of size `> (ℓ−1)/2`" — is the number's
source. `P_a` overcounts by 66 because some `C_1` supports are mutually tree-adjacent.

**Decision 10 — the order-9 witness, and a reconciliation the portfolio did not make.** There are
exactly **two** order-9 `P_b` isomorphism classes (F2's own table reports `P_b = 2` at order 9). F2
printed one in full; `C-F2-U` correctly supplied the second and `C-F2-T` audited the first cell by
cell. I verified both and add a fact no seat could see: **the controller's pre-run witness
(edges `0-1, 0-5, 0-8, 1-2, 2-3, 2-4, 5-6, 6-7`) is NOT F2's tree — it is isomorphic to `C-F2-U`'s
second witness** (identical canonical form, `i = (1,9,28,37,22,7,1)`, `α = 6`, `x = 3`, `ℓ = 4`,
`M = 1`, shell 7, `S = −18`), whereas F2's (edges `0-1, 0-2, 0-3, 0-4, 1-5, 2-6, 5-7, 6-8`) has
`i = (1,9,28,38,24,8,1)`, shell 8, `S = −20`. Both are `ℓ = 4` with two **independent**
multiplicity-1 supports, matching the r24 adjudication's prose, and neither has a family-(I) member
with non-empty `A_C`. The two replays did not disagree; they printed the two different members of a
two-element set, and the correction record should name both classes so the first occurrence is pinned
without ambiguity.

**Decision 11 — the provenance gap is real and WIDER than the return states.** Both critics read
`adj_engine.py` and `scan.py` in full and confirm neither implements any family classification, any
`A_D`/`A_C`/`A_S`/`C_1` object, any of the four predicates, or any count resembling 1,420; the third
artifact, `scan_4_17.json`, is `scan.py`'s output. Both independently extend the gap to the T
adjudication's inventory **item 5** ("Three-family expansion implemented independently and checked
against the literal `S` on all 312 residual trees of orders 7–12: 0 mismatches") — equally unbacked by
the three scratch files that inventory names as backing every listed computation. **I adopt the
widening: the provenance gap attaches to the adjudicator's whole family-classification instrument,
items 5 and 6, not to the number alone.** Item 5's *content* is independently true (F2 on 312 trees,
`C-F2-T` and `C-F2-U` on all 7,247, me on 677 trees of orders 7–13 with 0 mismatches and 0 partition
failures); only its provenance is missing. `C-T1-U`'s own instruments are outside the frozen grant,
so its antecedent order-16 claim is unverifiable from code; both critics found exactly 2 order-16
eligible residual classes with `ℓ = 8`, `|C_1| = 6`, both `P_b`-true, and `C-F2-U` ships both
adjacency lists. The identification of *which* the r24 critique meant is **unclosable inside the
grant** and **immaterial** — it bears on neither 1,420 nor the order-9 first occurrence.

**Decision 12 — the error classification: right class, but recorded as an INFERENCE, and its origin
is earlier than the return says.** The two critics narrow in two different, compatible directions and
I adopt both. `C-F2-U`: what is *certified* is that `P_b` reproduces the count and the first order,
that the literal realized predicates are identically zero, and that no surviving artifact computes
either; what is *inferred* is that the lost instrument evaluated `P_b` and the adjudicator then wrote
"realized" for it — and the provenance gap is precisely why that cannot be closed. The record must
read "**predicate substitution on the evidence**", not assert the adjudicator's act as fact.
`C-F2-T`: the substitution does not originate with the T adjudicator — critic `C-T1-U` already
offered a `P_a`-shaped structural count of `|C_1|` as evidence of *realization*, with no shell
membership at all; the adjudicator broadened it to `P_b` and supplied the number. **The correction
record attaches to the antecedent sentence as well as to the figure.** I reject the brief's
alternative label "prose": `P_b` and `P_c` are two different mathematical predicates that provably
never coincide on this class (1,420 trees against none), so the defect is in the object computed.

**Decision 13 — "coincidental key-order/format match, not assumed" is STRUCK.** Both critics
independently show the byte-identity of `census_4_17.json` with
`sources/r24/adjudicator-scratch/scan_4_17.json` is **engineered**: `scan.py` writes
`json.dump(rows, f, indent=1)` over dicts keyed `order, trees, residual, flat, nonflat, violations,
closed_form_mismatches`, and `f2_run.py` writes the identical keys in the identical order with the
same non-default `indent=1`, after the seat had by its own account read `scan.py` in full. The
byte-identity carries no evidential weight. What does is the **numeric** agreement, which two critics
reproduce on instruments that write nothing in that format. Restate as numeric agreement.

**Decision 14 — two pointers to an unshipped "interactive session log" are STRUCK as certification
literals.** The brute-force shell cross-check "on 20 sampled trees of orders 9–12" and the withheld
order-16 adjacency lists are cited to an artifact that is not shipped, not digested and not
replayable. Both claims are **true** — `C-F2-T` re-ran the shell enumerator against brute force on
**all 303** eligible residual trees of orders 9–12 (0 mismatches, a stronger check than the sampled
20) and `C-F2-U` shipped both order-16 edge lists — so the content survives on critic evidence; the
citation form does not. A third literal is narrowed with `C-F2-U`: "`weight = ℓ−1 ≥ 1` for `ℓ ≥ 2`,
which holds throughout the residual class **per T3's obligation**" — a sibling seat's *obligation* is
not evidence; cite the two-line derivation instead. `C-F2-U` also notes the `f2_run.py` import list
omits `from fractions import Fraction` (unused, standard library, but the import list is a Stage 3
admission element).

**Decision 15 — "the C6 synthesis TD-6's 16,134 non-flat" is NARROWED to an inference, and the
inference is CORRECT.** `C-F2-T` is right that TD-6 says "16,134 exhaustively enumerated members
(orders 4–17, three instruments)" and does not say "non-flat"; the identification is F2's inference.
I rule the inference **sound** — see `## Cross-route reconciliation`, where I settle it from my
orientation's own evidence.

**Decision 16 — the return's open item 3 (family (II) untested) is CLOSED, critic-attributed; item 2
(the forced-neighbour lemma) is CLOSED, critic-attributed.** See `## Established results`.

### F3 — `C1-F-03 RC-HYPOTHESIS-LOAD-BEARING-MAP`

Route verdict `bounded_evidence`. **Retained on every computational claim; narrowed on four counts,
one of which strikes a null result asserted over objects that were never evaluated.** Both critics
returned `retained_narrowed`.

**Decision 17 (the strongest correction to F3) — part (b).4's null result is asserted over three
objects on which the test was never run, and one of them fails the property.** `C-F3-T` read F3's own
shipped `forest_census.output.json` and found that `K2_plus_K2`, `K2_plus_P3` and `K2_plus_star4`
carry no `S` and no `top_rank_p` key at all: the generator evaluated the sign only on the
`(★)`-satisfying objects. I computed all three with my own instrument and confirm `C-F3-T`'s witness
exactly, with a second, structurally different check:

> **`K_2 ⊔ P_3`** — `V = {0,…,4}`, edges `(0,1), (2,3), (3,4)`. `I(G;z) = 1 + 5z + 7z² + 2z³`;
> `α = 3`, `M = 2`; `Δ_0 = 4, Δ_1 = 2, Δ_2 = −5`, so `x = 2`; `L = {0,1,2,4}`, `ℓ = 4`;
> `p = α−1 = 2`, `Δ`-index `p−1 = 1`. All four leaves favorable; terms `0, 0, +1, +1`.
> **`S(G, α−1) = +2 > 0`**, with `α = 3 ≥ 2`. `(★)` **false** (literal enumeration and the
> `α(G−v)` reduction agree), `hyp-tree` false, `hyp-eligible` false.

**Fence statement, on the face of the finding: this is NOT a counterexample to (RC) and is not
offered as one.** Per `SOLUTION-CONTRACT.md` §3.4 a counterexample must exhibit **every** hypothesis;
this object satisfies `hyp-alpha` alone. `C-F3-U` independently found the same object plus
`K_2 ⊔ P_4` (also `S = +2`), and I confirm both. **Strike** "or in the seven targeted adversarial
constructions", and the route verdict's "every falsification attempt … failed to produce a
counterexample to `S≤0`" inherits the narrowing. Restate as: no counterexample among the 545
`(★)`-satisfying forests censused (order ≤ 12) or among the five `(★)`-satisfying named
constructions; `S` was not evaluated on the three `K_2`-containing constructions, and `K_2 ⊔ P_3` has
`S = +2`. `C-F3-T` also corrects the count: the shipped output names **eight** constructions, not
seven. I confirm the arithmetic (three `K_2` objects + three `P_3 ⊔ mK_1` + `two_P3` + `P_3 ⊔ P_5`).
For completeness I computed the two the critics did not: `K_2 ⊔ K_2` has `S = 0` and
`K_2 ⊔ star_4` has `S = −20`; only `K_2 ⊔ P_3` (and `K_2 ⊔ P_4`) is positive.

**Decision 18 — the return's informational conclusion is NARROWED; the "minimal hypothesis set"
phrase is stronger than the evidence.** `C-F3-U` found the gap in the map's own coverage: parts (a)
and (c) scan `(★) ∧ α ≥ 2` and `eligible ∧ ¬(★)`, which together with `α ≤ 1` leave the non-residual
**and** ineligible trees unreported — and three positives live there. I censused every tree of orders
≤ 14 with `α ≥ 2` and find **exactly four** with `S > 0`, none beyond order 6:

| edges | `n` | `α` | `x` | `ℓ` | `S` | `(★)` | eligible |
|---|---:|---:|---:|---:|---:|---|---|
| `[[0,1],[0,2]]` (`P_3`) | 3 | 2 | 1 | 2 | **+2** | yes | no |
| `[[0,1],[0,2],[1,3]]` (`P_4`) | 4 | 2 | 1 | 2 | **+2** | no | no |
| `[[0,1],[0,2],[0,3],[1,4],[2,5]]` | 6 | 3 | 2 | 3 | **+1** | no | no |
| `[[0,1],[1,2],[2,3],[3,4],[4,5]]` (`P_6`) | 6 | 3 | 2 | 2 | **+2** | no | no |

`C-F3-U`'s list is exact and I confirm it. Each of F3's *scoped* sentences survives — `P_3` really is
the only residual positive (1 of 16,442 to order 17, 1 of 1,487 to order 14 on my count) and there
really is no eligible non-residual positive (0 of 64,569 to order 17; 0 of the 3,834 eligible
non-residual trees of orders ≤ 14 on mine — 5,303 eligible less 1,469 eligible residual)
— but the unscoped informational conclusion does not: "`hyp-eligible`'s ENTIRE observed job is
excluding the single tree `P_3`" is true only relative to the residual class, and the hypotheses are
droppable without a positive only **one at a time**. `{hyp-alpha}` alone plainly does not carry the
sign. `C-F3-T` states the joint-drop census that the map should have carried and I endorse it: over
forests with ≥ 2 components, dropping `hyp-tree` and `(★)` **jointly** while keeping `hyp-eligible`
produces no positive; the positive witnesses need `hyp-eligible` dropped as well. No fence is crossed
— the return's closing hedge fences the paragraph — but the phrase "minimal hypothesis set" must go.

**Decision 19 — "`(RI)` no longer holds (not tested — never invoked)" is STRUCK as stated, and
replaced by a stronger, critic-attributed result.** A statement asserted as fact while declared
untested is an unbacked certification literal. Both critics tested it, on separate instruments, and
converge:

| population | tested | (RI) holds | fails | source |
|---|---:|---:|---:|---|
| trees, residual, eligible | 312 / 677 | all | 0 | `C-F3-T` (≤12) / `C-F3-U` (≤13) |
| trees, residual, ineligible | 18 | all | 0 | both |
| trees, non-residual (either eligibility) | 655 / 1,591 | 0 | all | both |
| forests (≥2 components), residual | 544 / 545 | all | 0 | `C-F3-U` (≤12) / `C-F3-T` (545, ≤12) |
| forests, non-residual | 1,416 | 0 | all | `C-F3-U` |

So the substance of F3's parenthetical is right — part (c) genuinely runs on a different mechanism —
and two facts fall out that the return declined to look for: on these bounds **(RI) is equivalent to
`(★)` on trees**, and **(RI) survives the loss of `hyp-tree` entirely**. That is the missing top row
of the map, which maps hypotheses only against the conclusion `S ≤ 0` and never against the identity
the run is built on. Grade `bounded_computation`, critic-attributed jointly. **No status transfers to
`C5LA1.topRankResidualIdentity`, whose hypotheses are what they are**; a forest version would need its
own statement, contract and alias check (`C-F3-U`'s obligation 3, which I endorse).

**Decision 20 — "verified … independently at `verify_seal.py`'s sibling check" is STRUCK.**
`C-F3-T` read the script in full: it contains no evaluator-digest check of any kind, only the Stage 2
manifest seal against a hardcoded `EXPECTED_SEAL`, and re-prints the same manifest hash under a
second name. The digest itself is correct (three parties verified it, and all 79 source digests match
on my own run) and `tree_lib.py`'s import guard is real — `C-F3-T` read it and found a hard
`SystemExit` on mismatch — so nothing of substance falls; the claim of independent
double-verification does.

**Decision 21 — part (a)'s second deliverable is CITED, not DELIVERED, and the quoted argument has a
hole at `ℓ = 3`.** `C1-ALLOCATION.md` item 6(a) asks for a census to order 17 **and an argument from
the bound**. Both critics record the argument as undelivered; this is honest and is not a
read-boundary breach (the text quoted is the allocation's, a capsule member). `C-F3-T` adds the
substantive point: as F3 states it, the bound is handled for `ℓ ≥ 4` and `ℓ = 2` and **`ℓ = 3` is
never addressed**, where `S ≤ −3M + N_2` is nonpositive only if `N_2 ≤ 3M`. `C1-ALLOCATION.md` item
1(f) names `ℓ = 3` as its own case. Load-bearing obligation 6(a) is **half discharged**. I do not
repair it here; the bound is T1's object and I have not read T1's portfolio.

**Decision 22 — F3's two `proved_informal` grades are EARNED.** `SOLUTION-CONTRACT.md` §4 makes
`proved_informal` conditional on independent re-derivation by a critic or adjudicator; at Stage 3 they
were self-asserted. Both critics re-derived both and I verify both. (b).1 — a maximum independent set
of a disjoint union restricts to one per component; `K_2` has exactly two, `{u}` and `{w}`, which
disagree on both; so `(★)` fails at both whatever the other components are. Order-independent,
connectivity-free, valid, and confirmed by three censuses (0 `(★)`-forests with `α ≥ 2` contain a
`K_2` component). (b).2 — adjacent leaves are each other's unique neighbour, so their component is
exactly `K_2`; with (b).1 this makes `L ∩ C = ∅` a free consequence of `(★)` alone. Valid; 0
violations among all 545. **Grades stand, route-attributed to F3, re-derivation critic-attributed.**

**Decision 23 — (b).3's `ℓ = 2` closure witness is CORRECT and correctly scoped.** `P_3 ⊔ K_1`:
the isolated vertex has degree 0 so is **not** a leaf under `IsGraphLeaf`; `ℓ = 2`, the support has
`λ = 2`, `α = 3` with exactly one maximum independent set `{0,2,3}` (so `(★)` holds, `M = 1`), and
`S = 0`. T3's item 3(iv) conclusion `V = {v_1, s, v_2}` is false here and so is `α = 2`: the step
genuinely consumes connectivity. Both critics confirm by literal enumeration; I confirm. The return's
scoping ("a counterexample to the LEMMA, not to the CONCLUSION `S ≤ 0`") is exactly right. I verify
the observed closed form `S = 2 − 2m` at `m = 0,1,2,3,4` (`+2, 0, −2, −4, −6`), and note that
`P_3 ⊔ 4K_1` is **eligible** and residual with `S = −6`.

## Cross-route reconciliation

**1. The census figures. `16,134` is the NON-FLAT part of the eligible residual class, and Gate
ruling 4 is settled from my orientation's own evidence.** The portfolio appears to disagree and does
not: `C-F3-T` and `C-F3-U` each report that 16,134 "is reproduced by neither population" — but both
tested only `residual ∧ α ≥ 2` and `eligible residual`, never the flat/non-flat split.
`C-F2-T` and `C-F2-U` each computed the split directly and each obtained, over orders 4–17,
16,424 eligible residual = **290 flat + 16,134 non-flat**, with 0 sign violations and 0 flat-law
mismatches. I verify the one hinge those two censuses turn on, which F1's 295 obscured: over orders
≤ 14 I count **87** flat residual trees with `α ≥ 2` and **82** flat *and eligible*; the five
ineligible flat residual trees are `P_3` (`ℓ=2`), `K_{1,3}`, `K_{1,4}`, `K_{1,5}` and the order-6
double star, all of order ≤ 6. `295 − 290 = 5` is exactly that set, so F1's 295 (`C-F1-U`'s
narrowing: it drops the eligibility filter) and the critics' 290 are the same instrument's counts of
two classes. **Ruling: 16,424 (master ledger) = 290 flat + 16,134 (TD-6) non-flat, orders 4–17;
16,442 = 16,424 + the 18 ineligible residual trees, all of order ≤ 11.** The three figures are
reconciled, not averaged, and none is a rival measurement. This confirms the controller's stated
reading, and F2's inference in Decision 15, on the F portfolio's own evidence. F1's 16,424 remains
the run's figure of record per Gate ruling 4.

**2. The `N_2 ≤ M` disagreement — the one genuine claim-level conflict in my portfolio. I rule for
`C-F3-T` on the fact and against both critics on their "smallest" statements.** `C-F2-T`: "`N_2 ≤ M`
is false in general on the eligible residual class: 694 of the 7,247 trees, **the smallest at order
16** with `ℓ = 8`, `k_2 = 4`, `M = 3`, `N_2 = 8`. It fails only for `ℓ ≥ 6`." `C-F3-T`: "**53
counterexamples** among the 695 residual trees of order ≤ 13, at `ℓ ∈ {4,6,7,8,9,10}`", smallest the
order-6 double star `(0,1),(0,2),(0,3),(1,4),(1,5)` with `ℓ = 4`, `M = 1`, `N_2 = 2`. These cannot
both be read as statements about one population. I computed `N_2` from its own definition (pairs
`(J, s)` with `J` maximum independent in `D`, `λ(s) = 2`, `J ∪ {s}` independent), asserting
`|{J}| = M` in code:

- **Over `residual ∧ α ≥ 2`, orders ≤ 13: 695 trees, 53 with `N_2 > M`, `ℓ ∈ {4,6,7,8,9,10}`,
  smallest at order 6.** `C-F3-T`'s count, its `ℓ` distribution and its witness reproduce **exactly**.
  Its order-6 double star has `i = [1,6,10,6,1]`, `α = 4`, `x = 2`, so `x + 2 = 4 > α − 1 = 3`: it is
  residual but **ineligible**, and it is the **unique** ineligible one of the 53 and the unique
  `ℓ = 4` one.
- **Over the eligible residual class, orders 7–14: 1,469 trees, 118 with `N_2 > M`, first at order 9**
  — edges `(0,1),(0,2),(0,3),(0,4),(1,5),(1,6),(2,7),(2,8)`, `ℓ = 6`, `k_2 = 3`, `M = 1`, `N_2 = 3`,
  `S = −30` — with `ℓ` distribution `{6:18, 7:35, 8:33, 9:18, 10:12, 11:2}` and **no failure at
  `ℓ ≤ 5`**.

**Rulings.** (a) `C-F2-T`'s "the smallest at order 16" is **struck**: the smallest eligible-class
failure is at **order 9**, and 52 of `C-F3-T`'s 53 are eligible. (b) `C-F2-T`'s "it fails only for
`ℓ ≥ 6`" is **confirmed on the eligible class** on my bound (orders ≤ 14) and is **false on the wider
residual class** by exactly one tree, `C-F3-T`'s order-6 double star at `ℓ = 4`. (c) `C-F3-T`'s
finding is **correct in full on its own stated population** and must not be read as an eligible-class
statement. (d) Both critics' operative conclusion is **right and I adopt it: no route may use
`N_2 ≤ M` unscoped.** (e) The `ℓ = 3` use is safe for a reason stronger than the census both critics
offer, and I state it: distinct supports have disjoint leaf sets, so `k_2 ≤ ⌊ℓ/2⌋`, hence `k_2 ≤ 1` at
`ℓ = 3`; and `N_2` counts pairs over `M` maximum `J`'s and at most `k_2` supports, so
`N_2 ≤ k_2·M ≤ M`. At `ℓ = 3` the bound therefore gives `S ≤ −3M + M = −2M < 0` unconditionally. This
closes `C-F3-T`'s Finding 5 gap at proof scope rather than numerically, and it is a *derivation from
the definitions*, first stated here (STATED, adjudicator-attributed, isolated second read required
before registration).

**3. The family-(I) tension F1 flagged and F2 owned is RESOLVED in F2's favour, and dissolved.** F1
observed that its confirmed "every family-(I) `B` has `A_C = ∅`" sits in tension with the r24 C6
"1,420 … realized" language, and correctly declined to adjudicate, naming F2 as the owner. F2 shows
the two statements are about different predicates. Four critics then proved family-(I) `A_C = ∅`
outright. There is no tension: the r24 sentence is false, `P_b` is the number's true source, and the
two routes' instruments never disagreed. `C-F1-U`'s watch item is right and I record it: the
reconciliation had to run against the **original r24 artifacts**, not against F1's census, and F2 ran
it that way.

**4. The fibre obligation.** F1 reported it discharged; both its critics show it was not; I confirm.
The obligation is discharged in this cycle at the correct index set — but critic-attributed
(`C-F1-T`, `C-F1-U`), at `bounded_computation` to order 17, and **the universal statement still needs
the deletion injection plus `|U(J')| ≤ |C_1| ≤ ℓ`**, both of which `C-F1-T` proves (see below). Any
Stage 7 contract citing a censused fibre bound must cite `J' ∈ I_{a−1}(D)`, never maximum `J`.

**5. The odd-path closed form.** `C-F1-T` gives `S(P_{2α−1}) = −α(α−3)` and `C-F1-U` gives
`S(P_{2k+1}) = −(k−2)(k+1)`; these are the same formula (`α = k+1`). I verify it at
`P_3, P_5, P_7, P_9, P_11, P_13, P_15, P_17` (`+2, 0, −4, −10, −18, −28, −40, −54`). It unifies three
fixed points, gives `S < 0` strictly for every `α ≥ 4`, and confirms `P_11` as the first eligible odd
path (`α = 6`, `x = 3`, `S = −18`) — F3's correction, confirmed by five parties and by me.
`bounded_computation` as verified, critic-attributed; a conjecture beyond the verified range.

**6. Two controller errata, both independently confirmed by this orientation.** **R26-E-b** (`P_7` is
NOT eligible): confirmed by F1, F3, `C-F1-T`, `C-F1-U`, `C-F2-T`, `C-F2-U`, `C-F3-T`, `C-F3-U` and by
me. **The frozen `first_strict_descent` boundary defect**: confirmed, and corrected from one
disagreement to two (`K_1` and `K_2`, both `α = 1`). Neither affects any r23/r24/r25 result and
neither is a correction record; no sealed file is edited.

## Established results

Graded per `SOLUTION-CONTRACT.md` §4. Every statement below is at the exact C5-LA1 scope; nothing
transfers to `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, `E993-BETA-AGG`, the transport, the
common-leaf condition, TREE, FOREST, TRANSFER or Erdős #993 (fence 1).

### Exact theorems, with the hypotheses each consumes

I verified every proof below line by line; each is short, self-contained and order-independent.
All were **first stated at Stage 4** and are therefore `proved_informal`, **critic-attributed**,
requiring an isolated second read before registration.

**(E1) Maximum-set structure.** Under `hyp-tree`, `hyp-alpha`, `(★)`: every maximum independent set
is `L ∪ J` with `J ⊆ D` maximum independent in `G[D]`; `a := α − ℓ = α(G[D])` with no truncation;
`S ↦ S ∖ L` is a bijection onto the maximum independent subsets of `D`; hence `M = i_α(G)` counts
them and `α = ℓ + a`. Consumes `hyp-tree` (connectivity, via "no two leaves adjacent at `α ≥ 2`"),
`hyp-alpha`, `(★)`. **Not** `hyp-eligible`. Attributed to `C-F2-T` (Step A) and `C-F2-U`
(Preliminaries), independently. I confirmed `M = i_α(G)` computationally on all 1,469 eligible
residual trees of orders 7–14: 0 failures.

**(E2) Forced neighbour.** Under `hyp-tree`, `hyp-alpha`, `(★)`: for every `s` with `λ(s) = 1` and
every maximum independent `J ⊆ D`, `N(s) ∩ J ≠ ∅`. *Proof (verified):* let `v` be `s`'s unique leaf;
if `N(s) ∩ J = ∅` then `(L ∖ {v}) ∪ {s} ∪ J` is independent — `L ∖ {v}` is independent, `J` is
independent, there is no `L`–`D` edge, `s`'s only leaf neighbour is `v`, and `s` misses `J` — and has
size `(ℓ−1) + 1 + a = α` by (E1), so it is a maximum independent set omitting the leaf `v`,
contradicting `(★)`. ∎ **Not** `hyp-eligible`. The *statement* is the literature packet's (fence 7);
the *proofs* are independently derived by **all four** of `C-F1-T` (B), `C-F1-U` (Attack 5),
`C-F2-T` (Step B) and `C-F2-U` (Lemma FN). Four independent derivations of one lemma is the strongest
convergence in this portfolio. 0 violations on my census (orders ≤ 14) and on three critics'.

**(E3) Family (I).** Under the same three hypotheses: every family-(I) member `B ∈ I_{α−1}(G)` has
`A_C = ∅` and `w(B) = ℓ − 1 ≥ 1`; `(v, J) ↦ (L ∖ {v}) ∪ J` is a bijection from
`L × {maximum independent subsets of D}` onto family (I); hence `|Fam I| = ℓ·M` and
`W_I = ℓ(ℓ−1)M`. *Proof:* `|A_D| = a` makes `A_D` maximum in `G[D]`; any `s ∈ A_C` has `λ(s) = 1`, so
(E2) gives `N(s) ∩ A_D ≠ ∅`, contradicting `B` independent; then `Q = 0` and `h = 1` give
`|B ∩ L| = ℓ−1`. ∎ Four independent derivations (`C-F1-T` (C), `C-F1-U`, `C-F2-T` Steps C–D,
`C-F2-U` Corollary FI). **This is the theorem that makes the r24 realization statement structurally
impossible, at every order, and it needs no `hyp-eligible`** — `C-F2-U` verified the extension on the
18 ineligible residual trees (185 shell members, all `A_C = ∅`, weight `ℓ−1`) and `C-F2-T` on all
1,487 residual trees with `α ≥ 2` of orders ≤ 14 (11,972 family-(I) members). I reproduce the
population figure 1,487 exactly and find 0 failures of `|Fam I| = ℓM` and of `A_C = ∅` on my census.

**(E4) Family (II).** Under the same three hypotheses: every family-(II) member has `A_C = {s}` with
`λ(s) = 2` exactly, `|B ∩ L| = ℓ−2` and `w(B) = ℓ − 4` exactly; `|Fam II| = N_2` and
`W_II = (ℓ−4)N_2`; so family (II) is negative precisely when `ℓ ≤ 3`. Same proof as (E3) kills every
`λ = 1` member of `A_C`. Three independent derivations (`C-F1-U`, `C-F2-T` finding 4, `C-F2-U` §2).
This **closes F2's own Remaining-obligation item 3**, which the return inherited as an open gap.
Deviation histogram over 4,406 realized family-(II) members at orders 7–16 is `{0: 4406}`
(`C-F2-U`); `|Fam II| = N_2` with 0 failures on my census (orders ≤ 14) and on both F2 critics'.

**(E5) Budget identity and the exhaustive three-family classification.** From
`|B| = |B∩L| + |A_C| + |A_D| = ℓ + a − 1` and `h := ℓ − Q(A_C) − |B∩L|`:
`(a − |A_D|) + Σ_{s∈A_C}(λ(s)−1) + h = 1` identically, with every term a **natural number** —
`|A_D| ≤ a` because `A_D` is independent in `G[D]`, `h ≥ 0` because the leaves of the supports in
`A_C` are barred from `B` and distinct supports have disjoint leaf sets, `λ(s) ≥ 1` on `C`. A sum of
three naturals equal to 1 has exactly one term equal to 1 — which **is** the three-family
classification, exhaustive and mutually exclusive, with the `a − 1` shell empty at `a = 0`.
Attributed to `C-F2-U` (Attack 8); a single derivation, which I verified and endorse. This upgrades
the exhaustiveness from censused (0 unclassified in 128,908 shell members over 7,247 trees; 0 in
21,577 over 1,469 trees on mine) to **a priori**.

**(E6) Deletion injection and the family-(III) fibre bound.** For any finite graph `H` on vertex set
`U`: `2 Σ_{A ∈ I(H)}|A| ≤ |U|·|I(H)|`, via `A ↦ A ∖ {u}` injecting `{A ∈ I : u ∈ A}` into
`{A ∈ I : u ∉ A}` for each `u`. Hence for `U ⊆ C_1` with `|C_1| ≤ ℓ` (distinct supports have disjoint
leaf sets, each `s ∈ C_1` owning one leaf):
`Σ_{A ∈ I(U)}(ℓ − 2|A|) = ℓ|I(U)| − 2Σ|A| ≥ (ℓ − |U|)|I(U)| ≥ 0`. Attributed to `C-F1-T` (D); a single
derivation, which I verified. This is the Andriantiana–Razanajatovo Misanantenaina–Wagner occupancy
bound **re-proved in-run, never imported** (fence 7 satisfied). It is exactly `C1-ALLOCATION.md` item
8(a)–(b), i.e. U2's compiled target, available as an informal proof.

**(E7) `K_2` component ⟹ `(★)` fails, for ANY finite simple graph; and `(★)` ⟹ leaf/support
disjointness without `hyp-tree`.** Route-attributed to **F3** ((b).1, (b).2), re-derived by `C-F3-T`,
`C-F3-U` and me. Grade **earned** as of Stage 4 (§4 requires an independent re-derivation).

**(E8) `ℓ = 2` with a `λ = 2` support forces `P_3` — the tree closure, present in this portfolio and
not recognized as such.** `C-F3-U`'s §6 lemma is stated for forests (`ℓ(F) = 2` and a `λ(s) = 2`
support ⟹ `F ≅ P_3 ⊔ m·K_1`, `α = m+2`, `S = 2 − 2m`), but **its proof contains the tree statement as
the `m = 0` case**: every component with ≥ 2 vertices has ≥ 2 leaves, so exactly one component `T` is
non-trivial and holds both leaves; by the degree sum `Σ_{v∈T} deg v = 2(|T|−1)` with exactly two
degree-1 vertices, every non-leaf of `T` has degree exactly 2, so `T` is a path; both leaves are
adjacent to `s`, so `T = P_3` and (for a tree) `V = {v_1, s, v_2}`, `α = 2`. I verified the argument
and the closed form (`+2, 0, −2, −4, −6` at `m = 0…4`). **This is `C1-ALLOCATION.md` item 3(iv) —
T3's object — delivered inside my orientation, critic-attributed to `C-F3-U`, and neither the critic
nor F3 flagged it as such.** It is the `ℓ = 2` node of the (RC) DAG, and it is proved. Single
derivation; consumes `hyp-tree` (for the tree case, connectivity is what forces `m = 0`).

### Conditional reductions

**(C1) The exact identity.** `S(G, α−1) = −ℓ(ℓ−2)M − (ℓ−4)N_2 − W_III`, with
`W_III = Σ_{J' ∈ I_{a−1}(D)} Σ_{A ∈ I(U(J'))} (ℓ − 2|A|)`. **Conditional** on the family-(III)
parametrization (the one unproved node, below); given (E3)–(E5) it is otherwise immediate from (RI).
Verified with 0 exceptions on all 16,424 eligible residual trees of orders ≤ 17 by `C-F1-T` and by
`C-F1-U` independently, and by me on orders ≤ 13 (677 trees, 3,685 family-(III) members — exactly
`C-F2-U`'s figure). `bounded_computation`, critic-attributed. The return verifies only the inequality
obtained by discarding `W_III`.

**(C2) The finish, conditional on (C1) and (E6).** `ℓ ≥ 4`: both terms nonpositive, `S ≤ 0`.
`ℓ = 3`: `k_2 ≤ ⌊ℓ/2⌋ = 1` gives `N_2 ≤ k_2 M ≤ M`, so `S ≤ −3M + M = −2M < 0`. `ℓ = 2`: `k_2 ≤ 1`,
and a `λ = 2` support forces `P_3` by (E8), hence `α = 2`, excluded by `hyp-eligible` (which forces
`α ≥ 3`); so `N_2 = 0` and `S ≤ 0`. `ℓ ≤ 1` cannot occur (a tree with `α ≥ 2` has `n ≥ 3` and `ℓ ≥ 2`).
Every branch of this finish is available at my orientation **except** through the unproved node of
(C1).

### Bounded computations (never strengthened)

Exhaustive order-≤ 17 census of 81,137 tree classes; 16,424 eligible residual trees with the whole
structural battery at **zero failures** — (RI) by two routes, forced neighbour, the budget identity in
`ℕ`, family exhaustiveness, `|Fam I| = ℓM`, family-(I) `A_C = ∅`, family-(II) singleton `A_C` and
`|Fam II| = N_2`, `N_2 ≤ k_2 M`, `k_2 ≤ ⌊ℓ/2⌋`, `|C_1| ≤ ℓ`, the bound, and **the sign `S ≤ 0`**;
max `M = 9` at order 17; 295 flat-residual / 290 flat-eligible-residual trees satisfying the flat law
exactly; the fibre inequality at the correct index set, tight, 0 exceptions; 33 in-scope adversarial
witnesses to order 54 and the critic-derived `comb_pairs` family to order 53 with `M = 2^k`; `P_b`
= 1,420 and `P_a` = 1,486 at orders 7–16 with `P_c = P_d = 0`; 545 residual forests to order 12 and
2,246 to order 14 with 0 positives; 64,569 eligible non-residual trees with 0 positives.
Reproduced across three to five independent instruments each, and within orders ≤ 14 by mine. Per
fence 3 **none of this certifies anything universal**, and no route or critic claimed otherwise.

### Refuted

**The r24 C6 B3/TD-6 realization statement** — "family-(I) weight `ℓ−1−2|A_S|` flips … realized by
1,420 eligible residual trees of orders 7–16, first at order 9" — is **REFUTED** as a claim about
membership of `I_{α−1}(G)`: completely within its own stated range by exhaustive replay on four
instruments, and **universally** by (E3). `REFUTED` does not regress; the recovery of the number 1,420
by a different, well-defined, true predicate (`P_b`) does not restore the false one. **B3's identity is
NOT refuted** (confirmed four times more) and **TD-6's obligation is NOT discharged or refuted; it is
narrowed.**

### Record corrections

Two controller errata confirmed (Cross-route reconciliation item 6); the Tier 2 correction record
ruled on below; the Stage 3 admission's `read_boundary_disclosure` flag for F1/F2 noted as
misleading; the Stage 4 disclosures record noted as omitting all six F critics.

## Rejected and narrowed mechanisms

1. **Struck as a certification of the fibre obligation:** F1's Phase-3 row "fibre `W_III(J) ≥ 0` for
   every max `J ⊆ D` — 0 failures". True as literally written, vacuous as evidence;
   `C1-ALLOCATION.md` item 4's fibre obligation is **not discharged by the return**.
2. **Struck:** F1's "one disagreement, exactly `K_1`" (two: `K_1` and `K_2`).
3. **Struck:** F3's "or in the seven targeted adversarial constructions" (eight named; three never
   evaluated; `K_2 ⊔ P_3` has `S = +2`).
4. **Struck:** F3's claim of an independent second verification of the evaluator digest inside
   `verify_seal.py` (no such check exists in the script).
5. **Struck as stated:** F3's "`(RI)` no longer holds (not tested — never invoked)"; replaced by the
   critic-derived (RI)/`(★)` separation.
6. **Struck:** F2's "coincidental key-order/format match, not assumed" (engineered by construction);
   and the two pointers to an unshipped interactive session log.
7. **Struck:** `C-F2-T`'s "the smallest at order 16" for `N_2 > M` (smallest eligible-class failure is
   at order 9).
8. **Narrowed:** F1's "(7,247+ witnesses)", "CONFIRMED, not merely un-falsified", "re-derives … the
   same fact the formally-verified lemma states", "every count above is reproduced by one consolidated
   script", and "295 flat-residual trees" (295 drops the eligibility filter; 290 are eligible).
9. **Narrowed:** F2's "16,134 non-flat" to an inference (which I then confirm), its `f2_run.py`
   import list, its error classification to an inference about a lost instrument, and its clause
   leaning on T3's *obligation* rather than a derivation.
10. **Narrowed:** F3's "minimal hypothesis set" and its part-(c) "extends" (order bound, not proof
    status); F3's part (a) "argument from the bound" is **undelivered**, and as quoted omits `ℓ = 3`.
11. **Retired with a reason, not as an unexplained negative:** `comb_of_spiders` can never satisfy
    `(★)` for `k ≥ 2`; the general obstruction is now named (a construction whose supports have
    `λ = 1` and whose `D`-neighbourhoods a maximum independent subset of `D` can avoid cannot satisfy
    `(★)`).
12. **Forbidden unscoped:** `N_2 ≤ M`. It is false on both the residual and the eligible residual
    class; only `N_2 ≤ k_2 M` survives, and the `ℓ = 3` use is safe only through `k_2 ≤ 1`.
13. **Void:** TD-6's inherited research prescription "any proof must bound the multiplicity-1 support
    count against `ℓ` inside the class" (`C-F2-T` finding 7). By (E3), `A_C = ∅` on every realized
    family-(I) member however large `C_1` is. **No bound on `|C_1|` is needed anywhere.** A successor
    inheriting TD-6 unamended would spend a cycle on a non-problem. This is the correction's operative
    consequence and I adopt it.
14. **Relocated:** the sign-flip phenomenon is real, and it is **family (III)'s** (`C-F2-U` finding 3).
    Under `(★)`, families (I) and (II) have **constant** weights `ℓ−1` and `ℓ−4`; only family (III)'s
    weight `ℓ − 2|A_C|` varies and only it is ever negative (147 members at orders ≤ 13, minimum
    `−6`; 207 negative individual fibre terms on my orders-≤14 run). "Family-(I) weights flip" is
    false; "*some* shell weights flip, in family (III)" is true. This is a materially better successor
    statement than "family (I) is not term-wise signed".
15. **Fences: none crossed, by any return or any critic of this orientation.** Fence 1 — every
    quantity in the portfolio is evaluated at `p = α−1` on ordinary trees (two critics verified this
    in the replayed source, not only the prose); no RTree, transport, common-leaf, TREE, FOREST or
    Erdős #993 object appears. Fence 2 — `P_3` and `P_5` are excluded by `hyp-eligible`, not by `(★)`,
    and `hyp-eligible` is never dropped from the statement of record (Gate ruling 5 respected). Fence
    3 — with the narrowings above, no sentence lets a census carry proof weight. Fence 4 — no
    counterexample is proposed; every positive-`S` object in the portfolio fails at least two
    hypotheses and carries its fence on its face. Fence 5 — all 79 source digests match; no sealed r24
    file was edited. Fence 6 — no refuted mechanism reopened; `first_strict_descent` is used only as
    the definition of `x`, never as a maximizer claim. Fence 7 — attribution travels correctly: the
    forced-neighbour *statement* to the packet, the family expansion to r24 critic `C-T1-U`, the flat
    law to r24 route A1, the occupancy bound re-proved in-run and not imported.

## Lean readiness

**Ruling on (RC) at the exact statement of `SOLUTION-CONTRACT.md` §2, on my portfolio's evidence.**

**(a) A complete informal proof at statement-level granularity with a closed dependency DAG: NO.**
My orientation holds proofs of (E1)–(E6) and (E8) — that is the maximum-set structure, forced
neighbour, families (I) and (II) with their exact counts and constant weights, the budget identity
with the exhaustive three-family classification a priori, the deletion injection with the fibre
bound, and the `ℓ = 2` closure. That is most of the DAG. **It is not closed.**

**(b) Compiled fragments covering named DAG nodes sorry-free: NONE.** No seat and no critic of this
orientation produced a Lean declaration, a build log, a `#print axioms` output, a `sorry` ledger or
any formal-verification literal. There is nothing of that kind to audit at orientation F. The U
orientation carries that lane; I have not read it and make no statement about it.

**(c) Named open nodes.**

**The smallest unproved lemma at my orientation — the family-(III) parametrization.** Precisely:

> Under `hyp-tree`, `hyp-alpha`, `(★)`, the map `(J', A) ↦ (L ∖ {v_s : s ∈ A}) ∪ A ∪ J'` is a
> bijection from `{(J', A) : J' ∈ I_{a−1}(D), A ⊆ U(J') independent}` onto family (III), where
> `U(J') := {s ∈ C_1 : N(s) ∩ J' = ∅}` and `v_s` is `s`'s unique leaf; the weight of the image is
> `ℓ − 2|A|`; and family (III) is empty at `a = 0`. Hence
> `W_III = Σ_{J' ∈ I_{a−1}(D)} Σ_{A ∈ I(U(J'))} (ℓ − 2|A|)`.

Nothing in my portfolio proves it. `C-F1-T` and `C-F1-U` assume the form and bound it;
`C-F2-U` verifies the weight formula `w = ℓ − 2|A_C|` computationally (3,685 members, 0 violations —
a figure I reproduce exactly) but does not derive the indexing; `C-F1-U`'s own obligation 3 names the
identity as underived. I verified the parametrization computationally on all 677 eligible residual
trees of orders 7–13: `|Fam III| = Σ_{J'} |I(U(J'))|` with **0** failures, and the exact identity
(C1) with **0** failures. It is short — the injectivity is immediate, the surjectivity needs the
budget identity (E5) to force all `λ = 1` and `h = 0` once `|A_D| = a−1`, and independence needs only
the no-`L`–`D`-edge fact — but **short is not proved**, and it is the single node on which both the
identity (C1) and the fibre bound (E6) hang. **Without it, `W_III ≥ 0` has nothing to attach to and
(C1) is bounded computation.**

Two further nodes are one-liners but are **absent** from my portfolio and must not be assumed:
`N_2 ≤ k_2 M` (immediate from `N_2`'s definition as a count of pairs over `M` maximum `J`'s and at
most `k_2` supports) and `hyp-eligible ⇒ α ≥ 3` (in `ℕ`, `x + 2 ≤ α − 1` forces `α − 1 ≥ 2`). I state
both here as adjudicator observations (STATED, second read required); the DAG should carry them as
named nodes, not as background.

**Award groups in my orientation that ARE contract-ready.** None of these is (RC); each is a Tier 3
lemma group in the sense of `SOLUTION-CONTRACT.md` §1, standing alone with material reuse. Each is
`proved_informal`, critic-attributed, first stated at Stage 4, and **requires an isolated second read
before registration**. Each carries only the hypotheses named — the (RC) statement of record keeps all
four regardless (Gate ruling 5).

**Group F-A — forced neighbour and the family (I)/(II) structure.** Statement: (E1) ∧ (E2) ∧ (E3) ∧
(E4). Hypotheses: `hTree`, `hAlpha`, `hResidual`. **Not** `hEligible`. Lean-facing notes, which I
endorse from `C-F2-U`: the declaration should carry only those three hypotheses, and the
`ℕ`-subtraction `L.card − 1` must be guarded by `ℓ ≥ 2`, which follows from `hTree` and `hAlpha`. It
states against the C5-LA1 definitions alone (`leafSet`, `leafDegree`, `support`, `indepSetsAvoiding`,
`indepNum`) with no counting machinery. **Contract-ready.** Strongest evidence in the cycle at this
orientation: four independent proofs plus four independent censuses at zero failures. Fences: it is a
statement about shell members and maximum sets, **not** about the sign of `S`; no status transfers to
(RC).

**Group F-B — the deletion injection and the fibre inequality.** Statement: for a `Finset U` of
vertices and `I(U) := {A ⊆ U : G.IsIndepSet A}` as a filter of `U.powerset`,
`2 · Σ_{A ∈ I(U)} |A| ≤ |U| · |I(U)|`; and `(Σ_{A ∈ I(U)} (ℓ − 2|A| : ℤ)) ≥ 0` whenever `|U| ≤ ℓ`.
Hypotheses: **none beyond finiteness** — it is a statement about an arbitrary finite graph.
**Contract-ready**, and it is verbatim `C1-ALLOCATION.md` item 8(a)–(b). Attribution on its face:
Andriantiana–Razanajatovo Misanantenaina–Wagner, re-proved in-run per fence 7. Caveat I record: a
**single** derivation in my orientation (`C-F1-T`); it should get a second reader's eye, not only a
second read of the record.

**Group F-C — the `ℓ = 2` closure and its forest form.** Statement: a finite forest with `ℓ = 2` and
a support of leaf-degree 2 is `P_3 ⊔ m·K_1` with `α = m+2` and `S(F, α−1) = 2 − 2m`; specializing to
a connected `G`, `ℓ = 2` with a `λ = 2` support forces `V = {v_1, s, v_2}` and `α = 2`.
Hypotheses for the tree case: `hTree` (connectivity is exactly what forces `m = 0`). **Contract-ready
for the tree case**, which is the (RC) DAG's `ℓ = 2` node; the forest form is informational and
carries no status to FOREST. Single derivation (`C-F3-U`), verified by me.

**Group F-D — `K_2` component ⟹ `(★)` fails; `(★)` ⟹ leaf/support disjointness without `hyp-tree`.**
Route-attributed to F3, re-derived twice. Lean-ready and trivial, but **not on the (RC) DAG** (the
tree case of leaf/support disjointness already falls out of connectivity), so I do **not** name it
contract-ready as an award group; it belongs in the record as an informational statement.

**NOT ready: (RC) itself.** A fixed-band or bounded result never qualifies and a repackaged identity
never qualifies (protocol check 6). The 16,424-tree census, the order-54 adversarial families and the
order-53 `M = 2^k` witnesses are bounded evidence of nothing universal; the exact identity (C1) is
verified, not derived. **(RC) is not contract-ready at orientation F, and the smallest thing standing
between this orientation and a closed statement-level DAG is the family-(III) parametrization named
above.**

**NOT ready: the Tier 2 correction record as a Lean object.** It is a record, not a theorem; its
structural core (E3) is already inside Group F-A.

## Progress and plateau assessment

material_progress: yes

orientation_plateau: no

The orientation delivered, in one cycle: a **refutation** of a sealed-record claim, first bounded and
then structural; **four independent proofs** of forced neighbour and **four** of family-(I)
emptiness, converting the two largest parts of the shell decomposition from censused regularity to
theorem (`W_I = ℓ(ℓ−1)M` and `W_II = (ℓ−4)N_2` exactly); the budget identity and the exhaustiveness
of the three-family classification proved **a priori**; the deletion injection and the fibre bound
proved; the `ℓ = 2` closure proved; a load-bearing allocation obligation caught undischarged and then
discharged at the correct index set, where the inequality turns out to be **tight**; the exact
identity `−S = ℓ(ℓ−2)M + (ℓ−4)N_2 + W_III` verified to order 17; the whole remaining term-wise
difficulty **relocated** to family (III), with TD-6's research prescription shown **void**; the
`N_2 ≤ M` lemma shown false and correctly scoped; two controller errata independently confirmed; and
an adversarial family with `M = 2^k` closing the return's own open obligation. Every one of these is
progress on the proof or on the correction record, which is what `SOLUTION-CONTRACT.md` §5 asks.

The stop gate's conditions do **not** bear on my orientation. (a) (RC) is not formally verified here —
no Lean artifact exists at orientation F. (b) No in-scope counterexample exists: the four positive-`S`
trees and the two positive-`S` forests in the portfolio each fail at least two of the four hypotheses
and none meets the §3.4 standard; the sign holds on every one of the 16,424 eligible residual trees to
order 17, on 33 adversarial witnesses to order 54, and on the critic-derived families to order 53.
(c) (RC) is **not** proved informally with a closed DAG at this orientation, so Stage 7 is not blocked
on a bounded formalization obligation here — it is blocked on one unproved lemma. A plateau requires
evidence of no material progress; there is none.

## Headline assessment

The run's headline is (RC) **formally verified**. No route, critic or adjudicator can produce that at
Stage 5, and none claimed to: all three returns and all six critiques of this orientation carry
`headline_resolved: no`, and so do I.

At my orientation's evidence grade, (RC) is **not proved** (the statement-level DAG has a named open
node) and **not refuted** (no in-scope counterexample, and the sign survives every attack mounted
against it, including three exhaustive censuses, eight adversarial families to order 54 and two
critic-derived families to order 53). It is exactly as open as `control/C1-STAGE1-GATE.md` records it
entering this cycle — but the *shape* of what remains has narrowed sharply: two of the three families
are now theorems with constant weights, and the whole obstruction sits on the family-(III) fibre sum,
which is the occupancy-bound lane.

headline_resolved: no

status: still_open

**Tier 2 ruling — `E993-R26-C6-B3-FAMILY-I-REALIZATION-CORRECTION`.** I rule on the three questions
the protocol puts to me, and on readiness.

*What the original artifacts computed:* **nothing of the kind.** `adj_engine.py` computes
`indep_poly`, `ik`/`delta`/`alpha_of`/`x_of`, `literal_S` through `H_v`/`R_v`, `residual_and_flat`
and `t_family`; `scan.py` computes the orders-4–17 census columns and writes `scan_4_17.json`.
Neither implements any family classification, any `A_D`/`A_C`/`A_S`/`C_1` object, or any of the four
predicates. **Provenance gap**, and it covers **both** inventory item 6 (the 1,420 figure) **and**
inventory item 5 (the three-family expansion the adjudication says it implemented and checked on 312
trees). Item 5's content is independently true; only its provenance is missing. `C-T1-U`'s own
instruments are outside the frozen grant, so the antecedent claim is unverifiable from code.

*Which predicate reproduces 1,420:* **`P_b` — "the induced graph on the multiplicity-1 supports `C_1`
has an independent set of size `> (ℓ−1)/2`" — exactly 1,420 over orders 7–16, first at order 9, on
four independent instruments.** `P_a` (`|C_1| > (ℓ−1)/2`) gives 1,486. There are exactly **two**
order-9 `P_b` classes and both match the r24 prose "`ℓ = 4`, two independent multiplicity-1
supports": F2's (`i = (1,9,28,38,24,8,1)`, shell 8, `S = −20`) and the one `C-F2-U` supplied, which is
isomorphic to the controller's pre-run witness (`i = (1,9,28,37,22,7,1)`, shell 7, `S = −18`).

*What is true of realized family-(I) terms under `(★)`:* **`A_C = ∅` and `w(B) = ℓ − 1 ≥ 1`,
always** — not merely unobserved in a census but **structurally impossible to violate**, by (E2)–(E3),
on the whole residual class with `α ≥ 2`, eligible or not, at every order. Family (I) is not "not
term-wise signed"; it is **constant and strictly positive**. Family (II) is likewise constant at
`ℓ − 4`. The sign-flip regime the r24 record described is real and belongs to **family (III)**.
Error class: **predicate substitution on the evidence** — recorded as an inference about an instrument
that does not survive, not as a certified account of the adjudicator's act — and the substitution
originates in critic `C-T1-U`'s sentence, not only in the adjudication. Operative consequence:
**TD-6's prescription to bound `|C_1|` against `ℓ` is void.**

*Readiness for registration:* **NOT ready. The record is STATED at Stage 5.** I have changed F2's
draft materially on five points (the provenance gap widened to inventory item 5; the error class
recorded as an inference; the realization shown structurally impossible rather than censused-absent;
the "coincidental byte-identity" struck and replaced by numeric agreement; TD-6's `|C_1|` prescription
declared void and the flip relocated to family (III)) and on two of form (both order-9 classes named;
"16,134 = non-flat" labelled an inference and then confirmed). Per `SOLUTION-CONTRACT.md` §4 and Gate
ruling 6, it therefore requires an **isolated second read** before registration, and registration
awaits the synthesis naming it. Nothing here edits a sealed r24 file; all 79 source digests still
match.

## Next-route allocation

Cycle 2 keeps three routes per orientation. The exact remaining obligation for orientation F is:
**close the family-(III) parametrization, and stop attacking a sign that has survived every
instrument.** The census lane is exhausted as a falsification instrument — five independent
implementations, 16,424 eligible residual trees to order 17, eight adversarial families to order 54,
two critic-derived families to order 53, and not one in-scope counterexample. Spending another cycle
on a larger census would be the plateau this cycle avoided.

**Route F-1 — `C2-F-01 FAMILY-III-PARAMETRIZATION-AND-ADVERSARIAL-FIBRES`.** Prove the family-(III)
bijection stated under `## Lean readiness`, with the `a = 0` emptiness and every `ℕ`-subtraction
audited, and with the exact statement of `W_III` it yields; then attack it — search for an eligible
residual tree where `U(J')` is large relative to `ℓ`, where the deletion-injection slack is 0 at
`|U(J')| = ℓ` with `|U|` as large as possible, and where a family-(III) fibre could be driven
negative. The equality case is `ℓ = |U(J')| = 2`, realized on every eligible odd path at arbitrary
order (`C-F1-T` (H)), so the bound is tight at arbitrarily high order and an adversary has a real
target. **In one cycle this closes (C1) and (E6)'s attachment, which is the last open node of the
(RC) DAG at this orientation** — or exhibits the first object where the fibre bound is not merely
tight but false.

**Route F-2 — `C2-F-02 ADVERSARIAL-WITNESSES-WITH-M>1-AND-C_1≠∅`.** The one genuinely open
adversarial direction the cycle produced. Every `M > 1` construction found so far has `C_1 = ∅`
(`comb_pairs`, `M = 2^k`) and every construction with `C_1 ≠ ∅` and `D ≠ ∅` found so far has `M = 1`
or fails `(★)`; `C-F1-T`'s mixed-λ variants are all eligible and all fail `(★)`. Find a high-order
eligible residual tree with **both** `M > 1` and `C_1 ≠ ∅` — the only region where family (II) and a
non-trivial family-(III) fibre structure interact — and run the full battery on it. **In one cycle**
this either produces the first structural stress on the `ℓ(ℓ−2)M` versus `(ℓ−4)N_2 + W_III` balance,
or proves that the two features are incompatible under `(★)`, which is itself a lemma the proof can
use.

**Route F-3 — `C2-F-03 TIER-2-SECOND-READ-AND-HYPOTHESIS-MAP-CLOSURE`.** (i) Carry the correction
record through its **isolated second read** in the form ruled above, and register nothing until the
synthesis names it. (ii) Close the hypothesis map's real gaps rather than re-censusing: state it over
**subsets** of `{hyp-tree, hyp-eligible, (★)}` rather than one hypothesis at a time, with the four
known tree positives and the two known forest positives as the fixed points any such map must
reproduce; decide whether four is the complete tree list; and decide whether (RI)'s observed
equivalence to `(★)` on trees, and its survival on residual forests, is a theorem — if it is, it is
the sharpest available statement of what `(★)` is for, it belongs to whoever proves it, and it must
never be inferred from the existing r24 award, whose hypotheses include `hyp-tree`. **In one cycle**
this retires the Tier 2 obligation and replaces an informational map with two decided questions.

**Explicitly not funded at this orientation:** a larger no-counterexample census (fence 3, and a
deliverable this run's contract excludes); any attempt on the bound's `ℓ ≥ 4` / `ℓ = 3` / `ℓ = 2`
finish, which belongs to T1/T3 and which I have not read; any Lean work, which belongs to U and to
Stage 7; and any reopening of `comb_of_spiders`, refuted as a family.

**Successor inheritance, in one line each.** (1) `C1-ALLOCATION.md` item 4's fibre obligation is
discharged only at `J' ∈ I_{a−1}(D)` and only as `bounded_computation`; the universal statement needs
(E6) plus the parametrization. (2) `N_2 ≤ M` is false on both the residual and the eligible residual
class and may be used only at `ℓ ≤ 3`, and there only through `k_2 ≤ 1`. (3) TD-6 should be narrowed
to family (III) alone; its `|C_1|` prescription is void. (4) `P_7` must never again be called
eligible; the first eligible odd path is `P_11`. (5) The frozen `first_strict_descent` disagrees with
the literal `x(G)` on `K_1` **and** `K_2`, both `α = 1`; a note, not a correction record, and no
sealed file is edited. (6) `E993-R26-TOP-RANK-RESIDUAL-SIGN` remains **OPEN**; nothing in this
adjudication authorizes a status change, and no census can supply the Stage 7 award.

## Artifact inventory

**Deliverable (the only file written outside my scratch):**
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/cycles/cycle-1/stage5/adjudicators/F/ADJUDICATION.md`
(this file).

**Scratch,** all under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/scratchpad/c1-adj-F/`.
No `/tmp`, no `mktemp`, no `TMPDIR`, no session scratchpad. Nothing under `sources/`, `control/`,
`cycles/` (outside the deliverable), or any seat's or critic's directory was created or modified;
I replayed no seat scratch and copied nothing out. Standard library only — `sys`, `json`, `hashlib`,
`collections`, `functools` — exact integers throughout, no network, no installs, no third-party
package, no wall-clock, PID or host value anywhere.

| File | SHA-256 | What it is |
|---|---|---|
| `verify_seal.py` | `738e77b734c7ecbc4458137a7d8f5565675b71bbaae49da71dbe6ff6dbd622fc` | capsule seal recomputation and all 24 member digests |
| `adjF_lib.py` | `262ecf1c1c81e9da1613efbbd65deb9569617cd3b70ed1ffbd6fd8b192bd0f98` | my instrument: leaf-attachment free-tree generator with a centre-rooted AHU canonical form, explicit DFS/BFS tree and forest tests, forest independence-polynomial DP on induced deletion sets, and every C5-LA1 quantity from `SEMANTIC-CONTRACT.md` — `IsGraphLeaf`, `indepNum`, first-strict-descent `x`, `hyp-eligible`, `(★)` both ways, `H_v`/`R_v`, the favorable filter, the literal `aggregate`, shell enumeration and the family classification |
| `adjF_fixed.py` | `a39873a3040e3ef01a57e3681249878a65d19de1af4c4169756ee20d19c48c4d` | A000055 validation (orders 1–14), the fixed points, the `(★)` shortcut vs literal enumeration on 434 trees, the twelve forest witnesses, the claimed positive-`S` trees |
| `adjF_tm.py` | `68544738c171ec02cbec767e523f75b16a10531defaff5bd12155d479f02378d` | locates `T_1` and `T_2` uniquely by their published i-vectors over my own enumeration |
| `adjF_census.py` | `f673df410bc831acbb53960eec4751e23b0ee7ab9f618dde5809255c429d00bd` | the full structural battery, both fibre index sets, `N_2` versus `M`, the four predicates, the positive-`S` sweep |
| `adjF_census_12.json` | `f84628c046bb4ce06ed04dcbcba346c40df32b364fedcb405fa4bc9090307a5c` | its result, orders ≤ 12 |
| `adjF_census_14.json` | `89d97cf0a048c2b9b90003c56d67012a01d8eb7c92b80596a17573245ce6d4f6` | its result, orders ≤ 14 |
| `adjF_census_14.log` | `ac96f1e785d480b029a3f7e78f350ba3b997ffee677bccb093161a99cedf7418` | its run log |

Two further checks were run inline as `python3 - <<EOF` heredocs from the same directory against
`adjF_lib.py` and are not shipped as files: the `N_2 > M` resolution over both populations
(Cross-route reconciliation item 2), and the family-(III) parametrization check plus the
`comb_pairs`, odd-path and order-9-witness verifications. Each is reproduced by the commands in the
`Replay` block plus the inline snippets recorded in this session; every figure they produce is also
derivable from `adjF_census.py`'s shipped JSON except the three targeted witness checks, whose inputs
are the edge lists printed in this adjudication. **Every numeric claim I make is reproducible from
`adjF_lib.py` plus the named driver, run fresh.**

**Replay (deterministic; absolute paths; every job foreground).**

```
A=/Users/ashtonsperry/VerityOS/experiments/erdos-993-top-rank-residual-sign-dre-2026-09-23/scratchpad/c1-adj-F
cd $A
python3 verify_seal.py      # capsule seal 7cfac90a...9d215, 24/24 member digests
python3 adjF_fixed.py       # A000055; fixed points; (*) shortcut vs literal; forest witnesses
python3 adjF_tm.py          # T_1 = -14, T_2 = -47, each located uniquely
python3 adjF_census.py 12   # orders <= 12
python3 adjF_census.py 14   # orders <= 14  (~3.3 s)
```

**Files read.** The two VerityOS boot files; the 24 capsule members; `control/SOURCE-DIGESTS.json`'s
79 listed files by digest only (bytes streamed into `hashlib`; none opened into context);
`sources/authority/CLAIM-IDENTITY.json` by script, for its entry count, five statuses and the alias
sweep. **No other orientation's return or critique, no other adjudication, no prior synthesis, no
other experiment root, no research-packet directory, no `control/controller-prerun/` file, no
external source, no network.** No recursive search was run above any granted directory.

**Background jobs.** None was ever started. Every computation ran in the foreground of a single tool
call and was awaited to completion; the longest was `adjF_census.py 14` at 3.3 s. There is nothing to
kill before this write, and no pattern kill was used at any point (the Cycle 2 rule — kill by literal
PID only — did not arise).

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority.

Reread before close.
