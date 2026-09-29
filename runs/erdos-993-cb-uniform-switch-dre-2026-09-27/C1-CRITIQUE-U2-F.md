# Critique

Critic `C-U2-F` (orientation F, falsify) of seat U2's return, route `C1-U-02`, token `SECTOR-CERTIFICATE-COMPOSITION-REDUCTION`,
Cycle 1 Stage 4, r31 (`erdos-993-math-dre-20260927-r31-cb-uniform-switch`). Date 2026-09-27.

**Model disclosure (two-part):** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Boot.** I am working inside VerityOS. I read `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md` in full and no other VerityOS file. There was one ordering fault. A zsh
`echo =====` error aborted the first combined read, so I read `startup-protocol.md`, and the part of `verity.md` that the tool
output had truncated, only after I had read the control files. I made no judgement before the boot was complete.

**Read-boundary disclosures.**

1. I printed the whole of `control/C1-CRITIC-ATTACK-BRIEFS.md`, which is a capsule member, with `cat`. So I saw the sections for
   the other seats as well as U2's. I used nothing from them.
2. I ran non-recursive `ls -la` on the return's own artifact directory `scratchpad/c1-U2/`, its `LeanProject/` and its
   `LeanProject/.lake/`. I ran `test -d` on `scratchpad/c1-U2-replay`, which only checks that it exists; I did not list or read it.
3. Everything else I read was a capsule member or sat under `sources/`. That covers `sources/authority/CLAIM-IDENTITY.json`, the
   r30 Lean `Main.lean` files and `Snippets/`, and lines 70–82 and 112–122 of
   `sources/r30/records/cycles__cycle-6__stage3__returns__T2__RETURN.md`. I ran `grep -rn` rooted only at `sources/`, and a
   per-directory `grep -c` inside `sources/r30/lean/`.
4. I read `lean-toolchain` of the shared pinned Mathlib project (`/Users/ashtonsperry/.local/share/verityos/lean/mathlib-v4.32.2-project/`)
   to confirm the pin `v4.32.2`.
5. The harness injected the user's `CLAUDE.md` and memory index into my context. I did not fetch them and did not use them.
6. I did not replay `alias_check.py`, because it reads `control/CLAIM-IDENTITY.run-local.json`, which is not a capsule member. My
   own alias check ran against the frozen `sources/authority/CLAIM-IDENTITY.json` instead.

I made no network access, installed nothing and did no process listing. Every job ran in the foreground, and none is left running.

## Identity and seal audit

- Dispatch `control/dispatch/c1-stage4/DISPATCH-C-U2-F.md`: SHA-256 `1fde9a4f62675ece0f2df90aaba706b2a08cf01a60394fcb550d21aafc06cda7`, matches.
- **Capsule seal** `control/c1-critic-capsules/U2-PACKET-MANIFEST.json`, recomputed over compact key-sorted JSON without
  `seal_sha256`: `6fa04f8d2556d315e479b92c3e45acc7fdb4994ee6dee280a636b3e16b823058`, matches. All 14 members match their `sha256` and
  `bytes`.
- Stage 2 seal: `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`, matches. Stage 3 seal:
  `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`, matches. Stage 4 dispatch seal:
  `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`, matches.
- The return file `cycles/cycle-1/stage3/returns/U2/RETURN.md` has SHA-256 `5d7f812e…6f06d9`. That equals its entries in both the
  Stage 3 manifest and the capsule.
- Digests the return lists, recomputed on copy-outs in `scratchpad/c1-crit-U2-F/replay/`:
  - `verify_stage2_seal.py` `f524d478…`, `alias_check.py` `cf921b80…`, `compose_check.py` `773e40d3…`: all match.
  - `LeanProof.lean` `7898640e…def7d7` and `carried_prefix.lean` `408d99e2…c2ba`: both match. Lines 1–382 of `LeanProof.lean` are
    byte-identical to `carried_prefix.lean`.
  - C1-LA1 `Main.lean` `86b59c6c…e0cb`: matches.
  - Replaying `compose_check.py` reproduces the report digest `904a9474…26c2`. Replaying `verify_stage2_seal.py` reproduces the
    Stage 2 seal.

## Independent re-derivation

I built my own instrument (`scratchpad/c1-crit-U2-F/own/cblit.py`, standard library, exact integers and `Fraction`). It is a
generic literal network, not code taken from the return:

