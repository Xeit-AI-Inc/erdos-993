# Critique

**Critic:** `C-T2-U`, Cycle 1, r31, a cross-orientation critic (orientation U, formal/structural) of seat `T2`.
**Assigned return:** `cycles/cycle-1/stage3/returns/T2/RETURN.md`, route `C1-T-02`, mechanism token
`LS-TOP-SLACK-ALLOCATION-WITH-EXPLICIT-ERROR-BOUNDS`, orientation T (prove).
**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and loaded no other VerityOS subsystem. The run's controller owns
conversation logging and durable updates. This critique writes only this file and scratch under `scratchpad/c1-crit-T2-U/`.

**Read-boundary disclosures.**
(1) The harness put the project `CLAUDE.md` and the user's auto-memory index (`MEMORY.md`) into my context. I did not fetch either
file, and I did not use either one.
(2) Reading `control/C1-STAGE3-PACKET-MANIFEST.json`, which is a capsule member, showed me the paths and digests of sibling returns. I
did not open any sibling return, critique or adjudication.
(3) `ls -la` of `scratchpad/c1-T2/`, which is granted, printed the `..` entry's metadata. It did not list any sibling names.
(4) I ran non-recursive `ls` on `sources/`, `sources/r30`, `sources/r30/records`, `sources/r30/instruments/c6` and
`…/c6/C-T2-U{,/own}`. I also read lines 15–80 of `sources/r30/records/SEMANTIC-CONTRACT.md` (the definitions of WID and S), two
registry entries of `sources/authority/CLAIM-IDENTITY.json`, and the `8,95,508` row of
`sources/r30/instruments/c6/C-T2-U/own/CERT-TABLES.json`. All of these sit under `sources/`, which is authorized. I did not read any
r30 critique text.
(5) An `echo =====` separator failed under zsh. It was harmless. I used no network, installed no packages, used no Lean and ran no
background jobs.

## Identity and seal audit

| Object | Recomputed | Expected | Result |
|---|---|---|---|
| Dispatch `DISPATCH-C-T2-U.md` (file SHA-256) | `e20a0106…d302` | `e20a0106…d302` | match |
| Capsule `T2-PACKET-MANIFEST.json` inner seal | `c7f5968bb5a6bb2c2981df3664e2e7a031f287d01db328bfe232b5515aabeefc` | same | **match** |
| All 14 capsule members (SHA-256 and bytes) | 14/14 | manifest | match |
| Stage 2 seal | `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc` | same | match |
| Stage 3 seal | `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37` | same | match |
| Stage 4 dispatch seal | `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b` | same | match |
| Return `T2/RETURN.md` | `74b7c0c9…498d` | Stage 3 and capsule | match |
| `t2_flat_obstruction.py` / `t2_fixed_point_x.py` | `84a73463…989e` / `2a87f7a0…42d5` | return §4 | match |
| Payload digests (flat / fixed_point_x) on my replay | `f16fb678…4292` / `ff8cd98e…6b96` | return §4 | match |
| `t2_quadratic_feasibility.py` / `t2_exact_dp_search.py` | `2ca3e124…1228` / `80c8bd1a…a48329` | **not listed in the return** | inventory gap (below) |
| Their payload digests on my replay | `fe3722a7…62c` / `9efc0ef6…0aa82` | the shipped JSON `sha256` fields | match |

The return verified its Stage 2 seal and its dispatch digest. The fourth replay artifact is identical to the shipped outputs: every
replayed `_output.json` is byte-identical to the original.

## Independent re-derivation

I wrote my own instrument, `scratchpad/c1-crit-T2-U/crit_t2u_instrument.py`. It uses the standard library only and is deterministic,
with seed 993. It reuses none of the return's or r30's code.

**Fidelity first (Part A, literal tree, generic forest DP, no closed form).** At `m = 107, 110, 113` I built the labelled `CB(8,m)` on
`17m+3` vertices and checked that it is a tree. A generic rooted DP gave `I(T)`, and from it I computed `α` and `x` through rank `α`,
including the terminal difference. I derived `F_{p*}` on the original tree from `Δ_{p*}(T − z)`, using `z = v`, `c_{1,1}` and
`c_{m,8}`, with every other `c_{ij}` covered by automorphism. I then asserted (WID) from two independent sides:

