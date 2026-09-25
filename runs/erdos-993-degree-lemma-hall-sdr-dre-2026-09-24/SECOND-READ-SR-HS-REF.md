# Second Read

Isolated second read `SR-HS-REF`, r28 Cycle 1: the refutation of the leaf/slot dominance condition (HS).
Run `erdos-993-math-dre-20260924-r28-degree-lemma-hall-sdr`.

**Boot acknowledgment.** Operating within VerityOS. The boot reads were exactly
`/Users/ashtonsperry/VerityOS/verity.md` (the constitution) and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the identity subsystem's startup protocol). I read
no other VerityOS file outside the run root. The host harness placed the repository `CLAUDE.md` and the user
auto-memory index in my context without my asking. I did not act on either, and neither enters any step below.

**Model disclosure.** chartered opus/high; transport-resolved model opus (explicit parameter); the seat cannot self-inspect its runtime model/effort — stated on dispatch-record authority

## Identity and seal audit

- **Capsule.** `control/c1-second-read/SR-HS-REF-PACKET-MANIFEST.json`, stage
  `cycle-1-second-read-SR-HS-REF`.
  - Recorded seal: `c6e0291345a3f24643c71afd55483fddbc985ba9738480849b561665d7458099`.
  - Recomputed seal: SHA-256 of `json.dumps(manifest minus seal_sha256, sort_keys=True, separators=(",",":"))`,
    no trailing newline (`scratchpad/c1-sr-SR-HS-REF/seal_check.py`). It is **identical**.
  - **85/85 members match** in both SHA-256 and byte count, including the 226,644,983 B `ckpt.pkl`, which was
    hashed and not opened. `file_count` is 85.
- **Dispatch wrapper.** `control/dispatch/c1-second-read/DISPATCH-SR-HS-REF.md` carries only the pointer. I read
  it and followed it.
- **Read boundary.** I read these capsule members:
  - the protocol, the brief, `SEMANTIC-CONTRACT.md` and `SOLUTION-CONTRACT.md`;
  - `AUTHORIZATION.md` (the first 1,500 bytes only), `control/C1-STAGE1-GATE.md`,
    `control/c1-second-read/PATH-CHECK-SR-HS-REF.json` and `control/C1-STAGE2-PATH-LITERAL-QUOTATION-RECORD.json`;
  - three critiques: `C-F1-T` (`cycles/cycle-1/stage4/critics/F1/T/CRITIQUE.md`), `C-T2-U` and `C-F2-T`;
  - `control/CLAIM-IDENTITY.run-local.json`, by keyed and lexical search for the alias check;
  - four `C-F1-T` output files: `order21.log`, `order21_result.json`, `family_R.txt` and `cx_T22_brute.txt`.

  I read those four output files for reconciliation only. No number below rests on them.
- **What I did not read.** Nothing under `cycles/cycle-1/stage5/`, no other return, adjudication or experiment
  root, and no Mathlib or Lean source (none was needed). I made no `find`/`grep` above the capsule, used no
  network and installed nothing. I did not cite the controller's order-18 prior (`hs_check.py`, hashed only) as
  evidence.
- **Process disclosure.**
  1. My first `sr_family.py` run exceeded the 600 s tool limit. The harness moved it to the background as task
     `btkpu5s0s`. The cause was my own instrument bug: an all-`t` loop running up to `max c`, which is
     astronomically large for the bigger family members.
  2. I read the task's empty output file (`/private/tmp/claude-501/…/tasks/btkpu5s0s.output`, harness-owned).
     I located my wrapper shell with `pgrep -f` (a listing, not a kill) and killed it by literal PID
     **31354**.
  3. Its python child, literal PID **31357**, was orphaned (parent PID 1) and survived, because its command line
     reads `…/Python sr_family.py`, which my pattern missed. I found it at 22 min elapsed and killed it by
     literal PID **31357**. Afterwards, `pgrep` showed no process of mine remaining.
  4. That process could write files only on completion, and it never completed. `family_result.json` still has
     the digest printed by the foreground rerun. Every number below comes from foreground runs.
  5. I launched no other background job.

## Statements read

- `HR-1`: the counterexample `R(3,2)_3`, order 22. The claims are: `i_12 = 19`; `c_0(12) = 18`; `c_c(12) = 0` for
  each child; `c_ℓ(12) = 17` for each leaf; at `(k,t) = (12,18)`, `slots = 1 > leaves = 0`; (HS) and (HS-SDR)
  fail; the graph is a tree; (DL) holds at every `k`.
