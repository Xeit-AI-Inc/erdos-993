# Critique

Critic `C-U2-T` (Cycle 6, r30; cross-orientation T (prove) critic of seat `U2`, route `C6-U-02 COUPLED-CB-EXTREMAL-FAMILY`,
orientation U). Return under review: `cycles/cycle-6/stage3/returns/U2/RETURN.md` (SHA-256
`2c7dfa4839ea80eda5278e011f69820d13b22f4d6ce105ecfb644781c0289084`).

Boot: operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the dispatch's boot pair; `verity.md`'s middle section
was read in a second call because the first output was truncated in display). No other VerityOS file was opened.
The host-injected project `CLAUDE.md` and memory index arrived in context automatically; I did not act on them (no
conversation log, no memory write, no inbox item) because the dispatch confines writes to this file and my scratch.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- Dispatch file `control/dispatch/c6-stage4/DISPATCH-C-U2-T.md`: SHA-256 `25e8e87a4123aa477a78b4e5d5afe9423cd2b27eec55272c114a36a11ca19e56`,
  matching the value I was given. I checked it before following the file.
- **Capsule seal** (`control/c6-critic-capsules/U2-PACKET-MANIFEST.json`): recomputed canonically as SHA-256 of the
  compact key-sorted JSON without `seal_sha256`, with no trailing newline. The result is
  `eed3c4e84e99b1de26498cc7d4c6406a3aed4f65d0748044e234cedb347aebf0`. **MATCH.** All 14 member files match on
  SHA-256 and on byte length.
- Stage 4 dispatch manifest: recomputed seal `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50`,
  which equals the file's field (**MATCH**).
- Stage 3 packet manifest: recomputed seal `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd`,
  which equals the file's field (**MATCH**).
- Stage 2 packet manifest: recomputed seal `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`
  (**MATCH** with the protocol literal).
- The return lists these digests: the replay `RESULT_SHA256 7d131453…c5ec7df7`, which **reproduced** (see
  Certification audit), and `validate_RESULT.json` `da7d1d3d…4ba5`, which is **NOT reproduced**. That literal is
  struck below.
- The capsule includes `control/C6-STAGE3-READ-BOUNDARY-DISCLOSURES.json`. U2's entry there matches the return's
  own process section: named-directory `ls` only, and one bytecode `find` inside its own scratch.
