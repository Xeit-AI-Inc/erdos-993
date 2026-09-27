# Critique

Critic `C-T1-F` (cross-orientation F, falsify) of seat `T1`, route `C1-T-01 WEIGHTED-SHADOW-NORMALIZED-MATCHING` (orientation T),
Cycle 1, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`). Date 2026-09-26.

**Boot.** Operating within VerityOS. Boot reads, exactly as dispatched: `/Users/ashtonsperry/VerityOS/verity.md`,
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. No other VerityOS file outside the run root was read (the CLAUDE.md
and auto-memory index were injected by the host at session start, not read by me). Dispatch read:
`control/dispatch/c1-stage4/DISPATCH-C-T1-F.md`.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosure.** (1) One non-recursive `ls` of `scratchpad/c1-T1/` (the seat's replay directory, to locate the
inventoried artifacts): names seen `__pycache__`, `run_output.txt`, `run_output2.txt`, `t1_instrument.py`,
`t1_instrument_output.json`; only the last two were copied and read. (2) No `find`/`grep`/`rg`/recursive listing above the
grant; no other return, critique, adjudication, experiment root, network or install. (3) `control/CLAIM-IDENTITY.run-local.json`
is not a capsule member and was not read, so my alias checks are limited to the keys visible in the capsule (stated where used).
(4) Process discipline: two of my jobs ran in the background (one auto-backgrounded by the harness at its 600 s limit, one
deliberately); both ran to completion and exited; PIDs were checked with `ps -p <literal PID>` only; no pattern kill, no full
process listing.

## Identity and seal audit

Recomputed canonically (SHA-256 of `json.dumps(manifest minus seal_sha256, sort_keys=True, separators=(",", ":"))`, no trailing
newline), own script:

| Manifest | recorded seal | recomputed | match |
|---|---|---|---|
| capsule `control/c1-critic-capsules/T1-PACKET-MANIFEST.json` | `e5b3f750c5fddcd9b84d8127323654d8275fe058f4ae1197af5145c4d64aa856` | same | yes |
| Stage 4 dispatch `control/C1-STAGE4-DISPATCH-MANIFEST.json` | `f62b5c6a639104c155f2acebb4b40b5f6379134f490c90edc1601a0b764ac2cc` | same | yes |
| Stage 3 `control/C1-STAGE3-PACKET-MANIFEST.json` | `da784de8567703935e95ea3e452acc151fdbc15a7e20ffd86634ecb87e4f92ac` | same | yes |
| Stage 2 `control/C1-STAGE2-PACKET-MANIFEST.json` | `886ece6b82a51261a985352ba74a10ed8b6e641ce6e20d5128d37522e4b49a92` | same | yes |

**Capsule seal: `e5b3f750c5fddcd9b84d8127323654d8275fe058f4ae1197af5145c4d64aa856` (verified).** All 14 capsule members match their
listed SHA-256 and byte counts (own recomputation), including `cycles/cycle-1/stage3/returns/T1/RETURN.md`
(`99856702…9013`, 27885 bytes), which also matches its Stage 3 manifest entry. `C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` is present
and read; T1's entry is "no read-boundary disclosure; one stray diagnostic process killed by literal PID".

Digests the return lists: script `t1_instrument.py` SHA-256 `5bae3eed7d104d2bc20d995bc8e31179784cc4c8d05b7898fffcb6b081497de1` —
matches the copy I took. Output body digest `385a1c7b0f9f938e5acd918cfa78d714f2bcc193268b810a3a9ccfa2382eb693` — reproduced by my
copy-out-first replay (in `scratchpad/c1-crit-T1-F/replay/`), and the regenerated `t1_instrument_output.json` is byte-identical to
the shipped one (file SHA-256 `ad293ed2…c39d`, not listed by T1). T1's cited Stage 2 seal is correct. T1's source-digest
verification of `sources/lower-region/...` files I did not re-run (T1 used those files only as cross-check priors; nothing of
mine depends on them). Model disclosure on the return (chartered Sonnet/xhigh; runtime `claude-sonnet-5`) is present and
two-part.

## Independent re-derivation

Own instrument, stdlib only, exact integers, written from SEMANTIC-CONTRACT §1 (not from T1's script):
`scratchpad/c1-crit-T1-F/own/crit_lib.py` (forest DP for `i_k(T − D)` on the original carrier; `x` through rank `α`; `F_p` from
`Δ_p(T − v)` on the original tree; literal independent-set enumeration; literal active weight `w_F`; literal (D)∪(S); the
aggregate `S` computed by the TAG route `Σ_{v∈F}[Δ_{p−1}(H_v) − Δ_{p−1}(R_v)]`; exact integer Dinic max-flow). Tree test =
BFS connectivity AND union-find acyclicity, separately.

**Fidelity checks (protocol duty 2).** T1's `active_weight` counts `v ∈ F ∩ B` with `(B ∖ {v}) ∩ (N(s_v) ∖ {v}) ≠ ∅` — the
active-tag weight, not `|F ∩ B|`. `transport_targets` is (D) ∪ (S) literally (switch only when `|N(u) ∩ B| = 2`, `u ∉ B`). `F` is
fixed at rank `p` from `Δ_p(T − w)` on the original tree. `x` is computed through rank `α` (`first_strict_descent_through_alpha`
on the trimmed polynomial). **One fidelity defect:** on `K_{1,12}` T1's script sets `S_value = supply − capacity` and then asserts
`supply − capacity == S_value` — a tautology; the (WID) equality was NOT checked there. On the two small CB instances the tag-route
`S` is computed independently and agrees (reported, not asserted). The weight/relation fidelity holds; nothing downstream is struck
for fidelity, but the K_{1,12} (WID) "confirmation" is struck (see Certification audit).

**Fixed points (own instrument, before any table; (WID) asserted as layer-weight difference == tag-route `S`):**

- `K_{1,12}`, `p = 8`: `n = 13`, `α = 12`, `x = 6`, eligible, `|F| = 12`, supply 1980, capacity 3960, `S = −1980` (tag route), no
  switch, max-flow 1980 (saturates), 1980 arcs.
- `CB(1, 7)`, `p = 10` (controller cross-check row): `n = 24`, `α = 15`, `x = 8`, eligible, `|F| = 8`, supply 29190, capacity 58002,
  `S = −28812`, max-flow 29190 (saturates), 124593 arcs. Matches the attack brief's F1/U1 figures.
- `CB(8, 92)`: built LITERALLY (1567 vertices; connected, acyclic), generic forest DP: `α = 829`, `x = 490` (through `α`; `x < α`,
  so the terminal-difference issue does not arise), eligible window `p ∈ [492, 552]` (61 values); at EVERY `p` in the window the arm
  leaf `v` and all 736 private leaves are favorable, `|F| = 737`. My closed forms
  `I(T) = (1+2t)Q^m + t(1+t)(1+2t)^{dm}`, `Q = (1+2t)^d + t(1+t)^d`, and the analogous `I(T − v)`, `I(T − c)` agree with the DP
  (exactly on `CB(8, 92)` and on all 16 `CB(d, m)`, `d, m ≤ 4`).
- Sector ratio: `R_491/R_490 = 492/491` exactly; whole-sector deletion deficit `R_491 − R_490 = R_490/491` exactly.

**T1's claims re-derived.**

1. *Lemma 1* (transitive action on both ranks ⇒ `|∂X|·|P_k| ≥ |X|·|P_{k−1}|`). Re-proved: transitivity on `P_k` makes the
   down-degree constant, on `P_{k−1}` the up-degree constant (an automorphism maps cover sets bijectively); double counting gives
   `d_k|P_k| = d_{k−1}|P_{k−1}|` and `d_k|X| ≤ d_{k−1}|∂X|`. Correct and complete. Both-rank transitivity is genuinely needed and
   T1 assumes it. The abstract group `S_N ≀ (ℤ/2)^N` on `{0, b, c}^N` preserves rank and the covering relation "zero one coordinate",
   and is transitive on each rank (map support to support by `S_N`, then fix symbols by flips). The sector
   `S_j = {X ∈ I_j(T) : r, v ∈ X}` is in exact bijection with rank `j − 2`: `r ∈ X` excludes `s` and every choke, and
   `T − N[{r, v}]` is exactly the `N = dm` disjoint edges `b_{ij}c_{ij}`. Deletion inside the sector is the covering relation.
   Deleting `r` or `v` leaves the sector and lands on weight-0 targets. Deleting `r` leaves `v` without a witness and every private
   tag without its choke; deleting `v` removes the only possibly-active tag. I verified this literally on 7 small instances
   (`sector_brute.json`: every such target has weight 0). For (HALL-COND) on `X ⊆ S_{p+1}` these targets add nothing and nothing
   is lost by ignoring them. T1 is right that `|∂X| ≥ (491/492)|X|` for every `X ⊆ S_493`, i.e. deletion deficit `≤ |X|/492`.
   `proved_informal` confirmed.
2. *Switch-image weight* `w_F(A) = ℓ_i(B)`. Confirmed literally. After inserting `u_i` and removing `r, b_{ij0}`, `v` is inactive
   (its only witness `r` is gone). Other groups' leaves stay inactive (their chokes are absent). Group `i`'s present leaves are all
   active (witness `u_i`). `A` is independent exactly because group `i` has no other support. Each target `(i, L, rest)` is reached
   from exactly `d − |L|` sources and needs `ℓ ≤ d − 1`. Every such `A` is reachable. **Omission (harmless):** T1's §2 lists only
   the choke switches, but every sector source also has the switch at `s` (`N(s) ∩ B = {r, v}`), giving
   `A = B ∖ {r, v} ∪ {s}` of weight 0. T1's own `distinct_switch_targets` (432 = 240 choke + 192 `s`-switch) silently counts them.
3. *§3 whole-sector switch total.* The formula `m·Σ_{ℓ=0}^{d−1} ℓ·C(d, ℓ)·R^{(m−1)}_{490−ℓ}` is correct: it counts distinct targets
   once per `(i, L, rest)` with no double count and `ℓ = 0` contributing nothing. It matches literal brute force on 7 instances
   (`sector_brute.json`: `formula_ok` everywhere). **But T1's script omits the factor `m`**
   (`total_switch += l * math.comb(d, l) * R_dm(d, m − 1, rest_rank)`, no `m`). The shipped value is exactly `1/92` of the true
   one (checked digit-for-digit). True values at `CB(8, 92)`, `p = 492`: switch total `6.442…×10^350` (351 digits), not
   `7.003…×10^348`; `⌊switch/deficit⌋ = 7012`, not 76. The direction favours T1's conclusion (the whole-sector cut is not
   deficient), but every §3 literal derived from it is wrong (struck below).
4. *Overlap.* T1 shows "48 distinct switch targets each reached by exactly 2 sources" in both small instances — reproduced. On
   `CB(2, 3)`, however, all 48 overlapping targets have weight 0 (group with no leaf, two empty slots). Only the `CB(3, 2)`
   instance shows weighted overlap (48 targets, weight 1, 2 sources each). The two small instances also sit OUTSIDE the deficit
   regime: sector sources 192 < sector targets 240. So they test the weight formula and nothing about the deficit mechanism.

## Attacks and findings

**F1 — §3 arithmetic defect (certification-level; conclusion survives).** Finding 3 above: the factor `m` is missing in code, so
the "≈ 76×" margin is really ≈ 7012×. The formula stated in prose is right; the numbers typeset from the code are wrong.

**F2 — §4 candidate key is mis-hypothesized (void as stated).** T1 asks for a subgroup `H ≤ Aut(T)` that "independently swaps
`b_i ↔ c_i` while fixing the rest of `T` pointwise". No tree with a pendant pair attached through `b_i` has that automorphism:
`b_i` is adjacent to a vertex of `Z`, `c_i` is not, and a map fixing `Z` pointwise must preserve that edge. So the hypothesis is
unsatisfiable and the lemma holds only vacuously. Separately (attack brief), permuting pairs "transitively within each
choke-class" without permuting classes is not transitive on rank levels when there are several classes. For example, all `k`
occupied pairs in one class cannot be mapped to a spread-out state. That contradicts T1's own remark that the chokes need not be
permuted. The symmetry Lemma 1 actually uses is the ABSTRACT wreath symmetry of the sector poset, which exists because the
attachments are forced absent. **Corrected hypothesis (my ruling):** *`Q` is independent in `T` and `T − N_T[Q]` is a disjoint
union of `N` edges.* Then `S^Q_{|Q|+k} ≅` rank `k` of `{0,1,2}^N`, deletion of a non-`Q` vertex is the covering relation, and for
every `X ⊆ S^Q_{|Q|+k}`: `|∂_Q X| ≥ |X|·R_{k−1}/R_k`, with `R_k = C(N, k)2^k`. No automorphism of `T` is needed. The statement is
unweighted; it becomes the weighted sector bound only where `w_F` is constant on the sector. It holds for `CB(d, m)`, `Q = {r, v}`,
where the weight is `[v ∈ F]`. As corrected, the key `E993-R30-CB-SECTOR-DELETION-NORMALIZED-MATCHING` is the classical
normalized-matching property of the rank levels of a product of 3-element "V" posets. That is fine as a lemma, but it should be
registered as a general sector lemma, not a CB-specific discovery. Alias check (capsule-visible keys only): no lexical or
mathematical collision with the §3.2 refuted keys, (LIFT), (DCB), (TSB) or the SEMANTIC-CONTRACT templates; it instantiates
template (NMP). The synthesis must run the registry-wide alias check (the claim-identity file is outside my capsule).

**F3 — the whole-sector margin is not evidence for arbitrary `X` (demonstrated).** Exact sector-restricted max-flow on small literal
`CB(d, m)`: sources = the literal sector `S_{p+1}`, targets = everything (D)∪(S)-reachable, capacities = literal `w_F`, so
max-flow = supply iff (HALL-COND) holds for every `X ⊆ S_{p+1}`. In the all-leaves-tagged variant (NOT `F_p`, NOT eligible),
several rows have a positive whole-sector margin yet are sector-deficient:

| `(d, m, p)` | whole-sector margin | sector max-flow deficiency |
|---|---|---|
| `(2, 4, 6)` | +608 | 40 |
| `(2, 5, 7)` | +5824 | 496 |
| `(2, 6, 7)` | +6528 | 10592 |

In each row the deficiency equals `|X''| − |∂X''|` exactly. Here `X''` is the **switch-dead family**: sector sources with no
choke group having exactly one support and at least one leaf, which are exactly the sources whose every switch image has weight 0.
Its size and shadow come from my per-group generating functions (`xpp.py`) and agree with the max-flow. These are not (HALL)
cuts (wrong `F`, non-eligible `p`) and prove nothing about eligible trees. They show that T1's §3 (one extremal `X`) is not a
proxy for (HALL-COND), and that `X''` is the natural adversary T1's Remaining obligation 1 anticipates. At `CB(8, 92)`,
`p = 492`: `|X''|/R_491 = 1.093×10^{−7}` and `|∂X''|/|X''| = 17.61`, so `X''` is far from deficient. That agrees with the
controller's prior for the smaller family `X'` (17.8), which I did not use.

