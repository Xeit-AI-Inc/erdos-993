# Critique

Critic `C-U2-F` (orientation F, falsify), r30 Cycle 5 Stage 4, of seat `U2`, route `C5-U-02 CB-PATTERN-THRESHOLD-REDUCTION`
(return `cycles/cycle-5/stage3/returns/U2/RETURN.md`, SHA-256 `f2e0700ba65efe9d2f15bc0cff1e4720fa8e68c99b9f13c6ec751fa6835cf017`).

Boot: I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` (the first 150 lines of the protocol; the rest is the generic loading
sequence, which does not apply to this bounded seat). I opened no other VerityOS file. The host-injected `CLAUDE.md` and memory
index were present in my context. I did not act on them: no conversation log was written, and no memory or skill file was opened.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Summary. The return is honest about what it did not do: the per-choke vector threshold is not proved. Three of its positive items
survive my re-derivation: the weight-regime decomposition, the closed-form sector identity, and the `CB(1,m)` sector
characterization. The rest has five defects:

- The "new" regular-bipartite lemma is the registered claw-product normalized-matching key at `q ≡ 2`.
- The five-row evaluation hard-codes the selector, and its prose gets the key inequality backwards.
- The restriction of the analysis to the root-plus-arm sector is not without loss of generality. I exhibit a row
  (`CB(11,2)/16`, `S < 0`) where the sector is Hall-feasible but the whole network is deficient, and the maximizing family mixes
  sector and non-sector sources.
- About a dozen certification literals are unbacked by the shipped code.
- The `d = 9` "non-monotonicity" is an artifact.

My critic-derived advances:

- A proof of the `CB(1,m)` sector non-eligibility for every `m` that does not need the bounded fact `x = m + 1`.
- Exact true maxima at the new `CB(d,2)` rows.
- An explanation of the `d = 9` gap.
- A bounded full-network (HALL) check at 169 eligible `CB(d,m)` rows with `d ≤ 5`. The check covers every eligible rank for
  `d = 1, m ≤ 32`; `d = 2, m ≤ 12`; `d = 3, m ≤ 9`; `d = 4, m ≤ 7`; and `d = 5, m ≤ 6`. These rows include `CB(1,7)/10`, where E1
  fails. No deficiency was found at any of them.

## Identity and seal audit

- **Dispatch.** `control/dispatch/c5-stage4/DISPATCH-C-U2-F.md` has SHA-256 `fa5705d3…3e7a94`, which matches the pointer message.
- **Capsule seal.** For `control/c5-critic-capsules/U2-PACKET-MANIFEST.json` I recomputed the seal (SHA-256 of the canonical JSON
  with `seal_sha256` removed, `sort_keys`, separators `(",", ":")`, no trailing newline). The result is
  **`cdeb272e1539661e22a61d8e8f0b7cb3b448fc7a2c5540267f2d92d9a2c11d5d`**, which matches.
- **Capsule members.** All 14 members match on both byte count and SHA-256.
- **Stage 4 dispatch manifest.** Seal recomputed as `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d`, which
  matches its own field. It lists 13 files, and I verified all of them that are in my capsule.
- **Stage 3 manifest.** Seal recomputed as `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58`, which matches. It
  carries the U2 return at `f2e0700b…`, which matches the file.
- **Stage 2 manifest.** Seal recomputed as `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289`. This matches its
  own field, the common brief and the return.
  - **Defect in the protocol.** `control/C5-CRITIC-PROTOCOL.md` duty 1 quotes the Stage 2 seal as `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`.
    That value is **not** the seal of the sealed Stage 2 manifest. It looks like a stale clone literal. The return is not at
    fault: it cites the correct value.
- **Contract digests.** The Stage 2 manifest's digests for `SEMANTIC-CONTRACT.md`, `SOLUTION-CONTRACT.md`, `C5-ALLOCATION.md`,
  `C5-STAGE1-GATE.md` and `SOURCE-DIGESTS.json` equal the capsule's and the return's.
- **Digests the return claims but I cannot check.** The return also claims digest checks on SR-C4-9, the Cycle 4 U2 return and
  the C2-LA1 award files. Those are outside my capsule, so I could not verify them.
- **Result digests.** The return's nine `RESULT_SHA256` values are listed under `## Certification audit`. All nine reproduced
  exactly on a copy-out-first replay in my scratch (`python3 -B`). The U2 scratch directory was byte-unchanged before and after
  (see the inventory).
