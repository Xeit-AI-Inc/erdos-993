# Critique

Critic `C-T1-U` (orientation U, formal/structural) of seat `T1`, route `C3-T-01 CB-CHOKE-FOREST-HALL-AND-SECTOR-ABSORPTION`,
Cycle 3, r30 (Erdős #993, weighted mixed-boundary transport). Date 2026-09-26.

**Boot.** I am operating within VerityOS. Boot reads: exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, in full. I did not follow the startup protocol's task map into
memory, logs, decisions or conversations; the dispatch fences those reads.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read-boundary disclosures.**
1. **Order.** The wrapper told me to verify the dispatch digest before reading the dispatch. So I hashed the dispatch and read
   it before I booted, even though the dispatch itself says "FIRST: boot". The boot then read exactly the two authorized files.
2. **Harness-injected context.** The host session put the project `CLAUDE.md` and the auto-memory index (`MEMORY.md`) into my
   context before my first action. I did not open either file, and I did not use either one as evidence.
3. **Directory listings.** I ran a non-recursive `ls -la` on `scratchpad/c3-T1/` (the authorized artifact directory, names
   only) and on my own scratch directory. One `ls` on `cycles/cycle-3/stage4/critics/T1/`, run to check where my deliverable
   would go, returned "No such file or directory", so no names were obtained. I then created only
   `cycles/cycle-3/stage4/critics/T1/U/`.
4. **Single-file searches.** I ran `grep -n '^## '` on the single granted file `control/C3-CRITIC-ATTACK-BRIEFS.md` to find my
   section, then read only its preamble and the T1 section (lines 1–38). I also filtered the two capsule-member manifests
   (Stage 2 and Stage 3) with Python. Nothing was recursive, and nothing touched a directory above my grant.
5. **Not read:** any other return, any critique, any adjudication, any file under `sources/` (not needed), the run-local
   registry `control/CLAIM-IDENTITY.run-local.json` (not a capsule member, so I cannot re-check the return's keyword alias
   search), any other experiment root, the network. No installs, no Lean.
6. **Background jobs:** none were started. Every script ran in the foreground to completion. There is nothing to kill.

## Identity and seal audit

- **Dispatch file** `control/dispatch/c3-stage4/DISPATCH-C-T1-U.md`: SHA-256 `e87763509dd00cfe233a2e13b0a3e9f4bee2e392848e36cbd6eeca6c6c9e5e99`. Matches.
- **Capsule** `control/c3-critic-capsules/T1-PACKET-MANIFEST.json`. I recomputed the inner seal as SHA-256 of the compact
  key-sorted JSON without `seal_sha256`: **`067e1b1ed3bc35157f6f012428266414e06e89484a56ea3f83f1f1f1b491f620`**. Matches.
  All 14 members match their recorded bytes and SHA-256.
- **Stage 4 dispatch manifest:** inner seal recomputed, `b57e5de137627d8526c12e5f54a2011683c1ba010f98450a8adace5f4e7ca3c7`. Matches.
- **Stage 3 packet manifest** (a capsule member): inner seal recomputed, `64c6c84aabe2392394f680abb3c8862a349f06a4f8043a9960b706f35b294797`.
  Matches. It lists the T1 return at `f7da309f…40` (the same digest as the capsule) and `DISPATCH-T1.md` at
  `adbc292ded55225d6302d51b5a656b4a9ba4d4ae42bcc85a0ef4936fa64d4ded`, the digest the return cites.
- **Stage 2 packet manifest:** inner seal recomputed, `5df4c6034d7cb02d851b579e4edad5752698787081fbf26fbc8ab84852752416`. Matches,
  and matches the value the return cites.
- **Read-boundary disclosures record** (`C3-STAGE3-READ-BOUNDARY-DISCLOSURES.json`, a capsule member): T1's entry, a boot-order
  deviation plus nine non-recursive `ls` calls inside `cycles/`, matches the return's own disclosure section. No penalty; noted.
- **The return's artifact digests.** I copied all 14 files out to `scratchpad/c3-crit-T1-U/replay/`, and every SHA-256 matches
  the return's table. I replayed all seven generators with `python3 -B`, and all seven stdouts are **byte-identical** to the
  shipped `out_*.txt`. There is no `__pycache__` in either directory.
- **Registry keys touched:** (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN); (WID)
  `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY` (formally_verified, C1-LA1); (INV)
  `E993-R30-WEIGHTED-HALL-IFF-AUT-ORBIT-QUOTIENT-HALL`; (NM) `E993-R30-INDUCED-MATCHING-SECTOR-SHADOW-NORMALIZED-MATCHING`;
  `E993-R30-TERNARY-COVER-SECOND-EIGENVALUE`; the fenced `E993-R23-LITERAL-DELETE-ONLY-HALL` and
  `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY`; the return's three proposed `E993-R30-…` candidates (judged below); and
  one critic-derived candidate (below). The primary aggregate `E993-LOWER-REGION-ORDINARY-FAVORABLE-LEAF-AGGREGATE` is not touched.

## Independent re-derivation

I built my own instruments from the semantic contract. None of the return's code is imported. All scripts and outputs are in
`scratchpad/c3-crit-T1-U/`.

**I-1. Generic literal brute force (`bf.py`).** It computes, on any small tree:
- the leaves, the supports and `W_v = N(s_v)∖{v}`;
- `F_p` derived from `Δ_p(T − v)` on the original tree;
- `x` scanned through rank `α` with the zero extension;
- `S` from `q_v`;
- `w_F` as literal active tags;
- the relation (D) ∪ (S), taken literally;
- an exact integer Dinic max-flow.

Before trusting it, I ran it on the contract's fixed points (`fixed_points.py`). All reproduce exactly:
- `K_{1,12}/8`: 1980 / 3960 / flow 1980, `S = −1980`, `x = 6`, `|F| = 12`.
- Path-star `(2,3,4)/7`: 1483 / 2701 / flow 1483, `S = −1218`, 2025 arcs.
- Path-star `(2,2,4,3)/8`: 8033 / 13467 / flow 8033, `S = −5434`, 11691 arcs.

`supply − capacity = S` is asserted on every instance.

**I-2. CB closed forms (`cbcf.py`).** These are my own component-product derivations of:
- `P(T)`, `P(T−c)`, `P(T−v)`, `H_c`, `R_c`, `H_v`, `R_v`;
- a **bivariate supply GF**, `F(x, y) = x(1 + x·y_v)(1+2x)^{dm} + (1+2x)[(1+2x)^d + x(1 + x·y_c)^d]^m`, where `y` marks
  ACTIVE tags, so layer supply is `∂_y` at `y = 1`.

This supply side is computed independently of the `q`-polynomials, so the WID check is falsifiable (ruling 24).
`cb_crosscheck.py` compares the closed forms with literal brute force on CB(1,2), (2,2), (2,3), (3,2), (1,4) and (3,3), at
**every** rank. Every deletion polynomial, every layer active-weight sum, the member-level weight model, `F_p` (derived) and
`S` all agree (`ALL_OK True`).

**I-3. The three assigned rows** (`rows.py`, `blocks.py`), all at every eligible `p`, not only the first:

| Row | n | α | x | eligible p | `F_p` (derived) | WID (independent sides) | `S < 0` |
|---|---|---|---|---|---|---|---|
| CB(8,86) | 1465 | 775 | 458 | 460–516 (57 ranks) | all 689 leaves at every p | holds at every p | every p |
| CB(8,89) | 1516 | 802 | 474 | 476–534 (59) | all 713 | every p | every p |
| CB(8,92) | 1567 | 829 | 490 | 492–552 (61) | all 737 | every p | every p |

At the first eligible ranks, `Δ_x` has 326 / 337 / 349 digits and `Δ_{x−1}` has 327 / 338 / 350. The two context rows
CB(8,108)/577 and CB(7,144)/673 give 408/411 and 479/482. All of these match the return.

**I-4. The return's O-class numbers, re-derived by a different formula.** Tag-lifting (§Attacks A-6) gives
`O-supply = dm·i_{p−1}(G_c)` and `O-capacity = dm·i_{p−2}(G_c)`, with `G_c = (d−1)K_1 + (m−1)·S_{d,2}`. At all three rows,
both totals equal the return's `qclass_rows.py` integers exactly. Further checks:
- **q = 1 class ratios.** My tag-indexed formula gives `1325825212805/1338918371349`, `4727130817223/4772229963615` and
  `117301488813803/118383886278251`, the same as the return.
- **Uncovered supply fractions under the return's coverage rule.** My tag-indexed stratum formula,
  `md·C(m−1,q−1)·C(qd−1,ℓ−1)·C(N,t)·2^t`, gives 17.158674% / 17.178670% / 17.193174%, the same as the return.
- **Whole-class ratios.** Over **all** `q` (the return printed nine samples), the ratio is `< 1` for every `q`, strictly
  decreasing in `q`, and largest at `q = 1` (`audit.py`).

**I-5. The return's Lemma 2.1 tightness claim, re-derived with my own probe** (`lemma21_probe.py`: Dinic matching on
`I(N·K_2)`, which is the return's "ternary-leg lattice"). For N = 7, t = 4, 5, 6 and N = 9, t = 6, 7, Hall fails exactly
below `⌈(2N+2)/3⌉`. **In every failing case the maximum matching equals `|L_{t−1}|`**, which means the failure is the
trivial whole-layer count `|L_t| > |L_{t−1}|` and nothing subtler.

## Attacks and findings

**A-1 Fidelity (weight, relation, `F`, `x`, WID).** The weight model is correct and matches the active-tag weight: a private
leaf `c_ij` has `W = {u_i}` exactly (erratum R30-E-b), and the arm leaf `v` has `W = {r}` (I-2, member-level). The return
checks `x` through `α`. Two fidelity breaches remain as shipped:
- **(a)** `F_p` is never derived. `verify_model.py` hard-codes "F = the WHOLE leaf set", and no script tests `Δ_p(T − v) < 0`
  at the three rows. That breaches ruling 24 ("`F_p` derived on every row").
- **(b)** No instrument asserts `supply − capacity = S`. The return says it "never computes `S(T,p)`". That breaches
  SOLUTION-CONTRACT §3.3.

Under the protocol these breaches would strike the downstream numbers. However, my I-3 derives `F_p = all leaves` at every
eligible `p` of all three rows, asserts WID from independent sides, and reproduces every O-class number (I-4). **Result: the
return's numbers are re-backed by the critic's instrument, not by the return's own.** A synthesis citing them should cite
this critique for `F_p` and WID.

**A-2 Lemma 2.1 (`E993-R30-TERNARY-LEG-LATTICE-SHADOW-THRESHOLD`) is a mathematical alias of (NM).** The "ternary-leg lattice"
(N positions, each empty / colour 1 / colour 2) is exactly `I(N·K_2)`. The return's "coloured-permutation" chain count
reduces to `|X|·t ≤ |∂X|·2(N−t+1)`. That is the same inequality as (NM)'s two cover-degree lemmas (`k` down-covers,
`2(N−k+1)` up-covers) and double count on the same poset (the sector encoding over an induced perfect matching, per
`C3-ALLOCATION.md`). The "iff" adds only two things: the arithmetic for when that ratio is at least 1, and the whole-layer
necessity (I-5: every failure is the full layer). The return tries to distinguish Lemma 2.1 from
`E993-R30-TERNARY-COVER-SECOND-EIGENVALUE` because the sector is "a non-uniformly-weighted family (where weight varies with
which chokes are present)". **That premise is false.** Every root-plus-arm sector member has active weight exactly one
(SEMANTIC-CONTRACT §1.2), and the return's own `verify_model.py` check (i) confirms "every `sec` member has weight exactly 1".
The distinction is **struck**. Lemma 2.1 should not be registered as a new key; at most it is a corollary line on (NM) (the
(NM) ratio is at least 1 iff `3t ≥ 2N + 2`).

