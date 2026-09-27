# Critique

Critic seat `C-T1-F` (orientation F, falsify), Cycle 2 Stage 4, r30. The assigned return is `cycles/cycle-2/stage3/returns/T1/RETURN.md`
(route `C2-T-01 CB-FAMILY-FULL-NETWORK-HALL`, orientation T).

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full. I loaded no other VerityOS subsystem. The dispatch overrides the
startup protocol's task-type map, so I made no memory, conversation-log, operations, logs or inbox reads or writes. The harness put
the project `CLAUDE.md` and the user auto-memory index `MEMORY.md` into my context at session start. I did not open either file,
and nothing below relies on them.

**Read-boundary disclosures.**
1. To find my own seat's section I ran `grep -n '^#'` on the capsule member `control/C2-CRITIC-ATTACK-BRIEFS.md`. This is one file,
   not a recursive search. It showed me the other seats' section heading lines (seat IDs and route names only). I read only the T1
   section's body.
2. I listed `scratchpad/c2-T1/` once, non-recursively. That directory holds the return's inventoried artifacts and is within my
   grant. I also listed `sources/lower-region/inputs/`, which is within my grant, to confirm that my replay left no
   `__pycache__` there. None was written, because I ran the replay with `PYTHONDONTWRITEBYTECODE=1`.
3. The harness saved the return's full text to a session tool-results file because it was long, and I read the return through
   that copy. It is the same capsule member, and its digest was verified before reading.
4. I did not read: another return, any critique, adjudication, Cycle 1 file, `control/r30_tool.py`, the run-local registry,
   `control/C2-WORKER-COMMON-BRIEF.md`, or any other experiment root. No network access and no installs. I started no background jobs.

## Identity and seal audit

- Dispatch `control/dispatch/c2-stage4/DISPATCH-C-T1-F.md` has SHA-256 `c9b4372fd12fda71fae444fd56a09622f50d72f901f41dc7ed49ae4b41768dc3`.
  It **matches** the wrapper's value. The dispatch file is not itself a member of the Stage 4 dispatch manifest's list, so this
  digest is attested only by the wrapper.
- **Capsule seal** `control/c2-critic-capsules/T1-PACKET-MANIFEST.json`: I recomputed it canonically (SHA-256 of the manifest minus
  `seal_sha256`, `sort_keys`, separators `(",",":")`, no trailing newline) as
  `66225e984e165a7f0c71e1482200f0b01438e526b4cd723e1599d908068bf27a`. It **matches**. All 13 members match in SHA-256 and in bytes.
- Stage 4 dispatch manifest seal recomputed: `a361cd175e7c3968cdf2a8d14f92e9b2b5883b018bd72e837f54f26ce38da383`, matches its field.
  Stage 3 manifest seal recomputed: `4254492f0cbd9fa7881cbd21a57b2c2910768f48c0d3160a2ebb2165a0500b2d`, matches its field; the T1
  return's digest `8c73a6da…ccdaad` is listed there. Stage 2 seal recomputed: `2bf054d6458e4ce9911c7679a2a2747df9bf9b885fbcdc34fe5fbee7e09c37da`, matches.
- The capsule has no `C2-STAGE3-READ-BOUNDARY-DISCLOSURES.json`. The return nonetheless discloses four boundary events on its own
  face:
  - it booted before reading the dispatch;
  - it read `skills/optimization-loop/skill.md`;
  - it ran `ls experiments/`;
  - it ran `find <run root> -maxdepth 3 -type d`.
  None of these feeds its mathematics. They are recorded here for the controller.
- Return-listed digests. All 10 of T1's scratch files and stdout digests match after copy-out. **Replay:** I ran all five T1
  scripts from my copy (`replay/`). Each reproduces its shipped stdout **byte-identically**: the `rep_*.txt` and `out_*.txt`
  digests are equal for `cb_network`, `cb_rows`, `spectral_node`, `tree_check` and `transport`. The sources T1 used
  (`ordinary_tree_checked.py` and `cb-switch-cut/{RESULTS.json,run.py,PROTOCOL.md}`) match `control/SOURCE-DIGESTS.json`. I did not
  re-hash T1's other cited files (worker brief, ROUTE-STATE, registry, SR-SECTOR) because they are outside my capsule.
