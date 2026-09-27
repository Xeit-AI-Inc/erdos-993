# Critique

Critic `C-F2-U` (orientation U, formal/structural), Cycle 1 Stage 4, run r30
(`erdos-993-math-dre-20260926-r30-weighted-transport`). Assigned return: `cycles/cycle-1/stage3/returns/F2/RETURN.md`
(route `C1-F-02 FIDELITY-AND-MECHANISM-EQUIVALENCE`, seat F2, orientation F).

**Boot acknowledgment.** I operated within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. After that I read only what the dispatch grants: the sealed
dispatch, the capsule members, the frozen `sources/`, and the return's inventoried scratch, which I copied out before replaying.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosures (own).**
(1) The harness injected the project `CLAUDE.md` and the user auto-memory index into my session context automatically. I did not
open them with a read, and I used nothing from them as evidence.
(2) The harness saved the return's text to a tool-result copy under `~/.claude/projects/…/tool-results/` because the text was
long, and I read it through that copy. The content is identical to the capsule member, whose digest `cd0976be…` I verified.
(3) I ran `find` and `os.walk` only inside `sources/`, which is within my grant, for the 981-file re-digest. I ran `ls -la` only on
`scratchpad/c1-F2/`, the return's inventoried artifact directory.
(4) For the registry reads I opened two authorized frozen files: `sources/authority/CLAIM-IDENTITY.json` and
`sources/lower-region/records/FINAL-REGISTERED-CLAIM-IDENTITY.json`. They are byte-identical, both with digest `eba20be3…`.
(5) I searched `sources/lower-region/cycle-6/C6-F4/REPORT.md` with `grep`.
(6) The control files `control/CLAIM-DISTINCTIONS.json` and `control/CLAIM-IDENTITY.run-local.json` are not capsule members. I did
not open or hash them. I checked the return's cited `(bytes, sha256)` for these two files against their entries in the sealed
Stage 2 manifest, which is a capsule member.

I read no other return, critique, adjudication, experiment root, or network source, and I installed nothing.

## Identity and seal audit

All seals were recomputed canonically: SHA-256 over the manifest JSON minus `seal_sha256`, with `sort_keys` and separators `(",", ":")` and
no trailing newline (`scratchpad/c1-crit-F2-U/seals.py`):

| Manifest | Recomputed seal | Embedded | Match |
|---|---|---|---|
| capsule `control/c1-critic-capsules/F2-PACKET-MANIFEST.json` | `32f5d900dcaf29b39bcdcd02c0ba5fe646356216bc6f0eb34533c1875ebba0f6` | same | yes |
| Stage 4 dispatch `control/C1-STAGE4-DISPATCH-MANIFEST.json` | `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc` | same | yes |
| Stage 3 `control/C1-STAGE3-PACKET-MANIFEST.json` | `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac` | same | yes |
| Stage 2 `control/C1-STAGE2-PACKET-MANIFEST.json` | `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92` | same (= dispatch value) | yes |

- **Capsule members.** All 14 members match their listed `(bytes, sha256)`, including the return (`cd0976be…`, 45465 bytes).
- **Source re-digest.** I recomputed all 981 entries of `control/SOURCE-DIGESTS.json` myself. Result: 981/981 match, with no unlisted
  file and no missing file under `sources/`. `sources/lower-region/inputs/` contains only `ordinary_tree_checked.py`, and no
  `__pycache__` or `*.pyc` exists anywhere under `sources/`. This confirms F2's self-corrected write disclosure: the deletion
  left no trace. My own replay set `PYTHONDONTWRITEBYTECODE=1` and created no cache there either.
- **Digests the return lists.**
  - `FINAL-REGISTERED-CLAIM-IDENTITY.json` `eba20be3…` matches.
  - `C6-T5/EVIDENCE.json` `0ed20395…` matches.
  - `CLAIM-DISTINCTIONS.json` `(6853, a257ebbc…)` and `CLAIM-IDENTITY.run-local.json` `(2409146, 86f94811…)` match their Stage 2
    manifest entries.
  - The evidence digest `3c6226b1…` is reproduced by my copy-out-first replay (next section).
