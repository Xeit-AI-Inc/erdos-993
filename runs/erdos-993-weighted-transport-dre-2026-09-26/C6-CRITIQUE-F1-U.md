# Critique

Critic `C-F1-U` (orientation U, formal / structural) of route return `F1` (`C6-F-01 WHOLE-NETWORK-MIXED-FAMILY-CUT-SEARCH`,
orientation F), Cycle 6, r30. Dispatch `control/dispatch/c6-stage4/DISPATCH-C-F1-U.md`, SHA-256
`12914952c15474d90bbb92ad16d2323402b18f1d2bb4eeb928597230e71a6bd1`, checked with `shasum -a 256` before I followed it.

**Boot acknowledgment.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md`
and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. I loaded no other VerityOS subsystem. The host placed the
project `CLAUDE.md` and the auto-memory index in context. I acted on neither beyond this acknowledgment, and I kept no
conversation log, because this dispatch confines writes to this file and my scratch.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

Standing letters (gate ruling 30; its text is not a capsule member, so I read the letters through the attack brief's gloss):
the return supplies **none**. It gives no (CUT) candidate, no restricted (HALL) at `proved_informal` or better, and no
Lean-ready statement. It leaves bounded records and a validated generating-function building block. This critique adds two
critic-derived structural lemmas (A-1, A-3) and a bounded exclusion of one mixed family class at both target rows (A-2).

## Identity and seal audit

- **Capsule seal** (`control/c6-critic-capsules/F1-PACKET-MANIFEST.json`): I recomputed SHA-256 over canonical JSON without
  `seal_sha256` (sort_keys, separators `(",", ":")`, no trailing newline). The result is
  `1fab8090e38aa38593c68ebea2868eb08b78535e43e515a9f31556196a2efa14`, equal to the recorded value and to the dispatch's value.
  All 14 members match their recorded byte counts and SHA-256.
- **Stage 2 seal** recomputed `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611`: it matches.
  **Stage 3 seal** recomputed `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd`: it matches. The Stage 3
  record for `cycles/cycle-6/stage3/returns/F1/RETURN.md` is `9c0b4c89…af96`, and the file matches it. The Stage 3 record for
  `control/dispatch/c6-stage3/DISPATCH-F1.md` is `04056441b3aa…d466`, which is the digest the return quotes. **Stage 4 dispatch
  seal** recomputed `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50`: it matches, and all 13 of its members
  match.
- **Digests the return lists.** The three frozen sources match `control/SOURCE-DIGESTS.json`: `cb-switch-cut/run.py`
  `94ced046…`, `cb-switch-cut/RESULTS.json` `873cf922…` and `ordinary_tree_checked.py` `a012bb78…`. All six scratch artifacts
  under `scratchpad/c6-F1/` match the return's inventory byte-for-byte: `copied_adj_quot.py` `e36e50dc…`,
  `copied_adj_shape.py` `b04130d0…`, `tree_check.py` `b874c8ad…`, `gf_lib.py` `640f8201…`, `f1_main.py` `0510341d…` and
  `f1_main_output.json` `b15d3069…`. I could not verify the return's claim that `copied_adj_quot.py` is byte-identical to the
  Cycle 5 `scratchpad/c5-adj-U/own/adj_quot.py`, or its upstream digest `de482ede…` for `adj_shape.py`, because that directory
  is outside my grant. The copies are digest-consistent with the return's own table only.
- **Replay** (copy-out-first into `scratchpad/c6-crit-F1-U/replay/`, `python3 -B f1_main.py`, 6.9 s): the output is
  byte-identical. It gives `RESULT_SHA256 e2c9e99fb0c88d256616b4f10dcfbf24755a7f1bd5b4ca46f661e0b4494855bb`, and the regenerated
  `f1_main_output.json` has SHA-256 `b15d3069…0f42`, the same as the shipped file.
- **Process.** The return self-disclosed two non-recursive `ls` calls of the bare `scratchpad/` (names only). They are
  transcribed in `control/C6-STAGE3-READ-BOUNDARY-DISCLOSURES.json`. It reports no background jobs, and its code is consistent
  with foreground-only runs. The return's model disclosure is "sonnet/xhigh; `claude-sonnet-5`", which matches the allocation's
  route charter. The gate-31 line is present: "Central obligation attempted: yes … NOT completed".
- **My own read-boundary disclosures.**
  1. My first digest loop over `control/C6-STAGE3-PACKET-MANIFEST.json` opened the bytes of all 65 Stage 3 members to hash
     them. These include sibling returns and the Cycle 4 `F1/U` critique. I printed only the F1-related match results. No
     content was displayed or used.
  2. The Stage 4 loop likewise hashed two dispatch-manifest members that are not in my capsule:
     `control/CLAIM-STATUS-LINT-c6-stage3.json` and `control/PATH-CHECK-c6-stage4-dispatch.json`. I hashed them only.
  3. A `grep -n '^#'` over the attack-briefs file, which is a capsule member, displayed the heading lines of the other seats'
     sections. I read only the preamble (lines 1–20) and the F1 section.
  4. I ran non-recursive `ls` on `sources/`, `sources/authority/`, `scratchpad/c6-F1/` and my own scratch. I opened
     `sources/authority/CLAIM-IDENTITY.json`, which the grant covers, for the lexical alias check.
  5. The harness saved the F1 return's text to a tool-results file under `~/.claude/projects/…`, and I read it there. It is
     the return's own content.
  6. The attack brief names the controller replay "CF-REPLAY-c6a (a capsule member)". It is **not** a member of my capsule,
     so I did not read it. I recomputed both integers myself (below).

  No other VerityOS file, return, critique, adjudication or other root was read. I used no network and installed nothing. I
  started no background job, so there was nothing to kill. I ran no process listing.

## Independent re-derivation

My instrument is `scratchpad/c6-crit-F1-U/own/`. It uses the standard library and exact integers, and it is my own code with
its own labelling. `lit.py` builds `CB(d,m)` literally, tests `IsTree` (connected with `n − 1` edges) and computes
independence polynomials by its own rooted DP. It computes `x` through rank `α`, derives `F_p` literally from `Δ_p(T − v) < 0`
on the original tree, and computes the literal active weight and the literal (D)∪(S). It also has a literal max-flow restricted
to any source predicate. `closed.py` holds closed forms that I derived myself:

- `I(T) = (1+2x)·P^m + x(1+x)(1+2x)^{dm}`, with `P = (1+2x)^d + x(1+x)^d`.
- `I(T−v) = (1+x)P^m + x(1+2x)^{dm}`.
- `I(T−c) = (1+2x)P^{m−1}P′ + x(1+x)^2(1+2x)^{dm−1}`, with `P′ = (1+x)(1+2x)^{d−1} + x(1+x)^{d−1}`.
- `q_v(j) = 2^{j−1}C(dm, j−1)` and `q_c(j) = [x^j] x(1+2x)(1+x)^{d−1}P^{m−1}`.
- A dual-number layer-weight series in which each private tag in a U-choke carries the activity marker.

**Literal validation first** (`validate_small.py`, `RESULT_SHA256 c2099ce4…`). The check covers `CB(2,1)`, `(2,2)`, `(3,1)`,
`(3,2)`, `(2,3)`, `(4,2)` and `(3,3)`, at every `p` from 1 to `α − 1`. It confirms:

- the closed forms equal the DP;
- layer counts equal literal enumeration;
- the literal layer weights `Σ_B w_F(B)` equal the dual-number series;
- (WID) holds with the aggregate side taken from literal deleted-graph DPs over the literal `F`;
- at 20 rows, the literal sector supply, the deletion-image weight and the switch-image weight of `N(Sector)` equal
  `C(D,K)2^K`, `C(D,K−1)2^{K−1}` and `SW = m·Σ_{γ≤d−1} C(d,γ)·γ·C(D−d, p−2−γ)·2^{p−2−γ}`.

That last line is my re-derivation of U2's `SW`: a switch at `u_i` (sector source, `β_i = 1`) lands on the arm-`{v}` target
with one U-choke of `γ ≤ d − 1` c's and weight `γ`. These targets are disjoint from the sector targets.

**Target rows** (`targets.py`, `RESULT_SHA256 1c11b4b5…`):

| Row | `n` | tree | `α` | `x` | window | leaves / `|F|` | WID (two sides) | `S` | `Δ_x` |
|---|---|---|---|---|---|---|---|---|---|
| `CB(9,112)/673` | 2131 | yes | 1121 | 671 | `[673, 747]` | 1009 / 1009 | equal | negative, 481 digits | negative, **477** digits |
| `CB(8,95)/508` | 1618 | yes | 856 | 506 | `[508, 570]` | 761 / 761 | equal | negative, 363 digits | negative, **361** digits |

- **Favorability.** `F_p` was derived by literal DP for `v` and for private leaves `c_{0,0}`, `c_{⌊m/2⌋,⌊d/2⌋}` and
  `c_{m−1,d−1}`, and cross-checked against the closed forms. The remaining private leaves follow by `S_d ≀ S_m` automorphisms.
- **WID.** Side A is `Σ_{v∈F}[q_v(p) − q_v(p−1)]` from literal deleted-graph DPs, conditioned on `F`. Side B is the
  dual-number weighted layer difference.
- **`S`.** My `S` equals F1's exactly (hash-compared).
- **Sector ratio.** `SW/(supply − cap_D)` is exactly **4401.466603449473…** (a reduced rational with a 17-digit numerator and a
  13-digit denominator) at `CB(9,112)/673`, and **7476.316339192683…** at `CB(8,95)/508`. Both confirm F1.
- **Asymptotic.** `supply − cap_D = C(D,K−1)2^{K−1}(2D − 3p + 5)/K` with `K = p − 1`. With `C(D−d, K−1−γ)/C(D,K−1) ≈ (2/3)^γ(1/3)^{d−γ}`
  this gives `SW/deficit ≈ D²(2/3)^d/(3(1+j))`, where **`j = 2D − 3p + 4`**. This is the Cycle 5 C-F1-U form, with `j`
  identified. Here `j = 0` at `CB(8,95)/508` and `j = 1` at `CB(9,112)/673`. The asymptotic gives 7512.35 (exact 7476.32) and
  4405.03 (exact 4401.47), so 7476.32 is consistent with it.
- **Regime-3 total over `SW`.** 51.141 and 107.933, which confirms F1.
- **Orbit counts.** The raw single-alphabet multiset counts are `C(65+111, 112) = 7899090…2250` (49 digits, **7.899 × 10^48**)
  and `C(54+94, 95) = 5788848…0960` (41 digits, 5.789 × 10^40). My own size-filtered multiset DP (`orbitcount.py`,
  `RESULT_SHA256 3249affb…`) is validated against explicit `combinations_with_replacement` enumeration at five small rows. It
  gives the exact numbers of `S_d ≀ S_m` orbits of the right size (all five arm states, each with its correct alphabet):

  | Row | source orbits (size `p+1`) | target orbits (size `p`) | reduction from the raw count |
  |---|---|---|---|
  | `CB(9,112)/673` | 2.130 × 10^47 | 2.138 × 10^47 | factor 37.1 |
  | `CB(8,95)/508` | 1.880 × 10^39 | 1.885 × 10^39 | factor 30.8 |

- **Laboratories.** The replay reproduces F1's §8 table. I re-ran the copied ADJ-U max-flow in my scratch with my own
  summariser (`inspect_lab.py`, `RESULT_SHA256 80394d1e…`) to break down the maximizers. This is a replay of the same code, not
  an independent instrument.

## Attacks and findings

**F-1 (arithmetic literal; brief item).** In F1's §9 table, `CB(9,112)` is printed as `≈ 7.90 × 10^{49}`; the exact integer has
49 digits and is **7.899 × 10^48**. The route verdict's "`~10^{41}` to `~10^{49}`" gives digit counts, not magnitudes; the
counts are `~10^{40.8}` and `~10^{48.9}`. "Infeasible by roughly 41 to 49 orders of magnitude" confuses the size of the space
with the margin of infeasibility. The corrected statement is: the quotient network has `1.9 × 10^39` and `2.1 × 10^47`
source orbits, about 32 and 40 orders beyond a `10^7`-node exact max-flow. The conclusion stands.

**F-2 (the filtering attack, brief (i)).** The constraint `Σ sizes = p + 1 − |arm|` removes only a factor of 31–37, which is
far less than "most keys". The infeasibility of **exhaustive** invariant-family search survives filtering (table above). F1's
obstruction is real for completeness.

**F-3 (the verdict inference, brief (ii)–(iii)).** The obligation asked for families seeded by the `CB(11,2)/16` shape, with
"literal `N(X)` by generating functions". F1 built exactly such generating functions (`gf_lib.py`) but used them only for
regime totals, and it evaluated **no** structured family at either target row. The obstruction in §9 blocks enumeration of
every orbit. It does not block a seeded or structured sub-search. I evaluated a 3-parameter mixed class at both rows in under
10 s (A-2). "Blocked by a proven combinatorial obstruction" therefore **overstates** the case: the correct reading is
"completeness is infeasible; the seeded search was not attempted".

**F-4 (fidelity; the `F` multiplicity).** Two problems in §5 and in the code:

- §5 says the favorability of the `d·m` private leaves is "verified, not assumed, by the WID two-sided check … using the
  multiplicity `m·d` explicitly". That is circular. Both sides of F1's check use the same indicator `one_c` and the same
  multiplicity, so the check cannot detect a non-uniform `F`. The inference is valid through `Aut(CB(d,m))`-symmetry, which is
  rigorous. The phrase is struck.
- F1's aggregate side (`S_agg = […]_v + m·d·[…]_c`) does not condition on `F`. It sums over all leaves, whatever `one_v` and
  `one_c` are. It is correct at these rows only because every leaf is favorable. This is a latent fidelity defect, not a wrong
  number.

I checked three private leaves in distinct chokes and columns literally. The two sides are coded independently (a DP on
deleted graphs against a hand-derived regime series), so ruling 17/24 is not violated.

**F-5 (a mislabelled literal).** F1's §6 table gives `Δ_x` as "negative (481-digit magnitude)" and "(363-digit)". Those are
the digit counts of `S`. The true values are `|Δ_x| = 477` and `361` digits. `Δ_x` does not appear in the shipped output at
all. **Struck and corrected.**

**F-6 (unbacked cross-check).** §7 says the sector closed forms were "cross-checked against `gf_lib`'s independent
`sector_supply_gf`". No such comparison exists in `f1_main.py`, and both evaluate the same formula `C(dm, p−1)2^{p−1}`. The
claim is **struck**. My literal validation of `supply`, `cap_D` and `SW` at 20 small rows now backs the closed forms.

**F-7 ("third independent confirmation").** The §8 `maxdef` values and maximizer counts come from re-running ADJ-U's own code.
That is a replay of one computation, not an independent confirmation. F1's generating-function instrument agrees on supply and
capacity totals only.

My family class of A-2 gives an **independent lower bound** on each laboratory `maxdef`: 15,423,496 ≤ 22,458,436,
3,632,100 ≤ 4,204,932, 84,421,520 ≤ 86,940,920 and 3,542,052,800 ≤ 3,573,432,896. The class is validated literally and is a
different algorithm. The wording "third independent confirmation" / "two structurally unrelated algorithms agree" is
**struck** as applied to `maxdef`.

**F-8 (the maximizer's shape; the 73/67 literal).** The split of the 140 non-sector orbits into 73 with arm `{v}` and 67 with
arm `∅` is not produced by any shipped code (`Xmin_other` only). The critic replay **reproduces** it: 73 = 68 (one U-choke) + 5
(two U-chokes), and 67 = 63 + 4. F1 says "no simple per-choke threshold predicate … found by inspection". For the regime-3
part, that is **contradicted**. At all four laboratories, the non-sector part of the minimal maximizer is exactly:

- every arm-`{v}` source with one U-choke of `γ ≥ g_v`;
- every arm-`∅` source with one U-choke of `γ ≥ g_v + 1`;
- every two-U-choke source (size-forced).

Here `g_v = 4, 3, 3, 4` at `d = 11, 9, 10, 12`. The orbit counts per `γ` equal the full stratum counts; for example,
`CB(11,2)/16`, arm `{v}`, `γ = 4` gives 12 orbits, which is the number of `(β′, γ′)` with `β′ + γ′ = 11`. The sector part is a
proper subset, which is F1's point, and it stands. (`bounded_computation`, non-eligible rows.)

**F-9 (the ratios in §7).** Both ratios are **whole-sector** and **whole-regime** scalars. F1 says so for the regime-3 ratio,
but "switch/deficit ≥ 4401" can read as protection for mixed families. It is not: it bounds `N(Sector)` against the sector
alone.

**F-10 (§10).** Every row sits at `p = x`, which is non-eligible by definition (eligibility needs `p ≥ x + 2`); F1 says
"non-eligible". Nothing in §10 bears on an eligible row. The arithmetic of the ratios (1.0, 2.2, 3.9, 6.0, 8.8, 11.8) is
correct. However, "sector/other orbit counts" depend on the orbit-key encoding, not on weight, so the non-constancy is not a
structural invariant. It is a laboratory record only.

**F-11 (use of C2-LA1 and LIFT).** C2-LA1's statement gives an invariant, positive-weight deficient family whenever Hall
fails. The reading of the quotient `maxdef` as the global maximum over all `X` needs one more fact: deficiency is
supermodular, so the maximal maximizer is `Aut`-invariant. That argument sits in the proof of (LIFT) and C2-LA1, not in the
statement. F1's wording ("exactly what licenses … TRUE maximum") compresses this but is not wrong.

## Mechanism-equivalence and fence check

F1 proposes no mechanism. It searches the literal (HALL) object: the literal `w_F` and (D)∪(S), with `F` derived at rank `p`
on the original tree and `x` taken through `α`. The fidelity items of the protocol pass at both target rows, subject to the
latent defect in F-4.

- **Refuted keys.** None of the ten is revived. The copied relation code builds (S) only for `u ∉ B` with `|N(u) ∩ B| = 2`;
  this is my own reading of `targets()`, and my literal relation agrees.
- **Closed regions and census values.** No closed region is re-proved. No census value enters a proof. The switch-necessary
  frontier (223/218) is cited as a record.
- **RTree and (LIFT).** There is no RTree wording, and (LIFT) is not used to supply quotient feasibility.
- **Keys touched.** The return touches `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, master name kept),
  `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` and
  `E993-R30-NOT-WEIGHTED-HALL-IMPLIES-AUT-INVARIANT-POSITIVE-DEFICIENT-FAMILY`, all cited by key. It also touches the
  `R30-CB-RECORD` bucket. It proposes no new key, and none is needed.