- **side 1**, the supply minus capacity at `p*`, from my own weighted generating function
  `Σ_B w_F(B) y^{|B|} = y²(1+2y)^{8m} + 8m·y²(1+y)^7(1+2y)G^{m−1}`;
- **side 2**, `Σ_{z∈F}[q_z(p*) − q_z(p*−1)]`, with `q_z(j) = i_j(H_z) − i_j(R_z)` computed by the generic DP on the literal `H_z` and
  `R_z`.

| m | n | α | x | p* | eligible (E) | parent descent | `F_{p*}` | (WID) sides equal | sign `S(T,p*)` |
|---|---|---|---|---|---|---|---|---|---|
| 107 | 1822 | 964 | 570 | 572 | yes | yes | all 8m+1 leaves | yes | negative |
| 110 | 1873 | 991 | 586 | 588 | yes | yes | all leaves | yes | negative |
| 113 | 1924 | 1018 | 602 | 604 | yes | yes | all leaves | yes | negative |

This reproduces the fixed point of record `CB(8,107)/572`. The rows are census facts at three rows only, not proof.

**Literal sector structure (Part B, brute-force enumeration).** I checked `CB(8,1)`, `CB(3,2)`, `CB(4,2)` and `CB(2,3)` at every rank
that has a nonempty sector. That is 28 rank rows, and every check passed. The checks were:

- side 1's weighted count equals the brute-force literal active-tag sum at every layer;
- `|sec| = 2^K C(dm, K)`, and every sector member has weight exactly 1;
- every (D) arc that deletes a leg lands on a weight-1 in-sector target, and deleting `r` or `v` gives weight 0;
- the only (S) arcs are at `s`, with weight 0, and at `u_i` for choke state `β = 1`, where the image has weight `γ`;
- every switch image of weight `γ ≥ 1` has exactly `d − γ` sector preimages;
- with random rates `pb(β,γ)` and `pc(β,γ)` that depend on the full state, the literal inflow of every in-sector target equals the
  per-state formula `Σ_i (d − n_i)(pb(β_i+1,γ_i) + pc(β_i,γ_i+1))`;
- the double count `Σ_sources Out_del = Σ_targets In` holds exactly.

The return used the template's Out/In functions without writing out the reduction. On small instances these facts confirm that the
Out/In/switch functions the return uses are the literal network's, restricted to the sector.

**Exact identities (Part C).** I checked each of these by hand algebra and by an assertion over the tested rows.

- `2(8m − K + 1) = p*`, with `K = p* − 1`: `8m − K + 1 = (8m+2)/3`.
- `C2 = K/(2m) − (8 − s) = −1/(2m)`, with `s = (K−1)/m`.
- `C1 = (D − s)(1 − 1/m)`.
- `R_K/R_{K−1} = 2(8m−K+1)/K = p*/(p*−1)`, so `R_K − R_{K−1} = R_{K−1}/K`.

I re-derived the return's elimination and it is correct. Condition (II) factors as `(D−s)(a+bs) ≤ K/(2m)`. Substituting `a ≥ 1 − b(t−1)`
gives `b·C1 ≤ C2`.

**Replays.** I copied all four generators out to `scratchpad/c1-crit-T2-U/replay/` and ran them in the foreground. Every payload digest
matched. The DP rows at `m = 107` reproduce exactly: flat `1 / 572/571`; `B = +1/(100K)`: `596/571 / 602/571`; `B = +1/(1000K)`:
`1147/1142 / 575/571`; `B = −1/(100K)`: `26559/28550 / 14294/14275`.

## Attacks and findings

**F1 (main finding: mathematical alias, which narrows both proposals).** Neither of the return's families includes a switch in its
Out/In system, apart from the one "switch cannot rescue" paragraph in §6.1. §6.2 and every DP row are switch-free. A switch-free
sector allocation is infeasible for any rates whatsoever, by the registered key `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`
(`VERIFIED`, `proved_informal`). At `t = 1` that key's deficit criterion is `3p < 2dm + 5`, and on the class `3p* = 16m + 4 < 16m + 5`.
Its maximal deficit is `R_K − R_{K−1} > 0`, attained on the whole sector.

In the notation of the family, the identity `2(8m−K+1) = p*` is exactly the biregularity ratio `R_K/R_{K−1} = p*/(p*−1)` of that key
(T-D-R1 at `q = 2`). This affects the two proposals as follows.