- **Registry keys.**
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` is OPEN in the frozen registry.
  - (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` is run-local OPEN (Stage 1 gate).
  - The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` is OPEN and untouched.
  - The ten refuted keys and the two fenced extras (`E993-C3-G1-POINTWISE-ADDABILITY-BOUND`, `E993-R28-TREE-LEAF-SLOT-DOMINANCE`) are
    REFUTED in the frozen registry, as the return says.
- **Lexical alias check.** I searched `statement` and `scope` in the 434-claim master for `unreachab`, `reachab`, `maximal independent`,
  `private neighb`, `in-arc`, `switch` and `two-for-one`. There were exactly four hits, all on `reachab`:
  `E993-PAIR-EDGE-JOIN-COMPOSITION`, `E993-R25-COVER-CELL-DRIFT-CRITERION`,
  `E993-R25-THIN-TREE-TAU-12-BAND-NO-IN-WINDOW-FAILURE-NO-RECOVERY` and `E993-R28-BRANCH-TREE-SURPLUS-IDENTITY`. These are the same
  four the return reports.
- **Mathematical alias check.** None of the four is a statement about in-arcs of the (D)∪(S) network. The C1 lemma and the C2 family
  statement below have no alias.
- **The return's own model line.** It reads "Chartered Sonnet/xhigh … `claude-sonnet-5`", which is consistent with `C1-ALLOCATION.md`
  (routes are Claude Sonnet 5, xhigh).

## Independent re-derivation

I wrote my own instrument, `scratchpad/c1-crit-F2-U/crit_lib.py`, from `SEMANTIC-CONTRACT.md` §1.2 alone. It shares no code with
`f2_lib`. It uses:

- bitmask independent-set enumeration;
- `x` scanned through rank `α` (with `i_{α+1} = 0`);
- `F_p` from `Δ_p(T − v) < 0` on the original tree;
- `w_F` read literally: `v ∈ F ∩ B` with `(B ∖ {v}) ∩ W_v ≠ ∅`;
- (D) ∪ (S) read literally;
- exact Dinic max-flow.

Every instance asserts eligibility and `supply − capacity = S` before any output. Trees pass separate connectivity (BFS) and
acyclicity (union-find) tests. Free trees are enumerated by level sequences with a center-rooted AHU canonical form. The counts
reconcile with A000081 and A000055 through order 16 (1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301, 3159, 7741, 19320).

**Fixed points (own instrument, `fixed_points.py`; all eligible; all assert `supply − capacity = S`).**

| Tree | n | α | x | Δ_x | p | \|F\| | S | supply / capacity / flow | arcs (switch-only) | literal supply / cap / flow | Σ Δ_{p−1}(H_v) | Σ Δ_{p−1}(R_v) |
|---|---:|---:|---:|---:|---:|---:|---:|---|---|---|---:|---:|
| `K_{1,12}` | 13 | 12 | 6 | −132 | 8 | 12 | −1980 | 1980 / 3960 / 1980 | 1980 (0) | 1980 / 3960 / 1980 | −1980 | 0 |
| path-star (2,3,4) | 15 | 11 | 5 | −61 | 7 | 10 | −1218 | 1483 / 2701 / 1483 | 2025 (281) | 1563 / 2969 / 1563 | −1406 | −188 |
| path-star (2,2,4,3) | 18 | 13 | 6 | −285 | 8 | 12 | −5434 | 8033 / 13467 / 8033 | 11691 (1971) | 8751 / 15468 / 8751 | −6717 | −1283 |

- **Match with the return.** Every number in the return's B2 table and fixed-point table matches.
- **B1 identity.** `Σ_{I_{p+1}} |F∩B| − Σ_{I_p} |F∩A| = Σ_v Δ_{p−1}(H_v)` holds on all three rows. `S = Σ_v [Δ_{p−1}(H_v) − Δ_{p−1}(R_v)]`
  holds, so the struck weight omits exactly `Σ_v Δ_{p−1}(R_v)`, which is −188 and −1283 on the path-stars.
- **The allocation's guess was wrong.** Its `Σ_v [i_p(T−v) − i_{p−1}(T−v)]` is not the right form. The correct form is `H_v = T − N[v]`,
  because `#{B ∈ I_j : v ∈ B} = i_{j−1}(T − N[v])`. The return derives the correct form.
- **K_{1,12} weights.** Literal and active weights coincide on every source and target (`lit_eq_active_everywhere = true`).

