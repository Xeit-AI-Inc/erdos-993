# Second Read

Isolated second read `SR-C3-4`, Cycle 3 of r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`; Erdős #993, weighted
mixed-boundary transport). Date 2026-09-27. Instruction set: `control/C3-SECOND-READ-PROTOCOL.md` and
`control/C3-SECOND-READ-BRIEF-SR-C3-4.md`. I read both in full after the seal check.

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, the two boot files the protocol permits. I loaded no other
VerityOS subsystem and wrote no memory, conversation log, module, skill, log or decision.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

(The runtime id is what my own session reports. I cannot observe the middle clause; I carry it as the protocol's transport
wording.)

**Dependency.** D1–D3 rest on E1, the mark-clone reduction, which SR-C3-3 is reading concurrently. I take **E1 as a
hypothesis**. Every line below that uses it is marked **[E1]**, and my verdicts on SR-C3-4a, 4b and 4d are conditional on it.
SR-C3-4c's ruling uses E1 only through D1.

## Identity and seal audit

- **Capsule seal.** `control/c3-second-read/SR-C3-4-PACKET-MANIFEST.json` has stage `cycle-3-second-read-SR-C3-4`, run
  `erdos-993-math-dre-20260926-r30-weighted-transport`, 19 files and schema `verityos.math-dre.packet-manifest.v1`. I took
  the SHA-256 of the canonical JSON without `seal_sha256` (`sort_keys`, separators `(",",":")`, no trailing newline). It
  recomputes to **`885d048ea2c73d24d15be3c40f5004c38e468a66fce7e8433262f159d17b4451`**. That equals the stored field and the
  wrapper's value.
- **Members.** All **19/19** members match on SHA-256 and on byte count. I checked this before reading any member.
- **Nested seal.** `control/C3-STAGE6-PACKET-MANIFEST.json` (stage `cycle-3-stage6`, 28 files) recomputes to
  `114b4ab43886c0dfa05372f0fca19ca26cd988da4a0bdff33e78db60e2539af7`, equal to its field. It lists
  `cycles/cycle-3/stage6/SYNTHESIS.md` at `f3855716…f45b3d`, the digest my capsule carries.
- **Source digest.** The one `sources/` member, `sources/authority/CLAIM-IDENTITY.json`, has SHA-256 `eba20be3…d09c84`. That
  equals its entry in `control/SOURCE-DIGESTS.json`. In that file and in the run-local snapshot,
  `E993-R23-LITERAL-DELETE-ONLY-HALL` is byte-identical.
- **Seat instruments.** The protocol admits `scratchpad/c3-*/` only as capsule members. My capsule lists none, so I read
  or replayed no seat or critic code. My instrument is new code written from `SEMANTIC-CONTRACT.md` and the prose of the
  capsule members.
- **Read-boundary disclosures (this seat).**
  1. At session start the harness put the project `CLAUDE.md` and the user auto-memory index into my context. I did not open
     either as a source, and nothing below relies on them. `CLAUDE.md` asks for a conversation log. I wrote none, because the
     protocol confines my writes to this file and my scratch directory.
  2. **Boot order and display.** I verified the seal first, as the wrapper directs, and then booted. My first boot display
     broke at a shell separator (a zsh `=`-expansion error), so both boot files were displayed only in part at first. I read
     both in full before writing anything.
  3. **Harness spills.** The synthesis and the T1 return were too long for inline display. The harness saved byte copies to
     session tool-results files outside the run root, and I read those copies. They are the same digest-verified members.
  4. **Session-scratch copies.** I made two short-lived copies in the session scratchpad outside the run root, and deleted
     both. One was the C-T1-F critique, used only for a line count; I read it in place. The other was my own `out_crit.txt`,
     used for a `cmp` after a code fix.
  5. **Listings.** I ran one non-recursive `ls -la` of `second-reads/`. It returned directory names only, including sibling
     seats' names (SR-C3-1, SR-C3-3, SR-C3-7). I opened nothing under them. I also listed my own scratch directory. There was
     one `find` for bytecode, rooted at my own scratch directory.
  6. I parsed three capsule members with Python for key texts and an alias scan over claim keys: the registry snapshot, the
     master registry, and the source-digest record.
  7. I ran no `find`, `grep` or `rg` rooted above the capsule members. There was no network, no install and no Lean.
  8. I started no background job. Every script ran in the foreground with `python3 -B`, and no bytecode was written.
  9. I edited no sealed member.

## Statements read

Statement of record: `cycles/cycle-3/stage6/SYNTHESIS.md`. From it I read `## Exact established results` D1, D2, D3 and E-e;
`## Reconciliation` R1 and R4; `## Headline verdicts`, the (HALL) row; and `## Registrations` items 9 and 11. Origins: C-T1-F
(A1–A4), C-T1-U (TL, BNM, A-6), and the T adjudication (T1-A1..A4, its D3 table, cross-route item 2). The Cycle 2 inputs of
record are the (HALL) key's scope notes in `control/snapshots/CLAIM-IDENTITY.run-local.c3-stage2.json`, the `CBstar` key, the
(NM) key, `cycles/cycle-2/CYCLE-CLOSE.md` §§5–6 and `second-reads/SR-C2-2/SECOND-READ.md` (C2-1, C2-2).

- **SR-C3-4a (D1, `computer_assisted`).** (HALL-COND) holds for every `X ⊆ I_{p+1} ∖ sec`, with deletion arcs only, at all
  177 eligible ranks of `CB(8,86)` [460,516], `CB(8,89)` [476,534] and `CB(8,92)` [492,552]. The worst `ρ` is at `q = 1`,
  first rank: `460421124882845/462938713343604`, `1698319298589907/1707291739633300`, `4838946572060835/4863675235331932`.
