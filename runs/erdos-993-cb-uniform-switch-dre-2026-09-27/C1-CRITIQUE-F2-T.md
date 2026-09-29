# Critique

Critic `C-F2-T` (cross-orientation T, prove) of Cycle 1, r31, on seat `F2`: route `C1-F-02`, mechanism token
`LS-TOP-ASYMPTOTIC-AND-ENDPOINT-STRESS`, orientation F. Date 2026-09-27.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other VerityOS subsystem file. Read-boundary disclosures: (1) the harness
injected the repository `CLAUDE.md` and the user's memory index into my context. I did not fetch them and did not use them. (2) I
ran a `grep` over `control/C1-WORKER-COMMON-BRIEF.md` for its scratch and process rules. That file is a Stage 2 member, and the common brief
(a capsule member) authorises reading it, but it is not in my capsule's file list. (3) I ran a names-only `ls` of my own not-yet-existing output
directory `cycles/cycle-1/stage4/critics/F2/`. (4) I read `sources/authority/CLAIM-IDENTITY.json` for the alias check (`sources/` is granted).
The harness saved the assigned return's text to its own tool-results file, and I read it there. It is the same `RETURN.md` content.
I read no sibling return, critique, adjudication, other experiment root or network resource. I ran no recursive search above my grant and no process listing.

## Identity and seal audit

- Dispatch `control/dispatch/c1-stage4/DISPATCH-C-F2-T.md`: SHA-256 `7140b329a1a62ff7853b5d8c48622fd5ae36b1c31b256f2e53d12ecf94e83eaf`. It matches.
- **Capsule seal** (`control/c1-critic-capsules/F2-PACKET-MANIFEST.json`, canonical JSON minus `seal_sha256`, sort_keys,
  `(",",":")`, no trailing newline): recomputed `4103f5cf2aa6c72645acd471dcd36c3c67c47dacc6424725d12b8d06cf9b2bab`. It **matches**. All 14 listed
  files match their SHA-256 and byte count.
- Stage 4 dispatch manifest seal `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b` matches. Stage 3 packet seal
  `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37` matches. Stage 2 seal
  `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc` matches the value the protocol and the return cite.
- The return is `cycles/cycle-1/stage3/returns/F2/RETURN.md`, SHA-256 `46dc1734…4275`, 33,139 bytes. This agrees with both the capsule and the Stage 3 manifest.
- The return lists one digest: `RESULTS.json` SHA-256 `9d600d6069c84e6640ade18e58b0829a33360d7312cf0411c8fd9a60e920d85f`, 16,286 bytes. The shipped file
  matches. **Copy-out-first replay:** I copied `scratchpad/c1-F2/*.py` into `scratchpad/c1-crit-F2-T/replay/` and ran
  `python3 -B generate_results.py`, which printed `SHA256: 9d600d60…d85f`, `BYTES: 16286`. The regenerated file is byte-identical to the shipped one.
  The replay ran as a background job with literal PID 59581. It exited on its own, and `kill -0 59581` confirms it is gone.
- Route ID and mechanism token both appear verbatim. The seat charter is Sonnet 5 high, with a two-part disclosure present (`claude-sonnet-5`).
- **Disclosure record gap (process).** The return's own Disclosures section says a `pgrep -fl "python3 -B -c"` printed the command lines
  of two sibling seats (`c1-F3`, `c1-T3`). The worker brief says "never a full process listing". This was a pattern-filtered listing, but it still exposed sibling
  content. `control/C1-STAGE3-READ-BOUNDARY-DISCLOSURES.json` records F2 as "none beyond the scoped boot", so the transcription
  **omitted** this item. I judge that nothing from it was used: every number in the return is reproduced below by my own instrument, built from the contracts
  alone. The controller should amend the disclosure record.

## Independent re-derivation

