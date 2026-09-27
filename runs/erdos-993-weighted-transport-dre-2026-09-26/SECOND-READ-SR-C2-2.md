# Second Read

Isolated second read `SR-C2-2`, Cycle 2 of r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`; Erdős #993, weighted
mixed-boundary transport). Date 2026-09-26. Instruction set: `control/C2-SECOND-READ-PROTOCOL.md` and
`control/C2-SECOND-READ-BRIEF-SR-C2-2.md`, both read in full after the seal check.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, the two boot files the protocol permits. I loaded no other VerityOS
subsystem. I opened or wrote no memory, conversation log, module, skill, log or decision.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

(The runtime id is what my own session reports. I cannot observe the middle clause. It is the protocol's transport wording, and
I carry it as the controller's record.)

## Identity and seal audit

- **Capsule seal.** For `control/c2-second-read/SR-C2-2-PACKET-MANIFEST.json` (stage `cycle-2-second-read-SR-C2-2`, 17
  files), I took the SHA-256 of the canonical JSON without `seal_sha256` (`sort_keys`, separators `(",",":")`, no trailing
  newline). It recomputes to **`54e77785df65e4e08502a0e48f00470982e837f985156f31d2f9a0ab4b3a1b4f`**. That equals the stored
  field and the wrapper's value.
- **Members.** All **17/17** members match on SHA-256 and on byte count. I checked this before reading any member
  (`sr2_seal.py`, `out_seal.txt`).
- **Nested seal.** `control/C2-STAGE6-PACKET-MANIFEST.json` (stage `cycle-2-stage6`, 34 files) recomputes to
  `76c6aa52ed3116cb7e28388b90a603ee8a1d119ffabfe9584adc72bcde11bf6d`, equal to its field. It lists
  `cycles/cycle-2/stage6/SYNTHESIS.md` at `3d30cc4b…ebf52`, the same digest my capsule carries. I did not open any member it
  lists outside my capsule.
- **Read-boundary disclosures (this seat).**
  1. At session start the harness put the project `CLAUDE.md` and the user auto-memory index into my context. I did not open
     either as a source, and nothing below relies on them. `CLAUDE.md` asks for a conversation log. I wrote none, because the
     protocol confines my writes to this file and my scratch directory.
  2. `cycles/cycle-2/stage4/critics/T1/U/CRITIQUE.md` was too long for inline display. The harness saved a byte copy to a
     session tool-results file outside the run root, and I read that copy. It is the same digest-verified member.
  3. To create my two output directories I ran one non-recursive `ls` of `second-reads/` and `scratchpad/`. It showed
     directory names only, including sibling seats' scratch names. I opened nothing under them.
  4. I ran `grep -n '^#'` on two capsule members (the synthesis and the T adjudication) to find their sections. I parsed two
     capsule members, the registry snapshot and the master registry, for the (HALL) and run-local key texts.
  5. I read no seat scratch (`scratchpad/c2-*/`), Cycle 1 file, `SR-SECTOR`, `RESULTS.json`, `runs/` directory, other
     experiment root or external source.
  6. I ran no `find`, no `rg`, and no search rooted above the capsule members.
  7. No network, installs or Lean.
  8. I started no background jobs. Every script ran in the foreground with `python3 -B`, so no bytecode was written.
  9. I edited no sealed member.

## Statements read

- **SR-C2-2a (S14, `computer_assisted`).** Sector Hall under (D) ∪ (S) holds for every `X ⊆ X_sec` at every eligible `p` of
  `CB(8,86)`, `CB(8,89)` and `CB(8,92)`.
  - The first rank is covered by the Lemma C(ii) composition with S1. The margins are 6863.256, 11209.544 and 18328.277, with
    `x₀ = 1/460, 1/476, 1/492` and `c = 7/460, 1/68, 7/492`.
  - Every later rank is covered by NM/P9.
  - Row data: `n` = 1465, 1516, 1567; `α` = 775, 802, 829; `x` = 458, 474, 490; windows [460,516], [476,534], [492,552]; `|F|`
    = 689, 713, 737.
  - Sources: synthesis `## Exact established results` S14. Origins: T1 Step 2 item 5 (numerics), C-T1-F F1 (the re-derived
    composition), C-T1-U R5 (the second instrument), and T adjudication Route T1 item 4 and E7.
- **SR-C2-2b (S3, `proved_informal`).** The CB competition map (three facts) and the reductions (R-i) and (R-ii). Scope:
  `CB(d,m)`, `F` = all leaves, every `p`.
  - Sources: synthesis S3. Origins: C-T1-F F4 (competition map; (i); (ii) with "no arm-v source"), C-T1-U R7 (reach table; (a)
    with `X ⊆ X_sec ∪ R0 ∪ S ∪ O`), and T adjudication Route T1 item 6 and E3.
- **SR-C2-2c.** The `R30-CB-RECORD` update and the (HALL) scope note: synthesis `## Registrations` item 3, `## Headline
  verdicts` (the (HALL) row and the `CB(8, 92)` row), `## Exact established results` (bounded records), and R7.

**Dependency.** S14 uses S1, which SR-C2-1 is reading concurrently. I take **S1 as a hypothesis**. Every line that uses it
is marked **[S1]**, and my verdict on S14 is **conditional on S1**.

## Independent re-derivation

All definitions are those of `SEMANTIC-CONTRACT.md` §1:

- `w_F(B) = #{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}`, with `W_v = N(s_v) ∖ {v}`;
- (D) ∪ (S) literally: delete one vertex, or apply a two-for-one switch at `u ∉ B` with `|N(u) ∩ B| = 2`;
- `F` fixed at the original rank `p`;
- `x` computed through rank `α`.

My instrument is new code in `scratchpad/c2-sr-SR-C2-2/`. It uses the standard library and exact integers or `Fraction`s, and it
shares no code with any seat.

### The object

`CB(d,m)` is the path `r–s–v`, `m` chokes `u_i ~ r`, `d` supports `b_ij ~ u_i`, and one private leaf `c_ij ~ b_ij`. So
`n = 3 + m + 2dm`, the leaves are `{v} ∪ {c_ij}` (`dm + 1` of them), and `α = dm + m + 1`.

The two closed forms are:
- `I(CB) = t(1+t)(1+2t)^{dm} + (1+2t)β^m`, with `β = (1+2t)^d + t(1+t)^d`;
- the layer sums of `w_F` for `F` = all leaves, `W(t) = t²(1+2t)^{dm} + (1+2t)·W'(t)`, with `W'(t) = md·t²(1+t)^{d−1}β^{m−1}`.

