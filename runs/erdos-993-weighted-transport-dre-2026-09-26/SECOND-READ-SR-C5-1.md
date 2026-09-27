# Second Read

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 5, isolated second read **SR-C5-1**: whole-row (HALL) at
`G(8^82, 7^2)` (rank 448 with switch arcs load-bearing; ranks 449–503 deletion-only). This read is decisive for gate ruling 39,
letter (b′), first half. Reader: Claude Opus 5.5, high, isolated. Date 2026-09-27.

**Boot.** I am operating within VerityOS. Boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, both read in full. I did not follow the startup protocol's task map
into any other VerityOS subsystem. My writes are restricted to this file and my scratch, so I did not create a conversation log.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Decisive line (ruling 39, letter (b′), first half):** CONFIRMED. Whole-row (HALL) at `G(8^82, 7^2)` holds at `computer_assisted`: at
448 with load-bearing switch arcs, and at 449–503 with deletion arcs alone. That includes E1-R's load clause, which I checked against
the frozen registry snapshot and found stated verbatim on the registered face.

## Identity and seal audit

| Object | Recomputed | Result |
|---|---|---|
| Protocol `control/C5-SECOND-READ-PROTOCOL.md` | read first, in full | binding |
| Brief `control/C5-SECOND-READ-BRIEF-SR-C5-1.md` | `shasum -a 256` = `eec1797a9aa5e81d84d289bf1341b9c3e7d7c36c54f70ea5799c558b432a823c` | **match** with the dispatch value; checked before I followed the brief |
| Capsule `control/c5-second-read/SR-C5-1-PACKET-MANIFEST.json` inner seal | SHA-256 of the canonical JSON without `seal_sha256` (`sort_keys`, `(",", ":")`, no trailing newline) = `824f3741f4bb4abecc2188b382aa9f8493766cf6d7ecf0ebcb60c623632b6352` | **match** with the stored field; stage `cycle-5-second-read-SR-C5-1`; 182 members |
| All 182 capsule members | SHA-256 of each | **182/182 match** |
| `sources/c5-stage7-sources/` against its `SOURCE-DIGESTS.json` (460 entries) | SHA-256 of each | **460/460 match**. Every capsule member under that directory was verified before I read it; see disclosure 1 |
| `C-T2-F/t2_cert.json` | `7a6f4c66eb7db2fc872b96a85b2a6adcaf02ae7591b194b11b97f7a11bc53849` | equals the brief's value. `C-T2-U/replay/cert_values.json` is the same bytes |
| `ADJ-T/t2_cert_values_adj.json` | `2c421fccf52dae12e39fe8cbc73820ab19ed1e57d202295f6ae556e503378996` | equals the brief's `2c421fcc…` |
| Registry snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c5-stage2.json` | 453 claims (434 master plus 19 run-local) | capsule member; frozen (ruling 43) |
| Master `sources/authority/CLAIM-IDENTITY.json` | 434 claims | capsule member |

Standing errata: R30-E-j and R30-E-l are irrelevant to this read. R30-E-m and R30-E-n are weighed. CF6-8 (R30-E-n) is the reason
item 1c exists, and I discharge it below.

**Read-boundary disclosures** (every deviation):
1. My check of the stage-7 source directory hashed every one of the 460 files that its `SOURCE-DIGESTS.json` lists. About 310 of
   them are not members of my capsule. Their bytes were hashed only; I never displayed, parsed or used their contents.
2. I ran one names-only `ls` of `control/controller-facts/`, which listed non-capsule file names (earlier-cycle replays and a
   `__pycache__` directory). I opened none of them. I opened only the capsule members `CF-REPLAY-c5{a,b,c,d}.json`, and only for their
   top-level keys, which showed that none concerns `G(8^82, 7^2)`.
3. The host injected the project `CLAUDE.md` and the user's auto-memory index into my context. I did not act on either beyond this
   acknowledgment.
4. T2's `RETURN.md` (a capsule member) was shown to me through a harness-saved copy of the same content. It was not a separate file.
5. No `find`, `grep` or `rg` ran above the capsule members. The only `find` was inside my own scratch, to check for bytecode (none).
   There was no network access, no install, no `lake`/`lean` and no background job. Every script ran as `python3 -B`, standard
   library only, with exact `int`/`Fraction`.
6. I read the frozen reference instruments' OUTPUTS only after my own numbers existed. I read the two per-state tables as DATA, as
   the brief requires, before running my own verifier over them. I never ran or imported a frozen script.

## Statements read

- **SR-C5-1a** the tree data and the selector (`n`, `α`, `x` through `α`, window, `F_p` at 56 ranks).
- **SR-C5-1b** the zero-slack certificate at 448, exactly, from the shipped per-state table as data.
- **SR-C5-1c** E1-R's registered load clause against the registry snapshot, and the E1-R criterion at 448 (248 types).
- **SR-C5-1d** the composition to (HALL) at 448: the per-class loads, the `r`-switch preimages, the R8-dead family and integrality.
- **SR-C5-1e** ranks 449–503: the unique deficient rank, the claw-product inequality at 55 ranks, and the E1-R criterion at each rank.
- **SR-C5-1f** (WID) fidelity, two-sided, at 56 ranks.
- **SR-C5-1g** the two key names: predicates, the lexical and mathematical alias check, the distinction rows and attribution.

Origins read: T2 `RETURN.md`; `C-T2-F` and `C-T2-U` `CRITIQUE.md`; the T adjudication (its T2 sections); the Stage 6 synthesis
(`## Exact established results`, `## Progress and stop-gate ruling`, `## Registrations`); the Stage 6 controller facts (CF-1, CF-3–CF-6,
CF-T1, CF-T2, CF-F1, CF-F3, CF-U3, CF-U4, CF6-1–CF6-4, CF6-6, CF6-8); the registry entries named below; `SEMANTIC-CONTRACT.md`;
`SOLUTION-CONTRACT.md`.

## Independent re-derivation

All instruments are mine, written from `SEMANTIC-CONTRACT.md` §1 and the registry faces, under `scratchpad/c5-sr-SR-C5-1/`. None
imports or copies a seat, critic or adjudicator script.

**1a. Tree, `x`, `α`, window, `F_p` (`sr_tree.py`, `sr_row.py`).**
- `build()` constructs the literal tree `r – s – v`, with 84 chokes `u_i ~ r` (82 with 8 legs, 2 with 7), legs `u_i – b_ij – c_ij`.
- Connectivity (BFS) and acyclicity (union–find over the edge list, independent of the BFS) are checked separately, and only then
  `|E| = n − 1`. All pass.