- **My lemmas A-1 and A-3.** They are statements about the deficiency of source families in the literal network, not
  transport rules. The injection `B ↦ B ∖ {v}` in A-1 is used only to lower-bound `w(N(X))`. It is not the refuted per-leaf
  down-map key, which asserted injectivity of a per-leaf transport for the aggregate. Neither lemma is a sector-only reduction
  of (HALL); A-1 says precisely what a sector-only argument misses.
- **Alias check.** I checked lexically against the frozen 434-key registry (`sources/authority/CLAIM-IDENTITY.json`). The
  tokens `ARM-LEAF`, `ROOT-FREE`, `SECTOR-PART`, `SOURCE-FAMILY`, `U-CHOKE`, `SWITCH-FREE` and `CHOKE` have zero hits, and no
  alias pattern matches. The only `CB-` key, `E993-C3-CB-ARM-EXACT-DELETE-NEIGHBORHOOD`, concerns the refuted Delete/Retag
  relation's arm image and is mathematically distinct. The run-local registry is not in my capsule, so the synthesis must
  repeat the check there.

## Certification audit

| Literal (F1) | Status |
|---|---|
| `n, α, x`, eligibility, `1_v = 1_c = 1`, `IsTree` at both rows | **backed** (replay and my own instrument) |
| WID "bit-for-bit" at both rows | **backed**. The two sides are independently coded. "Verified, not assumed" for the multiplicity is **struck** (F-4). |
| `Δ_x` "481-digit" / "363-digit" | **struck**: the true values are 477 and 361 digits (F-5) |
| 4401.466603449473 and 7476.316339192683 | **backed** (exact rational; my closed forms validated literally) |
| "cross-checked against `gf_lib`'s `sector_supply_gf`" | **struck** (F-6) |
| regime-3 total supply / `SW` ≈ 51.14× and ≈ 107.93× | **backed** |
| §8 lab `maxdef`, sector-only `maxdef`, 268+140, 204+125, 339+167, 161+102, `S` values | **backed as a replay** of ADJ-U's code. "Third independent confirmation" for `maxdef` is **struck** (F-7). The supply and capacity totals are two-instrument. |
| "73 with arm `{v}` and 67 with arm `∅`" | unbacked by shipped code; **backed by the critic replay** |
| "no simple per-choke threshold predicate … found" | **contradicted** for the regime-3 part (F-8) |
| `≈ 7.90 × 10^{49}` | **struck**: 7.899 × 10^48 |
| `≈ 5.79 × 10^{40}` | **backed** |
| "infeasible by 41 to 49 orders of magnitude" | **struck**. Replacement: 1.88 × 10^39 and 2.13 × 10^47 size-filtered source orbits (F-1, F-2). |
| "proven combinatorial obstruction" blocking the obligation | **narrowed**: it blocks exhaustive completeness, not the seeded GF search (F-3) |
| §10 table | **backed** (replay); non-eligible, encoding-dependent (F-10) |
| Replay `RESULT_SHA256 e2c9e99f…` and output `b15d3069…` byte-identical | **backed** |
| Grades (`bounded_computation` throughout) | correct |