**A-3 Lemma 2.2 (`E993-R30-CHOKE-IN-BLOCK-RANK-WEIGHTED-LYM-THRESHOLD`) is classical LYM.** It is `|∂X| ≥ |X|·k/(n−k+1)` on
`B_n` multiplied by `(k−1)`, plus the whole-layer necessity, and the return itself calls it "classical". The mathematics is
correct, but it registers nothing new. Do not register it.

**A-4 The 82.8% figure is correct arithmetic but not a Hall statement.** The arithmetic is right (I-4), and the return
correctly never calls it (CF-HALL). The brief asked whether per-stratum certificates could double-count target capacity.
**They cannot:**
- A Lemma 2.1 certificate for the fixed in-part `(Q, S)` uses only targets `(Q, S, T′)`, and each such target determines
  `(Q, S)`.
- A Lemma 2.2 certificate for fixed `Q` uses targets `(Q, S′, ∅)`. Those arise as Lemma 2.1 targets only from `t = 1` sources,
  and `t = 1` is never Lemma 2.1-covered, because `N ≥ 1` gives a threshold of at least 2 (and `N = 0` has no `t = 1` sources).

So the covered certificates are pairwise target-disjoint, and Hall holds for **every** `X` inside the union of covered strata.
This is stronger than the return claimed, and it is now superseded by A-6.

