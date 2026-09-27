# Critique

Critic `C-T2-U` (orientation U, formal/structural) of Cycle 6 Stage 3 route return `T2` (`C6-T-02 CB-BAND-ROW-CERTIFICATES`,
orientation T), run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), 2026-09-27.

**Boot.** I am operating within VerityOS. Per the dispatch, I read EXACTLY `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS-root file. The host injected the project
`CLAUDE.md` and the user's auto-memory index into context at session start. I did not act on them, and I kept no conversation
log, because the dispatch confines my writes to this file and my scratch directory.

**Model disclosure (two parts):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Identity and seal audit

| Object | Recomputed | Result |
|---|---|---|
| Dispatch `control/dispatch/c6-stage4/DISPATCH-C-T2-U.md` | `shasum -a 256` = `b59f51b8b83f519d5277326a99aa6b9423f0f9d084100613057c8618329e1d18` | matches the pointer; checked before following it |
| Capsule `control/c6-critic-capsules/T2-PACKET-MANIFEST.json`, inner seal | `57d8551c60d35497c1f2980b69f975d2ed878b079faac4e1d6d41ae3b1d44f45` | **match** (canonical JSON without `seal_sha256`: sort_keys, `(",", ":")`, no trailing newline) |
| Stage 4 dispatch manifest seal | `74be1845f4005d6846c10eacdebf5049b6d7d971a53b445c1dcab3b3637ddf50` | match (recomputed) |
| Stage 3 packet manifest seal | `32452609815aa05c6ea550d4c6a67edeee1c8422ab87dbbb310bb86d877e49dd` | match (recomputed) |
| Stage 2 packet manifest seal | `29a3aeb76f4618f65cfd9a1adf3a7c32c6d2490c19723f155d3efde62df5d611` | **match** with the protocol's literal |
| The 14 capsule members (bytes + SHA-256) | all 14 | all match, including `RETURN.md` `5aeb0784…` |
| The return's 20 inventoried scratch digests (`scratchpad/c6-T2/…`, `inherited/…`) | copied out to `scratchpad/c6-crit-T2-U/replay/` and hashed | all 20 match the return's inventory |
| Frozen sources I opened: `sources/c5-stage7-sources/C-T1-U/{e1_exact_allq.py,census.py,CENSUS-T1-RECTANGLE.json}`, `ADJ-T/adj_t1_e1allq.py` | against `sources/c5-stage7-sources/SOURCE-DIGESTS.json` | all match. `control/SOURCE-DIGESTS.json` does not list the `c5-stage7-sources` tree; that tree carries its own digest file |

Script: `scratchpad/c6-crit-T2-U/seals.py`.

**Read-boundary disclosures (mine).**
1. **Listings.** I ran non-recursive `ls` of `sources/` (top level) and of the named frozen-source folders
   `sources/c4-stage7-sources/{C-T1-U,ADJ-T}`, `sources/c5-stage7-sources/{ADJ-T,T2,C-T2-U,C-T1-U}` and `sources/authority`
   (names only; inside the `sources/` grant). I also ran one `grep -n '^#'` on the single capsule member
   `control/C6-CRITIC-ATTACK-BRIEFS.md` to locate my seat's section. After that I read only its preamble (lines 1–20) and the T2
   section (lines 52–79).
2. **Frozen sources opened** (authorized as Stage 2 members). `sources/c5-stage7-sources/C-T1-U/e1_exact_allq.py` and the
   `rq_coeff`/`e1_condition_i` lines of its `census.py`, plus the first 60 lines of `ADJ-T/adj_t1_e1allq.py`: I read these ONLY to
   learn the cleared form of E1 condition (i), because the registry is not a capsule member. I also read
   `CENSUS-T1-RECTANGLE.json` ONLY to find the next rows by order. Both are priors: every number below comes from my own
   instruments.
3. **A pointer in the brief that I did not follow.** The attack brief calls controller replay `CF-REPLAY-c6b` "a capsule member".
   It is NOT among the 14 files of my sealed capsule, so I did not read it. I derived everything it would have supplied myself.
4. **Not read:** any other return or critique, adjudications, `control/CLAIM-IDENTITY.run-local.json`, the Cycle 1–5 syntheses,
   the worker common brief, other roots, the network.
5. **Background jobs.** I started four, all under my scratch: PIDs 75692 (`allleaves.py`), 79915 and 80590 (literal
   laboratories), plus a harness-tracked waiter. The first E1 attempt was promoted to the background by the harness timeout and
   stopped through the harness task channel (id `bbhp5xdn0`) before it produced output. Every job was confirmed exited, or killed
   by literal PID, before this write. I never ran a process listing or a pattern kill.

## Independent re-derivation

All of my instruments live in `scratchpad/c6-crit-T2-U/own/`. They are standard-library Python run with `python3 -B`, exact
`int`/`Fraction`, and none imports the return's code except where stated (the LP replay).

**R1 — Generic tree instruments (`treelib.py`), validated literally.** The file contains:
- my own `CB(d,m)` builder;
- a tree test (connectivity by BFS, acyclicity by union-find, and `|E| = n − 1`);
- an independence-polynomial DP with a forced-out set;
- `x` computed through rank `α` with zero extension;
- `q_v(j) = i_j(H_v) − i_j(R_v)`;
- a NEW generic active-tag DP computing `Σ_{B ∈ I_j} w_F(B)` on any tree and any leaf-tag set.

The active-tag DP uses per-vertex dual-number triples that track the states "no child / one F-leaf child / one other child / at
least two children in B". It is a third route, structurally unlike both the return's `q_v` aggregation and its `CB`-specific
network-dual closed form. `validate_small.py` compares every layer against LITERAL enumeration (all subsets, independence
filter, the set definition `#{v ∈ F ∩ B : (B∖{v}) ∩ W_v ≠ ∅}`). It covers 44 trees: `CB(2,2)`, `CB(3,2)`, `CB(2,3)`, `CB(1,4)`
and 40 random trees of order 5–15. Each tree gets 3 tag sets (all leaves plus two random subsets), and WID is checked against the
`q_v` route at every `j`. **ALL_MATCH True**, plus a root-is-support case (`out_validate_small.txt`).