- my own CB(d,m) labelling;
- leaves and supports taken from graph degrees;
- the literal active-tag weight;
- the literal (D) ∪ (S) relation for arcs out of a set, and a full literal preimage enumerator.

On top of it I built the per-choke-state rule. The template values `pb`, `pc`, σ are **random positive rationals**, not an LP
optimum. Generic values mean an equality between a literal load and its per-state formula is a real identity check, not a
coincidence.

**The per-state reduction, written out.** The return never writes In; this is my derivation.

- Take a sector source B with choke states `(β_i, γ_i)`. Its literal outflow is
  `Out(B) = Σ_i [β_i·pb(β_i,γ_i) + γ_i·pc(β_i,γ_i) + 1{β_i = 1, γ_i ≥ 1}·σ(γ_i)]`.
- Its literal arcs are:
  - p+1 deletions;
  - one switch per choke in state `(1, ·)`;
  - one switch at `s`, since `N(s) ∩ B = {r, v}`.
- The rule puts 0 on four kinds of arc: `B∖{r}`, `B∖{v}`, the `s`-switch and every `(1,0)` switch. Each of these lands on a
  weight-0 target.
- An in-sector target A (with `r, v` and K−1 legs) has two kinds of preimage:
  - its sector preimages are exactly `A ∪ {b_ij}` and `A ∪ {c_ij}` over its empty legs;
  - its only non-sector preimages are r-switches from r-free sets. The deletion-only E1 flow leaves those arcs empty.
- So the literal inflow is `In(A) = Σ_i (d − β_i − γ_i)·(pb(β_i+1, γ_i) + pc(β_i, γ_i+1))`.
- A switch image of weight γ has exactly **d − γ** sector preimages. Each is in state `(1, γ)` and switches at the same `u_i`. So its
  sector load is `(d − γ)·σ(γ)`.
- r-free targets with two or more chokes have no sector preimage.

**Exhaustive literal audit** (`own/exhaustive.py`, report `own/exhaustive.json`, SHA-256 `c6742ad5…f5a0`). Instances: CB(2,4),
CB(3,3), CB(4,2), CB(5,2), CB(8,1), CB(6,2) and CB(2,5), at **every** rank with a nonempty sector (72 rank rows). On each I
enumerated every independent set. The enumeration equals my generic DP polynomial, two instruments. Checks run on each row:

- the tree test, `n` and `α = m(d+1)+1`;
- `F_p` derived literally;
- (WID) `supply − capacity = S(T,p)` from independent sides, meaning direct enumeration against the aggregate over `T − H_v` and
  `T − R_v`, for both the derived selector and `F = leafSet`;
- Lemma 0 (the weight dichotomy) on every set of both layers;
- the arc census of every sector source;
- `Out(B)` literal equal to the formula;
- every in-sector target's literal inflow equal to `In(A)`;
- every switch image: exactly d − γ sector preimages, all switches at `u_i` in state `(1, γ)`, load `(d − γ)σ(γ)`, weight γ;
- every other target: sector load 0, and no sector preimage when it has two or more chokes.

Coverage: 192,062 switch images and 681,481 in-sector targets across the instances. There were **0 failures**.

**Fresh-row literal laboratory** (`own/freshrow.py`, at `(CB(8,m), p*)` with m = 107 as the control row, 110 and 113). Fidelity
comes first:

- the literal tree;
- `I(T)` by generic DP;
- `x` computed through rank α;
- `F_{p*}` derived leaf by leaf, all `8m+1` leaves, by a generic root-split DP. I checked that DP against the full DP;
- (WID) from independent sides. Side A is my structural generating function built from Lemma 0,
  `[y^j](y²(1+2y)^{8m} + 8m·y²(1+2y)(1+y)^7·G^{m−1})`. Side B is the literal aggregate from the DP on `T − H_v` and `T − R_v`.

| row | n | α | p* | x | p* − x | F_{p*} | (WID) | parent descent | ρ_1 (exact) | 1 − ρ_1 |
|---|---|---|---|---|---|---|---|---|---|---|
| 107 (control) | 1822 | 964 | 572 | 570 | 2 | all 857 leaves | equal | true | 5150844596024699/5173467627355748 | ≈ 0.0043729 |
| 110 | 1873 | 991 | 588 | 586 | 2 | all 881 leaves | equal | true | 2027991913051965/2036655530990516 | ≈ 0.0042538 |
| 113 | 1924 | 1018 | 604 | 602 | 2 | all 905 leaves | equal | true | 27820794945950193/27936482886870172 | ≈ 0.0041411 |