A harmless code bug: `gap_weight.py` sets the Lemma 2.1 threshold to 0 when `N = 0` (`q = m`), so it counts the `t = 0`
stratum as "T-covered" although no T-deletion exists there. At all three rows that stratum is also covered by Lemma 2.2
(ℓ = 375 / 388 / 401 against thresholds 345 / 357 / 369), so no printed number changes.

**A-5 The "genuine limitation" framing of the gap.** The isolated probe (`gap_probe.py`) fails only on the whole layer (I-5).
It says nothing about the network, where gap-stratum sources also have in-choke leaf deletions and other-choke deletions.
A-6 shows the gap closes on the network with deletion arcs alone.

**A-6 CRITIC-DERIVED ADVANCE (C-T1-U): (CF-HALL) and (O1) at the three rows, for every `X` and not only invariant ones, by
tag-lifting plus block normalized matching.** The statement and proof follow.

- **(TL) Tag-lifting (proved_informal; general in `d`, `m`, `p ≥ 3`; any tag set `F`, whose private-leaf part is `∅` or all
  of `C` by Aut-invariance of `F_p`).**
  - Take an O-source `B` (`r, s, v ∉ B`) and an active tag `c = c_ij`, which forces `u_i ∈ B`. The pair `(B, c)` corresponds
    bijectively to `B ∖ {u_i, c} ∈ I_{p−1}(G_c)`, where `G_c := T′ − {u_i, b_{i·}, c}`: the other `d − 1` leaves of choke `i`
    become isolated vertices, plus the other `m − 1` spiders `S_{d,2}`. The inverse is independent because
    `N(c) = {b_ij}`, `N(u_i) = {r, b_{i·}}`, and `G_c` avoids all of these.
  - A deletion of `x ∉ {u_i, c}` keeps `c` active and keeps the class O. It corresponds bijectively to the shadow step
    `I_{p−1}(G_c) → I_{p−2}(G_c)`.
  - Therefore a matching saturating `I_{p−1}(G_c)` in its shadow gives a flow in the **literal** weighted network:
    - each tag pair sends one unit along a (D) arc;
    - target `A` receives at most one unit per active tag of `A`, which is at most `w_F(A)`;
    - every source is saturated, because `w_F(B)` equals its number of active tag pairs.
  - The same holds for S-sources (`(B, c) ↦ B ∖ {s, u_i, c} ∈ I_{p−2}(G_c)`) and V-sources (`↦ B ∖ {v, u_i, c}`). R0 sources
    have weight 0.
  - The target sets are pairwise disjoint across the classes. O targets have `r, s, v ∉ A`. S targets have `s ∈ A`. V targets
    (deletions keeping `v`) have `v ∈ A` and `r ∉ A`. Hence weighted Hall holds for every
    `X ⊆ (R0 ∪ S ∪ V ∪ O) ∩ I_{p+1}` whenever the three shadow matchings exist.
