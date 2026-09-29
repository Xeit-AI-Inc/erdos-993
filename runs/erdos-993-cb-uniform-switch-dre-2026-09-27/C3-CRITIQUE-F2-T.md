# Critique

**Critic:** `C-F2-T` (orientation T, prove), Cycle 3, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`).
**Target:** route return `F2` (`C3-F-02`, mechanism token `AT-RANK-COMPOSED-FLOW-ADVERSARY`, orientation F),
`cycles/cycle-3/stage3/returns/F2/RETURN.md`.
**Boot acknowledgment.** I am operating within VerityOS. Per the dispatch I read exactly
`/Users/ashtonsperry/VerityOS/verity.md` and `/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` and no other
VerityOS file. I loaded no memory, conversation, operations or writing subsystem. The work used only this experiment's
`control/` capsule members, `sources/` (authorized Stage 2 members) and my own scratch.
**Model disclosure:** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Identity and seal audit

- **Dispatch** `control/dispatch/c3-stage4/DISPATCH-C-F2-T.md`: SHA-256 `2f014e0c2b3a95c91650fa72404b3b73763a22d72e37054cd0d502420786cfa7`. MATCH.
- **Capsule** `control/c3-critic-capsules/F2-PACKET-MANIFEST.json`. I recomputed the inner seal as SHA-256 over compact
  key-sorted JSON without `seal_sha256` and with no trailing newline:
  **`d8eff376caef308b39e8fc7545da719a45b0c950f04ee5d57cedd676e265107b`. MATCH.** All 14 members match their
  recorded byte counts and SHA-256.
- **Stage 4 dispatch manifest** seal `cc9683b593e4bf84ab6164b5fe9abdd759e31c50937f74ab502258b3ec6c0c05`: MATCH.
  **Stage 3 packet manifest** seal `c40d4a97a7d8a0b486dc996f9d71318fec994dce2bfd211e43487d17f4c83f6d`: MATCH.
  **Stage 2 packet manifest** seal `f6b0f3fdcd29714e0cc3bbed2245deadff86197fa888215329393b8230fad2b3`: MATCH (5,049 members, as the return states).
- **Return** `RETURN.md` has SHA-256 `a31e7580a9e5ef3ca8efa9a976d2123f6bddec26e2a87c696887f5a9a2c6b654`. It matches both the capsule and the Stage 3 manifest.
- **Digests the return lists:**
  - The nine named source files (worker brief, both contracts, allocation, gate, ROUTE-STATE, master and run-local
    registries, OBLIGATIONS.csv) each match the Stage 2 manifest entry. I checked this against the manifest without
    opening the files outside my capsule.
  - `DISPATCH-F2.md` `26608d42…` matches the Stage 3 manifest entry.
  - The C1-LA1 `Main.lean` (`f0578ed7…`) matches the Stage 2 manifest.
  - The F2 artifacts under `scratchpad/c3-F2/` match their stated digests: `f2_lib.py` `ee1ed92f…`,
    `f2_composed_flow.py` `43025968…`, `f2_selftest.py` `d807ebc3…` and `f2_composed_flow_out.json` `240ca851…`.
  - My copy-out-first replay in `scratchpad/c3-crit-F2-T/replay/` reproduced the payload digest
    `e582834823aaf7870f7f2a8e837da0540f106525b30363433603f3cfc728b33f` byte-identically. The self-test printed
    `ALL MUTANTS DETECTED` (but see finding A5).
  - Not audited: the return names three source groups with no digest and I did not open them. They are SR-C2-5, the
    r30 instrument files and `c2-stage7-sources/F2`. The return says they were not used as evidence, and none of its
    numbers depends on them.
- **Registry keys touched (this critique):**
  - Tier 1 key `E993-R31-CB-8-M-AT-LEAST-107-…-LITERAL-NETWORK-SATISFIES-WEIGHTED-HALL`, at `proved_informal`, untouched.
  - The eligibility key (`formally_verified`, C2-LA1), untouched.
  - `E993-R30-CB-D-AT-LEAST-6-EVERY-LEAF-FAVORABLE-…`, at its grade.
  - `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (`proved_informal`, carried; its
    per-target loads are NOT re-derived here at arc level).
  - `E993-R30-CB-D-AT-LEAST-6-MARK-CLONE-CONDITION-I-HOLDS-…`, confirmed at bounded rows only.
  - `E993-R31-CB-8-TOP-RANK-CLOSED-FORM-SECTOR-ALLOCATION-…` (C1-LA1, `formally_verified` at template scope).
  - `E993-R30-ACTIVE-TAG-WEIGHT-AGGREGATE-IDENTITY`, used as the fidelity target.
  - `E993-TREE-REAL-ROOTED` (REFUTED, not revived).
  - `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` (OPEN, not touched).
