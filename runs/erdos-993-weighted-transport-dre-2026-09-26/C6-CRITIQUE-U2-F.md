# Critique

Critic `C-U2-F` (orientation F, falsify) of route return `U2` (`C6-U-02 COUPLED-CB-EXTREMAL-FAMILY`, orientation U), r30 Cycle 6
Stage 4. Return: `cycles/cycle-6/stage3/returns/U2/RETURN.md` (SHA-256 `2c7dfa48…9084`, 38,858 bytes).

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file. Subsystems loaded: the constitution and the
startup protocol only. The task is the `experiments/` critic work that the dispatch governs. The harness also injected the
host `CLAUDE.md` and the memory index into my context. I did not act on either, and I wrote no conversation log, because the
dispatch confines my writes to this file and my scratch directory.

**Model disclosure.** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Toward the standing letters.** The return has no restricted (HALL) at `proved_informal` or better, no (CUT) candidate and no
Lean-ready statement. It supplies a validated instrument for the coupled `CB(d,m)` network and bounded structural data. This
critique adds three `proved_informal` structural lemmas (the S-arm decoupling, the V-full ⇒ EMPTY-full implication, and a
closed-form lower bound on the maximum deficit) and one refutation of the candidate claim as stated (at `m = 1`).

## Identity and seal audit

- Dispatch `control/dispatch/c6-stage4/DISPATCH-C-U2-F.md`: SHA-256 `3f415ab7bd99bffde281f42581e08955aec76108c6356a6ea3eef662c7e9b666`,
  checked with `shasum -a 256` before I followed it. **Match.**
- Capsule `control/c6-critic-capsules/U2-PACKET-MANIFEST.json`: inner seal recomputed as SHA-256 of the canonical JSON without
  `seal_sha256` (sort_keys, `(",", ":")`, no trailing newline) = `eed3c4e84e99b1de26498cc7d4c6406a3aed4f65d0748044e234cedb347aebf0`.
  **Match.** All 14 members match their listed SHA-256 and byte counts (script `scratchpad/c6-crit-U2-F/seal.py`).