- Model disclosure on the return: "chartered sonnet/xhigh … `claude-sonnet-5`". This is consistent with the allocation (routes are
  Sonnet 5 xhigh) and with the gate's alias preflight.

## Independent re-derivation

My instrument (`own/`, stdlib only) is independent of T1's code and of the authorized evaluator:

- a generic tree DP for the independence polynomial;
- a second generic DP for `W(t) = Σ_B w_F(B) t^{|B|}`. It encodes the active-tag rule directly from SEMANTIC-CONTRACT §1.2: a tag
  child `v` of an out-vertex `s` is active iff `s` has at least 2 in-neighbours, `v` plus another;
- literal brute force: enumerated independent sets, literal `w_F`, literal (D)∪(S), and an exact Edmonds–Karp max-flow.

**Validation** (`validate.py`, digest `81575cfa…`):
- `W` equals the literal `Σ w_F` layer by layer on 60 random trees (n ≤ 12, random `F`) and 6 small `CB(d,m)`, 424 layers in all.
- WID `[t^{p+1}]W − [t^p]W = S` holds for 292 `(tree, p)` pairs, with `S` computed separately from `H_v`/`R_v`.
- My closed forms equal the DP output. I derived them myself:
  - `I(CB) = t(1+t)(1+2t)^N + (1+2t)β^m`, with `β = (1+2t)^d + t(1+t)^d`;
  - `W = t²(1+2t)^N + (1+2t)·md·t²(1+t)^{d−1}β^{m−1}`.
- Fixed point `K_{1,12}`, `p = 8`: `α = 12`, `x = 6`, 12 favorable, supply 1980, capacity 3960, `S = −1980`, max-flow 1980, 1980 arcs.
  All match the common brief.

**The five rows** (`rows.py`; `out_rows.txt` digest `32ddfd91…`, internal DIGEST `019e4f7e…`). The tree check passes on each. `x`
is computed through rank `α`. Favorability `Δ_p(T − v) < 0` is checked at the original rank for the arm leaf and for two private
leaves (the first and the last). The selector is `Aut`-invariant, so all `dm + 1` leaves are favorable. `S` comes from
`H_v`/`R_v`; supply and capacity come from the literal-rule DP. **WID holds from genuinely independent sides on all five rows.**

| row | n | α | x | eligible | S | k | Z′ | δ | x₀ | |X″| digits | |X″|/R_k |
|---|---|---|---|---|---|---|---|---|---|---|---|
| CB(8,86)/460 | 1465 | 775 | 458 | yes | <0 | 459 | 230 | 459/460 | 1/460 | 321 | 3.119e−7 |
| CB(8,89)/476 | 1516 | 802 | 474 | yes | <0 | 475 | 238 | 475/476 | 1/476 | 332 | 1.847e−7 |
| CB(8,92)/492 | 1567 | 829 | 490 | yes | <0 | 491 | 246 | 491/492 | 1/492 | 343 | 1.093e−7 |
| CB(8,108)/577 | 1839 | 973 | 575 | yes | <0 | 576 | 289 | 288/289 | −287/289 | 403 | 6.482e−9 |
| CB(7,144)/673 | 2163 | 1153 | 671 | yes | <0 | 672 | 337 | 336/337 | −335/337 | 465 | 2.560e−15 |

T1's Lemma C (ii) margins `x₀R_k(1−c)/|X″|`, with `c = (d−1)(1−δ)`, are reproduced **exactly** by my own code: 6863.2558,
11209.5441 and 18328.2771. This makes a third instrument for those margins. The `X″` closed form `g_d = (1+2t)^d − d·t((1+t)^{d−1} − 1)`,
and my shadow formula for `∂X″`, match brute force on `CB(2,2)`, `CB(3,2)`, `CB(2,3)`, `CB(3,3)` and `CB(4,2)` at every sector rank
(`sector.py`, digest `be8922da…`). The same run confirms two sector facts by brute force: sector weight is exactly 1, and every
switch target lies outside the sector (`r ∉ A`, Fact A).