- **Read-boundary disclosures (mine):**
  1. The harness injected the project `CLAUDE.md`, the user memory index and the user's e-mail address into context. I
     did not act on them. Their boot map and conversation-logging instructions were superseded by the dispatch's
     restricted boot.
  2. I read several authorized files inside `sources/`: `sources/r30/records/SEMANTIC-CONTRACT.md` (the inherited
     contract, for the literal `C5LA1.aggregate`, `q_v` and (WID)), the C1-LA1 `Main.lean` (the table and statement),
     and `sources/authority/CLAIM-IDENTITY.json` (the alias check). I also ran non-recursive `ls` on `sources/`,
     `sources/r30`, `sources/r30/records`, `sources/c1-results` and `…/runs`, and on the inventoried `scratchpad/c3-F2/`.
  3. **Incident.** While checking my own background jobs I ran `pgrep -fl "crit_"`. Its pattern also matched a SIBLING
     critic's running process (the `C-F2-U` scratch). The output printed that process's full command line, including
     part of its inline Python script. I did not use any of it. Everything reported below was computed or written
     before that output appeared: the row battery, the literal checks, `crit_hall.py` and Lemma HX's chain. After the
     incident I used only `ps -p <literal PID>`. I did not signal or touch the sibling process.
  4. I read no other return, critique, adjudication or experiment root. I used no network, no package install and no
     Lean. I killed no process, and every background job of mine had exited before the final write.

## Independent re-derivation

