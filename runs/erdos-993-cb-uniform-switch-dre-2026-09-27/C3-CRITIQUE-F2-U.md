# Critique

Critic `C-F2-U` (cross-orientation U, formal/structural) of Cycle 3 r31, on the return of seat `F2` (route `C3-F-02`,
mechanism `AT-RANK-COMPOSED-FLOW-ADVERSARY`, orientation F). Date 2026-09-28.

**Boot acknowledgment.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS file. Loaded for this task: this experiment's
`control/` capsule members, `sources/` (authorized Stage 2 members), the assigned return, and my own scratch.

**Read-boundary disclosures.**
1. The harness put the project `CLAUDE.md`, the user memory index and the user's e-mail into context before my first tool call.
   I did not use them. I followed the dispatch's restricted boot, not `CLAUDE.md`'s general boot/logging map, and I created no
   conversation log.
2. I ran non-recursive `ls` on `sources/`, `sources/r30/`, `sources/r30/records/` (all within the grant). The last one showed the
   file names of r30 returns and critiques. I opened none of them. From `sources/r30/records/SEMANTIC-CONTRACT.md` I read only
   lines 1–90, for the definition of record of `S` and (WID).
3. I ran `grep` on two named registry files under `sources/` (`authority/CLAIM-IDENTITY.json`,
   `concurrent/master-510-2026-09-28/CLAIM-IDENTITY.json`) for the lexical alias check. Both are within the grant; neither search
   was recursive.
4. To audit the return's digest list I SHA-256-hashed nine Stage 2 members it names (`control/C3-WORKER-COMMON-BRIEF.md`,
   `cycles/cycle-3/stage2/ROUTE-STATE.md`, `control/CLAIM-IDENTITY.run-local.json`, `OBLIGATIONS.csv`, …). I hashed them but did
   not read their contents.
5. I made non-recursive listings of the return's two inventoried scratch directories, `scratchpad/c3-F2/` and
   `scratchpad/c3-F2-replay/`. I copied only `c3-F2/` out.
6. My own battery ran once as a background job (my PID 6855). I killed it by literal PID when its large-row tail proved too slow,
   then re-ran a trimmed version to completion. No job of mine is running at this write.
7. There was no network access, no package install, no child agent and no Lean/lake invocation. F2 is not a Lean seat.

## Identity and seal audit

- **Dispatch** `control/dispatch/c3-stage4/DISPATCH-C-F2-U.md`: SHA-256 `4c35effd…1b374`, MATCH.
- **Capsule seal (reported):** `F2-PACKET-MANIFEST.json`. I recomputed the canonical JSON without `seal_sha256` →
  **`d8eff376caef308b39e8fc7545da719a45b0c950f04ee5d57cedd676e265107b`, MATCH**. All 14 listed members match on SHA-256 and on bytes.
- **Stage 2 seal** `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`: MATCH (5,049 members). **Stage 3 seal**
  `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`: MATCH. **Stage 4 dispatch manifest seal**
  `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05`: MATCH.
- **Return digests.** The Stage 3 manifest lists `RETURN.md` = `a31e7580…6b654` and `DISPATCH-F2.md` = `26608d42…d7eb`, and both
  match. The nine Stage 2 member digests the return prints match the Stage 2 manifest and the bytes on disk. The C1-LA1 `Main.lean`
  on disk (`f0578ed7…b78e`) matches its Stage 2 entry.
- **Return artifacts.** `f2_lib.py` `ee1ed92f…89f4`, `f2_composed_flow.py` `43025968…6cd4`, `f2_selftest.py` `d807ebc3…2382` and
  `f2_composed_flow_out.json` `240ca851…659a` all MATCH after copy-out.
- **Replay.** I re-ran copy-out-first in `scratchpad/c3-crit-F2-U/replay/`. The output is byte-identical (file SHA `240ca851…659a`,
  payload digest `e582834823aaf7870f7f2a8e837da0540f106525b30363433603f3cfc728b33f`, the same as the return). The self-test printed
  `ALL MUTANTS DETECTED`.
- **Claim identity.** The return names the Tier 1 key, the eligibility key, the favorability, criterion and C1-LA1 keys, and
  `E993-TREE-REAL-ROOTED` (REFUTED) with its grade unchanged. It proposes one non-key bounded record,
  `R31-C3-F2-CB8-107-…-140-END-TO-END-COMPOSED-FLOW`. My lexical check of the two master registries under `sources/` for
  `COMPOSED-FLOW`, `END-TO-END` and `R31-C*` found 0 hits, so there is no collision. On mathematical content the record is not an
  alias of any key. Its scope, however, must be narrowed (see Attacks, A2), and the name must follow.