- **SR-C3-4b (D2, D3).** D2 is full (HALL) with deletion arcs only at the 174 ranks above the first on the three rows. D3 is
  the same at `CB(8,108)`, `p ∈ [578,648]`, and `CB(7,144)`, `p ∈ [674,768]` (166 instances, adjudicator-derived). This part
  also covers the composition's logic and its failure at the first ranks.
- **SR-C3-4c (R1).** The open part at the three first ranks, and whether the Cycle 2 reduction (R-i) settles the S/O-free
  subcase under (D) ∪ (S).
- **SR-C3-4d (the key).** `E993-R30-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-AWAY-FROM-FIRST-RANK`: whether the name is a predicate
  the statement satisfies; the alias check against `E993-R23-LITERAL-DELETE-ONLY-HALL`; the registration text; the (HALL)
  scope-note pointer.

## Independent re-derivation

**Definitions used.** These are those of `SEMANTIC-CONTRACT.md` §1.
- `w_F(B) = #{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}`, with `W_v = N(s_v) ∖ {v}`.
- (D) is the deletion `B ↦ B ∖ {q}`. (S) is the two-for-one switch at `u ∉ B` with `|N(u) ∩ B| = 2`.
- `F = F_p(T)` is fixed at the original rank. `x` is computed through rank `α`.
- `CB(d,m)` is the path `r–s–v`, `m` chokes `u_i ~ r`, `d` supports `b_ij ~ u_i`, and a private leaf `c_ij ~ b_ij`. The
  source classes are `sec` (`r, v ∈ B`), `R0` (`r ∈ B`, `v ∉ B`), `S` (`s ∈ B`), `V` (`v ∈ B`; `r, s ∉ B`) and `O` (none of
  `r`, `s`, `v`).

### 1. Row fidelity (`sr4_rows.py`; literal tree; exact integers)

**Method.**
- For each row I build the literal edge list. I test `IsTree` in two separate steps: the edge count `n − 1`, then BFS
  connectivity.
- `I(T)` comes from a generic forest DP on the explicit tree. I compute `α` and `x`; `x` is scanned through `α`, with
  `i_{α+1} = 0` explicit.
- **Selector.** `F_p` is derived **for every leaf at every eligible rank**.
  - Every private leaf `c_ij` is sent to `c_00` by an explicit permutation (swap chokes `i ↔ 0`, then legs `j ↔ 0`). I
    **verify** that permutation is an automorphism of the literal edge set, so `T − c_ij ≅ T − c_00`.
  - `Δ_p(T − v)` and `Δ_p(T − c_00)` come from the DP. Full DPs on three further private leaves reproduce `I(T − c_00)`.
- `S` comes from the C5LA1 definition, `q_ℓ = i(H_ℓ) − i(R_ℓ)` with `H_ℓ = T − {ℓ, s_ℓ}` and `R_ℓ = T − N[s_ℓ]`, by generic
  DP on the literal deleted forests.
- Supply and capacity come from an **independent** tag-by-tag activity count:
  `W(y) = [v∈F]·y²(1+2y)^{dm} + [c∈F]·dm·y²(1+y)^{d−1}(1+2y)β^{m−1}`, with `β = (1+2y)^d + y(1+y)^d`.
  - The arm tag `v` is active iff `r ∈ B`.
  - The tag `c_ij` is active iff `u_i ∈ B`.
- This `W` equals the literal layer sums at every rank on eight small CB trees (`sr4_literal.py`, 0 mismatches).
- `supply − capacity = S` is asserted at every eligible rank before any other output.

| row | n | α | x | window (ranks) | `F_p` | WID | `S < 0` | first-rank supply / cap / `S` digits | SHA-256(`S`) at the first rank | `|Δ_x|`, `|Δ_{x−1}|` digits |
|---|---|---|---|---|---|---|---|---|---|---|
| CB(8,86) | 1465 | 775 | 458 | [460,516] (57) | all 689 leaves, every rank | every rank | every rank | 330/330/328 | `c5bf9f2b5a04195e…` | 326, 327 |
| CB(8,89) | 1516 | 802 | 474 | [476,534] (59) | all 713 | every rank | every rank | 342/342/340 | `80b7bdffc5bc6b47…` | 337, 338 |
| CB(8,92) | 1567 | 829 | 490 | [492,552] (61) | all 737 | every rank | every rank | 353/353/351 | `1b7f6f7c955b566d…` | 349, 350 |
| CB(8,108) | 1839 | 973 | 575 | [577,648] (72) | all 865 | every rank | every rank | 415/415/413 | `49626c8572ec2256…` | 408, 411 |
| CB(7,144) | 2163 | 1153 | 671 | [673,768] (96) | all 1009 | every rank | every rank | 485/485/483 | `4f6325157e78ae62…` | 479, 482 |

- The first three `S` digests equal SR-C2-2's registered values (C2-3) digit for digit. The five rows agree with E-e and with
  the Cycle 2 digit record.
- 57 + 59 + 61 = **177** eligible ranks, and 72 + 96 = 168.

### 2. The E1 criterion, my own implementation (`sr4_crit.py`) [E1]

I wrote the criterion from the synthesis's B1 text and the critiques' prose.

**The criterion.**
- Fix `q ∈ [1, m]`. The clones `(B, x)` of r-free `(p+1)`-sources with `|Q| = q` in-chokes and an active mark `x` are rank
  `j = p − q` of `P_q = B_{qd−1} × Λ^N`, with `N = d(m − q) + 1`. The out-choke legs and the arm are ternary positions.
- **Type counts.** `S_a = C(qd−1,a)·C(N,j−a)·2^{j−a}` at rank `j` and `T_a = C(qd−1,a)·C(N,j−1−a)·2^{j−1−a}` at rank `j−1`.
  Then `r_j = ΣS_a`, `r_{j−1} = ΣT_a` and `ρ_q = r_j/r_{j−1}`.