- **Read-boundary and process items** (the seat's own disclosures and the controller record):
  - one unauthorized skill read;
  - two `ls` calls outside the grant;
  - one `find -maxdepth 3` inside a granted directory;
  - one `/tmp` write, deleted;
  - `ps`-located harness jobs.
- **What the disclosures understate.**
  - The return's closing sentence says it ran `ps aux | grep python3`, which is a full process listing, and ran it again before
    finalizing. The disclosure says only "ps".
  - The return reports replays in `scratchpad/c5-U2-replay/`, a sibling directory outside the seat's inventoried scratch path. I
    did not open it.
  - The Stage 3 disclosures record states that "gate-31 lines [are] present on all six returns". For U2 only
    `Central obligation attempted: yes` is present. There is **no line naming two instruments for `S`**, and indeed no script of
    the return computes `S` at all (`tree_lib.aggregate_S` is defined but never called).

## Independent re-derivation

**My instrument.** It lives in `scratchpad/c5-crit-U2-F/own/`, uses the standard library only, and imports nothing from
`scratchpad/c5-U2`. It was built from SEMANTIC-CONTRACT §1.2:

- a tree class with separate connectivity (BFS) and acyclicity (DFS parent) checks;
- an iterative forest DP for independence polynomials;
- `x` scanned through rank `α` inclusive;
- `F_p` derived from `Δ_p(T − v)` on the original tree;
- `S` as `C5LA1.aggregate` from `T − H_v` and `T − R_v`;
- the literal `w_F` computed from `N(s_v)`;
- the literal (D) ∪ (S) relation;
- its own Dinic max-flow.

**Fixed points.** All reproduced, each with `supply − capacity = S` asserted from independently computed sides:

- `K_{1,12}/8`: `n = 13`, `α = 12`, `x = 6`, 12 of 12 leaves favorable, 1980 / 3960 / flow 1980, `S = −1980`.
- Path-star `(2,3,4)/7`: 1483 / 2701 / 1483, `S = −1218`, 2025 arcs.
- Path-star `(2,2,4,3)/8`: 8033 / 13467 / 8033, `S = −5434`, 11691 arcs.
- `CB(8,92)/492`: `n = 1567`, `α = 829`, `x = 490`, window `[492, 552]`, 737 of 737 favorable, `S < 0` (351 digits),
  `|R_491|/|R_490| = 492/491`.
- `G(8^82,7^2)/448`: `n = 1427`, `α = 755`, `x = 446`, window `[448, 503]`, 671 of 671 favorable, `S < 0`.

**(a) Literal small-pattern check** (`smallcheck.py`; 108 rows; every rank `1 ≤ p < α`). The patterns were `CB(1)`–`CB(5)` at
`m = 1`; `CB(1,2..4)`; `CB(2,2)`, `CB(3,3)`, `CB(2,2,2)`, `CB(4,4)`, `CB(2,2,2,2)`; and the heterogeneous `[2,3]`, `[1,2,3]`,
`[3,4]`. On every row the script asserts, by full enumeration of `I_{p+1}` and `I_p`:

- WID;
- New Lemma 1's three-regime weight formula, on every source `B`;
- the sector size `C(D,K)·2^K`;
- the closed forms `supply`, `cap_D` and `SW` against literal image weights.

It also reports the full-network max deficiency and the sector-only max deficiency. There were 0 failures after one correction
of my own `cap_D` edge case: the closed form must vanish at `K = D + 1`. U2's `flatten_capD` has the same edge defect
(`0 ≤ K−1 ≤ D`). It is harmless only because the empty-sector rows are skipped.

**(b) Orbit-quotient instrument** (`quot.py`). The group is `Γ = S_d ≀ S_m`, a product over degree classes for heterogeneous
patterns.

- Orbits are keyed by the arm state plus the multiset of per-choke states (`('N', k, j)` or `('U', ℓ)`).
- Weights and arcs are computed **literally on one representative per orbit**, with each target canonicalised.
- The instrument asserts that orbit sizes sum to `i_{p+1}` and `i_p`, and it asserts WID.

The max quotient deficiency equals the maximum over `Γ`-invariant `X`, by the converse of (LIFT). It also equals the global
maximum, because the union of all maximizers is a maximizer and is invariant (the lattice argument of the C2-LA1 key). I checked
the quotient against (a) on all 108 rows, comparing full deficiency, sector deficiency and `S`: 0 mismatches
(`quot_validation.log`).

**(c) Re-derivation of U2's statements.**

- **New Lemma 1 (regime decomposition).** Correct, and the proof is a direct reading of the definitions:
  - if `r ∈ B`, every `u_i` is absent, so every private tag is inactive;
  - `v` is active iff `r ∈ B`;
  - for `r ∉ B`, a private tag is active iff its own `u_i ∈ B`.

  Literally confirmed on every source of 108 rows, including heterogeneous ones.
- **Sector closed forms.** Correct at `1 ≤ K ≤ D`. My independent proof:
  - The deletion image of the whole sector level is the whole level `K − 1` of the sector. Deleting `r` or `v` gives weight-0
    targets.
  - The only positive-weight switch vertices from a sector source are `u_i` with `j_i = 1` (the vertex `s` gives weight 0).
  - A switch target `A` determines its firing choke (the unique `u_i ∈ A`) and has `d_i − k + 1` sector preimages. Such a target
    has `r ∉ A`, so it is never a sector deletion image.
  - Counting targets rather than arcs gives `Σ_k C(d_i, k−1)(k−1)·C(D − d_i, K − k)·2^{K−k}`.

  Grade `proved_informal`, with the range `1 ≤ K ≤ D` stated.
- **Regular-bipartite lemma.** Correct (double counting on a biregular bipartite graph). It is, however, the normalized-matching
  property of the claw product `Π K(2)` of the `D` columns. See the fence section.

**(d) The six eligible rows with the selector DERIVED** (`bigrows.py`). All five first ranks and `G/448` give
`1_v = 1` and `1_c = 1` for every degree class, and U2's `supply`/`cap_D`/`SW`/`δ` integers are reproduced exactly.

## Attacks and findings

**F1. The sector is not without loss of generality: the return's reduction scope is wrong** (critic-derived; bounded, exact,
two instruments).

