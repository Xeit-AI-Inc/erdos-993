# Second Read

Isolated second read `SR-C3-2` of r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`), Cycle 3: GK-SIGN, the `G_k`
aggregate sign theorem. Protocol `control/C3-SECOND-READ-PROTOCOL.md`; brief `control/C3-SECOND-READ-BRIEF-SR-C3-2.md`. Date
2026-09-27.

**Boot.** I am operating within VerityOS. For the boot I read `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` in full (the two boot files the protocol allows). I loaded no other
VerityOS subsystem.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| **Capsule inner seal** `control/c3-second-read/SR-C3-2-PACKET-MANIFEST.json` (SHA-256 of the canonical JSON without `seal_sha256`: sort_keys, `(",", ":")`, no trailing newline) | `a806c0d0aac59646a736028f2fba950ce49863b35e7224c3de237757924871a2` | same | **match** |
| The 18 capsule members (bytes and SHA-256 each; `file_count` 18) | manifest | recomputed before any member was read | **18/18 match** |
| `control/PATH-CHECK-c3-second-read-briefs.json` (member) | — | read | 9 files scanned, 0 findings |
| `control/C3-STAGE6-PACKET-MANIFEST.json` inner seal (member) | `114b4ab43886c0dfa05372f0fca19ca26cd988da4a0bdff33e78db60e2539af7` | same | match; its `SYNTHESIS.md` entry (`f3855716…`) equals the capsule's |

**Read-boundary disclosures.**
1. The host put the project `CLAUDE.md` and the user auto-memory index into my session context automatically. I did not open
   either file, and nothing below relies on them.
2. I read only capsule members and the two boot files. From the two registries (both members) I read, by programmatic
   extraction: the `G_k` key, (WID), (HALL), the primary aggregate, the r29 high-tail keys, `E993-ORDINARY-LEAF-ORDER-BAND`,
   `E993-LOWER-REGION-FIRST-ORDER-SHELL`, and a key and alias scan for the alias check.
3. Above the grant: one non-recursive `ls` of `second-reads/` (directory names only) to confirm where the output goes, and
   `mkdir` of my output and scratch directories. There was no `find`, `grep` or `rg` above the members.
4. I did not verify `control/SOURCE-DIGESTS.json` against `sources/`, because that would mean hashing non-member files. I
   replayed no seat instruments: my own instrument covers every numeric claim I rely on.
5. Python 3 with the standard library only (`python3 -B`), exact integers, foreground runs only, no background job. There was
   no Lean, no network and no install.

## Statements read

- **SR-C3-2a (B6, the theorem).** `SYNTHESIS.md` B6, R6 and registration 7. Origins read: F2 `RETURN.md` §B (B1–B4: `H_1`,
  `R_1`, `Δ_{k+2}(R_1) = −2^k`, `Δ_{k+2}(H_1) < 0`); C-F2-U (Theorem GK-SIGN, Lemma M, the deleted-polynomial table); C-F2-T
  (the Newton/Darroch bound `≤ −2 − 2^{k+1}` and the favorability of 3 and 4); F adjudication (item 5 and E1 with its DAG
  `n1`–`n7`).
- **SR-C3-2b.** Favorability of all `k + 3` leaves at `p = k + 3`, for every `k ≥ 1` (B6(i)).
- **SR-C3-2c.** Registration 7 (key, grade, attribution), registration 11 (the (HALL) `G_k` sentence), registration 12 (the
  `G_k` key note), and registration 13 with the primary-aggregate scope note as worded under `## Headline verdicts`. The alias
  check covers the snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c3-stage2.json` (443 claims) and
  `sources/authority/CLAIM-IDENTITY.json` (434 claims).

## Independent re-derivation

**Frozen objects (SEMANTIC-CONTRACT §1.1).**
- `G_k`: edges `0–1`, `0–2`, `2–3`, `2–4`, and `0–a_i`, `a_i–b_i`, `b_i–c_i` for `1 ≤ i ≤ k`; `n = 3k+5`.
- Leaves and their original supports: `1 ↦ 0`, `3, 4 ↦ 2`, `c_i ↦ b_i`. That gives `k + 3` leaves.
- Witness sets:
  - `W_1 = N(0) ∖ {1} = {2, a_1, …, a_k}`;
  - `W_3 = {0, 4}` and `W_4 = {0, 3}`;
  - `W_{c_i} = {a_i}`.
- Notation: `P = 1+3y+y²` (which is `I(P_3) = I(K_{1,2})`), `Q = 1+2y` (which is `I(P_2)`), `c^{(N)}_j = [y^j]P^N`, and
  `d^{(N)}_j = c^{(N)}_j − c^{(N)}_{j+1}`, with integer indices and zero extension.
- Then `g(N) = d^{(N)}_{N+1}`, `h(N) = d^{(N)}_N`, and `A(k) = c^{(k)}_k − c^{(k)}_{k+2} = h(k) + g(k)`.

**Leaf 1's support and `W_1` (the brief's check).** Leaf 1's support is the root 0, not 2.
- `H_1 = G_k − {1, 0}` is the star `{2; 3, 4}` plus the `k` paths `a_i b_i c_i`, so `I(H_1) = P^{k+1}`.
- `R_1 = G_k − N[0] = G_k − {0, 1, 2, a_1, …, a_k}` leaves 3 and 4 isolated plus the `k` edges `b_i c_i`, so
  `I(R_1) = (1+y)²Q^k`.
- Both of F2's closed forms are confirmed.

**Deleted polynomials, conditioning on vertex 0 (own derivation).**

If 0 is out, the leaf 1 gives `1+y`, the star at 2 gives `P`, and each arm gives `P`. If 0 is in, the leaf 1 gives 1, the star
gives `(1+y)²` (2 is excluded), and each arm gives `Q` (`a_i` is excluded).

| Object | Polynomial |
|---|---|
| `I(G_k)` | `(1+y)P^{k+1} + y(1+y)²Q^k` |
| `G_k − 1` | `P^{k+1} + y(1+y)²Q^k` |
| `G_k − 3` (and `− 4`) | `(1+y)(1+2y)P^k + y(1+y)Q^k` |
| `G_k − c_i` | `(1+y)(1+2y)P^k + y(1+y)³Q^{k−1}` (needs `k ≥ 1`) |
| `H_3 = G_k − {3, 2}` | `(1+y)[(1+y)P^k + yQ^k]` |
| `R_3 = G_k − N[2] = G_k − {0, 2, 3, 4}` | `(1+y)P^k` |
| `H_3 − R_3` | `y(1+y)(P^k + Q^k)` |
| `R_{c_i} = G_k − {a_i, b_i, c_i}` | `I(G_{k−1})` |
| `H_{c_i}` | `G_{k−1}` plus the pendant `a_i` on 0, so `H − R = y·I(G_{k−1} − N[a_i]) = y(1+y)P^k` |

**Per-leaf summands.** With `p = k+3`, each summand is `Δ_{p−1}(H_v) − Δ_{p−1}(R_v) = q_v(p) − q_v(p−1)`, that is
`[y^{k+3}] − [y^{k+2}]` of `H_v − R_v`. The (WID) per-tag bijection makes the same number the net active count of tag `v`. So
the three forms named in the brief (the (WID) form, the `H_v`/`R_v` form, and the per-tag active count) agree term by term.
- **Leaf 1.** `P^{k+1}` gives `c^{(k+1)}_{k+3} − c^{(k+1)}_{k+2} = −g(k+1)`. The polynomial `(1+y)²Q^k` has degree `k+2` and
  leading coefficient `2^k`, so it gives `−(0 − 2^k) = +2^k`. **`σ_1 = 2^k − g(k+1)`.**
- **Leaves 3 and 4.** For any `X`, `[y^{k+3}] − [y^{k+2}]` of `y(1+y)X` equals `x_{k+2} − x_k`. With `X = P^k` this is
  `c_{k+2} − c_k = −A(k)`. With `X = Q^k` (degree `k`) it is `−2^k`. **`σ_3 = σ_4 = −A(k) − 2^k`.**
- **Arm tips.** **`σ_{c_i} = −A(k)`.**

**Lemma M (re-derived).**
- From `P^N = P·P^{N−1}`: `d^{(N)}_j = d^{(N−1)}_j + 3d^{(N−1)}_{j−1} + d^{(N−1)}_{j−2}`, with integer indices.
- For `j ≥ N+1`, all three indices are at least `N−1`, so induction gives `d^{(N)}_j ≥ 0`.
- For `j = N`: `P^{N−1}` is palindromic about `N−1`, so `d^{(N−1)}_{N−2} = −d^{(N−1)}_{N−1}`. Hence
  `h(N) = g(N−1) + 2h(N−1) ≥ 0`.
- At `N = 1` this uses `d^{(0)}_{−1} = −1`. The palindrome holds with zero extension, `c_{−1} = c_1 = 0`.
- Next, `g(N) = d^{(N−1)}_{N+1} + 3g(N−1) + h(N−1)`, where the first term is `≥ 0`.
- With `h(0) = 1` and `g(0) = 0`, this gives `h(N) ≥ 2^N`, `g(1) = 1`, and `g(N) ≥ 3g(N−1)`, so `g(N) ≥ 3^{N−1}` for `N ≥ 1`.

**(ii) and (iii).**
- For `k ≥ 1`: `σ_1 ≤ 2^k − 3^k < 0`.
- `A(k) = h(k) + g(k) ≥ 2^k + 3^{k−1} > 0`, so `σ_c < 0` and `σ_3 < 0`.
- By (i), `S = σ_1 + 2σ_3 + kσ_c = −g(k+1) − 2^k − (k+2)A(k)`. Then `g(k+1) ≥ 3^k` and the bound on `A(k)` give
  `S ≤ −(3^k + 2^k + (k+2)(2^k + 3^{k−1}))`.
- This bound is at most `−14` at `k = 1` and decreases in `k`, so `S < −2`.

**C-F2-T's weaker bound follows.** For `k ≥ 1`, `(k+2)2^k ≥ 3·2^k = 2^{k+1} + 2^k ≥ 2^{k+1} + 2`. So C-F2-U's bound is at most
`−2 − 2^{k+1}`. C-F2-T's route is also sound and independent:
- `S ≤ σ_3 + σ_4` needs only `3, 4 ∈ F` and every other summand `≤ 0`;
- `σ_3 = σ_c − 2^k ≤ −1 − 2^k`.

The two proofs differ in strength and do not conflict. C-F2-U's route is elementary: it uses no real-rootedness.

**(i) Favorability at `p = k + 3` (SR-C3-2b), from the `G_k − v` rows above.**
- **Leaf 1.** `P^{k+1}` contributes `c^{(k+1)}_{k+4} − c^{(k+1)}_{k+3} = −d^{(k+1)}_{k+3} ≤ 0` (Lemma M, `k+3 ≥ k+1`). The
  polynomial `y(1+y)²Q^k` has degree exactly `k+3` and leading coefficient `2^k`, so it contributes `−2^k`. Hence
  `Δ_{k+3}(G_k − 1) = −d^{(k+1)}_{k+3} − 2^k < 0`.
- **Leaves 3 and 4.** `(1+y)(1+2y) = 1+3y+2y²` gives `−(d_{k+3} + 3d_{k+2} + 2d_{k+1})`, with `d = d^{(k)}`. This is at most
  `−2g(k) ≤ −2·3^{k−1} < 0`. The tail `y(1+y)Q^k` has degree `k+2` and contributes 0.
- **Arm tips.** The same main term applies. The tail `y(1+y)³Q^{k−1}` has degree `k+3` and leading coefficient `2^{k−1}`, so it
  contributes `−2^{k−1}`.
- All `k+3` leaves are therefore favorable for every `k ≥ 1`. No eligibility hypothesis enters.
- **Meaning at `k = 1, 2`.** Rank `p = k + 3` is not eligible there: `3p ≥ 2α + 1` (12 ≥ 11 and 15 ≥ 15); at `k = 1` also
  `x + 2 = 5 > 4`. So these rows lie in the closed high tail. "Favorable" is then just the selector's definition
  `Δ_p(G_k − v) < 0` at that rank (`favorableLeaves`, which carries no eligibility), and `S(G_k, k+3)` is the literal
  `C5LA1.aggregate` at a non-eligible rank. Eligibility holds exactly for `k ≥ 3`, as registered in the `G_k` key and
  recomputed here.

**Own instrument** (`scratchpad/c3-sr-SR-C3-2/`; exact integers; no census value in any proof).
- **Deletion side** (`sr2_lib.deletion_side`). A generic rooted two-state DP gives `i_j(G_k − D)` on the original carrier for any
  `D`. Leaves and supports are read from the graph. `F_p` is derived leaf by leaf from `Δ_p(G_k − v)`. `x` is scanned through
  rank `α`, including the terminal difference. `S` is computed from the literal `H_v`/`R_v` deletion sets.
- **Literal-weight side by a different method** (`active_count_poly`). With the tree rooted at `s_v` and `v` forced in, it counts
  the sets `B ∈ I_j` that contain `v` and meet `W_v` as `y·[Π_w (in_w + out_w) − Π_w out_w]` over the children
  `w ∈ W_v`. It uses no deletion sets.
- **Brute force.** Every independent set is enumerated. From the enumeration it computes `α`, `x` and `F_p`, `S` from the
  `H_v`/`R_v` avoid-counts, and supply and capacity from the literal `w_F`.
- **Arcs.** Literal (D) ∪ (S) images are generated from every source.

Checks run and passed (`SR2-CHECK.out.txt`):
- **`k = 1..60`, deletion DP plus weight DP.** The instrument asserts:
  - the tree test (`n − 1` edges, BFS-connected, union-find acyclic);
  - the leaf set and the supports, `W_1`, and `α = 2k+3`;
  - every closed form in the tables above, coefficient for coefficient;
  - `F_{k+3} =` all `k+3` leaves;
  - the three `Δ_{k+3}(G_k − v)` closed forms;
  - the three summand closed forms, each `< 0`;
  - `Δ_{k+2}(R_1) = −2^k` and `Δ_{k+2}(H_1) = −g(k+1) < 0`;
  - the identity, both bounds and `S < −2`;
  - `A = h + g`, `A(k) ≥ 2^k + 3^{k−1}` and `g(k+1) ≥ 3^k`;
  - eligibility iff `k ≥ 3`;
  - **per tag**, net active count = `H_v`/`R_v` summand;
  - **supply − capacity = `S`**, from the independent weight-DP side.
- **`k = 1..8`, brute force.** Literal supply − capacity = `S`, and `F` = all leaves.
- **`k = 1..6`, literal arcs.** Exactly one target has no in-arc, and it is `A_k = {0, 3, 4, b_1, …, b_k}` with `w_F(A_k) = 2`.
  Supply ≤ reachable capacity holds in every case.
- **Lemma M, `N ≤ 300`.** `d^{(N)}_j ≥ 0` for `j ≥ N`, the palindrome, both recursions exact, `h(N) ≥ 2^N` and `g(N) ≥ 3^{N−1}`.

| k | n | α | x | p | \|F\| | eligible / window | supply | capacity | S | `σ_1 / σ_3 / σ_c` | bound (U) | bound (T) |
|---|---|---|---|---|---|---|---:|---:|---:|---|---:|---:|
| 1 | 8 | 5 | 3 | 4 | 4 | no | 4 | 20 | −16 | −3 / −5 / −3 | −14 | −6 |
| 2 | 11 | 7 | 3 | 5 | 5 | no | 37 | 102 | −65 | −17 / −14 / −10 | −41 | −10 |
| 3 | 14 | 9 | 4 | 6 | 6 | [6, 6] (`n = 2p+2`) | 253 | 527 | −274 | −78 / −44 / −36 | −120 | −18 |
| 4 | 17 | 11 | 5 | 7 | 7 | [7, 7] | 1542 | 2735 | −1193 | −339 / −153 / −137 | −355 | −34 |
| 5 | 20 | 13 | 6 | 8 | 8 | [8, 8] | 8875 | 14196 | −5321 | −1456 / −575 / −543 | −1066 | −66 |
| 6 | 23 | 15 | 7 | 9 | 9 | [9, 10] | 49422 | 73573 | −24151 | −6271 / −2283 / −2219 | −3249 | −130 |
| 7 | 26 | 17 | 8 | 10 | 10 | [10, 11] | 269507 | 380552 | −111045 | | −10028 | −258 |
| 8 | 29 | 19 | 9 | 11 | 11 | [11, 12] | 1448816 | 1964489 | −515673 | | −31247 | −514 |
| 9 | 32 | 21 | 10 | 12 | 12 | [12, 14] | 7708854 | 10122470 | −2413616 | | −97998 | −1026 |
| 10 | 35 | 23 | 11 | 13 | 13 | [13, 15] | 40701825 | 52071472 | −11369647 | −2352767 / −752260 / −751236 | −308557 | −2050 |
| 11 | 38 | 25 | 12 | 14 | 14 | [14, 16] | 213617019 | 267461711 | −53844692 | | −973456 | −4098 |
| 12 | 41 | 27 | 13 | 15 | 15 | [15, 18] | 1115790138 | 1371942289 | −256152151 | | −3072939 | −8194 |

These rows reproduce the brief's rows `S = −16, −65, −274, −1193, −5321` at `k = 1..5`, the supply/capacity pairs at
`k = 3..8`, and F2's `k = 10` summands. That agreement is corroboration only; nothing is imported. Further observations
(`bounded_computation`):
- `x(G_k) = k + 1` for `2 ≤ k ≤ 60` (it is 3 at `k = 1`), so the window's lower end is `k + 3` on that range.
- The window extends above `k + 3` exactly from `k = 6` on.
- Every weighted row distinguishes active from present tags; for example, at `k = 2` the present-tag supply is 41 and the
  active supply is 37.

**ℕ-subtraction and guard audit.**
- `p − 1 = k + 2` in `C5LA1.aggregate` is exact, because `p = k + 3 ≥ 4`.
- `3^{k−1}` and `Q^{k−1}` need `k ≥ 1`, which is on the statement's face (arm tips exist only for `k ≥ 1`).
- `g`, `h`, `A` and every `d` are ℤ-valued coefficient differences.
- Lemma M's step at `j = N` uses the index `N − 2`, which is `−1` at `N = 1`. That is valid only with ℤ indices and zero
  extension. A Lean port with ℕ-indexed `Polynomial.coeff` must treat `N = 1` as a base case, or the truncated index would read
  `d^{(0)}_0 = +1` instead of `−1`. This is a formalization note, not a gap in the informal proof.

**Composition for the (HALL) sentence (SR-C3-2c).**
1. The `G_k` key (`proved_informal`), items (3) and (4) for `k ≥ 3`: `N(I_{p+1}) = I_p ∖ {A_k}` and `w_F(A_k) = 2`. Hence
   `Σ_{A ∈ N(I_{p+1})} w_F(A) = capacity − 2`.
2. So (HALL-COND) at `X = I_{p+1}` reads `supply ≤ capacity − 2`.
3. By (WID) (`formally_verified`; `F = F_p(G_k)`), `supply − capacity = S(G_k, k+3)`. The condition is therefore equivalent to
   `S ≤ −2`.
4. GK-SIGN gives `S ≤ −(3^k + 2^k + (k+2)(2^k + 3^{k−1})) < −2`.

**Conclusion.** Whole-layer (HALL-COND) holds on every `G_k`, `k ≥ 3`, at `p = k+3`, with slack at least
`3^k + 2^k + (k+2)(2^k + 3^{k−1}) − 2`, at `proved_informal` (the weakest inputs are the `G_k` key and GK-SIGN).

**What is not established.**
- (HALL-COND) for any proper subfamily `X ⊊ I_{p+1}`.
- A saturating flow on `G_k` for general `k`. (HALL) on `G_k` and (HALL) itself stay OPEN.
- Whole-layer Hall is a necessary condition for a saturating flow, not a sufficient one.
- My literal-arc check at `k = 1..6` is bounded corroboration of steps 1–2 only.

## Findings and repairs

1. **The mathematics of B6 is correct as stated**, at every `k ≥ 1`: (i), (ii) and (iii), the identity, both bounds and Lemma M.
   C-F2-T's bound follows from C-F2-U's identity. No numeric or logical defect was found.
2. **Attribution repair: "C-F2-T … first proof that 3, 4 ∈ F".** It appears in B6, in registration 7 ("favorability of 3, 4")
   and in the F adjudication's E1 header. It is inaccurate.
   - The registered `G_k` key (Cycle 2; SR-C2-4) already carries, as companion content at `proved_informal`,
     "`Δ_{k+3}(G_k − 3) < 0` and `Δ_{k+3}(G_k − 4) < 0` for every `k ≥ 1`". Its certificate attributes that to Lemma F,
     proved twice by the Cycle 2 critics C-F2-U and C-F2-T.
   - The Cycle 3 C-F2-T proof (Darroch) is a re-proof.
   - The new favorability content in Cycle 3 is leaf 1 and the arm tips, and hence (i). That is due to C-F2-U, whose Lemma M
     argument covers all three leaf types. C-F2-T's theorem does not need (i).
3. **Attribution repair: "F2 (recurrence; …)".** F2's block recurrence is the `T(m,k)` chain recurrence (return §A1–A2). It
   concerns the family `T(m,k)` and is not an input to GK-SIGN.
   - GK-SIGN's F2 components are the `H_1`/`R_1` closed forms and `Δ_{k+2}(R_1) = −2^k`, which is the `+2^k` in `σ_1`.
   - F2's `Δ_{k+2}(H_1) < 0` is the sign half. The magnitude `g(k+1) ≥ 3^k > 2^k` that makes `σ_1 < 0` is C-F2-U's (Lemma M).
     C-F2-T gives an independent bound, `σ_1 ≤ −(3^{k+1} − 2^{k+1})/2`.
4. **The per-leaf form (brief item (ii)).** The three forms agree term by term, not only in sum: (WID)'s per-tag bijection makes
   each tag's net active count equal its `H_v`/`R_v` summand. My instrument asserts this per tag for `k ≤ 60`.
5. **The (HALL) scope-note sentence (registration 11) is ambiguous as quoted.** "(HALL-COND) at `X = I_{p+1}` on `G_k`,
   `k ≥ 3`, is a necessary condition only" does not say that the condition HOLDS. It also leaves standing the Cycle 2 note
   "[r30 C2; SR-C2-4; On the explicit family G_k]", which says "Whether it holds on the whole family is open". Repaired text
   below: the condition holds; it is necessary, not sufficient; it supersedes that Cycle 2 sentence; and it says what stays open.
6. **The `G_k` key note (registration 12).** The key's fences say "asserts nothing about the sign of `S(G_k, k+3)`
   (`S(G_k, k+3) ≤ −2` is open for general `k`)" and "`F_{k+3}(G_k)` is not asserted to be the whole leaf set". Both open
   items are now settled by the new key. The `G_k` key's own statement and grade do not change, and the new key is not an
   alias. Repaired note below.
7. **The primary-aggregate note (registration 13) is correct as worded under `## Headline verdicts`.** I checked:
   - `k = 3` has `n = 14 = 2p + 2`, which lies in `E993-LOWER-REGION-FIRST-ORDER-SHELL` (formal);
   - rows with `k ≥ 4` satisfy `2p + 3 ≤ n = 3k + 5 ≤ 4p − 8`;
   - `⌊(4k+6)/3⌋ > k+3` iff `k ≥ 6`.

   Two precision repairs:
   - (a) for `k = 1, 2`, rank `k + 3` is not eligible, so the primary aggregate is not addressed there at all;
   - (b) the window is `[x(G_k) + 2, ⌊(4k+6)/3⌋]`, and GK-SIGN covers only `p = k+3`. Ranks above `k+3` exist exactly for
     `k ≥ 6`. Ranks below `k+3` would exist only if `x(G_k) ≤ k`. That is not excluded by any registered statement
     (`x ≤ k+1` is registered), but is observed false for `2 ≤ k ≤ 60` (bounded).
