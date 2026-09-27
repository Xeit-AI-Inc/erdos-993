# Orientation Adjudication

**Seat:** Stage 5 adjudicator, orientation T (prove), Cycle 4, r30. The run is Erdős #993: correctly weighted mixed-boundary transport for the remaining ordinary-tree favorable-leaf aggregate.

**Portfolio:** returns `T1` (`C4-T-01 CB-FIRST-RANK-COUPLED-ALLOCATION`) and `T2` (`C4-T-02 CB-PATTERN-UNIFORM-CLONE-TRANSPORT`), and their four cross-orientation critiques `C-T1-F`, `C-T1-U`, `C-T2-F`, `C-T2-U`.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full. I loaded no other VerityOS subsystem (memory, decisions, logs, conversations, operations, modules, skills, knowledge).

## Identity and seal audit

**Dispatch and capsule**

- **Dispatch.** `control/dispatch/c4-stage5/DISPATCH-ADJ-T.md` has SHA-256 `134454ed0d026470dfd839038b68da79b9b5cae5881ee9d6e1a744435b7d0203`, which matches the pointer message.
- **Capsule seal (reported value).** `control/c4-adjudicator-capsules/T-PACKET-MANIFEST.json` has seal **`7f3f889021bba8141e693cc93e9a38a05e19bd1842edcfd3ce1557f67bd8d75a`**. I recomputed it as the canonical JSON without `seal_sha256` (sort_keys, `(",", ":")`, no trailing newline); it matches the dispatch.
- **Capsule members.** All **21 of 21** match on SHA-256 and on byte count (`verify_capsule.py`).
- **Protocol path erratum.** The binding protocol, `control/C4-ADJUDICATOR-PROTOCOL.md` (`354ac378…`), names the capsule path as `control/c3-adjudicator-capsules/<T|F|U>-…`. The dispatch names `control/c4-adjudicator-capsules/`, and that is the path that exists and is sealed. I used the dispatched path. This is a literal-path erratum in a sealed file, which I record here and do not edit.

**Stage manifests**

I recomputed each seal with the checker running alone, and it exited 0 (`verify_seals.py`):

| Manifest | Seal | Members |
|---|---|---|
| Stage 2 | `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684` | 1113 |
| Stage 3 | `1ba3f79a404926bb6403df4476fdafbf677953cc1337192cf5d7126fa825b2a9` | 40 |
| Stage 4 (sealed packet) | `c68d4df426b21094774866159814a0dea3c6b6bc16dc437f2b08d869fffa4365` | 60 |

- The six T-orientation members (two returns and four critiques) also match their Stage 3 and Stage 4 manifest entries.
- The critics' `784132f0…` value is the Stage 4 *dispatch* seal. It is not this packet seal. Both are consistent.

**Admissions and controller facts**

- **Stage 3 admission:** 6 of 6 admitted, 0 findings. T1 and T2 are both `headline_resolved: no`.
- **Stage 4 admission:** 12 of 12 admitted, 0 findings. All four T critiques are `retained_narrowed`.
- **Controller facts** (`C4-STAGE5-CONTROLLER-FACTS-T.json`, `89622472…`): I weighed them as one more instrument, never as authority.

**Scratch digests before replay**

Every file I replayed matched the digest in its seat's inventory. That covers:

- `C-T1-U`: `certify.py` `431b153f…`, `localflow.py` `1af2b6ff…`, `simplex.py` `8980c5d8…`, `literal_localflow.py` `8f3ffb50…`, `certify_o3.py` `66a69007…`, and their outputs;
- `C-T1-F`: `cut71.py` `948987ff…`, `step1.py` `ce999756…`, `relief.py` `d15825f4…`;
- `C-T2-F`: `claw_nm.py` `6f338f29…`;
- `C-T2-U`: `claw_nm.py` `7bed97b6…`, `tp_universal.py` `4d818c2a…`.

The critics already replayed the T1 and T2 generators byte-identical, and each critique records that. I did not re-replay them; my own instruments replace them where it matters.

**Model disclosures on the faces**

| Seat | Chartered | Runtime id |
|---|---|---|
| T1, T2 | sonnet/xhigh | `claude-sonnet-5` |
| Four critics | opus/medium | `claude-opus-5-5[1m]` |

All are consistent with the allocation's seating.

**Read-boundary and process disclosures (mine)**

1. **Host injection.** The host put the project `CLAUDE.md` and the user memory index into my context at start. I did not open them or act on them beyond the boot the dispatch requires. `CLAUDE.md`'s conversation-logging instruction was not followed, because the dispatch restricts my writes to this file and my scratch.
2. **T1's return.** The host saved the display of T1's `RETURN.md` to a tool-results file under `~/.claude/projects/…/tool-results/`, and I read it there. That file was written by the harness, not by me, and its content is the capsule member.
3. **Capsule members read.** I read in full: both contracts, the protocol, the allocation, the Stage 1 gate, the admissions, the controller facts, the path check, the Stage 3 disclosure record, the two returns and the four critiques.
   - The Stage 3 disclosure record summarises every seat's disclosures, including other orientations'. It is a capsule member.
   - From the Stage 4 disclosure record I printed only the T-critic entries and the process flags.
   - The Stage 2, 3 and 4 manifests were parsed with `json` for seal recomputation. I printed the Stage 3 and 4 member path lists, which include other seats' file names. I did not open any of them.
   - `SOURCE-DIGESTS.json` was checked only as a whole-file capsule digest.
   - No file under `sources/` was read.
4. **Listings.** I ran non-recursive `ls` on these granted scratch directories: `c4-T1/`, `c4-T2/`, `c4-crit-T1-U/` (with `-la`, which shows its `..` line), `c4-crit-T1-U/own/`, `c4-crit-T1-F/` and `own/`, `c4-crit-T2-U/own/`, and `c4-crit-T2-F/own/`. I also ran one names-only `ls` of `cycles/cycle-4/stage5/adjudicators/`; it contained only my own `T/`, which I had just created. I ran no `find`, `grep`, `rg` or recursive listing above my grant. Two `find` calls were scoped to my own scratch, as a bytecode check.
5. **Copying.** Copy-out used `cp <granted dir>/own/* <my scratch>`. That is a glob, but it sits inside granted directories.
6. **Critic code imported.** `dump_cert.py` and `adj_lab_search.py` import `C-T1-U`'s copied-out `localflow.py` and `simplex.py`, as a **search device only**. The certificate is checked by my own `adj_verify_cert.py`.
7. **Refused stray write.** One redirect I wrote badly resolved to `/out_recheck.txt`. The OS refused it (`permission denied`), nothing was written, and `ls /` confirms no such file. I reran the command correctly inside my scratch.
8. **Runtime hygiene.** No network, no installs, no Lean or lake. Everything ran with `python3 -B` in the foreground; no background job was ever started, so there is nothing to kill. No `__pycache__` or `.pyc` exists in my scratch.