The control row reproduces the fixed points: `n = 1822`, `α = 964`, `x = 570`, and `(1 − ρ_1)/(96/766193) ≈ 34.90`.

The sampled laboratory then runs per row:

- 180 sector sources: 120 uniform, plus 60 adversarial with switch-heavy, full-choke and mixed states including `(1,0)`;
- about 110,000 literal arcs;
- 400 in-sector targets;
- 360 switch images, spread over γ = 1..7;
- 16 r-free one-choke, two-choke, three-choke and Res targets.

It checked the same identities as the exhaustive audit, and 0 of them failed. Report SHA-256 by row:

- 107: `308d39a7…767b`;
- 110: `4e0d2a25…6d9e`;
- 113: `cf41c0c4…372c`.

These are `bounded_computation` for the reduction's per-state identities at those rows. They are not a proof, and not a statement
about any other m.

**Lean.** I rebuilt the return's project copy-out-first. Mathlib is bound by a manual symlink of `.lake/packages`, I ran `cd` into
the project before `lake build LeanProof`, and I used neither `lake update` nor `lake clean`. Results:

- `Build completed successfully (8656 jobs)`, with long-line linter warnings only;
- no `sorry`, `admit` or `native_decide`;
- `#print axioms E993Transport.weightedHall_of_saturatingFlowQ` gives `[propext, Classical.choice, Quot.sound]`;
- all 21 carried entries are byte-identical to `sources/r30/lean/…c1-la1…/Snippets/0001–0021`, and each BEGIN-line hash equals the
  hash of its snippet.

## Attacks and findings

**F1 (the strongest; a false step in the proof, repairable).** Lemma 3 says the switch image's sector load is at most θ·γ because
"only the single sector source that performed this exact switch contributes". That is false. A switch image of weight γ has
exactly **d − γ** sector preimages. The contract says so (`SEMANTIC-CONTRACT.md` §2), and my exhaustive and fresh-row audits
confirm it literally.

The load is `(d − γ)·σ(γ)`. It is at most θγ precisely because the Switch constraint (H2) carries the factor `(d − γ)`. The
conclusion survives, but the stated reason would license the weaker constraint `σ(γ) ≤ θγ`, and that weaker constraint is not
sufficient. Required repair: Lemma 3 should read "Σ_B π_B(A) = (d − γ)σ(γ) ≤ θγ".

**F2 (the per-state reduction is not written out).** The allocation's load-bearing demand was "the per-state reduction … written
out". The return never gives the per-state In formula or the in-sector preimage structure. It also does not list the sector arcs
that carry 0: the s-switch and the (1,0) switches are both literal (S) arcs from every sector source, and neither is named. Lemmas
1 and 2 cite H2 "instantiated at the realized multiset" without saying which function is being instantiated. The derivation in
the previous section supplies the missing text; the return needs it on its face.

**F3 (hypotheses).** Three problems with how the hypotheses are named:

- The theorem cites only E1's condition (i). E1's criterion is (i) **and** (ii). Condition (ii) holds identically by the
  registered scope note CD-2 [r30 C4; SR-C4-6], which is `proved_informal`. That dependency must be named.
- E1's registered hypothesis is `F ⊇ C`. The lemma assumes `F = leafSet`, which is stronger and harmless. But the favorability
  that the r31 row needs is `F_{p*} = leafSet`, and that comes from the favorability key, `proved_informal` modulo Darroch/Newton.
- In H2, the Out/In aggregation is defined as "the exact DP of `inherited/certify.py`", which is a script. As a mathematical
  hypothesis it should read: "for every assignment of states `(β_i, γ_i)` with `β_i + γ_i ≤ d` and `Σ(β_i + γ_i) = K` (sources),
  respectively `K − 1` (targets)".

**F4 (the claimed exactness).** "Reduces (H) **exactly** to (L-S)_top ∧ E1(i) ∧ favorability" overstates the result. The lemma is
a sufficient condition in one direction only. It also covers only the choke-local template form of (L-S)_top, not "any other"
allocation proved against the literal network (`SEMANTIC-CONTRACT.md` §2).