I derived both by cases on the arm. For `W`: the arm tag `v` is active iff `r ∈ B`; a private tag `c_ij` is active iff
`u_i ∈ B`. Both closed forms equal brute force layer by layer on `CB(1,2)`, `CB(2,2)`, `CB(1,3)`, `CB(3,2)` and `CB(2,3)`
(`sr2_facts.py`). On the rows, `I` also equals a generic forest DP on the explicit tree (`sr2_rows.py`).

Source classes by arm state:
- `sec`: `r, v ∈ B`;
- `R0`: `r ∈ B`, `v ∉ B`;
- `S`: `s ∈ B`;
- `V`: `v ∈ B`, `r, s ∉ B`;
- `O`: none of `r`, `s`, `v`.

They partition `I_{p+1}`. Every `sec` source has weight exactly 1: `v` is active through `r`, and no private tag is active,
because `r ∈ B` excludes every choke. Every `R0` source has weight 0.

### SR-C2-2b: the facts and the reductions, re-proved

**Arcs out of a sector source** `B = {r, v} ∪ g`. Here `g` is a choice of none, `b_ij` or `c_ij` in each of the `N = dm`
pairs, with `|g| = k = p − 1`.
- Deletions: `B − r` is in V with weight 0, because `v` is inactive and there is no choke. `B − v` is in R0 with weight 0.
  `B − y` for `y ∈ g` stays in the sector, contains `r` and `v`, and has weight 1.
- Switches: `u = s` gives `B − {r,v} + s` (class S, weight 0, no choke). `u = u_i` needs exactly one `b_ij ∈ g`, and gives
  `A = {v, u_i} ∪ (g − b_ij)`. Its weight `b` is the number of branch-`i` leaves in `g`.
- No other vertex has two neighbours in `B`. For `b_ij`, `u_i ∉ B`. The vertex `c_ij` has degree 1, and `r ∈ B`.

**Fact (a).** Every positive-weight target of a sector source contains `v`. It is proved by the list above.

**Fact (b).** Every target of an R0, S or O source is `v`-free. A deletion never adds `v`. A switch adds only `u`, and
`u = v` would need `|N(v) ∩ B| = 2` with `N(v) = {s}`, which is impossible. For R0 and O sources, `v ∉ B` already. For S
sources, `s ∈ B` forces `v ∉ B`.

**Fact (c).** A V source `B` has exactly one `v`-free target, `B − v`, and `w_F(B − v) = w_F(B)`.
- A switch removes `v` only at `u = s`, which needs `r ∈ B`, and `r ∉ B` here.
- Equal weight: `v` is inactive in `B` because `W_v = {r}` and `r ∉ B`. And `v` lies in no other tag's `W`, because `s`
  supports only `v`.

**(R-i).** Suppose `X ∩ (S ∪ O)` has no positive-weight member. Then `w(X) = w(X ∩ sec) + w(X ∩ V)`, since R0 sources and the
remaining S/O members weigh 0. The map `B ↦ B − v` is injective on V (every V source contains `v`). It sends the positive V
members to `v`-free targets of equal weight in `N(X)`. By (a) these are disjoint from the positive-weight part of
`N(X ∩ sec)`. So `cap N(X) ≥ cap N(X ∩ sec) + w(X ∩ V) ≥ w(X)` whenever `Hall(X ∩ sec)` holds. **Confirmed.**

**(R-ii) as the synthesis states it: false. The proof works only under the critics' hypothesis.**
- The statement is: if `X ∩ V` has no positive-weight member, then `Hall(X ∩ sec) ∧ Hall(X ∖ sec) ⇒ Hall(X)`.
- The proof needs `N(X ∖ sec)` to be `v`-free. That fails when `X ∖ sec` contains **zero-weight V sources**. Such a source
  still reaches positive-weight targets containing `v`:
  - by the `r`-switch when it holds two chokes (a sector target of weight 1);
  - by a choke switch at `u_i` when two supports of branch `i` are present (a V target whose weight is the number of branch-`i`
    leaves).

  Sector sources reach the same targets. So `Hall(X ∖ sec)` can borrow capacity that `X ∩ sec` also uses.
- **Witness** (`sr2_rii.py`, `sr2_rii_trim.py`; exact max-flow search, then an inclusion-minimal trim and a literal
  re-verification from scratch):
  - Row: `CB(3,2)` at `p = 5`, with `F` = all leaves, `α = 9`, `x = 5`. The row has no eligible rank. `p = 5` lies inside
    S3's stated scope "every `p`".
  - Family: `X` has 457 members: 204 sector sources, 23 V sources all of weight 0, and 230 positive-weight S/O sources.
  - `Hall(X ∩ sec)`: 204 ≤ 226. Holds.
  - `Hall(X ∖ sec)`: 488 ≤ 488. Holds.
  - `Hall(X)`: 692 > 691. **Fails**, with deficit 1.
  - The 23 overlapping targets are choke-switch V targets `{v, u_i} ∪ …` of weight 1. The listing is in `out_rii_trim.txt`.
- **Correct forms.**
  - C-T1-F F4(ii) ("no arm-v source") and C-T1-U R7(a) (`X ⊆ sec ∪ R0 ∪ S ∪ O`) assume `X ∩ V = ∅`. They are correct as
    stated.
  - The weakening to "no positive-weight member" first appears in the T adjudication's E3, and the synthesis carries it.
  - **Repaired (R-ii):** if `X ∩ V` has no positive-weight member, then `Hall(X ∩ sec) ∧ Hall(X ∩ (R0 ∪ S ∪ O)) ⇒ Hall(X)`.
    Proof: `w(X) = w(X ∩ sec) + w(X ∩ (R0 ∪ S ∪ O))`. The positive part of `N(X ∩ sec)` contains `v` by (a), and
    `N(X ∩ (R0 ∪ S ∪ O))` is `v`-free by (b). So the two capacities add.
  - In particular, if `X ∩ V = ∅`, then `Hall(X ∩ sec) ∧ Hall(X ∖ sec) ⇒ Hall(X)`.
  - On the witness, the repaired hypothesis fails as it must: `Hall(X ∩ (R0 ∪ S ∪ O))` reads 488 > 465.