**Instruments (own code, standard library only, exact `int`/`Fraction`; none imports F2's code).** Files are in
`scratchpad/c3-crit-F2-T/`:
- `crit_lib.py` builds `CB(8,m)` under my own labelling, which differs from F2's. It provides:
  - a generic forest independence-polynomial DP;
  - a **literal-weight tree DP** that computes `Σ_{B∈I_k} w_F(B)` directly from the definition "tag `t ∈ F∩B` active
    iff `B` meets `N(s_t)∖{t}`". It tracks, at each support, how many of its children are in `B`, capped at 2, and
    whether the parent is in `B`. It uses no deletion identity;
  - my own port of `r_q` and `cb8R1`;
  - the C1-LA1 table, which I transcribed independently. It agrees with a programmatic parse of the Lean text (36 + 36
    + 7 cells) and with F2's `f2_lib` entry, all three identical.
- `crit_validate.py` compares both DPs with brute force on `CB(8,1)` (`n = 20`, all `2^20` masks) and on 40 random
  trees. Counts and weights agree, and (WID) equals the literal `C5LA1.aggregate` at every `p`.
- `crit_rows.py` is the row battery. `crit_classcheck.py` validates the r-free class-weight formula
  `W_q(k) = 8q·C(m,q)·r_q(k−q−1)` against the literal-weight DP at `m = 1, 2, 3, 5` and every `k`.
- `crit_literal.py` does literal (REL) arc enumeration from adjacency, with deletions and two-for-one switches, and
  literal predecessor enumeration for targets.
- `crit_rank.py` runs literal checks at rank `p*`. `crit_hall.py` computes whole-family Hall sums.

**Row battery.** The rows are the ruling-17 rows (fresh 125, 128, 140; controls 107 to 122). `x` is scanned through `α`.
The selector is `Δ_{p*}(T−t) = i_{p*+1} − i_{p*}` (ruling 16), with `t = v` and `c` at three positions (all equal; the
`c_ij` form one `Aut(T)`-orbit). **(WID) is asserted from genuinely independent sides:** the SOURCE side is
`Σ_{I_{p*+1}} w_F − Σ_{I_{p*}} w_F` from the literal-weight DP. The AGGREGATE side is
`Σ_{t∈F}[Δ_{p*−1}(T−H_t) − Δ_{p*−1}(T−R_t)]`, the literal definition, computed from deletion DPs.

| m | n | α | p* | x | elig ∧ desc(a) | F = leafSet @p* | digits of Δ_{p*}(T−v) | WID | S | digits S / supply | ρ_q ≤ 1 ∀q∈[1,m] | max_{q≥2} ρ_q | (1−ρ_1)/θ | min ΣOut / max ΣIn |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|107|1822|964|572|570|yes|yes|408|holds|<0|409 / 411|yes, ρ_1 max|0.993883|34.901|1 / 1|
|110|1873|991|588|586|yes|yes|419|holds|<0|420 / 422|yes, ρ_1 max|0.994049|35.877|1 / 1|
|113|1924|1018|604|602|yes|yes|431|holds|<0|432 / 434|yes, ρ_1 max|0.994207|36.854|1 / 1|
|116|1975|1045|620|618|yes|yes|442|holds|<0|443 / 445|yes, ρ_1 max|0.994356|37.831|1 / 1|
|119|2026|1072|636|634|yes|yes|454|holds|<0|455 / 457|yes, ρ_1 max|0.994498|38.807|1 / 1|
|122|2077|1099|652|650|yes|yes|465|holds|<0|466 / 468|yes, ρ_1 max|0.994633|39.784|1 / 1|
|125|2128|1126|668|666|yes|yes|477|holds|<0|478 / 480|yes, ρ_1 max|0.994762|40.760|1 / 1|
|128|2179|1153|684|682|yes|yes|488|holds|<0|489 / 491|yes, ρ_1 max|0.994884|41.737|1 / 1|
|140|2383|1261|748|746|yes|yes|534|holds|<0|535 / 537|yes, ρ_1 max|0.995322|45.643|1 / 1|
|302 (light)|5137|2719|1612|1608|yes|yes|1155|holds|<0|1157 / 1159|yes, ρ_1 max|0.997829|98.378|not run (C1-LA1 formal)|

Agreement with F2 and with the contract:
- At all nine rows my `S` and `supply` strings hash identically to F2's JSON values (e.g. `m=107`: `S` `cb941a35…`,
  supply `494eba71…`; `m=140`: `47ce0a11…`, `2471ec93…`).
- `θ(m)` and `ρ_1(m)` are equal to F2's literals at every row.
- The contract's §5 fixed points at `m = 107` are reproduced: `n = 1822`, `α = 964`, `x = 570`, `θ = 96/766193` and
  margin `34.90`.

Extra checks at every row:
- Cell nonnegativity of `pb`, `pc` and `σ` holds, as do Switch and Residual.
- An exact state-level DP over the 45 choke states gives `min ΣOut = 1` at leg total `K` and `max ΣIn = 1` at `K−1`.
- `supply = R_K + Σ_q W_q(p*+1)` and `capacity = R_{K−1} + Σ_q W_q(p*)` hold exactly against the literal-weight DP.

**Literal network vs template (fence 4).** F2 did not check this. My checks:
- **(D) Exhaustive.** Every sector source and every in-sector target was checked on literal `CB(8,2)` at `K = 3, 4`
  and on `CB(8,3)` at `K = 3`, together with every one-choke `v`-containing target with `γ = 0..8`. The table
  arithmetic used is `m_tab = 107`. Counts: 4480/480/536, 29120/4480/3696 and 16192/1104/2292. On every one:
  - each source's literal outflow over all its (REL) arcs equals `Σ_i cb8Out(β_i,γ_i)`;
  - every positive-value arc lands on a target of literal weight 1 (in-sector) or `γ` (switch image);
  - each in-sector target's literal unscaled inflow equals `Σ_i cb8In(β_i,γ_i)`;
  - each image has exactly `8−γ` sector preimages and unscaled inflow `(8−γ)σ(γ)`;
  - `γ ∈ {0, 8}` targets receive 0.