- **Transport.** It runs on the path `S_0 – T_0 – S_1 – T_1 – …`. Boolean deletions go from type `a` to `a−1`, and ternary
  deletions go from `a` to `a`.
  - The flows are `f_a = ρT_{<a} − S_{<a}` and `g_a = S_{≤a} − ρT_{<a}`. They are nonnegative iff `r_j T_{<a} ≥ r_{j−1} S_{<a}`
    and `r_{j−1} S_{≤a} ≥ r_j T_{<a}` for every `a`.
  - Target type `a` receives `g_a + f_{a+1} = ρT_a`. The sum telescopes to 0; this is asserted.
- `r_j` is cross-checked against `[y^j](1+y)^{qd−1}(1+2y)^N`, computed by a separate product.
- The sector condition is `3p ≥ 2dm + 5`.

**Results.**

| row | criterion holds (all `q`) | worst `q` | first-rank `ρ_1` (exact) | max `ρ` over the window | full-(HALL) deletion certificate (criterion ∧ sector condition ∧ `F_p` = all leaves) |
|---|---|---|---|---|---|
| CB(8,86) | **57/57** ranks | 1 at every rank | `460421124882845/462938713343604` = 0.99456172 | 0.99456172 (p = 460) | **56 ranks, [461,516]** |
| CB(8,89) | **59/59** | 1 | `1698319298589907/1707291739633300` = 0.99474464 | 0.99474464 (476) | **58, [477,534]** |
| CB(8,92) | **61/61** | 1 | `4838946572060835/4863675235331932` = 0.99491564 | 0.99491564 (492) | **60, [493,552]** |
| CB(8,108) | **72/72** | 1 | `88964996559682/89197279304167` = 0.99739585 | 0.99739585 (577) | **71, [578,648]** |
| CB(7,144) | **96/96** | 1 | `361507351101341/362046708578535` = 0.99851025 | 0.99851025 (673) | **95, [674,768]** |

- **No rank of any window fails the criterion.**
- The three claimed first-rank fractions match mine **exactly as fractions**.
- The window maximum 0.99491564 (C-T1-F; the T adjudicator) and the adjudicator's 0.99739585 and 0.99851025 all reproduce.
- The certified lists are contiguous, and 56 + 58 + 60 = **174**, 71 + 95 = **166**.
- The sector condition fails only at 460, 476, 492, 577 and 673.
- This is a third independent code for D1/D2, after C-T1-F and the T adjudicator, and a second for D3.

### 3. Literal realization on small trees (`sr4_literal.py`)

**Setup.** Eight small `CB(d,m)`: (1,3), (1,5), (2,2), (2,3), (3,2), (2,4), (3,3), (4,2). I use every rank `2 ≤ p ≤ α − 1`
(65 instances). Layers, `w_F` and (D)/(S) arcs are literal. The tag set is `F` = all leaves, which is E1's hypothesis
`F ⊇` private leaves; the literal `F_p` is recorded.
- **E1 flow built on literal arcs [E1].** Where the criterion fires (23 instances), I route per clone `f_a/(S_a·a)` along
  each Boolean arc and `g_a/(S_a·b)` along each ternary arc. The mark and chokes are never deleted.
  - In **23/23** instances every r-free source sends exactly `w_F(B)`.
  - Every r-free target with `q ≥ 1` chokes receives **exactly** `ρ_q·w_F(A)`.
  - Every target containing `r` receives 0.
  - This realizes the clone bijection and the type biregularity literally.
- **Composed flow.** Where the criterion and `3p ≥ 2dm + 5` hold and the sector is nonempty (10 instances), I add the sector
  flow: `1/K` along each in-sector deletion.
  - In **10/10** the sum saturates every source, and every sector target receives exactly `2(dm−K+1)/K ≤ 1`.
  - Literal Dinic deletion-only max-flow equals the total supply.
  - Unsound: 0.
- **First-rank failure mode.** In all **32/32** instances with `3p < 2dm + 5`, the whole sector is deletion-deficient on the
  literal network, and literal Dinic deletion-only max-flow is below supply.
- **Competition map S3 on literal (D) ∪ (S), every source of every instance: 0 violations.**
  - (a) Every positive-weight target of a sector source contains `v`. It is an in-sector target or a `q = 1` choke-switch V
    target.
  - No O target ever lies in `N(sec)`.
  - (b) Every target of an R0, S or O source is `v`-free.
  - (c) A V source has exactly one `v`-free target, `B − v`, of equal weight.

### 4. Family-level test of (R-i) and repaired (R-ii) under (D) ∪ (S) (`sr4_reduction.py`)

"Hall for every subfamily of `Y`" is equivalent to the max-flow from `Y`'s sources saturating `Y` (Hall / max-flow). The test
covers seven small CB trees at every rank (56 instances).
- **(R-i).** If `sec` saturates under (D) ∪ (S), then `sec ∪ V ∪ R0 ∪ {weight-0 S/O}` saturates. This held in **20/20**
  instances where the premise held.
  - Five of these have a **deletion-deficient** sector that switch arcs rescue: `CB(2,2)/4`, `CB(2,3)/5`, `CB(3,2)/5`,
    `CB(3,3)/7` and `CB(4,2)/6`. That is exactly the first-rank situation at the `CB(8,·)` rows.
- **(R-ii).** If `sec` and `R0 ∪ S ∪ O` each saturate, then `sec ∪ R0 ∪ S ∪ O ∪ {weight-0 V}` saturates. This held in
  **14/14**.
- These are bounded corroborations, not proofs. The rows are non-eligible (`S > 0` on several), which the rank-general
  reductions permit.

### 5. The first ranks (`sr4_firstrank.py`)

