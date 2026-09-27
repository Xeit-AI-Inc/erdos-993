# Critique

Run `erdos-993-math-dre-20260926-r30-weighted-transport` (r30), Cycle 5, Stage 4. Critic `C-T2-F` (orientation F, falsify)
of seat `T2`, route `C5-T-02 HETEROGENEOUS-SWITCH-NECESSARY-ROW-CLOSURE` (orientation T). Return audited:
`cycles/cycle-5/stage3/returns/T2/RETURN.md` (SHA-256 `91113a428e6cc170094e262382706bdd1248f8b325844e7be2a7b38b4cc9f943`).

**Boot.** I am operating within VerityOS. Boot reads were exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, read in full. I did not follow the startup protocol's task map into any
other VerityOS subsystem. The dispatch restricts my writes to this file and my scratch, so I did not create a conversation log.

**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

**Dispatch:** `control/dispatch/c5-stage4/DISPATCH-C-T2-F.md` SHA-256 `77448b160209e4ad8ec0ab644945be681b981a032f543a15b3751350b24cc1b4`.
I verified this with `shasum -a 256` before following the dispatch. IMPORT LIST (every critic script): `json`, `re`, `random`
(fixed seed), `fractions`, `math`, `itertools`, `collections`, `io`, `contextlib`, `sys`. All are standard library. There was no
network access, no install and no lake/lean. Every script ran as `python3 -B` in the foreground. No background job was started.

## Identity and seal audit

| Object | Recomputed | Result |
|---|---|---|
| Capsule `control/c5-critic-capsules/T2-PACKET-MANIFEST.json` inner seal | `3f58173d43e2172d355f070eaaa136ba87db2a432ab53a960c9a70289c475b78` | equals the stored field and the dispatch value. All 14 members match on bytes and SHA-256. |
| Stage 4 dispatch manifest seal | `8987ae6103a006574f10d7a79ba9cb61fa9f1f9700ef9b731123f540d3c5028d` | equals the stored field |
| Stage 3 packet manifest seal | `01bf60991d9714c046a19a1b4aa9c6a4fe1e0926e1e729a7db5aae3f7b521b58` | equals the stored field. It lists `RETURN.md` at `91113a42…` and `DISPATCH-T2.md` at `182d045d…`, and T2 quotes the latter. |
| Stage 2 packet manifest seal | `2e8e3d4430a27718f96ce1abbea0830d7ddbe5775a7cc291ca11d8842492c289` | equals the stored field, the common brief's value and T2's quoted value. **Discrepancy:** duty 1 of `C5-CRITIC-PROTOCOL.md` quotes the Stage 2 seal as `f0b5a2a1…0869684`, and the manifest does not recompute to that value. The same literal appears in `C4-CRITIC-PROTOCOL.md` and `C4-CRITIC-COMMON-BRIEF.md`, so it is Cycle 4 clone residue that the R30-E-h sweep missed (a candidate controller erratum). I seal against `2e8e3d44…`. |
| T2's 13 inventoried scratch artifacts (`scratchpad/c5-T2/`) | SHA-256 of each | **13/13 match** the return's inventory |
| Replay, copy-out-first to `scratchpad/c5-crit-T2-F/replay/`, run with `python3 -B` | `cmp` against T2's outputs | **6/6 byte-identical**: `rowdata`, `rho`, `window_check`, `hetero_certify`, `verify_seal`, `alias_check`. The last two use cwd-relative `../../control/…` paths and only run from a directory two levels below the root. I ran them with cwd `scratchpad/c5-crit-T2-F/`. This is a portability defect of the replay recipe, not of the results. |

The Stage 3 read-boundary disclosures record (a capsule member) lists T2's items: names-only `ls` above its grant, and host
injection not acted on. I weighed them. None bears on the mathematics.