- `HR-2`: the family `R(d,m)` (`C-F1-T`, "Critic-derived advance 1"). For `d ≥ 3`, `m ≥ 2`, at `k = α − 1 = 2dm`:
  `i_k = 3dm+1`, `c_r = 3dm`, `c_ℓ = 3dm−1`, `c_{b_i} = 0`; at `t = 3dm`, `slots = d−2 > 0 = leaves`.
- `HR-3`: minimality. There is no failure to order 21, so the minimum counterexample order is 22. The brief adds
  the question of whether `R(3,2)_3` is the unique order-22 counterexample.
- `HR-4`: what survives. Five things are checked:
  - the witness's branch tree is `K_{1,3}`, consistent with Theorem BTP (maximum branch-tree degree `≤ 2`) and
    showing that BTP is sharp;
  - the "own leaves first, then one spare leaf per extremal branch vertex" conjecture fails on the witness;
  - the registration text for `E993-R28-DOMINANCE-REFUTATION`;
  - the scope note for `E993-R28-TREE-LEAF-SLOT-DOMINANCE`.

## Independent re-derivation

**Instrument** (`scratchpad/c1-sr-SR-HS-REF/sr_lib.py`, standard library only, exact integers). It shares no code
with any seat or critic.

- **Free trees by centroid.** A unicentroidal tree is the centroid plus a multiset of rooted branches, each of size
  `< n/2`. A bicentroidal tree (`n` even) is an unordered pair of rooted `n/2`-trees joined at their roots.
  - Each isomorphism class is produced exactly once, because the branch multiset at the unique centroid, or the
    unordered pair across the central edge, is a complete invariant.
  - The rooted library is built by multiset composition, and its sizes 1–11 equal A000081
    (1, 1, 2, 4, 9, 20, 48, 115, 286, 719, 1842).
  - The free-tree counts equal A000055 at every order 1–22.
  - Pairwise non-isomorphism was checked with a brute-force min-over-all-roots canonical string on every tree to
    order 15.
  - The tree test (`|E| = n−1`, union-find acyclicity, separate BFS connectivity) runs on every tree to order 18,
    and on every 50th tree with `Br ≠ ∅` at orders 19–22. The construction yields trees by design.
- **Occupancy DP.** A down/up pass on a rooted parent array, with polynomials packed at `x = 2^B`. Evaluation is a
  ring homomorphism, so a sibling-exclusion product is an exact integer quotient. The c-polynomial is
  `x·P[v]·Ao[v]`.
- **Brute force.** Every one of the `2^n` subsets is tested edge by edge.
- **Deletion recursion.** A third instrument: `I(S) = I(S−v) + x·I(S−N[v])`, memoised on bitmasks, with
  `c_v = x·I(V − N[v])`.
- **Threshold form.** Evaluated literally, either at every `t = 1..max c + 1`, or at every breakpoint.
  - The breakpoints are the distinct positive `c`-values over branch vertices. That is sufficient by my own
    argument: `slots_{≥t}` is constant on each interval `(a, b]` between consecutive breakpoints, and 0 above
    the largest, while `leaves_{≥t}` is nonincreasing. So `slots − leaves` is maximised at `t = b`.
  - The two evaluators agree on all 30,205 `(T, k)` instances to order 13.
- **Matching form.** Kuhn augmenting paths on the literal `H_k(T)`.

**Validation** (`sr_validate.py` → `validate.out`):
- DP = brute force on all 987 trees of order ≤ 12.
- DP = deletion recursion on all 5,447 trees of order ≤ 14.
- On all 32,508 trees of order ≤ 16: `Σ_v c_v(k) = k·i_k`, `c_v(0) = 0` and `c_v(1) = 1`.
- Contract fixed points: `S(2,1,1)` at `k = 3` gives `c = (0,1,2,2,1)`. `K_{1,3}` gives centre `c(2) = 0` and
  leaves `c(2) = 2`.

**HR-1** (`sr_t22.py` → `t22.out`, `t22_result.json`, canonical digest `d367958f…230d92`).
- My builder of `R(3,2)` from the definition reproduces the critic's 21-edge list edge for edge.
- The graph is a tree: `n = 22`, `|E| = 21`, union-find acyclic, BFS connected.
- `Br = {0,1,8,15}`, all of degree 3, so there are 4 slots. `L = {4,7,11,14,18,21}`, and `|L| − 2 = 4`.
- **Brute force** over all 4,194,304 subsets finds exactly 54,929 independent sets. (A separate counter confirmed
  that 4,194,304 subsets were visited.)