8. **Key name.** `E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE` is a predicate the statement satisfies, since
   (iii) gives `S < −2 < 0`. It asserts less than the statement, not more. It does not claim eligibility or a `k`-range, which
   the statement fixes (`k ≥ 1`). **Alias check:** the proposed key is absent from both registries, which have 0 duplicate keys.
   No alias or alias pattern matches. Registry text mentioning "G_k" occurs only in the `G_k` key, in (HALL)'s scope notes, and
   in two unrelated uses of the symbol (`E993-C2-CT-U3-ORDER102-LC-RELAXATION-WITNESS` and the `CBstar` key's `G_k`, a
   different object). Overlaps at small `k` are recorded as distinction rows: the high-tail keys at `k = 1, 2`; the order band
   at `k = 1, 2`; the first-order shell at `k = 3`.
9. **Fences hold.** It is a family sign theorem: not (HALL), not a mechanism, not an injection or domination rule. It is none of
   the refuted keys of SOLUTION-CONTRACT §3.2 and uses no weight except in the composed (HALL) sentence. No census value enters
   the proof. It re-proves no closed region (at `k ≤ 3` it restates known signs with an exact value). No status transfers, and
   there is no RTree wording.
10. **Formalization note** (for the Cycle 4 U1 draft, not a defect). This is the ℕ-index hazard in Lemma M at `N = 1`, noted in
    the guard audit. The F adjudication's draft Lean statement matches (iii): `g(k+1) = coeff(k+2) − coeff(k+3)` of `P^{k+1}`,
    and `A(k) = coeff k − coeff(k+2)` of `P^k`.