My instrument is under `scratchpad/c1-crit-F2-T/own/`, written from `SEMANTIC-CONTRACT.md` §2 without consulting the seat's `model.py` or `ratsimplex.py`.
It is a dense two-phase exact `Fraction` simplex with every row written as `≥`. **Every optimum is certified.** The same code solves the dual LP, a
separate evaluator checks primal and dual feasibility directly, and the two objectives must be equal. That makes each `θ*` a proved LP optimum, not a
simplex self-report. The return's own solver ships no dual certificate. The per-state `Out`/`In` I encode are the contract's:
`Out(β,γ)=β·pb+γ·pc+[β=1,γ≥1]σ(γ)` and `In(β,γ)=(8−n)(pb(β+1,γ)+pc(β,γ+1))` for `n<8`, else 0.

| m | p* | θ* (certified optimum) | = 288/(200m²+82m+5) | exact DP min Out / max In | (1−ρ₁)/θ* | residual ok |
|---|---|---|---|---|---|---|
| 95 | 508 | 96/604265 | yes | 1 / 1 | 30.9946 | yes |
| 107 | 572 | 96/766193 | yes | 1 / 1 | 34.9009 | yes |
| 110 | 588 | 96/809675 | yes | 1 / 1 | 35.8774 | yes |
| 113 | 604 | 96/854357 | yes | 1 / 1 | 36.8540 | yes |
| 200 | 1068 | 96/2672135 | yes | 1 / 1 | 65.1744 | yes |
| 500 | 2668 | 96/16680335 | yes | — | 162.8308 | yes |
| 1001 | 5340 | 96/66827429 | yes | — | 325.9167 | yes |
| 10001 | 53340 | 96/6668273429 | yes | — | 3255.6042 | yes |

- **Fixed points:** `ρ₁(95,508)=1354839571516225/1361543988640524` exactly. `σ(1..3)` at `m=95` are `96/4229855, 32/604265, 288/3021325`, which is §5 of the contract.
- **Fresh rows first (gate ruling 2):** `m=110, 113` reproduce the return's values. My DP over all splittings of `K` and `K−1` gives
  exactly `min Out = 1` and `max In = 1`, independently of the affine rows.
- **Below the class (context only):** `m=5, 14, 80` are feasible with `θ*` equal to the law, certified, and the residual holds. `m=2`: the affine LP is **infeasible**, which reproduces the return.
- **Endpoint values at m=107** reproduce exactly on my vertex: `a=−7/1532386`, `λ=2685/1532386`, `a2=21424/766193`,
  `λ2=−5355/1532386`, `Out=21473/1532386` on every `n=8` state, `Out(0,1)=Out(1,0)=1339/766193`,
  `In(0,1)=In(1,0)=37493/1532386`, `σ(7)=336/766193`, and In-slack `4/766193` on the `n=8` states.
- **Eligibility fixed points:** I derived `I(CB(8,m))` by hand from the tree DP. The `r in` branch gives `x(1+x)[(1+2x)^8]^m` and the `r out` branch gives `(1+2x)G^m`, which is
  the closed form of record. My code checks it against brute-force enumeration on the literal trees CB(2,2), CB(3,2) and CB(2,3).
  `x` is computed through `α`, with `Δ_α=−i_α` counted. Results: `m=95: α=856, x=506`; `107: 964, 570`; `110: 991, 586`; `113: 1018, 602`;
  `200: 1801, 1065`; `500: 4501, 2661`. `p*−x = 2, 2, 2, 2, 3, 7`, and parent descent and eligibility hold at every row.
- **Deletion-only identity:** `R_K/R_{K−1} = 2(8m−K+1)/K = (16m+4)/(16m+1) = p*/(p*−1)` holds identically for every `m ≡ 2 (mod 3)`. This is one line of
  algebra, not a check at rows. My rows confirm it at every `m` above.

## Attacks and findings