- `indep_poly` is a generic, forest-safe post-order DP with an arbitrary removal set; it knows nothing of chokes. As a cross-check it
  equals the closed form `(1+2y)·Q_8^82·Q_7^2 + y(1+y)(1+2y)^670`, which I derived independently.
- The sanity identities `i_1 = n` and `i_2 = C(n,2) − (n−1)` hold.
- Results: **`n = 1427`, `α = 755`, `x = 446`** (first `k` with `i_{k+1} − i_k < 0`, counts zero-extended beyond `α`; `Δ_445 ≥ 0`).
  The window is **`[448, 503]`, 56 ranks**, and `3·503 < 1511 ≤ 3·504` is asserted.
- **`F_p`, derived leaf by leaf, with no orbit shortcut.** I computed `I(T − z)` for **every one of the 671 leaves** and checked
  `Δ_p(T − z) < 0` at every `p ∈ [448, 503]`: **all 671 leaves are favorable at all 56 ranks.**
  - As a by-product, `I(T − z)` takes exactly three distinct values, on classes of sizes 1 (the arm leaf `v`), 656 (degree-8 private
    leaves) and 14 (degree-7 private leaves).
  - This is a numerical confirmation of the automorphism-orbit argument, which I therefore did not need.

**1f. (WID) two-sided (`sr_wid.py`).**
- Side W is my active-weight generating function, derived from the definition of `w_F` alone. With `F` = all leaves:
  - If `r ∈ B`: `s` and every `u_i` are absent. `v` is active iff `v ∈ B` (`W_v = {r}`), and every `c_ij` is inactive
    (`W_{c_ij} = {u_i}`). This gives `y²(1+2y)^670`.
  - If `r ∉ B`: the arm `{∅, s, v}` gives `(1+2y)`, and `v` is inactive. A present `u_i` activates exactly the `c`-legs at its choke.
    This gives `(1+2y)·Σ_i d_i y²(1+y)^{d_i−1} Π_{k≠i} Q_{d_k}`.
  - So `W(y) = y²(1+2y)^670 + (1+2y)[82·P_8·Q_8^81·Q_7² + 2·P_7·Q_8^82·Q_7]`, matching C-T2-F's form, which I read only afterwards.
- Side Q is `Σ_{v∈F} q_v(j)` with `q_v(j) = i_j(T − H_v) − i_j(T − R_v)`, computed by the generic DP for **every** leaf individually
  (1,342 DPs) with `H_v = {v, s_v}` and `R_v = N[s_v]`.
- Validation: on 8 small patterns (`[1]`, `[2]`, `[2,1]`, `[3,2]`, `[2,2,1]`, `[3,1,1]`, `[1,2,3]`, `[3,3]`), literal brute-force
  enumeration of `Σ_{I_j} w_F` equals `[y^j]W` and equals `Σ_v q_v(j − 1)` at every layer.
- Result at `G(8^82,7^2)`:
  - `[y^{p+1}]W − [y^p]W = Σ_v[q_v(p) − q_v(p−1)]` at **all 56 ranks**. The stronger per-layer identity `[y^j]W = Σ_v q_v(j−1)` holds
    at every `j ≥ 1`.
  - **`S < 0` at all 56 ranks.**
  - At 448, supply and capacity have 322 digits each and `S` has 320. My `S(T,448)` occurs character-for-character in T2's
    `out_rowdata.txt` and in ADJ-T's `S448_adj.txt`.
- T2's own two-route check is struck (C-T2-F, C-T2-U, ADJ-T); I do not cite it.

**1c (criterion part), 1e. E1-R criterion census and claw-product ratio (`sr_e1r_cd1.py`).**
- Coefficients are computed by an explicit binomial sum (not polynomial products):
  `r_Q(k) = Σ_i C(a_Q, i)·C(b_Q, k−i)·2^{k−i}`, with `a_Q = D_Q − 1` and `b_Q = D − D_Q + 1` exactly as on the registered face.
- The census covers **248 types × 56 ranks**, where a type is `(a, b)` with `a` degree-8 chokes, `b` degree-7 chokes, `q = a + b ≥ 1`
  and `D_Q = 8a + 7b`.
- The ℕ guards are asserted: `a_Q ≥ 0`, `b_Q ≥ 1`, `p − q − 1 ≥ 0`, and the denominator `≥ 1`.
- Results:
  - **0 failures.**
  - Global maximum `ρ_Q = 5327002801984/5350924042653` at `(a,b) = (0,1)`, `p = 448`.
  - The per-rank maximum is attained at `(0,1)` at every rank and strictly decreases to `67808723936213/101432798531686 ≈ 0.668509`
    at 503.
- `ρ_(1,7)` and `ρ_(1,8)` at 448 equal the brief's fractions exactly:
  - `1 − ρ_(1,7) = 23921240669/5350924042653`;
  - `1 − ρ_(1,8) = 3305455510571/591947103906771`.
- The claw product `K(2)^670` has `e_k = 2^k·C(670,k)`:
  - at 448, `e_447/e_446 = 448/447 > 1`;
  - at every `p = 449…503`, `e_{p−2} ≥ e_{p−1}` (all 55 ranks; for example `223/224` at 449 and `169/251` at 503 for `e_k/e_{k−1}`);
  - the set of sector-deficient eligible ranks is exactly `{448}`;
  - `3p < 2·670 + 5` holds in the window only at `p = 448`.

**1b. The certificate, exactly, from the shipped tables as data (`sr_cert.py`).**
- **Both shipped files agree value for value.** Both have the same 141 per-state keys: `pb_d(β,γ)` with `β ≥ 1` (64), `pc_d(β,γ)` with
  `γ ≥ 1` (64), and `σ_d(γ)` with `1 ≤ γ ≤ d−1` (13), over `β+γ ≤ d`, `d ∈ {7, 8}`.
  - The key set is exactly this.
  - All 141 values are nonnegative, 135 of them nonzero.
  - C-T2-F's file adds 14 LP scalars (`a_d`, `a2_d`, `λ`, `λ2` as ± parts, and `θ_7`, `θ_8`). That makes the brief's "155". They
    equal T2's printed values exactly.
- **My evaluator, not the LP.**
  - It uses `Out_d(β,γ) = β·pb + γ·pc + [β=1]·σ_d(γ)` and `In_d(β,γ) = (d−β−γ)(pb_d(β+1,γ) + pc_d(β,γ+1))` for `β+γ < d`, else 0.
  - It runs a sequential exact DP over the **literal** choke list (82 of degree 8, then 2 of degree 7), with arrays indexed by the
    total number of occupied legs and back-pointers.
  - Results:
    - **min Σ Out over every 447-leg sector source = 1 exactly** (argmin `{(8;0,1)×31, (8;1,1)×1, (8;0,8)×50, (7;0,7)×2}`);
    - **max Σ In over every 446-leg in-sector target = 1 exactly** (argmax `{(8;0,0)×20, (8;0,7)×62, (7;0,6)×2}`);
    - so the certificate has zero slack.