**F4 — a critic-derived advance closing T1's Remaining obligation 1 at `CB(8, 92)` (all eligible `p`) and on a stated band of
`CB(d, m)`.** Stated here at a review stage; STATED, needs an isolated second read before registration. Attributed to `C-T1-F`.
It builds on T1's Lemma 1 and switch formula and on Codex's corrected sector facts.

*Setting.* `T = CB(d, m)`, `N = dm`, `p` with `v ∈ F_p(T)`, `k = p − 1 ∈ [1, N]`, `Z' = N − k + 1`. Sector sources = rank `k` of
`{0,b,c}^N`, sector targets = rank `k − 1`, `B` = their cover graph (left degree `k`, right degree `2Z'`). `R_j = C(N, j)2^j`,
`δ = R_{k−1}/R_k = k/(2Z')`. `X''` = the switch-dead family (F3).

*Fact A (weights and disjointness).* Every sector source and sector target has weight 1. A choke-switch target contains `u_i`, so it
is disjoint from the sector targets (which contain `r`). Its weight is `c_i·[private leaves ∈ F]`, and it is reached from exactly
`d − c_i` sector sources. Hence for `X ⊆ S_{p+1}`: `Σ_{N(X)} w ≥ |∂X| + Σ_{A ∈ N_sw(X)} w(A)`.