1. **The fidelity boundary is honest, but the numbers are template-only.** F2 did not assert (WID) `supply − capacity = S` at any row
   and did not derive `F_{p*}`. It carries `F = leafSet` from the favorability key. Fence 2 and shared rule 2 ask every instrument to do both
   before interpreting a network computation. Every F2 number is a statement about the per-state LP, not the literal network, so nothing it reports is downstream of a
   fidelity failure. The consequence is that **no F2 number may be read as a network fact.** Its "literal laboratory" (d ≤ 4) checks only the counts `|src| = R_K` and
   `|tgt| = R_{K−1}`. It does not check the per-state reduction, meaning the In/Out/switch preimage structure. That remains U2/F1's obligation. As a T-side check I re-argued the
   sector's arc classes from the relation (D) ∪ (S):
   - deleting `r` or `v` lands on weight 0;
   - deleting a `b` or `c` lands in-sector with weight 1;
   - a switch at `s` lands on weight 0;
   - a switch at `u_i` in state `(1,γ)` gives a one-choke image of weight `γ` with exactly `8−γ` sector preimages; for `γ=0` the image has weight 0;
   - supports, leaves and `v` admit no switch.

   This agrees with the template. It is STATED, not a proof on the literal network.
2. **Candidate 2, "tight set invariant in m", is a vertex artifact, not a property of the LP. It is struck as stated.** At `m=107` I added
   `θ ≤ θ*` and minimised or maximised individual row slacks over the **optimal face** (`FACE_107.json`):
   - `Out(0,2), Out(0,3), Out(0,4), Out(0,5)` have minimum slack **0**. Some optimal solutions make them tight.
   - `Out(1,7)` has maximum slack **336/766193**, so it can be non-tight. `Switch(7)` can be made tight, and `Switch(1)` can be made slack by `48/766193`.
   - **Forced** across the whole optimal face: `Out(0,0)` slack `7/1532386`, i.e. `a = −7/1532386`; `In` slack `4/766193` on the `n=8` states;
     `Out(0,1)` and `In(0,0)` tight; `Switch(6)` tight.

   The optimum is not unique, so "the non-tight set at the LP optimum" is ill-defined. F2 measured the vertex its pivoting rule returned; the claim is
   measured, not fitted. My independent simplex returned the same non-tight sets at all 11 feasible rows it solved, which is weak evidence of independence given the similar pivoting. What survives
   is narrower: at `m=107`, `a<0` and the uniform `n=8` In-slack are forced. The `m`-invariance itself remains a bounded observation.
3. **"Affine infeasible ⇒ structural" at m=2 is refuted: the affine separation is strictly conservative there.** The generator's comment
   labels the `m=2` probe "structural, not the affine relaxation's fault". I solved the **exact** all-splittings template at `d=8, m=2, K=11`
   (240 rows, every multiset of two choke states, no affine variables). It is **feasible** with certified optimum
   `θ = 681376/2399605` (`EXACT_SMALL.json`), while the affine LP is infeasible. This answers the return's open question 2, "does the affine
   separation ever fail while the exact system stays feasible?", **yes, at m=2**. That row is outside the class and is recorded only as a template fact.
   Inside the class the question does not bear on (L-S)_top. Any feasible `θ ≤ 1−ρ₁` suffices, and the affine certificate is already a valid
   proof of Out/In over all splittings by summation.
4. **What the m=10001 row rests on.** The row has no DP, but a DP is not needed. The affine rows plus `m·a+λK ≥ 1` and `m·a2+λ2(K−1) ≤ 1` prove
   `Out ≥ 1` and `In ≤ 1` over every splitting on their own. The row does rest on the LP point being exactly feasible, and the seat's generator does not
   re-evaluate feasibility on its no-DP rows. My instrument asserts feasibility directly and certifies optimality by duality at `m=10001`, so the row is now backed.
5. **Margin.** The return's `margin/m` at `m=10001` is misreported as `0.32556`. The shipped exact value gives `3255.6042/10001 = 0.325528`. "Converging
   to ≈0.3256" is replaced by an exact, proved limit of `125/384 = 0.3255208…` with an explicit remainder; see the advance below. The monotone decrease of
   `margin/m` is an observation at the sampled rows and is not proved.
6. **Unbacked literals.** "`p*−x=3` at `m=200` and `7` at `m=500`, independently checked" does not appear in `RESULTS.json` (its eligibility block is
   `m ∈ {95,107,110,113}`). As shipped it is unbacked. My instrument **confirms both values** (`ELIG.json`), so they now stand on my evidence.
   "`In(0,1)` is the largest In value" is false as a general statement. The largest is `In(0,0)=a2=21424/766193`, which exceeds `37493/1532386`.
   The return's hedge "among the sampled states I printed" is the only reading that survives.
