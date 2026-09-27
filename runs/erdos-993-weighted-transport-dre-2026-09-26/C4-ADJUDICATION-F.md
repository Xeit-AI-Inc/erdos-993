# Orientation Adjudication

Stage 5 adjudicator, orientation F (falsify), Cycle 4 of r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`). Object:
(HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN. Portfolio: returns `F1` and `F2`, and their critiques `C-F1-T`,
`C-F1-U`, `C-F2-T` and `C-F2-U`. Date 2026-09-27.

**Boot.** I am operating within VerityOS. As the dispatch directs, I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in that order, before anything else. I opened no other VerityOS
subsystem. The host placed the project `CLAUDE.md` and the user's auto-memory index into context at session start. I did not
open or act on either.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Central ruling in one paragraph.** No (CUT) exists anywhere in this portfolio, and none of my replays found one. F1's
six-row "no class-union cut" result is a statement about a relaxed class model. It certifies no literal Hall inequality, and
F1's obligation (b) is still open. F2's bounded `G_k` result is correct and was replayed exactly. It is overtaken by the
critic-derived Theorem CT-1 (`C-F2-T`), which I checked step by step and reproduced with an independent instrument. CT-1 gives
an explicit saturating flow on `G_k` using deletion arcs only, for every `k` and every leaf tag set. I also found that the same
construction works at every rank `p ≥ k + 3`. With the registered `G_k` eligibility key, this makes (HALL) hold on an infinite
eligible family. That is a candidate for ruling-30 item (a). It is STATED and critic-attributed, and it needs its isolated second
read before it can be registered. The conjecture "on trees, `S ≤ 0` ⇒ saturation" is refuted at the non-eligible row
`CB(7,1)/6`. Critics of other seats found this. The controller and I each replayed it exactly. It is not a (CUT).

## Identity and seal audit

- **Dispatch.** `control/dispatch/c4-stage5/DISPATCH-ADJ-F.md` has SHA-256 `93b41afdabe8ce0b9b88810f0bdce35da31029a65bbe048567dc41ddb5bfbcc7`. I verified it before following it. **Match.**
- **Capsule seal.** `control/c4-adjudicator-capsules/F-PACKET-MANIFEST.json` carries the inner seal `57bc2c688465367f042c8303724328bbdcca4d4757971e19fd92e30af177e3a9`.
  - I recomputed it over canonical JSON without `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline). **Match.**
  - All 21 members match their listed SHA-256 and byte count (`scratchpad/c4-adj-F/seal_check.py`, exit 0).
- **Packet seals, recomputed.** Stage 2 `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`, Stage 3
  `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9` and Stage 4
  `c68d4df426b21094774866159814a0dea3c6b6bc16dc437f2b08d869fffa4365`. **All match.** The Stage 3 and Stage 4 manifests list `F1`
  (`2b4adde7…`, 37002 bytes), `F2` (`39d3170b…`, 30570) and the four F critiques (`5dc9a0f5…`, `2d948630…`, `d8e87e4d…`,
  `e051f0f0…`) with the capsule's digests.
- **Admissions.** Stage 3 admitted 6/6 with 0 findings. Stage 4 admitted 12/12 with 0 findings. All four F critiques are
  `retained_narrowed` with `headline_resolved: no`.
- **Artifact digests** (checked on my copy-out, before any replay):
  - F1: `micro.py 0f46eaa3…`, `validate5.py 6329972d…`, `run_rows2.py 97b7549c…`, `run_rows.py 5d01d185…`,
    `coarse_check.py 28c280f8…`, `rows_output.json 3ca09377…` and `rows_output2.json 6d910653…` all match. The file
    `rows_output_strict.json 0a36677d…` exists but is not inventoried; both critics flag this.
  - F2: all 11 inventoried files match, including `orbit_types_out.json 320536ac…` and `conjecture_search_out.json e6b5c312…`.
  - `C-F2-T`: `scd_flow.py d370a850…`, `core.py 36f5c250…` and `scd_flow_out.json c3dd1cb5…` match its inventory.
- **Model disclosures on the faces.** `F1` and `F2` disclose sonnet/xhigh with runtime id `claude-sonnet-5`. All four critics
  disclose opus/medium with `claude-opus-5-5[1m]`. Both are consistent with `C4-ALLOCATION.md`.
- **Record discrepancies found in the capsule** (none of them changes a grade):
  - (i) The protocol names the capsule directory `control/c3-adjudicator-capsules/`. The dispatch and the capsule of record use
    `control/c4-adjudicator-capsules/`. I treat the protocol wording as a typo.
  - (ii) Controller fact CF-F6 says "the F adjudicator has the registry". It does not: `control/CLAIM-IDENTITY.run-local.json`
    is not a capsule member.
    - For the refuted keys I used the frozen master registry `sources/authority/CLAIM-IDENTITY.json` (434 claims) and the
      frozen lower-region records `cycle-6/C6-F4/REPORT.md` and `cycle-6/C6-SYNTHESIS/RETURN.json`.
    - For the (NM) key I used the frozen Cycle 3 Stage 7 source `sources/c3-stage7-sources/U1-Main.lean` and its comment
      block.
    - The texts of the 14 run-local keys stay unread. I know them only by name, from `C4-STAGE1-GATE.md`. The synthesis must
      finish the alias checks against the run-local registry.
  - (iii) CF-0 cites controller replay files under `control/controller-facts/`. They are not capsule members, and I did not
    read them. I replayed `CB(7,1)/6` myself instead.
- **My read boundary.**
  - Content reads: the two boot files; the dispatch; the capsule and its 21 members; F1's and F2's scratch; and `C-F2-T`'s
    `scd_flow.py`, `core.py` and `literal.py`. All scratch was copied out first into my scratch directory, and I ran it only
    from the copies.
  - Frozen `sources/` reads (authorized), all partial:
    - `authority/CLAIM-IDENTITY.json`, via `json.load`, for four refuted keys and the (HALL) entry;
    - `lower-region/cycle-6/C6-F4/REPORT.md`, lines 1–60;
    - `lower-region/cycle-6/C6-SYNTHESIS/RETURN.json`, lines 30–60;
    - `c3-stage7-sources/U1-Main.lean`, declaration grep and lines 2785–2830;
    - `c3-stage7-sources/C-U1-F-CriticNM.lean`, lines 1–60;
    - `c1-stage7-sources/U2-Main.lean`, declaration grep;
    - `mathlib-binding/PIN.json`.
  - Listings and searches:
    - Non-recursive `ls` of `sources/`, `scratchpad/c4-F1/`, `scratchpad/c4-F2/`, `scratchpad/c4-crit-F2-T/` (and `own/`), and
      `scratchpad/c4-crit-F2-U/` (and `inst/`).
    - A `grep -rl` inside `sources/` (within the grant) for the refuted key name.
    - One `grep -rln` for "symmetric chain" inside the pinned Mathlib `Combinatorics/` and `Order/` directories. Mathlib sources
      are readable under the protocol, and the path is an allowed root in `PATH-CHECK-F.json`. I disclose it because it lies
      outside the run root.
    - One `ls` of `cycles/cycle-4/stage5/`, which showed the sibling adjudicator directory names `T` and `U`. I did not open
      them.
  - Harness side effects:
    - The harness saved F1's `RETURN.md`, a capsule member, to a tool-results file, and I read it there. The bytes are the
      digest-verified member.
    - One stray redirect wrote a copy of F2's `RETURN.md` into the session scratch directory outside my grant. I deleted it
      without reading it and then read the member directly.
  - What I did not read or run: `scratchpad/c4-F1-replay/`, `scratchpad/c4-F2-replay/`, any other orientation, any other
    adjudication, prior syntheses, other experiment roots or external sources. No network, no installs, no Lean invocation.