- **What the return does.** It restricts its main analysis to `sec_m` (regime 2). It justifies this only by the exclusion of
  regime 1, which carries zero supply. Regime-3 sources (`r ∉ B` with a `U`-state choke carrying leaves) have positive supply.
  Their deletion images are exactly the switch targets that `SW` credits wholly to the sector. This is the competition for
  target capacity that protocol duty 3 names.
- **The counterexample row.** `CB(11,2)` at `p = 16`: `n = 49`, `α = 25`, `x = 16`, NOT eligible, `|F| = 23`,
  `S = −111739804 < 0`.
  - The sector-only max deficiency is **0**.
  - The full-network max deficiency is **22458436 > 0**.
  - The maximal maximizer consists of all 268 sector orbits plus 140 regime-3 orbits (arms `{v}` and `∅`, each with a `U`-choke).
- **Same shape elsewhere.** The same mixed shape is the maximizer at `CB(9,2)/13` and `CB(10,2)/14`.
- **Consequences.**
  - A reduction of (HALL) on the CB class to "per-rank closed-form sector inequalities" is not a reduction. The extremal family
    couples regimes 2 and 3.
  - The return's `## Remaining obligation` item 3 ("search regime 3") is therefore not a side item. It is load-bearing for the
    mandate itself.
  - The row is a new non-eligible laboratory record of the refuted Cycle 3 conjecture ("`S ≤ 0` ⇒ saturation" fails), like
    `CB(7,1)/6`. It is **not** a cut.

**F2. The regular-bipartite lemma is claimed as new but is the registered CD-1 key at `q ≡ 2`.**

- The sector's deletion poset is the product of `D` identical claws `{∅, S, L}`, whatever the choke pattern.
- The CD-1 key (`E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`, `proved_informal`; allocation, standing state) states
  `|∂X|·e_k(q) ≥ |X|·e_{k−1}(q)`. At `q_i ≡ 2` this is exactly U2's `|N_D(X)| ≥ K|X| / (2(D−K+1))`, since
  `e_K(2,…,2) = C(D,K)·2^K`.
- Its whole-level extremum is the SEMANTIC-CONTRACT's `CB(8,92)` record (`|R_491|/|R_490| = 492/491`, shortfall `|R_490|/491`).
- "For every choke pattern" is vacuous, because the poset does not see the pattern.
- The return's verdict phrase "the DELETION-ONLY part of the network is always reduced to one closed-form inequality per rank"
  overstates the lemma. It covers the sector sources and sector targets only, not the non-sector deletion network, which is
  E1/E1-R territory.