**The flip-character theorem, re-derived.** `M = BBᵀ` acts on the support-rank `k−1` layer of `{0,1,2}^N`, with `Z′ = N − k + 1`.
For `g ≠ g′`, `M_{g,g′} = 1` iff `g′ = g − i + (j, colour)` with `i ∈ supp g` and `j ∉ supp g`. That common upper cover is unique,
and a recolouring has no common upper cover. The diagonal is `2Z′`. For `J ⊆ supp g`, only removals `i ∉ J` keep `χ_J`, and each
gives `χ_J(g)` over `2Z′` added pairs, so the eigenvalue is `2(k−|J|)Z′`. If `|J ∖ supp g| = 1`, the two colours of the added
coordinate cancel. If it is at least 2, every term is zero. T1's case analysis is **correct and exhaustive**. I also checked it for
**every** `J` with `|J| ≤ k−1` on 10 pairs `(N,k)` up to `(7,4)`, not one representative per size (`spectral.py`, `out_spectral.txt`
digest `1b573159…`).

## Attacks and findings

**F1 — (n1) closed: the flip characters are not a complete eigenbasis, and the bound holds anyway (critic-derived advance, C-T1-F).**
T1 frames the gap as "general completeness of the flip-character eigenbasis" (Step 2 item 4; Remaining obligation 3). That
statement is **false**. The `χ_J` span `Σ_{r<k} C(N,r)` dimensions, while the layer has `2^{k−1}C(N,k−1)`: for example 11 against 24
at `(4,3)`, and 64 against 280 at `(7,4)`. T1 asks a successor to prove something false. The bound is nonetheless true, by the
following complete decomposition.

*Theorem (C-T1-F).* Functions on the layer split orthogonally as `⊕_{|J| ≤ k−1} V_J`, where `V_J = {χ_J(g)·h(supp g) : h on the
(k−1)-sets ⊇ J}`. This is Fourier analysis on `{±1}^S` for each support `S`, and the dimensions sum correctly. Each `V_J` is
`M`-invariant. The computation is the one above with `h` in place of the constant, and the colour sum kills leakage across blocks.
On `V_J`, `M ≅ 2Z′I + 2A(J(N−r, k−1−r))` with `r = |J|`, where `A(J(·,·))` is the Johnson-graph adjacency. Consequences:
- For `r ≥ 1`: the Johnson graph `J(N−r, s)` with `s = k−1−r` is `s(N−k+1)`-regular, so every eigenvalue on `V_J` is at most
  `2(k−r)Z′ ≤ 2(k−1)Z′`.
- For `r = 0`: `M|V_∅ = 2·D_kU_{k−1}` on the Boolean layer `k−1`. The commutation identity `D_{j+1}U_j = U_{j−1}D_j + (N−2j)I`,
  which T1 re-derived, gives by induction a top eigenvalue on `𝟙^⊥` of `j(N−j−1)`. Here that is `2(k−1)(N−k) < 2(k−1)Z′`. The
  induction uses the fact that `D` maps `𝟙^⊥` into `𝟙^⊥`.
- **Hence `λ₂(M|𝟙^⊥) = 2(k−1)Z′` exactly, with multiplicity exactly `N`, attained only by the singleton characters.**

Exact checks on 10 `(N,k)` pairs:
- `V_J` invariance and block form hold on every basis vector;
- the predicted multiplicities sum to the dimension;
- `tr(M^e)` for `e = 1..4` equals the block-spectrum prediction;
- an exact Fraction LDLᵀ shows `2(k−1)Z′I − M + (2Z′/dim)𝟙𝟙ᵀ` is PSD with nullity `N+1`, on the 8 pairs small enough.

Grade: `proved_informal`. It is first stated at a review stage, so it needs an isolated second read. **Consequence:** the "modulo (n1)"
qualifier on Lemma C can be discharged for that node.

My re-derivation of the rest of Lemma C (ii) from T1's code and the registered NM:
- **Fact D:** by Cauchy–Schwarz, `(k|X|)² ≤ |∂X|·‖B1_X‖²` and `‖B1_X‖² ≤ λ₂|X| + (|X|²/R_k)·2Z′`.
- **Fact B:** a switch exit of weight `b` has at most `d − b` sector preimages, so the switch capacity is at least `|X∖X″|/(d−1)`.
- **Fact A:** switch targets have `r ∉ A`.
- **NM:** `|∂X| ≥ δ|X|`.