- **Process.** Every run was in the foreground with `python3 -B`. No background job was started, so none remains. There is no
  `__pycache__` in my scratch.
  - **Process incident (self-disclosed).** For the final no-jobs check I ran `ps -ax -o pid,command | grep -c '[c]4-adj-F'`.
    That is a filtered full process listing, the class the Stage 3 record flags. It printed only a count, `0`. No command line
    was displayed, and nothing was killed.
- **Process flags of the portfolio, weighed.**
  - F2 used a `pkill -f` pattern kill and a filtered `ps aux | grep`. Both are disclosed (Stage 3 record and its addendum).
  - F1 stopped an auto-backgrounded run with TaskStop.
  - `C-F2-T` stopped at `k = 56` because of the controller lapse R30-N-57.
  - None of these contaminates any number I rely on. `k = 56..60` rest on `C-F2-U`'s instrument and on F2's own replayed run.

## Route-by-route decisions

### F1 — `C4-F-01 POSITIVE-PART-FEATURE-REFINED-CLASS-UNION-CUT-SEARCH`: `retained_narrowed` (route verdict `bounded_evidence` stands)

Claim-by-claim rulings. Where the paired critics disagree, the ruling is stated explicitly.

| F1 claim | C-F1-T | C-F1-U | Ruling (with my evidence) |
|---|---|---|---|
| Table 0 at six rows (`n, α, x`, `F_p` derived as all leaves, supply/capacity/`S` from two sides) | reproduced by own record-scale GF, all six rows digit for digit | reproduced by own GF plus generic DP, all six rows | **RETAINED**, `bounded_computation`. Three independent code paths agree. Gate-31 is satisfied through the critics' instruments. The 328-digit `S` at `CB(8,86)/460` is confirmed. |
| Table 1: "no class-union (CUT) … strongest adversarial record at six rows" | narrowed: saturation of a relaxation; literal `N(U)` is a subset of the class-adjacency credit (factor ≈ 2.1·10^7 at `G/448`) | narrowed: target aggregation plus spurious arcs; the model credits 7624 where the literal value is 22 | **NARROWED**, concordant. The true content is only "F1's relaxed `(τ,q,hasA,hasB,inflag)` class network saturates at the six rows". It certifies no literal Hall inequality, even for unions of refined classes, and it does not exclude a (CUT). The valid direction is this: a model deficit would have exhibited a literal deficient family, because the model omits no literal arc. |
| "EXACT arcs", "extras confined to two places" | struck; 733–1094 extras, and the general q-decreasing arc dominates | struck; 82–195 spurious positive arcs per eligible laboratory | **STRUCK.** My replay of `validate5.py` prints `VALIDATE5_ISSUES` with extras 878 / 986 / 733 / 1094, and the return does not disclose this. |
| 14-instance "exact max-flow match" as validation | non-discriminating (all 14 equal `min(supply, capacity)`) | same | **STRUCK as evidence**, concordant. It stays a consistency check. |
| Micro-transition rules "proved" | necessity halves correct (913k literal arcs, 0 violations); sufficiency/exactness reading false; "proved" is not a grade; STATED | "stand at `proved_informal`"; necessary gates proved | **Disagreement on grade, resolved.** I re-derived D-b, D-u, S-at-b, S-at-u-no-r, S-at-u-with-r and S-at-r from §1.2, and the necessity directions are correct. The class-level exactness reading is false (both critics). The rules are an elementary route-stage lemma on the CB pattern, now adjudicator-verified. They qualify for `proved_informal` if the synthesis registers them, but I recommend **no key**: they are tooling and bear on no statement of record. The return says "ten" types but names 12. |
| `hasA` merge "reachability-equivalent (proved in 2.5)" | not addressed | false (F-3) | **STRUCK.** S-at-u-with-r needs `n_b = 1` exactly, and D-b cannot fire at `n_b = 0`. |
| Obligation (b): sector Hall for every `X ⊆ sec` at `G(8^82,7^2)/448` "covered as a special case" | struck; OPEN | struck; OPEN (at most 15 sector unions tested, and only inside the relaxation) | **OPEN**, concordant. The retraction of the heterogeneous-arity Aut-collapse argument is complete. No number depends on it. |
| Payload digests (lines 257–258 and 429) | wrong | wrong | **STRUCK**, confirmed by my read: the internal fields are `73b46ebd…` and `61f36826…`. Both hash wall-clock `time_s` values, so they are not replay certificates. |
| "776 mismatches", "6 small trees, `d` up to 4", Remaining-obligation items 1 and 2b | struck/narrowed | struck/narrowed | **STRUCK/NARROWED**, concordant. |

**Critic advances on F1** (critic-attributed):
- **A1** (`C-F1-U`). On every q-decreasing arc and every S-at-r bridge, the target satisfies `(hasA, hasB) = (1, hasB(source))`
  and its `inflag` does not rise.
  - I checked the proof: these moves turn in-branches into out-branches with `n_b ∈ {0,1}` and touch no other out-branch.
  - `C-F1-T` independently observed the same `hasB` preservation on 603,879 literal arcs.
  - Status: STATED at a review stage, tooling only.
- **A2** (`C-F1-U`). The tightened relaxation still saturates at the six rows. `bounded_computation`, and still a relaxation.
- **Literal sector families** (`C-F1-T`). Four families have Hall slack under (D) ∪ (S) with the literal `N⁺` at all six rows.
  Ratios at `G/448`: whole sector 14.1052, DEAD 16.2865, `sec01` 17.4053, `sec00` ≈ 42.1. On the CB rows, DEAD runs from 16.5
  to 36.0. `bounded_computation`, and a statement about these families only.
- **Obstruction to (b)** (both critics, concordant; I re-derived the count by hand).
  - The target: `r`, `v`, 28 empty arity-8 branches, and all other branches full with `n_b ≠ 1`.
  - Its 448 sector preimages each add one element to an empty branch.
  - None of them has a positive-weight switch exit. S-at-`u_i` needs `n_b(i) = 1` and `n_c(i) ≥ 1`. S-at-`s` and deletion of
    `r` or `v` land on weight 0.
  - Each preimage therefore has exactly 447 positive deletion exits, and a uniform `1/447` share loads this target to
    `448/447 > 1`.
  - Consequence: no uniform one-hop share rule certifies (b).