**F3. The five-row and `G/448` evaluation.**

- **Selector hard-coded.** `run_wholesector_scan.py` sets `1_v = 1_c = 1` for the five rows (fence §3.3: `F_p` must be
  DERIVED). My derived values agree, so the numbers stand, but on my evidence, not U2's. `G/448` did derive its indicators.
- **"cap_D alone already dwarfs supply at these … ranks" is FALSE.** At all six rows `supply > cap_D`, with ratios
  `460/459`, `476/475`, `492/491`, `578/576`, `674/672` and `448/447`. That is precisely why these are the switch-necessary rows.
  The whole-sector test passes only because `SW` exceeds the deletion surplus by a factor of about 5,000–10,000.
- **"The worst case" is backwards.** Calling `1_v = 1_c = 1` "the worst case" is wrong: `1_c = 1` is the most favourable
  switch case. With `1_c = 0` all six whole sectors would be deficient.
- **No second proof.** The evaluation is a necessary condition that was already known to hold. It gives **no** independent second
  proof of the five-row certificates (answering the attack brief: no).

**F4. `CB(1,m)` characterization: correct in substance, but the proof as shipped is conditional.**

- **Where the return's proof is conditional.** Its "for every `m`" proof uses `x(CB(1,m)) = m + 1`, which is only a bounded
  check (`m ≤ 80`). Its "exhaustive for `m ≤ 80`" search of deficient `(m, K)` checked `1_v` literally only for `m ≤ 8` (44 rows;
  the `m ≤ 80` loop checks `x`, `α` and the algebra only).
- **Critic-derived repair (proof).** Write `I(CB(1,m)) = y(1+y)(1+2y)^m + (1+2y)(1+3y+y²)^m`.
  - The first summand's coefficients `c_{k−1} + c_{k−2}`, with `c_j = C(m,j)·2^j`, are nondecreasing for `k ≤ (2m+2)/3`.
  - `(1+3y+y²)^m` is real-rooted and palindromic with centre `m`, so it is nondecreasing up to `m`, and so is `(1+2y)` times it,
    up to `k ≤ m − 1`.
  - Hence `Δ_k(T) ≥ 0` for `k ≤ min(⌊(2m+2)/3⌋, m − 1)`. For `m ≥ 5` this gives `x ≥ ⌊(2m+2)/3⌋ + 1`, so every eligible `p` is
    at least `(2m+9)/3`.
  - A positive sector deficiency needs `3(p − 1) < 2m + 2`, that is `p < (2m+5)/3`. So there is no eligible sector deficiency
    for any `m ≥ 5`.
  - For `m ≤ 4` the window is empty. (The prefix inequality was also checked numerically for `5 ≤ m ≤ 80`.)
  - Grade `proved_informal` for the SECTOR statement.
- **Critic check of the exact list.** With `1_v` derived, the positive rows for `m ≤ 80` are exactly `(1,1)`, `(3,2)` and `(4,3)`,
  with `δ = 1, 6, 8`, all non-eligible. `x = m + 1` and `α = 2m + 1` also hold for every `m ≤ 80`.
- **Scope caveat.** This is about the sector only. The return's word "complete resolution" does not cover (HALL) on `CB(1,m)`.
  My quotient instrument supplies the bounded full-network check: (HALL) holds at all 126 eligible ranks of `CB(1,m)`,
  `7 ≤ m ≤ 32`. That includes `CB(1,7)/10`, where E1 fails, and it is `bounded_computation`.

**F5. The `CB(d,2)` table.** The two rows the brief names are reproduced:

- `CB(8,2)/11`: `n = 35`, `x = 12`, `α = 19`, window `[14, 12]` empty. `S = 2342912 = δ(sec) = true max`.
- `CB(11,2)/15`: `x = 16`, `α = 25`, window `[18, 16]` empty. `S = 1164247040 = δ(sec) = true max`.

Findings on the table:

- **The `1_c = 0` rows carry no switch information.** At every `1_c = 0` row (`d = 5, 8, 11`, and `14` at `K = 18`),
  `F_p = {v}` (`|F| = 1`), all supply sits in the sector and the "sector deficiency" equals the aggregate `S(T,p) > 0` exactly.
  These are non-eligible `S > 0` rows and are uninformative about switches.