7. **Grades.** The deletion-only item is graded "`proved` for the identity at the checked rows". "`proved`" is not a grade on the
   `SOLUTION-CONTRACT.md` §4 ladder, and the identity is universal, not rowwise. Mathematically it is the registered root-plus-arm deletion-only deficit.
   At `t=1` this is `R30-CB-RECORD`, criterion `3p < 2dm+5`, carried in the scope of `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` and of the
   (HALL) key. It is **not new**, and the return did not name that key in its alias check. Its content is also not a statement about (HALL). It is a
   deletion-only deficit, never a CUT.
8. **Endpoints and the σ(7) anomaly.** Confirmed: `σ(7)=336/766193 = (7/2)·θ*` at every in-class row I solved, which is half its Switch cap `7θ*`.
   The optimal-face probe shows the halving is a vertex choice: `σ(7)` can rise to the cap with `θ*` unchanged. So the anomaly is harmless for feasibility.
9. **Residue note** (`16m+4 ≡ m+1 (mod 3)`): correct and record-only.
10. **Horizon.** Exact DP to `m=1001` (seat) and `m=200` (me), and certified LP to `m=10001` (both). These are bounded computations and nothing universal follows from them.

**Critic-derived advance (C-F2-T, attributed to me): the Residual-capacity step in closed form, Darroch-free, for every m in the class.**
The return leaves open "derive `lim m(1−ρ₁)` with explicit `M_0` and remainder". Let `b = 8m−7` and `K = p*−1 = (16m+1)/3`, and set
`w_i = C(7,i)C(b,K−1−i)2^{K−1−i} > 0` for `i = 0..7`. By the Pascal ratio alone, `r_1(K) = Σ w_i t_i` with
`t_i = 2(8m−19+3i)/(16m+1−3i)`, `w_i/w_{i−1} = [C(7,i)/C(7,i−1)]/t_i`, and `1−t_i = (39−9i)/(16m+1−3i)`. Hence, for every
`m ≡ 2 (mod 3)`, `m ≥ 5` (where `8 ≤ K ≤ b`):

`1 − ρ₁(m) = P(m)/Q(m)`, where, with `N_j = 2(8m−19+3j)` and `D_j = 16m+1−3j`,
`P = 39·Π_{j=1..7}N_j + D_0·Σ_{i=1..7}(39−9i)C(7,i)Π_{1≤j<i}D_j Π_{j>i}N_j` (degree 7, leading coefficient `960·16^7`), and
`Q = D_0·Σ_{i=0..7}C(7,i)Π_{1≤j≤i}D_j Π_{j>i}N_j` (degree 8, leading coefficient `128·16^8`).

The integer coefficients are in `RESIDUAL.json`. The identity is checked exactly against the direct coefficient ratio at
`m = 5, 8, 11, 14, 95, 107, 110, 113, 200, 1001, 10001`, including the §5 fixed point. Each inequality below is proved by expanding in
`s = m − m₀` and finding every coefficient ≥ 0 with a positive constant term, which is an exact finite certificate valid for every real `m ≥ m₀`:
- (R1) `Q > 0` and `(200m²+82m+5)·P − 288·Q ≥ 0` for `m ≥ 5`. Hence **`θ_law(m) = 288/(200m²+82m+5) < 1 − ρ₁(m)` for every `m ≥ 5`,
  `m ≡ 2 (mod 3)`**. This includes the whole r31 class, so the Residual row of (L-S)_top holds for the conjectured `θ`.
- (R2) For `m ≥ 107`: **`15/32 − 1/(8m) ≤ m(1−ρ₁(m)) ≤ 15/32`**. So any allocation with `θ(m) ≤ 15/(32m) − 1/(8m²)` meets the Residual row.
  The constant `M_0 = 107` is explicit.