## Registration text

```text
KEY: E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE
STATUS: VERIFIED
GRADE: proved_informal
STATEMENT: For k >= 1 let G_k be the tree on vertices 0, 1, 2, 3, 4 and a_i, b_i, c_i (1 <= i <= k) with edges 0-1, 0-2, 2-3,
2-4, 0-a_i, a_i-b_i, b_i-c_i (n = 3k+5; the original leaves are 1, 3, 4, c_1, ..., c_k with original supports 0, 2, 2, b_i).
Let p = k+3, P = 1+3y+y^2, c^(N)_j = [y^j]P^N, g(N) = c^(N)_(N+1) - c^(N)_(N+2), A(k) = c^(k)_k - c^(k)_(k+2). Then for every
k >= 1: (i) F_p(G_k) = {original leaves v : Delta_p(G_k - v) < 0} is the whole leaf set; (ii) for every leaf v the summand
Delta_(p-1)(G_k - {v, s_v}) - Delta_(p-1)(G_k - N[s_v]) = q_v(p) - q_v(p-1) is strictly negative, and equals 2^k - g(k+1) for
v = 1, -A(k) - 2^k for v = 3, 4, and -A(k) for v = c_i; (iii) S(G_k, k+3) = C5LA1.aggregate G_k (k+3) = -g(k+1) - 2^k -
(k+2)A(k) <= -(3^k + 2^k + (k+2)(2^k + 3^(k-1))) < -2, in particular S(G_k, k+3) <= -2 - 2^(k+1). Proof on the face:
conditioning on vertex 0 gives I(G_k - 1) = P^(k+1) + y(1+y)^2(1+2y)^k, I(G_k - 3) = I(G_k - 4) = (1+y)(1+2y)P^k +
y(1+y)(1+2y)^k, I(G_k - c_i) = (1+y)(1+2y)P^k + y(1+y)^3(1+2y)^(k-1), and H_v - R_v = P^(k+1) - (1+y)^2(1+2y)^k,
y(1+y)(P^k + (1+2y)^k), y(1+y)P^k respectively (H_1 = P^(k+1), R_1 = (1+y)^2(1+2y)^k); Lemma M: with d^(N)_j = c^(N)_j -
c^(N)_(j+1) (integer indices, zero extension), d^(N)_j >= 0 for j >= N, h(N) := d^(N)_N = g(N-1) + 2h(N-1) (palindromy of
P^(N-1)), g(N) = d^(N-1)_(N+1) + 3g(N-1) + h(N-1), so h(N) >= 2^N and g(N) >= 3^(N-1) (N >= 1), A(k) = h(k) + g(k) >= 2^k +
3^(k-1); favorability: Delta_(k+3)(G_k - 1) = -d^(k+1)_(k+3) - 2^k, Delta_(k+3)(G_k - 3) = -(d_(k+3) + 3d_(k+2) + 2d_(k+1)) <=
-2g(k), Delta_(k+3)(G_k - c_i) = the same minus 2^(k-1) (d = d^(k)).
SCOPE: One explicit family, one rank p = k+3, every k >= 1; deletions on the original carrier; original leaves, supports and
closed neighbourhoods; F fixed at rank p. For k = 1, 2 the rank k+3 is not eligible (3p >= 2*alpha + 1, the closed high
tail; also x + 2 > p at k = 1): there 'favorable' means only the selector's definition Delta_p(G_k - v) < 0 and S is the literal
aggregate at a non-eligible rank. (G_k, k+3) is eligible iff k >= 3 (the G_k key); k = 3 has n = 2p+2 (the closed first-order
shell); new sign content for the lower region only for k >= 4, where 2p+3 <= n <= 4p-8. The window [x(G_k)+2, floor((4k+6)/3)]
has ranks other than k+3 for k >= 6 (above) and possibly below if x(G_k) <= k (not excluded by a registered statement; x(G_k) =
k+1 observed for 2 <= k <= 60, bounded); those ranks are not covered. Composed with (WID) (formally_verified) and the G_k key
(proved_informal) it gives whole-layer (HALL-COND) at X = I_(p+1) on every G_k, k >= 3 (a necessary condition for (HALL) only;
see the scope note on (HALL)). Numeric corroboration (bounded_computation, not proof): closed forms, favorability, the per-tag
(WID) form, supply - capacity = S from an independent literal-weight DP for k = 1..60 and brute force for k = 1..8 (S = -16,
-65, -274, -1193, -5321 at k = 1..5); Lemma M and both recursions checked to N = 300 (SR-C3-2).
ATTRIBUTION: C-F2-U, r30 Cycle 3 (Claude Opus 5.5): the exact identity (iii), Lemma M, the three summand closed forms, (i) for
every leaf (first proof that leaf 1 and the arm tips are favorable); C-F2-T, r30 Cycle 3 (Claude Opus 5.5): the independent
bound S <= -2 - 2^(k+1) (Newton/Darroch) and per-leaf negativity, with a re-proof of the favorability of 3, 4; favorability of
3 and 4 first registered as companion content of the G_k key (Cycle 2 Lemma F: C-F2-U and C-F2-T; SR-C2-4); F2, r30 Cycle 3
(Claude Sonnet 5): H_1 = P^(k+1), R_1 = (1+y)^2(1+2y)^k, Delta_(k+2)(R_1) = -2^k, Delta_(k+2)(H_1) < 0; F adjudicator, r30 Cycle
3: line-by-line verification and DP to k = 40; SR-C3-2: isolated second read. The family G_k: r30 Cycle 1 C-F2-T (construction)
and the G_k key (Cycle 2). Definitions of record: the first-interior run (Codex), entries 1-18; r26/r24/r25 definition layers;
(WID) C1-LA1. The active-tag weight and mechanism used only in the composed (HALL) note: Codex (GPT-6 Astra/Sol/Luna).
FENCES: A family sign theorem at one rank; not (HALL) and not a restricted-scope (HALL) theorem; (HALL) stays OPEN; not a
transport mechanism, injection or domination rule, hence none of the refuted mechanisms of SOLUTION-CONTRACT s3.2; no status
change to E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE, E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST,
TRANSFER, E993-BETA-AGG or Erdos #993; no status change to any registered key; no census value in the proof; the bounded rows
are corroboration only; no RTree wording; the closed regions (high tail at k = 1, 2; order band / first-order shell at k <= 3)
are not re-proved.
ALIASES: none
```