- **(C) At rank `p*`** on literal `CB(8,m)`, `m = 125, 128, 140`. Per row I used 21 sources, including the exact
  argmin-Out source (literal outflow exactly 1), and 8 in-sector targets:
  - the argmax-In profile (unscaled 1; scaled inflow 0.99991 / 0.99987 / 0.99986);
  - F2's named `(1,4)^{(2m+2)/3}(1,5)^{(m−2)/3}` target, whose **literal scaled inflow is exactly 1**. Every predecessor
    of it has `Out = 1`, so the non-strict tightness is realized literally at the fresh rows;
  - 6 random targets.
  Per row I also used 8 one-choke `v`-targets (`γ = 1..8`). These had the preimage counts `7,6,…,1,0`. The scaled
  sector inflow plus the carried E1 load `ρ_1γ` is at most `0.99635γ`, `0.99643γ` and `0.99673γ` respectively. Each
  image also has 12 to 26 positive-weight NON-sector two-for-one predecessors, which carry 0 because E1 is deletion-only.
- **Proof paragraph (routine, restated for the record).** Take a sector source `B` (with `r, v ∈ B`, so `s` and every
  `u_i` are absent).
  - Its (S) pivots are `s` (with `N(s) = {r,v}`) and exactly the `u_i` whose choke has one `b`. The vertices `b_ij`
    (with `u_i ∉ B`), `c` and `v` cannot pivot.
  - Its (D) arcs are the deletions of `r`, `v` and the legs.
  - The template puts `pb` or `pc` on leg deletions and `σ(γ_i)` on the `u_i`-switch, which gives `ΣOut`.
  - An in-sector target receives template flow only from `A + (one leg element)`. A non-sector predecessor of it is a
    two-choke `r`-switch preimage, which is E1-free. Summing over its `8−β−γ` empty legs per choke gives `cb8In`.
  - An image `{v, u_i, γ c's, …}` has sector preimages exactly `A − u_i + r + b_ij` over its `8−γ` empty legs at choke
    `i`. Its literal weight is `γ`.
  Hence, given the carried E1 key and C1-LA1 (formal), Out ≥ 1, In ≤ 1 and `θ ≤ 1−ρ_1` give a saturating rational flow
  (the registered composition). The exhaustive and at-rank checks above back this bridge at bounded scope. It is
  T3/U1's formal object.

**Whole-family sums (the step F2 left open; `crit_hall.py`, exact).**
- `X1 = Sec` (all `R_K` sector sources). `N(X1)` is exactly the in-sector layer, the images with `γ = 1..7`, and
  weight-0 targets. Hall surplus factor `W_img·K/R_{K−1}` = 9481 (107), 12934 (125), 13562 (128), 16221 (140).
  - **Composition-level residual:** `(1−ρ_1)·W_img·K/R_{K−1}` = 41.46, 48.43, 49.59, 54.24.
  - Whole-family adjoint identity: `Σ_{B∈Sec} Σ_i (β pb + γ pc) = Σ_{A} Σ_i In(A)` holds **exactly** at all nine rows.
  - The template uses 0.8758 of its total switch capacity `Σ_img (8−γ)σ(γ)` at the whole-family level. This is
    `(R_K − ΣIn)/swCap`, nearly constant from 0.87585 at 107 to 0.87576 at 140.
- `X2 = Sec ∪ P_1`, with `P_1` the r-free one-choke sources. This mixes sector and E1 sources that compete for the
  one-choke capacity. The surplus factor `8m(r_1(K−1)−r_1(K))·K/R_{K−1}` = 125.2 (107), 146.3 (125), 149.8 (128),
  163.9 (140), 353.5 (302) and 585.3 (500).

## Attacks and findings

**No cut, no template failure and no numerical error in any flow-relevant quantity.** All of F2's numbers that I could
re-derive agree exactly. The following findings concern what the return certifies, not the values.