- **Family 1 (flat rate) without the switch** restates the registered deficit.
- **Family 2 (Jensen / convex-quadratic)** is switch-free throughout, so the deficit key already rules out every `(A, B)`, not only
  `B ≥ 0`. The Jensen machinery proves a strictly weaker consequence of a registered fact.
- **Alias check.** The return's §7 says no registered key "states or implies a fact about the flat or convex-quadratic
  sub-families". That is false mathematically. The lexical check passed; the mathematical check fails.
- **Proposal 2** (`…-CONVEX-QUADRATIC-OCCUPANCY-ALLOCATION-JENSEN-CERTIFICATE-INFEASIBLE`) should not be registered as new content.
- **Proposal 1** (`…-CONSTANT-RATE-SECTOR-ALLOCATION-INFEASIBLE-…`) has new content only in its "with the switch" clause: the all-`c`
  source that uses no `(1,γ)` state.

**F2 (the "with switch" clause of Family 1 is correct, completed as follows).** In ≤ 1 forces `p ≤ 1/p*` whatever `σ` is, because the
switch never loads in-sector targets. Then any source with `β = 0` at every choke has Out = `pK ≤ K/p* < 1`. Such a source exists
because `K ≤ 8m`. The return argued this only at `p = 1/p*`. The bound covers every `p`, so the clause is sound for every `(p, σ, θ)`.
My theorem N below subsumes it.

**F3 (Jensen use and inequality directions).** The Out-Jensen step (`g` convex iff `B ≥ 0`) and the In-Jensen step (`h` concave iff
`B ≥ 0`) are correct over the reals. They apply to integer splittings, and they need no remainder or `M_0`. `C1 > 0` and `C2 < 0` hold
exactly for every `m ≥ 2`. The step contains no ℕ-subtraction, no Newton/Darroch, no asymptotic "≈", and no reliance on the `θ*` law.
The return's own caveat is honest: infeasibility of the Jensen certificate is not infeasibility of the family. F1 makes the caveat moot,
because the family is infeasible anyway.

**F4 (fresh rows first, gate ruling 2).** The return makes no universal positive claim, so ruling 2 is not triggered. Its negative
claims are exact at every `m`, and it tested them at `m = 107, 110, 113`. Satisfied.

**F5 (deliverables not met; honestly reported).** The allocation asks for five items, and the return supplies none of them:

- a feasible allocation;
- a proof with an explicit `M_0`;
- an exact verification at `m = 107, 110, 113`;
- a check at the smallest `m` the bounds cover;
- the bound `θ(m) ≤ 1 − ρ_1(m)`.

The route says it is `blocked`. That is accurate.

**F6 (fidelity gaps; nothing struck).** The return asserted no (WID) and derived no `F_{p*}`; it cited favorability. It also never
wrote out the per-state reduction (gate ruling 4). Its negative claims depend on the network only through two facts: sector weight 1
and in-sector capacity 1 when `v ∈ F`. My Part A derives `F_{p*} = leafSet` and asserts (WID) from two sides at all three rows. My
Part B checks the per-state reduction on literal instances. Nothing downstream fails.

**F7 (gate line).** `LS_top: template_failure_found` can be read as a failure of the r30 template. What actually failed are two
switch-free sub-families, and a registered key already implies both failures. The r30 template itself did not fail at any tested row.
I record `not_advanced` below.

**Critic-derived advance: a no-go for rates that depend only on leg count, plus two necessary conditions. Attributed to `C-T2-U`,
STATED, needs an isolated second read.** Let `T = CB(d,m)` at rank `p` with a deletion-deficient sector (`R_K > R_{K−1}`, `K = p − 1`).
This covers every member of the r31 class at `p*`. Consider any choke-local template (`pb`, `pc`, `σ`, `θ`) satisfying Out and In.

- **(N) Lone-b discount (necessary).** Some `γ ∈ {1..7}` has
  `pb(1,γ) + γ·pc(1,γ) < min{β'·pb(β',γ') + γ'·pc(β',γ') : β' + γ' = 1 + γ, β' ≠ 1}`.
  *Proof.* Suppose (N) fails. Give each source `B` a twin `B'`: at every choke, replace the state by a switch-free state with the same
  leg count and minimal deletion outflow. The twin is a sector source with `Σ n_i = K`, it uses no switch, and
  `Out_del(B) ≥ Out_del(B')`. Out at `B'` gives `Out_del(B') ≥ 1`. So `Σ_sources Out_del ≥ R_K`. But
  `Σ_sources Out_del = Σ_{in-sector} In ≤ R_{K−1} < R_K`; this double count is exact and was checked literally in Part B.
  Contradiction. ∎