## Independent re-derivation

My own instrument uses the standard library only (`fractions`, `math.comb`, `re`, `itertools`) under
`scratchpad/c3-crit-F2-U/own/`. It shares no code with F2. It uses different vertex labels (`u_i = 3+i`, supports `3+m+8i+j`,
leaves `3+9m+8i+j`). It is built only from the r31 SEMANTIC-CONTRACT and r30 SEMANTIC-CONTRACT §1.

1. **Literal tree, generic DP.** A component-wise forest DP computes `I(T)`, `I(T−t)`, `i_j(H_t)` and `i_j(R_t)` (with
   `H_t = T−{t,s_t}` and `R_t = T−N[s_t]`, the `C5LA1.aggregate` sets of record) for `t ∈ {v, c_{0,0}, c_{m−1,7}}`. At all nine
   ruling-17 rows (107, 110, 113, 116, 119, 122; fresh 125, 128, 140), each of these holds:
   - tree test passes;
   - `deg I = 9m+1 = α`;
   - `x` scanned through `α` gives 570/586/602/618/634/650/666/682/746, i.e. `x = p* − 2`;
   - eligibility and parent descent (a) are true;
   - `Δ_{p*}(T−v) < 0` and `Δ_{p*}(T−c) < 0` at the ruling-16 index;
   - the two `c` choices agree exactly, a symmetry spot-check that backs the "multiply by `8m`" step F2 left implicit.

   So `F_{p*} = leafSet`, derived.
2. **(WID) from genuinely independent sides, at both ranks.**
   - The aggregate side is `S_agg = Σ_F [q_t(p*) − q_t(p*−1)]`, with `q_t(j) = i_j(H_t) − i_j(R_t)` from the generic DP.
   - The weight side is `Σ_{I_{p*+1}} w_F − Σ_{I_{p*}} w_F`, computed from my class decomposition of the literal active-tag weight.
     The sector (`r, v ∈ B`) has weight 1. Class `q` (`r ∉ B`, `q` chokes present) has weight equal to the number of `c`'s at
     present chokes, with generating function `C(m,q)·8q·x^{q+1}(1+x)^{8q−1}(1+2x)^{8(m−q)+1}`.
   - I validated the decomposition against **brute-force literal enumeration** of `w_F`. On `CB(8,1)` it matches at every `k`. On
     `CB(8,2)` it matches for `k ≤ 6`. Literal (WID) also holds there: on `CB(8,1)` for `k = 1..19` and on `CB(8,2)` for `k = 1..5`.
   - **Result:** at all nine rows, supply half, capacity half and full (WID) are all exact, and `S < 0`. My `S` equals F2's `S`
     at every row, and my `ρ_1` and `x` equal F2's.
3. **E1 condition (i) at every `q`, the check F2 did not make.** `ρ_q = r_q(p*−q)/r_q(p*−q−1) < 1` for **every** `q ∈ [1, m]` at
   all nine rows, and `ρ_1` is the maximum. For example, at `m = 107` the largest `ρ_q` over `q ≥ 2` is 0.99388 and
   `1 − ρ_1 = 0.004373`.
   - Class in-balance `supply_q = ρ_q · cap_q` holds exactly for every `q`.
   - I also obtained the whole-network decomposition `S = (R_K − R_{K−1}) − Σ_q (1−ρ_q)·cap_q`, exact at every row.
4. **C1-LA1 table.** I parsed it programmatically from the frozen `Main.lean` text (36 + 36 + 7 cells), independent of F2's
   hand entry. F2's `cb8_out`/`cb8_in`/`cb8_sigma`/`cb8_theta` agree with my parse at every state and every row, so F2's table entry
   is faithful. At the nine rows plus `m = 200, 302, 500, 1001`:
   - the arc values `pb`, `pc`, `σ` are nonnegative;
   - Switch and Residual hold;
   - my own min-plus/max-plus DP gives `min ΣOut = 1` and `max ΣIn = 1`;
   - the combined switch-image load ratio `max_γ (ρ_1γ + (8−γ)σ(γ))/γ` is 0.99575 at `m = 107` and rises toward 1: 0.99673
     at 140 and 0.99953 at 1001.

## Attacks and findings

**A1 — (WID) was half-asserted (fidelity, ruling 18).** F2's `supply` and `capacity` are both `Σ_F q_t` on the **aggregate** side.
Its `S := supply − capacity` is therefore the aggregate by construction. The only weight-side (independent) check is on the supply
half (`criterion_part + sector_part = supply`, at rank `p*+1`). The capacity half at rank `p*` has no independent side. "Supply −
capacity = S from three independent sides" is overstated: the three sides agree on the supply half only. The downstream numbers
are **not** struck, because I closed the capacity half independently (Re-derivation 2), exact at all nine rows. The literal must
still be corrected.