## Verdict

verdict: retained_narrowed

headline_resolved: no

The return's arithmetic, fidelity and laboratory numbers survive both an independent re-derivation and a replay, apart from
the struck literals above. Its route verdict `blocked` is narrowed to this: exhaustive invariant-family search is infeasible at
both rows (about `1.9 × 10^39` and `2.1 × 10^47` source orbits), while the seeded, structured generating-function search the
obligation named was feasible and was not attempted by F1.

**Critic-derived advances (attributed to C-F1-U; STATED at a review stage; each needs an isolated second read before
registration):**

**A-1 (the V-shift / S-shift lemma; `proved_informal` on this face).**

*Statement.* Take `T = CB(d,m)` with arm `r–s–v`, any `p ≥ 1`, any tag set `F` of original leaves and the literal network.
Let `X ⊆ I_{p+1}` be a family in which every member `B` with `r ∉ B` contains `v`. Then
`Σ_X w_F − w_F(N(X)) ≤ Σ_{X∩Sec} w_F − w_F(N(X ∩ Sec))`, where `Sec = {B : r, v ∈ B}`. The same holds with `s` in place of
`v`.

*Proof.*

1. Members with `r ∈ B` and `v ∉ B` have weight 0. `v` is absent, and every private tag `c_{ij}` has `W = {u_i}`, while
   `u_i ∉ B` because `u_i ~ r`.