**R2 — Fixed points (`rows.py fixed`).** Every leaf is tested and `F` is derived:
- `K_{1,12}/8`: `α = 12`, `x = 6`, `|F| = 12`, supply 1980, capacity 3960, `S = −1980`.
- Path-star `(2,3,4)/7`: `α = 11`, `x = 5`, `|F| = 10`, 1483 / 2701, `S = −1218`.
- Path-star `(2,2,4,3)/8`: `α = 13`, `x = 6`, `|F| = 12`, 8033 / 13467, `S = −5434`.

WID holds on all three, and all match the contract.

**R3 — Row data at the four rows (and the next four; see the open step).** `rows.py` recomputes `F_p` on the literal tree from
`Δ_p(T − v) < 0` for the arm leaf and for private leaves in chokes 0, `m/2` and `m−1`, and asserts that the private
representatives agree (Aut is transitive on private leaves). **At `CB(8,95)/508`, `allleaves.py` derives `F_p` LITERALLY FOR
EVERY ONE OF THE 761 LEAVES** with no orbit argument: 761 of 761 are favorable, the literal `S` equals the orbit `S`, and WID
holds. `out_rows_summary.txt`:

| Row | `n` | `α` | `x` | `Δ_x<0`, `Δ_{x−1}≥0` | window | `\|F_p\|` = leaves | `S<0` | own `S` = T2 `S` (all digits) | own supply − capacity = `S` |
|---|---|---|---|---|---|---|---|---|---|
| `CB(8,95)/508` | 1618 | 856 | 506 | yes | `[508,570]` | 761 | yes | **yes** | **yes** |
| `CB(7,109)/510` | 1638 | 873 | 508 | yes | `[510,582]` | 764 | yes | **yes** | **yes** |
| `CB(8,98)/524` | 1669 | 883 | 522 | yes | `[524,588]` | 785 | yes | **yes** | **yes** |
| `CB(7,112)/524` | 1683 | 897 | 522 | yes | `[524,598]` | 785 | yes | **yes** | **yes** |

