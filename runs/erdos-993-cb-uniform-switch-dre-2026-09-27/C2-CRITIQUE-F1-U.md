# Critique

Critic `C-F1-U`, r31 Cycle 2 Stage 4. Orientation U (formal / structural), cross-orientation critic of seat F1: route `C2-F-01`,
mechanism token `ASSEMBLED-CHAIN-LITERAL-NETWORK-ADVERSARY`, orientation F. Assigned return:
`cycles/cycle-2/stage3/returns/F1/RETURN.md` (SHA-256 `ee6da5f0b63433f27a6bcc02af219fe1e48ccca8c2dedb64eeb2d9f878f6987b`).

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no other VerityOS file. The harness injected the project
`CLAUDE.md`, the user memory index and the user's email into my context before my first tool call. I did not fetch or use them.
Conversation logging belongs to the controller for this run, so I wrote no log.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

**Dispatch and capsule.** I recomputed every seal as the SHA-256 of the compact key-sorted JSON of the manifest without
`seal_sha256`, with no trailing newline. All of them match.

| Object | Recomputed | Status |
|---|---|---|
| Dispatch `control/dispatch/c2-stage4/DISPATCH-C-F1-U.md` (file SHA-256) | `c5d496215dd6bab318e1fe902869d484f59688fee2bcd14d7e8fd4a934e67e38` | MATCH |
| **Capsule seal** `control/c2-critic-capsules/F1-PACKET-MANIFEST.json` | `25299cc574d8d5ac83ed8e6f85447aec0dd4915f0b1f56d316e17cd14f86170e` | MATCH |
| Stage 4 dispatch manifest seal | `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb` | MATCH |
| Stage 3 packet manifest seal | `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5` | MATCH |
| Stage 2 packet manifest seal | `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4` | MATCH (the value the protocol names) |

**Capsule members.** All 14 capsule members match the capsule's recorded bytes and SHA-256, including the return. I checked them
before reading.

**Digests the return lists.** I checked each one.
- The F1 Stage 3 dispatch digest `919418d2…6620` equals the Stage 3 manifest's entry for `control/dispatch/c2-stage3/DISPATCH-F1.md`.
  I did not open that file.
- Nine of the listed files are Stage 2 members, and each digest equals the Stage 2 manifest entry:
  - the worker brief;
  - `ROUTE-STATE.md` and `OBLIGATIONS.csv`;
  - `control/CLAIM-IDENTITY.run-local.json`;
  - the Cycle 1 close, SR-2 and SR-3;
  - C1-LA1's `INFORMAL-PROOF.md`, `adj_alloc.py`, and the table of record `adj_alloc_out.json` (`7d635805…4b13`).
- 25 r30 instrument files under `sources/r30/instruments/c6/` recompute to the values in `sources/SOURCE-DIGESTS.json`.
- Inventoried artifacts:
  - `scratchpad/c2-F1/f1_instr.py` is `4f931ebc…0c9a` (MATCH).
  - `f1_instr_out.json` is `cf300011…b6` (MATCH).

**Replay, copy-out-first.** I copied both inventoried files to `scratchpad/c2-crit-F1-U/replay/` and ran `python3 -B f1_instr.py`
there, in the foreground (16.8 s). It printed the four expected lines and reproduced `f1_instr_out.json` byte for byte
(`cf300011…b6`). The replay is exact.

**Registry keys.** The return cites four r31 keys, and each appears in `sources/c1-results/cycles/cycle-1/CYCLE-CLOSE.md` at the
grade the return states:

| Key | Grade |
|---|---|
| C1-LA1 (template) | `formally_verified` |
| SR-3 composition | `proved_informal` |
| SR-4 eligibility | `computer_assisted` |
| Tier 1 | `computer_assisted` |

**Controller index discrepancy (not a defect of the return).** `control/C2-STAGE3-READ-BOUNDARY-DISCLOSURES.json` says "none
reported" for F1. The return actually reports five read-boundary items:
- the harness injection;
- reading back harness tool-result files stored outside the run root;
- two `find` runs rooted inside the grant;
- two single-file `grep`s;
- no background jobs.