- **Capsule discrepancy (controller record, not the seat's fault).** The U2 section of
  `control/C6-CRITIC-ATTACK-BRIEFS.md` says "Controller replay CF-REPLAY-c6c (a capsule member)". It is **not** a
  member of my capsule. I did not read it. I recomputed `n, α, x`, the windows and eligibility for the laboratory
  rows myself instead. This is the kind of controller-fact-about-capsule-contents defect ruling 50 / R30-E-n
  describes.
- Read boundary (my own). I read the dispatch, the boot pair, the capsule members, and U2's inventoried artifacts
  under `scratchpad/c6-U2/`, which I copied into `scratchpad/c6-crit-U2-T/replay/` before running anything. I
  also ran two non-recursive `ls` calls: one of `sources/` and one of `sources/c5-stage7-sources/` (names only;
  nothing under `sources/` was opened). I ran `ls -R` / `find` only inside my own scratch. The one `ls -la` of
  `cycles/cycle-6/stage4/critics/U2/` to create my output directory showed that a sibling `F/` directory exists;
  I did not open it. There was no network use and no install. I used `python3 -B` throughout, and no
  `__pycache__` was produced.

## Independent re-derivation

**Own instrument** (`scratchpad/c6-crit-U2-T/own/inst.py`, standard library only). It was written from
SEMANTIC-CONTRACT §1.1–1.2 and shares no code with U2. It uses:

- a generic rooted-forest independence-polynomial DP for any deletion set;
- `x` computed through rank `α` (the terminal `Δ_α = −i_α` is included);
- `F_p` derived for **every** leaf separately, with no symmetry shortcut;
- `S(T,p)` from `H_v` / `R_v`;
- the generic literal `w_F(B) = #{v ∈ F ∩ B : (B∖{v}) ∩ N(s_v) ≠ ∅}` (U2's code uses a CB-specialised hand formula);
- literal (D) ∪ (S), with every `u ∉ B` tested for `|N(u) ∩ B| = 2`;
- an exact-integer Dinic that returns both the **minimal** and the **maximal** maximizer (residual reach from
  `s`, and the complement of residual co-reach to `t`).

The `CB(d,m)` orbit quotient under `S_d ≀ S_m` works differently from U2's. **The arcs of each source orbit are
computed literally from one representative set, and each image is mapped back to its orbit descriptor.** There is
no hand-derived switch list. Orbit sizes come from multinomials, and I assert that they sum to `i_j(T)` from the DP
on every layer.

**Fixed points reproduced before trust** (`fixed_points.py`):

| Row | `n` | `α` | `x` | `\|F\|` | Supply | Capacity | `S` | Other |
|---|---|---|---|---|---|---|---|---|
| `K_{1,12}/8` | 13 | 12 | 6 | 12 | 1980 | 3960 | −1980 | 0 switch arcs; flow 1980 |
| path-star `(2,3,4)/7` | 15 | 11 | 5 | 10 | 1483 | 2701 | −1218 | flow 1483; 2025 arcs |
| path-star `(2,2,4,3)/8` | 18 | 13 | 6 | 12 | 8033 | 13467 | −5434 | flow 8033; 11691 arcs |
| `CB(8,92)` | 1567 | 829 | 490 | 737 | — | — | — | window `[492, 552]`; `p = 492` eligible |

I did not attempt `T_m`, because its definition is not in my capsule.

**Literal laboratory** (`literal_lab.py`). I enumerated every independent set literally for `CB(d,m)` with
`(d,m) ∈ {(1,2), (2,2), (1,3), (3,2), (2,3), (1,4), (4,2), (1,5)}`, at every rank `p = 2..α−1`. That is 53
instances, 11 of them deficient.

- WID holds two-sided on every instance: literal supply − capacity against `S` from `H_v`/`R_v`.
- The literal max deficit equals the quotient max deficit on every instance.
- The literal minimal and maximal maximizers are unions of orbits, and they equal the lifted quotient maximizers.
- Output digest `RESULT_SHA256 c9068060…c211558c`.

This independently confirms that binary orbit reachability is a valid reduction (see Attacks A1).

**Named laboratories, own quotient** (`sweep.py labs`). All three rows are non-eligible; the upper window end is
`⌊2α/3⌋`.

| Row | `n` | `α` | `x` | `Δ_x` | Window | `\|F\|` | Supply | Capacity | `S` | Max deficit | Maximizer |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `CB(11,2)/16` | 49 | 25 | 16 | −3276806830 | `[18,16]` | 23 | 7067805096 | 7179544900 | −111739804 | **22458436** | 268 RV + 67 EMPTY + 73 V orbits |
| `CB(10,2)/14` | 45 | 23 | 14 | −20089438 | `[16,15]` | 21 | 931899840 | 851152520 | 80747320 | **86940920** | 204 + 60 + 65 |
| `CB(12,2)/17` | 53 | 27 | 17 | −13711316113 | `[19,18]` | 25 | 58247482128 | 55347377008 | 2900105120 | **3573432896** | 339 + 81 + 86 |

- WID holds two-sided on all three rows.
- On every row the maximizer is **unique** (minimal = maximal) and contains no S-arm orbit.
- The new value `3,573,432,896` is **reproduced by a second, independent instrument**. That covers the brief's
  "reproduce the new value" item. I used my own instrument rather than the frozen Cycle 5 one.

**Broad quotient sweep, own instrument.** Every rank `p = 2..α−1` of:

- `d = 1..13` at `m = 2`
- `d = 1..12` at `m = 3`
- `d = 1..6` at `m = 4`
- `d = 1..4` at `m = 5, 6`

In total: 701 distinct `(d,m,p)` rows, 40 of them deficient, and 13 eligible rows (none deficient). Digest
`SUMMARY_SHA256 a6781fff…d129c27`.

- U2's 14-row sweep (`d = 2..9`, `m ∈ {2,3}`) is reproduced exactly: the same deficient rows and the same
  deficits.
- The characterization holds, with **unique** maximizers, on all 40 deficient rows. Three of them are degenerate
  with `|F| = 1` (see A3).
- All 13 eligible rows in the sweep have full-network max deficit 0. I also ran the deletion-only network
  separately on 7 eligible rows: `CB(3..7,4)` at their first eligible rank, `CB(2,5)/10` and `CB(1,7)/10`. All 7
  saturate with deletion arcs alone. Output `eligible_rows_OUT.txt`. `CB(7,4)/22` and `CB(1,7)/10` are not in the
  sweep; I ran them only there, so 15 eligible rows were solved in all.

**Critic-derived closed forms (C-U2-T; STATED here, pending an isolated second read).** Let

- `Sp_d = (1+2x)^d + x(1+x)^d` (the choke spider),
- `A = (1+2x)^{dm}`,
- `g = (1+x)^{d−1}·Sp_d^{m−1}`.

On `CB(d,m)`:

- `i(T) = (1+2x)·Sp^m + x(1+x)·A`
- `q_v(j) = A_{j−1}`
- `q_c(j) = [(1+2x)g]_{j−1}`

Therefore:

- `S(T,p) = 1_v(A_{p−1} − A_{p−2}) + 1_c·dm·(((1+2x)g)_{p−1} − ((1+2x)g)_{p−2})`

Define the **S-arm balance** `L := (supply of S-arm sources) − (capacity of S-arm targets)`. Then:

- `L = 1_c·dm·(g_{p−2} − g_{p−3})`

I also computed the closed forms for `i(T − v)` and `i(T − c)`. **Validated** in `closedform.py check` on 342 rows
against the DP (`i(T)`, `i(T−v)`, `i(T−c)`, `x`, `|F|`, `S`) and against the quotient (`L`, `deficit(X1)`,
`deficit(X2)`).

## Attacks and findings

**A1. Switch fidelity and binary reachability (brief item 1). Both sustained.**

- I re-derived the five mechanisms by hand and they match (S) exactly. Only `s`, `r`, `u_i` and `b_ij` can have
  exactly two neighbours in `B`; `v` and `c_ij` have degree 1. The firing conditions are:
  - `s`: needs arm `RV`.
  - `r`: needs `[s ∈ B] + #U-chokes = 2`.
  - `u_i`: needs `[r ∈ B] + #supports = 2`.
  - `b_ij`: needs `u_i, c_ij ∈ B`.
- My representative-literal arcs agree with U2's values on every shared row. This is a stronger check than U2's own
  `validate.py`, whose "literal" weight is the same CB hand-specialisation that its quotient uses.
- Binary reachability is valid for the max **value**. Literal arcs are uncapacitated, so for an orbit-union `X`,
  `N(X)` is exactly the union of the quotient-adjacent orbits. The deficiency `X ↦ w(X) − w(N(X))` is
  supermodular, so its maximizers form a ∪/∩-lattice whose largest element is `Aut`-fixed. The maximum over all
  `X` is therefore attained by an orbit union.
- **Minor citation defect.** U2 attributes this to "(INV)/C2-LA1". The registered C2-LA1 predicate asserts the
  *existence* of a positive invariant deficient family, not that the *maximum* is attained invariantly. The right
  support is the elementary lattice argument above, which I supply. (LIFT) is not needed for the value claim.
  Neither point changes a number.

**A2. Uniqueness (brief item i). Sustained on the tested range, though the return never checked it.**

- U2's extractor returns the **minimal** maximizer (residual reach from `s`). Its proof sketch, by contrast, reasons
  about the "unique maximal maximizer". The return never compares the two.
- I computed both. They coincide on all 701 quotient rows and all 53 literal rows. So "the maximizer" is
  well-defined there, among positive-weight families. In the literal network, a zero-weight source whose
  neighbourhood already lies inside `N(X*)` can be added freely, so the statement must say "positive-weight".

**A3. Instance bias (brief item ii).**

- All of U2's 19 instances are **non-eligible**. They have `m ≤ 5`, and `m ≥ 4` occurs only at `d = 1`.
- `S < 0` holds at only 2 of the 19: `CB(11,2)/16` and `CB(9,3)/19`. The other 17 have `S > 0`.
- **Two of U2's 19 instances are degenerate.** At `CB(5,2)/7` and `CB(8,2)/11`, `p < x`, so no private leaf is
  favorable: `1_c = 0` and `|F| = 1`. The only positive sources are the RV sector. The "S excluded" outcome
  U2's sweep records there is vacuous, because the S class is empty. My sweep finds a third such row,
  `CB(11,2)/15`.
- The switch-coupled regime (max deficit `> max(0, S)`) begins at `d = 9`, `m = 2` (`n = 41`). **Neither U2's
  literal flow validation nor mine reaches that regime:**
  - All 5 of U2's positive-deficit literal instances have deficit exactly `S`, with the S arm included.
  - The same is true of all 11 of mine.

  The laboratory values in that regime therefore rest on two independent **quotient** instruments plus the
  closed form of A6. They are not a literal laboratory on the actual row (ruling 49's standard). This is a
  disclosure, not a refutation: the quotient reduction is exact by A1.

**A4. Eligible rows (brief item iii). The characterization is vacuous at every eligible row tested.**

- None of U2's rows is eligible. All 15 eligible rows I solved by quotient have deficit 0, and each has a unique
  maximizer `∅`.
- **The candidate claim as worded in §"Claim registration" is false at every zero-deficit row.** It says the
  maximizer "contains every positive-weight source of arm RV, EMPTY, or V". At `CB(3,4)/11` (eligible; max deficit
  0; unique maximizer `∅`) positive RV sources exist, but the maximizer contains none of them.
- The statement needs the hypothesis "the maximum deficit is positive". With that hypothesis it says nothing
  directly at any eligible row where (HALL) holds.

**A5. The compression lemma (brief item iv). The universal lemma is REFUTED; U2's "confirmed … strictly stronger"
is struck.** This finding is critic-derived.

- The allocation states the lemma as "`c → b` column replacement does not decrease the deficit". This quantifies
  over **every** family `X`. U2 checked a property of **one** family, `X*`: that it is closed under column moves,
  which follows from arm-level membership. The two statements are logically incomparable. "Strictly stronger" is
  false, and "CONFIRMED at every laboratory" certifies nothing about the lemma.
- A `c → b` move `(0, j, l) → (0, j+1, l−1)` is not a relabelling: it changes the orbit. It preserves weight only
  because private tags in N-mode chokes are inactive.
- I tested the natural literal form. Take the Frankl column shift `T_ij(B) = B − c_ij + b_ij` when `c_ij ∈ B` and
  `u_i ∉ B`, and set `C(X) = {T(B) : T(B) ∉ X} ∪ {B : T(B) ∈ X}`. This shift preserves supply. Over 5,400 random
  literal families (half of them orbit unions) on 18 rows, it violates `deficit(C(X)) ≥ deficit(X)` **497 times**.
  This includes an orbit-union family at the deficient row `CB(1,3)/3` whose deficit drops from 15 to 14.
- **Smallest explicit counterexample** (`compression_min_OUT.txt`), at `CB(2,2)/4`, a deficient laboratory row
  with `S = 32`:
  - Take the single source `B = {r, v, b_{1,1}, c_{2,1}, c_{2,2}}`. It has weight 1, and `N(B)` has positive
    capacity 3, so its deficit is −2.
  - Shift column `(2,1)` to get `B′ = {r, v, b_{1,1}, b_{2,1}, c_{2,2}}`. `N(B′)` has positive capacity 4, so its
    deficit is −3.
  - The mechanism: the shift makes choke 2 have exactly one support. That enables mechanism 3 (the `u_2`-switch),
    whose `V`-arm image activates `c_{2,2}`. So `c → b` can **enlarge** the weighted neighbourhood through a
    switch arc.
- The orbit-level reading also fails: 904 violations among 2,742 invariant families, 85 of them with positive
  deficit.
- Caveat: the Cycle 5 text of the lemma is not in my capsule. I tested the allocation's wording in its two natural
  formalisations.
- What survives is the **consequence** the lemma was wanted for: a `c ↔ b`-closed maximizer exists on every
  tested row. That is implied by the arm-level characterization, which is itself only `bounded_computation`.

**A6. The step the return leaves open, attempted. Critic-derived advance by C-U2-T; STATED, grade
`proved_informal` for the lemma, pending an isolated second read.**

*Lemma (CB mixed-family exactness).* Let `T = CB(d,m)`, let `p` be any rank with `2 ≤ p ≤ dm − 1`, let
`F = F_p(T)` (derived), and use the active weight `w_F`. Define

- `X2` = all positive-weight sources,
- `X1` = the positive-weight sources of arms `RV`, `EMPTY` and `V` (that is, all except arm `S`).

Then:

- (a) Every positive-weight target is a deletion image of a positive-weight source of the **same arm**. Hence
  `deficit(X2) = S(T,p)`, by (WID).
- (b) A positive-weight S-arm target is joined only to S-arm sources. S-arm sources are joined only to S-arm
  targets, EMPTY-arm targets, and weight-0 R-arm targets.
- (c) Therefore `deficit(X1) = S(T,p) − L` exactly. With the closed forms:
  `deficit(X1) = 1_v(A_{p−1} − A_{p−2}) + 1_c·dm·(g_{p−1} − g_{p−3})`.
- (d) For every `Y ⊆` (S class), `deficit(X1 ∪ Y) = deficit(X1) + w(Y) − w(N(Y) ∩ S⁺)`. So if the maximizer
  contains `X1`, its S-part is a maximizer of the Hall deficiency of the choke-forest network `Φ = m·S(2^d)` at
  rank `p−1`. That network has the private-leaf tags and Φ's own (D) ∪ (S); the `r`-switch is dropped because its
  images have weight 0.

*Proof.*

- (a): A target `A` of size `p ≤ dm − 1` leaves some column with neither `b` nor `c` present. Then `A ∪ {c}` is
  independent, because `c`'s only neighbour is the absent `b`. It has the same arm. Its weight is at least `w(A)`,
  because adding a vertex never removes a witness. Finally, `A` is its deletion image.
- (b): If `s ∈ A` and `A` is joined from `B`, then:
  - either `s ∈ B`, so `B` is S-arm, since `s`'s neighbours `r`, `v` are then excluded;
  - or `A` is the `s`-switch image of an RV source. All chokes of such a source are N-mode, so `A` has no `u_i`
    and weight 0.

  S-arm images are the following: deleting `s` gives EMPTY; the `r`-switch removes `s` and adds `r`, giving an
  R-arm image of weight 0; every other move keeps `s`.
- (c): Every positive EMPTY target `A` lies in `N(X1)`, because `A ∪ {v}` is a V-arm source of equal weight. So by
  (a) and (b), `N(X1)` consists of all positive targets except the S-arm ones. Then
  `deficit(X1) = (supply − supply_S) − (capacity − cap_S) = S − L`. The closed form for `L` comes from
  `Σ_{|B'|=j} w_Φ(B') = Σ_c i_{j−2}(Φ − N[c] − N[u_i]) = dm·g_{j−2}`.
- (d): Follows from (b) and (c). ∎

Validated on 342 rows. The coverage hypothesis `p ≤ dm − 1` is **necessary**: `deficit(X2) ≠ S` at exactly those
sweep rows with `p ≥ dm`.

*Consequences for U2's two gaps.*

- **Gap 2 (the S-arm criterion) is answered in closed form, conditionally on gap 1 and the all-or-nothing
  dichotomy.** The S arm lies in the (minimal) maximizer iff `L > 0`, that is iff
  `g_{p−2} > g_{p−3}` (when `1_c = 1`). This is confirmed on all 40 deficient sweep rows. `L = 0` occurs only on
  the three `|F| = 1` rows.
- **Gap 1 is not small.** With (a) and (c), U2's candidate (with the positive-deficit hypothesis) **implies** the
  weaker scalar statement below, and this scalar form is all the consequence needs

  (CHAR) max Hall deficiency at `(CB(d,m), p)` `= max(0, S, S − L)`, for `p ≤ dm − 1`.

  Every row I tested satisfies CHAR: 701 quotient rows and 53 literal rows, deficient or not. Its contrapositive
  says:

  **CHAR ∧ S ≤ 0 ∧ S ≤ L ⇒ (HALL) at `(CB(d,m), p)`.**

  So proving gap 1 for all `(d,m,p)` would prove whole-row (HALL) on every eligible CB row satisfying two explicit
  coefficient inequalities. That includes the 218 uncertified switch-necessary rows that T1 and T2 are working on.
  **Gap 1 therefore contains the CB part of the headline.** U2's description of it as "nearly free from CD-1's
  biregularity" for the RV half is struck as unsupported.
- **Bounded cut screen (critic-derived, `bounded_computation`).** I evaluated the validated closed forms at every
  eligible rank of `CB(d,m)` for `d ≤ 13`, `m ≤ 150`: 87,341 eligible rows. The results (`scan_x1_13_150_OUT.txt`,
  digest `9d312ba3…871e136d`):
  - `S < 0` on every row, and all leaves are favorable.
  - `L < 0` on every row.
  - `deficit(X1) = S − L < 0` on every row where the lemma applies (`p ≤ dm − 1`; 83,667 rows).
  - The largest ratio `(S − L)/|S|` is −0.588799 (at `d = 2`).
  - At the first rank of `CB(8,92)` and `CB(8,95)` the ratio is about −0.72.

  So **the canonical sector-plus-regime-3 family `X1` is not a (CUT) at any eligible CB row in that range, and it
  has large slack.** Under CHAR, a CB row with `p ≤ dm − 1` has a deficient family iff `X1` or `X2` is deficient. This bears directly on F1's object
  (mixed sector/regime-3 families), but it is not a proof: CHAR is unproved.

**A7. Fidelity (brief item iv, "Fidelity"). Passes.**

- U2's `w_F` counts active tags only.
- The relation is exactly (D) ∪ (S).
- `F_p` is derived: `1_v` and `1_c` come from fresh deleted-tree DPs, and `wid_check` derives every leaf.
- `x` is computed through `α`.
- The WID sides are independent code paths. They share only the derived `F`, which is by definition on both sides.

I reproduced every row's `S` and `|F|` with independent code, so no struck-on-sight item applies. Minor errors:

- The eligibility windows quoted for `CB(10,2)/14` (`[16,14]`) and `CB(12,2)/17` (`[19,17]`) have wrong upper ends.
  The correct values are `⌊2α/3⌋ = 15` and `18`. Emptiness is unaffected.
- `run_all.py`'s docstring says "22 small instances" and its section-5 print label says "p near x+1..x+5". The code
  checks 15 instances and all ranks. The return's text is right, and the labels are stale.

## Mechanism-equivalence and fence check

- U2's object is a max-flow instrument plus a statement about the shape of the extremal family. It is not a
  transport rule, so it revives none of the ten refuted keys (§3.2). The deletion arcs appear only inside the
  full (D) ∪ (S) network.
- It does not re-prove a closed region. The laboratories are non-eligible and serve as structure probes.
- It uses no census value, RTree wording or controller prior as evidence.
- It treats (LIFT) only as a lift. It does not use (LIFT) to supply quotient feasibility.
- Fence §3.1 is respected: no deficient-row value is presented as an aggregate statement. The laboratories'
  positive deficits are at non-eligible ranks, and U2 says so.
- CD-1 is invoked only as "consistent with", not as a proof. The "nearly free from CD-1" remark is struck (A6).
- **My lemma (A6)** uses (WID), which is `formally_verified`, and elementary graph facts. It uses no refuted
  mechanism. It re-proves no family theorem: the `CB(d,m)` sector records are about deletion shadows and E1
  conditions, not about `deficit(X1)`. It is a bounded cut-screen instrument, not (HALL).
- **Claim identity.**
  - Keys touched: `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, master name kept);
    `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`; `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`;
    `E993-FINITE-GROUP-WEIGHTED-ORBIT-FLOW-LIFT`; `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`; and
    `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` (untouched).
  - U2's candidate is not yet a predicate: it lacks the positive-deficit hypothesis (A4). As a record, its scalar
    form is CHAR.
  - For A6 I suggest a predicate name, with final naming left to the synthesis:
    `E993-R30-CB-NON-S-ARM-SOURCE-FAMILY-DEFICIT-EQUALS-AGGREGATE-MINUS-S-ARM-LAYER-BALANCE-AT-RANKS-BELOW-DM`.
  - Lexical check: I searched for the tokens `NON-S-ARM`, `S-ARM-LAYER`, `LAYER-BALANCE`, `CHOKE-FOREST`,
    `COLUMN-SHIFT` and `HALL-DEFICIENCY-EQUALS` in the capsule's contract, allocation, gate and brief texts, and
    found 0 hits. `MIXED-FAMILY` appears only in F1's route label, so I avoid it.
  - The registries themselves are not in my capsule, so the registry-level alias check is left to the synthesis.
  - Mathematically the lemma is distinct from CD-1, E1/E1-R and the sector keys: it is about the whole-network
    deficit of a fixed mixed family, not a matching or a shadow inequality.

## Certification audit

**Backed and reproduced:**

- `RESULT_SHA256 7d131453124ce9c2e017d1affbfa04eab9790d5dbf2d1f2952aa3321e5ec7df7`. I replayed it copy-out-first in
  `scratchpad/c6-crit-U2-T/replay/`, and `run_all_RESULT.json` is **byte-identical** to the shipped file
  (`f28aa145…`).
- "223,706 literal independent sets, 0 mismatches". The replay of `validate.py` gives
  `92 + 668 + 428 + 8048 + 5132 + 41348 + 167990`, and its digest is `bb625789…`.
- "15 flow instances, 0 mismatches". The replay of `validate_flow.py` gives digest `5af3dafb…`.
- The values 22458436, 86940920, 3573432896 and the 268 + 67 + 73 = 408 breakdown. These are now reproduced by two
  instruments, plus the closed form `S − L` of A6 for the lower bound.
- "19 distinct deficient instances, zero counterexamples": 14 + 2 + 3, matching the shipped JSON.
- "exhaustive scan of EVERY rank" for `d = 2..9`, `m ∈ {2,3}`: the code does scan all ranks, and I reproduced it.

**Struck:**

1. `validate_RESULT.json (da7d1d3dfd47eedeadcf7d2a715cbec035bfd1aa78385b8343ac8b6ab5264ba5)`. This matches neither
   the file's SHA-256 (`07a7df30…`) nor its inner `RESULT_SHA256` (`bb625789…`), and no replay produces it.
2. "zero counterexamples on 43 total instances" (§Route verdict). The shipped evidence contains 19 deficient
   instances.
3. "eight labelled data points (`S` included at five, excluded at three)". The shipped data give 10 points
   (section 4's 7 plus the 3 laboratories): included at 6, excluded at 4. The 14-row broad sweep adds more. Two of
   the "excluded" rows in the sweep are the vacuous `|F| = 1` rows.
4. "The STATED compression lemma … CONFIRMED (never refuted) … in the strong form 'compression preserves
   membership exactly' … strictly stronger". This is refuted in its universal form (A5). The surviving content is
   "`X*` is `c ↔ b`-closed on the tested rows" (`bounded_computation`).
5. "answers the compression question decisively". Struck, for the same reason.
6. "(INV)/C2-LA1 … the maximum over ALL subsets is ALSO attained by a union of orbits". The claim is true, but the
   citation is wrong. Replace it with the lattice argument (A1).
7. The eligibility window upper ends `[16,14]` and `[19,17]`. Correct them to `[16,15]` and `[19,18]`.
8. "The `RV`-class deletion half is nearly free from CD-1's biregularity". Unsupported (A6).

**Not a certification, noted:** "verified CORRECT by exhaustive literal cross-check" of the instrument. It holds on
small rows only. The switch-coupled regime has no literal laboratory in either instrument (A3).

## Verdict

verdict: retained_narrowed

headline_resolved: no

**What is retained, at the grades below:**

- The coupled orbit-quotient instrument and the three laboratory maxima (`bounded_computation`, now
  two-instrument).
- The arm-level characterization as a bounded record. Its hypothesis must read "max deficit > 0". Its range is the
  40 deficient rows I checked, which include U2's 19; three of them are `|F| = 1`-degenerate. All rows are
  non-eligible.
- The characterization's scalar form CHAR (A6) as a conjecture of record, not a key. It passes on 701 quotient rows
  and 53 literal rows.

**What is narrowed or struck:**

- The compression-lemma "confirmation" (A5: the universal lemma is refuted, with an explicit counterexample at the
  deficient laboratory `CB(2,2)/4`).
- The candidate claim's wording (false at zero-deficit rows).
- The literals struck above.

**Letters:** the text of letters (a)–(d) of gate ruling 30 is not in my capsule. In the terms of the Cycle 6 attack
brief:

- The return supplies no restricted (HALL), no (CUT) candidate and no Lean-ready statement.
- I add a `proved_informal`-candidate lemma (A6), a closed-form cut screen, and a conditional reduction
  CHAR ⇒ CB-(HALL) under two scalar inequalities.

No mathematics here is complete for any (HALL) scope.

## Remaining obligation

1. **Prove CHAR**: for every `CB(d,m)` and `2 ≤ p ≤ dm − 1`, `max_X deficit(X) = max(0, deficit(X1), deficit(X2))`.
   With A6 this equals `max(0, S, S − L)`.
   - It follows from (1a) gap 1: every positive-deficit maximizer contains `X1`; together with (1b) the choke-forest network
     `Φ = m·S(2^d)` at rank `p − 1`, with private-leaf tags, has Hall deficiency `max(0, L)` (the all-or-nothing
     dichotomy, by A6(d)).
   - By A6's contrapositive, CHAR plus the two scalar inequalities `S ≤ 0` and `S ≤ L` gives whole-row (HALL) on
     every eligible CB row with `p ≤ dm − 1` (every eligible row with `d ≥ 3`). So CHAR is **not** a small lemma. It is the CB part of the headline in extremal-family
     form.
2. **Prove the two scalar inequalities uniformly at eligible ranks.**
   - `S ≤ 0`: explicit in `A = (1+2x)^{dm}` and `(1+2x)g`.
   - `S ≤ L`, that is `1_v(A_{p−1} − A_{p−2}) + 1_c·dm·(g_{p−1} − g_{p−3}) ≤ 0`, where
     `g = (1+x)^{d−1}((1+2x)^d + x(1+x)^d)^{m−1}`.
   - Both hold on all 87,341 eligible rows with `d ≤ 13`, `m ≤ 150` (`bounded_computation`).
   - These are single-coefficient log-concavity/mode-type statements, and they are the natural Lean-ready targets
     here.
3. **The switch-coupled regime needs a literal laboratory on an actual row** (ruling 49). The smallest such row is
   `CB(9,2)/13` (`n = 41`). Alternatively, the successor can accept the two-quotient-instruments-plus-closed-form
   standard explicitly.
4. U2's item 3, heterogeneous chokes, is unchanged. A6's closed forms are homogeneous-only.

**Successor inheritance:** CHAR (as the exact target), the lemma of A6, and the two scalar inequalities. U2's own
remaining item 1 is exact as a statement but mis-sized as an obligation, as item 1 above explains. U2's item 2 is
answered in closed form, conditional on CHAR.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-U2-T/`.

**Seal check:**

| File | SHA-256 |
|---|---|
| `seal.py` | `d854840ccad3eda2b95c6fa7f3643bc022728dc80a6fd00db182ed97f2cb245a` |

**Own instrument** (`own/`):

| File | SHA-256 |
|---|---|
| `inst.py` | `95e5540e68f3ea6fd19c5305732407802901160d9112d2aa954c64f81c742b05` |
| `fixed_points.py` | `d39a64392ca65e6a128016adecff5c7f3b32a62fa2d672aedd9c16b987b46b74` |
| `literal_lab.py` | `56b3d5b7731a1cb6b968201ba5114c2614c0deca0ba404f32f1a9a5913ddd979` |
| `sweep.py` | `0c7155326fa26e6d6df1464eef280c5a9f9a9c2080f80ba3d15332fc82bb7d26` |
| `summarize.py` | `af36415e0365bf866b37562e14d55bb48094481625f9f17e16bd0ab99a952879` |
| `closedform.py` | `c65edbc3df280d91b08ecf2de5245e497850f73a45ac30d586c307b9a49fac47` |
| `scan_x1.py` | `3eeb89fa48200958485a7e3904ae869b9c909eeb3ad577ad91b5a3cb8bfa0415` |
| `eligible_rows.py` | `75f9cc06b139073cbb0c81de70112361ab9d3e459f65a47c6826b7db1c78ca37` |
| `compression_test.py` | `8ea37d9a41b9a479104bb6dcac04b2e7c48e91745a8618ba6452ad1d935abe89` |
| `compression_min.py` | `607950aa6952813a0103ef3d9c8d1c7fb97977ebd2a8c97ca02017d10774094e` |
| `compression_orbit.py` | `7aa5ce1c16d4674cea6ea912383e29998acecd6378e12b452b6800ccc4e0a000` |

Note on `compression_min.py`: it imports `compression_test.py`, and that import re-runs the test. The output is
identical: digest `a2cdfe92…`.

**Outputs** (`own/`):

| File | SHA-256 |
|---|---|
| `fixed_points_OUT.txt` | `deb5cfdc…` |
| `literal_lab_OUT.txt` | `85e301b8…` (inner `c9068060…`) |
| `labs_OUT.txt` | `f7e4f936…` (inner `3a199ea0…`) |
| `sweep_labs_RESULT.json` | `28f45740…` |
| `sweep_broad_1_13_2_RESULT.json` | `ec20076c…` |
| `sweep_broad_1_12_3_RESULT.json` | `86c5a1cf…` |
| `sweep_broad_1_6_4_RESULT.json` | `e7d5829a…` |
| `sweep_broad_1_4_5-6_RESULT.json` | `fdde92e5…` |
| `summary_all_OUT.txt` | `ff436ef8…` (inner `a6781fff…`) |
| `eval_named_OUT.txt` | `fe5b1730…` |
| `scan_x1_13_150_RESULT.json` | `1904dfcb…` |
| `scan_x1_13_150_OUT.txt` | `01da5622…` (inner `9d312ba3…`) |
| `eligible_rows_OUT.txt` | `07d9a5d3…` (inner `ad67cb7c…`) |
| `compression_OUT.txt` | `1ec51695…` (inner `a2cdfe92…`) |
| `compression_min_OUT.txt` | `56e70755…` |
| `compression_orbit_OUT.txt` | `114cecf6…` (inner `2f3a9f66…`) |

The `broad_m{2,3,4,56}_OUT.txt` logs and `pid_m4.txt` / `pid_m56.txt` are also in `own/`.

**Replay** (`replay/`): U2's scripts copied byte-identically from `scratchpad/c6-U2/`. My copies have these
digests:

| File | SHA-256 |
|---|---|
| `tree.py` | `39fc398c…` |
| `orbit_net.py` | `ab8076bf…` |
| `flow.py` | `10a870de…` |
| `solve.py` | `1fbb9a7a…` |
| `validate.py` | `8541b816…` |
| `validate_flow.py` | `2c5ec816…` |
| `run_all.py` | `ec2abfd9…` |
| `compression.py` | `617f52a6…` |

The shipped results are kept as `*.shipped.json`. The replay outputs are:

- `run_all_RESULT.json`: byte-identical to the shipped file.
- `run_all_REPLAY_OUT.txt`: `RESULT_SHA256 7d131453…`.
- `validate_RESULT.json`: byte-identical to the shipped file.
- `validate_flow_RESULT.json`: byte-identical to the shipped file.
- `pid_replay.txt`.

**Background jobs:** three, each started with `nohup … &` and its PID captured with `$!`:

- 83689 (m=4 sweep)
- 83691 (m=5,6 sweep)
- 85566 (U2 replay)

Each was polled by `kill -0 <literal PID>` and had exited before this write. None needed killing. I ran no process
listing and no pattern kill.