- **A1 (fidelity, ruling 18; certification struck and re-established).**
  - F2's "(WID) … from three independent sides" is not what was done. `S := supply − capacity`, and all three "sides"
    compute the aggregate half: the `q_t` by the `H_t/R_t` inclusion–exclusion (as a DP, as a closed form, and as the
    `r_q` sum). None computes `Σ_B w_F(B)` over literal sets from the source side.
  - This is exactly the "S as its own definition" pattern ruling 18 forbids. The attack brief's question ("(WID) against
    the aggregate from an independent side?") is answered **no**.
  - I supply the missing side: a literal-weight DP, validated against brute force. (WID) holds at all ten rows. No
    downstream number changes.
- **A2 (overclaim: "end-to-end composed flow").** No flow was constructed.
  - F2 never built E1's arc values or computed any target's literal inflow.
  - It covered none of the target classes the allocation names beyond template inequalities: in-sector, images,
    one-choke non-images, `q ≥ 2`, and weight 0. It computed no row sums of non-sector sources and no Hall sum over any
    `X` (the return concedes this in its remaining obligation 2).
  - "Every switch-image's combined load is at most its capacity" is the per-`γ` template inequality
    `ρ_1γ + (8−γ)σ(γ) ≤ γ`. It is valid only through the literal accounting (`8−γ` preimages), which F2 did not verify.
  - The record is a **template-plus-aggregate bounded battery**. I supplied the literal bridge (exhaustive and at rank),
    `ρ_q ≤ 1` for every `q` (covering the `q ≥ 2` and non-image one-choke classes), and whole-family sums.
  - The E1 per-target load `ρ_q·w_F(A)` remains CARRIED from the criterion key at `proved_informal`. Neither F2 nor I
    verified it at arc level. The only check is the whole-family identity `W_q(p*+1) = ρ_q·W_q(p*)` per class, which is
    definitional.
- **A3 (wrong literals in the results table).**
  - The column "Δ_v(digits) 21d/22d" is false. `Δ_{p*}(T−v)` has 408 to 534 digits (F2's own JSON: 409 to 535
    characters with the sign).
  - The column "S digits 411…537" is actually the digit count of `supply`. `S` has 409 to 535 digits.
  - Both are struck.
- **A4 (nonnegativity).** "The C1-LA1 allocation is nonnegative" was checked by F2's driver only as `Out, In ≥ 0`. It
  never checked that the individual arc values `pb`, `pc` and `σ` are nonnegative, which a flow needs. The fact is true:
  it is formal in C1-LA1, and I verified it at every row. F2's certification of it is struck.
- **A5 (mutant self-test is not a liveness test of the driver).** Mutants 1 to 4 recompute an inequality inside
  `f2_selftest.py` on hand-mutated constants. They never run `f2_composed_flow.py`'s checks, and mutant 4 is an
  arithmetic tautology. Only mutant 5 exercises a DP-vs-closed-form comparison. "Confirming the checks in
  `f2_composed_flow.py` are live" is struck.
- **A6 (instrument independence, per the attack brief).**
  - The two `I(T)` sides share only elementary polynomial helpers, and the generic DP has no closed-form code.
    Acceptable.
  - Favorability and `8m·q_c` rest on `c_00` alone, with an unstated `Aut(T)`-transitivity on the `c_ij`. The
    transitivity is true (permute chokes, and legs within a choke), and I spot-checked three positions.
  - The C1-LA1 table was entered faithfully: 79/79 cells match the Lean source.
- **A7 (wording).**
  - "S < 0 … the deficit the switch mechanism exists to repair" inverts the meaning. `S < 0` is aggregate SURPLUS of
    capacity. The sector's local shortfall is `R_K − R_{K−1} = R_{K−1}/K`.
  - Remaining-obligation item 2 proposes "X = the full set of weight-γ switch images". Images are targets in `I_{p*}`,
    not sources, so this is a category error. The intended test is `X = Sec`, done above.
- **A8 (scope and fences).**
  - The rows are in the class and include the endpoint 107.
  - The fresh rows precede any universal claim, and F2 makes none.
  - Darroch and Newton are not used, and the index of record is `p*`.
  - Not verified by me (outside my capsule): the claims that rows 116, 119, 122 and 140 receive their "first end-to-end
    pass in this run", and the claimed verbatim agreement with SR-C2-5. Neither is certified here.

**Critic-derived advance (attributed to `C-F2-T`; STATED at review stage; `proved_informal` pending an isolated second
read).**