2. For a member with `r ∉ B` and `v ∈ B`, the map `φ(B) = B ∖ {v}` is a (D)-arc, it is injective, and it preserves weight.
   `v` is inactive because `W_v = {r}`. Each `c_{ij}`'s activity depends only on `u_i`. `v` witnesses no tag.
3. Every positive-weight `A ∈ N(X ∩ Sec)` contains `r`, `v` or `s`. A deletion keeps `r` or `v`. A switch at `s` inserts `s`.
   A switch at `u_i` keeps `v`. `b_{ij}` has at most one neighbour in a sector source, and `c_{ij}` has degree 1. Meanwhile
   `φ(B)` avoids `r`, `s` and `v`. So `w(N(X)) ≥ w(N(X∩Sec)) + w(φ(X_3)) = w(N(X∩Sec)) + w(X_3)`.
4. For `s`, use `φ(B) = B ∖ {s}`. `s` is neither a tag nor a witness in a root-free set.

*Corollary.* At any `(CB(d,m), p)` where the sector sub-network is Hall for every sector subfamily, a deficient family, with
its zero-weight members pruned, must contain a root-free member without `v` **and** a root-free member without `s`. An arm-`∅`
member does both jobs. This matches F-8, where the maximizer carries arm-`∅` strata. A deficient mixed family cannot be built
from sector sources and arm-`{v}` regime-3 sources alone.