**Seat process flags weighed**

- T2 ran a prohibited `ps aux` full listing, which exposed F1's and F2's command lines. The return contains no F1 or F2 content (both T2 critics concur), so I find no evidence contamination.
- `C-T1-U` and `C-T2-U` each had one run auto-backgrounded and killed it by literal PID. `C-T2-U` found its PID with `pgrep -f`, a pattern query that killed nothing. Nothing is contaminated.
- Several critics used a single-file `grep` or a heading `grep` on capsule members. None is material.

## Route-by-route decisions

### T1 — `C4-T-01 CB-FIRST-RANK-COUPLED-ALLOCATION`

**Verdict: retained, narrowed. Typed verdict `bounded_evidence` (the central obligation (a) is not proved by T1). `headline_resolved: no`.**

T1 correctly says it did not prove (HALL-COND) at the three first ranks. Every positive claim of its own is narrowed or struck.

**Fidelity (ruling 17/24; SOLUTION-CONTRACT §3.3): fails on T1's face.**

- `F_p` is hard-coded (`cb_type_analysis.py` line 189, `F_all_leaves`).
- `supply − capacity = S` is asserted nowhere.
- Both critics found this independently, and the controller records it (CF-3).
- **Every weight-dependent T1 number (the sector weight 1, the switch-target weight `ℓ`, `C_1^V`, and the stuck/bad/cornered counts) is struck as T1-backed evidence.**

**Repair (critic-derived, three instruments).** `F_p` = all leaves and `S < 0` were derived at all five rows by:

- `C-T1-F`: incidence count plus the `q_v` forest DP;
- `C-T1-U`: generic DP plus closed forms;
- my own `adj_verify_cert.py`: `F_p` from `Δ_p(T − leaf)` on the original tree, `x` scanned through rank `α`, and `supply − capacity = S` asserted from two sides (deletion polynomials of `H_v` and `R_v` against a direct count of (set, active-tag) incidences).

| Row | `|F_p|` | `S` digits | supply digits |
|---|---|---|---|
| `CB(8,86)/460` | 689 | 328 | 330 |
| `CB(8,89)/476` | 713 | 340 | 342 |
| `CB(8,92)/492` | 737 | 351 | 353 |
| `CB(8,108)/577` | 865 | 413 | 415 |
| `CB(7,144)/673` | 1009 | 483 | 485 |

These equal `C-T1-U`'s values. The retained numbers therefore stand **on the critics' and this adjudicator's derivation**, not on T1's.

**Rulings on T1's claims**

1. **Step 1, the "uniform-deletion saturation lemma" (general in `d, m, K`; outflow `(p−1)/p`): STRUCK as stated.**
   - The in-sector deletion graph is `(K, 2(M−K+1))`-biregular, so the uniform outflow is `R_{K−1}/R_K`. That equals `(p−1)/p` iff `3p = 2M + 4`.
   - At the (O3) rows, where `3p = 2M + 3`, the outflow is `288/289` and `336/337`.
   - The scheme exceeds unit supply at 56/58/60 of the eligible ranks of the three `CB(8,·)` rows, and at 71 and 95 of the (O3) rows' ranks (`C-T1-F` `step1.py`, which I replayed byte-identical).
   - My instrument confirms `3p − 2M = 4, 4, 4, 3, 3` and `R_K/R_{K−1} = 460/459, 476/475, 492/491, 289/288, 337/336`.
   - The narrowed remark (at `3p = 2M + 4`, uniform deletion fills every in-sector target and leaves each sector source `1/p` short) is a restatement of the (NM) biregular bound and of the registered deficit `R_K/p`. **It registers nothing.** Both critics and CF-T5 agree.
2. **Step 2 margins:** replaced by the reachable-only (`1 ≤ ℓ ≤ d−1`) values **33.33 / 34.49 / 35.65**, as both critics found.
   - T1's "`Δ` digits 327/339/350" are `R_K`'s digit counts. The correct `Δ` digit counts are **325 / 336 / 347** (`C-T1-U`; confirmed by my instrument).
   - This remains a necessary condition for `X = sec` only.
3. **Step 3, the stuck/bad/cornered characterisations:** correct as properties of the *uniform* allocation, and both critics confirmed the exact integers independently.
   - They are **not Hall obstructions**:
     - the switch-dead families have shadow ratios of 16.5–45.6 (`C-T1-F`);
     - the all-stuck family has shadow ratio 16.52 / 17.07 / 17.61 (`C-T1-U`);
     - a non-uniform choke-local allocation absorbs them outright (§Cross-route reconciliation).
   - The counts are `bounded_computation` on the critics' `F_p`. They register nothing.