Every `p` equals `x + 2` (the first eligible rank) and `3p < 2α + 1`. The return's §2 row literals are all correct.

**R4 — `supply − capacity = S` from genuinely different sides.** Supply and capacity come from my generic active-tag DP on the
literal adjacency with `F = F_p` derived (R1). `S` comes from the `q_v` route. They agree at all four rows (and the next four).
Separately, `out_compare_T2.txt` shows:
- my supply and capacity equal T2's network-dual supply and capacity digit for digit;
- T2's `S_network` equals T2's `S`.

The return's §3 claim is therefore TRUE, but see the Certification audit for how it was backed.

**R5 — Exact all-`q` E1(i) with no Darroch (`e1_allq.py`).** For every `q = 1..m` I check
`r_q(p−q) ≤ r_q(p−q−1)`, where `r_q = (1+y)^{qd−1}(1+2y)^{d(m−q)+1}`. The coefficients come from two independent codes:
closed binomial sums, and full polynomials built incrementally as `r_q = r_{q−1}(1+y)^d/(1+2y)^d` with exact synthetic division
(remainder asserted zero). The two agree at every `q`.

**No failing `q` at any of the four rows** (95, 109, 98 and 112 values of `q` respectively). This is the allocation's "exact all-`q`
E1 check" that the return did not perform. It REMOVES the Darroch dependency at these rows, since the E1 rank-threshold key is no
longer needed there. The threshold arithmetic `p = ⌈μ₁⌉ + 2 = ⌊(2dm+4)/3⌋` is confirmed at all four rows:
`μ₁ = 1011/2, 1523/3, 1043/2, 1565/3`. The sector ratio is `R_K/R_{K−1} = p/(p−1)`, so the sector is deletion-deficient and the
switch arcs are load-bearing. The `ρ_1` values equal the return's §5 literals exactly.

**R6 — The certificate, as data, re-verified by my own code.** `cert_dump.py` replays the inherited LP (copy-out, unmodified) and
DUMPS THE FULL per-state table to `CERT-TABLES.json`, which the return did not ship. The table has `pb(β,γ)`, `pc(β,γ)`,
`σ(γ)` and `θ*` for all eight rows; its SHA-256 is `37b450e6e7a0b6fba167d14bd8ef4741d29bcc328608e0ab97258b526fc57d83`.

`θ*` reproduces the return's four values exactly: `96/604265`, `32/317857`, `96/642947`, `8/83889`.

`cert_verify.py` is my own code, reading the table as data. It works by per-leg-count reduction followed by exact
(min,+)/(max,+) knapsacks over the `m` chokes, and it checks:
- nonnegativity;
- minimum sector-source outflow of exactly 1;
- maximum in-sector target inflow of exactly 1;
- `(d−γ)σ(γ) ≤ θ*γ` for `γ = 1..d−1`;
- `θ* ≤ 1 − ρ_1`.