**F5 (the sanity instance is vacuous for the switch half).** In the replayed `compose_check.py` report, `theta = "0"` at
CB(8,1)/7. The sector there is not deficient: `R_6 = R_5 = 1792`. So every σ is 0, and `every_switch_image_within_theta…=True`
holds vacuously. The Residual inequality `ρ_1 + θ ≤ 1` is never exercised, and there is no switch load to check at all. The
return's statement that the check confirms "the `ρ_1+θ≤1` arithmetic execute[s] correctly" is not backed. The instance also
asserts no (WID) and computes no `x`. My audits with random positive σ do exercise the switch loads.

**F6 (provenance errors on the Lean face).** Two statements are wrong:

- The return says `exists_saturatingFlow_of_weightedHall` is "entry 31 of the Main.lean digest-verified above", meaning C1-LA1.
- The Lean comment says `weightedHall_of_saturatingFlow` is "VERITYOS ENTRY 33 of this same award, carried above".

In fact both are C1-LA2 entries (31 and 33). Neither is in C1-LA1, and neither is in the carried prefix, which holds entries 1–21
only. There is a second gap behind this. C1-LA2's definition texts for entries 14–21 differ from C1-LA1's: they use
`open scoped Classical` and carry no docstrings, where C1-LA1 has freeze repair 3. `exists_saturatingFlow_of_weightedHall` exists
only in C1-LA2. So the return's final step, "hence an integral flow", was never compiled against the definitions it carries. (The
next section reports my closure of this gap.)

**F7 (scope of the Lean claim).** The compiled lemma is only the generic engine: a nonnegative ℚ-flow that saturates the sources
within capacity implies `WeightedHall`. It has no CB content, and the per-state inequalities are not its hypotheses, although the
dispatch asked for a draft with them as hypotheses. r30 named this exact principle as "B7 / AG-U-B7 /
`weightedHall_of_saturatingFlowQ`" and called it "an elementary fact … not a seat-graded claim" (the frozen r30 C6 T2 record,
lines 112–118). It is a useful carry, not new mathematics.

**F8 (the process-listing incident).** Nothing in the return depends on another seat's content:

- the composition is the contract's own template argument;
- the Lean lemma is the r30-named B7 principle;
- the one instance used the frozen reference solver, and that solver returned θ = 0.

I find no sign that anything the host-wide `ps aux` exposed was used. The incident itself stays a disclosure.

**Checked without finding a fault.**

- Lemma 0's weight dichotomy (`W_v = {r}`, `W_{c_ij} = {u_i}`).
- The case analysis over the target classes (in-sector, Res, switch image, other r-free), with in-sector targets getting 0 from E1
  because E1 is deletion-only.
- The switch-image E1 load `ρ_1·γ`: switch images have exactly one choke. This is verified literally, and E1's registered text
  loads q-choke targets at exactly `ρ_q·w_F(A)`.
- The inequality direction `(ρ_1 + θ)γ ≤ γ`.
- No ℕ-subtraction anywhere.
- No Newton or Darroch anywhere.
- Scaling is correct, but it is **dispensable**. The Lean engine only needs weak saturation (`hsat: w ≤ Σ f`), and In and Switch
  already bound the unscaled loads.

## Mechanism-equivalence and fence check

- **Alias check (mine, against the frozen 491-claim registry).** No exact key or alias match, and no `alias_patterns` hit. The
  closest lexical neighbours are the two mark-clone criterion keys, at Jaccard 0.368 and 0.350; the return disclosed both.
- **Mathematical proximity the return missed.** The certificate paragraph of
  `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS` contains this
  exact composition argument, and so does the corresponding `…CB-7-M-109-TO-121…` key (both `computer_assisted`). Those texts give
  the same four target classes and end "The sum of (i) and (ii) is the required flow". U2's lemma is that row argument stated once
  with the row data turned into hypotheses. Registration must cite it as that extraction, not as a new mechanism.
- **Key naming.** Key names are predicates. The candidate name leaves out the Residual condition and the CB/`p*` scope. I suggest
  a predicate form such as
  `E993-R31-CB8-TOP-RANK-MARK-CLONE-CRITERION-AND-CHOKE-LOCAL-SECTOR-ALLOCATION-WITH-SWITCH-RESIDUAL-CAPACITY-IMPLY-WEIGHTED-HALL`.
  This is a suggestion, not a ruling.