- `i = [1, 22, 210, 1144, 3933, 8907, 13470, 13529, 8856, 3691, 975, 171, 19, 1]` and `α = 13`.
- Brute force, the rerooting DP and the deletion recursion agree on `i_k` and on every `c_v(k)`, `k = 0..22`.
  `Σ_v c_v(k) = k·i_k` at every `k`.

| `k` | `i_k` | `c_0` | `c_1 = c_8 = c_15` | `c_ℓ` (all six) | Threshold fails at `t` | Max matching / slots | `D_k ≤ 2k·i_k` |
|---|---|---|---|---|---|---|---|
| 1–10 | — | — | — | — | none | 4/4 | yes at every `k` |
| 11 | 171 | 141 | 4 | 136 | 137..141 (`slots, leaves = 1, 0`) | 3/4 | 3099 ≤ 3762 |
| 12 | **19** | **18** | **0** | **17** | **18** (`slots_{≥18} = 1 > 0 = leaves_{≥18}`) | 3/4 | 372 ≤ 456 |
| 13 | 1 | 1 | 0 | 1 | none | 4/4 | 21 ≤ 26 |
| 0, 14 | — | 0 | 0 | 0 | none | 4/4 | 0 ≤ 0 |

- Every number in `HR-1` reproduces exactly. The threshold form fails at exactly `k ∈ {11, 12}`. The matching
  form fails at the same `k`, and the two forms agree at every `k`.
- **(DL) holds at every `k = 0..14`**, and trivially above `α`, where every count is 0.
- The r27 reformulation identity `2k·i_k − D_k = Σ_L c − Σ_Br (deg−2)c` holds at every `k`, and so does the slot
  count `Σ_Br (deg v − 2) = |L| − 2`. At `k = 12`: `84 = 102 − 18`. At `k = 11`: `663 = 816 − 153`.
- The layer-cake sum over `t ≥ 1` equals these values, with negative terms at `t = 18` (for `k = 12`) and at
  `t = 137..141` (for `k = 11`).

**HR-2.** First, the hand proof, re-derived line by line.
- **Arm bound.** Call `b_i` together with its paths an arm.
  - With `b_i` excluded, the arm is `m` disjoint copies of `P_3`. Each has `α = 2`, uniquely `{x, ℓ}`, so the arm
    has `2m`, uniquely.
  - With `b_i` included, every `x` is excluded, and each `y–ℓ` edge gives at most 1. That makes `1 + m`.
  - **`m ≥ 2` enters here**: `1 + m < 2m`.
- **`α` and the sets without the root.**
  - Without `r`, the maximum is `2dm`, attained by exactly one set: all `x` and all `ℓ`.
  - With `r`, every `b` is excluded. The `dm` copies of `P_3` give `2dm`, so `α = 2dm + 1`, and the maximum set is
    unique.
- **The sets at `k = 2dm`.**
  - Without `r`: exactly 1 set.
  - With `r`: exactly one path contributes a single vertex (`x`, `y` or `ℓ`). A path contributing 0 would give
    `≤ 2dm − 2`. So there are `3dm` such sets.
  - Hence `i_k = 3dm + 1` and `c_r = 3dm`.
  - A fixed leaf lies in `3(dm − 1)` root sets where another path is the deficient one, in 1 where its own path
    contributes `{ℓ}`, and in the root-free set. So `c_ℓ = 3dm − 1`. By the same count, `c_x = 3dm − 1` and
    `c_y = 1`.
- **The `b_i`.** A set containing `b_i` excludes `r` and has size `≤ (d−1)·2m + 1 + m < 2dm` (using `m ≥ 2`), so
  `c_{b_i} = 0`.
- **Slots.**
  - The root carries `d − 2` slots. **`d ≥ 3` enters here.**
  - Each `b_i` has degree `m + 1 ≥ 3` and carries `m − 1` slots at value 0, so they never count at `t ≥ 1`.
  - `x` and `y` have degree 2. The leaves are exactly the `dm` vertices `ℓ`.
- **ℕ-subtractions.**
  - `deg v − 2` is guarded by `deg ≥ 3`.
  - `3dm − 1 ≥ 17`.
  - `α − 1 = 2dm`, since `α ≥ 1`.
  - `d − 2 ≥ 1`.

  None of them truncates.
- **Tree hypothesis.** It enters only through the construction: the tree is built by pendant attachment, with
  `n = 1 + d(1+3m)` vertices and `n − 1` edges.

The proof is correct and complete.