Together these give sector Hall (every `X ⊆ X_sec`) at all three rows whenever `x₀R_k(1−c) ≥ |X″|`. That condition is the exact
margin inequality above. Grade of this composition: `proved_informal` for the argument; the three margin inequalities are exact
finite arithmetic (`computer_assisted`). The composition therefore stands at `computer_assisted`. It is STATED here and needs an
isolated second read.

**F2 — The WID "independent sides" on the five large rows are non-falsifiable (ruling 17; struck).**
In `cb_rows.py`:
- `supply := Σ q_v(p)` and `capacity := Σ q_v(p−1)`;
- `S := Σ g_v` with `g_v = Δ_{p−1}(H_v) − Δ_{p−1}(R_v)`;
- all three come from the same `H_v`/`R_v` polynomials, so `supply − capacity = S` is an algebraic identity.

"Supply" is never computed as a layer sum of `w_F` on those rows. The return's claims to "independently computed sides", and
`wid_check = True` as evidence on the five rows, are **struck**. T1's small-row check (`transport.py`, literal `w_F`, n ≤ 18) is
genuine, and it replays. My instrument supplies the missing large-row check (Independent re-derivation): WID holds on all five rows.

**F3 — Step 3's non-sector piece has no valid support.** The problem is T1's reasoning, not a bare "unverified assumption":
- NM's hypothesis is a unit-weight sector over an induced perfect matching, and P8/P9 are criteria for the root-plus-arm sector
  only. Neither applies to the other source classes. Positive-weight non-sector sources have `r ∉ B`, with weight equal to the
  number of leaves under included chokes, and that weight varies within a layer.
- T1's reason that the other classes are "far from threshold" is that the "local δ-analogue involves only that one choke's
  `d`-sized structure". That is false. A core-only class (`r, s, v ∉ B`, with exactly `q` included chokes) carries a ternary part
  on `(m−q)d` pairs, which has global size.
- My exact whole-class computation (`qclass.py`, validated by brute force) compares supply with the total weight of all same-class
  targets one rank down. The maximum of supply/capacity is **0.9902, 0.9905, 0.9909, 0.9939 and 0.9955**, all at `q = 1`. None
  exceeds 1, but all are within 1%. (The script also prints supply divided by an *upper* bound on cross-class capacity, ≤ 0.37.
  That figure bounds nothing and is not evidence.) So I found no second deficient class, but the margin is thin, and subfamilies
  were not tested. T1's "proved_conditional" grade for the non-sector piece is struck to **open**.

**F4 — the mixed case is mis-framed, and it misses a competition channel. Critic-derived partial result, C-T1-F:**
- T1 casts the gap as combining "two independently built flows". (HALL-COND) is a set inequality:
  `cap(N(X₁) ∪ N(X₂)) ≥ w(X₁) + w(X₂)`. It can fail even when both pieces satisfy Hall. T1's paragraph also contradicts itself: it
  says "THE ARGUMENT ACTUALLY GOES THROUGH" and then says the gap is not closed.
- T1 considers only competition for the sector's switch exits. Arm-v sources (`r, s ∉ B`, `v ∈ B`) with exactly two included chokes
  also reach **in-sector deletion targets** (`r, v ∈ A`) through the `r`-switch `A = B − {u_i, u_j} + r`. This channel is confirmed
  by brute force (`competition.py`: 15, 63, 405 and 5103 such arcs on `CB(2,2)`, `CB(3,2)`, `CB(2,3)` and `CB(3,3)`).
- *Exact competition map.* Positive-weight targets that sector sources reach all contain `v`. Among non-sector sources, only
  arm-v sources reach positive-weight targets containing `v`. Arm-s and core-only sources reach only `v`-free targets. This is proved
  on the face from (D)∪(S) (a switch can insert `v` only if `|N(v) ∩ B| = 2`, which is impossible), and brute force confirms it on
  four small CBs.