The sector is `{r, v} ∪ C`, with `C` of rank `K = p − 1` in the leg cube and weight 1. Its other deletion targets, `B − r` (a
choke-free V set) and `B − v` (R0), weigh 0. So its positive-weight deletion image is exactly the rank-`(K−1)` sector layer,
and the ratio of supply to deletion image is `2(dm − K + 1)/K`.

| first rank | `3p` vs `2dm + 5` | ratio | next rank |
|---|---|---|---|
| 460 | 1380 vs 1381 | **460/459** | 229/230 |
| 476 | 1428 vs 1429 | **476/475** | 237/238 |
| 492 | 1476 vs 1477 | **492/491** | 245/246 |
| 577 | 1731 vs 1733 | **289/288** | 576/577 |
| 673 | 2019 vs 2021 | **337/336** | 672/673 |

- At the three `CB(8,·)` first ranks the deficit is `R_K − R_{K−1} = R_K/p` (asserted).
- The R3 ratios at 577 and 673 reproduce.

**ℕ-subtraction guards (all checked).**
- `K = p − 1` needs `p ≥ 2`.
- `dm − K + 1 ≥ 1` needs `p − 1 ≤ dm`: 515 ≤ 688, 533 ≤ 712, 551 ≤ 736, 647 ≤ 864, 767 ≤ 1008.
- `j = p − q ≥ 1` because `q ≤ m < p` on every window.
- `qd − 1 ≥ 0` because `q ≥ 1`.
- `N = d(m − q) + 1` needs `q ≤ m`.
- `j − 1 − a` and `j − a` are range-guarded in code.
- `r_{j−1} > 0` at every `(p, q)` on the rows.
- `p − 1` in `S` needs `p ≥ 2`.

### 6. The composition, re-derived (SR-C3-4b) [E1]

**Why the targets are disjoint.**
- The E1 flow uses only (D) arcs from r-free sources that delete neither the mark nor a choke. So every E1 target is r-free
  (a deletion never adds `r`) and has `q ≥ 1`.
- The sector flow deletes only `y ∉ {r, v}`, so every sector-flow target contains `r` and `v`.
- `r ∈ A` versus `r ∉ A` separates the two target sets. R0 sources, and r-free sources without a choke, weigh 0 and send
  nothing.

**Why the sum is Hall for every family.**
- Above the first rank each flow loads every target by at most its weight, and the target sets are disjoint. So the sum is
  one saturating fractional flow on the whole network, using (D) arcs only.
- For any `X`, `Σ_X w = Σ_{B∈X} Σ_A f(B,A) ≤ Σ_{A∈N(X)} Σ_B f(B,A) ≤ Σ_{A∈N(X)} w(A)`. This is the verification lemma B7;
  its proof is this one line.
- Supplies and capacities are integers and the arcs are uncapacitated. So the max-flow value equals the total supply, and by
  max-flow integrality an **integral** saturating flow exists. That is (HALL) at `(T, p)`.
- **The argument is the disjoint-target FLOW composition, not a reduction between Hall conditions.** Neither (R-i) nor the
  repaired (R-ii) is used. (R-ii) could not be, since D2 covers families with positive-weight V members.
