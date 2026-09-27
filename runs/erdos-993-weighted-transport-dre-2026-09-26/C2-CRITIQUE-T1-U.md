# Critique

Critic `C-T1-U` (orientation U, formal/structural) of seat `T1`, route `C2-T-01 CB-FAMILY-FULL-NETWORK-HALL`, Cycle 2, r30
(Erdős #993, weighted mixed-boundary transport).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** I am operating within VerityOS. Boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, read after I verified the dispatch digest. No other VerityOS
subsystem was loaded.

**Read-boundary disclosures (complete list).**
1. The harness injected the project `CLAUDE.md` and the user auto-memory index `MEMORY.md` into context at session start. I did not open either, and nothing below relies on them.
2. `verity.md` was read in full with `cat`, but the tool display truncated about 5,000 characters in the middle, and I did not re-read them. The startup protocol was displayed in full.
3. To locate my seat's section, I ran `grep -n '^#'` on the capsule member `control/C2-CRITIC-ATTACK-BRIEFS.md`. This displayed the heading lines of the other five seats' sections (seat and route names only). I read only lines 1–42 (preamble plus the T1 section).
4. In `sources/` (granted), I ran a non-recursive `ls authority/` and `ls -a lower-region/inputs/`, and parsed `sources/authority/CLAIM-IDENTITY.json` for an alias check.
5. I did not read the run-local registry `control/CLAIM-IDENTITY.run-local.json` or `second-reads/SR-SECTOR/`. Neither is a capsule member. Statements about their contents below are reported as T1's, not verified.
6. I read no other return, critique, adjudication, experiment root or external source. There was no network use and no install.
7. One foreground command (`own/rows_b.py`, an over-long local search) was auto-moved to the background by the harness after its 600 s timeout. I stopped it through the harness `TaskStop` with its task id (`bo4jyw24w`). That was not a pattern kill, and I ran no process listing. Its partial stdout is kept as `own/out_rows_b.txt`. The harness also kept its own copy at `/private/tmp/claude-501/…/tasks/bo4jyw24w.output`, which I did not write.
8. No background job is running at the final write. No Lean was needed or run.

## Identity and seal audit

All checks were recomputed by me as SHA-256 of compact key-sorted JSON (`separators=(",",":")`) with `seal_sha256` removed and no trailing newline.

- **Dispatch file** `control/dispatch/c2-stage4/DISPATCH-C-T1-U.md`: `793ccef9d3ab975c47e9d1f8105fd7d28585ab761d23838381b70916651d528d`. **Matches.**
- **Capsule seal** `control/c2-critic-capsules/T1-PACKET-MANIFEST.json`: recomputed `66225e984e165a7f0c71e1482200f0b01438e526b4cd723e1599d908068bf27a`. **Matches.** All 13 members match on both byte count and SHA-256.
- **Stage 2 seal**: `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`. **Matches.**
- **Stage 3 seal**: `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`. **Matches.** Its manifest lists `returns/T1/RETURN.md` at `8c73a6da…ccdaad`, the same digest as the capsule.
- **Stage 4 dispatch seal**: `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383`. **Matches.**
- **Return-listed digests.** All ten of T1's scratch digests match on my copy-out:
  - scripts: `cb_network.py`, `transport.py`, `spectral_node.py`, `cb_rows.py`, `tree_check.py`;
  - stdout files: the five `out_*.txt`.
- **Replay.** I re-executed all five T1 scripts copy-out-first in `scratchpad/c2-crit-T1-U/replay/run/`, with `PYTHONDONTWRITEBYTECODE=1 python3 -B`. All five stdouts are **byte-identical** to T1's shipped outputs. No `__pycache__` was written under `sources/lower-region/inputs/` (checked afterwards).
- **Digests T1 checked that I did not re-verify.** The return also cites digests for `ROUTE-STATE.md`, the Stage 2 `C2-WORKER-COMMON-BRIEF.md`, the run-local registry and `SR-SECTOR/SECOND-READ.md`. These files are outside my capsule, so I did not check them.
- **Award labels.** The return cites only C1-LA1 and C1-LA2, and no nonexistent award label.
- **Boot disclosures.** The return's own read-boundary disclosures (items 1–4: boot ordering, `skills/optimization-loop/skill.md`, `ls experiments/`, and a depth-3 `find` rooted at the run root) are self-reported. I record them for the adjudicator. I have no means to check them.

## Independent re-derivation

My instrument is in `scratchpad/c2-crit-T1-U/own/`. It uses only the standard library and exact integers or `Fraction`. It is written from SEMANTIC-CONTRACT §1.2 and shares no code with T1's scripts or with `ordinary_tree_checked.py`.

**R1. Fixed points (literal `w_F`, literal (D)∪(S), Dinic max-flow): all reproduced exactly** (`fixed_points.py`, `out_fixed_points.txt`).

| Instance | n | α | x | p | \|F\| | Supply | Capacity | S | Flow | Arcs | Switch arcs |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `K_{1,12}` | 13 | 12 | 6 | 8 | 12 | 1980 | 3960 | −1980 | 1980 | — | 0 |
| path-star (2,3,4) | 15 | 11 | 5 | 7 | 10 | 1483 | 2701 | −1218 | 1483 | 2025 | 281 |
| path-star (2,2,4,3) | 18 | 13 | 6 | 8 | 12 | 8033 | 13467 | −5434 | 8033 | 11691 | 1971 |

On every instance, WID was asserted from literally computed sides against the C5LA1 per-leaf aggregate. I did not reproduce the `T_m` or `CB(8,92)` orbit fixed points by flow. The free-tree counts are not exercised, because my instrument does not generate free trees.

**R2. The five T1 rows (`rows_fidelity.py`, `out_rows_fidelity.txt`).**

My own generic tree DP gives:

| Row | n | α | x |
|---|---|---|---|
| `CB(8,86)/460` | 1465 | 775 | 458 |
| `CB(8,89)/476` | 1516 | 802 | 474 |
| `CB(8,92)/492` | 1567 | 829 | 490 |
| `CB(8,108)/577` | 1839 | 973 | 575 |
| `CB(7,144)/673` | 2163 | 1153 | 671 |

- `x` is computed through rank `α`, including `Δ_α = −i_α`. I assert `Δ_x < 0` and every `Δ_j ≥ 0` for `j < x`.
- All five rows are eligible.
- `F_p(T)` is the whole leaf set (`1 + dm` leaves). I checked `Δ_p(T − v) < 0` for the arm leaf and for one private leaf. `S_d ≀ S_m` is transitive on the private leaves, and `F_p` is always `Aut`-invariant.
- `S < 0` on every row, computed from the C5LA1 definition via my DP on `H_v` and `R_v`.
- **supply − capacity = S holds from genuinely independent sides.** Supply and capacity come from a class-level closed form for the weighted layer sums:
  - `Σ_B w_F(B) t^{|B|} = t²(1+2t)^{dm} + (1+2t)·t·W'(t) + W'(t)`, where
  - `W'(t) = m·d·t²(1+t)^{d−1}·β^{m−1}` and `β = (1+2t)^d + t(1+t)^d`.

  This closed form counts active tags by arm state; it does not use the `q_v`/`Δ` route. Brute force validated it class by class against the literal network (`cb_small.py`, 7 configurations).
- `3p < 2dm + 5` (the P8 sector-deficiency criterion) holds on all five rows.

**R3. Eligible small CB rows, literal full network (`cb_eligible_flows.py`).**

| Row | n | Supply | Capacity | S | Mixed max-flow | Deletion-only max-flow |
|---|---|---|---|---|---|---|
| `CB(1,7)/10` | 24 | 29190 | 58002 | −28812 | 29190 | 29190 |
| `CB(1,8)/11` | 27 | 177576 | 322112 | −144536 | 177576 | 177576 |
| `CB(2,5)/10` | 28 | 259980 | 396460 | −136480 | 259980 | 259980 |

All three rows are eligible with `F` equal to all leaves, and all saturate by deletion alone. This is `bounded_computation`. These rows are far from the `3p < 2dm + 5` regime and test nothing about the sector deficit. T1 itself reported only seven **non-eligible** small rows. Its `hall_holds` fields there are calibration, not Hall evidence.

**R4. Node (n1): complete spectrum. This is a critic-derived advance (C-T1-U), which T1 left open.**

*Setting.* Let `L_j` be rank `j` of `{0,1,2}^N` (`|L_j| = 2^j C(N,j)`). Let `M_lo = BBᵀ` on `L_{k−1}` (common upper covers; T1's operator) and `M_hi = BᵀB` on `L_k` (common lower covers). Their nonzero spectra coincide, and `Z' := N − k + 1`.

*Proof.*
1. **Colour flips commute.** The colour flips `σ_t` (1↔2 at coordinate `t`) generate `G = (ℤ/2)^N`. Each is a poset automorphism, so each commutes with both operators.
2. **Isotypic decomposition.** The `χ_J`-isotypic component of `G` on functions on `L_j` is `V_J = {g ↦ χ_J(g)·f(supp g)}`, with `f` on the supports `S ⊇ J`. Here `χ_J(g) = ∏_{t∈J} (±1)` and `χ_J(g) = 0` unless `J ⊆ supp g`. The dimensions add to `Σ_{|S|=j} 2^{|S|} = |L_j|`, so the decomposition is complete and each `V_J` is invariant.
3. **Low side.** Take `|J| = r`. T1's own swap case analysis, with the extra factor 2 from summing the added coordinate's colour, gives `M_lo|_{V_J} = 2Z'·I + 2·A(J(N − r, k − 1 − r))`. `A(J(n,m))` is the Johnson-graph adjacency on the `(k−1−r)`-subsets of `[N]∖J`.
4. **High side.** Colour flips inside the support now contribute `k − 2r`, giving `M_hi|_{V_J} = (2k − 2r)·I + 2·A(J(N − r, k − r))`.
5. **Johnson spectrum.** Johnson graphs have spectrum `θ_i = (m − i)(n − m − i) − i` for `0 ≤ i ≤ min(m, n − m)`. Proof:
   - `A = U_{m−1}D_m − mI`.
   - I checked directly that `D_mU_{m−1} = U_{m−2}D_{m−1} + (n − 2m + 2)I` (T1 re-derived the same commutation identity).
   - Induction then shows the spectrum of `U_{m−1}D_m` is `{(m − i)(n − m + 1 − i)}`, using `(m−1−i)(n−m+2−i) + (n−2m+2) = (m−i)(n−m+1−i)`.
6. **Top eigenvalue.** It is `2kZ'` (`r = 0, i = 0`), and it is simple because the Johnson graph is connected.
7. **Everything else is at most `2(k−1)Z'`.**
   - For `r ≥ 1`, eigenvalues are at most `2Z' + 2(k−1−r)Z' = 2(k − r)Z' ≤ 2(k−1)Z'`. Equality holds exactly at `r = 1, i = 0`, whose eigenvector is `χ_{{t}}` (T1's theorem).
   - For `r = 0, i ≥ 1`, the largest is `2Z' + 2[(k−2)(N−k) − 1] = 2(k−1)(Z' − 1) < 2(k−1)Z'`.

**Result: `λ₂(BBᵀ on 𝟙^⊥) = 2(k−1)(N−k+1)` exactly, for every `N ≥ k ≥ 2`, on either layer.** T1's flip-character family is exactly the top vector of each `V_J`. The "completeness" gap T1 names needs no wreath-product representation theory: the isotypic decomposition is complete by the dimension count in step 2.

*Exact confirmation* (`spectrum.py`, `out_spectrum.txt`). This covers 10 `(N,k)` pairs — (3,2), (4,2), (4,3), (5,2), (5,3), (5,4), (6,2), (6,3), (6,4) and (7,3) — on both layers (20 operators). On every operator:
- the predicted multiplicities sum to the dimension;
- `tr M` and `tr M²` match;
- `∏_{λ distinct predicted}(M − λI)` annihilates every basis vector in exact integers, so the predicted spectrum is complete;
- **every** `χ_J` (all `J`, all sizes) is an exact eigenvector with eigenvalue `2(k − r)Z'` and is orthogonal to `𝟙`;
- the top eigenvalue is simple, and `second = 2(k−1)Z'`.

*Consequence for Fact D.* The Cauchy–Schwarz shadow bound is `|∂X| ≥ k²|X| / (λ₂ + (2kZ' − λ₂)·|X|/R_k)`. I re-derived it, and its Hall threshold is `x₀ = (k² − λ₂)/(2Z')`. With the value now proved, `x₀` is exact. At the three T1 rows `3p = 2dm + 4`, so `Z' = (k+1)/2` and `x₀ = 1/p`: 1/460, 1/476 and 1/492, as T1 reports.

Grade: `proved_informal`, STATED at a review stage. It needs an isolated second read before registration.

**R5. Lemma C (ii) numerics: second instrument.** I computed `|X''|` from my own branch-type construction (see R6, validated against the literal network), not from `g_d(t)^m`, and used exact `x₀` and `(d−1)(1−δ)`.

| Row | `|X''|/R_k` | Composition margin `x₀R_k(1 − (d−1)(1−δ))/|X''|` | Whole-sector switch multiple |
|---|---|---|---|
| `CB(8,86)/460` | 3.119e-7 | 6863.256 | 6128.8 |
| `CB(8,89)/476` | 1.847e-7 | 11209.544 | 6563.1 |
| `CB(8,92)/492` | 1.093e-7 | 18328.277 | 7012.3 |
| `CB(8,108)/577` | 6.482e-9 | — | 4833.9 |
| `CB(7,144)/673` | 2.560e-15 | — | 9785.5 |

- The margins equal T1's.
- The whole-sector switch multiples (capacity of the switch exits divided by `|X_sec| − |∂X_sec|`) are **computed** here. T1 only cited the 460/476/492 values from SR-SECTOR, so this is a genuine second instrument for them.
- On every row, `|∂X_sec|/|X_sec| = δ` exactly.
- The `|X''|/R_k` values at 577 and 673 equal T1's.
- Scope: this confirms the arithmetic of the composition as T1 codes it. Facts A–D of SR-SECTOR are outside my read boundary, and I do not rule on their logic.

**R6. Obligation (b) rows: X'' is far from deficient (critic-derived, `bounded_computation`).**

- **Formula.** For any family `X_Σ` of sector sources whose branch types `(a,b)` all lie in a type set `Σ`, I derived exact generating functions for:
  - `|X_Σ|`;
  - the in-sector deletion shadow `|∂X_Σ|` (weight 1 each);
  - the choke-switch capacity (weight equal to the branch's leaf count).

  Every other exit has weight 0. The formula agrees with the literal network (`literal.py` targets, literal `w_F`) in **168/168** brute-force cases (random `Σ`, `CB(2..4, 2..3)`, all `p`) (`validate_sector_families.py`).
- **X'' results.**
  - `X''` (Σ = all types except `a = 1, b ≥ 1`) has switch capacity 0, as T1 says.
  - Its deletion shadow is **20.51×** `|X''|` at `CB(8,108)/577` and **36.01×** at `CB(7,144)/673` (16.5×–17.6× at the three T1 rows).
  - So Hall holds at `X = X''` with a very large margin. The generic NM ratio `δ` that T1 quotes for `X''` is only a lower bound and is far from tight there.
- **X_(a ≥ c).** The switch-dead families `X_(a≥c)` have ratios from 21.9 up to 142.4 at 577.
- **Local search.** A short adversarial local search over type sets at 577 (4 starts) found a minimum `(|∂X| + switch)/|X|` of **9.55**.

These are product families only. `Aut(T)`-invariant families are arbitrary unions of branch-type-multiset orbits, so this is evidence, not a proof of sector Hall at 577/673.

**R7. Where the non-sector part competes (critic-derived structural lemma, `proved_informal`, STATED).**

Partition sources and targets by arm state:
- `sec` (`r, v ∈ B`),
- `R0` (`r ∈ B, v ∉ B`),
- `S` (`s ∈ B`),
- `V` (`v ∈ B`, `r, s ∉ B`),
- `O` (none of `r, s, v`).

Weights:
- `sec` has weight 1 and `R0` weight 0.
- `S`, `V` and `O` have weight equal to the number of leaves in branches whose choke is present.

Positive-weight reachability, over all arcs:
- sector targets are reached **only** from `sec` (deletion) and from `V` (the switch at `r`, when `B` has exactly two chokes);
- `V`-targets are reached only from `sec` (choke switch) and `V`;
- `S`-targets only from `S`;
- `O`-targets from `O`, `S`, `V` (by deleting `v`) and `R0` (switch; `R0` has zero supply).

Brute force confirms this reach table on seven small CB configurations (`out_cb_small.txt`). Two consequences follow.

- **(a) Exact reduction.** For `X ⊆ X_sec ∪ R0 ∪ S ∪ O`, the positive-weight neighbourhoods of `X ∩ X_sec` and `X ∖ X_sec` are disjoint. So (HALL-COND) at `X` follows from Lemma C on `X ∩ X_sec` together with (HALL-COND) for `X ∖ X_sec`. **The mixed case T1 left open is exactly the case `X ∩ V ≠ ∅`.**
- **(b) The natural split fails.** In the mixed case, the only `V`-exit not shared with the sector is the deletion of `v`. It lands on `O`-targets, which are exactly the targets of `O`-sources. Take `X₂ = V ∪ O` with the `V`-type targets removed:
  - the targets left are the `O`-targets, with capacity `W'_p`;
  - the supply is `W'_p + W'_{p+1}` (`V`-sources are `{v} ∪ B₀` with `B₀ ∈ I_p(T')` of the same weight).

  Supply exceeds capacity. So "Lemma C for the sector part plus an independent flow for the rest" cannot close the mixed case: `V`-type capacity must be shared.

**Exact whole-class tests** (`out_class_deficits.txt`). All positive-weight targets of each class are reached, since `T'` has no maximal independent set of size `< dm`.
- `deficit(O) = W'_{p+1} − W'_p` is −1.66%, −1.63%, −1.60%, −1.29% and −1.03% of `W'_p` on the five rows.
- `deficit(sec ∪ V ∪ O) = (R_k − R_{k−1}) + W'_{p+1} − W'_{p−1}` is −2.68%, −2.64%, −2.60%, −2.08% and −1.62% of `W'_p`.
- The whole sector is only about 0.2% of `W'_p`, and its deletion deficit is about 4×10⁻⁶ of `W'_p`.

So at class level the non-sector choke world carries roughly 10³ times the sector's deficit in slack. That is a prior for the joint argument, not a proof. Hall inside `O ∪ S ∪ V` for arbitrary subfamilies is a (HALL)-type statement on the choke forest `T' = T − {r,s,v}`, which neither NM nor P9 supplies.

## Attacks and findings

**F1. The large-row WID check is non-falsifiable. Struck under ruling 17.**
- In `cb_rows.py`:
  - `supply := Σ_v q_v(p)`,
  - `capacity := Σ_v q_v(p−1)`,
  - `S := Σ_v [Δ_{p−1}(H_v) − Δ_{p−1}(R_v)]`,

  all from the same two polynomials per leaf orbit. Since `Δ_{p−1}(H) − Δ_{p−1}(R) = q_v(p) − q_v(p−1)` identically, `wid_check = True` is an algebraic tautology.
- `supply` is also never computed from `w_F`. It is the right-hand side of WID's per-layer identity.
- So the return's "WID, independently computed sides, on every eligible row … `supply − capacity = S` exactly" is unbacked for all five large rows. Only `transport.py`'s seven **non-eligible** calibration rows compute literal sides.
- Mitigation: my R2 now supplies the independent-sides assertion on all five rows, and it holds.
- The return's "`formally_verified`-grade numeric confirmation" of WID is struck as well (see F6).

**F2. The flip-character theorem is correct but was checked more narrowly than stated.**
- The case analysis of Step 2 item 2 is exhaustive and correct: `J ⊆ supp g` versus not; `i ∈ J` versus `i ∉ J`; the colour pair `±1` cancels when the added coordinate is the missing `t*`.
- The eigenvalue is `2(k − r)Z'`.
- It achieves `2(k−1)Z'` on `𝟙^⊥` for every `N ≥ k ≥ 2`. The return's "every `N,k`" should read `k ≥ 2`, because the `r = 1` component needs `k − 1 ≥ 1`.
- **However**, the return says `check_phi_eigenvector` verified "every `J` with `1 ≤ |J| ≤ k−1` (one representative `J` per size, all sizes)". The code checks **only singletons** (`for t in range(N)`). That literal is struck. R4 checks all `J` of all sizes.

**F3. The completeness gap is closed by this critic (R4).** The qualifier on node (n1) can now be discharged:
- for `CB(8,92)/492`, the only row where the `x₀` window of Lemma C (ii) is used with (n1) cited;
- and for T1's `lam2 := 2(k−1)Z'` in `cb_rows.py` at all rows.

This happens only after an isolated second read of R4. Removing Lemma C's "modulo (n1)" still also requires the synthesis to confirm that Facts A–D use (n1) exactly as the eigenvalue bound proved in R4, which I cannot inspect.

**F4. Did T1's wording quietly drop the qualifier? Partly.**
- The return keeps "modulo (n1)" in its grades and verdict.
- But Step 2 item 5 says "sector Hall holds at all three rows". The rows `CB(8,86)/460` and `CB(8,89)/476` also rest on Lemma C (ii), and so on the `x₀` window and (n1).
- The Grades section rightly says `proved_conditional` for the three rows. The Step 1/2 prose should carry the same qualifier.

**F5. The Jacobi evidence is misreported. Struck.**
- The return says Jacobi confirmed no-exceedance "for every one of the 5 `(N,k)` pairs where it converged: (3,2), (4,2), (4,3), (5,2), (5,3)".
- It did **not** converge at (4,3) or (5,3). T1's own output shows a top eigenvalue of 11.9937 against a true 12, and 17.9068 against 18, with `jacobi_second_matches_predicted: false`. `max_sweeps = 200` is 200 single rotations, not 200 sweeps.
- `jacobi_none_exceed_top_except_top = True` at those two pairs is therefore meaningless.

**F6. Grade inflation.**
- "`formally_verified`-grade elementary" appears in Step 2 item 4 and in the Grades bullet for the flip-character theorem. "`formally_verified`-grade numeric confirmation" appears in the WID bullet. Nothing on this route was compiled or awarded. All three phrases are struck.
- The flip-character theorem is `proved_informal`, which I confirm after re-deriving it. The WID cross-checks are `bounded_computation`, and the large-row ones are void (F1).
- The non-contract grade names `proved_conditional`, `bounded_evidence` and the route verdict `bounded_evidence` map to `conditional`, `bounded_computation` and a non-standard verdict (SOLUTION-CONTRACT §4).

**F7. The `δ` literal in obligation (b) is wrong. Struck.**
- The return says "`δ` is already within `7/289 ≈ 2.4%` and `6/337 ≈ 1.8%` of 1".
- In fact `1 − δ = 1/289 ≈ 0.35%` and `1/337 ≈ 0.30%`.
- `7/289` and `6/337` are `(d−1)(1−δ)`, the quantity in Fact B's composition threshold, as T1's own `cb_rows.py` computes it.
- The attack brief's "1.8–2.4%" claim is therefore refuted as a statement about `δ`.
- The diagnosis "Lemma C's composition is vacuous exactly because `x₀ ≤ 0`" is confirmed. `x₀ = −287/289` and `−335/337` make Fact D's window empty. Fact B covers only `|X| ≥ |X''|/(1 − (d−1)(1−δ))`. The uncovered sector subfamilies are exactly those smaller than `(289/282)|X''|` (or `(337/331)|X''|`) that Fact B's bound does not reach.

**F8. The Step 3 non-sector claim is a non-sequitur. Grade struck from `proved_conditional` to unsupported.**
- NM/P9 are statements about subfamilies of a single induced-matching sector with constant weight. `I_{p+1} ∖ X_sec` is not such a sector:
  - sources in `S`, `V` and `O` carry weights that vary with the leaves of present-choke branches;
  - the other induced-matching sector shapes of CB fix chokes or leaves in `Q` and have weight `d|I|` or variable weight.
- Even a complete classification "no other deficient sector" would prove nothing for arbitrary `X ⊆ I_{p+1} ∖ X_sec`, because per-sector Hall does not compose (the same composition gap T1 names for the mixed case).
- The attack brief asked whether this assumption can be verified via `3p < 2dm + 5` for every sector shape. That criterion is P8's criterion for the root-plus-arm sector only (N = dm pairs, zero-weight `r`/`v` deletions). It does not transfer to the other shapes, whose `Q`-deletions have positive weight.
- What *can* be said exactly is R7: the class-level non-sector deficits are negative with about 1.0–1.7% slack of `W'_p`, and the sector's only competitor for targets is the `V` class.

**F9. The mixed-case paragraph is internally inconsistent.**
- Its displayed condition `capacity(N₁ ∪ N₂) ≥ capacity(N₁) + capacity(N₂) − capacity(N₁ ∩ N₂)` is inclusion–exclusion. It always holds with equality, so it expresses no gap.
- "No double-spending risk for a single fixed `X`" and "capacity of a union is superadditive-or-equal relative to either piece" (true only as `≥ max`) do not give `cap(N(X)) ≥ supply(X₁) + supply(X₂)`.
- T1's final naming of the gap (a joint constraint across the whole flow) is correct. R7(a)–(b) state it exactly.

**F10. The margins are misdescribed. Struck as characterized.**
- The return says "switch-capacity margins are 6,863×–18,328× the raw deficit". But `margin = x₀R_k(1 − (d−1)(1−δ))/|X''|` (T1's own code, reproduced in R5). That is the overlap ratio between Fact D's upper coverage limit and Fact B's lower coverage limit **inside the sector**. It is not a switch-capacity-to-deficit ratio.
- SR-SECTOR's 6,128.8×–7,012.3× are whole-sector (`X = X_sec`) switch multiples (reproduced in R5).
- Neither number measures competition from non-sector sources, so neither supports "a full closure … very likely achievable". R7(b) shows that the naive composition fails structurally.

**F11. Other items.**
- *Automorphism group.* `Aut(CB(d,m))` is written `S_m ≀ S_d`. The conventional notation is `S_d ≀ S_m` (base `S_d^m`). The claim is false at `CB(1,1)` (a path `P_6`, which has a reflection), which T1 includes among its verification instances. This is harmless at the rows (`m ≥ 86`).
- *Branch-type count.* The count 54 is confirmed.
- *Use of INV.* This is correct. `F_p(T)` is `Aut`-invariant whether or not it is the whole leaf set, so T1's appeal to "whole leaf set" is unnecessary.
- *x computation.* T1 computes `x` via the authorized evaluator's `first_strict_descent` (known caveat). My R2 confirms `x` through `α` on all five rows.
- *Independence of T1's two methods.* The "two separately-coded methods" (`closed_eq_generic`) are independent only for `P(T)`, and so for `n`, `α` and `x`. Favorability, `S`, supply and capacity all come from one generic DP.

## Mechanism-equivalence and fence check

- **Weight.** T1's weight is the literal active-tag `w_F` (`transport.py::active_weight` tests `(B ∖ {v}) ∩ W_v ≠ ∅` with `W_v = N(s_v) ∖ {v}`), not `|F ∩ B|`.
- **Relation.** The relation is literally (D) ∪ (S): switches require exactly two neighbours in `B`. `F` is fixed at rank `p` on the original tree.
- **No revived mechanism.** None of the ten refuted mechanisms is revived. The sector argument uses switch exits, so it is not `E993-R23-LITERAL-DELETE-ONLY-HALL`. T1's route does not propose a deletion-only (CUT).
- **Closed regions.** No closed region is re-proved. Lemma C, P5–P9, INV and NM are used as cited and at their grades.
- **Evidence discipline.** No census value enters a proof, and there is no RTree wording. (LIFT) is not used for quotient feasibility.
- **Spectral key.** The spectral statement is about the abstract poset `{0,1,2}^N` (no tree, no weight). It contributes to (HALL) only through Lemma C's Fact D.
- **Fence violations.** None found.

**Claim identity.**
- (HALL) keeps its master name and stays OPEN. WID, the C1-LA2 key, INV and NM are cited at their recorded grades.
- **Candidate key `E993-R30-TERNARY-COVER-FLIP-CHARACTER-SPECTRUM`.**
  - *Alias check.* There is no lexical or body alias in the frozen master registry (`sources/authority/CLAIM-IDENTITY.json`, 434 entries; zero hits for ternary / flip / spectr / eigen / Johnson / cover-matrix). The run-local registry is outside my grant. Of its four run-local additions, NM is the nearest; it is a double-counting degree bound, mathematically distinct.
  - *Name as predicate.* As stated by T1 (eigenvectors only), the name "…SPECTRUM" is **not** a predicate the statement satisfies, because T1 proves neither completeness nor `λ₂`. With R4 it is.
  - *Recommendation.* Register the complete statement: "on `L_{k−1}` and `L_k` of `{0,1,2}^N`, the spectrum of the cover operator is `{2Z' + 2θ_i(N−r, k−1−r)}` (respectively `{2k − 2r + 2θ_i(N−r, k−r)}`); in particular `λ₂ = 2(k−1)(N−k+1)` on `𝟙^⊥` for `N ≥ k ≥ 2`". Attribute it jointly: T1 for the flip-character eigenvectors, C-T1-U for completeness and `λ₂`. Register it only after an isolated second read.
- **Critic-derived R7.** If the synthesis wants it, it would be a separate `E993-R30-…` structural record, scoped to `CB(d,m)`.

## Certification audit

| Literal in the return | Evidence | Ruling |
|---|---|---|
| Ten scratch digests | match on copy-out; replays byte-identical | backed |
| n, α, x and eligibility on 5 rows | reproduced (R2) | backed |
| `F_p` is all leaves on 5 rows | reproduced (R2) | backed |
| "WID … independently computed sides … on every eligible row" | `cb_rows.py` tautology (F1) | **struck** for all 5 rows; replaced by R2 |
| "`formally_verified`-grade" (×3) | nothing compiled | **struck** |
| flip-character `χ_J` verified "for every `J` … all sizes" | code checks singletons only | **struck** (R4 now backs it) |
| Jacobi "converged" on 5 pairs | not converged at (4,3), (5,3) | **struck** |
| `diag_ok`, `regular_ok`, exact singleton eigenvectors on 6 pairs | T1 output, replayed | backed |
| Lemma C (ii) margins 6863.256 / 11209.544 / 18328.277 | reproduced (R5) | backed, **but misdescribed in Step 3** (F10) |
| `x₀`, `δ` at 577 and 673; `|X''|/R_k` 6.48e-9 and 2.56e-15 | reproduced | backed |
| "`δ` within 7/289 ≈ 2.4% and 6/337 ≈ 1.8% of 1" | actually 1/289, 1/337 | **struck** (F7) |
| "matches U2's 54 branch types exactly" | count confirmed | backed as a count (U2's statement not read) |
| Brute-force branch decomposition "closed form = generic DP = brute force" on 6 small `(d,m)` | `out_cb_network.txt` replayed | backed |
| Non-sector piece `proved_conditional` | non-sequitur (F8) | **struck** |
| SR-SECTOR multiples 6,128.8× / 6,563.1× / 7,012.3× (cited, not computed by T1) | computed by me (R5) | now backed by a critic instrument |
| Step 5 table: `Δ_x` digit counts ("330-digit" etc.) | not re-derived; signs confirmed by R2 | signs backed; digit counts unverified |

**Remaining obligation, judged for exactness.** Items 1–4 are real, but:
- item 1 misstates the gap as "looks close to mechanical" (see R7(b));
- item 2 is ill-posed as stated (F8);
- item 3 is closed by R4 once second-read;
- item 4 is correctly scoped, but its "within 1.8–2.4%" is wrong (F7).

## Verdict

verdict: retained_narrowed
headline_resolved: no

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Retained**, each graded on its own evidence:
- the five-row data (`bounded_computation`, confirmed by an independent instrument);
- the flip-character eigenvector theorem (`proved_informal`; T1's contribution, re-derived);
- the Lemma C (ii) composition arithmetic at 460/476/492 as a second instrument (`bounded_computation`);
- the obligation (b) diagnosis (`x₀ ≤ 0` makes Fact D vacuous), with the `δ` literal corrected.

**Narrowed or struck:**
- the large-row WID check;
- all "`formally_verified`-grade" wording;
- the all-sizes and Jacobi certification literals;
- the non-sector `proved_conditional` claim;
- the margin characterization in Step 3.

**Obligations (a) and (b) are not proved by T1.** (HALL-COND) for `X ⊄ X_sec` is open at all three rows, and sector Hall at 577/673 is open.

**Critic-derived advances (C-T1-U), all STATED and needing an isolated second read:**
- R4: node (n1) proved in full at `proved_informal`, exact `λ₂ = 2(k−1)(N−k+1)`;
- R7: exact localisation of the mixed case to `X ∩ V ≠ ∅`, and a proof that the naive split cannot close it (`proved_informal`);
- R5 and R6: bounded records.

No (CUT) candidate was found. No mechanism status moves.

## Remaining obligation

1. **Mixed case at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`.**
   - By R7(a), prove (HALL-COND) for every `X` with `X ∩ V ≠ ∅`, where `V = {B : v ∈ B, r, s ∉ B}`.
   - Also prove (HALL-COND) for every `X ⊆ R0 ∪ S ∪ O`. This is a (HALL)-type statement on the choke forest `T' = T − {r,s,v}`, which NM/P9 do not supply.
   - The `V`-type targets (`v ∈ A`, `r, s ∉ A`) must be shared between the sector's choke-switch exits and `V`-sources. The sector's `r`-switch-reachable targets are shared with `V`-sources that have exactly two chokes.
   - Any proof must allocate these explicitly. R7(b) shows that separate certificates cannot.
2. **Sector Hall at `CB(8,108)/577` and `CB(7,144)/673`.** Prove it for every sector subfamily `X` with `|X| < |X''|/(1 − (d−1)(1−δ))` (the range Fact B does not cover). Fact D is vacuous there.
3. **Second read of R4** (complete spectrum and `λ₂`). Then discharge "(n1)" in Lemma C at `CB(8,92)/492`, subject to the synthesis confirming that Facts A–D consume exactly this bound.
4. **Registration.** Register the spectral key with the complete statement and joint attribution (T1 eigenvectors; C-T1-U completeness), or rename it if only T1's part is registered.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-T1-U/`.

- `replay/`: T1's ten inventoried files, copied out with digests matching the return.
- `replay/run/`: re-execution. Its stdouts are byte-identical to T1's (digests as in the return).
- `own/` (my instrument; SHA-256):

**Scripts**

| File | SHA-256 |
|---|---|
| `polys.py` | `3ba577c173efe829f92a36e451ad3c199c8afa9c1b7dd0d81141bcfb21ea577d` |
| `literal.py` | `76d50de289da4131ad14c85758db11b0159dc0dfb4b04587c6beb73160167c0d` |
| `classes.py` | `4a98d928df300dcecafdb606e1ca922e0cd7b3c8ed91fdb25e414d11cca3fd1b` |
| `cb_small.py` | `8237e15f201889e42b1e4ee1e9c4ffb56e0ba59ee8ef4c923afabea4504d5a9a` |
| `fixed_points.py` | `6eeb1a36065dadf18bb3782074efd0c879488900b4fa85c90d317933a40bbbb9` |
| `cb_eligible_flows.py` | `d9d6057c879a13cff4c3d74e6804d356fc74455672e3c0a3c4e664228659cc1e` |
| `spectrum.py` | `44c66b20159007f4f87aa962747a5418b0ecc58f48668ffe25f844434198138f` |
| `sector_families.py` | `af9e349aa86135954a8115986a6c0963f0843349761495ce012ae3416303fb5c` |
| `validate_sector_families.py` | `5c402085de443ef5a3be2557a0ec7fc9f5c8f5a26bee324c4ae0ac4d7e5cda4f` |
| `rows_b.py` | `5c246dd368439bba94810e89f084731e2ec163527077abcb91e5986a5d92ef61` |
| `rows_b2.py` | `cd9cf8d6ce92ced0179132ce562118ae027b04747bde927b7156e0e2886c6084` |
| `search_b.py` | `de01cfc2b394e00748bf8faa448faca6faa63555ab83d938facccdee8c48f823` |
| `rows_fidelity.py` | `230c1dee8236801d1bb2e787c38177dd6c0c332b3f7e2d5ab85bdc3c2df45c51` |

**Outputs**

| File | SHA-256 |
|---|---|
| `out_fixed_points.txt` | `c95bb13d44c4c3715cb3f9d3139d3b2f8cd0f2cfc25d6c076059930c5e087c31` |
| `out_cb_small.txt` | `8644dcc2b2e2194be7d56ddc183a0e2b29ac99a075bf0aa249a970522bb251bc` |
| `out_cb_eligible_flows.txt` | `e12d1f6d5737276aa9a3a1d81062ea3ecd1a6d5ece40d8a0a0ccfb4b5c6818bc` |
| `out_spectrum.txt` | `87e5690e01da32e158566c5cdd812700be7f47fac73bf9c5a3a9cbcc550c2ff4` |
| `out_validate_sector_families.txt` | `a16c4aeb1c165be6ab53dd033499aa07d9e088eb08c761a815391d29da8d16ae` |
| `out_rows_b2.txt` | `25ed0161c24a36189dabf3cb873660aba3389b2245beedabd197d8e1966f4e6c` |
| `out_search_577.txt` | `ee6f69eac52c8065e57e52eb154d1536fe301789506c3e2176db98a0ce1396be` |
| `out_rows_fidelity.txt` | `d0bb403768a29237bcbcc193db08f686a0806f09b0614079a7914d42214f0100` |
| `out_class_deficits.txt` | `a8569b66a36b73a0991ebb774dd1bf445bffc6095230a4fc4e597435c4e9fdd3` |
| `out_rows_b.txt` | `b88dd93c0d24f7fd6799bf769772653cd3a5cef0aa71415e324c1e7591f5d1f8` |
| `out_classes.txt` | `f723ce1f0f8b21dad9b86003af915b932c8d1e1283bdd6930bed58e86fbd11de` |

Notes on two outputs:
- `out_rows_b.txt` is the partial output of the stopped run. It holds row 460 and one local-search line (minimum 2.189 over product families at 460).
- `out_classes.txt` holds the first line followed by a float-overflow traceback in its print block. The correct figures are in `out_class_deficits.txt`.
- `out_lemmaC_margins.txt` (R5) has SHA-256 `e396bef4f5b974f1e90d23dd534499a06770d158ce43e6828d1c29224a57a1e5`.

All counts are exact integers or `Fraction`s. Floats appear only in displayed ratios. No PID, wall-clock or host field enters any output.

Reread before close: done.
