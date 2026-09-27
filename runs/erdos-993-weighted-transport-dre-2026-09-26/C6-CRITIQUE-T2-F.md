# Critique

Critic `C-T2-F` (orientation F, falsify) of route `C6-T-02 CB-BAND-ROW-CERTIFICATES` (seat T2, orientation T), r30 Cycle 6
Stage 4. Run root `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26`.

**Boot.** I am operating within VerityOS. The boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, read in full. I followed the dispatch's boundary and did not
follow the protocol's task map into any other VerityOS subsystem. The host put the project `CLAUDE.md` and the auto-memory
index into my context. I did not act on either. In particular I kept no conversation log, because the dispatch limits my
writes to this file and my scratch directory.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Read boundary.** I read the dispatch (SHA-256 `94a75548…99ce`, verified with `shasum -a 256` before following it); the
capsule and its 14 members, reading only the T2 section of the attack briefs; the return's 20 inventoried artifacts under
`scratchpad/c6-T2/`, copied out to my scratch before replay; and, under `sources/` (authorized as Stage 2 members), a single
`grep -rlE` rooted at `sources/` followed by one file,
`sources/c5-stage7-sources/ADJ-T/adj_t1_e1allq.py`. That file's SHA-256 `bee863bc…07de` matches its Stage 2 manifest entry.
I took from it only the cleared-form definition of E1 condition (i). I also ran `grep -n` on two capsule members, the
Stage 2 manifest and `sources/c5-stage7-sources/SOURCE-DIGESTS.json`, to find that digest. Non-recursive `ls` calls covered
`sources/`, `sources/c5-stage7-sources/` and its `ADJ-T/`, and one `ls -la` covered the granted `scratchpad/c6-T2/{,inherited/}`.
Nothing else was read. I did not read the registry (`control/CLAIM-IDENTITY.run-local.json`), the worker common brief, the
Cycle 1–5 syntheses or closes, `scratchpad/c6-T2-replay/`, any sibling return, critique or adjudication, other roots, or the
network. I did not replay T2's `alias_check.py`, because it reads the registry, which is outside my capsule. **Discrepancy
recorded:** the attack brief calls controller replay CF-REPLAY-c6b "a capsule member", but it is not in my capsule
(`T2-PACKET-MANIFEST.json` lists 14 files and none is CF-REPLAY-c6b). I did not read it. Every value it would have
supplied (`n`, `α`, `x`, window, deficient rank, threshold test) I re-derived with my own instruments below.

## Identity and seal audit