- **(BNM) Block normalized matching.**
  - Split `I(G_c)` by the set `J` of spiders whose centre is present.
  - Deletions of non-centre elements stay inside a block, so blocks have pairwise disjoint shadows.
  - Block `J` is a shifted copy of `Λ^{d(m−1−|J|)} × B_1^{(d−1)+d|J|}`, where `Λ = {∅ < b, ∅ < c}` for an out-leg and `B_1`
    for a free leaf.
  - `Λ` (Whitney numbers 1, 2) and `B_1` (1, 1) are normalized-matching posets with log-concave Whitney numbers. By the
    classical product theorem (Harper 1974; Hsieh–Kleitman 1973), which I cite from the literature and do not re-prove, every
    block is normalized-matching.
  - Hence Hall holds at block level `r` whenever `N_{r−1} ≥ N_r` for `Q_j = (1+2x)^{d(m−1−j)}(1+x)^{d−1+dj}`.
  - Corroboration by exact max-flow:
    - normalized matching holds at every level of eight small products `Λ^a × B_1^b`;
    - the spider poset `S_{d,2}` itself is **not** normalized-matching (for every `d ≤ 8`), which is why the block split is
      needed;
    - on CB(2,2), (2,3), (3,2), (3,3) and (2,4) at every rank, the block predicate implies literal deletion-only weighted Hall
      on `R0 ∪ S ∪ O`, on V, and on `R0 ∪ S ∪ V ∪ O` (`out_blocks.txt`, `out_nm.txt`).
