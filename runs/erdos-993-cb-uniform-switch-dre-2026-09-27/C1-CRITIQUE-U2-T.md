# Critique

Critic `C-U2-T` (orientation T, prove), r31 Cycle 1 Stage 4, on seat `U2`, route `C1-U-02`, mechanism token
`SECTOR-CERTIFICATE-COMPOSITION-REDUCTION` (orientation U). Date 2026-09-27.

**Boot.** I am operating within VerityOS. I read exactly `/Users/ashtonsperry/VerityOS/verity.md` and
`/Users/ashtonsperry/VerityOS/identity/startup-protocol.md`, and no other VerityOS file.

**Model disclosure (two-part).** chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Read-boundary disclosures.** (1) The harness put the project `CLAUDE.md` and the user's auto-memory index into my context at
session start. I did not fetch them, use them, or follow `CLAUDE.md`'s conversation-logging step, because the dispatch limits my writes
to this file and my scratch. (2) I read these files under `sources/`, all authorized: `authority/CLAIM-IDENTITY.json` (for the
alias check and the E1-R and row-key faces), five `r30/lean/*/…/Main.lean` files (for the carry audit), the `inherited/` template
`localflow.py`/`certify.py`, and lines 70–125 of `r30/records/cycles__cycle-6__stage3__returns__T2__RETURN.md` (to check the return's
"B7" citation). (3) I ran `grep -rn`/`grep -c` only inside `sources/` (this is within the grant), plus one non-recursive `ls` of the
return's own scratch `scratchpad/c1-U2/` and its `LeanProject/` (inventoried artifacts). (4) U2's `alias_check.py` reads
`control/CLAIM-IDENTITY.run-local.json`, which my capsule does not include. I did not read that file. I replayed the script against
the frozen `sources/authority/CLAIM-IDENTITY.json` instead: I copied it, changed only the path with `sed`, and saved the copy as
`alias_check_frozen.py`. (5) I made no network use, installed nothing, started no background job, and ran no host-wide process
listing. The one liveness check was a name-scoped `pgrep -f c1-crit-U2-T`, and it found nothing.

## Identity and seal audit

- **Dispatch file.** SHA-256 of `control/dispatch/c1-stage4/DISPATCH-C-U2-T.md` =
  `8d9f4b2b77eca1392e8d47ea7044733e2cac5d88ba022cc0ecfe3410d04eb58d`. Matches.
- **Capsule seal** (`control/c1-critic-capsules/U2-PACKET-MANIFEST.json`, canonical JSON without `seal_sha256`, sort_keys,
  `(",",":")`, no trailing newline): recomputed `6fa04f8d2556d315e479b92c3e45acc7fdb4994ee6dee280a636b3e16b823058`. **Matches.**
  All 14 member files match their recorded SHA-256 and byte counts. That includes the return
  (`5d7f812e…f06d9`, 33,586 bytes) and `sources/SOURCE-DIGESTS.json`.
- **Stage 4 dispatch manifest seal:** recomputed `86453c5c1eae81d5c1a8cf4759bcec530ccf1ca6a47c1b693d35dce430a2587b`. Matches the
  claimed value.
- **Stage 3 packet manifest seal:** recomputed `e6cb664700e162e9356e287fbb38b19efd372ada36a974e52815cd411e292a37`. Matches.
- **Stage 2 seal:** recomputed `e747e52e59f1298619dae3a23b3426b0efdde770595a1414f09dd5c66eef3dbc`. Matches both the charter value and
  the return. U2's own `verify_stage2_seal.py` (`f524d478…3f7f06`, matches) gives the same result in my replay.
- **Digests the return lists, re-checked by me:**
  - Carried C1-LA1 `Main.lean`: `86b59c6c…e0cb`. Matches, and matches `SOURCE-DIGESTS.json`.
  - Carried prefix, lines 1–382: `408d99e2…4c2ba`. Matches, and is byte-identical to `sed -n 1,382p` of that source.
  - U2 `LeanProof.lean`: `7898640e…7d7`. Matches, and starts byte-for-byte with the prefix.
  - Scripts: `compose_check.py` `773e40d3…3f96`, `alias_check.py` `cf921b80…db6a`. Both match.
  - `compose_check` report digest: `904a9474…326c2`. Reproduced by replay.
  - Alias report digest: `a474b50c…7f5f41`. Reproduced against the frozen registry, which is consistent with the run-local
    registry being a byte copy.
  - Frozen `localflow.py`, `simplex.py`, `certify.py` and the C1-LA2 `Main.lean`: I digest-checked each against
    `SOURCE-DIGESTS.json` before use. All match.