Second, the computation (`sr_family.py` → `family.out`, `family_result.json`, canonical digest `847c5982…c99c9b2`),
over `d = 2..6`, `m = 1..5`: the DP runs on every member, and the deletion recursion as an independent check for
`n ≤ 31`.
- The closed forms (`α`, uniqueness of the `α`-set, `i_k`, `c_r`, `c_ℓ`, `c_b`, `c_x`, `c_y`) hold for every
  `d ≥ 2`, `m ≥ 2`.
- For every `d = 3..6`, `m = 2..5` (16 members, `n` from 22 to 97), `slots_{≥3dm} = d − 2` and
  `leaves_{≥3dm} = 0`, so (HS) fails at `k = α − 1`.
- The threshold and matching forms agree at every `k`, and (DL) holds at every `k`.
- **Both parameter bounds are necessary for this mechanism.**
  - For `d = 2`, the closed forms hold, but the root has degree 2 and is not a branch vertex. There is no failure.
  - For `m = 1`, the closed forms fail, because `1 + m = 2m`. `R(d,1)` is a spider, and there is no failure.
- Observed only, not claimed: the failing `k` form a contiguous range ending at `α − 1`. For `m = 2` the range is
  exactly `{α − 2, α − 1}`. For example, `R(3,4)` fails at `k = 12..24`.

**HR-3.** The census (`sr_census.py`, `sr_summary.py` → `census_summary.json`, canonical digest `abfb7298…e28cc9`)
covers every free tree of orders 2–22, every `k = 1..α`, at every breakpoint `t`. All runs were in the foreground.
Order 22 was run as two sequential halves (index mod 2).

| Order | Classes (= A000055) | `(T,k)` instances, `k = 0..α+1` | Threshold failures | Tight (T,k)* | Seconds |
|---|---|---|---|---|---|
| 2–18 | as A000055 | — | 0 | 0 | — |
| 19 | 317,955 | 4,374,968 | 0 | 3 | 13.3 |
| 20 | 823,065 | 11,822,209 | 0 | 2 | 37.6 |
| 2–20 total | 1,346,023 | 18,811,562 | 0 | 5 | — |
| 21 | **2,144,505** | **32,100,522** | **0** | 24 | 110.8 |
| 22 | **5,623,756** | 87,580,472 | **2 instances, 1 class** | 21 | 334.4 |

\* "Tight" means a non-failing `(T, k)` with some `t ≥ 1` where `slots_{≥t} = leaves_{≥t} ≥ 1`.

- **Order 22.** The single failing class is isomorphic to `R(3,2)_3`, confirmed by a canonical string. It fails
  at `(k, t) = (11, 141)` and `(12, 18)`, where 141 is the breakpoint that `137..141` reduces to. Its maximum
  branch-tree degree is 3.
- **Reconciliation.** My order-2–20 totals (1,346,023 classes; 18,811,562 instances) and my order-21 figures
  (2,144,505; 32,100,522; 0 failures; 24 tight) equal `C-F1-T`'s figures digit for digit. The tight counts at
  orders 19 and 20 (3 and 2) also equal them.
- I reached them with a different enumerator (centroid composition against leaf augmentation plus AHU dedupe),
  a different `c`-routine, and a different evaluation (breakpoint threshold against its all-`t` method). These
  figures are counted from my runs. The critic's are used only for comparison.

**HR-4.**
- **Branch tree.** It has edges `{0–1, 0–8, 0–15}`, which is `K_{1,3}`, with `b(0) = 3` and `b(1) = b(8) = b(15) = 1`.
- **Lemma PP** holds on every vertex of every pendant path, including the anchoring branch vertex, at every `k`:
  414 checks, 0 failures.
- **The own-leaf assignment** is valid for the three `b = 1` vertices. At `k = 12`, `0 ≤ 17`.
- **The root.** It has 0 own pendant leaves. The three spare leaves `{7, 14, 21}` have `c = 17 < 18 = c_0`.
- **No leaf** has `c_ℓ(12) ≥ 18`, so every slot→leaf rule fails at `(12, 18)`.

## Findings and repairs

1. **`HR-1` is exact.** Every number reproduces on three instruments of my own, including a literal `2^22` brute
   force. The failure is in the threshold form and in the matching form. (DL), the r27 reformulation identity and
   the slot count all hold on the witness at every `k`. At the failing `(k, t)` every leaf has the same `c`, but
   the refutation evaluates the threshold form literally. (PW) is not a premise.