- **Switch caps.**
  - `(d−γ)·σ_d(γ) ≤ θ*_d·γ` holds for every `d, γ`, and `σ_7 ≡ 0`.
  - At `d = 8` the cap is tight at `γ = 1…6`, and the maximum ratio is exactly `384/1832557`.
  - `θ*_7 = 0 ≤ 1 − ρ_(1,7)` and `θ*_8 = 384/1832557 ≤ 1 − ρ_(1,8)`; the ratio is 0.0375.
- **Affine path (secondary).** The per-state affine bounds hold, with `82a_8 + 2a_7 + 447λ = 1` and
  `82a2_8 + 2a2_7 + 446λ2 = 1` exactly.
- **R8.** I computed two readings of "every preimage switch-dead" as per-choke state restrictions:
  - (R8-pos) no preimage has a switch arc with a **positive-weight** image, i.e. every choke state in `{(0,0), (0,d)} ∪ {β ≥ 2}`.
    I derived this myself: `(1,γ)` and `(0,γ ≥ 1)` with an empty leg are excluded, `(0,0)` is allowed because its `b`-addition makes
    `(1,0)`, whose image weighs 0, and the full `(0,d)` is allowed.
  - (R8-any) no preimage has **any** switch arc: `{(0,d)} ∪ {β ≥ 2}`.
  - The maximum inflow is **exactly 1** under both readings.

**Literal laboratory at `G(8^82, 7^2)/448` (`sr_lab.py`, `sr_exits.py`; my choice: 165 instances, seed 5125001).**
- Setup: the literal tree; `w_F` computed from `W_v = N(s_v) ∖ {v}`; every deletion arc and every switch (`u ∉ B`, `|N(u) ∩ B| = 2`)
  enumerated; flow assigned per arc from the literal source's local state; target loads summed over literally enumerated preimages
  (every `z` with `A ∪ {z}` independent, and every `u ∈ A` with every pair of its neighbours).
- Sample:
  - 52 sector sources, including my DP argmin and uniform, low-`β` and arbitrary random states;
  - 53 in-sector targets, including my DP argmax and both R8 argmaxes;
  - 60 single-choke switch images at both degrees, with `γ = 0…d`, including `γ = 0` and `γ = d`.
- Results:
  - **0 mismatches** against `Out`, `In` and `(d−γ)σ_d(γ)`.
  - **0 positive-flow arcs onto weight-0 targets.**
  - Literal minimum outflow 1; literal maximum inflow 1.
  - Every switch image has literal weight `γ` and exactly `d − γ` sector preimages. The maximum load/weight is `384/1832557`.
  - The only switch vertices at sector sources are `s` and the `u_i`.
- Exit classes (literal): `B − r`, `B − v` and the `s`-switch weigh 0; a leg deletion weighs 1; a `u_i`-switch weighs 0–7.
  Non-sector sources with `r ∈ B` weigh 0.
- **At the DP argmax in-sector target the literal network has 448 deletion preimages and 3,486 `r`-switch preimages (3,296 of
  positive weight),** reproducing C-T2-F's count (`C(84,2)`, since every choke there has `β = 0`; the zero-weight ones are the
  `C(20,2) = 190` pairs of empty chokes).

**Comparison with the frozen instruments (after my numbers existed).**
- C-T2-F `out_certcheck.txt`/`out_e1r_census.txt`, C-T2-U `out_own_cert448.txt`/`out_own_e1r_census.txt` and ADJ-T `out_adj_t2_*.txt`
  all report the same min/max (1/1), `θ*`, `ρ_(1,7)`, `ρ_(1,8)`, census (0 failures; same maximum and argmax), R8 maximum 1,
  `n/α/x`/window, and `S(T,448)`.
- The argmin/argmax multisets differ only by ties.
- The four `CF-REPLAY-c5*` files are CB-family replays and none concerns this tree, so no controller third instrument bears on this row.

## Findings and repairs