- *Reductions (C-T1-F).* For an arm-v source, `B ↦ B − v` preserves weight and is injective into `v`-free targets. Hence:
  - (i) at the three rows, (HALL-COND) holds for **every** `X ⊆ X_sec ∪ {arm-v sources} ∪ {weight-0 sources}`, given sector Hall (F1);
  - (ii) for any `X` with no arm-v source, Hall(`X`) follows from Hall(`X ∩ X_sec`) together with Hall(`X ∖ X_sec`).

  The remaining part of obligation (a) is therefore exactly this: families that mix arm-v sources with arm-s or core-only sources,
  coupled through the shared `v`-free targets `(∅, C)` (reached from `(v, C)` and from `(s, C)`), and Hall inside the `r`-free
  world. Grade: `proved_informal` given sector Hall. It is STATED and needs a second read.

**F5 — T1's margins do not measure what Step 3 says.** The margins 6,863×–18,328× are the slack
`x₀R_k(1−c)/|X″|` of Lemma C (ii)'s internal composition. They are not "switch-capacity margins … the raw deficit", and they
carry no information about competition from outside the sector. They cannot support the expectation that the joint gap is "close
to mechanical". That wording is struck.

**F6 — Obligation (b) is mis-diagnosed. Exact reduction by the critic:**
- "Composition (ii) therefore has no regime" is false. Only the Fact D half is vacuous. The NM + Fact B half covers every sector
  `X` with `|X| ≥ |X″|/(1−c)`.
- What is left is **every** `X ⊆ X_sec` (not only `X″`) with `|X|/R_k < θ`, where θ = 6.643e−9 at `CB(8,108)/577` and 2.606e−15
  at `CB(7,144)/673`.
- Because `λ₂` is attained (F1), `k²/λ₂ < 1` at both rows, so no spectral sharpening can activate Fact D. A combinatorial
  small-set expansion is required.
- `X″` itself is **not** deficient: the exact values are `|∂X″|/|X″| = 20.51` and `36.01`, from a closed form validated by brute
  force. It is 16.5–17.6 on the three T1 rows.
- Lead, not a claim: a Kruskal–Katona-type bound for 2-coloured subsets (the cross-polytope complex) of subcube type would close
  both rows. Subcube families reach ratio 1 only at relative size 1/3, far above θ.
- Arithmetic error: "δ within 7/289 ≈ 2.4% and 6/337 ≈ 1.8% of 1" is wrong. `1 − δ = 1/289` (0.35%) and `1/337` (0.30%). The values
  7/289 and 6/337 are `c = (d−1)(1−δ)`.

**F7 — Smaller issues.**
- `Aut(CB(d,m))` is written `S_m ≀ S_d` in both the return and `cb_rows.py`. The correct form is `S_d ≀ S_m`, of order `(d!)^m m!`.
- T1 grades Lemma C at `p = 492` as "proved_informal (modulo (n1))". The allocation records `computer_assisted` at 492.
- Lemma C (ii) is carried to rows 460 and 476 on SR-SECTOR's authority, which I cannot read. My reproduction plus F1 now supplies
  those rows independently.

## Mechanism-equivalence and fence check