2. **Which §1 targets this refutes.**
   - It refutes (HS), `E993-R28-TREE-LEAF-SLOT-DOMINANCE`, as a universal statement over finite trees.
   - With it falls (HS-SDR), because the maximum matching in `H_12` is 3 < 4.
   - It does **not** refute:
     - (LC) `E993-R28-DOMINANCE-IMPLIES-DEGREE-LEMMA`, an implication that remains a valid lemma. Its hypothesis
       is false on the witness at `k ∈ {11, 12}`.
     - (FC).
     - (DL) `E993-R27-FOREST-DEGREE-LEMMA` (formally verified, face untouched).
     - The SDR/threshold equivalence. Both forms fail together, as they must.
     - The pendant-path leaf dominance lemma.
     - Theorem BTP.
   - The Lean target `tree_leaf_slot_dominance` of `SOLUTION-CONTRACT.md` §2 is a false statement and must not be
     pursued.
3. **`HR-2` is exact.** The statement and proof are correct as `C-F1-T` wrote them. I record where each hypothesis
   enters: `m ≥ 2` in the arm bound and in `c_b = 0`; `d ≥ 3` in the root's slot count.
   - Clarifying the brief's "length 3?": each pendant path `b_i–x–y–ℓ` has three edges, that is, three vertices
     beyond `b_i`. The subscript in `R(3,2)_3` is this path length.
   - `c_x = 3dm−1` and `c_y = 1` are my additions. They are not needed for the failure.
4. **`HR-3`: repair of the evidential basis and an addition.**
   - `C-F1-T`'s sentence "the minimum counterexample order is therefore 22" was stated on one instrument at
     order 21. It now rests on two exhaustive instruments at order 21 (`C-F1-T` and `SR-HS-REF`) and on three at
     orders ≤ 20 (F1, `C-F1-T` and `SR-HS-REF`).
   - **Added:** `R(3,2)_3` is the **unique** order-22 counterexample. This comes from an exhaustive enumeration
     of all 5,623,756 classes on one instrument, mine.
   - Grade: `bounded_computation`. The uniqueness clause must carry "one instrument" on its face until a second
     instrument replays order 22.
5. **`HR-4`: consistency confirmed, with repairs.**
   - (a) The witness's branch tree is `K_{1,3}`. It lies outside the BTP class and shows that the class cannot
     be widened to maximum branch-tree degree 3. "Sharp" here means that *some* tree with maximum branch-tree
     degree 3 fails. The minimal such tree, H10 of order 10, satisfies (HS).
   - (b) The "own leaves first, then one spare leaf per extremal branch vertex" rule fails on the witness at
     `(12, 18)`, as the controller read it.
   - (c) **Further casualties** that must not be registered as OPEN:
     - `C-T2-U`'s Rooted Export Conjecture (REC, Finding 4). It implies (HS-SDR), so it fails on `R(3,2)_3` at
       `k = 12` for every root choice.
     - `C-F2-T`'s conjecture "(HS) for connected graphs with `|E| ≤ n`" (Remaining obligation 4). A tree is such
       a graph.
   - (d) **Repairs.** I read only `C-T2-U` and `C-F2-T`, not "four T critics and two F critics", so I attest
     only to their versions of the pendant-path lemma and of BTP. I did **not** second-read BTP. Its
     `proved_informal` grade on the scope note is conditional on its own isolated second read, as the brief says.
6. **Registry face of the r27 reformulation.** The scope of `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`
   says "the Hall/SDR sufficient condition (C-T2-U Step C) is OPEN". Sealed records are not edited (§3.5), so a
   scope-note record should mark it REFUTED by pointer. The reformulation itself is untouched.
7. **Key-name predicate check.**
   - `E993-R28-DOMINANCE-REFUTATION` is the name fixed by the contract, and the statement satisfies it. But
     "dominance" is overloaded in r28: the pendant-path *leaf dominance* lemma is true. So the face must open by
     naming (HS), the leaf/slot dominance condition, and must state that pendant-path leaf dominance is not
     refuted.
   - `E993-R28-TREE-LEAF-SLOT-DOMINANCE` keeps its name. It is a statement name, and its status carries
     REFUTED.
   - The alias check over the 392 run-local claims found no key containing `R28`, `LEAF-SLOT` or `REFUTATION`.
     Its only `DOMINANCE` key is `E993-R25-CATALAN-DOMINANCE-RANK-R-MINUS-2`, a different object. There are no
     text hits for "leaf/slot", "slot dominance" or "R(d,m)". There is no collision.