- **Correction of what `CB(10,2)/14` reproduces.** `CB(5,2)/7` equals the true maximum 5376. For `CB(10,2)/14` my quotient gives a
  true sector max of **34893540**. That matches the SR-C4-9c value quoted by U2, so the whole-sector 7130880 is a strict lower
  bound; the full-network maximum is 86940920. The return's claim that it reproduces "SR-C4-9c's `CB(5,2)/7` and `CB(10,2)/14`
  records exactly" holds only for `CB(5,2)/7`.
- **The `d = 9` gap is an artifact** (critic-derived explanation).
  - For each `d ≤ 16` there is exactly one rank with `1_v = 1`, `1_c = 1` and a deletion surplus. At that rank
    `SW > supply − cap_D` for `d ≤ 9` (at `d = 9`: 17830656 > 10862592) and `SW < surplus` for `d ≥ 10`.
  - `d = 8` appears in the list only through its `F = {v}` row.
  - So there is no non-monotonicity in the switch mechanism: the sector test on the `1_c = 1` rank fails first at `d = 10`.
  - The true sector max at `CB(9,2)` is 0 at every rank (quotient).
  - But the whole network at `CB(9,2)/13` is deficient: 4204932 > `S = 2424264` > 0. The return's statement "`d = 9`: NO
    deficiency at any `K`" is true only of the sector.
- **The heterogeneous whole-sector test undercounts at tiny orders** (literal):
  - `[2,3]/4`: true sector max 15 against whole-sector 10.
  - `[1,2,3]/5`: true sector max 3 against whole-sector −40.

  So `## Remaining obligation` item 4's plan ("cheap `whole_sector_delta` grid") would miss deficiencies.

**F6. Other items.**

- **Orbit key on heterogeneous patterns.** `network.orbit_key` sorts per-choke `(k, j)` pairs across chokes of different degrees.
  On a heterogeneous pattern that merges distinct `Aut`-orbits, so unions of its classes are a strict subset of the invariant
  families. It was used only on homogeneous exhaustive runs, so no shipped number is affected. It must not be reused as the orbit
  key on heterogeneous patterns.
- **The heterogeneous `run_heterogeneous.py` run** took 42 s on my replay. The return says the longest run was about 9 s.
- **No circularity, `ℕ`-subtraction or quantifier defect** in the three retained statements.

## Mechanism-equivalence and fence check

- **None of the ten refuted mechanisms is revived.** The objects are sector counting identities, not a transport rule.
- **The regular-bipartite lemma is an alias** (special case `q ≡ 2`) of the registered
  `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING`, homogeneous case of (NM). It must not be registered as
  `R30-CB-RECORD-C5-REGULAR-BIPARTITE-DELETION-SHADOW-EXTREMALITY`. Its lexical zero-hit check does not clear the mathematical
  alias.
- **Name 2** (`…CBDM-WHOLE-SECTOR-SUPPLY-DELETION-SWITCH-CAPACITY-IDENTITY`) is a legitimate record-level generalization of the B9X
  record. Its hypotheses are `1 ≤ K ≤ D` and target-weight counting (not arcs).
- **Name 3** (`…CB1M-ROOT-ARM-SECTOR-DEFICIENCY-CHARACTERIZATION`) is acceptable as a sector record at `proved_informal`, on the
  critic's proof in F4. The name correctly says SECTOR. It must not be read as (HALL) on `CB(1,m)`.
- **Name 4** is a bounded record. Four of its rows are trivially `F = {v}` rows, and "whole-sector deficient" there means only
  `S > 0`.
- **Fences.**
  - A sector fact is not (HALL) (§3.1).
  - The five-row evaluation hard-codes `F_p` (§3.3); it is struck as U2's evidence and restored by my derivation.
  - The census is exact and deterministic, with no census value used in a proof.
  - No RTree wording.
  - No closed region re-proved as a contribution.
  - (LIFT) and C2-LA1 are used only for invariance.
- **No (CUT) candidate at any eligible row**, in U2's return or my runs.
- **Ruling 39:** the return supplies none of (a′)–(d′).
- **Ruling 30:** it supplies nothing toward the standing letters (a)–(d) either.

## Certification audit

**Backed** (replayed or re-derived):

