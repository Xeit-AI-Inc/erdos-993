# Second Read

Reader `SR-C3-7` (isolated second read, batch: B5, B7, B8, B9; the `CBstar` paraphrase correction; the P10 / Lemma U alias; the
(NM) note). Run `erdos-993-math-dre-20260926-r30-weighted-transport` (Erdős #993, weighted mixed-boundary transport), Cycle 3.
Date 2026-09-27. Instruction set: `control/C3-SECOND-READ-PROTOCOL.md` and `control/C3-SECOND-READ-BRIEF-SR-C3-7.md` (both capsule
members).

**Boot.** I am operating within VerityOS. For the boot I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, both in full. I first displayed each file in part, then read the
remainder before writing anything. I loaded no other VerityOS subsystem: no memory, decisions, logs, conversations, operations,
modules or skills. The protocol grants those two files only.

**Model disclosure:** chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

(The runtime id is verbatim from this session's environment ("Opus 5.5 (1M context)", exact id `claude-opus-5-5[1m]`). The
transport-resolution part follows the charter's wording; the dispatch parameter itself is not observable from inside the session.)

Grades are those of `SOLUTION-CONTRACT.md` §4. Nothing below changes a status. The registry is not written by this read.

## Identity and seal audit

| Object | Recorded | Recomputed | Result |
|---|---|---|---|
| Capsule inner seal `control/c3-second-read/SR-C3-7-PACKET-MANIFEST.json` (SHA-256 of the manifest minus `seal_sha256`, `sort_keys`, separators `(",", ":")`, no trailing newline) | `166d84fd1e13583d4f3d0e98db05742cb230e5bdc0ad806dc692f5abb20405c8` | `166d84fd1e13583d4f3d0e98db05742cb230e5bdc0ad806dc692f5abb20405c8` | **match** |
| The 24 capsule members (bytes and SHA-256 each; `file_count` 24) | manifest | recomputed before any member was read | **24/24 match** |
| `control/PATH-CHECK-c3-second-read-briefs.json` (member) | — | read | 9 files scanned, 0 findings |

The seal was verified before reading, as the wrapper and duty 1 require. The first two files read were the protocol and the brief.

**Read-boundary disclosures (complete; nothing below relies on a non-member except where stated).**
1. **Host injection.** The host placed the project `CLAUDE.md` and the user auto-memory index into context at session start. I did
   not open either, and neither is used here.
2. **One search rooted above the capsule (a protocol breach; disclosed in full).** To look for "Lemma 2.1 / leg poset" I ran one
   `grep -rn` whose file list included five capsule members, but also the directories `cycles/` and `second-reads/`. Both
   directories are recursive roots above the members. It printed lines from two **non-member** files:
   - `cycles/cycle-3/stage5/adjudicators/T/ADJUDICATION.md`, lines 96, 127 and 424: a heading "T1-b. Lemma 2.1 (the ternary-leg
     threshold)"; a bullet "The only possible collision is with `t = 1` strata, which Lemma 2.1 never covers"; and a bullet "T1's
     `E993-R30-TERNARY-LEG-LATTICE-SHADOW-THRESHOLD`: an alias of (NM); at most a scope note on it";
   - `cycles/cycle-3/stage4/critics/T1/U/CRITIQUE.md`, lines 105–106 and 125: a fragment on a "Lemma 2.1 tightness claim" probed by
     Dinic matching on `I(N·K_2)` ("For N = 7, t = 4, 5, 6 and N = 9, t = 6, 7, Hall fails exactly"), and a heading "A-2 Lemma
     2.1 … is a mathematical alias of (NM). The 'ternary-leg lattice'".

   I opened neither file. I use none of these lines as evidence. The 7f verdict and its registration text rest only on capsule
   members: the synthesis, the controller facts CF6-T1/CF6-T4 (as the record of who made the identification, never as evidence),
   the (NM) registry text, and the U1 critiques and U adjudication for A4. I state below that the Lemma 2.1 identification is not
   re-derived here.
3. **A refused stray write.** A shell redirect typo in one replay command tried to write `/before.sha` at the filesystem root. The
   write was refused ("permission denied"), and nothing was written. The replay itself ran inside my scratch directory.
4. **Harness-persisted display.** The display of the capsule member `cycles/cycle-3/stage4/critics/U2/T/CRITIQUE.md` was too long,
   so the harness saved it to its own tool-results file outside the run root. I read it back from there. The content is exactly
   that capsule member.
5. **Directories.** I used `ls -d` and `mkdir -p` on my own scratch directory and my own output directory only.
6. **Not read.** The frozen Lean carry `sources/c3-stage7-sources/U1-Main.lean` is not a capsule member and was not opened.
   - For its statement I use the Lean text quoted on U1's face (`cycles/cycle-3/stage3/returns/U1/RETURN.md`, a member).
   - For its digest I use four member faces that agree: C-U1-F, C-U1-T, the U adjudication and the synthesis. All four give
     `f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180`, 2851 lines.
   - I also did not read T1's return, the T adjudication (see item 2), any other critique, any scratch of other seats, other
     experiment roots, the network, or Mathlib.
7. **Execution.** No Lean or `lake`, no installs, no background jobs. Python ran as `python3 -B` with the standard library and
   exact integers only (plus `fractions` in `sr7_b.py`). No `__pycache__` exists in my scratch directory.

## Statements read

Statement of record: `cycles/cycle-3/stage6/SYNTHESIS.md`. I read `## Exact established results` rows A2, A4, B5, B7, B8, B9, E-f
and E-g; `## Reconciliation` R11; and `## Registrations` corrections 2 and 3, item 14 and item 15, together with the "Not
registered" line.

- **SR-C3-7a (B5, CD-3).** "The per-choke good (switch-dead) state poset has no dead end below the top, every `d`." Hypothesis
  consumed: the definition of `X″`. Grade `proved_informal`, STATED. Attribution: C-T2-F. Origin: C-T2-F's critique §6 (F-12 /
  CD-3), which struck T2's unshipped "no dead end for `d = 1..8` (own exhaustive search)".
- **SR-C3-7b (B7).** "Verification lemma: a rational saturating flow implies (HALL-COND) for every `X`." Scope: a finite network.
  Grade `proved_informal`, STATED; a companion, no key. Attribution: C-U2-F, C-U2-T. Origin: C-U2-T finding 8 and C-U2-F Remaining
  obligation 1. Required on U2's face by the allocation, but absent there.
- **SR-C3-7c.**
  - **B8.** "`CB(1,m)`: every (S)-target of a root-plus-arm source has active weight 0, for any tag set." `proved_informal`,
    STATED; C-U2-T finding 5(i).
  - **B9.** "`CB(d,1)` whole-sector sums at `p = k + 1`: `2^k·C(d,k)` against `C(d,k−1)(2^{k−1} + k − 1)`", with `F_p` = all
    leaves. `proved_informal`, STATED; C-U2-T finding 5(ii), stated there for `2 ≤ k ≤ d`.
  - Item 15 files both into `R30-CB-RECORD` as records.
- **SR-C3-7d.** Correction 2 reads: "`E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT` scope note: holds at eligible ranks as
  registered; deficits exist at non-eligible ranks (four rows, E-f); the 'any rank' paraphrase is false."
  - E-f lists the rows `CBstar(1,1,2)/2`, `(1,2,2)/3`, `(2,1,2)/3` and `(1,1,3)/2`.
  - The struck paraphrase is U2's "`t ≥ 2`: the sector is never deletion-deficient at any rank".
  - I read the registered key in the registry snapshot `control/snapshots/CLAIM-IDENTITY.run-local.c3-stage2.json`: statement,
    scope, certificate and history.