- No refuted key is revived. The weight is the literal active `w_F` (the code tests the support's other neighbour). The relation is
  (D)∪(S) literally in `transport.py`. Lemma C uses switch arcs, so it is not `E993-R23-LITERAL-DELETE-ONLY-HALL`. My reductions
  in F4 use weight-preserving deletion injections on single classes, with the sector served by its switch exits and no per-leaf
  map. They are not per-leaf down-map injectivity (`E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`) and not the own-support
  unit-capacity rule.
- No closed region is re-proved. No census value is used in a proof. There is no RTree wording. (LIFT) is not used for
  feasibility. WID and C1-LA1/C1-LA2 are cited as awards that exist.
- Fidelity: `F` is fixed at rank `p` and checked; `x` is taken through `α` (`x ≪ α`, so the evaluator caveat does not apply). The
  large-row WID failure is F2.
- Candidate key `E993-R30-TERNARY-COVER-FLIP-CHARACTER-SPECTRUM`. I could not alias-check it against the registry, which is outside
  my capsule. Against every key named in my capsule it is distinct: NM is a degree bound and INV is a symmetry reduction. It is a
  statement about the abstract poset only (no tree, no weight). "SPECTRUM" overclaims T1's statement, which gives eigenvectors, not
  the spectrum. After F1 the predicate that fits is `λ₂(BBᵀ|𝟙^⊥) = 2(k−1)(N−k+1)`, attained with multiplicity `N`, together with the
  full block spectrum. I suggest a predicate name such as `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE`. Its only contribution to
  (HALL) is Fact D inside Lemma C (ii).

## Certification audit

These certification literals are struck or corrected:

1. **"`formally_verified`-grade elementary"** (Step 2 item 4; Grades, twice) and **"`formally_verified`-grade numeric
   confirmation"** (WID). Struck. Nothing on this route was kernel-checked. The eigenvector theorem is `proved_informal`
   (re-derived above). The numerics are `bounded_computation`.
2. **"six `(N,k)` pairs up to `(6,4)`"**. False. The script's pairs are (3,2), (4,2), (4,3), (5,2), (5,3) and (5,4).
3. **"Jacobi … converged … (4,3), (5,3)" and "floating-point confirmation on 5 pairs for no-exceedance"**. Struck. T1's own output
   gives top eigenvalues 11.9937 (exact 12) and 17.9068 (exact 18), with `jacobi_second_matches_predicted: false`. The
   `none_exceed_top_except_top` check is vacuous, because it never tests the second eigenvalue. F1's exact checks replace it.
4. **The Step 5 digit column for `Δ_x`** ("330/340/352/415/485 digits"). No shipped output backs it, and it is wrong. The exact
   values are 326/337/349/408/479. `Δ_{x−1}` at `CB(8,108)` has 411 digits, not 412.
5. **WID "independently computed sides" on the five large rows**. Struck (F2).
6. **"switch-capacity margins … 6,863×–18,328× the raw deficit"**. Mislabelled (F5).
7. **"within 7/289 ≈ 2.4% … 6/337 ≈ 1.8%"**. Wrong (F6).
8. **"proved_conditional" (non-sector) and "bounded_evidence"**. Neither is a SOLUTION-CONTRACT §4 grade. The non-sector piece is
   open (F3).

These literals are backed by replay and my instrument:
- `n`, `α`, `x`, eligibility, all leaves favorable, `k`, `Z′`, `δ`, `x₀`;
- the digit counts of `|X″|` (403, 465) and the ratios `|X″|/R_k` (6.48e−9, 2.56e−15);
- the three margins;
- the 54 branch types.

## Verdict

verdict: retained_narrowed

headline_resolved: no

**What is retained:**
- the orbit/branch-type reduction (`proved_informal`, with `S_d ≀ S_m`);
- the flip-character eigenvector theorem (`proved_informal`, re-derived);
- the five-row data and the three Lemma C (ii) margins (`bounded_computation`, reproduced by a third instrument).

**What is narrowed or struck:** the non-sector piece (open), the mixed-case framing, the obligation (b) diagnosis, the large-row WID
check, and every literal in the Certification audit.

**Critic-derived (C-T1-F, STATED, each needs an isolated second read):**
- (n1) is proved in full, with complete block decomposition and `λ₂ = 2(k−1)Z′` sharp, at `proved_informal`;
- sector Hall at all three T1 rows, at `computer_assisted`;
- the competition map and the arm-v / no-arm-v reductions for obligation (a);
- the exact small-set reduction of obligation (b).

(HALL) is not resolved on any row.

## Remaining obligation

1. **Obligation (a), exactly as narrowed by F4.** At `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`, prove (HALL-COND) for
   families `X` that contain arm-v sources (`r, s ∉ B`, `v ∈ B`) together with arm-s or core-only sources. Such families couple
   through the `v`-free targets `(∅, C)`, which both `(v, C)` and `(s, C)` reach, and through the sector's exits and the `r`-switch.
   Also prove Hall inside the `r`-free world for families without arm-v sources. Everything else reduces to sector Hall (F1) by F4.
2. **Obligation (b).** A small-set deletion expansion `|∂X| ≥ |X|` for every sector `X` with `|X|/R_k < θ` (θ = 6.643e−9 at
   `CB(8,108)/577`; 2.606e−15 at `CB(7,144)/673`). No spectral route can give it (F6). A Kruskal–Katona-type theorem for 2-coloured
   subsets is the natural tool.
3. **Second reads** of F1 and of F4's two reductions before any registration. The synthesis should decide whether to rename the
   candidate key as a predicate.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-crit-T1-F/`.
All scripts are stdlib only, ran in the foreground, and left no background jobs.

`replay/` holds copies of T1's 5 scripts and 5 stdout files (digests as in the return), plus the replay outputs. Each replay output
is byte-identical to T1's:

| file | sha256 |
|---|---|
| `replay/rep_cb_network.txt` | `6a88b556a8386c6b587a65a1c2d9df554aae6230b8fdf0373b2cb31ed42844d9` |
| `replay/rep_cb_rows.txt` | `e16aec1cbb0bc0277965df9115e8b1e30b7f440206d078713cb7169fd397cc69` |
| `replay/rep_spectral_node.txt` | `73d594d40673864fd8dd62983d2688b48db089bc37644ff73e1dc514da05e108` |
| `replay/rep_transport.txt` | `547c3e36d262a059914d9f026e3a2066f55c487e5138d97692978aec5c86e532` |
| `replay/rep_tree_check.txt` | `dff86196660c24cb783129da20324a1e8cf90aed8f1922babe8a56e5a51b7f4a` |

`own/` holds my own instrument:

| file | sha256 |
|---|---|
| `crit_core.py` | `88760140e274ba2c3b588906d0e440186b009e9d467da19629b3a6e2d6b67cf3` |
| `validate.py` | `5ccf13ec6b75ffbe0ad5daeb57c64a4b9293dc4fd0a6978c649b4cd20c70fe50` |
| `out_validate.txt` | `d6460c061fa271b73b6e6c50efef17dc19807f78c7f4fc18320edf530c8da932` |
| `sector.py` | `1c3433d89545697f950d76c87c1c8ca51982af2dd3b238aaf5666db0d4bba476` |
| `out_sector.txt` | `076af42baffff97579575be19aef826f4c4247d3460d163518017e6c85e289d9` |
| `rows.py` | `206b9a600394df3fc4f2bb46310a830e8bf04f46ade037e4fda3e6a667498f3d` |
| `out_rows.txt` | `32ddfd91711bdd0cd1aadf967f236e917e21cea7f4a9b563c951ed015594a42d` |
| `spectral.py` | `de0c358614e90a53ae0fd6b5717470dce14dd3606c08458994ee384bab5c1ef7` |
| `out_spectral.txt` | `1b573159bcf20aa5bb294bfac38722dd362a3c723b6639fdbe3b5551d3df1c09` |
| `competition.py` | `ff80c68d2bfbb4d33869efd72e95e1daf6d3534c6124886849c3f88c868422de` |
| `out_competition.txt` | `000e434eac0acf305894a6aa163eb05d9d2b59e156a2b86864009c537f1b0a75` |
| `qclass.py` | `b610d6ff3d3e0099acc34d455dc70c55dc708ee15c34fb40c7c48a27b218f1b9` |
| `out_qclass.txt` | `006d34a92f797d2c939ad6b55a2a61b5e945a9f9b4a37cba35b0fc8134750be7` |
| `corecls.py` | `e944c20b1f35fbf9804ba1f239f3185ba11c5c9e973f63bbbfffcdc5c6ed46d7` |
| `out_corecls.txt` | `d1de4ca387e4d63a485edd447f9b0a379d015f35988f77d1e571317bf708d17f` |
| `digits.py` | `d61411f6c8591a82a2dc4d87fb8c60a40e727f4d52ef0adf684d50812374f290` |
| `out_digits.txt` | `a819bea5788b1b297fe7c712841e5de17776273f8532698551874ae8f1f82afe` |

`out_sector.txt` was produced before a cosmetic rewrite of `g_poly` in `sector.py`. A rerun of the rewritten script produces
identical stdout, checked with `diff`.