```text
DISTINCTION ROW: DR-R30-C3-GKSIGN-01
KEY: E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO
TEXT: Same family and rank, different content: the G_k key states eligibility (k >= 3), favorability of 3 and 4, the unique
no-in-arc target A_k of weight 2 and the reachable-capacity gap 2, and its fences say it asserts nothing about the sign of
S(G_k, k+3) and does not assert F_(k+3)(G_k) = whole leaf set. E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE states
F_(k+3)(G_k) = whole leaf set, strict negativity of every per-leaf summand and the exact value of S(G_k, k+3) (< -2), for every
k >= 1; it says nothing about arcs or reachability. It extends the G_k key; neither is an alias of the other.
```

```text
DISTINCTION ROW: DR-R30-C3-GKSIGN-02
KEY: E993-R29-BIPARTITE-HIGH-TAIL-AGGREGATE
TEXT: At k = 1, 2 the rank k+3 satisfies 3p >= 2*alpha(G_k) + 1 (12 >= 11, 15 >= 15), so (HTA) already gives S(G_k, k+3) <= 0
there (and E993-BIPARTITE-LEAF-HIGH-TAIL-POINTWISE signs each leaf term). The new key's content at k = 1, 2 is only the exact
value and strictness on one family; for k >= 3 the rank is in the lower region, outside (HTA). Not an alias.
```