4. **Struck literals, on the certification audits of both critics, which agree:**
   - "18–20 orders of magnitude at each level" (the stuck → bad step is about 2 orders);
   - "strong quantitative evidence for the reduced-capacity sector Hall";
   - "11 small instances" and "6+11" (the shipped code runs 7 distinct trees);
   - "100% exact match at every weight class `ℓ`";
   - "no alias exists, lexically or mathematically";
   - "`ρ_1` reproduced from SEMANTIC-CONTRACT's `r_q(k)` formula" (the contract has no such formula; the source is E1's record).
5. **Obligations.** (a) is not proved by T1. (b), the reduced-capacity validation, was not run by T1. (c), the (O3) rows, was not attempted by T1. (d) T1 found no (CUT).

**Plateau letters (T1's own face): none of (a)–(d).**

### T2 — `C4-T-02 CB-PATTERN-UNIFORM-CLONE-TRANSPORT`

**Verdict: retained, narrowed. Typed verdict `bounded_evidence`. T2's claimed `proved_informal` route verdict is STRUCK: its one load-bearing discharge fails. `headline_resolved: no`.**

1. **Obligation (c), the "discharge" of C1 by Theorems C2/C3: STRUCK (wrong poset).**
   - C1's lemma lives on the product of **claws** `Π K(q_i)`, whose rank sizes are the elementary symmetric functions `e_k(q)` and whose top rank is `M`. The allocation says "claw products" (item 2(c), standing-state bullet), and CF-T3 agrees.
   - T2 proves a deficiency bound on products of **chains**, and its code redefines `e_k` as chain rank sizes.
   - I checked the rank sizes independently:

     | `q` | Claw product | Chain product |
     |---|---|---|
     | `(2,2)` | `1,4,4` | `1,2,1` |
     | `(3,4,2)` | `1,9,26,24` | `1,3,5,6,5,3,1` |
     | `(3,4,5)` | `1,12,47,60` | `1,3,6,9,11,11,9,6,3,1` |

   - The uniform fixed point `|R_j| = 2^j·C(736, j) = e_j(2,…,2)` is a claw-product count.
   - C2 and C3 are correct chain-product theorems (the de Bruijn–Tengbergen–Kruyswijk decomposition and a corollary). They have **no run consumer** and must not be registered as C1's discharge or as an (NM) scope note. Both critics agree.
2. **Obligation (a), "the E1 criterion holds at every eligible `(d,m,p)`": REFUTED as stated** (`bounded_computation`, three instruments agree exactly).
   - Log-concavity does not give condition (i) at a fixed eligible rank.
   - Failure tallies over eligible ranks of `CB(d,m)`, `d ≤ 8`:

     | Range | Eligible rows | Rows failing (i) | Source |
     |---|---|---|---|
     | `m ≤ 12` | 210 | 46 | `C-T2-U` |
     | `m ≤ 15` | 364 | 90 | `C-T2-F` |
     | `m ≤ 30` | 1758 | 520 | `C-T2-U` |
     | `16 ≤ m ≤ 40` | 2903 | 918 | `C-T2-F` |

   - My `adj_t2_counts.py` reproduces **every one of these tallies exactly**. The critics' apparent disagreement was only one of ranges.
   - Every failure is a condition-(i) failure with `d ≤ 5`. The first is `CB(1,7)/10`.
   - Twenty `(d,m)` pairs with `m ≤ 15` fail at every eligible rank, as `C-T2-F` says. With `m ≤ 40` there are 70 such pairs (my count).
   - There are 0 failing rows with `d ≥ 6` (`m ≤ 40`, my count).
   - "Condition (i) proved in full generality" and "3,948 zero-counterexample checks" are STRUCK. The sweep never computed eligibility.
3. **The §7 "worst ratio" column: STRUCK and corrected.** It reported the *minimum* `ρ`. The binding maximum at `G(8^82, 7^2)` is **0.995530 at `p = 448`**, attained at `(q, D_Q) = (1, 7)`, and 0.668509 at 503 (0.684484 at 500).
   - Both critics give these values, and my instrument reproduces all of them.
   - The heterogeneous criterion holds at **all 56** eligible ranks 448–503 (two critics plus me). `(ii)` holds literally at 448 for all 248 pairs.
   - The "monotone-once-true" small heterogeneous corroboration is STRUCK as eligibility-blind (`C-T2-F` A5).
4. **The heterogeneous E1 reduction (§7):** STATED on T2's face. No proof is written beyond the bookkeeping of `(a_Q, b_Q)`, and I resolve the grade in that direction in the reconciliation below. **It is now proved by the adjudicator's written reconstruction** (§Established results, E1-R), conditional on CD-1.
5. **Log-concavity (§6.1)** was cited from memory (Newton/Rolle). Both critics repaired it with the same elementary three-term expansion. It is retained at `proved_informal` as a lemma about `(1+y)^a(1+2y)^b`. It does not yield condition (i).
6. **§13 WID instrument:** fidelity passes. `F_p` is derived, and `supply − capacity = S` is checked from two sides on 34 rows. `CB(1,7)/10` gives 29190 / 58002 / −28812, confirmed by both critics. The attribution "fixed point on the record (SEMANTIC-CONTRACT §1.2)" is STRUCK; no such row exists there.
7. **Proposed keys.**
   - `E993-R30-CHAIN-PRODUCT-RANK-SHADOW-DEFICIT-BOUND`: **do not register.** It is classical and has no consumer; registering it would be a false alias of the claw lemma.
   - `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION`: this names an object, not a predicate (ruling 33). If it is registered, it must be renamed as below (§Established results).

**Plateau letters (T2's own face): none of (a)–(d).**

## Cross-route reconciliation

Critic disagreements are resolved claim by claim below. Replays are weighed over self-reports.

**R1. Is the open step of T1's object (Cycle 3's reduced-capacity sector Hall "A4") closed at the rows?**

- `C-T1-F` (A5) says it is not closed. Its capped max-switch flow with **uniform** deletion leaves possible overloads on targets with at most two usable chokes, about 2–5×10⁻⁵ of the layer.
- `C-T1-U` (A8) says it **is** closed. Its choke-local, non-uniform deletion allocation needs no rerouting.
- **Ruling: `C-T1-U` prevails at the five rows. `C-T1-F`'s A5 is correct but is a strictly weaker construction, superseded.** There is no contradiction: A5 shows only that its own uniform-deletion rule leaves an overload. My evidence:
  1. I replayed `certify.py`, `certify_o3.py` and `literal_localflow.py`, and all three are **byte-identical** to the shipped outputs.
  2. **Independent instrument (`adj_verify_cert.py`, my code).** I took the certificate values found by `C-T1-U`'s LP (a search device only; dumped to `cert_values.json`, `f16526bd…`) and checked all five rows by an **affine-separation proof**:
     - `Out(β,γ) ≥ a + λ(β+γ)` for every one of the 45 (36 for `d = 7`) choke states, with `m·a + λK ≥ 1`, so every sector source has outflow at least 1;
     - `In(β,γ) ≤ a₂ + λ₂(β+γ)` with `m·a₂ + λ₂(K−1) ≤ 1`, so every in-sector target has inflow at most 1;
     - a separate knapsack DP gives the exact values, min source outflow = 1 and max in-sector target inflow = 1;
     - all values are `≥ 0`;
     - `(d − g)·σ(g) ≤ θ*·g` for every `g`;
     - `θ* ≤ 1 − ρ_1`, with `ρ_1` by explicit binomial sums.

     The margins `(1 − ρ_1)/θ*` are **28.06 / 29.04 / 30.02 / 10.60 / 12.91**.
  3. **Choke-locality, the only non-computational step, verified literally by me** (`adj_e1_lab.py`). On 16 laboratories (7 homogeneous and 9 heterogeneous CB patterns), with **random** `φ_b, φ_c, σ` values:
     - the literal sector outflow equals `Σ_chokes Out(state)`;
     - the literal in-sector inflow equals `Σ_chokes (d_i − |y_i|)(φ_b(y_i+b) + φ_c(y_i+c))`;
     - every positive-weight exit of a sector source is either an in-sector deletion target of weight 1 or a `u_i`-switch image of weight `γ_i` (with `β_i = 1`);
     - the `s`-switch and the deletions of `r` or `v` have weight 0.
  4. **Consistency with `C-T1-F`'s own instrument.** The whole-sector lower bound on the switch share, `θ_whole = (R_K − R_{K−1}) / Σ_{reachable images} w`, is 1.6316e−4 at 460. That equals `C-T1-F`'s `κ_whole/(p − 1) = 0.0749/459`, and `(1 − ρ_1)/θ_whole` reproduces `C-T1-F`'s 33.33×. The certificate's `θ*` exceeds `θ_whole` by a factor of 1.13–1.19 at all five rows (`adj_theta_lower.py`), as any valid certificate must. So the two critics' instruments agree, and `C-T1-F`'s "the whole sector binds" is borne out: the certificate is within 19% of the whole-sector bound.

**R2. Does E1 load the sector switch images at `ρ_1·w` and in-sector targets at 0?** `C-T1-U` could not read E1's text.

- CF-T1 quotes E1's registered load clause verbatim, and it says exactly this.
- I do not rest on the controller's quotation alone. I **reconstructed E1** from the definitions (§Established results, E1-R): E1 is the mark-clone reduction composed with the claw-product normalized flow.
- I validated the reconstruction literally on 16 laboratories, 9 of them heterogeneous. With target capacities set **exactly** to `ρ_Q·w_F(A)` on `r`-free targets with `q ≥ 1`, and 0 elsewhere:
  - the non-sector deletion-only max-flow saturates every source;
  - total capacity equals total supply on every laboratory, so saturation forces the exact load profile.
- **Ruling: the load profile is confirmed** at `proved_informal` (the reconstruction; conditional on CD-1) and by laboratory replay.

**R3. The universal E1 criterion.** `C-T2-F` and `C-T2-U` agree that it is refuted. Their counts differ only by range, and my instrument reproduces every tally exactly. Agreed.

**R4. Condition (ii) of E1.**

- `C-T2-U` (CD-2) says it holds identically.
- `C-T2-F` leaves it "untouched", but found no failure of it.
- This is not a contradiction. **Ruling: CD-2 is correct.** I checked the proof line by line:
  - `P_q = K(1)^a × K(2)^b` is a claw product;
  - the CD-1 normalized flow couples uniform rank `j` with uniform rank `j − 1` so that `α` drops by 0 or 1;
  - that gives `P(α_j ≤ α) ≤ P(α_{j−1} ≤ α)`, which is TP-g, and `P(α_j ≤ α) ≥ P(α_{j−1} ≤ α − 1)`, which is TP-h.
- Evidence: `tp_universal.py` was replayed byte-identical (0 failures in 543,120 checks), and my own literal check found 0 failures in 4,111 checks.
- My reconstruction E1-R independently explains **why** (ii) is superfluous: a normalized flow exists outright.

**R5. The grade of the heterogeneous reduction.**

- `C-T2-F` grades it `proved_informal`, conditional on the inherited Steps 3–5.
- `C-T2-U` grades it STATED: nothing is written, and the per-target single `ρ_Q` is not shown.
- **Ruling: STATED on T2's face**, because neither critic nor I can read SR-C3-3, and T2 wrote no step. `C-T2-U` prevails.
- **E1-R supplies the missing written proof.** In the mark-clone reduction, a deletion arc never removes a choke, so a target `A` has the same `Q` as every source that reaches it, and its load is the single value `ρ_{Q(A)}·w_F(A)`. It is adjudicator-derived and STATED, and it needs a second read.

**R6. CD-1, the claw-product normalized matching.**

- `C-T2-F` and `C-T2-U` each proved it independently, with the same product-step induction.
- I verified both proofs in full:
  - the inflow identity `E_{k−1}(N_k + cN_{k−1}) − cN_{k−2}E_k = E_kN_{k−1}`;
  - `γ ≥ 0 ⟺ N_{k−1}² ≥ N_kN_{k−2}`;
  - preservation of log-concavity through `E_k = N_k + cN_{k−1}`;
  - the edge cases `k = 1` and `k = M`.
- Both `claw_nm.py` scripts replayed byte-identical: 251 cases and 1,080 families for `C-T2-F`, 248 + 75 + 8,549 for `C-T2-U`, with 0 failures.
- They agree. **This is the strongest mathematical item in the orientation.**

**R7. `C-T1-F` A7, the laboratory counterexample to the "on trees `S ≤ 0` ⇒ saturation" conjecture at `CB(7,1)/6`.**

- I replayed `cut71.py` byte-identical: supply 924, capacity 945, max-flow 903, and a cut `X` of 546 sector members against `Σ_{N(X)} w = 525`, a deficit of 21.
- The controller replay (CF-0) agrees.
- The row is **not eligible** (`p = 6 < x + 2 = 8`). It refutes only the conjecture, at `conjecture` grade, and it is **not a (CUT)**. It is F2's object; I route it there.
- It is consistent with `C-T1-U`'s finding that the local LP is infeasible at `CB(7,1)/6`.

**R8. The composition to whole-row (HALL).**

CF-T2 derived it, conditional on (1)–(3). I adjudicate each condition:

1. `C-T1-U`'s certificate now has **two instruments**: `C-T1-U`'s DP and my affine-separation proof plus DP.
2. The E1 criterion at 460 / 476 / 492 is the D1 record (`computer_assisted`), reproduced by my instrument: max over `q` of `ρ_q` is 0.994562 / 0.994745 / 0.994916, at `q = 1`, and (ii) holds literally.
3. The isolated second read is **still owed**.

**New (adjudicator): E1's criterion also holds at the (O3) first ranks** `CB(8,108)/577` (max `ρ_q` 0.997396) and `CB(7,144)/673` (0.998510), both at `q = 1`, with (i) and (ii) literal. D1 does not cover those rows, and this is the first computation on record. So the composition extends to those two rows, with a single instrument on the criterion there.

## Established results

Grades follow SOLUTION-CONTRACT §4. "Critic-attributed" and "adjudicator-derived" items are STATED at a review stage and need an isolated second read before registration.

**E-1. The sector certificate at five rows** (critic-attributed to `C-T1-U`; `computer_assisted`; two instruments).

- *Statement.* At `CB(8,86)/460`, `CB(8,89)/476`, `CB(8,92)/492`, `CB(8,108)/577` and `CB(7,144)/673`, `F = F_p` is derived as all leaves. There is a nonnegative rational flow on literal (D) ∪ (S) arcs from the root-plus-arm sector such that:
  - every sector source is saturated (weight 1);
  - every in-sector target (weight 1) is loaded at most 1;
  - every `u_i`-switch image (weight `ℓ = γ_i ≥ 1`) is loaded at most `θ*·ℓ`, with `θ* = 96/495419, 96/530501, 96/566783, 16/65097, 16/138633`.
- *Hypotheses consumed:*
  - eligibility (derived);
  - `F_p` derived at rank `p` (needs `v ∈ F` and every private leaf in `F`);
  - the explicit tree `CB(d,m)`, where `IsTree` enters only through its adjacency: `r`'s neighbours are `s` and the chokes, and the legs are pendant `P_2`s;
  - finiteness. No invariance is used.
- *Proof.* Choke-locality (literally verified; elementary), then the affine-separation certificate (exact rationals).
- *Proposed name* (ruling 33: it must carry its row scope): `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-SECTOR-SATURATES-WITHIN-RESIDUAL-SWITCH-CAPACITY`. Without its five-row hypothesis the name would read as universal, which is unverified. I checked it against the key names visible in my capsule and found no clash. The full `alias_patterns` check is the synthesis's.

**E-2. Full (HALL), with switch arcs load-bearing, at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`** (critic-attributed composition, `C-T1-U`; derived by the controller in CF-T2; verified by the adjudicator; `computer_assisted`; **STATED, pending an isolated second read**).

- *Proof.*
  1. Superpose E-1 with E1's flow. E1 saturates every non-sector source, loads each `r`-free `q ≥ 1` target at `ρ_q·w`, and loads every other target at 0.
  2. Target loads are then:
     - at most 1 on in-sector targets;
     - at most `(ρ_1 + θ*)·ℓ ≤ ℓ` on switch images;
     - `ρ_q·w ≤ w` on other `r`-free `q ≥ 1` targets;
     - 0 elsewhere.
  3. The result is a saturating fractional flow. By the elementary flow ⇒ Hall count (for every `X`, `Σ_X w = Σ_{B∈X} Σ_A f ≤ Σ_{N(X)} w`), (HALL-COND) holds for every `X`. An integral saturating flow follows by max-flow integrality ((HALL⇒FLOW)).
- *Switch arcs are load-bearing:* `Σ_sec w = R_K > R_{K−1}` is the entire positive deletion neighbourhood of `sec`.
- *Weakest input:* D1, the criterion at those ranks (`computer_assisted`); E1 is `proved_informal`. The composition is therefore `computer_assisted`.
- *Fences:* three finite instances. This is not (HALL), not parameter-uniform, and not the aggregate.
- *Proposed name:* `E993-R30-THREE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`. It would be a (HALL) scope note and a SEPARATE key.

**E-2′. The same at `CB(8,108)/577` and `CB(7,144)/673`** (adjudicator-derived extension; `computer_assisted`; STATED). The E1 criterion at those two first ranks rests on **one instrument (mine)**. It needs a second instrument and a second read before it joins E-2.

**CD-1. Heterogeneous claw-product normalized matching** (critic-attributed to `C-T2-F` and `C-T2-U`, two independent proofs; verified in full by the adjudicator; **`proved_informal` candidate**).

- *Statement.* For `q_1, …, q_M ≥ 1` and `P = Π K(q_i)`, ranked by the number of non-bottom coordinates:
  - for every `1 ≤ k ≤ M` there is a normalized flow on the covers from `L_k` to `L_{k−1}`;
  - hence `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)` for every `X ⊆ L_k`;
  - and `max_X(|X| − |∂X|) = max(0, e_k − e_{k−1})`.
- *Hypotheses:* finiteness and `q_i ≥ 1`. No tree and no eligibility.
- This is exactly the lemma named in the allocation (standing-state bullet "`conditional`: C1"; item 2(c)).
- **C1's promotion from `conditional` still needs one more check:** a second reader holding SR-C3-5c must confirm that C1's poset is this claw product and that this lemma is C1's only missing ingredient. SR-C3-5c is outside my capsule. The capsule evidence (the allocation's wording, CF-T3, and the fixed point `e_j(2,…,2)`) is consistent.
- *Proposed name* (critics'; true as a predicate): `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`.

**CD-2. The type-path conditions of E1 hold identically** (critic-attributed to `C-T2-U`; verified; `proved_informal` candidate).

- Statement: for every `a ≥ 0`, `b ≥ 1` and `j ≥ 1`, TP-g and TP-h hold. The E1 criterion is therefore equivalent to `max_q ρ_q ≤ 1`, and in the heterogeneous form to `max_{(q, D_Q)} ρ_Q ≤ 1`.
- It depends on CD-1.
- Proposed name: `E993-R30-CB-MARK-CLONE-TYPE-PATH-CONDITIONS-HOLD-IDENTICALLY`.

**E1-R. E1 is the claw-product normalized flow applied to mark clones** (adjudicator-derived; STATED; `proved_informal` candidate, conditional on CD-1).

*Setting.* Let `T` be a heterogeneous CB pattern: path `r–s–v`, chokes `u_i ~ r` with `d_i ≥ 1` supports `b_{ij} ~ u_i`, and private leaves `c_{ij} ~ b_{ij}`. Write `D = Σ d_i`. Let `F` contain every private leaf.

*Step 1: which sources carry weight.* For a non-sector source `B`:

- if `r ∈ B` (the R0 class), then `w_F(B) = 0`;
- if `B` is `r`-free with choke set `Q`, then `w_F(B) = #{c ∈ B : choke(c) ∈ Q}`, because `v` is inactive (`W_v = {r}`) and `W_{c_{ij}} = {u_i}`.

*Step 2: the mark-clone correspondence.* For `|Q| = q ≥ 1` and a mark `x = c_{ij}` with `u_i ∈ Q`, the `r`-free sets with choke set `Q` that contain `x`, at size `p + 1`, correspond bijectively to layer `j = p − q` of `P_Q = K(1)^{D_Q − 1} × K(2)^{D − D_Q + 1}`:

- the other in-choke private leaves are Boolean coordinates;
- the out-choke legs `{∅, b, c}` and the arm `{∅, s, v}` are ternary coordinates.

Deletion arcs that remove neither a choke nor `x` are exactly the covers of `P_Q`.

*Step 3: the flow.* Take the CD-1 normalized flow at level `j` of `P_Q`, scaled by `r_Q(j)`, for each clone `(B, x)`. Each clone emits 1, so `B` emits `w_F(B)`. Each target clone `(A, x)` receives `r_Q(j)/r_Q(j − 1) = ρ_Q`. Since `A` keeps `Q`, every active mark of `A` lies in `Q`, and `A` receives exactly `ρ_Q·w_F(A)`. Every other target receives 0.

*Conclusion.* If `ρ_Q ≤ 1` for every achievable `(q, D_Q)`, then (HALL-COND) holds for every `X ⊆ I_{p+1} ∖ sec`. This proves E1 and its heterogeneous extension with the criterion reduced to (i), and it independently re-derives CD-2's consequence.

*Hypotheses consumed:* the explicit CB adjacency (`IsTree` through `W_v = {r}` and `W_c = {u_i}`), `F ⊇` the private leaves, and finiteness. No eligibility and no invariance.

*Evidence:* literal exact-load max-flow on 16 laboratories, 9 of them heterogeneous (`adj_e1_lab.py`; `bounded_computation`).

*Name.* If registered, it should be a scope note on E1 or the renamed predicate `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`. It is not an alias of E1, which is uniform-`d` only. It extends E1.

**Bounded records**

These are retained at `bounded_computation` or `computer_assisted`, never proof:

- the E1 criterion at all 56 eligible ranks of `G(8^82, 7^2)` (max `ρ` 0.995530 at 448, at `(1, 7)`);
- the refutation tallies of R3;
- T1's stuck/bad/cornered integers, on `F_p` as derived by the critics;
- the reachable-only margins 33.33 / 34.49 / 35.65;
- `ρ_1` at the three rows: `460421124882845/462938713343604`, `1698319298589907/1707291739633300`, `4838946572060835/4863675235331932`.

**Classical facts retained with no run consumer:**

- T2's C2/C3 (products of chains);
- log-concavity of `(1+y)^a(1+2y)^b`, with the proof repaired.

## Rejected and narrowed mechanisms

- **T1 Step 1: struck.** Narrowed to a remark at `3p = 2M + 4`. It restates (NM) and `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`, registers nothing, and re-proves a settled fact.
- **T1's "hierarchy as evidence for A4": struck.** A4 is decided at the rows by E-1, not by the hierarchy.
- **T1's remaining obligation 1** (the cornered-source multi-hop gap) is an artifact of the uniform rule and is **superseded** by E-1 at the rows.
- **T2's C1 discharge: struck** (wrong poset). The discharge now rests on CD-1.
- **T2's universal E1 criterion:** **refuted as stated** at eligible rows with `d ≤ 5`. E1 remains a SUFFICIENT criterion, and its failure implies no deficient cut.
- **T2's "condition (ii) resists; attack via SR-C3-3's machinery":** superseded, since (ii) holds identically (CD-2).
- **Conjecture B1** (the criterion holds on a final segment of `p`): stays `conjecture`. It has 0 reversals at eligible ranks (`C-T2-F`). It is never evidence.
- **The Cycle 3 conjecture C-U2-F ("on trees `S ≤ 0` ⇒ saturation"):** its universal form is refuted at the **non-eligible** laboratory `CB(7,1)/6`, a deficit of 21 (`C-T1-F` A7, replayed; controller CF-0 concurs). This is not a (CUT), and it is routed to F2.
- **Refuted-mechanism check.** No mechanism in the portfolio revives any of the ten refuted keys.
  - **E1, E1-R and T2 §7 versus `E993-R23-LITERAL-DELETE-ONLY-HALL`.** These are deletion-only, but they cover non-sector families only, use the active weight `w_F`, and are gated by a criterion. The refuted key is unweighted and ranges over the complete top side. Its witness, the sector cut of `CB(8,92)`, is exactly the family E1 excludes, and at that row the sector is served through switch arcs (E-1).
  - **E-1 and E-2** use literal (D) ∪ (S), the literal `w_F`, and capacities `w_F`. They are not own-support unit capacity (C6-F4), per-leaf injectivity, occupancy domination, signed cross-tag or covariance mechanisms. The closest template is (SW).
- **Fences.** No census value enters a proof. The certificate is an exact finite verification at named rows, not a census. There is no RTree wording, and no closed region is re-proved. (LIFT) is not used for feasibility, and `D, C ≥ 0` is not used as a budget.

## Lean readiness

My orientation shipped **no Lean**: no compiled fragments, no build logs and no `#print axioms` outputs to confirm. The rulings below are about whether each award group is ready.

| Award group | (a) complete informal proof, closed DAG | (b) compiled fragments | (c) named open nodes | Contract-ready for Cycle 4 Stage 7? |
|---|---|---|---|---|
| (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` | already `formally_verified` (C1-LA1; `Main.lean` `86b59c6c…`) | carried byte-identically by every later award | none | Nothing to award. T carries no new WID work. T2 §13 and my verifier use it correctly as a fidelity assertion. |
| **G-T-CLAW** (CD-1) | **yes**, two independent proofs, verified. DAG: N1 log-concavity preserved by `E_k = N_k + cN_{k−1}` (three-term expansion); N2 positivity of `e_k` on `[0, M]`; N3 product-step normalized flow (explicit `α, β, γ` or `λ`); N4 induction on `M`; N5 flow ⇒ `|∂X|e_k ≥ |X|e_{k−1}` (double count); N6 deficiency corollary | none | none mathematically. Lean-side: all of N1–N6, plus a definition layer for claw-product layers and covers, which has **no definition of record** in C1-LA1, C2-LA1 or C3-LA1 | **No.** It is STATED at a review stage (the second read is owed), has no fragments, and lacks the definition layer. It is the orientation's **best Cycle 5 Lean target**: pure finite combinatorics, no tree, rational flow, induction. |
| **G-T-E1R** (E1-R + CD-2) | yes, conditional on CD-1. DAG: N7 mark-clone bijection with `P_Q` layers on the frozen `indepFamily`/`activeWeight`; N8 load computation; N9 flow ⇒ Hall (B7-type) | none | N7 needs a tree-side encoding (analogous to U1's (NM) N1) | **No** (second read owed; N7 encoding open). |
| **G-T-HALL5** (E-1, E-2, E-2′) | a finite certificate, not a proof schema | none | — | **Never.** A bounded result never qualifies. A Lean check would need an enumeration-scale `decide`, which is forbidden for a universal step. |

**Draft statement for G-T-CLAW** (for the synthesis to freeze; new declarations in `E993Transport`):

```lean
-- claw product: coordinate i is `none` (bottom) or `some a`, a : Fin (q i); rank = #non-bottom coordinates
def clawRank {M : ℕ} {q : Fin M → ℕ} (x : ∀ i, Option (Fin (q i))) : ℕ := (Finset.univ.filter fun i => (x i).isSome).card
def clawLayer (M) (q : Fin M → ℕ) (k : ℕ) : Finset (∀ i, Option (Fin (q i))) := Finset.univ.filter fun x => clawRank x = k
def clawShadow (M) (q : Fin M → ℕ) (X : Finset (∀ i, Option (Fin (q i)))) : Finset (∀ i, Option (Fin (q i))) :=
  Finset.univ.filter fun y => ∃ x ∈ X, ∃ i, (x i).isSome ∧ y = Function.update x i none
theorem clawProduct_normalizedMatching (M : ℕ) (q : Fin M → ℕ) (hq : ∀ i, 1 ≤ q i) (k : ℕ) (hk1 : 1 ≤ k) (hkM : k ≤ M)
    (X : Finset (∀ i, Option (Fin (q i)))) (hX : X ⊆ clawLayer M q k) :
    X.card * (clawLayer M q (k - 1)).card ≤ (clawShadow M q X).card * (clawLayer M q k).card
```

- *Guards:* `k − 1` in ℕ is guarded by `1 ≤ k`.
- *Fences:* this is an abstract poset lemma. It is not (HALL), not (NM)'s tree-side statement, and not C1 until SR-C3-5c's reduction is confirmed.
- *Carried fragments:* none needed.

**What is not ready, and the smallest unproved lemma on the T line.**

- **Formally:** every node of G-T-CLAW.
- **Mathematically, toward (HALL) on an infinite family:**
  - **(L-i)** a proved bound placing `p − q` at or above the mode `t*(qd − 1, d(m−q) + 1)` of `(1+y)^{qd−1}(1+2y)^{d(m−q)+1}` for every `q ∈ [1, m]` and every eligible `p`, on a stated class. Evidence for `d ≥ 6`: 0 failures in the rows computed so far, which is only a conjecture. The bound is false for `d ≤ 5`.
  - **(L-S)** a closed-form, parameter-uniform choke-local sector certificate with `θ ≤ 1 − ρ_1` at the sector-deficient eligible ranks (`3p ≤ 2dm + 4`) of that class.

## Progress and plateau assessment

material_progress: yes
orientation_plateau: no

**Ruling-30 letters for orientation T** (CF-4), by letter:

- **(a)** A parameter-uniform restricted-scope (HALL) theorem on an infinite eligible family: **not supplied.** CD-1, CD-2 and E1-R are parameter-uniform lemmas at the level of non-sector families only. The obstruction is (L-i) and (L-S).
- **(b)** Full (HALL), with switch arcs load-bearing, at an eligible switch-necessary row: **supplied at critic-attributed grade `computer_assisted`, STATED, conditional on an isolated second read.** It holds at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492` (E-2), and in addition at `CB(8,108)/577` and `CB(7,144)/673` (E-2′, pending a second instrument on the criterion).
  - The certificate now has two instruments (`C-T1-U` and the adjudicator), the E1 criterion has two (D1 and the adjudicator), and E1's load profile is confirmed by reconstruction and laboratory replay.
  - These would be **the first eligible whole trees proved to saturate with switch arcs load-bearing** in this run.
- **(c)** A (CUT) candidate: **none.** The only cut in the portfolio is at a non-eligible laboratory (A7).
- **(d)** A Lean award: **none from T.**

**Other material progress**

- The claw-product normalized-matching lemma is proved self-contained, twice independently. It is the exact dependency C1 was conditional on.
- Condition (ii) of E1 holds identically, so E1 collapses to `ρ ≤ 1`.
- E1's mechanism is identified as claw normalized flow on mark clones, with the heterogeneous extension proved in writing.
- A record correction: the universal E1 criterion is false at `d ≤ 5`.

The stop gate's decisive events are (HALL) formally verified, or a confirmed (CUT). Neither is present. The pre-armed plateau test (ruling 30) is **answered by letter (b)** for this orientation, subject to the second read. The synthesis rules.

## Headline assessment

headline_resolved: no
status: still_open

**(HALL)** `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` is `still_open` at this orientation's grade. No proof at full scope exists and no deficient cut exists.

- Restricted to the five named rows, it is established at `computer_assisted` (E-2 and E-2′; STATED, pending a second read). That is finite, not universal.

**(WID)** is already `formally_verified` (C1-LA1). Nothing in the portfolio changes it.

**Outcome-B candidates**

| Candidate | Status |
|---|---|
| CD-1 (claw normalized matching) | complete informal proof verified at full scope; `proved_informal` candidate after a second read |
| CD-2 | the same |
| E1-R (heterogeneous mark-clone criterion) | complete, conditional on CD-1; STATED |
| E-1 (sector certificate) | `computer_assisted` at five rows |
| T1 Step 1 | struck; restatement |
| T2 C2/C3 | true, classical; no consumer; not registered |

**Unchanged.** The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` is untouched and OPEN. It is not implied by any finite-row (HALL).

## Next-route allocation

**Exact remaining obligation for orientation T.** (HALL-COND) under (D) ∪ (S) must be shown for every `X` at every eligible rank of every finite ordinary tree. On T's own line the nearest closable pieces are:

- **(O-1)** the isolated second read of E-1, E-2 and E-2′, and of CD-1, CD-2 and E1-R, plus a second instrument on the E1 criterion at the first ranks 577 and 673;
- **(O-2)** the lemmas (L-i) and (L-S) on an infinite CB class;
- **(O-3)** a heterogeneous sector certificate at `G(8^82, 7^2)/448`, the one known switch-necessary non-CB row.

**Route T-A: `CB-FAMILY-UNIFORM-HALL` (target: ruling 30 (a) in Cycle 5).**

1. Prove (L-i) for a stated infinite class, for example `CB(d,m)` with `d ≥ 6` or `CB(8, m)` for all `m`. Use a mode bound for `(1+y)^a(1+2y)^b` together with lower bounds on `x(CB(d,m))` from its explicit polynomial.
2. Prove (L-S) as a closed-form choke-local family `φ_b(β,γ), φ_c(β,γ), σ(g)` with the affine separation of E-1, as functions of `(d, M, K)`. The five certificates are the data to interpolate. Their `σ` sits at or near the cap `θ·g/(d − g)`.
3. At the eligible ranks where the sector is not deletion-deficient, use the elementary biregular (NM) bound (deletion only; E1 loads 0 on in-sector targets).
4. Compose via E1-R.

*Could close:* a `proved_informal` parameter-uniform (HALL) on an infinite eligible CB family, as a SEPARATE key, together with its Lean DAG.

**Route T-B: `SWITCH-NECESSARY-ROW-CLOSURE-AND-CLAW-LEAN-SEED`.**

1. A heterogeneous choke-local sector certificate at `G(8^82, 7^2)/448`. The residuals are `1 − ρ_{(1,7)} ≈ 4.47×10⁻³` at the degree-7 chokes, and `1 − ρ_{(1,8)}` at the degree-8 chokes. Composed with E1-R (criterion verified at all 56 ranks), this gives whole-row (HALL) at the non-CB switch-necessary row.
2. The second instrument at 577 and 673.
3. In parallel with a U or Lean seat: formalize G-T-CLAW at the draft statement above.

*Could close:* (HALL) at all six known switch-necessary eligible rows (`computer_assisted`), and a Cycle 5 Lean award for CD-1. With T-A's (a), that would meet ruling 30 (d).

**Routed out of T.** `C-T1-F` A7 goes to F2's conjecture test. C1's promotion is the synthesis's decision, after a second reader confirms SR-C3-5c's claw poset. The (NM) tree-side encoding stays with U1's line.

## Artifact inventory

All my artifacts are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c4-adj-T/`. Everything uses the standard library with exact `int`/`Fraction` arithmetic, runs with `python3 -B` in the foreground, and leaves no bytecode. No background job was started.

| File | SHA-256 | Purpose |
|---|---|---|
| `verify_capsule.py` | `dd8c9f89221ffdd101033ac6a9e784c9e9e4b1cd49a3467cb6db0e9679ba010f` | capsule seal and 21 member digests |
| `verify_seals.py` | `521d54cbe9deb628bc9831827caa5a6a9e8e05335a5c96d2abfe32688b8e3893` | Stage 2/3/4 seals; T members (exit 0) |
| `dump_cert.py` | `fad1e61df5dafa69e8bfe7f3c57c15994982508e67ed82758ce65a333af4d360` | runs `C-T1-U`'s LP (search device) and dumps values |
| `cert_values.json` | `f16526bd86198fac553c99e32b21659fc82754365c02a6c09e081be7d7e7a8b1` | the five certificates |
| `adj_verify_cert.py` | `21241512f9d90b3542e25a79c3276e2649bdd3ace6bcf87ed78d84feed044a0c` | independent certificate proof check; `x`, `α`, `F_p`, WID two-sided; E1 criterion (i) and (ii) at five rows |
| `out_adj_verify_cert.txt` | `5214567b84a53fc936f67a391883cc748ee3496aebc2a04902fcc6afe9342986` | its output (`ALL_OK True`) |
| `adj_e1_lab.py` | `d50cce0f416f55c881ed7c3b914fdf26d4fca6bf2e1783ee20f269263b731494` | laboratories: E1-R exact loads, choke-locality with random values, sector exits, whole and reduced max-flows |
| `out_adj_e1_lab.txt` | `837ab806a6f1e19732751f381275093aaeb53e01084921a55b72bfc0c4676231` | its output (`ALL_LAB_OK True`) |
| `adj_t2_counts.py` | `37dda8fea585e4a005be49f01a580b70375932f309179b7062c97beeffc00fca` | E1-criterion tallies, `G(8^82, 7^2)` window, claw/chain ranks |
| `out_adj_t2_counts.txt` | `282f795e6fefd6399e998e002a20f5de97bae1107cd1085a9518631d90776711` | its output (rerun identical) |
| `adj_theta_lower.py` | `92e803d044694f1b4470b6b05272a1c99286528bad9a3e52e20ca74a74f794b5` | whole-sector lower bound `θ_whole` |
| `out_adj_theta_lower.txt` | `d8b389681bc461031705538f77b73a934dd8e951290162864e99df9ac4a63e31` | its output |
| `adj_lab_search.py` | `40951c1a203729ce99f2c73f258b569608af394b112271a7d3d0b8f62e8affa0` | search for small end-to-end laboratories (none qualify) |
| `out_adj_lab_search.txt` | `c6d17be578ac98f194b73beb7bca049af41b11c20ef1e48f24dc8d367540e4bb` | its output |
| `out_adj_sigma_structure.txt` | `54ae655738d13997af0d086b4e53807424abb55df9b81621a324dd86c4106804` | how the switch values sit against the cap |

**Replay directories**

- `replay-T1U/`, `replay-T1F/`, `replay-T2U/`, `replay-T2F/` hold copies of the critics' `own/` files.
- `orig-*/` hold the shipped outputs used for `cmp`.
- Replayed byte-identical:
  - `certify.py`, `certify_o3.py`, `literal_localflow.py` (`C-T1-U`);
  - `cut71.py`, `step1.py`, `relief.py` (`C-T1-F`);
  - `claw_nm.py` (`C-T2-F`);
  - `claw_nm.py`, `tp_universal.py` (`C-T2-U`).

**Replay**, from the scratch directory:

1. `python3 -B verify_capsule.py`
2. `python3 -B verify_seals.py`
3. `python3 -B dump_cert.py`
4. `python3 -B adj_verify_cert.py` (about 14 s)
5. `python3 -B adj_e1_lab.py`
6. `python3 -B adj_t2_counts.py` (about 29 s)
7. `python3 -B adj_theta_lower.py`
8. `python3 -B adj_lab_search.py`

To replay a critic's script, `cd` into its `replay-*/` directory and run `python3 -B <script>`.

**Deliverable:** this file only, `cycles/cycle-4/stage5/adjudicators/T/ADJUDICATION.md`.