1. **SR-C5-1c: E1-R's load clause is on the registered face, verbatim.** The snapshot entry
   `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (VERIFIED, `proved_informal`) states:
   "there is a nonnegative rational function f on the deletion arcs (D) from I_{p+1}(T) ∖ sec to I_p(T) such that Σ_A f(B, A) =
   w_F(B) for every B ∈ I_{p+1}(T) ∖ sec; Σ_B f(B, A) = ρ_{Q(A)}·w_F(A) <= w_F(A) for every target A with r ∉ A and Q(A) := A ∩
   {u_1..u_m} nonempty, where ρ_Q := r_Q(p − q)/r_Q(p − q − 1) …; and Σ_B f(B, A) = 0 for every other target."
   - The clause has no condition on `v`. The switch image `(B − {r, b_ij}) ∪ {u_i}` is `r`-free with `Q(A) = {u_i}`, `q = 1`,
     `D_Q = d_i`, so it is loaded at exactly `ρ_(1,d_i)·w_F(A)`. Proof step (2) of the face makes the arm `{∅, s, v}` a ternary
     coordinate of `P_Q`, which covers `v ∈ A`.
   - In-sector targets (`r ∈ A`) receive 0.
   - The face's hypotheses hold at this row:
     - `T` is the heterogeneous CB pattern with `m = 84` and `d_i ∈ {8, 7}` (`n = 3 + m + 2D = 1427`);
     - `C ⊆ F` (all leaves, derived);
     - the criterion holds for every nonempty `Q` (census above);
     - `p ≥ m + 1` (448 ≥ 85).
   - CF-T1's quotation is faithful to the face. CF6-8's open obligation is discharged.
2. **E1-R does not depend on CD-1** (a correction of record). T2's return ("conditional on CD-1") and C-T2-U finding 5 ("E1-R
   (`proved_informal`; conditional on CD-1)") are contradicted by the registered face, whose scope says "The statement does not depend
   on CD-1 … the normalized flow on K(1)^a × K(2)^b is built directly by the type-path transport" (SR-C4-6).
   - The 448 key therefore uses no claw-product input.
   - The claw-product key enters only the 449–503 key.
3. **Integrality (repair to SR-C5-1d and to the synthesis item 1).** "(HALL⇒FLOW) (C1-LA2, `formally_verified`)" is imprecise twice
   over.
   - (a) (HALL⇒FLOW) is `exists_saturatingFlow_of_weightedHall`, a kernel-checked **companion lemma** on the face of
     `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (the award's terminal theorem is `aggregate_nonpos_of_weightedHall`).
     By SOLUTION-CONTRACT §2/§4 (R29-N-12) a companion carries no certificate of its own.
   - (b) **"C1-LA2" is a registered alias of `E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN`** in the 434 master, so it must never appear
     in registry text for r30's award.
   - The composition's grade is unaffected (`computer_assisted`, the weakest input).
   - For the 449–503 key, "deletion-only" integrality comes from classical max-flow integrality on the deletion-only network. The
     Lean companion yields a (D) ∪ (S) flow, not a deletion-supported one, so it does not by itself give the deletion-only form.
4. **Working labels in registration text (repair to SR-C5-1g and to the synthesis `## Registrations` items 1–2).**
   - "CD-1" is a **registered alias of `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM`**
     (recorded on the claw-product key's own scope).
   - "E1-R" occurs in E1-R's own alias string.
   - The synthesis's "Inputs: E1-R, C1-LA2" and "plus CD-1" must therefore be written by key, as in my registration text.
5. **The certificate of record is the 141 per-state values**, not "155". The 14 LP scalars are the seat's affine generation path.
   My DP uses only the 141.
6. **The R8 family description (C-T2-F finding 4 and ADJ-T's `[R8]` line: "every choke in `{(0,0)} ∪ {β ≥ 2}`") omits the full
   all-private-leaf state `(0,d)`**, which never creates a switch.
   - The exact family is `{(0,0), (0,d)} ∪ {β ≥ 2}` under the positive-weight reading (ADJ-T's `[R8 full]`), or `{(0,d)} ∪ {β ≥ 2}`
     under the any-switch reading (C-T2-U's R7).
   - The maximum is exactly 1 in all three, so the conclusion stands. The registration text uses the exact description.
7. **Composition checked class by class (SR-C5-1d).** Every target class is bounded, and the in-sector `r`-switch arcs are harmless
   for the reason stated below.
   - Target loads at 448:
     - (i) `r, v ∈ A`: `≤ 1` from the sector flow and 0 from E1-R;
     - (ii) `r ∈ A`, `v ∉ A`: weight 0, load 0;
     - (iii) `r ∉ A`, `Q(A) = {u_i}`, `v ∈ A`: exactly the single-choke switch images, with `d − γ` sector preimages; the load is
       `≤ (ρ_(1,d_i) + θ*_(d_i))·w ≤ w`;
     - (iv) other `r`-free targets with `Q(A) ≠ ∅`: `ρ_Q·w ≤ w`;
     - (v) `r ∉ A`, `Q(A) = ∅`: weight 0; the sector's `B − r` lands here with flow 0.
   - Sources:
     - non-sector sources with `r ∈ B` weigh 0;
     - positive-weight non-sector sources are `r`-free and saturated by E1-R;
     - sector sources are saturated after rescaling to outflow exactly 1, which only lowers loads.
   - Summing the flow over any `X` gives (HALL-COND) for every `X ⊆ I_449`. The flow is positive only on literal (D) ∪ (S) arcs:
     leg deletions and `u_i`-switches with `|N(u_i) ∩ B| = |{r, b_ij}| = 2`.
   - **The 3,486 in-sector `r`-switch preimages are harmless.** E1-R's `f` is supported on deletion arcs, and a deletion from an
     `r`-free source never produces an `r`-containing target. The sector flow uses no `r`-switch. Unused arcs carry 0, and a saturating
     flow does not need every arc.
8. **The ℕ-subtractions and where each is guarded:**
   - `p − q − 1 ≥ 363`;
   - `a_Q = D_Q − 1 ≥ 6`, `b_Q ≥ 1`;
   - `d − β − γ` appears only when `β + γ < d`;
   - `d − γ ≥ 1` for `σ`;
   - the claw-product index `k = p − 1 ≥ 448 ≥ 1`;
   - (WID)'s `p − 1` with `p ≥ 448`.

   All are asserted in code or guarded by construction. No natural-number truncation enters.
9. **Key names (SR-C5-1g).** Both names are predicates of their statements.
   - The 448 name asserts (HALL) at rank 448 of the one tree `G(8^82, 7^2)`, with switch arcs load-bearing. The statement carries
     that deletion-only saturation fails, via `e_447/e_446 = 448/447`.
   - The 449–503 name asserts deletion-only (HALL) at those 55 ranks of the same tree, and the statement proves exactly that.
   - "CHOKE-TREE-8POW82-7POW2" names one tree, by its support-count pattern. The graph degree of a choke is `d_i + 1`, and the
     registration text says so.
   - Lexical screen (`sr_alias.py`, against the 453 snapshot, which contains the 434 master):
     - no exact key, no alias equality, and no alias-pattern hit on either name;
     - no token overlap of 85% or more;
     - top overlaps are the five-row switch-arcs key, 7/12 = 0.58, for the 448 name, and `E993-R23-LITERAL-DELETE-ONLY-HALL`,
       2/5, for the 449–503 name;
     - this agrees with the controller's prescreen.
   - Over the full registration text, two regex hits remain, and both are the cited keys named by key (each key name matches its own
     pattern): `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` and `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`.
     I reworded two sentences that tripped the (WID) and induced-matching patterns without naming those keys.
   - The generic words tree, forest and transfer appear only in the standard fence list.
   - The forbidden strings ("favorable-leaf aggregate", "4k", "deletion injection", and the working labels) are absent.
10. **Mathematical distinctness.** The 448 key is not an alias of the five-row switch-arcs key:
    - five homogeneous `CB(d,m)` trees against one heterogeneous tree that is not a `CB(d,m)`;
    - no shared `(T, p)`;
    - a different sector LP (two degree classes, one shared `λ` and one shared `λ2`, degree-specific constants and caps);
    - the heterogeneous mark-clone key indexed by `(q, D_Q)`.

    Neither 448 nor 449–503 revives `E993-R23-LITERAL-DELETE-ONLY-HALL`: that key is an unweighted, universal, r23 tagged top side.
    At 448 deletion-only provably fails; 449–503 is finite and one-tree. Distinction rows are below.
11. **Grade.** The grade is `computer_assisted` for both keys: finite exact certificates at 1 + 55 named instances, composed with
    `proved_informal` keys. It is not `proved_informal` and not parameter-uniform. The whole-row conjunction is a scope note on (HALL),
    not a key.
12. **Nothing falsified.** No statement in 1a–1g is false. No deficient cut exists at `(G(8^82,7^2), p)` for any `p ∈ [448, 503]`,
    because the certificates exclude every `X`.

## Registration text

The controller registers the blocks below verbatim. The ALIASES lines separate names with ` ; `.

```text
KEY: E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
STATUS: VERIFIED
GRADE: computer_assisted
STATEMENT: Let T = G(8^82, 7^2) be the ordinary tree with path r – s – v, 84 chokes u_1..u_84 adjacent to r, of which 82 carry 8 and 2 carry 7 supports b_ij adjacent to u_i, and one private leaf c_ij adjacent to each b_ij (n = 1427; the heterogeneous CB pattern with d_i = 8 for 82 chokes and d_i = 7 for 2 chokes, D = 670; a choke of degree d below means d_i = d supports, graph degree d + 1). Then α(T) = 755, x(T) = 446 (first strict descent, counts zero-extended through rank α) and the eligible window {p : x(T) + 2 ≤ p, 3p < 2α(T) + 1} is [448, 503]. At p = 448, with F = F_448(T) the whole leaf set (Δ_448(T − z) < 0 for each of the 671 leaves z, derived leaf by leaf), w_F the literal active-tag weight and the relation (D) ∪ (S): there is a nonnegative rational flow supported on literal (D) ∪ (S) arcs that sends exactly w_F(B) out of every B ∈ I_449(T) and loads every A ∈ I_448(T) at most w_F(A); hence (HALL-COND) holds for every X ⊆ I_449(T) and an integral saturating flow exists, that is (HALL) holds at (T, 448). Switch arcs are load-bearing: sec := {B ∈ I_449(T) : r, v ∈ B} has every member of weight 1 and total weight e_447 = 2^447·C(670, 447); its deletion neighbourhood of positive weight is the in-sector layer {A ∈ I_448(T) : r, v ∈ A} of total weight e_446 (B − r and B − v weigh 0); e_447/e_446 = 448/447 > 1, so no flow supported on deletion arcs alone saturates sec. Certificate: (i) on sec, a choke-local flow that depends on the local state (β, γ) of the choke carrying the arc (β present supports, γ present private leaves): pb_d(β, γ) on each deleted-support arc, pc_d(β, γ) on each deleted-private-leaf arc, and σ_d(γ) on the switch arc at u_i when β = 1, whose image (B − {r, b_ij}) ∪ {u_i} has weight γ; 141 per-state values, all nonnegative, σ_7 ≡ 0; by an exact min-plus and max-plus evaluation over the literal multiset of 82 degree-8 and 2 degree-7 chokes, every sector source (447 occupied legs) has outflow at least 1 (minimum exactly 1) and every in-sector target (446 occupied legs) has inflow at most 1 (maximum exactly 1), and every single-choke switch image at a degree-d choke with γ private leaves receives (d − γ)·σ_d(γ) ≤ θ*_d·γ with θ*_7 = 0 and θ*_8 = 384/1832557; (ii) on I_449(T) ∖ sec, the deletion-arc flow of E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, whose criterion r_Q(p − q) ≤ r_Q(p − q − 1) holds in exact integers at p = 448 for every choke-set type (a chokes of degree 8, b of degree 7, 0 ≤ a ≤ 82, 0 ≤ b ≤ 2, q = a + b ≥ 1; 248 types), with maximum ρ_Q = ρ_(1,7) = 5327002801984/5350924042653 and ρ_(1,8) = 588641648396200/591947103906771; by its registered load clause it loads every target A with r ∉ A and Q(A) = A ∩ {u_1..u_84} nonempty at exactly ρ_{Q(A)}·w_F(A) and every other target at 0. Loads per target class: in-sector (r, v ∈ A) at most 1·w_F(A) from (i) and 0 from (ii); single-choke switch images (r ∉ A, Q(A) = {u_i}, v ∈ A) at most (ρ_(1,d_i) + θ*_(d_i))·w_F(A) ≤ w_F(A), since θ*_7 = 0 ≤ 1 − ρ_(1,7) and 384/1832557 ≤ 1 − ρ_(1,8) = 3305455510571/591947103906771; every other target with r ∉ A and Q(A) nonempty at ρ_{Q(A)}·w_F(A) ≤ w_F(A); targets with r ∉ A and Q(A) empty, and targets with r ∈ A and v ∉ A, weigh 0 and receive 0. Every source outside sec with r ∈ B has v ∉ B and weight 0. Arcs the flow does not use carry 0; among them are the r-switch arcs into in-sector targets from r-free two-choke sources. Rescaling each sector source to outflow exactly 1 only lowers loads; summing the flow over X gives (HALL-COND) for every X, and max-flow integrality gives the integral flow.
SCOPE: One tree, one rank: (T, p) = (G(8^82, 7^2), 448); F = F_448(T) derived; weight w_F literal; relation (D) ∪ (S) literal; no quotient step. The certificate is a finite exact certificate, not a parameter-uniform theorem. The per-state table is data of record (141 values; SHA-256 of the C-T2-F serialization 7a6f4c66eb7db2fc872b96a85b2a6adcaf02ae7591b194b11b97f7a11bc53849, identical values in the T adjudicator's serialization 2c421fccf52dae12e39fe8cbc73820ab19ed1e57d202295f6ae556e503378996); the affine constants of the seat's LP are a generation path, not the certificate. Zero slack: every re-verification must be exact. The in-sector targets none of whose sector preimages has a switch arc of positive-weight image (every choke state in {(0,0), (0,d)} or β ≥ 2) are loaded at most 1, and exactly 1 is attained. Fidelity of E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY at this row: Σ_{B ∈ I_449} w_F(B) − Σ_{A ∈ I_448} w_F(A) = S(T, 448) < 0 (a 320-digit integer) from independent sides, the active-weight generating function y²(1+2y)^670 + (1+2y)·[82·P_8·Q_8^81·Q_7² + 2·P_7·Q_8^82·Q_7] with P_d = d·y²(1+y)^(d−1), Q_d = (1+2y)^d + y(1+y)^d against Σ_{v ∈ F}[q_v(p) − q_v(p − 1)] from the H_v and R_v deletion polynomials. Inputs at their grades: E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL (proved_informal) including its load clause, confirmed against the frozen run-local registry snapshot by isolated second read SR-C5-1; the criterion check at this row (computer_assisted); integrality by max-flow integrality, kernel-checked as the companion lemma exists_saturatingFlow_of_weightedHall on the face of E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE (formally_verified award; a companion carries no certificate of its own). The grade is the weakest input's: computer_assisted.
ATTRIBUTION: T2 (Claude Sonnet 5; the reduced-capacity choke-local sector certificate with one shared outflow and inflow slope across both choke degrees, its composition, route C5-T-02); critics C-T2-F (Claude Opus 5.5; the per-state table as data, an own exact evaluation over the literal multiset, the literal laboratory on the actual row, the independent active-weight generating function for the layer-weight difference, the criterion census at this tree, the tree-naming key) and C-T2-U (Claude Opus 5.5; an own convolution-power verifier, literal laboratories on small heterogeneous trees, the loads of the switch-dead in-sector targets); the r30 T adjudicator (Claude Opus 5.5; replay by three methods and a literal laboratory on the actual row); isolated second read SR-C5-1 (Claude Opus 5.5; own instruments, the load clause against the registry, the class-by-class composition); the transport network, the active-tag weight w_F, (HALL) and the CB family: Codex (GPT-6 Astra/Sol/Luna), the lower-region run and its corrections.
FENCES: One tree at one rank; finite; not universal and not a family theorem; nothing about any other tree, any CB(d, m) or any other rank. Not (HALL) at full scope: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. Not a deletion-only statement (deletion-only saturation fails on sec) and not E993-R23-LITERAL-DELETE-ONLY-HALL, which stays REFUTED at its exact scope. Not E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS and not a sixth row of it. No refuted mechanism revived: literal (D) ∪ (S), literal w_F, fixed original selector; not per-leaf injectivity, not own-support unit capacity, not occupancy domination; never counts present favorable leaves. The primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched, as are E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG and Erdős #993. No RTree or governed-model assertion. No census value enters.
ALIASES: G(8^82 7^2) rank 448 reduced-capacity sector certificate ; choke tree 8^82 7^2 whole-network Hall at rank 448
```

```text
KEY: E993-R30-CHOKE-TREE-8POW82-7POW2-RANKS-449-TO-503-DELETION-ONLY-WEIGHTED-HALL
STATUS: VERIFIED
GRADE: computer_assisted
STATEMENT: Let T = G(8^82, 7^2) be the tree of E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS (n = 1427, α = 755, x = 446 through rank α, eligible window [448, 503], D = 670). At every p ∈ [449, 503] (55 ranks), with F = F_p(T) the whole leaf set (derived leaf by leaf at each rank), w_F the literal active-tag weight and the deletion arcs (D) alone: there is a nonnegative rational flow supported on (D) arcs that sends exactly w_F(B) out of every B ∈ I_{p+1}(T) and loads every A ∈ I_p(T) at most w_F(A); hence an integral saturating flow supported on (D) arcs exists, and (HALL) holds at (T, p) with no switch arc used. Certificate: (i) by E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING with q_i = 2 and M = 670, the claw product K(2)^670 carries a normalized flow from its rank-k layer to its rank-(k − 1) layer along lower covers; sec := {B ∈ I_{p+1}(T) : r, v ∈ B} (every member of weight 1: r ∈ B excludes every choke, so only v is active) is that rank-k layer with k = p − 1 (one coordinate {∅, b_ij, c_ij} per leg), the targets containing r and v form the rank-(k − 1) layer, and the deletion arcs out of sec with an image of positive weight are exactly the lower covers; multiplied by e_k = 2^k·C(670, k), the flow sends 1 out of every member of sec and loads every target containing r and v at e_k/e_(k−1) = 2(671 − k)/k ≤ 1, which holds exactly for k ≥ 448, that is for every p ∈ [449, 503] (checked at each of the 55 ranks; equivalently 3p ≥ 2·670 + 5); (ii) outside sec, the deletion-arc flow of E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL, whose criterion holds in exact integers at every p ∈ [449, 503] for all 248 choke-set types, the maximum ρ_Q at each rank attained at (q, D_Q) = (1, 7) and decreasing from about 0.98887 at 449 to 67808723936213/101432798531686 (about 0.66851) at 503; it loads every target with r ∉ A and Q(A) nonempty at ρ_{Q(A)}·w_F(A) ≤ w_F(A) and every target containing r at 0, while (i) loads only targets containing r and v; the two target classes are disjoint (r ∈ A against r ∉ A). Every source outside sec with r ∈ B has weight 0. Rational flow to integral flow on the deletion-only network: max-flow integrality.
SCOPE: Inputs at their grades: E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING (proved_informal) at constant q_i = 2; E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL (proved_informal) with its load clause; the ratio and criterion checks at the 55 ranks (computer_assisted). The grade is the weakest input's: computer_assisted. One tree, the 55 ranks 449 to 503 of its eligible window; F = F_p(T) derived at each rank; weight w_F literal; relation (D) only. 448 is the unique eligible rank of T at which sec is deletion-deficient (e_447/e_446 = 448/447 > 1); the switch-arc certificate there is E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS. Fidelity of E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY at each of the 55 ranks from independent sides (as recorded on that key), S(T, p) < 0 at each.
ATTRIBUTION: T2 (Claude Sonnet 5; the sector-as-claw-product reduction and the composition at 449 to 503); critics C-T2-F and C-T2-U (Claude Opus 5.5; the criterion census at all 56 ranks, the unique-deficient-rank check, the reading of sec as the constant-q claw product); the r30 T adjudicator (Claude Opus 5.5; replay); isolated second read SR-C5-1 (Claude Opus 5.5; own instruments at all 55 ranks); the transport network, the active-tag weight w_F, (HALL) and the CB family: Codex (GPT-6 Astra/Sol/Luna), the lower-region run and its corrections.
FENCES: One tree; 55 finite instances; not universal and not a family theorem; nothing about any other tree, any CB(d, m) or rank 448. Not (HALL) at full scope: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. A finite deletion-arc statement on one tree where deletion arcs suffice; not E993-R23-LITERAL-DELETE-ONLY-HALL, which stays REFUTED at its exact scope (a different, unweighted demand on the r23 tagged top side of every eligible ordinary tree), and no refuted mechanism is revived. Not E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK and not a row of it. The primary aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched, as are E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG and Erdős #993. No RTree or governed-model assertion. No census value enters.
ALIASES: G(8^82 7^2) ranks 449 to 503 claw-product sector flow ; choke tree 8^82 7^2 upper-window deletion-arc flow
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r30 C5; SR-C5-1] (HALL) holds at every eligible rank of the one tree G(8^82, 7^2) (n = 1427, α = 755, x = 446, window [448, 503], 56 instances): at 448 with switch arcs load-bearing (E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS) and at 449 to 503 with deletion arcs alone (E993-R30-CHOKE-TREE-8POW82-7POW2-RANKS-449-TO-503-DELETION-ONLY-WEIGHTED-HALL); computer_assisted. It is the first tree outside the homogeneous CB(d, m) family with a switch-arc certificate. This conjunction is a scope note, not a key. Finite; one tree; this key stays OPEN; the primary aggregate is untouched. Attribution as on the two keys.
```

```text
SCOPE NOTE ON: E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL
TEXT: [r30 C5; SR-C5-1] Applied at G(8^82, 7^2) (the pattern with 82 chokes of degree 8 and 2 of degree 7) at every p ∈ [448, 503]: the criterion holds in exact integers at all 248 choke-set types at each rank (a record, computer_assisted; not part of this key). The registered load clause covers the single-choke targets (B − {r, b_ij}) ∪ {u_i} that contain v (r ∉ A, Q(A) = {u_i}; the arm is a ternary coordinate of the clone poset), which E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS caps at (1 − ρ_(1,d_i))·w_F(A). The statement does not depend on E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING, as its own scope records. No change to this key's statement or grade.
```

```text
DISTINCTION ROW: R30-C5-CHOKE-TREE-448-HALL-VS-FIVE-CB-FIRST-RANK-HALL
KEY: E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS
TEXT: The registered key is (HALL) at five first eligible ranks of five HOMOGENEOUS trees CB(8,86), CB(8,89), CB(8,92), CB(8,108) and CB(7,144), each with one choke degree, certified by five one-degree sector certificates composed with the homogeneous mark-clone key. The new key is (HALL) at rank 448 of the one HETEROGENEOUS tree G(8^82, 7^2), with 84 chokes of two degrees; it is not a CB(d, m) and shares no (T, p) with the registered key. Its sector certificate is a different LP: two degree classes with one shared outflow slope and one shared inflow slope and degree-specific constants and switch caps (θ*_7 = 0, θ*_8 = 384/1832557), composed with the heterogeneous mark-clone key indexed by (q, D_Q). The shared name tokens (7 of 12) describe the common mechanism class, not a common instance. Neither key implies the other; the new key is not a sixth row of the registered one.
```

```text
DISTINCTION ROW: R30-C5-CHOKE-TREE-449-503-DELETION-HALL-VS-FIVE-CB-ROWS-DELETION-HALL
KEY: E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK
TEXT: The registered key is deletion-arc (HALL) at the ranks above the first eligible rank of five HOMOGENEOUS CB trees, through the homogeneous mark-clone key and the induced-matching normalized-matching key. The new key is deletion-arc (HALL) at ranks 449 to 503 of the one HETEROGENEOUS tree G(8^82, 7^2), through the heterogeneous mark-clone key and the claw-product normalized-matching key at q_i = 2. Different tree, different ranks, different inputs; no (T, p) in common. Neither key implies the other.
```

```text
DISTINCTION ROW: R30-C5-CHOKE-TREE-448-HALL-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key is a universal UNWEIGHTED deletion-only Hall inequality on the r23 tagged top side of every eligible ordinary tree. The new key is a finite (HALL) certificate with the active-tag weight at one rank of one tree, on (D) ∪ (S), where deletion-only saturation provably FAILS (the sector is deletion-deficient by the factor 448/447) and switch arcs carry load. Different weight, relation, family and scope. The refuted key stays REFUTED; nothing is revived.
```

```text
DISTINCTION ROW: R30-C5-CHOKE-TREE-449-503-DELETION-HALL-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: The refuted key is a universal UNWEIGHTED deletion-only Hall inequality on the r23 tagged top side of every eligible ordinary tree. The new key is a finite statement with the active-tag weight w_F: a deletion-arc flow at 55 named ranks of one tree, obtained from two registered restricted-scope keys and exact checks. It asserts nothing about any other tree or rank and is not a universal deletion-only mechanism. The refuted key stays REFUTED at its exact scope; this is not a revival (the precedent is R30-C3-FIVE-CB-ROWS-DELETION-HALL-VS-R23-LITERAL-DELETE-ONLY-HALL).
```

```text
RECORD: R30-CB-RECORD-C5-CHOKE-TREE-8POW82-7POW2-RANK-448-PER-STATE-TABLE
CLAIM: The per-state flow table of the rank-448 sector certificate of G(8^82, 7^2): 64 deleted-support values pb_d(β, γ), 64 deleted-private-leaf values pc_d(β, γ) and 13 switch values σ_d(γ) (d = 7, 8), all nonnegative, 135 nonzero, σ_7 ≡ 0; minimum sector outflow 1 and maximum in-sector inflow 1 exactly over the literal choke multiset; switch caps θ*_7 = 0, θ*_8 = 384/1832557. Literal (D) ∪ (S) laboratories on the actual tree at 448: C-T2-F (183 instances), the T adjudicator (30 + 30) and SR-C5-1 (165), with 0 mismatches against the local load formulas. At the maximum-inflow in-sector target, 3,486 r-switch preimages (3,296 of positive weight) exist in the literal network, and the certificate's flow on them is 0.
STATUS: computer_assisted
PROVENANCE: T2 (Claude Sonnet 5) LP; data dumps C-T2-F t2_cert.json (SHA-256 7a6f4c66eb7db2fc872b96a85b2a6adcaf02ae7591b194b11b97f7a11bc53849) and T adjudicator t2_cert_values_adj.json (SHA-256 2c421fccf52dae12e39fe8cbc73820ab19ed1e57d202295f6ae556e503378996), equal value for value; critics C-T2-F, C-T2-U; the r30 T adjudicator; isolated second read SR-C5-1 (Claude Opus 5.5).
```

## Verdicts

verdict[SR-C5-1a]: confirmed
verdict[SR-C5-1b]: confirmed
verdict[SR-C5-1c]: confirmed
verdict[SR-C5-1d]: confirmed_with_repairs
verdict[SR-C5-1e]: confirmed_with_repairs
verdict[SR-C5-1f]: confirmed
verdict[SR-C5-1g]: confirmed_with_repairs

**Exact repairs** (the registration blocks above carry them in full).
- **SR-C5-1d.**
  - Replace "integrality by B7 / C1-LA2's (HALL⇒FLOW) (`formally_verified`)" with: "integrality by max-flow integrality, kernel-checked
    as the companion lemma `exists_saturatingFlow_of_weightedHall` on the face of
    `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` (`formally_verified` award; a companion carries no certificate of
    its own)".
  - Replace the R8 family description with: "the in-sector targets none of whose sector preimages has a switch arc of positive-weight
    image (every choke state in `{(0,0), (0,d)}` or `β ≥ 2`) are loaded at most 1, and exactly 1 is attained".
  - The mathematics is confirmed unchanged.
- **SR-C5-1e.**
  - Replace the Hall-form sector step with the flow form: "the normalized flow of `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`
    at `q_i = 2`, `M = 670`, multiplied by `e_k`, sends 1 out of every member of sec and loads every target containing `r` and `v` at
    `e_k/e_(k−1) ≤ 1`".
  - Add: "rational flow to integral flow on the deletion-only network: max-flow integrality".
  - Name both inputs by key.
  - The numbers are confirmed as stated (55 ranks; maximum `ρ` about 0.6685 at 503).
- **SR-C5-1g.**
  - Both names are confirmed as predicates, with no alias hit.
  - Name every input by KEY. "CD-1" is a registered alias of
    `E993-R30-SELF-WITNESSED-STAR-FOREST-SECTOR-POSITIVE-DELETION-DEFICIT-REQUIRES-PENDANT-P3-ARM`, "C1-LA2" of
    `E993-R25-PERFECT-MATCHING-EVEN-EXCESS-SIGN`, and "E1-R" is part of E1-R's own alias.
  - The distinction rows, the scope note on (HALL) and the scope note on E1-R's key are as written above.

**Decisive line (ruling 39, letter (b′), first half):** CONFIRMED. Whole-row (HALL) at `G(8^82, 7^2)` (448 with load-bearing switch
arcs; 449–503 deletion-only) is confirmed at `computer_assisted`, including E1-R's load clause, which I checked against the frozen
registry snapshot (stated verbatim on the registered face). Items 1b, 1c and 1d all hold, so neither key nor the first half of (b′)
fails. The second half of (b′) is SR-C5-2's, and the letter is supplied only if that read also confirms. (HALL) at full scope and the
primary aggregate stay OPEN and untouched.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

- Deliverable: this file only, `second-reads/SR-C5-1/SECOND-READ.md`.
- Scratch: `scratchpad/c5-sr-SR-C5-1/`.
- Every script is `python3 -B`, standard library only (`sys`, `json`, `time`, `itertools`, `random` with fixed seeds, `fractions`,
  `math`, `collections`, `re`), exact integers and `Fraction`, and deterministic.
- There is no bytecode (checked with `find` inside my scratch only) and no background job, so nothing needed to be killed.

| File | SHA-256 | Role |
|---|---|---|
| `sr_tree.py` | `2fb66324459617fda3d9d7b5cb12399f62d199bd6d946a1e20747a8411362d34` | literal tree builder; separate connectivity/acyclicity test; generic forest DP |
| `sr_row.py` | `a3f90b57b71c041d087e7bda2c26bb849c9b84a70987e4cf1f36369ee1b5685e` | n, α, x through α, window; closed-form cross-check; Δ_p(T − z) for all 671 leaves at 56 ranks |
| `out_sr_row.txt` | `90027fc909129961056b1164163492b6a5513e556921021aa73ecf355aff7c2d` | its output |
| `sr_row.json` | `8e932303218c968bb364f3b4f4cabdb5197293fa2557f40fb0f32e49d576ea2d` | row data (I(T) coefficients) |
| `sr_wid.py` | `24ac130a9fe47e6bbbac5f711c0edb23e8dfad4d3956da0270a9eade703e1808` | (WID) two-sided: structural W(y) vs Σ_v q_v over every leaf; small brute-force validation |
| `out_sr_wid.txt` | `55282c1af13f65922aa84288fa359b2d7d1b299001e31ae34c1b1c7f7fd1e460` | its output (incl. S(T,448)) |
| `sr_wid.json` | `2d177ee8c9d4f15ac9c515192d38086c6d17639307521450dff34d602fb0069c` | supply, capacity, S at 56 ranks |
| `sr_e1r_cd1.py` | `206b641486a7091242efafc1219a33c782b418ee696fce36a32627c0a3e281aa` | E1-R criterion 248 types × 56 ranks by binomial sums; ρ_(1,7), ρ_(1,8); claw-product ratio at 56 ranks |
| `out_sr_e1r_cd1.txt` | `9604758bd000b70cf6e39a7ec2f1a9462f5d8093141b614fb603a2ec4b914a3e` | its output |
| `sr_cert.py` | `34c7536cacf51e19b6ad7e45c4355d7833edda742fa94fd3808996585ab2e3a5` | certificate from the shipped tables as data: file comparison, key set, nonnegativity, exact literal-multiset DP, R8 (two readings), switch caps, affine path |
| `out_sr_cert.txt` | `05c19aca0f0df53d843de3dae580c34fa3c2a680f65dad726f3e60be28cc9cdd` | its output |
| `sr_cert_extremes.json` | `57e262e7b528c8e5f293dfe92f5a2a6523a3c0c040dedb4650b6f50daab7bbe7` | argmin / argmax / R8 argmax state lists |
| `sr_lab.py` | `ed95ead224515e958173114340a82086a04452088f16c7fed00875040c978527` | literal (D) ∪ (S) laboratory at 448 (165 instances) |
| `out_sr_lab.txt` | `42120f807c6db3efda08f4a7488770ab219e8d1a17290deae4fc0186659d0582` | its output |
| `sr_exits.py` | `793ce8b6573e08eeed5641d1a12d3603cd24f1b3688677f535235802eb77bd32` | literal exit classes and non-sector r-containing source weights |
| `out_sr_exits.txt` | `0dba9f3969e2cea15f050e9147d4f9d5e883751448027fdf7b0da8f5022792a4` | its output |
| `sr_alias.py` | `19929ceda46d6adaf0d13a0b152bbfdc0700f3360127cf6517cd3d87bd72abab` | own lexical/regex alias screen of names and registration text vs snapshot (453 ⊇ master 434) |
| `out_sr_alias.txt` | `b4790772d26243be501e4a14e43023d2523c6865b63eed0a740f1e573c54c78c` | its output |
| `registration.txt` | `f83412016318bcc1b5df803e2d32dd83129fde789d4f0dd4b7e5f4c33f652b63` | the registration blocks as screened (verbatim above) |

Replay (cwd `scratchpad/c5-sr-SR-C5-1/`, in order): `python3 -B sr_row.py; python3 -B sr_wid.py; python3 -B sr_e1r_cd1.py; python3 -B sr_cert.py; python3 -B sr_lab.py; python3 -B sr_exits.py; python3 -B sr_alias.py` (about 40 s, 80 s, 2 s, 1 s, 20 s, 2 s, 3 s). `sr_cert.py` and `sr_lab.py` read the two shipped tables from `sources/c5-stage7-sources/` read-only; `sr_alias.py` reads the frozen snapshot and master read-only.