8. **Fences.**
   - No status transfers anywhere (§3.1): nothing to NR1, FOREST, TREE or TRANSFER, `E993-R25-UNR-FOREST-WIDE`,
     `E993-G1WIDE-NO-SIZE-CAP`, `E993-BETA-AGG`, the aggregate, `E993-INTERIOR-ALPHA-MINUS-TWO-AGGREGATE` or
     Erdős #993.
   - (DL) is neither re-registered nor edited.
   - REFUTED never regresses.
   - Stop gate §5(b) conditions: the witness has exact counts, has been confirmed by at least two independent
     instruments (three at `C-F1-T`, three here), and has now had its isolated second read. That is satisfied.
     Recording the weakest surviving strengthening remains the controller's duty. On the witness, the summed
     (fractional) form, which is (DL) itself, holds with slack 84 at `k = 12` and 663 at `k = 11`.

## Registration text

**R1 — `E993-R28-DOMINANCE-REFUTATION`** (status **REFUTED**; register verbatim)

> *Statement.* The leaf/slot dominance condition (HS) of `SEMANTIC-CONTRACT.md` §2 is FALSE as a universal
> statement over finite trees. This covers both its threshold form and the equivalent matching form (HS-SDR).
> Here (HS) is the statement that `Σ_{v∈Br : c_v(k) ≥ t} (deg v − 2) ≤ #{ℓ ∈ L : c_ℓ(k) ≥ t}` for all `k` and all
> `t ≥ 1`. This refutes (HS) only. It does not refute pendant-path leaf dominance.
>
> *Witness `R(3,2)_3`, order 22.*
> - Edges: `0–1, 1–2, 2–3, 3–4, 1–5, 5–6, 6–7, 0–8, 8–9, 9–10, 10–11, 8–12, 12–13, 13–14, 0–15, 15–16, 16–17, 17–18, 15–19, 19–20, 20–21`.
>   This is a tree: 21 edges, connected and acyclic.
> - `Br = {0, 1, 8, 15}`, all of degree 3 (4 slots). `L = {4, 7, 11, 14, 18, 21}`.
> - `α = 13`, and `(i_k)_{k=0..13} = (1, 22, 210, 1144, 3933, 8907, 13470, 13529, 8856, 3691, 975, 171, 19, 1)`.
>   There are 54,929 independent sets.
> - At `k = 12`: `i_12 = 19`, `c_0(12) = 18`, `c_1(12) = c_8(12) = c_15(12) = 0`, and `c_ℓ(12) = 17` for all six
>   leaves.
> - At `t = 18`: `slots_{≥18}(12) = 1 > 0 = leaves_{≥18}(12)`. The maximum matching in `H_12` has size 3 < 4 slots.
> - The witness also fails at `k = 11`: there `c_0 = 141`, `c_1 = c_8 = c_15 = 4` and every `c_ℓ = 136`, so
>   (HS) fails for `t = 137..141`.
> - (HS) holds at every other `k`.
> - (DL) holds at every `k`. For example, `D_12 = 372 ≤ 456` and `D_11 = 3099 ≤ 3762`.
>
> *Family.* Fix `d ≥ 3` and `m ≥ 2`. Let `R(d,m)` be the tree with root `r` and children `b_1..b_d`, where each
> `b_i` carries `m` pendant paths `b_i–x–y–ℓ` of three edges. Then:
> - `n = 1 + d(1+3m)`;
> - `α = 2dm + 1`, with a unique maximum independent set;
> - at `k = α − 1 = 2dm`: `i_k = 3dm + 1`, `c_r(k) = 3dm`, `c_ℓ(k) = 3dm − 1` for every leaf, and `c_{b_i}(k) = 0`;
> - hence at `t = 3dm`: `slots_{≥t}(k) = d − 2 ≥ 1 > 0 = leaves_{≥t}(k)`.
>
> `R(3,2)` is the witness above. Both bounds are needed for this mechanism: for `d = 2` the root is not a branch
> vertex, and for `m = 1` the maximum set is not unique.
>
> *Minimality.* (HS) holds on every free tree of order ≤ 21. `R(3,2)_3` is the unique free tree of order 22 that
> violates (HS).

- **Grade.**
  - The family statement, with the witness as its `(3,2)` member: `proved_informal` (hand proof).
  - The witness: an exact finite computation, confirmed by six instruments. Three are the critic's (a DP,
    brute-force enumeration, and F1's DP). Three are the second reader's (a `2^22` brute force, a rerooting DP,
    and a deletion recursion).
  - The family's closed forms were also computed for `d = 3..6`, `m = 2..5`.
  - Minimality to order 21: `bounded_computation`. Two exhaustive instruments at order 21 (2,144,505 classes;
    32,100,522 `(T,k)` instances). Three instruments at orders ≤ 20.
  - Uniqueness at order 22: `bounded_computation`, **one instrument** (5,623,756 classes; exactly one failing
    class).