**T_22 at p = 34 (own forest DP, `extras.py`).**
- Values: `n = 91`, `α = 68`, `x = 32`, `Δ_x = −940335682600092973`, `|F| = 67` (all leaves), `S = −498754180547001418536`.
- Layer sizes: `i_34 = 289115251921304851378` and `i_35 = 254400180721024303524`.
- Summand multiset: {`212336130412243110` ×1, `−7560098737536570631` ×66}.
- All values match the return. The orbit-flow triple remains cited (C6-T5), exactly as the return says.

**CB(8, 92) sector (exact `Fraction`).**
- Active-weight ratio: `|R_491|/|R_490| = 492/491`.
- Struck ratio: `|R_s|(1 + s/2)` gives `493/491`.
- Deletion-only shortfall: `(|R_491| − |R_490|)/|R_490| = 1/491`, which is `|R_490|/491`.
- All three match B3. The sector-weight-one argument (a private tag's only witness is its absent choke; the arm tag is active through
  `r`) is correct as written.

**(WID) at statement level.** I re-derived the bijection independently. For a fixed tag `v`:
- `B ↦ B ∖ {v}` maps `{B ∈ I_j : v ∈ B, B ∩ N(s_v) ≠ ∅}` onto `{A ∈ I_{j−1}(H_v) : A ∩ W_v ≠ ∅}`, whose size is `i_{j−1}(H_v) − i_{j−1}(R_v)`,
  because `H_v − W_v = G − N[s_v]`.
- `s_v ∉ B` uses only `v ~ s_v` and the independence of `B`.
- `A ∪ {v}` independent uses only `N(v) = {s_v}` (degree one) and `s_v ∉ A`.
- The hypothesis needed is "every `v ∈ F` has degree one", not `F ⊆ leafSet` as a set. Leaves sharing a support are separate summands
  that witness each other, which matches `C5LA1.aggregate`'s sum over leaves.
- `IsTree` is not used. My check on 336 rows of random general simple graphs (cycles present, arbitrary `F` of degree-one vertices,
  shared supports, every `p` from 1 to `α`) gave 0 failures.
- The proof is correct and complete. The grade of (WID) is `proved_informal` at statement level.

**Structural finding on the `p ≥ 1` guard (critic-derived).** In integer form with `q_v(−1) := 0`, the identity holds trivially
at `p = 0`: both sides are 0. In the contract's ℕ-subtraction Lean form, `p − 1 = 0` at `p = 0`, so the right side becomes
`Σ_v [Δ_0(H_v) − Δ_0(R_v)] = Σ_v |W_v|`, which is generally nonzero. On `K_{1,3}` with `F` = all leaves, the left side is 0 and the
ℕ-form right side is 6. So `hp : 1 ≤ p` in `layerWeight_sub_eq_sum` / `activeWeightAggregateIdentity` is load-bearing, not
cosmetic. The return says "`p ≥ 1`" but never says why.

**(FLOW⇒SIGN) and (HALL⇒FLOW).** Both arguments are correct. For the clone-expansion step, the return asserts that it suffices to
check unions of whole clone classes. The missing sentence is this: a Hall violator on a partial clone set stays a violator when
completed to whole classes, because completion leaves its neighbourhood unchanged and only increases its size. Also, zero-weight
targets contribute no clones, which matches `Σ_{A∈N(X)} w_F(A)`. Grade: `proved_informal` for both.

**Replay of the return's scripts (copied out to `scratchpad/c1-crit-F2-U/replay/`).** `f2_main.py`, `f2_part2.py`, `f2_part3.py` and
`f2_combine.py` all exit 0. The script prints `3c6226b1cd9e7706d465002d4d0d1f03fa40591ca12bc1519fec102b35ebc186`, and all four
evidence JSONs are byte-identical to the shipped ones.

**C1 reachability lemma.** The lemma says: an independent `p`-set `A` has no in-arc iff `A` is maximal and no `u ∈ A` has two
private neighbours. My proof:
- A (D)-preimage of `A` is `A + q` with `q` addable.
- An (S)-preimage at `u ∈ A` is `B = A − u + {y, z}` with `y, z ∈ N(u)`. Independence of `B` forces `N(y) ∩ A = N(z) ∩ A = {u}`, and
  `y ≁ z` holds by triangle-freeness.