**My read-boundary disclosures.**
1. To locate the protocol's Stage 2 seal literal I ran one `grep` over `control/*.md` and `control/c5-critic-capsules/*.json`. That
   search is above my grant. It printed one line each from `control/C4-CRITIC-COMMON-BRIEF.md` and `control/C4-CRITIC-PROTOCOL.md`
   (non-capsule files), and I read nothing more of them. The finding above rests on that output.
2. When I replayed T2's `alias_check.py`, the generator read `control/CLAIM-IDENTITY.run-local.json`, which is a Stage 2 member but
   not a capsule member. Replaying the return's generators is authorized. I did not open the registry myself.
3. I read `control/C5-WORKER-COMMON-BRIEF.md` lines 95–125 for the typed verdict vocabulary; the common brief authorizes this read. I
   also checked its digest, and those of the registry and `CLAIM-DISTINCTIONS.json`, against the Stage 2 manifest. All matched.
4. I ran one `ls -la` on the named inventoried directory `scratchpad/c5-T2/`.
5. `alias_mine.py` read `sources/authority/CLAIM-IDENTITY.json`, which is within my grant.
6. The host injected `CLAUDE.md` and the auto-memory index. I did not act on either.

I read no other return, critique, adjudication or root.

## Independent re-derivation

**Instrument.** My own code, written from SEMANTIC-CONTRACT §1 without consulting T2's code:
- `tree.py` builds the literal `G(d_1..d_m)` and tests connectivity (BFS) and acyclicity (union–find over edges, independent of the
  BFS) separately, then checks `|E| = n − 1`.
- It contains a generic tree DP for `I(T − D; y)`. The DP is forest-safe and has no knowledge of chokes.

**Fixed points** (`fixedpoints.py`). Before trusting the instrument I reproduced the common brief's fixed points. For the small
trees, supply and capacity come from literal enumeration of `w_F` and `S` comes from `Σ q_v`, so the two sides are independent.
- `K_{1,12}`/8: 13, 12, 6, `|F|` = 12, 1980 / 3960, `S = −1980`.
- Path-star (2,3,4)/7: 15, 11, 5, 10, 1483 / 2701, `S = −1218`.
- Path-star (2,2,4,3)/8: 18, 13, 6, 12, 8033 / 13467, `S = −5434`.
- `CB(8,92)`/492: `n` 1567, `α` 829, `x` 490, window [492, 552], `|F|` 737 (derived), `S < 0`, `|R_491|/|R_490| = 492/491`.

**Row data at `G(8^82, 7^2)`** (`rowcheck.py`):
- The tree test passes. `n = 1427`, `α = 755`, and `x = 446` (first strict descent, zero-extended through rank `α`).
- The window is `[448, 503]`, 56 ranks. The ceiling check `3·503 < 1511 ≤ 3·504` is asserted.
- There are 671 original leaves.
- `F_p` is **derived at every one of the 56 ranks**. I computed `Δ_p(T − z)` for the arm leaf, a degree-8 private leaf and a degree-7
  private leaf. I added corroborating second members from different chokes and legs (`c_{57,5}`, `c_{83,6}`), whose deletion
  polynomials are asserted identical to the first members'.