- The nine `RESULT_SHA256` digests:

  | Digest | Script |
  |---|---|
  | `5275c684…` | regime |
  | `357c6f68…` | exhaustive |
  | `a3b197aa…` | maxflow |
  | `80bd5b67…` | reduction |
  | `f8c75f6f…` | SW |
  | `d6123fc2…` | whole-sector scan |
  | `01c1cd0e…` | `CB(1,m)` |
  | `ae10b85b…` | m2 boundary |
  | `22735596…` | heterogeneous |

- The `N_DEFICIENT: 9 of 117` literal.
- The `CB(d,1)` values (1, 3, 3, 20, 25, 280, 21, 406); maxflow instrument only.
- `x = m + 1` and `α = 2m + 1` for `m ≤ 80`.
- The `G/448` fixed point, and all closed-form integers at the six rows.

**Struck or corrected:**

1. "(WID) asserted on every literal instance": **struck**. No script computes `S`.
2. "`sector_members` … verified against brute force (`brute_force_check=True`, `d, m ≤ 3`)": **struck**. The flag is never
   passed in any shipped script. My literal check restores it on 108 rows.
3. "`run_sector_exhaustive.py` … was run on `CB(d,1)`, `d = 1..9`, every `k`" and "two instruments agreeing on every overlap":
   **struck**.
   - The exhaustive script contains no `m = 1` case. Its digest `357c6f…` is of 19 `m ≥ 2` rows.
   - The `CB(d,1)` table rests on `run_sector_maxflow.py` alone, and three `d = 9` ranks were skipped.
   - The `run_crosscheck.py` its docstring cites is not shipped.
4. "`run_sector_maxflow.py` … confirms zero deficiency at `CB(d,2)`, `d ≤ 4, 6, 7, 9` and `CB(d,3)`, `d ≤ 8`": **struck**. The
   script covers `m = 2`, `d ≤ 6` and `m = 3`, `d ≤ 4`, with 23 rows skipped as too large.
5. "190 homogeneous + 40 heterogeneous instances" / "230 literal instances" / "145 rows": **inflated; corrected**. The underlying
   data is:
   - 105 reduction rows, of which 9 were skipped and 56 have `1_v = 0` (trivially `0 = 0`), leaving 40 nontrivial;
   - 85 SW row-checks, of which 46 have `1_c = 0` and 32 are nonzero;
   - 40 heterogeneous rows.

   These are row-checks on overlapping instances, not distinct instances.
6. "exhaustive over `m ≤ 80`" for the `CB(1,m)` deficient list: **corrected**. It was literal for `m ≤ 8`, and critic-verified
   for `m ≤ 80` (`cb1m_check.py`).
7. "`m ≥ 2` exhaustive: 19 instances, zero deficiency": true, but 11 of the 19 have zero supply (vacuous). Only 8 are informative.
8. "cap_D alone already dwarfs supply": **false** (F3). "the worst case `1_v = 1_c = 1`": **false**.
9. "reproduces … `CB(10,2)/14` exactly": **struck**. Only the lower bound is reproduced (F5).
10. "`d = 9` … no deficiency": sector only (F5).
11. "three independent reproductions": these are reruns of the same code (reproducibility, not independence). "longest single
    foreground run ~9 s": not reproduced (42 s).

**`## Remaining obligation` judged inexact.**

- It omits that regime 3 enters the maximizer (F1).
- Item 1's premise "`cap_D` is exactly the regular-bipartite extremum (item 1 below is therefore free)" is circular in wording
  and ignores the regime coupling.
- The reduction target itself must be re-stated over sector ∪ regime-3 sources.

## Verdict

verdict: retained_narrowed
headline_resolved: no

**Retained:**

- New Lemma 1, the three-regime weight decomposition of `CB(d,m)` and heterogeneous patterns: `proved_informal`.
- The whole-sector supply / `cap_D` / `SW` identity at `1 ≤ K ≤ D`: `proved_informal`. It is a record generalizing B9X.
- The `CB(1,m)` SECTOR characterization: `SW ≡ 0`; the true sector max is `max(0, C(m,K)·2^K − C(m,K−1)·2^{K−1})`; there is no
  eligible sector deficiency for any `m`. `proved_informal` on the critic's F4 proof. The list of three rows is
  `bounded_computation` for `m ≤ 80`.
- The `CB(d,2)` rows as non-eligible `S > 0` laboratory records (`bounded_computation`), with the `F = {v}` caveat.

**Narrowed or struck:**