*Evidence.* Literally validated by restricted max-flow at 80 instances (`vshift_validate.py`, `RESULT_SHA256 e29d79c5…`). These
are `CB(2,2)`, `(3,2)`, `(4,2)`, `(2,3)` and `(3,3)` at every `p`, with `F` derived and with `F` equal to all leaves. The whole
network exceeds the sector maximum at 27 of them, so the lemma is not vacuous.

*Candidate key* (a predicate; lexical alias check clean against the frozen registry):
`E993-R30-CB-FAMILY-WITH-EVERY-ROOT-FREE-MEMBER-CONTAINING-THE-ARM-LEAF-HAS-DEFICIENCY-AT-MOST-ITS-SECTOR-PART`.

**A-2 (a structured mixed class excluded at both target rows; `bounded_computation`).**

*The class* `X(h, g_v, g_0)` is the union of three parts:

- the sector sources in which every choke with exactly one support has at least `h` private leaves;
- the arm-`{v}` sources with exactly one U-choke of `γ ≥ g_v`;
- the arm-`∅` sources with exactly one U-choke of `γ ≥ g_0`.

*Method.* `w(X)` and the **literal** `w(N(X))` are computed by the generating functions in `famclass.py`, whose target-type
case analysis is written in its code. They agree with the literal network at **2,628** (row, `p`, parameter) instances
(`famclass_validate.py`, `RESULT_SHA256 2a0fa83a…`).