- **Finite exact check (`blocks.py`).** For every eligible `p` of all three rows (177 ranks), and every `j`, the block
  predicate holds at `k = p − 1` (O) and at `k = p − 2` (S, V). The minimum is always at `j = 0`:

  | Row, first eligible p | O minimum ratio | S/V minimum ratio |
  |---|---|---|
  | CB(8,86)/460 | 1.009875479 | 1.003285830 |
  | CB(8,89)/476 | 1.009540490 | 1.003174566 |
  | CB(8,92)/492 | 1.009227483 | 1.003070591 |

  At the window top the ratio is about 1.49–1.50.
- **Conclusion (STATED by C-T1-U; grade `computer_assisted`, since it combines an exact finite check with a classical imported
  theorem; needs an isolated second read).** At CB(8,86), CB(8,89) and CB(8,92), at every eligible `p`, with
  `F = F_p(T)` = all leaves (derived): weighted Hall holds for **every** `X ⊆ I_{p+1} ∖ sec`, using (D) arcs only. This
  contains the route's (CF-HALL) (every `X ⊆ O`, not only `Aut`-invariant ones) and (O1).
- **Composition.** Combine this with the registered repaired (R-ii) and the registered `computer_assisted` sector Hall at the
  three rows. Then Hall(X) holds for every `X` that has no positive-weight V member, and, by the result above, for every `X`
  that misses `sec`.
- **What is still open at these rows:** only families meeting **both** `sec` and positive-weight `V`. By target-disjointness,
  a sufficient residual is **(O2′):** weighted Hall for every `X ⊆ sec ∪ V`, using only `v`-containing targets (the sec and
  V classes).
- **Prior only, not evidence** (`secv_prior.py`). The sector's whole-layer deletion deficit (`|R_{p−2}|/(p−1)`, with ratio
  460/459, 476/475, 492/491) is 4.9% / 4.8% / 4.6% of the V block-0 slack. Block 0 is the only V block the sector's switches
  reach, because a sector switch inserts one choke `u_i` and yields a q = 1 V target.

**A-7 The route's grades.** Of the return's own grades:
- The choke-forest model at `proved_informal` stands.
- "Lemma 2.1 … own contribution" is struck as to novelty (A-2).
- "Lemma 2.2" stands as classical.
- The Step 4 figures stand at `bounded_computation`, re-backed per A-1.
- The claim "(CF-HALL), (O1) … not proved" is now superseded by A-6, pending a second read.

The return never overclaims (HALL), and its unresolved headline flag is correct.

## Mechanism-equivalence and fence check

- **Not a refuted mechanism revived.**
  - The return's lemmas are poset facts, not transport mechanisms.
  - A-6 is scoped: the three rows, and non-sector classes only. It is not `E993-R23-LITERAL-DELETE-ONLY-HALL`, because the
    sector itself is deletion-deficient (ratio 492/491 etc.), and deletion-only Hall is claimed only where it is proved
    sufficient.
  - It is not `E993-LOWER-REGION-PER-LEAF-DOWN-MAP-INJECTIVITY` as a universal claim. The tag decomposition is a proof device
    for a Hall statement at stated rows, and it fails in the sector.
  - The capacity used is the literal `w_F(A)`, not an own-support unit-capacity rule.