> **Lemma HX (whole-family Hall at sector ∪ one-choke).**
>
> **Setting.** Let `m ≥ 107` with `m ≡ 2 (mod 3)`, `T = CB(8,m)`, `p = p*`, `K = p−1 = (16m+1)/3`, and
> `F = leafSet(T) = F_{p*}(T)` (the favorability key and graph-level favorability). Let `Sec` be as above, let
> `P_1 := {B ∈ I_{p+1} : r ∉ B, |B ∩ {u_i}| = 1}`, and let `X := Sec ∪ P_1`.
>
> **Statement.** `Σ_{N(X)} w_F − Σ_X w_F ≥ 8m(r_1(K−1) − r_1(K)) − R_{K−1}/K > 0`, where `r_1 = cb8R1 m` and
> `R_j = 2^j C(8m,j)`. The surplus is at least `2.51·R_{K−1}/K`.
>
> **Proof.**
> 1. `Sec` and `P_1` are disjoint. Every sector member has weight 1. A `P_1` member with choke `u_i` has weight equal
>    to its number of `c_i·` (`v` and every other `c` are inactive). Hence `Σ_X w = R_K + 8m·r_1(K)`: the one-choke
>    generating function is `8m·x²(1+x)^7(1+2x)^{8m−7}`, validated in `crit_classcheck.py`.
> 2. `N(X)` contains every in-sector `p`-set: add a `c` at an empty leg, which is possible since `K−1 < 8m`.
>    `N(X)` also contains every positive-weight r-free one-choke `p`-set: add an absent `c_i·`, or, if all 8 are present,
>    a `c` at an empty leg of another choke, which exists since `p < 8(m−1)`. These families are disjoint, so
>    `Σ_{N(X)} w ≥ R_{K−1} + 8m·r_1(K−1)`.
> 3. `R_K/R_{K−1} = 2(8m−K+1)/K = (K+1)/K`, so `R_K − R_{K−1} = R_{K−1}/K`. It remains to show
>    `R_{K−1} ≤ 8mK·(1−ρ_1)·r_1(K−1)` with `ρ_1 = r_1(K)/r_1(K−1)`.
> 4. By C1-LA1 (formal, Residual), `1−ρ_1 ≥ θ = 288/(200m²+82m+5)`.
> 5. **Stochastic-order bound.** Put `k = K−1` and `N = 8m−7`. By Vandermonde,
>    `r_1(k)/R_k = Σ_i a_i 2^{−i} / Σ_i a_i` with `a_i = C(7,i)·C(N,k−i)`, `0 ≤ i ≤ 7`. Also
>    `a_{i+1}/a_i = ((7−i)/(i+1))·λ_i` with `λ_i = (k−i)/(N−k+i+1)`, which is decreasing in `i`, so `λ_i ≤ λ_0`.
>    Therefore `a_i/(C(7,i)λ_0^i)` is nonincreasing, and `a` is below `Binomial(7, q)` in likelihood-ratio order, where
>    `q = λ_0/(1+λ_0) = (16m−2)/(24m−18)`. Since `2^{−i}` is decreasing,
>    `r_1(k)/R_k ≥ (1−q/2)^7 ≥ (113/170)^7`, because `q` decreases to 2/3 and `q(107) = 57/85`. No real-rootedness,
>    Newton or Darroch is used.
> 6. Combining, `8mKθ(113/170)^7 = 768m(16m+1)(113/170)^7/(200m²+82m+5)`. This is increasing in `m`: the numerator
>    of the derivative is `1112m²+160m+5 > 0`. It is `≥ 3.511` at `m = 107`. ∎
>
> **Inputs.** C1-LA1 (formal), favorability (at its grade), and literal counting. **It does not use the E1 criterion
> key.** Explicit `M_0 = 107` with no asymptotic step. Exact spot checks: every class row `107 ≤ m ≤ 1100` satisfies
> steps 5 and 6 and the exact surplus (`crit_hall.py`).
>
> **What it is.** A NECESSARY-condition Hall inequality at one structured family, uniform on the class. It is not a
> step toward conjunct 4 and not a proof of (HALL).
>
> **Alias check.** Lexical: master registry (491 keys), no `STRUCTURED-X`, `SECTOR-PLUS`, `ONE-CHOKE` or `R31-C3-F2`
> tokens. Mathematical: distinct from `E993-R30-CB-FAMILY-WHOSE-ROOT-FREE-MEMBERS-…`, whose reduction applies only when
> every r-free member contains `v`, or every one contains `s`. `P_1` contains members of both kinds and members with
> neither. It is also distinct from `E993-R30-CBSTAR-SECTOR-DELETION-DEFICIT-EXACT`, which covers deletion-only sector
> subfamilies.

