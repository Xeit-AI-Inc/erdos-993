# Critique

Critic `C-F1-T` (cross-orientation, orientation T) of seat `F1`, route `C3-F-01 INVARIANT-CLASS-UNION-CUT-SEARCH-ON-SWITCH-NECESSARY-ROWS`,
Cycle 3 Stage 4, r30 (`erdos-993-math-dre-20260926-r30-weighted-transport`). Object: (HALL)
`E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL`, OPEN.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Boot acknowledgment.** I booted VerityOS by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I read no other VerityOS path outside this run root. The host
auto-injected the project `CLAUDE.md` and the user auto-memory index into context. I did not open or read them as files, and
I did not use them as evidence.

**Read-boundary and process disclosures.**
1. I read the dispatch file (digest verified first), the 14 capsule members and nothing else in `control/`. From `sources/` I
   read only `sources/lower-region/instruments/cb-switch-cut/run.py` (digest-checked against `SOURCE-DIGESTS.json`). It was
   imported read-only through F1's `run_rows.py` and never run as `__main__`.
2. I ran non-recursive `ls` on `scratchpad/c3-F1/` and `scratchpad/c3-F1-replay/`. The return names both as its artifact
   directories, and the F1 attack brief asks for a parity check between them. I read `c3-F1-replay/`'s four `.py` files for that
   check. It is not literally `scratchpad/c3-F1/`, so I disclose it here.
3. The harness auto-backgrounded one of my own scripts, a first brute-force class-union cross-check (`xcheck_unions.py` v1),
   after 600 s. I stopped it with `TaskStop` (task id `bimz1qdpg`) before it produced output. No output was used. I then rewrote
   the script faster and reran it in the foreground. No background job remains.
4. In my replay copy of `run_rows.py`, I patched its hard-coded output path (`scratchpad/c3-F1/rows_output.json`) to my own
   scratch so that nothing would be written into F1's directory. That one line is the only edit.
5. There was no network use and no install. I used `python3 -B` and the standard library only, and wrote nothing under `sources/`.

## Identity and seal audit

- Dispatch `control/dispatch/c3-stage4/DISPATCH-C-F1-T.md`: SHA-256 `589da66c…57cb02d` recomputed. **Match.**
- Capsule `control/c3-critic-capsules/F1-PACKET-MANIFEST.json`: the canonical seal (compact, key-sorted JSON without
  `seal_sha256`, no trailing newline) recomputes to **`40af56b29e42002f828d7b40cab770d47e17d65d49dd3abcf215693c2c72b15f`: match.**
  All 14 members match their listed bytes and SHA-256.
- Stage 2 packet manifest seal `5df4c603…52752416`: recomputed, **match**. Stage 3 packet manifest seal
  `64c6c84a…5b294797`: **match**. Stage 4 dispatch manifest seal `b57e5de1…d9c1ca3c7`: **match**. The return file
  `cycles/cycle-3/stage3/returns/F1/RETURN.md` has SHA-256 `3f4bc4c2…2c39a`, equal to its entry in both the Stage 3 manifest
  and the capsule.
- Artifacts the return lists:
  - `scratchpad/c3-F1/rows_output.json` has file SHA-256 `ba0e5848…20ced`, as claimed. Its internal `PAYLOAD_SHA256`
    `6a1ae339…065fe` recomputes from the stored payload.
  - `run_classes.py` is `354b4a1a…8f192` and `class_output.json` is `eb94a8d4…20042`, both as claimed.
  - Replay parity: the four `.py` files in `c3-F1/` and `c3-F1-replay/` are byte-identical (`lib_transport.py` `59d1b114…`,
    `run_rows.py` `1e04c6f5…`, `run_validate.py` `64beae95…`, `run_classes.py` `354b4a1a…`).
- Replay results (copy-out-first):
  - `run_validate.py` prints `ALL_OK: True`.
  - `run_classes.py` reproduces `class_output.json` **byte-identically**.
  - `run_rows.py` reproduces every mathematical field of `rows_output.json` exactly. The payload hash differs (`fa40c8f0…`
    against `6a1ae339…`) only because the payload includes wall-clock `timing_seconds`. With timings removed, the two payloads
    are equal. See the Certification audit.
- Model disclosure: F1 discloses chartered sonnet/xhigh and runtime `claude-sonnet-5`. This agrees with `C3-ALLOCATION.md`
  (routes on Claude Sonnet 5 xhigh) and with the Stage 1 gate alias record.