- **Laboratory coarseness** (`C-F1-T`). At `CB[3,2]`, `p = 4` (ineligible, `S = 167`), literal sector max-flow is 65 of 80.
  **My own literal replay reproduces 80 / 65 / deficit 15** (`own/sector_lab_out.json`). I did not replay the class-union
  figure of 70.

**Fidelity (F1).**
- The weight is the active-tag weight: `W_{c_ij} = {u_i}` and `W_v = {r}`.
- The relation is literal (D) ∪ (S).
- `F` is fixed at `p` and derived in Table 0.
- `x` is computed through `α`.
- The class machinery hard-codes `F` = all leaves. That is legitimate only because Table 0 derives it on each row.

Every Table 0 number passes. Table 1's numbers are faithful inputs to a relaxation and carry no Hall content. F1 supplies none of
ruling-30 items (a)–(d).

### F2 — `C4-F-02 GK-UNIFORM-HALL-OR-CUT-AND-THE-SATURATION-CONJECTURE`: `retained_narrowed` (route verdict `bounded_evidence` stands)

| F2 claim | C-F2-T | C-F2-U | Ruling |
|---|---|---|---|
| Full (HALL-COND) for every `X` on `G_k` at `p = k+3`: (D) for `k = 3..60`, (D) ∪ (S) for `k = 3..30`, via C3-LA1 | re-derived with own types, literal arcs, own max-flow and arc-by-arc certificates to `k = 40` in both modes and `41..55` in (D); WID checked on all 86 rows | re-derived through `k = 60`/`30`; literal to `k = 8`; types are exactly the `Aut(G_k)` orbits | **RETAINED**, `bounded_computation` (`computer_assisted` per row). C3-LA1 is used at its exact scope: full `Aut(G_k) = S_k × Z_2`, orbit totals, existential arcs, derived `F_p`. **Repairs:** F2's code never asserts WID (`C-F2-T` checked all 86 rows against the literal `S`), and `F_p`/eligibility for `k = 41..60` was not derived in F2's pipeline (both critics repaired it; I derive `F_p` = all leaves, `x = k+1`, `α = 2k+3` and eligibility for `k = 3..80`). **Superseded in kind by CT-1** once CT-1 is confirmed. |
| GK-SIGN re-confirmation, `k = 1..40` | backed | backed | No new grade. It is a re-confirmation, correctly not claimed. |
| "no tested row is even close to tight" | struck; `ρ_k ≈ 1 + 2.06/k` | struck; `ρ_D(30) = 1.0685`; minimiser is exactly `C(L′, p+1)` | **STRUCK**, concordant. The closed form `W(p)/W(p+1)` with `W(j) = C(2k+2, j−1) − C(k+2, j−1) + (k+2)·C(2k+1, j−2)` is an exact count. That `C(L′, p+1)` is the minimiser is `bounded_computation` (`k ≤ 25` and `k ≤ 30`). Every member of `C(L′, p+1)` has positive weight: a zero-weight subset of `L′` has at most `k + 2 < p + 1` elements (my count). |
| Witness-deletion rule fails at `k = 3..7` | backed (13 violations at `k = 3`); diagnosis: units routed to targets where the tag is inactive | backed; the code deletes `c_i`, the tag itself, contradicting the prose "never the tag itself" | **RETAINED** as a record of this rule's failure only. "(never the tag itself)" is **STRUCK**. |
| "a single local, context-free rule cannot" | refuted by CT-1 (a deterministic, tag-local flow) | struck as unsupported, but "whether some local rule works for every `k` is open"; rules U and H fail at `k = 6` and `k = 8` | **Disagreement resolved in favour of `C-F2-T`.** CT-1 sends each `(B, τ)` to its predecessor in a symmetric chain decomposition fixed in advance, independent of every other source's routing. My independent instrument verifies it (below). U and H are two failed fractional rules, nothing more. Both critics strike F2's sentence. |
| Conjecture search (§5): 546 trees, orders up to 29, 1,509 rows, 13 eligible, 0 violations | coverage struck: orders ≤ 17, 49 trees skipped; 265 vacuous rows; single instrument; not a closed-form test | same; the 13 eligible rows identified and re-derived; 12 in the closed band | **NARROWED**, concordant. The counts are labelled samples, not isomorphism classes. **Adjudicator extension:** I ran my own instrument (WID asserted) on the 9 skipped hand-built trees. The 8 of orders 18–24 give 43 rows with `F_p ≠ ∅` and `S ≤ 0`, and all 43 saturate under (D) ∪ (S). The order-29 tree got the polynomial pass only. |
| Obligation (b): no counterexample to the conjecture | — | — | **Outcome: refuted by others.** C-U2-F, C-U2-T and C-T1-F refute the conjecture at `CB(7,1)/6` (cited through CF-0 and CF-F5; their critiques are outside my capsule), and the controller replayed it. **My own literal replay agrees exactly** (see `## Established results`, R6). The tree has order 18, exactly where F2's search silently stopped. The row is non-eligible (empty window), so it is not a (CUT). |
| Obligation (c) (`T(m,2)` premises) | untouched | untouched | **OPEN**; not attempted. |
| `G_k` fixed points "on record in `SEMANTIC-CONTRACT.md` §1.2" | struck | struck | **STRUCK.** I read §1.2 in full, and it has no `G_k` row. The numbers themselves are right, and I reproduce 253/527/−274 … 269507/380552/−111045. |

**Critic advances on F2** (critic-attributed; details in `## Established results`):
- CT-1 (`C-F2-T`): verified by me.
- The Hall-margin family and its closed form (both critics, concordant).
- The bounded up-degree deletion lemma (`C-F2-U`): verified by me.

**Minor correction to `C-F2-T`.** Its item 2 says `x = k+1` for `k = 1..8`. That fails at `k = 1`, where `I(G_1) = 1 + 8y + 21y² + 22y³ + 9y⁴ + y⁵` gives
`x(G_1) = 3`. It holds for every `k = 2..80` (`own/gk_elig_out.json`). CT-1 does not use `x`, so nothing depends on it.

## Cross-route reconciliation

- **F1 versus F2, on the method.** F2 obtained literal Hall on unions of classes by using the exact `Aut`-orbit quotient
  (C3-LA1 at full `Aut`, existential arcs). F1 used a coarser class adjacency, which is only a relaxation.
  - F2's method does not carry over to F1's rows. At `CB(8,86)` the `Aut`-orbits of layer `p+1` are multisets of 86 branches
    over 54 branch-state types, on the order of `10^38` orbits.
  - What remains between the two is `C-F1-T`'s obligation 2: literal-`N(U)` generating-function counting, or a partition
    proved reach-complete. For a partition that is not the orbit partition, the equitable-lift key's hypotheses are also needed.