- (R3) For `m ≥ 107`: **`125m/384 ≤ (1−ρ₁)/θ_law ≤ 125m/384 + 1/8`**. The margin limit slope is exactly `125/384`. It equals the certified
  `θ*` margin at every row above, and elsewhere it is a statement about `θ_law`, since the `θ*` law stays a conjecture.
- Side consequence: `P > 0` gives `ρ₁ < 1`, i.e. E1's condition (i) at **q = 1 only**, at `p*`, Darroch-free, for every `m ≥ 5` in the class.
  It is **not** E1(i), which needs every `q`.

Grade: `proved_informal` (critic-STATED; an isolated second read is needed before registration). The algebra is on this face and the
positivity certificates are exact computations. No Newton or Darroch is used anywhere.

## Mechanism-equivalence and fence check

- The mechanism is the r30 choke-local template, stressed and not altered. It is not a refuted mechanism: the allocation is `m`-dependent, so it is not the refuted
  `m`-independent per-choke certificate, and it is neither deletion-only nor all-families compression. No Newton or Darroch is used, by the seat or by me.
- **Fence 1 and ruling 5:** candidate 1, `E993-R31-CB8-TOP-SECTOR-TEMPLATE-BOUNDED-BELOW-M107`, is wholly outside the class (`m < 107`). It is **struck as a
  claim** and kept as a record only. My `m=2` exact-system fact is likewise record-only.
- **Fences 4 and 7:** the return never makes the `θ*` law a hypothesis, and it says census values are not proof. That is correct. The affine separation is sufficient, and I show above that it is
  not necessary (at `m=2`). My advance uses `θ_law` only as a candidate value in the Residual inequality and never as LP optimality.
- No status transfer to (HALL), the aggregate or any other key is made by the seat or by me.
- **Claim identity:** the seat's keys are correctly marked unregistered. Candidate 2 is struck (Attack 2). The deletion-only item is an alias of the registered r30 record
  (Attack 7). My candidate, `E993-R31-CB8-TOP-RANK-RESIDUAL-CAPACITY-ONE-MINUS-RHO1-CLOSED-FORM` (statement R1–R3), was checked lexically against the 491 keys:
  none mentions `ρ₁`, residual capacity or `1−ρ₁`. Mathematically, its q=1 corollary is implied by, and strictly quantifies, the E1 threshold
  key at `q=1`. It adds explicit two-sided bounds and the Residual inequality, which no key states.

## Certification audit

- The `RESULTS.json` digest, bytes and replay are **backed**, and the replay is byte-identical.
- "θ* exact match" at 95–113, 200, 500, 1001, 10001 and below-class rows is **backed**, and upgraded by my dual certificates. Without them it was a simplex self-report.
- "DP-certified min_out=1, max_in=1" is **backed** at 95–113 and 200 by my own DP. At 500 and 1001 it rests on the seat's DP only; the replay reproduces it.
- "Tight/non-tight set invariant" is **struck** as a statement about "the LP optimum" (Attack 2). "Margin/m 0.32556 at 10001" is **corrected** to 0.325528.
  "≈0.3256" is replaced by the proved 125/384 (R3).
- "`p*−x = 3, 7` at 200, 500, independently checked" is **unbacked in the seat's artifact**. It now stands on my `ELIG.json`.
- "`proved`" (deletion-only) is **struck** as a grade literal. The correct label is an alias of a registered `proved_informal` record, and the identity is universal.
- "Structural, not the affine relaxation's fault" (m=2, generator comment) is **refuted** (Attack 3).
- The cutting-plane experiment is correctly ungraded and unshipped.

## Verdict

The computational record is reproduced exactly: a byte-identical replay, and an independent certified-optimal LP that matches the conjectured law at every sampled row. It is retained after
narrowing: candidate 1 is outside the class; candidate 2 is a vertex artifact; one grade literal, one undigested literal and one misreported ratio are corrected;
and the m=2 "structural" reading is refuted. The seat's own contribution is `bounded_computation` throughout. My critic-derived closed form for `1−ρ₁` settles
the Residual row for `θ_law` for every `m ≥ 5` in the class (`proved_informal`, pending an isolated second read). (L-S)_top as a whole stays open:
Out, In and Switch for all `m` are not proved here.