*Calibration.* At the four laboratories the class maximum captures 69%, 86%, 97% and 99% of the true `maxdef`. At both
**eligible target rows**, every member with positive weight has **negative** deficiency: 729 members at `CB(8,95)/508` and 1000
at `CB(9,112)/673` (`famclass_run.py`, `RESULT_SHA256 8b975dd8…`).

*Where the maximum sits.* The maximum is at `h = d` with both regime-3 parts empty. That is the switch-free sector subfamily,
with `w(N)/w(X) = 18.37` and `15.88`, and deficiency `−0.00047` and `−0.0027` times the sector's deletion deficit. No regime-3
up-stratum raises the deficiency at the eligible rows: at every `h`, the best choice leaves both regime-3 parts empty. This is
the opposite of the laboratories. The whole sector gives
exactly `−(SW − deficit)`.

*Scope.* This excludes one class, not (CUT) at those rows.

**A-3 (the regime-3 stratum criterion).**

*Criterion (`proved_informal`, elementary).* Fix a root-free configuration `σ`: its `t` U-chokes and the `g` private leaves
in them. Its sources and targets form ranks `R + 1` and `R` of a product of `D″ = d(m−t) + 1` three-element stars, with
`R = p − t − g`. Each is biregular, so it has the normalized matching property. Hence the within-`σ` deletion network, which
preserves weight, is Hall for every subfamily **iff** `3R + 1 ≥ 2D″`. The sector's analogue is `3p ≥ 2dm + 5`, which fails at
both rows, as the record says.