- Stage 4 dispatch manifest seal recomputed `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50` (**match**). Stage 3 packet
  manifest seal `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd` (**match**). Stage 2 seal
  `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611` (**match**, and equal to the return's claimed value).
- Digests the return lists:
  - `RESULT_SHA256 7d131453124ce9c2e017d1affbfa04eab9790d5dbf2d1f2952aa3321e5ec7df7` is **reproduced**. I copied the
    return's files out of `scratchpad/c6-U2/` into `scratchpad/c6-crit-U2-F/replay/` and ran `python3 -B run_all.py`. The
    regenerated payload is identical to the shipped `run_all_RESULT.json`, and no `__pycache__` was produced.
  - `validate_RESULT.json` `da7d1d3dfd47eedeadcf7d2a715cbec035bfd1aa78385b8343ac8b6ab5264ba5` is **not backed**. The shipped
    file's SHA-256 is `07a7df30…aa7` and its internal `RESULT_SHA256` is `bb625789…a574`. No shipped file contains the literal
    `da7d1d3d`. **Struck.**
  - The return lists no per-file digests for its scripts. My copy-out digests are in `## Artifact inventory`.
- Identity: seat U2, route `C6-U-02`, fingerprint `COUPLED-CB-EXTREMAL-FAMILY`. These agree with `control/C6-ALLOCATION.md`
  item 6. The return's model line ("Chartered sonnet/xhigh … `claude-sonnet-5`") agrees with the allocation's route charter
  (Claude Sonnet 5 xhigh).
- Capsule versus brief: the attack brief calls "Controller replay CF-REPLAY-c6c (a capsule member)", but it is **not** in my
  capsule manifest. I did not read it. I derived `n, α, x`, the window and eligibility for every row myself.
- **My read-boundary disclosures:**
  1. Non-recursive `ls -la` of `scratchpad/c6-U2/` (granted). Non-recursive `ls` of `sources/` and of
     `sources/c5-stage7-sources/` (within the grant). I saw names only and opened nothing under `sources/c5-stage7-sources/`.
  2. `grep -n '^#'` on `control/C6-CRITIC-ATTACK-BRIEFS.md`, a capsule member, to locate my section. It displayed every
     seat's section heading, names only. I also ran `sed -n 1,20p` on the common preamble. I then read only the U2 section.
  3. The capsule member `control/C6-STAGE3-READ-BOUNDARY-DISCLOSURES.json` was read in full, including other seats' items.
  4. I read my own harness task-output file under `/private/tmp/claude-501/…/tasks/bghno0t48.output`. It holds the output of
     my own command, which the harness moved to the background automatically.
  5. **Background jobs.** Sweep PID `76303` was launched through a subshell without capturing `$!`. That was a procedural
     slip. I recovered its PID with `lsof -t` on its own log file, which is not a process listing. Sweep PID `79304` was
     captured via `$!`. The harness-backgrounded `m = 1` sweep had PIDs `80308` and `80311`, found with `lsof -t` on its
     output file. I killed all four by literal PID. `kill -0` then reported no such process, and `lsof` showed no holder of
     any log. Two sweeps were therefore truncated, as stated in `## Independent re-derivation`.
  6. No `find`, `grep -r`, `rg` or `ls -R` above the grant. No network, no installs, no Lean invocation. Two foreground
     `sleep 1` calls. Nothing was written outside my scratch directory and this file.
- The U2 seat's own disclosures (from the capsule record): named-directory `ls` calls, a bounded bytecode `find` inside its
  own scratch, and no background jobs. I saw nothing in the return that contradicts them. I cannot verify the
  `scratchpad/c6-U2-replay/` claims ("copied byte-identically", "no `__pycache__`"), because that directory is outside my
  grant.

## Independent re-derivation

**Instrument** (`scratchpad/c6-crit-U2-F/own/crit.py`, written from scratch; standard library; exact integers). It does not
use U2's hand-derived switch mechanisms or U2's code.

- **Generic literal layer.**
  - Independence polynomial by a forest DP on any deletion set.
  - `x` computed through rank `α`.
  - `F_p` derived for **every** leaf by testing `Δ_p(T − v) < 0` on the original carrier.
  - `S(T,p)` computed as `Σ_{v∈F} [q_v(p) − q_v(p−1)]`, with `q_v` taken from `H_v` and `R_v`.
  - `w_F(B)` taken literally as #`{v ∈ F ∩ B : (N(s_v)∖{v}) ∩ B ≠ ∅}`.
  - (D) ∪ (S) computed by scanning every `q ∈ B` and every `u ∉ B` with `|N(u) ∩ B| = 2`.
  - Trees pass an edge-count, acyclicity and connectivity test.
  - Max-flow by my own Dinic. I extract **both** the minimal maximizer (residual-reachable from the source) and the maximal
    maximizer (the complement of the set that can reach the sink).
- **CB orbit quotient.**
  - The orbit key is computed *from a literal set* (arm ⊆ `{r,s,v}`, plus the multiset of per-choke `(u?, #b, #c)`).
  - Per-choke key multiplicities come from literal enumeration of one choke's `2·3^d` configurations.
  - Each orbit's neighbours come from applying the generic literal relation to a literal representative and re-keying.
  - `F` is checked to be Aut-invariant.
  - `supply − capacity = S` is asserted on every row, with the two sides computed independently (orbit sums versus the
    `H_v`/`R_v` DP).

**Fixed points reproduced exactly** (literal network, `fixed_RESULT.txt`):

| Instance | `n` | `α` | `x` | `|F|` | Supply | Capacity | Flow | `S` | Arcs |
|---|---|---|---|---|---|---|---|---|---|
| `K_{1,12}/8` | 13 | 12 | 6 | 12 | 1980 | 3960 | 1980 | −1980 | — |
| Path-star `(2,3,4)/7` | 15 | 11 | 5 | 10 | 1483 | 2701 | 1483 | −1218 | 2025 |
| Path-star `(2,2,4,3)/8` | 18 | 13 | 6 | 12 | 8033 | 13467 | 8033 | −5434 | 11691 |

At `CB(8,92)/492`: `n = 1567`, `α = 829`, `x = 490`, eligible, `1_v = 1_c = 1` (737 favorable leaves), `S < 0`.

**Quotient versus literal validation** (`val_RESULT.txt`). The instances were `CB(1,2)`, `CB(2,2)`, `CB(1,3)`, `CB(3,2)`,
`CB(2,3)`, `CB(1,4)`, `CB(4,2)`, `CB(1,5)` and `CB(2,4)`, at every rank: **73 rows, 0 mismatches**. Each row compared supply,
capacity, maximum deficit, and the minimal and maximal maximizers (as orbit sets). On every row, the literal maximal
maximizer is a union of whole orbits. That confirms directly, in these instances, that the orbit-union reduction loses
nothing.

**The three laboratories** (`labs_RESULT.json`) are all reproduced exactly:

| Row | `n` | `α` | `x` | `Δ_x` | Eligible | `|F|` | Supply | Capacity | `S` (two-sided) | Maximum deficit | Maximizer |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `CB(11,2)/16` | 49 | 25 | 16 | −3276806830 | no (window empty) | 23 | 7067805096 | 7179544900 | −111739804 | **22458436** | unique (min = max); RV 268/268, EMPTY 67/67, V 73/73, S 0/73 |
| `CB(10,2)/14` | 45 | 23 | 14 | −20089438 | no | 21 | 931899840 | 851152520 | 80747320 | **86940920** | unique; 204 + 60 + 65, S 0/65 |
| `CB(12,2)/17` | 53 | 27 | 17 | −13711316113 | no | 25 | 58247482128 | 55347377008 | 2900105120 | **3573432896** | unique; 339 + 81 + 86, S 0/86 |

The new `CB(12,2)/17` coupled value, `3,573,432,896`, is **confirmed by a second instrument**. I did not replay the frozen
Cycle 5 instruments (`sources/c5-stage7-sources/ADJ-U/`); my own instrument is the second one.

**The five switch mechanisms.** I checked by hand, vertex type by vertex type, that U2's list is exactly the literal (S) set
on `CB(d,m)`:

- `v` and `c_ij` have degree 1 and never fire.
- `s` fires only on arm `RV`. The target is the S arm with every choke in state N, so it has weight 0.
- `r` fires when (`s` is present and exactly one choke is in state U), giving an R target of weight 0. It also fires when
  (`s` is absent and exactly two chokes are in state U); this is the V → RV coupling, and ∅ → R.
- `u_i` fires with `r` present and exactly one support present, or with `r` absent and exactly two supports present.
- `b_ij` fires when `u_i` and `c_ij` are both present.

My instrument never uses this list. Its agreement with U2's instrument on 73 literal rows and the three laboratories is
independent confirmation.

**"Binary orbit-reachability suffices" is valid.** With uncapacitated arcs, a finite minimum cut computes
`max_X [w(X) − w(N(X))]` over unions of orbits. The deficit function is supermodular (`N(X ∪ Y) = N(X) ∪ N(Y)` and
`N(X ∩ Y) ⊆ N(X) ∩ N(Y)`), so the maximal maximizer is unique and Aut-invariant. The orbit value therefore equals the global
maximum. No per-arc multiplicity enters.

One citation-scope note: the return credits the "lattice-of-maximizers half" to C2-LA1. The key's name registers only the
existence of an invariant positive deficient family. The value equality rests on the elementary maximal-maximizer argument
above, which `SEMANTIC-CONTRACT.md` §1.2 attaches to (LIFT)'s converse. The numbers are unaffected.

**Fidelity** (the protocol's first check):

- `w_F` counts active tags only. U2's `weight_of` returns `1_v` on arm RV and `1_c · Σ l_i` over U-state chokes. That is the
  literal active-tag weight on `CB`, and it equals my generic `w_F` on every row.
- The relation is exactly (D) ∪ (S).
- `F` is fixed at rank `p` from `Δ_p(T − v)` on the original tree. U2 derives it from one representative `c`; the
  automorphism group makes that sufficient. Both indicators are derived, not hard-coded.
- `x` is computed through rank `α`.
- `supply − capacity = S` is asserted from independent sides **on the three laboratory rows only**. U2's section 2, 4 and 5
  rows (the flow validation and 16 of its 19 "instances") carry no S assertion. That falls short of the "every instance"
  rule. My replay asserts it on every row and agrees everywhere, so no number is struck for this reason.

**My sweep** (`sweep.log`, `sweep2.log`, `sweep_m1.log`; every rank `p` with positive supply; S asserted on every row).
Complete coverage:

- `m = 2`, `d ≤ 13`
- `m = 3`, `d ≤ 12`
- `m = 4`, `d ≤ 7`
- `m = 5`, `d ≤ 4`
- `m = 1`, `d ≤ 13`

Partial coverage, because the jobs were killed before the write: `CB(13,3)` through `p = 27` of `α = 43`; `CB(5,5)` through
`p = 17`; `CB(14,1)` through `p = 10`.

Results: 47 `m ≥ 2` deficient or eligible rows. On every deficient `m ≥ 2` row the maximizer is **unique**, and U2's
characterization holds. Every eligible row found has maximum deficit 0, with the unique maximizer ∅: `CB(3,4)/11`,
`CB(4,4)/14`, `CB(5,4)/16`, `CB(6,4)/19`, `CB(7,4)/22`, `CB(2,5)/10`, `CB(3,5)/13`, `CB(3,5)/14` and `CB(4,5)/17`.
(`formula_RESULT.json`, `RESULT_SHA256 5751f4d8…421c`.)

## Attacks and findings

**F-1 (the strongest finding): the candidate claim, as stated, is false at `m = 1`.** The claim reads: "on `CB(d,m)`, the
deficit-maximizing `Aut`-invariant family contains every positive-weight source of arm `RV`, `EMPTY`, or `V`, and contains
the arm-`S` sources entirely or not at all". It carries no restriction on `m`.

- At `CB(7,1)/6` (`n = 18`, `α = 9`, `x = 6`, `|F| = 8`, `S = −21`, maximum deficit 21 by a fully literal, unquotiented
  max-flow), the maximizer is **unique**. It consists of the four RV orbits with at least 2 supports, `(0,2,3)`, `(0,3,2)`,
  `(0,4,1)` and `(0,5,0)`. It excludes RV `(0,0,5)` and `(0,1,4)`, and it excludes the EMPTY and V orbits
  (`m1_literal_RESULT.json`).
- The same failure occurs at `CB(10,1)/8` (checked literally) and at `CB(13,1)/10` (quotient).
- At `CB(6,1)/5` and `CB(8,1)/6` the maximizer is **not unique**: the minimal maximizer excludes S and the maximal one
  includes it. "The maximizer" is ill-defined there.
- `CB(7,1)/6` is itself a Cycle 3 record row, cited in `C6-STAGE1-GATE.md`.

The claim must be narrowed to `m ≥ 2`. The return's own range statement "`d = 1..9`, `m = 2..5`" is also inexact: its
instances have `m ∈ {2, 3, 5}`, and no `m = 4` row was tested.

**F-2: most of the 19 instances are trivial for the characterization.**

- In 14 of U2's 19 instances, the maximizer is the **entire positive-weight source layer**, and the maximum deficit equals
  `S(T,p) > 0`. The characterization then says nothing beyond the whole-layer inequality.
- Two of those 14 rows are `CB(5,2)/7` and `CB(8,2)/11`. There `p = x − 1` and `1_c = 0`, so only RV sources carry weight.
  U2's sweep labels them "S excluded" (`s_included: false`), but the S class is **empty** there. The claim holds only
  vacuously.
- Only 5 of the 19 test the characterization non-trivially: `CB(9,2)/13`, `CB(10,2)/14`, `CB(11,2)/16`, `CB(12,2)/17` and
  `CB(9,3)/19`. At all five the S arm is excluded.
- Rows with `S < 0` among the 19: only `CB(11,2)/16` and `CB(9,3)/19`. My sweep adds `CB(10,3)/21` (`S = −127,986,592,830`,
  maximum deficit `555,548,634,810`).
- "All-or-nothing" was therefore never observed as an interior choice. Across the tested rows, "S included" coincides with
  "maximizer = everything".

**F-3: the characterization is inapplicable at eligible rows.** None of the 19 instances is eligible. At the nine eligible
`CB` rows I reached, (HALL) holds with the unique maximizer ∅. At the four large eligible rows (`## Remaining obligation`,
item 5), U2's extremal shape is **not** deficient. The claim is a statement about non-eligible laboratories only.

**F-4: the compression lemma.**

- **(a) The literal lemma is false for arbitrary families.** The lemma says "`c → b` column replacement does not decrease the
  deficit". Read with the standard column shift (`B ↦ B − c_ij + b_ij` when `c_ij ∈ B` and `u_i ∉ B`, applied unless the image
  is already in the family), it fails:
  - At `CB(2,2)/4` (all 5 leaves favorable), the singleton `{r, v, c_00, c_01, b_10}` has deficit −2. Its shift
    `{r, v, b_00, c_01, b_10}` has deficit −3. The shift creates a choke with exactly one support, which enables the
    `u_0`-switch into a positive V target.
  - A deficient 84-member family has deficit 5, and its shift has deficit 4 (`shift_RESULT.txt`, `shift2_RESULT.txt`).
  - I could not read the Cycle 5 C-U2-T wording, which is not in my capsule. Under any reading that quantifies over all
    families, the lemma is refuted.
- **(b) "Strictly stronger" is a logical error.** U2's "membership in X* is invariant under column relabelling" concerns one
  family, while the lemma concerns all families. The two are incomparable. What U2's data supports is the WLOG form: some
  (here the unique) maximizer is closed under `c → b`.
- **(c) The two forms genuinely differ.** At `CB(7,1)/6` the arm-only form fails, but closure under compression survives:
  X* is the set of RV orbits with `j ≥ 2`, an up-set under `c → b`.
- **(d) "Membership is a function of arm class alone" is false without "positive weight".** A relabelling that preserves
  occupancy can map a U-state choke to an N-state and so send a positive-weight source to a weight-0 one.
- Accordingly, "the compression lemma is CONFIRMED" is **struck**. Replace it with: "at every tested `m ≥ 2` deficient row the
  unique maximizer is closed under `c → b` (`bounded_computation`); the all-families form is refuted".

**F-5: not a proof for any parameter range.** The "why RV/EMPTY/V are always full" paragraph restates the membership
condition (`w(B) ≥ cap(N(B)∖N(X))`) without bounding anything. The S-dichotomy paragraph offers no argument, as it
acknowledges. Critic-derived lemmas that make partial progress are below.

**F-6: a possible erratum in a capsule record (outside U2's claims).** `C6-STAGE1-GATE.md` lists `CB(9,2)/13` as a record
refuting "on trees `S ≤ 0` ⇒ saturation". The two-sided aggregate gives `S(CB(9,2),13) = +2,424,264` (supply 120,631,632,
capacity 118,207,368). The row is not an `S ≤ 0` instance, so its saturation failure is the whole-layer failure. `CB(7,1)/6`
(`S = −21`) and `CB(11,2)/16` (`S = −111,739,804`) do stand as records, as do my `CB(9,3)/19` and `CB(10,3)/21`.

**Critic-derived advance** (attributed to `C-U2-F`; STATED, pending an isolated second read; no key). The setting is
`CB(d,m)` at any `p`, with `F = F_p`. Write `C := CB(d,m) − {r,s,v}` for the choke forest (m disjoint brooms `u–b_j–c_j`).
`Ψ(k)` is the total active weight of the independent `k`-sets of `C`, taken with the private-leaf tags only.

- **(A) S-arm decoupling (`proved_informal`).**
  - (i) A positive-weight S-arm target is joined only to S-arm sources. Adding `r` or `v` to a set containing `s` breaks
    independence. The `s`-switch output carries only state-N chokes, so it has weight 0. A `u_i`-switch with `r ∈ B′` would
    need `s, r ∈ B′`.
  - (ii) A positive S-source `c ∪ {s}` is joined, outside the S arm, only to the EMPTY target `c`. The `r`-switch gives an
    R-arm target, which has weight 0. The target `c` is also joined, by deletion of `v`, to the positive V-source `c ∪ {v}`.
  - Consequence: for every `X ⊇ V⁺` and every `Y ⊆ S⁺`, `def(X ∪ Y) = def(X) + [w(Y) − w(N(Y) ∩ S-targets)]`. The S-arm
    sub-network is isomorphic to the transport network of the forest `C` at rank `p − 1`, with tags equal to the private
    leaves.
  - In every maximizer containing `V⁺`, therefore, the S-part is exactly a maximizer of `N(C, p−1)`.
  - Checked on 14 rows (`decouple_RESULT.txt`): decoupling holds everywhere, and the S-part of the maximal maximizer equals
    the maximal maximizer of `N(C, p−1)` everywhere.
- **(B) V-full ⇒ EMPTY-full (`proved_informal`).** Every positive-weight neighbour of an EMPTY source is an EMPTY target `c`,
  since the `r`-switch lands on arm R. Each such `c` is already in `N(c ∪ {v})`. If `V⁺ ⊆ X`, adding any EMPTY source costs 0
  and gains `w > 0`, so every maximizer containing `V⁺` contains `EMPTY⁺`.
- **(C) Closed-form lower bound (`proved_informal`, all `(d, m, p)`).**
  - Let `Ψ(y) = m·d·y²(1+y)^{d−1}·[y(1+y)^d + (1+2y)^d]^{m−1}` and `K_p := 1_c·([y^p]Ψ − [y^{p−1}]Ψ)`.
  - `w(S-sources) − w(S-targets) = K_p`.
  - By (A)(i), the family `X_0` of all positive non-S sources satisfies `def(X_0) ≥ S − K_p`, and `def(all⁺) ≥ S`.
  - Both hold with **equality** when `p < dm`: every positive target then has a positive same-arm source above it, obtained
    by adding `b_ij`, or `c_ij` when `u_i` is present, in an empty column.
  - Hence the maximum deficit is at least `max(0, S, S − K_p)`.
  - The formula for `Ψ` was checked against the S-block computed directly on 8 rows.
- **(D) Bounded equality.** The maximum deficit equals `max(0, S, S − K_p)` on **every** `m ≥ 2` row of my sweep (38
  deficient rows plus the 9 eligible zero rows; 0 exceptions). It fails only at `m = 1`, on `CB(7,1)/6`, `CB(10,1)/8` and
  `CB(13,1)/10`. This answers U2's remaining obligation 2 conditionally: given `V⁺ ⊆ X*` and a dichotomous `N(C, p−1)`, the
  S-arm is included exactly when `K_p > 0` (on ties, the minimal maximizer excludes it and the maximal one includes it).
- **(E) No cut from this shape at the named eligible rows** (`elig_RESULT.json`, exact integers). There `p < dm`, so
  `def(X_0) = S − K_p` exactly, and `def(all⁺) = S`:

  | Row | `S` | `K_p / S` | `S − K_p` |
  |---|---|---|---|
  | `CB(8,92)/492` | `−7.4881e350` | 0.2787 | `−5.4011e350` |
  | `CB(8,95)/508` | `−2.3788e362` | 0.2797 | `−1.7134e362` |
  | `CB(7,109)/510` | `−1.0184e365` | 0.2681 | `−7.4539e364` |
  | `CB(9,112)/673` | `−1.4282e480` | 0.2811 | `−1.0267e480` |

  U2's extremal family, and the whole layer, are non-deficient there with margin about `0.72·|S|`. This is data for F1's
  search, not a certificate of (HALL).

## Mechanism-equivalence and fence check

- U2's object is a flow instrument plus a description of its minimum cut. It proposes no transport rule and none of the ten
  refuted keys:
  - it is not deletion-only Hall (switch arcs are modelled);
  - it has no retag relation, own-support unit capacity or per-leaf injectivity;
  - it has no occupancy domination, signed cross-tag or covariance mechanism.
- It re-proves no closed region. The Cycle 5 values `22,458,436` and `86,940,920` are used only as validation targets,
  which is legitimate. No census value enters a proof, and there is no RTree wording.
- (LIFT) is not treated as supplying quotient feasibility. Only the min-cut/value direction is used, and that is valid.
- The mandate's item on "`Aut`-orbit keys carrying each choke's degree for heterogeneous patterns" was **not done**; the
  return says so.
- Fence §3.4: the 19-instance sweep contains no eligible row, so it is evidence of nothing about (HALL). The return does not
  claim otherwise.
- My advance (A)–(C) is structural and scoped to `CB(d,m)`. It is neither a relaxed class model nor a revival of any refuted
  mechanism. It is an exact decomposition of the literal network. Its use of `Ψ` is a generating-function identity, not a
  census value.
- Claim identity: (HALL) keeps its master name, `OPEN`. The candidate "clean maximizer characterization" must be narrowed to
  `m ≥ 2` and to rows with positive maximum deficit. It is then a `bounded_computation` record, and a key would have to name
  the range exactly (ruling 48). The `CB(12,2)/17` value is a single-row record, not a key.
- I could not repeat U2's lexical alias scans, because the registries are not capsule members. U2's scan claims stand
  unverified. My (A)–(C) are STATED with no proposed key text, pending an isolated second read and an alias check by the
  synthesis.

## Certification audit

| Literal in the return | Status |
|---|---|
| "223,706 literal independent sets", "0 mismatches" | **Backed** (`checked_sets` sums to 223,706; total mismatches 0). |
| "15 flow instances, 0 mismatches" | **Backed** (15 rows in section 2). `run_all.py`'s docstring still says "22", which is stale. |
| `22,458,436`, `86,940,920`, `3,573,432,896`; `S` values; `Δ_x`; `\|F\|` | **Backed** and reproduced by a second instrument. |
| `268 + 67 + 73 = 408`; `204 + 125` | **Backed.** |
| "unique maximizer" (at the three laboratories) | **Not shown by U2**, whose code extracts only the minimal maximizer. **Now backed by this critique** (minimal = maximal at all three, and at every deficient `m ≥ 2` row I tested). |
| `RESULT_SHA256 7d131453…` | **Backed** (replayed). |
| `validate_RESULT.json` `da7d1d3d…` | **Struck** (matches neither the file nor its internal digest). |
| "19 distinct deficient instances, zero counterexamples" | Count **backed**. The range "`d = 1..9`, `m = 2..5`" is **struck**; replace it with `m ∈ {2,3,5}`. Two of the 19 are vacuous (F-2). |
| "zero counterexamples on 43 total instances" (route verdict) | **Struck**: no shipped computation has 43 instances. |
| "eight labelled data points (S included at five, excluded at three)" | **Struck**. U2's own data gives 10 points, 6 included and 4 excluded. Two of its sweep's "excluded" rows have an empty S class. |
| "compression PRESERVES membership exactly — a strictly stronger fact"; "compression lemma CONFIRMED" | **Struck** (F-4). |
| "membership in `X*` is a function of ARM CLASS ALONE" | **Narrowed**: add "positive weight", and it holds only on the tested `m ≥ 2` rows. |
| "copied byte-identically to `scratchpad/c6-U2-replay/`" | **Unverified** (outside my grant). My copy-out replay from `c6-U2/` reproduces the digest. |
| `Aut(CB(d,m)) = S_d ≀ S_m` | Harmless: the quotient needs only a subgroup. |

## Verdict

verdict: retained_narrowed
headline_resolved: no

What is retained:

- The coupled orbit-quotient instrument is correct: it is reproduced by an independent instrument and 73 literal rows.
- The three laboratory maxima are correct, including the new `CB(12,2)/17 = 3,573,432,896`, now confirmed by two
  instruments at `bounded_computation`.
- The five-mechanism derivation is correct.

What is narrowed:

- The characterization holds only for `m ≥ 2` and rows with positive maximum deficit. It is refuted as stated at `m = 1`
  (`CB(7,1)/6` and `CB(10,1)/8`, both literal), and it is non-unique at `CB(6,1)/5` and `CB(8,1)/6`.
- Only 5 of its 19 instances are non-trivial, and it says nothing at eligible rows.

What is struck:

- "compression lemma CONFIRMED" and "strictly stronger". The all-families lemma is refuted at `CB(2,2)/4`.
- The literals `43`, "eight data points (5/3)" and `da7d1d3d…`.

No statement in the return is complete as mathematics at `proved_informal`. The critic-derived (A), (B) and (C) are
`proved_informal`, with proofs given above, pending an isolated second read.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

The exact successor inheritance replaces U2's items 1 and 2:

1. **(RV–V core, `m ≥ 2`).** Prove that the maximal maximizer contains `RV⁺ ∪ V⁺` whenever the maximum deficit is positive
   and `p < dm`. By (B), `EMPTY⁺` then follows; by (A), the S-part is then a maximizer of `N(C, p−1)`. The only coupling left
   is between RV and V: mechanism 3 (RV into V with a single U-state choke) and mechanism 2 (V with two U-state chokes into
   RV). This coupling is exactly what fails at `m = 1`, where mechanism 2 cannot fire.
2. **(Choke-forest dichotomy.)** Prove that the forest network `N(C, p−1)` (m brooms `u–b_j–c_j`, tags equal to the private
   leaves) has its maximal maximizer in `{∅, all}`. With item 1 this gives the maximum deficit as
   `max(0, S, S − K_p)` in closed form.
3. **`m = 1`, separately.** There the maximizer depends on the column split (RV orbits with `j ≥ 2`), and uniqueness can fail.
4. **Heterogeneous chokes.** Orbit keys carrying each choke's degree, validated literally, remain untouched by U2 and by me.
5. **Relevance to (HALL).** None is demonstrated. At `CB(8,92)/492`, `CB(8,95)/508`, `CB(7,109)/510` and `CB(9,112)/673` the
   U2-shaped family has deficit exactly `S − K_p < 0`. A (CUT) there must come from a different shape; this is F1's object.

No restricted (HALL), no (CUT), no Lean statement.

## Artifact inventory

Scratch root: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-U2-F/`.
All Python was run with `python3 -B`. No `__pycache__` exists, and no background job is alive: PIDs `76303`, `79304`, `80308`
and `80311` were killed by literal PID and confirmed gone.

- `seal.py`: the capsule, Stage 2, 3 and 4 seal and member-digest check.
- `replay/`: a copy-out of every file from `scratchpad/c6-U2/`. Script digests: `orbit_net.py` `ab8076bf…`, `solve.py`
  `1fbb9a7a…`, `run_all.py` `ec2abfd9…`, `tree.py` `39fc398c…`, `flow.py` `10a870de…`, `validate.py` `8541b816…`,
  `validate_flow.py` `2c5ec816…`. Also `run_all_RESULT.shipped.json` (the shipped copy) and the regenerated
  `run_all_RESULT.json` (identical, `RESULT_SHA256 7d131453…`).
- `own/crit.py` (`4e88f28f…`): the independent instrument.
- `own/fixed.py` → `fixed_RESULT.txt` (`744faf57…`).
- `own/val.py` → `val_RESULT.txt` (`c34539e6…`): 73 rows, 0 mismatches.
- `own/labs.py` → `labs_RESULT.json` (`72b54e5d…`).
- `own/sweep.py` → `sweep.log` (`69aefefa…`), `sweep2.log` (`87899ae7…`), `sweep_m1.log` (`baac1d78…`). The runs were
  truncated by kill, as stated above.
- `own/decouple.py` → `decouple_RESULT.txt` (`db85ca84…`).
- `own/bound.py` (`ed2e11b6…`) and `own/formula.py` → `formula_RESULT.json` (`c290524a…`, internal `RESULT_SHA256
  5751f4d8…421c`).
- `own/elig.py` → `elig_RESULT.json` (`04e9e4c9…`, internal `2307d792…cbda8`).
- `own/m1lit.py` → `m1_literal_RESULT.json` (`f4364466…`).
- `own/shift.py` → `shift_RESULT.txt` (`dbd38001…`), and `own/shift2.py` → `shift2_RESULT.txt` (`9c8192a7…`).