- **Seat identity:** the route ID, the mechanism token, the two-part disclosure ("chartered sonnet/high … `claude-sonnet-5`") and the
  gate lines are all present.
- **Process incident.** The seat reported running `ps aux | grep python3`. My judgment: nothing it saw was used. Everything the return
  claims is self-contained. Every number in it that I could re-derive came out the same from my own instrument (below). No generator
  in `scratchpad/c1-U2/` contains sibling-specific content. The incident is a process breach, correctly self-reported. It does not
  bear on the evidence.

## Independent re-derivation

**Instrument.** I wrote `scratchpad/c1-crit-U2-T/own/reduction_lab.py` (SHA-256 `adbf6cec…c86b3e`). It uses only the standard
library and exact `Fraction`s, and it imports no U2 or r30 code. It builds `CB(d,m)` from `SEMANTIC-CONTRACT.md` §2 and asserts that
the result is a tree. It derives `leafSet`, the supports, the tag witnesses (checking `W_v = {r}` and `W_{c_ij} = {u_i}`) and the
active-tag weight directly from their definitions, with `F = leafSet`. For every sector source `B` it enumerates all literal
(D) ∪ (S) arcs. It draws `pb`, `pc` and `σ` as **random positive rationals**, because the per-state reduction is an identity in
these parameters and needs no feasible template. It then checks:

- **(O)** Each source's literal outflow equals `Σ_i Out(β_i,γ_i)`, where `Out = β·pb + γ·pc + [β=1, γ≥1]·σ(γ)`.
- **(I)** For **every** in-sector target, enumerated directly (including zero-inflow ones), the inflow equals `Σ_i In(β_i,γ_i)`,
  where `In = (d−β−γ)(pb(β+1,γ) + pc(β,γ+1))`.
- **(W)** Every positive-flow target is either (a) in-sector with weight 1, or (b) `r`-free with **exactly one** choke (so `q = 1`,
  and E1 loads it at `ρ_1·γ`), weight `γ`, inflow `(d−γ)·σ(γ)` and **exactly `d − γ` sector preimages**. Conversely, every
  `r`-free, one-choke, `v`-containing `p`-set with `1 ≤ γ ≤ d−1` c-legs and no b-leg at its choke is such an image.
- **(Z)** The only literal sector arcs carrying 0 are: delete `r`, delete `v`, switch at `s`, and switch at `u_i` in state `(1,0)`.

**Result** (`reduction_lab.out.txt`, SHA-256 `289eb6b6…ea3ff`; report digest `28abd5cb…1f540`). There were **0 failures on 11
instances**: `(d,m,p)` = (2,4,6), (3,3,6), (3,4,7), (4,2,8), (4,3,7), (5,2,8), (6,2,9), (8,1,7), (8,1,9), (8,2,6), (8,3,5). The largest
are `CB(8,2)/6` (139,776 sector sources, 15,372 switch images) and `CB(8,3)/5` (170,016 sources). Each switch image's
(γ, number of preimages) pair is always `(γ, d−γ)`. For example, `CB(8,2)/6` gives {(1,7), (2,6), (3,5), (4,4)} and `CB(6,2)/9` gives
{(1,5), …, (5,1)}. This is `bounded_computation` and only a sanity check. It is not the proof.

**Proof, re-derived.** This is my own statement and proof. It corrects and completes U2's Lemmas 2 and 3.