Corollary (composition level; from C1-LA1 and the bridge above):
`R_K − R_{K−1} ≤ Σ_img (8−γ)σ(γ) ≤ θ·W_img ≤ (1−ρ_1)·W_img`. So the whole-family residual on `X1` holds on the class
whenever the literal bridge holds. The bridge is proved informally above and is not yet formal.

## Mechanism-equivalence and fence check

- One rank (`p*`) per tree, and the class only. Row `m = 302` is an in-class larger row. Nothing is said at other ranks,
  other residues or `d ≠ 8`.
- No refuted mechanism: not G′, and no real-rootedness of `I`, `G`, `G^m` or a forest polynomial. Lemma HX's step 5 is
  a likelihood-ratio comparison of explicit binomial weights, not Newton or Darroch.
- The `θ*` law is never a hypothesis. `θ(m)` enters only as C1-LA1's governed table, whose feasibility is formal.
- Census values are never proof. Every row statement here is `bounded_computation`, and Lemma HX's row sweep is a spot
  check of a written proof.
- No status transfer: FLOW⇒SIGN is not invoked for any aggregate key. Consistently with (WID) and C5LA1, `S < 0` on
  these rows is reported as a fact at bounded grade.
- F2's route is an adversary of the composition, not a new mechanism. Its fingerprint token is present and verbatim.

## Certification audit

| Literal in the return | Status |
|---|---|
| Stage 2 seal match; F2 artifact digests; replay payload digest `e5828348…` | **backed** (recomputed; replayed) |
| tree, `I(T)` DP = closed form, `x` through `α`, eligibility, descent (a), at nine rows | **backed** (independent DP) |
| favorability at `p*` (ruling 16), both classes | **backed** (plus three `c` positions) |
| "(WID) … from three independent sides" / "supply − capacity = S asserted independently" | **struck** (A1); the fact is re-established by this critic |
| "S digits 411…537", "Δ_v(digits) 21d/22d" | **struck** (A3); true values 409–535 and 408–534 |
| "the C1-LA1 allocation is nonnegative" | **struck as F2's certification** (A4); true (C1-LA1 formal; critic-checked) |
| Switch, Residual, `min ΣOut = 1`, `max ΣIn = 1` at nine rows | **backed** (own state-level DP) |
| named in-sector profile sums to exactly 1 | **backed**, and strengthened: the literal scaled inflow is exactly 1 at 125/128/140 |
| "every switch-image's combined load ≤ capacity" | **narrowed** to the template inequality plus carried E1 load; literally sampled by the critic |
| "end-to-end composed flow … on the literal network" | **struck** (A2); a template-plus-aggregate battery |
| "five-mutant … confirms the checks are live" | **struck** (A5) |
| rows 116/119/122/140 "first end-to-end pass"; SR-C2-5 verbatim agreement | **not audited** (outside capsule) |
| `headline_resolved: no`; the gate lines | **backed** |

## Verdict

