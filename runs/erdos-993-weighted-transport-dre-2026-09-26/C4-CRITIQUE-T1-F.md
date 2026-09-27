# Critique

**Seat:** `C-T1-F`, the cross-orientation critic (orientation F, falsify) of route return `T1` (`C4-T-01 CB-FIRST-RANK-COUPLED-ALLOCATION`, orientation T), Cycle 4, r30.
**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** I am operating within VerityOS. Boot reads: exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full. I did not load any other VerityOS subsystem.

**Read-boundary disclosure.**
1. The harness auto-injected the repository `CLAUDE.md` and the user auto-memory index into my context at session start. I did not open them, and nothing in this critique uses them.
2. Files read for content: the dispatch file; the capsule and its 14 listed members (protocol, common brief, my seat's section of the attack briefs plus the file's preamble lines 1–19, both contracts (for SOLUTION-CONTRACT, §3–§5 read closely), allocation, Stage 1 gate, Stage 2/3/4 manifests (Stage 2 and 3 via `python3 -B` json/hashlib only), the Stage 3 disclosure record (T1's entry), `PATH-CHECK-T1.json`, and the return); the T1 scratch artifacts under `scratchpad/c4-T1/`.
3. One non-recursive `ls -la` of `scratchpad/c4-T1/`, which is the granted artifact directory.
4. No `find`, `grep`, `rg` or recursive listing was run outside my grant. One `find . -name '*.pyc'` ran inside my own scratch directory.
5. I did not read `sources/`, `control/SOURCE-DIGESTS.json` entries (beyond the whole-file capsule digest), the run-local registry, Cycle 1–3 records, another return, a critique, or an adjudication. There was no network use, no install, and no Lean.
6. No background job was started, so there is nothing to kill.

## Identity and seal audit

- **Capsule inner seal** recomputed canonically (SHA-256 of compact key-sorted JSON minus `seal_sha256`, no trailing newline): **`a26be96ea7a3d467e184ab6dc28be86e6fd3c3fcd70a69f40ecf1e31855851d4`**. This matches the dispatch.
- **Dispatch file** SHA-256 `5b283a711b5e56a02ab21a657204e323f2896812b546ce098f6ff047fd528dca`: matches.
- **Capsule members:** all 14 match on both SHA-256 and byte length.
- **Stage 2 seal** `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`: recomputed, matches. This is also the value the return cites (its disclosure item 1).
- **Stage 3 seal** `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9`: recomputed, matches.
- **Stage 4 dispatch seal** `784132f0726699b6f7ef5cbf07196f7d35d233d980799f25fdd6883cadde9229`: recomputed, matches.
- **Return digests.** All ten digests the return lists (5 scripts, 5 outputs) match the files in `scratchpad/c4-T1/`. I copied them into `scratchpad/c4-crit-T1-F/replay/` and re-ran all five with `python3 -B`. Every output is **byte-identical** to the shipped `out_*.txt`.
- **Return model disclosure:** chartered sonnet/xhigh, runtime `claude-sonnet-5`. This is consistent with the allocation's route seating.
- **Registry keys touched:**
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN; not moved).
  - E1 `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`, SUFFICIENT criterion; imported premise).
  - C2-LA1 `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`.
  - C3-LA1 `E993-R30-WEIGHTED-HALL-IFF-FULL-AUT-ORBIT-QUOTIENT-HALL-AT-FIXED-SELECTOR`. My quotient instrument relies on this key and on (LIFT) with its converse.
  - `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`.
  - (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`.
  - `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` and (NM), both for the alias check below.
  - The fence `E993-R23-LITERAL-DELETE-ONLY-HALL`.
  - The return cites the reader-repaired names, not the Stage 6 aliases. It cites E1 at `proved_informal` and the five-row key at `computer_assisted`, and upgrades nothing.

## Independent re-derivation

My instrument is built from SEMANTIC-CONTRACT §1.2 and lives in `own/`.

**Fixed points reproduced before use** (`net.py`: literal layers, `F_p` derived from `Δ_p(T − v)` on the original tree, literal `w_F`, literal (D)∪(S), Dinic max-flow, `supply − capacity = S` asserted against an independent `q_v` sum):

| Fixed point | supply / capacity / S | flow | arcs | expected |
|---|---|---|---|---|
| `K_{1,12}` at `p = 8` | 1980 / 3960 / −1980 | 1980 | — | exact |
| path-star `(2,3,4)` at `p = 7` | 1483 / 2701 / −1218 | 1483 | 2025 | exact |
| path-star `(2,2,4,3)` at `p = 8` | 8033 / 13467 / −5434 | 8033 | 11691 | exact |

**Fidelity of the return (checked in the code, not the prose).**
- **Weight: correct.** `cb_type_analysis.py::w_F` counts active tags (`(B∖{v}) ∩ W_v ≠ ∅`).
- **Switch rule: correct.** A switch at `u_i` exists iff exactly two neighbours of `u_i` are in B (r plus one b-leg), and the target weight is the number of c-legs at that choke.
- **`x`: correct.** It is computed through rank `α` with `i_{α+1} := 0` explicit (`cb_polynomial.py`).
- **FIDELITY FAILURE 1: `F_p` is never derived.** The literal validation hard-codes `F_all_leaves = {v} | set(leaves.values())` (`cb_type_analysis.py` l.189). At the three rows, the weight-one sector and the switch-target weights `ℓ` assume every leaf is favorable, and no `Δ_p(T − v)` is computed anywhere. Step 1's "fixed selector" sentence asserts this without derivation. The allocation's shared rules forbid it ("never hard-coded 'all leaves' — three Cycle 3 routes were struck for it").
- **FIDELITY FAILURE 2: no instance asserts `supply − capacity = S`.** This covers the three rows and the small laboratories alike, although SEMANTIC-CONTRACT §1.2 and SOLUTION-CONTRACT §3.3 require it on every instance. Ruling 31's instrument-naming requirement is moot only because the return makes no `S` assertion. §3.3 is not moot.
- **Critic repair (critic-derived; `cbrows.py`).** I ran a generic forest DP on the literal trees, checked with `IsTree`. Results at `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, `CB(8,108)/577` and `CB(7,144)/673`:
  - `n`, `α`, `x` and eligibility match the return's Step 4.
  - **`F_p` = all leaves at all five rows (689/713/737/865/1009), DERIVED.** Both leaf classes were tested (the arm leaf `v`, and private leaves at first and last index; all private leaves form one `Aut` orbit).
  - `S < 0` at all five rows. **`supply − capacity = S` holds with two independent instruments:** instrument I counts active-tag incidences per tag class; instrument II is the `q_v(j) = i_j(H_v) − i_j(R_v)` forest DP.
  - With this repair, the numbers downstream of the selector stand **on the critic's evidence, not the return's.** The two fidelity failures remain defects of the return.
- **Hierarchy counts re-derived independently (`hier.py`).**
  - Method: enumerate all `3^d` per-choke leg-state tuples; classify them by the literal switch rule; build the "bad" and "cornered" generating functions from the general quantifier structure (not the return's closed-form polynomials).
  - Validated against a tuple-of-patterns brute force on 10 small instances, 4 of them with nonzero cornered counts (`(3,2,3)`=2, `(4,2,4)`=10, `(3,4,6)`=6, `(4,3,7)`=120, `(5,2,6)`=100).
  - At the three rows, the exact integers `stuck`, `bad` and `cornered` **equal the return's** (`out_crosscmp.txt`). The ratios are 3.119e-7 / 1.866e-9 / 5.730e-28, then 1.847e-7 / 9.265e-10 / 6.364e-29, then 1.093e-7 / 4.600e-10 / 7.069e-30.
  - The return's characterisations ("bad iff every choke is empty, full with β≠1, or partial with β≥2"; "cornered iff every occupied choke has β≥3") are confirmed.
- **`ρ_1` re-derived (`rowmargin.py`).** I used an explicit convolution sum for the E1 formula as quoted in C4-ALLOCATION (T2 item: `(1+y)^{qd−1}(1+2y)^{d(m−q)+1}` at `q = 1`). The fractions match (0.99456172 / 0.99474464 / 0.99491564). The return's claim that `ρ_1` was "reproduced here from SEMANTIC-CONTRACT's `r_q(k)` formula" is **misattributed**: SEMANTIC-CONTRACT contains no `ρ` or `r_q` formula, and the formula comes from the Cycle 3 E1 record.

## Attacks and findings

**A1. Step 1, the "uniform-deletion saturation lemma", is false as stated ("general in d, m, K", outflow `(p−1)/p`).**
- What is true: the rank-`K`/rank-`(K−1)` Hasse graph of the leg cube is `(K, 2(M−K+1))`-biregular. So the constant rate `γ = 1/(2(M−K+1))` fills every target to exactly 1, and each source sends `K/(2(M−K+1)) = R_{K−1}/R_K`.
- That equals `(p−1)/p` **only when `3p = 2M + 4`**.
- `step1.py` checks every eligible rank of the five rows:
  - At 56/58/60 of the 57/59/61 eligible ranks of the three `CB(8,·)` rows, the outflow is not `(p−1)/p`. At every one of those ranks it **exceeds 1**, so the scheme as stated sends more than a source's unit supply and is infeasible.
  - At the two (O3) rows (`3p = 2M + 3`), the return's proof sentence ("`3p=2M+3` … one checks `K/(2(M−K+1)) = (p−1)/p`") is **false**. The outflow is `288/289 = (p−1)/(p+1)` at 577 and `336/337` at 673, so the deficit share is `2/(p+1)`, not `1/p`. It exceeds 1 at 71/72 and 95/96 of those rows' eligible ranks.
  - The proof's displayed algebra ("`M−p+2 = (p−2)/2·…`") is garbled. The correct identity at `3p = 2M+4` is `2(M−p+2) = p`.
- **Narrowed statement (true; `proved_informal`, elementary):** at `3p = 2M + 4`, uniform deletion fills every in-sector rank-`(K−1)` target exactly and carries `(p−1)/p` of each sector source. That holds at the three assigned rows only.

**A2. Step 1 registers nothing (alias check, lexical and mathematical).**
- The narrowed statement is the textbook biregular proof of normalized matching for a regular rank pair.
- Its deficit value `R_K − R_{K−1} = R_K/p` is the `t = 1` instance of the registered exact sector deficit. The allocation records `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` as "exact formula at every `p ≥ 2`", and SR-C3-4 as quoted by the return ("the deficit is `R_K − R_{K−1} = R_K/p`").
- The sector normalized-matching statement is the object of the registered (NM) key.
- The run-local registry is outside my capsule, so I could not byte-compare key texts. Mathematically, though, the lemma adds only the biregularity fact, and it **should not be registered as a new key**.
- The return's keyword search (0 hits) is a lexical check only. It does not settle the mathematical alias.

**A3. Step 2's "necessary condition" uses the wrong quantity, and it is not evidence for (HALL).**
- `C_1^V` sums over **all** `q = 1` V-targets, including `ℓ = d`, which the return itself says are unreachable. The necessary condition for `X = sec` must use `N(sec)` only, i.e. `1 ≤ ℓ ≤ d−1`.
- Corrected margins (`rowmargin.py`): **33.33× / 34.49× / 35.65×**, not 33.58× / 34.75× / 35.92×. The table literals are struck and replaced.
- The return correctly says this is only a necessary condition for the single family `X = sec`. Nothing in it proves (HALL-COND) for any other `X`.
- SR-C3-4's competition finding (E1's flow and the sector's switch exits compete for the same `q = 1` targets) is honoured, because the residual `(1−ρ_1)ℓ` is used.
- The whole construction still rests on an **imported, unverified-here premise**: that E1's flow loads every r-free `q = 1` target at exactly `ρ_1·ℓ` and loads no in-sector target. E1 is `proved_informal`, and its hypotheses at these rows are D1 (`computer_assisted`). Any composition is therefore at most `computer_assisted`.

**A4. The stuck / bad / cornered hierarchy is not the Hall-relevant obstruction.**
- The hierarchy measures the failure of one naive allocation. My attacks show it is not where (HALL-COND) is tight.
- (i) **Switch-dead pattern families are far from deficient at the rows** (`deadfam.py`, GF validated by brute force on 6 instances × 4 families). A family is "switch-dead" when it has no positive-capacity switch exit, so its Hall inequality is deletion-only. Shadow-to-family ratios at the three rows:

| Family | `\|∂X\|/\|X\|` at 460 / 476 / 492 |
|---|---|
| all stuck sources | 16.52 / 17.07 / 17.61 |
| every choke `β ≠ 1` | 16.71 / 17.26 / 17.82 |
| every choke `β ≥ 2` or empty | 17.63 / 18.22 / 18.80 |
| every choke `β ≥ 3` or empty | 42.68 / 44.15 / 45.61 |

  The stuck sources are therefore a large-slack family, not a near-cut.
- (ii) **The binding family of the reduced-capacity sector network (Cycle 3's A4) is essentially the whole sector** (laboratories; `a4q.py`, `a4run.py`, `a4exact.py`, `a4k85.py`).
  - I built the exact `S_d ≀ S_m` orbit quotient of A4 at `3p = 2M + 4`: sector sources of weight 1, in-sector deletion targets of capacity 1, `u_i`-switch targets of capacity `τ·ℓ`.
  - It agrees with a literal labelled network on 16/16 cases (flow values equal, `out_a4q_validate.txt`). This rests on C3-LA1 and on (LIFT) with its elementary converse.
  - I computed the threshold `κ* = min τ(p−1)` for saturation and compared it with `κ_whole`, the value forced by `X = sec` alone:
    - **κ*/κ_whole = 1.00 (to 5e-4)** at CB(2,2)/4, CB(4,1)/4, CB(2,5)/8, CB(4,4)/12, CB(2,8)/12, CB(2,11)/16, CB(5,5)/18, CB(4,7)/20 and CB(7,4)/20.
    - 1.01 at CB(5,2)/8, 1.03 at CB(8,2)/12, and **in (1.0000, 1.0059] at CB(8,5)/28** (144,356 source orbits).
    - At the three rows, the available `(1−ρ_1)(p−1) = 2.4962 / 2.4963 / 2.4964` against `κ_whole = 0.0749 / 0.0724 / 0.0700`, a ratio of about 33–36.
  - These are laboratories (`bounded_computation`, never evidence for (HALL); an eligibility check was not required). They indicate that the hierarchy's "10⁻⁷ / 10⁻⁹ / 10⁻²⁸" sizes do not measure Hall slack, and that A4's tight family is the whole sector, with a margin of about 33× at the rows.
- (iii) **Degenerate laboratory where A4 fails at every `τ`:** CB(7,1)/6 (`m = 1`). A switch-dead family is deletion-deficient; see A7.

**A5. Critic-derived partial advance on the open step (A4 at the three rows): the capped max-switch flow.** This is STATED at critique stage and needs an isolated second read. Its grade is `proved_informal` for the combinatorics and `computer_assisted` as a composition, because it uses E1's residual.
- *Construction.* Every sector source `B` sends `τ·γ_i/(d−γ_i)` along each usable choke `i` (`β_i = 1`, `γ_i ≥ 1`). A switch target with `γ` c-legs has exactly `d − γ` preimages, so it receives at most `τγ`, its residual. Write `σ(B)` for the total switched.
- *Capping.* Scale the switch amounts down so that `σ'(B) = min(1, σ(B))`. Then send `(1−σ'(B))/K` along each of `B`'s `K` deletion arcs.
- *Load at a target.* An in-sector target `T` receives `(p − Ψ'(T))/K`, where `Ψ'(T) = Σ_{B∈up(T)} σ'(B)` and `p` is the up-degree. The load is at most 1 iff `Ψ'(T) ≥ 1`, because `p − K = 1`.
- *Additive formula.* `Ψ(T) = Σ_i ψ(T_i)` with `ψ(P) = φ(P)(p − 2e(P)) + Σ_{one-leg additions at that choke} φ(P + leg)`. This was checked literally on three laboratories (13,440 targets at CB(2,5)).
- *Capping costs nothing where it matters.* `Ψ' ≥ min(1, Ψ)`, since one capped up-neighbour already contributes 1.
- *Bound.* `min ψ` over usable-type choke patterns is **0.35893 / 0.35887 / 0.35881** at the three rows (exact rationals, `relief.py`).
- **Result.** Therefore **every in-sector target with at least three usable-type chokes (`β = 1`, `γ ≥ 1`) is within capacity.** The only possible overloads sit on targets with `u(T) ≤ 2`, which are **4.658e-5 / 2.943e-5 / 1.855e-5 of `R_{K−1}`** (exact GF counts). Each such overload is at most `1/K`.
- *What remains.* A4 at the rows reduces to routing this overload into the slack `(Ψ' − 1)/K` of other targets. One hop `T → T+ℓ → T+ℓ−ℓ'` changes `u` by at most 2, so targets with `u(T) = 0` need at least two hops. This is the exact form of the multi-hop step the return leaves open, restated on targets, where Hall is tight, rather than on stuck sources.

**A6. Minor strikes.**
- Step 3.1's switch census omits the `s`-switch (remove `r, v`, add `s`). It is harmless: its target has weight 0, which I checked by hand (no choke present, `v` absent).
- "C2-LA1 licenses" is moot, because no every-`X` statement is proved.
- The "literal max-flow validation (b)" that the allocation required FIRST was not run by the return. It is supplied in part by this critique's quotient/literal A4 cross-check (A4(ii)), attributed to the critic.

**A7. Out-of-seat adversarial finding (critic-derived; laboratory; `bounded_computation`): a counterexample to the conjecture "on trees, `S ≤ 0` ⇒ saturation at every rank".**
- Instance: CB(7,1), `n = 18` (tree tested), `α = 9`, `x = 6`, `p = 6`. This is **NOT eligible**, since `p < x + 2`.
- `F_6` = all 8 leaves (derived). Supply 924, capacity 945, **`S = −21`** by two instruments.
- The **maximum flow is 903 < 924**.
- The explicit cut (`cut71.py`, a separate enumeration code path): `X` = the 546 sector members `{r, v}` + 5 legs with `β ≥ 2` (210 of type (2,3), 210 of (3,2), 105 of (4,1), 21 of (5,0)). `Σ_X w_F = 546` and `Σ_{N(X)} w_F = 525`, a **deficit of 21**.
- This refutes only the C-U2-F conjecture (conjecture grade; the record says "no counterexample through order 15"), and only at a non-eligible rank. It is **not a (CUT)** for (HALL), and it is F2's object (allocation item 4(b)).
- It needs the two-instrument rule and an isolated second read before any record uses it.

**Plateau ruling 30.** The return supplies **none** of items (a)–(d).

## Mechanism-equivalence and fence check

- **Not a revival of `E993-R23-LITERAL-DELETE-ONLY-HALL`.** Step 1 uses deletion arcs and explicitly leaves the `1/p` share to switch arcs. The return says so on its face.
- **Not any other refuted key.** It is not Delete/Retag, own-support unit capacity, per-leaf injectivity, occupancy domination, signed cross-tag, or covariance. The weight is literal `w_F` and the relation is literal (D)∪(S).
- **Fences respected:**
  - No census value enters a proof.
  - There is no RTree wording.
  - No closed region is re-proved: the Step 4 row data are labelled a third-instrument check, not a contribution.
  - The Step 2 aggregate is never offered as (HALL).
  - (LIFT) is not used for feasibility.
- **Restatement.** Step 1 is a restatement (A2), so as a contribution it is fenced by "no re-proof of a settled family theorem". It registers nothing.
- **Fidelity fence §3.3.** The return breaches the "asserts `supply − capacity = S` before any other output" clause, and it did not derive `F_p` (both in Independent re-derivation). Under §3.3, the return's own row numbers downstream of the selector are struck. They stand here only because the critic re-derived them (`F_p` = all leaves, `S` from two instruments, identical hierarchy integers).

## Certification audit

- **Backed:** all ten digests; "byte-identical" replay (confirmed by my replay); `ALL_ISTREE_OK`; the brute-force polynomial match; the three rows' `n`/`α`/`x`/eligibility (confirmed independently); `ρ_1` fractions; the `stuck`/`bad`/`cornered` exact integers (confirmed independently); the `C_1^V` class counts for the classes that the literal check actually reaches.
- **Struck**, one line per unbacked literal:
  1. Step 1 "general in `d, m, K`" and "(i) … `Kγ = (p−1)/p` exactly": false off `3p = 2M + 4` (A1).
  2. The Step 1 sentence covering the (O3) rows (`3p = 2M+3`): false (A1).
  3. "verified exactly … by `cb_type_analysis.py`'s independent computation … matching the record's own ratio `p/(p−1)`": the script prints no ratio and asserts none. The fact is true, but it is backed by the critic's `step1.py`, not by the return.
  4. "verified against literal brute force on 11 small `CB(d,m)` instances" (Step 0 item 2, Step 3.3, Grades) and "6+11" (Step 5(b)): the shipped code runs 6 (bad) + 6 (cornered) instances, i.e. 7 distinct trees, plus 5 for stuck. No run of 11 exists. The characterisations are now backed by the critic's 10-instance validation.
  5. "100% exact match at every weight class `ℓ`" for `C_1^V`: the literal check compares only the reached classes `1 ≤ ℓ ≤ d−1`. Neither `ℓ = 0`, `ℓ = d`, nor the total `C_1^V` is compared.
  6. The margins "33.58× / 34.75× / 35.92×" as the necessary condition: replace with 33.33× / 34.49× / 35.65× (A3).
  7. "shrinks by roughly eighteen to twenty orders of magnitude at each level" (Step 0 item 3, Step 3 Reading, Verdict): false. The step from stuck to bad is about two orders (and the ratios are taken over different layers); only the step from bad to cornered is about 19 orders.
  8. "strong quantitative evidence for … the reduced-capacity sector Hall claim": struck. The hierarchy sizes are not Hall slack (A4). The critic's κ* laboratories are the relevant (laboratory-grade) quantity.
  9. "`ρ_1` … reproduced here from SEMANTIC-CONTRACT's `r_q(k)` formula": misattributed (the source is the Cycle 3 E1 record).
- **Grades table (as narrowed):**
  - Step 1: `proved_informal` only at `3p = 2M + 4`, registering nothing.
  - Step 2: `bounded_computation`, with corrected margins.
  - Step 3 characterisations: `proved_informal`, elementary, critic-confirmed; they register nothing, being properties of one allocation strategy.
  - Row counts: `bounded_computation`.
  - Central obligation: not proved.
- **`## Remaining obligation` judged not exact.** Item 1 names the cornered-source gap as the obstruction. The Hall-relevant gap is the overload at targets with `u(T) ≤ 2` under a switch-saturating flow (A5), and the tight family in the laboratories is the whole sector (A4(ii)). Item 2 (the literal reduced-capacity max-flow) is partly discharged by this critique. Item 3 (the (O3) rows) is correctly stated as unattempted, but its Step 1 premise (`1/p`) is wrong there: the share is `2/(p+1)`.

## Verdict

verdict: retained_narrowed
headline_resolved: no

The return is honest that the central obligation (a) is not proved. What survives:
- The narrowed Step 1, at `3p = 2M + 4` only. It is a restatement and gets no new key.
- The exact hierarchy counts, confirmed as `bounded_computation`.
- The corrected aggregate margins.

What is struck:
- Step 1's generality claim and its (O3) sentence.
- The "11 instances", "18–20 orders per level" and "strong evidence" literals.
- The mis-sourced `ρ_1` attribution.

Two fidelity failures are recorded:
- `F_p` was never derived.
- `supply − capacity = S` was never asserted.

The critic's own re-derivation repairs both, so the retained numbers stand on the critic's evidence.

Critic-derived advances, attributed to `C-T1-F`:
- `F_p` = all leaves, and `S < 0` by two instruments, at all five rows.
- The capped max-switch flow (A5). It confines A4's possible overloads at the three rows to targets with at most two usable-type chokes, about 2–5×10⁻⁵ of the layer.
- Laboratory κ* data (A4(ii)). The whole sector binds, with about 33× headroom at the rows.
- An out-of-seat laboratory counterexample to the C-U2-F conjecture at CB(7,1)/6 (A7). It is not a (CUT).

None of these is (HALL). The mechanism key stays OPEN.

## Remaining obligation

1. **A4 at `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, exactly.**
   - *Given:* the capped max-switch flow of A5, with switch rate `τγ/(d−γ)` (with `τ = 1 − ρ_1`) and uniform deletion `(1 − σ'(B))/K`.
   - *To prove:* the overload `(1 − Ψ'(T))/K` at every in-sector target with `u(T) ≤ 2` (fractions 4.658e-5 / 2.943e-5 / 1.855e-5 of `R_{K−1}`) can be rerouted through deletion arcs into the slack `(Ψ'(T') − 1)/K` of targets with `u(T') ≥ 3`, keeping every deletion arc nonnegative. At least two hops are needed from `u = 0`.
   - *Equivalent form:* (HALL-COND) of the reduced-capacity sector network for every `Aut`-invariant `X ⊆ sec` (C2-LA1/C3-LA1).
   - *Premise:* E1's exact load profile `ρ_1·ℓ` on r-free `q = 1` targets and zero on in-sector targets. It must be cited at its grade, and D1 is `computer_assisted`.
   - *Consequence:* with that premise, closing A4 yields full (HALL) at the three first ranks as a `computer_assisted` separate key. That would be plateau item (b).
2. **The (O3) first ranks `CB(8,108)/577` and `CB(7,144)/673`.** They are unattempted. The sector deletion share there is `(p−1)/(p+1)`, not `(p−1)/p`, and any allocation must use the correct deficit `2R_K/(p+1)`.
3. **Registration.** No key from this return. The critic's A5 statement and the A7 laboratory cut each need an isolated second read before any use. A7 also needs a second instrument by another author, and it is routed to F2's object.

## Artifact inventory

Everything is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-crit-T1-F/`. All scripts use the standard library only, with exact `int`/`Fraction` arithmetic, and run with `python3 -B`. No `__pycache__` was written, and no background job was started.

**Replay** (`replay/`): copies of the five T1 scripts and outputs, with the return's digests. Replay outputs:
- `re_cb_build.txt` `ff33ec4b…`
- `re_cb_polynomial.txt` `26a67685…`
- `re_cb_type_analysis.txt` `5fad5205…`
- `re_cb_bad_targets.txt` `f86e47b5…`
- `re_cb_cornered.txt` `b69e7905…`

Each is byte-identical to the shipped `out_*.txt`.

**Own instrument** (`own/`, SHA-256):

| file | sha256 | purpose |
|---|---|---|
| `net.py` | `ddcfcee802b9b573de831684dba2d66c74b2f06d0bbee70dc11f0a4622b5f815` | literal network, `F_p` derived, `S` asserted, Dinic; fixed points |
| `cbrows.py` / `out_cbrows.txt` | `4109b0e4…` / `63632612…` | `F_p`, `n`, `α`, `x`, `S` (two instruments) at five rows |
| `step1.py` / `out_step1.txt` | `ce999756…` / `37eebd50…` | Step 1 audit over all eligible ranks |
| `hier.py` / `out_hier.txt` | `1fad8c43…` / `f3f7ae73…` | stuck/bad/cornered recount + 10-instance validation |
| `crosscmp.py` / `out_crosscmp.txt` | `d454c0aa…` / `e565ba56…` | exact equality with T1's integers (run from the scratch root) |
| `rowmargin.py` / `out_rowmargin.txt` | `ffb9c84a…` / `0d02c85a…` | `ρ_1`, reachable-only margins |
| `deadfam.py` / `out_deadfam.txt` | `69f8b9ca…` / `8639ce34…` | switch-dead family shadows |
| `a4q.py` / `out_a4q_validate.txt` | `e0fee483…` / `785ec77e…` | A4 orbit quotient vs literal (16/16) |
| `a4run.py` / `out_a4run1.txt` | `d6b88f77…` / `f756f5d2…` | κ* on 12 laboratories |
| `a4exact.py` / `out_a4exact.txt` | `df094076…` / `069f303d…` | CB(8,5)/28 at κ_whole |
| `a4k85.py` / `out_a4k85.txt` | `0158c5d8…` / `c3b25f53…` | CB(8,5)/28 κ* bisection |
| `relief.py` / `out_relief.txt` | `d15825f4…` / `23ca03c1…` | A5 capped max-switch bound |
| `cut71.py` / `out_cut71.txt` | `948987ff…` / `98493a0e…` | A7 laboratory cut at CB(7,1)/6 |

**Replay commands:** `cd` into `own/`, then run `python3 -B` on each of:
- `net.py`, `cbrows.py`, `step1.py`, `hier.py`, `rowmargin.py`, `deadfam.py`
- `a4q.py`, `a4run.py 2,2 4,1 7,1 2,5 5,2 8,2 4,4 2,8 2,11 4,7 7,4 5,5`, `a4exact.py 8,5`, `a4k85.py`
- `relief.py`, `cut71.py`