- **Fences.**
  - One rank, class only (§3.1; gate ruling 5): the theorem is stated for arbitrary `CB(d,m)` and arbitrary `p`. Under ruling 5 the
    registered claim is struck to `(CB(8,m), p*(m))`, `m ≥ 107`, `m ≡ 2 (mod 3)`. The general proof text can stay as its proof. The
    generic Lean engine is a tool lemma with no family claim.
  - No refuted mechanism is revived.
  - No status transfers to (HALL) or to the aggregate; the return keeps (HALL) OPEN.
  - Census data is not used as proof. The m = 1 instance is labelled a sanity check.
  - The θ* law is not used as a hypothesis.
  - Darroch/Newton hygiene: neither is used.

## Certification audit

- **"Grade: `formally_verified`" for `weightedHall_of_saturatingFlowQ`: STRUCK.** A compiled scratch declaration has no grade until
  its governed award closes (`SOLUTION-CONTRACT.md` §4). What the evidence backs is: compiled sorry-free in scratch, three standard
  axioms, rebuilt by this critic.
- **"Grade: `proved`" and "Route verdict: `proved`": STRUCK.** `proved` is not a grade on the §4 ladder, and a statement first made
  at a review stage is STATED. The most it can be is a `proved_informal` candidate, after F1–F4 are repaired and an isolated
  second read is done. As a composition it is conditional on E1 (`proved_informal`) and on favorability (`proved_informal` modulo
  Darroch/Newton).
- **"unconditional as an implication": NARROWED.** It is conditional on E1's (ii) being identical (CD-2), which has to be named.
- **"exactly reduces": STRUCK** to "sufficiently reduces, for the choke-local template form" (F4).
- **"verified … ρ_1+θ≤1 arithmetic executes": STRUCK** (F5; θ = 0).
- **"entry 31 of the Main.lean digest-verified above" and "VERITYOS ENTRY 33 of this same award, carried above": STRUCK** as
  provenance errors (F6).
- **Stand as backed:** the build line, the absence of `sorry`, the axioms output, every listed digest, and the replay digest
  `904a9474…`. I reproduced all of them.

**Critic-derived advances (mine, C-U2-F; scratch only, no grade).**

1. **The integral-flow step compiled over the carried definitions.** `scratchpad/c1-crit-U2-F/replay/LeanProject/CriticChain.lean`
   (SHA-256 `8ae3b353…e5`) imports the return's `LeanProof` (C1-LA1 entries 1–21 plus the Q-engine). It then carries C1-LA2
   entries 30 (`card_sigma_fiber_filter`) and 31 (`exists_saturatingFlow_of_weightedHall`); both are byte-identical to C1-LA2's
   `Snippets/0030` and `0031`. It proves
   `exists_saturatingFlow_of_saturatingFlowQ : (the four ℚ-flow hypotheses) → ∃ g, IsSaturatingFlow G F p g`.
   - `lake env lean` exits 0 with no errors, and there is no `sorry`, `admit` or `native_decide`;
   - both theorems depend only on `[propext, Classical.choice, Quot.sound]`.

   This closes F6's gap. The C1-LA2 lemma elaborates against the C1-LA1-text definitions, so the chain from ℚ-flow to integral
   `IsSaturatingFlow` needed by the Tier 1 terminal shape now compiles in one file.
2. **The per-state reduction, written out and checked literally.** The In formula, the d − γ multiplicity and the census of zero
   arcs are in the re-derivation section. Checked exhaustively on 7 small instances at every rank, and on sampled literal
   laboratories at the fresh rows 110 and 113 with fidelity asserted first. This is the non-degenerate literal check the return
   left open (its obligation 3).

## Verdict

The composition reduction is mathematically correct at the class. It is correct only after four repairs: the multiplicity in
Lemma 3 (F1), the per-state In formula written on the face (F2), E1's condition (ii)/CD-2 named as a dependency (F3), and
"exactly" weakened to "sufficient, for the template form" (F4). With those repairs, and scoped by ruling 5 to
`(CB(8,m), p*(m))`, `m ≥ 107`, `m ≡ 2 (mod 3)`, I judge the mathematics complete as a conditional lemma. Its grade would be
`proved_informal`, conditional on E1 (`proved_informal`), CD-2 and favorability (`proved_informal` modulo Darroch/Newton), and
it still needs an isolated second read. The Lean engine is the r30-named B7 principle, compiled in scratch with no grade. The
return's grade labels, its "exactly", its m = 1 switch-arithmetic claim and its entry provenance are struck.

