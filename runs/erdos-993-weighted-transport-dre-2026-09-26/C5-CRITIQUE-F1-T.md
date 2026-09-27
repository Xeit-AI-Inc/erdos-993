# Critique

Critic `C-F1-T` (orientation T, prove) on route `C5-F-01 CB-SMALL-SWITCH-CAPACITY-SECTOR-CUT-SEARCH` (seat F1, orientation F), r30 Cycle 5 Stage 4.

**Boot.** I am operating within VerityOS. I booted by reading exactly `/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`. After that I read the dispatch (SHA-256 `c0769a03…b539a`, verified) and the capsule members. The only other VerityOS content in my context is the host-injected `CLAUDE.md` and memory index. The harness supplied them and I did not open them. Other read-boundary items are listed under `## Artifact inventory`.

## Identity and seal audit

- **Capsule seal.** `control/c5-critic-capsules/F1-PACKET-MANIFEST.json`: I recomputed the seal canonically (compact, key-sorted JSON without `seal_sha256`, no trailing newline) and got `9fb580a53285a2551f4fa54b88e0a2adc11cb55b7478fdc13addca635ee99205`. It equals the recorded seal. All 14 members match their listed SHA-256 and byte counts, including the return (`0f4dac9d…3e58`, 31,343 bytes).
- **Stage 4 dispatch manifest seal.** `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d`, which matches. **Stage 3 seal.** `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58`, which matches. **Stage 2 seal.** I recomputed `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289`. That value equals the manifest's own seal, the value in `C5-CRITIC-COMMON-BRIEF.md` and the value the return reports.
- **Protocol residue (not a seal failure).** `C5-CRITIC-PROTOCOL.md` duty 1 quotes a Stage 2 seal of `f0b5a2a1bd90c8e316c2d44ecb7f8e0adad7b02c04cb4b2d8d825cfeb0869684`. No Stage 2 object I can see has that value. The manifest's own field and my recomputation both give `2e8e3d44…`. This looks like a protocol-text residue from a clone (the class covered by ruling 44), and I report it for the controller.
- **Return-listed digests.** I checked all nine of the return's §12 digests against the shipped files in `scratchpad/c5-F1/`, and all nine match: `tools.py` 77e53d0c…, `sector.py` 8887f5b8…, `favorable.py` afd2b4e4…, `brute_validate.py` 05e84c10…, `wid_check.py` 6c431387…, `F1_GENERATOR.py` 19217981…, `row_table.py` 9283271d…, `F1-GENERATOR-OUTPUT.json` 2f5a009f…, `ROW-TABLE.json` 1e4e807d…. The three sources the return cites match `control/SOURCE-DIGESTS.json`: `ordinary_tree_checked.py` a012bb78…, `cb-switch-cut/run.py` 94ced046…, `cb-switch-cut/RESULTS.json` 873cf922….
- **Replay.** I copied the files out first into `scratchpad/c5-crit-F1-T/replay/` and ran `python3 -B F1_GENERATOR.py` (50 s) and `python3 -B row_table.py` (31 s). Both outputs are byte-identical to the shipped ones: `F1-GENERATOR-OUTPUT.json` 2f5a009f…, internal digest `a1dd26fd…ea73`, `ROW-TABLE.json` 1e4e807d…, `ROW-TABLE-STDOUT.txt` a6f8ed88….
- **Seat-filed disclosure** (`C5-STAGE3-READ-BOUNDARY-DISCLOSURES.json`, F1). The seat ran one `ps aux`, a forbidden full process listing, which showed T1's process. The seat disclosed it itself and says no content was used. Nothing in the return depends on it. I note it as a process flag only. The gate-31 line is present (§14).
- **Model disclosure on the return.** "Chartered sonnet/xhigh … `claude-sonnet-5`". The two-part form is present.

## Independent re-derivation