- **No closed region re-proved.** The high tail and the order bands are untouched.
- **Census discipline.** No census value is used in a proof; the rows are exact computations at named instances.
- **Other fences.** No RTree wording. The controller's prior is not used as evidence (the `sec`/`V` magnitude comparison is
  labelled as a prior). The quotient/lift is not used. `D, C ≥ 0` is not used.
- **Fence §3.1.** (HALL) is not closed, and the primary aggregate is untouched.

## Certification audit

| Literal in the return | Status |
|---|---|
| Stage 2 seal `5df4c603…`; `DISPATCH-T1.md` digest `adbc292d…` | backed (recomputed; the Stage 3 manifest agrees) |
| 14 artifact digests; "all seven replay stdouts byte-identical" | backed (critic replay) |
| `ALL_OK=True` on 6 small (d,m) | backed (replay). The claim "F = all leaves" is a hard-code (A-1); the independent critic check agrees |
| `n`, `α`, `x`, eligible, `Δ_x`/`Δ_{x−1}` digits 326/337/349/408/479 and 327/338/350/411/482 | backed (critic instrument) |
| q = 1 exact fractions; "thinnest at q = 1"; "all < 1" | backed (critic, all q) |
| "decreasing away from q = 1" | shipped evidence has 9 samples only; **backed by critic** (strictly decreasing over all q) |
| 82.841326 / 82.821330 / 82.806826% covered; digit counts 330/329, 341/341, 353/352 | backed (critic formula; digit counts re-counted) |
| "**26** `(N,t)` pairs" (twice) | **STRUCK: the shipped `out_gap_probe.txt` has 23** (N = 4, 5, 6, 8 give 4 + 5 + 6 + 8) |
| "Hall holds exactly for `t ≥ ⌈(2N+2)/3⌉` … fails for every smaller t" | backed; each failure is the whole-layer count (I-5) |
| "deletion-only Hall proved for every subfamily … ≈82.8% of supply" | backed as a per-stratum statement; its framing as a limitation is superseded (A-4, A-6) |
| distinction "sector … non-uniformly-weighted (weight varies with which chokes are present)" | **STRUCK (false; sector weight ≡ 1)** |
| "Lemma 2.1 … own contribution, not a re-derivation of anything registered" | **STRUCK as to novelty** (alias of the (NM) inequality, A-2) |
| "keyword search … 23 hits over 443 claims" | not verifiable within my capsule (registry not a member); unassessed |
| `(WID) … formally_verified (C1-LA1)`, `(INV)`/`(NM)` `proved_informal` | consistent with `C3-STAGE1-GATE.md` |
| no `supply − capacity = S` assertion | fidelity breach (A-1b); remedied by the critic's WID check at 177 ranks |

## Verdict

verdict: retained_narrowed

headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

The return is retained as a correct and honest bounded record: the choke-forest model, the exact O-class figures and the
coverage arithmetic all check out, re-backed by the critic's instrument. It is narrowed in four ways:
1. Neither proposed lemma key should be registered as new. Lemma 2.1 is the (NM) inequality on `I(N·K_2)`, and Lemma 2.2 is
   classical LYM.
2. The third candidate key (`…SAFE-STRATUM-DELETION-HALL`) is superseded.
3. The literals "26" and the false weight premise of the sector distinction are struck.
4. `F_p` and WID fidelity rest on this critique, not on the return.

The critic-derived advance A-6 (Hall for every `X ⊆ I_{p+1} ∖ sec` at every eligible `p` of the three rows, by tag-lifting
plus block normalized matching) is STATED here at `computer_assisted`. It needs an isolated second read and a registry alias
check before any registration. Suggested key: `E993-R30-CB8-NON-SECTOR-TAG-LIFT-DELETION-HALL`. The general lemma (TL) is
`proved_informal`.

## Remaining obligation

The return's list, judged for exactness:
- Item 1 (the middle `t`-range), item 2 (mixed q/ℓ within O) and item 3 (the transfer to S and V) are **discharged by A-6** at
  the three rows, pending the second read.