None of these touches the evidence. The index row should be corrected.

**My own read-boundary disclosures.**
1. All capsule files were read in full. The return's body came back through a harness tool-results file, because the output was
   too large to show inline. That file sits outside the run root, and its content is the capsule member itself.
2. Files I read under `sources/` (authorized as Stage 2 members):
   - `sources/r30/records/SEMANTIC-CONTRACT.md` (for `S(G,p)`, (WID) and the index convention);
   - `sources/first-interior/c2-primary-v2/LeanProject/LeanProof/Main.lean`, one `grep` of this single file for the definitions of
     `vertexDeletionForwardDifference`, `IsFavorableAt` and `forwardDifferenceDel`;
   - C1-LA1's `INFORMAL-PROOF.md` and its table `SOURCE/ADJ-T-adj_alloc_out.json`;
   - single-file `grep`s of the Cycle 1 close and of the two frozen registries (`sources/authority/CLAIM-IDENTITY.json`,
     `sources/concurrent/master-494-2026-09-28/CLAIM-IDENTITY.json`) for the alias check.
3. Directory listings:
   - one attempted recursive `grep` rooted at `sources/` (inside the grant) failed on a shell glob before it ran;
   - plain `ls` of `sources/`, `sources/r30`, `sources/r30/records`, `sources/c1-results`, `sources/c1-results/runs`,
     `sources/authority`, `sources/concurrent` and the C1-LA1 run directory (all inside the grant).
4. I did not read any of the following: another return, a critique, an adjudication, another experiment root, a Lean project, the
   network. I installed nothing.
5. One background job (PID 26892, my `crit_f1u.py` at rows 110–137) ran to completion on its own. `pgrep` confirmed that no job was
   running before this write, so nothing needed to be killed.

## Independent re-derivation

**My instrument.** I wrote `scratchpad/c2-crit-F1-U/crit_f1u.py` from the contracts. It uses the standard library, exact integers
and `Fraction`s, and shares no code with F1's script. Its components:
- **(a)** A literal CB(8,m) on integer labels and a tree check. A generic forest independence-polynomial DP with arbitrary deleted
  sets, run at full degree through `α`.
- **(b)** `x` computed through `α` with zero extension.
- **(c)** Favorability using the record's definition. The r30 semantic contract §1.1 and the first-interior `Main.lean`, lines 31–46,
  define `C4LA1.IsFavorableAt G v p := vertexDeletionForwardDifference G v p < 0` with
  `vertexDeletionForwardDifference G v p = i_{p+1}(G − v) − i_p(G − v)`.
  - I computed this for `v` and for three private leaves at different positions: `c_{1,1}`, `c_{m,8}` and `c_{(m+1)/2,4}`. Each
    uses a literal deletion DP, and the three private-leaf results must be identical.
  - The transfer to all `8m` private leaves uses the automorphism that swaps two chokes' subtrees and two legs within a choke.
- **(d)** Side 1 of (WID): a weighted tree DP that computes `Σ_B w_F(B) x^{|B|}` directly from the definition
  `w_F(B) = #{ℓ ∈ F ∩ B : B ∩ (N(s_ℓ) ∖ {ℓ}) ≠ ∅}`.
  - It carries in/out, weight-sum and "pending leaf" polynomials per vertex.
  - `F` is the derived selector.
  - No CB-specific weight lemma is used.
- **(e)** Side 2 of (WID): the aggregate `S(T,p*) = Σ_{ℓ∈F}[q_ℓ(p*) − q_ℓ(p*−1)]`, with
  `q_ℓ(j) = i_j(T − {ℓ, s_ℓ}) − i_j(T − N[s_ℓ])`, computed on literal deletions.
- **(f)** The C1-LA1 allocation, loaded from the table of record after checking its digest. The exact optimum of `ΣOut` and `ΣIn` is
  found by a DP over all 45 states per choke, without F1's collapse to leg counts.