*At the target rows (`bounded_computation`, `strata.py`, `RESULT_SHA256 a75a1375…`).*

| Row | strata failing the criterion | share of regime-3 supply | smallest failing `g` for `t = 1, 2, 3, 4` |
|---|---|---|---|
| `CB(8,95)/508` | 9,793 | 23.9% | 6, 10, 15, 19 |
| `CB(9,112)/673` | 15,097 | 26.9% | 6, 11, 16, 21 |

For comparison, the sector is 0.063% and 0.149% of the total supply at the two rows. The need for an outlet outside the
stratum (a `c`-deletion onto weight `g − 1`, or a `u`-switch) is therefore not confined to the sector. About a quarter of
regime-3 supply depends on it, and this is where a cut search belongs.

*Whole strata.* Every whole-stratum family `X_t` (all root-free sources with exactly `t` U-chokes) has deficiency at most
`W_{p+1}(t) − W_p(t) < 0`. This holds at both rows, for every `t` (`tlevels.py`, `RESULT_SHA256 ab90c249…`), because `p < dm`
puts every positive-weight `t`-level target in `N(X_t)`. The thinnest margins are at `t = 1`: capacity exceeds supply by
0.30% and 0.49%. This is a whole-stratum statement, not (HALL-COND).

## Remaining obligation