- **Corollary (the no-go).** Any allocation whose `pb` and `pc` depend on the choke state only through `n = β + γ` is infeasible for
  every `m` in the class, whatever `σ` and `θ` are. This holds even when `pb(n) ≠ pc(n)`, because the switch-free states `(0,n)` and
  `(n,0)` already attain `n·min(pb(n), pc(n))`. The corollary subsumes both of the return's families and closes the door the return
  names in §8.2, "deletion probabilities depending only on the leg type and the choke's leg count".
  Still open: rates that depend on `β` and `γ` separately, which (N) permits, such as `pb = φ(β)` and `pc = ψ(γ)`.
- **(B) Switch budget (necessary).**
  `θ ≥ θ_budget(m) := (R_K − R_{K−1}) / Σ_{γ=1}^{7} γ N_γ`, with `N_γ = m·C(8,γ)·2^{K−1−γ}·C(8m−8, K−1−γ)`.
  Here `N_γ` counts the switch images of weight `γ`, each of which has `8 − γ` preimages. The denominator has the closed form
  `m(8[y^{K−2}](1+y)^7(1+2y)^{8m−8} − 8·2^{K−9}C(8m−8,K−9))`, which I asserted equal to the direct sum.
  *Proof.* `Σ Out ≥ R_K`, `Σ Out_del ≤ R_{K−1}` and `Σ Out_sw = Σ_γ (8−γ) N_γ σ(γ) ≤ θ Σ_γ γ N_γ`. The identity uses
  `8·C(7,γ) = (8−γ)·C(8,γ)`. ∎

  Exact values:

  | m | `θ_budget·m²` | fitted law / budget | recorded `θ*` / budget | `(1−ρ_1)`/budget |
  |---|---|---|---|---|
  | 95 | 1.2071 | 1.1878 | 1.1878 | 36.8 |
  | 107 | 1.2076 | 1.1879 | 1.1879 | 41.46 |
  | 110 | 1.2076 | 1.1880 | — | 42.6 |
  | 113 | 1.2077 | 1.1880 | — | 43.8 |
  | 1001 | 1.2105 | 1.1891 | — | 387.6 |

  At `m = 107`, `θ_budget = 36132547728/342577655754191`. The recorded r30 optima satisfy the bound, which is a consistency check on a
  prior, not evidence. `41.46/1.1879 = 34.90` reproduces the recorded margin `(1−ρ_1)/θ* ≈ 34.90` independently.
  A heuristic limit, derived by a hypergeometric → binomial limit with no remainder and so NOT a claim, is
  `θ_budget·m² → 19683/16256 ≈ 1.2108`. The fitted constant `1.44` is about 1.189 times this floor.
- **Reading for a successor.** Across the class, total switch capacity is not the obstacle: it exceeds the floor by a factor of about
  41 at `m = 107`, and the factor grows with `m`. The difficulty is purely the local Out/In balance, and (N) says where to create
  slack: states `(1,γ)` must carry less deletion outflow than every switch-free state with the same leg count. The r30 LP table
  `8,95,508` satisfies (N) strictly at all seven `γ`, which is a consistency check on a prior.

## Mechanism-equivalence and fence check

- **One rank per tree, class only.** All claims are at `p*` on `m ≥ 107`, `m ≡ 2 (mod 3)`. Uses of `m = 95` are fixed-point replays
  only. My Part B small instances are structural checks and claim nothing about the target. Pass.
- **No refuted mechanism revived.** The flat per-leg rate is not the refuted "`m`-independent per-choke certificate"; it is shown
  infeasible. Pass.
- **No `θ*` law as a hypothesis.** Pass for both the return and me. I use the law only as a comparison value.
- **No census as proof.** Pass. The return's eligibility table at three rows is labelled a fidelity check.
- **No status transfer to any aggregate key.** Pass. The headline stays unresolved.
- **Darroch/Newton.** Not invoked. `ρ_1` is taken as an exact coefficient ratio. Pass.
- **Mechanism identity.** The return's two proposals are, in their switch-free content, the registered sector deletion deficit (F1).
  The only non-aliased residue is the "with switch" clause of proposal 1, and theorem N subsumes it.

## Certification audit