**CERTIFIED at all four rows** (and at R8's four; `out_cert_verify.txt`). This is still the LP's local model checked a second way. The model's
fidelity to the literal network is R7's job and the structural argument below.

**R7 — LITERAL laboratory on the ACTUAL row `CB(8,95)/508` (ruling 49; the instrument the return does not supply).**
`literal_lab.py` works on the 1618-vertex tree with `F_p` derived and `w_F` computed from the set definition. For each sampled
source it enumerates every (D) ∪ (S) arc literally from the vertex set: all deletions, and every `u ∉ B` with `|N(u) ∩ B| = 2`.
It assigns the certificate's flow to each arc by the choke-local rule read from `CERT-TABLES.json`, and asserts that every
positive-flow arc is a literal arc. For each sampled target it enumerates ALL literal preimages: every `B' ∈ I_{p+1}` with a
literal arc to `A`, including switch preimages, each re-verified as a literal arc.

The samples:
- **Sector sources:** the knapsack argmin configuration (two shuffles), plus 40 random sources.
- **In-sector targets:** the argmax configuration (two shuffles), plus 12 random targets.
- **Switch images:** 24, three for each `γ = 0..7`.

Result at `CB(8,95)/508` (`own/out_literal_lab_8_95.json`):
- **Sources.** 43 sector sources and **22,531 literal arcs** enumerated. Every positive-flow arc is a literal (D) ∪ (S) arc, every
  source has literal `w_F(B) = 1`, and the minimum literal outflow is `1`.
- **In-sector targets.** 15 targets, each with literal `w_F(A) = 1`. The maximum literal inflow is `1`.
- **Switch images.** 24 images. Literal `w_F(A) = γ` at every one, and the maximum of literal load `/(θ*·w_F(A))` is exactly `1`:
  the σ-constraint is TIGHT at some `γ` and never exceeded. The `γ = 0` images receive 0.
- **Non-sector preimages.** 13,474 `r`-free switch preimages were found into the in-sector targets. They carry zero flow in the
  composition, because E1-R is deletion-only.

The same laboratory at smaller size (the argmin source and two shuffles plus 3 random sources; the argmax target and two shuffles
plus 2 random targets; one switch image per `γ`) passes on each of the other seven rows (`own/out_literal_lab_small.jsonl`).
Every flag is true, with minimum outflow `1`, maximum inflow `1` and maximum switch ratio `1` on each row. This is a sampled
laboratory, which ruling 49 asks for. Exactness comes from the structural argument that follows.

**Structural fidelity (proved on the face; this is what makes the local model exact rather than sampled).** In a sector source
(`r, v ∈ B`) every hub `u_i` and `s` is absent. The only switches are:
- insert `s`, which removes `r` and `v` and lands on a weight-0 target;
- insert `u_i` when choke `i` has exactly one `b` in `B`, which removes `r` and that `b`.

In the second case the target has `u_i`, the `γ` private tags of choke `i` active and `v` inactive, so it has **weight γ** (R7
confirms this literally at every sampled image). Deletion of a leg lands in-sector (weight 1). Deletion of `r` or `v` lands on
weight 0. Consider an in-sector target and one of its empty legs. Its sector preimages are exactly one `b`-addition and one
`c`-addition at that leg. That gives `(d−n)(pb(β+1,γ) + pc(β,γ+1))` in total, which is the model's `In`. No switch preimage of
an in-sector target is a sector source; every such preimage (inserted `r`) is `r`-free. A switch-image target with `γ` `c`'s has
exactly `d − γ` sector preimages, which gives the model's `(d−γ)σ(γ)`. So the LP's `Out`/`In`/switch-load functions are the literal
network's, restricted to the sector. R7 confirms this on samples at the actual row.

**R8 — Critic-derived advance (C-T2-U): the next four rows by order, certified by the same composition.** These are the step the
return leaves open ("214 remain… smallest first"). The census file was used only to name them; every number below is from my own
instruments:
- R3 row data, with `F_p` derived and WID from independent sides;
- R5 exact all-`q` E1 (no failing `q` at 101, 115, 104 and 118 values of `q`);
- the sector ratio `p/(p−1)`, deficient and switch-necessary;
- R6: LP replay and my own verifier;
- R7 literal laboratory on each actual row.

| Row | `n` | `α` | `x` | window | `\|F_p\|` | E1 all `q` | `θ*` | `(1−ρ_1)/θ*` | CERTIFIED | literal lab |
|---|---|---|---|---|---|---|---|---|---|---|
| `CB(8,101)/540` | 1720 | 910 | 538 | `[540,606]` | 809 | holds | `96/682829` | ≈ 32.948 | yes | pass |
| `CB(7,115)/538` | 1728 | 921 | 536 | `[538,614]` | 806 | holds | `64/707469` | ≈ 41.141 | yes | pass |
| `CB(8,104)/556` | 1771 | 937 | 554 | `[556,624]` | 833 | holds | `96/723911` | ≈ 33.924 | yes | pass |
| `CB(7,118)/552` | 1773 | 945 | 550 | `[552,630]` | 827 | holds | `64/744785` | ≈ 42.212 | yes | pass |

Each `p` is the first eligible rank and equals `⌈μ₁⌉ + 2 = ⌊(2dm+4)/3⌋`. The composition is (E1-R flow on `r`-free sources) +
(sector certificate) + B7, exactly as in T2's §7. Consequence: whole-row (HALL) at these four `(T, p)`, `computer_assisted`,
STATED by the critic. It needs an isolated second read before any registration. All eight tables are in `own/CERT-TABLES.json` as
T1 fitting data.

## Attacks and findings

1. **Fidelity (first check): passes.**
   - The weight counts ACTIVE tags only: T2's brute force uses the set definition, and so do mine.
   - The relation is (D) ∪ (S): R7 enumerates it literally.
   - `F` is fixed at `p` on the original tree and derived. It is literally all 761 leaves at `CB(8,95)/508`, and derived by orbit
     representatives elsewhere.
   - `x` is computed through `α`.
   - `supply − capacity = S` holds on every instance from independent sides (R4).

   Two soft spots:
   - (a) T2's `network_dual.py` HARD-CODES `F` = all leaves (`v_in_F=True`). This is discharged only by `rowA`'s derivation in
     another script, so it is not derived inside that instrument.
   - (b) `rowA`'s comment says it will "assert equality on a second rep", but the code computes one representative per orbit class
     and asserts nothing further.

   Both are harmless here, because R3's literal all-leaves run confirms `F`, but neither is evidence as shipped.

2. **The composition's direction is misstated (§7).** The return says "(HALL-COND) holds for every `X` … so by B7 a saturating
   integral flow exists". The logic runs the other way. The superposed fractional flow (E1-R's flow plus the sector certificate,
   outflow scaled to exactly `w_F(B)`) gives (HALL-COND) by B7, which is flow ⇒ Hall. The integral saturating flow then follows
   from (HALL⇒FLOW), or from max-flow integrality. The conclusion stands and the text should be corrected. The return also omits
   that the certificate's `Out ≥ 1` has to be scaled down to `= w_F(B) = 1`. That scaling only lowers loads.