- **CT-1 versus the CB first ranks.** A per-tag deletion injection forces `q_τ(p) ≤ q_τ(p−1)` for every tag (C-F2-T scope
  remark (i)). It also cannot serve a family whose deletion shadow is deficient.
  - At the five sector-deficient CB first ranks and at `G(8^82,7^2)/448`, the sector is deletion-deficient (ratios
    `460/459 … 448/447`).
  - So CT-1's method provably cannot reach those rows: switch arcs are necessary there. CT-1 and F1's object are disjoint in
    scope, and CT-1 says nothing about the open (O2) families.
- **`C-F2-U`'s lemma versus CT-1.** The lemma (deletion Hall whenever no target has more than `p − 1` sources above it) covers
  every union-independent family on `G_k`, including the tight family `C(L′, p+1)`. It does not cover `G_k`'s full (HALL).
  - CF-F6 asks whether CT-1's routing is "the compression step" that `C-F2-U` named. **Ruling: no.** CT-1 does not compress
    families toward `L′`. It bypasses compression with an explicit flow that serves every `X` at once.
  - The lemma is therefore independent corroboration of CT-1 on the tight family only, not a second proof of CT-1.
- **`CB(7,1)/6` versus the CB first ranks.**
  - At `CB(7,1)/6` the deficient family lies inside the root-plus-arm sector, and a single choke cannot absorb the sector
    deletion deficit through switches.
  - At the eligible sector-deficient rows, the switch image is about 13–15 times the sector supply. The non-eligible failure
    therefore does not transfer as it stands.
  - It does point to where an eligible cut would have to live: a sector-deficient eligible row with small switch capacity
    (route F-A below).
- **The small end of the CB pattern (adjudicator-derived, bounded, single instrument).** The smallest eligible windows are
  one rank wide at `m = 5` for `d = 2` and at `m = 4` for `d = 3..8` (`own/cb_window_out.json`).
  - My literal instrument, validated against my second literal instrument on 24 rows (0 mismatches), finds that full (HALL)
    holds with **deletion arcs alone** at `CB(2,5)/10` (`n` 28; 259980/396460, `S = −136480`), `CB(3,4)/11` (`n` 31;
    835884/1358264, `S = −522380`) and `CB(2,6)/12` (`n` 33; 3036312/4985376, `S = −1949064`).
  - All three lie in the unresolved band. None is switch-necessary. The smallest known switch-necessary eligible row is still
    the order-1427 `G(8^82,7^2)/448`, and that is not a proved minimum.

## Established results

Grades follow `SOLUTION-CONTRACT.md` §4. "STATED" means first stated at a review stage; it needs an isolated second read before
registration.

**R1. (WID)** `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: `formally_verified` (C1-LA1), entering this cycle and not
re-proved. Every instance in this portfolio that reports supply and capacity satisfies `supply − capacity = S` from two
independent sides. For some of them the check was supplied by a critic or by me, as follows.
- F1 Table 0 is confirmed by both critics.
- For F2's 86 orbit rows, `C-F2-T` supplied the check.
- For F2's conjecture rows, WID is unasserted in F2's code, so the rows are counts only.
- All of my own instruments assert it (`ct1_own.py`, `lit_net.py`, `lit_fast.py`).

**R2. Theorem CT-1 (critic-derived, `C-F2-T`; STATED; adjudicator-verified at full statement level).**
- **Statement.** Let `G_k` be: root `0`; leaf `1` on `0`; support `2` on `0` with leaves `3, 4`; arms `0–a_i–b_i–c_i` for
  `i = 1..k`; `n = 3k + 5`. For every `k ≥ 1`, every `F ⊆ leafSet(G_k) = {1, 3, 4, c_1, …, c_k}` and `p = k + 3`, the network of
  `SEMANTIC-CONTRACT.md` §1.2 has a saturating integral flow supported on (D) arcs only. Hence (HALL-COND) holds for every
  `X ⊆ I_{p+1}` under (D), and a fortiori under (D) ∪ (S).
- **What I checked, step by step.**
  - (0) A set containing `0` has at most `1 + 2 + k < p + 1` elements.
  - (1) Per-tag deletion injections `φ_τ : U_τ(p+1) → U_τ(p)` give `f(B, A) = #{τ : φ_τ(B) = A}`. Row sums are `w_F(B)`.
    Column sums are at most `w_F(A)` by injectivity, because images keep `τ` active.
  - (2) The tag slices:
    - `c_i`: `{a_i, c_i} ⊔ S` with `S` in `K_1 ⊔ kP_3`.
    - `3` and `4`: `4 ∈ B` is forced by (0), so `{3, 4} ⊔ S` with `S` in `K_1 ⊔ kP_3`.
    - `1`: `{1} ⊔ S` with `S` in `(k+1)P_3`. Every `S` of size `k + 3` meets `W_1 = {2, a_j}`, because sets avoiding `W_1` have
      at most `k + 2` elements.
  - (3) The de Bruijn–Tengbergen–Kruyswijk split `L_i` of `[0..m] × [0..n]`:
    - It partitions the product into saturated chains from rank `i` to rank `m + n − i`.
    - The point `(s, t)` lies in `L_t` if `t ≤ m − s` and in `L_{m−s}` otherwise.
    - Iterated over the factors, it gives chains symmetric about the sum of the factor centres: `k + ½` for `K_1 ⊔ kP_3` and
      `k + 1` for `(k+1)P_3`.
  - (4) Level `k + 2` (and level `k + 3` for tag `1`) lies strictly above the centre, so every element there has a chain
    predecessor. For tag `1`, a `W`-avoiding set at level `k + 2` has cherry coordinate `{3,4}` and arm coordinates in `{b}` or
    `{c}`. Each of those is the top of its factor chain, so the set is the maximum of its box, hence a chain top and never an
    image.
  - The argument is complete. Its hypotheses are the explicit structure of `G_k`, which is finite (`Fin (3k+5)`); `IsTree` is
    not consumed abstractly. It uses no eligibility, no quotient step and no census value.
- **My independent instrument** (`own/ct1_own.py`).
  - Written from the contract and the proof text only, with its own labelling.
  - It uses a *different* factor order, and for tags `c_i`, `3`, `4` a *different* valid `P_3` chain choice.
  - It verifies the full SCD partition and symmetry at `k ≤ 5`, then the flow literally at `k = 1..7` for `F` = all leaves and
    for two random tag sets per `k`.
  - Result: 21 rows, 0 capacity violations, every arc a deletion, every row sum equal to `w_F(B)`, and WID asserted against the
    literal `H_v`/`R_v` aggregate.
  - Separately, `C-F2-T`'s `scd_flow.py` replays byte-identically (`scd_flow_out.json c3dd1cb5…`, `k = 1..7`).