**Brute force** (`sr2_facts.py`, `out_facts.txt`, `ALL_OK True`). It covers five small `CB(d,m)`, namely (1,2), (2,2), (1,3),
(3,2) and (2,3), at **every** rank `1 ≤ p ≤ α − 1`, with the literal `w_F` and literal (D) ∪ (S). It checks:
- the three facts on every source;
- sector weight 1 and R0 weight 0;
- WID from independent sides at every rank (literal layer sums against `S` computed from `H_v`, `R_v`);
- (R-i) on 1,381 random families whose premise held;
- the repaired (R-ii) on 1,095 random families.

The V→sector `r`-switch channel has 4, 16, 36, 64 and 432 arcs. The T adjudicator's independent list includes 4, 16, 64
and 432.

**What remains open, exactly.** Every family `X` falls into one of the following cases.
- `X ∩ (S ∪ O)` has no positive-weight member: (R-i) reduces it to sector Hall.
- `X ∩ V` has no positive-weight member: the repaired (R-ii) reduces it to sector Hall plus `Hall(X ∩ (R0 ∪ S ∪ O))`.
- Otherwise `X` contains both a positive-weight V source and a positive-weight S/O source.

So, at the three rows where sector Hall is known, the open obligation is exactly:
- **(O1)** (HALL-COND) for every `X ⊆ R0 ∪ S ∪ V ∪ O`. Its core is Hall on `X ⊆ O ≅ I_{p+1}(T')`, `T' = T − {r, s, v}`.
- **(O2)** Families that meet `sec`, a positive-weight V source and a positive-weight S or O source.

This agrees with the synthesis's (O1)/(O2). The literal (R-ii) would have wrongly let `Hall(X ∖ sec)` be applied to families
that carry zero-weight V sources.

### SR-C2-2a: the Lemma C(ii) composition, re-derived

Fix a first eligible rank `p ∈ {460, 476, 492}`, with `k = p − 1`, `N = dm = 688, 712, 736` and `Z' = N − k + 1`. Identify a
sector source `{r, v} ∪ g` with `g ∈ L_k`, the rank-`k` layer of `{0,1,2}^N`. The in-sector deletion targets are the lower
covers. `R_k = |L_k| = 2^k C(N,k)`.

For `X ⊆ X_sec`, let `∂X` be the set of in-sector deletion targets and `Sw(X)` the set of positive-weight choke-switch
targets.

1. **Fact A (disjointness).** Members of `∂X` contain `r`. Members of `Sw(X)` do not. Both lie in `N(X)`. So
   `cap N(X) ≥ |∂X| + Σ_{A ∈ Sw(X)} w(A)`, since every member of `∂X` has weight 1 when `v ∈ F`.
   - Brute force confirms that every switch target of a sector source lacks `r`.
2. **Fact B (switch exits).** A choke-switch target `A = {v, u_i} ∪ (g − b_ij)` of weight `b` has sector preimages exactly
   `A − u_i + r + b_ij'`, one for each empty pair `j'` of branch `i`. That is at most `d − b` of them.
   - Every source outside `X''` has an exit with `1 ≤ b ≤ d − 1`. Here `X''` is the set of sources with no branch holding
     exactly one `b` and at least one `c`.
   - Assign one exit per source outside `X''`. Since `b/(d − b) ≥ 1/(d − 1)`, the switch capacity is at least
     `|X ∖ X''|/(d − 1) ≥ (|X| − |X''|)/(d − 1)`. This needs `d ≥ 2`, and here `d = 8`.
   - The count of `X''` in rank `k` is `[t^k] g_d(t)^m`, with `g_d = (1+2t)^d − d·t((1+t)^{d−1} − 1)`.
   - Brute force confirms both. The preimage bound held on every target. The `X''` count matched at every sector rank. The
     switch-capacity inequality held on 640 random sector families.
3. **NM (registered, `proved_informal`).** `Q = {r, v}` is independent, and `T − N[Q]` is the perfect matching of the `N`
   pairs. So `k|X| ≤ 2Z'|∂X|`, that is, `|∂X| ≥ δ|X|` with `δ = k/(2Z')`.
4. **NM + B range.** `cap N(X) ≥ δ|X| + (|X| − |X''|)/(d − 1) ≥ |X|` iff `(1 − c)|X| ≥ |X''|`, where `c = (d − 1)(1 − δ)`.
5. **Fact D range [S1].** Write `d_X(g') = #{g ∈ X : g' ⋖ g}`. Then `Σ d_X = k|X|`, because each `g ∈ L_k` has exactly `k`
   lower covers.
   - By Cauchy–Schwarz, `(k|X|)² ≤ |∂X|·‖B1_X‖²`.
   - Split `1_X = (|X|/R_k)𝟙 + f` with `Σ f = 0`. The cross term vanishes because `BᵀB𝟙 = 2kZ'𝟙`.
   - This is where the spectral bound enters. S1's quadratic form, taken as hypothesis, gives
     `‖Bf‖² ≤ λ₂‖f‖²` with `λ₂ = 2(k − 1)Z'` [S1].
   - So `‖B1_X‖² ≤ λ₂|X| + 2Z'|X|²/R_k` [S1], which is S1's companion form. Its small-case sanity check held on the random
     families in `sr2_facts.py`, but that is not evidence for S1.
   - Hence `|∂X| ≥ |X|` whenever `|X| ≤ x₀R_k`, with `x₀ = (k² − λ₂)/(2Z')` [S1].
   - At these rows `3p = 2dm + 4`, so `Z' = (k+1)/2`, `λ₂ = k² − 1`, `x₀ = 1/p` and `δ = k/(k+1)` [S1 for `λ₂` and `x₀`].
6. **Junction.** Every `X ⊆ X_sec` is covered iff the two ranges meet. Deletions alone cover `|X| ≤ ⌊x₀R_k⌋`. NM + B covers
   `|X| ≥ ⌈|X''|/(1 − c)⌉`. My instrument checks the exact integer junction `⌊x₀R_k⌋ + 1 ≥ ⌈|X''|/(1 − c)⌉` directly (True at
   all three rows), and the margin `x₀R_k(1 − c)/|X''| ≥ 1` as an exact rational.
7. **The whole-sector deficit.** At `X = X_sec`, `|X| = R_k` and `(1 − c)R_k ≥ |X''|` (True), so the NM + B range covers it.
   - The deletion deficit is `R_k − R_{k−1} = R_k/p`.
   - The switch capacity is at least `(R_k − |X''|)/7`, which is about `R_k/7`.
   - So the switch exits carry the deficit with room to spare, even on this crude bound.
