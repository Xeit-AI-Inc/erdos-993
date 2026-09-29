# Critique

**Critic:** `C-F3-T` (cross-orientation critic, orientation T, of seat F3). **Route under review:** `C2-F-03`, mechanism token `CRITERION-LOAD-AND-TYPE-PATH-ADVERSARY`, orientation F. **Return:** `cycles/cycle-2/stage3/returns/F3/RETURN.md`. **Date:** 2026-09-28, by the clock (~02:05 EDT at close).

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, as the dispatch requires. I loaded no other VerityOS subsystem. The controller owns conversation logging for this run.

**Read-boundary disclosures.**
1. The harness injected the project `CLAUDE.md`, the user memory index and the user's email into my context before my first tool call. I did not fetch them, did not act on them and did not use them in the mathematics.
2. **Process listing.** Before closing, I ran a name-scoped `pgrep -fl "crit_|f3_"` to confirm that none of my own jobs survived. The pattern also matched processes of other critics' sessions (command lines under `scratchpad/c2-crit-T2-U/`, `scratchpad/c2-crit-U1-F/`, and a `crit_f1u.py` run). Their command text was printed to me. I used nothing from it and signalled none of those processes. None of them is mine.
3. **Reads under `sources/`** (authorized as Stage 2 members; each file digest-checked before use):
   - `sources/authority/CLAIM-IDENTITY.json`: the criterion key and the (WID) key.
   - `sources/r30/records/SEMANTIC-CONTRACT.md`, lines 15–80: the definitions of `S`, `q_v` and the Δ index.
   - A `grep -rn` rooted at `sources/r30/lean` and `sources/first-interior`, looking for the definitions of `vertexDeletionForwardDifference`, `IsFavorableAt` and `forwardDifferenceDel`. Both roots are inside the grant.
   - `sources/c1-results/control/snapshots/CLAIM-IDENTITY.run-local.c1-close.json`, for SR-3's registered composition key, which is not in the frozen 491-key file.
   - A non-recursive `ls` of `sources/`, `sources/r30` and `sources/r30/records`.
   - A single `grep -l` rooted at `sources/c1-results`, to locate the SR-3 key.
4. **Hashed, not read.** I computed the digests of the SR-2 and SR-3 second reads, the Cycle 1 close and the five inherited template scripts, to audit the return's digest list. I did not read their content.
5. I did not read `control/C2-WORKER-COMMON-BRIEF.md`, any other return, any critique, any adjudication, any other experiment root, or the network. I made no installs and did no Lean work.

## Identity and seal audit

**Seals and digests I verified:**
- **Dispatch** `control/dispatch/c2-stage4/DISPATCH-C-F3-T.md`: SHA-256 `6548cc9ff546da3fabef7c2be7a52525a1891da9e3cabdc050a0b45aca3a537c`. MATCH, recomputed before reading.
- **Capsule** `control/c2-critic-capsules/F3-PACKET-MANIFEST.json`: the inner seal, recomputed over compact key-sorted JSON without `seal_sha256`, is **`b3dab5b45d713d1e39d6a9b47fa3ada4b541dba4b88577c11996c688dc57ee24`**. MATCH. All 14 listed files match in both SHA-256 and byte count.
- **Stage 2 seal** `ee00f1267265794a7054cca633bf22247b946104829744cca5ff182796dff7e4`: MATCH.
- **Stage 3 packet seal** `1cffc78956eb5c336cd5d0206264d6fe5bba14b1be6d8bf05077818f327a35c5`: MATCH.
- **Stage 4 dispatch seal** `af5d13510a82108cb7e584d0909f5f1fee4055d0f2a6448e9dde08411a2145bb`: MATCH.
- **Return** `RETURN.md`: `134d46e9b87d09d4f39f486e65bfc002833948bd672c69dff4901251a33ae9c7`. MATCH against both the capsule and the Stage 3 manifest.