- **SR-C3-7e (A2; R11).** Lemma U (U1's `exists_transportRel_iff`, compiled): `A ∈ I_p(G)` has an in-arc of (D) ∪ (S) iff `A` is not
  a maximal independent set, or some `u ∈ A` has non-adjacent `y ≠ z` with `N(y) ∩ A = N(z) ∩ A = {u}`.
  - I compared it with P10 as registered text: SR-REACH SR-11's registration text (member `second-reads/SR-REACH/SECOND-READ.md`),
    and the (HALL) key's scope notes in the snapshot (`[r30 C1; SR-REACH SR-14]`, `[r30 C2; SR-C2-4; Lemma U]`).
  - I also read SR-C2-4's Lemma U section (member `second-reads/SR-C2-4/SECOND-READ.md`).
- **SR-C3-7f (item 14).** "(NM): T1's Lemma 2.1 is (NM) on the leg poset (no new key); the poset half is compiled in scratch (no
  grade)."
  - A4 lists `down_card`, `up_card`, `rk_of_Rdel`, `shadow_degree_bound` on `Fin N → Option Bool` and the ratio form
    `critic_normalized_matching`. Attribution: C-U1-T and C-U1-F.
  - I read the (NM) key `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING` in the snapshot.

## Independent re-derivation

**Instrument** (`scratchpad/c3-sr-SR-C3-7/`; my own code; it imports no seat's or critic's module). `sr7_lib.py` provides:
- `CBstar(d,m,t)` builders (`t = 1` is `CB(d,m)`), with an `IsTree` test that checks acyclicity (union-find) and connectivity (BFS)
  separately;
- exhaustive bitmask enumeration of independent sets;
- `α`, and `x` scanned through rank `α` inclusive;
- `F_p` derived strictly from `Δ_p(T − v)` on the original tree;
- `S` computed from the `H_v`/`R_v` definition;
- the literal `w_F`, `W_v = N(s_v) ∖ {v}`;
- literal (D) and (S) targets, plus a separate pairwise `in_rel` predicate;
- an integral Dinic max-flow.

Every row asserts `supply − capacity = S` from independent sides (`row_data`) before anything else is reported. For a family `Y`,
the max-deficit routine returns `max_{X ⊆ Y}(Σ_X w − Σ_{N(X)} w) = Σ_Y w − maxflow`.

**Validation before trust** (`sr7_validate.py`):
- Contract fixed points reproduced:
  - `K_{1,12}/8`: 13/12/6, 12 favorable, 1980/3960/−1980;
  - path-star `(2,3,4)/7`: 15/11/5, 10 favorable, 1483/2701/−1218;
  - path-star `(2,2,4,3)/8`: 18/13/6, 12 favorable, 8033/13467/−5434.
- The eligible critic row `CBstar(2,2,2)/7` reproduced: 17/11/5, window `[7,7]`, 9 favorable (the leaf set), 2194/3888/−1694.
- Max-flow deficits equal exhaustive subfamily enumeration on 16 (row, relation) pairs, 16/16 agree.
- Critic rows reproduced: `CB(2,2)/4` sector 32 / deletion 24 / mixed 32; `CB(4,1)/4` whole layer, supply 60, deletion-only
  max-flow 52, mixed 60.

### SR-C3-7a (B5, CD-3)

**Setting, derived from the definitions.** In `CB(d,m)` (path `r–s–v`; chokes `u_i ~ r`; supports `b_ij ~ u_i`; private leaves
`c_ij ~ b_ij`), take a root-plus-arm sector member `B` (`r, v ∈ B`).
- Since `r ∈ B`, both `s ∉ B` and every `u_i ∉ B`.
- In branch `i`, the only edges among `{b_ij, c_ij}` are `b_ij c_ij`. So `B` is determined by branch states
  `σ_i ∈ {∅, S, L}^d` (coordinate `j`: neither, `b_ij`, or `c_ij`), with `|B| = 2 + Σ_i rk σ_i`.
- The (S)-arcs out of `B` are:
  - the switch at `s` (`N(s) = {r, v} ⊆ B`), target `(B ∖ {r, v}) ∪ {s}`;
  - the switch at `u_i` iff `#S(σ_i) = 1`, since `N(u_i) = {r} ∪ {b_ij}`.
- No other vertex outside `B` has two neighbours in `B`. Each `b_ij ∉ B` has neighbours `u_i ∉ B` and `c_ij`, and each `c_ij`
  has the single neighbour `b_ij`.
- Weights, from `W_v = {r}` and `W_{c_ij} = {u_i}`:
  - the `s`-target has weight 0, because `v` is absent and every choke is absent;
  - the `u_i`-target `(B ∖ {r, b_ij}) ∪ {u_i}` has `v` inactive, because `r` is gone. Its tags `c_ij′` with `σ_i(j′) = L` are active
    through `u_i`, and every other private tag is inactive. So its weight is `#L(σ_i)` whenever `F ⊇ P`, with `P` the private
    leaves.
- Hence, for `F ⊇ P`, **`B` is switch-dead (every (S)-target has weight 0) iff every `σ_i` is good**, where
  `good(σ) :⟺ ¬(#S(σ) = 1 ∧ #L(σ) ≥ 1)`. `X″` is exactly this family.

**The poset.** Order `{∅, S, L}^d` coordinatewise with `∅ < S` and `∅ < L`. This is inclusion of the branch's vertex set, graded by
`rk` = the number of nonempty coordinates, with top rank `d`. It is the product of `d` three-element V-posets.

**Proof (every `d ≥ 1`).** Let `σ` be good with `rk σ < d`, and pick an empty coordinate.
- If `#S = 0`, fill it with `L`. Still `#S = 0`, so the result is good.
- If `#S ≥ 2`, fill it with anything. Still `#S ≥ 2`, so the result is good.
- If `#S = 1`, goodness forces `#L = 0`. Fill it with `S`. Now `#S = 2`, so the result is good.

So no good state below the top rank is a dead end. ∎ Nothing about `m`, eligibility or `F` enters the poset statement. `F ⊇ P` enters
only the switch-dead reading.

- **Count.** A bad state has one `S` position and the other `d − 1` coordinates in `{∅, L}`, not all `∅`. So
  `|good| = 3^d − d(2^{d−1} − 1)`.
- **Dual (supplementary, not part of the statement).** Every good state of positive rank has a good lower cover:
  - `#S = 0`: drop an `L`;
  - `#S ≥ 3`: drop anything;
  - `#S = 2`: drop an `L` if there is one, else an `S`;
  - `#S = 1` (so `#L = 0`): drop the `S`.
- **Consequence at the sector level.** Every member of `X″` below the sector's top rank `2 + dm` is the (D)-image of a member of `X″`
  one rank up.

**Instrument** (`sr7_a.py`):
- **Abstract poset, `d = 1..12`.** Upward dead ends 0, downward dead ends 0, `|good|` equals the closed form, and CD-3's three-case
  rule is valid on every good state.
- **Literal network.** Ten small trees `CB(1,1)`, `(2,1)`, `(3,1)`, `(4,1)`, `(1,2)`, `(2,2)`, `(3,2)`, `(1,3)`, `(2,3)`, `(1,4)`, at
  every rank with `F` = leaf set: 1,776 sector sources in all.
  - "Every (S)-target has weight 0" ⟺ "every branch is good": 0 mismatches.
  - The `s`-switch target always has weight 0.
  - The `u_i`-target weight equals `#L(σ_i)`.

### SR-C3-7b (B7)

**Statement.** Let `G` be a finite simple graph, `p ∈ ℕ`, `F` a finite set of degree-one vertices and `w = w_F`. Any nonnegative
weights would do. Let `f : I_{p+1}(G) × I_p(G) → ℚ_{≥0}` satisfy:
- (i) `f(B, A) > 0 ⇒ transportRel G B A`;
- (ii) `Σ_A f(B, A) = w(B)` for every `B`;
- (iii) `Σ_B f(B, A) ≤ w(A)` for every `A`.