**A2 — no composed flow was built (the object of record).** The allocation named the object as "X-8's arc values plus C1-LA1's
allocation after scaling … exact inflows on every target class … row sums per source; Hall sums over structured X". F2 did the
following instead:
- It evaluated no E1 arc value and constructed no flow on any literal arc.
- It did not check the E1 inflow on `q ≥ 2` targets or on one-choke non-images, and it did not check `ρ_q ≤ 1` for `q ≥ 2`.
- It did not check E1 row sums per source.
- It did not do any Hall sum over structured `X`, as its own Remaining obligation 2 concedes.

Everything F2 checked on the sector side is a template-level fact. Nonnegativity, Switch, Residual, `min ΣOut ≥ 1` and `max ΣIn ≤ 1`
are exactly the conclusions of the **formally verified** `cb8_topRank_sectorTemplate_feasible` (C1-LA1, all `m ≥ 107`,
`m ≡ 2 mod 3`). Re-evaluating them at nine rows adds no evidence beyond the (confirmed) fidelity of F2's table entry. The in-sector
profile `(1,4)^{(2m+2)/3}(1,5)^{(m−2)/3}` summing to 1 is also a template fact.

"End-to-end composed flow on the literal network" is therefore **not backed**. The correct scope is: *bounded consistency of the
eligibility/favorability/(WID)-supply inputs and of the C1-LA1 template at nine rows*.

**A3 — template versus network (fence 4) was assumed, not tested.** F2 speaks of "the literal network at rank `p*`". Nothing it
computed touches a literal arc. The per-state `Out/In/(8−γ)σ(γ)` accounting is exactly the reduction fence 4 says must be proved
(U1/T3's object). I tested it on literal instances, as a bounded result (see Critic-derived advance (i)).

**A4 — nonnegativity was checked on the wrong objects.** F2's `nonneg_ok` tests `Out ≥ 0` and `In ≥ 0`. Flow nonnegativity is a
property of the arc values `pb`, `pc` and `σ`. This is harmless: C1-LA1 proves the arc values nonnegative, and my check confirms it
at 13 rows. The literal is still misattached.

**A5 — a false implication.** The Remaining obligation says "the per-target bound implies the summed Hall inequality by summation".
Capacity bounds on targets alone imply nothing. Hall follows from a **saturating** flow, which needs row sums equal to supply plus
target caps plus support on (REL) arcs. The sentence is struck. The correct form: "a saturating flow implies (HALL-COND) by
summation".

**A6 — a table label.** The column headed "S digits" (411 … 537) reports `len(str(supply))`, per the driver's `supply_digits`. `|S|`
has 409 digits at `m = 107` and 535 at `m = 140`. This is a mislabel, not a numerical error.

**A7 — novelty claims.** The claims "rows 116, 119, 122, 140 receive their first end-to-end pass in this run" and the statements
about the scope of `R31-C1-SR-5` and `R31-C2-SR-C2-*` depend on records outside my read boundary. They are unverified here, not
refuted. Given A2, "end-to-end" is not the right description in any case.

**A8 — what survives attack.**
- Asymptotics: none used.
- Newton/Darroch: none applied, and the (REFUTED) real-rootedness claim is not revived.
- ℕ-subtraction: `8m−7` in `cb8R1` is fine for `m ≥ 1`, and I cross-checked `cb8R1` against my `r_1`.
- Endpoint `m = 107`: included.
- Ruling 16: correct index. F2's "wrong-index" diagnostic is correctly labelled non-evidence.
- Ruling 17: all six controls and all three fresh rows are present.
- The mutant self-test is live, but it tests only F2's own checks, which are template/aggregate-level (A2).

No cut, no template failure and no fidelity break in any number F2 reports.

**Critic-derived advances (attributed to critic C-F2-U; bounded or STATED; each needs a second read).**

- **(i) Literal sector-arc bridge, bounded.** Setup, on literal `CB(8,2)` with 5 legs (139,776 sector sources) and literal
  `CB(8,3)` with 4 legs (170,016 sources):
  - I enumerated every literal (D) ∪ (S) arc.
  - I assigned `pb(state)` to each `b`-deletion, `pc(state)` to each `c`-deletion, `σ(γ)` to each `u_i`-switch at a `(1, γ≥1)`
    choke, and 0 to every other arc (the `s`-switch, the `(1,0)`-switch, and `r`/`v` deletions).
  - I used both the governed m=107 table and a random positive table.

  Results, all confirmed exactly:
  - literal outflow = `Σ_i Out(state_i)` for every source;
  - literal inflow = `Σ_i In(state_i)` for every in-sector target, whose literal weight is 1;
  - inflow = `(8−γ)σ(γ)` for every switch image, whose literal weight is `γ`;
  - **zero** positive flow onto any other target.

  This is bounded evidence for fence 4's reduction at small `m`, not a proof (the proof is U1/T3's object).