- **Attribution.**
  - The counterexample, the family `R(d,m)` and its proof: r28 critic `C-F1-T` (Claude Opus 5, medium, Stage 4,
    on F1).
  - The pointer to the shape: F1 (Remaining obligation 4).
  - The condition (HS) and its mechanism: r27 `C-T2-U`.
  - Minimality at order 21: `C-F1-T` and `SR-HS-REF`.
  - Uniqueness at order 22, and this second read: `SR-HS-REF`.
  - (DL): Fang–Lu–Nevo–Yao–Zheng 2026 §8, formally verified in r27. Hall: classical (Mathlib).
- **Fences.**
  - This transfers no status anywhere (§3.1).
  - (DL) `E993-R27-FOREST-DEGREE-LEMMA` stays `formally_verified`, and its face is untouched.
  - It does not refute (LC), (FC), the SDR/threshold equivalence, the pendant-path leaf dominance lemma or
    Theorem BTP.
  - (PW) is not a premise.
  - REFUTED never regresses.
  - Any conjecture that implies (HS-SDR) on trees is refuted by the same witness, including the Rooted Export
    Conjecture and "(HS) for connected graphs with `|E| ≤ n`".

**R2 — scope note on `E993-R28-TREE-LEAF-SLOT-DOMINANCE`** (status **REFUTED** as a universal statement; register verbatim)

> REFUTED as a universal statement over finite trees by `E993-R28-DOMINANCE-REFUTATION`. The witness is
> `R(3,2)_3`, order 22, at `k = 12`, `t = 18`, where `c_0 = 18` and every leaf has `c = 17`. The family is
> `R(d,m)`, `d ≥ 3`, `m ≥ 2`. The matching form (HS-SDR) fails with it.
>
> The statement holds on every free tree of order ≤ 21 (`bounded_computation`, two exhaustive instruments at
> order 21). It holds on the class of trees whose branch tree has maximum degree ≤ 2 (Theorem BTP: `C-T2-U`
> Finding 2 and `C-F2-T` Finding 2, via Lemma PP). That class result is `proved_informal` **only after its own
> isolated second read**. `SR-HS-REF` did not second-read it.
>
> The class bound is sharp in the branch-degree parameter: the witness's branch tree is `K_{1,3}`, with maximum
> degree 3.
>
> The Lean target `tree_leaf_slot_dominance` (`SOLUTION-CONTRACT.md` §2) is false and is withdrawn. (LC)
> `dominance_implies_degree_lemma` remains a valid implication, with a hypothesis that is false on the witness at
> `k ∈ {11, 12}`.
>
> Attribution: r27 `C-T2-U` (statement), r28 `C-F1-T` (refutation), `SR-HS-REF` (second read). Fences: §3.1; (DL)
> untouched.

**R3 — scope-note record on `E993-R27-TREE-LEAF-BRANCH-REFORMULATION-ORDER-GE-2`** (a new record; the sealed face
is not edited)

> r28 note: the "Hall/SDR sufficient condition (C-T2-U Step C)" that this key's scope describes as OPEN is REFUTED.
> See `E993-R28-DOMINANCE-REFUTATION`, witness `R(3,2)_3`, order 22. The reformulation itself is unaffected: the
> identity, the biconditional and the slot count `|L| − 2` all hold on the witness at every `k`. The status of
> this key does not change.

**R4 — horizon note for `E993-R28-DOMINANCE-CENSUS`** (`bounded_computation`)

> The threshold form of (HS) holds on every free tree of order ≤ 21.
> - Orders 2–20: 1,346,023 classes; 18,811,562 `(T,k)` instances, `k = 0..α+1`; three instruments (F1, `C-F1-T`
>   and `SR-HS-REF`).
> - Order 21: 2,144,505 classes; 32,100,522 instances; two instruments (`C-F1-T` and `SR-HS-REF`); 0 failures.
> - Order 22: exhaustive on one instrument (`SR-HS-REF`); 5,623,756 classes; exactly one failing class,
>   `R(3,2)_3`, at `k ∈ {11, 12}`.
> - Top-of-ladder ties with `slots_{≥t} = leaves_{≥t} ≥ 1` (non-failing `(T, k)`): 3, 2, 24 and 21 at orders
>   19, 20, 21 and 22, and none below order 19.
>
> This is a horizon record, never a grade for (HS).

## Verdicts