- "proved infeasible … for the entire class" (Family 1): **backed**, since the algebra is exact. Its novelty is **struck** for the
  switch-free part, which is an alias. The with-switch clause is backed, with the repair in F2.
- "proved for the Jensen-sufficient certificate, for the entire class" (Family 2): **backed but vacuous**. It is implied by the
  registered deficit key, so it is **struck as a new claim**.
- "`proved_informal`" on both proposals: **struck as registrable grades**. This is a Stage 3 statement with no second read (§4), and
  proposal 2 is an alias. The mathematics is correct. My grade for the non-aliased residue, together with theorem N, is
  `proved_informal`, STATED, pending an isolated second read.
- "none states or implies a fact about … these sub-families" (§7): **struck** (F1).
- "Verified against my own exact min-plus/max-plus DP" and the DP table: **backed** by my replay.
- "re-run … byte-identical payload digests": **backed** for all four generators by my replay. Only two script digests appear in the
  return. The `t2_quadratic_feasibility.py` and `t2_exact_dp_search.py` digests (`2ca3e124…`, `80c8bd1a…`) are missing, which is an
  inventory gap on the face, not a mathematical defect.
- "fixed point … MATCH" (`ρ_1(95)`, `x(107) = 570`): **backed** by replay and by my generic DP.
- "(L-S)_top is not refuted (the r30 LP already exhibits a … feasible certificate at tested rows)": **acceptable**. Those rows are
  95–107 at `computer_assisted`. The fresh rows `110` and `113` are uncertified.
- Gate line `LS_top: template_failure_found`: **not endorsed** (F7).

## Verdict

verdict: retained_narrowed
headline_resolved: no

LS_top: `not_advanced`
ELIG_top: `not_advanced`
cut_candidate: `none`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

The mathematics of the return is correct, and it honestly reports a blocked route. Both "obstructions" are narrowed. The switch-free
content of each is the registered `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` at `t = 1`. The only non-aliased residue is the
all-`c`-source observation, which shows the switch cannot rescue a flat rate. Critic-derived, STATED, for second read:

- theorem N, which rules out every rate family that depends only on leg count, with any switch;
- the necessary lone-b discount (N);
- the exact switch-budget floor `θ_budget(m)`.

## Remaining obligation

(L-S)_top is untouched in substance. What is still needed: a choke-local allocation (`pb`, `pc`, `σ`, `θ`) at `p*(m)` whose rates
depend on `β` and `γ` separately and satisfy the necessary lone-b discount (N). It must come with closed forms in `m`, nonnegativity,
and proofs of four constraints for every `m ≥ 107`, `m ≡ 2 (mod 3)`:

- Out, over every splitting of `K`;
- In, over every splitting of `K − 1`;
- Switch, `(8−γ)σ(γ) ≤ θγ`;
- Residual, `θ ≤ 1 − ρ_1(m)`, with an explicit lower bound on `1 − ρ_1(m)`.

Every asymptotic step needs an explicit `M_0` and remainder. The constraints must first be tested exactly at the fresh rows `110` and
`113` with an independent min/max-over-splittings verifier. Any feasible `θ` necessarily satisfies `θ ≥ θ_budget(m)`, which is about
`1.21/m²` (exact values above), so the target interval is `[θ_budget, 1 − ρ_1]`. Theorem N and (B) themselves need an isolated second
read before registration. Proposal 2 should not be registered. Proposal 1 should, if anything, be a scope note on the deficit key or be
absorbed into theorem N.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-T2-U/`.

| File | SHA-256 |
|---|---|
| `crit_t2u_instrument.py` (own instrument: parts A–D) | `93498157150025d1a88605d59cf461b370b0f1d93e2f137685112ac247d65770` |
| `crit_t2u_output.json` (payload digest `0b5de38c22cdac9cd30d84ddb06652cd40fe211b5d25096ae6760530bb265f1f`) | `6e90699e728f5fb4aa8ce89796438f407e9e679f4131225e78ff030ff51eb5e0` |
| `crit_t2u_run.log` | `35730f8c5cd89f064f99924474fc2a81933d9f005e79a2971f40196db1d5f4c1` |
| `replay/` (the four T2 generators copied out, `.orig.json` originals, fresh outputs and logs) | payloads identical to the originals |

To replay: `cd` into the directory above and run `python3 -B crit_t2u_instrument.py` in the foreground (about 6 seconds). I started no
background jobs, so none needed to be killed.