- **(ii) Whole-family Hall sums (the step F2 left open).**
  - **(a) Literal `X = sec`.** `N(sec)` has weight `R_{K−1} + Σ_{γ=1}^{7} γN_γ`, with
    `N_γ = m·C(8,γ)·2^{K−1−γ}·C(8m−8, K−1−γ)`. I validated this formula by literal enumeration on `CB(8,3)`, 4 legs (33,592) and
    `CB(8,2)`, 6 legs (255,024). Across the 13 rows the ratio `Σ_X w / Σ_{N(X)} w` falls from 0.0569 at `m = 107` to 0.0064 at
    `m = 1001`.
  - **(b) Literal `X = I_{p*+1}`.** The slack is `−S > 0` at the nine rows.
  - **(c) Composition budget.** With E1 loading class `q` at the uniform ratio `ρ_q`, the sector must fit into the residual
    image capacity. This needs `R_K − R_{K−1} ≤ (1−ρ_1)·Σ_γ γN_γ`. It holds at all 13 rows, with ratio Λ = 41.46 at 107,
    48.43 at 125, 49.59 at 128, 54.24 at 140 and 387.6 at 1001, growing roughly linearly in `m` (bounded observation).
  - **(d) STATED, elementary.** Any sector allocation with Out ≥ 1 (scaled to exactly 1), In ≤ 1 and per-image switch load
    ≤ `θγ`, whose positive arcs land only on in-sector targets and switch images (the bridge in (i)), satisfies
    `θ ≥ θ_Hall := (R_K − R_{K−1})/Σ_γ γN_γ`. Proof: sum the outflows. `R_K ≤ R_{K−1} + θ·Σ γN_γ`.

    At all 13 rows the governed `θ(m) = 288/(200m²+82m+5)` sits at `θ/θ_Hall ≈ 1.1879–1.1891`, for example
    `θ_Hall(107) = 36132547728/342577655754191`. The C1-LA1 template therefore runs about 19% above the whole-family floor. This
    is a live consistency test of C1-LA1 plus the bridge: a θ below the floor at any row would expose a contradiction. It also
    bounds any hoped-for improvement of the template's θ to under a factor of about 1.19. No claim is made about a limit.

## Mechanism-equivalence and fence check

- The mechanism is the registered composition: E1 criterion flow plus the r30-template sector certificate with C1-LA1's table.
  No refuted mechanism is revived. The (G′) two-binomial ascent tool is not used, and neither is the `m`-independent per-choke
  certificate. The θ* law is used only as the governed table's θ, never as a hypothesis of optimality. My θ_Hall observation
  concerns the template value, not optimality.
- Fences: one rank `p*` per tree and the residue-2 class only; no status transfer to (HALL) or to any aggregate. The census and
  row values are `bounded_computation` and never proof, and F2 says so on the record's face.
- Fence 4 (template vs network) is where F2's wording overreaches (A2, A3). My advance (i) is bounded evidence only. The reduction
  remains a proof obligation of U1/T3.

## Certification audit