| Object | Recorded | Recomputed (canonical: sort_keys, `(",", ":")`, no trailing newline, minus `seal_sha256`) |
|---|---|---|
| Capsule `control/c6-critic-capsules/T2-PACKET-MANIFEST.json` | `57d8551c60d35497c1f2980b69f975d2ed878b079faac4e1d6d41ae3b1d44f45` | **match**; all 14 members match their SHA-256 and byte counts |
| Stage 4 dispatch manifest | `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50` | **match** |
| Stage 3 packet manifest (capsule member) | `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd` | **match**; it lists the T2 return at `5aeb0784…84a2` (38398 B) and `DISPATCH-T2.md` at `14e65fd5…d4d2`, and both agree with the return's face and the capsule |
| Stage 2 packet manifest | `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611` | **match** (the protocol's literal) |
| Return artifact inventory (20 files: 6 scripts, 8 outputs, 6 `inherited/`) | as listed in the return | **all 20 match** after copy-out (`scratchpad/c6-crit-T2-F/replay/`) |

Instrument: `scratchpad/c6-crit-T2-F/seals.py`. Replay: `myrows_basic.py`, `network_dual.py`, `myrows_certify.py`,
`myrows_sector_rho.py`, `inherited/fixedpoints.py` and `inherited/sector.py` were re-run copy-out-first with `python3 -B`,
and every output is **byte-identical** to the shipped one (`cmp`; reruns under `replay/rerun/`).

Registry keys touched by the return: (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN at full scope; the return
touches four finite instances); (WID) `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`; E1-R
`E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`; the E1 rank-threshold key
`E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-AT-EVERY-RANK-FROM-THE-MEAN-THRESHOLD`;
`E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` (for disjointness only). The primary
aggregate is untouched.

## Independent re-derivation

**Fidelity first.** The return's weight is `w_F` with the ACTIVE rule. `network_dual.py`'s brute force computes
`#{v ∈ F ∩ B : (B ∖ {v}) ∩ W_v ≠ ∅}` literally, and `inherited/sector.py`'s laboratories do the same. The relation is not
used by the row-data side; the certificate models only arcs that my literal laboratory shows to be (D) or (S) arcs (below).
`F` is fixed at `p` from `Δ_p(T − leaf)` on the original tree. But T2's instruments evaluate this for ONE representative of
each leaf class (`rowdata.rowA`: key `'arm'`/`'priv'`), and the code comment "AND assert equality on a second rep" is not
implemented. `network_dual.py` HARD-CODES `F` = all leaves (private leaves are always tagged, and `v_in_F=True` is passed).
T2 computes `x` through `α` correctly (`x_through_alpha` scans `k ≤ α` with zero extension). T2 does assert
`supply − capacity = S` on each row. But the Instrument A side is two groupings of the same `q` numbers (Cycle 5's struck
self-check, which the return itself acknowledges). The network side's equality to `S` is **not asserted by any shipped
script**: `network_dual.py` prints `S_network` and never imports `S`. My comparison below backs the equality. No fidelity
failure affects a number, because my structure-blind instrument reproduces every value with `F` derived per leaf.

**My instrument G1/G2 (`crit_generic.py`, structure-blind, own CB labelling, from SEMANTIC-CONTRACT §1.1–1.2 only).**

- **G1** is a generic rooted-tree independence DP with deletions on the original carrier. It covers EVERY leaf separately:
  `F_p` by `Δ_p(T − leaf) < 0`, and `q_v(j) = i_j(T − {v, s_v}) − i_j(T − N[s_v])`, with no orbit classes.
- **G2** is a generic "dual-number" DP for `Ψ_j = Σ_{B ∈ I_j} w_F(B)` on any tree and any leaf tag set, using the literal
  active rule. Its states are IN, OUT with parent in `B`, and OUT with parent not in `B`. A present tag is inactive exactly
  when it is the only child of its support in `B` and the support's parent is absent. G2 knows nothing of chokes, `q_v`, or
  the (WID) bijection.
- **Validation:** 60 random trees of order 4–14 with random leaf tag sets. There, the G1 polynomial, G1 deletion
  polynomials and G2 `Ψ` all equal literal brute-force enumeration. `CB(2,2)`, `CB(3,2)` and `CB(2,3)` also match literal
  brute force at every size.
- **Fixed points reproduced exactly:**
  - `K_{1,12}`/8: `(13, 12, 6, 12, 1980, 3960, −1980)`
  - path-star `(2,3,4)`/7: `(15, 11, 5, 10, 1483, 2701, −1218)`
  - path-star `(2,2,4,3)`/8: `(18, 13, 6, 12, 8033, 13467, −5434)`

  The tuples are `(n, α, x, |F|, supply, capacity, S)`.

| Row | `n` | `α` | `x` | window | leaves = `\|F_p\|` (per leaf) | `S < 0` | digits `S`/supply/capacity | `supply − capacity = S` (G2 vs G1) | per-tag (WID) `supply = Σ_F q_v(p)`, `capacity = Σ_F q_v(p−1)` |
|---|---|---|---|---|---|---|---|---|---|
| `CB(8,95)/508` | 1618 | 856 | 506 | `[508, 570]` | 761 | yes | 363/365/365 | yes | yes |
| `CB(7,109)/510` | 1638 | 873 | 508 | `[510, 582]` | 764 | yes | 366/368/368 | yes | yes |
| `CB(8,98)/524` | 1669 | 883 | 522 | `[524, 588]` | 785 | yes | 374/376/376 | yes | yes |
| `CB(7,112)/524` | 1683 | 897 | 522 | `[524, 598]` | 785 | yes | 376/378/378 | yes | yes |

`cmp_t2.py`: my `S`, supply and capacity equal T2's to the last digit at all four rows, and T2's `S_network` equals T2's
rowdata `S`. So the return's table in §2 and §3 is correct, including the "363–376 digit" range. Every row is eligible,
`p = x + 2`, and `p = ⌊(2dm+4)/3⌋`. The switch necessity is exact: the sector's deletion shadow has
`R_K/R_{K−1} = 2(M−K+1)/K = p/(p−1) > 1` exactly (`p = (2M+4)/3` is an integer at all four rows). The root-plus-arm sector
is therefore a deletion-only deficient family, and the switch arcs are load-bearing.

**Certificate (`crit_cert.py`).** I re-ran the C-T1-U LP unmodified as a search device. Its optimum reproduces T2's
`θ* = 96/604265, 32/317857, 96/642947, 8/83889` and every σ-table T2 printed. I then dumped the FULL per-state table (`pb`,
`pc`, `σ`, `θ*`) to `crit_cert_tables.json` (SHA-256 `9c41343c…51b1`) and verified it with my own code, using the LP output
as data only:

- all values are `≥ 0`;
- min source outflow, by min-plus convolution powers (repeated squaring over the `m` chokes, not a sequential DP), is
  exactly **1** at every row;
- max in-sector target inflow is exactly **1** at every row;
- `(d−γ)σ(γ) ≤ θ*γ` for `γ = 1..d−1`, with equality at some `γ` (for example `γ = 4` at `CB(8,95)`);
- `θ* ≤ 1 − ρ_(1,d)`, with `ρ_(1,d)` by an exact binomial sum.

The argmin source multiset at `CB(8,95)/508` is `{(0,1)×36, (0,7)×1, (0,8)×58}`, and the argmax target multiset is
`{(0,0)×22, (0,2)×1, (0,7)×72}`. Both are tight. The exact margins `(1−ρ)/θ*` are:

- `4051244613614535235/130708222909490304` ≈ **30.9946** at `CB(8,95)/508`
- ≈ 39.0006 at `CB(7,109)/510`
- ≈ 31.9711 at `CB(8,98)/524`
- ≈ 40.0709 at `CB(7,112)/524`

**Literal laboratory on the ACTUAL rows (`crit_lab.py`; ruling 49's item, absent from the return).** I built the literal
`CB(d,m)` at all four rows (`n = 1618…1683`), with `F` the derived `F_p` (all leaves), literal `w_F`, and literal (D) ∪ (S)
arcs enumerated by brute force. The certificate flow on each literal arc is read from the per-state table.

- **Sources (22–23 per row).** These are:
  - the DP argmin;
  - all-`c` and all-`b` extremes;
  - one switch-saturated source per `γ = 1..d−1` (as many `(1,γ)` chokes as fit);
  - a switch-heavy source;
  - 12 uniform random sector sources.

  At every one: literal `w = 1`; every positive-flow arc is a literal arc to a target of literal weight `≥ 1` (zero
  exceptions); literal outflow `≥ 1`, with minimum exactly **1**, attained at the argmin.
- **In-sector targets (25 per row).** These are the argmax, 12 random targets and 12 deletion images. ALL literal preimages
  were enumerated: 508, 510, 524 and 524 sector preimages respectively. The literal load is `≤ 1`, with maximum exactly **1**,
  attained at the argmax.
- **Switch-image targets (24–28 per row, covering EVERY `γ = 1..d−1`).**
  - Literal `w(A) = γ`.
  - The sector preimages number exactly `d − γ`, and all are switch preimages.
  - Literal sector load `≤ θ*·w(A)`. The maximum of load per weight is exactly `θ*` at every row, so the switch constraint
    is attained literally.
  - Adding the cited E1-R clause `ρ_(1,d)·w(A)` keeps the total `≤ w(A)`.

A laboratory fact the return does not state: in-sector targets also have POSITIVE-weight r-free preimages, e.g. 4234 at the
`CB(8,95)` argmax. All of them come through the switch that inserts `r` and removes two hubs (`u = r`). The composition is
unaffected, because E1-R's flow uses deletion arcs only and a deletion from an r-free set never contains `r`. But the
return's §7 sentence "in-sector targets … get 0 from (i)" holds only because (i) is deletion-only. The return should say so.

**E1 at every `q`, exactly (`crit_e1allq.py`; the allocation's "exact all-`q` E1 check first", which the return replaced
by a citation).** Condition (i) in cleared form, `r_q(p−q) ≤ r_q(p−q−1)` with `r_q = (1+y)^{qd−1}(1+2y)^{d(m−q)+1}`, is taken
as written in the frozen Cycle 5 adjudicator source. Coefficients were computed by exact binomial sums, with no Darroch and
no mode argument. **No failing `q`** at any of the four rows (`q = 1..m` all tested). The maximum `ρ_q` occurs at `q = 1`:
0.99508, 0.99607, 0.99523 and 0.99618. The threshold arithmetic `p = ⌈μ₁⌉ + 2` is also confirmed:

| Row | `μ₁` | `p` |
|---|---|---|
| `CB(8,95)/508` | `1011/2` | 508 |
| `CB(7,109)/510` | `1523/3` | 510 |
| `CB(8,98)/524` | `1043/2` | 524 |
| `CB(7,112)/524` | `1565/3` | 524 |

**This removes the Darroch dependency for condition (i) at these four rows (critic-derived).** E1-R's other hypotheses
(its registered text, conditional on CD-1) are cited as the return cites them; I did not read the registry.

## Attacks and findings

1. **Composition coverage (attacked, holds).**
   - Positive-weight sources are either sector sources (`r, v ∈ B`, weight exactly 1) or r-free. `r ∈ B, v ∉ B` gives
     weight 0, since there is no hub and hence no active private tag.
   - In-sector targets are loaded only by the sector certificate. E1-R is deletion-only.
   - Switch images have exactly one hub and receive `≤ θ*w + ρ_(1,d)w ≤ w`.
   - Targets with `≥ 2` hubs receive no sector switch. Hub-free r-free targets have weight 0.
   - Source outflow `≥ 1` must be scaled to exactly 1 (loads only drop). The return omits this trivial step.
   - The fractional flow gives (HALL-COND) for every `X` by summation (B7). Integrality then follows from (HALL⇒FLOW).
2. **Quantifiers.** The certificate is exact over EVERY sector source and target, because the DP ranges over all
   multisets of choke states and my literal laboratory confirms the per-state reduction on the actual trees. There is no
   circularity: nothing assumes `S ≤ 0`, and (WID) enters only as the identity the row data reproduces.
3. **"Margins ≥ 31×" is false as a literal.** At `CB(8,95)/508` the exact margin is ≈ 30.9946 < 31. It is also a property
   of the chosen LP optimum (the affine-relaxed minimum `θ*`), not of the instance. Struck, and replaced by "margins
   ≥ 30.99×, LP-optimum-relative".
4. **"Structurally unrelated formulas" / "genuinely independent" (§3) is struck.** After the product rule, `network_dual`'s
   derivative polynomial is term-by-term the q-route closed form shifted by one degree:
   - arm: `x²(1+2x)^M` against `q_v = [y^j] y(1+2y)^M`;
   - private: `dm·x²(1+x)^{d−1}(1+2x)β^{m−1}` against `q_c`.

   It is the (WID) bijection written as a factor `x`. The check is a valid implementation cross-check of two codings, not an
   independent derivation. The genuinely structure-blind second side is my G2.
5. **"Per-state tables shipped as DATA for T1's fit" is only partly true.** Only `σ(γ)` and the affine constants were
   printed. The `pb`/`pc` tables (about 70 values per row) were neither shipped nor digested. `crit_cert_tables.json`
   supplies them.
6. **The LP and its "Instrument 2" DP are one local model checked two ways** (the Cycle 5 T2 finding). The DP reads the
   LP's own values. The return calls them two instruments without saying so. The literal laboratory the allocation and
   ruling 49 require was not supplied; I supply it above.
7. **"ρ_(1,d) by two independent formulas"** is really two evaluations of one formula: convolution against a binomial
   sum. Downgraded to "two codings".
8. **"`F_p` derived … by both instruments"** holds per leaf CLASS representative only, and the second-representative
   assertion promised in the code comment is absent. It is confirmed per leaf by my G1, so no number changes.
9. **"which is why they are the smallest members of the 218-row uncertified census" (§4)** is an unbacked causal gloss on
   a census of record. Struck. The rows' membership and order are the census record's, not derived.
10. **Brute-force label.** `network_dual`'s "`CB(3,2)` sizes 0..7" and "`CB(2,3)` sizes 0..6" actually print sizes 0..8
    and 0..7, and stop short of `α`. Where they overlap, they agree with my full-range brute force. This is a cosmetic
    literal.
11. **Attack-brief erratum (not the return's).** The brief's `θ*` list "`96/604265, 32/120853, 288/604265, 336/604265`" is
    `σ(4..7)` of `CB(8,95)`, not the four rows' `θ*`. The shipped and replayed `θ*` values are `96/604265, 32/317857,
    96/642947, 8/83889`.
12. **Grades.** The return grades the whole-row claims `computer_assisted`, STATED, with route verdict `proved_conditional`
    naming E1-R and the threshold key. The weakest input is the finite certificate, `computer_assisted`. The inputs E1-R
    and CD-1 are `proved_informal`. The Darroch qualifier is now discharged for condition (i) at these rows by my exact
    check. Correct as graded.
13. **Process.** No `sources/` files were opened, listings were of named locations, and there were no background jobs. My
    replay is consistent with these disclosures. The seat reads `cycles/cycle-5` material and `scratchpad/c4-crit-T1-U/own/`
    under the common-brief grant, and these are disclosed.

## Mechanism-equivalence and fence check

The certificate is the literal (D) ∪ (S) network with the active weight, restricted to the root-plus-arm sector and
composed with E1-R. It is not deletion-only Hall: the switch arcs carry `σ(γ) > 0`, and the sector is deletion-deficient
by exactly `p/(p−1)`. It is not Delete/Retag, own-support unit capacity, per-leaf injectivity, occupancy domination, signed
cross-tag, or covariance. It is the same method as C-T1-U's Cycle 4 certificate on new rows, so it is not a new mechanism.
It re-proves no closed region: `d ≥ 7`, the lower region, `n` well above `2p + 2`. No census value enters a proof. The "218"
census is used only for bookkeeping, and my own finder (`crit_frontier.py`, `bounded_computation`) independently reproduces
the five registered rows and T2's four as the nine smallest switch-necessary first-eligible rows for `d = 7..13` in its
`m`-ranges. There is no RTree wording, and (LIFT) is not used. A sector-only statement is not offered as a reduction of
(HALL): the whole row is composed through E1-R.

## Certification audit

| Literal | Status |
|---|---|
| Row data `n, α, x`, window, `\|F_p\|`, `S < 0`, digit counts | **backed** (my G1/G2, per leaf) |
| `supply − capacity = S` at four rows | **backed** by my G2 against G1 and by T2's outputs; **not asserted** in T2's shipped code (struck as "verified by the script"; stands by my comparison) |
| "structurally unrelated", "genuinely independent" (§3) | **struck** (a regrouping; finding 4) |
| `θ*` values, σ-tables, "min outflow = 1", "max inflow = 1", "`(d−γ)σ(γ) ≤ θ*γ`", `CERTIFIED` | **backed** (replay byte-identical; my own min-plus verification; literal laboratory) |
| "margins ≥ 31×" | **struck**; exact ≥ 30.9946× |
| "per-state tables shipped as DATA" | **struck** as stated (σ only); full tables now in `crit_cert_tables.json` |
| "two instruments" (LP/DP) | **narrowed** to one local model checked two ways; the literal laboratory is critic-supplied |
| "E1(i) at every `q`" | cited in the return; **now backed exactly** at the four rows (critic) |
| "two independent formulas" for `ρ_(1,d)` | **narrowed** to two codings; the value is backed |
| "`sector.py` validated on eight small CB laboratories" | **backed** (8 lines, all `match=True`, replayed) |
| 20 artifact digests; "byte-for-byte" replay | **backed** |
| "which is why they are the smallest members …" | **struck** |
| "218 → 214 uncertified" | arithmetic on the census record; not derived |

## Verdict

verdict: retained_narrowed

headline_resolved: no

Retained: whole-row (HALL) at `CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524` and `CB(7,112)/524`, with switch arcs
load-bearing, at grade `computer_assisted`, STATED, composed with E1-R. The narrowing:

- the certification literals of the audit are struck;
- the §3 check is reduced to an implementation cross-check;
- the ruling-49 literal laboratory and the all-`q` E1 check on which the retained claim now also rests are critic-supplied
  (this critique).

Nothing here is `proved_informal` or better. The return reaches no uniform restricted (HALL), no (CUT) candidate, and no
Lean-ready statement.

Toward letters (a)–(d) of gate ruling 30 (the ruling's text is not in my capsule): the return supplies finite
`computer_assisted` restricted-scope rows only.

**Critic-derived advance (C-T2-F; STATED, `computer_assisted`, needs an isolated second read).** The same pipeline was run on
the next six switch-necessary first-eligible rows by `n` (`crit_extend.py`). Each run had the same components:

- structure-blind row data with `F_p` per leaf, `S < 0` and `supply − capacity = S` by G2;
- the LP and my min-plus verification;
- exact all-`q` E1(i);
- a literal laboratory covering every `γ`.

At each row `p = x + 2 = ⌊(2dm+4)/3⌋` and every leaf is favorable. **All six are CERTIFIED**, with min outflow 1, max inflow
1, the switch constraint attained at `θ*`, and no failing `q`:

| Row | `n` | `θ*` | margin |
|---|---|---|---|
| `CB(8,101)/540` | 1720 | `96/682829` | 32.95× |
| `CB(7,115)/538` | 1728 | `64/707469` | 41.14× |
| `CB(8,104)/556` | 1771 | `96/723911` | 33.92× |
| `CB(7,118)/552` | 1773 | `64/744785` | 42.21× |
| `CB(7,121)/566` | 1818 | `16/195765` | 43.28× |
| `CB(8,107)/572` | 1822 | `96/766193` | 34.90× |

Full tables are in `crit_extend_{a,b}.json`. Whether these six are members of the 218-row census of record is not checked
(the census is outside my capsule).

**Naming.** The proposed `E993-R30-FOUR-CB-FIRST-ELIGIBLE-RANKS-…` fails ruling 48, because it does not name the four
trees and ranks. It is also a 13/14-token near-alias of the registered FIVE-CB key. The right form is a separate key whose
name states the four `(d, m, p)` exactly, and likewise for any second-read critic rows. Registering the rows as a scope note
that edits the registered FIVE-CB statement would be wrong. I did not alias-check a replacement name, because the registry
is outside my capsule.

## Remaining obligation

The return's statement ("214 rows remain; run `certify` down the list") is incomplete in three respects:

1. Every further row needs the literal laboratory and the exact all-`q` E1(i) check, not the LP/DP alone.
2. The composition rests on E1-R and CD-1 (`proved_informal`), which the return names only in its verdict.
3. The per-state `pb`/`pc` tables must ship as digested data.

Exact remaining obligation for this route's object:

- For each uncertified switch-necessary first-eligible CB row, the same four-part certificate: structure-blind row data;
  an LP table verified exactly; a literal laboratory; all-`q` E1(i).
- Second reads of T2's four rows and my six.

For T1: the ten `θ*` values and full tables (`crit_cert_tables.json`, `crit_extend_{a,b}.json`) are fitting data only. A
uniform `(L-S)_top` still has to be proved. A successor inherits a working, literally audited per-row pipeline, with no
uniform statement.

## Artifact inventory

Deliverable: this file only. Scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-T2-F/`.
Everything was run with `python3 -B` in the foreground using the standard library and exact integers/`Fraction`, and no
bytecode is present. No background job was started, so none needed killing, and no process listing was run.

| File | SHA-256 | Role |
|---|---|---|
| `seals.py` | `88fc57831a3014f9ed58b750374155c8c422a8f7a67466aa2c8b8f02fea833e2` | capsule / Stage 2–4 seals, member digests |
| `crit_generic.py` | `526f531281e7ab1d0e08ad848fc50f966b6a3863129831ac61c56e7d4206ecc3` | G1/G2 structure-blind instrument |
| `crit_generic.json` | `fbe7958a207ed68d2a488274115a871ddfc8a99056cf66511714408316d33cac` | its data (validation, fixed points, four rows) |
| `out_crit_generic.txt` | `173f134025d07f9a6123b47aa744f58c633d573a4cf0215973108bbbd7d8c90d` | its output |
| `cmp_t2.py` | `91dc9db6fd7ebdaed5477cf39e4cb7a05dbb67118b944f90f7046b9c60d030f1` | own values against T2 shipped outputs |
| `out_cmp_t2.txt` | `6925ae3d801b72e36db86d44dcc2590786c9a1e8623b2cd178e1cd153364c72f` | its output |
| `crit_cert.py` | `c9624637bbd0ffbf9038b7b43ac6391737fe06457971a8ff91ed61dc019de8db` | LP re-run (search device) + own min-plus verification, exact margins |
| `crit_cert_tables.json` | `9c41343c1f932599f9948541706e670454e11d7a497bdc83bb835133097051b1` | FULL per-state tables pb/pc/sigma/theta + verification, four rows |
| `out_crit_cert.txt` | `6de2c4a8f2967ede8050e77d2c80bda4fd8351534173ad4c6eb3ec35bcb10de9` | its output |
| `crit_lab.py` | `64e966e453ba39b4ea3804ae296008a93eec9e289ff0351d8ac90522a21ea45f` | literal laboratory on the four actual rows |
| `crit_lab.json` | `425196ba141e04a2d459dbe853bfd162be3a6eb6d832594afff0a622b717454d` | its full per-set records |
| `out_crit_lab.txt` | `14f92957db4a5ea9bcf52cb829a2996e8b6d5e66c5cb4487b6bffda066797653` | its summary output |
| `crit_e1allq.py` | `b3a782ae8213e679d028f64bd5ca1b9f1f259bdce9b54746deeb8073a539e22e` | exact all-q E1(i) |
| `crit_e1allq.json` | `63b3e32b34afb3ab80f838fd345cbd7a4f4aa1124a7cd989cca25f540ab335bb` | its data |
| `out_crit_e1allq.txt` | `c7efba4e4f00d6056029efd99ac8d88aa84320ad1def2dc6bcd9bf351a1f8ccf` | its output |
| `crit_frontier.py` | `94d664d048644448f2d588b1953a4884adf215aa3ed174b946f5311f8452772e` | finder, switch-necessary first-eligible CB rows (bounded_computation) |
| `crit_frontier.json` | `185ea93f4f9c2966c745c713776055df5c3a51c48b9d67dc369c558fa46029d5` | its data |
| `out_crit_frontier.txt` | `69554948c148364bef02e3802876dd61928419681114789b588ad4acc44c0df4` | its output |
| `crit_extend.py` | `294378d19f3f528376708c0976b55e4f54c40b807d7be0e3b267b75cd352ed65` | critic-derived pipeline on further rows |
| `crit_extend_a.json` | `4b1b7c70355d381017546fc71621d33900d7800e86dd5dd168534e9f18b7b3d9` | rows CB(8,101)/540, CB(7,115)/538, CB(8,104)/556 incl. full tables |
| `crit_extend_b.json` | `a22aa73b7ac43e7a7f5203da1e4e1679bdbdc288c470eed6ccf419d6c090cdaa` | rows CB(7,118)/552, CB(7,121)/566, CB(8,107)/572 incl. full tables |
| `out_crit_extend_a.txt` | `f858cd3bb6f28b99f7f21734f230d2a40fcc4783c29019bcd2e4e876804b485c` | output |
| `out_crit_extend_b.txt` | `44be67088dbc81327ecb37deaf3408710897c32d0bfccf9e32425b56e81e6dbc` | output |
| `replay/` (20 copied T2 artifacts) and `replay/rerun/` (6 byte-identical reruns) | digests as in the return | copy-out replay |

Replay commands:

```
cd scratchpad/c6-crit-T2-F
python3 -B seals.py control/c6-critic-capsules/T2-PACKET-MANIFEST.json
python3 -B crit_generic.py crit_generic.json
python3 -B cmp_t2.py
python3 -B crit_cert.py
python3 -B crit_lab.py
python3 -B crit_e1allq.py
python3 -B crit_frontier.py
python3 -B crit_extend.py crit_extend_a.json 8,101,540 7,115,538 8,104,556
python3 -B crit_extend.py crit_extend_b.json 7,118,552 7,121,566 8,107,572
```

`seals.py` is run from the run root. Approximate timings: `crit_generic.py` 2 min, `crit_cert.py` 10 s, `crit_lab.py` 1 min,
`crit_frontier.py` 4 min, and about 2 min per `crit_extend.py` batch.
