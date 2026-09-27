# Critique

Critic `C-T2-U` (orientation U, formal/structural), Cycle 3 Stage 4, r30 (Erdős #993, weighted mixed-boundary transport).
Assigned return: seat `T2`, route `C3-T-02 GENERAL-SECTOR-SELF-COVERING` (orientation T).
Date 2026-09-26.

Boot acknowledgment: I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` for the boot, and then read the sealed dispatch
`control/dispatch/c3-stage4/DISPATCH-C-T2-U.md` (after checking its digest), the critic protocol, the capsule
manifest, and only the capsule members. I read no other VerityOS subsystem (memory, decisions, logs, conversations,
modules, skills).

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

- **Dispatch digest.** SHA-256 of `DISPATCH-C-T2-U.md` = `7bdc297e0ec17ee3eacc654333d655181930172291c6cd3c72f49bb2930649a2`, which **matches**
  the wrapper's value. The dispatch file is not a member of the Stage 4 dispatch manifest, so this digest is bound
  only by the wrapper.
- **Capsule seal (recomputed canonically: key-sorted compact JSON without `seal_sha256`, no trailing newline):**
  `083892f8a68c26f59c23f1fda93341f411ef3f2655eabc05d156d62cd840c9eb`, which **matches**. All 14 capsule members match their listed SHA-256
  and byte counts.
- **Stage 2 seal** `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416` **matches** (1,051 members; canonical JSON
  229,980 bytes, the same as the return's literals). **Stage 3 seal** `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797`
  **matches**, and its manifest lists `returns/T2/RETURN.md` at `b3256e40…`, the same digest as in the capsule. **Stage 4 dispatch seal**
  `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7` **matches**.
- **The return's digests.** The return cites `CLAIM-DISTINCTIONS.json` `7327b0ae…`, `CLAIM-IDENTITY.run-local.json`
  `b8f3c2a1…`, `RESIDUE-CHECK.json` `281ddd08…` and `SOURCE-DIGESTS.json` `e82494df…`. All of these equal the
  Stage 2 manifest entries. I checked the manifest side only: I did not hash the first three files, because they
  are not capsule members. All 8 script digests and 5 output digests in the return's replay table match the files in
  `scratchpad/c3-T2/`.
- **Uninventoried file.** `scratchpad/c3-T2/` also holds `debug_r1.py` (`14072695…`), which the return does not
  list. Nothing in the return depends on it. I did not run it.
- **Model and process disclosures.** The return discloses `claude-sonnet-5` (chartered sonnet/xhigh), and its
  read-boundary disclosure (one non-recursive `ls scratchpad/`) matches `C3-STAGE3-READ-BOUNDARY-DISCLOSURES.json`.
  I replayed the return copy-out-first into `scratchpad/c3-crit-T2-U/replay/` with `python3 -B`. All five outputs
  are **byte-identical** (`cmp`).
- **Replay-isolation defect (process).** T2's scripts hard-code
  `sys.path.insert(0, ".../scratchpad/c3-T2")`. A "copy-out-first" replay therefore still imports `gsc_lib`, and in
  `theorem_g2g3_check.py` also `theorem_g1_check`, from the **original** directory. The imported files are
  byte-identical, so no number changes. However, the return's statement that it re-ran everything "from the copy" is
  not literally true.

## Independent re-derivation

**Own instrument.** `scratchpad/c3-crit-T2-U/own/crit_lib.py` shares no code with `c3-T2/`. It provides:

- a tree builder with separate BFS-connectivity and DSU-acyclicity checks;
- a forest independence-polynomial DP on `T − D`;
- `x` through rank `α`, including the terminal zero-extension difference;
- `F_p` derived from `Δ_p(T − v)` on the original tree;
- `S` from `q_v(j) = i_j(H_v) − i_j(R_v)`, computed by polynomial DP;
- brute-force layers `I_j`, literal `w_F`, and literal (D) and (S) targets;
- Dinic max-flow, with max-deficiency computed as `w(Y) − maxflow(Y)`.

Supply and capacity come from enumeration, and `S` comes from the DP. These are independent sides.

**Fixed points reproduced before any other use.**
- `K_{1,12}`/8 (13, 12, 6): |F| 12, 1980 / 3960, `S = −1980`, full-network deficit 0.
- Path-star `(2,3,4)`/7 (15, 11, 5): |F| 10, 1483 / 2701, `S = −1218`, flow 1483.
- Path-star `(2,2,4,3)`/8 (18, 13, 6): |F| 12, 8033 / 13467, `S = −5434`, flow 8033.
- `CB(8,92)`: `n = 1567`, `α = 829`, `x = 490`, eligible `[492, 552]`, `|R_491|/|R_490| = 492/491`.
- `Δ_0 = n − 1` and `i_2` checked.

The `T_m` fixed point is **not reproduced**: `T_m`'s construction is not in my capsule. The arc counts (2025, 11691)
were not recomputed.

**Fidelity of the return's instruments (duty 2, checked first).**
1. `w_F` in `gsc_lib.w_F` is literal: it counts active tags with `W_v = N(s_v) ∖ {v}` and a generic support. It
   passes.
2. The relation is literal (D) plus (S). `switch_targets` requires exactly two neighbours in `B`. It passes, but the
   G1 and G3 flows use deletion arcs only, which is what those theorems are about.
3. **`F` is hard-coded, not derived, in every G1 and G3 instance** (`F = P | F_extra`). This is legitimate for a
   lemma stated for a general A4-compliant `F`. It contradicts §0's "`F := F_p(T)`" and the shared rule
   "`F_p` DERIVED on every row".
4. **No generator computes `S` or asserts `supply − capacity = S`.** The return's sentence "(WID) … asserted on every
   generator's own instances via the literal active-tag weight, independently on both sides where a generator
   computes it" is **false** and is struck.
5. **No eligibility is checked in `theorem_g1_check.py` or `o3_shadow_experiment.py`.** I checked the 9 §6 shadow
   configurations: all 6 distinct trees `CB(2,2)`, `CB(2,3)`, `CB(2,4)`, `CB(3,2)` and so on have **empty
   eligibility** (for example `CB(2,4)`: `n = 23`, `α = 13`, `x = 7`, and no `p` satisfies both `p ≥ 9` and
   `3p < 27`).
6. `x` in `theorem_g2g3_check.py` is computed through rank `α`, so this check passes. The upper eligibility bound is
   not checked there.

**Propositions 1 and 2, re-derived.** Prop 2, `w(B ∖ q) = w(B) − κ_q`, is correct. Its only needs are:
- star-forest witnesses never lie in `Q`, because the attachment vertex lies in `N(Q)`;
- A4.

Prop 1, the weight formula `β + Σ g(ℓ_i)`, needs **an unstated hypothesis `P ⊆ F`** (every star leaf is a tag). The
proof's "every one of them counts" silently assumes it. The return text never states `P ⊆ F`; only the script
docstring does. On every eligible row I computed, `F_p` = all leaves, so the hypothesis holds there. It remains a
hypothesis. The §0 justification "unique attachment edge because a connected subgraph of a tree meets the rest in
exactly one edge" is **false** as stated: a component of `T − N[Q]` can meet a disconnected `N[Q]` in several edges,
as with the path `a–x–c–y–b` and `Q = {a, b}`. Prop 1 survives, because extra attachments at a centre are
`N(Q)`-vertices absent from every sector member. The justification is struck.

**Theorem G1 (reduction to `R*`), re-derived.** It is correct. The `Q`-exits are pairwise distinct across `q`,
injective in `B`, and disjoint from `∂_sec`. So `φ(X) = Σ_B[(1 − |Q|)w(B) + K] − w(∂_sec X)`. Removing any
`B_0` with `w(B_0) ≥ W*` does not decrease `φ`. G1 needs only Prop 2's hypotheses; it does not need `P ⊆ F`.

My own check covers 21 rows on 4 heterogeneous `CBstar` trees plus 5 rows on the `|Q| = 3` tree (`g1_tests.py`),
at every sector rank. Computed independently by max-flow, `max_{X ⊆ sec} φ = max_{X ⊆ R*} φ` holds on all rows. (The return
never computes the `R*` side: its docstring item (iii) is not implemented.)

**Critic lemma L1 (collapse of G1's generality; attributed to C-T2-U).** Assume A4 and `T ≠ K_2, P_3`. Then:
- `F_Q ⊆ Q`: a favorable leaf in `N(Q)` hangs off some `q ∈ Q`, and its `W_v = N(q) ∖ {v}` misses `Q`.
- Every `F_Q` tag lies in every sector member, and is active there.
- Hence `w(B) ≥ β` on the sector, and `K ≤ 2β`: each tag adds 1 to `κ_v`, and at most 1 more if `W_v` is a
  singleton.

Therefore:
- `|Q| ≥ 3` gives `W* = K/(|Q| − 1) ≤ β`, so `R* = ∅` and no sector subfamily is deletion-deficient, at **any** rank.
- `|Q| = 2` with `β = 0` gives `R* = ∅`.
- `|Q| = 2` with `β = 2` forces `T = P_3`.
- `|Q| = 2`, `β = 1`, `K = 1` gives `R* = ∅`.
- `|Q| = 1` gives `F_Q = ∅`, so `φ ≤ 0`.

**So a nonempty residual occurs exactly when `Q = {r, v}`, `v ∈ F` is a leaf, and `N(s_v) = {v, r}`** (a pendant
`P_3` arm; `K = 2`, `W* = 2`, `R* = {w = 1}`). The rest of `T` is then forced: `T − N[Q]` is a star forest hanging
off the chokes `N(r) ∖ {s}`, with H-attach. **The live class of G1 is exactly heterogeneous `CBstar`** (arbitrary
`d_j`, arbitrary `t_c ≥ 1`), not "arbitrary tree, arbitrary `Q`". My `|Q| = 3` test tree has `R* = ∅` at every rank,
as L1 predicts. Grade: `proved_informal`, STATED at a review stage, so it needs a second read.

**Critic Proposition L2 (exact heterogeneous max deficit; attributed to C-T2-U).** In the live class with
`P ⊆ F`, let `q_i = t_i + 1`. At source rank `p + 1` (local rank `k = p − 1`):

```
max_{X ⊆ sector} [Σ_X w_F − Σ_{N_D(X)} w_F] = max(0, e_k(q) − e_{k−1}(q)),
```

where `e_k` is the elementary symmetric polynomial.

*Proof.* By G1 and L1, `φ(X) = |X| − |∂X|` on `X ⊆ R*_k`, and `R*_k` is layer `k` of the product of claws
`C_{q_1} × … × C_{q_M}`, with `|R*_k| = e_k(q)`. If that product has the normalized-matching (NM) property, then
`|∂X| ≥ |X|·e_{k−1}/e_k`. So `|X| − |∂X| ≤ max(0, e_k − e_{k−1})`, with equality at the full layer or at `∅`.

NM for products of claws is the classical Harper / Hsieh–Kleitman product theorem: products of NM posets with
log-concave Whitney numbers are NM, and a claw's `(1, q)` qualifies. I cite it from knowledge and did **not** read it;
external sources are fenced. L2 is therefore `proved_informal` **conditional on that citation**, and needs a second
read.

Bounded confirmation:
- NM verified by exact integral max-flow on 6 heterogeneous `q`-tuples at every `k` (`nm_claws.py`).
- On `(2,3,2)`, an exhaustive minimum shadow ratio exactly equals `e_{k−1}/e_k`.
- On all 21 tree rows, L2 equals the brute-force max-flow deficit. This includes T2's heterogeneous fixed point 2,
  whose deficits 11, 35, 13 are `e_1 − e_0`, `e_2 − e_1`, `e_3 − e_2` of `(3,4,5)`.

L2 **closes the return's Remaining obligation 2**, modulo the NM citation. At uniform `q` it is the registered
`CBSTAR` formula.

**Theorem G3, re-derived.**
- **Proof defect.** The return rearranges G2b's threshold `k ≥ (Q_tot + q)/(1 + q)` against `4k ≥ |Q| + Q_tot`.
  Done correctly, the sufficient condition is `|Q|(1 + q) − 4q ≥ Q_tot(3 − q)`, **not** `|Q|(1 + q) + 4 ≥ …`. At
  `|Q| = 2`, `q = 3`, which is L1's only live case, the correct condition reads `−4 ≥ 0`, which is **false**. As
  written, the proof does not establish G3 at its own boundary.
- **Critic repair.** `n = |N[Q]| + Q_tot` with `|N[Q]| ≥ 3` (`r`, `s`, `v`), and `k ≥ x ≥ n/4` by (LB). The
  condition becomes `(1 + q)(3 + Q_tot) ≥ 4(Q_tot + q)`, which is `(q − 3)(Q_tot − 1) ≥ 0`. That is true for every
  `q_min ≥ 3`, and using `k = p − 1 ≥ x + 1` adds slack.
- **Verdict on G3.** G3 holds, `proved_informal` **after this repair**, on the live class, with `P ⊆ F` and A4
  stated. Via L2 it is equivalent to `e_{p−1}(q) ≤ e_{p−2}(q)` at eligible `p`.
- **End-to-end check off by one.** `g3_main` builds the sector from `independent_sets_of_size(p_elig)` with
  `p_elig = x + 2 = 10`. Those are sources of size `p`, i.e. the network at rank 9, which is **not eligible**. The
  eligible network `p = 10` has sources of size 11.
- **Corrected by me.** On T2's tree (`n = 23`, `α = 16`, `x = 8`, eligible `[10]`), `F_10` is derived and equals all
  13 leaves, including `v`. `WID` gives 74154 − 127390 = −53236 = `S`. The size-11 sector has **404** members, sector
  supply 3368, and deletion deficit 0. So G3 holds at the eligible rank; T2's "1,066 members, supply 7,306" belong
  to rank 9.
- **Further eligible rows (all deficit 0; `F` = all leaves; `WID` asserted).** Three more heterogeneous `t ≥ 2`
  trees: `n = 17` at `p = 7`, `n = 16` at `p = 7`, and `n = 20` at `p = 9` (`g3_tests.py`).
- **Scale remark.** For `CBstar(8,86,2)` I compute `n = 2153`, `α = 1463`, `x = 701`, eligible `[703, 975]`, local
  `k_min = 702 > 517`. This agrees with the return's scale remark.

**Theorems G2 and G2b, re-derived.**
- **G2** (disjoint maximal chains give `Σ 1/∏_{E(x)} q_i ≤ C(M,k)`) is correct. It is only a layer LYM, not a shadow
  inequality, and nothing downstream uses it.
- **G2b** (`updeg ≤ Q_tot − (k−1)q_min`, double counting) is correct, one-directional, and never claimed sharp. On
  every tested layer it is at most the true NM ratio `e_{k−1}/e_k`, often strictly, for example 2/5 against 7/16.

**§5 reproduced digit for digit by my own DP and my own `g_d`** (`o3_rows_crit.py`). I validated the switch-dead
family `X''` against the **literal** relation and weights on `CB(2,2)`, `CB(3,2)` and `CB(2,3)` at every rank:
`X''` is the set of sector members with no positive-weight switch target, and its size equals `[t^k] g_d^m`.

| Row | `n` | `α` | `x` | eligible | `k` | `Z′` | `δ` | `λ₂` | `k²` | `x₀` | `\|X″\|/R_k` |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `CB(8,108)/577` | 1839 | 973 | 575 | 577–648 | 576 | 289 | 288/289 | 332,350 | 331,776 | −287/289 | 6.481832e-09 |
| `CB(7,144)/673` | 2163 | 1153 | 671 | 673–768 | 672 | 337 | 336/337 | 452,254 | 451,584 | −335/337 | 2.559563e-15 |

`|X''|` has 403 and 465 digits. Both rows sit at the last deletion-deficient local rank: `R_k/R_{k−1}` is 289/288
and 337/336.

**§6 reproduced.** The per-choke good poset has no dead end below the top for `d = 2` and `d = 5` (the brief asks
for two values). The good poset is not downward closed: `(S,S,L) → (E,S,L)` and `(S,E,L)` are bad, `(S,S,E)` is good.

## Attacks and findings

1. **(Major, fidelity) The false WID claim and the hard-coded `F`.** See items 3–4 of the fidelity list above.
   - Consequence: no G1 or G3 row in the return is a row of the (HALL) network with `F = F_p(T)`.
   - What survives: the G1-family checks, as tests of a lemma stated for a general `F`.
   - What is struck: the words "fixed points" and "WID asserted" for those rows.
2. **(Major, mathematical) The Corollary's formula is wrong outside `c = β`.** The formula is
   `max(0, (K − (|Q|−1)β)·[C(M,k)q^k − C(M,k−1)q^{k−1}])`.
   - **Wrong coefficient.** For `X ⊆ R* = {w = β}`, `φ(X) = c|X| − β|∂X|` with `c = K − (|Q| − 1)β`, not
     `c(|X| − |∂X|)`.
   - **Wrong sign.** For `c < 0` and a negative bracket, the formula returns a positive number, but the true value is
     0 (`W* ≤ β`, so `R* = ∅`). The parenthetical "`R* = {w_F = β}` exactly" is false whenever `W* ≤ β`.
   - **Counterexample, own instrument.** Take the `|Q| = 3` mutual-witness core (T2's own shape), with 5 stars of
     `t = 1` on one choke (`n = 15`), at local `k = 5`. T2's formula gives **96**; the true deficit is **0**.
   - **Why the return's test missed it.** Its negative-coefficient test (`M = 2`, `q = 3`) never reaches a rank with a
     negative bracket, so it could not falsify the formula.
   - **Effect on the return's claim.** "Fully closed for uniform `t` (any `|Q|`, any `β`, any `K`)" is struck.
   - **What survives.** By L1, the only live case is `c = β = 1`, where the formula coincides with the registered
     `CBSTAR` formula.
3. **(Major, proof) The algebra error in G3 at `|Q| = 2`, `q_min = 3`.** Detailed and repaired above. The theorem
   survives only by the critic's repair; the grade row "complete derivation" is struck.
4. **(Moderate) G3's end-to-end check is at a non-eligible rank.** The off-by-one is detailed above. "At the smallest
   eligible `p = 10` … supply 7,306 … 1,066 sector members" is struck and replaced by my corrected row.
5. **(Moderate) Hidden hypothesis `P ⊆ F`**, plus the false justification for "unique attachment edge". Both are
   detailed above. G1 and G3 must carry `P ⊆ F_p(T)` explicitly, together with A4 and H-attach.
6. **(Moderate, scope) G1's claimed generality is vacuous beyond the pendant-arm shape (L1).** "Arbitrary `Q`,
   general `β`" adds no deficit-bearing case. The honest scope is heterogeneous `CBstar`. H-attach bites only for
   stars with `t ≥ 2` attached at a leaf (a `t = 1` star is labelled with its centre at the attachment).
7. **(Moderate, quantifier/competition) "Private exits" is private only within the sector.** A `Q`-exit `B ∖ {q}` is
   also a deletion target of the non-sector source `(B ∖ {q}) ∪ {z}` for any addable `z ∉ Q`. G1 and G3 are
   sector-restricted Hall statements: they say nothing about families that mix sector and non-sector sources (the
   (O2) coupling). The return does not claim otherwise, but its wording should not travel.
8. **(Minor) The §6 small-scale signal uses trees with empty eligibility**, which the contract forbids for reported
   instances, and ranks that are not the target's critical rank. It is struck as evidence of anything. The return
   correctly never uses it as a proof.
9. **(Minor) Certification wording.**
   - "Exact identity verified on three structurally distinct instances … zero mismatches": the formula is compared
     on 2 instances. The heterogeneous instance has `formula_val = None` and `match` defaults to `True`, and the
     `|Q| = 3` comparison is vacuous.
   - "Hundreds of random subfamilies" is 114.
   - "`ratio_exceeds_delta`" is computed as `≥`.
10. **(Positive) What survives.** Prop 2; G1's reduction; G2; G2b; the §5 third-instrument numbers; the exact
    reading of `X''`; the no-dead-end and non-downward-closed facts. The (O3) diagnosis is honest, and O3 is not
    claimed closed.

**Critic-derived advance on the open step (O3; C-T2-U, `bounded_computation` on analogues only).** I use the
`S_d ≀ S_m` orbit quotient. Unit weights and the deletion relation are invariant, and by (LIFT) and its stated
converse, quotient saturation holds iff Hall holds for every `X ⊆ X''`. The question tested is whether the
switch-dead family is deletion-Hall (shadow taken in the whole layer) at the **last deletion-deficient rank** `k*`,
which is where both target rows sit (`xpp_quotient.py`).
- Cross-check: my quotient reproduces T2's `(2,4,5)` numbers exactly (`|X''| = 704`, deficiency 40, which is
  704 − 664).
- At `k*`, `X''` is deletion-Hall on 19 of the 21 tested `(d, m)`. The passing pairs are `d = 2, m ∈ {2,3,5,6,7,8,9,12}`; `d = 3, m ∈ {2,3,4,5,8}`; `(4,4)`, `(4,6)`, `(5,4)`; `d = 8, m ∈ {2,3,4}`.
- It fails only at `(2,4)` and `(8,1)`.
- At `k* − 1` it fails for `(2,6)` and `(8,2)`, but holds for larger `m`.

This is a more representative signal than the return's §6, which tested ranks far below `k*`: failure is a
small-`m` effect, and `d = 8` holds for `m ≥ 2` at `k*`. It is **not** evidence at `m = 108`/`144`, and `X''`-Hall is
necessary, not sufficient, for sector Hall (switch-live members compete for shared switch targets). A proof route
suggested by the structure: a rank-`(k*−1)` target is overloaded under the uniform `1/k` deletion flow only if it
has at most one switch-live up-neighbour. That forces its empty branches into fully empty chokes or chokes with at
least 2 supports. A redistribution lemma over those targets is the concrete remaining step.

## Mechanism-equivalence and fence check

- **Not `E993-R23-LITERAL-DELETE-ONLY-HALL`.** Every deletion-only statement (G1, G2b, G3, L1, L2) concerns one
  source family (the `{r, v}` sector) under the literal active weight, and is not a universal transport mechanism.
  The return's three-axis distinction holds. Its point (iv) is consistent: at `t = 1` the formula reproduces the
  known positive deficits.
- **None of the other nine refuted keys is revived.** There is no Delete/Retag relation, no own-support unit
  capacity, no per-leaf injectivity, no occupancy domination, and no signed cross-tag or covariance.
- **Closed-region fence.** At uniform `t`, G1's corollary **restates** the registered
  `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`; by L1 its `|Q|`/`β` generalization adds nothing deficit-bearing.
  The real increment over the key is:
  - heterogeneous `d_j`, which is immaterial to the sector poset;
  - heterogeneous `t_i`: G3's sufficient direction, and L2's exact form, which is the critic's.
- **Other fences.** No census value enters a proof, and there is no RTree wording. (LIFT) is used only in my
  analogue probe, at its stated hypotheses (invariant integer weights and relation). The return reads no `sources/`
  file and writes nothing there.
- **Alias check (duty 6).** The registry `CLAIM-IDENTITY.run-local.json` is **not** a capsule member, so I did not
  read it or replay `alias_check.py`. Against the keys named in the capsule (CBSTAR, NM `E993-R30-INDUCED-MATCHING-…`,
  (LB) `E993-R27-FOREST-DESCENT-LINEAR-BOUND`, the ten refuted keys):
  - G1 at uniform `t` aliases the CBSTAR key mathematically.
  - G2 does not alias NM: it is a layer LYM, not a shadow bound.
  - G3 generalizes the CBSTAR corollary to heterogeneous `t`, at the same quantifier strength (every sector
    subfamily, at every eligible `p`).
- **Names.** The return proposes no `E993-R30-…` names. If the synthesis registers, I suggest predicate names such
  as `E993-R30-PENDANT-ARM-SECTOR-DELETION-DEFICIT-EQ-ESYM-GAP` for L2/G3 and
  `E993-R30-SECTOR-RESIDUAL-NONEMPTY-IFF-PENDANT-P3-ARM` for L1.

## Certification audit

Struck:
- (WID) "asserted on every generator's own instances" (no generator computes `S`).
- "fixed points" for the §1 G1 rows (hard-coded `F`, mostly non-eligible).
- "exact identity verified on three structurally distinct instances … zero mismatches" (2 comparisons, one vacuous).
- The Corollary's "fully closed for uniform `t` (any `|Q|`, any `β`, any `K`)", which is falsified.
- G3's "complete derivation" (algebra error; stands only as repaired).
- "At the smallest eligible `p = 10` … 1,066 sector members … supply 7,306" (these are rank-9 numbers).
- "Hundreds of random subfamilies" (114).
- The "unique attachment edge" justification.

Backed by replay or by my instrument:
- Every §5 table literal.
- `|X''|` digit counts.
- "no dead end" (`d = 2, 5` checked).
- G2 equality on 5 configurations; G2b never violated.
- Prop 1 and Prop 2 on T2's instances (with its `F`).
- All script and output digests, and byte-identical replay.

"Byte-identical" is true of the outputs; "replayed from the copy" is qualified by the path-import defect.

Grades as they stand after audit:

| Claim | Grade |
|---|---|
| Prop 2; G1's reduction (for Prop 2's hypotheses) | `proved_informal` |
| Corollary | valid only in the live case (`c = β = 1`) |
| G2, G2b | `proved_informal` (elementary) |
| G3 | `proved_informal` only with the critic repair and the explicit hypotheses `P ⊆ F`, A4, H-attach; scope is heterogeneous `CBstar` |
| §5, §6 | `bounded_computation` |
| L1 (critic) | STATED `proved_informal` |
| L2 (critic) | STATED `proved_informal`, conditional on the classical NM product theorem |

Every critic statement needs an isolated second read.

## Verdict

verdict: retained_narrowed
headline_resolved: no

The return's central reduction (G1) is sound, but narrower than claimed.
- By L1, its only deficit-bearing case is the pendant-arm `{r, v}` sector, i.e. heterogeneous `CBstar`.
- The general Corollary formula is falsified off that case.
- G3 is true, but only by the critic's repair of an algebra error at `|Q| = 2`, `q_min = 3`.
- Its computational certifications carry a hard-coded `F`, no WID assertion, and an off-by-one rank in the G3
  end-to-end check.

(O3) remains open, as the return honestly says. None of this touches (HALL) or the primary aggregate. No deficient
cut is exhibited.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

1. **(O3) sector Hall at `CB(8,108)/577` and `CB(7,144)/673`** is open. Both rows sit at the last
   deletion-deficient local rank `k*` (576 and 672). The exact open piece is Hall under (D) ∪ (S), with weights 1 on
   the sector and switch-exit weight equal to the number of sibling L's, for every `X ⊆ sector`. It includes `X ⊆ X''`,
   which is deletion-only. Suggested route (see Attacks): a redistribution lemma for rank-`(k*−1)` targets that have at
   most one switch-live up-neighbour. The analogue signal favours `X''`-Hall at `k*` for `m ≥ 2` at `d = 8`.
2. **Second reads for L1 and L2.** For L2, either a self-contained proof of NM for heterogeneous claw products, or an
   authorized citation of the product theorem.
3. **The return's Remaining obligation 2** (heterogeneous exact max-deficit) is answered by L2 modulo item 2. Its
   items 1, 3 and 5 stand.
4. **The return's item 4 (H-attach) narrows.** Only `T − N[Q]` stars with `t ≥ 2` attached through a leaf (pendant
   `P_3`-type branches at a choke) remain unanalysed in the live class.
5. **Composition with non-sector sources is not addressed.** Every sector statement here must still be composed with
   non-sector sources (the `Q`-exits are shared with them): (O2) coupling, T1's object.
6. **Recording duty.** Every G1 or G3 statement must carry `P ⊆ F_p(T)`, A4 and H-attach on its face. Every future
   instance must derive `F_p` and assert WID from independent sides.

## Artifact inventory

Scratch root is `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-T2-U/`. Every script was run
with `python3 -B` in the foreground, using the standard library only. No background job was started, so none needed
killing. No network was used, nothing was installed, and nothing was written outside this scratch directory and this
critique. The Python `__pycache__` created by one exec was removed.

- `replay/`: copy-out-first replay of T2's 9 scripts, plus `orig/` copies of T2's 5 outputs. All replayed outputs
  are byte-identical to T2's.
- `own/crit_lib.py`, `7ba17726c2cd13531910eb042b0ab167ed68713586a10d72ea286dc95c2c8abf`: the instrument library.

Own scripts and outputs (SHA-256):

| Script | Script SHA-256 | Output | Output SHA-256 |
|---|---|---|---|
| `own/fixed_points.py` | `806a9bae…` | `fixed_points_output.json` | `9e92b3b2…` |
| `own/g1_tests.py` | `3f5a55f9…` | `g1_tests_output.json` | `20b623b9…` |
| `own/g3_tests.py` | `c24a29ce…` | `g3_tests_output.json` | `17272840…` |
| `own/nm_claws.py` | `2a9f5ac1…` | `nm_claws_output.json` | `ccdad9c9…` |
| `own/o3_rows_crit.py` | `b0be1a80…` | `o3_rows_crit_output.json` | `ad0211de…` |
| `own/o3_structure_crit.py` | `1b942492…` | `o3_structure_crit_output.json` | `2f144366…` |
| `own/xpp_quotient.py` | `3d7873be…` | `xpp_quotient_output.json` | `98463961…` |
| `own/cbstar_t2_check.py` | `4c42202f…` | `cbstar_t2_check_output.json` | `2411f688…` |

Each script's stdout is saved as `own/*_stdout.txt`.

Read-boundary disclosures:
- The harness injected `CLAUDE.md` and `MEMORY.md` into the wrapper context before the dispatch was read. This is an
  ordering deviation only; I did not open them as sources.
- I ran one non-recursive `ls -la` on `scratchpad/c3-T2/`, which is granted.
- I ran one `grep` on the single granted file `RETURN.md`, which is not recursive.
- I ran no search rooted above the grant.
- I read neither the registry nor the worker common brief.