verdict: retained_narrowed
headline_resolved: no
COND4_formal: not_advanced
E1_formal: not_advanced
TERMINAL_integration: not_advanced
cut_candidate: none

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Narrowed record (if the synthesis registers F2's proposal).** The retitle should drop "COMPOSED-FLOW", for example
`R31-C3-F2-CB8-107-TO-140-TEMPLATE-AND-AGGREGATE-BATTERY`, at `bounded_computation`. At the nine rows it records:
- eligibility and descent (a);
- `F_{p*} = leafSet` at `p*`;
- the aggregate `S(T,p*) < 0`, three ways;
- C1-LA1 Switch, Residual, `min ΣOut = 1` and `max ΣIn = 1`;
- the named profile's `ΣIn = 1`.

(WID) and the literal sector bridge belong on the face only as this critic's contribution. No E1 arc-level content.

The mathematics of Lemma HX is complete in my reading, but it was stated at a review stage and needs an isolated second
read (`proved_informal` once confirmed). It does not affect the headline.

## Remaining obligation

1. **Conjunct 4, formal.** The saturating flow on the literal `cbGraph m` at `p*` is still not in Lean. This is
   U1/U2/T3's object. Its informal composition requires:
   - (a) E1's per-target loads `ρ_q·w_F(A)` at arc level. These are carried from the `proved_informal` criterion key and
     were verified at arc level by neither F2 nor this critic.
   - (b) the literal sector bridge written above. It is proved informally and backed exhaustively at small `m′` and by
     sampling at rank `p*` for `m = 125, 128, 140`, but it is not formal.
2. **Lemma HX.** An isolated second read of steps 1 to 6, especially step 2's reachability and step 5's order argument,
   before any registration. It is a necessary-condition inequality only.
3. **F2's `X`-structured Hall program.** It is closed at three families (`Sec`, `Sec ∪ P_1`, and the whole-network
   `X = I_{p+1}` via `S < 0`) at bounded rows, and uniformly for `Sec ∪ P_1`. An adversarial `X` mixing `Sec` with
   `q ≥ 2` E1 sources remains untested; the `q ≥ 2` classes have `ρ_q ≤ 0.9954 < ρ_1` at these rows.

## Artifact inventory

All files are in `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c3-crit-F2-T/`.

| File | SHA-256 |
|---|---|
| `crit_lib.py` | `5fa1d720462d405a80b1b4a99dc8f4859620c1a630409d2a20aff4b4e925e79d` |
| `crit_validate.py` | `da8a776f4ed55fe7be919618ea0d00fad622a21b962d4581d398112ab28966e6` |
| `crit_rows.py` | `8f77062afb5a81ecdd4a062bbeff0ca5f8bc6ceb635d8e96c700487e2cf4afa2` |
| `crit_classcheck.py` | `1298983e750be1994d5ef9617bbc322c42873229763ccbe64739153b3920c302` |
| `crit_literal.py` | `64875c74a22a963654b8a559baf8d46a0f36f8b6046d3d210713cd012785bc80` |
| `crit_rank.py` | `81a420551794d1d5f0ceb3cc8a4a83af1d7a575889bb765403909ff041daf243` |
| `crit_hall.py` | `78039f7de3c3eb08aa8e36e8f1a103eece7337115bff73f52821e0c642fe6f6c` |
| `rows_out.jsonl` (nine rows) | `d21c68340489aed6efb75a8296020d53972b328d1372752ef68dd3627d56ecd3` |
| `rows302_out.jsonl` (`m = 302`, light) | `295ab9c0023b3a48bd27a9312aabc6bc56d770b169a94c113ea655488d261c22` |
| `literal_exhaustive_out.json` | `c3acb15ecc6a398ec8dd08978c21aa41b842f1635b3d1ce37bf3dbd41cc239c5` |
| `rank_out.jsonl` (`m = 125, 128, 140`) | `cda70eef4ac9b4421b397d519eec2590167776d09a90c21c0d6da675a1a16f4c` |
| `hall_out.txt` | `ef732a67e620edc7f298d662ea60b12a7e591f6120517423a3ad580f7a130ea5` |

Notes on the files:
- The `crit_rows.py` digest is of the version after I added `--light`. The nine-row run executed the version before
  that edit, whose full path is identical.
- `replay/` holds byte copies of F2's three scripts, with the replayed output reproducing payload `e5828348…`.

Replay: `cd` into the directory above and run `python3 -B crit_validate.py`, `crit_classcheck.py`,
`crit_rows.py 107 110 113 116 119 122 125 128 140`, `crit_rows.py --light 302`, `crit_literal.py`,
`crit_rank.py <m> 20 6 8 <m>` for `m ∈ {125, 128, 140}`, and `crit_hall.py`. Every background job had exited before
this file was written.