**Instrument.** My own instrument is in `scratchpad/c5-crit-F1-T/mine/`. I wrote it from SEMANTIC-CONTRACT §1.2 and copied no line from F1's scripts. It has these parts:
- `ci.py`: a literal `CB(d, m)` builder, a tree test (edge count `n − 1` plus connectivity), a generic rooted forest independence-polynomial DP, a literal enumeration of `I_j`, the literal `w_F` (`v ∈ F ∩ B` with `B ∩ W_v ≠ ∅`), and the literal (D) ∪ (S) relation (a switch only for `u ∉ B` with `|N(u) ∩ B| = 2`).
- `fastpoly.py`: exact Kronecker products.
- `gfam.py` and `sec.py`: exact counting for Aut-invariant sector families by per-choke type decomposition.
- `supfam.py`: exact counting for total-support-count families.

**Fidelity first (all pass).**
- **Weight.** F1 counts ACTIVE tags. Its brute force uses `(B − {tag}) & W[tag]`, and its closed form gives every sector member weight 1 (arm tag active through `r`; private tags inactive because every choke is absent). I re-derived this. `W_v = {r}` for the arm leaf and `W_{c_ij} = {u_i}`.
- **Relation.** F1's relation is exactly (D) ∪ (S).
- **Selector.** `F_p` is derived from `Δ_p(T − v)` on the original tree for both leaf orbits at every grid row and at the five rows. I re-derived `F_p` = all leaves at every row I report.
- **Crossing index.** `x` is computed through rank `α`.

**Closed forms.** My own derivation gives:
- `P = (1+2x)·Br^m + x(1+x)·D^m`, where `D = (1+2x)^d` and `Br = D + x(1+x)^d`.
- `P(T−v) = x·D^m + (1+x)·Br^m`.
- `P(T−c_00)` uses the one-support branch `Br′ = (1+x)(1+2x)^{d−1} + x(1+x)^{d−1}`.
- `q_v = x·D^m`.
- `q_c = x(1+x)^{d−1}(1+2x)·Br^{m−1}`.

All five agree with the generic DP on the literal tree for every `d, m ∈ {1..4}` (16/16).

**Sector counts.**
- F1's full-sector closed form (supply `2^{p−1}C(dm, p−1)`; deletion image `2^{p−2}C(dm, p−2)`; switch image `m·Σ_{ℓ=1}^{d−1} ℓ·C(d, ℓ)·[x^{p−2−ℓ}](1+2x)^{d(m−1)}`, with distinct switch targets indexed by `(i, L)`, `|L| = ℓ ≤ d−1`, weight `ℓ`) is **correct**. I derived it independently.
- My per-choke-type counter reproduces F1's numbers exactly at every overlap. That includes the five rows, whose supply and neighbour integers equal `ROW-TABLE.json`.
- I also derived the literal `N(X)` for general invariant families `X_{β,K} = {B ∈ sector : #chokes of type in β ∈ K}`. That derivation covers deletion images with the per-choke achievable changes in `N_β`, and switch images reached iff `[(1, ℓ) ∈ β] + N_β(rest) ∈ K`.

**Validation against literal brute force** (entire `I_{p+1}` and `I_p`, the literal relation, literal `w_F`) on `CB(2,2)`, `CB(3,2)`, `CB(2,3)`, `CB(4,2)` and `CB(3,3)` at several ranks:
- 136/136 cells for the single-support-count families (`sec.py`);
- 540/540 cells for 5 type-sets `β` × 6 predicates `K` (`gfam.py`);
- 303/303 cells for the total-support-count families (`supfam.py`).

This independently confirms F1's unshipped restricted-sector point `(4,2,4)`: supply 136, neighbour 96, deficient at a non-eligible rank.

**(WID) two sides.**
- On small trees I summed literal layer weights over all independent sets, with `F_p` derived leaf by leaf, and compared them with the leaf aggregate computed from generic-DP `H_v`/`R_v` polynomials. The two agree in 45/45 `(d, m, p)` cases (`validate_small.py`).
- At every large row I report, `supply − capacity = S` is asserted. The supply and capacity come from the active-pair generating function `x²D^m + dm·x²(1+x)^{d−1}(1+2x)Br^{m−1}`. `S` comes from the `q_v` differences.
- My `S` at `CB(8,92)/492` equals the frozen `RESULTS.json` `aggregate` exactly, and so does F1's `ROW-TABLE.json` value.