8. **Later ranks.** For every eligible `p' > p`, `3p' ≥ 2dm + 7 > 2dm + 5`, so `δ ≥ 1`. NM alone gives
   `cap N(X) ≥ |∂X| ≥ |X|` (P9). My instrument confirms that P8 fires only at `p = 460, 476, 492`.
9. **The selector enters twice.**
   - At the first rank, Facts A/B need `v` and every `c_ij` in `F`.
   - At later ranks, the weight-1 in-sector targets need `v ∈ F`.
   - My instrument computes `Δ_q(T − v)` by a generic DP on the explicit tree, for **every leaf** and **every eligible `q`** of
     each window. **All `dm + 1` leaves are favorable at every eligible rank** of all three rows. This exceeds S14's
     first-rank `|F|`.

**Numbers** (`sr2_rows.py`, `out_rows_{86,89,92}.txt`, exact). The DP and the closed form agree on the polynomial, and on each
row `supply − capacity = S` is asserted before any output. Supply and capacity come from `W(t)`, and `S` comes from the C5LA1
definition over every leaf, using the generic DP on `T − H_v` and `T − R_v`. I used no symmetry.

| row | n | α | x | window | \|F_p\| | x₀ | δ | c | \|X''\| digits | margin |
|---|---|---|---|---|---|---|---|---|---|---|
| CB(8,86)/460 | 1465 | 775 | 458 | [460,516] | 689 | 1/460 | 459/460 | 7/460 | 321 | 6863.255752 |
| CB(8,89)/476 | 1516 | 802 | 474 | [476,534] | 713 | 1/476 | 475/476 | 1/68 | 332 | 11209.544098 |
| CB(8,92)/492 | 1567 | 829 | 490 | [492,552] | 737 | 1/492 | 491/492 | 7/492 | 343 | 18328.277125 |

Every S14 literal is reproduced: rows, windows, `|F|`, `x₀`, `c` and the three margins to three decimals.
- **Instruments.** This read is a fifth instrument for the margins, after T1, C-T1-F, C-T1-U and the T adjudicator.
- **Grade.** The composition is a proof whose last step is exact finite arithmetic on three instances. Its inputs are S1 (STATED,
  under SR-C2-1), NM (`proved_informal`) and Facts A, B and D (elementary, re-derived here). **`computer_assisted` is the right
  grade.** It is a result about three trees and says nothing about the family.
- **ℕ-subtractions.** Every one is guarded:
  - `k = p − 1`, with `p ≥ 2`;
  - `Z' = N − k + 1`, with `k ≤ N` (459 ≤ 688, 475 ≤ 712, 491 ≤ 736);
  - `d − 1 ≥ 1` in Fact B;
  - `d − b ≥ 1` for the preimages;
  - `R_{k−1}`, with `k ≥ 1`;
  - S1's range `N ≥ k ≥ 2`.

  `x₀` and `1 − δ` are rationals, and `x₀ > 0` here.

### SR-C2-2c: record literals checked with my own instruments

| literal (synthesis) | my value | status |
|---|---|---|
| exact aggregates at 86/460 and 89/476 (and 92/492) | WID holds from independent sides on all three rows; `S < 0`. Supply and capacity have **330, 342, 353** digits; `S` has **328, 340, 351** digits. SHA-256 of the decimal `S`: `c5bf9f2b…fe03e8`, `80b7bdff…f765f`, `1b7f6f7c…9b0715` | confirmed; the digit attribution is repaired (the synthesis table puts "330, 342 and 353 digits" under "Supply / capacity / S") |
| `S(CB(8,92),492)` equals the frozen `RESULTS.json` | `RESULTS.json` is outside my capsule | **not checked**; the controller compares it against my `S` (full decimal in `out_rows_92.txt`) |
| `Aut(CB(d,m)) = S_d ≀ S_m`, order `(d!)^m m!`; `CB(1,1) = P_6` an exception | brute-force and centre-canonical counts on 8 small `(d,m)` and canonical counts on the three rows equal `(d!)^m m!`. `CB(1,1)` has order 2. The natural `S_d ≀ S_m` action is faithful and has that order, so it is all of `Aut` | confirmed |
| corrected `Δ_x` digit counts 326/337/349/408/479 | 326, 337, 349, 408, 479 (all `< 0`). `Δ_{x−1}`: 327, 338, 350, 411, 482 (all `≥ 0`) | confirmed |
| O-class balances (C-T1-U, replayed by T) | `deficit(O) = W'_{p+1} − W'_p`: −1.66%, −1.63%, −1.60%, −1.29%, −1.03% of `W'_p`. `deficit(sec ∪ V ∪ O)`: −2.68%, −2.64%, −2.60%, −2.08%, −1.62%. Whole-sector deletion deficit `(R_k − R_{k−1})/W'_p` = 6.37e−6, 5.30e−6, 4.42e−6. The formulas hold because every positive-weight target of each class is reached (`T'` has no maximal independent set smaller than `dm > p`) | confirmed (`bounded_computation`; whole-class priors only, not subfamily Hall) |
| smallest eligible CB row `CB(1,7)/10` (`n = 24`) | `CB(1,7)`: `α = 15`, `x = 8`, window [10,10]. Next rows: `CB(1,8)/11` (`n = 27`), `CB(2,5)/10` (28), `CB(1,9)/12` (30), `CB(3,4)/11` (31) | confirmed |
| first sector-deficient CB rows by `d`: `d = 8, m = 86` (`n = 1465`); `d = 7, m = 109` (`n = 1638`); none for `d ≤ 6`, `m < 400`; exactly three with `n ≤ 1600`; none with `n < 1465` | criterion P8 (`3p < 2dm + 5`, `2 ≤ p ≤ dm + 1`, arm leaf favorable at `p`) over **all** `(d,m)` with `n ≤ 1600`: exactly the three S14 rows, none below 1465. Smallest `m < 400` by `d`: `d ≤ 6` none; 7 → 109 (`n` 1638, `p` 510); 8 → 86 (1465, 460); 9 → 112 (2131, 673); 10 → 106 (2229, 708); 11 → 134 (3085, 984); 12 → 212 (5303, 1697) | confirmed; `d = 9..12` is new (this instrument only) |
| P8 fires only at the first eligible rank on the three windows | yes: 460, 476, 492 (also 577 and 673 on the obligation-(b) rows) | confirmed |
| obligation-(b) rows `CB(8,108)/577`, `CB(7,144)/673` | `n` 1839, 2163; `α` 973, 1153; `x` 575, 671; windows [577,648], [673,768]; `x₀` = −287/289, −335/337; `c` = 7/289, 6/337; `|X''|/R_k` = 6.482e−9, 2.56e−15 | confirmed (Fact D vacuous there) |
| the struck "margins" label | the margin is `x₀R_k(1−c)/|X''|`, the overlap ratio of the composition's two coverage ranges | struck label confirmed |