verdict: retained_narrowed
headline_resolved: no

`LS_top: advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. (L-S)_top: closed forms for `pb`, `pc`, `σ` (T1's route) proved to satisfy Out, In and Switch for every `m ≥ 107`, `m ≡ 2 (mod 3)`. The Residual row
   is now reduced to R1 for `θ_law`, or to R2 (`θ ≤ 15/(32m) − 1/(8m²)`) for any other `θ`. That reduction needs an isolated second read of R1–R3.
2. The per-state reduction, from template to literal network, including In/Out preimage structure and the switch-image weight `γ` with `8−γ` preimages, proved on the face (U2), and
   (WID) asserted from independent sides at the fresh rows (F1). No F2 number is a network fact until then.
3. (ELIG-top)(a) for all `m`. F2 and I both add only bounded rows: `p*−x = 2, 2, 2, 2, 3, 7` at `m = 95, 107, 110, 113, 200, 500`.
4. Optional: whether the in-class affine optimum equals the exact-system optimum. This does not bear on feasibility; at `m=2` the two differ.
5. Controller: amend the Stage 3 disclosure record for F2's `pgrep -fl` sibling command-line exposure.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-F2-T/`. Standard library only (`fractions`, `math.comb`,
`itertools`, `json`, `hashlib`, `sys`). No network, installs or Lean. The background replay (PID 59581) exited on its own before this write, and no job of mine is running.

- `replay/` holds a copy-out of `scratchpad/c1-F2/*.py` plus `RESULTS.json` (regenerated) and `RESULTS.orig.json` (shipped). Both are SHA-256 `9d600d6069c84e6640ade18e58b0829a33360d7312cf0411c8fd9a60e920d85f`.
- `own/lp.py` `7a2818cc84adad80e11f0966adce66cb95dda6bc48971aaa0a55c146832bd7e4`: exact simplex plus dual certificate.
- `own/rows.py` `0e51873050e6035efdd38c410ab40d90964c582e166c24b09490c2f088d708f0`: row battery, direct `ρ₁` and DP. `python3 -B rows.py 95,107,110,113 95,107,110,113 ROWS_A` produces
  `ROWS_A.json` `d9058f7a8f3110d1a8b1ac73d6ee7243d00dcc1ca531a17ce233c3c39e8c6f85`. `… 200,500,1001,10001 200 ROWS_B` produces `ROWS_B.json`
  `a2e0d3539c2c99e108d25b695b6e36d524e0cabef34b6f896905b4ace7fd1f66`. `… 2,5,14,80 5,14 ROWS_C` produces `ROWS_C.json`
  `20a6726ddfd22213d3d5d5d09a8ac094fb6b5692aec604de91ac091570501a22`.
- `own/residual.py` `2d4b1f30a6d6a6798454f681116e21189ab818e77e1f7dd609f0318d6dc33518` produces `RESIDUAL.json`
  `3860847a9596c2ea600aee959966f7b185a1b440ee6708453f4e646714fe3570` (P, Q, the identity checks, and the R1–R3 shift certificates).
- `own/exact_small.py` `d9dfd41758a0ad50c6681cbe5b571f80242abcdad859fd78dbc057caa3ce6aa5`: `python3 -B exact_small.py 2` produces `EXACT_SMALL.json`
  `57cba530737f25319603638ee3e5a2952d936a166f6e7a97efc3e259e1fd6b1e`.
- `own/face.py` `f09ef47cda0e4b9997e91d14aada6e806be8dafd86ccb3ebd0f6667b16cd3df2`: `python3 -B face.py 107` produces `FACE_107.json`
  `3ea63f0373148a16a8f7b5df7bc20da1db37c0a0ede37e6c7265ffd2658f7586`.
- `own/elig.py` `bacb5daf8ebcebb465fa1415241231afae023f715e12c7c14d55d6d1dd8b75c6`: `python3 -B elig.py 95,107,110,113,200,500` produces `ELIG.json`
  `54c86f56c8f87cfa60e2bb3cc912353de677e77539eca8854666072013a32b09`.