Undecided at both target rows (`CB(8,95)/508` and `CB(9,112)/673`, `F = F_p` = all leaves): (HALL-COND) for **every**
`X ⊆ I_{p+1}`. By C2-LA1 this is equivalent to (HALL-COND) for every `Aut`-invariant family of positive-weight members. No
deficient family was found, and none was excluded beyond the class of A-2.

Exact next objects:

- (i) The sector certificate for every sector subfamily at `CB(8,95)/508`. This is T2's object and is uncertified at both
  rows. Once it holds, A-1's corollary confines any cut to families that contain arm-`∅` (or twin `s`/`v`) root-free sources.
- (ii) A flow or cut computation over the root-free strata of A-3 that fail `3R + 1 ≥ 2D″`. The `c`-deletion cascade
  `(t, g) → (t, g − 1)` loses one unit of weight per step. A successor's per-choke transfer or LP reduction (F1's proposal)
  must carry this cascade, not only the sector's switch outlet.
- (iii) Wider seeded classes at scale, validated literally first: sector subfamilies with per-choke thresholds jointly with
  cascade-closed root-free families.

F1's own `## Remaining obligation` is accurate that the search is untouched, but it is inexact on three points:

- it never states the `X`-quantifier;
- it attributes the blockage to the method rather than to completeness;
- it omits that the seeded GF evaluation was feasible.

## Artifact inventory

- **Deliverable:** this file only,
  `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/cycles/cycle-6/stage4/critics/F1/U/CRITIQUE.md`.
- **Scratch:** `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-F1-U/`.
  Every run used `python3 -B`, in the foreground from `own/`. No background jobs were started, and no bytecode was written.

| File | SHA-256 | Role |
|---|---|---|
| `seal.py` | (helper) | capsule, Stage 2/3/4 seal and member-digest recomputation |
| `replay/` (six copied F1 artifacts, digests as in the return) | `e36e50dc…`, `b04130d0…`, `b874c8ad…`, `640f8201…`, `0510341d…`, `b15d3069…` | copy-out replay |
| `replay/f1_main_output.shipped.json` | `b15d3069…0f42` | shipped output, kept for comparison |
| `replay/f1_main_output.json` | `b15d3069…0f42` | regenerated output (byte-identical) |
| `replay/replay_stdout.txt` | `5e002dce…` | replay log (`RESULT_SHA256 e2c9e99f…`) |
| `own/lit.py` | `192e8fcb…` | literal instrument (tree, DP, `F_p`, `w_F`, (D)∪(S), restricted max-flow) |
| `own/closed.py` | `888c3ca3…` | closed forms and dual-number layer weights |
| `own/validate_small.py` | `3ee471fc…` | literal validation (`c2099ce4…`) |
| `own/targets.py`, `own/targets_out.json` | `332661e2…`, `69afbddf…` | target rows (`1c11b4b5…`) |
| `own/tlevels.py` | `132667ad…` | whole `t`-strata (`ab90c249…`) |
| `own/inspect_lab.py` | `7042c261…` | laboratory maximizer breakdown (replay of copied code; `80394d1e…`) |
| `own/famclass.py`, `own/famclass_validate.py` | `73e0c2eb…`, `b19ef718…` | A-2 evaluator and its literal validation (`2a0fa83a…`) |
| `own/famclass_run.py`, `own/famclass_out.json` | `9ac7d1dc…`, `f102ecb5…` | A-2 scan (`8b975dd8…`) |
| `own/vshift_validate.py` | `18359541…` | A-1 literal validation (`e29d79c5…`) |
| `own/orbitcount.py` | `296528bf…` | size-filtered orbit counts (`3249affb…`) |
| `own/strata.py` | `db97f532…` | A-3 strata and asymptotic (`a75a1375…`) |