The screens use closed-form independence polynomials only (`sr2_screen.py`; `I(T − v) = t(1+2t)^{dm} + (1+t)β^m` for the
arm-leaf selector). No census of trees is involved.

## Findings and repairs

1. **(Material; S3.) The (R-ii) of S3/E3 is false as worded, and needs a repair.**
   - Its hypothesis "`X ∩ V` has no positive-weight member" admits zero-weight V sources. These reach positive-weight,
     `v`-containing targets through choke and `r` switches, and sector sources reach the same targets.
   - Witness: `CB(3,2)` at `p = 5`, `|X| = 457`. `Hall(X ∩ sec)` and `Hall(X ∖ sec)` hold, but `Hall(X)` fails, 692 > 691.
   - The critics' forms (`X ∩ V = ∅`) are correct. The repaired statement replaces `Hall(X ∖ sec)` by
     `Hall(X ∩ (R0 ∪ S ∪ O))`.
   - The error entered at the T adjudication (E3) and was carried by the synthesis. No number and no downstream claim depends on
     the wrong form, but (O1)/(O2) must be read with the repaired (R-ii).
   - The witness is at a non-eligible rank, as it must be. On a row where (HALL) holds, the implication is vacuous. A witness at
     an eligible row would be a (CUT).
2. **(S14; attribution.)** The composition is not a Cycle 2 creation.
   - The Lemma C(ii) structure (Facts A–D, `X''`, the `x₀` window) is the Cycle 1 `R30-CB-RECORD` Lemma C, second-read in
     SR-SECTOR, according to T1 Step 2 and the allocation.
   - C-T1-F re-derived it on its face and carried it to 460 and 476, with S1 in place of the cited node (n1).
   - The face must credit the Cycle 1 record, and not only "critic-attributed to C-T1-F".
3. **(S14; conditionality.)** The first-rank clause at all three rows rests on S1 [S1].
   - If SR-C2-1 does not confirm S1, the clause reverts. At 492 it returns to its Cycle 1 standing (`computer_assisted` with (n1)
     cited). At 460 and 476 it becomes open.
   - The later-rank clause (NM/P9) is independent of S1.
4. **(S14; strengthening, recorded only.)** The selector is all `dm + 1` leaves at **every** eligible rank of the three
   windows, not only at the first. This is a generic per-leaf DP on the explicit trees. S14 needs `v ∈ F` at later ranks and all
   leaves at the first rank. Both hold.
5. **(Record; digits.)** 330, 342 and 353 are the digit counts of supply and of capacity. `S` has 328, 340 and 351 digits.
6. **(Record; not checkable here.)** The `RESULTS.json` equality at 92/492 is outside my capsule. I supply the exact `S` and
   its digest for the controller.
7. **(Record; screen extension.)** First sector-deficient rows for `d = 9..12` (above). This is `bounded_computation` from one
   instrument.
8. **(Scope note; wording.)**
   - "Switch arcs have never been load-bearing on a computed row" is true only because no full-network flow has been computed on
     the three rows. There the sector is deletion-deficient, so any saturating flow **must** use switch arcs. The note must say
     both halves.
   - "Sector subfamilies are Hall-complete" is a statement about `X ⊆ X_sec` only. It must not be read as Hall for any
     family containing a non-sector source.
9. **(Observation, not a widening.)** The proofs of facts (a)–(c) never use `F` = all leaves. They hold for every
   `F ⊆ leaves`. My brute force tested only `F` = all leaves, so I do not propose widening the recorded scope.
10. **Fences hold.**
    - Mechanism ≠ aggregate: nothing here bounds `S(T,p)` beyond (WID).
    - S14 is finite and proves nothing universal.
    - Sector Hall is not (HALL). (R-i)/(R-ii) are reductions, not Hall at any row.
    - No status transfer to (HALL), the primary aggregate, or any other key.
    - No refuted mechanism is revived. Lemma C uses switch arcs, so it is not `E993-R23-LITERAL-DELETE-ONLY-HALL`. `B ↦ B − v`
      is a whole-class weight-preserving injection, so it is neither `…PER-LEAF-DOWN-MAP-INJECTIVITY` nor the C6-F4
      own-support rule.
    - No closed region is re-proved. NM is used at its registered grade, and no census value enters a proof.
    - Weight and relation fidelity is literal in my code.
    - **No key is proposed.** `R30-CB-RECORD` is a record label, so the predicate-name check does not arise.

## Registration text

**1. `R30-CB-RECORD` Cycle 2 update** (a record, not a key; register verbatim after the second-reads packet seals).
Clause C2-1 stands only if SR-C2-1 confirms S1.