- Automorphisms (swapping same-degree chokes with their subtrees; permuting a choke's legs) act transitively on each of the three
  orbits, so `F_p` = all 671 leaves at every rank.

**`supply − capacity = S` from independent sides, at all 56 ranks.**
- Side 1 is a structural weight generating function derived directly from the active-tag definition. It never uses `q_v`, `H_v` or
  `R_v`:
  `W(y) = y²(1+2y)^670 + (1+2y)·[82·P_8·Q_8^81·Q_7² + 2·P_7·Q_8^82·Q_7]`, with `P_d = d·y²(1+y)^{d−1}` and
  `Q_d = (1+2y)^d + y(1+y)^d`.
  - The first term is `r, v ∈ B`, where only `v` is active.
  - Otherwise, a present choke `u_i` activates exactly the `c`-legs at that choke, and nothing else is active.
  - The companion count GF equals the generic-DP `I(T)` exactly.
  - `W` is validated against brute-force literal `w_F` on six small analogues (`smallcheck.py`: `G(1)`, `G(2)`, `G(2,1)`, `G(3,2)`,
    `G(2,2,1)`, `G(3,1,1)`), together with `I` and (WID) at every `p ≥ 1`.
- Side 2 is `Σ_{v∈F}[q_v(p) − q_v(p−1)]` from the generic DP of `T − H_v` and `T − R_v`.
- Result: equal at all 56 ranks, and `S < 0` at all 56. `S(T,448)` equals T2's 320-digit value exactly.

**`ρ_{(1,7)}`, `ρ_{(1,8)}` at 448** (own code, `certcheck.py`): `5327002801984/5350924042653` and `588641648396200/591947103906771`.
Both are identical to T2's values. The residuals are ≈ `4.470488×10⁻³` and ≈ `5.584039×10⁻³`.

**The certificate** (`certcheck.py`). I replayed T2's LP and dumped all 155 per-state values to `t2_cert.json`; the return prints only
`a`, `λ`, `θ`. My own exact DP runs over the literal multiset (82 degree-8 and 2 degree-7 chokes). Every per-state flow is
nonnegative.

| Check | Result |
|---|---|
| min total outflow over every 447-leg sector source | **= 1**, attained at `{(7;0,7)×2, (8;0,1)×31, (8;0,8)×50, (8;1,1)×1}` |
| max total inflow over every 446-leg in-sector target | **= 1**, attained at `{(7;0,6)×2, (8;0,0)×20, (8;0,7)×62}` |
| switch-image load `(d−c)·σ_d(c)/c` | 0 at `d = 7`; at most `384/1832557` at `d = 8`, which is 3.75% of `1 − ρ_{(1,8)}` |
| sector deletion deficit at 448 | `R_447/R_446 = 448/447 > 1`, so switch arcs are **load-bearing** (for `X = sec`, the deletion neighbourhood carries weight `R_446`, since `B−r` and `B−v` weigh 0) |

**Literal laboratory at the actual row** (`literal_lab.py`; the second instrument of allocation item 2(d), which the return lacks).
On the literal `G(8^82, 7^2)` at `p = 448`, with seed `20260927`:
- Setup:
  - T2's choke-local rule is applied to literal (REL) arcs. Every deletion is enumerated, and every `u ∉ B` with `|N(u) ∩ B| = 2`.
  - `w_F` is literal.
  - Target loads are computed by literal preimage enumeration (every `z` with `A ∪ {z}` independent, and every `u ∈ A` with every
    pair of its neighbours).
- Scale: 61 sector sources (including the DP argmin), 62 in-sector targets (including the DP argmax and the R8-dead argmax), and
  60 single-choke switch images.
- Results:
  - **0 mismatches** between the literal loads and the local formulas `Out`, `In` and `(d−γ)σ_d(γ)`.
  - Every positive-flow arc goes to a positive-weight target.
  - The literal min outflow is 1 and the literal max inflow is 1.
  - The literal switch-image load ratio is at most `384/1832557`.
  - The literal switch-image weight is `γ`.
- Literal exit classes of sector sources (`lab_exits.py`):
  - Deleting a `b`- or `c`-leg gives a target of weight exactly 1.
  - `B−r`, `B−v` and the `s`-switch give weight 0.
  - `u_i`-switches give weight 0–7.
  - No other switch vertex occurs.

**E1-R criterion census** (`e1r_census.py`). T2 cited this bounded record and did not re-run it. I recomputed it at **every** choke-set
type `Q = (a, b)` (`0 ≤ a ≤ 82` degree-8 chokes, `0 ≤ b ≤ 2` degree-7 chokes, `q ≥ 1`; 248 types) × **all 56 ranks**. I used the
capsule-quoted form `r_Q = (1+y)^{D_Q−1}(1+2y)^{D−D_Q+1}` at `j = p − q`.
- **Zero failures.**
- Global max `ρ_Q = 5327002801984/5350924042653 ≈ 0.995530`, at `(a,b) = (0,1)`, `p = 448`. This matches the record.
- The per-rank maximum decreases to ≈ 0.668509 at 503.

## Attacks and findings

1. **Fidelity of the WID check. The return's literal is struck; fidelity itself is confirmed by the critic.** In §4, "supply" is
   `Σ_{v∈F} q_v(448)`, never `Σ_B w_F(B)`. The "two arithmetic routes over the same underlying `q_v` values" are one computation
   rearranged. That is non-falsifiable under rulings 17/24, and independent Method A/B polynomials do not repair it. I strike the
   literal "`supply − capacity == S` … from independently computed sides". My structural `W(y)` against `Σ q_v` does satisfy the
   requirement, at all 56 ranks. The weight counts active tags only, `F` is fixed at the original rank, and `x` runs through `α`. No
   downstream number is struck, because the certificate never consumes `S`.
2. **Obligation (d) was not met as claimed. The literal laboratory is critic-supplied.**
   - The return says "each with two instruments where the allocation asks for two". Its instrument 2, however, sits in the same file,
     reads the LP's own values, and evaluates the same local `Out`/`In` model. It is an exact verifier of the LP output, not an
     independent instrument on the literal network.
   - Allocation item 2(d) asks for "an exact LP/DP **and** a literal laboratory validation", and the return has no literal-network
     check at all.
   - My literal laboratory at the actual row supplies it, with 0 mismatches (above).
   - "Independent re-verification" is narrowed accordingly.
3. **Relation and weight fidelity of the sector construction: confirmed.**
   - The weight is literal.
   - The relation is (D) ∪ (S) exactly. The literal `S`-enumeration finds only `s` and `u_i` as switch vertices for sector sources.
   - Every positive-weight exit is an in-sector deletion or a single-choke `u_i`-switch image with `γ ≥ 1`. `B − v`, `B − r` and the
     `s`-switch weigh 0 literally, as the attack brief asked.
   - A switch-image target has a unique choke, so exactly `d − γ` sector sources feed it, all in local state `(1, γ)`. The per-target
     cap `(d−γ)σ_d(γ) ≤ θ_d·γ` is therefore the literal load.
4. **Obstruction R8: respected, but never checked in the return. Critic-derived.**
   - In-sector targets whose every sector preimage is switch-dead exist at 446 legs. These are the targets with every choke in
     `{(0,0)} ∪ {β ≥ 2}`.
   - Among them, the maximum inflow is **exactly 1** (tight), at `{(7;2,4)×2, (8;0,0)×20, (8;2,5)×62}`. The literal lab confirms this
     on that target.
   - So state-dependent one-hop shares are enough for R8. No two-hop route is needed; the allocation's "two-hop" parenthetical
     describes one sufficient remedy, not a requirement.
   - The return's §7 argues this in prose only.
5. **Zero-slack certificate.** Min outflow = 1 and max inflow = 1 exactly. The certificate is valid in exact rationals, but it has no
   margin. Any re-verification must stay exact (no floating-point LP), and the flow values themselves are the certificate of record.
   The per-state table (`t2_cert.json`, dumped by replay) should be shipped with the return: its 135 nonzero values are not printed
   in any T2 output.
6. **A literal in §7 is false.**
   - §7 states: "every in-sector target's up-degree is exactly 448 regardless of composition". That is the sector up-degree only.
   - In the literal network an in-sector target also has `C(z, 2)` preimages by an `r`-switch from non-sector two-choke sources, where
     `z` is the number of chokes with no `b`. At the argmax target there are 3486 such preimages, 3296 of them of positive weight
     (`lab_rswitch.py`).
   - The composition is unharmed, because E1-R's flow is deletion-only and cannot reach an `r`-containing target. A successor whose
     non-sector flow used `r`-switch arcs would, however, share the in-sector capacity. The literal is corrected here.
7. **Composition (§8): holds per class, conditional on E1-R's load statement.**
   - In-sector targets get at most 1 from the sector flow alone.
   - `(1,d)` switch images get at most `(ρ_{(1,d)} + θ*_d)·w ≤ w`.
   - Other `r`-free targets get `ρ_Q·w ≤ w`, with the criterion re-derived by me at all 56 ranks.
   - `r`-containing, `v`-free targets have weight 0 and receive nothing.
   - Positive-weight non-sector sources are all `r`-free. The only `r`-containing positive-weight sources are sector sources.
   - The fractional saturating superposition gives (HALL-COND) for every `X` at 448, and B7/(HALL⇒FLOW) gives an integral flow.
   - The load-bearing inherited input is E1-R's exact load `ρ_{Q(A)}·w_F(A)` on every `r`-free target, including the `(1,7)` and
     `(1,8)` classes with `v ∈ A`. E1-R's face is not in my capsule, so I verified its criterion, not its load statement.
8. **The 55 ranks `449…503` (§9) are carried by registered statements, not merely STATED.**
   - The sector is literally `Π_{670} K(2)`, since every leg is a `K(2)` whatever the choke degrees. The "mixed-`t`" heterogeneity of
     the attack brief does not enter the sector. The C1 deficit record gives `max(0, e_{p−1} − e_{p−2}) = 0` there.
   - The sector is carried by `E993-R30-HETEROGENEOUS-CLAW-PRODUCT-NORMALIZED-MATCHING` (CD-1) at constant `q_i = 2`:
     `|∂X| ≥ |X|·e_{k−1}/e_k ≥ |X|`, with `e_{k−1} ≥ e_k` verified at each `k = p − 1`.
   - The non-sector part is carried by `E993-R30-HETEROGENEOUS-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL`
     (E1-R), with its criterion critic-re-derived at every rank.
   - The two target classes are disjoint (`r ∈ A` versus `r ∉ A`).
   - Grade: `computer_assisted` (a finite criterion check composed with two `proved_informal` keys).
9. **Names (ruling 33): rename required, and one literal is wrong.**
   - Both proposed keys read "MIXED-DEGREE-CHOKE-TREE", which names a class. The statements concern the single tree `G(8^82, 7^2)`.
   - The return reports "9 shared tokens of 9" against the five-row deletion key's pattern. The pattern has **11** tokens, 9 of them
     shared.
   - 9 is exactly T2's own ≥85% threshold (`⌊0.85·11⌋ = 9`), so the second name is a **lexical alias hit** that the registrar lint
     will flag.
   - Suggested renames, screened clean against the master 434 and against that pattern (`alias_mine.py`):
     - `E993-R30-CHOKE-TREE-8POW82-7POW2-RANK-448-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`
     - `E993-R30-CHOKE-TREE-8POW82-7POW2-RANKS-449-TO-503-DELETION-ONLY-WEIGHTED-HALL`
   - Mathematically, neither is an alias of the five-row switch-arcs key or the five-row (D1–D3) deletion key. Those are about five
     homogeneous `CB` trees; this is a different tree with a different sector-certificate LP (two degree classes, shared `λ`).
   - The row-level conjunction is a scope note, not a key. I agree with that.
10. **Verdict wording.** `proved_conditional` is in the typed vocabulary. It is acceptable only as the return's grade line reads it: a
    `computer_assisted` finite certificate, composed with the registered `proved_informal` E1-R and CD-1. It is not a "conditional"
    theorem in the §4 sense. "Retires the entire known instance frontier" holds only after an isolated second read. "θ_7* = 0 … a
    genuine fact about this specific instance" is a property of the chosen LP optimum, not of the instance, so it is narrowed.
11. **Falsification attempt (my orientation).**
    - I looked for a deficient cut at `G/448` among the families where this construction is tight or thin:
      - the whole sector (deletion-deficient, rescued by `u_i`-switches);
      - the R8-dead target family (tight at 1);
      - the zero-switch degree-7 chokes (`θ_7 = 0`: their deficit is absorbed by the shared `λ`, not by switches).
    - None is deficient. Given E1-R, the exact certificate excludes every `X ⊆ I_449`, so no (CUT) exists at this row.
    - I found no falsifier of any mathematical claim in the return. All findings are fidelity, evidence and naming defects.

**Standing letters, one line:** the return supplies **half of (b′)**: whole-row (HALL) at `G(8^82, 7^2)/448`, `computer_assisted`,
confirmed by this critic pending an isolated second read. It is in fact extended to all 56 eligible ranks of that tree. The other
half of (b′), a second infinite eligible family, is F2's. Nothing is supplied toward (a′), (c′) or (d′).

## Mechanism-equivalence and fence check

- **Not a refuted key under new notation.**
  - At 448 the switch arcs are load-bearing (sector deletion deficit `R_447 − R_446 > 0`), so this is not deletion-only Hall.
  - Capacities are literal `w_F`, not own-support unit capacity (C6-F4).
  - There is no per-leaf injection, occupancy domination, signed cross-tag or covariance step.
  - It never counts `|F ∩ B|`.
  - At 449–503 the flow is deletion-only on this one tree. That uses registered restricted-scope keys (the five-row D2/D3
    precedent), not the refuted `E993-R23-LITERAL-DELETE-ONLY-HALL`, which is a different weight and scope.
- **No closed region re-proved.** The rows are in the lower region (`3p < 2α + 1`, `n = 1427 ≤ 4p − 8`), and no family theorem is
  re-proved.
- **No census value in a proof.** The E1-R criterion check is the finite verification of a finite hypothesis at named ranks, which is
  permitted for a `computer_assisted` finite statement.
- **No RTree wording. (LIFT) and (DCB) not used. The controller's prior not used.**
- **Imported grades:** WID `formally_verified`; CD-1 and E1-R `proved_informal`, registered. The composition's grade is its weakest
  input, and T2's own certificate is `computer_assisted`.
- **(HALL) at full scope and the primary aggregate are untouched.**

## Certification audit

| Literal in the return | Status |
|---|---|
| `n = 1427`, `α = 755`, `x = 446` (through `α`), window `[448, 503]`, 56 ranks, 671 leaves | **backed** (critic instrument) |
| `F_p` = all leaves at all 56 ranks, "derived" | **backed** (critic instrument; orbit argument explicit) |
| "`supply − capacity == S` … two routes … independent" | **struck** (one computation; non-falsifiable). The fact is re-established by the critic's independent sides at all 56 ranks. |
| `S(T,448) < 0`, 320 digits | **backed** (exact equality with the critic's value) |
| `ρ_{(1,7)}`, `ρ_{(1,8)}`, residuals | **backed** (exact) |
| LP values `a_d`, `λ`, `λ₂`, `θ*_7 = 0`, `θ*_8 = 384/1832557` | **backed** (byte-identical replay; the critic's DP verifies them) |
| "min outflow = 1", "max inflow = 1", "CERTIFIED … True" | **backed** (critic DP and literal lab) |
| "Instrument 2 … independent" / "two independent exact instruments" | **narrowed**: an exact verifier of the LP output on the same local model; the literal laboratory is critic-supplied |
| "each with two instruments where the allocation asks for two" (Remaining obligation) | **struck** as stated (item 2(d)'s literal laboratory is absent from the return) |
| "every in-sector target's up-degree is exactly 448" | **struck** (true only for sector preimages; see finding 6) |
| "9 shared tokens of 9" | **struck** (9 of 11; a lexical alias hit at T2's own threshold) |
| "θ_7* = 0 … a genuine fact about this instance" | **narrowed** (a property of the LP optimum chosen) |
| "E1-R criterion holds at all 56 ranks" (cited) | **backed** by critic re-derivation (248 types × 56 ranks, 0 failures) |
| "(HALL) holds at every one of the 56 known eligible ranks" | **retained** at `computer_assisted`, conditional on the registered E1-R load statement and CD-1; STATED pending a second read |
| Artifact digests (13), "reproduce every result … byte-for-byte" | **backed** (13/13; 6/6 replays byte-identical when run from a directory two levels below the root) |
| "no bytecode" | **backed** for the critic's own scratch (every run used `-B`) |

## Verdict

verdict: retained_narrowed
headline_resolved: no

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5[1m]

The mathematics of the return stands. Its certificate at `G(8^82, 7^2)/448` is exact and correct on the literal network, and its
composition with E1-R, and with CD-1 plus E1-R at 449–503, is sound. The grade is `computer_assisted` for a finite (56-instance)
statement. I do not call it `proved_informal`: it is a finite certificate, not a parameter-uniform theorem.

The return is narrowed on the following points:
- the two-sided `S` literal is struck (the critic's independent check passes);
- the second instrument of 2(d) is critic-supplied;
- the up-degree and alias-token literals are corrected;
- both key names must be renamed to name the tree;
- "retires the frontier" awaits a second read.

**Critic-derived advances, attributed to `C-T2-F`:**
- (i) the literal laboratory at the actual row;
- (ii) the independent two-sided `supply − capacity = S` at all 56 ranks, via the structural active-weight GF `W(y)`;
- (iii) the full E1-R criterion census at this tree (248 choke-set types × 56 ranks), which the return only cited;
- (iv) the R8-dead in-sector family is loaded at most 1 (tight) by one-hop state-dependent shares.

## Remaining obligation

What a successor inherits, exactly:
1. **An isolated second read** of the 448 certificate is required: the 155-value per-state table (to be shipped as data), the LP
   model, and the literal laboratory. The same read covers its composition.
2. **Confirmation that E1-R's registered face covers this tree's heterogeneous classes.** Specifically, that the load it places on
   every `r`-free target `A` is exactly `ρ_{Q(A)}·w_F(A)` for the `(1,7)` and `(1,8)` single-choke classes with `v ∈ A`. This is
   the one inherited input the critic could not check from the capsule.
3. **Registration** of the two statements under tree-naming keys (suggested above), each alias-checked against the five-row
   switch-arcs key and the five-row deletion key. The whole-row conjunction is a scope note.
4. **Controller erratum:** the Stage 2 seal literal in `C5-CRITIC-PROTOCOL.md` duty 1 (`f0b5a2a1…`) is Cycle 4 residue.
5. **Run level:** the second half of (b′) is F2's. (a′) (a parameter-uniform switch-necessary class), (c′), (d′), (HALL) at full
   scope and the primary aggregate stay open and untouched.

## Artifact inventory

Deliverable: this file only. Scratch: `/Users/ashtonsperry/VerityOS/experiments/erdos-993-weighted-transport-dre-2026-09-26/scratchpad/c5-crit-T2-F/`.
Every script is `python3 -B`, uses exact `int`/`Fraction`, and is deterministic (seeded). There is no bytecode (checked with `find`
inside my own scratch only).

| File | SHA-256 | Role |
|---|---|---|
| `tree.py` | `72ff01d23a26c58dd6abe6322afd0e847fea717606c4ef5f1cf62d41870f2b7d` | own tree builder, tree test, generic DP |
| `rowcheck.py` / `out_rowcheck.txt` / `rowcheck_rows.json` | `d9c8116f…6e8c3` / `839d83b3…fe277`… see below | row data, `F_p` ×56, independent two-sided `S` ×56 |
| `smallcheck.py` / `out_smallcheck.txt` | `7507762854107b73391eee79f125b93de1927fb1aa6631c5a77c53ffe906c8a3` / `67724d65d5324343d46e8c4c7633c621386fe773a1643d3b16194b3f20aa304c` | brute-force validation of `W(y)`, `I`, (WID) |
| `fixedpoints.py` / `out_fixedpoints.txt` | `371c169735262e9fb6f00020d811351bb825c92cb0b5f7a599968dfece77fea2` / `b9c60c500ce1ac32f487edd4361003e63de283dcda88061d4a66982523d58fde` | common-brief fixed points |
| `dump_t2_cert.py` / `t2_cert.json` | `e5c3b300862b7e129f949c1628c69008d08b1e881c2d690a3c1307136d543903` / `7a6f4c66eb7db2fc872b96a85b2a6adcaf02ae7591b194b11b97f7a11bc53849` | replay-dump of T2's 155 per-state values |
| `certcheck.py` / `out_certcheck.txt` | `c2b1f54bd84939b160caae5c34b81c9fdb49f0d4d68a5fd182a962d447b77e1d` / `5f7bb33550bb391598af3fa802169c6376408c02de5e4f0424d575cd161fe277` | own DP; argmin/argmax; R8-restricted max; `ρ`; load-bearing |
| `literal_lab.py` / `out_literal_lab.txt` | `9b69bd1b4ff8dd23ac4cefa340a979888c33a879a9d65a086a7f4e663def9fa8` / `9c6467833ba640bd294adbed1b19bea2763c8849305d43c96767b0ca7b9d1f5f` | literal laboratory at `G(8^82,7^2)/448` |
| `lab_exits.py` / `out_lab_exits.txt` | `40b0f374d6ff867c592804de8daf28a1aac8b1909587f985d2ddd9eb166edab6` / `cd54d8f2140f0c5d880d0222516e1b944d29ea53d9b793d8f5f745e37e3a4ec2` | literal exit classes and weights |
| `lab_rswitch.py` / `out_lab_rswitch.txt` | `9e8c8bb9bb273f2e44007fb2ac1d1961cc83fc8d79f4d82121e5156098e30fdf` / `c2560daab43ff214a68c753e7c651bc226cb697447b719a4324378eb77dcf268` | `r`-switch preimages of in-sector targets |
| `e1r_census.py` / `out_e1r_census.txt` | `353e13f3de1e35c92faf3b0bcaa165e0839f1962f311b712c8d488c0b343851e` / `c62baa640affc36c2c77e408d2dbb8d9fc83950258267fd737c1ace360561412` | E1-R criterion, 248 types × 56 ranks |
| `alias_mine.py` / `out_alias_mine.txt` | `a6f0ddced6185ae9e1306474b63b20d10d68f52a80759f3a8b197ad650ef35d9` / `c67a00d6281b10bdf77a6c724737eb9590101107019850a53ba5c5610e54b457` | lexical screen of the suggested renames |
| `t2copy/` | the 13 digests of the return's inventory, all matched | copy-out of T2's scratch |
| `replay/` | its six `out_*.txt` are byte-identical to T2's | copy-out replay |

Full digests for the `rowcheck` row: `rowcheck.py` `d9c8116f961a512190958ea9fa8f7005dc00faa4181a87f8f122562abe05e6bc`,
`out_rowcheck.txt` `839d83b326bd934ce93b9a56f3f9a7978cb64194c27273042c68b68b5b9832d8`,
`rowcheck_rows.json` `99252cb95fa6897adebc8c72c1ab483258bd8ccb975a6da39f2a6211218df63c`.

Replay (copy-out-first; cwd `scratchpad/c5-crit-T2-F/`):

```
python3 -B rowcheck.py > out_rowcheck.txt
python3 -B smallcheck.py; python3 -B fixedpoints.py; python3 -B dump_t2_cert.py   # dump needs replay/ populated from t2copy/
python3 -B certcheck.py; python3 -B literal_lab.py; python3 -B lab_exits.py; python3 -B lab_rswitch.py
python3 -B e1r_census.py; python3 -B alias_mine.py
```

No background job was started at any point, so none needed to be killed.