- **(g)** `ρ_q` for every `q ∈ [1, m]`, and the switch-image load for each `γ`.

**Validation.** `test_small.py` checked the DPs against brute force on 300 random trees with `n ≤ 13` and random selectors
`F ⊆ leaves`. It compared the independence polynomial and the weighted polynomial, and checked (WID) for every `p ≥ 1`. There were
0 failures.

**Results.** All values are exact, and "yes" means the check passed at that row. `Δ_k := i_{k+1} − i_k` throughout.

| m | n | α | x | p* | elig | `Δ_{p*}(T−v)<0` | `Δ_{p*}(T−c)<0` | c reps equal | (WID) `supply − capacity = S` | S < 0 (digits) | min ΣOut | max ΣIn | all `ρ_q<1` |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 107 | 1822 | 964 | 570 | 572 | yes | yes | yes | yes | yes | yes (409) | 1 | 1 | yes |
| 110 | 1873 | 991 | 586 | 588 | yes | yes | yes | yes | yes | yes (420) | 1 | 1 | yes |
| 113 | 1924 | 1018 | 602 | 604 | yes | yes | yes | yes | yes | yes (432) | 1 | 1 | yes |
| 116 | 1975 | 1045 | 618 | 620 | yes | yes | yes | yes | yes | yes (443) | 1 | 1 | yes |
| 119 | 2026 | 1072 | 634 | 636 | yes | yes | yes | yes | yes | yes (455) | 1 | 1 | yes |
| 137 | 2332 | 1234 | 730 | 732 | yes | yes | yes | yes | yes | yes (524) | 1 | 1 | yes |

**Fixed point `CB(8,107)/572`.** I reproduced every recorded value: `n = 1822`, `α = 964`, `x = 570`, `θ = 96/766193`, and
`(1 − ρ_1)/θ = 34.9009`.

**Agreement with F1 at rows 110, 116, 119 and 137.**
- These values are identical to F1's JSON: `x`, `ρ_1`, `θ`, `min ρ_q` (at 110: `273637/324323`, at `q = m`), `argmax ρ_q = 1`, and
  `ρ_1 + θ` (at 116: `52790170671800919735431/52998324238955505842924`).
- F1's supply and capacity heads and digit counts (422, 445, 457, 526) agree with my weighted DP.

**New facts from my instrument (bounded, at these six rows only).**
- `ρ_q` is strictly decreasing in `q` on `[1, m]`.
- Both `Δ_{p*}` and `Δ_{p*−1}` of `T − v` and of `T − c` are negative. Each has 443 digits at `m = 116`.

**Literal check of the template-to-network bridge, sector part (`lit_sector.py`).** F1 relied on this bridge without testing it.
- **Setup.** I took small CB(8,m′) with `m′ = 1` (`K′ = 1..8`), `m′ = 2` (`K′ = 1..6`) and `m′ = 3` (`K′ = 1..4`).
  - For every root-plus-arm source with `K′` legs, I enumerated every literal (D) and (S) arc.
  - I applied the rule of record arc by arc: `pb`/`pc` by the source's choke state, `σ(γ)` on a `u_i`-switch at state `(1, γ ≥ 1)`,
    and 0 elsewhere. Rule values were taken at `m = 110`.
  - I computed literal active-tag weights with `F` equal to all leaves.
- **Literal properties confirmed, 880,320 sources in 18 configurations, 0 failures:**
  - every source has weight 1, and its literal outflow equals `Σ_i Out(state_i)`;
  - positive sector inflow lands only on two target types:
    - in-sector targets: weight 1, and every one of the `2^{K′−1}C(8m′, K′−1)` receives flow equal to `Σ_i In(state_i)`;
    - `r`-free targets with exactly one choke `u_i`, with `v` present and `s` absent, weight `γ ≥ 1`, and inflow exactly
      `(8 − γ)σ(γ)`.

This is `bounded_computation` of a local identity on small trees, not at class rows. It says nothing about E1's arc values.