Then for every `X ⊆ I_{p+1}`: `Σ_{B∈X} w(B) ≤ Σ_{A∈N(X)} w(A)`.

**Proof.**
`Σ_{B∈X} w(B) = Σ_{B∈X} Σ_A f(B,A)` by (ii)
`= Σ_{B∈X} Σ_{A∈N(X)} f(B,A)` (a term with `A ∉ N(X)` has `f(B,A) = 0` by (i), since `B ∈ X`)
`≤ Σ_{A∈N(X)} Σ_{B∈I_{p+1}} f(B,A)` (adding terms `f ≥ 0`)
`≤ Σ_{A∈N(X)} w(A)` by (iii). ∎

Where the hypotheses enter:
- `f ≥ 0` enters at the enlargement step. Support on arcs enters at the restriction step.
- (ii) is used only as `≥`.
- There is no ℕ-subtraction, and no tree, eligibility or selector hypothesis. `ℚ` may be replaced by the nonnegative reals.
- The same proof gives the restricted form: if (ii) holds only for `B ∈ Y`, then the conclusion holds for every `X ⊆ Y`.

**Instrument** (`sr7_b.py`):
- 400 random finite networks with random nonnegative rational flows: 6,102 subfamilies, 0 violations.
- `CB(4,1)/4` (literal network; supply 60 = capacity 60; non-eligible):
  - a half-integral saturating flow (the average of two integral Dinic flows found in different arc orders; 54 non-integral arc
    values) is verified literally (support in (D) ∪ (S), exact source equalities, capacities);
  - 7,005 subfamilies checked (all singletons, all pairs, 3,000 seeded random families), 0 violations.
- **Necessity.** A network with one negative flow entry meets every source equality and every capacity while (HALL-COND) fails
  (`Σ_X = 2 > 1`). A flow placing positive mass off the arc set does the same. So both `f ≥ 0` and support on arcs are
  load-bearing.

**Companion placement (read from the registry snapshot).** C1-LA2 (`E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE`,
`formally_verified`) has the terminal theorem `aggregate_nonpos_of_weightedHall` (WeightedHall at `F = favorableLeaves G p` ⇒
`S ≤ 0`). Its face lists the compiled companion `weightedHall_of_saturatingFlow`, the ℕ-valued special case of B7, and
`exists_saturatingFlow_of_weightedHall`. So:
- B7 composed with C1-LA2's terminal theorem gives `S(G, p) ≤ 0` from any rational saturating flow at `F = F_p(G)`;
- B7 composed with `exists_saturatingFlow_of_weightedHall` gives an integral `IsSaturatingFlow`.

This is exactly the step a closed-form fractional certificate needs before any award. B7 is a companion, not a key. Its Lean form
needs a `ℚ`-valued flow predicate, which the frozen definitions do not contain (U adjudicator, Group U-C).

### SR-C3-7c (B8, B9)

**B8, proof.** In `CB(1,m)` (`m ≥ 1`), let `B ⊇ {r, v}`. Then `s ∉ B` and no choke is in `B`.
- The vertices outside `B` with exactly two neighbours in `B` are `s` (`N(s) = {r, v}`) and each `u_i` with `b_i ∈ B`
  (`N(u_i) = {r, b_i}`). No `b_i ∉ B` qualifies (`N(b_i) = {u_i, c_i}` with `u_i ∉ B`), and no `c_i` does.
- The target `(B ∖ {r, v}) ∪ {s}` contains no `v`, and each `c_j` in it is inactive because `W_{c_j} = {u_j}` is absent.
- The target `(B ∖ {r, b_i}) ∪ {u_i}` has `v` inactive, since `W_v = {r}` was removed. It has `c_i ∉ B` because `b_i ∈ B`, and each
  other `c_j` is inactive because `u_j` is absent.
- Both weights are 0 for `F` = leaf set. Since `w_F ≤ w_{leafSet}` pointwise for `F ⊆ leafSet`, they are 0 for every set `F` of
  original leaves. ∎
- Consequently, for every `X` in the sector, `Σ_{N_{(D)∪(S)}(X)} w_F = Σ_{N_D(X)} w_F`: the sector's (D) ∪ (S) Hall condition is its
  deletion-only condition.

**B8, instrument** (`sr7_c.py`). `CB(1,m)`, `m = 1..6`, every rank:
- 1,092 sector sources and 3,097 switch arcs; 0 positive-weight switch targets;
- the switch vertices seen are only `s` and chokes with their support present.

Supplement (`sr7_c2.py`, observation only, not for registration): on those trees the exact sector max deficit is the same under
(D) and under (D) ∪ (S) on all 27 rows. It equals the registered `CBstar` formula at `d = t = 1`,
`max(0, C(m,k)2^k − C(m,k−1)2^{k−1})`, on every row with `p ≥ 2`. No `CB(1,m)` row with `m ≤ 6` is eligible.

**B9, derivation.** Take `CB(d,1)` (one choke `u ~ r`, supports `b_j`, private leaves `c_j`), `F` = leaf set `{v, c_1..c_d}`, and
`p = k + 1` with `1 ≤ k ≤ d`.
- **Sources.** `{r, v}` ∪ (`k` coordinates, each `b` or `c`). There are `C(d,k)·2^k` of them, each of weight 1: `v` is active
  through `r`, and every `c_j` is inactive because `u` is absent. Supply `= 2^k·C(d,k)`.
- **Targets of positive weight**, whose total is `C(d,k−1)(2^{k−1} + k − 1)`:
  - (a) the in-sector deletions `{r, v} ∪ R′` with `k − 1` coordinates, each of weight 1. All `C(d,k−1)·2^{k−1}` of them are
    reached, because `k − 1 < d` leaves an empty coordinate to add;
  - (b) the `u`-switches from sources with `#S = 1`, target `{v, u} ∪ C′` with `C′` the other `k − 1` coordinates, all private
    leaves. Each has weight `k − 1`: every `c ∈ C′` is active through `u`, and `v` is inactive. There are `C(d,k−1)` distinct
    targets, each reached because some coordinate outside `C′` is free (`k − 1 < d`).
- **Every other target has weight 0**: `B ∖ {r}`, `B ∖ {v}`, and the `s`-switch.

The range matters. At `k = d + 1` the sector is empty (supply 0), but `C(d,d)(2^d + d) > 0`, so the second formula is false there.

**B9, instrument** (`sr7_c.py`). `CB(d,1)`, `d = 1..6`, every `k = 0..d+1`, literal (D) ∪ (S), `F` = leaf set:
- **Match.** Both formulas match on all 21 rows with `1 ≤ k ≤ d`; the second fails on all 6 rows with `k = d + 1`.
- **Selector.** The derived `F_p` equals the leaf set on 13 of the 21 rows: `(d,k)` = `(1,1)`, `(2,1)`, `(2,2)`, `(3,2)`,
  `(3,3)`, `(4,3)`, `(4,4)`, `(5,3)`, `(5,4)`, `(5,5)`, `(6,4)`, `(6,5)`, `(6,6)`. On the others `F_p` is empty (for example
  `CB(3,1)/2`).
- **Eligibility.** No `CB(d,1)` row with `d ≤ 6` is eligible (for example `CB(6,1)`: `x = 5`, `α = 8`, window `[7,5]`).
- **Deficits.** E-f's whole-sector (D) ∪ (S) sums are reproduced: `CB(3,1)/3` 12 vs 9, `CB(5,1)/4` 80 vs 60, `CB(6,1)/5` 240 vs
  220. The exact max mixed deficits are 3, 20 and 25; for `CB(6,1)/5` the maximum is attained by a proper subfamily.

### SR-C3-7d (the `CBstar` paraphrase)

**The registered key, read exactly.**
- The exact-deficit formula is stated for every `p ≥ 2`, including non-eligible ranks: `max(0, C(M,k)(t+1)^k − C(M,k−1)(t+1)^{k−1})`,
  `k = p − 1`, `M = dm`. A deficient subfamily exists iff `(t+2)(p−1) < (t+1)(dm+1)`.