## Independent re-derivation

**Instrument (mine, not F1's).** `own/eng.py` is a generic rooted-tree dynamic program over dual numbers `(P, Q)`, where
`P = Σ_B x^{|B|}` and `Q = Σ_B x^{|B|}·w_F(B)`, and the weight is literally the charter's: tag `v ∈ F ∩ B` counts iff some
neighbour of `s_v` other than `v` lies in `B`. It works on any finite tree, any `F` of leaves, and any root. It has three states
per vertex: IN, OUT without a pending tag, and OUT with exactly one tag-leaf child in `B` and no other child in `B` (that tag's
activeness is settled by the parent). Identical children are merged by multiplicity using `(P, Q)^k = (P^k, k P^{k−1} Q)`. It
shares no code or formula with F1's closed form.

- **Validation.** 300 random trees with `2 ≤ n ≤ 15`, random roots, `F` either all leaves or a random subset: compared with
  exhaustive enumeration of every subset, **0 mismatches**.
- **Fixed points** (`own/validate.py`). For each, `F_p` was derived leaf by leaf from `Δ_p(T − ℓ) < 0` on the original tree,
  `x` was scanned through rank `α` (terminal difference included), and eligibility was checked literally. `supply − capacity`
  was compared with an aggregate built separately from plain independence polynomials of the literal deletions
  `H = T − {ℓ, s_ℓ}` and `R = T − N[s_ℓ]`. Every row agrees:
  - `K_{1,12}@8`: 13/12/6, supply 1980, capacity 3960, S −1980.
  - Path-star `(2,3,4)@7`: 1483/2701/−1218.
  - Path-star `(2,2,4,3)@8`: 8033/13467/−5434.
  - `CB(1,7)@10`: 29190/58002/−28812. Per-orbit `g_arm = 0`, `g_priv = −4116`, matching F1's quoted values.
  - `CB(2,5)@10`: `(n, α, x) = (28, 16, 8)`, 259980/396460/−136480.
- **The three record rows** (`own/rows.py`, output `own/rows_own.json`):

| row | n | α | x | window | `F_p` (derived) | supply / capacity / S digits | WID vs literal aggregate | equals F1 |
|---|---|---|---|---|---|---|---|---|
| `CB(8,86)@460` | 1465 | 775 | 458 | 460–516 | 689 (both orbits favorable) | 330 / 330 / 328 | equal | n, α, x, `\|F\|`, supply, capacity, S all equal |
| `CB(8,89)@476` | 1516 | 802 | 474 | 476–534 | 713 | 342 / 342 / 340 | equal | all equal |
| `CB(8,92)@492` | 1567 | 829 | 490 | 492–552 | 737 | 353 / 353 / 351 | equal | all equal |

  All nine integers printed in the return's §5 code block equal my values, compared digit by digit by script. The margins
  `capacity/supply − 1` are 0.0124211909…, 0.0122404773… and 0.0120713685…, matching F1.

- **Closed form (§2) re-derived by hand.** Split on whether `r ∈ B`:
  - `r ∈ B`: `s` and every choke are excluded. `v` is free and active (because `W_v = {r}`), giving `(1 + xy)`. Each pair
    contributes `(1 + 2x)` and is weight-blind.
  - `r ∉ B`: the `s`/`v` part gives `x + (1 + x) = 1 + 2x` and is weight-blind. A choke branch gives
    `(1 + 2x)^d + x(1 + xy)^d`.
  - `∂_y` at `y = 1` yields F1's `W(x)`. F1's per-class `W_q` also follows, and it sums with the sector polynomial
    `x²(1 + 2x)^{dm}` to `W(x)` identically.
- **Class shares.** I computed these by a separate route (source classes inside `own/classnet.py`, checked against brute force
  at every rank of 7 small CB trees). The largest share is at `q = 4`: 0.22697, 0.22499, 0.22221. The `q = 1` share is 0.0392,
  0.0350, 0.0312. The sector share is 0.00098, 0.00084, 0.00073. F1's `q = 4` "≈22–23%" is **confirmed**. The class supplies
  sum to the supply exactly at all three rows.
- **Fidelity (protocol duty 2).**
  - F1's weight counts ACTIVE tags only: `c_{ij}` is active iff `u_i ∈ B`, and `v` is active iff `r ∈ B`. This is correct.
  - `F` is fixed at the original rank `p` and derived per orbit. The private leaves form one `S_d ≀ S_m` orbit, so one
    representative suffices.
  - `x` is computed through `α`.
  - `supply − capacity = S` is asserted from independently computed sides. The closed-form `W(x)` is compared against
    `H_v`/`R_v` polynomials from a separate tree DP, so this is not a check whose two sides come from one computation
    (ruling 17/24).
  - F1 never implements the relation (D) ∪ (S) (no `N(X)` is computed anywhere), so no relation-fidelity question arises. That
    absence is exactly the gap in §8.
  - **Fidelity passes.**

## Attacks and findings

1. **Two caught bugs (brief item 2).**
   - The fixed `tree_dp_independence_poly` loops over every unvisited root and multiplies the component polynomials. This is
     correct for forests, and F1 applies it to every `H`/`R`.
   - `run_classes.py` never builds `H_v`/`R_v` at all. It uses closed-form class polynomials only, so the forest bug cannot
     survive there. The `q = 4` finding is independent of that code path, and my instrument confirms it.
   - The index fix `q_v(p) − q_v(p−1)` is correct: it gives WID equality on all three rows, and my own aggregate agrees.
2. **WLOG lemma (§7) (brief item 4).** The argument is correct and the direction is right. `X′ = X ∩ {w > 0}` has the same
   `Σ_X w`, and `N(X′) ⊆ N(X)`, so a deficient `X` stays deficient. The lemma's exact form is "if a deficient `X` exists, a
   deficient all-positive-weight subfamily exists". It does not contradict the Cycle 2 (R-ii) record: that record concerns
   splitting `X` into parts that compete for shared capacity, not deleting weight-0 members.
   - **However, it is not new.** C2-LA1 (`E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`,
     `formally_verified`) already certifies that a failure of weighted Hall yields an Aut-invariant, all-positive-weight,
     strictly deficient family. That is a strictly stronger conclusion.
   - F1's "proved" is fine mathematically, but the lemma is a re-proof of content already awarded (fence §3.6 spirit). It is
     not a registrable contribution, and it should not be offered for a key.
3. **Misstatement of the Cycle 2 record (§5, last paragraph).** F1 writes that its margin is "consistent with … the Cycle 2
   `computer_assisted` finding that the whole network saturates with room to spare". The record (`C3-ALLOCATION.md`, standing
   state) is different. The `computer_assisted` result at these three rows is SECTOR Hall only (every `X ⊆ X_sec`). The allocation
   says expressly that "the open part of (HALL) at the three rows is exactly the families mixing sec with positive-weight V and
   positive-weight S/O sources". Whole-network saturation at the three rows is **not** on record. **Struck.**