## Attacks and findings

**A1 — FIDELITY FAILURE: favorability was tested at the wrong index. This is the strongest finding.**
- **The record.** The definition of record, `C4LA1.IsFavorableAt` (first-interior `Main.lean`, lines 31–46), is
  `Δ_p(G − v) = i_{p+1}(G − v) − i_p(G − v) < 0`.
- **The return.** Its text (§4) expands favorability as "`Δ_{p*}(T−t) < 0`, i.e. `i_{p*}(T−t) < i_{p*−1}(T−t)`". Its instrument
  (`f1_instr.py`, lines 459–460) tests `Iv_lit[pstar] < Iv_lit[pstar-1]` and `Ic_lit[pstar] < Ic_lit[pstar-1]`.
  - That is `Δ_{p*−1}`, not `Δ_{p*}`.
  - §3 of the return also defines a backward difference, "`Δ_{k+1}(T) := i_{k+1}(T) − i_k(T)`". That conflicts with the forward
    convention of `C5LA1.forwardDifferenceDel`.
  - F1's `x` is right anyway, because it is defined directly in terms of `i`.
- **Consequence.** F1's "derived `F_{p*}`" was not derived at `p*`. Under protocol duty 2, the return's claims
  "`F_pstar_equals_leafSet: true`", "favorable_arm_leaf_v / favorable_private_leaf_c" and every number downstream of the selector
  are struck as F1's evidence. The downstream numbers are supply, capacity, `S` and the "(WID)" line.
- **Restoration by the critic.** My instrument evaluates the correct index `Δ_{p*}(T − ℓ) < 0`. It holds for `v` and for every
  private leaf at 107, 110, 113, 116, 119 and 137, and F1's index also happens to be negative. So `F_{p*}` equals `leafSet` at
  F1's four rows, on my instrument's authority. F1's conclusion stands only on this critic evidence.
- **Why this matters beyond this return.** The same slip in any instrument that is reused at a row where `Δ_{p*−1} < 0` but
  `Δ_{p*} ≥ 0` would silently certify a wrong selector.

**A2 — FIDELITY GAP: (WID) was never asserted.**
- **What the contract requires.** Both contracts require `supply − capacity = S(T, p*)` from independent sides, where `S` is the
  aggregate `C5LA1.aggregate`, `Σ_F [q_v(p) − q_v(p−1)]`.
- **What F1 did.**
  - F1 computed supply and capacity each twice. Both routes rest on the same hand-derived weight lemma (a formula route and a
    "literal" route that brute-forces the same forced-vertex model).
  - It then set `S := supply − capacity`.
  - It hard-codes `R["WID_two_independent_sides_agree"] = True` (line 476).
- **Consequence.** The aggregate side was never computed, so the return's literal "(WID) from two independent sides … Both routes
  agree exactly" is struck.
- **Restoration by the critic.** My weighted DP (definition side) and my `q_ℓ` aggregate on literal deletions (aggregate side)
  agree exactly at all six rows, and `S < 0`. (WID) now holds at those rows on critic evidence.
- **Correction to F1's numbers.** F1's "magnitude 422–526 digits" is the digit count of supply and capacity. `S` itself has 420 to
  524 digits.

**A3 — "No deficient cut" is a template check, not a cut search. Narrowed.**
- F1's `cut_found` is `any(v > 1 for v in {max ΣIn, ρ_1 + θ, max_q ρ_q})`. The only thing tested on the network side is criterion
  condition (i) (`ρ_q ≤ 1`, exhaustive over `q`) plus the template's Out/In/Switch/Residual constraints.
- No Hall condition over any `X ⊆ I_{p*+1}` was evaluated, and the literal network was never built. The dispatch asked for a search
  of "structured source families … for a deficient cut". The DP over `ΣOut`/`ΣIn` does not substitute for that search except
  through two inputs:
  - SR-3's composition (`proved_informal`);
  - the homogeneous criterion key's E1 flow (`proved_informal`), whose condition (ii) and arc values F1 did not examine.