```text
R30-CB-RECORD — Cycle 2 update (r30; isolated second read SR-C2-2). Record, not a registry key.
Definitions: CB(d,m) = path r–s–v, m chokes u_i ~ r, d supports b_ij ~ u_i, one private leaf c_ij ~ b_ij; n = 3 + m + 2dm,
alpha = dm + m + 1, leaves {v} ∪ {c_ij}. w_F the literal active-tag weight; relation (D) ∪ (S) literally; F fixed at the
original rank p; x computed through rank alpha. Source classes by arm state: sec (r, v ∈ B), R0 (r ∈ B, v ∉ B), S (s ∈ B),
V (v ∈ B; r, s ∉ B), O (none of r, s, v).

C2-1 [computer_assisted; three instances; CONDITIONAL on S1 = E993-R30-TERNARY-COVER-SECOND-EIGENVALUE (SR-C2-1)].
At CB(8,86), CB(8,89), CB(8,92) (n = 1465, 1516, 1567; alpha = 775, 802, 829; x = 458, 474, 490; eligible windows
[460,516], [476,534], [492,552]; F_p(T) = all dm + 1 = 689, 713, 737 leaves at every eligible p), (HALL-COND) holds for
every X ⊆ X_sec = {B ∈ I_{p+1} : r, v ∈ B} at every eligible p. First eligible rank p = 460, 476, 492 (the only eligible
rank with 3p < 2dm + 5), k = p − 1, Z' = dm − k + 1, R_k = 2^k C(dm, k): Lemma C(ii) — sector sources have weight 1;
in-sector deletion targets (weight 1; contain r, v) and positive-weight choke-switch targets (contain v, not r) are
disjoint parts of N(X) (Fact A); a choke-switch target of weight b has at most d − b sector preimages, so the switch
capacity of X is at least |X ∖ X''|/(d − 1), X'' = sector sources with no branch holding exactly one support and at least
one private leaf, |X''| = [t^k]((1+2t)^d − d t((1+t)^{d−1} − 1))^m (Fact B); |∂X| ≥ δ|X|, δ = k/(2Z') (NM); together
every X with (1 − c)|X| ≥ |X''|, c = (d − 1)(1 − δ), is covered; by Cauchy–Schwarz and S1 (λ₂ = 2(k − 1)Z' on the
rank-k layer of {0,1,2}^{dm}), |∂X| ≥ |X| whenever |X| ≤ x₀R_k, x₀ = (k² − λ₂)/(2Z') (Fact D); the two ranges meet.
Exact data: x₀ = 1/460, 1/476, 1/492; δ = 459/460, 475/476, 491/492; c = 7/460, 1/68, 7/492; the composition's overlap
ratio x₀R_k(1 − c)/|X''| = 6863.256, 11209.544, 18328.277 (exact rationals; five instruments: T1, C-T1-F, C-T1-U, T
adjudicator, SR-C2-2). This ratio is internal to the composition; it is not a switch-capacity-to-deficit ratio (the label
"switch-capacity margins ... the raw deficit" is struck). Every later eligible p: 3p ≥ 2dm + 5, δ ≥ 1, NM alone (P9,
deletion arcs only; does not use S1). If S1 is not confirmed, the first-rank clause stands only at p = 492 at its Cycle 1
standing (computer_assisted, (n1) cited) and is open at 460 and 476. Fences: a finite result on three trees; not (HALL) at
any row; not Hall for any family containing a non-sector source; proves nothing about the CB family. Attribution: Lemma C
composition and Facts A–D: r30 Cycle 1 record (R30-CB-RECORD Lemma C; second read SR-SECTOR); Cycle 2 re-derivation and
extension to p = 460, 476 with S1 in place of node (n1): critic C-T1-F (Claude Opus 5.5); S1: C-T1-F and C-T1-U jointly,
T1 for the attaining flip characters; numerics: T1 (Claude Sonnet 5), reproduced by C-T1-F, C-T1-U, the T adjudicator and
SR-C2-2; NM: r30 Cycle 1 (T1; critics C-T1-F, C-T1-U; second read SR-SECTOR).

C2-2 [proved_informal] CB competition map and reductions. Scope: CB(d,m), d, m ≥ 1, F = all leaves, every p ≥ 1.
(a) Every positive-weight target of a sector source contains v. (b) Every target of an R0, S or O source is v-free.
(c) A V source B has exactly one v-free target, B − v, and w_F(B − v) = w_F(B). (R-i) If X ∩ (S ∪ O) has no
positive-weight member, then Hall(X ∩ sec) implies Hall(X). (R-ii) If X ∩ V has no positive-weight member, then
Hall(X ∩ sec) and Hall(X ∩ (R0 ∪ S ∪ O)) imply Hall(X); in particular, if X ∩ V = ∅, Hall(X ∩ sec) and Hall(X ∖ sec)
imply Hall(X). [The form "X ∩ V has no positive-weight member ⇒ (Hall(X ∩ sec) ∧ Hall(X ∖ sec) ⇒ Hall(X))" (T
adjudication E3; Cycle 2 synthesis S3) is FALSE: zero-weight V sources reach positive-weight v-containing targets by
choke and r switches, as sector sources do; witness CB(3,2), p = 5 (non-eligible), F = all leaves, |X| = 457 (204
sector, 23 zero-weight V, 230 S/O sources): Hall(X ∩ sec) 204 ≤ 226, Hall(X ∖ sec) 488 ≤ 488, Hall(X) fails 692 > 691
(SR-C2-2, sr2_rii_trim.py).] Consequence at any CB row with sector Hall: the open part of (HALL-COND) is exactly
(O1) every X ⊆ R0 ∪ S ∪ V ∪ O, whose core is Hall on X ⊆ O ≅ I_{p+1}(T − {r, s, v}) (the choke forest), and
(O2) every X meeting sec, a positive-weight V source and a positive-weight S or O source. Brute force of (a)–(c) and of
(R-i) and repaired (R-ii) on random families: T adjudicator (eight small CB, every rank) and SR-C2-2 (CB(1,2), CB(2,2),
CB(1,3), CB(3,2), CB(2,3), every rank). Fences: reductions only; not Hall at any row; no per-leaf map (B ↦ B − v is a
whole-class weight-preserving injection), so not E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY and not the C6-F4
own-support rule. Attribution: C-T1-F (F4: competition map, reduction (i), reduction (ii) for families with no arm-v
source) and C-T1-U (R7: reach table, reduction (a) for X ⊆ sec ∪ R0 ∪ S ∪ O), Claude Opus 5.5; T adjudicator (brute
force); SR-C2-2 (repair of (R-ii); witness).

C2-3 [bounded_computation] Exact aggregates, supply − capacity = S from independent sides (supply and capacity from the
closed form W(t) = t²(1+2t)^{dm} + (1+2t)·m d t²(1+t)^{d−1} β^{m−1}, β = (1+2t)^d + t(1+t)^d; S from the C5LA1 definition
by a generic forest DP over every leaf): CB(8,86)/460 and CB(8,89)/476 (new), CB(8,92)/492: supply and capacity have 330,
342, 353 decimal digits; S < 0 has 328, 340, 351 digits; SHA-256 of the decimal S: c5bf9f2b5a04195eef6de384c0aaf5e5fc933d0
aa7f8e623daa7bd4091fe03e8, 80b7bdffc5bc6b479a399db4b3caccfbf07ccceb230f48c24eb0ac98da7f765f,
1b7f6f7c955b566d9036870d2426f6cd556988add791ba5776ac6c789c9b0715. Instruments: U2, both U2 critics, U adjudicator,
controller, SR-C2-2. The 92/492 value is to be compared with the frozen cb-switch-cut RESULTS.json by the controller
(not checked by SR-C2-2).

C2-4 [bounded_computation unless marked] Aut(CB(d,m)) = S_d ≀ S_m (permute chokes; within each choke, its support–leaf
pairs), order (d!)^m m!, for (d, m) ≠ (1, 1); CB(1,1) = P_6 has order 2 (counts on eight small rows and the three d = 8
rows; the natural action is faithful, so equality of orders gives equality of groups); "S_m ≀ S_d" in Cycle 1/2 texts is
a notational slip. Corrected digit counts: |Δ_x| = 326, 337, 349, 408, 479 and |Δ_{x−1}| = 327, 338, 350, 411, 482 at
CB(8,86)/460, CB(8,89)/476, CB(8,92)/492, CB(8,108)/577, CB(7,144)/673 (Δ_x < 0, Δ_{x−1} ≥ 0). Whole-class balances on
the same five rows (all positive-weight targets of each class reached): deficit(O) = W'_{p+1} − W'_p = −1.66, −1.63,
−1.60, −1.29, −1.03 % of W'_p; deficit(sec ∪ V ∪ O) = −2.68, −2.64, −2.60, −2.08, −1.62 % of W'_p; whole-class priors,
not subfamily Hall (C-T1-U; replayed by the T adjudicator and SR-C2-2). Smallest eligible CB row: CB(1,7) at p = 10
(n = 24, alpha = 15, x = 8). Sector-deficient eligible CB rows (P8: 3p < 2dm + 5, 2 ≤ p ≤ dm + 1, arm leaf in F_p): over
every (d, m) with n ≤ 1600 exactly CB(8,86)/460, CB(8,89)/476, CB(8,92)/492, none with n < 1465; smallest m < 400 by d:
none for d ≤ 6; d = 7: m = 109 (n = 1638, p = 510); d = 8: m = 86 (n = 1465, p = 460) [U; F; SR-C2-2]; d = 9: m = 112
(n = 2131, p = 673); d = 10: m = 106 (n = 2229, p = 708); d = 11: m = 134 (n = 3085, p = 984); d = 12: m = 212
(n = 5303, p = 1697) [SR-C2-2 only]. P8 fires on each of the three windows at the first eligible rank only. Closed-form
independence polynomials; never a census of trees.
```