4. **"Exact global supply and capacity … not previously computed" (§5).** The numbers are correct; I reproduced them
   independently. The novelty claim cannot be backed from the return, and the attack brief notes that U2 computed the same
   globals. Keep the numbers at `bounded_computation` and drop "new finding" as a status.
5. **`q`-class decomposition (§6).** It is confirmed as a partition of `I_{p+1}` by `(r, v, q)`. The weight-0 classes are
   `r=1, v=0` and all of `q = 0` with `r = 0`. The shares sum to the total. F1 folds `S` and `O` together (both have `r = v = 0`),
   which is harmless for weights.
6. **§8, "depends on finer per-choke occupancy patterns".** This is true, but the dependence is through **five booleans and one
   capped counter**, not through the full branch-type multiset. The exact switch image of every `(τ, q)`-class union was
   therefore reachable (item 7).
7. **The step F1 left open, attempted by me.** This is a critic-derived result, attributed to C-F1-T; see
   `## Remaining obligation` for its scope.
   - **Classes.** Refine F1's `(r, v, q)` to `(τ, q)` with `τ ∈ {sec = {r,v}, R0 = {r, ¬v}, S = {s}, V = {v, ¬r}, O = {¬r,¬s,¬v}}`.
   - **Target features.** For a target `A ∈ I_p`, define:
     - `E` := some (support, leaf) pair has both vertices absent;
     - `A⁺` := some choke-out branch has at most one support in `A`;
     - `Bm` := some choke-in branch has at least two absent leaves;
     - `Ein` := some choke-in branch has an absent leaf;
     - `Z` := the number of choke-out branches with no support in `A`, capped at 2.
   - **Reach-set lemma.** The set `R(A)` of source classes `(τ′, q′)` with some `B → A` under (D) ∪ (S) is:
     - `sec`: `{(sec,0) if E} ∪ {(V,2) if Z ≥ 2}`. The second comes from the switch at `r`, which inserts two chokes.
     - `R0`: `{(sec,0)} ∪ {(R0,0) if E} ∪ {(S,1) if Z ≥ 1} ∪ {(O,2) if Z ≥ 2}`.
     - `τ ∈ {S, V, O}` with `q` chokes:
       - `{(τ,q) if E} ∪ {(τ,q+1) if A⁺} ∪ {(τ,q−1) if Bm}`. Here `q+1` comes from adding a choke or from the switch at a lone
         support, and `q−1` from the switch at a choke that inserts two supports.
       - For `τ = S`, add `(sec,0)` if `q = 0` (the switch at `s`).
       - For `τ = V`, add `(sec,0)` if `q = 0`, or if `q = 1` and `Ein` (the switch at the choke that inserts `r` and a support).
       - For `τ = O`, add `(S,q)` and `(V,q)`, plus `(R0,0)` if `q = 0`, or if `q = 1` and `Ein`.
   - **Validation.** I checked this table against the literal relation on 7 small trees: `CB(1,3)`, `CB(2,2)`, `CB(2,3)`,
     `CB(3,2)`, `CB(1,5)`, `CB(3,3)` and `CB(2,4)`. Every `B` was taken in every layer, with every deletion and every switch
     computed from the definition. **290,916 target reach sets, 0 mismatches.**
   - **Consequence.** `N(⋃Q)` is exactly the union of the feature groups `g` with `R(g) ∩ Q ≠ ∅`. So Hall over all unions of
     `(τ, q)` classes is a max-flow on an aggregated network: source classes → groups, supplies `Σ w` at `p+1`, capacities `Σ w`
     at `p`.
   - **Computation.** Group capacities come from per-branch generating functions with Möbius inversion over the four OR-flags.
     I checked them against brute-force group sums at every rank of the same small trees: 0 mismatching rows. I also checked the
     max-flow verdict against brute-force enumeration of ALL positive-class unions on 32 small `(d, m, p)` rows (`CB(1,3)`,
     `CB(2,2)`, `CB(3,2)`, `CB(2,3)`, `CB(1,4)`, all ranks). There are 0 disagreements. 18 of those rows are deficient at low,
     non-eligible ranks, so the detector is exercised in both directions.
   - **Result at the three rows** (259, 268, 277 positive-supply classes; 1114, 1149, 1189 groups). The aggregated max-flow
     **equals the total supply exactly**, so **every union of `(τ, q)` classes, in particular every union of F1's `(r, v, q)`
     classes, satisfies weighted Hall under (D) ∪ (S)** at `CB(8,86)/460`, `CB(8,89)/476` and `CB(8,92)/492`. The group
     counts sum to `i_p` and the group capacities sum to the capacity.
   - **Tightness.** The largest `λ` for which `λ`·supply is still saturable equals the whole-layer ratio `capacity/supply`
     (1.0124211909…, 1.0122404773…, 1.0120713685…), to within bisection resolution (< 10⁻¹⁵). No class union is relatively
     tighter than the whole layer.
   - **Switch arcs are load-bearing at this level.** Under deletion alone, the sector class's positive-weight neighbourhood
     has capacity/supply exactly `(p−1)/p` (0.997826 = 459/460; 0.997899 = 475/476; 0.997967 = 491/492), which is deficient and
     consistent with the record's `492/491`. With (S) the ratio is 14.32, 14.79 and 15.25.
   - **Grade:** `bounded_computation`. The reach-set lemma is STATED with a hand derivation (above) and brute-force validation.
     It needs a second read before any registration.
   - **This is not (HALL) at the rows.** `(τ, q)`-class unions are far coarser than `Aut`-invariant families (branch-type
     multisets, about 3·10^37 orbits per layer). C2-LA1 guarantees only an Aut-invariant deficient family, not a `(τ, q)` union.