- **Composition.** CT-1 at `F = F_p(G_k)` (a subset of the leaf set by definition), plus the registered eligibility key
  `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO` (`proved_informal`), gives
  **(HALL) on the infinite eligible family `{(G_k, k+3) : k ≥ 3}`** at `proved_informal` once CT-1's second read confirms it.
  `k = 3` (`n = 14 = 2p + 2`) is in the closed band. `k ≥ 4` is in the unresolved band `2p + 3 ≤ n ≤ 4p − 8`.

**R2′. Rank extension of CT-1 (adjudicator-derived; STATED here at Stage 5; needs an isolated second read).**
- **Statement.** The same construction gives a deletion-only saturating flow at **every rank `p ≥ k + 3`**, for every `k ≥ 1`
  and every `F ⊆ leafSet(G_k)`.
- **Proof delta from CT-1.**
  - Sources have `p + 1 ≥ k + 4` elements, so they avoid `0`.
  - For `c_i`, `3` and `4`, level `p − 1 ≥ k + 2` lies above the centre `k + ½`.
  - For tag `1`, level `p ≥ k + 3` lies above the centre `k + 1`. Its image level is `p − 1`. When `p − 1 = k + 2`, the box-top
    argument applies. When `p − 1 ≥ k + 3`, every set of that size meets `W_1`.
  - When `p + 1 > α = 2k + 3`, there are no sources, and the zero flow saturates.
- **Literal check** (`own/ct1_allranks.py`): 48 rows, `k = 1..7`, every `p` from `k + 3` to `2k + 2` (to `k + 5` at `k = 7`),
  `F` all and random, 0 violations.
- **Consequence.** Every eligible rank of `G_k` satisfies `p ≥ x(G_k) + 2`. So (HALL) holds on `G_k` at **every** eligible rank
  whenever `x(G_k) ≥ k + 1`.
  - My check gives `x(G_k) = k + 1` for `k = 2..80` (bounded). The registered `G_k` key's exact text is outside my capsule.
  - The eligible window is `[k+3, ⌊(4k+6)/3⌋]`. Example: `G_6/10` (`n = 23`, unresolved band), a rank that CT-1 as stated
    does not cover.
- **Scope note only.** With C1-LA2 (`formally_verified`, FLOW⇒SIGN), this gives `S(G_k, p) ≤ 0` at every such rank. That is a
  scope-note candidate. It does not change the primary aggregate, which moves only by its own certificate.

**R3. Bounded up-degree deletion lemma (critic-derived, `C-F2-U`; STATED; adjudicator-verified).**
- **Statement.** For any finite simple graph, any set `F` of degree-one tags, any `p ≥ 2`, any `X ⊆ I_{p+1}`, and `d` = the
  maximum over `A ∈ I_p` of `#{B ∈ X : B ⊃ A}`: `(p−1)·Σ_X w_F ≤ d·Σ_{N_D(X)} w_F`.
- **Why it holds.** Each active tag in `B` has at least `p − 1` deletions that keep it active: only the tag itself and a unique
  witness are excluded. Split each tag's unit equally over those deletions and double count.
- **Corollary.** Deletion Hall holds whenever `|⋃X| ≤ 2p − 1`. On `G_k` this covers every union-independent family with margin
  `≥ 1 + 2/k`.
- **My randomized check** (`own/updeg_lemma.py`): 840 families on `G_3`, `G_4` and random trees, 0 violations.

**R4. F2's bounded `G_k` record.** Full (HALL-COND) holds for every `X` on `G_k` at `p = k + 3`: (D) at `k = 3..60`, (D) ∪ (S) at
`k = 3..30`. Grade `computer_assisted` per row, confirmed by two independent critic instruments. The Hall-margin closed form of
the family `C(L′, p+1)` is exact; its minimality is `bounded_computation` at `k ≤ 30`.

**R5. F1 Table 0.** Six switch-necessary rows, with exact `n, α, x`, derived `F_p` = all leaves, and supply/capacity/`S < 0` from
two sides. `bounded_computation`, three code paths.

**R6. Conjecture C-U2-F refuted at a non-eligible row.** Grade `bounded_computation`. Found by C-U2-F, C-U2-T and C-T1-F.
Controller replay CF-0. My replay (`own/lit_net_cb71_out.json`):
- `CB(7,1)`: `n` 18, `α` 9, `x` 6 (through `α`), eligible window empty. At `p = 6`, `F_6` = all 8 leaves (derived).
- Supply 924, capacity 945, `S = −21`, both sides independent.
- (D) ∪ (S) max-flow 903 (deficiency 21). The residual-cut family `X` has 546 sources, all of rank 7 and weight 1, with literal
  `Σ_{N(X)} w = 525`. Deletion-only max-flow is 812 (deficiency 112).
- The conjecture was `conjecture`-grade and never evidence. This is not a (CUT) (eligibility fails), and neither (HALL) nor the
  primary aggregate is touched.

**R7. The adversarial record for (CUT)** (every horizon attained in this portfolio). **No candidate satisfies every condition
of `SEMANTIC-CONTRACT.md` §1.2.**
- **F1:** six rows, relaxed class model only; no literal family deficient.
- **C-F1-T:** four literal sector families at six rows, all with slack.
- **C-F1-U:** the whole sector and the switch-free family at `G/448`, both with slack.
- **F2:** `G_k`, every `X`, at `k = 3..60`/`3..30`, plus 497 labelled trees of orders 6–17 at every rank with `S ≤ 0`.
- **Mine:** CT-1/CT-1′ (no cut can exist on `G_k` at `p ≥ k + 3`), the 8 skipped trees of orders 18–24 (43 rows), and
  `CB(2,5)/10`, `CB(3,4)/11`, `CB(2,6)/12`.
- **The only deficient family in the record** is at `CB(7,1)/6` and fails eligibility.

**R8. Obstruction at `G(8^82,7^2)/448`** (critic-derived, both critics; elementary; hand-verified by me). Sector targets whose 448
sector preimages all lack a positive switch exit exist, so no uniform one-hop share rule proves obligation (b).

## Rejected and narrowed mechanisms

- **F1's relaxed class network as a Hall certificate.** Rejected as a certificate. "Saturates" means only that the relaxation
  saturates. Any registration must name the relaxation (ruling 33), and I recommend none.
- **F1's class-level "exact reachability" and the `hasA` merge.** Rejected. Only the necessity gates stand.
- **F2's witness-deletion rule.** It fails at `k = 3..7`, and the failure is specific to that rule. The diagnosis should read
  "units routed to images where the tag is inactive", not "load balancing".
- **`C-F2-U`'s fractional rules U and H.** U fails at `k = 6` and H at `k = 8`. Rule-specific failures.
- **The uniform one-hop sector share at `G/448`.** Fails (R8).
- **Conjecture C-U2-F.** REFUTED at `CB(7,1)/6` (R6).
- **Scope of the per-tag symmetric-chain method, named so it is never over-read.** It necessarily fails wherever some per-leaf
  summand is positive, and wherever a deletion shadow is deficient. That excludes every sector-deficient CB first rank. This is
  a scope limit, not a refutation of any registered key.