- The non-deficiency corollary for `t ≥ 2` is stated for `x(T) + 2 ≤ p`, a range that contains every eligible rank.
- Its scope already says "every positive value occurs at a non-eligible rank for `t ≥ 2`".
- The key never says "never deletion-deficient at any rank". That wording is U2's.

**Brute force** (`sr7_d.py`; `F` = leaf set as in the key; full row data with WID asserted; the deletion shadow `N_D` includes the
out-of-sector `B ∖ {r}` and `B ∖ {v}`):

| Row | n / α / x / window | `F_p` (derived) | supply / capacity / `S` | sector size | Σ sector `w` | Σ `N_D(sec)` `w` | max deficit, (D) | key formula | max deficit, (D) ∪ (S) |
|---|---|---|---|---|---|---|---|---|---|
| `CBstar(1,1,2)/2` | 7 / 4 / 2 / [4,2] non-eligible | leaf set (3) | 15 / 5 / +10 | 3 | 3 | 1 (only `{r,v}`) | **2** | 2 | 2 |
| `CBstar(1,2,2)/3` | 11 / 7 / 3 / [5,4] non-eligible | leaf set (5) | 139 / 62 / +77 | 11 | 15 | 14 | **3** | 3 | 3 |
| `CBstar(2,1,2)/3` | 10 / 6 / 3 / [5,4] non-eligible | leaf set (5) | 91 / 50 / +41 | 11 | 15 | 14 | **3** | 3 | 0 |
| `CBstar(1,1,3)/2` | 8 / 5 / 3 / [5,3] non-eligible | leaf set (4) | 37 / 10 / +27 | 4 | 4 | 1 (only `{r,v}`) | **3** | 3 | 3 |

- All four rows have `p < x(T) + 2`, below the corollary's scope, and the key's formula predicts each deficit exactly.
- At the two `p = 3` rows the whole sector falls short by only 1 (15 vs 14). The value 3 is the maximum over subfamilies, attained
  by the weight-one family `R1_k` of the key's proof: 9 of the 11 sector members, with deletion deficit exactly 3
  (`sr7_d2.py`). At the two `p = 2` rows `R1_k` is the whole sector, with deficits 2 and 3.
- Three of the four rows remain sector-deficient even under (D) ∪ (S). They are non-eligible and are not cuts.

**Sweep** (`sr7_d.py`): every `CBstar(d,m,t)` with `t ∈ {2,3}`, `n ≤ 21`, at every `p ≥ 2` with a nonempty sector.
- 113 rows; 0 mismatches between the exact deletion-only max deficit and the key's formula.
- 39 rows have a positive deficit; all 39 have `p < x + 2` and are non-eligible.
- 8 eligible rows, all with deficit 0 (for example `CBstar(2,2,2)/7`, `CBstar(1,4,2)/8`, `CBstar(2,2,3)/9,10`).

The four E-f rows are therefore examples, not the list.

### SR-C3-7e (P10 / Lemma U)

**Lemma U, as quoted on U1's face.**

```text
theorem exists_transportRel_iff (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) (A : Finset V)
    (hA : A ∈ indepFamily G p) :
    (∃ B ∈ indepFamily G (p + 1), transportRel G B A) ↔
      (∃ q, q ∉ A ∧ G.IsIndepSet ((insert q A : Finset V) : Set V)) ∨
      (∃ u ∈ A, ∃ y z, y ≠ z ∧ ¬ G.Adj y z ∧
        G.neighborFinset y ∩ A = {u} ∧ G.neighborFinset z ∩ A = {u})
```

**P10, as registered (SR-REACH SR-11 text).** "On every finite simple graph `G` and every `p ≥ 0`, an independent `p`-set `A` has no
in-arc of (D) ∪ (S) (no `B ∈ I_{p+1}(G)` with `transportRel G B A`) iff (i) `A` is a maximal independent set and (ii) no `u ∈ A` has
two non-adjacent private neighbours relative to `A` (vertices `w ∉ A` with `N(w) ∩ A = {u}`)."

**Comparison, clause by clause.**
- Left sides: "has an in-arc" versus "has no in-arc", over the same `B ∈ I_{p+1}` and the same frozen `transportRel`.
- First right-hand clause: `∃ q ∉ A, IsIndepSet (insert q A)` is "`A` is not maximal", since `A` is independent by `hA`.
- Second clause: `N(y) ∩ A = {u}` is exactly "`y` is a private neighbour of `u` relative to `A`":
  - it gives `y ~ u`;
  - it forces `y ∉ A`, because a `y ∈ A` adjacent to `u ∈ A` would contradict independence;
  - `y ≠ z` and `¬Adj y z` are P10's "two non-adjacent".
- Scope: both hold on every finite simple graph (the `Fintype`, `DecidableEq` and `DecidableRel` instances are decidability, not
  restrictions) and at every `p ≥ 0`. The ℕ `p − 1` inside the proof is guarded by `u ∈ A` (C-U1-T A4).

**So Lemma U is exactly P10 by negation. Nothing is added, dropped or rescoped.**

**Instrument** (`sr7_e.py`). Three predicates per target: the literal in-arc scan, the Lean right-hand side, and P10's no-in-arc
predicate. They must satisfy `REACH = LEANU = ¬P10NO`.
- Every labelled simple graph with `n ≤ 6` (33,867 graphs): 578,153 targets, 100,570 with no in-arc, 0 mismatches.
- 3,000 seeded random graphs with `n = 7, 8`: 135,267 targets, 10,424 with no in-arc, 0 mismatches.
- `N(y) ∩ A = {u}` coincided with "`y ∉ A` and `N(y) ∩ A = {u}`" on every instance (asserted in the code).

The count 578,153 agrees with C-U1-F, C-U1-T and SR-C2-4.

**Registry facts (snapshot, a member).**
- P10 has no key of its own. No claim in either registry (443 run-local, 434 master) has a P10-type statement. The SR-11 fallback
  predicate name `E993-R30-TRANSPORT-TARGET-NO-IN-ARC-IFF-MAXIMAL-WITHOUT-NONADJACENT-PRIVATE-PAIR` is not registered.
- P10 appears as registered text in two places:
  - inside the (HALL) key's scope notes (`[r30 C1; SR-REACH SR-14]` "P10–P12, B-b"; `[r30 C2; SR-C2-4; Lemma U]`);
  - as a named proof input of `E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO`
    (`proved_informal`): "A_k is the unique no-in-arc target … (P10 / Lemma U case analysis)".
- The clause `[r30 C2; SR-C2-4; Lemma U]` already records "Lemma U (C-F2-U; C-F2-T F-7) is P10 (SR-REACH SR-11) by negation … No
  separate key or grade".
- U1's quotations of SR-C2-4 are accurate:
  - "Lemma U is its negation, word for word … P10 restated, not a new lemma";
  - "It is not a new lemma, and it needs no key or grade of its own" (SR-C2-4b repair 1).

### SR-C3-7f ((NM) note)

The A4 statements as quoted on C-U1-T's face: on `Fin N → Option Bool` with `Rdel f g := ∃ i, f i ≠ none ∧ g = update f i none`,
- `down_card`: `#{g | Rdel f g} = rk f`;
- `up_card`: `#{f | Rdel f g} = 2·(N − rk g)`;
- `rk_of_Rdel`: `rk g + 1 = rk f`;
- `shadow_degree_bound`: `|X|·k ≤ |∂X|·2(N+1−k)` for `X` in rank `k`.

**Reading.**
- This is the registered (NM) inequality `k·|X| ≤ 2(N − k + 1)·|∂_Q X|`, read on the abstract rank-graded `{∅, b, c}^N`, which is
  the independent-set poset of an induced matching of `N` edges.