- **Narrowed statement.** At `m ∈ {110, 116, 119, 137}`:
  - C1-LA1's template satisfies Out, In, Switch and Residual exactly;
  - condition (i) holds for every `q`;
  - hence, given SR-3 and the criterion key, (HALL) holds at these rows at their grades.

  This is not an independent refutation attempt. The title word "literal" applies to the tree and its polynomials, not to the
  network.

**A4 — Wrong literal: "the switch-image load ratio is exactly `ρ_1 + θ`, independent of `γ` (the `γ` cancels)". Struck.**
- Before the scaling step, a weight-`γ` image receives `ρ_1γ + (8 − γ)c_γθ`.
- Here `(8 − γ)c_γ = γ` for `γ = 1..6`, but equals `7/2` at `γ = 7`. So the ratio is `ρ_1 + θ` for `γ ≤ 6` and `ρ_1 + θ/2` at
  `γ = 7`. My instrument confirms both, exactly, at every row.
- After scaling, loads can only fall. The correct statement is "at most `ρ_1 + θ`, attained before scaling for `γ ≤ 6`".
- F1's code sets `combined = rho1_val + theta` inside its `γ`-loop without using `γ`.

**A5 — Wrong literal in `## Remaining obligation` item 2: "`θ = 96/(200m²+82m+5)`". Struck.**
- The allocation's `θ` is `288/(200m² + 82m + 5)`, which equals `96/D` with `D = L/3`. That is what F1's own code (line 362),
  C1-LA1 and my instrument use.
- The row values are unaffected (for example, `θ(110) = 96/809675 = 288/2429025`).

**A6 — Garbled table cell.** The `m = 116` switch-ratio cell reads "`0.995966→0.996072`". The exact value is
`52790170671800919735431/52998324238955505842924 = 0.9960724…`, which F1's JSON and my instrument confirm.

**A7 — Unbacked asymptotic, now backed.**
- **F1's claim.** Finding 2 asserts that `1 − ρ_1` shrinks like `Θ(1/m)` and that `θ/(1 − ρ_1) → 0`, with no `M_0` and no
  remainder. As F1 wrote it, it is descriptive only and is struck as a claim.
- **My critic-derived replacement** (see Remaining obligation, R1). For every class `m`:
  - `11/(25m) ≤ 1 − ρ_1(m) − θ(m) ≤ 13/(25m)`;
  - hence `θ/(1 − ρ_1) ≤ 36/(11m)`.

**A8 — Checked and sound at F1's rows.**
- The closed forms, confirmed by replay and consistent with my literal DP. F1 used the contract's `G` (`G_poly` is
  `(1+2x)^8 + x(1+x)^8`), and CF-C2-G (the swapped `G` in `C2-ALLOCATION.md`) is correctly flagged. The return's own sentence about
  it (§1, "the SAME polynomial under `x ↦` nothing — actually…") is garbled but reaches the right conclusion.
- The tree test.
- Eligibility: `x = p* − 2`. F1 found the least descent below `p* − 1`, which determines `x` exactly. My computation through `α`
  gives the same values.
- `3p* < 2α + 1`.
- F1's leg-count collapse of the Out/In DP is a valid exhaustive optimization. My 45-state DP gives the same optima, 1 and 1.
- The exhaustive `ρ_q` sweep, and `argmin ρ_q = m`.
- Finding 3, which rests on the rules as stated in the contract: sector arcs reach only in-sector targets and one-choke switch
  images, and E1 reaches only `r`-free targets. My literal sector check confirms the sector half.

**A9 — Endpoint, residue and ℕ-subtraction.**
- F1 does not use `m = 107`, and it correctly states that `m ≥ 107` plays no role in a single-row check.
- `m ≡ 2 (mod 3)` enters only through the integrality of `p*`.
- There is no ℕ-subtraction hazard, because every index is at least 570.
- Darroch and Newton are used nowhere, by F1 or by me.