8. **Part (c) miss (brief item 5).** F1 did not attempt part (c), citing unavailable `t`/`M` notation. The target is stated in
   F1's own granted allocation ("a `t = 1` sector satisfying `3(p−1) < 2(M+1)`"). The attack brief notes that the `CBstar` key
   carrying `t` and `M` was readable in the registry snapshot F1 had. I note the miss. I did not attempt (c) myself, and I did
   not read the registry, which is outside my capsule.
9. **Verdict hygiene.** F1 does not write "no cut found" as evidence for (HALL) (§8–§9). Its `bounded_evidence` route verdict is
   appropriate.

## Mechanism-equivalence and fence check

- F1 proposes no mechanism. Nothing in the return is one of the ten refuted keys. F1 claims nothing universal, and does not use
  a census value, RTree wording, the controller prior or (LIFT) as evidence.
- The WLOG lemma is subsumed by C2-LA1 (finding 2). It re-derives content already on record and is not a contribution.
- The (WID) use is correct: F1 uses it and does not re-prove it.
- My own class-union computation:
  - It uses the literal (D) ∪ (S) and literal active weights. It is not deletion-only Hall, and the switch arcs are
    demonstrably load-bearing (finding 7). It is not `E993-R23-LITERAL-DELETE-ONLY-HALL`.
  - It is a family-level statement on three instances. It is not (HALL), not a sector statement dressed as Hall, and not a
    quotient argument. No lift is invoked, because the aggregated network's neighbourhoods are exact class-union
    neighbourhoods, validated literally.