- **Lemma 0 (weight dichotomy), confirmed.** `W_v = {r}` and `W_{c_ij} = {u_i}`.
  - If `r ∈ S`, independence excludes every `u_i`, so `w(S) = [v ∈ S]`.
  - If `r ∉ S`, then `w(S) = #{c_ij ∈ S : u_i ∈ S}`.
  - This uses `v ∈ F` (sector weight 1) and `C ⊆ F` (switch-image weight `γ`, and E1-R's hypothesis). Both come from
    `F_{p*} = leafSet`, which is the favorability key.
- **Out (per-state), confirmed.** The positive arcs of a sector source are the leg deletions and the `u_i`-switches at chokes in
  state `(1, γ≥1)`. All of them have distinct targets, so the total is `Σ_i Out(β_i,γ_i)`. Hence `O(B) ≥ min over all splittings of K ≥ 1`.
- **In (per-state): U2 asserts this without writing it out, so I supply it.**
  - Let `A ∈ Sec(p)`. A positive sector arc into `A` has to be a deletion `B = A ∪ {x}` with `x ∉ {r, v}`. A switch image is
    `r`-free, and deleting `r` or `v` cannot land in `Sec`.
  - `x` must be non-adjacent to `A`. Since `s ~ r`, `s` is excluded; since `u_i ~ r`, every `u_i` is excluded. So `x` is `b_ij` or
    `c_ij` at a leg `j` that is empty in `A`.
  - Choke `i` of `B` is then in state `(β_i+1, γ_i)` or `(β_i, γ_i+1)`, and the arc carries `pb(β_i+1,γ_i)` or `pc(β_i,γ_i+1)`.
  - There are `d − β_i − γ_i` empty legs at choke `i`, so the inflow is exactly `Σ_i In(β_i,γ_i)`, which is at most 1 by (H2)'s max-DP.
  - `A` receives 0 from E1. `A` contains `r`, E1 is deletion-only, and the key's face says every other target gets 0. (`A` does have
    `r`-free (S)-preimages through the switch at `r`, but those arcs carry 0.)
- **Switch (per-state): U2's Lemma 3 is wrong as written, and this is the corrected version.**
  - Let `A = (B ∖ {r, b_ij}) ∪ {u_i}` for a source whose choke `i` is in state `(1, γ)`, `1 ≤ γ ≤ d−1`. Then `A` is `r`-free, has
    `u_i` as its only choke and has no b-leg there, so `w(A) = γ`.
  - A positive sector arc into `A` has to be an (S) arc inserting `u_i`. Deletions keep `r` or keep no choke. Inserting `s` would
    need `s ∈ A`, which is impossible because `v ∈ A`.
  - Its source is `(A ∖ {u_i}) ∪ {r, b_ij'}` for some `j'` that is empty in `A`. There are exactly **`d − γ`** such sources, each in
    state `(1, γ)` at choke `i`, each carrying `σ(γ)`.
  - So the sector load is `(d−γ)·σ(γ) ≤ θγ`, which is exactly the Switch constraint. E1 adds `ρ_1·γ`, because the key's face gives
    `ρ_q·w_F(A)` with `q = 1`. The total is at most `γ` when `θ ≤ 1 − ρ_1`.
- **Every other target class, confirmed.** A two-or-more-choke target, a one-choke target not reached by a switch (`s ∈ A`, or
  `γ = 8`, or v-free), or a weight-zero target gets 0 from the sector. It gets `ρ_q·w(A) ≤ w(A)` (or 0) from E1, since condition
  (i) gives `ρ_q ≤ 1`. `Res(p)` gets 0 from both.
- **Scaling.** `π'_B = π_B / O(B)` with `O(B) ≥ 1`. This only lowers loads. **Integrality** follows by the ℚ-flow ⇒ Hall ⇒ ℕ-flow
  chain; see my compiled corollary below.

**Lean rebuild (copy-out-first).** I rebuilt `scratchpad/c1-crit-U2-T/replay/LeanProject`. Mathlib is bound by a manual `.lake/packages`
symlink, the manifest is byte-identical to the shared pinned project, and the toolchain is `v4.32.2`. I `cd`'d into the project before
running `lake`, and ran no `lake update` and no `lake clean`. `lake build LeanProof` → `Build completed successfully (8656 jobs)`, with
only line-length lints. `#print axioms E993Transport.weightedHall_of_saturatingFlowQ` →
`[propext, Classical.choice, Quot.sound]`. `grep sorry|admit|native_decide` finds nothing. I read the statement against the carried
`WeightedHall`/`transportRel`/`activeWeight` (entries 14–21, C1-LA1 freeze-repair-3 text). It is the correct generic
"nonnegative ℚ-flow, row sums ≥ supply, column sums ≤ capacity ⇒ `WeightedHall`". No hypothesis encodes the conclusion. It is
**generic**: it says nothing about CB, the sector or E1.