- The regular-bipartite lemma as a new key (alias of CD-1 at `q ≡ 2`).
- The five-row evaluation as U2 evidence (hard-coded selector; false inequality prose).
- The sector-only scope as a reduction of (HALL).
- Every literal listed in the audit.

**Answers to the attack brief.**

- Is the remaining obligation a finite closed-form check per rank? **No.** It is still an unbounded structural claim, now known to
  couple regimes 2 and 3.
- Is it an independent second proof of the five-row key? **No.**

No mathematics here completes (HALL) on any infinite switch-necessary class.

## Remaining obligation

1. State and prove a per-rank extremal-family theorem on `CB(d,m)` whose source family is the sector **together with** the
   regime-3 orbits (`r ∉ B`, `U`-state chokes). Target capacity for the switch images `{v, u_i, leaves}` must be shared between
   sector switch arcs and regime-3 deletion arcs. The first test case is `CB(11,2)/16`, where exactly this coupling is deficient
   (22458436, with `S < 0`).
2. Only then attempt the per-choke vector threshold `(j_1, …, j_m)`. The single-choke `CB(d,1)` suffix theorem does not transfer
   while regime 3 is omitted.
3. Register nothing under the regular-bipartite name. Cite the CD-1 key.
4. The (HALL) status of the eligible `CB(d,m)` rows with `d ≤ 5`, where E1 fails, stays bounded. I checked 169 rows exactly
   (quotient over `S_d ≀ S_m`, validated against the literal network on 108 rows), and all hold. A uniform statement for these rows
   is open, and it lies outside the E1/E1-R criteria.
5. For heterogeneous patterns, use true `Aut`-orbit keys that include each choke's degree, and never use the whole-sector test as
   a certificate. It undercounts at `[1,2,3]/5`.

## Artifact inventory

All paths are under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-U2-F/`.
Everything was run with `python3 -B`, standard library only, and no network.

**U2 replay and snapshot:**

- `replay/`: a byte copy of U2's 12 scripts, re-run there. The nine logs and `*_RESULT.json` files reproduce all nine digests.
- `u2_scratch_digests_before.txt` (`55a5a74d…`): SHA-256 of U2's scratch files. It was re-checked after my work and is unchanged.

**My instrument** (in `own/`):

| File | SHA-256 |
|---|---|
| `clib.py` | `3db0f19d…` |
| `cbfam.py` | `44bff568…` |
| `quot.py` | `fccf9bad…` |
| `smallcheck.py` | `2a7fc994…` |
| `fixed_points.py` | `c5aefd9e…` |
| `bigrows.py` | `6cf376dc…` |
| `elig_scan.py` | `f59a516f…` |
| `cb1m_check.py` | `c836e939…` |

**Outputs** (in `own/`):

| File | What it holds | SHA-256 |
|---|---|---|
| `smallcheck_default.json` | 108 literal rows | `cccf7432…` |
| `quot_validation.log` | quotient vs literal, 108 of 108 agree | `da75ad53…` |
| `cbd2_quotient.log` | `CB(5/8/9/10/11, 2)`, every rank | `e98f02d1…` |
| `elig_d1_m1-32.json` | 126 eligible rows, 0 deficient | `5e261a04…` |
| `elig_d2_m1-12.json` | 18 rows, 0 deficient | `a247a8c3…` |
| `elig_d3_m1-9.json` | 13 rows, 0 deficient | `ee764d76…` |
| `elig_d4_m1-9.json` | 8 rows, 0 deficient | `65ce3edb…` |
| `elig_d5.log` | 4 rows, 0 deficient | `024b9712…` |

- `elig_d4_m1-9.json`: `CB(4,4..7)` complete, plus `CB(4,8)/25` only.
- `elig_d5.log`: `CB(5,4..6)` complete. The run was killed by literal PID during its `CB(5,7)/26` row, which is not reported.
- The `CB(1,m)` `m ≤ 80` check result has SHA-256 `324a9557…`.

**Background jobs.** The harness auto-backgrounded two commands:

- the `d = 3..5` scan loop, whose Python child is PID 21420 under the `gtimeout` wrapper PID 21419. I located it by `lsof` on its
  own log file, not by a process listing;
- a wait loop on that log.

Both were stopped before this final write:

- PIDs 21420 and 21419 were killed by literal PID (`kill 21420 21419`). `lsof` then showed no writer.
- The wait loop was stopped by its harness task id.

No background job remains. The harness's own task-output files sit in its temp area; I did not write them. No `__pycache__` was
created.