3. **E1-R's non-literal part.** In-sector targets have `r`-free switch preimages (13,396 of them into just the 4 smoke-test
   targets). The composition is sound only because E1-R's flow is deletion-only and its load clause puts 0 on targets with no
   choke present. I confirmed that the return relies on exactly this, and that the four rows satisfy E1(i) at every `q` exactly
   (R5). Two things I could NOT check from my capsule:
   - E1-R's full hypothesis list beyond E1(i) (the registry is not a member);
   - its CD-1 dependency.
   So the composition inherits E1-R at its registered `proved_informal` grade.

4. **Scope: rows, not trees.** Each certificate is (HALL) at ONE rank, the first eligible rank `p = x + 2`. The ranks `p+1 … ⌊2α/3⌋`
   of these four trees (62, 72, 64 and 74 further ranks) are NOT covered. Unlike the six closed trees, these four trees are not
   CLOSED. The return never says they are, but "whole-row" must not be read as "whole-tree".

5. **Quantifiers and inequality directions** (every `X`, every target, `θ* ≤ 1 − ρ_1`, `(d−γ)σ ≤ θγ`): correct. There is no
   natural-number subtraction hazard, and no circularity: `S < 0` is never used.

6. **Deficient-cut watch.** Nothing here is a cut, and nothing is presented as one.

**Standing letters (a)–(d) of gate ruling 30, one line.** Ruling 30's text is not in my capsule. Toward the run's letters, the
return supplies four more `computer_assisted` restricted-scope (HALL) rows (218 → 214 uncertified). It supplies no `proved_informal`
restricted (HALL), no (CUT) candidate and no Lean-ready statement. With my additions, it gives T1 eight complete per-state tables
as fitting data.