## Attacks and findings

1. **Lemma 3's justification is false (load-bearing for anyone building on it).** U2 writes: "only the single sector source that
   performed this exact switch contributes, by construction of π_B". In fact a switch image of weight `γ` has **`d − γ` sector
   preimages**. My proof above shows this, and my lab confirms it on every image at 11 instances, for example seven preimages at
   `γ = 1`, `d = 8`. U2's conclusion `Σ_B π_B(A) ≤ θγ` still holds, but only because the certificate's Switch constraint
   `(8−γ)σ(γ) ≤ θγ` already prices in `8 − γ` preimages. The argument as written would license the weaker `σ(γ) ≤ θγ`, which
   overloads switch images by a factor of up to 7. **Struck and replaced** by Lemma 3′ above. The attack brief names exactly this
   check ("sector switch images have exactly `8 − γ` sector preimages").
2. **The per-state reduction is not written out for In.** The allocation requires the reduction "written out". U2's Lemma 2 only
   cites "H2's In, aggregated over A's realized choke-state multiset" and never shows that the literal inflow equals
   `Σ_i In(β_i,γ_i)`. That missing step is the preimage bijection. I supplied it (Lemma 2′, above) and checked it literally on every
   in-sector target of all 11 instances.
3. **The hypotheses are misstated or incomplete.**
   - (H1) is phrased as "valid whenever E1's condition (i) holds at every `q`". The registered E1-R criterion is (i) **and** (ii),
     the type-path inequalities, at every `q ∈ [1, m]`, with `C ⊆ F`. Condition (ii) holds identically only by the key's scope note
     `[r30 C4; SR-C4-6]`, and that note must be cited.
   - The exact reduction is therefore: (H) at `(T_m, p*)` ⇐ [`F_{p*} = leafSet` (favorability key)] ∧ [E1-R criterion (i) and (ii)
     at every `q`, through the E1-R key at `proved_informal`] ∧ [(L-S)_top verified by the exact DP].
   - U2's sentence "reduces (H) **exactly** to (L-S)_top ∧ E1(i) ∧ favorability" drops (ii) and hides the E1-R key's grade. It is
     narrowed to the corrected form.
4. **Scope breach (gate ruling 5; SOLUTION-CONTRACT §3.1).** The theorem is stated for every `CB(d,m)` and every rank `p`. Ruling 5
   strikes anything beyond `(CB(8,m), p*(m))`, `m ≥ 107`, `m ≡ 2 (mod 3)`. The mathematics does hold for general `(d, m, p)`, and my
   lab exercises other `d`. But the **claim** is narrowed to the class. The generic Lean engine is a tool, not a CB claim, so the
   fence does not reach it.
5. **The ℕ-flow step is mis-cited and was not compiled.**
   - The return cites `exists_saturatingFlow_of_weightedHall` as "entry 31 of the Main.lean digest-verified above" (C1-LA1,
     `86b59c6c…`), and the new block's comment calls `weightedHall_of_saturatingFlow` "ENTRY 33 of this same award, carried above".
     **Both are false.**
   - C1-LA1 has 36 entries. Its entry 31 is `activeWeight_eq_draftText`, and neither flow lemma is in that file.
   - Both flow lemmas are in **C1-LA2**'s `Main.lean` as entries 31 and 33. That file uses differently wrapped definition entries
     (`open scoped Classical`, entry hashes `44216498…` and so on).
   - Nothing in U2's scratch composes the ℚ engine with the integral-flow lemma. The step to "`∃ g, IsSaturatingFlow`" exists only
     in prose.
   - The later awards C4-LA1, C5-LA1 and C6-LA2 carry the C1-LA1 definitions but **not** `exists_saturatingFlow_of_weightedHall`.
     I grepped all five r30 `Main.lean` files: it appears only in C1-LA2.
   - These citations are struck. Finding 5 is repaired formally by my advance, below.