verdict: retained_narrowed
headline_resolved: no

LS_top: not_advanced
ELIG_top: not_advanced
cut_candidate: none

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

## Remaining obligation

1. **Repair the proof text.**
   - Lemma 3: sector load `= (d − γ)σ(γ) ≤ θγ`.
   - Write the per-state Out and In formulas and the sector-arc census on the face. That covers the p+1 deletions, the switches of
     the (1,γ) chokes, the s-switch, and the zero-valued arcs `B∖{r}`, `B∖{v}`, the s-switch and the (1,0) switches.
   - Add E1(ii)/CD-2 to the hypotheses.
   - Restate H2 as a quantified inequality over state assignments, not as a script's DP.
2. **Rescope the candidate statement** to the class (ruling 5). Re-alias it mathematically against the certificate paragraphs of
   the r30 row keys, and rename it as a predicate that includes the Residual condition. Grade: a `proved_informal` candidate
   pending an isolated second read.
3. **Lean.** Carry `CriticChain.lean`'s composition (C1-LA2 entries 30–31 byte-identical) into the award draft. Then state and
   compile the CB instantiation over U1's `cbGraph`: define `f := e ⊕ π` and discharge `hsupp`, `hsat` and `hcap` from the
   per-state inequalities as hypotheses. Nothing mathematical in that step is open; it is still uncompiled.
4. **Unchanged, and not this seat's:** (L-S)_top itself (a uniform allocation with Out/In/Switch/Residual for every m in the class)
   and (ELIG-top)(a) beyond `m = 2395`. At the fresh rows, my instrument only reconfirms `x = p* − 2`, `F_{p*} = leafSet`,
   (WID) and the parent descent, as `bounded_computation`.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-U2-F/` (SHA-256):

**My instruments and reports**

- `own/cblit.py` `c54da7650460abd64e874c34c1430214d75e791cbb008595cecc9cc0337f994d`: literal network library and generic DPs.
- `own/exhaustive.py` `86ead32e30b87b27b6fd1fddd2ff5776950758b6e8b4153ae1307092da00504c`. Produces `own/exhaustive.json`
  `c6742ad53d9b443bb4597bf3e29c6e0dc55a6dca4bc6aa7d02cfe965d5dcf5a0`. Replay: `cd own && python3 -B exhaustive.py`, about 3 min.
- `own/freshrow.py` `a370350afd46bbfe9b92bb877326623ec732046122097a19a0ca8c81b97bd67e`. Replay: `python3 -B freshrow.py <m> <m>`,
  about 4 min per row. Outputs:
  - `own/freshrow_107.json` `308d39a7ef34bca973561c97df2d119f845098c66234dc13f971110fb985767b`
  - `own/freshrow_110.json` `4e0d2a250dc1422605c5ea1b4b1aad17d4677eb0fbaf59b8388c5f4049a36d9e`
  - `own/freshrow_113.json` `cf41c0c402694c568725e44b9183f523bd50c15e9371ecc1f5beaae16dd7372c`
  - `own/freshrow_5.json` `93c9626a6b28e879269a3d0bfda61e9db999eeb26d445589a3b8334572eb76ea`: smoke test only, not eligible.
- `own/alias.py` `08d4818dcbe7b06b02d4882a502924d64ea969d287819adb7467ae5a7edfa789`: alias check against the frozen registry.
- `bytecmp.py` `fb04808df0cd579650a3ca44975be0bbb92e7d4b4412af8ecdae2bafec505127`: carried-entry byte comparison, and the
  C1-LA1 against C1-LA2 comparison of declaration text.

**Replay of the return, copied out first**

- `replay/`: the return's scripts and Lean project. `.lake/packages` is a manual symlink to the shared pinned Mathlib.
- `replay/compose_check.replay.out` `5b7e28d6af52876c69fc385fd9720446f5e844d1c7b010003025b1d7d72ca88b`: reproduces report
  digest `904a9474…26c2`.

**Lean (critic-derived)**

- `replay/LeanProject/CriticChain.lean` `8ae3b353aef1e33ff447cd00461d4688972728810904e0586d537b80acbc33e5`. Run from inside
  `replay/LeanProject/`: `lake env lean CriticChain.lean`. Log: `criticchain.log`
  `fa933003fad0e94040eafade2920aae634b3c780dc5ff1e8ce0ffd7e56f0aff1`.

No background job was started. Every computation ran in the foreground to completion.