- Item 4 is exact only after narrowing. (O1) is discharged. What remains at the three rows is:
  1. **(O2′)** At CB(8,86), CB(8,89) and CB(8,92), at every eligible `p`, with `F = F_p` (all leaves), prove weighted Hall for
     every `X ⊆ sec ∪ V` using only `v`-containing targets. This is sufficient for (HALL) at those rows, given A-6 and
     target-disjointness. The coupling is between sector sources and V targets with exactly one in-choke (G_c-block `j = 0`).
     A promising lever is the sector deficit, which is about 5% of that block's slack (a prior, not evidence). A necessary-form
     alternative is to exhibit an invariant deficient family meeting both `sec` and `V⁺` (F1's object).
  2. **An isolated second read of A-6**, covering the (TL) bijections, block disjointness, the product-theorem citation, and a
     replay of `blocks.py`.
  3. **A registry alias check** for A-6's key, and a scope note on (NM) in place of Lemma 2.1.
  4. A-6 extends to other `(d, m)` wherever the block predicate holds. A uniform-in-`m` version, via the mode of
     `(1+2x)^a(1+x)^b`, is an open, parameter-uniform (NMP)-type lemma for a successor.

## Artifact inventory

All files are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c3-crit-T1-U/`.
They are stdlib only, run with `python3 -B`, and run in the foreground.

| file | sha256 |
|---|---|
| `bf.py` (literal brute force, Dinic) | `ee98ba839e2ff4cb28fc2d07c93dbbd09a7e3cd7cf1d1b2a5ddc0a83a1c9c3f8` |
| `fixed_points.py` / `out_fixed_points.txt` | `773b1fffa62211e2b8cc50eda12a7b65afd3947271a524025e368feebd6bc13f` / `decc4dd4ba1421bb1747c30f9bc12e614c8ae35a1aeb54c45dfe9dd338f7f8a2` |
| `cbcf.py` (CB closed forms, bivariate supply GF) | `df66cd84085e3239c549da77d3d0f23ccb9ad517474384dc7ca254b462562c66` |
| `cb_crosscheck.py` / `out_cb_crosscheck.txt` | `5d86445735a33d8def3d285d02a9409cbde6ed25671c6e3a538757ec16257474` / `4941580d8a261c2cfa2ee51b446904e379f1527a9ee68e1380b30bf2da2c2d9d` |
| `rows.py` / `out_rows.txt` | `8d4f57e0bb43311f3886afdbfe9d0baa30c75c80c5a0623fe3e842932532a2ce` / `fe4c3fd357a17d458aa46d880c85e90b2240dcb098d1f74eb546600dbbcbccad` |
| `nm.py` / `out_nm.txt` | `b0c793cead90219aa692bf41eae8ddbcef442b3e3dcab369f061101cfa0e2620` / `0e17b9fa13b59625505c0ac7b9be8b4c69f2dff962aa4c8ed1ec4b790ddd4de2` |
| `blocks.py` / `out_blocks.txt` (A-6 finite part) | `e631805ceb6afd7e1926011c2096bfa18e3584bc54f95c151e314b59eedc1dfd` / `c5ee72fc281d5cfe48f6f6255eef91b59f8a791b3143490df8eb1ea9b3843b94` |
| `lemma21_probe.py` / `out_lemma21_probe.txt` | `e060ba89090db76f70416592d983cf688f527448027d73c0eeac037d2f2fac8c` / `a4e2881cb9dcf8538150ab4e536947ffcdbba8f65fe47f50c4e392c87f5b5c9d` |
| `secv_prior.py` / `out_secv_prior.txt` (prior only) | `2b9e0f8e810e72bde9a651388d7fbb75881e565e216610adf33b8d177e1d5bb8` / `f76638cdc24d3a0334e6d3b480d305c68c7900160e7fd9423bb379b13dfa738d` |
| `audit.py` / `out_audit.txt` | `49b2b31faacf77b15383c2fa8b537c44d2af960a2a1de7422ebafb5bae16dc50` / `24d60a58d2b041ae0a56f7cdb4074f14bca09d276ec2fcf2d32f76e95b5428f5` |
| `replay/` (the return's 14 files, copied out, digests verified) plus `re_*.txt` (7 replays, byte-identical to `out_*.txt`) | — |

To reproduce, run from the scratch directory: `python3 -B fixed_points.py`, then `cb_crosscheck.py`, `rows.py`, `nm.py`,
`blocks.py`, `lemma21_probe.py`, `secv_prior.py` and `audit.py`. Total run time is about 5 minutes. No background jobs were
started, so none were left to kill.