6. **The claim that the check "is only checkable literally in this degenerate corner" is false.** U2 says no literal check at `m ≥ 2`,
   `d ≥ 6` is possible. That holds only for its search, which required a jointly *feasible* instance. The reduction identities are
   hypothesis-free, so they can be checked at any `(d, m, p)` with arbitrary parameters. My lab does this at `d = 8`, `m = 2, 3`.
   Struck.
7. **Fidelity.** The objects match the contract's literal ones: the active-tag weight from the carried definition, the literal
   (D) ∪ (S), and `F = leafSet`, which is the derived `F_{p*}` by the favorability key's grade and not re-derived here. The route
   reports no network numbers, so the `supply − capacity = S` and `x`-through-`α` checks do not apply. The route asserts no (WID)
   instance, and I strike nothing on that ground.
8. **No asymptotics, no Newton or Darroch, no ℕ-subtraction, and no residue or endpoint dependence.** The lemma is algebraic and
   works one rank at a time. Nothing in it depends on `m = 107` or on the residue class. There is no circularity: (H1) and (H2) are
   hypotheses, and neither is derived from (HALL).
9. **Grades.** The return's labels "**proved**" for the composition theorem and route, and "**formally_verified**" for the scratch
   lemma, violate SOLUTION-CONTRACT §4: `proved` is not a grade, and a scratch compile has no grade. Both are struck; see the
   certification audit.

## Mechanism-equivalence and fence check

- **Registry keys touched:**
  - (HALL) `E993-LOWER-REGION-TWO-FOR-ONE-WEIGHTED-HALL` is OPEN, and the return leaves it untouched.
  - The primary aggregate is OPEN and untouched.
  - `E993-R30-CB-MARK-CLONE-CRITERION-IMPLIES-NON-SECTOR-DELETION-WEIGHTED-HALL` (proved_informal) is used at its face content, with
    the finding-3 repair.
  - The favorability and threshold keys are cited at their grades.
  - `E993-R30-TRANSPORT-WEIGHTED-HALL-IMPLIES-NONPOSITIVE-AGGREGATE` is cited through its companion, subject to the finding-5
    repair.
  - `E993-TREE-REAL-ROOTED` stays REFUTED and is not used.
- **Alias check of the candidate
  `E993-R31-SECTOR-CERTIFICATE-COMPOSITION-REDUCES-WEIGHTED-HALL-TO-SECTOR-ALLOCATION-AND-MARK-CLONE-CRITERION`.**
  - Lexically, I reproduced U2's report: there is no key match and no alias-pattern hit against the 491 frozen claims.
  - **Mathematically, U2 missed an overlap.** The *composition argument itself* is already on the faces of the registered row keys:
    - `E993-R30-CB-8-M-95-TO-107-CONGRUENT-2-MOD-3-RANK-16M-PLUS-4-OVER-3-WEIGHTED-HALL-WITH-LOAD-BEARING-SWITCH-ARCS`, whose
      certificate items (i)–(iii) include "in-sector targets receive 0 from (i) … targets with two or more chokes receive no sector
      flow".
    - Its scope says: "the certificate's Out, In and switch-load functions are exactly the literal network's restricted to the
      sector (structural argument on the face of SR-C6-2 and C-T2-U)".
    - `E993-R30-FIVE-CB-FIRST-ELIGIBLE-RANKS-…-SWITCH-ARCS` carries the same argument.
  - It is not an alias. Those keys are finite row certificates at `computer_assisted`, and the candidate is a parametric implication
    over the class. But it is the **row-free lifting of an r30 argument**, so attribution must travel with it (§3.9):
    - the structural fidelity argument and the corrected composition direction belong to r30 C-T2-U, C-T2-F and T2;
    - the ℚ-flow principle's name "B7 / AG-U-B7 / `weightedHall_of_saturatingFlowQ`" comes from r30 Cycle 4's synthesis (cited
      in the frozen r30 C6 T2 return, line 116);
    - U2 contributes the uniform statement and the Lean text of the engine;
    - I contribute the corrected Lemma 3′, the written-out Lemma 2′, and the compiled integral-flow corollary.
