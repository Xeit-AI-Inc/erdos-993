# Critique

**Critic:** `C-T3-F`, Cycle 2, r31 (Erdős #993: a parameter-uniform switch-using Hall certificate on CB(8,m) at the top
sector-deficient rank). Orientation F (falsify), assigned to seat `T3`, route `C2-T-03 MARK-CLONE-CRITERION-FLOW-EXPLICIT-AT-TOP-RANK`
(orientation T).
**Run root:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS
file. Loaded: the constitution and the startup protocol. I followed neither file's task-type map into memory, logs, skills or
conversations, because the dispatch restricts the boot to those two files. The controller owns conversation logging for this run.

**Read-boundary disclosures.**
1. The harness put the project `CLAUDE.md`, the user memory index (`MEMORY.md`) and the user's email into my context before my
   first tool call. I did not open them with a tool and did not use them.
2. One `ls -la` of my granted replay source `scratchpad/c2-T3/`. Its `..` line shows only the parent directory's own entry and
   no sibling names. Every other listing was inside `sources/` or my own scratch. I ran no `find`, `rg`, `ls -R` or glob `cat`
   above the grant. I used `grep` only on single files inside `sources/` (C1-LA2/C1-LA3 `Main.lean`, the attack-brief headings)
   and on my own copies.
3. For the Lean rebuild I listed `/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/.lake/packages/` and read
   that shared project's `lake-manifest.json` and `lean-toolchain`. I did this to confirm that the pins match C1-LA2's manifest.
   The pinned Mathlib root is an allowed external root per `PATH-CHECK-T3.json`. I bound it by manual symlink, ran `cd` into my
   scratch project before any `lake`/`lean` call, and never ran `lake update` or `lake clean`.