## Mechanism-equivalence and fence check

- The mechanism is the homogeneous choke-local reduced-capacity sector flow on literal (D) ∪ (S), with active-tag weights. The
  switch arcs are genuinely load-bearing: the sector ratio `p/(p−1) > 1` makes deletion-only fail on the sector. That means it is
  NOT deletion-only Hall (`E993-R23-LITERAL-DELETE-ONLY-HALL`). It is also not Delete/Retag, own-support unit capacity, per-leaf
  injectivity, occupancy domination, signed cross-tag or covariance.
- It does not re-prove a closed region or a settled family. Its inputs are the registered E1-R and (at the return's grade) the
  E1 threshold key, which R5 renders unnecessary at these rows. B7 is elementary.
- No census value is used as evidence. The census is only a pointer to rows (mine too). There is no RTree wording, and (LIFT) and
  (DCB) are not used.
- The four `(d,m,p)` triples are disjoint from the five registered rows and from `G(8^82,7^2)`.

## Certification audit

| Literal in the return | Status |
|---|---|
| Row data §2 (`n`, `α`, `x`, window, `\|F_p\|`, full `S`) | **backed**: reproduced by my own instrument (R3), all digits |
| "`supply − capacity` … **equals `S` from §2, exactly**" (§3 table, column `True`) | **true, but NOT backed by the shipped run.** No shipped script compares `S_network` with `S`: `network_dual.py` prints `S_network` only, and `myrows_basic.py` line 38 still `assert`s the struck same-source identity `supply − capacity == S` from `rowA`. It is now critic-backed (R4 and `out_compare_T2.txt`). The `myrows_basic` assertion is non-evidence (ruling 17/24) |
| Brute-force validation "3 small CB(d,m)" | backed (code runs them), with `F` = all leaves hard-coded; it validates the weight generating function, not `F_p` |
| `θ*` values, "CERTIFIED" at four rows | **backed**: LP replay plus my own verifier (R6) |
| **"margins ≥ 31×"** (§6, §7, Remaining obligation, summary) | **STRUCK.** At `CB(8,95)/508`, `(1−ρ_1)/θ* = 4051244613614535235/130708222909490304 ≈ 30.9946 < 31`, as the return's own table shows ("30.99"). It is also a property of the LP optimum chosen (θ minimised within one local model), not of the instance |
| "per-state tables shipped as DATA for T1's fit" | **STRUCK as stated.** Only `σ(γ)` and the affine parameters are printed, and `pb(β,γ)`/`pc(β,γ)` are neither shipped nor digested. Supplied by the critic: `CERT-TABLES.json` (`37b450e6…`) |
| "E1(i) holds at every `q`" | cited in the return; **now critic-verified exactly, Darroch-free,** at all four rows (R5) |
| "a literal laboratory" (the allocation's third instrument) | **absent from the return**; supplied by the critic (R7) |
| "byte-identical" copies of C-T1-U's instruments | consistent with the digests I hashed. I did not open `scratchpad/c4-crit-T1-U/`, which is outside my grant |
| Attack brief's `θ*` quote `96/604265, 32/120853, 288/604265, 336/604265` | the brief's last three numbers are `CB(8,95)/508`'s `σ(5)`, `σ(6)`, `σ(7)`, not `θ*` of the other rows. The return's `θ*` literals are the correct ones |
| Grades: whole-row (HALL) `computer_assisted`, STATED; route verdict `proved_conditional` | the grade is right. The "condition" named (Darroch, via the threshold key) is DISCHARGED at these four rows by R5, so what remains is E1-R at `proved_informal`, and the composition is `computer_assisted` |

## Verdict

verdict: retained_narrowed
headline_resolved: no

**Retained:** (HALL) holds at `CB(8,95)/508`, `CB(7,109)/510`, `CB(8,98)/524` and `CB(7,112)/524`, each at its first eligible rank,
with the switch arcs load-bearing. The grade is `computer_assisted`, conditional on the registered `proved_informal` E1-R. It is
re-derived here from independent row data, an exact Darroch-free all-`q` E1 check, my own certificate verifier, a structural
fidelity argument and a literal laboratory on the actual row.

**Narrowed:**
- "margins ≥ 31×" is struck;
- the §3 "equals `S`" is critic-backed, not shipped-backed;
- the per-state tables are incomplete as shipped;
- §7's B7 direction needs correcting;
- the scope is rows, not trees.

**Naming:** the right move is a scope note on the registered five-row switch-arcs key, or a key naming the trees and ranks exactly.
`FOUR-CB-…` does not name its object (ruling 48).

**Critic-derived advance (attributed to C-T2-U):** four MORE rows certified by the same composition, with the full pipeline
(own row data, exact all-`q` E1, LP replay plus own verifier, literal laboratory on each actual row):
`CB(8,101)/540`, `CB(7,115)/538`, `CB(8,104)/556`, `CB(7,118)/552` (R8; `computer_assisted`, STATED).

**One line (attack-brief close):** the return reaches no `proved_informal`-or-better restricted (HALL), no (CUT) candidate and no
Lean-ready statement. It supplies four `computer_assisted` rows (eight with R8). A successor inherits the eight full per-state tables
(`CERT-TABLES.json`), the literal-laboratory instrument, the exact E1 check, and 210 uncertified rows.

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

## Remaining obligation

**Remaining after this critique:**
- 210 of the 218 uncertified switch-necessary rows (214 after T2, 210 after my four), smallest next `CB(7,121)/566`
  (`n = 1818`) and `CB(8,107)/572` (`n = 1822`), per the census pointer;
- every higher eligible rank of the eight trees;
- T1's parameter-uniform `(L-S)_top` (the eight tables are its data);
- the registry decision (a scope note on the five-row key, naming every `(T,p)`).

The return's own `## Remaining obligation` ("214 rows remain… run `certify` down the list") is exact as a count. It must add that
each row also needs:
- the literal laboratory (ruling 49);
- an exact all-`q` E1 check at `p` (below the E1 threshold the composition is unavailable, and at the first eligible rank
  `p ≥ ⌈μ₁⌉ + 2` has to be checked);
- the full table shipped.

## Artifact inventory

**Deliverable:** this file only.

**Scratch** (`/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c6-crit-T2-U/`).
Everything was run with `python3 -B`, and no bytecode is present.

| File | SHA-256 | Role |
|---|---|---|
| `seals.py` | `976329c3d174dc69ca75f7a99261fbd3f44e12a3878e736722c28a06c0ba99b9` | capsule, dispatch, Stage 3 and Stage 2 seals; capsule member digests |
| `replay/` (20 files) | as the return's inventory (all 20 match) | copy-out of T2's scripts, outputs and `inherited/`; LP code used only by `cert_dump.py` |
| `own/treelib.py` | `4a73dbd594353181013826372c38131767233b62b3b307a3bef862f2815d4166` | generic tree instruments; the new generic active-tag DP |
| `own/validate_small.py` | `e09ebd68a7656e1030c408bd0171e0a9e44ffe0c06d90f944a29fccd7b06af9b` | literal enumeration, 44 trees × 3 tag sets, including WID |
| `own/out_validate_small.txt` | `608414140fb84e7bdd86fcecf1215340f95a3efcac4a276a9658baac22e9de5f` | ALL_MATCH True |
| `own/rows.py` | `b0bbfd514b00e32eaf631782fc61f2632961884048338b485241ecc267dcdeee` | fixed points and row data |
| `own/out_fixed.txt` | `4978690ffba148004c651b5ebbd0c216ad2b090c1cf3e2ac9307172b39e7a58a` | three fixed points |
| `own/out_row_{8_95,7_109,8_98,7_112,8_101,7_115,8_104,7_118}.json` | `17c3ed6a…`, `f3470ef3…`, `419cb33d…`, `351bdcc7…`, `e5039af7…`, `5d089f7a…`, `a275a1a5…`, `937cdbf1…` | row data, full `S` |
| `own/out_rows_summary.txt` | `6a60206866287bfc5abff0536460fa18e6adac760de99368ab9950de6d00b9d1` | summary, with `S` compared against T2 |
| `own/allleaves.py` | `ea05b3ed4a479903a788c976fb66623856eb78aafb5db92ac79334cccb719fed` | literal `F_p` over all 761 leaves, `CB(8,95)/508` |
| `own/out_allleaves_8_95.json` | `5a708307e03b8f01e6e3f82d0d63b12813b1c0b65ebf2218bacfe2c504d627a3` | 761/761 favorable; WID |
| `own/out_compare_T2.txt` | `c400ab32d0fc6355ae9ffe36a8cc5b582ee60c5ef3053bb023a6f9ff3d049e32` | T2 `S_network` = T2 `S`; own supply/capacity = T2's |
| `own/e1_allq.py` | `97d39b52381183e4a95d2a2d5197711bb2d1e1b4e8ffde02546830f133f18094` | exact all-`q` E1(i) by two methods; sector ratio; `ρ_1` |
| `own/out_e1_allq.txt` | `14a0fdbd04692a9558f4859d8a5a823af4ac3a1f75e0ab62276353a8feb73c04` | eight rows, no failing `q` |
| `own/cert_dump.py` | `d2e6de5665579218d85034bf93ae6168f1d6a97a9f8d05bdef2ef68de3203bf6` | LP replay; dumps full tables |
| `own/out_cert_dump.txt` | `4e9144beaf88a13503248a171e0bf7bfe88f9eb7400602fbca8f0d23857c960b` | `θ*` for eight rows |
| `own/CERT-TABLES.json` | `37b450e6e7a0b6fba167d14bd8ef4741d29bcc328608e0ab97258b526fc57d83` | **DATA**: `pb`, `pc`, `σ`, `θ*` for eight rows (for T1) |
| `own/cert_verify.py` | `b32f25b6065ec649c3c33328f2b9112aa2abf51dfee776496b7897492408fe2a` | own exact verifier |
| `own/out_cert_verify.txt` | `7eb6bd1ea59a0120628667d5385be311e914650d0ea90a7a7f08be2111827a90` | CERTIFIED ×8; exact ratios, including 30.9946 |
| `own/literal_lab.py` | `c7fd41aa2c6dfa7ec954a0789ebb3e11d874aaebfda34250e925915628b54b62` | literal laboratory on the actual row |
| `own/out_literal_lab_8_95.json` | `713f440f1fe7808b80810a81eab3ebbb617157630cb3c2697187c16c789b7bea` | 43 sources / 22,531 arcs / 15 targets / 24 switch images: pass |
| `own/out_literal_lab_small.jsonl` | `dd02a2a0fba4ba77ea13e3e84d5bc9d118abcca745fbf659cb897e921b43fd1d` | seven more rows: pass |
| `own/err_*.txt` (3) | `e3b0c442…` (empty) | stderr of the background jobs: empty |

**Replay** (copy-out first into a fresh directory):

```
cd own
python3 -B validate_small.py
python3 -B rows.py fixed
python3 -B rows.py 8 95 508
python3 -B allleaves.py
python3 -B e1_allq.py 8,95,508 7,109,510 8,98,524 7,112,524 8,101,540 7,115,538 8,104,556 7,118,552
python3 -B cert_dump.py <same rows>
python3 -B cert_verify.py
python3 -B literal_lab.py 8 95 508 40 12 3 2027
```

`cert_dump.py` expects `../replay/inherited/`. The literal laboratory takes about 10 minutes; `allleaves.py` takes a few minutes.

**Background jobs:** PIDs 75692, 79915 and 80590, plus harness waiters, all exited before this write. The harness-promoted task
`bbhp5xdn0` was stopped. There was no process listing and no pattern kill.