- **Fences.**
  - One rank per tree: yes, `p` is fixed throughout. Class only: no, repaired by narrowing (finding 4).
  - No refuted mechanism is revived. The flow runs on literal arcs with the literal weight and the fixed selector. It does not use
    per-leaf injectivity, own-support unit capacity or occupancy domination.
  - No status transfer to any aggregate. No census value is used as proof. The `θ*` law is never used. The r30 bounded record is
    never used.
  - SOLUTION-CONTRACT §2 funds "the sector-certificate composition lemma … over the carried network definitions". It is an allowed
    intermediate, not "an already-known identity substituted for the missing uniform result". It advances neither (L-S)_top nor
    (ELIG-top)(a).

## Certification audit

| Literal on the return's face | Evidence | Ruling |
|---|---|---|
| "Grade: `formally_verified`" (`weightedHall_of_saturatingFlowQ`) | Scratch compile, reproduced | **Struck.** The compile is real, sorry-free and uses the 3 standard axioms, but a scratch compile has **no grade** until a governed award closes (§4) |
| "Grade: `proved`" and the route-level label `proved` | — | **Struck.** Not a grade. The mathematics, as I have corrected it, is `proved_informal`, still STATED and awaiting an isolated second read, and narrowed to the class |
| "reduces (H) **exactly** to (L-S)_top ∧ E1(i) ∧ favorability" | Criterion (ii) and E1-R's grade omitted | **Narrowed** (finding 3) |
| "only the single sector source … contributes" | Refuted literally (`d − γ` preimages) | **Struck**, replaced by Lemma 3′ |
| "`exists_saturatingFlow_of_weightedHall` … entry 31 of the Main.lean digest-verified above"; "ENTRY 33 of this same award, carried above" | C1-LA1 has neither | **Struck** (C1-LA2 entries 31 and 33) |
| "carried byte-identically … lines 1–382", prefix `408d99e2…` | Byte-compared | **Backed** |
| "Build completed successfully (8656 jobs)", zero `sorry`, axioms `[propext, Classical.choice, Quot.sound]` | Rebuilt | **Backed** (the build facts only; no grade) |
| `compose_check` report `904a9474…`, all flags True, "`bounded_computation`" | Replayed | **Backed** as one degenerate-instance sanity check |
| "only checkable literally in this degenerate corner" | Contradicted by my lab | **Struck** |
| Alias report `a474b50c…` | Replayed (frozen registry) | **Backed** lexically. The mathematical overlap was not disclosed (fence section) |

## Verdict

The composition reduction is mathematically sound, but only once it is repaired. The Lemma 3 reasoning is wrong, the In reduction
is missing, the criterion's condition (ii) is dropped, and the scope reaches past the class. With my Lemmas 2′ and 3′ and the
corrected hypotheses, I believe the implication's mathematics is complete: (H) holds at `(CB(8,m), p*(m))` given
`F_{p*} = leafSet`, the E1-R criterion (i) and (ii) at every `q`, and a per-state allocation satisfying Out/In/Switch/Residual by
the exact DP. Its grade is **`proved_informal`**, a STATED claim that needs an isolated second read. Any use of it inherits
E1-R's `proved_informal` and the favorability key's Darroch/Newton dependency. The Lean engine is compiled scratch with no grade.

verdict: retained_narrowed
headline_resolved: no

`LS_top: not_advanced`
`ELIG_top: not_advanced`
`cut_candidate: none`

chartered opus/medium; transport-resolved model opus (explicit parameter); runtime-reported model id: claude-opus-5-5

**Critic-derived advances (attributed to C-U2-T):**

- **(a) Corrected and completed per-state reduction** (Lemmas 2′ and 3′ above), `proved_informal` and STATED, with literal
  confirmation at 11 instances including `d = 8`, `m = 2, 3` (`bounded_computation`, sanity only).