**SR-C3-6 ratios.** In my own computation the whole-sector neighbour/supply ratios are 14.3213 (`CB(8,86)/460`), 14.7859 (`CB(8,89)/476`) and 15.2506 (`CB(8,92)/492`). The switch image alone at 492 is 14.2526. These agree with SR-C3-6's 14.32 / 14.79 / 15.25 / 14.2526. F1's column labelled "margin/supply" (13.32 / 13.79 / 14.25) is `(neighbour − supply)/supply`, which is exactly one less than those ratios. The two are consistent.

## Attacks and findings

**A1. The grid search tested no switch-necessary row. This is the decisive finding.** A root-plus-arm sector row needs the switch only if its deletion image is too small. In closed form that happens iff `2^{p−1}C(dm, p−1) > 2^{p−2}C(dm, p−2)`, that is, iff `3p < 2dm + 5`. I asserted both forms on every row.
- I recomputed F1's grid exactly (`d ∈ [2,25]`, `m ∈ [2,15]`, eligible `p ≤ x+2+25`, `F_p` derived). It has **1278 eligible rows**, which matches F1's count. All 1278 have every leaf favorable, and **0 of the 1278 are sector-deletion-deficient** (`census.py A`).
- So on every row F1 searched, the full sector satisfies Hall by deletion arcs alone. "No deficient row" follows from `3p ≥ 2dm + 5` in one line and says nothing about switch capacity.
- The allocation's items (a) and (b) ask for the deletion-deficient eligible ranks and the row minimising switch capacity relative to the deletion deficit. **Neither is met.** The return's "tightest row" `CB(25,14)/236` has `3p − 2dm − 5 = +3`. Its reported margin of 0.0192 splits exactly into a deletion surplus `(3p − 2dm − 5)/(2(dm − p + 2)) = 3/232 ≈ 0.01293` plus a switch contribution of about 0.0063.
- The return's open lemma, "does the ratio stay bounded away from 0?", is therefore mis-posed. At fixed `m` and growing `d`, the ratio does tend to 0 at such rows, because both terms vanish. That is harmless there, since deletion alone already covers the sector. It is not the `CB(7,1)/6` mechanism.

**A2. Where switch-necessary eligible CB rows actually are (critic census, `bounded_computation`).**
- **Wide scan.** `census2.py` covered `d ∈ [2,14]`, `m ∈ [1,160]` and every eligible `p`: 103,835 eligible rows. Of these, 164 are switch-necessary, and every one has `F_p` = all leaves.
  - They occur for `d = 7` (from `m = 109`), `d = 8` (from `m = 86`; it contains the five closed `d = 8` rows and more), `d = 9` (from `m = 112`), `d = 10` (from `m = 106`) and `d = 11` (from `m = 134`).
  - There are none for `d ≤ 6` or for `d ∈ {12, 13, 14}` up to `m = 160`. The minimum first-rank slack `3p − 2dm − 5` by `d` is `+5, +4, +4, +3, +4, −2, −3, −2, −3, −1, +1, +1, +2` for `d = 2..14`.
- **Targeted scan.** `firsthit2.py` searched `d = 12` for `m ∈ [150, 212]`. The first switch-necessary row is `CB(12,212)/1697` (`n = 5303`, `α = 2757`, `x = 1695`).
- **Reading.** The switch-necessary set is not confined to `d ∈ {7, 8}`. It appears at larger `m` as `d` grows. Heuristically `m ≍ (3/2)^d/(d/6 − 1)`: choke selection shifts the mode by `−m(2/3)^d(d/6 − 1)`.

**A3. The step the return leaves open, attempted at switch-necessary rows (critic-derived; `bounded_computation`; no deficient family).** I decided literal sector Hall for families at seven switch-necessary eligible rows: `CB(8,86)/460`, `CB(8,92)/492`, `CB(7,109)/510`, `CB(9,112)/673`, `CB(10,106)/708`, `CB(11,134)/984` and `CB(12,212)/1697`. The last four are **not** among the five closed rows. `F_p` is derived at each row, `S < 0`, and `supply − capacity = S` is asserted.