- **Mechanism-equivalence table.** Refuted keys are quoted from the frozen master registry. The run-local keys are unread and
  left to the synthesis.

| New statement | Nearest refuted or registered item | Distinction |
|---|---|---|
| CT-1 / CT-1′ | `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` (REFUTED; universal *linear* injectivity of the full deletion map `d_p` on marked `W_v`-meeting sets of `H_v`; witness T22, order 91) | CT-1 asserts, on one named family only, the existence of a deletion *matching* per tag. Injectivity of `d_p` implies such a matching, but not conversely. Restricted scope, weaker object. Not a revival. The distinction goes on the face and in `CLAIM-DISTINCTIONS`. |
| CT-1 / CT-1′ | C6-F4 `MATCHING-SUPPORT-INJECTION` (route record: one tag per distinct *own support vertex*; fails on T22/34) | CT-1 injects tag units into target *sets*, not support vertices. A different object. |
| CT-1 / CT-1′ | `E993-R23-LITERAL-DELETE-ONLY-HALL` (REFUTED; universal, r23 literal contract, unweighted `|X| ≤ |Γ_Delete(X)|`) | CT-1 uses the active-tag weight at fixed `F`, on one family. Deletion-only there is a *proved* sufficiency, not a universal claim, which is the same distinction the D1 key carries. |
| CT-1 / CT-1′ | `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT` (REFUTED; positive-to-negative token injection preserving the support label) | Different object: flow on independent sets, no token sign split. |
| CT-1 (lexical) | GK-SIGN and the `G_k` whole-layer key (run-local, names only) | Names are distinct. Mathematically, GK-SIGN is `S < 0` and the whole-layer key is `X = I_{p+1}` only. CT-1 is a flow for every `X`. |
| R3 lemma | (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` (as described in the frozen `U1-Main.lean` comment: the weight-one `CB(d,m)` sector, a regular two-level double count) | Same double-count skeleton. R3 is weighted by active tags, general-graph, and bounded by per-tag valid-deletion and up-degree counts. A distinct statement. The synthesis must confirm this against (NM)'s registered text. |

No refuted mechanism is revived. No closed region is re-proved. No census value enters a proof. There is no RTree wording.

## Lean readiness

**AG-F-1 — `G_k` deletion-arc saturating flow (CT-1, extended by R2′).** The one award group in orientation F with a complete
informal proof.

- **(a) Informal proof: complete** at statement-level granularity, with a closed DAG (verified above). The governance
  precondition is the isolated second read of CT-1 and of R2′. Both were first stated at review stages.
- **(b) Compiled fragments: none.** No seat or critic in orientation F produced Lean.
- **(c) Open Lean nodes: all of N1–N6 below are unbuilt.** None is open mathematically.
- **Terminal statement (draft for the synthesis to freeze):**

```lean
namespace E993Transport
/-- `G_k` on `Fin (3*k+5)`: edges 0–1, 0–2, 2–3, 2–4 and, for `i < k`, 0–(5+3i), (5+3i)–(6+3i), (6+3i)–(7+3i). -/
def gkEdge (k : ℕ) (u v : Fin (3*k+5)) : Prop :=
  (u.val = 0 ∧ v.val = 1) ∨ (u.val = 0 ∧ v.val = 2) ∨ (u.val = 2 ∧ v.val = 3) ∨ (u.val = 2 ∧ v.val = 4) ∨
  ∃ i < k, (u.val = 0 ∧ v.val = 5+3*i) ∨ (u.val = 5+3*i ∧ v.val = 6+3*i) ∨ (u.val = 6+3*i ∧ v.val = 7+3*i)
def gkGraph (k : ℕ) : SimpleGraph (Fin (3*k+5)) := SimpleGraph.fromRel (gkEdge k)   -- with its DecidableRel instance

theorem gk_deletionSaturatingFlow_of_rank_ge (k p : ℕ) (hp : k + 3 ≤ p)
    (F : Finset (Fin (3*k+5))) (hF : F ⊆ C5LA1.leafSet (gkGraph k)) :
    ∃ f : Finset (Fin (3*k+5)) → Finset (Fin (3*k+5)) → ℕ,
      IsSaturatingFlow (gkGraph k) F p f ∧ ∀ B A, 0 < f B A → ∃ q ∈ B, A = B.erase q
end E993Transport
```

- **Hypotheses.** `k`, `p` natural with `k + 3 ≤ p`. `F ⊆ leafSet`. No eligibility, no `IsTree` and no quotient are needed for
  the flow.
- **The (HALL) scope clause** is an informal composition (R2): `F = favorableLeaves (gkGraph k) p ⊆ leafSet` by the carried
  lemma `isGraphLeaf_of_mem_favorableLeaves`, together with the registered eligibility key.
  - A Lean corollary in the shape of `lowerRegionTwoForOneWeightedHall` would also need `(gkGraph k).IsTree` (connectivity and
    acyclicity) and `crossingIndex (gkGraph k) = k + 1`, `indepNum = 2k + 3`.
  - That is GK-SIGN-adjacent Lean content. It is U1's object, which I have not seen. The `G_k` labelling should be unified with
    whatever U1 carries.
- **Fences.**
  - Restricted scope: one explicit tree family.
  - Not (HALL). Not the primary aggregate. Not RTree.
  - Not `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`, C6-F4, R23 delete-only or R19 (table above).
  - Suggested key, a predicate true as named for every `k` (ruling 33):
    `E993-R30-GK-TREE-DELETION-ARC-SATURATING-FLOW-AT-EVERY-RANK-AT-LEAST-K-PLUS-3-FOR-EVERY-LEAF-TAG-SET`. If R2′'s second read
    fails, use `C-F2-T`'s `…-RANK-K-PLUS-3-…` name.
  - (HALL) takes a scope note: "(HALL) holds at `(G_k, p)` for `k ≥ 3` and every eligible `p`", or "at `p = k+3`" under the
    narrower name.
- **Carried fragments**, byte-identical, keyed by (origin award, entry, digest). The registrar reads the entry numbers from
  the receipts; I cannot see them.
  - From C1-LA1's `Main.lean` (`86b59c6c…`): `indepFamily`, `tagWitnesses`, `activeWeight`, `transportRel`,
    `IsSaturatingFlow`, `favorableLeaves`, and the lemma `isGraphLeaf_of_mem_favorableLeaves`.
  - From the first-interior entries: `C4LA1.IsGraphLeaf`, `C5LA1.support` and `C5LA1.leafSet`.
- **New declarations (DAG).**
  - N1 `saturatingFlow_of_perTag_deletionInjections`: any graph and any `F` of graph leaves. Injective per-tag deletion maps
    that keep the tag active yield a deletion-only saturating flow.
  - N2 `gkGraph` basics: `leafSet = {1, 3, 4, c_i}`, the support values, and `tagWitnesses` for the three tag shapes.
  - N3 `gk_root_not_mem`: `0 ∉ B` when `|B| ≥ k + 4`.
  - N4 tag-slice equivalences onto the independent sets of `K_1 ⊔ kP_3` and `(k+1)P_3`.
  - N5 the level-injection lemma: an injective single-deletion map from any level strictly above the centre of a product of
    `K_1` and `P_3` face posets, with the box-top property for the `(k+1)P_3` case.
  - N6 the assembly theorem above.
- **Smallest unproved Lean lemma:** N5's atom. It is the two-chain split: `[0..m] × [0..n]` partitions into saturated chains
  `L_i` from rank `i` to rank `m + n − i`. I searched the pinned Mathlib and it has no symmetric chain decomposition (its LYM is
  for the Boolean lattice only). So N5 is authored in-run.
- **Everything is uniform in `k`.** No `decide` over an enumeration is needed. This group is a natural Stage 7 target only if
  CT-1's second read closes before the Stage 7 dispatch. Otherwise it is a Cycle 5 target.

**AG-F-2 — bounded up-degree deletion lemma (R3, `C-F2-U`).**
- Informal proof complete. Compiled fragments: none.
- Draft statement: `deletionHall_of_upDegree_le (G) (F) (hF : ∀ v ∈ F, C4LA1.IsGraphLeaf G v) (p) (hp : 2 ≤ p) (X ⊆
  indepFamily G (p+1)) (d) (hd : ∀ A ∈ indepFamily G p, (X.filter (A ⊆ ·)).card ≤ d) : (p − 1) * Σ_{B∈X} activeWeight G F B ≤
  d * Σ_{A ∈ N_D(X)} activeWeight G F A`.
- The Lean route is `Finset.card_mul_le_card_mul` on tag-marked pairs `(B, τ) → (A, τ)`: at least `p − 1` children, at most `d`
  parents.
- It is an outcome-B candidate (NMP template), not a (HALL) theorem. Contract-ready only after its second read and the (NM)
  alias confirmation. Low priority.

**Not ready, with the reason:**
- (HALL) at full scope: open.
- Obligation (b) at `G/448`: open. The smallest unproved statement is (HALL-COND) for every `Aut`-invariant `X ⊆ sec` there.
- F1's Table 0, F2's `G_k` range and every bounded result (a bounded result never qualifies).
- F1's micro-rules and A1: tooling.
- (WID) is already `formally_verified`, and nothing new is asked of it here.

## Progress and plateau assessment

Ruling-30 letters, for orientation F:
- **(a) Supplied as a CANDIDATE.** CT-1 is a parameter-uniform restricted-scope (HALL) theorem on the infinite eligible family
  `{(G_k, k+3) : k ≥ 3}`, and R2′ strengthens it to every eligible rank of `G_k`.
  - It is critic-attributed (`C-F2-T`) and adjudicator-verified.
  - Its grade is `proved_informal` only after an isolated second read. The composition's grade is `proved_informal`, set by
    the eligibility key.
- **(b) Not supplied.** `G_k` is not switch-necessary. F1 has no literal full (HALL) at any switch-necessary row.
- **(c) Not supplied.** There is no (CUT) candidate. The only deficient family (`CB(7,1)/6`) is non-eligible.
- **(d) Not supplied.** Orientation F has no Lean. AG-F-1 is a target.

material_progress: yes
orientation_plateau: no

The progress is: the (a)-candidate, plus new adversarial findings.
- The refutation of the conjecture C-U2-F, by others, confirmed by my replay.
- The obstruction to a uniform sector share at `G/448`.
- The exact tight family and the `1 + 2/k` margin on `G_k`.
- The exposure of F1's relaxation.

Each of these defeats the plateau condition "no new lemma at `proved_informal` or better, and no new adversarial finding".
Neither decisive event of the stop gate occurred in this orientation: (HALL) is not formally verified and no (CUT) is confirmed.

## Headline assessment

headline_resolved: no
status: still_open

Per statement, at this orientation's evidence grade:
- **(HALL), full scope:** `still_open`. There is no complete proof and no replayed deficient cut at an eligible row.
- **(WID):** `formally_verified` (C1-LA1), unchanged, and asserted on every instance here.
- **CT-1 (restricted scope):** proved by my verification at the full scope of its own statement. STATED, critic-attributed,
  and pending its isolated second read.
- **R2′ (rank extension):** proved by my verification. STATED at Stage 5 and adjudicator-derived.
- **R3 (up-degree lemma):** proved by my verification. STATED, critic-attributed, an outcome-B candidate.
- **Sector Hall at `G(8^82,7^2)/448` (obligation (b)):** open.
- **Conjecture C-U2-F:** refuted, at a non-eligible rank only.
- **The primary aggregate:** untouched.

## Next-route allocation

**Exact remaining obligation for orientation F.** Two things remain: a (CUT) or its exclusion at the switch-necessary eligible
rows, and sector Hall at `G/448`.
- Decide (HALL-COND) under (D) ∪ (S) at `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, `CB(8,108)/577`, `CB(7,144)/673` and
  `G(8^82,7^2)/448`, for every `Aut`-invariant all-positive-weight `X` that meets the sector, a V⁺ source and a positive S/O
  source (the SR-C3-4 narrowing).
- Decide, in particular, (HALL-COND) for every `X ⊆ sec` at `G(8^82,7^2)/448`. That sector is `r, v` plus a product of 670 `P_2`
  pairs, grouped 82 × 8 and 2 × 7, with every member of weight 1. Its positive exits are sector deletions and S-at-`u_i` when
  `n_b(i) = 1` and `n_c(i) ≥ 1`.
- Any class-level instrument must use the literal `N(U)`: generating-function counting over branch-state multiset classes, or
  a partition proved reach-complete. A relaxation never excludes a cut.

**Route F-A — `CB-SMALL-SWITCH-CAPACITY-SECTOR-CUT-SEARCH`.**
- (i) Across the homogeneous and heterogeneous CB pattern, compute in closed form the sector-deletion-deficient eligible ranks,
  and at each one the literal weight of the switch image and its overlap. Find the row that minimises switch capacity relative
  to the sector deletion deficit. This is the eligible analogue of the `CB(7,1)/6` mechanism.
- (ii) At that row and at `G/448`, decide sector Hall for every `Aut`-invariant `X ⊆ sec`. Either do exact literal-`N`
  generating-function counting, or build a non-uniform two-hop certificate that respects R8.
- (iii) Any deficit found goes to two instruments and an isolated second read.
- **Could close in one cycle:** a (CUT) candidate (stop-gate decisive event (b)), or a `computer_assisted` sector-Hall
  certificate at `G/448` and at the minimising row. The certificate would hand T1 the sector half of ruling-30 item (b).

**Route F-B — `PER-TAG-SCD-FRONTIER`.**
- (i) Hand CT-1/R2′ to the second read and to Lean (AG-F-1; a T/U handoff).
- (ii) Map the method's frontier adversarially. Find the smallest eligible `(T, p)` at which every per-leaf summand is `≤ 0`
  but some tag's deletion injection fails (a per-tag Hall violation). Use an exhaustive census over a stated order range, and
  the named families: equal-length-three spiders, `G_k` variants with 1 or 3 support leaves, `T(m, 2)`.
- (iii) At each frontier row, test literal (HALL) with two instruments.
- **Could close in one cycle:** a second infinite eligible family with (HALL) at `proved_informal`, wherever the per-tag
  symmetric-chain method extends. Or a sharp frontier: the first rows where (HALL) needs coupled multi-tag routing without
  switches. Any (CUT) not caused by switch necessity must lie beyond that frontier.

**Handoffs:**
- CT-1 and R2′ need isolated second reads and the run-local alias checks (PER-LEAF-DOWN-MAP, C6-F4, GK-SIGN, the `G_k` key).
- R3 needs a second read and the (NM) alias check.
- F2's obligation (c) (`T(m,2)` premises) is untouched and should be re-allocated or dropped explicitly.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-adj-F/`. Standard
library only, `python3 -B`, exact integers, all runs in the foreground, no `__pycache__`, no background jobs.

**Own instruments and outputs (SHA-256):**

| File | SHA-256 | Purpose |
|---|---|---|
| `seal_check.py` | `b746405cdd8f5209ccf57899e9c38f503595a669480a0760ca8d3e26db8ded8e` | capsule seal, 21 member digests, Stage 2/3/4 seals |
| `own/ct1_own.py` | `d0ae3f2f4dfcaf4151a9814ea8da45ddc4c886f98feea32b1c3de0160083d12d` | independent CT-1 instrument (own SCD, literal flow check, WID) |
| `own/ct1_own_out.json` | `3c7e79b9843a761ff0226b73ee4db2b909495649494123e9c9bc35c68c97b181` | 21 rows, `k = 1..7`, 0 violations |
| `own/ct1_allranks.py` | `3ece06a8b79dadb72ae95284a8f4c9d33bca3985a1e70ddb3d1f682969715bd0` | R2′ literal check |
| `own/ct1_allranks_out.json` | `822600b08b4c325b8fa2dd0cf610b5ecd628d0af2bda36143d7d5ef6741c3f88` | 48 rows, 0 violations |
| `own/ct1_negcontrol.py` | `b0e626b718f078e6043b8dbd3c8dda5aff29365bf05675ba2f5cdf2442c7f7dc` | alternative tag-1 chain choice (also produced no `W`-avoiding image at `k ≤ 5`; the proof's choice is a sufficient device) |
| `own/gk_elig.py` | `fcd07799ba7984c04ad82b19f5321cf5573ef0f2ea415bab2fff70bc3cbfd9f7` | `G_k`: `α`, `x`, eligibility, derived `F_p`, `k = 1..80` |
| `own/gk_elig_out.json` | `3348c6850e5cd39690af4da79ddb7294f96985cc5f0527e5dc122fc4554ade1d` | output |
| `own/lit_net.py` | `b0632a5bd06a0e0a34304a256653f91f3f74d850882e862f9a6f63df0f9f445b` | literal network instrument (WID asserted; cut re-checked literally) |
| `own/lit_net_cb71_out.json` | `f35e927f5f546c19cb486361520679d875aa64df058b6e7a4b8ed7f1b812dd64` | `CB(7,1)` at every rank (R6) |
| `own/lit_fast.py` | `e4671260d74afb89a32afa7294783f4dc75e1bf10dadbb6cdbecf2d0adc0919b` | layer-only bitmask instrument, iterative Dinic |
| `own/lit_fast_validate.py` | `8988d45f5a50776836faf661315b97bc9b1cd6dedebb65a87ad8e61d6757a80f` | `lit_fast` vs `lit_net` on 24 rows, 0 mismatches |
| `own/lit_fast_CB2_5.json` | `e64dcda1fc69be9d47a3673ec86ea5efc296f62c0d5a29959491f11185be1cd8` | `CB(2,5)/10` |
| `own/lit_fast_CB3_4.json` | `65a38bdb9aabea20a857af1fa0cb0887d41d38e6f4ba571e57e13d375b44bc81` | `CB(3,4)/11` |
| `own/lit_fast_CB2_6.json` | `b82c7b5551d38824dd35ec9502742eb8dfb92aac74c382d8af1ca1066837af97` | `CB(2,6)/12` |
| `own/cb_window.py` | `fd6634b214bc838f1882be3a7d6b07c54a376e2d583d1ca91ee549d1f783b4f5` | smallest eligible CB windows (closed form cross-checked with the DP) |
| `own/cb_window_out.json` | `cc2953bd25ec129e44cb8202e745ddff431ece1bedf983a2d722797261b6cf12` | output |
| `own/skipped_scan.py` | `9faf813bf42dfc1e7b0212b299d604d3fd05cf3549655441edbc37718f2e82bc` | F2's 9 skipped hand-built trees (imports F2's copy-out only for the edge lists) |
| `own/skipped_scan_out_N18.json` | `b03ea7341b2be87e1efecad3ee28252249f920a802b5f2e286466c3907f5ba72` | first pass, networks up to order 18 |
| `own/skipped_scan_out_N24.json` | `246697a9a3170f3f569af1eab251d75cdfb877551014b877421ee7f0dce7193d` | networks up to order 24: 43 rows, 0 deficient |
| `own/sector_lab.py` | `914763ce216604a8c90cf18378fa6bf4b262e28ae81f6e3b590891a145401de7` | `CB[3,2]/4` literal sector flow |
| `own/sector_lab_out.json` | `d405335e651c2fd23eb9ab876699444de90516b530f73616384827274dff4a84` | 80 / 65 / 15 |
| `own/updeg_lemma.py` | `1ac960004f6f14c0bc263e60efefbc5718127cc7004e2a7c2ab89d14ee9fc84e` | R3 randomized check |
| `own/updeg_lemma_out.json` | `bfa4d20f433717ee5e45322ed4d821191ad46966922120068b96ffe9b4fe8527` | 840 families, 0 violations |

**Copy-out replays (not my own code):**
- `copy-F1/` holds F1's 25 scratch files. `validate5.py` replayed and printed `VALIDATE5_ISSUES` (extras 878 / 986 / 733 / 1094)
  and `VALIDATE5_MAXFLOW_OK`. I did not replay `run_rows.py` or `run_rows2.py`, because both critics replayed them exactly.
- `copy-F2/` holds F2's 13 files. They are imported only as the object under test, for the hand-built edge lists.
- `copy-critF2T/` holds `C-F2-T`'s `scd_flow.py`, `core.py` and `literal.py`. Its replay under `copy-critF2T/run/` gave
  `scd_flow_out.json c3dd1cb5…`, byte-identical to the shipped file, and `scd_replay_k7.txt`
  (`eaadce6af0d0ab9e2bf3930a396761ea69096dd704cacac092826c244989e0c6`).

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]