verdict[HR-1]: confirmed
verdict[HR-2]: confirmed
verdict[HR-3]: confirmed_with_repairs
verdict[HR-4]: confirmed_with_repairs

- `HR-3` repair: minimality now rests on two exhaustive instruments at order 21, and the uniqueness at order 22 is
  added on one instrument. Both are `bounded_computation`.
- `HR-4` repairs:
  - BTP's grade is conditional on its own second read.
  - REC and the `|E| ≤ n` conjecture are added as refuted casualties.
  - The R1 face must name (HS) explicitly, because "dominance" is overloaded.
  - The r27 reformulation needs the scope-note record R3.

## Artifact inventory

All paths are under
`/Users/ashtonsperry/VerityOS/experiments/erdos-993-degree-lemma-hall-sdr-dre-2026-09-24/scratchpad/c1-sr-SR-HS-REF/`.

| File | Role | SHA-256 |
|---|---|---|
| `seal_check.py` | seal and 85-member digest check | `585fad47c797088eb19ef809200bc52adbba50e1b6f988cbe32740117860e739` |
| `sr_lib.py` | instrument library (enumerator, DP, brute force, deletion recursion, threshold, matching) | `9ecd66f04961c468798e21b8bd332b02a1ef9205e9ead24d6e04a03d3568176c` |
| `sr_validate.py` / `validate.out` | validation (final library) | `c67f5d84b3d30550ce4738dfe2374989a183a054762a178f572311ab0431cc81` / `86ef0f72e22c5b2aa42a7603a0bcb805789f3f5d938e7d90ca55de82233f4cb4` |
| `sr_t22.py` / `t22.out` / `t22_result.json` | HR-1 and HR-4 on the witness | `3b3d6b207a69983a0a547a6ade4b56b4f4dee418a4d9808bdc98096bdbaa891b` / `110bab8a62df55180889c8878e703ce694af6703e7521d1507cc09faa411d23c` / `d367958f31adee80d423799687ab1d1a619ded1a9749b13d4cc089caf4230d92` |
| `sr_family.py` / `family.out` / `family_result.json` | HR-2 | `9760f7301cd3317d018d4fa02216b9682ac7d43a1d83f95871387a3d90c28994` / `0ec6f747c4e87672d922c932f7a3635258d2d62454820ba3b34799e5e8457d3c` / `847c5982d3ccb50000b7948b32fdc187a5056905d182e9adfa5423611c99c9b2` |
| `sr_census.py` | HR-3 census worker | `b50b327001860dda24654762a93e188b7001d3739ba6da89f05bc52c38feb70b` |
| `census_2_20.out` | run log, orders 2–20 | `253a61ca0788ca8bd684029f1a42532daa2ffc00375421949a3a29f313c90fd6` |
| `census_21.out` | run log, order 21 | `8416f4b0c17af9e6f23c2cb4ea60bd2f8e7c1b32e703a2995dd5729d930d0257` |
| `census_22_w0.out` / `census_22_w1.out` | run logs, order 22 halves | `7fb750ade9a451a824da58170584c3539609292fe5e6070fd02fbeaefff1902d` / `1285cfae440b1ddc633ba29c44f764c899d9164be22240ba24e2b7610a711d9a` |
| `census_n21_W1_w0.json` | order-21 result | `807af56c35c2a852c1227becfa4e2d89f7267c7306af458542678e635cabd912` |
| `census_n22_W2_w0.json` / `census_n22_W2_w1.json` | order-22 halves (w1 holds the failure records) | `0679d08877bbf3b4311169a4e06c7c0edfea4c072117c935da7724677a4371e2` / `5cd9a3d6528a08186df27a87863b7817a93275d63b99f5b8009a7ca78d15a193` |
| `census_n{2..20}_W1_w0.json` | per-order results, orders 2–20 | listed by `shasum -a 256` in the scratch directory |
| `sr_summary.py` / `summary.out` / `census_summary.json` | merge, reformulation and layer-cake checks | `4fab5952b02b1c86246707658c73629f84ce44603649e7475d6d9bc9772b8038` / `bb01160c3fdf52bb89a492c45662f1dd5eb34dbb1865164fd3bd8d62ad1ca8b6` / `abfb7298fa35cce25f07f4e753e1d4df8ffa009be2bb815d94b7055899e28cc9` |

- No sealed member was edited. The only other file written is this `SECOND-READ.md`.
- Processes: literal PIDs 31354 (wrapper shell) and 31357 (orphaned python child) were killed. Both belonged to my
  own harness-backgrounded `sr_family.py` run. No process of mine is running.
- Every other computation ran in the foreground.