**Digests the return lists:**
- `DISPATCH-F3.md` `c6d0c92d…f3ee` equals the Stage 3 manifest entry. I did not open the file.
- The five inherited template scripts (`localflow.py`, `certify.py`, `sector.py`, `rowdata.py`, `simplex.py`) match `sources/SOURCE-DIGESTS.json`.
- SR-2, SR-3 and `CYCLE-CLOSE.md` match `sources/c1-results/SOURCE-DIGESTS.json`.
- All 11 inventoried artifacts under `scratchpad/c2-F3/` match the return's table byte for byte.

**Replay** (copy-out-first into `scratchpad/c2-crit-F3-T/replay/`, originals moved to `replay/orig/`, foreground):

| Script | Time | Output |
|---|---|---|
| `f3_eligibility.py` | 1.96 s | byte-identical |
| `f3_fixed_points.py` | 0.29 s | byte-identical |
| `f3_criterion.py` | 2.39 s | byte-identical |
| `f3_condition_ii_stress.py` | 13.1 s | byte-identical |
| `f3_doubly_fed.py` | 0.09 s | byte-identical |

The route ID and the mechanism token appear verbatim in the return. Its model disclosure ("chartered sonnet/high … claude-sonnet-5") matches the allocation's route charter.

## Independent re-derivation