| Literal in the return | Status |
|---|---|
| Seal/digest values; byte-identical replay; `ALL MUTANTS DETECTED` | **backed** (replayed) |
| `n, α, x, p*`, eligibility, descent (a), favorability at `p*`, `θ`, `ρ_1`, `S<0` at nine rows | **backed** (independently re-derived, exact) |
| "exact coefficient-by-coefficient match" generic DP vs closed form | backed by replay (my DP is generic, I did not re-test F2's closed form) |
| "supply − capacity = S(T,p*) … from three independent sides" | **struck as stated**: supply half only (A1). Replace with "supply half from weight side; capacity half closed independently by critic C-F2-U" |
| "the actual composed rational flow … on the literal network"; record title "END-TO-END-COMPOSED-FLOW" | **struck** (A2/A3). No flow or literal arc was evaluated |
| "exact inflows on every target class" / "every switch-image's combined load … at most its capacity" | only switch images (template-level) and in-sector (template DP). `q ≥ 2`, non-image one-choke and weight-0 classes unchecked by F2. `ρ_q < 1` ∀q now **backed by critic** |
| "Out, In nonneg" presented as flow nonnegativity | misattached (A4). Arc-value nonnegativity **backed** (C1-LA1 formal; critic check) |
| "min Σ Out = 1, max Σ In = 1 … reproducing … by direct combinatorial optimization" | backed, but it duplicates a formally verified theorem. It carries no incremental grade |
| "S digits 411…537" | **mislabel** (these are supply digits, A6) |
| "per-target bound implies the summed Hall inequality by summation" | **struck** (A5) |
| "first end-to-end pass" at 116/119/122/140 | unverified within boundary (A7) |
| Grades "unchanged" on every key; the headline-unresolved line; gate lines | backed |

## Verdict

verdict: retained_narrowed
headline_resolved: no
COND4_formal: not_advanced
E1_formal: not_advanced
TERMINAL_integration: not_advanced
cut_candidate: none

**Narrowed record.**
- The record survives only as a bounded consistency check at `m ∈ {107,110,113,116,119,122,125,128,140}`:
  - eligibility and parent descent at `p*`;
  - `F_{p*} = leafSet` derived at the ruling-16 index;
  - `S(T,p*) < 0`, with the (WID) supply half from F2 and the capacity half from critic C-F2-U;
  - fidelity of F2's C1-LA1 table entry, and its template conclusions re-evaluated.
- It is **not** an end-to-end composed-flow confirmation and should not carry that name. A title like
  `R31-C3-F2-CB8-NINE-ROW-INPUT-AND-TEMPLATE-CONSISTENCY` would fit.
- Grade: `bounded_computation`. No key's grade moves.
- The critic-derived items (literal sector bridge at small `m`; whole-family Hall sums and the θ_Hall floor at 13 rows; `ρ_q < 1`
  for all `q` at nine rows) are separate bounded or STATED items and need an isolated second read.
- Nothing here is a cut or a template failure.

Two-part model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

Exactly what remains open after this critique:
1. **Conjunct 4 in Lean.** The saturating flow on the literal `cbGraph m` at `p*` has not been touched by F2 or by me. The
   bounded bridge in advance (i) does not discharge the Out/In/image arc-sum bridges (U1/T3) or the E1 construction (U2/T1/T2).
2. **An actual composed flow at a fresh row.** No seat has evaluated X-8's E1 arc values on a literal (or proved-quotient) network.
   A successor F seat should, at one fresh row, check E1 row sums per non-sector source class and the per-target load `ρ_q·w(A)`
   against its capacity through a proved quotient. The class-level in-balance and `ρ_q < 1` ∀q (now backed at nine rows) are
   necessary conditions for this, not sufficient.
3. **A literal structured-`X` Hall sweep beyond the two extremes.** For example, `X` = sector sources with a fixed multiset of
   `(1,γ)` chokes, on a proved orbit quotient. My `X = sec` and `X = I_{p*+1}` sums and the composition budget are the whole-family
   ends only.
4. **Second reads** of advances (i), (ii)(a–d), and of the (WID) capacity half.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-F2-U/`:
- `replay/` holds the copy-out of F2's four artifacts (digests as in the return) and `orig_out.json` (F2's original output,
  `240ca851…659a`). The replay regenerated `f2_composed_flow_out.json` byte-identically, and `replay_stdout.txt` is
  `26c078fc…ab0`.
- `own/crit_lib.py` `2e16c2f0e4af63ec123df718d2e61fdadb7d70e5f60d6305f5d3f6ef1fb0dd91` contains the generic forest DP, the class
  decomposition of `w_F`, `r_q`, the Lean-text table parser and the template.
- `own/small_literal.py` `62f7dccb0fbafedd35abc7b219904e7cdfa60aa5123f19374cd84bb89fa07f7a` runs V1–V4 (the literal weight, WID,
  sector-bridge and N(sec) checks). Its output is `own/small_literal_out.json`
  `318e23f5282ae898f10fd9bb1a4646f341fb4340a189f3b0d52dd14ebbaaf418`.
- `own/rows.py` `e48141d4fbf4d57cb61c7cfcbaf1ad07892d33a4880c51754a924047cccd439e` is the nine-row battery plus rows 200/302/500/1001.
  Its output is `own/rows_out.json` `70bbb79a9b808ff2531f4bd53af66eb53862a04179453b5c3483d1d1a37afa13` (payload digest
  `ba6ed979ea5d494f374a120ebb9544e47ecc10fc9484ba8ec76526f9b2c75643`), and the log is `own/rows_stdout.txt`.
- Replay: `cd own && python3 -B small_literal.py && python3 -B rows.py` (standard library only; roughly 2 min and 15 min).