*Fact B (switch lower bound).* If the private leaves are in `F`, `Σ_{A∈N_sw(X)} w(A) ≥ |X ∖ X''|/(d − 1)`. Proof: choose one useful
switch `A(σ)` for each `σ ∈ X ∖ X''`. At most `d − w(A)` sources map to `A`, and `w/(d − w) ≥ 1/(d − 1)` for `1 ≤ w ≤ d − 1`.

*Fact C (spectrum; proved).* `BB^T` has eigenvalues `2(k − t − i)(N − k − i + 1)` (`0 ≤ t ≤ k`, `0 ≤ i ≤ min(k − t, N − k)`), with
multiplicity `C(N, t)(C(N − t, i) − C(N − t, i − 1))`. Proof: decompose functions on states by the flip-characters `χ_J`,
`J ⊆ support`, `|J| = t`. `BB^T` preserves each `V^J`, and on `V^J` it equals `2·U_B D_B` on level `k − t` of the Boolean lattice
of `[N] ∖ J`. The summed symbol of an added coordinate outside `J` gives the factor 2; a coordinate in `J` cancels. The Johnson
spectrum of `U_B D_B` is `(j − i)(n − j − i + 1)`. The top eigenvalue is `2kZ'` (constants, multiplicity 1). The second is
`λ₂² = 2(k − 1)Z'` (`t = 1, i = 0`). I checked the full spectrum with multiplicities EXACTLY (rational Gaussian elimination
nullities; multiplicities sum to `R_k`) at `(N, k) ∈ {(3,2), (4,2), (4,3), (5,2), (5,3), (5,4), (6,4)}`.