**My instrument** (stdlib only; nothing reused from the seat's scripts):
- `crit_rows.py`:
  - Builds its own labelled graph and runs its own tree test (union-find acyclicity, `|E| = n − 1`, one component).
  - Runs its own component-wise forest DP rooted at the arm leaf `v`.
  - Uses its own closed form with the contract's `G = (1+2x)^8 + x(1+x)^8`.
  - Uses the **correct** favorability index, taken from the Lean definition of record (C4LA1 entry 2, `vertexDeletionForwardDifference G v p := i_{p+1}(G−v) − i_p(G−v)`).
  - Verifies the automorphism generators and computes the leaf orbit.
  - Computes (WID) from two independent sides, and condition (i) at every `q`.
- `crit_dbf.py`: a literal arc audit **at rank `p*`**, with the generic weight read off the adjacency.
- `crit_cond_ii.py`: condition (ii) at the actual triples, plus the two pointwise lemmas of the proof.

**Fixed points.** Every value below was produced by the same code that produced the fresh rows.
- `CB(8,95)/508`: `n = 1618`, `α = 856`, `x = 506`, and `ρ_1 = 1354839571516225/1361543988640524`, which equals SEMANTIC-CONTRACT §5 exactly.
- `CB(8,107)/572`: `n = 1822`, `α = 964`, `x = 570`, and `ρ_1 = 5150844596024699/5173467627355748` (agrees with F3).

**Rows** (`m ≡ 2 (mod 3)`; fresh rows per gate ruling 9: **116, 119**; control rows: 107, 110, 113):

| m | n | α | x | p* | Δ_{p*}(T−v)/i_{p*}(T−v) | Δ_{p*}(T−c)/i_{p*}(T−c) | (WID) both sides equal | S/supply | min over q of cond.(i) relative margin |
|---|---|---|---|---|---|---|---|---|---|
| 95 | 1618 | 856 | 506 | 508 | −0.013649 | −0.013607 | yes | −0.011913 | 0.0049241 (q=1) |
| 107 | 1822 | 964 | 570 | 572 | −0.012939 | −0.012926 | yes | −0.011366 | 0.0043729 (q=1) |
| 110 | 1873 | 991 | 586 | 588 | −0.012784 | −0.012775 | yes | −0.011248 | 0.0042538 (q=1) |
| 113 | 1924 | 1018 | 602 | 604 | −0.012637 | −0.012632 | yes | −0.011136 | 0.0041411 (q=1) |
| 116 | 1975 | 1045 | 618 | 620 | −0.012497 | −0.012495 | yes | −0.011030 | 0.0040342 (q=1) |
| **119** | 2026 | 1072 | 634 | 636 | −0.012363 | −0.012365 | yes | −0.010929 | 0.0039327 (q=1) |

**What holds at every row:**
- The tree test passes.
- The DP matches the closed form on every coefficient.
- `x = p* − 2`, computed through `α` with the terminal difference.
- The row is eligible: `x + 2 ≤ p*` with equality, and `3p* < 2α + 1`.
- Favorability at the **correct** index holds for `v` and for three private leaves (`c` at choke 1 leg 1, at the last choke's last leg, and at a middle choke). All three private-leaf values are identical.

**Leaf transitivity.** Four maps are each checked literally to be automorphisms (edge set mapped onto edge set):
- the choke transposition (1 2);
- the choke cycle (1 … m);
- the leg transposition (1 2) at choke 1;
- the leg cycle at choke 1.

The orbit of `c_{1,1}` under these generators is exactly the `8m` private leaves. So `F_{p*}(T_m) = leafSet(T_m)` (`8m + 1` tags) at all six rows, derived on the original tree.

**(WID) from independent sides** (exact integers; `|S|` has 363 to 455 digits):
- **Side 1 (structural).** The supply polynomial `W(x) = x²(1+2x)^{8m} + 8m·x²(1+x)^7(1+2x)·G^{m−1}`, giving side 1 = `[x^{p*+1}]W − [x^{p*}]W`.
  - The arm tag `v` is active iff `r ∈ B`, since `W_v = {r}`. Sets containing `r` and `v` exclude `s` and every `u_i`, and each leg is ternary. That gives the first term.
  - A tag `c_ij` is active iff `u_i ∈ B`, since `W_{c_ij} = {u_i}`. At that choke the `c`'s are free and weighted by count (`Σ_S |S| x^{|S|} = 8x(1+x)^7`), the other chokes contribute `G` each, and the arm without `r` contributes `1 + 2x`. That gives the second term.
- **Side 2 (generic).** `Σ_{t∈F}[q_t(p*) − q_t(p*−1)]`, with `q_t(j) = i_j(T − {t, s_t}) − i_j(T − N[s_t])` computed by the generic forest DP on the original tree. This is done for `t = v` and for `t = c_{1,1}`, times `8m`. The `q`-polynomials of a second private leaf `c_{m,6}` are identical.
- **Result.** At every row, supply equals supply, capacity equals capacity, and side 1 equals side 2. `S(T_m, p*) < 0` at every row. This is `bounded_computation`, consistent with FLOW⇒SIGN and not evidence for (HALL).

**Condition (i)** was computed at every `q ∈ [1, m]` at all six rows (my own code, with a convolution cross-check of `r_1`).
- It is strict at every `q`, with no exceptions.
- The minimum relative margin is at `q = 1` at every row.
- The `q = m` margins are 0.1563506 (107), 0.1562825 (110), 0.1562179 (113), 0.1561568 (116) and 0.1560986 (119).
- F3's edge-case digit counts reproduce exactly: 427 and 269 digits at `m = 113`, 438 and 276 digits at `m = 116`.

**Condition (ii): my re-derivation of CD-2 (the proof, not a sweep).** Notation: `f(t) = C(b,t)·2^t` and `g(t) = C(a,t)`, both zero outside their support, both log-concave with no internal zeros (`f(t)/f(t−1) = 2(b−t+1)/t` and `g(t)/g(t−1) = (a−t+1)/t` both decrease on their supports). `S_α = g(α)f(j−α)` and `T_α = g(α)f(j−1−α)`.

- **First inequality.**
  1. *Pointwise step.* For `x < y`, `S_x·T_y ≤ S_y·T_x` reads `f(u)f(u'−1) ≤ f(u')f(u−1)` with `u = j−x > u' = j−y`. If the left side is positive, then `0 ≤ u'−1 < u' ≤ u−1 < u ≤ b`, all four values are positive, and the ratio monotonicity gives the inequality.
  2. *Summation.* Sum the pointwise step over `x ≤ α < y`, then add `(Σ_{≤α}S)(Σ_{≤α}T)` to both sides. The result is `r(j−1)·Σ_{≤α}S ≤ r(j)·Σ_{≤α}T`, which is the first inequality.
- **Second inequality.**
  1. *Reindex.* In `β = rank − α`, put `S'_β = g(j−β)f(β)` and `T'_β = g(j−1−β)f(β)`. Then `α' ≤ α` for `S` becomes `β ≥ j−α`, and `α' < α` for `T` also becomes `β ≥ j−α`.
  2. *Pointwise step.* For `β < β'`, `S'_β·T'_{β'} ≤ S'_{β'}·T'_β` is the same log-concavity step, applied to `g`.
  3. *Summation.* Summing across the cut at `t = j−α` gives `r(j)·Σ_{β≥t}T' ≤ r(j−1)·Σ_{β≥t}S'`, which is the second inequality.
- **Degenerate ranks.** For `j ≤ 0` every term vanishes.

No Darroch, no Newton and no asymptotics enter, and the proof holds for all integers `a, b ≥ 0` and all `j`. It agrees with the proof of record in the criterion key's scope note (SR-C4-6), which I confirm to be sound. As a sanity check (not evidence), `crit_cond_ii.py` finds 0 failures of condition (ii) at every `q` of `CB(8,116)` and `CB(8,119)`, and 0 failures of both pointwise lemmas at `q ∈ {1, ⌊m/2⌋, m}`.

**The doubly-fed class: complete classification** (my derivation; literal audit at `p*`). A sector source `B` contains `r` and `v`, hence no `s` and no choke. Its arcs are:

| Arc | Image | Weight | Template flow |
|---|---|---|---|
| (D), delete a leg vertex | in-sector | 1 | yes |
| (D), delete `r` | r-free, q = 0 | 0 | 0 |
| (D), delete `v` | contains `r`, not `v` | 0 | 0 |
| (S) at `s` (N(s) = {r, v} ⊆ B) | r-free, q = 0 | 0 | 0 |
| (S) at `u_i` in state (1, 0) | r-free, q = 1 | 0 | 0 |
| (S) at `u_i` in state (1, γ), γ ≥ 1 | r-free, q = 1, `v ∈ A` | γ | σ(γ) |
| (S) at `b_ij`, `c_ij` or `v` | none: at most one neighbour of these vertices lies in B | — | — |

Two facts pin down the doubly-fed class:
- The criterion flow loads only r-free targets with `q ≥ 1` (the key's statement). No in-sector target can be fed by it, because every (D)-preimage of a set containing `r` and `v` contains `r` and `v`.
- So the only class that carries positive load from both flows is the `u_i`-switch images with `γ ∈ [1,7]`.

Such an image has exactly `8 − γ` sector preimages, all through the `u_i` switch, and no sector (D)-preimage, since `u_i ∈ A ∪ {x}` excludes `r`. Its load is at most `ρ_1γ + (8−γ)σ(γ)`. The exact per-γ constraint is therefore `(8−γ)σ(γ) ≤ (1−ρ_1)γ`, which is equivalent to Switch ∧ Residual for `θ := max_γ (8−γ)σ(γ)/γ`. `(ρ_1+θ)γ ≤ γ` is the θ-form of that constraint, not a separate one. There is no other doubly-fed class.

`crit_dbf.py` confirms this literally at the actual rank. Sources are in `I_{p*+1}`, with `K = 603` at `m = 113` and `K = 635` at `m = 119`. Arcs are the literal (D) ∪ (S) over **all** vertices, and the weight is generic, read off the adjacency.

| m | sector sources | arcs | violations | switch images checked | preimage count = 8 − γ | γ seen | q ≥ 2 targets (with and without `v`) with a sector preimage | in-sector targets whose (D)-preimages are all sector |
|---|---|---|---|---|---|---|---|---|
| 113 | 6 | 3,775 | 0 | 40 | all | 1..7 | 0 of 6 | 4 of 4 |
| 119 | 6 | 3,978 | 0 | 40 | all | 1..7 | 0 of 6 | 4 of 4 |

- The preimage census runs over all (D) and (S) in-arcs, with independence tested.
- The q ≥ 2 targets have `q = 2, 3, 5`, each built once with `v` and once without. Their in-arcs are enumerated in full over both arc types.
- Arc-class counts at `m = 113`:
  - in-sector deletions: 3,618;
  - deletions of `r`: 6, and deletions of `v`: 6, all weight 0;
  - `s`-switches: 6, and (1,0)-switches: 4, all weight 0;
  - positive-weight `u_i`-switches: 135.

## Attacks and findings

**F-1. Fidelity failure: wrong favorability index. It strikes the return's favorability evidence.**
- The return defines and computes `Δ_{p*}(T−t) = i_{p*}(T−t) − i_{p*−1}(T−t)` (return §1; `f3_eligibility.py`, `delta_at`: `ip - ipm1`). By the definition of record, `IsFavorableAt G v p := vertexDeletionForwardDifference G v p < 0` with `vertexDeletionForwardDifference G v p := i_{p+1}(G−v) − i_p(G−v)` (C4LA1 entries 2–3, carried in r30 C1-LA2's `THEOREM-CONTRACT.yaml` and `Main.lean`). F3's quantity is therefore `Δ_{p*−1}(T−t)`, favorability at the wrong rank. This is exactly the `p*` vs `p* − 1` trap the attack briefs warn about.
- **Struck:**
  - the return's favorability table (8 rows);
  - "`F_{p*}(T) = leafSet(T)` at both rows";
  - every downstream use of `F = leafSet` as a derived instance fact in `f3_doubly_fed.py`'s weights.
- **Restored by the critic:** at the correct index, `Δ_{p*}(T−v) < 0` and `Δ_{p*}(T−c) < 0` at 95, 107, 110, 113, 116 and 119 (table above).
- The condition (i) and (ii) numbers, eligibility and `x` do not depend on `F` and are not struck.

**F-2. (WID) was never asserted.** Shared rule 2 and protocol duty 2 require (WID) from independent sides before anything is reported about a network. The return defers it to F1 and offers "`ρ_q` computed two ways" as a substitute. That is not (WID), which is supply − capacity = `S(T, p*)`. The critic discharged it at all six rows (above).

**F-3. The automorphism claim overreaches its evidence.**
- The return says "an explicit automorphism (choke 1 ↔ choke m, leg 1 ↔ leg d) … confirms every `c_ij` plays an identical structural role".
- One involution cannot establish transitivity on `8m` leaves. The claim is struck as certified.
- The conclusion is true. The critic's four generators are each checked literally, and their orbit is all `8m` private leaves.

**F-4. The θ* "reproduction" is circular.**
- The fixed-point table says the instrument reproduces θ* "exactly" (and "all values match … θ* for both rows").
- `f3_fixed_points.py` only evaluates the fitted law `288/(200m²+82m+5)` at `m = 95, 107`, which are the rows the law was fitted to. No LP is solved. This is not corroboration of any instrument.
- Struck from the certification line. `n`, `α`, `x` and `ρ_1(95)` are genuine reproductions and stand.

**F-5. "Fact 3" is false as worded.**
- The return says "every deletion arc removes one leg vertex (never r, never v)". Under the literal relation (D), `A = B ∖ {q}` for **every** `q ∈ B`, and deleting `r` or `v` is an arc. The critic's audit counts 6 of each per row, all weight 0.
- The conclusion survives: the images have no choke and weight 0, and the template puts 0 on them.
- Repair: "every deletion image of a sector source has zero chokes; it is in-sector of weight 1 if a leg vertex is deleted, and has weight 0 if `r` or `v` is deleted".

**F-6. The "literal" doubly-fed checks are not at rank `p*`, and one of them is vacuous.**
- The "concrete sector source" has `K = 99` legs, not `p* − 1 = 603`. The q = 2 and q = 3 targets have 14 and 17 vertices, not `p* = 604`.
- The "exhaustive over V∖A" test checks only whether `r ∈ A∪{x}` and `v ∈ A∪{x}`. It does not test independence, it tests only (D) preimages, and it runs on targets containing neither `r` nor `v`. No single `x` could ever add both, so the test cannot fail.
- `w_F` in the script is a hand-specialized CB formula, not the generic active-tag weight, so "checked against the literal `w_F`" overstates what was shown.
- The structural argument itself is rank-free and correct (with F-5's repair). The critic's at-rank audit (above) replaces these checks as the instance evidence.

**F-7. The STATED note is not a sharpening, and its citation is wrong.**
- SR-3's registered composition key already states, in its own text:
  - 0 flow "on the deletions of r and of v, on the switch at s and on the switches at chokes in state (1, 0)";
  - the `8 − γ` preimage count;
  - "every other target receives no sector flow".
- F3's note restates part of this, with the Fact 3 error. It should not be folded into the key's proof paragraph as written.
- The return says the key's text was "quoted in full above from `CLAIM-IDENTITY.json`'s entry". That is false twice over:
  - `sources/authority/CLAIM-IDENTITY.json` holds 491 keys and no `E993-R31-` key; the key lives in the run-local registry (snapshot `sources/c1-results/control/snapshots/CLAIM-IDENTITY.run-local.c1-close.json`);
  - the return quotes no full text of it.

**F-8. The condition (ii) sweep attacked a proved statement, not its proof.**
- The tested inequality does match the key's text exactly. I checked `check_condition_ii`: the `>=` directions and the use of `Σ_{α'<α}` in the second inequality are right, and the Part A triple count of 570,807 is correct.
- But the return presents CD-2 as a "claim" backed by SR-C4-6's grid, and omits that CD-2 is `proved_informal` with a likelihood-ratio proof on record. A 571,768-triple sweep can neither raise nor lower that grade.
- The adversarial target was the proof. I re-derived it and found it sound (above). The return's "remaining obligation (a)" (push the grid past `a, b = 80`) is moot.

**F-9. Fresh-row coverage.** Gate ruling 9 makes 116 and 119 the fresh rows and 113 a control row. F3 used the allocation's pair, 113 and 116, and so covered one fresh row. The critic adds `m = 119` for the whole chain: tree, `α`, `x`, eligibility, favorability, transitivity, (WID), condition (i) and (ii) at every `q`, and the at-rank arc audit.

**F-10. Condition (i) and the edge cases are confirmed, with one uncited claim.**
- Every number the return gives for condition (i) and its edge cases reproduces with my code.
- The ℕ-guards are sound: `j = p* − q ≥ (13m+4)/3 > 0`, and `b_q ≥ 1` at `q = m`.
- The claim "continuing the trend SR-2 reported from m = 107 to m = 1001" is a citation I did not check (I did not read SR-2's content). It carries no evidence here.

**F-11. No cut, and nothing points to one.**
- The criterion flow's load on q ≥ 2 targets is `ρ_q·w ≤ w` by condition (i), as the key states.
- Across the at-rank audit, no positive-weight target of the sector lies outside the classes above.
- Template failure vs cut is not at issue.

## Mechanism-equivalence and fence check

- **The return:**
  - It stays on the class (`m = 113, 116`) at the one rank `p*`, with no aggregate transfer.
  - The θ* law is labelled a conjecture and used only as an illustration (but see F-4 for the "reproduction" wording).
  - No refuted mechanism is revived. Census values are presented as `bounded_computation`.
  - It proposes no `E993-R31-` key; the STATED note is correctly left unregistered.
  - Working labels ("Lemma A", "SR-C4-6") appear only in prose, never in a key.
- **This critique:**
  - It stays on the class (107, 110, 113, 116, 119, plus the fixed point `m = 95` as a reproduction only) at `p*` only.
  - It proposes no key, uses no Darroch or Newton, and makes no asymptotic step.
- **Keys touched by the critique:**
  - the criterion key `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`: CD-2 re-derived, grade unchanged `proved_informal`;
  - the (WID) key `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`: instance checks only;
  - the favorability key: instance checks only, grade unchanged;
  - SR-3's composition key: the classification is re-derived, the key's text is found to already contain it, and it is unchanged.
- **Alias check.** The critic's STATED items are the supply polynomial `W(x)` and the per-γ form of the switch-image constraint. Mathematically, the first is the CB instance of the (WID) key's `Σ_B w_F(B) = Σ_v q_v(|B|−1)`, and the second is contained in SR-3's key. Neither is a new identity, and neither is proposed for registration.

## Certification audit

**Backed** (replayed byte-identically and independently re-derived):
- `n`, `α`, `x` and eligibility at 113 and 116;
- the closed-form match;
- the fixed points `n`, `α`, `x` and `ρ_1(95)`;
- condition (i) strict at every `q` at both rows, with the edge-case margins and digit counts;
- condition (ii) holding at the fresh-row triples;
- "571,768 triples, 0 failures", as a count of an exact sweep (it is correct, but it adds no grade: F-8).

**Struck:**
- the favorability table and "`F_{p*}(T) = leafSet(T)` at both rows", which use the wrong index (F-1);
- "confirms every `c_ij` plays an identical structural role" from one involution (F-3);
- "θ* … match[es] … exactly" and the θ* column as reproduction (F-4);
- "Fact 3: … never r, never v" (F-5);
- "exhaustive over all of V∖A" and "checked against the literal `w_F`" as instance evidence at `p*` (F-6);
- "quoted in full above from CLAIM-IDENTITY.json's entry" (F-7);
- "sharpens … SR-3's own argument", since the key already states it (F-7).

**Unverified citation:** the SR-2 trend to `m = 1001` (F-10).

**Remaining obligation:** the return's is not exact. Item (a) is moot (F-8), and it omits (WID) and the correct-index favorability, both of which were owed by this route under shared rule 2.

## Verdict

The return's substantive conclusions all survive my independent re-derivation:
- condition (i) is strict at every `q` of the fresh rows, with `q = 1` binding;
- condition (ii) holds, and is in fact proved on record (CD-2, re-derived here);
- the `u_i`-switch images with `γ ∈ [1,7]` are the only doubly-fed class, with binding constraint `(8−γ)σ(γ) ≤ (1−ρ_1)γ`, which is equivalent to Switch ∧ Residual;
- there is no cut.

But the return's own favorability evidence is computed at the wrong index (F-1), and it never asserted (WID) (F-2). Several certification literals overreach (F-3 to F-7). The route's result stands at `bounded_computation` only in the narrowed form restated below, with the critic's re-derived favorability and (WID) in place of the struck items.

**Critic-derived advances** (attributed to `C-F3-T`; grades as stated; none registered):
1. **(a) The `m = 119` fresh-row chain.** At `m = 119`, and also at 107, 110, 113 and 116, with `m = 95` as a fixed-point reproduction:
   - the tree test passes;
   - `α = 1072` and `x = 634 = p* − 2`, so the row is eligible;
   - favorability holds at the correct index, and transitivity is proved by verified generators, so `F_{p*} = leafSet`;
   - (WID) holds from two independent sides, with `S(T_m, p*) < 0`;
   - condition (i) is strict at every `q`, and condition (ii) holds at every `q`;
   - the literal at-rank arc audit finds 0 violations, and every checked switch image has exactly `8 − γ` sector preimages.

   Grade: `bounded_computation`.
2. **(b) The supply polynomial.** `Σ_B w_F(B)x^{|B|} = x²(1+2x)^{8m} + 8m·x²(1+x)^7(1+2x)G^{m−1}` on `CB(8,m)` with `F = leafSet`, so `S(T_m, p*) = [x^{p*+1}]W − [x^{p*}]W`. This is STATED: proved on the face by the counting above, and checked against the generic aggregate at six rows.
3. **(c) The doubly-fed classification.** Complete over every literal arc type, including deletions of `r` and `v`, the `s`-switch and (1,0)-switches, with the exact per-γ constraint. It is a confirmation of SR-3's key text, not new.
4. **(d) CD-2 re-derived and found sound.** Darroch/Newton-free; `proved_informal` confirmed.

verdict: retained_narrowed

headline_resolved: no

ELIG_formal: not_advanced

HALL_formal: not_advanced

FAV_darroch_free: not_advanced

cut_candidate: none

The headline is the transport mechanism certified: a formally verified weighted Hall/compensation theorem, or a confirmed deficient cut after two instruments and an isolated second read. Neither this route nor this critique produces either. Within F3's scope, the mathematics of the criterion flow at `p*` (conditions (i) and (ii), and the doubly-fed classification) is complete at `proved_informal` through the registered keys it cites. This critique adds no grade to them.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

What remains exactly, for a successor or the synthesis:
1. **Formal: the U2 target case split.** The criterion flow at `p*` enters the conjunct-4 composition only as a hypothesis (the criterion key is `proved_informal`). The target case split of the composition is a Lean node owned by U2:
   - in-sector targets;
   - `u_i`-switch images with `8 − γ` preimages;
   - zero-weight images of the deletions of `r` and `v`, the `s`-switch and (1,0)-switches;
   - q ≥ 2 targets, fed by the criterion flow only.

   Its informal proof is complete (SR-3 key; re-derived here).
2. **Formal: CD-2.** CD-2 is a short, self-contained candidate for a later formal lemma: two pointwise log-concavity inequalities for `C(n,·)` and `C(b,·)2^·`, plus a summation. This would make condition (ii) formally verified and reduce the criterion at `p*` to condition (i).
3. **Carried input unchanged.** The favorability key's Darroch/Newton dependency (T1/T2) is untouched here. The correct-index instance checks above are `bounded_computation` and do not discharge it.
4. **Registry hygiene.** Nothing from F3's STATED note should be folded into SR-3's key, which already states it more carefully. If any face-text is adopted, it must use F-5's repaired wording.
5. **No cut and no template failure** is pending from this route or this critique.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c2-crit-F3-T/` (stdlib Python only; every run was in the foreground and deterministic; no background job was started):

| File | SHA-256 | Role |
|---|---|---|
| `crit_rows.py` | `1cd38ae477c27144bdddf2b82ee4d5d92b64d1052422a72f31886a7bb736cab5` | own instrument: rows 95..119, tree/α/x/eligibility, closed form, correct-index favorability, generators and orbit, (WID) two sides, condition (i) |
| `crit_rows.out.json` | `1066521e537ef41ab9e039d9a6d429b4af9b4e2cb69f2deb1ffdb42ab1a19ceb` | output (run: `python3 -B crit_rows.py 95 107 110 113 116 119`, 16.5 s) |
| `crit_rows.stdout.txt` | `6430c275d867f863347f3d4ba674f1c57cd589b31dd63ec76dc2d5655913e106` | stdout |
| `crit_dbf.py` | `e49a8691f32e45c597364069bf96e7c64b4931e4c0ebf4fd01be4062bf801021` | literal at-rank arc and preimage audit, m = 113, 119 (seed 31) |
| `crit_dbf.out.json` | `12f3acc78b3ad59db4fef10be2106e2cec07cc2ca5122eba1069e86690f08649` | output (5.0 s) |
| `crit_dbf.stdout.txt` | `718fd48ef6e754bf7c01a1229fe70a76315bd4514a078ad74699161441bbf557` | stdout |
| `crit_cond_ii.py` | `cf008b507c9f9c9b820fa916e25def2dfdf51e0563dde1e472c0bc12867d42c0` | condition (ii) at the actual triples, m = 116, 119, plus the proof's pointwise lemmas |
| `crit_cond_ii.out.json` | `040f672f7af77766e4805f40cddc4528751b784c53d4ea998aa4273859862087` | output (1.7 s) |
| `crit_cond_ii.stdout.txt` | `de620d176b3ee01076fa704f0f7ca1c73cb377f642de42428a894a6fff0ec59c` | stdout |
| `replay/` | the seat's 11 inventoried files, copied out; outputs regenerated byte-identical to `replay/orig/` | replay of F3 |

Background jobs: none started by this critic. The final `pgrep` matched only other sessions' processes (disclosure 2), and none were touched.