```text
DISTINCTION ROW: DR-R30-C3-GKSIGN-03
KEY: E993-LOWER-REGION-FIRST-ORDER-SHELL
TEXT: At k = 3 (n = 14 = 2p+2, eligible) the first-order shell (formally_verified) already gives S(G_3, 6) <= 0, and at k = 1, 2
(n <= 2p+1) E993-ORDINARY-LEAF-ORDER-BAND signs every leaf term. The new key's new sign content in the lower region is k >= 4;
at k <= 3 it adds only the exact value and strictness. Not an alias.
```

```text
SCOPE NOTE ON: E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO
TEXT: [r30 C3; SR-C3-2] The aggregate sign on this family is now registered separately and extends this key (not an alias):
E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE (proved_informal) gives, for every k >= 1, F_(k+3)(G_k) = the whole
leaf set and S(G_k, k+3) = -g(k+1) - 2^k - (k+2)A(k) < -2. The two open items named in this key's fences ('S(G_k, k+3) <= -2
is open for general k'; 'F_(k+3)(G_k) is not asserted to be the whole leaf set') are settled by that key; this key's statement,
grade and fences are otherwise unchanged and it still asserts neither. Attribution: C-F2-U, C-F2-T (Cycle 3), F2, F adjudicator;
SR-C3-2.
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE
TEXT: [r30 C3; SR-C3-2] GK-SIGN (E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE, proved_informal) gives
S(G_k, k+3) < -2 for every k >= 1; new sign content only for k >= 4 (k = 1, 2: rank k+3 is not eligible; k = 3 has n = 2p + 2,
the closed band); rank k + 3 only — alpha(G_k) = 2k + 3, so for k >= 6 the window's top floor((4k+6)/3) exceeds k + 3 and the
window has further ranks that GK-SIGN does not cover (ranks below k+3 would exist only if x(G_k) <= k, not excluded by a
registered statement, observed not to occur for 2 <= k <= 60); a family fact, not a status change.
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r30 C3; SR-C3-2; G_k whole layer] On every G_k, k >= 3, at p = k+3, (HALL-COND) at X = I_(p+1) HOLDS: by the G_k key
the only positive-weight target without an in-arc is A_k, of weight 2, so the whole-layer condition reads supply <= capacity -
2, i.e. S(G_k, k+3) <= -2 by (WID) (formally_verified, F = F_p), and E993-R30-GK-TREE-RANK-K-PLUS-3-AGGREGATE-STRICTLY-NEGATIVE
gives S(G_k, k+3) <= -(3^k + 2^k + (k+2)(2^k + 3^(k-1))) < -2 (proved_informal, the grade of the weakest inputs: the G_k key
and that key). This is a necessary condition for (HALL) only (composition of (WID), the G_k key and that key); it supersedes the
sentence 'Whether it holds on the whole family is open' of the [r30 C2; SR-C2-4; On the explicit family G_k] note. Not
established: (HALL-COND) for any proper subfamily X of I_(p+1), a saturating flow on G_k for general k, and hence (HALL) on
G_k; (HALL) stays OPEN; nothing here is a cut; no status transfer. Attribution: C-F2-U, C-F2-T (Cycle 3); F adjudicator; the
G_k key's authors; (WID) C1-LA1; SR-C3-2.
```