- **(b) A compiled bridge to the terminal's flow shape** over the definitions of record. `scratchpad/c1-crit-U2-T/own/LeanProject/LeanProof.lean`
  (SHA-256 `404980cd…0729`) is built from three byte-identical carried or copied blocks plus one new theorem:
  - C1-LA1 lines 1–382 (entries 1–21, `408d99e2…`);
  - C1-LA2 lines 797–956 (entries 30–31, `dc9c43ff…`, carried byte-identically; this is the first compile of entry 31 over the
    C1-LA1 freeze-repair-3 definitions);
  - U2's block (`ea5fce90…`);
  - the new theorem `E993Transport.exists_saturatingFlow_of_saturatingFlowQ`: nonnegative ℚ-flow with the same four hypotheses ⇒
    `∃ g, IsSaturatingFlow G F p g`.

  `lake build LeanProof` → `Build completed successfully (8656 jobs)`. `#print axioms` gives `[propext, Classical.choice, Quot.sound]`
  for both theorems, and there are no `sorry`s. As a scratch compile it has **no grade**.

## Remaining obligation

1. **An isolated second read** of the narrowed statement: class-only, hypotheses exactly as in the Verdict, and Lemmas 0, 1, 2′,
   3′ and 4 with the scaling step. Then a mathematical alias check of the candidate against the r30 row keys, and registration with
   the attribution in the fence section.
2. **Formal instantiation** over U1's `cbGraph m`. This is more than engineering.
   - (i) Lemma 0, the weight dichotomy.
   - (ii) The in-sector preimage bijection that gives `Σ_i In`.
   - (iii) The switch-image preimage count `d − γ`.
   - (iv) The Out sum, the scaling step, and the choke-state extraction.
   - (v) **The E1 flow itself.** Hypothesis (H1) is the content of E1-R, which is `proved_informal` only: the mark-clone
     type-path transport. A formal Tier 1 must either formalize E1-R or carry it as an explicit hypothesis; U2's "every fact it
     needs is proved informally" understates this.
   - (vi) Composing with `exists_saturatingFlow_of_saturatingFlowQ` (compiled above) to reach the §2 terminal shape.
3. **The actual missing content is unchanged.** (L-S)_top (a uniform allocation with Residual `θ(m) ≤ 1 − ρ_1(m)`), E1's condition
   (i) at `p*` for every `q` beyond the key's Darroch dependency, and (ELIG-top)(a). This route supplies only the glue.

## Artifact inventory

All under `/Users/ashtonsperry/VerityOS/experiments/erdos-993-cb-uniform-switch-dre-2026-09-27/scratchpad/c1-crit-U2-T/`:

| Path | SHA-256 | Role |
|---|---|---|
| `own/reduction_lab.py` | `adbf6cec9db6143e36274a142ea526ce7a79695ea2d01951896b1abff7c86b3e` | Own literal per-state reduction instrument. Replay: `cd own && python3 -B reduction_lab.py` (about 25 s) |
| `own/reduction_lab.out.txt` | `289eb6b6510799a86fcfa305786dd2318717f359eca35b5a94372d752c0ea3ff` | Output. Report digest `28abd5cbb0c8ab0ca067c6ac36e7c2892ef5ea5f29f14a64164b7ed44541f540`, ALL_PASS True |
| `own/LeanProject/LeanProof.lean` | `404980cdf8129d4b5161a1e198747a9ece4f0e22a96bdccba1677302d20e0729` | Carried C1-LA1 1–21 + C1-LA2 30–31 + U2 block + critic corollary. Replay: `cd own/LeanProject && lake build LeanProof && lake env lean AxiomCheck.lean` |
| `own/LeanProject/AxiomCheck.lean` | `a630a89f0fb2b2ff348335bc2883cabe39c6638c2f2de590f15ae0a302d6ecef` | `#print axioms` for both theorems |
| `replay/` (copies of U2's artifacts) | U2 digests as listed above | Copy-out-first replays. `replay/LeanProject` rebuilt. `compose_check.replay.out.txt` `7af5553e…2af8` (report `904a9474…`). `alias_check_frozen.py` `90732e2b…c3fa` (path-only edit to the frozen registry; report `a474b50c…`) |

Both `LeanProject/.lake/packages` directories are manual symlinks to the pinned shared Mathlib project. No background job was started,
and none remains.