- The phrasing "Hall for every non-sector family + Hall for every sector family ⇒ Hall for every family" is **not valid** as
  an inference between Hall conditions. Two Hall conditions may draw on the same target capacity; that is exactly how the
  unrepaired (R-ii) failed (SR-C2-2's `CB(3,2)/5` witness). The composition works because both certificates are flows. The
  sector certificate is the stronger "sector deletion-Hall **into sector targets only**" (the (NM) double count), not sector
  Hall under (D) ∪ (S). The E1 certificate never loads a target containing `r`.

**Why it fails at 460, 476 and 492 (and at 577 and 673).**
- There the sector's in-sector deletion ratio exceeds 1 (table §5). Its other deletion targets weigh 0. So `X = sec` is a
  deletion-only deficient family, and **no** deletion-only saturating flow exists: any saturating flow must use switch arcs.
- The sector's only positive-weight switch exits are the choke-switch targets `{v, u_i} ∪ (g − b_ij)`. These are r-free
  `q = 1` V targets (S3(a); literal check §3), which are E1 targets already loaded at `ρ_1·w_F(A)`.
- The target sets are no longer disjoint, and only the residual `(1 − ρ_1)·w_F(A)` remains. That is C-T1-F's reduced-capacity
  sector statement (A4), which is not proved.

### 7. The open part at the first ranks (SR-C3-4c)

**(R-i) and its proof.**
- The registered text (SR-C2-2 C2-2, `proved_informal`, `CB(d,m)`, `F` = all leaves, every `p`): if `X ∩ (S ∪ O)` has no
  positive-weight member, then `Hall(X ∩ sec) ⇒ Hall(X)`.
- Proof, re-derived. `w(X) = w(X ∩ sec) + w(X ∩ V)`, because R0 members and the remaining S/O members weigh 0. Map each
  positive V member to `B − v`: that is a `v`-free target of equal weight, and the map is injective. By S3(a) the
  positive-weight part of `N(X ∩ sec)` contains `v`, so the two sets are disjoint. Hence
  `cap N(X) ≥ cap N(X ∩ sec) + w(X ∩ V)`.
- Facts (a) and (c) hold for the **full** relation (D) ∪ (S) (§3; SR-C2-2). So (R-i) applies to the (D) ∪ (S) network, with
  its premise read in that same network.

**Does (R-i) apply at the first ranks?** Yes.
- Its premise is **not** deletion-only sector Hall, which indeed fails at the first rank for `X = sec`. Its premise is sector
  Hall in the network in which `Hall(X)` is asked, (D) ∪ (S).
- That premise is **registered**: `computer_assisted`, for **every** `X ⊆ sec` at 460, 476 and 492, via Lemma C(ii) with the
  second-eigenvalue theorem S1. This is SR-C2-2 C2-1; SR-C2-1 confirmed S1, and it is in the (HALL) Cycle 2 scope note and the
  Cycle 2 close §6.
- The E-b record (full `(τ,q)` class unions only) is weaker and is **not** the input.
- §4 corroborates this literally: 5 instances where a deletion-deficient sector is (D) ∪ (S)-Hall, and the `sec ∪ V⁺` family
  saturates.

**Case split.** Take any `X ⊆ I_{p+1}` at 460, 476 or 492, with `F = F_p` (all leaves, derived). Zero-weight members only
enlarge `N(X)`, so assume every member has positive weight.
1. `X ∩ sec = ∅`: **D1 [E1]**.
2. `X` meets `sec`, with no S⁺/O⁺ member: **(R-i)** plus the registered sector Hall.
3. `X` meets `sec`, with no V⁺ member: **repaired (R-ii)** plus the registered sector Hall, plus D1 for `X ∩ (R0 ∪ S ∪ O)`
   **[E1]**. Its targets are `v`-free by S3(b), so the capacities add.
4. **Remaining:** `X` meets all three of `sec`, `V⁺ = {v ∈ B; r, s ∉ B; w_F(B) > 0}` and `(S ∪ O)⁺`.

**Ruling.**
- The open part at the three first ranks is exactly F's formulation. That equals the registered Cycle 2 (O2), now that D1
  closes (O1). By C2-LA1 it suffices to treat `Aut(T)`-invariant all-positive-weight such families.
- T's formulation ("meeting both `sec` and V⁺"), which the synthesis adopted, is a strict superset. It omits (R-i) and so
  lists case 2 as open.
- At 577 and 673 the E1 criterion also holds (§2), so the non-sector families are settled there too [E1]. The open part
  there is every family meeting `sec`, beginning with sector Hall under (D) ∪ (S) itself, (O3), which is not registered.

## Findings and repairs

1. **(4a; confirmed.)** D1 reproduces on a third independent code at all 177 ranks.
   - `F_p` is all leaves at every rank, derived leaf by leaf through verified automorphisms, with DP cross-checks.
   - WID holds from independent sides at every rank.
   - The three first-rank `ρ_1` values are exact matches. No rank fails.
   - The literal clone flow is exact on 23 small instances.
   - The statement's face must carry: E1 as hypothesis [E1]; `F_p = leafSet(T)` as a bounded fact at these rows; deletion
     arcs only; and that `sec` is excluded.
2. **(4b; confirmed with repairs.)** D2 (174) and D3 (166) reproduce: the criterion, the sector condition and the derived
   selector all hold at every listed rank. The repairs are to the argument's face.
   - (i) The composition must be stated as the **disjoint-target flow sum**: E1 targets are r-free with a choke; sector-flow
     targets contain `r` and `v`.
   - (ii) The integrality step must be on the face.
   - (iii) The inference "Hall(non-sector) + Hall(sector) ⇒ Hall" must not be written as a reduction between Hall conditions.
     It is invalid in that form (the struck-(R-ii) pattern).
   - (iv) The sector piece is the registered (NM) double count (`K` down, `2(dm−K+1)` up), used as an input at its grade.
   - The failure at the first rank is a deletion-only deficit of `X = sec` (ratios in §5). It is not a cut, and it says
     nothing about (HALL) there.
3. **(4c; confirmed with repairs: R1 ruling.)** (R-i) settles the S/O-free subcase at 460, 476 and 492 in the (D) ∪ (S)
   network. Its premise is the registered sector Hall under (D) ∪ (S) for every `X ⊆ sec`.
   - **R1's adopted wording is superseded.** The open part is exactly families meeting `sec`, V⁺ **and** a positive-weight S
     or O source (F's wording, the Cycle 2 (O2)).
   - The synthesis's `## Headline verdicts` "Smallest unproved lemma" sentence must be narrowed the same way.
   - The sentence "whose registered text neither T, F nor I read" is answered: the text is read here, and it applies.
4. **(4d; confirmed with repairs: the name.)** `…-CB-ROWS-…-AWAY-FROM-FIRST-RANK` has two problems.
   - "CB-ROWS" admits a family reading (every `CB(d,m)`) that the statement, about five named trees, does not satisfy.
   - "AWAY-FROM" is vague about which ranks.
   - Repaired name: **`E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`**. It is a predicate the
     statement satisfies (D2 and D3 are full (HALL) at every eligible rank above the first on exactly five rows). It asserts
     nothing about the first ranks, where D1 gives only the non-sector clause.
   - The synthesis's name is kept as an alias.
   - The alias scan of the 443 snapshot keys finds no key with this meaning. The two legacy CB keys concern other relations
     and scopes: `E993-C3-CB8-92-ORDINARY-RANK-SCOPE-CERTIFICATE` (r23 Retag, arm cut) and
     `E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD` (r23 literal Delete/Retag).
5. **(Attribution.)** Item 9 of the synthesis lists only C-T1-F and the T adjudicator. The brief requires more, and so do
   §3.8 and the inputs.
   - C-T1-U (corroboration). Its distinct criterion rests on the uncarried Harper 1974 / Hsieh–Kleitman 1973 product
     theorem, cited from memory; that undischarged import must be named.
   - T1 (the choke-forest weight model).
   - r30 Cycle 1 for (NM).
   - Codex for the mechanism and weight.
   - The definition-layer runs.
   - All are supplied below.
6. **(Grade and inputs.)** The grade is `computer_assisted`.
   - Inputs: E1 (key 8; `proved_informal` if SR-C3-3 confirms) and (NM) (`proved_informal`).
   - The finite exact verification has three codes for D1/D2 (C-T1-F, the T adjudicator, SR-C3-4) and two for D3 (the T
     adjudicator, SR-C3-4).
   - If SR-C3-3 rejects E1, this key does not register. If SR-C3-3 repairs E1, the key stands only if the repaired text still
     gives the clone flow of §2 on `CB(d,m)` with `F ⊇` private leaves.
7. **(Fence check.)**
   - Finite instances only; not a family theorem.
   - (HALL) stays OPEN, and the primary aggregate is untouched: `S < 0` at these rows is already known, and there is no
     status transfer.
   - No closed region is re-proved. All ranks satisfy `3p < 2α + 1`, and CB is not a settled family.
   - No census value enters.
   - No RTree wording.
   - No refuted mechanism is revived. The deletion-only scope is rank-specific, with the first-rank sector deficits on its
     face; see the distinction row.
   - E1 is a fractional per-clone transport that never handles the arm tag. Whether it is distinct from the per-leaf and
     support-preserving refuted keys is SR-C3-3's check, not mine.
8. **(Record.)** The two (O3) first ranks 577 and 673 carry D1's non-sector clause as well: the criterion holds at all 72 and
   96 ranks, from the adjudicator's table and this read. I place this in the (HALL) scope note, not in the key, to keep the
   key at the synthesis's exact lists.

## Registration text

Register the key only if SR-C3-3 confirms E1, or confirms it with repairs that leave the CB clone flow intact.

```text
KEY: E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK
STATUS: VERIFIED (restricted scope, separate key; E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN)
GRADE: computer_assisted
STATEMENT: Let CB(d,m) be the tree with path r–s–v, m chokes u_i ~ r, d supports b_ij ~ u_i and one private leaf c_ij ~ b_ij
(n = 3 + m + 2dm). Consider the five rows (T, eligible window) = (CB(8,86), [460,516]), (CB(8,89), [476,534]), (CB(8,92),
[492,552]), (CB(8,108), [577,648]), (CB(7,144), [673,768]), with (n, alpha, x) = (1465, 775, 458), (1516, 802, 474),
(1567, 829, 490), (1839, 973, 575), (2163, 1153, 671); each window is exactly {p : x(T) + 2 <= p, 3p < 2 alpha(T) + 1}.
Let F = F_p(T), which at every rank of every window is the whole leaf set (dm + 1 leaves, derived leaf by leaf). Let w_F be
the literal active-tag weight, and use only the deletion arcs (D). Let sec = {B in I_{p+1}(T) : r, v in B}. Then:
(D1) at every p of the first three windows (177 instances), (HALL-COND) holds for every X ⊆ I_{p+1}(T) \ sec, with N(X)
taken along (D) arcs alone;
(D2) at CB(8,86), p in [461,516]; CB(8,89), p in [477,534]; CB(8,92), p in [493,552] (174 instances), the network with
deletion arcs alone has an integral flow saturating every source supply, i.e. (HALL) holds at these (T, p) with no switch
arc used;
(D3) the same at CB(8,108), p in [578,648], and CB(7,144), p in [674,768] (166 instances).
Certificate:
(i) [E1, key E993-R30-CB-MARK-CLONE-TYPE-PATH-DELETION-TRANSPORT] For q in [1,m], set j = p − q, N = d(m − q) + 1,
S_a = C(qd−1,a) C(N,j−a) 2^(j−a), T_a = C(qd−1,a) C(N,j−1−a) 2^(j−1−a), r_j = sum S_a, r_(j−1) = sum T_a and
rho_q = r_j / r_(j−1). Suppose that for every q, rho_q <= 1 and, for every a, r_j T_{<a} >= r_(j−1) S_{<a} and
r_(j−1) S_{<=a} >= r_j T_{<a}. Then a fractional flow exists along (D) arcs that delete neither the mark nor a choke. It
sends w_F(B) from every r-free source, loads every r-free target A with q >= 1 chokes by exactly rho_q w_F(A), and loads no
target containing r. The criterion holds at every rank of all five windows (exact integers). The worst rho is at q = 1 and
the first rank: 460421124882845/462938713343604, 1698319298589907/1707291739633300, 4838946572060835/4863675235331932,
88964996559682/89197279304167 and 361507351101341/362046708578535. The largest rho over the three CB(8,·) windows is
0.99491564. R0 sources, and r-free sources with no choke, have weight 0.
(ii) Sector flow. Sector sources are {r, v} ∪ C, with C of rank K = p − 1 in the leg cube {∅, b_ij, c_ij}^{dm}; all have
weight 1. Each sends 1/K along each of its K in-sector deletions. Each in-sector target (weight 1) then receives
2(dm − K + 1)/K <= 1, which holds iff 3p >= 2dm + 5 (the registered (NM) double count, K down and 2(dm − K + 1) up). This
holds at every listed rank of (D2) and (D3).
(iii) Composition. The targets of (i) contain no r; those of (ii) contain r and v. So the two flows are target-disjoint,
and their sum is a saturating fractional flow along (D) arcs. It gives (HALL-COND) for every X by summing the flow over X.
Supplies and capacities are integers, so max-flow integrality gives an integral saturating flow. (D1) is (i) alone.
At the first eligible ranks 460, 476, 492, 577 and 673, the whole sector is deletion-deficient, with ratios of supply to
positive-weight deletion image 460/459, 476/475, 492/491, 289/288 and 337/336. No deletion-only saturating flow exists
there, and this key asserts nothing there beyond (D1).
SCOPE: Five named ordinary trees at the exact (T, p) lists above: 177 instances for (D1), and 174 + 166 = 340 instances for
full (HALL). The fixed original selector F_p(T) = leafSet(T) is derived at every listed rank (bounded_computation). The
relation is (D) only, and the weight is w_F only. There is no eligibility hypothesis beyond the listed windows. The inputs
at their grades: E1 (key E993-R30-CB-MARK-CLONE-TYPE-PATH-DELETION-TRANSPORT, proved_informal after SR-C3-3) and (NM)
E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING (proved_informal). The finite exact verification ran on
independent codes: C-T1-F, the T adjudicator and SR-C3-4 for (D1)/(D2); the T adjudicator and SR-C3-4 for (D3). Each code
derives F_p and asserts supply − capacity = S(T, p) from independent sides at every rank. The explicit clone and sector
flows were realized exactly on literal networks of small CB trees (SR-C3-4: 23 and 10 instances; Dinic agrees).
ATTRIBUTION: C-T1-F (Claude Opus 5.5; the mark-clone construction A1, (D1) = A2, (D2) = A3). The r30 T adjudicator (Claude
Opus 5.5; independent replication of (D1)/(D2); (D3) adjudicator-derived at Stage 5). C-T1-U (Claude Opus 5.5; the
concordant tag-lifting reduction (TL) and a corroborating block normalized-matching criterion, conditional on the uncarried
Harper 1974 / Hsieh–Kleitman 1973 product theorem cited from memory, an undischarged import that this key does not use).
T1 (Claude Sonnet 5; the choke-forest weight model: w_F on r-free sources = present private leaves whose choke is present;
sector weight 1; R0 weight 0). r30 Cycle 1 T1, critics C-T1-F and C-T1-U, and second read SR-SECTOR for (NM). Isolated
second read SR-C3-4 (Claude Opus 5.5; third independent code; literal validation). Codex (GPT-6) for the transport mechanism,
the active-tag weight and the relation. The first-interior run (Codex) and r24–r26 for the definition layer.
FENCES: Finite instances; not a family theorem, and nothing about any other CB(d,m) or any other rank. Not (HALL) at the
first eligible ranks 460, 476, 492, 577 or 673. (HALL) E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL stays OPEN. The primary
aggregate E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE is untouched (no status transfer; S < 0 at these rows was
already known), as are E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE, TREE, FOREST, TRANSFER, E993-BETA-AGG and Erdős #993. No
claim that deletion arcs suffice anywhere else: deletion-only Hall fails on the root-plus-arm sector at each row's first
eligible rank and at G(8^82, 7^2)/448. Not E993-R23-LITERAL-DELETE-ONLY-HALL (distinction row below). No refuted mechanism
is revived. The composition is a target-disjoint flow sum, not an implication between Hall conditions. C-T1-U's
corroboration carries an undischarged import. No governed-RTree assertion. No census value enters.
ALIASES: E993-R30-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-AWAY-FROM-FIRST-RANK (the Cycle 3 synthesis's proposed name); "CB rows
deletion-arc weighted Hall above the first eligible rank"; "r30 C3 D1–D3".
```

```text
DISTINCTION ROW: R30-C3-FIVE-CB-ROWS-DELETION-HALL-VS-R23-LITERAL-DELETE-ONLY-HALL
KEY: E993-R23-LITERAL-DELETE-ONLY-HALL
TEXT: E993-R23-LITERAL-DELETE-ONLY-HALL (REFUTED) is the universal statement: for every finite ordinary tree and every
p >= x(T) + 2 under the r23 literal contract, |X| <= |Gamma_Delete(X)| for every X in the complete tagged top side. It uses
unweighted cardinalities on r23 tagged clones, and it is refuted through the order-91 witness of
E993-R23-LITERAL-ACTUAL-TREE-FIXED-GAMMA-HALL. E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK
differs on four counts. (1) It is rank-specific and tree-specific: 340 named (T, p) instances on five CB trees, plus a
non-sector clause at 177, never universal. (2) It uses the r30 active-tag weight w_F (capacities w_F(A), supplies w_F(B)),
not r23 clone cardinalities. (3) Its selector is fixed at F_p(T) = leafSet(T), derived at every listed rank. (4) The
sector deletion deficits sit on its face: at each row's first eligible rank the whole root-plus-arm sector is
deletion-deficient (460/459, 476/475, 492/491, 289/288, 337/336), so deletion-only Hall FAILS there, and the key asserts
nothing there. The refuted key's scope note ("Restricted deletion faces remain separate") covers exactly this kind of
restricted face. Neither key's status transfers to the other.
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r30 C3; SR-C3-4] At CB(8,86), CB(8,89) and CB(8,92), with F = F_p(T) = the whole leaf set (derived at every eligible
rank), (HALL-COND) holds for every X ⊆ I_{p+1} \ sec at all 177 eligible ranks. Full (HALL) holds with deletion arcs alone
at the 174 ranks above the first, and likewise at CB(8,108), p in [578,648], and CB(7,144), p in [674,768] (166 ranks). See
key E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK (computer_assisted; E1 =
E993-R30-CB-MARK-CLONE-TYPE-PATH-DELETION-TRANSPORT as input). At the first eligible ranks 460, 476 and 492, combine that
non-sector clause (which closes the Cycle 2 obligation (O1)) with three registered inputs: the computer_assisted sector
Hall under (D) ∪ (S) for every X ⊆ sec [r30 C2; SR-C2-2], the reduction (R-i) and the repaired (R-ii) (proved_informal).
Then (HALL-COND) holds for every X whose positive-weight members avoid at least one of sec, V⁺ and (S ∪ O)⁺. Here
V⁺ = {B : v ∈ B; r, s ∉ B; w_F(B) > 0}, and (S ∪ O)⁺ = the positive-weight sources containing s or none of r, s, v. (R-i)
applies in the (D) ∪ (S) network because its premise is sector Hall in that network, which is registered at these ranks,
even though the sector is deletion-deficient there. What remains unproved at these three ranks is exactly (HALL-COND) for
families meeting all three of sec, V⁺ and (S ∪ O)⁺: the Cycle 2 (O2), unchanged. By C2-LA1 it suffices to treat
Aut(T)-invariant all-positive-weight such families. This supersedes the Cycle 3 synthesis R1 wording "every X meeting both
sec and V⁺", which omitted (R-i). Any saturating flow at these three ranks must use switch arcs: the whole sector is
deletion-deficient, ratio p/(p − 1). At CB(8,108)/577 and CB(7,144)/673 the same non-sector criterion holds (T
adjudicator's table; confirmed SR-C3-4), so the open part there is every family meeting sec, beginning with sector Hall
under (D) ∪ (S) itself (O3). Fences: finite rows only; reductions and restricted instances are not (HALL); no deficient
cut is known; the primary aggregate is untouched; no status transfer. Attribution: C-T1-F and C-T1-U (Claude Opus 5.5); T1
(Claude Sonnet 5); the r30 T and F adjudicators (Claude Opus 5.5; T's and F's open-part wordings); SR-C2-2 ((R-i), repaired
(R-ii), sector Hall); SR-C3-4 (the (R-i) ruling).
```

## Verdicts

verdict[SR-C3-4a]: confirmed
verdict[SR-C3-4b]: confirmed_with_repairs
verdict[SR-C3-4c]: confirmed_with_repairs
verdict[SR-C3-4d]: confirmed_with_repairs

- **4a.** D1 at 177 ranks, with the exact fractions. Conditional on E1 (SR-C3-3).
- **4b.** D2 (174) and D3 (166) as computed. The composition is stated as a target-disjoint flow sum with the integrality
  step, not as a Hall-condition reduction. Conditional on E1.
- **4c.** R1 is narrowed: (R-i) applies under (D) ∪ (S), and the open part is F's wording, the Cycle 2 (O2).
- **4d.** The name is repaired to `E993-R30-FIVE-CB-ROWS-DELETION-ARC-WEIGHTED-HALL-ABOVE-FIRST-ELIGIBLE-RANK`, and the
  attribution and inputs are completed. The key registers only if SR-C3-3 confirms E1.

## Artifact inventory

Scratch is `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-sr-SR-C3-4/`.
Everything uses the standard library only, with exact integers and `Fraction`s, run as `python3 -B`. No `__pycache__` or
`.pyc` exists (checked). No background job was started. Nothing was written outside this file and that directory, apart
from the two deleted session-scratch copies (disclosure 4).

| File | SHA-256 | Purpose |
|---|---|---|
| `sr4_lib.py` | `283b9f2446a7569004b5761220b6c2dabfa6d812616a1d379d4b633bbeb5ff73` | literal CB tree, tree test, generic forest DP, leaves / supports / `W`, automorphism construction |
| `sr4_rows.py` | `1852a8492cd21c8a042f50935470dbe90484c45e42891f575fa963f49c0b5e9b` | five rows: `n`, `α`, `x`, windows, `F_p` per leaf per rank, WID from independent sides |
| `out_rows.txt` / `out_rows.json` | `a8b39032af93a00f72ef2e7945bd2925cdbbdfe7077ef03ff192bdca83eb4d87` / `51ac36d16d7dde9e44408317cb6c14530c81379210a9fe767f9dd79a2e74ccd1` | row data (per-rank records, `S` digests) |
| `sr4_crit.py` | `6a2cc8093982c77a2e81de95976e3d753eec28f4930c02b5378f1b008a908b86` | E1 criterion at every eligible rank; sector condition; certified rank lists |
| `out_crit.txt` / `out_crit.json` | `84cc3f52e0f1e218ece2a74c73f998c95a2501ff90b0cd89261ffa2ead6e7619` / `575852629c3cc999128ae7746522b7400a09fbd385fc0602317221089f6d5834` | per-rank worst `ρ` (exact), `q`, certificates |
| `sr4_literal.py` | `7ca46733042cda58ce946c9cae848b1d8c9cb3f447ef93798611ca0143a1355f` | literal small-tree validation: explicit E1 / sector / composed flows, Dinic, S3 facts, GF check |
| `out_literal.txt` / `out_literal.json` | `e41cde37ee5301a68cb3999440e75414a4331a835b26e6c5050e347b8c1a673c` / `b2b91387b5b89be9d03eda91619fe2832137ec85ba08005947f8ecf410f21c96` | 65 instances; totals |
| `sr4_reduction.py` | `212e59b65459c5a731d582a852c80821458daf1653c44afa9d8f0109564037cd` | family-level (R-i) / repaired (R-ii) test under (D) ∪ (S) |
| `out_reduction.txt` / `out_reduction.json` | `719ae756668ff8fb22f808a3f70a4d80b9ae32892f0c0aff269b7e3978bb20e1` / `bf57c30f7e508501a26e45d47d2e17a64b989462d1cc18004c01a345e0f68e16` | 56 instances; 20/20 and 14/14 |
| `sr4_firstrank.py` | `22699c5228f4972a94610de8cf70feeba238527cb23e5bc80a5d69ea46475fab` | first-rank sector ratios; ℕ guards |
| `out_firstrank.txt` / `out_firstrank.json` | `c44e581d0f5b9183aca4aa0dc312e209183b9c81a832bd052a5dba48d6f24257` / `d538786c6ed0aa4c97381686adb6ef92a273a97e285ff6a002e9de868ce6a000` | ratios 460/459 … 337/336 |

**Replay.** Run from the scratch directory, in the foreground, in order (`sr4_crit.py` reads `out_rows.json`); about 2.5
minutes in total:
`python3 -B sr4_rows.py > out_rows.txt`, `python3 -B sr4_crit.py > out_crit.txt`, `python3 -B sr4_literal.py > out_literal.txt`,
`python3 -B sr4_reduction.py > out_reduction.txt`, `python3 -B sr4_firstrank.py > out_firstrank.txt`.

`sr4_crit.py` was edited once after its first run: a class with no clones (`r_j = 0`) is now treated as vacuous, not as a
failure. On the rows the re-run output was byte-identical (`cmp`). `sr4_literal.py` was patched twice, for the same empty-class
case, before its only completed run.

Deliverable: `second-reads/SR-C3-4/SECOND-READ.md` (this file).