- **ℕ-subtraction.** `N − rk g` never truncates, since `rk g ≤ N`. `N + 1 − k` equals the integer `N − k + 1` for `k ≤ N + 1`, and
  every nonempty rank-`k` layer has `k ≤ N`. Both sides are 0 on an empty layer. This matches the registered key's note "(For
  `k > N` the family is empty; the ℕ form needs no guard.)".

**Instrument** (`sr7_f.py`), `N = 1..6`:
- `down_card`, `up_card` and `rk_of_Rdel` hold on every state;
- the bound holds in both the ℕ form and the registered form on every layer and 200 random subfamilies per layer, with 0
  violations;
- equality holds at every whole layer.

**Open, per the U adjudication (Group U-C) and C-U1-F.** Three nodes remain unformalized:
- (N1) the graph encoding;
- (N2) the sector correspondence, including weight identically one on the sector;
- (N3) the binder diff against the registered text.

So A4 is the abstract-poset half only, and the (NM) statement has no Lean text.

**T1's Lemma 2.1.** Its text is not in my capsule. The capsule records the identification "Lemma 2.1 = the registered NM inequality
on the leg poset" as C-T1-U's finding, adopted by the controller's reading (CF6-T1, CF6-T4) and by the synthesis (item 14; rejection
of `…-TERNARY-LEG-LATTICE-SHADOW-THRESHOLD` "an alias of (NM)"). I did not re-derive that identification, and the registration text
below carries it at that attribution only.

What I can say from the (NM) text alone: any "shadow threshold" statement on this poset follows from (NM) in degree form.
- `|∂X| ≥ |X|` for every rank-`k` family `X` whenever `k ≤ 2(N − k + 1)`, that is `3k ≤ 2N + 2`.
- Equality at the whole layer makes the threshold sharp: `|∂L_k| = |L_{k−1}| < |L_k|` when `3k > 2N + 2`.

This is my derivation, offered as context, not as a reading of T1's text.

## Findings and repairs

**7a.**
- (i) The statement needs the explicit definition `good(σ) :⟺ ¬(#S(σ) = 1 ∧ #L(σ) ≥ 1)` on its face. The synthesis row names only
  "the definition of `X″`".
- (ii) The reading "good = switch-dead" needs `F ⊇ P`, with `P` the private leaves (for example `F` = leaf set), and `t = 1`.
  - If a branch's private leaves are not tags, its bad states are also switch-dead.
  - For `t ≥ 2` a support with two present leaves admits a further switch.
  - The poset statement itself needs no `F`.
- (iii) "Dead end" means upward, toward the top rank `d`. The downward dual also holds and is recorded as supplementary.
- (iv) T2's "exhaustive search `d = 1..8`" stays struck as a computation (C-T2-F F-12). The fact is now proved for every `d` and
  checked to `d = 12`.
- Attribution: the definition of `X″` and the count `g_d` are T2's (Claude Sonnet 5); the proof is C-T2-F's (Claude Opus 5.5).
- Grade `proved_informal`; a record, not a key. It says nothing about Hall, (HALL) or a cut.

**7b.**
- No defect. The statement, hypotheses and proof are correct, and the two critics' faces agree.
- The integral special case is already a compiled companion on C1-LA2's face (`weightedHall_of_saturatingFlow`). B7 extends it to
  `ℚ_{≥0}` (indeed `ℝ_{≥0}`).
- Confirmed as a companion for any future certificate award: composed with C1-LA2 it gives `S ≤ 0`, and composed with
  `exists_saturatingFlow_of_weightedHall` it gives an integral flow.
- Remark only, not a ruling on SR-C3-3's statement: the restricted form (source equality on `Y`, conclusion for `X ⊆ Y`) is the form
  a subfamily certificate uses.
- No key; no certificate of its own (R29-N-12).

**7c.**
- **B8 repairs.**
  - Replace "for any tag set" by "for every set `F` of original leaves (`F ⊆ {v, c_1, …, c_m}`)". `w_F` is defined only for
    degree-one tags.
  - State `m ≥ 1` and "every rank" on the face.
- **B9 repairs.**
  - Add the range `1 ≤ k ≤ d`. It is load-bearing: the second formula is false at `k = d + 1`. The synthesis face omits the range;
    C-U2-T's face had `2 ≤ k ≤ d`, and `k = 1` also holds.
  - Name the relation, (D) ∪ (S), and the tag set, `F` = leaf set, on the face.
  - Read "`F_p` = all leaves" as the condition for using the sums as the rank-`p` network's sums. It is derived per row, and holds on
    13 of the 21 rows with `d ≤ 6`.
- **Status.** Both B8 and B9 are records under item 15 (`R30-CB-RECORD`), not keys: confirmed. Both concern non-eligible rows only
  (none of `CB(1,m)`, `m ≤ 6`, or `CB(d,1)`, `d ≤ 6`, has an eligible rank). Neither is a cut, and neither is evidence about (HALL).

**7d.**
- **The correction is right in substance.** The paraphrase "`t ≥ 2`: never deletion-deficient at any rank" is false, and the four
  rows are reproduced exactly.
- **Repair to its wording.** "Holds at eligible ranks as registered" understates the registered key.
  - Its exact formula is registered at every `p ≥ 2` and is correct at all four deficient rows, where it predicts them.
  - Its corollary is registered at `x(T) + 2 ≤ p`.
  - The controller fact CF6-T2 ("the registered CBstar key holds at eligible ranks only") and the U adjudication's "(eligible
    ranks)" should not be carried into the scope note. They could be read as saying the formula fails elsewhere.
- **Further repairs.**
  - The deficits 2/3/3/3 are subfamily maxima. At `(1,2,2)/3` and `(2,1,2)/3` the whole-sector shortfall is 1.
  - The four rows are examples, not an exhaustive list (39 positive rows in my `n ≤ 21` sweep).
- **Unchanged.** The key's statement, grade and fences are not changed.

**7e.**
- **Ruling: Lemma U is exactly P10 by negation.** It is an alias of an item that has registry text but no key: a component of the
  (HALL) scope note and a proof input of the `G_k` key.
  - It certifies no registered key. It does not raise P10's grade (`proved_informal`) or the `G_k` key's grade: the key also rests
    on the informal uniqueness case analysis, Lemma F and the other inputs.
  - R11's reservation ("the alias claim carries no weight until a second read settles it") is settled. SR-C2-4 ruled the alias in
    Cycle 2, and the registry already carries it.
  - The U adjudicator and the synthesis lacked those two members, so this was staleness, not a conflict.
- **Attribution repair to A2.** Lemma U is not U1's mathematics.
  - The statement is P10's (F2 tree form; C-F2-T complete proof and general form; C-F2-U triangle-free form; SR-REACH), restated as
    Lemma U by C-F2-U and C-F2-T F-7 (Cycle 2) and confirmed by SR-C2-4.
  - U1 (Claude Sonnet 5) authored the Lean text. C-U1-F, C-U1-T and the U adjudicator rebuilt it.
- **The Lean text of record** is `E993Transport.exists_transportRel_iff` in `U1-Main.lean` (`f3b21020…b180`). It stays `compiled`,
  with no grade and no key. A governed award, if ever made, is at the controller's discretion and would still create no key.

**7f.**
- **Confirmed.** The A4 half: four abstract-poset facts, kernel-checked in scratch, no grade, abstract only, with (N1)–(N3) open.
- **Repair: attribution.** The "Lemma 2.1 is (NM) on the leg poset" identification must travel as the T orientation's (C-T1-U; T
  adjudicator; synthesis item 14). This read did not have T1's text.
- **Repair: A4 composition.** The note should list A4's actual composition: C-U1-T's four declarations plus C-U1-F's
  `critic_normalized_matching`. It should also say that U1's `regular_bipartite_shadow_bound` restates Mathlib's
  `Finset.card_mul_le_card_mul` and is not part of (NM).