**2. (HALL) scope note, Cycle 2** (append to `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, status unchanged OPEN).
- The clauses marked (S1) stand only if SR-C2-1 confirms S1.
- The clause marked (CBstar) stands only if SR-C2-3 confirms S4. If SR-C2-3 gives different text for that clause, take SR-C2-3's
  text verbatim.
- The `G_k` sentence belongs to SR-C2-4 and is not supplied here.

```text
[r30 C2; second reads SR-C2-1/2/3] On CB(8,86)/460, CB(8,89)/476 and CB(8,92)/492 — the only eligible CB(d,m) rows with
n ≤ 1600 whose root-plus-arm sector {B : r, v ∈ B} is deletion-deficient, so that any saturating flow there must use switch
arcs — (HALL-COND) holds for every subfamily of that sector at every eligible p (computer_assisted, three instances; at the
first eligible rank by the Lemma C(ii) composition with the ternary-cover second eigenvalue (S1), at every later rank by NM
with deletion arcs alone). On CB(d,m) with F = all leaves, a family with no positive-weight S or O source satisfies Hall
whenever its sector part does, and a family with no positive-weight V source satisfies Hall whenever its sector part and
its R0 ∪ S ∪ O part do (proved_informal; the variant with Hall(X ∖ sec) in place of Hall(X ∩ (R0 ∪ S ∪ O)) is false).
What remains open at the three rows is exactly (O1) (HALL-COND) on the non-sector world R0 ∪ S ∪ V ∪ O, whose core is Hall
on the choke forest T − {r, s, v}, and (O2) families meeting the sector, a positive-weight V source and a positive-weight
S or O source. (CBstar) On every CBstar(d,m,t) with t ≥ 2, at eligible ranks, no subfamily of the root-plus-arm sector is
deletion-deficient, so sector Hall holds under (D) ∪ (S) (proved_informal, under F ⊇ {v} ∪ P). No full-network flow has
been computed on any row where switch arcs are necessary; every computed eligible full-network row saturates with deletion
arcs alone (bounded_computation, Cycle 1 and Cycle 2 records). No (CUT) and no candidate is known. Fences: finite results
prove nothing universal; sector Hall is not (HALL); no status transfer; the primary aggregate is untouched. Attribution:
C-T1-F, C-T1-U (Claude Opus 5.5); T1 (Claude Sonnet 5); T adjudicator; r30 Cycle 1 record (Lemma C, NM; SR-SECTOR);
second reads SR-C2-1, SR-C2-2, SR-C2-3.
```

**3. Strike record** (cycle record or `control/CLAIM-DISTINCTIONS.json`; no registered key changes status).

```text
r30 C2 strike (SR-C2-2): the reduction wording "(R-ii) if X ∩ V has no positive-weight member, then Hall(X ∩ sec) ∧
Hall(X ∖ sec) ⇒ Hall(X)" (T adjudication E3; Cycle 2 synthesis S3) is false on CB(3,2) at p = 5 (F = all leaves; literal
w_F and (D) ∪ (S)): an explicit X of 457 sources (204 sector, 23 zero-weight V, 230 positive-weight S/O) has
Hall(X ∩ sec) (204 ≤ 226) and Hall(X ∖ sec) (488 ≤ 488) but not Hall(X) (692 > 691). Cause: zero-weight V sources reach
positive-weight v-containing targets by choke and r switches, shared with sector sources. The proved forms are C-T1-F F4(ii)
and C-T1-U R7(a) (X ∩ V = ∅) and the SR-C2-2 repair (Hall(X ∩ (R0 ∪ S ∪ O)) in place of Hall(X ∖ sec)). Non-eligible rank;
no (CUT); nothing else moves.
```

## Verdicts

verdict[SR-C2-2a]: confirmed_with_repairs
verdict[SR-C2-2b]: confirmed_with_repairs
verdict[SR-C2-2c]: confirmed_with_repairs

- **SR-C2-2a (S14)** is conditional on S1 (SR-C2-1).
  - The mathematics and every numeric literal are confirmed at `computer_assisted`.
  - Repairs to the face: the Cycle 1 Lemma C origin is added to the attribution, and the S1 conditionality and its fallback
    are stated.
- **SR-C2-2b (S3).**
  - Facts (a)–(c) and (R-i) are confirmed at `proved_informal`.
  - (R-ii) as worded is false. It is replaced by the repaired (R-ii) under C2-2 above.
- **SR-C2-2c.**
  - The record is confirmed with these repairs: the digit attribution, the attribution, the (R-ii) repair, and the scope-note
    wording on switch necessity.
  - One literal is not checkable in my capsule: the `RESULTS.json` equality.

## Artifact inventory

- **Deliverable:**
  `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/second-reads/SR-C2-2/SECOND-READ.md`
  (this file only).
- **Scratch:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c2-sr-SR-C2-2/`.
  Standard library only; exact integers and `Fraction`s (floats only in displayed ratios); foreground; `python3 -B`.