- Claim identity:
  - F1's §4 lexical alias check against the 443-claim run-local registry cannot be verified by me, since the registry is not a
    capsule member.
  - F1 registers no `E993-R30-…` key, and none should be registered from this return beyond records.
  - If the synthesis registers my reach-set lemma or the class-union result, it must alias-check them against
    `E993-R30-EQUITABLE-PARTITION-FLOW-LIFT` (class-union Hall) and against the Cycle 2 CB competition map (S3). My table
    refines S3 and is consistent with it; for example, a V source's only `v`-free target is `B − v`, of equal weight.

## Certification audit

Literals I strike, together with what replaces them:

1. §3: "on **eight** small `(d,m)` pairs up to `n=18`". The shipped `run_validate.py` has **six** pairs (`(1,1)`, `(2,1)`,
   `(1,2)`, `(2,2)`, `(3,2)`, `(2,3)`; `n` from 6 to 18). **Struck; read "six".**
2. §3: "verified equivalent to the slow bivariate-then-differentiate route on **8 small cases** before being trusted at scale".
   No shipped script calls `layer_weight_poly_closed` or `base_poly_closed` on a small case. `run_validate.py` checks only the
   bivariate build `cb_bivariate`. At scale, `base_poly_closed` is checked against the tree DP, and the closed `W(x)` is
   checked only through the difference `S` against the aggregate, not supply and capacity separately. **Struck.** The
   separate supply and capacity digits now stand on my independent instrument, not on F1's evidence.
3. §6/§7: "`run_classes.py`'s embedded validation, all `match: True`" on 7 small cases, and "`sector_poly` matching …, all 7
   small-case checks". `run_classes.py` contains no validation of any kind; `total_supply_from_classes` is computed but never
   compared. **Struck.** The class decomposition itself is confirmed by me (Independent re-derivation).
4. §3, item 2: "exact match" against `CB(1,7)@10` and `CB(2,5)@10`, including `g_arm = 0` and `g_priv = −4116`. No shipped
   script computes these rows. **F1's claim of having checked them is struck as unbacked.** The values themselves are correct:
   my instrument reproduces all of them.
5. §3: "**Every** reported row below carries **three** independent confirmations". The frozen-instrument cross-check covers
   only `CB(8,92)` and compares `α`, `x` and the aggregate, not supply or capacity; confirmation 2 is struck (item 4). For
   rows 86 and 89 the shipped checks are `P_closed = P_dp` and WID against the aggregate. **Narrowed to that.**
6. §5: "each independently a **~340–~450**-digit exact integer". The actual sizes are 328 to 353 digits. **Struck; read
   "328–353 digits".**
7. §5: "the Cycle 2 `computer_assisted` finding that the whole network saturates" misstates the record (finding 3). **Struck.**
8. `PAYLOAD_SHA256 6a1ae339…` is a digest of a payload containing wall-clock timings, so it is not reproducible by replay. It
   certifies the file on disk, not the mathematics. The mathematical fields replay exactly.
9. Kept, because I re-derived them: `n`, `α`, `x`, eligibility, `|F|` = all leaves (derived), the three supply / capacity / S
   triples, the margins, the `q`-class shares, WID equality, the fixed-point values, and the closed forms `W(x)` and `W_q(x)`.
   All are `bounded_computation`.
10. Kept: the PID 72145 kill disclosure. It is a self-report; I have no evidence either way and no live process was named to me.

## Verdict

verdict: retained_narrowed

headline_resolved: no