- `N(u) ∩ B = {y, z}` exactly, because the other neighbours of `u` lie outside `A` (since `A` is independent) and outside
  `{y, z}`. Conversely, every such pair gives a legal switch.
- So the lemma is TRUE on every triangle-free graph, not only on trees.

I checked it against a direct in-arc scan of every target in every eligible row of orders 11–16 (3,806 rows): 0 mismatches.
Grade: `proved_informal`.

## Attacks and findings

**F-1 (critic-derived advance; resolves the return's open §C2).** Eligible `(T, p)` with a positive-weight, arc-unreachable target
exist.

*Census (own instrument; attained horizons, not filtered).*

| Order | Eligible rows | Rows with a maximal positive-weight target | Rows with an arc-unreachable positive-weight target | Max gap `Σ_{I_p} w − Σ_{N(I_{p+1})} w` |
|---:|---:|---:|---:|---:|
| 11 | 5 | 2 | 0 | 0 |
| 12 | 34 | 21 | 0 | 0 |
| 13 | 163 | 138 | 0 | 0 |
| 14 | 313 | 274 | **11** | **2** |
| 15 | 528 | 356 | 0 | 0 |
| 16 | 2763 | 2248 | 0 | 0 |

- The eligible-row counts reproduce the controller's erratum R30-E-a counts (5, 34, 163, 313, 528, 2763). Here they are an
  own-instrument count, not an import.
- Maximal positive-weight targets are common. Through order 13 every one of them is switch-reachable.
- The first unreachable instances occur at order 14. In every such row the unreachable set is unique and the gap is exactly 2.

*The family, with proof of unreachability for every m.* Define `T(m, k)` for `m ≥ 2`, `k ≥ 2`:
- a path `c_1 – d_1 – c_2 – d_2 – … – d_{m−1} – c_m – f – s`;
- one pendant leaf `e_i` on each `c_i` with `i < m`;
- `k` leaves `ℓ_1..ℓ_k` on `s`.

Then `n = 3m + k` and `p = m + k`. Take `A = {c_1, …, c_m, ℓ_1, …, ℓ_k}`.

- `A` is independent.
- `A` is maximal: every `d_i`, `e_i` and `f` is adjacent to some `c`, and `s` is adjacent to the `ℓ`'s.
- `c_i` with `i < m` has exactly one private neighbour, `e_i`. Each `d_i` has two `A`-neighbours.
- `c_m` has exactly one private neighbour, `f`, because `s ∉ A`.
- No `ℓ_j` has a private neighbour, because `s` has `k ≥ 2` neighbours in `A`.
- By the C1 lemma, `A` has no in-arc of (D) ∪ (S).
- `w_F(A) = k` whenever the `ℓ_j` are in `F`: each `ℓ_j` is active through another `ℓ_{j'} ∈ W_{ℓ_j}`.

This part is `proved_informal`, for all `m` and `k`.

*Eligibility and favorability (bounded).* Exact DP for `k = 2`, `4 ≤ m ≤ 60` and for `k = 3`, `5 ≤ m ≤ 60`:
- every row is eligible, with the `ℓ_j` favorable at rank `p`, and all leaves favorable where checked by full enumeration;
- for `k = 2`, `α = 2m + 1`, so `2α + 1 − 3p = m − 3`;
- `x` stays at or below `m`; for example `x = 57` at `m = 60`.

This part is `bounded_computation`.

*Second instrument (`witness_check.py`: frozensets and `itertools`, relation typed directly from the contract text).*

| Instance | S | supply / capacity | unique positive-weight unreachable target | in-arcs | gap |
|---|---:|---|---|---:|---:|
| `T(4,2)` | −252 | 202 / 454 | `A = {c_1..c_4, ℓ_1, ℓ_2}` | 0 | 2 |
| `T(5,2)`, n = 17 | −1094 | 1173 / 2267 | analogous | 0 | 2 |

- In edge-list form, the order-14 row is path `0–…–9`, `9–10`, `9–11`, `5–12`, `3–13`, with `p = 6`, `α = 9`, `x = 4`, `|F| = 5`,
  and `A = {1, 3, 5, 7, 10, 11}`.
- The order-14 rows also saturate under exact max-flow (all 313 order-14 rows saturate). This is not a cut and has no bearing on
  (HALL)'s truth.

*Consequence, stated exactly.* On these eligible rows, (HALL-COND) at the single family `X = I_{p+1}` requires
`supply ≤ capacity − 2`. That is strictly stronger than the scalar `S ≤ 0` that (WID) makes it equivalent to on rows without
unreachable positive capacity. This answers `C1-ALLOCATION.md` item 4(b), "exhibit or exclude": exhibited.

Candidate key for Stage 7 discretion: `E993-R30-UNREACHABLE-POSITIVE-TARGET-FAMILY`. The unreachability half is `proved_informal`
for every `m`; eligibility for every `m` is open; the evidence as a whole is `bounded_computation`.

**F-2 (overclaim to strike).** Remaining-obligation item 1 and §C2 of the return say that a "no" answer to §C2 "would show (HALL) is
exactly equivalent, on positive-weight targets, to `S ≤ 0`". That is false.
- Having no unreachable positive-weight target only makes (HALL-COND) at `X = I_{p+1}` equivalent to `S ≤ 0`.
- (HALL) quantifies over EVERY `X ⊆ I_{p+1}`. That subfamily quantifier is the principal way (HALL) is stronger than the aggregate, and
  §C never quantifies it. `SEMANTIC-CONTRACT.md` §1.2 says this explicitly.
- The question is moot anyway, since F-1 answers "yes". The sentence should still be struck, because the heading "Where (HALL) is
  strictly stronger than `S ≤ 0`" presents the unreachable-target gap as the whole difference.

**F-3 (D5 inverted).** The return says the refuted key `E993-R23-ZERO-RETAG-EXPORT-IMPLIES-NONPOSITIVE-TAG` has its "hypothesis (zero
Retag export) … refuted by the same CB(8,92) arm tag". The registry certificate says the opposite:
`zero_export: True` with `positive_arm_gap` > 0. The hypothesis HOLDS and the conclusion fails. The categorical distinction the
return draws (a per-leaf implication, not a network) survives, but the sentence must be corrected.