The families are:
- **Choke-count families** `{N_β ≤ k}`, `{N_β = k}` and `{N_β ≥ k}` for every `k`. The type-sets `β` are:
  - `a = 1` (single-support chokes, which is F1's `X'` at `≤ 0`);
  - `a = 1, c ≥ 1`;
  - `a = 1, c ≥ 2`;
  - `a = 1, c ≤ 1`;
  - `a = 0`.

  This gives 1209 to 2939 families per row.
- **Total-support prefix, suffix and point families**: 1380 to 5091 per row.

Results:

| row | full-sector deletion deficit / supply | switch / supply | min slack over all families | min slack among deletion-deficient families | deficient |
|---|---|---|---|---|---|
| `CB(8,86)/460` | 0.00217 | 13.32 | 0.92 (support `≥ 422`) | 13.23 | none |
| `CB(8,92)/492` | 0.00203 | 14.25 | 0.93 | 14.16 | none |
| `CB(7,109)/510` | 0.00196 | 21.99 | 0.99 | 21.86 | none |
| `CB(9,112)/673` | 0.00297 | 13.06 | 0.87 | 12.91 | none |
| `CB(10,106)/708` | 0.00141 | 9.17 | 0.79 | 9.10 | none |
| `CB(11,134)/984` | 0.00102 | 8.51 | 0.74 | 8.46 | none |
| `CB(12,212)/1697` | 0.00118 | 9.80 | 0.72 | 9.73 | none |

Every family in these classes whose deletion image falls short carries a switch rescue of about the whole-sector ratio. That rescue is roughly 3,000 to 11,000 times the deletion deficit. The families nearest to failing (slack 0.7 to 1.0) are not deletion-deficient at all.

**Heuristic, and not a proof:** `switch/supply ≈ (md/2)(2/3)^d`, while `deficit/supply ≤ (2dm + 5 − 3p)/(2(dm − p + 2)) = O(1/(dm))`. At the first switch-necessary `m` for each `d`, `m(2/3)^d(d/6 − 1) ≈ 1.1` to `1.6`, so the rescue tends to a constant of at least about 3, not to 0.

This answers the allocation's question at bounded scope. On the homogeneous CB pattern, through `d ≤ 12`, no eligible row has a sector switch rescue that is small relative to the deficit, **within these invariant classes**. The candidate lemma, which is stated and not proved, is the proved lower bound on switch/deficit that the allocation's "could close" names: at every switch-necessary eligible row of `CB(d,m)`, the full-sector switch capacity is at least a fixed multiple `c > 0` of the sector supply. That is a rigorous form of the mode-shift link between `x(CB(d,m)) < (2dm − 2)/3` and `m(2/3)^d`. Proving it needs explicit two-sided bounds on the ratios `2(N′ − k + 1)/k` over a window of width `d`, together with a lower bound on how far the descent shifts. I did not complete it.

**A4. Quantifier scope.**
- Neither F1's two families nor my classes are "every `X ⊆ sec`". Neither is (HALL-COND), even for the sector.
- The sector is also not the whole network: sources outside the sector compete for the same weighted targets (the switch images outside the sector, and targets reached from non-sector members). A sector family that is non-deficient does not show that a flow exists.
- F1 states the family gap honestly (§8, §10 item 3). It does not state the competition gap, and I add it.
- (INV) would reduce the problem to invariant cuts, but only on the whole network, not on a sector in isolation.

**A5. Direction, subtraction and circularity.** The inequality directions are correct. `coeff(·, k < 0) = 0` guards the natural-number subtraction. Nothing is circular, since no step assumes `S ≤ 0`.

## Mechanism-equivalence and fence check

- The route uses (D) ∪ (S) and the literal active weight. It is none of the ten refuted keys.
- `X'` is a switch-dead family on which only deletion arcs exist. Testing Hall there is a legitimate sub-case of (HALL), not a revival of `E993-R23-LITERAL-DELETE-ONLY-HALL`.
- Nothing closed is re-proved as a contribution. F1 labels its re-check of the five rows as a coarser consistency check that does not re-certify `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`, and I agree.
- The route uses no census value in a proof, no RTree wording, no controller prior as evidence, and neither (LIFT) nor (DCB).
- F1 registers no key, and I concur. Its closed form is the full-sector instance of registered sector facts (the `CBstar` deficit and the `R30-CB-RECORD`-type counts). A key would need a proved predicate that the return does not have.
- My candidate lemma in A3 would need its own `E993-R30-…` name after a proof and a second read. I propose no name, under ruling 41.

## Certification audit

These literals are **struck** or corrected:
1. **"17 small instances" / "brute-force validation on 17 small instances" (§9, gate-31 line).** The shipped generator runs 11 full-sector brute-force points. The "restricted sector X′, 6 points" are not in any shipped code or output (ruling 42). This literal is struck to "11 (shipped)". The one restricted point the return quotes, `(4,2,4)` 136/96, is independently confirmed by me. The other five are unbacked.
2. **"5/5 WID matches including two cases where F_p is empty".** In three of the five cases `F_p` is empty: `(2,2,3)`, `(3,2,4)` and `(4,2,4)`, as I checked by deriving `F_p` leaf by leaf. The count is corrected to three. None of the five is an eligible row. They validate the instrument only.
3. **§7 table, scientific notation.** Supply and neighbour exponents (and some mantissas) are wrong. My exact values:
   - `(8,86)/460`: `5.860e326` and `8.393e327` (return: `e332` and `e332`).
   - `(8,92)/492`: `4.520e349` and `6.893e350` (return: `4.520e355` and `6.943e355`).
   - `(7,144)/673`: `2.311e479` and `6.942e480` (return: `e473` and `e473`).

   The exact integers in `ROW-TABLE.json` are correct. The table literals are struck. The ratio column is correct.
4. **"352-digit aggregate".** `|S|` has 351 digits; the string is 352 characters with the minus sign. The exact match itself stands (difference 0, re-verified).
5. **"every supply − capacity = S assertion in this return was computed from independently computed sides".** At the five rows and the 1278 grid rows, the shipped code computes only the aggregate side (`side_B_aggregate`). No layer-weight side is computed there, so the literal holds only at the five small WID instances. At the rows I report, I supply the two-sided assertion myself.
6. **`|F|` in `ROW-TABLE.json` is hard-coded** (`Fsize = d*m + 1`). The generator does derive favorability at those rows, and I re-derived that all leaves are favorable, so the value is right. The literal is not derived in the file that prints it, which falls under ruling 42 and the rule that `F_p` is never hard-coded.
7. **"tightest row … minimising switch-capacity-relative-to-deficit" (§8, gate-31 line).** This is struck. The row has no deletion deficit (A1).
8. **"window 25".** The code scans 26 ranks (`pmin..pmin+25`). This is trivial.

These literals are **backed**:
- the 16/16 DP-versus-closed-form matches;
- the 11/11 full-sector brute-force matches;
- 1278 rows checked, with no deficient full or restricted family;
- the five-row supply and neighbour integers;
- `S` equal to the frozen record;
- the replay digests.

## Verdict

verdict: retained_narrowed
headline_resolved: no

**What is retained**, at `bounded_computation`:
- F1's full-sector closed form under the literal (D) ∪ (S) relation with active weight, including the corrected target collapse to `C(d, ℓ)`, and its restricted-family counting. I re-derived both independently and validated them against literal brute force.
- The no-deficit result on the 1278-row grid. It is narrowed to what it is: a grid on which every row is sector-deletion-sufficient, so it tests nothing about switch capacity.

**What is struck:** the certification literals listed above, the "tightest row" framing, and the open lemma as posed.

**Letters (a′)–(d′) of ruling 39.** The return supplies none: no uniform (HALL), no whole-row certificate, no (CUT) candidate, no Lean award. My critic-derived extension (A2–A3) also supplies none. It relocates F1's object to the actual switch-necessary rows (`d = 7..12`, `m ≳ 86..212`) and finds no deficient family there within the tested invariant classes.

Model disclosure: chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

Stated exactly for the successor:
1. **Proof step.** Prove a lower bound `switch-image weight ≥ c·(sector supply)`, with `c > 0` uniform, at every switch-necessary eligible rank of every homogeneous `CB(d, m)`. Equivalently, bound `x(CB(d,m))` above by `(2dm − 2)/3` only when `m(2/3)^d(d/6 − 1) ≥ κ`, and bound `Σ_ℓ ℓC(d,ℓ)c′(p−2−ℓ)` below by the ratio window. Together with `deficit/supply ≤ (2dm + 5 − 3p)/(2(dm − p + 2))`, this closes full-sector Hall on the whole CB class at `proved_informal`. It is still not (HALL).
2. **Every invariant `X`.** Decide Hall for every `Aut`-invariant `X` in the sector, beyond the choke-type-count and support-count classes decided here, and for the whole network including competition from non-sector sources, at one switch-necessary row not among the five, for example `CB(9,112)/673` or `CB(10,106)/708`. Use an exact quotient flow, with (LIFT) applied at its grade.
3. **Heterogeneous pattern.** Carry the same enumeration to the heterogeneous CB pattern, which neither F1 nor I attempted.
4. **Controller residue.** Correct the Stage 2 seal quoted in `C5-CRITIC-PROTOCOL.md` duty 1.

## Artifact inventory

All scratch is under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-F1-T/`. All runs used `python3 -B`, the standard library and exact integers.

**`replay/`** holds copied-out F1 files. The re-run outputs are byte-identical to the shipped ones, and the originals are moved to `replay/orig/`.

**`mine/`** holds the critic's instrument (SHA-256):
- `ci.py` 704adaa5…
- `fastpoly.py` ab90a651…
- `sec.py` 5fdcdeca…
- `gfam.py` 68ebaed7…
- `validate_small.py` 1408eb18… → `validate_small.json` 193be1d1… (16 closed forms, 136 family cells, 45 WID)
- `validate_gfam.py` 389b127a… → `validate_gfam.json` 6b23fc22… (540 cells)
- `census.py` b23b1b47… → `censusA.json` 00905576… (F1 grid: 1278 rows, 0 switch-necessary; its mode B was stopped unfinished and has no output)
- `census2.py` 1735ae4e… → `census2_160_14.json` f8c593df… (103,835 rows, 164 switch-necessary)
- `firsthit2.py` 71691793… (`d = 12` first row at `m = 212`; `firsthit.py` da38bf1e… timed out with no output and is superseded)
- `scan.py` 133786d2… → `scan_8-86-460_8-92-492.json` 31d7f1a4…, `scan_7-109-510_9-112-673_10-106-708_11-134-984.json` acdb3168…, `scan_12-212-1697.json` d09084a6…
- `supfam.py` b0a3d91a… → `supfam.json` 888e2f00… (303 validation cells; its first version timed out with no output and was rewritten with prefix sums)

**Background jobs and kills.**
- One command was auto-backgrounded by the harness (`census.py B`). I stopped it through the harness task control (task id `bp0f0sxx2`), not by pattern kill or process listing.
- Two foreground runs were ended by their own `timeout` (`firsthit.py` and the first `supfam.py`).
- No job is running at this write.

**Read-boundary disclosures:**
1. A `head -40` on `control/C5-CRITIC-ATTACK-BRIEFS.md` printed the file's preamble and the opening of the T1 section before I narrowed to the F1 section (lines 74–94). I saw that text but did not use it. My census is my own.
2. I listed the names in `cycles/cycle-5/stage4/critics/F1/` while creating my output directory. It showed a `U` directory; I read nothing in it.
3. I read the authorized frozen source `sources/lower-region/instruments/cb-switch-cut/RESULTS.json` for the `S` comparison.
4. I ran no `find`, `grep` or `rg` above my grant, used no network, installed nothing, and ran no `lake`/`lean`.