## Verdicts

verdict[SR-C3-2a]: confirmed_with_repairs
verdict[SR-C3-2b]: confirmed
verdict[SR-C3-2c]: confirmed_with_repairs

- **SR-C3-2a.** The theorem is confirmed at full scope: (i), (ii), (iii), the identity, both bounds and Lemma M, re-derived by
  hand and checked by an independent instrument. Repairs: attribution only (findings 2 and 3) and the per-leaf-form statement
  (finding 4). Register it with the text above.
- **SR-C3-2b.** Favorability of all `k + 3` leaves at `p = k+3` holds for every `k ≥ 1`, with no eligibility hypothesis. At
  `k = 1, 2` it is the selector's definition at a non-eligible (high-tail) rank.
- **SR-C3-2c.** The key name is a predicate the statement satisfies, and the alias check is clean (distinction rows 01–03).
  Registrations 12, 13 and 11 are confirmed in substance, with the precision repairs in findings 5–7. Use the scope-note texts
  above.

## Artifact inventory

Scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-sr-SR-C3-2/`.
Everything uses the standard library only, runs under `python3 -B`, and uses exact integers. There is no `__pycache__`, and no
background job was started.

| File | SHA-256 | Purpose |
|---|---|---|
| `sr2_lib.py` | `98580a02723583b4906305fe4b3fbe89a02a9b6e4720cbc2d2f7925eaf459eba` | `G_k` builder, tree test, generic deletion DP, witness-flag active-weight DP, brute-force enumerator |
| `sr2_check.py` | `3ff7aac7e3643e2131d5a66cda7714f0e40e3e96fdde187b823c90fe1e383951` | All checks. Run as `python3 -B sr2_check.py 60 8 6` (about 24 s): DP `k ≤ 60`, brute force `k ≤ 8`, arcs `k ≤ 6`, Lemma M `N ≤ 300` |
| `SR2-CHECK.json` | `94220156f6cf87f65dc13541cc38f156b39643c0f5f273af464fbfe8664821a5` | Canonical JSON (sort_keys, `(",", ":")`, no trailing newline). The raw digest equals the canonical digest printed by the run |
| `SR2-CHECK.out.txt` | `47ff39e1825848b594acfb1736e094d0277e82480b84d26a15f3b60bd6119ab1` | Printed summary |

Output: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/second-reads/SR-C3-2/SECOND-READ.md`,
this file. Its own digest is not self-recorded. Nothing was written anywhere else, no sealed member was edited, and nothing
was written under `sources/`.