*Fact D (Tanner-type expansion; proved).* For `X ⊆ S_{p+1}`: `|∂X| ≥ k²|X| / (λ₂² + 2Z'·|X|/R_k)`. Proof: write
`1_X = (|X|/R_k)𝟙 + g` with `g ⊥ 𝟙`. Then `‖Bᵀ1_X‖² ≤ 2kZ'|X|²/R_k + λ₂²(|X| − |X|²/R_k)`, and Cauchy–Schwarz on
`Σ_{τ∈∂X} deg_X(τ) = k|X|` gives `(k|X|)² ≤ |∂X|·‖Bᵀ1_X‖²`. Using `2kZ' − λ₂² = 2Z'`: `|∂X| ≥ |X|` whenever
`|X|/R_k ≤ x₀ := (k² − 2(k − 1)Z')/(2Z')`.

*Lemma C (critic `C-T1-F`).* For every `X ⊆ S_{p+1}`, (HALL-COND) `Σ_X w_F ≤ Σ_{N(X)} w_F` holds when either
- (i) `δ ≥ 1`, by deletion arcs alone (T1's Lemma 1); or
- (ii) `δ < 1`, `x₀ > 0`, the private leaves are in `F_p(T)`, `(d − 1)(1 − δ) < 1`, and
  `x₀·R_k·(1 − (d − 1)(1 − δ)) ≥ |X''|`.

Proof of (ii): if `|X| ≤ x₀R_k`, Fact D. Otherwise the deletion deficit is `≤ (1 − δ)|X|` (Lemma 1), and the switch weight is
`≥ (|X| − |X''|)/(d − 1) ≥ (1 − δ)|X|` because `|X|(1 − (d − 1)(1 − δ)) > x₀R_k(1 − (d − 1)(1 − δ)) ≥ |X''|`. ∎

*Instance `CB(8, 92)` (own exact integers, `cb892_lemma.out`).*
- `p = 492`: `k = 491`, `Z' = 246`, `δ = 491/492`, `λ₂² = 241080`, `k² = 241081`, `x₀ = 1/492`, `(d − 1)(1 − δ) = 7/492`, and the
  exact rational margin `x₀R_k(485/492)/|X''| ≈ 18328`, so (ii) holds.
- `p ∈ [493, 552]`: `R_{k−1} ≥ R_k`, so (i) holds.

`v` and all private leaves are favorable at every `p` in the window. **Conclusion: at every eligible `p` of `CB(8, 92)`, the
root-plus-arm sector satisfies (HALL-COND) for EVERY source subfamily `X` contained in the sector.** This is exactly T1's open
item 1, at its fixed point.

*Grades.* Lemma C (conditional form): `proved_informal` (STATED). The `CB(8, 92)` instantiation uses one exact big-integer
evaluation of `|X''|` (a GF coefficient), so by the weakest-input rule it is `computer_assisted`. Scope, stated exactly:
subfamilies INSIDE the sector only. This is not (HALL) for `CB(8, 92)`. Mixed `X` (sector plus non-sector sources) and
non-sector `X` are untouched, and the switch targets the sector uses are shared with non-sector sources. Candidate key:
`E993-R30-CB-SECTOR-SPECTRAL-SWITCH-HALL`. It is lexically and mathematically distinct from every capsule-visible key: not
deletion-only Hall (it uses (S) and the active weight), not (LIFT) (no quotient), and it instantiates templates (NMP) and (SW)
jointly. It needs the registry-wide alias check.

*Coverage sweep (bounded computation, own `sweep2.py`, every eligible row of `CB(d, m)`, `d ≤ 12`, `m ≤ 400`).*

| class | rows |
|---|---|
| (i) deletion-only | 551129 |
| (ii) Tanner + switch | 391 (tightest margin 8.10 at `CB(11, 134)`, `p = 984`) |
| sector empty or weightless | 26070 |
| **not covered** | **2724** |

The not-covered rows all have `x₀ ≤ 0`, i.e. deletion deficit ratio `1 − δ ≥ 1/k`. The first is `CB(7, 144)`, `p = 673`
(`δ = 336/337`); for `d = 8` the first is `m = 108`, `p = 577`. `CB(8, m)` is fully covered for `m ≤ 107` in the sweep. For
`d ≤ 6` no eligible row in the sweep has a sector deletion deficit at all. I also checked (`sweep3`) whether any deficit row has
unfavorable private leaves, which would make the whole sector a genuinely deficient cut because every switch image would have
weight 0: none — all 3115 eligible deficit rows (d ≤ 12, m ≤ 400) have every private leaf favorable (`deficit_rows_cF_false = 0`), so no whole-sector cut of that kind exists in the swept range.

**F5 — minor.** T1 reports `n = 1567` "own construction, `is_tree` asserted true" and `|F| = 737`, `α`, `x` for `CB(8, 92)`. T1's
script never builds `CB(8, 92)` (its `cb_8_92_sector_capacity` is closed-form only), and `|F|`, `α`, `x` are cited. The values are
correct; they are now backed by my instrument, not by T1's. T1's `nm_bruteforce_check` contains dead "worst ratio" code and sets
`exhaustive_ok = True` unconditionally. The exhaustive cases do run their asserts, and the non-exhaustive cases check only the
whole-layer identity, as T1 says.

## Mechanism-equivalence and fence check

- Not a revival: T1's Lemma 1 is a deletion-only SHADOW BOUND that quantifies a deficit and claims no deletion-only Hall. It is not
  `E993-R23-LITERAL-DELETE-ONLY-HALL`; T1 says why on the face, and I agree. My Lemma C (i) is deletion-only Hall on a restricted
  family (sector subfamilies of one tree family at `δ ≥ 1`) with the ACTIVE weight. That is a scoped statement, not the refuted
  universal key. Lemma C (ii) uses (S). Neither is own-support unit capacity, per-leaf injectivity, occupancy domination, signed
  cross-tag or covariance.
- No closed region re-proved: `CB(d, m)` is not among the settled `T_m`/spider/path-star families. Of the orders-band facts, I used
  only that `x`, `α` and the window are computed, never a closed result.
- No census value, RTree wording or controller prior used as evidence. The `X'` 17.8 figure is cited as a prior only, and my
  `X''` figures are my own exact counts. (LIFT) is not used; `D, C ≥ 0` is not used.
- Mechanism ≠ aggregate: nothing here signs `S(T, p)`. Finite ≠ universal: the `CB(8, 92)` statement is one tree. The sweep is
  `bounded_computation`, and Lemma C is universal only in its conditional form.

## Certification audit

Struck or corrected:

- §3 table: "distinct switch capacity, whole sector `7.003…×10^348`" — **struck**; true `6.442…×10^350` (351 digits).
  "combined capacity `5.211…×10^349`" — **struck**; true `R_490 + 6.442…×10^350`. "`⌊switch/deficit⌋ = 76`" and "order 76" in
  §3 and Remaining obligation 1 — **struck**; true 7012. Cause: the missing factor `m` in `cb_8_92_sector_capacity`. The shipped
  value is exactly the formula divided by 92.
- "WID reconfirmation on 3 literal instances … by two independent routes each time" and the K_{1,12} "`supply − capacity = S`
  asserted true (WID confirmed …)" — **struck** for K_{1,12}: tautological assert. Correct literal: 2 instances, reported but not
  asserted. The K_{1,12} numbers themselves are right; my instrument confirms (WID) there independently.
- "`n = 1567` (own construction, `is_tree` asserted true)" — **struck as unbacked by T1**; value confirmed by `C-T1-F`.
  "`|F| = 737`", "`α = 829`", "`x = 490`" — cited, not computed by T1; confirmed by `C-T1-F`.
- "the switch … `u_i` … is switch-insertable iff …" as the complete list of switches — **narrowed**: the `s`-switch (weight 0)
  also exists.
- "48 … each reached by exactly 2 sources" — true as a count; weighted overlap is exhibited only on `CB(3, 2)`. On `CB(2, 3)` the
  48 targets have weight 0.
- §4 grade `proved_informal` — **struck as stated** (void hypothesis); it stands `proved_informal` under the corrected hypothesis
  in F2.

Backed: Lemma 1 and its sector instantiation (`proved_informal`); `R_491·491 = R_490·492`; deficit `= R_490/491`; the §3
formula as written in prose; the script and body digests (replayed byte-identically); K_{1,12} values; `any_switch_exists = False`;
the literal switch-weight assertions on the small instances.

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Retained: Lemma 1 (`proved_informal`), its `CB(d, m)` sector instantiation (deletion deficit `≤ |X|/492` for every
`X ⊆ S_493`), and the switch-image weight formula. Narrowed: §3's numbers are corrected (the margin is ≈ 7012×, not 76×) and
remain one extremal `X` (`bounded_computation`). F3 shows that such a margin does not control arbitrary `X`. The §4 key is
re-stated with the corrected hypothesis ("`T − N[Q]` is a disjoint union of `N` edges"). The (WID) reconfirmation is two
instances, not three. T1's route verdict `bounded_evidence` stands. The critic-derived Lemma C closes T1's open item 1 at the
`CB(8, 92)` fixed point: every eligible `p`, every `X` inside the sector, `computer_assisted`, STATED, needing a second read.
This is attributed to `C-T1-F`, not to the seat. It does not resolve (HALL) or the primary aggregate.

## Remaining obligation

1. **Sector rows with deletion deficit ≥ `1/k`.** Prove (HALL-COND) for every `X ⊆ S_{p+1}` on the eligible `CB(d, m)` rows where
   `x₀ ≤ 0`, i.e. `k² ≤ 2(k − 1)(N − k + 1)`. In the sweep these are 2724 rows with `d ≤ 12`, `m ≤ 400`, the first at
   `CB(7, 144)`, `p = 673`, and for `d = 8` from `m = 108`. The spectral bound gives no expansion there. The obstruction is
   subfamilies concentrated in the switch-dead family `X''`. The exact missing statement is a vertex-expansion bound
   `|∂Y| ≥ |Y|` for every `Y ⊆ X''` (or `|∂Y| + switch(Y) ≥ |Y|` for `Y` mostly inside `X''`) at those parameters. Or find a
   deficient `X` there: two instruments and an isolated second read, then (CUT).
2. **Leave the sector.** Prove (HALL-COND) for `X` that mix sector and non-sector sources of `CB(8, 92)`, and for non-sector `X`.
   The switch targets that Lemma C uses are also reachable from non-sector sources (competition). Lemma C says nothing there.
3. **Beyond `CB`.** Under the corrected §4 hypothesis, Lemma 1 and Fact C apply to any `(T, Q)` with `T − N[Q]` a perfect
   matching. Characterise which eligible trees have sectors of this shape, and what replaces Fact B when the switch structure is
   not choke-based.
4. **Second read of Lemma C** (Facts A–D and the `CB(8, 92)` arithmetic) before registration, and the registry-wide alias check for
   `E993-R30-CB-SECTOR-SPECTRAL-SWITCH-HALL` and the corrected `E993-R30-CB-SECTOR-DELETION-NORMALIZED-MATCHING`.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c1-crit-T1-F/` (SHA-256):

- `replay/shipped_output.json` `ad293ed2a95ee09c711aff9c6ba3f52f340cb97dc057276f45d2050846f2c39d`
- `replay/t1_instrument.py` `5bae3eed7d104d2bc20d995bc8e31179784cc4c8d05b7898fffcb6b081497de1`
- `replay/t1_instrument_output.json` `ad293ed2a95ee09c711aff9c6ba3f52f340cb97dc057276f45d2050846f2c39d`
- `own/cb892_lemma.out` `6d8653acd23bc6ed2d15bff044252e420b79932836ddf7396310189fe8417172`
- `own/cb892_lemma.py` `e9763ea83977866273229b2df3a89c10361db0e57b46d700bc1a6e310dab2616`
- `own/cbforms.py` `6cb4fbee8bc43202ab0d2971ccedf5d7dfecbd10816f6866a28010a916e5a12c`
- `own/crit_lib.py` `8745b2a9887da1124ca79fbe2eee485d0aec3b46e83bec798123fa18b2a38b6d`
- `own/fixed_points.out` `81102114f80daf1d481cda9e8b199b3a0702be424b7896cc2d9e42cd8c5d86f8`
- `own/fixed_points.py` `015f67fc2f75c8a6b4ae53bd1b5c882a1ccd20cc6e207d7e1e0f711e9a92e781`
- `own/lemmaC_small.out` `cbd0a7bdeca0b9c257f0673f261fda6fa67f75d99c2f3d5ce25d60604c54c6f0`
- `own/lemmaC_small.py` `d3f776bff347cd6e8549d62118cb7441a2a0bfb3a195e2efdc368dd7b0644efd`
- `own/overlap.out` `e6ecf1c7374fd11036ae78c33cdb1852fee57a604a2e70731938105d2d4cf201`
- `own/overlap.py` `30437da838086686aeb4ef64f26c05a4644887a8982e8b107875709ebdced014`
- `own/sector_brute.json` `461fc47711191cdddb1c86f0555473aec8237f1dd3e9da5baba8ea73f7e3caa1`
- `own/sector_brute.py` `b87422d9b87466c3cb02805dd69ceaa4b99b4edcbe36510e9155e4e9c9f17e02`
- `own/sector_flow.json` `c0f34c739e9d5af5bcefd103e3cedd71b31915ddf80fa5128da889140a6b85ef`
- `own/sector_flow.py` `bbf7dbe52eb68592970744826c5ade97a98f0e52f865986a93c97815256ab271`
- `own/spectrum_check.out` `23d3897024b745fa1768362eb97497e7ce140614ba72686eb44f5cb6a93f8784`
- `own/spectrum_check.py` `987c3591298fc090c1964c77fdcc6a27cd4a401324bf72bdc03ec37348590185`
- `own/sweep.py` `c3114309a98169d990751cfdb2ecbf94a0dad0002822ff95de9e78cceecd641d`
- `own/sweep2.py` `1a1842fa0d97232207126314dd77e3b845bcd83885aa723d3b33c3f42aac870d`
- `own/sweep2_1_12_400.console` `1cbf3a92a92ed2ffc2f985c302e66aa4819245afe848b1a5e33baa982339c8ae`
- `own/sweep2_1_12_400.json` `cbe9bbcebe11c29b4fe12c36a0d07e73160f144b22d9c199b372199f46290d2b`
- `own/sweep3.py` `b7f12610ebc5d7ea10af4777cefa2f1d3ce94963977a1f6906a46a3176f9d38f`
- `own/sweep3_1_12_400.json` `4ed3b6f615de9fc5082bc3763e4d1030500402fc45bac846f2d800b4e90737da`
- `own/verify_forms.out` `ae272570be6d1be03c371082a0813e7ad428e53c435a84ac6023b73824da4df5`
- `own/verify_forms.py` `12509a54c178f848fe7f2c39bae66d643fc328fd5f402f791020073dd518b096`
- `own/xpp.out` `347c5e67c81449e05ab018a95300642c3177ab06c097703c96bb6955229f2326`
- `own/xpp.py` `5f5e3ff58c909dada768a5d42c924c4410c897a772391c4790a27da167f9de0b`
- `own/xpp_cb892.out` `48e712125f1b635649fa19415c1180435b5f5831e3285271ac5f44549d9d8dbb`
- `own/xpp_cb892.py` `4e8d5152e31c85da8a21999496ae4499ef7c5dbefac657318ec25971cb91638f`

Roles: `replay/` = copy-out-first replay of T1 (`t1_instrument.py` as shipped, `t1_instrument_output.json` regenerated, `shipped_output.json` the seat's original copy; byte-identical). `own/crit_lib.py` (library), `fixed_points.*` (K_{1,12}, CB(1,7) with max-flow), `verify_forms.*` and `cb892_lemma.*` (CB closed forms vs DP; literal CB(8,92); Lemma C on the window), `sector_brute.*` (literal switch weights vs formula; T1-code-vs-formula), `overlap.*`, `sector_flow.*` and `lemmaC_small.*` (exact sector-restricted max-flow; F3), `xpp.*`, `xpp_cb892.*` (switch-dead family GF), `spectrum_check.*` (Fact C, exact), `sweep*.py` / `sweep2_1_12_400.*` / `sweep3_1_12_400.json` (coverage sweeps).

No background job remains: both background runs exited normally (last PID `79949`, checked by `ps -p 79949`), before this file
was written.