- **No new key**, and no change to (NM)'s statement or grade.

**Batch-wide checks.**
- **Predicate names.** No key is proposed in this batch, so the predicate-name check applies only negatively: no scope note below
  asserts more than its statement.
- **Fences.** Nothing here is (HALL), (HALL-COND) on an eligible row, or a (CUT). No status transfers. The primary aggregate,
  `E993-R23-ORDINARY-FAVORABLE-LEAF-AGGREGATE`, TREE, FOREST, TRANSFER, `E993-BETA-AGG` and Erdős #993 are untouched.
  - B8's deletion-only equality is a statement about the r30 active-weight sector on one family. It is not
    `E993-R23-LITERAL-DELETE-ONLY-HALL` (different weight, demand and relation), and it proposes no mechanism.
  - No census value enters a proof.
- **Mechanism attribution.** The mechanism (active-tag weight and relation) is Codex's (GPT-6), from the lower-region run. The
  definition layer is the first-interior run's (entries 1–18) and C1-LA1's.

## Registration text

Each block is to be registered verbatim if the controller registers the item. Ledger row ids marked "proposed" are for the
controller to assign.

```text
RECORD: R30-C3-B5-CB-GOOD-STATE-POSET (proposed id)
CLAIM: [CD-3] Let d, m >= 1 and T = CB(d,m) (path r-s-v; chokes u_i ~ r; supports b_ij ~ u_i; one private leaf c_ij ~ b_ij).
For a root-plus-arm sector member B (r, v in B; hence s and every u_i are absent) write the branch state of u_i as
sigma_i in {empty, S, L}^d (coordinate j: neither, b_ij in B, c_ij in B), and call sigma good iff NOT (#S(sigma) = 1
and #L(sigma) >= 1). Order {empty, S, L}^d coordinatewise with empty < S and empty < L (inclusion of the branch's vertex set;
rank = number of nonempty coordinates; top rank d). Then for every d >= 1 every good state of rank < d has a good upper cover
(#S = 0: add an L; #S >= 2: add anything; #S = 1, hence #L = 0: add an S); there are 3^d - d(2^(d-1) - 1) good states.
Switch-dead reading (t = 1 and F containing every private leaf, e.g. F = leafSet(T)): the (S)-arcs out of B are the switch at
s (target weight 0) and, for each i with #S(sigma_i) = 1, the switch at u_i with target (B minus {r, b_ij}) union {u_i} of
weight #L(sigma_i); so B has no (S)-arc to a positive-weight target iff every sigma_i is good, and X'' (the switch-dead sector
members) is exactly the all-good family. Consequently every member of X'' below the sector's top rank 2 + dm is the deletion image of a
member of X'' one rank up.
STATUS: proved_informal (critic-derived; STATED at Stage 4; confirmed by isolated second read SR-C3-7); a record, not a key.
T2's "no dead end for d = 1..8 (own exhaustive search)" stays struck as a computation (unshipped; C-T2-F F-12). Bounded
corroboration, not proof: the abstract poset for d = 1..12 (0 dead ends; count formula exact); literal (D) u (S) on
CB(1,1), (2,1), (3,1), (4,1), (1,2), (2,2), (3,2), (1,3), (2,3), (1,4), every rank, F = leafSet, 1,776 sector sources:
switch-dead <=> all-good, 0 mismatches. Fences: a structural fact about one source family of one tree family; no Hall content;
not (HALL), not a cut, no status transfer; the primary aggregate is untouched.
PROVENANCE: r30 Cycle 3 T2 (Claude Sonnet 5): the family X'' and the count g_d; C-T2-F (Claude Opus 5.5): the proof (CD-3) and
the strike; isolated second read SR-C3-7 (Claude Opus 5.5): re-derivation, the explicit good predicate and the F-hypothesis of the
switch-dead reading. Transport network, active-tag weight and relation: Codex (GPT-6), lower-region run.
```

```text
RECORD: R30-C3-B7-RATIONAL-FLOW-VERIFICATION-LEMMA (proposed id)
CLAIM: Let G be a finite simple graph, p a natural number, F a finite set of degree-one vertices, and
f : I_{p+1}(G) x I_p(G) -> Q_{>=0} with (i) f(B, A) > 0 only if transportRel G B A, (ii) sum_A f(B, A) = w_F(B) for every
B in I_{p+1}(G), (iii) sum_B f(B, A) <= w_F(A) for every A in I_p(G). Then for every X subset of I_{p+1}(G):
sum_{B in X} w_F(B) <= sum_{A in N(X)} w_F(A), N(X) the targets joined to X by (D) union (S). Proof:
sum_X w = sum_{B in X} sum_{A in N(X)} f(B, A) (by (ii), and (i) kills A outside N(X)) <= sum_{A in N(X)} sum_B f(B, A)
(f >= 0) <= sum_{A in N(X)} w_F(A) (by (iii)). The same proof gives the conclusion for every X subset of Y when (ii) is
assumed only for B in Y; (ii) is used only as >=; Q may be replaced by the nonnegative reals; no tree, eligibility or selector
hypothesis; no natural-number subtraction. Both f >= 0 and support on arcs are load-bearing (explicit counterexamples, SR-C3-7).
STATUS: proved_informal (critic-derived; STATED at Stage 4; confirmed by isolated second read SR-C3-7); a companion for any
future certificate award, with no key and no certificate of its own (R29-N-12). Its natural-valued special case is the compiled
companion weightedHall_of_saturatingFlow on the face of C1-LA2 (E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE,
formally_verified); composed with that award's terminal theorem aggregate_nonpos_of_weightedHall at F = F_p(G) it yields
S(G, p) <= 0, and with exists_saturatingFlow_of_weightedHall an integral saturating flow. A Lean form needs a Q-valued flow
predicate, which the frozen definitions do not contain. Fences: a certificate check, not (HALL) and not evidence for it.
PROVENANCE: C-U2-F and C-U2-T (Claude Opus 5.5), independently, supplying the lemma the r30 Cycle 3 allocation required on route
U2's face (absent there); U adjudicator (proof read); isolated second read SR-C3-7. Network, weight and relation: Codex (GPT-6),
lower-region run; definitions of record: C1-LA1.
```

```text
RECORD: R30-CB-RECORD (Cycle 3 entry B8)
CLAIM: On CB(1,m), m >= 1 (path r-s-v; chokes u_i ~ r; one support b_i ~ u_i with one private leaf c_i ~ b_i), for every set F
of original leaves (F subset of {v, c_1, ..., c_m}) and at every rank, every (S)-target of every root-plus-arm source B
(r, v in B) has active weight 0. The (S)-arcs out of such B are exactly the switch at s, target (B minus {r, v}) union {s}, and
the switch at u_i for each b_i in B, target (B minus {r, b_i}) union {u_i}. In the first, v is absent and every private tag's
only witness u_i is absent. In the second, v's only witness r is removed, c_i is absent because b_i is in B, and every other
private tag's witness is absent. Consequently, for every X in the sector, the (D) union (S) neighbourhood weight equals the
deletion-only neighbourhood weight: the sector's (D) union (S) Hall condition is its deletion-only condition.
STATUS: proved_informal (critic-derived; STATED at Stage 4; confirmed by isolated second read SR-C3-7); a record, not a key.
Bounded corroboration: CB(1,m), m = 1..6, every rank, 1,092 sector sources, 3,097 switch arcs, 0 positive-weight switch targets.
No CB(1,m) row with m <= 6 is eligible. Fences: a sector statement on one family, not (HALL) and not a cut; not
E993-R23-LITERAL-DELETE-ONLY-HALL (a different weight, demand and relation; no mechanism is proposed); a switch rescue of the
sector off the eligibility window is not uniform, so any successor switch lemma must carry eligibility and derived F_p.
PROVENANCE: C-U2-T (Claude Opus 5.5), finding 5(i); U adjudicator (replay); isolated second read SR-C3-7. Network, weight and
relation: Codex (GPT-6), lower-region run.
```