4. I read frozen `sources/` members only: `sources/authority/CLAIM-IDENTITY.json` (the homogeneous criterion key, its CD-2 note,
   the condition-(i) threshold key, and the heterogeneous key's statement only to check its alias relation), plus the C1-LA2 and
   C1-LA3 `Main.lean` and the C1-LA3 kernel receipt. I read no other return, critique or adjudication, no other experiment root,
   and nothing from the network. I installed nothing. No background job was started, so nothing needed killing. All runs were
   foreground.

## Identity and seal audit

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c2-stage4/DISPATCH-C-T3-F.md` (file SHA-256) | `2be55a28a5fbdbbd732a56d9f216820c7888d6e1cf4696140c7b17b0d0920a2f` | MATCH |
| Capsule `control/c2-critic-capsules/T3-PACKET-MANIFEST.json` inner seal | `cf5decbd68d1ebcb977e9608c3ea97cd4e86c8b6e320240c3b311dcc46bedc9b` | MATCH |
| Capsule members (14 files, bytes and SHA-256) | all 14 | MATCH, 0 mismatches |
| Stage 4 dispatch manifest inner seal | `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb` | MATCH |
| Stage 3 packet manifest inner seal | `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5` | MATCH |
| Stage 2 packet manifest inner seal | `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4` | MATCH (the protocol's value) |
| Return `cycles/cycle-2/stage3/returns/T3/RETURN.md` | `3d042554…51c8d` (41,364 B) | MATCH (capsule) |
| Return artifacts `t3_twobinom.py` / `.out.json` / `t3_alias.py` / `.out.json` | `845e1f4c…` / `62ba09ed…` / `f753e438…` / `9badd2f5…` | all MATCH the return's inventory |
| C1-LA2 `Main.lean` (the return's cited digest) | `a906ec17…3f5f3f` | MATCH |
| C1-LA3 `Main.lean` (the return's cited digest) | `c0605e12…10f3011` | MATCH; receipt `verdict.code = verified` |

Every seal is canonical JSON minus `seal_sha256`, with keys sorted, separators `(",", ":")` and no trailing newline.

**Claim identity.** The return registers no key and proposes none. It cites the HOMOGENEOUS criterion key
`E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` throughout and does not use the heterogeneous key's
working label to cite anything, which complies with ruling 11. It uses the working label once, only to say that it avoids it.
My alias replay (`t3_alias.py`, copy-out-first) reproduced 0/0/0 hits byte-identically. This critique proposes no key either:
see the fence check for where its advances belong.

## Independent re-derivation

Every result below comes from my own instrument, which I built from the contracts and the key's text. The return's scripts were
replayed only as a cross-check.

**R1. Weight and target classes, from the definitions.** I read `activeWeight` and `tagWitnesses` (C1-LA2 entries 15–16):
`W_v = N(s_v) ∖ {v}`. On CB(8,m), `W_v = {r}` and `W_{c_ij} = {u_i}`. Take `r ∉ B`. Then `v` is inactive, `c_ij` is active iff
`u_i ∈ B` (and `b_ij ∉ B` is forced by adjacency), and `w_F(B)` counts the present private leaves at chokes in `B` whenever
`C ⊆ F`. Take `r ∈ B, v ∉ B`. Then every choke is absent and `w_F(B) = 0`. This matches the return's §1.

Generating-function check: the r-free sets with choke set `Q` (`|Q| = q`), weighted by `w_F`, have series
`y^q · 8q·y(1+y)^{8q−1} · (1+2y)^{8(m−q)+1}`. So the total supply of class `q` at rank `p+1` over total capacity at rank `p` is
exactly `r_q(p−q)/r_q(p−q−1) = ρ_q`, with `a_q = 8q − 1` and `b_q = 8(m−q) + 1` as the contract states.

**R2. The flow, with explicit arc values (the allocation's first deliverable, missing from the return).** I derived this from
the key's proof of record: marks, clones, and the type path on `P_q = K(1)^{a_q} × K(2)^{b_q}`. Fix `q ≥ 1` and `j = p − q`.
Write `S_α = N_q(α, j)` and `T_α = N_q(α, j−1)`, with cumulative sums `Sc_α = Σ_{α'≤α} S_{α'}` and `Tc_α` likewise. The
type-symmetric transport has forced type totals:

- `g_α = ρ_q·Tc_{α−1} − Sc_{α−1}` (Boolean deletions, type `α → α−1`);
- `h_α = Sc_α − ρ_q·Tc_{α−1}` (ternary deletions, type `α → α`).

So `g_α + h_α = S_α`, and every lower type balances: `h_α + g_{α+1} = ρ_q·T_α`.

Summing over marks gives the per-arc value. Assume `C ⊆ F`. Take a source `B` with `r ∉ B`, `q = q(B) ≥ 1` and `w = w_F(B) ≥ 1`,
and put `α := w − 1` and `β := p − q − w + 1`. The value depends only on the source's state `(q, w)`:

- `f(B, B∖{c}) = g_α / S_α` for each present private leaf `c` at a choke of `B`;
- `f(B, B∖{y}) = w·h_α / (β·S_α)` for each other present `y`, that is, each `b`/`c` at a closed choke and `s` or `v`. If `β = 0`
  then `h_α = 0` and no such arc exists;
- `f = 0` on every other pair, including choke deletions and every source containing `r`.

Outflow is `w(g_α + h_α)/S_α = w`. On the in-side, biregular double counting gives `S_{α+1}(α+1) = T_α(a_q − α)` for Boolean
covers, and similarly for ternary covers. So each target clone receives `(h_α + g_{α+1})/T_α = ρ_q`. A target `A` with `r ∉ A` and
`q(A) ≥ 1` therefore receives `ρ_q·w_F(A)`, and every other target receives 0. Nonnegativity is `g_{α+1} ≥ 0 ⇔ (ii-1)` at `α`,
together with `h_α ≥ 0 ⇔ (ii-2)` at `α`. Capacity (`ρ_q ≤ 1`) is condition (i) and nothing else.

**R3. Literal check of R2 (bounded_computation).** Scripts: `crit_t3f.py` (clone-by-clone construction) and `crit_t3f_arcs.py`
(the closed-form arc values above, applied directly).

- Instances: CB(2,2), CB(3,2), CB(2,3), CB(8,1), CB(4,2) and CB(3,3), with `n` up to 24. Each tree passed BFS connectivity and
  the `|E| = n − 1` check. I enumerated all independent sets.
- Coverage: 47 `(d, m, p)` rows, `p ≥ m + 1`.
- Fidelity first. At every row the selector `F_p` is derived by the strict literal test `i_{p+1}(T−v) − i_p(T−v) < 0`. Then
  **supply − capacity = S(T,p)** holds at 47/47 rows. `S` is computed separately from the aggregate's definition of record,
  `Σ_{v∈F}[Δ_{p−1}(T−H_v) − Δ_{p−1}(T−R_v)]`.
- Flow checks, with `F =` the derived `F_p` wherever `C ⊆ F_p` (28 rows) and separately with `F = leafSet`. Across 74,802
  sources and 84,223 r-free, q ≥ 1 targets:
  - 0 negative arcs;
  - 0 out-failures;
  - 0 failures of in `= ρ_q·w_F`;
  - 0 nonzero loads on other targets;
  - 0 failures on the 16,475 (leafSet) / 13,158 (derived F) `u_i`-switch images. Each carries E1 load exactly `ρ_1·γ`, weight
    `γ`, and exactly `d − γ` sector preimages.
- Over-capacity occurs only at the rows where some `ρ_q > 1`: 0 of 21 criterion rows, and every non-criterion row.

**R4. Class rows (the clone quotient; bounded_computation).** Script: `crit_t3f.py Q`, exact, with `d = 8` and
`p* = (16m+4)/3`. Rows: `m = 95` (contract fixed point), 107, 110 and 113 (control), and 116 and 119 (fresh, ruling 9).

- At every `q ∈ [1, m]`:
  - condition (i) holds strictly;
  - every `g_α, h_α ≥ 0`, with 0 negative totals over every `α ∈ [0, 8q−1]`;
  - empty types carry 0;
  - `g_0 = g_{a+1} = 0`, and every lower type balances;
  - `ρ_q` is strictly decreasing in `q`, so `ρ_1 = max`, and all `ρ_q < 1`;
  - the gap identity `6(p*−q−1) − (3a_q + 4b_q) = 2q + 1` holds.
- Fixed points:
  - `ρ_1(95) = 1354839571516225/1361543988640524` (contract §5 value; MATCH).
  - `ρ_1(107) = 5150844596024699/5173467627355748`, and `(1−ρ_1)/(96/766193) = 34.9009` (the contract's ≈ 34.90; MATCH).
  - `ρ_1(110) = 2027991913051965/2036655530990516` (the return's value; MATCH).
- Fresh rows:
  - `ρ_1(116) = 58633895019037705/58871393306616916`;
  - `ρ_1(119) = 3255975423927033/3268830598665580`;
  - `ρ_1(113) = 27820794945950193/27936482886870172`.

**R5. Replay.** I copied `t3_twobinom.py` out to my scratch and reran it. Its output is byte-identical (`62ba09ed…`). The alias
script's output is also byte-identical.

## Attacks and findings

**F1 (major, deliverable gap).** The allocation's load-bearing obligation was "the arc values (as functions of the source's
choke states)" and "test the explicit flow at `m = 110` exactly on the literal network (loads per target class, both sides)". The
return gives neither.

- Its §1 restates the key's conclusion (out `= w_F`, in `= ρ_q w_F`, 0 elsewhere) at `(8, m, p*)`. It gives no arc value.
- Its §3 Part B at `m = 110` checks conditions (i) and (ii) and `ρ_1`. It builds no flow and checks no load.
- Its Part C is a max-flow at CB(8,1)/7 over all sources, so it is not the criterion flow at all.

The return's own title word "EXPLICIT" is therefore unbacked. R2 supplies the arc values, and R3/R4 test them (critic-derived,
see Verdict).

**F2 (major, Lean statement under-strength).** In the skeleton, `cb8_markCloneCriterion_flow_topRank` quantifies
`f : … → ℚ` with no nonnegativity conjunct. It constrains only `0 < f X A → (arc)`, the row sums, and the column sums.

- The key's conclusion is a **nonnegative** rational function.
- Both downstream uses need `0 ≤ f`: the Hall summation (`Σ_X w ≤ Σ_{N(X)} w`) and the rational ⇒ integral companion
  `exists_saturatingFlow_of_weightedHall`.
- As written, the hypothesis admits signed witnesses. Negative entries may sit on non-arcs of the constrained rows. So U2 cannot
  derive terminal conjunct 4 from it.

Answer to the attack brief: the hypothesis is well-typed and does NOT encode conjunct 4. It is too weak to feed it.

Rebuild (mine): I copied the verbatim skeleton (RETURN lines 334–411) into a copy of the C1-LA2 project, with `import
LeanProof.Main`.

- It elaborates under Lean v4.32.2 and Mathlib `905b9581…` with exactly one `declaration uses 'sorry'` warning, at the main
  theorem.
- The corollary's proof term (`obtain … ; rwa [hAq] at hA1`) closes.
- `#print axioms` gives `[propext, sorryAx, Classical.choice, Quot.sound]` for both declarations.

Repair (mine): I added `(∀ X A, 0 ≤ f X A) ∧` as the first conjunct and adjusted the corollary's `obtain`. The result also
elaborates, again with one `sorry`. Numerator and denominator of `cb8_rho` are the exact coefficient expressions of C1-LA3's
`cb8_E1_conditionI_topRank` (read on its face). So `cb8_rho m q < 1` follows from the award by one positivity-and-division step.
That is useful to U2.

**F3 (the step the return left open; its negative remark is wrong).** The return says the crossing-sum pairing "reproduces only
(ii-1)-type bounds … never the reverse-direction (ii-2)". That is false: aligning by the ternary count `β` gives (ii-2) in two
lines. The full proof is under Verdict (A1). The brief asked whether CD-2 really covers (ii-2) at `p*` on this class. It does.
CD-2's text quantifies over all integers `a, b ≥ 0`, every integer `j` and every `α ∈ [0, a]`. At `a_q = 8q−1 ≥ 7`,
`b_q = 8(m−q)+1 ≥ 1` and `j = p*−q` the substitution is immediate, and it needs no class hypothesis.

**F4 (correct).** The corollary "load `ρ_1·γ` on `u_i`-switch images" is exact, and `γ` is correctly identified.

- `γ` is the number of private leaves present at choke `i` in the image. This equals the sector source's `γ` at that choke,
  because the switch removes `r` and the single `b_ij` and keeps every `c_ij`.
- `w_F(A) = γ` needs `C ⊆ F`, which is `hfav`.
- The image has `q(A) = 1`, so it is loaded at `ρ_1·γ` exactly.
- It has `8 − γ` sector preimages.

All of this is confirmed literally (R3).

**F5 (minor arithmetic slip).** §2.1 item 5 says `(16m+4)/3 − q − 1 ≥ 0` "needs `q ≤ (13m+1)/3`". The correct bound is
`q ≤ (16m+1)/3`. It is harmless, because `q ≤ m` implies both.

**F6 (fidelity of Part C).** The return's CB(8,1)/7 instrument ASSUMES `F = leafSet` ("assumed … not asserted at m = 1") and
asserts no (WID). This violates the fidelity-first rule. I derived `F_7(CB(8,1))` literally: it is all 9 leaves, and (WID) holds
(2184 − 2520 = −336 = S). So the reported number 2184 survives on my evidence, not the return's. It remains irrelevant to the
explicit criterion flow, and it is outside the class.

**F7 (gate line).** `HALL_formal: advanced` is unbacked. The single `sorry` is the entire transport. The statement omits
nonnegativity (F2). Nothing was compiled by the seat. I downgrade it to `not_advanced`, since a statement repair is not formal
progress.

**Endpoint and residue attacks.**
- At `m = 107`: `p* = 572` and `K = 571`, and every check in R4 passes.
- The class forces `p* ≥ m + 1`, so `j = p* − q ≥ 1` for every `q ≤ m`. Therefore `r_q(j−1) ≥ 1` and every `ρ_q` is defined.
- No ℕ-subtraction enters R2. I work in ℚ/ℤ, and `a_q ≥ 7` and `b_q ≥ 1`.
- No asymptotic step is used anywhere.
- Darroch and Newton are not used. The only inputs are log-concavity of `k ↦ C(a,k)` and of `t ↦ C(b,t)2^t`, by explicit
  decreasing ratios.

**Cut search.** None. E1 needs no cut search, because R2 gives a nonnegative exact-load flow at every `(d, m, p)` with
`p ≥ m + 1`, and condition (i) is exactly its capacity condition. The switch-image residual `(ρ_1 + θ)γ ≤ γ` is the sector
certificate's obligation (U2/C1-LA1). This route does not own it.

## Mechanism-equivalence and fence check

- **One rank, class only.** The return claims nothing off `p*`, off `m ≡ 2 (mod 3)`, below 107 or for `d ≠ 8`. My literal rows
  (`d ≤ 8`, `m ≤ 3`) are corroboration of the key's general construction, never class claims.
- **No status transfer.** Stated correctly: (HALL), the primary aggregate, TREE, FOREST, TRANSFER and #993 stay OPEN, and
  `E993-TREE-REAL-ROOTED` stays REFUTED and unused.
- **No refuted mechanism.** R2 is the key's registered type-path transport. It is not per-leaf down-map injectivity, not the
  R19 support-preserving unit transport, and not the R23 literal delete-only Hall. The key's distinction rows separate these.
- **Census.** The return uses no census value as a premise, and neither does this critique.
- **Naming and mechanism.** The type totals `g_α, h_α` of R2 already appear verbatim in the proof of record of
  `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`, whose `d_i ≡ d` case is the
  homogeneous key. My per-arc `(q, w)` closed form and the written-out (ii-2) proof are therefore **not new claims**. At most
  they are a scope note on the homogeneous key, which is where CD-2 already lives.
- **Mechanism-equivalence.** The return's §1 statement is mathematically identical to the homogeneous key's conclusion at
  `(8, m, p*)` with `F ⊇ C`. Its only additions are the specialization and the switch-image corollary.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| "Condition (i) … formally verified (`cb8_E1_conditionI_topRank`)" | C1-LA3 statement read on its face (strict, every `q ∈ [1, m]`, `m ≥ 107`, `m % 3 = 2`); receipt verified | BACKED (citation at the award's scope) |
| "0 failures … 75,645 `(a,b,j)` triples"; recurrence/log-concavity grid | replayed byte-identically | BACKED (bounded_computation) |
| `ρ_1(110)`, `ρ_1(107)` "MATCH" | independently recomputed (R4) | BACKED |
| "the explicit criterion-flow statement" / "EXPLICIT" | no arc values given | STRUCK as to arc values; loads-only statement retained (F1) |
| "Test … at `m = 110`" (allocation) / Part B | no flow or load tested | STRUCK as a flow test; retained as a condition (i)/(ii) check |
| Part C "independently reproducing SR-3's … 2184" | F assumed, no (WID) | STRUCK as the return's evidence; the value is confirmed by my derived-F rerun (F6) |
| "compiled scratch, no grade (not built …)" | contradictory; the seat built nothing | STRUCK "compiled" as the seat's claim; my rebuild shows it elaborates with 1 `sorry` |
| "`HALL_formal: advanced`" | F2, F7 | STRUCK → `not_advanced` |
| "(ii-2) … not found from the crossing-sum" | false (A1) | STRUCK |
| Condition (ii) `proved_informal` via CD-2 | CD-2 text read; (ii-1) on the return's face checked line by line (correct, zero-case handling adequate); (ii-2) now on this critique's face | BACKED |
| Route verdict `proved_conditional` (favorability the only outstanding condition) | The statement's grade is the key's `proved_informal`, with favorability as a named hypothesis | BACKED as a grade on the loads-only statement |

`## Remaining obligation` in the return: items 1, 3 and 4 are exact. Item 2 is now discharged informally (A1). Item 1 must add
that the formal statement needs `0 ≤ f` (F2).

## Verdict

verdict: retained_narrowed

headline_resolved: no

ELIG_formal: not_advanced

HALL_formal: not_advanced

FAV_darroch_free: not_advanced

cut_candidate: none

**What is retained.** The return's statement is retained at `proved_informal`, conditional on the favorability hypothesis
`F_{p*}(T) = leafSet(T)` (which enters at its key's grade, modulo Darroch/Newton). It asserts that on CB(8,m), `m ≥ 107`,
`m ≡ 2 (mod 3)`, at `p*` with `C ⊆ F`, there is a nonnegative rational deletion-arc flow with these properties:

- every non-sector source is saturated at `w_F`;
- every r-free target with `q ≥ 1` chokes is loaded at exactly `ρ_q·w_F ≤ w_F`;
- every other target is loaded at 0;
- in particular, `u_i`-switch images are loaded at `ρ_1·γ`.

The return's from-the-face proof of (ii-1) is also retained.

**What is narrowed.**
- "Explicit" means the loads only. Arc values come from this critique.
- The Lean skeleton must add `0 ≤ f` before U2 takes it.
- `HALL_formal` is not advanced.

**Critic-derived advances (C-T3-F; STATED at Stage 4; each needs an isolated second read before any registration).**

- **A1. (ii-2), elementary, no Darroch/Newton.** Put `T'_x := T_{x−1} = C(a, x−1)·f(j−x)`, where `f(t) = C(b,t)2^t`. For
  integers `x < y`, claim `S_x·T'_y ≥ S_y·T'_x`.
  - If `f(j−x)f(j−y) = 0`, both sides are 0.
  - Otherwise cancel `f(j−x)f(j−y)`. The claim becomes `C(a,x)C(a,y−1) ≥ C(a,x−1)C(a,y)`: the outer pair `x−1 < y` against
    the inner pair `x ≤ y−1`, which have the same index sum. This holds because `k ↦ C(a,k)` has contiguous support `[0, a]`
    and decreasing ratio `(a−k+1)/k`. If the outer product is positive, then `0 ≤ x−1` and `y ≤ a`, so both inner indices lie in
    range.
  - Sum over `x ∈ [0, α]` and `y ∈ [α+1, a+1]`. Use `S_{a+1} = 0`, `T'_0 = 0`, `Σ_y T'_y = r(j−1)` and
    `Σ_{x≤α} T'_x = Tc_{α−1}`. The sum is `Sc_α(r(j−1) − Tc_{α−1}) − (r(j) − Sc_α)Tc_{α−1} = Sc_α·r(j−1) − r(j)·Tc_{α−1} ≥ 0`,
    which is (ii-2).
  - This is the "ternary count β" method that CD-2 names, carried out. Bounded corroboration: 694,925 pairs, `a, b ≤ 18`, every
    `j ∈ [−2, a+b+2]`, 0 failures; (ii-1) and (ii-2) have 0 failures on the same grid.
- **A2.** The per-arc closed form of R2 in the source state `(q, w)`, verified literally on 47 rows (R3) and as nonnegative at
  every `(q, α)` on the six class rows (R4). This is the allocation's missing arc-value deliverable.
- **A3.** The elaborated Lean statement repair (F2): `SkeletonRepaired.lean`, one `sorry`, no grade.

## Remaining obligation

1. **Formalize the transport (the one `sorry`).** Write it over `cbGraph m` with the nonnegativity conjunct, and state the arc
   values of A2 as a `def` in `(cbOpenChokeCount, w)`. Then prove four things:
   - out `= activeWeight`, by the identity `g_α + h_α = S_α`;
   - in `= cb8_rho·activeWeight`, by biregular double counting on the clone product `K(1)^{a_q} × K(2)^{b_q}`, which is the
     non-trivial formal node;
   - nonnegativity, from (ii-1) and (ii-2) in `ℤ`;
   - zero load off the r-free, `q ≥ 1` class.

   Capacity is `cb8_rho < 1`, which comes from C1-LA3's `cb8_E1_conditionI_topRank`.
2. **Formalize (ii-1) and (ii-2).** Both are now elementary on the faces of the return and this critique. The shared lemma is
   the outer-versus-inner product inequality for a log-concave sequence with contiguous support.
3. **Second read.** A1 and A2 need an isolated second read before any registration. They are candidates for a scope note on the
   homogeneous key, not for a new `E993-R31-` key.
4. **Favorability.** `F_{p*}(T_m) = leafSet(T_m)` remains the only Darroch/Newton dependency of this node. T1 and T2 own it.
5. **The sector certificate is out of scope here.** Its Residual step `(ρ_1 + θ)γ ≤ γ` belongs to U2 and C1-LA1. This route
   supplies only the exact `ρ_1·γ`.

## Artifact inventory

All paths below are under `scratchpad/c2-crit-T3-F/` (absolute:
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-T3-F/`). Python 3
standard library only (`json`, `sys`, `fractions`, `math.comb`), exact arithmetic, all foreground. Lean: v4.32.2, Mathlib
`905b95818eb32af7874a58b427f50c1711a5e96c`, shared packages by manual symlink.

| File | SHA-256 | Role |
|---|---|---|
| `crit_t3f.py` (14,361 B) | `7d92e59536c813c322cd120a3c5c811b92d48e33e5891ad75aebfa19c0239ae8` | Parts L (literal, derived F, WID, clone flow, switch images), Q (class rows), P (A1 grid) |
| `crit_t3f.out.Q.json` | `b1d2978bff2450423468e877482141cb31c03f9c0eaba1d1879044c46aa83a46` | R4 |
| `crit_t3f.out.L.json` | `ed20f2f169721dd8ca86845b110353490ab37f6925d867844975856825396a2e` | R3 (clone construction) |
| `L.stdout.txt` | `e1d4e6ec8537cc0b70ad82373311333d98bc71fef955a0efc4b67563882594f7` | stdout of Part L |
| `crit_t3f.out.P.json` | `82d91ad266d10436f1723792b455f20a1545f5405d559ffe514e8f7595ac2371` | A1 grid |
| `crit_t3f_arcs.py` (4,131 B) | `ceffdacb2daa490719a73eb741a4434cfdc66a3683990f770547af42694f8902` | A2 closed-form arc values, literal |
| `crit_t3f_arcs.out.json` | `d2d25eb6e3de76a63648e7c9f25f464945bcdf9e39241060868def542438d632` | R3 (closed form) |
| `lean/LeanProject/LeanProof/Main.lean` | `a906ec179d52c2548ca7026d8c9de532577100308444af2e722db3fd963b5f3f` | copied C1-LA2 layer (unchanged) |
| `lean/LeanProject/LeanProof/SkeletonVerbatim.lean` | `4682c0047682bb8d901ade940ab7a0c042398af02172b83bc9bedabebdd4f122` | RETURN lines 334–411, diff-identical, plus `#print axioms` |
| `lean/skeleton_verbatim.log` | `840dda357f65e6fd505ff9c9d682a10dfc20b9dd74d240271babf055de389840` | 1 `sorry` warning; axioms incl. `sorryAx` |
| `lean/LeanProject/LeanProof/SkeletonRepaired.lean` | `25093dd6a0d58aa54af6ca1c5228d4ec219df8afc4a8782c0f6920a2aa412534` | A3 (nonnegativity added) |
| `lean/skeleton_repaired.log` | `16a75f0e73f68d01d2860d01a3365af53583dc5ae18edefcde13f691a273ea88` | 1 `sorry` warning |
| `replay/t3_twobinom.py`, `replay/t3_twobinom.out.json` | `845e1f4c…`, `62ba09ed…` | replay, byte-identical output |
| `replay/t3_alias.py`, `replay/t3_alias.out.json` | `f753e438…`, `9badd2f5…` | replay, byte-identical output |

Replay: `cd` into the scratch directory, then run `python3 -B crit_t3f.py Q`, `python3 -B crit_t3f.py L`,
`python3 -B crit_t3f.py P` and `python3 -B crit_t3f_arcs.py`. For Lean, `cd lean/LeanProject`, then run `lake build LeanProof.Main`
and `lake env lean LeanProof/SkeletonVerbatim.lean` (likewise for `SkeletonRepaired.lean`). No background job was started, and
none is running.