| file | SHA-256 | role |
|---|---|---|
| `sr2_seal.py` | `9fa102c3454413281eab4e7271e979567d68e9395b689aab157ef37978487726` | capsule seal and 17 member digests |
| `out_seal.txt` | `98530364e822e87b0fdf8cdbb1754b862ee4c76999a77f3e9ee22f60366fe500` | seal `54e77785…3b4f` recomputed; 17/17 members match |
| `sr2_core.py` | `8a5b65f4c6910918982e1ce7ed29fb6cb42136441a55ae2f3954e4f460e33e72` | polynomials; tree test; generic forest DP; `x` through `α`; literal `w_F`, (D) ∪ (S); aggregate `S` from `H_v`/`R_v`; Dinic |
| `sr2_facts.py` | `0ba951629f2788bc6db7e6508ddf1c61e4449734b4fec86a998a35f375219b12` | S3 facts, closed forms, sector Facts A/B, `X''`, NM, the S1 companion (sanity), WID, (R-i) and the repaired (R-ii); five small CB at every rank |
| `out_facts.txt` | `35e0f7fd27fa1d51d54d35eaaa937a0640e2a72f1462fc7e0f1ad598bb53ebde` | `ALL_OK True`; internal DIGEST `4684518d…327d` |
| `sr2_rii.py` | `b752dca6c546e8c6d3690355414357f879a22edebf05a65b3e1cc18609fddb74` | max-flow search for a literal-(R-ii) counterexample |
| `out_rii.txt` | `3c9fe833b7790484985cb316eafa0b01baf820b4cdbba6d23c918a63de00f327` | one witness at `CB(3,2)`, `p = 5`; internal DIGEST `abea4411…99d6` |
| `sr2_rii_small.py` | `26bad64f08de0fc31edf488fb8fbc5cc421a59ba30b24241c9b6156b3f34babc` | single-zero-weight-V-source search (none found) |
| `out_rii_small.txt` | `bb4c38876955e507df2f3b1f802332c48adad6fd2d2233eec588387763f642a7` | "no single-B0 witness found" |
| `sr2_rii_trim.py` | `31567ef6154ce110df380daa303f3b975250e68204a8964ba9daaa9418c4a3e0` | inclusion-minimal trim and literal re-verification of the witness |
| `out_rii_trim.txt` | `3f6d4392184148cc2b6a057e9953f8c81dee52624898a3ef7404bb4e4e7082a7` | the 457-member witness, listed in full; internal DIGEST `b070c4fa…71ce` |
| `sr2_rows.py` | `8789ab5b86ef440dcedaea8ccbb9b64db535c7efb1c8ec4520e4a5ff04c4b035` | rows from two sides; selector for every leaf at every eligible rank; WID; Lemma C(ii) numbers; P8/P9; digits; class balances |
| `out_rows_86.txt` | `06c9f18f6a34a00ece16945681833ac457cc9e64899b183cb1582ef71d58ce87` | `CB(8,86)/460`, full decimal supply, capacity and `S`; internal DIGEST `5a56116a…7669` |
| `out_rows_89.txt` | `917cd43af6a0db0af6274e08708f71377c2a9a926260ec02425d4df107e7600f` | `CB(8,89)/476`; internal DIGEST `3edc933a…3450` |
| `out_rows_92.txt` | `9a21324204bd6d0e57df908bf17b023551c81b0757d542b6fab6aec191b8be9d` | `CB(8,92)/492`; internal DIGEST `ef011771…a4be` |
| `out_rows_b.txt` | `11d5485bae679683ec3fb9ea0d271cf31765a7a2bb7a74ec4c2851bfcbe02e11` | `CB(8,108)/577`, `CB(7,144)/673` (without the per-leaf pass) |
| `sr2_screen.py` | `fecd519275d8198070b303117f3c2d44743125b286bb67326e001fa2d4dd9e54` | smallest eligible CB rows; sector-deficient rows with `n ≤ 1600`; first `m` by `d ≤ 12` |
| `out_screen.txt` | `5bd0ebf28f68d13eab4c5be57b402ed721ba2663132b032151b3ab4fbbeae3e7` | internal DIGEST `f9f56bb3…f36384` |
| `sr2_aut.py` | `5375f22c4774cdf2b114b853c943a33e6a72d35d392a72a9a4a72a320b865001` | automorphism counts (brute force and centre-canonical) |
| `out_aut.txt` | `1bbb01ff7f619fa039681e24aa111cf11c4ad6dd54de1adc89609902eab0fad5` | internal DIGEST `952e284f…e375` |

- **Replay** (from the scratch directory): `python3 -B sr2_seal.py; python3 -B sr2_facts.py; python3 -B sr2_rii.py;
  python3 -B sr2_rii_small.py; python3 -B sr2_rii_trim.py; python3 -B sr2_screen.py; python3 -B sr2_aut.py;
  python3 -B sr2_rows.py 8 108; python3 -B sr2_rows.py 7 144; python3 -B sr2_rows.py 8 86 full;
  python3 -B sr2_rows.py 8 89 full; python3 -B sr2_rows.py 8 92 full`.
  - Each full row takes about 2–3 minutes.
  - The screen takes about 100 seconds.
  - The rest take seconds.
- **Not produced:** no Lean, no network, no installs, no background jobs, and no writes outside this file and my scratch
  directory.
- **Reread before close:** done. The headings match the protocol. There is one verdict line per statement. The disclosure line
  is present. S1 is marked on every line that uses it.