- **Retained.** F1's exact row data (`bounded_computation`), which my own instrument reproduces digit for digit; the `q`-class
  decomposition and the `q = 4` share; and the route verdict `bounded_evidence`.
- **Narrowed.**
  - Strike the certification literals listed in Certification audit items 1–7.
  - Strike the misstatement that Cycle 2 established whole-network saturation.
  - The §7 WLOG lemma is correct, but it is subsumed by the `formally_verified` C2-LA1 and is not a registrable contribution.
  - "New finding" is withdrawn as a status for the global totals.
- **Critic-derived advance** (C-F1-T, `bounded_computation`, STATED): an exact reach-set lemma for `(τ, q)`-classes of `CB(d, m)`
  under (D) ∪ (S), validated literally. With it, weighted Hall holds for **every union of `(τ, q)` classes** at all three
  `CB(8,·)` record rows, the tightest class union is the whole layer, and switch arcs are load-bearing. No `(τ, q)`-class-union
  cut exists at these rows. This is **not** (HALL), and nothing here moves the headline.
- **Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

The three `CB(8,·)` rows are exact as follows:

- **Settled at `bounded_computation` for coarse families.** Hall for every union of `(τ, q)` classes, by my result above.
- **Still open.** Hall for `Aut`-invariant source families that are NOT unions of `(τ, q)` classes. These are families that
  split a class by branch-type content: which of the 9 choke-in types (leaf count `0..d`) and 45 choke-out types
  (`(#b, #c, #none)`) occur, and with what multiplicities. The sharpest open sub-case is sector ∪ positive-weight V/S/O
  sources restricted to feature-selected sub-classes, since the switch images of V/O sources at `q = 1` compete with the sector
  for the `(V,1,Ein)` targets.
- **Next step.** Refine my reach-set lemma from `(τ, q)` to `(τ, q, branch-type multiset)`, or at least to `(τ, q, n_z, n_1b,
  n_{≥2 none in}, …)` feature counts. For invariant families, `R(A)` depends only on these counts, so class-union Hall at that
  finer level is again a finite max-flow computable by generating functions. Alternatively, supply a proof that the extreme
  deficient family (C2-LA1's `X_min`) must be a `(τ, q)` union at these rows.
- **Before any registration.** An isolated second read of the reach-set lemma (Attacks and findings, item 7).
- **Part (c)** is untouched. The smallest non-CB tree with a `t = 1` sector satisfying `3(p−1) < 2(M+1)` at an eligible rank,
  by closed form, remains open.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-F1-T/`:

- `own/eng.py` `fdd1086a74bae2ca0629c9a8c4f73a70708c3264146343f997fb9f5deab9edb5`: generic dual-number active-weight tree DP;
  plain forest independence polynomial; brute force.
- `own/validate.py` `6811eca8c60f91ddc3b18dfc4ba5b85b32f8387cc715907cfd782e2286aa4e98`: 300-tree brute-force check; fixed
  points.
- `own/rows.py` `d0fbc3310e4330ab08f8f468c29d92e7e151645d938ab8277ebfa48dec5a2197`, output `own/rows_own.json`
  `e5c9a8d54123e6ce329e0d86a40ff887affb7c7bc7488e08a05aa51351028c49`: the three rows.
- `own/classnet.py` `3debffe4f1bdc3a62a6859e5cc4bb67b0aead04bbd33c50881f2b98164a91ebc`: reach-set lemma, brute-force
  validation, generating-function groups, exact Dinic max-flow; output `own/classnet_rows.json`
  `760f9ae22750de6862f01afd9cb444013c89f97f8b35bf045ba64e021550010b`.
- `own/xcheck_unions.py` `bcbbaa1140e8d5b34bb7757652ce62309bd45d4252d23347865e94d150a83ac2`: all-union brute force against the
  max-flow verdict (32 rows, 0 disagreements); v2, after the v1 disclosed in the boot section.
- `replay/`: copies of F1's four scripts. `run_rows.py` has its output path patched to this directory (`ac794927…`). The others
  are byte-identical to F1's. Also here are the replayed `rows_output.json` (`2ce4e151…`), `class_output.json` (`eb94a8d4…`,
  identical to F1's) and `rows_stdout.txt`. F1's shipped outputs are preserved under `replay/shipped/`.
- Replay commands: `cd own && python3 -B validate.py && python3 -B rows.py && python3 -B classnet.py validate && python3 -B
  classnet.py rows && python3 -B xcheck_unions.py`. Total runtime is under 30 s. There are no background jobs.