**F-4 (D11 domain argument inverted).** The return says the refutation witnesses of `E993-C3-G1-POINTWISE-ADDABILITY-BOUND` lie in
"the **high tail**, already closed by r29". The registry scope note says those witnesses "**fail** `3p ≥ 2α + 1`", which means they
are NOT in the high tail. That is exactly why they do not contradict r29's high-tail theorem. The distinction from (HALL) must rest
on the object (a pointwise addability bound on full G1 residuals at `r = p − 2`, not a flow network), not on domain.

**F-5 (D6 same-witness narrative is wrong).**
- The return says the 33-active-tags-on-11-supports concentration in `T_22` is "the identical concentration phenomenon that breaks
  D6's per-support injectivity".
- The registry certificate for `E993-R19-SUPPORT-PRESERVING-UNIT-TRANSPORT` gives a different obstruction on the same row: a singleton
  favorable support with `g_v = 212336130412243110 > 0`, hence `P_s > 0 = N_s`. The 33/11 witness is C6-F4's, which is D13, as
  `C6-F4/REPORT.md` confirms.
- The D7 row's "same T_22-family concentration story" is likewise unbacked. The registry says the refutation is by "selected T22 arm
  dimensions".
- The categorical distinctions in both rows stand. The same-witness glosses are struck.