**A10 — Not attacked by F1 (outside its instrument), and not by me.**
- E1's condition (ii), the explicit arc values, and the loads on two-or-more-choke targets on the literal network. These are the
  T3 and F3 charges.
- The Lean kernel receipt of C1-LA1. F1 cites it; I re-derived N8's polynomial but did not rebuild the Lean.

## Mechanism-equivalence and fence check

- **Claims.** F1 proposes no new key. It cites the favorability key, the criterion key, the threshold key, C1-LA1, SR-3, SR-4 and
  Tier 1 at their recorded grades. It upgrades nothing and transfers no status. It keeps OPEN the following:
  - `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`;
  - the primary aggregate;
  - TREE, FOREST, TRANSFER and #993.
- **Fences:**
  - one rank per tree (`p*`), the class only;
  - no refuted mechanism;
  - the census is not presented as proof (the return itself says "not a proof of Tier 1");
  - the `θ*` law is not used as a hypothesis (F1 uses C1-LA1's `θ(m) = 288/L` as an allocation value, not as an optimum);
  - the r30 bounded record is not used as proof.
- **Only fence-adjacent issue.** A3's overreach: "no deficient cut" read as network evidence, when it is conditional on SR-3 and the
  criterion key.
- **Critic-derived statement R1: alias check.**
  - Lexically, the frozen registries (`sources/authority/CLAIM-IDENTITY.json` and the master-494 copy) contain no key with
    CB/switch-image/margin phrasing. The only `MARGIN`/`RESIDUAL` hits are G1/C3 keys.
  - Mathematically, R1 strictly strengthens C1-LA1's conclusion (v), which says only `θ ≤ 1 − ρ_1`. R1 adds an explicit lower bound
    of order `1/m` and an upper bound. It is not an instance of any r30 row key.
  - I checked only these frozen copies. The run-local registry is not in my capsule.
  - Proposed candidate name (a predicate):
    `E993-R31-CB-8-ONE-MINUS-RHO-1-MINUS-SECTOR-THETA-AT-RANK-16M-PLUS-4-OVER-3-LIES-BETWEEN-11-OVER-25M-AND-13-OVER-25M-ON-THE-RESIDUE-2-CLASS-FROM-107`.
  - Status: STATED at review stage. It needs an isolated second read before registration.

## Certification audit

| Literal on F1's face | Evidence shipped | Ruling |
|---|---|---|
| "derived `F_{p*}` … `F_pstar_equals_leafSet: true`" | Instrument tests `Δ_{p*−1}` | **STRUCK** (A1). Restored at 107–137 by the critic. |
| "(WID) from two independent sides … agree exactly" | Same-side double count, flag hard-coded | **STRUCK** (A2). Restored by the critic. |
| "`S` … magnitude 422–526 digits" | That is supply/capacity length; `S` is 420–524 | **CORRECTED** |
| "`x` through `α`" | Least descent searched in `[0, p*−2]`; determines `x` exactly | Accepted (my through-`α` computation agrees) |
| "EXHAUSTIVE … all `q`" | Replayed; exact | Accepted |
| "EXHAUSTIVE over all `9^m`-shaped state space via the DP" | Leg-count collapse, valid | Accepted for `ΣOut`/`ΣIn` only. "Subsumes any structured-family search" is **struck** as a cut-search claim (A3). |
| "`min ΣOut = max ΣIn = 1` exactly" | Replayed, and my 45-state DP agrees | Accepted |
| "load ratio exactly `ρ_1 + θ`, independent of `γ`" | False at `γ = 7` | **STRUCK** (A4) |
| "`θ = 96/(200m²+82m+5)`" | Wrong constant | **STRUCK** (A5) |
| "`1 − ρ_1` shrinks like `Θ(1/m)`", "`θ/(1−ρ_1) → 0`" | No `M_0`, no remainder | **STRUCK** as F1's claim. Replaced by the critic's R1. |
| "No deficient cut at any of the four rows" | Template check plus condition (i) | **NARROWED** (A3) |
| "kernel-checked … degree-9 certificate (N8)" | Citation of C1-LA1 (formally_verified) | Accepted as a citation. The critic re-derived Q: its ten coefficients equal C1-LA1's record exactly. |
| Artifact digests; "byte-identical" replay | Replayed | Accepted |

## Verdict

verdict: retained_narrowed

headline_resolved: no

ELIG_formal: not_advanced

HALL_formal: not_advanced

FAV_darroch_free: not_advanced

cut_candidate: none

**What survives:** F1's return as `bounded_computation`, with no new claim:
- at `m ∈ {110, 116, 119, 137}` the tree, closed forms and eligibility check out;
- the C1-LA1 template satisfies Out, In, Switch and Residual exactly;
- criterion condition (i) holds for every `q`;
- no template or criterion failure was found.

Its selector and (WID) evidence are struck (A1, A2) and now rest on this critic's instrument. The same instrument also covers
control rows 107 and 113 at the correct index. "No cut" is narrowed to a conditional on SR-3 and the criterion key (A3). Four
literals are struck or corrected (A4 to A7). The headline object is untouched: nothing here is `formally_verified` at Tier 1, and
no cut exists.

## Remaining obligation

**R1: critic-derived advance** (attributed to `C-F1-U`; grade `computer_assisted` as a fixed polynomial nonnegativity certificate
under ruling 10; STATED, pending a second read).

For every `m ≥ 107` with `m ≡ 2 (mod 3)`:

`11/(25m) ≤ 1 − ρ_1(m) − 288/(200m² + 82m + 5) ≤ 13/(25m)`.

This means the one doubly-fed class, the `u_i`-switch images, keeps a strictly positive load margin of exact order `1/m`, with
`M_0 = 107`. It also turns F1's "`Θ(1/m)`" into a theorem.

**Proof** (`cert_n8.py`):
1. **The N8 identity.** I re-derived C1-LA1's N8 polynomial `Q(p)` independently, from `r_1` with `m = 3p + 107`. Its ten
   coefficients equal the record exactly. The identity is
   `1 − ρ_1 − θ = X_0·Q(p) / (L·S0·Pd)`, where `S0/X_0 = Σ_j C(7, j) 2^j t_j` and
   `t_j = Π_{s<j} (8p + 286 − s)/(16p + 564 + s)`.
   - I checked it exactly at `p = 0, 1, 2, 3, 4, 10, 50, 333`.
   - I checked against `r_1` directly that `r_1(K) = 2^a S1` and `r_1(K − 1) = 2^a S0`.
2. **Bounds on each factor.** The derivative sign of `(8p + 286 − s)/(16p + 564 + s)` is `24s − 64`. So each factor lies between
   `(286 − s)/(564 + s)` and `1/2`, and therefore inside `[279/571, 143/282]` for every `p ≥ 0`. This gives
   `(1129/571)^7 ≤ S0/X_0 ≤ (284/141)^7`.
3. **Two polynomial certificates.**
   - Lower: `(3p + 107)·Q·141^7 − (11/25)·284^7·L·Pd`.
   - Upper: `(13/25)·1129^7·L·Pd − 571^7·(3p + 107)·Q`.
   - Both are degree-10 polynomials in `p` with all coefficients nonnegative (exact check), so both are nonnegative for `p ≥ 0`.
4. **Corollary.** `θ/(1 − ρ_1) ≤ 36/(11m)`.

The leading-coefficient ratio of `m(1 − ρ_1 − θ)` is `15/32` (the observed values are `0.4545` at 107 and `0.4674` at 1106). The
bounds above are what is proved.

**R2 (the obligation's exact text): open, named, and not an F1 defect.** Tier 1's network evidence at every row still rests on two
`proved_informal` bridges:
- SR-3's template-to-network composition. Its sector half is now also literally corroborated on CB(8, m ≤ 3) by `lit_sector.py`.
- The homogeneous criterion key's E1 flow, whose condition (ii) and explicit arc values F1 did not test on the literal network.

A literal E1 test at a fresh row is still owed: explicit arc values, loads on two-or-more-choke targets, and shared capacity at
switch images. That is T3's and F3's charge.

**R3: instrument hygiene for successors.**
- Every favorability test must evaluate `i_{p+1}(T − ℓ) < i_p(T − ℓ)`, the forward difference of record.
- Every (WID) assertion must compute the aggregate `Σ_F[q_ℓ(p) − q_ℓ(p − 1)]` on its own side, never `S := supply − capacity`.

**R4.** The controller's disclosures index row for F1 should be corrected from "none reported" to the five items listed in the
return.

**Judgment of F1's own `## Remaining obligation`.**
- Items 1 and 2 are now discharged by R1. For item 1, the correct `θ` is `288/L` (A5).
- Item 3 is discharged by CF-C2-G.
- Item 4 is adequately covered by the automorphism argument plus my literal check of three private-leaf representatives per row.
- F1's list omits the real remaining obligation, R2. It is therefore not exact.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-F1-U/`.
All were run with `python3 -B`, standard library only.

| File | SHA-256 | Role |
|---|---|---|
| `crit_f1u.py` | `9b2b4bda7cb6e7da151ec1d17b15c4aec3918caafb87e066056a863df2a3910d` | Critic's own instrument: literal CB DP, `x` through `α`, favorability at the record index, weighted-DP (WID) against the `q`-aggregate, 45-state template DP, `ρ_q`, per-`γ` switch loads |
| `test_small.py` | `b43bb1d1db4905a6e96cbc43dfcb3fa2bff72e12066dd93a3d9e9a742f1b7b6d` | Brute-force validation of the DPs and (WID) on 300 random trees (0 failures) |
| `crit_f1u_out_107.json` | `560b3ea0da26927d359b2489f2ca291da2f9cbf3f525f32337183188ae50c9c4` | Row 107 (fixed point reproduced) |
| `crit_f1u_out_110_113_116_119_137.json` | `55221354bc0e2122e5685661dd60cf2e600946098059a22899c094cadc4b049c` | Rows 110, 113, 116, 119, 137 (the background run, PID 26892, completed) |
| `run_rows.log` | `e9f3b801d6759d08bac64761de74e54bec7b71a164c1905613109681ce06e987` | Console log of that run |
| `cert_n8.py` | `dd94f15b418a1a8b977e7c262dec6aa358baa7d118678e47b6a224d491a9d187` | N8 `Q(p)` re-derivation, exact row identity, R1 certificates |
| `cert_n8_out.json` | `2a6da8b0561559f0be738868d4314f3c6a9a1a1e12f149daeb09919d15cdaf48` | Its output (`Q` equals the record; both certificates nonnegative) |
| `lit_sector.py` | `3eabe3010d7c04d575a3b3913241d1ad0be07024393406f3aab66134999b8b39` | Literal sector-arc check of the template-to-network bridge on CB(8, m′ ≤ 3) |
| `lit_sector_out.json` | `ba9f36b0449479d8186d515a16648346308bdeccd39fd8d62e326e92b435b3df` | Its output (18 configurations, 0 failures) |
| `replay/f1_instr.py` | `4f931ebc2928499c8f65e1f9524d979f40a7ef33f02b8afc6bc18eb9d4210c9a` | Copy-out of F1's instrument |
| `replay/f1_instr_out.orig.json` | `cf300011a0e027326c276ee23dcef1ddf4fb221c98af4b8a074347505f4953b6` | Copy-out of F1's output |
| `replay/f1_instr_out.json` | `cf300011a0e027326c276ee23dcef1ddf4fb221c98af4b8a074347505f4953b6` | Replay output (byte-identical) |

**Replay commands**, from the directory above: `python3 -B test_small.py`; `python3 -B crit_f1u.py 107`;
`python3 -B crit_f1u.py 110 113 116 119 137` (about 160 s); `python3 -B cert_n8.py`; `python3 -B lit_sector.py` (about 52 s);
`cd replay && python3 -B f1_instr.py`.

No background job is running at the time of this write.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5