```text
RECORD: R30-CB-RECORD (Cycle 3 entry B9)
CLAIM: On CB(d,1), d >= 1 (one choke u ~ r carrying d supports b_j, each with one private leaf c_j), with tag set
F = leafSet(T) = {v, c_1, ..., c_d}, at rank p = k + 1 with 1 <= k <= d, the root-plus-arm sector
sec = {B in I_{p+1} : r, v in B} and its (D) union (S) neighbourhood N(sec) in I_p satisfy
sum_{sec} w_F = 2^k * C(d,k) and sum_{N(sec)} w_F = C(d,k-1) * (2^(k-1) + k - 1). The sources are the C(d,k)*2^k sets
{r, v} plus k coordinates (each b_j or c_j), each of weight 1 (v active through r; private tags inactive because u is absent).
The positive-weight targets are the C(d,k-1)*2^(k-1) in-sector deletions {r, v} plus k-1 coordinates, each of weight 1, and the
C(d,k-1) choke switches {v, u} plus k-1 private leaves, each of weight k-1 (each such leaf active through u; v inactive). Every
other target (B minus {r}, B minus {v}, the switch at s) has weight 0. The range 1 <= k <= d is load-bearing: at k = d + 1 the
sector is empty while the second expression is positive. Using the two sums as the rank-p network's sums requires
F_p(T) = leafSet(T), derived row by row.
STATUS: proved_informal (critic-derived; STATED at Stage 4; confirmed by isolated second read SR-C3-7); a record, not a key.
Bounded corroboration: literal brute force on CB(d,1), d = 1..6, every 1 <= k <= d (21 of 21 rows match; the second formula
fails on all 6 rows with k = d + 1); F_p = leafSet on 13 of the 21 rows; no CB(d,1) row with d <= 6 is eligible. Whole-sector
(D) union (S) shortfalls occur at CB(3,1)/3 (12 vs 9), CB(5,1)/4 (80 vs 60) and CB(6,1)/5 (240 vs 220), all non-eligible, none
a cut. Fences: a sector statement on one family at non-eligible rows; not (HALL), not a cut, no status transfer.
PROVENANCE: C-U2-T (Claude Opus 5.5), finding 5(ii) (stated there for 2 <= k <= d); U adjudicator (15-row replay); isolated
second read SR-C3-7 (derivation of the target classes; range 1 <= k <= d; relation and tag set on the face). Network, weight and
relation: Codex (GPT-6), lower-region run.
```

```text
SCOPE NOTE ON: E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT
TEXT: [r30 C3; SR-C3-7] Scope clarification; the statement, grade and fences are unchanged. The key's exact formula
max(0, C(M,k)(t+1)^k - C(M,k-1)(t+1)^(k-1)) is registered for every p >= 2, non-eligible ranks included, and its t >= 2
non-deficiency corollary is registered only for x(T) + 2 <= p (a range containing every eligible rank). For t >= 2 the key
therefore does not say that the sector is never deletion-deficient at any rank. Its own formula gives positive deficits at
some ranks below x(T) + 2, and the paraphrase "t >= 2: the sector is never deletion-deficient at any rank" (r30 Cycle 3 route
U2) is false. Examples, with F = leafSet(T) (equal to the derived F_p(T) on each row) and the deficit taken as the maximum over
sector subfamilies of sum_X w_F - sum_{N_D(X)} w_F (exact max-flow, equal to the key's formula):
CBstar(1,1,2), p = 2: deficit 2 (n 7, alpha 4, x 2);
CBstar(1,2,2), p = 3: deficit 3 (n 11, alpha 7, x 3);
CBstar(2,1,2), p = 3: deficit 3 (n 10, alpha 6, x 3);
CBstar(1,1,3), p = 2: deficit 3 (n 8, alpha 5, x 3).
Each of the four rows is non-eligible with p < x(T) + 2. The whole-sector shortfalls are 3 - 1, 15 - 14, 15 - 14 and 4 - 1, so
at the two p = 3 rows the maximum is attained by a proper subfamily, the weight-one family R1_k of the key's proof. The list is
not exhaustive: every CBstar(d,m,t) with t in {2,3} and n <= 21 gives 113 rows with 0 mismatches against the formula, 39 with a
positive deficit, all at p < x(T) + 2 and all non-eligible (bounded_computation). Nothing here is a cut, a (HALL) statement, or
evidence about S(T, p).
Attribution: C-U2-T (Claude Opus 5.5; the four rows by exact max-flow); C-U2-F (Claude Opus 5.5; the paraphrase strike); U
adjudicator (replay); controller replay CF-REPLAY-c3b; isolated second read SR-C3-7 (recomputation; the scope clarification);
the struck paraphrase is route U2's (Claude Sonnet 5).
```

```text
SCOPE NOTE ON: E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL
TEXT: [r30 C3; SR-C3-7; Lemma U Lean text] Lean text of record for P10 (SR-REACH SR-11; restated as Lemma U in the clause
[r30 C2; SR-C2-4; Lemma U] of this scope note):
theorem E993Transport.exists_transportRel_iff (G : SimpleGraph V) [DecidableRel G.Adj] (p : ℕ) (A : Finset V)
(hA : A ∈ indepFamily G p) : (∃ B ∈ indepFamily G (p + 1), transportRel G B A) ↔
(∃ q, q ∉ A ∧ G.IsIndepSet ((insert q A : Finset V) : Set V)) ∨ (∃ u ∈ A, ∃ y z, y ≠ z ∧ ¬ G.Adj y z ∧
G.neighborFinset y ∩ A = {u} ∧ G.neighborFinset z ∩ A = {u}).
It sits in r30 Cycle 3 route U1's Main.lean (SHA-256 f3b21020433375b01e1bcdd89d8996dd2198ad2ac438557bda8774b73a57b180, 2851
lines; frozen carry sources/c3-stage7-sources/U1-Main.lean), on C1-LA1's frozen definitions, with axioms exactly propext,
Classical.choice and Quot.sound. It is P10 by negation, exactly: the same graphs (every finite simple graph), the same ranks
(every p >= 0) and the same relation (transportRel = (D) union (S)). N(y) ∩ A = {u} is P10's "private neighbour of u": it
forces y ~ u and y not in A.
Status: compiled (kernel-checked in scratch; no governed award; no grade above compiled). No key. It certifies no registered
key. P10 remains a proved_informal component of this scope note and a proof input of
E993-R30-GK-TREE-K-GE-3-AT-RANK-K-PLUS-3-ELIGIBLE-UNIQUE-NO-IN-ARC-TARGET-ACTIVE-WEIGHT-TWO; neither grade changes.
Attribution:
- statement: P10 by r30 Cycle 1 F2 (tree form; Claude Sonnet 5), C-F2-T (complete proof, general form) and C-F2-U (triangle-free
  form; Claude Opus 5.5), confirmed by SR-REACH; restated as Lemma U by r30 Cycle 2 C-F2-U and C-F2-T (F-7), confirmed by
  SR-C2-4;
- Lean text: r30 Cycle 3 U1 (Claude Sonnet 5);
- kernel rebuilds: C-U1-F and C-U1-T (Claude Opus 5.5) and the U adjudicator;
- relation: Codex (GPT-6), lower-region run;
- definitions of record: C1-LA1 and the first-interior run (entries 1-18).
Bounded corroboration of the statement's meaning, not proof: 0 mismatches against the literal in-arc scan on all 578,153
targets over every labelled simple graph with n <= 6 (C-U1-F, C-U1-T, SR-C2-4, SR-C3-7).
Fences: a structural fact about the (HALL) network; no sign content; not a cut; moves no key; the primary aggregate is
untouched.
```