**F-6 (§E instances are outside (HALL)'s domain; E2 does not exhibit its named hypothesis).**
- Problem 1: the return's §E probes (items 1–4) use `K_{1,4}` at `p = 4` and a 6-vertex tree. Neither is eligible: order-8 and smaller
  trees have none. (HALL) and the contract's "nonempty eligibility is REQUIRED of every instance reported" apply, so E1's "(HALL)
  holds" at a non-eligible rank is not a statement about (HALL).
- Problem 2: E2 is titled "supports of degree 2". Its tree has supports 0 and 1 of degree 3, so every `W_v` there has size 2 and no
  singleton-`W_v` case is shown.
- Eligible replacements (own instrument, `eligible_E.py`, each asserting `supply − capacity = S`):

| Probe | Tree | p, α, x, S | Details |
|---|---|---|---|
| degree-2 support | order 12: path `0–…–5`, `5–{6..10}`, `3–11` | `p = 6`, `α = 9`, `x = 4`, `S = −262` | tag `0`, support `1`, `W_0 = {2}` |
| deactivating deletion | order 11: `0–1–2–3`, `3–{4..9}`, `1–10` | `p = 6`, `S = −238` | `B = {2,5,6,7,8,9,10}`, delete `2`, tag `10` deactivated, `w` 6 → 5 |
| switch at a tag's support activating another tag | order 12: `0–1–2–3–4`, `4–{5..9}`, `2–10`, `1–11` | `p = 6`, `S = −299` | `B = {3,6,7,8,9,10,11}`, `u = 2 = s_10`, `A = {2,6,7,8,9,11}`, tag `10` leaves, tag `11` activated through `2`, `w` 5 → 5 |

- The brief's added probe (a switch inserting the support of a tag NOT in `F`) cannot be realized on the eligible domain to order 16.
  In all 3,806 eligible rows through order 16, `F_p` is the entire leaf set (`bounded_computation`), and `F = ∅` never occurs.
- Structurally, `transportRel` does not mention `F` at all. `F` enters only through `w_F`. I confirmed this by reading the §2 Lean text
  and my own implementation.

**F-7 (minor literals).**
- The B2 table header "literal − S = Σ Δ_{p−1}(H_v)?" should read "literal supply − literal capacity = Σ Δ_{p−1}(H_v)". The
  entries are right.
- In D9, "any 8 of the 12 leaves always leaves ≥8 co-leaf witnesses" is wrong for targets: an 8-set target has 7 co-leaves. The
  conclusion (the two weights coincide) is right.
- In C2(b), "≤ 11 leaves are always present to add back" should say that 4 leaves are absent, so every 8-set is non-maximal. The
  conclusion (no unreachable target on `K_{1,12}`) is right.
- The evidence digest `3c6226b1…` is labelled "SHA-256 of `scratchpad/c1-F2/F2-EVIDENCE.json`". It is actually the SHA-256 of the
  compact canonical serialization; the file's byte digest is `c5f86658…`. Relabel it.

**F-8 (D8, partially completed by the critic; reading-dependent).** Under a literal reading of the registered statement of
`E993-LOWER-REGION-SAME-RANK-WEIGHTED-OCCUPANCY-DOMINATION` (`i_p·E ≤ (p+1)·i_{p+1}·Q`, with `Q = Σ_{I_p} w_F` and
`E = Σ_{I_p} w_F·e_T`):
- My sanity identity `Σ_{I_p} e_T = (p+1)·i_{p+1}` holds on every row checked.
- The inequality fails on 4 of the 5 eligible order-11 rows (for example `120960 > 120694`), and on 310 of 313 rows at order 14.
- Every one of those rows has a saturating (HALL) flow.

So D8's failure does not transfer to (HALL) on any row where I observed it. I did not reconcile this with the fenced order-14 witness.
The near-universality of the failure makes me flag my reading as unconfirmed. D10 (order 24) was not reproduced.

**Attacks that failed (the return survives).**
- The (WID) proof: its hypotheses, direction, double counting over shared supports, and generality beyond trees all hold.
- (FLOW⇒SIGN) and (HALL⇒FLOW).
- B1–B3.
- The C1 lemma, including exactness of `N(u) ∩ B = {y, z}` and competition from third neighbours.
- The T_22 and K_{1,12} fixed points.
- D1 and D2: the deletion-only relation is a subrelation; the registry certificate's `Γ_Delete ⊆ Γ_actual ⊆ Y` matches.
- D9 on K_{1,12}: literal = active weight, and the flow saturates at 1980.
- D12 naming collision: the registry's `E993-R28-DOMINANCE-REFUTATION` witness is "R(3,2)_3 = T22, … 22 vertices", while here
  `T_22 = T_m(22)` has order 91. The collision is real and correctly flagged.
- No natural-number subtraction appears unguarded in the return's prose.
- No circularity.

## Mechanism-equivalence and fence check

- **Not a new mechanism.** The return proposes no transport mechanism, so it cannot be a refuted mechanism in new notation. The B1
  "literal-weight" identity is presented as a diagnostic of the struck weight, not as a mechanism, and it revives nothing.
- **No re-proof of closed results.** The high tail, the order bands, and the `T_m`/spider/path-star theorems are not re-proved. The
  `T_22` recomputation is limited to the polynomial and aggregate side, with the orbit flow cited.
- **Other fences.** No census value enters a proof, there is no RTree wording, and no live root was read (disclosed and confirmed).
  (LIFT) is not used as quotient feasibility, and `D, C ≥ 0` is not used as a budget.
- **Distinctions in the table.** Correct for D1, D2, D3, D4, D8, D9, D10, D12 and D13. Correct in category but wrong in the stated
  witness or domain for D5 (F-3), D6 and D7 (F-5), and D11 (F-4).
- **Fixed points.** `K_{1,12}`, both path-stars and `T_22` are reproduced where the return's claims touch them. `CB(8, 92)` is
  reproduced at the sector-algebra level only, as the return itself scopes it.
- **My own advance (F-1).** It is a statement about arc-reachability of targets. It is not a cut, it is not about the aggregate, and it
  transfers no status to (HALL) or to the primary aggregate.

## Certification audit

- **Backed and reproduced:**
  - all fixed-point numbers, the B2 table numbers (−1406, −6717, −1218, −5434, and the supply/capacity/flow triples), and the arc
    counts 2025 and 11691;
  - the `T_22` numbers (`n`, `α`, `x`, `Δ_x`, `|F|`, `S`, `i_34`, `i_35`, the summand decomposition);
  - `492/491` and `493/491`;
  - "34/34 rows" in the WID general check (replay);
  - "0 mismatches" in the C1 check (replay; my own check extends it to every target of 3,806 eligible rows);
  - the evidence digest `3c6226b1…`, reproduced byte-identically. Its label is wrong (F-7).
- **"saturating" for `T_22`:** cited, not re-derived. The return labels it "(cited)", which is acceptable.
- **Struck:**
  1. "A 'no' would show (HALL) is exactly equivalent, on positive-weight targets, to `S ≤ 0`" (F-2).
  2. D5 "hypothesis (zero Retag export) … refuted" (F-3).
  3. D11 "high tail" placement of the witnesses (F-4).
  4. D6 "identical concentration phenomenon that breaks D6" and D7 "same T_22-family concentration story" (F-5).
  5. E1 "(HALL) holds" as a statement about (HALL), and E2's "supports of degree 2" label (F-6).
  6. The §C2 claim "not able … to construct or exclude": superseded by F-1.
- **Grades.**
  - (WID), (FLOW⇒SIGN), (HALL⇒FLOW), B1 and C1 are `proved_informal` at statement level. I agree.
  - D-table same-witness checks are `bounded_computation`. I agree where they are not struck.
  - The route verdict `bounded_evidence` is appropriate.

## Verdict

verdict: retained_narrowed

headline_resolved: no

**What stands.** The return's mathematical core is correct and independently re-derived with my own instrument:
- (WID) is `proved_informal` at statement level, on all finite simple graphs, needing only degree-one tags.
- The two companions are `proved_informal`.
- The struck-weight identity B1 is `proved_informal`.
- The C1 reachability lemma is `proved_informal`, valid on any triangle-free graph.
- The C6-F5/C6-U5 error reconstructions and all fixed points are reproduced exactly.

**What is narrowed.** The narrowing strikes the F-2 overclaim, the inverted or mis-attributed D5, D6, D7 and D11 narratives, and the
non-eligible §E demonstrations as statements about (HALL).

**Critic-derived advances (attributed to C-F2-U).**
- **F-1:** the return's open §C2 is resolved "yes". Eligible rows with a positive-weight arc-unreachable target exist, first at order
  14, with gap 2. One of the 11 order-14 rows is the first member of an explicit family `T(m, k)` (I did not classify the other ten; each also has a unique unreachable target of weight 2). For that family, unreachability is `proved_informal` for all `m`, and eligibility is
  verified for `4 ≤ m ≤ 60` (`bounded_computation`).
- The `hp : 1 ≤ p` guard is load-bearing in the ℕ-form Lean statement: `K_{1,3}`, `p = 0`, left side 0 versus right side 6.
- D8's (my reading) failure does not transfer to (HALL) at orders 11–14.

None of this touches (HALL)'s truth or the primary aggregate.

## Remaining obligation

1. **The subfamily quantifier.** This is where (HALL) is genuinely stronger than `S ≤ 0`, and it is untouched by the return and by
   F-1: (HALL-COND) for arbitrary `X ⊊ I_{p+1}`. F-1 settles only the `X = I_{p+1}` gap.
2. **Uniform eligibility for the F-1 family.** Prove, for every `m ≥ 4`, that `T(m, 2)` at `p = m + 2` is eligible, i.e.
   `x(T(m,2)) ≤ m` (with `α = 2m + 1`), and that `ℓ_1, ℓ_2 ∈ F_p`. This would lift F-1 from `bounded_computation` in `m` to a
   parameter-uniform `proved_informal` family statement. Register only after an isolated second read.
3. **D8 and D10.** Reconcile D8 against its registered order-14 witness, and reproduce D10's order-24 witness, through a
   controller-granted frozen copy of the two witness files. Until then D8 rests on my reading (F-8) and D10 on statement text.
4. **Lean.** Carry the `1 ≤ p` guard with its reason onto the WID award's face (U2 / Stage 7), and add the clone-completion sentence
   to the (HALL⇒FLOW) proof.
5. **Corrections to the return's face.** Apply the corrections of F-3 through F-7 before any of its text is carried into a synthesis
   or a registry scope note.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-crit-F2-U/`. Standard
library only, exact integers and `Fraction`, no network, no installs, no background jobs. Every computation ran in the foreground
to completion, so nothing needed to be killed.

| File | SHA-256 | Content |
|---|---|---|
| `seals.py` | `b2ca149e2730d65ec48f4d15cef5f56d0bc0241927848d8d4814e609c3000fc0` | four seals + capsule member digests |
| `srcdig.py` | `5ef1195325824bb3b6f55214461f68991267d4ac1259463955d9642c92c45681` | 981/981 source re-digest, stray-file check |
| `crit_lib.py` | `1237851299cfef71e581a4b02ef2209aca2c4f59657a88983aaa7b89becbec5b` | own instrument (weights, relation, q, S, Dinic) |
| `trees.py` | `4b13738f9c39b317e0922f82219dada6358a517ee5d32dc65b969bc14795da61` | free-tree generator, canonical form (A000055 reconciled to 16) |
| `fixed_points.py` / `.json` | `da50f5c7…` / `df7f02d97f580819357491b99ade4f4339d731c51bf3a522d70ef294305f750f` | fixed points, literal networks, B1, WID on 336 general-graph rows |
| `census.py` | `edb5e018e607dfb72e53c5cae7b0d74d37be52d6e4967585967d5acf17c00b35` | eligible census 11–16: C1 check, unreachable targets, gap, D8, flows ≤ 15 |
| `census_11_13.json` | `a8952b672b0e62d9bce3de4c1029457dc4e3514d38b6649068f7f726411ba67f` | per-row output |
| `census_14_16.json` | `0d809e1f5e9abaefdeee24ea06872b76a99ceb8b1e03508d391da4da6b62e1c1` | per-row output |
| `family.py` / `family.json` | `1974c704…` / `3c7ac8fb286ff5799419f94397d895d3a117b46e567dc2c7a00e2714bc8c2d7d` | `T(m,k)` eligibility/favorability, m ≤ 60 |
| `witness_check.py` / `.json` | `fe28908f…` / `2842cc9ae4de9cf1eac0c31ac10940d7c82c578795fe9594adf98af50b8a77b5` | second-path check of F-1 (`T(4,2)`, `T(5,2)`) |
| `extras.py` / `.json` | `af76e06d…` / `2064e574b77c8a929bf514648a8a0fe132fa6032868b04dd618206bc43110554` | `T_22`, CB sector fractions, `p = 0` guard |
| `eligible_E.py` / `.json` | `fbc153bd…` / `01badbf32cd679391851566a8913b97bf1997ae24bb9964a2011ec2a652b2f90` | eligible §E replacements |
| `replay/` | outputs byte-identical to the shipped `F2-EVIDENCE*.json` | copy-out-first replay of F2's four scripts; digest `3c6226b1…` reproduced |

Replay: `cd` into the scratch dir; `python3 fixed_points.py; python3 census.py 11 13 13; python3 census.py 14 16 15;
python3 family.py; python3 witness_check.py; python3 extras.py; python3 eligible_E.py`. The order-16 census takes about 160 s.