```text
SCOPE NOTE ON: E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING
TEXT: [r30 C3; SR-C3-7] (a) Lemma 2.1 of r30 Cycle 3 route T1 (Claude Sonnet 5), which was proposed as
E993-R30-TERNARY-LEG-LATTICE-SHADOW-THRESHOLD, was identified by the Cycle 3 T review (C-T1-U; T adjudicator; synthesis item 14)
as this key's inequality read on the leg poset: the independent sets of the sector's induced matching of N = dm edges
{b_ij, c_ij}, i.e. {empty, b, c}^N graded by rank, on which every root-plus-arm sector member has active weight exactly one.
No new key. The isolated second read SR-C3-7 did not have T1's text; the identification is recorded at the T review's
attribution only. In degree form this key gives |dX| >= |X| for every rank-k family whenever 3k <= 2N + 2, and whole-layer
equality makes that threshold sharp.
(b) The poset half is compiled in scratch, with no grade and no award, on Fin N -> Option Bool with
Rdel f g := ∃ i, f i ≠ none ∧ g = update f i none:
- down_card (down-degree = rank);
- up_card (up-degree = 2·(N - rank));
- rk_of_Rdel;
- shadow_degree_bound (|X|·k <= |dX|·2(N+1-k) for X in rank k; N+1-k in ℕ equals the integer N-k+1 on every nonempty layer);
these four are by C-U1-T (Claude Opus 5.5), CritNM.lean, SHA-256
19883e92e6a5c4b89442e57cbe2f93560580bee4138bbb5c7c9288f5226ca694. The ratio form critic_normalized_matching is by C-U1-F (Claude
Opus 5.5), CriticNM.lean, SHA-256 82afd1a241146db41512b36d66a688b3c2a4739c5ca4dfb121b8882f6c70bf18. The U adjudicator rebuilt
both; axioms are exactly propext, Classical.choice and Quot.sound.
This is the abstract-poset content only. Three pieces are not formalized: the graph encoding (N1), the sector correspondence
(N2) and a binder diff against this key's statement (N3). This key's statement therefore has no Lean text and stays
proved_informal. U1's regular_bipartite_shadow_bound restates Mathlib's Finset.card_mul_le_card_mul; it is not part of this key
and is not a run key. The statement, grade and fences are unchanged.
```

## Verdicts

verdict[SR-C3-7a]: confirmed_with_repairs
verdict[SR-C3-7b]: confirmed
verdict[SR-C3-7c]: confirmed_with_repairs
verdict[SR-C3-7d]: confirmed_with_repairs
verdict[SR-C3-7e]: confirmed_with_repairs
verdict[SR-C3-7f]: confirmed_with_repairs

Ruling for 7e: Lemma U **is exactly P10 by negation**. It is an alias of an item with registry text but no key, and it certifies no
key (R11 upheld and settled). The repair is to A2's attribution.

Records, not keys: B5, B7 (a companion), B8 and B9 (`R30-CB-RECORD`, item 15). Confirmed.

chartered opus/high; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-sr-SR-C3-7/`. Standard
library only, exact integers (`fractions` in `sr7_b.py`), `python3 -B`, no `__pycache__`, no background job.

| File | SHA-256 | Purpose |
|---|---|---|
| `sr7_lib.py` | `9c3f5fc2c4770d785a8383c45e656780e3785ed40ef1bb5c77a417cc54573755` | own instrument: `CBstar`/`CB` builders, `IsTree`, independent sets, `α`, `x` through `α`, `F_p`, `S` via `H_v`/`R_v`, literal `w_F`, (D)/(S), `in_rel`, Dinic, max deficit, WID-asserting row data |
| `sr7_validate.py` / `sr7_validate_RESULT.json` | `963d5605f48f6c9d3f5bbe8149dbf88bece3f3e86cdae4ab084b82fa1bed8da1` / `1e1075beaf2e89a9bc7493c55695edcf1f162dccbbb4dd62a7feded44f3a8d68` | fixed points; max-flow deficit vs exhaustive subfamilies (16/16); `CB(2,2)/4`, `CB(4,1)/4` |
| `sr7_a.py` / `sr7_a_RESULT.json` | `4255139de6371b072cd623d264d0100a8323cdf864ff6229ec9d8ca5b847809b` / `8264c535743698227540b8c6dc85d1af2a7919037e7de13c8df9630a1bc3b2c4` | 7a: abstract poset `d ≤ 12`; literal switch-dead ⟺ all-good on 10 CB trees |
| `sr7_b.py` / `sr7_b_RESULT.json` | `9bc76b4840dfc288f1f3873ec81af37c3f3d1bbf6d21a3a34cd99341e6e117bf` / `4be0e184d54c8f3b07c98790cd98c0dad876a1dc64099b94d6915e3248bb2fed` | 7b: random networks; `CB(4,1)/4` rational flow; hypothesis-necessity examples |
| `sr7_c.py` / `sr7_c_RESULT.json` | `fd8b3b16925ff113a659661fc82bbaa9fb2ef51e9e810a2068e883088bd27827` / `6049fdd40a467d8029d7b936e3df67c55f57cfb54a5224f5787f1ae08fa1c789` | 7c: B8 on `CB(1,m)`, `m ≤ 6`; B9 on `CB(d,1)`, `d ≤ 6`, `k = 0..d+1`, with row data and max-flow deficits |
| `sr7_c2.py` / `sr7_c2_RESULT.json` | `4deeed9023cfb5b6344a2593e9a61c485ccc6b3a5939b59377f06995532e5012` / `18188bec314d03b09bf1d50bcf6d1b17a25f877e4908aab4c23634ea6274803e` | 7c supplement: `CB(1,m)` sector deficits, (D) = (D) ∪ (S) = `CBstar` formula at `d = t = 1` |
| `sr7_d.py` / `sr7_d_RESULT.json` | `9a8204f806ff5a56635642ee945a7c3419a271be9ef71250ce287b1ce03c6b39` / `4eba01c00dea0228df1dd51080a4ff1521671ea6038b495b0a1b623d252c258e` | 7d: the four rows; the `t ∈ {2,3}`, `n ≤ 21` sweep (113 rows) |
| `sr7_d2.py` / `sr7_d2_RESULT.json` | `44871f7ac8a96d1926a90278ecec7ff0866b9a43139df1290e1831b1382d00e1` / `91cba9c5ffbc5d38e162a762636f188a46ec29010a4bc458c36e093c07e55e34` | 7d supplement: the weight-one family `R1` attains the maximum deficit at all four rows |
| `sr7_e.py` / `sr7_e_RESULT.json` | `5ffc2265761cd451a20dc57bf138dfc8715b9e7f66dded28cdfffb219ae757d3` / `c5b9c824973f08f918dd42cc43efd94f1ae86e3d28b390e0fb234560bef8580a` | 7e: literal reachability = Lean RHS = ¬P10 on all graphs `n ≤ 6` and 3,000 random `n = 7, 8` |
| `sr7_f.py` / `sr7_f_RESULT.json` | `4923bece3e484dd1dcc05c7696684af71273e9233c29982ce9ab7eefab2c4376` / `759e66b8ab50d2e9cee38fedac4e06d0846b829bf2d481a155c6d38b285adf9d` | 7f: A4 degree facts and the bound (ℕ and registered forms), `N ≤ 6` |

**Replay** (foreground, under 30 s in total):
`cd <scratch> && for s in sr7_validate sr7_a sr7_b sr7_c sr7_c2 sr7_d sr7_d2 sr7_e sr7_f; do python3 -B $s.py; done`. A full replay
after the first run regenerated every `*_RESULT.json` byte-identically. `sr7_d2.py` was added afterwards and was replayed once
more. Nothing was written under `sources/`, and no sealed member was
edited. Deliverable: `second-reads/SR-C3-7/SECOND-READ.md` (this file).
